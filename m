Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E88255133
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 00:34:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDFBA6E037;
	Thu, 27 Aug 2020 22:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BBA6E037
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 22:33:54 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id v12so3770742lfo.13
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 15:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w+PtlDAsfOt6eT0xfaxmYK8gcDEVG+a09IcqwhhIMdA=;
 b=j5Xr4VJi2hyrblI/4zCmMqGizYEVbTGWWFxx/d35+xOHZACRhuWrfi5Pphpmfy98pX
 lNPtzaBNbw+0LcHPjXNZ+JCDxBjlXPSDqGna34OF5dvBgofcT8HNRlwD0r7SFhqxmSSW
 PPaz+woua6tczjtiN91LT5Fg9cBn7N8mDXcGE0/PBNYfemALcHNPQhD52yhaBJ8kC49d
 p27eUZVES2d0LXMyYZCHdG5lNwDsQBp+6VuoZNf6QDHq0+fOlR0eCwe2xhGbYkXdd7+Y
 bRX7ETAKFDZZHuT2t3MZoNOmJa5ANBxgqxq7JBu5m79mkeVbbpfZkI+nOjsftS+5wZGO
 w2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w+PtlDAsfOt6eT0xfaxmYK8gcDEVG+a09IcqwhhIMdA=;
 b=d7aE7LaaiEDTWKX5KNeZdOERlwa3jomXUeo1oS3ul/vTtvd4Hb5wtHF4i8i///ggEv
 jewpbVQ354FqOZHlxrgOohFU0TmB5JemP6u/Fhk85XqrOb9AqVaONdGA2de3UGaeO5nQ
 LCodXJEbYKgrcrG+Rlb3aXprc+ThCcUY0UtroDArAE/MC/s7o1nhjtjbUb7XtjTzfR87
 FiCXVBjWLI4/39EkNpG3StGzGMg7EDzGf1tXzVa2pBhMIibM6CxD9fEMrUR5A7RBwmIj
 LGpZM5d9hpuzUVsedB5YYjwItPu61gwK5pP8f0uvmbCR0UcmTCRY4bPQCtecXI5746SQ
 reuA==
X-Gm-Message-State: AOAM5319ZV3IB69gXsGXkhWlBkD9OHQvVya5Uv65e7gWqvIENU4OZk8X
 qN/jmDSKUMns2BEQXBm90Qsyn8q4iOhBiGCaJAr/1g==
X-Google-Smtp-Source: ABdhPJzaVQ2o3RmXmtITrfpwW0e1t7LdnhyUBg9LlzxQQZeWvQlJ1Ley2oUVOacCca/DhtQqzGIghwrJBLxqEnaNotU=
X-Received: by 2002:ac2:4e8a:: with SMTP id o10mr10681913lfr.47.1598567632954; 
 Thu, 27 Aug 2020 15:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200823104532.1024798-1-sam@ravnborg.org>
 <20200823104532.1024798-11-sam@ravnborg.org>
In-Reply-To: <20200823104532.1024798-11-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 Aug 2020 00:33:41 +0200
Message-ID: <CACRpkdaa+9uzpSbGPYArYJx3o2S5-WgKpoToFWEMiSMBh_yqew@mail.gmail.com>
Subject: Re: [PATCH v2 10/24] drm/panel: novatek-nt35510: Backlight update
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 23, 2020 at 12:46 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> - Replace direct access to backlight_properties with
>   backlight_get_brightness().
> - Drop debug printout
> - Use macro for initialization
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Looks good to me!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
