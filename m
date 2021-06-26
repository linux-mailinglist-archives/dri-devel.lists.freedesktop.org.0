Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE183B5976
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB14C6E117;
	Mon, 28 Jun 2021 07:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76726EBFF
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jun 2021 09:17:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id r3so3229303wmq.1
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Jun 2021 02:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LDhw70Yt6exlhcSv9Afxjx3HSFu7MiB5l0gKPfTwVSY=;
 b=H1L+9kK5x2xDfD4+ac6jvpBBlKEBrPfMnVFKtFc67B60aavZwq7To5ljsFPD5Nj7ve
 rbhEohxu98kStOog/G5sidu42+NAMVG4xEiqKPwHovsY2Qvv5jombxa7qs/2WL9csCrd
 oI4GIQ2j1MZKexR3D7bW9Pd+U5kamhOj6riC9HAia/x0QsgC/DkCTfR0c35QmlgKwu7g
 x50O7Wob3t0T6E9euXInfAkuPcjIDXs9tLuqE408zhfVxXAnGvRC8VP6ZvpJCgfcrElZ
 +v4sfa2skP9krOkj88XLVoV8itniXJzadspK6crZZeKlolyRNqZZaqhBga8u3FIFHkW+
 nRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LDhw70Yt6exlhcSv9Afxjx3HSFu7MiB5l0gKPfTwVSY=;
 b=ts3eyTaOyo3a+SHiormIeYikKiu0sNWR2iPVvgIJRjGM5Yy3ijrdATwxD5YyuYkH3q
 rSfoEpTxekcxImLF/CsNhYYJIA8oolEdofOjaCdIjTxEfz4mr0FaZLkZIvq6sWWEzNVY
 co1J9ynMc+P8vw5exZqfCNVLNDv00MokPmd6AS8hXZhgFZyWaGy9l80yPsx7E5/vhQH5
 T5Sva2P3O5TL8oRqF+iHtRlsAEjRwSroQ4XMWmMHS8kdf14J5EuNkczyC9K9zjqxSZ4h
 Kb9biFhw8JlhZCKwXZcxG3GA+pzZv7s0SLW1KO5TlPD9nlLVyZnFPxJ2kfL+5YXjO16A
 Y20Q==
X-Gm-Message-State: AOAM530nl/pAGYH9ERPSL387E+24lktFSwAyE7OVeCFm1cdXGJwnnw2Z
 XYe721CmuRKH9WC7BQBXeg==
X-Google-Smtp-Source: ABdhPJwEgPRMkMpbegQwnIrmpL866N7XdcNLXf7aA10ISebqBYaS89SGrO07eG8kEkK8VzbJqZ/p7A==
X-Received: by 2002:a05:600c:21c4:: with SMTP id
 x4mr15593320wmj.30.1624699051638; 
 Sat, 26 Jun 2021 02:17:31 -0700 (PDT)
Received: from [192.168.200.247] (ip5b434b8b.dynamic.kabel-deutschland.de.
 [91.67.75.139])
 by smtp.gmail.com with ESMTPSA id r1sm13379774wmn.10.2021.06.26.02.17.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Jun 2021 02:17:31 -0700 (PDT)
Subject: Re: [PATCH 00/12] hantro: Enable H.264 VDPU2 (Odroid Advance Go)
To: Ezequiel Garcia <ezequiel@collabora.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20210624182612.177969-1-ezequiel@collabora.com>
From: Alex Bee <knaerzche@gmail.com>
Message-ID: <125998a1-e521-bcf6-2905-20204c38d5a7@gmail.com>
Date: Sat, 26 Jun 2021 11:17:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624182612.177969-1-ezequiel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Mon, 28 Jun 2021 07:06:06 +0000
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Hans Verkuil <hverkuil@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 24.06.21 um 20:26 schrieb Ezequiel Garcia:
> This series adds support for H.264 decoding on the PX30, RK3328
> and RK3326 platforms, enabling the VDPU2 core.
>
> Given it's tested on the Odroid Advance Go, patches 1 and 2
> add the basic support to report the panel orientation to
> userspace (Heiko, if you like them, feel free to pick them).
> Weston (for instance) picks up the orientation automagically
> and rotates the render.
>
> Patches 3 and 4 are just low-hanging fruit that was on my backlog.
>
> Patches 5, 6 and 7 add some helpers to avoid duplicating some processes
> between Hantro G1 and VDPU2. Patches 8 and 9 enable the VDPU2 H.264.
> The implementation is based on a patch from Jonas Karlman [1], which
> I forwarded ported to mainline.
>
> Finally, patches 10 to 12 add support for the VPU on Rockchip PX30 SoCs.
> These patches are based on patches submitted by Paul Kocialkowski [2],
> which I ported and adjusted a bit.
>
> Tested on i.MX8MQ EVK and RK3326 Odroid Advance Go, the latter
> is able to decode a 1080p sample at ~100fps nicely.
>
> Fluster conformance testing is looking good as well, and producing
> expected results:
>
> RK3326:
>    Ran 135 tests in 480.067s
>    FAILED (failures=9, errors=54)
>
> i.MX8MQ:
>    Ran 135 tests in 337.491s
>    FAILED (failures=9, errors=54)
>
> [1] https://lore.kernel.org/linux-media/HE1PR06MB40119DE07D38060F531D1070ACBF0@HE1PR06MB4011.eurprd06.prod.outlook.com/
> [2] https://lore.kernel.org/patchwork/cover/1361795/

FWIW: Patches 03/12 - 09/12 are

Tested-by: Alex Bee <knaerzche@gmail.com>

> Ezequiel Garcia (8):
>    drm/panel: kd35t133: Add panel orientation support
>    arm64: dts: rockchip: Add panel orientation to Odroid Go Advance
>    hantro: vp8: Move noisy WARN_ON to vpu_debug
>    hantro: Make struct hantro_variant.init() optional
>    media: hantro: Avoid redundant hantro_get_{dst,src}_buf() calls
>    media: hantro: h264: Move DPB valid and long-term bitmaps
>    media: hantro: h264: Move reference picture number to a helper
>    media: hantro: Enable H.264 on Rockchip VDPU2
>
> Jonas Karlman (1):
>    media: hantro: Add H.264 support for Rockchip VDPU2
>
> Paul Kocialkowski (3):
>    dt-bindings: media: rockchip-vpu: Add PX30 compatible
>    arm64: dts: rockchip: Add VPU support for the PX30
>    media: hantro: Add support for the Rockchip PX30
>
>   .../bindings/media/rockchip-vpu.yaml          |   3 +
>   arch/arm64/boot/dts/rockchip/px30.dtsi        |  23 +
>   .../boot/dts/rockchip/rk3326-odroid-go2.dts   |   1 +
>   drivers/gpu/drm/panel/panel-elida-kd35t133.c  |   8 +
>   drivers/staging/media/hantro/Makefile         |   1 +
>   drivers/staging/media/hantro/hantro.h         |   4 +-
>   drivers/staging/media/hantro/hantro_drv.c     |  11 +-
>   .../staging/media/hantro/hantro_g1_h264_dec.c |  48 +-
>   .../staging/media/hantro/hantro_g1_vp8_dec.c  |  31 +-
>   drivers/staging/media/hantro/hantro_h264.c    |  24 +
>   drivers/staging/media/hantro/hantro_hw.h      |   8 +
>   .../media/hantro/rockchip_vpu2_hw_h264_dec.c  | 491 ++++++++++++++++++
>   .../media/hantro/rockchip_vpu2_hw_vp8_dec.c   |  32 +-
>   .../staging/media/hantro/rockchip_vpu_hw.c    |  54 +-
>   .../staging/media/hantro/sama5d4_vdec_hw.c    |   6 -
>   15 files changed, 671 insertions(+), 74 deletions(-)
>   create mode 100644 drivers/staging/media/hantro/rockchip_vpu2_hw_h264_dec.c
>
