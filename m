Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E045A462361
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 22:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85CB6E1BE;
	Mon, 29 Nov 2021 21:32:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514EC6E1BE
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 21:32:41 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id bf8so37189328oib.6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 13:32:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RW7Kic35D09JywoCPiX4Hf5lonYwWJ2pHhLH0p3k1bA=;
 b=TeSjTA58zL5tkSv6fghEK0HaxLT4td0vXb0NhvE244fxlJwbZ1ltIwn9aZoi/UWjM4
 cea9D5W6MGJCZfU4wojrAf0BpcamqlUIP3Z5UR7SLx1tOjHakctmLTBx1bvYn4g9DeJ3
 5BLVh0X3wmGqgtLu3V4mFRYgQ2YO1SsfMOr7uOB+OblP2x3w/9dSHWt7ZeH2Lfjm9SQs
 pY7gMbarie4eJMuY/OczqyYeeCPFmGRIZV5aNhawG4cDI0/oila/LuEZXNQBejy+2LQq
 /xtcAs1T0BL7A0BOylZ7Df41OV5gki5VSxw3K08h64CZ5yAduSJh4YYej9JuqBJuoqWj
 LoRw==
X-Gm-Message-State: AOAM531BeyenvZZtiDPiPyKNxQGNEZJ/qjVigV8WAwq2uI8Upl1B6jYH
 SEQs2rPh09hMVc+MjL8arQ==
X-Google-Smtp-Source: ABdhPJwwr3ACGskcfmkUvbtDgGd1fiaHTmvZ31KfFo5cY7XqvZlbBXtx2LECKeAOzsKoomhOfpBBgA==
X-Received: by 2002:aca:f20a:: with SMTP id q10mr565923oih.176.1638221560620; 
 Mon, 29 Nov 2021 13:32:40 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id w2sm2404466ooa.26.2021.11.29.13.32.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 13:32:40 -0800 (PST)
Received: (nullmailer pid 647021 invoked by uid 1000);
 Mon, 29 Nov 2021 21:32:39 -0000
Date: Mon, 29 Nov 2021 15:32:39 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: sharp,lq101r1sx01: Add compatible
 for LQ101R1SX03
Message-ID: <YaVG93LCF6MQYiSi@robh.at.kernel.org>
References: <20211114200717.28986-1-digetx@gmail.com>
 <20211114200717.28986-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211114200717.28986-2-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>, linux-tegra@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 14, 2021 at 11:07:16PM +0300, Dmitry Osipenko wrote:
> From: Anton Bambura <jenneron@protonmail.com>
> 
> LQ101R1SX03 is compatible with LQ101R1SX01, document it.

Then sounds like '"sharp,lq101r1sx03", "sharp,lq101r1sx01"' would be the 
appropriate compatible value. Do that, and you don't need a driver 
change.

> 
> Signed-off-by: Anton Bambura <jenneron@protonmail.com>
> ---
>  .../devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml  | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
> index a679d3647dbd..f7514eb9ebda 100644
> --- a/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml
> @@ -30,7 +30,9 @@ allOf:
>  
>  properties:
>    compatible:
> -    const: sharp,lq101r1sx01
> +    enum:
> +      - sharp,lq101r1sx01
> +      - sharp,lq101r1sx03
>  
>    reg: true
>    power-supply: true
> -- 
> 2.33.1
> 
> 
