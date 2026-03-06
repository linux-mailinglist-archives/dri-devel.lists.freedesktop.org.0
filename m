Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HufKvaAqmkMSwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:23:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AF221C654
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 08:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E316C10E3A0;
	Fri,  6 Mar 2026 07:23:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ByCRzgNV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E6910E3B1;
 Fri,  6 Mar 2026 07:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4p9d4fS9xkfLHmn73HkRxwdIz1Vfdq2yhntH1BElFXcbQ62drWBgXArt+SUVsJmCdEkjoo57aOsN1G3NfTi56yEuneoxjnLX2J5wccXpuJDc4syDbYe1WRAiN2oe4eYojjX2URpgeUuCORqhvqpR37Q5MOrYXSVQGUFiXeWuMyKRnmxLFKGprDhdDeSmU6kUAxGil616XzNO5qcFVzn6V8qSfHNQmFoWnRC5QJpvTTJZ/VprFmuwTAViZeF7Usy541oLpfrFeUZHeBP+wKH+Y6c9+mvbcNdWVg812hu9Ksym9thme+9QacFsbGhM5B8Uo/s/i6JaVyAyeyqPE6wbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DedK0I1ZCfVF8ktQPAR1XHEkfPGPkuR/RtE4Thh/05o=;
 b=ZSM7Lz6MfukZQHutpzn+lTWOVje+V4iY5jVak+bG9EHZsmzP39A5Gpx0jJ+27DCXCnvxmZap0DwtDXnUUnOcA1oLCZ0Ybr6QXrGjriEixS+TMiT2fpGVKjac5xfP0BzqrHtk3WxKvsnB6X0nSz14nNVPWnXia59XZ8e2+pPOLcsTckEJVLdvTiKNbCgGX/VsrZ+LYcor768PgpaSFN6pmwOdJSohX+B42LEmWQrYxt5CjXCi3vsSH1/TXhghm9h08CBnDAz6HZPe+y/hrCuwimIv08kbuk1y2AOpUiyqYG4eRyy7mUqtzX4vTBArPK1smvPgXmgh66p92TRo3SX5BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DedK0I1ZCfVF8ktQPAR1XHEkfPGPkuR/RtE4Thh/05o=;
 b=ByCRzgNVsY3vnI5LQDoHNZuhecWgjImH+uMM+QFSCB1uurmB4OWC8ASO7LYTHbORbHvRR9LRvVUQtGkvluPvudH/Fs9iIME5hwFkCarg2PncsdBUa/YWMhaA0Bo0jc1CBU2T8P7TYvJtlYD3l22kpOfigwC4CO4QmVQRzBQ5n6kGifrD3tisZ4hOeEj2bNOPd1I86WKdXaUV9ypme8tzTHTx2FZ5JqsSEbq9KarnehYHRYQTvHDmJbTmpyQXrJStiszNXtEsxgMuWJ8TAwOQfpsy2hettZ2rjKQvQipi585EPJzc+xMFoXok6T3cBeZUuXm0YVBsP/K9PmIiNOXckg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA3PR12MB7951.namprd12.prod.outlook.com (2603:10b6:806:318::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.5; Fri, 6 Mar
 2026 07:22:19 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Fri, 6 Mar 2026
 07:22:19 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 06 Mar 2026 16:22:00 +0900
Subject: [PATCH v6 3/9] rust: add EMSGSIZE error code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-cmdq-continuation-v6-3-cc7b629200ee@nvidia.com>
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
X-ClientProxiedBy: TYWP286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::18) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA3PR12MB7951:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f22a8b-75cb-4408-0dda-08de7b5119cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: VDlkjSLFjB8PBXOv2/7ml47cCxrlHMCSoCp+ACkOAr9ebnA0f66CMW6D/PGhvNT7MaPHKWbFncPJ0h0gK79xTNwhnXD2NVXNdwhNSN07Ye2Yba3v77rruz90/iq37K5eD/YGYlRCh09v0G7EIt1sdbcjgulVBshAGUxAYf5MuPg9d+MfbbPolB+g2HoR8nqugoght5nmwE/ZuWi3AWgj1ICYO3t9snQUstCSrWT/DmJzh8Ff5QQqn/H7YuhVW9i+Wx9IJ4ZVEtsmFjwfIzyjgTvicjSqVcNUE36uCDwiq10aI3qHRkJ+nkzRnVN9VVRlQ1k2hbdSydPPil0f3jpPilEd9C2T5KS1h3ndwGKJg8Z2jbebn7wcLQ54jbFpySIn3+bJm7pMqunyEtRSkRzIZL0HSQg5VbkseVW9wj9bAxImdVa3rL/1r2a9uGq/hTjjvS78yk4EthNbaAR+6LqbdwJ0wcz4cULi8xHB9MfoYPnSnon/cWFlfg2KkIn/I1s1QrScB2ZCSPU4zeZEd7KiWpLbfCTBtcjpl938sEqDpsXa67obqrKobxZa/TLEajlCEYVX99EIE1T42bEk2wZDHVKU32800t5r7opjzOLbUqXKGlZZ4ZMbEIyXRmGjf2C8iVMRKrPjplhu9c1VduR0r26+pOw+NOurJIiJzID+UwZQkGVTIIkHceJgnY2OVOxMcjzpvg4q7HUXeZ6D4GZw2t8NNDGRSnXCHRynIWS8+9j4OIcR1uyqBR0Q8w+vHyAEcUR++Z2XL3j+8FfCIg6lsA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnRnSGgycVVlbytBVlBoWEVRQTJHa1lueXluR0kxSkl4aGhvRzJPcFlZQzBC?=
 =?utf-8?B?M1RKNVdpS0JBYS8zN0N3R1hDY3RMNkNrRjJVUFNmUGJZclFOYXFXS3d6UTdW?=
 =?utf-8?B?bURPUDhWcjdCbmZPd0F5ckh5YzNOV1NYdHdGT0ZRek9VVHVqZExEZmhjc0ht?=
 =?utf-8?B?Tnh0eTdXbVBiRncyejBRUVBlWitGcS82bEZiZ0VuWTErVDhLTjhWeURrWkNF?=
 =?utf-8?B?UlVuNldpR1JiNTdNM0ZteG1JVlVjbkdOV2ZRblNZdC92bWpHSm45RnRBN1l3?=
 =?utf-8?B?MTBVZGJ4RmlBMFlnWXM2YnZKWE92cUgxR1hJejdjSVJIVURTNDFoeWozL01R?=
 =?utf-8?B?WllrWXJrTkswUlpzSnc2TUtNRTlFVEZuVkNvN1hUV3hLSDdWeHNOeXpXV3lN?=
 =?utf-8?B?YytqcGNuTFhxdUNsbk51RHRTSENSazFkakVQbVVLVVFIL1JZdEwwZ2JONWxz?=
 =?utf-8?B?V0lOY0tyZGNINlNibmUwbldCM2RlazJFNWpJN21MTGRCVlZUc3Z4OS9mUzFY?=
 =?utf-8?B?NkNwdk4rZVZYUVNOOGZaMnZ1ZkhKa3JaWFNXc3JsYlNtTzdQY0FrQWdldUIr?=
 =?utf-8?B?M1pJSytRelNkTjAwcG5DL0pWYXYrWHlWNmJJK0F1NDNYM093OWo2RUREeGox?=
 =?utf-8?B?YzQ2SytzdXJlSWhncXNMNXUrUEVSOGVFbVJiaU12L3hJZTdqZW9BVlY5Rk03?=
 =?utf-8?B?MTM3cE53Zno2STUxVkVxRUp3cE50R2RRa3h4TlJkVWtoWFFlemNTcW12bG8y?=
 =?utf-8?B?NHJCTllUbXFWVWppeTJROTkzRmdQR1NCVmgzSFZjY25LczNna1kzMzlNWXpN?=
 =?utf-8?B?VVQrM1JJa1Jta21IRmNCbENpVlE3Mk5OUk8yTkVZMVpUUzdKV2pQMFpQMlNC?=
 =?utf-8?B?ZEN5cmpYcU41QWM5STVFSktKUG9rR2VseVZ0a09mdE1oeDM3TnFMMlNROCs2?=
 =?utf-8?B?TnBha1dLZWlSR29RQW9aR255ajM5Mk5ITjJwaDRMQVRNdzI0SCtYU1gydW1M?=
 =?utf-8?B?RlNMV3NEcWViL0dtUnNoWkpjYmsxaDdxb011L2FCa05hTDZCb1pCYkszM0k4?=
 =?utf-8?B?Skk3bnB0Qkc1dnlWQXpEWTdDa2U4RldJTzlGM0YyTmc2bisxTnI2c1ZjUzBz?=
 =?utf-8?B?Zjl1MDhwcm9PTnJvUEZrZkxHbmpvbWhvUEVIbHVoUVpHL2ZLK1gyQmthb0w4?=
 =?utf-8?B?V1N2QkxnS2pmbHR4SzhreVNuZ2c4c2ZCS2V2NytyNHBtb0ZIMGFVYk00L2lL?=
 =?utf-8?B?VzRHM2ZqOVVvYU9DRG8vMS9VRTlHV00wdDdFYVpFcWlXZXRjOEZuZXBseUty?=
 =?utf-8?B?WE42R1ByTGN4QnZtNVVuZnpETmRBcXRoRllVWlEvZ1JCRTd6VGo3L3BIaDh1?=
 =?utf-8?B?TnltSFhBekpCMzhNdmlUWHZWWFZSZzBWRW43WTJwdGhqUWpPQkpka2JWRXJv?=
 =?utf-8?B?QklXSmhyMkkvY0dPSXZRV1pnM1owZkJURkV5cm83ck1SVlFQdFJQTFJob0cx?=
 =?utf-8?B?RnVVOEorZGxFT0ZCQkZ5UjlIQ2MrNWVCREgxd2Q1U0pPMFVMWDJvNXgzeFlq?=
 =?utf-8?B?TlVFTGxkTWt0ckxpTFVYdkNKeFBoYUsxc0RMQ2lJQWtSYzZtNitHMlpreEpY?=
 =?utf-8?B?YWpLZTF3VEsxTEtFQ3FudlpMbVY2VlVMK1lOY1k1cWs2RHBKbHRZbklqbFgv?=
 =?utf-8?B?Ylo5OVBYVTJxL2ZoZk5jdk1nd2NldEk1L21mNHdrM1BSRHgvZkJFakUyUmg0?=
 =?utf-8?B?NlNWdGhwanhYaC9lQVcxRjRJbG9pRWl5YjZiaWczZC9sOWllNFJ5U1hOVzVD?=
 =?utf-8?B?R1pTb1VsQWlGcjkwVnJRYjJqbEdvQWwvYVpCTlBhOGJVd3hsNnc1NFZFZFBL?=
 =?utf-8?B?eDVkL283TWowbzgyMGtBajV6WTZpL1ZPNU1BU1VNUFR4VXg2aDNCUkJ4V0pi?=
 =?utf-8?B?WDFRTHRwWndOYkNwYlVWSXRaR3dNYXhHODVVQ2ZlM0t6eDBidEdRUXhRcTVZ?=
 =?utf-8?B?MytDVmI0RWpIWjV4OG12THI5cHJ5eXlCbGR5TU5hVytoVkovdkRIRnVLVE9D?=
 =?utf-8?B?Z0xDaEk0WnBnSFF3OUc2Nk05bm5hTUs3SXBMVnZRaWRhVFdqamJwMVE2MTls?=
 =?utf-8?B?YWdVUE1QYy9RaHJuRE15bEVIM2VUZitQMVp3dHlDbUVRa0xCVDJMTk1RZFUr?=
 =?utf-8?B?T1hXdDJNRXFQMHVwQmIvNnIxZ0lGOEdrTFU4em5WMWVJa0tPTmFOT1RwVDdM?=
 =?utf-8?B?TUhqVXBnTlVRZ3p5cVpYZ0tXVEM0SWdvVGc3NndRblAwMUt4Q21WaXBDZ1o3?=
 =?utf-8?B?MUU0RFMzc3E5OXRXQ25oTXErMUZIeVpRZnp4ZkhISkpydW5sRS9QMGFieUxK?=
 =?utf-8?Q?JAxZOzHjux+BAhKcE+qIYq9obQI3ySsv0UoR6a8UhqaX3?=
X-MS-Exchange-AntiSpam-MessageData-1: Ige52ysbl4aKiw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f22a8b-75cb-4408-0dda-08de7b5119cd
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 07:22:18.9477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H14Gc1ADlDIXoNGeFcoovtZIE0zA634taikxqc30CpScLKN4q0bjeX7plO61aGHsOJhQg+RonwN7mKgKifP/cA==
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
X-Rspamd-Queue-Id: 09AF221C654
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,garyguo.net:email]
X-Rspamd-Action: no action

Add the EMSGSIZE error code, which indicates that a message is too
long.

Tested-by: Zhi Wang <zhiw@nvidia.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
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

