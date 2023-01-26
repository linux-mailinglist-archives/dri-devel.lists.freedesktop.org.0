Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1093F67D48C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 19:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C927710E97B;
	Thu, 26 Jan 2023 18:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7BC910E96F;
 Thu, 26 Jan 2023 18:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674758681; x=1706294681;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=xhBiwf0ApMj39gP5PpK6Nl+sSS5jQWp8hccWWUyanaU=;
 b=ENoKQLROMy7Nxpl2OlVwHKaB1YQKkwxYCDK1uZ9YVM8PGXrS5dIFcL9G
 RujKWajHDxCEp4X1qrRLuK/UDngwEZUi0FIhNR4aqodEG46iduC8xgyDy
 9A6ZZ0osfXe5bP+LOSWS4PO98oZ/4+LlrCz2nHMw/W43wvGFOnNP7AjPS
 p08o++D3bqzlb2Qg64HYDT0JY6e8062bccVBdiA5R3w+0hc5XAkf93xU7
 M9G3I5azMf3YF0YdMOAHfYvSwif7AfJotZFcibiGVYeThhLrzbp6PNGTT
 0WPbhcdbtRAx+VNBt5K5ccONTvJpCEdwYnuhfF0j8lF/UebU6T+wqAgBl g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="391434601"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="391434601"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 10:44:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805469646"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="805469646"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2023 10:44:40 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 10:44:40 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 10:44:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 10:44:39 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 10:44:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mQigOBcs3nRjCQ/yqB8A0OuORM38v/B+xc61F0IoW8kZnyafara6RdKegD9vt64I/gDnvGCOO8+bYUy1kzUrDp0eNM/feoReXZ79dxplJLcU2Y8W9Wd4hT8BrmEcSgrLVncOgGygA3I3HYPks0P3sD5SU6OofFxaVDyhgucxyO0rsZUOnTJ9AOpoUs1GsTpBk8LhZRFcGzxekVKS213JcVg5vYxtbPSfsvL3ISQycUP30hIGhaDpaMflzQ4i65E8bVBYwmeFXvpPtwIq5vjmlNeXDZqFIVXD+LdU80cqW3ow59bv4n2aFZBLJldADGdZx8PkdKUso3vr/TnzXNkJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vcZ4knePk66UoZXWRM49vMAzfFmuvkKa9YTgoyXzoZs=;
 b=odEQ+UyXnFzYEtG9Th2VTfmn8BEhGviLiEutO8caC8fY0PRCpRxqWN6gFXPuN9y/biZIz+hql2sQhJ6sBFXSC7c8LFqfr8OA297iyh7JJJLNxxJ6nglrhMH/bJyS9qpGwz0FJ09hLM5tPBFk//M7dCzG4dnfJQh7FcCPQ36el9KvwY6xcYN2RuQwiEzT9asQ/qeqX3h0JzxSkVlkAZ7OD0XHmCXaKCKMfHqJQGg2yMWR8AOQB2GERsMIbzlviw0qOkgMXj0n+zsAsQf9Qa7GGmpkZXiUF4hdbgRjbkMHz2VjM+fGXSpqkVxHEX94FR9zU79MGb1QBgeVQetYBXv2uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB5092.namprd11.prod.outlook.com (2603:10b6:303:6e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:44:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 18:44:37 +0000
Date: Thu, 26 Jan 2023 13:44:31 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y9LKD2J5bmICTyIP@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BYAPR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB5092:EE_
X-MS-Office365-Filtering-Correlation-Id: ac4ae26d-47cd-466a-7bc6-08daffcd5ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QD7MqlqcjcB2uvOx5uSgmOARFKosp/NGbg7PbCUa+nBc0fmger6zAXjK7ZP+8CYgmQZM/t/U3jMi3UivrW409RZPB9HxILDOwDDp07DM6jjOgnRub477PyPxb8roImIwLzSrm2HLFHB/DM5TxA3o5gifzUb1Vl43PgqSD/eUEtmajV4CnlDdEr2T+yBSJ9zGSB7jwwCeinj6b+qW7FXD+SQH9jX1FABdAfh2t5Ch0qKZROo5fIeCOI9MhnAMFfg/hN++aoR3nLztCb+H1PWLsDvXHCEQe0tdPojTNUsi/mTYD+7PiAXbljLDY4mQh152ygGEnBoNXCA+6lcbRBpkq3VG1M6JwKRYeE73aYtRUnLVRZ3OtmIXIq5GZIoV4uZ21NgP8gGvvumuT6cZD62rhyYLRMqgYS267lj/i3wTkFbsg+A5N31xs8u092Ylz/sHYK3sK9+ttQj5NQon8cifz+HU46akFbZnn74VvtG71BJ741JXmIzujYbpooy5jURcHJkb85TDUUZMAjb9gkCC2G1nZOFLaNLZcFNcy7dIUR8RtHwgSfbLQd5+wkX6yLF61aZMXP/uGSQCwSOtrQ21es2tthZT3baU2nPgMpYlK8CSWN7Y+74L7gMho7wTHnjjWie1t4rSFx0+lzYqNEZHkw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(396003)(39860400002)(366004)(346002)(451199018)(41300700001)(8936002)(26005)(6666004)(86362001)(83380400001)(82960400001)(36756003)(110136005)(54906003)(66556008)(66476007)(316002)(4326008)(8676002)(38100700002)(66946007)(2616005)(6512007)(478600001)(186003)(6486002)(6506007)(44832011)(7416002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kxePyqGIUiI/dtyGvRF6+DEhVKAgC2/1uxzWpx/lLNz5+7zLy14MgekqdLka?=
 =?us-ascii?Q?wZzH02kuehSGBlEVl2HJ/gr9uIxLXtLnxoR6KZh1q9yrt1eP2QI7vgRsvIlb?=
 =?us-ascii?Q?Glpaa7CKfT9SnlMw+EEDung1Q2kYY4x8SnrWY5JC7A7s1ZnUA8Y21bXfPVTA?=
 =?us-ascii?Q?gcUPMO5muXHnv+wcTtLa60KGiOlRMQo4JWhtsg1CYfRW7IT52+hRJ5npMGG9?=
 =?us-ascii?Q?hk7yDufrLdRppSKbX0VmowjK9zL6qI+1YFrLySqvRdtsfcamuvZDW5jXIOD4?=
 =?us-ascii?Q?Ab4TzMwY1hvpD3dM9cywdNYsOUXANIO2EuGwBYa5rb45LB+4ZlMU86a7aSPQ?=
 =?us-ascii?Q?4IefNx+HirTRD96qMgdRNuS9dR4v4lFxLTMsDGQj0pfNUpVrc5L6gdT80vmt?=
 =?us-ascii?Q?HlFALaKJOsI3X34/RzEWQC5VNMGNEG9Ij47G5CHmuCdoOFjeLGyBJr2aQZSc?=
 =?us-ascii?Q?kae/UU1EoTfPlaVA07FIUCRiNqg8Hp48/OQI1HhG05kh56SfiXLRR8jWe+lU?=
 =?us-ascii?Q?s2TiSMNxS/gwRdp9gjIVc7uvxfe3MnR+jPhoPyqJwiHQwu94ani2X6VkeWll?=
 =?us-ascii?Q?a6Ox66A7fFl+An1Tb/8TfwrLgJRTahebi+aCwCANkuyJBQgV2CmDQkV94vYp?=
 =?us-ascii?Q?efouhs4FD+ZvrrLD8uc5mTTHouWC9KsdqLPJArOmaVwRH0nl0HfGxUUPg7IE?=
 =?us-ascii?Q?0qDSrTNBUervRgnxeHoL110rYPjWRIlY3DRW4UFd/xta20gFCQuKjTu2m3Hb?=
 =?us-ascii?Q?HhZe2k4X9G9dlcFwVsr2d87iQygGLgLNTiDpDXTjZ9/JwAzh8Lpl5XImctHZ?=
 =?us-ascii?Q?Ua4gd4dcvxguKC/smY9XscFE9ExUgINVs/c1qG62iu/Ge659qRJnw++clDWv?=
 =?us-ascii?Q?ZG4TGbv9yOUnm/Um8nWmRI+6ZFGWsalZX2hsfM+g54jzHrbcQQsaQif3pUCF?=
 =?us-ascii?Q?ueAUmyXMLROJgJsxyK54BFosRvYGHrVnSSzkTVYFGy+uYl/fZLbyo1Kb9XtC?=
 =?us-ascii?Q?1toXdd30x+AWvjNvJulpJcY+OFHUi0afuT+XzTgNpXnrvNuZ5+7OdXxqmH6D?=
 =?us-ascii?Q?MSGhwHZJqasRZmpPi6mQgbpS6riiWtgJpuBQI71pevXf8i65Rub7UAB6LlV2?=
 =?us-ascii?Q?OL7MUG2chLdHa7h/EgHzIefA3h8iK+Irq8GgKZDNpSEfTlY72RiJW4AmfK4V?=
 =?us-ascii?Q?RYIa4J1k4YAWaPbMRtatYp4qh5O/iphWj+4L6NuGat0FqPGVug4436bOVmDc?=
 =?us-ascii?Q?st0FqMpaS0NhhydP52r353lBb70c9v1mwy3a9rL/OvB/loVzcvn9OiLe8w1h?=
 =?us-ascii?Q?VWqnpVEQ8khdtuxWe7a6ljFa8UOMyNPswCC+CGQw6el0Bqi50gJCcNm+mpsw?=
 =?us-ascii?Q?zBks1UnQP8IA7pZqKWo28NNCKAC6VMsm71atl934ON5nvhwEsVuPzkn88JDB?=
 =?us-ascii?Q?p9WzK7tMWPg3nw+uha/UynhOFBBtN/K9O9UzX9ZcD4jMWe6Hbphz9wa7408c?=
 =?us-ascii?Q?Zx2Sx21a59v+F3eroyjKfhwelBGliE1MHcJJqdqlBYf6Z+HnMOIac34lO/y5?=
 =?us-ascii?Q?BsTQpQEjczD2ircTLG6SAjSa7nj4syhexT2rnWJNHCOGaL3dNz4XQ8Hv5pM6?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4ae26d-47cd-466a-7bc6-08daffcd5ffc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:44:37.2606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SElZZXB5hkdJqNDNd979SiE7A6KffR9dHjzHeG2YBrx2H7CI1qiwmHHdfunAsNZFkq0EM0wDEDSilVAn9963Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5092
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

nothing major or critical this round...

Here goes drm-intel-fixes-2023-01-26:

- Fix BSC default context for Meteor Lake (Lucas)
- Fix selftest-scheduler's modify_type (Andi)

Thanks,
Rodrigo.

The following changes since commit 2241ab53cbb5cdb08a6b2d4688feb13971058f65:

  Linux 6.2-rc5 (2023-01-21 16:27:01 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-01-26

for you to fetch changes up to 2255bbcdc39d5b0311968f86614ae4f25fdd465d:

  drm/i915/selftest: fix intel_selftest_modify_policy argument types (2023-01-23 13:45:04 -0500)

----------------------------------------------------------------
- Fix BSC default context for Meteor Lake (Lucas)
- Fix selftest-scheduler's modify_type (Andi)

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/i915/selftest: fix intel_selftest_modify_policy argument types

Lucas De Marchi (1):
      drm/i915/mtl: Fix bcs default context

 drivers/gpu/drm/i915/gt/intel_lrc.c                | 37 +---------------------
 .../drm/i915/selftests/intel_scheduler_helpers.c   |  3 +-
 2 files changed, 2 insertions(+), 38 deletions(-)
