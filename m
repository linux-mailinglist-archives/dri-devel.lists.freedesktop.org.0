Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A84E500E40
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 15:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C5A10FB91;
	Thu, 14 Apr 2022 13:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B4010FB91
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 13:00:51 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id k10so5324004oia.0
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Apr 2022 06:00:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1jt0wr2Jj0rpKwBXfActCjc+WpJa+bt9YCx6ZomSA98=;
 b=iU1lmluXywx9VobseQuoYAIAjoZOH3e9lkrGPprj1YXBaJPIxYry4vRM2onsmVjKKF
 TRvGDJv5v2J7CuLbMnO8rUDafAdDOxCAHLJV4nOyJaYvUVFBQihOv/2KUfWmAie1Rm0t
 8KrmIGGXSAvBAnAHr4SS8+74wr16rI4kLCDrtZzxyVfhtd7iz9NU+n5cbkKOYGjfjvwo
 vuKOPr2bFBVallKQeMOE3gB/A3FiMOTzNzlDqtec6vcw5Lax+WfV1gi70VjIIsccsuNC
 xhpgnls3V6BRlcXsnqckTLI8k/D+J0//fR3VUXuTHu2Dc87xZlLknti1n1GbOwJsQNmx
 oMcA==
X-Gm-Message-State: AOAM533vPnHHB09bp2hJhT2T/VzckU79iod4xRfLTjt4z5hUwhxj6V2r
 GUnh5dFSa7zk0vBxpldfbQ==
X-Google-Smtp-Source: ABdhPJzDoL3AtjsnkGtQrPML0IWDdiP+U1HX/0wjf3Z8mMWnd+R0AmVehr0xJQoKPXHCe70MpIVezg==
X-Received: by 2002:a05:6808:bd2:b0:2f7:59fd:2f1b with SMTP id
 o18-20020a0568080bd200b002f759fd2f1bmr1464140oik.217.1649941251138; 
 Thu, 14 Apr 2022 06:00:51 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 eq37-20020a056870a92500b000c6699dad62sm642170oab.41.2022.04.14.06.00.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 06:00:50 -0700 (PDT)
Received: (nullmailer pid 1755668 invoked by uid 1000);
 Thu, 14 Apr 2022 13:00:50 -0000
Date: Thu, 14 Apr 2022 08:00:50 -0500
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v4 2/5] dt-bindings: display: ssd1307fb: Extend schema
 for SPI controllers
Message-ID: <YlgbAhXKUs1/Ct58@robh.at.kernel.org>
References: <20220413162359.325021-1-javierm@redhat.com>
 <20220413162359.325021-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220413162359.325021-3-javierm@redhat.com>
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
Cc: devicetree@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Apr 2022 18:23:55 +0200, Javier Martinez Canillas wrote:
> The Solomon SSD130x OLED displays can either have an I2C or SPI interface,
> add to the schema the properties and examples for OLED devices under SPI.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Acked-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> 
> Changes in v4:
> - Add a description for the dc-gpios property for SPI (Geert Uytterhoeven)
> 
> Changes in v3:
> - Add a comment to the properties required for SPI (Geert Uytterhoeven)
> 
> Changes in v2:
> - Don't add compatible strings with an "-spi" suffix (Geert Uytterhoeven)
> 
>  .../bindings/display/solomon,ssd1307fb.yaml   | 42 ++++++++++++++++++-
>  1 file changed, 40 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
