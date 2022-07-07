Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB49C56A631
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 16:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1EC18ABFE;
	Thu,  7 Jul 2022 14:53:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4555D18ABF8
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 14:53:26 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id l24so17044066ion.13
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 07:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=7RZhPlwt1IWmYSR6QIVRvM1HZdmbksMxnLZ6G0dxCYQ=;
 b=dbVWNRlsTl7pk7ptifukmXY/Z4krWR8gWS1OPftdqSoHwDjWWnGVMVy30wrrJmPKKM
 m0ZjLpTxKOMe2z/X6TWznoYb3kbkXITLAxeWjACt51IJ9WoapHp2v1xGaRa9UDPSfk7X
 GpEOzxaenVdYrb//0k6tqNyS2ahPCcwz9r6jjuTurfbgqiOUgMcHkoLGNCx80BPAwRkb
 cqxPGv08JM1nzHaSW8paawSNd7Zk81EwVEk0stflMy7AX3tTrPs4FAgk+NK+wQg+euEt
 BYzYXF1shibZRX60BLl6dzud3s0hIauMRUtUgOp2j6JbGhDl4wOG53FHmw1ki6dzr9De
 07dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=7RZhPlwt1IWmYSR6QIVRvM1HZdmbksMxnLZ6G0dxCYQ=;
 b=a3DFdFIAdGv+Mp2uujCX020puarTEToenEkL9R8sD8ld7WA2sXYFsriz5jtctfSUhb
 CGgGqtkvbxUHZDI2ljNswDh6HaCXkTWiz/yIKK73Ti6j1h8IP9JAzW+gp/CczPTIrLSB
 OnM3wNlU3egU4wpq6n2eL4E4Y2tQ09gGOi2db52muUd+z6gSXi3kDQBwgY6f3BR5FgQ9
 hMfuYInkYrVEI1Wr+mJGwXAlUz5EKCmdSw8XwKMEFNSZQFEB8aaWo93bG00x8z0mcWex
 6DvIIIf4O7gf4+GM9J0X0b2+hA4TuqJKOjnBsXHMG5DzWbcrTnyz22ahstR2eALRkcPV
 xx0A==
X-Gm-Message-State: AJIora89lSO0j3ZbJkM/BObkvtjj3m4c1p51xBwuS0NoX2aDPkBpC7/F
 9JEagZisNh3+1Ubly8zjnKc=
X-Google-Smtp-Source: AGRyM1trLe7RvY+9Rq0/Nq/y6Bbr3vIvsEr0rsX6bbBeVsNbTLy47V5SXuWGN+FGfuJ/2U+3fJpyLw==
X-Received: by 2002:a05:6602:154b:b0:675:8bce:8a5 with SMTP id
 h11-20020a056602154b00b006758bce08a5mr24784705iow.108.1657205605448; 
 Thu, 07 Jul 2022 07:53:25 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 w1-20020a5ed601000000b00675305c58bdsm14794205iom.18.2022.07.07.07.53.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 07:53:24 -0700 (PDT)
Message-ID: <15fe441c-205e-2953-44b4-d3c377cba7b1@gmail.com>
Date: Thu, 7 Jul 2022 16:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: Add panel rotation
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>
References: <20220530113033.124072-1-hsinyi@chromium.org>
 <20220530113033.124072-2-hsinyi@chromium.org>
 <CAJMQK-jw+sgunEwgEQAw-V8DAbybZ7WVnZJ6vwOdzQ+-SX_bQg@mail.gmail.com>
 <c3286fc9-06ed-d1e1-a731-94cdefdf7fab@gmail.com>
 <CAJMQK-gJ4AoNQtLeKoOO=GLLtjDRhCdVnYuPJSBD4ZnFWJ5qrw@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAJMQK-gJ4AoNQtLeKoOO=GLLtjDRhCdVnYuPJSBD4ZnFWJ5qrw@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17/06/2022 16:25, Hsin-Yi Wang wrote:
> On Fri, Jun 17, 2022 at 10:10 PM Matthias Brugger
> <matthias.bgg@gmail.com> wrote:
>>
>> Hi Hsin-Yi Wang,
>>
>> On 06/06/2022 17:29, Hsin-Yi Wang wrote:
>>> On Mon, May 30, 2022 at 7:30 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>>>
>>>> krane, kakadu, and kodama boards have a default panel rotation.
>>>>
>>>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>>>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>>>> ---
>>>
>>> Hi Matthias,
>>>
>>> The series ("Add a panel API to return panel orientation") might land
>>> in drm-misc. With this series applied, we can add this patch to give
>>> the correct default orientation for mt8183 kukui devices.
>>> I didn't send this patch again with the series, since they might land
>>> in different trees.
>>>
>>
>> I had a look on Linux next (next-20220617) and wasn't able to find the mtk_dsi.c
>> changes. What is the status of this?
>>
> The mtk_dsi change got dropped. The latest is this series:
> https://lore.kernel.org/lkml/20220609072722.3488207-1-hsinyi@chromium.org/,
> still waiting to be picked or others' comments.
> 

I saw this got merged, so merging this patch now.

Thanks!

> If the dts patch is picked without the drm series, there will be a
> WARN, but won't affect boot or display up.
> 
> 
>> Regards,
>> Matthias
>>
>>> Thanks.
>>>
>>>>    arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>>> index 8d5bf73a9099..f0dd5a06629d 100644
>>>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>>>> @@ -276,6 +276,7 @@ panel: panel@0 {
>>>>                   avee-supply = <&ppvarp_lcd>;
>>>>                   pp1800-supply = <&pp1800_lcd>;
>>>>                   backlight = <&backlight_lcd0>;
>>>> +               rotation = <270>;
>>>>                   port {
>>>>                           panel_in: endpoint {
>>>>                                   remote-endpoint = <&dsi_out>;
>>>> --
>>>> 2.36.1.124.g0e6072fb45-goog
>>>>
