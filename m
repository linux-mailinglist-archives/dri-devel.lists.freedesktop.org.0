Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74154B145E6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Jul 2025 03:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6228610E1A2;
	Tue, 29 Jul 2025 01:41:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eUt6F/Op";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A377A10E013
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jul 2025 01:41:17 +0000 (UTC)
Received: by mail-ua1-f51.google.com with SMTP id
 a1e0cc1a2514c-886b2fdba07so1480846241.1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 18:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753753276; x=1754358076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rTE78ChE+vquBrI5YrDGqyKJDHj33kW+vj6Lk06X/sU=;
 b=eUt6F/OpVGCZxCOvJDpyQJAmcwNEGYXozxCdmctUrpisFCpHVewRsSJ/1oTwukofkb
 9UxSNiKRFI3+jtN5zAC+oKbxBQ4t4F4RzyVbC7sEVA8ioSG6huNO26dfzhF5tX3Jpu0y
 SXXItrErjucB7KsmEkpcthzUPubZeUHnMWjffrNRMpfTXqdVFzaIndd4wupDbbYhhPpS
 zI1F7YFRSpVI9t66DD8Ns27cSe8Z8MRODCwbSUBK7WhfXiT+xNZ55qi5JZYX7vKiWLYC
 U4/kwuUeIQs2D5zuYte4a9CU8kIKcgdcGdwsp97fXpvmnrVKB0muoOlPiLCy8eQJcwT3
 Cl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753753276; x=1754358076;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rTE78ChE+vquBrI5YrDGqyKJDHj33kW+vj6Lk06X/sU=;
 b=vZN4WAJzoNgMhmECDxpfQTq27YUETZYes8oIynjgs2TULYZOgKQkx7qKYwu31EMF/i
 pnw0P8F6D0JdrawCpTJ3rP6TXmFw3tNHWkSd4ANi8dynbBPAWKt8EOxzrWyPLcK1puLC
 PAr3eLqIhVT8WRMwOHbEJLMBz53OubuAofIkiJoC9Dum/Y4mRfVcW+jR0zmA5qIP5ntu
 t+QrVv5BA4YyBAe0FPwGEaZ1+xNWI+zHZ9SDuC1XVuF5pK8gxQsy0NNQfV4J0tPaoY5c
 50yv2d0qxLU49taDZaiL5pXcW2TpKUA+Enafk/mSgOZ60hU9w13Vmp05hbwwqD0oqbTq
 EdxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYU/5751AK11zlnGw43PcHQiLlJqteHVhceYd9xaGYPOe8WXN8jCNtvD1sFrXbiUblyeC3C8OjcWI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwE77x22iMpvi8aFE8O2/S2DCnGFj9vEu2d/ua/oy/QbblRd1i
 taS7625vvkNMzwFC+EF3enW8P2EMbGHwirRFgzeIUM6Bn22XLNlYYDN6xMqrXnAjowRJAQD7ErF
 8LOg3ifN8QiFGHWI4/ojLe4I4o/J/Rvg=
X-Gm-Gg: ASbGncu3KIeS4Wh55zUtoIkLIdew725Q3g/yJb3GYYtRmoogsZveRefvMwitELf2mw4
 ZYlvqrhcMhzxLTNU93WOUJubY5FtzJ8NsxYdsyCgZaT0D0xb0125hW4hTuFiz3KpatYDMX7CMin
 eZQ6fsUCLuySKXHcLpUH6AL6H9lu+28qafBG5k92c8EzaMCStSE/piNhu5CU4mRRNYVCGmaMYiq
 pZS9Q==
X-Google-Smtp-Source: AGHT+IH5sSaz4kLWBjYQ8xg5A6GoRN5L+Q3qFpxAbI0in2TfAspkDTFwyyOI/F2e9j59D50tjfOZG4mczSkStSE5wG4=
X-Received: by 2002:a05:6102:8024:b0:4fa:d2c:4fe with SMTP id
 ada2fe7eead31-4fa3fef74c9mr6797567137.26.1753753276427; Mon, 28 Jul 2025
 18:41:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
In-Reply-To: <20250706-exynosdrm-decon-v4-0-735fd215f4b3@disroot.org>
From: Inki Dae <daeinki@gmail.com>
Date: Tue, 29 Jul 2025 10:40:34 +0900
X-Gm-Features: Ac12FXy-Uc3aIGD_z-2Hmjo9PpVFm9Hawvq4wg2d1-g_c1M1SQ84nY0S7pRIJwA
Message-ID: <CAAQKjZOLZw7e1G56i29b28L0NwOM=P4eZtcNAp2vFpe3ck958A@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Samsung Exynos 7870 DECON driver support
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, stable@vger.kernel.org
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

Hi  Kaustabh Chakraborty,

This patch series has been merged into the exynos-drm-next branch.

Thanks,
Inki Dae

2025=EB=85=84 7=EC=9B=94 7=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 2:30, Ka=
ustabh Chakraborty <kauschluss@disroot.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=
=84=B1:
>
> This patch series aims at adding support for Exynos7870's DECON in the
> Exynos7 DECON driver. It introduces a driver data struct so that support
> for DECON on other SoCs can be added to it in the future.
>
> It also fixes a few bugs in the driver, such as functions receiving bad
> pointers.
>
> Tested on Samsung Galaxy J7 Prime (samsung-on7xelte), Samsung Galaxy A2
> Core (samsung-a2corelte), and Samsung Galaxy J6 (samsung-j6lte).
>
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
> Changes in v4:
> - Drop applied patch [v2 3/3].
> - Correct documentation of port dt property.
> - Add documentation of memory-region.
> - Remove redundant ctx->suspended completely.
> - Link to v3: https://lore.kernel.org/r/20250627-exynosdrm-decon-v3-0-5b4=
56f88cfea@disroot.org
>
> Changes in v3:
> - Add a new commit documenting iommus and ports dt properties.
> - Link to v2: https://lore.kernel.org/r/20250612-exynosdrm-decon-v2-0-d6c=
1d21c8057@disroot.org
>
> Changes in v2:
> - Add a new commit to prevent an occasional panic under circumstances.
> - Rewrite and redo [v1 2/6] to be a more sensible commit.
> - Link to v1: https://lore.kernel.org/r/20240919-exynosdrm-decon-v1-0-6c5=
861c1cb04@disroot.org
>
> ---
> Kaustabh Chakraborty (2):
>       dt-bindings: display: samsung,exynos7-decon: document iommus, memor=
y-region, and ports
>       drm/exynos: exynos7_drm_decon: remove ctx->suspended
>
>  .../display/samsung/samsung,exynos7-decon.yaml     | 21 +++++++++++++
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c         | 36 ----------------=
------
>  2 files changed, 21 insertions(+), 36 deletions(-)
> ---
> base-commit: 26ffb3d6f02cd0935fb9fa3db897767beee1cb2a
> change-id: 20240917-exynosdrm-decon-4c228dd1d2bf
>
> Best regards,
> --
> Kaustabh Chakraborty <kauschluss@disroot.org>
>
>
