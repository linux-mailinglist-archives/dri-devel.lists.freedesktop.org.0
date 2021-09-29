Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A8D41C5F1
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 15:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90BF06EA79;
	Wed, 29 Sep 2021 13:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDF926EA79
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 13:46:29 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 c26-20020a056830349a00b0054d96d25c1eso2884056otu.9
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 06:46:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=OCt6A/PQC+USQdnm5J8GnEXuMhJ+RqhU0u1UJM6OlKM=;
 b=6k0kMV6gHDyLQLs4Pw8jVGNcbp2+gFD2liVwMH++AnY/WIC6JO2NK9HV6a0r8DYNi7
 3QJ+QxNxL7Edr/XIZTM62lDhiwyW7J8hL95z0uEwWUtbp1AzqeMUxnD0kUozLMKoBcOF
 /se2lgbkjcPphFrq6+99pgfTMqbibr67A4+5tKpF1ZfcDrQCyyxW8rkb8UjMQV3qI2eZ
 yFmt01StNPrnquuOlQEhD7QEOZxzj0r+1NQV8+oSVPasuWIm5MK8AbIqID/MCgUyKQs6
 9lIKUdtKnKS8cm84tJyiVTMsUix8VEed+0VGNpnjmLAUqn4jXMfGjsXro4B8tPXWqqbK
 uc6A==
X-Gm-Message-State: AOAM532o/2JSpjL9pFUUTkFwDF0fDnakDmjoObmbHp9+ofZZjAnLKM8T
 WTt7OlprKKGyxhMeBR3AzjGd/bVfBg==
X-Google-Smtp-Source: ABdhPJz/BHhDl0VbMiUoiKubksea3lnYfFtqBu5/Mu6JI4wQMVxRosXYvYLsRHQDW2GiEYK59cdHBA==
X-Received: by 2002:a9d:6a4c:: with SMTP id h12mr81568otn.336.1632923189057;
 Wed, 29 Sep 2021 06:46:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o62sm459542ota.14.2021.09.29.06.46.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Sep 2021 06:46:28 -0700 (PDT)
Received: (nullmailer pid 3674449 invoked by uid 1000);
 Wed, 29 Sep 2021 13:46:25 -0000
From: Rob Herring <robh@kernel.org>
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, chunkuang.hu@kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, p.zabel@pengutronix.de,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 devicetree@vger.kernel.org
In-Reply-To: <20210929094425.745-3-granquet@baylibre.com>
References: <20210929094425.745-1-granquet@baylibre.com>
 <20210929094425.745-3-granquet@baylibre.com>
Subject: Re: [PATCH v1 2/4] dt-bindings: display: mediatek: add MT8195 hdmi
 bindings
Date: Wed, 29 Sep 2021 08:46:25 -0500
Message-Id: <1632923185.744834.3674448.nullmailer@robh.at.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 29 Sep 2021 11:44:23 +0200, Guillaume Ranquet wrote:
> Add Mediatek HDMI and HDMI-DDC bindings for MT8195 SoC.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 45 +++++++++
>  .../mediatek/mediatek,mt8195-hdmi.yaml        | 98 +++++++++++++++++++
>  2 files changed, 143 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dt.yaml: example-0: hdmi@1c300000:reg:0: [0, 472907776, 0, 4096] is too long
	From schema: /usr/local/lib/python3.8/dist-packages/dtschema/schemas/reg.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dt.yaml: hdmi@1c300000: 'ddc-i2c-bus', 'power-domains' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1534287

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

