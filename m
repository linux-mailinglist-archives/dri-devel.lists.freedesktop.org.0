Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E8D6D1C93
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833EF10E076;
	Fri, 31 Mar 2023 09:36:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20618.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe16::618])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C53810E076
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 09:36:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NR5kuA5jPOgIRNzNkXUSEcZFlyhXAFHvfV2G1DugXjoPqcbjEieV8WCwSv1CJ0Kr3hxc+nw/snEEivK4nMhxahy9gMvqC1RTjCz7zQ/ZKd/+SNfjU/uHZ7C3xVjZwfk8niHvbnTK/Ul25u7RJ8WRGOjLNYeZrClFllcTao9RJM3gD7ZYACcZ1d9+wq4UJ4Qr5icfUNrZmhBSg27htK/h91EGC5dM1HMgRhacJVn+17SrHHXkjmvZkUvnieTuxUEXYx4NxcgLM4PNJXlFDSWtcC1JBHBIyTzn4FzIiz0t5UOP08buu+dr3ZVPFex3WcBkgb3kokNaR1moYYjBjFL4ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkCgFFQ8jvrvXawYR7ZiEIaqAFskWCJ/y7K3PIDwsyk=;
 b=akB8vIfsSeF6vIau5gnbJglJfcRmvpmB+Va5qNquQfcuZnM3HnBQzy90hnqeElBADnK2tbTRnFiKfZsj1ev3tDNregeMiwWI2MH5aqLaxxH+8em3FKKWy5adnvFL5rAJBzfXEz6lXuzMcLQmbS/HQKIM5FixnL1KgkqCaYhjntx7SCQW3hj+mIMcRoUtG1ttvTXlzEZC8dJ/Em4oJ22NLEVnjnLrqDp8jArVT+xFX6mqqDxmmdw4Iw2GJltAF1U8gSG9TsGMq8dTbPL3y/2O6wFvlSBDz2JhWMH1LBqsra7FKqgQR2qG3RLzvscN3H2SpgW9WjrF/+u5pEbix1xcxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkCgFFQ8jvrvXawYR7ZiEIaqAFskWCJ/y7K3PIDwsyk=;
 b=YXzbMKWUBpAn2BlfsR2ybUiFDTz+gSu7P7JhhKJvmM6+8Md+E2yT9WArGWoqWmTf5W59QfxKDgtjTIalLBOBAxvXmXUJ5vBtCPsK8WQbPNm2eO1uvJBsBEDdwbwh1BMEqbTQTZ3fod/fc0Lr+WQld0iu2KfSQKMzkAbrb0cnDRg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB6248.eurprd08.prod.outlook.com (2603:10a6:20b:298::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.23; Fri, 31 Mar
 2023 09:36:46 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1%5]) with mapi id 15.20.6222.033; Fri, 31 Mar 2023
 09:36:46 +0000
Message-ID: <5f1f90e2-eee8-d941-e4b0-7f2411a9d415@wolfvision.net>
Date: Fri, 31 Mar 2023 11:36:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 7/7] dt-bindings: display: add panel-timing property to
 sitronix,st7789v
To: Maxime Ripard <maxime@cerno.tech>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
 <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
 <20230316215735.GA3940832-robh@kernel.org>
 <dd26836f-d54c-65d1-0acc-8a09745bb066@wolfvision.net>
 <20230329091636.mu6ml3gvw5mvkhm4@penduick>
 <d5a31f75-eb93-0ff2-cd5b-19cdec58e103@wolfvision.net>
 <20230330145811.asot2cvux4ebbeqy@penduick>
Content-Language: en-US
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230330145811.asot2cvux4ebbeqy@penduick>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0152.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::10) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 16252f78-1249-4a6b-52e1-08db31cb71c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qi0APOedoooMziK4THRju4kn6220wq0k3RLCUB9hn95pO9uLOSdWfvt3O0mgB0BrMmAYkvdVnBBydggIs/8KEfIg9ajCPl4xQIeq6IElxp9zBRFUwg0cBbdJnEeMQXew8lZ/7rJbq1ohgz9A+Oj5YJUmePSOStRuc3ut8aeGMKbtg6IhfsOSYPIH+EVDxMyXIaZ8PcTi1V9v8rde5/IgR4hWxqTjQ+iu0Eh8hp8ckkmcHm2x+HHw/pt7DZcXQjiJviwtFQABL9+B+oOYSSNcWXK6IZwI+Pq/HxDNoyjfTO+7PoBTGJsYTCY06O/v5l4u346aVdCo2gLrnSij/GbEGCbnLHL2Ejs4FjrlJieflygaWYsVUgFHcWvP3s96BQ+lcIyFa7BXV23sBzauVAxVAkbGJbotJ+o4/b1V++uOVsFXokqqiLBuRd5EyU3+f0EIx0b1ZgtrTIgPmUPqRXrwzwQvFvL+7NaeHjQUMAp/oI2bwe4b94uIj8IHLXi1o2ToBqm6lcoGeEmNz+4BXOONERL+ZtRRpqAG3EHH1fj7SQE6r0nhXqmgl2NdeAJ9YNbejdmpC3SbEOkAPgCfdSZD+JkmcVtzDQtc4QnA7N+dAn4sgpKfSlSnvmoEqTk6HVSQzqLrAzxhKvOlAFivvmZcBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(136003)(376002)(396003)(366004)(346002)(451199021)(36756003)(4326008)(54906003)(6916009)(8676002)(966005)(316002)(66556008)(66946007)(6486002)(66476007)(53546011)(5660300002)(41300700001)(8936002)(478600001)(2906002)(44832011)(7416002)(86362001)(31696002)(38100700002)(186003)(2616005)(6666004)(6506007)(6512007)(83380400001)(31686004)(66899021)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1BKaUpqNTQwVHFLUFViOXA5RWlhYncrb25tbFprcGVGdVBDbnZwb29UbzU2?=
 =?utf-8?B?VUJyTC9BMzRyS3MxelllODdBejNUdHlUQUdhb1JZTGVZOHN1N29BV3FTeXJJ?=
 =?utf-8?B?cjhTTVp0VHU5aHpyR2dxd1FKd0p6aUZTcUNleGFoK2xtY0hEaGF1Tno2c01q?=
 =?utf-8?B?V0pZQUJYR3ZxMkZkVWFuR0VJbHludkcwejVjQ24rdWtNS3hRdVR6clY3dndp?=
 =?utf-8?B?UGg5NHF1a3dFUEtqTmtob2RYNFI2Qm41aitSMVljdGs4ajlqZHZlNXBWTjAy?=
 =?utf-8?B?eXNRMlM2Y0NrMXBBWjVQWHcxVjhkN2RYODdjRzhLLzNwYUh6S0trblNjNXhX?=
 =?utf-8?B?bXhsMFdURE5iM29ScjJZRmFTZE05ZmJaMDFuNGNoRmtDQmZ5REM0cjBqQytW?=
 =?utf-8?B?N0p1MENPVWp5RVIvUFFDa1BuMXRzdVh4MlgrWTM5dk9QWDBMZ3cxanMwSDB1?=
 =?utf-8?B?cUliSHBGMTRvZCtXVU84czk1QVN1RGxLTUhKb0JqQVlEWnpOTVR5RjZIUW9l?=
 =?utf-8?B?VnRhd2I2bnlSZWNiVDY4cmVCeTdQSjVpTWdhanR0OVY5Y0RKK3hqZGJ0N2RY?=
 =?utf-8?B?bmxVMDE3Ri9yL2FsQkxTMGNqQklRWGNtclNKVWwzdFZpV2p4SjQxVnMwSlhx?=
 =?utf-8?B?SkRaRkYrYS80TlJkWXFnTUlTSHYyYUVNTFNsR2NveWZPb25jSGl5Mm01eStW?=
 =?utf-8?B?R043WGhaODZUbjNXQUl0M0QzMnhyeFdPWWhmdWtubWpIMmZ5ZExpaEVnRVdi?=
 =?utf-8?B?VUZCSnRHS1RURUNiMnFaTHNCamdYUGFvaXFLOXZLK243L3VXd0FSWFBpK2FX?=
 =?utf-8?B?eEJOc0h6eFJSWFdPS1A3TjREdEc3Z3U4SVRFelZZT0FVMy9QUHp1WTJDa29q?=
 =?utf-8?B?UFZ5MjZVQ2RRbUJIbWlGY1pZNmNBOVFKZ29mN1M2eVNPL01YL1ZOSUMyMytF?=
 =?utf-8?B?aFZFOHR0ODZ3YXl6QUUvcWdZUmFWRVphS1RSRHlHM0preC9MUGFqeVBac0Zv?=
 =?utf-8?B?RmUzWG8xb0JVV1FaY0ZoL2F0bkxMR2F5WUtTOTQzTC9qd2dsYkl5Zmo2UHdX?=
 =?utf-8?B?S0dBNHBBRHduNGk2TFY5RzBGeWVIVVJUMDNJbTlLWVl6bFgvWW1qMld0Qk1z?=
 =?utf-8?B?dzE5NjFMaXV6TlFsTUtVMjFpcnFDR0hGbGUvbXcrOGhaak0rc0R2U3hob3Fq?=
 =?utf-8?B?ZERsMXI0cnJOSmY3QUNxUjl3U1RhaTliWmVVemxEUFVqOEdRYjhGSWN3T0xH?=
 =?utf-8?B?dlhmQkJSOWhpd1FIdkowakNKc25yRU9DS29nNXJhWGgrR1FGaWdxa2JIaFJN?=
 =?utf-8?B?eGwrVHNIc0w1L0YrWDAxSEdPZUlHcFppOEg0bkwrN081SExKeWJ4NXpLRHo1?=
 =?utf-8?B?ejNUZGJWdW5FRGpRK1BOd1Fpc2twL1liMlRHMXlKWjBmbXVCNWx5MXE5SGJ5?=
 =?utf-8?B?ai91Y1Vua010WVorczE5enZhenl5aTBnam5pR1QxYTYvZnhjZG9aQ1Z3MnRI?=
 =?utf-8?B?V3pjOW5vNFQ3Z1JHVDVFeVY2c0ZLSkY5VGVheGVvcFVkTndNMzI0ZE85RTFF?=
 =?utf-8?B?MzZNMVdJc1ZSRUNtWGRVVFRnRTdQOTQvcW1iSjRKcmJrQU4xREFXd3I0ZDU4?=
 =?utf-8?B?ZmFoTFdyb25RTkJLY2ZOWGhpT2wxemhtTkdia29ENXpHTXpCUGNaZnNMNlpJ?=
 =?utf-8?B?VWxHcWxaS3p3dUIwRjllbTRwR0orbEdNNGpxUTE1bzhIYzJKb1BVbjE1a0Qr?=
 =?utf-8?B?WXc3YkFBejlQRktTR2NabzVLdTlWK0lEek1tckxGRVB0VnhTSStkd3pUYU1n?=
 =?utf-8?B?MFZMZkNlQU9HSlpoa0cwZkRzMXRDU3h5WkxjY09GMTFvSWovUlA4aUhtS1dU?=
 =?utf-8?B?L1lVbWdTSFNIbWFtYlVIUFY4U1M5bTQrYlpGbUs1eWRSd0N0Q2ZicDdjZ09x?=
 =?utf-8?B?aDU0bE1jREVrVm5zUmx2RWNDUnFRdFNkeWlXSStzUEhxREhnd2E2b2hhQVht?=
 =?utf-8?B?VHV3d1Qvc2lUWFJrQ2xnWmIvV1d5N3cyYm9vVEVocm9nd3RLSS9wMUw5bVF5?=
 =?utf-8?B?RG4xZmZJMFZYSDFYYXRubHE4VmlQcHNsNHpCMUNXdHFSOS9LK2llY0hIcnpN?=
 =?utf-8?B?ZjBDajBlTmxiV2lZMnJ0clJIdFpXUXg1K0VvSW0yOEtsaVcxbFk0Rmd3aVR5?=
 =?utf-8?B?ZFM1dmlsN1BSRG5LWUlTRElrMkYxV0tVd0xpMTVIT1ZVOTlkWHBRR21ha1hR?=
 =?utf-8?B?Qk9LSXRQdVRlSlNYVklHRG1yejF3PT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 16252f78-1249-4a6b-52e1-08db31cb71c5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 09:36:46.1320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +1WdOzl4gdhzHF5ffCKPHwKfRuv1ToKM9CwtI8igK4Nrdc1yyb40bLu0PtpJ30XV+OtgDblwvhKCBORm3d0SPcrr7rhRNyD1fU+uoIp6a3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6248
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Gerald Loacker <gerald.loacker@wolfvision.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On 3/30/23 16:58, Maxime Ripard wrote:
> On Wed, Mar 29, 2023 at 12:08:50PM +0200, Michael Riesch wrote:
>> On 3/29/23 11:16, Maxime Ripard wrote:
>>> On Thu, Mar 16, 2023 at 11:29:53PM +0100, Michael Riesch wrote:
>>>> Hi Rob,
>>>>
>>>> On 3/16/23 22:57, Rob Herring wrote:
>>>>> On Tue, Mar 14, 2023 at 12:56:44PM +0100, Gerald Loacker wrote:
>>>>>> The sitronix-st7789v driver now considers the panel-timing property.
>>>>>
>>>>> I read the patch for that and still don't know 'why'. Commit messages 
>>>>> should answer why.
>>>>>
>>>>>> Add the property to the documentation.
>>>>>
>>>>> We generally don't put timings in DT for panels. Why is this one 
>>>>> special?
>>>>
>>>> For now, having the timings in the device tree allows for setting the
>>>> hsync/vsync/de polarity.
>>>>
>>>> As a next step, we aim to implement the partial mode feature of this
>>>> panel. It is possible to use only a certain region of the panel, which
>>>> is helpful e.g., when a part of the panel is occluded and should not be
>>>> considered by DRM. We thought that this could be specified as timing in DT.
>>>>
>>>> (The hactive and vactive properties serve as dimensions of this certain
>>>> region, of course. We still need to specify somehow the position of the
>>>> region. Maybe with additional properties hactive-start and vactive-start?)
>>>>
>>>> What do you think about that?
>>>
>>> I don't see why we would need the device tree to support that. What you
>>> described is essentially what overscan is for HDMI/analog output, and we
>>> already have everything to deal with overscan properly in KMS.
>>
>> Thanks for your response, but I am afraid I don't quite follow.
>>
>> How are we supposed to expose control over the hsync/vsync/data enable
>> polarity? I only know that the display controller and the panel need to
>> agree on a setting that works for both. What is the canonical way to do
>> this?
> 
> So typically, it would come from the panel datasheet and would thus be
> exposed by the panel driver. st7789v is not a panel itself but a (pretty
> flexible) panel controller so it's not fixed and I don't think we have a
> good answer to that (yet).

Then it seems to me that creating a panel driver (= st8879v panel
controller driver with a new compatible) would make sense. By
coincidence Sebastian Reichel has come up with this approach recently,
see
https://lore.kernel.org/dri-devel/20230317232355.1554980-1-sre@kernel.org/
We just need a way to resolve the conflicts between the two series.

Cc: Sebastian

>> A different question is the partial mode, for which (IIUC) you suggest
>> the overscan feature. As I have never heard of this before, it would be
>> very nice if you could point me to some examples. Where would the
>> effective resolution be set in this case?
> 
> So, back when CRT were a thing the edges of the tube were masked by the
> plastic case. HDMI inherited from that and that's why you still have
> some UI on some devices (like consoles) to setup the active area of the
> display.
> 
> The underlying issue is exactly what you describe: the active area is
> larger than what the plastic case allows to see. I don't think anyone
> ever had the usecase you have, but it would be the right solution to me
> to solve essentially the same issue the same way we do on other output
> types.

OK, we'll look into the overscan feature. But still the information
about the active area should come from the driver, right?

Thanks and best regards,
Michael
