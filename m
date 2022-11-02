Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ACD61641F
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 14:55:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A22B10E488;
	Wed,  2 Nov 2022 13:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54BED10E488
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 13:55:22 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id w14so24640832wru.8
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Nov 2022 06:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=liIWxgnrKB54svAZTpFgbikolxVnlfVc0BGgGZkfhjg=;
 b=Z9Y0jFYRdBXTbT/NsetraCzA6Hx/LsJK8GvYTwmGE7/44i5Dos9kQhq4dyTmyLbP+6
 PfJdJNfxHY4KFvT+XX97pojpx1ufh/8Up64nZcKAmyVqDq9nzPOgtGzG5PmE9V/LgW1w
 /EU7qjBFX04dYaGRArio8gk19Cbw5xbsAxtxNqXmxXtBhtwVP6atTXX1ui3h/Gnt13BM
 0O6/r05ywa3CbkZ4NmLrSxi4aFxbDJHoDSSdzzatYfCldit1bn+1ZLyxrOjXZ95qmoJM
 MHubLiH2tyKfgaRnLU6RoJgmbm7q3SgwNBVfpatEPe4Cyu3hutzQ2QTT40rAfcis7qPh
 C9pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=liIWxgnrKB54svAZTpFgbikolxVnlfVc0BGgGZkfhjg=;
 b=KpRhfhITMwTujQ5zAhzMcylQzFCy8qvFClEECsU6jKIDkW5fVOrTbG649YB8RhV3s7
 2b6Cs8Mvr7yLMEcjsRlY9R4ooC9m67nFaIEWfQJgg+ennqsiCIAHwiN1rFFomylVI1s0
 YtcCALhiTZJCSky71lVgP2MmmzBQDnnQJ2+lTDZrLVgoC1SmwkzSDBQsxPWXYW3DstiP
 0xSzxyw9JjNsolMB0tp0LfN9KUt4emjeWfyND9Fp5w+TKeIbGwZ/lanGLtBltVSRmWCl
 zZBDuxGILLa9NalBAmXk3QYUIjX80S5BRufXWPRoNVd6/J3POE7oulcoBYiAwYPq8nCH
 VXFg==
X-Gm-Message-State: ACrzQf0lneNVgfKPxa3fUvTGNF0VfWjSOaehwiLq+HifV1rZcpRfGp39
 NzE2wUrdTAvcPYWavyzWYzdjkvyddNpA4w2/UlE=
X-Google-Smtp-Source: AMsMyM402qsrhIO6ldQJS2gMhEnDQv3oqTkbMUS2+MeWiGtoJh42ic09+34ohyg5+1+SYhUV3rE4KA==
X-Received: by 2002:a5d:598d:0:b0:236:8ef5:867d with SMTP id
 n13-20020a5d598d000000b002368ef5867dmr14927482wri.162.1667397320480; 
 Wed, 02 Nov 2022 06:55:20 -0700 (PDT)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175]) by smtp.gmail.com with ESMTPSA id
 b9-20020a5d45c9000000b0022e36c1113fsm12491311wrs.13.2022.11.02.06.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 06:55:20 -0700 (PDT)
Date: Wed, 2 Nov 2022 13:55:18 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Luca Weiss <luca@z3ntu.xyz>
Subject: Re: [PATCH v3 1/2] dt-bindings: backlight: qcom-wled: Add PMI8950
 compatible
Message-ID: <Y2J2xp9w4Hvethb7@maple.lan>
References: <20221101161801.1058969-1-luca@z3ntu.xyz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221101161801.1058969-1-luca@z3ntu.xyz>
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
Cc: devicetree@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Pavel Machek <pavel@ucw.cz>,
 Jingoo Han <jingoohan1@gmail.com>, phone-devel@vger.kernel.org,
 linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 01, 2022 at 05:17:59PM +0100, Luca Weiss wrote:
> Document the compatible for the wled block found in PMI8950.
>
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>

FWIW:
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
> Changes since v2:
> * New patch
>
>  Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> index 4c15693f7a01..5ac8605a53b1 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/qcom-wled.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      enum:
>        - qcom,pm8941-wled
> +      - qcom,pmi8950-wled
>        - qcom,pmi8994-wled
>        - qcom,pmi8998-wled
>        - qcom,pm660l-wled
> --
> 2.38.1
>
