Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8598622A69
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 12:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB2CF10E5A0;
	Wed,  9 Nov 2022 11:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7362F10E5A0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Nov 2022 11:25:31 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id bs21so25293269wrb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Nov 2022 03:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G7aHBcV/NNodzOnLWHFv0Riu76BmXp6c1Mma1hVG8aM=;
 b=XYam02f3n+s+9rA8MLrmSemGlScqvoMoyF9wLzLKhPcp4FqNR/uN7+e5XwyAviqitk
 cLi0AzRqM8DeNh6XzYcqB3Bjlf0KCgI2pnhMWcqLfCTM3QlDOnyyyQmxA5MgHhrd9kmj
 fT+nY9F1bHt5nyeoQawsO0YiEnLJu4/xWh2P7+joV5gc89rCg20nOlA0zpijWjoByK/Q
 B8ljkLARZUqQmYZ2N/ExbQVrTdgXYj+tQEz3nptPBQPoYbWWRP97/86m8Q889gQFHKEq
 7/aHhW7jEuBZoWCxUnWoOrYFbI0A/E5LoHHTx5cVnBUdnRmF76P/BszM+ef5iQ38pUle
 Xuew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G7aHBcV/NNodzOnLWHFv0Riu76BmXp6c1Mma1hVG8aM=;
 b=yWjTf+8pJpNVOEfQPSKLcwOfUfYtaqHwLiSOWWZ6eXceBk7ls5BrEWHGicaY2INoLa
 hei9x/sI+C7uNxGkP64FY5ktehDgG4MvHRuh6ImKtfJjk4Ra8NPIHmOfk+pyw+rnEP8t
 ZISeNDVNPBelQ6C9zrsKL84C7uLqN0LwxaJJsusCOwQvozNMJVtfacYq2/GnSncFShjF
 I6Mjo7EUax9mRYA0Br/BVOT6cZqqEO+nR9gy31C48pvnnaPLwGPtcByUCoVYkunCzl5S
 DJyHyBcAgOFwNTmmqhv6j0fXBdSau721Z7a8T9jfSojGWtYAsuuXiRIEky8BAOVq05D9
 Yhmw==
X-Gm-Message-State: ACrzQf1jYL0hqlNhSBlgViwyYNfiXWVobGeOfsoNuu3KSUyC1Hqj/BrZ
 aXN8J8b+Sp41LSfWwnw+rj9uxxw/ySg=
X-Google-Smtp-Source: AMsMyM7F9beiptQWeU4dn/9YH5JLDFHVU3Fan7jjQBd5F6TMfl1va8bhwzE+wyiUlb6x39jmOAp+9g==
X-Received: by 2002:adf:f8c2:0:b0:236:9cd1:6748 with SMTP id
 f2-20020adff8c2000000b002369cd16748mr36855017wrq.283.1667993129624; 
 Wed, 09 Nov 2022 03:25:29 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 p14-20020adff20e000000b0022e344a63c7sm13030211wro.92.2022.11.09.03.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Nov 2022 03:25:28 -0800 (PST)
Message-ID: <30278e0f-88ec-069b-3469-56b3fb795702@gmail.com>
Date: Wed, 9 Nov 2022 12:25:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v5 6/6] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
 <20220927152704.12018-7-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220927152704.12018-7-jason-jh.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 27/09/2022 17:27, Jason-JH.Lin wrote:
> After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
> mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Chun-Kuan, I understand you will take this patch through your tree as it depends 
on DRM changes. We can also sync so that I take it once you merged the rest of 
the series. Having vdosys1 series around maybe that's better to avoid merge 
problems.

Regards,
Matthias

> ---
>   include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index d2b02bb43768..16ac0e5847f0 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -16,8 +16,7 @@ enum mtk_ddp_comp_id {
>   	DDP_COMPONENT_CCORR,
>   	DDP_COMPONENT_COLOR0,
>   	DDP_COMPONENT_COLOR1,
> -	DDP_COMPONENT_DITHER,
> -	DDP_COMPONENT_DITHER0 = DDP_COMPONENT_DITHER,
> +	DDP_COMPONENT_DITHER0,
>   	DDP_COMPONENT_DITHER1,
>   	DDP_COMPONENT_DP_INTF0,
>   	DDP_COMPONENT_DP_INTF1,
