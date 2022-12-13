Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0B364B8BB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 16:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD39010E1CA;
	Tue, 13 Dec 2022 15:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22AC410E335
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 15:41:33 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221213154131euoutp028b9da181402672803e50a71cfee4cbb2~wZJ4Ch3Pu1182711827euoutp02O
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 15:41:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221213154131euoutp028b9da181402672803e50a71cfee4cbb2~wZJ4Ch3Pu1182711827euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670946091;
 bh=eLbpZHdney9sNunRymWHxaEagfYywSquInFdYeOCkCc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=TbWoomnIQyCvhV7GZaJgxClJh0wOjLrwWOzw9G1Dk5WzoUetQfk07q1fFimsQyDh/
 UQg7uqbI5JrYQqnlbk/w5rG6rPbxjDzbYdCXNevG4X8ZCMGScKusT1RP8R1diqkEVP
 EzXkU6ue/zLFnlkoCg2cRoIPUQOmX9eLbwTNGlVc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20221213154131eucas1p2a5c88614be5c09321940d3c3aba29489~wZJ3p8TVP2997529975eucas1p2w;
 Tue, 13 Dec 2022 15:41:31 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id F1.6B.09549.A2D98936; Tue, 13
 Dec 2022 15:41:31 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221213154130eucas1p1bf3ee6721c7e32dfd6968df00449bb69~wZJ209xwV3260332603eucas1p11;
 Tue, 13 Dec 2022 15:41:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221213154130eusmtrp181c58c57b0091afba4eacb9d8a675ce3~wZJ2yE4Et1196911969eusmtrp1f;
 Tue, 13 Dec 2022 15:41:30 +0000 (GMT)
X-AuditID: cbfec7f5-f47ff7000000254d-12-63989d2af103
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D3.21.09026.92D98936; Tue, 13
 Dec 2022 15:41:30 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221213154128eusmtip14fd333f909a09be44fde8fb6da08ef7c~wZJ1m-cOh1009310093eusmtip12;
 Tue, 13 Dec 2022 15:41:28 +0000 (GMT)
Content-Type: multipart/mixed; boundary="------------xkE7tGeeEnIRkp4ce2pKM0Nu"
Message-ID: <7e0ba9fb-387d-6bf7-585e-9fc79de31bd8@samsung.com>
Date: Tue, 13 Dec 2022 16:41:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host
 for first DSI transfer
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZC0Ca5yt4jFHi0KtcEszzRs1KrUTF2SqYizMF+1NYPAUQ@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02Se0xbVRzHOffe3hYM9a7M9QQQHYrZYIAMMce4LC7T5cbEwLaM6KKRWi4P
 B6Vph3M1KhPLW94KdDgIsLUbItJtSHXD0RXK2rUMHMscsApCFMZjUFiR8rDlguG/z+/7Pd/z
 O/nm8HDBXdKXlyw5ycgkopRA0oto7fq3JzTk+0rxy3UlGBocMOPIVm8n0KMBDYnuLsyQ6Jvz
 Vg4qtRUTaF5bTKJ/HvYSyPLVJBflljRwkbq4nUTav+5xUN7SRRxV9rRjaDLrDEDmkWYcmc4o
 CdRXfpNEc6phl1s2TqLe7jkcOZwW/I0ddNOsjUOfU3UTdHm3gUNbC4ZIWqca4tJnc6o4dP21
 cYw29Ndz6MF710jalm/E6MsNX9It020YXXjlEqDt2oAY/nGvffFMSvInjCx8f5xX0reFBlw6
 rvi0OauAyAAVyXnAkwepV6A5y4jlAS+egNIAeP3XuY1hHsDfq5sIdrADWGrX4psRk/MChzXU
 AFYvGoDbEFCzAF6ueNbNOBUDDY4Fjpu9qf2wK3+ecDNBBcEW5cyGvg3eqhpd15+h4uENnQVz
 sw/1EZwu13DZe4TwwWjNur6dCoFPqh6R7sU4tUDCmtbu9cUkFQHzpvJIN3tSh+H52lrgPgSp
 W15QWWQC7LPfhL0zSyTLPnDCeIXLsj80lxUQbCAbwFqnDWOHYgAz/n6wkX4dDlo30wfgn1W5
 rjJ4LubD+1Pb2KfyYWlrxYbsDXOyBOzpl6DK+OP/uzru9G3USMOJyU6iGOxUbSlMtaUY1ZYC
 WH4O/jxVjatcG3BqN2z+JZyV5VA3mE2q1nvJADCzf4xkjZ2wPH+YWwt4l4CQSZenJjLySAlz
 KkwuSpWnSxLDxGmpWuD67OZV40Ib0EzMhukBxgN68KIrPPJT4x3gS0jSJEzgdu+gXd+JBd7x
 otMKRpb2oSw9hZHrgR+PCBR6a8pzxAIqUXSSOcEwUka26WI8T98M7Hh2SpJzh3BvVI6w/kBc
 5tv2vVTU2aP6w87FPj+nNPfz1Eh/fkHR14URdr9DChHRsxSNYsa+8FGpH2r6pm6EZ4e+uqIY
 r3utA+nfeU/XFhgfbPGdlBaZan9YTFg2+yquHuwYiRy7EGfhJwwHHUuYDh19/l2HrjMs+mBL
 gdp523/ZjwOVu9Yqlfou6VsNe8JOcx0VTxv7S9SPx38jAjx6P36SEXV0T8Cqh0+Nfnk14bO0
 qA6PWGuTzaTE3t99JF9sI2dDGg03BzwVJ+zNZUNrf7RKfRrxptiLVscH15PjHu9zNNa9ECxu
 Vy5pV3IyY4/F9FcYOLevnhJ0rsVHH7r/1EogIU8SRQTjMrnoPyI+oD5nBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJKsWRmVeSWpSXmKPExsVy+t/xu7pac2ckG/RPZ7K4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
 0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFpSmH2Sw+zXoIlJ38ks3i4olPzBbff59ldhDz
 WPvxPqvHvFknWDymnDjC6nGu5y6bx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH
 5iX1Hhvf7WDy6NuyitHj8ya5AL4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsj
 UyV9O5uU1JzMstQifbsEvYyjNyeyFPyqqph65yl7A+PCzC5GTg4JAROJU7+XsXYxcnEICSxl
 lJjz7hgrREJG4uS0BihbWOLPtS42EFtI4D2jxO7ntSA2s4CfxIJNy8DivAJ2Ese6v7CA2CwC
 qhIbW9+zQsQFJU7OfAIWFxVIkWjv+ccEYgsLJEnsm7KIDWKOuMStJ/PB4iIC2hLfZr5mAzmI
 WeA7m8TM71NYIK5bxC7RfH4KWBWbgKFE11uIizgFAiWWLljAOIFRcBaSo2YhWT4LyRII20yi
 a2sXI4QtL7H97RxmCLtQ4sXlyUBxkOUNjBLnP19hhUgoSkzpfsi+gJFjFaNIamlxbnpusZFe
 cWJucWleul5yfu4mRmC62nbs55YdjCtffdQ7xMjEwXiIUQWo89GG1RcYpVjy8vNSlUR4VTWm
 JQvxpiRWVqUW5ccXleakFh9iNAUG2URmKdHkfGAizSuJNzQzMDU0MbM0MLU0M1YS5/Us6EgU
 EkhPLEnNTk0tSC2C6WPi4JRqYGKfqJJ0f9cEn4lHzi9Wq3+jN1+Xa8Jp1s3GN2au/Mz18rbK
 8azJvVc3cb0tOVnvsi1d1/EExw+b932ZIWuvqQTttrx7rHv5+rC/jjp/mpab5yh7BsW6W8vp
 Pftl5OFVZKL1hatzabfauiWHmium5mZ6essyOCZm7vZULHhqcjz8d/bxf/zSO9lcuR24/wpU
 /roh1SIQoCpj+X69H6e43/Pvv7pSNge0bszceT536Z33iic1JBUsJuxMK9TgeeryNbDwxt5k
 sbXcit8z5yYc+9bXon1128tXDSeY/qh46O5/all78/wLluQdHls+JM4zqjw8daL5hVt6DGU2
 itfZFO4dMtm6WWlLfv+rR7eXtCqxFGckGmoxFxUnAgDVV8Ye7AMAAA==
X-CMS-MailID: 20221213154130eucas1p1bf3ee6721c7e32dfd6968df00449bb69
X-Msg-Generator: CA
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
 <17f7772b-ca46-53b8-5bf9-98d3242fa703@samsung.com>
 <CAMty3ZC0Ca5yt4jFHi0KtcEszzRs1KrUTF2SqYizMF+1NYPAUQ@mail.gmail.com>
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

This is a multi-part message in MIME format.
--------------xkE7tGeeEnIRkp4ce2pKM0Nu
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"

On 13.12.2022 16:15, Jagan Teki wrote:
> On Tue, Dec 13, 2022 at 8:24 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 13.12.2022 15:18, Jagan Teki wrote:
>>> On Tue, Dec 13, 2022 at 7:31 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 13.12.2022 13:20, Marek Szyprowski wrote:
>>>>> On 13.12.2022 11:40, Jagan Teki wrote:
>>>>>> On Tue, Dec 13, 2022 at 2:28 PM Marek Szyprowski
>>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>>> On 12.12.2022 16:33, Jagan Teki wrote:
>>>>>>>
>>>>>>> On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
>>>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>>>
>>>>>>> On 12.12.2022 09:43, Marek Szyprowski wrote:
>>>>>>>
>>>>>>> On 12.12.2022 09:32, Jagan Teki wrote:
>>>>>>>
>>>>>>> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
>>>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>>>
>>>>>>> Hi Jagan,
>>>>>>>
>>>>>>> On 09.12.2022 16:23, Jagan Teki wrote:
>>>>>>>
>>>>>>> The existing drm panels and bridges in Exynos required host
>>>>>>> initialization during the first DSI command transfer even though
>>>>>>> the initialization was done before.
>>>>>>>
>>>>>>> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
>>>>>>> flag and triggers from host transfer.
>>>>>>>
>>>>>>> Do this exclusively for Exynos.
>>>>>>>
>>>>>>> Initial logic is derived from Marek Szyprowski changes.
>>>>>>>
>>>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>>>> ---
>>>>>>> Changes from v9:
>>>>>>> - derived from v8
>>>>>>> - added comments
>>>>>>>
>>>>>>>       drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
>>>>>>>       include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>>>>>       2 files changed, 17 insertions(+), 3 deletions(-)
>>>>>>>
>>>>>>> The following chunk is missing compared to v8:
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> index 6e9ad955ebd3..6a9403cb92ae 100644
>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
>>>>>>> *dsi, unsigned int flag)
>>>>>>>                      return 0;
>>>>>>>
>>>>>>>              samsung_dsim_reset(dsi);
>>>>>>> -       samsung_dsim_enable_irq(dsi);
>>>>>>> +
>>>>>>> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>>>>>> +               samsung_dsim_enable_irq(dsi);
>>>>>>>
>>>>>>> Is this really required? does it make sure that the IRQ does not
>>>>>>> enable twice?
>>>>>>>
>>>>>>> That's what that check does. Without the 'if (!(dsi->state &
>>>>>>> DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
>>>>>>> from pre_enable, then from the first transfer), what leads to a
>>>>>>> warning from irq core.
>>>>>>>
>>>>>>> I've just noticed that we also would need to clear the
>>>>>>> DSIM_STATE_REINITIALIZED flag in dsim_suspend.
>>>>>>>
>>>>>>> However I've found that a bit simpler patch would keep the current code
>>>>>>> flow for Exynos instead of this reinitialization hack. This can be
>>>>>>> applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host
>>>>>>> init in pre_enable" patch:
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> index 0b2e52585485..acc95c61ae45 100644
>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>> @@ -1291,9 +1291,11 @@ static void
>>>>>>> samsung_dsim_atomic_pre_enable(struct
>>>>>>> drm_bridge *bridge,
>>>>>>>
>>>>>>>             dsi->state |= DSIM_STATE_ENABLED;
>>>>>>>
>>>>>>> -       ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>>>>>> -       if (ret)
>>>>>>> -               return;
>>>>>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>>>>>>> +               ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>>>>>> +               if (ret)
>>>>>>> +                       return;
>>>>>>> +       }
>>>>>>>
>>>>>>> Sorry, I don't understand this. Does it mean Exynos doesn't need to
>>>>>>> init host in pre_enable? If I remember correctly even though the host
>>>>>>> is initialized it has to reinitialize during the first transfer - This
>>>>>>> is what the Exynos requirement is. Please correct or explain here.
>>>>>>>
>>>>>>> This is a matter of enabling power regulator(s) in the right order
>>>>>>> and doing the host initialization in the right moment. It was never
>>>>>>> a matter of re-initialization. See the current code for the
>>>>>>> reference (it uses the same approach as my above change). I've
>>>>>>> already explained that here:
>>>>>>>
>>>>>>> https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/
>>>>>>>
>>>>>>>
>>>>>>> If you would like to see the exact proper moment of the dsi host
>>>>>>> initialization on the Exynos see the code here:
>>>>>>>
>>>>>>> https://protect2.fireeye.com/v1/url?k=5dc33900-0258001f-5dc2b24f-000babdfecba-f7c1a2a1905c83ca&q=1&e=f086bfdb-9055-48bd-b9c2-5dffb6c0d558&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv5.18-next-20220511-dsi-rework
>>>>>>> and patches adding mipi_dsi_host_init() to panel/bridge drivers.
>>>>>> As I said before, the downstream bridge needs an explicit call to host
>>>>>> init via mipi_dsi_host_init - this is indeed not a usual use-case
>>>>>> scenario. Let's handle this with a REINIT fix and see if we can update
>>>>>> this later to handle both scenarios.
>>>>>>
>>>>>> Would you please test this repo, I have included all.
>>>>>>
>>>>>> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>>>>> This doesn't work on TM2e board. Give me some time to find why...
>>>>>
>>>> The following change is missing in "drm: bridge: Generalize Exynos-DSI
>>>> driver into a Samsung DSIM bridge" patch:
>>>>
>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> index 1dbff2bee93f..81828b5ee0ac 100644
>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> @@ -1745,6 +1745,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
>>>>            dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
>>>>            dsi->bridge.of_node = dev->of_node;
>>>>            dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>>>> +       dsi->bridge.pre_enable_prev_first = true;
>>> Can you check this and confirm, I keep this in exynos side.
>>> https://gitlab.com/openedev/kernel/-/commit/ccb02df7a313fdf91d8e116b0ec3d6c945fbb6fd#c93f0ce4d81b854fbde970e341fb307f1be78c16_1865_189
>> This one is fine!
>>
>>>>            /* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts
>>>> HS/VS/DE */
>>>>            if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
>>>>
>>>>
>>>> After adding the above, all my test platform works fine.
>>>>
>>>> BTW, I still think that it is worth replacing the "drm: exynos: dsi: Add
>>>> host initialization in pre_enable" patch with the following simple
>>>> change and propagate it to bridge/samsung-dsim.c:
>>>>
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> index fdaf514b39f2..071b74d60dcb 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> @@ -254,6 +254,9 @@ struct exynos_dsi_transfer {
>>>>     #define DSIM_STATE_CMD_LPM             BIT(2)
>>>>     #define DSIM_STATE_VIDOUT_AVAILABLE    BIT(3)
>>>>
>>>> +#define exynos_dsi_hw_is_exynos(hw) \
>>>> +       ((hw) >= DSIM_TYPE_EXYNOS3250 && (hw) <= DSIM_TYPE_EXYNOS5433)
>>>> +
>>>>     enum exynos_dsi_type {
>>>>            DSIM_TYPE_EXYNOS3250,
>>>>            DSIM_TYPE_EXYNOS4210,
>>>> @@ -1344,6 +1347,9 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
>>>>     {
>>>>            const struct exynos_dsi_driver_data *driver_data =
>>>> dsi->driver_data;
>>>>
>>>> +       if (dsi->state & DSIM_STATE_INITIALIZED)
>>>> +               return 0;
>>>> +
>>>>            exynos_dsi_reset(dsi);
>>>>            exynos_dsi_enable_irq(dsi);
>>>>
>>>> @@ -1356,6 +1362,8 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
>>>>            exynos_dsi_set_phy_ctrl(dsi);
>>>>            exynos_dsi_init_link(dsi);
>>>>
>>>> +       dsi->state |= DSIM_STATE_INITIALIZED;
>>>> +
>>>>            return 0;
>>>>     }
>>>>
>>>> @@ -1411,6 +1419,12 @@ static void exynos_dsi_atomic_pre_enable(struct
>>>> drm_bridge *bridge,
>>>>            }
>>>>
>>>>            dsi->state |= DSIM_STATE_ENABLED;
>>>> +
>>>> +       if (!exynos_dsi_hw_is_exynos(dsi->plat_data->hw_type)) {
>>>> +               ret = exynos_dsi_init(dsi);
>>>> +               if (ret)
>>>> +                       return;
>>>> +       }
>>>>     }
>>>>
>>>>     static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
>>>> @@ -1557,12 +1571,9 @@ static ssize_t exynos_dsi_host_transfer(struct
>>>> mipi_dsi_host *host,
>>>>            if (!(dsi->state & DSIM_STATE_ENABLED))
>>>>                    return -EINVAL;
>>>>
>>>> -       if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
>>>> -               ret = exynos_dsi_init(dsi);
>>>> -               if (ret)
>>>> -                       return ret;
>>>> -               dsi->state |= DSIM_STATE_INITIALIZED;
>>>> -       }
>>>> +       ret = exynos_dsi_init(dsi);
>>>> +       if (ret)
>>>> +               return ret;
>>> Below patch handling similar behavior by checking exynos hw_type at
>>> exynos_dsi_init, isn't it? Please check and let me know if I missing
>>> anything.
>>>
>>> https://gitlab.com/openedev/kernel/-/commit/d19d491eef92b92e12a26265697274ce666eddb5
>> You don't miss anything. Your version also works, but I just proposed a
>> bit simpler code.
> Do your changes don't need a DSIM_STATE_REINITIALIZED flag? would you
> please share the change on top of this commit?
> https://gitlab.com/openedev/kernel/-/commit/d19d491eef92b92e12a26265697274ce666eddb5

It doesn't need the DSIM_STATE_REINITIALIZED flag because the 
initialization is done only once - in pre_enable for non-Exynos case and 
on the first transfer for the Exynos case. In both cases the same flag 
(DSIM_STATE_INITIALIZED) is used.

See the attached patch.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

--------------xkE7tGeeEnIRkp4ce2pKM0Nu
Content-Type: text/plain; charset="UTF-8";
	name="0001-fixup-drm-exynos-dsi-Handle-proper-host-initializati.patch"
Content-Disposition: attachment;
	filename*0="0001-fixup-drm-exynos-dsi-Handle-proper-host-initializati.pa";
	filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBiYTVmZTNjNzkyYTJiMGMyMzJiYzM4ZjUyYTBiNjFhODk1MTI0NjBmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ftc3Vu
Zy5jb20+CkRhdGU6IFR1ZSwgMTMgRGVjIDIwMjIgMTY6NDA6MTMgKzAxMDAKU3ViamVjdDogW1BB
VENIXSBmaXh1cCEgZHJtOiBleHlub3M6IGRzaTogSGFuZGxlIHByb3BlciBob3N0IGluaXRpYWxp
emF0aW9uCgpTaWduZWQtb2ZmLWJ5OiBNYXJlayBTenlwcm93c2tpIDxtLnN6eXByb3dza2lAc2Ft
c3VuZy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jIHwg
MzkgKysrKysrKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDI3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9k
c2kuYwppbmRleCAwNjU3ZjY2NTViYzYuLjA3MWI3NGQ2MGRjYiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9l
eHlub3MvZXh5bm9zX2RybV9kc2kuYwpAQCAtMjUxLDkgKzI1MSw4IEBAIHN0cnVjdCBleHlub3Nf
ZHNpX3RyYW5zZmVyIHsKIAogI2RlZmluZSBEU0lNX1NUQVRFX0VOQUJMRUQJCUJJVCgwKQogI2Rl
ZmluZSBEU0lNX1NUQVRFX0lOSVRJQUxJWkVECQlCSVQoMSkKLSNkZWZpbmUgRFNJTV9TVEFURV9S
RUlOSVRJQUxJWkVECUJJVCgyKQotI2RlZmluZSBEU0lNX1NUQVRFX0NNRF9MUE0JCUJJVCgzKQot
I2RlZmluZSBEU0lNX1NUQVRFX1ZJRE9VVF9BVkFJTEFCTEUJQklUKDQpCisjZGVmaW5lIERTSU1f
U1RBVEVfQ01EX0xQTQkJQklUKDIpCisjZGVmaW5lIERTSU1fU1RBVEVfVklET1VUX0FWQUlMQUJM
RQlCSVQoMykKIAogI2RlZmluZSBleHlub3NfZHNpX2h3X2lzX2V4eW5vcyhodykgXAogCSgoaHcp
ID49IERTSU1fVFlQRV9FWFlOT1MzMjUwICYmIChodykgPD0gRFNJTV9UWVBFX0VYWU5PUzU0MzMp
CkBAIC0xMzQ0LDMwICsxMzQzLDE1IEBAIHN0YXRpYyB2b2lkIGV4eW5vc19kc2lfZGlzYWJsZV9p
cnEoc3RydWN0IGV4eW5vc19kc2kgKmRzaSkKIAlkaXNhYmxlX2lycShkc2ktPmlycSk7CiB9CiAK
LXN0YXRpYyBpbnQgZXh5bm9zX2RzaV9pbml0KHN0cnVjdCBleHlub3NfZHNpICpkc2ksIHVuc2ln
bmVkIGludCBmbGFnKQorc3RhdGljIGludCBleHlub3NfZHNpX2luaXQoc3RydWN0IGV4eW5vc19k
c2kgKmRzaSkKIHsKIAljb25zdCBzdHJ1Y3QgZXh5bm9zX2RzaV9kcml2ZXJfZGF0YSAqZHJpdmVy
X2RhdGEgPSBkc2ktPmRyaXZlcl9kYXRhOwogCi0JLyoKLQkgKiBGSVhNRToKLQkgKiBUaGUgZXhp
c3RpbmcgZHJtIHBhbmVscyBhbmQgYnJpZGdlcyBpbiBFeHlub3MgcmVxdWlyZWQgaG9zdAotCSAq
IGluaXRpYWxpemF0aW9uIGR1cmluZyB0aGUgZmlyc3QgRFNJIGNvbW1hbmQgdHJhbnNmZXIgZXZl
biB0aG91Z2gKLQkgKiB0aGUgaW5pdGlhbGl6YXRpb24gd2FzIGRvbmXCoGJlZm9yZS4KLQkgKgot
CSAqIFRoaXMgaG9zdCByZWluaXRpYWxpemF0aW9uIGlzIGhhbmRsZWQgdmlhIERTSU1fU1RBVEVf
UkVJTklUSUFMSVpFRAotCSAqIGZsYWcgYW5kIHRyaWdnZXJzIGZyb20gaG9zdCB0cmFuc2Zlci4g
RG8gdGhpcyBleGNsdXNpdmVseSBmb3IgRXh5bm9zLgotCSAqLwotCWlmICghZXh5bm9zX2RzaV9o
d19pc19leHlub3MoZHNpLT5wbGF0X2RhdGEtPmh3X3R5cGUpICYmCi0JICAgIGRzaS0+c3RhdGUg
JiBEU0lNX1NUQVRFX1JFSU5JVElBTElaRUQpCi0JCXJldHVybiAwOwotCi0JaWYgKGRzaS0+c3Rh
dGUgJiBmbGFnKQorCWlmIChkc2ktPnN0YXRlICYgRFNJTV9TVEFURV9JTklUSUFMSVpFRCkKIAkJ
cmV0dXJuIDA7CiAKIAlleHlub3NfZHNpX3Jlc2V0KGRzaSk7Ci0KLQlpZiAoIShkc2ktPnN0YXRl
ICYgRFNJTV9TVEFURV9JTklUSUFMSVpFRCkpCi0JCWV4eW5vc19kc2lfZW5hYmxlX2lycShkc2kp
OworCWV4eW5vc19kc2lfZW5hYmxlX2lycShkc2kpOwogCiAJaWYgKGRyaXZlcl9kYXRhLT5yZWdf
dmFsdWVzW1JFU0VUX1RZUEVdID09IERTSU1fRlVOQ1JTVCkKIAkJZXh5bm9zX2RzaV9lbmFibGVf
bGFuZShkc2ksIEJJVChkc2ktPmxhbmVzKSAtIDEpOwpAQCAtMTM3OCw3ICsxMzYyLDcgQEAgc3Rh
dGljIGludCBleHlub3NfZHNpX2luaXQoc3RydWN0IGV4eW5vc19kc2kgKmRzaSwgdW5zaWduZWQg
aW50IGZsYWcpCiAJZXh5bm9zX2RzaV9zZXRfcGh5X2N0cmwoZHNpKTsKIAlleHlub3NfZHNpX2lu
aXRfbGluayhkc2kpOwogCi0JZHNpLT5zdGF0ZSB8PSBmbGFnOworCWRzaS0+c3RhdGUgfD0gRFNJ
TV9TVEFURV9JTklUSUFMSVpFRDsKIAogCXJldHVybiAwOwogfQpAQCAtMTQzNiw5ICsxNDIwLDEx
IEBAIHN0YXRpYyB2b2lkIGV4eW5vc19kc2lfYXRvbWljX3ByZV9lbmFibGUoc3RydWN0IGRybV9i
cmlkZ2UgKmJyaWRnZSwKIAogCWRzaS0+c3RhdGUgfD0gRFNJTV9TVEFURV9FTkFCTEVEOwogCi0J
cmV0ID0gZXh5bm9zX2RzaV9pbml0KGRzaSwgRFNJTV9TVEFURV9JTklUSUFMSVpFRCk7Ci0JaWYg
KHJldCkKLQkJcmV0dXJuOworCWlmICghZXh5bm9zX2RzaV9od19pc19leHlub3MoZHNpLT5wbGF0
X2RhdGEtPmh3X3R5cGUpKSB7CisJCXJldCA9IGV4eW5vc19kc2lfaW5pdChkc2kpOworCQlpZiAo
cmV0KQorCQkJcmV0dXJuOworCX0KIH0KIAogc3RhdGljIHZvaWQgZXh5bm9zX2RzaV9hdG9taWNf
ZW5hYmxlKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsCkBAIC0xNTg1LDcgKzE1NzEsNyBAQCBz
dGF0aWMgc3NpemVfdCBleHlub3NfZHNpX2hvc3RfdHJhbnNmZXIoc3RydWN0IG1pcGlfZHNpX2hv
c3QgKmhvc3QsCiAJaWYgKCEoZHNpLT5zdGF0ZSAmIERTSU1fU1RBVEVfRU5BQkxFRCkpCiAJCXJl
dHVybiAtRUlOVkFMOwogCi0JcmV0ID0gZXh5bm9zX2RzaV9pbml0KGRzaSwgRFNJTV9TVEFURV9S
RUlOSVRJQUxJWkVEKTsKKwlyZXQgPSBleHlub3NfZHNpX2luaXQoZHNpKTsKIAlpZiAocmV0KQog
CQlyZXR1cm4gcmV0OwogCkBAIC0xNzkxLDcgKzE3NzcsNiBAQCBzdGF0aWMgaW50IF9fbWF5YmVf
dW51c2VkIGV4eW5vc19kc2lfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAKIAlpZiAoZHNp
LT5zdGF0ZSAmIERTSU1fU1RBVEVfSU5JVElBTElaRUQpIHsKIAkJZHNpLT5zdGF0ZSAmPSB+RFNJ
TV9TVEFURV9JTklUSUFMSVpFRDsKLQkJZHNpLT5zdGF0ZSAmPSB+RFNJTV9TVEFURV9SRUlOSVRJ
QUxJWkVEOwogCiAJCWV4eW5vc19kc2lfZGlzYWJsZV9jbG9jayhkc2kpOwogCi0tIAoyLjM4LjEK
Cg==

--------------xkE7tGeeEnIRkp4ce2pKM0Nu--
