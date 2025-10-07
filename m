Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296C8BC0ED0
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 11:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C7C810E5C8;
	Tue,  7 Oct 2025 09:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="POBoqFT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic308-54.consmr.mail.gq1.yahoo.com
 (sonic308-54.consmr.mail.gq1.yahoo.com [98.137.68.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B68C10E5BF
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 09:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1759830743; bh=rmLbHG+dji4lQf0mPiF/jLd006I4IRGCWQeXYf404SY=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=POBoqFT38nZYaAsa1cl5QFzresRwrI9OMTgQwNiSP9ru+PJ3FDXMPKGfEeuBidXpyQnOnI6h8a+9ls84BJ6M9PDspWFBsuxPih0ZclyuSzabqNwmigMJWpyqjb9k6ht16bRtDjtSa8i8/2UH23vH9KCDdhc5D4VbBdDnWNvK5MJb4/6WMpDGsnrmMr+GELwqJyPiQCzIBWgE+k6V4zySL5aL5EbDz9T/Hd/QIvnRcymnhIMgjypvz7x/QAdAIA+Kw/pzfi25Syv737Pj5KCMWqPJWZjsmwuCyNHQ9VvLrmSkEbEBZhMeVrFA9Xc9iBcAJ7DcUrvKFXws8eTSioUkZA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1759830743; bh=9qZnKPIFgSiWsAn3aqQiD2SeCTYMRo+3xb+dRckQaqO=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=dmVccrDo5YrNWP1m0bA9pIO4lBxa2+NdfJ9Wq4G6WB5ClzhZ3M7OGj9TyA0kxyWdLpkmalIcGglb7IJEt8ydcS2vhpTFsk+2xJr4Hq9KQ4keZWeopc+B8Vz/txY3xtiJi5OvD3I5u7djsEqgTO3s4jer3p8SNN0DnJprIOy7eudLatWnqov9Wm0t4iyFBGTsIoti/xMRDpllA1bc80ua/RrAtPF4L0MEEuH8ZgBVqL9s16tnq6bk64jCnljGUhFJ64JgAlLfJtYNJi9rh7aGDFCNcBNfJ9T5cd1ZDkYGSnOH/8pm3TN7jqK541/AVk6SeVcq0of21G4qHO5bQww4kw==
X-YMail-OSG: dMM33pEVM1kj_XUtIle5aWRKkm3ORbnfL4qq1GuV_3k1ggv9EsCy902pJxAn3Ne
 oAKjNkVwf0qj44Qsb2BOj3t861TZXxsC42bFcl24KEfRrxGhgXZT5Cdm_QQbZiM9I4DFZV5dxwAK
 EpsAB0cgaAxaNr1ubDHG6REnXRVDBBobDzpifWPv4uksjsCpzPvnGL4UIbzcmkHcnkiVt8vTLgsY
 vUBI2RIrzGor9MUNQYNBbzyaWpOAkIrUmXxW_enBnGXmKzZfoIBMkxY__tOwtZRPne_1Z9IwZdAC
 h3uGKRCAJAOTJh8Zh24mNOLLizZaz5fbOzf8KisSbbKqc95eDWuiXTU3XTUBKnr.a8FkKGf_Hhxf
 9sLfOTCbf7V6xITXyUHZvcfrt.DsxdOHzFLPg4za6FU5SfoG8Z_1WQoLZzi8HsxVa49cHaUWF7Oc
 6sZZgJG6ODs74zGuGpUc8TpWsUHatdIIBjJjCeAMmljReErfsLxbNA_4BiDjN3QtQfMRahDEQe9N
 6rZzIfJqRTaMvq5s3tzbYjr11.iZBiGIkIJ7ICRw1qc6HBcidBNTWvh4Eyk4oAbYw8uP8flwYseF
 ltfbr0SEhx2MkNo2o3ni0coCTN3WTyYcfS59CDP1Emzlnfry1B0xzVgy97F006u4FYaASrSU..mn
 09yo5nFdvtEF5J5VCvYWfioZU_FziSzWjMbsreAeSYLDv_B64Ggn6k1e1ACktrfEL8xZ_bzCndvT
 OOoSgqagxC7O6EQMS5rXB7diAI24L8V007UxNUnAh68F3Gf5DFFAiB_jHiCnnbsdTJEggx4sx.2Y
 Jt5dY739s28cx1AfXvexDuVkCeFdU0k0wjY7DSLEpMRVdrkm33afAuQ4tHSi9ZYmlGMEwjc3qcve
 b2P7HvcyzJaade0uePIB4cPaUiBjIPRl1_6mlRFeG_pcRisIb.mhWm2biKuKxYgRrx_Qnw3_jCIN
 LEKJ5DfNVXjenmjMrXZQ1fRufpLxNiY.7HkaSQ6sI09jOckSXB6Fp0kmNEnZV.PnFUTz0Q8sXI.S
 K1_r8TN.OVv4N11_HnHSgacR9Gd91Z2U_SVg.6pALuWTVTnxhdstgL6Fq6gGGLMintpg4Rg6X_rP
 onZJ4y.uuH07LmUswOZN6X13GEMxDlXET7OMFExUBSwwX7oPzDNf9dylArMCd_ggPtDk7V_gHWpw
 Ec1.REeTD4rOwW_e.t6pqjh2IrHnt3fCEy.iTOKVEemUdacPKxSOfJoPHMV6QE_GX5lETEaElLl_
 1XKtQ.JjBXJ4PnBwlQevRZzF3E4vbeHlogis2nDFJDd0GZEfPWuu9aQWD_rNsim1tBJVmDWjo36E
 .8DKQXKk5V.ET9Wj3ZjZ5.7XrI_WdxEYU8fGeHl7KioaKsVNmwieDnX1cKi8aHoqUP5yjY2trRuT
 skUEtc1DEr50oOx84H2fObR4kgw4sfotVekCHQuRt8Lq7uHLFh50oabzGoa_KDp7m7Y85_Ww01eQ
 StkdWycKRoyCSpH1TPXtbVUZrMfBtZ4FvjW3pDPcoEVgrr.BeMkPJhSfb_zwh4KI2fYE97lzYwzm
 08RSQlPBGGO7WkkG2Cid_IE5GeBmSpR0002MnbYZglI.WjQUaGbNxD6PZR0GKDLB.3OeGQNdLhmO
 WcqjTs0FMfbrWtSK8eAsRxGjNB4jFOJBVofBj1IP3bgoD81mleKJQFU8SD8faVR7r2ybpoYZAp9G
 rh9.Fhq8ThtJOnkjDTUgs8nUuyXkW8p5ATHr4m4AUApERTr13G0t7MX.qvSkYHXbMOedC38C.KtY
 i8WWqelJIgTIfRfa1nx5P6OAqvE1Dv43xTQAH7TZ0sMZENnHBC.jfP40D4GL5peV2Nca721nPgL7
 vaXX7qt0RZTCs2MbgJQZ1eSwz3pV730vLpXq19D8Rd0AU4vzqd5QH77H_fAU23ClSMQektxl63.K
 L3STAkQTTY848aMBLWrYf9xesckhwefsWlsoG9q_IHWpFABcNOHU8l.y4OMchyVAiOulIVwa4pYa
 eezfG1ts47m9ifC9MSIodjp9t1W42qNfEgkRHlaoFGCY8LCLrmMvUmDwiswgxnt8zH9f6ISe1qOy
 F9uAgmwI8hrxxm1nekaTxahJgOKyVqVYd4NEy2mH9xeF2B94Fp0.fTAD0b0xD1VRFnRfYEgNmofQ
 xljYvmsdVUzSVbdwcT.DIEd69Rpyi3J.kwk3IJ_Y9nRmmXiBAouxp80fmMkFDKkNzi6Nyrae.39G
 Jh_tvPC3SnaKdyZPbALGlyr75af_5WIrsez2clEnMvfwDVnOT_wEkt3D01mKi
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 0ff5df7c-90dd-487b-baa9-3055bad4a296
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Tue, 7 Oct 2025 09:52:23 +0000
Received: by hermes--production-ir2-ccdb4f9c8-748zl (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 644e3e6e89d1f4de38a7c1902a4aae25; 
 Tue, 07 Oct 2025 09:52:17 +0000 (UTC)
Message-ID: <c1c282fd64521f1cc675a53084683af745070697.camel@aol.com>
Subject: Re: [PATCH] drm/gud: move plane init to gud_pipe.c
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 07 Oct 2025 10:52:15 +0100
In-Reply-To: <e0d81b43-22cf-4004-936f-2a1dae9d8741@suse.de>
References: <20251004175900.15235-2-rubenru09.ref@aol.com>
 <20251004175900.15235-2-rubenru09@aol.com>
 <e0d81b43-22cf-4004-936f-2a1dae9d8741@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24562
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
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

On Tue, 2025-10-07 at 11:17 +0200, Thomas Zimmermann wrote:
> Hi Ruben,
>=20
> please see my comments below.
>=20
> Am 04.10.25 um 19:49 schrieb Ruben Wauters:
> > gud_probe() currently is a quite large function that does a lot of
> > different things, including USB detection, plane init, and several othe=
r
> > things.
> >=20
> > This patch moves the plane and crtc init into gud_plane_init() in
> > gud_pipe.c, which is a more appropriate file for this. Associated
> > variables and structs have also been moved to gud_pipe.c
> >=20
> > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> > ---
> > It was somewhat difficult to determine what exactly should be moved
> > over, gud_probe() as a function quite a mess, so I need to figure out
> > exactly how to split this one up.
>=20
> Agreed. The probe function looks really chaotic.
>=20
> I think that just moving CRTC and plane is a not enough. In ast and udl,=
=20
> we have functions that init the whole display pipeline from=20
> drmm_mode_config_init() to _reset(). See [1] and [2] for examples. That=
=20
> would likely be a good model for gud as well, but gud's probe function=
=20
> mixes up pipeline init with other code.
>=20
> [1]=20
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/ast/ast_m=
ode.c#L1005
> [2]=20
> https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/udl/udl_m=
odeset.c#L482
>=20
>=20
> Looking over gud_probe, the following blocks are related to pipeline init=
:
>=20
> - lines 466-469 [3]
> - lines 486-489
> - lines 558-565
> - lines 590-599
> - lines 610-623
> - line 641
>=20
> [3]=20
> https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/drive=
rs/gpu/drm/gud/gud_drv.c#L466
>=20
> I'd try to move these lines into a new helper that initializes the full=
=20
> modesetting pipeline.
>=20
> The other code that happens in between is either preparation or clean up=
=20
> and should be done before or after creating the pipeline.

These changes will probably required another patch/possibly even a
patch series, so will be more extensive, as such they make take me
longer to do as I consider the best way to go about it.

Ruben
>=20
>=20
> >=20
> > As an aside, I noticed that the driver doesn't have a version macro in
> > gud_drv.c, and therefore is shown as 1.0.0. I was thinking of
> > introducing a version, but I wanted to know how others generally deal
> > with driver versions. I'm not 100% sure if it's *necessary* for GUD but
> > it might be a good idea.
>=20
> I wouldn't bother at all about module versions. AFAIK no one cares about=
=20
> it anyway.
>=20
> Best regards
> Thomas
>=20
> > ---
> >   drivers/gpu/drm/gud/gud_drv.c      | 48 +-----------------------
> >   drivers/gpu/drm/gud/gud_internal.h |  1 +
> >   drivers/gpu/drm/gud/gud_pipe.c     | 60 +++++++++++++++++++++++++++++=
+
> >   3 files changed, 62 insertions(+), 47 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_dr=
v.c
> > index b7345c8d823d..967c16479b5c 100644
> > --- a/drivers/gpu/drm/gud/gud_drv.c
> > +++ b/drivers/gpu/drm/gud/gud_drv.c
> > @@ -16,7 +16,6 @@
> >   #include <drm/clients/drm_client_setup.h>
> >   #include <drm/drm_atomic_helper.h>
> >   #include <drm/drm_blend.h>
> > -#include <drm/drm_crtc_helper.h>
> >   #include <drm/drm_damage_helper.h>
> >   #include <drm/drm_debugfs.h>
> >   #include <drm/drm_drv.h>
> > @@ -338,43 +337,12 @@ static int gud_stats_debugfs(struct seq_file *m, =
void *data)
> >   	return 0;
> >   }
> >  =20
> > -static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs =3D {
> > -	.atomic_check =3D drm_crtc_helper_atomic_check
> > -};
> > -
> > -static const struct drm_crtc_funcs gud_crtc_funcs =3D {
> > -	.reset =3D drm_atomic_helper_crtc_reset,
> > -	.destroy =3D drm_crtc_cleanup,
> > -	.set_config =3D drm_atomic_helper_set_config,
> > -	.page_flip =3D drm_atomic_helper_page_flip,
> > -	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> > -	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
> > -};
> > -
> > -static const struct drm_plane_helper_funcs gud_plane_helper_funcs =3D =
{
> > -	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> > -	.atomic_check =3D gud_plane_atomic_check,
> > -	.atomic_update =3D gud_plane_atomic_update,
> > -};
> > -
> > -static const struct drm_plane_funcs gud_plane_funcs =3D {
> > -	.update_plane =3D drm_atomic_helper_update_plane,
> > -	.disable_plane =3D drm_atomic_helper_disable_plane,
> > -	.destroy =3D drm_plane_cleanup,
> > -	DRM_GEM_SHADOW_PLANE_FUNCS,
> > -};
> > -
> >   static const struct drm_mode_config_funcs gud_mode_config_funcs =3D {
> >   	.fb_create =3D drm_gem_fb_create_with_dirty,
> >   	.atomic_check =3D drm_atomic_helper_check,
> >   	.atomic_commit =3D drm_atomic_helper_commit,
> >   };
> >  =20
> > -static const u64 gud_plane_modifiers[] =3D {
> > -	DRM_FORMAT_MOD_LINEAR,
> > -	DRM_FORMAT_MOD_INVALID
> > -};
> > -
> >   DEFINE_DRM_GEM_FOPS(gud_fops);
> >  =20
> >   static const struct drm_driver gud_drm_driver =3D {
> > @@ -587,17 +555,10 @@ static int gud_probe(struct usb_interface *intf, =
const struct usb_device_id *id)
> >   			return -ENOMEM;
> >   	}
> >  =20
> > -	ret =3D drm_universal_plane_init(drm, &gdrm->plane, 0,
> > -				       &gud_plane_funcs,
> > -				       formats, num_formats,
> > -				       gud_plane_modifiers,
> > -				       DRM_PLANE_TYPE_PRIMARY, NULL);
> > +	ret =3D gud_plane_init(gdrm, formats, num_formats);
> >   	if (ret)
> >   		return ret;
> >  =20
> > -	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
> > -	drm_plane_enable_fb_damage_clips(&gdrm->plane);
> > -
> >   	devm_kfree(dev, formats);
> >   	devm_kfree(dev, formats_dev);
> >  =20
> > @@ -607,13 +568,6 @@ static int gud_probe(struct usb_interface *intf, c=
onst struct usb_device_id *id)
> >   		return ret;
> >   	}
> >  =20
> > -	ret =3D drm_crtc_init_with_planes(drm, &gdrm->crtc, &gdrm->plane, NUL=
L,
> > -					&gud_crtc_funcs, NULL);
> > -	if (ret)
> > -		return ret;
> > -
> > -	drm_crtc_helper_add(&gdrm->crtc, &gud_crtc_helper_funcs);
> > -
> >   	ret =3D gud_get_connectors(gdrm);
> >   	if (ret) {
> >   		dev_err(dev, "Failed to get connectors (error=3D%d)\n", ret);
> > diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/gud/g=
ud_internal.h
> > index d27c31648341..4a91aae61e50 100644
> > --- a/drivers/gpu/drm/gud/gud_internal.h
> > +++ b/drivers/gpu/drm/gud/gud_internal.h
> > @@ -69,6 +69,7 @@ void gud_plane_atomic_update(struct drm_plane *plane,
> >   int gud_connector_fill_properties(struct drm_connector_state *connect=
or_state,
> >   				  struct gud_property_req *properties);
> >   int gud_get_connectors(struct gud_device *gdrm);
> > +int gud_plane_init(struct gud_device *gdrm, u32 *formats, unsigned int=
 num_formats);
> >  =20
> >   /* Driver internal fourcc transfer formats */
> >   #define GUD_DRM_FORMAT_R1		0x00000122
> > diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_p=
ipe.c
> > index 3a208e956dff..1f7af86b28fd 100644
> > --- a/drivers/gpu/drm/gud/gud_pipe.c
> > +++ b/drivers/gpu/drm/gud/gud_pipe.c
> > @@ -10,6 +10,7 @@
> >  =20
> >   #include <drm/drm_atomic.h>
> >   #include <drm/drm_connector.h>
> > +#include <drm/drm_crtc_helper.h>
> >   #include <drm/drm_damage_helper.h>
> >   #include <drm/drm_drv.h>
> >   #include <drm/drm_format_helper.h>
> > @@ -450,6 +451,65 @@ static void gud_fb_handle_damage(struct gud_device=
 *gdrm, struct drm_framebuffer
> >   	gud_flush_damage(gdrm, fb, src, !fb->obj[0]->import_attach, damage);
> >   }
> >  =20
> > +static const struct drm_plane_funcs gud_plane_funcs =3D {
> > +	.update_plane =3D drm_atomic_helper_update_plane,
> > +	.disable_plane =3D drm_atomic_helper_disable_plane,
> > +	.destroy =3D drm_plane_cleanup,
> > +	DRM_GEM_SHADOW_PLANE_FUNCS,
> > +};
> > +
> > +static const struct drm_plane_helper_funcs gud_plane_helper_funcs =3D =
{
> > +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> > +	.atomic_check =3D gud_plane_atomic_check,
> > +	.atomic_update =3D gud_plane_atomic_update,
> > +};
> > +
> > +static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs =3D {
> > +	.atomic_check =3D drm_crtc_helper_atomic_check
> > +};
> > +
> > +static const struct drm_crtc_funcs gud_crtc_funcs =3D {
> > +	.reset =3D drm_atomic_helper_crtc_reset,
> > +	.destroy =3D drm_crtc_cleanup,
> > +	.set_config =3D drm_atomic_helper_set_config,
> > +	.page_flip =3D drm_atomic_helper_page_flip,
> > +	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_state,
> > +	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
> > +};
> > +
> > +static const u64 gud_plane_modifiers[] =3D {
> > +	DRM_FORMAT_MOD_LINEAR,
> > +	DRM_FORMAT_MOD_INVALID
> > +};
> > +
> > +int gud_plane_init(struct gud_device *gdrm, u32 *formats, unsigned int=
 num_formats)
> > +{
> > +	struct drm_device *drm =3D &gdrm->drm;
> > +	struct drm_plane *plane =3D &gdrm->plane;
> > +	struct drm_crtc *crtc =3D &gdrm->crtc;
> > +	int ret;
> > +
> > +	ret =3D drm_universal_plane_init(drm, plane, 0,
> > +				       &gud_plane_funcs,
> > +				       formats, num_formats,
> > +				       gud_plane_modifiers,
> > +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm_plane_helper_add(plane, &gud_plane_helper_funcs);
> > +	drm_plane_enable_fb_damage_clips(plane);
> > +
> > +	ret =3D drm_crtc_init_with_planes(drm, crtc, plane, NULL,
> > +					&gud_crtc_funcs, NULL);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm_crtc_helper_add(crtc, &gud_crtc_helper_funcs);
> > +
> > +	return 0;
> > +}
> > +
> >   int gud_plane_atomic_check(struct drm_plane *plane,
> >   			   struct drm_atomic_state *state)
> >   {
