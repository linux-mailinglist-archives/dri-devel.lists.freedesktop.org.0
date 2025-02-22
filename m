Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 772B2A40927
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 15:39:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5661D10E190;
	Sat, 22 Feb 2025 14:39:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W93zMG3z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC2310E190
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 14:39:44 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-38f403edb4eso1690726f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 06:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740235183; x=1740839983; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PBmt0sYMIFhvFdLPyTV+3bLT9pVncOJVnlGTV+VP3VU=;
 b=W93zMG3z2lQXMUQi+uEI4/gUrSDd482/cbRontcKK7AuLlfZsaqkG0tl+WGPz2dzhv
 bgk/KOuTlcTCFMPgkPbuYrdUUnZIiAyBSUcI10YFXouYL2lOWh9167HmI7m/0MA+HR8Z
 E9P8aXhab/h9L4XW+MeXTLQkn14eKTGqjkgDLRH5Zkr2f7bZPR0rGk+j427d3p9bPM7d
 UPYthgPUSFSrQ4OjzSKXpGT3Uvp5SVjyi2sL0TMdwx0cSKHqeFALmfULh8cdvOivfofk
 ZIqvGmt2oo2wiTjjAj9jp3oHYCdCV3/4YVyO11cFIzPSfpezCP86Lcjrz43HYjdRvoYQ
 K6IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740235183; x=1740839983;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PBmt0sYMIFhvFdLPyTV+3bLT9pVncOJVnlGTV+VP3VU=;
 b=ElUDnwaC2vpP04rQxUBHv5Y9rG5j6YJIr31wpRJd/5BzhxRPTwx72k/qQcH0E8Zexv
 1fQeiyDZQgjTOgBA8X7znL0LDY/Sy+DzHOz2/hOHqpoYU6oCGXUbHDV2IXudFdkBeMzq
 imJBcfV9caFtCwmzEhep1AeaXFWV32iz44dL9YaQXwbdIeZBLuoy47625hDsDRLkCOFC
 ZGyibUyrVNQFVzMR2dEAyZWn0kM0e8ilzSpLAP5B0TW6eVRrcHYCY6mFzioL+XirNJMZ
 GloWstmgHNZ65OBGSF58bXoe4d9SNCYgzNYKvBS7taGKowc1Qnq2/EGWvwssNb71fQAK
 X9Vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtfbAkR3BEYnMrqjSpnsZhe9mG0AwW4CL1tnqOHRsNvaBOEYhan2eBVvJC5ZhoXAKXAHBEo6yIUrI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFLT/F5NNub3ElG8hNfHNgWPRPTTO88wZ5CliyaD5F6Qa91jUK
 +fzzyP12IoWsHFw7OHn97TO+s14UaB4Eu66HP5PmqM2rv9UVAncB9c8NKZk9fUxyKy2RWnYIMVt
 lz7nXxhdxdO/AF7rpKZlydv3DLU8=
X-Gm-Gg: ASbGncs8I+cjYKGcveeACx2QN5VC/HhYyGPwP6WtYrjzJeWD1kHiXp6duS9fNkr37Xd
 m2qMz7A79NOrP75zxSPFSk2CSq/A90nZp7yw5lLhewmhkOVQFBBZzlYXBEYTvPVS66Nw495mnSE
 wJvJV1p0vY
X-Google-Smtp-Source: AGHT+IHhfsh8L7SoEfSEAPt4i71ayj8NVEs5Jlp8DnbYgaOEu/0ofJ6OfKwdPbxf6QtaA24Nr5hPTMqg2KwgIHxy5SI=
X-Received: by 2002:a5d:6d03:0:b0:38f:32ac:7e70 with SMTP id
 ffacd0b85a97d-38f6f0c13dcmr5144501f8f.49.1740235183190; Sat, 22 Feb 2025
 06:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20250218132702.114669-1-clamor95@gmail.com>
 <20250218132702.114669-2-clamor95@gmail.com>
 <20250222142910.4e6b706d@jic23-huawei>
In-Reply-To: <20250222142910.4e6b706d@jic23-huawei>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sat, 22 Feb 2025 16:39:31 +0200
X-Gm-Features: AWEUYZnZiYzFm0aljnXobt-fG7MOBn3hu3PRi2D5FDNHFhs1inR24Sh-v5qul0w
Message-ID: <CAPVz0n0up=vkVzryYLauNCM2=hnz-o_ECm+ooXC8y=C2q+T_WQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: mfd: Document TI LM3533 MFD
To: Jonathan Cameron <jic23@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
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

=D1=81=D0=B1, 22 =D0=BB=D1=8E=D1=82. 2025=E2=80=AF=D1=80. =D0=BE 16:29 Jona=
than Cameron <jic23@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, 18 Feb 2025 15:26:59 +0200
> Svyatoslav Ryhel <clamor95@gmail.com> wrote:
>
> > Add bindings for the LM3533 - a complete power source for
> > backlight, keypad, and indicator LEDs in smartphone handsets.
> > The high-voltage inductive boost converter provides the
> > power for two series LED strings display backlight and keypad
> > functions.
>
> Wrap patch descriptions to 75 chars as describe in submitting-patches.rst
>

Alright, though why then checkpatch script has max line length 100 chars?

https://github.com/torvalds/linux/commit/bdc48fa11e46f867ea4d75fa59ee87a7f4=
8be144

> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
