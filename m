Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C44790A568
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2024 08:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC7C10E1A8;
	Mon, 17 Jun 2024 06:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="TI3mBKTz";
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="JDFxQakV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 362 seconds by postgrey-1.36 at gabe;
 Mon, 17 Jun 2024 06:23:23 UTC
Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B5C10E1A8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 06:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
 s=gw2_bookworm; t=1718605040;
 bh=VWekmmnDCFhOysdFb3773YHoJmKjjDsvt2a9l5bgUHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TI3mBKTzz6u0Jx9FjBw7MJ31Tksi/SGBtMurhzr8tlgzy67MVhpkjEoTZwBkMfBK0
 VEa55Gt88p8kIwBCoUYz6q0vxANPmn867a3hghIZZSNCo1EJ5MxzlbZOKNMNmq2W8/
 W3YL9ag7eo7eudx/76gPIh67Cp+o3szmMac6OLlKHT5x/zImovL+bXMI/0zLgjoa8D
 sgwIuwhzHcxr87X/l2KplT3m/+pm/LtgPEbD1r3zq1GA2ob3LT8nYjf2HYGqL+FjZr
 M1YJZ5LAq378kyrr2oMSMXelOE7upxdaZR1BIF/C4112P6Jox9JhR0Zf82iBjgv+tf
 mkFe4EzAYsYww==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
 by gw2.atmark-techno.com (Postfix) with ESMTP id C1FD6A9A
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 15:17:20 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com; dkim=pass (2048-bit key;
 unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com
 header.a=rsa-sha256 header.s=google header.b=JDFxQakV; 
 dkim-atps=neutral
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70])
 by gw2.atmark-techno.com (Postfix) with ESMTPS id D487BA85
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2024 15:17:19 +0900 (JST)
Received: by mail-ua1-f70.google.com with SMTP id
 a1e0cc1a2514c-80b84bffb4bso4731046241.0
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jun 2024 23:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atmark-techno.com; s=google; t=1718605038; x=1719209838;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=60zeZXWHXHBwDs11QTLBG22SVSiDpOOF7b1DAQhvIYU=;
 b=JDFxQakV8LabLaTgo3wB2R1zfoIo6rXDd8DLs5TNZblDraDKVNIe5wG3swSoy7if0p
 N6ydj/cpEuJoeIIO5RqEZpA4O4mf+Uc8745vXhG2jn+0d5KvzbKe/gPeiSK815Df+nIu
 UFkQV9dfprQnDSBaRrQob8dbDPIXg+ZPjbKPv1NWbAP7v95kuz1gb0rFReK9BI5HV1yp
 btaxwKTkjgAuXC5IUPvgRJWWTr/tDEkBaubfg3PVd2isRxFhPmc8L65x6sx4ude0FwxH
 pdpXrhLJFqCreQxLsDYA1sdzueQXd2Cl1WfK+T8/sIu+8nAienMujJzydybTJKtAskbi
 wpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718605038; x=1719209838;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=60zeZXWHXHBwDs11QTLBG22SVSiDpOOF7b1DAQhvIYU=;
 b=Bc9rDXByeFQvUdfXZX9hscIUNhOXqo2Hz465qNKOA1R0eMoVZ08WpGGt3tdNCzKePX
 m6Ehv6qyYoJKduc5pTu9cqorEzW2V5xWyITSYcqxB3zxawuoeUJ2R0Z2edwAFmlvrY8/
 vSPKowM6HyupHphHatKIasVLW3A9EuUKZDXofYvrSDVRNQdRCc9ed6lASV01PdTT8KJZ
 RMLGYoBcDm0W4Yn2/HNpOW1tLFCYKqCqW4FFQiFdes8vNxzDJ1TqNR9GhS6PMefYMpVh
 Te8vph68jvmrn75saHufzX/t/3I/ANfOHR4oQ62vb1DVzybOyyOjk/Xd806KaRHzNugR
 VvcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlDkma11Dk/fffm9HoCNZhRdf9NpN7R0dWYEyPd8gQ4XxFMtSRe3KVd0Nmt/yi51q5e1wNhyj/lcayjB04VFvPQH26pqeMYnjNkylatLA2
X-Gm-Message-State: AOJu0YzK5E9qbAovc00Zw+6ZR72uc29R2G+3NbEyDUrIVxdlSl4MNpzD
 KY0rb/NGfZkX4J6gmtKyIt9v2Iv1KlxKXWwIMv4vcfttlyI96Dp0o/Pqv6ZuSNwF7D3iAVM7oaJ
 7NhzYSPc6exNQ1LksJW2FYDDi4FEI06lJ0K03SnL79QvFgOTyhX7HYlQ4rMsQDUZwUAM=
X-Received: by 2002:a17:903:230c:b0:1f6:f318:71d7 with SMTP id
 d9443c01a7336-1f84e2ecf4amr202295935ad.19.1718605016987; 
 Sun, 16 Jun 2024 23:16:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGupfMdS0WD6NixTdYr6ZfcWEtMhu5SpstN18VssrHrcsQGhmU5k6sNEo7ckq0TCT9O5Tg9zA==
X-Received: by 2002:a17:903:230c:b0:1f6:f318:71d7 with SMTP id
 d9443c01a7336-1f84e2ecf4amr202295225ad.19.1718605016152; 
 Sun, 16 Jun 2024 23:16:56 -0700 (PDT)
Received: from pc-0182.atmarktech (35.112.198.104.bc.googleusercontent.com.
 [104.198.112.35]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f855f1b146sm73170955ad.244.2024.06.16.23.16.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 16 Jun 2024 23:16:55 -0700 (PDT)
Received: from martinet by pc-0182.atmarktech with local (Exim 4.96)
 (envelope-from <martinet@pc-zest>) id 1sJ5fi-009Sm5-23;
 Mon, 17 Jun 2024 15:16:54 +0900
Date: Mon, 17 Jun 2024 15:16:44 +0900
From: Dominique MARTINET <dominique.martinet@atmark-techno.com>
To: Lucas Stach <l.stach@pengutronix.de>, Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, marex@denx.de,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 Makoto Sato <makoto.sato@atmark-techno.com>
Subject: drm/bridge/imx8mp-hdmi-tx: Allow inexact pixel clock frequencies
 (Was: [PATCH V8 10/12] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI)
Message-ID: <Zm_UzO4Jmm7Aykcm@atmark-techno.com>
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-11-aford173@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240203165307.7806-11-aford173@gmail.com>
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

Adam Ford wrote on Sat, Feb 03, 2024 at 10:52:50AM -0600:
> From: Lucas Stach <l.stach@pengutronix.de>
> 
> Add a simple wrapper driver for the DWC HDMI bridge driver that
> implements the few bits that are necessary to abstract the i.MX8MP
> SoC integration.

Hi Lucas, Adam,
(trimmed ccs a bit)

First, thank you for the effort of upstreaming all of this!! It's really
appreciated, and with display working I'll really be wanting to upstream
our DTS as well as soon as I have time (which is going to be a while,
but better late than never ?)

Until then, it's been a few months but I've got a question on this bit:

> diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> new file mode 100644
> index 000000000000..89fc432ac611
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-tx.c
> +static enum drm_mode_status
> +imx8mp_hdmi_mode_valid(struct dw_hdmi *dw_hdmi, void *data,
> +		       const struct drm_display_info *info,
> +		       const struct drm_display_mode *mode)
> +{
> +	struct imx8mp_hdmi *hdmi = (struct imx8mp_hdmi *)data;
> +
> +	if (mode->clock < 13500)
> +		return MODE_CLOCK_LOW;
> +
> +	if (mode->clock > 297000)
> +		return MODE_CLOCK_HIGH;
> +
> +	if (clk_round_rate(hdmi->pixclk, mode->clock * 1000) !=
> +	    mode->clock * 1000)
> +		return MODE_CLOCK_RANGE;

Do you know why such a check is here?

When plugging in a screen with no frequency identically supported in its
EDID this check causes the screen to stay black, and we've been telling
customers to override the EDID but it's a huge pain.

Commit 6ad082bee902 ("phy: freescale: add Samsung HDMI PHY") already
"fixed" the samsung hdmi phy driver to return the next frequency if an
exact match hasn't been found (NXP tree's match frequencies exactly, but
this gets the first clock with pixclk <= rate), so if this check is also
relaxed our displays would work out of the box.

I also don't see any other bridge doing this kind of check.
drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c has a similar check with a
0.5% leeway, and all the other drivers don't check anything.
If you want to add some level of safety, I think we could make this work
with a 5% margin easily... Printing a warning in dmesg could work if
you're worried about artifacts, but litteraly anything is better than a
black screen with no error message in my opinion.


In practice the screen I'm looking at has an EDID which only supports
51.2MHz and the closest frequency supported by the Samsung HDMI phy is
50.4MHz, so that's a ~1.5% difference and it'd be great if it could work
out of the box.

For reference, the output of edid-decode is as follow:
---
edid-decode /sys/devices/platform/display-subsystem/drm/car
d1/card1-HDMI-A-1/edid
edid-decode (hex):

00 ff ff ff ff ff ff 00 3a 49 03 00 01 00 00 00
20 1e 01 03 80 10 09 00 0a 00 00 00 00 00 00 00
00 00 00 00 00 00 01 01 01 01 01 01 01 01 01 01
01 01 01 01 01 01 00 14 00 40 41 58 23 20 a0 20
c8 00 9a 56 00 00 00 18 00 00 00 10 00 00 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 10 00 00
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 10
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 9a

----------------

Block 0, Base EDID:
  EDID Structure Version & Revision: 1.3
  Vendor & Product Identification:
    Manufacturer: NRI
    Model: 3
    Serial Number: 1
    Made in: week 32 of 2020
  Basic Display Parameters & Features:
    Digital display
    Maximum image size: 16 cm x 9 cm
    Gamma: 1.00
    RGB color display
    First detailed timing is the preferred timing
  Color Characteristics:
    Red  : 0.0000, 0.0000
    Green: 0.0000, 0.0000
    Blue : 0.0000, 0.0000
    White: 0.0000, 0.0000
  Established Timings I & II: none
  Standard Timings: none
  Detailed Timing Descriptors:
    DTD 1:  1024x600    59.993 Hz 128:75   38.095 kHz  51.200 MHz (154 mm x 86 m
m)
                 Hfront  160 Hsync  32 Hback 128 Hpol N
                 Vfront   12 Vsync   8 Vback  15 Vpol N
    Dummy Descriptor:
    Dummy Descriptor:
    Dummy Descriptor:
Checksum: 0x9a
---


Thanks,
-- 
Dominique Martinet


