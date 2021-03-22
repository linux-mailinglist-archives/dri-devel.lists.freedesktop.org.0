Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 837A8344AE2
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:17:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5BF6E512;
	Mon, 22 Mar 2021 16:17:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78AA06E512
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 16:17:50 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id e7so19999572edu.10
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 09:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AiPl5pUPZTQr5pITP8xS+7R+vsKTJAIeUGsmJUXOUM8=;
 b=drkd7YYD8A9I08BCKjeekcKOrjrZm/kJ3mGaGwuhEGQvvp8ztRhAC7BMcavdMGzyKd
 fbH2q/+t+eWv5Mc+gs0x46at7q+r7LCSCm5KZWJUc9RYVAv2U7JEPSAmpa8mYDW75sCL
 WAvNuR5r6e5Oysv0GL20/JLVN73bKnGNAkDatePsgsEJo8zEwxKVTHd9FhpmSsmj1zlI
 T2975XrirvwrXUqPP3eXvlrjA4ZECQrRzxvpFlnGDc1YhESBqWXqR7ugISabmIMCniW4
 iatgHqbfl50lN9ZX50p9tWv+fWjydG+T9NsMDr9wTlonji8pXYBq8h1y0dxq9nzuZMfo
 iPsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AiPl5pUPZTQr5pITP8xS+7R+vsKTJAIeUGsmJUXOUM8=;
 b=A+LKQ1/p++cMzSUzFcyMRzVNy1yPDC2oieFjYbMDZcR9TyrhzlNgVeuc+N6m4wPyXk
 Y/HhEahcLhX8NS2FPOEcxQhxRK8r/A2C2ionvy5rCneFO9OGQ8+e5yBRKmJYMiUVE3jk
 SzSCj2ZUDq25JUnGv7mw4eMnpJlF/J6+uR4twKCq8Lfk6dB2gI+lk9BHvBkdrwlMzCwO
 aovtS2hDNik9OpflusQjphShFB2FZInlIRJOAEhreeekvW7NgovyCpawNxSxen74hZp1
 +ilsFdUlsHaA8b+dGWFtFSBgbQxafbfVEprnFTgiYi1eBl0eBdcV1aHyGcUMSqgOE9xr
 S2sQ==
X-Gm-Message-State: AOAM532R1WrS4yFsuZ2+YJpeChYBFVs7mPUf9qCoAF0qLaCZ0NCsgUY/
 zpt4x6lMLr62k38OWRmfH7q53A==
X-Google-Smtp-Source: ABdhPJzlqIlXd2lr5b+aZ/CbSlNKvZnTLq2jAivh/8csn0KWGeT+i23ECN89apHlZcQXI4vuQQeRoQ==
X-Received: by 2002:a50:ef0a:: with SMTP id m10mr305593eds.261.1616429869194; 
 Mon, 22 Mar 2021 09:17:49 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id h2sm9995456ejk.32.2021.03.22.09.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 09:17:48 -0700 (PDT)
Date: Mon, 22 Mar 2021 16:17:46 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 1/2] dt-bindings: leds: backlight: qcom-wled: Add PMI8994
 compatible
Message-ID: <20210322161746.xvdrjcp3g7jijq3b@maple.lan>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210228124106.135812-1-konrad.dybcio@somainline.org>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Kiran Gunda <kgunda@codeaurora.org>, Jingoo Han <jingoohan1@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 Pavel Machek <pavel@ucw.cz>, angelogioacchino.delregno@somainline.org,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
 Dan Murphy <dmurphy@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Feb 28, 2021 at 01:41:04PM +0100, Konrad Dybcio wrote:
> Document the newly added PMI8994 compatible.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>

(For Lee) Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.


> ---
>  Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index 47938e372987..d839e75d9788 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,pm8941-wled
> +      - qcom,pmi8994-wled
>        - qcom,pmi8998-wled
>        - qcom,pm660l-wled
>        - qcom,pm8150l-wled
> -- 
> 2.30.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
