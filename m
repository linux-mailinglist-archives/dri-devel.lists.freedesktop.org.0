Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0EE3A0DF3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 09:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD2AD89FA6;
	Wed,  9 Jun 2021 07:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A384E89FA6
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 07:43:58 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 h22-20020a05600c3516b02901a826f84095so3493214wmq.5
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Jun 2021 00:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4Ed9mm909+j2egVHjfeRzyEVoKd06Gn517VmwgTGDNY=;
 b=ihs/M3HXxfcfdqcK6ShERGmNiIwPqOR4VL78BLcUpL2KZujymyOFRY/qkAe+5slhsW
 QGGw1zRiCl3/oKgVIG0L5N/UwmRohLjxkvDZYW0ZgMgueMUgQ5p5KxICAKZgBW5MByI6
 1wvCIUA4w09NWUzZMCsAe/bdnLIHleQDciilgfOlygDXs/99S1fxZBhSQw6YZDXtKLlB
 V41F7zfaEGWNQ5hZOl22FQ+UI2Sr/vnqfRXBRST0lTMBAO+FcANq+f6kJlFDVIetgOv4
 5yuqeeUBORrQos9RQszQJMuytnjC2598FLs9JBlRP5FS28zZQcfdYtjdaRYVh/4Ldxoy
 rfRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4Ed9mm909+j2egVHjfeRzyEVoKd06Gn517VmwgTGDNY=;
 b=Z6Pi4DVIdeIlpFHWYOSpsfSw5cN8bU6LNo3DMss3wKtURdvfwbtelL0B9ZSyzT4U2d
 L7AVv1mbISXdH65DV/rLZgefsXOTYaXGQC2R93iQ/QZ+t5vj5E/CjpDOA8FOtSkAc7jz
 4LWKmSNTae7BwagILBarpAvx+8APUffWqvL1ILOCe+UV6MLN4qk3FKYoH0XlSmjgMQy4
 GwGhJ4fDGMwew+X0CQabOcayk3MivniADCPMqU+QzTq5CFnso5ly9niIp9y4kLjKr3im
 dv7tDLdLKmbh7Vkj2SH9H+F/eWh3LZfsA4cmS58xbjZnsD2aI20faBXfTRQBJIvN36Mn
 WBsg==
X-Gm-Message-State: AOAM532AXNM5PNT4vJ2HXfq3IgCO8WHwd+q7nrry0YMfY632FrAwkLtH
 kdYQfjnUYuMVSEuFviTTM+U=
X-Google-Smtp-Source: ABdhPJy1TN5g9HVPQta2ngBPCU9iX96cZHpN+j/ZJV4T2M0MwzeH3BbE0S0m5qwPSCAQmLDWiA+gmw==
X-Received: by 2002:a7b:c189:: with SMTP id y9mr26040858wmi.106.1623224637195; 
 Wed, 09 Jun 2021 00:43:57 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id q3sm22548486wrr.43.2021.06.09.00.43.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 00:43:56 -0700 (PDT)
Subject: Re: [PATCH v5, 3/4] soc: mediatek: mmsys: add component RDMA4
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <1618236288-1617-1-git-send-email-yongqiang.niu@mediatek.com>
 <1618236288-1617-4-git-send-email-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a1824cdc-7e2f-a38f-d019-e1d8f92ead2b@gmail.com>
Date: Wed, 9 Jun 2021 09:43:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1618236288-1617-4-git-send-email-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2021 16:04, Yongqiang Niu wrote:
> This patch add component RDMA4
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  include/linux/soc/mediatek/mtk-mmsys.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 7718cd6..4bba275 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -38,6 +38,7 @@ enum mtk_ddp_comp_id {
>  	DDP_COMPONENT_RDMA0,
>  	DDP_COMPONENT_RDMA1,
>  	DDP_COMPONENT_RDMA2,
> +	DDP_COMPONENT_RDMA4,

Pach 1-3 looks good, but could be squashed in one patch. Please try to come up
with a more descriptive commit message. Rule of thumb is to explain why we need
a patch not what the patch does.

Regards,
Matthias

>  	DDP_COMPONENT_UFOE,
>  	DDP_COMPONENT_WDMA0,
>  	DDP_COMPONENT_WDMA1,
> 
