Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ECE35E78F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Apr 2021 22:21:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0662D6E196;
	Tue, 13 Apr 2021 20:21:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657A36E3EB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 20:21:24 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so11300660pjh.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Apr 2021 13:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5vd4hM8TIUo1RzgqEpGrao+8fNPd8c1Sl3okjl2RgvE=;
 b=UgQsWVZdRVQjOVJF5/lChHhgFrkLrfGkEpmZe1BnJBVnMSYFbM1Sjmbu4KBbIr6Ure
 AqtAfm90wlS5eO7S1LVe5jR2mkXdAiITLN3SkID6bE/KaQiOFl8foEC5PJAmWtJY/WeR
 afuoY61aoDYYXFaesMICWF2dTx3JYwO4TIFsXt+TbbukHA3S87shTHxYuOA1Iz+zsu+P
 3P1nS+5HjYUUInaHaeSH3L7KOhcRrfFlNnMuxsEdppKd1zj/jzskDie/RrKIqf7RNd2t
 HwRBvMHe1PnDKCtTknuP7IzEA+5AZIeCVjDxpKX39H2FXRqJKI/Hk6CBPvj6R9aQtdXj
 cvpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5vd4hM8TIUo1RzgqEpGrao+8fNPd8c1Sl3okjl2RgvE=;
 b=gI7na3cywmVIx6XuYoxHbkowIepM2TZiYDEwei3kxeV/X6/j47xILFnISBi37r9zSV
 wAWs+6lZmsKe6qJPM0GIi77rzqNjQTj0eLPufwzylUDGo1jMbYUmXwBTi5JVgEB9O53k
 VDWZXjeEl8+0SntMmoP5FAt4OzLrxx7gmKtEe0Qw4pqtJFsWCZyxmN6iFA/OU6GwjOgl
 nK3wNBaPT5mk1TgpSS6dGhLtUn+hhcNEQdEHH2oXuf+OeX7z82ZkfIozXXnf50Fw0ltB
 yAHMqBC80/Nx13oiGEcaUBbFRucBHYpMeEQATf6Fc/s0C0vA1MFOxUlsL5DzEPt5W/2v
 9shg==
X-Gm-Message-State: AOAM531j06cTdwen9Uu6o9Rb6CCKNMHvbX+Rs3bipKPtNC+w4XzwytcG
 nQMQMad9pe7finDPlXX9MVNwyhhWz8QO5paxJWENbQ==
X-Google-Smtp-Source: ABdhPJx2Q6trbmEyBPGMNkyaEggQB8G9ymoTlSsx6e9e4BsAJxS4fWCVAK1KopE210nmGmxkN456S/yZaq4pzyRbTkA=
X-Received: by 2002:a17:90a:4a8f:: with SMTP id
 f15mr1900457pjh.19.1618345283988; 
 Tue, 13 Apr 2021 13:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210412154648.3719153-1-narmstrong@baylibre.com>
 <20210412154648.3719153-3-narmstrong@baylibre.com>
In-Reply-To: <20210412154648.3719153-3-narmstrong@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 13 Apr 2021 22:21:13 +0200
Message-ID: <CAG3jFysFb+y6ymXsBQatuwtPEYRTBnWTku0EpmNyR2gR5a=Y2w@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm: bridge: add it66121 driver
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Phong LE <ple@baylibre.com>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, paul@crapouillou.net,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Neil & Phong,

Thanks for submitting this series!

> +
> +static const struct drm_bridge_funcs it66121_bridge_funcs = {
> +       .attach = it66121_bridge_attach,
> +       .enable = it66121_bridge_enable,
> +       .disable = it66121_bridge_disable,
> +       .mode_set = it66121_bridge_mode_set,
> +       .mode_valid = it66121_bridge_mode_valid,
> +       .detect = it66121_bridge_detect,
> +       .get_edid = it66121_bridge_get_edid,
> +       .atomic_get_output_bus_fmts = it66121_bridge_atomic_get_output_bus_fmts,
> +       .atomic_get_input_bus_fmts = it66121_bridge_atomic_get_input_bus_fmts,
> +};

I would like to see an implementation of HPD, since it is supported by
the hardware[1] (and required by the documentation). IRQ status bit 0
seems to be the responsible for notifying us about hot plug detection
events.

[1] https://rockchip.fr/radxa/IT66121_Programming_Guide.v1.05.pdf


Rob.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
