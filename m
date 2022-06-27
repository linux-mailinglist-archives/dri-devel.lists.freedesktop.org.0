Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2589F55BA11
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 15:31:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501F9112A21;
	Mon, 27 Jun 2022 13:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D8F1133B9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 13:31:19 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id i17so5991289ils.12
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 06:31:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=e0YdyNDNHfoLjY/B6VaUfC4jZi5UF0V29yd+MqAfjd8=;
 b=YndtE3cbC91qJvnE/1IjF9y83bhkJ4BRBiYveiUWPKysKsjhd47lrU2oZ7TkNTP9JO
 N2RvP2LUPut0w+zvrZLEhaedBhI3K/ZQ7gS1n6U+r2/pAAYc3KB20wUeY4cJs3ZYr9F1
 waxD3nl1yxmqizEZMrbyNSBuzwWnI5eJOYamt42ge2S4D84tSJRTCzGKlTYsDsBXsLth
 tdbFf9t3+rjgV/aFZs6FSEsywCiX/mZ8G3s5fW4kLO0F6Y/t7h4ZyhuCgKsG8b7Medza
 KEasHNETfgeWtxZxkobf/jrpsFOJDe8d80mMybB6oGZpfDWbF5VrlBK1b0kF8STLB9zF
 TdUg==
X-Gm-Message-State: AJIora+gDv4pDdCUDM2LG3kX27xJCG2+2h6D/OytkcBSg8eLcPmFp97Z
 9HgLeqs+C3Z47uKrGvkXUP9uT8HAag==
X-Google-Smtp-Source: AGRyM1vEEEhnghUvEvoMNkCRM2MJy0M56TmHGYSJhVoccPP4WQGcqcvf8lzrpCi+otOX48sba38IeQ==
X-Received: by 2002:a92:c743:0:b0:2da:a849:511b with SMTP id
 y3-20020a92c743000000b002daa849511bmr124717ilp.109.1656336678835; 
 Mon, 27 Jun 2022 06:31:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 v28-20020a02b09c000000b0032e0851ea0fsm4794533jah.10.2022.06.27.06.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 06:31:18 -0700 (PDT)
Received: (nullmailer pid 2285172 invoked by uid 1000);
 Mon, 27 Jun 2022 13:31:09 -0000
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
In-Reply-To: <20220627080341.5087-2-rex-bc.chen@mediatek.com>
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
 <20220627080341.5087-2-rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v12 01/10] dt-bindings: mediatek,
 dp: Add Display Port binding
Date: Mon, 27 Jun 2022 07:31:09 -0600
Message-Id: <1656336669.663950.2285171.nullmailer@robh.at.kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, chunkuang.hu@kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 deller@gmx.de, Project_Global_Chrome_Upstream_Group@mediatek.com,
 wenst@chromium.org, devicetree@vger.kernel.org, jitao.shi@mediatek.com,
 msp@baylibre.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 angelogioacchino.delregno@collabora.com, granquet@baylibre.com,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 27 Jun 2022 16:03:32 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This controller is present on several mediatek hardware. Currently
> mt8195 and mt8395 have this controller without a functional difference,
> so only one compatible field is added.
> 
> The controller can have two forms, as a normal display port and as an
> embedded display port.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Fix reviewers' comment]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dtb: dp_tx@1c600000: data-lanes: [[0, 1, 2, 3]] is not of type 'object'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.example.dtb: dp_tx@1c600000: data-lanes: [[0, 1, 2, 3]] is not of type 'object'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

