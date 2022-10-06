Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16395F65F8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 14:28:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDA010E3CE;
	Thu,  6 Oct 2022 12:28:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41FBE10E808
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Oct 2022 12:27:57 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id g130so1788589oia.13
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Oct 2022 05:27:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IivXsPp5lB5UeXK+nUb21Vu9wuwXJqHD7QS9qHFH17M=;
 b=kmu9ub4qBxr7UI4HIJzmJesXXRiZMBPgYuIwYWwEfbIgS84R7WuCgB7J/ayS7foBB0
 z4i+1rlS5U+k0QyNbxXQKbfI3+BYXSFCWd4cRIXMh0Hg9DLjsMTAYhW83olCDQlLm/dm
 J9psV8domxrhJEPCfvzqVHO7DT4D4m0uNR6/2+4p5vSvgo9i3uLb7G5ZHX+FpKRTAxal
 TQF3BNVaWc4myeFdd5xs7mkAWC3F6EYapCUsiHQTbEtJLOBjlEDOS1mcnPtBexwXtEaY
 JtOwv1zsr3DtBEpvMgiy4OYoskwfcBJcNtBW2dToGzGSPSdLmUnMqUNBOIeV51OUl9xU
 kBfQ==
X-Gm-Message-State: ACrzQf1kWAw0KRC4+QNOdRQ/ppuOTzyLru2XbRgKN86ZaiLsNfCuLsOV
 clIh8+ZHKaBTzp4Fpep49w==
X-Google-Smtp-Source: AMsMyM6v4daLPkZQEVW4dBm3lahUxfM8urW8wX2Qa4pW/2l5uyythd5T/wl5E/sb0t6hvvgholskYA==
X-Received: by 2002:a54:4485:0:b0:34f:b741:9932 with SMTP id
 v5-20020a544485000000b0034fb7419932mr2235426oiv.42.1665059276383; 
 Thu, 06 Oct 2022 05:27:56 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d15-20020a056870d28f00b00132218cb7afsm5706785oae.42.2022.10.06.05.27.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 05:27:55 -0700 (PDT)
Received: (nullmailer pid 1613448 invoked by uid 1000);
 Thu, 06 Oct 2022 12:27:55 -0000
From: Rob Herring <robh@kernel.org>
To: allen <allen.chen@ite.com.tw>
In-Reply-To: <20221006020444.15823-2-allen.chen@ite.com.tw>
References: <20221006020444.15823-1-allen.chen@ite.com.tw>
 <20221006020444.15823-2-allen.chen@ite.com.tw>
Message-Id: <166505880800.1601475.16626115923147161854.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Date: Thu, 06 Oct 2022 07:27:55 -0500
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
Cc: "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Kenneth Hung <Kenneth.Hung@ite.com.tw>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Hermes Wu <Hermes.Wu@ite.com.tw>,
 Neil Armstrong <narmstrong@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>, Robert Foss <robert.foss@linaro.org>,
 Pin-yen Lin <treapking@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 06 Oct 2022 10:04:43 +0800, allen wrote:
> From: allen chen <allen.chen@ite.com.tw>
> 
> Add properties to restrict dp output data-lanes and clock.
> 
> Signed-off-by: Pin-Yen Lin <treapking@chromium.org>
> Signed-off-by: Allen Chen <allen.chen@ite.com.tw>
> ---
>  .../bindings/display/bridge/ite,it6505.yaml          | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/bridge/ite,it6505.yaml: properties:ite,dp-output-max-pixel-clock-mhz: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

