Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A572557CFE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 15:29:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 325CC10E10D;
	Thu, 23 Jun 2022 13:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8228D10E10D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 13:29:49 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id pk21so17971281ejb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 06:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ePFuz9gjvneLUbo3iN6/MzxTmZntguROUvpcqfx6Iwo=;
 b=kilEQhJrekBj3tVAycBQpE9BNm+Hip30HCPN/XSCTP2U3wbVhI+hKk23MdWIJ3Dypl
 qffhEEQuVyFUbz5J/1MdRBYKZboWhtStOI0k9d4Aup1BGLOrMrpYY+seBOosUnKwLsVL
 MR8LYhAjJ7oxOGmAxEiBhJVdCYG5Px8Hk5taqdBpD4drG+ZVVNZdVDHoKm/h/QUZCtRE
 S/rsZcWp/qiddxN66KL5ZRoB7s5KVyCOidfIT7Tj2vaZ3puYEijJfvMh3qbsM5C2CTmU
 wm6I50k0AELikWo0VYYaG0KVFje/4tZd3tKtvxfUODluU2IRXxgw5OElq49HM1lYwZfp
 tMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ePFuz9gjvneLUbo3iN6/MzxTmZntguROUvpcqfx6Iwo=;
 b=CLsJSTPHsBuvu8ZgEWUx0L1MwnmiNB05FmEMJfxav2vkp4/f4DdCkZrTY5Oj/Xfco+
 zkBBnCwYyKnx023D1kZlk1zQ8xvQPMvvmGwJKzqHBZiaSoALCvMJVjG1LnRRyNFJwhTN
 c1iHLkGpKeMD6LtqcFEvXgo1skhAlzGhETMBuOkVC922qwdTyZZ5/HsdJ+88yLTLH1FG
 GY5u1q0S6AuH4WFJ9upqFBXl8lYvf/WlhmiWMMBkpojcUSlz4pVgrnPFFUJmA2UFVSEb
 RdfCybAqyVEkoe6M6nvVwKI4SWMYvteftGbHhd0U5pckpo78MqLUxpqds8EDtX9D62F6
 ZYEg==
X-Gm-Message-State: AJIora+CjjEK99NBni5bX+Me6S9QMiKMK2psDoIkpNkhX2+C/WtF7xQM
 LeO0Gw6naqZzGZAPMz1idw/Uag==
X-Google-Smtp-Source: AGRyM1vKuGTywgyEw2jM3zmPBBBXUc+7mwZ7taGR4hWf4ZepG7VJH9Yci4kWlWodvrYiVNk2KnX7tA==
X-Received: by 2002:a17:907:e93:b0:722:e082:2787 with SMTP id
 ho19-20020a1709070e9300b00722e0822787mr8647094ejc.618.1655990988030; 
 Thu, 23 Jun 2022 06:29:48 -0700 (PDT)
Received: from [192.168.0.230] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 ff10-20020a1709069c0a00b006fec69696a0sm10604906ejc.220.2022.06.23.06.29.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jun 2022 06:29:47 -0700 (PDT)
Message-ID: <ddfae1cc-ec28-3433-8c3c-24f63a1ad0a8@linaro.org>
Date: Thu, 23 Jun 2022 15:29:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/2] dt-bindings: display: ti,am65x-dss: Add am625 dss
 compatible
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Tomi Valkeinen <tomba@kernel.org>,
 Jyri Sarha <jyri.sarha@iki.fi>, Rob Herring <robh+dt@kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220623103504.26866-1-a-bhatia1@ti.com>
 <20220623103504.26866-2-a-bhatia1@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623103504.26866-2-a-bhatia1@ti.com>
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
Cc: Nishanth Menon <nm@ti.com>, Devicetree List <devicetree@vger.kernel.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Rahul T R <r-ravikumar@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/06/2022 12:35, Aradhya Bhatia wrote:
> Add ti,am625-dss compatible string.
> The DSS IP on TI's AM625 SoC is an update from the DSS on TI's AM65X
> SoC. The former has an additional OLDI TX to enable a 2K resolution on
> OLDI displays or enable 2 duplicated displayw with a smaller resolution.

s/displayw/displays/

> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> Reviewed-by: Rahul T R <r-ravikumar@ti.com>
> ---
>  .../devicetree/bindings/display/ti/ti,am65x-dss.yaml          | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 5c7d2cbc4aac..0fc77674eb50 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -19,7 +19,9 @@ description: |
>  
>  properties:
>    compatible:
> -    const: ti,am65x-dss
> +    enum:
> +      - ti,am65x-dss
> +      - ti,am625-dss

Alphabetical order? Avoids conflicts...

Best regards,
Krzysztof
