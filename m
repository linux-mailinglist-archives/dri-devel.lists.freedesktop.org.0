Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD45476F175
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 20:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF35A10E644;
	Thu,  3 Aug 2023 18:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB7110E644
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 18:10:13 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id C4A3E86839;
 Thu,  3 Aug 2023 20:10:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1691086211;
 bh=fpuHp8OO6h5mevOgIeHsP5FLeL9qrPSYZmeq+L8xvLk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=EF1Sp2Z46iR/82qNBP9O0RKnEctp3wFsIYKTiMoZeGS7DoLm8WQRqjiYL3YnnZ7t5
 pI9yEQap9hzBdXcoM3IQXyJhuEt9F9l9Y/6mzmmI1FQG9OdHE0YBGUJbDLoYfKbuJ3
 d9g24kE5vjJSRvN/hNBY9mpRmM3oX7cn/5rvNT3TvN5raEgyA63GoDJtpwjNVc2wYJ
 dvW3IxwagPu0NZ1F1WXc/n66UM7N6oP/1P6v1k0dg7AggfPcRekwXr2O+BbiRNQdWV
 80TLtTw0fpBuijkV1cx+O60LKIO5QPA5oCHH9z/3+xv6T5jw2p6G7zsmRmOqX8p6sB
 H/CihvJUVzR5w==
Message-ID: <25f3026f-3d97-a5ac-862a-da6dc5f8d830@denx.de>
Date: Thu, 3 Aug 2023 20:10:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
 <5cf0e3fa-f66d-06c4-cfda-c48efd8c6508@linaro.org>
 <bf95af44-2510-1835-dec9-183144de8413@denx.de>
 <CAA8EJppp_ZJr-DcoZGd1GZmWuo=AECNS+X9zx0dNB4Edn8M2zg@mail.gmail.com>
 <CAF6AEGsfbUMCS4QTfqoyYetqea_ov-AET-iM54B-HvYpwwZvmg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAF6AEGsfbUMCS4QTfqoyYetqea_ov-AET-iM54B-HvYpwwZvmg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Amit Pundir <amit.pundir@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/23 20:49, Rob Clark wrote:
> On Wed, Aug 2, 2023 at 11:16 AM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
>>
>> On Wed, 2 Aug 2023 at 20:34, Marek Vasut <marex@denx.de> wrote:
>>>
>>> On 8/2/23 15:38, Dmitry Baryshkov wrote:
>>>> On 02/08/2023 11:52, Neil Armstrong wrote:
>>>>> This reverts commit [1] to fix display regression on the Dragonboard 845c
>>>>> (SDM845) devboard.
>>>>>
>>>>> There's a mismatch on the real action of the following flags:
>>>>> - MIPI_DSI_MODE_VIDEO_NO_HSA
>>>>> - MIPI_DSI_MODE_VIDEO_NO_HFP
>>>>> - MIPI_DSI_MODE_VIDEO_NO_HBP
>>>>> which leads to a non-working display on qcom platforms.
>>>>>
>>>>> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
>>>>> EOT packet")
>>>>>
>>>>> Cc: Marek Vasut <marex@denx.de>
>>>>> Cc: Robert Foss <rfoss@kernel.org>
>>>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>>>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA
>>>>> and EOT packet")
>>>>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
>>>>> Link:
>>>>> https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>>    drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
>>>>>    1 file changed, 1 insertion(+), 3 deletions(-)
>>>>>
>>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #fix db845c
>>>>
>>>> The boards broken by [1] are used in production by different parties
>>>> since 5.10, breaking them doesn't seem more acceptable than breaking the
>>>> new out-of-tree iMX8m hardware.
>>>
>>> The MX8M is also in-tree, so this does not apply.
>>
>> v6.5-rc4:
>>
>> $ git grep lontium,lt9611 | grep -v 9611uxc
>> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:$id:
>> http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
>> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
>>      - lontium,lt9611
>> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
>>        compatible = "lontium,lt9611";
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dts: compatible = "lontium,lt9611";
>> drivers/gpu/drm/bridge/lontium-lt9611.c: { "lontium,lt9611", 0 },
>> drivers/gpu/drm/bridge/lontium-lt9611.c: { .compatible = "lontium,lt9611" },
>>
>> next-20230802:
>>
>> $ git grep lontium,lt9611 | grep -v 9611uxc
>> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:$id:
>> http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
>> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
>>      - lontium,lt9611
>> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
>>        compatible = "lontium,lt9611";
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dts: compatible = "lontium,lt9611";
>> drivers/gpu/drm/bridge/lontium-lt9611.c: { "lontium,lt9611", 0 },
>> drivers/gpu/drm/bridge/lontium-lt9611.c: { .compatible = "lontium,lt9611" },
>>
>> Your device is not in the tree. Your commit broke existing users.
>>
>> Can we please end the argument, land the fix (this revert) for 6.5 and
>> work on the solution for 6.6 or 6.7?
>>
> 
> Even if they were in-tree, breaking existing hw means revert and
> try-again.  Especially as we get into later -rc's

Then just apply the revert, I don't have time to debug this right this 
moment, and it is anyway meaningless until I can look at the bus with 
DSI bus analyzer.
