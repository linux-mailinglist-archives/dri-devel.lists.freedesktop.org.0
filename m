Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 940C72F1D21
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jan 2021 18:52:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A3B89CF7;
	Mon, 11 Jan 2021 17:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CA489CF7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jan 2021 17:52:46 +0000 (UTC)
IronPort-SDR: DsSncdxzfcB4RHHMcjgJ2w5EZ2vrEDpcpZ1gCzwrj+6+CbHw1NBv9F1kv2uwM5vmBQxUGJtFLx
 2HjWi0WtbgBw==
X-IronPort-AV: E=McAfee;i="6000,8403,9861"; a="239447197"
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="239447197"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2021 09:52:46 -0800
IronPort-SDR: /9efWFd47YrXLonvm7fGsdXV0jrN+XBLqR1sKs+sMSspui9ACJFdazO4TQ5e3fon/KfvIyLMro
 Dn9/kIC+5B/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,339,1602572400"; d="scan'208";a="363213835"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by orsmga002.jf.intel.com with ESMTP; 11 Jan 2021 09:52:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 11 Jan 2021 09:52:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 11 Jan 2021 09:52:44 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 11 Jan 2021 09:52:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L8vIVKX3bcAj6f5csoUw90bveOrdc8j239jJMD25yQi457iX8e8YDnXoFBpKSwgf4rds7TgeNasZXjUFLVDbHiY3gfAWXNhq50zlXJUTwneYoYVeGAkyqGkxsYiSU82Jq/3z1KNN1KxemqP3yhpCiJm9dP5MugfshBGe50rbQl6NXwf3EGjds3Vr/mk/BNVdysiWrD5hl6vuir5EXnvDSXE2fJsiMqQh9TDdwPo/KLlPP99UwP2tJMmqSMFLUyKHVraXlQOAhjMv78GiCahglW7ayY7d59lCnjGkIHLwhrLfYAz9C2ptlwjtNUoNwMSgQFpK/TIOzzBUZtA0NT/tgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUxRQbb0LV72Jy2HnRX5BJtucKs2GrqJ2fAg0FjMgcc=;
 b=JLSBSqYzdSUzq9DYOP2WmOo2guQviP1SbQrpcmyGSu+ucs8e2UjejTxZJV3Ste8jotmoM2KkIY7KoEf89i4JWebgilAQ+ASEsBPE7BsPX7XgRKiXFw5k21/uoXeNsQDoXde6bIn8e76ZjC1kP63G2oHpt148AlTmTKyRF9a7gSjW5DzP/9aYvSfvQwCkk85d/i1bTU1QQ1t8v+Jgp9cnb/DbcT2szzuzUN6DDFCMb4p/Jz183TDzNEWEDjxE/uklM+ub2/NjTuVBOJRePH5G8NSEXVKQKivnuzTIJlbpRCBU7qIFEY69dx64E07SbCiRocmUyL2sK0jb2iLXuavarw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NUxRQbb0LV72Jy2HnRX5BJtucKs2GrqJ2fAg0FjMgcc=;
 b=rYF/HJPCaT5fzqMbVQ8OgibLq5rrBi5Of6hGixLrM//nLR+UV/mirLUdgybUce8SqGDcO1gLo44+Tsl5Xlj95/O/cU0Z0IPnOdC6o6A+EBcIeGG5sq7PPjWKjtqdmymS8WiLytWpMhcqEXggrJkZ96KlsarwYK5HWBEAEK1W8h4=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4785.namprd11.prod.outlook.com (2603:10b6:303:6f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Mon, 11 Jan
 2021 17:52:35 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28%5]) with mapi id 15.20.3742.012; Mon, 11 Jan 2021
 17:52:35 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH rdma-core v4 0/6] Add user space dma-buf support
Thread-Topic: [PATCH rdma-core v4 0/6] Add user space dma-buf support
Thread-Index: AQHWyOvUjyXRaaMwsUuohC80qTC6Oaoi8U2Q
Date: Mon, 11 Jan 2021 17:52:35 +0000
Message-ID: <MW3PR11MB455536868E31BADC7DD8B2D7E5AB0@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606942641-47234-1-git-send-email-jianxin.xiong@intel.com>
In-Reply-To: <1606942641-47234-1-git-send-email-jianxin.xiong@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e340571d-7eb3-40e9-4dd3-08d8b659adb9
x-ms-traffictypediagnostic: CO1PR11MB4785:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB47853A1BBDD122F0244B3932E5AB0@CO1PR11MB4785.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TgL33GQGLI5rmxHfLEhWAZ5xKNYlKvMF8p4SlwCLskSD8PoFjV4913kojYrKWn8NCQ9sWQdfMeznNOOd8Yq/Iw8e0SmQezPuA0X/WzWz3f3U+wclbt8abwsyE66BM6CvuETFQYfwHjinjhXqjK22tLvEpRYUfKSMk8ZJycp+iNepmPafq9ZtQmGCGApZUxQyiq2Bdl1pYeFk4In2QC3aFxl0P+bZbRYgYW860bnYiyObdTh6HcwlKrK1NcovT2Yb4RUJYRqftOHLOb4bWimTx8Zh1e0V7sNFYLEhsT0u7uFwmXPqpvCVKGf4AACVeWTjvDJqwc/XO7ShPWjph1KbMX/LUw8WlewwbFV6oPnjfmKWbTwCTC1A1sAkferNA8jS3G69hM3FJIp1wLq0VvHEaBcwRg/+5DYyIkMd/X38xpBRrFhGeTMHCLqUbcCCNTVD5JBeRlPw4g4gGf+ka+MM8w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(64756008)(76116006)(33656002)(66446008)(66476007)(53546011)(66556008)(55016002)(66946007)(186003)(9686003)(8936002)(83380400001)(86362001)(6506007)(71200400001)(5660300002)(2906002)(478600001)(4326008)(52536014)(7696005)(8676002)(54906003)(316002)(110136005)(966005)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?UEAtCBK8q3RrPKQa/4YTYpKwqMbNFMwU4a/etdZjl8/XjoGLmbpnBhXRWB0c?=
 =?us-ascii?Q?eQrnUsYqV9Lq5p2NKr7WfbgR2KIQBxE3P4IAWOuK0Pu9tRvm0OuvCJEovt60?=
 =?us-ascii?Q?YC7+xuHcPBEqzfCu9fwdanhiAjxFw1tn/TV1/i2gEGP9nn3fPpplajuUlgHn?=
 =?us-ascii?Q?k6rwdv0RR+Yew5DalVwlutqKCGIwFldOrWcOfLsdTchkCQHIuzFWY99kHP/S?=
 =?us-ascii?Q?NVI+lskyq3lPQXSaUE1qnhT7zVLR1BGBPQyBpVyiSX6mEpNiR4HWoyeccGfb?=
 =?us-ascii?Q?fq5oeReNLvMYqQmkAi52SJ6ieeyEo4pTxadd0wUHDpuXKjB+e+2BaNYUCrpJ?=
 =?us-ascii?Q?VWixMgEqGyz+MYujg/zrbY8XHt3ybdZc79LnzLF3euUJIUmGeaIuZT9SBwh+?=
 =?us-ascii?Q?gteoSAAjwYmYN+DGc1cheF1qzYdnfbSqQzqd1AI7mL2diH/28BG92hmXXjCI?=
 =?us-ascii?Q?k0A+AfJA96JGqHqrV7N7F5Ef5Wg/VgA7tdmwsNnOtMAnCY6aPVvwXVDU4YiD?=
 =?us-ascii?Q?g2075/XDNNOKnG24qk56+qJZf25R731pyW6DMrv/tNqknsF1t9D5GvpL547Q?=
 =?us-ascii?Q?DQp67lmcl3N8TnqlJxM8nn+Ua8iUVEUNG1PD/xv9csYvO9GFmna0nYavszyt?=
 =?us-ascii?Q?9rgfOSMErZaPbT/hrFJOETv1ftGAbGn+wZlkth6AbXyu3kOnbpTAmtwrzHWf?=
 =?us-ascii?Q?k3pNfmZDhqYZPuhU63Yaay9SX4m0CLQWwqDkTEXrg+M2eLXIUBstxvePWZL5?=
 =?us-ascii?Q?OdajS+YaycVwgeU8vylUtShF8edQeW1VCSbvMYWCJszk2k8zX1+/mnKngG/L?=
 =?us-ascii?Q?8OxRsMxsNnft/YzyEleqTZucprBXseah2Xz705zkYvJmyCgejNeVnOGpR2f2?=
 =?us-ascii?Q?L6BcI2ApwIdp1g6qD2GdRbg8lSZXuvuxdLjFYN0BC9wXSfr2TpmNAzDiX7tT?=
 =?us-ascii?Q?5DLE/aDOaGJBMSJ1jRtu2yNibBiEJV9JBOJd3LmNLB4=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e340571d-7eb3-40e9-4dd3-08d8b659adb9
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2021 17:52:35.4478 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vJcEZwl7SeiXYIqzAqr/7oILs1NVA32/fdS1r2Y7sqMqYkEJmfgilPwTeNlYbHOovhoNuUzLTGxPrOWNNjgi9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4785
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
Cc: Leon Romanovsky <leon@kernel.org>, Edward Srouji <edwards@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Doug Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Does this series look fine now? I would like to try resolving any remaining issues so we
Can catch the window for kernel 5.12.

Edward, do you have more opinions on the pyverbs related changes?

Thanks,
Jianxin

> -----Original Message-----
> From: Xiong, Jianxin <jianxin.xiong@intel.com>
> Sent: Wednesday, December 02, 2020 12:57 PM
> To: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org
> Cc: Xiong, Jianxin <jianxin.xiong@intel.com>; Doug Ledford <dledford@redhat.com>; Jason Gunthorpe <jgg@ziepe.ca>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>; Edward Srouji <edwards@nvidia.com>
> Subject: [PATCH rdma-core v4 0/6] Add user space dma-buf support
> 
> This is the fourth version of the patch series. Change log:
> 
> v4:
> * Rework the cmake funciton rdma_cython_module to support both single
>   source (.pyx) and multiple source (.pyx + [.c]*) scenarios instead
>   of using two separate functions
> * Rename 'dri_*' to 'drm_*' for the dmabuf allocation interface
> * Add option to dmabuf allocation routine to allow allocation from GTT
>   instead of VRAM
> * Add proper CPU access flags when allocating dmabufs
> * Remove 'radeon' driver support from the dmabuf allocation routines
> * Add comand line arguments to the tests for selecting GPU unit and
>   setting the option for allocating from GTT
> 
> v3: https://www.spinics.net/lists/linux-rdma/msg98059.html
> * Add parameter 'iova' to the new ibv_reg_dmabuf_mr() API
> * Change the way of allocating dma-buf object - use /dev/dri/renderD*
>   instead of /dev/dri/card* and use GEM object instead of dumb buffer
> * Add cmake function to allow building modules with mixed cython and C
>   source files
> * Add new tests that use dma-buf MRs for send/recv and rdma traffic
> * Skip dma-buf tests on unsupported systems
> * Remove some use of random values in the new tests
> * Add dealloc() and close() methods to the new classes
> * Replace string.format with f-string in python code
> * Fix some coding style issues: spacing, indentation, typo, comments
> 
> v2: https://www.spinics.net/lists/linux-rdma/msg97936.html
> * Put the kernel header updates into a separate commit
> * Add comments for the data structure used in python ioctl calls
> * Fix issues related to symbol versioning
> * Fix styling issues: extra spaces, unncecessary variable, typo
> * Fix an inproper error code usage
> * Put the new op into ibv_context_ops instead if verbs_context
> 
> v1: https://www.spinics.net/lists/linux-rdma/msg97865.html
> * Add user space API for registering dma-buf based memory regions
> * Update pyverbs with the new API
> * Add new tests
> 
> This is the user space counter-part of the kernel patch set to add dma-buf support to the RDMA subsystem.
> 
> This series consists of six patches. The first patch updates the kernel headers for dma-buf support. Patch 2 adds the new API function and
> updates the man pages. Patch 3 implements the new API in the mlx5 provider. Patch 4 adds new class definitions to pyverbs for the new API.
> Patch 5 adds a set of new tests for the new API. Patch 6 fixes bug in the utility code of the tests.
> 
> Pull request at github: https://github.com/linux-rdma/rdma-core/pull/895
> 
> Jianxin Xiong (6):
>   Update kernel headers
>   verbs: Support dma-buf based memory region
>   mlx5: Support dma-buf based memory region
>   pyverbs: Add dma-buf based MR support
>   tests: Add tests for dma-buf based memory regions
>   tests: Bug fix for get_access_flags()
> 
>  buildlib/pyverbs_functions.cmake         |  78 ++++++---
>  debian/libibverbs1.symbols               |   2 +
>  kernel-headers/rdma/ib_user_ioctl_cmds.h |  14 ++
>  kernel-headers/rdma/ib_user_verbs.h      |  14 --
>  libibverbs/CMakeLists.txt                |   2 +-
>  libibverbs/cmd_mr.c                      |  38 +++++
>  libibverbs/driver.h                      |   7 +
>  libibverbs/dummy_ops.c                   |  11 ++
>  libibverbs/libibverbs.map.in             |   6 +
>  libibverbs/man/ibv_reg_mr.3              |  27 ++-
>  libibverbs/verbs.c                       |  18 ++
>  libibverbs/verbs.h                       |  11 ++
>  providers/mlx5/mlx5.c                    |   2 +
>  providers/mlx5/mlx5.h                    |   3 +
>  providers/mlx5/verbs.c                   |  22 +++
>  pyverbs/CMakeLists.txt                   |  11 +-
>  pyverbs/dmabuf.pxd                       |  15 ++
>  pyverbs/dmabuf.pyx                       |  73 ++++++++
>  pyverbs/dmabuf_alloc.c                   | 278 +++++++++++++++++++++++++++++++
>  pyverbs/dmabuf_alloc.h                   |  19 +++
>  pyverbs/libibverbs.pxd                   |   2 +
>  pyverbs/mr.pxd                           |   6 +
>  pyverbs/mr.pyx                           | 105 +++++++++++-
>  tests/args_parser.py                     |   4 +
>  tests/test_mr.py                         | 264 ++++++++++++++++++++++++++++-
>  tests/utils.py                           |  30 +++-
>  26 files changed, 1012 insertions(+), 50 deletions(-)  create mode 100644 pyverbs/dmabuf.pxd  create mode 100644 pyverbs/dmabuf.pyx
> create mode 100644 pyverbs/dmabuf_alloc.c  create mode 100644 pyverbs/dmabuf_alloc.h
> 
> --
> 1.8.3.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
