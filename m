Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281F15FF50E
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 23:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A5C10E0DB;
	Fri, 14 Oct 2022 21:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD2C10E0DB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 21:10:34 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id j188so6352186oih.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Oct 2022 14:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xM+4m5a2a5cuZ5VhUjxrp5HzYAY1IJVbywUtama6FlI=;
 b=rOipQtcz0yFxQCS7gHvy/T5Sw/j6SeMOq/xq7p5vVZJWHJ3TnvsTX6fn7KnZgVteJP
 lXWn7o5A8b2h9zKsT6/19NumMSpzlaV8e7li+v8pE0fEnY+gR03UJXu/6jK1iN31yA0d
 MUD/mvos7p3g0ZGK8g3WmNl7Hzy/KwwcYICiDx7XttoObVxEgEUkXZob039t5pfncDCZ
 e1bT7lfHP8Z40uimlgb4QWZsS4nlSmR9Kb/6b7ZUiBZykYXFLgS2YDp6vrZevyf+beg1
 8/BWXTh+CYc8APmr0L7EpHLADSZt68ygyV8iHSoewVbRRP5UTcCgvIH8n+NQEMJD+J1u
 6SsA==
X-Gm-Message-State: ACrzQf0D6130Ic1LPvQXwLNHaH2nrdSMGzTYrKDtBhntHrfi7NVR2Fk4
 ySlQm1e4WE40jqKGStUsvQ==
X-Google-Smtp-Source: AMsMyM70Akl6mGH6k+1/khm5MR7s9COqT/1+UPtLcqb+A+ugOm6M9TWM9XzVXoggbzWtk1ZXP1Lwpg==
X-Received: by 2002:a05:6808:1b0d:b0:355:219c:3d28 with SMTP id
 bx13-20020a0568081b0d00b00355219c3d28mr1571823oib.31.1665781833942; 
 Fri, 14 Oct 2022 14:10:33 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 23-20020aca0f17000000b00354d7c7e42esm1549201oip.30.2022.10.14.14.10.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 14:10:33 -0700 (PDT)
Received: (nullmailer pid 2911731 invoked by uid 1000);
 Fri, 14 Oct 2022 21:10:34 -0000
Date: Fri, 14 Oct 2022 16:10:34 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: display: panel: use spi-peripheral-props.yaml
Message-ID: <166578183285.2911660.11950210372738963572.robh@kernel.org>
References: <20221004120907.72767-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221004120907.72767-1-krzysztof.kozlowski@linaro.org>
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
Cc: devicetree@vger.kernel.org, Markuss Broks <markuss.broks@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Dillon Min <dillon.minfei@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Mack <daniel@zonque.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 04 Oct 2022 14:09:07 +0200, Krzysztof Kozlowski wrote:
> For devices connectable by SPI bus (e.g. already using
> "spi-max-frequency" property), reference the "spi-peripheral-props.yaml"
> schema to allow using all SPI device properties, even these which device
> bindings author did not tried yet.
> 
> Change "additionalProperties" to "unevaluatedProperties", so the actual
> other properties from "spi-peripheral-props.yaml" can be used.  This has
> additional impact of allowing also other properties from
> panel-common.yaml to be used.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9163.yaml    | 3 ++-
>  .../devicetree/bindings/display/panel/ilitek,ili9341.yaml    | 1 +
>  .../devicetree/bindings/display/panel/nec,nl8048hl11.yaml    | 3 ++-
>  .../bindings/display/panel/samsung,lms380kf01.yaml           | 5 ++---
>  .../bindings/display/panel/samsung,lms397kf04.yaml           | 3 ++-
>  .../devicetree/bindings/display/panel/samsung,s6d27a1.yaml   | 4 ++--
>  .../devicetree/bindings/display/panel/tpo,tpg110.yaml        | 1 +
>  7 files changed, 12 insertions(+), 8 deletions(-)
> 

Applied, thanks!
