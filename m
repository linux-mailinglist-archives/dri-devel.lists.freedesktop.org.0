Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1477649535B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 18:36:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 484BF10E8D3;
	Thu, 20 Jan 2022 17:36:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD8510E56F
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 17:36:19 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 k13-20020a056830150d00b0059c6afb8627so6276222otp.5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 09:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qQlvojQIJlI1LuVZbEtkS+KlAzI9wBW3pw0XQI8LAMk=;
 b=Yr3sVr4rpEI8yv86puROUYRvslDfmmQms3BpnPIB1mP1icoXW3LywZD+a8VPHmgJF+
 /IoGMCxbps08Vpnq9XsQL7TQsNr8SSbtV6eqbiTgdB9SxPQplEM5Pt2ALIK8h74UKOqI
 1Oy/oQXE8hTgf4aCbkFj83Yo7Fn+hINU4ZXaMLKPa7Ft6PP6aA9UB3UziXxt4WlzWktr
 iYnJoYhKE9FsIKdj9cRtpl2gvG5t8vn+mY6SUnBM407iAMQyxThzwQ7o/pNl3QR+BOE0
 8jw9+v9dRx3LYTjyntU1c/O7fGn2dt4xBvuF2PVaJ/RxTZPUFZP10xSyIMxORB1MwTWy
 owAA==
X-Gm-Message-State: AOAM532hXwx2cgi/J3Ii1JOF5wgZHH2hxW7QyEfcs8MXoTNY2/ES5etD
 bzuIcBCqZ3jQKJ3EqnVilEQmhVLAsw==
X-Google-Smtp-Source: ABdhPJzCRxVNcMKOq7T+/Z1lxu7In4u72P8sWp+eMD1DsgHGhcN9VmWOc7txoszaZlPCUT1Kd3fnYg==
X-Received: by 2002:a9d:5a01:: with SMTP id v1mr21602978oth.337.1642700179177; 
 Thu, 20 Jan 2022 09:36:19 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id d4sm1651420otq.44.2022.01.20.09.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 09:36:18 -0800 (PST)
Received: (nullmailer pid 1648421 invoked by uid 1000);
 Thu, 20 Jan 2022 17:36:16 -0000
Date: Thu, 20 Jan 2022 11:36:16 -0600
From: Rob Herring <robh@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Drop unnecessary pinctrl properties
Message-ID: <YemdkDfmemrwab2Y@robh.at.kernel.org>
References: <20220119015325.2438277-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220119015325.2438277-1-robh@kernel.org>
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
Cc: alsa-devel@alsa-project.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-rockchip@lists.infradead.org,
 Sandy Huang <hjc@rock-chips.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 linux-gpio@vger.kernel.org, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 - <patches@opensource.cirrus.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Jan 2022 19:53:25 -0600, Rob Herring wrote:
> For a single pinctrl mode, it is not necessary to define pinctrl
> properties as the tools always allow pinctrl properties.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../display/rockchip/rockchip,rk3066-hdmi.yaml         |  8 --------
>  Documentation/devicetree/bindings/input/gpio-keys.yaml |  6 ------
>  .../devicetree/bindings/pinctrl/cirrus,lochnagar.yaml  |  9 ---------
>  .../devicetree/bindings/pinctrl/cirrus,madera.yaml     | 10 ----------
>  .../devicetree/bindings/sound/samsung-i2s.yaml         |  6 ------
>  5 files changed, 39 deletions(-)
> 

Applied, thanks!
