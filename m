Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBE864B503
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 13:20:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5346310E1D9;
	Tue, 13 Dec 2022 12:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8D810E1C3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 12:20:07 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221213122005euoutp02bf8c44e136b9aa9bdf9dce2055ef7c0d~wWZ-tVgPX1308713087euoutp028
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 12:20:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221213122005euoutp02bf8c44e136b9aa9bdf9dce2055ef7c0d~wWZ-tVgPX1308713087euoutp028
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670934005;
 bh=EKzUz4CVkmycZfeF+RvrHX2YO1OqUYSz2g2nXmXQIM0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=ehoI6gOUGO/NMAMOfeR7jImtFJobRZ5e+enBo+i0IqOTKzyvpjAGhKrB7StOYiryA
 xJOYUCiJTuQH1DXowUOz0Cbx25urgPBDawPmPWRaw2c8LdhumjaPLeejzkZN5LwtPb
 ohH4yFg0C1eo+KDNuNr1o2KmvwvlkVqliPAxzNdc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221213122004eucas1p1822c1cf32ab634c14e66d6e0dd6b6e35~wWZ-W951X1656016560eucas1p1s;
 Tue, 13 Dec 2022 12:20:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id E4.E3.09561.4FD68936; Tue, 13
 Dec 2022 12:20:04 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221213122004eucas1p200a6939aae576a8f38caf497527595c4~wWZ_4p--h0791007910eucas1p2-;
 Tue, 13 Dec 2022 12:20:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221213122004eusmtrp277bee43590c6f93c01c1cb0574f2b283~wWZ_3rNyE2744327443eusmtrp2Z;
 Tue, 13 Dec 2022 12:20:04 +0000 (GMT)
X-AuditID: cbfec7f2-0b3ff70000002559-dd-63986df4f1fb
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 15.03.08916.4FD68936; Tue, 13
 Dec 2022 12:20:04 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221213122003eusmtip2304d0939a48f19504d63d99069cd69df~wWZ9viMdS3177331773eusmtip2k;
 Tue, 13 Dec 2022 12:20:03 +0000 (GMT)
Message-ID: <c3f0c5c2-aae8-dc39-be02-dc4dfd0e7073@samsung.com>
Date: Tue, 13 Dec 2022 13:20:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host
 for first DSI transfer
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0xTZxjOd87paekoHgquX2AZowmbQgZjcdkXtxlNNDuZP3CTmIXsdoBD
 K1IuLXhbzMC4So8XKmsKtMO6gbOAjoCVi2tQipFutYUaxKUCFS/ZoFxGC05gG7Mtbvx7nud9
 n+953zefABfryDjB3sJSVlnIFEhJIdFxc3Hg9XlFbc4bbR0paOSeA0fehgCBfPfMJBpamCXR
 qfMuHqr2agk0364l0e9jbgI5j07xkeZMIx9d0PaQqP3hMA9xS004qh3owdCUugIgx4NWHP1S
 8TWBbuv6SOQ3jD+rfjNBIrfdj6M/l5341hfpS3NeHn3WYCdonf0Gj3adHCXpbsMonzZW1vHo
 BusERt+408CjR4atJO090Y/Rlxu/ottmujD6tKUZ0IH2l3dFZQnfzWUL9u5nlWlbvhDKZ88s
 k8XVrx18vHgJKwfOBA4IBJDaBPWm3RwQCsSUGcBuXycvTOYBbHpqIcMkAGCz0wqeOxy1B8P6
 BQBXBt14mMwByF3384NNImoLXBqP5kCEgKCSYKOxmR/EIioa/lz3iAji9VQuvN7txII4hsqG
 MzpzqAenJNDzyBTSY6kU+KTOFxoCpxZIaOqwg2CBpNIhN82RQRxBfQhPVF4BYXMC7Jz+NjQQ
 pE4L4eTDB6FXIbUdam6pQRjHwMl+y6r+ElzpDqYFDccBPLfsXSVaAMt/86w63oEjriUyuBpO
 bYStV9PC8jZ4v06Dh88SBX+djg4PEQWrO2pWZRGsVIvD3a9CQ/+P/8X2Dt7GtUBqWHMXw5r9
 DWvWMfyfew4QzUDClqkUMlaVXsgeSFUxClVZoSw1p0jRDp59XMc//f4uUD85l2oDmADYABTg
 0lhR0gZ9jliUyxw6zCqLPleWFbAqG4gXEFKJyKyrzBFTMqaU3ceyxazyeRUTRMSVYyfN2vPX
 pHcjvzwU6xu44hb1MclVXeZjRabWoc1C150fyti5i202Vak2P222Kk7mquhTfRz509B9o9ku
 qR8Zm/RdzjterdyxKYOTp3DeccWY/Cw1mh35+AWuJrZ30VejdiRXYUcyW2Z3jjmHZ3YbWzOO
 5Le8gi/4651GmTQv37FOc9WZSBpNmZoe9bSH2ZikP/pJJCZn9gg/iLn4lm1D5v7AnrbvA9s9
 u7INO+LXsdlb17tTm4BV/ObbicdKnsgVTymVNWHicOcfMfG9Wcy+j1o+e19RUjL1nYXd/OnK
 3Swj+962nYzk5pLHqC9eLtHfsiTyTmX8nXhg8K9rwvI8KaGSM+nJuFLF/AuGYrmcJwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOKsWRmVeSWpSXmKPExsVy+t/xe7pfcmckG3xdxGVx5/ZpZov7iz+z
 WLy+vYLN4srX92wWvUvPsVpMuj+BxeLLpglsFi/uXWSxONv0ht2ic+ISdovlE/axWWx6fI3V
 ouvXSmaLGef3MVm8aWtktDj9aD2zxanGVhaLS1MOs1l8mvUQKDv5JZvFxROfmC2+/z7L7CDm
 sfbjfVaPebNOsHhMOXGE1eNcz102j52z7rJ7zO6YyeqxeM9LJo8jVxezety5tofN4373cSaP
 zUvqPTa+28Hk0bdlFaPH501yAXxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZG
 pkr6djYpqTmZZalF+nYJehnvJ/5mK5ikXvH051qmBsaz8l2MHBwSAiYSp2dUdDFycQgJLGWU
 +Hj3KnMXIydQXEbi5LQGVghbWOLPtS42iKL3jBKHFqxhA2nmFbCT+PVQEKSGRUBVYsnsVewg
 Nq+AoMTJmU9YQGxRgRSJ9p5/TCC2sECSxL4pi9hAbGYBcYlbT+aDxUUEtCW+zXwNNp9Z4Dub
 xMzvU1ggln1lkbjy8zPYVDYBQ4mut11g3ZwCgRLdHVsZISaZSXRt7YKy5SW2v53DPIFRaBaS
 Q2YhWTgLScssJC0LGFlWMYqklhbnpucWG+oVJ+YWl+al6yXn525iBKaYbcd+bt7BOO/VR71D
 jEwcjIcYJTiYlUR4VTWmJQvxpiRWVqUW5ccXleakFh9iNAWGxkRmKdHkfGCSyyuJNzQzMDU0
 MbM0MLU0M1YS5/Us6EgUEkhPLEnNTk0tSC2C6WPi4JRqYFrM9mDOtUwnr4fxN6JLJ5xtUlHi
 DX/auziv0/38x1Rj5kNyPFEWnyx+8iwx9313229rvHblXKcP14yUNCYI6zrXWTk8PnrY67Sv
 ev2BqGJ120+759+0WrVuX0ZUvH3gnBtZdZNN7tUKLpP64qXluPb929bLoW3FkfUTv1dECpc+
 TX1QuezosQ/eCxZ/TZ9yz2D5RBUL28/3nP86conHfb+up8OWeKjpKJunVWCc0Nzzk2Y5pj0W
 T4kKvPaPz48znjFEYfdM8/nHnJ+s35vf16WhmeVaeHUJX9aFzm8LZmrp+rD9TVQ+WdKWVeTb
 G/5V32TdxYlTnhuK+R04t9ZMXGDjjU5+85aGJkWpng5nJZbijERDLeai4kQAmwlcuLoDAAA=
X-CMS-MailID: 20221213122004eucas1p200a6939aae576a8f38caf497527595c4
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

Hi,

On 13.12.2022 11:40, Jagan Teki wrote:
> On Tue, Dec 13, 2022 at 2:28 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 12.12.2022 16:33, Jagan Teki wrote:
>>
>> On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>
>> On 12.12.2022 09:43, Marek Szyprowski wrote:
>>
>> On 12.12.2022 09:32, Jagan Teki wrote:
>>
>> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>
>> Hi Jagan,
>>
>> On 09.12.2022 16:23, Jagan Teki wrote:
>>
>> The existing drm panels and bridges in Exynos required host
>> initialization during the first DSI command transfer even though
>> the initialization was done before.
>>
>> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
>> flag and triggers from host transfer.
>>
>> Do this exclusively for Exynos.
>>
>> Initial logic is derived from Marek Szyprowski changes.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>> ---
>> Changes from v9:
>> - derived from v8
>> - added comments
>>
>>     drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
>>     include/drm/bridge/samsung-dsim.h     |  5 +++--
>>     2 files changed, 17 insertions(+), 3 deletions(-)
>>
>> The following chunk is missing compared to v8:
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 6e9ad955ebd3..6a9403cb92ae 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
>> *dsi, unsigned int flag)
>>                    return 0;
>>
>>            samsung_dsim_reset(dsi);
>> -       samsung_dsim_enable_irq(dsi);
>> +
>> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
>> +               samsung_dsim_enable_irq(dsi);
>>
>> Is this really required? does it make sure that the IRQ does not
>> enable twice?
>>
>> That's what that check does. Without the 'if (!(dsi->state &
>> DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
>> from pre_enable, then from the first transfer), what leads to a
>> warning from irq core.
>>
>> I've just noticed that we also would need to clear the
>> DSIM_STATE_REINITIALIZED flag in dsim_suspend.
>>
>> However I've found that a bit simpler patch would keep the current code
>> flow for Exynos instead of this reinitialization hack. This can be
>> applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host
>> init in pre_enable" patch:
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 0b2e52585485..acc95c61ae45 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1291,9 +1291,11 @@ static void samsung_dsim_atomic_pre_enable(struct
>> drm_bridge *bridge,
>>
>>           dsi->state |= DSIM_STATE_ENABLED;
>>
>> -       ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>> -       if (ret)
>> -               return;
>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>> +               ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>> +               if (ret)
>> +                       return;
>> +       }
>>
>> Sorry, I don't understand this. Does it mean Exynos doesn't need to
>> init host in pre_enable? If I remember correctly even though the host
>> is initialized it has to reinitialize during the first transfer - This
>> is what the Exynos requirement is. Please correct or explain here.
>>
>> This is a matter of enabling power regulator(s) in the right order and doing the host initialization in the right moment. It was never a matter of re-initialization. See the current code for the reference (it uses the same approach as my above change). I've already explained that here:
>>
>> https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/
>>
>> If you would like to see the exact proper moment of the dsi host initialization on the Exynos see the code here:
>>
>> https://protect2.fireeye.com/v1/url?k=5dc33900-0258001f-5dc2b24f-000babdfecba-f7c1a2a1905c83ca&q=1&e=f086bfdb-9055-48bd-b9c2-5dffb6c0d558&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv5.18-next-20220511-dsi-rework and patches adding mipi_dsi_host_init() to panel/bridge drivers.
> As I said before, the downstream bridge needs an explicit call to host
> init via mipi_dsi_host_init - this is indeed not a usual use-case
> scenario. Let's handle this with a REINIT fix and see if we can update
> this later to handle both scenarios.
>
> Would you please test this repo, I have included all.
>
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10

This doesn't work on TM2e board. Give me some time to find why...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

