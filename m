Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52ECC5EA65
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 18:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C38510E260;
	Fri, 14 Nov 2025 17:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=aol.com header.i=@aol.com header.b="QMIGxr8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sonic317-20.consmr.mail.gq1.yahoo.com
 (sonic317-20.consmr.mail.gq1.yahoo.com [98.137.66.146])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD9CE10E260
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1763142661; bh=VT+J0VYG+H0vzAhWiB32tQvnzaAH+Jjn7yd0kj9BFSc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=QMIGxr8LiYXwVHHff0C7o4arqqj0Kl6prw3V8GS+DKPaGWaNhEOlpK/NASb0peZPbyc6gokAkl/4RotMpAlVxD5fFr9Q77EKctg2GAe/HWCLqOu6mbX5hROwkLBQ7aWUUp8mpYE5a73S314lvug9g0ShHnRnlmNrLlOPpk+8aQHUQQuci8YGMcZ2R7Dte3eUAaVUsC20KG2JsV6OS5dreT6eqn1k/K4LQLNqaQtullqneTSBfQfTHa/Z0h8ogQ8tjTclsBVyvXgKqYq3tjMomkYnG1BeQvL0/geDD9Y/KAgJC/VyZECaZflbwXHxg87G6iP7WVYpHKVQ+tBr3KT7iw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1763142661; bh=wh+g1rYNgxKpeZM5dIGxsOTWBMGyKhIuTYluveR9ZO8=;
 h=X-Sonic-MF:Subject:From:To:Date:From:Subject;
 b=mPG/ttxvU5hC7XkrytaGVq+OjfB7DF15l2aQvkIg/5L8MIwlkWUEvFYnhFrjjQWTL6Uiaaj5VzAIunCBA8cRwC2yXTzPP6QV6BNmXeYjFv9abTJOG/LqgxRWMedb1IbPWBfBXP7HE2AWgMqXJUV3dCfDWlKzP2XZ/V09BlJh2txz+houBXiCwPNAQOA/kcDf5LyouClSqSoUyilKr0ubEiF6PLm8tnvmC6BU4KX4KmvrLmjE0mIZOnJRms0ZHRzYv+0BiIJDJqPHg+Ot+/tqu1ZrGpaYrdM0UGinlMq2+9PUfkFN/7a3nLr3EK1FkCP0RfycadR7wPYv771wGNQWPA==
X-YMail-OSG: z6IWdusVM1ltTieDBnljeyEgAsx7rYOBEgk.Ylz_W99CrvT4nzIRmMQgzSmt_Lm
 hwz7ADQq0swe1nP81.ojEnVkfr.WJ3y_E8zG2QwFYDUJ6MA0y4jhIkpmsQtOYDkZ2l5f0ntb1sja
 FtkqDLu_t6vFiFjdMca8KeeYgtmGiImrDgKUTb9zsEk2kr5OnKhmshizhaqGxaLgomaxt2D9WCx9
 rw8cVB2YRpql3Wgjta3i07UkWG7Zjo8ZHM59hI21sI0EqrcQgAc5dTS7yZ57DTlD.U8JJXQ_wwdA
 bk.bJnwfY.rxFY7mj3N0sbr3jR5nhTpUJyILOe2IFD03jsO1hOluB.Y.G.R.KIW2MqYKNBi2383d
 Hj7gl4qKJasKt0biCQ8I2GyT0phOO0MDoXhijqRvR_ImBP3trJtyRMlyPYBO5B_1ZRpx5yEOOAdz
 tyayY4hmVb44RbOVbVvdA7COtmDQmt6RYynkLpD8yunNYx15pMiIRWvPhhjmYrqus.EyVU9uYV3W
 FKlR5SvL5BBxiHXIvUMCwctQMBrjFZciGRQKIqJKaaLIdYGVZc0XoLi26DFqZ3dGzOxSbKx476vm
 EZU571kJCOSFAE182tz10bJEfLykzb8a9w0RgRLFD1IVUB.wdzgDWc5HeJSOfy0lgmL8xVGUcpz3
 3YrkLbkfc4ERATAfWP7uuyGIR9Me3lZa9acZJysl2sizsanqF89BBZJKjWzqtM1KsXHID6t2kkdS
 0p9S8JuEdX5uY7UBKMC3io.TbiBMWa0AdQ35QY3CKcuKjNjzRv8icO133R7Fpi4pvtQ9OTMqMCCF
 ZQtCAhnx.yoOJ2cMPeiTPfAiIZl1EzZZaG6b4RP6UseLBZo0QndB84XlrZ7f7E_rHZzc18iSLQeV
 thd1PcBE6MXwJ_7Qtl___89oHvzV2BwmF3H8N3vW6w76rB3zBOndBODEpS3JaBFyRDsF3lB4lZ_M
 O0ZOxdnymq_OQFeFbDj7eTwVY8HypuVMbbWtDThBuHBZYFS6MrCLp6TH.7vppA4pjgVsS4H2aYu7
 7PNBDxVRatmWXCCvYXivuIZ5Q2cJyuV_rR252xzrNLtdm3OjR5UPD82QVSdYQBwKLXZmdqqox.fG
 qtedmMGIKK7jcj2VFewImfLAUy6sZ1jFtNsNgmtg4XOR55FrIJ9sc.xIbjmL1OTAclBcu4NlRFsq
 oJqLEtMhm2CJ8_shsph4iSzX9wA9Zzs.3F2GAapRYQ0q6xNdauWvdQdiJ6F8o0aPrlqFCfo.1I05
 1zeByx3bY_nVqo.QUn7kPVk.Mt7HerELFFoQy3XdMyuYlOF3E4JFL7O2Cy9vDf2FV0vly2X8dIRy
 N6tka73g5rAFqY7_Xcoa9vdHHtwTe9hoTqpIqcVIsOiapgIyx5vzBSaRUHKxE1DoVfKReBOHjqGa
 LPnZaS5xEA2RNzeMfuHdlRhk1z700u0prnq3KNe67UqnLT9reI2jfK0uci9fg4yl1MNJijATEDhH
 Qb.1qKDCF9ZPoOI28Hb46_I7TKWw3A56hEYoQ9J0YR5KHe386EjVenZaWRYd4yGQ3FIxLpKUPKXv
 FcxOMH0ASxRTjxwria_h.FuBkGS2iyE2JYSYGehLQa6ShaiZOH8c5rFe_Wu4lG.sfB1sAddC1kVH
 AMaKL74U1w99nk5F8l.q2IlUBk6CdmZvf1TqOOLKwhPDe5ZMsifTKnoN9HShHdDngoTFvBu7Mwnk
 y.wwVWSZKFQLdJqgA9OO8bS1lAQjQLshVWnbNghOUymTedYX0NwYWg.RzDp.0VrxeYE6Jh9FRA7V
 _QgA.OZzYqT9YzCr8pqDdJ4lwi1Ayz0fhPg7GGidQKh5YXivwpO1wHf8EXV4E6igxHk4J28X7cTc
 cWT5SZ1PotQqBcLutT0ip.QQ.0tqwfT_VYhhR3e2LmU_iFPWyGSv4yI_xzsn.NVouyh9pXqffFwQ
 PM36cfsgIRx3.4K81aNZqEpXnoiZkvuOWF6VWqc1vexp3utHBfovWj7etqN8G_4Ek4GwDwDfJHUo
 FZo6sRUI6jt2jXsvOlieIuvejTcUugAPPHG2nexF5w7Nt.mVflCiyr8bL9_uUkRumOluIFM3xPkG
 oniDWi6XLtI_540z95s7_xH7zMVyy4RnjvGLFN35nPPsSv2sjqE.COKpA1kt1ZBxzOzorJGhIbc3
 GS7U9ajFlNinsCKRX.mglxwpBn_cBYI.jaEwJFoLcgJGEgr5O65I.G6nX1CAwtKrZ_S0cWJFWCc8
 D_BUDdkwOkH8G3DCPmBX9TrADJeo.HHJR2Q4IsnnzFDp8Er1.GfUT4uh3ehI6zQ--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 909c4223-e2e2-4c15-af84-8e93e76cc7bd
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Fri, 14 Nov 2025 17:51:01 +0000
Received: by hermes--production-ir2-5fcfdd8d7f-xzpsk (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 9a5ce84373cfa11580c01d89e68687ee; 
 Fri, 14 Nov 2025 17:50:57 +0000 (UTC)
Message-ID: <79ad192f1444daeeaad8543b652cd49f13e95223.camel@aol.com>
Subject: Re: [PATCH] drm/gud: move format init from gud_probe()
From: Ruben Wauters <rubenru09@aol.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 14 Nov 2025 17:50:51 +0000
In-Reply-To: <dbf71996-c470-4875-82e0-19f139fb830a@suse.de>
References: <20251110160428.2456-1-rubenru09.ref@aol.com>
 <20251110160428.2456-1-rubenru09@aol.com>
 <dbf71996-c470-4875-82e0-19f139fb830a@suse.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-TRnyHmCtHkhwyArqu2OQ"
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-Mailer: WebService/1.1.24652
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


--=-TRnyHmCtHkhwyArqu2OQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, 2025-11-14 at 14:34 +0100, Thomas Zimmermann wrote:
> Hi,
>=20
> sorry for being late with the review.
>=20
> Am 10.11.25 um 17:03 schrieb Ruben Wauters:
> > As part of the cleanup of gud_probe(), this patch splits off format ini=
t
> > code from gud_probe into it's own function. This makes the code more
> > compartmentalised and easier to follow, and makes gud_probe() smaller
> > and also easier to read.
> >=20
> > Signed-off-by: Ruben Wauters <rubenru09@aol.com>
> > ---
> >   drivers/gpu/drm/gud/gud_drv.c | 167 +++++++++++++++++++--------------=
-
> >   1 file changed, 93 insertions(+), 74 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/gud/gud_drv.c b/drivers/gpu/drm/gud/gud_dr=
v.c
> > index 42135a48d92e..22524601d463 100644
> > --- a/drivers/gpu/drm/gud/gud_drv.c
> > +++ b/drivers/gpu/drm/gud/gud_drv.c
> > @@ -427,84 +427,18 @@ static void gud_free_buffers_and_mutex(void *data=
)
> >   	mutex_destroy(&gdrm->ctrl_lock);
> >   }
> >  =20
> > -static int gud_probe(struct usb_interface *intf, const struct usb_devi=
ce_id *id)
> > +static int gud_get_formats(struct gud_device *gdrm, struct device *usb=
_device, u32 *formats,
> > +			   size_t *max_buffer_size, unsigned int *num_formats_ret)
>=20
> Please don't pass the usb device here. You can get the device from=20
> gdrm->drm.dev.
>=20
> >   {
> >   	const struct drm_format_info *xrgb8888_emulation_format =3D NULL;
> >   	bool rgb565_supported =3D false, xrgb8888_supported =3D false;
> >   	unsigned int num_formats_dev, num_formats =3D 0;
> > -	struct usb_endpoint_descriptor *bulk_out;
> > -	struct gud_display_descriptor_req desc;
> > -	struct device *dev =3D &intf->dev;
> > -	size_t max_buffer_size =3D 0;
> > -	struct gud_device *gdrm;
> > -	struct drm_device *drm;
> > -	struct device *dma_dev;
> >   	u8 *formats_dev;
> > -	u32 *formats;
> > +	struct drm_device *drm =3D &gdrm->drm;
> >   	int ret, i;
> >  =20
> > -	ret =3D usb_find_bulk_out_endpoint(intf->cur_altsetting, &bulk_out);
> > -	if (ret)
> > -		return ret;
> > -
> > -	ret =3D gud_get_display_descriptor(intf, &desc);
> > -	if (ret) {
> > -		DRM_DEV_DEBUG_DRIVER(dev, "Not a display interface: ret=3D%d\n", ret=
);
> > -		return -ENODEV;
> > -	}
> > -
> > -	if (desc.version > 1) {
> > -		dev_err(dev, "Protocol version %u is not supported\n", desc.version)=
;
> > -		return -ENODEV;
> > -	}
> > -
> > -	gdrm =3D devm_drm_dev_alloc(dev, &gud_drm_driver, struct gud_device, =
drm);
> > -	if (IS_ERR(gdrm))
> > -		return PTR_ERR(gdrm);
> > -
> > -	drm =3D &gdrm->drm;
> > -
> > -	gdrm->flags =3D le32_to_cpu(desc.flags);
> > -	gdrm->compression =3D desc.compression & GUD_COMPRESSION_LZ4;
> > -
> > -	if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE && gdrm->compression)
> > -		return -EINVAL;
> > -
> > -	mutex_init(&gdrm->ctrl_lock);
> > -	mutex_init(&gdrm->damage_lock);
> > -	INIT_WORK(&gdrm->work, gud_flush_work);
> > -	gud_clear_damage(gdrm);
> > -
> > -	ret =3D devm_add_action(dev, gud_free_buffers_and_mutex, gdrm);
> > -	if (ret)
> > -		return ret;
> > -
> > -	usb_set_intfdata(intf, gdrm);
> > -
> > -	dma_dev =3D usb_intf_get_dma_device(intf);
> > -	if (dma_dev) {
> > -		drm_dev_set_dma_dev(drm, dma_dev);
> > -		put_device(dma_dev);
> > -	} else {
> > -		dev_warn(dev, "buffer sharing not supported"); /* not an error */
> > -	}
> > -
> > -	/* Mode config init */
> > -	ret =3D drmm_mode_config_init(drm);
> > -	if (ret)
> > -		return ret;
> > -
> > -	drm->mode_config.min_width =3D le32_to_cpu(desc.min_width);
> > -	drm->mode_config.max_width =3D le32_to_cpu(desc.max_width);
> > -	drm->mode_config.min_height =3D le32_to_cpu(desc.min_height);
> > -	drm->mode_config.max_height =3D le32_to_cpu(desc.max_height);
> > -	drm->mode_config.funcs =3D &gud_mode_config_funcs;
> > -
> > -	/* Format init */
> > -	formats_dev =3D devm_kmalloc(dev, GUD_FORMATS_MAX_NUM, GFP_KERNEL);
> > -	/* Add room for emulated XRGB8888 */
> > -	formats =3D devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*=
formats), GFP_KERNEL);
> > -	if (!formats_dev || !formats)
> > +	formats_dev =3D devm_kmalloc(usb_device, GUD_FORMATS_MAX_NUM, GFP_KER=
NEL);
> > +	if (!formats_dev)
> >   		return -ENOMEM;
> >  =20
> >   	ret =3D gud_usb_get(gdrm, GUD_REQ_GET_FORMATS, 0, formats_dev, GUD_F=
ORMATS_MAX_NUM);
> > @@ -555,7 +489,7 @@ static int gud_probe(struct usb_interface *intf, co=
nst struct usb_device_id *id)
> >  =20
> >   		fmt_buf_size =3D drm_format_info_min_pitch(info, 0, drm->mode_confi=
g.max_width) *
> >   			       drm->mode_config.max_height;
> > -		max_buffer_size =3D max(max_buffer_size, fmt_buf_size);
> > +		*max_buffer_size =3D max(*max_buffer_size, fmt_buf_size);
>=20
> Rather do this in a separate helper, where you pass in the array of=20
> supported formats and it computes max_buffer_size. This way you don't=20
> need an output parameter for max_buffer_size.

Doing it that way doesn't take into account GUD_DRM_FORMAT_R1 and
GUD_DRM_FORMAT_XRGB1111, since they are not passed into the final
formats array. I'm not sure it really matters though? I need to dig a
bit more into the use of it. Currently they are taken into account in
the max_buffer_size but I'm not 100% sure they actually need to be. If
it's not an issue I can move the computation into another function
quite easily.

Ruben

> >  =20
> >   		if (format =3D=3D GUD_DRM_FORMAT_R1 || format =3D=3D GUD_DRM_FORMAT=
_XRGB1111)
> >   			continue; /* Internal not for userspace */
> > @@ -564,7 +498,7 @@ static int gud_probe(struct usb_interface *intf, co=
nst struct usb_device_id *id)
> >   	}
> >  =20
> >   	if (!num_formats && !xrgb8888_emulation_format) {
> > -		dev_err(dev, "No supported pixel formats found\n");
> > +		dev_err(usb_device, "No supported pixel formats found\n");
> >   		return -EINVAL;
> >   	}
> >  =20
> > @@ -577,6 +511,92 @@ static int gud_probe(struct usb_interface *intf, c=
onst struct usb_device_id *id)
> >   		formats[num_formats++] =3D DRM_FORMAT_XRGB8888;
> >   	}
> >  =20
> > +	devm_kfree(usb_device, formats_dev);
> > +	*num_formats_ret =3D num_formats;
> > +
> > +	return 0;
>=20
> Instead of 0, you can return num_formats on success.=C2=A0 Together with =
the=20
> change to max_buffer_size, no output parameters will be required.
>=20
> Best regards
> Thomas
>=20
> > +}
> > +
> > +static int gud_probe(struct usb_interface *intf, const struct usb_devi=
ce_id *id)
> > +{
> > +	unsigned int num_formats =3D 0;
> > +	struct usb_endpoint_descriptor *bulk_out;
> > +	struct gud_display_descriptor_req desc;
> > +	struct device *dev =3D &intf->dev;
> > +	size_t max_buffer_size =3D 0;
> > +	struct gud_device *gdrm;
> > +	struct drm_device *drm;
> > +	struct device *dma_dev;
> > +	u32 *formats;
> > +	int ret;
> > +
> > +	ret =3D usb_find_bulk_out_endpoint(intf->cur_altsetting, &bulk_out);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D gud_get_display_descriptor(intf, &desc);
> > +	if (ret) {
> > +		DRM_DEV_DEBUG_DRIVER(dev, "Not a display interface: ret=3D%d\n", ret=
);
> > +		return -ENODEV;
> > +	}
> > +
> > +	if (desc.version > 1) {
> > +		dev_err(dev, "Protocol version %u is not supported\n", desc.version)=
;
> > +		return -ENODEV;
> > +	}
> > +
> > +	gdrm =3D devm_drm_dev_alloc(dev, &gud_drm_driver, struct gud_device, =
drm);
> > +	if (IS_ERR(gdrm))
> > +		return PTR_ERR(gdrm);
> > +
> > +	drm =3D &gdrm->drm;
> > +
> > +	gdrm->flags =3D le32_to_cpu(desc.flags);
> > +	gdrm->compression =3D desc.compression & GUD_COMPRESSION_LZ4;
> > +
> > +	if (gdrm->flags & GUD_DISPLAY_FLAG_FULL_UPDATE && gdrm->compression)
> > +		return -EINVAL;
> > +
> > +	mutex_init(&gdrm->ctrl_lock);
> > +	mutex_init(&gdrm->damage_lock);
> > +	INIT_WORK(&gdrm->work, gud_flush_work);
> > +	gud_clear_damage(gdrm);
> > +
> > +	ret =3D devm_add_action(dev, gud_free_buffers_and_mutex, gdrm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	usb_set_intfdata(intf, gdrm);
> > +
> > +	dma_dev =3D usb_intf_get_dma_device(intf);
> > +	if (dma_dev) {
> > +		drm_dev_set_dma_dev(drm, dma_dev);
> > +		put_device(dma_dev);
> > +	} else {
> > +		dev_warn(dev, "buffer sharing not supported"); /* not an error */
> > +	}
> > +
> > +	/* Mode config init */
> > +	ret =3D drmm_mode_config_init(drm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	drm->mode_config.min_width =3D le32_to_cpu(desc.min_width);
> > +	drm->mode_config.max_width =3D le32_to_cpu(desc.max_width);
> > +	drm->mode_config.min_height =3D le32_to_cpu(desc.min_height);
> > +	drm->mode_config.max_height =3D le32_to_cpu(desc.max_height);
> > +	drm->mode_config.funcs =3D &gud_mode_config_funcs;
> > +
> > +	/* Format init */
> > +	/* Add room for emulated XRGB8888 */
> > +	formats =3D devm_kmalloc_array(dev, GUD_FORMATS_MAX_NUM + 1, sizeof(*=
formats), GFP_KERNEL);
> > +	if (!formats)
> > +		return -ENOMEM;
> > +
> > +	ret =3D gud_get_formats(gdrm, dev, formats, &max_buffer_size, &num_fo=
rmats);
> > +	if (ret)
> > +		return ret;
> > +
> >   	if (desc.max_buffer_size)
> >   		max_buffer_size =3D le32_to_cpu(desc.max_buffer_size);
> >   	/* Prevent a misbehaving device from allocating loads of RAM. 4096x4=
096@XRGB8888 =3D 64 MB */
> > @@ -641,7 +661,6 @@ static int gud_probe(struct usb_interface *intf, co=
nst struct usb_device_id *id)
> >   		return ret;
> >  =20
> >   	devm_kfree(dev, formats);
> > -	devm_kfree(dev, formats_dev);
> >  =20
> >   	drm_client_setup(drm, NULL);
> >  =20

--=-TRnyHmCtHkhwyArqu2OQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE3obNNdPQ9V5CQi2Y0n5QwFCuDOEFAmkXa/sACgkQ0n5QwFCu
DOFrUBAAg54Q/DflHjoK7LLgfstFTJwB6j11PLeYsMRgH0IJnkiJ9wSqFVVydcYj
uuzCPRJfhG9P4nPWR4KemkLFVQGMfaKZFMczoej0k+yVlZDMTQbtaMUbQ1R8zbjQ
sKYj4A4TgKOi0mlLSH0lVIygn1AiIQyhmtYjIxFlbBEREZV8VnX6N547qyZHrC8s
2nUvkWMLUwcwxNoLZC0r4i5C+UWDMCo37izQDPLIi16U3S5RvwCq+IdzQ0n3JDOd
kpvHnlbSKLLdpz6IwU9zpteZp42VXt3yFwg11Q5DpHDPaAiiC35nV8974M8WYwyp
Ns2dUtq8QMi5pz+FK7EzURdCEcqzpZ03J6F/sEwNdu/PV2jPijFYyYRqwwnqk//8
Qo0rpPbTpkmYuxZvAdizuDb9o4nStYCO6mvYuBwdlNbd+lulxjJx/eznL9LOKdkL
6gc+GuLtrI+wWaLgyrfbgYcAJItpB3BL1TKbG7vxJoSRMlwqkjSZNmr33DdZZTyp
CmpKZUelVSnn94TkqvfFmK10SZT7zKrX/z+BBvXIwrQGodGjNyMIJ4xbqkoR2sGr
0JAkDB/YoTYxyZKh2YsMFEydspV4d9r3uqeHNKzVVsAh2xwMwNXBFZPWvgz+cGo0
iF15ThRyFnKmHT6zZz4IjGPUFO09I6kkes76ZGfQSm6oZJwKbZQ=
=Pyhb
-----END PGP SIGNATURE-----

--=-TRnyHmCtHkhwyArqu2OQ--
