Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CF6B5713C6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 10:01:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5092991E8C;
	Tue, 12 Jul 2022 08:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD57291E8C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 08:01:13 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id bx13so8976309ljb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 01:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=qKAFIxWY8pxlAsZxkb9W9634abolwgXIpO3uqwQDI2c=;
 b=WQi9P4W3sG5l4P84OpN7tBLs6WEOxqOfLtXCQaU+6F7Lc6dbB4LbfaHBYiFoclm/3u
 uaSOeNYBwb46BVPYFP0YqK7DMp2vrF0/oxtk2VhKRgHui5sYdoRSJr/3dzGEZeFHyF4J
 v/UMlOxxosyQY384tD02oq5qUpSUWOTdHFz1SDaAseD+AGM76RUrLRmJpX88clkXLOEh
 bxS1Fm7oPPxVos9Hk7TlmZ8C/WEEIQXYDyUhu7j5D5t9V0NRU6xeRkuwMEemFV4Rz5qI
 T/qjm/WGodr5+eajRE6YeC5QIQn91Db2K+2V8J26m8RnfarHXPDOnQWQx/wwPEVN9HfR
 LB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=qKAFIxWY8pxlAsZxkb9W9634abolwgXIpO3uqwQDI2c=;
 b=1Bed7q8eEX06WxfCkvVEEdeoqle056fuvDXtv6fRoHvSLnz3pwfo38CFaCXSOPBt7t
 b0MIzouayNmffC2Z+VI6BZ2KH/6FKOaA54x+6b8TP8iejFDe7eMHutljxdN9J0w6/B77
 ffRfYMjoB8c+g837MqdWsA3lI1rxUfPGqmozG5gysM9uDSgfSrcjhm92ffFi8sAzsk7N
 dsT1KrhBIFQIGtZyq+o8OfXUkPfwkCLfNEkSElGE+iyKTNXtfWFXTjxak8CL7b90Aozk
 2SFYj3fTIXxzKUDdvichOT6e7P5PKxSDdoRf4m+wXgXkgveVqKsfFsr6rta6q5/Fv4YS
 zt5g==
X-Gm-Message-State: AJIora+U1UpdDpL13ADz2G3SkhZ71St0NkXGkVhLvuxeyHQi2ygc3VKe
 X0X0Wf+X8ZWhgnaU2OLqk+Q=
X-Google-Smtp-Source: AGRyM1vfxyzzBaiXKpBkMyErc4uUFK3aoDVOu1cUySpkBXj472uwAeFjhsmYpDY5fsJlgFHrp+xDPA==
X-Received: by 2002:a05:651c:198d:b0:25b:c829:8b4d with SMTP id
 bx13-20020a05651c198d00b0025bc8298b4dmr11796642ljb.309.1657612871877; 
 Tue, 12 Jul 2022 01:01:11 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 a4-20020a056512390400b00489c8110197sm2038104lfu.242.2022.07.12.01.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 01:01:11 -0700 (PDT)
Date: Tue, 12 Jul 2022 11:01:08 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zack@kde.org>
Subject: Re: [PATCH v2 8/8] drm: Introduce
 DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE
Message-ID: <20220712110108.71600d21@eldfell>
In-Reply-To: <20220712033246.1148476-9-zack@kde.org>
References: <20220712033246.1148476-1-zack@kde.org>
 <20220712033246.1148476-9-zack@kde.org>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/XxM8gLUmUF5QCuI9X97QfeO";
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>,
 mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/XxM8gLUmUF5QCuI9X97QfeO
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 11 Jul 2022 23:32:46 -0400
Zack Rusin <zack@kde.org> wrote:

> From: Zack Rusin <zackr@vmware.com>
>=20
> Virtualized drivers place additional restrictions on the cursor plane
> which breaks the contract of universal planes. To allow atomic
> modesettings with virtualized drivers the clients need to advertise
> that they're capable of dealing with those extra restrictions.
>=20
> To do that introduce DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE which
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
>  include/uapi/drm/drm.h      | 17 +++++++++++++++++
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 8faad23dc1d8..f10590b061d7 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -362,6 +362,15 @@ drm_setclientcap(struct drm_device *dev, void *data,=
 struct drm_file *file_priv)
>  			return -EINVAL;
>  		file_priv->writeback_connectors =3D req->value;
>  		break;
> +	case DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE:
> +		if (!drm_core_check_feature(dev, DRIVER_VIRTUAL))
> +			return -EOPNOTSUPP;

Ah!

Is userspace expected to use this EOPNOTSUPP error to tell virtual
cursor planes apart from generic hardware planes that were just tagged
as cursor?

I am thinking about how an atomic KMS client can do both:
- use generic cursor plane for generic content, and
- use a virtual cursor plane correctly

One possibility here is for the atomic KMS client:
- try to set DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE
  - if it succeeds, all cursor planes it can see are virtual
  - if it fails, all cursor planes it can see are generic

That sounds good to me, because I don't think the same DRM device would
want to expose both kinds of cursor planes.

However, this should be added in the DRM documentation facing userspace.

> +		if (!file_priv->atomic)
> +			return -EINVAL;
> +		if (req->value > 1)
> +			return -EINVAL;
> +		file_priv->supports_virtual_cursor_plane =3D req->value;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 642808520d92..f24a1941abca 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -836,6 +836,23 @@ struct drm_get_cap {
>   */
>  #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
> =20
> +/**
> + * DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE
> + *
> + * If set to 1, the DRM core will expose cursor plane to be used for
> + * virtualized mouse cursor, without virtualized drivers will not expose
> + * the cursor plane in atomic contexts. Cursor planes in virtualized

I would suggest some re-wording here, because at first I read this like:
Without virtualized drivers, setting this cap will hide all cursor
planes from userspace.

It's also a bit unclear on what happens when userspace sets this cap on
a non-virtual driver. From the code I see that it will fail, but that
might be a surprise to userspace developers. I suppose explaining the
virtual vs. generic cursor plane detection will address this.

> + * drivers come with some additional restrictions and are not truly
> + * universal, e.g. they need to act like one would expect from a mouse
> + * cursor and have correctly set hotspot properties.
> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> + *
> + * This capability is always supported for atomic-capable virtualized dr=
ivers
> + * starting from kernel version 5.21.
> + */
> +#define DRM_CLIENT_CAP_SUPPORTS_VIRTUAL_CURSOR_PLANE	6
> +
> +
>  /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>  struct drm_set_client_cap {
>  	__u64 capability;

Thanks,
pq

--Sig_/XxM8gLUmUF5QCuI9X97QfeO
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmLNKkQACgkQI1/ltBGq
qqf5Lg//c/HpTnRebW1zDU7edWCBDnMKrY0DtLF/xrhDsYFbghICZrH54Ijo7Pbh
JpNEl4o3FZTN0HUw6L/BrZJkKAwZmDOCXAIRvSCM4QLQC0OD7Alr0CQDNrBxbpjP
S4xyS06V4KvPjSpYm1xgwhKc5Oj/6EoyMk63pnyjxgOIiNHV1fMYCZgmOgjuWWwF
Xbre4mUmdDxpeqmdJnwqVu3pV5aTt+7qLgdZyFDksL15Ptl3/ZQDRf/Y/psUf2dC
oEZuIJT8LwLl8Wtoi3AA38zk2/zOSQbmtTOV9iuIzTPVv+fRg4OZKnWqXimjkoSF
uoLhfXOy8VPteopdLD43NmfsGeWNRTfRVP/HXA8egtyawQXNXRt9MtZhIsZEY1yC
z77a+utAvLgqMmNQGk8ULjm5gw/44d7+5UlDJEreOK5xRCmdswKxYrvGlVRAaKvC
+xYPM1tWAQ5D04AhcttD4Lc70qPcEX0I/pI7pR1pAHIdtMjPORVws/HDRm1gRF0H
Pe8P4H6isEUDhCdtAAaqLQRHbI6m4cmLRTgdMGxVzPkY3o8Wh5vw8rNhSxMVhtbJ
er1iODSAHVZMQ8v4fuEPstQdrN593e/dN4y4ZKbjmX1R4pYQmQa7DJJ8CTNdyPjt
uxyKPE+7bmwf7ucltJFFZU24BiZQ+95Abx4xDTXqqPN7fr0bExw=
=2zIS
-----END PGP SIGNATURE-----

--Sig_/XxM8gLUmUF5QCuI9X97QfeO--
