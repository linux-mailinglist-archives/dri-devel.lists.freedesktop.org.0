Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ECC70745C
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 23:34:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B27CD10E2B5;
	Wed, 17 May 2023 21:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237ED10E2B5
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 21:34:30 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230517213428euoutp0295c4d4f7b03afda92864992723e13b05~gC9Si-CyU2083720837euoutp02L
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 21:34:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230517213428euoutp0295c4d4f7b03afda92864992723e13b05~gC9Si-CyU2083720837euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1684359268;
 bh=iCC7XBAdKunpe1eVqBgrPGefO03u0VmikQBavh2KJ30=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=DImVsFXrJlQ7DiZUCzXknRpSbEYymRiuZTTRWbTshgNNa8kvnK10fqEzKp492kEzl
 PU2cEQzTCyEG9nkGjVQE6BywQBvNtt/yxtMdmzAQqbLR6ADK8scYchSWFJYm3kcJjl
 2dPAYEZqj4iHopQMr+VhvjYv0wV5S34az0xwI3lA=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230517213427eucas1p2284ac4bbd55cb8e6864b69ef73e7e337~gC9SCQfJ41186011860eucas1p2W;
 Wed, 17 May 2023 21:34:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 7C.2B.37758.36845646; Wed, 17
 May 2023 22:34:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230517213426eucas1p1d45966e8d436a044ab11482610444a7f~gC9Q1TJ2A0610906109eucas1p1b;
 Wed, 17 May 2023 21:34:26 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230517213426eusmtrp1e0ea385550e97edb987a2401cf5dd74c~gC9Q0pQ9V1611116111eusmtrp1T;
 Wed, 17 May 2023 21:34:26 +0000 (GMT)
X-AuditID: cbfec7f5-7ffff7000002937e-bb-646548638d85
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 34.92.14344.26845646; Wed, 17
 May 2023 22:34:26 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20230517213425eusmtip262a089e015991230eade7f379f7b2408~gC9P1Jtot2979629796eusmtip24;
 Wed, 17 May 2023 21:34:25 +0000 (GMT)
Message-ID: <45e4370f-fdee-9178-5c15-43205dc02bb9@samsung.com>
Date: Wed, 17 May 2023 23:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
Subject: Re: [PATCH V6 5/6] drm: bridge: samsung-dsim: Dynamically configure
 DPHY timing
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAHCN7xL8qkCgXEE3nZvmwbWGO5GtF+37eOVYq63djGOHDaSdmA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTVxzm3Ht7W7rV3RahZ+IjqY/FLeOhEE42dRtu8yaYRRN1C3u4Bm7A
 jCJrwc1lmQWyIoWxUheR8ioDLKnCupZ2s8pEAmubzs4Wi8pqig7HqEXSYZli1K29e/Dfd77v
 +53vfL8cHi5qIFfwDpSWM/JSaYmE5BO2H+97ni+gmcKMqVAWCvzixtFZfx0XOa98jaFg1zyB
 HtsacXQ5OkeiL3o8HKQNagh016wh0XRHP0CusJ9Ak23XMFTb2M1FY/ZWEoVVlQDNuk1cNHdm
 AiBt+zUOOqEa47ycRPdFghx6xqDE6Rall6DbdU6CHlzQE/QZ3XUu3XK0mUN3nZvBaLOxlqRH
 /F0c2qnxYXRg/BxJB+scGP3lwwy6YcAI6Hnz6l3CfP6WQqbkwCFGnr7tfX5x/fxNbtnM+o8j
 SjuuBA9WqkEiD1JZ0HfBjqsBnyeiegGMGgNETBBRdwH8tXkVK8wDaO79k6sGvPjEV55c1mMA
 sHKujPVEALxS1QtigoDaBpsmfotjgloPQ3eOYywvhK7mqXhAMsVAo8WLx3ASlQ+dPjUnhnFK
 DCemOuL+5dR26Hq4gMUCcErFgYb2qvilJJUJ1bNqMoYTqd0wZFn8Z3gNrLa24Gw1NR8aRtay
 +FXYOnSbZHESDDkGuCxeCd3H6olYAKRqANQ/CGLsQQOgcnoCsK4XYcCzSMbq49RG+I09naVf
 gb4/ajB2K8vg1Vkh+4ZlUGtrwllaAI+qRKx7A9Q5+v+LvXDJh2uARLdkLbol9XVL2uj+z9UD
 wgjETIVCVsQoNpcyH6UppDJFRWlRWsFBmRn8/WXdjxzR70FvKJI2DDAeGAaQh0uWC3Y3FBSK
 BIXSw58w8oP75RUljGIYpPIIiVjw3FZXgYgqkpYzHzBMGSP/V8V4iSuU2CHPEBzMig7mzWmf
 sgbesq6u2X/60823LEdu7/QZR37SjkwTtu7v1oXXbcrw6+8wbakiayu6tEb2wtkPTZ8731HY
 rM0pnDfqLU74KPsHS3FC8mlZMmHS5+458Vm+uNIt7ft9h/kGgTftG9sysKc/DOve9AJoWGVy
 dDZkX99RcktZ/WRTSnb4pmrT01uDO+n0wwlD76HXvdWXRwOnOkWnGjdoEo/kLZa9Jq7t6djb
 ff7tb3O4a3+u6hyLtmYPppiKH3slVy8KIaXP9IY6hDnnn/CcPHk8d7IhL5KwsJF/b++7+lG6
 zzU6KfOP98D7Oalt43bNxXvbb5hSyxtfeqZGnC4hFMXSzGdxuUL6F44ZXwIhBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMKsWRmVeSWpSXmKPExsVy+t/xe7pJHqkpBl8Wq1rcuX2a2WL31W52
 ixPXFzFZ3F/8mcXi/7aJzBZXvr5ns+hdeo7VYtL9CSwWXzZNYLN4Pn8do8XJN1dZLB7Mvclk
 0TlxCbvF5V1z2CzetDUyWrw9vYHd4v3OW4wWk+bdZLWY0XaZ1UHYY+3H+6weL5c3MHvMbrjI
 4jFv1gkWj73fFrB47Jx1l91jdsdMVo/Fe14yeWxa1cnmceTqYlaPExMuMXncubaHzeN+93Em
 j/6/Bh59W1YxenzeJBcgGKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
 k5Kak1mWWqRvl6CX0fP5EXvBS9WKjw27mBsYf8t0MXJwSAiYSEw559TFyMUhJLCUUeLN5l1s
 XYycQHEZiZPTGlghbGGJP9e62CCK3jNKrP1wnB0kwStgJzH91jNGEJtFQFXi1btpTBBxQYmT
 M5+wgNiiAqkSJ5feALOFBaIkTlzqAhvKLCAucevJfLB6EQFniZN/vzGBLGAW6GCV2HX3OjPE
 tiYmiRO7ZzGDVLEJGEp0ve0CO49TIFDi1eZfUJPMJLq2djFC2PISzVtnM09gFJqF5JBZSBbO
 QtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIGpZduxn1t2MK589VHvECMTB+Mh
 RgkOZiUR3sC+5BQh3pTEyqrUovz4otKc1OJDjKbA0JjILCWanA9Mbnkl8YZmBqaGJmaWBqaW
 ZsZK4ryeBR2JQgLpiSWp2ampBalFMH1MHJxSDUwr7swob+3bs0xSTr4jLIXP+KFuXeW/qIZJ
 x6y4Mlv4TW5fO5P1oCz86LeLUw92iraExx/Yevvh/P3HA2+Wfp28yUBzd/OJPRPnrbn/d333
 rKnHz/3imvCpsfKplYv9Gf1y463eTXw6t09olkwzzD1RZy51NlgsdenPrZtOMpvNOHJpqo/T
 qcNrJYwEcvozDku9FJIoE5lWvvaU+OF7NurT795OWs7ytf/AFsEFNUXvmLQ/ztO8eajnxvLD
 uTfjLSwP7pqoMF2Y6c/CE6o3U/kcsisfWZlPTP/4QfRt06Edu2KvJWmWTtea+3DPHDcBkWaX
 1lAVoRW75GZZn1n/ctfyqZ9z/t3Y8tvw4qVTXD0de5RYijMSDbWYi4oTAYHJibC2AwAA
X-CMS-MailID: 20230517213426eucas1p1d45966e8d436a044ab11482610444a7f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230517025535eucas1p2d85f8f2954262ca9e54cc4d7bdb9567a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230517025535eucas1p2d85f8f2954262ca9e54cc4d7bdb9567a
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-6-aford173@gmail.com>
 <CGME20230517025535eucas1p2d85f8f2954262ca9e54cc4d7bdb9567a@eucas1p2.samsung.com>
 <CAHCN7xL8qkCgXEE3nZvmwbWGO5GtF+37eOVYq63djGOHDaSdmA@mail.gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 Frieder Schrempf <frieder.schrempf@kontron.de>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>, Michael Walle <michael@walle.cc>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

On 17.05.2023 04:55, Adam Ford wrote:
> On Mon, May 15, 2023 at 6:57 PM Adam Ford <aford173@gmail.com> wrote:
>> The DPHY timings are currently hard coded. Since the input
>> clock can be variable, the phy timings need to be variable
>> too.  To facilitate this, we need to cache the hs_clock
>> based on what is generated from the PLL.
>>
>> The phy_mipi_dphy_get_default_config_for_hsclk function
>> configures the DPHY timings in pico-seconds, and a small macro
>> converts those timings into clock cycles based on the hs_clk.
>>
>> Signed-off-by: Adam Ford <aford173@gmail.com>
>> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
>> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>> Tested-by: Michael Walle <michael@walle.cc>
>> ---
>>   drivers/gpu/drm/bridge/samsung-dsim.c | 57 +++++++++++++++++++++++----
>>   include/drm/bridge/samsung-dsim.h     |  1 +
>>   2 files changed, 51 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index 08266303c261..3944b7cfbbdf 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -218,6 +218,8 @@
>>
>>   #define OLD_SCLK_MIPI_CLK_NAME         "pll_clk"
>>
>> +#define PS_TO_CYCLE(ps, hz) DIV64_U64_ROUND_CLOSEST(((ps) * (hz)), 1000000000000ULL)
>> +
>>   static const char *const clk_names[5] = {
>>          "bus_clk",
>>          "sclk_mipi",
>> @@ -651,6 +653,8 @@ static unsigned long samsung_dsim_set_pll(struct samsung_dsim *dsi,
>>                  reg = samsung_dsim_read(dsi, DSIM_STATUS_REG);
>>          } while ((reg & DSIM_PLL_STABLE) == 0);
>>
>> +       dsi->hs_clock = fout;
>> +
>>          return fout;
>>   }
>>
>> @@ -698,13 +702,46 @@ static void samsung_dsim_set_phy_ctrl(struct samsung_dsim *dsi)
>>          const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
>>          const unsigned int *reg_values = driver_data->reg_values;
>>          u32 reg;
>> +       struct phy_configure_opts_mipi_dphy cfg;
>> +       int clk_prepare, lpx, clk_zero, clk_post, clk_trail;
>> +       int hs_exit, hs_prepare, hs_zero, hs_trail;
>> +       unsigned long long byte_clock = dsi->hs_clock / 8;
>>
>>          if (driver_data->has_freqband)
>>                  return;
>>
>> +       phy_mipi_dphy_get_default_config_for_hsclk(dsi->hs_clock,
>> +                                                  dsi->lanes, &cfg);
>> +
>> +       /*
>> +        * TODO:
>> +        * The tech reference manual for i.MX8M Mini/Nano/Plus
>> +        * doesn't state what the definition of the PHYTIMING
>> +        * bits are beyond their address and bit position.
>> +        * After reviewing NXP's downstream code, it appears
>> +        * that the various PHYTIMING registers take the number
>> +        * of cycles and use various dividers on them.  This
>> +        * calculation does not result in an exact match to the
>> +        * downstream code, but it is very close, and it appears
>> +        * to sync at a variety of resolutions. If someone
>> +        * can get a more accurate mathematical equation needed
>> +        * for these registers, this should be updated.
>> +        */
> Marek Szyprowski -
>
> I was curious to know if you have any opinion on this TODO note and/or
> if you have any stuff you can share about how the values of the
> following variables are configured?
>> +
>> +       lpx = PS_TO_CYCLE(cfg.lpx, byte_clock);
>> +       hs_exit = PS_TO_CYCLE(cfg.hs_exit, byte_clock);
>> +       clk_prepare = PS_TO_CYCLE(cfg.clk_prepare, byte_clock);
>> +       clk_zero = PS_TO_CYCLE(cfg.clk_zero, byte_clock);
>> +       clk_post = PS_TO_CYCLE(cfg.clk_post, byte_clock);
>> +       clk_trail = PS_TO_CYCLE(cfg.clk_trail, byte_clock);
>> +       hs_prepare = PS_TO_CYCLE(cfg.hs_prepare, byte_clock);
>> +       hs_zero = PS_TO_CYCLE(cfg.hs_zero, byte_clock);
>> +       hs_trail = PS_TO_CYCLE(cfg.hs_trail, byte_clock);
>> +
> These 'work' but they don't exactly match the NXP reference code, but
> they're not significantly different.  The NXP reference manual doesn't
> describe how these registers are set, they only publish the register
> and bits used.  Since you work for Samsung, I was hoping you might
> have inside information to know if this is a reasonable approach.

Unfortunately I won't be able to provide any info on that. You may check 
the reference Samsung code for various Exynos based products, but I 
suspect it will be similar to what was already in the Exynos DSI driver.

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

