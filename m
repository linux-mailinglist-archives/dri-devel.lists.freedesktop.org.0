Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2092C8D6483
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 16:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1129110E0D3;
	Fri, 31 May 2024 14:27:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="avo036+F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28EA410E0D3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 14:27:38 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52b7b829bc7so2494013e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 07:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717165656; x=1717770456; darn=lists.freedesktop.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Vyw0QqWPLXQsbnv/eRXn+8SY3S8vBVQpvW4XtA6GV3o=;
 b=avo036+Fj3Dl2NoNKMRvQ3crfcbaCvihImlI7w/DfjbcEuXy93aQShy+Td63b6eF5V
 xIrRmnzhStbwg1SetnFEtQXRMe0GLHfXhPrMDe/aWBjFbxE/uGVH/vpu6RAi7R+1gcI+
 /9YmM4MXAx3J33Z7FXk5rRKVE9W6RRmcLfV5+tIGerjcYOQW/XXLazsmjyWv22+W+lNu
 jTnadsfyKBEhugI3cHHZEAR/Ja10v0zjDxR5VpdabdQ6mwC8ipgn35qoRK/cnLyIhItj
 Et2GjcFQasfqUaG3P0M3442EmxrMChiqXWyT+lGXu248t9XE1a2HhPlR2Tctj6dKqUyN
 G64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717165656; x=1717770456;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vyw0QqWPLXQsbnv/eRXn+8SY3S8vBVQpvW4XtA6GV3o=;
 b=Adq0SjdXlzgH/43z18AhZo16s7CQJKgJQJ/2cNaE94xNhxfTBka9hICUuhKDU2nplz
 AUe6w5BW2u0mk05FXOSDcmPv44qiCFj2ASXnPDcg7GfS80mdzCU9ON/BNNyk1dLri2SG
 2DLMObLdCqNRG8COMSy3JTD752E8dDYev6GiOPSuUbNbim7T8Nhv+ZT8gL0OeOwHP/9W
 aQ55KfrJdJh/3IFxqDUldCHJbEXvBGjJsSTVBfptZNOJdELqsOzP6p+ihsY+HgNvGUfZ
 Da7OcSY4lQgrTijaAB9umOG6j4Y1ILeoeAnhyBMMKGNvCMx6N7A9W+Pp05MRS7wAftdN
 jhEw==
X-Gm-Message-State: AOJu0YwpC0pweUekHIH5F6aDkjY4kex4dtL+fHwhkzUI59SVmrW2XgpZ
 0K/OQ7pG/b/taEIbDg575w2MNpsPw/lvrTjjqL0/exXaHIZN+wF7FCY1PQ==
X-Google-Smtp-Source: AGHT+IH0zYSB5eJp8kFtTsToiVflMdLkT85rkgoYUXCZj948c7VhsWgNQtDpuKO99TnvhDuMSxwjWw==
X-Received: by 2002:a05:6512:45b:b0:52a:daba:f7f0 with SMTP id
 2adb3069b0e04-52b896dc4abmr1244621e87.62.1717165655678; 
 Fri, 31 May 2024 07:27:35 -0700 (PDT)
Received: from localhost
 (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57a31c9c10dsm1081440a12.87.2024.05.31.07.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 May 2024 07:27:35 -0700 (PDT)
Content-Type: multipart/signed;
 boundary=9ed8c5e261fb18701cc301be073920048b7c8d0a92cc9bbfda52553a915a;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Mime-Version: 1.0
Date: Fri, 31 May 2024 16:27:34 +0200
Message-Id: <D1NWF7ESKQ0X.25OZ9MTC2DSBS@gmail.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <baijiaju1990@gmail.com>
Subject: Re: [PATCH] drm/tegra: fix a possible null pointer dereference
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Huai-Yuan Liu" <qq810974084@gmail.com>, <mperttunen@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <jonathanh@nvidia.com>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240531135608.194168-1-qq810974084@gmail.com>
In-Reply-To: <20240531135608.194168-1-qq810974084@gmail.com>
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

--9ed8c5e261fb18701cc301be073920048b7c8d0a92cc9bbfda52553a915a
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri May 31, 2024 at 3:56 PM CEST, Huai-Yuan Liu wrote:
> In malidp_tegra_crtc_reset, new memory is allocated with kzalloc, but=20
> no check is performed. Before calling __drm_atomic_helper_crtc_reset,=20
> mw_state should be checked to prevent possible null pointer dereferene.

Please check that all these variable name references actually are valid.

Also, "dereference".

> Fixes: b7e0b04ae450 ("drm/tegra: Convert to using __drm_atomic_helper_crt=
c_reset() for reset.")
> Signed-off-by: Huai-Yuan Liu <qq810974084@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index be61c9d1a4f0..7648e129c212 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -1388,7 +1388,8 @@ static void tegra_crtc_reset(struct drm_crtc *crtc)
>  	if (crtc->state)
>  		tegra_crtc_atomic_destroy_state(crtc, crtc->state);
> =20
> -	__drm_atomic_helper_crtc_reset(crtc, &state->base);
> +	if (state)
> +		__drm_atomic_helper_crtc_reset(crtc, &state->base);

Looking at how other drivers do this, they call

	__drm_atomic_helper_crtc_reset(crtc, NULL);

if they fail to allocate a new state. Any reason why we wouldn't want to
do the same thing here?

Thierry

--9ed8c5e261fb18701cc301be073920048b7c8d0a92cc9bbfda52553a915a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmZZ3lcACgkQ3SOs138+
s6H03Q//UuqlLodE4/rgaDezJNJcSpL48fqNEFNjdpOEm5Z5qwZUUojcBJj0GNaz
QFYs6+i4594xyoSHq9zAsH/ytcMGRr59aFI/YZt0+RLs0gcJKshIRHgUaESdVXD6
q8ZWe+X0C4YyHZDt7rx8JDtllCOQCqMrDLOaIWETAN5u1gJ23gFfgaU1GGnjgoQY
eAvvPRLVpLDNZv6jgV8a2flO4UinNHbB0X+tYlA5LFPnz3vEyBQVEhpt722cCFVQ
CQWYuUIz9pdelRSgDNJ/Fs8z1Nz8o7CAvVHZykFOY3jfgh9O78QKwM0phhTmB9gn
TwaiFlHHf8vwI4JGEnUphoZhZIEi3Qy2C6W8R1ruGjyYZk4mm17vxBVCOsgmrgAN
ptVh9hKMFfR1ke3tj8wZR3zfr+8aQw5IjxkeHjTI8LIlfWEaOL2rE+bjSfcCkh5L
QVvvvbaCtgeXJ7SAPXIeH6LvRbzU49E8POvHyanYm5v4xDRXnt8ZVdh2luV4jxUN
FdjMtQiTu8rFIOtuj85mjD3gwghaPimrC7w/cb4d2fX03R29psvr0Elsx36PJP8y
LXZo9EhHJLixgHQj7fOT5hYTVDDhGbEuKdrTEfOH0se/HiVizeDP4PnkyzjoLRrh
qGQb3mftwXpoyl+hN6iRNNmDh7dcPj9nuK99RTQQ0xNj9zJ3fWI=
=JUB1
-----END PGP SIGNATURE-----

--9ed8c5e261fb18701cc301be073920048b7c8d0a92cc9bbfda52553a915a--
