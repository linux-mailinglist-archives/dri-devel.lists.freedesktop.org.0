Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EC28A5846
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 18:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C81DD11270E;
	Mon, 15 Apr 2024 16:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hiL5bdQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDF711270D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713200092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ATqF4+ZPc++wrJiA0vtxutK6l5sK52pyNVpcopG82Mw=;
 b=hiL5bdQpM6dKZuPjLxwTVcU80Z0GY1hNip5NRQGJW7j9uuULD0RWtixPco1qj6GkocyAxw
 vJCxbSU+lFTjLtPkBeaBFLw8IVnH/ly7OLGeASeMvvHuEE3CZY6J+r+lLhaKz8+Q1j5P+h
 Fp23aAGYRaAkZHD8U8GCqTeRS5q9Ipw=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-288-26afK--4Oe2SwXKc3bOW8g-1; Mon, 15 Apr 2024 12:54:50 -0400
X-MC-Unique: 26afK--4Oe2SwXKc3bOW8g-1
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-7e7af7c25a9so1334061241.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 09:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713200088; x=1713804888;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :autocrypt:references:in-reply-to:date:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k/vLKJOkld5zVDI7e42itTb29p4LGVo+TK4tWTmTVOk=;
 b=Y9+ySzpAvkLdLoFzmX3QalK7cTfTiotcbrJPmEiyQ9KlpLAaqNnQAGWVqfebrkrOu5
 gYOGAJ4VOSgWIrQTDhhoRJ5hWcbP/w/pbJ9fNh5aUGdUBv1ek9LHXEYXhX0z+APrQivn
 KCsRKMDuO2Uih8VR7oGu9lAJDInWXwE8fbsUOqEdXjkEsffs9o4ka2DO/PAEuJMKDzzF
 QYX8/8oh/634u3mNczXsGksmsmHL1hy8eAEXMMfnRCngG7Ux/utN2KXrIyZMfdQkWsYy
 ouK9USkAo8PvPsuKMzrr5mG9/BR0Gw1FbvWYA9YEj2bxLosL252m06/98QXZDYqa1VfQ
 qvLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHOJjnfOQxn9acaxKZGfOBvVyBdehaRmNYTZYMcEGF72m0b/ddOyIOmgWz7OCoyVRXaKaeFJl5b3waki0zYmZ0QOCJ+fDA5a7Kf5hPZcrT
X-Gm-Message-State: AOJu0YztPtzhSF3sEXZzeVrsJIqT/PBtsurnoC9aG8sRfB4jgGAUCUC4
 iXLE+aWWPFpriPnQSa4CgNqFliCNkCPFsbltpM1LURwZF/uEWQhMH1x5W+GzW/8XdADDUBYeaU/
 NzqJVw5Td6prTu9QDfadzh6KmQd4BT1XxcGuG7b8GDdk1y55nJgrV15SdFx0y39r3yA==
X-Received: by 2002:a05:6102:2ad4:b0:47b:9025:6304 with SMTP id
 eh20-20020a0561022ad400b0047b90256304mr1187270vsb.11.1713200088020; 
 Mon, 15 Apr 2024 09:54:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVsx4068jwfrSa0qp5AQSQxP1kjur6o03GZZIRyGzq+rXKeYIrrS3j/Xv1G7FvFgDXHWIUjQ==
X-Received: by 2002:a05:6102:2ad4:b0:47b:9025:6304 with SMTP id
 eh20-20020a0561022ad400b0047b90256304mr1187249vsb.11.1713200087622; 
 Mon, 15 Apr 2024 09:54:47 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::789? ([2600:4040:5c6c:a300::789])
 by smtp.gmail.com with ESMTPSA id
 i20-20020a0cf394000000b00698fa74199fsm6389932qvk.1.2024.04.15.09.54.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 09:54:47 -0700 (PDT)
Message-ID: <c25eef55a661cc87e4dc70b672e6a205d4b5a490.camel@redhat.com>
Subject: Re: [PATCH v2 1/2] drm/nouveau/disp: add backlight for ada lovelace
From: Lyude Paul <lyude@redhat.com>
To: Angelo Dureghello <angelo@kernel-space.org>, 
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 kherbst@redhat.com, dakr@redhat.com
Date: Mon, 15 Apr 2024 12:54:46 -0400
In-Reply-To: <20240412194901.1596-1-angelo@kernel-space.org>
References: <20240412194901.1596-1-angelo@kernel-space.org>
Autocrypt: addr=lyude@redhat.com; prefer-encrypt=mutual;
 keydata=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
Organization: Red Hat Inc.
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hm. Could you share some logs with drm.debug=3D0x116? I'm a bit confused
because I would have thought that we were already probing for eDP
backlights seeing as I added support for them at one point?

(I hope this isn't the point I learn I actually forgot to add support
for them :P)


On Fri, 2024-04-12 at 21:49 +0200, Angelo Dureghello wrote:
> Add working backlight for "ada lovelace" missing case.
>=20
> The nvif method is actually not working for this chipset so
> used the drm apis. Also, by dpcd, drm layer is calculating a
> max brightness of 255, but to get a real correct max brightnes
> the maximum must be multiplied by a factor of 16.
>=20
> Tested to work properly in Legion Lenovo Pro 5
>=20
> Lenovo Legion 5 Pro 16ARX8
> Bios ver LPCN49WW
> =09 LPEC49WW
> SN PF4T63AZ
> Nvidia RTX4060 MaxQ/Mobile rev a1 (ADA LOVELACE AD107M)
> AMD Ryzen 9 7945HX + Radeon
>=20
> and wayland.
>=20
> ---
> Changes for v2:
> - add some comments
> - remove x16 multiplication (hack)
> - remove forgot debug printk
>=20
> Signed-off-by: Angelo Dureghello <angelo@kernel-space.org>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_backlight.c | 54
> +++++++++++++++++++++
> =C2=A01 file changed, 54 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> index d47442125fa1..7b7306d18ad7 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> @@ -286,6 +286,56 @@ nv50_backlight_init(struct nouveau_backlight
> *bl,
> =C2=A0=09return 0;
> =C2=A0}
> =C2=A0
> +static int
> +nv19x_backlight_init(struct nouveau_backlight *bl,
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_connector *nv_conn,
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct nouveau_encoder *nv_encoder,
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0 struct backlight_properties *props,
> +=09=09=C2=A0=C2=A0=C2=A0=C2=A0 const struct backlight_ops **ops)
> +{
> +=09int ret;
> +=09u16 current_level;
> +=09u8 edp_dpcd[EDP_DISPLAY_CTL_CAP_SIZE];
> +=09u8 current_mode;
> +=09struct nouveau_drm *drm =3D nouveau_drm(nv_encoder-
> >base.base.dev);
> +
> +=09/*
> +=09 * nvif functions, so also nvif_outp_bl_get, are not working
> with this
> +=09 * connector (return -22), using only drm layer.
> +=09 */
> +=09if (nv_conn->type =3D=3D DCB_CONNECTOR_eDP) {
> +
> +=09=09ret =3D drm_dp_dpcd_read(&nv_conn->aux,
> DP_EDP_DPCD_REV, edp_dpcd,
> +=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 EDP_DISPLAY_CTL_CAP_SIZ=
E);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +=09=09if (!drm_edp_backlight_supported(edp_dpcd))
> +=09=09=09return -ENODEV;
> +
> +=09=09ret =3D drm_edp_backlight_init(&nv_conn->aux, &bl-
> >edp_info, 0, edp_dpcd,
> +=09=09=09=09=09 &current_level,
> &current_mode);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +
> +=09=09ret =3D drm_edp_backlight_enable(&nv_conn->aux, &bl-
> >edp_info, current_level);
> +=09=09if (ret < 0) {
> +=09=09=09NV_ERROR(drm, "Failed to enable backlight on
> %s: %d\n",
> +=09=09=09=09 nv_conn->base.name, ret);
> +=09=09=09return ret;
> +=09=09}
> +
> +=09=09*ops =3D &nv50_edp_bl_ops;
> +
> +=09=09props->max_brightness =3D bl->edp_info.max;
> +=09=09props->brightness =3D current_level;
> +=09=09bl->uses_dpcd =3D true;
> +
> +=09=09return 0;
> +=09}
> +
> +=09return -ENODEV;
> +}
> +
> =C2=A0int
> =C2=A0nouveau_backlight_init(struct drm_connector *connector)
> =C2=A0{
> @@ -332,6 +382,10 @@ nouveau_backlight_init(struct drm_connector
> *connector)
> =C2=A0=09=09ret =3D nv50_backlight_init(bl,
> nouveau_connector(connector),
> =C2=A0=09=09=09=09=09=C2=A0 nv_encoder, &props, &ops);
> =C2=A0=09=09break;
> +=09case NV_DEVICE_INFO_V0_ADA:
> +=09=09ret =3D nv19x_backlight_init(bl,
> nouveau_connector(connector),
> +=09=09=09=09=09=C2=A0=C2=A0 nv_encoder, &props,
> &ops);
> +=09=09break;
> =C2=A0=09default:
> =C2=A0=09=09ret =3D 0;
> =C2=A0=09=09goto fail_alloc;

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

