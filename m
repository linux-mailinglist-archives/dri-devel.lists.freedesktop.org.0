Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2394F26AB37
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 19:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E198D6E8CD;
	Tue, 15 Sep 2020 17:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013276E8C8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 17:48:23 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id n133so5114065qkn.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 10:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PMuG0obES1mSU4p2Bpr9xG7rtnzSIk+zV1FaePqSpAg=;
 b=Hp9J3dEGpH2Tmiz9hu0LHBSu9dMuxfgzHEHC6EExeypCNaNj4GXYK7uTRowjOfqWTJ
 6paAY39WTSiWMWBKsQ/MzVdwZDyQbM6Jwx9zVZhY8QTnqMonYJ5u4kg5B3UTHxAJnWbW
 2t3bHz7zY2M7AOdSWlhKIVVIxkBGNpGtDaZIuv86g+tOyMut4zFas1uLfddUe0ux4Lpc
 GCdobFHAeTK029mmYVLioLA8QV7OL0zwrjP91ov5EcQvbVif/99cR8VooqMbZRpxxBd2
 2Zl0dY+YD4haUWXc4hP73sHe0X8cXKlZz+kBGw5lvL03nr073GrKUdq0Y/ZyxD/nnOgR
 4evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PMuG0obES1mSU4p2Bpr9xG7rtnzSIk+zV1FaePqSpAg=;
 b=UQt+MVIOXSiCs/repvUR4Nv0sHuHyJ6kA3IAvz3n/seUj+48iD0g6N/wMHuc+QRfyk
 ZQAF6QyAN/XREafhvONd6zr9FYefQGkXAnYar03eqPfZmABEeDKD0H9bxTbr/i2yxyb+
 CDHRWQFxeF9PO4IFthD2pepd8sSrZ3XDYTdQe6ieFYTAHn6B2NRo03ucRcuAgRIUZMcz
 gvm2DvAse3+xnOIw2kRMDr9kBZjzFPnSqA74GYR/xbgQuzkcAsH+ZvN3dbcVEHf3HGN7
 62fEHyXWCumK1o/o/aOWprUzERRGBBiMu15l7yHpldwThGPE6Kbl9gNge8Hvi4nELCXU
 5L9Q==
X-Gm-Message-State: AOAM533sG461KduAh/gYhzwlbZ2fv3Fr7VFk5CDhbuIxaDFuKpkhfiaM
 wJ7ZHsgunLCIz2Yr9Sf3DHaZpQ==
X-Google-Smtp-Source: ABdhPJxTTAbFFmxhibWA9gq1WRKxKHcXRLCjzzCKT74WJ3jv9tDtGRFixbfDx/V4RZZsonZeQCirCA==
X-Received: by 2002:a37:8404:: with SMTP id g4mr7503354qkd.63.1600192103023;
 Tue, 15 Sep 2020 10:48:23 -0700 (PDT)
Received: from uller (ec2-34-197-84-77.compute-1.amazonaws.com. [34.197.84.77])
 by smtp.gmail.com with ESMTPSA id z19sm17735949qtb.37.2020.09.15.10.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 10:48:22 -0700 (PDT)
Date: Tue, 15 Sep 2020 17:48:20 +0000
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add documentation
 for LT9611UXC
Message-ID: <20200915174820.GI478@uller>
References: <20200909092823.64810-1-dmitry.baryshkov@linaro.org>
 <20200909092823.64810-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200909092823.64810-2-dmitry.baryshkov@linaro.org>
X-Mailman-Approved-At: Tue, 15 Sep 2020 17:54:30 +0000
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed 09 Sep 09:28 UTC 2020, Dmitry Baryshkov wrote:

> Lontium LT9611UXC is a DSI to HDMI bridge which supports 2 DSI ports
> and I2S port as input and one HDMI port as output. The LT9611UXC chip is
> handled by a separate driver, but the bindings used are fully compatible
> with the LT9611 chip, so let's reuse the lt9611.yaml schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  .../devicetree/bindings/display/bridge/lontium,lt9611.yaml   | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> index d60208359234..7a1c89b995e2 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
> @@ -4,18 +4,19 @@
>  $id: http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
>  
> -title: Lontium LT9611 2 Port MIPI to HDMI Bridge
> +title: Lontium LT9611(UXC) 2 Port MIPI to HDMI Bridge
>  
>  maintainers:
>    - Vinod Koul <vkoul@kernel.org>
>  
>  description: |
> -  The LT9611 is a bridge device which converts DSI to HDMI
> +  The LT9611 and LT9611UXC are bridge devices which convert DSI to HDMI
>  
>  properties:
>    compatible:
>      enum:
>        - lontium,lt9611
> +      - lontium,lt9611uxc
>  
>    reg:
>      maxItems: 1
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
