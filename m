Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB60A0AC67
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 23:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0A2A10E004;
	Sun, 12 Jan 2025 22:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=googlemail.com header.i=@googlemail.com header.b="kStbZvBw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC4410E004
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 22:46:03 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-216728b1836so62345945ad.0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 14:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1736721903; x=1737326703;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mLFoOBjbfRh1gjNLtqlPfhaemkSZmfUAGDlcNvem/wg=;
 b=kStbZvBw6CtVLgmFlz0jJ+Krvw9SB5lKjEk5yBuMuwKASstRliEotoUWKs4RU8s/aR
 k0yfpDw/sdxqht9x8OwUkPxErP522k2Wq8+Wo94hADyvleHWj9lKJOt5AckE0b5mBekn
 X9G4onfFSLddiX94zWY2rwBtqzd4qOA+gdLtN1Eq5FVI6EohNfqbOj/Zhbt3vHbLHjT0
 yJozelVQHqFFGFkbPn+hD0K7ChmvCDLpZDGkuYfJFZmxRGWnggfy/OsN0BqL29izlbg6
 qUcdl1pwjKdUSuHnij4KkPiTTGZFiHiNFUKFkfyNwvKPbX+bMH+jVsqXA9XSFgpfrZOr
 1jBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736721903; x=1737326703;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mLFoOBjbfRh1gjNLtqlPfhaemkSZmfUAGDlcNvem/wg=;
 b=tl1v1d1HPEhwthGWZQvZhEaVvf/ehVE1tIAyiglmW71Bsiy/4o/J41AsqN6N1s/8s6
 17mT6JPlIkF6QAtu3mTImwbcTGPBdOeXdMUM8PTRNQyrGeRzYsQ/RQC8Q1qrdGmgJsSv
 Mnwbf09a4VYKvG6ilg+P54co6nRlUPac0i+ykPsLt1iuTwXItdltYjdDvuXHkYYxq40X
 NWej3iUrh98/T1Z8tMuDtRmXv2iJL4DhUEJImNOP3NJXeMN7Cco3weYP15H7H7sxx0Yu
 MQ1b+oA6gHkKGyLc182aEuQ8lS37Or9O+ByDHyaq6UdJkbNCy33ChoJfRMQANg2LfFL1
 DpPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9MYpeo2I1dAJFjzsKf8+uLz6TXP6uCFVYf8OIKOUnK1zfyIeBFlsYwjp5O8z83YlA2PrZOssF3rs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1vuYUot+BomEmZ0zBh21FVS1s2a7m2KB97i4UBRduAk6gP1z/
 UCoPgq6pAOjk0Xk3QdbYd3SdgN9epYbm/yOlStsHNmwhXIb/OcFxEmBkZYAhI1e5b+ABbfEHCTa
 YJU9x9H4w55e/06RVpukW5ZXAsx0=
X-Gm-Gg: ASbGnct3RXaFdtG7PUiuaDCPhruygqLVYQymxNsPYS68FVtwIpA+GipkY/ee9COUN1r
 95RjdGUFaCWDGao3k+f3jIQdA53WQXicugkfBarm/5TWWaYWw6MU5IBEwVOvAv0h7+jS0KOc=
X-Google-Smtp-Source: AGHT+IGNz3Ruf0X+gVj7nBY3APrFarUB7thQVZMZ4m+s7QUu/pm1goAfZAGCOZYY8Z7GpsZnqZtOgbL3BA33uqULwts=
X-Received: by 2002:a17:902:d510:b0:216:5568:38c9 with SMTP id
 d9443c01a7336-21a83f765dbmr291330955ad.31.1736721903273; Sun, 12 Jan 2025
 14:45:03 -0800 (PST)
MIME-Version: 1.0
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
In-Reply-To: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 12 Jan 2025 23:44:52 +0100
X-Gm-Features: AbW1kvZsSUpdzbvzbuZJcXAZ1UAOMHLx_A3msCo-ZlE0wKJxebqo01Qyaki1jEQ
Message-ID: <CAFBinCDG2in4ZZAp2LXnz8bgiZoPL3G_c9+aCo9+Ort2W-tFCA@mail.gmail.com>
Subject: Re: [PATCH 00/11] Subject: [PATCH 00/11] Add DRM support for Amlogic
 S4
To: ao.xu@amlogic.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
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

Hello,

On Fri, Jan 10, 2025 at 6:39=E2=80=AFAM Ao Xu via B4 Relay
<devnull+ao.xu.amlogic.com@kernel.org> wrote:
>
> This patch series adds DRM support for the Amlogic S4-series SoCs.
> Compared to the Amlogic G12-series, the S4-series introduces the followin=
g changes:
Thanks for your patches. With this mail I'll try to summarize my
understanding of the situation with the drm/meson driver as I'm not
sure how familiar you are with previous discussions.

> 1 The S4-series splits the HIU into three separate components: `sys_ctrl`=
, `pwr_ctrl`, and `clk_ctrl`.
>   As a result, VENC and VCLK drivers are updated with S4-specific compati=
ble strings to accommodate these changes.
Jerome has already commented on patch 3/11 that this mixes in too many
IP blocks into one driver.
This is not a new situation, the existing code is doing exactly the same.

Jerome has previously sent a series which started "an effort to remove
the use HHI syscon" [0] from the drm/meson hdmi driver.
In the same mail he further notes: "[the patchset] stops short of
making any controversial DT changes. To decouple the HDMI
phy driver and main DRM driver, allowing the PHY to get hold of its
registers, I believe a DT ABI break is inevitable. Ideally the
register region of the PHY within the HHI should provided, not the
whole HHI. That's pain for another day ..."

For now I'm assuming you're familiar with device-tree ABI.
If not then please let us know so we can elaborate further on this.

My own notes for meson_dw_hdmi.c are:
- we should not program HHI_HDMI_CLK_CNTL directly but go through CCF
(common clock framework) instead (we should already have the driver
for this in place)
- we should not program HHI_MEM_PD_REG0 directly but go through the
genpd/pmdomain framework (we should already have the driver for this
in place)
- for the HDMI PHY registers: on Meson8/8b/8m2 (those were 32-bit SoCs
in case you're not familiar with them, they predate GXBB/GXL/...) I
wrote a PHY driver (which is already upstream:
drivers/phy/amlogic/phy-meson8-hdmi-tx.c) as that made most sense to
me

Then there's meson_venc.c which has two writes to HHI_GCLK_MPEG2.
I think those should go through CCF instead of directly accessing this regi=
ster.

Also there's the VDAC registers in meson_encoder_cvbs.c:
I think Neil suggested at one point to make it a PHY driver. I even
started working on this (if you're curious: see [0] and [1]).
DT ABI backwards compatibility is also a concern here.

And finally there's the video clock tree programming in meson_vclk.c.
My understanding here is that video PLL settings are very sensitive
and require fine-tuning according to the desired output clock.
Since it's a bunch of clocks I'd say that direct programming of the
clock registers should be avoided and we need to go through CCF as
well.
But to me those register values are all magic (as I am not aware of
any documentation that's available to me which describes how to
determine the correct PLL register values - otherside the standard
en/m/n/frac/lock and reset bits).

I'm not saying that all of my thoughts are correct and immediately
need to be put into code.
Think of them more as an explanation to Jerome's reaction.

I think what we need next is a discussion on how to move forward with
device-tree ABI for new SoCs.
Neil, Jerome: I'd like to hear your feedback on this.

> 2 The S4-series secures access to HDMITX DWC and TOP registers,
>   requiring modifications to the driver to handle this new access method.
This info should go into patch 1/11 to explain why the g12a compatible
string cannot be used as fallback.


Best regards,
Martin


[0] https://github.com/xdarklight/linux/commit/36e698edc25dc698a0d57b729a7a=
4587fafc0987
[1] https://github.com/xdarklight/linux/commit/824b792fdbd2d3c0b71b21e1105e=
ca0aaad8daa6
