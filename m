Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5307123C179
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 23:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E1376E09E;
	Tue,  4 Aug 2020 21:30:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1A46E09E
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 21:30:00 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id g6so32634987ljn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Aug 2020 14:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DXZ+l5boOmi4PfYvvJqTqjFXA6Wjq2O9F72nYWVPWOY=;
 b=JgzKrtuZH86WTBpgUOKRNKHsYU9F3PSBDnitOXiCk7R/4uPe5E7uvcnvdXz5VlKYlE
 y9Rm1zWqgdRt3/8kL5iqs5nMacuz1j/P9MSMwaWqWbxCoIdo6478ccNn3w0rBZ6gF5pu
 FBW7nrAtMH8PIBReo8yLGw+dJScaW5t/pgvkkuvii0CcqmGGKG5sZyF2T9Zu0nKQtur/
 5LSt74Qq/+k+18pQo56TscKReh5zTlsAJlCCSuiQ2Y8vS3Yi3wNyf3XETpK0SX1BC5fj
 hkL+Gbo3Vky9kdKiEd18iRWGAFnYj4rzdnavBS5dVBtxUrEt6Tbl06eBmyn2dwAPmrdg
 oO1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DXZ+l5boOmi4PfYvvJqTqjFXA6Wjq2O9F72nYWVPWOY=;
 b=Ug26YBy8CpqW6yAJgn6GWas6LddoGFl6GExPy8yzzsZGEEfPr206jIXo83ygSoeWYz
 FHJ4GyZczYQJUtr4Ls5zUftV+fmrw+dCZQSKC207dyMK69uUUaCQKYVAU83wuNShwkXm
 esItJBLnr2caCFCqXynmO4uV/JMkK++0/zBE4mKRtdJBR68r7cRe2Ywr1Wwm4yVeTrBF
 3/ebqG1G0YQI/60WFIqkC+tkHamsFMX/gvUOeQnEeFdGZO4jiedKF3vwA7vdH7fxOHwN
 K0UTJSPWxeT+gsOYEnsY8FZhB330tFyTrtaRBWkg3kcr8qJPrzEWM2kV0dKpE66iSWZc
 B45w==
X-Gm-Message-State: AOAM530p/VujHzPoCUJx1HD0bQseL1uyjXqz175eDeu4HYMPMjdCtass
 tMLdHBeZuYy2T5mfa26J7zd4ZlzCjD30E0CiD2/mMA==
X-Google-Smtp-Source: ABdhPJy/O4Dp+A/qVOS3l/7+Ds5tP+PwL/M62Phh/0ID5XtPBYsLkNZTAY8xiJ8UTf4o4m6G4KhKuLmcu77FKkxYjI0=
X-Received: by 2002:a2e:9dd0:: with SMTP id x16mr2740478ljj.144.1596576598756; 
 Tue, 04 Aug 2020 14:29:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200802110636.1018743-1-sam@ravnborg.org>
 <20200802110636.1018743-9-sam@ravnborg.org>
In-Reply-To: <20200802110636.1018743-9-sam@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 4 Aug 2020 23:29:47 +0200
Message-ID: <CACRpkdY8n8d2HttA3X8MGwWtaAcaB+vs1BbN5yTLC-UoVpJbYw@mail.gmail.com>
Subject: Re: [PATCH v1 08/22] drm/panel: novatek-nt35510: Backlight update
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

On Sun, Aug 2, 2020 at 1:07 PM Sam Ravnborg <sam@ravnborg.org> wrote:

> - Replace direct access to backlight_properties with
>   backlight_get_brightness().
> - Drop debug printout
> - Use macro for initialization
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
