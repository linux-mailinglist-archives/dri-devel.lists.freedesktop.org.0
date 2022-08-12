Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034EF591496
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 19:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61EF82B9AF;
	Fri, 12 Aug 2022 17:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A56112BEDE
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 17:03:47 +0000 (UTC)
Received: by mail-il1-f172.google.com with SMTP id c5so772561ilh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Aug 2022 10:03:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=CbsNiIytCv9TuWDoxy66NWQwnGNftXPPpewBJoHfDIA=;
 b=YwEoeZyrD2x/tma+DMEnKRUn7luzjpU8O1K5m2onPu6KZJ7R060Jn984JFRVMiKbIw
 LpazvImdCd0KcYsACOReo9kL/UPqJP1vK2DTfVZ29JF8HbxLGOHXUd6tKuqdlC4PAHHu
 jOiACj70pLD/epw7YJ/jnex75XUSl1UJrw3XeRCAiHjSWOP0gY2ghdJrr+qtE4ibUOfx
 xxQvRIDJOLTb5tdy0WXbrcHecQjBrTzm0aeM0RjD4X7UT24v0eanhk8zHbFyza0PtWWB
 VrsBEsq+1RcaMkdiYtYSffXpfs71cWqo12Pp9j+LH+0/2H+B8XL8bdmD6kp0NwCpjp19
 vv1Q==
X-Gm-Message-State: ACgBeo1igY0YlOAf/1SaI9J5wnsv5SFQLcvrY1itU4vh7JETkoBOxQb9
 kxsUyKIR8eoDRLYWvlx9Pw==
X-Google-Smtp-Source: AA6agR5GGZj+HKLM7Mbb9Xw/65Zf53mj7vmnn/eflsC5QhVZLQwAoBMdhIHCeDPP16ImS8/8n8bnbQ==
X-Received: by 2002:a05:6e02:80a:b0:2e3:4975:bf8a with SMTP id
 u10-20020a056e02080a00b002e34975bf8amr2115319ilm.316.1660323826577; 
 Fri, 12 Aug 2022 10:03:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 c17-20020a023311000000b003434ee85d38sm105274jae.4.2022.08.12.10.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 10:03:46 -0700 (PDT)
Received: (nullmailer pid 327993 invoked by uid 1000);
 Fri, 12 Aug 2022 17:03:43 -0000
Date: Fri, 12 Aug 2022 11:03:43 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] spi/panel: dt-bindings: drop 3-wire from common properties
Message-ID: <20220812170343.GA327951-robh@kernel.org>
References: <20220810131311.428645-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220810131311.428645-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Bakker <xc-racer2@live.ca>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Christophe Branchereau <cbranchereau@gmail.com>,
 Pratyush Yadav <p.yadav@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Aug 2022 16:13:11 +0300, Krzysztof Kozlowski wrote:
> The spi-3wire property is device specific and should be accepted only if
> device really needs them.  Drop it from common spi-peripheral-props.yaml
> schema, mention in few panel drivers which use it and include instead in
> the SPI controller bindings.  The controller bindings will provide
> spi-3wire type validation and one place for description.  Each device
> schema must list the property if it is applicable.
> 
> The Samsung S6E63M0 panel uses also spi-cpha/cpol properties on at least
> one board (ste-ux500-samsung-janice/dts), so add also these to the
> panel's bindings.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/panel/kingdisplay,kd035g6-54nt.yaml     | 2 ++
>  .../bindings/display/panel/leadtek,ltk035c5444t.yaml         | 2 ++
>  .../devicetree/bindings/display/panel/samsung,s6e63m0.yaml   | 4 ++++
>  Documentation/devicetree/bindings/spi/spi-controller.yaml    | 5 +++++
>  .../devicetree/bindings/spi/spi-peripheral-props.yaml        | 5 -----
>  5 files changed, 13 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
