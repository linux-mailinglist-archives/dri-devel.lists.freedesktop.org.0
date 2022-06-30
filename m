Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DF7562278
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 21:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E10612A854;
	Thu, 30 Jun 2022 19:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3902812A837
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 19:02:25 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id ge10so40798581ejb.7
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jun 2022 12:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Ixd94IRcNWmkrcI7JCVI0OAMPGWl8miuu6Ps54C+2g8=;
 b=idykG8TOvg1pBqYBbUECorw1f9FdQEkkxnBxGMMWoaUfgs2vbHyvwnDZHOhlcqmIV1
 PGqN4FHN+DUGgLtYL249n6LKKLQu2SpGGz3PtDmbl/TESPHukU608sUL9atc7ECYQo+I
 iRPp6E8EwTQojmhBDiPobz/bWdTB7TTmH9kv2JYLV3tPRBics9ffEdlHcKiuWF9IS2dp
 GiXvE+yqpnYEUQpfrJ0ifPWQoHrgEc8XAp+Hld88ZKZ/3wyvo8Di0Ez84WH7VLHasBXq
 qQLUeVoC2lnYv45Zlrk6dktBl38EYbRtH9GdxWEIGIf1UE8/KFrs/qDm7KTUsB+jDDCO
 PVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Ixd94IRcNWmkrcI7JCVI0OAMPGWl8miuu6Ps54C+2g8=;
 b=W4rugP2OIzrDylobAMdjaG3Gc/aU6EQPtc6b0nvp+CenWOqAA7SAzhi8NzJJahqYtx
 6djsF2edOan2OLsL2+MFyhQBAIZW1Iae3ljl5SqofwnbLwL2HN0uGZVfT2jPerbPE0oN
 Pt3ITJ4dsxsRd1XiuLyGCfYLu55Es8uK/9aXnObI1wvC6yvVQpsPJZKQhtdoqSSir5Qq
 qvOmJe6ifSVpaf4s1+VBbYALmJbveOuMXKd7kOfRWmRNGNWvaqd3Xv55nfgdTtyzJNua
 dQqvuxZ/80PFgkrHwAsREiz5KtUyY/lPhefRh8qP0pZHLma4soTjjk9PDjlml8dMlBW5
 RUgA==
X-Gm-Message-State: AJIora/rBwHWNP+KrKRFjFCqXsrAXr/f9g86vuxNEtIUQrP0/9WztbU4
 ed92Njh6WvDAVKIPuDHv34DTrw==
X-Google-Smtp-Source: AGRyM1sNQbYgzNCNcBZYSUraU9r7SoPRVicUzCyAkVm+94gqR6RR/SXc2tLl3AtqayNJrd6UcQhmlg==
X-Received: by 2002:a17:906:4b0c:b0:726:41df:5580 with SMTP id
 y12-20020a1709064b0c00b0072641df5580mr10841935eju.263.1656615743720; 
 Thu, 30 Jun 2022 12:02:23 -0700 (PDT)
Received: from [192.168.0.190] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 h10-20020a50ed8a000000b00435728cd12fsm13680849edr.18.2022.06.30.12.02.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jun 2022 12:02:21 -0700 (PDT)
Message-ID: <54d564fa-3c46-78d4-59a3-4efa5a5bf319@linaro.org>
Date: Thu, 30 Jun 2022 21:02:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/7] dt-bindings: msm: dsi: Add vdd* descriptions back in
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
 <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220630120845.3356144-5-bryan.odonoghue@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, swboyd@chromium.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/06/2022 14:08, Bryan O'Donoghue wrote:
> When converting from .txt to .yaml we didn't include descriptions for the
> existing regulator supplies.
> 
> - vdd
> - vdda
> - vddio
> 
> Add those descriptions into the yaml now as they were prior to the
> conversion.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml    | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 91324f0828448..fd9d472437853 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -125,6 +125,18 @@ properties:
>        - port@0
>        - port@1
>  
> +  vdd-supply:
> +    description:
> +      Phandle to vdd regulator device node
> +
> +  vddio-supply:
> +    description:
> +      Phandle to vdd regulator device node
> +
> +  vdda-supply:
> +    description:
> +      Phandle to vdd regulator device node
> +

They should be also added to required fields, because before they were
required.


Best regards,
Krzysztof
