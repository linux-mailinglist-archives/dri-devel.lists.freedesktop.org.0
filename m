Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA7D529F6C
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 12:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7E8113162;
	Tue, 17 May 2022 10:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F257A11320F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 10:29:41 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 bd25-20020a05600c1f1900b0039485220e16so1082384wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 03:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=T5Y1b6MSTSDc62ZZyWayGESS/DrDYqtlxsbdBnKwLdA=;
 b=VYKzS2kN0FFAnX4lzjuqVDsdNLyYCFES8rKBC/KPUC10SmAUCTYRjrYHOHoe2vJcm8
 sdqBCD17ys08EY/HTqVXZLqMkOyOOZtAjHd/hKG5s/sNRz0J5kGvWGalPCK2vzX1c/A3
 DfP9N7ZpIsOWXofYldFzgQXCXlPrDhPSxOGHcdkLWMKhVkTeFIYq1bOiL5hwl6e42PuN
 UWZMShCJQyI1kgQxVuXBVY1cCNuV3sfpiIraCzqfkgVnPhpMJWdm4PKL9N24GtOfNXXW
 WJCjrCG1YbH4stgQhDmDa6kxrCM/6EhF7eM5fN4uVnltsWkQz4pEpOIFFM2SHMvCwgcB
 Y6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=T5Y1b6MSTSDc62ZZyWayGESS/DrDYqtlxsbdBnKwLdA=;
 b=BQCF3O0N62smYdrSSkeRQYQljdtCUbAe25Y5owlxgkB4i0pRcyPKFkVHBBmD67J+TY
 /xAlUVe02s2WKSIipCpD8K/35p9kPuWirbEZS3Rg3dxd2u6IbsF/5VDw8rwLkqdmLF0B
 A/V7T0EcyWbNQDNwr9OLG57PyBAQOIdBUWTTn+jVzi9EWLYMeLk45KlKHoPApNolRiXY
 sjmd3J6Rc0ZMS58sllGDYjT5RcoYizm28fZlhinxMOx2C1i1MSthm9lCJ/3iG5TnIsW5
 f0OlqseANAf2y2yvdLl9jJlDKHc6K3pvCZSD/qQKhGDgcJZNvFu8D+d8nj6mU88+fFE1
 wXxw==
X-Gm-Message-State: AOAM532ftwXKsTiQOpXgakmJRqFmlrAFScnaDHTbmVJasIKqogtUSiFF
 jsJFOlZXcijnM4ex4A5QSfY=
X-Google-Smtp-Source: ABdhPJzfBnWPJiwfC93HpWH7vV0YVhtEQkrGLNuwAocWmFPYATQgc990iZt3LWEWWO4aApv9rLO3pw==
X-Received: by 2002:a05:600c:154d:b0:394:8d64:9166 with SMTP id
 f13-20020a05600c154d00b003948d649166mr21054212wmg.102.1652783380402; 
 Tue, 17 May 2022 03:29:40 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 v8-20020adfa1c8000000b0020d050461c9sm7968570wrv.54.2022.05.17.03.29.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 May 2022 03:29:39 -0700 (PDT)
Message-ID: <5965f488-714d-0456-50e0-bef79dc5ad0c@gmail.com>
Date: Tue, 17 May 2022 12:29:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220419094143.9561-1-jason-jh.lin@mediatek.com>
 <20220419094143.9561-9-jason-jh.lin@mediatek.com>
 <402f0e60-8d3c-850d-84ff-af5424b72b73@gmail.com>
 <CAAOTY_-jiX_BhaZ5+skRu4RSZLjcHJerVtwH34fz4N6_jbVK0w@mail.gmail.com>
 <623fb170-b59a-84a0-3826-4b78968924bc@gmail.com>
 <CAAOTY_9gReO45qVhd5-9UrDYsDkOeS+FZT2Dw2McVgZvK3jfeg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v20 8/8] soc: mediatek: remove DDP_DOMPONENT_DITHER from
 enum
In-Reply-To: <CAAOTY_9gReO45qVhd5-9UrDYsDkOeS+FZT2Dw2McVgZvK3jfeg@mail.gmail.com>
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



On 15/05/2022 00:45, Chun-Kuang Hu wrote:
> Hi, Matthias:
> 
> Matthias Brugger <matthias.bgg@gmail.com> 於 2022年5月13日 週五 下午3:42寫道：
>>
>> Hi Chun-Kuang,
>>
>> On 02/05/2022 00:54, Chun-Kuang Hu wrote:
>>> Hi, Matthias:
>>>
>>> Matthias Brugger <matthias.bgg@gmail.com> 於 2022年4月22日 週五 下午8:42寫道：
>>>>
>>>>
>>>>
>>>> On 19/04/2022 11:41, jason-jh.lin wrote:
>>>>> After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
>>>>> mmsys header can remove the useless DDP_COMPONENT_DITHER enum.
>>>>>
>>>>> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
>>>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>>
>>>> Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
>>>>
>>>> Chun-Kuang, I think it would make sense to take that through your tree as it
>>>> depends on the previous patches.
>>>>
>>>> I provide you a stable tag so that you can take it:
>>>> v5.18-next-vdso0-stable-tag
>>>
>>> After I take this tag, I find one checkpatch warning:
>>>
>>> WARNING: DT compatible string "mediatek,mt8195-mmsys" appears
>>> un-documented -- check ./Documentation/devicetree/bindings/
>>> #670: FILE: drivers/soc/mediatek/mtk-mmsys.c:390:
>>> +               .compatible = "mediatek,mt8195-mmsys",
>>>
>>> I think this tag lost one binding patch, it's better that this tag has
>>> no this warning.
>>>
>>
>> Sorry for the late reply I was sick.
>> The warning is, because the stable branch misses commit:
>> https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?h=v5.18-next/soc&id=81c5a41d10b968ea89d5f44fe1e5c2fc70289209
>>
>> So it's not a real issue and will go away once our branches land in upstream.
>> Is it OK for you to ignore the issue?
> 
> It's OK for me, but the patch would go through different maintainer's
> tree and I'm not sure it's OK for all of them. So I would wait for the
> necessary patch land in upstream.
> 

Ok makes sense. Sorry for the bad coordination from my side on this.

Regards,
Matthias

> Regards,
> Chun-Kuang.
> 
>>
>> Regards,
>> Matthias
>>
>>> Regards,
>>> Chun-Kuang.
>>>
>>>>
>>>> Regards,
>>>> Matthias
>>>>
>>>>> ---
>>>>>     include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
>>>>>     1 file changed, 1 insertion(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
>>>>> index 59117d970daf..fb719fd1281c 100644
>>>>> --- a/include/linux/soc/mediatek/mtk-mmsys.h
>>>>> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
>>>>> @@ -16,8 +16,7 @@ enum mtk_ddp_comp_id {
>>>>>         DDP_COMPONENT_CCORR,
>>>>>         DDP_COMPONENT_COLOR0,
>>>>>         DDP_COMPONENT_COLOR1,
>>>>> -     DDP_COMPONENT_DITHER,
>>>>> -     DDP_COMPONENT_DITHER0 = DDP_COMPONENT_DITHER,
>>>>> +     DDP_COMPONENT_DITHER0,
>>>>>         DDP_COMPONENT_DITHER1,
>>>>>         DDP_COMPONENT_DP_INTF0,
>>>>>         DDP_COMPONENT_DP_INTF1,
