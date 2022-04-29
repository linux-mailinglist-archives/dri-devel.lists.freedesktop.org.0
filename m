Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9294F51585D
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 00:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60DDA10E9D7;
	Fri, 29 Apr 2022 22:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC7F810E9D7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 22:28:17 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f7bb893309so98952067b3.12
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 15:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X7DWDi3mnw06lxvrRAclT8D0DGTaerRjMkkeimWxYzM=;
 b=X8phStIDXUVrQIyZBNlLKhna9K/+/BR+8ZOGwTITAvBnhiSnmFD8pjGcAgdfxvOzLS
 BeAU1sXjE6lOVPAMCjUZNCyzTcdMcK6ROtJR0qR+kDsbDk7T54PWU6xS1CQ+ual6E+AS
 q+QLN7II9JoSk34qFHMqDx2JQ1kp4O72aGIKafCglFL5C5yVJL5TYtd34l9hTgYJFqVO
 QZB/HKe6vP0GdjvGpxY+fPKIPP6OxyLFaSMPFWyaf2+6UvaWoL7/RnkLfRrbt6v4blgA
 RoCzXYJ8lWbGx55v/62f92Wmp93qleaosBxiU9EosCMPrK5AboMBFZEKZ4pbBUh/2cpp
 azUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X7DWDi3mnw06lxvrRAclT8D0DGTaerRjMkkeimWxYzM=;
 b=Sc1wZiP8uGOhtUPPbDIJjBrVJIlV/sHryhbiBhNuklR4LlkLD80SepZz3o3qJzkfnu
 chUrwl+h+UIvxSXJO5KV2slVivGvVxzNYn3PpvgcdcJaBZl8hoIN7acU4382P/m8KxA4
 dvHoVwhudUwt50leLaTJ3yKH5FGIdqwIindd1KMhy0tRAnx/tLYiI3Zm2ZLMi5iCyFvV
 l/mvTSew4BEK02RubTVllQDvr6s+4DAHiLuaS0XZa9zIxv72sMdzsQwIrLlDFsPdc+A9
 Oppsf9h7sT3Mbg/HmyI0RSY6UMpAguym/he4KCyfWFTN2yFJPqUHP98XV92B4P2jPfam
 8WFA==
X-Gm-Message-State: AOAM532WMsF1ETAw5bR7OkAigcoxsQqs9HucfQzzHoSMIv7IXz8VU1+9
 gvsLCkpf/z3JZJ6oLWOcaB/MAzTXlzYh79G1lcZ3cA==
X-Google-Smtp-Source: ABdhPJzVVW6eItWzRzZYAN108JivqBfZczcNQu3mAgJzAmAAmvXpVkt6lyqXWRDPQzewoKPyV3lzIgcd40KrAY8fgC4=
X-Received: by 2002:a0d:c4c2:0:b0:2f1:6c00:9eb4 with SMTP id
 g185-20020a0dc4c2000000b002f16c009eb4mr1619833ywd.448.1651271297025; Fri, 29
 Apr 2022 15:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220429085947.1699963-1-jagan@amarulasolutions.com>
 <20220429085947.1699963-2-jagan@amarulasolutions.com>
In-Reply-To: <20220429085947.1699963-2-jagan@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 30 Apr 2022 00:28:05 +0200
Message-ID: <CACRpkdbMPp=W2X7EyTZANZpEFUxKWMYYr+=sxampbotgmyS2wg@mail.gmail.com>
Subject: Re: [RESEND 2/2] Revert "drm: bridge: mcde_dsi: Switch to
 devm_drm_of_get_bridge"
To: Jagan Teki <jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 29, 2022 at 10:59 AM Jagan Teki <jagan@amarulasolutions.com> wrote:

> commit <3d7039e1e649> ("drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge")
> switched to devm_drm_of_get_bridge for looking up if child node has panel
> or bridge.
>
> However commit <b089c0a9b14c> ("Revert "drm: of: Lookup if child node
> has panel or bridge") has reverted panel or bridge child node lookup
> from devm_drm_of_get_bridge as it breaks the non-trivial cases the
> first child node might not be a panel or bridge.
>
> So, revert this commit to switch the previous behavior of looking up
> child panel or bridge.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Notes:
>  RESEND is to fix author e-mail.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
