Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E0E64B6B0
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 15:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB9410E21D;
	Tue, 13 Dec 2022 14:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0360410E320
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 14:01:57 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221213140156euoutp0259fd129d5301030e6fd40079ba69d21c~wXy7D3c9i2986829868euoutp021
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 14:01:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221213140156euoutp0259fd129d5301030e6fd40079ba69d21c~wXy7D3c9i2986829868euoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1670940116;
 bh=UnGwrxwGwoAziqTG8z8fluMq2hh8bNyGwwscbXiGLKs=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=Jw806ZJx2TjORNeRu7EQN1jY+8dzN2UubqJKP9RGHkVXet0CQpY8Yslb1xneS2lJn
 hhN7Mj640GJlVzt42sgZLh82VUr01r8dvv3Bmi/7djDPlr0vAf0BRNQ/2SkU1KRFdc
 SZEcAIuE/moBNkPhmn+tFir7wNl/GZWbjYAVm9qU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221213140155eucas1p1dfa8451ba8db32b51d616b6eeaad2c77~wXy6n9iYO3182031820eucas1p1t;
 Tue, 13 Dec 2022 14:01:55 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 71.AC.09561.3D588936; Tue, 13
 Dec 2022 14:01:55 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221213140155eucas1p2e2d7d78339f8d095adc27a72b33145c4~wXy6Eywbr2163021630eucas1p2d;
 Tue, 13 Dec 2022 14:01:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221213140155eusmtrp14d082547499881ec298732a35c217897~wXy6D9H4-1444714447eusmtrp1y;
 Tue, 13 Dec 2022 14:01:55 +0000 (GMT)
X-AuditID: cbfec7f2-0b3ff70000002559-d2-639885d37eb7
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CA.43.08916.2D588936; Tue, 13
 Dec 2022 14:01:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20221213140153eusmtip1fedc2a308c853dc597a2f176dee4fefb~wXy41IpKh1326613266eusmtip1K;
 Tue, 13 Dec 2022 14:01:53 +0000 (GMT)
Message-ID: <3ce9def4-9fdf-0bde-fd2c-3a8755ebdf9d@samsung.com>
Date: Tue, 13 Dec 2022 15:01:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host
 for first DSI transfer
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Jagan Teki <jagan@amarulasolutions.com>
In-Reply-To: <c3f0c5c2-aae8-dc39-be02-dc4dfd0e7073@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTZRy/533fvRu7G71Mas9pWe1ELQPkzuOeDk8j5Xw7xbwr8+IonONt
 GGzQxiztMpBjwrLdYtPYcI0J6oDEcyIHHDeVCJbEz2RXyhzSLGSCjR9irKhtLxb/fZ7P9/N5
 Pt/Pcw8PFxrJlbyDikJGqZDkiUk+0dz1Z3/8T6WV0o0TwTg0crsHR96aGQL5b9tJdHPuIYm+
 PNvHQRVePYFmHXoSjd8ZJFDvsQdcVP5VLRed1ztJ5PjVzUHahTocVfY7MfRAUwxQz9hFHN0o
 LiXQkPE7Ek2b74amhvskGnRN42g+2Iu/9gx9IeDl0N+YXQRtdHVy6L4THpJuNXu4dFWZiUPX
 tN/H6M7hGg494m4nae8X3Rh9ufZz+tJUC0brmuoBPeNYvSc6g785m8k7eIhRJm7Zz8/RzX+P
 F3SmfWKxWTlF4McULYjiQWoTvLPYSISxkLIDqNGEeH4IzwJY3XcJZw8zAHbqp7hPHI6HDUuO
 8wCWOPNZUQDAxtPXQHggoLbA8VojFsYEFQcfVdzFWT4G/mDyRcxPU9nwWmtvRLOCOgCnjPZI
 AE6J4C2fNcKTVBLUTmrJMI6lNsBHJj8ZDsOpORJam12RsChqK/QsTgPW/DwsuVKFs5tq+NBn
 f4rF2+GYwUWweAWc6G5aavMs7DGcIMKXQup4qHPQi7EHPYBFv98CrCoFjvQthKJ5oYSX4MW2
 RJZOhaOmcjxMQyoa/jwZw+4QDSuav16iBbBMI2TVa6G5u/G/2OsDQ7geiM3LnsW8rL55WRvz
 /7nVgKgHIkatkssYVZKC+ThBJZGr1ApZgjRf7gChj9uz2D3dAiwTgYQOgPFAB4A8XBwriFt/
 SioUZEsOH2GU+VlKdR6j6gCreIRYJLAby6RCSiYpZHIZpoBRPplivKiVRRiXOPqW/578l/cH
 FIlH6RSpbzO31DqsE8njs/ZVHn5jcGF+46GmtH07X0nhDiWbS3JH3TLbWs3k5d1/c7cOf4Br
 9w4OZAbe7Sp1Wpu8HtKV9s4OzH+Ef0agrlZ/Jvu0IcD76K/Ucaen7lV0zrnD1vb4QpBy71GI
 jo++MOdZo0tVGDNO2l98u7WlN0Z3s/rs6jWmuprkKiXtcZ57zrW30BXcOSCB/ijlycxT+9Ov
 zGbXt9vv3ZBIN2w70B/XlpFj+fZx1hz15h/F6W3J/yT51pXZ0ultu0BjbYFyVe5vx8o3KdYb
 1l23Ffjn34s/c9ptaW4wdG2fzbRcjW3YXTdGXH39QzGhypEkvYwrVZJ/AQrAbZ4nBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsVy+t/xu7qXW2ckG5yaxWxx5/ZpZov7iz+z
 WLy+vYLN4srX92wWvUvPsVpMuj+BxeLLpglsFi/uXWSxONv0ht2ic+ISdovlE/axWWx6fI3V
 ouvXSmaLGef3MVm8aWtktDj9aD2zxanGVhaLS1MOs1l8mvUQKDv5JZvFxROfmC2+/z7L7CDm
 sfbjfVaPebNOsHhMOXGE1eNcz102j52z7rJ7zO6YyeqxeM9LJo8jVxezety5tofN4373cSaP
 zUvqPTa+28Hk0bdlFaPH501yAXxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZG
 pkr6djYpqTmZZalF+nYJehl9348yFxxxrZi7cD5rA+MZ6y5GTg4JAROJTe9Xs3QxcnEICSxl
 lDj/bCMbREJG4uS0BlYIW1jiz7UuNoii94wSJ15OYQJJ8ArYSbxYAmGzCKhKfJv0kBkiLihx
 cuYTFhBbVCBFor3nH1iNsECSxL4pi8AWMAuIS9x6Mh8sziZgKNH1tgssLiKgLfFt5muwZcwC
 39kkZn6fAnXeKlaJUzs2gE3lFLCXuPvvEyPEJDOJrq1dULa8RPPW2cwTGIVmITlkFpKFs5C0
 zELSsoCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgmtl27OfmHYzzXn3UO8TIxMF4iFGC
 g1lJhFdVY1qyEG9KYmVValF+fFFpTmrxIUZTYGhMZJYSTc4HJrq8knhDMwNTQxMzSwNTSzNj
 JXFez4KORCGB9MSS1OzU1ILUIpg+Jg5OqQYmpc7PG5U0eI6FBzgf/mn16rN6EdfWLbWzy1u3
 cRQemXR3VmDq28Ykjjs1cRuOPu60+GgaPVvF4sfz0BOeaQteGdS+dZn/pcZWe6XFMtaFpdZZ
 D+w7LfZ+/hxuZCrZ4rnOz0SuK+FcmKZcQvOP2LfmbwR1NEoC7ZmE1ym8PNS9RUPi/6PVW/Wm
 du5VfX/8nHLkkS9hykWHqubbnJr8p7T9q6hGyb7+j0tXmuVufL/ripPpWTFHjvn3c/ospt7P
 Co+OzS9u0S56+OSvDVfFyp+z45jvcZ7mvXZK3TnypjzvjxdF1meU/qvy7WS55dBkOmNW/otz
 PzZEN3UHLXoz4+zi4jV9b85v9HebwV80hUtKiaU4I9FQi7moOBEApDYqsLwDAAA=
X-CMS-MailID: 20221213140155eucas1p2e2d7d78339f8d095adc27a72b33145c4
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

On 13.12.2022 13:20, Marek Szyprowski wrote:
> On 13.12.2022 11:40, Jagan Teki wrote:
>> On Tue, Dec 13, 2022 at 2:28 PM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> On 12.12.2022 16:33, Jagan Teki wrote:
>>>
>>> On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>
>>> On 12.12.2022 09:43, Marek Szyprowski wrote:
>>>
>>> On 12.12.2022 09:32, Jagan Teki wrote:
>>>
>>> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>
>>> Hi Jagan,
>>>
>>> On 09.12.2022 16:23, Jagan Teki wrote:
>>>
>>> The existing drm panels and bridges in Exynos required host
>>> initialization during the first DSI command transfer even though
>>> the initialization was done before.
>>>
>>> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
>>> flag and triggers from host transfer.
>>>
>>> Do this exclusively for Exynos.
>>>
>>> Initial logic is derived from Marek Szyprowski changes.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> ---
>>> Changes from v9:
>>> - derived from v8
>>> - added comments
>>>
>>>     drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
>>>     include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>     2 files changed, 17 insertions(+), 3 deletions(-)
>>>
>>> The following chunk is missing compared to v8:
>>>
>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> index 6e9ad955ebd3..6a9403cb92ae 100644
>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
>>> *dsi, unsigned int flag)
>>>                    return 0;
>>>
>>>            samsung_dsim_reset(dsi);
>>> -       samsung_dsim_enable_irq(dsi);
>>> +
>>> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>> +               samsung_dsim_enable_irq(dsi);
>>>
>>> Is this really required? does it make sure that the IRQ does not
>>> enable twice?
>>>
>>> That's what that check does. Without the 'if (!(dsi->state &
>>> DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
>>> from pre_enable, then from the first transfer), what leads to a
>>> warning from irq core.
>>>
>>> I've just noticed that we also would need to clear the
>>> DSIM_STATE_REINITIALIZED flag in dsim_suspend.
>>>
>>> However I've found that a bit simpler patch would keep the current code
>>> flow for Exynos instead of this reinitialization hack. This can be
>>> applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host
>>> init in pre_enable" patch:
>>>
>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> index 0b2e52585485..acc95c61ae45 100644
>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> @@ -1291,9 +1291,11 @@ static void 
>>> samsung_dsim_atomic_pre_enable(struct
>>> drm_bridge *bridge,
>>>
>>>           dsi->state |= DSIM_STATE_ENABLED;
>>>
>>> -       ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>> -       if (ret)
>>> -               return;
>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>>> +               ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>> +               if (ret)
>>> +                       return;
>>> +       }
>>>
>>> Sorry, I don't understand this. Does it mean Exynos doesn't need to
>>> init host in pre_enable? If I remember correctly even though the host
>>> is initialized it has to reinitialize during the first transfer - This
>>> is what the Exynos requirement is. Please correct or explain here.
>>>
>>> This is a matter of enabling power regulator(s) in the right order 
>>> and doing the host initialization in the right moment. It was never 
>>> a matter of re-initialization. See the current code for the 
>>> reference (it uses the same approach as my above change). I've 
>>> already explained that here:
>>>
>>> https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/ 
>>>
>>>
>>> If you would like to see the exact proper moment of the dsi host 
>>> initialization on the Exynos see the code here:
>>>
>>> https://protect2.fireeye.com/v1/url?k=5dc33900-0258001f-5dc2b24f-000babdfecba-f7c1a2a1905c83ca&q=1&e=f086bfdb-9055-48bd-b9c2-5dffb6c0d558&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv5.18-next-20220511-dsi-rework 
>>> and patches adding mipi_dsi_host_init() to panel/bridge drivers.
>> As I said before, the downstream bridge needs an explicit call to host
>> init via mipi_dsi_host_init - this is indeed not a usual use-case
>> scenario. Let's handle this with a REINIT fix and see if we can update
>> this later to handle both scenarios.
>>
>> Would you please test this repo, I have included all.
>>
>> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>
> This doesn't work on TM2e board. Give me some time to find why...
>
The following change is missing in "drm: bridge: Generalize Exynos-DSI 
driver into a Samsung DSIM bridge" patch:

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c 
b/drivers/gpu/drm/bridge/samsung-dsim.c
index 1dbff2bee93f..81828b5ee0ac 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1745,6 +1745,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
         dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
         dsi->bridge.of_node = dev->of_node;
         dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
+       dsi->bridge.pre_enable_prev_first = true;

         /* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts 
HS/VS/DE */
         if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)


After adding the above, all my test platform works fine.

BTW, I still think that it is worth replacing the "drm: exynos: dsi: Add 
host initialization in pre_enable" patch with the following simple 
change and propagate it to bridge/samsung-dsim.c:

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c 
b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index fdaf514b39f2..071b74d60dcb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -254,6 +254,9 @@ struct exynos_dsi_transfer {
  #define DSIM_STATE_CMD_LPM             BIT(2)
  #define DSIM_STATE_VIDOUT_AVAILABLE    BIT(3)

+#define exynos_dsi_hw_is_exynos(hw) \
+       ((hw) >= DSIM_TYPE_EXYNOS3250 && (hw) <= DSIM_TYPE_EXYNOS5433)
+
  enum exynos_dsi_type {
         DSIM_TYPE_EXYNOS3250,
         DSIM_TYPE_EXYNOS4210,
@@ -1344,6 +1347,9 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
  {
         const struct exynos_dsi_driver_data *driver_data = 
dsi->driver_data;

+       if (dsi->state & DSIM_STATE_INITIALIZED)
+               return 0;
+
         exynos_dsi_reset(dsi);
         exynos_dsi_enable_irq(dsi);

@@ -1356,6 +1362,8 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
         exynos_dsi_set_phy_ctrl(dsi);
         exynos_dsi_init_link(dsi);

+       dsi->state |= DSIM_STATE_INITIALIZED;
+
         return 0;
  }

@@ -1411,6 +1419,12 @@ static void exynos_dsi_atomic_pre_enable(struct 
drm_bridge *bridge,
         }

         dsi->state |= DSIM_STATE_ENABLED;
+
+       if (!exynos_dsi_hw_is_exynos(dsi->plat_data->hw_type)) {
+               ret = exynos_dsi_init(dsi);
+               if (ret)
+                       return;
+       }
  }

  static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
@@ -1557,12 +1571,9 @@ static ssize_t exynos_dsi_host_transfer(struct 
mipi_dsi_host *host,
         if (!(dsi->state & DSIM_STATE_ENABLED))
                 return -EINVAL;

-       if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-               ret = exynos_dsi_init(dsi);
-               if (ret)
-                       return ret;
-               dsi->state |= DSIM_STATE_INITIALIZED;
-       }
+       ret = exynos_dsi_init(dsi);
+       if (ret)
+               return ret;

         ret = mipi_dsi_create_packet(&xfer.packet, msg);
         if (ret < 0)


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

