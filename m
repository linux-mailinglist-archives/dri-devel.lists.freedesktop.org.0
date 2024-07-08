Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59297929C34
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 08:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1E610E216;
	Mon,  8 Jul 2024 06:30:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="b3odVUlX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83E710E20A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 06:30:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYVA9jjbnCZ8UOcf0d9Y50r07qe2bkI2eN6EI5bBKIhiHfWVCz2J45SoueyPcRaT3AkGvs5nSL+LO+d5b1bVQbvXUNKEUHckbQQK2Qn22v0YmfR/r7hz+djtA8QQslGJSUyUSnDFD/WvTngWgBa4k6jg8tjOX8zjZ4EaSelsjecUVobJ2OUdV7pQzbN5T6rUBT3itgyc/9WFchYXUWb9th6bkooiGf3OEA2dE6IzNMmkyRI8dYhMGSgAIWNJNZ1jFmKN73q2pbAcCtjwYa+EK3bzLnj3y9g/2/ZrwDVDB8r3Db0b3bKf2IYBvdl8WFyKq0ZNspMcpOseD6cLKfuuUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5DI436uMjRNm7aHCSIA7z9Op5PL8FX5OeGD1tfJNEM=;
 b=O8ZWpz8YPvehGUs2JRBGTSq7ctJf1QiwqYkM9W/j0VTQAWJQO3sTu0SrF+P0KPmKW2y40Bbm8JN28I1RcfbxFltKGuxEa2gBLKOSqgcRtIBDSLtTzYSNHxJS3dYxB0LvDEuD8HxL+Xdoun38JSW0ZvG9nib3P+EiXt9x0hTYGE8zQyytoFcB0CkQRyiZywzON5qAxVTSB2FaPR6B1h01WpaF2pzVvbEOzGGIQstPDielzK2yTZZLiLDcIQ4uMgimR51Ke9ULp3r73qwSc9E0pL0SHniCrgV4KyScGJKWD9P0hxGnKYmSUDYCgwNFriHVUGEjqhMVR00thyPBbJPqJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5DI436uMjRNm7aHCSIA7z9Op5PL8FX5OeGD1tfJNEM=;
 b=b3odVUlXNGBBILnzjkluvGA05yDXSLidBqGD3ESFdUzBZvscSoTzMsMw8rDLOYo/L1pk/mdOmYeLMNvn4vjvxvaVNNn4SCjHxrLA0PMgEbGhZbOOcBoHB1IWGmf4VODj7tX8FGjwC/ULEW7wcHKPzQriA32Oq8HdIPdABZVntRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9755.eurprd04.prod.outlook.com (2603:10a6:20b:650::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 06:30:13 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 06:30:13 +0000
Message-ID: <9a911f88-7fbf-4484-997c-98b6c3ec045b@nxp.com>
Date: Mon, 8 Jul 2024 14:30:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] dt-bindings: display: imx: Add some i.MX8qxp
 Display Controller processing units
To: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
References: <20240705090932.1880496-1-victor.liu@nxp.com>
 <20240705090932.1880496-2-victor.liu@nxp.com>
 <eec3d2a7-0197-4196-bf6f-71d0e29777de@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <eec3d2a7-0197-4196-bf6f-71d0e29777de@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: ed6cca6a-95c7-47a9-0d99-08dc9f176c65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2VRMnl1akJlQjVPWjBiTlYyOVhLV1ZCNVVuTERSV0Fob1haMm16ZFRaUXZY?=
 =?utf-8?B?ZExhZFBZSWdvNkh5SDRrVlNJb0lPV3FLdExvbFJPa2NzOUpiODVRWUx1ZlNI?=
 =?utf-8?B?Y2RvL01jSk5TeUpFMXhBSGhuanV1VEZJTDJTM3pCNTY4cVBBNEwzVENZeEwr?=
 =?utf-8?B?THVJQXFtNm5veHRNTEw4cm9pemlvRCt5QXF0V2kyYnp6TUd3TEszeVcxU3la?=
 =?utf-8?B?VnlzUnlrWkZVR0VKRmhUTVBlRithYlVUc1lsRlR4YXFnNkR5VnE4RjNoWE9X?=
 =?utf-8?B?VWNTMHhCZitkbDh5Z0toc1VwT3dWclZkS2RUUDFsRzB3YUpCTXdtdzRHZ05a?=
 =?utf-8?B?WTlDOGVEQzQ4cCtnNjZlcXhtNWdYQ3oreUF0bXdIMzFaVDVLeFAzUkpxeTZ5?=
 =?utf-8?B?MUZHc1dwNSt1Y3lwNVZLWVZWY2oraUVPUHlrVFlNYmZldElBaDVpWkc2Vytq?=
 =?utf-8?B?ODF2UjA3UHQyVHBHODExcmc4NnR4SDBndzR1THZzZmRHNC9UOW15TWoyTUgy?=
 =?utf-8?B?M29nWk44dCtJYnhjVGJqdURGRWNaQVo3TU5ORm5GYVRtRmNZR3Q1cEM1K04y?=
 =?utf-8?B?QjZwMVdpWlJid2N6SkZuWkpnNzZUWjlvNHJXYVRpeHI5K2FXcmZQTytPK2ZN?=
 =?utf-8?B?REtZdEN5Nm1TRFhHS1JUMzVoYVMyZXNSWnd4L2dLWHVCVmhra0xETWQrTkJl?=
 =?utf-8?B?MlB5V0liejJDNUN1bkhzWmp1SHRCMExNOWVLNFhYbFYyK05CKzZLakVwL2dl?=
 =?utf-8?B?MDNDUnViSHRRak9QSW9JbzNQcWFhcDdFa3ZGdlRuYXpyeVUveGhDUnB1K2Zm?=
 =?utf-8?B?K0p6aDdRSWJ3UUVFWTZWS2hibVBLWlQxbHhnNU5WSUdkaEdZaU5JN09mcmpZ?=
 =?utf-8?B?V2twZUNzSGd1cE9XZnpVdnNvQitGWG1pREFQK1hmZ21sUElIbXhTaUJsQ1Ar?=
 =?utf-8?B?aVFYWTk1V251eEw4bCs2ZC9TS2RQZW04VlFTT2dlNDRLOWhRMit1bytUNEZ5?=
 =?utf-8?B?UGZWOVo3QXZtbU8yQkhIbzQxbTdCZXBOWm1uM242M0R5ZXErTUZsbXg1OFZl?=
 =?utf-8?B?RFduRlA0UDJndzJkN2d6TXh4V29rTDUxYWp1QmVlaVVjZ2J1ODlocU5pUEpE?=
 =?utf-8?B?NFljNlJpWlhwLzJLSHhMMUhkL3YvOWJ6N3Znczhoc0pOczVheDJkd1ovVk1B?=
 =?utf-8?B?YmpQdlRNT2Q1SnF0SXZNTjJzQTFZTkN3YWpLL2lvcWZ0eXBVQStlVDhQbzJY?=
 =?utf-8?B?c0lqQ1l3S2xsdDU0MHVoNlB2N25YdU9xS3N3Mlo3ZklDbzUrVFpVek9DWXNM?=
 =?utf-8?B?MEljNDQ1M3NOZmUvc1VCaGZOTTRZVEoveHI1Q0xCYnFZMEtMM2U0a01JZmVy?=
 =?utf-8?B?T2lsMGU4WEM2Q1FxMmEzeXRkN0ljYWNKWGhzMGZDdGQ5YmNYY3hWZlVGK3lq?=
 =?utf-8?B?K1JVc1huMFpSWmh5eUh1Q0RNdW11THgzNDdZWmFHQXZJaEFNdUN4SXRFbnBI?=
 =?utf-8?B?WmVldWNoRllvTnZPQUg4b2QrTTdBWGtBSWNLVk5hMUc4Tnl4Tkk2NEFtbkNC?=
 =?utf-8?B?cE5MMlVibHBsT05QT3NNREFabEN3Q2dTU0VCYzVhcmtZbGRIWW5XeHV6R0I1?=
 =?utf-8?B?OWdobno3VXEvZ0FaV1Q1a0Z1aXVMQ2VFMGlBV3lGdDRjT2VEaXREaCtSQUVG?=
 =?utf-8?B?L0pyRzRWYlNySzZiZjJyZWlSTG05UVc0NkxNNk5vU3R2TnpHYnVFSFBCbXhz?=
 =?utf-8?B?MXQ2djl4TjVCN05ROUw3WXkzSzJ6Z2w1ckdIcjJxNmtKZHNOVnZubFc1UTlQ?=
 =?utf-8?B?YTJKdFVPbkVSbTZFVlNYUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QVRVUTVyWk5CM0pkS2V6WTdjMWV3OGRhMmhTTTNONFZLUGRxS0Y1Ry8zbmJW?=
 =?utf-8?B?RkRmTnZVUVp5N011SW84MmF6OEpZbU9ING1nckMzSzFMeGE5bnA5cHk5V1NW?=
 =?utf-8?B?Z3doamhYMVd4S2dQZWFQVzBPUjZLR283STFDLzQ5L2oyczU1allISkQvMUtx?=
 =?utf-8?B?YkJUbUVlTEZTMnNKVlBwdDNWcCtYN3B2d2xhYTBjR0RxaWZZQlVGK3lsbVVK?=
 =?utf-8?B?Q2lrNmFlRHdVZ2FieUFxUGc5RHZGVUkyQkZkbjhGa3p5dndYdGpmaDRCY1Z0?=
 =?utf-8?B?ZDRMR3FJNGMxbStIZUVqVjdhNXRkZjhYS3FpcGZxOXJWNzJIdzJIS01CbXJ6?=
 =?utf-8?B?bHZZTDl4cm5RWkZmVTVZaElKMUQ4dDYxeHVXaEUzS1FYMFlmNi96QVJXb3pG?=
 =?utf-8?B?Zm0zQWZEZG9HOTZGelc0RnhGR2xrbFdYd3AxVVNXZS9BQUxnWDBwSkdNbkpN?=
 =?utf-8?B?OGJkdlNBMmRicnhGT1Fhbm14VHJXMUVVdVhuaXBiTVlhbUttL0NYOFJhRmZl?=
 =?utf-8?B?Q1hCWk9vV1VCSGZZdkh1OC9LU0VxdEZEVS85VE5BSUVicGxGb3hsYlJCb085?=
 =?utf-8?B?NHh2Mjg2OFVwbGZhSEtlTVZXdnphS3hWTDZhWFljQlF6YnlnUVkzQUlQU2tZ?=
 =?utf-8?B?Tk9laUFid1FORGlNV3lWaVNIVkljdGlNME5EY1JWMExOak93M0loVzAzMUNi?=
 =?utf-8?B?VmpJaDVhOS9mNFh1bzlDeENlTTY3Y085TC9pM291L2drcloyWXRqQ0JFaWIr?=
 =?utf-8?B?RE9QVFlMc1RvUFYrNDNjQ0FxT05uVjhpSTVNUzVkeTNrY29ORldPVGVyKzN4?=
 =?utf-8?B?OEtxTmVrZUJWZ1gzM2ptcnVMQmRrQ3N4TXBWRDFRbmZrUEtXeitaQVlremJp?=
 =?utf-8?B?dWNSQ0hpL3NsRjVYVnFwUVB5VlU2eUNxSXd5YWFNYzcwNWRtRGkyeU9yM2tK?=
 =?utf-8?B?OVpXcEM3UUIxUzFBZ0RqcEt0RDNMQTVrdzl0djhiYjBCZml5NnV0aDVzM1gr?=
 =?utf-8?B?OC9xTzVzeHFReWR4RGJDaWlzZzROTm5HcytnMXFoaG1udmlQRUFBMHdpd3pO?=
 =?utf-8?B?REJKSEFSajhDNDVCaUhsTEtqYVI5TkIySlAzOWxpUmpHZFFIN3Ztc3JOZldB?=
 =?utf-8?B?UEFFZ1QvclBTSlhQZFY1K3lWeGY0YS9LUjNsTjZ0djBxanFnaDEveVBqR0NK?=
 =?utf-8?B?QlpzeGFzZWc1d3pGcmh6L3dScHVDbzcybDdFVHVxdW5LMStGajVLUjY2bGI2?=
 =?utf-8?B?dy8rYkVsZ2pldE9oQkRGbStkRkhZLzJlbCtTNUtnNG5pcDRNdVh2Q0hyVUFu?=
 =?utf-8?B?N2lMQ1lCUVlTQVJDTGRSbjdabEhGa0x1blVJZm1lUWVGUi9mb3g3dVpkUm5z?=
 =?utf-8?B?QWdRT3pXeTgvT2c4Ukc3cFBYelQrT3dTdHRSNkI2OEhNRUx4RWlpZ3lrV0dG?=
 =?utf-8?B?RmFUTVhJSDBNc0IyOWFKQ2VLWkRETk1WRHpXODdaTEdIYzF2TStRak9mQzk0?=
 =?utf-8?B?ZVg3eC8rZzZtblY1RWJrYlVxVlMrc3hPRzJjWHdWQ3FlOHR6OVBGaHlLMndI?=
 =?utf-8?B?OWdQZ2tNVkVYd002dmxxNXVGVWRDVTl3V09USDRBb1BrM2hlSDFLVWRBZGRB?=
 =?utf-8?B?b1ZOWlN5em1XaVpKakdkb1pwL25TakNjVGl0OHlmMzR2VDRraTRPMlcvajBr?=
 =?utf-8?B?b0NvbitxQlFHQklHSFgyMFZPUTJrS3BPbUl5ek0wOW5oTE9PeHBXYXRSNkNI?=
 =?utf-8?B?b0FEV0hWTDFQNGlMRnBrbHNWSExyRkNnOG01Si9HVlBrT0JSblFaa1NrbDN1?=
 =?utf-8?B?UFZUTEF4VlBobmIvMW1OM2JKSUE1M2gxSFlYM05Wdnpqa1Q5c2Y0NVpvT0JB?=
 =?utf-8?B?RjQ0OHRBM1R0UWhTd1FmT09rUlZ2Z05TTGdFN1VhYXdzRkg2emp0MDUyMzkw?=
 =?utf-8?B?WksrZlZiVk1HRFU1d2VRZ3V3M1lRZ2xPWW9rbEJ3NzdkdHlTNVlhWXNTWjJN?=
 =?utf-8?B?N01ObmJKU2RhSEhEQXdtSmQzbVpvNlYrSFJ3Tmc5WW5scXdncHpBNlZPQkhZ?=
 =?utf-8?B?dkJ5MkRDaWp1QzdGV2ZaejVpSkRBQWFNaitCMGJKUUdKd0Z5T28rb1ZyUGll?=
 =?utf-8?Q?+gLG8JTpjzBi4h39KETNRq/Zr?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed6cca6a-95c7-47a9-0d99-08dc9f176c65
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 06:30:13.4024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+iUgSBhTahurrExFvuVz0yYkfSH6B8lQ6V6M831QIdCLO73W/7syHLQTyV89LlyKdpZT476NLdcFtvhAmGDRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9755
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/07/2024, Krzysztof Kozlowski wrote:
> On 05/07/2024 11:09, Liu Ying wrote:
>> Freescale i.MX8qxp Display Controller is implemented as construction set of
>> building blocks with unified concept and standardized interfaces.
>>
>> Document some processing units to support two display outputs.
> 
> 
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8qxp-dc-tcon
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  fsl,dc-tc-id:
>> +    description: Timing Controller unit instance number
> 
> No instance numbering. This applies to your entire patchset.

Then, I'll call of_alias_get_id() from the drivers to get
instance number instead.

As i.MX8qm SoC embeds two Display Controllers, the alias
stem would contain the Display Controller instance
number, like "dc0-tcon" and "dc1-tcon".  Is this ok?

> 
> 
> 
> Best regards,
> Krzysztof
> 
> 

-- 
Regards,
Liu Ying

