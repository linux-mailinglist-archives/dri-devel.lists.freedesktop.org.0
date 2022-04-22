Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3B250B789
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 14:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A3E10ECED;
	Fri, 22 Apr 2022 12:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A343E10ECED
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 12:42:06 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so5394634otu.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 05:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=vGqa3JNO0ZwDV+RYD0ECVU5s6pbxZ+ZuFhh+nnOh86A=;
 b=LBfCLg8ASGYezRMGA+VVf0PNoUuLIfF3Vvw5f8bQ+GqlBc2CwIm8uQ1ds5TTIBOwsy
 o81TJbXpFiwrdwr7qZJBqBZ9/zhawNI3QVMYI6N9fuaYkzG4RMZEKAb+M/yckNnTIqLN
 ijz4G3Dhcgx2G13G9XkTs9PZsE2re2LyaFNeqkYRHL9lw/lmxsCd2KevtLWN1RF9Hlyg
 0VgEscO0yiLd8462X9qJfYmdMwEKw7MmWS9aHl6AgGTz40V2OuSV11rstDwb+V8WGySh
 8rX7SE+M8lmEnZnzfiihQ5b6inDHL9MoABvcUIJVx0S7aVj5CfXij1efPBGUHU26pxAJ
 zEUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=vGqa3JNO0ZwDV+RYD0ECVU5s6pbxZ+ZuFhh+nnOh86A=;
 b=mT/kwjCjqi16bjOpNEAbFhmraXSAARafMtn7ha6XRTNxFzeqM3f5Lwq3G00xioMPg+
 Ci/ms61bTOCSgoF+CBphKv+sDOo168j71WjJCsjxUS+G8FDyILmEZQ8mMhMDq+ZGJvZB
 KkCv2iStLjK3TXBQVXC0alS7hXQ7nzocAyyqoamxU8eCKmfz+v8nVfDOjVx3XCKU+rPi
 +/S6fH6O8sg+IZ4xk0UPeztq9uAOhW0l2rY0pR3UmaMjWyqHZLKBdT9P1Zo8jpwajEel
 +7s/v5fw2H5LD8XEeOovkNSEEDn5SnECTLJwiRFV5Ttv745/R4zxADKBDlaU2iCucALj
 A51w==
X-Gm-Message-State: AOAM531iurM90ecC0jaiwkRpkBli87jkljVXLf+IIGnxV2sWYmBBk43E
 nJxFdRaUiCDDlZOBxyXfHMM=
X-Google-Smtp-Source: ABdhPJyejOc9C14qomTmt6coqql+HtHeKAtOwbV0316n4wsRsfn/lGoPXXV4DndOzUHF3JDGh/WTgQ==
X-Received: by 2002:a05:6830:18f:b0:605:433b:c568 with SMTP id
 q15-20020a056830018f00b00605433bc568mr1632888ota.46.1650631325731; 
 Fri, 22 Apr 2022 05:42:05 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 w11-20020a056830144b00b006054888b7a3sm673378otp.1.2022.04.22.05.42.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 05:42:04 -0700 (PDT)
Message-ID: <402f0e60-8d3c-850d-84ff-af5424b72b73@gmail.com>
Date: Fri, 22 Apr 2022 14:42:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-9-jason-jh.lin@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v20 8/8] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
In-Reply-To: <20220419094143.9561-9-jason-jh.lin@mediatek.com>
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
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19/04/2022 11:41, jason-jh.lin wrote:
> After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
> mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

Chun-Kuang, I think it would make sense to take that through your tree as it 
depends on the previous patches.

I provide you a stable tag so that you can take it:
v5.18-next-vdso0-stable-tag

Regards,
Matthias

> ---
>   include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 59117d970daf..fb719fd1281c 100644
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
