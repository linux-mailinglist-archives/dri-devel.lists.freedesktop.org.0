Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DT3HPiAqmkMSwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:23:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2277B21C66E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:23:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7364310E397;
	Fri,  6 Mar 2026 07:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Z6LLc8lk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B196D10E3B1;
 Fri,  6 Mar 2026 07:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bJ1p3KpsgUTkEHkNjxDbWrStuGNDXidxl3UdA8tnR+omu3FYQYlr3rv6v8rYrDgHGen07dm1d5LXAMFJoUEbYtW3HrKY+0fP8aouqzeIzTWJpqVnAVi0u3ec8MPJXDL1nPnBUh6s1CQmeb6bq+/MpCn8Ir0vgLZn7kCq2NHoUw/yQmPMJ8Hf78vQfyCk2EmfsRqBsCYfPm/jPtXUQ6NAyRa9olOXHhi1iMg/zC+4V+5F5p9vvY8pEfm9u15AOK6/HRkFbUtWvypZze2twuZVEb1RzXRDwmah7ilsObaX/UTFWDV8Axn7cqjxgnkzkkCKmVCnB46V3/z3bVnad7W1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCDI1FfzpIaUEe+sRzK6rswblJQiKhPyjOAj8CGniP0=;
 b=g8r7YHQGGoQktwjLlocGEoWgfskPEmjuM7K36RvwHvWWe4CPYqFR++/baXHAAiAEoRxcxRdK0VV1fNYPaupoflxIO/qxMBcSehLLwgjHGIOEbMXFHyB/PwC8Qc93o/X/LhFSMif6f46QJpRIJL4eNmYlXviQ1wPr8uVEgEADU8DON1+6YFhx8HRRm9Ze9CCZ2Kk1aIdcxu6H7TyNQ8+qZ2CVO2o9pd2tBRF6axm/og5Bhc8yJBZ4J90fkdmCT7oYYgWh9EVbzAoZ9uCMdN5Po4RVqm77XDVaQ4TG6RG1oETwEpMoQgnIvJRpCtbfBmruvDtOFg111Rnf6bs/d59rNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCDI1FfzpIaUEe+sRzK6rswblJQiKhPyjOAj8CGniP0=;
 b=Z6LLc8lkpdYDIuF3qFQEQwcEtNH6FbhK/fw1ktj85imtt772lpk8VtcLGq0ha5HP7MlOu207eyc91azLJPZYhW2ZxYTsmRCk38ty2pP+G74dtHQN/tLrqHMIM3QbPAW458bm9H1OOp6UdF2zVvC3GDjKyKPH05wA/+j+z8ksJ4gSXSKmN+UxuY8UlyAHo5MYZL9GCt5YAbyo1BpjARxV0sC8qd6iKYEp+ESQUJG1KAVRp83bAVXu4TJ1GCzN0FDn+U+c0ZOpU7zhabY/IBgHAQc6d30S3+rLgz2KlPIBXAVzMtjGAilzrK1euMHFLRvXfdNp0DVM3yDtvi93bCZJWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA3PR12MB7951.namprd12.prod.outlook.com (2603:10b6:806:318::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 07:22:14 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 07:22:14 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 06 Mar 2026 16:21:59 +0900
Subject: [PATCH v6 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-cmdq-continuation-v6-2-cc7b629200ee@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0156.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::20) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA3PR12MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: 2efd1cc0-398b-4568-9e0b-08de7b511756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: yIr2muZ5wjflGBbmTvkpGgv6UnFPoNfwj3qVjdlxTYDdFHscDjh+T7eBYT6/HjiC43/PDUJYmMVDdT0rhkViOYvpaKdzGZ7L+bj9e2hIzEZTxAr2ePILmZEDemh5KyUCLFyhSSg2mpfHQi/pfXhhQhQGM63fZwP2xdlAG5X5Mq2Z1+b0b+MtGwRmStz2pVmArmTo92cUos/6D4R74TZIVrQl1bdPWNf6/eR0IRaFIKQ2Glymn6vJSbv/BeMs8ahicvkMd/2M+v5u9nBPmAAvbTyKq9+74ZBAPzlb7S/zF96cc7VNEm2R5SCmjMzN+jrqQ/8mzia0OiC8wWM3dP35XK61Ys4Vebs1P7XeuXr2tyaEENr1fBOyUlNl2fkYMjLfV/tfahFO3iT4VS+5xmtv9WaZt/gxyUH5R1KFI7FqY+PKJhFZ9RXxqm4vL5cskaWvSSnMxej8rUvaRO4opzckhV9Ty8WKWS824yxpMgnlU5fVf9A+lki41YZFw+ZYoBDvic7b98hqjbZ6YezDWcvDovUy0Z+6McV+hkvhCojhKHmPjfcgIisGykusiSBJHbRp3iL4vgzr0suaYEuHPKiV16V6JnS4hk60FpTZ21qTo8Txwd2PO4TPm4l5LiHlu1zhWlbbRgt8XZWGLCl0TsVm6ZPb2sHEPXjb+ByzA+Xa3oh8yvSrETZoKapVmi1I+sRaCsadK+VW2b9UeA5SJGRsO4e1jSQp7B2R+FUwMVbPfMWoKnbd++v8tHNofVmAxFtgSShBZtLkkOq4r80t974n/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0hIaWJNbVNqaEgvS05lL3J5aWlxMlFDd3ZSemdSajB3MDZqMjFEdjM4aGhL?=
 =?utf-8?B?V2swdnd4VmpyM3c3THo0UEFHTGJoQVMvRjdDZUxSM1JWUG5uUjBZdno2dzNp?=
 =?utf-8?B?cXpKemZlUkZpdC81bUpCUmZJbmJqRHhaMHd1OTlTTzJIdFMwMVI2dW0yVnZl?=
 =?utf-8?B?NFlPNXEvc2pvdGRlSDlaWndVUG01R1pabUE0dDV5UDB0ZDFDS1Q1UFBUc3Rr?=
 =?utf-8?B?bmQ4T2VRL3VjcGJMOVRXeHd4NUFnT281MG9RNmR2UzIwYmwzVSszYXFRV3R1?=
 =?utf-8?B?NXllclAvT1BLSUZnZVNXK0o1RnZPck91SnhLc3lPZVJDTVhHMmFVbWdTWE5P?=
 =?utf-8?B?V3oyNzVCWC93aWlRQ3YyYVlCV3ZHUnNTdGlpRWRDd0w3TVFUandKNjIrNzZZ?=
 =?utf-8?B?bGxQWlNlWG8rYmthRXR2RURBbktiSXRvbVJ6RjNXZ1lVbGF0V0FmUzNpbkhQ?=
 =?utf-8?B?aTNKMGIzMk0zL2lPTzhiTTJjK1llcTNKeit3TzRJckxRdHoyQytpQXJ3K0RB?=
 =?utf-8?B?Sk8rZlhuWFY2eGVKU1QxL01vcStqSFlXVXZ4c0VpaS96eVExRk1Uc0VwVFl6?=
 =?utf-8?B?b2FXTXdwb3ZjV1dwWWtwQ3pTTUVBMmZ0YWRtQjVlMUZrQ2pxT09WWjNRQVNq?=
 =?utf-8?B?c1JyQ2VERWNyK3ZwYVQ0ajc4SHlKanJnZjMzQ1E3VXJLWFh6Qkh6UzFUMW81?=
 =?utf-8?B?WUh1cldFTVFjVW14NHVNVEZCUG5mWjArRUROQ3QyNW1idjlKbEtqK1NrT3hm?=
 =?utf-8?B?SU5SQUZrNHQ3dTA3MkpSbnFkNnpaNDV4cXRmaWc2TWhZdjVOTFhBK2pWNG9F?=
 =?utf-8?B?OGt1dUppZVA2VjYxTWVnRWIrc2xLWTNvSm9aNlJsd01SY205SjdLd0pibW1s?=
 =?utf-8?B?akNpUEYrL0k4OUNHLzU2NHBHZFI3d0t1MXpydjR5N0xodmFEaTQ4M1NhZ3Mr?=
 =?utf-8?B?bUZITE1UY0c1eEpaQzM3djN4YUhDbWh5UFQzR3lSSjdLZVVBMUtWQ0RiQ1li?=
 =?utf-8?B?UEE3bXRhbmJodDNIellzZnhmNE43c25TbktYeWJpQnVocHlMU3JTelhMZzE5?=
 =?utf-8?B?Vytta1dhc2hTYWlVTUhqeldQYnZUMkdzZUVid0JYVm5kbnEwakN3ZVZCUXFm?=
 =?utf-8?B?b1VJNjQwbFUzVTYxYWVpZXdUcTl1M3d0Qm5SWlZSS0l6RmhQMSt2Z3Iwejdy?=
 =?utf-8?B?R2lCeFovSkFiNGp6RjNjOU41a0w0NDRZSjZwNkdLMm5iK1dBY0xnY3c5MmZ0?=
 =?utf-8?B?NEFSRGlmckdEY3c3ek5HOXllMktSaXVUREFZelA1d3RkNTAwOUl0bTlhVmhG?=
 =?utf-8?B?eE42SWlhQncvNUtuYlYrNk9UTE9XdlVzQllHY0Q5NVF2MjlTV2xveTlqUjE1?=
 =?utf-8?B?ODdGY0IxOXZYVjdKWHRJaDJMMlpmVDZpMjBaQktEVUpzMWM2eHVSSHJjZWMy?=
 =?utf-8?B?VnZQRTFlWjF6bkI2N1N5UjVvb1Q1a1JMeER0TXBPY04xR0JwaG4ySGV6UW1Z?=
 =?utf-8?B?d2JGeDJVTnJWL28vRHlNclNEYXUxQjllVWtEd2VPMFh6N05IaTJjK2xCQmx5?=
 =?utf-8?B?MjNwTUNCbnRyM21GMnRmay9xYXQ5R24xKzNIZnE4WkZjUnE0ZU1RTlZZWTJ1?=
 =?utf-8?B?ZEpXRXhoUmFNU0t2VDB1N1IyRkRkcm9Ea0xNV2N3UFZXUG1LQnF2MGZ4NDVL?=
 =?utf-8?B?UXhxUUhQcElXRlAzOUpweWZ2NVY3YWNLYU91SlVNSGRHaDZrMGRDc2hpek5v?=
 =?utf-8?B?cXlBYS9nREhZQ2E0YzlQcUQwQjIyNVRBTkdpS0s3TEhSUVd3R3pxNGg4VTVU?=
 =?utf-8?B?Z3JsU2ZhU1hqU0xOYmE0WHNDKzRnZHRFR0ZyeGcySWU1RUpEa1diSXI5bDEw?=
 =?utf-8?B?bWxXTlJIaURDNnNLcDR5aXFodEhIM0IxRko4UFpkUitvUVBWUWMzbEVNbVlu?=
 =?utf-8?B?LzVZOUM2MWt3RThaUi90YjJpcHhwRjFOVDNaZzdSZW1qZHk0UGNPTkJwUTdH?=
 =?utf-8?B?SVZEQmJjSEhQVkZaZHZTMGgvU2dSWHRwcjlIbFhRQmpvRUc0dElCU0xkUzdU?=
 =?utf-8?B?cEtpTE0xL0dsWGticUw4UVJXL2Z6SWExWGNSSml0TDI4VCtSejBjMzdreDMz?=
 =?utf-8?B?QlpIWWt1alVLQjZUTEs1clVJWFlmK2pIVithWmhqMDloc3JMYzZ1dkdFOHFk?=
 =?utf-8?B?SncrNktlUFpWVkhON0RwdGxEQk5ra21qY3RQNmI5Q3NtekpDNG5KVWhQUGto?=
 =?utf-8?B?bS9PNG51RTNLVDdBS1BmRHNKM1dKdkNPN09YYlRLUVJJREN6WGxTTUs4c2hn?=
 =?utf-8?B?VDAzSXpwb2YvaHREUW1JdVVkTVZ6RDl4VC9vSTZlZWxSVkdqSTdUMElndUNU?=
 =?utf-8?Q?QB5D/2wuayH7L4WsfmZHPncyl250AEhVsCkQM7RF+lN6I?=
X-MS-Exchange-AntiSpam-MessageData-1: EpUfKcmjk4udQA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2efd1cc0-398b-4568-9e0b-08de7b511756
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:22:14.8176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNkqlj69wmolT6sVaDYIvYXoH0S43AkdIugdhtD42AwKXjLyxEiU0/nIX330t/h8q5XTsdQFEQ2RsZdlfJg0Iw==
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
X-Rspamd-Queue-Id: 2277B21C66E
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

Add a timeout to `allocate_command` which waits for space on the GSP
command queue. It uses a similar timeout to nouveau.

This lets `send_command` wait for space to free up in the command queue.
This is required to support continuation records which can fill up the
queue.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 42 ++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 87dbbd6d1be9..12849bc057f2 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -250,6 +250,19 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         }
     }
 
+    /// Returns the size of the region of the CPU message queue that the driver is currently allowed
+    /// to write to, in bytes.
+    fn driver_write_area_size(&self) -> usize {
+        let tx = self.cpu_write_ptr();
+        let rx = self.gsp_read_ptr();
+
+        // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invariants of `gsp_read_ptr` and
+        // `cpu_write_ptr`. The minimum value case is where `rx == 0` and `tx == MSGQ_NUM_PAGES -
+        // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - 1 == 0`.
+        let slots = (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
+        num::u32_as_usize(slots) * GSP_PAGE_SIZE
+    }
+
     /// Returns the region of the GSP message queue that the driver is currently allowed to read
     /// from.
     ///
@@ -281,15 +294,22 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
     }
 
     /// Allocates a region on the command queue that is large enough to send a command of `size`
-    /// bytes.
+    /// bytes, waiting for space to become available based on the provided timeout.
     ///
     /// This returns a [`GspCommand`] ready to be written to by the caller.
     ///
     /// # Errors
     ///
-    /// - `EAGAIN` if the driver area is too small to hold the requested command.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the command header is not properly aligned.
-    fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
+    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Result<GspCommand<'_>> {
+        read_poll_timeout(
+            || Ok(self.driver_write_area_size()),
+            |available_bytes| *available_bytes >= size_of::<GspMsgElement>() + size,
+            Delta::from_micros(1),
+            timeout,
+        )?;
+
         // Get the current writable area as an array of bytes.
         let (slice_1, slice_2) = {
             let (slice_1, slice_2) = self.driver_write_area();
@@ -298,13 +318,6 @@ fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>> {
             (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
         };
 
-        // If the GSP is still processing previous messages the shared region
-        // may be full in which case we will have to retry once the GSP has
-        // processed the existing commands.
-        if size_of::<GspMsgElement>() + size > slice_1.len() + slice_2.len() {
-            return Err(EAGAIN);
-        }
-
         // Extract area for the `GspMsgElement`.
         let (header, slice_1) = GspMsgElement::from_bytes_mut_prefix(slice_1).ok_or(EIO)?;
 
@@ -462,6 +475,9 @@ impl Cmdq {
     /// Number of page table entries for the GSP shared region.
     pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
 
+    /// Timeout for waiting for space on the command queue.
+    const ALLOCATE_TIMEOUT: Delta = Delta::from_secs(1);
+
     /// Creates a new command queue for `dev`.
     pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
         let gsp_mem = DmaGspMem::new(dev)?;
@@ -497,7 +513,7 @@ fn notify_gsp(bar: &Bar0) {
     ///
     /// # Errors
     ///
-    /// - `EAGAIN` if there was not enough space in the command queue to send the command.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
@@ -509,7 +525,9 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         Error: From<M::InitError>,
     {
         let command_size = size_of::<M::Command>() + command.variable_payload_len();
-        let dst = self.gsp_mem.allocate_command(command_size)?;
+        let dst = self
+            .gsp_mem
+            .allocate_command(command_size, Self::ALLOCATE_TIMEOUT)?;
 
         // Extract area for the command itself.
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;

-- 
2.53.0

