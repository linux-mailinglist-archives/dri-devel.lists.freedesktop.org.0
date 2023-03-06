Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 680AD6AD1C9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 23:41:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C3A10E420;
	Mon,  6 Mar 2023 22:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA47710E420
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 22:41:41 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230306224139euoutp01eb88480fe7257ced76077699f71adb38~J9bZnRmHV1679916799euoutp01C
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 22:41:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230306224139euoutp01eb88480fe7257ced76077699f71adb38~J9bZnRmHV1679916799euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678142499;
 bh=MkBJ3b14GdDuD7di/1Akr52MtlkdS8/BBLXqR5RQqAk=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=Lukh/NBy5Z56PgWnqt5WUBWzL4c++iT4xgsgrBvl+CUxcf4M8/9zdwxmYWBmnfbQZ
 QDrt7xRTJSfRWrBWvpymfq+BKUKe3wG5j/fRaQ/abHnc+AEvwhBJZOu0TOonXgngh/
 qxxmB8jMSXh8JOsUavg75s5br2uu1hJgqaRPIndo=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230306224138eucas1p23fa9bcb61c5935509553993cf8ad2cff~J9bYkjaG21174611746eucas1p27;
 Mon,  6 Mar 2023 22:41:38 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id B8.81.10014.22C66046; Mon,  6
 Mar 2023 22:41:38 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230306224137eucas1p260bf2c9e48a1d89c69b3519e1a883993~J9bXZl1710171001710eucas1p2I;
 Mon,  6 Mar 2023 22:41:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230306224137eusmtrp299edce405f4bb4e8d0c0302e1e79cb74~J9bXY_C240525705257eusmtrp2B;
 Mon,  6 Mar 2023 22:41:37 +0000 (GMT)
X-AuditID: cbfec7f5-ba1ff7000000271e-51-64066c22264a
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D1.66.08862.12C66046; Mon,  6
 Mar 2023 22:41:37 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230306224114eusmtip154d69c1f4aeb6b0f07ffcfb45a28eed0~J9bBoI_9h2820628206eusmtip1W;
 Mon,  6 Mar 2023 22:41:12 +0000 (GMT)
Message-ID: <44e40894-b0f6-2a00-2bea-4f99c3595e3a@samsung.com>
Date: Mon, 6 Mar 2023 23:41:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZDiBERymX=jgM_dtDBbd_rvw9E4Q05ECy+dtpnZa2nkJw@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOKsWRmVeSWpSXmKPExsWy7djP87pKOWwpBpdn6FjcuX2a2eL+4s8s
 Fle+vmez6F16jtVi0v0JLBZfNk1gszjb9IbdYvmEfWwWM87vY7J409bIaHH60Xpmi7bOZawW
 73feYrSYMfklm8XFE5+YHfg91n68z+oxb9YJFo8pJ46wepzrucvmsXPWXXaPxXteMnlsWtXJ
 5nHk6mJWjzvX9rB53O8+zuTRt2UVo8fnTXIBPFFcNimpOZllqUX6dglcGZPXzmEqOG1YcbPj
 F1sD4zv1LkZODgkBE4kZh/4xdTFycQgJrGCU2HmwiQXC+cIo8XnrJXaQKiGBz4wSjz+ywnTs
 f3OADaJoOaNE7/x5UO0fGSW+HZrBCFLFK2AncfzLTmYQm0VAReLO8k52iLigxMmZT1hAbFGB
 FIkd53eDxYUFHCTOrzgK1sssIC5x68l8JhBbREBb4tvM12wQ8bUsEt+u+ILYbAKGEl1vu4Di
 HBycAoESHcdZIErkJZq3zmaGOPQcp8SdvSEQtovEyv17oOLCEq+Ob2GHsGUk/u+cD3a/hEA7
 o8SC3/ehnAmMEg3PbzFCVFlL3Dn3C2wZs4CmxPpd+hBhR4kLN1ayg4QlBPgkbrwVhLiBT2LS
 tunMEGFeiY42IYhqNYlZx9fBrT144RLzBEalWUiBMgvJ87OQfDMLYe8CRpZVjOKppcW56anF
 xnmp5XrFibnFpXnpesn5uZsYgWnx9L/jX3cwrnj1Ue8QIxMH4yFGCQ5mJRHeqt+sKUK8KYmV
 ValF+fFFpTmpxYcYpTlYlMR5tW1PJgsJpCeWpGanphakFsFkmTg4pRqY0rTnlZoY7hBPWu73
 wTRCc6tX0MYFSXpmnV8ifoakrCu8nfFBr33Jray+lVMEufyYn19s/PT3gW6uV/qnSjPWv0/6
 YipnL+tdFKjw4pHpMo6t377dsvI7MCs/O+jzgpNy117+z50QmxlXqP7FvO3Qgi9q6jwSTJWd
 V9d9zrX22XY/YN4UmeV3FTcE76otMZn3ZMbOH9wOOxwzjn54nSRXyrLL/Yqw/atdPg8iPZq3
 xO95x5Of0cY6d/l0k+LOnM1XU1df9d5ayG87L/dCrbST67bXv1Rvy55dPqUzRZdN+KDoryez
 ggpnvkt+IGaw6apoXl9eTbvwD4tLShKXb2zvs63b9vFlWqPg1J1JKczXlViKMxINtZiLihMB
 mtrGK/oDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNIsWRmVeSWpSXmKPExsVy+t/xu7qKOWwpBr3NEhZ3bp9mtri/+DOL
 xZWv79ksepeeY7WYdH8Ci8WXTRPYLM42vWG3WD5hH5vFjPP7mCzetDUyWpx+tJ7Zoq1zGavF
 +523GC1mTH7JZnHxxCdmB36PtR/vs3rMm3WCxWPKiSOsHud67rJ57Jx1l91j8Z6XTB6bVnWy
 eRy5upjV4861PWwe97uPM3n0bVnF6PF5k1wAT5SeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJ
 pZ6hsXmslZGpkr6dTUpqTmZZapG+XYJexuS1c5gKThtW3Oz4xdbA+E69i5GTQ0LARGL/mwNs
 XYxcHEICSxklnlxtYIdIyEicnNbACmELS/y51gVV9J5R4vvZc2AJXgE7ieNfdjKD2CwCKhJ3
 lneyQ8QFJU7OfMLSxcjBISqQIjG7SwckLCzgIHF+xVFGEJtZQFzi1pP5TCC2iIC2xLeZr8Hm
 MwusZ5H4t3UCM8SybmaJG0svgHWwCRhKdL0FuYKDg1MgUKLjOAvEIDOJrq1dUEPlJZq3zmae
 wCg0C8kZs5Dsm4WkZRaSlgWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECU8G2Yz8372Cc
 9+qj3iFGJg7GQ4wSHMxKIrxVv1lThHhTEiurUovy44tKc1KLDzGaAsNiIrOUaHI+MBnllcQb
 mhmYGpqYWRqYWpoZK4nzehZ0JAoJpCeWpGanphakFsH0MXFwSjUwMayuPz2zmOv8c+snVv8f
 3n2/ZXtbZ9Ep9Q0vDMJuy/Fu6Ugt3Xk6cs2NDSr+dh9nrd2i7Wnz9LWpwYMplwQfMMx/zrCk
 W+O++NHNLZc2s5+pm1MU+sAiVuvY238aDNknfz3b4P+zrsH1hnxey73gZoPbnvsE8zdM+v2S
 MVdC/ui9XxtnH99UbS4hn/t4W+bG5D2CD8uVWNZ71V+s+D/hdVAK7/tIjX/vmL2v+z/YXd2a
 L7QixC99xYcV4rcfzj96s7zcPuXRFfv20g11135PTTFm/XZAM8VgRke27vUwBYusuCMVnq3u
 GVOtvmW0Spe8v3bp+PrjxmE9HyuE+efpN212k/XS+NpyPqX88kYZUyWW4oxEQy3mouJEAFOZ
 oSWOAwAA
X-CMS-MailID: 20230306224137eucas1p260bf2c9e48a1d89c69b3519e1a883993
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230303145219eucas1p218c2e302e41464432627c8ac074302f8
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230303145219eucas1p218c2e302e41464432627c8ac074302f8
References: <CGME20230303145219eucas1p218c2e302e41464432627c8ac074302f8@eucas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
 <79c2e5cc-a488-09ae-dc68-18dbc47d963a@samsung.com>
 <CAMty3ZC1U3eDmtWa_sx0Sop_V1vU3fSM=r21U9qPf0UmCYTOkA@mail.gmail.com>
 <4b2624f6-b904-4daa-29ca-380cc7dbfc45@samsung.com>
 <CAMty3ZDiBERymX=jgM_dtDBbd_rvw9E4Q05ECy+dtpnZa2nkJw@mail.gmail.com>
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
 linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Jagan,

On 06.03.2023 18:24, Jagan Teki wrote:
> On Mon, Mar 6, 2023 at 4:32 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 04.03.2023 19:59, Jagan Teki wrote:
>>> On Sat, Mar 4, 2023 at 3:56 AM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 03.03.2023 15:51, Jagan Teki wrote:
>>>>> This series supports common bridge support for Samsung MIPI DSIM
>>>>> which is used in Exynos and i.MX8MM SoC's.
>>>>>
>>>>> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
>>>>>
>>>>> Inki Dae: please note that this series added on top of exynos-drm-next
>>>>> since few exynos dsi changes are not been part of drm-misc-next.
>>>>> Request you to pick these via exynos-drm-next, or let me know if you
>>>>> have any comments?
>>>> I gave it a try on Exynos TM2e and unfortunately it nukes again:
>>>>
>>>> exynos-drm exynos-drm: bound 13970000.hdmi (ops hdmi_component_ops)
>>>> Unable to handle kernel paging request at virtual address 003d454d414e5675
>>>> ...
>>>> [003d454d414e5675] address between user and kernel address ranges
>>>> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>>>> Modules linked in:
>>>> CPU: 4 PID: 9 Comm: kworker/u16:0 Not tainted 6.2.0-next-20230303+ #13341
>>>> Hardware name: Samsung TM2E board (DT)
>>>> Workqueue: events_unbound deferred_probe_work_func
>>>> pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>> pc : drm_connector_list_iter_next+0x58/0x100
>>>> lr : drm_connector_list_iter_next+0x2c/0x100
>>>> sp : ffff80000bbab910
>>>> ...
>>>> Call trace:
>>>>     drm_connector_list_iter_next+0x58/0x100
>>>>     drm_mode_config_reset+0xfc/0x144
>>>>     exynos_drm_bind+0x160/0x1b8
>>>>     try_to_bring_up_aggregate_device+0x168/0x1d4
>>>>     __component_add+0xa8/0x170
>>>>     component_add+0x14/0x20
>>>>     hdmi_probe+0x3fc/0x6d4
>>>>     platform_probe+0x68/0xd8
>>>>     really_probe+0x148/0x2b4
>>>>     __driver_probe_device+0x78/0xe0
>>>>     driver_probe_device+0xd8/0x160
>>>>     __device_attach_driver+0xb8/0x138
>>>>     bus_for_each_drv+0x84/0xe0
>>>>     __device_attach+0xa8/0x1b0
>>>>     device_initial_probe+0x14/0x20
>>>>     bus_probe_device+0xb0/0xb4
>>>>     deferred_probe_work_func+0x8c/0xc8
>>>>     process_one_work+0x288/0x6c8
>>>>     worker_thread+0x24c/0x450
>>>>     kthread+0x118/0x11c
>>>>     ret_from_fork+0x10/0x20
>>> This looks not related to dsi to me since there is no exynos_drm_dsi
>>> call in the trace. look hdmi related. Moreover, I think the exynos dsi
>>> worked well on v10 and I couldn't find any potential differences in
>>> terms of call flow change.
>>> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>> Well, the issue is definitely related to this patchset. On Friday, due
>> to other kernel messages, I missed the most important part of the log:
>>
>> [drm] Exynos DRM: using 13800000.decon device for DMA mapping operations
>> exynos-drm exynos-drm: bound 13800000.decon (ops decon_component_ops)
>> exynos-drm exynos-drm: bound 13880000.decon (ops decon_component_ops)
>> exynos-dsi 13900000.dsi: [drm:samsung_dsim_host_attach] Attached s6e3hf2
>> device
>> exynos-dsi 13900000.dsi: request interrupt failed with -22
>> panel-samsung-s6e3ha2: probe of 13900000.dsi.0 failed with error -22
>> exynos-drm exynos-drm: bound 13900000.dsi (ops exynos_dsi_component_ops)
>> exynos-drm exynos-drm: bound 13930000.mic (ops exynos_mic_component_ops)
>>
>> It looks that the are at least 2 issues. The first one related to TE
>> interrupt registration, the second is broken error path, which should
>> free allocated resources and stop DRM from binding/initialization.
>>
>> This patch fixes the issue (TE gpio/interrupt is optional!):
>>
>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>> index b4a5348b763c..ed83495fe105 100644
>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>> @@ -1518,7 +1518,9 @@ static int samsung_dsim_register_te_irq(struct
>> samsung_dsim *dsi, struct device
>>           int ret;
>>
>>           dsi->te_gpio = devm_gpiod_get_optional(dev, "te", GPIOD_IN);
>> -       if (IS_ERR(dsi->te_gpio))
>> +       if (!dsi->te_gpio)
>> +               return 0;
>> +       else if (IS_ERR(dsi->te_gpio))
> I think I missed this change from v10 where Marek V commented to move
> this in dsim instead of in Exynos. anyway, I will correct this.
>
>>                   return dev_err_probe(dev, PTR_ERR(dsi->te_gpio),
>> "failed to get te GPIO\n");
>>
>>           te_gpio_irq = gpiod_to_irq(dsi->te_gpio);
>>
>>
>> The error path in samsung_dsim_host_attach() after
>> samsung_dsim_register_te_irq() failure is wrong. It lacks cleaning up
>> the allocated resources (removing the bridge, detaing the dsi device).
> This is because of the same discussion of moving TE GPIO in dsim instead exynos.

Well, I'm not very happy about adding more and more features/changes to 
this single patch. I think that once we got the first version that was 
working on both Exynos and IMX, all other changes should be done 
incrementally to avoid this kind of issues...


> How about register TE GPIO before calling host attach like this,
>
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1598,9 +1598,6 @@ static int samsung_dsim_host_attach(struct
> mipi_dsi_host *host,
>
>          drm_bridge_add(&dsi->bridge);
>
> -       if (pdata->host_ops && pdata->host_ops->attach)
> -               pdata->host_ops->attach(dsi, device);
> -
>          /*
>           * This is a temporary solution and should be made by more generic way.
>           *
> @@ -1613,6 +1610,9 @@ static int samsung_dsim_host_attach(struct
> mipi_dsi_host *host,
>                          return ret;
>          }
>
> +       if (pdata->host_ops && pdata->host_ops->attach)
> +               pdata->host_ops->attach(dsi, device);
> +
>          dsi->lanes = device->lanes;
>          dsi->format = device->format;
>          dsi->mode_flags = device->mode_flags;
>
> Would you please check this?

Yes. This fixes the error path.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

