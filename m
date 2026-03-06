Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SBo1BMqAqmkHSwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:22:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C8A21C634
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0248C10E396;
	Fri,  6 Mar 2026 07:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RS2KEe5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010067.outbound.protection.outlook.com [52.101.61.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F91110E396;
 Fri,  6 Mar 2026 07:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wZ/wx0UPwmjU4kNFFl9Dud3XPmZcxb5Hbf/8b9jDbXQyOx0q0/7YBBzbd2hmMxdW56o5M+6DFIyEveb//e9XsN3epylnIUENd4A74kw1SzLIBFs5P7YAruFgSHOfYU1O+JrSq0lHhCWbOk8VkAr+dlI44qveZJDbJx5B4Wrgpp4yrqyudYe8zBiYKn0tn0KauOpCfD/dIo9fBaN/OOSOximHm7zY+KpF645w/e1XB63a/ArISdzM4kP0PTgY3Lbb/U5A2Rdpo8n/9nG8snLw2u5SzNKcBYnmsD+OZa/6IPTiBRkN4Bx3o3mSL0Ft3vxGtUhF61MGFDrGHeHwETGY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhjPLt6NxTNFngqKhEkocI+NvtVDgY8YQLLP3r4SpW8=;
 b=gLl1VWD8v8VR3n9pQLLXDQArb40vOxam8GDU2vk4Bvhh/dX5gn/Pzf8JEAKQdcC5hPeVlGiMAm+DFNC8fid1+N1r8xDK2bPk22fDWMWzp/E8Ol8l0EBbHCkZpqyWgyNCJBoRoejNs/a3jHswnuLyciYqpZwLiJ8tod+jl9IstiwSnkMHBYlvZ33K5L0edKx1/4CU3kOqz/F5ygIC9gT2DKFPH/nuTYac5D6IrNaUPR4RdAEd2Rr6MrngbNCEWjd3yq2Ovd1s7T8xU8BZBG3qwnbtGxrCS7xlHg/iOJWIPRMS1wvGLrlXSLuzcr3vlVWnQtJ81nEhI2q0Qea1Ys1fuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhjPLt6NxTNFngqKhEkocI+NvtVDgY8YQLLP3r4SpW8=;
 b=RS2KEe5AKVBa1II1UeoTvETbLLKVzktBeJz+h8jTWZjY4gs1XviEWlg0m0V2T/4ClutRb4ahQbOdRq+B+8JL2tS1E0qvJYh3OSACXCrPMcokqyqSh9Taypgq8YqBVV9eIIDsmXKo771vZEtcXYHf108yjaYE0adq3wDMuuIFV7s9kBVzZDkyLan/7l9+98s/PRNEkXlK2EyudCtmooUA/jg6Pq1lfyiU2XgjWLTmimTQ8jyUtobIak4UJsu2+PBuZc51Xr0tqhZdd8ZT3sxQQ0LITosZ+dCGDvgZ9GmsRmTMo/3zVnXB5cc/FU93VFpPL25ciOgdo7/qDs/lUlT+eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Fri, 6 Mar
 2026 07:22:42 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 07:22:42 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 06 Mar 2026 16:22:06 +0900
Subject: [PATCH v6 9/9] gpu: nova-core: gsp: add tests for continuation records
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-cmdq-continuation-v6-9-cc7b629200ee@nvidia.com>
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
X-ClientProxiedBy: TY4PR01CA0106.jpnprd01.prod.outlook.com
 (2603:1096:405:378::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: c48f6ec0-fbac-40b5-666e-08de7b512765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: qownsbJh03gvXZq89MidlxO2OyNwaLxAiE62DhkT25UVc4CmwiCCc0+WFccASrDvbCzU+m3D2M38Hlx5pSDuvGT1k3z5HQAmhjFh/QhXgblp66Q9Vo1u44evhUuw5MeTS47IjyvmmR8kquBXSuhgkAYaiag/CbuVPybPlwsEf1kK4hxaaUzeqOCPh/D6lodlHaSR1C36AMB0d1LXBnRUATuin/c35T3M/tcM54KGpge5/OlreEToidNBb0qG5oFNBbGQR7VV7bdRSxHKj9ojejGsg4F4JjyEFF0cVOwQgKPFQWKuyITdFrgi97reOl7xNcKZgOzoLEfYPC6WA9O4GA13TF5efcdKAMRea2giqWCPNB2AHOsm3g/2pSwVL26BOATQwr8gd1Z1FHVJegP2XFKX5fiUDVemjW5rIexi/pS5CgOWWuftPrU6K4czXNkwY4lcqF3r4TLfOLjCCwZ8rKwnDqv6YxTEY4/7yEgXNqJU992RTKJ2yHFFagDk9xgsXCyZivLYkOeGQAdkb47zcq+BfTSKqO8jW1D5e1gXVOAoPDGM1RPdh8khGENt5cANCHIbbrqHUnv/z1jyYx3FKX53b6xwfXxo/b+oXWDYBxYHA/wL4m/VCIb+Uek56uraqdoRhtK2aLHc1D42gz+ounGYcA92gQHpTrGixFGbaj6sE7N7sxqSEpUERGRTXlsMSb8GI5rUXcKzjnykqXGFkEj/t3TxwBJtinCnXar74OvtsAZ5p324l6zU3MG9a4B10e+BH+yijBQuXPav65YGkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnA0TU1Xd3NVdlJ6WTFOb0RnZWRNRHNETC91alZyb04vSWg5b2w3WDRzd3pP?=
 =?utf-8?B?T3J4ZUV5V2JEQm4vdktFTmpybTdoRmtHcmtyMFUyZlVtY3pLOWxVaFh3Z2Rl?=
 =?utf-8?B?b0pxNDNiT2kyRWw4TldEMi9tdWwzZkduenkyc0tHRUczTEdLeEVyUUpWd1Nt?=
 =?utf-8?B?SXRlUWlXL2tkNTFEaFMxTThyWnRXNVpLTHB0cU5NWkkxZkJ0Zy9oV05PNmJG?=
 =?utf-8?B?anR1bDZJcEpDZzA5cXRPYndHeWl0NHBSRFJRNjNZNkk4cUlXNUd0blJVUytB?=
 =?utf-8?B?dVpSYkJrMnliYndkVk1va2pQdlM0QVpWbW5LN2E4bDVXdi9WNUh0SXNJSEp5?=
 =?utf-8?B?UERHNUNMSWVCR0Z0VXpaY1g4UDZxd3RsM3RPZzRia1BIUk1CcS90NjBlNTVv?=
 =?utf-8?B?MU5aUWlYVmtmRDV0eVNubG50cnMwNlBuN1lGNHFQOWgxZmF1T2pBN2NhbEJF?=
 =?utf-8?B?TVUzMGZVcEh5R2lUdzhWWnlGY1U5T2lqNkN0ZXJMVFRJNFFzdEZiRjZKOHBy?=
 =?utf-8?B?RU1YTUlIREMvSUp3SmFRT0hGOVVJOVFoVHNSSlN2U2RRSVJ3ak16YjFwSUJx?=
 =?utf-8?B?VW9NQUtkblhzaTJVMndkaXJpWFlPWjZYRitMTThFL2xHdkZqT05pdm1BeXNq?=
 =?utf-8?B?QllqczNXVHZWRUZDTXF4T3g3c24yQmFRSk1hSGdGbDVnbWF5Vkhuck81MTk0?=
 =?utf-8?B?Y3VGTDZxYkQyTjUrU3MxMlRra3FwN0RaMmJCQTBQNExrQzVPamFCdEZpRWc1?=
 =?utf-8?B?bUUxZWdPdEVRenVHV2VoMldrTXE0YWQvNUVOOXdUNkhuUDBsSURHRSs1VUM1?=
 =?utf-8?B?Qk5JSitpb0RaUld4V1QxWWlMM2FzSmlrNFdtM0llT1pNbS8xNTQyWE15Tlcx?=
 =?utf-8?B?bnMwZmZMTHdDWnUxbHB1T0dLajRFay9oQVlzWlpiSlk1RWZyMTEvdGRRUmVl?=
 =?utf-8?B?U1NKeUtqdnZoRDZJc1Vsak9IZy9EOWdaWGFvV0lCcHpoclVXeHEyZzQyY0tT?=
 =?utf-8?B?aFlSdStFNEV0VnovLzV5RWhpVjFZTFRFK2dwcnYyaXVYT0Y0WUkya2F1elpZ?=
 =?utf-8?B?VGlvRmJzMGVGN2pVR1lNTE85NUlpbHlxdTR2OUNZQjhyc1czUnVjQ3FXYlpI?=
 =?utf-8?B?ejZ5R2V5KzJkVWRKRVBZQkxGdkZMQmtEOU9JdDd6VXpaYUJuVnNia0NRSWZj?=
 =?utf-8?B?Tml1Uy9pQUZlNHN5L0w4aE0xbXNpblBqSkxQWXpyazlCSFRLRnhKYW1qaFVW?=
 =?utf-8?B?TGxOUWdlNGlGQ0NRL2EwRzhwZGVyK1dxZHc1em40bzM3ajZlNlVUcVhwYnBw?=
 =?utf-8?B?Rm5MK04zQ1pqZVlvTlFGQ2hWWThRTm1NNzNncE1iUXlEb3ErSUZ2VmVaVGlz?=
 =?utf-8?B?VitvVzJJRURFOGs5eG1TaEgyY1A3OE5uZXF1bHdPTWd0bUFNWitqbStHTGp3?=
 =?utf-8?B?anRNdnZ1V2RPQkVYZlFkbW5WOUtGUXphOWhRUXpZN2RlaDNpMjlycXhTS05C?=
 =?utf-8?B?K21PU25LL3RmZHpxb1V1ZGJzQWxob1RFWVB4dGZaNWo1eHBoTDVwWGcvZlFT?=
 =?utf-8?B?Zkd3TGg1YTZINEQrYmJkUGpvblNKdDFreWgxRWw3cGNYNDZFOUJOUFJKSGpX?=
 =?utf-8?B?Y3JPYzA0dDViWjdYYnU1NHpmVHNvajBEYkdKTk5MTm1JTUVabUMxVUcwOVp3?=
 =?utf-8?B?cDhORGc2M0MybWZ4cFRwZFh4bTVNbWFzK2NSSTBnSlFjMGpMcjdidU42dlR4?=
 =?utf-8?B?aE8zSXQyazV0bHVnTkZsWC8yNVBZUkJPQmFWTFdMNmtHMDVxY1Qzd1UwUGE5?=
 =?utf-8?B?dmNBQ1NTUXlkTXRvVy9SSnlkSkF3MDNydWY5WmxTR2RGdkRhelVrRU9ocGdv?=
 =?utf-8?B?T05vQ2F5VFU0K1ZTanFBelV3MytTdDFxR3dPVkJwM05IaW4vU1oxQzhXU0hU?=
 =?utf-8?B?ditldG4zV05YalJUMXZEUW56T2ZmUnZVK0Q4cWhUUisxRUQxQzJ0bFhBemUw?=
 =?utf-8?B?UFdZbmVvUHRsUUgwNFZVdmxQUE9HblZaUHplNkU3T2JLWGw2dTdneVZlSVVq?=
 =?utf-8?B?WGIwaG4rWStpejRkVVMrZWFnSllZRDhYeTZCOXRnQkwyQ2hRMXBKdnBxQ2FZ?=
 =?utf-8?B?MjlUK1VPSjg3Y2dhTDFKMWxWVitqZzh3eTluMjVmZjRUMUxiYzJjcUxDdTdF?=
 =?utf-8?B?M2JqUVFwelEzcXd5SFM2OHhtSWRFdUdnN01tdzBQTndnTWpVZUE0RmkvczZT?=
 =?utf-8?B?aWs5L0E2L2c1OHAwNFQvRFoxeXY3b0l6TXFjVmFPdVdPQnZycDh6MXp0dXB2?=
 =?utf-8?B?aWd6YTlQMm5pNzlwbjFtVkVRV082MWordkxXbkYrWVV6eWxiTGtoTENMN3g5?=
 =?utf-8?Q?MaxEsVH6NYls7woq9GDar05Lxins1kNc1of2F1MQanbVa?=
X-MS-Exchange-AntiSpam-MessageData-1: qUqOoQC9/IlKsA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c48f6ec0-fbac-40b5-666e-08de7b512765
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:22:41.9511 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kgDindNBS9gJkQGrfsXFUu8s1abF7jlSBr82/BNo/hy8xisvrGKxpmfqsXdxehEjfez0xO4LswYAWk+mEjaHQ==
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
X-Rspamd-Queue-Id: B4C8A21C634
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Action: no action

Add tests for continuation record splitting. They cover boundary
conditions at the split points to make sure the right number of
continuation records are made. They also check that the data
concatenated is correct.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq/continuation.rs | 138 +++++++++++++++++++++++++
 1 file changed, 138 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
index 67b3e03fd8ea..2aa17caac2e0 100644
--- a/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq/continuation.rs
@@ -161,3 +161,141 @@ fn init_variable_payload(
         dst.write_all(&self.payload)
     }
 }
+
+#[kunit_tests(nova_core_gsp_continuation)]
+mod tests {
+    use super::*;
+
+    use kernel::transmute::{
+        AsBytes,
+        FromBytes, //
+    };
+
+    /// Non-zero-sized command header for testing.
+    #[repr(C)]
+    #[derive(Clone, Copy, Zeroable)]
+    struct TestHeader([u8; 64]);
+
+    // SAFETY: `TestHeader` is a plain array of bytes for which all bit patterns are valid.
+    unsafe impl FromBytes for TestHeader {}
+
+    // SAFETY: `TestHeader` is a plain array of bytes for which all bit patterns are valid.
+    unsafe impl AsBytes for TestHeader {}
+
+    struct TestPayload {
+        data: KVVec<u8>,
+    }
+
+    impl TestPayload {
+        fn generate_pattern(len: usize) -> Result<KVVec<u8>> {
+            let mut data = KVVec::with_capacity(len, GFP_KERNEL)?;
+            for i in 0..len {
+                // Mix in higher bits so the pattern does not repeat every 256 bytes.
+                data.push((i ^ (i >> 8)) as u8, GFP_KERNEL)?;
+            }
+            Ok(data)
+        }
+
+        fn new(len: usize) -> Result<Self> {
+            Ok(Self {
+                data: Self::generate_pattern(len)?,
+            })
+        }
+    }
+
+    impl CommandToGsp for TestPayload {
+        const FUNCTION: MsgFunction = MsgFunction::Nop;
+        type Command = TestHeader;
+        type InitError = Infallible;
+
+        fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+            TestHeader::init_zeroed()
+        }
+
+        fn variable_payload_len(&self) -> usize {
+            self.data.len()
+        }
+
+        fn init_variable_payload(
+            &self,
+            dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+        ) -> Result {
+            dst.write_all(self.data.as_slice())
+        }
+    }
+
+    /// Maximum variable payload size that fits in the first command alongside the header.
+    const MAX_FIRST_PAYLOAD: usize = SplitState::<TestPayload>::MAX_FIRST_PAYLOAD;
+
+    fn read_payload(cmd: impl CommandToGsp) -> Result<KVVec<u8>> {
+        let len = cmd.variable_payload_len();
+        let mut buf = KVVec::from_elem(0u8, len, GFP_KERNEL)?;
+        let mut sbuf = SBufferIter::new_writer([buf.as_mut_slice(), &mut []]);
+        cmd.init_variable_payload(&mut sbuf)?;
+        drop(sbuf);
+        Ok(buf)
+    }
+
+    struct SplitTest {
+        payload_size: usize,
+        num_continuations: usize,
+    }
+
+    fn check_split(t: SplitTest) -> Result {
+        let payload = TestPayload::new(t.payload_size)?;
+        let mut num_continuations = 0;
+
+        let buf = match SplitState::new(payload)? {
+            SplitState::Single(cmd) => read_payload(cmd)?,
+            SplitState::Split(cmd, mut continuations) => {
+                let mut buf = read_payload(cmd)?;
+                assert!(size_of::<TestHeader>() + buf.len() <= MAX_CMD_SIZE);
+
+                while let Some(cont) = continuations.next() {
+                    let payload = read_payload(cont)?;
+                    assert!(payload.len() <= MAX_CMD_SIZE);
+                    buf.extend_from_slice(&payload, GFP_KERNEL)?;
+                    num_continuations += 1;
+                }
+
+                buf
+            }
+        };
+
+        assert_eq!(num_continuations, t.num_continuations);
+        assert_eq!(
+            buf.as_slice(),
+            TestPayload::generate_pattern(t.payload_size)?.as_slice()
+        );
+        Ok(())
+    }
+
+    #[test]
+    fn split_command() -> Result {
+        check_split(SplitTest {
+            payload_size: 0,
+            num_continuations: 0,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_FIRST_PAYLOAD,
+            num_continuations: 0,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_FIRST_PAYLOAD + 1,
+            num_continuations: 1,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_FIRST_PAYLOAD + MAX_CMD_SIZE,
+            num_continuations: 1,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_FIRST_PAYLOAD + MAX_CMD_SIZE + 1,
+            num_continuations: 2,
+        })?;
+        check_split(SplitTest {
+            payload_size: MAX_FIRST_PAYLOAD + MAX_CMD_SIZE * 3 + MAX_CMD_SIZE / 2,
+            num_continuations: 4,
+        })?;
+        Ok(())
+    }
+}

-- 
2.53.0

