Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201B87970B0
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:20:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED0C10E043;
	Thu,  7 Sep 2023 08:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::70d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA0510E043
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:20:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NuctsK+GzqF9gVm0xS34sPJ+wJn57IoQEDkJ3ubHt5k9A/aAteSV0kgvBM1dQlpQ0g36dY5tk80Qx2EuJTH2ruAuluG7RjsmVwsmDUzsqffk05n/Brek9iuedxNlO6oSqu9KXjq/twmldCAYc78kq3v/C40zotRQ5THSEq7HVUTE45htqf1IEqw1r4lk2YqYS0CtkWhWz6Gfv1CV6LC9l1iJQus8diSinWa61BZY7psD7RiWINSW3/XKC6qyzDZBAHDFwJAOlOh2X17kkjO5Fc/I/rIkXmuJ9YhrmQZTkIuE6kvPqWGPkNu36fklJ9w8Pq/+c4Iojz/l8UrjgzKt+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZKrl8h7j4GZnx/FGwS20ZV9UtnFXAO8sP5wF8Hv+DOk=;
 b=nHhJSSGanWXkTFWxWGBDkDs+j94bmo4LTFOsie1nFNyhbth7OKD/5Q+l7fZJkPCvwB3+ELCKOUiufGtSNW6jRHntM9z/A7DwsX8SeoMH57lRkfBw+6TaJ8MqThrk4mDpvQaLW3r7+ai5jVPXQnqJwkYG4V59kTHW+bblBOin993cjaOy9gGszqOIJMsSVHPVSL5vMaJtnk3lOcaLdLHMxLDwtvpRrVryxYxzBPUL8WFouYoFlDIC7XzoYBaZ1mAwXo0fBPY1aumTBDZYnlmZpFXdJj+S522G8UI8wGu6q6nEVa/QeJ9FvrrtlLE5b68qBBSE63uJeLW21gFT/BfEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZKrl8h7j4GZnx/FGwS20ZV9UtnFXAO8sP5wF8Hv+DOk=;
 b=J5lxwiNlQ3RHvJbtHHi4pvFZ69e6CAYgxbcY/9diEux8BLvmDEFZGCZ7tNx4HkyO0jDjKOx2FmVzZu7Q1UHaR+G+wnr0wfvTewMXUdJ1/bQf5fmeBBhyeY+9VMulyPYn2+qSyj0crzRyUAX35ufHYSCfmFo5j3xIflwLvDggsIU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by VI1PR10MB8111.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:1da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34; Thu, 7 Sep
 2023 08:20:10 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7c42:15ff:f9fa:b221]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::7c42:15ff:f9fa:b221%4]) with mapi id 15.20.6745.035; Thu, 7 Sep 2023
 08:20:10 +0000
Message-ID: <3230032b-5d8c-414b-b9c9-76dc1dc93d52@kontron.de>
Date: Thu, 7 Sep 2023 10:20:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm/bridge: samsung-dsim: fix various modes with
 ADV7535 bridge
To: Michael Tretter <m.tretter@pengutronix.de>
References: <20230818-samsung-dsim-v1-0-b39716db6b7a@pengutronix.de>
 <a95481b7-e38c-4b7c-be49-4c74e07d3523@kontron.de>
 <86fac1f0-0fcb-4cbd-a983-03a6e7c41097@kontron.de>
 <20230906095615.GB375493@pengutronix.de>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <20230906095615.GB375493@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0370.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:82::25) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|VI1PR10MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b868fc8-0ffc-4db3-cd6e-08dbaf7b4071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: drVHej43GAAQWCGcpGKmFqe7xyhDb7z9nZWjsftCsSdlo4AIFk6s2kq4FlCHBogTaVjkQNwFQqAY1J/g7sisXPrZnXAE3JQU8okUqghmNCUN8iJzHuj6VQK0ArHQoiDL9CQLlmPPTAPvH7IpYB89mqCLn3JW1o1YpS6l+WLeHLxNOGy/R9g4nF7Mve0DoinBEn+jiy01z357MJkpa5mnuoAv76RBkk965ZnispFoPZVOa5OYccmVyaHHO1HAU+fh+Z71d05/Osmlr4QAb3uCPD5ln4nmguW74ZHJX8webrPC42cV47xwNBdfQFbt/RXYc1YvhyU/fX90Y6F+eaGHO1+3Xsj/F5IVTeuexmA/KXHrnfReylnaAoiAu2RTrRk4PrQLErD4m11XD+kIg8QXVicfhPD9L4BrWtOUmpx7vI1BgvLovDNuPYPAeYNVn3kJowofofNcQK+YosfJVCpV7ExWY02acCk7r9bATw46CeliNbhTzfJVg0m3j7uulWn5UKKmI4eniD3UdsdFj2jEuiL716YLpGVZPzxEzIuO72qLg2Cr3oX9bz7nYO+xE7Y9OSpjiprAHiGoUJ46e0cBNBZAEAITV3KM05MuGF7xnuK+q1ZHapIKbbGPjzYBD7/DKgsqdq8/ZN/JHpVKAwqjtw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(39860400002)(366004)(186009)(451199024)(1800799009)(8936002)(5660300002)(44832011)(8676002)(4326008)(6666004)(53546011)(6486002)(6512007)(2616005)(31686004)(83380400001)(6506007)(26005)(38100700002)(36756003)(6916009)(66946007)(66556008)(66476007)(54906003)(316002)(41300700001)(31696002)(2906002)(86362001)(478600001)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YS9ab1FoWFNXbnk5QisvM21NOW95S0tiNzF1bVVKeENZR0dDZVZVZHRvQ210?=
 =?utf-8?B?K3Y5amJIZFRMNVZnQnYvNGk4RU5Zc3pJcjZxS0ZBVTI4QzJVUHV1TS9OVjNz?=
 =?utf-8?B?ZjhyWWlTdVBUeDlmUGw0WlJiZys2eW9kbm95YXFnOW9MRnNzZmx6M2hJa1NY?=
 =?utf-8?B?M1dad1BtTDhtRklvcXk5azF5cFl5cEJGRTZ6UCs5VktHdnpuc0ZlVm0zUS82?=
 =?utf-8?B?cWZQY2UraThkMkh0cUxKN1BYUGhrdkF6K0l2SWJ5ZnNGWk90a2N5Z1NkdGR2?=
 =?utf-8?B?NW5OV2FaMTBEZzAyQy9PQWM0WkZoaGgrS2hiWU1CVUhiK3pxSy9CUlZFQTJ1?=
 =?utf-8?B?cWk5azZQZGxUTW1tUGV5c0J4ZXVWOEtBSy8rbVNvdE1oN3J1OVhHQkQvRVVx?=
 =?utf-8?B?dWtSbk1RdlJXS1RTNVJGeWx4WjlhYVNmY2gzU2Q3Rm1GYVBVM3ZqZ3pBSzg5?=
 =?utf-8?B?a01yZ1FxdUlnR0xWWUsvVjAwTW5WL1ZqSy9VU2FIM0ZKQy9Nc3lTUzlpMU5k?=
 =?utf-8?B?bkhoQW5LMDBqQ0k0MlIyT0tjNW02VjB0OVVHekw3L3dMeWRaWXg1eDcwd3J6?=
 =?utf-8?B?aVFMRjNtU3BORWpDdE52NDRJdCt2K2l5a2d3OFYvNUlRSmpGOCtscmdMUjhj?=
 =?utf-8?B?VDV0YmVId0RjQVZlQnhzNExEbEJWV0srQ1JLY1ZGNnovTVJQUjZJamZtYldj?=
 =?utf-8?B?RDFqN3o3cUNsSzlMM0Z0Y2RQTFFSUndvN1RGOGVncC9hREcxWExBNGZEcGFT?=
 =?utf-8?B?Y3N6WlFpSmNQU2dJclRTS3FyWURoU29TNnlUWjRZSWJ2Q0hqYXFJcXB1enMr?=
 =?utf-8?B?UE5RWnNxemNYWTgxSHVuTjZoYksvK0xxRGdMbTZpd21MUmZuelFOeDRjWXZ2?=
 =?utf-8?B?Uk1LVUNJcjc2ZUs1WUhIRHVUbUN1akJkaVdQVU5pZlUrTnVTV2VmcXBLMTdD?=
 =?utf-8?B?b1R1L1loTzRTT0Jya2dLcHI3MjMxV2JyUXRxMmZJVjJraEVmQmFSOVB2dXZM?=
 =?utf-8?B?SFB0TzVSVFE1L0xFSDJLeUhVeU5Wa0t2MmJCdTdOZ0MwN1Y3eWZHSnJoNGhL?=
 =?utf-8?B?M0MwcjU3Uk5TTDVyWHhmMTBOanNmRjlaZEl2U2ZITE5WRkd5WGsxbjJJVUxL?=
 =?utf-8?B?MEVjV1Fta3BFbER1bHZvaGZ5c0MzWXRBa1JMVlFiSjlWakxQSnBpMkpQZnlv?=
 =?utf-8?B?bzl6R2g4NzlLd21Yem16ZVNUbVdDbDQ2cGx4QUZFaDdxTXM4akMwSmE3ZFRN?=
 =?utf-8?B?Mk9VZTBXZng3L2Z1RlpyUytMZTJraE1qSjRsUzdXdEFUZW9Ydmg0MS9yaDlK?=
 =?utf-8?B?amdQa0YxaUcwYmhoVlFEL1NRZWg3cWdTNkpKWE9ZbnFxK01KN1phelVxWnNT?=
 =?utf-8?B?T0V5Zk5iVFBUMzlXWkJBeVlyQURKUzNzNHhFZEFjYmFRbGtXN004M0phSWxm?=
 =?utf-8?B?MjM5d281NCtpM1hBOTd2OUxxT1pwNkx2aXFWbEhYVlFhTktJdXpYb2VPUGNU?=
 =?utf-8?B?Tk5DV3JYdUtUOVhUSkpLWWs4VEhLUW5TMnpQVEhUdE9hYWdmRXZNUm5xT1hV?=
 =?utf-8?B?SXJKOW1TM3dXSFdiYUlMeHgrWFR4SzdKNnpaSzR5QW05NHNJR1JtcSsvUmcv?=
 =?utf-8?B?VHRwZTA2UDIyeTJaVVhEU00rdm45YzFOZmZaNlhnSUk2bE9oRFNxdTlaRnor?=
 =?utf-8?B?YTlwQWVLbFkwZG0wUzlpcEdSVkhQNmMwYyt1bmFhQnZLZUpUZHVZOStCV2ZR?=
 =?utf-8?B?d0c5M3ZnK2VORUNJMWROUlNHNk0xM0hEQTgvM0xlZXA3bUhCQnhSY0diVlo3?=
 =?utf-8?B?alkzQ3ZWK0FCUXVWVG9Pb24wV3hoZkQrQ0RUNFcxTFl1amhQc3VJdEpUSmhY?=
 =?utf-8?B?M3pzd0l2V0NoeEhpQ0ltVzRidlVFQlMyUGpEc1dmcmJSYWp2MnFiL05jSHc3?=
 =?utf-8?B?ZDJQdWIrTDFHYW5OTzZEQXFwRkMzbDZoWGpLaS9SK0pQd3FnVHQ1MHdqTDdW?=
 =?utf-8?B?aVljUmJyYWcwVzlMQW5yczRVOFJTamtXMHh4eWhQakpmUUVWdCtqREZoK3dO?=
 =?utf-8?B?WTMrWnVoNDJtUzlFRGxBWnJIMTE3eGd5ZnlFSDY4RlM0aitlTUZhVU5zVVEr?=
 =?utf-8?B?MUJhMzhqR1VYb2JzcklHSW45aXRtL0ltYWpVTVUzbmJOYzN6ZEpwd2tpVnJk?=
 =?utf-8?B?d1E9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b868fc8-0ffc-4db3-cd6e-08dbaf7b4071
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2023 08:20:10.1857 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eD1A5HZ2+IkpP259iLZSB/XTUdwa1FcUKKpypVzTAu3AZ+rPOlxeZUvZ2LaMI1njvSQJobPuxb45NL5Fm2EetS5JnFqBkmvk7pIfV7EHyHI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB8111
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-kernel@vger.kernel.org,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, kernel@pengutronix.de,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Michael,

On 06.09.23 11:56, Michael Tretter wrote:
> Hi Frieder,
> 
> On Wed, 06 Sep 2023 11:31:45 +0200, Frieder Schrempf wrote:
>> On 04.09.23 16:02, Frieder Schrempf wrote:
>>> On 28.08.23 17:59, Michael Tretter wrote:
>>>> I tested the i.MX8M Nano EVK with the NXP supplied MIPI-DSI adapter,
>>>> which uses an ADV7535 MIPI-DSI to HDMI converter. I found that a few
>>>> modes were working, but in many modes my monitor stayed dark.
>>>>
>>>> This series fixes the Samsung DSIM bridge driver to bring up a few more
>>>> modes:
>>>>
>>>> The driver read the rate of the PLL ref clock only during probe.
>>>> However, if the clock is re-parented to the VIDEO_PLL, changes to the
>>>> pixel clock have an effect on the PLL ref clock. Therefore, the driver
>>>> must read and potentially update the PLL ref clock on every modeset.
>>>>
>>>> I also found that the rounding mode of the porches and active area has
>>>> an effect on the working modes. If the driver rounds up instead of
>>>> rounding down and be calculates them in Hz instead of kHz, more modes
>>>> start to work.
>>>>
>>>> The following table shows the modes that were working in my test without
>>>> this patch set and the modes that are working now:
>>>>
>>>> |            Mode | Before | Now |
>>>> | 1920x1080-60.00 | X      | X   |
>>>> | 1920x1080-59.94 |        | X   |
>>>> | 1920x1080-50.00 |        | X   |
>>>> | 1920x1080-30.00 |        | X   |
>>>> | 1920x1080-29.97 |        | X   |
>>>> | 1920x1080-25.00 |        | X   |
>>>> | 1920x1080-24.00 |        |     |
>>>> | 1920x1080-23.98 |        |     |
>>>> | 1680x1050-59.88 |        | X   |
>>>> | 1280x1024-75.03 | X      | X   |
>>>> | 1280x1024-60.02 | X      | X   |
>>>> |  1200x960-59.99 |        | X   |
>>>> |  1152x864-75.00 | X      | X   |
>>>> |  1280x720-60.00 |        |     |
>>>> |  1280x720-59.94 |        |     |
>>>> |  1280x720-50.00 |        | X   |
>>>> |  1024x768-75.03 |        | X   |
>>>> |  1024x768-60.00 |        | X   |
>>>> |   800x600-75.00 | X      | X   |
>>>> |   800x600-60.32 | X      | X   |
>>>> |   720x576-50.00 | X      | X   |
>>>> |   720x480-60.00 |        |     |
>>>> |   720x480-59.94 | X      |     |
>>>> |   640x480-75.00 | X      | X   |
>>>> |   640x480-60.00 |        | X   |
>>>> |   640x480-59.94 |        | X   |
>>>> |   720x400-70.08 |        |     |
>>>>
>>>> Interestingly, the 720x480-59.94 mode stopped working. However, I am
>>>> able to bring up the 720x480 modes by manually hacking the active area
>>>> (hsa) to 40 and carefully adjusting the clocks, but something still
>>>> seems to be off.
>>>>
>>>> Unfortunately, a few more modes are still not working at all. The NXP
>>>> downstream kernel has some quirks to handle some of the modes especially
>>>> wrt. to the porches, but I cannot figure out, what the driver should
>>>> actually do in these cases. Maybe there is still an error in the
>>>> calculation of the porches and someone at NXP can chime in.
>>>
>>> Thanks for working on this! We tested these patches with our Kontron BL
>>> i.MX8MM board and a "10.1inch HDMI LCD (E)" display from Waveshare  [1].
>>>
>>> Without this series we don't get an image with the default mode of the
>>> display (1024x600). With this series applied, it's now working.
>>
>> Minor correction: The display does work, but there is some flickering
>> and occasional black screens if you let it run for some time. So there
>> is still some sync issue.
> 
> What is the parent of the dsi_phy_ref clock in your test case?

It's the IMX8MM_CLK_24M default from imx8mm.dtsi.

> Make sure that
> the lcdif_pixel and dsi_phy_ref clocks are driven by the same PLL.
> 
> I saw occasional black screens, if the lcdif_pixel and dsi_phy_ref clock had
> different parents, and fixed it by changing the assigned-parent of
> IMX8MN_CLK_DSI_PHY_REF to IMX8MN_VIDEO_PLL1_OUT in the device tree. If the
> clocks are not in sync, it seems that the ADV3575 has issues correctly
> reconstructing the pixel clock and HDMI monitors loose sync.
> 
> This is something that must be configured in the board device tree, though.

Ok, I tried to set the parent of IMX8MM_CLK_DSI_PHY_REF to
IMX8MM_VIDEO_PLL1_OUT.

I also noticed, that I forgot to remove the samsung,pll-clock-frequency
from the mipi_dsi node in imx8mm.dtsi. This is necessary to make use of
your PLL input clock improvements. Otherwise I get 23.76 MHz for the
DSIM PLL input (derived from IMX8MM_VIDEO_PLL1_OUT) which results in a
HS clock of 300.96 MHz while the display requests 301.5 MHz (50.25 MHz
pixel clock). This is too low and the display doesn't work at all.

Unfortunately all of this doesn't result in a more stable image on the
10" Waveshare display. It seems like the display turns black whenever
the Qt app does a lot of framebuffer updates, e. g. during animations, etc.

Anyway, thanks for the help!

Best regards
Frieder
