Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F19C264C495
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 09:05:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6E0210E219;
	Wed, 14 Dec 2022 08:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E46A10E1F9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 08:04:50 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221214080445euoutp029b19516a9024faef24b542787751ba3d~wmkW3sPMK1098810988euoutp02D
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 08:04:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221214080445euoutp029b19516a9024faef24b542787751ba3d~wmkW3sPMK1098810988euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1671005086;
 bh=svw232PTOpVg+KofjEwoQnHvl7QWujvzcYIFg3G3qM0=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=bPsj5UD4OCKQuPqvD/3vAbOcgtDxcR1IHwqDMba8pl8FMRCKs1Wbu1JraLR9yzAj8
 2Ye7HgnGeKAORco2UFoUATkm5o3AeKjzyDF/OBecMz+gbtCS3DwJ9pv07LoqBbbemz
 dQoFPO8OgzySiggKRzBehhAdJ/YjQNnCbOiKbreY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221214080445eucas1p17f6ca8bc855eea400d54a40a2e8bcf7b~wmkWgFLyX0417104171eucas1p1q;
 Wed, 14 Dec 2022 08:04:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id A2.BF.09549.D9389936; Wed, 14
 Dec 2022 08:04:45 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20221214080445eucas1p2e9e92b27621cf6124e5cb791338284a4~wmkV_ZQWV0195201952eucas1p20;
 Wed, 14 Dec 2022 08:04:45 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20221214080445eusmtrp1dc86665a63c57bd06425c4e61e017b88~wmkV9e0Dk1050310503eusmtrp1x;
 Wed, 14 Dec 2022 08:04:45 +0000 (GMT)
X-AuditID: cbfec7f5-f5dff7000000254d-c1-6399839d280a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F3.14.08916.C9389936; Wed, 14
 Dec 2022 08:04:44 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221214080443eusmtip289f2cf627c6a8560dcf1abb062cb4d5c~wmkU00GKd2412424124eusmtip2z;
 Wed, 14 Dec 2022 08:04:43 +0000 (GMT)
Message-ID: <0afa7602-a549-5c6c-93a1-855aa88562e0@samsung.com>
Date: Wed, 14 Dec 2022 09:04:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host
 for first DSI transfer
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZAG7F_j8HWSot=auf15yrtVtz-Ur5HV6mop4OaL2qc-aQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfVCTdRy/3/O2sWvcs4njdyZx7Y4yK0zx5IcUvdn1eFnidfxRXi8TnkNi
 DG5zVPbGMIHG0gk7c4+m5NANfOGYNqQzJEI3HBsBCjmgReLLBsN4WSFeK7bHiv8+38/n+7nv
 9/O9rxCXmqhlwgLVDlatUijllIhwXLrrffLrXebcpwx9SWh4yI0jv2WGQONDNgpdCd+h0JfH
 vCSq8RsJNGs3Uuj2L70E8pRPCNAX++oFyGpso5D9+gCJ9PMNODrQ04ahiQodQO7fmnB0Wbeb
 QH2mHyk0zY0uqLUBCvW6pnH05z0P/pyMOTXlJ5nDnItgTK5OkvEaRiimlRsRMAerzCRjOR/A
 mM6rFpIZHjhPMf5qJ8acqf+MaZ48hzF7zjYCZsb+UHb8m6Kn81hlQSmrXpX1rmj7td4NJa1v
 fGD5qx0vA6cYPYgTQnotbAkdovRAJJTSNgDnBqsFUUFKzwLovvspL8wAeNNXsSAIY4655hd4
 3gpgoPsgxhdTAHLdtphbTGdBridCRDFBp8C2/f33eQnsMo/F+KV0Hmxv9WBRvITeBidNvBen
 E6Fv7EiMT6Afh3+Yx2Pr4XSYgkccLhAVKHo11If0VBTH0VvgYGuQ5M3J0Tx41ADpPSIYvngD
 54NugCfr/AIeL4FB59n7eDl01xoI3lAJYN09P8YXRgDLbvkA35UJh73zVPQAOP0YbPpuFU8/
 DwOdIyR/l3j4c0jCLxEPaxxf4TwthlUVUr77Ecg5T/839oef+nAjkHOL7sItys8tisP9P7cO
 EI0gkdVqivJZTZqKfT9VoyjSaFX5qbnFRXaw8LjuiDN8DtiCU6kdABOCDgCFuDxBnLJif65U
 nKf4cCerLn5HrVWymg7woJCQJ4ptpqpcKZ2v2MEWsmwJq/5XxYRxy8qw483EbNcab876TzaW
 BOfXPFNJc5JrzmPpZ2TOwuJ9WpuoOkIGJzIUc5nl1Mvv1RdpLA7f3rRvmgYb8py6laEtGenf
 b+OuVhTYC3N0A9KlkSsndVqRviuu8/Co1rBZ9qoxPNreUAqnLza+FGDHvA5jzeUTL+7ctWn6
 0beHPKzHLpcl9a9NZJOfKDtamS2SDLTdzLAeGn/L43tg+RR3It2w7vjrWeWZp7MvvJKzwnV7
 67eby7ceSA699ntkUnRHo/b9fWNO58p+OP3zke56KWmVqPocSos1Y+9HhnUh5a1nr9PrP55N
 GUoyt/zKVaYdlfWYLmzaXdpfNdpVa7C1UJcSMuWEZrti9UpcrVH8A9mUAGsnBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xe7pzmmcmGzR9N7K4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
 0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFpSmH2Sw+zXoIlJ38ks3i4olPzBbff59ldhDz
 WPvxPqvHvFknWDymnDjC6nGu5y6bx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH
 5iX1Hhvf7WDy6NuyitHj8ya5AL4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsj
 UyV9O5uU1JzMstQifbsEvYybF10KdkZWLP57gLmBca1HFyMHh4SAicSPjU5djJwcQgJLGSWO
 PkoAsSUEZCROTmtghbCFJf5c62LrYuQCqnnPKPGt8TATSIJXwE5i1vl/LCA2i4CqxL5pl9kh
 4oISJ2c+AYuLCqRItPf8A6sXFkiS2DdlERuIzSwgLnHryXywuIiAtsS3ma/BFjALfGeTmPl9
 CgvERafYJXZtjgax2QQMJbredoE1cwoESlzf+YoVYpCZRNfWLkYIW15i+9s5zBMYhWYhuWMW
 kn2zkLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmB62Xbs5+YdjPNefdQ7xMjE
 wXiIUYKDWUmEV1VjWrIQb0piZVVqUX58UWlOavEhRlNgYExklhJNzgcmuLySeEMzA1NDEzNL
 A1NLM2MlcV7Pgo5EIYH0xJLU7NTUgtQimD4mDk6pBqa8LyfFy9gu9XfxCAfoqopGMMvo/JaK
 4f3f4Na9rqgunlnTTeJClPX/H8WnDn7Yu7HJ1dFi2+GVwmd+cQfvC7jAu0F9epvehKmfSid6
 rHnW2cjI/GN6s32AQ+P0gI9qLs/LZBjPX/RbO3nupyV7Kk+mHCk5ZMD2OWg++5XFubsFymZL
 pp/j89Wrdtsan/jEcd4+sXvHD5nmX5uhN+PTqVedd4509chsWPvxmSBbd4Rp/FGV3+/L5Ta8
 kzx2qpc1Qm5+GE/R9ttCz0WaTsu9Ozj7G0NnSQmrYuzWO+Yzl8aZVT18//C37Itn916/n8yQ
 O0e+5bS2nWrwuRlMs6ad7v1ydoXcrRf971a1287Pq9VRYinOSDTUYi4qTgQAhuOAibgDAAA=
X-CMS-MailID: 20221214080445eucas1p2e9e92b27621cf6124e5cb791338284a4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221214080445eucas1p2e9e92b27621cf6124e5cb791338284a4
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221214080445eucas1p2e9e92b27621cf6124e5cb791338284a4
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
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
 <7e0ba9fb-387d-6bf7-585e-9fc79de31bd8@samsung.com>
 <CAMty3ZAG7F_j8HWSot=auf15yrtVtz-Ur5HV6mop4OaL2qc-aQ@mail.gmail.com>
 <CGME20221214080445eucas1p2e9e92b27621cf6124e5cb791338284a4@eucas1p2.samsung.com>
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

On 14.12.2022 06:33, Jagan Teki wrote:
> On Tue, Dec 13, 2022 at 9:11 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 13.12.2022 16:15, Jagan Teki wrote:
>>> On Tue, Dec 13, 2022 at 8:24 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 13.12.2022 15:18, Jagan Teki wrote:
>>>>> On Tue, Dec 13, 2022 at 7:31 PM Marek Szyprowski
>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>> On 13.12.2022 13:20, Marek Szyprowski wrote:
>>>>>>> On 13.12.2022 11:40, Jagan Teki wrote:
>>>>>>>> On Tue, Dec 13, 2022 at 2:28 PM Marek Szyprowski
>>>>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>>>>> On 12.12.2022 16:33, Jagan Teki wrote:
>>>>>>>>>
>>>>>>>>> On Mon, Dec 12, 2022 at 8:52 PM Marek Szyprowski
>>>>>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>>>>>
>>>>>>>>> On 12.12.2022 09:43, Marek Szyprowski wrote:
>>>>>>>>>
>>>>>>>>> On 12.12.2022 09:32, Jagan Teki wrote:
>>>>>>>>>
>>>>>>>>> On Mon, Dec 12, 2022 at 1:56 PM Marek Szyprowski
>>>>>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>>>>>
>>>>>>>>> Hi Jagan,
>>>>>>>>>
>>>>>>>>> On 09.12.2022 16:23, Jagan Teki wrote:
>>>>>>>>>
>>>>>>>>> The existing drm panels and bridges in Exynos required host
>>>>>>>>> initialization during the first DSI command transfer even though
>>>>>>>>> the initialization was done before.
>>>>>>>>>
>>>>>>>>> This host reinitialization is handled via DSIM_STATE_REINITIALIZED
>>>>>>>>> flag and triggers from host transfer.
>>>>>>>>>
>>>>>>>>> Do this exclusively for Exynos.
>>>>>>>>>
>>>>>>>>> Initial logic is derived from Marek Szyprowski changes.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>>>>>> ---
>>>>>>>>> Changes from v9:
>>>>>>>>> - derived from v8
>>>>>>>>> - added comments
>>>>>>>>>
>>>>>>>>>        drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++++-
>>>>>>>>>        include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>>>>>>>        2 files changed, 17 insertions(+), 3 deletions(-)
>>>>>>>>>
>>>>>>>>> The following chunk is missing compared to v8:
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>> index 6e9ad955ebd3..6a9403cb92ae 100644
>>>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>> @@ -1315,7 +1315,9 @@ static int samsung_dsim_init(struct samsung_dsim
>>>>>>>>> *dsi, unsigned int flag)
>>>>>>>>>                       return 0;
>>>>>>>>>
>>>>>>>>>               samsung_dsim_reset(dsi);
>>>>>>>>> -       samsung_dsim_enable_irq(dsi);
>>>>>>>>> +
>>>>>>>>> +       if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>>>>>>>> +               samsung_dsim_enable_irq(dsi);
>>>>>>>>>
>>>>>>>>> Is this really required? does it make sure that the IRQ does not
>>>>>>>>> enable twice?
>>>>>>>>>
>>>>>>>>> That's what that check does. Without the 'if (!(dsi->state &
>>>>>>>>> DSIM_STATE_INITIALIZED))' check, the irqs will be enabled twice (first
>>>>>>>>> from pre_enable, then from the first transfer), what leads to a
>>>>>>>>> warning from irq core.
>>>>>>>>>
>>>>>>>>> I've just noticed that we also would need to clear the
>>>>>>>>> DSIM_STATE_REINITIALIZED flag in dsim_suspend.
>>>>>>>>>
>>>>>>>>> However I've found that a bit simpler patch would keep the current code
>>>>>>>>> flow for Exynos instead of this reinitialization hack. This can be
>>>>>>>>> applied on the "[PATCH v9 09/18] drm: bridge: samsung-dsim: Add host
>>>>>>>>> init in pre_enable" patch:
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>> index 0b2e52585485..acc95c61ae45 100644
>>>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>>>>> @@ -1291,9 +1291,11 @@ static void
>>>>>>>>> samsung_dsim_atomic_pre_enable(struct
>>>>>>>>> drm_bridge *bridge,
>>>>>>>>>
>>>>>>>>>              dsi->state |= DSIM_STATE_ENABLED;
>>>>>>>>>
>>>>>>>>> -       ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>>>>>>>> -       if (ret)
>>>>>>>>> -               return;
>>>>>>>>> +       if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
>>>>>>>>> +               ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>>>>>>>> +               if (ret)
>>>>>>>>> +                       return;
>>>>>>>>> +       }
>>>>>>>>>
>>>>>>>>> Sorry, I don't understand this. Does it mean Exynos doesn't need to
>>>>>>>>> init host in pre_enable? If I remember correctly even though the host
>>>>>>>>> is initialized it has to reinitialize during the first transfer - This
>>>>>>>>> is what the Exynos requirement is. Please correct or explain here.
>>>>>>>>>
>>>>>>>>> This is a matter of enabling power regulator(s) in the right order
>>>>>>>>> and doing the host initialization in the right moment. It was never
>>>>>>>>> a matter of re-initialization. See the current code for the
>>>>>>>>> reference (it uses the same approach as my above change). I've
>>>>>>>>> already explained that here:
>>>>>>>>>
>>>>>>>>> https://lore.kernel.org/all/e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com/
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> If you would like to see the exact proper moment of the dsi host
>>>>>>>>> initialization on the Exynos see the code here:
>>>>>>>>>
>>>>>>>>> https://protect2.fireeye.com/v1/url?k=5dc33900-0258001f-5dc2b24f-000babdfecba-f7c1a2a1905c83ca&q=1&e=f086bfdb-9055-48bd-b9c2-5dffb6c0d558&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv5.18-next-20220511-dsi-rework
>>>>>>>>> and patches adding mipi_dsi_host_init() to panel/bridge drivers.
>>>>>>>> As I said before, the downstream bridge needs an explicit call to host
>>>>>>>> init via mipi_dsi_host_init - this is indeed not a usual use-case
>>>>>>>> scenario. Let's handle this with a REINIT fix and see if we can update
>>>>>>>> this later to handle both scenarios.
>>>>>>>>
>>>>>>>> Would you please test this repo, I have included all.
>>>>>>>>
>>>>>>>> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>>>>>>> This doesn't work on TM2e board. Give me some time to find why...
>>>>>>>
>>>>>> The following change is missing in "drm: bridge: Generalize Exynos-DSI
>>>>>> driver into a Samsung DSIM bridge" patch:
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>> index 1dbff2bee93f..81828b5ee0ac 100644
>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>>> @@ -1745,6 +1745,7 @@ int samsung_dsim_probe(struct platform_device *pdev)
>>>>>>             dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
>>>>>>             dsi->bridge.of_node = dev->of_node;
>>>>>>             dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>>>>>> +       dsi->bridge.pre_enable_prev_first = true;
>>>>> Can you check this and confirm, I keep this in exynos side.
>>>>> https://gitlab.com/openedev/kernel/-/commit/ccb02df7a313fdf91d8e116b0ec3d6c945fbb6fd#c93f0ce4d81b854fbde970e341fb307f1be78c16_1865_189
>>>> This one is fine!
>>>>
>>>>>>             /* DE_LOW: i.MX8M Mini/Nano LCDIF-DSIM glue logic inverts
>>>>>> HS/VS/DE */
>>>>>>             if (dsi->plat_data->hw_type == DSIM_TYPE_IMX8MM)
>>>>>>
>>>>>>
>>>>>> After adding the above, all my test platform works fine.
>>>>>>
>>>>>> BTW, I still think that it is worth replacing the "drm: exynos: dsi: Add
>>>>>> host initialization in pre_enable" patch with the following simple
>>>>>> change and propagate it to bridge/samsung-dsim.c:
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>>> b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>>> index fdaf514b39f2..071b74d60dcb 100644
>>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>>> @@ -254,6 +254,9 @@ struct exynos_dsi_transfer {
>>>>>>      #define DSIM_STATE_CMD_LPM             BIT(2)
>>>>>>      #define DSIM_STATE_VIDOUT_AVAILABLE    BIT(3)
>>>>>>
>>>>>> +#define exynos_dsi_hw_is_exynos(hw) \
>>>>>> +       ((hw) >= DSIM_TYPE_EXYNOS3250 && (hw) <= DSIM_TYPE_EXYNOS5433)
>>>>>> +
>>>>>>      enum exynos_dsi_type {
>>>>>>             DSIM_TYPE_EXYNOS3250,
>>>>>>             DSIM_TYPE_EXYNOS4210,
>>>>>> @@ -1344,6 +1347,9 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
>>>>>>      {
>>>>>>             const struct exynos_dsi_driver_data *driver_data =
>>>>>> dsi->driver_data;
>>>>>>
>>>>>> +       if (dsi->state & DSIM_STATE_INITIALIZED)
>>>>>> +               return 0;
>>>>>> +
>>>>>>             exynos_dsi_reset(dsi);
>>>>>>             exynos_dsi_enable_irq(dsi);
>>>>>>
>>>>>> @@ -1356,6 +1362,8 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
>>>>>>             exynos_dsi_set_phy_ctrl(dsi);
>>>>>>             exynos_dsi_init_link(dsi);
>>>>>>
>>>>>> +       dsi->state |= DSIM_STATE_INITIALIZED;
>>>>>> +
>>>>>>             return 0;
>>>>>>      }
>>>>>>
>>>>>> @@ -1411,6 +1419,12 @@ static void exynos_dsi_atomic_pre_enable(struct
>>>>>> drm_bridge *bridge,
>>>>>>             }
>>>>>>
>>>>>>             dsi->state |= DSIM_STATE_ENABLED;
>>>>>> +
>>>>>> +       if (!exynos_dsi_hw_is_exynos(dsi->plat_data->hw_type)) {
>>>>>> +               ret = exynos_dsi_init(dsi);
>>>>>> +               if (ret)
>>>>>> +                       return;
>>>>>> +       }
>>>>>>      }
>>>>>>
>>>>>>      static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
>>>>>> @@ -1557,12 +1571,9 @@ static ssize_t exynos_dsi_host_transfer(struct
>>>>>> mipi_dsi_host *host,
>>>>>>             if (!(dsi->state & DSIM_STATE_ENABLED))
>>>>>>                     return -EINVAL;
>>>>>>
>>>>>> -       if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
>>>>>> -               ret = exynos_dsi_init(dsi);
>>>>>> -               if (ret)
>>>>>> -                       return ret;
>>>>>> -               dsi->state |= DSIM_STATE_INITIALIZED;
>>>>>> -       }
>>>>>> +       ret = exynos_dsi_init(dsi);
>>>>>> +       if (ret)
>>>>>> +               return ret;
>>>>> Below patch handling similar behavior by checking exynos hw_type at
>>>>> exynos_dsi_init, isn't it? Please check and let me know if I missing
>>>>> anything.
>>>>>
>>>>> https://gitlab.com/openedev/kernel/-/commit/d19d491eef92b92e12a26265697274ce666eddb5
>>>> You don't miss anything. Your version also works, but I just proposed a
>>>> bit simpler code.
>>> Do your changes don't need a DSIM_STATE_REINITIALIZED flag? would you
>>> please share the change on top of this commit?
>>> https://gitlab.com/openedev/kernel/-/commit/d19d491eef92b92e12a26265697274ce666eddb5
>> It doesn't need the DSIM_STATE_REINITIALIZED flag because the
>> initialization is done only once - in pre_enable for non-Exynos case and
>> on the first transfer for the Exynos case. In both cases the same flag
>> (DSIM_STATE_INITIALIZED) is used.
>>
>> See the attached patch.
> Thanks, I have included the changes and added your authorship as well.
>
> Please test this final version and let me know if you have any comments.
> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10


Fine for me.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

