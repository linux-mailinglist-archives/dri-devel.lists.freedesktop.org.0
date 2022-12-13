Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FD64B7E6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 15:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C7FB10E329;
	Tue, 13 Dec 2022 14:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9420010E329
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 14:54:58 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221213145456euoutp02269262de906b9e8f48dd4c03740b47d7~wYhNTIUX42394323943euoutp027
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 14:54:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221213145456euoutp02269262de906b9e8f48dd4c03740b47d7~wYhNTIUX42394323943euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670943296;
 bh=qTEBHPy25LcLGBWzoihORvs/owjyMvU2krKpYvSsoHs=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=aKQEY9TQ/suev3Dka7k2QC//6s6M5sNM+NkZMWiq62j/ZbLdutgr4gWP480wDxB/5
 50dlSX/lxisWZhPcPt+u47uMg+3jdZtArHZ9U18/Z8NTii4kwEV6fpPOgwcuxMep4z
 0KEYh18KcE4wNpIxoXdrV7Xxx6vmmENgJ+BMiMoI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221213145456eucas1p26ca91749da206e7838257d74ab17498e~wYhM-BC-w1530315303eucas1p26;
 Tue, 13 Dec 2022 14:54:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 42.09.09561.04298936; Tue, 13
 Dec 2022 14:54:56 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221213145456eucas1p2825478e4f743474bd05acd4d3a8f1cc6~wYhMk0Q5P1089910899eucas1p2E;
 Tue, 13 Dec 2022 14:54:56 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221213145456eusmtrp2a903e51e754f6a18eb96996e61df727f~wYhMj6BcF2146021460eusmtrp2P;
 Tue, 13 Dec 2022 14:54:56 +0000 (GMT)
X-AuditID: cbfec7f2-0b3ff70000002559-09-6398924008d5
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F2.BB.08916.F3298936; Tue, 13
 Dec 2022 14:54:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221213145454eusmtip1e9d556a60ca7cc4bb86a5883fde6dac0~wYhLUp6d81033110331eusmtip1I;
 Tue, 13 Dec 2022 14:54:54 +0000 (GMT)
Message-ID: <17f7772b-ca46-53b8-5bf9-98d3242fa703@samsung.com>
Date: Tue, 13 Dec 2022 15:54:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host
 for first DSI transfer
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZAqfhV4b69GthcEzBOgpYSJ0yziZcpFC2oGyySWOu-tkA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUxTVxjeuff2UmpKrtXJCX7guuDmJlXikp1MprjPK79wIbLsx1wpF5DS
 ii3FSWTiEhQKNBUr0g6BiaPIMsTaVEqROAZSx1oL2xgCrigE+bRpUQTMYG0vbvx73ud5n/O8
 78nLxQXlZAT3iDybUcjFmUKSR1juLDij48oqJLuaDJvQ0GA3jty1swSaGqwn0R/PPCQq/cHJ
 QWVuLYGemrQkGv+7h0COb6dDUNG5KyHIqG0jkWmkj4PUi1dxVHGvDUPTZ04D1P3oGo5+PV1A
 oF7dLyTyGR761fMTJOqx+3D0/IUDj9tA/+R1c+gqg52gdfYODu0seUDSVsODEPq7Qj2Hrm2d
 wOiOP2s59FBfK0m7i7sw+saVU/T1J80YrTE3AHrWtCUh7AtebAqTeSSHUezc+xUvfcR2DmRp
 4r9e8A1j+WDsPTUI5ULqHThjaOAEsICqB3C0Yb8a8Pz4KYCmVg1gi1kApwt0IS8d9wfMGCsY
 AXQuDBJs4QWw7sJE8C0+tRcu3fKSAUxQUdA4VoGx/Fp4Vz9KBPCrVAq8bXUE+XVUMnyiqw8m
 4FQ4HBitDvLrqbfhnH6KDATg1DMSVlvsICCQVAxUz6iDAaHUQfjYMr9ijoQ3ZyrxgAFSGh4c
 v6nB2Lk/grcX2ggWr4OTXeaVfTbBZWs1xhrOAljzwr1SaAHMfzwA2K49cMi56I/j+iO2w2st
 O1l6PxzWF+EBGlJhsH9mLTtEGCyzXFyh+bDwjIDt3gYNXY3/xf7s6sW1QGhY9S+GVfsbVq1j
 +D+3BhANIJxRKWVpjDJGzhwXKcUypUqeJpIclZmA/3S7l7p8zeDSpFfUDjAuaAeQiwvX86Pe
 LJcI+CniE7mM4uhhhSqTUbaDjVxCGM6v1xVKBFSaOJuRMkwWo3ipYtzQiHwswuZa837Llzs+
 FedZ+xMsVUt3kwlNUbhKcCuxNKc4+/DVkW09vw2OF0ROH0rQfKgQ5pVKy3Kj7WPDG3pLzJ0X
 dmd8lrHvbPGuEx93zY1sPjXVZDWn/3hDljGx3RO5ZrL0n+cHlj+xHsvxyIaTcxP33dNfNxpD
 TsZ5ts67mi/W2qJF+JAn3puX1BivPpl6KWZZfcxR5+o/P+D4fpzfKfqmKvZQp8TTWJxSo/v9
 gKv8Pl+a4ds6NyaCb0RNbVH9tTFqhzNV3OHwxW7OSvLqFitTba9I/QfJk5taSl532yqTmj8o
 ic28Y3YXLLY0He/j6SvnH717+SFvT6Ju7vPX6nZLlelCQpkujnkLVyjF/wJBkz6PKQQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsVy+t/xu7r2k2YkG/y/aGNx5/ZpZov7iz+z
 WLy+vYLN4srX92wWvUvPsVpMuj+BxeLLpglsFi/uXWSxONv0ht2ic+ISdovlE/axWWx6fI3V
 ouvXSmaLGef3MVm8aWtktDj9aD2zxanGVhaLS1MOs1l8mvUQKDv5JZvFxROfmC2+/z7L7CDm
 sfbjfVaPebNOsHhMOXGE1eNcz102j52z7rJ7zO6YyeqxeM9LJo8jVxezety5tofN4373cSaP
 zUvqPTa+28Hk0bdlFaPH501yAXxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZG
 pkr6djYpqTmZZalF+nYJehmPd09kLOjzqvj56QFTA+Mzqy5GTg4JAROJm7e2MHUxcnEICSxl
 lFh37DQzREJG4uS0BlYIW1jiz7UuNhBbSOA9o8SbI0UgNq+AncS/vR/B4iwCqhLLn81ggogL
 Spyc+YQFxBYVSJFo7/kHFhcWSJLYN2URWD2zgLjErSfzweIiAtoS32a+ZgM5glngO5vEzO9T
 WCAuWsYmcfXWNXaQKjYBQ4mutxBXcAoESjzf9oMdYpKZRNfWLkYIW15i+9s5zBMYhWYhOWQW
 koWzkLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmCS2Xbs5+YdjPNefdQ7xMjE
 wXiIUYKDWUmEV1VjWrIQb0piZVVqUX58UWlOavEhRlNgaExklhJNzgemubySeEMzA1NDEzNL
 A1NLM2MlcV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBqaeNY47uqIXGXx+fvBAgIxC+eTws37f
 lYqizTK99qjs3CNVIK5ZsIh3+3GlJe41+bpBFzdITE58lr/9vnLe4w+8k49YSq/f3jNpvsgK
 sX377vq9F/2kKrFo7lItm02vPpb4PJRLPrXwbBdTWcuMT+ys1/6JH7LcZFeVJDozcL/jqvRX
 jBWBz3VVN5p8YlZan+c2V0nWt+xsEPPdqlSdk38uRXwO6nsf/f5Kgs/hZRyJ/1cLKD1wlnxk
 kRZ0otq1+M4Lz8vFJ5ZLhRVcPxd3KzeXYab2joyZHDeP361IZXS79Xyv7TX+vg8fn4jvtlnz
 QqXypfyeszPe/d7aG7Hl45yuu2tnTLt2LKo6Y2FCf565EktxRqKhFnNRcSIAoxV/aLsDAAA=
X-CMS-MailID: 20221213145456eucas1p2825478e4f743474bd05acd4d3a8f1cc6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com>
 <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com>
 <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
 <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
 <395a4762-70fe-1caf-579f-2b5952232470@samsung.com>
 <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
 <c3f0c5c2-aae8-dc39-be02-dc4dfd0e7073@samsung.com>
 <3ce9def4-9fdf-0bde-fd2c-3a8755ebdf9d@samsung.com>
 <CAMty3ZAqfhV4b69GthcEzBOgpYSJ0yziZcpFC2oGyySWOu-tkA@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Neil Armstrong <narmstrong@linaro.org>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.12.2022 15:18, Jagan Teki wrote:
> On Tue, Dec 13, 2022 at 7:31 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 13.12.2022 13:20, Marek Szyprowski wrote:
>>> On 13.12.2022 11:40, Jagan Teki wrote:
>>>> On Tue, Dec 13, 2022 at 2:28 PM Marek Szyprowski
>>>> <m.szyprowski@samsung.com> wrote:
>>>>> On 12.12.2022 16:33, Jagan Teki wrote:
>>>>>
>>>>> On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>
>>>>> On 12.12.2022 09:43, Marek Szyprowski wrote:
>>>>>
>>>>> On 12.12.2022 09:32, Jagan Teki wrote:
>>>>>
>>>>> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>
>>>>> Hi Jagan,
>>>>>
>>>>> On 09.12.2022 16:23, Jagan Teki wrote:
>>>>>
>>>>> The existing drm panels and bridges in Exynos required host
>>>>> initialization during the first DSI command transfer even though
>>>>> the initialization was done before.
>>>>>
>>>>> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
>>>>> flag and triggers from host transfer.
>>>>>
>>>>> Do this exclusively for Exynos.
>>>>>
>>>>> Initial logic is derived from Marek Szyprowski changes.
>>>>>
>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>> ---
>>>>> Changes from v9:
>>>>> - derived from v8
>>>>> - added comments
>>>>>
>>>>>      drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
>>>>>      include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>>>      2 files changed, 17 insertions(+), 3 deletions(-)
>>>>>
>>>>> The following chunk is missing compared to v8:
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> index 6e9ad955ebd3..6a9403cb92ae 100644
>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
>>>>> *dsi, unsigned int flag)
>>>>>                     return 0;
>>>>>
>>>>>             samsung_dsim_reset(dsi);
>>>>> -       samsung_dsim_enable_irq(dsi);
>>>>> +
>>>>> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>>>> +               samsung_dsim_enable_irq(dsi);
>>>>>
>>>>> Is this really required? does it make sure that the IRQ does not
>>>>> enable twice?
>>>>>
>>>>> That's what that check does. Without the 'if (!(dsi->state &
>>>>> DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
>>>>> from pre_enable, then from the first transfer), what leads to a
>>>>> warning from irq core.
>>>>>
>>>>> I've just noticed that we also would need to clear the
>>>>> DSIM_STATE_REINITIALIZED flag in dsim_suspend.
>>>>>
>>>>> However I've found that a bit simpler patch would keep the current code
>>>>> flow for Exynos instead of this reinitialization hack. This can be
>>>>> applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host
>>>>> init in pre_enable" patch:
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> index 0b2e52585485..acc95c61ae45 100644
>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> @@ -1291,9 +1291,11 @@ static void
>>>>> samsung_dsim_atomic_pre_enable(struct
>>>>> drm_bridge *bridge,
>>>>>
>>>>>            dsi->state |= DSIM_STATE_ENABLED;
>>>>>
>>>>> -       ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>>>> -       if (ret)
>>>>> -               return;
>>>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>>>>> +               ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>>>> +               if (ret)
>>>>> +                       return;
>>>>> +       }
>>>>>
>>>>> Sorry, I don't understand this. Does it mean Exynos doesn't need to
>>>>> init host in pre_enable? If I remember correctly even though the host
>>>>> is initialized it has to reinitialize during the first transfer - This
>>>>> is what the Exynos requirement is. Please correct or explain here.
>>>>>
>>>>> This is a matter of enabling power regulator(s) in the right order
>>>>> and doing the host initialization in the right moment. It was never
>>>>> a matter of re-initialization. See the current code for the
>>>>> reference (it uses the same approach as my above change). I've
>>>>> already explained that here:
>>>>>
>>>>> https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/
>>>>>
>>>>>
>>>>> If you would like to see the exact proper moment of the dsi host
>>>>> initialization on the Exynos see the code here:
>>>>>
>>>>> https://protect2.fireeye.com/v1/url?k=5dc33900-0258001f-5dc2b24f-000babdfecba-f7c1a2a1905c83ca&q=1&e=f086bfdb-9055-48bd-b9c2-5dffb6c0d558&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv5.18-next-20220511-dsi-rework
>>>>> and patches adding mipi_dsi_host_init() to panel/bridge drivers.
>>>> As I said before, the downstream bridge needs an explicit call to host
>>>> init via mipi_dsi_host_init - this is indeed not a usual use-case
>>>> scenario. Let's handle this with a REINIT fix and see if we can update
>>>> this later to handle both scenarios.
>>>>
>>>> Would you please test this repo, I have included all.
>>>>
>>>> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>>> This doesn't work on TM2e board. Give me some time to find why...
>>>
>> The following change is missing in "drm: bridge: Generalize Exynos-DSI
>> driver into a Samsung DSIM bridge" patch:
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 1dbff2bee93f..81828b5ee0ac 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1745,6 +1745,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
>>           dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
>>           dsi->bridge.of_node = dev->of_node;
>>           dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>> +       dsi->bridge.pre_enable_prev_first = true;
> Can you check this and confirm, I keep this in exynos side.
> https://gitlab.com/openedev/kernel/-/commit/ccb02df7a313fdf91d8e116b0ec3d6c945fbb6fd#c93f0ce4d81b854fbde970e341fb307f1be78c16_1865_189

This one is fine!

>>           /* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts
>> HS/VS/DE */
>>           if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
>>
>>
>> After adding the above, all my test platform works fine.
>>
>> BTW, I still think that it is worth replacing the "drm: exynos: dsi: Add
>> host initialization in pre_enable" patch with the following simple
>> change and propagate it to bridge/samsung-dsim.c:
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> index fdaf514b39f2..071b74d60dcb 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> @@ -254,6 +254,9 @@ struct exynos_dsi_transfer {
>>    #define DSIM_STATE_CMD_LPM             BIT(2)
>>    #define DSIM_STATE_VIDOUT_AVAILABLE    BIT(3)
>>
>> +#define exynos_dsi_hw_is_exynos(hw) \
>> +       ((hw) >= DSIM_TYPE_EXYNOS3250 && (hw) <= DSIM_TYPE_EXYNOS5433)
>> +
>>    enum exynos_dsi_type {
>>           DSIM_TYPE_EXYNOS3250,
>>           DSIM_TYPE_EXYNOS4210,
>> @@ -1344,6 +1347,9 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
>>    {
>>           const struct exynos_dsi_driver_data *driver_data =
>> dsi->driver_data;
>>
>> +       if (dsi->state & DSIM_STATE_INITIALIZED)
>> +               return 0;
>> +
>>           exynos_dsi_reset(dsi);
>>           exynos_dsi_enable_irq(dsi);
>>
>> @@ -1356,6 +1362,8 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
>>           exynos_dsi_set_phy_ctrl(dsi);
>>           exynos_dsi_init_link(dsi);
>>
>> +       dsi->state |= DSIM_STATE_INITIALIZED;
>> +
>>           return 0;
>>    }
>>
>> @@ -1411,6 +1419,12 @@ static void exynos_dsi_atomic_pre_enable(struct
>> drm_bridge *bridge,
>>           }
>>
>>           dsi->state |= DSIM_STATE_ENABLED;
>> +
>> +       if (!exynos_dsi_hw_is_exynos(dsi->plat_data->hw_type)) {
>> +               ret = exynos_dsi_init(dsi);
>> +               if (ret)
>> +                       return;
>> +       }
>>    }
>>
>>    static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
>> @@ -1557,12 +1571,9 @@ static ssize_t exynos_dsi_host_transfer(struct
>> mipi_dsi_host *host,
>>           if (!(dsi->state & DSIM_STATE_ENABLED))
>>                   return -EINVAL;
>>
>> -       if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
>> -               ret = exynos_dsi_init(dsi);
>> -               if (ret)
>> -                       return ret;
>> -               dsi->state |= DSIM_STATE_INITIALIZED;
>> -       }
>> +       ret = exynos_dsi_init(dsi);
>> +       if (ret)
>> +               return ret;
> Below patch handling similar behavior by checking exynos hw_type at
> exynos_dsi_init, isn't it? Please check and let me know if I missing
> anything.
>
> https://gitlab.com/openedev/kernel/-/commit/d19d491eef92b92e12a26265697274ce666eddb5

You don't miss anything. Your version also works, but I just proposed a 
bit simpler code.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

