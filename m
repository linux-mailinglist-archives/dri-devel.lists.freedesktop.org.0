Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5AE927FB45
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CEB36E865;
	Thu,  1 Oct 2020 08:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6748D6E82E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 23:06:58 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id m12so3577562otr.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 16:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=u8kk68jq1HQ3VEfmqtlvvatNWaRvmOdWcvJpkeSRa5s=;
 b=VsW6xiYSmK1t2NVArskem6LSjWsvY2T0UvhVsyLThKXIOmko48cmupYThDRVbepg7S
 fJfqNoEXczTRpqMeA41zTl/xOEKTr5IM+h/1zy8OeQVWIwBUv15k+5MhaNsM/b9Ulkqz
 0pT/q6KbRrA9uAoTqQYbefJu9Kj5ElssFg0EVD6lQZiQuruNTGHrkdmCcqvivUIY7Que
 4zRK4/MaYykCt8olJxm2aTMTR9P3TQ3KiGO4+v1TWmZlF5YxcC1SE+3jCx4bdW3pqIAq
 izTthn6tdDi2gOjHaLYhnnZPh4UUT6sRTvmH+Wsobw2V4pnkvwcMeI0+7ntEt/JHjeQl
 a34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=u8kk68jq1HQ3VEfmqtlvvatNWaRvmOdWcvJpkeSRa5s=;
 b=OHNJX6Pgc9oSJSP5hWUUbHaJzdGc09Ta1SdqFmpGzZbndCbKxSOKXkX64YmmJj/9N0
 av+3fv9gTzHYufv0gtuPyP7yrGsJ7ME+5wX87jlr6DXnVn7IxmTfA9LvjaCOXcu1WN1g
 Tc4QAnguWL8nJVN/PbdlrVbxk6/8e3ZVtrhT04LMx1vGI86+ChAccQg5DJtggkHfUXWA
 Sri0MN1MeWFKEfyR34DPWbQ1UbZppGL9OIIbW4vgHzbRJ/im1KxJK9RyTpcPhB0y/NUG
 M2VZ5S2l4av9uM/s593toPYHiuV8cO21AOkx5EbYBXiXxQaPWJ/Oq+2Rq5IVm0RydhgX
 EBag==
X-Gm-Message-State: AOAM532owxMAaRt79ArUZD2R8r18vuX33B23E4X/9cAWpfpm+Z4eqeTq
 iw+5yVkWvhWbExWApgilUaPCDw==
X-Google-Smtp-Source: ABdhPJyKxZXSJZHwRvONe0FVQWKpUkGFgaqv3MBGaQg4v4c7Xy8x4Hdi96VUMfV/tn6TvIt+150cGg==
X-Received: by 2002:a05:6830:1d1:: with SMTP id
 r17mr3101583ota.311.1601507217496; 
 Wed, 30 Sep 2020 16:06:57 -0700 (PDT)
Received: from Steevs-MBP.hackershack.net (cpe-173-175-113-3.satx.res.rr.com.
 [173.175.113.3])
 by smtp.gmail.com with ESMTPSA id h14sm783171otl.0.2020.09.30.16.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 16:06:56 -0700 (PDT)
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi86: Replace
 #pwm-cells
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Douglas Anderson <dianders@chromium.org>
References: <20200930223532.77755-1-bjorn.andersson@linaro.org>
 <20200930223532.77755-2-bjorn.andersson@linaro.org>
From: Steev Klimaszewski <steev@kali.org>
Message-ID: <7ff13ed2-5fe4-01b5-d1d7-0916f0630196@kali.org>
Date: Wed, 30 Sep 2020 18:06:55 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200930223532.77755-2-bjorn.andersson@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9/30/20 5:35 PM, Bjorn Andersson wrote:
> While the signal on GPIO4 to drive the backlight controller indeed is
> pulse width modulated its purpose is specifically to control the
> brightness of a backlight.
>
> Drop the #pwm-cells and instead expose a new property to configure the
> granularity of the backlight PWM signal.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index f8622bd0f61e..e380218b4646 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -66,9 +66,12 @@ properties:
>        1-based to match the datasheet.  See ../../gpio/gpio.txt for more
>        information.
>  
> -  '#pwm-cells':
> -    const: 1
> -    description: See ../../pwm/pwm.yaml for description of the cell formats.
> +  ti,backlight-scale:
> +    description:
> +      The granularity of brightness for the PWM signal provided on GPIO4, if
> +      this property is specified.
> +    minimum: 0
> +    maximum: 65535
>  
>    ports:
>      type: object


Tested-By: Steev Klimaszewski <steev@kali.org>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
