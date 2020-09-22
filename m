Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D16F274635
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 18:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCA26E8B5;
	Tue, 22 Sep 2020 16:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f194.google.com (mail-il1-f194.google.com
 [209.85.166.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41ABF6E8B5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 16:07:50 +0000 (UTC)
Received: by mail-il1-f194.google.com with SMTP id t12so17824630ilh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 09:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F7+BrvUPgVKWs+Ft1mHTZOhfkcaTDiJxgGH1Y7f/TKM=;
 b=Wkw7UkAMPdZ3rJDkRnoB5kSRQX5b1g10JrjHp4Wqr/MSRZKiZkgRvcnDdO6R75ICJy
 MfaHWcCDzhvmp8tUBB3PhI8OZDTHFJJZMNm+f/ot25OsJXLWHkETOawXrC4/DcGZ9V1j
 7o+quO9kTuDOO4T3+L0tMmEPPGnoRLDBM5JZUeDqtnF6sQ+QkcUSXexN5EJiRKZosVjy
 73ONONX9ALrfmft7w7r6j//QyW20Slo9LDrFuchkwsnCmQ/RIChKrC+dCeaDXnFKp41a
 MKGQP0R2Hy21wpBvDWKpI0rWyNB15DGI5u6ZR51bo0m8B+oix7UntMfeHsJf6Dl4QdpI
 10hw==
X-Gm-Message-State: AOAM533N9ChxA+ZBT7CUgDkj0LOg0O0c9r1ZuDpUzG0ipi142MV7JG9k
 98+qUI7fnaWJSZguUNjqQQ==
X-Google-Smtp-Source: ABdhPJyqvLH69RvwbH3NSNIYfqeuJSyfMOJ6wcBZfY7zb6r9ddzGrmuzScWO3eNeKcVGJhWVOt1L3g==
X-Received: by 2002:a92:1309:: with SMTP id 9mr4821490ilt.129.1600790869671;
 Tue, 22 Sep 2020 09:07:49 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id f1sm9083225ilh.25.2020.09.22.09.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 09:07:49 -0700 (PDT)
Received: (nullmailer pid 2773927 invoked by uid 1000);
 Tue, 22 Sep 2020 16:07:47 -0000
Date: Tue, 22 Sep 2020 10:07:47 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 4/4] dt-bindings: phy: convert HDMI PHY binding to YAML
 schema
Message-ID: <20200922160747.GA2773711@bogus>
References: <5af7c097d1c71a180d8ed1f1a44055859b42f1a0.1600760719.git.chunfeng.yun@mediatek.com>
 <4817a10e1c3b2beeb79b0cf5e182df747ce268e7.1600760719.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4817a10e1c3b2beeb79b0cf5e182df747ce268e7.1600760719.git.chunfeng.yun@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Sep 2020 15:55:08 +0800, Chunfeng Yun wrote:
> Convert HDMI PHY binding to YAML schema mediatek,ufs-phy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../display/mediatek/mediatek,hdmi.txt        | 17 +---
>  .../bindings/phy/mediatek,hdmi-phy.yaml       | 90 +++++++++++++++++++
>  2 files changed, 91 insertions(+), 16 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.example.dt.yaml: example-0: hdmi-phy@10209100:reg:0: [0, 270569728, 0, 36] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml


See https://patchwork.ozlabs.org/patch/1368816

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
