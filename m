Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBE9649C1
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 17:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 592F689AB3;
	Wed, 10 Jul 2019 15:35:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9719C89AB3;
 Wed, 10 Jul 2019 15:35:51 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 08:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,475,1557212400"; 
 d="p7s'?scan'208";a="166104563"
Received: from irsmsx154.ger.corp.intel.com ([163.33.192.96])
 by fmsmga008.fm.intel.com with ESMTP; 10 Jul 2019 08:35:49 -0700
Received: from irsmsx105.ger.corp.intel.com ([169.254.7.164]) by
 IRSMSX154.ger.corp.intel.com ([169.254.12.160]) with mapi id 14.03.0439.000;
 Wed, 10 Jul 2019 16:35:49 +0100
From: "Vasilev, Oleg" <oleg.vasilev@intel.com>
To: "daniel@ffwll.ch" <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/vkms: prime import support
Thread-Topic: [PATCH] drm/vkms: prime import support
Thread-Index: AQHVMkYZiz1LxXEgrk+2/reK5dpkrqbD89oAgAABIQA=
Date: Wed, 10 Jul 2019 15:35:48 +0000
Message-ID: <574b6b7e4c734e18debbd5b4a4d278197c850727.camel@intel.com>
References: <20190704085410.12749-1-oleg.vasilev@intel.com>
 <20190710153146.GT15868@phenom.ffwll.local>
In-Reply-To: <20190710153146.GT15868@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.237.66.161]
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1447220656=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1447220656==
Content-Language: en-US
Content-Type: multipart/signed; micalg=sha-1;
	protocol="application/x-pkcs7-signature"; boundary="=-Xjtslzwu1i428YcSUbsJ"

--=-Xjtslzwu1i428YcSUbsJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-07-10 at 17:31 +0200, Daniel Vetter wrote:
> On Thu, Jul 04, 2019 at 11:54:10AM +0300, Oleg Vasilev wrote:
> > Bring dmabuf sharing through implementing prime_import_sg_table
> > callback.
> > This will help to validate userspace conformance in prime
> > configurations
> > without using any actual hardware (e.g. in the cloud).
> >=20
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > Signed-off-by: Oleg Vasilev <oleg.vasilev@intel.com>
>=20
> Btw which igt testcases does this enable? Are the igt patches already
> merged (I think as-is the igt prime tests won't run on vkms).
>=20
> Imo for vkms we really want to make sure there's tests for
> everything,
> otherwise a fake driver for testing/validation is kinda pointless ...
> -Daniel

I've submitted a patch to IGT, but it is not merged yet:
https://patchwork.freedesktop.org/series/63213/

Oleg
>=20
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.c |  6 +++++
> >  drivers/gpu/drm/vkms/vkms_drv.h |  9 +++++++
> >  drivers/gpu/drm/vkms/vkms_gem.c | 46
> > +++++++++++++++++++++++++++++++++
> >  3 files changed, 61 insertions(+)
> >=20
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.c
> > b/drivers/gpu/drm/vkms/vkms_drv.c
> > index cc53ef88a331..b71c16d9ca09 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.c
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> > @@ -10,6 +10,7 @@
> >   */
> > =20
> >  #include <linux/module.h>
> > +#include <linux/dma-buf.h>
> >  #include <drm/drm_gem.h>
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> > @@ -96,6 +97,8 @@ static struct drm_driver vkms_driver =3D {
> >  	.gem_vm_ops		=3D &vkms_gem_vm_ops,
> >  	.gem_free_object_unlocked =3D vkms_gem_free_object,
> >  	.get_vblank_timestamp	=3D vkms_get_vblank_timestamp,
> > +	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
> > +	.gem_prime_import_sg_table =3D vkms_prime_import_sg_table,
> > =20
> >  	.name			=3D DRIVER_NAME,
> >  	.desc			=3D DRIVER_DESC,
> > @@ -147,6 +150,9 @@ static int __init vkms_init(void)
> > =20
> >  	ret =3D drm_dev_init(&vkms_device->drm, &vkms_driver,
> >  			   &vkms_device->platform->dev);
> > +
> > +	dma_coerce_mask_and_coherent(vkms_device->drm.dev,
> > +				     DMA_BIT_MASK(64));
> >  	if (ret)
> >  		goto out_unregister;
> > =20
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h
> > b/drivers/gpu/drm/vkms/vkms_drv.h
> > index 12b4db7ac641..fb15101c8f3e 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -126,6 +126,9 @@ struct drm_gem_object *vkms_gem_create(struct
> > drm_device *dev,
> >  				       u32 *handle,
> >  				       u64 size);
> > =20
> > +struct vkms_gem_object *vkms_gem_create_private(struct drm_device
> > *dev,
> > +						u64 size);
> > +
> >  vm_fault_t vkms_gem_fault(struct vm_fault *vmf);
> > =20
> >  int vkms_dumb_create(struct drm_file *file, struct drm_device
> > *dev,
> > @@ -137,6 +140,12 @@ int vkms_gem_vmap(struct drm_gem_object *obj);
> > =20
> >  void vkms_gem_vunmap(struct drm_gem_object *obj);
> > =20
> > +/* Prime */
> > +struct drm_gem_object *
> > +vkms_prime_import_sg_table(struct drm_device *dev,
> > +			   struct dma_buf_attachment *attach,
> > +			   struct sg_table *sg);
> > +
> >  /* CRC Support */
> >  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> >  					size_t *count);
> > diff --git a/drivers/gpu/drm/vkms/vkms_gem.c
> > b/drivers/gpu/drm/vkms/vkms_gem.c
> > index 69048e73377d..a1b837460f63 100644
> > --- a/drivers/gpu/drm/vkms/vkms_gem.c
> > +++ b/drivers/gpu/drm/vkms/vkms_gem.c
> > @@ -1,5 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0+
> > =20
> > +#include <linux/dma-buf.h>
> >  #include <linux/shmem_fs.h>
> > =20
> >  #include "vkms_drv.h"
> > @@ -117,6 +118,25 @@ struct drm_gem_object *vkms_gem_create(struct
> > drm_device *dev,
> >  	return &obj->gem;
> >  }
> > =20
> > +struct vkms_gem_object *vkms_gem_create_private(struct drm_device
> > *dev,
> > +						u64 size)
> > +{
> > +	struct vkms_gem_object *obj;
> > +
> > +	obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> > +
> > +	if (!obj)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	size =3D roundup(size, PAGE_SIZE);
> > +
> > +	drm_gem_private_object_init(dev, &obj->gem, size);
> > +
> > +	mutex_init(&obj->pages_lock);
> > +
> > +	return obj;
> > +}
> > +
> >  int vkms_dumb_create(struct drm_file *file, struct drm_device
> > *dev,
> >  		     struct drm_mode_create_dumb *args)
> >  {
> > @@ -217,3 +237,29 @@ int vkms_gem_vmap(struct drm_gem_object *obj)
> >  	mutex_unlock(&vkms_obj->pages_lock);
> >  	return ret;
> >  }
> > +
> > +struct drm_gem_object *
> > +vkms_prime_import_sg_table(struct drm_device *dev,
> > +			   struct dma_buf_attachment *attach,
> > +			   struct sg_table *sg)
> > +{
> > +	struct vkms_gem_object *obj;
> > +	int npages;
> > +
> > +	obj =3D __vkms_gem_create(dev, attach->dmabuf->size);
> > +	if (IS_ERR(obj))
> > +		return ERR_CAST(obj);
> > +
> > +	npages =3D PAGE_ALIGN(attach->dmabuf->size) / PAGE_SIZE;
> > +	DRM_DEBUG_PRIME("Importing %d  pages\n", npages);
> > +
> > +	obj->pages =3D kvmalloc_array(npages, sizeof(struct page *),
> > GFP_KERNEL);
> > +	if (!obj->pages) {
> > +		vkms_gem_free_object(&obj->gem);
> > +		return ERR_PTR(-ENOMEM);
> > +	}
> > +
> > +	drm_prime_sg_to_page_addr_arrays(sg, obj->pages, NULL,
> > +					 npages);
> > +	return &obj->gem;
> > +}
> > --=20
> > 2.22.0
> >=20

--=-Xjtslzwu1i428YcSUbsJ
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

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
DdWSiLBgHgGaO0ThuDGV4bz316/+F4Vy7z9hcMbMJs41eGz9tueMREgDNywNIAdzWQIDAQABo4IC
LjCCAiowHQYDVR0OBBYEFP8BYPvxsk8Ryh4Tt/ZBT5qIg2TiMB8GA1UdIwQYMBaAFB5pKrTcKP5H
GE4hCz+8rBEv8Jj1MGUGA1UdHwReMFwwWqBYoFaGVGh0dHA6Ly93d3cuaW50ZWwuY29tL3JlcG9z
aXRvcnkvQ1JML0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3VpbmclMjBDQSUyMDRBLmNy
bDCBngYIKwYBBQUHAQEEgZEwgY4waQYIKwYBBQUHMAKGXWh0dHA6Ly93d3cuaW50ZWwuY29tL3Jl
cG9zaXRvcnkvY2VydGlmaWNhdGVzL0ludGVsJTIwRXh0ZXJuYWwlMjBCYXNpYyUyMElzc3Vpbmcl
MjBDQSUyMDRBLmNydDAhBggrBgEFBQcwAYYVaHR0cDovL29jc3AuaW50ZWwuY29tMAsGA1UdDwQE
AwIHgDA8BgkrBgEEAYI3FQcELzAtBiUrBgEEAYI3FQiGw4x1hJnlUYP9gSiFjp9TgpHACWeB3r05
lfBDAgFkAgELMB8GA1UdJQQYMBYGCCsGAQUFBwMEBgorBgEEAYI3CgMMMCkGCSsGAQQBgjcVCgQc
MBowCgYIKwYBBQUHAwQwDAYKKwYBBAGCNwoDDDBJBgNVHREEQjBAoCYGCisGAQQBgjcUAgOgGAwW
b2xlZy52YXNpbGV2QGludGVsLmNvbYEWb2xlZy52YXNpbGV2QGludGVsLmNvbTANBgkqhkiG9w0B
AQUFAAOCAQEAffmCWGLFQzB82/D5fYYzYJ3/8uSfKWA4UPCKcqETG1Zb0vl2FPoCjNID1Bw2HNS7
TxYcXvrVDul3vdCQfQhKonJi4ioJJXPPAQBDKKPkVoL9f/maehuXJYjFNsGmHNYADJL+4bDRJJcq
wIQlFVGXvPJFuTSj9HjJAiwH4zehhiEuTTbDhbaaLVrDsEVKCFMj0nvxN4AsYfoBXbscUVLrZs8n
ZIht2nPvz2NlWwxWgl/7+T42CcriuoeLOPWjmaMncOnXaIR/XNpzvCd6N8Xurg9NhzZaCUwLPAX1
fyAyMXRsdpgqKqVNd+jLBGt87zB3FQQOh73i8+vBMqm1BfEoojGCAhcwggITAgEBMIGQMHkxCzAJ
BgNVBAYTAlVTMQswCQYDVQQIEwJDQTEUMBIGA1UEBxMLU2FudGEgQ2xhcmExGjAYBgNVBAoTEUlu
dGVsIENvcnBvcmF0aW9uMSswKQYDVQQDEyJJbnRlbCBFeHRlcm5hbCBCYXNpYyBJc3N1aW5nIENB
IDRBAhMzAADRf+xxDzfl4feqAAAAANF/MAkGBSsOAwIaBQCgXTAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0xOTA3MTAxNTM1NDhaMCMGCSqGSIb3DQEJBDEWBBSmqH/t
3OHtCCDlRWl0N4JaWqpFbTANBgkqhkiG9w0BAQEFAASCAQAnqgQBzyUvalLIFYKDStlGoxOtPQng
bMivXxyQ43n4jPg7b2BATczRnn9CRp/4Mp3VHCl9L5ML0m5hK79gItk8yBqy/o/NtO/KcySOSQoV
Rg9/+Us5vdOn0SVpLGhZYnneZjqAwbg17Hd9mTa7/eDt/VRyN0UHYIfQ/SoW7jqm7IYOaAK3B4n7
1VRWKwRHDb6cmdfvemn2vax/OlZ1sHO+pzR6+vg5ptg4cTzO3jGYgD/HVHF73c4Pyd2ysBYXOml1
bfVbuz54C5ux/osmxSgty5jwnLR5vLv4F6t3ulnCDw2MRVAFY1/931fcKhUCVcXvoqqXUoM7u+S8
ct28VzZNAAAAAAAA


--=-Xjtslzwu1i428YcSUbsJ--

--===============1447220656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1447220656==--
