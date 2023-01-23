Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCE4677732
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 10:16:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1FB10E00A;
	Mon, 23 Jan 2023 09:16:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2110.outbound.protection.outlook.com [40.107.22.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5908610E00A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 09:16:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IVvzDukf/yltNriOhL3LENAFzqMfVhXaKwCsXyb3DLxOcHvnCo+8LovhiUYkk2CyArn82VgEnN/LUFYQMy/8isarz4pmaQNGvS0vxMtaofLjkMS8d8FATbOr4c/owvOC11D+06/M1U1DsuuIj0tYuuynK/pCTrojV2oMbzlZ9n4A5A5lJjpzSC+L2N0rSCaaX8cTdMDNvjaCKxzr4pHOZD/+7Mho4NSAg11hh5YnVE76J01U2Qt15RwtSsw6Y9kMtS7/0HkZXSBbJRs6TozZgQbbwYkybhQT2/jtzFAlx7BYh7MOO3/0k/TWa7TXGnUdJdS968ggez0CTMkQkw2wIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9F+RjZrJjxEkD0PlBppI/T5OwTrsbFGxBc3ETtjJYU=;
 b=NSrDlXf3ErIYWHG55xHlzJg2SEjW+VA7JuWBdsAzZYe6Z5sYCyqPKuRfU8v5PyKbt8S6wZe+kNmNGBc4h+kQTaPicYxLVA3QP/fb9iJdZKh4xivKwbsOnsUg6LGgl8xlozr2e+Bf2ZzpXLvSyBhYzQj0GjuEEKUj5q/MhGoA//ICueMQdgc5JVR+3fek0Tfo8b72VJejJLY3nkFLwlT/MkZ9NabokJ3l1EuRKn3csgKi7DRZ0wJHaLmIJ53gFp3JYsl3mUmMh+wbi7DoOYCBzJIyUeLq2DbgAeRW/aJKfXcUO4gCvh8+3BmhvVtKkbDHDAQkFtT1HKzu8bICjatDKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9F+RjZrJjxEkD0PlBppI/T5OwTrsbFGxBc3ETtjJYU=;
 b=gcyBerGprh2UvZst+J7D3Rm6Hj+5P+0A7qw1gQTcL2hdEUZn/JcyS/+EE6ohKr/mf3WIXx/M3TiVTD3m4lK0nmfDJgdTh2XZJHQYG9b8kJUqC021aAFGYsAdRHtBppqR6D468Hou3tbJfXhUexzGXs3gHxSCtiI+SSGjDwNDgUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by DB8PR10MB3641.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:13b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.28; Mon, 23 Jan
 2023 09:16:49 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::59e9:ea90:b6ea:3863%8]) with mapi id 15.20.6002.026; Mon, 23 Jan 2023
 09:16:49 +0000
Message-ID: <f847b5ba-8853-a89c-fa84-bd36b2b4b35a@kontron.de>
Date: Mon, 23 Jan 2023 10:16:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v11 3/3] drm: exynos: dsi: Restore proper bridge chain
 order
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Jagan Teki <jagan@amarulasolutions.com>
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
 <20221212182923.29155-4-jagan@amarulasolutions.com>
 <CAPY8ntCBL2Tq2sz6poJZzqP4qWS+OE7NQQqpqX+evfWZgCzwCA@mail.gmail.com>
 <CAMty3ZCGn+ickyA5qaEYcB16P_xpgXjoOsYMsDMz2ELuspifgQ@mail.gmail.com>
 <CAPY8ntAtY45nnx_X6cBafoUBG3Z8kpROFt7kZs7mVC1NBsnAxw@mail.gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAPY8ntAtY45nnx_X6cBafoUBG3Z8kpROFt7kZs7mVC1NBsnAxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0043.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::12) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|DB8PR10MB3641:EE_
X-MS-Office365-Filtering-Correlation-Id: c67f0bd9-da34-434a-bdff-08dafd228eb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jjrizj3Ylg41MPks33vlYAzFOesNw+wkIpyrW8YObMsYtCPbNA2JIHdQoP9FHDciSR0SEiBsU6k2vVJpbj7qcPoV9XVrFPufp/j1asYslhAjI7aH00WEMFaDLoUfaVB0Cr3Zuj6m7UVBurl02ApG+El7GfuxkYo/HvUTrFGZX93qt8+TAebAsWjY2hVYSMJdhirREOeoXR1Yo/LgVIJGqmKOm2EVHU+rBCSiZhmBKIK6U2kLdJGdupBlbJ7UqbTrYhdEW/HAzR3agf6+oB9ueYmuj3l3nspNcWvsJ4FyXozLiZN9IF2er9HhE9/1LwoDqQBSeiSdAWRQbalhJ0dCPP4dZ7J5ynNRN9+uXup0FfJOAGyFTY785R24WfWurUeac0rto+ZE6aNiF+JjeL3eymZYeInxRWk+xBjNDXKT6vK8I2Kcv0OyEKNocG9sZOfquUWf1jDsKRRyznwQgdtDY0eDO1BQ0/JtIv2Xw6XUefgYw7n4R8faObKdKqmQqkAWVyHi5alTSXuv8RVsvtCLlXkHJh8h5XMoRsqbsNuRahlQutM5zpdnjtsqXu0k8oGYEDmJkFSg6/LjKjNMfUKVGftVdMeR0yMtP9IdZCFEK06FTs/4kTkuyXFa1o+P8h7QtbCLNfMP2ytsmMeo97GZcg23VLvB9rHBTJiXDF4UqbzzNDzRPx3A9Z9WoI3dQNJGvmt/WRYlKr7+bjamZ7yfy2ewVF1q4NdGNaCRsRnU7GA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(451199015)(86362001)(36756003)(31696002)(110136005)(31686004)(54906003)(316002)(4326008)(8676002)(66946007)(66556008)(66476007)(186003)(6512007)(478600001)(53546011)(26005)(6506007)(2616005)(6486002)(38100700002)(83380400001)(41300700001)(8936002)(2906002)(5660300002)(44832011)(7416002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zjc5dlYzTUxaWENpbGo1UTJObGJmZ05hUkF2b1o4UmdsZDdIOW5PQlNTbkc1?=
 =?utf-8?B?bmdBTEZHWjErTlcyQ09GUS9UMHFBbnZMeEZPVndFdFdkVjVVVVhqenF1WU03?=
 =?utf-8?B?T1EvSU9STldxcU9aRGIxRVhuSXZ1LzA1aWVQQXV4QWI0NURMczdrTmVKbE4w?=
 =?utf-8?B?MUNVVHJJTStSVWhPT0JPUVBva1dUaVIyeDhOZXJkZXpac1RVcWxJNkRHbVNT?=
 =?utf-8?B?bXRRNjZvalhzeEprNElaT0Z5Z0d1VDhaT2FzMkJQTFJlVDh1NzZVQXNkN2VH?=
 =?utf-8?B?TngvZ1BBSlBndDROMEZPYkNWdW9tQjRBL3dxSUZXbGJ2bTlDV2IxVjcxYk9Y?=
 =?utf-8?B?WHBzR0FmVlR3VkpmSmlzclZjN21DVE9JNTRYbDJPNDN2ZTFabWdqTUhhMG9x?=
 =?utf-8?B?Z2c0cnhtdUN5eUFYQy9XOTU1bE5qWEp0WE0vZGowM1JZTVJIc3ZsWmxIWURH?=
 =?utf-8?B?QTdjMVFVN3RjY2J0LzgraXBpeFIrZnFGUWJDaUpkcnJmQW9xTDg4WXhBTTgy?=
 =?utf-8?B?eEk0eWhDU3p6dkxqTjBob2VwNnRPZUZGQ3c1RzhraUY0V3MvZ2NOOGwwSEda?=
 =?utf-8?B?d0RSb1hRaHVhTW9BeUZ5RlpISHRNY2ZjTi9helplU1JRVU0xZmRhTGxaeG1X?=
 =?utf-8?B?WTllZkF5NkI2VEFLSTBXdHBmME95YVJ1V2hGcFlOcUVySkE2VzJrcmVNQkZm?=
 =?utf-8?B?dEltb0kvMXVIV1QzWDVZMjVPZUJoZmlFb21DY1BHUUxZWG9meEdaNkhPRWhk?=
 =?utf-8?B?Q3FhRnpCek5JNzNtSXhVNE9uNnMvU3A2bGwvOFZNQlRDL3A3SDVnVzc4ZFA0?=
 =?utf-8?B?NHQ0YU9RRER6UHRzNllwOGlCYjhqZUt5N0VMVlA1YWRmRFZ5K3BISTBnTjZq?=
 =?utf-8?B?dU1pTXUva3RwTjllM3dwdUtHck03OGt1Yk5ockovQ2VwWUF6TUV5MFhwbVRS?=
 =?utf-8?B?ZjYzZ3RySGFKcjFMaC93eUZKMHBEY2FvVHNDd2YrU2dNeTk3UVhVQlY2ZEN1?=
 =?utf-8?B?RHFuL2g4Wk5qaEsvL2p5cGgxVlB3NmZ5M2UwQVJpVU5Pb1dQVEt4VE1aRTha?=
 =?utf-8?B?eU5OZ1R3N3FwQThib1NqMWJrSzI2cnJrOTVCbkZKV1Z4TFVPWXU1VFBvOHhN?=
 =?utf-8?B?MlFrR1ZkdVprUHZRUTNBM0IwRVUvRzg3SVNxNXNaRlA3S01tR0FHMzAyU2t1?=
 =?utf-8?B?cWZsaklvWkVyc2V3Zkl4L1pPc2ZGUldOQ05kVkRFZGpqY1Q1MzZRWVlyTlBm?=
 =?utf-8?B?eDNEeW90ejNaR0RrVnVFa1BIM05ZaWRLVTRyRmwzL3lsdjJOOWFLWjMrSTQ3?=
 =?utf-8?B?U0RXdm0yTFh4bHdnSFZ4Tk5Ud3JjOUh2bmcyOTZ4TE01QWRvSm1XVTV3WlM1?=
 =?utf-8?B?d1B2T1VRYkZoaDFaaGwrM2RTMlpmdTY0ZFVjaitUVG1ITVpIVG42eGZjRmNz?=
 =?utf-8?B?ZlhyWGxjNzlTSEFSZ2FSM2JOL1pBQmFWZDVZTk5iRHpSYmtaNkN5SDhNQ3po?=
 =?utf-8?B?SEhwZTE1c3RpZG5ycXR5a2czMEVTZXNoa2pjaVQ5Qkp1M3k4Y2JWV2QxMTNB?=
 =?utf-8?B?eCtwVkMyUHUzREI3cFVEbithQzdyeDdkZHhtNkdDbXRlbElLTEpIeGRKc0Y0?=
 =?utf-8?B?bUIvK1VRSWFPRlY3LzZNR1I1elBadmwvWlp0TVdpcEZ3Ym1yZ0p4MWRqNnVx?=
 =?utf-8?B?SlFhN0R2YnoySUtUMkJZTU1pS1NUakZsNk5kS20vM056RktNeUhKaHBMbzhu?=
 =?utf-8?B?b2pKNWE3djJqKzZyT0k1MER1RnhDbmxSb1ZtckhzeTBEM3BHWFFTbjhkeWM4?=
 =?utf-8?B?S3VvUnFaYVNRTC93TGZWbzFVYXd6UHBGN29QT2duc0dKb3JEZnJBQWlwQURL?=
 =?utf-8?B?d1NKbm9laHNJdkEra0xEc0V1amVVSzZNODNWQW5kUGg5WVc5ajdlNEpSdGJy?=
 =?utf-8?B?UUx2dFNrb2hBd05HYW9ybjZLa29yajI4ekpLalg5V2FURmhydW54V0NXMDYy?=
 =?utf-8?B?RmhnUVBTYW40SnJhMFNtT3FhQ3lGSTluN09KbDRRRnVwRnM3WVRyUklnaEdT?=
 =?utf-8?B?ZkVLSjBkZnFPWEFrbjRWOVB5Wi9EQWlyTVdjLzdoZWNrR29iZ1NFMzFUSVhu?=
 =?utf-8?B?TkQ4aTZnSG1uNWM3N0lzVGY3UFNsak1zdm5zY1JVMlJMYXNYV1paMU9lNzc0?=
 =?utf-8?B?WkE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c67f0bd9-da34-434a-bdff-08dafd228eb5
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 09:16:49.4787 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrWy5BFEvRb1qCp1/vNhqizHxECPtm1LNNq1Df2I85rsd772csmlWwNfZsOHhM5n94Rcvu2doNokUcfLVxsCUxrmN4yXWkIAIoHglTcNVLY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3641
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
 Sam Ravnborg <sam@ravnborg.org>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Neil Armstrong <narmstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20.01.23 20:42, Dave Stevenson wrote:
> Hi Jagan
> 
> On Fri, 20 Jan 2023 at 19:10, Jagan Teki <jagan@amarulasolutions.com> wrote:
>>
>> Hi Dave,
>>
>> On Sat, Jan 21, 2023 at 12:26 AM Dave Stevenson
>> <dave.stevenson@raspberrypi.com> wrote:
>>>
>>> Hi Jagan
>>>
>>> Responding due to Marek's comment on the "Add Samsung MIPI DSIM
>>> bridge" series, although I know very little about the Exynos
>>> specifics, and may well be missing context of what you're trying to
>>> achieve.
>>>
>>> On Mon, 12 Dec 2022 at 18:29, Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>>
>>>> Restore the proper bridge chain by finding the previous bridge
>>>> in the chain instead of passing NULL.
>>>>
>>>> This establishes a proper bridge chain while attaching downstream
>>>> bridges.
>>>>
>>>> Reviewed-by: Marek Vasut <marex@denx.de>
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>> ---
>>>> Changes for v11:
>>>> - add bridge.pre_enable_prev_first
>>>> Changes for v10:
>>>> - collect Marek review tag
>>>>
>>>>  drivers/gpu/drm/exynos/exynos_drm_dsi.c | 9 +++++++--
>>>>  1 file changed, 7 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> index ec673223d6b7..9d10a89d28f1 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>> @@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
>>>>  {
>>>>         struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>>>>
>>>> -       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
>>>> +       return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
>>>> +                                flags);
>>>
>>> Agreed on this change.
>>>
>>>>  }
>>>>
>>>>  static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
>>>> @@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>>>
>>>>         drm_bridge_add(&dsi->bridge);
>>>>
>>>> -       drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
>>>> +       drm_bridge_attach(encoder, &dsi->bridge,
>>>> +                         list_first_entry_or_null(&encoder->bridge_chain,
>>>> +                                                  struct drm_bridge,
>>>> +                                                  chain_node), 0);
>>>
>>> What bridge are you expecting between the encoder and this bridge?
>>> The encoder is the drm_simple_encoder_init encoder that you've created
>>> in exynos_dsi_bind, so separating that from the bridge you're also
>>> creating here seems weird.
>>>
>>>>
>>>>         /*
>>>>          * This is a temporary solution and should be made by more generic way.
>>>> @@ -1709,6 +1713,7 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>>>>         dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
>>>>         dsi->bridge.of_node = dev->of_node;
>>>>         dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>>>> +       dsi->bridge.pre_enable_prev_first = true;
>>>
>>> Setting dsi->bridge.pre_enable_prev_first on what is presumably the
>>> DSI host controller seems a little odd.
>>> Same question again - what bridge are you expecting to be upstream of
>>> the DSI host that needs to be preenabled before it? Whilst it's
>>> possible that there's another bridge, I'd have expected that to be the
>>> first link from your encoder as they appear to both belong to the same
>>> bit of driver.
>>
>> Let me answer all together here. I can explain a bit about one of the
>> pipelines used in Exynos. Exynos DSI DRM drivers have some strict host
>> initialization which is not the same as what we used in i.MX8M even
>> though it uses the same DSIM IP.
>>
>> Exynos5433 Decon -> Exynos MIC -> Exynos DSI -> s6e3ha2 DSI panel
>>
>> Here MIC is the bridge, Exynos DSI is the bridge and the requirement
>> is to expect the upstream bridge to pre_enable first from DSI which
>> means the MIC.
> 
> That makes sense for the pre_enable_prev_first flag.
> 
> The drm_bridge_attach(... list_first_entry_or_null) still seems a
> little weird. I think you are making the assumption that there is only
> ever going to be the zero or one bridge (the MIC) between encoder and
> DSI bridge - the DSI bridge is linking itself to the first entry off
> the encoder bridge_chain (or NULL to link to the encoder). Is that
> reasonable? I've no idea!

I think the assumption is reasonable for now, as it covers both types of
chains this driver is currently used in (Exynos and i.MX). And IIUC this
change is mainly needed for (backward) compatibility with the somewhat
"special" chain in Exynos.

> 
> I must confess to not having looked at the attaching sequence
> recently, and I'm about to head home for the weekend.
> I have no real knowledge of how Exynos is working, and am aware that
> you're having to rejuggle stuff to try and support i.MX8M and Exynos,
> so leave that one up to you.

I strongly vote for leaving this as is for now. We already spent too
much time finding a satisfying solution that covers Exynos and i.MX.
There might be room for improvements in the future, but in my opinion
this is good enough to get merged.
