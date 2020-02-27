Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3436D1724C9
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 18:15:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3A96E95D;
	Thu, 27 Feb 2020 17:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16C2C6E95D
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 17:15:40 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id q81so4097607oig.0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 09:15:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=E2s4W1sTyFGQwdK13Lex3fESSAYc6q6IIVmN459eOYE=;
 b=g3pKK6MgjF9ylzAsCjKbRlGAbwyCjJbyRRiX0l6DCJQjX7BLlZ5Zdcdtfy6hOcVwd4
 65HeqAP3GWXGsmdebwAY5pUwdBHVRSYfxDKA68tdqRW1LJYYSB/kSDLFdGUlTivoNN+w
 VBibbMrqLQ84iiPVGPhgAnoutkG8snbL9i6xSIw9WBFAggfudm9pAzRLgLD6W5ofQ9Kr
 3whicxZPmQqtF5b2tZqQ4LlRb4BLUS6OqAVc+fRPDBGpTlRKA+7QwQ02g1F6/niuhzfB
 BWAr42L+cOVu0hVARicxOGDVO0MZwibBKLqVi6CHBwjjzmFvp2pjbf2aPMjKoJfyNOQc
 itRw==
X-Gm-Message-State: APjAAAUgFKLFbmeoTdxYf9hVFbUezzD2wt38PWVlKQqVYyPdSbeo5DdZ
 yRv+7GMuy4uvpdcvQBsDrg==
X-Google-Smtp-Source: APXvYqzPY/x9+leT8mGPZrSZwA6cJInd+YOsSLBRuvxwItyWmhZNQAKo6BVOMNji/xfmQgysRVoyAQ==
X-Received: by 2002:aca:b9c2:: with SMTP id j185mr59225oif.112.1582823739377; 
 Thu, 27 Feb 2020 09:15:39 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t9sm2108218otm.76.2020.02.27.09.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 09:15:37 -0800 (PST)
Received: (nullmailer pid 14499 invoked by uid 1000);
 Thu, 27 Feb 2020 17:15:36 -0000
Date: Thu, 27 Feb 2020 11:15:36 -0600
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v9 1/5] dt-bindings: media: add pclk-sample dual edge
 property
Message-ID: <20200227171536.GA14418@bogus>
References: <20200226053238.31646-1-jitao.shi@mediatek.com>
 <20200226053238.31646-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200226053238.31646-2-jitao.shi@mediatek.com>
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

On Wed, 26 Feb 2020 13:32:34 +0800, Jitao Shi wrote:
> Some chips's sample mode are rising, falling and dual edge (both
> falling and rising edge).
> Extern the pclk-sample property to support dual edge.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/video-interfaces.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
