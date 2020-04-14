Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB551A87BA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 19:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08146E50B;
	Tue, 14 Apr 2020 17:41:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B30D06E50C
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 17:41:09 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id k9so11137240oia.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 10:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=oy5Pa2pThiwkYu8G4GkTHJjme1DMBn7sY2MflS7Zuig=;
 b=Axv1gH5vXi/SEoFWZ7naxdIg4+sGDGnJR31VfIOLTASX8dBiDD+u5yMY9FJZIcoRyr
 wsJcTfbYT92F5Ke0XNCVIQdaerSfk9aeolUvjxuyVNaG51FYBPLL2CJOM53MIykHaJQK
 1pTkSEaqr1L1aHljlFDtWuG5r6kPOx+HhYYfBZK6e6Zda/8in28OAvypFo38gykmSGJG
 d1GgBwkbN7WMegPBtswl+x5Yluhfsc2c9JhS4i4xDw4BjoCMOqqJZPZ7gtbQGKIeJPs/
 IQOzdfkF2x2ZXdp/v7GQSusuRErsFJVwUT7iIpnRIZJfIdcWQ09eFrGpQ5nOPB7NwH7k
 YWpw==
X-Gm-Message-State: AGi0Puans4366Q9J7Sgf/bti3W6bDx79arhQYJrQn41Iv7v9FurnSqh3
 sTlMMhUM+52qwUK+MTEQvTKW8EE=
X-Google-Smtp-Source: APiQypKD41PgBlcTSotaK7Yjth1ocx/nKnHfnnEGSNYS9OULrLgLODfCIhLnCRAsdGgLQ4hyeSvY7w==
X-Received: by 2002:aca:ef82:: with SMTP id n124mr15636268oih.73.1586886069014; 
 Tue, 14 Apr 2020 10:41:09 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id e22sm3984048otk.59.2020.04.14.10.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 10:41:08 -0700 (PDT)
Received: (nullmailer pid 6218 invoked by uid 1000);
 Tue, 14 Apr 2020 17:41:07 -0000
Date: Tue, 14 Apr 2020 12:41:07 -0500
From: Rob Herring <robh@kernel.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v14 1/3] dt-bindings: display: mediatek: control dpi pins
 mode to avoid leakage
Message-ID: <20200414174107.GA6165@bogus>
References: <20200403080350.95826-1-jitao.shi@mediatek.com>
 <20200403080350.95826-2-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403080350.95826-2-jitao.shi@mediatek.com>
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

On Fri, 3 Apr 2020 16:03:48 +0800, Jitao Shi wrote:
> Add property "pinctrl-names" to swap pin mode between gpio and dpi mode. Set
> the dpi pins to gpio mode and output-low to avoid leakage current when dpi
> disabled.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.txt   | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
