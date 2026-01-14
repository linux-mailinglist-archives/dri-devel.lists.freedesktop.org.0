Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF47CD1D8C9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 10:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E710710E1E5;
	Wed, 14 Jan 2026 09:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1FD10E1E5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 09:32:21 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id
 a1e0cc1a2514c-93a9f6efe8bso2523954241.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:32:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768383140; x=1768987940;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8zDJce+CzgnUUMSOqtY7/Bi9afy0UIdZaZUJnldMOyg=;
 b=ZKoRBiTcB9hAAaQjFX37dD7UNw+COgQn5EV2Kr9p2tCzCxs99FpZkadrjsChsmST24
 MPv71LRidtHjC5WZiHG7ruJBBzkItzzg7k3MKkhhIHmbVmXy3AX8xAE1DxBcWZZ4/aEj
 pkDnRP97Ns3NTe/HvKbhDSQAcZW9UI278hJrugy6956fwksp3fuA1gVRQbKW//ZHl1rQ
 TDu+1+ozHFVafmbo51D40tqmOqoOQOzriuce1CSq88jGm9MQKPr4MA3pIHN5K0TWhzld
 mcFdLFXhZwavwRkUPWQ8sjzQaDTReewQVPKQskUk5L2gxo4yA4gCIp99LeC6zpA4X+k/
 a/rg==
X-Gm-Message-State: AOJu0Yyb0dcv1InDVwhmzT5D5dhpzoE8Jm1aTFMziZNAFURW1EdXhTZe
 NB0iHwLRTfae7m4jMcX449RG8Kc5H8kUFzeRHjwRoyddgY6UCnxShyo5l9k6wuxk
X-Gm-Gg: AY/fxX6S7ELvQes4ynSsNhO5s/2fjUpLcCPmCAyCZ2Cf7Y9a0ZpQt30VxEKVdJQQF16
 71yYoS/gbAwgqnZ5psNFTwXDcKNQhTOYs/ydU7TDN24ws5k3WyRArhXNMZev929Gbj9t9uyniKa
 ut1IXnj5qWMZKdnCD4y6OJmeEJbFLMz2BDKeQNKIhD0nJg+KAZRi89xyPdoDCS4ax+syFRX7sUb
 fvDSLoT3vfRFJ9qNq5HpOi+Vf1G5eq8yySe3b3rmzBb1HW8n0+rrQQJRXk0khfEqsOtKMj1pl6z
 hT9IQxdMKt725ziEyHeLXXb5zIFMHpHmC1Cfi8elHFxHZOJ4XH23tba6TZk9MytDOy5a610uSrb
 LI1EMvQavjvCvsUubOY9hgVW2XMEggoEjs6cArStKsncLWvvDJn7/kxNQEQ+h1XOLy3OOp779na
 VyetMeFNcuhXJ4T7Ws1Gi3aqxlbhv2f7gutDbuzgM53l25NuT+
X-Received: by 2002:a05:6102:3f12:b0:5df:99d3:d9a5 with SMTP id
 ada2fe7eead31-5f17f3efc60mr620618137.4.1768383139785; 
 Wed, 14 Jan 2026 01:32:19 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com.
 [209.85.217.49]) by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-944121ef3fcsm21954298241.0.2026.01.14.01.32.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 01:32:18 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-5eea9fbe4a4so2025715137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:32:18 -0800 (PST)
X-Received: by 2002:a05:6102:3f11:b0:5dd:b2a1:a5a4 with SMTP id
 ada2fe7eead31-5f17f3f0042mr733928137.5.1768383138240; Wed, 14 Jan 2026
 01:32:18 -0800 (PST)
MIME-Version: 1.0
References: <20260112234834.226128-1-marek.vasut+renesas@mailbox.org>
 <20260112234834.226128-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260112234834.226128-2-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 10:32:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJBKnqU_HtF1KpZY-75iTWjZwedLbFSYLpgDfVHGsW1g@mail.gmail.com>
X-Gm-Features: AZwV_QiKgVRnWvbmqW5MDnkyAYhxg5wrvIwNyBPnn7EJexnd8UAobHHJuJB4uzo
Message-ID: <CAMuHMdUJBKnqU_HtF1KpZY-75iTWjZwedLbFSYLpgDfVHGsW1g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: waveshare-dsi: Add support for 1..4 DSI
 data lanes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Joseph Guo <qijian.guo@nxp.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Robert Foss <rfoss@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

Hi Marek,

On Tue, 13 Jan 2026 at 00:48, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Parse the data lane count out of DT. Limit the supported data lanes
> to 1..4 which is the maximum available DSI pairs on the connector of
> any known panels which may use this bridge. Internally, this bridge
> is an ChipOne ICN6211 which loads its register configuration from a
> dedicated storage and its I2C does not seem to be accessible. The
> ICN6211 also supports up to 4 DSI lanes, so this is a hard limit.
>
> To avoid any breakage on old DTs where the parsing of data lanes from
> DT may fail, fall back to the original hard-coded value of 2 lanes and
> warn user.
>
> The lane configuration is preconfigured in the bridge for each of the
> WaveShare panels. The 13.3" DSI panel works with 4-lane configuration,
> others seem to use 2-lane configuration. This is a hardware property,
> so the actual count should come from DT.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/gpu/drm/bridge/waveshare-dsi.c
> +++ b/drivers/gpu/drm/bridge/waveshare-dsi.c
> @@ -66,7 +66,11 @@ static int ws_bridge_attach_dsi(struct ws_bridge *ws)
>         dsi->mode_flags = MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
>                           MIPI_DSI_CLOCK_NON_CONTINUOUS;
>         dsi->format = MIPI_DSI_FMT_RGB888;
> -       dsi->lanes = 2;
> +       dsi->lanes = drm_of_get_data_lanes_count_ep(dev->of_node, 0, 0, 1, 4);
> +       if (dsi->lanes < 0) {
> +               dev_warn(dev, "Invalid DSI lane count %d, falling back to 2 lanes\n", dsi->lanes);

"Invalid or missing"?

BTW, I doubt the kerneldoc for drm_of_get_data_lanes_count_ep()
is correct:

 * Return:
 * * min..max - positive integer count of "data-lanes" elements
 * * -EINVAL - the "data-mapping" property is unsupported
 * * -ENODEV - the "data-mapping" property is missing

1. s/data-mapping/data-lanes/,
2. of_property_count_u32_elems() never returns -ENODEV?

> +               dsi->lanes = 2; /* Old DT backward compatibility */
> +       }
>
>         ret = devm_mipi_dsi_attach(dev, dsi);
>         if (ret < 0)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
