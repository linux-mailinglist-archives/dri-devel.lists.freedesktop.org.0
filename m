Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4511D73F786
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 10:38:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65B8810E2BD;
	Tue, 27 Jun 2023 08:38:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9569910E2B6
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 08:38:18 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b6a5fd1f46so22512181fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 01:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687855097; x=1690447097;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=h5pLUlrSbur2w9cXXsoB5ssGpdFavK5/Oqf0hyKn7J4=;
 b=SCAeSs1a0NEUnGd/4lKo8KDwMTVFxC4AvDEZt/eWv0qUyMCX5x3hAbH9KfteXz5JDJ
 AEgKT8lIJn8o4clRTQaqQE7YS8c3CWOIlB6KgUBwd9GQFzCW4EbaPqs3LwMjFgMTuPYR
 inIIr3Hn0mOXzdgMxWbYioXzTp9ZdzGxWwpPVb21XfxxmVIUd4nayAD5kI1Zvf1xs14T
 H03JYjfEr/J5GF0NFk8glMkmIygoYe+DCc9RnHZhQ3eE0ROSGtJQzHy/VOEul7exgUkS
 uO2inO0aS2XkqT6Zflbirz8EqJVQdllCh1PGCP/4r6TgLB9YtrsTtowVcYwvqJSYfyAJ
 5DXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687855097; x=1690447097;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h5pLUlrSbur2w9cXXsoB5ssGpdFavK5/Oqf0hyKn7J4=;
 b=N1YogpMoeVLhcNh6cljZALsW0gx5DluEzmqpY1/a/mnsdiJPudYHrErZemw6ZCtUJh
 NUrofXOV7+VwTbvqJgg9j0sgMGKq8ZeE6I6EtQEEY/O9YiwsxHn1dHQbc7pj+++4SoIQ
 gcheMM/pBR7Y8ThgbFDdgdlcB4qjnQWGc/ZrVioYNSgkx13vatAOXCwNb3kmTBa8CVOI
 laEDbPt1GnTwuKvpf4icAtqA+a5JzX7HwPWBMCUOpqkmJhDZ0EKg4rzvRiNNIaaC14YQ
 SeOdKesd3MycV5cNUoqr08T9maVfrtZWbeH7gzrIHpJYFZnwSs63Ul5zCG7cWRb441Tt
 iXnQ==
X-Gm-Message-State: AC+VfDzcNvwRWcYGqO3s7G06FBic6AYPZgbhB3mMsoHhlh+LLcY6vgWu
 lXzgE6qK7IU0RMmsKPyKH8I=
X-Google-Smtp-Source: ACHHUZ5Vp1yxnw69NuaiBadmSi89T6Nyr0uisyCYmXfyh0FaWWvTBxCQ5r+675Gcelf/Yr2jM86DXQ==
X-Received: by 2002:a2e:9105:0:b0:2b6:aecb:77f6 with SMTP id
 m5-20020a2e9105000000b002b6aecb77f6mr1304970ljg.42.1687855096315; 
 Tue, 27 Jun 2023 01:38:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y17-20020a2e9d51000000b002b6a60bd128sm640988ljj.70.2023.06.27.01.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jun 2023 01:38:15 -0700 (PDT)
Date: Tue, 27 Jun 2023 11:38:12 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zack@kde.org>
Subject: Re: [PATCH v3 8/8] drm: Introduce
 DRM_CLIENT_CAP_VIRTUALIZED_CURSOR_PLANE
Message-ID: <20230627113812.15d620c4@eldfell>
In-Reply-To: <20230627035839.496399-9-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
 <20230627035839.496399-9-zack@kde.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Jv3.o2NF9vV/QTAJbKQWDaJ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, banackm@vmware.com, javierm@redhat.com,
 krastevm@vmware.com, dri-devel@lists.freedesktop.org, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Jv3.o2NF9vV/QTAJbKQWDaJ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Jun 2023 23:58:39 -0400
Zack Rusin <zack@kde.org> wrote:

> From: Zack Rusin <zackr@vmware.com>
>=20
> Virtualized drivers place additional restrictions on the cursor plane
> which breaks the contract of universal planes. To allow atomic
> modesettings with virtualized drivers the clients need to advertise
> that they're capable of dealing with those extra restrictions.
>=20
> To do that introduce DRM_CLIENT_CAP_VIRTUALIZED_CURSOR_PLANE which
> lets DRM know that the client is aware of and capable of dealing with
> the extra restrictions on the virtual cursor plane.
>=20
> Setting this option to true makes DRM expose the cursor plane on
> virtualized drivers. The userspace is expected to set the hotspots
> and handle mouse events on that plane.
>=20
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_ioctl.c |  9 +++++++++
>  include/uapi/drm/drm.h      | 26 ++++++++++++++++++++++++++
>  2 files changed, 35 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 8e9afe7af19c..6fd17ff14656 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -361,6 +361,15 @@ drm_setclientcap(struct drm_device *dev, void *data,=
 struct drm_file *file_priv)
>  			return -EINVAL;
>  		file_priv->writeback_connectors =3D req->value;
>  		break;
> +	case DRM_CLIENT_CAP_VIRTUALIZED_CURSOR_PLANE:
> +		if (!drm_core_check_feature(dev, DRIVER_CURSOR_HOTSPOT))
> +			return -EOPNOTSUPP;
> +		if (!file_priv->atomic)
> +			return -EINVAL;
> +		if (req->value > 1)
> +			return -EINVAL;
> +		file_priv->supports_virtualized_cursor_plane =3D req->value;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index a87bbbbca2d4..057ef2a16d31 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -836,6 +836,32 @@ struct drm_get_cap {
>   */
>  #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
> =20
> +/**
> + * DRM_CLIENT_CAP_VIRTUALIZED_CURSOR_PLANE
> + *
> + * Drivers for para-virtualized hardware (e.g. vmwgfx, qxl, virtio and
> + * virtualbox) have additional restrictions for cursor planes (thus
> + * making cursor planes on those drivers not truly universal,) e.g.
> + * they need cursor planes to act like one would expect from a mouse
> + * cursor and have correctly set hotspot properties.
> + * If this client cap is not set the DRM core will hide cursor plane on
> + * those virtualized drivers because not setting it implies that the
> + * client is not capable of dealing with those extra restictions.
> + * Clients which do set cursor hotspot and treat the cursor plane
> + * like a mouse cursor should set this property.
> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> + *
> + * Setting this property on drivers which do not special case
> + * cursor planes (i.e. non-virtualized drivers) will return
> + * EOPNOTSUPP, which can be used by userspace to gauge
> + * requirements of the hardware/drivers they're running on.
> + *
> + * This capability is always supported for atomic-capable virtualized
> + * drivers starting from kernel version 6.5.
> + */
> +#define DRM_CLIENT_CAP_VIRTUALIZED_CURSOR_PLANE	6

All this sounds really good!

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

The only nitpick I can come up with is maybe naming it to
DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT to distil the essence of the
semantics in the name. I find the word "virtualized" having too many
possible meanings in this context. In any case, the doc makes it very
clear what this is.

I think this feature does not need to be limited to virtualized
drivers. If your display hardware system implements gaze tracking, it
could show a hardware assisted gaze cursor with this.


Thanks,
pq

> +
> +
>  /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>  struct drm_set_client_cap {
>  	__u64 capability;


--Sig_/Jv3.o2NF9vV/QTAJbKQWDaJ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmSan/QACgkQI1/ltBGq
qqcVqw/9FPaUyrPJIWpXaVM/sJNrGt6nvoT4Cl3s+yAlveVbuyaBj/5LdRInegQf
Rtfeel9Rm39bfU0fQlElvXMT9k6L0N+uJFS+SHAFOdP9gUMsAJiiLca7oixaelqR
aGJUu4HZYhmk0WK+NUsYZ1imdCHg03nQuOIn9yb0fyjJ1CQlNhLiiMH7zMDNhczw
aONk7CuwPWRjREHx9rBWbuHv/HSVpc70IQYgfCDo4iCeEFdOz7yX4Ow4YLKRuNYH
PPn0pPP/wCN9l9Pml/Tri9pJnrXbRcN0xg4ShnSk+CXCf1HxlKa7Q91EAvomFylS
IQlJoj9M07L5BhflDq3NzhNrtnbbQ147NJtid4KjGo1to+819vvI76EvG7BLKG9L
FIoJtmjkzyJSjsMgHdhaqotGHVOWoZM7up/L3T8LiJF2Xk64vXF4nbO66d37NFMB
kVdUBHe0PU2ccNy3EGgUSbXiwqaShDIYw/Go9KwJH09+2H/BI86uKbDHVIb46W29
YLy2zR4Jm0gEtGDOKT8ElAvYt2dJILp5OzPP2hDXZ/XGunUGuCAysEVbw6mBmU4p
TepxNnTnvzdJY/GDgcSeGjruDfVrOwtpzSSLaKx1mrAoYGX0TzbtW+CBdS7grkxD
+SuwjVMhtYHHYZaxeCUY4GNozYljhiab2OuX2qrzq4EQ0X2u3kw=
=0bIV
-----END PGP SIGNATURE-----

--Sig_/Jv3.o2NF9vV/QTAJbKQWDaJ--
