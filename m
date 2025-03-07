Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C295BA55FF9
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 06:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08EDA10E7FC;
	Fri,  7 Mar 2025 05:27:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ic1lparp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013035.outbound.protection.outlook.com
 [40.107.162.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599AB10EAD2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 05:27:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CEs6OB0/1zIHHpWCKTAV2p6dFHWNa6BDtK9lHcGpjKH/mL7Y0pJr2WmGM4lmZ468j6S1ROo24FydZsEixHMAY8iDdvAp/XKR2P7kR6ivpMPu6NWtUMghUyAB4343xp0bDthE7+d7nAVV2qXSzFhaFgKIzpNV5C3ruDCZSeAN34S7D76zfV0REdMGC/NfWFdD8xCj7A9Eah7iRxuajsRhjxd99kBhh6ikmtWS+DBM8lq5AEPqlON57W5nVfl+/D6q/oGOZVKQnTx+24Ywi0nciNtdGIB4pN4fyFBg2XRh0UvvROJBSNzp6enn471MChHhHGcHxVHFmrrfzYCyvWQLtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKKkZXzY9c4q96XtpktiMNrtD9uE58f7VtgJ5KCKcKo=;
 b=v/0Yfnb7P5NbapCuR2rFoCXHVOCqxR4qvDRr1/a2z+VPdRtZ3tZ+a54Sm6tTRFvYbReQ1vTrt8sbmWcBHuYIm1acf41otCiF5d3MiXvcoBc3Upbg7psAmlmNAzyeVuUeRi58uG8kpYNX1PuA/U8Se72iOK2UiaOMEoZ2bNIwEGiAFRF8xR/wxrL52mh3ENQmF2PmJxfm5ARnHSBc+8dK2rjWVXTRmijKAzNyfQA9WPY5cdCCDJMbYCt9qOHev6E/uDExbn0wgtTnNyMcBK815hYygSDHfo56Plu2UgHPAqAKaHIkgeJtFM+sK3rIVmwBM5dqDigBkADaT6h6vn+RVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKKkZXzY9c4q96XtpktiMNrtD9uE58f7VtgJ5KCKcKo=;
 b=ic1lparpwKKPv8raQnhgSd+0tc8kVeuISNsyeSyiDDDyKgMuF3RNYCD5uu8eC212l82CYSFfN/iOYh9u3SIowGZps/iUKWUGXTdQGI1vDiE7WYrZ7Fz3RI4/OpQHvAWfBboPd/zES253D4as9mYV+usmUa1BF6xlxKyhB64yAGt/FgC8DaL9yjMM0C80Z9kdTmiJ/b1NrzWpXSpzo5FgVx1loKGSZ5eNds9i8LuKXUjibMFMlMk7oSDAFIsn0KTNhQQsKjnDu9ezJ+kwiFLc2UK+FZ6VG+SlmvdKt8UyQKH491Jl4OoQVn+8FHneBwbg3WyKvIiM5Fat7TbP1MAQIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9679.eurprd04.prod.outlook.com (2603:10a6:102:23d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Fri, 7 Mar
 2025 05:26:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 05:26:54 +0000
Message-ID: <2a24baaf-343b-442e-8d43-7238eaa01272@nxp.com>
Date: Fri, 7 Mar 2025 13:28:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/imx: legacy-bridge: fix inconsistent indenting warning
To: Charles Han <hanchunchao@inspur.com>, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250305103042.3017-1-hanchunchao@inspur.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250305103042.3017-1-hanchunchao@inspur.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:196::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9679:EE_
X-MS-Office365-Filtering-Correlation-Id: 832b5f7f-e221-469f-4462-08dd5d38abea
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3h2Sy9uTGJna3NXOVZ1NmZIVjAybm9jYTNkWlRtZS9XcHBVRzhkQzBIV1BK?=
 =?utf-8?B?dGdBSHN1Zjl3clVSbzBVRHdWNG5QVXhVQkkzREJpbmpzUWFYWjBqWWpvdk1o?=
 =?utf-8?B?MFU2TkVOQVdIei9mdzdzYWlJOGFqdVZ1VTdSY0lLVFNqeVFVenA3cjBBdWVG?=
 =?utf-8?B?djdZTE9PbUdIaklJS3pQUHN6d3lRSWUzdzNTMC8vMEY5RlJEQ0dJaG02YkdS?=
 =?utf-8?B?WWNHMG9ET1V6a2Jja0lBaExZUWdnU0FPM00yTmNnWWowUmMrWjByQ2xTTU9q?=
 =?utf-8?B?UWFUczI5L3ZJdUkwd2dOSG9PdC8zbWhEZTJ6OFh3MWZ1YVltdytzYmIrZkY2?=
 =?utf-8?B?T0NWeGpXeU1ZVks1ejNuZTBQZ2JkRmdtYWVDVCtYMUxjM01DcnRNdndGdUZs?=
 =?utf-8?B?NDIyL2d2cjI4TVNvTlREUTRtcm5vMzlRaWQvVFRHYzhpSmhHNVZJdnFlVno2?=
 =?utf-8?B?NzlOZzJ4M3pXQ1A3RGlMcXhreW9WWXdQT2oyQjhCaFEyM1NFaXl6eWY3eUZN?=
 =?utf-8?B?blhyTUw2cHZWZWpKUXRUUnRQNlBWb0cyYkJkelJ5YmpKN2VNRG1kVlZiK2Vh?=
 =?utf-8?B?MURBQ2RtaFdBOVlpSmxPUjZjUW5EVTd0V0Jzb0hPYjF5bGh4S1lJT2t4czBM?=
 =?utf-8?B?aGRLclJ1Z1VzMXZVZ1BoUkdHTkp5a2I0RnBBNjRFTUl1SEpZSHpaU0pSc2xa?=
 =?utf-8?B?TlZzMWszY0V1eTZxcEZkK1BOTDJoMFF6NTlRQnZSdFZlcWwwOFhUb3hWV1JC?=
 =?utf-8?B?ai9aTnBuQWFyQzZwT2V4OXgrZmdWTzh4cWRaNmF3YWxxRkp4N00wVjVxZEZK?=
 =?utf-8?B?MjN1VWVRZWs2em84aXRVcEFXVkNXWTVyQWhaZmxuUGxFOFVQWFNpYm9BZDhi?=
 =?utf-8?B?SkpJcWZrREhkRWdUR1dlWWE4ekhITGVCNDZPS2RKNnFURk5ZekVxdUxJSHY1?=
 =?utf-8?B?RkkrR3Blblp6TEZVZ0lLNGVMRlRGWHIyS3JkUUFOUmF1OGFRbVBUYUEvM0hC?=
 =?utf-8?B?akFTajF2Z0RsZXZQekVWZEhMc0FaSjltRllWbEpGSXNLVi9yVWp1Y3hHbXpQ?=
 =?utf-8?B?NnNCTjBhOFI4dWFYQklpVStJNy9sTnlYVGpRL3hqMEloVkNFUnUzSnlWcFNI?=
 =?utf-8?B?cFJmVjlpU1IwME9UcVp2NWFGYjd5RmlJcDhvQ3V1dzQ5c2I2N01MZXh5VlNU?=
 =?utf-8?B?RmpNR2NvRjAyM2E2RW44T0xVQ1BxUVZGeDVERGRleTNjVU1OSjN0UDZzZXRv?=
 =?utf-8?B?WTZMQUxMdEE2WlBWbStoa0llWWNCVlM1Wi9LMXYxNHZXVWp6Y0RhdjNHaS9F?=
 =?utf-8?B?WHZKemtQRmFrdHZORWdGb2o1QUVwTGZWS08vZHlNWDkyRHVUQ25QRlR2aE5W?=
 =?utf-8?B?UnkxMDh6cjN4ZVVCM0NkRitxMWtKZVVRVlMrRTlvYW5sSU5peDlXRlJsTGl0?=
 =?utf-8?B?aTlJVlpvY0ZQYkd4dUY4Y2xTdlVpLzZDWURSMFlSbDBRbktqOTNyMkpacitU?=
 =?utf-8?B?UGJLUDJBek1paTZuaDVBUFcybFpIcFd5c2NVUDNCc3F2OUdSUVY1Ty9OVHZ4?=
 =?utf-8?B?emJ6d3RjcmhjT1pzMFVQeEF4akdCRDVxQVBVTWU5ZFF0SENsNnFMZ1lDSTkx?=
 =?utf-8?B?RXBlbmJKZnpZWkZuUFgrY2xldGhVbFR1dEtFL2RTaWNSVDY4aW1ZbVEyR01O?=
 =?utf-8?B?dUppYWU3Z2Y2Z0xNVzlUdXdTMmtRSnNnaTAzSk5SQ2x4b2xQTC9lT1dzS1Fa?=
 =?utf-8?B?enRTRldpSjRwb0VqbGxOSVVCNHF4U2dvaHdCamNJK0FrbU5XRVBIMVZJeTJP?=
 =?utf-8?B?SEpnWkdUa2JzMFNIcy9yYXU3RkVycnZtYjlUZkR1eC9TRWN2WmdMYlZTTWxQ?=
 =?utf-8?B?OHNsd2k1TStOajEzZUxMZVdqSFN5WmVrcFlHODl3T2ZiTXRLSHBsTTZ5RERR?=
 =?utf-8?Q?+2GruOUw/1U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFA4cGM1ZEZhV1c5ZmZIVUFLdUxCRUEzQ0Q4Mld1VEZFa2x0eVJ2WlYxT3pS?=
 =?utf-8?B?R2ZKZ3YwMnNINzd0MHMrbzdEYThKck9WdHJFSWVQcmlFZXJlb2ZkV3N0bWh1?=
 =?utf-8?B?SEx4S1hDcjkzTXRnMXZnSEFwMzZUVnFmZTdnL3BCTVJTcXNpeURlbDNPRHRJ?=
 =?utf-8?B?ek5pKzQvNHh4dnAvYmhzU1BsbUMxZEFWVCtZakF5ZExVWEdvOTRaVU1ZM2hh?=
 =?utf-8?B?STdwaEtMUC9qZ3FZVlNTVWxicFJpcFJkYUQ5TUdLM3c3RDJ3MEpSTE5JLzI5?=
 =?utf-8?B?MEszODlTUlVjeEMwenZsV1BwYVB2UVZNNGhUY0hxUi91QStad3VzNUp1MUx2?=
 =?utf-8?B?eFNxWU9xazRYdFgrMkJLSTRaeFJleWYwTmg1YjR3dGoyd01pcWxJMXQwT3lC?=
 =?utf-8?B?cW5lTHpSNFZGUWFJRTRPUjhKZ1NxdFVaWGZ4VjhHQzlkVXlKd1pScWpyOHU2?=
 =?utf-8?B?U2pONVNyMnVMcENqUFpoT0dId0hyTW5DanpXL3N1ZHlBR3ZGNm1KYkNXVnd1?=
 =?utf-8?B?L2w1enVKaWtGa0RZVG14Ky9SVmN0VlZmcEdNaW5LcWtjR3VLbC90UHNyRnd0?=
 =?utf-8?B?dWZMUFp0WUtTZG9aanQvaGtuWmQzdHF6WklOSGRiRFp5UmhsNVY5RWFtbUJZ?=
 =?utf-8?B?Q1JrMWV3ZGxzd3ZtTVFZUW55bDAzUnNISzhRWGhiVkRPWlM2QXlwWkpBd1l3?=
 =?utf-8?B?b2lzMXVjY3NQakJ3WFJKRzlacFJMcU1lYUd3SWZwclZDTDZZOEtjejhrb2sx?=
 =?utf-8?B?V3F6S1AyVSthTzBxMFk2S2NOQlRVZEgxMDR6a01kMndhMkxUSkxOQ01kL3RI?=
 =?utf-8?B?aHFxalJjN2xpRVJ5VmtxRWxaM1lSWlh2TEgvclhZMklzSFdvMVB2cUk5eEFG?=
 =?utf-8?B?VkJwa0I5aW1WQlQ1ZWg1STBYSDhTd2FJb0pOUE16MFQzTlVheXIxdFBrVFU0?=
 =?utf-8?B?Y2lGUXN5a3VNakVKb1IyMW1EZ21QMEw5VncrWU5YQ2orWUdxV3BNcUs3eWhj?=
 =?utf-8?B?SVArVGZQN3B1MXNCV0l5UnQwUzBjMXM2UHl0NlZmVmZneDhZc0QvdDg3UEkw?=
 =?utf-8?B?UmxaakwwWk9IVzlJWjF4N2E0MUszYnZyY1BrS0x4RlgrNHR4a2M4OWptNkEr?=
 =?utf-8?B?ZlhmTkdHUXZWYWV0a2d0dGplQWptbk5GSEMwSmNzSTZ5OFhIRGRGaVp1cldT?=
 =?utf-8?B?TFJRWTRGZTlncEtWSFF4VXpsWUNaSHZGL0ZsNzBLVW5naHkzdzJRTzdZNW03?=
 =?utf-8?B?c2FjVWVHNTZSZG5IZ2VDdkJBQml3M2gwekZvaVQxVlBmSHpwVm5tNkpBQkFh?=
 =?utf-8?B?RXZMTHFlcDRjcDNTRVlVWVBRN0huREZxc212UG92SFFkaXQwekhULy93NCsw?=
 =?utf-8?B?UC9PWFlFYVBpMDNjSlRDUHFJWkpsTHI5S2IrSzJRZWtHMHpFaWMyQ1djc2pO?=
 =?utf-8?B?a1IrWGxGeWVjU2FuQmNzb1ByMzdLTXJpdUFYUGdnV2U3OGJJdHZDc2RublA2?=
 =?utf-8?B?SDJ6czFDVnJxbDlFcFpPQUxoeFAydzZqc29UYzZzdG10UHRGT1U2VHY4ZERL?=
 =?utf-8?B?Uk51Z29vWGJLZit5UkJuQmszYmp5SDdnaTNUckhWZ1RteHNhRWh3dUZzNGRH?=
 =?utf-8?B?RDJEYU5GaEp6TWxmMzhaclVyd0tpL1p2eXh2R1pJaHFJMFZpYUZGdHZLVUFC?=
 =?utf-8?B?U25FVStITk1maXBRYjRoUS9Gb2ZvSkNWdm9BenA0dzlpQU1DeUxlbnl6N2Ny?=
 =?utf-8?B?cUNJRzlac1U5SEZKWlEyTjU0L05VSit0WDlBeEFiTHBOOHB5RSsrVWVEV1J2?=
 =?utf-8?B?K056ZU8wSkJObGZNV1hlN1lvNFQ3U3k2UWU4ZFNtaHNkSDhKbStvdzlHbGZ3?=
 =?utf-8?B?dlhHcGtFZU8zYlE1VjRMc3NiRHdIMXZWZDJJczBkREhJSEZaa1F2RDZTSld2?=
 =?utf-8?B?VFpXeWxDTjV4b0Zaam9IakU5WFBaTlpxWlJQNXJ6NlhNS29TRVpVamNxQit5?=
 =?utf-8?B?Z1hKWWJUUGthbmJTWjNMMWpjN0p6QlVkZ3J0WHdWVUMxcjFIWU1rWmhEb1VB?=
 =?utf-8?B?NXdmWWVIVGhXUCt3N2NzeFhuczBqMHNjVlJ0c2xyR29JeE5KOVJIK21PRy9l?=
 =?utf-8?Q?CZJcIeem6Skjk4T5WGtKUbW79?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 832b5f7f-e221-469f-4462-08dd5d38abea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 05:26:54.7441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ncCDwuX+O0jL6CkOQ44BIrefuyZOxowT6ibazdIc4h0VtMulZHjC782jp8Bum00DyVdvE5qLrFTVKxy/HRSOaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9679
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

On 03/05/2025, Charles Han wrote:
> Fix below inconsistent indenting smatch warning.
> smatch warnings:
> drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c:79 devm_imx_drm_legacy_bridge() warn: inconsistent indenting
> 
> Signed-off-by: Charles Han <hanchunchao@inspur.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied to misc/kernel.git (drm-misc-next).
Thanks!

-- 
Regards,
Liu Ying
