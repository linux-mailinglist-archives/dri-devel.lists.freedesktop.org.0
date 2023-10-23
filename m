Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E497D2C8E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 10:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C05D10E176;
	Mon, 23 Oct 2023 08:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD3310E176;
 Mon, 23 Oct 2023 08:23:06 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id
 2adb3069b0e04-5079eed8bfbso4216289e87.1; 
 Mon, 23 Oct 2023 01:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698049384; x=1698654184; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=yILl0/y7g1lM4NMlXc0rK5OqjDqsDZrg7ur6TMfehp0=;
 b=ZUA+kwTkhZIOM6Qal24n7WV5YI1EaxHzBRc3cuQS+LiZHXsGgphLrFBL+vngfJ6I3k
 4N+MNyk4L7IA7zDUwXuf8WeBicsEtAYl86IIespskvtABIhjFDmHKKpcZW1CaJR8D4Qu
 7Dtfx6Wh6+qyDsnz37if8PCxWYjoit0k4K8rX/gd7LTiHLBnk2P0c+SmFRpv/d+VoUvN
 nPG0A4tA7RbRNZpXEnXbxX6blEiroQhFjlLL4JTpfTFehbBYN7htgvaswzcagBJ2qXJY
 sFjiEPlaeqTC9qir9gbzSUEc4OjhMw+2Q2sRISeUpBSzhTbfz3qlYxnXoCGbTSZGVxIN
 bpdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698049384; x=1698654184;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yILl0/y7g1lM4NMlXc0rK5OqjDqsDZrg7ur6TMfehp0=;
 b=TkUfZRP4t+fLvqpiNqxeoiu1Ev+T2wUe6enmiQYpEqY0S3cdltme4atoWMfraJHhe2
 6aKEWqbg3c5FrCnfuRAcT8dSbmBrQMFfb5Q4xZdZi69C6wQAxbfDkj3IthMrn9SCUwgx
 H1JDc9qoFf7uINwbMnJKebRvMneoSdq3Rlxt32sqS8JHs9OGvE7zGdyMrF7XkxcivVQp
 iHQLOzZJ7nUh2oNX+1vCPtpL5znVGW5bADZQe+38yd5DX8kwrob0roiDvakqLbW2vI6m
 ROgQ04thz7u397/rhYvDJcxPfa6qKLl9JSw8ZzNCsyk8GE22rCQsODKRfY5Ce/0/KlAg
 mMrw==
X-Gm-Message-State: AOJu0YwRTqDw3YrpOMdUOy64+R+MsgS82Jr9iEXUsXgQHBIhGdSrmJXQ
 iwNS3iKGWH113UCztl93PR0=
X-Google-Smtp-Source: AGHT+IHfLv2FTvbtP+XDfCQMq0/4gQd56gQXMbgJziOzy1KkvTPqQfj0aDzIIvyqse8I9pxQmKfFcw==
X-Received: by 2002:a05:6512:5c3:b0:500:cb2b:8678 with SMTP id
 o3-20020a05651205c300b00500cb2b8678mr5314280lfo.40.1698049383921; 
 Mon, 23 Oct 2023 01:23:03 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u25-20020ac258d9000000b004f85d80ca64sm1608145lfo.221.2023.10.23.01.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 01:23:03 -0700 (PDT)
Date: Mon, 23 Oct 2023 11:23:00 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Albert Esteve <aesteve@redhat.com>
Subject: Re: [PATCH v6 9/9] drm: Introduce documentation for hotspot properties
Message-ID: <20231023112300.732e18fa@eldfell>
In-Reply-To: <20231023074613.41327-10-aesteve@redhat.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
 <20231023074613.41327-10-aesteve@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/BqH+LEjYZrs8=tT7kXjXoDd";
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
Cc: linux-doc@vger.kernel.org, qemu-devel@nongnu.org, banackm@vmware.com,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 mombasawalam@vmware.com, iforbes@vmware.com, Jonathan Corbet <corbet@lwn.net>,
 javierm@redhat.com,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>, linux-kernel@vger.kernel.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/BqH+LEjYZrs8=tT7kXjXoDd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 23 Oct 2023 09:46:13 +0200
Albert Esteve <aesteve@redhat.com> wrote:

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


Hi,

the below doc text:

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq


> ---
>  Documentation/gpu/drm-kms.rst |  6 ++++
>  drivers/gpu/drm/drm_plane.c   | 58 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 63 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index a0c83fc481264..158cdcc9351f9 100644
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
> index 1dc00ad4c33c3..f3f2eae83cca8 100644
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
>   *
>   * RETURNS:
>   * Zero for success or -errno


--Sig_/BqH+LEjYZrs8=tT7kXjXoDd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmU2LWQACgkQI1/ltBGq
qqc9jg/+O49j7A2awfs+aCc+PJsIXZzo6/vpt0Axrl++SGV6BNXjwSGNNGddCUQE
rZNaWJK3+JBbIqpk9fGz+kNUM1G3UJ5HCveIbl1lCetewGdeJGumMV7gB6/VnK32
zPDon8yBLibA0vHIZHeVp/7ELBNWzPy4XSt3FyOE0dLCen7xukneyZy8bCPpXfR3
bXr7kJV/N2XgZl7MgLRNOMnj/okbJ4dWzD4qUR7Pe8EC0zZ/pBlk7gMfQWeNk1Yl
UmFUix99PDTf3x8BaI22sD9hUg7qkSp1Tf4GtndKyrG5atgYJ61t+1HUAEg8oCJ4
eMH5umZhmm956T7/q7YTv+s3KkyOADQ1tK1ePOSB6I3uM1FF/LqnpzxFQgu11z3O
cl5q1crqZORm+3Sa6X9J7EAFNZzW8+9WD+qgQeuc1o2/mFplmL/fzs/OzkzhTCik
cZVkAFnIykWSoZSka9eG/Xt205wTTBgc0wgryr5OpRr50DCdLr+FfklNM4YLmcqU
ReoL1MWdDPcDtj7t6eaYXTa67kSQaSO/JSbz60cQ9Tt+Rhod6K6MtLFRyTIvFTYj
rISYdRD8Q4Pr8I96vlFXMUsy5hs8amyx5yrWHPWMp+7arZxUbSwupaaRFmTtAiSr
pJCgOmQFFHP+nAbRemAx1+TfNde21rdHuu4ud5Nq3p4ZnzY/taQ=
=75Es
-----END PGP SIGNATURE-----

--Sig_/BqH+LEjYZrs8=tT7kXjXoDd--
