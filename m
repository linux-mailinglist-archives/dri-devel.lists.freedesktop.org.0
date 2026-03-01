Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMwTHmVHpGk0cQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E07F31D0160
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC42910E3D6;
	Sun,  1 Mar 2026 14:04:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fzmUZmxa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010034.outbound.protection.outlook.com
 [40.93.198.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79DD010E3D2;
 Sun,  1 Mar 2026 14:04:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FLYIHat0Ya4Z/4NVT9ntSbwSzqgbGhsyT2LPtgFmnIDLN/3X7RsKnL4GURZwK45vy0hGl/CnnRFSbYxbUj9PuR+B5hAm0gUOApvvOMOOAHo5bruwnrzTnnhntSPcUQbtY9rPmIq6+WYGz7GsKYf2cfBVx12Cp/gNQpqpw1LsBw6mAOy9WGHMQTGMvQYwu7Tetgf+p3oscjgcXX79OAkRErMsxVb7D7OHPyMgfFDcaT2Wp4Iijl8E98vwskRGj2A9QBovmjjzbtMoeB70ZbPTz79Jo7YO7YkLZI35it8GSc5I4KbVgo1gAZzG/PDdwubW0hwZ+EYJLqvroTf/kt8ehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X8fTxnCJW32zkvMORNZsJWwmK7aIi+K0a2CEi3QfKGQ=;
 b=g6aDRU/VgsFCmq/revesMCwDaAR8+ug40sMmAc9m9wgfoZkiJCb+sdf3fizDTk6j+F9t0TGQ3KdJX7KPvX0LTM0Ik5giEJD7Y+wALNpYFG2UwqEvaiq/TZMWjHpZ2lAj0AvYi7WF+M2hdRxfTUFPAqZJF2/V69O6KqVNAKbeqeZaoyMmyUVaxf6YsWSFkLUIVo6vlO8lbw6giVfl56tktyZT2LGjuaOj89UrSYS5QO9e375S30q0OCLihC3uqZ9qr/PIRsZNwZ5GhjHVfUldTn4kVOuakjKaBIBGjN2RgsDtG+CBotEkyWvteNwqxsa9KJFISaR3cmpeSMrrsJ6dyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X8fTxnCJW32zkvMORNZsJWwmK7aIi+K0a2CEi3QfKGQ=;
 b=fzmUZmxaVjZ2/8NCv3NGswPqVYmvSCcdmWVN928bruklp+thTE4rNXCAnrIpKLFJXWZjzZPonAmaj+pazysPTg+F3tg0IQeotYtD8N+kRL6GoxNYlSQwQrkxeZrRiPBd3EIuOFptlWc4ipiXekqKwnbZ1b6hyByOJIg2fRkC37mZWEviAnh7yuvWHE5lOpJJSX5/vdI5HnRLgI1pWmToHZeO+R3R7jK5yosejgNlWyGGhgEqcLvL1Rj1U0ujwyPlwA7K9VNELHz3oby7le1RPbgTBUHdmRS6HnXCrUHRYbZ70hEjDUPpX2QHQpVQJ7YqQ1JFHoBt1qMD2wTv7A3WUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 14:04:14 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 14:04:14 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Mar 2026 23:03:47 +0900
Subject: [PATCH v10 04/10] gpu: nova-core: falcon: remove FalconFirmware's
 dependency on FalconDmaLoadable
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-turing_prep-v10-4-dde5ee437c60@nvidia.com>
References: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
In-Reply-To: <20260301-turing_prep-v10-0-dde5ee437c60@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0116.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 85ab404d-5b03-404b-5dc7-08de779b6bae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: LqttnEfljTENto2so/xIcpMpmgxijwg7+oQXm5Jr42pxCZ1pLAr53K1WuAdCoJP5LbgV7CvkSs0gh7/8q4wXJ7gwLTdjS+UJk29KzG9me8kIAIjdtuHyn3IoCWBWHMoT41e5a+gztg+FhipCbiPowgUdjcY4EThafR/1nehUrPjfWSyP9Y4Hgu4KNZbCeurYSc7ISweto9iQdrwP8gJ7EHTksYoJUQMmfIH0gNizRrX03l2OPZa+ELn6s+vP5NXg+d7Rf724qfeorMXjyHiHDv0ZtpQr1z3l5sEw0rgP4JULeSTXpIOFEi18l/jsojxsEf05AfpBoM45BgVjbRPhddxif5KhYan9GW6w0WWHybIQqP+/x0jp89AUXE5tyzrxB8D5FODPc5b7HUr5BsSLdVeY1hzJ2uV0pbOn8NEo4OCvtq+yiRhVKRfUN4tDb/VcRqc4Hn6tc1Z8d+msuyc7/Xf5y+5DDhAuEAyfSN/cizhstjMyt8SQLuScZi5AoXw7DszCnhHSITFUiGGtGLP7TadBO0gVb2gSCimq1m2kwqYBtsKzO/SWm35j2p8i1kwvVa0PHsuB2AvZtkqeiw7EFEO9jwBp7K9KfjqtN/aI2TaPfeeUlbq/s8xj2bnzkc4K5MJIAQcPYCYXmX4F+plR+xO7lRknCDMvNEmCSg8+da87iblFIce5CriJ22CxTujYxXi2jTYmbJRlUWNt2Fu4avQxUq6OhMV1xtd4CiL6tWc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y3JwMzZoOEhJMXo0a0hUblFYbVdsRHltWGN6bnU1ODdDbHBjbTNFSDIxOXRw?=
 =?utf-8?B?Y3Z3MUNHblNqZUZIUVdCU3crNUdCREdlK2hsMkNKa0pNYWxyZ1p0bjNrYXpo?=
 =?utf-8?B?L1dUZWdJdFNGRm44WlBRSnBQYWFVbzVPYWpFZGZObHA2MThsbGl2ZDVqN09m?=
 =?utf-8?B?KzJNTTlPOW9yQ2c0UTg1MGY0anQ0bjhRckpadDdYTlp3aWR4WWlDK2pqMEp1?=
 =?utf-8?B?OW5USWdQRGl4bWVubXVtS0I4c3orR1JLS2dBekNlVDVBWGJFeklmUUhCUWY3?=
 =?utf-8?B?S1I0Y2NOQU9Vd2x6MmlNdExMUGYxU0Y4aWM3TEVTdElZWjdYWitkaWNsT3Ju?=
 =?utf-8?B?Wnd2R29BQkJUK0l3M1plV01ZUGVCcmxJNjgxSEwyS2hGRlZld2tkVGVGdHVB?=
 =?utf-8?B?NWNYam5BRzJmeE5aVitrSUFMSG10QVMwbWI0RTRtODBwcmxyUVNLYzhKdjVr?=
 =?utf-8?B?Y0NWRzVBM20xT01lQlkvTTBwTnl6dGk5QmlGVHNFY2tNcmNraEtST1lyL2tV?=
 =?utf-8?B?RWtuMUt3aXhjY2c4YUMrVmgwR2xoaCs2aFJzUmtCQU96WUVXS1FtNXJDMmhY?=
 =?utf-8?B?VlQ3MWhuNHI5RTdDVlN5emhwTnpiL3lpbklkOW9mODNNTy96K3dOSERtMWlu?=
 =?utf-8?B?ek5XNndXZWVRc3MwbFFZQWxsc0djM295UTRYWnBhZFhnZHJZakFiWFVYTWpp?=
 =?utf-8?B?N25ib2IwckgzL3pleFpZbEpiUXA0Z2Y5T2FGVVYyU09HOWgwOVZpNHJGVXc3?=
 =?utf-8?B?NzJtYmJORWNkTDBjU2xxVHAwR0crcXU0Q0Nqa1JuOUFxcUJCWXh1bm1HS0tL?=
 =?utf-8?B?R3ZOb3ExRm1sM0wvU1FIVFZkejVmT2JtUkdwRW9mZGFETHRQSUc5c3JoRVZy?=
 =?utf-8?B?R0dDd2hzQXRKdk1XbzRNb05ZN3I3Y3J1WWx4MmlnZVdrcWxYUERUY21LS2d2?=
 =?utf-8?B?VllNcytXM1RBcDVUUC92UzZZc0ova1N3dmJpYkwxQllJb2FKczZBRVdGUklQ?=
 =?utf-8?B?ZFJKYy85TlJzZ2NqeTV5K2FsODlYYnlKZUpwcWlvcXRiOGxocThJRWlHYW1L?=
 =?utf-8?B?dUozTSs2dlFjY0w5dy9tVW01RjRsaHhKK0NEQUJHSnlmeWpKWTk5S2F0eEg5?=
 =?utf-8?B?dW0rL3llWjZXV1ZrcmVTWmRVYWtaUmU1eFVENU9pUTVIeGV6Q0xLMHFjUjh4?=
 =?utf-8?B?Q1lCQkE5TlZzRzNMUlNZZlgzL0RSVUZEdXJOQ0VXSHRpWERGeTlicUpBVmxa?=
 =?utf-8?B?OVJ0WlhEOEo1MVUyQndvRGZSbXh6cFNGMVoyL0Fyam5SSlR2V3ducldXZHdP?=
 =?utf-8?B?clFmeDExcnplZ0ltQmtBY25HT3NVRC9ielZ5SXhnYkJOdks0d1pBVGpzVnZE?=
 =?utf-8?B?U241V3I0dUlrRDFxWmxBcm93NjZicVhkU1kwZk9wNWNkaDNEMGdML3FaV2VB?=
 =?utf-8?B?KzB4MTN0dHkrbXlSaDVRSDFHLy9BUE9hM01MYmVNeHdZNWppQ3YyWVlTUGJE?=
 =?utf-8?B?YS9hR1N6Y1ZiWHNzQk1hWmZXcXhFVVNwMmhuOFlxMVRwQ1ZlR0s5NmRyWHVv?=
 =?utf-8?B?N1NzLzlCeThtUkxUOUFGUHJibjdHaUVqenFmUFduc1dVYkVlMVdvY1ZDN2Jv?=
 =?utf-8?B?MmdvQ3Q4QWRVQk13MTY4ZjcrejZiTHJXUVArYWxlanVZSzM0S3hkMHFVYlJk?=
 =?utf-8?B?OXp4dHVLeWhwbEhUeU9xQlg0ZUFZSjBMR3lFT2t2ZnYycFJ2VXl1SmxTbHEy?=
 =?utf-8?B?UHRQZ3hYOGZCSG01aXNZS0pNQnE3endmVzRJcmhwNHNrcEs4cHROMUtDT3ZB?=
 =?utf-8?B?c0lDakwwczRmeGY0VnNxYzREVldKT1RaSDlCeFBkOFlncm1FV1FJSmxOdnpB?=
 =?utf-8?B?c2hySW9vSytRbXBhd0IxT2JGZWJrNzkxZnlvNk9IdUdOOERWNnJrTFlkMjhz?=
 =?utf-8?B?Z3B6OUs4Sm4zb1dIR1FsdmZjcG1UV0tJY1VqRkxGMnZlTjY3YS9LdU5mOWlW?=
 =?utf-8?B?Vk1ENTB4eFZVZmFNaGNaUktWLzV5SEp6ZElyV0k4QTdJOHlIM016WjFXY1Nv?=
 =?utf-8?B?YUFaNXliMU1YbTd0MWE0YU03cTM4OGlRb2hOa3dFOTFIYXVwZ1o3Y2RLNXZD?=
 =?utf-8?B?UDBRR0VoRURDK1ZPMFY5OXJIcUdGQlIvK092Q2cwL1JKYnVBMVFkSlJkWkw0?=
 =?utf-8?B?UDJkSlpPblh2YWtxSVFURmR2K09XakhtaC9KS3BxQmdTNzBOZkRsTzMrdC81?=
 =?utf-8?B?THdDd01oM291K0RUY1E4YUtnYXBSNnROM3BqQUIwZ1c3NEEzNTE0ODYxL0pW?=
 =?utf-8?B?ajJEaVhnQ01kdTFZenY4NFd5OXRaZ1Vab1VSbmtwU1J0Vkp2N1VRQVlnVm5W?=
 =?utf-8?Q?wdtEO4OHtwdGgVh4rF0UehYXERSCfAJUHTomB1hf8JGX1?=
X-MS-Exchange-AntiSpam-MessageData-1: cKieQKDyixw+7w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ab404d-5b03-404b-5dc7-08de779b6bae
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 14:04:14.5767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OXNVo1A1Y3JEOpeehrijoRO/ps8guhW+p0XsChVo9nu3fL2V3an19cUVELxd9THKT/41jMI7tjJavO33vUMmqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6632
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: E07F31D0160
X-Rspamd-Action: no action

Not all firmware is necessarily loaded by DMA. Remove the requirement
for `FalconFirmware` to implement `FalconDmaLoadable`, and adapt
`Falcon`'s methods constraints accordingly.

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

