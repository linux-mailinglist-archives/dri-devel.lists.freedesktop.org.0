Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F456F3ED5
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 10:11:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D7610E4B2;
	Tue,  2 May 2023 08:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A2210E37C;
 Tue,  2 May 2023 08:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683015110; x=1714551110;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=rVDSdFm0AuwJWx3pV1DzdeCmkwNxPjvbHzQeGZmPo/w=;
 b=IR9PL5lmp/BLDPDEzIapz4S+BKtDRNouXr5KYVByXL0YogwqoJSkQfCK
 8i1/Ss7+1OCa6RbftBcRp+OVnUG1HEQftFY3YrEscXa16Bf8Yg3qG63On
 +uLu0Dj7UfuICpurDHUJV7HdlaSHsxl7bLdCy6+uemAoUSbbnHSbncx3R
 YqG0sAftwbF8rylnpoeDvu7UpYmn6LEUUWfwp1dnDRUAYqO0BnHGRFneY
 jpqFr2+46bfSBGdNUIhbH+peR4tZyKLPMHs0B0SEidiWi87BiuSuF/rfk
 +c5Pb41db3fYv0PAtz7uDRDGACUGYcstIDeXaHF6q9vmFFcYtBdTKX5x1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="411471874"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="411471874"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 01:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="1025965874"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="1025965874"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga005.fm.intel.com with ESMTP; 02 May 2023 01:11:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 01:11:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 01:11:48 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 01:11:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cds+D4llC6r1oSYKFUoBIw9lwBMCAc99+P23JRKrp+uNnto/7Tz6+gDV7GqpteKfFkWf2o/S12/79PjG6xaZKQRyeKybawBjQuyFaC9cALE0zqoB+gQc0jkuorPtujNj8fPUtbUQYQoOXcFsbPtnCreNMt4ZjUxz4aNC5iot/pybanLisqf7vQh+qGN3M4h1SuWHfGSkZ+OLma8GlUUAnvxPah4gOhtB2N0WHVCNO6FpejHQWdYIH2C6bltCZ536K1vmhuwxXh5fb6I+Jp4HrDJlNJqQcnseP50HtEPk0fHvWh4mLvyGQwx3ldpN9Lptq0sJ7ZKqLeBD/99V2sAZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0sRYGf+VEwgz4uPwb6Pp6vRikJonHVyEONdy7ObB48=;
 b=Zrx9tpodSs8j1soJ9Q8m2e6QEwrhiJi5XBRmzRO75NkfWSq/CGKRBN0/E0QoKnhx8JhHQPVFsRilV0+ETsFdSxgEt9iMlzMIUM/t4Kk9qrUBkQ4DBy3VE3CZ65SBAwP0o6wVtBh1Eaq2m5zeI/l/GXyO5BfgSnM7zupOCvYgS0mgz9J4aZck9L7+upLRaSq6jF5rhagl5EEPIK5bThbJHT1fD9RUeQypbgvwE8t/vOewFCgjS0nCVlhd/ASLjME9qlsQGoP6l/1Wr4vjQ88y52uf0byjk2ccbjal7JX69DtGZUpblZwVYYLjn6XJ/7XUzzQ6rQDGGrcFMeeXneSHrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6558.namprd11.prod.outlook.com (2603:10b6:806:26e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 08:11:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 08:11:46 +0000
Date: Tue, 2 May 2023 08:11:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH 00/14] Introduce xe_devcoredump.
Message-ID: <ZFDFtDvdqsnCn5H0@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY3PR05CA0044.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6558:EE_
X-MS-Office365-Filtering-Correlation-Id: 18a06f05-482f-4752-9d40-08db4ae4df7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /rJRyA1w0p9/zNYbuK+OCysHVNnybPNfGGa8Wpnin0W9+xsQdHIJR56vpijFTAptn0RPqyMQMHZr4zuTjdji4lwEZm0amL1rCnHYcrhT4gsH7T/lt7rgKDev20I1utwxoGGjRRflzy6IOoPHhEGiGRz/3i79KbWl5fWIo7MGXMOH6T2x3NEfZ4kjA9E4NMqxAF7BeAzdLdGIP2+cVaX0x/bDkiKuAGQPZLv8qFX4QwcvwlIUpGZ6waIAbg9FM39aXiSYhi8i594Q1E9s1yvlPXvPriEuB5VW+QpyyC7KXcp7xnpA+jjjyVULF4D2dDnLhjkGnZQNsi5mKdEdabhb1e84cIMKxsJSH5c/4xxfNabMvEPLhCdo0v4slRWcD+vv9MZv3AYXXtAvtzelzY9Jc9TvHyLbuiek5Ai7+p0UUroELCSXATkiuN7ovhhEd4AXSbZah5RJWqQdDz3u4TbhS2dNRw9HtaYU1j562Q8SP83OF0NClGWAqqltVUvLkNodrEV4lyjJ71x9/oQMDiT1TAbV6Cmb9bPpLgqLhOUlU9RzqahHG15QNIewQHd4IdKX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(39860400002)(346002)(376002)(366004)(396003)(451199021)(82960400001)(86362001)(38100700002)(44832011)(478600001)(2906002)(6666004)(186003)(6506007)(6512007)(26005)(83380400001)(41300700001)(66476007)(66556008)(316002)(5660300002)(8936002)(8676002)(6636002)(4326008)(66946007)(6862004)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jlnim9Ex+U4z2jZNBu7rBlJNd96Yi1Y7INIyzxuORQHf0rtkQHCDeeyqTr4L?=
 =?us-ascii?Q?J5ZnJbMuHp89zNKxCf29O+gH/PrGF5kXrqGhtaJbDuqTgYFgac03dTEYPmho?=
 =?us-ascii?Q?x/iqgja87j0iAyLCLZWbBeRotSUGgCYSozAiTmCieC97mV1URv/C0SjpquS0?=
 =?us-ascii?Q?qkTRk4OfyY/A88eNyTZQJiSSY2PKCKrRMrb3+A3EDBBBI0Z7/YwRFZmMMsQE?=
 =?us-ascii?Q?YNCrDWGos0HTR7gzEXeJ3pWh6Fn5gKL2Yvcf/cprr6HZmW7CXeyAjKfxfSpC?=
 =?us-ascii?Q?IvqqbFhYeYjQ4zSbax1gFkmMj0gLSJF8UQJCZl5XGyvaMGNoeUpZ1o9Hbgb1?=
 =?us-ascii?Q?9ZDja7Lil2KV1eDBVLXkAUOk4GSCE2qIiYMXiRtaxNAPOaCXp9V+U1scBTVI?=
 =?us-ascii?Q?RVPYC/b0bDrb+d+cXuRo/eP8Uz36YHQnD++V2wxH6pfkF/5AkyscTlFHc9Uh?=
 =?us-ascii?Q?uyJ92XIinl4ShpQ2CHQYrQ6IqkyLEst0OXZYrb0jW833mFLca3WE5xEXR28b?=
 =?us-ascii?Q?t10hmbQ/bZNqFXshGxwlkGILkgyf0mS+D/enZsWiQK/k8c1dZlwpnbRGX2tB?=
 =?us-ascii?Q?p0ZPMMIRXN+CEkYXg/vGEc5vxUePNWHiOipGOcd+elJAzHNiOahM9ogtOYi+?=
 =?us-ascii?Q?c9UWZ+lL8L9lzvsuV0OLv9RNzkIIz/bI21c3nTfIcHxxv3dJABNQRRzg13zA?=
 =?us-ascii?Q?zhSjzUDxmr4KX13GwOCRxbQA63goXTPLXOqUyvvHvZkEDZJSwZufeinFEPzO?=
 =?us-ascii?Q?ILY3eJ9y7tZH9bhcp2wqHrYlZ8PjAF7b5LsyJR/bDZsOgl+SnsYS6g3i0Rf1?=
 =?us-ascii?Q?/vNJIlDIlC+BK9q6K1F7YFZkeBvoDxeKko2V69q/yscksBTfW230aVmHfwNZ?=
 =?us-ascii?Q?H3ANncVyDq4dCcP/jWlv4efJTMG+0KxReP/2B+2iV1x3xmZDq/bpMHxLA/xh?=
 =?us-ascii?Q?98uhk1k51OlaKk54lfvSzfx+o5l6n6Yy/vuwT6qN8sctrethDnahfvrW684C?=
 =?us-ascii?Q?eqWQn7WHEUqpjtzNvOdfpha+Rrw4aqTFdmVRp21T5Ka0BKo+n/jLN5ucK53P?=
 =?us-ascii?Q?g4ZmWWD8PPiUkgzi4tz7bZJhMSuMsQ4nTNHgUAhoLFpuAAKoP5LwEKqUT2rC?=
 =?us-ascii?Q?+Ic9za1C6ij07HYz3vrZgKVEdiqVwbVsGazcuUbvgjFG2N+Ug1XZFQ9FfSoq?=
 =?us-ascii?Q?XZTDto9kcsAwnzc4xO3mwGu/v++UrRQxT/d620NKJsdrToL5Zh7GRfNCV1wW?=
 =?us-ascii?Q?3tXQE4UJDKrr78NFiePdO/lOKWDSqQ25QeidL7VzS50l55vxfWU11WnucdOD?=
 =?us-ascii?Q?cU0bnYBdMigL+sb6oVMcRo4vxAD7MRxZI8ZfTVgpM/tE6CDaogHNMSHyJYkx?=
 =?us-ascii?Q?QEw4HBMoN1mnakERtz8GNWHJR36P9M/VKMw1aKGURpwCGqrFhw+JDlsevbeF?=
 =?us-ascii?Q?GiCnSm2HV9PlD7/89V02LAnQ0cn2SMtmVYALMxugZm4WBH+sZuTf+bgUWg4q?=
 =?us-ascii?Q?SOxuNJJq+gS8DCXhgAhy1LustBU6VkWZDg6trdy6XdNbZdim9txOdVs4E0my?=
 =?us-ascii?Q?wkYS1CGOP2nFGVjqU0hZCOEaVWPepbJEx7jJ14XA4QUNsSpFZjyqKzefqq0J?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a06f05-482f-4752-9d40-08db4ae4df7d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 08:11:46.7447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zJ8smO/J1SsJ9zff8zRBg02bwecvcqpNQvyzYF6vtwfPQZUnrPHxER6VDvu7wsAWtzWi322WpncwZLfhI80W4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6558
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 04:56:59PM -0400, Rodrigo Vivi wrote:
> Xe needs to align with other drivers on the way that the error states are
> dumped, avoiding a Xe only error_state solution. The goal is to use devcoredump
> infrastructure to report error states, since it produces a standardized way
> by exposing a virtual and temporary /sys/class/devcoredump device.
> 
> The initial goal is to have the simple_error_state in the devcoredump
> so we start using the infrastructure.
> 
> But this is just a start point to start building a useful and
> organized crash dump, using standard infrastructure. Later this
> will be changed to have output that can be parsed by tools and
> used for error replay.

We are certainly missing the GuC log, it would also be really nice to
get the ftrace included too. Not sure if the later is easy, I know I
looked into this on the i915 and couldn't figure it out but this was a
while ago and admittedly didn't try all that hard.

Matt 

> 
> Later, when we are in-tree, the goal is to collaborate with devcoredump
> infrastructure with overall possible improvements, like multiple file support
> for better organization of the dumps, snapshot support, dmesg extra print,
> and whatever may make sense and help the overall infrastructure.
> 
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
> Rodrigo Vivi (14):
>   drm/xe: Fix print of RING_EXECLIST_SQ_CONTENTS_HI
>   drm/xe: Introduce the dev_coredump infrastructure.
>   drm/xe: Do not take any action if our device was removed.
>   drm/xe: Extract non mapped regions out of GuC CTB into its own struct.
>   drm/xe: Convert GuC CT print to snapshot capture and print.
>   drm/xe: Add GuC CT snapshot to xe_devcoredump.
>   drm/xe: Introduce guc_submit_types.h with relevant structs.
>   drm/xe: Convert GuC Engine print to snapshot capture and print.
>   drm/xe: Add GuC Submit Engine snapshot to xe_devcoredump.
>   drm/xe: Convert Xe HW Engine print to snapshot capture and print.
>   drm/xe: Add HW Engine snapshot to xe_devcoredump.
>   drm/xe: Limit CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE to itself.
>   drm/xe: Convert VM print to snapshot capture and print.
>   drm/xe: Add VM snapshot to xe_devcoredump.
> 
>  drivers/gpu/drm/xe/Kconfig                |   1 +
>  drivers/gpu/drm/xe/Makefile               |   1 +
>  drivers/gpu/drm/xe/regs/xe_engine_regs.h  |   3 +-
>  drivers/gpu/drm/xe/xe_devcoredump.c       | 227 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_devcoredump.h       |  22 ++
>  drivers/gpu/drm/xe/xe_devcoredump_types.h |  60 +++++
>  drivers/gpu/drm/xe/xe_device_types.h      |   4 +
>  drivers/gpu/drm/xe/xe_execlist.c          |   4 +-
>  drivers/gpu/drm/xe/xe_gt_debugfs.c        |   2 +-
>  drivers/gpu/drm/xe/xe_guc_ct.c            | 275 +++++++++++++++-------
>  drivers/gpu/drm/xe/xe_guc_ct.h            |   7 +-
>  drivers/gpu/drm/xe/xe_guc_ct_types.h      |  46 +++-
>  drivers/gpu/drm/xe/xe_guc_fwif.h          |  29 ---
>  drivers/gpu/drm/xe/xe_guc_submit.c        | 258 ++++++++++++++------
>  drivers/gpu/drm/xe/xe_guc_submit.h        |  10 +-
>  drivers/gpu/drm/xe/xe_guc_submit_types.h  | 155 ++++++++++++
>  drivers/gpu/drm/xe/xe_hw_engine.c         | 210 ++++++++++++-----
>  drivers/gpu/drm/xe/xe_hw_engine.h         |   8 +-
>  drivers/gpu/drm/xe/xe_hw_engine_types.h   |  78 ++++++
>  drivers/gpu/drm/xe/xe_pci.c               |   2 +
>  drivers/gpu/drm/xe/xe_vm.c                | 140 +++++++++--
>  drivers/gpu/drm/xe/xe_vm.h                |   6 +-
>  drivers/gpu/drm/xe/xe_vm_types.h          |  18 ++
>  23 files changed, 1288 insertions(+), 278 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
>  create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_submit_types.h
> 
> --
> 2.39.2
