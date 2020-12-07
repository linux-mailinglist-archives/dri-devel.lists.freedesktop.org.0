Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181112D1BD9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 22:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461A68938F;
	Mon,  7 Dec 2020 21:15:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D6618938F
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 21:15:55 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id w3so13271351otp.13
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 13:15:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rSAFkhpNJQAuz9y5dju0W7uXjODyDSx6iiAnGJorzFE=;
 b=DWzpyuk9+2L0CMs8QFYyzDTwdaeCFUHBgRF/NGAW2TojHexpw+A4gIDWaFAPAAC9OZ
 M5xu6tmsPm6UHP6nqyvlYSwjYEYOQy8kw9beSMFAz2xSl5lV3hyFOgNl/wuJoM/rjYVU
 JfY23HaxgvUjr+1kYwnciKUnmavzS+TGCY8MUe/i8IgekeNLcuSv4LQcDB5oCNH6cJIt
 gPLqNQCqCcla4j/1D2XgcPWV8RQE3MSUNgoJ0bWKhR7qSLOvlE9BCoH169PMdCmU2QOU
 jQpla1913ZPoYS8Qq7SfZIZTUaengres4d9o5CB3wV/IT24zI//8lwn53vGaIbWCsRUm
 TUuA==
X-Gm-Message-State: AOAM532EcGJc2gncUgZhfEGhD6D1bDvO/Lnghg0zG9AWNQdya823sNET
 9OS+RZ9aKndQ/9x40xgCgg==
X-Google-Smtp-Source: ABdhPJxQpESfvNGlJAqwTMytNEER2nkmsXBzu8vhDgGPWF4PCnXOQyEU6ub0eGzupCQoCYrmNFRMlQ==
X-Received: by 2002:a05:6830:128a:: with SMTP id
 z10mr14708659otp.3.1607375754577; 
 Mon, 07 Dec 2020 13:15:54 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id b28sm2878493oob.22.2020.12.07.13.15.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:15:53 -0800 (PST)
Received: (nullmailer pid 838684 invoked by uid 1000);
 Mon, 07 Dec 2020 21:15:52 -0000
Date: Mon, 7 Dec 2020 15:15:52 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3 03/11] dt-bindings: phy: convert phy-mtk-xsphy.txt to
 YAML schema
Message-ID: <20201207211552.GA838655@robh.at.kernel.org>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-3-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118082126.42701-3-chunfeng.yun@mediatek.com>
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
 David Airlie <airlied@linux.ie>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Min Guo <min.guo@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Nov 2020 16:21:18 +0800, Chunfeng Yun wrote:
> Convert phy-mtk-xsphy.txt to YAML schema mediatek,xsphy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3:
>   1. remove type for property with standard unit suffix suggested by Rob
>   2. remove '|' for descritpion
>   3. fix yamllint warning
> 
> v2:
>   1. modify description and compatible definition suggested by Rob
> ---
>  .../bindings/phy/mediatek,xsphy.yaml          | 199 ++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-xsphy.txt | 109 ----------
>  2 files changed, 199 insertions(+), 109 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-xsphy.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
