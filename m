Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0799EC6B12C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 18:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C63710E1B0;
	Tue, 18 Nov 2025 17:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igqCZ3Nt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6170010E1B0;
 Tue, 18 Nov 2025 17:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763488778; x=1795024778;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3Z2KACS0+8TgfCJZ9y/4ljUI061Cu0VCv6HtITM1uTo=;
 b=igqCZ3NtL8CrD4pZbJjSSaezsVw9HNmRD1nSgU+7Xksbg97nkRj0nwVi
 MQkOL2iMfVn//+oF6qD5F3edws7oMFIs/fdGjJgJuyPsmZZJbyED9y5lO
 nwJnppsUJZfzeX6mftQ73cFFz1PKQffBS6V+98fX9QCFLyGy/KiXKLC+1
 LTD5oU71FHE3v36U76/lQjwzYXRKwYNZbt1+b5E81kN2hN4J3aLdeeJzz
 O8pdIl+dFcFEQkzsTDhDKEsH06E0emEhO4XyFUs2rtFt9TjRAZt26cUll
 twFSn/Y08yTfGIDsvQxPTVxa8QSfVqSYlxcZ6VXQ8kLWrWk4LLb8VHrfI g==;
X-CSE-ConnectionGUID: XRO+EOSeTS+LBp5lgrjmFQ==
X-CSE-MsgGUID: npil29DQT56gShIknz/BpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="65610315"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="65610315"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:59:38 -0800
X-CSE-ConnectionGUID: 7rycC+LJRcabAggHHCqghw==
X-CSE-MsgGUID: UlunkHptSD+s4XBRx9MjGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="191602299"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 09:59:38 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:59:37 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 09:59:37 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.11) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 09:59:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sd+2ceREnj4Fdow3LfZNu3VWntlG9HWABQfAuwrUaALfUbZxLt5i0p70niZyIGeQsn6hOz7vIk7GcX9fNuYoN8kkPJi6qxBEH3eKyfNx3TpeZTLqtkTdY2d1CP9v+9H1k7FMRFkXDoSodG1lfcw5QtYmS2BMdgiFNuA1wpChl8wJDimZ5Tb7PHcnPs+1/fqUnKdabF1oAjK/5RV421e7/oWvKLz8dXvAZNszhdezVNGdyzpVfH5iPV7p+L9/4TGeVAldxhYX9yOQ1F6GhlMsPYG+/lapBu0ORTYQLSAfR4ee73AdMoCb7HstxyRtYnULojQ4MZmu8CM1gzulCIo/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1ODzdCe6EhdPQXfSpfm2QlLYuumW1bzDVAGVGVE7mc=;
 b=bPZ9W755EELUVxAMeXefZbPnvbdWecrUWTqvvDjcBowfUVL6nHVGtEoLFAYElg3gvR0nQ/FpBktoWuCzvspzJ3CUW/GIQNyhO70Sirxo4ZcmMH+5ZT9u8wDjuIq5K0PlCdeEpgNHca6bxxcZHXYtGIMxNnKU9fQwoKohU8q4XcUSaMgN8wbiUF9mKXBE8NpuPntdlTThaDb8yBAhIirVQqS0ruUSbb27mT10LAkYB83KrBRI32hHUWqcbVMCfVE2LNOYDnhivyUd+lPN7Us1Ce8qbDtSKpAJSJFj3oUqQ2PEDNNJ+Lw57ZzBtX4yMuEzH8i8crHTKYW+7PXE/KsfvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS4PPF6EA6DD735.namprd11.prod.outlook.com (2603:10b6:f:fc02::2d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 17:59:35 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 17:59:35 +0000
Date: Tue, 18 Nov 2025 09:59:32 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <christian.koenig@amd.com>, <pstanner@redhat.com>, <dakr@kernel.org>
Subject: Re: [PATCH v3 4/7] drm/xe: Stop abusing DRM scheduler internals
Message-ID: <aRy0BEOpxjFjJvbC@lstrano-desk.jf.intel.com>
References: <20251016204826.284077-1-matthew.brost@intel.com>
 <20251016204826.284077-5-matthew.brost@intel.com>
 <aRwUrtpXAHi547AS@nvishwa1-desk>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <aRwUrtpXAHi547AS@nvishwa1-desk>
X-ClientProxiedBy: MW4PR03CA0209.namprd03.prod.outlook.com
 (2603:10b6:303:b8::34) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS4PPF6EA6DD735:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d3f290-4837-4c5f-376d-08de26cc3bc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ydWySjKrvhUpASZ5Nw5aQhIPMAczca06jcASKzbbtBQwqm+Oc/MgjPn1ch3l?=
 =?us-ascii?Q?yd0D1bSfzi+9yN+sGF+OH66OihOemm8C1qsjCQcLyUlHxd5/S5jFP01IA9Sp?=
 =?us-ascii?Q?TaJZR72mR0xYgjxtdzU+dLkioTkJMkjc+0wIBJ0dkuTSvUxlA3LkqJIZaikS?=
 =?us-ascii?Q?E/4GlBdU/vf53Hzh+AznPFBExw8lTImN6gmy/hCb9YtziSegqNKMFcRYuQiB?=
 =?us-ascii?Q?HeTLJ7MrY1VMEG9y0a/0ER0wx5x3LoC2i8HVSxPZqwuSnkD1w82L6TN3IewO?=
 =?us-ascii?Q?4mb4n3f7TtLsgJyEWwdY3ZQ0NzbUpccOngU5BxBmM4m6Se499V8QQBk0n764?=
 =?us-ascii?Q?dCM9r6ymZLxMgZLV9UPY3kbSPcNaFuD1vwvn4HIoI8xeHmLVixntCFHynlJF?=
 =?us-ascii?Q?+VPYt8WlXXd1KBahqbUcv8vW32Hok19T1pqPgfYRKMRiBUFvVCtgnzXrkeRS?=
 =?us-ascii?Q?JAl63XdXjmbT0nH5VzMpDk8wPAtKcQ0cZzdCZQSK6gZJhEuo5yLfXVkdFrFa?=
 =?us-ascii?Q?uaymwBogJ4fGUuriA+e4Ah6Bj2EUkvMEqdv+1+oLY2Hht4qb8zfaDUKcGprY?=
 =?us-ascii?Q?aczRSq/Uh//USwTKQ6WYtkZXPzs9JLTCCfSghtuwFjC3gnrxed4Z1KFU/9Vl?=
 =?us-ascii?Q?UCV+1H+O8LVnnYTptldTemlAHOegne5kKbqse7R/JDPSAnEEN74wOpRwbgVS?=
 =?us-ascii?Q?XnN/AYuv1dYNz0lTfMxtu55IoJL3Z/u+RCEMdt0buH9EfEU47j9ddmkmeV6n?=
 =?us-ascii?Q?Zsc9ucehwiUeUInW+1XpqltXMuFEZOpZzxQUPYjC/DUNrfiTtIZaagWXmNfl?=
 =?us-ascii?Q?dh7DlEEVkXlMb2KEPm1jun8gxExYA7givZF/99UX9/3Ur+YlSJYTM2lOl0LH?=
 =?us-ascii?Q?7Bdq+gUSTKtrDDH7A0sMStY6/Xl1Qj53GHPCjo+n5CCQ1wJ3IBnuszIB9GSJ?=
 =?us-ascii?Q?3OiWswLWYlh60O/a0A1uw5jvaQAT06bEawMoB0RYOaGkicwucmrPs25/WC/5?=
 =?us-ascii?Q?krGa+CBU+txSlMK+Lv84ZoAq/J0wKNpVId3obnkyqv6UR0s1NzXh6/X0TVWY?=
 =?us-ascii?Q?Y7mTZWGg1uzYCGUDuZ3b0KUfUGRNRbW+XIpNmdfgzHBJUIKNCb3weMBalFvk?=
 =?us-ascii?Q?uStaGQFKwP0iGzIO2gm5QkEaTz7R7qtGYbA4uWRJi6kukbz9EHOaJg4yIwMv?=
 =?us-ascii?Q?GGLMw8h6Y9QpndE95snrEhcuRN3SYFrliPKanPyCFFuSxuWE1oy93UwITgzk?=
 =?us-ascii?Q?5NU5GaD2MYrNL8fK3uhabd45TWExkJ+FK6QVDGK23Qw3E0fzQa+0owqVBO9U?=
 =?us-ascii?Q?zjptwfiQ9TpBeV3U8p1+1PoS/pZCdkBnx8C+lT9WC3XiB6rZUX8CQzHiKVEs?=
 =?us-ascii?Q?HdGysuN+0eWRy7W4UVhetrwlhavrNQ0BQAVsn4nKp42Ff9LKTY03ZcWguHCW?=
 =?us-ascii?Q?lkIjgzNRR97PTY03eZPVeOe1x1f9wpv+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v4urHzuQWVyE2cqyfQ4kTcfVAWuGcWap2Us8t/EFYfp3FoBkkdwmLOMlDcvN?=
 =?us-ascii?Q?ge6FJ69XwBJa5Bg4M2QNi8YPdDU4soDIe7TWECjpLEEUEyy7PlEKzoqZW6Gy?=
 =?us-ascii?Q?55l8WF6B8my2rpRjbBY5WuNqvSzfpWXQmQb/tdZ+ehW6XBvvvZs7blsqScyf?=
 =?us-ascii?Q?jYkdJfD2mPFurG4qUpBT5Ruo/x/JTM4zbmxopA344gAuT+BIKNbemH5Vi+tF?=
 =?us-ascii?Q?7j0mOLX+/r/wRVZVNIPbs+aOIv6vU+OoD3xb8RfoaRFrbBtVAuYWjwN5GsLO?=
 =?us-ascii?Q?7uylpKoImB8SWqVTpkXzF8M7qCZPrpq/RV5WKfeUJOBpeER6V1ysVpyjf0nA?=
 =?us-ascii?Q?JtAIOwHHTHRhOeEUhPVz0vp3o8+74Dxez1yosFSRdfuwdWx6ckXqPhNkDcN/?=
 =?us-ascii?Q?hgt2w4zJqn4AMABV+3m66VGR574uPcJOjYirswX9hlcJ4ttkMj9XI0iX5+gA?=
 =?us-ascii?Q?Rq+eKYh6nf9fEGwqL1fuI2djJJNXzXnwf+SMdYaj7ohHUwDAYnHwYd+YS1F/?=
 =?us-ascii?Q?w/hr2z9oABWJRgo72+nwQcpLxx14NQtkF2xxM7ab4IrJsqvbFyBiGWBwRJF7?=
 =?us-ascii?Q?hdtq6iGNCse6n+TNOYZtz5dfaQqhOLhPRDDXK+PeP/MRUfeEz0Hq2sGx3bE0?=
 =?us-ascii?Q?sV+c66VAXsysQdTDPyVQYJ8z/qUdMSBoA+A0TwxlalLTbvs8Zy9l9rqlrzLJ?=
 =?us-ascii?Q?saaEQukom1vyVyAfi+lIxHVqTNR6WQ7wugWydRyuFKHtOYVfwD3lMxveWX/n?=
 =?us-ascii?Q?Mh10N/HkNhtImQz+w+Du0oUWq2PX+OrFEupa76Z1R+pp1sf18ZRE2MpfNqs7?=
 =?us-ascii?Q?6LX5+9L0oMp0bW+OYYM7Bw58DiQlx1sZzCfz/33mbDXWNL+3CwY5ZzqrZaoe?=
 =?us-ascii?Q?XwqtaYcZggDlM6pC0RYgbegO1tXIiW8ynn9dZhwmhxW2eEi46UW07eRtPRlC?=
 =?us-ascii?Q?T5tLZCR9u7LGsQLSxiHFpe1ov40+wc1PfZ+sXJXlbK6+fY+0RGTRIMjBmewg?=
 =?us-ascii?Q?9CfNHJi+XgLhi7Klk7Z+/c9XxKALqHUvXaGmiK7JlNyP6M6bhh9ID4aXLs+H?=
 =?us-ascii?Q?g8zXPgLolmtCwodo99SSRwUkmgOjC3x9zZfsk+1I+0BRKM9sT5f0P/5YS2Bb?=
 =?us-ascii?Q?H6VtTlix7KRXLGqYGEvcv910zu/42G9jIQ1J162ngEUjsU5fxjBRt+oERfcW?=
 =?us-ascii?Q?zDeRVY3BYpYJBzDI8A0DX0KYj3YUTQ69yxFOc2UsskCqOAEHSc1V5Uzbi5T6?=
 =?us-ascii?Q?SPsL0ig122bZB2x0fYm0HhgakUwjp75HMn5EAZfu74ZDjb1rnB5TJzhL7yIw?=
 =?us-ascii?Q?rtlBAEYIWdEpUN3uTuh3qfN9xY6WnTYcnGd3nmMjsUoXlJc3Rm7ZtOCWL/aF?=
 =?us-ascii?Q?i6xWHhpsfN10n4QvvPH9AQypQPhoeVl5UxAlnqyXRqFaTyOtK0MVj5Zr/X7x?=
 =?us-ascii?Q?uU4FldyT6a46W92r8JeFTVniqVmrI2Edc0ejkxNZ4ZvqJV3u0eba5yIMZqly?=
 =?us-ascii?Q?BybDYp3VwyM2kRIeoOkrCt0Y8mwmAfsJMIZCdQLXYK9PxO6skkkVNZicD6qw?=
 =?us-ascii?Q?3uFM3gWV/1OXdVS9ndl/7CkIBON6ovLoBKD9KiTjOgf/Z/y1T8tuV6aRDMlZ?=
 =?us-ascii?Q?uQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d3f290-4837-4c5f-376d-08de26cc3bc7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2025 17:59:35.2851 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lstHiWsKYuRVelgQtZGtvb6AyQQv+VdyHvgYgA7lQuBdYw3KNejeXJl6nSG4JrMQ7wUn3eeGcVsHze5DkoVQkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6EA6DD735
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 17, 2025 at 10:39:42PM -0800, Niranjana Vishwanathapura wrote:
> On Thu, Oct 16, 2025 at 01:48:23PM -0700, Matthew Brost wrote:
> > Use new pending job list iterator and new helper functions in Xe to
> > avoid reaching into DRM scheduler internals.
> > 
> > Part of this change involves removing pending jobs debug information
> > from debugfs and devcoredump. As agreed, the pending job list should
> > only be accessed when the scheduler is stopped. However, it's not
> > straightforward to determine whether the scheduler is stopped from the
> > shared debugfs/devcoredump code path. Additionally, the pending job list
> > provides little useful information, as pending jobs can be inferred from
> > seqnos and ring head/tail positions. Therefore, this debug information
> > is being removed.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_gpu_scheduler.c    |  4 +-
> > drivers/gpu/drm/xe/xe_gpu_scheduler.h    | 34 +++--------
> > drivers/gpu/drm/xe/xe_guc_submit.c       | 74 ++++--------------------
> > drivers/gpu/drm/xe/xe_guc_submit_types.h | 11 ----
> > drivers/gpu/drm/xe/xe_hw_fence.c         | 16 -----
> > drivers/gpu/drm/xe/xe_hw_fence.h         |  2 -
> > 6 files changed, 20 insertions(+), 121 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index f4f23317191f..9c8004d5dd91 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > @@ -7,7 +7,7 @@
> > 
> > static void xe_sched_process_msg_queue(struct xe_gpu_scheduler *sched)
> > {
> > -	if (!READ_ONCE(sched->base.pause_submit))
> > +	if (!drm_sched_is_stopped(&sched->base))
> > 		queue_work(sched->base.submit_wq, &sched->work_process_msg);
> > }
> > 
> > @@ -43,7 +43,7 @@ static void xe_sched_process_msg_work(struct work_struct *w)
> > 		container_of(w, struct xe_gpu_scheduler, work_process_msg);
> > 	struct xe_sched_msg *msg;
> > 
> > -	if (READ_ONCE(sched->base.pause_submit))
> > +	if (drm_sched_is_stopped(&sched->base))
> > 		return;
> > 
> > 	msg = xe_sched_get_msg(sched);
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.h b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > index b971b6b69419..583372a78140 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.h
> > @@ -55,14 +55,10 @@ static inline void xe_sched_resubmit_jobs(struct xe_gpu_scheduler *sched)
> > {
> > 	struct drm_sched_job *s_job;
> > 
> > -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> > -		struct drm_sched_fence *s_fence = s_job->s_fence;
> > -		struct dma_fence *hw_fence = s_fence->parent;
> > -
> > +	drm_sched_for_each_pending_job(s_job, &sched->base, NULL)
> > 		if (to_xe_sched_job(s_job)->skip_emit ||
> > -		    (hw_fence && !dma_fence_is_signaled(hw_fence)))
> > +		    !drm_sched_job_is_signaled(s_job))
> > 			sched->base.ops->run_job(s_job);
> > -	}
> > }
> > 
> > static inline bool
> > @@ -71,14 +67,6 @@ xe_sched_invalidate_job(struct xe_sched_job *job, int threshold)
> > 	return drm_sched_invalidate_job(&job->drm, threshold);
> > }
> > 
> > -static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
> > -					    struct xe_sched_job *job)
> > -{
> > -	spin_lock(&sched->base.job_list_lock);
> > -	list_add(&job->drm.list, &sched->base.pending_list);
> > -	spin_unlock(&sched->base.job_list_lock);
> > -}
> > -
> > /**
> >  * xe_sched_first_pending_job() - Find first pending job which is unsignaled
> >  * @sched: Xe GPU scheduler
> > @@ -88,21 +76,13 @@ static inline void xe_sched_add_pending_job(struct xe_gpu_scheduler *sched,
> > static inline
> > struct xe_sched_job *xe_sched_first_pending_job(struct xe_gpu_scheduler *sched)
> > {
> > -	struct xe_sched_job *job, *r_job = NULL;
> > -
> > -	spin_lock(&sched->base.job_list_lock);
> > -	list_for_each_entry(job, &sched->base.pending_list, drm.list) {
> > -		struct drm_sched_fence *s_fence = job->drm.s_fence;
> > -		struct dma_fence *hw_fence = s_fence->parent;
> > +	struct drm_sched_job *job;
> > 
> > -		if (hw_fence && !dma_fence_is_signaled(hw_fence)) {
> > -			r_job = job;
> > -			break;
> > -		}
> > -	}
> > -	spin_unlock(&sched->base.job_list_lock);
> > +	drm_sched_for_each_pending_job(job, &sched->base, NULL)
> > +		if (!drm_sched_job_is_signaled(job))
> > +			return to_xe_sched_job(job);
> > 
> > -	return r_job;
> > +	return NULL;
> > }
> > 
> > static inline int
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 0ef67d3523a7..680696efc434 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1032,7 +1032,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > 	struct xe_exec_queue *q = ge->q;
> > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > 	struct xe_gpu_scheduler *sched = &ge->sched;
> > -	struct xe_sched_job *job;
> > +	struct drm_sched_job *job;
> > 	bool wedged = false;
> > 
> > 	xe_gt_assert(guc_to_gt(guc), xe_exec_queue_is_lr(q));
> > @@ -1091,16 +1091,10 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
> > 	if (!exec_queue_killed(q) && !xe_lrc_ring_is_idle(q->lrc[0]))
> > 		xe_devcoredump(q, NULL, "LR job cleanup, guc_id=%d", q->guc->id);
> > 
> > -	xe_hw_fence_irq_stop(q->fence_irq);
> > +	drm_sched_for_each_pending_job(job, &sched->base, NULL)
> > +		xe_sched_job_set_error(to_xe_sched_job(job), -ECANCELED);
> > 
> > 	xe_sched_submission_start(sched);
> > -
> > -	spin_lock(&sched->base.job_list_lock);
> > -	list_for_each_entry(job, &sched->base.pending_list, drm.list)
> > -		xe_sched_job_set_error(job, -ECANCELED);
> > -	spin_unlock(&sched->base.job_list_lock);
> > -
> > -	xe_hw_fence_irq_start(q->fence_irq);
> > }
> > 
> > #define ADJUST_FIVE_PERCENT(__t)	mul_u64_u32_div(__t, 105, 100)
> > @@ -1219,7 +1213,7 @@ static enum drm_gpu_sched_stat
> > guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > {
> > 	struct xe_sched_job *job = to_xe_sched_job(drm_job);
> > -	struct xe_sched_job *tmp_job;
> > +	struct drm_sched_job *tmp_job;
> > 	struct xe_exec_queue *q = job->q;
> > 	struct xe_gpu_scheduler *sched = &q->guc->sched;
> > 	struct xe_guc *guc = exec_queue_to_guc(q);
> > @@ -1228,7 +1222,6 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 	unsigned int fw_ref;
> > 	int err = -ETIME;
> > 	pid_t pid = -1;
> > -	int i = 0;
> > 	bool wedged = false, skip_timeout_check;
> > 
> > 	xe_gt_assert(guc_to_gt(guc), !xe_exec_queue_is_lr(q));
> > @@ -1395,28 +1388,15 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
> > 		__deregister_exec_queue(guc, q);
> > 	}
> > 
> > -	/* Stop fence signaling */
> > -	xe_hw_fence_irq_stop(q->fence_irq);
> > +	/* Mark all outstanding jobs as bad, thus completing them */
> > +	xe_sched_job_set_error(job, err);
> 
> This setting error for this timed out job is newly added.
> Why was it not there before and being added now?
> 

Because the TDR job was added back into the pending list first, so in
fact we did set the error on the job. 

> > +	drm_sched_for_each_pending_job(tmp_job, &sched->base, NULL)
> > +		xe_sched_job_set_error(to_xe_sched_job(tmp_job), -ECANCELED);
> > 
> > -	/*
> > -	 * Fence state now stable, stop / start scheduler which cleans up any
> > -	 * fences that are complete
> > -	 */
> > -	xe_sched_add_pending_job(sched, job);
> 
> Why xe_sched_add_pending_job() was there before?
> 

We (DRM scheduler maintainers agreed drivers shouldn't touch the pending
list), below returning DRM_GPU_SCHED_STAT_NO_HANG defers this step to
the DRM scheduler core.

> > 	xe_sched_submission_start(sched);
> > -
> > 	xe_guc_exec_queue_trigger_cleanup(q);
> 
> Why do we need to trigger cleanup again here?
> 

This is existing code and it should only be called once in this
function. At this point in time, we don't know if the TDR fired
naturally with a normal timeout value or if we are already in process of
cleaning up. If it is the former, then we switch to cleanup immediately
mode which is why this call is needed.

> > 
> > -	/* Mark all outstanding jobs as bad, thus completing them */
> > -	spin_lock(&sched->base.job_list_lock);
> > -	list_for_each_entry(tmp_job, &sched->base.pending_list, drm.list)
> > -		xe_sched_job_set_error(tmp_job, !i++ ? err : -ECANCELED);
> > -	spin_unlock(&sched->base.job_list_lock);
> > -
> > -	/* Start fence signaling */
> > -	xe_hw_fence_irq_start(q->fence_irq);
> > -
> > -	return DRM_GPU_SCHED_STAT_RESET;
> > +	return DRM_GPU_SCHED_STAT_NO_HANG;
> 
> This is error case. So, why return is changed to NO_HANG?
> 

See above, this how we can delete xe_sched_add_pending_job.

> Niranjana
> 
> > 
> > sched_enable:
> > 	set_exec_queue_pending_tdr_exit(q);
> > @@ -2244,7 +2224,7 @@ static void guc_exec_queue_unpause_prepare(struct xe_guc *guc,
> > 	struct drm_sched_job *s_job;
> > 	struct xe_sched_job *job = NULL;
> > 
> > -	list_for_each_entry(s_job, &sched->base.pending_list, list) {
> > +	drm_sched_for_each_pending_job(s_job, &sched->base, NULL) {
> > 		job = to_xe_sched_job(s_job);
> > 
> > 		xe_gt_dbg(guc_to_gt(guc), "Replay JOB - guc_id=%d, seqno=%d",
> > @@ -2349,7 +2329,7 @@ void xe_guc_submit_unpause(struct xe_guc *guc)
> > 		 * created after resfix done.
> > 		 */
> > 		if (q->guc->id != index ||
> > -		    !READ_ONCE(q->guc->sched.base.pause_submit))
> > +		    !drm_sched_is_stopped(&q->guc->sched.base))
> > 			continue;
> > 
> > 		guc_exec_queue_unpause(guc, q);
> > @@ -2771,30 +2751,6 @@ xe_guc_exec_queue_snapshot_capture(struct xe_exec_queue *q)
> > 	if (snapshot->parallel_execution)
> > 		guc_exec_queue_wq_snapshot_capture(q, snapshot);
> > 
> > -	spin_lock(&sched->base.job_list_lock);
> > -	snapshot->pending_list_size = list_count_nodes(&sched->base.pending_list);
> > -	snapshot->pending_list = kmalloc_array(snapshot->pending_list_size,
> > -					       sizeof(struct pending_list_snapshot),
> > -					       GFP_ATOMIC);
> > -
> > -	if (snapshot->pending_list) {
> > -		struct xe_sched_job *job_iter;
> > -
> > -		i = 0;
> > -		list_for_each_entry(job_iter, &sched->base.pending_list, drm.list) {
> > -			snapshot->pending_list[i].seqno =
> > -				xe_sched_job_seqno(job_iter);
> > -			snapshot->pending_list[i].fence =
> > -				dma_fence_is_signaled(job_iter->fence) ? 1 : 0;
> > -			snapshot->pending_list[i].finished =
> > -				dma_fence_is_signaled(&job_iter->drm.s_fence->finished)
> > -				? 1 : 0;
> > -			i++;
> > -		}
> > -	}
> > -
> > -	spin_unlock(&sched->base.job_list_lock);
> > -
> > 	return snapshot;
> > }
> > 
> > @@ -2852,13 +2808,6 @@ xe_guc_exec_queue_snapshot_print(struct xe_guc_submit_exec_queue_snapshot *snaps
> > 
> > 	if (snapshot->parallel_execution)
> > 		guc_exec_queue_wq_snapshot_print(snapshot, p);
> > -
> > -	for (i = 0; snapshot->pending_list && i < snapshot->pending_list_size;
> > -	     i++)
> > -		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
> > -			   snapshot->pending_list[i].seqno,
> > -			   snapshot->pending_list[i].fence,
> > -			   snapshot->pending_list[i].finished);
> > }
> > 
> > /**
> > @@ -2881,7 +2830,6 @@ void xe_guc_exec_queue_snapshot_free(struct xe_guc_submit_exec_queue_snapshot *s
> > 			xe_lrc_snapshot_free(snapshot->lrc[i]);
> > 		kfree(snapshot->lrc);
> > 	}
> > -	kfree(snapshot->pending_list);
> > 	kfree(snapshot);
> > }
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > index dc7456c34583..0b08c79cf3b9 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> > @@ -61,12 +61,6 @@ struct guc_submit_parallel_scratch {
> > 	u32 wq[WQ_SIZE / sizeof(u32)];
> > };
> > 
> > -struct pending_list_snapshot {
> > -	u32 seqno;
> > -	bool fence;
> > -	bool finished;
> > -};
> > -
> > /**
> >  * struct xe_guc_submit_exec_queue_snapshot - Snapshot for devcoredump
> >  */
> > @@ -134,11 +128,6 @@ struct xe_guc_submit_exec_queue_snapshot {
> > 		/** @wq: Workqueue Items */
> > 		u32 wq[WQ_SIZE / sizeof(u32)];
> > 	} parallel;
> > -
> > -	/** @pending_list_size: Size of the pending list snapshot array */
> > -	int pending_list_size;
> > -	/** @pending_list: snapshot of the pending list info */
> > -	struct pending_list_snapshot *pending_list;
> > };
> > 
> > #endif
> > diff --git a/drivers/gpu/drm/xe/xe_hw_fence.c b/drivers/gpu/drm/xe/xe_hw_fence.c
> > index b2a0c46dfcd4..e65dfcdfdbc5 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_fence.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_fence.c
> > @@ -110,22 +110,6 @@ void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq)
> > 	irq_work_queue(&irq->work);
> > }
> > 
> > -void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq)
> > -{
> > -	spin_lock_irq(&irq->lock);
> > -	irq->enabled = false;
> > -	spin_unlock_irq(&irq->lock);
> > -}
> > -
> > -void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq)
> > -{
> > -	spin_lock_irq(&irq->lock);
> > -	irq->enabled = true;
> > -	spin_unlock_irq(&irq->lock);
> > -
> > -	irq_work_queue(&irq->work);
> > -}
> > -
> > void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
> > 			  struct xe_hw_fence_irq *irq, const char *name)
> > {
> > diff --git a/drivers/gpu/drm/xe/xe_hw_fence.h b/drivers/gpu/drm/xe/xe_hw_fence.h
> > index f13a1c4982c7..599492c13f80 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_fence.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_fence.h
> > @@ -17,8 +17,6 @@ void xe_hw_fence_module_exit(void);
> > void xe_hw_fence_irq_init(struct xe_hw_fence_irq *irq);
> > void xe_hw_fence_irq_finish(struct xe_hw_fence_irq *irq);
> > void xe_hw_fence_irq_run(struct xe_hw_fence_irq *irq);
> > -void xe_hw_fence_irq_stop(struct xe_hw_fence_irq *irq);
> > -void xe_hw_fence_irq_start(struct xe_hw_fence_irq *irq);
> > 
> > void xe_hw_fence_ctx_init(struct xe_hw_fence_ctx *ctx, struct xe_gt *gt,
> > 			  struct xe_hw_fence_irq *irq, const char *name);
> > -- 
> > 2.34.1
> > 
