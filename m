Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E02850B9E7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 16:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E05810E1B4;
	Fri, 22 Apr 2022 14:19:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4AD810E1B4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 14:19:42 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-e5ca5c580fso8764397fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X7u3kglhM0VkTW03FStsvrOnIn+Xj3SEcCEn4rSVb2M=;
 b=doxXGTkzNgr961Vtac0I8Zhl1wa8l2EJNGL/EiZdctp1nfqY1r9tiLc66rTrOW3sEi
 RM00KIuonmmVfjOozzjwUSfYjHAUfJ7amPN0xWq/HHhvULB5GFvMHxpxNEbuhAlEYCL0
 6Nf8JzIoaCqKa+yuJ6fWuhCX5BK68o+amMSrl/s+9arho0DStmzkxahga3IuG+Ocn4BR
 PoOR2jNDY8NCUcyc/VPL7BFtTkGadWnHZhkOTxupp2+jsz2C+D+htRUAK66VY8lCl0TZ
 BYTnBGEsVFMl4EEb4TVVqEkULyAgxKx3JIT2srrQxoXOaRNhusHjeY9oh7fKTUj8Qw0Q
 gPYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X7u3kglhM0VkTW03FStsvrOnIn+Xj3SEcCEn4rSVb2M=;
 b=5ScgJ+b4jSWyL42npLIRitA67UZRIw3/EvaaBY5BO/InQIwlDeN8D/p/mZiIEdsROB
 gWBu6aSqShJHPnPoh43OuIY8dI8zFmK8Gb9EHm/AA86dC3RSKWiy4ZkM9qDlSCjmvp5P
 cKkByQ3KBbUws0d+QBAGV4icAoqxmhYDOiQh7Y6gMQcO76jY4PfRmXnoCqqE0YiwLeQV
 kBVnMtxgKXXU4G3aa30q9SUPImyzTXZjhMmf8SrFOn+cJwdAPRAF4SKdld+jo8JAcvWT
 6DTI5izGBvLVBEWksSS8yag39NjlU5u3UJKS/L1kpxobeiR+tCW6gott6tFBIyZwJ0/P
 4VMw==
X-Gm-Message-State: AOAM533eNiOxtzZ55yrbwf+L19QVRCmdiUrKmpbnVRFZvFIB+gjEYWUr
 ZYlbfXU633gWjW2EefsRcAM=
X-Google-Smtp-Source: ABdhPJyRUn+Uq4kLyzdsgMmHE5kkqjywZFQ2SL5fSRXPWW5Su/ofYv0nnbjSTPRCJnLsPK5NNqvn4A==
X-Received: by 2002:a05:6870:589d:b0:d6:dc7f:6b10 with SMTP id
 be29-20020a056870589d00b000d6dc7f6b10mr1955692oab.175.1650637181912; 
 Fri, 22 Apr 2022 07:19:41 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 c14-20020a4ad20e000000b0033a371fa815sm806446oos.37.2022.04.22.07.19.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 07:19:41 -0700 (PDT)
Message-ID: <4373b922-bd07-c02d-e43f-0426690cf47d@gmail.com>
Date: Fri, 22 Apr 2022 16:19:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V2 2/3] arm64: dts: mt8183: Update disp_aal node compatible
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org
References: <20220411035843.19847-1-rex-bc.chen@mediatek.com>
 <20220411035843.19847-3-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220411035843.19847-3-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, nancy.lin@mediatek.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 linux-arm-kernel@lists.infradead.org, allen-kh.cheng@mediatek.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/04/2022 05:58, Rex-BC Chen wrote:
> The driver data of MT8183 and MT8173 are different.
> The value of has_gamma for MT8173 is true while the value of MT8183 is
> false. Therefore, the compatible of disp_aal for MT8183 is not suitable
> for the compatible for MT8173.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 4b08691ed39e..a3616005d65c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1466,8 +1466,7 @@
>   		};
>   
>   		aal0: aal@14010000 {
> -			compatible = "mediatek,mt8183-disp-aal",
> -				     "mediatek,mt8173-disp-aal";
> +			compatible = "mediatek,mt8183-disp-aal";
>   			reg = <0 0x14010000 0 0x1000>;
>   			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
>   			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
