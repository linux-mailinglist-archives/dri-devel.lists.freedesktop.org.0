Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBD0Lt13pWkNBgYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:43:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506651D7B9E
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 12:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEC010E4A4;
	Mon,  2 Mar 2026 11:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="suRepmq6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010070.outbound.protection.outlook.com
 [52.101.193.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6385810E4A6;
 Mon,  2 Mar 2026 11:43:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F7AwRTJyFoDBlsq/lvZKpvCc6Kjb8O1QdbdMtlPu4h6xjkKZc9a76WTct0+4BpPMyHM9MWtkk8UxTpgzmQodRv8zix3c6s5vil4WnhPvRIZL02t3991Y2kQzOezfFZSiyu7+gBBlt+Jkuz/2XppXKUBQyvC/AiXJGDjh1EqSt+FexKKAbgocnO6rzQxs5GEPMBX0TdcyRkgFHRLftZ67TFuMWZNki7sFtt8FbdHkjVHOQQqKoQwhwHRDzMLEt6QXXEp1hU2GJthXPM03xdGENA2INjltRDSA4eZb+AJ3guugyuHEUYiLWoVHapZlTuHVJkSz6GDRqjW56HtSLXVwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1z+hYhGKIqUd7jVgOzo8Uce+rUMPPH/Ex2wLJx3MIKU=;
 b=W3ZLasX/IzUF03hXrBhS4D3m0rXh+QvahMcJABO7jTb23NSqRzJyDl7so/DLhL7xJzC34XZyDRQ13ighwPLaetJ8TYzCe8G7B7i5QBRqn/FszxQNlq+JWUIRTAZhaZtAB2Bm+dwuWsvZIJ1elpmM7YzKGFCyjLC0qy8Urk7r+w57npKYaKzld+SfKgZwdc39+6I6uBQv8SMglYxzK2M+sE7ydGRFD20r8MhPrwWWigmelrJslXN+AUQoYGCu1U+frwYMZAf2+xXjjMaWa0DOx2dCG84HJpBWlADrc+hrbqUglQHRCvR9HMAoihQTYaKlbgGE6bsYCym6p3IexGXiIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1z+hYhGKIqUd7jVgOzo8Uce+rUMPPH/Ex2wLJx3MIKU=;
 b=suRepmq6El857Ng5iHlFdNbaZUDO3/sqUQNxo6QSQPJ/d4DjtZ8QVty/SwYSlZfrv72mNDA/FlYtyMLA8fV3Pd03uvq3Hw82j1dwGzy/6Zm9k1jJnyQ1dbZu1HVG4NmajevjafG/zUgvY+dLnxno9nwZ3mkSg/VdcliwdzGHIO/LWB7+UY5uCfwGDxSVJGEfalewnO5E1JrbR8CxZjng+pV77FUmns39P3+ZW9kbrpdlX/5Bek8zEneFKT1ebTviqSXGUcUYNRpxHy/urnDZY36mKYVqwvJtvcm5kNtRAXgb+FGIDgM5lx1rcWxzj031n4xR1V3FYcRx/bD8oeesIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by IA1PR12MB6259.namprd12.prod.outlook.com (2603:10b6:208:3e5::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Mon, 2 Mar
 2026 11:43:15 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.015; Mon, 2 Mar 2026
 11:43:15 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Mon, 02 Mar 2026 20:42:32 +0900
Subject: [PATCH v4 8/9] gpu: nova-core: gsp: support large RPCs via
 continuation record
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260302-cmdq-continuation-v4-8-c011f15aad58@nvidia.com>
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
X-ClientProxiedBy: TYWPR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|IA1PR12MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 919bd5f4-f012-4cd7-d3a0-08de7850e403
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: SlqdlbXEgYBV5ITYRmtIVBXGyulB9XSHBArEbydZ0cjz9zSNaJictTtpgQEw5Tyg+hI6bKRQguSLwLdmq7SnWDL3e2XXtW2jvM7QxWpOOi1IGt3pdhwckm1/apSriT9nyX4V7AYJIXtjULs6XExlZkrAkRS4j+XE2ui8F2Iw9k2NjH8VC3nSDBpWMEXavsHTO4hpJemW/LviXWCtw/urGFF652In8ubWBVQh/9aSdpB62gTNlExotg8zbV96ecYPzEGL+xX6yf9lbv5a7cpVf+FebGGdNm1lsb8/pefmRzAOzfiIB+RcvlpbOJ5EWh7W1yKYcxwexLES66rjdI1oY7kR9P1IlvdYuWp16BBXifIl9y9Y7tPxV0chKdCopmxd3qBW/Fro2xA+uV57HLN/SYq/R8WL7ssM4hZg54AzcnH46mcgKcz4S8OHlHyieUrXrG7/SkLIL7CfSGiwFGTXxms6hR8buhmpZfyc03ar1scrCvQX/YFAC40E61l/oeJnQf6IpUErY44iyXU4sMlQulY7gEbJvUq7tmvITKONMdw+Za9raL556tTbMZ2JyrQbCBX2r1MQoF0fDUbDeTVZfHf5GAtCbDrkq/Cd/CYynk4MV6APQhOx8TtGbrE40HAf/WNP4B+sEfJmQ+RT7V9olSFVVmhKDiTK/4wyALIkPyatWz7DTVGnqRhdfB7fS43dgbPkJP8LEd61g2KyHRIZSi884CMFYdVR0ULrTeD8Lbag2GDJsK5zndpLQ6BhhXT+k6DbT80ubGILDdRHREW7GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VDcvNkxSL1FzbUN1UzMxL3owTlJCWmNrM05mM0N6YklSeHg5T3JZUlMrZVVH?=
 =?utf-8?B?NjhGVGZQOW1kRStwRWdKODFZMWxFTExZVCt3QUhlb3JsYXRFdHdHbG02Rnp1?=
 =?utf-8?B?clY1L2tFUlo4cE11MEVVVisvM1BPNkVFbHZhMmQ3WUQ1cjlZbUVJOVYyd3kw?=
 =?utf-8?B?Qk9WYjlrYzdGUFp2UVBsWmx4akJkTXg5Rmgrb0N4QVcxek93elVEa2xJMG1J?=
 =?utf-8?B?VFZwQmg1bUFRS0tGeHpMTEthQXkxalI3VS9oUmVoTy8wYVhSUFdQWTZUYzB2?=
 =?utf-8?B?d1E5bFc3cGNFa2FvaHM1TWtscU53RG94Q2VBVWUrVk9PdjdkaXQyUi9MVm9F?=
 =?utf-8?B?Z01SaXZpWVhYVGxrRzlIQjRnMDlxZ213T3A1L0NmdFpTWklvZ0hPcG1USVhK?=
 =?utf-8?B?Zi84aWVJS3g5aUFianhMY0pJajlPc1JzNFNKSm80UzlNc3plcEVKMldraFJW?=
 =?utf-8?B?bmxBdG9Oc1JYNW4ydmhUd1d4VlZPSHBPdU0vTE9WUXRLUWRwUStiK1U0aml6?=
 =?utf-8?B?SThGc3hBUlZpNHdpdUs1NVZOSFE0dkFiVStjZWI2b0l3ek9KRkpwTThBdXN1?=
 =?utf-8?B?KzhvOHhvMVo3T0c0b09XWEthTUh3SG43UlJxajlXS2pRWjRnK2FwZ2c3ckhG?=
 =?utf-8?B?Uy9DU29qNzVXODNTVjF4bUFuZUV4OWhYTm9RZ3ptRUVUbVNBNjR4TC8weVRa?=
 =?utf-8?B?QkUwSXgzbVhXTWFQL0F4QkcwSmNtc3Q4VGVMZkpoZTRxT1A5a3F5RzRCb2FH?=
 =?utf-8?B?ODF2L2NIM2FMRXBNeko3Y1VHd0lIT3d1NExIS2VPdUNDenoyUnEvVnVENzF3?=
 =?utf-8?B?eURqWHhGV0RvRm4zamJ0NTYxbWZSa3hJT2MyOUUvcXZwMi9icG9qSnJjRnVz?=
 =?utf-8?B?ZlBtdWtkanM5RTBMb2FRSVhqY3IzdzBiVFoxclJoMlBuM0l4S3pUNWlSYnEx?=
 =?utf-8?B?QVZpdE0xdEZQaWx6WnhMa2xtNEtneEJXVDlTbTR6Qm11cVg1d1BlSmxQZ3Uv?=
 =?utf-8?B?NmdFekJGbmkzbHJWdlRsZVVJZzNGU0lBek9IeFZ6VXpvbWtGMVZtRXRIaFV0?=
 =?utf-8?B?Yko0ckpPajNjTlMwbDBGWWdiMkJWR1RPSzNsUnBXd1JObDU4cit5VkpMbFdJ?=
 =?utf-8?B?OTYzcHZSR05ycFVNaDU0TUFraGZ3K2hBY0FsTWZnUnc1Rk1rSU4xeXBLZGh3?=
 =?utf-8?B?aDBtVGFrUkw0Y0I2KzRjWVFyMkNRMkMwK2M5TW5TVzNLekNtY1R2WGQ0dEkr?=
 =?utf-8?B?ejFZS3pLc2hYTW9nclFiRURuSXpCZ0NSaWg5N3ROMDVmU2ttNjFBNEFnWkxs?=
 =?utf-8?B?cjN6RGNrU0lib1phRkdrWjhNa3NQZ05yaE4wOGs2YWxlSFBxS2Z3Zkg0RXJx?=
 =?utf-8?B?OXE5UjFwRnRUMTkwUVFJVzVDM0xFRFYxTDhmYTJESDZ0a1pQUHVmcHNqNHQ0?=
 =?utf-8?B?ZWV2SkJuT0d0R0U5TzlXNzZKQk1jSjVHSEo5M3NTdlZIUHFZTzdiQjhtbXZW?=
 =?utf-8?B?RXJtOUh6ZUtNTURoejZNZTN3YXhpV3Rpa2d4dTEza0ZCS1NXWnJkRGZUWEZp?=
 =?utf-8?B?a2lWTmJQTzQ5L2trU2IweEpybzZFejBDbllWTE5qQWNXOEhsdHZKQjFjWVJ0?=
 =?utf-8?B?MzRVNXVwMFlxVHpoWnV5Nm1qRTN3ZkxWNFB4cXlVZS95SlZlZUZLcVBLVGRU?=
 =?utf-8?B?c0tOQVJRU1JvZFp1WmNpcnF0eSsyK25EZ1ZBb0doSXdBOTg2elFNazdBQkNG?=
 =?utf-8?B?Nk9BNURUcEJMMURqOWMzTklDY0VCMnhUVElMRE5LbXJ6S1Byc1FBUlEvTTdm?=
 =?utf-8?B?cDg3eGVmQVdhV3gzelZWRkF4aXloaUJSUjVDcWFSaXd1cjdidUlIRi9NeVZi?=
 =?utf-8?B?K0E1cDdZbXY1V1NFRmZnZ1JDNWtuTG1NaDdHZkMxMTJEVWNGWU9DRXBYQit3?=
 =?utf-8?B?MVpKWC9NcFA0czlFeUVrYjdMUk8xM1VwcUZ2STN6eW1aTFYzQ1NGcERKWHFT?=
 =?utf-8?B?T2VuZ1VxQm9wTWZQaVNjcXJSbTJaRU9xek0xTlBnUUJubUtuTmkyOGd3Z0pJ?=
 =?utf-8?B?aDVjbXhCOXVzTmZJaTB5ditSb1N4bS9aNitJN0lpK0hsRVlJeVNPT3VycHM4?=
 =?utf-8?B?SkFqSDVqa2ZpSnFjdnU0Ym5ucXIyNzErZExmOWt4UlFNSzJqWVlqL2NiWjdM?=
 =?utf-8?B?YmRCYWZpNUdiMDMvR29mSnNFQjlwV0VpdTVPZ2dubTJBcE1PVjFoU2VybmJD?=
 =?utf-8?B?eGx2SWZyVDhtcnZDR0FMVDVDR0plSlFzbWJtZGFiak9lWC84MTFidjFVNXJ5?=
 =?utf-8?B?UllMR3ppNlh1M1dKYXBxeDhoN0ZmWjJqbUFxN0ZzdzkrRzZuOFhTdzh1dUEx?=
 =?utf-8?Q?2EwFTKjbOeOQO3sXz8zUDrXDFY9VCRaod5pQRIXPynEDV?=
X-MS-Exchange-AntiSpam-MessageData-1: Brw389xXXYrzgg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 919bd5f4-f012-4cd7-d3a0-08de7850e403
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 11:43:15.3962 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jDlJdEFMWWJBOXqJosS+E1zUtrd4+OYaOkohDgUT4pk7finxR5SvnUCwZDFtBKl3bTjoUtMiPaq5KpbL5v3ADg==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,self.data:url]
X-Rspamd-Queue-Id: 506651D7B9E
X-Rspamd-Action: no action

Splits large RPCs if necessary and sends the remaining parts using
continuation records. RPCs that do not need continuation records
continue to write directly into the command buffer. Ones that do write
into a staging buffer first, so there is one copy.

Continuation record for receive is not necessary to support at the
moment because those replies do not need to be read and are currently
drained by retrying `receive_msg` on ERANGE.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs              |   1 +
 drivers/gpu/nova-core/gsp/cmdq.rs         |  41 +++++++-
 drivers/gpu/nova-core/gsp/continuation.rs | 167 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs           |   4 +
 4 files changed, 210 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 174feaca0a6b..ccf56f1ad246 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -16,6 +16,7 @@
 
 pub(crate) mod cmdq;
 pub(crate) mod commands;
+mod continuation;
 mod fw;
 mod sequencer;
 
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 4a663a5b3437..4caf5917de64 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -28,6 +28,10 @@
 use crate::{
     driver::Bar0,
     gsp::{
+        continuation::{
+            ContinuationRecord,
+            SplitState, //
+        },
         fw::{
             GspMsgElement,
             MsgFunction,
@@ -452,7 +456,7 @@ struct GspMessage<'a> {
 
 /// Computes the total size of the command (including its variable-length payload) without the
 /// [`GspMsgElement`] header.
-fn command_size<M>(command: &M) -> usize
+pub(crate) fn command_size<M>(command: &M) -> usize
 where
     M: CommandToGsp,
 {
@@ -520,7 +524,7 @@ fn notify_gsp(bar: &Bar0) {
             .write(bar);
     }
 
-    /// Sends `command` to the GSP.
+    /// Sends `command` to the GSP, without splitting it.
     ///
     /// # Errors
     ///
@@ -529,7 +533,7 @@ fn notify_gsp(bar: &Bar0) {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
@@ -588,6 +592,37 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         Ok(())
     }
 
+    /// Sends `command` to the GSP.
+    ///
+    /// The command may be split into multiple messages if it is large.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializers are propagated as-is.
+    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp,
+        Error: From<M::InitError>,
+    {
+        match SplitState::new(command)? {
+            SplitState::Single(command) => self.send_single_command(bar, command),
+            SplitState::Split(command, mut continuations) => {
+                self.send_single_command(bar, command)?;
+
+                while let Some(continuation) = continuations.next() {
+                    // Turbofish needed because the compiler cannot infer M here.
+                    self.send_single_command::<ContinuationRecord<'_>>(bar, continuation)?;
+                }
+
+                Ok(())
+            }
+        }
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
diff --git a/drivers/gpu/nova-core/gsp/continuation.rs b/drivers/gpu/nova-core/gsp/continuation.rs
new file mode 100644
index 000000000000..cf6d950a0e3f
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/continuation.rs
@@ -0,0 +1,167 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for splitting large GSP commands across continuation records.
+
+use core::convert::Infallible;
+
+use kernel::prelude::*;
+
+use crate::{
+    gsp::{
+        cmdq::{
+            command_size,
+            CommandToGsp, //
+        },
+        fw::{
+            GspMsgElement,
+            MsgFunction,
+            GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
+        },
+    },
+    sbuffer::SBufferIter,
+};
+
+/// Maximum command size that fits in a single queue element.
+const MAX_CMD_SIZE: usize = GSP_MSG_QUEUE_ELEMENT_SIZE_MAX - size_of::<GspMsgElement>();
+
+/// Acts as an iterator over the continuation records for a split command.
+pub(super) struct ContinuationRecords {
+    payload: KVVec<u8>,
+    offset: usize,
+}
+
+impl ContinuationRecords {
+    /// Creates a new iterator over continuation records for the given payload.
+    fn new(payload: KVVec<u8>) -> Self {
+        Self { payload, offset: 0 }
+    }
+
+    /// Returns the next continuation record, or [`None`] if there are no more.
+    pub(super) fn next(&mut self) -> Option<ContinuationRecord<'_>> {
+        let remaining = self.payload.len() - self.offset;
+
+        if remaining > 0 {
+            let chunk_size = remaining.min(MAX_CMD_SIZE);
+            let record =
+                ContinuationRecord::new(&self.payload[self.offset..(self.offset + chunk_size)]);
+            self.offset += chunk_size;
+            Some(record)
+        } else {
+            None
+        }
+    }
+}
+
+/// The [`ContinuationRecord`] command.
+pub(super) struct ContinuationRecord<'a> {
+    data: &'a [u8],
+}
+
+impl<'a> ContinuationRecord<'a> {
+    /// Creates a new [`ContinuationRecord`] command with the given data.
+    fn new(data: &'a [u8]) -> Self {
+        Self { data }
+    }
+}
+
+impl<'a> CommandToGsp for ContinuationRecord<'a> {
+    const FUNCTION: MsgFunction = MsgFunction::ContinuationRecord;
+    type Command = ();
+    type InitError = Infallible;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        <()>::init_zeroed()
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        self.data.len()
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        dst.write_all(self.data)
+    }
+}
+
+/// Whether a command needs to be split across continuation records or not.
+pub(super) enum SplitState<C: CommandToGsp> {
+    /// A command that fits in a single queue element.
+    Single(C),
+    /// A command split across continuation records.
+    Split(SplitCommand<C>, ContinuationRecords),
+}
+
+impl<C: CommandToGsp> SplitState<C> {
+    /// Maximum variable payload size that fits in the first command alongside the command header.
+    const MAX_FIRST_PAYLOAD: usize = MAX_CMD_SIZE - size_of::<C::Command>();
+
+    /// Creates a new [`SplitState`] for the given command.
+    ///
+    /// If the command is too large, it will be split into a main command and some number of
+    /// continuation records.
+    pub(super) fn new(command: C) -> Result<Self> {
+        let payload_len = command.variable_payload_len();
+
+        if command_size(&command) > MAX_CMD_SIZE {
+            let mut command_payload =
+                KVVec::<u8>::from_elem(0u8, payload_len.min(Self::MAX_FIRST_PAYLOAD), GFP_KERNEL)?;
+            let mut continuation_payload =
+                KVVec::<u8>::from_elem(0u8, payload_len - command_payload.len(), GFP_KERNEL)?;
+            let mut sbuffer = SBufferIter::new_writer([
+                command_payload.as_mut_slice(),
+                continuation_payload.as_mut_slice(),
+            ]);
+
+            command.init_variable_payload(&mut sbuffer)?;
+            if !sbuffer.is_empty() {
+                return Err(EIO);
+            }
+            drop(sbuffer);
+
+            Ok(Self::Split(
+                SplitCommand::new(command, command_payload),
+                ContinuationRecords::new(continuation_payload),
+            ))
+        } else {
+            Ok(Self::Single(command))
+        }
+    }
+}
+
+/// A command that has been truncated to maximum accepted length of the command queue.
+///
+/// The remainder of its payload is expected to be sent using [`ContinuationRecords`].
+pub(super) struct SplitCommand<C: CommandToGsp> {
+    command: C,
+    payload: KVVec<u8>,
+}
+
+impl<C: CommandToGsp> SplitCommand<C> {
+    /// Creates a new [`SplitCommand`] wrapping `command` with the given truncated payload.
+    fn new(command: C, payload: KVVec<u8>) -> Self {
+        Self { command, payload }
+    }
+}
+
+impl<C: CommandToGsp> CommandToGsp for SplitCommand<C> {
+    const FUNCTION: MsgFunction = C::FUNCTION;
+    type Command = C::Command;
+    type InitError = C::InitError;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        self.command.init()
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        self.payload.len()
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        dst.write_all(&self.payload)
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 6005362450cb..25fca1f6db2c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -202,6 +202,7 @@ pub(crate) enum MsgFunction {
     AllocObject = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
     AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
     BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
+    ContinuationRecord = bindings::NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD,
     Free = bindings::NV_VGPU_MSG_FUNCTION_FREE,
     GetGspStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
     GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
@@ -239,6 +240,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => Ok(MsgFunction::AllocObject),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
             bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
+            bindings::NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD => {
+                Ok(MsgFunction::ContinuationRecord)
+            }
             bindings::NV_VGPU_MSG_FUNCTION_FREE => Ok(MsgFunction::Free),
             bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => Ok(MsgFunction::GetGspStaticInfo),
             bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),

-- 
2.53.0

