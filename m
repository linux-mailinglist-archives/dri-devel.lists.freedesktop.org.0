Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4554E16EC25
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 18:11:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A14888427;
	Tue, 25 Feb 2020 17:10:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A722F6EB48
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 17:10:55 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id q81so67032oig.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 09:10:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WxYxKuDCjw2ta/VcYxfG6H2pyMpZknzieLnpy09W8ak=;
 b=qZdsxneK1lC5CW3uaQwnQYubUvrv/ReFFI8x+4/kmlgD/MR+lF09I7G5KTeha+QB/P
 Xkdm88VhWoVt6kqk3Eb2eusnqkJc7dii4ZkvT8PLmPi073/FIfs3c8K3NOdyKpqP9oCD
 bF24R9iUoU2YJHfN9CVaskjDdGEffmPfuWrsHbrcXIklnTLtOVTWBizzzzgfNxeCACr/
 UQd8bxC0fIhahsF/QBwcB2xmT8CR273hR+YDzC15YNbX+N9Jr82xgvsE3u4Fa3qEZbm9
 D4kIW52BTUaY38f9DBupC4JZpNRL/XhmgC/GZRU0RB4e3QcP1V2C7hRZJEmO8M4IAOsH
 s6Eg==
X-Gm-Message-State: APjAAAU5GM6O4T9E6AzPdfGKXUakaoXqQZ2RsJTR4zaa6/jGwbamFs3V
 v2Qd6o1NJ1OVADzwhAR5tA==
X-Google-Smtp-Source: APXvYqyNZeSueBjr4b/f5cuT3NJLbY2PjOkM3NiotToiEr0JE4LRnFFXTwEwBP5qHj5CvNRnu0FATA==
X-Received: by 2002:aca:c401:: with SMTP id u1mr9332oif.62.1582650654724;
 Tue, 25 Feb 2020 09:10:54 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m18sm5830700otf.6.2020.02.25.09.10.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:10:53 -0800 (PST)
Received: (nullmailer pid 6373 invoked by uid 1000);
 Tue, 25 Feb 2020 17:10:52 -0000
Date: Tue, 25 Feb 2020 11:10:52 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v8 2/7] dt-bindings: display: mediatek: update dpi
 supported chips
Message-ID: <20200225171052.GA6002@bogus>
References: <20200225094057.120144-1-jitao.shi@mediatek.com>
 <20200225094057.120144-3-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225094057.120144-3-jitao.shi@mediatek.com>
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

On Tue, 25 Feb 2020 17:40:52 +0800, Jitao Shi wrote:
> Add descriptions about supported chips, including MT2701 & MT8173 &
> mt8183
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 

Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
