Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uGUTJLhdqmkVQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A2921B8A0
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86AB110E36B;
	Fri,  6 Mar 2026 04:53:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k9ZCUX+5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011009.outbound.protection.outlook.com [52.101.52.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7633810E379;
 Fri,  6 Mar 2026 04:53:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiXfvD/mOb5gYATMYHmHXxJmR36UiI3PEet6Ha3Btal2eq6AS6Y8yvdgj12EJTrw4fjRpiujQOb92jtJfEdfInQ+572WO7A3qAxa01M1ZcNiTMAECsjdziL3Ln84eg7OegK2Lhl6Kpdfpkx5d9tUJzQXSHra1bxd7sgOouykyoMoBrAWrRtKX2N49a1QkKebnV2+i6lruI/f8ZitVxjpuJQqnpY5tnZQISXIvsHih2HukapSKUUB78utJRg6ZWZZaaBovXwb0z2SqcX/z9iasGMo4rrjE5rK72e7kLZnj4ihHt+rn29EM5Trjh/yVt+WZ7kLzIM/eYyD2MaHMiX+0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x0FrlLKstD7V3MD7Dyhsh+R12xbYsBkvZ6tlBJhfGQE=;
 b=jg94rqvrLC7oNAYznT2SSOTsATjyMI0VgWo3pkxbB4/3bAeygyTVr8L50nhX70BvEyfzdwSpZzFxNWDXBYBl6EwNRAxFTNhdWMy+rcAfNbvw9od3Bi8ivrTJC0Pp+wzomhmxroN1vki4SInkhh5Rn7WcYC5Ku2ADyLT6zf8IhXGJVJnAgt45QA2aC2bBWKyKQ2mwNiT92tp9CvQu4VxUGccrYH9n/6iCxDSBooxYm35R7YjPlvNiWw0qA4FCJ6YMzM5fwOucbaJX4qPpElP1Z5cGyz7YHIPQEtxoEOVcMMMa+LvFVcpUa7W9vGRlTRJ0VyE/GJEPUfp+JDZz6SeWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x0FrlLKstD7V3MD7Dyhsh+R12xbYsBkvZ6tlBJhfGQE=;
 b=k9ZCUX+5VwW8atWXgzlO5N023riHaQyP7JcwqL27eA+yzk8EBmbHVelqGPMXA00SVXjvPiUgmDO6X0KuEPkDiQUz2Lq+2+qlUD9b3Qgwo7byqZ+tMXFF3dOo16mz5IopS1h2yO4z3k9TGh1LjqxOpp2EtxtXFQ+oMWhCpsC5kZ+5altVk3eCcZQMBFi+Izhhcb2TQn+eaxcEperaWkmF0vY9I00eamAxs1ypTYONUtTUhWsqNSlp/BmiffAwAqOR9tSb1WcTgzqgM1V3wwexyQOSmm4FRMOJFeSFlApfsmjlwoDV3rgKvdO9kv+HHgMvBTCK3JWWg2fYtZKvxZBVkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 04:53:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:53:03 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:41 +0900
Subject: [PATCH v11 04/12] gpu: nova-core: falcon: remove FalconFirmware's
 dependency on FalconDmaLoadable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-4-8f0042c5d026@nvidia.com>
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
X-ClientProxiedBy: TY1PR01CA0191.jpnprd01.prod.outlook.com (2603:1096:403::21)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c729fef-4da3-4a93-2833-08de7b3c3fad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: 8S92rpcbzRuQbt45X0XB2Z+606dzxZlFQ+TGnb2S19fSeQ8oFfei0p/S6eF7yQZq77Fm/5C5xzejEyaE5/uCeFTBgv6zZlyvrDwZFsfmMeWzGzJcl6wmREywHUXwZYRoZTPRLdBU9zWAbfwl0yRpQq2V4GMTLkzwE23fiZJwaUmeMiBhDpu5Tz09RdIune4TPJlUanH7mdp5ptCcIc+Xs9HmwbqFfSAA6Ol2m8iz4oRAveLthQT8L5F33IKnGn9HOUBMFFw+h9LlOhKskz10jVUvN7iJ/Hjk0QjoMBCuM/ZQhB+WNpO8EsMvVvsG0yqxmEvYl4GVaZBYnokcGU36tUrkYtsD8QEE5yC4L/R66AD9kqIAjJz5FRJCUmFeFPbHWVAbtrc5n1S6ODw9n+GiuoFEB1UB3oLcYROVGsasRMdgcPUq387TpzIH7ojWRU6/YE954TTul2Ovq/NTJhCBJicvfwTx7UVBOZxr0AuNWFY55yrtIAQK9+GTYwCA68dLxOaaKgG9/PZ23bNk7fCOz9qr7TGpi6z4o24yCGINeyTaaS6ImMaUF/4QbAtgFWqziVxdW0A/UJUIrJOimahisRO+BLLWOmL2cBWMMQResdwTy5Wkd+q5msvnwdr/75NlzRlqFeSsOatRek9PrKDYAq/cq13X+gDGJvgESQaFiWJoPB68yy8xambLLxdxgw4wyhxZQdb2KBtTnjr8fncCJmil8i00QoFcXUPp/8iEox4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RmdwRG1jTTZ6cjliREI3a1BBSmdnMFM0VmFGV0ZMcVJ5NGIwckNnb0ZuZGlV?=
 =?utf-8?B?Mk1WRVlJZDNGR1c0RmZvcTV6ZUtMdWtwNVFMbEF3K09ZQkc0dytPN0MvWloy?=
 =?utf-8?B?YmViT2NrVGs4RHdxNkM4d2w1eUhZY00rVVFIS2loUWZERDFDbDI1V3BueDh5?=
 =?utf-8?B?NWU3WEpLTFl0N2xwaUtrY1YzYTJkRE95cVJNVWg0MnYwOGw4UTUxN0ZTYXBi?=
 =?utf-8?B?N0RJN3pHZlBIbnhWbllsRDlYdjZWeG5PMi8yWlY1TjRJdUhzcXlmbWtvYnla?=
 =?utf-8?B?alJUOUtYWWw5OFUrTlZ0TkcvcjQ2VDBiclp0S2VtSTBrUElncFhMYU5nMEYx?=
 =?utf-8?B?aFlxY29TVHVrc3AzbG81QjFmMHppZE54bVNqZWhPalp3aS85SWtRS3RJZW13?=
 =?utf-8?B?SHVpYUxhaXJUM1I5UXM5Sms2Vnp4TnYzQU9DZlMxdDl1c2RwNENHQ3dFbktr?=
 =?utf-8?B?T0FMdjRQQ2FmVUZUazZDalVieHFjMW11SjcyZEhUREp3a1IweStLU0hJWFVj?=
 =?utf-8?B?V2NQaU9OanM0WTk0ZERjNmZtdXBGR2U2NXhRV0NyRzR4eHdScUVQWmJHNmM1?=
 =?utf-8?B?OWRhTXIreVRJZkZDZm5hOVQ1U3NpVXlKUVAvRTlmV1BodWM1T0ZuWkhXTzRV?=
 =?utf-8?B?Mkp1SVZNcUVYWE0vamhidkVJNVNSQk04bnM2V3V5a09BdlNaYXlPNkFZRTFU?=
 =?utf-8?B?WjEzYzdBcnV6WVFRZGloUjNZeDBSbFFNYmtZWE1nMEM4Q3NTeGNkaTN2YnRl?=
 =?utf-8?B?TG12WmJ3UFZraXpST05CdGpkUDJ3THZEUlBUZWFRT0VtNXJEM0o4aitZNlBM?=
 =?utf-8?B?ZFVJU2RKbmUzYmh5ZEpTdDVLa1lrTzIwUDlkQnZ6dUFHS2xZOW5Fb0gwZ1pY?=
 =?utf-8?B?VUVGQXVJeFdIVjVrdXQvMW5DSUNnRlZIVUJnZUdnaFlFeFZqREh2SmFIMzg5?=
 =?utf-8?B?ZTZCUi9Cd1BZdlFpclhnT0Y2MnNHcnFwMnFlNTJxZnk1YkphUzN2Tko3ZUh0?=
 =?utf-8?B?RElyWW91Ri9HR1hNcDlJa2dIZEFSV2ZnVzkxejFuTTZjOXF2bE5oSi9jWnNJ?=
 =?utf-8?B?YVl2UERWVjZ6cmJKRmtvMURKclppSFQ4MldncDZKclhiMkJPd2pualUvbHhJ?=
 =?utf-8?B?dmcwTGlHVjNSYU9BT3BHZFJmOWZlb1hFY1BvK0lhbnJSc09mdVRrd1AyNDhr?=
 =?utf-8?B?SzFiVkJrL1RJY0d1SlR1RUpGWVh3WUFaeHVlVW5WWE8xYlVTN1dJM3NOd2Iv?=
 =?utf-8?B?M2lZTDBlZ3VUZHY3dUN2dWtHTXljSlY1TzkwRGNRTnJHVm5iVUNJQzNzVC9t?=
 =?utf-8?B?djRSc1gwbEZ0cU9tR3dISFhOa0JDQXJEdlBrRGJmeVZqS2dtRldXZjJOcVVG?=
 =?utf-8?B?b0hWU1VTNEZXa25Ya2ZFYTVvT2wwNkUwQkNQTXFaMGtBRGdZc1hsNGYzRk5Y?=
 =?utf-8?B?ektqSGt5Vnh1VGFxTEFuNTF3OXh1OHNEdk5PT0ljbldlbjQ4S3BXU1RWWExI?=
 =?utf-8?B?ZDZOdlFqc0tVaGJCQjFmNmJlRnFDWFh4UFdXRWZ6K2FFQnliM0VWVW9EeS9q?=
 =?utf-8?B?YmlLMTBCYmxMRDkxU3pxQk1OZGlrUTlzQ09zbTZFZE1nSlUvL1ZlNmZlL1NK?=
 =?utf-8?B?bUwvMXVsRlU2bDc2UDBLeEVoMytsTUtCTXljaDRlUFhJK21YdWNmdEY5enc4?=
 =?utf-8?B?cGhHdXFaUEZCbTdQODhFNXBaY095Nm1NYU5FUFd4b0lxZFA2SDlkeG55TzFn?=
 =?utf-8?B?dEZmY3o5Q1hNV0lmbXo4OXBWSzhZNlRPcHVnRnZhczdBV3h3akZnVmV0ckdG?=
 =?utf-8?B?MmJrMjJGTGh1WDBxRWVpanQ1L0N0UVBCekgvSE1IR2VPQmVDbC9wYSszMlhX?=
 =?utf-8?B?Y1NWR2dCZWg4ZHEyUFBEN2NjbDVPM0hiSi9lVWxJZ25ZK25WcEVoaStiY2tL?=
 =?utf-8?B?ZmlSY1JTUTBOekJQOHRtQWZkL2F6U0VaT0xYMnkzVTEwbU5KZGdkcHQ0V0g1?=
 =?utf-8?B?Q2tMeVJFaU1Hc0xYVHJ5V2JBajZnSStXb2lsUkkyYXkyRERvYUM5Uk9icDUw?=
 =?utf-8?B?dkdldm9ZQ1pvRVY0N1ZWVTA5cUtlNzhhbk9URWZSSUZydGNwNVltRlRKYTZW?=
 =?utf-8?B?WW9na0paMGhiMWdMeW1lU1NQM1pkTEpYNytjRHd4MFJZeG1MY0gxMFIrMU5L?=
 =?utf-8?B?b3VVRUNGS3cvMHJzcW8xemVqckhjK2JmVmtTSlI1T0RtdkRVQkRlYXVhd1dH?=
 =?utf-8?B?bnRTM2M2Yk1wY3M5QjBiK3ZUd2pIZVZ0NWtmejBwYUgzMmpTU2QrMzBvaXNQ?=
 =?utf-8?B?cFBDYytEYTJMNGl6WHhyV0tKMmkzMG9JL0d1QWpKQXE4RTlwUXBMeS9DQms5?=
 =?utf-8?Q?ZG1zRxDCg76u1aqAGfYZyKsyUVxP7+rxdaMuUh+ptKm7c?=
X-MS-Exchange-AntiSpam-MessageData-1: i7jEpyvsmgY6Iw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c729fef-4da3-4a93-2833-08de7b3c3fad
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:53:03.1351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mi/QhskMDfhMr4bL/5DYYs5ILHuN2XzgVJ6Y4muI1PAC4E8fRICTgohEuW7jrgPqgXrYDK7apCwN+SSQwX+6ow==
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
X-Rspamd-Queue-Id: 41A2921B8A0
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

Not all firmware is necessarily loaded by DMA. Remove the requirement
for `FalconFirmware` to implement `FalconDmaLoadable`, and adapt
`Falcon`'s methods constraints accordingly.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 9eb827477e5e..450431804e1c 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -378,7 +378,7 @@ pub(crate) trait FalconDmaLoadable {
 /// Trait for a falcon firmware.
 ///
 /// A falcon firmware can be loaded on a given engine.
-pub(crate) trait FalconFirmware: FalconDmaLoadable {
+pub(crate) trait FalconFirmware {
     /// Engine on which this firmware is to be loaded.
     type Target: FalconEngine;
 }
@@ -521,7 +521,7 @@ fn dma_wr(
     }
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
-    fn dma_load<F: FalconFirmware<Target = E>>(
+    fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         &self,
         dev: &Device<device::Bound>,
         bar: &Bar0,
@@ -660,7 +660,7 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
     }
 
     // Load a firmware image into Falcon memory
-    pub(crate) fn load<F: FalconFirmware<Target = E>>(
+    pub(crate) fn load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         &self,
         dev: &Device<device::Bound>,
         bar: &Bar0,

-- 
2.53.0

