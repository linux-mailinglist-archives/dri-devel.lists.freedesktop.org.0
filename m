Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1837CA73AB
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 11:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2A6F10EAB0;
	Fri,  5 Dec 2025 10:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yww97Wyu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012015.outbound.protection.outlook.com
 [40.107.200.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A08510EAAE;
 Fri,  5 Dec 2025 10:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDURZKWQrH/v2Bc4a6WZ8z91aBuAut5AAEtIzhBCUKJcYn1N0o0TOEDjVUhdHTauo8rQXAJsbppyDA3pq0IeZvauPiyAfHutDJtzAVoqWjCxkoL6mTBI+h5KI54+5LGF/Zy7Vy1t3xshO54tryi/YnNtupN6pFXrS7oKEztPVokcbCGMmSyCKZfZWaU+bk3YfKjz6MRW5UpRzUdpxDA7UBLgZ1ZN8yQHe4jtxooM3KSpDrAyYpgPKjM0ZcEE4kgo66U7DPwBcnaUD6kCektZD9aSnAzCMzTpOT7Swl3sHRF/UaKl0etTrq6FCqSP2885O7kijGIm/q++Tr5hyr3Ltw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqvS4rX/k2vJV0fIpc9IvI/YSxS1zD5bznQ0I6OQmAY=;
 b=HBn+viTRIiOw6gvRcSiOhYJwgohMEipVERkVjAMdGRc7X69qWuZjNL1R6pfg/LiBqZySHhBovQtDlQNvrTA5Mu1e+oFRp4XiokJou/wg/5pT1HqjTa1BASAdIXPU3tn05gYeIjVJVvgWNW6ECTEzbhBFuXbLZDU+B3HW5z/+2jDELvlbYiJQyKPFvb+lT8vVLKn+1aOq6A/q/69SXhDfqeiR5I3sTxWOT0kHHbXowP7tyKbmPRCINpR9KvAOGSj3oGJHKKqpC+OVyWyXvE01Lcs0fWH7zHU/eDZJX1/sdSIheTHArTJ8IY3xuc4ZhiAYwLJRmr+GKTOCIiIDKtSd/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RqvS4rX/k2vJV0fIpc9IvI/YSxS1zD5bznQ0I6OQmAY=;
 b=yww97WyuIS4Y4mXRwdNAoJxn9BIBKEoMHyaY9c/d4vZX7mBsdk0Kvo5t4Foe5t/+iHQEkKziIhHcWNANsmT9g87iHewQyU3j774L3/XuWryZVIipoCSeCfgjPZFHQj0KQZihu4AtxizSIXpRdjf8UiErp8Xc28J8EI9lYB1cZXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB7091.namprd12.prod.outlook.com (2603:10b6:806:2d5::17)
 by CH3PR12MB7716.namprd12.prod.outlook.com (2603:10b6:610:145::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 10:46:02 +0000
Received: from SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::d759:a62b:f8ba:461d]) by SA0PR12MB7091.namprd12.prod.outlook.com
 ([fe80::d759:a62b:f8ba:461d%4]) with mapi id 15.20.9388.011; Fri, 5 Dec 2025
 10:46:02 +0000
Message-ID: <17ef8c7e-f3ab-475f-9379-1e8f631a3ac3@amd.com>
Date: Fri, 5 Dec 2025 16:15:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] drm/amdgpu: add UMA allocation interfaces to sysfs
From: "Lazar, Lijo" <lijo.lazar@amd.com>
To: "Yo-Jung Leo Lin (AMD)" <Leo.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 "Tsao, Anson" <anson.tsao@amd.com>,
 "Mario Limonciello (AMD) (kernel.org)" <superm1@kernel.org>
References: <20251205-vram-carveout-tuning-for-upstream-v5-0-1e87cf3b57be@amd.com>
 <20251205-vram-carveout-tuning-for-upstream-v5-4-1e87cf3b57be@amd.com>
 <3ed39b79-ade6-437b-bfd2-9bd8a3779732@amd.com>
Content-Language: en-US
In-Reply-To: <3ed39b79-ade6-437b-bfd2-9bd8a3779732@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0109.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::10) To SJ0PR12MB7082.namprd12.prod.outlook.com
 (2603:10b6:a03:4ae::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB7091:EE_|CH3PR12MB7716:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c20d7a6-009d-4c5e-06ed-08de33eb7bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TmxENUNEY1ZJc2dLSkpnNnJVNTFjNGQ5SzR3UGdBdWYrQlBnbG5vai96L1NL?=
 =?utf-8?B?K1pPdFA4WG9GM2N2UHV4czVKbjVETHN5ZnF5c2FBcHZCcU1KbHpCS1U1Q3Vo?=
 =?utf-8?B?Tzc3ZUducTlHN1hLam0ybE1pdDhtcFBteUx0V2FVWUdJSjlvQmhWUVMrc1RF?=
 =?utf-8?B?OFB4Qk5KTE1sRk9VMnNaRC9Ebk1JQS9nQWIzeHovckxOOUJQbkRDUU1SS0Iv?=
 =?utf-8?B?SENvNVc5dlhkMTQyckJmQmdnZmc3ZXRlZU5vQ3VWWnY4RkJWd3ZwT1ZWVkJQ?=
 =?utf-8?B?YTZWMFVWbCt5SWJFK295TlM0eXpvTlBkeVE1cks3eVo0NUIvQ1V0ZlBPaEdO?=
 =?utf-8?B?RzUwU05CYW41UWcxUFpQTVd6Uk53MVJJUTdhUC93QnByV1VTS3Z3b0ErZ3B2?=
 =?utf-8?B?ZXU2T2xVcVJHdnpOOFkxU2pBSnRtT0FLVE9uNmhtckF0V2Y1QXZ1ZWwrYW9r?=
 =?utf-8?B?OEFtcFhBT1kralhZa3pWbFBPa3NVdWlpTk9Eb1NPUjA3Z2hSeUg3cVZDWHdZ?=
 =?utf-8?B?R21CRmIwZE1KQmhDeUk4WitwR0VEK081b2s3VFNPWTlZNWJ1TEpoUHQxV1E2?=
 =?utf-8?B?dEZyMVZMVWtPd1NPZEFvVXhqYVU5Y0t6OUdqK3hodkFCSmtYVzlHQ0w1dWpl?=
 =?utf-8?B?ekdRK0NaL2JqTjNwOVZVaWNFbGZFZGVtMjJyRnAxSXpwcWtZT2lMTmI2M05u?=
 =?utf-8?B?UFppVTJHY2RISnhmOEp3MnIwZ1NGNW9NVHpOS1VHb2RJaVpCbS9kbVpGUmRI?=
 =?utf-8?B?RFlzbW1FUWc4bW93bUlCeHdFazZPMWNwREFneVI0TWhHclNxUTlNSk9Gd0s2?=
 =?utf-8?B?QmR5N1pTeWttekJXNXVsOUhoWE9RSFlqYVhqejNWd2NXNENiTDdML1Qzdldz?=
 =?utf-8?B?d2dHbVFzYUxXZjdpMW5Pa0R4REpnZWZSWnBIRytDODdvMlJSYnJjYnIweGF0?=
 =?utf-8?B?MUZwOTAwU0tZMWRCK3hJQTBrTzJ6MjJEOEdhTkhnRDlXSkQyNTNrN2dFVXBu?=
 =?utf-8?B?TlBhekxEMjNXdzJVdDZRWVc4eEZoTkhMMDZhY3JMTjNYOWlQcm9BR0hLcXMy?=
 =?utf-8?B?YUJVTitUZEVueloybllOdXYwVExJYnVLVi80OW9ycWEwWVM0VTJQQS8xaHBs?=
 =?utf-8?B?ODBtc3lmMlM1NXNLYU4xZmtNNnVYWXp0N0o4Q0QzSWFhWGpNRXFyVGFEdVZ3?=
 =?utf-8?B?YVlMQzE2R0sxemdiREVHd2FDcCtHL1A1NVAyYW95eE5qYWZuUC9QdUxvV3Zl?=
 =?utf-8?B?ZWUwUENmRGNZSjR5d1loN00xdFk2cTduRUY2bVE3KzRrQTh3alpUK0xQRFNa?=
 =?utf-8?B?TXJPYTI1U1FIRHMyd1o3MEdKWTRGeVFzaHdGaVJvR1V5bVlxY1ZOQUdZQjhC?=
 =?utf-8?B?MW9uUGNoMnhqQkN5Tmo4SC9tN0FGVHJLTXpIMDlvWmZXWlhXSncvM0dDK0R5?=
 =?utf-8?B?SElzc2F3TlN5YzZOMFdoT05aZVhBU0xscWE1S2tWNkYxMG85bktmQkVwZ0Mx?=
 =?utf-8?B?a2pOaGIwWVZQYU5Vc2toclB2Z2t1eEhMN2ZMWXdQQmRTS3kwb3lFb0pGcTk5?=
 =?utf-8?B?b3ZFUmRrV2VMQjNUSGZmaThFNmJvSVNlcFhXYW9qRW1zbGJhNklCajIyUkox?=
 =?utf-8?B?VWJ6QmRzdU5wdUhzdEFlZmtCZWRVdnJmaVMxTnJOTDljRzRZbG11WjFXT2Nh?=
 =?utf-8?B?MGYxUkRnNG93RW9TaGtqNHVpMmtyT2NKeFV0eGVLZ25QRGVlR24zdWFvMzhh?=
 =?utf-8?B?SVZRc3FibkdVd2R6RjVUcm9QMWIxcFR3cVNjdk54Z2x6cHJGeTZFTFA1NXdN?=
 =?utf-8?B?YXpaY1dnSGhKNEtLK2VpNkMrOEFFOUhQL1B6Q1lWTWt6ZWR2cmRFZnlyeFpm?=
 =?utf-8?B?dk9OYWRodk1RYWlBRHkrb2x1aDBsRk5mcXpERDdadFFSSmVSRlc3TUE3NHhM?=
 =?utf-8?Q?d+XejBOgHfv7pyZ6GOu0MBiV8RHzEpnF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA0PR12MB7091.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXhZYzVFV0NzRUVBRk84NmVYbkhjVGQ0UjlMUmZXZS9TKzBJaFQwQXRQUEtP?=
 =?utf-8?B?Z1BuQUxDalRhV0UwNUxacFdndkhPSDBVU2VDcS85bXdJclNGTVkxVU55Skc0?=
 =?utf-8?B?anhWcGQzbnhiQmJpOStOdzY4c3k4TDRZZ3FhYTdWUFR0RU9SM255NitwYzcx?=
 =?utf-8?B?Z1Vrb0MrVjJkTzZ2Y01oZkVaR3I0NlhCZ2xXcng4MVRmSUp1cmptTnB2SWxT?=
 =?utf-8?B?WjdFM0h3bGxCY0Zpam1HZU5aeVBTK1RTeU1hRExVclhvMzZER05RL2Fubldo?=
 =?utf-8?B?ZjFMS2F3YmU0S2ttVFlrODdxMXZmaU9zOXhRRUpMMWJiRU4zODJtSGpKL3FK?=
 =?utf-8?B?VlExS1hZN2pSeEZhU2tZelZwaiswbTYxUWJKSlhpL1F3TEVpZmgwaGI4SFVz?=
 =?utf-8?B?L2lNZitqSzNzdk1tSE0yOGdTb05VZ0NjTTNPOWNHenloYmljTmdJaUJNVDBt?=
 =?utf-8?B?anZzTk5SRTlrN3l2VDMxaFlPY2RNRUVRdldvVCt4OXBMUG5rcWovWUU5dWhr?=
 =?utf-8?B?dEV0ZkZZRGo4Tnh0K3hUNHBnYjM2SkVJMWM0R3g3MFBqVkFsRmMrZHY2aTJt?=
 =?utf-8?B?RUtxYzNiYjFxV0UzazdPYU53cFRZZGovdTFaTWRVL2ZqS01pMVMyU1o2YlE4?=
 =?utf-8?B?SmNXNTRTeXY2cjhTQ2ltM3IwMElnNkhsSUhNbkpKZHgxRHl2RUs3Z25Bd2w1?=
 =?utf-8?B?bEFpcGY3WXhGRDk2UGx0c2w5MW9ndGFteDJ0cEJ1TEx1cmFXU2taMVRyY3VU?=
 =?utf-8?B?elFBR1FLMGhaVURkVHJraTFwY3NhaDd2d2VJTXpnaWtoYXZmQnZuaUZXK00w?=
 =?utf-8?B?U05RcldOTm0yeVZIRGFtVGJqMzhSUG1GVDdSMGtzU25OLzJId3lFenZqL3BR?=
 =?utf-8?B?MDR1WWo0SDZscE0wZyswMWZLTnRJU2VLbnhuQjhBZHVYSnRqVGVpT2dnUytX?=
 =?utf-8?B?S1ZwMXV6MCtNcVFNOVlKc0hFdFpMeE5Tam9yWks1SC9xYUxjWUN1UU9tdzVK?=
 =?utf-8?B?ak5qL3VOQkx6UzZzWTJiZCtQblhtblcwek85N0hDc2tlQWdsREdPdGE3WG5Z?=
 =?utf-8?B?aUVoVm9iVnN5eDBkeHFvbmIrN0FSVjE3ZGFUMmROc3J0bFBZaU5xYWlZakMv?=
 =?utf-8?B?blREM1BLcUlZVFRhUFdHVW1tNjRrck0wLzlUOWdUeHgwMWh1eFVCYTFTbGJH?=
 =?utf-8?B?UjJMODRsYk05Qy9idzlUOGFiNnRGVTRhNVpvQjFLWkV5WmpMZDNRd0hrbktr?=
 =?utf-8?B?bytGR2JhSytUZGxmOEY5Q3pyVUU2SExDZVVXdzJpb2padDJiMkE5ZVpNalpD?=
 =?utf-8?B?UWEvdGFxbjZlbVFkTEQ2bEhobFJzM0dYekEzZCs1a1Z1c1l3SG5kQ2ZVNHlR?=
 =?utf-8?B?ZVhhbU84NjZ5NjFnbE9xNFFJMUw4Wlh5TG4xNTkvWHBuYnk0Y1pKbDA5OGtT?=
 =?utf-8?B?cmI1ZFRScWd4a3I1NFMzSi9GU3ordzFtU1orbnpCU3F4L1dSQzlwbXhjOFFV?=
 =?utf-8?B?VS93UUlLa1FuaEh4R1J0MFhSOUlXblRMWGFCaHBQTTkrV09UVUttK0FPNjlT?=
 =?utf-8?B?OVRKa1BKa0VOSzlxY2FScHdSdzl3aDhoT2JvVTJqTFJ2TitqaXdLTTl4NWts?=
 =?utf-8?B?OE1iTmoxUnlBUDlJd0JhTXc2Vm1vc29Pb1FVNUtMY1VvZVlHNXFuWTQrdW16?=
 =?utf-8?B?SzBET3puNWNFMmQ5ZmIzUEZzZDJPL2t3QWRjMzRqZEFmSTBmd0o3Vnp2UlVn?=
 =?utf-8?B?c1hFMkFrYzd6YWM0a2w1NW5vUkZsT3JJb0lqclRCaG1xQmlFM3RSUEdHNVJ6?=
 =?utf-8?B?a3BmYmVaWjEyKytTamZTUW9haXNpZytCMit1UzVuM1NoTjl3bkdlRkdwR2hj?=
 =?utf-8?B?NXc1SFoyQmNLcFgvTnBUMlE2Z0VFam5MNE9zM2FtT2VJWU9yYlVkRWNQU1dW?=
 =?utf-8?B?YXkwYUFPUXlma0JUaFUrTEcxSFR6cnUwTWpPMExab1Q2c2ZYM3M3MC9ZWlNy?=
 =?utf-8?B?U2hUK1pBRVc4MkNJbU5WTHBSeDRMd3A0WkNCSy9nd1l2SEkwVUc4Wm1oUElo?=
 =?utf-8?B?OWpKUVlEbXhraFoyL2k2eU5hays3R3ZHemF5N2RmMVUrWHhkUWx5a2NEVWNW?=
 =?utf-8?Q?y6PMvTIXFkMRtIyemzQmjvkTg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c20d7a6-009d-4c5e-06ed-08de33eb7bd3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7082.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 10:46:02.7332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oW3fLTlSaLw7rbFnItJIR9pIyFmVbbdPDKddDumu58noqr8zWxu2YQeZIiqthH4k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7716
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



On 12/5/2025 4:04 PM, Lazar, Lijo wrote:
> 
> 
> On 12/5/2025 12:20 PM, Yo-Jung Leo Lin (AMD) wrote:
>> Add a uma/ directory containing two sysfs files as interfaces to
>> inspect or change UMA carveout size. These files are:
>>
>> - uma/carveout_options: a read-only file listing all the available
>>    UMA allocation options and their index.
>>
>> - uma/carveout: a file that is both readable and writable. On read,
>>    it shows the index of the current setting. Writing a valid index
>>    into this file allows users to change the UMA carveout size to that
>>    option on the next boot.
>>
>> Co-developed-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
>> Signed-off-by: Yo-Jung Leo Lin (AMD) <Leo.Lin@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   4 +
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c   |   7 ++
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 138 +++++++++++++++++++ 
>> ++++++++++
>>   3 files changed, 149 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/ 
>> amd/amdgpu/amdgpu.h
>> index 6bf626a51dfc..177376ff5811 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>> @@ -1846,4 +1846,8 @@ void amdgpu_device_set_uid(struct amdgpu_uid 
>> *uid_info,
>>                  uint64_t uid);
>>   uint64_t amdgpu_device_get_uid(struct amdgpu_uid *uid_info,
>>                      enum amdgpu_uid_type type, uint8_t inst);
>> +
>> +int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev);
>> +void amdgpu_acpi_uma_option_fini(struct amdgpu_device *adev);
>> +
>>   #endif
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/ 
>> drm/amd/amdgpu/amdgpu_acpi.c
>> index bdafcde51107..b2779fc2f712 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>> @@ -1288,6 +1288,12 @@ static int amdgpu_acpi_event(struct 
>> notifier_block *nb,
>>   int amdgpu_acpi_init(struct amdgpu_device *adev)
>>   {
>>       struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
>> +    int rc;
>> +
>> +    rc = amdgpu_acpi_uma_option_init(adev);
>> +
>> +    if (rc)
>> +        drm_dbg(adev_to_drm(adev), "Not creating uma carveout 
>> interfaces: %d", rc);
>>       if (atif->notifications.brightness_change) {
>>           if (adev->dc_enabled) {
>> @@ -1340,6 +1346,7 @@ void amdgpu_acpi_get_backlight_caps(struct 
>> amdgpu_dm_backlight_caps *caps)
>>   void amdgpu_acpi_fini(struct amdgpu_device *adev)
>>   {
>>       unregister_acpi_notifier(&adev->acpi_nb);
>> +    amdgpu_acpi_uma_option_fini(adev);
>>   }
>>   /**
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/ 
>> drm/amd/amdgpu/amdgpu_device.c
>> index a7594ae44b20..979298d9c213 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -36,6 +36,7 @@
>>   #include <linux/pci.h>
>>   #include <linux/pci-p2pdma.h>
>>   #include <linux/apple-gmux.h>
>> +#include <linux/nospec.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_client_event.h>
>> @@ -7835,3 +7836,140 @@ u64 amdgpu_device_get_uid(struct amdgpu_uid 
>> *uid_info,
>>       return uid_info->uid[type][inst];
>>   }
>> +
>> +static ssize_t carveout_options_show(struct device *dev,
>> +                     struct device_attribute *attr,
>> +                     char *buf)
>> +{
>> +    struct drm_device *ddev = dev_get_drvdata(dev);
>> +    struct amdgpu_device *adev = drm_to_adev(ddev);
>> +    struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
>> +    uint32_t memory_carved;
>> +    ssize_t size = 0;
>> +
>> +    if (!uma_info || !uma_info->num_entries)
>> +        return -ENODEV;
>> +
>> +    for (int i = 0; i < uma_info->num_entries; i++) {
>> +        memory_carved = uma_info->entries[i].memory_carved_mb;
>> +        if (memory_carved >= SZ_1G/SZ_1M) {
>> +            size += sysfs_emit_at(buf, size, "%d: %s (%u GB)\n",
>> +                          i,
>> +                          uma_info->entries[i].name,
>> +                          memory_carved >> 10);
>> +        } else {
>> +            size += sysfs_emit_at(buf, size, "%d: %s (%u MB)\n",
>> +                          i,
>> +                          uma_info->entries[i].name,
>> +                          memory_carved);
>> +        }
>> +    }
>> +
>> +    return size;
>> +}
>> +static DEVICE_ATTR_RO(carveout_options);
>> +
>> +static ssize_t carveout_show(struct device *dev,
>> +                 struct device_attribute *attr,
>> +                 char *buf)
>> +{
>> +    struct drm_device *ddev = dev_get_drvdata(dev);
>> +    struct amdgpu_device *adev = drm_to_adev(ddev);
>> +
>> +    return sysfs_emit(buf, "%u\n", adev->uma_info.uma_option_index);
>> +}
>> +
>> +static ssize_t carveout_store(struct device *dev,
>> +                  struct device_attribute *attr,
>> +                  const char *buf, size_t count)
>> +{
>> +    struct drm_device *ddev = dev_get_drvdata(dev);
>> +    struct amdgpu_device *adev = drm_to_adev(ddev);
>> +    struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
>> +    struct amdgpu_uma_carveout_option *opt;
>> +    unsigned long val;
>> +    uint8_t flags;
>> +    int r;
>> +
>> +    r = kstrtoul(buf, 10, &val);
>> +    if (r)
>> +        return r;
>> +
>> +    if (val >= uma_info->num_entries)
>> +        return -EINVAL;
>> +
>> +    val = array_index_nospec(val, uma_info->num_entries);
>> +    opt = &uma_info->entries[val];
>> +
>> +    if (!(opt->flags & AMDGPU_UMA_FLAG_AUTO) &&
>> +        !(opt->flags & AMDGPU_UMA_FLAG_CUSTOM)) {
>> +        drm_err_once(ddev, "Option %lu not supported due to lack of 
>> Custom/Auto flag", val);
>> +        return -EINVAL;
>> +    }
>> +
>> +    flags = opt->flags;
>> +    flags &= ~((flags & AMDGPU_UMA_FLAG_AUTO) >> 1);
>> +
>> +    guard(mutex)(&uma_info->update_lock);
>> +
>> +    r = amdgpu_acpi_set_uma_allocation_size(adev, val, flags);
>> +    if (r)
>> +        return r;
>> +
>> +    uma_info->uma_option_index = val;
>> +
>> +    return count;
>> +}
>> +static DEVICE_ATTR_RW(carveout);
>> +
>> +static struct attribute *amdgpu_uma_attrs[] = {
>> +    &dev_attr_carveout.attr,
>> +    &dev_attr_carveout_options.attr,
>> +    NULL
>> +};
>> +
>> +const struct attribute_group amdgpu_uma_attr_group = {
>> +    .name = "uma",
>> +    .attrs = amdgpu_uma_attrs
>> +};
>> +
>> +int amdgpu_acpi_uma_option_init(struct amdgpu_device *adev)
>> +{
> 
> To clarify on the comment about moving this to amdgpu_device -
> 
> UMA option is a device specific option which could be set through acpi. 
> Options are retrieved through atom tables.
> 
> So the function names remain amdgpu_device_uma_option_init/fini() and 
> init/fini are called within amdgpu_device.c
> 

Couple of additional comments below -

> Thanks,
> Lijo
> 
>> +    int rc;
>> +

It's better to have an early exit from here itself if it's not APU. 
Otherwise, the dbg prints will show up even on dGPUs.

There also needs to be a check for availability of BIOS (adev->bios) and 
(adev->is_atom_fw). For example in Instinct APUs, driver doesn't read 
bios image (adev->bios is NULL).

Thanks,
Lijo

>> +    if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
>> +        return -ENODEV;
>> +
>> +    rc = amdgpu_atomfirmware_get_uma_carveout_info(adev, &adev- 
>> >uma_info);
>> +    if (rc) {
>> +        drm_dbg(adev_to_drm(adev),
>> +            "Failed to parse UMA carveout info from VBIOS: %d\n", rc);
>> +        goto out_info;
>> +    }
>> +
>> +    mutex_init(&adev->uma_info.update_lock);
>> +
>> +    rc = devm_device_add_group(adev->dev, &amdgpu_uma_attr_group);
>> +    if (rc) {
>> +        drm_dbg(adev_to_drm(adev), "Failed to add UMA carveout sysfs 
>> interfaces %d\n", rc);
>> +        goto out_attr;
>> +    }
>> +
>> +    return 0;
>> +
>> +out_attr:
>> +    mutex_destroy(&adev->uma_info.update_lock);
>> +out_info:
>> +    return rc;
>> +}
>> +
>> +void amdgpu_acpi_uma_option_fini(struct amdgpu_device *adev)
>> +{
>> +    struct amdgpu_uma_carveout_info *uma_info = &adev->uma_info;
>> +
>> +    if (!amdgpu_acpi_is_set_uma_allocation_size_supported())
>> +        return;
>> +
>> +    mutex_destroy(&uma_info->update_lock);
>> +    uma_info->num_entries = 0;
>> +}
>>
> 

