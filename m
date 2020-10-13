Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EAA28CEAE
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 14:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17046E8E9;
	Tue, 13 Oct 2020 12:49:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B006E8E9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 12:49:49 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id u17so22357175oie.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 05:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h+4lx1NmWtXfOrC3rFHXIicegWjQFHB1Qz6MGdDJkro=;
 b=q+zCpWNjdisMfeV6dqgbumbP3rgebiHaPUPKS0dexFIMxOh83ZWuftjiOW9zoF4e0v
 tSkbOo4SwrNIbt/GfvLqH7/nbh3Pjxjtd9RHp5Yu5VMH/lZxGSDxsaTQW98U1Gweo6bo
 8ZRgxLTSInAqY0D8ZxrmLYpHcT9Q+WI5myur3tvZaxSuSj46ztl+GlbPOtq8eeh2qb1L
 80NFY37UOpr7TdQC3tnZxaQFijTckKTouqpA5nJAqbQX7OrWZ9Ku6MdaqEJWFcp+WLtb
 SSm1KFTuDiLmDzEDNT/kfz4oXN8YquyB5VjDTK9oSMVtu92YK8BpSZbW9RSGvia52uAZ
 lPqw==
X-Gm-Message-State: AOAM530QS7mEQa1Vnu3BrSc/bh+8BHGzgxT0p+IUeQu0+5H+yFoLrR5A
 lUYX1c3zBi77RKABoIfuow==
X-Google-Smtp-Source: ABdhPJzzBhpFlOx96qHNV3x8rQzmHhlP80ozoqo1sj8XLzaIjsAHsnPOnKQvXA/PKTfjxDJM1j/OZA==
X-Received: by 2002:a05:6808:f:: with SMTP id u15mr6766651oic.34.1602593388830; 
 Tue, 13 Oct 2020 05:49:48 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id a192sm7632544ooc.12.2020.10.13.05.49.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 05:49:47 -0700 (PDT)
Received: (nullmailer pid 3322788 invoked by uid 1000);
 Tue, 13 Oct 2020 12:49:46 -0000
Date: Tue, 13 Oct 2020 07:49:46 -0500
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH v2 7/8] dt-bindings: usb: convert mediatek,mtu3.txt to
 YAML schema
Message-ID: <20201013124946.GA3322281@bogus>
References: <20201013085207.17749-1-chunfeng.yun@mediatek.com>
 <20201013085207.17749-7-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013085207.17749-7-chunfeng.yun@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Min Guo <min.guo@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Stanley Chu <stanley.chu@mediatek.com>,
 "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Oct 2020 16:52:06 +0800, Chunfeng Yun wrote:
> Convert mediatek,mtu3.txt to YAML schema mediatek,mtu3.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: new patch
> ---
>  .../devicetree/bindings/usb/mediatek,mtu3.txt | 108 ---------
>  .../bindings/usb/mediatek,mtu3.yaml           | 227 ++++++++++++++++++
>  2 files changed, 227 insertions(+), 108 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: usb@11271000: compatible: ['mediatek,mt8173-mtu3'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: usb@11271000: 'clocks' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: usb@11271000: 'clock-names' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml


See https://patchwork.ozlabs.org/patch/1381414

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
