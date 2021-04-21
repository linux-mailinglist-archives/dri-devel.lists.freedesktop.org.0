Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 758FD3670C5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 18:59:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38BB6E0CF;
	Wed, 21 Apr 2021 16:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265AD6E0CF
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 16:59:54 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id
 65-20020a9d03470000b02902808b4aec6dso34792069otv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 09:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=h+2uWSkW19YMSUIgrRyX+Zrerp6y6BIi//8JY71zHg0=;
 b=XHtdBpc/kdBZ2rlMn3b+5q6VpL1vNaKD0e2clgRr19xqw07IwvgdpC5kKiE506Xj5b
 qnoZKT4t34TWJF5rSH1XgmvoO5vLWpZ092u/8tPGHZ4BY3khswl35FUYuxN5CnM7ncpA
 OdFNYoeq76ZvQcsMGOXHfc3fUj7xZTMKeuZ5Xb49x3W7PqwXzy1IRWRkrL7mPFFAiYP8
 ZHxPasNwj6msYrpNAt7Er62vROQEFHWe/eF5c9wZql5P1FDjpko3W7Own6VP0Zxm+sgf
 tk1NaQAMtMDwNA24gxVlwmIZ/rQ0QPEWpV6MFTPUDkAqGaolyopmZFc85E5txqiEbyjb
 9/4Q==
X-Gm-Message-State: AOAM533mfzX4gdaBBQPKhQ72Pt5ncN5rdrU1kJ3p5VpgHTX9LtXRTTLB
 k6FODboF3v9/vxqROCgbuQ==
X-Google-Smtp-Source: ABdhPJwWoz3BS4dg+l9N7pX1PZhZ/4wlq0ogtsxElhcG8h2QSloGBtatkURwBVfcHg/r68nPpaIvzw==
X-Received: by 2002:a9d:615b:: with SMTP id c27mr22752308otk.119.1619024393434; 
 Wed, 21 Apr 2021 09:59:53 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w23sm643762otl.60.2021.04.21.09.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 09:59:52 -0700 (PDT)
Received: (nullmailer pid 1292145 invoked by uid 1000);
 Wed, 21 Apr 2021 16:59:51 -0000
Date: Wed, 21 Apr 2021 11:59:51 -0500
From: Rob Herring <robh@kernel.org>
To: Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH v13 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
Message-ID: <20210421165951.GA1292095@robh.at.kernel.org>
References: <20210421052855.1279713-1-drinkcat@chromium.org>
 <20210421132841.v13.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210421132841.v13.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
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
 Steven Price <steven.price@arm.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 boris.brezillon@collabora.com, Matthias Brugger <matthias.bgg@gmail.com>,
 hoegsberg@chromium.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 21 Apr 2021 13:28:52 +0800, Nicolas Boichat wrote:
> Define a compatible string for the Mali Bifrost GPU found in
> Mediatek's MT8183 SoCs.
> 
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> 
> (no changes since v12)
> 
> Changes in v12:
>  - binding: Fix min/maxItems logic (Rob Herring)
> 
> Changes in v11:
>  - binding: power-domain-names not power-domainS-names
> 
> Changes in v10:
>  - Fix the binding to make sure sram-supply property can be provided.
> 
> Changes in v6:
>  - Rebased, actually tested with recent mesa driver.
> 
> Changes in v5:
>  - Rename "2d" power domain to "core2"
> 
> Changes in v4:
>  - Add power-domain-names description
>    (kept Alyssa's reviewed-by as the change is minor)
> 
>  .../bindings/gpu/arm,mali-bifrost.yaml        | 30 ++++++++++++++++++-
>  1 file changed, 29 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
