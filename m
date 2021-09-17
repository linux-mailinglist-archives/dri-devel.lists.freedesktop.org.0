Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5F40EF04
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 03:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 467636EA4C;
	Fri, 17 Sep 2021 01:59:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6D746EA4C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 01:59:05 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id h20so8616841ilj.13
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 18:59:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QncgAYsEAj4J6mbF3tLEr0rEZvz4D8ZpN12NlUMUfpg=;
 b=OoE3mfR4qwgasfF9kENv+L65RRRHSeSM+eUs86GXXB14kM+2Yr8ID4fWAeBca9hAwQ
 cE98ebWJ1vVWgy7xLv4aaSHKgMhEQPZR/dvLQ0aj3d9XEvr1HkuyK7Vpeet9j7J5TLLS
 ASlpeVUIMfp1sFsoCr6lcwJg7S5SH17heCsmIu2lMPhGuYjRMs67/b2FavVSEU69jwZe
 16k+rWo2DQpWeNFBAhqltqBwAUaRU1CLItu/hcyeJztA1a7+/goxbxcDoqbKPeo2XtDn
 Q2J6SjgeQiY/kEgl/m6D4Rn92Rg2hqSAjQhUhrC1uTVqSXYBBgSOrqE+VmX53lP+khWU
 ZlHg==
X-Gm-Message-State: AOAM5307qenDk58ggMgThrPB2fkgmwZYBwZKyIinxsIvr8Pr2pNnR+7v
 KU5+aCltTDWGK4s0CKaV8ik4nGW0qg==
X-Google-Smtp-Source: ABdhPJy4oTaM24SB6z0pQT/ToKAlRejgZB3SLM155KVMirfdI7mWZ3F3MD1XWjhJyelSQtEkJV3ltw==
X-Received: by 2002:a05:6e02:20c3:: with SMTP id
 3mr1021317ilq.269.1631843944967; 
 Thu, 16 Sep 2021 18:59:04 -0700 (PDT)
Received: from robh.at.kernel.org (96-84-70-89-static.hfc.comcastbusiness.net.
 [96.84.70.89])
 by smtp.gmail.com with ESMTPSA id 9sm2670305ily.9.2021.09.16.18.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 18:59:04 -0700 (PDT)
Received: (nullmailer pid 1610039 invoked by uid 1000);
 Fri, 17 Sep 2021 01:58:57 -0000
Date: Thu, 16 Sep 2021 20:58:57 -0500
From: Rob Herring <robh@kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [PATCH v2 03/23] dt-bindings: arm: mediatek: mmsys: update
 mediatek,mmsys.yaml reference
Message-ID: <YUP2YYKTVHdvTfD+@robh.at.kernel.org>
References: <cover.1631785820.git.mchehab+huawei@kernel.org>
 <a87eb079a73e8ab41cdf6e40e80b1d1f868da6bd.1631785820.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a87eb079a73e8ab41cdf6e40e80b1d1f868da6bd.1631785820.git.mchehab+huawei@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 16 Sep 2021 11:55:02 +0200, Mauro Carvalho Chehab wrote:
> Changeset cba3c40d1f97 ("dt-bindings: arm: mediatek: mmsys: convert to YAML format")
> renamed: Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
> to: Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml.
> 
> Update its cross-reference accordingly.
> 
> Fixes: cba3c40d1f97 ("dt-bindings: arm: mediatek: mmsys: convert to YAML format")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,disp.txt      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!
