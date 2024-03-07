Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA518751DF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 15:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B570B10E723;
	Thu,  7 Mar 2024 14:28:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mysnt.onmicrosoft.com header.i=@mysnt.onmicrosoft.com header.b="ohl5bBOo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2122.outbound.protection.outlook.com [40.107.6.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C7910E723
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 14:28:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iCkhq7UTJQlYnHsLKJc8Kym6Be4K1gAw1E7HTes/W58U+4Nl90DFUSLFQxLu4ev+nJX9iaXY23BX/RDJF787tBwSZy+fEvz+KHSrTLLqYtJgoEBvgRuYL/Jfnd5AF5kEUOsmR+YHy6meOTpy+/8Hndwe3sBrPPGQBNEgUnJb7zS0ZofmWYoecaMLUgoR9xMyFfoj+YBCgyhGKXPm5MD+PrBOFajVlQq2gFb81B+HoSxw59XKwffKcpLQBEWqs/tDWOsjCZB2G00+L4OPM6X5VJjZOrT6nlE/qDVyXInlkpkdwRdtrqQvfthPYxTDC4pBdzZXxKP64k47xAOm0oGrQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wB5S9KuUjPEdMEw7PAbjlgJhUK4Og3rJ0U70gio8En0=;
 b=KJwtIO2cWwLYbPMlg/HAqHnLg6ZmJN+A6T7j98wpU5VxfxcmD6FZUEsebfVPRktFzmfezs0IPzh5pkEcdM01PRK76c8nTyLoK/A00u0/6d06oqK4TeyENQmjUnWeSfjMODGO7lgK+MskFkUIOEbyXWft33jtZJBYxgQTLLoRU3AUCyaOyfk+iz+pxIOVR/2eRupjoKhJQM7oy+BOaW+GSprupXDkkHsMTGZaWifB1E0i2b1rfhXj7633YU0e8w2QF/LmXzt6x8r6jqvp/8sAS3/y4ZHx1V7FfWlZLzSfzPBmADXptIyKsYv9fUZHkfhQA7+uW3RF1vSKsQWpXM2t+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mysnt.onmicrosoft.com; 
 s=selector2-mysnt-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wB5S9KuUjPEdMEw7PAbjlgJhUK4Og3rJ0U70gio8En0=;
 b=ohl5bBOoZCeI8IPpg/47bhdU/GtpZu+wwBON8y39pFPYATe4C9o7giGjjU3k69qHBpU3oQWmikxM08scX9yFIJLBIGuPgdgrSI97EFBCQWliha3iz4CkaHQ+QUcObXoasHxVcpFy4COTfaEDV4d9wGZxI8w5M/JUiZ19iWACURo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:263::10)
 by AM8PR10MB3986.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:1e5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 14:28:45 +0000
Received: from PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6cad:3fbb:8707:8ca5]) by PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6cad:3fbb:8707:8ca5%6]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 14:28:45 +0000
Message-ID: <ffdd3140-1729-4b77-86db-ee2e5c1e6b04@kontron.de>
Date: Thu, 7 Mar 2024 15:28:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: sn65dsi83: dsi burst mode
Content-Language: en-US, de-DE
To: Sean Nyekjaer <sean@geanix.com>, marex@denx.de, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com
Cc: dri-devel@lists.freedesktop.org
References: <E35054BA-FBE5-4CEE-905C-1F5D20140590@geanix.com>
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <E35054BA-FBE5-4CEE-905C-1F5D20140590@geanix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::11) To PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:263::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR10MB5681:EE_|AM8PR10MB3986:EE_
X-MS-Office365-Filtering-Correlation-Id: 67eb4d52-33cf-40d5-1739-08dc3eb2e53c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JucehY3oytP2PQDlmbSczM1VnYQQL6etCy3AhXfRgMjkVWI8naRuM0OGJQShRamMzAxV7u+KUg21aJlXd0Y1vsW0TSH7RbvXPLawN0aiZAE5rWqa4SdOcJYNeQMtAnIGbdkbys4m/+AUPeKsqCK3H7vX0he8e3RijhbzOIXY22D6s0LjCNTtfLwSS1KU7WyqGeIwTFAeGDRwesPVnTz6rI5AXmgfnZSrcyy+ypLyXfPHI9jxC/kIPeUof/HbrzX64ssCrkf/Cb84pgvA1AIvg9ScppqH0lbP+1zKgxeGM8Tukl69DJUbnlo7kjom+vHL469YsgKQLy/5m/vgwghQZtL6OPX4vRdPyT35SEeqoO6LfmGw1/zG/4Ii/kBJFhOHj6uy8C1hwNgblRaLd5zqzf7+VrDK5AgU3XUDPi7KGCxXUT/VQtt02fbtYjjitFg6V4oO/pca+uikc0iUhF1I6rv0qCvfCQA6AQQ9hhWqGtr0cy02TiaxDTn1Wz0hrgLe2npGZLCIgma5/ElrzZaqfTnYtQkOV/CZhEVGa9suf38CB/l8WBOzWGgWhSadB2H4AO0106fwz49WCch6Et/2+T9E6+jiq4qT+3stPsKKbUU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WUxIaFZSMmd6Qnd4OGw1ck1CN29nRzRwSXozMmFvVDVqV2pYeDVjZGt0TE9u?=
 =?utf-8?B?UGFUU1o2SnBIL3Vzb2NtOGk0bHJFUEh2TzZJTHJyRDRPV1MwT21KWUFCbEpP?=
 =?utf-8?B?OHJnQlllNHYzY3NyeUJxSGx0RSsrT3lxYWQrQ0YzcjNaRkNzMjFSNHkxVm5X?=
 =?utf-8?B?UzFvVnptcHAxMS9yTmFqakI2dG4zbWg4Y0M4ditDZmMrNzkxbkdRWjJXMFo5?=
 =?utf-8?B?amVVU0dZM05OaWRJZ3hIcityYkNuRjlkMkx1dXl0RiswU1dnQWNycTgvNnRX?=
 =?utf-8?B?QTZ6ZmtwOUVpejdxbzZJWGNVTUVLbWRvS1lJWTJ5TWFjZExCWitIbVhURTJT?=
 =?utf-8?B?MGthSlZpZTg5MVJOdEFzT251T3NSUDltVkozUHBBblNlYkdRZnZmdDdoUXJN?=
 =?utf-8?B?YlpFNm9QYjRHWEJKbzM5VjFQLytFaEorNk0rY0RIcjB2ZmhoYXhFL0p0RjJC?=
 =?utf-8?B?VzJXM3VVODIxM3QwRC9NNlNmbjdlVlc2VFZvRlYxMitEdkpVOFVRMi84bXZV?=
 =?utf-8?B?SUovYW5uUk53UldBYUVHdVRkTnQ2MHNyMm4rUGFYbm5NbjNPVnQ0ZW1qWlNk?=
 =?utf-8?B?L0JnNXZ2RnV3MTl0dHF6V1lFc3dqUmNqYXlCVXBOU0FNS3BMOCtvYWVRSlI5?=
 =?utf-8?B?aEJQektGbjVPL3cyYWwzeHhZTlZTT1lHOUNTYzZTaWxBNGt6Y3F1TDhXQ3du?=
 =?utf-8?B?MVpvZVQ2ZnFSTUI1MEs1VGt6ZWJHeDc3R3B5Wk5vczdOdGZnWEh1Z203OXpt?=
 =?utf-8?B?SE1JeC8vQnRZUk1iakNPdit5WTRqWVlKeFJRbHJkYlpsb1d2TnZHNkxxeE82?=
 =?utf-8?B?L21TajFScXdpWWZOT3RkTXlEdHhheE04Uy9EMGs4TDl2ZmtFeEl3L0NWSnA1?=
 =?utf-8?B?VVBacy91VmR6RDFtYlhjOHV6eEszbEZkYWRuWlJiWXArbmdtVWJESzJHUFFK?=
 =?utf-8?B?RzZzYTMrWjJHSnl3dlBtUlZ4UTJxRXlSZ0NjVnpDWnI3TzVMN0p2bWZ2dWZH?=
 =?utf-8?B?emcrby9ZcVN3WXJCVUdJM25wL1g5OHVlNmpHakcwbW5yMTdtME8xVHNPY2VJ?=
 =?utf-8?B?TzdoeWNqbjRSRWRiWjF2UlBwc0x0MFZjcG52azF6NDRXRGdnWk0rUFR6QUdB?=
 =?utf-8?B?SE91M3VBcVdPY1NNbFVxU25weWQweWx1dzNjWmwwMkhsdUhsSjVBMElkL3Fk?=
 =?utf-8?B?U2pRdWppdkFwS0sxTVI4SWU3Mng3WmFRdkMvS3F2RTNnRTlOQnpPL0d2RjIz?=
 =?utf-8?B?TUo4K0dtOW42QUpHcG05dmFScWE5SGcxK3QzRHlXcUFITTVYeHptUnArSTl0?=
 =?utf-8?B?eEhZekg0aitCSGpsdUxVVXZiVWh0cE5iUlNCbnRIVndkMW1jOGhGM1FGaUJZ?=
 =?utf-8?B?N3VOWVBTdDdqZ3p0SXpWY2JXcHN6bEZaUkM1Yy9nVG9MbFVhNDUvNldxdWZs?=
 =?utf-8?B?eFUxY1Q3azhJZGI3WXpvbmpNMmFkYUIvZW1FVkZFVHdVTEw1d0lhK1FPanln?=
 =?utf-8?B?T0VEZExuTWNycUphaEZIQ2N6WVNaRnB1QXhJMk8wbXpVMFlLNGc5WHpwV2wx?=
 =?utf-8?B?SjJZSzhlc1F1cVlxM3FrMVB3NEVXMlpiaGpMbE4vYmZIcmhqeXBwUUUvWEZv?=
 =?utf-8?B?TDFuSW01WEFqWjllNkxjK0l6ODVnK2p1bXgrYzdUZVRYMTRxekJmdDZPcjZE?=
 =?utf-8?B?VDR3bnBkRXhsL0ZXYTB0V3JwRGx4UXl1czlPUDFua1dGb2lJeVRGUXJmelBp?=
 =?utf-8?B?dlhUclhqOURpZmQ4cVp5dHd6L2RRZmdrcS9MN0N5dkptRUROQVcyQ1N1YjZF?=
 =?utf-8?B?cmdLZ1FnYjc2Wk5kQkxpNVhUS0tUZ0tPcGZCVVlkM0FJbEtTU2dQd0U4TVBV?=
 =?utf-8?B?bGlFUFYreGJHWnNwOCtDMjBzcEowRURBQmlrNTd5dTk3eW95K2h4ZWxBanpT?=
 =?utf-8?B?V0wvN2ljYmJXOENWbWxWRVJKL0xmUW9XY2lGb3ZhZnFYcGY5OWM0MzkzL2o0?=
 =?utf-8?B?cVZDVEtxT010cU1lK2hBNXdRMlpVK3hIZS81K2tsNDBKUjNLZVBWZ0JMTXFC?=
 =?utf-8?B?QUVvcUtScW9YMGRwc3V4ZHh0UjZkNVhDZUg1d09MLzBkUGVTK2ZqT0RvbjBa?=
 =?utf-8?B?ZWtKVlVHUUJJRkpXMEZ0Um1XeUN4RjQwalkxOUxpRlY5aHpaSGVIMlB3NGx1?=
 =?utf-8?B?SEE9PQ==?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 67eb4d52-33cf-40d5-1739-08dc3eb2e53c
X-MS-Exchange-CrossTenant-AuthSource: PA4PR10MB5681.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 14:28:45.1783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IB/PG+qbSm9RG2sbiyguniBQEF7lcI5CWKVR3w4QUzPDtz+J9/YQWGxmnU3ZfPOqbE23jQwAwiGtJ3Vlb8w5sNFv2PNd3h2UApQUXWY3eQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR10MB3986
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

On 07.03.24 09:09, Sean Nyekjaer wrote:
> Hi,
> 
> We are using the stm32mp1 together with the sn65dsi83 bridge.
> The ti,sn65dsi83 driver is (hard) enabling MIPI_DSI_MODE_VIDEO_BURST, then the st,stm32-dsi driver is adding +20% to the clock speed.
> 
> That means our LVDS is +20% higher than expected.
> 
> Any proposals for a fix? Could we add a devicetree option to opt out of the burst mode?

FYI, this issue has been raised before: https://lkml.org/lkml/2022/10/4/455.
