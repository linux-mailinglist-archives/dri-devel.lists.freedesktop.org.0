Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1B449D384
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D458710E90B;
	Wed, 26 Jan 2022 20:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C606210E8F3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 20:33:08 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ka4so997023ejc.11
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 12:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ukliw9sukrQW6ow50YsY/2wbM/35BtcU0cL0HgzMnLM=;
 b=dw3QQ8Vjz4RduwkU+DfXuqaAy+1poDrHZmp7JJYsjaLqADGSWcua23elXiKOBrIfvN
 7CO/frPtzzCycKqxFaHsQjgqaBwhlBkfaPAiAt12zt7dDGhFRZ5HSbU8Tc3NkGYqK2HZ
 tJP3A1aldRNXuDeTtmADqnlbwfkrUlb4gBabTRzK6sM+zretwoncESlZN2lO8P9oGNN9
 bWlOLWD9XRdqWJSO2ppjA+34On1U64ijwC2ttfBT4VlMrCx0fZArv7BU10l7JL5KmR9d
 b+41zKo6P3DKTs3CiIBfV2ivx6KvXZ+lrQoJA/LTagjK6/Ww+5IGQ3IjvDlOnoLjnTmW
 Yw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ukliw9sukrQW6ow50YsY/2wbM/35BtcU0cL0HgzMnLM=;
 b=w+2kIeZBNI8IOsXjRy6aFeEIGFAyQUM57Yho4dMzN0V37QqFab7lfct8Rzjd3eP4AF
 Ev/+OYPCYC1JebEjpADw7jWBpKjBEo9P3FS9dlPiCges8t3GD0T+NAadq6cVOJXoPJ84
 NjNw3E93M8hh7Xb/RiVmxCHj94OyMNjnY4tNLQoLRScSUEj2dURisuWu0aJ0Gg4uHYze
 1cuWeEIPmCRlJFosw2DVUerH/Qhn2pR+Wd5+uqdTq36Q4S2fCvKJj0hBzk/2bQpR6nC3
 lZY0Z/moQ+OyNlqS+xsefALMUZbGj2B/OBkC5oMWTrSLwwtNjRHtU5CrCyuy14Rhojey
 n2OQ==
X-Gm-Message-State: AOAM5334uMLK3v5dNgEmyNUpdcuS/57QD52jktJro5aTDW32RjZFTZEx
 Mr/dfRwG3HKWGfHHvEY/8VGesqCD5Im0ms8ccjk=
X-Google-Smtp-Source: ABdhPJyQZXqAslD5Wtaiq3Z87kAq/zpe6tUPp3S8ENbcd+fSsQYcZRU1nOoYAZmA9Ux5tlyjLlB5qq2nd3AnF2TWv0w=
X-Received: by 2002:a17:906:478c:: with SMTP id
 cw12mr414096ejc.214.1643229187072; 
 Wed, 26 Jan 2022 12:33:07 -0800 (PST)
MIME-Version: 1.0
References: <20220126202427.3047814-1-pgwipeout@gmail.com>
In-Reply-To: <20220126202427.3047814-1-pgwipeout@gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 26 Jan 2022 17:32:55 -0300
Message-ID: <CAOMZO5CesC_mZDHhF93_1u6rMrmtc-pMaB8X28CX-npY_5BaDA@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: synopsys/dw-hdmi: set cec clock rate
To: Peter Geis <pgwipeout@gmail.com>
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
Cc: DRI mailing list <dri-devel@lists.freedesktop.org>,
 Archit Taneja <architt@codeaurora.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Pierre-Hugues Husson <phh@phh.me>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 26, 2022 at 5:25 PM Peter Geis <pgwipeout@gmail.com> wrote:

> +
> +               ret = clk_set_rate(hdmi->cec_clk, HDMI_CEC_CLK_RATE);
> +               if (ret)
> +                       dev_warn(hdmi->dev, "Cannot set HDMI cec clock rate: %d\n", ret);

You are setting the cec clock rate after it has been enabled, which
can be glitchy.

Better to set the rate prior to enabling the clock.
