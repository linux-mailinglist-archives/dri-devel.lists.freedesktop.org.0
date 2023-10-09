Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7499C7BD65A
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:09:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709CA10E241;
	Mon,  9 Oct 2023 09:09:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FFDB10E23D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 09:09:17 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-406619b53caso39071415e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 02:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696842556; x=1697447356; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Hu0+ThQAo+g9milkUYpUIIdlEQpDV2pWkgKvoM+zN8s=;
 b=tE3mM54G9yDT0BTfoZbTqsbuuwz+y0jJyvXg63TH0mpZ6Lmw2QLeVXoSvfl7LqSJsz
 aAEXo9nshnSuVazfr7SNNUstFS3f3QxJpSmzkZTrBlRc+JzSOQpypd5jhz2x1kboPOdw
 tTJKTshva2ntWxhxnYm+XOl4skLigexqXr+6V15AEoPx+QT8LhFZwW+VpsHznGD8WhL7
 hRxh0QkUpu9kOttq6O327LpOIXTz5cM90B5/4pf63AdUS+W9TEZkBVtGl9+YOM6+inBw
 vgotYTXi5P0JivTNRexfXoKnGCf4r8fv2C6vE7bAKo4dkTIMtpScinjUqOlQUfGK4srC
 Vv7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696842556; x=1697447356;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hu0+ThQAo+g9milkUYpUIIdlEQpDV2pWkgKvoM+zN8s=;
 b=HMc/VMBfqAQ5oLV2w8pYjExd71Z12hd/MKm99MkXLfMuF14w35gj5+SuHjZdMlTJUE
 I4tT70Cha3BeJIWAqRtKq0t/V5jFY9Oo8vWjtSbOqcD6zDNU2XDcs4/rOmRbKFfcFLxd
 SsnYq3zwpZhVvDpA1KbiSStpN8VjgXtO4UkDV3cXdvW5fZosmLvWYstcFrhnmD1ccVfJ
 1nbDj+dnPrIxuA9a1FZL78KiOikPZGkBwT9muU01GIpOuVmS6T6lxw2vT2B8xd5ER9SG
 N8F1T6xRWnXbFtG5cdICAGujpIsVPS4eGEzZwIOg9P9D8tpsKck2odMFGUGyN6pXuWfG
 Z9zw==
X-Gm-Message-State: AOJu0YyNIwLL9uiC/AB3iQNh5MhIXyG+D27sNx2vKs+84I0SKknbh3uF
 /en+ThK/M29XU9Mzg1Oa7N2TNw==
X-Google-Smtp-Source: AGHT+IF1gfeKffTkLyBV4zT0Aa0IN2FUuZ4jVafuElp2ql/w0uc+4jVcF3RfnhlbHDzrhtAIg3iwHQ==
X-Received: by 2002:a1c:ed17:0:b0:402:f8ea:be3e with SMTP id
 l23-20020a1ced17000000b00402f8eabe3emr13000541wmh.7.1696842555840; 
 Mon, 09 Oct 2023 02:09:15 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a05600c219800b004013797efb6sm12864525wme.9.2023.10.09.02.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 02:09:15 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Michael Tretter <m.tretter@pengutronix.de>
In-Reply-To: <20230818-samsung-dsim-v2-0-846603df0e0a@pengutronix.de>
References: <20230818-samsung-dsim-v2-0-846603df0e0a@pengutronix.de>
Subject: Re: [PATCH v2 0/5] drm/bridge: samsung-dsim: fix various modes
 with ADV7535 bridge
Message-Id: <169684255481.1988265.17594322174846257761.b4-ty@linaro.org>
Date: Mon, 09 Oct 2023 11:09:14 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
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
Cc: linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Marco Felsch <m.felsch@pengutronix.de>, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, 06 Oct 2023 17:07:02 +0200, Michael Tretter wrote:
> I tested the i.MX8M Nano EVK with the NXP supplied MIPI-DSI adapter,
> which uses an ADV7535 MIPI-DSI to HDMI converter. I found that a few
> modes were working, but in many modes my monitor stayed dark.
> 
> This series fixes the Samsung DSIM bridge driver to bring up a few more
> modes:
> 
> [...]

Thanks, Applied to https://anongit.freedesktop.org/git/drm/drm-misc.git (drm-misc-next)

[1/5] drm/bridge: samsung-dsim: add more mipi-dsi device debug information
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3683182a7254f728778452814abe2437a12502c3
[2/5] drm/bridge: samsung-dsim: reread ref clock before configuring PLL
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=eb26c6ab2a11e6c595ee88ce30c7de9578d957aa
[3/5] drm/bridge: samsung-dsim: update PLL reference clock
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=846307185f0ffbbe6b34d53b97c31c0fc392cff0
[4/5] drm/bridge: samsung-dsim: adjust porches by rounding up
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=198e54282ae560958e64328fe8f72893661b9e8b
[5/5] drm/bridge: samsung-dsim: calculate porches in Hz
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=6acb691824933535219dfd94d9d97c922f5593d2

-- 
Neil

