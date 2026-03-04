Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Fn/FEGOp2nliAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 031941F99A6
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 02:43:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4E210E91C;
	Wed,  4 Mar 2026 01:43:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zw19Cq0G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817B010E91C;
 Wed,  4 Mar 2026 01:43:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+jr/bId7pSh2NwSOjue43OsbNItZOcQVBd24b+/K0L3eVXs4oRQH56foYZ0CZ2Le6GVJdLBwwzSEO8WKZHATG4fMvAlNEeR5p4BcSqrxxqYbZJoSm6GdZsDZPuTEbtl8KYFVt34YOPfl+X7JC6hFNdTnZ1zFTP3bUyWAvVE78IKRfutsbdZIz+eFhIfIYywcP1iW5TW9capiCncHxFyhakbJSfLGVaBNUE0ks8pzxSXJK91c5OW4Aq6qAHr3DrlvKqRDeRCfhznbypit6MHz0AatiPQrrKrmaXgws5rUPwktDI5zDO1+aYpXcrx5K6BaT9kbCdWSRjb68THjM3KVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S5bjUV6v//R4U4/FT7AVOLBZWYrO322GiMHTNvepn7Q=;
 b=MpRGRZuxJQ+h1muua+BkN+d6ClR+O7J1gs4ZOEKTnGl/npBemqGQbsJX6REdHK4cxpwYCbGQ40qbZeE7KL53u3ApmfF5bKStCNGlIuDnHf/MIYwkOOH9GtYn1N06YTyfEXyMjRJS/w5D6m1CNFI2DNlbR4hbejqGfF+7PSg2xxfAfCYi0XY6GmXdCmZ8xZmd500Rspl0zpEEDIxJ6MB7FqZWDBC1zAGf4wkBehY3fimFU3CYwx5gMOGEKnUNv3yH4DHPU4K+0Cl4LEErSkdBaLXu0HjxG3BiB02zmVEsJqyraowVCBv9BtOElDeGidsRx5k5KJbRWPCROktgx4wDMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S5bjUV6v//R4U4/FT7AVOLBZWYrO322GiMHTNvepn7Q=;
 b=Zw19Cq0GD8CYdzjRj9zHD0ZS7LGq6zrJsN2160jf/d+JPL0z8/ziIEyZeRRTbQ80QUpJKF+EzDiLaZde7NQNTNoXp7NtgtIn3TlRtCHk3E6ZZX/dGS+/vRat6j2IYFeI84GM1FFsKii+z5Tjzi+dBa6snRcugtsHqwF314DUEMDAsg2F0EU8cPcnoo8lbJRpvBZBXW5rXxO7s/Of841dsyAosj5wFiLquW8SkkuFOdQn2YQkt87ZXdDoaxVb/RcQUE9kvT6GpOykhFd/Vy8r9IJ86TNGs/uBJoTI53hHBugUSsMCsARc78RZ6HtUP3B/gXnU90KvMJkDaGrRd6pKZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BL3PR12MB6545.namprd12.prod.outlook.com (2603:10b6:208:38c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.20; Wed, 4 Mar
 2026 01:43:21 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:43:21 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 10:42:20 +0900
Subject: [PATCH v5 4/9] gpu: nova-core: gsp: add checking oversized
 commands
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-continuation-v5-4-3f19d759ed93@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0140.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BL3PR12MB6545:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b5755de-ec41-41b3-bf49-08de798f6ace
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: tip1ISTt9mWVJwsfgWqz5psgrcQ4s5Ycvk9MPvKRJKJwpYVsIpfXYK6eDLIEyb6PH7Ew1uymQejGkvkz6q00r86erIeV4Ve2EYDvDBKYFfgRlKbRcox7rFex2QppusMKVfehWNu1jLgY+dEeuZixmeFkf8YoT09O1Oz809qzWph8aCvqHnds+w0lJVzwXNgwDv9KyVXSSjexqmtDU+F7w8ws61rpTiml2K66mKirHk5RquhdcRsvkIeF1tptoTcqqdBTs4rJAaM2HnbXMFuqxWMAPCjE0Rl4c/NuuazJsVhmu9veyBruPCecrhExKN0W1xB3URUfo29zMPXIs5D58M6zflU3zSljOlmg9rSchXuPEpIU6fXIz9/zIMGl0cwD/l8lAVFTkoYZtU8jOCXhWBiA9C4ZhJpAXwd4l4wt7+g0a15Wft1PD4wQIMrJ5kIDZIoZOhpkZI3RNsok/SaEavHi7+jjTdoKYpphPVNEeEzGUZq/B+9PRfQCl+fLoaA5c1HJYfnAF8ZeIqAGUt4LE3DSVB9gtxD2eMtKRWJtQjXd3t0lOyYOuDzTZV4AmA8XFAnrVCIIDBlvi7xSbG79JTlXhYk1+F3Luzze7cU+jEcopJJB3zpNrkzOXxk6EOPSJHB/PQfBGkF6Pyxkk+TMnokTOn9Q7iYIRiaAhbfktG2ZYSSESte+4PmJvMR42Tq6wEdTFxkQU9KJLNRZV7AzA0yXHJT9YjaehnN/7CWo/iqx/iGMBpYCayOVkQwXvlSQyPkWz87yQk3JDZcwNtTxMg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aWRXS0NoVUNMSTF0TG9kQ0tLZFMrQVRJVWo1TVhEaHQ1aUtMenB5NGZPaVRO?=
 =?utf-8?B?YUh6ejdNTy96M2Evd2RySnRIaTgzblczc2V5WXdzWUxTa2NCZThTMytIL21s?=
 =?utf-8?B?dTBTMXc0SFZiNHJHWmZ3WTlmUDZORTF5R2Q2L2xNaFF0M3lQTU1jSEVKUU1a?=
 =?utf-8?B?aHhOUTlCOUhxdE9EWEFmcC84dzRtR04vb3RnNm00blJiRk4vaTNSMkxzMFJZ?=
 =?utf-8?B?OFlxU0VwTHpmcm00c1NIMTVwejZKS215d0lKY1dld0V4dnhnZk5nYy80VE1o?=
 =?utf-8?B?R0dWUFJmWVF6eTdlSmZKOVl5Zk4rUzA0ekJJVFRJaXJ4blZHQVNGTFpLc1Ru?=
 =?utf-8?B?Wm9JNzJxQWxSR1FwcCtlOTB2YnJYZWo0YTdjN0xQMHVudk1Nam5oZ2d3ODFu?=
 =?utf-8?B?QXI0OThGa2pmRGxHYWRGbVpBZjE1Mkk5Tnk1SE1GRkovR2hpc3dtZkQwUkV2?=
 =?utf-8?B?YWJVNnpvd3J0YVh3dmVMdzBYalNTSFRBcU00NHYrTzJEL014UEV2dDlNeWtl?=
 =?utf-8?B?WDl3eFFubUFaRklZL1Y4L2IxQzM0M3ZTTHNaNDhIbW1laU54bmkzV3lHOUpW?=
 =?utf-8?B?N2JieXdoQy9icFp5dEJONkhRMDFCV1FkY1JSWGdvR2JWa2FyZDZvZDd3Y2U0?=
 =?utf-8?B?ZEJ4U0g2OXFFdFpad2QraGlDRjlBZ0sxN0ZQc3c2aG9FSkhBWnozOXVQTVJj?=
 =?utf-8?B?ZGJjTnNQT0Y3L0RKbkFudkIrUlhTQ2xxSHl3MlFHU1RkaUs2OEo0STMrSmN4?=
 =?utf-8?B?RE16SW82dnZ1bkgvUmU4czNZRHdDNnBjSjJOMkUzMUJHTkRIM1FMbVpKVTBx?=
 =?utf-8?B?Yjl1dUpBTXR0OWYzK0x6bCtVTmJ0K2dSeFhqWEg5R3oySVBJMmVPV3BSRllp?=
 =?utf-8?B?MkNrZGJyQy9Gc3hYNUZxWkUyUHBtZXVadzNNRllHazM2UFViUEFpZVd4MkVC?=
 =?utf-8?B?dTU1M2hjSXMvY3dZcHRjSitQcGIrSTZmdW0yOUxzdDRrWkFPczRVZk1IT1Bv?=
 =?utf-8?B?bzJ5YWtqQjVzazA0cE16dEwwbTJscjN2SmtObUhXL2xHdjR0UzFPTTNBSVMz?=
 =?utf-8?B?M0VRY3JUSHp6Skx5dVI5azg2RmZyYmlvZzJCa1BxUVBFcEtQWmYvYnNSb2RJ?=
 =?utf-8?B?VktzWWlLUkxQSFpBcjJUZDFSblpaaE5kdEpWSVQrd1YrN0FiZStsWnJQKytv?=
 =?utf-8?B?MDgvT1pWbStoNU12a2JuT2tiMGVsWm5hSjZ5MUhCQmpFRWQ0eER1YUh6bWRE?=
 =?utf-8?B?eHJ4UzdxWFFaWG0rTTJxTGphVm5idVE1dUlIV2RJc2NhWVhkU3VRVTdNUWFp?=
 =?utf-8?B?YmpLcU96akpWQ3NpWEpyTHFOY3RKZGsvd0lFNy94OWlBcGQxN21xd0l4QmEz?=
 =?utf-8?B?TEpiTFlLdFJNekE2ci9BYVgzZzA1WTRxNjY2QkM1THYvSSs3TVdkck9ud2ZS?=
 =?utf-8?B?d0FKZ2tlU3JkNVlCUjNwZlUvcnFPM2V2dkkvWVV3MGhzMXpFait1NzBWMzlr?=
 =?utf-8?B?VCtseW4vTXZVMWVnUGpyZ3AzSW1xSGtJTXhVV2s4cGZlWE56RjVNYU5kN25O?=
 =?utf-8?B?L2lka2IrQ0N2N1RQK1RaeG1QYnFyUmRsZHg4U0hvWGdlZ1BGU01SaGtzL29O?=
 =?utf-8?B?amFQRjBlUlNRV0NqYm1lYWhPWXVEYVFwa0xBN203RGxmb3lkSjRWYlMreG4z?=
 =?utf-8?B?dTlaNFNjejBOeHdGU1R4Q3UxMWdycUw2TzBlRklRMlhuRkR4NzlMa2RiTjdp?=
 =?utf-8?B?UlpiQ24vTVhrZlcreWthOCtic0tEQXgrYTlrY1VSaXpnekczcFJyNUxMRFla?=
 =?utf-8?B?YUt6LzV5L3RzMFF1VDRzVUxjWnVYa3NZRWxPZExMc1B3d2xtSkd3bUR5M1d1?=
 =?utf-8?B?ckJnUkpSVmFVNDZJcEFrcUp4OEVaMkJIZElyZC9DM1J0cG1iQ1ZvK0U3cE9w?=
 =?utf-8?B?eUlFempkclkrVUpvUngzd1ZHNStubXVFVFdUZU93eE52OURZbjJmQStqNG1E?=
 =?utf-8?B?VzQ4M1JEdjlYeDJqcmd1bmVkZFptUzFvYndFRDZTTzliWHRCL3JvYmVicTFx?=
 =?utf-8?B?TVZWcHJXbnBWYzVSOVF0UHBXTmNSVW15dDArNEdXVGd5MDZVVDU1UGFnem5V?=
 =?utf-8?B?WDFtS3VrRGc3Yi9ZVWxjUU1IanZCcjRUUkVTM2FWdGlKUndUTWxKR1l6U2lD?=
 =?utf-8?B?ZzJRMGFGMGFoWTNhbnBiMjczdU94T1RQZlpOaDVZanczaDlnNjA0d212VXV5?=
 =?utf-8?B?TUN1YzVQZ3ZHVEsxWXpUMWp1em5PZ0FHRDBBaHJYclJFZ0dlMC9tUTgvb05p?=
 =?utf-8?B?cW5odVkwekpKYlUrQTNVN0t3QTFYenlWTEpZUmpwaWRXVEVIS1lCY05IMkg5?=
 =?utf-8?Q?YEyGir8Nu8qOka0IaYOULaU/hZXdAB0y8HRnQ6dm88tj3?=
X-MS-Exchange-AntiSpam-MessageData-1: oG2bxLAuYRbpSQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b5755de-ec41-41b3-bf49-08de798f6ace
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:43:21.3380 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MblYHuNgyNMAX8uhDh4WQj9gtWuCLZX/NjvNi7R1kRNBwilLYj22KvnvVqB2hJ3SRGq5nOrZkDwb3xd8qp3CLA==
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
X-Rspamd-Queue-Id: 031941F99A6
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

The limit is 16 pages for a single command sent to the GSP. Return an
error if `allocate_command` is called with a too large size.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs                 | 7 ++++++-
 drivers/gpu/nova-core/gsp/fw.rs                   | 4 ++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 1 +
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 5cb845bae123..73012da436e5 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -32,7 +32,8 @@
             GspMsgElement,
             MsgFunction,
             MsgqRxHeader,
-            MsgqTxHeader, //
+            MsgqTxHeader,
+            GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
         },
         PteArray,
         GSP_PAGE_SHIFT,
@@ -300,9 +301,13 @@ fn driver_write_area_size(&self) -> usize {
     ///
     /// # Errors
     ///
+    /// - `EMSGSIZE` if the command is larger than [`GSP_MSG_QUEUE_ELEMENT_SIZE_MAX`].
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
     fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
+        if size_of::<GspMsgElement>() + size > GSP_MSG_QUEUE_ELEMENT_SIZE_MAX {
+            return Err(EMSGSIZE);
+        }
         read_poll_timeout(
             || Ok(self.driver_write_area_size()),
             |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 4b998485360b..6005362450cb 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -39,6 +39,10 @@
     },
 };
 
+/// Maximum size of a single GSP message queue element in bytes.
+pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
+    num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
+
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
 
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 6d25fe0bffa9..334e8be5fde8 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -43,6 +43,7 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const GSP_FW_WPR_META_REVISION: u32 = 1;
 pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
 pub const REGISTRY_TABLE_ENTRY_TYPE_DWORD: u32 = 1;
+pub const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: u32 = 65536;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;

-- 
2.53.0

