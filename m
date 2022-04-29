Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABADB51585C
	for <lists+dri-devel@lfdr.de>; Sat, 30 Apr 2022 00:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA4E910E5EA;
	Fri, 29 Apr 2022 22:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 223A110E9D7
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 22:27:31 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id s30so16830420ybi.8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 15:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5lD+Zi2/nuOyG+Z2eaGel1N6lbrlAWZkzHs2xvlFddU=;
 b=PGAe2Bi6zEC82y7uGSS4xW6wssbaWtd0pMqeBPRAFb6aFqnsjoPhJ4GX222B52f4Jv
 MJgTQB5mPOwyBiZ8GhS5kppVGMfS185TULxayfYH1/Dy+qgwh/fVWcHHqgZs8fuNVPYf
 nncIBa4nqB/0PQ/D1UuA1lkfJ2CRb/r2LQXUQ3K4ZFTSTHR/YJV3z+WyaUOuzwtFAUll
 GAP/kjVSjpSYf16/Qp90SlbikAFCkH4bf3JNuxV6Tnk9gPVcv5ieYHXoY18G69mXU6S5
 kcAQcezNzbAyRiV1RJm7DXy86GSE1jAG8L+djCf7kOqJJnWSveE0KlwbyvAo+bW6fmp4
 Oldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5lD+Zi2/nuOyG+Z2eaGel1N6lbrlAWZkzHs2xvlFddU=;
 b=1XTOYhb0D16RbXsU06B6h+Erbz2xSQsKew5vAG5O5K+MtzYRADyHZ/KQeAQ+OGwqCI
 htPsCqxp3v924lGDF/tqo7OpRggsBCFsXxnj6qcKFMaCA1lVSDbvGiuoE/6+lTXXRBUj
 gRt95ubOU2Vsxi3BtwhEC0sHnsQMZIdosWHN1oXQEqTLwwmxQhO4roBqtt5yzA77++jS
 gGMrHs6uP3umqSbOr4uaj7pi0h4eXkKtwQZI2hzep8jkNL7FvwIkG33O6WzyYixzIcbV
 ytvM34dTdJ0YJTOKdB5r7+foEa1+hDbFnl23InpeXwhkBgHZ7JtS0gYsDtjjSqCdNVr7
 F64g==
X-Gm-Message-State: AOAM531pQz7gc+TyiodhvIKxkvkvnXZU1WzYMMk1ZpwsMDStVxtzCxa2
 ieM8FqQpfxn9Ow5iGRcGPxOYm2rYDkMlV/gXlJwfVg==
X-Google-Smtp-Source: ABdhPJycV/p3a+ZoLO5uKmoyofr5vGVUE55zl85XvMA3uoDJaqKpGKVR8eV7mOE+uJC/Ws8Z55m31i573tg3Hs76bzw=
X-Received: by 2002:a5b:451:0:b0:648:2a28:973f with SMTP id
 s17-20020a5b0451000000b006482a28973fmr1684944ybp.291.1651271250239; Fri, 29
 Apr 2022 15:27:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220429085947.1699963-1-jagan@amarulasolutions.com>
In-Reply-To: <20220429085947.1699963-1-jagan@amarulasolutions.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 30 Apr 2022 00:27:19 +0200
Message-ID: <CACRpkdZs3dQYNM7_vfJtMYWgpQNfpbmDy_12SnMVCAWVezNPbw@mail.gmail.com>
Subject: Re: [RESEND 1/2] Revert "drm: bridge: mcde_dsi: Drop explicit bridge
 remove"
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

> commit <3730bc6147b0> ("drm: bridge: mcde_dsi: Drop explicit bridge
> remove") has removed downstream bridge as it's prior commit <3d7039e1e649>
> ("drm: bridge: mcde_dsi: Switch to devm_drm_of_get_bridge") added
> devm_drm_of_get_bridge for looking up if child node has panel or bridge.
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
