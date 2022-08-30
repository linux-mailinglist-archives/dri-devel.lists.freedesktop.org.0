Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EB45A5E77
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 10:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0F9E10ECDC;
	Tue, 30 Aug 2022 08:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB6B10ECDC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 08:48:24 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id w19so7624809ljj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 01:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc;
 bh=Wc85ErxkJtcgHogpuqxfQGJVnFu4b505jJrAvzUG2jE=;
 b=S0ZG+bqkjVS7fUYC4uzp5BvIV9bsz2P6YNN+gBrbUEQKVKV6797aw8hK9wJsiQiG5X
 dFxcNLh7n0cbOQ11aGwQyWN53xdavBMktov+NqLcjqvpGmQl8d8gbnGV8mUG6GIPOQbG
 6GYeDojQpRodc2OXxa1PiIyJQen82RuZkVxgkNgcjC/d9lG7uvrd1Td6Cw/NLecE0tR3
 NHzPThZR5OaXlkSdabMlDI4Xjx3GEI1BYZuooil68mvFZK9JMFkFZiYzizvt1il/9y5B
 0ou8Gv5hEexG6ghPP+Zcu1mDfR+g2qLR+UrOw17eyylYv+JIQAVhtaMtgg45DIBevZRW
 X6Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc;
 bh=Wc85ErxkJtcgHogpuqxfQGJVnFu4b505jJrAvzUG2jE=;
 b=EcsBgp41PMYbVUCwNxNy+La+zKXMxxj0Tn/QIXxC1aZuAy+Ges2En53N4CfHGA4wbm
 b/GV2PIDvyzXypYraOJmfgnbEqlNm7F3XEtIqX3TGXbejZIT0Pwp1s7L1Q+k1+Ox6q1+
 sFByoqOh1T0YbHR4bAYkN631Wl2+GPuATwttSh2OyBCv4WeEuXVpx5x9XkZifXr0LkQx
 rNwbhR/GnjnkeiaK3uCeZRxdn+kJCDYBAoK/o+O3MxsOLzYya4OLM6DFpSB2hoxikJKY
 GXVnbZrA9FwLNcf4JKWKEhSLJx12BUESEzTGQpgwKPf3VZMXK0gLkofl7b/phuqz4JHO
 AIdw==
X-Gm-Message-State: ACgBeo0q76Uu4jU6x+RvBGB/8aWUoV3wfGjrVQZ6jZ+73t/sZ3z2coNi
 PsmALE7P6CjZT1ihM1mk1Yc=
X-Google-Smtp-Source: AA6agR5Vsz6vlLq+C2Z5QZjmskk/vmc9euKUypHLLnXZeGzmpZBNVOm3ixXcVEyfX5QSfaTpF425NA==
X-Received: by 2002:a2e:9e56:0:b0:261:7544:d79d with SMTP id
 g22-20020a2e9e56000000b002617544d79dmr7150126ljk.296.1661849302746; 
 Tue, 30 Aug 2022 01:48:22 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 8-20020ac25f48000000b00492f84befffsm807180lfz.192.2022.08.30.01.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Aug 2022 01:48:22 -0700 (PDT)
Date: Tue, 30 Aug 2022 11:48:19 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: document uAPI page-flip flags
Message-ID: <20220830114819.71d3703d@eldfell>
In-Reply-To: <20220829153957.153745-1-contact@emersion.fr>
References: <20220829153957.153745-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/x4LBAJF9AhBGAaiO6HzHmBd";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/x4LBAJF9AhBGAaiO6HzHmBd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 29 Aug 2022 15:40:01 +0000
Simon Ser <contact@emersion.fr> wrote:

> Document flags accepted by the page-flip and atomic IOCTLs.
>=20
> v2 (Pekka):
> - Mention DRM_EVENT_FLIP_COMPLETE in DRM_MODE_PAGE_FLIP_EVENT docs.
> - Expand DRM_MODE_ATOMIC_NONBLOCK and DRM_MODE_ATOMIC_ALLOW_MODESET
>   description.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> ---
>  include/uapi/drm/drm_mode.h | 60 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 59 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index fa953309d9ce..fa26bda6ffb3 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -935,12 +935,31 @@ struct hdr_output_metadata {
>  	};
>  };
> =20
> +/**
> + * DRM_MODE_PAGE_FLIP_EVENT
> + *
> + * Request that the kernel sends back a vblank event (see
> + * struct drm_event_vblank) with the &DRM_EVENT_FLIP_COMPLETE type when =
the
> + * page-flip is done.
> + */
>  #define DRM_MODE_PAGE_FLIP_EVENT 0x01
> +/**
> + * DRM_MODE_PAGE_FLIP_ASYNC
> + *
> + * Request that the page-flip is performed as soon as possible, ie. with=
 no
> + * delay due to waiting for vblank. This may cause tearing to be visible=
 on
> + * the screen.
> + */
>  #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
>  #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4
>  #define DRM_MODE_PAGE_FLIP_TARGET_RELATIVE 0x8
>  #define DRM_MODE_PAGE_FLIP_TARGET (DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE | \
>  				   DRM_MODE_PAGE_FLIP_TARGET_RELATIVE)
> +/**
> + * DRM_MODE_PAGE_FLIP_FLAGS
> + *
> + * Bitmask of flags suitable for &drm_mode_crtc_page_flip_target.flags.
> + */
>  #define DRM_MODE_PAGE_FLIP_FLAGS (DRM_MODE_PAGE_FLIP_EVENT | \
>  				  DRM_MODE_PAGE_FLIP_ASYNC | \
>  				  DRM_MODE_PAGE_FLIP_TARGET)
> @@ -1034,11 +1053,50 @@ struct drm_mode_destroy_dumb {
>  	__u32 handle;
>  };
> =20
> -/* page-flip flags are valid, plus: */
> +/**
> + * DRM_MODE_ATOMIC_TEST_ONLY
> + *
> + * Do not apply the atomic commit, instead check whether the hardware su=
pports
> + * this configuration.
> + *
> + * See drm_mode_config_funcs.atomic_check for more details on test-only
> + * commits.
> + */
>  #define DRM_MODE_ATOMIC_TEST_ONLY 0x0100
> +/**
> + * DRM_MODE_ATOMIC_NONBLOCK
> + *
> + * Do not block while applying the atomic commit. The &DRM_IOCTL_MODE_AT=
OMIC
> + * IOCTL returns immediately instead of waiting for the changes to be ap=
plied
> + * in hardware. Note, the driver will still check that the update can be
> + * applied before retuning.
> + */
>  #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
> +/**
> + * DRM_MODE_ATOMIC_ALLOW_MODESET
> + *
> + * Allow the update to result in temporary or transient visible artifact=
s while
> + * the update is being applied. Applying the update may also take signif=
icantly
> + * more time than a page flip. The visual artifacts will not appear afte=
r the
> + * update is completed.
> + *
> + * This flag must be set when the KMS update might cause visible artifac=
ts.
> + * Without this flag such KMS update will return a EINVAL error. What ki=
nd of
> + * update may cause visible artifacts depends on the driver and the hard=
ware.
> + * User-space that needs to know beforehand if an update might cause vis=
ible
> + * artifacts can use &DRM_MODE_ATOMIC_TEST_ONLY without
> + * &DRM_MODE_ATOMIC_ALLOW_MODESET to see if it fails.
> + *
> + * Visual artifacts are guaranteed to not appear when this flag is not s=
et.

Hi Simon,

all this looks good to me, aside from the question of whether
ALLOW_MODESET should be talking about visual artifacts or only about
interrupting the video signal or something.


Thanks,
pq

> + */
>  #define DRM_MODE_ATOMIC_ALLOW_MODESET 0x0400
> =20
> +/**
> + * DRM_MODE_ATOMIC_FLAGS
> + *
> + * Bitfield of flags accepted by the &DRM_IOCTL_MODE_ATOMIC IOCTL in
> + * &drm_mode_atomic.flags.
> + */
>  #define DRM_MODE_ATOMIC_FLAGS (\
>  		DRM_MODE_PAGE_FLIP_EVENT |\
>  		DRM_MODE_PAGE_FLIP_ASYNC |\


--Sig_/x4LBAJF9AhBGAaiO6HzHmBd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmMNztMACgkQI1/ltBGq
qqfZZQ//Qz/oCSEYEDAOM1hqkvPrExvnTfNZs8akzb+pbqDODMIEAPIpM/wvVZQ6
7v521wq3oZsd3bB2ZoA+QFOhQgVG1L2xMCVpvM2rryDJiFXYzXrVVg/siYQ6MZLs
fL+xIlzOkic17LsBZUqjz+TjcqqM3LKMEcSBb4wQfZvQE2v2LYHNDwjontZV8pnP
SMT/g4qJW7w7p7gQYJaAwV4qnmZFBbSQ5R1FWChbsmieRbjpVuXga/j58fkdm6Oa
tC+45NUQXUM0GCeJw1FrSV8isqJJ4aVLGL73j2frNgkmcyOYjZIQDaNOY7Id72JT
AD2IQ+60XwXnRru1d5vjL2Njkz98A+wef3Yr5WIgVUO1N/u6Zn4iXrqZe6SKMEhb
YN62bZ5+cKnbpHpWqZZl1uATmTTERmlVgqNdwIo4AsnWLjlgGnAW9BQKF1xuYByq
E+aRH1NY0mPyZtIFCC7o4iKKQtUIffqriO72/VmyI5hMX3w//RpRnB5ppJoxWg4i
vPrq5hLNpBz8JhDXp9ehf5TIeDt5p7t0Dc/PrjGIMWBjE59nbpKD8lOF/PFiIvsW
fyA5caRfPUDS1DcxLJko2Kcspe1cNBE4IFAwYRjusDkBmD7272mNHxrMdUP9pN9d
eiBEdDerIzPAPvnFvLWTYT6UDehsN4+twhNUuHrXl6GPhGp0NOo=
=MSon
-----END PGP SIGNATURE-----

--Sig_/x4LBAJF9AhBGAaiO6HzHmBd--
