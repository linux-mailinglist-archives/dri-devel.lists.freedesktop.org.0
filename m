Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD8FA458BC6
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 10:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06B6B89F69;
	Mon, 22 Nov 2021 09:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E93C89FA6
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 09:52:52 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id c32so78053447lfv.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 01:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=0w/LnY0STHnB2Im29hCTGRwW1KiHs5I0NxK3AR1/Fd0=;
 b=CjPaSI41KniqzPwtCQOwgDpiROyauuRHZVUWFmhm2GfTPEAfNaYvg6El2NRRi0Am6p
 Hh+99QzN5Zc4s3fQd4ocewltC6QUzO7SdGgslmsiC2kv75UK7monW3CbXP0i1fEV8oEt
 vlaMsc040ZLB7GwnYrY85rSuZGADzJiLWvhgm+M3Uz3EZcTp11yjWwwqgky/h7Wc+Err
 NUU8wBk9jWL9Qv0pVCf9JEqAxCU3jFMONOChClNSs4kIEWmgRUj4b+v3OZ9s0GlYhp1X
 +pkWMG0muyehUFJR9ED2mXAoYzoRvi0O6gCRhgpkSSIODxgrjeJjxtwRLkSIpP/ibEij
 ClOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=0w/LnY0STHnB2Im29hCTGRwW1KiHs5I0NxK3AR1/Fd0=;
 b=LBkGg8ntY5Quls9I9ci3D3FsiKlYkpmrXIEEyaZPMZMCKunVCtLbehDQ7V3rQFHur6
 CKrqouGtwnSLwVGsoHIRx0RJiPh2gyLczwtTn7+viOMFF0x+waVPKX7WwNonSvoYUleh
 mTlxZMVGhlzUU7O3jvOd5tFHF6+4bPBFFOvy19LHCraIySJf3Y82VFs7l7U/wcCgtfxA
 9XbT/uhjhusesQ5riCcgqttZFhztaRS7OP9+qMYTmaBllEkuV/xrUJVtRQOqz3EDkYpg
 QSZ0hjDIoguAVh87n2sNtvSoB/QOQy0rNW1K7TRvcWV7wNjWnsj0sd8lDa0GUgFPBEMl
 5KVA==
X-Gm-Message-State: AOAM531FQnGSWHmQjrL0iiPb9lnyXA1Wv0yPrEksSOkGiH8NtQ7QvErX
 uVK1l/NYD8BrdxVPYpU0LYM=
X-Google-Smtp-Source: ABdhPJwSCQvMFr9/p8AQRvZcd+vn/y5d/vLXMMkKmeN+kN+BMxyK/R9P874Vu/Mup00DPbOtixO+ug==
X-Received: by 2002:ac2:5cd7:: with SMTP id f23mr55583076lfq.153.1637574770965; 
 Mon, 22 Nov 2021 01:52:50 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id f10sm907482lfu.122.2021.11.22.01.52.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 01:52:50 -0800 (PST)
Date: Mon, 22 Nov 2021 11:52:47 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 2/3] drm/format-helper: Add
 drm_fb_xrgb8888_to_xrgb2101010_dstclip()
Message-ID: <20211122115247.257f30fa@eldfell>
In-Reply-To: <20211117145829.204360-3-marcan@marcan.st>
References: <20211117145829.204360-1-marcan@marcan.st>
 <20211117145829.204360-3-marcan@marcan.st>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eeC4l4N88GUSbcvOmvSRbh=";
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/eeC4l4N88GUSbcvOmvSRbh=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Nov 2021 23:58:28 +0900
Hector Martin <marcan@marcan.st> wrote:

> Add XRGB8888 emulation support for devices that can only do XRGB2101010.
>=20
> This is chiefly useful for simpledrm on Apple devices where the
> bootloader-provided framebuffer is 10-bit, which already works fine with
> simplefb. This is required to make simpledrm support this too.
>=20
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/gpu/drm/drm_format_helper.c | 64 +++++++++++++++++++++++++++++
>  include/drm/drm_format_helper.h     |  4 ++
>  2 files changed, 68 insertions(+)

Hi Hector,

I'm curious, since the bootloader seems to always set up a 10-bit mode,
is there a reason for it that you can guess? Is the monitor in WCG or
even HDR mode?


Thanks,
pq

--Sig_/eeC4l4N88GUSbcvOmvSRbh=
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGbaG8ACgkQI1/ltBGq
qqdRYQ//bM6tFPM2B6NM5OF0Pg8dajkciv+81+kA7QV1w7FrexCQS6acTPg9vtyX
J8EySl2TIx9XnBy5BQhp92iUWFuv2lex4/knF+7ZMKtrwAz4Oq33OgD8XKJ75gaq
AOYJCByth0q6Em/KG6DNCSE8yPyKGGQx5OAqTaRVqXTegsDHq9HtNJL300guTyPq
9YLkjrpp2j8WiysutvcpnfY4WvCqNdI5/TY9FynD3e3QkEEBnH9tGPv7HXIHQToV
J2kesFkXNF8nRYkGdaR05lEgfXsuWwLRZvH7IcAyKJr5dIDVY4dnUu/XhTBWr27X
mzyHxNi0/ZrSS5o+atrMVKqSPWdhvek0ce5ASx3FSN0nKNPIp3F+QKOKvocqOUxx
s3UOvwcgvHtB51h0RZBZwm/cAoSRvRraxgCHFkYL4Zb349YiYrcFpLxAEhK6Ujpt
6R70BAyVbtpDsWwIbBNk2T+uhNhafO6TegcWNp9cySSaowtqQn+BLSGpp6t92PAB
xqLrfOXRKjVGg9YmvINUP9bgy/HlhR4Mg6lT9AYe83vnoL+I4GvS98uWdibqigWt
cTXlQcVYKesq55GJ43YLhbbyjcj5P8ODXWmZoTQuYizh1a90VFj+eKQ2gzrnK8Kd
rVAkvy63wmFPgDLZPfSjP9WKAMUN7Z91x+kNa+SVw7toojTuKVQ=
=8F6L
-----END PGP SIGNATURE-----

--Sig_/eeC4l4N88GUSbcvOmvSRbh=--
