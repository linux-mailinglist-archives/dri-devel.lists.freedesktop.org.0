Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 768F61CB3CB
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 17:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FDDB6EB28;
	Fri,  8 May 2020 15:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38DEA6EB27;
 Fri,  8 May 2020 15:45:09 +0000 (UTC)
IronPort-SDR: 2v25JNOkkeEsGsYONltbDARVOFOTJvnz3xZ+lDuh5W2pcS5XO2wumu9RqbXonTkdPOphbRp2bf
 ryFdco8QXLZA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2020 08:45:08 -0700
IronPort-SDR: zuLAiuchje8B0YyQv0S/mbUVBsaBhKQ3aT39CD4wudUZg6RsHy7KKcVB23qKFBK/RFueqW6QIA
 q31289LMt4LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,368,1583222400"; d="scan'208";a="285505776"
Received: from fmsmsx107.amr.corp.intel.com ([10.18.124.205])
 by fmsmga004.fm.intel.com with ESMTP; 08 May 2020 08:45:08 -0700
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
 fmsmsx107.amr.corp.intel.com (10.18.124.205) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Fri, 8 May 2020 08:45:08 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.60]) by
 fmsmsx121.amr.corp.intel.com ([169.254.6.5]) with mapi id 14.03.0439.000;
 Fri, 8 May 2020 08:45:08 -0700
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Bernard Zhao <bernard@vivo.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>, "David
 (ChunMing) Zhou" <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Tom St Denis <tom.stdenis@amd.com>, "Sam
 Ravnborg" <sam@ravnborg.org>, Ori Messinger <Ori.Messinger@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] drm/amd/amdgpu: cleanup coding style a bit
Thread-Topic: [PATCH v2] drm/amd/amdgpu: cleanup coding style a bit
Thread-Index: AQHWJE+3bau47Y1nb0Gh/jTCob7xpaieVcIg
Date: Fri, 8 May 2020 15:45:07 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E8663010E20C5BD@FMSMSX108.amr.corp.intel.com>
References: <20200507091311.10898-1-bernard@vivo.com>
In-Reply-To: <20200507091311.10898-1-bernard@vivo.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
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
Cc: "opensource.kernel@vivo.com" <opensource.kernel@vivo.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

>-----Original Message-----
>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>Bernard Zhao
>Sent: Thursday, May 7, 2020 5:13 AM
>To: Alex Deucher <alexander.deucher@amd.com>; Christian K=F6nig
><christian.koenig@amd.com>; David (ChunMing) Zhou
><David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
><daniel@ffwll.ch>; Tom St Denis <tom.stdenis@amd.com>; Sam Ravnborg
><sam@ravnborg.org>; Ori Messinger <Ori.Messinger@amd.com>; Bernard
>Zhao <bernard@vivo.com>; amd-gfx@lists.freedesktop.org; dri-
>devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
>Cc: opensource.kernel@vivo.com
>Subject: [PATCH v2] drm/amd/amdgpu: cleanup coding style a bit
>
>There is DEVICE_ATTR mechanism in separate attribute define.
>So this change is to use attr array, also use
>sysfs_create_files in init function & sysfs_remove_files in
>fini function.
>This maybe make the code a bit readable.
>
>Signed-off-by: Bernard Zhao <bernard@vivo.com>
>
>Changes since V1:
>*Use DEVICE_ATTR mechanism
>
>Link for V1:
>*https://lore.kernel.org/patchwork/patch/1228076/
>---
> drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 43 ++++++-------------
>-
> 1 file changed, 13 insertions(+), 30 deletions(-)
>
>diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>index 82a3299e53c0..57bbc70662ff 100644
>--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>@@ -148,6 +148,15 @@ static DEVICE_ATTR(mem_info_vis_vram_used,
>S_IRUGO,
> static DEVICE_ATTR(mem_info_vram_vendor, S_IRUGO,
> 		   amdgpu_mem_info_vram_vendor, NULL);
>
>+static struct attribute *amdgpu_vram_mgr_attributes[] =3D {
>+	&dev_attr_mem_info_vram_total.attr,
>+	&dev_attr_mem_info_vis_vram_total.attr,
>+	&dev_attr_mem_info_vram_used.attr,
>+	&dev_attr_mem_info_vis_vram_used.attr,
>+	&dev_attr_mem_info_vram_vendor.attr,
>+	NULL
>+};
>+
> /**
>  * amdgpu_vram_mgr_init - init VRAM manager and DRM MM
>  *
>@@ -172,31 +181,9 @@ static int amdgpu_vram_mgr_init(struct
>ttm_mem_type_manager *man,
> 	man->priv =3D mgr;
>
> 	/* Add the two VRAM-related sysfs files */
>-	ret =3D device_create_file(adev->dev,
>&dev_attr_mem_info_vram_total);
>-	if (ret) {
>-		DRM_ERROR("Failed to create device file
>mem_info_vram_total\n");
>-		return ret;
>-	}
>-	ret =3D device_create_file(adev->dev,
>&dev_attr_mem_info_vis_vram_total);
>-	if (ret) {
>-		DRM_ERROR("Failed to create device file
>mem_info_vis_vram_total\n");
>-		return ret;
>-	}
>-	ret =3D device_create_file(adev->dev,
>&dev_attr_mem_info_vram_used);
>-	if (ret) {
>-		DRM_ERROR("Failed to create device file
>mem_info_vram_used\n");
>-		return ret;
>-	}
>-	ret =3D device_create_file(adev->dev,
>&dev_attr_mem_info_vis_vram_used);
>-	if (ret) {
>-		DRM_ERROR("Failed to create device file
>mem_info_vis_vram_used\n");
>-		return ret;
>-	}
>-	ret =3D device_create_file(adev->dev,
>&dev_attr_mem_info_vram_vendor);
>-	if (ret) {
>-		DRM_ERROR("Failed to create device file
>mem_info_vram_vendor\n");
>-		return ret;
>-	}
>+	ret =3D sysfs_create_files(&adev->dev->kobj,
>amdgpu_vram_mgr_attributes);
>+	if (ret)
>+		DRM_ERROR("Failed to register sysfs\n");

This looks good to me.

I think that there is a new error macro (drm_err?) that you might
want to use instead of DRM_ERROR().

Otherwise:

Acked-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

m

>
> 	return 0;
> }
>@@ -219,11 +206,7 @@ static int amdgpu_vram_mgr_fini(struct
>ttm_mem_type_manager *man)
> 	spin_unlock(&mgr->lock);
> 	kfree(mgr);
> 	man->priv =3D NULL;
>-	device_remove_file(adev->dev, &dev_attr_mem_info_vram_total);
>-	device_remove_file(adev->dev,
>&dev_attr_mem_info_vis_vram_total);
>-	device_remove_file(adev->dev, &dev_attr_mem_info_vram_used);
>-	device_remove_file(adev->dev,
>&dev_attr_mem_info_vis_vram_used);
>-	device_remove_file(adev->dev,
>&dev_attr_mem_info_vram_vendor);
>+	sysfs_remove_files(&adev->dev->kobj,
>amdgpu_vram_mgr_attributes);
> 	return 0;
> }
>
>--
>2.26.2
>
>_______________________________________________
>dri-devel mailing list
>dri-devel@lists.freedesktop.org
>https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
