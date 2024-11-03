Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7599BA35A
	for <lists+dri-devel@lfdr.de>; Sun,  3 Nov 2024 02:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A87110E333;
	Sun,  3 Nov 2024 01:09:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="M3WqK/XN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com
 [209.85.210.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C58310E333
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Nov 2024 01:09:34 +0000 (UTC)
Received: by mail-ot1-f46.google.com with SMTP id
 46e09a7af769-71850708dc9so1893484a34.0
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Nov 2024 18:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730596173; x=1731200973; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=D4QOdmiAitTS8O0SnezO4SNz6OllLepeXC7m6ZxKe7M=;
 b=M3WqK/XNeW7vqvY0igBghE5vkeQW4g3lUib3LC+DL61I6RV4Jnj0WeSx3ST0mHjJYV
 VkVsD7dBLgHutSW6xfoyHiwCO+liv5g8mFgxThazS9sBpUC/VoOPH2KWU6+B65rZSok8
 321aaNnwTrHovv7xfzaAZn41JLBNgFwb16xCFmRcwXU3to8J/fZ6+9gUkePl2j0+38Ne
 SkoGKDbRPcuhIrKCj+jMN281fcK+QFtTp5S+ZmO4EYNBpP7/PmTsVfT+fpWY2ZxVy5mA
 3MVQqbiKonh0bXJKbLFhG+i2qr6a0PNF4GhX93cG/bAKb/ERM/vYB+iwzoRGlfPU7oVX
 X7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730596173; x=1731200973;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D4QOdmiAitTS8O0SnezO4SNz6OllLepeXC7m6ZxKe7M=;
 b=Wt9/2u/UEbYd5OnTzOsqLxuSOzRExeBOSQexduM9/5l6bPnQSeNu4F3GSxZI/5PTmY
 BFhlSxQnXS3d+dKWk7AqclC/D+LrkxvoJRVbcyMrD6+6L7SniHidtzdozH8hxxaV32AL
 EjzGN5dpmJP62PP/3VvmgPgQTtOVibY+z5qpHfflC8oNosGSM801YiKOtNyuVYizAKA/
 ATx/TaX58qkTxsp4LDP97oeWFY8u8vX+CemK8Fo7kMAz7QRGZDisAFWdouKFbeVntQS6
 OVSzmQ+OZiBKDj6yeyQ5eoOpRyg3JVJE/5KRlsb2eAW65GGMHA7bc4/PPT0rNTK+SiZP
 kI9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvGnyY4Fk2+zKP7VdbNlTfWPJI0dfWsz8EIURjhow7jRX9XlJW1H5Sg87lUCBnUvPm6ygQ5K+DODA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6XAqm1pGh+G3Fs8MjXffGylFJ80Br3CWQmzuSzkNtIML9DMYG
 TNExPrjJTej6O0q9DXcQ/CJQEel+cu8UIch21m03BbcZT3NP4TBX
X-Google-Smtp-Source: AGHT+IF/XN8GB56cZEkfM/bpwoxIWphszEPLIkRp82LQFtAsIcX7OxTDU647gyiz4UWHj5SpuMkZvQ==
X-Received: by 2002:a05:6830:6f83:b0:709:47d6:1364 with SMTP id
 46e09a7af769-718681194e7mr24652116a34.9.1730596173551; 
 Sat, 02 Nov 2024 18:09:33 -0700 (PDT)
Received: from illithid ([2600:1700:957d:1d70::49])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-719dfff95d2sm304310a34.15.2024.11.02.18.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Nov 2024 18:09:32 -0700 (PDT)
Date: Sat, 2 Nov 2024 20:09:29 -0500
From: "G. Branden Robinson" <g.branden.robinson@gmail.com>
To: Ian Rogers <irogers@google.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org, groff@gnu.org
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
Message-ID: <20241103010929.ke6vf4amh76hyqb4@illithid>
References: <20241015211719.1152862-1-irogers@google.com>
 <20241101132437.ahn7xdgvmqamatce@devuan>
 <CAP-5=fXo5XjxUXshm9eRX-hCcC5VWOv0C5LBZ3Z0_wQb+rdnsw@mail.gmail.com>
 <20241101200729.6wgyksuwdtsms3eu@devuan>
 <20241102100837.anfonowxfx4ekn3d@illithid>
 <20241102103937.ose4y72a7yl3dcmz@devuan>
 <20241102213620.kfccilxvhihwmnld@devuan>
 <Zya6ApewCZQNEfJb@riva.ucam.org>
 <20241103000534.th3jq7umwojlxnma@devuan>
 <ZybIG9xykOW6driW@riva.ucam.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="zwlgsoflppbkm2gq"
Content-Disposition: inline
In-Reply-To: <ZybIG9xykOW6driW@riva.ucam.org>
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


--zwlgsoflppbkm2gq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 1/3] proc_pid_fdinfo.5: Reduce indent for most of the
 page
MIME-Version: 1.0

Hi Colin,

At 2024-11-03T00:47:23+0000, Colin Watson wrote:
> (That's leaving aside things like localized man pages, which I know
> some folks on the groff list tend to sniff

I can think of only one, the maintainer of a rival formatter.  ;-)

> at but I think they're important,

Me too.  I agree with the sniffer that no language is ever likely to
reach 100% parity with English in something like the Debian
distribution, but more modest domains exist.

I've put effort into l10n issues in man(7) and in groff generally.  In
particular, I really want seamless multilingual document support and
achievement of that goal will be, I think, much closer in groff 1.24.
(My pending push is gated on deciding how to change the me(7) and ms(7)
packages to accommodate a formatter-level fix to an ugly wart in the
l10n department; see <https://savannah.gnu.org/bugs/?66387>.)

> and the fact that the NAME section has both semantic and
> presentational meaning means that like it or not the parser needs to
> be aware of this.)

Even if mandb(8) doesn't run groff to extract the summary descriptions/
apropos lines, I think this feature might be useful to you for
coverage/regression testing.  Presumably, for valid inputs, groff and
mandb(8) should reach similar conclusions about how the text of a "Name"
section is to be formatted.

Regards,
Branden

--zwlgsoflppbkm2gq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh3PWHWjjDgcrENwa0Z6cfXEmbc4FAmcmzUAACgkQ0Z6cfXEm
bc6EthAArrUZLr4eYODfrVEKCGtAtU5k44otdNvFWBAMvKkauFRv6hB5HX8tifuN
gpEHH8F2tcdcL5qqo5k378LSnkgZOWBdXXnIl1Wrt5p7IqKoowECvIDtCSMvPCgA
wS3egJZPIRKh3b4niuih71J1dLF42K3URENy80lHWAMvIUL7vEfYFkWJ9rMFqB7G
V9qlka9B2cf8Oj2R8CSluGh+JS06YfJTG1uFTxUcMQfnPUXutQ+E5FjxXyQMLWMs
+d5epPPwNgrfCDcWQKH6dNvwpwx8AiTdBbatZ1MkR/kFq+Ni+TkxQupj/avg6TZ3
yDZjZqncl9nJcmIc+p0C/prEVPfywTN46OfPdlCKeV1phbFfsCkVOnAD1dTw8U45
/lCi2sd4rGhPWibY3YZs+joH7u9hLgCn+X/YFEkvhsobmOt8TQNptJzubMV/o3lT
zCsaCaWXOBsdGn5bjH1ohqn20vfGpM3SaD2el9L/ihW5QP6IoS65DhxwbZ05Zuwe
eh251TQtCTQVTxJOPyRN7Y++OJezCEMm0a0ZU0egj1r7DU1XfBtECWS2P4Ziaxxa
QabdsMFS00dGVkB5xScKoWyvfeweq1FCWpjF6hlebTUN8vxY4+pbg7MV0ZN/Kl4H
BF1TyCqhSmxMNXA+xP/i9LIXKRUss7Urt1vhwWiFdtp/wymV75g=
=lxZD
-----END PGP SIGNATURE-----

--zwlgsoflppbkm2gq--
