Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D651B187B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 23:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73F689668;
	Mon, 20 Apr 2020 21:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A06F89668
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 21:31:32 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id j16so10158011oih.10
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 14:31:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=xCbMSBWE/K7CMTFoStyxNkJaPmhk/SFie0hTZQJVUuE=;
 b=fl5uj6qRw1W3MfkcLdVIa+YvzXYmsTzF+oVzyTQ2Yj4q1jh/+YMMod/OgSWc3WYgk7
 HYz+srsSS3VnymCCTqOhmFelyNgWfETktwr6frbkEaziE1/4e/GSfW5nhKRpThZRP4OU
 +PnUEo4bRSDKP8RdJ83E9XNvSRySVu8qIycg9pseVJeoyBW5FqiqW5qb1I0PZBoImzeb
 437tV/7wvV16jmQOxc/ORfvDC0aeRNp8u7eF/kIL/215Hm1HziB2sEeJQh/77oYWU72u
 WvqRUgSQ/UYHWAr+IlJTVG+AMuxlleyqdFm0hxAwSTS1rebMVibHzyQXb2GuMl+nbiOB
 k9DQ==
X-Gm-Message-State: AGi0Puac1SybPBAcUegbz95qSEg9r77VG7UE/DAnT8x2MTehkqlBKkBz
 2I5OZSVUYawHrEC/HmyVAQ==
X-Google-Smtp-Source: APiQypKp/aMom3WcZIgx4KD9/tZ1PBp+icqSBiPeREh6uL2GtZ7nUmS6xX3EHcojP7gq2hudxYyZ2A==
X-Received: by 2002:aca:4155:: with SMTP id o82mr1118364oia.16.1587418291457; 
 Mon, 20 Apr 2020 14:31:31 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id s73sm171791oih.14.2020.04.20.14.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 14:31:30 -0700 (PDT)
Received: (nullmailer pid 22338 invoked by uid 1000);
 Mon, 20 Apr 2020 21:31:29 -0000
Date: Mon, 20 Apr 2020 16:31:29 -0500
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v15 2/3] dt-bindings: display: mediatek: convert the
 document format from txt to yaml
Message-ID: <20200420213129.GA22262@bogus>
References: <20200415011319.25559-1-jitao.shi@mediatek.com>
 <20200415011319.25559-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415011319.25559-3-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Jitao Shi <jitao.shi@mediatek.com>, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, huijuan.xie@mediatek.com, stonea168@163.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Apr 2020 09:13:18 +0800, Jitao Shi wrote:
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,dpi.txt     | 42 ----------
>  .../bindings/display/mediatek/mediatek,dpi.yaml    | 97 ++++++++++++++++++++++
>  2 files changed, 97 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
