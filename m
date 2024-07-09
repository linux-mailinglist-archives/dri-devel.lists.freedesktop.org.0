Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EADB392B08E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 08:50:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D0310E243;
	Tue,  9 Jul 2024 06:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="FUSun+1/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010008.outbound.protection.outlook.com [52.101.69.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E4410E243
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 06:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C/uT6kSE39MXXbY71FfDInRNm2xB11gIM4xkcCSE/GtBirW0MWj9m+HBThl1iWJ9PH6jTt7Q0O2I5Mphw6LXXi5z3j6ZSy/DnUQ3ZM1A9YVNtGaGT44Ro83Mx1ZCrxcFsre6bhw0QfL/oCnX9zhSSlFP2ac9A8zgt9jaUIRgt1GyDh2b4nU1sMT4L+3OXDyyfR7x9oIMSpFf5tt7p/J3kflP1CynAj/eQLlOcEtJLqzMEjVT+M+PT6Qm9ey1naaeTiHibygoWHH28SlztQWg/3nAsJ0oywL+YZ6FpGk9GuJPXUIjQCPPvIESr1Skjkgku7V2cswzgjuyeTgn5iWcAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+57WkL9Dvy+uSzM8g0/XrUpb2J9nbQYCxrYe0y8R7y0=;
 b=Lsmf6292t0xIAjAInlPQf7UkVswI/UnRqQ/bytSIG8g4WVzNuew4kVbAi3BYRqupQ+lqhlgFmeS7xpisaiCbX3/5Ug/lF2ETqvC0RCOuKoZhfGmdx2ngCfObQBQOykJmzUBytDAmQiyZwT3kLJwled1N+8wS+Hf9j9PyA+LdL8mQ/0AZSaBpOTsw61NgQMm8P0EH9lN8BA/oxEa3+5V5fr1I1zA44ExfVr3cd9c1PYdFSq8B2ciwo2oHuXgFtHrzrTn7QtGh3iz1QMj1HHmU+t7IRQJNfZzrUH2Urf8eDlzQx2J1htFDpz4dFTPXtBeQl/GR6gt2ppSlP7CifNe5zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+57WkL9Dvy+uSzM8g0/XrUpb2J9nbQYCxrYe0y8R7y0=;
 b=FUSun+1/waGfX6aJtpBLk0W7X7lMrRtl+G+HfphwLDp5URDUGqOwSdV661AdyLRausQIxQhmPC2QBKpBui2Jw51mXvSFDm5+owXiRf/E87DSd8GBsfCQETYppxgUGIWVVtE+BR68SYp/ea2PIlbLblxmeP69fGpMppz4PChlZy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB8545.eurprd04.prod.outlook.com (2603:10a6:20b:420::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 06:50:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 06:50:20 +0000
Message-ID: <35239800-3d99-46f2-8f9a-8e569128bdb8@nxp.com>
Date: Tue, 9 Jul 2024 14:50:46 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] dt-bindings: display: imx: Add i.MX8qxp Display
 Controller pixel engine
To: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, tglx@linutronix.de
References: <20240705090932.1880496-1-victor.liu@nxp.com>
 <20240705090932.1880496-4-victor.liu@nxp.com>
 <35c70e6c-d4e1-45a0-8c8e-db530fd84aab@kernel.org>
 <ea8a5f78-65a5-4be8-9e15-57351a839f52@nxp.com>
 <d4ad0701-231a-474f-927c-d21d6785f9ff@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <d4ad0701-231a-474f-927c-d21d6785f9ff@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0126.apcprd02.prod.outlook.com
 (2603:1096:4:188::11) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB8545:EE_
X-MS-Office365-Filtering-Correlation-Id: 436adb6f-af20-496d-c5a7-08dc9fe3667d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZzJpdjBPd3Vla1o2TFJnazAvQVFqcCs4Sm95bUtaL1d3TkdjU3VqeGhKbWFT?=
 =?utf-8?B?L0wrL3puSHFObE9XcWo3bzBYWUl2Sy9aU3JyUU8yR2Q2RlVzWUpwZi96UzBi?=
 =?utf-8?B?S3c3MHJCUTd3WHgxZGFuV3lNS2Z6N1NOK09JNkZRK1duRHZQalgvMHhqTFA0?=
 =?utf-8?B?SHlZS2Vrbm82RWNGVVVTL280M0dLVzRGOUpkTTUyVXN5YUpGQk4vMDJGbVdC?=
 =?utf-8?B?ci95VUdHeUcxTFI3dk5qeWNQbVZUYXRNMUZPVjBna2lveS9TZnkvVTM5RE1O?=
 =?utf-8?B?QjExZ3lwQThjd3hJdnFaNGpPSkp1UTFYYUlTRWdDdGNrVmtodnNHdU9vNVhl?=
 =?utf-8?B?ZHJqc2picTUrSFhRQ0xQM21UR0wxMjRZV2JtY0ZKZ2V3SnBqTHRiZFZLYnFw?=
 =?utf-8?B?ZVNJUjBrblBYZmhsUWJIVTFQRXdoVDdobFkwcEJZdVBFaXEyazdKM0RGWXRL?=
 =?utf-8?B?QWhLaTd2UDBEL3JuRWhKQ25keWZydTd4UjIxUERyM2NRMk9kZ1BZVWh6bVZk?=
 =?utf-8?B?dGMxdkcyNXI3Q1VPRWRKcDA4RUlrWGd6MXU0dUlPa3hOTlAxVE1IK0V5cU5p?=
 =?utf-8?B?SGdXMldwUjlaMGZvSkxadkZZVGs3R2JyVmpZQ3ViT2tkWHRuMG1oWXdUWG9E?=
 =?utf-8?B?STlVdUwzZk05bFJZUktwYnYyOFVxbzJ4VjNmbllZUDRpem1OVURiNXU3R2ZE?=
 =?utf-8?B?bm45RXpOT2RZK2JoWHJ3dHlVTTBONzFUdG4yUXQwc2JFc0o2MGE0WFZOd2xv?=
 =?utf-8?B?NWk5N3l1QVN3QVdIMWk5M2h6TnFNdkJ6SFY5RFFReHZqNjZjbUFtRUNrK0tj?=
 =?utf-8?B?Z1FMeitlM2pUR1BWOFpibUlqUXZYT25hL3NCbVphVUtVQzBnSGhuTitnOXoz?=
 =?utf-8?B?czlrSTBBZFlicTZmRTdpV1pkUzFySjBjbFc2YWYzdnQ0ak1INzdSY2VzamRE?=
 =?utf-8?B?UWE5VU9TVHZ5WkRSYU1lMkgweFRuVTJ4QkFLeE5scWsyS0NHbnVxUm9DY2tu?=
 =?utf-8?B?aHhpY3M0NU5vaHc4K2hnbGVIdjJwY29DK3MwOU5kR2dwblhOQ2pMWUN1MTJF?=
 =?utf-8?B?OFRWN1ZJekNrTHBScEp4cUliaVV4empNTWx1UEtHaHRuWm5FWWtlaU1WRnZS?=
 =?utf-8?B?M1pwS0JCdXJKZ0NaTFpOYnlWanRMWU1BY0twSWJtaDZObXJaSGJJZTJUVHBq?=
 =?utf-8?B?S0pIdGlpTzRwQWhudldhRS92eVI2V0FiU1g3N1o5S1Q1TGUzMXRuSGk0ZVlj?=
 =?utf-8?B?eXdTV20ySzNtaUVqWWVyQVEzYVFZbjZNSHVJVmkwSGZPRUZidXRLeHZxSis4?=
 =?utf-8?B?Qi9wbHNzSEVSZFJMcWhZOFJwME5rSjVsSTdPeDJOWmdKbTlxK1ZSZ09ITElx?=
 =?utf-8?B?cjMrZUQxT1lIU3E3OTdvUXN0ZENtbXV6czlPRTh5VGNZYjVDdW9tTHptd25J?=
 =?utf-8?B?RVBrSm5pOG9wb3h2N0FLaFJRalBQTFFOUVIxQzhxSWJQWngvcG14VlBMcU5Y?=
 =?utf-8?B?Q2JSM2liL3p5cFlEQ01ad0FoZ3lCU2k1WExjY2lSMkhFNHczWi9FMDNBWksw?=
 =?utf-8?B?dXNFQzRJWDVKUk1NYURBSW5VZHRnVFZUVEJEUnpCeTFyZStXODNlQjY3MXZJ?=
 =?utf-8?B?V2pONWZ0SmdkWHJUblJxSXViRllBNXNWQWpPKzU3V3B3bVk1VC8yYzlUT21S?=
 =?utf-8?B?ODZqc215a3JmcGJCNVpzRkc0TVk2bDd0eFJiSXVzVXVDR0o2QitJY2NWd0gw?=
 =?utf-8?B?dnFBR29sRFg1aGRWaTNjanRnbUh0S1MraGhqVVBCTmU3bnNWa2N4L1NjbDdn?=
 =?utf-8?B?eDBHTkwwZldUN0lsK2RJQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDB2QUgyR0hmSkREM1A3Qkh2Nm4xRHJBNjZkSUwvREovRE1OMVJxMmlkTi9p?=
 =?utf-8?B?UVhmQlF5WEFDVWcyQzdqcEsxSERWeUszeFczakRkWndRT256VGFlQ0pMQzF1?=
 =?utf-8?B?bnpvUldML2ZTeDJ1YWFTRmFkbkc5RUREcmhISUFLS21kc2RHd2lXa3pBOTZK?=
 =?utf-8?B?ZTZVZkpzVVRZWExxUWdOdVFTOGdhMVEwRU1BdjlBSUx1bnRvdnlZZjh1d2dX?=
 =?utf-8?B?dXllNExaZE5qTENtZjR2aWVjN3V3bjZuYjBKZzd3aEpaZ0J6bDVZcE5oMkkv?=
 =?utf-8?B?SjV5aHBGQzZaZkZXajVEK1FCckV1WFV2c3VsNmQva01PeGt5enkyR3JZdE5n?=
 =?utf-8?B?Y2tUVDA5NkJNcWRKTkpRU0tLbXN0SjRodFcyLzU1MEh4WHI0aXhtSFgzd0Vt?=
 =?utf-8?B?VTVGdzJ4VVBlazJrOEVmU0hoVmJCcUJFdklpM2kyd3psWWMzcERLelEzOUsx?=
 =?utf-8?B?Vkw1Yk8zL0NCNXRnTXptVVFlRExTdlg5RmhqRFBPb1pWaWxibVVna1BZQ1A1?=
 =?utf-8?B?VU1tTGVUdXRVYWY0cFEza2M4ZTlJRFk3ejFzaHJvUkNKMnEzYmhMVHBreUlr?=
 =?utf-8?B?ZXVyNkV2dUhIWDNOS1U3RWxONkJkc21PcFNMZUdPYUsxTWI0b0d4T1J6dDFK?=
 =?utf-8?B?cjVpMWxzaFJ4eTc1cG05S1RoRDRiRzZxSGJjU2FuWjZwQW9lcUZ2d0k5a2dS?=
 =?utf-8?B?VWlJWGhDai9uS01HRXE5Rlc2TzRYSzJ4cEtVNEZyUTUyZ1MvUmVvVUt2RDBF?=
 =?utf-8?B?NzBEY1BzRnJHMWlqNkkzbGIxTmtDd281WmR3aGFrNHY5bWZBdUVudVFJYnZQ?=
 =?utf-8?B?ZXhRYk5EUDEyUWNwUFIyaDRKYXFuMW5GTVhMVWFvdUhnNVVIcGExQTRjbW82?=
 =?utf-8?B?OVJNMGVPMUo3ZFZReGtqSTYvV01INzVrektodG91SU54R1lWdkhkZmkwRWpa?=
 =?utf-8?B?RnV4dFYwc0F0VE5zdytnVSthUWwwU2VzR1NLaDZqK1FTODBqdzlZK3ZJY2kx?=
 =?utf-8?B?RW1MS1J4ZG14MTdURVBnWUdBelNPajdNSy9pMm5URmZGMWtBR2lRRUpBcjBM?=
 =?utf-8?B?Y1RiWUhHOFlwb210RXZvNndSdC9LVWZSNU9SME5TM3dIZ01jVWFBaGQraXAv?=
 =?utf-8?B?eDdlVFBlVXE2VWJjMHdnNjlDRnd2YTVwV3ZrSk5wWGo2UDFDR3Vra0Rrd1Fx?=
 =?utf-8?B?SnZSaENSbnFEUWY1QkJuSXdmRTk3SXdnZG5yVW1MSmNUb0laYWV3UzhnVHVN?=
 =?utf-8?B?Mk5xQ2kyNU51UkgwN01HRithcGtWY1VBV0ZkRXRtc2FEazdPSkVVVUUvK3pS?=
 =?utf-8?B?SU9sZW5wc3NPUEZUSWk5TTJMOW1uNjlUekhGdGZvSktJMFRVZzFydGc0M2xa?=
 =?utf-8?B?cjJFYk91bXE5Ylo2alZxQ05RWC9OSTdTN1B2cU55RjZiYXZIcDB4YWtVQ01K?=
 =?utf-8?B?ODAvSVIyUm4zdEdhZTJlcVVsSVdpb2E2bWpLQlZmTmNCWDJ3UXA4WElDd0Ri?=
 =?utf-8?B?RUNZaHdrZ095THJLemc4andES0hhVm11N2MzVDdtNmovRlVvM0syL1FGSEVq?=
 =?utf-8?B?YWV6K0VjMndYYTc5OEhOc3BPRTNmVTNUZXppUlN5bFdBazZLKzd3cDRQa3pa?=
 =?utf-8?B?SWhTVVRzYmhNbVFGVXdQUHNsTWQ0VHBteStLc2gwQ3RMbHRTaHVsZUQzb0Ny?=
 =?utf-8?B?eFkyTmt2N25zdGVqdUQrYVBmV0RwNUJrYmE2WmZNQ1BWbEQ2cmxZa0IzSEVP?=
 =?utf-8?B?TG5objl6QVY2OTFQeU1PSjVWVnNrdkxYcmJFdnd4MS9BdCsxeDl6OS9TMHIz?=
 =?utf-8?B?M2tCTXZrV3R5OWpRSDVBWlE2dHBkUFBubmJWYzJUczM4N2wwaFFjbTl0NTJ5?=
 =?utf-8?B?SlNqWDJLR1R6N2Z4MEFZOExZMldPdU5jT0dQQm1IR3VYL2JwRGp3bHk4cld6?=
 =?utf-8?B?bFQ4ekRnUFJCd1ZFUGJ5MW50blJoWUVxbVA1NVZKYTBVMTJYQ1d0a2hmVlcy?=
 =?utf-8?B?OXQzUU1YWEJYbDUwVXNSdDhheHRQdlB4WU9iWEsxRVZLQ1gxVnVYVm42b0NH?=
 =?utf-8?B?TVNkY01IemZmN0NmV1UrbjdnMTVldDZjSnNTd0g5c1pmN1o5VlpLVytlcHhp?=
 =?utf-8?Q?oHevGLEGLRXax3VvH802yoxzW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 436adb6f-af20-496d-c5a7-08dc9fe3667d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 06:50:20.8397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jOebVPdD1svNK5Hgh6OofxBYAccyGcVXZwNwTBRXDIBJZ+m/xwJs9Aou/0hWJRII9+lklsW0NxMY3qtoMEaloQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8545
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
> On 08/07/2024 08:47, Liu Ying wrote:
>> On 07/07/2024, Krzysztof Kozlowski wrote:
>>> On 05/07/2024 11:09, Liu Ying wrote:
>>>> i.MX8qxp Display Controller pixel engine consists of all processing units
>>>> that operate in the AXI bus clock domain.  Command sequencer and interrupt
>>>> controller of the Display Controller work with AXI bus clock, but they are
>>>> not in pixel engine.
>>>>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>
>>>
>>>> +
>>>> +        extdst@56180a40 {
>>>> +            compatible = "fsl,imx8qxp-dc-extdst";
>>>> +            reg = <0x56180a40 0x7>, <0x56186000 0x400>;
>>>> +            reg-names = "pec", "cfg";
>>>> +            interrupt-parent = <&dc0_intc>;
>>>> +            interrupts = <12>, <13>, <14>;
>>>> +            interrupt-names = "shdload", "framecomplete", "seqcomplete";
>>>> +            fsl,dc-ed-id = <5>;
>>>> +        };
>>>> +
>>>> +        fetchwarp@56180a60 {
>>>> +            compatible = "fsl,imx8qxp-dc-fetchwarp";
>>>> +            reg = <0x56180a60 0x4>, <0x56186400 0x400>;
>>>
>>> Aha, one word for address range.
>>
>> Sorry, I don't get your idea here.
> 
> How many words are in the first IO address range?
> 
> One.

My bad, the address range should be corrected to
reg = <0x56180a60 0x10>, <0x56186400 0x190>;

Though only 4 words in the first IO address range.

> 
> That is not a separate device.

Each processing unit in pixel engine has two IO address
ranges - "pec" and "cfg".

"pec" stands for Pixel Engine Configuration where pixel
engine related stuff is controlled by 4 registers(4 words
in all) - LockUnlock, LockStatus, Dynamic and Status registers.
The first two provide lock and/or privilege protection to this
address block.  The last two control/report connection from/to
other processing units. 

"cfg" IO address range controls processing unit specific
functions.

As each processing unit has specific functions, it's not
unacceptable to take it as a separate device with it's own
IO address ranges.  However, frankly speaking, I'm ok with
the idea of not splitting the main display controller into
multiple devices, but taking it as one single device.

> 
>>
>>>
>>> Sorry, these are not separate devices.
>>
>> Hmm, again, Maxime suggested to use separate devices.
> 
> To some level you can create separate devices, but for one register?

There are two IO address ranges, so at least a few registers.
Especially, the "cfg" range kind of hints that they could be
taken as separate devices, as it controls specific functions. 

> 
> Best regards,
> Krzysztof
> 
> 

-- 
Regards,
Liu Ying

