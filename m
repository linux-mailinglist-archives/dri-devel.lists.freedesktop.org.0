Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17846E6E76
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 23:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF94810E0AC;
	Tue, 18 Apr 2023 21:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54E910E0AC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 21:41:17 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-6a437526b7cso745461a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 14:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681854077; x=1684446077;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ElC7aqM0OYKhp7zqQxQuTXx1H9IDxJGXKnxZVOIROXA=;
 b=dpgi0ZV8yELzawG8g3wFMlutQgv/fWtCH8HFyJpjys5CGX+zchnieShf6Gj4dvce90
 a7glc/WGZA0FN3XEKVsQSC8NAFstGAkmWqwja8mfJnOyH8sz92Rd40VsLaOFwFU+IdZr
 ZRVQuq/2Ik7GiodmryWBOPMwDkETl5gXXL/eGm7rwHmm6qTAs7+sn67fUSf7RBzwLC3E
 kbA5HYIsb3TQyn6N5k7Xv3vGJrLRT7T2ft1YCpfwPbGVzrioNYb85TYPs9fzi4H9EIIM
 842r5O1cPfHQdVjq1uBQYH5tVoRdJluFXccAIkbo3F9CqwQcqM5qmugPUo8gv5UDBHYH
 7x7A==
X-Gm-Message-State: AAQBX9dPx0pO6/CBx3KdRFpjegHhMzjZBZq7KIg4DA0ngZOPAeJ2EYn7
 jvmWFDW1tdi5tbVpY37x1w==
X-Google-Smtp-Source: AKy350Y/zUwTPUY+bloMxG86x5GIO5/WgZZJ0w2lgVcgHZEOKfFzsX6+0hRjmFOdov3MNztPcibQZw==
X-Received: by 2002:a05:6870:1702:b0:187:8f01:7107 with SMTP id
 h2-20020a056870170200b001878f017107mr2215193oae.44.1681854076847; 
 Tue, 18 Apr 2023 14:41:16 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o19-20020a9d5c13000000b006a3f8f7b686sm6075534otk.28.2023.04.18.14.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 14:41:16 -0700 (PDT)
Received: (nullmailer pid 2378744 invoked by uid 1000);
 Tue, 18 Apr 2023 21:41:15 -0000
Date: Tue, 18 Apr 2023 16:41:15 -0500
From: Rob Herring <robh@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: synopsys, dw-hdmi: Add property
 for disabling CEC
Message-ID: <20230418214115.GA2376963-robh@kernel.org>
References: <20230415104613.61224-1-jernej.skrabec@gmail.com>
 <20230415104613.61224-2-jernej.skrabec@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230415104613.61224-2-jernej.skrabec@gmail.com>
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
Cc: linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 rfoss@kernel.org, andrzej.hajda@intel.com, samuel@sholland.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 wens@csie.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, hverkuil-cisco@xs4all.nl,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Apr 15, 2023 at 12:46:11PM +0200, Jernej Skrabec wrote:
> Even though some DW-HDMI controllers have perfectly usable HDMI-CEC
> implementation, some boards might prefer not to use it or even use
> software implementation instead.
> 
> Add property for disabling CEC so driver doesn't expose unused CEC
> interface, if CEC pin isn't connected anywhere.

Isn't this all true for any bridge supporting CEC? Make this common.

> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  .../devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> index 4b7e54a8f037..624d32c024f6 100644
> --- a/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi.yaml
> @@ -48,6 +48,11 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  snps,disable-cec:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description:
> +      Disable HDMI-CEC.
> +
>  additionalProperties: true
>  
>  ...
> -- 
> 2.40.0
> 
