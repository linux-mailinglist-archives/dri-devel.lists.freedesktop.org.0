Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D318580758
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 00:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7A5010FF91;
	Mon, 25 Jul 2022 22:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C1A10FF59
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 22:28:35 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id n133so5031325oib.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 15:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ydROe5Yeqe7LKLvisIFiWDBcUFI7G/LxHrwDl1ZPZes=;
 b=noawl1lIW8fWlbvKYxh7xf3gNTPjw3LBPNPHrMfdhlfaKUICjXKam9UWm490nvW7K/
 z5uFSpNb0bQg4+mNVcN7TmG2+YOUf2JV1JAvVZNZhJx75Q4Pr5BErYGF6/7gB1TKp8w9
 bzuis85On1QsALXaEhLsG8j9jSTl/LlT1I6gPLcPOBKyqAB/CGB2A/7mJLNIKo0iJ4GL
 BFQcst0wIFB8iak06oS1wUwn2CmtSbv2DgeX8OmQe7vjL3ZuXoiQjhg+IqvE+xj0nq+v
 xxJJ1saBR14AcRK1JrV/LuI4qRQj71j+U3zGnkO0DEicI6aFUuZZjMUdVfXo9crnSdgT
 sPLg==
X-Gm-Message-State: AJIora8NLgQSmmtACX/C8MH4xP9Eyy2zYMvAspKIMmp+nGAYVa2IhD2U
 nE1MV3Oo0WmGl7MsBw3J+w==
X-Google-Smtp-Source: AGRyM1s71mYHjgRvajARzt6yUDLac3slJauP/Yk6irLnti0u1tVfqTcvRz9lQPTSlzY1oaeDkp/SWA==
X-Received: by 2002:a05:6808:bce:b0:33a:c6c8:9d6f with SMTP id
 o14-20020a0568080bce00b0033ac6c89d6fmr6219832oik.135.1658788114842; 
 Mon, 25 Jul 2022 15:28:34 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 b17-20020a056808011100b0033a9f4c13cesm5322861oie.13.2022.07.25.15.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 15:28:34 -0700 (PDT)
Received: (nullmailer pid 2859320 invoked by uid 1000);
 Mon, 25 Jul 2022 22:28:32 -0000
Date: Mon, 25 Jul 2022 16:28:32 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: mediatek: dpi: add
 power-domains property
Message-ID: <20220725222832.GA2859262-robh@kernel.org>
References: <20220720130604.14113-1-allen-kh.cheng@mediatek.com>
 <20220720130604.14113-2-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220720130604.14113-2-allen-kh.cheng@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Jitao shi <jitao.shi@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Jul 2022 21:06:04 +0800, Allen-KH Cheng wrote:
> DPI is part of the display / multimedia block in MediaTek SoCs
> and is managed using power controller in some platforms. We add
> the power-domains property to the binding documentation.
> 
> Fixes:9273cf7d3942("dt-bindings: display: mediatek: convert the dpi bindings to yaml")
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml   | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
