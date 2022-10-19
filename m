Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DEC604F76
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 20:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7579510E36A;
	Wed, 19 Oct 2022 18:18:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9943E10E36A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 18:18:24 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id bs14so23263568ljb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 11:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=DYmA2npJfXhHXFoKn9kFfgCa71PIgLYjoU3KPYvRPHA=;
 b=kGRprgSUM8lTBlW8zqBWoIwTa5uCiuXkO78/MtHWCgThCp8UbJGApDkGXVMtxq4SIA
 PLHeEkh2/eloOwCwlQh5XkWVwk80krDYZjOHQBv27A7p9OWppE+2GVNww7sqRttyOtxp
 dFrt0Vnon2I5yZ7XbP8lyhX4qVMaVhrGMi3RY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DYmA2npJfXhHXFoKn9kFfgCa71PIgLYjoU3KPYvRPHA=;
 b=pzlViqZWGWL/pEs3RqAXXJybdLROmMAvjSqA76JZuUSquGkpAiRtGxzas1DQKEDMhV
 fFIGbpJuppG4C78IDawKQT2S+KYqcjkfOVJV6bjUpywc4bAySkLmrXIiLT3fYNZNZdhK
 sPsJB4QrVGiG0KUVcieMAtWSP7yCvOJIaHgvWlCcJ2HVbnuT0sxvkxD8z5CjFx7kU/O7
 q84fEmKyDnf4Q3ETXaKXqF/DKh/MdZQF+PGCR1JeRGby5AmS6r/bdS4USj6rAUYAMXwH
 Gb4p3yWcIvXMOzfaxy5jnCzwONz3DGAKWLelvY4uBgSDQAsVNt95DQh4XjPEmmjF3avE
 Ae0A==
X-Gm-Message-State: ACrzQf2VkYzUdx81pMJFtdR0L7b6WLAwZFFwIKxoKGNbRbJShRotf2TN
 JhmAFL4CAIhlN+nuaFD+CLc3tEYjnr8GutxWjWFMMw==
X-Google-Smtp-Source: AMsMyM4OHbZpFn4TlgBY8PVtEg6nRKnm608OiyAU1q0PQj09/Mu1jAmz9crlKqa1XYSQsQ6jiD+jnNAFTXJZe8lFGw0=
X-Received: by 2002:a05:651c:4d4:b0:271:7c44:fbe5 with SMTP id
 e20-20020a05651c04d400b002717c44fbe5mr1654120lji.39.1666203502862; Wed, 19
 Oct 2022 11:18:22 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 19 Oct 2022 18:18:22 +0000
MIME-Version: 1.0
In-Reply-To: <20221017121813.1.I59700c745fbc31559a5d5c8e2a960279c751dbd5@changeid>
References: <20221017121813.1.I59700c745fbc31559a5d5c8e2a960279c751dbd5@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 19 Oct 2022 18:18:22 +0000
Message-ID: <CAE-0n51Fdp6hGqWdBy1zgb0XwqQXPveG7tQahP4hjM_Jg9hkYw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ps8640: Add back the 50 ms mystery delay
 after HPD
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
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
Cc: Philip Chen <philipchen@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Rock Chiu <rock.chiu@paradetech.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Jason Yen <jason.yen@paradetech.corp-partner.google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2022-10-17 12:18:51)
> Back in commit 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable
> runtime power management") we removed a mysterious 50 ms delay because
> "Parade's support [couldn't] explain what the delay [was] for".
>
> While I'm always a fan of removing mysterious delays, I suspect that
> we need this mysterious delay to avoid some problems.
>
> Specifically, what I found recently is that on sc7180-trogdor-homestar
> sometimes the AUX backlight wasn't initializing properly. Some
> debugging showed that the drm_dp_dpcd_read() function that the AUX
> backlight driver was calling was returning bogus data about 1% of the
> time when I booted up. This confused
> drm_panel_dp_aux_backlight(). From continued debugging:
> - If I retried the read then the read worked just fine.
> - If I added a loop to perform the same read that
>   drm_panel_dp_aux_backlight() was doing 30 times at bootup I could
>   see that some percentage of the time the first read would give bogus
>   data but all 29 additional reads would always be fine.
> - If I added a large delay _after_ powering on the panel but before
>   powering on PS8640 I could still reproduce the problem.
> - If I added a delay after PS8640 powered on then I couldn't reproduce
>   the problem.
> - I couldn't reproduce the problem on a board with the same panel but
>   the ti-sn65dsi86 bridge chip.
>
> To me, the above indicated that there was a problem with PS8640 and
> not the panel.
>
> I don't really have any insight into what's going on in the MCU, but
> my best guess is that when the MCU itself sees the HPD go high that it
> does some AUX transfers itself and this is confusing things.
>
> Let's go back and add back in the mysterious 50 ms delay. We only want
> to do this the first time we see HPD go high after booting the MCU,
> not every time we double-check HPD.
>
> With this, the backlight initializes reliably on homestar.
>
> Fixes: 826cff3f7ebb ("drm/bridge: parade-ps8640: Enable runtime power management")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
