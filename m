Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569F626970B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 22:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3C46E5A0;
	Mon, 14 Sep 2020 20:51:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D8D96E5A0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 20:51:28 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id a8so953083ilk.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 13:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/nkoIQBB8aeAjFrAyH3N5nJASsyTVOS6e3/91uOJWL0=;
 b=EixcFT9oIBBZr5FJToGMJ4Ym4ZFP7KUNfmJw/WOT3TQEvQzJYtbkVLWygP2MUiMf66
 GcQcQEFmKznEnY+cXj3Bm79N8eHSt/b5hqHfGajBfOxsfpPjr5HzB00ysPL7DUG+qZ75
 6Oe1g2jNSPPiYt7xFtqZM9zxskm28ZWKAlxyyaV1j8+u3ovPvqcV7pj6Rc54xUUoTlQC
 i8F66XfvJdpSUY0XLDGSfvG5CbeJAlB7+HS0tcx+L7PirFNAxIaFaJXZtfBKUnj9Qi6L
 6mm/lwMMC4MUTVYeGl6xp2+x0Cxe2y59rvjXzMaWlR/6LInsvm8Gu0Tqj/gxrfbyybbC
 DiFw==
X-Gm-Message-State: AOAM531UKS1mIkX0ui6GRxZg4SsnaDhplz6utOsdz834AufpPq1JvqSW
 6HgpkvxBBOBLWh/xBwHdSw==
X-Google-Smtp-Source: ABdhPJySW4fP7h19hziwUa7lpqPD35KoCpqwbLWwpSzQ2G6BsEECfMvDt20Nm11mQDnWHmGgEX0ZXQ==
X-Received: by 2002:a92:cc83:: with SMTP id x3mr12988306ilo.232.1600116687680; 
 Mon, 14 Sep 2020 13:51:27 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id h15sm7389741ils.74.2020.09.14.13.51.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 13:51:27 -0700 (PDT)
Received: (nullmailer pid 224256 invoked by uid 1000);
 Mon, 14 Sep 2020 20:51:25 -0000
Date: Mon, 14 Sep 2020 14:51:25 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 2/6] dt-bindings: gpu: arm, mali-utgard: Add missing
 properties
Message-ID: <20200914205125.GA224203@bogus>
References: <20200903191438.12781-1-krzk@kernel.org>
 <20200903191438.12781-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903191438.12781-2-krzk@kernel.org>
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
 Kukjin Kim <kgene@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Sep 2020 21:14:34 +0200, Krzysztof Kozlowski wrote:
> Add common properties appearing in DTSes (opp-table) to fix dtbs_check
> warnings like:
> 
>   arch/arm/boot/dts/exynos4210-i9100.dt.yaml: gpu@13000000:
>     'opp-table' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Add properties instead of using unevaluated
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
