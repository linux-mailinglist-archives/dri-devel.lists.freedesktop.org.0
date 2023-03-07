Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 592DB6ADC35
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54DD410E42B;
	Tue,  7 Mar 2023 10:44:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E93C10E40E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 10:44:28 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230307104426euoutp02aae1d08e068e5a0c619707c3ab93e71d~KHSeOKl1O0672706727euoutp02G
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 10:44:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230307104426euoutp02aae1d08e068e5a0c619707c3ab93e71d~KHSeOKl1O0672706727euoutp02G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1678185866;
 bh=OqxTxp+utqYg82EGYuDfRGFLykiINTHJNBeaOBhhCFQ=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=E0SVBD7zdIDG4Ub/gTaPRYNo0HGb+WvM5tdjHUZPZDRITYj6BI+O+5gzh/4e/yitK
 IJNf99B79ICARRqD6TBZ5wetn7Yomx0JvAVdT8BXyel2ZXiyq3qhrbZayr6+COxbf2
 m1R3z7ch4EVzuaaYJ8OLabmwL4OEfAZ1CYidgDjk=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230307104426eucas1p26df9e6f7c33427bcc6bfaf191ba2890b~KHSd9lUct1727417274eucas1p2G;
 Tue,  7 Mar 2023 10:44:26 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 07.DE.09966.A8517046; Tue,  7
 Mar 2023 10:44:26 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230307104426eucas1p20e8df605e8a182842dd4bd566adb607b~KHSdaybud1724817248eucas1p2E;
 Tue,  7 Mar 2023 10:44:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230307104426eusmtrp1310d9522ba38a291241131392cbe5398~KHSdaI8jp2221522215eusmtrp1Z;
 Tue,  7 Mar 2023 10:44:26 +0000 (GMT)
X-AuditID: cbfec7f4-d4fff700000026ee-fe-6407158a74be
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id CF.D6.08862.98517046; Tue,  7
 Mar 2023 10:44:25 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230307104425eusmtip1bb32f42ca5885e5415aef81f41fc598c~KHScmw8923265632656eusmtip1I;
 Tue,  7 Mar 2023 10:44:25 +0000 (GMT)
Message-ID: <c1fad904-d838-f08f-67ba-9dfd59d86584@samsung.com>
Date: Tue, 7 Mar 2023 11:44:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZBxeySq3iSe=ZVrsHDKU76LiBO7cQrrc8EKbr9uUUXm2Q@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJKsWRmVeSWpSXmKPExsWy7djP87pdouwpBhMuS1ncuX2a2eL+4s8s
 Fle+vmez6F16jtVi0v0JLBZfNk1gszjb9IbdYvmEfWwWM87vY7J409bIaHH60Xpmi7bOZawW
 73feYrSYMfklm8XFE5+YHfg91n68z+oxb9YJFo8pJ46wepzrucvmsXPWXXaPxXteMnlsWtXJ
 5nHk6mJWjzvX9rB53O8+zuTRt2UVo8fnTXIBPFFcNimpOZllqUX6dglcGTOfP2QpaLGumHbs
 FGsD40f9LkZODgkBE4mlv04ydjFycQgJrGCUmPjxMxOE84VR4tGSvewQzmdGiQN/vrB2MXKA
 tRyebwgRX84o8W5aL1THR0aJnhN7WUDm8grYSRy/f4UZxGYRUJHYeOAoM0RcUOLkzCdgNaIC
 KRI7zu9mB7GFBRwkzq84yghiMwuIS9x6Mp8JxBYR0Jb4NvM1G0R8LYvEtyu+IDabgKFE19su
 sDinQKDErYmTWSFq5CWat85mBjlIQuAap8S9fb9ZIR51kXjatZERwhaWeHV8CzuELSNxenIP
 C0RDO6PEgt/3mSCcCYwSDc9vQXVYS9w594sN5H9mAU2J9bugoecoceHGSnZIsPBJ3HgrCHEE
 n8SkbdOZIcK8Eh1tQhDVahKzjq+DW3vwwiXmCYxKs5CCZRaS92cheWcWwt4FjCyrGMVTS4tz
 01OLjfJSy/WKE3OLS/PS9ZLzczcxAlPj6X/Hv+xgXP7qo94hRiYOxkOMEhzMSiK8b9+xpQjx
 piRWVqUW5ccXleakFh9ilOZgURLn1bY9mSwkkJ5YkpqdmlqQWgSTZeLglGpgWqDKKu66LTHj
 +ow/EaITzzFN29fBp/ed24vXPD7b+2HArqxemdgHEw81TZDP89Xv+7nI6ezjn5YOy3ql3hyw
 quvqvbrWe6FTy6ofRRPP/zrgwlhhHZTFzxbQw/YhbuG98/wXd0UGyK1Zc9dsnz2bbaPOtLPt
 u315E47//rhScepsnrkh110LzjYuEWZ88cEqPEdwl+KS58t7FfzF+p49+fH3/RwrlbS8yXX1
 c+81yFxuanj9qjQ6hu/A4dIaaZu+zaHS0+9nOSk07N/msm1r8sEpjEz+c7p3iLRbOicvt90y
 XTf73qpfU267T3hWe0UwfP/m0zFzNmpf93GadufpQ7V1F6alWgruC5ig0Wh2V4mlOCPRUIu5
 qDgRALRo6qD8AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrFIsWRmVeSWpSXmKPExsVy+t/xu7qdouwpBk9azCzu3D7NbHF/8WcW
 iytf37NZ9C49x2ox6f4EFosvmyawWZxtesNusXzCPjaLGef3MVm8aWtktDj9aD2zRVvnMlaL
 9ztvMVrMmPySzeLiiU/MDvweaz/eZ/WYN+sEi8eUE0dYPc713GXz2DnrLrvH4j0vmTw2repk
 8zhydTGrx51re9g87ncfZ/Lo27KK0ePzJrkAnig9m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMT
 Sz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jJnPH7IUtFhXTDt2irWB8aN+FyMHh4SAicTh+YZd
 jJwcQgJLGSWmbHMFsSUEZCROTmtghbCFJf5c62LrYuQCqnnPKHHn/iawBK+AncTx+1eYQWwW
 ARWJjQeOMkPEBSVOznzCAjJfVCBFYnaXDkhYWMBB4vyKo4wgNrOAuMStJ/OZQGwRAW2JbzNf
 g81nFljPIvFv6wRmiGXnWCR2PNvHBlLFJmAo0fW2C8zmFAiUuDVxMivEJDOJrq1dUFPlJZq3
 zmaewCg0C8kds5AsnIWkZRaSlgWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECE8G2Yz83
 72Cc9+qj3iFGJg7GQ4wSHMxKIrxv37GlCPGmJFZWpRblxxeV5qQWH2I0BQbGRGYp0eR8YCrK
 K4k3NDMwNTQxszQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpgalhlvEw856he95nO
 Nz9e3H2490qxStVXzd+7rRec9VBZynPzkfrdo053r+97dYp1sY/Dyohvm3OdegV12lgyDa5u
 /Xv5XlWDtElVyDv9iY1/4zwUb3nZcv6cHmlmyXIwzeKml8VsoS3cAo0fIrinSE//s633gE7U
 xSOqX99bTZnrPf3s7VULmAw9nP8JCIldfsv6fV7xDam5OxbZWIddFjrj4fzky713Qneesizm
 WtTA2jHtZLCxu4YMrwvX+eOLl/29fUiyxZn18z7hzffCC4PP3L00terias9tgomHsk/mf57j
 ufv75UMmTAcvvJq25Li1qvZi/46Gf48+l6scN7Frr9zyuuHjnfjvM5a6zgxWYinOSDTUYi4q
 TgQAo5zLA40DAAA=
X-CMS-MailID: 20230307104426eucas1p20e8df605e8a182842dd4bd566adb607b
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
 <44e40894-b0f6-2a00-2bea-4f99c3595e3a@samsung.com>
 <CAMty3ZDuTdhjqmyaRrT9NqDvq1O3=C0P6HfY1rvrn3imOsm6-A@mail.gmail.com>
 <CAMty3ZBxeySq3iSe=ZVrsHDKU76LiBO7cQrrc8EKbr9uUUXm2Q@mail.gmail.com>
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

Hello,

On 07.03.2023 10:22, Jagan Teki wrote:
> On Tue, Mar 7, 2023 at 1:25 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
>> On Tue, Mar 7, 2023 at 4:11 AM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> On 06.03.2023 18:24, Jagan Teki wrote:
>>>> On Mon, Mar 6, 2023 at 4:32 PM Marek Szyprowski
>>>> <m.szyprowski@samsung.com> wrote:
>>>>> On 04.03.2023 19:59, Jagan Teki wrote:
>>>>>> On Sat, Mar 4, 2023 at 3:56 AM Marek Szyprowski
>>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>>> On 03.03.2023 15:51, Jagan Teki wrote:
>>>>>>>> This series supports common bridge support for Samsung MIPI DSIM
>>>>>>>> which is used in Exynos and i.MX8MM SoC's.
>>>>>>>>
>>>>>>>> The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.
>>>>>>>>
>>>>>>>> Inki Dae: please note that this series added on top of exynos-drm-next
>>>>>>>> since few exynos dsi changes are not been part of drm-misc-next.
>>>>>>>> Request you to pick these via exynos-drm-next, or let me know if you
>>>>>>>> have any comments?
>>>>>>> I gave it a try on Exynos TM2e and unfortunately it nukes again:
>>>>>>>
>>>>>>> exynos-drm exynos-drm: bound 13970000.hdmi (ops hdmi_component_ops)
>>>>>>> Unable to handle kernel paging request at virtual address 003d454d414e5675
>>>>>>> ...
>>>>>>> [003d454d414e5675] address between user and kernel address ranges
>>>>>>> Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
>>>>>>> Modules linked in:
>>>>>>> CPU: 4 PID: 9 Comm: kworker/u16:0 Not tainted 6.2.0-next-20230303+ #13341
>>>>>>> Hardware name: Samsung TM2E board (DT)
>>>>>>> Workqueue: events_unbound deferred_probe_work_func
>>>>>>> pstate: 000000c5 (nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>>>>>> pc : drm_connector_list_iter_next+0x58/0x100
>>>>>>> lr : drm_connector_list_iter_next+0x2c/0x100
>>>>>>> sp : ffff80000bbab910
>>>>>>> ...
>>>>>>> Call trace:
>>>>>>>      drm_connector_list_iter_next+0x58/0x100
>>>>>>>      drm_mode_config_reset+0xfc/0x144
>>>>>>>      exynos_drm_bind+0x160/0x1b8
>>>>>>>      try_to_bring_up_aggregate_device+0x168/0x1d4
>>>>>>>      __component_add+0xa8/0x170
>>>>>>>      component_add+0x14/0x20
>>>>>>>      hdmi_probe+0x3fc/0x6d4
>>>>>>>      platform_probe+0x68/0xd8
>>>>>>>      really_probe+0x148/0x2b4
>>>>>>>      __driver_probe_device+0x78/0xe0
>>>>>>>      driver_probe_device+0xd8/0x160
>>>>>>>      __device_attach_driver+0xb8/0x138
>>>>>>>      bus_for_each_drv+0x84/0xe0
>>>>>>>      __device_attach+0xa8/0x1b0
>>>>>>>      device_initial_probe+0x14/0x20
>>>>>>>      bus_probe_device+0xb0/0xb4
>>>>>>>      deferred_probe_work_func+0x8c/0xc8
>>>>>>>      process_one_work+0x288/0x6c8
>>>>>>>      worker_thread+0x24c/0x450
>>>>>>>      kthread+0x118/0x11c
>>>>>>>      ret_from_fork+0x10/0x20
>>>>>> This looks not related to dsi to me since there is no exynos_drm_dsi
>>>>>> call in the trace. look hdmi related. Moreover, I think the exynos dsi
>>>>>> worked well on v10 and I couldn't find any potential differences in
>>>>>> terms of call flow change.
>>>>>> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>>>>> Well, the issue is definitely related to this patchset. On Friday, due
>>>>> to other kernel messages, I missed the most important part of the log:
>>>>>
>>>>> [drm] Exynos DRM: using 13800000.decon device for DMA mapping operations
>>>>> exynos-drm exynos-drm: bound 13800000.decon (ops decon_component_ops)
>>>>> exynos-drm exynos-drm: bound 13880000.decon (ops decon_component_ops)
>>>>> exynos-dsi 13900000.dsi: [drm:samsung_dsim_host_attach] Attached s6e3hf2
>>>>> device
>>>>> exynos-dsi 13900000.dsi: request interrupt failed with -22
>>>>> panel-samsung-s6e3ha2: probe of 13900000.dsi.0 failed with error -22
>>>>> exynos-drm exynos-drm: bound 13900000.dsi (ops exynos_dsi_component_ops)
>>>>> exynos-drm exynos-drm: bound 13930000.mic (ops exynos_mic_component_ops)
>>>>>
>>>>> It looks that the are at least 2 issues. The first one related to TE
>>>>> interrupt registration, the second is broken error path, which should
>>>>> free allocated resources and stop DRM from binding/initialization.
>>>>>
>>>>> This patch fixes the issue (TE gpio/interrupt is optional!):
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> index b4a5348b763c..ed83495fe105 100644
>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> @@ -1518,7 +1518,9 @@ static int samsung_dsim_register_te_irq(struct
>>>>> samsung_dsim *dsi, struct device
>>>>>            int ret;
>>>>>
>>>>>            dsi->te_gpio = devm_gpiod_get_optional(dev, "te", GPIOD_IN);
>>>>> -       if (IS_ERR(dsi->te_gpio))
>>>>> +       if (!dsi->te_gpio)
>>>>> +               return 0;
>>>>> +       else if (IS_ERR(dsi->te_gpio))
>>>> I think I missed this change from v10 where Marek V commented to move
>>>> this in dsim instead of in Exynos. anyway, I will correct this.
>>>>
>>>>>                    return dev_err_probe(dev, PTR_ERR(dsi->te_gpio),
>>>>> "failed to get te GPIO\n");
>>>>>
>>>>>            te_gpio_irq = gpiod_to_irq(dsi->te_gpio);
>>>>>
>>>>>
>>>>> The error path in samsung_dsim_host_attach() after
>>>>> samsung_dsim_register_te_irq() failure is wrong. It lacks cleaning up
>>>>> the allocated resources (removing the bridge, detaing the dsi device).
>>>> This is because of the same discussion of moving TE GPIO in dsim instead exynos.
>>> Well, I'm not very happy about adding more and more features/changes to
>>> this single patch. I think that once we got the first version that was
>>> working on both Exynos and IMX, all other changes should be done
>>> incrementally to avoid this kind of issues...
>> This is what I thought too, v10 was that ready to merge patchset.
>> Since it was delayed it is obvious to have more comments from other
>> developers in the community. This is what happened with the TE GPIO
>> change.
>>
>>>
>>>> How about register TE GPIO before calling host attach like this,
>>>>
>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>> @@ -1598,9 +1598,6 @@ static int samsung_dsim_host_attach(struct
>>>> mipi_dsi_host *host,
>>>>
>>>>           drm_bridge_add(&dsi->bridge);
>>>>
>>>> -       if (pdata->host_ops && pdata->host_ops->attach)
>>>> -               pdata->host_ops->attach(dsi, device);
>>>> -
>>>>           /*
>>>>            * This is a temporary solution and should be made by more generic way.
>>>>            *
>>>> @@ -1613,6 +1610,9 @@ static int samsung_dsim_host_attach(struct
>>>> mipi_dsi_host *host,
>>>>                           return ret;
>>>>           }
>>>>
>>>> +       if (pdata->host_ops && pdata->host_ops->attach)
>>>> +               pdata->host_ops->attach(dsi, device);
>>>> +
>>>>           dsi->lanes = device->lanes;
>>>>           dsi->format = device->format;
>>>>           dsi->mode_flags = device->mode_flags;
>>>>
>>>> Would you please check this?
>>> Yes. This fixes the error path.
>> Okay. I'm sending v16 with the above two changes.
> Would you please test this v16 for confirmation before sending it to
> the mailing list?

v16 works fine here. Feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

to the Exynos related patches (if there is still no such tag yet).


Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

