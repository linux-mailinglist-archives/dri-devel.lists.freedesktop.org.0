Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD8E1F9CA7
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 18:10:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3836E375;
	Mon, 15 Jun 2020 16:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D256E375
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 16:09:58 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id c8so18505389iob.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 09:09:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6pcmdJx4HNdfvoURK0pS/uo9gcQBvUR51Fl9F7RD+2g=;
 b=GLFqCOBjMzSd7oA+WbFY5c/R7fLMfOASNFQhs5yPNLpFBretxIbMILbEWSnbZpycV9
 +LFrA134QKnp/7RzBzNDLSY3gs8tl8pSZr4AGSXAVmPvdsx3Y8bFdGAHfx48ikP/jvBQ
 4JcY0sA4Zo9WYbBBw45GElZN86HilvL2QqbeUvgyIBPADwwl+b2NCIRP58QNbHmBY7b0
 f0W5n2bad2N/58OXoqvrxGkJqCXiO0CwdyB1ALf5trYR/5JtN6HpaaxQ7X2Ag1sNRF2T
 DlgAJ+CKJLYRUP1BvJoxA2xWWUueDmJqib+RlzbIBc34pnV0B3fU1xIND1jOnO6SDgD7
 vkkA==
X-Gm-Message-State: AOAM530VspWqHRZIN7fpopM7T8wKa6rs1oaAwjxGsVF5a1VDezmCmTCC
 Fm4KO388VcDvw2ZALqD/Nw==
X-Google-Smtp-Source: ABdhPJxjLCBX9sKIbflLAfGJFvnKwPQdtJxMytSuki4Cyx5b84o8tX12LEkI1o1hSS+BanuS7tOEZQ==
X-Received: by 2002:a6b:4413:: with SMTP id r19mr27931825ioa.162.1592237397848; 
 Mon, 15 Jun 2020 09:09:57 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id j63sm8448166ilg.50.2020.06.15.09.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 09:09:57 -0700 (PDT)
Received: (nullmailer pid 1861733 invoked by uid 1000);
 Mon, 15 Jun 2020 16:09:56 -0000
Date: Mon, 15 Jun 2020 10:09:56 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v16 1/1] dt-bindings: display: mediatek: convert the dpi
 bindings to yaml
Message-ID: <20200615160956.GB1861039@bogus>
References: <20200614073036.63969-1-jitao.shi@mediatek.com>
 <20200614073036.63969-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200614073036.63969-2-jitao.shi@mediatek.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 huijuan.xie@mediatek.com, stonea168@163.com, cawa.cheng@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 14 Jun 2020 15:30:36 +0800, Jitao Shi wrote:
> Convert display/mediatek/mediatek,dpi.txt to display/mediatek/mediatek,dpi.yaml
> and remove the old text bindings.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dpi.txt         | 42 --------
>  .../display/mediatek/mediatek,dpi.yaml        | 97 +++++++++++++++++++
>  2 files changed, 97 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.example.dt.yaml: example-0: dpi@1401d000:reg:0: [0, 335663104, 0, 4096] is too long


See https://patchwork.ozlabs.org/patch/1308901

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
