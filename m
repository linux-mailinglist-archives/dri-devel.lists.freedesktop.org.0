Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJu0Nr9dqmkhQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 532E721B8C7
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E00410E346;
	Fri,  6 Mar 2026 04:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MJIyg9o9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010022.outbound.protection.outlook.com [52.101.85.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036AD10E346;
 Fri,  6 Mar 2026 04:53:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6UOdtflf8ozT4e49+RdH1qGGwcLwwqQpT31IE+b5XZbiPFCil5VBncww+VlhoYktmymZghRoU3Lk5TTe6C2NTdoGCTyEeAVmGA8YSmcvf/bVyq4OlsA4Vm6c73o9tsbBkqJLNGlfThBveiCvN+dDg2m0EUxOrcSbiY8/bRFrJCDwOkFPrhN/kVpaKl9PYWdWhFEK2NZoS9lslFb6mJLqw4hh6qcpYO1QxBilWEgu+z+4fYzbiwGsbmmI79C2EKZg8TuhK1SDlkjnrO8Gqd58AHEqXm6lvMw78ABQnq481eWDnO/P9l49+la2gfTBFc+XYnUI7BfQK64+B93xKKOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+yevuLUzZueZT69xleERw9YggNLeISxFyntNxY3KYs=;
 b=K81vx8YkNwYwXqxvQUmoG5V9ScsBdu44hc2gFT/ZxpTCSNXU71HYor35mIilJRne5Rd6UQxh+c7Okfl4fI6UYUmKwP2E7ghQAL3GTrtDydHBuB//SMi3lA8E5gquBebLTrbNfW0gZDBrPF4R1sM4RZ2XNxbIOcZuNF2iNBI4hy/Bgn/3+sIN7jVdXMHFYO76Ws078HYgPsoSxl8cr1YZV1WEH+sdk5rnfD+HS5zNzFwCZ3BxgWFb7bzaw8BazLfBGM8B1t+v6LWzee3PpdthL6pdM/bsUdzDeGx42oRd6h8u9xobIDM97im4tMjAiEsUN3oUiRnEblJV0ST7t2p2GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+yevuLUzZueZT69xleERw9YggNLeISxFyntNxY3KYs=;
 b=MJIyg9o9fAYMOU9cBtl5vTn62bgyhSZox41rBUvC5fyuVFsXQZcM7j+yZQV04ci2cvpQG3S61gW3HwLTK8E26IC6Np/HNfaVO1f/im2ARc9XSKFQGuovPfFD2QWHCiucFumDW1/BFSD2ebDU99yW2ZqNWtAjN07xVN1AAmvutVYEo2NbzP7U7Vvc2MzNxx3kWH+54EloWZSOGjkm7gH2Dzx6tEk/tMV+8cPJnBU5kooZLBsafvGlWFzmyYJOavMCuuvog/0hvyNuIcy0RGn/Cvnym3oT3x7mHlJB8eSbZVJDDKrA0njNKqGXZzuN7UbgEUCBfISxKKcPkRJILsKt9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6569.namprd12.prod.outlook.com (2603:10b6:208:38c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 04:53:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:53:10 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:43 +0900
Subject: [PATCH v11 06/12] gpu: nova-core: add PIO support for loading
 firmware images
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-6-8f0042c5d026@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d2437a9-f091-4ad5-7a6b-08de7b3c4431
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: EbdIns4aZEXXOStSotN+DcNcFaZwx38doGtZkW2pGZyndfUBSCOA9hOoObngxTKaQc6YKCdpfRdLDGGNVdo1n9lmbMwR110mrQGJCPUiYu0tjmUTw+1xCjwratP/yTmc/CZ9R6TG6Fs39jJxUyMhOUx+slcVbaNY8Yu9CmWQ3cO/37GCXd/hxPJ1otdAOBa0hIRMggrbcAWfBYW4cL1+I1fDWgN3Kjq2YWvshdswR3R0404FGh/qGjWASRJt4Jy7h7sC6cbOOK0nU+hnwlwJHPpRyjd/Nu65LcUJrY6RWKXpDhBoDM6sm7PLb7YQ2fBn3lrsVgfOEgeM/EoV8V8lgbzr2qpYoF3NR/IAAd1QnvfmJgT5LDBRghao0C3uc8t8vezZA9w7OyfhQpn5JYNXs2HVCXO4+bHHrcCGbYKp/qnL+b77/tv1mlH2YBNhKA3f54fy4wX8taT/4r13UosDstwXyi5TB33mGwsnwzI3GR2KAjHkBaDYeGZ14nzE2JNgbsr5X7d4l0iaQRtfGOrkLp91iNuGmkucj/IkBrgbFB+GkToMLZ8mbHu2ukMYe3cgiPNoGAsgn4PXh4yM9fw2Y40uhLacM6NYO+BxaAriyCYU5SwH4/moINJXlTtydRNmUA4v6iZB+fDVAHMp5Tz3Qwu19dsRgf8O8xe11Qd+tWexzisThtaGSWOgL8AjAtjW3jr1EAXJNi2blBuSI4hhlXGGx9YOko6zQEcOeBGoaOc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzhtalRNanVQRGVST0tWYnVDSDgvYVFEZXdQSjlxNXcxOURRWTMxL1V5MWZ3?=
 =?utf-8?B?YUM5enpJRjlnODBVek53RlF5NkNJeW1Mb3VQTHMrSy9mZ3BWNlVFYjlPUWw1?=
 =?utf-8?B?OWFkSUlBZmlUL05lVm5YcnRCQkwvK1c1YTF2Z0pQVGNNUStCcVRYNnZOVk9r?=
 =?utf-8?B?UUd3WHg4OG9HcTFscmVITW5UMERqLzFQSnhuVEF1dlJObkVlRnA5OXdpUDNQ?=
 =?utf-8?B?L3Ird1l0M0l1dWkrNmx3ak1UQmQxd3UvVjJBUHNnQnNyVS9mdHVtWm8yVFIv?=
 =?utf-8?B?a0pLNGh6NEZoSEFkMjlGTDRGLzJhMmh1OXdIeE9iaHFvVkM4N2xxd3ZFeUtx?=
 =?utf-8?B?QmUyME4rd3NIT0NHdm15U05JOFIzaFBPTkxKaEUrWjI2TTVscEFJL2pldlRr?=
 =?utf-8?B?UlBUWGVuU29IYVNmZ0ZpNWNEMFVuUFNWQ1doNHdHbE9lOStEM1BxS3VxbHRL?=
 =?utf-8?B?a2JSNE1Nd2RZL0VLK0RTT01VRUdndll0dlY0YjN4N0xsckZ1NHJoWmQ4SlBu?=
 =?utf-8?B?MzRxMThlUDRydW4xYTR3cXlqSk9PNGY5SDRGaFNYZU1MYU9ZSmNsUUYrZ0pn?=
 =?utf-8?B?M21ETEpycnlQTFZENnRXRnZURzhOWThuQnp1Sk5iUmZxRFBBeERJN251Vkth?=
 =?utf-8?B?WFROSGpUdS9BeHpHT3ozeHBxT1V6bmgzZEhMa1lZcXd0QUJvRHFuSmpackp2?=
 =?utf-8?B?WFdUSkJKSU1XUEpaOHhKcS9EOE1rMDVOYzA4QTZMbnlWc3pBN1k4Y3lrMWFS?=
 =?utf-8?B?MWFTNWNhMG02UTBUdnhVNjAydzBqdmdDbEtkYnJXY0pqbjlOT09tTmt3OFZk?=
 =?utf-8?B?bURqQTI5NUlnZm1ZTiszZElYVktrTS94bTU3WTlmR0RsbkYycU1lNkZNRFQz?=
 =?utf-8?B?czBNd2w0Rkk1ejZnTjV1ejErMUtESjdUUWc4a2h0TmpnNG52aDZtT3V3SzZu?=
 =?utf-8?B?VEFhV2FzMzZ0WlJRRVhLNUltVXFqait0d0EycHE4L1B6ZTZlaUxmRjRPSGZz?=
 =?utf-8?B?cmh2OEN5b0tWeEpMenViRENxYjBiaEF2WG8vWWp6bUtzTVJ0T01rYWI1Yk1h?=
 =?utf-8?B?YTNOcjJua0RUaUF1amd2cTJaQXl2NGh3U2tZMzMzY3YyeXczSTFkTGdRbWcz?=
 =?utf-8?B?MUVVYVFQblB1TW02QjRvdUloUmNCYjhyN2dhWmRJTlp1aEFIQWk3cUE5K01V?=
 =?utf-8?B?N0t4MllMcStwTXFiOWpENzVGOUU5Y3JtVGQ1Z3BSNTRCZXNSZWcvSkY0SWxz?=
 =?utf-8?B?VTdVRWxWWGFWUDJ6NnZ2MlpRenQxT3MyNi9jYlp0Z2NlWXJOTmxSRCtZT0x1?=
 =?utf-8?B?V1BocXJYWlZ2L3QrenZla1lXRytvZHlvMUdNUnhLS3RKOTFoY1ZXOW5vZ1cv?=
 =?utf-8?B?aDk3TmVISE5tRXJZMWcyUW9SeFZMcm9jZ3dsVXVFZm5hcHc2S0dyMnE0Njg4?=
 =?utf-8?B?bEh6d3I4L1g3UHB6ZlpQTEJPdEZLRGo2SzljaGJmNjRlWkhMVk4vVkpZN2E5?=
 =?utf-8?B?K2FsTml2bTBZV20xOXdSanF4ZHNGbURnbWlSMWFhSEx1ZUY5RW1qSHVQSUY5?=
 =?utf-8?B?cllYeWwxNjE1eHdIWDV3ZW45M3BJOEhrWTdjYkJ1RndsTGFwUkU2R2tveXNn?=
 =?utf-8?B?ck1JVkhQc2cvcUFCNXlHUEYyVnI4RDV0bG92U1hsdVI5MmtWanJSbWwxZXRD?=
 =?utf-8?B?NDhCYnY1OUlYMU1wbzVtNGtWZVJDNGxBSkgyeWowaVNZRHhORHRueGd1L3VL?=
 =?utf-8?B?ZXRLMnQxeHU2S09PMVkvT2trc2gvWFlyWEFEcXN5dWRHcWxKVGVETkN6UWhU?=
 =?utf-8?B?OFdqNEJ2eEFRdDBVWFAzNFNEU0F0ZVo1anQvTkxycGhha1RSbk1UYzdTNEV2?=
 =?utf-8?B?TU1LYmhWSkExSk53RUloSlo5dHNLZEJNditWN2xoTExVdjYrWm54VXd5bTZE?=
 =?utf-8?B?cjRLcUc4MnhvbUIwRk5NYTFMeTFiTUUwZUFWaElHeURJUkdpN0c0S0NISXZG?=
 =?utf-8?B?NXhnL1g5UXB4NnRQU3liUWFEclBsM2k4ODhGOTdtK1RHWW00R0k2eGZmVmVx?=
 =?utf-8?B?OTNvbE9tVGpaeE84enVrRkJEMldJM2JDWmNPZlI3bEZDSk9keTdRSE9mVjk3?=
 =?utf-8?B?bXRNa09mSG91MVdtWEQ2N0dOaEVTMkR1bktsbDAzczNuMXBPdFFyNCtvb3hQ?=
 =?utf-8?B?a1JTUDdwcDNzaGJ6c0hrTlJpU3RsVktNNHpLdS8vSjZGamZuSDY3RUlWZWdz?=
 =?utf-8?B?YWdpNW9PaVhSQlJnWHJySWozSjFOdFZNVjdzeWl3aVJRSDJ0RXczK3BCR3RU?=
 =?utf-8?B?amtDWVZSL1JFMGhCT3NvVnNJR3BpaWViN1l2VzNLcHJHTUJJbkVvRWxXQzlF?=
 =?utf-8?Q?x7LZV/A4v+PPDORzaM+0bIU4rdxWN6qci6aIVUbJJU1yo?=
X-MS-Exchange-AntiSpam-MessageData-1: i8b1CpOIGLLdMA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d2437a9-f091-4ad5-7a6b-08de7b3c4431
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:53:10.9039 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NYzMm9fK85XSkNepkEt8l7JQteQXyqGnvEl/xsIRx3BeOWKM+gMhByBVGmwi5FcCYYETqqwuJlTEW9RgU5qntA==
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
X-Rspamd-Queue-Id: 532E721B8C7
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,load_offsets.secure:url]
X-Rspamd-Action: no action

From: Timur Tabi <ttabi@nvidia.com>

Turing and GA100 use programmed I/O (PIO) instead of DMA to upload
firmware images into Falcon memory.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs     | 218 +++++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/falcon/hal.rs |   6 +-
 drivers/gpu/nova-core/regs.rs       |  30 +++++
 3 files changed, 251 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index c90664efb0c5..2168ef2c5148 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -367,6 +367,127 @@ pub(crate) trait FalconDmaLoadable {
 
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconDmaLoadTarget;
+
+    /// Returns an adapter that provides the required parameter to load this firmware using PIO.
+    ///
+    /// This can only fail if some `u32` fields cannot be converted to `u16`, or if the indices in
+    /// the headers are invalid.
+    fn try_as_pio_loadable(&self) -> Result<FalconDmaFirmwarePioAdapter<'_, Self>> {
+        let new_pio_imem = |params: FalconDmaLoadTarget, secure| {
+            let start = usize::from_safe_cast(params.src_start);
+            let end = start + usize::from_safe_cast(params.len);
+            let data = self.as_slice().get(start..end).ok_or(EINVAL)?;
+
+            let dst_start = u16::try_from(params.dst_start).map_err(|_| EINVAL)?;
+
+            Ok::<_, Error>(FalconPioImemLoadTarget {
+                data,
+                dst_start,
+                secure,
+                start_tag: dst_start >> 8,
+            })
+        };
+
+        let imem_sec = new_pio_imem(self.imem_sec_load_params(), true)?;
+
+        let imem_ns = if let Some(params) = self.imem_ns_load_params() {
+            Some(new_pio_imem(params, false)?)
+        } else {
+            None
+        };
+
+        let dmem = {
+            let params = self.dmem_load_params();
+            let start = usize::from_safe_cast(params.src_start);
+            let end = start + usize::from_safe_cast(params.len);
+            let data = self.as_slice().get(start..end).ok_or(EINVAL)?;
+
+            let dst_start = u16::try_from(params.dst_start).map_err(|_| EINVAL)?;
+
+            FalconPioDmemLoadTarget { data, dst_start }
+        };
+
+        Ok(FalconDmaFirmwarePioAdapter {
+            fw: self,
+            imem_sec,
+            imem_ns,
+            dmem,
+        })
+    }
+}
+
+/// Represents a portion of the firmware to be loaded into IMEM using PIO.
+#[derive(Clone)]
+pub(crate) struct FalconPioImemLoadTarget<'a> {
+    pub(crate) data: &'a [u8],
+    pub(crate) dst_start: u16,
+    pub(crate) secure: bool,
+    pub(crate) start_tag: u16,
+}
+
+/// Represents a portion of the firmware to be loaded into DMEM using PIO.
+#[derive(Clone)]
+pub(crate) struct FalconPioDmemLoadTarget<'a> {
+    pub(crate) data: &'a [u8],
+    pub(crate) dst_start: u16,
+}
+
+/// Trait for providing PIO load parameters of falcon firmwares.
+pub(crate) trait FalconPioLoadable {
+    /// Returns the load parameters for Secure `IMEM`, if any.
+    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>>;
+
+    /// Returns the load parameters for Non-Secure `IMEM`, if any.
+    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>>;
+
+    /// Returns the load parameters for `DMEM`.
+    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_>;
+}
+
+/// Adapter type that makes any DMA-loadable firmware also loadable via PIO.
+///
+/// Created using [`FalconDmaLoadable::try_as_pio_loadable`].
+pub(crate) struct FalconDmaFirmwarePioAdapter<'a, T: FalconDmaLoadable + ?Sized> {
+    /// Reference to the DMA firmware.
+    fw: &'a T,
+    /// Validated secure IMEM parameters.
+    imem_sec: FalconPioImemLoadTarget<'a>,
+    /// Validated non-secure IMEM parameters.
+    imem_ns: Option<FalconPioImemLoadTarget<'a>>,
+    /// Validated DMEM parameters.
+    dmem: FalconPioDmemLoadTarget<'a>,
+}
+
+impl<'a, T> FalconPioLoadable for FalconDmaFirmwarePioAdapter<'a, T>
+where
+    T: FalconDmaLoadable + ?Sized,
+{
+    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        Some(self.imem_sec.clone())
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        self.imem_ns.clone()
+    }
+
+    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
+        self.dmem.clone()
+    }
+}
+
+impl<'a, T> FalconFirmware for FalconDmaFirmwarePioAdapter<'a, T>
+where
+    T: FalconDmaLoadable + FalconFirmware + ?Sized,
+{
+    type Target = <T as FalconFirmware>::Target;
+
+    fn brom_params(&self) -> FalconBromParams {
+        self.fw.brom_params()
+    }
+
+    fn boot_addr(&self) -> u32 {
+        self.fw.boot_addr()
+    }
 }
 
 /// Trait for a falcon firmware.
@@ -417,6 +538,98 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         Ok(())
     }
 
+    /// Falcons supports up to four ports, but we only ever use one, so just hard-code it.
+    const PIO_PORT: usize = 0;
+
+    /// Write a slice to Falcon IMEM memory using programmed I/O (PIO).
+    ///
+    /// Returns `EINVAL` if `img.len()` is not a multiple of 4.
+    fn pio_wr_imem_slice(&self, bar: &Bar0, load_offsets: FalconPioImemLoadTarget<'_>) -> Result {
+        // Rejecting misaligned images here allows us to avoid checking
+        // inside the loops.
+        if load_offsets.data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        regs::NV_PFALCON_FALCON_IMEMC::default()
+            .set_secure(load_offsets.secure)
+            .set_aincw(true)
+            .set_offs(load_offsets.dst_start)
+            .write(bar, &E::ID, Self::PIO_PORT);
+
+        for (n, block) in load_offsets.data.chunks(MEM_BLOCK_ALIGNMENT).enumerate() {
+            let n = u16::try_from(n)?;
+            let tag: u16 = load_offsets.start_tag.checked_add(n).ok_or(ERANGE)?;
+            regs::NV_PFALCON_FALCON_IMEMT::default().set_tag(tag).write(
+                bar,
+                &E::ID,
+                Self::PIO_PORT,
+            );
+            for word in block.chunks_exact(4) {
+                let w = [word[0], word[1], word[2], word[3]];
+                regs::NV_PFALCON_FALCON_IMEMD::default()
+                    .set_data(u32::from_le_bytes(w))
+                    .write(bar, &E::ID, Self::PIO_PORT);
+            }
+        }
+
+        Ok(())
+    }
+
+    /// Write a slice to Falcon DMEM memory using programmed I/O (PIO).
+    ///
+    /// Returns `EINVAL` if `img.len()` is not a multiple of 4.
+    fn pio_wr_dmem_slice(&self, bar: &Bar0, load_offsets: FalconPioDmemLoadTarget<'_>) -> Result {
+        // Rejecting misaligned images here allows us to avoid checking
+        // inside the loops.
+        if load_offsets.data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        regs::NV_PFALCON_FALCON_DMEMC::default()
+            .set_aincw(true)
+            .set_offs(load_offsets.dst_start)
+            .write(bar, &E::ID, Self::PIO_PORT);
+
+        for word in load_offsets.data.chunks_exact(4) {
+            let w = [word[0], word[1], word[2], word[3]];
+            regs::NV_PFALCON_FALCON_DMEMD::default()
+                .set_data(u32::from_le_bytes(w))
+                .write(bar, &E::ID, Self::PIO_PORT);
+        }
+
+        Ok(())
+    }
+
+    /// Perform a PIO copy into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
+    pub(crate) fn pio_load<F: FalconFirmware<Target = E> + FalconPioLoadable>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+    ) -> Result {
+        regs::NV_PFALCON_FBIF_CTL::read(bar, &E::ID)
+            .set_allow_phys_no_ctx(true)
+            .write(bar, &E::ID);
+
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+
+        if let Some(imem_ns) = fw.imem_ns_load_params() {
+            self.pio_wr_imem_slice(bar, imem_ns)?;
+        }
+        if let Some(imem_sec) = fw.imem_sec_load_params() {
+            self.pio_wr_imem_slice(bar, imem_sec)?;
+        }
+        self.pio_wr_dmem_slice(bar, fw.dmem_load_params())?;
+
+        self.hal.program_brom(self, bar, &fw.brom_params())?;
+
+        regs::NV_PFALCON_FALCON_BOOTVEC::default()
+            .set_value(fw.boot_addr())
+            .write(bar, &E::ID);
+
+        Ok(())
+    }
+
     /// Perform a DMA write according to `load_offsets` from `dma_handle` into the falcon's
     /// `target_mem`.
     ///
@@ -659,7 +872,8 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         self.hal.is_riscv_active(bar)
     }
 
-    // Load a firmware image into Falcon memory
+    /// Load a firmware image into Falcon memory, using the preferred method for the current
+    /// chipset.
     pub(crate) fn load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         &self,
         dev: &Device<device::Bound>,
@@ -668,7 +882,7 @@ pub(crate) fn load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
     ) -> Result {
         match self.hal.load_method() {
             LoadMethod::Dma => self.dma_load(dev, bar, fw),
-            LoadMethod::Pio => Err(ENOTSUPP),
+            LoadMethod::Pio => self.pio_load(bar, &fw.try_as_pio_loadable()?),
         }
     }
 
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 89babd5f9325..a7e5ea8d0272 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -58,7 +58,11 @@ fn signature_reg_fuse_version(
     /// Reset the falcon engine.
     fn reset_eng(&self, bar: &Bar0) -> Result;
 
-    /// returns the method needed to load data into Falcon memory
+    /// Returns the method used to load data into the falcon's memory.
+    ///
+    /// The only chipsets supporting PIO are those < GA102, and PIO is the preferred method for
+    /// these. For anything above, the PIO registers appear to be masked to the CPU, so DMA is the
+    /// only usable method.
     fn load_method(&self) -> LoadMethod;
 }
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index ea0d32f5396c..53f412f0ca32 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -364,6 +364,36 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
     1:1     startcpu as bool;
 });
 
+// IMEM access control register. Up to 4 ports are available for IMEM access.
+register!(NV_PFALCON_FALCON_IMEMC @ PFalconBase[0x00000180[4; 16]] {
+    15:0      offs as u16, "IMEM block and word offset";
+    24:24     aincw as bool, "Auto-increment on write";
+    28:28     secure as bool, "Access secure IMEM";
+});
+
+// IMEM data register. Reading/writing this register accesses IMEM at the address
+// specified by the corresponding IMEMC register.
+register!(NV_PFALCON_FALCON_IMEMD @ PFalconBase[0x00000184[4; 16]] {
+    31:0      data as u32;
+});
+
+// IMEM tag register. Used to set the tag for the current IMEM block.
+register!(NV_PFALCON_FALCON_IMEMT @ PFalconBase[0x00000188[4; 16]] {
+    15:0      tag as u16;
+});
+
+// DMEM access control register. Up to 8 ports are available for DMEM access.
+register!(NV_PFALCON_FALCON_DMEMC @ PFalconBase[0x000001c0[8; 8]] {
+    15:0      offs as u16, "DMEM block and word offset";
+    24:24     aincw as bool, "Auto-increment on write";
+});
+
+// DMEM data register. Reading/writing this register accesses DMEM at the address
+// specified by the corresponding DMEMC register.
+register!(NV_PFALCON_FALCON_DMEMD @ PFalconBase[0x000001c4[8; 8]] {
+    31:0      data as u32;
+});
+
 // Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
 // instance.
 register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {

-- 
2.53.0

