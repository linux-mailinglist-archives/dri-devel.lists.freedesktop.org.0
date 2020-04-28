Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC871BBD70
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:21:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49415895C8;
	Tue, 28 Apr 2020 12:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F29895C8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 12:21:34 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id e25so21244927ljg.5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 05:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=66PEvgq166rYm5NNqO/K4FUqV5SVNdU/W11wcLnh4KU=;
 b=gESl0rihIt+DG1G40TUmI/KlPAmkk1+4Aiwp1MDMPvqaBcQyaLgL0tP2AHgbZg5nk0
 Zpdq1rk6wT2WQ+bLxj3SVmtk9lXfualx8/Cw8wEteyO31K3kSq/vUb86877Of6KdH0io
 f2COEG+8BhNtvaxctV6KpKzRKGo/JVpELc5SyrcjWxVrbK+uiUKLtkQXzxgTWv2WgMiG
 Qiz0ZwMhbhudDACBVjvsTLMiMV8Sf0tjqm4cdShDq0oNkVfXuXFN6tDh9kF34y0SLf6s
 MzV7Ht5jWfSj0hMkPlHRIvJQX83Mdi5vEpjcfQ1aZMcZ/HOCfb2pg8UsWyQjOj1fdaUH
 4Uyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=66PEvgq166rYm5NNqO/K4FUqV5SVNdU/W11wcLnh4KU=;
 b=hIQAGPiioteFwN+ZPnj+k0Xl+du0yFip7g0b9PxUwHa4bP9xtATOeTpX8ZDDGIiD+f
 lEi/0DvW68y43W3eggs/v/+A8agaa7wlVcAQNSrhGLHSTDZx2n1BrDRrSFJ1pJCP+bGu
 adSmHwObZHSP+mwJ7H2pptvCthvD0VazcfBnVbi9b/HyHVtyRhANEvF901nqcDXc8RUD
 3NPpIgla1qeNi6nNg0N/Zwt2bFXKXyjpl+ZRipJ4BFLGbD0Sfvgpf3ey1jCORL3Ni6ei
 +kKrxMXkDm1G6PbnTirOEWvDEwxpC2faGKY46YRtMP0AXg2qGSVNMuornyJgxqQsP4cb
 trhg==
X-Gm-Message-State: AGi0Puaxe6Ies3/4uTR66yaGh4kG+jzGFnSY+KCsmwp0RliGZv9C2fn/
 wiXaT1zpkTWsuOozfqhaKl2jPxGhk3dukILSo6Zd+w==
X-Google-Smtp-Source: APiQypLFGrgmnKJg9/f+LHPrCacUiDgVAehn8XuE+AFvss3TzqvRIrzE2HTQI0KghqzPidyFO40ACxVTMr2WJwrJBP0=
X-Received: by 2002:a05:651c:32e:: with SMTP id
 b14mr17558469ljp.277.1588076493277; 
 Tue, 28 Apr 2020 05:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200423162548.129661-1-dianders@chromium.org>
 <20200423092431.v3.3.I53fed5b501a31e7a7fa13268ebcdd6b77bd0cadd@changeid>
In-Reply-To: <20200423092431.v3.3.I53fed5b501a31e7a7fa13268ebcdd6b77bd0cadd@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Apr 2020 14:21:22 +0200
Message-ID: <CACRpkdZEhqaiStFPdg3VOamKnCMjMsj+MMXimqmHW6eSGah+nQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] drm/panel-simple: Support hpd-gpios for delaying
 prepare()
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Andrzej Hajda <a.hajda@samsung.com>, Dave Airlie <airlied@linux.ie>,
 MSM <linux-arm-msm@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Sandeep Panda <spanda@codeaurora.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 23, 2020 at 6:26 PM Douglas Anderson <dianders@chromium.org> wrote:

> People use panel-simple when they have panels that are builtin to
> their device.  In these cases the HPD (Hot Plug Detect) signal isn't
> really used for hotplugging devices but instead is used for power
> sequencing.  Panel timing diagrams (especially for eDP panels) usually
> have the HPD signal in them and it acts as an indicator that the panel
> is ready for us to talk to it.
>
> Sometimes the HPD signal is hooked up to a normal GPIO on a system.
> In this case we need to poll it in the correct place to know that the
> panel is ready for us.  In some system designs the right place for
> this is panel-simple.
>
> When adding this support, we'll account for the case that there might
> be a circular dependency between panel-simple and the provider of the
> GPIO.  The case this was designed for was for the "ti-sn65dsi86"
> bridge chip.  If HPD is hooked up to one of the GPIOs provided by the
> bridge chip then in our probe function we'll always get back
> -EPROBE_DEFER.  Let's handle this by allowing this GPIO to show up
> late if we saw -EPROBE_DEFER during probe.  NOTE: since the
> gpio_get_optional() is used, if the "hpd-gpios" isn't there our
> variable will just be NULL and we won't do anything in prepare().
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---
>
> Changes in v3:
> - Remind how gpio_get_optional() works in the commit message.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I have a small inkling to protest against calling this driver "panel-simple"
as we tend to stockpile things like this.

I suppose panel-panacea.c is a better name at this point :/

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
