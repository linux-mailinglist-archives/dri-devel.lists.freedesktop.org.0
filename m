Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92FB68989F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 13:29:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A3710E0C7;
	Fri,  3 Feb 2023 12:29:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2105.outbound.protection.outlook.com [40.107.241.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48C310E0C7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 12:29:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fF1jqd52cO4ZBgdgVoyci2tWhjPnSn8dKCUoH9JxA84WD5ZcTzkxfZyu76vE5VIgg5M1eCK7qw1g3gQRc7nH71GAW/3ynyHbpjchjB8oNmzCd4eWjYNNFAmGR1WW0KOOn9TCvz93ska28FARLZydnCwq9Xh1iwTQPZt7wZ0HKg0kld00b+nS0HkltVcX4iBuKaPsyhO9TT5gCVXP8ceRy2X/EkBvyg1dStdlxq92AOjrhxYu9JrbPPaV/X81bFJf5eoIRgKOhBH+SgKuBP3MqE9UqmHc7+SoRITEbmF8e2JU06KDkgOSsTjWz/OpStKXKDPabz27B7SQI1HrPSBUwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3KcH4yaGxHQr4Mpg3QI94uHsWvaqVlG06wCIt0hLCg=;
 b=XhOluijEyHEuSMAyiIjPPzCil5njB3Nlqvk0YXEgFKLOpp+ckf4O9lAO6EKfzLCg3FDSp4rEAyuIidzwrpVr55FB/W0PuQJZYJ4r04EfndQxHV4ZuSEoaMHOO4uJQ4wmgKJ7AK9chGuNovkLI0VW/LfFLFbwYTicLRVOZ2+6GSPGoxhVboL5Elh9zdN4CJ/pQFMUOOQJnThOE2ck65/LJpVflChXNe+JH9R7GRm56MtrAXmSxvd9syWC5XjAQtmx/vlkZtDS6d7KVKcpkvXGzruBE3kUbaqxOyagxbaIXYPHcLUyp1xHoUZfP/6MqT7SuK6Y7wbKHFdBSb7TRzgiOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3KcH4yaGxHQr4Mpg3QI94uHsWvaqVlG06wCIt0hLCg=;
 b=Hh8EyBxMUit33iRtMfq12X1kaDVV1XcaEExeDR4X1zVHEZ/6ib2fFmeErbQqtLeVwvcxIdzRUWVkaDGKLXH/sYuzT75YzomktdyUhJgU4pztkmnve8r32aWqUOx7c6Me7sEiKSL0lW7nOwUtbRM2IYbFghXh4tajYTrDU3NnAsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by AS2PR10MB7777.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:64e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Fri, 3 Feb
 2023 12:29:20 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1286:27db:9d8a:4b72]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::1286:27db:9d8a:4b72%8]) with mapi id 15.20.6064.025; Fri, 3 Feb 2023
 12:29:19 +0000
Message-ID: <c21ee1e2-b92e-0fad-40bf-91cae9e57f48@prevas.dk>
Date: Fri, 3 Feb 2023 13:29:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v12 00/18] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US, da
To: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <06e5423f-c022-7a1c-efe0-0f4fbab664c1@prevas.dk>
 <CAMty3ZBRDDnNdmgD5ji11SdCuOcmu3ZyBPyB28cF1aRTyxp+fg@mail.gmail.com>
 <be95e4f7-15a8-ba99-6b39-6f7f0ea71201@prevas.dk>
 <CAMty3ZBNLpV9orVRD897ZeR3Hj9RWOau07b1ZGDUoBRej=Cj-Q@mail.gmail.com>
 <31ccc974-4b01-ae47-9505-626617f07758@denx.de>
 <f6cea911-783c-f59d-503c-1576358ae7cb@prevas.dk>
 <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <dcc28c36-9b09-ea92-be21-665c6cbf35b3@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0025.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::20) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|AS2PR10MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: 67283533-8184-4f96-771e-08db05e245df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /0RQ6EC9EvxqAhAduRFilcnuNsBfAx4qDmuySR4NYWvq7ywn3NmmSjO8jAjglK7z0o/7nNTyHZ/19gjAFEJ3cAWrTQSXSjgPsoeCDiE6pFUMdFBC+gkScqahBUXKrEb5LWQjBrB1kFRVnfwYSblGOIHEX4DU9ExYD9ae1JWjmZA9NLc0AZC2mQzUQy7q9hc+BaOlJ89hinBu1XcsepT7tFdPnGw8asgIRbFnQt6v8ejm32l4RXxDhJicSlaNM4E3+lZ+ZHPYQEXBZ8WTBI2pvUrQVNGkIDUJMiTBf8VRU6oe75WkTuwLwNaI43FOxufT2VYWQHt17jAKK2EuJvNUkOlUwrJVkKevYK6kqzXSYcoeTOBLLS4Wgl7zyECfhIEEtwRFFHrhTS2M25vJD4K7LozUpfnCtNbqUDI4juTc1d9Bpia6FzE5gejb2jiZx25L2UrWaATBJHoaTamhg5g0ueT3g907zbz4A9M/kxrhC0nKjHEWWpEL504yGRTZuIQNhTw7KfVKzmDnS94AG79OxK8TlygX+O9ojh5rFjelZFEUicRnQW4tcIF9nVfrAAsuDCQB/F97aKGh90cSLUmLUwRYRkpChZxv2PY/ZJFjbe8ckF2eXu/p8fFthrXsKGRBbUaWVeDlw/BnRY6SYMH+hppbXLGm0SzjrQ8PCCt9Afgb6eZD/D3lG55sBnmAJLGGbuJvJnYgXtFcsx9EvlbX9AyO6mPMPBwqt1HTe9sioNONTEHrG1IHxepxVujXJdttIKtmPsIt+i/HD8U7V+u9xA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(346002)(39850400004)(396003)(136003)(451199018)(186003)(26005)(6512007)(66946007)(4326008)(66476007)(53546011)(6506007)(66556008)(2616005)(41300700001)(8976002)(8936002)(6666004)(8676002)(38350700002)(31686004)(38100700002)(5660300002)(7416002)(478600001)(31696002)(6486002)(86362001)(52116002)(316002)(110136005)(2906002)(36756003)(44832011)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R293VjZOK2FNQ2NGVXptYmVxQVUzRXhyZDRBT0RQbllyODVSb0xZN0RpTVVI?=
 =?utf-8?B?MnZ5N2VaTkNFK2tmTmRjUlFKdzVENDE3M1hiRlJ0Rzk3Uy8wQVYzUzBpbU9V?=
 =?utf-8?B?Y0NSb2RrTVVSTEJRSmVOQlRzb3p5WFMvc0pvaFczc21BTFdScWdENUVBU2Jy?=
 =?utf-8?B?ZG84bGJ0M0tRaW9CTzVlU0lpMVlkbHhWRXE1dVFwWHNMU1pHNkV0NVUzNHpy?=
 =?utf-8?B?UXJpNS9wRFR4cUdZNmtFYVRiVTdhZXZSbGFwcTllMVNTenQ2OGRWYzBSUjZu?=
 =?utf-8?B?dUpvNjczdGtQR0JNZnJjWmVvclZPdzFndkFVenZ2L1lqbE9pZWVycDZuRmJj?=
 =?utf-8?B?VG8yQkhkWlFZOHdrTzc2enhLazlWYXQvbjk4RE9SRUhhWmxsWFVUb21STjNu?=
 =?utf-8?B?OXIxWHdoNTNnMThuWDBiUzN0eGIrclhVZFZOZTFIQVl6T2JqTWVJK0pNUEc5?=
 =?utf-8?B?NFZ5ZS9qNVd3ZDJsQzFiMmc4WEZ2bjUvRXBVcFZMa1lFaXpxVFl6UGxuV3pm?=
 =?utf-8?B?a2RqTGVHak1oaGpwT1hxTVB1ZGNldjRXUGJmamFBWVcyL25VNU50NlVrNkhF?=
 =?utf-8?B?WmFGeS9McHE1Q2kyRXQ2R054RWY2b2RNb2txMEdMV08xWnEzVEVRejdxNDV6?=
 =?utf-8?B?VGFWL1lpeGtaVHRibVBTOGdCN2ZyZmNQZkpjTTVEL0lhaGtVQWcwdUJ3dExw?=
 =?utf-8?B?UkJVVU1TaDlSbDhaN1E3d0txNHpDQktLa2ZDcUk1WjF4UTB0b2QyOEhrTFpB?=
 =?utf-8?B?cTRmQ2RYTE9ITDZUbU5TVEpTL0ExUzR2R0twU0Y4OVF4OWgvdXk0cmc3WlpC?=
 =?utf-8?B?Y2x3WkJ5aE9VQ3F2VHlzdHh6MTBETFFpVHQ3Wk1qbyt3RmhTSDcvZ2Rhd2hV?=
 =?utf-8?B?R2NnVHA1cEZqTjZZQkdCTTczZlFGN0dJc2oyeHlaY1BHekxKYzFsWmtNdkcr?=
 =?utf-8?B?ZDdpTGJjTzZueWxReEkwQzA2amZrSjJ1Nm5wVVdJTE45YVJIMjNMUUp3dGYr?=
 =?utf-8?B?OWU5eDh6bnM2ZWo2VEprSnNGYUpoUG1KQzNTUzFFRCs1a0VjMUtYUHNFOWVp?=
 =?utf-8?B?QWFlZURXOVA0T2V1NEpWbG1uOUVvQWNnblVVNi9xSGh3a1RGWVBMZWRmRHll?=
 =?utf-8?B?bDNFK2k4bkJnNGNtOEN3SDkvbGVVM3lKRWhSMCtodnpjZzc1V3JuRWkvY0xx?=
 =?utf-8?B?bkNWVktuSFZ3K3EvTGlEc3hPMjNhQ3RyeFdnQjBVVktFRVVFRGFPM203NmhF?=
 =?utf-8?B?WkNjRUJHT3huY3kxWSt3TnlCNUlJUmt2TElUQmJzVHpiRm54aXpEK2JCY2tC?=
 =?utf-8?B?R0d5TEN5N2dKZk1kSEorVTM5RWdaOHdIWUc3cW9WYXNNQnEvOTJzSWp1S0Q3?=
 =?utf-8?B?cDFzUXczNytiWjJmZXFwRVdTS0FETldXZm9vaHlTVGkyWVU2R1lhUXVNSDNu?=
 =?utf-8?B?bW0ycThaaGo5aXFKVVM4Yld2RWI0TzR3b2FScXZ4NzJISXI3NDlXQ0tvRWMy?=
 =?utf-8?B?SjR0V1p4ei82UkJ2Z1F5L1Nzcm96NzJLMDB0QkxZTlNjZVJLMkN1ZHlGTE1V?=
 =?utf-8?B?eEdXbTZHM2k0SlRxVExMZ25UTHpUbkxvNDRBdGtLZSthekREa0dBOXlyQlh6?=
 =?utf-8?B?Y3MySVQ3MmF0NUtNZng4QWpLQy9oY2NibUN3U3ZEc0NGdkhqMlQ3SGVieDJQ?=
 =?utf-8?B?NEY0eStZYkFMM0s5MFRMaUN1L0NZb2lmcG1JMkoyVVFSOGR6OTVuQXFaVVh5?=
 =?utf-8?B?QVphM3E0YWpRejhFMUpLVkR4NE53QVJaQlYwNzNlZnFJSkNiKzgvdzJDRHhu?=
 =?utf-8?B?T0owbUpIekc4T0JsaXJlVVllUlZ3OHJXOWlHejJRQVk3L1NWRTJQUitkS1lo?=
 =?utf-8?B?ZmJ3anNkV0svbmJFRXhOSFpNZE5ScytSRlRKSUZQNURHc1cvMGdJaGdFdFpI?=
 =?utf-8?B?YVlycmhTK1UvWjRpRzhyLzZwV2gvRWJnNXFBK2FxNW9yekRPenkxR0lsYXlH?=
 =?utf-8?B?UHJXb2hLUlpsN1FXY1IyTDZJMDd6a0pOb1BwS0VrNnJGSE5aRGFWRGhhL2Fw?=
 =?utf-8?B?cGNpL3pCZDlTN1JuenVXZFovTDJJYnE1QjRsQURTT0JyRTI1Tk9JMHFES09O?=
 =?utf-8?B?YTJnYmVEWmV5MTlJRmNrK0tqd29iaTBRM284YTN5NDdwTSsrK2wybXArZ1ZG?=
 =?utf-8?B?SlE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: 67283533-8184-4f96-771e-08db05e245df
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 12:29:19.7952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o44zCdHx5vORe/x0YrdYdejkJUzbQ4g5qPMQ0CoDBVUKa7+88/AlFckR19m83jjYuauI5XTHGE/UC31YT9f81m4lGa7dK56Q6fi6MhDzJDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7777
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
 dri-devel@lists.freedesktop.org, frieder.schrempf@kontron.de,
 kyungmin.park@samsung.com, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, m.szyprowski@samsung.com, aford173@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/02/2023 23.00, Marek Vasut wrote:
> On 1/30/23 13:45, Rasmus Villemoes wrote:
>> On 27/01/2023 12.30, Marek Vasut wrote:
>>> On 1/27/23 12:04, Jagan Teki wrote:
>>
>>>>> Thanks, but that's exactly what I'm doing, and I don't see any
>>>>> modification of imx8mp.dtsi in that branch. I'm basically looking for
>>>>> help to do the equivalent of
>>>>>
>>>>>     88775338cd58 - arm64: dts: imx8mm: Add MIPI DSI pipeline
>>>>>     f964f67dd6ee - arm64: dts: imx8mm: Add eLCDIF node support
>>>>>
>>>>> for imx8mp in order to test those patches on our boards (we have two
>>>>> variants).
>>>>
>>>> Marek, any help here, thanks.
>>>
>>> Try attached patch.
>>
>> Thanks. I removed the lcdif2 and ldb nodes I had added from Alexander's
>> patch (94e6197dadc9 in linux-next) in order to apply it. I get a couple
>> of errors during boot:
>>
>>    clk: /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to reparent
>> media_apb to sys_pll1_266m: -22
>>
>> and enabling a pr_debug in clk_core_set_parent_nolock() shows that this
>> is because
>>
>>    clk_core_set_parent_nolock: clk sys_pll1_266m can not be parent of clk
>> media_apb
>>
>> Further, the mipi_dsi fails to probe due to
>>
>>    /soc@0/bus@32c00000/mipi_dsi@32e60000: failed to get
>> 'samsung,burst-clock-frequency' property
>>
>> All other .dtsi files seem to have those samsung,burst-clock-frequency
>> and samsung,esc-clock-frequency properties, so I suppose those should
>> also go into the imx8mp.dtsi and are not something that the board .dts
>> file should supply(?).
> 
> No, that samsung,esc-clock-frequency (should be some 10-20 MHz, based on
> your panel/bridge) and samsung,burst-clock-frequency (that's the HS
> clock) should go into board DT, as those are property of the attached
> panel/bridge.

OK.

But I simply can't make that match what I see in that branch. For
example, there's imx8mm-icore-mx8mm-ctouch2-of10.dts and
imx8mm-icore-mx8mm-edimm2.2.dts which both seem to have a ti,sn65dsi84
bridge, neither override the values defined in imx8mm.dtsi, which are

        samsung,burst-clock-frequency = <891000000>;
        samsung,esc-clock-frequency = <54000000>;

and that 891MHz value seems to be out of range for the dsi84 bridge -
under Recommended Operating Conditions, the data sheet says "DSI HS
clock input frequency", min 40, max 500 MHz.

There's also the "clk sys_pll1_266m can not be parent of clk media_apb".
Are you sure about those assigned-clocks and assigned-clock-parents
settings?

Rasmus

