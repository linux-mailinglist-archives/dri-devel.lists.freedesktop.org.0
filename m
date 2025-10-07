Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF2BC11B5
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 13:16:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A478910E01F;
	Tue,  7 Oct 2025 11:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="E4FgLF+9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic316-8.consmr.mail.gq1.yahoo.com
 (sonic316-8.consmr.mail.gq1.yahoo.com [98.137.69.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2765A10E01F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 11:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1759835763; bh=loXJVbjUe38Y/I++RJ3anYr8BxHmH9jKlc+9Jl5UhGg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=E4FgLF+9ZIqVxL5pzu0TvYEeVKN3d6sihnNtpzkzZ2Bqwy/oerwz8MnxAyTZQ9OibVds3+LJz7TakOTsORXtJYPBTaSDsJOvFn4Idc1kKXlJhxmsWd8U81NRPk/XRMWIDM9O18LPixbNy7NI5P1OhLlovTdsOah5f55uwfT1SsZvwXZhtcmp8t8mubcZsos7TPf78wYh4xz86/WgoscT0i0MWkHyeyuPycWx0d6Ljng2Iwk+TeqRIL6MWsNZJNq5MkAG+YCmwcIY2UyhXgx4heD7qWpIN/Cbe67HoCDACOKYzQugOOyxLCzmiZMy8deRc+nX0AbNaQGqaqXKrZxLpw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1759835763; bh=GBSMYvzxFOqq4DivVx3UCKW3O20uhKJGT6JWT6S93+P=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=ba/7eJU28loUVtCWUCDODVMDn4jM4b5u13ephrPwwzB0iQYJHRpySU7wmpN9FU37idXZSJcpW+uJKqxXEDb/6CDHdrjsJ6HuZZsyjkk+7Ho1TRl9FuNZD4xz7n4WrP5mNuuHfafM3d9qcKbykSE0JLrG8CmyicC/Jy6+Io3ewT5qt6TwXvGj4OAwXhClVcltf0uqCSArsFsDM4/f/8nYg3QJX+nTNii932zxuB2vRpbosCCe5TuIq7GqgCAqAXNu8b8ANXCwK9p2uprs4GOEX3FIE7VzCAK+9Zdvo8Q9X2ZUGCD0/t5RdTj0AxjZ8nLATzmOZLNhif0wSTlDW/SykA==
X-YMail-OSG: qzY9QZYVM1l2eIfWu1ibb6DmPKRrOhDaGcIm7PvwfQ.9O_FEF75tOxIC7hCVNzF
 VMk3TMZt_9OE32h55p2kqVk4SDrwTZbNbGBr2ha_JM37vwC1Od_chxQvizYzLpd3vmwfo6lgx3.9
 blMdsP94ssX2FV2V8ezS7fi.8IbB9fM2UVYyfn6feV97Js1RfwMe.thCwL_lVI0LNIbi5Ubzk20v
 rbKtEV2FgF_xkllDjG.MkwkcFmt25dIukZ9dIK7KlFuYC3TGLFbE93ssymBRoI39HzmTv0xK031_
 NI_s9Z7twH700N8pNzE2uAb9ns1GH9nH2WbvAFDeY8zdvSODssavEVWb12FX1SE7Pm7euV41eIdA
 0EOJnNL.puTXjwrPzIWfCHdzGSVPiaTTIjsFCGaTaePdtxHbz5pINLBrIIDjuh9qzsZvlY8S2mro
 pXly9XZi0TdgB_Vb4ygdtNqq4WMu.oX98SuqhER7bPFBGyHH6ZTYdDE7qYRmzIcCDfN6v_6wLeUK
 IZghnskS9fjvPzJrVkLu7kPgQKLpKePwwsvMQTxqXDinefWZW62atCsVzrIZY8xBkMs3rlc7pWEm
 TOCDrhXB3tG7wkUxKLJ2ikUWOJ8ntA31k57pS.iCqlxAg6EtfAyZ1GCIaPjAX2e4ktV.j_4lCKIg
 8vX6ggFZxkp7go7mONBQ.a72AHJ5LyF5Xh6rNEvHInmusqzkAonY1y31Bn4vlC98g4mUhbZjmwjI
 7IjxROBbmtW9.Z9dDE9XE00Ae.ATavkcJKBnI.q7llTbTS0x6DoYP7MAwA5Br.qPGMB31ypYMtaQ
 K7WzK6ZU9eA91PELfBmcIqt0sqtXL8pCMtF6PQ.LcYGQsOdvgpHEbi54Et850gYkKwT6QXXTj4vd
 9a6FafHIXfN2RhYO2ou2NQFffujtRUH2_3dkam1lqgsBOMpWGJq_EDzvd1_BQy3H1sOrw1UN5Cs9
 a4MsxcBxjAsS.WoHhQncU8HvZfne2JXB60vAsLAOz.LmYACxTNoEi2rfFPp0.yxRDd7SfpEYSPzB
 _3bJbFhXtepMyQvkAelPSQg3wQbIUfIyiG6_pmeBZJl6kPRaxMugHiydPmxgH3OY7xoawbESNlgI
 NTygA7v_pPd3wOl5ezeoBMp3TyzP6pFdd.w9fUCKorRdy.vlgcdhGmJqcIGRXyS.apurnGnpOOBx
 R7azQ6CAZ421veZD8fIcIHtbZ9tMiKK95JOF5sVI1q8_hRr3nf571AeM1WBLXjsL8Lr6unLgXs5M
 et_WBebJkEzAx744T1aa_2Tgyu1LKME62ldK.IpmG6bsOKlmS7YW4k3xXn1gUBmvpcZpU9yZQcyc
 Xnjedhs2hshG0myWExQD2YMBnGt0AeqEmQ4_sd1tCAJZSivF42OIUE6JIYwCEcnSr7D22ASEqr0W
 cVOIGz_V2d_TslLIYToTg5mLKHv4fFYP9pKnfp01q8EQUNHp_JZDumQF8BGCfJHtmm81S_pnF5sk
 x3virBn_qLM.sLPmUIx47S28qQ3MX5xKQIJeAmYegRV2JPw5vmpPBwituJ7ELi2tj4ZaID_uOK0s
 KP8hl7RA4yEXHlggJwCkepLMuEQPNOo52.qHxaeV1kCr6PT686HxFF90F3rdXpiZY51uJxC3V9Pb
 dQJASC2pI9FWMidasyI8kRXVYzYB3ICirrIx7eWC5ptDUoTOCl2niHngIM73bWaS__wOD4iuFgj8
 h5P32kGvaAiUIrUwFFt44a5X2FgibhhOL68JVFKnGXgiHHmgBl409h3PiVtHLd5Tr_cWoDXVi2I9
 9.IYa.BOLQ3w._buqm4XxBYsyt0fOym1KuG9yP5CITcZVJacO5bb9.NX6QS8zGU.0U3gQvOow649
 VGoKY2Y.RcqkXKrHJGcsD79AAJTglC5gv88qbnGn_jUXY9hVvK7SgnGeeaHHnzm38ys02Hrt4aLc
 FAmpITp8kV6T8.3HNcMKA_y4nHLr7xp4.WnsW7ZHFAScDNAHALiivp5p6k.Y5Xacf.L.0NBdJrhm
 oQHM8GXaviKTfl6S51Zdgx2vYBAss7VfyJA9GQ8QD3jZNa8.QG9WRxdGY6GPpAztFRgzM8hkc96i
 vFUgtPsCiZ93cICQiQQF65EM6Kb3MwTjEPpPYebI2xLl8xC2l6WQd8PAVBzs5.XetMuqfPBE9Ajd
 kZWVg6df6t_bnCojUml7R7mZqppOzb1fDZKd829tQf406YXfxgMgtGaVOM9FLEWDFFkOOotkbP4B
 7DYbX_6HFrrGO4Awndgn.F7SKvGv2CX9EKO3YeYBrU0nD4b0TGNx8.t_U
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 8c16ec01-5935-4a4a-b641-8619e8cc0707
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Tue, 7 Oct 2025 11:16:03 +0000
Received: by hermes--production-ir2-ccdb4f9c8-gvlwm (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID f95b06441e85b3a40598eae3f533faba; 
 Tue, 07 Oct 2025 11:15:57 +0000 (UTC)
Message-ID: <78e4daaa8a031b9e9a28da0e2366aad691708f6b.camel@aol.com>
Subject: Re: [PATCH] drm/gud: move plane init to gud_pipe.c
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 07 Oct 2025 12:15:55 +0100
In-Reply-To: <02dc1df6-bdd7-4b6d-9668-9f700b33d97a@suse.de>
References: <20251004175900.15235-2-rubenru09.ref@aol.com>
 <20251004175900.15235-2-rubenru09@aol.com>
 <e0d81b43-22cf-4004-936f-2a1dae9d8741@suse.de>
 <c1c282fd64521f1cc675a53084683af745070697.camel@aol.com>
 <02dc1df6-bdd7-4b6d-9668-9f700b33d97a@suse.de>
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

On Tue, 2025-10-07 at 12:56 +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 07.10.25 um 11:52 schrieb Ruben Wauters:
> > On Tue, 2025-10-07 at 11:17 +0200, Thomas Zimmermann wrote:
> > > Hi Ruben,
> > >=20
> > > please see my comments below.
> > >=20
> > > Am 04.10.25 um 19:49 schrieb Ruben Wauters:
> > > > gud_probe() currently is a quite large function that does a lot of
> > > > different things, including USB detection, plane init, and several =
other
> > > > things.
> > > >=20
> > > > This patch moves the plane and crtc init into gud_plane_init() in
> > > > gud_pipe.c, which is a more appropriate file for this. Associated
> > > > variables and structs have also been moved to gud_pipe.c
> > > >=20
> > > > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> > > > ---
> > > > It was somewhat difficult to determine what exactly should be moved
> > > > over, gud_probe() as a function quite a mess, so I need to figure o=
ut
> > > > exactly how to split this one up.
> > > Agreed. The probe function looks really chaotic.
> > >=20
> > > I think that just moving CRTC and plane is a not enough. In ast and u=
dl,
> > > we have functions that init the whole display pipeline from
> > > drmm_mode_config_init() to _reset(). See [1] and [2] for examples. Th=
at
> > > would likely be a good model for gud as well, but gud's probe functio=
n
> > > mixes up pipeline init with other code.
> > >=20
> > > [1]
> > > https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/ast/a=
st_mode.c#L1005
> > > [2]
> > > https://elixir.bootlin.com/linux/v6.17.1/source/drivers/gpu/drm/udl/u=
dl_modeset.c#L482
> > >=20
> > >=20
> > > Looking over gud_probe, the following blocks are related to pipeline =
init:
> > >=20
> > > - lines 466-469 [3]
> > > - lines 486-489
> > > - lines 558-565
> > > - lines 590-599
> > > - lines 610-623
> > > - line 641
> > >=20
> > > [3]
> > > https://gitlab.freedesktop.org/drm/misc/kernel/-/blob/drm-misc-next/d=
rivers/gpu/drm/gud/gud_drv.c#L466
> > >=20
> > > I'd try to move these lines into a new helper that initializes the fu=
ll
> > > modesetting pipeline.
> > >=20
> > > The other code that happens in between is either preparation or clean=
 up
> > > and should be done before or after creating the pipeline.
> > These changes will probably required another patch/possibly even a
> > patch series, so will be more extensive, as such they make take me
> > longer to do as I consider the best way to go about it.
>=20
> It's really just about moving code around and what you currently do=20
> (moving CRTC init into plane-init code) is generally not advised.

Ahh, I understand, that will probably have to be split into a separate
function then.


> Another step in the right direction would be to reorganize gud_probe()=
=20
> first. I mentioned the pipeline init, but anything that is between could=
=20
> either go before or after pipeline init. That could be done in a patch=
=20
> series or even individual patches at your preferred pace. In the end,=20
> you'd have a block of pipeline-init code on the middle of gud_probe,=20
> from where it can be moved into a helper easily. Would that work for you?

This might be a bit easier to do at least at first, I shall get working
on that.

Ruben
> Best regards
> Thomas
>=20
>=20
> >=20
> > Ruben
> > >=20
> > > > As an aside, I noticed that the driver doesn't have a version macro=
 in
> > > > gud_drv.c, and therefore is shown as 1.0.0. I was thinking of
> > > > introducing a version, but I wanted to know how others generally de=
al
> > > > with driver versions. I'm not 100% sure if it's *necessary* for GUD=
 but
> > > > it might be a good idea.
> > > I wouldn't bother at all about module versions. AFAIK no one cares ab=
out
> > > it anyway.
> > >=20
> > > Best regards
> > > Thomas
> > >=20
> > > > ---
> > > >    drivers/gpu/drm/gud/gud_drv.c      | 48 +-----------------------
> > > >    drivers/gpu/drm/gud/gud_internal.h |  1 +
> > > >    drivers/gpu/drm/gud/gud_pipe.c     | 60 ++++++++++++++++++++++++=
++++++
> > > >    3 files changed, 62 insertions(+), 47 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gu=
d_drv.c
> > > > index b7345c8d823d..967c16479b5c 100644
> > > > --- a/drivers/gpu/drm/gud/gud_drv.c
> > > > +++ b/drivers/gpu/drm/gud/gud_drv.c
> > > > @@ -16,7 +16,6 @@
> > > >    #include <drm/clients/drm_client_setup.h>
> > > >    #include <drm/drm_atomic_helper.h>
> > > >    #include <drm/drm_blend.h>
> > > > -#include <drm/drm_crtc_helper.h>
> > > >    #include <drm/drm_damage_helper.h>
> > > >    #include <drm/drm_debugfs.h>
> > > >    #include <drm/drm_drv.h>
> > > > @@ -338,43 +337,12 @@ static int gud_stats_debugfs(struct seq_file =
*m, void *data)
> > > >    	return 0;
> > > >    }
> > > >   =20
> > > > -static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs =
=3D {
> > > > -	.atomic_check =3D drm_crtc_helper_atomic_check
> > > > -};
> > > > -
> > > > -static const struct drm_crtc_funcs gud_crtc_funcs =3D {
> > > > -	.reset =3D drm_atomic_helper_crtc_reset,
> > > > -	.destroy =3D drm_crtc_cleanup,
> > > > -	.set_config =3D drm_atomic_helper_set_config,
> > > > -	.page_flip =3D drm_atomic_helper_page_flip,
> > > > -	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_stat=
e,
> > > > -	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
> > > > -};
> > > > -
> > > > -static const struct drm_plane_helper_funcs gud_plane_helper_funcs =
=3D {
> > > > -	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> > > > -	.atomic_check =3D gud_plane_atomic_check,
> > > > -	.atomic_update =3D gud_plane_atomic_update,
> > > > -};
> > > > -
> > > > -static const struct drm_plane_funcs gud_plane_funcs =3D {
> > > > -	.update_plane =3D drm_atomic_helper_update_plane,
> > > > -	.disable_plane =3D drm_atomic_helper_disable_plane,
> > > > -	.destroy =3D drm_plane_cleanup,
> > > > -	DRM_GEM_SHADOW_PLANE_FUNCS,
> > > > -};
> > > > -
> > > >    static const struct drm_mode_config_funcs gud_mode_config_funcs =
=3D {
> > > >    	.fb_create =3D drm_gem_fb_create_with_dirty,
> > > >    	.atomic_check =3D drm_atomic_helper_check,
> > > >    	.atomic_commit =3D drm_atomic_helper_commit,
> > > >    };
> > > >   =20
> > > > -static const u64 gud_plane_modifiers[] =3D {
> > > > -	DRM_FORMAT_MOD_LINEAR,
> > > > -	DRM_FORMAT_MOD_INVALID
> > > > -};
> > > > -
> > > >    DEFINE_DRM_GEM_FOPS(gud_fops);
> > > >   =20
> > > >    static const struct drm_driver gud_drm_driver =3D {
> > > > @@ -587,17 +555,10 @@ static int gud_probe(struct usb_interface *in=
tf, const struct usb_device_id *id)
> > > >    			return -ENOMEM;
> > > >    	}
> > > >   =20
> > > > -	ret =3D drm_universal_plane_init(drm, &gdrm->plane, 0,
> > > > -				       &gud_plane_funcs,
> > > > -				       formats, num_formats,
> > > > -				       gud_plane_modifiers,
> > > > -				       DRM_PLANE_TYPE_PRIMARY, NULL);
> > > > +	ret =3D gud_plane_init(gdrm, formats, num_formats);
> > > >    	if (ret)
> > > >    		return ret;
> > > >   =20
> > > > -	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
> > > > -	drm_plane_enable_fb_damage_clips(&gdrm->plane);
> > > > -
> > > >    	devm_kfree(dev, formats);
> > > >    	devm_kfree(dev, formats_dev);
> > > >   =20
> > > > @@ -607,13 +568,6 @@ static int gud_probe(struct usb_interface *int=
f, const struct usb_device_id *id)
> > > >    		return ret;
> > > >    	}
> > > >   =20
> > > > -	ret =3D drm_crtc_init_with_planes(drm, &gdrm->crtc, &gdrm->plane,=
 NULL,
> > > > -					&gud_crtc_funcs, NULL);
> > > > -	if (ret)
> > > > -		return ret;
> > > > -
> > > > -	drm_crtc_helper_add(&gdrm->crtc, &gud_crtc_helper_funcs);
> > > > -
> > > >    	ret =3D gud_get_connectors(gdrm);
> > > >    	if (ret) {
> > > >    		dev_err(dev, "Failed to get connectors (error=3D%d)\n", ret);
> > > > diff --git a/drivers/gpu/drm/gud/gud_internal.h b/drivers/gpu/drm/g=
ud/gud_internal.h
> > > > index d27c31648341..4a91aae61e50 100644
> > > > --- a/drivers/gpu/drm/gud/gud_internal.h
> > > > +++ b/drivers/gpu/drm/gud/gud_internal.h
> > > > @@ -69,6 +69,7 @@ void gud_plane_atomic_update(struct drm_plane *pl=
ane,
> > > >    int gud_connector_fill_properties(struct drm_connector_state *co=
nnector_state,
> > > >    				  struct gud_property_req *properties);
> > > >    int gud_get_connectors(struct gud_device *gdrm);
> > > > +int gud_plane_init(struct gud_device *gdrm, u32 *formats, unsigned=
 int num_formats);
> > > >   =20
> > > >    /* Driver internal fourcc transfer formats */
> > > >    #define GUD_DRM_FORMAT_R1		0x00000122
> > > > diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/g=
ud_pipe.c
> > > > index 3a208e956dff..1f7af86b28fd 100644
> > > > --- a/drivers/gpu/drm/gud/gud_pipe.c
> > > > +++ b/drivers/gpu/drm/gud/gud_pipe.c
> > > > @@ -10,6 +10,7 @@
> > > >   =20
> > > >    #include <drm/drm_atomic.h>
> > > >    #include <drm/drm_connector.h>
> > > > +#include <drm/drm_crtc_helper.h>
> > > >    #include <drm/drm_damage_helper.h>
> > > >    #include <drm/drm_drv.h>
> > > >    #include <drm/drm_format_helper.h>
> > > > @@ -450,6 +451,65 @@ static void gud_fb_handle_damage(struct gud_de=
vice *gdrm, struct drm_framebuffer
> > > >    	gud_flush_damage(gdrm, fb, src, !fb->obj[0]->import_attach, dam=
age);
> > > >    }
> > > >   =20
> > > > +static const struct drm_plane_funcs gud_plane_funcs =3D {
> > > > +	.update_plane =3D drm_atomic_helper_update_plane,
> > > > +	.disable_plane =3D drm_atomic_helper_disable_plane,
> > > > +	.destroy =3D drm_plane_cleanup,
> > > > +	DRM_GEM_SHADOW_PLANE_FUNCS,
> > > > +};
> > > > +
> > > > +static const struct drm_plane_helper_funcs gud_plane_helper_funcs =
=3D {
> > > > +	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
> > > > +	.atomic_check =3D gud_plane_atomic_check,
> > > > +	.atomic_update =3D gud_plane_atomic_update,
> > > > +};
> > > > +
> > > > +static const struct drm_crtc_helper_funcs gud_crtc_helper_funcs =
=3D {
> > > > +	.atomic_check =3D drm_crtc_helper_atomic_check
> > > > +};
> > > > +
> > > > +static const struct drm_crtc_funcs gud_crtc_funcs =3D {
> > > > +	.reset =3D drm_atomic_helper_crtc_reset,
> > > > +	.destroy =3D drm_crtc_cleanup,
> > > > +	.set_config =3D drm_atomic_helper_set_config,
> > > > +	.page_flip =3D drm_atomic_helper_page_flip,
> > > > +	.atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_stat=
e,
> > > > +	.atomic_destroy_state =3D drm_atomic_helper_crtc_destroy_state,
> > > > +};
> > > > +
> > > > +static const u64 gud_plane_modifiers[] =3D {
> > > > +	DRM_FORMAT_MOD_LINEAR,
> > > > +	DRM_FORMAT_MOD_INVALID
> > > > +};
> > > > +
> > > > +int gud_plane_init(struct gud_device *gdrm, u32 *formats, unsigned=
 int num_formats)
> > > > +{
> > > > +	struct drm_device *drm =3D &gdrm->drm;
> > > > +	struct drm_plane *plane =3D &gdrm->plane;
> > > > +	struct drm_crtc *crtc =3D &gdrm->crtc;
> > > > +	int ret;
> > > > +
> > > > +	ret =3D drm_universal_plane_init(drm, plane, 0,
> > > > +				       &gud_plane_funcs,
> > > > +				       formats, num_formats,
> > > > +				       gud_plane_modifiers,
> > > > +				       DRM_PLANE_TYPE_PRIMARY, NULL);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	drm_plane_helper_add(plane, &gud_plane_helper_funcs);
> > > > +	drm_plane_enable_fb_damage_clips(plane);
> > > > +
> > > > +	ret =3D drm_crtc_init_with_planes(drm, crtc, plane, NULL,
> > > > +					&gud_crtc_funcs, NULL);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	drm_crtc_helper_add(crtc, &gud_crtc_helper_funcs);
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >    int gud_plane_atomic_check(struct drm_plane *plane,
> > > >    			   struct drm_atomic_state *state)
> > > >    {
