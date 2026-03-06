Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gIpiM69dqmkVQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 807BC21B882
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FEE610E35F;
	Fri,  6 Mar 2026 04:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gYIC+fAJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011021.outbound.protection.outlook.com [52.101.57.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1740310E35F;
 Fri,  6 Mar 2026 04:53:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JdGMzOkqaK5lwZxXCwywC0szzw/QvHtCZytweGceFljC+RrNvM1j9xbzDL4Ft1QLeq3kgi4WAYYTignWScrZFe6dTp+P+8PN5UgRoQ/GmWGVot/+RaMfM6KCzZpFnCby3gh70G9BP57M3VRNYKVYBXV5BGy2+x90R73fpa4XsrVahmaAGZ89CbkKGXrUu+Vu2PaBUdYn1e9HhvMZnwU8U0B1JhfwT+WoyDuPI58lRRKYDnWx7gluiMXnS6UiRul6N7AWZFvjtXNlXI40C6aAdBKH8mrGgl2C8D/aetn9I4gqpBHUaERtrXTc5g7IBvguU42JU1OJIv4+V4wQwSsaUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7/uKOW9wwl7B9mazzKQg6AYuhSUJOjd3/mq2W8PaQ4=;
 b=bqFabOMjoZ6tHlbeCYaQpmNdve0RkH69A+k4vmVuvwidpP6gbzGzQhz/qQojz+xR7cd2gZsgNdcOjezVrxSsDIndjtliQ4xMZD4npSr5HEBtabTc4ynyJJuU0sLLj0XpYOrVbT9Xfd38MKJSgnCW1v1wgoBtKxuV8eQfq4Q/C4E+8mx8O7/pRgcEZBKvKrdh67MDldMzXH2AZY0ltyKiAk0eYxAweNLPsIbMKEtMha6d+yHSn1fZhJ8Lu6JbSbjnS4QgtdkutW3/shCDRdSRovZz/5WpIIhieRwg28fraFBSWiJVzTCtziCJ0DlMKrNI58W1B2TPKoE8wUNRxNKVEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7/uKOW9wwl7B9mazzKQg6AYuhSUJOjd3/mq2W8PaQ4=;
 b=gYIC+fAJqzJfoQWGRq6NJSx9kYSs3F8AJSDL4fC5yg1NURF45DNvjIpFbYeGsaVyFLHU2XZUb3tQC3A++uIDglxFXTc5aOXGsZIwkHFHPRw1XCPvjaY2YKKKJ8QJQmOoiFqlJohPcoyisaa7kz7y6QzyFRDriNTsJq658Z3UJ8U6eXTE1KpD44JbTmA+cyY/IfUrxNDke6CL3fkt0wZbaLgtOUtB3sfH+BTNiLz0kHCywZs81dZrjfVSi5Cte08mqWYG/X2YVrOxiYj9kVEQwb8oj8agl4kgeo8nSKfRdsozO3/zEqnrOJgCBoFwV8wgwc6Pn7OPdQf7wCAVAoY3ug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 04:52:55 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:52:55 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:39 +0900
Subject: [PATCH v11 02/12] gpu: nova-core: falcon: add constant for memory
 block alignment
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-2-8f0042c5d026@nvidia.com>
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
In-Reply-To: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0110.jpnprd01.prod.outlook.com
 (2603:1096:405:4::26) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d8bd01-356d-4fcc-bc3e-08de7b3c3ad3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 1MbcEjTByEsMRw+hvaFgoyBuc0pSEWMWxqZN+piklnlrTxJVNAoI39ZWRdmPrCYF8YFT9RNUMiSKYlSodaBHu+44z08iogQbIh8IN64SdNGkydPg6BWKteYN2fA7sWUukH0bd+8ERXDpSDaX9GZ/RNYdTjpBFwwzV1iMM6F87+MS/G+LJEsXZ5pGcMjT3pdMPVU+pHlQHMASSlVJpKfupUuRGFgHrHTZg69EYdda0sUjC0pGDlt/+uCz0JJ9El0p9mpx1nIu7MQt1kNP3G756+jWib2DCUJO9mgIpd/aID2jTAJ1j1x48lRbbAEZNaxTnl4VMndPsJQfx1Mw4b/BSQCX51nm1fd3Jtl8svt2i5KFpqst82ta8pN3z6a9xHGlzuqBbnTTfcVl9q2nfLCvlKjkIfAD1yGxJrkfB2qBOrhPNamuqTFtED6y6L+QT3L673AlcTTSqfPoTwrHDzhFXvxf6I93/auCjku/qxbo+BpTNZJWyUfY7Z18eektaeA0K6rFS9+DvYS+kpZPGxkZg4M8jF1WJ1OIPTIhDykq01M0briY2EzEYNgbt6f1SMHBlyTLYuIW1LsYwu89NF5YNJYD3lN36xcpfVk5vRsxslEO9FamdeGo1RN8n1xE4K+Ydnb81BulnLxKIqlAQtN7Dt6a+hcZzrgkNxXVuDdqCNYd20Rui8ypWGf+8lCrt0618f/3TXAWSQTKRUP3bjwU/XbW8fvjHTHkgkEyrtzyQh4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzlaZ3NjMmdseVdBZ1RwZGZqQy9YNko1cGtIUDM1UE1weU5DMFFDelZKNnJ3?=
 =?utf-8?B?dUV4bEZuY2dKNHpxMElzSy8yaCtLeGR4SnVvUHRmbVFncDVsczF3aGZ3QXZ4?=
 =?utf-8?B?KzJxS1dCSHBFWkcvZmsyR0JjeUt6K1c5N1ZJaEFTK1hDTGZvdXVIQmRLUGJF?=
 =?utf-8?B?dGpiSURKZWljbG9rYnJ1Ly95V01WNGtFRTNEdm9wdkFFNy82cGVWWEk4aUps?=
 =?utf-8?B?N2M1eEs4aFpRYW1wK0NrL2lKNHJWV2FxSWhZODZWMGpYaFEwZ1V3VkVoT0Zm?=
 =?utf-8?B?UWdHeGxwRm1BcXhPQnMxWU9uYVlrODFXWUQrTmRaVFdaT3htTkVRSThIbGhS?=
 =?utf-8?B?RVIxU2hNVHJ0aVFqNUZad2p3STJSNG9UREprOGkrRk9YeXVhQjNxcks4d0Jk?=
 =?utf-8?B?VGpFSVpUWVNHa2ROUTN6RVltQmJtNVIzZ1FQbWV2OTk0TTkrd01QbVRKRVM0?=
 =?utf-8?B?cm9Oc2JHQjRTbXNnU3JLRlR2Tk5iQlJzbjZUOVZScjAyMkZDQmlIbVEvbHdr?=
 =?utf-8?B?N2VuUS90V3Y5c2R5L3JOVkMxaDhLRzR4YnkwbWVJUVY5dnRKTDV4b3gvcU12?=
 =?utf-8?B?Rko2LzRzVmY0UFIvL2FadGo0R21vbk1RSHVNZXdWZXR5TlpSbDlvYmRySjYx?=
 =?utf-8?B?Q1M0aXNRU1JLV0JPQ2FvVVVFYmZzWitUSmt1K2lldjhNMDNDQ2hFTVpzTUky?=
 =?utf-8?B?clFSZHNoNTVBejNJMDFkVHgzWlRvQ1hQRUI4ZGsyL2h6dk1lc21YMW5hWEJ0?=
 =?utf-8?B?Sld5VmpBUXlLUG95d1M2M2FQTkxGbkh1RnRseHF2THNKNEtHZ2x1SUdYUExO?=
 =?utf-8?B?MDNNeXo2cC9aRUR2NVVtSTVmUEtoQ0x3OFk1cmdKWkxGVW1MN2NXNld5V2Fj?=
 =?utf-8?B?clVYY21nV3ZNUDl1OGx1RyszY2hYMTF6aDRmNUdCS2Y1SzVKVFVoR3FZdEJB?=
 =?utf-8?B?M0NqcThiNnQ3dm14WUJFU24vRUdNb2huOGVNWlcveW1kNlpNRzZWNkdjQmFG?=
 =?utf-8?B?bEFqRy8rWTg2ZFg0NEZsaXFrbjUzVU1pbElaWU82bHJkZE1XSWJUSDF0OG9Q?=
 =?utf-8?B?cThhcG9VaVhFK01rb2FXWXZJNTNQek8xQkdydU12cHJKMS91UnI0UmhkZVhO?=
 =?utf-8?B?Z2lUeGN0eVJCNWZEQUplQXJEeXlzTlU3eU1EZnd2b3NmRE5VUjV2UDBablpR?=
 =?utf-8?B?RGxDY1Q5dTNtZnZ2R3RNeThpd3drWjM3WUx5LzBiYy9QYWxwVkVkTVh1SHJK?=
 =?utf-8?B?YzBvWXZZc0JLU2RETmNTYzArYW0vZStWTEtFcmlxQ0QzMXVrRVR4elRiMEo0?=
 =?utf-8?B?NW12cWdVQjlWdXpJYjFmaW1FSHNISTRCNkp6WGE3TlhVMk0zSjFsYWRBelZN?=
 =?utf-8?B?cUVFWENMTWR5M0tlSm5vOS91RElhZ0tuZ3RzVUNWcDlueDNzaFBaend6MlhP?=
 =?utf-8?B?YVgzdVBsY1EwK3RKM3pIZ3Zab0UvaUdzYXlFd2RMd2hrWGR1aURiMEFSMzJu?=
 =?utf-8?B?WjRPKzZocEc4c245cEN4K1ovaTBob2NqTGptYWFiaitHSEtRY2Y4U0RrakNK?=
 =?utf-8?B?K2x4emZTeVluYnlJa1RYdWg4VFRTMXpidlNjS0hqSDNEK0FUeDhDaEJUMG5E?=
 =?utf-8?B?K2hqTE1SMWFtUjRIYkNueERETzdyazgycGJCZURJSEhwLytXTjUxOUJlVStl?=
 =?utf-8?B?ZWN3a2Nha2hTdXA0NWRNNlZ2QWtSSm5tWnRIWmt5bGxwc2pxV3d3SmJkV0Vu?=
 =?utf-8?B?RzI3U3hBTXQ5TjFqZHp4YmZRS3pPSTc5TWFSU0VZWTREM3pncjZNS0JSMEVK?=
 =?utf-8?B?aWxwcFAvRFFRamRmK2pVYXYvQTNZMndIYS81b2lJNy85L3RiTW5GeGFSU1RB?=
 =?utf-8?B?NXV1YTVBcmJTSXdva0dtQXZKbGdFZTk3VU1qR1hRVTZYNno0OWdEVDJqcXFV?=
 =?utf-8?B?RDdNTUZsNUtiUWJsNkxZQ0FVRkxNYkRJd3Noa28zSEFoZUNGZnRHYU5XbU9z?=
 =?utf-8?B?NThsL1FGUk9IMzVpcldHRmhFa003VmdhZzhtMkx1dkM3RFY4c1NqRmVuQXRv?=
 =?utf-8?B?U01HakZEa2hTUHVWZmZBc0ptNGZoZWdOL2ppSG82aVI5VFFYcFJwclJ1QnFK?=
 =?utf-8?B?Y2JHRGVmV1M4V3FOQjU1RjJJUm1wQzZ3R29hczlFTnhLeUJ2V3ZuaEZIMkE4?=
 =?utf-8?B?aE8wSHN5N3FjZTgzUE44RWdYTHIzc0k3M08vVmVnUmNmU015ck5iZ0NIWWgv?=
 =?utf-8?B?UmVSSzFSalgyQWFLcXFkNmY3Nyt5d29TVDhCbjlIV2xiNUlpMVVRTnU4Z1FB?=
 =?utf-8?B?bnlHZ0lMWXZiRVcyYlVzTUg4eUxPbXJFV1FMNVhtSXAwSUt4QS9hbVlpN0sv?=
 =?utf-8?Q?VY6FOpsTA9cca5UYdtiRiYB6//nR7+8UI9L9z3ilRCrQk?=
X-MS-Exchange-AntiSpam-MessageData-1: b8jJfMVqy9E+oQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d8bd01-356d-4fcc-bc3e-08de7b3c3ad3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:52:54.9564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wslLQl9qb6Dn5gA7PjWw7JsM987afdHnD+MQSxFMq3QIEcRwwWLcYNCPjfuZrRua+MtnsznqP8k6wHrhaQ4T5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6569
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
X-Rspamd-Queue-Id: 807BC21B882
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
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

Falcon memory blocks are 256 bytes in size. This is a hard constant on
all models.

This value was hardcoded, so turn it into a documented constant. It will
also become useful with the PIO loading code.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 8d444cf9d55c..31217cd3a795 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -25,6 +25,7 @@
     falcon::hal::LoadMethod,
     gpu::Chipset,
     num::{
+        self,
         FromSafeCast,
         IntoSafeCast, //
     },
@@ -36,6 +37,9 @@
 mod hal;
 pub(crate) mod sec2;
 
+/// Alignment (in bytes) of falcon memory blocks.
+pub(crate) const MEM_BLOCK_ALIGNMENT: usize = 256;
+
 // TODO[FPRI]: Replace with `ToPrimitive`.
 macro_rules! impl_from_enum_to_u8 {
     ($enum_type:ty) => {
@@ -423,7 +427,7 @@ fn dma_wr(
         target_mem: FalconMem,
         load_offsets: FalconLoadTarget,
     ) -> Result {
-        const DMA_LEN: u32 = 256;
+        const DMA_LEN: u32 = num::usize_into_u32::<{ MEM_BLOCK_ALIGNMENT }>();
 
         // For IMEM, we want to use the start offset as a virtual address tag for each page, since
         // code addresses in the firmware (and the boot vector) are virtual.

-- 
2.53.0

