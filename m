Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE64E803E61
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 20:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46BD310E237;
	Mon,  4 Dec 2023 19:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com
 [209.85.161.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BF710E237
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 19:29:22 +0000 (UTC)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-58d06bfadf8so3540543eaf.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 11:29:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701718161; x=1702322961;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qyV1sA1r5dPn4ygpL07ie1UDh6kELrw/hlTPqHm4mZw=;
 b=CVINxV2Kr04Mr1PHTa7mKlA/eh0nWpxh8v/p+KMu1rnM8wT8D01gHvphPD5CRrqtr4
 a8oPRxPQRDzKkSBZ6tMmboGYOvJcY8F2LQhJDurGFcBoVcaoF2ipDJr2dkIA2YcBmXVu
 Eg97Ut8mT8/06KRCUrDoX4dupkV0bCIgnK2KO3BbxMPU1jrudNWEc1oAXqTK9wQglDtr
 QqfANBPKXWrzjyd63jnoqUwUTepkz0j3TinKNhOGQB4XFzeOdZsg+rfk73btkhczTJR6
 tXFyHojBHS73fHs+gWb5JR+lTKhRhhgfpWDpgPb4VM6lY4O/6uxklC+fFnFRQ4H9LbAI
 m8Jg==
X-Gm-Message-State: AOJu0YwfiU/FRfROsNUN8k1RyyYqC1JaTaUnEEx9COIbkRijQa3Ns0On
 zztQzT/k1dAqILkJ9lyO4A==
X-Google-Smtp-Source: AGHT+IHJ0aCuZWEklMciWvIdrm2WgfF21P0EvsQZBkeLJD8Qx1fhubs0EIjuFl2rdcEIx9A52oV8Fg==
X-Received: by 2002:a05:6871:820:b0:1fb:75c:3fe0 with SMTP id
 q32-20020a056871082000b001fb075c3fe0mr5278424oap.64.1701718161675; 
 Mon, 04 Dec 2023 11:29:21 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 rd14-20020a056871620e00b001fa39dfef88sm2993334oab.37.2023.12.04.11.29.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 11:29:20 -0800 (PST)
Received: (nullmailer pid 4307 invoked by uid 1000);
 Mon, 04 Dec 2023 19:29:17 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Boris Brezillon <boris.brezillon@collabora.com>
In-Reply-To: <20231204173313.2098733-14-boris.brezillon@collabora.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-14-boris.brezillon@collabora.com>
Message-Id: <170171811207.4196.6974304837599035136.robh@kernel.org>
Subject: Re: [PATCH v3 13/14] dt-bindings: gpu: mali-valhall-csf: Add
 support for Arm Mali CSF GPUs
Date: Mon, 04 Dec 2023 13:29:17 -0600
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
 Conor Dooley <conor+dt@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 kernel@collabora.com, Daniel Stone <daniels@collabora.com>,
 devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?utf-8?q?Cl=C3=A9ment_P=C3=A9ron?= <peron.clem@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 04 Dec 2023 18:33:06 +0100, Boris Brezillon wrote:
> From: Liviu Dudau <liviu.dudau@arm.com>
> 
> Arm has introduced a new v10 GPU architecture that replaces the Job Manager
> interface with a new Command Stream Frontend. It adds firmware driven
> command stream queues that can be used by kernel and user space to submit
> jobs to the GPU.
> 
> Add the initial schema for the device tree that is based on support for
> RK3588 SoC. The minimum number of clocks is one for the IP, but on Rockchip
> platforms they will tend to expose the semi-independent clocks for better
> power management.
> 
> v3:
> - Cleanup commit message to remove redundant text
> - Added opp-table property and re-ordered entries
> - Clarified power-domains and power-domain-names requirements for RK3588.
> - Cleaned up example
> 
> Note: power-domains and power-domain-names requirements for other platforms
> are still work in progress, hence the bindings are left incomplete here.
> 
> v2:
> - New commit
> 
> Signed-off-by: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  .../bindings/gpu/arm,mali-valhall-csf.yaml    | 147 ++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml:108:1: [error] syntax error: found character '\t' that cannot start any token (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.example.dts'
Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml:108:1: found a tab character that violates indentation
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml:108:1: found a tab character that violates indentation
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1424: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231204173313.2098733-14-boris.brezillon@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

