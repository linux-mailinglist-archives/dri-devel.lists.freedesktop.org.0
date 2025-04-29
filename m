Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF55AA02D6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 08:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FD5610E240;
	Tue, 29 Apr 2025 06:15:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bummUBHo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB7710E240
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 06:15:51 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54addb5a139so6098134e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 23:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745907349; x=1746512149; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vdeBVGMv3EeHNQcfEmg6IWrksh7MnxsHjLGKMctwm1Y=;
 b=bummUBHof9kI3HC2GEXRTs5z5GMVhSExTiRyippeRvrCTRxCU3Hs3xSVNWV9VHLG4s
 qlfLXMXFWV0xTxRT1aWjmJ+K51/yeC0O8dB7QXcov7i6+TfBolPBDLTs98whf7V78ESP
 vHcPl9WiRPJJL6CkVGV+2ZKmqpXeqx1BvbwcyqkOdkreQOQLcEM3t/hCUURj8VO2hD3r
 qWyKfZtkKK54j4zcZO+MCYVzOU7pucd7dnI6H+UpWRzGuzBZSDx/nG0TEKhvyvlcJJ4y
 Kv0GYfaWPiApiJxPLJ4TZGdMvrssKSz0n1TBB7kOtNmex8aaapPa0DIvPvGUHQDeyClq
 82zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745907349; x=1746512149;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdeBVGMv3EeHNQcfEmg6IWrksh7MnxsHjLGKMctwm1Y=;
 b=rFeQmmspuS/tInjQs3VEHtFfqhLqMS5mx564jrVJxv9U9Ymw8OGFzl+IrTax9YGHzw
 WKnlaxRXkGtrbmEHmx02Ou3LJQIQM6kiS9qsxddPMkejP9fX6UEDJGWVUHkrH+SeWiQ+
 2CwLnNHlZSxhlNZHTosSs99wsd9zg8+MERmODGUgxPu3ABoy2sxDyNJfCLIyHFl4okDf
 M3mFaCinStqdboKLcuL2IcezRKRzfvW8aVPWHcag05YLaAUuON2mi76VPiq9Jsq9iMXP
 H69hLpHrzzdPZkraHYmvg8peMHWrAdVaiT1veGTmuG5FNYixDnKUzZ5+RXpCf6K19An2
 JBlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTSrpWeUk/ZDl74jWHVW1ZG6dNBs+ueiB+Yqc8tU7domvaemLI0Q09piIHAvThmCvYoQm/L62DFXM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx60IKEvoEpGk428OF+JBJDvR8tufjdhfBY2oOyPUf4Ok/Qe7m6
 m2TcktS565aDgMs22NwPkLER3zo89mtq31wa0ymg7otccVNsLNnV
X-Gm-Gg: ASbGncv3WLEXVqGEC/8Wsl7xkcqzRc0HdCwq4NVeVp1E7iUQNZLKY3hGflu5ZyuhW2V
 aMqIumvjJVovkUv21y2XCLRljskBXx/8BxrZv0AkC86u7F+CoRWq/MSbvB6yai9CZdCTvw8JT0B
 +0Mchv7kxDDlvgaRjM36mRCCRAjGB07YY2fJPjdxILJ/92Psc6XHrpMgstCBaLgsrShjCniVMGN
 Ck9BxUvjd6IGlVBQ43/8vb7LyTPZ+KspHKw7bdS/df3FOmn57wg+9uvMB7E7Sx9F/aitpxtkqcK
 gtHnBUKDRIKuINCziNiYD6fXiqLaKPoMWFBuZ7kNrtllqaGfGUk2Ex/DKFOh/DObxRDwIMwo0e+
 Qug==
X-Google-Smtp-Source: AGHT+IGHq680Q/yIwZxRZ6SNR21MxIbxN6Ov+BKDr4VxC9RTincmJ2pI9pWeYdHHGigYUqe2fr18CQ==
X-Received: by 2002:a05:6512:1094:b0:54e:819a:8323 with SMTP id
 2adb3069b0e04-54e9000c35amr3096126e87.42.1745907349282; 
 Mon, 28 Apr 2025 23:15:49 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e903aa6dcsm1141164e87.236.2025.04.28.23.15.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 23:15:47 -0700 (PDT)
Date: Tue, 29 Apr 2025 08:15:44 +0200
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmrmann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v6 2/3] drm/st7571-i2c: add support for Sitronix ST7571
 LCD controller
Message-ID: <aBBukAqH3SKV9_Gl@gmail.com>
References: <20250423-st7571-v6-0-e9519e3c4ec4@gmail.com>
 <20250423-st7571-v6-2-e9519e3c4ec4@gmail.com>
 <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QDuqjw5mtcb8cj4X"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUsP5gcTyvqJM4OUFL3VutzDrX-V23uYRfnfgzotD8+rg@mail.gmail.com>
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


--QDuqjw5mtcb8cj4X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Geert,

On Thu, Apr 24, 2025 at 10:38:33AM +0200, Geert Uytterhoeven wrote:

[...]

> > +                       /*
> > +                        * As the display supports grayscale, all pixel=
s must be written as two bits
> > +                        * even if the format is monochrome.
> > +                        *
> > +                        * The bit values maps to the following graysca=
le:
> > +                        * 0 0 =3D White
> > +                        * 0 1 =3D Light gray
> > +                        * 1 0 =3D Dark gray
> > +                        * 1 1 =3D Black
>=20
> That is not R2, but D2?
> include/uapi/drm/drm_fourcc.h:
>=20
>     /* 2 bpp Red (direct relationship between channel value and brightnes=
s) */
>     #define DRM_FORMAT_R2             fourcc_code('R', '2', ' ', ' ')
> /* [7:0] R0:R1:R2:R3 2:2:2:2 four pixels/byte */
>=20
>     /* 2 bpp Darkness (inverse relationship between channel value and
> brightness) */
>     #define DRM_FORMAT_D2             fourcc_code('D', '2', ' ', ' ')
> /* [7:0] D0:D1:D2:D3 2:2:2:2 four pixels/byte */
>=20
> So the driver actually supports D1 and D2, and XRGB8888 should be
> inverted while converting to monochrome (and grayscale, which is not
> yet implemented).

The display supports "reverse" grayscale, so the mapping becomes
1 1 =3D White
1 0 =3D Light gray
0 1 =3D Dark gray
0 0 =3D Black
instead.

So I will probably add support for D1 and D2 formats and invert the
pixels for the R1, R2 and XRGB8888 formats.

Could that work or are there any side effects that I should be aware of?

Best regards,
Marcus Folkesson

--QDuqjw5mtcb8cj4X
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEBVGi6LZstU1kwSxliIBOb1ldUjIFAmgQbosACgkQiIBOb1ld
UjJ8hBAA0PylSTjAVScRP2Rlx1rrCav8iBWJi/3/qrUdk0pKJiMyibtLJkx8M6VK
1CgpOTPMOdMvoeoBdqqQfUMdQX2V3uW6NUHSJizQEVuUPIRklwahRg3jI0BlnE1o
QVcSCbBr527o9jItXC0B0bNlBmKUbqa1v0jKaAtH/+ZU7KsTjr+jI7HVvUdHwcpP
gSdpWn5f+hw3GnlAP9JzGvDddPmniwjTNxJbaUEqxWsQCidsHLNicSne4kFCifZ6
5JVZki7KIkIjW2czWyZxmlBUqvVZX5Yxskmgdq4pjZ8MwAL8xtT2zorZmwIJJtGc
MoRTcPPuMMzIAhwUQow6DWTx+AAwVadn+1wdsnEHHJzBVTRsiWn3K0pMciCDQF4C
mr641j8DNfMBK8bzOT87T6gu9BNn4abR7asSG1n8L3Cvil0xQRXmZ1tgD6s6cxBy
2e1LzVekrwwLQy2Zo8jxFxwvBApLDLDeXnfxyhJj9hDUvqIzQzp0YAk29JiIJsoh
Eer3TWAvq6bpWA014nyidG2I87zejonG1W4zL67Je4toNjSmmraz5msX9vLv9dd5
gtGddzJKt9MH5GPzHPaByPWuKySv2PpIs7j0VTenDEfoCYGEJ67yXKIdXfkyhf44
yDWrPIN/JnRcjR6xPQLCXI8w/C8MHGFz1ynR03yJ5ZvILssPTaY=
=iaUe
-----END PGP SIGNATURE-----

--QDuqjw5mtcb8cj4X--
