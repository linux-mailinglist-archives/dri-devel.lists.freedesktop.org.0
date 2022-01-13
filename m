Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5BA248DB64
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 17:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B352110E40C;
	Thu, 13 Jan 2022 16:10:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 542C510E40C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 16:10:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 q141-20020a1ca793000000b00347b48dfb53so4004333wme.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 08:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=SPmaJub/jt94ihGwagtrfHtir8UBrBvypTKNKojeyrA=;
 b=BVBB+Qut1wf0yDLs2pgabC7QOG2Sq+20jm8ssrux8M/cL6yIEQ1cLoONRsJ3tAFOB7
 mAVtexOZomadjCBu5HS3//ck38nB8thHf4Vsb7B2Gu4SmYo1PXrWLt2A/RhTYRAs6chT
 A2yuc9kt7p1baJ7py4FCWgs7rw24L85tVk/4W8LVfElgZ03rT963kaaa4VkbN1DiwUXJ
 qnZsvby+F23F9gT8jaP+rJib0mnv6iej7oPfza94pno6s+bMVe/moC6XsPcGH0KE1brn
 /SZzMZYnKFEdbiVSWGxvCwwKgWv2AzgqwSWAiyOixbcDRB9AlAXLXpExApLKl7EkW3Oy
 FPkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=SPmaJub/jt94ihGwagtrfHtir8UBrBvypTKNKojeyrA=;
 b=OYwBGTsk6dA8ipO3M6pZks0uGoknUAlre/dt4i2CzmnjlPB2znmMlGN3115y5aIZ3Q
 QzL3dQh/HT+PqSHrhFtgp1zfyWONKjksW0kKpUBvIVjbGbTOMGo0vZ/xxiDRDWQeW3Sk
 Iu0bSQHg1J/4a4SH4XZYWMxGambT53lf2rb2hbxzxybebuVAiXMu6kuLHd6XqTp+2AjB
 Dr8pSoITYjiYMUYu8gOQK5TEnyXaLjUxcHs9LwNiMeRIZk5FJOge4Ch3ya3fcFUxWHpl
 g1Ja7Gk0//GdBysB6Dvw48j/WmSHXuh5PXY2bMbuIly/nWl1TiZASzSnYjN7SHrSRP/4
 GhYg==
X-Gm-Message-State: AOAM533rSxAR727Jld32DComV46zRFYNANuXOpWSk1xJNSaJWUeLTKx6
 k4jR+SX/Z/nVQS8wGBIc0eo=
X-Google-Smtp-Source: ABdhPJz71D45GcRwagirhvSlyWM52OERaCgTDonsBE7CR9XIAMLCsE2GIYUK2N2X+W/NKuR3LQ9Flg==
X-Received: by 2002:a1c:7316:: with SMTP id d22mr11718665wmb.5.1642090219767; 
 Thu, 13 Jan 2022 08:10:19 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id f8sm9488614wmg.3.2022.01.13.08.10.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 08:10:19 -0800 (PST)
Message-ID: <e940d705-2057-4d5e-0a21-8464ca04caaf@gmail.com>
Date: Thu, 13 Jan 2022 17:10:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 12/15] media: mtk-vcodec: enc: Remove
 mtk_vcodec_release_enc_pm
Content-Language: en-US
To: Hans Verkuil <hverkuil@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, Mauro Carvalho Chehab <mchehab@kernel.org>
References: <20211112105509.12010-1-yong.wu@mediatek.com>
 <20211112105509.12010-13-yong.wu@mediatek.com>
 <68c3a573-8453-38e9-93b2-2067bedcd06f@collabora.com>
 <4bd9e849-96dd-6f1c-2841-979459366ee5@collabora.com>
 <fa9b2b73-c6bb-5737-93ac-ba2ab6b3b771@xs4all.nl>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <fa9b2b73-c6bb-5737-93ac-ba2ab6b3b771@xs4all.nl>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 devicetree@vger.kernel.org, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 anthony.huang@mediatek.com, youlin.pei@mediatek.com,
 Irui Wang <irui.wang@mediatek.com>, Evan Green <evgreen@chromium.org>,
 Eizan Miyamoto <eizan@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 mingyuan.ma@mediatek.com, linux-media@vger.kernel.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, libo.kang@mediatek.com,
 yi.kuo@mediatek.com, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, anan.sun@mediatek.com,
 acourbot@chromium.org, srv_heupstream@mediatek.com, yf.wang@mediatek.com,
 Tomasz Figa <tfiga@chromium.org>, iommu@lists.linux-foundation.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On 13/01/2022 11:15, Hans Verkuil wrote:
> On 13/01/2022 11:11, AngeloGioacchino Del Regno wrote:
>> Il 11/01/22 11:57, AngeloGioacchino Del Regno ha scritto:
>>> Il 12/11/21 11:55, Yong Wu ha scritto:
>>>> After this patchset, mtk_vcodec_release_enc_pm has only one line.
>>>> then remove that function, use pm_runtime_disable instead.
>>>>
>>>> meanwhile, mtk_vcodec_init_enc_pm only operate for the clocks,
>>>> rename it from the _pm to _clk.
>>>>
>>>> No functional change.
>>>>
>>>> CC: Tiffany Lin <tiffany.lin@mediatek.com>
>>>> CC: Irui Wang <irui.wang@mediatek.com>
>>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>
>>
>> Hello Yong,
>> the mtk-vcodec patches were merged in Yunfei's vcodec patch series and Hans has
>> scheduled that for v5.18.
>>
>> Can you please send a v10 and drop patches 10/15, 11/15, 12/15 (all of the
>> media: mtk-vcodec: *) from this series?
>>
>> For the records, I think that after sending v10 this series is ready to be merged,
>> as it was well reviewed and also tested on many MTK platforms.
> 
> Good to know. When I have the v10 I'll try to prioritize reviewing it and running
> my usual tests.
> 
> Yong, please make sure you run 'checkpatch.pl --strict' over the v10 patches and fix
> any issues (using common sense).
> 

Can you please take me in the look when you take the patches. I'll take the DTS 
related as soon as you queue up the others.

Thanks!
Matthias

> Regards,
> 
> 	Hans
> 
>>
>> Thank you,
>> - Angelo
> 
