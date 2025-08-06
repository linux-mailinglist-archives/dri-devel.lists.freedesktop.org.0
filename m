Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D92AB1C371
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 11:36:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8380A10E302;
	Wed,  6 Aug 2025 09:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="hSztVLXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013006.outbound.protection.outlook.com
 [40.107.162.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B93010E302
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 09:36:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wr8HVjKeuLBP14W8hpEMjQXOmtpDGTyuBs83RhF7OHHu+ZIiVX8EfJGrtUkqKndkYkTY6SbfwK8D4vEe2A4rHMUIw6tFC8/vZyxwuMEZDtKE89noGe14vQTdn0YIeeUG5OiJOBF6aYM1F1DY6GAbgDCCxMSfYPRmAZrYZnr+mdk6IDVPBVuvxAZHXFVqC4Pe7XnQWExRDNhs19i/mSKDyWtRcby0gQP5+OI0C0l6f2IsqYd4ftu5DcxG5exLwgtygEuqGNt6hkX/ZuxGCmx02Bb667qvLZZVFNOG7dENmQcpHHV+xmaQo9WUWJkNAhGN+cF5Xj+AgzP+fVWBBhaTog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJQ3m011zPO2bHIBrtIJGIcT1XbJD6TVPGePlK7jkyA=;
 b=twq1AYxVIpey3OxKJyepm3cgTnWDviP4JkWOzu8eCtsxHRnOWQOkOZKFj45ECwjcR0UH4d1mpLMy6qv0j7g/dqh+maCeAq6eubWJNCLP9zbx9oBsk6SURWVOW4kEaRWwDRrv8IhjZs7/EkzCYnOWQ4oO7TXP0mVSc+ENY8G2sLVbzMAZsTQPYCCrX0kUoWOwYET2yF6ElRBtNVVr/CxLSjLzGrq+1vGsQpAfl48ujkk8YeptAQl1ixPd/NQRRAvNNQAPaFQ93NpOpgb8wTySxjf8IBoLU3F6dmkRMjoKB7fKnJQqZ6X80imSuiM6D8hIJ08t9TmLt6BCmRkN/O8zoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJQ3m011zPO2bHIBrtIJGIcT1XbJD6TVPGePlK7jkyA=;
 b=hSztVLXqm6y1YBJnyfySKI8EGy6cZyfvcVYYY4iGk0iibdRJ+t4fbiz+pR1wWYn47i9VK8a5RIgCv5d9XiQwB31tBiNtRrz4UvFcYb5a79w0Z8RgUz18zDRVKiw89C5waXLxv1iRNlTCw6dcQ3z7c7Os73CYKjCHNLq6DXaCxmE7hhCJ5FjWw0w33WiZrsP9AcZUl2SulFFvWQsGulpwwPuSudxJPCE8swidyacdO0Xn06GZdpfCMTf0iXywBpChzOnpyuY9gJdsws9LVLNdtdPr3QpjOk7U+RpyC+tsCdUZIJzntHLYIZ9CZ3K+fSIoFd3LtZYiVGr7po68c9BVeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7512.eurprd04.prod.outlook.com (2603:10a6:20b:29e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Wed, 6 Aug
 2025 09:36:47 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 09:36:47 +0000
Message-ID: <b5556cbe-76ed-4ddd-9b76-5896c2e1520c@nxp.com>
Date: Wed, 6 Aug 2025 17:38:17 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: analogix_dp: Fix bailout for
 devm_drm_bridge_alloc()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
 damon.ding@rock-chips.com, m.szyprowski@samsung.com
References: <20250806085424.518274-1-victor.liu@nxp.com>
 <20250806112641.7af982e3@booty>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250806112641.7af982e3@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI1PR02CA0012.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7512:EE_
X-MS-Office365-Filtering-Correlation-Id: d45ef84f-c704-4965-48b8-08ddd4ccc313
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzJSWi9jUjdhcXRKd1N3b3F2aVFqK2RZamExaHcyS2FuSC9uTmh3K2pJR1Zj?=
 =?utf-8?B?N1VUelhTWlJ2QnpYMzkrNmRPVU5OWlpHWXM2ZlVPbnlNS0pyUEJsTmxNdGhU?=
 =?utf-8?B?M2Jid1V4VG9YeGdIQTZRNGtoSDlocFlhWnB4V29WNk9kMmpkNGZFQWRCdFNE?=
 =?utf-8?B?S2dhQk9qVmVMeDB5bkJER1pqbDNrcjZUTmhEVlFGN1pMNDFoT28rTzkzNlh0?=
 =?utf-8?B?QzQ0YndKZ0s0bEMxUENkVHRWRUliY25xc3pYUDhreE1wOTNnVFBOSzNlNVJV?=
 =?utf-8?B?bk9kaEVYVVo4ZUdmcnh0TEZVa3BnUHh6UUh5aFRvTGRTMTRuNTJVdk5zcFRx?=
 =?utf-8?B?UzhoRm5VRjlEU1YyWXJjUURwdlVIZWRnRHlHNnlqbmdYRThpYThJd1BBS2c2?=
 =?utf-8?B?ZFdjUmlORm5GUGViOFFvSDVoYTlFVVNKQnRFREtuRnUzdUVnck9CbWh0NVRw?=
 =?utf-8?B?eUd3Y0tOeGxsNTAyVStWZTE5UmsyUG1BdkFpOC8wSDNoUHg5QmNpTTZIYTJl?=
 =?utf-8?B?aXhKb3hJRDdubno5bjh1QXVpSm1jOXp2NDNnRHR2aDU0SUdBNERRdDgycGc5?=
 =?utf-8?B?Zno1aFN2LzBDRlh6VzdtNk1LZ0xzb2w2Y0xxa3NTMDgycHpNT0dPNUhjWGIv?=
 =?utf-8?B?akRpbi9xeWpIM3VzWVFDSDdzMDhEanlaU1V0ZGExQnlVV1hiTGxObzAxN2pD?=
 =?utf-8?B?dnBaYkVSNFFIcU1ZRXVvL0VtUXlvUW9hMXovbmpMOEVHdE5yZWVRM3MyN2dO?=
 =?utf-8?B?azdoY24wcklVcFdMUVpGYk1qdlB4b1R5c3hieGlFdGhIYlVKV3doZzJVYjB3?=
 =?utf-8?B?R3FxaWxXdmwzWGc5MWttU1M4cm94WHM5aTdqL1o3dmJJNExzNHIwNC9vQTZ0?=
 =?utf-8?B?TkFHNDJVV1dncjduNWdmZU41S2loWTlCVFhMVURNUndEa3RYczAxdThZK0p2?=
 =?utf-8?B?a1EvNklZcEFRQzZORnFTVW1zV1A0cGNQNS96ajZOcmJrc3hSdWxZMU9pNTlq?=
 =?utf-8?B?V0orMVZnekJ0b1F5MHVDVU5ycXpaOTJTMkRUMTg1cEVKM0lMOGp5aDlvaFRj?=
 =?utf-8?B?RVhScGdqUmlrNlpKRnQrUGhjRlp6QzltVUxrOWZZdHA5dUNoY2kxb1g4RUJF?=
 =?utf-8?B?R012ZFgyNlh4R3VBdVdnUzJLMS94VUgwOGg2V1psVkZ4N2FJU1ZWbnpJVEFk?=
 =?utf-8?B?dVIrRnlDUHJzL2E0OFhISHR3OVhsZ3ROYVVacmpOMFpXV004cGZ0ZktkalFH?=
 =?utf-8?B?ZVdERkl2aUoyNlVhSGJ1cjVCbXZYMk11SG80TmpTeG4yWXovL3MrcUlrR0lN?=
 =?utf-8?B?bDExYXZ0dmJiNFlFWjdqd015OXBJYkVPSzBpZVhWMTlwT1ludHZGM000TFBl?=
 =?utf-8?B?RkVCSEk4dTJZeFY3ZjZva3dlWGZTSXFtcUp0ai91enVnM08wbzQwdFI0eUJK?=
 =?utf-8?B?ZmxISXNJbTBkdzZFVDN4anRKanRtZ1UxT25lL0VYOU94T1YydEw2ejJaTlVS?=
 =?utf-8?B?aDh0aFVmR3hOVTd0dXNqWGhhaExrRFBRQmx6WlhOWkRKclZrS1ZPNDRyeG5F?=
 =?utf-8?B?bkl6T09iN2F3aE1HYkw2S2hxcWxTMmNUc3ZlU2RPZXNHMmVPQ1hWRHhwdG5Z?=
 =?utf-8?B?MDRyTk96S2JJTXJkMVMyRzlzUmlic0ZlZWpoek9jQ2FjS2g3ajByUWZla2xS?=
 =?utf-8?B?WmRzNjFMODhXNncyR0c3b2NvY2JMb2x3T3QyekNGMCtDVWVBQ2pPYkRkd08r?=
 =?utf-8?B?UW5nSW83UVUyMWZ2RXIvdVRzWkhlYVlCLzlVQjRUeWdVdjAwUUl6elhHMm14?=
 =?utf-8?B?VWM1NDIrWGY3ajF3KzlybU5aNE92NVFOVEdwZ2xEL1lRYkVlQWgwNWdyOEFz?=
 =?utf-8?B?MVh2ZFRndmtiVWNqbWlubE1RMGl1OTEySm5tTXQ0SzEyei90Mm9jZmxoR2dL?=
 =?utf-8?Q?v1HYtIBa258=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGFCSk0vdHp0bkFUd2VteWFqVEpjMExyN0dMUk1EdHJYc0V3d3Voakl0WDYz?=
 =?utf-8?B?Y2U3NGl4Qk9Wa3hxb0JHNXdueFlYTG9xc2lZZ2tjNDZZeXprUmh4bVRvZWFx?=
 =?utf-8?B?eFhXdFlKZnZNc2E1OXhCSkt6NTRud1ljY0tFczZDU0hDY2hpbnppdFNEVWFI?=
 =?utf-8?B?UU1PZlBiL0w3VkNrSURjSGlLd21xTkRiNkxuQndCd1ZXRDdCZTFGQ1NPRFFj?=
 =?utf-8?B?dDRKSlhGRFNBODliUlZnRnVYTkJTRUhSdm55c0lkQ29kQ3BYOTdBOWZKWWFX?=
 =?utf-8?B?Um1UZndHU0RxaUF0K3U2V2NmYTRia1dmdjdTbkx2aXRlUmVHWWoyZXFIQUc1?=
 =?utf-8?B?OW5sdkNzZHljUDFQSllIbEpwU3JCYzNMT3FBMkJpaEpReDlGZHZvYUkxWGNI?=
 =?utf-8?B?ZlVNa1Rjd1Q1d3p6UXAzcGpBR0U3TnNvWGZycDJSaGljS1QxUUh6UkNIZi83?=
 =?utf-8?B?bThCVmsrSDdmVlVqdmo0Y3ErNVVMWU1wbzJQWWU4L0tVQjhEVnNITkVkbnAr?=
 =?utf-8?B?ZzNQWitQNkpFQ3NhTlJIRFFWdk1keklVeTF0ZDJsTVJCcnpmeG9yeDY4aDJw?=
 =?utf-8?B?dklxSHFxK3Z5UmVwVGpFa1Y3LzhIWDZTa0FFQ0oxdk5wWWg5V1hWRmFtWWxo?=
 =?utf-8?B?Z2U4NTlscSt6UVJYOXBRb3JDZG1icG5UMUJkMUxUcXRrUzhnN3ZYbUVnbTdu?=
 =?utf-8?B?TVVyWVlGZllUN212TlRjd0dwNm5sMklYbkZNT2l2WncycE45NUVFeS80bWVM?=
 =?utf-8?B?UzFnc3crUVRnOEF2SG8zMkF2RFpjcytsWnU3NE1WRnN3Y2dWeWpPWVZTUHhH?=
 =?utf-8?B?NGFxQ3YrRnVWMllSTm8vSVJlNmFHZXhIOC91dzdQeFk0SkJUV2pVU0tSZEh6?=
 =?utf-8?B?citWd0syWTlhdENYYUZJalAxa2VpTEhzM0ZJRU5oWmlGcVdLNGxmNWdzNW03?=
 =?utf-8?B?NzFiM3JHbXRLRlZLaEJUOUJhRTR4K2Z0Z0MyTXVaMjlkRzNCWDc0SHZJTXpq?=
 =?utf-8?B?Q2RNLzAwTFpzWDhvbU5KOVJDYTRNTk9BY3J0Mm80YjFWZEFabkNTaEdqalJq?=
 =?utf-8?B?MmRGc0dUKzdaSm9lL1hjYlRUclNhSDZRWmFDYmpXR0M2SE1DMlZzYVl0RUl0?=
 =?utf-8?B?Vm5JbWFLNldvOTFlR2FYY3Bpenp5cFJSUW8vUG9BTnJFcUVsSklONjJqQW1G?=
 =?utf-8?B?T3R5dTZRejhvR0tTRFpRZXVxTEZORFBSVDVENmJiaWxoQnlRN1QxWVBaODEw?=
 =?utf-8?B?a0pNbTRBblJJd3l0WkROc0t5SHZWeTJUdEF1Y0NiWjE5ZTl0OEJqSkhuZlRX?=
 =?utf-8?B?cW1hVWVWbGFmSFgrekhTaG9kK2l5WlVsZmVJR1I2dGY0Rmh4NDludFdtLzg2?=
 =?utf-8?B?am5QVkt1MUhmbUNIRTJDR3VVQ1NWSGt2QThKMW40WHZ2VzhYWEhURkp4em1F?=
 =?utf-8?B?UDM4bkFDeTdTeWFyT1RId1BQMm9YeGNNbnhBZm8wTXlEV2liUmFXTTlaV2N6?=
 =?utf-8?B?OFVVeFlGdnlSNklDRGcrSlNIQzBRdWJWaFVLTlRPa2F0Y3p1UE5rNWxuV0l2?=
 =?utf-8?B?QmdkR3RjekdNL2lQTWcrUFAwMnJVdGF1TjVoRjFvdVBmWFlJS2RtMExGcjh2?=
 =?utf-8?B?ZnlQOUhLRGlueDZLVkp6UUt0V0hldzc1QXNHdi9XNElPSmRYMW5tbWhFb3pD?=
 =?utf-8?B?YlBycE1GWWw3eVZSWmtMWDc0LzA2Z3BpSjZZNzV3TVcvVTd3c2w4eVM2UDdL?=
 =?utf-8?B?dHpmOExHd2s3VHhyWEQwRjQ1NElXckJwL2JhejhRRnRuQzlWWWtoZ2llWlps?=
 =?utf-8?B?akRPS1hVaSszUjFKM2oxTnpKRk1UMWw0c2NER25ZS2RUaU5OT3hLTkZlZDRm?=
 =?utf-8?B?L0JCM1Fhbk5QOHF6OWlzNFpoT0RJRDNqYndIczhHV2FMTUJZTkY4cHhNNENT?=
 =?utf-8?B?eldySFVUOUl6VUxjVkh5L1BGYVRkL0poSk5TVmx2blczUFU5ckx5Uzl1MlpE?=
 =?utf-8?B?ZThBWW5iWVlCVEZXZU9QTGZaMzV1TERVaU14ZG9rNHp1bktDeXA4cE9wUkcy?=
 =?utf-8?B?MU1vb0M4ZzJ6cmRKZklKWmFFd1BDcjBCRk1UNjlzWmJCQ1pCV2RUQjRuWnVV?=
 =?utf-8?Q?UkbLtVGu0WZ+nywf2BuiBrihc?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d45ef84f-c704-4965-48b8-08ddd4ccc313
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 09:36:47.0833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yfnUKhlFKwdxReg01cufTw9jGxqXJZZw45n5876EA73oUgHIAq6PXMqvJ1Gs05ESWKSYsCBaCuALep3qwPzpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7512
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

On 08/06/2025, Luca Ceresoli wrote:
> Hello Liu,
> 
> On Wed,  6 Aug 2025 16:54:24 +0800
> Liu Ying <victor.liu@nxp.com> wrote:
> 
>> devm_drm_bridge_alloc() returns ERR_PTR on failure instead of a
>> NULL pointer, so use IS_ERR() to check the returned pointer.
>>
>> Fixes: 48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc() API")
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index ed35e567d117..86cf898a09bb 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -1474,7 +1474,7 @@ analogix_dp_probe(struct device *dev, struct analogix_dp_plat_data *plat_data)
>>  
>>  	dp = devm_drm_bridge_alloc(dev, struct analogix_dp_device, bridge,
>>  				   &analogix_dp_bridge_funcs);
>> -	if (!dp)
>> +	if (IS_ERR(dp))
>>  		return ERR_PTR(-ENOMEM);
> 
> Good catch, thanks!
> 
> You fix is correct but now I realized one additional fix is needed in
> the following line:
> 
> -		return ERR_PTR(-ENOMEM);
> +		return ERR_PTR(dp);

You mean ERR_CAST(dp)?

> 
> Can you send a v2 with that fixed?

I find devm_drm_bridge_alloc() always returns ERR_PTR(-ENOMEM) in this
driver context, so it seems fine to keep the existing ERR_PTR(-ENOMEM).
If you prefer ERR_CAST(dp), I may send v2 to use ERR_CAST(dp).

> 
> Luca
> 


-- 
Regards,
Liu Ying
