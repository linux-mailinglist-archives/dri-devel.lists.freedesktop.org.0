Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8456B35C766
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 15:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DA6E6E58E;
	Mon, 12 Apr 2021 13:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
 [209.85.167.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9A56E58E
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 13:20:04 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id j24so2515147oii.11
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 06:20:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=lGbxJrFzMnc2Fx/IsvHpCVq0F6FhFOgQp1Mj1B5sJic=;
 b=jsfGD0dwqFj2ukAKjcWK3R3JyVIJAO82ZwK6ij9w7ssBynVyCy6lUazp4BIdHpzdvG
 042PJ6n4rkxPXIufYFcUpWk9r89PzUlj7uVl43arAaNGnoe9N+ORJEWI7Dh4G8mWIsJa
 WZncnCtZK+0v+S7vsPJ9NRpz+anmHCf89h1bDUz9Log71JybCcZPCfoR+ga8wLe78ANu
 iHirEBaZYVhyT7ZcQZfd9IspnhXhLpPdh7R1JQsihm88nj+QCGRiYA+b14RVuT+dMcmr
 FddY/ZF//Wqcj048rY97Zo/c9AOqXZLkjVrTM7IT7ZgOEU4TXBXHLbjTBw18rY+yNIPH
 8FGQ==
X-Gm-Message-State: AOAM531ZIVFGr0ZAkXLsljvRCG3lS2qtmS6DlOunsr5gE8KwzF1FOLGM
 NHF2b5OZGGZbxJjQszQQKg==
X-Google-Smtp-Source: ABdhPJwZndFkIsmVSZKsOGhLjyxjuNqKh1d0bmVhKTaHx1jRM6l3+6e4iJWO8bm8em9IBSkpGj8/Sw==
X-Received: by 2002:aca:bc87:: with SMTP id m129mr19491514oif.29.1618233604163; 
 Mon, 12 Apr 2021 06:20:04 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v205sm21386oie.16.2021.04.12.06.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 06:20:03 -0700 (PDT)
Received: (nullmailer pid 3757978 invoked by uid 1000);
 Mon, 12 Apr 2021 13:20:00 -0000
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
In-Reply-To: <20210412093928.3321194-2-narmstrong@baylibre.com>
References: <20210412093928.3321194-1-narmstrong@baylibre.com>
 <20210412093928.3321194-2-narmstrong@baylibre.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: mediatek,
 hdmi: Convert to use graph schema
Date: Mon, 12 Apr 2021 08:20:00 -0500
Message-Id: <1618233600.211900.3757977.nullmailer@robh.at.kernel.org>
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
Cc: chunkuang.hu@kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 12 Apr 2021 11:39:24 +0200, Neil Armstrong wrote:
> Update the mediatek,dpi binding to use the graph schema.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../display/mediatek/mediatek,cec.yaml        |  51 +++++++
>  .../display/mediatek/mediatek,hdmi-ddc.yaml   |  57 ++++++++
>  .../display/mediatek/mediatek,hdmi.txt        | 136 ------------------
>  .../display/mediatek/mediatek,hdmi.yaml       | 131 +++++++++++++++++
>  4 files changed, 239 insertions(+), 136 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,cec.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.txt
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/mediatek/mediatek,hdmi-ddc.example.dt.yaml:0:0: /example-0/i2c@11012000: failed to match any schema with compatible: ['mediatek,mt8173-hdmi-ddc']
Documentation/devicetree/bindings/display/mediatek/mediatek,cec.example.dt.yaml:0:0: /example-0/cec@10013000: failed to match any schema with compatible: ['mediatek,mt8173-cec']

See https://patchwork.ozlabs.org/patch/1465094

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
