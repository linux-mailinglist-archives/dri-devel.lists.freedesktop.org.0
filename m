Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6F567C2EF
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 03:54:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180FA10E0B9;
	Thu, 26 Jan 2023 02:54:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148F410E05B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 02:54:32 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 m18-20020a05683026d200b0068661404380so346842otu.2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 18:54:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Gkg4m8Fn/qWaJ7omruIhOwEotiV4rXwbLhcUjKCCMzw=;
 b=U0gpiptK8PqaWwGpP2ORXj6lkuW1pJ+3peoexcOthvPADBaZbsMyq4JDUPLifH0Oz0
 fQt6KzXiuzOdpizffdn4avTQFzPOqGyycDsGE0wYil7rkNHTRQZuMOZpJC3TUDz0/aES
 9kokOEBqz7OrIGddj6e7EqUVXv4i42UjJgwBrbpaaji8hhc6pVLfOqOYLkETij1VAs0D
 5KfrmKSExhZWn8P/VB0arpB02mHi0n82cJEv9z49uFZVpYoQ5nAeFZbh0D0sM8R1St32
 4EqDFz7Shba9/pzw1MYZIWJ6p9hifewvPqPpkgIk35zG9LHY0gpYFSEm1e8nvohFqwuo
 7zWA==
X-Gm-Message-State: AO0yUKVeFm6xxcqItV+TuxLt5BLt5y0BGYb3K9d8IVlCkefCv5c6Xp/h
 H8hdG5Suv3Povddmco8vLA==
X-Google-Smtp-Source: AK7set86SPNqPrcFJwwaeA568aXOJ3XuUP4mCd1z5pmrdeDE8ZQGLEVSMT0DauoVVHTdiqUSsubMWw==
X-Received: by 2002:a9d:4eb:0:b0:670:8676:76ee with SMTP id
 98-20020a9d04eb000000b00670867676eemr372140otm.36.1674701671194; 
 Wed, 25 Jan 2023 18:54:31 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z9-20020a9d4689000000b006864a6f2bfdsm2922802ote.31.2023.01.25.18.54.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Jan 2023 18:54:30 -0800 (PST)
Received: (nullmailer pid 75017 invoked by uid 1000);
 Thu, 26 Jan 2023 02:54:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Jonathan Cormier <jcormier@criticallink.com>
In-Reply-To: <20230125-tfp410_i2c-v1-1-66a4d4e390b7@criticallink.com>
References: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
 <20230125-tfp410_i2c-v1-1-66a4d4e390b7@criticallink.com>
Message-Id: <167470157895.71717.17977330339403047408.robh@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: display: bridge: tfp410: Add tfp410 i2c
 example
Date: Wed, 25 Jan 2023 20:54:29 -0600
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Jyri Sarha <jsarha@ti.com>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Bob Duke <bduke@criticallink.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Williamson <michael.williamson@criticallink.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 25 Jan 2023 16:09:09 -0500, Jonathan Cormier wrote:
> Add a i2c example with HDMI connector
> 
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
>  .../bindings/display/bridge/ti,tfp410.yaml         | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/bridge/ti,tfp410.example.dts:77.37-79.19: ERROR (duplicate_label): /example-1/i2c/tfp410@38/ports/port@0/endpoint: Duplicate label 'tfp410_in' on /example-1/i2c/tfp410@38/ports/port@0/endpoint and /example-0/encoder/ports/port@0/endpoint
Documentation/devicetree/bindings/display/bridge/ti,tfp410.example.dts:84.38-86.19: ERROR (duplicate_label): /example-1/i2c/tfp410@38/ports/port@1/endpoint: Duplicate label 'tfp410_out' on /example-1/i2c/tfp410@38/ports/port@1/endpoint and /example-0/encoder/ports/port@1/endpoint
ERROR: Input tree has errors, aborting (use -f to force output)
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/display/bridge/ti,tfp410.example.dtb] Error 2
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230125-tfp410_i2c-v1-1-66a4d4e390b7@criticallink.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

