Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F152B5A2716
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 13:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288AF10E66F;
	Fri, 26 Aug 2022 11:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A86310E66F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 11:49:22 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id u9so2694099ejy.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 04:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=fcEZ7y9OKsDtWnry1s2WTYtx/TzTKQLxqLfeJnqqoUQ=;
 b=p059m5G+jtpGEb7etdIfGWCYTMMqhKmCWd27JJblHTT2mWeAqlaVcFxjTKzK/uTlni
 d3r7xzDwgPRGbqqIcdqaqTh/Vn8MX/y7FmcZ5xeep1NHS5TEvvftknQ0s4bhoY+EMl3U
 RFueIjVJcRTdm6NRaLPyAYhtvEPAkVN4F7uKK3MCAGh+PObLdEAkqpxWCgCQijQAhkFu
 ZhN62zjl1ldqdKAv+3F2oOS/zIIcfjnXsnFwIsNfzEoxjBO8pAYe9g0D5/FjN6BpGzVw
 z7PrMfcR17qxsflt1VjdZ0ZDrrXzbDONlqxIH74BiEY7WvX39QWhv8YMgfemiVjD8Dpp
 Dvaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=fcEZ7y9OKsDtWnry1s2WTYtx/TzTKQLxqLfeJnqqoUQ=;
 b=4H2qhU/hv8+LSKErVDGTXCluMK/P0EKfzblXFG8MSWL/24fVXbErOVldv2zR1lT3rq
 KqL98n/7gVwLAlq2MMshXtELL79OVHMhdYZ5Ct4YWxfOHqcEubbktUlDklyTN8i7WyAt
 QAVfhUMrWJToOhhYA/+KM1aROq0xY78fIbsa/cGbQAzKd09fOq5tZGCcW97poXcK3Hbt
 fgugcovUBfSCeRdaRaHPxI1IOz2qQ80qXOqzaUrkwwmBZTYlWLmMAeg0rb75DYOvUPgN
 JZ5uCYH24aD2X2rGJQcD39OMtCifOCLdRQKpf6EY3KrtIJ8yA0hMtHp5/QxONXYApA2p
 5RWQ==
X-Gm-Message-State: ACgBeo30xOf33DFt9s0H0tsVDG8Gc04xcNocdvLPgzkqAN4zHRsthOFK
 rJbhPhaXYTG93vvXiF2bbH0wJrvASqh1SJqtWxkzdA==
X-Google-Smtp-Source: AA6agR6w5yHyrBtXDHikGrHQeA/rqJ86b7LMjr/PFIp3Y4j35B/iQ9tl9ArhcbpLpMPc8cS3VMOiunefG0aQbUBluJs=
X-Received: by 2002:a17:907:72cf:b0:73d:d007:e249 with SMTP id
 du15-20020a17090772cf00b0073dd007e249mr5030357ejc.500.1661514560683; Fri, 26
 Aug 2022 04:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220801131555.182969-1-marex@denx.de>
In-Reply-To: <20220801131555.182969-1-marex@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 26 Aug 2022 13:49:09 +0200
Message-ID: <CACRpkdZg87Py8FMherWgn67=522DWV30KmQ4_4yBy1cTS+S1jg@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: icn6211: Add and use hs_rate and lp_rate
To: Marek Vasut <marex@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 1, 2022 at 3:16 PM Marek Vasut <marex@denx.de> wrote:

> Fill in hs_rate and lp_rate to struct mipi_dsi_device for this bridge and
> adjust DSI input frequency calculations such that they expect the DSI host
> to configure HS clock according to hs_rate.
>
> This is an optimization for the DSI burst mode case. In case the DSI device
> supports DSI burst mode, it is recommended to operate the DSI interface at
> the highest possible HS clock frequency which the DSI device supports. This
> permits the DSI host to send as short as possible bursts of data on the DSI
> link and keep the DSI data lanes in LP mode otherwise, which reduces power
> consumption.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org

LGTM so patch applied to drm-misc-next

Yours,
Linus Walleij
