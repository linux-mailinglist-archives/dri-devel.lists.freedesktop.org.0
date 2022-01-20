Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4D449525D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 17:30:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB8410E1DC;
	Thu, 20 Jan 2022 16:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FB7910E1DC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 16:30:18 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id c66so13259525wma.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VzQQqeSGM3LxrK+WlCEqJXUoY8XCwDe0p9TbewA3bqI=;
 b=SMmvG8ttOsH2vuDlmU0xbdKf8b0D1tZeGEAes0tKRsVpLPBDxdDKxdwg3kHTju7JRR
 q3B4myh5Iob5I9CE61Irl4AhfpX28mPM49bLGV9nKAHK4vpnf/41gRGfp3J0tyUfU0jG
 OHw4jUit5a+p5QtVu5gNEm00RX1xcns7bk1WZHVxxX/nLcqUeDYDs1lLYl+N8KNI7t1l
 Rv8XQ7BzAtoBAbVa683Znz2sAR/Ok49tux4Jml34p3qUvFe2168yZnVf9JGKaOW+5x9S
 nIsQdhXS7HnmTujM9T9qgK4QCZw842A3JYycTgXEh6yqW1UKtBxlDaiNELAVWD8HWx0I
 op9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VzQQqeSGM3LxrK+WlCEqJXUoY8XCwDe0p9TbewA3bqI=;
 b=tBiAVWs967quqFnBIU0bLDht1zSF52SCktWap3mSbg9DadhRLMIzdR3xC9T87uHhW5
 9aozj5/B5ZZREAxs5cuUSe8q43n2bYXy2KKP12CJ0XiNpPppnprAw06fD5QSL8iDZL0k
 7pHRcAbuodVzYtH7ErIG8G0CFUQQUWfv7LqNBr2vtmIum404f17vR3t378gjJC9FwtOJ
 Niu5TFFrdFgxkeKYQ9yEL++YARvfLEfazixKKZzGQLCLfZRkhNbXk82OTS52zNlRYYyO
 F7apaEL/REtzpdATdLQI0T+7wkfJEbxUWncklOQov1svDP2nCKkP2TlRHrim1Zf5jGHo
 xhqQ==
X-Gm-Message-State: AOAM5334sDllAiE0MRld7r6RdTLptIEVmX757Ef8gTUxXFXheFdIl3Ge
 vhREZcw2Qt6hZsPTwsvBUdofBnqtLDqYeA==
X-Google-Smtp-Source: ABdhPJy04CbGdXKCJfGvM1t5iOiiIWRQ30w4QVsJUTsNDk2vUYA8WdMht68yiE/0LjztlBaEdUy6Iw==
X-Received: by 2002:a1c:256:: with SMTP id 83mr6927850wmc.89.1642696216410;
 Thu, 20 Jan 2022 08:30:16 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:ced2:397a:bee8:75f5?
 ([2001:861:44c0:66c0:ced2:397a:bee8:75f5])
 by smtp.gmail.com with ESMTPSA id p15sm3074542wrq.66.2022.01.20.08.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Jan 2022 08:30:15 -0800 (PST)
Subject: Re: [PATCH v2 6/6] drm/meson: add support for MIPI-DSI transceiver
To: Jagan Teki <jagan@amarulasolutions.com>
References: <20220120083357.1541262-1-narmstrong@baylibre.com>
 <20220120083357.1541262-7-narmstrong@baylibre.com>
 <CAMty3ZBvbPvKgUpNW1LVho5_S9kwzNioE0SxvX_E8bmgw-+fXw@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <b2086dd4-643f-26b3-3930-4d8beb170b75@baylibre.com>
Date: Thu, 20 Jan 2022 17:30:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAMty3ZBvbPvKgUpNW1LVho5_S9kwzNioE0SxvX_E8bmgw-+fXw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 20/01/2022 15:24, Jagan Teki wrote:
> On Thu, Jan 20, 2022 at 2:04 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>>
>> The Amlogic G12A/G12B/SM1 SoCs embeds a Synopsys DW-MIPI-DSI transceiver (ver 1.21a),
>> with a custom glue managing the IP resets, clock and data input similar to the DW-HDMI
>> Glue on other Amlogic SoCs.
>>
>> This adds support for the Glue managing the transceiver, mimicing the init flow provided
>> by Amlogic to setup the ENCL encoder, the glue, the transceiver, the digital D-PHY and the
>> Analog PHY in the proper way.
>>
>> An optional "MEAS" clock can be enabled to measure the delay between each vsync feeding the
>> DW-MIPI-DSI transceiver.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/gpu/drm/meson/Kconfig             |   7 +
>>  drivers/gpu/drm/meson/Makefile            |   1 +
>>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.c | 357 ++++++++++++++++++++++
>>  drivers/gpu/drm/meson/meson_dw_mipi_dsi.h | 160 ++++++++++
>>  4 files changed, 525 insertions(+)
>>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
>>  create mode 100644 drivers/gpu/drm/meson/meson_dw_mipi_dsi.h
>>
>> diff --git a/drivers/gpu/drm/meson/Kconfig b/drivers/gpu/drm/meson/Kconfig
>> index 6c70fc3214af..71a1364b51e1 100644
>> --- a/drivers/gpu/drm/meson/Kconfig
>> +++ b/drivers/gpu/drm/meson/Kconfig
>> @@ -17,3 +17,10 @@ config DRM_MESON_DW_HDMI
>>         default y if DRM_MESON
>>         select DRM_DW_HDMI
>>         imply DRM_DW_HDMI_I2S_AUDIO
>> +
>> +config DRM_MESON_DW_MIPI_DSI
>> +       tristate "MIPI DSI Synopsys Controller support for Amlogic Meson Display"
>> +       depends on DRM_MESON
>> +       default y if DRM_MESON
>> +       select DRM_DW_MIPI_DSI
>> +       select GENERIC_PHY_MIPI_DPHY
>> diff --git a/drivers/gpu/drm/meson/Makefile b/drivers/gpu/drm/meson/Makefile
>> index 833e18c20603..43071bdbd4b9 100644
>> --- a/drivers/gpu/drm/meson/Makefile
>> +++ b/drivers/gpu/drm/meson/Makefile
>> @@ -6,3 +6,4 @@ meson-drm-y += meson_encoder_hdmi.o meson_encoder_dsi.o
>>
>>  obj-$(CONFIG_DRM_MESON) += meson-drm.o
>>  obj-$(CONFIG_DRM_MESON_DW_HDMI) += meson_dw_hdmi.o
>> +obj-$(CONFIG_DRM_MESON_DW_MIPI_DSI) += meson_dw_mipi_dsi.o
> 
> Can the naming convention prefix with dw-mipi-dsi like other glue
> drivers follow?

Seems only rockchip names their glue like that:

$ find drivers/gpu/drm/ -name "*dw*mipi*dsi*.c"
drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
drivers/gpu/drm/stm/dw_mipi_dsi-stm.c

If you look at dw-hdmi it's even worse:

$ find drivers/gpu/drm/ -name "*dw*hdmi*.c" | grep -v mod
drivers/gpu/drm/meson/meson_dw_hdmi.c
drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c
drivers/gpu/drm/imx/dw_hdmi-imx.c
drivers/gpu/drm/rcar-du/rcar_dw_hdmi.c

Neil
> 
> Jagan.
> 
