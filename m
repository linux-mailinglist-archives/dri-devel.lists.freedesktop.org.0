Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BED68B71C
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 09:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88D810E2B7;
	Mon,  6 Feb 2023 08:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2110.outbound.protection.outlook.com [40.107.21.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C0010E2B7
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 08:11:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/pmM8oQIeH1E/Nsd+NY5Iga3jhpbK3BBPNP4VnIn0YR44Ao/qvFldo5ltVk8kD5ew3lGGVD4yExSt2wHOEy525z0JS1Bc+Fuf+RhdYEr7Py+TO0aH63jxqIgJf5Keb7b7BSU9LJrwzmQR+U/V5N9Kjb+odHf/PvCqkI5ZeWBfIs0auQIFELuxqhtEWPlIBEi5ktQpuEYURcv7eylaqCZm7O+gdawiqkSNEzJDqLvRXiRBY0WV02xnIcEmxW/0a0MCUYvlWPyzhukhCTYSOzS6qtETHRPmnQx6CDvOPwCvxBp9H9pnGbZxBva4QEPLXbU9wqBGqYvVy8b2fExJHDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owro8ceE4/PSitGiYXct9HfX4QZHujUMbrCbE579CtE=;
 b=YvvctdwbAKBDnzpftKaEzi7SOu7yN6HqiB58fSWbkFpioUVBu1iy8BgVUKR0y2WTYM3g84LE84IjzPE462PaXt9fDQ1mI/vrlj0xFeHGhIORSQW1+dUzpiRurBaygiBwUB9v8oEpjwPbQ7YQzNmG+Xd1vRDTP0+lzdFOVveLnwqpFYBCwQZmxSHce4wKqrONshlgll65d5pwPja6PVt9XuxuaGMMG8dAt5IWs36GVZQNRki60zngQXAPTWybVnpY5YhRPUD/zor7QFHNDY7+Mvrr5XL/VfZ11Mii1KZMZiKlHe7kqbsBxzra+2x1ndSnxWRq2zwl7PDUVdbivsngQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=owro8ceE4/PSitGiYXct9HfX4QZHujUMbrCbE579CtE=;
 b=Ze/E3gZ6ctvY+Hz4sCb9HlK3EQ8V265nhD3etTkE8+705Q4KkXFtsfqK9TUs7k9PZBEJlyQDV6M8TZ9DByy8QfLYrPK/bUgxDHTpv6nI0xG3pUXa6GSrBhuobTfSHJv6SC4WjumgPfIsDkhlLLP4IBRe+9bKT7FJEyax7SOodqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PAXPR10MB5435.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:284::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 08:11:25 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%9]) with mapi id 15.20.6064.025; Mon, 6 Feb 2023
 08:11:24 +0000
Message-ID: <1745c43d-06b4-933b-5dbd-50add565828e@kontron.de>
Date: Mon, 6 Feb 2023 09:11:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>, Marek Vasut
 <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
 <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0051.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:53::6) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PAXPR10MB5435:EE_
X-MS-Office365-Filtering-Correlation-Id: ba9e23f6-4ba4-442d-eabf-08db0819bd0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IZGfmdQ9Zcwe+xSAqr0a1GDotal6TkxSAAE2WRgEDGLanMglj3BH/mEpZFEg4bQAMmbfhBTtWq3vKYI9cA06lL069jtvRQYmLC+prpD0GwujBCVx4tRklXY+CP0L8lKLDXqLYC30uKJJ9ZcSe4mz+D9JkfDN33AtAnhdwvfYCiHEiwXnEMlT+SMc592CtrZOGKH6vwHKTPgHeqTJnsGgl/HfjXqp7uBTdqBxpL9ac2MuowjyaRK6myc+3aVqpXI2yUVTTeDwUEgpj5DiVeQm4sg/Dg4Lb71bECCP30VVgI5N5qDpt4mRBHxTYBcvS+JHNqeTE8kfwXXjtry4vfuUyB9ywtOUgNKStZv0NjstcTHwSJNmR5Dcru5zGcb6/qMKY/HIx9N60kYOLqVA6FN/111BVh4V7ahhyZyatTlmWi4T1wDAtCDdZ+LBuZX+44q85A8rVTiW311Nl+g7g7ttjgqqtVDNrWk8N20YRVWz3aTm/gY/27GKLQh8PVlFlGlNqyCBFSq9rndrhCJC/to37G8y168l7T0wYs6Nf3tAXh6ffHyyDq+zAqcqDotV856pSUPFa8jrUf71FZ1p0zvc6oRuVHB7aHBnVzD9HmDPKjvCsj2MVqLbyMhBcvntN7k3gs0yIHMc6c9W/vAYqYjkPcfgxMbJiyAoTOugrXfovHTHfs78OVQHZn6PuNe0qDYJ4iTlm+JMCYFdyoyI8WoiilLRbrxVgmM0yDBnjN1BQSU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199018)(31686004)(38100700002)(36756003)(6506007)(186003)(6512007)(26005)(53546011)(478600001)(86362001)(6486002)(4326008)(83380400001)(66556008)(66946007)(2616005)(31696002)(8676002)(66476007)(316002)(110136005)(7416002)(44832011)(2906002)(41300700001)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c20xVkFoNmNJNk1sa2ZHQkpvWlRGOVVHbUwyd0YzSTg3REhnZzlwZHJDMm9Y?=
 =?utf-8?B?S1h6emxZWlNJNCtoNG1PNVBYQmdNVldySDFhSG5HK0VEdXdrallNenZheWZh?=
 =?utf-8?B?VWIzK2g1aGRybFFmMHp3YUNLeDROSmt0WWJUWTdOQVl6SUU3c0huV213VTAr?=
 =?utf-8?B?dWlMck5LT05tYTMxL1FvSWxrQTFiOUVKU1ZNUHIwUE1UOStQajY3ckNDUlA3?=
 =?utf-8?B?TENNc1VHYkdRSzJidnIzVjM3NnVRVlNTQlZnZkhQRXlVdVh3VVlnVlQwMzZp?=
 =?utf-8?B?cjJWUWsrTjNzVmxEQmEwTWw1ak1RTDhVVFk4aGZBMnVkWjJBK1ZLOHgrSnNi?=
 =?utf-8?B?WWVSU3N6cDVtZnpYODFXNGJJY1hlWHNJSE8xR1grRzVEemJqRWpGRlhDMkht?=
 =?utf-8?B?QWdyNlAxYkpkbXRKTldtZnFaZG5xR01DTUdYd2dkY1JaWTBGdEtuaXUwYldz?=
 =?utf-8?B?U3E4QWtUYmVGOXRtNjYrQ1RYWXduQmdTSWVUUzVPWDNSTGRqOVB1UEFTMEhK?=
 =?utf-8?B?Ym9vZk1Udm9kNEtrNTBqeVI1WlphSmxuOWozSVlPUVBCNisydFFENlQ3M1Vl?=
 =?utf-8?B?dUVSMEtEQWQrRkk2bUI0cm15VVFWbnB1MkJYdHFNZUd1b0hyakx5QWdwaDBw?=
 =?utf-8?B?amtyVnE4MHNaK0hDVjdGQ2ZSVDcrRnlZclI4TlZ0ejBOUVMvV2xWdmNCVytt?=
 =?utf-8?B?OWFWbU9sWW5jMkZmUFhjZWZ5T295enQzZUwvMU5FZTYrVkZTdFFIVWloS0hZ?=
 =?utf-8?B?VHcwL0N4bnVHVzk0cDU3UTRVZEZIb3ZZZnJHd1NoOHNKVlJ5NE8venQ2QlZW?=
 =?utf-8?B?UzVPbVBRU0xTZmI4ODFKTW1RQ2pvQ1pGc1VQZjBHWmp4Y0RJQytONTE3RC83?=
 =?utf-8?B?SnNIZFFEVVU4NUZCSFcrcHZJS09wYms4WjFEaXlrNlFZakNBdnZIeDFFN1VX?=
 =?utf-8?B?YUhXclZyM0o4UnhYeGkrWTFqOTkxckV6K1I5WVVwVXQySmRDaUFVL05xL3E4?=
 =?utf-8?B?ZU1WVDBtanVxQU5mY1l4RTd4MTROS2tyajluWU9xNWNwckFvaEFRQUN6RzlC?=
 =?utf-8?B?WVAxa05EZHFSb0hYRmlRRU9TYUVjTk9leWlwcUt3TkZHNWM3dGo0ekF0VGxO?=
 =?utf-8?B?YlgzN2daSlhJa216dDFMSG95bFM5OWRIelF5b2NXSXY3YnhjVmcwRmx5Qlhh?=
 =?utf-8?B?UGVRYVMrNHBKdGhUN25GdTlqNnNVcXJRNjFsR3ZpN0ZTN3Jpei9LMXV2OVN1?=
 =?utf-8?B?eFlNa21kVDdudjF6dUpDQmhaQlJjaWluVktYUXl0ZDR3QjhLQm1jVktMb3Y4?=
 =?utf-8?B?NzI4TUJOem5qWGpZbXBnTW1wTmp3UmphSzlFQ3BvenZ1Wk5idHk0ZWJMb3Jz?=
 =?utf-8?B?R1RzTzY4bDBoeDlWaWxNR2lUVVZwNk5BN0VqSGpCWCs4MkF5a0lWU2tuNFpU?=
 =?utf-8?B?MU9rdWt5NFQ3bENDMk5ZRm9tMzllNU5xZkljVkhWR0ZJVS93b0tLNy9GSHNh?=
 =?utf-8?B?RkthM1JhZk9yUWtjV1Z3TlpTSnRURE5Xa2h3OGM4a3hxSzQwdllHMlVHcWh2?=
 =?utf-8?B?OG91YW96aUJ4Ymw3TnpVcGhPc0pVVHRwTUZycXJvVThpZ3lKQ0loemY1TXFW?=
 =?utf-8?B?MldZMTZydE5YM24zV0pKWW5MTzlEQ3pveXRFbEtGaHpEWTV2MVBWd2tRR1RC?=
 =?utf-8?B?RUo5TSt1bDUyVTgvNmZtMzA4UTAxRUJmOFFUeXI1N3R6WFVEVW5Sb3JxanRD?=
 =?utf-8?B?QW55ZzFBRUJtcVo0OGhIR3VrREJqYjVrVS9pN3FEU0lDMHZZYnFaSTdYTmFj?=
 =?utf-8?B?NytMMWFBZktqZ2lSamhnbVdzRnBxY0ZMREtkaWZiOXA0TFZKYnRjTE5USE0y?=
 =?utf-8?B?Y01wVktJTFhXUnFKNlROeXBoekN1T0Q0ZkpHVk1kWlpNM2hmb0hvalRhMStL?=
 =?utf-8?B?ZkdtZ3kzSTlieHlwRk5JWFE2UklINUdnM1QvN0JZTFIyTFNSQ1dPVHluaS9k?=
 =?utf-8?B?eTIxRmVEQUlTRStLWm5WTnlqTkxXbXExOE8zSVZ2bThYdDZkUGJtdUoyM0Vp?=
 =?utf-8?B?VlU3V3ZjbEg5SjRNZGU1UzYzZEs2MVRUdkJzbWwvT3JqMVM4WFJiUTV0V083?=
 =?utf-8?B?V2R4bGk5UEZMVXAveUJTaFVrMk5sOGpLMThrSExMMURHeEJoRWFPVWdVd1hB?=
 =?utf-8?B?cVE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ba9e23f6-4ba4-442d-eabf-08db0819bd0b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 08:11:24.3654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tgc2oABlnk03h87ZETYlaPCjqtx8s5ABqm7qrCqWZepLfW6Cis/DJqMRObxOKG4h0xcmAgqMPQ5toelL/Q5DHuyk/IGJ1mQlItbCP03+0U0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5435
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
Cc: linux-samsung-soc@vger.kernel.org, matteo.lisi@engicam.com,
 linux-amarula@amarulasolutions.com, sw0312.kim@samsung.com,
 dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03.02.23 13:29, Rasmus Villemoes wrote:
> On 01/02/2023 23.00, Marek Vasut wrote:
>> On 1/30/23 13:45, Rasmus Villemoes wrote:
>>> On 27/01/2023 12.30, Marek Vasut wrote:
>>>> On 1/27/23 12:04, Jagan Teki wrote:
>>>
>>>>>> Thanks, but that's exactly what I'm doing, and I don't see any
>>>>>> modification of imx8mp.dtsi in that branch. I'm basically looking for
>>>>>> help to do the equivalent of
>>>>>>
>>>>>>     88775338cd58 - arm64: dts: imx8mm: Add MIPI DSI pipeline
>>>>>>     f964f67dd6ee - arm64: dts: imx8mm: Add eLCDIF node support
>>>>>>
>>>>>> for imx8mp in order to test those patches on our boards (we have two
>>>>>> variants).
>>>>>
>>>>> Marek, any help here, thanks.
>>>>
>>>> Try attached patch.
>>>
>>> Thanks. I removed the lcdif2 and ldb nodes I had added from Alexander's
>>> patch (94e6197dadc9 in linux-next) in order to apply it. I get a couple
>>> of errors during boot:
>>>
>>>    clk: /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to reparent
>>> media_apb to sys_pll1_266m: -22
>>>
>>> and enabling a pr_debug in clk_core_set_parent_nolock() shows that this
>>> is because
>>>
>>>    clk_core_set_parent_nolock: clk sys_pll1_266m can not be parent of clk
>>> media_apb
>>>
>>> Further, the mipi_dsi fails to probe due to
>>>
>>>    /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to get
>>> 'samsung,burst-clock-frequency' property
>>>
>>> All other .dtsi files seem to have those samsung,burst-clock-frequency
>>> and samsung,esc-clock-frequency properties, so I suppose those should
>>> also go into the imx8mp.dtsi and are not something that the board .dts
>>> file should supply(?).
>>
>> No, that samsung,esc-clock-frequency (should be some 10-20 MHz, based on
>> your panel/bridge) and samsung,burst-clock-frequency (that's the HS
>> clock) should go into board DT, as those are property of the attached
>> panel/bridge.
> 
> OK.
> 
> But I simply can't make that match what I see in that branch. For
> example, there's imx8mm-icore-mx8mm-ctouch2-of10.dts and
> imx8mm-icore-mx8mm-edimm2.2.dts which both seem to have a ti,sn65dsi84
> bridge, neither override the values defined in imx8mm.dtsi, which are
> 
>         samsung,burst-clock-frequency = <891000000>;
>         samsung,esc-clock-frequency = <54000000>;
> 
> and that 891MHz value seems to be out of range for the dsi84 bridge -
> under Recommended Operating Conditions, the data sheet says "DSI HS
> clock input frequency", min 40, max 500 MHz.

Please note that the value in samsung,burst-clock-frequency is double
the clock rate of the effective DSI HS clock. I can confirm that a
SN65DSI84 is able to work with the default settings in general. Still
the LVDS clock is derived from the DSI clock and the sn65dsi83 driver
calculates its PLL values expecting a DSI input clock matching the panel
mode. So you might have to tune this value.

> 
> There's also the "clk sys_pll1_266m can not be parent of clk media_apb".
> Are you sure about those assigned-clocks and assigned-clock-parents
> settings?
> 
> Rasmus
> 
