Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F87586E93
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 18:32:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21CD95F99;
	Mon,  1 Aug 2022 16:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28FC95F99
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 16:32:40 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id h145so8770628iof.9
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Aug 2022 09:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=P77IYnhQDubE2Ls3jmoSKfwkpvjmalaSlppSMIKTGTM=;
 b=URpUGfy+xAdRfco8Z8oF5AOsgAPH1COSq9cG2hoLh/pXBTofKWT4hDvaP2mrxksGt3
 fWOUDL1CtY6jIxo07NDTomXSpm64jyDGZGdggwLHSdm71h6xoYWxEHRTjVrYNnxwjP/f
 Mn7JCMDrmA4DDHy3g5ZhGqlad/1XmsknF7IQaqbV4OrqtskGfrNV6pfAlG6/wYR6g0m1
 TGwxBaAHgRE05MyRFl3vZQqZayQ0SuDJuIl5maNYu8aUOcxtaR74yrssTutERU4CeaQv
 ohHb4FqKtTVuI8h0qoQlbDpdsUO0x3JCIYRBi/u7u75EO1diCJP/Ngf37uumCYv2mHau
 KPUQ==
X-Gm-Message-State: AJIora/4Yiq7vGtAQ8GXRGlypoD5oN2hiGz5cNTOrdT4vlfax3qJANs+
 D+Kmq69SAImDuH25FoaVmg==
X-Google-Smtp-Source: AGRyM1sGSDz3McDNYyjHmCnx+CCO6rr6pBD+ZJoy5Rch8LwJhbnibMSs+18u9nKe27M/R15G0H8FIg==
X-Received: by 2002:a05:6638:2103:b0:341:4a1b:c551 with SMTP id
 n3-20020a056638210300b003414a1bc551mr6588973jaj.87.1659371559878; 
 Mon, 01 Aug 2022 09:32:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 y14-20020a5e870e000000b0067bd7f5f964sm5934051ioj.7.2022.08.01.09.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 09:32:39 -0700 (PDT)
Received: (nullmailer pid 1137649 invoked by uid 1000);
 Mon, 01 Aug 2022 16:32:38 -0000
Date: Mon, 1 Aug 2022 10:32:38 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: icn6211: Add support
 for RGB/BGR swap
Message-ID: <20220801163238.GA1130127-robh@kernel.org>
References: <20220801131901.183090-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220801131901.183090-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robert.foss@linaro.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 01, 2022 at 03:19:00PM +0200, Marek Vasut wrote:
> The ICN6211 is capable of swapping the output DPI RGB/BGR color channels,
> document a DT property to select this swap in DT. This can be useful on
> hardware where such swap happens.

We should ensure this series[1] works for you instead.


> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> ---
>  .../devicetree/bindings/display/bridge/chipone,icn6211.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> index 18563ebed1a96..e721dd76e6640 100644
> --- a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> @@ -33,6 +33,12 @@ properties:
>          Optional external clock connected to REF_CLK input.
>          The clock rate must be in 10..154 MHz range.
>  
> +  blue-and-red-swap:

'swap' assumes I know the default order and I don't. Better to make the 
property name describe the end result. ('invert' properties have the 
same issue)

> +    description:
> +      If defined, the DPI output blue and red channels are swapped,
> +      i.e. RGB becomes BGR.
> +    type: boolean
> +
>    enable-gpios:
>      description: Bridge EN pin, chip is reset when EN is low.

Rob

[1] https://lore.kernel.org/r/20220628181838.2031-3-max.oss.09@gmail.com

