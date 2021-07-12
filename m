Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FC73C4651
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 11:43:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836528911B;
	Mon, 12 Jul 2021 09:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D76088401
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 09:43:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B944C22142;
 Mon, 12 Jul 2021 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626083015; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9hPkOzKjOFHtcfzOSXKU7cW9YiJJWafzmuG01D5x/ZE=;
 b=rMt0PMVmudPtE1WJTdJf5urJgaFzoXHvAlDj/pK9nyvQ/EVNjq2oUCETm0ZhuGclIi81Ue
 /gaXM4MpdPHG+JZifIoSAfxQDJ1DLjBupAu7g2QjBBkwe+C2naNLuUB3l0k0UtsXMy2Tup
 /ir3UINJWxq4lrcW/x8w7w3xY5Ss5gw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626083015;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9hPkOzKjOFHtcfzOSXKU7cW9YiJJWafzmuG01D5x/ZE=;
 b=27Lhqc3QD2B/7FKv+CdOrSVxLwh2XrCMR0y/nyUdrlrb0BzbBX3xnSUSvzMe7V5e6sHtwE
 BaUhrtGEQcGXFMBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9389513B1D;
 Mon, 12 Jul 2021 09:43:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ypACI8cO7GC4KQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 12 Jul 2021 09:43:35 +0000
Subject: Re: [PATCH] drm/ingenic: Convert to Linux IRQ interfaces
To: Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>
References: <20210706074409.8664-1-tzimmermann@suse.de>
 <YOk/S1MTPWEbe93Y@ravnborg.org> <ZAX0WQ.WYKBDC2M1I1Y2@crapouillou.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <9076ed6b-cade-4727-ff8b-cf9c8bc42add@suse.de>
Date: Mon, 12 Jul 2021 11:43:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ZAX0WQ.WYKBDC2M1I1Y2@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="CAw5dWKLHM5vkXI6i74jofi2llubegS6N"
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--CAw5dWKLHM5vkXI6i74jofi2llubegS6N
Content-Type: multipart/mixed; boundary="cKK4prfBtvhl3WfFhCpvqDfPpDUGCaJpW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>, Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@linux.ie, daniel@ffwll.ch, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <9076ed6b-cade-4727-ff8b-cf9c8bc42add@suse.de>
Subject: Re: [PATCH] drm/ingenic: Convert to Linux IRQ interfaces
References: <20210706074409.8664-1-tzimmermann@suse.de>
 <YOk/S1MTPWEbe93Y@ravnborg.org> <ZAX0WQ.WYKBDC2M1I1Y2@crapouillou.net>
In-Reply-To: <ZAX0WQ.WYKBDC2M1I1Y2@crapouillou.net>

--cKK4prfBtvhl3WfFhCpvqDfPpDUGCaJpW
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.07.21 um 12:04 schrieb Paul Cercueil:
> Hi,
>=20
> Le sam., juil. 10 2021 at 08:33:47 +0200, Sam Ravnborg=20
> <sam@ravnborg.org> a =C3=A9crit :
>> Hi Thomas,
>>
>> On Tue, Jul 06, 2021 at 09:44:09AM +0200, Thomas Zimmermann wrote:
>>> =C2=A0Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM=
's
>>> =C2=A0IRQ helpers are mostly useful for UMS drivers. Modern KMS drive=
rs
>>> =C2=A0don't benefit from using it.
>>>
>>> =C2=A0Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> =C2=A0---
>>> =C2=A0 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 13 +++++++------
>>> =C2=A0 1 file changed, 7 insertions(+), 6 deletions(-)
>>>
>>> =C2=A0diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
>>> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> =C2=A0index c296472164d9..a09b7da21b53 100644
>>> =C2=A0--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> =C2=A0+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>>> =C2=A0@@ -33,7 +33,6 @@
>>> =C2=A0 #include <drm/drm_fourcc.h>
>>> =C2=A0 #include <drm/drm_gem_atomic_helper.h>
>>> =C2=A0 #include <drm/drm_gem_framebuffer_helper.h>
>>> =C2=A0-#include <drm/drm_irq.h>
>>> =C2=A0 #include <drm/drm_managed.h>
>>> =C2=A0 #include <drm/drm_of.h>
>>> =C2=A0 #include <drm/drm_panel.h>
>>> =C2=A0@@ -799,8 +798,6 @@ static const struct drm_driver=20
>>> ingenic_drm_driver_data =3D {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fops=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D &ingenic_drm_fops,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gem_create_object=C2=A0=C2=A0=C2=A0 =3D=
 ingenic_drm_gem_create_object,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_GEM_CMA_DRIVER_OPS,
>>> =C2=A0-
>>> =C2=A0-=C2=A0=C2=A0=C2=A0 .irq_handler=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 =3D ingenic_drm_irq_handler,
>>> =C2=A0 };
>>>
>>> =C2=A0 static const struct drm_plane_funcs ingenic_drm_primary_plane_=
funcs=20
>>> =3D {
>>> =C2=A0@@ -1098,7 +1095,7 @@ static int ingenic_drm_bind(struct device=
=20
>>> *dev, bool has_components)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 encoder->possi=
ble_clones =3D clone_mask;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> =C2=A0-=C2=A0=C2=A0=C2=A0 ret =3D drm_irq_install(drm, irq);
>>> =C2=A0+=C2=A0=C2=A0=C2=A0 ret =3D request_irq(irq, ingenic_drm_irq_ha=
ndler, 0,=20
>>> drm->driver->name, drm);
>>>
>=20
> Can't you use the devm variant?

I think so, I just tried to minimize the difference.

Best regards
Thomas

>=20
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (ret) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_err(dev, "=
Unable to install IRQ handler\n");
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return ret;
>>> =C2=A0@@ -1192,14 +1189,18 @@ static void ingenic_drm_unbind(struct d=
evice=20
>>> *dev)
>>> =C2=A0 {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct ingenic_drm *priv =3D dev_get_d=
rvdata(dev);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk *parent_clk =3D clk_get_par=
ent(priv->pix_clk);
>>> =C2=A0+=C2=A0=C2=A0=C2=A0 struct drm_device *drm =3D &priv->drm;
>>> =C2=A0+=C2=A0=C2=A0=C2=A0 struct platform_device *pdev =3D to_platfor=
m_device(drm->dev);
>>> =C2=A0+
>>> =C2=A0+=C2=A0=C2=A0=C2=A0 free_irq(platform_get_irq(pdev, 0), drm);
>>
>> The driver was missing a drm_irq_uninstall() so the above code is
>> actually a small bug-fix. It should be mentioned in the changelog.
>> With this fixed:
>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>>
>> Note: I expect Paul to review too and apply.
>=20
> I wasn't Cc'd? :(
>=20
> -Paul
>=20
>>
>> =C2=A0=C2=A0=C2=A0=C2=A0Sam
>>
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_notifier_unregister(parent_clk, &p=
riv->clock_nb);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (priv->lcd_clk)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_un=
prepare(priv->lcd_clk);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk_disable_unprepare(priv->pix_clk);
>>>
>>> =C2=A0-=C2=A0=C2=A0=C2=A0 drm_dev_unregister(&priv->drm);
>>> =C2=A0-=C2=A0=C2=A0=C2=A0 drm_atomic_helper_shutdown(&priv->drm);
>>> =C2=A0+=C2=A0=C2=A0=C2=A0 drm_dev_unregister(drm);
>>> =C2=A0+=C2=A0=C2=A0=C2=A0 drm_atomic_helper_shutdown(drm);
>>> =C2=A0 }
>>>
>>> =C2=A0 static const struct component_master_ops ingenic_master_ops =3D=
 {
>>> =C2=A0--
>>> =C2=A02.32.0
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--cKK4prfBtvhl3WfFhCpvqDfPpDUGCaJpW--

--CAw5dWKLHM5vkXI6i74jofi2llubegS6N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDsDscFAwAAAAAACgkQlh/E3EQov+Dd
Yw/9GSx4pbYp7T6/82AyaGYFpxQ29Q5bcAKIYiTn98KLFD3YOhVVJ5ebTJzajhdwpRN7PLGRfY1H
/xsVTzVRUmZvxI8X3KOMnBJo4DaJQDmpxF9VDLSsvd86/4nnCiVzKwoCl2NvTPNM4WTl4fSrmBzI
aTdEZ9L9eQWPszeQfz4wryHtk5jUggiLXTlduIFMe1nPSjSX0Kue+p0ANdcyTCp7OD02K8YfpYyG
sLeGvapMVNFVeCaH3DO13/+c4CSG/61nYRLtgw2CWI/h81SYuBwTFEmPTNjbmIhOJfr3rSIajd+a
zIcwRfsemtu+sXdCiHbca+Y+LWzsUopxVtaD54W7TvpyBvmj9dzS8582U5ffsjCbe4OXqb6zpVPN
hih8+ATifVaQLOtdST3oNZyA1WBYfyy69txnTbCKyA7+Fb4E82lncg0v1M4o0FvucADTwpM56XNA
CTY6bUSZHJWdj9xM41aLLYNZzVqJ0aIxvPxv5UjAYAfV+EEEDmG+aWneJrGoUG/74RT7y+Y2Lqh9
4atjxlBccy/oZ2wcGpVNEpL8iiO5XJzEjXD1zs1CnAuJszs+meqNwpDDBNdN5KqMo6+AV3E3pvTO
DJDEYuFuWHyGdtmMpLZAQopINUij3ptdZ7w7+ymsG/oOz98zgkPDbLR2A6eTGL7WD2yPvAmo+qgO
TZs=
=ApyR
-----END PGP SIGNATURE-----

--CAw5dWKLHM5vkXI6i74jofi2llubegS6N--
