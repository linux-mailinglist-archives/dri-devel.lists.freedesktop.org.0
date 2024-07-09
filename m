Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4891C92B0CC
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 09:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE6BF10E320;
	Tue,  9 Jul 2024 07:05:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="M25yADNs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2051.outbound.protection.outlook.com [40.107.249.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ABD210E320
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 07:05:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxIPpzI9Y/5QxQsruvcPIg3/Nn2GJtkIHphMfQLLP749hmAEPd+gx0a6l9+sggByXeVJl2pp+uAOtEe6aQJWaGSb3akOUkhaM4IkKAEyAZIEOsarP8YielW+vmgrWEkmmZbSZ5IF9WNrWt/3SusoE4Zo7Y9/ciSan4RdfB+eiOXanSDoDrO97Nd4s6sNJKNVS2TG8ikQEjHwipFABeM9zCf3Je9CFgoVCDng+yBwET9FQz7PWTLGxFb2M2SkfwP93jmqspJN/A1XDUAPtEufanPW+8n0jGAi4N+BdC2VlG0CeHQv3kRfWPATXOaBE30ySttDhKFREvuhK6qJnvfXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0JCwKofSyv3w7kapUF9orbxrrO0uWwE2nQvdOOLneI=;
 b=PY5n0iPwcyClUMkMNcuWz52uYflfSe6NIxsn/DeVQtrR9N53J/IZRGaU5Frg+CMoxdPiiyve32vKTRWRhdVw/xPBwyz6+nB/PoZ+rqJDMd0pwmF7QLPIz1/zr8SWjmQlQE/KV/wlHsGGAGyFhl6x7YUB7N+pePbwB6nTjwIex44iwCoxSPfSfHbXSjnsws3wFmmF8rfZnF+GGTd18oHvEZdbo08CrmqnECMVW3YfSxaOWWI0u18PLd6moDkbQQ7nVYtT2+JFZ99+S3TinwbNR35WyHwsQ3JUn/qRKl2x+AiJzExHr1B/BoLNV3aSWe6oruDrPuC+xC1eDoDDJKqK+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0JCwKofSyv3w7kapUF9orbxrrO0uWwE2nQvdOOLneI=;
 b=M25yADNss0pdq2GuPp8iYhawoHNmCArKItRMlcppUCZXDa19ooYPHh7OHk9X/KT94ipPi6VLZhBXmU6gLkFf4VJKymtudYjqS3LYM9/s5VDF8ZMhlNAGf6/u1GaU63VYWowk8RmoUgr1z0bo8EPxnjm/qXuCHIoSSaPMB2hHawU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9108.eurprd04.prod.outlook.com (2603:10a6:102:22b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 07:05:29 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 07:05:29 +0000
Message-ID: <7f5a40ec-4cac-4efc-8825-f879a7bd974f@nxp.com>
Date: Tue, 9 Jul 2024 15:05:52 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/10] dt-bindings: interrupt-controller: Add i.MX8qxp
 Display Controller interrupt controller
To: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
References: <20240705090932.1880496-1-victor.liu@nxp.com>
 <20240705090932.1880496-5-victor.liu@nxp.com>
 <b0cbd659-21b8-4049-8882-f49275d4a247@kernel.org>
 <31301581-a710-4e25-a079-e017686c52ec@nxp.com>
 <3fd67d12-4964-48eb-89cb-482b4a7e769d@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <3fd67d12-4964-48eb-89cb-482b4a7e769d@kernel.org>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb37e07-38cb-489e-ef7e-08dc9fe583d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eERLdGtMVDN4N0k0M085bjV6K2pieGJWSzI4T2RqelI1MlVDaU1CTW1ZUjls?=
 =?utf-8?B?Z0x6eUhvQk15RFgyZTJsNGZ1dnB2TjZ4WGsra1QwK0EvT3Z6QlJsVUVUdURZ?=
 =?utf-8?B?TEJSaExFRk1hdk50YzhSeGhLRVFLN0VtYWgzV0pTTnZTcUVxQ1F2Z1dQWTZs?=
 =?utf-8?B?dWpKRUtsaTFuS2tRdE44c2xxcXZVZHVubGpwSEhwa1ZPbnlSczczK21GcmRW?=
 =?utf-8?B?R0hId2szQmYwV2R4SjkxQStZdWNQTllPR0Y2Z2RNdUtiMUw5ZjdmUCtYYlR3?=
 =?utf-8?B?M1dqVDF3anA1MTAxZ1Q4MUxjcG5iUTdHaW0yN3E0UWlxN08vRXVEUSttSDVY?=
 =?utf-8?B?bExSTThrbThnU1F0eVhzVFpRS1FKV3BpNlBOUTR3QzVuS3FFdXBmOU9KWkpG?=
 =?utf-8?B?czYvdk9WanJ6M2RWWXlJM254T2x4NS9iOXB1V3FWampwN0NzdC9oWWY0MC91?=
 =?utf-8?B?T3d1R1FDd1hOV3o5cGo3OTRxM05yUGg2NEZtWGlESmUvenRGd1BPaGhoeGti?=
 =?utf-8?B?V3BEbmZWRkE0SlB1WVdBVWZUVGlrUkRlcUlJMmtNY3o5QklLY2w2MGsxSCtt?=
 =?utf-8?B?N3NoaWxqa251Q2ZpK1lCdDIyd0RaTkhjL1FvdzdyUThVaGY2ZnNvQ3IzYTd3?=
 =?utf-8?B?akdhUTBzSG1peFFURC8ySExPa0lBbFlsZ013VEsrN3VJVnBPbTNXT25iV1J3?=
 =?utf-8?B?ckpCT1NZSGwrQUg0UjVNUFdTMWpqaTljMGRUOERrZzViQ1RxRG5YbGwwa0M1?=
 =?utf-8?B?OUw4dGd5eDlpVGxueHpaK0t4WDNaTndacVcyMVFnOG41Zy9NQmx1dmNhSVQ4?=
 =?utf-8?B?dTF3bE82MHpjSmx6aUhmcjU1RDVqOHkyckwwcGIyTzF2bkdsVS9ScWFqcmo5?=
 =?utf-8?B?VjNnYURENWpnYmtGSXZmaHdJNnpMZ056MWdoVDAvTTJxU250amM0NVZaNTB1?=
 =?utf-8?B?NVdNellMeGhPYUN4QTJvNnpoL1pZREFiK0kxL0pxKys4UjFFY2lGdEV5bGVo?=
 =?utf-8?B?dUFxM2tHeUNPTDNVblQ4dmF3SzB3eTUwR29PZ3RIZHpNNndSOTFTOU5TZmwz?=
 =?utf-8?B?ZXQxaVMxVTk1Skg3NTZUeVpUU0VCSElHNnU3MGlnSXNXS2RRT3ZrL1I1bC9q?=
 =?utf-8?B?NDlVcnNkcTVPRW1FMmxnT1hhbEN0SEl1QzY4SVJIczNWdDJLK3BMb3FiazhF?=
 =?utf-8?B?ZHBkRGhrK0NOL21DeGo5VjFRdW1WSURNR3lWeTFxMkJnL1QxcHVNaExHZFFk?=
 =?utf-8?B?VVNQMUQ4andXTlY2UmNsWHl2dXVxZDgzaEtNWUNMblIrTHlFL3J5akU4L2Nj?=
 =?utf-8?B?cTFlcitLeFpQVW1ON3Q0eWlSVVgyTC9PdGdvckRxT3pxR0ZpVFQxendRck1E?=
 =?utf-8?B?UDd1R29qOHFCVTc3NWRCRWtzMzlKRGx2bkRGV3ZXVHltYUgydXhFTEhoMWk1?=
 =?utf-8?B?WlR2Z3QwbzBaSEx1b1NQV3UydWFNRnZ5THJXeUhsUCtaQUZScCtxa09sN1Zv?=
 =?utf-8?B?ZXlhMmsxSWhqY3plekg4NU1UL096a3NMTlo5cXVob1NKTy8rNi9LVDcyYUVW?=
 =?utf-8?B?WWw4K2N4TEdBbjZrYldQcGZyMWxmdTVXUFQ1anVXOGdIUHB0cWlLa3JJYlBN?=
 =?utf-8?B?YWxSdllXTG9XUjhiVmIxbk9CQW1Ca1VpTUs4eW92NGVGOTVRdjhZTDg3WjEy?=
 =?utf-8?B?SlZUWnRYL1gva3VjcDVqZFZja1hRSjFVNVdiV1pGL0l6NVRBZkxLa05Xb0gr?=
 =?utf-8?Q?x7uoG2KlANTEQGaRdk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SXl2NDNsbEdwckhuUW5GUk5lTWhkcmZyU2FnRDFXSTZEZXVGMTkzSzRXbW01?=
 =?utf-8?B?SW9USDMyUFczYUhQUFc4eFVIa3VFbURtR3AxdTFrdmorSUZTcWtoZ2l0VnhI?=
 =?utf-8?B?VHo4U0JRQnNjQTVXZGdWLzM2bDdrRzcxMGFJM0tEZWxKZFoyN3hkRmo0M1M1?=
 =?utf-8?B?N3FqTi9XRmZ1VWJ0YjRRUVE1RCs3SXFrUEtqWmlCakFEMTg5aUJuODZqcGhw?=
 =?utf-8?B?VDlMdEdWNUtiR0hRbzlKdVc2QWtGV0hFR0dTYWRMSURIcE1aWEhaL1NPVU0x?=
 =?utf-8?B?cEJnUTl6aGFOczdYVDR5M3pkYXdic0YxWFFpRkgxVHdwUmFzelhRTlI3Q2ZI?=
 =?utf-8?B?cUFUUzdzT1ZaUmE2YitxN3dtVlBubnNOaC9XRlJFeERPNjVITkF2ci9SQUw1?=
 =?utf-8?B?Y0tJNitjVHJENUdmdW5xbWJ0cDhqZ25nRzlkZm1pVGFpSEZ6cDhsYUUrdU5W?=
 =?utf-8?B?MzlGTGxaV3YvQVdGbnd3eXR6L0c0VEVOczZGeTBCRFh2Rjl3TVo0aVlWeGRx?=
 =?utf-8?B?WWxDeTM1eUhCYlpMYTZnRm16SFhPdVpKNTdOeGZaVE9YOHdkU3g5T3dDQzVQ?=
 =?utf-8?B?NzdQVlE1UlNsTk9SZXpiRmZzUUJ2WStqVnEyQ2tsM21wN2NLM1duSE56clRa?=
 =?utf-8?B?Qzhnbnh5bXRmMStVUm0wQkVKS2ROZ25jVzRXUHhJbW1FakNla1lFa280MWdj?=
 =?utf-8?B?WDNGRWJ0eEtaM1QvSjVFRXYxeWdVbkpqVGdMaHJ0OUJmVllnaWlxUWs4VWlB?=
 =?utf-8?B?WmtzS00veDJkY3c0ZklETHJFR1JZbDRzMTR6K2FUSlNPRGhwOVRTV09Ua2dr?=
 =?utf-8?B?dnI0aVRJcld3WGJMeXhwYTVRdGZKcFA1Y2RPRWhBbjhMeU91R1YvVyt4MGlT?=
 =?utf-8?B?RmZnMG14ODJMWjZsZVlZa3dqb25ST3djeG1ubjAvYjZrR1R6Y1Z2Y2JjUHhq?=
 =?utf-8?B?WkxYK2FncmszMzhhMnFsbVZ1WlpLU3BoSTBMaGdOQlFEUTJjY095cFExVGNi?=
 =?utf-8?B?Q1h2cXZITHZvQ0tyVFZvaTdRa3YxaW5uQ1NyeG83czgyTEN5dzZuT1N5Smsz?=
 =?utf-8?B?bUFhTDlHcHZFYmVlVFVGTTJwZERFa05yRmtGQ1Y3dHlNYzNiOThWUXI4eHNY?=
 =?utf-8?B?T09MbjBISENQNWV5UUZUYnBHc29sS1lYT0hEaDRIUE0xTXVqMFozSXdUMHgz?=
 =?utf-8?B?dHpzZDBTUWlHZUIxOUpuaGI4bnhOZllObWlBSkJuNWk0cXFQYXp5b0xZVGp1?=
 =?utf-8?B?UWJaV2VVVDBpSzB3aDY5aGNTL2Y2YlpPTDY5UlA1bVZvaGxtVWdpVzdETVo2?=
 =?utf-8?B?ZzFOcWROYUlRbFJkWWMyWHphcDlGSWFUdTRNYXl0TDB4eE01VFlKdldJamxz?=
 =?utf-8?B?dURtZ3A2MUFXbFZuQXIxdlZaRE5HNVFCUUlvSkplQkhaTjVpb2hmRzIwTWls?=
 =?utf-8?B?SUJIOUVNWUZSUjV0bVpwTHNvUHdiRmJvK2JHZUJhVHA2aE5lR3Y2R0xoY1k1?=
 =?utf-8?B?cjZDZm8xa3BmNW1HNFJ0Q3lvcHRuOWxWbE5QZzRWZmxPYWRWVGwyejU1dTVp?=
 =?utf-8?B?NGU5THE3M0FnWXFnRlU5OTRCdHhod2Y2Q0J1Mm1zRUZudHFFaFVwK2tHK3Uz?=
 =?utf-8?B?QUF5ZkpGV2kxK05laERBbTVIVStIWUFMZUVpT3czZUxRY2dIdEVCWWZyQlFZ?=
 =?utf-8?B?L3FLMGFXeG0xQmhoWVBpb0lxMlYwQWgzMDQ3MFZaM2xseXlvN2NWMXFNVmZt?=
 =?utf-8?B?OU1JL1ZiVmhHSHBMWUI3UUtEcmpIK3hLZnFpTTE0NmVGOWgzbWxzeXRUaGpz?=
 =?utf-8?B?dUsrZHZZbVRmRzdObVhwS0Fuc1lPTzk2VEgzS084bUdjQklZMUlhNkErSjdr?=
 =?utf-8?B?THVzQXpSMGZ6b2ZhbllZc1N1U3VMSHFVZ0NncDhVbDNXeFlRV3FVY0luTGdn?=
 =?utf-8?B?MGJXVk5DMjUwU1gyVzRUQUVCbVhPc2dqdUVCbkdOdHNVN3QydFNkaWo4ZW9N?=
 =?utf-8?B?dm1HcmpVdE5WM2o4dGFzcG1zOTg5MXVHN1FSM1c3ait1OUFSalVyWWROMUlT?=
 =?utf-8?B?TFFzMW1xcWRFdGhGNG1ic2RQeWtFTlpYNnFPSzFwTEx5c3VxNi82M1d1ak84?=
 =?utf-8?Q?qd/VhKLiwQxfJjKIGd5X+1Sde?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb37e07-38cb-489e-ef7e-08dc9fe583d3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 07:05:29.0952 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TvBmECXrH+0E1aXlCjr83tSpUhrs7LTu6F+dg33XGb2/wZLsF2xcB3YIYNnwmkEIT2onOru7SUVlLnEjdpTL5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9108
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

On 07/08/2024, Krzysztof Kozlowski wrote:
> On 08/07/2024 08:51, Liu Ying wrote:
>> On 07/07/2024, Krzysztof Kozlowski wrote:
>>> On 05/07/2024 11:09, Liu Ying wrote:
>>>> i.MX8qxp Display Controller has a built-in interrupt controller to support
>>>> Enable/Status/Preset/Clear interrupt bit.
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>>  .../fsl,imx8qxp-dc-intc.yaml                  | 321 ++++++++++++++++++
>>>>  1 file changed, 321 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
>>>> new file mode 100644
>>>> index 000000000000..3d0d11def505
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,imx8qxp-dc-intc.yaml
>>>> @@ -0,0 +1,321 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/interrupt-controller/fsl,imx8qxp-dc-intc.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Freescale i.MX8qxp Display Controller interrupt controller
>>>> +
>>>> +description: |
>>>> +  The Display Controller has a built-in interrupt controller with the following
>>>> +  features for all relevant HW events:
>>>> +
>>>> +  * Enable bit (mask)
>>>> +  * Status bit (set by an HW event)
>>>> +  * Preset bit (can be used by SW to set status)
>>>> +  * Clear bit (used by SW to reset the status)
>>>
>>> 1. Why this is split from the main node?
>>
>> Maxime suggested to do so:
>>
>> "
>> But at least the CRTC and the interrupt controller should be split away,
>> or explained and detailed far better than "well it's just convenient".
>> "
>>
>> https://lore.kernel.org/lkml/2k3cc3yfwqlpquxrdmzmaafz55b3lnqomzxjsvtetfriliqj3k@tv6uh7dzc2ea/
>>
>>>
>>> 2. Who can use this interrupt controller? Children of your display unit?
>>
>> Yes, only devices in the main display controller use it.
>>
>>> Then it is not really a separate device, is it?
>>
>> Er, per Maxime, it is a separate device.
> 
> It's not for me, especially considering small register region used here.

Maxime, can you please chime in to discuss whether the interrupt controller
is a separate device?

Maybe register region size doesn't matter.

> 
> Srsly, with that claim, some I2C device like PMIC also has a separate
> interrupt controller, because interrupts are in separate few registers
> (e.g. status, mask and ack).
> 
> Can any of the children interrupts be routed differently?

No, I don't think they can.

> 
> Post entire, complete DTS for review.

Will do that in v2.

> 
> Best regards,
> Krzysztof
> 
> 

-- 
Regards,
Liu Ying

