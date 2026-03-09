Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OJ2A2j5rmliLAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:46:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD7423CFA8
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9350C10E557;
	Mon,  9 Mar 2026 16:46:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gdm4aQFT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013059.outbound.protection.outlook.com
 [40.93.201.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE6710E557
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 16:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVAcgcta3TlGxfEPkJcrj20bkjjVh6BQs5RFP66qORnp/xteTIM2FQGeMUXJlaasfyS8jyTJLiF89kiabTXEJpJuHjgBUxG4KQhA2KZ673WnicyeLAcJwdoCl//QE7mozCLSv1qOPlYXzBjPnE6qCPoDu5Iwdhp6zN6fUn4Kp0aGuw00EfekHaUlRdQ8PAyxQGgaCSVJP4vQW4UAw8PDUiqhQjxQu5JuxiA4szsdhgFecr1OolkfGMPBInmkUUXZw8FWn8JLzzK04vVjrc/4n7s5FqIWWJuXYj4w94imcod2+CHZi6kTlac4TcIxkuT3/A5NQ9+Ci0J7qwLPATQvgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2RCa3S8AFAShBR+W+kKJ4EPCCYk6ZKNV6HAbeoyahGI=;
 b=TmMyuSM7Q+GtDxbDSfYen0xOFpZbZnDtn/yQUheiEbqv1M69ijtew7yauE4jM1kLB3LXFyk/ur86/uvxT6YYaFo2ld9zfC3H1M6Oe5VKMNJtTkmO9I+QOvA5XfP52afeL4gcdCF94ssZxp6M0Fnb6L7ZZQItGsSbBVM6TXlGb5dRFH84Nitdv/udafxugYWy4Rukgc5pQf8ygFE93wBa6kRdrunNjOYDwGkFZtPtpu/1ao0WcwVpuM8f5+bYhhPcEUw4djX8CsAjbToZam9MZesDOiahW9P6eFG/nzjvXhajykjcflkPiyGnlIwoe38UPmjfx2UVnZ5wkcOmMdzPvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2RCa3S8AFAShBR+W+kKJ4EPCCYk6ZKNV6HAbeoyahGI=;
 b=Gdm4aQFTDlEb5xeKXvD3a2G6/Ngg+bug5fdi9a6GonJoHSxAe3R8aduXy+j8bJeeMLN5+GUcDB0zRFmkTZGzaTX6BgSUQMJ4pa4OP0X7N54Oj1duy1ZxeYpDtgofWp8NkyC18UulAxHvoytM3+XU+EPcDXr0f3LzyGf+DOg/DLo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4417.namprd12.prod.outlook.com (2603:10b6:5:2a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Mon, 9 Mar
 2026 16:46:25 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.009; Mon, 9 Mar 2026
 16:46:25 +0000
Message-ID: <037f8a0e-c56d-4a74-80a9-333d0e5a08f3@amd.com>
Date: Mon, 9 Mar 2026 17:46:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: dma_fence: force users to take the lock manually
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: phasta@kernel.org, dakr@kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
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
 <0009b35c-265f-43ff-84bc-39fbf7109a3d@amd.com>
 <87197ff8d812debbd348ccb2befff855b30abb31.camel@mailbox.org>
 <884567da-e884-425a-b0d0-c9a6211bc2ae@amd.com>
 <20260306155504.5cc6157e@fedora>
 <f5bbdfe4-c9e5-42f7-9849-4c9d57360183@amd.com>
 <20260309160658.5b012e4d@fedora>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260309160658.5b012e4d@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN1PR14CA0009.namprd14.prod.outlook.com
 (2603:10b6:408:e3::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4417:EE_
X-MS-Office365-Filtering-Correlation-Id: 582d60e9-4e8d-4c45-cb96-08de7dfb671d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: VYR/zT7+S2UpSqOwrTgQcrlS/F2jszgKfhhUawKMvSeeOp9w1d2GL0aLpmTdyal0ifiONTqgKxtOVIxZ6fRdtWBhMcaogIh7oZFFjcnCcWK4NVw2MEqsZhe1WpkKmp94tp32kFtvNRfgtBqGZETlwwGNv3xzHuB3pxtc1iBv94rcVEbaxx7dYObuBfHrgC/NA7tZTjHR+H+K1vMkAg2A5WHeAMrKiErUIhvEX6Hgs6MbqB85hyD/n5pNtnRoKAF5zxCEl7aOcPZeVGfmvVUz5rVkTHlclydWCCz9/P3VxOb9RIDcsUXgkWwtmjZmNOizQj2swmgT4LTWIUR1xIFX/Z32dYKaF27brv4V1bbdzKjmX2Rfgv8aBzU/DmvvW7XZNXHx5o/9UdM9I2QFDJOyI/jMp5MHiagG5QuTkQTfAqFygimee3wnMODXcHUwT9XsAOa1SX1awDdF1NT1pRf4TUjH8fXrSK9DbryKZtHBGzBQnFFRc/U2rOHJCBaDu0qV36bH4CSHq4aO5D/s54AuqqeRJUcjnRlPJBtgMcueWopYw4IfmYEXHybi56VHjh8Hx3Z5COOLg2X8DaZpTzIyq6H5tuSom1XsiazNEa9CDAB6FJricpZr6Ml26P6BZK1xvXbdNG70arKHLmyrsO2DunrqMcr9GhgcAmnFV1XQITpAZV1I1wvwBzeF+8RZ/rPL7DtATEDW0HCQ1Q2c2OfZ25mwKkEl0/SjXnpFcFuzbhc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjY4OERSenJLSjVUcEFzbXdtS0N2aG8xM21FK2kxMkJxcC9DYURVd0ZFdHhv?=
 =?utf-8?B?MXhCV0l1cU9pYXZmb1RJUjZWVVhtbEtYcE96dG5FQTdTcmRZYzVORnd5UHMy?=
 =?utf-8?B?TU42TWQ4c3VJK1M0UENpUWVoSyt6UmJEUElpTnBISndSSjNTOG1OYkFZaElI?=
 =?utf-8?B?UndGdXg4cDRXVHp2RUlLS01pMjNsQ2dWL3VPRUFmWGxGNEw4SldtL2NnV3Bm?=
 =?utf-8?B?VWh2QURYU1A5S1RTTmEwSG5FZHN3NUJMdUxwU1Qxd3dPa2FoQUZNeXh4dko3?=
 =?utf-8?B?SmNMWng1MzhnOGY2cS9WWTRpOUZSSWttYXZsSU8vMUZ2WHNtV1NVWmhnUGVX?=
 =?utf-8?B?U1E3Q3l2c3Q4Q0xJMmR0b3hEUnJiNEdaaXNCcHl3STNHdUJVY2hhT04ydG42?=
 =?utf-8?B?b1lNYjg1RFNsQWQvdjZ6SkQrRXRIWENyWngxSXJxWk40b2kyRGFYMU1SeW1a?=
 =?utf-8?B?SjUwTERZUm1XcXNsMi90MlpIakIwOHd4ZmJ2NGpNRm52dURTazY0UVdIdFNt?=
 =?utf-8?B?TUpkWnZkS2hZaTBXWnMxVzM4VnJrUWh3Tnc3S2xGRGwzcmxjalE4WDR5Q0R2?=
 =?utf-8?B?UUFRQWxVd3NMeGV0YW1sYXdUWnNIbzUxWWVnVkkvV25VTVZLa1R2RWR2ME1G?=
 =?utf-8?B?UmRCZTI1QXVta0o0SzZ2YVF1eXpXV3ZqVExiWUx2TktIdldNb0xLTzNWeXBy?=
 =?utf-8?B?eGw1NWxnUHFwSjdyeDJwbkVKdk5EWU5CQ0RJUTRyQXRPbDU5bldaRHk2TXpY?=
 =?utf-8?B?aXFVUkRlZU5sRUVDbFo0NnBtM2tpaEVHNXFONFRIaG81cWNkb1BWOEYzdlpt?=
 =?utf-8?B?RG56TS9Ha2dxM3JpTVZ2dld3a21MdFVLL2Fhcm8yQ0s1bDBqQURqYUR0TStN?=
 =?utf-8?B?by9KZUtGYmRLZktLWUdXRjVQYnRETmoxZk1mVlFEcm5TdklJRHJTUkh3TGZN?=
 =?utf-8?B?N0NGdWc3d1VOcnZhMHdMQUVKRnMwNXBGd2ExcnovWXdibUwvY2FJY1l0SVJQ?=
 =?utf-8?B?T1B2eGR6aFlGb25YRjFzdVVIdVNLVnk4aW9NdG1sMTltY2NhODJnZ1pSWHE0?=
 =?utf-8?B?ZldMUG9RdkZoVFNhNTU3bnQwYkQxTi9ac3hxR0pJZ2pLdXZYUVltT01CSUNo?=
 =?utf-8?B?UmFBUnp3WnJ4TWtud0F1T3BQNDBLMUQ4Y0JaSmRaNWk2aGg5TjdKaFhNUkFs?=
 =?utf-8?B?TTVtdFR1blZGZ0pZSDNMQlNmaWRJMzZjRzV2NnpzZ1JkeDBYUjNFcm1hNEtj?=
 =?utf-8?B?czkxdi8zMllIMUJCM2tGTmo0OE5vVHYrK05GZUQrMG5KM2EyYVMxY0QwRS9W?=
 =?utf-8?B?cXAxM0R1MlVlMnB2YnFlUDRVeThJWEx2VXpWRGljTDVIUitRaXEwRlc1RzFi?=
 =?utf-8?B?Wm8rUUpNbzVIbWZNMjdMRWRMeEZPdHNieGtrRmJUL1NGdnhYWUZEWFVDWFBF?=
 =?utf-8?B?QW9jY21GdWVUOERpQTE4Q3J6SExxNEFSUWthRkJRWUZ1RDgwMC85QVBmUnhW?=
 =?utf-8?B?ZUpGZGkvRXB1Zy9tbXFUUWtkS3BOcEp4YWt6d0orbFRNZEE4clBCTDNPdERE?=
 =?utf-8?B?TlZMbTJCd0dDaWFXbzJRcmxRR0ljN0xqVHJpcUxTdXUvcy90MFQxNXVETFhU?=
 =?utf-8?B?OUt1U1BZSUdXVm5DSzY2djMwVjUyOW1hU0pzd1E4cTl5cHhQZE5LaXNwOWZW?=
 =?utf-8?B?RUR4RS9wK3lMTlNYMFVMbWVJT0lGQ3NOQUlBMEFvS2w3RE11THlscGZoUmVa?=
 =?utf-8?B?YVZzaWlXRkk4emNyR05XRW1CRGFRdktFWlhZU3hoUXVZMGo1WXMzQWREU2hH?=
 =?utf-8?B?ZHVWY0xma254cWV1dkh0eEdrWTc3S1RzNkkvT05mUFovSXRIcm15ZEdRWWkz?=
 =?utf-8?B?SzJlMHpVRFlxb0RBRG5tclEvTlZwOFpmREF5Ykpua3lBUE1SZ09ZckhLSVBD?=
 =?utf-8?B?QVlCbWRuVlVHbVhaeUxmU2tYOWlCS1dFVCtERXdwYnE4VTErRStNWWhBem93?=
 =?utf-8?B?YzFHMnBOK1JseFplYkRaUC9hcjNGeU5JY0txRTZycy9UTThhUnZxTzJ1YWdU?=
 =?utf-8?B?YzJzajBpNFlXS3p4Nkc3bEw3WmZXY2xvU1d1U3J2WmNpRnRyQUFqeVpUOS9Z?=
 =?utf-8?B?RnA5QWZiN2JXbFo1OGxMVXNuUGVHNVFHamlNclUxemhDRkVPYnVlZGVuL2tq?=
 =?utf-8?B?d0ErOUtic3h6bEtZdkFLb09JYjlGMWJ1NjN4OTBKcU96L0hKUVg4Um1wRk41?=
 =?utf-8?B?N3FRQTBhSko0bFZmeFRIdVBoYjlWanMzUUdZMDMycjBYaGVyeVMwVXRuTzRv?=
 =?utf-8?Q?5VDQU0diVVLhKQpG4W?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 582d60e9-4e8d-4c45-cb96-08de7dfb671d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 16:46:25.5228 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 33pE9sCNHZ18WG4ylcmckG7zvFVIKFgzK931TnrWRK7JC/SyPpqM1Z7LChwXXeqz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4417
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
X-Rspamd-Queue-Id: 6AD7423CFA8
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
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.992];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On 3/9/26 16:06, Boris Brezillon wrote:
>>>>
>>>> Just do it the other way around, use the dma_fence to wait for the
>>>> HW operation to be completed.  
>>>
>>> But in practice you don't just wait for the HW to finish most of the
>>> time. You instruct the HW to stop processing stuff, and then wait
>>> for it to acknowledge that it indeed stopped.  
>>
>> And how does the HW acknowledged that it has indeed stopped? Maybe by
>> sending an interrupt which signals a DMA-fence?
> 
> Yes, it's likely something like a _STATUS register update reflecting
> the new HW state, plus an interrupt to wake the CPU up. The decision to
> poll the status register or go the async-way is up to the driver.

Exactly that's the bad idea we have iterated over so many times.

Ideally such stuff should *not* be up to the driver but enforced by the kernel.

>>
>> The point here is that all acknowledgement from the HW that a DMA
>> operation was indeed stopped, independent if it's the normal
>> operation completed use case or if it's the I have aborted use case,
>> *must* always take the same HW and SW path.
>>
>> It is *not* sufficient that you do something like busy waiting for a
>> bit in a register to flip in the abortion path and for a DMA memory
>> write in the normal completion path.
> 
> I'm assuming the DMA_OP_COMPLETE is also a register update of some
> sort. But let's assume it's not, then sure, we need to make sure the
> operation is either complete (event received through the IRQ handler),
> or the DMA engine is fully stopped. Doesn't really matter which path is
> doing this check, as long as it's done.

Well, it is massively important to get that right or otherwise you end up with random memory corruption.

And drivers notoriously get that handling wrong resulting and much worse issues than a simple UAF.

>>
>> That's why MMU/VM inside a device is usually not sufficient to
>> prevent freed memory from being written to. You need an IOMMU for
>> that, e.g. close to the CPU/memory and without caches behind the HW
>> path.
> 
> Either that, or you need a way to preempt DMA engine operations and
> have them cancelled before they make it to the bus, plus wait for the
> non-cancellable ones. And it doesn't really matter how the HW works,
> because my point is not that we need to enforce how the SW can ensure
> the HW is done processing the stuff (that's very HW specific),

At least for PCIe devices that is pretty standardized. You need something which is ordered with respect to your DMA transactions, so you either end up with a write or an interrupt from the HW side.

How it is implemented in the end (32bit vs 64bit fences, writes vs interrupts etc...) is HW specific, but that is actually only a really minor part of the handling.

The problem is that what you describe above with "DMA_OP_COMPLETE is also a register update of some sort" is exactly what we have seen before as not working because MMIO register reads from the CPU side are not necessarily ordered with device writes.

> just
> that there needs to be a way to do this SW <-> HW synchronization, and
> it's the driver responsibility to ensure that ultimately. My second
> point was that, once the HW block is considered idle, there might be
> operations that were never dequeued because they were cancelled before
> the HW got to it, and for those, we'll never get HW events. We just have
> to walk the list and manually signal fences. That's the step I was
> suggesting to automate through the auto-signal-on-drop approach, but we
> can automate it through an explicit DriverFenceTimeline::cancel_all()
> method, I guess.

I strongly suggest to at least document what is known to work and what not.

Regards,
Christian.
