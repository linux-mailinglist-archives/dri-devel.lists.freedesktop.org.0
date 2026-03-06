Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDyVKDqlqml6UwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:58:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E51A821E4C9
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 10:58:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17EC10E3CB;
	Fri,  6 Mar 2026 09:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CiecGsf7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012033.outbound.protection.outlook.com
 [40.107.200.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650A810E3CB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2026 09:58:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G8LFJBvvRX0eeXFVqarvJNBTtdtIx1l2NvjRXPr8eEfSljXkozi8kGsBQd9TL6dP49wIHq2nz1jPxLfO9cWIR8QM3R9WVKySLSIh0chQ0RB1oPw0uP16ZPbT5c4M5h5uAr68astJPGPAkYbyRqn9bjTsGsLZitI5ciySTtkKJrxdCudYdxBV5vf1+Qqufrrm684+hKvrR0lPZFF1pSoWUSqaQhxJv18+v+20UzNtKTjdUEBtLSe4Kvfhr1VesMjSyMyX9XCZfi6g/7sN+waLOLATnLLkPThkA/4njCwNGcvgxM/lohXizA7GbVIWK8cbuiPVfVYn17JVDtlos6CRbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6pFhdAtainYzAvCQdHYq5RAAN69lnsjMkayn1s0dNQ=;
 b=o12q3VAI5xHwiaZr1syyT8pkl1l2YYD95SL9EP6dp/9K+MLjIW6ruVbJvphFJaVuOiylfzJJ2VJjMO5t6iIU5Q2u42M+yMkBzRyM7cW4OuN7tV+Z4E51q0N03DrLvHK0SAt7wrHANFNWjFZ1PSeslhtfUd8EuSO52NevKPbUsMwcSpdFtkf1Tb7+MvhvnLNNEn7ZS2k0eF2Exz38T5vlC2wtKp3ZD4zDkELJj5Rf573sE0CalwHjWP6Knahi/7S06PJboZQl6YMFwxF48NNRawTTk8dUu1I7NN9UVXFKRdw0yIfHuNtIE6cg3bX+BKYcvq6I7jhRkJ/sDFO3tMTOSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6pFhdAtainYzAvCQdHYq5RAAN69lnsjMkayn1s0dNQ=;
 b=CiecGsf7GApOv6EcFSWxbDJuaqGMgen35Te2ApgxvT+JN/q7b3eX1ytrKNH77zO8/HzlOfTpxqmKZDo24VBqQzzWzjEx/x/okRN9AQRUh06q6wjyRvAEAbn3bTQqD60nRtx5iLjjQlvCnrb90tYHK55vEfj0GVC7vpPl9OG3QpI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5656.namprd12.prod.outlook.com (2603:10b6:510:13b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 09:58:11 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 09:58:11 +0000
Message-ID: <9718fa34-95f7-4461-9d01-2ad4eed60b14@amd.com>
Date: Fri, 6 Mar 2026 10:58:07 +0100
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
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260306104646.36319162@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0397.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5656:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e7b91e-b1f9-49c2-100a-08de7b66e005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: KAtpUqxfmQXk5eyeZ6/7dASNwtzsjeAsHx9ZqqGJ3EvgV3uv2/IUyq5TmWhccaAUbjQUjrFlL/FBlAuymV24vR4Ja2CFfdbSQ3J1U9fdulhIaVnlnvotvPSKXpBFha+CEvQb3l+f5bvXl9P1cZRn8lGXODrN/dveArZd30YSI/IrR3/lbkuvsIbRGxQzaxOcaUHusjtU9uBIh39qaNiQpdl11hVDLd/mTiAf2LQC/ZqkPXxkbWA/xk5e3iWgDq/mzPgdKFIdxserAdg9BXvvWsBbd/fh8MD0gTXKcE/lyyRHxoQyIolhdLOZInwHeYRhr4ecRTb7c2z+evO0gXN2ixyTFZlFeRl9h9ufnW5nLHwsVR8mEw0uiD6/L6LNi27RaGM0TzzDPWCS6nr5YYOqdE3LqCa9aEA2GejBU9Wc/vHSXSi7oZX0nYXSK2g+s6HZxzJy8dYz6NPQXViFZSHylIKzupwwxlbXo/RiQeGdaQK10IT2PfQNmEEqWVa7juJbVO9LgZE04Kp5qhqewPjslYmngT7Hge7W5t3SppDqznLdrSYKEg3OWjJv/KY2rYcrnmnX8QrlaOtFWZiAQU7QxBRAQlqZfHWWEnrSF2Fqi8SdRFtVKnEeIVxAXq8CIIa1WJxBMLJrK9kPPE7+Uh47ibo22V4XNuREjGdPD31cPPZuNRAPX/A5R0ir/dFUlYEKkM8cAMlvjFc2Uhn9jRFE1KIXfOspFvmEMmd5kD2wbhA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzVBZGorM0tETGRUd0VORFJRaDhpenlDTk1wSHBtbUdTcHl2ckNwYis5Vitl?=
 =?utf-8?B?Q2xVR2dvZEdYMHdjbnRIS2RQOFNWT2Zlek9pVEZ0RHk2R1dVTmp0alIwRlVU?=
 =?utf-8?B?akRCVy9KKzR3RmNrNE1EalBIMng4NUxSbjRWVUJnQmJlQzFtemdpdTJJdlpU?=
 =?utf-8?B?Kyt4TEJBWmt2Z2hEbXRkWlR2TlZMcC9ySmRyMytmR01UL29nODBMTldPLzdM?=
 =?utf-8?B?b3o0Uk5tMUVGbURBTS9jV0sxNno1Nm1RR1JEOWlxelZ5bC9Ua2VtTGowOVR0?=
 =?utf-8?B?a1RvU3ZPeFllMmZKQmRLQ3Z4cFNSdVo2TWpJU2tqdytlbmV6SGl2eUNwVTlV?=
 =?utf-8?B?MVNpYUdvR3kvaXV3bjJXcHJFTzMwemoxS1IveEs5R0w2cHdNMkwrd1F1WkZY?=
 =?utf-8?B?MGcxQU40M01sSEJKeVRaeWg2bExyWFFXWVE4Lzl4aHV2b1h0YmVXTHMybnBp?=
 =?utf-8?B?WmJWQTFJN1hKdDlaZkY0Y0VEcytXWUxiOURTWEw5cTFRTHNTU0NXN3IwOVJY?=
 =?utf-8?B?dkFWc0Z0ajB2TFBJK2c3SVRUWStydkg3YjZ4NENnUTF4TWlyRlROdThueEJi?=
 =?utf-8?B?U0pWdTVLSm5NbGZxVFhIOG5JMHNqUktYRXkram1LL1d2RXFvcHZCc0ZxYXdH?=
 =?utf-8?B?TFRRY1RKa2IvRUdZZ1B1bnp1eTRaZFNROHFNV1U0QlZzUkpGVTJmR2dJN1FV?=
 =?utf-8?B?ZU9FTi9OTEtydkRYY1RVMktiNGZnbG91UWwwS3kxNDNlL1hSc1JaR2YxK1RY?=
 =?utf-8?B?VDRmdERvMit1YWlQbzQweFpsQkVhcWx2Y0RTdlo4UWUwZ01TMytSenlNMkRE?=
 =?utf-8?B?cWlzSjJvUWtxZTRqSk1VVlNjaDVGMERiQzhHL3hzYmpMRnlFVHlhSHl6elBR?=
 =?utf-8?B?ZHhoUWpEYXVlamxuNnBVdzdDZ2JjdUhqYjBXNVpUSXQzZWJwRDR4YXpsNW53?=
 =?utf-8?B?YU1PVXZCV1ovQm1UaklSR0JTeHlhdGgrL08yaFFGRkZuNDZEL0xaOWVzVkVX?=
 =?utf-8?B?RDZaYlJ2ZnJ0T0pLMDNLbDBXbzZDcFRTM0twcGhVWVhZVW5RdEJ0Nmp0RXBJ?=
 =?utf-8?B?ZmRkczlRK0gwckpBOTNNdTljRlJONTJ1WE5zUUZIdWNPMXRVVkJjVzZ4Y1JY?=
 =?utf-8?B?em9Na1ZHZjFFQUxiU2s5dUFQUFJZdDJWcmlBbitJNHVJMUdtc2IyYThwTFFv?=
 =?utf-8?B?YnJ1S1RJQ0QxZEdERWU0WlRFNDQ2dVRYem9WQTJ6NWIwbXRWTTdPU2M3NWUz?=
 =?utf-8?B?aTB3bDlvWWZnM3pselVFOGQ0WDdQNUZqSkxxeHJkc3hYVmxudzFWcDhWSldw?=
 =?utf-8?B?NnhrcjdGVkYvZWV6OFhUZEN5YjY3NytBR2pNbG0vaE5hVjh5QVVlY3ZqTmts?=
 =?utf-8?B?RlFhSzZvaWxURlJhUDB6bE9DK3BsSWtySVdia0dMOU5HbSt1eFErM2xBYzIz?=
 =?utf-8?B?dEZxWUxYbjMrSkhHdnRCTHMyR0hsWG82bGoxM0hXM3ZRSVZkWUFKY2lwM2V6?=
 =?utf-8?B?L3ZDcXZOOHdYSjFUVThFSm41bVJzNEd1eE9JanZoanhpelpEMU80ak1tT2dK?=
 =?utf-8?B?djhWdXZJWjhWTlN0cGY3R1ZDeEZ5L2c0ZFV6blAwbUZsQVZ4c3dWNlFMY210?=
 =?utf-8?B?SHFoY0Y5b3kwTmhLejRnV1FINWNvdUVLRmUxSWRkbmlpODRNTDVyRi9mYmoz?=
 =?utf-8?B?Sy8vS0x0angvMmtna0MxYlo4dlNJcWs2akJ6Vkx0WFN2MUV3bk9CbTRiNGlo?=
 =?utf-8?B?eG9oazYzSVhmaWtRWmJjdy83SmIrSlFidStNdVA0SlpRT0lsQURrNlh2SWNW?=
 =?utf-8?B?WVB1V04wL2Ywb2hjVzd6RGdUaUFNZzczNG5jZlgwcnVPZXAzSTJwbXlDTXdU?=
 =?utf-8?B?ZWY1MFNKdWlwY3VaejdKc1BqUjlwTFc1dkE4RVVCZmVETEwwY0RTeUhrUWcv?=
 =?utf-8?B?TGVlbVJyTGlNUGJ0NVgrM3J5YnorUVA0ZjJobGVCUFR2Q1NkZW4xUDZRM0xC?=
 =?utf-8?B?MFMzOEhiU2cwaUp1UkZYYURkZnVhWTFZOElscjA4d0NCbGNTa2E4cFJ6Zlpa?=
 =?utf-8?B?dU1VQVdXNWVkV1FraFo2Nys3YS9FM2ZyMDlWdG9tWXdBWTFNckp3OUVjVlI1?=
 =?utf-8?B?TGhXQUh0cHNwcTlsRG5rWU1aTDJIVFBuK3lEdjV5elc5T0gzZW9GQ3JzQ1B0?=
 =?utf-8?B?NG9KblFESWZ0OUM4SVNBcmJqWktTZ2o1cmpqdmFDN25JZ1AvTzVJNEozNGFN?=
 =?utf-8?B?UnVyUVp0WGtXOEZPTmtLR3lEWXVZOTlFWlpObjVIUkhHL1UvWEYzVitmQ2gy?=
 =?utf-8?Q?9IckGpm3Xo6M69y88l?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e7b91e-b1f9-49c2-100a-08de7b66e005
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 09:58:10.9717 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fzk6SRXSoe8D10YO6uAABRM2DNn1lkCZuAkyRHQtalj06pAZSaWMMlnyD9XyE85K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5656
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
X-Rspamd-Queue-Id: E51A821E4C9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:boris.brezillon@collabora.com,m:phasta@kernel.org,m:dakr@kernel.org,m:tvrtko.ursulin@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

On 3/6/26 10:46, Boris Brezillon wrote:
> On Fri, 6 Mar 2026 09:10:52 +0100
> Christian König <christian.koenig@amd.com> wrote:
>> Well as I wrote above you either have super reliable locking in your signaling path or you will need that for error handling.
> 
> Not really. With rust's ownership model, you can make it so only one
> thread gets to own the DriverFence (the signal-able fence object), and
> the DriverFence::signal() method consumes this object. This implies
> that only one path gets to signal the DriverFence, and after that it
> vanishes, so no one else can signal it anymore. Just to clarify, by
> vanishes, I mean that the signal-able view disappears, but the
> observable object (Fence) can stay around, so it can be monitored (and
> only monitored) by others. With this model, it doesn't matter that
> _set_error() is set under a dma_fence locked section or not, because
> the concurrency is addressed at a higher level.

That whole approach won't work. You have at least the IRQ handler which signals completion and the timeout handler which signals completion with an error.

We have documented that this handling is mandatory for DMA-fences since so many driver implementations got it wrong.

That's why Philips patch set removed the return value from dma_fence_signal().

Regards,
Christian.

