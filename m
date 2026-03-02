Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKU+AtF3pWkNBgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:43:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C901D7B51
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:43:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C369710E4A0;
	Mon,  2 Mar 2026 11:43:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QD4oGOpN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6CC10E4A1;
 Mon,  2 Mar 2026 11:43:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AWM1hLlqL9A5gM+3rb62f60Ol6aOVku4NT9vRmTFPYYHPj/nzjNlK5hXkT+I7QwyUiABR0ydSbCI5dFCorYU08qfCHIOXghc2C59FZZXGCtQz6xoXQ5vDDhfVELHrv5bghMK/XJcAkHRlvCoskkyQi3kOnUE7/F1U2t2bE/HsBeOrm2EEMNdWq/TnOhsbkh/V02rHsuW+y/suz0h/CP/lDsLIWFE8hDVzdFZo1EbWzIqxYyeN8TIgz2W10pLlGNihCvWqkgGKbVUiNXCS0QjZZ3YT0ZdzXo17y9MUtAjKLCwqtjZGqA34e0ZTBLbft3oOEzOEtoNoqOTkKNimPLj1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuzMRWR+jW/HgR/FN/Y1xTqf9vboNLEBI3fpc3rT3yU=;
 b=ZzYTiG5PERP6Z5MASP4tXBk/c+hbPiKEOfCKS5izTeUnRABl0P4LdB48ReQkf7H7pcrY4mV3JhxcDUEX/oSnRLiLmq2oxtb6BD04uhYcdu3JxF1PRLOGI6GIWyfgNUHONbgygL7Da/DAZBzkPneXq1pUCN0SqEDMMQIzxEsvzM1RsikSg/10Ne8Xbj2wyM9sBT0M8ARQJPyDxGWFcb8r4w8umSoApaS3X4CsvbwYdW3H6imTXBAlUaYPPOO7m/LvBdYMkVhMgjnDlJwnyLhEcYcIgo8B1dF/w0kuzI1l5e+fu9i/czVMYP81cKi/TG7cLCGlXQU1UNeNw52E/oOmQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuzMRWR+jW/HgR/FN/Y1xTqf9vboNLEBI3fpc3rT3yU=;
 b=QD4oGOpNRh+Q0c/FnLyUj6HsOQE9rLvtKvMAJkc0mH0efy6xfpLsxbvKRZ3KAitnBw3a7et+19XflLha6MohyfY+27nJPaYoRbZw3UAliM7AFtUp8+Kk57z6UIC/1IlKTnP2Jhd9x8V+ciKAA44FgsNHsRgAUTvgUd5UU5YtSPYvehWfr2B4Zr095Vwqbwn7h5E8TzhCV1Agcfx17Q3rXD7u+SumwA4gvMbb5QPIdtkTErNTncZ5yLScqVFZqEz+JrryHiuqf7nCZtwD6Q93L9m1ekB0y8GR8VyO6uCNwm9OTxWVi7GOGlcmZdPEQJpkhYi+7YuNrnWuELaD2WMhsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 11:43:07 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 11:43:07 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 02 Mar 2026 20:42:30 +0900
Subject: [PATCH v4 6/9] gpu: nova-core: gsp: unconditionally call variable
 payload handling
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-cmdq-continuation-v4-6-c011f15aad58@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: a4096f52-f8f7-410f-ba3b-08de7850defa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: K6R39Ij00z3YPUgyTDH1bu3oIwMADgDLg8bnZqseWK9OTSRO1W2ROmL3jrSCiWudrdj2KlTSOD08PQntIhkNV29aAK6+QCo+nd2/HVkQXOmgf0s0jRq6MjYUyHYAPeCZ2IO71hmSJ00KSqiYl3u9aH790izBU+m9a8v+O7Z1RHZUulozq9d687lVvGBkT/m7qaeeyurr6w/6VrggcfnmTu5O/ZT3xK4fCoqahFzcFIZ3y3x5I/ubEkmX2aCOPNdy+3S6kxJfDizX+Dm2aCHNSGRbUsgZaV44wRqiMRJ7+4p670Hti08airqFkugeNBY6WtKbPmmViS8W9AHjDJL0rbeHJYXlu+bGqW2tY/B3MoqzVAQQo6oLhaqoDOEb8Pi/5Y5FecG9y2K0nepEQaQytYywbNrghjWPn+vaErIpn++ajl2UFngtLsiJ7GeWipWEBHEAvdFfOO5VkrnxEIj46mwgIhGOdEvsFcaoBexnLkRh/V/2lnJNjsy7STN1MyTX+2zxTtVUqsLDu8nuVOvJJnbm2TbIjAg05bMxU3ZpyM681cpU/eCNCejdHBKBGo0Tngb7khfG9H9M5/5yNQyraeNXnL1qG1m4Q+83Ke/AE9Mv55jVK/7y5aVHNlptyZQ08+F59zhgH4GmTQJM6d3nG3geO0UKxIss2QHpMMV68uUhQhH57nDiUhwP7w3gdqemlro2MQ/MLANkeZrBX9pFjKgG3BmC8fnld2d2gc6Os8OjPiQzUjlIULLg+W6Nwfv4mKkpCVEJtli2hENYZDrl+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U0o0OUFzV1JKSGVBWlQ1WkdkQmVmWmFSNkdzUEFzWFZGVGJmM2xjMmZJaytZ?=
 =?utf-8?B?cm9xQk44c29nTkVPOVk2SW9mOFdDd29OVXNaQzlHMFlXMldrOStwOVlQOG1w?=
 =?utf-8?B?NmxIb3B5dmFNd2hmYno0MDRaUEtqRTZoSDg3cnJidjhhdmhxSE5yRGFFdndt?=
 =?utf-8?B?Vzh1cVBaaFJxVGZVQisyd0piOFlhZFl4WmxkYzJLZzhHblJKYlVseGx1MVFT?=
 =?utf-8?B?U205RU1tSWozejdrU2g0ZUFFcWFMWjh5cFhmYUZQMXQzSTZ4R2JDb1NVV2lV?=
 =?utf-8?B?bUZYb2VkSFUwcW9oSDNPS3d2d2d6U0FJUnByN2lrUVpSZGNDeWd3ajVZemNn?=
 =?utf-8?B?eE92Yzd5cTQvMWdneE96SUl6eDJ3ajZ3Ri96TnJGU0tVcTlRSFp6cmZ1U0Rj?=
 =?utf-8?B?akJIWWZKYnREK3NJODhmWDU1ZzhZS1VHVnNyVWRyOWFDaGJpWUg4Qi9oNVlt?=
 =?utf-8?B?UlQ1UVZuNlMyZE9valBkVkVCM0MyZXo4VVJ4Q3d2b2QrTUpvU0lCSjRNNlJ2?=
 =?utf-8?B?SjdvTHNWbjdieTl2a05DZklIcXEyUUs0TG5UcmlIMzVJbXNLV0tPTG11UEFD?=
 =?utf-8?B?TE1UMlQxcmlvY3VSTUxIUnYyc0YwQzh5N2l1N3RPNnh4OHl5czZHc1pRRlJw?=
 =?utf-8?B?NldEMEVkRmJ2Nm5zbVk1c0s1NFN2Z01FZUJNb3dFMzRuOU9jUnpKYy9xblpH?=
 =?utf-8?B?TFIvNzh6T21VSHVIRmJJSE1DRVE2VkdRMFpWOTZnRnkwbTJkN3JhT2JnNXk3?=
 =?utf-8?B?a2RHQmtUV2tZRlFQazBwRGd3cXVsZERtTnRVL3B6WW8wV2VvU1U5WW0wdXJn?=
 =?utf-8?B?VkhONWZId1pCUmhTQnNlWWhGdDRHMG0vdFM4eS9rSElodS9qTHZhSDNGUkhY?=
 =?utf-8?B?bkpsNnczNGFHc0EyZEJJY2xhNFFzSVV0TlN2K0lBRDhucE00ZURvUG1HNDE5?=
 =?utf-8?B?ajBQYzVkY3lMMUowdlRoU1diYUtRTGdpU21wVlhmM2V2bnV6bFBwbFh3VHdh?=
 =?utf-8?B?MURKT3lZQ3oxWGZoZUVMYXhHOHNLclVXdE50eXNtZkczUlVFUVduTUIvR2xF?=
 =?utf-8?B?MXA2REtHRHV2YmJORUg3L0VuUzl2SzZ4bkROWDBuYnlvV0F3ellwbGtNcG9M?=
 =?utf-8?B?d254Qno5WlJ0aDBveVJUYzBJSnhFV1BrTk1nbmw2UzdwVGJHelJ2NDhRb3Vj?=
 =?utf-8?B?SjNLanQ2c29wQWI4Z1BhUmIyNDZKaVpmQ2lIVXRQdlBKQ2VyY0JmWDh6MWlF?=
 =?utf-8?B?MXo0Q0k2bExDMXNSVHFzTUhUTThrc212SXVxNnY3ZWl5QjB0NlF4OFRuenVy?=
 =?utf-8?B?WHFqV0M3YmNQanRoZTYrS3hFY09ER1NsUkIzRGU0L2ROWmFLVFMyeXZnLysw?=
 =?utf-8?B?ejgrOTRtYVlzZEhzRkxqSGJyZnNvbEZIT1NvRzV6QWFRajUzSEtSNlZmblh1?=
 =?utf-8?B?d1FuSmRjNHFEdCthQW9BTUJDbnRRWC9xS204c3dXcVEwM0xQUThQUy9vcnhl?=
 =?utf-8?B?WGVVUTFPUmt3UUhuS1gxYWN6N1dFMnRoeW1nK0dQS0xlNUk2a1VHRlk3b3hD?=
 =?utf-8?B?emdMTmZDclM5eHoyMjcwYzVTaE1UOFNvSmI0VVpHTW5HRmpaQ1BlWC9TY2x3?=
 =?utf-8?B?U3Z6K0JkWlh6WkxUYUFOR0FiVXZ0YVlwWk9yK0d3ZW5ScXh1ajJLL09ESFov?=
 =?utf-8?B?M3F0RzlFZUhMSll5YThZYlRwUjFvSHlMd28vMlpjQm1aK0FtTFp4SGlVOTBk?=
 =?utf-8?B?eGMzM2FOYnVvWVIvWS9OTEFaa1piOWZxb3NJNjBrUXFDM3VxZnhsYVJxL2lx?=
 =?utf-8?B?Qm9LeFJ3dE9qd2dhSnR2NTY3Z0REcVRFdE1sVUxPd0lMREQrNmpQdDdRbE9T?=
 =?utf-8?B?cmhqb0VDMGE5RXduMFYxaXJnUkFLQnloSmR6T1MyOE5IU2hoVUR2UXRqNCsv?=
 =?utf-8?B?dkt6S01jL3hWamxIVUIxaXl5TFk2djJsV25SNEJacnBrOGp2QnhGcmhweTJx?=
 =?utf-8?B?QWhCeDY2aG1YQWVSOVZ4MlcxQkZ0ZTNEN1pGZjhMZ1NyYWFYM005TlZZbjlB?=
 =?utf-8?B?Qm9LRTBTOWJSbkVzRGxYWUxIdHVqdC9veHlrR2FVL0Y2U1RST0VHV05pT2x4?=
 =?utf-8?B?WjVqUncvV1pEMUpScE94SzRBRUcvb002Nmp2MVg5R3FqbFFmajhtVnZiQ0lY?=
 =?utf-8?B?RnExMVgwSGpGekhNTExHTEVnQnVVR2VqYXNWbnhleU5XTm9mZk5IczBxUmN2?=
 =?utf-8?B?NHMrZ2s2R0x3djFqelFxODM5NDRRSnJXdHdDMFMyOTFET1VqUG13OCtCNEF6?=
 =?utf-8?B?TWxqaC96aExCYU5OQzFXeXNDRkMvcmtQNWZCQUdSTnh2c3FJbnZTOXJLTjZh?=
 =?utf-8?Q?Sy1jYppBtA0zwJ2ej3hFn/hKIgsAPZCxmWUu7kbZ0v7eG?=
X-MS-Exchange-AntiSpam-MessageData-1: 1tzNuW+jaJkVtw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4096f52-f8f7-410f-ba3b-08de7850defa
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:43:06.9408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PqwvD6J3MCdqZAo1ow3VWUHx7vfnaJeZHDQ4uH2MuN48/mkKLnijLZWtpSSK2U1+yCQl+Jg1CO8bOV+bgR9cKA==
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
X-Rspamd-Queue-Id: A3C901D7B51
X-Rspamd-Action: no action

Unconditionally call the variable length payload code, which is a no-op
if there is no such payload but could defensively catch some coding
errors by e.g. checking that the allocated size is completely filled.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 3653212efa7a..9f74f0898d90 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -545,16 +545,14 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
             command.init().__init(core::ptr::from_mut(cmd))?;
         }
 
-        // Fill the variable-length payload.
-        if command_size > size_of::<M::Command>() {
-            let mut sbuffer =
-                SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
-            command.init_variable_payload(&mut sbuffer)?;
+        // Fill the variable-length payload, which may be empty.
+        let mut sbuffer = SBufferIter::new_writer([&mut payload_1[..], &mut dst.contents.1[..]]);
+        command.init_variable_payload(&mut sbuffer)?;
 
-            if !sbuffer.is_empty() {
-                return Err(EIO);
-            }
+        if !sbuffer.is_empty() {
+            return Err(EIO);
         }
+        drop(sbuffer);
 
         // Compute checksum now that the whole message is ready.
         dst.header

-- 
2.53.0

