Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 007443CCEEB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 09:52:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1408A6E0BA;
	Mon, 19 Jul 2021 07:52:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2066.outbound.protection.outlook.com [40.107.95.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBD56E0BE;
 Mon, 19 Jul 2021 07:52:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlhlLWsP/y41Tc7R1R97b65bEkV3gBci+Q1YfKU66GTQ1FQT/01URy9tf11vYPLoFRc8AHDFCzpDqyOvnsEpIlsOHnTn/ZhBuf5Nr8ubss1iG2Ql6aI7IKWHQ/NxCMIoE7VFweNz4pzMpzgBOM6TkVJTATtcWK/eXYHMiLRFUh8jjsGNdU9UqDEpXGsaXuF4VFwYl26rmQDqZITFUhu2v6mP2AcZNNrZlvmMqnI2NKgHKNyhm/BGPuE8wRnqgSPu9KBS5iWAKeD4saiuCSOyg7cQHJexwlNqiKl7FNl5osas4AaVhUJM7bDu375Qt7uDhMR+ss6OgxPPg0ck5bKS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJGXvKW/xjbV19MJHl3SMPOQKknc5K08O1Plh5D9QMg=;
 b=ACA80U+ksoqwQaMlcpmVBQ/zXkdx2bQsIZTN8A4lGokwM5kGNcv7o1PYKaUELw7i2fd9Qd3DP6s7LoIm7WJDXRwav612j6gEJp5oubLXtvuR4tUcgnfjuKLfmmfz+hcLV9YQJJW6nbksvl5Bnkg123kpWzQGLYBByPhLSDJU/jIWzXs6yvSENBG3csSbMqPODWbY4phpomiT/IUPAfdrIMTF7JkQmOs6FEWaJZrnxbWIRyRFMvrnpkDKyQMk5PEs5Bmwf7uGhYddkOLjjAQtqQzcXDAxn+3Kt0YUs9UfaGVptvV8PyV2Nxllzjy1UHk4NDV2JtGcN8IJ5Yjycu5pLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=monstr.eu smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJGXvKW/xjbV19MJHl3SMPOQKknc5K08O1Plh5D9QMg=;
 b=VDQeCNaTrlCUz7dUIlNW/GqpiDBv3uhAvqp2k9l3h5Mgg0HzlqdWeJyybyaMqRmi3KC1We1DoGc27DTns00nSDGXFpgondrHo39SCPINtHQISwBCf028ojZrh96XggxG3zMihBLylEY9CXl534c3AP+I22SBGKn4TvbjJ518a3Y=
Received: from BN6PR22CA0042.namprd22.prod.outlook.com (2603:10b6:404:37::28)
 by BY5PR02MB6131.namprd02.prod.outlook.com (2603:10b6:a03:1b1::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 07:52:43 +0000
Received: from BN1NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:37:cafe::9) by BN6PR22CA0042.outlook.office365.com
 (2603:10b6:404:37::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend
 Transport; Mon, 19 Jul 2021 07:52:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; monstr.eu; dkim=none (message not signed)
 header.d=none;monstr.eu; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT052.mail.protection.outlook.com (10.13.2.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Mon, 19 Jul 2021 07:52:42 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 19 Jul 2021 00:52:41 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.2 via Frontend Transport; Mon, 19 Jul 2021 00:52:41 -0700
Envelope-to: monstr@monstr.eu, lima@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, marex@denx.de, yuq825@gmail.com
Received: from [172.30.17.109] (port=55100)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <michal.simek@xilinx.com>)
 id 1m5O4v-000BI6-GP; Mon, 19 Jul 2021 00:52:41 -0700
Subject: Re: [PATCH] drm/lima: Convert to clk_bulk API
To: Qiang Yu <yuq825@gmail.com>, Marek Vasut <marex@denx.de>, Jianqiang Chen
 <jianqian@xilinx.com>
References: <20210716182051.218575-1-marex@denx.de>
 <CAKGbVbsingxFiCARSu_-S_KxMHpQEJRkQn5hq9vAGUDwsBSh_g@mail.gmail.com>
 <e12734e8-71aa-375a-d544-c75b7379e576@denx.de>
 <CAKGbVbtRuVeUBD+m3J5U5AP_FM5S7i_qGXR-AHNeLnRogutVEQ@mail.gmail.com>
 <7462de54-5193-1606-7a93-390ad93c3b17@denx.de>
 <CAKGbVbt2nwcpf-H=gzR1-jEus7Dse36ikBt5Rg+QjmxKWLYOQw@mail.gmail.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <7e75b9d0-0295-d04d-527f-971633f36532@xilinx.com>
Date: Mon, 19 Jul 2021 09:52:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAKGbVbt2nwcpf-H=gzR1-jEus7Dse36ikBt5Rg+QjmxKWLYOQw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cea8fcf0-6e60-4a17-55d5-08d94a8a306d
X-MS-TrafficTypeDiagnostic: BY5PR02MB6131:
X-Microsoft-Antispam-PRVS: <BY5PR02MB6131C07760DB431707DA8C33C6E19@BY5PR02MB6131.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zi1zfhh1lRMi+YX46as88a8SVB0CYvGv+QylNHD9kL/AB1LIeqXnpPLKp5jgfKRxbXowFp2DTU1e5SNoxGz/aRU+CfzgiHp70jr0wMT1mSsD/3uF4KVAT86id+EIrw16qdfo7yGHpyQEljcC73pL/sA7EA8IKBZ7rVF+f0gPfdWW7eyhn3fiT1GbWCdI72KW+/N3+xk7wbeN5NIle7BVQlPyT1TMeu+I5kehGQBgcF0VmAuxg+hHwlGnSCitRMdaXWvArY1YiG8q3Qk4oBM5A4szMNm39Bxn6PLRhlxPdAjX1b0gXa8RKbscLHjylmTbAzG4BCL78rSeYgdiwZpi1nBknu/+0ehNLZMyv4HxISAkMv+xIm5/roP685KA7g+9A+52Y7ZMNCLxn/lXXaTOOl5Rq/VWCI4Dj9cROWbVrKSzfKvlQd0BDX4goupCtGxa11CS/D3WQ/89lgsljFHgr9hDhxBEiktsi5nHebRNj91v6FmYor73GJYvgJrCGiPmqHaJAei0kMuvkBStDV3JuFItGDPRoXgO9ofFME5WbVFgODThsdfWMe4l96HgzgunHV7FqWFhynE6R0NT2X9aDlldUfC/MAX1kf7qHC911t11f3P+2w4Ow7hnC67d3+DxYRDA1ITC84Nx+hC/LpJwl5oNdquPZ9Q1u3Elbwa0NWmMgLx/KeOAFWZ6k1qj55vHt/NSsK1AyZwRVTAv85TgSksm/oiF19jfwh65aT2NJQT++24CdQmP6GDln+LseOHzBPzGIy2D8jJzXNoeb+TYLDIW2IlrgJ4y+kXAycFM2PGfH9F3T9VrFTDj4Az9tG83Tvo5KHcFdKzISshZJsXF9+KPd1vLMVMCdcGxf1Ahkw6qk37FWI7hy6wqZRCj1Bak
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(7636003)(53546011)(426003)(966005)(356005)(8936002)(508600001)(70206006)(83380400001)(70586007)(5660300002)(336012)(4326008)(31686004)(2906002)(31696002)(2616005)(82310400003)(110136005)(6636002)(36756003)(9786002)(47076005)(44832011)(36906005)(54906003)(316002)(186003)(26005)(8676002)(36860700001)(50156003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 07:52:42.6610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cea8fcf0-6e60-4a17-55d5-08d94a8a306d
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6131
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
Cc: Michal Simek <monstr@monstr.eu>, lima@lists.freedesktop.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Michal Simek <michal.simek@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/18/21 4:56 AM, Qiang Yu wrote:
> On Sat, Jul 17, 2021 at 10:52 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 7/17/21 4:21 PM, Qiang Yu wrote:
>>> On Sat, Jul 17, 2021 at 9:08 PM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 7/17/21 2:34 PM, Qiang Yu wrote:
>>>>> On Sat, Jul 17, 2021 at 2:20 AM Marek Vasut <marex@denx.de> wrote:
>>>>>>
>>>>>> Instead of requesting two separate clock and then handling them
>>>>>> separately in various places of the driver, use clk_bulk_*() API.
>>>>>> This permits handling devices with more than "bus"/"core" clock,
>>>>>> like ZynqMP, which has "gpu"/"gpu_pp0"/"gpu_pp1" all as separate
>>>>>> clock.
>>>>>
>>>>> I can't find the ZynqMP DTS file under arch/arm64/boot/dts/xilinx
>>>>> which has mali GPU node with an upstream kernel, where is it?
>>>>
>>>> Posted here:
>>>> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20210716182544.219490-1-marex@denx.de/
>>>>
>>>>> So what's the relationship between "gpu" clk and "gpu_pp0"/"gpu_pp1"
>>>>> clk? Do they need to be controlled separately or we can just control the
>>>>> "gpu" clk? Because the devfreq code just controls a single module clk.
>>>>
>>>> Per the docs, they are separate enable bits and the zynqmp clock
>>>> controller exports them as separate clock, see bits 24..26 here:
>>>>
>>>> https://www.xilinx.com/html_docs/registers/ug1087/crf_apb___gpu_ref_ctrl.html
>>>>
>>>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>>>> Cc: Qiang Yu <yuq825@gmail.com>
>>>>>> Cc: lima@lists.freedesktop.org
>>>>>> ---
>>>>>>    drivers/gpu/drm/lima/lima_devfreq.c | 17 +++++++++---
>>>>>>    drivers/gpu/drm/lima/lima_devfreq.h |  1 +
>>>>>>    drivers/gpu/drm/lima/lima_device.c  | 42 +++++++++++------------------
>>>>>>    drivers/gpu/drm/lima/lima_device.h  |  4 +--
>>>>>>    4 files changed, 32 insertions(+), 32 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
>>>>>> index 8989e215dfc9..533b36932f79 100644
>>>>>> --- a/drivers/gpu/drm/lima/lima_devfreq.c
>>>>>> +++ b/drivers/gpu/drm/lima/lima_devfreq.c
>>>>>> @@ -58,7 +58,7 @@ static int lima_devfreq_get_dev_status(struct device *dev,
>>>>>>           struct lima_devfreq *devfreq = &ldev->devfreq;
>>>>>>           unsigned long irqflags;
>>>>>>
>>>>>> -       status->current_frequency = clk_get_rate(ldev->clk_gpu);
>>>>>> +       status->current_frequency = clk_get_rate(devfreq->clk_gpu);
>>>>>>
>>>>>>           spin_lock_irqsave(&devfreq->lock, irqflags);
>>>>>>
>>>>>> @@ -110,12 +110,23 @@ int lima_devfreq_init(struct lima_device *ldev)
>>>>>>           struct lima_devfreq *ldevfreq = &ldev->devfreq;
>>>>>>           struct dev_pm_opp *opp;
>>>>>>           unsigned long cur_freq;
>>>>>> -       int ret;
>>>>>> +       int i, ret;
>>>>>>
>>>>>>           if (!device_property_present(dev, "operating-points-v2"))
>>>>>>                   /* Optional, continue without devfreq */
>>>>>>                   return 0;
>>>>>>
>>>>>> +       /* Find first clock which are not "bus" clock */
>>>>>> +       for (i = 0; i < ldev->nr_clks; i++) {
>>>>>> +               if (!strcmp(ldev->clks[i].id, "bus"))
>>>>>> +                       continue;
>>>>>> +               ldevfreq->clk_gpu = ldev->clks[i].clk;
>>>>>> +               break;
>>>>>> +       }
>>>>>
>>>>> I'd prefer an explicit name for the required clk name. If some DTS has different
>>>>> name other than "core" for the module clk (ie. "gpu"), it should be changed to
>>>>> "core".
>>>>
>>>> The problem here is, the zynqmp has no core clock, it has "gpu and both
>>>> pixel pipes" super-clock-gate which controls everything, and then
>>>> per-pixel-pipe sub-clock-gates.
>>>
>>> So the "gpu" clk can gate both "gpu_pp0" and "gpu_pp1" clk, how about frequency?
>>
>> I don't think it is a good idea to just gate off the root clock while
>> the sub-clock are still enabled. That might lead to latch ups (+CC
>> Michal, he might know more).
>>
>> And who would enable the sub-clock anyway, it should be the GPU driver, no?
>>
> Right, I understand it's not proper either by HW or SW point of view to just
> use root clk gate.
> 
>>> Can we set clock rate for "gpu" then "gpu_pp0" and "gpu_pp1" pass
>>> through the same
>>> rate? If so, "gpu" works just like "core".
>>
>> I don't think the zynqmp is capable of any DVFS on the GPU at all, it
>> just runs at fixed frequency.
> 
> I see the GPU_REF_CTRL register 13:8 is a divisor, is this for all
> "gpu"/"gpu_pp0"/"gpu_pp1" clk rating? If so, can we use it to dynamically
> change the GPU clk freq because other SoC also use system clock
> to do GPU DVFS, see sun8i-h3.dtsi. If we can't then zynqmp won't finish
> lima_devfreq_init() and get here at all because it does not have
> an OPP table.
> 

Jianqiang: Please take a look at this from zynqmp point of view.

Thanks,
Michal
