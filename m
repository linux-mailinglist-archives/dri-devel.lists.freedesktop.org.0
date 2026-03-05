Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEEBKJI2qWlk3AAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 08:53:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA6020CF97
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 08:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C3389BAE;
	Thu,  5 Mar 2026 07:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2589489BAE
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 07:53:50 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-45effa36240so5774817b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 23:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772697229; x=1773302029;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7xyHjzGnphi32H4Bte19x6wQV76UaiJqzbc3zMkJKs8=;
 b=EwuU9eh75nszr3TEH5cO88X3ncYDvEK2uOMQ8plWGtvebb/lzjUFRpyimDNJ5qTxU+
 WG7rnZtivoNht0RAnmLWpmLW7YvtpuUpt6wMEJ5nNcRPFJYu0BxXoJJH4CSnoq/evGbJ
 aT5ycrNMzDKWY9lB7FLp7V38t6MmmBLYYYc1XlMPEsawWNz+PZok9GsbqRkw2TgIzjQ1
 N0iSpIkAqMWkbVElkF6XLuY7vwgzmcehTAs7+S6K1vDGuicT+AK87WWdX8oDI5gvIPPw
 4CHF7v+60W0ZKr3EPZ3EuYDau++xOCfJvxe2Ad5MokkNDaSZrZuGbEFvvgp5+vGtj9JG
 OnMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD+0qxl2IgPDzVa1DwPFpCbOtaY8jEEzRXUABgNh5+8Bvikka7np+kwFQ1IZEObujYs+vyS6HTmAc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxN/U8McVh5xVWwagNOiDXHgzA5EOv8kBJispX2KxlAmIB0KInK
 54HJBPoW3NoNsA5BPkfFwokonD5JVuXquTg47l+1HfU4y8+psHSMwMrqTgCyglO+
X-Gm-Gg: ATEYQzzEW2kAfuYwtnEeyVkR9I0g3nfCzwIJNwW+oBGwtrQS3wh40iPqZUhipTl/3bQ
 0MNY51mtaaiuO4DDgM7uRL9x+vWkP2flAc7Fu38+SWQOqpkAJVwHcFPYDNYa2M0m6aMsd8wwyJ+
 FN6g1D4K+hNk/ihOCcxi1DgUZ06RecxSfUjmWafl0NrYWC8lOxyTtJrA4wdleA4tC7U9nm7jSPB
 hbWmr77/4bIyMJ/xMqX/zT4nP+73uUvKAJkIU+Db7kpqljJH+IDpewCXbonpvZg0fWULU31sUh4
 ENuPUXM7MxKTF19883AXdNOpxsq1UIG88Ew5V5g0q1qLRcCxaX3Wq9zJb0NpC1MIVNejV2OVTGQ
 IZ7X8bg7acDkeVTcaPocuQVJ7QqENpIY34LJ/Thabbt9OFzcYRjW4g0bCzwnfmW5hcwyyw6g2Rr
 5fyVbsZdNRHa9bQiEDgno61mYUlfpUsh+eZAUuDVFEJEVksjwGrFzhsHZLKPep
X-Received: by 2002:a05:6808:c178:b0:45c:8fa8:7497 with SMTP id
 5614622812f47-4651acb02c8mr2780261b6e.34.1772697229132; 
 Wed, 04 Mar 2026 23:53:49 -0800 (PST)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com.
 [209.85.210.53]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4160d20ec7fsm20206393fac.11.2026.03.04.23.53.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 23:53:48 -0800 (PST)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7d513bc15c7so9379976a34.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 23:53:48 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWOl4lyngEFLa4mNIz0RX+zNZzeafUYltdgh+sJ1dQai4pgDGZc2dN8xEf1USgpkn5OHuucL9IksKU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:32c1:b0:5ff:a16b:93f9 with SMTP id
 ada2fe7eead31-5ffaae2d5b0mr1883200137.21.1772696877960; Wed, 04 Mar 2026
 23:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com>
 <20260304175735.2660419-14-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-14-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:47:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
X-Gm-Features: AaiRm514iMGAdfTBAVsgfVfK-GGHy9jHY4ezK-Lp3w09-JWpnENLQ0I4lkIFgvE
Message-ID: <CAMuHMdUNtqsui3ek1RYCTyiuDLRajpSBMnrdzED6wu6i7-QcuA@mail.gmail.com>
Subject: Re: [PATCH phy-next 13/22] phy: introduce phy_get_max_link_rate()
 helper for consumers
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
 netdev@vger.kernel.org, spacemit@lists.linux.dev, 
 UNGLinuxDriver@microchip.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Magnus Damm <magnus.damm@gmail.com>
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
X-Rspamd-Queue-Id: 0AA6020CF97
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vladimir.oltean@nxp.com,m:linux-phy@lists.infradead.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:freedreno@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-can@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-ide@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linux-usb@vger.kernel.org,m:netdev@vger.kernel.org,m:spacemit@lists.linux.dev,m:UNGLinuxDriver@microchip.com,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:andy.yan@rock-chips.com,m:mkl@
 pengutronix.de,m:mailhol@kernel.org,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:msp@baylibre.com,m:magnus.damm@gmail.com,m:jernejskrabec@gmail.com,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[42];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,intel.com,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,rock-chips.com,pengutronix.de,bootlin.com,tuxon.dev,baylibre.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,nxp.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,mail.gmail.com:mid,glider.be:email]
X-Rspamd-Action: no action

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 2 +-

For the Renesas part:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/phy/phy-core.c
> +++ b/drivers/phy/phy-core.c
> @@ -640,6 +640,12 @@ void phy_set_bus_width(struct phy *phy, int bus_width)
>  }
>  EXPORT_SYMBOL_GPL(phy_set_bus_width);
>
> +u32 phy_get_max_link_rate(struct phy *phy)
> +{
> +       return phy->attrs.max_link_rate;
> +}
> +EXPORT_SYMBOL_GPL(phy_get_max_link_rate);

Any specific reason you are not making this a simple static inline
function, like phy_get_bus_width()?

> +
>  /**
>   * _of_phy_get() - lookup and obtain a reference to a phy by phandle
>   * @np: device_node for which to get the phy

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
