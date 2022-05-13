Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877A3525C74
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 09:42:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4040110E789;
	Fri, 13 May 2022 07:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5294510E76C
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 07:42:39 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u3so10284177wrg.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 00:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=h4Eoh4lUanKYZL6m5WR756e9/uQNhRUTKgBep3AgcuQ=;
 b=OogmQrJbyJkdkJDDl0/KVR6lUqZEjYU6qz49Nd7B50AXo1s3Y3Ogp48dsrFTRT54lB
 Jvmh6yAJui5uS6wKlEoMFwli7jhmuAOaBwB2Osmu0J5OS76JN580XKcwsbjdzS1Q4AMq
 1Gv/m9z+3ogePGRnEelhXr6BD3XlyU7DjFRU7Mm2ZzIvky5mXWcZFIyglTEUHB7wZQNS
 gf8UZY+xlp2VmontV7mWk3qm/SnxQQmWmlKzbx8YEkO5a3/g65SY4cCIE3Spvz5VsSSp
 vy++TZhpgNaShJNffmWSgbtS6mFkEgGUoqXcWmQPfqCwUznvgpQMK7ZvlPTuVIZDbGGD
 e04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h4Eoh4lUanKYZL6m5WR756e9/uQNhRUTKgBep3AgcuQ=;
 b=LdKITpqYeIghE3wmGKbQtZGANA+e9br9CyD2SlXjV1MvczptqsT1lx041ZOVjfHfda
 1JV3PC2TJfJWZW639yqXFPye/RhBaJ1RZNGoun7bZkhKTc3y2H6uALDSIFHPf+qudLKo
 ruvuKURwvGwdHl8eqp12q3Oxdj/FAm9TVOdNO6kA5wopcvA0uCnju+0ViukRW0Z7tMFa
 zC28459Yls+AfwYbvsNcaSCIZdkb1yQIsoI9qRSwajaUYUEkgU7wBRA1fNXfZ1zZ/T4Q
 Cocxsmg+ROeJ9xKX1VhFbK9Qh2SiBDgWjm74b+CXOJlt2ICdG/bwoMAYS/65tp0ELp4I
 jCyg==
X-Gm-Message-State: AOAM533fXEKSk838eeCXQs3Ja819itg4BFYOrYUeyP+124B4qPM7BTNv
 LwiYm/FMb2OEdozaxqyWrPI=
X-Google-Smtp-Source: ABdhPJwwCL/Pxk8fkx+VxRZaxLIQFVPV/lfg/6rnAxvVEHihbxXjNAETy7pfrcZgSH4t7ZBGhpeDVQ==
X-Received: by 2002:a05:6000:18a4:b0:20c:5603:c0bf with SMTP id
 b4-20020a05600018a400b0020c5603c0bfmr2695184wri.145.1652427757703; 
 Fri, 13 May 2022 00:42:37 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 t1-20020adfa2c1000000b0020c5253d8d2sm1462382wra.30.2022.05.13.00.42.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 00:42:36 -0700 (PDT)
Message-ID: <623fb170-b59a-84a0-3826-4b78968924bc@gmail.com>
Date: Fri, 13 May 2022 09:42:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v20 8/8] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-9-jason-jh.lin@mediatek.com>
 <402f0e60-8d3c-850d-84ff-af5424b72b73@gmail.com>
 <CAAOTY_-jiX_BhaZ5+skRu4RSZLjcHJerVtwH34fz4N6_jbVK0w@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAAOTY_-jiX_BhaZ5+skRu4RSZLjcHJerVtwH34fz4N6_jbVK0w@mail.gmail.com>
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
Cc: DTML <devicetree@vger.kernel.org>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,

On 02/05/2022 00:54, Chun-Kuang Hu wrote:
> Hi, Matthias:
> 
> Matthias Brugger <matthias.bgg@gmail.com> 於 2022年4月22日 週五 下午8:42寫道：
>>
>>
>>
>> On 19/04/2022 11:41, jason-jh.lin wrote:
>>> After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
>>> mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
>>>
>>> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
>>
>> Chun-Kuang, I think it would make sense to take that through your tree as it
>> depends on the previous patches.
>>
>> I provide you a stable tag so that you can take it:
>> v5.18-next-vdso0-stable-tag
> 
> After I take this tag, I find one checkpatch warning:
> 
> WARNING: DT compatible string "mediatek,mt8195-mmsys" appears
> un-documented -- check ./Documentation/devicetree/bindings/
> #670: FILE: drivers/soc/mediatek/mtk-mmsys.c:390:
> +               .compatible = "mediatek,mt8195-mmsys",
> 
> I think this tag lost one binding patch, it's better that this tag has
> no this warning.
> 

Sorry for the late reply I was sick.
The warning is, because the stable branch misses commit:
https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.18-next/soc&id=81c5a41d10b968ea89d5f44fe1e5c2fc70289209

So it's not a real issue and will go away once our branches land in upstream.
Is it OK for you to ignore the issue?

Regards,
Matthias

> Regards,
> Chun-Kuang.
> 
>>
>> Regards,
>> Matthias
>>
>>> ---
>>>    include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
>>> index 59117d970daf..fb719fd1281c 100644
>>> --- a/include/linux/soc/mediatek/mtk-mmsys.h
>>> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
>>> @@ -16,8 +16,7 @@ enum mtk_ddp_comp_id {
>>>        DDP_COMPONENT_CCORR,
>>>        DDP_COMPONENT_COLOR0,
>>>        DDP_COMPONENT_COLOR1,
>>> -     DDP_COMPONENT_DITHER,
>>> -     DDP_COMPONENT_DITHER0 = DDP_COMPONENT_DITHER,
>>> +     DDP_COMPONENT_DITHER0,
>>>        DDP_COMPONENT_DITHER1,
>>>        DDP_COMPONENT_DP_INTF0,
>>>        DDP_COMPONENT_DP_INTF1,
