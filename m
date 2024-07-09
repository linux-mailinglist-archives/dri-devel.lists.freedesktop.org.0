Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618CF92B13F
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 09:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FE610E0CE;
	Tue,  9 Jul 2024 07:35:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="LKCS7x6F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010045.outbound.protection.outlook.com [52.101.69.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC91B10E32A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 07:35:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=luYT6m9hlo/L2R2WugLaUGn55x1YkowjhpgzXyENeX1+BJmkMzQkEwNNEnhqXRjnh9zX84pVARTrl19A4nnRMm0976eezXHGbEaCSUsTp5E2kGv6+aNOsjrJyn07vu7ohH3lcUxVAvaZY27dAcwWaGjFGzDXnfaIslQmqbEgm/TO/UHbLT+gNNcUW32r14fzaXPGU6nIMIn/wFjYvOdrVuVXDb9OzicpTH5QQG+6c/Oo+6tmvziKmRcOstjL5Qy3oSXhw5n+U/C2sq5/ErfUjKl/4s6LprsNc7f/jyefqdLksIEBbobpsepCjrpbsMGXAtmbFweUKUeODcgdhFUQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj6gpVjI+HDfGKnqfiwnAphyOBtXwv+qW1XuOitXKBA=;
 b=E139R2FN6oiVlIPc+EgkYb4yJfJEu3D1B1Z8OVQR5bTCxUEc338PZAGxrGW17YlB+F+EOaCrFJVMxsICa9Xd+aVugD8P8/7UYp2cQ5g18yGZ7PuHtkPc9BjrHVpaquq3chCbmExWOKnHY5m8Wt6nV7hjNiAPM3QTxcGc8jD1TFL3aVSKF4O8NZzkAFlbt4a+L0YKtTHV/WUof8oC9idOVAo5zBCJRZC6kU70OmTwOhu0ZdevphRijg7rOfBNlYqaCYJw1PlfHP3H3bGhgZABZnvXTuKd6dOOGyhyo4I++49EE27N6r4LS5GsfqcHqjEdXiXcZ8xJYTSzCS3wGWtwCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj6gpVjI+HDfGKnqfiwnAphyOBtXwv+qW1XuOitXKBA=;
 b=LKCS7x6FN+gpZobcUY/RjkXSgDx/TEyGuZ2lo2UkGXzeLeE71sdYTld/v/Tl5t8htVNa3WRymnbMQDb6UCGlRKAs4DZ43zmGb0nOe3LiNhWols7aQpMoMppKkmgdnXcFI3gE9XCLyWqKu8X9Y8hHWW5t7Zl5TFkpn0w83Knhw7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9794.eurprd04.prod.outlook.com (2603:10a6:10:4e0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 07:35:40 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%2]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 07:35:40 +0000
Message-ID: <0eacd62e-40ff-476d-9f6b-d0db2aca4108@nxp.com>
Date: Tue, 9 Jul 2024 15:36:04 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] dt-bindings: display: imx: Add some i.MX8qxp
 Display Controller processing units
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 tglx@linutronix.de
References: <20240705090932.1880496-1-victor.liu@nxp.com>
 <20240705090932.1880496-2-victor.liu@nxp.com>
 <eec3d2a7-0197-4196-bf6f-71d0e29777de@kernel.org>
 <9a911f88-7fbf-4484-997c-98b6c3ec045b@nxp.com>
 <20240708200431.GA3492466-robh@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20240708200431.GA3492466-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR02CA0104.apcprd02.prod.outlook.com
 (2603:1096:4:92::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9794:EE_
X-MS-Office365-Filtering-Correlation-Id: 373e05a7-c671-47e2-a672-08dc9fe9bbbb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2hsY0tWMkRjUk82Vmg0YVNidWVmTEJJNjh6MGVWdzd1eUdzbXVqa3dqdUhk?=
 =?utf-8?B?WDcrRGFJOURWeDB6VlFuZ1YyZmxHMkt3a1plWGV5WFNoMk9KaUZQTjJyelFx?=
 =?utf-8?B?MkZoU1NPY0Q5WklpRU9XWHBaUkR3TU9WTSsvME41dHZpTGNIN0RZTEhZdy95?=
 =?utf-8?B?VmlJT1pQWUo1akdqTHNsQ01QQis3Z0JwNXZCdit5VTU3RnhndEdMRXZJc0dE?=
 =?utf-8?B?Zkl2cFFRSGdlTG5HMkdBdGErZDYvMFNOcGx4YURKR2ZCQXI1K3JqMU9YR1NL?=
 =?utf-8?B?R0hrYVBoNmFick41aEZIYk5pbko1cXZtdlhvNEpxVlZNbDRoUmtnS3JFdGh6?=
 =?utf-8?B?VXN6a2JUeGtYL3lOQ0tQUzlSVzV3bWxXVHAyUnVTRVdnWXd3SVNpZlFrM21X?=
 =?utf-8?B?WExEeEhzWHpmbmdIQkhOd0d2cFNxQTV4bkwrREdOT1RYNVdDdytzYlFQUWJX?=
 =?utf-8?B?ZmhmcmNiTlRlZGVIMDJBVTRNajkrSlFickJacVM4VXYrQWRFeUpaa1c0RUk0?=
 =?utf-8?B?S1czZldRWnMzK25qS3llaGFDZllDMzgxdFA1OVlwcFpzblVPWFBYZjd2ZFFs?=
 =?utf-8?B?UW5rV3RyZ1gybm1FWXJibTZjbVFZNm94YkdUTDNEMnRHL2dDZVd6Um9VMUZy?=
 =?utf-8?B?TU0rN0RWVko3UHpyQm5ydldSa21RMlBwMDB6anRXbWgzVU1TUjVRR1lVdTFX?=
 =?utf-8?B?YzJoMURGRW1YWDdiaXZoVFNoUThVaHZRRVh0WkYreHNKdm1UUVhFSVF1c21F?=
 =?utf-8?B?VjJQdVAyWTU0cFNsSk9UTWwzQlNRbURzOWZiSi8zOG1SWUFKSnpoTHlMU2Vz?=
 =?utf-8?B?dm9NTlBiU0NSeFkrVFhkbHFxYTVaczY3eXBUcTRMQjVTVkFLMlI3anpSeGdu?=
 =?utf-8?B?V0x6YlNtYkhwc1lPNko5dGpackZqNEp2YnJ2eVg1T2E2MGFrR3VWaVorVmRR?=
 =?utf-8?B?Z1NMU3RGVS9uZTFxN3lleFlYVCtlV3llZGluMlBLNURERkQ2VkN4Q1loK2Zh?=
 =?utf-8?B?OVFPN1k3cFRlRmxCS2k2MjI0bUJUcUQvUFNiWjdCS3hNNWNEcFFFZ1p6YkdM?=
 =?utf-8?B?T1JzUVJVRmpYcC9ZbURtRmREb0FlVjJyVDM2RnZEMzdrN28ydzlZRUl3WnZm?=
 =?utf-8?B?TmFQYzgvSDNBSldha1NMRkRqdkgyVFNZU0ZDNXVQMjQ2Y3ExU0VhWEFVNi9J?=
 =?utf-8?B?V21GQjUwaHg1akNTckRBeDJUMERNL2VLL1luUDA0YndZcE1PNE4wZXVRaDZU?=
 =?utf-8?B?Tkp5ZXdMT2xIUWo2M3lTUVlPckF3Z3JFL1I3bFlzNWsxUWIwa1hFcmxYa2JK?=
 =?utf-8?B?YWpNZVo1amVVb0E4SXMrajhidmtUbmpqLzlPakNVb1I0eUMyenVLY2hONjFK?=
 =?utf-8?B?eXpkS0xld0xxK0kzT3l4RUlmYm9SYlk5WXFRYWhnOGIvT3l5Z0xaNnlxU1dJ?=
 =?utf-8?B?TWZtZmtXME9GdXlQSmZPb0JVNFFhMDIreFh3RzlGWUF6RXZJcDM5a0MwSUUv?=
 =?utf-8?B?N0VsZ0dWNysySU90bklBQlpoTTIrbWtVUjQvZURWREs1YlN0aE9WT015Z1g3?=
 =?utf-8?B?Uy9xSzdlUzhYL092U3hSbGRYUkdBRUdvMWdnWUtjQjMrWExKdm9NNnQ5Q2ZG?=
 =?utf-8?B?L1MvUmd1VGdRYURkek1naGtpdXB5aUVqSVR3eVlsR3ZsSXc3Tk55YUdZc0tX?=
 =?utf-8?B?TU9lbjErdGUxcS9ic3lvV3JtQlUrZTVDeWl3OEhuNkV4cjlQZHRkbEtFdCtG?=
 =?utf-8?Q?IvkuKob8TcQMTsOnIU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGhxeDN6bExuUzl3S0Zaekt6T2tyNk5BajN6T2NNR09leU5kVUNVUzgxRGRG?=
 =?utf-8?B?RmlvZmFqM0U1NHVVaXhFMDV0VnRhY2NMVldSNmphcHR3MFFvYmZHUmVzUEpC?=
 =?utf-8?B?Z1VhUTVBbVdTQWxFYXdtaDd6T2JabU5ZdTRUWEQrWGJZL21kK0FkaEwwMWZJ?=
 =?utf-8?B?ME9rWGw1bnVYOTY2dlhWYVhLOFNFY2NpMkRxcldyN2lJMjBZeWxPU2dJZlRK?=
 =?utf-8?B?Q3YrazkxaGY1RWYzWmN1NzlHcGR2TkhkZ2JBeVhxUE5SZi9ydlBIVm1HcWZt?=
 =?utf-8?B?dHNOUWVvRzdoZlhzRGhicDZEQ09CckxTUnpTVkkyNWFhZmdWWXc5YzJoeGtm?=
 =?utf-8?B?c3QxbUtkOXhRV3owd2wzR0J0S0ZSQ2ZsSTNoUzU5cENBQ3MrUDRjSHBjTmho?=
 =?utf-8?B?YlY2NExZMjY1K3oxd3RGVjhZME5tL2tRUnZuTWRQRVlnOVpOUlYrY3kyNGRH?=
 =?utf-8?B?S0syU1ZXQThmazM3d2FnOUtlYm9TaktGYnhNRTVmOXFVUFJocXgxaUlzQnY1?=
 =?utf-8?B?N3Q5ejNZYjRVcGpSYjJtK3Npemk2L1JpNzROQXA5cDFGalc0MUdOdWRCeWk2?=
 =?utf-8?B?ZENOa1hrbXA5bHo1dmNKOERIOU12QlhOcDluc0RvdDVJVDIxUVFaU0s0cTJ0?=
 =?utf-8?B?VWUxMHdUNUpsRDd6dlFsdUpvalFEVStsNCtiTjg3TlZuWnMrWTRqUCtiUitD?=
 =?utf-8?B?N21hWVFtVjAyTWEvaldCMk1RL0o0ZVhKekppNExLWFMxbHZxM29LcWVHZkdY?=
 =?utf-8?B?dFhiR0FpTVhDdUJOU2h0K2lrR1EwdGtMRlcxelg2NnZWZXVPZFI3aDdqTlAx?=
 =?utf-8?B?SmYrQmoyQUJJZENudnZBRUtkVGNYNDl6R1Q0ZnJibkRiZmtSaUZhZHY1ekJW?=
 =?utf-8?B?b2FLZWczd1loOHQxeTczL0I1R1FGNU1QSUFUbHBtNkhncC94V2NZS3ZCL0Fi?=
 =?utf-8?B?QWR0M2Q1ekhPaDhmZDdVMi9YYWlIN1pDVE8xejI1SHpHSzlkcHBlNzRiOHlP?=
 =?utf-8?B?WDdSNm4yR0R0ZXVjNkNOelBybVkyNW15TVZxcnhqUVVYRzN2QXFsZGlTMVY3?=
 =?utf-8?B?RkhxRFpHeDNSTWd1K1ZQekxnTUxmQm1Qd2dHYVFRcWRhbnd3Y3NMYU00WWcw?=
 =?utf-8?B?NDc1Q3ZGcGNhNHlYdGhEd0dLUWZMREY1NEFYNFZSYU0xYVVwRW9VVDJsUXBq?=
 =?utf-8?B?RXBZR0VzVWtQU3hHaE82elZ3YWxJMDkzRjQ5YlFtbXhoZEJpYmdKeWNSRDhV?=
 =?utf-8?B?bDRYS3pjOXoyanh6OUlXbjhaN0ZkQjd4VmFxUjgxbTNkYTZaNzhsTi84RGUx?=
 =?utf-8?B?SDZNR0hQQ1V5b3Z4dXJrek5FNzFCZTJvbWZlUGhIQlBpb25mbHh1bW5jWis5?=
 =?utf-8?B?L1g4OWJFVEQ4QWYvdUs1TVp1bFFnVlpLSkhSTUs5SlNwVjQrM1ovOG9QV1VH?=
 =?utf-8?B?TzNEUWRaRDNOT3ZBOEJiZlczRStnYjJZaFZFU0JQVnVmYWNrYnJqN1A3eWs4?=
 =?utf-8?B?eUliN1lmc0hTaHoyTlpjdStTT2pIbHpvOGF3N1pLenhuNmRyRFV2ZzB5T3V5?=
 =?utf-8?B?RDBLMkFwWDZxQXhsQnFiOWFZb0E0ZHNHR3lJYVpjVS9taHBhL0JFckJ5a2hJ?=
 =?utf-8?B?R3dNUnlSVlNnSkdsSjd2ZnVydFgrUnNJVGZsaUdZdVBxUllLelhMV3lGTU1j?=
 =?utf-8?B?RjZ2aFYvL1RtRVBCZGRyaTZMVHljdUNOVkliMThuZk95dzVKQnlKbzBoczRN?=
 =?utf-8?B?VHpoYmN4a0lPYUdNNTN4VTZsMVNZMFR2Tmh6aFhFT25WU1h2aEVoVzdqS3U3?=
 =?utf-8?B?eHU1by9HTVlYenJGVGpDc1BtOVZtR3dmZHlUU1JqNmVUNytVQzY2VXl5REEv?=
 =?utf-8?B?RVd1VlYzcU5IbExWeUJYRWtEcFdQT0hIZ3lyd05KYVo3dFZtaWlnS054OUJ4?=
 =?utf-8?B?dm1nTlMxaEpFV1F3ZXl1Ly91QnV2dzJVUTQ4L3phY3RicTdUMnBFTDRmQ0tM?=
 =?utf-8?B?WUVveUNjYmltbVVtSTVtaUhiWTVFeDV4OE1sQWNRZ3prdG9iNFV5cklySmNN?=
 =?utf-8?B?Tm8yakpQdHdoNVpHWGpvWWtMVlcrUWJoMjVqWjFMWkI4OElOWi9TSWxlQzFR?=
 =?utf-8?Q?/DhWL4DcVpCrjJTkNzJTSzets?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 373e05a7-c671-47e2-a672-08dc9fe9bbbb
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 07:35:40.8025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OTTrJTYPJdv4cdMXywm+63OLZpL7NIr2+BVWrOiZiTRLZbnuDCWNKJFWNTJK6MZpqgWgtdjPVJoA5+VTfB0Prw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9794
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

On 07/09/2024, Rob Herring wrote:
> On Mon, Jul 08, 2024 at 02:30:37PM +0800, Liu Ying wrote:
>> On 07/07/2024, Krzysztof Kozlowski wrote:
>>> On 05/07/2024 11:09, Liu Ying wrote:
>>>> Freescale i.MX8qxp Display Controller is implemented as construction set of
>>>> building blocks with unified concept and standardized interfaces.
>>>>
>>>> Document some processing units to support two display outputs.
>>>
>>>
>>>> +maintainers:
>>>> +  - Liu Ying <victor.liu@nxp.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: fsl,imx8qxp-dc-tcon
>>>> +
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  fsl,dc-tc-id:
>>>> +    description: Timing Controller unit instance number
>>>
>>> No instance numbering. This applies to your entire patchset.
>>
>> Then, I'll call of_alias_get_id() from the drivers to get
>> instance number instead.
> 
> Ideally, no.
> 
>> As i.MX8qm SoC embeds two Display Controllers, the alias
>> stem would contain the Display Controller instance
>> number, like "dc0-tcon" and "dc1-tcon".  Is this ok?
> 
> The format of aliases is fooN, so no. Aliases should also be generic 
> rather than vendor specific.
> 
> If you need to describe the connection of components in the display 
> pipeline, then use the graph binding.

I mentioned OF graph in the previous patch set discussion.

"
There are 50+ individual DPU internal units and 20+ unit types.
Do you really mean that each unit should be a separate device in
device tree and each unit type should have it's own compatible
string ? 


Almost all units have input/output ports to connect with each other.
Some units have multiple input/output options.
Should we use OF graph ports to tell the connections ?
"

https://lists.infradead.org/pipermail/linux-arm-kernel/2023-August/861811.html

I hope we don't end up using the graph binding, as there are too
many input/output options between processing units in the pixel engine,
e.g.,

"
Selection of the source for the sec input of the layerblend0 module
000000b - Unit layerblend0 input port sec is disabled
010100b - Unit layerblend0 input port sec is connected to output of unit fetchwarp2
010110b - Unit layerblend0 input port sec is connected to output of unit fetchdecode0
011000b - Unit layerblend0 input port sec is connected to output of unit fetchdecode1
011010b - Unit layerblend0 input port sec is connected to output of unit fetchlayer0
011011b - Unit layerblend0 input port sec is connected to output of unit matrix4
011100b - Unit layerblend0 input port sec is connected to output of unit hscaler4
011101b - Unit layerblend0 input port sec is connected to output of unit vscaler4
011110b - Unit layerblend0 input port sec is connected to output of unit matrix5
011111b - Unit layerblend0 input port sec is connected to output of unit hscaler5
100000b - Unit layerblend0 input port sec is connected to output of unit vscaler5

Selection of the source for the prim input of the layerblend0 module
000000b - Unit layerblend0 input port prim is disabled
000000b - Unit layerblend0 input port prim is connected to output of unit constframe1
001010b - Unit layerblend0 input port prim is connected to output of unit blitblend9
001100b - Unit layerblend0 input port prim is connected to output of unit constframe0
001110b - Unit layerblend0 input port prim is connected to output of unit constframe4
010010b - Unit layerblend0 input port prim is connected to output of unit constframe5
011011b - Unit layerblend0 input port prim is connected to output of unit matrix4
011100b - Unit layerblend0 input port prim is connected to output of unit hscaler4
011101b - Unit layerblend0 input port prim is connected to output of unit vscaler4
011110b - Unit layerblend0 input port prim is connected to output of unit matrix5
011111b - Unit layerblend0 input port prim is connected to output of unit hscaler5
100000b - Unit layerblend0 input port prim is connected to output of unit vscaler5
"

Also, Matrix, GammarCor and Dither in the display engine can be bypassed.
Matrix can be put at optional position(1 or 2).  Signature can be tapped
after FrameGen, GammaCor, Matrix or Dither.

FrameGen -> Matrix(1) -> GammaCor -> Maxtrix(2) -> Dither -> TCon

Aside from the alias approach, another idea is to specify the instance
number in compatible string, like "fsl,imx8qxp-dc-constframe5", no?

> 
> Rob

-- 
Regards,
Liu Ying

