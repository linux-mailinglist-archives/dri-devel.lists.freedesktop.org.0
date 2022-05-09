Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D46351F3B0
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 07:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC4C10E55F;
	Mon,  9 May 2022 05:08:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07olkn2079.outbound.protection.outlook.com [40.92.15.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2D0010E55F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 May 2022 05:08:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O1d3hvk+5hBAEMw0ki4XMOi/acQfG2zFDmPg2ho6/oTdYSHVb9rocnV5Q1ordbrnUfsQ6wvvpkLIs4WtzXwkE+/GODUls5i/wy5e9QdBAzP0CbUb7ru7FiAhp9d6Ms4NVQv0+EFwAFNBjbtR44Me6wOdcTQMppPO6T9kn3NTi7Snlxk+pcokUERt3NgTB3y6F+br92FaAogrHJV4WAlRQ03+AKP76kTsMWjqlL7aubpw8KpytBpGoNqidmfgXG63qSx7LBGaDcCVDYGODXeAwiQbkXScgUEg5QQxmrbXm8DMdYDqK02q5GSXmZ3tzGoWyMi8B0rKJdVONolxrhU6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X4hYLaRJ7goFB2pH7XIGgHf7rPaDjljSWFZJhCc+sxM=;
 b=LxkLMqcb64Gh1j8uWNohVwdIonWbSRBCQK1oVJDCTG3T3x0Ie+7vpXSf8qXQ+4A4+0wQiRR2Sku4BD/Cz+B7CCRy93jAM2b557CsSCKsO9eYy+p9R0FOyh7uk/20HdBVzOiWNkkYzMNFDPu3vM2WUxpWLDPFbcWMqyDm8jawxDjgTFQW3RLl0xIfHLdvLWBuEDppeOCs0M90F23sk1TJFIGRF0kBu3VSemRmuJZILzEOTC50vkYB3iI5HVwwO7UkcjzcYUUfumDmCN6YDlKFf0LAo5pdhhu8pebu/YUgZbjtYIrufDmkj1VUdLpFwtedxv+hm8TdossX6NZ++8ea7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by BYAPR02MB4839.namprd02.prod.outlook.com (2603:10b6:a03:51::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Mon, 9 May
 2022 05:08:32 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::303a:ab1:17c1:2d16%9]) with mapi id 15.20.5227.023; Mon, 9 May 2022
 05:08:32 +0000
Message-ID: <BY5PR02MB7009A604AC912DC78FAF42A5D9C69@BY5PR02MB7009.namprd02.prod.outlook.com>
Date: Mon, 9 May 2022 10:38:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
To: krzysztof.kozlowski@linaro.org
References: <2ab35af2-b067-4243-35ed-a592a7046374@linaro.org>
Subject: Re: [PATCH 2/3] dt-bindings: display: Add bindings for EBBG FT8719
Content-Language: en-US
From: Joel Selvaraj <jo@jsfamily.in>
In-Reply-To: <2ab35af2-b067-4243-35ed-a592a7046374@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TMN: [u74+zylxvnzsghSPmLvjs/1Tuo1DFy98F5aJcBSEADMOPzYQvTIR4jeFQCrYeYUI]
X-ClientProxiedBy: PN3PR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::23) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <d9d6bcd5-9845-e220-c72c-aab5c4c82e93@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 690e3eae-3cb5-491d-0e82-08da3179f5cc
X-MS-TrafficTypeDiagnostic: BYAPR02MB4839:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4CMa+ehVjkAcETNvhMluL7lTlsftiRbFFPIXSibhau15TQxVj/vI0loXPoneDcfDl9NXFgFJMJpuJNyp1RvmBRQQd6PVr9Fcos7Emi7sq9nzp74giZcLc1YZL9B8AZuFpxrK7Ag+6R+V2xmAS9t9t6mSspNpj/bqHFwkIv+l6BMOmOyg58rA0g7b2zkJimVGviL34BEPRcDmWtFQ9n9ujneSy1W25EQp84lpXg+14Ms4DfNJRYOxXgedNDXIahA/87dth0L5xIZWmD2k7zekkFwX87FRHdgcRquWPhYv/X0zUh6pNZdJXiH6N4GxiBRzNx0BoVcbFEN+mjHSLCop0q2Q/EbB97U8YYOScZ/VSWC33gpcsxl1XB8G5sV6AZNGUA0El+Zk0/79YaXpLU46Vk+9MlqgCEGGv2koInNglnQPUi96JBizOdUpcfbD/Ft/RfgMbTB6WBDcHuTHLd318j2lG68GuhGgOW9j7j1sQlZndfEJUSvNfQwItl1BM83eF+uXzc9uI5Tw9oQoUBu5Esmcc06tV2KnpvDZYXKVRxBZ1vzY3s4n26/YWGnOLiJEoqBj53SN8M+cbOMHnfn0cezVEINm/XLJ/okqH2PSmb/SExCiebHVQr4jWYTxRdPa
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QzRqNDFiTzludnNzRGdseXEwTUpCY2ZIOHMyaFQ0TjZuaXRyN011L2I3Z01x?=
 =?utf-8?B?bnF2VldnT1grS1FtdTFCaW4zeDdmcFFoSVczYkRnQjR3cWpzMXFvOFhZRGMx?=
 =?utf-8?B?RDM1NUQ1N2tzYWNOenp0WEZiYnNGbnJUbzlNejBKZkwwZFoyLzJHWWxWT2VR?=
 =?utf-8?B?c1BKQ0QwdWl0UkRENUFyajNtUXo2ZmttNnpJOGdzdzNuZFBIQi9XUUs0RFF1?=
 =?utf-8?B?VzNjNHd0YUoxd3dCeE1ORlJCaGNOdjFtbUZZYkpnajNUUG9EZ05jUDJIWmQ0?=
 =?utf-8?B?VXZhU3hHVEFxTjdSQldpYk02aWFMTVRPOTZKSlI1blU4SjZERlgxN3RNOW05?=
 =?utf-8?B?KzV1dGJ1QWZzKzJTaS9WV0QyZGszdVlXd0g4ZFV1bFFjR05iRnJTcjBQYXRs?=
 =?utf-8?B?RHlUSzJJcGVWMFNBN3EzRWJzV2h6S0V1Q0kya3psV3RYaUxnM1dxWTlrdDR6?=
 =?utf-8?B?R1R6R0hFYnhoUkl4Q2xnNmZha2FmUDgwZS9XWmN5cXFRZWRVYXFwQjM3bXJO?=
 =?utf-8?B?L08rYS9mUlgzQ3ZJYzdDbExYZXRvUXF5elA4UXlmMGJhZWo3WnNjZldkTkg2?=
 =?utf-8?B?UHgrM3NBU0xPOUhFc2k2eFllVzBGbXd1bzRqNzl0Um9KRzBqUXBYOGNScDFk?=
 =?utf-8?B?N0R6Q3IrODlWWVhIWWFWRmhiakUzdkovZXFYdmowNGV0ckFwdHpuZWs5R0Zh?=
 =?utf-8?B?S21ENGRpUWNIODhDekVqdmxCbU9rZExQTUF6UmtDVHg2UTM5VlVLMHM4SnZk?=
 =?utf-8?B?dU00YWJ4bnlWckVrV1ZvYU91SkVBSDRYMkRvcTZSV0hSSE1hdWsrQjJ0RFJP?=
 =?utf-8?B?d1J5ZWFKekpiYllqZ3NudWZWUUhQR0p0MHhDUnVhMksvSTJZMlcrenpTZ3Uz?=
 =?utf-8?B?T0VCTHhKU2FpVExrRjZMQXE0SkEzNXRDaFc4TzdRT014cmEvbXc5dElHaUw1?=
 =?utf-8?B?TU5NREN1Wm8wOW5HeGJyaEtST1RRR2hYd3dsbmNXL21tTXVqOCtjVkpReTRt?=
 =?utf-8?B?TzhDeUV6R1ZaK1dGSVVYRDVBRGJpZFlLYlhnbUtHZFhIUCtYQmFkYzZRZW8z?=
 =?utf-8?B?U1V0cEFwQ3c3RDU1MFI3cnI4ZGFsazNpNkZFOUU0eTJwaHplVFJQT2d5eUJT?=
 =?utf-8?B?eGFKK1lSMkJsYTdzbGZ3Rll6ZUlOYU9ocDloVGF2S1Z0eklCUlphTU5ZZnJo?=
 =?utf-8?B?b2ZDMFpRcXhqQ25tb1RPTlpEd0luL2V1YjIzWkRaR0laS213Y0g2ajZyTGRx?=
 =?utf-8?B?S29PejBZT2Z1djJRa05tdTFjaGhzcjlqVk9vemVoTi9Zb3NOY0ViY0ZoekVk?=
 =?utf-8?B?UWJSZjl0SmJjMVE4WWtWbWlkb0kxVDA2RGl0dEMwcTg3djlveDEzRzlta3BR?=
 =?utf-8?B?eTRtQnV0cVZldDFwOFViKzlCdzg4bHdZZ2dCSzc2TXpPMVc5emNNTU5DdU5u?=
 =?utf-8?B?ZDZnT3cwUjZvQUJXWWFyL0RZUjdETGNWM25YWWhVRGFGYWR6cUhoN1QzNDVD?=
 =?utf-8?B?aEc5SFpCeFp6TUV2a2p5M1BTMlZaeDJzWTVOOWJBNVVQRDRKeVphK1hxTk1h?=
 =?utf-8?B?V0dSUWM1ckFKVzNOQlpTWEhHTmd2Qk1JU3pCeThFeHdMajk2cHIyRGU3NVAw?=
 =?utf-8?B?MW1PTW5TMmhQVCsxZWZNYnN0eGxmREZXM2FhNm5FUHR5cFhuakxKZk91Z2Np?=
 =?utf-8?B?dXYrZGpaUjFuam5kZ3Q3aW0yRnBYN3pNQTRDWFhNSjBZMENOYXhvbEhrNGVS?=
 =?utf-8?B?T2RhT0FiUGJaamo5KzhQWjFCVDFpWFp2cENDYzBPTjRmQzJaa3dML1FRRTdn?=
 =?utf-8?B?UlIwWkxKbDhaQWV4VzNleU9DRnBhZldFbXUrQ3JsYU5pNUR3M2RNZFpnMnpV?=
 =?utf-8?B?RnlsVWRQcGlDTFVFbEJ6WFlaUzFCNGpmOFNDNWpPZFdBWkszTGx5ek1ibHF6?=
 =?utf-8?B?TVhJYWtlNDJwY3lPUG45c0E5WWFtNENSZXhjWlFRSU1DZ3hLNkRjdFB4cUcr?=
 =?utf-8?B?OTY0ZklOUmp3PT0=?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 690e3eae-3cb5-491d-0e82-08da3179f5cc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2022 05:08:32.5951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4839
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
Cc: devicetree@vger.kernel.org, fanghao11@huawei.com, airlied@linux.ie,
 shawnguo@kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux@rempel-privat.de, robh+dt@kernel.org, thierry.reding@gmail.com,
 clabbe@baylibre.com, phone-devel@vger.kernel.org, sam@ravnborg.org,
 stano.jakubek@gmail.com, jo@jsfamily.in
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof Kozlowski,

A quick question.

On 07/05/22 21:02, Krzysztof Kozlowski wrote:
 >> +  backlight: true
 >> +  port: true
 >
 > Both should not be needed - they come from panel-common.yaml. They might
 > stay in list

I see that almost 54 panels mention "port: true" and 46 panels mention
"backlight: true". Almost all panels refer the panel-common.yaml too.

So I think specifying them as true is just for extra clarity that
these properties are usually used by this panel? But I am not very sure.

Should I leave them be? or it's still recommended to remove them?

Best Regards,
Joel Selvaraj
