Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034BC389FAD
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 10:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBAC6F388;
	Thu, 20 May 2021 08:17:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAEB6F388
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 08:17:55 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id 131so18664058ljj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 May 2021 01:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=jppl03SNYb103HqRquUsAvmCMEsdjUVXEBFQx7Jwn1o=;
 b=dFTsdKUdOe2c1LEHdhV88YTdIHBEBZhUo+S9pe45OZDwH/MKslcDLDONs0UNCsjnnZ
 b5Uxdpn5g75628RvaLmvaUhZp7DBn74Re7bWWSc2JIFy5lygXKWNXYb1K830dske4Ll7
 uNWJs+uT/C/axgSqOGcJ7N8Zd4rGtuCtlkwcg4ncgNCEYTXG2n2XKlJ0AP6UkjeC6JoJ
 kaQAfDEZ088uBYXWzcDuTCoyf9IH5+wcDVIDmDybR0HVxlCzClzAcFQBMitRM4TXg0mu
 itR2N2BFdfj9T9jxdUcDmEFIZvlzNiKFBEDPp2T0dunMI7KxyB++yh0rVu1CiF3y9EI9
 cLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=jppl03SNYb103HqRquUsAvmCMEsdjUVXEBFQx7Jwn1o=;
 b=l5H1alcIRxkZz2os5r6wUK8TqSrkm4mj4/VUEBiTW2wzLqievfnMo3tgCN/9pVhe5n
 Vz3R20PvCl5m0HPWPwE2q2soF8nOjuQZMiT8570L1KhtCkKiFhF57FPLDJL23BjzEQFd
 zYjLkPVYgGfomUMNRlDTz/Q5CtrJ7Ee9uSLgLSkcA3hfuZq86aPYCPlDdwGrqTSkVge+
 S/tqZ5JFR7eOSaTYB7qjCW4h0D8CgqsfVvsdjYhZ9oPtckIbsY0dj+55Itc/a8XZUVSC
 85HWjPpMusX+FUiJ6m2Yy/f6/VtAfOmQBIZ+YPrhEMpZCHKcLaOgDInZBkACLOjhjJT5
 JYCA==
X-Gm-Message-State: AOAM530I55wnfFg+bfccZC9xcWyKLP9HPFwl1e1xF1ozfMRrX3eAwaSQ
 Zxzn/ZIPXJ5y9O5SvPPdXUI=
X-Google-Smtp-Source: ABdhPJxcx27rkOTJEJtFn/usmCAY6dT/otsdBwiLBcyBRmikOERe1mbowxKET3RL8lMs9dW4wzV2ig==
X-Received: by 2002:a2e:760c:: with SMTP id r12mr2185709ljc.299.1621498674316; 
 Thu, 20 May 2021 01:17:54 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id a25sm200082ljp.11.2021.05.20.01.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 01:17:54 -0700 (PDT)
Date: Thu, 20 May 2021 11:17:50 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 1/3] drm: reference mode flags in DRM_CLIENT_CAP_* docs
Message-ID: <20210520111750.0950243b@eldfell>
In-Reply-To: <Yjo91Qsg0kYg3xGZAkEOSYjNm3YGkjElS6wObR59vz0@cp4-web-027.plabs.ch>
References: <Yjo91Qsg0kYg3xGZAkEOSYjNm3YGkjElS6wObR59vz0@cp4-web-027.plabs.ch>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/t7Kd9XegLVehme9mmsU+y8d"; protocol="application/pgp-signature"
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
Cc: dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/t7Kd9XegLVehme9mmsU+y8d
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 18 May 2021 11:14:42 +0000
Simon Ser <contact@emersion.fr> wrote:

> In the docs for DRM_CLIENT_CAP_STEREO_3D and
> DRM_CLIENT_CAP_ASPECT_RATIO, reference the DRM_MODE_FLAG_* defines
> that get set when the cap is enabled.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> ---
>  include/uapi/drm/drm.h | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index 67b94bc3c885..1c947227f72b 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -777,9 +777,9 @@ struct drm_get_cap {
>  /**
>   * DRM_CLIENT_CAP_STEREO_3D
>   *
> - * if set to 1, the DRM core will expose the stereo 3D capabilities of t=
he
> + * If set to 1, the DRM core will expose the stereo 3D capabilities of t=
he
>   * monitor by advertising the supported 3D layouts in the flags of struct
> - * drm_mode_modeinfo.
> + * drm_mode_modeinfo. See ``DRM_MODE_FLAG_3D_*``.
>   */
>  #define DRM_CLIENT_CAP_STEREO_3D	1
> =20
> @@ -804,6 +804,7 @@ struct drm_get_cap {
>   * DRM_CLIENT_CAP_ASPECT_RATIO
>   *
>   * If set to 1, the DRM core will provide aspect ratio information in mo=
des.
> + * See ``DRM_MODE_FLAG_PIC_AR_*``.
>   */
>  #define DRM_CLIENT_CAP_ASPECT_RATIO    4
> =20

Good.

Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>


Thanks,
pq

--Sig_/t7Kd9XegLVehme9mmsU+y8d
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCmGy4ACgkQI1/ltBGq
qqcUyg//dabh5643PcKch/5i6y91wuUznmXtFcmE64+jpGLOnDwHjX5JDYj6c3Im
FZpwg1lG2l1pc0rbualGF0nt2nDznRgmVxxvVD5gD8In2ecTsOF6ltoBvPjBiIu4
AuZ8cG6SvQWiAHHrKJ2SbZcFW0+Rj4fH47a5ZNjLhXVj0Vf9hI93XlwnYLkhhVOy
Dq74++1cKWA073YfO8LfiPigK6QgrxYHrTl+4/ZUKp/U+ioC6d8l3WWC6AcVX0fG
4pEghx3ATMXtfV04sL+p1vBHOTgDFygMENxUSaUA4yLFul4XCdtL4qCP+gZ7ykaT
YTTGMBpwFRN2Qun+mymTmfp2+cQilG0mhapjjGoC6Ty2zIfhX82Q24UP84yBzW8U
MtI1WAs9kEGcp5W+d1DuZa3MCL8nlXi4ourDK++Z/hK7Ifj0lFkehIDXA+m3ctYL
rMMDHTfFsaMnX9Ecnnu+WoxcKTJ4wlHunFZd9q0saSE7cVD7Wg9BdIZXSH14lyPU
QqQzBeSa5S54Kp8jUwt08K6PLuklvEHJrfZrMX/FW/uKevXWW21wRkdSomlLuvRu
htZEoNTeMDm58r+Xv43U+KQAelUm5v9YZfPGb5RMB19BnXuFWRbupqcmGJLtScG1
lEvchU/DW18DboViMzZ7mU91xPM0QqZFwta+emB9NO3UEDugQcU=
=pZKX
-----END PGP SIGNATURE-----

--Sig_/t7Kd9XegLVehme9mmsU+y8d--
