Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA6D64D183
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 21:55:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A5710E487;
	Wed, 14 Dec 2022 20:54:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BB410E487
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 20:54:51 +0000 (UTC)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-143ffc8c2b2so18321198fac.2
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 12:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=2NWVhPDt3bai2CmCTzNVlqJ9+3C7mStCncIpR+of0G8=;
 b=6MmLcWx/iPJsatPMyoBR3eRMNpv6cLOUFYm+RybC7pqhFutVC5BFmJWZSTlbf7B88T
 uTIx8kXxwkWCwMcJIfmb1uXBaZmr9xcGyPFP6lhveGnKPWhB5TFJ0l08ZRRWOs+CtLVi
 Q/KWkkC3jRU/SZJJKcLF542vwnsy/6qrPRhz6+82gLmxtrtOCaJ7vvK8KFf37sI2T7c/
 BZWrrAbB1I7Jji0SvqNzRCHCfUgbOf62kJW1s7raBTOFPAESUdgO0jQDpomgwv52UnTe
 sW0C4GzVMYzg/PaGVr/JvMBWrXYqhnBIrdRYYPxrwkKwscEw4l8+9HM600+UZ75MFhv7
 BtEg==
X-Gm-Message-State: ANoB5pn5vTzhWvLjAxgfOT/J5iuAVr9Gpo8YCafeuff/K7O0SOS2IGei
 u5OEPz7dxoB5wdfhg/O/8w==
X-Google-Smtp-Source: AA0mqf4tDoGYZCN+ccDysRLD3rxonTZcmw6zo03rWSYki/xa4tp1hflwJOpjopgwXo67XHaQM79yGQ==
X-Received: by 2002:a05:6870:4510:b0:148:3341:5249 with SMTP id
 e16-20020a056870451000b0014833415249mr7875953oao.22.1671051290977; 
 Wed, 14 Dec 2022 12:54:50 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r19-20020a056870439300b0014474019e50sm3175153oah.24.2022.12.14.12.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Dec 2022 12:54:50 -0800 (PST)
Received: (nullmailer pid 1614653 invoked by uid 1000);
 Wed, 14 Dec 2022 20:54:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Chris Morgan <macroalpha82@gmail.com>
In-Reply-To: <20221214180611.109651-3-macroalpha82@gmail.com>
References: <20221214180611.109651-1-macroalpha82@gmail.com>
 <20221214180611.109651-3-macroalpha82@gmail.com>
Message-Id: <167105119449.1612334.7860196704750907551.robh@kernel.org>
Subject: Re: [PATCH V5 2/4] dt-bindings: display: panel: Add Magnachip
 D53E6EA8966
Date: Wed, 14 Dec 2022 14:54:49 -0600
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
Cc: devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
 tzimmermann@suse.de, sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com,
 Chris Morgan <macromorgan@hotmail.com>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 14 Dec 2022 12:06:09 -0600, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add documentation for Magnachip D53E6EA8966 based panels such as the
> Samsung AMS495QA01 panel.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> ---
>  .../display/panel/magnachip,d53e6ea8966.yaml  | 62 +++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/magnachip,d53e6ea8966.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/panel/magnachip,d53e6ea8966.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/panel/magnachip,d53e6ea8966.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221214180611.109651-3-macroalpha82@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

