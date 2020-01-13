Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181C413951C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2020 16:46:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 284E96E0FF;
	Mon, 13 Jan 2020 15:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2078.outbound.protection.outlook.com [40.107.220.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 535AD6E0FE
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2020 15:46:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bCM/dtXiuWH/k8HTkfgzMx9FMijwG6zdlFSvZ1bNhryCdXWlOrWQ2QDUg+NlZ5fqVfiyz7TQ6UIeTeie81gb7t4ewrcf/uw5wMQU2o7QzFjzyOlxEBtcTGNKUT+7lIplpefnm1W6ew5LC1pEap8FcLT3kGBVhFsTw7sox1JE6z7/L6Iw25gLiGenkQX43qwz9PUTaRFQRTB+FQCXjpnAwrp1pBZm7NTJFyZ6/O96RAtPxDIRu0vIhEe0Ie1t8p5HafJ2+ZWOnkoO4N8rtBFQ0Sab8G2PdWgtFJQPBKhbm3eQGPEtG61LzP3XFedgkbAkeW0FvbwENhqnqFlmxxb4ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEeLUFptiGnLxNGMfkgYbVg1Z+ZIFv2b8k62WKjnsJk=;
 b=Zmf5S1ZjK9JYVGXMR5iqHdOfztN2WykiFG+vfwZ/zW7ij36uGZ3Fo86ENqwQQrmIsppuedHmz0r1DsjRAwCpQn4gCKzydxP0C0YT9Vs0KnSkMzMpgKlLNHZwgW4MHvaYdaaZGbuMgUqE1Z2O8o2Cw8w/hgzZ/Zv3vZWJ71ytyNwI66C/ldwV69WNzkq2v0mnd3yPb8oDxcTzuiKHjfcvBJsJX1yPGXjlrV6ABJkwc3oZ6h2aazm5G2kOx4A/Lll/w2gzY/UeAl/Jy6XVfkEpuLuq8LcbcYvEe1gPJ7u7FAI5jM24RlhLe+S/LGLcYtQlELoPzm+NfhLKwXzEldDxUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEeLUFptiGnLxNGMfkgYbVg1Z+ZIFv2b8k62WKjnsJk=;
 b=a8KCvZ2gMW6uHzRKxe1bYGaMXZr3iVpiI88z3Ue6i0A9td11zMjx91XNP9FB3mda7mcUnIEdWBNGsKNEJ5KVeul1swgAxKAcwkpkCvxO/nJuseRgBsgT9ivcx+alYMqLB5Xc6wtSnBHAhtLNwnRnpYndy8Bf/wG7YYVZUosKwT0=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4191.namprd12.prod.outlook.com (52.135.48.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 15:46:06 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f945:5c4c:9c3f:930a]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f945:5c4c:9c3f:930a%6]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 15:46:06 +0000
Date: Mon, 13 Jan 2020 23:45:58 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: nuke invalidate_caches callback
Message-ID: <20200113154557.GA4021@jenkins-Celadon-RN>
References: <20200110150954.95958-1-christian.koenig@amd.com>
 <ca36a644-ced7-3c15-cdc0-0bffec0c74e9@gmail.com>
Content-Disposition: inline
In-Reply-To: <ca36a644-ced7-3c15-cdc0-0bffec0c74e9@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: HK0PR01CA0052.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::16) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
MIME-Version: 1.0
Received: from jenkins-Celadon-RN (180.167.199.189) by
 HK0PR01CA0052.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2623.9 via Frontend
 Transport; Mon, 13 Jan 2020 15:46:04 +0000
X-Originating-IP: [180.167.199.189]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c172ffa9-e6cd-48a4-6588-08d7983fb37a
X-MS-TrafficTypeDiagnostic: MN2PR12MB4191:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4191281E4551D24223A064E4EC350@MN2PR12MB4191.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 028166BF91
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(366004)(376002)(396003)(136003)(346002)(199004)(189003)(8676002)(16526019)(186003)(6496006)(4326008)(956004)(26005)(55016002)(5660300002)(2906002)(52116002)(8936002)(81156014)(81166006)(9686003)(6666004)(6916009)(1076003)(66574012)(66946007)(66556008)(33656002)(66476007)(478600001)(316002)(86362001)(33716001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4191;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dhbiRQkgtaVmJXcMCNdp2WFTuUd7RUSqJNF+2sKFuK2XXYa4RKLjwJjzGU05ld94TqZ3lFdFi+YHrIpWiiiO3W9EJcSVQk3YzNln4pzEYncvxH5E1PSDuIZfJibAKez+1c5xFqmAjvC/AjR2OGotYY5j4xvlseHU7k0ZpNzjd08UfUuXpnq7aPDprpenXmVe56bw/0Orcdn8iVHAElcSIH7++XKamcMV83mouQ3ejjbG0T0btUrjOsqVc14jBv6IFDRWPET+ed4mcEtnWxO081fUh73maSxEfyBt/MF4FoNgXbRbywQx8nd+uwImupwLut8rCP/Ojrp9zfOiZlmSgaghUrNDtG+RD26CmaRUP8Iw18c9qbl1kn1NgvbfZP+Wm2jYt24hxEQnME63mbz3EweGmrkQQfx9r2Yhb/a/LH9Oo5p8yAmp5Ip3B8qyiMPC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c172ffa9-e6cd-48a4-6588-08d7983fb37a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2020 15:46:05.9158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzRCb0ijp9ML5rf66a0ZaituLMKrvjpWBWgcVwqlnFTNdvwLG1prIRgidrP7MsdahZKAwZ6nviL8faHWKk2phA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4191
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

On Mon, Jan 13, 2020 at 10:45:25PM +0800, Christian K=F6nig wrote:
> Ping? Just a trivial cleanup.
> =

> Am 10.01.20 um 16:09 schrieb Christian K=F6nig:
> > Another completely unused feature.
> >
> > Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Reviewed-by: Huang Rui <ray.huang@amd.com>

> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  6 ------
> >   drivers/gpu/drm/nouveau/nouveau_bo.c       |  8 --------
> >   drivers/gpu/drm/qxl/qxl_ttm.c              |  6 ------
> >   drivers/gpu/drm/radeon/radeon_ttm.c        |  6 ------
> >   drivers/gpu/drm/ttm/ttm_bo.c               |  9 +--------
> >   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  6 ------
> >   include/drm/ttm/ttm_bo_driver.h            | 15 ---------------
> >   7 files changed, 1 insertion(+), 55 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 445de594c214..7c4b1cbd9a50 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -68,11 +68,6 @@ static int amdgpu_map_buffer(struct ttm_buffer_objec=
t *bo,
> >   static int amdgpu_ttm_debugfs_init(struct amdgpu_device *adev);
> >   static void amdgpu_ttm_debugfs_fini(struct amdgpu_device *adev);
> >   =

> > -static int amdgpu_invalidate_caches(struct ttm_bo_device *bdev, uint32=
_t flags)
> > -{
> > -	return 0;
> > -}
> > -
> >   /**
> >    * amdgpu_init_mem_type - Initialize a memory manager for a specific =
type of
> >    * memory request.
> > @@ -1637,7 +1632,6 @@ static struct ttm_bo_driver amdgpu_bo_driver =3D {
> >   	.ttm_tt_create =3D &amdgpu_ttm_tt_create,
> >   	.ttm_tt_populate =3D &amdgpu_ttm_tt_populate,
> >   	.ttm_tt_unpopulate =3D &amdgpu_ttm_tt_unpopulate,
> > -	.invalidate_caches =3D &amdgpu_invalidate_caches,
> >   	.init_mem_type =3D &amdgpu_init_mem_type,
> >   	.eviction_valuable =3D amdgpu_ttm_bo_eviction_valuable,
> >   	.evict_flags =3D &amdgpu_evict_flags,
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nou=
veau/nouveau_bo.c
> > index f8015e0318d7..81668104595f 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > @@ -646,13 +646,6 @@ nouveau_ttm_tt_create(struct ttm_buffer_object *bo=
, uint32_t page_flags)
> >   	return nouveau_sgdma_create_ttm(bo, page_flags);
> >   }
> >   =

> > -static int
> > -nouveau_bo_invalidate_caches(struct ttm_bo_device *bdev, uint32_t flag=
s)
> > -{
> > -	/* We'll do this from user space. */
> > -	return 0;
> > -}
> > -
> >   static int
> >   nouveau_bo_init_mem_type(struct ttm_bo_device *bdev, uint32_t type,
> >   			 struct ttm_mem_type_manager *man)
> > @@ -1696,7 +1689,6 @@ struct ttm_bo_driver nouveau_bo_driver =3D {
> >   	.ttm_tt_create =3D &nouveau_ttm_tt_create,
> >   	.ttm_tt_populate =3D &nouveau_ttm_tt_populate,
> >   	.ttm_tt_unpopulate =3D &nouveau_ttm_tt_unpopulate,
> > -	.invalidate_caches =3D nouveau_bo_invalidate_caches,
> >   	.init_mem_type =3D nouveau_bo_init_mem_type,
> >   	.eviction_valuable =3D ttm_bo_eviction_valuable,
> >   	.evict_flags =3D nouveau_bo_evict_flags,
> > diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_tt=
m.c
> > index 16a5e903533d..62a5e424971b 100644
> > --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> > +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> > @@ -48,11 +48,6 @@ static struct qxl_device *qxl_get_qdev(struct ttm_bo=
_device *bdev)
> >   	return qdev;
> >   }
> >   =

> > -static int qxl_invalidate_caches(struct ttm_bo_device *bdev, uint32_t =
flags)
> > -{
> > -	return 0;
> > -}
> > -
> >   static int qxl_init_mem_type(struct ttm_bo_device *bdev, uint32_t typ=
e,
> >   			     struct ttm_mem_type_manager *man)
> >   {
> > @@ -256,7 +251,6 @@ static void qxl_bo_move_notify(struct ttm_buffer_ob=
ject *bo,
> >   =

> >   static struct ttm_bo_driver qxl_bo_driver =3D {
> >   	.ttm_tt_create =3D &qxl_ttm_tt_create,
> > -	.invalidate_caches =3D &qxl_invalidate_caches,
> >   	.init_mem_type =3D &qxl_init_mem_type,
> >   	.eviction_valuable =3D ttm_bo_eviction_valuable,
> >   	.evict_flags =3D &qxl_evict_flags,
> > diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rade=
on/radeon_ttm.c
> > index f4af67035673..40282bf0adbe 100644
> > --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> > +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> > @@ -66,11 +66,6 @@ static struct radeon_device *radeon_get_rdev(struct =
ttm_bo_device *bdev)
> >   	return rdev;
> >   }
> >   =

> > -static int radeon_invalidate_caches(struct ttm_bo_device *bdev, uint32=
_t flags)
> > -{
> > -	return 0;
> > -}
> > -
> >   static int radeon_init_mem_type(struct ttm_bo_device *bdev, uint32_t =
type,
> >   				struct ttm_mem_type_manager *man)
> >   {
> > @@ -774,7 +769,6 @@ static struct ttm_bo_driver radeon_bo_driver =3D {
> >   	.ttm_tt_create =3D &radeon_ttm_tt_create,
> >   	.ttm_tt_populate =3D &radeon_ttm_tt_populate,
> >   	.ttm_tt_unpopulate =3D &radeon_ttm_tt_unpopulate,
> > -	.invalidate_caches =3D &radeon_invalidate_caches,
> >   	.init_mem_type =3D &radeon_init_mem_type,
> >   	.eviction_valuable =3D ttm_bo_eviction_valuable,
> >   	.evict_flags =3D &radeon_evict_flags,
> > diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> > index 5df596fb0280..06f6d650827f 100644
> > --- a/drivers/gpu/drm/ttm/ttm_bo.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> > @@ -372,14 +372,7 @@ static int ttm_bo_handle_move_mem(struct ttm_buffe=
r_object *bo,
> >   	}
> >   =

> >   moved:
> > -	if (bo->evicted) {
> > -		if (bdev->driver->invalidate_caches) {
> > -			ret =3D bdev->driver->invalidate_caches(bdev, bo->mem.placement);
> > -			if (ret)
> > -				pr_err("Can not flush read caches\n");
> > -		}
> > -		bo->evicted =3D false;
> > -	}
> > +	bo->evicted =3D false;
> >   =

> >   	if (bo->mem.mm_node)
> >   		bo->offset =3D (bo->mem.start << PAGE_SHIFT) +
> > diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/d=
rm/vmwgfx/vmwgfx_ttm_buffer.c
> > index d8ea3dd10af0..3f3b2c7a208a 100644
> > --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> > @@ -736,11 +736,6 @@ static struct ttm_tt *vmw_ttm_tt_create(struct ttm=
_buffer_object *bo,
> >   	return NULL;
> >   }
> >   =

> > -static int vmw_invalidate_caches(struct ttm_bo_device *bdev, uint32_t =
flags)
> > -{
> > -	return 0;
> > -}
> > -
> >   static int vmw_init_mem_type(struct ttm_bo_device *bdev, uint32_t typ=
e,
> >   		      struct ttm_mem_type_manager *man)
> >   {
> > @@ -866,7 +861,6 @@ struct ttm_bo_driver vmw_bo_driver =3D {
> >   	.ttm_tt_create =3D &vmw_ttm_tt_create,
> >   	.ttm_tt_populate =3D &vmw_ttm_populate,
> >   	.ttm_tt_unpopulate =3D &vmw_ttm_unpopulate,
> > -	.invalidate_caches =3D vmw_invalidate_caches,
> >   	.init_mem_type =3D vmw_init_mem_type,
> >   	.eviction_valuable =3D ttm_bo_eviction_valuable,
> >   	.evict_flags =3D vmw_evict_flags,
> > diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_d=
river.h
> > index cac7a8a0825a..c9e0fd09f4b2 100644
> > --- a/include/drm/ttm/ttm_bo_driver.h
> > +++ b/include/drm/ttm/ttm_bo_driver.h
> > @@ -210,8 +210,6 @@ struct ttm_mem_type_manager {
> >    * struct ttm_bo_driver
> >    *
> >    * @create_ttm_backend_entry: Callback to create a struct ttm_backend.
> > - * @invalidate_caches: Callback to invalidate read caches when a buffe=
r object
> > - * has been evicted.
> >    * @init_mem_type: Callback to initialize a struct ttm_mem_type_manag=
er
> >    * structure.
> >    * @evict_flags: Callback to obtain placement flags when a buffer is =
evicted.
> > @@ -256,19 +254,6 @@ struct ttm_bo_driver {
> >   	 */
> >   	void (*ttm_tt_unpopulate)(struct ttm_tt *ttm);
> >   =

> > -	/**
> > -	 * struct ttm_bo_driver member invalidate_caches
> > -	 *
> > -	 * @bdev: the buffer object device.
> > -	 * @flags: new placement of the rebound buffer object.
> > -	 *
> > -	 * A previosly evicted buffer has been rebound in a
> > -	 * potentially new location. Tell the driver that it might
> > -	 * consider invalidating read (texture) caches on the next command
> > -	 * submission as a consequence.
> > -	 */
> > -
> > -	int (*invalidate_caches)(struct ttm_bo_device *bdev, uint32_t flags);
> >   	int (*init_mem_type)(struct ttm_bo_device *bdev, uint32_t type,
> >   			     struct ttm_mem_type_manager *man);
> >   =

> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
