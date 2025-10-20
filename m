Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B626BBF19A9
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 15:45:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFB4F10E43C;
	Mon, 20 Oct 2025 13:45:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="Irav/ePN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic305-20.consmr.mail.gq1.yahoo.com
 (sonic305-20.consmr.mail.gq1.yahoo.com [98.137.64.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45DB910E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 13:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1760967945; bh=5uVJmr5JR3mO3AFjyOnXGLWxt7VA3RguUalmNLJh42Q=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=Irav/ePNIAV75PrRS5V/74lyoayR08e6/vZMlmAwpqAHo9b8Ff7jVPsRtijEzGIc6Ev+2KcT1SFkY3ZwBRIBGBcGkhqbrBhVqIYvWGZ+6/F/Fcu8gU5lJbR8fNDSEUxRRXpVCTcqsyzbblepxb+YVyQNRXFroNATXN9ipLpfqdXSnwRrkQDnJ2OGhQBNitX9gmtimVmMvwHjfnYLMRFfm9PphRmOYI8HE/WNcnLbNzZHvqesMmGyVc7zKPCQ5cEZpTM184KU46TwnBL9kjRp0qWo+YQFcGfbvEUR7H7e/cUO+2MyHNWNxuyMHEGXySPOlEfzeGZBIR78ltDldhLbzw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1760967945; bh=A0RjmDB5eOVhwoVCMpnosBZWenO0jz2DUtLIdCHuwCN=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=qGtBSnl2Iv/r1RePovmmZjVbynlDdpP6QJeJlavoLzXycqQ1v1Up7S0PoUyz//1oEQqIzoZxwyiSd+yt0NQ/RPvvLU9B52WVxnGPkNc0R8+nYh3S2OCcIqzsta2aXFzhGLBZMNrjxHkwJKtLZV5ZlQJ1cVbJCf8Vza+M4QG2kcsX4s4nK3mQ5lF7QOzvZYhkFzpb1QacMLOrKgXmt4SLsAS1Uzck/jBKPTHgx9GlMzlaSviecqUdunnaeXCF7d0DwvTGd1Tc82loQJqbckOhe0saRMJweqj0eQiuBCigD0jlMYkifhf2173t4GRA0TySxAk5kv1WzxVmgInCo/a/6Q==
X-YMail-OSG: foR3WyQVM1nHGlIAPQwIT9vpJYqckyJhVBRQsqwiqp9I43Ea0CgFjXtlLsj4xQ.
 39VMhoqLtRQW38oB1DgLAplOGBEOklBKGAfZjGOR13FXdranJiXaPtjEDv9eN_EtobMpNJBLuZuI
 f73b.vK6UcE3oYMcerkUkkWo.dAQEwDvUR0KzSACVO.x_XGeWfliQWc42jEGHfU_zS8DJznF3gB3
 Q_cRGRjDOC5RWkezt8oYcJIvk1.P_O4veTBjswAscL84zujlC2ZsScEQZ7xP2.Vl5A1AZWChXjD8
 ULG.n0b09kAcqP9YKDrnQ1WdLea0_vpIZxBt8PC7D.Dn4TakLAsyCK2xrgTqCauzvFhTD25vPCmK
 fuRlLaRAMfFVxlqZxd3XIOESQVOZIinsFGjsFZlJx0edga2miTJbsrTLXMywkTW6no9200Rew_SA
 yQwL4L3MHNbggbWE1t2PQrCcTHqOeH4XPdxNUJG1DpA79dHZzhEe9Jrzg2BBRLUbFM04.Oe42g7j
 abnZachVwzRKjFUfmTRhObNgXnVC7.juwuLAEtvZ0QqupB5FW2TFRpL164pg920xnlVFWaFJzPTc
 gqrOEfmxMcaLczVILgdqDGn0LM8LoQ9JBNdyEX_yozjIKQ3Kc_qslA2mlWuXSj5bi5NgZ7bAGYql
 Uy.776xoEFD_L.bLzIU45clsZS5ln3gkQodqnmvQm6CZxchqKKkhui1FJN4H1fzbqfawxOuwlmWR
 gYk4UzrxbGr1Qh4oBZ7SoYmIlMxxZOLBLfG1Iq.eSNACIW_qvG6mDMOUzMAkKxHfmqj3Xg011bBB
 DqdtRSnMWY.uGbQM3DeEPGRcUsiTQ3qa.3wJAKdvWYiHgkkBumnSRjOiWJLnXnXq.piopBvzRl.N
 2PVvLd_443Z6BwJ6Us5_mqQJj1Es8OotwZC2VPpcZr5UyYT3AkZHpyvcv7.SgLDejhTE4Rx1W3MA
 BkyqfGsqZYP3Q2mD58qDTiB2VYCwoNjzsDZ7B4vA3Y8rNC1piVyWXfAYkMY2iImXMfwqMYl6DeAs
 8BF9V0Oj9Tvx5PB1ljlVlpfhtzgWAgARBd17Z5cCVxs.W90oxEUJ6ZWxrDZGinBCsDWvSlMwjmC2
 trRZqoYnFToLgKjFZyzxCgs0TRlNjVmj2fjwA8UgvqUu2jyMTIJF8udGzNnkp7jkwakZf06Peuir
 PenoNQo5JksBMQk25GwPh.xxCaDC8D0rBpGbzS.J6Y2BZdFUodATWG3a0f29kPOEQH6ILhm.ZCH6
 VSa8nvqPxcJqOREpWQTcjgZzCgf8XnttEzpV0u67hGc07VG3.YnepLSItkbzgW6wuRFeER_qeCPr
 93FHn4AqocHvzt6Xn0olI1ITmTKlfgzdip_RTa4CyaCFbFLf.ZWHwlpXe2AchjcY98NtlfvEyvgf
 z3TKmlsQeAnuPzx_JmEZZLPpyukgmQArAde9phZKE9fsFXhwBL69q6ln4ys7cREKoLZCkRhZ4O36
 4zazddbBEwafNgeLWpqeS2ut3sHf.1OjiKSSPQ.02AfHIBDh2c.MOVTc0v5TWzBCdT1CVBcM8XCl
 gCPWwsCD9DVKy22k4yU.mNE1.LIbLMbPOc9kK3DuJlu9eVffX4Pw4SkHT59NJhSqJtt4mrKsLOu6
 W78vcyKKRTuzBaF57B7CK44oHJvETrwwJKOmoS9zWRMLpIXYYJyfDAfRWFdBSXE_ihAo74UnyakQ
 JIJXWvrONjSwyZ7bQ1FKCjjhtUI7pDpdk86qEzFhAM7KLYkcVbpniWJJVRb_ukjLiTcw5OYc4XZj
 R653k9axMTvE9lF6FJm7pxwCX7y3WJYxjPB5xTW.pLviMTShoMmKCLlnRU.GkhCt9JcDIfwj7uPA
 dtpcSjlVgsdDgbEEL5u7KaCVR.mQxooPh98hbMmd2WXJrye3mM_NruvXjHPjpGdWiPCEUz3dpzkN
 z6DwOs8qlgDOX4Ckmd9y988XSe0Q1tbp8oe14bHbl2syNH7fQ_3G3tSXIY2O_5gIAkEYUN6pCXW8
 leVeia9c8rTpCFJdtPCQJFvX0GEGp3zNxURIxUhNPk8yJ6S6PI2z5utKD8rQbE3E3I_iopNMtz26
 5Veivb.yLIvTKZ7.UR.OKgrHKRNoy0o0x2mj2yEp8G21z5Q3WKncxYv33nt0aft.Q7SCmWy7hJz.
 TTJcP6cbY6BiKnn9imCsXMQKY4vG1d2j1...e6YO6yHhrzAOVqtoXW6r0oR4HHmmepLcBvSOOWIC
 XDWMX0arJ4X46lexlk8hSGzQKVcRophdqsKRPouDUeJ0SbszG19sSCxzHxUI-
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: fb3a4017-ebb5-41f8-b578-7b5168ce3634
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic305.consmr.mail.gq1.yahoo.com with HTTP; Mon, 20 Oct 2025 13:45:45 +0000
Received: by hermes--production-ir2-cdb597784-kgww5 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 6bb113d8e50eb3205fc44aed89e2ae09; 
 Mon, 20 Oct 2025 13:45:40 +0000 (UTC)
Message-ID: <57f201bb938b14a13b4b7ecf8173612232486669.camel@aol.com>
Subject: Re: [PATCH] drm/gud: rearrange gud_probe() to prepare for function
 splitting
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 20 Oct 2025 14:45:38 +0100
In-Reply-To: <cde9304a-5ab8-4f13-841c-c5679d55b502@suse.de>
References: <20251019185642.14266-2-rubenru09.ref@aol.com>
 <20251019185642.14266-2-rubenru09@aol.com>
 <cde9304a-5ab8-4f13-841c-c5679d55b502@suse.de>
Autocrypt: addr=rubenru09@aol.com; prefer-encrypt=mutual;
 keydata=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
 eIvzsqg==
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-oaiLZrNq3M5m3JAyF0Vu"
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


--=-oaiLZrNq3M5m3JAyF0Vu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2025-10-20 at 09:00 +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 19.10.25 um 20:53 schrieb Ruben Wauters:
> > gud_prove() is currently very large and does many things, including
>=20
> 'gud_probe'

Unfortunate typo that I only realised after sending
>=20
> > pipeline setup and feature detection, as well as having USB functions.
> >=20
> > This patch re-orders the code in gud_probe() to make it more organised
> > and easier to split apart in the future.
> >=20
> > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> > ---
> > I wanted to move mode config to just before pipeline init, however mode
> > config is edited in feature detection so I was unsure how to go about i=
t
> > exactly.
> > Further untangling of this may be required before splitting it out
> > ---
> >   drivers/gpu/drm/gud/gud_drv.c | 31 +++++++++++++++++--------------
> >   1 file changed, 17 insertions(+), 14 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_dr=
v.c
> > index b7345c8d823d..583f7f8f4c00 100644
> > --- a/drivers/gpu/drm/gud/gud_drv.c
> > +++ b/drivers/gpu/drm/gud/gud_drv.c
> > @@ -463,10 +463,6 @@ static int gud_probe(struct usb_interface *intf, c=
onst struct usb_device_id *id)
> >   		return PTR_ERR(gdrm);
> >  =20
> >   	drm =3D &gdrm->drm;
> > -	drm->mode_config.funcs =3D &gud_mode_config_funcs;
> > -	ret =3D drmm_mode_config_init(drm);
> > -	if (ret)
> > -		return ret;
> >  =20
> >   	gdrm->flags =3D le32_to_cpu(desc.flags);
> >   	gdrm->compression =3D desc.compression & GUD_COMPRESSION_LZ4;
> > @@ -483,11 +479,18 @@ static int gud_probe(struct usb_interface *intf, =
const struct usb_device_id *id)
> >   	if (ret)
> >   		return ret;
> >  =20
> > +	/* Mode config init*/
> > +	ret =3D drmm_mode_config_init(drm);
> > +	if (ret)
> > +		return ret;
> > +
> >   	drm->mode_config.min_width =3D le32_to_cpu(desc.min_width);
> >   	drm->mode_config.max_width =3D le32_to_cpu(desc.max_width);
> >   	drm->mode_config.min_height =3D le32_to_cpu(desc.min_height);
> >   	drm->mode_config.max_height =3D le32_to_cpu(desc.max_height);
> > +	drm->mode_config.funcs =3D &gud_mode_config_funcs;
> >  =20
> > +	/*Format init*/
> >   	formats_dev =3D devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
> >   	/* Add room for emulated XRGB8888 */
> >   	formats =3D devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(=
*formats), GFP_KERNEL);
> > @@ -587,6 +590,7 @@ static int gud_probe(struct usb_interface *intf, co=
nst struct usb_device_id *id)
> >   			return -ENOMEM;
> >   	}
> >  =20
> > +	/*Pipeline init*/
> >   	ret =3D drm_universal_plane_init(drm, &gdrm->plane, 0,
> >   				       &gud_plane_funcs,
> >   				       formats, num_formats,
> > @@ -598,15 +602,6 @@ static int gud_probe(struct usb_interface *intf, c=
onst struct usb_device_id *id)
> >   	drm_plane_helper_add(&gdrm->plane, &gud_plane_helper_funcs);
> >   	drm_plane_enable_fb_damage_clips(&gdrm->plane);
> >  =20
> > -	devm_kfree(dev, formats);
> > -	devm_kfree(dev, formats_dev);
> > -
> > -	ret =3D gud_get_properties(gdrm);
> > -	if (ret) {
> > -		dev_err(dev, "Failed to get properties (error=3D%d)\n", ret);
> > -		return ret;
> > -	}
> > -
> >   	ret =3D drm_crtc_init_with_planes(drm, &gdrm->crtc, &gdrm->plane, NU=
LL,
> >   					&gud_crtc_funcs, NULL);
> >   	if (ret)
> > @@ -621,6 +616,13 @@ static int gud_probe(struct usb_interface *intf, c=
onst struct usb_device_id *id)
> >   	}
> >  =20
> >   	drm_mode_config_reset(drm);
> > +	drm_kms_helper_poll_init(drm);
> > +
> > +	ret =3D gud_get_properties(gdrm);
>=20
> This function installs plane properties. So it need to be in its old=20
> location after drm_universal_plane_init() and before=20
> drm_mode_config_reset(). It should be renamed to=20
> gud_plane_add_properties(). See [1] for the connector equivalent

This does make sense, though I do wonder why it worked on testing,
either way, will change it.
>=20
> [1]=20
> https://elixir.bootlin.com/linux/v6.18-rc1/source/drivers/gpu/drm/gud/gud=
_connector.c#L474
>=20
> > +	if (ret) {
> > +		dev_err(dev, "Failed to get properties (error=3D%d)\n", ret);
> > +		return ret;
> > +	}
> >  =20
>=20
> >   	usb_set_intfdata(intf, gdrm);
>=20
> After you've called drm_kms_helper_poll_init(), DRM could query the=20
> connector for attached displays at any time. This might require the usb=
=20
> interface to point to the gud device. And the DRM driver also needs to=
=20
> know about the DMA device.=C2=A0 I quick look through the driver code sug=
gest=20
> that it works without, but better not count on it.
>=20
> Best would be to move this line and the block with the DMA setup [2]=20
> just after where the gud device got allocated with devmdrm_dev_alloc(). [=
3]
>=20
> [2]=20
> https://elixir.bootlin.com/linux/v6.18-rc1/source/drivers/gpu/drm/gud/gud=
_drv.c#L627
> [3]=20
> https://elixir.bootlin.com/linux/v6.18-rc1/source/drivers/gpu/drm/gud/gud=
_drv.c#L464

Will do, I'll send a v2 patch with the requested changes.
>=20
> Best regards
> Thomas
>=20
> >  =20
> > @@ -638,7 +640,8 @@ static int gud_probe(struct usb_interface *intf, co=
nst struct usb_device_id *id)
> >   	if (ret)
> >   		return ret;
> >  =20
> > -	drm_kms_helper_poll_init(drm);
> > +	devm_kfree(dev, formats);
> > +	devm_kfree(dev, formats_dev);
> >  =20
> >   	drm_client_setup(drm, NULL);
> >  =20

--=-oaiLZrNq3M5m3JAyF0Vu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmj2PQIACgkQ0n5QwFCu
DOGTeRAAv26J3+a3wBWoo1Oc1Ch7w4iKeQ3xEBuyJlsKkNZzxUSVgk6w3gFsNZNv
2KgW3Lex92nseWc/t3J0wVNq7WNkg4SdH7kfqyAl+uKguAtOIwz0HUju4kVM5PIk
CPbyVSKM7UnaIuPvYKvaW0ful4Ev/AXK1Etb3fSUj4XhFsedB1yJeHdzWfXckEvx
zUbgA7Ob8YwzVl0dHnd5oe8hfg3iCM51q1jEr6aKD5cMt6FjNLpdsVTe3ZtghgdP
D7GgBk8uNDmyQyMV+EMRhLFs8JZ7cUfOPk1vYobWGK4R0/S07FG0tFeqdTPuaIv8
0UP8HZU26rb/nu8Tbj8xwvJCKj67MMht/JQvZntj07x6+TRWLex+QhlBOolLzLSo
0C7y8SC40uIolBEwGj1Y45aG6KqBT0CKOnq8c9OrbHhQXd82m/4ci51OVZkZ67CK
GVgGxbThAq4c+yYvw4MWsUHOCtnPCDRLx0OzwLSG0DHo9NbAvYw8bHwdRd4dfkSR
BbhJXbhYEBIwzT2JtLfP6ScHS2+sYxOcibGf2kpnAXI6W2RaqvxiahAt/AMjahJG
uxZHOqKXGLDJeOWIa4iWi0fcEU9Ocq0sLIKrcQ/e4O7cEpBChNK/1ciZwxEMX/93
dzqwNFtG6Md8Ipe4luc1o7bkDiuz30KeomIMUplQlOPZFfkxiCI=
=cYEe
-----END PGP SIGNATURE-----

--=-oaiLZrNq3M5m3JAyF0Vu--
