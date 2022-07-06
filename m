Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2185685E6
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2231137A1;
	Wed,  6 Jul 2022 10:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70109.outbound.protection.outlook.com [40.107.7.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC7E1137A6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 10:43:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5W0nqXsVJuaVGtqzdEE4Da++Z8TZLApK+yQNwmR+bn92UVbCpOEuBAAAR2jXP0Nwd41YGcjdRo8xshANeF7Q7iJXnzJ/jcPmnOlBK00rqorqepGTrnYz0tM+idm0FSlRF/w9KWs9FzHBZJWBmaciKXBfKXGU9igcpBn9EaKJ6VBMOv23fn2a+6YGv/S89XiJBtZypga/NBN/E6LMuJKksbb5+GVbCQ6BCDSI+mEM3C/j3SevmsAXNgL+stCva6OiW8UDoTLo6Hv4pzgh8XmWgsL6Rg7pTEmCKoiEZeDJCU4RNTGMsKnU5+zJmKjfUYDS9dhcz6P8Grmj52ymMcdmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNVAg8FDfqcw2knflygagc4B1EYIO4f9LWJhw7oHKQc=;
 b=EFoT+AfVAEBHP0IzMWrC2nDaPoE1kO8AnRQxi7PhIUXf+w9T3ZqEh/JkAR8qv5UW/8Uz7aQozSx48T7DPSYPa5iHb61IBaLpZbCyqJs883T8OThtrsv7eNIqX0UY2N6uDhx3XBFU4qAr1Abkr+wiWL6fqBQb6dNNWy1iuCN1pYFKHS7Zn4dFkXPWYPf2DAYTJ8YlW5vGs6zAEuQRYQzKSkAnhIufWT++OdnRBb7mq+eDw1FevJeHJ0bGtiqHG/ocqQov7NKz9wRJYFRaK1+y7KmTRunmcoMYiwP3alONT3C9U6MZkKaUuZGk2kiLd9pLx+WJwDUPCPy0lrQG3sgWxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNVAg8FDfqcw2knflygagc4B1EYIO4f9LWJhw7oHKQc=;
 b=RNADR+EDap333M1ioD18fqV97ltuvxAhMAO5Yc+jbgC7Hh48SO7r1JFPlfau5ox/pwu/LlxeGjjQgFjItjPf3PCfOsc1OGN1YP4rIzfIlo3CsCsybvfi/+sYolkumrO/VN0sDAwC6e5KX0fwSwMZhrQZ3Kloygit6RQ8Tnryt6g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AS1PR10MB5601.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:478::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Wed, 6 Jul
 2022 10:43:05 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::35e3:b154:10cd:4ebd]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::35e3:b154:10cd:4ebd%6]) with mapi id 15.20.5395.021; Wed, 6 Jul 2022
 10:43:05 +0000
Message-ID: <d5088328-552c-bea1-c358-27ae5ac202f7@kontron.de>
Date: Wed, 6 Jul 2022 12:43:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2 0/3] DSI host and peripheral initialisation ordering
Content-Language: en-US
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <cover.1646406653.git.dave.stevenson@raspberrypi.com>
 <CAPY8ntC-2Yij+a5wWEZ3BRBSh7bz+74coHCoB01ZhY550H+BDg@mail.gmail.com>
 <CGME20220405114402eucas1p1d139ce6825a481d1318f013cf27a5fe7@eucas1p1.samsung.com>
 <CAPY8ntAi1tM7BZEpKkMAasRH3R_+tJCUFY7k-yVBdtogvxQNRA@mail.gmail.com>
 <e96197f9-948a-997e-5453-9f9d179b5f5a@samsung.com>
 <7d3bcbaa027422018b956507d5ac5d19422dc892.camel@pengutronix.de>
 <27702b37-2904-3a2a-dd0b-1111efe70826@kontron.de>
 <CAPY8ntA_P1qzkd7YJ3HqOsa5D9GDCGm6LWo8tmytbYqxgJDR+g@mail.gmail.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <CAPY8ntA_P1qzkd7YJ3HqOsa5D9GDCGm6LWo8tmytbYqxgJDR+g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0071.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:26::16) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff820375-0228-4bbc-0c50-08da5f3c4ee6
X-MS-TrafficTypeDiagnostic: AS1PR10MB5601:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i4xmm9YEyMpgNgRzoyIC4LoYeacqVBaaLumMOt++sQlwn9ilEtvlO8qaMdifYh31FkH8QbA9tbyIJmPGplfVSLbWw9Frpa9qOijd6wSGFlJy0woughxM9AmfH7CfDdIQWOtnIFxXbvS66NWY5TC+tMNljTm8Ykqb4LUok1InbVJiGQJdmYUqfQeQTeqYUeLEId035xPxUkACBT4lIFRgLDxV9yZtcNkkPFDhdVok5R6jx62/JVEhhCiF4aAMAh5EFzCo54/Kl76PzRztnIFd0sbGl9v7YzzReDl2uVuwWWqe089KQfptY/iTJU5B1gK5ypQ9ReUiV6PySGM6VNCz3823/0MJ7wfnnM/gU1UefPhILRLbj95myXsj8YKQnuf6HMXsOgEcY/P4bRAgGJz+S4PrznDB/i+5xJSLaOIO/dV8bSh+Hkn9cdzQv44Z0Oaz8VhEtLn6d9y9K8cXt+regCkSiw/WMOipOVEg1+pWTei3zNy+wgyAuHgtsZwSGW0G/nUHMc6Kp+8M+Q3+lw81jq5IFywz2F7e63RVPN7xWiHS7d7pzhOXhbsnbGKGuk8WMrH2J/MZNSiwLTh0PG9rKuiwkzAEPGVhK5c2p14wvlnXFnczujagb/E8QsEgTv7jElgItHXUbNYJdbStNrE0bbIKW1Oqu+KUKcKYw75XkzZNWacC+wymK74ArTHWBCbN1264byRChN61YGFdwwFDzkgy0dwTiCfKx5uF6BMSXAUPiWKnf6/aHlkI6SNhm3xyMs2zl1p+ZNHFJIC5qWtoyA61SrhJ9C5XPffw/YTIhVyLlDNzrRRw8GGltVEVPURPSTye3aIpCJU0UTtf8+K03FJRhvB9kyfGz3KpwPDhsKKLDdLNKBFXge2No1LwDhZe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(36756003)(6506007)(6486002)(2616005)(6512007)(186003)(83380400001)(478600001)(53546011)(38100700002)(2906002)(44832011)(31686004)(966005)(4326008)(8676002)(66476007)(66556008)(66946007)(54906003)(86362001)(41300700001)(8936002)(7416002)(5660300002)(45080400002)(31696002)(6666004)(6916009)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3RremZOZ1pkY0FwUDN6WiszaGlZNjBUWmFFd01CRXRsMC9yOW1ydnVaTDJP?=
 =?utf-8?B?WE14UzNoUEhXOFhFelZPY3QyM2hXR1kyNG5ZN2ZzMXNocXNyNUhjUHA3T0FJ?=
 =?utf-8?B?ajU5dW5rTFpVaUptNTZaREwrN2taTnNOU21TUDJHZFBMdUU2cVljaW4xKytW?=
 =?utf-8?B?SEtESm9jRUFERXZTS0tOTnRSbUQraXRiVTIzRGE3QktwQmJGSXE1TXNrRXBD?=
 =?utf-8?B?a3lYaEpTRDJYS2IzdGtwcUQ4em9qUzlTWTNNZlBMNEVvMmJZdVdsNFprQ3BJ?=
 =?utf-8?B?amVGQ0pQRDI0cTg2TVREb3hIQ3JERzF1L3JPaXkzNytpYmtZS3RrV1V5OXdB?=
 =?utf-8?B?cU5kd3pFNlp0WWhIUzBlWlNRM1B6MzQxUDNnd3lOWTFnRTdZTjlvNG5VWnVC?=
 =?utf-8?B?eDg3K1FaY2FZQUpuVjlkUW8reWo1YS92VzNSRHdtSGRUV1I5NTZxL25hNzR6?=
 =?utf-8?B?ejBaZVlLeHlHcXNZQXkxVWVrcTdTaHZOblBaZnZ6SmVXYzNCMlQ5cmNVTCtS?=
 =?utf-8?B?NThibXlxbWhPKy94RGhkVWJJNVI3UjBtL2ZYM2RaT096TC9oc0RXazRmZVZk?=
 =?utf-8?B?VVpibE9LRFNBSkpSdTI2OGFmT3Urd3REeFQ5NFdtaVVma2QyUFA0aTFZN0Rq?=
 =?utf-8?B?NUZpakxwbTg3d3ZrRE9Ca0FBWWQ5WGFaNU1vdEhJa3dWaWd2bVhmcmNkNjRF?=
 =?utf-8?B?T2llSis3bXByTDFoM2xvSUZ4cFBZaGFwNFRTWGl1cmdYNlBCMFN6WE5hbFRs?=
 =?utf-8?B?SVlmemU3akV6bncvUjBtZW1henpQUkxVb1N1UjRpWUVMM3I1djVDcGtZNit6?=
 =?utf-8?B?YURpdWNqb3ozSDdqb1Y5QzR5aWZhRVNRMEpTQUo2ckUvSHV3TmEzMGREa3NE?=
 =?utf-8?B?U1lBT3JlSmFUb1lqTlM2R1lUOWRJaEY2bTNKMlNiZ3BmbnRkdE1KZGZHNllk?=
 =?utf-8?B?VmlFQk4vVWJWWDNWcVhmbDFuZHp3aUk1Yk1kRnB0MnBWUXVLT3JXM1h3a2VL?=
 =?utf-8?B?S0czZWJjc2E2Z1hEOHcrQnNSUkYrVnpvYXp1M1FZNnBUYk5ZR0NFRHM5ZHYy?=
 =?utf-8?B?R216MWFPMkNRWFp2OTFjMzY3K2taSXE4L1gxaGxMRXByRTRpanRjREhhMTFy?=
 =?utf-8?B?T251UjIwSFE4Wno1Tk1xL3V1Ymx5bTFLSzBRanlHcUNjRGhNUGxKUWRjdTFw?=
 =?utf-8?B?RUkzMDJYWHF5R3NCT01xeW1tTzQxZW5KQnVOcUkrVmZoaGZ1MG9yLzRMc2pT?=
 =?utf-8?B?U0FKamVzQnd3RW01MVVtVW9MMGhjVXEvaDZDM3FWbXZRNEp3czkrb0QyamdQ?=
 =?utf-8?B?bERKVlJqRWtvWGl3RjVvZ1E1dUVTNkE1cTFKdUloN2ZCOEZidVJYdHBqdVVQ?=
 =?utf-8?B?VFQzTVFvdHNKREV0ZkJPa1JDMkw2VDVCUUIrNXhiQWJhWGNQbVc1czREMjd6?=
 =?utf-8?B?SUZOT0VsT21JbVdqY0VKTUhrWEFmUHFHd2t4bzA4YTIzNmkwOURFYjNWRWd0?=
 =?utf-8?B?WFJDMWM4VHRkNXg2RnUzZm5FUCtoMUVnYUJGbUhiaFNxcjUxRzJVUVQ3WEpx?=
 =?utf-8?B?SkQxN2ZtejQ0UWZyS1g2UkJpc2dLNzhMZUVyWEFudUtETmRGVUFXbXVlS0l2?=
 =?utf-8?B?NEhDWjFsUFladFQxZnJYUy9XaWlMcE1KRjhUTUFKaUdySDBESHNFTE9EbFI0?=
 =?utf-8?B?OEtENmxzb2h3cG9MQi9UZlBhemd3eXU5M1UyQzh1cVVrVFJuYnUzSWZVZ004?=
 =?utf-8?B?d1ZDYTBHS0Y1ZUpDbXRkN2ZiVDVUN3R1ek1KcmFrV2p0RkNYWUJaMU16ditM?=
 =?utf-8?B?dHJ1RFE4alVDSUl3WE4yTlVUZEV3Ynp4OG9PSFo0Q2dHWUY0aWdxRmN6ajBF?=
 =?utf-8?B?NVdjNG9xcWcxeUw2aFlUY2kxUkp3ZGRzVllzSExGaEhOTDZMYmhlbldPbW5P?=
 =?utf-8?B?MmtsYWFXd3ZIVFFOWkZaVjJFbWdoWjN3NmJVVWYxdEtTMzBvNzNJSE1xZ0dY?=
 =?utf-8?B?VEdEaUJzM3NhaXg5cUI4d3RZUjJkd2d0Y3RhUXB2aW5ML2lQTlN4SnVJN1gx?=
 =?utf-8?B?UEIvaXdZaGZWUEtwc3J0amxhdWFhdFNUM2VvNVMwMDFZSEN1a0o0d1AwNGEw?=
 =?utf-8?B?VExTbEJXUmFaVk5LZlZQcWh4VEljZ3FmUkdRMTkvZnYxVE0zbG5WajJsMnJx?=
 =?utf-8?B?czdwZFQyejBiQmtNcEg1S1hjYUdoZE5Wd0ZaTWtZVkpDRjRyRnhCZWFmWDFw?=
 =?utf-8?B?TzVQa1FYOFhiQ2ZmT0czNFFEbDFBPT0=?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ff820375-0228-4bbc-0c50-08da5f3c4ee6
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2022 10:43:05.3815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9M+K7gQidDov7UzP7SLRfXbnqbLCBL1jh87nbgWgXNlDH0/34Wz7bTuvcCvXGhqBilKNYyIjQbdAc0u8oOVfR0HPp/lazYpdlmL0xbY8VaQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB5601
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
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@gmail.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Am 06.07.22 um 12:27 schrieb Dave Stevenson:
> Hi Frieder.
> 
> Apologies Lucas - I missed your response.
> 
> On Wed, 6 Jul 2022 at 08:09, Frieder Schrempf
> <frieder.schrempf@kontron.de> wrote:
>>
>> Am 10.06.22 um 09:52 schrieb Lucas Stach:
>>> Hi,
>>>
>>> Am Mittwoch, dem 11.05.2022 um 16:58 +0200 schrieb Marek Szyprowski:
>>>> Hi Dave,
>>>>
>>>> On 05.04.2022 13:43, Dave Stevenson wrote:
>>>>> On Fri, 18 Mar 2022 at 12:25, Dave Stevenson
>>>>> <dave.stevenson@raspberrypi.com>  wrote:
>>>>>> On Fri, 4 Mar 2022 at 15:18, Dave Stevenson
>>>>>> <dave.stevenson@raspberrypi.com>  wrote:
>>>>>>> Hi All
>>>>>> A gentle ping on this series. Any comments on the approach?
>>>>>> Thanks.
>>>>> I realise the merge window has just closed and therefore folks have
>>>>> been busy, but no responses on this after a month?
>>>>>
>>>>> Do I give up and submit a patch to document that DSI is broken and no one cares?
>>>>
>>>> Thanks for pointing this patchset in the 'drm: bridge: Add Samsung MIPI
>>>> DSIM bridge' thread, otherwise I would miss it since I'm not involved
>>>> much in the DRM development.
>>>>
>>>> This resolves most of the issues in the Exynos DSI and its recent
>>>> conversion to the drm bridge framework. I've added the needed
>>>> prepare_upstream_first flags to the panels and everything works fine
>>>> without the bridge chain order hacks.
>>>>
>>>> Feel free to add:
>>>>
>>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>>
>>>>
>>>> The only remaining thing to resolve is the moment of enabling DSI host.
>>>> The proper sequence is:
>>>>
>>>> 1. host power on, 2. device power on, 3. host init, 4. device init, 5.
>>>> video enable.
>>>>
>>>> #1 is done in dsi's pre_enable, #2 is done in panel's prepare. #3 was so
>>>> far done in the first host transfer call, which usually happens in
>>>> panel's prepare, then the #4 happens. Then video enable is done in the
>>>> enable callbacks.
>>>>
>>>> Jagan wants to move it to the dsi host pre_enable() to let it work with
>>>> DSI bridges controlled over different interfaces
>>>> (https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fall%2F20220504114021.33265-6-jagan%40amarulasolutions.com%2F&amp;data=05%7C01%7Cfrieder.schrempf%40kontron.de%7Ca82478efb8434ac07dfb08da5f3a1b75%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637927000416444951%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=vgnJ8L7fhloUV83p%2Be6ziUKHbL9apqcLWpDvMUcOOoY%3D&amp;reserved=0
>>>> ). This however fails on Exynos with DSI panels, because when dsi's
>>>> pre_enable is called, the dsi device is not yet powered. I've discussed
>>>> this with Andrzej Hajda and we came to the conclusion that this can be
>>>> resolved by adding the init() callback to the struct mipi_dsi_host_ops.
>>>> Then DSI client (next bridge or panel) would call it after powering self
>>>> on, but before sending any DSI commands in its pre_enable/prepare functions.
>>>>
>>>> I've prepared a prototype of such solution. This approach finally
>>>> resolved all the initialization issues! The bridge chain finally matches
>>>> the hardware, no hack are needed, and everything is controlled by the
>>>> DRM core. This prototype also includes the Jagan's patches, which add
>>>> IMX support to Samsung DSIM. If one is interested, here is my git repo
>>>> with all the PoC patches:
>>>>
>>>> https://eur04.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgithub.com%2Fmszyprow%2Flinux%2Ftree%2Fv5.18-next-20220511-dsi-rework&amp;data=05%7C01%7Cfrieder.schrempf%40kontron.de%7Ca82478efb8434ac07dfb08da5f3a1b75%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C637927000416444951%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=ka2wikbVhc4RxFGARjTh0ixGKiaNHloW9dVkejA5kEg%3D&amp;reserved=0
>>>
>>> While this needs rework on the bridge chip side, I fear that we need
>>> something like that to allow the bridge to control the sequencing of
>>> the DSI host init. While most bridges that aren't controlled via the
>>> DSI channel might be fine with just initializing the host right before
>>> a video signal is driven, there are some that need a different
>>> sequencing.
>>>
>>> The chip I'm currently looking at is a TC368767, where the datasheet
>>> states that the DSI lanes must be in LP-11 before the reset is
>>> released. While the datasheet doesn't specify what happens if that
>>> sequence is violated, Marek Vasut found that the chip enters a test
>>> mode if the lanes are not in LP-11 at that point and I can confirm this
>>> observation.
>>
>> The SN65DSI84 also has this requirement according to the datasheet.
> 
> SN65DSI8[3|4|5] need LP-11 before the chip comes out of reset, but
> that only happens as part of enabling the bridge chain. This patch set
> allows it to request the DSI host to be initialised first in order to
> meet that constraint, which is common with many DSI sink devices.
> 
> Lucas' comment with TC368767 is that it is doing other things for
> display negotiation over the AUX channel prior to enabling the video
> path, and that is needing the DSI interface to be enabled and in LP-11
> much earlier (and potentially clock lane in HS if not using an
> external clock).

Ok, got it know. I see this is a separate issue that is specific to
devices that need the link for video mode negotiation early. Thanks for
the explanation!

> 
>>> Now with the TC358767 being a DSI to (e)DP converter, we need to
>>> release the chip from reset pretty early to establish the DP AUX
>>> connection to communicate with the display, in order to find out which
>>> video modes we can drive. As the chip is controlled via i2c in my case,
>>> initializing the DSI host on first DSI command transaction is out and
>>> doing so before the bridge pre_enable is way too late.
>>>
>>> What I would need for this chip to work properly is an explicit call,
>>> like the mipi_dsi_host_init() added in the PoC above, to allow the
>>> bridge driver to kick the DSI host initialization before releasing the
>>> chip from reset state.
>>
>> So to sum up on the missing parts:
>>
>> 1. This series needs more reviews, but is generally agreed on.
>> 2. Jagan will integrate Marek's mipi_dsi_host_init() PoC when respinning
>> his series "drm: bridge: Add Samsung MIPI DSIM bridge".
> 
> I'm still not clear as to whether Marek's mipi_dsi_host_init is needed
> in the majority of cases.
> Exynos appeared to be trying to check for no contention as part of the
> initialisation to LP-11, and that isn't necessary. No one has come
> back on that one.
> 
> Adding a mipi_dsi_host_init would potentially solve the additional
> issue for TC358767.
> However it leaves a number of open questions. The first I can think of
> is that there are no defined mechanisms for specifying the link
> frequency prior to having a video mode set. Yes struct mipi_dsi_device
> has hs_rate, but that is defined as the maximum HS rate that the
> device supports, and therefore open to variation in the
> implementation. Exynos has various vendor specific DT parameters to
> configure link frequencies, which ought to be standardised if that is
> the preferred approach.

Having standardized DT properties to configure the early link parameters
could be a possible solution.

> 
>> 3. Bridge drivers need to be adjusted to call mipi_dsi_host_init() if
>> required.
> 
> Which hopefully is only the weirder devices such as TC358767.
> SN65DSI8[3|4|5] do not need this, but they will need
> pre_enable_upstream_first if/when the enable logic is shifted from
> atomic_enable to atomic_pre_enable.

Got it, thanks for clarifying!

Thanks
Frieder
