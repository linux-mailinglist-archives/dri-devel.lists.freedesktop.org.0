Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGXvM6uAqmkHSwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:22:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A43721C5D0
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90ECA10E399;
	Fri,  6 Mar 2026 07:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VypXoRCC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012013.outbound.protection.outlook.com [52.101.53.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371F810E38C;
 Fri,  6 Mar 2026 07:22:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d4ipT/D43IS3vvXkRcVplAUovybAl6L3MocDgE1ZDO8+U8b4KiZX6WSQYpUSoT1JGANuYoUyQgqKVlXzT+3xju5WINBvCJAzEO2bL/HPsEDJr6/7hF8iXFFklwvhj0+GCF+sf+vIsub5oH5TQi5BIx8Ntx19Fn4ObqstdEtT7F0Z5++9niTVQBh6KnkL9q4h0QIle3TidxLYnzDzL+m9xwh5PSYSKT44UJE8X2E4YnNBzXclmo07gMtC7CKa+vUH0JvGJZD5EQEpnAUeUx33w0le6echHIRlvGMax0acWjaL2gREGkNwSnI085ShLV06hVKjc5M0xiLeqvdT8LZTDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RlV2elmORmaHKw7bZCVBzJCNQE8R07ffJJ9cr27FbKM=;
 b=biWrdxztGv2ETXR5IabzdXIhVZyx6j/oY4Cou7i1X1zPNN5FSLGJDMcsMZ3WO2yaPLhSyoVdfbO8anvMFYRDFN3EyTmEgy62ePoYiNm45LVAdT1YPeEBeyYdSq10VDiZqLY+NlaIjEFixKKZwc3blNSndvjSYQmIr2XxA6a4Tm6Vmv/VGvJNkEb3i+Uy5LQ9x1AWVX7d8BdNIWSvPrgeTMJ7BLURgjYPSMQTBSx16wETlhvO9dUe2C3rQJNqVPsz+av3OnofkP5hHADYCFVniWd6nnoa9RVLtZg9BkDUXr7Mb9RKKXHoRh4CKycEcUzmF6K1ek5mUKjty8ZYXmJAQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RlV2elmORmaHKw7bZCVBzJCNQE8R07ffJJ9cr27FbKM=;
 b=VypXoRCC3Z8XVftRbRxRz/X+dkTbx8y6RTXl35JfWx+iPLqMp3xTu47e93+DhZBaq/Ma8pbr8daPTOdeZwAexAXGAbfTLp9uaSCqUR9vVK6Rz3b67qSM7MMFEUuggWOKuDXIllWYsDyn+8ciyiIhjwOrNXQrYsW5X6+ksjugBJvbakWQ68QmAoA3Y+XtH9cVjAnNBVZJ58Da7YMkJY3+7ftcElt+h6QDU6DiSOfr2eDv5kn5WrnLhZoKGoH2ADT/KC7sU4K1CUxYKNmiwC/LoDAThUrtxwbHwcm2RBd6s87vUqLWQwQm8DRd9oilAV3w1pZNKAS5KtAcmOO/56KKjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA3PR12MB7951.namprd12.prod.outlook.com (2603:10b6:806:318::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 07:22:11 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 07:22:11 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 06 Mar 2026 16:21:58 +0900
Subject: [PATCH v6 1/9] gpu: nova-core: gsp: sort `MsgFunction` variants
 alphabetically
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-cmdq-continuation-v6-1-cc7b629200ee@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0022.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::14) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA3PR12MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: d6def3da-bd66-428b-4e78-08de7b511507
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: J81J5fNCwH/R+MJqCDreQzPABDBXuNYjv1EepALHi1csjrwBPN+ysnbpgp0TIzQbw4ohdPrpYDe2o3YZtnEEsrrP2cc5ARVCWx5ofBeKheS5sL9iV0t9UkSEQ5WOjQ186iHCyMsYYo/kB9B7WZMiGaAXKSygJD6UYxHvgyE5wkVQEx+N42dM8BS0GeKf2suk7jp8ioJj19D0e2WhzOP7zp2wcr8lAapTYNY8JI20ApedJTrvJo3qNzvleTZMXBKOJaLzZA0q+B5Yy2cGqhrY0tZQvqXafYGWr5stN3Y3lzr5suyMng3ndukAyJTSWtSLXp6o7+o4Fadl+z/dJBc2maZNeSwDNs8KRg5C91u9wWKrNR/2H+npuSJORxqV0tEzxIUfdp1PAMCfeKN5MyZ3D9smBktazX08Gl2HCZEQn8booM4Shh/AszpC7djBBrtQRaxfzC8Mtj7M9xIiF8Tf3ksM60PHigqKp93a94188xkYEQr3/nlOz2CJOQsM5mRrPlyh2edSWq+c6WVzPTSTn8VwD+6IgLH3emiEeJEHjYVrQGBtdoxuZTHBDfnNNEqSxq//E+W3VvWXKrdRML9eZPaPsz1Xk1ZSXTFGbgzttG3gaLfTY/JGZGiQ9PqowQVMiXklTor3wXXEScvQOT9/dQ8lAq+ltowTSvQLkcrl1nRFAX51XFEiF+6POkRVB8h+YvPMMbqZcSTuadOfrSvuC+1BsQC4CCCwEAADmaxRopAjD+NydS7jr4vH8I1OSc8vG1IEkgcUd7xJqlMGLumoeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZXE3RHZlbWsyRFZ4dVlSRCtOWmJpWS81V2ZMeWJxTTBDamMvaDdLR0llaFFn?=
 =?utf-8?B?Z0s3dUptQytXWVdOQ1NCSEpHeEM3RFQxa1RTdSt0TGVvQmlGcCt1VVRFUnNT?=
 =?utf-8?B?OW5NRm1sRVozdW1lTlZuRFNDTWVwU1p3RFFuekR5TmsrSG4wVWtaaFNGV05Q?=
 =?utf-8?B?QzJvUWdIemhHVm0xbnZ1dGxXdXdLV0Y3bmZLaXBRMlNWZTB5TzNDUTZoYXlB?=
 =?utf-8?B?b1VuUHJrSjBESUEvcloyMWtPNjB4WjM5cEt2Mm9GZ0pzUjZBbitad2Z5L09N?=
 =?utf-8?B?MDNXMjJzRlptTFRKM3BKTXVMQ2JWanpQYXBaYjhySWlVYU5sNDhuVzNwYUFk?=
 =?utf-8?B?UXVydFc0c3JzSXdNTittZUxkczBFVUxTakpDdHIzVEdaamRwa3hhWHloQTJI?=
 =?utf-8?B?OUFvWHdnZGZuM0NDU2ZkU2ZINlhMb3hhazgranFUaWVsMGp4NUVITllnZlVq?=
 =?utf-8?B?Y3VJcE02aVpEL1BXci81U2JrQngzem5NK2krVE14V0ZWMDRUeWg4MTV6bnNQ?=
 =?utf-8?B?WmxlZzM2anZidFlWSTVKS0FZRzd6TTg2UFhHTDB3eVY4bjRLNDh0cXcyWEZ3?=
 =?utf-8?B?TlZ5ZW9lclZpYkNiNUJIVnFENy9oenR5emFrYVM2bUdnNHFlRXNNRlpLM25I?=
 =?utf-8?B?VEM2K3NFY1F3TE9WSjJTcVRCZmpBREZCVEN2andsMVROdm9xL25jWWhuRUsy?=
 =?utf-8?B?WHRZQ1lVdGNMR2FrUmE5bm5UYmk1dXdLOE5ROVZNUXNUbWl4dGFESzVRUTk5?=
 =?utf-8?B?YlF1Y3VPUFd1NkdtaUZqcmpZSjY1ZkVJTVp2ODhmb0ZyVnQ5VERoS0p4WlB6?=
 =?utf-8?B?VzR2NVB5R1R0T1BaazAvdnFXeXpjM3REZG9xTGV0SStzZkpOOCsrZnJhZThp?=
 =?utf-8?B?L3BYODZiUmRhd21ITnhMcloyVGdMRHppU2F3K0dkbVpxMlY4d0UzRmZZdmF0?=
 =?utf-8?B?SXZvUU9ZRkFtbUVodUF4NGhjUXM4akE2d0YxTlk3bEM0WWVwWGZUcjhpa0pj?=
 =?utf-8?B?VWxkbUxQcmt0L0poaXJMRmlDeWJhYXloN1JFMGFlNGR6TUhDOFFJUTFNcFRQ?=
 =?utf-8?B?ZjhnT3FCZnR6N2hqL1FaTkNpenRYUDNGUVUxQ2NDWHJMU09EaFNSNDBMWWtn?=
 =?utf-8?B?ZmdENFpOdHoySWt0czdVYUp4U2JLYlZnaFBTZm1RcDMxUi8yMjRhTVVrb1ow?=
 =?utf-8?B?KzgwVFA4ZDhKOGRNc1h0RStjSGVMRTl5MzNVK1VrR3hZcU9BOVlOb1M5WmYy?=
 =?utf-8?B?VGUwYW44MFBseloyVVVCcXJ3dHM1NXpZWGlNbWJRZEowV2Qzcy9mRHFyYWdC?=
 =?utf-8?B?QjFwUUlBclJLNGQxZlI4bGViRnhJVGhGMnptd1JaQU8yM004bU1VUUtJekI5?=
 =?utf-8?B?cVZmcFh1cXhDWHI5cmVoN0w1WUNiVHFzaW1iTjBNK2dxRG56TlIwcm5ucm00?=
 =?utf-8?B?d1pxMlJVV3IrQzl4UnBTR3RSS2lpL050VmMzV2VCWk14RkZrT0VwbVlaeklM?=
 =?utf-8?B?WmFLbXVWWElxZVJ5Q2VJM0Yxcmh6aXRzZ0VrWm5WUEx3eWh4SG1vTzNyVERi?=
 =?utf-8?B?a0twaU0zRG5KOGpyR0pzeEZCL1ZBQVFMOTcwdStvYm5GckpsMkpxaFpaN2hL?=
 =?utf-8?B?bDdnbngrWkdZSmZ0U1MwclFkTFFsL1hoTnFwSXBiY0I0U3B3ZGlZRWlRK1JZ?=
 =?utf-8?B?a2xYVVFxdzhpc0FIWTdWeldmNC9uZ2RUUGVHeUl6MmtURnNkcjB3eW1PZWJm?=
 =?utf-8?B?Z3FWUStpR21FK256OTJNSVFYVVpzQ2ZGN05SQ1BEbktVTGVDRSsyaUNWckRl?=
 =?utf-8?B?cjF4eTBDU3UvaU9SdUtJbk8xS3Y4dGdqVW92S3BuMC9WaWV5OGNabW1SdStI?=
 =?utf-8?B?Z09nb2lnazQ5QzVpaWErMFdRWEsraVFWV0NQNnR6OFI5RWx3THJ3VmI1aHk0?=
 =?utf-8?B?OWR3ZjlMTUFuWFVVM3R4bUpiL0g0WWhpNmJlWUl0L1l1WWVNUDRXcy9rVXlJ?=
 =?utf-8?B?Q2cxblZRL3JLVjFzZktZeldvZ213SFZheFowYmJEemFIZWY0Qm9DQndONzR5?=
 =?utf-8?B?dzd0RHNWTE54UTRwRVF2TzR5bXR0ZnROWjl4UFpwcG5DTjd1aUEyQ0p6cDBX?=
 =?utf-8?B?ZmJRT3lzVWNrMUY3Q2ZMWCs4SXMyN1RoNE1xaGtaSjI0ZkFsaU0xbEJ1NlIz?=
 =?utf-8?B?R3NMT2wvNytHRW0yci9mOVdtVUhQT3ZNQlVuTDFpdFJhOHhnU3JXcnBubFlM?=
 =?utf-8?B?RFNPMjZ1a0VsdE4zNFBmTkk2T3QwdkVKN3RPTjkrOXJjbXgrSzJhYTBOVjk5?=
 =?utf-8?B?OUJtQlB6RG1ZVmpkZEhqME41Tk5vM1dFeFpuRHM3Y3lpR211TXBMeW5MV256?=
 =?utf-8?Q?5VEOJKZbxWkn+rpXWA7prveD72ydLODeiWicSmk41REJ5?=
X-MS-Exchange-AntiSpam-MessageData-1: 8wAhL0aKOv3Z/g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6def3da-bd66-428b-4e78-08de7b511507
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:22:10.9626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZQO0VYgrmvcprmLmIWwH6ByeoOp4HBM07YGKb5krfyUarKD2GvkH3GhmMHHQG1B9SSo752r/Qsl6371phnlZ/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7951
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
X-Rspamd-Queue-Id: 6A43721C5D0
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
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

