Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B80705BA83A
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 10:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9142810ECE5;
	Fri, 16 Sep 2022 08:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A791910ECE5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 08:28:18 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220916082815euoutp019042d31c9cd97020169b50fbc3ee2994~VSedz6A1e2214122141euoutp01X
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 08:28:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220916082815euoutp019042d31c9cd97020169b50fbc3ee2994~VSedz6A1e2214122141euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1663316895;
 bh=gjmxpHwTGhjPPRLOJU/juWOs/C1W/CK67CamSfnzGIA=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=rAxR3Yfk+7poC18tCagAJmWMI1itJk/cFqomRDYpIA9aFTe5hr+Tdi9x1EnzHARm5
 G2C2baN9RwW5Bah+ULcYbdWXMmv7KjLM+hLR5OBJfyBi5sSjimK51GurCwzhxBhEVO
 RMqE+YyOfN+AwJ7v9iquFWgeis75cg7+prVcg/uA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220916082815eucas1p24b74eb5434ea089eec46783edd71ad47~VSedcyKMe3155831558eucas1p2f;
 Fri, 16 Sep 2022 08:28:15 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 91.FE.07817.F9334236; Fri, 16
 Sep 2022 09:28:15 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220916082814eucas1p2533f0611073cddacdc340cff50faead4~VSec-UuNE2535525355eucas1p2E;
 Fri, 16 Sep 2022 08:28:14 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220916082814eusmtrp1fee38974914e505f25c62a7cdc7ea6f2~VSec_KMoi0170101701eusmtrp1B;
 Fri, 16 Sep 2022 08:28:14 +0000 (GMT)
X-AuditID: cbfec7f4-8abff70000011e89-c2-6324339fafeb
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id E8.95.10862.E9334236; Fri, 16
 Sep 2022 09:28:14 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220916082813eusmtip19e90952fcf5c97d368eac93e77495451~VSecBFUhC0984509845eusmtip1V;
 Fri, 16 Sep 2022 08:28:13 +0000 (GMT)
Message-ID: <988875db-c777-d93b-fdc7-780fa0cb31fe@samsung.com>
Date: Fri, 16 Sep 2022 10:28:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 02/12] drm: bridge: Add Samsung DSIM bridge driver
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMty3ZA7T2KiRpK_yWHOR57=T3UthNJxx=VyiHVep+sQVcCjvQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphk+LIzCtJLcpLzFFi42LZduzned35xirJBrOmiVrcuX2a2eL+4s8s
 Fq9vr2CzuPL1PZtF79JzrBZfNk1gs3hx7yKLxdmmN+wWnROXsFssn7CPzWLT42usFl2/VjJb
 zDi/j8niTVsjo8XpR+uZLU41trJYHOqLtvg06yFQcvJLNovvv88yO4h4rP14n9Xj/Y1Wdo95
 s06weEw5cYTVY+esu+wesztmsnos3vOSyePI1cWsHneu7WHzuN99nMlj85J6j43vdjB59G1Z
 xejxeZNcAF8Ul01Kak5mWWqRvl0CV8bj7+dYC86pVaz72s3WwPhJvouRk0NCwETi7rEN7F2M
 XBxCAisYJdb/WcoI4XxhlOjteM8G4XxmlPhyfSMjTMvlY09ZIBLLGSWOf2qHavnIKHH20Uo2
 kCpeATuJS92fwDpYBFQlXpxrZIWIC0qcnPmEBcQWFUiWmHXsGFiNsICnxN2Tv8DizALiEree
 zGcCsUUEtCW+zXwNdgazwAY2iZ71M8AWsAkYSnS97QKzOQUCJXoaZjNDNMtLbH87hxmkQULg
 F6fE+zcn2CDudpGYO+k7O4QtLPHq+BYoW0bi9OQeFoiGdkaJBb/vM0E4ExglGp7fgvraWuLO
 uV9AkziAVmhKrN+lDxF2lOj5tosFJCwhwCdx460gxBF8EpO2TWeGCPNKdLQJQVSrScw6vg5u
 7cELl5gnMCrNQgqXWUj+n4XknVkIexcwsqxiFE8tLc5NTy02ykst1ytOzC0uzUvXS87P3cQI
 TLCn/x3/soNx+auPeocYmTgYDzFKcDArifD2hSgkC/GmJFZWpRblxxeV5qQWH2KU5mBREudN
 ztyQKCSQnliSmp2aWpBaBJNl4uCUamCKjdf3C3tX7L6oz3aubfQt46bqQ5MMP15XnqG523R9
 i1ZQfAGPtHzRkaP15YEVLbon7P3XrZYqXtAmdzh4hUb6jgslntcrLb5PjpuVZmIwT/qZn7ny
 8V8eEw/acuszMsss2fjZ3Gdf5JYLt/8FHrxqW75/nbXFFFGbW3zhH+ZO/n5gXdLWqBVzbnUu
 bVFnKzX6y7Lhs9eDsqQTBWEHuC9Ne9Msd1Xw19mF1ZO+btqqeOHSmrTvNZIaKfvf7VygZRru
 u88+OuoDZ8XqOTG6q5rervS01VdY+qMvdeXVbfn3W//t5l9inWS3Pl3x6NdjB25PenLuyrwU
 vUijv/mB3C90NO9+ucL2qDhsdp2mu0ukEktxRqKhFnNRcSIA/SVyAR8EAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHKsWRmVeSWpSXmKPExsVy+t/xu7rzjFWSDS6s0LO4c/s0s8X9xZ9Z
 LF7fXsFmceXrezaL3qXnWC2+bJrAZvHi3kUWi7NNb9gtOicuYbdYPmEfm8Wmx9dYLbp+rWS2
 mHF+H5PFm7ZGRovTj9YzW5xqbGWxONQXbfFp1kOg5OSXbBbff59ldhDxWPvxPqvH+xut7B7z
 Zp1g8Zhy4girx85Zd9k9ZnfMZPVYvOclk8eRq4tZPe5c28Pmcb/7OJPH5iX1Hhvf7WDy6Nuy
 itHj8ya5AL4oPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQi
 fbsEvYzH38+xFpxTq1j3tZutgfGTfBcjJ4eEgInE5WNPWboYuTiEBJYySvx/fp0FIiEjcXJa
 AyuELSzx51oXG0TRe0aJrisb2UASvAJ2Epe6PzGC2CwCqhIvzjWyQsQFJU7OfAI2SFQgWWJJ
 w32wuLCAp8Tdk7/A4swC4hK3nsxnArFFBLQlvs18DbaAWWATm0TTqjZWiG3fWCR2Hb0AVsUm
 YCjR9bYLbDOnQKBET8NsZohJZhJdW7sYIWx5ie1v5zBPYBSaheSQWUgWzkLSMgtJywJGllWM
 IqmlxbnpucVGesWJucWleel6yfm5mxiBCWXbsZ9bdjCufPVR7xAjEwfjIUYJDmYlEd6+EIVk
 Id6UxMqq1KL8+KLSnNTiQ4ymwNCYyCwlmpwPTGl5JfGGZgamhiZmlgamlmbGSuK8ngUdiUIC
 6YklqdmpqQWpRTB9TBycUg1Mcfu+PlvLFZkSU3JxfnSO/a9X5usF1BlDPf17vphntGxYuf/C
 9X3/Jx5wWnM0YruStcTFRfVGGwIfal/Qiay+2PBG+FFs+WGenObzyj4ZO14/fuP/+vHygwkl
 di9ml5pHCLtvvxYucMPrm/S2mUWzlvJWKahffHG8JrPY9XSR+oIL/j8fnxfn/nx036qaVo65
 2V/00nV4nLll91x0bZs79eRF8Umi7P/m13+xtFNh9bx99KWuqUlQ1I/ZK3Q4zO4bxXaemnaz
 kdn2jrGLo/TcJO2QtWk/jptvnaKZq9FRV6Nzx8pbdmmJq8EvvQL99w7btUocD/9Y86Zsxtbs
 jhbOzCjXx7LLcoMYjT8mP1ylxFKckWioxVxUnAgAy794K7EDAAA=
X-CMS-MailID: 20220916082814eucas1p2533f0611073cddacdc340cff50faead4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
 <CGME20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180@eucas1p2.samsung.com>
 <20220829184031.1863663-3-jagan@amarulasolutions.com>
 <7511aa28-a944-d241-5bea-8404008e7dce@samsung.com>
 <d750a140-c87e-16af-7683-22d48f68305a@samsung.com>
 <CAMty3ZBVrRa9VHDpGBM_r9gdU=Ex4iwpSHjzcOdxSBrwRrHF2A@mail.gmail.com>
 <473e88ee-1866-49ca-4a43-17a378e6fe47@samsung.com>
 <CAMty3ZAVV_dLnkBsgBCYgNbVNE-hMFiORqv7AxkDpwciJawtzw@mail.gmail.com>
 <92cfa300-0cf8-0040-f99b-59b3d9a1c2be@samsung.com>
 <CAMty3ZA7T2KiRpK_yWHOR57=T3UthNJxx=VyiHVep+sQVcCjvQ@mail.gmail.com>
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
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Matteo Lisi <matteo.lisi@engicam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jagan,

On 14.09.2022 11:39, Jagan Teki wrote:
> On Wed, Sep 14, 2022 at 2:51 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> On 13.09.2022 19:29, Jagan Teki wrote:
>>> On Wed, Sep 7, 2022 at 3:34 PM Marek Szyprowski
>>> <m.szyprowski@samsung.com> wrote:
>>>> On 06.09.2022 21:07, Jagan Teki wrote:
>>>>> On Mon, Sep 5, 2022 at 4:54 PM Marek Szyprowski
>>>>> <m.szyprowski@samsung.com> wrote:
>>>>>> On 02.09.2022 12:47, Marek Szyprowski wrote:
>>>>>>> On 29.08.2022 20:40, Jagan Teki wrote:
>>>>>>>> Samsung MIPI DSIM controller is common DSI IP that can be used in
>>>>>>>> various
>>>>>>>> SoCs like Exynos, i.MX8M Mini/Nano.
>>>>>>>>
>>>>>>>> In order to access this DSI controller between various platform SoCs,
>>>>>>>> the ideal way to incorporate this in the drm stack is via the drm bridge
>>>>>>>> driver.
>>>>>>>>
>>>>>>>> This patch is trying to differentiate platform-specific and bridge
>>>>>>>> driver
>>>>>>>> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
>>>>>>>> glue code and samsung-dsim.c as a common bridge driver code.
>>>>>>>>
>>>>>>>> - Exynos specific glue code is exynos specific te_irq, host_attach, and
>>>>>>>>       detach code along with conventional component_ops.
>>>>>>>>
>>>>>>>> - Samsung DSIM is a bridge driver which is common across all
>>>>>>>> platforms and
>>>>>>>>       the respective platform-specific glue will initialize at the end
>>>>>>>> of the
>>>>>>>>       probe. The platform-specific operations and other glue calls will
>>>>>>>> invoke
>>>>>>>>       on associate code areas.
>>>>>>>>
>>>>>>>> v4:
>>>>>>>> * include Inki Dae in MAINTAINERS
>>>>>>>> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
>>>>>>> This breaks Exynos DRM completely as the Exynos DRM driver is not able
>>>>>>> to wait until the DSI driver is probed and registered as component.
>>>>>>>
>>>>>>> I will show how to rework this the way it is done in
>>>>>>> drivers/gpu/drm/exynos/exynos_dp.c and
>>>>>>> drivers/gpu/drm/bridge/analogix/analogix_dp_core.c soon...
>>>>>> I've finally had some time to implement such approach, see
>>>>>> https://protect2.fireeye.com/v1/url?k=c5d024d9-a4ab8e4e-c5d1af96-74fe4860001d-625a8324a9797375&q=1&e=489b94d4-84fb-408e-b679-a8d27acf2930&u=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv6.0-dsi-v4-reworked
>>>>>>
>>>>>> If you want me to send the patches against your v4 patchset, let me
>>>>>> know, but imho my changes are much more readable after squashing to the
>>>>>> original patches.
>>>>>>
>>>>>> Now the driver is fully multi-arch safe and ready for further
>>>>>> extensions. I've removed the weak functions, reworked the way the
>>>>>> plat_data is used (dropped the patch related to it) and restored
>>>>>> exynos-dsi driver as a part of the Exynos DRM drivers/subsystem. Feel
>>>>>> free to resend the above as v5 after testing on your hardware. At least
>>>>>> it properly works now on all Exynos boards I have, both compiled into
>>>>>> the kernel or as modules.
>>>>> Thanks. I've seen the repo added on top of Dave patches - does it mean
>>>>> these depends on Dave changes as well?
>>>> Yes and no. My rework doesn't change anything with this dependency. It
>>>> comes from my patch "drm: exynos: dsi: Restore proper bridge chain
>>>> order" already included in your series (patch #1). Without it exynos-dsi
>>>> driver hacks the list of bridges to ensure the order of pre_enable calls
>>>> needed for proper operation. This works somehow with DSI panels on my
>>>> test systems, but it has been reported that it doesn't work with a bit
>>>> more complex display pipelines. Only that patch depends on the Dave's
>>>> patches. If you remove it, you would need to adjust the code in the
>>>> exynos_drm_dsi.c and samsung-dsim.c respectively. imho it would be
>>>> better to keep it and merge Dave's patches together with dsi changes, as
>>>> they are the first real client of it.
>>> I think the Dave patches especially "drm/bridge: Introduce
>>> pre_enable_upstream_first to alter bridge init order" seems not 100%
>>> relevant to this series as they affect bridge chain call flow
>>> globally. Having a separate series for that makes sense to me. I'm
>>> sending v5 by excluding those parts.
>> If so then drop the "drm: exynos: dsi: Restore proper bridge chain
>> order" patch and adjust code respectively in samsung-dsim.c. Without the
>> Dave's patches, that one doesn't make sense.
> Doesn't it break Exynos?

No it won't. Lack of the "drm: exynos: dsi: Restore proper bridge chain 
order" patch doesn't change much against the current state of the driver.

Here is my rework of your v4 patchset without the mentioned patch and 
Dave's patches:

https://github.com/mszyprow/linux/tree/v6.0-dsi-v4-reworked-minimal

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

