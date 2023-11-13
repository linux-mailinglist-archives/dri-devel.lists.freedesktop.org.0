Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA4E7EA4F1
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 21:40:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356A310E422;
	Mon, 13 Nov 2023 20:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B2D10E41D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 20:40:45 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-3b6d80daae8so1727314b6e.2
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 12:40:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699908044; x=1700512844;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kIUOg6xcD1mveQt4yAqYkPtye9ZANiCj61RnWxJZ9RE=;
 b=RMb1NmFJSt7LJfhuZBZiuSdBOuPOeBRql85S2mu+zjQn6WPzf/co9xQg2P8wpE08wQ
 kwYamJ/JgLyKlJhgPkqIiGD0zPPhJrHTaXc98xAWREk+GZMPy6qNcgc5VECm5F/NMNnu
 522MM2KUDOsaxyQsNMvJDucRYD3oyxk1KQz8P3CFIIIc3lmKvqtrdVdfKrSizifzfHTj
 cEsiZx0G5FpGHbfw7u3czgY0VI3OodLW7tUgfAV+RJe+6H/MngUClRiBHgB8xyrjkfOi
 3KFc5UXoRKtn2GuguOsqjr+d5zmSkb9p4SCNhMElTlirdNbaOXUkL6eHrDr9bZhdUK/Z
 iXvg==
X-Gm-Message-State: AOJu0YxtmaACkYnQMINV2SAPBDbDrGtQYi6D//aUMovs9t9WKZaoBCJ8
 fgbRaNpN/GpRGHiMZFyARQ==
X-Google-Smtp-Source: AGHT+IE+M7ODqvletmAN6kZJ6EBjwVhQYADFHXDZ0Hl1ZJYebTPk7Dxy4FLEWYDWixjDGGboIOMmUw==
X-Received: by 2002:a54:4586:0:b0:3ab:8431:8037 with SMTP id
 z6-20020a544586000000b003ab84318037mr9564352oib.32.1699908044232; 
 Mon, 13 Nov 2023 12:40:44 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b7-20020aca1b07000000b003af732a2054sm902879oib.57.2023.11.13.12.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 12:40:43 -0800 (PST)
Received: (nullmailer pid 38662 invoked by uid 1000);
 Mon, 13 Nov 2023 20:40:42 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
In-Reply-To: <20231111111559.8218-7-yong.wu@mediatek.com>
References: <20231111111559.8218-1-yong.wu@mediatek.com>
 <20231111111559.8218-7-yong.wu@mediatek.com>
Message-Id: <169990800956.37900.2282148242749436119.robh@kernel.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: reserved-memory: Add secure CMA
 reserved memory range
Date: Mon, 13 Nov 2023 14:40:42 -0600
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
Cc: dri-devel@lists.freedesktop.org, John Stultz <jstultz@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Vijayanand Jitta <quic_vjitta@quicinc.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>, jianjiao.zeng@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, ckoenig.leichtzumerken@gmail.com,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Joakim Bech <joakim.bech@linaro.org>, tjmercier@google.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sat, 11 Nov 2023 19:15:57 +0800, Yong Wu wrote:
> Add a binding for describing the secure CMA reserved memory range. The
> memory range also will be defined in the TEE firmware. It means the TEE
> will be configured with the same address/size that is being set in this
> DT node.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  .../reserved-memory/secure_cma_region.yaml    | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml:12:1: [error] syntax error: could not find expected ':' (syntax)

dtschema/dtc warnings/errors:
make[2]: *** Deleting file 'Documentation/devicetree/bindings/reserved-memory/secure_cma_region.example.dts'
Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml:12:1: could not find expected ':'
make[2]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/reserved-memory/secure_cma_region.example.dts] Error 1
make[2]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml:12:1: could not find expected ':'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/reserved-memory/secure_cma_region.yaml: ignoring, error parsing file
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231111111559.8218-7-yong.wu@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

