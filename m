Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3827656560
	for <lists+dri-devel@lfdr.de>; Mon, 26 Dec 2022 23:36:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1C310E2D4;
	Mon, 26 Dec 2022 22:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com
 [209.85.160.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27F8B10E2D4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 22:36:12 +0000 (UTC)
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-12c8312131fso13845690fac.4
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Dec 2022 14:36:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=IJO/06FIXq3z13IvQMxlap0KdKJ66fHNDyyYEzUFilU=;
 b=LMpRBDYOga/Y6T3VzLhhBZOeoZje9gu3RmJ2nSu8pJ1FtUVeywEwgxDrgbXrbfVCrY
 GSnOwspbt6pcGQ1PuhDSMfpuqfWAhLuXx/08cCR5peKVnJSj2QIUy+P0I10QD3fM/dTM
 X7XdU6bM5Hy+0TWL3jExvKwESHK4vfLQp8zg0kqVEYyg3BmAdEcA7U3sXm/S7Z0wPyug
 hkesnEceNOhMSTeeOhlh3xrmSjz4M1aiLrohadZ+4PnSYYtbdDsiQzMmTmsqhTAu4MO5
 EhEjFEcrbXfEedjM6O0mMP+x6e3zIGxZJaeQsmxy5XrsIZqtRMZB7eBw4WclN7JHhdcb
 BLGQ==
X-Gm-Message-State: AFqh2koCvwnwT8x59qr92ATl9nEcmSR77bHKuirp2CaKjXab3Zpl7mK0
 ID9I9JqRAnBXY1Y2sDWDRw==
X-Google-Smtp-Source: AMrXdXt09iYhbv33u4BcUku+5pEdyzFCX27esXJ8xccdE2njuScXZBm6SKkDo+jeXGaaHeCxqlFdcA==
X-Received: by 2002:a05:6871:b20:b0:14f:d036:fdb with SMTP id
 fq32-20020a0568710b2000b0014fd0360fdbmr6070687oab.41.1672094171253; 
 Mon, 26 Dec 2022 14:36:11 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:80e8:2792:eb0e:539f:f657:547b])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a05687015ce00b0014fd7e7c3fesm2342757oad.27.2022.12.26.14.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 14:36:10 -0800 (PST)
Received: (nullmailer pid 8259 invoked by uid 1000);
 Mon, 26 Dec 2022 18:23:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221226134909.2822179-3-javierm@redhat.com>
References: <20221226134909.2822179-1-javierm@redhat.com>
 <20221226134909.2822179-3-javierm@redhat.com>
Message-Id: <167207881578.4286.1861963771638185276.robh@kernel.org>
Subject: Re: [PATCH v2 2/4] dt-bindings: display: Add Himax HX8394 panel
 controller
Date: Mon, 26 Dec 2022 12:23:46 -0600
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Robert Mader <robert.mader@posteo.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Fitzhenry <tom@tom-fitzhenry.me.uk>, Martijn Braam <martijn@brixit.nl>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Ondrej Jirman <megi@xff.cz>,
 Peter Robinson <pbrobinson@gmail.com>,
 Kamil =?utf-8?q?Trzci=C5=84ski?= <ayufan@ayufan.eu>,
 Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 26 Dec 2022 14:49:06 +0100, Javier Martinez Canillas wrote:
> Add device tree bindings for panels based on the Himax HX8394 controller,
> such as the HannStar HSD060BHW4 720x1440 TFT LCD panel that is connected
> through a MIPI-DSI video interface.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Changes in v2:
> - Drop redundant "bindings" in subject (Krzysztof Kozlowski).
> - Drop "device tree bindings" in title (Krzysztof Kozlowski).
> - Put port next to other "true" properties (Krzysztof Kozlowski).
> - Add Krzysztof Kozlowski's Reviewed-by tag.
> 
>  .../bindings/display/panel/himax,hx8394.yaml  | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/himax,hx8394.example.dtb: panel@0: 'port' is a required property
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/himax,hx8394.example.dtb: panel@0: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml

doc reference errors (make refcheckdocs):


See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221226134909.2822179-3-javierm@redhat.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

