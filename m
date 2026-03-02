Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CDUdN8R3pWkNBgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:43:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880F11D7B15
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:43:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A533410E4AA;
	Mon,  2 Mar 2026 11:42:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UygAsYyO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011056.outbound.protection.outlook.com
 [40.93.194.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A973310E4AA;
 Mon,  2 Mar 2026 11:42:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sya4D2NgWaW1GWbRKOcUmNu1V1qEq9ur58IP9DcGoyuup5dwn5R/eWN3VSJnxMBiPNF11nwus5GGTNnRBTEtfoUS+vtrumR8F/qRK1ZgxLWjyvv3xsmc+DlYoYHmT1dtv1UgEnsexaQ1cR/WFUasrvh+NCibkJUxYRmtPDyXpQTPrMV0QJ6cHaE5lunK8ViX3TRHg1yknzbI+hcLDO1M4LkTZ1pS1XQhjYhsN6F84781p9DZ0vnB0Cf6DT6fjEL0aUCJFPTI4GYu/5gZL9pVhMU48wO172aC3sL6oFuvAJ74CbvyN0+5MzJnrsoxLb5ries1W77jTsZMrcopRc/pdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8bMwKQ1fyedEdN3Y4Cscf7H+9aMLZD0o0gNDqeJI11E=;
 b=kISo35nMCxWoIDAMYPpPJ1tzIX8Hqq+hMvdoAFXAevahaWr1OprKA6cDV7XOkxKBTFdpcYdkX22TPdIfvsywv8HPif0nWezqHZ4osABZ/f5gFopPhy0w5R3/QSOoUMZIwWKDEOILSDZXqqUuMU8cYPeSVD7ck7gQMmbhVbLmRipLkqHh2ockfsfi4xL09M3KXag5guoc4/2YAmqFIeoStkqYlgfbJUk2KXUoSBV9B+hEawbiFnQL5vymWo8l0B4no4yfZ/f2J/FPescDyMCoCBjvHt6yGKsxB/VXjUeOa+vkI7LEKT9eJRqTE9JBIXnrSjQTVOAAxKYKQDAkIzkYCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8bMwKQ1fyedEdN3Y4Cscf7H+9aMLZD0o0gNDqeJI11E=;
 b=UygAsYyOcHm/kd+L2SHrjCbrYaT8oQo5ExxyoFMp46DqzZWlFoFHWmAOgngZ7M+//1Tftktc1avjfxD4GE5gzu15as9dWKpLy5BdigA5FGB2ns5PxJSF/v4GEwkPRg0ld5lOQQfHhbsb3vy0/3Q/qyHMutcJql3jpF2sIyZ1VbxIzEUL9ibyWize/kaTk3l79muYaut9XmCaOA10tEcySyq8mId7bHbQp/UFXC0RXdzxr4E+thUpFxWibV8/rEOHtdco0bmUsBCFzKa/LuylmVNbPHe4Tq+2uaqy24tEOPkswfhT1wDOnASjZmRTvOX+8mSk9+qMH1Ch2aHS2JaNbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 11:42:54 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 11:42:54 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 02 Mar 2026 20:42:27 +0900
Subject: [PATCH v4 3/9] rust: add EMSGSIZE error code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-cmdq-continuation-v4-3-c011f15aad58@nvidia.com>
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
In-Reply-To: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0320.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 3800d282-5aa6-4cb5-888d-08de7850d757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: G8oVCO9EMIKa0l1fLkdfPosLQy/TLuua+7rUdC7Ug7VhmcZEtVc2Q/fVWNOxbc8cb/D75mL3N/TLKCCgNuTh14uVYCzKPTmXmAz5yYdC9U3f0sLnEfPCIIOyck6XmLfIEleGeHwVBHOwDvExDcE9gMoffH0reSP0MljQ4QeccdhwUWnFJnNpyrPT7PCbwOK6/ITP4HeAxkJyv8QWunipP6rtiYiK15lobQSQGjlsc/guKd2aMBFH1XDQyrrQPv8xHxDwQJHSmoYk+jWAsO2FdtJQavCJUS03+nOuZGT/4TKUoZaj6OtQCc6/ykg9Od11mzDB/jr4BB54XLj1LOWrGFR4INXsBQ3Jdb2/1dUpUn+W+xlrlcBtLSK/P3oWgT6QRtOrXELZTPW9Zf8Rccz/HlUXVQA9Cye3xYtT4J7SWA/9COtks/bHOfdjwalPUj67E3EWoQwPotmVNkA/j3t+BhFlEIrCY5FowyY1Nbp9TFPvzT7HyvbgWcaaZAPQ5fFvkz+5erbGka9BjWDyN5piq+SfK7dK/kdfEsH0DU1V4JrmUZ81y4u3VfOCyLvFfqfzsMo44mrTItL5fOZzztJPvpuB4wyhjUIphSDo+mxdv0KCj12s4i+ius2unT0DW5pts/PRhDJIPirzXd5vSfNIQe/jT/DBu+lqqJXt5TwQHcMcFGcXe8Z/Gd3CXUAg2bJp55RYygNkHUeuXDk9VYrF5iAQXYVyZf2qEZjxJ5jmNEdgGGo0oW5P9x8TvcHJUcpd4YMOAayvnVU/LP4Sxgdreg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWtxM2VWNHlJSlJhSk53UDd5RWUxbXRLRGZKUDN1YjYwZ1Y2TmFmNXZ0dnlF?=
 =?utf-8?B?eTNEVTB5SllaWWVQMFlHcXdzcTdZUGx1QjY1RDZsOGlJRFc0cE9kZ2JGTFBj?=
 =?utf-8?B?VHlQOTQ0SFBSZU5FVHhqQXc4S2ZqTEhaNEd3KzV2N2ltSVlVQ3NsZjJUbkJT?=
 =?utf-8?B?VklMcENRUWRnSmFwT2p0SVl1MENzYnNPY1ZtNEVSK00xS0NpeDZhOWloVWtn?=
 =?utf-8?B?U2VsbFVsQUJUL0NOTTB4R3U1bzc5ZnY4eFBhRHpsU29CcmJ5dlRUUDdJeEIx?=
 =?utf-8?B?OTc1LzhnNitPTUFlMW9admpRNDRaOVRSNlVwNVQwcjNCd2VueExPaVRjQURv?=
 =?utf-8?B?SEdyQzJnZjhCTXo2dTl5ZEdtMHoyTUtuL3ZZQmJMT0FRdFM1V2Vha1Q2RUY2?=
 =?utf-8?B?eUlOemVuL2s5MlI2V2N0alBESS9yWnN5cCtsZUM0cmM5c0x5N3R6bEpOcHRT?=
 =?utf-8?B?azhQOG5IN0kvbHBZd2Ftd1RvVytjMXhTTEkzR1B6VmJTUG9nc2FzQ1hvU2hu?=
 =?utf-8?B?dnJMbVJNZDhlYTVjMkFrbkRJSDFydEdjKzJIa1l3QW1KNU5ySTJZVXV1TlE0?=
 =?utf-8?B?ZmR2d2hCWndFTjhJM0VxWk52MFN0QzF3dEM5bTM1ZEJYeTlrWVJ6WEx0V2Zx?=
 =?utf-8?B?L21MMksvMThOSGptTUtwb2dQc2RwT1IrWkV3aUwwUWYyaWRabi95SzdYRjBt?=
 =?utf-8?B?dWtTaGF3OFJYdyt0SE5BbjZmbXU2aGZubjBTKzdGajQrckpWL3NuazZuaHFQ?=
 =?utf-8?B?WW9ZQWJUT2pIclJmRDZDRFQ2OXhobzUyZzJJd1B3bFJ4Mnh4V2VPL2NKNTc5?=
 =?utf-8?B?aUZYYkJDY3g3SkhMRWo0RFVVRmduSzlPNkRKV05HTnllYXh5VmlxOFJEV2t2?=
 =?utf-8?B?cnpTd0djWEpwMGZlb2tGeitrUzhwWmxNajl6dENlWU5nMy9vNHVCWnZZNFcy?=
 =?utf-8?B?ZUJOUm8yUUxtOHM1bHRtNGlENm5jUmNXNFFhR0tpa2JEeUJXenhTWjkyZ2o5?=
 =?utf-8?B?Z0xyZjJxVVZvMWw5eWhTS1h4bEw1UE9XNTlDQStaSGh2MWIzQ2VkTWNxTmp3?=
 =?utf-8?B?ZG5Va1RXQjJEUnprZklMcTlDQUN5bjJCSlB6VDFtNkxLRHlLbVhJV2dOeHhI?=
 =?utf-8?B?ZjlvZ3BNWUxJRFB6akJ0cDNTTVRNNWhEdERTZisrRURLKy9kbzRZSXRuTnhS?=
 =?utf-8?B?aGdqZ1dsQkxnYUNvNWd0STJpSzhoaHhIckNEa1lBSVhCanpYUUF0NTJScUZv?=
 =?utf-8?B?dEc4cnRuR2huWk02QThURmJNNlROL2QvWU9tdEZxL3B6YzY2amxJZEtlTDE1?=
 =?utf-8?B?b0tjM21FTlR1VmVDa0ZCQk5maUo1aTZPT1g4NDJsQWFTTGRXMjZDWSthWVI0?=
 =?utf-8?B?YUgxbEVMa2RkaGd2VGlSRFdOaUpXcDJaRUZyQjNwRWtoTXNicmxpd1VDbDNp?=
 =?utf-8?B?OUdRUlBQZEhIWFUvOEk0M1QzRVJkcmhxZmNRNE1ncDYzUm94b1hmWVkyZzJn?=
 =?utf-8?B?ZXhGMThUVXRXaWxNYTBiNHZ5WjZ5a1dqaldzLzJSa053WnVkbnlKWHllNDA0?=
 =?utf-8?B?a0RETi90aXNTWGp3K3d6dEtZM2cyaWNsbkxtVlZkYU5ROG5zRS9aVnpkbFdy?=
 =?utf-8?B?b3BzdEtNZWs2NFlLYUxVc3JYaHhkc1JKL20rSTlMeTNTUEZ6Nlg5V2F1NWw0?=
 =?utf-8?B?T0V0dm5WQkRiVFIzMjBmUHhKSDB5SDhwZFU0MTd3QjlsZFBFeHZFcTlzd1hB?=
 =?utf-8?B?YzBYd2g5UFVPUHJxaDdsenFXQU9sR1BCb0pJY1Fyenh0SmRGRU5sTE4wcTZB?=
 =?utf-8?B?QXVOaHpUQ3V0YUROd2VMWnhtTVdIUVlncVJLWi9hRTg5OUJmektJWnpsK2Yw?=
 =?utf-8?B?MUdjejBIdGREZEl2ZVhWU2YyaXYwR0dBWGFwQUJIbGQwb0k3THJMdGQxbGdx?=
 =?utf-8?B?RVNEN2Y2VmhHUkovekFNMHVSZU96bi9POHFNV0wyWVN6TWJBc0w3NDlVbGtu?=
 =?utf-8?B?QUl3VTRWRnRoVmpWUTFIb1lrcmV5ZVJOSkFQT3FBWVM2R1RkaGR1WHlTRWlQ?=
 =?utf-8?B?cmVNL2xZS3VJRXVnaStUbkVWYTFLVExuSE0yaW5vWjE3cnJyd3NmTG5HZVM4?=
 =?utf-8?B?RVZTUFpVcDZFbG9OWngxT1prN0FuRVlJMS9QS2lVVkNNQXVBMHJMMUNKaVJS?=
 =?utf-8?B?OXIyeVRYM3JWOWxmWVhKTnlvRWFvdlhyajZyb0ZoKzYremVKM2oyY3RjOGVo?=
 =?utf-8?B?M3E3SVo5bW1kWUVuektWQTVpQkxZdFlBNzlINXo4a1plVWdNNGVISW1JKy8z?=
 =?utf-8?B?MU9OVnpjSmptdlZvYzR1akkzSFZoMG9KSkFzMEpOZ2VXQko0MkFVcmphbEp5?=
 =?utf-8?Q?qcfx4NbcYfOtvy0v6Fx7ZcRla5ldOIvWo/iPs0IEY3Xja?=
X-MS-Exchange-AntiSpam-MessageData-1: V7h1W1eKNQDY7g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3800d282-5aa6-4cb5-888d-08de7850d757
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:42:53.9905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xe2X7oDb68wCBUngFrbWG2j6mFlxsiv2SNLVS6G9ypBSbPcrCaD+gxApAzcj34fQ6t9LLnTpw6Q9QWxCtQRKoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6259
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
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 880F11D7B15
X-Rspamd-Action: no action

Add the EMSGSIZE error code, which indicates that a message is too
long.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 258b12afdcba..10fcf1f0404d 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -67,6 +67,7 @@ macro_rules! declare_err {
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(EMSGSIZE, "Message too long.");
     declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");

-- 
2.53.0

