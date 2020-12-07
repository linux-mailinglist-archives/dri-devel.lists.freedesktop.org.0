Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0C62D1BDB
	for <lists+dri-devel@lfdr.de>; Mon,  7 Dec 2020 22:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7DF8936B;
	Mon,  7 Dec 2020 21:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7FC8936B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 21:17:16 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id d8so5986809otq.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 13:17:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G1G6ObvJgDI0E7m4Cl1U1Ro4MDrbTLhzH3K0T2+ZbBs=;
 b=RedBlVRwD1BZc7NHeaUaTdl4OVq6bIxSoIiDksUlc9QuAdsDzJHHdpNrM8ynes9dou
 yIptR1MdDPoYT2ee5GJwZxsjTpqJfDCTIg8CW66UGz43nVraXp1v5fpXYWm2tfAzy7p6
 kHDVfnk2mdKIFLrkyFzg/3ZheovA7VqkRogKF42tE4VhlncDJlXuTO7ZIqw7UslresmN
 jdIG0QuleKHgurNn2NBcDjpB8UdUinawELKr/OAn9plyVLJm2kuj7oDle10RbcwJaRqu
 WkbVdlVpt7AWvfSkyWEOK4evXVkYqO1xmlIYQkf/xj157xGku/qza1CzyTlMsMTAQPjo
 q46w==
X-Gm-Message-State: AOAM533M5lFo9EFha1usQvbqa2F/tJj4ytNJLpw//RuzFRCDN4MLEkUv
 GD5HPTEXjmRrjRt90vj4Dg==
X-Google-Smtp-Source: ABdhPJy/chd0MSu5WIDA3RVAbdxX9aM4h7hyWLwu1dkVGQ1ZVEXEos5cdWB3ekvdjyNJmXERqp4QUg==
X-Received: by 2002:a05:6830:4036:: with SMTP id
 i22mr2933425ots.127.1607375835756; 
 Mon, 07 Dec 2020 13:17:15 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k134sm3203551oib.51.2020.12.07.13.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 13:17:14 -0800 (PST)
Received: (nullmailer pid 840904 invoked by uid 1000);
 Mon, 07 Dec 2020 21:17:13 -0000
Date: Mon, 7 Dec 2020 15:17:13 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v3 04/11] dt-bindings: phy: convert phy-mtk-tphy.txt to
 YAML schema
Message-ID: <20201207211713.GA840844@robh.at.kernel.org>
References: <20201118082126.42701-1-chunfeng.yun@mediatek.com>
 <20201118082126.42701-4-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201118082126.42701-4-chunfeng.yun@mediatek.com>
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

On Wed, 18 Nov 2020 16:21:19 +0800, Chunfeng Yun wrote:
> Convert phy-mtk-tphy.txt to YAML schema mediatek,tphy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v3:
>   1. fix dt_binding_check error in example after add mtu3.yaml
>   Changes suggested by Rob:
>   2. fix wrong indentation
>   3. remove '|' due to no formatting to preserve
>   4. add a space after '#'
>   5. drop unused labels and status in examples
>   6. modify file mode
> 
> v2:
>   1. modify description and compatible
> ---
>  .../bindings/phy/mediatek,tphy.yaml           | 260 ++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-tphy.txt  | 162 -----------
>  2 files changed, 260 insertions(+), 162 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
