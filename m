Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULTCKRvJqmlWXAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:31:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 165DB220A99
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 13:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1252810ED22;
	Fri,  6 Mar 2026 12:31:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GoDHlNLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012032.outbound.protection.outlook.com [40.107.209.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2710710ED22
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 12:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e0pPmZpJCGXkWXYz/4xqWcuOKmHEuAHL+xlfQuK+ibu1wOP5MkwhLXCyhWpYOvsQ+KokNQVXj44jsMo9ZoIngsAz8/++/pcSdWhC5uJE6y8FBPT3ZoYLMyCS7whn0TnCV5b+spVb0d7iN7DbUOe5vw2V2k9qPpHzi91boPljwmKcQLBDH4ralHvM2q4PxD+P2/e7f2ivFFCK03j8ipeeEUuwjM4WcoCxqW014HmADt6WkJuFNU7VYo2D2t5eLsbyUGBl+VD2JzPWEXUd1CxozFb/e2DPgDNFrFjaBlpRIk3aN+6sa3knK9viCb/mLgBsh7rQtuDiEEWNCIikHyty1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K8MPjUlQeCjpk1IjjApXx0+9Hmv0IaDMdOamVlmqrg=;
 b=lt9XRPauuAbBEEg/227AS7NvYX1m5ZQ8rd1QxMCIRvcfd7/v8m3FV2Ffa2YQaRMpdsARG2MJabCqdGJSeybKfnkPvpqfcwk6ugEEsU0zasdKQqiNtLhvssRaIE6eI5DhlXEi21a6pzN1ThtAGSPSdaZxJR0LK9DtVOcKhKxX/HeTvYtsYryHgSq15uWlmSGNUKoflV7YdC5WgNRoDBTiPhWWWl8eqy9QHHNv2XVOJ+ztD3htyMz51zNBbHoefLHu/t7nu9LmiMIrls5QHCqeVZvCjGvQT+J1Xcx1oKm1PyiInsTplWXC1bDo5E2L7JtvpnvUX2aA6yymvxuRa5owKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2K8MPjUlQeCjpk1IjjApXx0+9Hmv0IaDMdOamVlmqrg=;
 b=GoDHlNLYWrrxwAWCFKL7f0qlKHQsj5W1KNjOZn27dbYC8ApKZmpD6l81cC6TPA0Fra+JxwH3ahaCssFvnvatM1ZAQxfmcTRCIOpKQ/llTooX8b/E+nyKCnLYRgVhdXbETcnI1ZSK8M4oCIahJc9TQFZsKL0w2doOxh/ACBdHj/o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB5666.namprd12.prod.outlook.com (2603:10b6:303:188::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 12:31:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 12:31:17 +0000
Message-ID: <0009b35c-265f-43ff-84bc-39fbf7109a3d@amd.com>
Date: Fri, 6 Mar 2026 13:31:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: dma_fence: force users to take the lock manually
To: phasta@kernel.org, Boris Brezillon <boris.brezillon@collabora.com>
Cc: dakr@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
References: <080395923c92ef758ca6062f1e01392186413015.camel@mailbox.org>
 <718ad034-8fc2-4b43-9b04-729c5befc3ca@amd.com>
 <20260305161212.7dfbadbd@fedora>
 <e8b47e9f-f8cd-4be4-953a-931816e5f429@amd.com>
 <20260306104646.36319162@fedora>
 <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
 <20260306113723.1f13010c@fedora>
 <b5830a15-af9f-47b0-a811-d43c0c3828dd@amd.com>
 <20260306122417.6febebf4@fedora>
 <6246da89fed7669247527fc36bfee5d92ada96e3.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <6246da89fed7669247527fc36bfee5d92ada96e3.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0120.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB5666:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa06649-ad5c-4c36-6047-08de7b7c43b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 4XDHMP75K0KixyYqQ2QPFThwZ2hG/ISHAhI86jFEseKxTrcAeOFc/qmiVfmUzUVnSp044sMI+INrKbAPlqXGBHURnZpu+QTUdbGAIxdK4upL6FyEcmfy+o8U14GANGUCkjoD1uQCffOpANPfEfS2K02PqLaQaCTvGLhEI4dr/2QvkiENio6hppMVTaWffb4/Ii+yxUrPlNQU9KpUpoWtja1fyI7iXJ8DyxS6LU6WxEheQmpABoV7GuJBbPW10YEQlRHoMP64FxnrzO8eUPQfvWw5EbPZ5C5mfmF41D1qlsNvPwCsdnAD4Zjp+JGLmz1oIdobAQ7nEU+7H/JXkNBqur2VolTNwQ4ApN+dUbEIxIIkulVJeCIVaU/m4aYQCpJRvs17KzmxJ/rVte2dXhxkVAHWkv7yzqZ1TI5fwolvpTPBwX3jBOgwxizvNSalov36pFKONKZ2tv+MgAYZN9nYdNNuQrT1gLZ26mUuKPdCqqEern1dOkvS70yVHOjw5YZaAjjNFuupVFXerEGPLmILRHl0ar7bkKNJ+v4IqgQQQUZ64lTWcJvi9S4m11JwPFreF7HXZNXnV63+hx6HfhNzfYWJoaXU11Xl3mxdMtsA2pQbB8HL8cFSqrB2KSWkzS2qKTwCGepFtDsWw7ZgWCOMOfwupuUTFaGFgnk5OVPYGv10vDkv/dCmYQO18IBlt0T6bxJlgTP2gZlPjMicaU3w6QhPxosh60iaaZuEumPQfVI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFVnOVp0WnU4UVlLeEsvNWpxaHBCWDJNNTlaZlgyeXEvSjZHN0E5VlVnM1Fr?=
 =?utf-8?B?Yk5XbUc1WVVqeFAwR2lpVHZxMzk2NWh3RUdNMWozNkpCS2lEMHRVNmZUN08w?=
 =?utf-8?B?ckdBWjE3Q2xGQmtzUmdXaTU1bWJnNnI4cDNZQ3NwN09LYXczSXhXZE15Q0dl?=
 =?utf-8?B?Q0RZZEhSZXNSczBnb2tLWXhiZkhpSTlyMlUzM2ZpZThCTGtSVGNJS1BnckdZ?=
 =?utf-8?B?aElPdHZYS1Q3Si9KV3F5YnNKeXJwK3MyUkFGY2pjQkRMa3dlaUpuWDd0RmRq?=
 =?utf-8?B?Sy9OZUpsU1g1c09tUGxDZUpTZ3gzOFYxeFE5ckJPekhBWGVBNzdHTmdNSE5G?=
 =?utf-8?B?RTA3MDg2MnBWNWl6NXkzZzZydlRIUWZnZ3lQeUdxVlFhckY3a3M1MjA4YmZW?=
 =?utf-8?B?SFFZOTR5TVdQVHhtamNVdXZyTTR0aFA1OWVSRG9keDMxRU5UaXNkMU5TTEN6?=
 =?utf-8?B?R2wraVFCc05mTEwrbHR1emhXQ09zdG52T3VnS3ZHY1JnbDJnN1FYU2xVVUVJ?=
 =?utf-8?B?Z0NkeW9Hcm1zVzVnQnhMeHlZcTFRbkJZanRZemFGLzRPT01aZVRWUDlhTnFN?=
 =?utf-8?B?NE0wZUtGQUF0aVIvNUxjTnF4RFpGaE9wc01DUVJhSTNrQU1PVDF3YUMxcmZq?=
 =?utf-8?B?K2hrdmsrRzRva3hmM21RQ1JJaC9TWnUrTVRmU29rQjZSMFRNRmJScWpDeVdO?=
 =?utf-8?B?Mmp5aXVTZHBtdDUvWUNTWDVXU1N0cEloRGJ3UHJ1ZEtwWDF4SERtbStCQ21x?=
 =?utf-8?B?OWd0M1VncThjdDl6YUg1anl1eUxXR3k2QzgvNkY2TDN5SXNTMStKNk1JTDRY?=
 =?utf-8?B?WFFIbW9aK3QvaFhFUGhFVlRSYXFkRDVWUUIyZStQbXR1YTZSa1c0UzFldkxr?=
 =?utf-8?B?TkdiM0J2Mm1PbzIzeHhDeG1NSk1oMVNML3ZXbVdJSmo5TjBJUHJoNWRsZmpv?=
 =?utf-8?B?Yk8xd2lkaEJXenhUUExxQ0s1LzNtMi9FZzI2WWg1amtWa01RMmUzLy9JcjlU?=
 =?utf-8?B?OWRoUTNwM3E0ZHFINjNHNU1ZYnJtcDdhblpiYm5WK0tWWGlJYjlhd0JhdVhx?=
 =?utf-8?B?V1JxUWRGMDBqUHI3MW9aNWVTK2kvMU5CM01weG1xdytuSXBZNDJ3NWk3VmVz?=
 =?utf-8?B?MkJhSkpid1hZSjZkM3V3OVI2cFRyWW9GVDRvMitiTXBMc0Vtd1krS3JzTWZS?=
 =?utf-8?B?dUhmRXJRVHF3ZGhhNmtZS0E2Zko3U3VCZUdsVE1UQnAvbEI0YUxVbGZ5NXBR?=
 =?utf-8?B?dWM2SHRTbWpaejhBOXF4L21YdE8zL3BKRWIyU3ZWM3hYNnMwS1N5c0pnelRM?=
 =?utf-8?B?bHVBcS9PTXJzKzhSMW9TS09MOE1VWDRlMG5jaHBCVkhMK3lrLzNUMDFCdXZk?=
 =?utf-8?B?eFpRY2lzZ253STJKTkVKZWRUbWxoRFUyclEwTXVYcFE2NnJzYWNpMVAvOEtS?=
 =?utf-8?B?ckpKcDc3S1FnbFFMQmNnUnppUDFtWUhZZUxVRk5aTnRNTHJoOW8wbzE0YkJU?=
 =?utf-8?B?NUxqRzFsd2xza2JhamlaN3BscDBUS2I4ZlJmWmdkekVQd2pIanhhc0pmVm1q?=
 =?utf-8?B?Z1lKYytzVEdtM2lCcUhlZUdveVpKQzFIZk9pRTYyYVNia0J5WmNQL212Y25C?=
 =?utf-8?B?RkdLQ0hyc3Z0bzN3ZVZlM1R4WFVFZHZxYmVjeHl0NWhZQ2JuKzk4TXV2cHNP?=
 =?utf-8?B?eWs3V1l2emJHaVhNL2tKVEt5QXd3bndibWRJa2JjWmNWMllDNkZQUWlpVG8y?=
 =?utf-8?B?K1h1ZVFLekRIS3RxcVlGTWh4cS91d2FJek1CNDJGUEJsYWJEMDBZRnJjU3Rr?=
 =?utf-8?B?dWxZd3MvSHhIVEhLY0l5TGRyQ0dJWFA3cTZKOCtnQUJwRHNIWmE5dVo3N3Aw?=
 =?utf-8?B?cjErNHRJeWNoTE1tbVhJcVpoeVpnT1M2QXRKTStaYkVLeDloaXhIdmZvRTkv?=
 =?utf-8?B?M3BIbWh4cFlDMWxYbEJtaDhOMGxrR0dPUHl0cE1OR1ZyTERXeVdWVmNKQk1t?=
 =?utf-8?B?THdwdFU5VzdLUG1ud0hjamphVjhUd2VIcTVlQmNDS3hnUWducUk5UUM2am5Y?=
 =?utf-8?B?aVdZanVZWHRlZlRFSlNJbTYwTVE5dlZZUG1PUXllMEYwUCtOYWtycmtWL244?=
 =?utf-8?B?djVOVVFrOXUrdWl1Ui9vRW9iRGJVamtkNDJNUjRIMUhYWEFHalQvODNXZHJ0?=
 =?utf-8?B?QkNCRkl2ZkJ1WGlLQ1YyL2ExekFyTCtlZ3NDWXVDYXN3SW1BVVVISk9sSmtn?=
 =?utf-8?B?WUJIb1NLZDZaK01TWlM2SEhHNXJtVG5yVGI4cExPcGFHM0FPQmFoa1plaU1I?=
 =?utf-8?Q?5GXpWqhN0RgZLMhr0E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa06649-ad5c-4c36-6047-08de7b7c43b6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 12:31:17.6269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q3s9tnPPOqTC+6HkrLkNYzswBHknzxKZIZafwU3Ap2LvG8fdswk6F3g/ApBLqjxI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5666
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
X-Rspamd-Queue-Id: 165DB220A99
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:phasta@kernel.org,m:boris.brezillon@collabora.com,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/6/26 12:57, Philipp Stanner wrote:
> On Fri, 2026-03-06 at 12:24 +0100, Boris Brezillon wrote:
>> On Fri, 6 Mar 2026 12:03:19 +0100
>> Christian König <christian.koenig@amd.com> wrote:
>>
>>> On 3/6/26 11:37, Boris Brezillon wrote:
>>>> On Fri, 6 Mar 2026 10:58:07 +0100
>>>> Christian König <christian.koenig@amd.com> wrote:
>>>>   
>>>>> On 3/6/26 10:46, Boris Brezillon wrote:  
>>>>>> On Fri, 6 Mar 2026 09:10:52 +0100
>>>>>> Christian König <christian.koenig@amd.com> wrote:    
>>>>>>> Well as I wrote above you either have super reliable locking in
>>>>>>> your signaling path or you will need that for error handling.    
>>>>>>
>>>>>> Not really. With rust's ownership model, you can make it so only
>>>>>> one thread gets to own the DriverFence (the signal-able fence
>>>>>> object), and the DriverFence::signal() method consumes this
>>>>>> object. This implies that only one path gets to signal the
>>>>>> DriverFence, and after that it vanishes, so no one else can
>>>>>> signal it anymore. Just to clarify, by vanishes, I mean that the
>>>>>> signal-able view disappears, but the observable object (Fence)
>>>>>> can stay around, so it can be monitored (and only monitored) by
>>>>>> others. With this model, it doesn't matter that _set_error() is
>>>>>> set under a dma_fence locked section or not, because the
>>>>>> concurrency is addressed at a higher level.    
>>>>>
>>>>> That whole approach won't work. You have at least the IRQ handler
>>>>> which signals completion and the timeout handler which signals
>>>>> completion with an error.  
>>>>
>>>> From a pure rust standpoint, and assuming both path (IRQ handler and
>>>> timeout handler) are written in rust, the compiler won't let you
>>>> signal concurrently if we design the thing properly, that's what
>>>> I'm trying to say. Just to be clear, it doesn't mean you can't have
>>>> one worker (in a workqueue context) that can signal a fence and an
>>>> IRQ handler that can signal the same fence. It just means that rust
>>>> won't let you do that unless you have proper locking in place, and
>>>> rust will also guarantee you won't be able to signal a fence that
>>>> has already been signaled, because as soon as it's signaled, the
>>>> signal-able fence should be consumed.  
>>>
>>> Ah got it! I've worked a lot with OCaml in the past which has some
>>> similarities, but doesn't push things that far.
>>>
>>>>>
>>>>> We have documented that this handling is mandatory for DMA-fences
>>>>> since so many driver implementations got it wrong.  
>>>>
>>>> Again, I'm just talking about the rust implementation we're aiming
>>>> for. If you start mixing C and rust in the same driver, you're back
>>>> to the original problem you described.  
>>>
>>> The key point is the Rust implementation should not repeat the
>>> mistakes we made in the C implementation.
>>>
>>> For example blocking that multiple threads can't signal a DMA-fence
>>> is completely irrelevant.
>>
>> From a correctness standpoint, I think it's important to ensure no more
>> than one thread gets to signal the object.
> 
> If you have two paths that can signal a fence, that will result
> effectively in you in Rust having to use yet another lock for a fence,
> and likely some mechanism for revoking the access.
> 
> I would at least consider whether it isn't much easier to have the
> signalling-function ignore multiple signal attempts.
> 
> AFAIU in Rust we originaly ended up at signal() consuming the fence
> because of the code UAF problem with data: T.

+1

>>>
>>> What we need to guarantee is correct timeout handling and that
>>> DMA-fence can only signal from something delivered from a HW event,
>>> e.g. a HW interrupt or interrupt worker or similar.
>>
>> We've mostly focused on coming up with a solution that would annotate
>> signaling paths in an automated way, and making sure dma_fence_signal()
>> is never called outside of a non-annotated path:
>> - creation of DmaFenceWorkqueue/DmaFence[Delayed]Work that guarantees
>>   all works are executed in a dma_fence_signalling_{begin,end}()
>>   section, so we can properly detect deadlocks (through lockdep)
>> - creation of a DmaFenceIrqHandler for the same reason
>> - we'll need variants for each new deferred mechanism drivers might
>>   want to use (kthread_worker?)
>>
>> But there's currently no restriction on calling dma_fence_signal() in a
>> user thread context (IOCTL()). I guess that shouldn't be too hard to
>> add (is_user_task() to the rescue).
>>
>>>
>>> A DMA-fence should *never* signal because of an IOCTL
>>
>> Okay, that's understandable.
>>
>>> or because some
>>> object runs out of scope. E.g. when you cleanup a HW ring buffer, FW
>>> queue, etc...
>>
>> We were actually going in the opposite direction:
>> auto-signal(ECANCELED) on DriverFenceTimeline object destruction

Absolutely clear NAK to that, we have iterated that many times before on the C side as well.

See below for the explanation of the background.

>> (which
>> is the thing that would be attached to the HW ringbuf. The reason is:
>> we don't want to leave unsignalled fences behind,
>>
> 
> Not only do we not "want to", we actually *cannot*. We have to make
> sure all fences are signaled because only this way the C backend plus
> RCU can protect also the Rust code against UAF.
> 
>>  and if the HW ring is
>> gone, there's nothing that can signal it. Mind explaining why you think
>> this shouldn't be done, because I originally interpreted your
>> suggestion as exactly the opposite.
> 
> I also don't get it. All fences must always get signaled, that's one of
> the most fundamental fence rules. Thus, if the last accessor to a fence
> drops, you do want to signal it with -ECANCELED

All fences must always signal because the HW operation must always complete or be terminated by a timeout.

If a fence signals only because it runs out of scope than that means that you have a huge potential for data corruption and that is even worse than not signaling a fence.

In other words not signaling a fence can leave the system in a deadlock state, but signaling it incorrectly usually results in random data corruption.

Saying that we could potentially make dma_fence_release() more resilient to ref-counting issues.

Regards,
Christian.

> 
> 
> P.

