Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5640E36437E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 15:19:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BCA6E30F;
	Mon, 19 Apr 2021 13:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2040.outbound.protection.outlook.com [40.107.94.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF10E6E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 13:19:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uo+j0G5AQwthBR+y4MMWfqwEyQ7esppQbeBiaCB2bCMroL3Nmul5TzCmKylEwZhZSv7LPC1JN1cJpHeSqwM1nrnqCqN9iiJjtKkETGVnQ3SqmaBuJStCnGo4NS6sZPSeKCYMBLsv0zk/Mf9sxGPjthzrd0rfypg+MOzig55Qo7OiH7VDRRxmPN34k/MF29jSK/mWHSmh8Y8PJfmnGdQ/399ZkDR7vTTjz+l0Pyw6wwcsAeDnWUaGFzVcXbt60XiDdjHDXg52sQseeXOSdKigs0Y1KAkNsmqDWVqrpF8xiRjTRMNTHlDlDgOg0Q5oeE5S1DhqHOCHgIxMifsMNa1f4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhbI+ceyD1LPq5QeGPFSTNAqt5OItqF1A7CqQ5N5u4U=;
 b=WG/qwbFXkVy0POlsYbUChUryS87SFbUQy6/Uq8oi/bkN7ee1vR+diX8VgQ9DDBbGEVO5Qr7L1pJVvGUxiJPCX2iD9bXlv9FMzKFMTPMMdu9XGmutcZcGZmwVvvDXCzLS7VWFjGuWmfEdkzRSIGUnM/nabs6bJ3ie2sjZPZjUkUZP+eyuq+oa41Wb/p0bf+Z+xPqr21iQ9QWRFSzZsgJvk9PZFpsjUk9fqMIHKWMhxAMq8ogPuu4V/NLyrep3UgDVNrbuVKI5sqDY5jh9Rl+mN1sNPuFiYOAn/8jVEDlehTjL9cWe037jRUuyiM6A/z5VeadGHnTU0S/YTiPm1LDQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhbI+ceyD1LPq5QeGPFSTNAqt5OItqF1A7CqQ5N5u4U=;
 b=hpqurmvUG5GD9cXhEvseFIKL0N0K5CynlqsMFP9xYjiTNOS21CITXE1+Oq4LIz3vzpfq/cUEgtakh2nm8sDsd77D1HR8WFBSaDpbi1Qyq1wwhk2reLmTsGp+DAPE09BGl9LJamUp3OBkQk4xtNzBGHBn298FvJyYLJi3AcRDay4=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MWHPR12MB1248.namprd12.prod.outlook.com (2603:10b6:300:12::21)
 by MWHPR1201MB0031.namprd12.prod.outlook.com (2603:10b6:301:57::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.23; Mon, 19 Apr
 2021 13:19:26 +0000
Received: from MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28]) by MWHPR12MB1248.namprd12.prod.outlook.com
 ([fe80::5094:3a69:806f:8a28%5]) with mapi id 15.20.4042.024; Mon, 19 Apr 2021
 13:19:25 +0000
Date: Mon, 19 Apr 2021 21:19:15 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/ttm: remove special handling for non GEM drivers
Message-ID: <20210419131915.GA4046046@hr-amd>
References: <20210419092853.1605-1-christian.koenig@amd.com>
Content-Disposition: inline
In-Reply-To: <20210419092853.1605-1-christian.koenig@amd.com>
X-Originating-IP: [58.247.170.245]
X-ClientProxiedBy: HKAPR03CA0014.apcprd03.prod.outlook.com
 (2603:1096:203:c8::19) To MWHPR12MB1248.namprd12.prod.outlook.com
 (2603:10b6:300:12::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-amd (58.247.170.245) by
 HKAPR03CA0014.apcprd03.prod.outlook.com (2603:1096:203:c8::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.6 via Frontend Transport; Mon, 19 Apr 2021 13:19:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e929662-a1c8-4c86-0a56-08d90335c0dd
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0031:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB00314FDA20391403DDE207EDEC499@MWHPR1201MB0031.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:525;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mQVdFLTmOi0zjJxw1EriROIOVrUB95hC9w8MisGFJBc67y6Ag/Rt36On+4pcicpm4QJ+Rq5GMHHlPcKXE8SJzOq4URHhvksi/F+gY0SubWM3Io7oo3N2EjfnNTBpZjyhcmjiQiiVS6/f8sDN5qgYxn6Jtvr1nQXeioxYbYunDU+DoFOvQ0ntcIhp/6lqyqzPY3w0b54ICqzWmRqotxglfEiQkyRN6InhhzQvYkR0p4hZ8DhV3EaSdQuKGyvOCT0JX6feUqgmgUGT2C0IZdcaaYqmh2jRVRhPvPUuNYtQ8/2yFtBq+PFyzPv5obBz5pBE3Bh9r6ET2VlSw++JpFCZ4Q0ZifflwFonqsQVUt9lpEcsalGUE0rKtYaGUhXEdRqj6wVDCQ7ejHIrygU//xWOvE6vOERr2kwz1NrkXtmF5R0Pl78eeJtjU9LP5m0SLuK/HvmAf50nClLw9T+ybwgHLvXP3A63WqKYrC6bcrb1CwfM5CeIXNi4q33ugPv84WHStBsnmoRUYYfmwPcBs3MXDOW8bPVNO+vkG7L2nLgWXE05UpgvfKpyMPxPyvR9LJvb1aS6BUVwCwIEoknvhmuB1kcnnAjcqeapddtqdFbOL/02Oh+BLaSnLoZM7TKDZReInxa3TwbWMrvgoIu4reRh+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR12MB1248.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(136003)(39860400002)(396003)(346002)(54906003)(33656002)(6666004)(316002)(4326008)(55016002)(9686003)(66946007)(2906002)(6916009)(6496006)(5660300002)(1076003)(956004)(86362001)(26005)(66476007)(16526019)(52116002)(66556008)(186003)(33716001)(8936002)(478600001)(83380400001)(8676002)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?E0cSvsQ/IVML8NBb2dzgW0pR80xckiegLpVtQHQ/AU6gnHYaw0qZu9j9Hp?=
 =?iso-8859-1?Q?PfXjX8e/ZP9vrBAMgsEI67gdI55hde86+UCrRDAWRBxNg0Pn8s0gTFqEOY?=
 =?iso-8859-1?Q?f/fkB5ZGefGUEOUf0C4pjtknczAs6k2Mi/McPqFewXUBod4VH71E+5Xhdo?=
 =?iso-8859-1?Q?lZ/wF5Wkt7YTTtTk1qPQFT16Q3Rd332w00Niru6efwcLsYrXHM/wX9Jgfh?=
 =?iso-8859-1?Q?w0YkF04baX3asR1y6z8AfjKpclnAMUG94kotMlHVfCA7g4+QZx/yyxd6L7?=
 =?iso-8859-1?Q?SRs72x0HugNZ6Jdk03OW0UHMxQRo+p5ZWkwSRvhDC9JF3hlJ0x5hh+4e7Q?=
 =?iso-8859-1?Q?77MFLPDQw/+KpTy2H4KHF39EdIl9KV36LmetzGSdoP6lVQJdR9GIejdoR9?=
 =?iso-8859-1?Q?d4BzQNcZ/xE24532OfA7IRj9TmKMAw+KrAdIM93K+5HBG3346EUIoKvnF8?=
 =?iso-8859-1?Q?VvhFyHdWv4M3bg29ClBUbIidY4u1zWEfEV4ksqKIdB+DSwfcr/dMSpMj6l?=
 =?iso-8859-1?Q?iCEHHUI5Q7pU622A68IK5A5/KiN/pk6pQoaPTSVS1eedmcYxCj2WVFrolk?=
 =?iso-8859-1?Q?z89kNBIuQwt1R6rhtKkGOFCwpUjZEdzrZW6eCCGrvJ9eqOcXAa5r8oTtuH?=
 =?iso-8859-1?Q?+Bq4DBDoSSkRULki10OxZGgApPGSm0cgztxnyAZzCNxeOAH7WcGDivrt3D?=
 =?iso-8859-1?Q?hng/AmBVTpgaSeZIJrjBD1hXh43DnVLWQZteRH3CrQ3qQdkyblTo5hdqXH?=
 =?iso-8859-1?Q?lMPc/GsW/4ZzMQOvQXyxbX9g4vpvy0g6FMhIiFqNqFRWsFwjuXLq/BvcG1?=
 =?iso-8859-1?Q?Y7AQSSVZBTIGiinj/0chkuOfuCTLDyQeBV3JvUcoIwczL8DOWkLV8uhgM4?=
 =?iso-8859-1?Q?pwcI3g4ST8QCmtwq11ct4KSqAHOpxXW9jydtt+MdmH3yvVXmpXvn25ZJFK?=
 =?iso-8859-1?Q?6a0JfD3vhSagm15qQSrn4wQ2Q/nuKRc5oWLVOCKzE+wShdqLd8odTtypuY?=
 =?iso-8859-1?Q?f+N4BXRShtHovpzZUDKJ37zhoHg1w+U+RCKjpjP0rOPOGiRQnQdqOJOm9v?=
 =?iso-8859-1?Q?XeDRUyYDDUpVW3gEmNN8nxYK+6jLWTOprVJaUQ01L9DzrfyRuf9hyQxBKN?=
 =?iso-8859-1?Q?pBFDV+KghNeqYFcinmKKD+OGRYSuWCxdnh8FJ1COjI2epe/FaS34f/aUQh?=
 =?iso-8859-1?Q?myvA5OQPC+IdgL5HPfHOBxcMueKEm2cbwh1fh/VVgVMP3iBRTgvMj1tN0v?=
 =?iso-8859-1?Q?doMFScVrNth7+kNgU1GfUD6Jbs1sjF4GCHKlhuxryVdF16h15Nua7cQ1ri?=
 =?iso-8859-1?Q?KSuQ4S7GNdgYIbswE43aDRDq6heLyQcKLeRxafk4JMS44Rry+/sevxY4II?=
 =?iso-8859-1?Q?UgXxZ6NxM4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e929662-a1c8-4c86-0a56-08d90335c0dd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR12MB1248.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2021 13:19:25.5986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxETTi12wZ40UEFKLGwZcXlkrQDMJKoe58J2zT3qH9MWTzwkhDLAguFmZeakRxHDShuX2EIGRidszZvwIV2Bbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0031
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "sroland@vmware.com" <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-graphics-maintainer@vmware.com" <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 19, 2021 at 05:28:53PM +0800, Christian K=F6nig wrote:
> vmwgfx is the only driver actually using this. Move the handling into
> the driver instead.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>

Acked-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c       | 11 -----------
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 10 ++++++++++
>  include/drm/ttm/ttm_bo_api.h       | 19 -------------------
>  3 files changed, 10 insertions(+), 30 deletions(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 80831df0ef61..38183e227116 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -460,8 +460,6 @@ static void ttm_bo_release(struct kref *kref)
>  =

>  	atomic_dec(&ttm_glob.bo_count);
>  	dma_fence_put(bo->moving);
> -	if (!ttm_bo_uses_embedded_gem_object(bo))
> -		dma_resv_fini(&bo->base._resv);
>  	bo->destroy(bo);
>  }
>  =

> @@ -1056,15 +1054,6 @@ int ttm_bo_init_reserved(struct ttm_device *bdev,
>  	} else {
>  		bo->base.resv =3D &bo->base._resv;
>  	}
> -	if (!ttm_bo_uses_embedded_gem_object(bo)) {
> -		/*
> -		 * bo.base is not initialized, so we have to setup the
> -		 * struct elements we want use regardless.
> -		 */
> -		bo->base.size =3D size;
> -		dma_resv_init(&bo->base._resv);
> -		drm_vma_node_reset(&bo->base.vma_node);
> -	}
>  	atomic_inc(&ttm_glob.bo_count);
>  =

>  	/*
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/=
vmwgfx_bo.c
> index 50e529a01677..587314d57991 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -460,6 +460,7 @@ void vmw_bo_bo_free(struct ttm_buffer_object *bo)
>  	WARN_ON(vmw_bo->dirty);
>  	WARN_ON(!RB_EMPTY_ROOT(&vmw_bo->res_tree));
>  	vmw_bo_unmap(vmw_bo);
> +	dma_resv_fini(&bo->base._resv);
>  	kfree(vmw_bo);
>  }
>  =

> @@ -512,6 +513,11 @@ int vmw_bo_create_kernel(struct vmw_private *dev_pri=
v, unsigned long size,
>  	if (unlikely(ret))
>  		goto error_free;
>  =

> +
> +	bo->base.size =3D size;
> +	dma_resv_init(&bo->base._resv);
> +	drm_vma_node_reset(&bo->base.vma_node);
> +
>  	ret =3D ttm_bo_init_reserved(&dev_priv->bdev, bo, size,
>  				   ttm_bo_type_device, placement, 0,
>  				   &ctx, NULL, NULL, NULL);
> @@ -570,6 +576,10 @@ int vmw_bo_init(struct vmw_private *dev_priv,
>  	if (unlikely(ret))
>  		return ret;
>  =

> +	vmw_bo->base.base.size =3D size;
> +	dma_resv_init(&vmw_bo->base.base._resv);
> +	drm_vma_node_reset(&vmw_bo->base.base.vma_node);
> +
>  	ret =3D ttm_bo_init_reserved(bdev, &vmw_bo->base, size,
>  				   ttm_bo_type_device, placement,
>  				   0, &ctx, NULL, NULL, bo_free);
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 3587f660e8f4..e88da481a976 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -562,25 +562,6 @@ ssize_t ttm_bo_io(struct ttm_device *bdev, struct fi=
le *filp,
>  int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ct=
x *ctx,
>  		   gfp_t gfp_flags);
>  =

> -/**
> - * ttm_bo_uses_embedded_gem_object - check if the given bo uses the
> - * embedded drm_gem_object.
> - *
> - * Most ttm drivers are using gem too, so the embedded
> - * ttm_buffer_object.base will be initialized by the driver (before
> - * calling ttm_bo_init).  It is also possible to use ttm without gem
> - * though (vmwgfx does that).
> - *
> - * This helper will figure whenever a given ttm bo is a gem object too
> - * or not.
> - *
> - * @bo: The bo to check.
> - */
> -static inline bool ttm_bo_uses_embedded_gem_object(struct ttm_buffer_obj=
ect *bo)
> -{
> -	return bo->base.dev !=3D NULL;
> -}
> -
>  /**
>   * ttm_bo_pin - Pin the buffer object.
>   * @bo: The buffer object to pin
> -- =

> 2.25.1
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
