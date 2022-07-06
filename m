Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6334C568C02
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 16:59:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E408112DAF;
	Wed,  6 Jul 2022 14:58:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com
 [209.85.166.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64AF112D33
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 14:58:58 +0000 (UTC)
Received: by mail-io1-f54.google.com with SMTP id m13so14281900ioj.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 07:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eJuCMMC+uG44dO4wxsO1vA2dIitIOk6v906C6snfprE=;
 b=vYuHwLQGVciMwrNtKCO50X+7lPPFd0UKi6busoM5Rb2EU/0OtP4rCZjopRGoBe7nmJ
 I1Dz1b5qkFuJ6ZS2Yh1FXW+Y/Tn3OrekFGyuxiSvpbPQwlmI4+PXzd9mPlzPmUifu63f
 xP9q7XWbdYy5JxDkwvyjOrJxZAKh7ETUEmlv0I2vQIzpIYvP0nli/PRVTYGoUr31iGFt
 hM+T1YzBtQxLjiOlbMCfjtD0lW7fDAvnf46donG+X+uzl2VIZGqO5uvuBVyiYJcqyPPS
 jeocvkVLMkK/Hul7jyF03oX6nT7bDQzMhXRvDddJlH7x7RufO7f3bZT/FSi+udkD6egW
 FHpQ==
X-Gm-Message-State: AJIora/K3TNzd6pIt0C26yXc+Wx7DdPwiXil2NmFZn4WQj2dt0wrSrB6
 jMX5dOEi2jJtasmtmtnrng==
X-Google-Smtp-Source: AGRyM1sLkECkvLx1Pzirwnr9rkq9jdtJYd/dHEiClAa1S8JByZc7hbWHf0n+VMoW+xWxpHl0MVej4Q==
X-Received: by 2002:a5e:c60a:0:b0:674:fd9d:e31f with SMTP id
 f10-20020a5ec60a000000b00674fd9de31fmr21676785iok.148.1657119537942; 
 Wed, 06 Jul 2022 07:58:57 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a92d848000000b002da9f82c703sm10517036ilq.5.2022.07.06.07.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 07:58:57 -0700 (PDT)
Received: (nullmailer pid 36413 invoked by uid 1000);
 Wed, 06 Jul 2022 14:58:55 -0000
Date: Wed, 6 Jul 2022 08:58:55 -0600
From: Rob Herring <robh@kernel.org>
To: Rahul T R <r-ravikumar@ti.com>
Subject: Re: [PATCH v5 2/5] dt-bindings: display: bridge: cdns,dsi: Add
 compatible for dsi on j721e
Message-ID: <20220706145855.GA36360-robh@kernel.org>
References: <20220706114053.3454-1-r-ravikumar@ti.com>
 <20220706114053.3454-3-r-ravikumar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220706114053.3454-3-r-ravikumar@ti.com>
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
Cc: mparab@cadence.com, krzysztof.kozlowski+dt@linaro.org, jpawar@cadence.com,
 vigneshr@ti.com, a-bhatia1@ti.com, devicetree@vger.kernel.org,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org, robert.foss@linaro.org,
 jernej.skrabec@gmail.com, airlied@linux.ie, jonas@kwiboo.se,
 robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 sjakhade@cadence.com, lee.jones@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Jul 2022 17:10:50 +0530, Rahul T R wrote:
> Add compatible to support dsi bridge on j721e
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  .../bindings/display/bridge/cdns,dsi.yaml     | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
