Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D0038D541
	for <lists+dri-devel@lfdr.de>; Sat, 22 May 2021 12:40:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7B16E048;
	Sat, 22 May 2021 10:40:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6BD6E048
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 10:40:52 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id v8so28431269lft.8
 for <dri-devel@lists.freedesktop.org>; Sat, 22 May 2021 03:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lg1y9Obp80Osz1Bq342Yu+rTFD/2WpZGCEwwuCDW6E8=;
 b=uc4PL6oylDsloueQXrsHk4s9gDW5ReETZHqDdO2FyOsAYj2AXbF4Y5GiSKBEvOZlXb
 y46aWz4RMRtLBBv82Mz353uoHrmnz8CuPPFIqMQWmKIePAclvQmgmh0dS3Q8hkHcVPqx
 /M3QyfikllKwEsHD2xUdHIaY6wC2eyjluXU9nw1Iki6Gn6a6GU6ihNNNtWuLilr+Qzyz
 mmWFT3DXaNR+vSEzUxpNXg4ffVaZHNJi9hute/lOz9R4kJ/FlckJBIUh+MosI/5m8fn+
 /BqribLnX9ZuLHVWmOsAfN8QJUSbhGsBpsZMysFe2Ouy/QuFaNz461USE2xWHGPzKCQZ
 0dMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lg1y9Obp80Osz1Bq342Yu+rTFD/2WpZGCEwwuCDW6E8=;
 b=h2yAXx3QJJyBHhRsD3gwa/fObzvYIXDY9nSZbtDBaUJcROGmewFGcQ2utqCCDGxs+4
 bMqxKBZ4VFHrWDgiHvEoP2Me4r+TQuhca4TfQum4+8jNM6vQZ+uarT2aDuI9uroze93k
 t5l7IyepVLgll4SlTV0ue7qRDahzzJn/Owsd4BCXzMTIU4TXvbGmr7ULfu8kcJSF+LNb
 VhkMAOYcI2qdJ91T57vWhmgWtCH3EENHOgylNm0251pyJW2srJolVL2T3mPsyCUp7TMz
 OuoX6hbjNSv3SwmJrPEh2jvyrY2O6A0nkTmhSeFt63nfAO/n0NQ3A5hbtwn/RiqR72GX
 lD1w==
X-Gm-Message-State: AOAM531d1/i1NJhVGxe/E0NZ1NYB6Jnh19Vzf/RoC26MLD6x5UoMx4FT
 wo8zXM4ALFi4kyMkDn6Py+WaijurIcWCCaqznmLT2A==
X-Google-Smtp-Source: ABdhPJxhLwsuqV6feNa9R5NW2NBld0tSR0wyt/uxJOCt1dJmqHL9iyeqVVJScvTt9ZNQ720pZRp4l/glKWQcrUEPhEY=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr4994893lfn.465.1621680051047; 
 Sat, 22 May 2021 03:40:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210517200907.1459182-1-dianders@chromium.org>
 <20210517130450.v7.10.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
In-Reply-To: <20210517130450.v7.10.Ibdb7735fb1844561b902252215a69526a14f9abd@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 May 2021 12:40:39 +0200
Message-ID: <CACRpkdbrmFS87xRRbwbU7J05bGDKmx5oJR880sr_ZA4KWKSKfA@mail.gmail.com>
Subject: Re: [PATCH v7 10/10] arm64: dts: qcom: sc7180-trogdor: Move panel
 under the bridge chip
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
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Rob Herring <robh+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 MSM <linux-arm-msm@vger.kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Thierry Reding <treding@nvidia.com>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 10:09 PM Douglas Anderson <dianders@chromium.org> wrote:

> Putting the panel under the bridge chip (under the aux-bus node)
> allows the panel driver to get access to the DP AUX bus, enabling all
> sorts of fabulous new features.
>
> While we're at this, get rid of a level of hierarchy for the panel
> node. It doesn't need "ports / port" and can just have a "port" child.
>
> For Linux, this patch has a hard requirement on the patches adding DP
> AUX bus support to the ti-sn65dsi86 bridge chip driver. See the patch
> ("drm/bridge: ti-sn65dsi86: Add support for the DP AUX bus").
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

This is really looking good.
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
