Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F217E5A2396
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 10:54:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1185B10E775;
	Fri, 26 Aug 2022 08:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52C810E775
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 08:54:00 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id m3so1137743lfg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 01:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc;
 bh=2E51LoNr9TwqeMb4yXV8o7Z+sfQs2I5YigSV95U+sX8=;
 b=VcDg0dxzD7zy2apcv8qFZ2UrKHLIZ0haU37Xfue/FqCxqTsHp+0bpnKpIOjzcKMUU4
 pAFGWL6L8J2vKfc0bonFB8KhfR290GOI32HivPDj9UbIhtjOHog2Vo8LjtxhdyK2MD+t
 KvJE8B+8rVfRMmJPI2eBOZg8y6gC7HZlUUSr9XT0jmjlgB4PJJn8oMnJjc/vrhx4rWBx
 DRV1uPHzHZgwYnAJjtvxgDKi8FOFMdnkEHJW9TVpNfx9hJoeTcfdtu9wLRoxZAJVhajj
 gTtRi8ABxX14akhiEsD5WMkvpInCpneom4cUs5cEth78E3xuHR4B8B2zNRCKZp32Pb4H
 x4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc;
 bh=2E51LoNr9TwqeMb4yXV8o7Z+sfQs2I5YigSV95U+sX8=;
 b=kTJwCFgqoJn2nLrZJ2rp7BecY687CrPZw+pk2oXlYg/NgJgwyfdN/w5g2oD8x22Tsi
 troldN5dVQHy4Yx0V5Bi66Bw5l0PDqxHWorO6b6msIRKnrt3GGG8qhSRnrwQdtfh7e12
 YW8Y3G134pRvRTLyxJjk5xae2t3MgUDRzaXZl5ybLp1XHAo11NLzXvl5FY6fJls42ie1
 GvPGEqfkX5KWnFbVCuJfbI2BkMqLYxkadqIzPWafBOp620N+R0SvMtiTaDFfcM3PB1Iw
 Ki92RG9DSMvjQcV1zntsgutp7pdnjAhxmtugEFfQDxf2avRsOZgF5hTlmGvgc41KgtqE
 5EvQ==
X-Gm-Message-State: ACgBeo11Nb2WL/wYFrgsXLf58VY/DYzyxEZX6K2pgNZwzhVUOA4D5/aR
 227QdFIYsHDJlwoMtb1f4fY=
X-Google-Smtp-Source: AA6agR5yk9YCViHIXpr+D3FY5epyB+QrbbNHStNI9UAFR+IEfv0AZHkmG30BSjnY6W7xDcPwDvLDfg==
X-Received: by 2002:a05:6512:2621:b0:47f:d228:bdeb with SMTP id
 bt33-20020a056512262100b0047fd228bdebmr2089559lfb.121.1661504038862; 
 Fri, 26 Aug 2022 01:53:58 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 v12-20020ac2592c000000b004926689d410sm307780lfi.171.2022.08.26.01.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 01:53:58 -0700 (PDT)
Date: Fri, 26 Aug 2022 11:53:55 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: drm: document uAPI page-flip flags
Message-ID: <20220826115355.668e13ca@eldfell>
In-Reply-To: <20220824174459.441976-1-contact@emersion.fr>
References: <20220824174459.441976-1-contact@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/gLzFvEdpXoaCkEl/fWNC85s";
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

--Sig_/gLzFvEdpXoaCkEl/fWNC85s
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Aug 2022 17:45:06 +0000
Simon Ser <contact@emersion.fr> wrote:

> Document flags accepted by the page-flip and atomic IOCTLs.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  include/uapi/drm/drm_mode.h | 44 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
>=20
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index fa953309d9ce..e1b04ffd54c3 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -935,12 +935,30 @@ struct hdr_output_metadata {
>  	};
>  };
> =20
> +/**
> + * DRM_MODE_PAGE_FLIP_EVENT
> + *
> + * Request that the kernel sends back a vblank event (see
> + * struct drm_event_vblank) when the page-flip is done.

...with type =3D DRM_EVENT_FLIP_COMPLETE?

This was a bit new to me, because libdrm abstracts vblank and pageflip
events into different APIs.

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

Btw. does the kernel fail the flip if the driver does not support async?
Or does it silently fall back to sync flip?
Asking for both legacy and atomic APIs.

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
> @@ -1034,11 +1052,35 @@ struct drm_mode_destroy_dumb {
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
> + * Do not block while applying the atomic commit.

Maybe add something like:

	The atomic commit ioctl returns immediately instead of waiting
	for the changes to be applied in hardware.

> + */
>  #define DRM_MODE_ATOMIC_NONBLOCK  0x0200
> +/**
> + * DRM_MODE_ATOMIC_ALLOW_MODESET
> + *
> + * Allow the update to result in visible artifacts such as a black scree=
n.

Maybe add:

	...temporary or transient visible artifacts while the update is
	being applied. Applying the update may also take significantly
	more time than a page flip. The visual artifacts will not
	appear after the update is completed.

	This flag must be set when the KMS update might cause visible
	artifacts. Without this flag such KMS update will return EINVAL
	error. What kind of updates may cause visible artifacts depends
	on the driver and the hardware. Userspace that needs to know
	beforehand if an update might cause visible artifacts can use
	DRM_MODE_ATOMIC_TEST_ONLY without DRM_MODE_ATOMIC_ALLOW_MODESET
	to see if it fails.

	Visual artifacts are guaranteed to not appear when this flag is
	not set.

That "artifacts will not appear after the update is completed" is a bit
awkward, because when this commit completes and triggers the completion
event (if requested), the visual artifacts might still be on screen, but
as soon as the scanout cycle that just started finishes, all artifacts
are gone for good. Isn't that how it works?

Or does the kernel wait with the completion event until a good picture
has been fully scanned out at least once? I'd expect not.

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


Thanks,
pq

--Sig_/gLzFvEdpXoaCkEl/fWNC85s
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmMIiiMACgkQI1/ltBGq
qqfS3Q//ZFCpH++GL5cFcRiDaJwJEVQYw1bJ77Ps/UE364yC2I9O4zTHUSm8xKgZ
Y94lDnKvd8mLr7DCuO0XcbzL6s516ehSuqZoOrzdkMbopufV2A8C5sHZQutwigz6
37lMMv4hPsMzbyZna6ASHQSy+1FfXoOmx7J3mjYhyMW8TNRa+SEXxT/UAPrWIZ18
drtLKnfgi1AISVV9jCQu26EXVBRntB6jkZZucFzE+HBDEx1sjG+NGeY7gI3Xho0j
Wz5gmryvwifuzzehq3ybrEMpyIbohdw9tvJN/pGJim5qKtefskYZZCPzsAZT2aMM
SEMegX5Y7+b1Hih6B6cHrZerG6dYBu/x2QUXoVAAsCEa9RV4nk+BQjj6yxig8rPa
qUOmO4vumV/UZ+A2u8p8NlohGMwiaaHlwa62ByjGkkR5787amw3phzFH0mvpA8Y8
eyOKSiIdmi5Pz2IdV6/eCIlH2kQWkJ4it9dXQjQIVzwehS9g2Iaiv/elcs61/Kt0
6Lqc66W2hZ51fZfVmaUu795ErP2iofI7sq9ShQIkos9xMwGV12AXaoIhn3+g/yHa
VNPp8VT5I+cUbIh5RfY+/H1XqWVJVAtcGGL6+Gimrygtru9FwcKSp9/Mr4TTOomV
wVOgQd6rnioQ6PaJlVK255ZiqsEn+dHd7Yd41TnHdh2SSy2PmNI=
=gunC
-----END PGP SIGNATURE-----

--Sig_/gLzFvEdpXoaCkEl/fWNC85s--
