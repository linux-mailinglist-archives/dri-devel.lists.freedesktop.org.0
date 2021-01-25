Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C85302B90
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 20:27:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09F489ED3;
	Mon, 25 Jan 2021 19:27:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8239989ED3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 19:27:11 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id k25so1852505oik.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jan 2021 11:27:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4pMzj4F5sGyiw0Npjv+oCcMmAv4Qz6Br4C1Wz04rzwo=;
 b=b/HBz1cFKWsj0J/F9/2DsBvwHbuIA5PZevAIwcTnnsWvvDIl3R8jhdwBxpHzlHHtcn
 EcU9BgYgd/ASMzfB5b+BSkR/v+44XaeTZxxmnYuk60HGO1ChvD1hzMSRvDuOBCi/MrgG
 yfgqvSi+Yn0z7nCkYjTZQtxUPZAx6iM/KydwJmrTZ9UQCK+Kzm7sMv0Usnv3IgmLbXaX
 057OH60YYzyQ5BpIHg7MxUbPZVO6hzGTEYBbV5hxfJ+oUC0dp0xR/rW5y2eMYlVAO75w
 SmTrvg4wO/1EEnET4BGmhfQv/KnleJ6JtcJVivTF4QNYogu8L1sSFUGMzO0SBzI2jjZA
 ieyw==
X-Gm-Message-State: AOAM533qZiQ2ESEZWsiviT+h7H4OBPGEigvlBAOPHNI2SY01rTD31k5M
 MqGLO8P9vPsV9ZJ/FYcMQQ==
X-Google-Smtp-Source: ABdhPJxAzJx2x6+i0A4uT7fsLRy+H8EdaY+p15TtbYRd+1pf2Vnetwij66uSg6hpWaWh7MJzjj8eTw==
X-Received: by 2002:a05:6808:213:: with SMTP id
 l19mr1038857oie.83.1611602830875; 
 Mon, 25 Jan 2021 11:27:10 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t12sm1177551ooi.45.2021.01.25.11.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 11:27:09 -0800 (PST)
Received: (nullmailer pid 813043 invoked by uid 1000);
 Mon, 25 Jan 2021 19:27:07 -0000
Date: Mon, 25 Jan 2021 13:27:07 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v10 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
Message-ID: <20210125192707.GA813009@robh.at.kernel.org>
References: <20210113060703.3122661-1-drinkcat@chromium.org>
 <20210113140546.v10.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210113140546.v10.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
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
Cc: devicetree@vger.kernel.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 fshao@chromium.org, David Airlie <airlied@linux.ie>, hsinyi@chromium.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 boris.brezillon@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Jan 2021 14:07:00 +0800, Nicolas Boichat wrote:
> Define a compatible string for the Mali Bifrost GPU found in
> Mediatek's MT8183 SoCs.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> 
> Changes in v10:
>  - Fix the binding to make sure sram-supply property can be provided.
> 
> Changes in v6:
>  - Rebased, actually tested with recent mesa driver.
>  - No change
> 
> Changes in v5:
>  - Rename "2d" power domain to "core2"
> 
> Changes in v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
> 
> Changes in v3:
>  - No change
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
