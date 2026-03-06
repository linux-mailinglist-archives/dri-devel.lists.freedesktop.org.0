Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yN/IB7tdqmkVQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40D821B8AF
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD7D10E37C;
	Fri,  6 Mar 2026 04:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m+goh4er";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010017.outbound.protection.outlook.com [52.101.85.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CDA10E346;
 Fri,  6 Mar 2026 04:53:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgEgsUmEROn2zQnz1l5n/QbFyz7PQ2kvjt6uR7IiwEqEq8mVq7tnoint/BNmHn7f4FnZrNx3uT2MJm7DffBYShq1LTj6+ieyCtQKrdePLVU79dQQLXtzFKpvSAWzHY8o7ni59pa4yG/oe17Z5CY0zMpHVDUVTDG9fZDTyAM5XrywOkQbyFYy3XDUjOPaiCwZQLa0RwM8ITfnV5Y64lygiWO73n1SbsR4774Qrqt3kIgmTu/wzUhTTN19rmIKahZOnNCRHOOGcjqgDGuho0R/wispCwCTpwUaxr5QinIEcJUMt3Fbwl3a7iTirAoDpJZiB7KWvGHmjgpuOckD5OG3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BX6DDh/wZrB34iiwGQ13gVJkVFsoaIv4ts9A0+ZlAnE=;
 b=VSflrpxE1GNqeVPJGGU3rt84nv0tkGqt6phppDwl+54O0FWkBlXXmxLm1zdjuRmY4TAcz/KBmGeWfbUT3wPVFNlcX4/20Jy8dePrNv7LinAgoJAGOOaNSCFC7OgtXlrLyBkwN2GSoVpTbyt7QW29oWnE6y5wCcNjseTIrCn9zL8dBcG/IpBN+JGoECjQjIV3QB3xoaLDrqs7MOrlVaOiWMYjRs+iziQ7vjqabjxM/GfdItl2c8ZtxVcpPbKGJ8dE8fcwKp7TZc/HcacKJkJsOPCTknW+E884FnhOxVNloUqoIjTxs1qSLaQ9S+HvNO2IjTDP4xlbr2OtPwf5sdalKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BX6DDh/wZrB34iiwGQ13gVJkVFsoaIv4ts9A0+ZlAnE=;
 b=m+goh4eruoz6n74Ng8tM2FB/QNfH7Gwz3fyF81cGUfBDHZas9jdGw/yZKFXMGG+I24xi5fLL15kLhtzJhEu6Kww7PUTXYDqSltVsF5JAknb+LgJQR4T0PGvJGeAARW7K4ZYqqt1n6mYxU2xAczWyZjMO0loNCG1ahtEqY1SV0M6qJz/rKdHs9nWAy/J6yM7j9mM0T07989jnx6vBvLYDQEAZOTdNPu4LfpKYQf+BxZ+KraHnMaJ7NYH8T1eiMtYx3NZBpUjvi3T3eVGaRKG7N2w2t+ij0VoF3oAySi8xBKZlf8KiuwdqxrNdhI2zPseb6yXP1aMtHSJgUAteD5cuCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 04:53:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:53:07 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:42 +0900
Subject: [PATCH v11 05/12] gpu: nova-core: move brom_params and boot_addr
 to FalconFirmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-5-8f0042c5d026@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0020.jpnprd01.prod.outlook.com (2603:1096:405::32)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 323396cb-c000-44cb-9288-08de7b3c41f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: /iELLkiyqhNCSpgpc7g6x51sYIY3sqZdWph7weatrNuGDlNaoTi/cH/zfONDHlDl0U6spYXmf/TkSY4sJPbp049w8FQV14QwhE98muF0KZnjQBQlGbkNuRCxX9hQ0PMoIMYHxcyprbZBfeME3ZW8fzVFs9ohBoxtlb79ulfiXohjDjWEQC0YEuYVxo4W63tbIKP4NVOG58nt/bXd64Yj/pC/V0AcbbX8UT+h16aHxLi0Ej9SNA76OyuUHaz0qbPx59Yv8SO4B5tfS9efBgHwwyKTby4UJ5nQpTTdh8Yk9dGVNjNAyIssq//tZzv3KMVlY5B7v6naeE2e2wH9mKiZG3p8FoYeItONOfeP0XFWmAEQhVb9vLGecF8jnK4uzfBcYNkb6PA3jQggV4dQ1I8GT9E+dhbZ3zym0FlKC0XBrrgQ0sOn8GbPE2lNqatvxS3CxB86DRXvZO3JJpRd4s0vFlKHAx5NI//vLGuZ0fWks8hqXOq+bXqH87+FLBzUqRsQMYzZcgrsh3YuhOE/Lo43Ef9s4F4hC3jrT4AYwGSacEcoqseD1M6zDH2o/1RejK8S9YOdiGz0dC+6/SGvczyOVuhKZbFY5J8JNSQp5+Q7kNE99NfoKiBEPkVjJiWimfN/VNCrhmNNOSkrmijcsGmwlC/89thqPy+uzAA/CAgoyls3AVG2ngQ7fdho8s2TBeGuJdX+PKJilwVgexI7nptyYwx62rhWh0A2UahGZa1447Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlNUV2hFUzdWZVROSzFVMXllV3JXT3EzYzdNeThGWWlLWWRRTkYrbDV2Skhu?=
 =?utf-8?B?MzJiUisxM1JGakR3Y1BzTnRMblEvUURSc2xyNEk2SC9BY2UyMjlhakdMbE03?=
 =?utf-8?B?WGExcU5rUFZoNWtqckR2UElna2JLaG9USHM2NEhoUnkveUxXbDJqZ3N4UkJZ?=
 =?utf-8?B?WHpzaWQrZmI0akozd3M0ZEFnNzl4b1pCOHZHMzRYMTA0Rk5vR3cvYlNTRWx4?=
 =?utf-8?B?MTNIbTI5QnZFbW5GNlhCdmV2Z1ROTlBXY0Y3c1V1TlNtdFNWSFBFTnVPRzZI?=
 =?utf-8?B?SlUvVGZNcjhxMDUyd1pNZmNpZHhWbk1NYkxQTTFMOThkdVBKa2gxZVJ6VTBu?=
 =?utf-8?B?VFZOY2hzcXF5TWtxdHhmZzl4WHFCODhOaWQ5dzE2MFZGRzRISzBUTzZUVkJB?=
 =?utf-8?B?bUZodVUzdGpOc2QxVGk0UHJTRTFMSFI5L2xZbVJJR244SjZyclVvQzNGTW9Q?=
 =?utf-8?B?U29sVklWV0dTUlBwbzRvM1Mvc1hsTHUvNjZLUTJCYS84MnpHb0tUUzlac05P?=
 =?utf-8?B?SGhsYStrMy9NRVJWRm9nK0tqSXE0L2hJa0NZekU3aE00M3VlNTZnVTUxcXk5?=
 =?utf-8?B?MmZOZFA0R3hEVUdlb0FkZCtRSnJseEltVWVtaGNwOE1uRTQ2WlF5YzVveUZB?=
 =?utf-8?B?OXZIOTdvdkRpVVk1cDVLM2ZiSVd3R2pRTTlQdlFEbm9aem9mTWRmR1Q4cDZy?=
 =?utf-8?B?YlVwaS9SVXBLcTVUSjV4YkkwNE81Qm93Q2toanNBbDdhbHJ6WnJWK2xGYU1M?=
 =?utf-8?B?T0NOWmNnc0dhNlhxaUE3UUdlNnFnQ05PWWRSQmQxdFU2RXRwc3JudWxHRUVW?=
 =?utf-8?B?eUJRZlJhdWI1TjdrbElpbVNSaEE2alMySmNNL2RZeHZIRFNRNTBjQVQxUllu?=
 =?utf-8?B?ZE9pOFllVXpnME9Xd3JOSFNCVDZtWW4xeFBrRmtadGJBSlVtazlpNjdUMFoz?=
 =?utf-8?B?OXZMV3FIb2NTY2ozdzhMQThtYjNsQVVPQmhMUGVBaE1weW9MaXluVjhnQ01a?=
 =?utf-8?B?aUgzQWVuM3QrMnY1cnBFSk5JaE5NNnZBL3BVb0dxbUVHSFQ1azdiRlJUckVD?=
 =?utf-8?B?QzNrb3M1Qk1JSzFVTGozZ2F6SFNnQ0pQRHdpWjN1a0EzRnJEZk5MZWdSVmlp?=
 =?utf-8?B?VDQ5ZjEwaUtuanloNlZkQmE0SjVVTWIyby9qY2FWNWNjcW9KMlRsTllSaHM0?=
 =?utf-8?B?NFdvN2Y1Q0NhZGZFbEF6VDJsbzRhK29zeCt4R3NrQ0cwVWEwZEpCQWhvbVM1?=
 =?utf-8?B?UzRZWDlmZGZqUG1Db0o4bWgxdHVUbjNVNkpBRlJ0ZzhoMnBtRWdkeE9tbThQ?=
 =?utf-8?B?cjBrUWE4bHp0R0ZvcEZLRlZZMXJmNnRycEdPT0ZNNEZXWHpxTkVlSDY3TGN3?=
 =?utf-8?B?QVN6b3VPZUlsVXFWQ1RFMnpteXVMWFNUaHFzbkxmL1Y3QmFIRGRLbkxmQXRk?=
 =?utf-8?B?UzhxSUcvUVROTk00V0dPeHVoam5XT0wvajZNc05PeGtkSW9aZnIybm9nN0w4?=
 =?utf-8?B?ME1ITHpPbkRTOExXQ1gzYTdzamN1TVZETTB6b3AxRjY2aXF3c2ljUWF6bW12?=
 =?utf-8?B?bllxMllVWlJnb1NIYThmOC9mdlVEV25MNFpjbmJFdkF3YjFZTWp5bW1ybXpr?=
 =?utf-8?B?dFB5Q3pVTjJ2MEdibEJFdnM3ekxOaEp4UmF2Z1ZRM0xaTWNKTzAxelBzZnpM?=
 =?utf-8?B?RGtRNjg5WWw5clN2MGtSZHA3U3duNE9USXkwd3FvSk85Zk5QMUFCUHNzR2JK?=
 =?utf-8?B?cFlqek5yUk5VYVpJMEhsS0dXakpTSGRHQXFSRGF6czFKUEtsYlA1emY0a2Na?=
 =?utf-8?B?RzRhWnJuc2szRlF5eURsbXQ4bG9QdFpEZzR6QTQ4cGpIeE53WEFGVVIwdHpp?=
 =?utf-8?B?dUJveGVXNlBZdm53ZFYyWUYrdTR5VnczblNMeisxZThhV2c3c3NCWWM3aHFU?=
 =?utf-8?B?UVhmd09EYnhnV0R6NnJjbENxbVBJeU81L3hKYzZTdGZqcE45TzM3TisydEdQ?=
 =?utf-8?B?eWZ5OGkxVDh4NUYyZUVmOTJ5bWliZmpmZG5NYTJ3NFo0VGxodVBJKzB5M00r?=
 =?utf-8?B?Yys1UUxkeEQrbGlNWEZvV1A2RURUTWpnb3dXM1RDZ0ZVRS9zRU9CMlNIeTNR?=
 =?utf-8?B?UWJoUGwrMHNsQldaR3Q0enIvS3p0bFpZN1MzMXRDZzZHclhpSG4wQnNqdTdo?=
 =?utf-8?B?YXRjcDhFSVBaWDM0RDBDRHVaaU1ncTgxLzJ3OVVDT1VLRnp2SGNFT2d3a2Va?=
 =?utf-8?B?d3VUNC9tTndEcm1RcWtPVW1iZHYyL3BwM1lWWFE0UHptdGh4WlVRNGh3SXNr?=
 =?utf-8?B?QlRHL0w1d3NlZlBFaWdVLzBwMERjRUJuWU5tei9qNC9LQ0VueGI3dXRWQ0ZN?=
 =?utf-8?Q?NwgxAM/hQoYL6n0x7l46ZCPIrsqKd8cKWLNd7X/eiePRC?=
X-MS-Exchange-AntiSpam-MessageData-1: 6k+kTBxGBOzCug==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 323396cb-c000-44cb-9288-08de7b3c41f3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:53:06.9172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ihNTmRmjCebNOliHb3w3jEopd8g9VPw7nh/KNnwp1lzX1PA4W1PCh0lo1pEttvwIrnftkvwyyXQOT+dVjNpKgg==
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
X-Rspamd-Queue-Id: C40D821B8AF
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

These methods are relevant no matter the loading method used, thus move
them to the common `FalconFirmware` trait.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 12 ++++++------
 drivers/gpu/nova-core/firmware/booter.rs |  8 ++++----
 drivers/gpu/nova-core/firmware/fwsec.rs  |  8 ++++----
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 450431804e1c..c90664efb0c5 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -367,12 +367,6 @@ pub(crate) trait FalconDmaLoadable {
 
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconDmaLoadTarget;
-
-    /// Returns the parameters to write into the BROM registers.
-    fn brom_params(&self) -> FalconBromParams;
-
-    /// Returns the start address of the firmware.
-    fn boot_addr(&self) -> u32;
 }
 
 /// Trait for a falcon firmware.
@@ -381,6 +375,12 @@ pub(crate) trait FalconDmaLoadable {
 pub(crate) trait FalconFirmware {
     /// Engine on which this firmware is to be loaded.
     type Target: FalconEngine;
+
+    /// Returns the parameters to write into the BROM registers.
+    fn brom_params(&self) -> FalconBromParams;
+
+    /// Returns the start address of the firmware.
+    fn boot_addr(&self) -> u32;
 }
 
 /// Contains the base parameters common to all Falcon instances.
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index c5963f79a08e..2dccbdd1b558 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -414,6 +414,10 @@ fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
     fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         self.dmem_load_target.clone()
     }
+}
+
+impl FalconFirmware for BooterFirmware {
+    type Target = Sec2;
 
     fn brom_params(&self) -> FalconBromParams {
         self.brom_params.clone()
@@ -427,7 +431,3 @@ fn boot_addr(&self) -> u32 {
         }
     }
 }
-
-impl FalconFirmware for BooterFirmware {
-    type Target = Sec2;
-}
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index d5bb7d279fa7..87495d1d6cac 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -196,6 +196,10 @@ fn imem_ns_load_params(&self) -> Option<FalconDmaLoadTarget> {
     fn dmem_load_params(&self) -> FalconDmaLoadTarget {
         self.desc.dmem_load_params()
     }
+}
+
+impl FalconFirmware for FwsecFirmware {
+    type Target = Gsp;
 
     fn brom_params(&self) -> FalconBromParams {
         FalconBromParams {
@@ -210,10 +214,6 @@ fn boot_addr(&self) -> u32 {
     }
 }
 
-impl FalconFirmware for FwsecFirmware {
-    type Target = Gsp;
-}
-
 impl FirmwareObject<FwsecFirmware, Unsigned> {
     fn new_fwsec(bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
         let desc = bios.fwsec_image().header()?;

-- 
2.53.0

