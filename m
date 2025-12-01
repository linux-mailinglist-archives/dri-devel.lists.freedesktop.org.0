Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4CEC98140
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 16:39:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA51010E406;
	Mon,  1 Dec 2025 15:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=cherry.de header.i=@cherry.de header.b="iawMQAKL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010061.outbound.protection.outlook.com [52.101.84.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068F610E408
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Dec 2025 15:39:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPVQoKY/aZD0UB0BL1z+oLrYlO2IF+aU7bt/Z0rB8n4j7v/xxGZFrp49RWitI1bk1Z3TrV/453Sy2e7GOsCuKsNLMj4PnewqUDp+LgkkAgzj8RAXbzCX8wDRoGGHp403AbuX7t1NfwSSS2mwNzL3mVLSiNXKB/vvUykhz4EGB8MAyMHBuUAmRnJoRDn7m/KYKivwHUDvBeibxrZTGV49epOq2YyFLQH1OOX6SrL8gA5N7H7uWgtApl666fcm6kWMeQjIbk+KSeJE30KeUMbxOgWOZPpL52G/48+OtPkMuoj/X5Q+piLdeyUsRVFpPq13EEcuM/HGkqsvGfCCpKa3Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5pJddiiVi+I6ruP2tsRuYChx3jw5dyVAn7BqFI0ndI=;
 b=JoODuiNrYtTfCZnwlnVpP7RISXh94Ty6ZLDaZv7ZmGdeY+Sw4pfLymVBwFYgN72hiuLsKKEzwPTVHUgfQn+D6cJHXQIiIB4baOSV+wvfZNcvcL8KZFLbfKEg4eNRgSQpi5iA8QCxz2HH7YEc5e1CfuXJsWvcl6PToBJy9SEw2Wqho2ZHd5oOBnAuACVd9NY06mY8IOMIlPl7OVFePYNgQDOj1AAKMA3/OJUiKxFM+i8qPYTeCzyPjE/p3xgQdSVwNKCV3/5Y51m9xgit+FbOpkzQw2goQBz9Sxdp8hgKYymk0Y1ACICzy5ZN9o7qG+7JOFLwrw1dfgdgwBUZTAV5nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5pJddiiVi+I6ruP2tsRuYChx3jw5dyVAn7BqFI0ndI=;
 b=iawMQAKLIjLIxJKsGDcRfLt0zF6/Q9EA+adObKQQod/WkP85KvXkhS/oEBQ0ctYHc/c5IiSvMfwlYgZX+z39WVUO58+eiESBBRNZmXit/HnKXP0v07JLAdPF1832s8bSyVnA2FOZ/Kqp00XCiz7qJg1phvYzbn7QSpy2MJPXCJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GV4PR04MB11775.eurprd04.prod.outlook.com (2603:10a6:150:2df::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 15:39:16 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::1033:5a9a:dc18:dad%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 15:39:16 +0000
Message-ID: <d10fde2d-9575-4e8a-a46f-4af1e44592f5@cherry.de>
Date: Mon, 1 Dec 2025 16:38:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/9] arm64: dts: rockchip: Add power-domain to RK3368
 VOP controller
To: Heiko Stuebner <heiko@sntech.de>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20251021074254.87065-1-heiko@sntech.de>
 <20251021074254.87065-6-heiko@sntech.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20251021074254.87065-6-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::17) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GV4PR04MB11775:EE_
X-MS-Office365-Filtering-Correlation-Id: ba968377-4d63-4aa2-c2a1-08de30efc8b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXVXa1VMRTJYQVllK3FjVzJLUjdsdzR3RWs0Q3djWnRTYnBlT1ViOTY2N0dn?=
 =?utf-8?B?VXJackYycWQvVFM2N3FMVmtrWWUwSDRvK0Y5SWlIYUkyQS82dHI2dlZTRVZG?=
 =?utf-8?B?eW1Jcnl4SnQwbXBKSWVlTUFSOG1ZemNIQ0l1eWhEUkI5WU9udEpqc2tLdXJ6?=
 =?utf-8?B?b3UyLzdDSHduek9qUlBHbG1ieEhGZldQcWRLUXRyRVdiR3p2MGZXRklwMHRx?=
 =?utf-8?B?L1RSNXliZ3BpUTd1TWdTZjM2RkZMWjdOaGtnVTRidGlXb1dtT3ZaVVhFay94?=
 =?utf-8?B?SFdIV1p5RGo2QktBVXJMTEhkNzFvSFlVL2N5dCt4RXRMVXI5dVBWM2lORmRy?=
 =?utf-8?B?MUxsM3R5SjhTRnNxd3RRRjA3UzJveVJKSDJxTzluVWNNSjVFUXM3STdQU0JN?=
 =?utf-8?B?ZCt6Q0lvNDNSUzRHeDRFZGh1d3JrbWRFTVBJV1JJMGhpdDdINHdUUXl3OFVh?=
 =?utf-8?B?dWlsMnZHV3BqZE5uVlpSZEdtWURhb3M2QktJVFlWc2FMWmNzS3d1NUtvQ0pH?=
 =?utf-8?B?WTJWQWhSR3gwNDk4ZFNURnoxbkJVbEFtdTQ3SlplZzhRTHJ6RkZaZDQ4NDlh?=
 =?utf-8?B?K2ZxUkkzYndnSlhPeEtCU0RIL2xXUWc0Umdxb3Z0MUd6cGtXL0FUTERjU3NK?=
 =?utf-8?B?MjA0VlN6OFdGcDlHR1RjTmM4U3U3NXcvam5jRm52K29zMTR6WVQ1M0ZRWDdJ?=
 =?utf-8?B?eDJWdm4vTUVmTzdpbC9LWVFJYkE5R0FaVG43bnE2YlUyVWwxS2Uzd2NZUFVK?=
 =?utf-8?B?RStCK3ZLV0oxWXNvUWI5NGhhdGYyVUppK2tRd2xwdVEyTkRxRzcxUVNsSnlF?=
 =?utf-8?B?Q2VNZ1p1OUU3eFhQeTF6Y2tIRTg2d21FTmc5MjBFMGFYR1A0T2J1ZVlGaERR?=
 =?utf-8?B?alM5TC9hTFBqc1M1Ykh3SWdqZXhYNmFmOFVnUEN1T1hnYTlqQzh2dVd0L3RT?=
 =?utf-8?B?YkpEK2MzWWVJY1AwR2Z3d0dmaWF6OGk3UzJ3QW16L2Jub0t3ZmNaT1dYZzZW?=
 =?utf-8?B?RmpEUFp5WTdTOEx2dTA3aDZhTEtSNms5L0ljS2xVbEZQdWJWTXI2ZDd2eWkr?=
 =?utf-8?B?cStPWWFBWW0vOE9ubnNMUkR2U2RTMnZuRHp4TjNyMmtZWmVrR29ISFFyK1RN?=
 =?utf-8?B?bDZDeXFQbENYbHNWQWdIMEtTNVRTQjdPa3JVUGJiZ0h1Q25mUVpzSWtlVTA0?=
 =?utf-8?B?NkVHRVl2M2MrZml5MHZia0M4dlhWZEttRFVDd0NvbDBtWkJoUnI4ZXZPV3B3?=
 =?utf-8?B?RnV4aEpsRWxlMXlvcURoY1BRVDlUMjJBckRYYnRRSzhpZG9BSFEzc3ZVdllZ?=
 =?utf-8?B?M05ObzMwbDh2QnJPdG9NVDJWeDFUZW5vYXQ5SGlIc0luWnRENFQydjBNZXAz?=
 =?utf-8?B?Uk85aDg0ZjVXYWJaMGFQZys0VkpvT2RJaXA3ZkVvNE1nUk1haURaL3U3eHI4?=
 =?utf-8?B?cjZpZERwMjhpMXI4YnZrSWg2YnVTWlY2aVE4RmNXRkdyTW9aTk90ZHNudmNO?=
 =?utf-8?B?d2JxQkdaQzR0RW5GNDJhQVdtYnlCK2gxejhSL3oyS3VtRmpRTHRGazBhZ1NH?=
 =?utf-8?B?ajBuTXMwUUpkUW9Jdzc3b0szQ0ZXekYxNE9Pcmw1N0ltSzVvZitvZW82c2Ru?=
 =?utf-8?B?VUJRM21kREZndzk4amZITGszdUFrRmhFSER6VGFRR2FmMkRLL2hIVXpRR2Rs?=
 =?utf-8?B?azFHU0F6WTRKY29ENkYxUnZCV2hOVUx3T3pRaCsxaDM0WU9VVktRUVdMeTIv?=
 =?utf-8?B?aThyWnE5YVBlcUIvN0FZcEMzVUpGa3ZqdHVDSGQvQklOOE9yZFlGbDZsQ3VK?=
 =?utf-8?B?dng2cWY5YjhEY3Q5Z2JVWnRXYkgxYTQvWXFST3l1eVBnRUgxaG50aG1WaDYy?=
 =?utf-8?B?T0F2MWJVQW51dTdobnhsSm9NWHFxQUoxQ1ZEUlJTRDNiSk5MMWF6LytvdThm?=
 =?utf-8?Q?BctFANINo6PDNoA9bZFRQNn1JJYl241G?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GVXPR04MB12038.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N1phRk1kN2s3Q3NUTk4rRVE2Q012UnV1UzI3UlgyQjRya3kzWnpQSWF5Wlla?=
 =?utf-8?B?TTNudjJqMzhXZ1BRczJHaGFQSHlWaTZKTEkxVkZnbmd0TmRqVXdxbDNkZHJF?=
 =?utf-8?B?UHlyZ2FXYUd1Vk1rTXIxWEcrVFZKTUJETmg5VmoyTXhjSW9pWVQzVDEzaWRi?=
 =?utf-8?B?NW9GdzZvWXc3S1pCdWNLZ2dsTXI3bjc0U3E4RU5VWWNBSGluMzRIditCcDRk?=
 =?utf-8?B?c0hhemhWQVVsQ2dIUmhvL3RoVjdLdWp5MVQ2SG5JUE83Ky9GeGs2Z3U3YlQ3?=
 =?utf-8?B?ZWhHRlRLaW5SeVYycUp1bm5aajg3NVEwMmVVTDNMaElnYW82V1QzM0ViWHdO?=
 =?utf-8?B?VTBpS2FKV3ZEUnJaNElYSXJiemhiU2tDNTNGZkhsNDI3U3JubDdIKzRESTc4?=
 =?utf-8?B?b09iN29PRzFIakd6SUZqenpZMTNTMXpPYlJ2Z0F6dTN2d2U1WmRGSmlibzVX?=
 =?utf-8?B?SFIwRTRuOWFkT3NjcVptblRneUs0UGZGVjhleW5NakxwUG53K1l1SjVsWjZ2?=
 =?utf-8?B?eUZ6c2Zuc3hyd09SWkc2WXFUVXBYZWZ3VFl5bVhsUVd2cUZ6S2g5WVlkRDlD?=
 =?utf-8?B?SDFaYUpvdm9nWHVoZ1NKbUZVeGlpYnZpVVlUMWg3amJKMk93cnl1enpXcmly?=
 =?utf-8?B?azYvbzB1SGtYdVpnN09udmFXK1NtbUVjVEFWbFVNM05lWUVtenNXSXpSNUUy?=
 =?utf-8?B?OFVYSEY2WmNZQmQ2cDlQa3JaYVRHcGFaTEFwOU5GazRNeUM0UmR3KzhXaWlp?=
 =?utf-8?B?VVIxRUREUk9obFFlVFQxZzErQUp6L3VodzhMbXVxU1piYXFSV1hNbitpUSs5?=
 =?utf-8?B?UkJpWTFDbm5FKzZVdCtRQjVnL0p6ZFpRcG9PYW1sMTZtN0xDcW1DN0NBRGh0?=
 =?utf-8?B?c3FQODhwS2JieUQvRnBINUVra2NLOHZwY2Z5dkJyT1BDc0VUM1RPQWsxV1pu?=
 =?utf-8?B?OEp6TkFxUnZFTW5wbnpSdjgyOWxaTG9zWTI3Rk10YUIrMGJxVDVtSFBGSlU1?=
 =?utf-8?B?RnhwV0s4Y1RLNzd5dmVsWDRkdlpnTjNwelVBQS9aQ0lEMlJwbnl2T3hBc2o5?=
 =?utf-8?B?N25IbFkyV1JMQ2c2V3lmTVJRM0tMWkIyc0dxMEdVZldJVDJPa1JYeHN5Vlly?=
 =?utf-8?B?ZEtlbGc2ZjF5MHB1a3BkTHlralRSdHluVWJxdit0Sm0weXJwVHNNS2g1Rysz?=
 =?utf-8?B?M1NQWFBQenl0YkpMeU5OR0Z3TUlWblpRRG0vMWQ2cjdJN3NEM0t5QVYvOEMx?=
 =?utf-8?B?MjNUOFp5MTkvbVJWSjVQWExNM3o2eFpMSHBWd3g5K0NXU3lycjNuQzU3RVE4?=
 =?utf-8?B?VXU1SWkybFRVaVVBeDNELzVKaHA2YVBSNE9CQmtzZy9QRlJheWwzT2lpZ2Ev?=
 =?utf-8?B?dEhLdGpXei9aVjhzeVlvbHBuMElDNXV4Z2FMeVJXRmlUckxob1BTcDhpTTFz?=
 =?utf-8?B?d0NTbHBaQk9GcUVNbG9hK3puTUkyb1dMV1dMa05OaWJIMzhDTnN5Si9IQXU3?=
 =?utf-8?B?T1VUSkZNWFRUZldTVERmWTA2V1p0dnV2M3p5Z1NzQWRvQ055eTRaRXJnOVEv?=
 =?utf-8?B?MTQ2ZGt4ODlUTmFLN01GcEdIVEN3QXI3ODJDTTFNZHJBWWRQRWVTRk9jeTNu?=
 =?utf-8?B?ZHpxc3ZVS2QzUHE2RHF6akdBUFpxQjNOQkJMSUJTaWMwRVROT1BCWFVaWU5j?=
 =?utf-8?B?UUluR3d2eTI1V2dubk1EYWZPN1BHN2NCbmZCMlZ6VDBQZkx0TlBSVDlHMVBi?=
 =?utf-8?B?b01xVEx0MUJkeUNUS1RQVzlLaUxYT1JnYlFLbm1taG9PL2txbEdIYlcxM3Zw?=
 =?utf-8?B?b1NuQVMzSnEzWlF1TE1YYjBrNG5DSlNWMjB0c0wweWsvNHRsV283UytWbi9l?=
 =?utf-8?B?aDYyVUlCSmRvTmdxOWN2NXU4RnpzQVU2VEJ6SWlrSWE5a20rT0hQY1hWTmdz?=
 =?utf-8?B?OVlxblVoN2lwVnZDTTJ0U0dwaVNMM2ZGaytwOXRnQlhibDM1QUdsSjV5VVFR?=
 =?utf-8?B?S2pFQ1NNZUNBNDVWbm5RTlEzVldjNG1nMzEzVnF4dkxVQTBXcmw0bk5qYlJa?=
 =?utf-8?B?cStpVXFFR0VKdjR4WWJleml0THhxUlZlOXlLWk94WDFETWZyNEQ5cXBZZ3Vx?=
 =?utf-8?B?eXFOSXhOb3NYUmFJd0prcHJPR04zRUV0dG9ocGJYdERvTDZjNitGbVhqZXBB?=
 =?utf-8?Q?d6HNw3ZNVFojYi4dm1Wokfs=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ba968377-4d63-4aa2-c2a1-08de30efc8b8
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 15:39:15.9966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UYdAuFhEUuS3sJ0ROtWZEYzP/1p8lQcuPiPrwf0xhqDR/saY9U/ineie6xvGyBzDBARcHSgs7QaYoJrgATnVFO6Bc2Bgl1b7XMJJm58+WHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11775
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

Hi Heiko,

On 10/21/25 9:42 AM, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> The VOP is also part of the VIO power-domain and it definitely needs to
> be on when accessing it to not cause SError faults, so add the
> power-domains property to it.
> 
> Fixes: ef06b5ddee1e ("arm64: dts: rockchip: Add display subsystem for RK3368")

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin
