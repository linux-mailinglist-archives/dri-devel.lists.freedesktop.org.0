Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1171E54F8EB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 16:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B2BC10EF78;
	Fri, 17 Jun 2022 14:10:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1AB810EBD3
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 14:10:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q9so5923800wrd.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8EeHIO2f2uac1WGfWnHhOthQIjOqpWzUnb/yusYd5Eo=;
 b=fYJZ2xlJH+zGGG5d7j0jNT920bWUhQ/MSKihYcR6D0n+I/J6YBcyVwpkBY6Mut/aL7
 tRvdRoptP8aK6h5v0BBaqlL7/El87mRXZkyCPD8egLw/xjz91ek3hylRn7iS64Pj/JXT
 9ufuuPZc5aKsjzdYfeAi54ITPeAyvrRPs06EHkntrmN90OP6JF44PpHz4TDJaLSf/G1s
 mgV4XBTQPmtIk/RYXM/qfxMmJyhkXuyXcT3rfL+EWvb0VPgdv83/UTSv6F+NcvLkJlh/
 lvwNYKaBFGalg6kfoTALdZ8JfSnDsBfCvSfka/NewJUh6qF3/GGJNo6Alw7c/2Qlybai
 Yp6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8EeHIO2f2uac1WGfWnHhOthQIjOqpWzUnb/yusYd5Eo=;
 b=Wj7wuJpTFhy5JB2OT9ynXEP1CIx5HZBqEUp8i7+o0/L7Z17dxAvzSpmVjCOW4Pbtij
 k3ADLYS/Knfm+xwenrZw60MCoOzyHMtdGRfw6TuJwpf5ZHMSjFn/NDhVdkCRPFyq7lz6
 MOxdmrn9kgSHdTgiUKO3YW2gwjjAYY+odqJU3aAA9080OzXAWv5e3TUOKugpt/ubKaq/
 mTRa7OSLy+bMILdKyur9aJ/tjdqX9nFmSEyVjM9+X5LVKk947iwCv9UKPN82sfUM38jI
 bEiacowaw7kDpUxNHIViIVjPCMc8m0dLT+UDCksHeidCD5mqYA85cRS+yygTcXErJaTM
 vsuQ==
X-Gm-Message-State: AJIora/Pn78nwTAhrPdgLCUXrvYKa3r0JfVEgOL3HdFAwFfBlYMHmJ5b
 5G9NoQV8O4dmz1umCc1j/Uw=
X-Google-Smtp-Source: AGRyM1tzF8x7/l1zBh6ZS19NjX7FANIe3zlmc83iNe5NxLwfOharnCi3Rxj8l7qi3TipgKZXD6WIAQ==
X-Received: by 2002:a05:6000:242:b0:210:354e:c89a with SMTP id
 m2-20020a056000024200b00210354ec89amr9715076wrz.136.1655475022140; 
 Fri, 17 Jun 2022 07:10:22 -0700 (PDT)
Received: from [192.168.0.24] (80.174.78.229.dyn.user.ono.com. [80.174.78.229])
 by smtp.gmail.com with ESMTPSA id
 r66-20020a1c2b45000000b0039c97cc82fbsm9226685wmr.15.2022.06.17.07.10.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jun 2022 07:10:21 -0700 (PDT)
Message-ID: <c3286fc9-06ed-d1e1-a731-94cdefdf7fab@gmail.com>
Date: Fri, 17 Jun 2022 16:10:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/2] arm64: dts: mt8183: Add panel rotation
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20220530113033.124072-1-hsinyi@chromium.org>
 <20220530113033.124072-2-hsinyi@chromium.org>
 <CAJMQK-jw+sgunEwgEQAw-V8DAbybZ7WVnZJ6vwOdzQ+-SX_bQg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CAJMQK-jw+sgunEwgEQAw-V8DAbybZ7WVnZJ6vwOdzQ+-SX_bQg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hsin-Yi Wang,

On 06/06/2022 17:29, Hsin-Yi Wang wrote:
> On Mon, May 30, 2022 at 7:30 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>>
>> krane, kakadu, and kodama boards have a default panel rotation.
>>
>> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
>> Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
>> ---
> 
> Hi Matthias,
> 
> The series ("Add a panel API to return panel orientation") might land
> in drm-misc. With this series applied, we can add this patch to give
> the correct default orientation for mt8183 kukui devices.
> I didn't send this patch again with the series, since they might land
> in different trees.
> 

I had a look on Linux next (next-20220617) and wasn't able to find the mtk_dsi.c 
changes. What is the status of this?

Regards,
Matthias

> Thanks.
> 
>>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> index 8d5bf73a9099..f0dd5a06629d 100644
>> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
>> @@ -276,6 +276,7 @@ panel: panel@0 {
>>                  avee-supply = <&ppvarp_lcd>;
>>                  pp1800-supply = <&pp1800_lcd>;
>>                  backlight = <&backlight_lcd0>;
>> +               rotation = <270>;
>>                  port {
>>                          panel_in: endpoint {
>>                                  remote-endpoint = <&dsi_out>;
>> --
>> 2.36.1.124.g0e6072fb45-goog
>>
