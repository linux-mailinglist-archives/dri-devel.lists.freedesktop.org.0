Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3746A542CC
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 07:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4CF10E7E5;
	Thu,  6 Mar 2025 06:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="izWW1/xR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2085.outbound.protection.outlook.com [40.107.105.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1933510E8F7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 06:31:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dQ/ceLQQ5yAJzyNWh4g4+6+9XpEVgoQ5eurmiJ1Jvrmjilr2t7I/cUhZrvpTWf+We9NGkzNTfeq/vaU4LNhJr5KcubnTmdPCnT+oQwqP3FdbkyocXzHab0bwW9GOVKRPq7fT0BdsQf89pXMnWlQZaTm4Xim9I6BOXq3PGIA97/YyBuhGKFMaLQtVuHnl1/P8DSMpp37XNK9KpsGs9mpsOWJMPA0oy+eRMga5YEDJMpwCwIWdVR7BXvV1y0HG7TthOOUSOFaxlnBAZ6naHZy13Hg+yJtYc4kDgIoKQmXT5aLZVgY2bKU6vHYfvJaDS1w5ATZ590unI8WqRk2he556AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ibGwqDRVyuENaX81h4bqZlx2lOAikBeLiVQZwWUQ2M=;
 b=EwM6mOHtqT7dA1V3j9CxgqXyWaWg9ALcxoYEXW9muK3W6uU5Dl+pXr07OMXoLCyO5A7nzZuxsOerPE5woJCOHh1jO9nW9DVDRPVfJ6ofJ07jY8S9O2tvH54jeGJKq0PipnRONNlB/L96jbSywYwJdn/s+wUMWxq+N4G6XGwf0OTUvB6Bz5MnpZYkn5korlLHrqZATq8Hq3avZLGLbfazZYjnrd+mXAHMhriHjKhTL/nMXatgz0MORqVYjEMUmB7NQ1V7MYtkluUsEmn1TP7BR4QkPlPisPcdOq0RLjEz4OUEz5MaFGsDnn+gILyQXT09ZV2+ATFZCkQQHPIHafMxzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/ibGwqDRVyuENaX81h4bqZlx2lOAikBeLiVQZwWUQ2M=;
 b=izWW1/xRIjxZ84eAoNdPruT+i4xa7W5rvxgV2lojz9dHoh/RXIet0d2rDr686367Q8FWIrfOqpyt5qt49wlBAdvTEnwysz1xUiiuTQZ4SlM6k1VdUuDmWPTLCvDvpCTI7h2aqrUWJkPsebD2dfDrNh9Ma97KrWylJjTIkgU93NUZQM0tScEgMElM6mkNPad47hN8HDIVZAQWLlCd9q+jfqP4yXNAc/csVVcVJ7FH7koE52NxeGE7p3hApMBSjDb0xx0DKZgH6b42GQ3HP4dUHhUdaVyoSqE99F09tGGIihRP/eE85/XKsJ1aaJopfyXRMuLLeWa/Tcv8f+nBbBaJJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU2PR04MB8630.eurprd04.prod.outlook.com (2603:10a6:10:2dd::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 06:16:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 06:16:01 +0000
Message-ID: <69dbfa41-31d9-41fb-9897-74735b3b5a3e@nxp.com>
Date: Thu, 6 Mar 2025 14:17:13 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/bridge: simple-bridge: Add next panel support
To: Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org,
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
References: <20250304101530.969920-1-victor.liu@nxp.com>
 <20250304101530.969920-6-victor.liu@nxp.com>
 <20250304-interesting-solemn-potoo-fd4c6e@houat>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250304-interesting-solemn-potoo-fd4c6e@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0042.apcprd02.prod.outlook.com
 (2603:1096:4:196::19) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU2PR04MB8630:EE_
X-MS-Office365-Filtering-Correlation-Id: 78af812b-5ebb-4af6-3fd6-08dd5c765e4b
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0NKQ0paUTUzdXVFemowTFBHMVpnQXlrbXk4U2tWL0JGZUI3WHZGcVNGZHJr?=
 =?utf-8?B?aWRKMHo0WDNLa3ltbDdxeDF6ZG5wM3BWOThNb3p3MUd3OEZNTzlIN1N2VGta?=
 =?utf-8?B?a01GWW1BMndxdmdaSUR0Y1RhU2s2SU9nZHZ3RFFrSFhHZ0hjZ2swbFFzMWlY?=
 =?utf-8?B?MFdiZlJpT29pVzNDbkd2TjZuZjF4a09Icng4MDBOSG5MUEtOY0lWU3ZXNmRM?=
 =?utf-8?B?SnFTcStxWDBldjFvaEVyWUdiY0FmVWltQU1BN0NDckN3S2prSHBxalJRc1BM?=
 =?utf-8?B?dUd4cmsvSURqZjRHTHl0RjJtNWpXT0NZZkF6UkxNci9xb3B0d0hUc1FUV2pN?=
 =?utf-8?B?Mm1ER2laUlF5Z3NBbnEzeU5pL3NIbzY3amtQazJjUlNscTJ4ZWkyWkRVY3pj?=
 =?utf-8?B?eTlVUzcxbW5EbDJGNGkzRDNDVGg1VnBpcHFhdFRvU05ZTWRLZExJTjdkRnQr?=
 =?utf-8?B?RDhyUldFNGpNSzJFekIra1dsWDNVMnRwZHJHOWZZdU9sS2pYeDNhNWJVbmpP?=
 =?utf-8?B?YlFSNytrWWVlcmc2RGRRZlh6S0xES08vUkE0S292TWUxdlE1UUNPaEQyYVZn?=
 =?utf-8?B?NW9ISVFCak1FOE5MV1pJcmttbzdCUXBTb2hsbyszaWIwRjdBK2dHd3ZxS1dP?=
 =?utf-8?B?L29GYXVsNmZwcGRUMlUxUXhud1RsVkVvdENYMHQzSWJUU2lKaEhqcTNWcWpG?=
 =?utf-8?B?a2NjYXVIaVlBRGRURjAvYk1zOGxJT2dvNE9pSUV6VXdHQzZzWVMvb2k3UlV2?=
 =?utf-8?B?OExEREZSZ1cyVVlKSWZ6N0pubURPcmM3a1B5cXJOOTVJWitYeC9EUjB6aS9w?=
 =?utf-8?B?R1UyRUE2b09STDExbUFtMkhieE5pZUMrTVB1Yklmejg3b1BqM2pUeDBGZGVm?=
 =?utf-8?B?QXJVazBLK2M3N0FqSlpBdTYrSTNRRlJENHpvekd1SGpOS2dGVklOZC9kZ0dY?=
 =?utf-8?B?disrTG9URkVzS21YMG03ZjZQVjAzZ0daZjJicm5oV0lyZnlkZmYvcHFpbWtL?=
 =?utf-8?B?Qlk2TGJPMkxSdmpPdFRVNWZZNVRZRU85WTdCdlZyY2s5OFM0UnFBTGE4bDdO?=
 =?utf-8?B?VFpEOUxMaWdXRkE0QjlxaFNLYSs2aDFueG1mVFBvcHE4VjA3UFF1RThTSEl5?=
 =?utf-8?B?RmxjanR0K1FTWS9rNEMvWHUzbnJRWHdoRG1MK1QrMG94TFRyVHY2VGxCSGU0?=
 =?utf-8?B?b2pxMDRnZkVjS2M4Wm9HbDEyOUJnNkxVVmZ3Z1NFTU44emhpMTBCSkFlUk9I?=
 =?utf-8?B?dWZtQ2dPbnM3K1l2dXZkYUlUMjlDcDFtUVQ3bkhQdHJ5MmYvczByYzgzTzVh?=
 =?utf-8?B?b0ZtZzIxY3B0d0x1b1VrRlR3RnN5eDhzV1h0eXNIV0gyc1JMVW9aUW5mUzhq?=
 =?utf-8?B?V0duMWZRTW9FSVZ5VGt5RzJoUC91d2d4YkorZnVpdEZYWGRPeXF4MjZmWEsr?=
 =?utf-8?B?QS9NQk1paHhNR01tMVRodlhDdGd3cUNnNXpyRmVYWXZVb0lYbVRsWU1XR3BX?=
 =?utf-8?B?T1I3Vm5QMmZpR0l6NURjV2FUSnJrb3R3NXpzQXhvWGRYeU0wTkp5eDltMkND?=
 =?utf-8?B?V25Tcm5OaUFSN00rV3ZTQmc2VCtlYkJybDJpbnpaazR5QTlPU0NJbjZUQm1U?=
 =?utf-8?B?SC9nck9UUFM0eU9BSnJ2UXEwNVBTMG1xMHJaL201RWttUDQ3REtSaURkOFBr?=
 =?utf-8?B?cnVWclJYR1hiUzUzSVMzOWJRdlpmV3k1UnRZRHlYQWs0a0xDUm52RVo1c2Nk?=
 =?utf-8?B?UGU5dE1Vd21IR25sY3VYODdjUWF3ZGFMeWFpZVcvMGtCRGV1YUorM09BVGZa?=
 =?utf-8?B?eTZxVFpKMm9Jc2FnQUEvWXhVeEF1ZEovK3crdDNIUjAzcENidkFDYUZGc3I5?=
 =?utf-8?Q?gG9u1tylIKpno?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K05ZQ0dXR0dEb0NTRVlheHNMOGROMENROWhwWU1vSHc3aGFtV0FRWHZGQzFD?=
 =?utf-8?B?UzNoTlNyaW43bUgzYlNRZ0gxMVR6QXJGYU1vc3VzTHJqQVFhS0QzNm16dndj?=
 =?utf-8?B?Y25TbGd1L2pzWTN3cTVKRkllWGpFZHJVRThwaFgvd3NEeHkvQWwycExoOVFQ?=
 =?utf-8?B?VTJ6V2xySTlXc2J6WWszQlNjbE5jT0ZoOFNNVG9meWM2VHBkZk9JK3REblNv?=
 =?utf-8?B?dVRPVXpzc2tDV3BzN3g0RWhvWUVKY2gyN3ZBQU9RdEtIQklLcUZTcUdHY09l?=
 =?utf-8?B?RkFTVHBZSFhFa1pYU3F0bWVEcXFOYUJySDFxaSt3eTh1cUswOE4zM0lTeFp5?=
 =?utf-8?B?WTZWbWZSd04rMG5wZHlPYlQ5d0tqRWg4SUdQM2Q4TVp3VTgxcTA2cklVK0Nh?=
 =?utf-8?B?MlV2ckFXbkUrR2V5T1RybXpiR294c3ZFbEhHRkFtNlJ3SytQNVlmY1U3RUZF?=
 =?utf-8?B?NWhrOExQWEhGY1JQdktnM1ZpN2gxZ1AxcnFsenJjM0RtUTJkQzNiY1ZsVEZB?=
 =?utf-8?B?UDJLc0RRcW51YUh0aWRHRGxiUkEraWhPUENIVmxFdisyVlY0cHk0bE5SaUFZ?=
 =?utf-8?B?anJWTGxpYTZEYUlhVCtybHpKazBwa1lQYU9hdVdndHZFZS9DaWdDVUkwQ1JM?=
 =?utf-8?B?cktpQjZpT2llRVp0azZ4cHY1NnFJeWJaMEtBMEpOZE5xRWo1anFaak9FRE94?=
 =?utf-8?B?eVovUlZ0enREQXo0ck5ndW4wQjBLZjFpUHhQVE9MZWlUMUd6NTE0TDY1Q25X?=
 =?utf-8?B?eXdwVllCd1dmajM1Ymxkc1hzcTc3Yjdnc3lYemlZbHZUZnhJTGR4T0RvY3F5?=
 =?utf-8?B?MVJSTGx2QUVUbnd4V2RSelUyZnViSU1LeUhQY1hLUUpib3pzQ29Tano2ZnYx?=
 =?utf-8?B?T2dUMEMwcWluSGFVSHBVY0NzdXNpcEpZaDlQYnVsLzZuaGJ2OHlHYU02L09l?=
 =?utf-8?B?QkRJYWRFd2U4YVZXQXVESGVRWTZ1NENXREhJMDVKSUJiTHUzOTdML0YreE1w?=
 =?utf-8?B?amVlaDFPNFNWak5HMzZXbzZldjM0aG05NTcyV0g0KzJqY3o2djdyOFdHTEZn?=
 =?utf-8?B?ZEdBRmo0T3pYUWduRTE3SWtjaGx4NEVKY0dCMVp5djYwYzZyMlAvR0t6Nkpu?=
 =?utf-8?B?Nk5TS0RSTVo5VDhOTmtpY2xlM2grdmxMeStKUjlVZUgrTkJOVlFCQk81emdF?=
 =?utf-8?B?TkhDelJCSmdNMUZnMVIzT2xraUpGTm9CVm5Zc3VoUTJ2d2NiWFJMZXFkWWcz?=
 =?utf-8?B?cStZVDRuNGIycG9LdVY1MlU0Zmt6eDRaWWhXVis3RjBGS2g5eDVRczdOVW1B?=
 =?utf-8?B?aVRZY2FramhiUDFRWFRKakpUUVVsd3BhT2Y2QnloTXdhbVZUbTdSZVRubi82?=
 =?utf-8?B?bUpLREpPakdlOVRYd3lmY3RzTlRUbWdrR3VxR1A4dDVpUXNaMDdPZVYwOTV0?=
 =?utf-8?B?WFdITUJSYWQ1K3djSEtUS1VjbnBKY0RzTE1UYjVCbm5SUVFVazUxSjVSbnlz?=
 =?utf-8?B?MDgwamFpNDg3OEJyakdhVzAzNk5UamN2VUFEOUJhMHhUbUwrWHZKUlRLQnRl?=
 =?utf-8?B?SGU1eUZKRllTSFJjcUN3djF4Uy8yNzJvU1BOazlLYWFKVUtKTytqd0tJZ21E?=
 =?utf-8?B?ejhmb2xIMG5HSHlsMk5vVEZQbXR6WklvSDJORURHb2RTak9aVjk0ek5USG5K?=
 =?utf-8?B?Mi9XRk5OT1VKY0JoM1VVSEtMN3hhYnBNclE3OG5wenU0MUwxVnRhNEVDeUp5?=
 =?utf-8?B?ZXVMdnJmbTBMMTBINU9IdkhoNDNvQVpuMDNKalBjTDYwdnArTFc5Wm8yYVF4?=
 =?utf-8?B?NHFINHNuR1RUcG4wdVhzSnRGaWV2TURsMUc1ekw3eWxGWThQb2c2WVR5Nzhx?=
 =?utf-8?B?cHNZd3UzOWRnWkxFNG9RWGgrS3RjWWc3NTlsd1pSMEExc0hyOWo5YjFhNWJD?=
 =?utf-8?B?MndtaHVvOWdvSVkxWVBWSWlKZm5vTXNYenN5OFNEd2FnNVNHcklVczFmU3FE?=
 =?utf-8?B?RWJJN3BlZmV5V1NtZ0JnWFNpY1lQT0VNNTZKczVoMUUwd1dNNnVIUHluSGkx?=
 =?utf-8?B?M3h3NjVKTVBZd1JFaVB4RXBGSi9WRkliRjdjMWEwbWF3aXBzdzVaNlo1bU1M?=
 =?utf-8?Q?GEJN/Ue2TGTTdMvox1Dl/lUSW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78af812b-5ebb-4af6-3fd6-08dd5c765e4b
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 06:16:01.7376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GaMdUB0mQD+och0D3RFGr/TOf5haSlNyCvj6PHn7eYcGmRXWAFxI2+Xa6XwCuTf0/xaeEmiTcNVIjqBzt7q7rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8630
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

On 03/04/2025, Maxime Ripard wrote:
> On Tue, Mar 04, 2025 at 06:15:30PM +0800, Liu Ying wrote:
>> The next bridge connected to a simple bridge could be a panel, e.g.,
>> a DPI panel connected to a DPI color encoder. Add the next panel support,
>> instead of supporting non-panel next bridge only.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/bridge/Kconfig         |  1 +
>>  drivers/gpu/drm/bridge/simple-bridge.c | 32 ++++++++++++++++----------
>>  2 files changed, 21 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
>> index d20f1646dac2..92187dbdd32b 100644
>> --- a/drivers/gpu/drm/bridge/Kconfig
>> +++ b/drivers/gpu/drm/bridge/Kconfig
>> @@ -310,6 +310,7 @@ config DRM_SIMPLE_BRIDGE
>>  	tristate "Simple DRM bridge support"
>>  	depends on OF
>>  	select DRM_KMS_HELPER
>> +	select DRM_PANEL_BRIDGE
>>  	help
>>  	  Support for non-programmable DRM bridges, such as ADI ADV7123, TI
>>  	  THS8134 and THS8135 or passive resistor ladder DACs.
>> diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
>> index c0445bd20e07..4c585e5583ca 100644
>> --- a/drivers/gpu/drm/bridge/simple-bridge.c
>> +++ b/drivers/gpu/drm/bridge/simple-bridge.c
>> @@ -19,6 +19,7 @@
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_edid.h>
>>  #include <drm/drm_of.h>
>> +#include <drm/drm_panel.h>
>>  #include <drm/drm_print.h>
>>  #include <drm/drm_probe_helper.h>
>>  
>> @@ -35,6 +36,7 @@ struct simple_bridge {
>>  	const struct simple_bridge_info *info;
>>  
>>  	struct drm_bridge	*next_bridge;
>> +	struct drm_panel	*next_panel;
>>  	struct regulator	*vdd;
>>  	struct gpio_desc	*enable;
>>  
>> @@ -114,6 +116,10 @@ static int simple_bridge_attach(struct drm_bridge *bridge,
>>  	struct simple_bridge *sbridge = drm_bridge_to_simple_bridge(bridge);
>>  	int ret;
>>  
>> +	if (sbridge->next_panel)
>> +		return drm_bridge_attach(bridge->encoder, sbridge->next_bridge,
>> +					 bridge, flags);
>> +
>>  	ret = drm_bridge_attach(bridge->encoder, sbridge->next_bridge, bridge,
>>  				DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>>  	if (ret < 0)
>> @@ -247,7 +253,6 @@ static int simple_bridge_get_dpi_color_coding(struct simple_bridge *sbridge,
>>  static int simple_bridge_probe(struct platform_device *pdev)
>>  {
>>  	struct simple_bridge *sbridge;
>> -	struct device_node *remote;
>>  	int ret;
>>  
>>  	sbridge = devm_kzalloc(&pdev->dev, sizeof(*sbridge), GFP_KERNEL);
>> @@ -257,17 +262,20 @@ static int simple_bridge_probe(struct platform_device *pdev)
>>  	sbridge->info = of_device_get_match_data(&pdev->dev);
>>  
>>  	/* Get the next bridge in the pipeline. */
>> -	remote = of_graph_get_remote_node(pdev->dev.of_node, 1, -1);
>> -	if (!remote)
>> -		return -EINVAL;
>> -
>> -	sbridge->next_bridge = of_drm_find_bridge(remote);
>> -	of_node_put(remote);
>> -
>> -	if (!sbridge->next_bridge) {
>> -		dev_dbg(&pdev->dev, "Next bridge not found, deferring probe\n");
>> -		return -EPROBE_DEFER;
>> -	}
>> +	ret = drm_of_find_panel_or_bridge(pdev->dev.of_node, 1, -1,
>> +					  &sbridge->next_panel,
>> +					  &sbridge->next_bridge);
>> +	if (ret)
>> +		return dev_err_probe(&pdev->dev, ret,
>> +				     "Next panel or bridge not found\n");
>> +
>> +	if (sbridge->next_panel)
>> +		sbridge->next_bridge = devm_drm_panel_bridge_add(&pdev->dev,
>> +								 sbridge->next_panel);
>> +
>> +	if (IS_ERR(sbridge->next_bridge))
>> +		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->next_bridge),
>> +				     "Next bridge not found\n");
> 
> This makes sense in general, but I think a better approach would be to
> use devm/drmm_of_get_bridge here.

I chose to open-code devm_of_get_bridge() because sbridge->next_panel can
be grabbed and used to determine the logics in simple_bridge_attach() and
the flags handled over to drm_bridge_attach().

However, if a separate driver is needed for the DPI color encoder, I won't
touch this driver.

> 
> Maxime

-- 
Regards,
Liu Ying
