Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6971C69CA9F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 13:19:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69D2610E08E;
	Mon, 20 Feb 2023 12:19:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2133.outbound.protection.outlook.com [40.107.104.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FD310E08E
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 12:19:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FR3/C/Iw+rXVwGUrVdCj3riig1oru79OBLtV17tMQhhKpzuTKZ/I8l/Rgd5xuPXV3ekDKs3c6CF0dCZyaM3Qh3QF89eS1quMgFkKlevONCCZQWIAkho8b4jsD0VlDY4LHkVQlPfgQyQIy5GzyvI3m3M46JVgG1j3IaVPg0F7GO6CLoORjhEsaS3NutZ53InmAiYxZwiR+Yx6lBE68XgBk1Oox/xq4T3gKgPHoWx5H4R9iDNztNTHYyTGvAuZQ0ljNAACvhAp3xAdp7rjU+GqDR2eXR7yz2+micgwSYvT7X+nBvh1IlDQFxPKGqTH/uG6zJzHE+yajZ0OTVGDscd2YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLWF4mUUX/uYrKCDT3DTXOnUh8TmBt/3lwzvU08sQnw=;
 b=jKRiIwI976mTfQ7b9xkyzaj1lUSqD/P35TvLUm3AILr4H7yxwqdKPeOabLiwwwTXxaQJlDL2f/M5i0LegC20YvmXfQ2Jma/DXTUI8by/JCpf/f+pGPOfKAavPEF9fzhvMffocflX4v5aDZ8ZidUqc5vxTcWtX5Z9+t0cIk2LnRXgrW+Nhk/mAzybDw4xB29IyoyvjYP1G2u51B0YM0TNixvAi82WjasVXwMH/2rrpVQPadVT+u9DEAU680NWKUxJksZg/3KmzVHV4WU/sXAXtcSzIeB3wD84TfLr97rhfPtKeTmUNYkRfwU+PRJXxJbq2v1VLgQSrxeHhBbYSfUL2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLWF4mUUX/uYrKCDT3DTXOnUh8TmBt/3lwzvU08sQnw=;
 b=dgdZqutL3ndIn672e/Q8tX+lCb+zqvlc935Ct3Jcs2h0au96pz5dIt8Nj73m49sO9JQmClMk15BR4PFKbpJEyxf/y+WnFX8VnWhHUfXkZH4PdQ8g9TmBIp/w/bBUPWXb6wu2kIQBoTaAsfF0o8axwaYJSAu0BsdEToOIyqmalls=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:34a::22)
 by DU2PR10MB7861.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:497::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.19; Mon, 20 Feb
 2023 12:19:02 +0000
Received: from DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d067:93ef:f184:668a]) by DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::d067:93ef:f184:668a%4]) with mapi id 15.20.6111.019; Mon, 20 Feb 2023
 12:19:02 +0000
Message-ID: <ed28bbda-16b6-043b-5310-8ac0e8ebd900@prevas.dk>
Date: Mon, 20 Feb 2023 13:18:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 0/6] drm: lcdif: Add i.MX93 LCDIF support
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Liu Ying <victor.liu@nxp.com>
References: <20230217065407.2259731-1-victor.liu@nxp.com>
 <13207614.uLZWGnKmhe@steina-w>
Content-Language: en-US, da
From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
In-Reply-To: <13207614.uLZWGnKmhe@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MM0P280CA0091.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:190:9::29) To DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:34a::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR10MB5266:EE_|DU2PR10MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: c591d00e-f284-4610-5ee5-08db133ca6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Pb7eCiP5OTGm6ZU2pqUEzpP3VovgSPyXGVgkcwFpt8gU9cTbe9HLlpirhqBTb9ZtksFPFtb5Uu42NbscGy5rH1kfla4EkJrigm7sBZ77VofmsXrrv8BXDyRQ+apAWZeEFW0IKowQRvELL3OImjPJoe43wEk43akSbi9JwK07sJhDpg5aMVZSkyW6yHwBdzzbs5KPzdyznaRTgnvr1xX06RKSY6W+IcgaAo6cebhpSlrmwHgsbpCKRLUeHhBKg1N8l0O8ywcBTbzBn7Yc88hvwnpZfr7eyyiORM73N70a3hyZC6UD/qko5cLs1orO+WXNK5OfNjkRaJBhRq1SCJrigxkUnjx/MrW0QJA81tfDdSdaLjBQjzGX/3znkIpYUpET+I33d6YnQ4YbUcvHmm25kAZidq0bd5XrVDu/gmDjazBs3ILPIATSVPebbXmlDGP3Ea2Fih6bpph7llJEI7BzWBlnUCOo7HlEcN0VVGC9c76fWo9l95lInUC2pDzZX5i7JNRvxiKd1rzbFsnMmUrWVh5mNd0XzcTzBaas3S/VMFHbj+aAvFr1k0vfCAGDpl4Wn3+rwif+7pOXvESBfUZMoea2OQu58EUOAkJxU3BvlLrQ6w43XCfcqGb37IOk3JVpQZodP0lJIWsM+gT7d3PIGrlorRNluPq8OJ4zLAGUeufocjk0LXzNrA19W5wWMsR5RJE1qlz/+hEUycrCWKFnh3FzPsNnH/xcsBrgmoNrMGuYrcTqImUXmjm6bMckjSeM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39850400004)(376002)(136003)(366004)(396003)(346002)(451199018)(83380400001)(66476007)(66556008)(66946007)(8676002)(52116002)(478600001)(110136005)(316002)(19627235002)(6512007)(6506007)(31686004)(186003)(26005)(8936002)(8976002)(2616005)(7416002)(6486002)(36756003)(4326008)(966005)(41300700001)(5660300002)(6666004)(38350700002)(38100700002)(86362001)(31696002)(44832011)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWczRDVsYmJya2RjV3g0Q1lkbThVVWhnZUNtVEVvbjNHNUczdXdOenc5QVBN?=
 =?utf-8?B?NDFYWFJFMy81M1k5dENvSFpBMmRicXQ0ci9LYlp2M29KREVjZWRTdU9ENzc4?=
 =?utf-8?B?RlZhWnNRMDlmS0N4bEppQ25NUFhYVEVRWno2Szl3blFVYUpXQ1VON2ZPcmFs?=
 =?utf-8?B?T0JzZjVSa0NueE45SDNRbGk0VUd2b0RHUGlhT0dWWjN2QnZNNkQ0VWpkTVkv?=
 =?utf-8?B?V3drcHlYMnUyQWVCamVoc1llNGJaWXlNQUxxYmlLSTNJYWZqT2RyRzE5eHNu?=
 =?utf-8?B?U0k4aHpRc2x4alZEaDNiYnI0ME8rOFVNR2hzTHB4ZzBKMEZ3RmNtekorM0Mw?=
 =?utf-8?B?ZVp2Y0tyUFhFZWtzaXVZbkRsMTgwUW12UmtLRnFGZVh0cFV4cGRvZlo2dWI2?=
 =?utf-8?B?azg4eDk5UnM2bXlTSkVJUHVXbnJKdzRSZjA2RzVXb0NzczljN1VOaTF6NXFZ?=
 =?utf-8?B?SmR4S3RkVTRVNlRYcDhPV1VnZkZNK01WVWYrSVNHK2NjQUk5dnBWUnVPeERz?=
 =?utf-8?B?cDhoUnMyN25SSjEwekFEbTdpWWJmYjgxTUNBR3RMb0g2NFc5SVZxc3lGMHVI?=
 =?utf-8?B?dTd3YTJ4MGpGUUZPd1VFUUNGN2pOVkZsREo1aE05V3JxVk9xMlJ0L0p3eDRC?=
 =?utf-8?B?SUhxSjFKS1loandsL2I0TGhqWDQvZkNPRlR3ckNIRW9wTFA4M09jQjZSNkQv?=
 =?utf-8?B?NXFLUWRLMjAxb21uYmxBbEExTzhSeXJvUWx2U1dQNVBzd1oxNlJrbThHZ2lt?=
 =?utf-8?B?QnR3VWJmZVdDbFppeDl4UXFqZVpSRnR0SGpzL0Fmc3JlaE0wQkV1OHd3ZVNp?=
 =?utf-8?B?aVIxZG5UWEtkZTRCUFpKWHlDWG1ER01XYytZcWlSQkh5dVdsV0Nya2toUkd4?=
 =?utf-8?B?YXREUUZTYkRreUpHVzI5dUZORDhnNElta0RySGJaV2Jya0VLcUFLQmFsNm1o?=
 =?utf-8?B?eFRRcU00TDYzQ3dUaFJjVkV4cnZ6UFkzUDRPeTBFK1VyZFFQRHJlRVRhSFE0?=
 =?utf-8?B?dGFXUnlKRmsxQldEVEFvQ1hKTmNFL1kzaXdtR3JtWG1FQmNZc2ovMWJtUVVl?=
 =?utf-8?B?Qm5jUWV2Z0Fjc05vSFUwTm4xWWZWWVlHSzYxOHBvWkFjdEJxWGIraStqS3BY?=
 =?utf-8?B?SE9MSXNZdjg2UHRjbUlPdCtOcnpxTm9VWEhIUEN0ZzZ4SEtxNVFaVGRjaW5m?=
 =?utf-8?B?cjdqbHROeFVHc2hTS29aOUpRbHNzcVFMY2FFVXR6KzVVYXJ4a0QzdjcwNUQz?=
 =?utf-8?B?Zi9PNDc0Y2JnSXF5clY3aS8xL05xV010dkJqcVQrMC9HNE9ZYUpHVCtrRjVP?=
 =?utf-8?B?dFZwVjNPcWszSHJmb2JjcW5tYzBmakVRL0gvSDVQNUdHTHAySVl2N0VMbWl0?=
 =?utf-8?B?L3N1MGM5NmZnK2pnRVlscFR2c2g0OHRUSjdOQXY5VnVEVGFtUjM3dmNuS1RC?=
 =?utf-8?B?eUtBcHUrYnh3OGlPL09CSGNxU3dBcXBzMGNndy95ak5EWVhralplUkhVZFlt?=
 =?utf-8?B?TGZRMS9PbHc3NnE0TytlVzk3STV6R3ZRZ0s5eE9RYVhYU3NFVnJMdnVKcnZY?=
 =?utf-8?B?SEVFQjVvRFlpZUxIWERucTBrRStpNmtpbW95NjJYMUw3a09INkM2SWRxQ3pM?=
 =?utf-8?B?M3lnWHRIWnZNcHd2WjAvM2dnZmJmem1Ka201NDkxaFhUMW0yaHZHQkF5V3Vw?=
 =?utf-8?B?TzVmRXh4YUZ4alViOUdMcldxbnBRRUxUZTVLek13UlJaTDRJYXBSRWhLL0dp?=
 =?utf-8?B?aVVYcnQ1RERSbXQvTFJjaWFNRW81VzdyWEJDOStpdkRVM1M2Uk9RQlNDNVdG?=
 =?utf-8?B?SVpsMkw0eVBJWnBxbWFucDJOWkRwNXpSUnIxTW5ySDlrU0lWWmtnTWVPVldS?=
 =?utf-8?B?eFYxeSt2L2tGZ2xZWUdLTGlrQ3hTUUU0OWwveG51ZzZRMVNSWFZ1VTBhR2s1?=
 =?utf-8?B?Yzd3ZURHV1dTcXdyQXM2WTNTbXByR3RyVGJyMFk3Mms1L1BkdU8wb21pOFh3?=
 =?utf-8?B?Mm9rTTZpRU5VWENhUTF4WTZKOU95T2VWb1NvZDBwNnoyZi9DcGMrYXIzdnF6?=
 =?utf-8?B?SnVONWJTRGZGY2NZbmZuVXduUHhDaFVpM3VNUFdoNXRwOWhnWFZOQ3hpK0FT?=
 =?utf-8?B?WDR3VkVDWmVIQ0VqZHgvK2ZhYVh2c2lsVGg4aEEzOEJxdUhVSkd6YnNyWTRU?=
 =?utf-8?B?REE9PQ==?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: c591d00e-f284-4610-5ee5-08db133ca6e5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB5266.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2023 12:19:02.3947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9FdsN97l+3LI5ROGUag83FkP+HWM+Vb32pQQDujuFv3sG8+CKmGn+vQTjBqA0iv1Zn7Tf0B03n6jwxSlnjLQqvSvQ9rzJZKr8PPYTvEFv6o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR10MB7861
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
Cc: marex@denx.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 krzysztof.kozlowski@linaro.org, robh+dt@kernel.org, linux-imx@nxp.com,
 krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de,
 LW@karo-electronics.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2023 09.18, Alexander Stein wrote:
> Hi Liu,
> 
> Am Freitag, 17. Februar 2023, 07:54:01 CET schrieb Liu Ying:
>> Hi,
>>
>> This patch set aims to add i.MX93 LCDIF display controller support
>> in the existing LCDIF DRM driver.  The LCDIF embedded in i.MX93 SoC
>> is essentially the same to those embedded in i.MX8mp SoC.  Through
>> internal bridges, i.MX93 LCDIF may drive a MIPI DSI display or a LVDS
>> display or a parallel display.
>>
>> Patch 1/6 adds device tree binding support for i.MX93 LCDIF in the
>> existing fsl,lcdif.yaml.
>>
>> Patch 2/6 drops lcdif->bridge NULL pointer check as a cleanup patch.
>>
>> Patch 3/6~5/6 prepare for adding i.MX93 LCDIF support step by step.
>>
>> Patch 6/6 adds i.MX93 LCDIF compatible string as the last step of
>> adding i.MX93 LCDIF support.
> 
> Thanks for the series. I could test this on my TQMa93xxLA/MBa93xxCA with a 
> single LVDS display attached, so no DSI or parallel display. Hence I could not 
> test the bus format and flags checks, but they look okay.
> So you can add
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> to the whole series as well.
> 
> One thing I noticed is that, sometimes it seems that before probing lcdif my 
> system completely freezes. Adding some debug output it seems that's during 
> powering up the IMX93_MEDIABLK_PD_LCDIF power domain there is some race 
> condition. But adding more more detailed output made the problem go away.
> Did you notice something similar? It might be a red hering though.

Interesting. Sounds similar to what I encountered on several
imx8mp-based boards, both the NXP EVK and our custom design, running a
mainline U-Boot and downstream NXP kernel:

https://lore.kernel.org/u-boot/20220823133645.4046432-1-rasmus.villemoes@prevas.dk/

I never really found a real solution, but as the hack I ended up
applying in U-Boot does involve some clock settings, and you apparently
now figured out some connection to "overclocking", I do think these
issues are related.

Rasmus

