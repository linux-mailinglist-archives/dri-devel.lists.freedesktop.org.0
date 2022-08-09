Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEF958E06C
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 21:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890E9CCE5D;
	Tue,  9 Aug 2022 19:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9822690726
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 19:46:50 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id d4so7105389ilc.8
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 12:46:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=FUZurhOVWbSFlq4M53I1Rb6VAfl1vXlk/stu+pqTW7s=;
 b=vBcG+ju6cMBvWoYss5be+Ud8ZRi9TjPTSMebHfAB4yIp+Yh/QmgTnWS1ilJ0uDuwvY
 953EV/WSV8hFzitMbsbs4W/0zta4i8t+ISdpPk6ibC2WbpvNMMltLqLl0dqhk7rKFZkt
 4++AKS0p08o9oQM1pnaREHjZyn+W+cI9uax9xVjCPnfqdM23rXIN37gmDbZAeU78Ueuy
 MqRAQZlvLV42r1K5OvGuNYMJWgQsnWnCPV1V0y1WN7Svoq1lSf4nChCkdMImZMgyiBvc
 lVwd5kkL+6XFN4lGWlpYYkZjUR22nPaa2VgPmtr/TFylMimLRoxdGAoi2HgY0YAXrELM
 O5sA==
X-Gm-Message-State: ACgBeo0SF+KOl2TMV8ZgF3BmfwpQ+NGSLwaFeYQTVTXVsOYBiE5JeGy6
 Zi25AdqPKWD5DbOnxWs9rg==
X-Google-Smtp-Source: AA6agR6tDsZo27ZLWdYBCuktolWxGN7xvWY3iudAMl4Ek0rvZPqnjNE6AERrQZNVv3UbX1qewNYK1w==
X-Received: by 2002:a05:6e02:1aa7:b0:2de:b9f1:593f with SMTP id
 l7-20020a056e021aa700b002deb9f1593fmr10779350ilv.243.1660074409570; 
 Tue, 09 Aug 2022 12:46:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a056638388300b00342f67a4789sm3448164jav.164.2022.08.09.12.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 12:46:49 -0700 (PDT)
Received: (nullmailer pid 2272995 invoked by uid 1000);
 Tue, 09 Aug 2022 19:46:47 -0000
Date: Tue, 9 Aug 2022 13:46:47 -0600
From: Rob Herring <robh@kernel.org>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Subject: Re: [PATCH v16 1/8] dt-bindings: mediatek,dp: Add Display Port binding
Message-ID: <20220809194647.GA2272961-robh@kernel.org>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
 <20220805101459.3386-2-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805101459.3386-2-rex-bc.chen@mediatek.com>
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
 tzimmermann@suse.de, liangxu.xu@mediatek.com, msp@baylibre.com,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 granquet@baylibre.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 05 Aug 2022 18:14:52 +0800, Bo-Chen Chen wrote:
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
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,dp.yaml         | 116 ++++++++++++++++++
>  1 file changed, 116 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
