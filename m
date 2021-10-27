Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 702B443CA62
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 15:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1BBC6E88E;
	Wed, 27 Oct 2021 13:15:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8CA36E88E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 13:15:26 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id b32so2922915lfv.0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 06:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=Na2fsPy2qizJxBSFFJroM9fryMbb9XAfatD1Eg80iKE=;
 b=oOYW5jIbNlABTCOoH/GcQiqIl5Wy2H7dedcSQx4LzgwS0fLxQKwCRWcQu/ut47wydf
 BbBZq6+eG9yUSlLQUwRRHkSRAOc+xO3/xugN9geSpxzoPzfgxrt/XWNsvk1E4enCOKSB
 UyX8V+y8lVN8FAu82ZPaPweFMfehfTxdyi/eofAPz99sJl+t5S5J5PEuOv6P+YNBnJN7
 xb9h2uLkR1vgx0vPkkc/ie9bncDUP9jgC6+2X974MhgU2JjyhhihZlq7l8UnJTzRL2YW
 C2kPQ2JQHN8eWmjiD3lZt+x0fmh7jUq2OoaaP1kh3aNtPq8H7Vk2eKElTv2j9QKyAN+T
 o9Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=Na2fsPy2qizJxBSFFJroM9fryMbb9XAfatD1Eg80iKE=;
 b=0vFL4bsZM+f9tbhKuVeF3YGQXo/Eq8P5G2Q7BJRC3vgnrIIFBUcdnlFx+0VzZQ56JU
 JyhUtzDSfj8jK4Vv4kujBsLcJW19PxoEsVVgjfIa5yh7G+PpOKOhIDl28A+EcFp8gT93
 lUOLLG5tracmM95NrAbygVecUUGVJ3tRbj2LplKLpgmCwAnpLNXpNqCQV/v5ER1+2gsu
 ap3vLoYMDMjjU30rDGd95myB0Vy1P8bb3ewRNEvKFlozSi5Bi0d49ipCuANndwfv9dj1
 kNY82dIwt69h9txPjjaL/uoabzDi309sGeAg6lFDOW/CYoTvAnTyJL1OJwWkdh/RHF3A
 jLnQ==
X-Gm-Message-State: AOAM5316mkbkXxliZpIqqI5LpT4YEupGUVjeT3QHsUcEtbPopAbsTa27
 iJP1EyRujv9tIotUfQO/kQI=
X-Google-Smtp-Source: ABdhPJz9o5HC6PJM3uw+mD1rSM0LPXhdwF30xCEmWKK1XOM57/+V8a2ICsAUZvCaHYKrco5T4B2CrA==
X-Received: by 2002:a05:6512:12c9:: with SMTP id
 p9mr30092007lfg.236.1635340525164; 
 Wed, 27 Oct 2021 06:15:25 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id w17sm2233840lfu.251.2021.10.27.06.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 06:15:24 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:15:14 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 3/6] drm/connector: use
 drm_sysfs_connector_hotplug_event
Message-ID: <20211027161514.431a5851@eldfell>
In-Reply-To: <20211015163336.95188-4-contact@emersion.fr>
References: <20211015163336.95188-1-contact@emersion.fr>
 <20211015163336.95188-4-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/f46GOJW5iVvMVplWkthz_kn";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/f46GOJW5iVvMVplWkthz_kn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 15 Oct 2021 16:33:43 +0000
Simon Ser <contact@emersion.fr> wrote:

> In drm_connector_register, use drm_sysfs_connector_hotplug_event
> instead of drm_sysfs_hotplug_event, because the hotplug event
> only updates a single connector.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> ---
>  drivers/gpu/drm/drm_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connec=
tor.c
> index ec3973e8963c..a50c82bc2b2f 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -547,7 +547,7 @@ int drm_connector_register(struct drm_connector *conn=
ector)
>  	connector->registration_state =3D DRM_CONNECTOR_REGISTERED;
> =20
>  	/* Let userspace know we have a new connector */
> -	drm_sysfs_hotplug_event(connector->dev);
> +	drm_sysfs_connector_hotplug_event(connector);
> =20
>  	if (connector->privacy_screen)
>  		drm_privacy_screen_register_notifier(connector->privacy_screen,

Hi Simon,

this might not work for Weston if I understand this right. Kernel is
adding a new connector, which means userspace does not recognise the
connector id in the uevent. Weston as it is right now would ignore the
event rather than add the connector.

The missing piece is for Weston to revert to the old fashioned "recheck
everything" behaviour when hotplug uevent carries anything
unrecognised. Grep for drm_backend_update_conn_props if you want to see
for yourself.

However, I wouldn't NAK this patch just for Weston, but I wonder if
other software would ignore events because of this as well.

A whole another question is, would anyone notice. I guess this can only
be an issue with MST.

All the other changes in this series look fine to me, so them I can give
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/f46GOJW5iVvMVplWkthz_kn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmF5UOIACgkQI1/ltBGq
qqdY9BAAhRETV8FGfBc1YMK1MxYpZcWJkZKIbvvNITzUEiBY+Fe+2sXpZdr317Q3
Cb9ouJIJXy+4vId3ly7TFObIGlaPVVKCwK918PePn9LXQqUqWXx8JKP9Xp6SEI55
FFCnP4yJ1oQUpyzJVIQN26vnju3PQfZ8SwOBC+q/8ix1VO8Hya8Jem0yFaSRoUVL
5x8+1//ThnfYMGuiB88bXV8trooJ5BXrJrJEEAxCN7hLCBHhk5u39lcnlFHMEiqV
GNcETztpx1ZAD80TOjP5TYkedlcfLKel++mjAhvCVNx/GwVVHL2oPZpfNMwXvha8
gYjY9ceOsSMPlrHOwB2a+x/+1ImPwJ5PyuTUVR9cbPqE62DtJhKjYv7cyq5PpLZZ
x7+xbk4xm2kAvfQAPuhnSoANOxQqLW+tk8U5BlMb+5oOC+4IHla6KLgTfJMrbMZq
BPMZbFJ8qvPzvLri2ok93pJowLMfpGNSv+b+uCN8+F/SCE4+/RQC1e6bWAWWe/Se
sq8rKbXDhq40lorL740qnqdiKXtbNs31ipOHnieVEVPVlqciXf37Dm8ba9u/Bb9b
UT+DAb5rjSiTkhfuOGDYnvhcNbRz0cEQTfe8K0Dt4A460NQcrcQLCtc9wHtm8SF6
f8EYhsB5J8bEOq1OHFfVrQXLHM55wcFhMvkz0ser70RpGCSgqn0=
=eX6G
-----END PGP SIGNATURE-----

--Sig_/f46GOJW5iVvMVplWkthz_kn--
