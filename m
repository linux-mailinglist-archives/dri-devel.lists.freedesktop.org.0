Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Ia/E8eAqmkMSwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:22:47 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B445321C625
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED13310E39E;
	Fri,  6 Mar 2026 07:22:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nNKCzo6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011007.outbound.protection.outlook.com [40.107.208.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD91E10E39E;
 Fri,  6 Mar 2026 07:22:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vaJHvNdEANPZ8XE3pBoDq9dckEGw8M6QykZlqL1dgRtqdDDXmkF3h/ONoEJXwDWIg0bJYmt6tL7pbi1JuaJj3O8jc/3pP8asPZBcuyjLcH+lNmMfcIb+SFprGAiRbHhTgbbzgTdGr9pRTjdHxLpgfoRCWexOh+QS525afTu4rPve/jyHNYUiP2vcfR9/kEyIpEOazAtigBLZzb4MNnnS7D3l0osxMQeizfuaKV3jlP+2Pnd48fgCtkhkFyt450kdlwbaTnypblIyLBl1dFFvKMWll2ZhMYsrHl+6sH2jHQYdNxDZAVtC3NHmiPMQ5DhCX/9ZsAlZVaSCcMPbdvAomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PLtd3okNEyu+UL3PmN4CTgjgHke95Gb8gwf/QbI16l0=;
 b=JpIAIa4Y84RTGY/lETPHsBXXMIdjzXv+HkQf6IAqzW7qGNqxlfqcHSRUNXLfVYRzLtV64JtVPx3sFB6MFJPKW8a2yN64P9YnZuR+xI1qa//1KtillaarrSK6uJSij2mR5MBk6BQTI6FuFSklvAJNoyTFfIZ5u73VOh8tvrUAjk9xChKkT6W67Tsw99uUsCK9L2WC7IzQ/BY3PUNWB5j67ShP50f39hbf/L0vhnoWASn/eSidBpGcANI91KMLRvGD5FGmLt7m5GCEMKXt/nkCzyyiVmYo1lPORtzuFSM/xf+hXdK8Jko8cHN5EjlUO80/KG0ATe5IOVNVEV8Ze5MfEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PLtd3okNEyu+UL3PmN4CTgjgHke95Gb8gwf/QbI16l0=;
 b=nNKCzo6l0v7/RpMq/DEPcfP31G1U7nUVS2ZlzyKVqOb3/DEoy7gViybMydV7Rs9YuYZbcqHbxBEBn2ZcR+UhnKXfPY1QDLFdP4ICklpYqHBgk14a4hoIJy+Z/QvqIJiemNx3dDH5XjM27Y8TzOROaa5ynRe0OuzceuGOqxSWQmRX4o4BTC4CexAn9NDb3wPQsD07irQPlXzMJO6pStA6WRPJHbxIjFnMYLkyrkf9NrX7bCBkPF59DT7gZ6xsnJfvqMugGJcrleHY+Melk6agPUmKvX4lwvHSIux/b0KVpiYGpv/LoMU2C3xk07ttOmBRTYlvpsL+Ut5/j9MmJTJmsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 07:22:38 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 07:22:38 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 06 Mar 2026 16:22:05 +0900
Subject: [PATCH v6 8/9] gpu: nova-core: gsp: support large RPCs via
 continuation record
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-cmdq-continuation-v6-8-cc7b629200ee@nvidia.com>
References: <20260306-cmdq-continuation-v6-0-cc7b629200ee@nvidia.com>
In-Reply-To: <20260306-cmdq-continuation-v6-0-cc7b629200ee@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0252.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: fdee5a97-abe5-426b-5c20-08de7b512587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: nnKQMIqBApPCFpN6jJBUdnoYiTr6P0aJ2p4fQkBAvg3tzTxclL2fdwpRjOHQjPlXAg4HQoPn+FVQeIPnkrSw6cJtpIOxv2ecn8nGX0yJF08FPqgmRGDxncvL0ejE9+gnjth6ChEFd7pco9exJDzdAvwQornxHJRwRPOJIAXGXdW0deWbO8/JRe67JJYzDW+ikFH8/nTck+s6LU7jD4DkzI2qjPAuci6a0H8qox/CH/DphNmHFfecJ+FtjfcgrocMX9O5k3CTeRADfgcdK97inX9F2sLl0JRtwDjz97VpEn1BGheCo396N+MQwglj2hjaFCnma8WXTZmAHS2E/cl650OB6Ecxox/d0z/JDgw2FOlGEYhc2zc1b/l8SkObvjPzKyyGn62m75p3XP8CM4PH5cN9v7D/woYHvfYGv6nSrOgqFopdmmTAL0bAotSYSp+RW4dNEukj3gVLbNyNN/YDeJVJx5uqppdURih3wgGyUEZcSh5RDqgqRWQu2u+rkMc2LcjhnlhAthM4E8+Ou2XFlPCQl1hpCd04+GrsHNJsJZk9KFokwRdacHMgkD6aTjwCu6jWTps4CoZW4MbkXvN/TEeM3p4XKAni9A49Ho51j0R7w894xpOp+SytqvS7v6GijFs378a4BoJSLVLOcgVSzHjj8SyT41B/pDia3u6WRh1QRJg/z/x8IQNw49xiATQ9UnQf9YVPiIcpH7cfVtURiZGpyTA8MopwL0EfOLlOurrKwGSjb7wJjHGremn8eZ4uIZJTOzvsuwL6CVt8/2PL7A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cjI3S3NvMmJ6OTBZNmY0RzY0Ry93bWlOdDlJSU4xa2NySjNDK01Uc3FNd1JC?=
 =?utf-8?B?amN0eGlRQ0dHRGlYZXBtaGxLSVR6djAzOFFmTTZQOHpsQ01uOXd0N2pQNEZ3?=
 =?utf-8?B?ZERiWkRDV2hsNlp3aHA2YWZRb3pyRzVDTndVeUVRa3dXQXRvUkg3K1NpbTZI?=
 =?utf-8?B?STRMWjZnaUxFdlhkck5OM1VkNTF1NUpTaWtTNkl6clRjOG81S1hQcjJURm1S?=
 =?utf-8?B?NTRtNUJISXlTQ0RWOHJ3c2RTQjZzRWJ5MGpiN1hXc2JkYTRzSWhDR2pteGFZ?=
 =?utf-8?B?SXgzRjl2RTA1V211QUFOTEpiL24xb2xwdDVRRTVIOTlQSkRNa0ZLSW1iODVw?=
 =?utf-8?B?Um5IdUdCNTFJZ2pPci81TEJuMkN2cy90Ym1wclBqZjVtbFJTR1dLRzRUd0gz?=
 =?utf-8?B?UmVEb0ludWN2M1U0WDVHMkNrazFCdm1UYnp4eGU0QjVjaVgzZzhrRGl0QjhK?=
 =?utf-8?B?ODNLeEVLdzVUWkUrUkRwRWowU0JSQ05zUG55NkN6Sm9CUnp6SFduSDhJT2Jz?=
 =?utf-8?B?VkhWZ1JFdnp3MzJqeVFmRTR3Z3pWVU4zOURWSzVFY3dDSlZjNUp3UHZVSXdJ?=
 =?utf-8?B?TFBDZzd3Y2huZExpWkxqOVdUTUgrUm1lTm9PQWFVZWlsYjVoYkp2NGdnbklx?=
 =?utf-8?B?eTN3NzlPZjlIREYrRkV1UWhVaEdLNE1pRHhqQ2l6Y1VrL3dhVkk0R1FiTWg4?=
 =?utf-8?B?cC9MQWZFV2hHYkc4b1NYaDdrUlZCdmVIY1FrSjdtZGsxNXkzQnA1YU1nNjlx?=
 =?utf-8?B?dEdnSlpFZHFOQnRIdEkwYTV4RjAxSXo5amhJa0hpQ3RLejU4cGpmS3N3Rkdt?=
 =?utf-8?B?Y3dGR2dmY0laN2I0Vko5NGg5Rys3M2QraFpOMFFHVkxuUjhIMzlmQzMzaGIz?=
 =?utf-8?B?TFArVjNZN3NJcEtMdU1QN1NxVWxLVC9URG9rUFZ1REZ0N0E3KzBQWTlCYzBX?=
 =?utf-8?B?SU44aFN1UzFtYWt4a1hUL0R6dDhXYzhrOHdQOFVHODdzSEVEWXQ1Y3JIVzF3?=
 =?utf-8?B?TERtaHBKZGk3bjhkcTBVaTJoLzJkZFJyWEtTTXhwazhZOXBPNEJjOUJYMHNk?=
 =?utf-8?B?R0N2ZzB4cUxnS0doZkg3ZGVjOFpyOU1sdU5sRU9idFc0WFRUeUEyUkxINzZh?=
 =?utf-8?B?eTVPK25WejlkV0lKSVZ6OTBVOXlkc2tQa0kzZUNQZGhYUTY4Tytnc2J1Zzlz?=
 =?utf-8?B?UG5leW5IUEZyQUs4dmY0dDZJbzFRYlh0bTBDemVRRytNNi9zRlFRUU8wdlRn?=
 =?utf-8?B?ZjZkc3J4aityTnpwNmdUeWVUUmFTekh5M0I2bTFHWEQwaUN2SFZCbytORmIr?=
 =?utf-8?B?TDh2eDFrUzJ6ZmhmN2FmdWRUdGVPL25DMTVRM0s4bkVjVVFVZWdBbG44SGpT?=
 =?utf-8?B?bkJaVjhVUjBacWtDMytjT051MFlLdUtoa05SSmpCOXNWNVJhR1FRYzB0Ukxj?=
 =?utf-8?B?YlFSdTd4U2hlSDJ6N2MydThzOTlqaERHTWtZTWxEM01rd3Fnd3FEcklNdFB0?=
 =?utf-8?B?QVdpT29QRW5mUW1xcXNqZGw2eVhEWjlEU09CV3NZNW5GLzV6QXViSFd6Yzlr?=
 =?utf-8?B?TUlNMnAwSENXTnNzamE3R29lQTFya3lsSlV2a09WMFdPMFN6WmVHTGl4MjR4?=
 =?utf-8?B?dGFmMDV0SUJFNzVURk02MlEyUzVZMEFFM2NqZjIzWWtPNVRqUm0rWFBHTHk3?=
 =?utf-8?B?NmlnMzlvekxBaUdmS216R1ljQzFFNlFJa2svYjNwZDc1NzJnNFFvcHZrcjB2?=
 =?utf-8?B?aXQ0dXJUcWpKdDhmY3Y2aElRaTZoczRqbFJ4TXNXazRPYXBVSTlERXN0UWhM?=
 =?utf-8?B?ZUFhZFAyV3VNZU1tcmlnMy9kVTBwVU9IUHdaeXJ1QUcydDYxMmhxcTZ6aDA2?=
 =?utf-8?B?OEliM2NHQW5rQzhac2RuQUJHV0g3WHZWV01QK3BDYitWZkhKdGExMEIzQ3Uz?=
 =?utf-8?B?cTV5dVY1Ulo1ejNXTW1MajBJN3BuWVE4Mmp3OTJoL25aTzdDejlDaE5vN21V?=
 =?utf-8?B?V1hyNHBpQk9nNEFubEo3R3p3Q1g2OE5Xb0NxcE56TndxRUZvQTFlQ3o2RlBY?=
 =?utf-8?B?U1dqS2NOZExIMlV2S3YxNlhadiszKytBT1pGbXFZeGM4eXZNR1dUQW15NmRy?=
 =?utf-8?B?bzE5OHpkQmZFVVQ4T29pWmp2OWswNzN4cWtya1luYkpleHFmZWNlNFdkUi8v?=
 =?utf-8?B?QUtKcVVoVm1xYnF5d0l5Y2RDNTFMTlQyQTNmNm1kbEVvK2NrNHVjNDJwNml2?=
 =?utf-8?B?VG9jT1RENjJiaGNDNnpRQllLRlBCOWZLd2hhVXlMbUVSRW96b3FERzVYT3dx?=
 =?utf-8?B?ZGFtb0R5S1N6MUcxVVY5VTJnQytrWVE5bmpJMnJacWlCL3ZMYUVpVVJZMjND?=
 =?utf-8?Q?i0GmlTcZyXNFdNwJ3y8tGEmmE3ndcFPBGuqrrFkQmkulU?=
X-MS-Exchange-AntiSpam-MessageData-1: cz83IzxURNbrFw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdee5a97-abe5-426b-5c20-08de7b512587
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:22:38.6308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jiE+7sCMUXeWruSOgE3tkPLtySqcrBSqppUIjn00PTDgfKyZu9sIJLOLuZAjBEnWGDmR/JipLYl5OUuScwkeTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340
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
X-Rspamd-Queue-Id: B445321C625
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,self.data:url]
X-Rspamd-Action: no action

Splits large RPCs if necessary and sends the remaining parts using
continuation records. RPCs that do not need continuation records
continue to write directly into the command buffer. Ones that do write
into a staging buffer first, so there is one copy.

Continuation record for receive is not necessary to support at the
moment because those replies do not need to be read and are currently
drained by retrying `receive_msg` on `ERANGE`.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs              |  42 ++++++-
 drivers/gpu/nova-core/gsp/cmdq/continuation.rs | 163 +++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs                |   4 +
 3 files changed, 207 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 861f5666fe7f..e0b096546d23 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+mod continuation;
+
 use core::{
     mem,
     sync::atomic::{
@@ -25,6 +27,11 @@
     },
 };
 
+use continuation::{
+    ContinuationRecord,
+    SplitState, //
+};
+
 use crate::{
     driver::Bar0,
     gsp::{
@@ -520,7 +527,7 @@ fn notify_gsp(bar: &Bar0) {
             .write(bar);
     }
 
-    /// Sends `command` to the GSP.
+    /// Sends `command` to the GSP, without splitting it.
     ///
     /// # Errors
     ///
@@ -529,7 +536,7 @@ fn notify_gsp(bar: &Bar0) {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
@@ -588,6 +595,37 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         Ok(())
     }
 
+    /// Sends `command` to the GSP.
+    ///
+    /// The command may be split into multiple messages if it is large.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializers are propagated as-is.
+    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp,
+        Error: From<M::InitError>,
+    {
+        match SplitState::new(command)? {
+            SplitState::Single(command) => self.send_single_command(bar, command),
+            SplitState::Split(command, mut continuations) => {
+                self.send_single_command(bar, command)?;
+
+                while let Some(continuation) = continuations.next() {
+                    // Turbofish needed because the compiler cannot infer M here.
+                    self.send_single_command::<ContinuationRecord<'_>>(bar, continuation)?;
+                }
+
+                Ok(())
+            }
+        }
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
new file mode 100644
index 000000000000..67b3e03fd8ea
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
@@ -0,0 +1,163 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for splitting large GSP commands across continuation records.
+
+use core::convert::Infallible;
+
+use kernel::prelude::*;
+
+use super::CommandToGsp;
+
+use crate::{
+    gsp::fw::{
+        GspMsgElement,
+        MsgFunction,
+        GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
+    },
+    sbuffer::SBufferIter,
+};
+
+/// Maximum command size that fits in a single queue element.
+const MAX_CMD_SIZE: usize = GSP_MSG_QUEUE_ELEMENT_SIZE_MAX - size_of::<GspMsgElement>();
+
+/// Acts as an iterator over the continuation records for a split command.
+pub(super) struct ContinuationRecords {
+    payload: KVVec<u8>,
+    offset: usize,
+}
+
+impl ContinuationRecords {
+    /// Creates a new iterator over continuation records for the given payload.
+    fn new(payload: KVVec<u8>) -> Self {
+        Self { payload, offset: 0 }
+    }
+
+    /// Returns the next continuation record, or [`None`] if there are no more.
+    pub(super) fn next(&mut self) -> Option<ContinuationRecord<'_>> {
+        let remaining = self.payload.len() - self.offset;
+
+        if remaining > 0 {
+            let chunk_size = remaining.min(MAX_CMD_SIZE);
+            let record =
+                ContinuationRecord::new(&self.payload[self.offset..(self.offset + chunk_size)]);
+            self.offset += chunk_size;
+            Some(record)
+        } else {
+            None
+        }
+    }
+}
+
+/// The [`ContinuationRecord`] command.
+pub(super) struct ContinuationRecord<'a> {
+    data: &'a [u8],
+}
+
+impl<'a> ContinuationRecord<'a> {
+    /// Creates a new [`ContinuationRecord`] command with the given data.
+    fn new(data: &'a [u8]) -> Self {
+        Self { data }
+    }
+}
+
+impl<'a> CommandToGsp for ContinuationRecord<'a> {
+    const FUNCTION: MsgFunction = MsgFunction::ContinuationRecord;
+    type Command = ();
+    type InitError = Infallible;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        <()>::init_zeroed()
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        self.data.len()
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        dst.write_all(self.data)
+    }
+}
+
+/// Whether a command needs to be split across continuation records or not.
+pub(super) enum SplitState<C: CommandToGsp> {
+    /// A command that fits in a single queue element.
+    Single(C),
+    /// A command split across continuation records.
+    Split(SplitCommand<C>, ContinuationRecords),
+}
+
+impl<C: CommandToGsp> SplitState<C> {
+    /// Maximum variable payload size that fits in the first command alongside the command header.
+    const MAX_FIRST_PAYLOAD: usize = MAX_CMD_SIZE - size_of::<C::Command>();
+
+    /// Creates a new [`SplitState`] for the given command.
+    ///
+    /// If the command is too large, it will be split into a main command and some number of
+    /// continuation records.
+    pub(super) fn new(command: C) -> Result<Self> {
+        let payload_len = command.variable_payload_len();
+
+        if command.size() > MAX_CMD_SIZE {
+            let mut command_payload =
+                KVVec::<u8>::from_elem(0u8, payload_len.min(Self::MAX_FIRST_PAYLOAD), GFP_KERNEL)?;
+            let mut continuation_payload =
+                KVVec::<u8>::from_elem(0u8, payload_len - command_payload.len(), GFP_KERNEL)?;
+            let mut sbuffer = SBufferIter::new_writer([
+                command_payload.as_mut_slice(),
+                continuation_payload.as_mut_slice(),
+            ]);
+
+            command.init_variable_payload(&mut sbuffer)?;
+            if !sbuffer.is_empty() {
+                return Err(EIO);
+            }
+            drop(sbuffer);
+
+            Ok(Self::Split(
+                SplitCommand::new(command, command_payload),
+                ContinuationRecords::new(continuation_payload),
+            ))
+        } else {
+            Ok(Self::Single(command))
+        }
+    }
+}
+
+/// A command that has been truncated to maximum accepted length of the command queue.
+///
+/// The remainder of its payload is expected to be sent using [`ContinuationRecords`].
+pub(super) struct SplitCommand<C: CommandToGsp> {
+    command: C,
+    payload: KVVec<u8>,
+}
+
+impl<C: CommandToGsp> SplitCommand<C> {
+    /// Creates a new [`SplitCommand`] wrapping `command` with the given truncated payload.
+    fn new(command: C, payload: KVVec<u8>) -> Self {
+        Self { command, payload }
+    }
+}
+
+impl<C: CommandToGsp> CommandToGsp for SplitCommand<C> {
+    const FUNCTION: MsgFunction = C::FUNCTION;
+    type Command = C::Command;
+    type InitError = C::InitError;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        self.command.init()
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        self.payload.len()
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        dst.write_all(&self.payload)
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 6005362450cb..25fca1f6db2c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -202,6 +202,7 @@ pub(crate) enum MsgFunction {
     AllocObject = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
     AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
     BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
+    ContinuationRecord = bindings::NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD,
     Free = bindings::NV_VGPU_MSG_FUNCTION_FREE,
     GetGspStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
     GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
@@ -239,6 +240,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => Ok(MsgFunction::AllocObject),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
             bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
+            bindings::NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD => {
+                Ok(MsgFunction::ContinuationRecord)
+            }
             bindings::NV_VGPU_MSG_FUNCTION_FREE => Ok(MsgFunction::Free),
             bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => Ok(MsgFunction::GetGspStaticInfo),
             bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),

-- 
2.53.0

