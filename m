Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 142B19499CF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2024 23:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F36510E405;
	Tue,  6 Aug 2024 21:03:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="Pu64VaSP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7EF10E405
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2024 21:03:37 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1fc56fd4de1so1976845ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2024 14:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1722978217; x=1723583017;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m2q6pHf2d+29PL7ARSSmco2Uda2QTne6ymuc4cRUvxc=;
 b=Pu64VaSPjiIgdbWgFMF5TaP/UwZ8YGGUbGNuNd4br37lGi4gsWdS3Vxfi/6DrGyHWi
 7QINuKQ/F0GLXv3VyrYc6rSsLdJJMGuqJfDei6b11HtsTQCQiI9HjLzWL3Df5ViFwsU2
 7r6J2qVXZKxFKGzNBE476Dd83G/dh8oAMztaBXlH4R0usxWooEToFxEaQEVWdhD5S1jQ
 kXuzDKlPgkxr2DZ+ShqV2XK5xSv0WGzKGAnQ6JptPGBhq/w1J4bdrUP7YFNsiVvGPijn
 m8TnMsnH742J+PMfqdETpUyDUJeHO2GHoRKIH/OwTOh6hp068Pqx8Kl+lN0mhjenmG61
 0MjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722978217; x=1723583017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m2q6pHf2d+29PL7ARSSmco2Uda2QTne6ymuc4cRUvxc=;
 b=BTWaDF+JO5jVeJzRUFIgZ7mE8rHYQMyz99P425LAbBKta2HHZE/3r/urnzxH7IPNHP
 2glGVOqRqZTOHQJM2BSTktSHp8k7JZf23+bU0bqikexjn3bEDMsvDSY3yyoqf2ypde7Z
 +TO8yRDdjSspHnvLHW+9Wmm2V1VWySUjwO06Vu6QZ6ANi4fsh0ABe8vx0yJD7Fwah7la
 ru9oRXAC97U2OKAZl5auGRqXxTJJ6pZp4R6jqh9KTfft5J6T/XL6C03WfSMpA+mWI40u
 CApZTKVfW/PXsy4nIw/oIrREKuKeFDsNODxbdl2CBlAhT368MX+Lv8xw8FBWEpSpRF2M
 xIWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXC4fEP1Wn+UGpVApHwmG8EPUHyzECFc/yAHCIe6SfHnZ2Fmio/8eOqACPTyxBvvHHDr6+gMjawp3I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyO8rPToAjqD8fTtBBehjfc6fX7xjy/2F82pQyP0SjDmyPrmW6R
 Ugdf6UHyIv9fWYWXm+kIrFjvkZ18RihDahJOGqBMD4TnFoAQ2jhHcQA/wEWE/fBhNGTkjU0ph5e
 hKwYEf7CUCHlvQD+ntqTREp7altA=
X-Google-Smtp-Source: AGHT+IHnTsomZEJTNgTr0RHgWmTYrb/mu0Mk5eZcXXey+C/tHk5gZ8CXDzozzaLkZe8gUGsqKmfnGvzIxRoRWUKUOxg=
X-Received: by 2002:a17:902:f64f:b0:1fb:7654:4a40 with SMTP id
 d9443c01a7336-20085492a0cmr824815ad.14.1722978217049; Tue, 06 Aug 2024
 14:03:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240730125023.710237-1-jbrunet@baylibre.com>
 <20240730125023.710237-8-jbrunet@baylibre.com>
In-Reply-To: <20240730125023.710237-8-jbrunet@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 Aug 2024 23:03:25 +0200
Message-ID: <CAFBinCAaZumGU6dOq0RrHRTQV=MejTJ=RW0P_6tQFOG9vybY6g@mail.gmail.com>
Subject: Re: [PATCH 7/9] drm/meson: dw-hdmi: use matched data
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, dri-devel@lists.freedesktop.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Jerome,

On Tue, Jul 30, 2024 at 2:50=E2=80=AFPM Jerome Brunet <jbrunet@baylibre.com=
> wrote:
[...]
> +       }, {
> +               .limit =3D 297000,
> +               .regs =3D gxbb_3g_regs,
> +               .reg_num =3D ARRAY_SIZE(gxbb_3g_regs)
Just as a side-note: this looked odd when reading for the first time
as I thought that it's a typo (and it should be gxbb_2g97_regs - but
that name is not used).

[...]
> +static const struct meson_dw_hdmi_speed gxl_speeds[] =3D {
> +       {
> +               .limit =3D 371250,
> +               .regs =3D gxl_3g7_regs,
> +               .reg_num =3D ARRAY_SIZE(gxl_3g7_regs)
> +       }, {
> +               .limit =3D 297000,
> +               .regs =3D gxl_3g_regs,
> +               .reg_num =3D ARRAY_SIZE(gxl_3g_regs)
> +       }, {
> +               .limit =3D 148500,
> +               .regs =3D gxl_def_regs,
> +               .reg_num =3D ARRAY_SIZE(gxl_def_regs)
this is not consistent with what we have above or below so it either
needs to be updated or a comment.
I think this should be called gxl_1g48_regs

> +       }, {
> +               .regs =3D gxl_270m_regs,
> +               .reg_num =3D ARRAY_SIZE(gxl_270m_regs)
and this should be called gxl_def_regs



Best regards,
Martin
