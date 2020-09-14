Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5B426949B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 20:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 577316E505;
	Mon, 14 Sep 2020 18:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A0B6E505
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 18:16:27 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id y13so1150915iow.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 11:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gkgh20bzSMEzQBjaR/yXNkvt2d9QAmenQ6iuJ6sWbhQ=;
 b=H/Plums552p2hFFRT9mENOzU0n0SfQJTwBKNJ/PVkS9mT/haIfykhqXVEgJ3MgRUzi
 7bz2I79/ulPRxkkqyB38te+KuNlaXebKMXUwb5w8wdfXGZkonKcGOJy4dwF8tw6I1TN9
 A+UzdHnLLr5HPTCLwy5eBGt8zJs6GZEGTSwP5CgvYoXOrVAu7wGBX+v5iuiimkVc3lg6
 LqzXY1cmJF+51YSP9NpUQNwBERlrhuK/u5+/2W37MDiFAFQ1Z4MS4bkirKeYMQxPdoKX
 WrkuhWnfP7MJtIFFm0RSYvrod2qdEgXubBbK8QIOyN/nkWcMMJ3Zo3SRhljiuGN/Utpa
 cZVg==
X-Gm-Message-State: AOAM5323773wrJG7ve69cSddg2IHai3RLyfwkf+MZnle2RSUpIDKfEeL
 Ygpb5tIGs84YoIxQOaP+KA==
X-Google-Smtp-Source: ABdhPJysQTS83/P0m/NWQcM+Si2V+AT/0soNX7Yd+tqoN1X+CxgOiIkfng9Eqf/6+mv48oGeuJ5e0w==
X-Received: by 2002:a5d:96ce:: with SMTP id r14mr12026983iol.146.1600107386676; 
 Mon, 14 Sep 2020 11:16:26 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id y10sm6300353ioy.25.2020.09.14.11.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 11:16:26 -0700 (PDT)
Received: (nullmailer pid 4172155 invoked by uid 1000);
 Mon, 14 Sep 2020 18:16:22 -0000
Date: Mon, 14 Sep 2020 12:16:22 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: samsung, amoled-mipi-dsi: Do
 not require enable-gpios on samsung, s6e63j0x03
Message-ID: <20200914181622.GA4172076@bogus>
References: <20200829172532.29358-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200829172532.29358-1-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sylwester Nawrocki <snawrocki@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Kukjin Kim <kgene@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Hoegeun Kwon <hoegeun.kwon@samsung.com>, linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Aug 2020 19:25:29 +0200, Krzysztof Kozlowski wrote:
> The samsung,s6e63j0x03 does not have enable GPIO, so do not require it.
> This fixes dtbs_check warning:
> 
>   arch/arm/boot/dts/exynos3250-rinato.dt.yaml: panel@0: 'enable-gpios' is a required property
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .../display/panel/samsung,amoled-mipi-dsi.yaml       | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
