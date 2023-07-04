Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C979A747318
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 15:45:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F7E10E0F6;
	Tue,  4 Jul 2023 13:45:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15C310E0F6
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 13:45:52 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id
 3f1490d57ef6-c5ffb6cda23so210495276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 06:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688478351; x=1691070351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4AMLUs9zdYkz13PYZ3sZgfaLBUzB3BRb9jZF/zG6Gy4=;
 b=f//c71F+CiiJ0nQYLNnQXUSbAHrEMuUk0nw1wwalcqczyC4cibu2CBc5Bqq1RtJtEK
 FXsYoEaQ7ltPESn8l7IvqYRBWfzWOkclLdWaPGFVrKHk+5accVNfp1ogMQeHL57mySgK
 7REX07YJruKKEqpeJ1dFpEAhuIMJL793hsMehXu3dJIkAXpGsq2VMuqxiKntG4+N+dhi
 m1YwWB8Dp0tYJs5Z1Epaw+dcPiE1gnPCw1dfO9E/U1X/Fe4jvfwhFUGRUdFPE5QKYlk+
 j3l5fF84hhm/UUWt+erN34P6+c7IDsRD/GAzIQeE+5mP6ziVCt7nHB6EakqfCgM6laVa
 8abw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688478351; x=1691070351;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4AMLUs9zdYkz13PYZ3sZgfaLBUzB3BRb9jZF/zG6Gy4=;
 b=AUlzbtfNTLn5H0mZzj+6eZh9n3Yn6bMRkxp9g2mTO9q5T8sa/k7at/jrxrkF+Gxnpz
 S7uxiLLjDFfPhm+u8eZTih0BzAYI4vEXDTKQy0RSbBDZrK7fOtQMp6fgFA4aCGo+tJCd
 kT9tO9pvt2U2DXlkoICPX/Nh8kfGYLqH1YRmH5GUMqFJoW5qigodfT43fQPwQ8mkpHkv
 b7OMHv2XtbC2mf8R4rlY6ir5bRL2Rv+6I6e7ig8jOH5isuI4kHYIpu8CwCSo2x8bZqRb
 0seQbIx3zBfNGDvr3oOgNkVOKQkf/PF5RuD2YFql+o7U7Yj8lQgzD573eyRkX15p3IK3
 1Uag==
X-Gm-Message-State: ABy/qLYwUM1kimTG3NVu8oGsKvzQY1pW2PL1qWrMpfQP4802xEuwq1tG
 Lpsnu2Sd/nPm6h5l3FsKHxLZXtA1vPD+LK00B5PxvQRgwFJJ4vae
X-Google-Smtp-Source: APBJJlEleHWeClZf2D74mZ0WM0CjCPjrraHn2hhQsLjcjs+MPeKaQJowGKx5dWhdHhQ6pcRJZwraIGBorgd0saV7QNw=
X-Received: by 2002:a25:c5c3:0:b0:bc1:dfa5:83a4 with SMTP id
 v186-20020a25c5c3000000b00bc1dfa583a4mr11215700ybe.13.1688478351717; Tue, 04
 Jul 2023 06:45:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 16:45:40 +0300
Message-ID: <CAA8EJppVOc0_e_o3CX_U9BvDWFKaz2-0FSZsXt11kDg5SXBn5A@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: cleanup DTS example whitespaces
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 coresight@lists.linaro.org, linux-usb@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, linux-phy@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 2 Jul 2023 at 21:23, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The DTS code coding style expects spaces around '=' sign.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Rob,
>
> Maybe this could go via your tree? Rebased on your for-next:
> v6.4-rc2-45-gf0ac35049606
> ---
>  .../bindings/arm/arm,coresight-cti.yaml        | 18 +++++++++---------
>  .../bindings/arm/keystone/ti,sci.yaml          |  8 ++++----
>  .../devicetree/bindings/display/msm/gmu.yaml   |  2 +-

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #display/msm

>  .../display/panel/samsung,s6e8aa0.yaml         |  2 +-
>  .../display/rockchip/rockchip-vop.yaml         |  4 ++--
>  .../bindings/iio/adc/ti,adc108s102.yaml        |  2 +-
>  .../bindings/media/renesas,rzg2l-cru.yaml      |  4 ++--
>  .../devicetree/bindings/media/renesas,vin.yaml |  4 ++--
>  .../devicetree/bindings/mtd/mtd-physmap.yaml   |  2 +-
>  .../bindings/net/mediatek-dwmac.yaml           |  2 +-
>  .../bindings/perf/amlogic,g12-ddr-pmu.yaml     |  4 ++--
>  .../bindings/phy/mediatek,dsi-phy.yaml         |  2 +-
>  .../remoteproc/amlogic,meson-mx-ao-arc.yaml    |  2 +-
>  .../devicetree/bindings/usb/mediatek,mtu3.yaml |  2 +-
>  .../devicetree/bindings/usb/ti,am62-usb.yaml   |  2 +-
>  15 files changed, 30 insertions(+), 30 deletions(-)


-- 
With best wishes
Dmitry
