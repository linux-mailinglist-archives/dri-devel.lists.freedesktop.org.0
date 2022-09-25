Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E221E5E918F
	for <lists+dri-devel@lfdr.de>; Sun, 25 Sep 2022 09:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C47110E1AB;
	Sun, 25 Sep 2022 07:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22BF10E1B7
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 07:52:50 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id a8so6383009lff.13
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Sep 2022 00:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=Nv/5RSkqJKkOQl85OwCTSN2eXEdey0R3YQsmEsMaY/o=;
 b=hU2MCTfvOqVLs63hQU18x6s6H8CTXmttD5HjqiKRCmqMfvHHHmqZUxliZ8w2KMvlxW
 HY6ZbU32LdWScTNc9OXWD838+l++dGSb2Fd9ZzYTTaZVi7cBcbSyoTfMoiF7vr6gFiqP
 cGxfMD2f+QvL9CfHSeDVJRwLcgL+sN01C9jJeLvXRcoixlSc/FLPiJlRhz+gNGITIlcy
 h29T7GtPtgwgrGMn8PjOk9SctvjwVP/Io7FyM9W7m4EWImDl5eEDbdHjzGaYS1YgS8uu
 9Ft9k4LleycrQ6/vSdz5qoqOrRXAQJxpJ6ifWgJvGzjwNBzhKiJ3YZlvQpZMy7SvRX0/
 XnaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Nv/5RSkqJKkOQl85OwCTSN2eXEdey0R3YQsmEsMaY/o=;
 b=3adMjS9a/L+Ezrr6axGqLxmQG+D5SiNRlIFgcGbHIZpxLzW1OMk7aWgj6B0hJS1mW5
 0IbpBfShktE/GmCWbthaicnL22Do7N8K+Q2TQA4OYpqFC43Y0i6kg11GZNmjYqUWbNOj
 6mwSSfqiI47ey+YKF5nvg2l2TCBzlH85GXTy0azQK8danyDTmjeDodkvEjd9UsvWKPSl
 Lt1cHm9vcoZCwaIjI3zDFdzqshPKeVNjlwZOyPCrMLBJO14liDWT+0Wij5x9HyaJqz44
 P5X50rhqKTQZ9KmCjWICoVSC61J1TCT3WfqKCkQZH8szp4fcsrjEG1qM1V+CLuXZs+do
 FtPg==
X-Gm-Message-State: ACrzQf150Rz6cvHYEUxPGIDAYOf4jnx3uhCHwfRvj/5IVnJhd3EuFxnj
 mMFmKJgrAj7T0z9dKI4LxJFIcw==
X-Google-Smtp-Source: AMsMyM5KqwOtk9nprf+87CHVg/qjuDRlMePxSxZCLocwuB38qh1j0wmVsjSub+fYSEf33xrdHHVGjw==
X-Received: by 2002:a05:6512:78e:b0:49a:d9ae:3051 with SMTP id
 x14-20020a056512078e00b0049ad9ae3051mr6285650lfr.203.1664092368716; 
 Sun, 25 Sep 2022 00:52:48 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05651205c900b004979ec19387sm2128219lfo.305.2022.09.25.00.52.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Sep 2022 00:52:48 -0700 (PDT)
Message-ID: <6bbe9527-ae48-30e0-fb45-519223a744d7@linaro.org>
Date: Sun, 25 Sep 2022 09:52:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4 1/6] dt-bindings: arm: mediatek: mmsys: change
 compatible for MT8195
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220924080058.20566-1-jason-jh.lin@mediatek.com>
 <20220924080058.20566-2-jason-jh.lin@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220924080058.20566-2-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/09/2022 10:00, Jason-JH.Lin wrote:
> For previous MediaTek SoCs, such as MT8173, there are 2 display HW
> pipelines binding to 1 mmsys with the same power domain, the same
> clock driver and the same mediatek-drm driver.
> 
> For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding to
> 2 different power domains, different clock drivers and different
> mediatek-drm drivers.
> 
> Moreover, Hardware pipeline of VDOSYS0 has these components: COLOR,
> CCORR, AAL, GAMMA, DITHER. They are related to the PQ (Picture Quality)
> and they makes VDOSYS0 supports PQ function while they are not
> including in VDOSYS1.
> 
> Hardware pipeline of VDOSYS1 has the component ETHDR (HDR related
> component). It makes VDOSYS1 supports the HDR function while it's not
> including in VDOSYS0.
> 
> To summarize0:
> Only VDOSYS0 can support PQ adjustment.
> Only VDOSYS1 can support HDR adjustment.
> 
> Therefore, we need to separate these two different mmsys hardwares to
> 2 different compatibles for MT8195.
> 
> Fixes: 81c5a41d10b9 ("dt-bindings: arm: mediatek: mmsys: add mt8195 SoC binding")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml     | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 6ad023eec193..4f90ea03c596 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -31,13 +31,16 @@ properties:
>                - mediatek,mt8183-mmsys
>                - mediatek,mt8186-mmsys
>                - mediatek,mt8192-mmsys
> -              - mediatek,mt8195-mmsys

We keep making circles...

I asked "and why mediatek,mt8195-mmsys is kept as non-deprecated?"

and your response is to remove it... Eh, okay, that's fine but now your
change causes now warnings in existing DTS. Either you keep old entry as
deprecated (just git grep for deprecated, you will find examples how to
do it) or fix the DTS.

Best regards,
Krzysztof

