Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A15361E38
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 12:48:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC656EB68;
	Fri, 16 Apr 2021 10:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4185E6EB68
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 10:48:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C7FB1AE20;
 Fri, 16 Apr 2021 10:48:40 +0000 (UTC)
Subject: Re: [PATCH 1/4] drm/vmwgfx: Make console emulation depend on
 DRM_FBDEV_EMULATION
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch, marex@denx.de,
 stefan@agner.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com
References: <20210415110040.23525-1-tzimmermann@suse.de>
 <20210415110040.23525-2-tzimmermann@suse.de>
 <af143092-edd3-91eb-025d-836de1e4a104@vmware.com>
 <a7c61e61-cc6f-93db-7d49-2dc666143ab8@suse.de>
Message-ID: <ea2a739d-f9d4-14c2-4c0c-111b272b5671@suse.de>
Date: Fri, 16 Apr 2021 12:48:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <a7c61e61-cc6f-93db-7d49-2dc666143ab8@suse.de>
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0329641347=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0329641347==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ukcbay9BIbZkaTB5R6IcQW5IQVJLGS91d"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ukcbay9BIbZkaTB5R6IcQW5IQVJLGS91d
Content-Type: multipart/mixed; boundary="Ag6R0KJ99n4rzWObwOK0Cqo9HrCiM9Qwj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@linux.ie, daniel@ffwll.ch, marex@denx.de,
 stefan@agner.ch, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Message-ID: <ea2a739d-f9d4-14c2-4c0c-111b272b5671@suse.de>
Subject: Re: [PATCH 1/4] drm/vmwgfx: Make console emulation depend on
 DRM_FBDEV_EMULATION
References: <20210415110040.23525-1-tzimmermann@suse.de>
 <20210415110040.23525-2-tzimmermann@suse.de>
 <af143092-edd3-91eb-025d-836de1e4a104@vmware.com>
 <a7c61e61-cc6f-93db-7d49-2dc666143ab8@suse.de>
In-Reply-To: <a7c61e61-cc6f-93db-7d49-2dc666143ab8@suse.de>

--Ag6R0KJ99n4rzWObwOK0Cqo9HrCiM9Qwj
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 15.04.21 um 20:50 schrieb Thomas Zimmermann:
> Hi
>=20
> Am 15.04.21 um 20:21 schrieb Zack Rusin:
>> On 4/15/21 7:00 AM, Thomas Zimmermann wrote:
>>> Respect DRM's kconfig setting for fbdev console emulation. If enabled=
,
>>> it will select all required config options. So remove them from vmwgf=
x's
>>> Kconfig file.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>> =C2=A0 drivers/gpu/drm/vmwgfx/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 7 +------
>>> =C2=A0 drivers/gpu/drm/vmwgfx/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=20
> 4 +++-
>>> =C2=A0 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 19 +++++++++++++++++++
>>> =C2=A0 3 files changed, 23 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vmwgfx/Kconfig=20
>>> b/drivers/gpu/drm/vmwgfx/Kconfig
>>> index 15acdf2a7c0f..b3a34196935b 100644
>>> --- a/drivers/gpu/drm/vmwgfx/Kconfig
>>> +++ b/drivers/gpu/drm/vmwgfx/Kconfig
>>> @@ -2,12 +2,7 @@
>>> =C2=A0 config DRM_VMWGFX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tristate "DRM driver for VMware Virtua=
l=20
> GPU"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on DRM && PCI && X86 && MMU
>>> -=C2=A0=C2=A0=C2=A0 select FB_DEFERRED_IO
>>> -=C2=A0=C2=A0=C2=A0 select FB_CFB_FILLRECT
>>> -=C2=A0=C2=A0=C2=A0 select FB_CFB_COPYAREA
>>> -=C2=A0=C2=A0=C2=A0 select FB_CFB_IMAGEBLIT
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select DRM_TTM
>>> -=C2=A0=C2=A0=C2=A0 select FB
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 select MAPPING_DIRTY_HELPERS
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Only needed for the transitional use=20
of drm_crtc_init - can=20
>>> be removed
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # again once vmwgfx sets up the primar=
y=20
> plane itself.
>>> @@ -20,7 +15,7 @@ config DRM_VMWGFX
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The compiled module will b=
e=20
> called "vmwgfx.ko".
>>> =C2=A0 config DRM_VMWGFX_FBCON
>>> -=C2=A0=C2=A0=C2=A0 depends on DRM_VMWGFX && FB
>>> +=C2=A0=C2=A0=C2=A0 depends on DRM_VMWGFX && DRM_FBDEV_EMULATION
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "Enable framebuffer console under=20
vmwgfx by default"
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Choose this option i=
f=20
> you are shipping a new vmwgfx
>>> diff --git a/drivers/gpu/drm/vmwgfx/Makefile=20
>>> b/drivers/gpu/drm/vmwgfx/Makefile
>>> index 8c02fa5852e7..9f5743013cbb 100644
>>> --- a/drivers/gpu/drm/vmwgfx/Makefile
>>> +++ b/drivers/gpu/drm/vmwgfx/Makefile
>>> @@ -1,6 +1,6 @@
>>> =C2=A0 # SPDX-License-Identifier: GPL-2.0
>>> =C2=A0 vmwgfx-y :=3D vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgf=
x_drv.o \
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmwgfx_fb.o vmwgfx_ioctl.=
o=20
> vmwgfx_resource.o
>>> vmwgfx_ttm_buffer.o \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmwgfx_ioctl.o vmwgfx_res=
ource.o vmwgfx_ttm_buffer.o \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmwgfx_cmd.o v=
mwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmwgfx_overlay=
=2Eo vmwgfx_gmrid_manager.o vmwgfx_fence.o \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmwgfx_bo.o vm=
wgfx_scrn.o vmwgfx_context.o \
>>> @@ -11,5 +11,7 @@ vmwgfx-y :=3D vmwgfx_execbuf.o vmwgfx_gmr.o=20
>>> vmwgfx_kms.o vmwgfx_drv.o \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 vmwgfx_validat=
ion.o vmwgfx_page_dirty.o=20
>>> vmwgfx_streamoutput.o \
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_object.o t=
tm_lock.o ttm_memory.o
>>> +vmwgfx-$(CONFIG_DRM_FBDEV_EMULATION) +=3D vmwgfx_fb.o
>>> =C2=A0 vmwgfx-$(CONFIG_TRANSPARENT_HUGEPAGE) +=3D vmwgfx_thp.o
>>> +
>>> =C2=A0 obj-$(CONFIG_DRM_VMWGFX) :=3D vmwgfx.o
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h=20
>>> b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>>> index 7e6518709e14..e7836da190c4 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
>>> @@ -1116,10 +1116,29 @@ extern void vmw_generic_waiter_remove(struct =

>>> vmw_private *dev_priv,
>>> =C2=A0=C2=A0 * Kernel framebuffer - vmwgfx_fb.c
>>> =C2=A0=C2=A0 */
>>> +#ifdef CONFIG_DRM_FBDEV_EMULATION
>>> =C2=A0 int vmw_fb_init(struct vmw_private *vmw_priv);
>>> =C2=A0 int vmw_fb_close(struct vmw_private *dev_priv);
>>> =C2=A0 int vmw_fb_off(struct vmw_private *vmw_priv);
>>> =C2=A0 int vmw_fb_on(struct vmw_private *vmw_priv);
>>> +#else
>>> +static inline int vmw_fb_init(struct vmw_private *vmw_priv)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +static inline int vmw_fb_close(struct vmw_private *dev_priv)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +static inline int vmw_fb_off(struct vmw_private *vmw_priv)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +static inline int vmw_fb_on(struct vmw_private *vmw_priv)
>>> +{
>>> +=C2=A0=C2=A0=C2=A0 return 0;
>>> +}
>>> +#endif
>>> =C2=A0 /**
>>> =C2=A0=C2=A0 * Kernel modesetting - vmwgfx_kms.c
>>>
>>
>> This changes the behavior a bit, I guess DRM_VMWGFX (or at least=20
>> DRM_VMWGFX_FBCON) would need to select DRM_FBDEV_EMULATION to preserve=20

>> the old behavior, but that's largely due to the fact that given how=20
>> those options were setup we never run without FB set. In general it=20
>> should be ok and looks more reasonable than the current setup. I'll tr=
y=20
>=20
>> it out on Monday just in case, but for now:
>>
>> Reviewed-by: Zack Rusin <zackr@vmware.com>
>>
>=20
> All other drivers use DRM_FBDEV_EMULATION, so vmwgfx would follow commo=
n=20
> conventions.
>=20
> AFAICT DRM_VMWGFX_FBCON is just the default on/off setting. How about=20
> making DRM_VMWGFX_FBCON depend on DRM_FBDEV_EMULATION? Users would be=20
> able to enable fbdev emulation in general and, if needed, still pick a =

> separate default on/off for vmwgfx.

Oh, lol. That's already in the patchset.

>=20
> Best regards
> Thomas
>=20
>> z
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Ag6R0KJ99n4rzWObwOK0Cqo9HrCiM9Qwj--

--ukcbay9BIbZkaTB5R6IcQW5IQVJLGS91d
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB5a4cFAwAAAAAACgkQlh/E3EQov+Dg
fRAAsB5/4xU0bRPUm/MpTklXMDnKzE6AiGZRVl28A3hGaFoAujyzlWNeJ08f0cQlq5Fz/UQl8Cre
Kqsd7tSvjC/rsC8SLMfNa1hjN8cydZaC6HVDRlVkpWS6UTRF5R5gNlGtGvIHk/2G0UUxl+S+xFom
vaC5Oe2f/v2lig2ilQmsXb8dRLExy76SMWza9+WV7Bn2M9b1oi9n8vDlOm6hfVJfd6JfvX7cjiYq
GTZE/8cCr45fmlWl+YmMN0dfM2Vy3jqLCgj77lFQwOZjh3K2EjRdZeejvc57dROV3mbGYxPZ99vV
dm6GAr4+fnogOfSngPVuIUG0ConsE2MCb1O27X+9dcpgQWHPQQ8qfV1PpT04kf2ShF8N63f1c/sf
aLwA6GoRk/zWVfQWNa2OQG0ONDBWnrY1ni6xt7ak2JWjHKKa7eB/VTuZk7IRJXay5PYN8YP46cog
zKEywsGQEM1m88RlifkiXtwqy1tBWkdOhXSbrSOOeqUSrLgTjPNnWCH8C1QG2+JveeOP7beWSloz
rfTGklBBqwKt091BzT0Dj1oK8aOEIjuzNkd7ICwJm8J+5JBTRlODp9VL5n6MijHp495Oxx9cOGUv
v10C7M3nwBsJeEIkjuGsweBbsVyQJMLdpT7r5VdYhctQP4KEdOGFRmeqdF4OPJNvdkLV7OGzJF7d
J9w=
=3Bys
-----END PGP SIGNATURE-----

--ukcbay9BIbZkaTB5R6IcQW5IQVJLGS91d--

--===============0329641347==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0329641347==--
