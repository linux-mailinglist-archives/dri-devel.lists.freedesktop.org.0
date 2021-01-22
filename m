Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6692FFE1D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04EA6E9B6;
	Fri, 22 Jan 2021 08:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB3656E9B6
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jan 2021 08:27:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Axf39wIMRUIvEDgBIzYf6iFTTUdPsjIBwdHqp+u/JjfNzpydfgXKJMHY7hjE5LcYqH2MoXWUqsnd5cbU8KNwQ+IdvZY3sWOZMWQRRkDgJc2aP60zHEV3gU1gi/nMaoXvWwEkfxqAYI0KOGoai4jC4iGeDwDwXRt4OfBjzSgVdZGcM87iYT0/NZg8UQmYUjxBNxrJpBUyeoKWmuvCUPGJLOhPjnoXKVH9lF6rruwtQTRsUrAJz+iRg0dAHcHjm76N9xh/nUYEbjQZ7OD+ARi6rKu7mWJdlL+SHz2NRoUxvV0ODDL682lLZ68JhTCXq9SvU57wHj+ohSNp9yKXRVPFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQljBmdyYnZ1mBRqd2VuUz2iO8gsHgtvbrry/Fq/9TY=;
 b=PVo53Cwl6AHB1mQgQ4Yjd7HSGLHEwVtUvSBaiG/Ts7blXarhXAZWvuKXe+5TW3A19l3vqcuVPVOWlQUjK6GPKPIacA2k2PFIPDUMYQv6cxd3SMlwfnAkCfNJP64YbqiJodFPdPNostIW0nAFAfFkWYKWVkX9omxOOie//MCm8ysHc1+oJ/+cXAzo8swuo1wnfnuTRegO1Ym5BDk0l0+S3DYu5B9BcudJpEnGLeumkksluEni47Wzw2EaXMRP/WCdPgqr9LnQ4C960gfUtrwdE62h5iSQEIcc79wPywqNcgkNU6/oI53vG3ICoQGgLnUmMbdKs61N5Gfz0Ut2gTTFrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQljBmdyYnZ1mBRqd2VuUz2iO8gsHgtvbrry/Fq/9TY=;
 b=gkRE4JccgyNHDK90fhQtTZr+UJLPtfezrfVoIzFUefa0jY+Pvz8X0YR6+5kfcjv5mJjMwSVaZ83Gbj/kcRzmm7hoV/U4Cbi/LJwcsRtDbRkcduuzSMwsLV9bwrlqLRj9ZcxvSSeQQAGz750c0Co6hFewJH7xTItg2jkcZDoC0Zo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MW2PR12MB2588.namprd12.prod.outlook.com (2603:10b6:907:a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Fri, 22 Jan
 2021 08:27:38 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::8c0d:7831:bfa8:d98%6]) with mapi id 15.20.3763.017; Fri, 22 Jan 2021
 08:27:38 +0000
Date: Fri, 22 Jan 2021 16:27:27 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: device naming cleanup
Message-ID: <20210122082727.GA735357@hr-amd>
References: <20210121115818.2482-1-christian.koenig@amd.com>
Content-Disposition: inline
In-Reply-To: <20210121115818.2482-1-christian.koenig@amd.com>
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:202:16::20) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (180.167.199.189) by
 HK2PR02CA0136.apcprd02.prod.outlook.com (2603:1096:202:16::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Fri, 22 Jan 2021 08:27:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 726689db-5b0a-4f69-f3f2-08d8beaf9346
X-MS-TrafficTypeDiagnostic: MW2PR12MB2588:
X-Microsoft-Antispam-PRVS: <MW2PR12MB2588A85D414586654F81FCC2ECA00@MW2PR12MB2588.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YD/AXL92DJOt9635NNe4UlbIfyF9DyFf2UFQF8M8VlBR/1WbZNTsNvjv2FbYEPGJZxGcRqhuPB5FlyKM9rpBJwOXih97Mtqos4M/Eo8H8eRxIUpS8WI7kLa6LQ7Moe9sW4Jsy0ZTpzKSqMbbMNFcHuSZS7hAbpu6/hnxDLRVw978cm/aSkx6tuw+/lSW5jyze0JXi+550xqRb+WshbEKvJdW5jqTuIpunHC+j+dhE+kGrr5bK+KHcdjvE0nxLDBNO/1pElFlJLBQaNWbVfgSevk6YMakMCcJXu5vB3bjCrUyedBdiRWBrYkYxMpgVhgoRaXHwipdVOSJrWlvCN4X/dowFCFgbEXbiKorQX3VOPANlB7N6HlPMOO/WjpdS/FQZanynDIgRR3dmuOOxr1YL9MT2uSHTzsI7YMXscyy409mcLMx6uj9Xyn4IChk6EiQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(376002)(366004)(396003)(346002)(54906003)(30864003)(55016002)(2906002)(33656002)(66946007)(1076003)(9686003)(4326008)(956004)(83380400001)(26005)(316002)(66476007)(52116002)(86362001)(186003)(16526019)(478600001)(6666004)(33716001)(6916009)(6496006)(66556008)(5660300002)(8676002)(8936002)(66574015)(579004)(559001)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?SAYe9SzTz8wsj9mtk3vTj5OrNOA5cM08YlqzeETVoueVfgTxLfLwYZT/29?=
 =?iso-8859-1?Q?e2aTGSH3R/bRpFkjI341JPHh7pPwPK9XqjMaJTC7LjTI+gyUpuwiR3QmkN?=
 =?iso-8859-1?Q?cq5d5R2uYy9WXAtgYpjk28Cz8pdIuGpmWyfO3pEyg9v19hr7hP25VXNaTK?=
 =?iso-8859-1?Q?O2/iryOWh3+14uC7woOaq7Gt/Cipm6JYbSBkaPu7rDixvDf9DFCk1n49Db?=
 =?iso-8859-1?Q?AWyZ+a3nRF9AchLJmxx74dmQbxpjZloWdWai/uzmQaXQD83iSyD6CKdDwv?=
 =?iso-8859-1?Q?LDopVBprwUqo81NJpdND4Szr/8MfhU0yMJbKVEP9aFdOsnNClFmma1P7kw?=
 =?iso-8859-1?Q?Dmb6/6KxWCkJ7132R76WY8Ig1r8PTRJ/cOIaeLaqHTAEbbKuOr0IzSrbK6?=
 =?iso-8859-1?Q?RueEnpw9x63cf9JaDk9bCvb9aYbCM8CjY6sIss5oEDUvAQUPFybGh1vfuX?=
 =?iso-8859-1?Q?84ifK9r1Rd76vc8qAyxRObX1L6cmygQoPQYe90Wdzvbg3LlUxXh4rrYbmn?=
 =?iso-8859-1?Q?ifqyrW/LgnDKfpLqBKLElCsbndg+gD7sWTo7oF/YOFnu53e9BeUSyJ3bma?=
 =?iso-8859-1?Q?Brptyja8pDlqgJR10ULllUIvftKXMjMJIglUOdFcdnhrTvbUBkw4gqoAvA?=
 =?iso-8859-1?Q?QQLah8iWpxHwoMe6vAW+/Ys56adWdq7aMaCbffCc8szciNmhUlv7iIPMOi?=
 =?iso-8859-1?Q?zeEDg5jvuSTRs0WHqivu0HRh08TGX+MxxPIZ2VMw4dsIowUVH8Hmhu8L8V?=
 =?iso-8859-1?Q?aSrTmTxzvRwXAUDCgxPV4ja2icDQw8xJ0ZpvgvZ5pcFwwiEGiHfvf5YVFQ?=
 =?iso-8859-1?Q?blzqu9pG76I1EKajPoEAdYVk28V9EiguIhAzPXtvwxRBeqsmqxchBLj1x8?=
 =?iso-8859-1?Q?Gby//TrVLb/+bkA9ZVxK4qt5SjoEOZhOVADRikarY/BJ1LPof9G/Z2mspf?=
 =?iso-8859-1?Q?Had4QdNnMXWGr4dqBpZmboJilN4l7RyqMT4gfgkjgIJef6hq3tiGtzY5qJ?=
 =?iso-8859-1?Q?JFrYcRaO0HG6lX62NdMV3Z8x09C0Tb2v/EFR1cU5x1m+s5GxqG8VdOO60k?=
 =?iso-8859-1?Q?HGZbs/RpIYjcIgEyTZ/juH9wq9qVEOG9hKcpMFpjC1Ho?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726689db-5b0a-4f69-f3f2-08d8beaf9346
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 08:27:37.9656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trg5AnkSRlFlasvlaQ05R4DvNJPj1bfeB7CpnjOwacQ0qGhdk2f8Lj61uxH5Wse3mM1v8Kyv9o9finPyZcQg0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2588
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 21, 2021 at 07:58:18PM +0800, Christian K=F6nig wrote:
> Rename ttm_bo_device to ttm_device.
> Rename ttm_bo_driver to ttm_device_funcs.
> Rename ttm_bo_global to ttm_global.
> =

> Move global and device related functions to ttm_device.[ch].
> =

> No functional change.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Acked-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   2 +-
>  .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c  |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c      |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  26 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h       |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   8 +-
>  drivers/gpu/drm/drm_gem_vram_helper.c         |  14 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.c          |  20 +-
>  drivers/gpu/drm/nouveau/nouveau_bo.h          |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_drv.h         |   2 +-
>  drivers/gpu/drm/nouveau/nouveau_sgdma.c       |   6 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c         |  10 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.h         |   8 +-
>  drivers/gpu/drm/qxl/qxl_drv.h                 |   4 +-
>  drivers/gpu/drm/qxl/qxl_release.c             |   6 +-
>  drivers/gpu/drm/qxl/qxl_ttm.c                 |  19 +-
>  drivers/gpu/drm/radeon/radeon.h               |   6 +-
>  drivers/gpu/drm/radeon/radeon_object.c        |   2 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c           |  38 +-
>  drivers/gpu/drm/ttm/Makefile                  |   2 +-
>  drivers/gpu/drm/ttm/ttm_agp_backend.c         |   2 +-
>  drivers/gpu/drm/ttm/ttm_bo.c                  | 256 +++-----------
>  drivers/gpu/drm/ttm/ttm_bo_util.c             |  24 +-
>  drivers/gpu/drm/ttm/ttm_bo_vm.c               |  24 +-
>  drivers/gpu/drm/ttm/ttm_device.c              | 195 +++++++++++
>  drivers/gpu/drm/ttm/ttm_execbuf_util.c        |   8 +-
>  drivers/gpu/drm/ttm/ttm_range_manager.c       |   4 +-
>  drivers/gpu/drm/ttm/ttm_resource.c            |   4 +-
>  drivers/gpu/drm/ttm/ttm_tt.c                  |  26 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c          |   4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            |   4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  16 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h           |   4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |   2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c    |  14 +-
>  include/drm/drm_gem_vram_helper.h             |   6 +-
>  include/drm/ttm/ttm_bo_api.h                  |  35 +-
>  include/drm/ttm/ttm_bo_driver.h               | 328 +-----------------
>  include/drm/ttm/ttm_device.h                  | 319 +++++++++++++++++
>  include/drm/ttm/ttm_resource.h                |   4 +-
>  include/drm/ttm/ttm_tt.h                      |  10 +-
>  41 files changed, 759 insertions(+), 715 deletions(-)
>  create mode 100644 drivers/gpu/drm/ttm/ttm_device.c
>  create mode 100644 include/drm/ttm/ttm_device.h
> =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/am=
dgpu/amdgpu.h
> index f77443cd9c17..ab4ac3b2651e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> @@ -1053,7 +1053,7 @@ static inline struct drm_device *adev_to_drm(struct=
 amdgpu_device *adev)
>  	return &adev->ddev;
>  }
>  =

> -static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_bo_device=
 *bdev)
> +static inline struct amdgpu_device *amdgpu_ttm_adev(struct ttm_device *b=
dev)
>  {
>  	return container_of(bdev, struct amdgpu_device, mman.bdev);
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c b/drivers/g=
pu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> index 3107b9575929..5af464933976 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
> @@ -40,13 +40,13 @@ static atomic_t fence_seq =3D ATOMIC_INIT(0);
>   * All the BOs in a process share an eviction fence. When process X wants
>   * to map VRAM memory but TTM can't find enough space, TTM will attempt =
to
>   * evict BOs from its LRU list. TTM checks if the BO is valuable to evict
> - * by calling ttm_bo_driver->eviction_valuable().
> + * by calling ttm_device_funcs->eviction_valuable().
>   *
> - * ttm_bo_driver->eviction_valuable() - will return false if the BO belo=
ngs
> + * ttm_device_funcs->eviction_valuable() - will return false if the BO b=
elongs
>   *  to process X. Otherwise, it will return true to indicate BO can be
>   *  evicted by TTM.
>   *
> - * If ttm_bo_driver->eviction_valuable returns true, then TTM will conti=
nue
> + * If ttm_device_funcs->eviction_valuable returns true, then TTM will co=
ntinue
>   * the evcition process for that BO by calling ttm_bo_evict --> amdgpu_b=
o_move
>   * --> amdgpu_copy_buffer(). This sets up job in GPU scheduler.
>   *
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_gart.c
> index 0db933026722..fde2d899b2c4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> @@ -71,7 +71,7 @@
>   */
>  static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
>  {
> -	struct page *dummy_page =3D ttm_bo_glob.dummy_read_page;
> +	struct page *dummy_page =3D ttm_glob.dummy_read_page;
>  =

>  	if (adev->dummy_page_addr)
>  		return 0;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.c
> index 9fd2157b133a..29cfb0809634 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -61,10 +61,10 @@
>  =

>  #define AMDGPU_TTM_VRAM_MAX_DW_READ	(size_t)128
>  =

> -static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
> +static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>  				   struct ttm_tt *ttm,
>  				   struct ttm_resource *bo_mem);
> -static void amdgpu_ttm_backend_unbind(struct ttm_bo_device *bdev,
> +static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
>  				      struct ttm_tt *ttm);
>  =

>  static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
> @@ -646,7 +646,7 @@ static int amdgpu_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>   *
>   * Called by ttm_mem_io_reserve() ultimately via ttm_bo_vm_fault()
>   */
> -static int amdgpu_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct =
ttm_resource *mem)
> +static int amdgpu_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm=
_resource *mem)
>  {
>  	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
>  	struct drm_mm_node *mm_node =3D mem->mm_node;
> @@ -893,7 +893,7 @@ void amdgpu_ttm_tt_set_user_pages(struct ttm_tt *ttm,=
 struct page **pages)
>   *
>   * Called by amdgpu_ttm_backend_bind()
>   **/
> -static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_device *bdev,
> +static int amdgpu_ttm_tt_pin_userptr(struct ttm_device *bdev,
>  				     struct ttm_tt *ttm)
>  {
>  	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
> @@ -931,7 +931,7 @@ static int amdgpu_ttm_tt_pin_userptr(struct ttm_bo_de=
vice *bdev,
>  /*
>   * amdgpu_ttm_tt_unpin_userptr - Unpin and unmap userptr pages
>   */
> -static void amdgpu_ttm_tt_unpin_userptr(struct ttm_bo_device *bdev,
> +static void amdgpu_ttm_tt_unpin_userptr(struct ttm_device *bdev,
>  					struct ttm_tt *ttm)
>  {
>  	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
> @@ -1015,7 +1015,7 @@ static int amdgpu_ttm_gart_bind(struct amdgpu_devic=
e *adev,
>   * Called by ttm_tt_bind() on behalf of ttm_bo_handle_move_mem().
>   * This handles binding GTT memory to the device address space.
>   */
> -static int amdgpu_ttm_backend_bind(struct ttm_bo_device *bdev,
> +static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>  				   struct ttm_tt *ttm,
>  				   struct ttm_resource *bo_mem)
>  {
> @@ -1155,7 +1155,7 @@ int amdgpu_ttm_recover_gart(struct ttm_buffer_objec=
t *tbo)
>   * Called by ttm_tt_unbind() on behalf of ttm_bo_move_ttm() and
>   * ttm_tt_destroy().
>   */
> -static void amdgpu_ttm_backend_unbind(struct ttm_bo_device *bdev,
> +static void amdgpu_ttm_backend_unbind(struct ttm_device *bdev,
>  				      struct ttm_tt *ttm)
>  {
>  	struct amdgpu_device *adev =3D amdgpu_ttm_adev(bdev);
> @@ -1180,7 +1180,7 @@ static void amdgpu_ttm_backend_unbind(struct ttm_bo=
_device *bdev,
>  	gtt->bound =3D false;
>  }
>  =

> -static void amdgpu_ttm_backend_destroy(struct ttm_bo_device *bdev,
> +static void amdgpu_ttm_backend_destroy(struct ttm_device *bdev,
>  				       struct ttm_tt *ttm)
>  {
>  	struct amdgpu_ttm_tt *gtt =3D (void *)ttm;
> @@ -1234,7 +1234,7 @@ static struct ttm_tt *amdgpu_ttm_tt_create(struct t=
tm_buffer_object *bo,
>   * Map the pages of a ttm_tt object to an address space visible
>   * to the underlying device.
>   */
> -static int amdgpu_ttm_tt_populate(struct ttm_bo_device *bdev,
> +static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
>  				  struct ttm_tt *ttm,
>  				  struct ttm_operation_ctx *ctx)
>  {
> @@ -1278,7 +1278,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_bo_dev=
ice *bdev,
>   * Unmaps pages of a ttm_tt object from the device address space and
>   * unpopulates the page array backing it.
>   */
> -static void amdgpu_ttm_tt_unpopulate(struct ttm_bo_device *bdev,
> +static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
>  				     struct ttm_tt *ttm)
>  {
>  	struct amdgpu_ttm_tt *gtt =3D (void *)ttm;
> @@ -1603,7 +1603,7 @@ amdgpu_bo_delete_mem_notify(struct ttm_buffer_objec=
t *bo)
>  	amdgpu_bo_move_notify(bo, false, NULL);
>  }
>  =

> -static struct ttm_bo_driver amdgpu_bo_driver =3D {
> +static struct ttm_device_funcs amdgpu_bo_driver =3D {
>  	.ttm_tt_create =3D &amdgpu_ttm_tt_create,
>  	.ttm_tt_populate =3D &amdgpu_ttm_tt_populate,
>  	.ttm_tt_unpopulate =3D &amdgpu_ttm_tt_unpopulate,
> @@ -1785,7 +1785,7 @@ int amdgpu_ttm_init(struct amdgpu_device *adev)
>  	mutex_init(&adev->mman.gtt_window_lock);
>  =

>  	/* No others user of address space so set it to 0 */
> -	r =3D ttm_bo_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
> +	r =3D ttm_device_init(&adev->mman.bdev, &amdgpu_bo_driver, adev->dev,
>  			       adev_to_drm(adev)->anon_inode->i_mapping,
>  			       adev_to_drm(adev)->vma_offset_manager,
>  			       adev->need_swiotlb,
> @@ -1926,7 +1926,7 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>  	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GDS);
>  	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_GWS);
>  	ttm_range_man_fini(&adev->mman.bdev, AMDGPU_PL_OA);
> -	ttm_bo_device_release(&adev->mman.bdev);
> +	ttm_device_fini(&adev->mman.bdev);
>  	adev->mman.initialized =3D false;
>  	DRM_INFO("amdgpu: ttm finalized\n");
>  }
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ttm.h
> index d2987536d7cd..7189f8370108 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -60,7 +60,7 @@ struct amdgpu_gtt_mgr {
>  };
>  =

>  struct amdgpu_mman {
> -	struct ttm_bo_device		bdev;
> +	struct ttm_device		bdev;
>  	bool				initialized;
>  	void __iomem			*aper_base_kaddr;
>  =

> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd=
/amdgpu/amdgpu_vm.c
> index ad91c0c3c423..9d19078246c8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -638,15 +638,15 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_devic=
e *adev,
>  	struct amdgpu_vm_bo_base *bo_base;
>  =

>  	if (vm->bulk_moveable) {
> -		spin_lock(&ttm_bo_glob.lru_lock);
> +		spin_lock(&ttm_glob.lru_lock);
>  		ttm_bo_bulk_move_lru_tail(&vm->lru_bulk_move);
> -		spin_unlock(&ttm_bo_glob.lru_lock);
> +		spin_unlock(&ttm_glob.lru_lock);
>  		return;
>  	}
>  =

>  	memset(&vm->lru_bulk_move, 0, sizeof(vm->lru_bulk_move));
>  =

> -	spin_lock(&ttm_bo_glob.lru_lock);
> +	spin_lock(&ttm_glob.lru_lock);
>  	list_for_each_entry(bo_base, &vm->idle, vm_status) {
>  		struct amdgpu_bo *bo =3D bo_base->bo;
>  =

> @@ -660,7 +660,7 @@ void amdgpu_vm_move_to_lru_tail(struct amdgpu_device =
*adev,
>  						&bo->shadow->tbo.mem,
>  						&vm->lru_bulk_move);
>  	}
> -	spin_unlock(&ttm_bo_glob.lru_lock);
> +	spin_unlock(&ttm_glob.lru_lock);
>  =

>  	vm->bulk_moveable =3D true;
>  }
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_=
gem_vram_helper.c
> index 02ca22e90290..0b13c8507688 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -187,7 +187,7 @@ struct drm_gem_vram_object *drm_gem_vram_create(struc=
t drm_device *dev,
>  	struct drm_gem_vram_object *gbo;
>  	struct drm_gem_object *gem;
>  	struct drm_vram_mm *vmm =3D dev->vram_mm;
> -	struct ttm_bo_device *bdev;
> +	struct ttm_device *bdev;
>  	int ret;
>  	size_t acc_size;
>  =

> @@ -551,7 +551,7 @@ int drm_gem_vram_fill_create_dumb(struct drm_file *fi=
le,
>  EXPORT_SYMBOL(drm_gem_vram_fill_create_dumb);
>  =

>  /*
> - * Helpers for struct ttm_bo_driver
> + * Helpers for struct ttm_device_funcs
>   */
>  =

>  static bool drm_is_gem_vram(struct ttm_buffer_object *bo)
> @@ -893,7 +893,7 @@ static const struct drm_gem_object_funcs drm_gem_vram=
_object_funcs =3D {
>   * TTM TT
>   */
>  =

> -static void bo_driver_ttm_tt_destroy(struct ttm_bo_device *bdev, struct =
ttm_tt *tt)
> +static void bo_driver_ttm_tt_destroy(struct ttm_device *bdev, struct ttm=
_tt *tt)
>  {
>  	ttm_tt_destroy_common(bdev, tt);
>  	ttm_tt_fini(tt);
> @@ -965,7 +965,7 @@ static int bo_driver_move(struct ttm_buffer_object *b=
o,
>  	return drm_gem_vram_bo_driver_move(gbo, evict, ctx, new_mem);
>  }
>  =

> -static int bo_driver_io_mem_reserve(struct ttm_bo_device *bdev,
> +static int bo_driver_io_mem_reserve(struct ttm_device *bdev,
>  				    struct ttm_resource *mem)
>  {
>  	struct drm_vram_mm *vmm =3D drm_vram_mm_of_bdev(bdev);
> @@ -985,7 +985,7 @@ static int bo_driver_io_mem_reserve(struct ttm_bo_dev=
ice *bdev,
>  	return 0;
>  }
>  =

> -static struct ttm_bo_driver bo_driver =3D {
> +static struct ttm_device_funcs bo_driver =3D {
>  	.ttm_tt_create =3D bo_driver_ttm_tt_create,
>  	.ttm_tt_destroy =3D bo_driver_ttm_tt_destroy,
>  	.eviction_valuable =3D ttm_bo_eviction_valuable,
> @@ -1036,7 +1036,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm=
, struct drm_device *dev,
>  	vmm->vram_base =3D vram_base;
>  	vmm->vram_size =3D vram_size;
>  =

> -	ret =3D ttm_bo_device_init(&vmm->bdev, &bo_driver, dev->dev,
> +	ret =3D ttm_device_init(&vmm->bdev, &bo_driver, dev->dev,
>  				 dev->anon_inode->i_mapping,
>  				 dev->vma_offset_manager,
>  				 false, true);
> @@ -1054,7 +1054,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm=
, struct drm_device *dev,
>  static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
>  {
>  	ttm_range_man_fini(&vmm->bdev, TTM_PL_VRAM);
> -	ttm_bo_device_release(&vmm->bdev);
> +	ttm_device_fini(&vmm->bdev);
>  }
>  =

>  /*
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouve=
au/nouveau_bo.c
> index 33dc886d1d6d..c177940d6e2c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -43,9 +43,9 @@
>  #include <nvif/if500b.h>
>  #include <nvif/if900b.h>
>  =

> -static int nouveau_ttm_tt_bind(struct ttm_bo_device *bdev, struct ttm_tt=
 *ttm,
> +static int nouveau_ttm_tt_bind(struct ttm_device *bdev, struct ttm_tt *t=
tm,
>  			       struct ttm_resource *reg);
> -static void nouveau_ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm=
_tt *ttm);
> +static void nouveau_ttm_tt_unbind(struct ttm_device *bdev, struct ttm_tt=
 *ttm);
>  =

>  /*
>   * NV10-NV40 tiling helpers
> @@ -674,7 +674,7 @@ nouveau_ttm_tt_create(struct ttm_buffer_object *bo, u=
int32_t page_flags)
>  }
>  =

>  static int
> -nouveau_ttm_tt_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm,
> +nouveau_ttm_tt_bind(struct ttm_device *bdev, struct ttm_tt *ttm,
>  		    struct ttm_resource *reg)
>  {
>  #if IS_ENABLED(CONFIG_AGP)
> @@ -690,7 +690,7 @@ nouveau_ttm_tt_bind(struct ttm_bo_device *bdev, struc=
t ttm_tt *ttm,
>  }
>  =

>  static void
> -nouveau_ttm_tt_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> +nouveau_ttm_tt_unbind(struct ttm_device *bdev, struct ttm_tt *ttm)
>  {
>  #if IS_ENABLED(CONFIG_AGP)
>  	struct nouveau_drm *drm =3D nouveau_bdev(bdev);
> @@ -1055,7 +1055,7 @@ nouveau_ttm_io_mem_free_locked(struct nouveau_drm *=
drm,
>  }
>  =

>  static int
> -nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm_resour=
ce *reg)
> +nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource =
*reg)
>  {
>  	struct nouveau_drm *drm =3D nouveau_bdev(bdev);
>  	struct nvkm_device *device =3D nvxx_device(&drm->client.device);
> @@ -1163,7 +1163,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_bo_device *bd=
ev, struct ttm_resource *reg)
>  }
>  =

>  static void
> -nouveau_ttm_io_mem_free(struct ttm_bo_device *bdev, struct ttm_resource =
*reg)
> +nouveau_ttm_io_mem_free(struct ttm_device *bdev, struct ttm_resource *re=
g)
>  {
>  	struct nouveau_drm *drm =3D nouveau_bdev(bdev);
>  =

> @@ -1223,7 +1223,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct =
ttm_buffer_object *bo)
>  }
>  =

>  static int
> -nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
> +nouveau_ttm_tt_populate(struct ttm_device *bdev,
>  			struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>  {
>  	struct ttm_tt *ttm_dma =3D (void *)ttm;
> @@ -1247,7 +1247,7 @@ nouveau_ttm_tt_populate(struct ttm_bo_device *bdev,
>  }
>  =

>  static void
> -nouveau_ttm_tt_unpopulate(struct ttm_bo_device *bdev,
> +nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
>  			  struct ttm_tt *ttm)
>  {
>  	struct nouveau_drm *drm;
> @@ -1264,7 +1264,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_bo_device *bde=
v,
>  }
>  =

>  static void
> -nouveau_ttm_tt_destroy(struct ttm_bo_device *bdev,
> +nouveau_ttm_tt_destroy(struct ttm_device *bdev,
>  		       struct ttm_tt *ttm)
>  {
>  #if IS_ENABLED(CONFIG_AGP)
> @@ -1296,7 +1296,7 @@ nouveau_bo_delete_mem_notify(struct ttm_buffer_obje=
ct *bo)
>  	nouveau_bo_move_ntfy(bo, false, NULL);
>  }
>  =

> -struct ttm_bo_driver nouveau_bo_driver =3D {
> +struct ttm_device_funcs nouveau_bo_driver =3D {
>  	.ttm_tt_create =3D &nouveau_ttm_tt_create,
>  	.ttm_tt_populate =3D &nouveau_ttm_tt_populate,
>  	.ttm_tt_unpopulate =3D &nouveau_ttm_tt_unpopulate,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouve=
au/nouveau_bo.h
> index 6045b85a762a..c2d3f9c48eba 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
> @@ -68,7 +68,7 @@ nouveau_bo_ref(struct nouveau_bo *ref, struct nouveau_b=
o **pnvbo)
>  	return 0;
>  }
>  =

> -extern struct ttm_bo_driver nouveau_bo_driver;
> +extern struct ttm_device_funcs nouveau_bo_driver;
>  =

>  void nouveau_bo_move_init(struct nouveau_drm *);
>  struct nouveau_bo *nouveau_bo_alloc(struct nouveau_cli *, u64 *size, int=
 *align,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouv=
eau/nouveau_drv.h
> index c802d3d1ba39..edf9d1ee9d58 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -151,7 +151,7 @@ struct nouveau_drm {
>  =

>  	/* TTM interface support */
>  	struct {
> -		struct ttm_bo_device bdev;
> +		struct ttm_device bdev;
>  		atomic_t validate_sequence;
>  		int (*move)(struct nouveau_channel *,
>  			    struct ttm_buffer_object *,
> diff --git a/drivers/gpu/drm/nouveau/nouveau_sgdma.c b/drivers/gpu/drm/no=
uveau/nouveau_sgdma.c
> index 1cf52635ea74..256ec5b35473 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_sgdma.c
> @@ -16,7 +16,7 @@ struct nouveau_sgdma_be {
>  };
>  =

>  void
> -nouveau_sgdma_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> +nouveau_sgdma_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>  {
>  	struct nouveau_sgdma_be *nvbe =3D (struct nouveau_sgdma_be *)ttm;
>  =

> @@ -29,7 +29,7 @@ nouveau_sgdma_destroy(struct ttm_bo_device *bdev, struc=
t ttm_tt *ttm)
>  }
>  =

>  int
> -nouveau_sgdma_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm, struc=
t ttm_resource *reg)
> +nouveau_sgdma_bind(struct ttm_device *bdev, struct ttm_tt *ttm, struct t=
tm_resource *reg)
>  {
>  	struct nouveau_sgdma_be *nvbe =3D (struct nouveau_sgdma_be *)ttm;
>  	struct nouveau_drm *drm =3D nouveau_bdev(bdev);
> @@ -56,7 +56,7 @@ nouveau_sgdma_bind(struct ttm_bo_device *bdev, struct t=
tm_tt *ttm, struct ttm_re
>  }
>  =

>  void
> -nouveau_sgdma_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> +nouveau_sgdma_unbind(struct ttm_device *bdev, struct ttm_tt *ttm)
>  {
>  	struct nouveau_sgdma_be *nvbe =3D (struct nouveau_sgdma_be *)ttm;
>  	if (nvbe->mem) {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouv=
eau/nouveau_ttm.c
> index a37bc3d7b38b..495288182c2d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -324,10 +324,10 @@ nouveau_ttm_init(struct nouveau_drm *drm)
>  	need_swiotlb =3D !!swiotlb_nr_tbl();
>  #endif
>  =

> -	ret =3D ttm_bo_device_init(&drm->ttm.bdev, &nouveau_bo_driver,
> -				 drm->dev->dev, dev->anon_inode->i_mapping,
> -				 dev->vma_offset_manager, need_swiotlb,
> -				 drm->client.mmu.dmabits <=3D 32);
> +	ret =3D ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->d=
ev,
> +				  dev->anon_inode->i_mapping,
> +				  dev->vma_offset_manager, need_swiotlb,
> +				  drm->client.mmu.dmabits <=3D 32);
>  	if (ret) {
>  		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
>  		return ret;
> @@ -377,7 +377,7 @@ nouveau_ttm_fini(struct nouveau_drm *drm)
>  	nouveau_ttm_fini_vram(drm);
>  	nouveau_ttm_fini_gtt(drm);
>  =

> -	ttm_bo_device_release(&drm->ttm.bdev);
> +	ttm_device_fini(&drm->ttm.bdev);
>  =

>  	arch_phys_wc_del(drm->ttm.mtrr);
>  	drm->ttm.mtrr =3D 0;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.h b/drivers/gpu/drm/nouv=
eau/nouveau_ttm.h
> index 69552049bb96..dbf6dc238efd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.h
> @@ -3,7 +3,7 @@
>  #define __NOUVEAU_TTM_H__
>  =

>  static inline struct nouveau_drm *
> -nouveau_bdev(struct ttm_bo_device *bd)
> +nouveau_bdev(struct ttm_device *bd)
>  {
>  	return container_of(bd, struct nouveau_drm, ttm.bdev);
>  }
> @@ -22,7 +22,7 @@ int  nouveau_ttm_mmap(struct file *, struct vm_area_str=
uct *);
>  int  nouveau_ttm_global_init(struct nouveau_drm *);
>  void nouveau_ttm_global_release(struct nouveau_drm *);
>  =

> -int nouveau_sgdma_bind(struct ttm_bo_device *bdev, struct ttm_tt *ttm, s=
truct ttm_resource *reg);
> -void nouveau_sgdma_unbind(struct ttm_bo_device *bdev, struct ttm_tt *ttm=
);
> -void nouveau_sgdma_destroy(struct ttm_bo_device *bdev, struct ttm_tt *tt=
m);
> +int nouveau_sgdma_bind(struct ttm_device *bdev, struct ttm_tt *ttm, stru=
ct ttm_resource *reg);
> +void nouveau_sgdma_unbind(struct ttm_device *bdev, struct ttm_tt *ttm);
> +void nouveau_sgdma_destroy(struct ttm_device *bdev, struct ttm_tt *ttm);
>  #endif
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
> index 83b54f0dad61..01354b43c413 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.h
> +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> @@ -125,7 +125,7 @@ struct qxl_output {
>  #define drm_encoder_to_qxl_output(x) container_of(x, struct qxl_output, =
enc)
>  =

>  struct qxl_mman {
> -	struct ttm_bo_device		bdev;
> +	struct ttm_device		bdev;
>  };
>  =

>  struct qxl_memslot {
> @@ -335,7 +335,7 @@ int qxl_mode_dumb_mmap(struct drm_file *filp,
>  /* qxl ttm */
>  int qxl_ttm_init(struct qxl_device *qdev);
>  void qxl_ttm_fini(struct qxl_device *qdev);
> -int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
> +int qxl_ttm_io_mem_reserve(struct ttm_device *bdev,
>  			   struct ttm_resource *mem);
>  =

>  /* qxl image */
> diff --git a/drivers/gpu/drm/qxl/qxl_release.c b/drivers/gpu/drm/qxl/qxl_=
release.c
> index 0fcfc952d5e9..c52412724c26 100644
> --- a/drivers/gpu/drm/qxl/qxl_release.c
> +++ b/drivers/gpu/drm/qxl/qxl_release.c
> @@ -429,7 +429,7 @@ void qxl_release_unmap(struct qxl_device *qdev,
>  void qxl_release_fence_buffer_objects(struct qxl_release *release)
>  {
>  	struct ttm_buffer_object *bo;
> -	struct ttm_bo_device *bdev;
> +	struct ttm_device *bdev;
>  	struct ttm_validate_buffer *entry;
>  	struct qxl_device *qdev;
>  =

> @@ -450,7 +450,7 @@ void qxl_release_fence_buffer_objects(struct qxl_rele=
ase *release)
>  		       release->id | 0xf0000000, release->base.seqno);
>  	trace_dma_fence_emit(&release->base);
>  =

> -	spin_lock(&ttm_bo_glob.lru_lock);
> +	spin_lock(&ttm_glob.lru_lock);
>  =

>  	list_for_each_entry(entry, &release->bos, head) {
>  		bo =3D entry->bo;
> @@ -459,7 +459,7 @@ void qxl_release_fence_buffer_objects(struct qxl_rele=
ase *release)
>  		ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
>  		dma_resv_unlock(bo->base.resv);
>  	}
> -	spin_unlock(&ttm_bo_glob.lru_lock);
> +	spin_unlock(&ttm_glob.lru_lock);
>  	ww_acquire_fini(&release->ticket);
>  }
>  =

> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 33c09dc94f8b..b7f77eb685cb 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -36,7 +36,7 @@
>  #include "qxl_drv.h"
>  #include "qxl_object.h"
>  =

> -static struct qxl_device *qxl_get_qdev(struct ttm_bo_device *bdev)
> +static struct qxl_device *qxl_get_qdev(struct ttm_device *bdev)
>  {
>  	struct qxl_mman *mman;
>  	struct qxl_device *qdev;
> @@ -69,7 +69,7 @@ static void qxl_evict_flags(struct ttm_buffer_object *b=
o,
>  	*placement =3D qbo->placement;
>  }
>  =

> -int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
> +int qxl_ttm_io_mem_reserve(struct ttm_device *bdev,
>  			   struct ttm_resource *mem)
>  {
>  	struct qxl_device *qdev =3D qxl_get_qdev(bdev);
> @@ -98,8 +98,7 @@ int qxl_ttm_io_mem_reserve(struct ttm_bo_device *bdev,
>  /*
>   * TTM backend functions.
>   */
> -static void qxl_ttm_backend_destroy(struct ttm_bo_device *bdev,
> -				    struct ttm_tt *ttm)
> +static void qxl_ttm_backend_destroy(struct ttm_device *bdev, struct ttm_=
tt *ttm)
>  {
>  	ttm_tt_destroy_common(bdev, ttm);
>  	ttm_tt_fini(ttm);
> @@ -170,7 +169,7 @@ static void qxl_bo_delete_mem_notify(struct ttm_buffe=
r_object *bo)
>  	qxl_bo_move_notify(bo, false, NULL);
>  }
>  =

> -static struct ttm_bo_driver qxl_bo_driver =3D {
> +static struct ttm_device_funcs qxl_bo_driver =3D {
>  	.ttm_tt_create =3D &qxl_ttm_tt_create,
>  	.ttm_tt_destroy =3D &qxl_ttm_backend_destroy,
>  	.eviction_valuable =3D ttm_bo_eviction_valuable,
> @@ -193,10 +192,10 @@ int qxl_ttm_init(struct qxl_device *qdev)
>  	int num_io_pages; /* !=3D rom->num_io_pages, we include surface0 */
>  =

>  	/* No others user of address space so set it to 0 */
> -	r =3D ttm_bo_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
> -			       qdev->ddev.anon_inode->i_mapping,
> -			       qdev->ddev.vma_offset_manager,
> -			       false, false);
> +	r =3D ttm_device_init(&qdev->mman.bdev, &qxl_bo_driver, NULL,
> +			    qdev->ddev.anon_inode->i_mapping,
> +			    qdev->ddev.vma_offset_manager,
> +			    false, false);
>  	if (r) {
>  		DRM_ERROR("failed initializing buffer object driver(%d).\n", r);
>  		return r;
> @@ -227,7 +226,7 @@ void qxl_ttm_fini(struct qxl_device *qdev)
>  {
>  	ttm_range_man_fini(&qdev->mman.bdev, TTM_PL_VRAM);
>  	ttm_range_man_fini(&qdev->mman.bdev, TTM_PL_PRIV);
> -	ttm_bo_device_release(&qdev->mman.bdev);
> +	ttm_device_fini(&qdev->mman.bdev);
>  	DRM_INFO("qxl: ttm finalized\n");
>  }
>  =

> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/rad=
eon.h
> index f09989bdce98..449ba0095ed9 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -451,7 +451,7 @@ struct radeon_surface_reg {
>   * TTM.
>   */
>  struct radeon_mman {
> -	struct ttm_bo_device		bdev;
> +	struct ttm_device		bdev;
>  	bool				initialized;
>  =

>  #if defined(CONFIG_DEBUG_FS)
> @@ -2822,7 +2822,7 @@ extern int radeon_ttm_tt_set_userptr(struct radeon_=
device *rdev,
>  				     uint32_t flags);
>  extern bool radeon_ttm_tt_has_userptr(struct radeon_device *rdev, struct=
 ttm_tt *ttm);
>  extern bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev, struct=
 ttm_tt *ttm);
> -bool radeon_ttm_tt_is_bound(struct ttm_bo_device *bdev, struct ttm_tt *t=
tm);
> +bool radeon_ttm_tt_is_bound(struct ttm_device *bdev, struct ttm_tt *ttm);
>  extern void radeon_vram_location(struct radeon_device *rdev, struct rade=
on_mc *mc, u64 base);
>  extern void radeon_gtt_location(struct radeon_device *rdev, struct radeo=
n_mc *mc);
>  extern int radeon_resume_kms(struct drm_device *dev, bool resume, bool f=
bcon);
> @@ -2832,7 +2832,7 @@ extern void radeon_ttm_set_active_vram_size(struct =
radeon_device *rdev, u64 size
>  extern void radeon_program_register_sequence(struct radeon_device *rdev,
>  					     const u32 *registers,
>  					     const u32 array_size);
> -struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev);
> +struct radeon_device *radeon_get_rdev(struct ttm_device *bdev);
>  =

>  /* KMS */
>  =

> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/rad=
eon/radeon_object.c
> index 9b81786782de..6a336284466f 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -372,7 +372,7 @@ void radeon_bo_unpin(struct radeon_bo *bo)
>  =

>  int radeon_bo_evict_vram(struct radeon_device *rdev)
>  {
> -	struct ttm_bo_device *bdev =3D &rdev->mman.bdev;
> +	struct ttm_device *bdev =3D &rdev->mman.bdev;
>  	struct ttm_resource_manager *man;
>  =

>  	/* late 2.6.33 fix IGP hibernate - we need pm ops to do this correct */
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index c6d575f50c48..5ed6a48246d6 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -55,13 +55,11 @@
>  static int radeon_ttm_debugfs_init(struct radeon_device *rdev);
>  static void radeon_ttm_debugfs_fini(struct radeon_device *rdev);
>  =

> -static int radeon_ttm_tt_bind(struct ttm_bo_device *bdev,
> -			      struct ttm_tt *ttm,
> +static int radeon_ttm_tt_bind(struct ttm_device *bdev, struct ttm_tt *tt=
m,
>  			      struct ttm_resource *bo_mem);
> -static void radeon_ttm_tt_unbind(struct ttm_bo_device *bdev,
> -				 struct ttm_tt *ttm);
> +static void radeon_ttm_tt_unbind(struct ttm_device *bdev, struct ttm_tt =
*ttm);
>  =

> -struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
> +struct radeon_device *radeon_get_rdev(struct ttm_device *bdev)
>  {
>  	struct radeon_mman *mman;
>  	struct radeon_device *rdev;
> @@ -280,7 +278,7 @@ static int radeon_bo_move(struct ttm_buffer_object *b=
o, bool evict,
>  	return 0;
>  }
>  =

> -static int radeon_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct =
ttm_resource *mem)
> +static int radeon_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm=
_resource *mem)
>  {
>  	struct radeon_device *rdev =3D radeon_get_rdev(bdev);
>  	size_t bus_size =3D (size_t)mem->num_pages << PAGE_SHIFT;
> @@ -347,7 +345,7 @@ struct radeon_ttm_tt {
>  };
>  =

>  /* prepare the sg table with the user pages */
> -static int radeon_ttm_tt_pin_userptr(struct ttm_bo_device *bdev, struct =
ttm_tt *ttm)
> +static int radeon_ttm_tt_pin_userptr(struct ttm_device *bdev, struct ttm=
_tt *ttm)
>  {
>  	struct radeon_device *rdev =3D radeon_get_rdev(bdev);
>  	struct radeon_ttm_tt *gtt =3D (void *)ttm;
> @@ -408,7 +406,7 @@ static int radeon_ttm_tt_pin_userptr(struct ttm_bo_de=
vice *bdev, struct ttm_tt *
>  	return r;
>  }
>  =

> -static void radeon_ttm_tt_unpin_userptr(struct ttm_bo_device *bdev, stru=
ct ttm_tt *ttm)
> +static void radeon_ttm_tt_unpin_userptr(struct ttm_device *bdev, struct =
ttm_tt *ttm)
>  {
>  	struct radeon_device *rdev =3D radeon_get_rdev(bdev);
>  	struct radeon_ttm_tt *gtt =3D (void *)ttm;
> @@ -444,7 +442,7 @@ static bool radeon_ttm_backend_is_bound(struct ttm_tt=
 *ttm)
>  	return (gtt->bound);
>  }
>  =

> -static int radeon_ttm_backend_bind(struct ttm_bo_device *bdev,
> +static int radeon_ttm_backend_bind(struct ttm_device *bdev,
>  				   struct ttm_tt *ttm,
>  				   struct ttm_resource *bo_mem)
>  {
> @@ -480,7 +478,7 @@ static int radeon_ttm_backend_bind(struct ttm_bo_devi=
ce *bdev,
>  	return 0;
>  }
>  =

> -static void radeon_ttm_backend_unbind(struct ttm_bo_device *bdev, struct=
 ttm_tt *ttm)
> +static void radeon_ttm_backend_unbind(struct ttm_device *bdev, struct tt=
m_tt *ttm)
>  {
>  	struct radeon_ttm_tt *gtt =3D (void *)ttm;
>  	struct radeon_device *rdev =3D radeon_get_rdev(bdev);
> @@ -495,7 +493,7 @@ static void radeon_ttm_backend_unbind(struct ttm_bo_d=
evice *bdev, struct ttm_tt
>  	gtt->bound =3D false;
>  }
>  =

> -static void radeon_ttm_backend_destroy(struct ttm_bo_device *bdev, struc=
t ttm_tt *ttm)
> +static void radeon_ttm_backend_destroy(struct ttm_device *bdev, struct t=
tm_tt *ttm)
>  {
>  	struct radeon_ttm_tt *gtt =3D (void *)ttm;
>  =

> @@ -554,7 +552,7 @@ static struct radeon_ttm_tt *radeon_ttm_tt_to_gtt(str=
uct radeon_device *rdev,
>  	return container_of(ttm, struct radeon_ttm_tt, ttm);
>  }
>  =

> -static int radeon_ttm_tt_populate(struct ttm_bo_device *bdev,
> +static int radeon_ttm_tt_populate(struct ttm_device *bdev,
>  				  struct ttm_tt *ttm,
>  				  struct ttm_operation_ctx *ctx)
>  {
> @@ -580,7 +578,7 @@ static int radeon_ttm_tt_populate(struct ttm_bo_devic=
e *bdev,
>  	return ttm_pool_alloc(&rdev->mman.bdev.pool, ttm, ctx);
>  }
>  =

> -static void radeon_ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct =
ttm_tt *ttm)
> +static void radeon_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm=
_tt *ttm)
>  {
>  	struct radeon_device *rdev =3D radeon_get_rdev(bdev);
>  	struct radeon_ttm_tt *gtt =3D radeon_ttm_tt_to_gtt(rdev, ttm);
> @@ -613,7 +611,7 @@ int radeon_ttm_tt_set_userptr(struct radeon_device *r=
dev,
>  	return 0;
>  }
>  =

> -bool radeon_ttm_tt_is_bound(struct ttm_bo_device *bdev,
> +bool radeon_ttm_tt_is_bound(struct ttm_device *bdev,
>  			    struct ttm_tt *ttm)
>  {
>  #if IS_ENABLED(CONFIG_AGP)
> @@ -624,7 +622,7 @@ bool radeon_ttm_tt_is_bound(struct ttm_bo_device *bde=
v,
>  	return radeon_ttm_backend_is_bound(ttm);
>  }
>  =

> -static int radeon_ttm_tt_bind(struct ttm_bo_device *bdev,
> +static int radeon_ttm_tt_bind(struct ttm_device *bdev,
>  			      struct ttm_tt *ttm,
>  			      struct ttm_resource *bo_mem)
>  {
> @@ -642,7 +640,7 @@ static int radeon_ttm_tt_bind(struct ttm_bo_device *b=
dev,
>  	return radeon_ttm_backend_bind(bdev, ttm, bo_mem);
>  }
>  =

> -static void radeon_ttm_tt_unbind(struct ttm_bo_device *bdev,
> +static void radeon_ttm_tt_unbind(struct ttm_device *bdev,
>  				 struct ttm_tt *ttm)
>  {
>  #if IS_ENABLED(CONFIG_AGP)
> @@ -656,7 +654,7 @@ static void radeon_ttm_tt_unbind(struct ttm_bo_device=
 *bdev,
>  	radeon_ttm_backend_unbind(bdev, ttm);
>  }
>  =

> -static void radeon_ttm_tt_destroy(struct ttm_bo_device *bdev,
> +static void radeon_ttm_tt_destroy(struct ttm_device *bdev,
>  				  struct ttm_tt *ttm)
>  {
>  #if IS_ENABLED(CONFIG_AGP)
> @@ -700,7 +698,7 @@ radeon_bo_delete_mem_notify(struct ttm_buffer_object =
*bo)
>  	radeon_bo_move_notify(bo, false, NULL);
>  }
>  =

> -static struct ttm_bo_driver radeon_bo_driver =3D {
> +static struct ttm_device_funcs radeon_bo_driver =3D {
>  	.ttm_tt_create =3D &radeon_ttm_tt_create,
>  	.ttm_tt_populate =3D &radeon_ttm_tt_populate,
>  	.ttm_tt_unpopulate =3D &radeon_ttm_tt_unpopulate,
> @@ -718,7 +716,7 @@ int radeon_ttm_init(struct radeon_device *rdev)
>  	int r;
>  =

>  	/* No others user of address space so set it to 0 */
> -	r =3D ttm_bo_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->dev,
> +	r =3D ttm_device_init(&rdev->mman.bdev, &radeon_bo_driver, rdev->dev,
>  			       rdev->ddev->anon_inode->i_mapping,
>  			       rdev->ddev->vma_offset_manager,
>  			       rdev->need_swiotlb,
> @@ -791,7 +789,7 @@ void radeon_ttm_fini(struct radeon_device *rdev)
>  	}
>  	ttm_range_man_fini(&rdev->mman.bdev, TTM_PL_VRAM);
>  	ttm_range_man_fini(&rdev->mman.bdev, TTM_PL_TT);
> -	ttm_bo_device_release(&rdev->mman.bdev);
> +	ttm_device_fini(&rdev->mman.bdev);
>  	radeon_gart_fini(rdev);
>  	rdev->mman.initialized =3D false;
>  	DRM_INFO("radeon: ttm finalized\n");
> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
> index b6f5f87b270f..8e6437eadabe 100644
> --- a/drivers/gpu/drm/ttm/Makefile
> +++ b/drivers/gpu/drm/ttm/Makefile
> @@ -5,7 +5,7 @@
>  ttm-y :=3D ttm_memory.o ttm_tt.o ttm_bo.o \
>  	ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>  	ttm_execbuf_util.o ttm_range_manager.o \
> -	ttm_resource.o ttm_pool.o
> +	ttm_resource.o ttm_pool.o ttm_device.o
>  ttm-$(CONFIG_AGP) +=3D ttm_agp_backend.o
>  =

>  obj-$(CONFIG_DRM_TTM) +=3D ttm.o
> diff --git a/drivers/gpu/drm/ttm/ttm_agp_backend.c b/drivers/gpu/drm/ttm/=
ttm_agp_backend.c
> index 8f9fa4188897..0226ae69d3ab 100644
> --- a/drivers/gpu/drm/ttm/ttm_agp_backend.c
> +++ b/drivers/gpu/drm/ttm/ttm_agp_backend.c
> @@ -49,7 +49,7 @@ struct ttm_agp_backend {
>  int ttm_agp_bind(struct ttm_tt *ttm, struct ttm_resource *bo_mem)
>  {
>  	struct ttm_agp_backend *agp_be =3D container_of(ttm, struct ttm_agp_bac=
kend, ttm);
> -	struct page *dummy_read_page =3D ttm_bo_glob.dummy_read_page;
> +	struct page *dummy_read_page =3D ttm_glob.dummy_read_page;
>  	struct drm_mm_node *node =3D bo_mem->mm_node;
>  	struct agp_memory *mem;
>  	int ret, cached =3D ttm->caching =3D=3D ttm_cached;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c289a6a37ff9..20256797f3a6 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -44,14 +44,6 @@
>  =

>  #include "ttm_module.h"
>  =

> -/*
> - * ttm_global_mutex - protecting the global BO state
> - */
> -DEFINE_MUTEX(ttm_global_mutex);
> -unsigned ttm_bo_glob_use_count;
> -struct ttm_bo_global ttm_bo_glob;
> -EXPORT_SYMBOL(ttm_bo_glob);
> -
>  /* default destructor */
>  static void ttm_bo_default_destroy(struct ttm_buffer_object *bo)
>  {
> @@ -79,13 +71,13 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_=
object *bo,
>  =

>  static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  =

>  	list_del_init(&bo->swap);
>  	list_del_init(&bo->lru);
>  =

> -	if (bdev->driver->del_from_lru_notify)
> -		bdev->driver->del_from_lru_notify(bo);
> +	if (bdev->funcs->del_from_lru_notify)
> +		bdev->funcs->del_from_lru_notify(bo);
>  }
>  =

>  static void ttm_bo_bulk_move_set_pos(struct ttm_lru_bulk_move_pos *pos,
> @@ -100,7 +92,7 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object =
*bo,
>  			     struct ttm_resource *mem,
>  			     struct ttm_lru_bulk_move *bulk)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	struct ttm_resource_manager *man;
>  =

>  	dma_resv_assert_held(bo->base.resv);
> @@ -117,12 +109,12 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_obje=
ct *bo,
>  				     TTM_PAGE_FLAG_SWAPPED))) {
>  		struct list_head *swap;
>  =

> -		swap =3D &ttm_bo_glob.swap_lru[bo->priority];
> +		swap =3D &ttm_glob.swap_lru[bo->priority];
>  		list_move_tail(&bo->swap, swap);
>  	}
>  =

> -	if (bdev->driver->del_from_lru_notify)
> -		bdev->driver->del_from_lru_notify(bo);
> +	if (bdev->funcs->del_from_lru_notify)
> +		bdev->funcs->del_from_lru_notify(bo);
>  =

>  	if (bulk && !bo->pin_count) {
>  		switch (bo->mem.mem_type) {
> @@ -185,7 +177,7 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_mo=
ve *bulk)
>  		dma_resv_assert_held(pos->first->base.resv);
>  		dma_resv_assert_held(pos->last->base.resv);
>  =

> -		lru =3D &ttm_bo_glob.swap_lru[i];
> +		lru =3D &ttm_glob.swap_lru[i];
>  		list_bulk_move_tail(lru, &pos->first->swap, &pos->last->swap);
>  	}
>  }
> @@ -196,7 +188,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_o=
bject *bo,
>  				  struct ttm_operation_ctx *ctx,
>  				  struct ttm_place *hop)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	struct ttm_resource_manager *old_man =3D ttm_manager_type(bdev, bo->mem=
.mem_type);
>  	struct ttm_resource_manager *new_man =3D ttm_manager_type(bdev, mem->me=
m_type);
>  	int ret;
> @@ -222,7 +214,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_o=
bject *bo,
>  		}
>  	}
>  =

> -	ret =3D bdev->driver->move(bo, evict, ctx, mem, hop);
> +	ret =3D bdev->funcs->move(bo, evict, ctx, mem, hop);
>  	if (ret) {
>  		if (ret =3D=3D -EMULTIHOP)
>  			return ret;
> @@ -250,8 +242,8 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_o=
bject *bo,
>  =

>  static void ttm_bo_cleanup_memtype_use(struct ttm_buffer_object *bo)
>  {
> -	if (bo->bdev->driver->delete_mem_notify)
> -		bo->bdev->driver->delete_mem_notify(bo);
> +	if (bo->bdev->funcs->delete_mem_notify)
> +		bo->bdev->funcs->delete_mem_notify(bo);
>  =

>  	ttm_bo_tt_destroy(bo);
>  	ttm_resource_free(bo, &bo->mem);
> @@ -276,9 +268,9 @@ static int ttm_bo_individualize_resv(struct ttm_buffe=
r_object *bo)
>  		 * reference it any more. The only tricky case is the trylock on
>  		 * the resv object while holding the lru_lock.
>  		 */
> -		spin_lock(&ttm_bo_glob.lru_lock);
> +		spin_lock(&ttm_glob.lru_lock);
>  		bo->base.resv =3D &bo->base._resv;
> -		spin_unlock(&ttm_bo_glob.lru_lock);
> +		spin_unlock(&ttm_glob.lru_lock);
>  	}
>  =

>  	return r;
> @@ -337,7 +329,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>  =

>  		if (unlock_resv)
>  			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&ttm_bo_glob.lru_lock);
> +		spin_unlock(&ttm_glob.lru_lock);
>  =

>  		lret =3D dma_resv_wait_timeout_rcu(resv, true, interruptible,
>  						 30 * HZ);
> @@ -347,7 +339,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>  		else if (lret =3D=3D 0)
>  			return -EBUSY;
>  =

> -		spin_lock(&ttm_bo_glob.lru_lock);
> +		spin_lock(&ttm_glob.lru_lock);
>  		if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
>  			/*
>  			 * We raced, and lost, someone else holds the reservation now,
> @@ -357,7 +349,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>  			 * delayed destruction would succeed, so just return success
>  			 * here.
>  			 */
> -			spin_unlock(&ttm_bo_glob.lru_lock);
> +			spin_unlock(&ttm_glob.lru_lock);
>  			return 0;
>  		}
>  		ret =3D 0;
> @@ -366,13 +358,13 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_ob=
ject *bo,
>  	if (ret || unlikely(list_empty(&bo->ddestroy))) {
>  		if (unlock_resv)
>  			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&ttm_bo_glob.lru_lock);
> +		spin_unlock(&ttm_glob.lru_lock);
>  		return ret;
>  	}
>  =

>  	ttm_bo_del_from_lru(bo);
>  	list_del_init(&bo->ddestroy);
> -	spin_unlock(&ttm_bo_glob.lru_lock);
> +	spin_unlock(&ttm_glob.lru_lock);
>  	ttm_bo_cleanup_memtype_use(bo);
>  =

>  	if (unlock_resv)
> @@ -387,9 +379,9 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_obje=
ct *bo,
>   * Traverse the delayed list, and call ttm_bo_cleanup_refs on all
>   * encountered buffers.
>   */
> -static bool ttm_bo_delayed_delete(struct ttm_bo_device *bdev, bool remov=
e_all)
> +bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all)
>  {
> -	struct ttm_bo_global *glob =3D &ttm_bo_glob;
> +	struct ttm_global *glob =3D &ttm_glob;
>  	struct list_head removed;
>  	bool empty;
>  =

> @@ -428,21 +420,11 @@ static bool ttm_bo_delayed_delete(struct ttm_bo_dev=
ice *bdev, bool remove_all)
>  	return empty;
>  }
>  =

> -static void ttm_bo_delayed_workqueue(struct work_struct *work)
> -{
> -	struct ttm_bo_device *bdev =3D
> -	    container_of(work, struct ttm_bo_device, wq.work);
> -
> -	if (!ttm_bo_delayed_delete(bdev, false))
> -		schedule_delayed_work(&bdev->wq,
> -				      ((HZ / 100) < 1) ? 1 : HZ / 100);
> -}
> -
>  static void ttm_bo_release(struct kref *kref)
>  {
>  	struct ttm_buffer_object *bo =3D
>  	    container_of(kref, struct ttm_buffer_object, kref);
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	size_t acc_size =3D bo->acc_size;
>  	int ret;
>  =

> @@ -456,8 +438,8 @@ static void ttm_bo_release(struct kref *kref)
>  						  30 * HZ);
>  		}
>  =

> -		if (bo->bdev->driver->release_notify)
> -			bo->bdev->driver->release_notify(bo);
> +		if (bo->bdev->funcs->release_notify)
> +			bo->bdev->funcs->release_notify(bo);
>  =

>  		drm_vma_offset_remove(bdev->vma_manager, &bo->base.vma_node);
>  		ttm_mem_io_free(bdev, &bo->mem);
> @@ -469,7 +451,7 @@ static void ttm_bo_release(struct kref *kref)
>  		ttm_bo_flush_all_fences(bo);
>  		bo->deleted =3D true;
>  =

> -		spin_lock(&ttm_bo_glob.lru_lock);
> +		spin_lock(&ttm_glob.lru_lock);
>  =

>  		/*
>  		 * Make pinned bos immediately available to
> @@ -483,22 +465,22 @@ static void ttm_bo_release(struct kref *kref)
>  =

>  		kref_init(&bo->kref);
>  		list_add_tail(&bo->ddestroy, &bdev->ddestroy);
> -		spin_unlock(&ttm_bo_glob.lru_lock);
> +		spin_unlock(&ttm_glob.lru_lock);
>  =

>  		schedule_delayed_work(&bdev->wq,
>  				      ((HZ / 100) < 1) ? 1 : HZ / 100);
>  		return;
>  	}
>  =

> -	spin_lock(&ttm_bo_glob.lru_lock);
> +	spin_lock(&ttm_glob.lru_lock);
>  	ttm_bo_del_from_lru(bo);
>  	list_del(&bo->ddestroy);
> -	spin_unlock(&ttm_bo_glob.lru_lock);
> +	spin_unlock(&ttm_glob.lru_lock);
>  =

>  	ttm_bo_cleanup_memtype_use(bo);
>  	dma_resv_unlock(bo->base.resv);
>  =

> -	atomic_dec(&ttm_bo_glob.bo_count);
> +	atomic_dec(&ttm_glob.bo_count);
>  	dma_fence_put(bo->moving);
>  	if (!ttm_bo_uses_embedded_gem_object(bo))
>  		dma_resv_fini(&bo->base._resv);
> @@ -512,13 +494,13 @@ void ttm_bo_put(struct ttm_buffer_object *bo)
>  }
>  EXPORT_SYMBOL(ttm_bo_put);
>  =

> -int ttm_bo_lock_delayed_workqueue(struct ttm_bo_device *bdev)
> +int ttm_bo_lock_delayed_workqueue(struct ttm_device *bdev)
>  {
>  	return cancel_delayed_work_sync(&bdev->wq);
>  }
>  EXPORT_SYMBOL(ttm_bo_lock_delayed_workqueue);
>  =

> -void ttm_bo_unlock_delayed_workqueue(struct ttm_bo_device *bdev, int res=
ched)
> +void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resche=
d)
>  {
>  	if (resched)
>  		schedule_delayed_work(&bdev->wq,
> @@ -529,7 +511,7 @@ EXPORT_SYMBOL(ttm_bo_unlock_delayed_workqueue);
>  static int ttm_bo_evict(struct ttm_buffer_object *bo,
>  			struct ttm_operation_ctx *ctx)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	struct ttm_resource evict_mem;
>  	struct ttm_placement placement;
>  	struct ttm_place hop;
> @@ -541,7 +523,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>  =

>  	placement.num_placement =3D 0;
>  	placement.num_busy_placement =3D 0;
> -	bdev->driver->evict_flags(bo, &placement);
> +	bdev->funcs->evict_flags(bo, &placement);
>  =

>  	if (!placement.num_placement && !placement.num_busy_placement) {
>  		ttm_bo_wait(bo, false, false);
> @@ -657,7 +639,7 @@ static int ttm_mem_evict_wait_busy(struct ttm_buffer_=
object *busy_bo,
>  	return r =3D=3D -EDEADLK ? -EBUSY : r;
>  }
>  =

> -int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> +int ttm_mem_evict_first(struct ttm_device *bdev,
>  			struct ttm_resource_manager *man,
>  			const struct ttm_place *place,
>  			struct ttm_operation_ctx *ctx,
> @@ -668,7 +650,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
>  	unsigned i;
>  	int ret;
>  =

> -	spin_lock(&ttm_bo_glob.lru_lock);
> +	spin_lock(&ttm_glob.lru_lock);
>  	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>  		list_for_each_entry(bo, &man->lru[i], lru) {
>  			bool busy;
> @@ -681,7 +663,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
>  				continue;
>  			}
>  =

> -			if (place && !bdev->driver->eviction_valuable(bo,
> +			if (place && !bdev->funcs->eviction_valuable(bo,
>  								      place)) {
>  				if (locked)
>  					dma_resv_unlock(bo->base.resv);
> @@ -705,7 +687,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
>  	if (!bo) {
>  		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
>  			busy_bo =3D NULL;
> -		spin_unlock(&ttm_bo_glob.lru_lock);
> +		spin_unlock(&ttm_glob.lru_lock);
>  		ret =3D ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
>  		if (busy_bo)
>  			ttm_bo_put(busy_bo);
> @@ -719,7 +701,7 @@ int ttm_mem_evict_first(struct ttm_bo_device *bdev,
>  		return ret;
>  	}
>  =

> -	spin_unlock(&ttm_bo_glob.lru_lock);
> +	spin_unlock(&ttm_glob.lru_lock);
>  =

>  	ret =3D ttm_bo_evict(bo, ctx);
>  	if (locked)
> @@ -774,7 +756,7 @@ static int ttm_bo_mem_force_space(struct ttm_buffer_o=
bject *bo,
>  				  struct ttm_resource *mem,
>  				  struct ttm_operation_ctx *ctx)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	struct ttm_resource_manager *man =3D ttm_manager_type(bdev, mem->mem_ty=
pe);
>  	struct ww_acquire_ctx *ticket;
>  	int ret;
> @@ -809,7 +791,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_obj=
ect *bo,
>  				const struct ttm_place *place,
>  				struct ttm_resource *mem)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	struct ttm_resource_manager *man;
>  =

>  	man =3D ttm_manager_type(bdev, place->mem_type);
> @@ -819,9 +801,9 @@ static int ttm_bo_mem_placement(struct ttm_buffer_obj=
ect *bo,
>  	mem->mem_type =3D place->mem_type;
>  	mem->placement =3D place->flags;
>  =

> -	spin_lock(&ttm_bo_glob.lru_lock);
> +	spin_lock(&ttm_glob.lru_lock);
>  	ttm_bo_move_to_lru_tail(bo, mem, NULL);
> -	spin_unlock(&ttm_bo_glob.lru_lock);
> +	spin_unlock(&ttm_glob.lru_lock);
>  =

>  	return 0;
>  }
> @@ -839,7 +821,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>  			struct ttm_resource *mem,
>  			struct ttm_operation_ctx *ctx)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	bool type_found =3D false;
>  	int i, ret;
>  =

> @@ -1057,7 +1039,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>  }
>  EXPORT_SYMBOL(ttm_bo_validate);
>  =

> -int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
> +int ttm_bo_init_reserved(struct ttm_device *bdev,
>  			 struct ttm_buffer_object *bo,
>  			 size_t size,
>  			 enum ttm_bo_type type,
> @@ -1117,7 +1099,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>  		dma_resv_init(&bo->base._resv);
>  		drm_vma_node_reset(&bo->base.vma_node);
>  	}
> -	atomic_inc(&ttm_bo_glob.bo_count);
> +	atomic_inc(&ttm_glob.bo_count);
>  =

>  	/*
>  	 * For ttm_bo_type_device buffers, allocate
> @@ -1153,7 +1135,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>  }
>  EXPORT_SYMBOL(ttm_bo_init_reserved);
>  =

> -int ttm_bo_init(struct ttm_bo_device *bdev,
> +int ttm_bo_init(struct ttm_device *bdev,
>  		struct ttm_buffer_object *bo,
>  		size_t size,
>  		enum ttm_bo_type type,
> @@ -1181,7 +1163,7 @@ int ttm_bo_init(struct ttm_bo_device *bdev,
>  }
>  EXPORT_SYMBOL(ttm_bo_init);
>  =

> -size_t ttm_bo_dma_acc_size(struct ttm_bo_device *bdev,
> +size_t ttm_bo_dma_acc_size(struct ttm_device *bdev,
>  			   unsigned long bo_size,
>  			   unsigned struct_size)
>  {
> @@ -1195,148 +1177,13 @@ size_t ttm_bo_dma_acc_size(struct ttm_bo_device =
*bdev,
>  }
>  EXPORT_SYMBOL(ttm_bo_dma_acc_size);
>  =

> -static void ttm_bo_global_release(void)
> -{
> -	struct ttm_bo_global *glob =3D &ttm_bo_glob;
> -
> -	mutex_lock(&ttm_global_mutex);
> -	if (--ttm_bo_glob_use_count > 0)
> -		goto out;
> -
> -	kobject_del(&glob->kobj);
> -	kobject_put(&glob->kobj);
> -	ttm_mem_global_release(&ttm_mem_glob);
> -	__free_page(glob->dummy_read_page);
> -	memset(glob, 0, sizeof(*glob));
> -out:
> -	mutex_unlock(&ttm_global_mutex);
> -}
> -
> -static int ttm_bo_global_init(void)
> -{
> -	struct ttm_bo_global *glob =3D &ttm_bo_glob;
> -	int ret =3D 0;
> -	unsigned i;
> -
> -	mutex_lock(&ttm_global_mutex);
> -	if (++ttm_bo_glob_use_count > 1)
> -		goto out;
> -
> -	ret =3D ttm_mem_global_init(&ttm_mem_glob);
> -	if (ret)
> -		goto out;
> -
> -	spin_lock_init(&glob->lru_lock);
> -	glob->dummy_read_page =3D alloc_page(__GFP_ZERO | GFP_DMA32);
> -
> -	if (unlikely(glob->dummy_read_page =3D=3D NULL)) {
> -		ret =3D -ENOMEM;
> -		goto out;
> -	}
> -
> -	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> -		INIT_LIST_HEAD(&glob->swap_lru[i]);
> -	INIT_LIST_HEAD(&glob->device_list);
> -	atomic_set(&glob->bo_count, 0);
> -
> -	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
> -				&glob->bo_count);
> -out:
> -	mutex_unlock(&ttm_global_mutex);
> -	return ret;
> -}
> -
> -int ttm_bo_device_release(struct ttm_bo_device *bdev)
> -{
> -	struct ttm_bo_global *glob =3D &ttm_bo_glob;
> -	int ret =3D 0;
> -	unsigned i;
> -	struct ttm_resource_manager *man;
> -
> -	man =3D ttm_manager_type(bdev, TTM_PL_SYSTEM);
> -	ttm_resource_manager_set_used(man, false);
> -	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
> -
> -	mutex_lock(&ttm_global_mutex);
> -	list_del(&bdev->device_list);
> -	mutex_unlock(&ttm_global_mutex);
> -
> -	cancel_delayed_work_sync(&bdev->wq);
> -
> -	if (ttm_bo_delayed_delete(bdev, true))
> -		pr_debug("Delayed destroy list was clean\n");
> -
> -	spin_lock(&glob->lru_lock);
> -	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> -		if (list_empty(&man->lru[0]))
> -			pr_debug("Swap list %d was clean\n", i);
> -	spin_unlock(&glob->lru_lock);
> -
> -	ttm_pool_fini(&bdev->pool);
> -
> -	if (!ret)
> -		ttm_bo_global_release();
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL(ttm_bo_device_release);
> -
> -static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
> -{
> -	struct ttm_resource_manager *man =3D &bdev->sysman;
> -
> -	/*
> -	 * Initialize the system memory buffer type.
> -	 * Other types need to be driver / IOCTL initialized.
> -	 */
> -	man->use_tt =3D true;
> -
> -	ttm_resource_manager_init(man, 0);
> -	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, man);
> -	ttm_resource_manager_set_used(man, true);
> -}
> -
> -int ttm_bo_device_init(struct ttm_bo_device *bdev,
> -		       struct ttm_bo_driver *driver,
> -		       struct device *dev,
> -		       struct address_space *mapping,
> -		       struct drm_vma_offset_manager *vma_manager,
> -		       bool use_dma_alloc, bool use_dma32)
> -{
> -	struct ttm_bo_global *glob =3D &ttm_bo_glob;
> -	int ret;
> -
> -	if (WARN_ON(vma_manager =3D=3D NULL))
> -		return -EINVAL;
> -
> -	ret =3D ttm_bo_global_init();
> -	if (ret)
> -		return ret;
> -
> -	bdev->driver =3D driver;
> -
> -	ttm_bo_init_sysman(bdev);
> -	ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
> -
> -	bdev->vma_manager =3D vma_manager;
> -	INIT_DELAYED_WORK(&bdev->wq, ttm_bo_delayed_workqueue);
> -	INIT_LIST_HEAD(&bdev->ddestroy);
> -	bdev->dev_mapping =3D mapping;
> -	mutex_lock(&ttm_global_mutex);
> -	list_add_tail(&bdev->device_list, &glob->device_list);
> -	mutex_unlock(&ttm_global_mutex);
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL(ttm_bo_device_init);
> -
>  /*
>   * buffer object vm functions.
>   */
>  =

>  void ttm_bo_unmap_virtual(struct ttm_buffer_object *bo)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  =

>  	drm_vma_node_unmap(&bo->base.vma_node, bdev->dev_mapping);
>  	ttm_mem_io_free(bdev, &bo->mem);
> @@ -1374,7 +1221,7 @@ EXPORT_SYMBOL(ttm_bo_wait);
>   */
>  int ttm_bo_swapout(struct ttm_operation_ctx *ctx)
>  {
> -	struct ttm_bo_global *glob =3D &ttm_bo_glob;
> +	struct ttm_global *glob =3D &ttm_glob;
>  	struct ttm_buffer_object *bo;
>  	int ret =3D -EBUSY;
>  	bool locked;
> @@ -1452,8 +1299,8 @@ int ttm_bo_swapout(struct ttm_operation_ctx *ctx)
>  	 * anyone tries to access a ttm page.
>  	 */
>  =

> -	if (bo->bdev->driver->swap_notify)
> -		bo->bdev->driver->swap_notify(bo);
> +	if (bo->bdev->funcs->swap_notify)
> +		bo->bdev->funcs->swap_notify(bo);
>  =

>  	ret =3D ttm_tt_swapout(bo->bdev, bo->ttm);
>  out:
> @@ -1478,4 +1325,3 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo)
>  	ttm_tt_destroy(bo->bdev, bo->ttm);
>  	bo->ttm =3D NULL;
>  }
> -
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_=
bo_util.c
> index 398d5013fc39..db0f2661d504 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -46,33 +46,33 @@ struct ttm_transfer_obj {
>  	struct ttm_buffer_object *bo;
>  };
>  =

> -int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
> +int ttm_mem_io_reserve(struct ttm_device *bdev,
>  		       struct ttm_resource *mem)
>  {
>  	if (mem->bus.offset || mem->bus.addr)
>  		return 0;
>  =

>  	mem->bus.is_iomem =3D false;
> -	if (!bdev->driver->io_mem_reserve)
> +	if (!bdev->funcs->io_mem_reserve)
>  		return 0;
>  =

> -	return bdev->driver->io_mem_reserve(bdev, mem);
> +	return bdev->funcs->io_mem_reserve(bdev, mem);
>  }
>  =

> -void ttm_mem_io_free(struct ttm_bo_device *bdev,
> +void ttm_mem_io_free(struct ttm_device *bdev,
>  		     struct ttm_resource *mem)
>  {
>  	if (!mem->bus.offset && !mem->bus.addr)
>  		return;
>  =

> -	if (bdev->driver->io_mem_free)
> -		bdev->driver->io_mem_free(bdev, mem);
> +	if (bdev->funcs->io_mem_free)
> +		bdev->funcs->io_mem_free(bdev, mem);
>  =

>  	mem->bus.offset =3D 0;
>  	mem->bus.addr =3D NULL;
>  }
>  =

> -static int ttm_resource_ioremap(struct ttm_bo_device *bdev,
> +static int ttm_resource_ioremap(struct ttm_device *bdev,
>  			       struct ttm_resource *mem,
>  			       void **virtual)
>  {
> @@ -102,7 +102,7 @@ static int ttm_resource_ioremap(struct ttm_bo_device =
*bdev,
>  	return 0;
>  }
>  =

> -static void ttm_resource_iounmap(struct ttm_bo_device *bdev,
> +static void ttm_resource_iounmap(struct ttm_device *bdev,
>  				struct ttm_resource *mem,
>  				void *virtual)
>  {
> @@ -172,7 +172,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>  		       struct ttm_operation_ctx *ctx,
>  		       struct ttm_resource *new_mem)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	struct ttm_resource_manager *man =3D ttm_manager_type(bdev, new_mem->me=
m_type);
>  	struct ttm_tt *ttm =3D bo->ttm;
>  	struct ttm_resource *old_mem =3D &bo->mem;
> @@ -300,7 +300,7 @@ static int ttm_buffer_object_transfer(struct ttm_buff=
er_object *bo,
>  	 * TODO: Explicit member copy would probably be better here.
>  	 */
>  =

> -	atomic_inc(&ttm_bo_glob.bo_count);
> +	atomic_inc(&ttm_glob.bo_count);
>  	INIT_LIST_HEAD(&fbo->base.ddestroy);
>  	INIT_LIST_HEAD(&fbo->base.lru);
>  	INIT_LIST_HEAD(&fbo->base.swap);
> @@ -602,7 +602,7 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_obj=
ect *bo,
>  static void ttm_bo_move_pipeline_evict(struct ttm_buffer_object *bo,
>  				       struct dma_fence *fence)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	struct ttm_resource_manager *from =3D ttm_manager_type(bdev, bo->mem.me=
m_type);
>  =

>  	/**
> @@ -628,7 +628,7 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_objec=
t *bo,
>  			      bool pipeline,
>  			      struct ttm_resource *new_mem)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	struct ttm_resource_manager *from =3D ttm_manager_type(bdev, bo->mem.me=
m_type);
>  	struct ttm_resource_manager *man =3D ttm_manager_type(bdev, new_mem->me=
m_type);
>  	int ret =3D 0;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo=
_vm.c
> index 6dc96cf66744..b31b18058965 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -95,10 +95,10 @@ static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buf=
fer_object *bo,
>  static unsigned long ttm_bo_io_mem_pfn(struct ttm_buffer_object *bo,
>  				       unsigned long page_offset)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  =

> -	if (bdev->driver->io_mem_pfn)
> -		return bdev->driver->io_mem_pfn(bo, page_offset);
> +	if (bdev->funcs->io_mem_pfn)
> +		return bdev->funcs->io_mem_pfn(bo, page_offset);
>  =

>  	return (bo->mem.bus.offset >> PAGE_SHIFT) + page_offset;
>  }
> @@ -216,7 +216,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fau=
lt *vmf,
>  			if (page_to_pfn(ttm->pages[page_offset + i]) !=3D pfn + i)
>  				goto out_fallback;
>  		}
> -	} else if (bo->bdev->driver->io_mem_pfn) {
> +	} else if (bo->bdev->funcs->io_mem_pfn) {
>  		for (i =3D 1; i < fault_page_size; ++i) {
>  			if (ttm_bo_io_mem_pfn(bo, page_offset + i) !=3D pfn + i)
>  				goto out_fallback;
> @@ -278,7 +278,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *=
vmf,
>  {
>  	struct vm_area_struct *vma =3D vmf->vma;
>  	struct ttm_buffer_object *bo =3D vma->vm_private_data;
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	unsigned long page_offset;
>  	unsigned long page_last;
>  	unsigned long pfn;
> @@ -488,8 +488,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsi=
gned long addr,
>  		ret =3D ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
>  		break;
>  	default:
> -		if (bo->bdev->driver->access_memory)
> -			ret =3D bo->bdev->driver->access_memory(
> +		if (bo->bdev->funcs->access_memory)
> +			ret =3D bo->bdev->funcs->access_memory(
>  				bo, offset, buf, len, write);
>  		else
>  			ret =3D -EIO;
> @@ -508,7 +508,7 @@ static const struct vm_operations_struct ttm_bo_vm_op=
s =3D {
>  	.access =3D ttm_bo_vm_access,
>  };
>  =

> -static struct ttm_buffer_object *ttm_bo_vm_lookup(struct ttm_bo_device *=
bdev,
> +static struct ttm_buffer_object *ttm_bo_vm_lookup(struct ttm_device *bde=
v,
>  						  unsigned long offset,
>  						  unsigned long pages)
>  {
> @@ -555,9 +555,8 @@ static void ttm_bo_mmap_vma_setup(struct ttm_buffer_o=
bject *bo, struct vm_area_s
>  }
>  =

>  int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
> -		struct ttm_bo_device *bdev)
> +		struct ttm_device *bdev)
>  {
> -	struct ttm_bo_driver *driver;
>  	struct ttm_buffer_object *bo;
>  	int ret;
>  =

> @@ -568,12 +567,11 @@ int ttm_bo_mmap(struct file *filp, struct vm_area_s=
truct *vma,
>  	if (unlikely(!bo))
>  		return -EINVAL;
>  =

> -	driver =3D bo->bdev->driver;
> -	if (unlikely(!driver->verify_access)) {
> +	if (unlikely(!bo->bdev->funcs->verify_access)) {
>  		ret =3D -EPERM;
>  		goto out_unref;
>  	}
> -	ret =3D driver->verify_access(bo, filp);
> +	ret =3D bo->bdev->funcs->verify_access(bo, filp);
>  	if (unlikely(ret !=3D 0))
>  		goto out_unref;
>  =

> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_d=
evice.c
> new file mode 100644
> index 000000000000..ac0903c9e60a
> --- /dev/null
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -0,0 +1,195 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +
> +/*
> + * Copyright (c) 2006-2009 VMware, Inc., Palo Alto, CA., USA
> + * Copyright 2020 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Christian K=F6nig
> + */
> +
> +#define pr_fmt(fmt) "[TTM DEVICE] " fmt
> +
> +#include <drm/ttm/ttm_device.h>
> +#include <drm/ttm/ttm_memory.h>
> +#include <drm/ttm/ttm_placement.h>
> +
> +#include "ttm_module.h"
> +
> +/**
> + * ttm_global_mutex - protecting the global state
> + */
> +DEFINE_MUTEX(ttm_global_mutex);
> +unsigned ttm_glob_use_count;
> +struct ttm_global ttm_glob;
> +EXPORT_SYMBOL(ttm_glob);
> +
> +static void ttm_global_release(void)
> +{
> +	struct ttm_global *glob =3D &ttm_glob;
> +
> +	mutex_lock(&ttm_global_mutex);
> +	if (--ttm_glob_use_count > 0)
> +		goto out;
> +
> +	kobject_del(&glob->kobj);
> +	kobject_put(&glob->kobj);
> +	ttm_mem_global_release(&ttm_mem_glob);
> +	__free_page(glob->dummy_read_page);
> +	memset(glob, 0, sizeof(*glob));
> +out:
> +	mutex_unlock(&ttm_global_mutex);
> +}
> +
> +static int ttm_global_init(void)
> +{
> +	struct ttm_global *glob =3D &ttm_glob;
> +	int ret =3D 0;
> +	unsigned i;
> +
> +	mutex_lock(&ttm_global_mutex);
> +	if (++ttm_glob_use_count > 1)
> +		goto out;
> +
> +	ret =3D ttm_mem_global_init(&ttm_mem_glob);
> +	if (ret)
> +		goto out;
> +
> +	spin_lock_init(&glob->lru_lock);
> +	glob->dummy_read_page =3D alloc_page(__GFP_ZERO | GFP_DMA32);
> +
> +	if (unlikely(glob->dummy_read_page =3D=3D NULL)) {
> +		ret =3D -ENOMEM;
> +		goto out;
> +	}
> +
> +	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> +		INIT_LIST_HEAD(&glob->swap_lru[i]);
> +	INIT_LIST_HEAD(&glob->device_list);
> +	atomic_set(&glob->bo_count, 0);
> +
> +	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
> +				&glob->bo_count);
> +out:
> +	mutex_unlock(&ttm_global_mutex);
> +	return ret;
> +}
> +
> +static void ttm_init_sysman(struct ttm_device *bdev)
> +{
> +	struct ttm_resource_manager *man =3D &bdev->sysman;
> +
> +	/*
> +	 * Initialize the system memory buffer type.
> +	 * Other types need to be driver / IOCTL initialized.
> +	 */
> +	man->use_tt =3D true;
> +
> +	ttm_resource_manager_init(man, 0);
> +	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, man);
> +	ttm_resource_manager_set_used(man, true);
> +}
> +
> +static void ttm_device_delayed_workqueue(struct work_struct *work)
> +{
> +	struct ttm_device *bdev =3D
> +		container_of(work, struct ttm_device, wq.work);
> +
> +	if (!ttm_bo_delayed_delete(bdev, false))
> +		schedule_delayed_work(&bdev->wq,
> +				      ((HZ / 100) < 1) ? 1 : HZ / 100);
> +}
> +
> +/**
> + * ttm_device_init
> + *
> + * @bdev: A pointer to a struct ttm_device to initialize.
> + * @funcs: Function table for the device.
> + * @dev: The core kernel device pointer for DMA mappings and allocations.
> + * @mapping: The address space to use for this bo.
> + * @vma_manager: A pointer to a vma manager.
> + * @use_dma_alloc: If coherent DMA allocation API should be used.
> + * @use_dma32: If we should use GFP_DMA32 for device memory allocations.
> + *
> + * Initializes a struct ttm_device:
> + * Returns:
> + * !0: Failure.
> + */
> +int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *fu=
ncs,
> +		    struct device *dev, struct address_space *mapping,
> +		    struct drm_vma_offset_manager *vma_manager,
> +		    bool use_dma_alloc, bool use_dma32)
> +{
> +	struct ttm_global *glob =3D &ttm_glob;
> +	int ret;
> +
> +	if (WARN_ON(vma_manager =3D=3D NULL))
> +		return -EINVAL;
> +
> +	ret =3D ttm_global_init();
> +	if (ret)
> +		return ret;
> +
> +	bdev->funcs =3D funcs;
> +
> +	ttm_init_sysman(bdev);
> +	ttm_pool_init(&bdev->pool, dev, use_dma_alloc, use_dma32);
> +
> +	bdev->vma_manager =3D vma_manager;
> +	INIT_DELAYED_WORK(&bdev->wq, ttm_device_delayed_workqueue);
> +	INIT_LIST_HEAD(&bdev->ddestroy);
> +	bdev->dev_mapping =3D mapping;
> +	mutex_lock(&ttm_global_mutex);
> +	list_add_tail(&bdev->device_list, &glob->device_list);
> +	mutex_unlock(&ttm_global_mutex);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(ttm_device_init);
> +
> +void ttm_device_fini(struct ttm_device *bdev)
> +{
> +	struct ttm_global *glob =3D &ttm_glob;
> +	struct ttm_resource_manager *man;
> +	unsigned i;
> +
> +	man =3D ttm_manager_type(bdev, TTM_PL_SYSTEM);
> +	ttm_resource_manager_set_used(man, false);
> +	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, NULL);
> +
> +	mutex_lock(&ttm_global_mutex);
> +	list_del(&bdev->device_list);
> +	mutex_unlock(&ttm_global_mutex);
> +
> +	cancel_delayed_work_sync(&bdev->wq);
> +
> +	if (ttm_bo_delayed_delete(bdev, true))
> +		pr_debug("Delayed destroy list was clean\n");
> +
> +	spin_lock(&glob->lru_lock);
> +	for (i =3D 0; i < TTM_MAX_BO_PRIORITY; ++i)
> +		if (list_empty(&man->lru[0]))
> +			pr_debug("Swap list %d was clean\n", i);
> +	spin_unlock(&glob->lru_lock);
> +
> +	ttm_pool_fini(&bdev->pool);
> +	ttm_global_release();
> +}
> +EXPORT_SYMBOL(ttm_device_fini);
> diff --git a/drivers/gpu/drm/ttm/ttm_execbuf_util.c b/drivers/gpu/drm/ttm=
/ttm_execbuf_util.c
> index 9fa36ed59429..690ab97d52b7 100644
> --- a/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_execbuf_util.c
> @@ -51,14 +51,14 @@ void ttm_eu_backoff_reservation(struct ww_acquire_ctx=
 *ticket,
>  	if (list_empty(list))
>  		return;
>  =

> -	spin_lock(&ttm_bo_glob.lru_lock);
> +	spin_lock(&ttm_glob.lru_lock);
>  	list_for_each_entry(entry, list, head) {
>  		struct ttm_buffer_object *bo =3D entry->bo;
>  =

>  		ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
>  		dma_resv_unlock(bo->base.resv);
>  	}
> -	spin_unlock(&ttm_bo_glob.lru_lock);
> +	spin_unlock(&ttm_glob.lru_lock);
>  =

>  	if (ticket)
>  		ww_acquire_fini(ticket);
> @@ -154,7 +154,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ct=
x *ticket,
>  	if (list_empty(list))
>  		return;
>  =

> -	spin_lock(&ttm_bo_glob.lru_lock);
> +	spin_lock(&ttm_glob.lru_lock);
>  	list_for_each_entry(entry, list, head) {
>  		struct ttm_buffer_object *bo =3D entry->bo;
>  =

> @@ -165,7 +165,7 @@ void ttm_eu_fence_buffer_objects(struct ww_acquire_ct=
x *ticket,
>  		ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
>  		dma_resv_unlock(bo->base.resv);
>  	}
> -	spin_unlock(&ttm_bo_glob.lru_lock);
> +	spin_unlock(&ttm_glob.lru_lock);
>  	if (ticket)
>  		ww_acquire_fini(ticket);
>  }
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/tt=
m/ttm_range_manager.c
> index a39305f742da..707e5c152896 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -111,7 +111,7 @@ static void ttm_range_man_free(struct ttm_resource_ma=
nager *man,
>  =

>  static const struct ttm_resource_manager_func ttm_range_manager_func;
>  =

> -int ttm_range_man_init(struct ttm_bo_device *bdev,
> +int ttm_range_man_init(struct ttm_device *bdev,
>  		       unsigned type, bool use_tt,
>  		       unsigned long p_size)
>  {
> @@ -138,7 +138,7 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
>  }
>  EXPORT_SYMBOL(ttm_range_man_init);
>  =

> -int ttm_range_man_fini(struct ttm_bo_device *bdev,
> +int ttm_range_man_fini(struct ttm_device *bdev,
>  		       unsigned type)
>  {
>  	struct ttm_resource_manager *man =3D ttm_manager_type(bdev, type);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm=
_resource.c
> index b60699bf4816..ed1672a9f332 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -83,7 +83,7 @@ EXPORT_SYMBOL(ttm_resource_manager_init);
>   * Evict all the objects out of a memory manager until it is empty.
>   * Part of memory manager cleanup sequence.
>   */
> -int ttm_resource_manager_evict_all(struct ttm_bo_device *bdev,
> +int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  				   struct ttm_resource_manager *man)
>  {
>  	struct ttm_operation_ctx ctx =3D {
> @@ -91,7 +91,7 @@ int ttm_resource_manager_evict_all(struct ttm_bo_device=
 *bdev,
>  		.no_wait_gpu =3D false,
>  		.force_alloc =3D true
>  	};
> -	struct ttm_bo_global *glob =3D &ttm_bo_glob;
> +	struct ttm_global *glob =3D &ttm_glob;
>  	struct dma_fence *fence;
>  	int ret;
>  	unsigned i;
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 7f75a13163f0..7782d5393c7c 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -43,7 +43,7 @@
>   */
>  int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	uint32_t page_flags =3D 0;
>  =

>  	dma_resv_assert_held(bo->base.resv);
> @@ -66,7 +66,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool ze=
ro_alloc)
>  		return -EINVAL;
>  	}
>  =

> -	bo->ttm =3D bdev->driver->ttm_tt_create(bo, page_flags);
> +	bo->ttm =3D bdev->funcs->ttm_tt_create(bo, page_flags);
>  	if (unlikely(bo->ttm =3D=3D NULL))
>  		return -ENOMEM;
>  =

> @@ -108,7 +108,7 @@ static int ttm_sg_tt_alloc_page_directory(struct ttm_=
tt *ttm)
>  	return 0;
>  }
>  =

> -void ttm_tt_destroy_common(struct ttm_bo_device *bdev, struct ttm_tt *tt=
m)
> +void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm)
>  {
>  	ttm_tt_unpopulate(bdev, ttm);
>  =

> @@ -119,9 +119,9 @@ void ttm_tt_destroy_common(struct ttm_bo_device *bdev=
, struct ttm_tt *ttm)
>  }
>  EXPORT_SYMBOL(ttm_tt_destroy_common);
>  =

> -void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> +void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>  {
> -	bdev->driver->ttm_tt_destroy(bdev, ttm);
> +	bdev->funcs->ttm_tt_destroy(bdev, ttm);
>  }
>  =

>  static void ttm_tt_init_fields(struct ttm_tt *ttm,
> @@ -223,7 +223,7 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>  	return ret;
>  }
>  =

> -int ttm_tt_swapout(struct ttm_bo_device *bdev, struct ttm_tt *ttm)
> +int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm)
>  {
>  	struct address_space *swap_space;
>  	struct file *swap_storage;
> @@ -271,7 +271,7 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev, struct=
 ttm_tt *ttm)
>  	return ret;
>  }
>  =

> -static void ttm_tt_add_mapping(struct ttm_bo_device *bdev, struct ttm_tt=
 *ttm)
> +static void ttm_tt_add_mapping(struct ttm_device *bdev, struct ttm_tt *t=
tm)
>  {
>  	pgoff_t i;
>  =

> @@ -282,7 +282,7 @@ static void ttm_tt_add_mapping(struct ttm_bo_device *=
bdev, struct ttm_tt *ttm)
>  		ttm->pages[i]->mapping =3D bdev->dev_mapping;
>  }
>  =

> -int ttm_tt_populate(struct ttm_bo_device *bdev,
> +int ttm_tt_populate(struct ttm_device *bdev,
>  		    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>  {
>  	int ret;
> @@ -293,8 +293,8 @@ int ttm_tt_populate(struct ttm_bo_device *bdev,
>  	if (ttm_tt_is_populated(ttm))
>  		return 0;
>  =

> -	if (bdev->driver->ttm_tt_populate)
> -		ret =3D bdev->driver->ttm_tt_populate(bdev, ttm, ctx);
> +	if (bdev->funcs->ttm_tt_populate)
> +		ret =3D bdev->funcs->ttm_tt_populate(bdev, ttm, ctx);
>  	else
>  		ret =3D ttm_pool_alloc(&bdev->pool, ttm, ctx);
>  	if (ret)
> @@ -328,15 +328,15 @@ static void ttm_tt_clear_mapping(struct ttm_tt *ttm)
>  	}
>  }
>  =

> -void ttm_tt_unpopulate(struct ttm_bo_device *bdev,
> +void ttm_tt_unpopulate(struct ttm_device *bdev,
>  		       struct ttm_tt *ttm)
>  {
>  	if (!ttm_tt_is_populated(ttm))
>  		return;
>  =

>  	ttm_tt_clear_mapping(ttm);
> -	if (bdev->driver->ttm_tt_unpopulate)
> -		bdev->driver->ttm_tt_unpopulate(bdev, ttm);
> +	if (bdev->funcs->ttm_tt_unpopulate)
> +		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
>  	else
>  		ttm_pool_free(&bdev->pool, ttm);
>  	ttm->page_flags &=3D ~TTM_PAGE_FLAG_PRIV_POPULATED;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgf=
x/vmwgfx_blit.c
> index 118db24eb756..3a438ae4d3f4 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -466,13 +466,13 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
>  		dma_resv_assert_held(src->base.resv);
>  =

>  	if (!ttm_tt_is_populated(dst->ttm)) {
> -		ret =3D dst->bdev->driver->ttm_tt_populate(dst->bdev, dst->ttm, &ctx);
> +		ret =3D dst->bdev->funcs->ttm_tt_populate(dst->bdev, dst->ttm, &ctx);
>  		if (ret)
>  			return ret;
>  	}
>  =

>  	if (!ttm_tt_is_populated(src->ttm)) {
> -		ret =3D src->bdev->driver->ttm_tt_populate(src->bdev, src->ttm, &ctx);
> +		ret =3D src->bdev->funcs->ttm_tt_populate(src->bdev, src->ttm, &ctx);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index ab0844b47d4d..6b3bfd8c678a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -545,7 +545,7 @@ int vmw_bo_init(struct vmw_private *dev_priv,
>  		void (*bo_free)(struct ttm_buffer_object *bo))
>  {
>  	struct ttm_operation_ctx ctx =3D { interruptible, false };
> -	struct ttm_bo_device *bdev =3D &dev_priv->bdev;
> +	struct ttm_device *bdev =3D &dev_priv->bdev;
>  	size_t acc_size;
>  	int ret;
>  	bool user =3D (bo_free =3D=3D &vmw_user_bo_destroy);
> @@ -1058,7 +1058,7 @@ int vmw_user_bo_reference(struct ttm_object_file *t=
file,
>  void vmw_bo_fence_single(struct ttm_buffer_object *bo,
>  			 struct vmw_fence_obj *fence)
>  {
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  =

>  	struct vmw_private *dev_priv =3D
>  		container_of(bdev, struct vmw_private, bdev);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.c
> index eb997f4678de..b454d80c273e 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -884,12 +884,12 @@ static int vmw_driver_load(struct vmw_private *dev_=
priv, u32 pci_id)
>  	drm_vma_offset_manager_init(&dev_priv->vma_manager,
>  				    DRM_FILE_PAGE_OFFSET_START,
>  				    DRM_FILE_PAGE_OFFSET_SIZE);
> -	ret =3D ttm_bo_device_init(&dev_priv->bdev, &vmw_bo_driver,
> -				 dev_priv->drm.dev,
> -				 dev_priv->drm.anon_inode->i_mapping,
> -				 &dev_priv->vma_manager,
> -				 dev_priv->map_mode =3D=3D vmw_dma_alloc_coherent,
> -				 false);
> +	ret =3D ttm_device_init(&dev_priv->bdev, &vmw_bo_driver,
> +			      dev_priv->drm.dev,
> +			      dev_priv->drm.anon_inode->i_mapping,
> +			      &dev_priv->vma_manager,
> +			      dev_priv->map_mode =3D=3D vmw_dma_alloc_coherent,
> +			      false);
>  	if (unlikely(ret !=3D 0)) {
>  		DRM_ERROR("Failed initializing TTM buffer object driver.\n");
>  		goto out_no_bdev;
> @@ -1006,7 +1006,7 @@ static int vmw_driver_load(struct vmw_private *dev_=
priv, u32 pci_id)
>  		vmw_gmrid_man_fini(dev_priv, VMW_PL_GMR);
>  	vmw_vram_manager_fini(dev_priv);
>  out_no_vram:
> -	(void)ttm_bo_device_release(&dev_priv->bdev);
> +	ttm_device_fini(&dev_priv->bdev);
>  out_no_bdev:
>  	vmw_fence_manager_takedown(dev_priv->fman);
>  out_no_fman:
> @@ -1053,7 +1053,7 @@ static void vmw_driver_unload(struct drm_device *de=
v)
>  	if (dev_priv->has_mob)
>  		vmw_gmrid_man_fini(dev_priv, VMW_PL_MOB);
>  	vmw_vram_manager_fini(dev_priv);
> -	(void) ttm_bo_device_release(&dev_priv->bdev);
> +	ttm_device_fini(&dev_priv->bdev);
>  	drm_vma_offset_manager_destroy(&dev_priv->vma_manager);
>  	vmw_release_device_late(dev_priv);
>  	vmw_fence_manager_takedown(dev_priv->fman);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx=
/vmwgfx_drv.h
> index 336f5086ca26..e65b00f8336d 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -484,7 +484,7 @@ enum vmw_sm_type {
>  =

>  struct vmw_private {
>  	struct drm_device drm;
> -	struct ttm_bo_device bdev;
> +	struct ttm_device bdev;
>  =

>  	struct vmw_fifo_state fifo;
>  =

> @@ -999,7 +999,7 @@ extern struct ttm_placement vmw_evictable_placement;
>  extern struct ttm_placement vmw_srf_placement;
>  extern struct ttm_placement vmw_mob_placement;
>  extern struct ttm_placement vmw_nonfixed_placement;
> -extern struct ttm_bo_driver vmw_bo_driver;
> +extern struct ttm_device_funcs vmw_bo_driver;
>  extern const struct vmw_sg_table *
>  vmw_bo_sg_table(struct ttm_buffer_object *bo);
>  extern int vmw_bo_create_and_populate(struct vmw_private *dev_priv,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/v=
mwgfx/vmwgfx_resource.c
> index c4df51a2a926..c3a724e37104 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -856,7 +856,7 @@ void vmw_query_move_notify(struct ttm_buffer_object *=
bo,
>  			   struct ttm_resource *mem)
>  {
>  	struct vmw_buffer_object *dx_query_mob;
> -	struct ttm_bo_device *bdev =3D bo->bdev;
> +	struct ttm_device *bdev =3D bo->bdev;
>  	struct vmw_private *dev_priv;
>  =

>  =

> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm=
/vmwgfx/vmwgfx_ttm_buffer.c
> index 6a44567e4ba5..d1bfa59579f1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -483,7 +483,7 @@ const struct vmw_sg_table *vmw_bo_sg_table(struct ttm=
_buffer_object *bo)
>  }
>  =

>  =

> -static int vmw_ttm_bind(struct ttm_bo_device *bdev,
> +static int vmw_ttm_bind(struct ttm_device *bdev,
>  			struct ttm_tt *ttm, struct ttm_resource *bo_mem)
>  {
>  	struct vmw_ttm_tt *vmw_be =3D
> @@ -527,7 +527,7 @@ static int vmw_ttm_bind(struct ttm_bo_device *bdev,
>  	return ret;
>  }
>  =

> -static void vmw_ttm_unbind(struct ttm_bo_device *bdev,
> +static void vmw_ttm_unbind(struct ttm_device *bdev,
>  			   struct ttm_tt *ttm)
>  {
>  	struct vmw_ttm_tt *vmw_be =3D
> @@ -553,7 +553,7 @@ static void vmw_ttm_unbind(struct ttm_bo_device *bdev,
>  }
>  =

>  =

> -static void vmw_ttm_destroy(struct ttm_bo_device *bdev, struct ttm_tt *t=
tm)
> +static void vmw_ttm_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>  {
>  	struct vmw_ttm_tt *vmw_be =3D
>  		container_of(ttm, struct vmw_ttm_tt, dma_ttm);
> @@ -573,7 +573,7 @@ static void vmw_ttm_destroy(struct ttm_bo_device *bde=
v, struct ttm_tt *ttm)
>  }
>  =

>  =

> -static int vmw_ttm_populate(struct ttm_bo_device *bdev,
> +static int vmw_ttm_populate(struct ttm_device *bdev,
>  			    struct ttm_tt *ttm, struct ttm_operation_ctx *ctx)
>  {
>  	/* TODO: maybe completely drop this ? */
> @@ -583,7 +583,7 @@ static int vmw_ttm_populate(struct ttm_bo_device *bde=
v,
>  	return ttm_pool_alloc(&bdev->pool, ttm, ctx);
>  }
>  =

> -static void vmw_ttm_unpopulate(struct ttm_bo_device *bdev,
> +static void vmw_ttm_unpopulate(struct ttm_device *bdev,
>  			       struct ttm_tt *ttm)
>  {
>  	struct vmw_ttm_tt *vmw_tt =3D container_of(ttm, struct vmw_ttm_tt,
> @@ -640,7 +640,7 @@ static int vmw_verify_access(struct ttm_buffer_object=
 *bo, struct file *filp)
>  	return vmw_user_bo_verify_access(bo, tfile);
>  }
>  =

> -static int vmw_ttm_io_mem_reserve(struct ttm_bo_device *bdev, struct ttm=
_resource *mem)
> +static int vmw_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_re=
source *mem)
>  {
>  	struct vmw_private *dev_priv =3D container_of(bdev, struct vmw_private,=
 bdev);
>  =

> @@ -744,7 +744,7 @@ vmw_delete_mem_notify(struct ttm_buffer_object *bo)
>  	vmw_move_notify(bo, false, NULL);
>  }
>  =

> -struct ttm_bo_driver vmw_bo_driver =3D {
> +struct ttm_device_funcs vmw_bo_driver =3D {
>  	.ttm_tt_create =3D &vmw_ttm_tt_create,
>  	.ttm_tt_populate =3D &vmw_ttm_populate,
>  	.ttm_tt_unpopulate =3D &vmw_ttm_unpopulate,
> diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram=
_helper.h
> index a4bac02249c2..288055d397d9 100644
> --- a/include/drm/drm_gem_vram_helper.h
> +++ b/include/drm/drm_gem_vram_helper.h
> @@ -172,19 +172,19 @@ struct drm_vram_mm {
>  	uint64_t vram_base;
>  	size_t vram_size;
>  =

> -	struct ttm_bo_device bdev;
> +	struct ttm_device bdev;
>  };
>  =

>  /**
>   * drm_vram_mm_of_bdev() - \
> -	Returns the container of type &struct ttm_bo_device for field bdev.
> +	Returns the container of type &struct ttm_device for field bdev.
>   * @bdev:	the TTM BO device
>   *
>   * Returns:
>   * The containing instance of &struct drm_vram_mm
>   */
>  static inline struct drm_vram_mm *drm_vram_mm_of_bdev(
> -	struct ttm_bo_device *bdev)
> +	struct ttm_device *bdev)
>  {
>  	return container_of(bdev, struct drm_vram_mm, bdev);
>  }
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index e17be324d95f..62734db0b421 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -44,9 +44,9 @@
>  =

>  #include "ttm_resource.h"
>  =

> -struct ttm_bo_global;
> +struct ttm_global;
>  =

> -struct ttm_bo_device;
> +struct ttm_device;
>  =

>  struct dma_buf_map;
>  =

> @@ -122,7 +122,7 @@ struct ttm_buffer_object {
>  	 * Members constant at init.
>  	 */
>  =

> -	struct ttm_bo_device *bdev;
> +	struct ttm_device *bdev;
>  	enum ttm_bo_type type;
>  	void (*destroy) (struct ttm_buffer_object *);
>  	size_t acc_size;
> @@ -313,7 +313,7 @@ void ttm_bo_put(struct ttm_buffer_object *bo);
>   * @bulk: optional bulk move structure to remember BO positions
>   *
>   * Move this BO to the tail of all lru lists used to lookup and reserve =
an
> - * object. This function must be called with struct ttm_bo_global::lru_l=
ock
> + * object. This function must be called with struct ttm_global::lru_lock
>   * held, and is used to make a BO less likely to be considered for evict=
ion.
>   */
>  void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo,
> @@ -326,7 +326,7 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object=
 *bo,
>   * @bulk: bulk move structure
>   *
>   * Bulk move BOs to the LRU tail, only valid to use when driver makes su=
re that
> - * BO order never changes. Should be called with ttm_bo_global::lru_lock=
 held.
> + * BO order never changes. Should be called with ttm_global::lru_lock he=
ld.
>   */
>  void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_move *bulk);
>  =

> @@ -337,14 +337,14 @@ void ttm_bo_bulk_move_lru_tail(struct ttm_lru_bulk_=
move *bulk);
>   * Returns
>   * True if the workqueue was queued at the time
>   */
> -int ttm_bo_lock_delayed_workqueue(struct ttm_bo_device *bdev);
> +int ttm_bo_lock_delayed_workqueue(struct ttm_device *bdev);
>  =

>  /**
>   * ttm_bo_unlock_delayed_workqueue
>   *
>   * Allows the delayed workqueue to run.
>   */
> -void ttm_bo_unlock_delayed_workqueue(struct ttm_bo_device *bdev, int res=
ched);
> +void ttm_bo_unlock_delayed_workqueue(struct ttm_device *bdev, int resche=
d);
>  =

>  /**
>   * ttm_bo_eviction_valuable
> @@ -357,14 +357,14 @@ void ttm_bo_unlock_delayed_workqueue(struct ttm_bo_=
device *bdev, int resched);
>  bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>  			      const struct ttm_place *place);
>  =

> -size_t ttm_bo_dma_acc_size(struct ttm_bo_device *bdev,
> +size_t ttm_bo_dma_acc_size(struct ttm_device *bdev,
>  			   unsigned long bo_size,
>  			   unsigned struct_size);
>  =

>  /**
>   * ttm_bo_init_reserved
>   *
> - * @bdev: Pointer to a ttm_bo_device struct.
> + * @bdev: Pointer to a ttm_device struct.
>   * @bo: Pointer to a ttm_buffer_object to be initialized.
>   * @size: Requested size of buffer object.
>   * @type: Requested type of buffer object.
> @@ -396,7 +396,7 @@ size_t ttm_bo_dma_acc_size(struct ttm_bo_device *bdev,
>   * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resour=
ces.
>   */
>  =

> -int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
> +int ttm_bo_init_reserved(struct ttm_device *bdev,
>  			 struct ttm_buffer_object *bo,
>  			 size_t size, enum ttm_bo_type type,
>  			 struct ttm_placement *placement,
> @@ -409,7 +409,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>  /**
>   * ttm_bo_init
>   *
> - * @bdev: Pointer to a ttm_bo_device struct.
> + * @bdev: Pointer to a ttm_device struct.
>   * @bo: Pointer to a ttm_buffer_object to be initialized.
>   * @size: Requested size of buffer object.
>   * @type: Requested type of buffer object.
> @@ -443,7 +443,7 @@ int ttm_bo_init_reserved(struct ttm_bo_device *bdev,
>   * -EINVAL: Invalid placement flags.
>   * -ERESTARTSYS: Interrupted by signal while sleeping waiting for resour=
ces.
>   */
> -int ttm_bo_init(struct ttm_bo_device *bdev, struct ttm_buffer_object *bo,
> +int ttm_bo_init(struct ttm_device *bdev, struct ttm_buffer_object *bo,
>  		size_t size, enum ttm_bo_type type,
>  		struct ttm_placement *placement,
>  		uint32_t page_alignment, bool interrubtible, size_t acc_size,
> @@ -537,18 +537,18 @@ int ttm_bo_mmap_obj(struct vm_area_struct *vma, str=
uct ttm_buffer_object *bo);
>   *
>   * @filp:      filp as input from the mmap method.
>   * @vma:       vma as input from the mmap method.
> - * @bdev:      Pointer to the ttm_bo_device with the address space manag=
er.
> + * @bdev:      Pointer to the ttm_device with the address space manager.
>   *
>   * This function is intended to be called by the device mmap method.
>   * if the device address space is to be backed by the bo manager.
>   */
>  int ttm_bo_mmap(struct file *filp, struct vm_area_struct *vma,
> -		struct ttm_bo_device *bdev);
> +		struct ttm_device *bdev);
>  =

>  /**
>   * ttm_bo_io
>   *
> - * @bdev:      Pointer to the struct ttm_bo_device.
> + * @bdev:      Pointer to the struct ttm_device.
>   * @filp:      Pointer to the struct file attempting to read / write.
>   * @wbuf:      User-space pointer to address of buffer to write. NULL on=
 read.
>   * @rbuf:      User-space pointer to address of buffer to read into.
> @@ -565,7 +565,7 @@ int ttm_bo_mmap(struct file *filp, struct vm_area_str=
uct *vma,
>   * the function may return -ERESTARTSYS if
>   * interrupted by a signal.
>   */
> -ssize_t ttm_bo_io(struct ttm_bo_device *bdev, struct file *filp,
> +ssize_t ttm_bo_io(struct ttm_device *bdev, struct file *filp,
>  		  const char __user *wbuf, char __user *rbuf,
>  		  size_t count, loff_t *f_pos, bool write);
>  =

> @@ -617,7 +617,7 @@ static inline void ttm_bo_unpin(struct ttm_buffer_obj=
ect *bo)
>  	--bo->pin_count;
>  }
>  =

> -int ttm_mem_evict_first(struct ttm_bo_device *bdev,
> +int ttm_mem_evict_first(struct ttm_device *bdev,
>  			struct ttm_resource_manager *man,
>  			const struct ttm_place *place,
>  			struct ttm_operation_ctx *ctx,
> @@ -642,5 +642,6 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
>  =

>  int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>  		     void *buf, int len, int write);
> +bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
>  =

>  #endif
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_dri=
ver.h
> index 423348414c59..1c9bf993e252 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -37,301 +37,14 @@
>  #include <linux/spinlock.h>
>  #include <linux/dma-resv.h>
>  =

> +#include <drm/ttm/ttm_device.h>
> +
>  #include "ttm_bo_api.h"
>  #include "ttm_memory.h"
>  #include "ttm_placement.h"
>  #include "ttm_tt.h"
>  #include "ttm_pool.h"
>  =

> -/**
> - * struct ttm_bo_driver
> - *
> - * @create_ttm_backend_entry: Callback to create a struct ttm_backend.
> - * @evict_flags: Callback to obtain placement flags when a buffer is evi=
cted.
> - * @move: Callback for a driver to hook in accelerated functions to
> - * move a buffer.
> - * If set to NULL, a potentially slow memcpy() move is used.
> - */
> -
> -struct ttm_bo_driver {
> -	/**
> -	 * ttm_tt_create
> -	 *
> -	 * @bo: The buffer object to create the ttm for.
> -	 * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX flags.
> -	 *
> -	 * Create a struct ttm_tt to back data with system memory pages.
> -	 * No pages are actually allocated.
> -	 * Returns:
> -	 * NULL: Out of memory.
> -	 */
> -	struct ttm_tt *(*ttm_tt_create)(struct ttm_buffer_object *bo,
> -					uint32_t page_flags);
> -
> -	/**
> -	 * ttm_tt_populate
> -	 *
> -	 * @ttm: The struct ttm_tt to contain the backing pages.
> -	 *
> -	 * Allocate all backing pages
> -	 * Returns:
> -	 * -ENOMEM: Out of memory.
> -	 */
> -	int (*ttm_tt_populate)(struct ttm_bo_device *bdev,
> -			       struct ttm_tt *ttm,
> -			       struct ttm_operation_ctx *ctx);
> -
> -	/**
> -	 * ttm_tt_unpopulate
> -	 *
> -	 * @ttm: The struct ttm_tt to contain the backing pages.
> -	 *
> -	 * Free all backing page
> -	 */
> -	void (*ttm_tt_unpopulate)(struct ttm_bo_device *bdev, struct ttm_tt *tt=
m);
> -
> -	/**
> -	 * ttm_tt_destroy
> -	 *
> -	 * @bdev: Pointer to a ttm device
> -	 * @ttm: Pointer to a struct ttm_tt.
> -	 *
> -	 * Destroy the backend. This will be call back from ttm_tt_destroy so
> -	 * don't call ttm_tt_destroy from the callback or infinite loop.
> -	 */
> -	void (*ttm_tt_destroy)(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
> -
> -	/**
> -	 * struct ttm_bo_driver member eviction_valuable
> -	 *
> -	 * @bo: the buffer object to be evicted
> -	 * @place: placement we need room for
> -	 *
> -	 * Check with the driver if it is valuable to evict a BO to make room
> -	 * for a certain placement.
> -	 */
> -	bool (*eviction_valuable)(struct ttm_buffer_object *bo,
> -				  const struct ttm_place *place);
> -	/**
> -	 * struct ttm_bo_driver member evict_flags:
> -	 *
> -	 * @bo: the buffer object to be evicted
> -	 *
> -	 * Return the bo flags for a buffer which is not mapped to the hardware.
> -	 * These will be placed in proposed_flags so that when the move is
> -	 * finished, they'll end up in bo->mem.flags
> -	 * This should not cause multihop evictions, and the core will warn
> -	 * if one is proposed.
> -	 */
> -
> -	void (*evict_flags)(struct ttm_buffer_object *bo,
> -			    struct ttm_placement *placement);
> -
> -	/**
> -	 * struct ttm_bo_driver member move:
> -	 *
> -	 * @bo: the buffer to move
> -	 * @evict: whether this motion is evicting the buffer from
> -	 * the graphics address space
> -	 * @ctx: context for this move with parameters
> -	 * @new_mem: the new memory region receiving the buffer
> -	 @ @hop: placement for driver directed intermediate hop
> -	 *
> -	 * Move a buffer between two memory regions.
> -	 * Returns errno -EMULTIHOP if driver requests a hop
> -	 */
> -	int (*move)(struct ttm_buffer_object *bo, bool evict,
> -		    struct ttm_operation_ctx *ctx,
> -		    struct ttm_resource *new_mem,
> -		    struct ttm_place *hop);
> -
> -	/**
> -	 * struct ttm_bo_driver_member verify_access
> -	 *
> -	 * @bo: Pointer to a buffer object.
> -	 * @filp: Pointer to a struct file trying to access the object.
> -	 *
> -	 * Called from the map / write / read methods to verify that the
> -	 * caller is permitted to access the buffer object.
> -	 * This member may be set to NULL, which will refuse this kind of
> -	 * access for all buffer objects.
> -	 * This function should return 0 if access is granted, -EPERM otherwise.
> -	 */
> -	int (*verify_access)(struct ttm_buffer_object *bo,
> -			     struct file *filp);
> -
> -	/**
> -	 * Hook to notify driver about a resource delete.
> -	 */
> -	void (*delete_mem_notify)(struct ttm_buffer_object *bo);
> -
> -	/**
> -	 * notify the driver that we're about to swap out this bo
> -	 */
> -	void (*swap_notify)(struct ttm_buffer_object *bo);
> -
> -	/**
> -	 * Driver callback on when mapping io memory (for bo_move_memcpy
> -	 * for instance). TTM will take care to call io_mem_free whenever
> -	 * the mapping is not use anymore. io_mem_reserve & io_mem_free
> -	 * are balanced.
> -	 */
> -	int (*io_mem_reserve)(struct ttm_bo_device *bdev,
> -			      struct ttm_resource *mem);
> -	void (*io_mem_free)(struct ttm_bo_device *bdev,
> -			    struct ttm_resource *mem);
> -
> -	/**
> -	 * Return the pfn for a given page_offset inside the BO.
> -	 *
> -	 * @bo: the BO to look up the pfn for
> -	 * @page_offset: the offset to look up
> -	 */
> -	unsigned long (*io_mem_pfn)(struct ttm_buffer_object *bo,
> -				    unsigned long page_offset);
> -
> -	/**
> -	 * Read/write memory buffers for ptrace access
> -	 *
> -	 * @bo: the BO to access
> -	 * @offset: the offset from the start of the BO
> -	 * @buf: pointer to source/destination buffer
> -	 * @len: number of bytes to copy
> -	 * @write: whether to read (0) from or write (non-0) to BO
> -	 *
> -	 * If successful, this function should return the number of
> -	 * bytes copied, -EIO otherwise. If the number of bytes
> -	 * returned is < len, the function may be called again with
> -	 * the remainder of the buffer to copy.
> -	 */
> -	int (*access_memory)(struct ttm_buffer_object *bo, unsigned long offset,
> -			     void *buf, int len, int write);
> -
> -	/**
> -	 * struct ttm_bo_driver member del_from_lru_notify
> -	 *
> -	 * @bo: the buffer object deleted from lru
> -	 *
> -	 * notify driver that a BO was deleted from LRU.
> -	 */
> -	void (*del_from_lru_notify)(struct ttm_buffer_object *bo);
> -
> -	/**
> -	 * Notify the driver that we're about to release a BO
> -	 *
> -	 * @bo: BO that is about to be released
> -	 *
> -	 * Gives the driver a chance to do any cleanup, including
> -	 * adding fences that may force a delayed delete
> -	 */
> -	void (*release_notify)(struct ttm_buffer_object *bo);
> -};
> -
> -/**
> - * struct ttm_bo_global - Buffer object driver global data.
> - *
> - * @dummy_read_page: Pointer to a dummy page used for mapping requests
> - * of unpopulated pages.
> - * @shrink: A shrink callback object used for buffer object swap.
> - * @device_list_mutex: Mutex protecting the device list.
> - * This mutex is held while traversing the device list for pm options.
> - * @lru_lock: Spinlock protecting the bo subsystem lru lists.
> - * @device_list: List of buffer object devices.
> - * @swap_lru: Lru list of buffer objects used for swapping.
> - */
> -
> -extern struct ttm_bo_global {
> -
> -	/**
> -	 * Constant after init.
> -	 */
> -
> -	struct kobject kobj;
> -	struct page *dummy_read_page;
> -	spinlock_t lru_lock;
> -
> -	/**
> -	 * Protected by ttm_global_mutex.
> -	 */
> -	struct list_head device_list;
> -
> -	/**
> -	 * Protected by the lru_lock.
> -	 */
> -	struct list_head swap_lru[TTM_MAX_BO_PRIORITY];
> -
> -	/**
> -	 * Internal protection.
> -	 */
> -	atomic_t bo_count;
> -} ttm_bo_glob;
> -
> -
> -#define TTM_NUM_MEM_TYPES 8
> -
> -/**
> - * struct ttm_bo_device - Buffer object driver device-specific data.
> - *
> - * @driver: Pointer to a struct ttm_bo_driver struct setup by the driver.
> - * @man: An array of resource_managers.
> - * @vma_manager: Address space manager (pointer)
> - * lru_lock: Spinlock that protects the buffer+device lru lists and
> - * ddestroy lists.
> - * @dev_mapping: A pointer to the struct address_space representing the
> - * device address space.
> - * @wq: Work queue structure for the delayed delete workqueue.
> - *
> - */
> -
> -struct ttm_bo_device {
> -
> -	/*
> -	 * Constant after bo device init / atomic.
> -	 */
> -	struct list_head device_list;
> -	struct ttm_bo_driver *driver;
> -	/*
> -	 * access via ttm_manager_type.
> -	 */
> -	struct ttm_resource_manager sysman;
> -	struct ttm_resource_manager *man_drv[TTM_NUM_MEM_TYPES];
> -	/*
> -	 * Protected by internal locks.
> -	 */
> -	struct drm_vma_offset_manager *vma_manager;
> -	struct ttm_pool pool;
> -
> -	/*
> -	 * Protected by the global:lru lock.
> -	 */
> -	struct list_head ddestroy;
> -
> -	/*
> -	 * Protected by load / firstopen / lastclose /unload sync.
> -	 */
> -
> -	struct address_space *dev_mapping;
> -
> -	/*
> -	 * Internal protection.
> -	 */
> -
> -	struct delayed_work wq;
> -};
> -
> -static inline struct ttm_resource_manager *ttm_manager_type(struct ttm_b=
o_device *bdev,
> -							    int mem_type)
> -{
> -	return bdev->man_drv[mem_type];
> -}
> -
> -static inline void ttm_set_driver_manager(struct ttm_bo_device *bdev,
> -					  int type,
> -					  struct ttm_resource_manager *manager)
> -{
> -	bdev->man_drv[type] =3D manager;
> -}
> -
>  /**
>   * struct ttm_lru_bulk_move_pos
>   *
> @@ -388,31 +101,6 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>  		     struct ttm_resource *mem,
>  		     struct ttm_operation_ctx *ctx);
>  =

> -int ttm_bo_device_release(struct ttm_bo_device *bdev);
> -
> -/**
> - * ttm_bo_device_init
> - *
> - * @bdev: A pointer to a struct ttm_bo_device to initialize.
> - * @glob: A pointer to an initialized struct ttm_bo_global.
> - * @driver: A pointer to a struct ttm_bo_driver set up by the caller.
> - * @dev: The core kernel device pointer for DMA mappings and allocations.
> - * @mapping: The address space to use for this bo.
> - * @vma_manager: A pointer to a vma manager.
> - * @use_dma_alloc: If coherent DMA allocation API should be used.
> - * @use_dma32: If we should use GFP_DMA32 for device memory allocations.
> - *
> - * Initializes a struct ttm_bo_device:
> - * Returns:
> - * !0: Failure.
> - */
> -int ttm_bo_device_init(struct ttm_bo_device *bdev,
> -		       struct ttm_bo_driver *driver,
> -		       struct device *dev,
> -		       struct address_space *mapping,
> -		       struct drm_vma_offset_manager *vma_manager,
> -		       bool use_dma_alloc, bool use_dma32);
> -
>  /**
>   * ttm_bo_unmap_virtual
>   *
> @@ -494,9 +182,9 @@ static inline int ttm_bo_reserve_slowpath(struct ttm_=
buffer_object *bo,
>  static inline void
>  ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
>  {
> -	spin_lock(&ttm_bo_glob.lru_lock);
> +	spin_lock(&ttm_glob.lru_lock);
>  	ttm_bo_move_to_lru_tail(bo, &bo->mem, NULL);
> -	spin_unlock(&ttm_bo_glob.lru_lock);
> +	spin_unlock(&ttm_glob.lru_lock);
>  }
>  =

>  static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
> @@ -538,9 +226,9 @@ static inline void ttm_bo_unreserve(struct ttm_buffer=
_object *bo)
>  /*
>   * ttm_bo_util.c
>   */
> -int ttm_mem_io_reserve(struct ttm_bo_device *bdev,
> +int ttm_mem_io_reserve(struct ttm_device *bdev,
>  		       struct ttm_resource *mem);
> -void ttm_mem_io_free(struct ttm_bo_device *bdev,
> +void ttm_mem_io_free(struct ttm_device *bdev,
>  		     struct ttm_resource *mem);
>  =

>  /**
> @@ -631,7 +319,7 @@ void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>   * Initialise a generic range manager for the selected memory type.
>   * The range manager is installed for this device in the type slot.
>   */
> -int ttm_range_man_init(struct ttm_bo_device *bdev,
> +int ttm_range_man_init(struct ttm_device *bdev,
>  		       unsigned type, bool use_tt,
>  		       unsigned long p_size);
>  =

> @@ -643,7 +331,7 @@ int ttm_range_man_init(struct ttm_bo_device *bdev,
>   *
>   * Remove the generic range manager from a slot and tear it down.
>   */
> -int ttm_range_man_fini(struct ttm_bo_device *bdev,
> +int ttm_range_man_fini(struct ttm_device *bdev,
>  		       unsigned type);
>  =

>  #endif
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> new file mode 100644
> index 000000000000..7bc8bb797161
> --- /dev/null
> +++ b/include/drm/ttm/ttm_device.h
> @@ -0,0 +1,319 @@
> +/*
> + * Copyright 2020 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be includ=
ed in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES=
 OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * Authors: Christian K=F6nig
> + */
> +
> +#ifndef _TTM_DEVICE_H_
> +#define _TTM_DEVICE_H_
> +
> +#include <linux/types.h>
> +#include <linux/workqueue.h>
> +#include <drm/ttm/ttm_resource.h>
> +#include <drm/ttm/ttm_pool.h>
> +
> +#define TTM_NUM_MEM_TYPES 8
> +
> +struct ttm_device;
> +struct ttm_placement;
> +struct ttm_buffer_object;
> +struct ttm_operation_ctx;
> +
> +/**
> + * struct ttm_global - Buffer object driver global data.
> + *
> + * @dummy_read_page: Pointer to a dummy page used for mapping requests
> + * of unpopulated pages.
> + * @shrink: A shrink callback object used for buffer object swap.
> + * @device_list_mutex: Mutex protecting the device list.
> + * This mutex is held while traversing the device list for pm options.
> + * @lru_lock: Spinlock protecting the bo subsystem lru lists.
> + * @device_list: List of buffer object devices.
> + * @swap_lru: Lru list of buffer objects used for swapping.
> + */
> +extern struct ttm_global {
> +
> +	/**
> +	 * Constant after init.
> +	 */
> +
> +	struct kobject kobj;
> +	struct page *dummy_read_page;
> +	spinlock_t lru_lock;
> +
> +	/**
> +	 * Protected by ttm_global_mutex.
> +	 */
> +	struct list_head device_list;
> +
> +	/**
> +	 * Protected by the lru_lock.
> +	 */
> +	struct list_head swap_lru[TTM_MAX_BO_PRIORITY];
> +
> +	/**
> +	 * Internal protection.
> +	 */
> +	atomic_t bo_count;
> +} ttm_glob;
> +
> +struct ttm_device_funcs {
> +	/**
> +	 * ttm_tt_create
> +	 *
> +	 * @bo: The buffer object to create the ttm for.
> +	 * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX flags.
> +	 *
> +	 * Create a struct ttm_tt to back data with system memory pages.
> +	 * No pages are actually allocated.
> +	 * Returns:
> +	 * NULL: Out of memory.
> +	 */
> +	struct ttm_tt *(*ttm_tt_create)(struct ttm_buffer_object *bo,
> +					uint32_t page_flags);
> +
> +	/**
> +	 * ttm_tt_populate
> +	 *
> +	 * @ttm: The struct ttm_tt to contain the backing pages.
> +	 *
> +	 * Allocate all backing pages
> +	 * Returns:
> +	 * -ENOMEM: Out of memory.
> +	 */
> +	int (*ttm_tt_populate)(struct ttm_device *bdev,
> +			       struct ttm_tt *ttm,
> +			       struct ttm_operation_ctx *ctx);
> +
> +	/**
> +	 * ttm_tt_unpopulate
> +	 *
> +	 * @ttm: The struct ttm_tt to contain the backing pages.
> +	 *
> +	 * Free all backing page
> +	 */
> +	void (*ttm_tt_unpopulate)(struct ttm_device *bdev,
> +				  struct ttm_tt *ttm);
> +
> +	/**
> +	 * ttm_tt_destroy
> +	 *
> +	 * @bdev: Pointer to a ttm device
> +	 * @ttm: Pointer to a struct ttm_tt.
> +	 *
> +	 * Destroy the backend. This will be call back from ttm_tt_destroy so
> +	 * don't call ttm_tt_destroy from the callback or infinite loop.
> +	 */
> +	void (*ttm_tt_destroy)(struct ttm_device *bdev, struct ttm_tt *ttm);
> +
> +	/**
> +	 * struct ttm_bo_driver member eviction_valuable
> +	 *
> +	 * @bo: the buffer object to be evicted
> +	 * @place: placement we need room for
> +	 *
> +	 * Check with the driver if it is valuable to evict a BO to make room
> +	 * for a certain placement.
> +	 */
> +	bool (*eviction_valuable)(struct ttm_buffer_object *bo,
> +				  const struct ttm_place *place);
> +	/**
> +	 * struct ttm_bo_driver member evict_flags:
> +	 *
> +	 * @bo: the buffer object to be evicted
> +	 *
> +	 * Return the bo flags for a buffer which is not mapped to the hardware.
> +	 * These will be placed in proposed_flags so that when the move is
> +	 * finished, they'll end up in bo->mem.flags
> +	 * This should not cause multihop evictions, and the core will warn
> +	 * if one is proposed.
> +	 */
> +
> +	void (*evict_flags)(struct ttm_buffer_object *bo,
> +			    struct ttm_placement *placement);
> +
> +	/**
> +	 * struct ttm_bo_driver member move:
> +	 *
> +	 * @bo: the buffer to move
> +	 * @evict: whether this motion is evicting the buffer from
> +	 * the graphics address space
> +	 * @ctx: context for this move with parameters
> +	 * @new_mem: the new memory region receiving the buffer
> +	 @ @hop: placement for driver directed intermediate hop
> +	 *
> +	 * Move a buffer between two memory regions.
> +	 * Returns errno -EMULTIHOP if driver requests a hop
> +	 */
> +	int (*move)(struct ttm_buffer_object *bo, bool evict,
> +		    struct ttm_operation_ctx *ctx,
> +		    struct ttm_resource *new_mem,
> +		    struct ttm_place *hop);
> +
> +	/**
> +	 * struct ttm_bo_driver_member verify_access
> +	 *
> +	 * @bo: Pointer to a buffer object.
> +	 * @filp: Pointer to a struct file trying to access the object.
> +	 *
> +	 * Called from the map / write / read methods to verify that the
> +	 * caller is permitted to access the buffer object.
> +	 * This member may be set to NULL, which will refuse this kind of
> +	 * access for all buffer objects.
> +	 * This function should return 0 if access is granted, -EPERM otherwise.
> +	 */
> +	int (*verify_access)(struct ttm_buffer_object *bo,
> +			     struct file *filp);
> +
> +	/**
> +	 * Hook to notify driver about a resource delete.
> +	 */
> +	void (*delete_mem_notify)(struct ttm_buffer_object *bo);
> +
> +	/**
> +	 * notify the driver that we're about to swap out this bo
> +	 */
> +	void (*swap_notify)(struct ttm_buffer_object *bo);
> +
> +	/**
> +	 * Driver callback on when mapping io memory (for bo_move_memcpy
> +	 * for instance). TTM will take care to call io_mem_free whenever
> +	 * the mapping is not use anymore. io_mem_reserve & io_mem_free
> +	 * are balanced.
> +	 */
> +	int (*io_mem_reserve)(struct ttm_device *bdev,
> +			      struct ttm_resource *mem);
> +	void (*io_mem_free)(struct ttm_device *bdev,
> +			    struct ttm_resource *mem);
> +
> +	/**
> +	 * Return the pfn for a given page_offset inside the BO.
> +	 *
> +	 * @bo: the BO to look up the pfn for
> +	 * @page_offset: the offset to look up
> +	 */
> +	unsigned long (*io_mem_pfn)(struct ttm_buffer_object *bo,
> +				    unsigned long page_offset);
> +
> +	/**
> +	 * Read/write memory buffers for ptrace access
> +	 *
> +	 * @bo: the BO to access
> +	 * @offset: the offset from the start of the BO
> +	 * @buf: pointer to source/destination buffer
> +	 * @len: number of bytes to copy
> +	 * @write: whether to read (0) from or write (non-0) to BO
> +	 *
> +	 * If successful, this function should return the number of
> +	 * bytes copied, -EIO otherwise. If the number of bytes
> +	 * returned is < len, the function may be called again with
> +	 * the remainder of the buffer to copy.
> +	 */
> +	int (*access_memory)(struct ttm_buffer_object *bo, unsigned long offset,
> +			     void *buf, int len, int write);
> +
> +	/**
> +	 * struct ttm_bo_driver member del_from_lru_notify
> +	 *
> +	 * @bo: the buffer object deleted from lru
> +	 *
> +	 * notify driver that a BO was deleted from LRU.
> +	 */
> +	void (*del_from_lru_notify)(struct ttm_buffer_object *bo);
> +
> +	/**
> +	 * Notify the driver that we're about to release a BO
> +	 *
> +	 * @bo: BO that is about to be released
> +	 *
> +	 * Gives the driver a chance to do any cleanup, including
> +	 * adding fences that may force a delayed delete
> +	 */
> +	void (*release_notify)(struct ttm_buffer_object *bo);
> +};
> +
> +/**
> + * struct ttm_device - Buffer object driver device-specific data.
> + *
> + * @device_list: Our entry in the global device list.
> + * @funcs: Function table for the device.
> + * @sysman: Resource manager for the system domain.
> + * @man_drv: An array of resource_managers.
> + * @vma_manager: Address space manager.
> + * @pool: page pool for the device.
> + * @dev_mapping: A pointer to the struct address_space representing the
> + * device address space.
> + * @wq: Work queue structure for the delayed delete workqueue.
> + */
> +struct ttm_device {
> +	/*
> +	 * Constant after bo device init
> +	 */
> +	struct list_head device_list;
> +	struct ttm_device_funcs *funcs;
> +
> +	/*
> +	 * Access via ttm_manager_type.
> +	 */
> +	struct ttm_resource_manager sysman;
> +	struct ttm_resource_manager *man_drv[TTM_NUM_MEM_TYPES];
> +
> +	/*
> +	 * Protected by internal locks.
> +	 */
> +	struct drm_vma_offset_manager *vma_manager;
> +	struct ttm_pool pool;
> +
> +	/*
> +	 * Protected by the global:lru lock.
> +	 */
> +	struct list_head ddestroy;
> +
> +	/*
> +	 * Protected by load / firstopen / lastclose /unload sync.
> +	 */
> +	struct address_space *dev_mapping;
> +
> +	/*
> +	 * Internal protection.
> +	 */
> +	struct delayed_work wq;
> +};
> +
> +static inline struct ttm_resource_manager *
> +ttm_manager_type(struct ttm_device *bdev, int mem_type)
> +{
> +	return bdev->man_drv[mem_type];
> +}
> +
> +static inline void ttm_set_driver_manager(struct ttm_device *bdev, int t=
ype,
> +					  struct ttm_resource_manager *manager)
> +{
> +	bdev->man_drv[type] =3D manager;
> +}
> +
> +int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *fu=
ncs,
> +		    struct device *dev, struct address_space *mapping,
> +		    struct drm_vma_offset_manager *vma_manager,
> +		    bool use_dma_alloc, bool use_dma32);
> +void ttm_device_fini(struct ttm_device *bdev);
> +
> +#endif
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resourc=
e.h
> index da0ed7e8c915..6164ccf4f308 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -33,7 +33,7 @@
>  =

>  #define TTM_MAX_BO_PRIORITY	4U
>  =

> -struct ttm_bo_device;
> +struct ttm_device;
>  struct ttm_resource_manager;
>  struct ttm_resource;
>  struct ttm_place;
> @@ -233,7 +233,7 @@ void ttm_resource_free(struct ttm_buffer_object *bo, =
struct ttm_resource *res);
>  void ttm_resource_manager_init(struct ttm_resource_manager *man,
>  			       unsigned long p_size);
>  =

> -int ttm_resource_manager_evict_all(struct ttm_bo_device *bdev,
> +int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>  				   struct ttm_resource_manager *man);
>  =

>  void ttm_resource_manager_debug(struct ttm_resource_manager *man,
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 6c8eb9a4de81..0020a0588985 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -118,14 +118,14 @@ void ttm_tt_fini(struct ttm_tt *ttm);
>   *
>   * Unbind, unpopulate and destroy common struct ttm_tt.
>   */
> -void ttm_tt_destroy(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
> +void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm);
>  =

>  /**
>   * ttm_tt_destroy_common:
>   *
>   * Called from driver to destroy common path.
>   */
> -void ttm_tt_destroy_common(struct ttm_bo_device *bdev, struct ttm_tt *tt=
m);
> +void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm);
>  =

>  /**
>   * ttm_tt_swapin:
> @@ -135,7 +135,7 @@ void ttm_tt_destroy_common(struct ttm_bo_device *bdev=
, struct ttm_tt *ttm);
>   * Swap in a previously swap out ttm_tt.
>   */
>  int ttm_tt_swapin(struct ttm_tt *ttm);
> -int ttm_tt_swapout(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
> +int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm);
>  =

>  /**
>   * ttm_tt_populate - allocate pages for a ttm
> @@ -144,7 +144,7 @@ int ttm_tt_swapout(struct ttm_bo_device *bdev, struct=
 ttm_tt *ttm);
>   *
>   * Calls the driver method to allocate pages for a ttm
>   */
> -int ttm_tt_populate(struct ttm_bo_device *bdev, struct ttm_tt *ttm, stru=
ct ttm_operation_ctx *ctx);
> +int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm, struct =
ttm_operation_ctx *ctx);
>  =

>  /**
>   * ttm_tt_unpopulate - free pages from a ttm
> @@ -153,7 +153,7 @@ int ttm_tt_populate(struct ttm_bo_device *bdev, struc=
t ttm_tt *ttm, struct ttm_o
>   *
>   * Calls the driver method to free all pages from a ttm
>   */
> -void ttm_tt_unpopulate(struct ttm_bo_device *bdev, struct ttm_tt *ttm);
> +void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm);
>  =

>  #if IS_ENABLED(CONFIG_AGP)
>  #include <linux/agp_backend.h>
> -- =

> 2.25.1
> =

> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
