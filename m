Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48786B51061
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 10:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA8210E895;
	Wed, 10 Sep 2025 08:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xZ6hLnpN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2056.outbound.protection.outlook.com [40.107.243.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D36E10E895;
 Wed, 10 Sep 2025 08:02:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdDeLavq40ubNhsriVwrDAmuPy8k50xnLJaNJHZwUwj18NwHCnBvaWG/snEZ3Bu1RTBfFKBRxAuE9FD9MthGB8Y4bmAwZByrk02nAZhZCjUDOqFUgeiAKvB30ziRQIQ78ZeToOXDDue54T6PjEGnSsep8kIBwqzKrXjpyglAQTKmJ4mnbc1JzsLGHPr0PP+EsMM3Veh1zVs2/1v7swv+zPYEL5hCDHy0mUbX9l3Nvabg33QLmCmTn47NO2rqIAXIHKMRHgmH6Ydhgpmn/2ztG3xz7QUg9GNp4o8GeKlng24PdFeNoJWYpuKzw04XlNcGj/6jKKMnvx0AccVqdtQrEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/bZcdGRCbwhKqKzLz1YOT3BsJ665coaFE7CSCbONGXw=;
 b=HPKjvlENYeH91EtZFV8HmxCeEfE2I2azZFnBK1Vu8hDLvWSwygKvmmsS5hpVPrGcTsUuitVq8IqU8rRarmT7jJWPzuXzRhJ04yguKwpNoN9uHr0C4kkx2591az7QjOpPJ2ZWTSr6EaPMc6ptNi+P7Ug86V9qw9reMyRzHyGVEvbVccUfRnMP7T5bOyNa+n8uJL2NEORmlVhMepVGZ+csqYEECznWirwGN72tpgXwB8NTN/p3oeYFknub/fci7lnU8c0HnahNeJtZwg+SY5tWe4iuEdh4f0mLBMmkuRSxHcqc1P/yAeEDZ+IPs+hCjzd228aKxXWsS+VO6OpqoFqxAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/bZcdGRCbwhKqKzLz1YOT3BsJ665coaFE7CSCbONGXw=;
 b=xZ6hLnpN8xcNKW0Trwq+rskIN/4dR/vZ/mk1m/cxA3IqqP9FtRVeFHK9A7qI5w6VtCn1xnh+i3R1+ywcqZmq8J/5STQZfn8rC/JmI+AKISPRNi5Qv24i0ic6CkBXm3OsfS3lY7bJLnu+kBoZvUzTX40tduvgM4v0R0VD2NrJibU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6576.namprd12.prod.outlook.com (2603:10b6:930:40::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 08:02:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 08:02:15 +0000
Message-ID: <45c973ea-22b5-4df2-8b34-a64d48cdecb2@amd.com>
Date: Wed, 10 Sep 2025 10:02:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: evergreen_packet3_check:... radeon 0000:1d:00.0: vbo resource
 seems too big for the bo
To: Alex Deucher <alexdeucher@gmail.com>, Borislav Petkov <bp@alien8.de>
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <CADnq5_Oqonrth+5T-83dnFBZ67GvykkPt-9aUepJd+fUMwnupw@mail.gmail.com>
 <20250829194044.GCaLICPKJcGJRYdSfO@fat_crate.local>
 <20250829204840.GEaLISKGTwuScnDF8Y@fat_crate.local>
 <CADnq5_MbpYmC2PSyOr0gQk7F8mVz0-LG3dZtUZS2HhV8LTgDww@mail.gmail.com>
 <20250830174810.GAaLM5WkiFc2BtQ6kW@fat_crate.local>
 <51ae551b-6708-4fcd-84f9-fc1400f02427@mailbox.org>
 <20250901101011.GAaLVxA_Ax0R-Wy2IX@fat_crate.local>
 <2764782f-d411-4142-aa56-f1af0968ecd5@mailbox.org>
 <20250908180022.GHaL8Zto-PsVsPa0e0@fat_crate.local>
 <63b7c020-e589-4644-887e-3922af939009@mailbox.org>
 <20250909161648.GAaMBS8ERsvv3NbJoF@fat_crate.local>
 <CADnq5_MOazXJ4tUNa5uMdkWY7ZCu70M49yG00JsNHB-FO7XNvA@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CADnq5_MOazXJ4tUNa5uMdkWY7ZCu70M49yG00JsNHB-FO7XNvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8200a9-1b51-4a14-8c2c-08ddf0405b2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFlCUUQyTnF0enM1b3U0Q1F3VW54ZmVhUE9HcnpGd2ZmcURnTG01dzNkYW93?=
 =?utf-8?B?WHJFWTU2UHNocGVCZkROTG1yb2xxNDJjdjNCK1ltOFhoV3R6TnlSZVVYZzdX?=
 =?utf-8?B?T1NGMG1mL1pFVWRYL2p5aU81ZHR4WXNzUXNHWDVBTnkrTUlIY3lBS3dmTFda?=
 =?utf-8?B?VDY1NFo1NDBGNkV0V3MyL3p2dFdPMWtDanR4U2NKdjRrVVA2R3VyRWVVVTY0?=
 =?utf-8?B?bkw5aDBNeUZ3T0s2bXVPcWkyVEM2dERHMWdxbklTZHl3ekMyNVdDTWl6VXBu?=
 =?utf-8?B?aGN6SWk2cmMzQUtiRzZWWG9EMzNYWjduZWtHR0Z4dUxhMlc3QW1BMVI4ZkY4?=
 =?utf-8?B?Q0dMcERLUUlGclgzTXFvNWF2b3BZWmlZb1h1YTZTWU5Da1JvbHFQMG04WlY4?=
 =?utf-8?B?K1BpOURiV2c1Z28xY2h1M0p3cTYzUXgzSlQ3T2RLdGJ6ZTRNQ0h2V2J2U2FM?=
 =?utf-8?B?bkpSQW1YZXd4eUdyV1NndE9ZUjdycGcxdE9wOVVaNzU2UTAzMWI5U3ZGbVFH?=
 =?utf-8?B?aXFpQzJMOGhXNUl2c2tkNUZFSitIV3J1ZmpiZjBpcHhXSXV4bkRiekZxMlhq?=
 =?utf-8?B?SWV3cENNRk8vZU80NUM1d092T1N6LzFJc2VLUHNqN2NyOWgvVW5DamFJQndY?=
 =?utf-8?B?M1FzY09MZndFbGY4b3F3UEdHRjI3YkgwenhxU3JCVGQ3VE9ScFVRTGxWY0lR?=
 =?utf-8?B?bGE5SzZ0clpPdEllNGZIWkZPeWpkU051UEY0R3JQMGZ0dDg3aHFybXRrNEYz?=
 =?utf-8?B?d0hZNWFSbUdsaXV0eEtDSDZEU2JTTENEdGtmTnJ0bCsvYWRNd1RIdHRXL0da?=
 =?utf-8?B?SE5pRDN1WjJJczhuSE9VM0J1YU1ScHNOdHRnbUNIY0xhNGF0VHhyZVZGVHd5?=
 =?utf-8?B?V0VyK0NTN1NEWjVSQ0xjUG9NMGNyemhKclFFNGtDeGtLZ01hWVI3TUE1REdH?=
 =?utf-8?B?T0FxdVZHQTIveWFaZXlmcmQrckx5L0dsWWtoRzAxYk9zMHU3d0FOMmR4ODZo?=
 =?utf-8?B?ZEVOS212d1poTnIxcFVNRWNaUjNCSUwvZWVoOVJsRy9aNHFJRDhIUW1ZWG1Y?=
 =?utf-8?B?OVBxOWM0eU85Uk5hYU51TmQ0N3RLZmdrZ01LYTk4YkJYUEFMTlNhVzBZOU9o?=
 =?utf-8?B?NmtsbHF0Wkh3cVZnQ2x4aEJ1WFpqdzNpUS9oUElzdUcxYmFmUUR1QjYrYzMv?=
 =?utf-8?B?TW9PM3VOVmhFbXBoNXZKM1VjSG5Bak9VcUpGMVlJRGloQTUzNXB3SDZRMVJt?=
 =?utf-8?B?MUptckVVd1lZeC9IeVJRSjduV05sQTJJTmIxTTRaY0t6WHdHS1F4cmVRRWFE?=
 =?utf-8?B?cWNEaVhlRmhJNkE3V2hoU091NzVpR2hLaFlvQkpnZHdWc1JlazhQSW5KMzdx?=
 =?utf-8?B?NXZIdnE2c0U1czRhb0hBNVYzVUN4RXZYZ2JmM05lRVJmdDIyZHNHd1NCL2lk?=
 =?utf-8?B?NzQwRnlUMEJiVGpqL3MrczE1bjRoUUQ4VzBZaGhJNEFxYjlVVFpaZjNUcWJy?=
 =?utf-8?B?bXNKUkhmRnBQQU50c1hoTlhOaWo3ZGFIYjFzbDhGdlVDWDhKZUkwbkhoZHY0?=
 =?utf-8?B?KzBsWTdERWdSNnI3c0lybFRsYi95TVRHQmI3Z0pjaDdaWURkaE1YTHh4ZlVP?=
 =?utf-8?B?SWZ4VkNIWEU5aWk5V3JTNU5acm0wc3hFOFArajVqOEp0bzFIWU9ZdUN1RkNx?=
 =?utf-8?B?YnNKeWNTdm1kOVNLeHRiQzlSeE5LaDVUREdEbzBkdGlRaG1OaDhqKzJmMWVF?=
 =?utf-8?B?WWRqeG1sRDdOSmNyeFFZYXJGTlgwZDQvN1hPdkU2alRqUENGeXV4MytpQmNB?=
 =?utf-8?B?dlJjcWFoWlZ0OEtQZFk4cHhJNEQwaXFzK0wvT2kySlJMVEJUTGx2bVBqRmdZ?=
 =?utf-8?Q?T6cVVMBF4f7CM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVNmZlh4d1ZhYU90N2JoNitLL1ZuWmNxZS9YYURVbTdZUkpSQkkvUFNqQnZa?=
 =?utf-8?B?MUQ2WTlGWlhWaEU5MWJLUTh2R1ZEeUh5cm1ZeklTOWhFUms5V2FqdHZsTmZy?=
 =?utf-8?B?azRWTkgyZmtYRVdxQU15aDhJNXBRakJqYWplM1V2cit6ZmdIczF2M3VkTkhO?=
 =?utf-8?B?Mmg5NWtQcDlQU2YyaVU3TXZiZUJYckVoTkJYYS9Sa2ZNbVlhZEl5NHFPTTlM?=
 =?utf-8?B?RERuNE1YTTdDMWt0cFBIZ01BRWVydUdzdGkxQUNLTFhoakNwanV1K0d3bXBI?=
 =?utf-8?B?WUJCSFZsNEhQMWgydWNYMXZ0VDZHSDR0dytiN1A1UThsTGpoMkZ3bTVlUDVm?=
 =?utf-8?B?RGljTzNmeGdIdzdOekFjWC9TTXVJZDZEVnphYzlOTlNOSVNsY2FXWjl0Y3JC?=
 =?utf-8?B?dmR5TVVDdVBZdnVKOEI4K3lPVmc2MURyT0JkeHdFRTYwRWFxc1IwcklXZEhs?=
 =?utf-8?B?a09vajlTcjZ0ZC9HYy9Eelh5bGVQK2lUWFY0aEZGWVh6ZENTb2JZYTBEN29N?=
 =?utf-8?B?L0tNS0h6cEJvaEhYV1hhVEhHUlQ2blVIWjltQ0VwN2FzOWVHYkQwRFpXbTYz?=
 =?utf-8?B?U2ZaeXU5VjBEN3FoTS9VZmp3RVEwUEIwd0haYWZRSUpFMWtQc2ZSK0gyNVRW?=
 =?utf-8?B?T1VWbm04c3BxendEdC9jVVdQb3hxVWpNSHpnTTR4UEVjQXFmTzY3NGFNYWtD?=
 =?utf-8?B?aEZtaHJuOEF2OWRNcjBnUnY1K0VKcTkrdzFoS0ZWeW0rdVJRaXdMQi9tTWUr?=
 =?utf-8?B?K09pdFpkajB1ckVoakZGUDlTMDF5cWdCbDh2L1pTdlRTSG9kYTB3NWViNktY?=
 =?utf-8?B?KzdrS0o5cTMydDlQb1Q5cEZwQmZveFd3OXN6OWxCcHlJTUwzeWp5MG5HZ3dT?=
 =?utf-8?B?ODFXS1B1UHhlSzIxbzBSRzQ3cEEzdG5NVzZZR1VhNWFTYnJwU0pnZUFsZC9Q?=
 =?utf-8?B?aXU3bW9tWGRObW9iYXNrSUF2Z1ZZRGc4cDE4NUxob1VRRkpOeFJiVU5SYUYw?=
 =?utf-8?B?QXozWFA5MmFsRTNYamYzbFAwWUxYZUY5cWFKbmFxY1JuaEdrRkhpS1k1Y0lY?=
 =?utf-8?B?eWNoOFpldWRKdm02UGVrNysyWWRyTWo1VEU2bWcwOHRLNmNEak5Gdmk2L2NX?=
 =?utf-8?B?cGZ3Z0dwemNCN2pRR2prQlBNeDA4UEZ6ZWVLSlJLb2I3c2J5WDdVUE5KTjZL?=
 =?utf-8?B?QjRuUUtKZ1JGUmdQME1iV21IQzhnNUh0MFpSR2JWWWUvbjlkeU9QK2QyVTFx?=
 =?utf-8?B?Rkl3cHF2SnUrek9kM2pXSVlTcHhBbW5ieHk4N3NNS1B3ZTd5eFRNZUJocVZT?=
 =?utf-8?B?ckcxbUJIa3Erc3NVSldTZ2pyalBBZ3MweE9ZTHZtRHM1ejA0UEZobThTdzFS?=
 =?utf-8?B?bTFmTjFaOTdmd3hQYU9YSWpqUmQ4RXB4bFZSbXl6ZlJvYVdiV1N6Z09KOEJM?=
 =?utf-8?B?T1NmUWdWWS9wUkJqVSthQ011MlFYQnF2dzV3QUQxSTRiWE11M09uNnFrdUp2?=
 =?utf-8?B?djFWTG4vc0VxQ1N2VDBtMXNjdzFmZitPTE13T3lINTFuc0N4NW41UVJuZkI2?=
 =?utf-8?B?LzlzYXVZYjUvRHc2SE5hOThBNXcyTUZ0Rmh3TDJKNzJaOG95VnJ0MkZlL2Nr?=
 =?utf-8?B?ZVZmYjF3cVpUOEg3MWNNTHRTTlZpZEFKV3JlbGc4WCtCbHFNMW9NSnV1aUhT?=
 =?utf-8?B?dzFWd0ZhK2puZlVneWRBUnBFaEs1clNjbVphbkZmd09XYkRMN1Z1ZjlVT3p5?=
 =?utf-8?B?TXlUWlc0Vnd3RmhRTDFUb2Vvd3NNMTA1RnVDaDZxTTExbkhCT1J1ZUZIQ1dh?=
 =?utf-8?B?Wno4NHRRRmFzbm9MaFg0bkhnNVlPazYvVjRMa2wwaFhnT0JxdUcxUG9zaHBs?=
 =?utf-8?B?YUpRcjdlaFZtR0RLYVVjblJOV0xQaUV5alZMMm1HSmE4MEFid3I0eDJ5TVNo?=
 =?utf-8?B?RFF0a0dRS3FZc2RlOGdUNXlRZEx6RGE5ZmNYVzBFN0h3eTFYalptY3lZSmp2?=
 =?utf-8?B?b0VOcVhoQ3FWMEV5aW5HajZhVnNuZW5wYk1VdFMvZktwZitTNW9VcktjRlIv?=
 =?utf-8?B?YysyV3dsRGxxYk1Ianh6VlVkVTFUTFN6UFdSc3k4S0htbUZlTWlWOHdDSUhZ?=
 =?utf-8?Q?2wb+VsBQnX9UrfJRKu/abSp6W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8200a9-1b51-4a14-8c2c-08ddf0405b2a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 08:02:15.7901 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFouOXy5uytooGjTh/ASodbnhlVAUdqYHJFhur/WJ5x+vGqCq7NjKBMXP6rSq80O
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6576
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

On 09.09.25 18:21, Alex Deucher wrote:
> On Tue, Sep 9, 2025 at 12:17 PM Borislav Petkov <bp@alien8.de> wrote:
>>
>> On Tue, Sep 09, 2025 at 10:43:47AM +0200, Michel Dänzer wrote:
>>> Then the developer needs to tell the user how to enable the debugging output
>>> and get it to them. That's pretty standard.
>>
>> *IF* the user even notices anything. As said earlier, it didn't cause any
>> anomalies on my machine besides flooding dmesg. Which I look at for obvious
>> reasons but users probably don't.
> 
> Right.  I think there needs to be something otherwise no one will notice at all.

Well doesn't the cause of the warning result in corrupted rendering?

Christian.

> 
> Alex
> 
>>
>> --
>> Regards/Gruss,
>>     Boris.
>>
>> https://people.kernel.org/tglx/notes-about-netiquette

