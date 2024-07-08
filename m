Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0970A929C58
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2024 08:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE34D10E20A;
	Mon,  8 Jul 2024 06:40:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="nixV1yiU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11013029.outbound.protection.outlook.com [52.101.67.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C8710E20A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jul 2024 06:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GciSGm8NmVgUtLe1PgPf29UQmH/ezffv0YpAFSFl6XlCYNZs0BPz/rBdfeCn7hiA9vkYACkKaaGrD71rxPQXUNcTd454pi4l+A8+puTJ4UeF2R2PQqioE8GdG0OAssGXidlLp2hbOtwxwDejxHQN4SEfQWlzRQD6n0LDtt0gThhklHFuE5jGBo/CNwxLAKii3ou2uw/JStqvusqpFuIksA/SOEyFM01QJ+RaTlidcEdWPkRhTKezfz9yxkCU22thxxE3THGoJGXNpvRxjlvqGF2Lbq4sUknuZCtK5wPceQy/iNpGYzyih+E1Q5MlZBqcOYIyF0PY52ol0FbcJzW/BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYzYZGOJ/5ZZnztl59syCJEfHFs6eGsfUHfFXxmc5ao=;
 b=kJIAtB/gTBWqPr7+ySjlchOIIqiyQcCFjMIFr4L8o4AgHz5RNS3pJePHkvfiBfbxUMk41pyPr633Y3ZNAz0q0NPtScwKV6LkDBVtmc99VmqdEt1GRZgEHQT0iH3ILLBJRiMh0CI3fVCNaX7xqW+YYtZIwjEALInHvEl/UXfoYinVfJsqZxm3waaRMBf0jMCOnVW7HHt8Ef0AoghVYMnRLqS+TkYBMBNVDUqJNBItoJWTmxAZm9szjg1HlDdqs0t6btka+JzdDUD9jNGFDgctI0eDNWO3AGaHsHcvVX3obgKAf77hrYBLngUG4W2r+lfZAgGU5irJucLDhsVz4NOh2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYzYZGOJ/5ZZnztl59syCJEfHFs6eGsfUHfFXxmc5ao=;
 b=nixV1yiUHBK8IJ2MmxRLR2lG/nYQcjaNhB6zQL8Qh5dfXuIm5FowMybSrVwDsG8shy08a0HWE0NIcXpVCJMewz104l802XkowcGBSnu0GQOE8zUZg2ziwNMiS5mAAxL+vMNAVpqW1OIo5Xpy5gv0jlX62BdqgJpIvty2d/HC2tM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7784.eurprd04.prod.outlook.com (2603:10a6:20b:2ae::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Mon, 8 Jul
 2024 06:40:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.033; Mon, 8 Jul 2024
 06:40:29 +0000
Message-ID: <b9583c86-b5ed-4642-9baf-2ac850656ee3@nxp.com>
Date: Mon, 8 Jul 2024 14:40:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/10] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller display engine
To: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
References: <20240705090932.1880496-1-victor.liu@nxp.com>
 <20240705090932.1880496-3-victor.liu@nxp.com>
 <cd558335-6e72-46d1-911b-68ccbb211136@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <cd558335-6e72-46d1-911b-68ccbb211136@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG3P274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::32)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: 834212fd-4b00-455b-5150-08dc9f18db66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UmJwWFdZTDVoQWtPd2hyTTVlZ3VYRm1iTi9uSDRTYzlyZVRpZGRoWUozZkVQ?=
 =?utf-8?B?VXRqazgyd1BRdVVVOG1kZExZSW9wRHhJSkpRdWliNDJuV2ZpdmZQbHFXSDJP?=
 =?utf-8?B?WS9COC9yMEVCWFdTODZrOWlheitOODJ4SVFvTnVlTnlnYkhXZE8rTUx0UE5a?=
 =?utf-8?B?OFFTbDM1NEtsTCtqcTVCWXFXVTNKRklMSXFmd3JkK2YweUwrSVVaZDlEalZY?=
 =?utf-8?B?VXVRWjlUd096V0djSmlnY2paRzNCcXRqdStSMWRLM0JnTlY5QkJPRlpwV3Rm?=
 =?utf-8?B?dHYram5DZnZleFphNTB4WmxTOENXNzI3eUgrYWdjR2haVDdVTmY5T2E0UWl5?=
 =?utf-8?B?YUlEdUJkNTJaNytWT0VickIwOHU0RHRxS29oM1ZtZkZtMVE5WmE1STVVSC8w?=
 =?utf-8?B?dERWZUNNcXNST2dRbWlYM2tzbnNDZCtaSkczRXFIRkZXZHp1Wi9NTHBKNlRC?=
 =?utf-8?B?bk9BcDFJSjdiOFFJZDBNQ3ZjOTVVV3kyb1NUR1N6M2hCb3AyUUZOL3BoSEtL?=
 =?utf-8?B?aHk0b2FSUHlHRFBodXNDblR6RmdVUUJFaXdHQ1V0Y2t5MHFNQmhYeGNkcmlI?=
 =?utf-8?B?Z053UWFFUXJsUkhnbSt5TE5KUWltZ0RIeE96V1BOOVRSMDlFRWJGdGZoSE5D?=
 =?utf-8?B?S2h1djhSTnBQWW9mYngweStnckZ4d1N4eEsrRXZBalI0dSs1MXJHN0JndFVM?=
 =?utf-8?B?RkY4cDcxY0tSZ1VpWmdHR3plVHJaajBNUDZna2lJU0JXelFqOXhuSlVVZzdy?=
 =?utf-8?B?THlMOCtFY3JrcjR6bDByMXJ1eTc5TDh5QXBYemZIK1dSQUpCa2ZIU1NJYVlx?=
 =?utf-8?B?UE9RQy93eDFuNlQvSGVGZGd3M0g0OXh0UVk3KzdmbmxVU2hMY3ZpcXlQZFda?=
 =?utf-8?B?a3ozUnk1TzBtVlovRkdjdmFCS042MEdkUm1XdzVmQlVRdjE5cjZyV3IvYVl6?=
 =?utf-8?B?WTVjR3g4Z1N4Lzg0a0UrVG1sbjlEWjdrTEtxQVZ4NUtLTEhtMWNnR2h3dy9o?=
 =?utf-8?B?Y213L1MzU3FHVlY1V1dEbWRpdVhkYzBzUU9tL1FndWdoWGZSdzBXNHVvZldj?=
 =?utf-8?B?UTYyMDdScEx6dXFnMFdEa0xwMExFYTQxZk5DS1dycElDTmwxU0NkT0tJZmxH?=
 =?utf-8?B?OEJNS3pyOVFMbEpXZjZadFBhSFVLd0UyeHg5SGRvR1RTb09ZcmdXQzJQRHVD?=
 =?utf-8?B?bmNWQklkVU04N1JGUzlCeUh3eEJheEpJY1YvMGJpeVJrRHhubmdyZHVPZ0tM?=
 =?utf-8?B?Nm1IeW5jR2ZOOGdLa2VkSG5ZbzM0NmNhamc1YVlJRHBEaCt3aE81cHN2VDNr?=
 =?utf-8?B?L1VNVndhVHlwLytYdWpXVWFHWFRYWG1lSzIrZERra0tKa0N0WE9XNjFXNnc4?=
 =?utf-8?B?ditBdjhNYzhueVBKUHlXcGFFN2VLUFppRkhFSXpDMmRmQUtVOFRIRkFnTno0?=
 =?utf-8?B?WmUwaXRLanFzbnlJdVpHb2Uwa2FsUDQ4bW1IQW1yL2xWaThFUkxWdWl6NjJM?=
 =?utf-8?B?bGN0LzFzMGlrZTJXRVR6a3BPS0NrcVFEMDM5YjZHVGhOVHh1cy9QNENKV2hq?=
 =?utf-8?B?NThvR3NvTWw4Rit5L3hjVUgwQlkvQlg0U3B5UVlkY3kzVkhZM0dERjBBdWxq?=
 =?utf-8?B?dEtEZEJHdUJIRjl5bEhnNjZTanJRRVRLazcwR09Bc2NPY2JJRlpVc01GWW9C?=
 =?utf-8?B?OVFpbW54SFg1ZDkwdnVTRnhSdGlVakJya3RLTWRERzdtMzBWZnBlSGEvR05m?=
 =?utf-8?Q?YUKN60gdhRyXWZGbac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3JKbCsyYmVETGRESnNKbS9JQWJCSUNCeCszN1p6YUhPMnBoQ1pWMDFDNWVM?=
 =?utf-8?B?ZDl5c1FQKzJ2YWtlYXdJYkg3ZW5ZNUl3T1c1MXR4M1RueVF5VmhqTXhkMXBL?=
 =?utf-8?B?YjRoS1h5M0RSUXVCRWtCcDF3SEl1QXNsRXFRSlNRclhpZ0MzNlJ3bGdNOVBS?=
 =?utf-8?B?Q2FBVlpJeHBCcjllWHdYd2cvc3orZVpaOWF5NWhQOG5vbGxSM3MxS0FPUExn?=
 =?utf-8?B?TTVobDM5ajYwdFJENVZTbTNQU2JrYjc1ZzdsL3lFb3ZVdzhIRzUzTHFMSXVl?=
 =?utf-8?B?SmJ4a1hTTGU1QWVZUUhYUmhQSXZnSHFwZ1o4V2xzN09KbWQ4N2p6dmhqZFI4?=
 =?utf-8?B?bmJNK1BPRHJZejFjRUtvdVpWK1k1RkJsR0hVdlhxTENuemIxUUlYdU4wMms3?=
 =?utf-8?B?RXAzbEgrVHlOdHVNMEpFZGx3YW1peWNSZkZSQUlUN2J0ZHdORTg4UmNxaHEw?=
 =?utf-8?B?MUJDb2dxdFJScURPRjRkYm8yaTk1djNPWUFBcTArL21CMWVORHdZUURoTktC?=
 =?utf-8?B?VkhwSmFGQjI1MVNXRjkwc25FZlFqQUxLSEMzSUg3cEpKNTNrcHdyZ1Y4ZnRK?=
 =?utf-8?B?SFlOQXE1bGs3NjdhQlZlNGZGY3BGY2JCTkl5Q3ZYSmVhZjg3T0tuZitoSDB0?=
 =?utf-8?B?RWZUbHVDYnJreHpoWlE4NjJuZzlKaDZ0eWtvS2RXbFpoWjdjMTh0UlpLUlBR?=
 =?utf-8?B?Q3dScGc2OEVTT0h6azZuR0tHNWlNUTlBb1p3L1dNRXAxbFZCVERXcDdiVEZJ?=
 =?utf-8?B?bkYrSG90cU5ndm1GQU5XNVp6cDRVR2s2VEF5blpoR0Z6VFgwL2ErelFYbGVo?=
 =?utf-8?B?M1NhY09DTUZvRFBVK0FESWUvZkxtNWh0OGMzeFlmQVVKRndpVGNQcFZBWmpM?=
 =?utf-8?B?cTBBLzd6UEhtQU92N2hTNUpPSDFaT042M1paMGVNT1hURWxLeVlyYzFPR0Fp?=
 =?utf-8?B?ZzNyUm1hNndyMzRrTGp1TUVIRk5qd1NqdnYxdmd0cXBHdmgzSEgxYTd4NnR3?=
 =?utf-8?B?NVRVcUlqR09nb2dtRjRLTnZVL0hGOTZ6L3JCS2ZiTmI5R1BHNkc3VTVSajRw?=
 =?utf-8?B?Umw1djNpUllnSUllVWMwQkt2T2cvVmhqNGRZakx5LzNFTnFwRFpPeEduMW83?=
 =?utf-8?B?S0x1L0NnTVBFc2NmSFBJSGNFODR3NkVXNWp5T3VxM29SNjhGY1k4RmpUN3Vq?=
 =?utf-8?B?Y1doNWQ5WlZZYS9ab1F2aWNOOTRKdUk4WWNNK0RqdTgyK3NUWldZV1pXaXdG?=
 =?utf-8?B?V2cyRmxNV1pJaFppVjlxdEsrSzNFNlozSlo2dWU4djJwb1BGbHBuZmc1UkRN?=
 =?utf-8?B?bVluNjljU3RKenlhejQ5YUpWQ1ZoWmVzWlVKOVMvM2hNcUVJUTcxUzFlY3Q2?=
 =?utf-8?B?bHIyUkdFVnd3M29ib1FOS284aWJhazNpUVV2RS96OXpFcGhoc0F0ZWJWTlBS?=
 =?utf-8?B?aVJ4TUlSSWxTU2YwcFRWY2QyWmQzT2FPRCswaFozWm5lU3NrMUNoRHZCV1hZ?=
 =?utf-8?B?VjFNYThodzJlQjFKeDJ2Tkg0c0pWM3RuQzY4MXY2bmlNQnZqV0xkaFVBZFlk?=
 =?utf-8?B?T1pKQzJrYnBxMzA3L0Z0bHdibWFJcTBxeTZDT0JvTUN1TjBHaU5odEdlZDBv?=
 =?utf-8?B?ZVVkNVRINzluRTdROFI3QWc3djFZN1ZYRFNEREFPUzFPcjlCMUxWamtrYXo0?=
 =?utf-8?B?cWIvSWxoSFpLaFNweWdTMmlJSUZTS0I2VU1TZS9oOHY0eUkwYmdmUlVWaU5P?=
 =?utf-8?B?aWYyUlZFRm9yUFJoU29NY0NxYklhSW9oYmYxMVUyMHYrQWgzTHkzcEZtdmFC?=
 =?utf-8?B?SmU5SGgwOUwvblNncmhIdEpRY04zMVhJL3BVdDQxbm1OaEVUQytSQm5tUkdq?=
 =?utf-8?B?WnFWOGl4WS9kTTdHd3Znam42K3dnT0xsa2pYNzFPcjRkcW94VDdBeGpPRUUy?=
 =?utf-8?B?aFJkSjQ5T3kxeTUwMDE0enRtM3YzS1NpR3Y2UUxEWldNVTh3OXFwZ2ZialFL?=
 =?utf-8?B?VC9CRzMxVERqV2pleXhaaHdIcXE0R3JYSGo2dzdLMlp4UzlQaEJpNTVqdTRi?=
 =?utf-8?B?b1lTZU1VUG1FM1pKMGZYYkszY1FGeTJIbTN5Y2NHcXJFTjZSZ1JmaTJtTHU0?=
 =?utf-8?Q?QaKGi4TOLl61JITPZR+xO7zsj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 834212fd-4b00-455b-5150-08dc9f18db66
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2024 06:40:28.9759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mHl2zaNV2qDRfWBNN/DQ0Hvn7JpcL/3e/bHdOUtq3y71Anr7DtlLi1aIMNh5I7pbVj5SQuXd6StXJae3VRiOCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7784
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
>> i.MX8qxp Display Controller display engine consists of all processing units
>> that operate in a display clock domain.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  .../imx/fsl,imx8qxp-dc-display-engine.yaml    | 166 ++++++++++++++++++
>>  1 file changed, 166 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
>> new file mode 100644
>> index 000000000000..dc9579897b76
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dc-display-engine.yaml
>> @@ -0,0 +1,166 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dc-display-engine.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Freescale i.MX8qxp Display Controller Display Engine
>> +
>> +description:
>> +  All Processing Units that operate in a display clock domain. Pixel pipeline
>> +  is driven by a video timing and cannot be stalled. Implements all display
>> +  specific processing.
>> +
>> +maintainers:
>> +  - Liu Ying <victor.liu@nxp.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: fsl,imx8qxp-dc-display-engine
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  reg-names:
>> +    items:
>> +      - const: top
>> +      - const: cfg
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 3
>> +
>> +  interrupt-names:
>> +    items:
>> +      - const: shdload
>> +      - const: framecomplete
>> +      - const: seqcomplete
>> +
>> +  power-domains:
>> +    maxItems: 1
>> +
>> +  "#address-cells":
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +  fsl,dc-de-id:
>> +    description: Display Engine instance number
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    enum: [0, 1]
> 
> No, drop. For the same reason as earlier patch.

Call of_alias_get_id() from the driver instead?

> 
>> +
>> +  port:
>> +    $ref: /schemas/graph.yaml#/properties/port
>> +    description: video output
> 
> Eh, mixing children with and without addresses is considered poor design.

Will move this to the tcon child node as it is the
last processing unit in the display engine.

> 
>> +
>> +patternProperties:
>> +  "^dither@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        const: fsl,imx8qxp-dc-dither
>> +
>> +  "^framegen@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +
>> +    properties:
>> +      compatible:
>> +        const: fsl,imx8qxp-dc-framegen
>> +
>> +  "^gammacor@[0-9a-f]+$":
> 
> This looks like you are organizing bindings per your driver architecture.

As I mentioned in cover letter, this series addresses Maxime's
comment for the previous series - split the display controller
into multiple internal devices.  Maxime insisted on doing this.

> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Liu Ying

