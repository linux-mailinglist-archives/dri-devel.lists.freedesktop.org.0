Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1D706EC5
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 18:53:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F8810E063;
	Wed, 17 May 2023 16:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AEB10E063
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 16:53:50 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-510d0e40c6eso1370771a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684342428; x=1686934428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3hIDvPEdjftlVYbqhIG0JXGHdNlYOdLmSjve7aY9Eo0=;
 b=LuAGyfOolGY2lv4bXLQZDUlCkYAFbMjVgJBhtQ35ZvoRANe0rP+NbkFwtPlSSeIKq/
 Z1ELa4OdH1BhZPPVuEcS54mWAsAWMdI99jGP8mvKnKSUwftMqm5xSRaOfxTPxFqtkLxY
 qdUkIgvZbQvT+RLeoqerdDueR+U+biU/Yr3n0d7E/Y5DiwxKMmqsHwOlN18at7sz3xX0
 hix+tDpT085M0KrBRn5JxxVnqtP8l3xr6wG5PX+qP30zi+WThJQQGkTX+BzXAmY+WljI
 684VChIFfk5qFuVy1ZK+D6QjxLctgUm4HmqkW+vvQDOPqCPVkbasYZ1D9Mdfy/5Rs9bJ
 aCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684342428; x=1686934428;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3hIDvPEdjftlVYbqhIG0JXGHdNlYOdLmSjve7aY9Eo0=;
 b=K6ZxuCxFMnxALp5lQIW5zL20g00WCu3Xf/Uc4okEBKKfzWXyEchjnkA4EqtfFN/eED
 mgQIBZqHVK5AsPO3HZLmvn2J9p3tsg0+ozaofHO09bg304/4ZvR1sobnZ4Si5VDuJ9Zs
 /Hl8Gr5NQY9cHu9Y16YoPQG2dYUUTiP/cQxGkca4pG7IkYK4fSx7FIBm1fo1GIgVyrIu
 1WZyOtPQ1rUXyZqqZdKXU4oiysO2c8HrKfzPIzG3grjORrkpbpBOTU146Id5HgqVJz1y
 Gi9BHkVwTOMpzXwIDn98vlUG6EZSkIzDXSmYgH30NHxBO/Gb5mosaBMT2onJIlfga33L
 kpcA==
X-Gm-Message-State: AC+VfDwx1Kc8Z6nPYg4m3O+rByexixA6NGl+WCDuJAlIToOUNwrdfWli
 Vymex/8BZNh1k6uqb9jjgU8CIw==
X-Google-Smtp-Source: ACHHUZ41XuiV/6uHDBhzp+l1Rm28KeZOiUPPrRFoy46T5x5hqEOTvHbPfGD88VINkhOzOmp9caPxnQ==
X-Received: by 2002:a17:906:9b86:b0:96a:5a59:92cb with SMTP id
 dd6-20020a1709069b8600b0096a5a5992cbmr24102081ejc.47.1684342428067; 
 Wed, 17 May 2023 09:53:48 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
 by smtp.gmail.com with ESMTPSA id
 mc27-20020a170906eb5b00b00966330021e9sm12332628ejb.47.2023.05.17.09.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 09:53:47 -0700 (PDT)
Date: Wed, 17 May 2023 18:53:44 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Bailon <abailon@baylibre.com>
Subject: Re: [PATCH 7/7] dt-bindings: Add bidings for mtk,apu-drm
Message-ID: <20230517165344.6gzwzkwzu44noyqm@krzk-bin>
References: <20230517145237.295461-1-abailon@baylibre.com>
 <20230517145237.295461-8-abailon@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230517145237.295461-8-abailon@baylibre.com>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sumit.semwal@linaro.org, bero@baylibre.com, khilman@baylibre.com,
 nbelin@baylibre.com, linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, linaro-mm-sig@lists.linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 jstephan@baylibre.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 May 2023 16:52:37 +0200, Alexandre Bailon wrote:
> This adds the device tree bindings for the APU DRM driver.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Reviewed-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/mtk,apu-drm.yaml  | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: 'maintainers' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
./Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpu/mtk,apu-drm.yaml#
Documentation/devicetree/bindings/gpu/mtk,apu-drm.example.dts:18.15-22.11: Warning (unit_address_vs_reg): /example-0/apu@0: node has a unit name, but no reg or ranges property
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/mtk,apu-drm.example.dtb: apu@0: remoteproc: [[4294967295, 4294967295]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1782720

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
