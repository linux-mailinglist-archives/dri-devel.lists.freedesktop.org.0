Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C87797394ED
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 03:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F0A010E06E;
	Thu, 22 Jun 2023 01:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9833F10E06E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 01:53:00 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id
 e9e14a558f8ab-341dd309b6fso30490075ab.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 18:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687398779; x=1689990779;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EPyXNWV+5Rq0jnNZMv1kqGws0ng4nexiCuZNtuQKCfc=;
 b=DYaWA6V1y54tXLcGFoujv86aPwdbvu3ZyXyjyFyhZTyWMIrMeCFwnQGgUg9/qHGCIz
 JG78qGmtTIYSMY6DYIwPR3XvnXVs1kKGN3wjCfiswRctY5yINk4bRHxM2dTEOEXrPkLO
 FTU/gr6MT43KLB8YluIWoYqmv00pl4EBQYhcRGr8N+1xrn4RtRpA7O6jr1QQPXbP1I9C
 KLgaFim2DC7ERx8dhx7+VhGJPRBR7jZI1XrgkxBiOhZmvyXgwtv0hFOPU+Pu1Nza6phG
 VlPGPdqA3bPW35w6s54BggbrIKCYr1Iz5D9CqeFX/dQT8r4JengNAlLg3UJ4D/IShmHG
 e8vw==
X-Gm-Message-State: AC+VfDzSfZsZOhE2S+PA1FTy0z2T0S1D38AMo4eDB+hZX8yeSn+nKNq2
 oivcANEizf2CGT/8q+TZtQ==
X-Google-Smtp-Source: ACHHUZ5bXaNVYRvyVfg2gIqLORoZrPaNazGxcaU4nmHT1DBtkRs7fLnJxGeZccaoiFIquwjsd5yHWQ==
X-Received: by 2002:a92:d486:0:b0:340:d836:1f64 with SMTP id
 p6-20020a92d486000000b00340d8361f64mr16631899ilg.29.1687398779402; 
 Wed, 21 Jun 2023 18:52:59 -0700 (PDT)
Received: from robh_at_kernel.org ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id
 d18-20020a92d5d2000000b0033e23a5c730sm1672193ilq.88.2023.06.21.18.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 18:52:58 -0700 (PDT)
Received: (nullmailer pid 43975 invoked by uid 1000);
 Thu, 22 Jun 2023 01:52:56 -0000
Date: Wed, 21 Jun 2023 19:52:56 -0600
From: Rob Herring <robh@kernel.org>
To: Julien Stephan <jstephan@baylibre.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: add mediatek MIPI CD-PHY module
 v0.5
Message-ID: <168739877539.43891.4753109019939618528.robh@kernel.org>
References: <20230620121928.1231745-1-jstephan@baylibre.com>
 <20230620121928.1231745-2-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230620121928.1231745-2-jstephan@baylibre.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 louis.kuo@mediatek.com, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 fsylvestre@baylibre.com, linux-phy@lists.infradead.org, pnguyen@baylibre.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Tue, 20 Jun 2023 14:18:46 +0200, Julien Stephan wrote:
> From: Florian Sylvestre <fsylvestre@baylibre.com>
> 
> This adds the bindings, for the MIPI CD-PHY module v0.5 embedded in
> some Mediatek soc, such as the mt8365
> 
> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../bindings/phy/mediatek,mt8365-csi-rx.yaml  | 79 +++++++++++++++++++
>  MAINTAINERS                                   |  6 ++
>  2 files changed, 85 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,mt8365-csi-rx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

