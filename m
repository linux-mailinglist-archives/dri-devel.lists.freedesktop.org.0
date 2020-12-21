Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E732E00C4
	for <lists+dri-devel@lfdr.de>; Mon, 21 Dec 2020 20:11:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 142E989C6B;
	Mon, 21 Dec 2020 19:11:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A632489C6B
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 19:11:13 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id 15so12324982oix.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Dec 2020 11:11:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f9rsH3MI3HmxoU3YRSFq+GPxbgSUzkM76uH8mgO+QJ0=;
 b=V0FXMHPJcLi/dpl3sbVDLO78/5e3Ln8YxxNCY6H/yNOuR+EvyTodNMNGAquZMRnqAm
 rYZts6w/7ajXuSYfJt/+LbFNY5tEVxAGjsF5FpxoK0JJ5ldr1uLOzHBmtciBzRQBVcmK
 3TYNM2a5QK0vlMqZALS0Es7gVx/8/CK58wXeTKTLaG6GV5yJRd5trVFYgIXKG4ds4NGD
 rMrjmnmJ1il5/2TWQBGnVbhIM013eIJ4YEfHh4GpP7b4k2cg8Hj2dTJ2KyFoAg/ZxNsm
 412O1G0YDQb4BQnkg/ZXpVQcRpE6vykNXNFtcaTDdTqNkm473TwUBxPBzIZxeqy8k8r3
 V98g==
X-Gm-Message-State: AOAM530SlTwelQ3k8oWjOdnroQwphNBrl1qemErLEbu11EJmK70sfDKf
 Rfym9oeLJ90nkVwa3OG8fQ==
X-Google-Smtp-Source: ABdhPJykTihmx7a1AWZTQnLaeKbOndEBk8EAvOatAGL9pTLPvCEAQBmw9IQc3TLr1f+WzJECt5AmDA==
X-Received: by 2002:aca:3a02:: with SMTP id h2mr11827243oia.65.1608577873045; 
 Mon, 21 Dec 2020 11:11:13 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r15sm3731437oie.33.2020.12.21.11.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 11:11:12 -0800 (PST)
Received: (nullmailer pid 382296 invoked by uid 1000);
 Mon, 21 Dec 2020 19:11:07 -0000
Date: Mon, 21 Dec 2020 12:11:07 -0700
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v4 07/11] dt-bindings: phy: convert MIPI DSI PHY binding
 to YAML schema
Message-ID: <20201221191107.GA382240@robh.at.kernel.org>
References: <20201216093012.24406-1-chunfeng.yun@mediatek.com>
 <20201216093012.24406-7-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201216093012.24406-7-chunfeng.yun@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>, netdev@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Dec 2020 17:30:08 +0800, Chunfeng Yun wrote:
> Convert MIPI DSI PHY binding to YAML schema mediatek,dsi-phy.yaml
> 
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v4:
>   1. add maintainer Philipp add support mt8183 suggested by Chun-Kuang
>   2. use keyword multipleOf suggested by Rob
>   3. fix typo of 'MIPI' in title
> 
> v3: new patch
> ---
>  .../display/mediatek/mediatek,dsi.txt         | 18 +---
>  .../bindings/phy/mediatek,dsi-phy.yaml        | 85 +++++++++++++++++++
>  2 files changed, 86 insertions(+), 17 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
