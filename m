Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D471976D70C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 20:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2765B10E224;
	Wed,  2 Aug 2023 18:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F4310E217
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 18:45:25 +0000 (UTC)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id CAD41868BC;
 Wed,  2 Aug 2023 20:45:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1691001923;
 bh=HkVsvctANfjqtRCNkMupEsziCBW5UjbjHe7T2eo0Uag=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=WcktwjYhIDrk+RAb0/adNBVtIPfJ93HpDGKHxWcyqyGHOeEgIDCpGZxiLbqEKu82P
 U4rRrIq5V63WOH8SHETWlFSvj3KPMZ1hccdP16Lv4JEEesc0LxIu0yZ7twcQbZM1/a
 e/TK/JSEVSR+0bQkfRzJO7jON0LnzLBcPeD9Z+2Epr6yAgSWwI5ykeS90J/GgJ+LXF
 CrO6fOKaIfeeuHRDwCN6U0HonjP/DjqDjnyNYrWvHFvde/yLl4j50yv5PTtzDPhRCU
 dSDe+KXWdRAEQtcI1PnJi55I1oGBqc8PZQjc2j1XrtmbhLr/uQaWGAwEbMJQOQRS5M
 L0WonwG52DIww==
Message-ID: <c5597c50-d41c-9f7e-fb85-4e4a1bc29f15@denx.de>
Date: Wed, 2 Aug 2023 20:45:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] Revert "drm/bridge: lt9611: Do not generate HFP/HBP/HSA
 and EOT packet"
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230802-revert-do-not-generate-hfp-hbp-hsa-eot-packet-v1-1-f8a20084e15a@linaro.org>
 <5cf0e3fa-f66d-06c4-cfda-c48efd8c6508@linaro.org>
 <bf95af44-2510-1835-dec9-183144de8413@denx.de>
 <CAA8EJppp_ZJr-DcoZGd1GZmWuo=AECNS+X9zx0dNB4Edn8M2zg@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
In-Reply-To: <CAA8EJppp_ZJr-DcoZGd1GZmWuo=AECNS+X9zx0dNB4Edn8M2zg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/2/23 20:16, Dmitry Baryshkov wrote:
> On Wed, 2 Aug 2023 at 20:34, Marek Vasut <marex@denx.de> wrote:
>>
>> On 8/2/23 15:38, Dmitry Baryshkov wrote:
>>> On 02/08/2023 11:52, Neil Armstrong wrote:
>>>> This reverts commit [1] to fix display regression on the Dragonboard 845c
>>>> (SDM845) devboard.
>>>>
>>>> There's a mismatch on the real action of the following flags:
>>>> - MIPI_DSI_MODE_VIDEO_NO_HSA
>>>> - MIPI_DSI_MODE_VIDEO_NO_HFP
>>>> - MIPI_DSI_MODE_VIDEO_NO_HBP
>>>> which leads to a non-working display on qcom platforms.
>>>>
>>>> [1] 8ddce13ae696 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA and
>>>> EOT packet")
>>>>
>>>> Cc: Marek Vasut <marex@denx.de>
>>>> Cc: Robert Foss <rfoss@kernel.org>
>>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
>>>> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Fixes: 8ddce13ae69 ("drm/bridge: lt9611: Do not generate HFP/HBP/HSA
>>>> and EOT packet")
>>>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
>>>> Link:
>>>> https://lore.kernel.org/r/CAMi1Hd0TD=2z_=bcDrht3H_wiLvAFcv8Z-U_r_KUOoeMc6UMjw@mail.gmail.com/
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    drivers/gpu/drm/bridge/lontium-lt9611.c | 4 +---
>>>>    1 file changed, 1 insertion(+), 3 deletions(-)
>>>>
>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> #fix db845c
>>>
>>> The boards broken by [1] are used in production by different parties
>>> since 5.10, breaking them doesn't seem more acceptable than breaking the
>>> new out-of-tree iMX8m hardware.
>>
>> The MX8M is also in-tree, so this does not apply.
> 
> v6.5-rc4:
> 
> $ git grep lontium,lt9611 | grep -v 9611uxc
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:$id:
> http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
>      - lontium,lt9611
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
>        compatible = "lontium,lt9611";
> arch/arm64/boot/dts/qcom/sdm845-db845c.dts: compatible = "lontium,lt9611";
> drivers/gpu/drm/bridge/lontium-lt9611.c: { "lontium,lt9611", 0 },
> drivers/gpu/drm/bridge/lontium-lt9611.c: { .compatible = "lontium,lt9611" },
> 
> next-20230802:
> 
> $ git grep lontium,lt9611 | grep -v 9611uxc
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:$id:
> http://devicetree.org/schemas/display/bridge/lontium,lt9611.yaml#
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
>      - lontium,lt9611
> Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml:
>        compatible = "lontium,lt9611";
> arch/arm64/boot/dts/qcom/sdm845-db845c.dts: compatible = "lontium,lt9611";
> drivers/gpu/drm/bridge/lontium-lt9611.c: { "lontium,lt9611", 0 },
> drivers/gpu/drm/bridge/lontium-lt9611.c: { .compatible = "lontium,lt9611" },
> 
> Your device is not in the tree. Your commit broke existing users.

These devices are in tree:
arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts

The LT9211 and LT9611 are both expansion modules handled by DTOs and 
bound to the DSIM (which is also in tree).

> Can we please end the argument, land the fix (this revert) for 6.5 and
> work on the solution for 6.6 or 6.7?

I would much prefer a solution which does not break my existing use 
case. It is still not even clear whether the problem really is on MX8M 
side at all, or whether it is QCOM misinterpreting flags. I cannot debug 
the later, since I have no access to that platform, nor its documentation.
