Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88C638D52F
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 12:34:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6548A6E197;
	Sat, 22 May 2021 10:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8618B6E197
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 10:34:41 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id v5so26943647ljg.12
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 03:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GYUGb+Vmff9gIUFyntVd0FDSDvGjX/ufL9sA1nyH3vE=;
 b=BoJ8q46zkHwgiqwqQriO/CkcH2ITeLf1ezMGx+UzZ8wDLGLO89xIOlJochoYDjDjWD
 VKfN6KnYmFLB6KSnYwg+92T2S7iOLUicG+XA/VkwSPkDfLa0WoMwqCiNkWhUogFjad74
 m6WXkkfcz9fq/r+HAtrmj/7OmM2bIeWOW1c7iMm5v8+ZHPQBbU5g2oeV2FQZj8sFlhI5
 Vxayp7bWj1GlHkAtIK5GTCSwY8mn0K8RTEfO50R/b0+ozUyYoiTomGDigFs5riqELBa5
 Y8zobRoz3tuQhl8Kc5/PykT1s7cppXe7/V2Hke6tIKBaDMkyYY23avqaiUk98xQ5gFcU
 2B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GYUGb+Vmff9gIUFyntVd0FDSDvGjX/ufL9sA1nyH3vE=;
 b=pjtzkXYAhXmF/qBtbEL5az+BGHx6C3q/fCcYayrIFL/1n0mJchAM+dTaS55ymecxe0
 UBPRiIMgCR43qTCAWX/HUobTm2neNV8mZWhumGdwYuDNjPV0zzW4zjvY9zELRKvgMO5L
 oWlMozZUEciNyGumShqtOYNUNQudg/Zo1lv5/DsphnAAMKet+hSXYa8fLiI91A/8Uafb
 nduFS4ZExnb3EK0oQwlxm6QnklTJaV47KYEA1AZ6gEejlqhurf1WZ0cesHnHsYgkSNIG
 A65SstBo/W9wgbppcXWiUa63VEawKzxNl2qpLV4DEndOMUIrDZXFYKvBcyx0D9f5AL9Z
 KFrg==
X-Gm-Message-State: AOAM532A2GFZ+G/D3KsmN9FDC2PJdS0jrM91WC3HmPpaD/8+eog+Sx/b
 j5ct95BoZBWEzFxVJ4wxyZ453wTB+jNwIydDDk9pig==
X-Google-Smtp-Source: ABdhPJz+ibDLMNP419ZZFrjVh+qJ+I+wQfZgaVgBBcDbk/aF9PHnxGEBejFwxuPQTBjJzM6NkcCaBX514iUfRyBvKSw=
X-Received: by 2002:a2e:889a:: with SMTP id k26mr9933011lji.438.1621679679967; 
 Sat, 22 May 2021 03:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.4.I787c9ba09ed5ce12500326ded73a4f7c9265b1b3@changeid>
In-Reply-To: <20210517130450.v7.4.I787c9ba09ed5ce12500326ded73a4f7c9265b1b3@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 May 2021 12:34:28 +0200
Message-ID: <CACRpkda_MTBrXR-as5t_Ji8mU4=95NQ_GTDtjcERncm9yS1moA@mail.gmail.com>
Subject: Re: [PATCH v7 04/10] drm: Introduce the DP AUX bus
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Clark <robdclark@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Thierry Reding <treding@nvidia.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, MSM <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Rajeev Nandan <rajeevny@codeaurora.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 10:09 PM Douglas Anderson <dianders@chromium.org> wrote:

> Historically "simple" eDP panels have been handled by panel-simple
> which is a basic platform_device. In the device tree, the panel node
> was at the top level and not connected to anything else.
>
> Let's change it so that, instead, panels can be represented as being
> children of the "DP AUX bus". Essentially we're saying that the
> hierarchy that we're going to represent is the "control" connections
> between devices. The DP AUX bus is a control bus provided by an eDP
> controller (the parent) and consumed by a device like a panel (the
> child).
>
> The primary incentive here is to cleanly provide the panel driver the
> ability to communicate over the AUX bus while handling lifetime issues
> properly. The panel driver may want the AUX bus for controlling the
> backlight or querying the panel's EDID.
>
> The idea for this bus's design was hashed out over IRC [1].
>
> [1] https://people.freedesktop.org/~cbrill/dri-log/?channel=dri-devel&date=2021-05-11
>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Rajeev Nandan <rajeevny@codeaurora.org>
> Suggested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I like the concept and the general idea behind this, clean and
helpful design.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
