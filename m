Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4A369D84E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 03:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399B010E004;
	Tue, 21 Feb 2023 02:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80E5510E004
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 02:09:01 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id
 t7-20020a9d5907000000b00690ecb95d46so706395oth.2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 18:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UaCzmLIAtbUc4HRmFdAW9ZA8YQ/UqNUlZVInqvCf2qc=;
 b=AvdNsIktIxdt1yxHBR6J7WtA6VCLVwlOLTVEAECLseLSWf9J9elBNiUybdUkEpqMsk
 8696oHFOC10omOJZV4dU0L5qBFH/Mc/XdRZH2eBGD4X7534y2jYsAGiwAA/QDswM3avs
 Yh44dutk3+jIYLILZms8zPUTf/egTwK9LPR/voEwUsxZcN188CkW/8YUZvXyLc9XORW+
 2b9mLnVfqKFbkZ5hiAyNtDq+vTR4jQG+r4nk6jbWAwN258k7XY3XGHRs+HkcvcuS+gL6
 d/CsJNj96cRs34Fcj7sxeKk/eToZTbF564KBANeZF2Isf4YE1/Ho9Qewb4DcuB8OAoCt
 M0oA==
X-Gm-Message-State: AO0yUKW1HTEhqgooXLIb1N8OFBk7d64wMv0Cc56RC1E/coWZZEKZ/cUz
 vIbQLH/g5DI5vqffc6cu3w==
X-Google-Smtp-Source: AK7set+VLFjFR/wylXJ3C/AGCZbei58NSvFlX1oxhbZJrowNRO18L2PfRsf7pchZc2BdmGGxgq1h9g==
X-Received: by 2002:a9d:6c7:0:b0:68b:e2bb:8027 with SMTP id
 65-20020a9d06c7000000b0068be2bb8027mr989444otx.14.1676945340511; 
 Mon, 20 Feb 2023 18:09:00 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i2-20020a9d4a82000000b0068d542f630fsm68790otf.76.2023.02.20.18.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:08:59 -0800 (PST)
Received: (nullmailer pid 822010 invoked by uid 1000);
 Tue, 21 Feb 2023 02:08:59 -0000
Date: Mon, 20 Feb 2023 20:08:59 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display/panel: Add Lenovo NT36523W BOE
 panel
Message-ID: <20230221020859.GA818929-robh@kernel.org>
References: <20230217-topic-lenovo-panel-v1-0-9d7ee1602089@linaro.org>
 <20230217-topic-lenovo-panel-v1-1-9d7ee1602089@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217-topic-lenovo-panel-v1-1-9d7ee1602089@linaro.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 17, 2023 at 12:29:07PM +0100, Konrad Dybcio wrote:
> Add bindings for the 2000x1200px IPS panel found on Lenovo Tab P11/
> XiaoXin Pad devices.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../display/panel/lenovo,nt36523w-boe-j606.yaml    | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/lenovo,nt36523w-boe-j606.yaml b/Documentation/devicetree/bindings/display/panel/lenovo,nt36523w-boe-j606.yaml
> new file mode 100644
> index 000000000000..43dcbe3f9f30
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/panel/lenovo,nt36523w-boe-j606.yaml
> @@ -0,0 +1,60 @@
> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/panel/lenovo,nt36523w-boe-j606.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NT36523W BOE panel found on Lenovo J606 devices
> +
> +maintainers:
> +  - Konrad Dybcio <konrad.dybcio@linaro.org>
> +
> +allOf:
> +  - $ref: panel-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: lenovo,nt36523w-boe-j606
> +
> +  reg:
> +    maxItems: 1
> +    description: DSI virtual channel
> +
> +  vddio-supply: true

If only one supply, why not use panel-simple-dsi.yaml? Though probably 
there's more than just an IO supply?

Rob
