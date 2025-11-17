Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F13CC63F27
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 12:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E2510E1B3;
	Mon, 17 Nov 2025 11:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Nm8awoww";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF17610E1B3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 11:56:20 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-42b32a5494dso2444507f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Nov 2025 03:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763380579; x=1763985379; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RWXDrHTHFq+LoH950osN3acgfrZIVN9A2hnRrxaWjK8=;
 b=Nm8awowwie8ry2l1rNYulHMo2x5FCrMjPa0mpk3Meh36xJ+3cnXZr5agN0AKHR704n
 hMdwipe6M5ZslPfQTlaYqdT2uFckpm3CmuX7J7pNaMEUBDhtvjVmh6vSp3A8EHQpZPEp
 rpaxvZR2Yts0/Vh7BistVT5cMIUclQ+KA9uaxMAz0sGNHdp6VWuGQo4SmrjRrsYW4AI5
 ekfjBUQLqEoyJRK857zfwdoHz3/NUMltME5vJ+rmitWoLLHtZPDcQuyRlNaDnIlbY9gC
 ZI6XTDQkV2M2dulj4yNKqI6E/kJrmPiPnua4UCNX5N4wWVFncqPhkrwF2ZYDRKP5Wy9D
 qGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763380579; x=1763985379;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RWXDrHTHFq+LoH950osN3acgfrZIVN9A2hnRrxaWjK8=;
 b=dILmFHBO2d65dtAnkuseSiBgHJ8xTo5n4CSIbbPJbZF6f+44PPl4LXVNYN9sFGeZ3O
 rZG+seftvtOMZCCJJS5po/0Qg8GUQWjmvk07NtbdbtKydSEtHdYW7R3rB6ngCL36x2WI
 hPBvN0pjlR1fqDH6fG5OLO0j2stuTovNrZOAtTvZEZAMjDmltTJ1IWiAUuXIlHjVtNB3
 jtyidcd6TYHu4QUAibg9Ic/8F6Sz3IPQ8PtVAIKhZwiyY5weRpsGFLHMrvqJ6HqCPuAE
 dwYUOfS4cu0Pj4cxbwKPrbQcKELxIhO+zZaJIzA2cXJ19QY590HqtGyQAGUp8ulJGRKx
 FuUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEELScUkXWlXQg8pdW0ctOStXZKBgvalpfDlRwqYJ4XHP5p/dzU5KHVtGSNAEhCrvVjMV2bnP4Q6I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3plIWyANbJRuAdvn4VrWAXPr/jSovpuy/Wq9IEP9wT6ovs13z
 01UiiBcw8oRynykt+yXNjAe7LWu9YkYWhDAQpyJ12UdAV8XL7waVtHnY
X-Gm-Gg: ASbGnctFj5heLL8FToe2weqqw+3ziKCGl033JhxtB1yuK91KCPnVUUNZ6xxX+AkV40T
 fa/quPTS/AN5cijQWhFwPZx1uiACzJJjNgRbIize+zSynCbu+BZo2fK7BGge1n9bFCIvIO28Kc4
 9uQJ7zVZlBw/DMuwulH5sY7Gxb3a7bueHYv2iLoTxmppDMAfrbyUKCtC9C8DuIShhW2CnqtSTI8
 cH7qqvn9M5AHp48gWipTxVziIbyxL+F002evLQy8YiHoNt4UxWmCOsZA+swf+15bfHfNCsdlOu+
 8gWwBv6rYUlDnDI3EyHP7GNzYvBxl1y6niAZXB92TiPQWaUFH8Y3uI4d11V1eEPW8pVjVCNxrja
 /aGoC8nRFe02g8ZKIhrmoB509Lq3BREQrsbS3K9soDiAYG7ux077JGDNXgMwc0nxJbuF6qm/JUS
 5htA8/PAzHz/49WHnHBui2iQBq0odLzV1XyCCWyyJ5fEACCtJS3rpuTplyb6/iGpciypdxDvtEi
 w==
X-Google-Smtp-Source: AGHT+IGyc0tqDOwSpepSxf6zhqj7TmN9ClebDcKhn8W2nmVRELCNueCBZL+FZrHTRO+B3NHj6nEyNg==
X-Received: by 2002:a05:6000:4029:b0:42b:4177:7139 with SMTP id
 ffacd0b85a97d-42b59374d6emr11588070f8f.46.1763380578949; 
 Mon, 17 Nov 2025 03:56:18 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53e91f2dsm26367014f8f.19.2025.11.17.03.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Nov 2025 03:56:16 -0800 (PST)
Date: Mon, 17 Nov 2025 12:56:14 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>, 
 Dmitry Osipenko <digetx@gmail.com>, Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>, Aaron Kling <webgeek1234@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 23/23] staging: media: tegra-video: add CSI support
 for Tegra20 and Tegra30
Message-ID: <mzapp3ekwj3xdzqjjwkwn2hdfunf75fnd3wwxfsr5nce5guhoa@k2dgiw4sngrd>
References: <20251022144930.73272-1-clamor95@gmail.com>
 <20251022144930.73272-3-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="chm563f4rduz3hg6"
Content-Disposition: inline
In-Reply-To: <20251022144930.73272-3-clamor95@gmail.com>
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


--chm563f4rduz3hg6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 23/23] staging: media: tegra-video: add CSI support
 for Tegra20 and Tegra30
MIME-Version: 1.0

On Wed, Oct 22, 2025 at 05:49:30PM +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device and calibration logic found in Tegra20 and
> Tegra30 SoC.
>=20
> To get CSI operational, an additional syncpoint was allocated to serve as
> the CSI frame counter. Both VIP and CSI use an existing syncpoint for VI
> frame start events. That said, the frame capture function was refactored
> to reflect the addition of the CSI syncpoint, and the CSI-specific
> configuration is guarded by the presence of a passed CSI channel structure
> pointer.
>=20
> The camera capture setup's configuration was reconsidered: the first two
> writes must be done before tegra_channel_set_stream for MIPI calibration
> to work properly; the third write was moved to VIP/CSI-specific functions
> since it must be source-specific; the function was placed after
> tegra_channel_set_stream so the initial sequence is preserved and expande=
d.
>=20
> CSI configuration sequences were added based on downstream 3.1 kernel
> sources and adjusted to the existing video-tegra framework. Although
> Tegra20 and Tegra30 have the same set of configurations, they differ by
> the number of clocks used by CSI.
>=20
> Dropped the software syncpoint counters in favor of reading syncpoints
> directly and passing the incremented value to the polling function. If the
> syncpoint increase fails, the PP is reset. This change should prevent
> possible race conditions.
>=20
> MIPI calibration logic was registered in CSI since Tegra20 and Tegra30
> have no dedicated hardware block for these operations and use CSI. These
> calls are used for both CSI and DSI to work properly, which is why MIPI
> calibration cannot be contained within CSI. The pads passed to the
> calibration calls resemble CSI PORT_A (0), CSI PORT_B (1), DSI-A (3) and
> DSI-B (4).
>=20
> Co-developed-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Jonas Schw=C3=B6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/csi.c     |  23 +
>  drivers/staging/media/tegra-video/csi.h     |   4 +
>  drivers/staging/media/tegra-video/tegra20.c | 620 ++++++++++++++++++--
>  drivers/staging/media/tegra-video/vi.h      |   2 -
>  drivers/staging/media/tegra-video/video.c   |   6 +
>  5 files changed, 608 insertions(+), 47 deletions(-)

Sorry, didn't realize that this was supposed to be part of the earlier
series that contains the opsification since it shows up as separate
patch series. Admittedly the numbering should've given it away... Thanks
Mikko for pointing that out.

Anyway, most of my objections remain. You can implement this here just
the same even without most of the extra churn in the prior patch. No
need for moving things to a different header, just keep adding the new
ops stuff to the existing one, which all drivers that need the
calibration functionality already include anyway (including this). Also
no need to split out the SoC specific bits from the mipi.c file since,
like I said, it's not going to grow anymore and can just remain as it
is.

Thierry

--chm563f4rduz3hg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkbDVsACgkQ3SOs138+
s6HaShAAl2Mt1kT8lpQi6WisXh3S3pWUZiGEd4h+Q4mM5o3CX5jGL3HRmrLuw3X9
E46M9ZXWcfbObqJtcXc+adkfJjRp0SZAVv4dOuHYewSpSxJJcqk7MvPaBHVIRQCW
DuNQF0xdh5X/H9aWmCEGuVPE11AOkU2hoT4jS2ovdRGzkV/bK581i7oFSbP8yp+8
x5Ah3mdv97Ffhtmfo6pXDQs6yUdK7NtTVUsUzLixcNMG+YsgzDW9E63xE1Z30ChA
h0E1wT1VhNRnt8xa9bEyfdCJqPdevYXaatR+pPlVkOR58kWKHFiOHNgEUaF8xerQ
BSzWTx3Kp9QLwamVDyGnw0EQ9FQdaOlQcuauh0hqum8RcrugB4VtlGfFw3FPa+3g
GgZAOQJ+0ZVGSB/hAEuNyr4wGu95OISvuXKIkqrdoHbYU+TASM0CxSNQtPPEzmZ2
diLGGMXsUorMYEbX9qBO8LtvanKOCXneaZsEsM8qWz9bVDhCMhQrgc9Pc+tsqCny
AIaDMNMyxijTd5v3gKBFW7zTwtd6lWas7lyUoZau+o1eSFfuB4e41PBmK/wVhMs7
gfpOhWIdHftMKP5vG8CqUAWanoe6uv+CeWrELFtrsmXB9l2aO50m+qOu/tK3IJGl
d2KOoBu0b3FYme9XArllewm8eUA56emOKuD9D5FkDvRinR3ljDY=
=co+3
-----END PGP SIGNATURE-----

--chm563f4rduz3hg6--
