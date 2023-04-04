Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0157E6D68B7
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 18:26:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D929110E702;
	Tue,  4 Apr 2023 16:26:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2073.outbound.protection.outlook.com [40.107.249.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB43410E702
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 16:26:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KDENvCWii58Y2VAM3Sohj8NZzrEELtT1LAqVOSQVPqonBEUFYn/pPlsU6YRWkJ4UKz2OH0hpEWZApL68mMnfghBSW3pftHS8+0eJB3xchve3W7zClBlae4HWkjvsWloX2SjJQN8c/Vifm1QXTRyzOIZCDVtmz0Dq+bq8GlMaPnf0ry8JffaGLOWRnWLWt7R0LtVRbEnQYIDxXNtHg8QnIRmdawA/s1DfyizVCyMdLHPQkQ0XWWwYhRn8dLSiIjQbjflb8FLEUAjnfAZV3qu2QEKbDDJ4xPIB4EaRrwfpJ9tyQjPe0g6PGU0e9kxNAjnjETu4FKjOx8tkKjAnulgLCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=heG6DTkwlvUAG374y+3/UBeDC+pQRNa8CBo9ATmUHcY=;
 b=DxcT2jzxbQiTcFZ2BgI0AWXymrpQ1zMpz0pW2QiXlN7N83bLF7ucKOfdcAohqHyZELi8rpuFZuEhapp3UaRiY2t5jm3YqIEZFzhN7zwcM/WTu3/lQR1ZRTljIm+LJMERc8z4fWl2LrHoE0rNBeAdLUqhVTxOliihBqklBakQq+iOt2vqgqvB1ZoIG4lVSdeO+IqqiIkdds8rpi/Gm6PEP16PSQjlrLsMRfI21COA/j7Z1Bm9kNkEQnAtzeQstRpJSQa3QjcL/9Spf0TpMZjP4xhFbVxM8GSHhGYvkYA1x+fonQ97vufauEkZH7ckAyVotFIehAuk53/cRwmZITOT2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=heG6DTkwlvUAG374y+3/UBeDC+pQRNa8CBo9ATmUHcY=;
 b=l1NpiDECMM4ZKbTKQsjOXSLgYmtrrTeQ6R4HUqqwCF8da2xwQ2mGx4VoHiSFrQE3owGG9FK236wNUpQdekH2oQw+nMyeqoAko/kA97dURl6HGH6DxTZ2E27l4GsuMeP1cQVOtGIRc0lRHF5IW4nlUl87byozpRJZB3Hw5ytw6A4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB6182.eurprd08.prod.outlook.com (2603:10a6:20b:291::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Tue, 4 Apr
 2023 16:26:28 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::6f4d:f868:c89:4db1%6]) with mapi id 15.20.6254.030; Tue, 4 Apr 2023
 16:26:28 +0000
Message-ID: <2c3fa5ee-78a9-8359-01fc-3137f3cb1b9b@wolfvision.net>
Date: Tue, 4 Apr 2023 18:26:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 7/7] dt-bindings: display: add panel-timing property to
 sitronix,st7789v
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
 <20230314115644.3775169-8-gerald.loacker@wolfvision.net>
 <20230316215735.GA3940832-robh@kernel.org>
 <dd26836f-d54c-65d1-0acc-8a09745bb066@wolfvision.net>
 <20230329091636.mu6ml3gvw5mvkhm4@penduick>
 <d5a31f75-eb93-0ff2-cd5b-19cdec58e103@wolfvision.net>
 <20230330145811.asot2cvux4ebbeqy@penduick>
 <5f1f90e2-eee8-d941-e4b0-7f2411a9d415@wolfvision.net>
 <20230404160419.xlnlxq7sbsqopfwo@houat>
From: Michael Riesch <michael.riesch@wolfvision.net>
In-Reply-To: <20230404160419.xlnlxq7sbsqopfwo@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: ZR0P278CA0110.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::7) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9cf93d-ab9e-4737-d4c6-08db35295765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5JdbHo/2bvwNmJsEOhDcsHm/lgwv9KPz33jVmF0B0zv+IH6jULWBv7HWwPIxiMnEmPQKP53vsnh9jNsdhDPlnY+GsGyaYnRD2FLcmeYr3lortue7RMB719WXDZW3FTiBWWxv+2JbWrJuxzWVxD3w8/7h3oBeqrh1SZ6Jv4+YH4xZ2S4LNqF7j4Xn9IK3nkC3SODVgJRI88rbwCoNr3EpmFCX/DYJcQ2vrVCllhs0OqV5gYHrDhJroePsI4u/wmGpGDDR5aw/eQTTM6SGOib9GW4Spf7SgBRtvlMPjU7lbI1FE6T0bWuiXYxzKuzdjjjIB/LUeCaPjVfeqzTH3yaveM2rXntohXdqgbw112HpkY9k2CrPiq68Sfjq547SrOiFN2HnRYj/6Zaut10QFm9o1GYyry6GSVc1q6yiRH0/MpuWtUI1VZywORbBM6FMdxe7vzGjQG2cWmW7A3baMS7zuczQmfUe8jt2yGLqKyWLNGkphvfZN1LQTrzWPWadE0qawPrWux2BGqHGtnOWgEWkYDeyWq5NLrg2OHi8bqk5z0eLcDlt6HSytoX9GOMxT7wG2pJ9JR2s8MzUvLAHftU3/46/0mHd8X4Sg3OSlBoivz7msw47vXmxamwigI+eC7zHkXZQPmg1GMnuY5UdfTg85A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(366004)(39850400004)(136003)(451199021)(83380400001)(2616005)(966005)(6666004)(6486002)(186003)(316002)(478600001)(53546011)(54906003)(6506007)(6512007)(2906002)(44832011)(7416002)(5660300002)(38100700002)(36756003)(66946007)(8676002)(66556008)(41300700001)(66476007)(4326008)(6916009)(86362001)(31696002)(8936002)(31686004)(66899021)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1ptbFZxYWxWcW1SbTJnUFhQZGgyTTU1cjAwMFN3SjllN2VmMk14QUpTbDQz?=
 =?utf-8?B?UTZxVWlMK1RweUh2bHk0K3RrRkZqZmdXNVA3WGUzOC9XMHEyZXA3djJoMW56?=
 =?utf-8?B?YSttNCsySmxoczR4VHBUMnQ1Vm91RXJWeG1TdndUenN5NGNEZTBRTWwxSzNy?=
 =?utf-8?B?ZCt0NGo3emZEaEcreUVRaVBGQ1ppeFhsYTZhVzdmdS9EZFM3VUZlcEIyT3FD?=
 =?utf-8?B?Qk04bHJUQ0wrL0VhN0ROYVRtT0xXZDhhSWsweHFmZDlZekRqSjUxWXZNQWNN?=
 =?utf-8?B?dm81bjk3NXAraDNOUGlYRGtsaXBIZGpZQXkyOUxsV2Vobys1OXVOOGVhbE5z?=
 =?utf-8?B?OHNwYkxjWk10Qm96TVRtQTFHajlnVUUwMm1uY29rTTkyaHJKQW1WTXVtVjFB?=
 =?utf-8?B?c1dpMThxSE1WNWt3NlhEVnMrcUdFM1JEajFUVTBPOERjUXp2cTlwNm1GUmNk?=
 =?utf-8?B?ckxESlNCMjFlRHRkUXEvSlBtUU9rRi9jTS9rSG5lYmlSUjRtSnkreGloNGZq?=
 =?utf-8?B?N3FOZ3l6UnlVd1VFTGNndU5lanNuWWJ6dnJ3MjVEYm80WmdTTVJYdlY5WXFk?=
 =?utf-8?B?bUlKS3B0K0ZJSlo4emFxd2dISjRlNnVncnozVzFyTVc2VW9md1hRNW11MGhE?=
 =?utf-8?B?MEg4MVoxY1hGMk5LSEVtdVpNU0w4OHlDK0JSYXJXcVlETjhhd0pJZ3ZPNXFz?=
 =?utf-8?B?VnhjZXBxSlYvRzJlWnh5SU0xcGlaRGxBTVBFd2pzSE5vNUtsdmpRU2x3M0gy?=
 =?utf-8?B?T2NHYjdHUXBOUXRoVGFtNHFMVlhHRU0xUURZNU9xQmFVd3QxQks4ZVRrcDAw?=
 =?utf-8?B?WUxiTWdTMTBuR3JxblBWT1VFb3l6aTlJdDVmV29NeUQvK3Q5akRnYkxKLzVJ?=
 =?utf-8?B?RWtkK0tyaDErdnplZHVnTVIyWWo1NDByWWFYdlg0WWI3N0xtdW1ac1hXaUtZ?=
 =?utf-8?B?NXlzdUtmWWVLTjd5c1hqV1l4ZjZEWFMzeTBXWWdETm0yWW9RbXg3TUU5MG1n?=
 =?utf-8?B?eVB6RXJNYW9BZllqbWltb0RtcWpmREVxbGFWa2RMQUt1MkJPREVsbG9PWFVM?=
 =?utf-8?B?OUJkTi96aWR4UUt6RDdDbjg4NUJ4TG5nR0FVTDlIM0prakFqbElNaGpFQ1Z6?=
 =?utf-8?B?cXVlYlZzNUhRaHNmenl6bzZjZkxxNkhiNVk5dDg0ZjlNcS96Z2R0QlhvYWt3?=
 =?utf-8?B?VjRNSlVMdWdKWEZGVlRPNVFQVE5mQjJLeXFEUkpVWDVYQ3ZGQ0Njclk0eitY?=
 =?utf-8?B?dmdlSjRGUFNEMU04dUVEdVloaHZndkNOZ1cvUmpkcStSVllTcld4TmZBMU5P?=
 =?utf-8?B?VUpXVXVpT0dab3dzM1VWSzloMWJvMDFOdm15VjcySmhtR1FOOXNtTDZnL3VH?=
 =?utf-8?B?eElONkt1Q2JvRGZMR1VnUHUwUVlhVWdnU3Ird3Y2N0drSUJyZGp2cE5kQ3U0?=
 =?utf-8?B?eFMydEpwdDBNSUc0a1ZNbUlocUdod0dkS0xGc0lua1YvditGQ1VGYXUySXFN?=
 =?utf-8?B?TVNydUs5YkVCSXFHVG1hSjhxRkJYS3I4SzAwTzNTRzR3OHlVcVd4MU51eHBi?=
 =?utf-8?B?Smd3VTR4UUt5MEU3SVg0SUFMSHZQcDE3YzlvREhYaUZzd0xzMEFEWVRQbDVO?=
 =?utf-8?B?UkJsTk9VS3hNb1NtOU1zUEdZSXFUay9Mckcwb3pETVFTbXFuV1l5aThIY3hI?=
 =?utf-8?B?Wk5vODdaZWdDTDZ1Sm9tWVprOEtQMnRSVStuMUp2dHhkVGNMK2UvdnltZHZQ?=
 =?utf-8?B?WUhETzdPUFBERGZvMlJzUmdNWGxkeEhSZjAyK0pJLzUxUWRsNklSaWJhYWhT?=
 =?utf-8?B?S2V4M3o4eG0xYitPdGtJb1o0NHZLbjBFMXhscUhhQUVaV1Y3aVdhcWFEZWI0?=
 =?utf-8?B?cWt2bzRlWDVQTm5IUUJ1WkhKOGR6bVQ1YUdTSXJUM3U3NWp4aW9abG0yeW1n?=
 =?utf-8?B?OCtOcllicit0NWl5bk9XRkx1akp0Q0t1QjVDMU5YVXdqdngwcFM3L09oZkVz?=
 =?utf-8?B?ekZOdS96bnZMU3J5d1pXTGJIUVViSXIvVUtheGIvNG1MaE8vZ1hHM3B0NUVs?=
 =?utf-8?B?MDZpMGVmTzRjeGdkOHNGSWpDM2JlNm96YlBHcTdhZ2luRmdGWERPTXhLOXhB?=
 =?utf-8?B?QWw5VHpPbndQNC81cHAvUmNTeUErdXhwd3V4VCtHT25iUWFiMk92NEh3Y3FF?=
 =?utf-8?B?a2dvd2dkbXBOcWFpd3dFekwrNGlsSi92UXVOaVBDU2ZHbEk3OEgxeXE1SVJo?=
 =?utf-8?B?dytkL2h2YjZCcUJuQ1crcnpaUUNRPT0=?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9cf93d-ab9e-4737-d4c6-08db35295765
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 16:26:28.0265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mub07er0RFExpNHbfx/vRLmZ4lFwtp2ePg1Z62iZPNTyN2emPIRPQYICCAxA3OVA7Dc+jc4OdFZdDefbODHINrhenUV0ZFyzSMyJN2ewYeg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6182
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

On 4/4/23 18:04, Maxime Ripard wrote:
> On Fri, Mar 31, 2023 at 11:36:43AM +0200, Michael Riesch wrote:
>> On 3/30/23 16:58, Maxime Ripard wrote:
>>> On Wed, Mar 29, 2023 at 12:08:50PM +0200, Michael Riesch wrote:
>>>> On 3/29/23 11:16, Maxime Ripard wrote:
>>>>> On Thu, Mar 16, 2023 at 11:29:53PM +0100, Michael Riesch wrote:
>>>>>> Hi Rob,
>>>>>>
>>>>>> On 3/16/23 22:57, Rob Herring wrote:
>>>>>>> On Tue, Mar 14, 2023 at 12:56:44PM +0100, Gerald Loacker wrote:
>>>>>>>> The sitronix-st7789v driver now considers the panel-timing property.
>>>>>>>
>>>>>>> I read the patch for that and still don't know 'why'. Commit messages 
>>>>>>> should answer why.
>>>>>>>
>>>>>>>> Add the property to the documentation.
>>>>>>>
>>>>>>> We generally don't put timings in DT for panels. Why is this one 
>>>>>>> special?
>>>>>>
>>>>>> For now, having the timings in the device tree allows for setting the
>>>>>> hsync/vsync/de polarity.
>>>>>>
>>>>>> As a next step, we aim to implement the partial mode feature of this
>>>>>> panel. It is possible to use only a certain region of the panel, which
>>>>>> is helpful e.g., when a part of the panel is occluded and should not be
>>>>>> considered by DRM. We thought that this could be specified as timing in DT.
>>>>>>
>>>>>> (The hactive and vactive properties serve as dimensions of this certain
>>>>>> region, of course. We still need to specify somehow the position of the
>>>>>> region. Maybe with additional properties hactive-start and vactive-start?)
>>>>>>
>>>>>> What do you think about that?
>>>>>
>>>>> I don't see why we would need the device tree to support that. What you
>>>>> described is essentially what overscan is for HDMI/analog output, and we
>>>>> already have everything to deal with overscan properly in KMS.
>>>>
>>>> Thanks for your response, but I am afraid I don't quite follow.
>>>>
>>>> How are we supposed to expose control over the hsync/vsync/data enable
>>>> polarity? I only know that the display controller and the panel need to
>>>> agree on a setting that works for both. What is the canonical way to do
>>>> this?
>>>
>>> So typically, it would come from the panel datasheet and would thus be
>>> exposed by the panel driver. st7789v is not a panel itself but a (pretty
>>> flexible) panel controller so it's not fixed and I don't think we have a
>>> good answer to that (yet).
>>
>> Then it seems to me that creating a panel driver (= st8879v panel
>> controller driver with a new compatible) would make sense.
> 
> I don't see why? The entire controller is the same except (maybe) for
> some initialization data. Doing a new driver for it seems like taking
> the easy way out?
> 
>> By coincidence Sebastian Reichel has come up with this approach
>> recently, see
>> https://lore.kernel.org/dri-devel/20230317232355.1554980-1-sre@kernel.org/
>> We just need a way to resolve the conflicts between the two series.
>>
>> Cc: Sebastian
> 
> That's not a new driver though? That approach looks sane to me.

Sorry for the ambiguity. The plan is now to add a new compatible to the
st8879v panel controller driver.

>>>> A different question is the partial mode, for which (IIUC) you suggest
>>>> the overscan feature. As I have never heard of this before, it would be
>>>> very nice if you could point me to some examples. Where would the
>>>> effective resolution be set in this case?
>>>
>>> So, back when CRT were a thing the edges of the tube were masked by the
>>> plastic case. HDMI inherited from that and that's why you still have
>>> some UI on some devices (like consoles) to setup the active area of the
>>> display.
>>>
>>> The underlying issue is exactly what you describe: the active area is
>>> larger than what the plastic case allows to see. I don't think anyone
>>> ever had the usecase you have, but it would be the right solution to me
>>> to solve essentially the same issue the same way we do on other output
>>> types.
>>
>> OK, we'll look into the overscan feature. But still the information
>> about the active area should come from the driver, right?
> 
> No, the userspace is in charge there.

I'd prefer not to have the hardware description in user space. But we
can continue this discussing once our v2 is out.

Best regards,
Michael
