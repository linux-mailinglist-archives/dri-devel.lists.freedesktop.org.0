Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3660567713B
	for <lists+dri-devel@lfdr.de>; Sun, 22 Jan 2023 18:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311CC10E188;
	Sun, 22 Jan 2023 17:49:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8815D10E0CE
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Jan 2023 17:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674409745; x=1705945745;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=S3D8Pyf5AWenWrCkCjnyeTJ5IdoPXmNZy73qFOGWEXc=;
 b=hHfuigyOs/vN6Zhekif9xx3lmcNgCdZaRhGXcQSiFKTHAfOik+HTFMPg
 kcn0GQS5SZ/TR2bdbutulwN72w78NAjrj4i2GV5pA410Q/gFkA6JqsXoz
 dAmZ1wV44sClU1tVPcQgauyIvO02vQXNNiGuDk2p/71Q++uLnpjYgSo1b
 8sc0FNGvLH9jCXdELQjeHvFWqJ8PMzy09ub1C8q8rdcLXlDPF/Tg3pcY7
 OIVkSbUlkmK1a9i65u4wzSr5dD/HsO3CG8nVf+5kpkBn6FgXjS9XIx4T+
 G2Geog3UccPKXLTmd8xhCD8VkRX9ZB2RVx7XsqMEAdX3ck/jnN7knMFKh g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="305579098"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; d="scan'208";a="305579098"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2023 09:49:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="750095090"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; d="scan'208";a="750095090"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 22 Jan 2023 09:49:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 22 Jan 2023 09:49:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Sun, 22 Jan 2023 09:49:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Sun, 22 Jan 2023 09:49:03 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Sun, 22 Jan 2023 09:49:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W38LY3J5/xhBKMeUPfTJJWrkoBE18DDaWQ4P6cbbpcKw+lGK8MKt+Kp5Jkbghp3Aiogtni0+QcWmq9iOUYXRpsjZnXLAqkKazk76iRErFREybZDXSDzCPo41R+2i7LX0AXN2wO96q/o3Yw+DB4UaNGKGjzv2lclCIvxwADUP7/he/MDaCRMh230mrGavP7TLyO8INgbIKBKqeuvDDVK8uiCOcgWnVwU/7vSrk+Gf8UAT6WciJj65dCdOd4RLhSPITnZqL8RKJ5DB/lBdEiee1ZEKqiaJE7Dk39/1fdrFlbO0LaWY4q8r1Ny6Jc2LtK+Hv+Z/1q2KQDNkYl6WKEZe/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uHK/S9AIXaXDl2gVlCNI3uLHht1YIt3t1dNutEcQE20=;
 b=RiKVzlwiDW9LU5cPC/NcBtpB/ZVpIJFhpYnKfK3hsF4xHRnRyucS0OHKT+XLXVCkPBIQov0Q+SSkaF/LfMWOaAV/RwtVWPJh/f6y6hWL0Vd7jH5KEJlZ3i4sKnmAVrj6XjmIgJ4yl6f3eWy1+b1/hwqKpJ+5GU2AdUIDfpnK/gU4Q5Xnx6QhOwEdIuQHlWNZcNpvO7cWdVCJnx0L0Ui9HVqSPzDaBKE3tw/0liviv1Hpw7qOSV3BOVXhZVZTegFCXfPYdSbXHwi8LAszrzg9+exYSckz4YspyO1mjyR7CnTBYlCGkFVtGSjnrZz8ZyjtNTqs2RKFMBFvWB7DajXqkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB6472.namprd11.prod.outlook.com (2603:10b6:8:c0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.28; Sun, 22 Jan 2023 17:49:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.6002.027; Sun, 22 Jan 2023
 17:49:00 +0000
Date: Sun, 22 Jan 2023 17:48:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH drm-next 13/14] drm/nouveau: implement new VM_BIND UAPI
Message-ID: <Y8129SLhOmc+kHiZ@DUT025-TGLU.fm.intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-14-dakr@redhat.com>
 <e371e8a1-88f8-1309-07ca-f48f4157fec8@shipmail.org>
 <8e10b46c-f934-8eee-904e-b3d8a7644a71@redhat.com>
 <Y8jOCE/PyNZ2Z6aX@DUT025-TGLU.fm.intel.com>
 <6f7d3389-aaf7-ce79-afbb-76abc446d442@redhat.com>
 <Y8lx7nAh/PEqiWSl@DUT025-TGLU.fm.intel.com>
 <20230120112245.0fc88338@collabora.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230120112245.0fc88338@collabora.com>
X-ClientProxiedBy: BYAPR05CA0072.namprd05.prod.outlook.com
 (2603:10b6:a03:74::49) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: db3a60b8-dfbb-41c7-8946-08dafca0f15d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l6v4jE2SqNwTgczjZNa3vPyDKQJXs4IlNaXDhXDfJ+C8yfL7IJBG0YDI10tQYNxtJtAgj8dwC6ssDBIex89souM1Et7U9wyGrcJ0QMVXtTVGwGO8TrsdNPbswkzE6b4ag5ODr9bAIEmH7O6PKWX14tkBClpcjvL22qCWyzFp3PMdvM3NRRMDPQCwdwgk1Dktv5BHNucJL9kwQfPkaVOLYeni8ER8W/+/6Ma2As4O455toMrd7A+TepBT43iex47uxjw5kfnXISbBGaIUr1THChA+enzOedT7remceL5pVlbUjmY8uldMflVYPbyY7jToXP1PlDUFpA73YvDYwXy5j1fyOpu0VF0S2+CpLPKTSlqPNKbPs4PHr8z4RTXozXtqLFS1lTgl57907+lVDuROAF3rOb+0yjbWaIUBhmoQ8YW4NMDLVITBbJJ29hmlOyzxrVU21CSbe8I6nA3QrRpoPaYy2nkzXCoJvTGY9eLdqryJ5FYqWPaTx5HDzbg35vku6JgfQq1/wysv1Xakc/6vl+noPpSnFEXyY5D0Oe1lsAak2QuJ+xXVR2vAhMipk+5Temzulkdrgs61niC2XQW9tDAZHShmL0Mle/H0lZxzoWSlyNtHvrVrFaR1ujB62PwgvbipKHGSUIXKv7u325kdYn/f0MUrL5DuglenSGGux/VSMEfE90nq74P2cN3ZJsUi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199015)(6512007)(6916009)(66556008)(4326008)(8676002)(478600001)(66946007)(66476007)(186003)(26005)(86362001)(44832011)(2906002)(83380400001)(41300700001)(6506007)(53546011)(6666004)(6486002)(316002)(82960400001)(66574015)(5660300002)(8936002)(38100700002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?D8RDKH6CcqeNZ5NBt/Le7a1dDuP+1MxusiXZqgAoIlTmzUlAeG5V9QBIfD?=
 =?iso-8859-1?Q?rVcNSSHkVs6LHt1HidX494J20lx/FtXmorlJ6iI0gv+V+sPwlDYOSgEkDl?=
 =?iso-8859-1?Q?CdUmoof74//6WQZUDgZRRj7xWnSO3TMb4Hu5lkoJoQdFVc69YG99ViHDDM?=
 =?iso-8859-1?Q?8BZQmgmzeM/MuoM+jvMwTD7SQAQ9bzlDaAGGPYQua1/VseTMwRvVe0e6sl?=
 =?iso-8859-1?Q?rCddt8zT+MbW1xN3gg+xOMQIN4u0x+WCoUzfpg1DtCWHeVt+U/sT+5vpCk?=
 =?iso-8859-1?Q?Y6hZJBGWYkAMw6hbVLcsfsAoAy1C209g3b65w4u5ebVm5aaCBPKHH/+FJa?=
 =?iso-8859-1?Q?g7y4MmQsj+OcI/651n1YedsJCIsMOJWzZlTH0Tv5VHOTj+6uHBsyzcvOGb?=
 =?iso-8859-1?Q?q2lkgrP/WhVMevULizKfEHw2C8Q9EcTMwbfCprs0i3s2Q63QSwgHQjDBiz?=
 =?iso-8859-1?Q?+y3xwjlYy9mfFrI0sTJtKJrYWrnBLxQLgCRTuuj8xX+REWyumqn+x4nvgF?=
 =?iso-8859-1?Q?8p+YYS3VX5ANDfyM4TO0bRAbLgNCvuEAdFqmhZdwPTm7od4RfQj+xB9//4?=
 =?iso-8859-1?Q?J7K1nZ1lQi9EeAb80Xsplpbfzm+FR42sIRJVqXG4DdpfX9HiadK11wKkss?=
 =?iso-8859-1?Q?uNPO4KDn7Pw/Wa3itYL3r++EmAIwzi1PXmCVYX8fYuzSV7pYtMCimpBMjQ?=
 =?iso-8859-1?Q?qraWCslO0onhNMNZRzV4bmaP/16awXCwXLk1lfQDYoSnZyNea3Pn8kucUM?=
 =?iso-8859-1?Q?53Swv0Px8QTftHbZs5PRd9MCiWGiysOr8y1Cs2QyXb3yvPAEMrWwvxJdlW?=
 =?iso-8859-1?Q?2FbXYmJFq1jXVHdIoGtLuiMOnyt6z2RVQBbIpzOjo6PkDtF2X59zZoqDWF?=
 =?iso-8859-1?Q?9sIBSencCvX73ov7V3nq33b8AzW/uKTJSS878QxaqsS6UKt0bS2nrjZoPP?=
 =?iso-8859-1?Q?lmmNKGRVRjswFEAzO8RaVyHYG6pYoovFZrEdK4DWvoC144VuRWTKra7SYp?=
 =?iso-8859-1?Q?+jfqnLjVFDEACsMMrlOVvmj789FM6Kb68sxIjIbAzbKQbjhS7oOzX5POaa?=
 =?iso-8859-1?Q?OOoRQwMZUK18CeatnGnun7v+waU0rq3M1uC+adj7Sk6fD8/ktzec3k6muk?=
 =?iso-8859-1?Q?xMdGTISUIBiy7P28H3fSiGRtxp4E6Zq2AyuacyB8MOcKG4vE6L3EAfszov?=
 =?iso-8859-1?Q?fLMXMK83hmtL1nb4paNsPGKXg8mL9Z04jhvPY60dK4ZwjeQbBzsyMjqqoK?=
 =?iso-8859-1?Q?XpkOfk6MFUBUGDh00CWlKCFz/AEWg8tDWbfoPVfhUOUUMEGE6Eke5hbUEy?=
 =?iso-8859-1?Q?eAz9OCsaFwAwJy2S9A0s85PfwFYCPozqmZPN0YE/JOHNPj5vbgJRTNRu2+?=
 =?iso-8859-1?Q?yk/BdkbJr0U3QM5F5hAeSsyO9lOjnQzuNpzN0NCUix3FQr/kfGmfIkRC82?=
 =?iso-8859-1?Q?R94sJ7Aj2SCnN+h1dpBZbGRcXMPHY3qWeyIJubXIAd5hldahvyiereSmfT?=
 =?iso-8859-1?Q?oUE/C76w0HC4ns/Z9G5B6jKoaY1xRwMNamTTuSt1Vwd07Cn1bb6h4xFF0m?=
 =?iso-8859-1?Q?LtNRuA6lGsGwWQiGPwQQhU04Mkv/L424xLHjVRh396LwSVDHIHo9+64fcT?=
 =?iso-8859-1?Q?D/hfVQOKpncPTCdp6BYv2ZVGHLboSTzw3b8mPFpFCCXU2SBiTUEQKuOw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db3a60b8-dfbb-41c7-8946-08dafca0f15d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 17:49:00.2315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDswyMEvTr+KPbA1lKHhhIoEh+gAIvcDWf2Dr8e81DL7ZkH6HsfGykHHrg4Dtzn6Wd2y4pf9FRjeSR+5RpKPSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6472
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
Cc: Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 20, 2023 at 11:22:45AM +0100, Boris Brezillon wrote:
> On Thu, 19 Jan 2023 16:38:06 +0000
> Matthew Brost <matthew.brost@intel.com> wrote:
> 
> > On Thu, Jan 19, 2023 at 04:36:43PM +0100, Danilo Krummrich wrote:
> > > On 1/19/23 05:58, Matthew Brost wrote:  
> > > > On Thu, Jan 19, 2023 at 04:44:23AM +0100, Danilo Krummrich wrote:  
> > > > > On 1/18/23 21:37, Thomas Hellström (Intel) wrote:  
> > > > > > 
> > > > > > On 1/18/23 07:12, Danilo Krummrich wrote:  
> > > > > > > This commit provides the implementation for the new uapi motivated by the
> > > > > > > Vulkan API. It allows user mode drivers (UMDs) to:
> > > > > > > 
> > > > > > > 1) Initialize a GPU virtual address (VA) space via the new
> > > > > > >      DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMDs to specify the portion of VA
> > > > > > >      space managed by the kernel and userspace, respectively.
> > > > > > > 
> > > > > > > 2) Allocate and free a VA space region as well as bind and unbind memory
> > > > > > >      to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
> > > > > > >      UMDs can request the named operations to be processed either
> > > > > > >      synchronously or asynchronously. It supports DRM syncobjs
> > > > > > >      (incl. timelines) as synchronization mechanism. The management of the
> > > > > > >      GPU VA mappings is implemented with the DRM GPU VA manager.
> > > > > > > 
> > > > > > > 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl. The
> > > > > > >      execution happens asynchronously. It supports DRM syncobj (incl.
> > > > > > >      timelines) as synchronization mechanism. DRM GEM object locking is
> > > > > > >      handled with drm_exec.
> > > > > > > 
> > > > > > > Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, use the DRM
> > > > > > > GPU scheduler for the asynchronous paths.
> > > > > > > 
> > > > > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > > > > ---
> > > > > > >    Documentation/gpu/driver-uapi.rst       |   3 +
> > > > > > >    drivers/gpu/drm/nouveau/Kbuild          |   2 +
> > > > > > >    drivers/gpu/drm/nouveau/Kconfig         |   2 +
> > > > > > >    drivers/gpu/drm/nouveau/nouveau_abi16.c |  16 +
> > > > > > >    drivers/gpu/drm/nouveau/nouveau_abi16.h |   1 +
> > > > > > >    drivers/gpu/drm/nouveau/nouveau_drm.c   |  23 +-
> > > > > > >    drivers/gpu/drm/nouveau/nouveau_drv.h   |   9 +-
> > > > > > >    drivers/gpu/drm/nouveau/nouveau_exec.c  | 310 ++++++++++
> > > > > > >    drivers/gpu/drm/nouveau/nouveau_exec.h  |  55 ++
> > > > > > >    drivers/gpu/drm/nouveau/nouveau_sched.c | 780 ++++++++++++++++++++++++
> > > > > > >    drivers/gpu/drm/nouveau/nouveau_sched.h |  98 +++
> > > > > > >    11 files changed, 1295 insertions(+), 4 deletions(-)
> > > > > > >    create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
> > > > > > >    create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
> > > > > > >    create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
> > > > > > >    create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h  
> > > > > > ...  
> > > > > > > 
> > > > > > > +static struct dma_fence *
> > > > > > > +nouveau_bind_job_run(struct nouveau_job *job)
> > > > > > > +{
> > > > > > > +    struct nouveau_bind_job *bind_job = to_nouveau_bind_job(job);
> > > > > > > +    struct nouveau_uvmm *uvmm = nouveau_cli_uvmm(job->cli);
> > > > > > > +    struct bind_job_op *op;
> > > > > > > +    int ret = 0;
> > > > > > > +  
> > > > > > 
> > > > > > I was looking at how nouveau does the async binding compared to how xe
> > > > > > does it.
> > > > > > It looks to me that this function being a scheduler run_job callback is
> > > > > > the main part of the VM_BIND dma-fence signalling critical section for
> > > > > > the job's done_fence and if so, needs to be annotated as such?  
> > > > > 
> > > > > Yes, that's the case.
> > > > >   
> > > > > > 
> > > > > > For example nouveau_uvma_region_new allocates memory, which is not
> > > > > > allowed if in a dma_fence signalling critical section and the locking
> > > > > > also looks suspicious?  
> > > > > 
> > > > > Thanks for pointing this out, I missed that somehow.
> > > > > 
> > > > > I will change it to pre-allocate new regions, mappings and page tables
> > > > > within the job's submit() function.
> > > > >   
> > > > 
> > > > Yea that what we basically do in Xe, in the IOCTL step allocate all the
> > > > backing store for new page tables, populate new page tables (these are
> > > > not yet visible in the page table structure), and in last step which is
> > > > executed after all the dependencies are satified program all the leaf
> > > > entires making the new binding visible.
> > > > 
> > > > We screwed have this up by defering most of the IOCTL to a worker but
> > > > will fix this fix this one way or another soon - get rid of worker or
> > > > introduce a type of sync that is signaled after the worker + publish the
> > > > dma-fence in the worker. I'd like to close on this one soon.  
> > > > > For the ops structures the drm_gpuva_manager allocates for reporting the
> > > > > split/merge steps back to the driver I have ideas to entirely avoid
> > > > > allocations, which also is a good thing in respect of Christians feedback
> > > > > regarding the huge amount of mapping requests some applications seem to
> > > > > generate.
> > > > >   
> > > > 
> > > > It should be fine to have allocations to report the split/merge step as
> > > > this step should be before a dma-fence is published, but yea if possible
> > > > to avoid extra allocs as that is always better.  
> > > 
> > > I think we can't really ask for the split/merge steps before actually
> > > running the job, since it requires the particular VA space not to change
> > > while performing those operations.
> > > 
> > > E.g. if we'd run the split/merge steps at job submit() time the underlying
> > > VA space could be changed by other bind jobs executing before this one,
> > > which would make the calculated split/merge steps obsolete and wrong.
> > >   
> > 
> > Hmm, maybe I'm not understanding this implementation, admittedly I
> > haven't studied the gpuva manager code in detail.
> > 
> > Let me explain what we are doing in Xe.
> > 
> > Map 0x0000 - 0x3000 -> this resolves into 1 bind operation and 1 VMA
> > Unmap 0x1000-0x2000 -> this resolves into 1 unbind and 2 rebind operations
> > 
> > 1. unbind 0x0000-0x3000 -> destroy old VMA
> > 2. rebind 0x0000-0x1000 -> new VMA
> > 3. rebind 0x2000-0x3000 -> new VMA
> > 
> > All of the above steps resolving the operations can be done in the IOCTL
> > phase and VM's VMA structure is also updated. When the dependencies
> > are resolved the actual bindings are done on the GPU. We use the BO's
> > dma-resv slots to ensure there is never a window 0x0000-0x1000 and
> > 0x2000-0x3000 are never mapped with respect to execs (I forget the exact
> > details of how we do this but if you want to know I'll explain further).
> > 
> 
> Ok, so I've been contemplating the idea of pre-reserving memory for any
> future page-table updates, so I can guarantee the bind/unbind op in
> ->run_job() never fails (that's actually made more complicated in my
> case, because we don't directly control the page table updates, but
> defer that to the iommu/iopagetbl framework which does the allocation,
> so I didn't really go as far as you did). But with bind ops happening in
> a queue with dependencies to wait on, guessing what the page-table will
> look like is a bit challenging. Sure, we can pre-allocate pages for all
> levels needed to reach the leaf node(s) we're trying to insert or plan
> for the worst case scenario in case of 2MB -> 4K block splits for
> partial unmaps, but it sounds like a lot of memory reservation,
> especially if we get lot of bind requests queued. Just curious to hear
> how you solved that.

A few thing here.

First the reason we always do an unbind and possibly 2 rebinds is
because we might crossing the 1GB / 2MB page boundary size. In the
example I gave we could just unbind 0x1000-0x2000 and call it day but
we'd have to build smarts into to our code to know that is ok which we
don't have at this time.

e.g. This wouldn't ok just to do an unbind as the page size goes from
2MB to 4k:

Map   0x000000-0x200000 -> 2MB page
Unmap 0x100000-0x200000 -> need 256 4k pages now

For simplity we always do a unbind + 2 possible rebinds. Maybe we will
be a little smarter in the future if needed.

WRT to the memory allocations, we haven't really thought about
consequences of reserving memory for pending binds. My initial reaction
is I don't think this an issue. Page table memory should be relatively
small compared to user memory so having a bunch queue'd up shouldn't
really be an issue, right? Going from 2MB -> 4k splits on either side is
just another 2 4k allocs on either side. Maybe I'm wrong, I just don't
see this being a major issue. If the user abusing the VM bind interface,
e.g. Allocatiing misaligned huge chunks of data, that is kinda on them.

Matt
