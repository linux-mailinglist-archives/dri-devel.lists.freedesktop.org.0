Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 055ED53ECE6
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 19:19:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC46211B1A0;
	Mon,  6 Jun 2022 17:19:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9547D11B13E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 17:18:59 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id f12so12414396ilj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 10:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oUB1RtAxwcnRE2CEYiw/IkNM/uWyKljTbcTDvBqQ/Ms=;
 b=bcUkeBu52w57JHZKcdWdGdMnLB+HzGRLgYF7Z1UtmgwU7pp9YqD6atI1x2Z2NAMFNp
 m3BR9ztm1GcHPu3tq97+5uS7YHds86HVyiJzEF4Tw9VU1r0KaPjcoDUN4kYXqv6LU7Eh
 CBuYf+dRNeth/BwgFBuFRDsGvkTcrj53vqAPGGPrMtCiD+/g4q/NPfJia13IfrDH6DpP
 LlfCoAtfiAz6NEVVMy4BE+q8y40fPN1Wscoqb7VOUtoxcViAjaRlMFMdvznmrr2KOYtK
 rp639Cf3WhkUD5s72AGl3DCtEVk7lgLnlwN5uif+Z3NYmCU1DiSF2HVdQzeLKU4ks5uK
 0QJg==
X-Gm-Message-State: AOAM5333JIk4vY//gTL8fHMgqwCSr6QRskTbc9Nx4rVT+iQquS0N54f6
 xD8TsSjdlbujddaMQeyeqg==
X-Google-Smtp-Source: ABdhPJwwqIpJPlfuz1tpdxBnIscqptcD/jrSI7SGTP9v7AyxAyS8obOg7qY7NyGvzBbBtOYBzZmBUg==
X-Received: by 2002:a05:6e02:1523:b0:2d3:cb16:2d03 with SMTP id
 i3-20020a056e02152300b002d3cb162d03mr14157340ilu.198.1654535938816; 
 Mon, 06 Jun 2022 10:18:58 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a022101000000b0032b3a78179csm5823216jaa.96.2022.06.06.10.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 10:18:58 -0700 (PDT)
Received: (nullmailer pid 912769 invoked by uid 1000);
 Mon, 06 Jun 2022 17:18:55 -0000
Date: Mon, 6 Jun 2022 12:18:55 -0500
From: Rob Herring <robh@kernel.org>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entries for ARM DRM DRIVERS after
 dt conversion
Message-ID: <20220606171855.GA912412-robh@kernel.org>
References: <20220601041746.22986-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601041746.22986-1-lukas.bulwahn@gmail.com>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 malidp@foss.arm.com, Andre Przywara <andre.przywara@arm.com>,
 James Wang <james.qian.wang@arm.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 01 Jun 2022 06:17:46 +0200, Lukas Bulwahn wrote:
> The three commits:
> 
>   36fd2a65bcaf ("dt-bindings: display: convert Arm HDLCD to DT schema")
>   0f6983509ea1 ("dt-bindings: display: convert Arm Komeda to DT schema")
>   2c8b082a3ab1 ("dt-bindings: display: convert Arm Mali-DP to DT schema")
> 
> convert the arm display dt-bindings, arm,*.txt to arm,*.yaml, but miss to
> adjust its reference in MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about
> broken references.
> 
> Repair these file references in ARM HDLCD DRM DRIVER, ARM KOMEDA DRM-KMS
> DRIVER and ARM MALI-DP DRM DRIVER.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Andre, please ack.
> Rob, Krzysztof, please pick this minor non-urgent clean-up patch in
> your -next dt tree.
> 
>  MAINTAINERS | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 

Applied, thanks!
