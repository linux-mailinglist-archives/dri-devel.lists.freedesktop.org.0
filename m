Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E5472E29B
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 14:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCBB10E05D;
	Tue, 13 Jun 2023 12:15:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B73210E05D
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 12:15:14 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230613121512euoutp02198d41f050c5293716188d601412f5fd~oNvsSc6c92312823128euoutp02J
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 12:15:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230613121512euoutp02198d41f050c5293716188d601412f5fd~oNvsSc6c92312823128euoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1686658512;
 bh=Y3ZNB5D8AVxoBSWeoCf3C/SoDBpipqf/QKoy2s3BHR8=;
 h=Date:Subject:From:To:Cc:In-Reply-To:References:From;
 b=B7wm5ixWroIJbQCNrxd0zNLWaJQRaHIc3+ZBnr0HnBmf5xjRwb3zRjIfrXEA0TnEh
 nCuOkVy0iweygiAziGwSFVNPDBlHqsnwVKxlWcOhcGySQyPH4DdDM8gshANHhj5Uxx
 rj8lHUmR+ePu8EFB0QAqvMIUUlFqltsCU3rczYOE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230613121512eucas1p1410760ed404d847dc9574bf9fa90dc24~oNvsG5s8I0929709297eucas1p1C;
 Tue, 13 Jun 2023 12:15:12 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 76.4D.37758.0DD58846; Tue, 13
 Jun 2023 13:15:12 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230613121511eucas1p2595e0de21fadbafc1f6ffdc5636b9271~oNvrmw3Ie0194501945eucas1p2F;
 Tue, 13 Jun 2023 12:15:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230613121511eusmtrp220be5860b6b8ae4a818b2d62cc3c6736~oNvrl_9MU1045810458eusmtrp2J;
 Tue, 13 Jun 2023 12:15:11 +0000 (GMT)
X-AuditID: cbfec7f5-7ffff7000002937e-29-64885dd05d25
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 68.A0.10549.FCD58846; Tue, 13
 Jun 2023 13:15:11 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230613121510eusmtip1c33b374b07701936d08581bf48011228~oNvqyD9VF2427124271eusmtip1I;
 Tue, 13 Jun 2023 12:15:10 +0000 (GMT)
Message-ID: <c031bff5-6219-adf0-6e73-b688b8de205e@samsung.com>
Date: Tue, 13 Jun 2023 14:15:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH v4 03/68] clk: Move no reparent case into a separate
 function
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
To: Maxime Ripard <maxime@cerno.tech>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <b8d0272d-0193-fe40-3294-9e32a0235323@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAKsWRmVeSWpSXmKPExsWy7djPc7oXYjtSDJbs4rS48vU9m8WqqTtZ
 LKY9aWKx2PT4GqvFx557rBZdv1YyW3Ru2spoMWHVNxaLrS/fMVkcW32FzaLr2hNWiyn7drFZ
 dH6ZxWYx48c/RouLp1wt/l3byOIg4PH+Riu7x51z59k8Nq3qZPO4332cyWPzknqPF5tnMnps
 fLeDyaP/r4HHwX2GHp83yQVwRXHZpKTmZJalFunbJXBlbDgwi7lgv1JF7/lLrA2MO2S7GDk5
 JARMJKYcv8bcxcjFISSwglFiZ8cKKOcLo8Smvd9YIZzPjBJHjk1hgWn5NXMFO4gtJLCcUWL6
 En2Ioo+MEl3fDrKCJHgF7CRuHf3ICGKzCKhKNOxuY4SIC0qcnPkEbJCoQKrE7msHwOqFBYIl
 Lp08AmYzC4hL3HoynwnEZhMwlOh628UGYosIlEr8ezaVBWQZs8BRZomTV24zgyQ4BewlTv/+
 DNUsL9G8dTbYDxIC+zklPnVMYIY420Vi0f5FUC8IS7w6voUdwpaR+L8TZBtIQzujxILf96Gc
 CYwSDc9vMUJUWUvcOfcL6A4OoBWaEut36YOYEgKOEtf6+SFMPokbbwUhbuCTmLRtOjNEmFei
 o00IYoaaxKzj6+C2HrxwiXkCo9IspGCZheT9WUi+mYWwdgEjyypG8dTS4tz01GLjvNRyveLE
 3OLSvHS95PzcTYzARHj63/GvOxhXvPqod4iRiYPxEKMEB7OSCO9TjfYUId6UxMqq1KL8+KLS
 nNTiQ4zSHCxK4rzatieThQTSE0tSs1NTC1KLYLJMHJxSDUzNSTyysVb/DqeItFR/16t8aGDd
 fD0/x8JzclHa9SC/vxuFtqzU/t1m5WbX//FLqwpT+9xX3kYVfFU/LsQH3S54oHl06b8vVslJ
 EVuDktr7dux+3bly6sWfCpu+T3M7GhYiZvGnOSiv3eL3Gh5OiUXOzCu6Q1hXxU+SO30m8+Gy
 gzt6en5XzNT53x7/ZHXEDX03y7QpyZGedbV9T8yLrpXN3PtZN/yJ41QhiXU+Vlc0w2f6ZFRw
 GKrFsE6TKP+yeW6fSqLCTvcnT6QmfDLOa1m7b9qThd3z1qdkStiKTy932X59un7wE0n3vGM5
 pr9cgvNnr/v70uD+spzE3rVTPeI1n8c6F9XqX0l/Ex54W4mlOCPRUIu5qDgRAI8LSEXzAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCIsWRmVeSWpSXmKPExsVy+t/xu7rnYztSDJrbVS2ufH3PZrFq6k4W
 i2lPmlgsNj2+xmrxseceq0XXr5XMFp2btjJaTFj1jcVi68t3TBbHVl9hs+i69oTVYsq+XWwW
 nV9msVnM+PGP0eLiKVeLf9c2sjgIeLy/0crucefceTaPTas62Tzudx9n8ti8pN7jxeaZjB4b
 3+1g8uj/a+BxcJ+hx+dNcgFcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK
 +nY2Kak5mWWpRfp2CXoZGw7MYi7Yr1TRe/4SawPjDtkuRk4OCQETiV8zV7B3MXJxCAksZZT4
 1dXIDpGQkTg5rYEVwhaW+HOtiw2i6D2jxNcFO5lBErwCdhK3jn5kBLFZBFQlGna3MULEBSVO
 znzCAmKLCqRK3F3SzwZiCwsES1w6eQRsKLOAuMStJ/OZQGw2AUOJrrddYDUiAqUSn7fuZAFZ
 xixwlFni58mFjBCbDzBKnDj/G6yKU8Be4vTvz1CTzCS6tnYxQtjyEs1bZzNPYBSaheSQWUgW
 zkLSMgtJywJGllWMIqmlxbnpucWGesWJucWleel6yfm5mxiB0b/t2M/NOxjnvfqod4iRiYPx
 EKMEB7OSCO9TjfYUId6UxMqq1KL8+KLSnNTiQ4ymwNCYyCwlmpwPTD95JfGGZgamhiZmlgam
 lmbGSuK8ngUdiUIC6YklqdmpqQWpRTB9TBycUg1MW61awrfcYU1eYyjbxbQyZWpClsfH+J1C
 39nkK64/Uj2iV73xttj/XXNPzvwTINB1eEeI0P6Su7ah1kpqHOqKz1T2bGZbF8snuXPNrtTs
 7KyWzhOxz3/H3X3BGZcYY1yStD7WP9isfYXzXB/+w/M75Vp7Amey2k54NT2J+9i7yc48Yqfl
 YrV8mv2unBf35S46eP7ywRI+2bU5biefn2jb/j777/LkJQ4zXHIrJ/AtzFxhPbPhguj2zdPN
 91xht/GxK2fmytuXudEgYnZpc8eHUzfitrpOyY+Z/TDNJ3XNp4f3Hm+7m7Dyof7JZBsxS3vl
 unU3wj4tVXle+mO1yTe91a4BH5T/RB2TEmWflztLiaU4I9FQi7moOBEA7ZGLmYcDAAA=
X-CMS-MailID: 20230613121511eucas1p2595e0de21fadbafc1f6ffdc5636b9271
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230613121511eucas1p2595e0de21fadbafc1f6ffdc5636b9271
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230613121511eucas1p2595e0de21fadbafc1f6ffdc5636b9271
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-3-971d5077e7d2@cerno.tech>
 <b8d0272d-0193-fe40-3294-9e32a0235323@samsung.com>
 <CGME20230613121511eucas1p2595e0de21fadbafc1f6ffdc5636b9271@eucas1p2.samsung.com>
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
Cc: linux-rtc@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linux-phy@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13.06.2023 13:15, Marek Szyprowski wrote:
> On 05.05.2023 13:25, Maxime Ripard wrote:
>> From: Stephen Boyd <sboyd@kernel.org>
>>
>> We'll need to turn the code in clk_mux_determine_rate_flags() to deal
>> with CLK_SET_RATE_NO_REPARENT into a helper clock drivers will be able
>> to use if they don't want to allow reparenting.
>>
>> Cc: Abel Vesa <abelvesa@kernel.org>
>> Cc: Alessandro Zummo <a.zummo@towertech.it>
>> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
>> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
>> Cc: "Andreas Färber" <afaerber@suse.de>
>> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
>> Cc: Chen-Yu Tsai <wens@csie.org>
>> Cc: Chen-Yu Tsai <wenst@chromium.org>
>> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
>> Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
>> Cc: Daniel Vetter <daniel@ffwll.ch>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: David Lechner <david@lechnology.com>
>> Cc: Dinh Nguyen <dinguyen@kernel.org>
>> Cc: Fabio Estevam <festevam@gmail.com>
>> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
>> Cc: Jaroslav Kysela <perex@perex.cz>
>> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
>> Cc: Jonathan Hunter <jonathanh@nvidia.com>
>> Cc: Kishon Vijay Abraham I <kishon@kernel.org>
>> Cc: Liam Girdwood <lgirdwood@gmail.com>
>> Cc: Linus Walleij <linus.walleij@linaro.org>
>> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Cc: Manivannan Sadhasivam <mani@kernel.org>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: Markus Schneider-Pargmann <msp@baylibre.com>
>> Cc: Max Filippov <jcmvbkbc@gmail.com>
>> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
>> Cc: Mikko Perttunen <mperttunen@nvidia.com>
>> Cc: Miles Chen <miles.chen@mediatek.com>
>> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
>> Cc: Orson Zhai <orsonzhai@gmail.com>
>> Cc: Paul Cercueil <paul@crapouillou.net>
>> Cc: Peng Fan <peng.fan@nxp.com>
>> Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
>> Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
>> Cc: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Cc: Samuel Holland <samuel@sholland.org>
>> Cc: Sascha Hauer <s.hauer@pengutronix.de>
>> Cc: Sekhar Nori <nsekhar@ti.com>
>> Cc: Shawn Guo <shawnguo@kernel.org>
>> Cc: Takashi Iwai <tiwai@suse.com>
>> Cc: Thierry Reding <thierry.reding@gmail.com>
>> Cc: Ulf Hansson <ulf.hansson@linaro.org>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: linux-actions@lists.infradead.org
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-mips@vger.kernel.org
>> Cc: linux-phy@lists.infradead.org
>> Cc: linux-renesas-soc@vger.kernel.org
>> Cc: linux-rtc@vger.kernel.org
>> Cc: linux-stm32@st-md-mailman.stormreply.com
>> Cc: linux-sunxi@lists.linux.dev
>> Cc: linux-tegra@vger.kernel.org
>> Cc: NXP Linux Team <linux-imx@nxp.com>
>> Cc: patches@opensource.cirrus.com
>> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
>> Signed-off-by: Stephen Boyd <sboyd@kernel.org>
>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>> ---
>
> This patch landed in today's linux-next as commit 1b4e99fda73f ("clk: 
> Move no reparent case into a separate function"). Unfortunately it 
> causes serious regression of some of my test boards. Namely Exynos3250 
> based boards are so slow after it, that my test scripts fail with a 
> timeout waiting for them to finish booting. I will try to debug this 
> later in the evening to check what has happened that some clocks got 
> very low rate.
>
I just got a few spare minutes, so I decided to take a look into this 
issue. The following change fixed my problem:

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index ffc9f03840b7..7ac9f7a8cb84 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -629,6 +629,7 @@ clk_core_determine_rate_no_reparent(struct clk_hw *hw,
                 best = clk_core_get_rate_nolock(core);
         }

+       req->best_parent_rate = best;
         req->rate = best;

         return 0;

best_parent_rate is still being used somewhere in the code and needs to 
be updated regardless of the CLK_SET_RATE_NO_REPARENT flag.

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

