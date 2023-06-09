Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 862BF729D1F
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 16:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F2710E6B9;
	Fri,  9 Jun 2023 14:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447A910E6BE
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 14:41:16 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-30ae141785bso1779626f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 07:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686321674; x=1688913674;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=CR0c0Jmte6FeApUkgHJzlSR9/4YGGRJ45CFKhUONxZs=;
 b=ljyF103rTiR0ysRbp8iTZkhShz0Q4wQtsi4SiCh2Z9pCwZ+ITBYkoJFpAwLZ0L/DBf
 dVde8h40DygaZTGXlquTqrFKGhS/fPQXkH3rfBZCFLnXegcLj7R4fwqdhKeSRXc9NGAK
 pOSsUYKkoduu+yFfBsLJXfv2Al7tu01/P+iLRTw5r0H2F4h46VX6M0UKyfU7h4Mkb1Qk
 X0fwqcjc2oruhg7mhpvmyucGXNcHgdB+BZhrMkFLM4f2A6UXmPJvRWIdXy75kRfn+1gF
 TCOFRB20afPYt8QayEUeMFAfMVHHh8ca6M3sl1xH7PD5z9+F/QKbK+8wKI2NYF9ADAxa
 bxQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686321674; x=1688913674;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CR0c0Jmte6FeApUkgHJzlSR9/4YGGRJ45CFKhUONxZs=;
 b=UgUba/BlZhtEMbXaPQ8tOC6Dx9RQ+b7h+XWKAmgOVQO3fUvZRfYz7ucLRCZeR1wvJG
 5kls6qS5lMAesE734Ky3X0eM+HeFLpNib9scExB2xyE1R6A3v5DvolmJLN0DgOAui8qR
 maz0UqMrAD/QhRq3PbY1ItlNv/X0de8FyhmSTYGKE2GMT4Qe09RVVAIXjG9yq0JJBR0/
 O4XC04VZ9hJkn9bMBOABaAscU7P/IxawbVtY/nAs0O7A7m3jhZxdIw++EAQ4SAk86lYY
 H4SH1/0ld5m5oNgCv8PGwz7kCdThNSYaRSt+hpn8sm7oGvtwhwB8fNnkETLDLxLRSFex
 7/YA==
X-Gm-Message-State: AC+VfDwVfeLUNR+DXGyjDVt2fuj3VNLnY6z+jhIahifg5zM6cBq/5la0
 6bj4pHS/jEUk87WQlL49TP4=
X-Google-Smtp-Source: ACHHUZ79Lfg6kM1VebrkIaLd3ziJZPC6iHeyxpXvPXdX4Z7/4UxGlL7mbxQG4cIZxJ4v2F+J48mv2Q==
X-Received: by 2002:a5d:6104:0:b0:30a:e7cb:793 with SMTP id
 v4-20020a5d6104000000b0030ae7cb0793mr1363370wrt.15.1686321674019; 
 Fri, 09 Jun 2023 07:41:14 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 q25-20020a7bce99000000b003f17848673fsm2883516wmj.27.2023.06.09.07.41.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jun 2023 07:41:13 -0700 (PDT)
Message-ID: <1c52e05f-33bf-b182-dd4d-18aa43564e59@gmail.com>
Date: Fri, 9 Jun 2023 16:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v8 2/2] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
Content-Language: en-US, ca-ES, es-ES
To: Chen-Yu Tsai <wenst@chromium.org>
References: <20230306080659.15261-1-jason-jh.lin@mediatek.com>
 <20230306080659.15261-3-jason-jh.lin@mediatek.com>
 <CAGXv+5EPktjMABhtWf9dL-25dAe=Mf4=BSMmE+=4m2WisDXXFQ@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAGXv+5EPktjMABhtWf9dL-25dAe=Mf4=BSMmE+=4m2WisDXXFQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 31/05/2023 09:43, Chen-Yu Tsai wrote:
> Hi Matthias,
> 
> On Mon, Mar 6, 2023 at 4:07 PM Jason-JH.Lin <jason-jh.lin@mediatek.com> wrote:
>>
>> After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
>> mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
>>
>> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
>> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
> CK didn't pick up this patch. Since the other patch already got picked up
> in v6.4-rc1, could you merge this for v6.5?
> 

Yes, I gave an acked-by as I thought that CK will take both of them. Anyway 
applied now.

Matthias

> 
> Thanks
> ChenYu
> 
> 
>> ---
>>   include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
>> index dc2963a0a0f7..8eb5846985b4 100644
>> --- a/include/linux/soc/mediatek/mtk-mmsys.h
>> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
>> @@ -27,8 +27,7 @@ enum mtk_ddp_comp_id {
>>          DDP_COMPONENT_CCORR,
>>          DDP_COMPONENT_COLOR0,
>>          DDP_COMPONENT_COLOR1,
>> -       DDP_COMPONENT_DITHER,
>> -       DDP_COMPONENT_DITHER0 = DDP_COMPONENT_DITHER,
>> +       DDP_COMPONENT_DITHER0,
>>          DDP_COMPONENT_DITHER1,
>>          DDP_COMPONENT_DP_INTF0,
>>          DDP_COMPONENT_DP_INTF1,
>> --
>> 2.18.0
>>
