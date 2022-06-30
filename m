Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0115625AB
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 23:55:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3560D10EDB4;
	Thu, 30 Jun 2022 21:55:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE97710EDB4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 21:55:04 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id k15so516724iok.5
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 14:55:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=O0oI2Gbpm910/K3zuIgYxSbljlnn6O3+k19Oo002PO8=;
 b=iTxQ+DJW1QdS3aKkee/x1wNWhwYPnJ0XPc/RnOHh5RLL085ZRnXbroDcGJYFUZRKsT
 aIsZOmPhBBbIQzwYf28b3wPNLFei8Uf2KXRHnRH2s0hIRNAq828Eq/q5Znt8AIQhrBwp
 cNguJ51vlTDKq6Cq9jf14uyKrb3gndId8tyE6E24w2cYkWLHjheP9IAONoyxmpc201Vt
 PHIFnnEOfB8ce5X0RXOgRUvefFBu3o8z0mwHv/quDPNnpSbnHdaH5e86wrl32/UAiexH
 WPT1BDuZQ1h6ENnRoo68lStK+WVyUw8T5GWEkBKZt9nOlNFkEB407BNmI88VvKPdDZTb
 4ZmQ==
X-Gm-Message-State: AJIora9ankdAAfEO5fQny07d2rtKaP/JpaH61q3LgHFDV4Yd8iCl1TfT
 aq2h9326KKqsnbt66HpH4g==
X-Google-Smtp-Source: AGRyM1vtcfkSVY6M7PNTiDY7FVEXYZMNw3bvjSTqjH2j0Qe5vPkkxFrAuZnZMfEK51OROsKsre8rDw==
X-Received: by 2002:a05:6638:3387:b0:33c:9f9e:5a17 with SMTP id
 h7-20020a056638338700b0033c9f9e5a17mr6777342jav.12.1656626104166; 
 Thu, 30 Jun 2022 14:55:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 m2-20020a02cdc2000000b00339e6168237sm8637761jap.34.2022.06.30.14.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 14:55:03 -0700 (PDT)
Received: (nullmailer pid 3384041 invoked by uid 1000);
 Thu, 30 Jun 2022 21:55:00 -0000
Date: Thu, 30 Jun 2022 15:55:00 -0600
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH v3 05/14] dt-bindings: backlight: Add Mediatek MT6370
 backlight
Message-ID: <20220630215500.GA3383976-robh@kernel.org>
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-6-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220623115631.22209-6-peterwu.pub@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, cy_huang@richtek.com,
 pavel@ucw.cz, lee.jones@linaro.org, linux-leds@vger.kernel.org,
 daniel.thompson@linaro.org, chiaen_wu@richtek.com, chunfeng.yun@mediatek.com,
 linux@roeck-us.net, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 szunichen@gmail.com, broonie@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, sre@kernel.org, deller@gmx.de, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Jun 2022 19:56:22 +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add mt6370 backlight binding documentation.
> 
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> ---
> 
> v3
> - Rename "mediatek,bled-pwm-hys-input-threshold-steps" to
>   "mediatek,bled-pwm-hys-input-th-steps"
> - Refine "bled-pwm-hys-input-th-steps", "bled-ovp-microvolt",
>   "bled-ocp-microamp" enum values
> ---
>  .../leds/backlight/mediatek,mt6370-backlight.yaml  | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-backlight.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
