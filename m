Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4MeULDSOp2nliAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B981F9970
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC0210E91E;
	Wed,  4 Mar 2026 01:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VoNS0jL2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011057.outbound.protection.outlook.com [52.101.52.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D2F10E91F;
 Wed,  4 Mar 2026 01:43:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anFwhf1uYFl0+5I1Vd/oVH+4EJ1Un5q6sdYehQwFLKlgnM55GbN6cIM1s5ItITfCF/1loQfUpPZ+1jjysDt57HDGkwcqBya6T2QlP1g/mayPBnnuq1EX5SjIkhXZeMV4xkWWa9Ued6/J56N4nMUB5oihTFIQyBvguP7+MfSo7/xGSbJGl/JOiz3Lwp1kgLO655HYZwPlQnStJqkCV7kUdTskw9MkJNEp5cw87y36cIWfkGgVpsKRgqEdSAWlSxtw+bzCWkuOJLxDo3J74jq7xXtKNtHTHyIqn7XsVf/XKu3SK3eRDHIJV5k2hXwPpeoeV1YE/5tmQOR3c742lhCIQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlV2elmORmaHKw7bZCVBzJCNQE8R07ffJJ9cr27FbKM=;
 b=oMfUfD2DYVOUQ/KFIudhmazXFqcpDtATEUgImhTrUYHaSkiTrvICDAiUCX+cnQBapEFzuWo1yRSVCkZzsNaN2YLzb7gF8tcILCa6Bk5nFzjXsD756BOeLOR4wsHIrIMVU9ERnXQKhUdJgrTih/DWfgdMP/gYfQ9kfHFxO4V9u2QpPknd3qAQH6j3yvTSCK8x7rGLclliZsm/X7mAunRHb3eu6XtAW6DgV2lvUM9CYyLGbuQsZTJk4FhA3pOT0L1lu2SG97NLmbVmqvf5VJUX5UMEkBSpkKe9tJRe+dIooU/70Ara9Roew8IiRhBdHwhrE1WqEBQ4lIfAUdt44tVerQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlV2elmORmaHKw7bZCVBzJCNQE8R07ffJJ9cr27FbKM=;
 b=VoNS0jL2YNy+Qhyya9ymMPoVU36ROYPuWGymN5gd/IYa4+lApKV0TIssopDFs1WwbRhL3MZSY4iPpU9arWc5JMUwk+gMY6WsKQOc2B6evMqHkdRNnqabkB+6EEQGo08jGJpb8gI3I58fxqSzdxeqYW61dUpsCO0HLlXjYp6DUvE+1nxZsAIgLQFq2+KqAh6vKKCAOmTCdAq48+VLMMY1FojLN5pSEYc9dz1cpd/ViqJ4neDVOSKLJLa1mJ+rsnkSi/MHBsEiczLwW8B8lns9pbwZD9U8L4bsTDRSg4tLRCs25qz2ivzonEBQhsUXw/07wkpMOT+E6jo7YJ7qBIz0XA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 01:43:09 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:43:09 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 10:42:17 +0900
Subject: [PATCH v5 1/9] gpu: nova-core: gsp: sort `MsgFunction` variants
 alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-continuation-v5-1-3f19d759ed93@nvidia.com>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
In-Reply-To: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c14b488-d4e0-497c-c23b-08de798f637f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: pwi2ww3t2YVriul+pF3KFEAx5qejbZjfKk6rHZcsknBhkmsfxRHSyk6lKCFKGBLeHht7yXXsoqYk1kZeqYcC3pNPxblQAFR3zzhs/YgUdQe5YAMQpzzIksh4YGydc7EPSn1Qq090fEheYlADwfM8+fcFuTUV3mis5GONXqvkb9MXEDHd3BRJKgF3Xeiz95NrBI/qh6NKJ/Y6ttIJkQvdwAeuGS3tyk8Hgep+KOD/eghSf01BD3/UIjBJoOWdC88BFpJpBFfTUbVcdmyDVAvhCxNsmJUv58Hu2CS7jgeaZ3A2pjWKgMACZys6quXh8Q5PWbLp4n1neI45zfgj00eIDmg6SOfnoteiMRruJQSaJ4BPEjUHhBkLMvlYMNTEIvK2o413+2SJNveq5idoGPDBgAVa1QYpcFRm/Mvugo9nTKpdOUFUFTs1RVOs/znTdg/g/N85SRPtmPM3B91zR1qP3sHTLbzu9/kA72UqAu1SQldnAaEMjjcZ/gGuQA7C/zl7dRnnu7bafVEz2OBlB5z1Jvjf/mfl5rPwR2HMNdsF8+xze9t+ZpdEPFBvFbIuGk+YaUQblqG7UBMhaVGOatXdDfdsMa2cHni+ZBDX/2+8ZA2NbM3TvakA/zA4HimOlKLiJ1OxBNRo8FLO3MEn4OnOjPHzUVt2bCcQOHg5ZDvTfHkTfkponfnN7N+ujz6WNIuhD/fZjT5Aj7KCiAZ/amLu1MEvnLzFK42FzMdYgTcRvGofz5Ip3dML5EpDprtGBekNCDxPdoYgwrZblSwaryMolA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZmVnVzNZc0RIM1VKb1FUaXJxRVg5WjN0c3ZUTlZvUmFNaUROc2hhbVJ1Ly9P?=
 =?utf-8?B?bmJObnM2WSt1UTJraG9ONDdFb09TTkFUS2pCUkpwOEZqWjh3cVlNb3lseFdQ?=
 =?utf-8?B?Q0c0Y3JsaUdURjZaaSs0QUZlelFpaFZTaTBnZ0Q5OFM3b0hrYlpldmlnM1hG?=
 =?utf-8?B?K0JtSEN6ZUV4VFozeW05REpVam90YkxNM2ZuWnN3Q0Y5YTJnbDJFVGYzVlZm?=
 =?utf-8?B?SHBtN0dYbnJmUVB2QVVkRzJsV1ZEMndQTWtjTlBZZ0dCTHVYd1FmRWhTNlVl?=
 =?utf-8?B?RGJQamt2Wkx3K0gzSkJhamdNclVLbjByQWNIWjhKQ04yK2RBallpa1VRMUIv?=
 =?utf-8?B?MU5VZEtVRThMd3VuR0VJOVJ5R0M3VjdEdVpNMmdoajgrMm05K1Izbng5QXp0?=
 =?utf-8?B?SW5JNXBPcTIva0E4SUJWRGtUbDhmTzhTWlc2S3BDdDhPQzRGSVQwTEJQNnZs?=
 =?utf-8?B?YWxzZFRlU0wwZHBRbXJlZEY2S3ZiNW1EdGN1cGV1K2JjU0dDbmIyNStzMWlw?=
 =?utf-8?B?cmt1RCtUMk4vZGdaTk1aVU42Rjlva1RvWlZuUE5KNVdEeFJQSXYzWnpNOWdZ?=
 =?utf-8?B?MjdoRkVGb09PaXB2REFKbzFrbmd0QklaT3VnaHFTcFVTcXRKUzZTbVFCaG9h?=
 =?utf-8?B?MDROemE3Ykczbys4SUt3VFFIai9sSnFXaGw0N3cxa050Q1NKSElFVWlTVXFz?=
 =?utf-8?B?SnRpTzdhTHNZSUJremxLUk9aV0NCUVc3elhHZTZLTU5HaGEzcVJ0YXVLRUtn?=
 =?utf-8?B?MEErRmdKdUFJaWo3SlpIcjU4ZWlJTmdKek53U0N1M05jaEFYYWFVMDJ5TU5Z?=
 =?utf-8?B?bWZycVBpbkgrM1pYekNLREJZdU9JVHBRU2ZPdDJCbytXSisrUHBCeUsyL3BM?=
 =?utf-8?B?aTZ6ajcrMU41NzBWd2ZvVGNESUNVVHJ1eTN6Rk9Fb2k5MGdKay9wbXkzTU5y?=
 =?utf-8?B?TWdEWktIRTBBc2hnMkYyN1Z0NEgwTjR3Mzk0OGpmQzhaTlQ4Y3oxU211RUJV?=
 =?utf-8?B?aTJQOHdSekx2WGtKd2JMblBxanZ4L21ZODZmVDNlZFVlcHhoOTdtcW1sWjRV?=
 =?utf-8?B?aGpZMmF0ZHk1L2xQdEFIQmN0RjJqRlQybGJ0N2puSWQ3LzJZQzZoZTNJYmpR?=
 =?utf-8?B?cTd2UEV3bGszOE1IcWF1M2NZeDZ6d2daNlF2cFlvV0hMU3hwOWcvQlA1dzFt?=
 =?utf-8?B?Q2gxNHd6M2VyWlNxa0pEQ1QvWWFFa1QzK0paRUNUUHJRNnhDRG9NUW9XY1lO?=
 =?utf-8?B?YnhEbkVhdmdrZWNOc1NXdG1kMU5wYVVTWW1iSnpjM2ljMVpYc2VPTUdvVFJw?=
 =?utf-8?B?eW13ZDQ3V3pHZFUwUUxKQTJ0U3hjOS9GYS9DS0FaMFZxQmJlUVh3eWVEb1Rv?=
 =?utf-8?B?Z1RZTjRQUGl1U2V0UUY0MTRqUjU2MnNmR2pXYmhQcE1NVmRwZ0p3UnFiWUlT?=
 =?utf-8?B?SHVuUm1BWTlQTWlnZi9pZ3FMNlVmWmN6N3B5clJkNG9LVHliNzA4Z3hrYWpB?=
 =?utf-8?B?STVyVXBLVVRYMjZIREhpb28wVGtlbUdsQVFtMktmOXpJdjNHanVHQ2lsWHcr?=
 =?utf-8?B?RUpTYmk2M1VwS21PYkRERTI3bFVRUm4xWFl3TmQwNncrbm1rSEZOa1pRVWRs?=
 =?utf-8?B?RCtnV3BwRE11bmtrM3JGb0c4R0hyVmxqVmlUSm1FT1I4eUtaZlQ3d3NMYTF0?=
 =?utf-8?B?ekpJTDdaTlM3NU44VHRFY25jTCtXYlRDOFdBNWNaMFB2dEZIVVNTZ3g4RElY?=
 =?utf-8?B?a2dFR1pSZUM3S3dQYmV2VnA0N0NqVmo5dHJNakFVQmZRYnkyUkdZQnVwTWFl?=
 =?utf-8?B?SnhaVDJUczkrVGRDeU1UUmIxeDNncXNzcldoNTd2VXVpdjJ4WDNrLzV1YjMw?=
 =?utf-8?B?RkVPaUhYUkRaT0M2ZGVNT2QrVWRRVnFrRTB4T1hMR0hXNEJNa0xSL1NWMnh4?=
 =?utf-8?B?TUJYdHV1aS84SVVFRnVxL1MxTFo1S3IzOUlHcmRCRWJxdnhNU0xBR0xpZlhz?=
 =?utf-8?B?YVB6akxvK3c5QVNBc09KSFVyU3FuSFJZQnM5RWNTdUFFL2NEOEdQNmo5SUYx?=
 =?utf-8?B?YWJYZWVzYlZucTEyNktsQWEzOHpNbnpqeC93SjArZnBNYnpnc3l1MjRvKzFU?=
 =?utf-8?B?VGo5VU01YVBiZE80MUxXT0Fqb0xnMUJtN3p2T0MrbWs0ZC9Pa0VUQmN6UlVn?=
 =?utf-8?B?RmFZZWU2V2RQV3hNczFsVnF4UGVCVC9uYS8rT215WXNINTA5ZlRKVnNoeCs0?=
 =?utf-8?B?YytWS2RTM21kNW9qTUxNQ2NYTzZlUitaOVVDVnM2dXVpV3FtN215eEE4cTBy?=
 =?utf-8?B?WW5nR1ZsSHoyTi9YcmpxWTEvMFpxNmNLRUNlTDhuOWRITFQyc2Z3NktRTlBZ?=
 =?utf-8?Q?fX3jDNfU2PtDwHgzhwnoNPP1w3UyxUIpwlzc7CR4L5dou?=
X-MS-Exchange-AntiSpam-MessageData-1: AO0MHiAQxLcJAg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c14b488-d4e0-497c-c23b-08de798f637f
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:43:09.1102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yJyjfaG+xD29N9Y4I7KP7j0P1xMSrT1yeIQCmORBA77v26R7PJ2SHVoigKZ+UrskGOpMktdXlYGzT84SlfvWIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6545
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
X-Rspamd-Queue-Id: 62B981F9970
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Action: no action

There is no particular order required here and keeping them alphabetical
will help preventing future mistakes.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 67 +++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f1797e1f0d9d..4b998485360b 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -191,34 +191,34 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
 #[repr(u32)]
 pub(crate) enum MsgFunction {
     // Common function codes
-    Nop = bindings::NV_VGPU_MSG_FUNCTION_NOP,
-    SetGuestSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
-    AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
+    AllocChannelDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
+    AllocCtxDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
     AllocDevice = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
     AllocMemory = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY,
-    AllocCtxDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
-    AllocChannelDma = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA,
-    MapMemory = bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
-    BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
     AllocObject = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
+    AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
+    BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
     Free = bindings::NV_VGPU_MSG_FUNCTION_FREE,
-    Log = bindings::NV_VGPU_MSG_FUNCTION_LOG,
     GetGspStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
-    SetRegistry = bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
-    GspSetSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
+    GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
     GspInitPostObjGpu = bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU,
     GspRmControl = bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
-    GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
+    GspSetSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
+    Log = bindings::NV_VGPU_MSG_FUNCTION_LOG,
+    MapMemory = bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
+    Nop = bindings::NV_VGPU_MSG_FUNCTION_NOP,
+    SetGuestSystemInfo = bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO,
+    SetRegistry = bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
 
     // Event codes
     GspInitDone = bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
+    GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
+    GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
     GspRunCpuSequencer = bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
-    PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
-    RcTriggered = bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
     MmuFaultQueued = bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
     OsErrorLog = bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
-    GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
-    GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
+    PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
+    RcTriggered = bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
     UcodeLibOsPrint = bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
 }
 
@@ -227,38 +227,41 @@ impl TryFrom<u32> for MsgFunction {
 
     fn try_from(value: u32) -> Result<MsgFunction> {
         match value {
-            bindings::NV_VGPU_MSG_FUNCTION_NOP => Ok(MsgFunction::Nop),
-            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => {
-                Ok(MsgFunction::SetGuestSystemInfo)
-            }
-            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
+            // Common function codes
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => Ok(MsgFunction::AllocChannelDma),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => Ok(MsgFunction::AllocCtxDma),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE => Ok(MsgFunction::AllocDevice),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY => Ok(MsgFunction::AllocMemory),
-            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA => Ok(MsgFunction::AllocCtxDma),
-            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA => Ok(MsgFunction::AllocChannelDma),
-            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY => Ok(MsgFunction::MapMemory),
-            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => Ok(MsgFunction::AllocObject),
+            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
+            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
             bindings::NV_VGPU_MSG_FUNCTION_FREE => Ok(MsgFunction::Free),
-            bindings::NV_VGPU_MSG_FUNCTION_LOG => Ok(MsgFunction::Log),
             bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => Ok(MsgFunction::GetGspStaticInfo),
-            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY => Ok(MsgFunction::SetRegistry),
-            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => Ok(MsgFunction::GspSetSystemInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),
             bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU => {
                 Ok(MsgFunction::GspInitPostObjGpu)
             }
             bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL => Ok(MsgFunction::GspRmControl),
-            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO => Ok(MsgFunction::GspSetSystemInfo),
+            bindings::NV_VGPU_MSG_FUNCTION_LOG => Ok(MsgFunction::Log),
+            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY => Ok(MsgFunction::MapMemory),
+            bindings::NV_VGPU_MSG_FUNCTION_NOP => Ok(MsgFunction::Nop),
+            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO => {
+                Ok(MsgFunction::SetGuestSystemInfo)
+            }
+            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY => Ok(MsgFunction::SetRegistry),
+
+            // Event codes
             bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE => Ok(MsgFunction::GspInitDone),
+            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => Ok(MsgFunction::GspLockdownNotice),
+            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => Ok(MsgFunction::GspPostNoCat),
             bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
                 Ok(MsgFunction::GspRunCpuSequencer)
             }
-            bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
-            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED => Ok(MsgFunction::RcTriggered),
             bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED => Ok(MsgFunction::MmuFaultQueued),
             bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG => Ok(MsgFunction::OsErrorLog),
-            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => Ok(MsgFunction::GspPostNoCat),
-            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => Ok(MsgFunction::GspLockdownNotice),
+            bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
+            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED => Ok(MsgFunction::RcTriggered),
             bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT => Ok(MsgFunction::UcodeLibOsPrint),
             _ => Err(EINVAL),
         }

-- 
2.53.0

