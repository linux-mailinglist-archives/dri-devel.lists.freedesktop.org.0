Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F110727462E
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 18:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36EB6E8AD;
	Tue, 22 Sep 2020 16:07:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDC1B6E8B5
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 16:07:20 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id y74so20159260iof.12
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 09:07:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zF77TzjrjYmXHXCkSrv/gVnYfB2PIU90P8T+fzmt7Pk=;
 b=jsuOkBv3JvJcYazyRYrDbH1eroaYWHGd4QbwQZbvHxuFjHMP2pX0lhyRWXW3xxuQLp
 CuW6XrdNCrJZvyv+kaN2G//JSqFrunj6bnUSc05oNfO+f7DNqbAhft1clpnLbiUvhltS
 weYnGd/mMP2ndDhho+/1PVl0iD3LDP7maj/h12qvMJz0uI/52jaVhylj8VQWAOm4KGF5
 ZeJiUeJr69vM/vF/+EpfPkXPjdryUv3HgZiJwaWYm3544bFr2Q+aBXQSqdpJHgmrKfuA
 lIhJvdd6hTkVYxv91AmbaGfozlMFZzBKUleGNs/pP3QbyQmwqtg62G8nVNjZZ5q/OgYn
 Qq4A==
X-Gm-Message-State: AOAM533K4wSsaUQce2/BapXA/q0n6N8++XYDGUMpyJFIWdNXkl7ZIlEP
 OZvxHnlkDaUcPpGkebj8uA==
X-Google-Smtp-Source: ABdhPJzt0CvS500bgQNFVROZZ0PumLBOgLUdWUuWg7zB0QotcFRl7mSab3HVsaqhvkXOoytRw5oRZg==
X-Received: by 2002:a05:6602:2013:: with SMTP id
 y19mr3976939iod.148.1600790840376; 
 Tue, 22 Sep 2020 09:07:20 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id 2sm5005397iow.4.2020.09.22.09.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 09:07:19 -0700 (PDT)
Received: (nullmailer pid 2773058 invoked by uid 1000);
 Tue, 22 Sep 2020 16:07:18 -0000
Date: Tue, 22 Sep 2020 10:07:18 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH 3/4] dt-bindings: phy: convert phy-mtk-ufs.txt to YAML
 schema
Message-ID: <20200922160718.GA2772140@bogus>
References: <5af7c097d1c71a180d8ed1f1a44055859b42f1a0.1600760719.git.chunfeng.yun@mediatek.com>
 <006ecd5b88fd7d23a355f2522c37e745f72ac45a.1600760719.git.chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <006ecd5b88fd7d23a355f2522c37e745f72ac45a.1600760719.git.chunfeng.yun@mediatek.com>
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

On Tue, 22 Sep 2020 15:55:07 +0800, Chunfeng Yun wrote:
> Convert phy-mtk-ufs.txt to YAML schema mediatek,ufs-phy.yaml
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../bindings/phy/mediatek,ufs-phy.yaml        | 64 +++++++++++++++++++
>  .../devicetree/bindings/phy/phy-mtk-ufs.txt   | 38 -----------
>  2 files changed, 64 insertions(+), 38 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/phy/mediatek,ufs-phy.yaml
>  delete mode 100644 Documentation/devicetree/bindings/phy/phy-mtk-ufs.txt
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/phy/mediatek,ufs-phy.example.dt.yaml: example-0: ufs-phy@11fa0000:reg:0: [0, 301596672, 0, 49152] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml


See https://patchwork.ozlabs.org/patch/1368813

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
