Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9BB62938C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 09:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58FB10E37E;
	Tue, 15 Nov 2022 08:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60124.outbound.protection.outlook.com [40.107.6.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8913310E37E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 08:48:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XS2gvD3nX6f8qdMsGzCFdtBfQ5F3ZQBOK7H4fKA+4Iy4MxGMGSt4BaiLgICPCg3IlZ6qIHMb2MX8M7J5VL/vFb6XtEWMcGu3g6KmQbBvTlBlcDlUDSS0rmsMa+FyaTAoZOm21axO4rinuOe4Rgh3J3IpV2acDe77JrvDYL7wBpdhWvpiShUAR6BqSkYxd8clCJqNJJ0VAF3aGHUZc3SL/QmEu1Rmvw57tYKiwbw+OA5M1GIKX3t1ezNXqM2Q6VsMVoHVQq/PcYwfvoRFwduEdzgo2PstyjsSfNbAjvfZwf/el0KEN6TvXAyiSnv9HnEQV5Yk5185BQqv6iBXX1ps4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xspc5YJsQgnLaVB8rFJH49ItAbPPT6HqBi9y/3STbMw=;
 b=QuLLe8AoiYfnruPVn9d/O2+IcNMFnBomhRSizwHHUUEXNe/7otf8epd9njfDXLwo4U1JCCTCvrqVL6BGxr1sYF3e56zdReXw9PGqGUm1aF4Is8jB92a6Fqn5vJJy9LhtuCueiWDrzodTtykkxPsqkUzvkz8SBP274BySawBfchpGmW9jaMdz/mk+7OZM7tREEt3Wrkc50jgopq6ni4kAa21nRPudCcimJ5RRt4k0HnIMsTUvrLmj4oBWg6rcjcoPm0RI12+YKOrCB3AhVsY6tDcZBj1zmNHdSL01+wI4Shr/2k7SX5uLpNneoiwm46eRqR0jmQlvqP//h6VNsDQDww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xspc5YJsQgnLaVB8rFJH49ItAbPPT6HqBi9y/3STbMw=;
 b=bWcUuzrwS0eU5kL88WzPBviTX5qvePGmUsmDU9ONWKdhZsnVbSQoOF35vNEONcijOjc1TWdjTn45nWndvpTqeBsIurrEzVC64cpkvsv66AfZkGONU9RmRIcCyT5LK0ePre5n7xw8SvREV7ewudQwcrwISh7bM61nnb+E7Z34gpA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by PA4PR10MB5660.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 08:48:21 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::f209:bc86:3574:2ae6%5]) with mapi id 15.20.5813.017; Tue, 15 Nov 2022
 08:48:21 +0000
Message-ID: <4f9dd1bd-a5c8-c14a-fabd-bcc53406a4a9@kontron.de>
Date: Tue, 15 Nov 2022 09:48:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <CGME20221110184122eucas1p11379ff6b85cf9a66455a026259c93340@eucas1p1.samsung.com>
 <20221110183853.3678209-10-jagan@amarulasolutions.com>
 <b13635de-26ce-a8e8-e38e-13c49a99312d@samsung.com>
 <56cab7d0-d9fb-d890-0b1c-678980eafd9c@samsung.com>
 <CAMty3ZD_+m_3aj2-rXThaEDtP=m3Knfo=bmXvMPH_7LSf6N5qA@mail.gmail.com>
 <928ec100-83c0-cbfe-8005-ccf872538999@samsung.com>
Content-Language: en-US
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <928ec100-83c0-cbfe-8005-ccf872538999@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BEXP281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::14)
 To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|PA4PR10MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: b528d550-212c-4a22-139c-08dac6e62631
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9CE+5faMo7tV+pZJvcImb5w9FZXIU+Z+QlOiQVI+5/dkJtO8/2Vzi+CPibWGiXFbYmrmZ41CgyfLS0z5CxaXR1exSJMfgkoYZEPYrQbIJcjq7Tm5ZMhOH/sMo8aRN3W6c8advzXrRGSH9ZppEQOi9qxrzrVBvWvNov/kSU7aG25xVlpoYIxcf6gYX2XRnYlAcCuK6Nuyao1Wt4vIidJTVwPXSM8DElzBfFkdblVcx4DeqzdTTWor+1cY3PRPeBFMsqivW2oDfQlM8WA6S5YWibWqSIGOUd97Jw2PC7K0F6qwdCeG4vv9Jj9e45IIYjvJcDRkSHD1jATt1NEcvhG4Wu2yQWBUPztEJMcJJGM4SIP1KtRCLStkGYQNQEh8+l747mxDlzCvn5SC6/yYzWVTnt8izK9o8sGrNrgDPbYxg8KuMXl513n5uadGZVBpeaFDUsocaKNOYC0tvCXEYuwnP0i2fLVqRHzg5mZzZFc65JhJLMZXLnn91P53w4TcYR0hqB49AVUTk6W2idoAWvSwmVqS8ssCySL5M9FXZF58KHhR3Ld96OnpFjA6VAtNRnHQdn2x/evmLrVcR7yEIJlDBpTfref9VJBxK7mJVfOo+w+ds+8wOP9lHPIDbB43nKDO4QdtF7TpGHYReg2xTIuwfyofHy1yZZJvkLOoTtnBCC2qB5zXutJdwXwymbixhT7VjzpicKtAurFMCbq2X6GQqa5cxZYabo+qeq7MHa23CgR1lMzQLIZNjAoos9B5Lgd2o7yotwXmv0H8sntAvLP4XMRKBt8Ig5YDLe+4D/rLHko=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199015)(2906002)(44832011)(7416002)(5660300002)(41300700001)(66476007)(4326008)(66556008)(66946007)(8676002)(316002)(110136005)(54906003)(53546011)(6506007)(6512007)(2616005)(6666004)(86362001)(31696002)(6486002)(186003)(36756003)(83380400001)(478600001)(38100700002)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjNML2h5L2ZDaTZPck1pM081Tko5c2hqVTV5K21QTXg1aVZtZDFYWG1yNlBi?=
 =?utf-8?B?SVVtTEhhQWwvYnBPMjIrZEp2dXZvWFptbUJjM0oreWhwenhiRmppbGdYdENs?=
 =?utf-8?B?UWJHbnhZTTZpZzQ1RStaakNIeE9valptVVFXZzduZjdMSUR4TFYrZHpKamdF?=
 =?utf-8?B?dUJTYVZYUnBZeFNCN2Q1VjdPVE5DdXQ1N3J3eTBiTytMSDZLY1duamdEQUlh?=
 =?utf-8?B?Qy9nZWc5R0plaVRoZGd4eEFmdlhVd0dVV2luVWh3cG5XQWt2dGdHV3VPdlRN?=
 =?utf-8?B?VW1SaGltRmxtWnRnam90K1pidTd1ZC9tU3paRTlneU5vdFBQTGZZQ0E4a1k3?=
 =?utf-8?B?enBIVmUvbU10elVoemsvYjdlOVFLd0lzZzhwMUxRamhDK3FJVXhDOG9MWG1V?=
 =?utf-8?B?VkVPVzU5eTh0SHpTQWlHeCtkQVptVFFXcVFVNCtDNjFSYzIwZXVRMFhKQWph?=
 =?utf-8?B?U0pYUFBmRnErLytFMU1Xc0dCcWRaelc1aUZkMDIvNklMUFNDK0tMV09KMyt2?=
 =?utf-8?B?V3UwcXpIejJXd3lyWEVqbExPZHF6bFlla2VpYUo1QkI2OVdPZ2ZVQ1B2NWJM?=
 =?utf-8?B?QlZpa3NXZGlYNnNkOFgydjlkV2g4OHZSUnE1YnFEU3FLcVV6Zmp3ek01VHBu?=
 =?utf-8?B?bnZoblZqdXpNUEFqVEhheGJ5M1NMQUtYelA2em1iaGtLTzlQcTdOeEwrNXlK?=
 =?utf-8?B?bDFDekVPQ3RIbEJZQXQzMmcrWmFlL3k0eWZwM205VlgxMWdJb25kcDJlZDJq?=
 =?utf-8?B?RGNXQlZTY1RGSFJIcnllcHlmT1I4Z2gxbit3MVloRDJsVWFqV09EeWFzbFZW?=
 =?utf-8?B?ZWpLeDdpWVQ3NUZ3a1lBdHd0d2dQRWNVTktIcFpGOVV3ckpvRkhOUGFKd0VF?=
 =?utf-8?B?OENhNFpGRDBNWVQ0Rmhvb3V5WmQvTTZjWU5TaWVTZ3dVRmVMaFBEa0RzLzNu?=
 =?utf-8?B?eWNzbGlCbHdmSFVaQ004TTVGZlN1Z2ZBOXJMNlI3ODYyb05NWkI2VGFpd2ZM?=
 =?utf-8?B?Qk9nVnVqd0IycElHaXd6aGRIYVFueDg2ZUg4QVNFT21uWW5zaHdXZkNOMGNp?=
 =?utf-8?B?SnAwWG1ETE9VTWE5VDVSOThWRHRIY3dhYURTeENUMXdrYWxTeEVRcSttWmM0?=
 =?utf-8?B?eW1zaVhaVVJKYWd2ZUJOWnNnOWZNb240RnQxZUxmdlV0aXo5TjJqRzBWU0JK?=
 =?utf-8?B?YTI1SHpsdHAwUHhrVmZBWmxuVlRmTGI5WnFPQ0dWNTRldFJSK1l2UUVIYmpQ?=
 =?utf-8?B?djhnQmp4QkxNV240U1ZWYkp5dFNCb2RJM3BVUERDOWU3VzFYN3g2MGNDSWFQ?=
 =?utf-8?B?NnFkR0tRWlY3T3lHRjlYdnBETGJ1aktQLzhBSW85b2VReGtVQ1dNUkhkQ2Zu?=
 =?utf-8?B?L1NRNmM1RUhKeXlqMWI1VFpoWmpFTXlQZC9tcmRaS3hjZHBESTdaV0dLdUI1?=
 =?utf-8?B?MHE3Z0FubnZVdmFUa1QrZFY5RTJUcmRMU3FMOWJwV3pPaDV0QVlkTlM1Z1pQ?=
 =?utf-8?B?bTh3TTIzOFNaQ3FQa01IRGhNNzZDdHQzdW5HaHpzMFNOYVczQ2tnRGxRcWlL?=
 =?utf-8?B?OVVhOEJha3hiWTZJcGpPaFFRMWYxaG4ycUZvWHpqMXRuMWJsT2cwb2xsU1dK?=
 =?utf-8?B?QStIcXF5TmVWM0NWcWlwejMvL1lhNEY1MkpPSWpHM1c3V2o4dC9IUFArK1dQ?=
 =?utf-8?B?ZElzdi92bldVYjVsbWdyOXE2WUcxNmorSXBiQytOeEF3RlhEVzIzK0J6Qys3?=
 =?utf-8?B?UjQ4ZjAyNkdESWtFZXA1OVBVUVhLQ0l3RER3TXU5Y0w0T2Z6Z1NUVzdIc2NP?=
 =?utf-8?B?WDZnMTVHaTlydm5GdktEdTlrSUwrWENFVUplMURqdXNWNWJ3YURVbmFYeFZY?=
 =?utf-8?B?MXROQWk0ay9hZzAwWjNBRWdIdkFFK3JiVUNlVjRydXN1bzUzcFo1V1JvenVC?=
 =?utf-8?B?T3BWenpuT0RhTUhyVGEvb2M0eEM0dU95RktOVFVveHV5R1hVOUZ6eWFEM1lB?=
 =?utf-8?B?Sy9YMUJIU1N5UFFYOFI1bDVwdUo3czFSQ3BMVFZML3dsZHVRZWlzZWxlM3Fq?=
 =?utf-8?B?VlpFanQwVVRpSjNOaiticVUycWt1K2pvMWxLZHJ0aDRobTZyNFo0bDhmZWEw?=
 =?utf-8?B?SFdQalA4ZHJIbFNuSXI2SDEvYVZiRm1Ddzl0S0l0WnVFVDlpMHZJenMwV1NQ?=
 =?utf-8?Q?RQFijGpvO9pbI3qDMStagOReD9umOZ0rz0e963dw5+TU?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: b528d550-212c-4a22-139c-08dac6e62631
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 08:48:21.4074 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pdIe/SXY9FLdB+0IZwkdkyLaqJ0+WwNs+Oaa/unBqGeiQyA2vx70bBsP2M19sLjXQmdUtE5QffxXA28yljK/aX6dmHBQR5h+yF1EZrnOEg4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR10MB5660
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
 Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Matteo Lisi <matteo.lisi@engicam.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15.11.22 09:09, Marek Szyprowski wrote:
> Hi Jagan,
> 
> On 14.11.2022 18:07, Jagan Teki wrote:
>> On Mon, Nov 14, 2022 at 8:10 PM Marek Szyprowski
>> <m.szyprowski@samsung.com> wrote:
>>> On 14.11.2022 11:57, Marek Szyprowski wrote:
>>>> On 10.11.2022 19:38, Jagan Teki wrote:
>>>>> Finding the right input bus format throughout the pipeline is hard
>>>>> so add atomic_get_input_bus_fmts callback and initialize with the
>>>>> proper input format from list of supported output formats.
>>>>>
>>>>> This format can be used in pipeline for negotiating bus format between
>>>>> the DSI-end of this bridge and the other component closer to pipeline
>>>>> components.
>>>>>
>>>>> List of Pixel formats are taken from,
>>>>> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>>> 3.7.4 Pixel formats
>>>>> Table 14. DSI pixel packing formats
>>>>>
>>>>> v8:
>>>>> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI DSI/CSI-2
>>>>>
>>>>> v7, v6, v5, v4:
>>>>> * none
>>>>>
>>>>> v3:
>>>>> * include media-bus-format.h
>>>>>
>>>>> v2:
>>>>> * none
>>>>>
>>>>> v1:
>>>>> * new patch
>>>>>
>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>> ---
>>>>>    drivers/gpu/drm/bridge/samsung-dsim.c | 53 +++++++++++++++++++++++++++
>>>>>    1 file changed, 53 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> index 0fe153b29e4f..33e5ae9c865f 100644
>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>>>> @@ -15,6 +15,7 @@
>>>>>    #include <linux/clk.h>
>>>>>    #include <linux/delay.h>
>>>>>    #include <linux/irq.h>
>>>>> +#include <linux/media-bus-format.h>
>>>>>    #include <linux/of_device.h>
>>>>>    #include <linux/phy/phy.h>
>>>>>    @@ -1321,6 +1322,57 @@ static void
>>>>> samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>>>>>        pm_runtime_put_sync(dsi->dev);
>>>>>    }
>>>>>    +/*
>>>>> + * This pixel output formats list referenced from,
>>>>> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
>>>>> + * 3.7.4 Pixel formats
>>>>> + * Table 14. DSI pixel packing formats
>>>>> + */
>>>>> +static const u32 samsung_dsim_pixel_output_fmts[] = {
>>>>> +    MEDIA_BUS_FMT_UYVY8_1X16,
>>>>> +    MEDIA_BUS_FMT_RGB101010_1X30,
>>>>> +    MEDIA_BUS_FMT_RGB121212_1X36,
>>>>> +    MEDIA_BUS_FMT_RGB565_1X16,
>>>>> +    MEDIA_BUS_FMT_RGB666_1X18,
>>>>> +    MEDIA_BUS_FMT_RGB888_1X24,
>>>>> +};
>>>>> +
>>>>> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
>>>>> +{
>>>>> +    int i;
>>>>> +
>>>>> +    for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts); i++) {
>>>>> +        if (samsung_dsim_pixel_output_fmts[i] == fmt)
>>>>> +            return true;
>>>>> +    }
>>>>> +
>>>>> +    return false;
>>>>> +}
>>>>> +
>>>>> +static u32 *
>>>>> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
>>>>> +                       struct drm_bridge_state *bridge_state,
>>>>> +                       struct drm_crtc_state *crtc_state,
>>>>> +                       struct drm_connector_state *conn_state,
>>>>> +                       u32 output_fmt,
>>>>> +                       unsigned int *num_input_fmts)
>>>>> +{
>>>>> +    u32 *input_fmts;
>>>>> +
>>>>> +    if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
>>>>> +        return NULL;
>>>>
>>>> Please add support for MEDIA_BUS_FMT_FIXED and maybe default to
>>>> MEDIA_BUS_FMT_RGB888_1X24 if requested format is not matched.
>>>>
>>>> Otherwise the above check breaks all current clients of the Samsung
>>>> DSIM/Exynos DSI. I didn't dig into the bus matching code yet, but all
>>>> DSI panels requests such format on my test systems...
>>> I've checked a bit more the bus format related code and it looks that
>>> there are more issues. The DSI panels don't use the MEDIA_BUS_FMT_*
>>> formats thus the bridge negotiation code selects MEDIA_BUS_FMT_FIXED for
>>> them. On Arndale board with Toshiba tc358764 bridge the
>>> MEDIA_BUS_FMT_RGB888_1X7X4_SPWG output_fmt is requested in
>>> samsung_dsim_atomic_get_input_bus_fmts() (forwarded from the LVDS panel,
>> dsim => tc358764 => panel-simple
>>
>> If I understand the bridge format negotiation correctly - If
>> atomic_get_input_bus_fmts is not implemented in tc358764 then
>> MEDIA_BUS_FMT_FIXED will be the output_fmt for dsim so we can assign
>> MEDIA_BUS_FMT_RGB888_1X24 for FIXED formats.
>>
>> from include/drm/drm_bridge.h:
>>
>>           * This method is called on all elements of the bridge chain as part of
>>           * the bus format negotiation process that happens in
>>           * drm_atomic_bridge_chain_select_bus_fmts().
>>           * This method is optional. When not implemented, the core will bypass
>>           * bus format negotiation on this element of the bridge without
>>           * failing, and the previous element in the chain will be passed
>>           * MEDIA_BUS_FMT_FIXED as its output bus format.
>>
>> As I can see tc358764 is not implemented either
>> atomic_get_input_bus_fmts or atomic API, so I think dsim gets the
>> MEDIA_BUS_FMT_FIXED bridge pipeline. I have tested sn65dsi without
>> atomic_get_input_bus_fmts I can see the dsim is getting
>> MEDIA_BUS_FMT_FIXED.
>>
>> Can you check the same from your side?
> 
> Here in case of Arndale 5250 with the following pipeline:
> 
> dsim => tc358764 => panel-simple (boe,hv070wsa-100 panel)
> 
> the DRM core requests MEDIA_BUS_FMT_RGB888_1X7X4_SPWG format, taken from the boe_hv070wsa panel (see from drivers/gpu/drm/panel/panel-simple.c). Please note that in case of Exynos, the reversed bridge chain order is used for dsim, so this is another nasty consequence of that hack. :/
> 
> Maybe if no compatible bus format is found, the driver should force 
> MEDIA_BUS_FMT_RGB888_1X24 until a proper format negotiation is 
> implemented and hacks removed?

For this specific case, wouldn't it be better to just fix the format
negotiation for tc358764 using atomic_get_input_bus_fmts()? It should
probably do the same as sn65dsi83 and request MEDIA_BUS_FMT_RGB888_1X24
from the DSI.

Forwarding the LVDS-specific format to the input is obviously the wrong
thing for the tc358764 driver to do.

But I agree, if there are other problematic pipelines with other
bridge/display drivers that don't pass a correct format, we should
accept them for now and fall back to a sane default
(MEDIA_BUS_FMT_RGB888_1X24) and fix the other drivers afterwards.

Let's not delay this series any further and better work on how to get it
merged before we miss another merge window.
