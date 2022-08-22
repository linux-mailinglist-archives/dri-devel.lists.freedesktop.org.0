Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEBE59C5A8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 20:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB37B9B957;
	Mon, 22 Aug 2022 18:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B439B926
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 18:04:07 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-11cb3c811d9so12167806fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 11:04:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=pA++Iu9p2JopuB6JUITUXG7KLROVNcmOWnSn6LTggfc=;
 b=IZEat3c+0YtmqjFljtN5hXhviY2S1p8/CxHPnmGahClSNMrfr4G+SBeDEroLIDmCoe
 jz2KZ36W4hTAhiACAB/Gy1F3OyA9eD5oUU7IpEwvmtvizNgO4+zA5M6WdTWRfoUX51xQ
 8Dijoh+dk4mSX+xwj4ztmZCECFcnXljBgVNPbltUDfIRqC5FG99OkS/6U5VGhZyWJGBZ
 tHFJm4+cEJ2FVjpFBvgNG5IelTjq12650BHWoMf3zgn7weEb1z6f8CmqeyVCZENnZG7X
 jyQkfVsOakcBccNSqwHSmQXvDWWeP6E2ipGxZbrMU5OZKbGPcs7yctHvtTba3T67elu8
 L13w==
X-Gm-Message-State: ACgBeo1k6orqC+7o7t82cZvS9/p2b95jNti8rHKefgwQ1BLHuaqJeDdT
 UlYY0l5IYd6unmnt93evbw==
X-Google-Smtp-Source: AA6agR5hUiVd/6srf4Qzt7WmWVXXxN/fKwe2rBX366NnnuCtZ0xEIzK1+aEvcrFiEU87ZRniN+D4lw==
X-Received: by 2002:a05:6870:64a1:b0:11c:5ca9:e519 with SMTP id
 cz33-20020a05687064a100b0011c5ca9e519mr12661713oab.4.1661191446430; 
 Mon, 22 Aug 2022 11:04:06 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v23-20020a544497000000b0034480f7eec4sm2724879oiv.12.2022.08.22.11.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 11:04:06 -0700 (PDT)
Received: (nullmailer pid 75047 invoked by uid 1000);
 Mon, 22 Aug 2022 18:04:05 -0000
Date: Mon, 22 Aug 2022 13:04:05 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] dt-bindings: gpu: arm,mali: restrict opp-table to
 objects
Message-ID: <20220822180405.GA75021-robh@kernel.org>
References: <20220818061713.9611-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220818061713.9611-1-krzysztof.kozlowski@linaro.org>
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
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Aug 2022 09:17:13 +0300, Krzysztof Kozlowski wrote:
> Simple 'opp-table:true' accepts a boolean property as opp-table, so
> restrict it to object to properly enforce real OPP table nodes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Correct typo in msg.
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 3 ++-
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml  | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 

Applied, thanks!
