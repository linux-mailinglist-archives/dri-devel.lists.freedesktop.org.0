Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19A93758FF2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 10:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C07110E078;
	Wed, 19 Jul 2023 08:15:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB6010E078
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 08:15:55 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-4fb960b7c9dso10991738e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 01:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689754552; x=1692346552;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=UGz8KdQopyQUcO5NYlceM4R7xMyngGDkfeyxTx6CRhU=;
 b=LnzFUmcsc83G4rMzRUOyNfBg27IbGB/JZfSRcyvcdjMxgwpF/vbKhxQbYBDe9wtzim
 wf28ln6GbG+DQHT8t1VoXJN4ZuCngXV6CYqUh9icu/7WBv7rmHznQg9m0/1NY6C7C6Ao
 Dls2DNyVoMbvysGCLLH/k8HxneAeu03d1jXma2LD9DOSmBPe7cLtrzOFfOYPgNyFThPs
 55zhTH2SdGxX90zCAhoQxDiEjFt466NYbDL/8EnUNT1aqeav3GmJPH/nPd3OXDXWEBZe
 7jnoeqASnnh2COoWLKrat4khpKQOLXrTInoX4rZeOo8QKOO0MIaMDCxyDS/ppdsW+2Xb
 o45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689754552; x=1692346552;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UGz8KdQopyQUcO5NYlceM4R7xMyngGDkfeyxTx6CRhU=;
 b=A28EQCfij9p420/1sxWhhueg5gG749PYJA5M8D5SCwaO+knmVnXDkPlbPA4p4y+MnA
 wY2E9RzJNkXlsU+zLk38wOzbvY28Urr1wX5O7/GTq9vS+bGhSJJ8x4CONebSYMUgBDhC
 hKKQi3RM7U8X9HRy4yEs4pAtXwKkZkGGqrQpuqA6gTQAAUpOf+SgMzGHM/xxHLbvA/zD
 ANLZdVJLNlLHttus5adOj7qoHrsRZveSyP4brH1EJfzNL09AP1crOBhfd06iZotglwW/
 lIquNl47AhuG1qAEJrQTVZtupgGMRR/6+0VsxPib7xNtPTpxd9RsMcMeghRutqxO0uyQ
 K4KA==
X-Gm-Message-State: ABy/qLb/Kg1BDg+2tTSlLxu7N9acXV0tqo+nHq7ZwF4aYVylgx4VcUy7
 Px9rELW+kYY/Qewv0TXC+B0=
X-Google-Smtp-Source: APBJJlGexfCk/hL3UV7uZTOzinfpzWcGox56ECzre8BMquFQDfIgjd2jDOUfnnl7RuG79HK+SwgWDw==
X-Received: by 2002:a05:6512:4025:b0:4ec:9ef9:e3d with SMTP id
 br37-20020a056512402500b004ec9ef90e3dmr1585717lfb.26.1689754552027; 
 Wed, 19 Jul 2023 01:15:52 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f14-20020ac24e4e000000b004fdc5557a70sm836690lfr.141.2023.07.19.01.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 01:15:51 -0700 (PDT)
Date: Wed, 19 Jul 2023 11:15:41 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Zack Rusin <zack@kde.org>
Subject: Re: [PATCH v5 9/9] drm: Introduce documentation for hotspot properties
Message-ID: <20230719111541.33c05b14@eldfell>
In-Reply-To: <20230719014218.1700057-10-zack@kde.org>
References: <20230719014218.1700057-1-zack@kde.org>
 <20230719014218.1700057-10-zack@kde.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/EiONIKEiq87f3GRwr6btSXQ";
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
Cc: banackm@vmware.com, javierm@redhat.com, krastevm@vmware.com,
 dri-devel@lists.freedesktop.org, iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/EiONIKEiq87f3GRwr6btSXQ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 18 Jul 2023 21:42:18 -0400
Zack Rusin <zack@kde.org> wrote:

> From: Michael Banack <banackm@vmware.com>
>=20
> To clarify the intent and reasoning behind the hotspot properties
> introduce userspace documentation that goes over cursor handling
> in para-virtualized environments.
>=20
> The documentation is generic enough to not special case for any
> specific hypervisor and should apply equally to all.
>=20
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>  Documentation/gpu/drm-kms.rst |  6 ++++
>  drivers/gpu/drm/drm_plane.c   | 58 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 63 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index c92d425cb2dd..7159b3e90a8a 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -577,6 +577,12 @@ Variable Refresh Properties
>  .. kernel-doc:: drivers/gpu/drm/drm_connector.c
>     :doc: Variable refresh properties
> =20
> +Cursor Hotspot Properties
> +---------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_plane.c
> +   :doc: hotspot properties
> +
>  Existing KMS Properties
>  -----------------------
> =20
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 1dc00ad4c33c..f3f2eae83cca 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -230,6 +230,61 @@ static int create_in_format_blob(struct drm_device *=
dev, struct drm_plane *plane
>  	return 0;
>  }
> =20
> +/**
> + * DOC: hotspot properties
> + *
> + * HOTSPOT_X: property to set mouse hotspot x offset.
> + * HOTSPOT_Y: property to set mouse hotspot y offset.
> + *
> + * When the plane is being used as a cursor image to display a mouse poi=
nter,
> + * the "hotspot" is the offset within the cursor image where mouse events
> + * are expected to go.
> + *
> + * Positive values move the hotspot from the top-left corner of the curs=
or
> + * plane towards the right and bottom.
> + *
> + * Most display drivers do not need this information because the
> + * hotspot is not actually connected to anything visible on screen.
> + * However, this is necessary for display drivers like the para-virtuali=
zed
> + * drivers (eg qxl, vbox, virtio, vmwgfx), that are attached to a user c=
onsole
> + * with a mouse pointer.  Since these consoles are often being remoted o=
ver a
> + * network, they would otherwise have to wait to display the pointer mov=
ement to
> + * the user until a full network round-trip has occurred.  New mouse eve=
nts have
> + * to be sent from the user's console, over the network to the virtual i=
nput
> + * devices, forwarded to the desktop for processing, and then the cursor=
 plane's
> + * position can be updated and sent back to the user's console over the =
network.
> + * Instead, with the hotspot information, the console can anticipate the=
 new
> + * location, and draw the mouse cursor there before the confirmation com=
es in.
> + * To do that correctly, the user's console must be able predict how the
> + * desktop will process mouse events, which normally requires the deskto=
p's
> + * mouse topology information, ie where each CRTC sits in the mouse coor=
dinate
> + * space.  This is typically sent to the para-virtualized drivers using =
some
> + * driver-specific method, and the driver then forwards it to the consol=
e by
> + * way of the virtual display device or hypervisor.
> + *
> + * The assumption is generally made that there is only one cursor plane =
being
> + * used this way at a time, and that the desktop is feeding all mouse de=
vices
> + * into the same global pointer.  Para-virtualized drivers that require =
this
> + * should only be exposing a single cursor plane, or find some other way
> + * to coordinate with a userspace desktop that supports multiple pointer=
s.
> + * If the hotspot properties are set, the cursor plane is therefore assu=
med to be
> + * used only for displaying a mouse cursor image, and the position of th=
e combined
> + * cursor plane + offset can therefore be used for coordinating with inp=
ut from a
> + * mouse device.
> + *
> + * The cursor will then be drawn either at the location of the plane in =
the CRTC
> + * console, or as a free-floating cursor plane on the user's console
> + * corresponding to their desktop mouse position.
> + *
> + * DRM clients which would like to work correctly on drivers which expose
> + * hotspot properties should advertise DRM_CLIENT_CAP_CURSOR_PLANE_HOTSP=
OT.
> + * Setting this property on drivers which do not special case
> + * cursor planes will return EOPNOTSUPP, which can be used by userspace =
to
> + * gauge requirements of the hardware/drivers they're running on. Advert=
ising
> + * DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT implies that the userspace client=
 will be
> + * correctly setting the hotspot properties.
> + */

Yes! This is exactly what I was after. Thank you!

> +
>  /**
>   * drm_plane_create_hotspot_properties - creates the mouse hotspot
>   * properties and attaches them to the given cursor plane
> @@ -237,7 +292,8 @@ static int create_in_format_blob(struct drm_device *d=
ev, struct drm_plane *plane
>   * @plane: drm cursor plane
>   *
>   * This function enables the mouse hotspot property on a given
> - * cursor plane.
> + * cursor plane. Look at the documentation for hotspot properties
> + * to get a better understanding for what they're used for.

I haven't seen the rendered HTML, but is there a hyperlink from here to
the hotspot property doc? I think a link would be neat.

>   *
>   * RETURNS:
>   * Zero for success or -errno

Anyway:

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/EiONIKEiq87f3GRwr6btSXQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmS3m60ACgkQI1/ltBGq
qqeWhA/+INvIt3UzSeaoyb+RxUcogyfCYo/BBTwuy+kOwhhgK0W0WNNKldfBLWTj
4iXSLe9QEpbm52//MEMhuoias3znGGuc/76Hxe1L0ccPr0gcwVZkIUDAGkWIGfJe
6bFdjFAu1MhLT97jCsnHdliUUS64rCnAU+VNEc00snynONYvWvhAwxO3Q8NNvp5i
WKVE4B2GD6C69QjAl4PWrIc/hpxhjFj6Dvw7gALmHS4qT325LF/+9p/1+ECbGhID
gdbTBFaJEcm5khhnrwJqk944qRLstDgYKErfuFI7TBUNlpSDe1ERcbib3DoTaWt6
gjnXqJGLkmdHnr1dGaIhVMsM9FUI0V002UGwDz3RdqxBckLIdNWdLg9iFJGweEdH
6A7ELCOCfqWdqCcpEGi2zg9eQkGeVBYtWpwMitl8HMZ00RDpuSpwWq7/FCTiQEpO
NzGP98Btd7DT50COrKEaEyLW4Zgonmkxmn6UW3Zzo6pMbm9++l2i40QAbUcVd1Ym
47SwWGyDKxXB4MBfYKZHvrUunXoOOpGKcwwlH6iSej/mBzrBKR1dBu3sjaZ54ZRJ
NXDBi7M6s7mqAwO8ulznDF30LwN3k5MxEhQ3FBpg3j5hVtWF55mCledlPO+5c3MO
0fPNR9/Xae9lEt6SuiCCcOxUYGI1unJwo+/b03f4N9DGn95XyL0=
=+giF
-----END PGP SIGNATURE-----

--Sig_/EiONIKEiq87f3GRwr6btSXQ--
