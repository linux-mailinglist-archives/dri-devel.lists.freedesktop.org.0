Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030EF5A781E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 09:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEABA10E220;
	Wed, 31 Aug 2022 07:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6978F10E218;
 Wed, 31 Aug 2022 07:50:20 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id m7so9866752lfq.8;
 Wed, 31 Aug 2022 00:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date;
 bh=PVVv6Ijo5X7bHT+aWBd16hu08aIIwrSDZ/C445vNba4=;
 b=mSxDh5xfDTzioextED+TUTA0XtgSs6vQMCv9tSYx1udfw9Iig4KBCnezF0Z8hhnN99
 gUzie+jgPx9keTFlMk6X6nR0FZKWFmVHO7lgteFok+l+1+AnqzJrSMNCa+W37O1T2V+M
 xXxzfZoZiNg8a5tcmRk/GLYw+QMijhgOfvlQqicOKhk7YH7GXrMwEoPxNHdVpyD434Gr
 IsSPRtmdxvlwpIdZRsIYCLbCFJiz0MesTFE4Hv5YJqlk5a8NDtA4YMA15uemrH7e3RiW
 KKi+Ag/6aI26AXm9c7noQ+L7vJi9VLENIYsj7XavX/IzDv3820bI6CwJdRCpsDXa5hMr
 OlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date;
 bh=PVVv6Ijo5X7bHT+aWBd16hu08aIIwrSDZ/C445vNba4=;
 b=fln/X3ab821nmqlfjukBqluNHAWSJHaQzkvuUExeL3H8psynUBpYYmF4pTFeLkYVP8
 q0NaPpcSdkRuxdCWgEWPISAdyeIRHhgHj4izS6OXilB3WgLxaWb44Xj41UvzaSUEpw3U
 bl+zaz9jYnrtefKtfjjUnTEgtT6lcWyfsajkRfTLc6G0bF0kBaDUw37m+YwB2gze1UQf
 xjtiN6b4M9faRWOdUOEPzCm7grGBwih6gicJA/9ZCeU40h+G34vdR1QTpDjSbkijxuyU
 J1WcMAGAY3H55v8inOH6r4ZWQgio7/r/jw7mKbez2pbFafqacNm2gasVeLouQAR4nzXd
 KWUA==
X-Gm-Message-State: ACgBeo3IldWNX1/vqDwHS4ShIxUjFc2x54rQELedUhfy0X0HtXHz1//J
 FP06deWSyoaYHIgxWiCL07A=
X-Google-Smtp-Source: AA6agR5YLRBsfLgLV+h9snWty+bxn8l2wcLQBZhB4dTn9oUl6Bodlrml3u91/PXZzNLpS1Dk+JlTmg==
X-Received: by 2002:a05:6512:e98:b0:492:cf3c:8860 with SMTP id
 bi24-20020a0565120e9800b00492cf3c8860mr8644867lfb.603.1661932218578; 
 Wed, 31 Aug 2022 00:50:18 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 s22-20020a056512203600b0049472aa5186sm779738lfs.295.2022.08.31.00.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 00:50:18 -0700 (PDT)
Date: Wed, 31 Aug 2022 10:50:07 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2 4/6] drm: allow DRM_MODE_PAGE_FLIP_ASYNC for atomic
 commits
Message-ID: <20220831105007.69e4c3e0@eldfell>
In-Reply-To: <20220830172851.269402-5-contact@emersion.fr>
References: <20220830172851.269402-1-contact@emersion.fr>
 <20220830172851.269402-5-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ir6mu=Qydqg1FRLlg0vEf8d";
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
Cc: andrealmeid@igalia.com, daniel.vetter@ffwll.ch,
 amd-gfx@lists.freedesktop.org, wayland-devel@lists.freedesktop.org,
 mwen@igalia.com, dri-devel@lists.freedesktop.org, alexander.deucher@amd.com,
 joshua@froggi.es, hwentlan@amd.com, nicholas.kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ir6mu=Qydqg1FRLlg0vEf8d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 30 Aug 2022 17:29:35 +0000
Simon Ser <contact@emersion.fr> wrote:

> If the driver supports it, allow user-space to supply the
> DRM_MODE_PAGE_FLIP_ASYNC flag to request an async page-flip.
> Set drm_crtc_state.async_flip accordingly.
>=20
> Document that drivers will reject atomic commits if an async
> flip isn't possible. This allows user-space to fall back to
> something else. For instance, Xorg falls back to a blit.
> Another option is to wait as close to the next vblank as
> possible before performing the page-flip to reduce latency.
>=20
> v2: document new uAPI
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Co-developed-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_atomic_uapi.c | 28 +++++++++++++++++++++++++---
>  include/uapi/drm/drm_mode.h       |  4 ++++
>  2 files changed, 29 insertions(+), 3 deletions(-)

...

> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index 86a292c3185a..cce1a1bea645 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -942,6 +942,10 @@ struct hdr_output_metadata {
>   * Request that the page-flip is performed as soon as possible, ie. with=
 no
>   * delay due to waiting for vblank. This may cause tearing to be visible=
 on
>   * the screen.
> + *
> + * When used with atomic uAPI, the driver will return an error if the ha=
rdware
> + * doesn't support performing an asynchronous page-flip for this update.
> + * User-space should handle this, e.g. by falling back to a regular page=
-flip.
>   */
>  #define DRM_MODE_PAGE_FLIP_ASYNC 0x02
>  #define DRM_MODE_PAGE_FLIP_TARGET_ABSOLUTE 0x4

Hi Simon,

recalling what Ville explained that enabling async flips might require
one more sync flip first, how is that supposed to work?

A TEST_ONLY commit is not allowed to change hardware state, and a
failing real commit is not allowed to change hardware state either
(right?), therefore a failing async flip cannot prepare the next flip
to be async, meaning async will never work.


Thanks,
pq

--Sig_/ir6mu=Qydqg1FRLlg0vEf8d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmMPEq8ACgkQI1/ltBGq
qqcb/hAAjnciNpwLhqax42+2jsviI5tEK8B9cW7QW51eTO+c3hStURgE50+WNhNy
CxJ4t6niSfNfw/MYMJkjfAE4vncgSTerxb/TA3ConOla5g4AT7kfYCxE6T1MM8Hq
PFnMZLsLqzUokxnvjQDI5wMPVx78yk0oZfx9oXLEHBmUKP5q2uyJb3unAO49ZMV4
yUWEQx7UfkB5Iyohxal5s7kzKMLFw6yL2jvIuh5mm3HzHBJDCU6Ccom1e4w9PyeP
5RlXOC1C2pQH6eo7mapDe04d0wXrG2vVr0K+MLCJOcvYnfIw6cbxodttBCNXKUuV
SRg2we+hDOEH0EUzR0PuGMHcRNdpH6kawFtR4bv4JiwnnzWOqRbnmQSSuZkzHglz
QBhNx1g/zy3U8LmMV96yYX0q8Myk149VgqR+R5GazLStvoR31lSaE5jDAFVYe3JT
U+fKq/9a0FrMSsqCli03UvI8DgWaps/Axjs9KvYoqz1IJINf33TIii2S0VcMB+Fa
ABSGKQTOvtfyurGuOoYWGSYIO8ynVZwTLOTLLpHhsFjTGhLb6s9/2iOz1QK3jR6l
l3cLeNcv4mGNKabZ13DBYfqAuizfCTcYRqsaGG9BZG6Fsr2v/stQxFgvuOCY9rjr
DhAs3ILeslU27UFGkgZM4OtXszqH388kNVIyf+vULwx9fQAKj0w=
=pHkz
-----END PGP SIGNATURE-----

--Sig_/ir6mu=Qydqg1FRLlg0vEf8d--
