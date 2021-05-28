Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7724A393A46
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 02:31:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7F16F52B;
	Fri, 28 May 2021 00:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB716F52B
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 00:31:28 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j6so2708420lfr.11
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 17:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nACOEvpFPcdmw/HFjZn82A0S5koii2HQf8n4dSZ8kUc=;
 b=He9atcVUlHOl31CBA9dnNly8sJj3fpy0sjqip4IgivvZiMY6nJj6LKbRS8c4oqRw7w
 xtlA6u58J+k4wpgTjwAiRfSihTmKOQCh3ku8VwR1DE06L0BRvlY6APIjntzcq4rsW4QU
 UNdrYzJTU3pPlsnt5W6uZiuAJs0sjALtd/niqUs8SdPeatLGMZPWCSLM9wlQ5aAbqWxj
 P3buPWbFsHpW/vgtLuLZS1kSUt53VNiXAsvWZs5LEmECxQ0Z2IToJDsSMbafQ0us34wq
 jQW0gC4Ypn/kYPw7f2anjK5Rkio4nslpi8CehAmR+HZWbpGLAd2DFDO/MBjo7bYA/u87
 AjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nACOEvpFPcdmw/HFjZn82A0S5koii2HQf8n4dSZ8kUc=;
 b=mKzP/yy++2d0wxEQJtJS1GLMlulql2EMajYMIM4LPq/lNRaNIbIfkxbPOJa1uzEJhx
 qoX2dY0C/JfOynUMhOjnO+5FJdFBJGGtvay060I6AjSkJwlgJbISk++rK2DdQi6c6k1N
 SedQ9WmJyA4ENXkPFwbEpO2sdqKrFW/pCbIzdGs3Zh7vD5zMWeaaw1EWPZMYnJakGYSC
 M29uF+XGvHPVP8kufHPAELoMkCVtk8Pzh6AnvojDtXGMUv5hH4vRbi1QW9cqXGXEaCmT
 l8Vb8BjmDQK+8lS6aNQaLgTH4SR5Sp5slI/lpDemkUboZl15NNI3FuD+fwSyA81cJFiO
 m1Dg==
X-Gm-Message-State: AOAM532IJHUOgz5qjoEdgdoNMFbELdOF9CTixmBdic2ymq4QaBA2yM3O
 /o+y63+YQGcXyO2VXrGxgawM9xf6BPZJIiOfM04A9Q==
X-Google-Smtp-Source: ABdhPJzyNmeLKVoRU1NdOgocbRYiFNBbVgmN0igEpSoGd2uCo/A6lb/ej5LtKxFNhraw8Pjt1blGen8fCMiOv26hz4k=
X-Received: by 2002:ac2:47e6:: with SMTP id b6mr3909543lfp.649.1622161887248; 
 Thu, 27 May 2021 17:31:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210525000159.3384921-1-dianders@chromium.org>
 <20210524165920.v8.4.I79c7ed8815a07d285dd3b38e680e980d1024dbf1@changeid>
In-Reply-To: <20210524165920.v8.4.I79c7ed8815a07d285dd3b38e680e980d1024dbf1@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 28 May 2021 02:31:16 +0200
Message-ID: <CACRpkdYxAtD09cgVFd=_rusdVcr5LGF=z=mzG-22enhtRK+NBQ@mail.gmail.com>
Subject: Re: [PATCH v8 04/11] dt-bindings: drm/aux-bus: Add an example
To: Douglas Anderson <dianders@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, MSM <linux-arm-msm@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Stephen Boyd <swboyd@chromium.org>, Thierry Reding <treding@nvidia.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 25, 2021 at 2:02 AM Douglas Anderson <dianders@chromium.org> wrote:

> Now that we have an eDP controller that lists aux-bus, we can safely
> add an example to the aux-bus bindings.
>
> NOTE: this example is just a copy of the one in the 'ti-sn65dsi86'
> one. It feels useful to have the example in both places simply because
> it's important to document the interaction between the two bindings in
> both places.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Looks good.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
