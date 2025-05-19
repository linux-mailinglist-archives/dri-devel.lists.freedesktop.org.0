Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3845ABB385
	for <lists+dri-devel@lfdr.de>; Mon, 19 May 2025 05:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51E210E1D0;
	Mon, 19 May 2025 03:04:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lWEF51U/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013053.outbound.protection.outlook.com
 [40.107.162.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E49E110E1D0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 May 2025 03:04:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZhKtD5rvyShTjn1ON9su3EvWvjr3cAbXsE1/Vqknp/Rr3eY35jGSxAh7IvECjUynz5AP1ECmXsv45ftogI/yCklxknL08+MA4U6YGjxR27QiSZ4qdRvn2D+kN0NcJAv/J/ti2vKa3QLtqmC81aemrkYsLVClFCq5Lvn6a8k2ePxQ3kUv2XrTIrOLqQD9dw25INNzOLa4nkqz9pJJoGAXijK6DTFf0nRXYTzblgeHdKQG4/JYTaRdU9o13P5vbid9JvWZQOavlJGiIqoi3iW1p487bM7PclYOidKQDyCqmV+04/1ywtzTydo56Td+XbA+QlFM37PzPXPdkL12T2tFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YjlI0SUxsSoYpbvxN/5MwcmTFzCVKN4jzYnVS1KO5eA=;
 b=CXXWKpwVgSkh8gFomtQPfc6nulfXjs1nMPuKtJsa7KtYJ9eAKFlbiIMoDh9d0GBCl5QZG3vhfYlIh3VagNxq1BMrIJhMlXZ1qZZIiKaDScZOAgLXCzd55ikjok7AGvvHH5qpWmPGXAVT9e+/jIk3FR+0Nna2O/tM6sy7/ufnPKy30IClz3paDlCOWPk3x327MPwtwnjam2lAKvDpG+3t2UFqb2+Oax0EmTjBjv46SldsJpk1o/1qWwa70nyCYWfkz+dQBZ4bB6J1FEmJg+W4NZNMY0Mt0p0cSCRW6JGNY9wZ05zWy/yJ2AGfUOaeXTyFsLWF4scUPrdPagpo00nfDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YjlI0SUxsSoYpbvxN/5MwcmTFzCVKN4jzYnVS1KO5eA=;
 b=lWEF51U/I1rVxGPOIBf8i8UUEMfqEadfaHVrnBPYrrk2oFFxETQgwFWn66s5V8hFGtJ+B0+Yu05dNU2IMT4baLpyHAuYVFc1GtuMJ7iwoIZPi/qliNElk2z/V/jCy0JMJPE0gL+7GaFFhi/EPchrzq6cH6pi2QTv3IgG9/SBPyR3BSUa1YAm2BG+43rfBzv29oIeob+WVTYCK40l4BcYg4xxT6fMYAngOl2JH3bexAsWh4Gemr3/tNlk08QUkY8fX7Tq0coEiaV2kvaLJJEgbGrvxckZNT0Fn1/YS8mQMTdXvakXkqdm5f8XCrBoS1EUlNMP7QBUOR8acrrsdjIEeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB7744.eurprd04.prod.outlook.com (2603:10a6:102:c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 03:04:23 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 03:04:22 +0000
Message-ID: <ef5318ca-74ce-4433-84ff-e7f6b766fe46@nxp.com>
Date: Mon, 19 May 2025 11:05:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm: lcdif: Use dev_err_probe()
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250429100919.1180404-1-alexander.stein@ew.tq-group.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250429100919.1180404-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0100.apcprd03.prod.outlook.com
 (2603:1096:4:7c::28) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PA4PR04MB7744:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b4b19ac-fee0-4aea-556a-08dd9681dade
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlI3NXBCQXNtT28rYy9FSG4yc3NoTjBLb1lBdE1hYTBTdjJZT1d0Sk9sYVoy?=
 =?utf-8?B?bnprekkyb0xJbmdEQldMQStPeG9YbE9NN0R0S09uWWVWN3o3RlZ0RzYrZHpD?=
 =?utf-8?B?QWhEb1JPTWxVbVNjbUtKSW1DeW03dE9ZMFBjV3JvYjRPWUpRaGhCOURId1N1?=
 =?utf-8?B?cXlGT3g1TC9VY0ozV3dHSmFZUlpqODErK2hkTCttblA2a1VDZ0pIWStGZEQw?=
 =?utf-8?B?NzhlbHlOQkFaWWFFdkZUdjBjR2FDMlFDazlzZGh2VmlPYUw4RjhzSGxKZm14?=
 =?utf-8?B?RjkyMklxdk4vMVVURmk0dms2d25LWEVBSXppTjFzT0RGdzkxUkZNMzhNdEl3?=
 =?utf-8?B?aTBQZ2JoaFRIOGR4cURoRktmNTZnTHFQeHZ2TW5QTVpDYktldzhyVkY4Mm1Q?=
 =?utf-8?B?WXV5MEJZYlVweXkvS2xyMy9DYTNLN2tqNSt3QXJzOGlEVXZvVHdRNHRPSVk4?=
 =?utf-8?B?ZnhuMmUyVFdwSm5QK2RTcEFtekcrNitGUEFSbHBNM3A5bW9nM2VialpPN2Ru?=
 =?utf-8?B?VHBGV0JQNk1kb1lpY0tjTE9LSE1kWTg0cVhDKzN0SjUrUlRHQlY3VnAyUFBI?=
 =?utf-8?B?N3RHa0hueHZuUHlHK1ZFUlc2RVZSZERxTEtzdERMMlBxd1NxemkzVHFpQi9j?=
 =?utf-8?B?LzBJV3l4YjdXV1hpdkhHWVdkVWRUYURrMngza013aEQrb2NwWVVrWU01YzRa?=
 =?utf-8?B?bGlxcDNvdVM2UmFWY3ZsblBjMVA2NGFIYkdGSkg3MUhXMDh3cHUrSVVqTjIy?=
 =?utf-8?B?Z0hlSVF0OFVvc1Q0dzkwN0h3aUR4VlAvSURUL0M1UHhUZW9Qb1d4RVM5c0tp?=
 =?utf-8?B?eEU5TllScUt4N3JTTWI5aitmc3NsUlpxTEhrN3J0eHNpc0pGd29mL0xhbTdY?=
 =?utf-8?B?K21oTkRQajhBNUlVekdtb085T0hBSXBBZW40RWRTc0N6SzBrMjNGcEVFenhS?=
 =?utf-8?B?Y1o0SWRLWlB3WlczSFBiTitvaDhuNVBoNWFiYnpRSDloVHZTbUZrMHJYTzJ2?=
 =?utf-8?B?QkxHSE0xNFdVUjJoMzZnSm1zaVNEWTd2SlFVWkFJaXRET0RiaXBMRFVHMWlq?=
 =?utf-8?B?QUNDSVJ2OTBlWDBkcStRdnZZbzN4aVpOQ0VjOExMclBhY3gydVE2MDdRTTZq?=
 =?utf-8?B?Y0pzQ2tSUzU4REw4aE5uTTdVTk9DUkhUMzk2amt6SmNmK2cvRkhhck1GUFB3?=
 =?utf-8?B?YXNONVoyVTBTQlJjSktFMEFxWGI2UE5SblIyc1ZIUGJPQ095a3YwRXVicHhE?=
 =?utf-8?B?LzVhMFVEdXBZQnhzYmJWNU95c3FRQmQrdkJqWWgwanRBWSsxU0VvV1pkQXg3?=
 =?utf-8?B?YktkME9ldkR0bzFZcXIxQ2dYWU1JNUxEa1daY2J6YkVIK0psWG0xN1ljWWJi?=
 =?utf-8?B?NzFSTCtpcWlFTXJMa1RoaW83dHZXM1dJMWlvZ1NuVTZzZWtKNEVlMExSM2NX?=
 =?utf-8?B?UmhSZlNPYWtrWU5OYWFwRGJwbVd2dlZjRmN0eHRPS3ZJbHdzSzVad1J6cUUw?=
 =?utf-8?B?Nll4UndjR0JBT2ZycnpGSGNtRGRQWjdFcWttZnJPQUcxTEpjUUw3OHRqVjVt?=
 =?utf-8?B?TjJ6c3Ywcnk4YWRkTDBCYjUxaDljc0w5aDYxU3p0aXZUR2NYc0M0RC9Qczlh?=
 =?utf-8?B?YVE2R3IyMXV4dFBHYmU1ZTdQRlJSUW9zVHgwUjNyL1B3ZDl5blhaVnlmcXVy?=
 =?utf-8?B?UUxJQytTc0lCc3RZTWlrMnBKMm9vQllnUTNZeTVhWjVtYUFpcGtNSTd5SUtH?=
 =?utf-8?B?amxhS1AyRjlLa1hqa1VUamVXbXBSYll6YVJ6WTM1VmUyNnlLTFlKTnpoNnpp?=
 =?utf-8?B?c1dhTjBHdWxqYk1yL3hiYzYwNG9sVzltSGp6THV3d3JHYTZITG03MDZOMUJK?=
 =?utf-8?B?N2dqUDQ2N2hNWmI0Z2hhMzRUVFJpdXUzOWp4YzZjQjFrUURhS0FkRnVXT2Nh?=
 =?utf-8?B?U3lMc1lSWnNkdmdUWHR3SG9DVXp4clhFMmxZaUpsR1RXaUNsOXJJK21iZUJS?=
 =?utf-8?B?UytDTUNnWjVBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEpMdVVmYTdwd1NSd1RuTXNtSEQ1dnNvdEU2dTc2aU9nVVdzRk5QdklZRGUz?=
 =?utf-8?B?dlQ2bldtaWlOb2NwUkMrVzZJdlpITDBJYzdSN3pUcWVrSjhnSHZlZWx3WkFy?=
 =?utf-8?B?OVgyZzhwZGNUaEFpNWtSRmhqQmo5b3AxSlEvTVZsSFVLY3ZlWDh3K001eitJ?=
 =?utf-8?B?N29PL0txQWMxRmgrT3FlajBIemkrTm5RdEN5YkRTRDRjVWZ0SkMyNlRpNkFT?=
 =?utf-8?B?MlNkRlk2bkpub2ZDaWxtNjhPbGU2V1BidStoSTVxMHZXdXcxeTJjcU9BUEo4?=
 =?utf-8?B?RzZWblA1cFFSeDZxamNBN0phY2F5THc0QTBQQzIzRFE0R1UzdXU1bFYvUGtN?=
 =?utf-8?B?Zys0ZWVORkhUaE1TSFR4NEFXdzFHd1FmNlphOXJTZUMvblc1dDhxTDRPQmhB?=
 =?utf-8?B?TDFNaWR3aE5yV2UxUytsNVhFc2lzcXV2SHhZVDBsUHVSTW1kVnlYc3hCV2ho?=
 =?utf-8?B?aGtyTDk3TTdZZjF2WWJYeDVjd1BjMEpNRCthOHZHcEk5V1dBSjFZVk9OTk45?=
 =?utf-8?B?V2dnRTRqcm9SbmllVndpUG52WTBCbmRhQnRZRW5UNHJHQkIyWTJubkM1Z0I3?=
 =?utf-8?B?TXFpMzVNRXBqeEhnS1Jmd1g1eldLMzRoNmtRWFNHTmZNR1lraVhpWEllOUFO?=
 =?utf-8?B?YjVvSkZONWk3dUZRWmJJNndSdW0zTmdDVnFkc05VR2c1SjlodmxMc1p0T2Vh?=
 =?utf-8?B?aTZTRzlWMVU5Rk8wa2NaaWUzSjB2bVFFc0FFWFZybyt3by8wamRscER1aGRY?=
 =?utf-8?B?YVQweGVGeUxCTEJia1BqR0k2NFVQeGFQMW1WSTRpWllIN24zZmNCcXFQRVVl?=
 =?utf-8?B?N0tMd3g3T1JIWVkydkVjZlJqamJEVUVLTHU0THNyWHp3WnJ1Ri9qRm1qckx0?=
 =?utf-8?B?c0xEMWNFMkVuTVg4d3ZjRUFVTklYczVaaFptQWF5aTl6d1MvNnBjT044K3VU?=
 =?utf-8?B?NlF2VkE5QXVkckV6THZNQVRZQXUvRzJBbSs3eUxnVy9QSDdqS3piUmxOb3dV?=
 =?utf-8?B?WHRpVGhwNE1HQW5qbDVHVGRvTDYveU9aVDJoQ2xxVmVjZThqL013bmV2aTRv?=
 =?utf-8?B?bzQ0R2Nud25RVkhNa1I4aUNTUDR5MEE5dE9JSjN1YXVhcFFIM0ZvOEhSRW52?=
 =?utf-8?B?S1VYMlhCN0xVdlhidjJFdGxrRW8zRGlwYlYrRitjVGZlZDk2TFZNTmk5YkRw?=
 =?utf-8?B?eTNKY2s4QTczcUI4OUFVTjFVRXQ1NWFNZjRzcEg3SXVQVTAvMVNGdSsrTkwz?=
 =?utf-8?B?NnoxSHVKb2ZEaXVxZnlWME0xRE9JdEVsbmFmQTlyNkd0aG1sSWFUUGoxNThh?=
 =?utf-8?B?dWl1UE1uZ3pET0ptb1pFQzNISkIwRVkwT0R5NC9kL2dCdkZubEprVmRqTklW?=
 =?utf-8?B?YTkyYWZ4NDJ2VXIybTh6Q29kWEhoZzhoc0xTOG00RGZDc3ZZdnoyQzBmbzMy?=
 =?utf-8?B?bnprT3RSNEl6QTBpNUE0QmVMMkc2bWtFTm53S29jVFY5a0x2ckJwY0VCNUhq?=
 =?utf-8?B?SkZQcHhqajNVdy91K1BwWEYzTFJTSUY3dHNnMTZRL1RFZ2diQlQ3Q0ZQZkw2?=
 =?utf-8?B?UGVpUEFpY2ZaRUF4bkJ6UUFDZ01rankxc0hxOFBJOFo0ZS9QMjRZaS9uQndo?=
 =?utf-8?B?aG8rYW1SbXNtbjdTcHlrSkRIc2lEQ1FtOGlZVGJ1bnBoS3V5aGpkRTlJczBX?=
 =?utf-8?B?WXZjZENhc3JNMFQrWE5kbmh5b1ZibkZlMlVlRkkvc2s4TU1QTWZ2ME9CcEVh?=
 =?utf-8?B?aDR3TUJMbGlnVnIwTUJpVnNySnpGTzJ4aXNWUEdBcEREeS92bXV4Zm0xNi9z?=
 =?utf-8?B?d1BlbmlqbGtNc0NTTWN0aHBOalJSS2lzOUhjcjFPSGx5bFVHQTNTYWRDem9F?=
 =?utf-8?B?MXZNR25TaFlPN3FLYWFjS1VNWkVCdit4YTI1a2VtY2ZDZHo1WGxOUjd1dFE5?=
 =?utf-8?B?c0NZcklxUVZkOEJlZHBKUmthcmRCNzNZbUQrVUpnQnVwc0U3WmhJUDYyTVV5?=
 =?utf-8?B?MWRyQURQa0Yxam1BYlhMWHBEMlZMWng4d0FxamhNSVJ2V2puUFZERjNTVzVx?=
 =?utf-8?B?dTk2dXE2TUIyeExoZVVvYnpab3ZpdDhlVlk5a29UdE9mcUQyTjVKR09KOVJK?=
 =?utf-8?Q?rpKe/KCO76pQLM2sn5UgVgMRb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4b19ac-fee0-4aea-556a-08dd9681dade
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 03:04:22.6887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTSu7wmoQMCg7XPlvYFjvK2nsmcRlDtKEKVVL/BWqjknKWTFN7VL/sSu923JHp0rNmFIkiVYqiJkaCbVEa1Xzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7744
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

On 04/29/2025, Alexander Stein wrote:
> Use dev_err_probe() to add a reason for deferred probe. This can
> especially happen on lcdif3 which uses hdmi_tx_phy for 'pix' clock
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/gpu/drm/mxsfb/lcdif_drv.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
