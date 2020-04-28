Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A52D61BBD4A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08B7D6E188;
	Tue, 28 Apr 2020 12:17:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877C56E188
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 12:17:33 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id d25so1770038lfi.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 05:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LMRN5qxFiZK7LH7wFWLeZOcUrBLsRhKOimHQVM7fOfk=;
 b=cpxZ39XBlCTINntejfucjY+fxwFnKaspaM3tU4nQp/hop/2uuOah5PTPJIVYhBsP0W
 lfbrOouP0K5/qArfU93epvXV9Y0O6xB64TrG2LalkHRUXMuhtF1VOGCuunlHRaSWlCvU
 UHkcTxvAalSafoniWBgo7ypiQQoQkfcbaM7lr8XOmc03Hs2/vYdnvaGbEYi7RwmhyLgh
 Ix0qkhnBs+3QBU4zUqNxIMJE9AGHOeu95Yjh4jGOIRVTbFV9eWhbfrJs5DKMZu0bEYCE
 nPaF6CiFGEo7dZEoqMb+u78l257RyVEql24fQGrFjpdihMl/nM+w9d0ScNBUeGpLfumj
 egvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LMRN5qxFiZK7LH7wFWLeZOcUrBLsRhKOimHQVM7fOfk=;
 b=rc7hYGpXZtTjN5MirWvcm+jcPH/qXjUp+uNTVvFzz+tOAN8R6rGj6cLq6G1jZ/R/vK
 8srYwznrtw90Tl6aCUW2fQJeM/adZ2YGMVr1GrdepDbyjPrDc9p5fl468qUkoHSEY60m
 Fhd59GETytkX2eHYnJ3WVXIxaBmEZmOK4yjEdhCEztA1gzEY0wNe5ZEwVkVb97dbYmUp
 1dVL5og8oXDL1IKJ6k8Ylt36MVnqyxIPIYbbv0d2CAwXRyHhTW9/NtoGS25tNBsDWZVF
 Txn0Mmf96MaZ/bxcm4DeOjgK0j/29oph45QUEP7ZMYL/NZbj4aKEQRt0mFairZ3Qdut/
 f0IA==
X-Gm-Message-State: AGi0PubU03BjHSaiOdz6bD/iEF+NgAjJe2O2oJ8UBzFeuhmdCDoNPMxV
 MD1W5hfuyRMRT70jFQMTEqnmUdcLUeh0n0S2bzfg5A==
X-Google-Smtp-Source: APiQypLWMYHDowDI3oIfEvtVytKcitjHf4lYdOHlnfwZ2JMiRfn25SLHbT7DdEte3F2EYP1mH2KagEeErbh4nPD3DbI=
X-Received: by 2002:ac2:5c4e:: with SMTP id s14mr19256598lfp.77.1588076251617; 
 Tue, 28 Apr 2020 05:17:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200423162548.129661-1-dianders@chromium.org>
 <20200423092431.v3.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
In-Reply-To: <20200423092431.v3.2.I1976736b400a3b30e46efa47782248b86b3bc627@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 28 Apr 2020 14:17:20 +0200
Message-ID: <CACRpkdZuMALENkGjOUuQqS1pTH2sXkj1Z59mPjOrBynnkAQdpA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: display: Add hpd-gpios to
 panel-common bindings
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

> In the cases where there is no connector in a system there's no great
> place to put "hpd-gpios".  As per discussion [1] the best place to put
> it is in the panel.  Add this to the device tree bindings.
>
> [1] https://lore.kernel.org/r/20200417180819.GE5861@pendragon.ideasonboard.com
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
