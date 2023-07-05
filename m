Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9000A748883
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 17:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD4710E397;
	Wed,  5 Jul 2023 15:54:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB30010E392;
 Wed,  5 Jul 2023 15:53:59 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-77acb944bdfso334675139f.0; 
 Wed, 05 Jul 2023 08:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688572438; x=1691164438;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3RLbkYBSMtZSZWsdqOipQPRF1AXaIm7IXw5H9F31xDg=;
 b=X14EQ3xXYd0tVftQ7UhB55Mit5mv3vXvR3zI+d1YmAOiT1YkQFUxUEBN545+aObQOU
 RMpG4PpgdvNIkveuLqaCn2QzVLEx+9vkPtJBuUrjUm9QtNHwEhf7u11jdt8xD52NjTID
 hBltD8Es0zL8TgLLDl+EVDx7CUXbZLWxZDlnOTeUkLdhdjN+lxuSUrG8K5thAatwPlci
 67UkmEmLH3LvUVK09lwgpQVnD8cJmRlWOy6jZBGjEDp/bI46ucYAqC2Ue1Mh2DJmJK5F
 +TyjtgB6uykI21d7jFIBCmMrOIDOLjfHUdrkj2kpq2meh67HgJShDj6PfE9dS+YJHP8q
 0q2g==
X-Gm-Message-State: AC+VfDx0vsJVTdA17hKUFwJgSqKjDLt5zbzWGQGwzknL5R82kwYPlfzG
 sxO8ww8kbW/B0/xbW1+2tg==
X-Google-Smtp-Source: ACHHUZ73QtYKyynoI9ylI1XEWC2lq+A/sJ6q02lzFpAinNpUOyDvzNhBset5FBiQu0bFE/MLWXDyOg==
X-Received: by 2002:a5e:8811:0:b0:785:ca70:46a2 with SMTP id
 l17-20020a5e8811000000b00785ca7046a2mr18137083ioj.4.1688572438444; 
 Wed, 05 Jul 2023 08:53:58 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a02c8cf000000b0042ad6abe0bbsm6425382jao.20.2023.07.05.08.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jul 2023 08:53:57 -0700 (PDT)
Received: (nullmailer pid 691642 invoked by uid 1000);
 Wed, 05 Jul 2023 15:53:55 -0000
Date: Wed, 5 Jul 2023 09:53:55 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: cleanup DTS example whitespaces
Message-ID: <168857243311.691536.13322875472425620659.robh@kernel.org>
References: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230702182308.7583-1-krzysztof.kozlowski@linaro.org>
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
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Leo Yan <leo.yan@linaro.org>, linux-phy@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-amlogic@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 02 Jul 2023 20:23:08 +0200, Krzysztof Kozlowski wrote:
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
> 

Applied, thanks!

