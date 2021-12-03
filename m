Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD654466F56
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 02:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BC36E0FC;
	Fri,  3 Dec 2021 01:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9884A6E0FC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 01:51:50 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 m37-20020a4a9528000000b002b83955f771so519140ooi.7
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Dec 2021 17:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+aU1FZVep5hNwcFj6bmAba50FjRI/ltWIZ16DYNnIGA=;
 b=N7OF2583fEDmizbOmvRYnkpfZT93YEBncq9hnq85jlidjhoMePMAp06+j5M69LuaPh
 qsId6+csYsMtmOeURg6xkLIAjj5OBVfhBZu7FArYKUzlsBWl1xx+GkYLXIQcD07l3yNI
 gz4oeJfAAB/rn6T3EuqRD8KkfgLb9n9d+uw80SM5mg3iGlJdouJpirSJ3r74iti2rkSJ
 Q/TOfHzhFo2SAEjlDox/So7yxUh8use4aDmV4kGPgMha3TvLysEWDHRNxIWnyKUZS/hl
 YKnlXCJQj28b9plcwHfb0UkriKD+Qdvi1/2ALKZSAiEnMkQNUiSuFxIZi6tso2o5ezPm
 hCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+aU1FZVep5hNwcFj6bmAba50FjRI/ltWIZ16DYNnIGA=;
 b=TFOC/Y28X6GC+8giV8WqgArjJWfMKp+Ngv3ICC4x5J61voC/lXx8oE/ra4N8lRkmUI
 cqGCkxp9Fd5h/LyKI7NXbFDEnjBWQA+mO2MhbByHfTKEz0ck7r7zt8IcviOyHsenTZGs
 xXh8hqdmqjOaEaA+Z8TnK5Caz33F5l716iXGZ/PuRvgScn20Gv+ilbhh9BWHuoJwB6Io
 XigsI5QJNIW09L3kFyqHtx0CTGvqerZXRmQt25mR7JIIIMYCVSzCnJZJmu7KVzUJZ2UL
 ZOYmZgtPAuMU4B5kN66+AvKnDm8WcOExEpk7wuL9vkmY0smK4zPqfRcz/caIPpsBaLz4
 yJdA==
X-Gm-Message-State: AOAM530S2Y1gwZV45knx1zvFMKPwrXOQvwIP9rAHgU4JwBnDT3XeTUb/
 kCICVIz1XvSs3aHPuh2vpTj76dLwCDyBJOWgXtMGkw==
X-Google-Smtp-Source: ABdhPJy+E2enGXW2BZTWyy52ObOiGXworrn7TaAu700osVmrszldA1sRllG22o2QwrneHsnoXpIe0ViKVme+U9Asy2A=
X-Received: by 2002:a4a:e155:: with SMTP id p21mr10809521oot.84.1638496309854; 
 Thu, 02 Dec 2021 17:51:49 -0800 (PST)
MIME-Version: 1.0
References: <20211202222732.2453851-1-swboyd@chromium.org>
In-Reply-To: <20211202222732.2453851-1-swboyd@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 Dec 2021 02:51:38 +0100
Message-ID: <CACRpkdbDNYroj=RvxRhffiGLKSHD=1+LNUGpxf7bxt2rzXrMkw@mail.gmail.com>
Subject: Re: [PATCH v4 00/34] component: Make into an aggregate bus
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: linux-fbdev@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Xinliang Liu <xinliang.liu@linaro.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Paul Cercueil <paul@crapouillou.net>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Vitaly Lubart <vitaly.lubart@intel.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 Chen-Yu Tsai <wens@csie.org>, Sandy Huang <hjc@rock-chips.com>,
 James Qian Wang <james.qian.wang@arm.com>, Chen Feng <puck.chen@hisilicon.com>,
 Russell King <rmk+kernel@arm.linux.org.uk>,
 Tomas Winkler <tomas.winkler@intel.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Russell King <linux+etnaviv@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Takashi Iwai <tiwai@suse.com>,
 linux-omap@vger.kernel.org, Yong Wu <yong.wu@mediatek.com>,
 Tomi Valkeinen <tomba@kernel.org>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Sebastian Reichel <sre@kernel.org>,
 Tian Tao <tiantao6@hisilicon.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 2, 2021 at 11:27 PM Stephen Boyd <swboyd@chromium.org> wrote:

>   drm/mcde: Migrate to aggregate driver

This also works fine after the patch series.
Tested-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
