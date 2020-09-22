Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB5627461B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 18:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D9EC6E8BA;
	Tue, 22 Sep 2020 16:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f195.google.com (mail-il1-f195.google.com
 [209.85.166.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1545F6E8EA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 16:04:54 +0000 (UTC)
Received: by mail-il1-f195.google.com with SMTP id y9so17826489ilq.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 09:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CKfLdUexUfPdpjwTDlKQ3XKMxqzDUbFupt+mG72mDMc=;
 b=SHGmIrwbSrR8C76zodkIO7iAgYelIoQQ36AHI6sc6YY1PX5vYM4/Jny6hQk3zeF1nW
 JBJuDwWQyaA2EOpSrO+bmQqHwMW49zb+GqCK9C622OA8exuPEuf6ewDR1YlbhZ1zSdbu
 0X4s4ymyzyUqvN3JYVynOhXtBpxlUjueVsPfriPX4CU/gzaj69xO5RJSajKlDSBNclHx
 jFvIzDbeMMUG+/u5OGFdOZPaQowxUqc02XzQvOM+HVatcWaBlgTIYw/Y55J3sG8ZU7Wx
 dVFwr3ND+A3++M6IEdNoeFzyrrrf7rHyZPCAlri6Uo9MyrGmYCvcJd1Rb5SQmIvyp19c
 rnFQ==
X-Gm-Message-State: AOAM530o4Ss0rLvgE6gvsdcEeRJV5zTs8VcC7m3EDOSzSrAuETIork9C
 Qe+BPlW5BvQpK8Wlhm1xww==
X-Google-Smtp-Source: ABdhPJyGE4qpjft/53rjEnM1nes6ybplFwv2lRkqN4ajfiISqxLZHyh9XWi1DNlUUSO+vOKKTAg4Fw==
X-Received: by 2002:a92:730b:: with SMTP id o11mr4773209ilc.91.1600790694176; 
 Tue, 22 Sep 2020 09:04:54 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id k2sm7557712ioj.2.2020.09.22.09.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 09:04:53 -0700 (PDT)
Received: (nullmailer pid 2769164 invoked by uid 1000);
 Tue, 22 Sep 2020 16:04:52 -0000
Date: Tue, 22 Sep 2020 10:04:52 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 2/4] dt-bindings: phy: convert phy-mtk-tphy.txt to YAML
 schema
Message-ID: <20200922160452.GA2768616@bogus>
References: <5af7c097d1c71a180d8ed1f1a44055859b42f1a0.1600760719.git.chunfeng.yun@mediatek.com>
 <33b4c569db10d983c7a9485a8bd6ec4efc0a1242.1600760719.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33b4c569db10d983c7a9485a8bd6ec4efc0a1242.1600760719.git.chunfeng.yun@mediatek.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Stanley Chu <stanley.chu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Sep 2020 15:55:06 +0800, Chunfeng Yun wrote:
> Convert phy-mtk-tphy.txt to YAML schema mediatek,tphy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../bindings/phy/mediatek,tphy.yaml           | 260 ++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-tphy.txt  | 162 -----------
>  2 files changed, 260 insertions(+), 162 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-tphy.txt
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: t-phy@11290000: usb-phy@11290800:clocks: [[4294967295, 15]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: t-phy@11290000: usb-phy@11290800:clock-names: ['ref'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: t-phy@11290000: usb-phy@11290900:clocks: [[4294967295]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: t-phy@11290000: usb-phy@11290900:clock-names: ['ref'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: t-phy@11290000: usb-phy@11291000:clocks: [[4294967295, 15]] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.example.dt.yaml: t-phy@11290000: usb-phy@11291000:clock-names: ['ref'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml


See https://patchwork.ozlabs.org/patch/1368817

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
