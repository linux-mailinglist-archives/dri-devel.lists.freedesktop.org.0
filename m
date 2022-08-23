Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB91059D4AA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 10:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A85AFAB599;
	Tue, 23 Aug 2022 08:40:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F03414A5F8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 08:40:22 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id a16so10418189lfs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 01:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=W0I5qGBRorIzU4/M9Z2JKZBtnIIxK+lV/fotyWPu8eo=;
 b=YfivAOPyp/S0t3HR39n5l6tvClobRS3WjgJLwTgsVGDusGuqa7DeH4gqCzzVzFxepy
 OW9z5QACGE6BtNdpfnV1/HM8WsRwMVBLMh7YHcIyDUF2/MY8bcVlCehu+nEIZUAsWx9c
 fkwMmvwOK97l7bl4OC/J8rsmNB/AQuWLY4nvO6ILnWgRoezZMuVZ3kY822corbLuFOpD
 UYCZ+XlyG4PQbltck8mA2bLjjbXpqsDw1J5IxUXZd+hrmHOhLc70LrN2dJXq+xs6XeFw
 ThxIm7/BGfRz9voj2AhZY9VnjvoLi91SlfokA7MoysD+QWK15MHumcudOkm1Oi0A03xn
 Fw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=W0I5qGBRorIzU4/M9Z2JKZBtnIIxK+lV/fotyWPu8eo=;
 b=4dGc4JAc/YEC38a7mAXjcuhtagHzJwhfNtXa8HXdbL74NyT1+aS5cbM0g6TJItd/5p
 vPbNcpmrPrF42vn6FoQT4/GKY86ufNGYcBSeUtMkjAIFGZCJJYQgsMMMoJfjGwxfA5ak
 muc2gn3R2QdaABVOcGQFC0HWKzSl5CvMOhfTm2B0Wdl75/NgtcomFHL7tGRtrB6PrQhK
 SxdcCsLZlA/zxae6QCQhPS59bAWX6okmUMA+eWzTubUEP3Tgtmm316CqNUCO5pl+Lx57
 qtufpx5hkNSIxMt9RxfM2nhOwQ5l5yNphpa5ATN3/hpQaxCHlntsyK/ZYHiqkFp8C7PY
 8VPw==
X-Gm-Message-State: ACgBeo1o4mCLpxHpagwhvzrT/Ftv3nkIgzUZB7hTFfoH+InTsZ6QXcvB
 rMdfWSJY29qugGRlvabmOj3BEg==
X-Google-Smtp-Source: AA6agR5+rUJS0PTf+2wjIEbj+myfHGedVpyDY4058HVzXxye9slAAObIkitw5XGxHJ1FVj4NKKE3Hg==
X-Received: by 2002:a05:6512:118d:b0:492:da96:689 with SMTP id
 g13-20020a056512118d00b00492da960689mr4163856lfr.244.1661244020402; 
 Tue, 23 Aug 2022 01:40:20 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a2e8e74000000b0025e1ec74e25sm2247874ljk.43.2022.08.23.01.40.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 01:40:19 -0700 (PDT)
Message-ID: <39f63588-bc88-a716-bc66-7f93c4aabc56@linaro.org>
Date: Tue, 23 Aug 2022 11:40:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 3/3] arm64: dts: Modify gamma compatible for mt8195
Content-Language: en-US
To: "zheng-yan.chen" <zheng-yan.chen@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220822091945.21343-1-zheng-yan.chen@mediatek.com>
 <20220822091945.21343-4-zheng-yan.chen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220822091945.21343-4-zheng-yan.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/08/2022 12:19, zheng-yan.chen wrote:
> Modify gamma compatible for mt8195.
> 
> Signed-off-by: zheng-yan.chen <zheng-yan.chen@mediatek.com>
> 
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index a50ebb5d145f..8504d01b103a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -2021,8 +2021,8 @@
>  			mediatek,gce-client-reg = <&gce0 SUBSYS_1c00XXXX 0x5000 0x1000>;
>  		};
>  
> -		gamma0: gamma@1c006000 {
> -			compatible = "mediatek,mt8195-disp-gamma", "mediatek,mt8183-disp-gamma";
> +		gamma0: disp_gamma@1c006000 {

No, really, no.

Not explained in commit msg, violates naming convention, violates coding
style, not related to the patch at all.

Best regards,
Krzysztof
