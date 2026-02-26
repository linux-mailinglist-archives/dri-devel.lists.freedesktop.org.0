Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJjvEqFeoGlViwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 15:54:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC6E1A8063
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 15:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EA610E974;
	Thu, 26 Feb 2026 14:54:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rLCqjhOi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFC1B10E960;
 Thu, 26 Feb 2026 14:54:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EMFXxjNv4T/fLWlPnDH2XblGjHcHVaywiymHxLJOcAzlLQ0RT1H7ZyNS6BaIzidmIwVsANq2iplZvD/a0P10/Y5vMzPFV7KIrOf7A9oUfCO9a/q8XGxEhTng/oSj7PktpIMZaIpzk78OebewrqR5/wPBlLbVpKpvENzJiXpbqQsdLM/dvqfGDzksprsUWgvDPYE/H7zs9/Lo7VloCwL3dELP5/FlTRiN6s/H7+j7TCheatIOHfi4+xoKT4cCzrW9QBLqK9tM8NUB39W8cS1XYNXmhOTbuSTQudOJCHB1vhLl+g0Wl04FZqzuloDF1tjtJIfkpOjKU1KHLF2hyaLChA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=borvlHPInA96NUX7XQ8bnPxo/6AqXuP8VbhNgdfHfpM=;
 b=qW8nweTiBg3H/mD0+VLG2tr2IpQD2UPlHi4OHCXMqjewlCdqc9NhSgoFM6Qn4BSP+9QSaQXGD0eW1/n5qKA4FWdM7LwptEKoxi7TqujwQqy3sskQFVsSGwfvK8Czr+zaxaBgEGy7zVICJSIwpjluYnBim2kkiXuV/0xFCl954ju/AsQREKKh+OQvy8l8seTQodxwqw4SkYRSYlpk98LlOnk3cTI8FVNv0bDHjbFYXlJpcB/PGkK6eSeTy44eTqJ164Kqr9297eaJyW4VyAy7qi4IKk7ibzEsxlqYKu17hBMMx4rw4XYojexlMWq3sUZTPJ6F3RN9Vfh6qPHC3vbHGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=borvlHPInA96NUX7XQ8bnPxo/6AqXuP8VbhNgdfHfpM=;
 b=rLCqjhOivC+0e+sPqUElrZ785k0nJgEv5MErVHolMXaXNPK3NwTWFF5Ccd/BeXYhUI89VFx9B+l+KGW5EF51AlFQPzlfVL4Z6Y7//bQUKRyBsPekQNzi+RgAoXBVtjC0zjIuRJDPagtWG6pJRIVhJ+WpXzErZhu7k9dx8irCckllQ/ZCd+x25d8mvZw7mjtiPHu8Mk7C/hIbc4bl7Ba9IIyrVdQMlrCtU2RcZHMa5V7IlKoiYbnnbkQqjcP1jL7x/dDaVNBdp2D6alByBmqfdC9G6/EiuUaXnTpPUUWNTLdYBmPrHT+Pk2HWwhohDN1t9K8qwzUMLn/G8XHC/slFWg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by BY5PR12MB4066.namprd12.prod.outlook.com (2603:10b6:a03:207::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.15; Thu, 26 Feb
 2026 14:54:15 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.007; Thu, 26 Feb 2026
 14:54:15 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 26 Feb 2026 23:50:23 +0900
Subject: [PATCH v2 1/4] gpu: nova-core: gsp: fix stale doc comments on
 command queue methods
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-cmdq-locking-v2-1-c7e16a6d5885@nvidia.com>
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
In-Reply-To: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY1PR01CA0184.jpnprd01.prod.outlook.com (2603:1096:403::14)
 To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|BY5PR12MB4066:EE_
X-MS-Office365-Filtering-Correlation-Id: 93702d85-f0bd-4893-ab58-08de7546e93e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|366016|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: 89OEKOtQ2Qv4kXYQq4KEeLfVsz5s+baqw0iS/xERtqoAsHUFdzqCLnlVgZ7/vHFxg4bFiMKwOPW7IWctvwaRhbI0AKHFjHz2HwWtcOs6kK3BAYNCqNoUB6GFPaX6ZpArgC/h/BmmuJ5LhUKunY3KTB+Cpqnl0+ktvcq0jDZe01lfmOaca9ysR7sucH9UkTT1jusXu9yIbZvYP/auZSaAQ2c+1iNRZsG3VuShoEW/tg7YuPjusdgt7DOyQ9jkwV4FrzyyPZFy1LXfoUJWC8zuQ8FDVlNp2BbA9uCbdpkPnbCTk2Asga+CQnMDNKvhYYK/A++rRMx84a9nQoY4aw+M8c7uGaScV0pKnDE5YWdcxkQgekOXVdtu9cOD6KvMMRS4CKt2GQlaOQUyQsg8eiiX3Agy2s/Db5UhpUctp8wrLQznPLzXLcWsWKIR9afKf7qpDma+VHXShs4CJI5x6ESZtHN9Qs4s02B18X3tIIcjl1d6Qh4tpDFquhVQai1s6Ar8umVwJmrwFougErCcoxCGQQFegNHTKt7NxA3SkhKRWsh+n7NZwy5e7xYA1XdC7rsth4OO7EIPaqFdSCnN1lEW3kJpJ1Mj2Ore4nTAQz05aVf5KqISupEv+OBT21YBZxPbcLnx/QtKjhXZdA7tvdE26p8Isur+K3rKxVYBR5MT52FLZaR+YlL4Gn6adCKb6l5qOPVxRVXg1FM5EXZFj3qHxe7CPFgC/scXs/0hYnmDteE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(366016)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2xsVC9SMmZtTWhFR2NUZjNwbmtacEk5bFJDaWZFeWJuNUdneU5IMlhQREth?=
 =?utf-8?B?VkZJTkg3ZU5BdGJrOFJFMk1EN2psbDEwZWp2YkxQRVhic2d1c0hIODRMa1Nr?=
 =?utf-8?B?Y0FWaVVzaXBkUUJDayttS1oyakVWM202TU9vQ1k5cUw1RjE3QTY3b2diWG5U?=
 =?utf-8?B?NkpNSnJORmgraXkvcmkyWjRJdVBWRnRxMTFacDJoRGZ1MW1ablppQnRCeU1a?=
 =?utf-8?B?ZkhraXZscCtuOTRqc1piRmdLWWE0b0V5UE0rMWJ1bFNuak1reGRVVDRZN3Bp?=
 =?utf-8?B?SnR2T0JQemZOdnhpMEZKczR4NGQ5MFhLOUhEVU4relpLaElTWVBBZGFUT3hP?=
 =?utf-8?B?RGRxUGpDdENQM0RlN25tNUtQOE9ZemdJeXlULzJYbVN0VUtocFRPUkxSQjhW?=
 =?utf-8?B?UHIwTm92Q0JuOGpSWVhFNXhSVkppSzVhRitOSmFpM1h5c042TjlyY2hWYnMv?=
 =?utf-8?B?NHhleTEvallOdmRBZURMZWsxR3dZbXVaY3Q0WTJXcm5EUm1tSDFUTzh3em1E?=
 =?utf-8?B?b2V5czhOeG51c1JKY28xQzEveUFNaVNnQXUzemhWNGc0a1ZabUtvZmltZlZq?=
 =?utf-8?B?eituamh6eDFaU3c0b2orQmJsU2l3STBWM2VrbitTNlRnVDByUkNkTndyYW1l?=
 =?utf-8?B?UkZPOTYyQlJEYUFQdWFtSUc4bnFOdGpJaVRreWNINjdXcUtpQWVSNlY3c01R?=
 =?utf-8?B?bGt3UVp0c0VFTWFoRWNxbjlSZFl1cXI4bkpnREhReUpnQ015WlFvOGZlcmoy?=
 =?utf-8?B?YmFmdy8zRG9IY1lXbitkRjdYNFFQNURCY2ZFQkdVbmF4YlVqWWhXMGJPUVJo?=
 =?utf-8?B?bURJN2UzMlFNMUJoSUwvbktlNHp5b1F6RmtKTGFkeTFBRXZDZE1JYnJOMmd2?=
 =?utf-8?B?VW9HcG56NDIyWEE3Q2RzZXhCY00rKzJlV0xkZjBCdDc1MDV6d01hZkxMYnlz?=
 =?utf-8?B?NG9zdmp0UTNid0x3QjlGUEdwNk5WTmkrbVlFaFVGK1hrMlM3aXVWUk5RRG5j?=
 =?utf-8?B?MnFDTUJYMnVEQkg4dEljTGI1cnY0OUZTOGhrRVBvVFZhU0xtL2haaFJoVUkw?=
 =?utf-8?B?MzVEMjN3K1VmclFKVnFDWDRsOEhOVUM3QTVlMEhEM1ZTTFVhTnN1cldrSTB1?=
 =?utf-8?B?SXlpV2R4SXllR1V5RVYxZXFDYjZzSnFLekN4MzUwYnZWWkVTNUVqQWVpM3lN?=
 =?utf-8?B?OEdZRGc2VVZXUDdvaU9WQkoxR1dDSk5kN3pVTllkQ2s3Tm9pK0xaRGtmYVRR?=
 =?utf-8?B?MFAzZkovb3l3em1qWE5GdmdYaFNlSWdoRTB6YTdYTTBJRWlUeHg0enRCb2Z6?=
 =?utf-8?B?c2JHVnFZL3JPcWdtalFwZjJpdDFGVG1CdTFRMW5VMHhEZ292M1VJUGNEZnI1?=
 =?utf-8?B?SXMxRTN5K3hvbmpvTnNHUXdqRW1ZMlkweTkrUTZoWWltWkFkMGdDM1lWVGwy?=
 =?utf-8?B?eFB0bzhJdERSVlVnNjZGYS94ME10R0g5Mnc4U3NNQU9IeVZnVHZ3NDlaQVJx?=
 =?utf-8?B?Q01lb2tPY3pHUENnZVlFaFhXZjJZTVFINU5aV28vVlNYSXNSc0V2YWxPbVVN?=
 =?utf-8?B?YkJXYm9RbkRVSSsvWDkybnRhL0twOTJnK3RmaDN1N3pURkQ1QU5FVndzVTQ3?=
 =?utf-8?B?R2s1Y2NXd2xaQm1FTzRmYU9MK0YzdkZLZSsxekN2RXhidnRiNS9LUklJQU9V?=
 =?utf-8?B?MzBBNU9NUEgrdFdZYUhKUFlFVlF1MW9tVFpsUDdSS2hEbXczcjNxRUNlOGZM?=
 =?utf-8?B?Vm96Sk5wSVNaZWx5bS9sbFN3VzdESWl2U0RJL09xK3FsdlpHcHBiWndscTFE?=
 =?utf-8?B?SWxmMjVTZHdZSE05SHBRUjNRNXRCRHQvOE9aQjVTNDlKMng4QUx1VDJjcWNY?=
 =?utf-8?B?YmVSbXB3OXVmRjdEcmx5R2E5TzRhQldZU2ZVZnR3alFMc0Y3RHpaRlZHYlRs?=
 =?utf-8?B?MEIvWE5ueWtVZ1JBd0tmdVBUejlyM3J1ajJNY3FpSGFGb002SUNrLzU3WTBN?=
 =?utf-8?B?aGFuRUlCZEtqVkdyK0VjWUhiNWI1Ni9pQVR5T2hYaS9uU0NFUFBwd0E1Q05Z?=
 =?utf-8?B?R2lOWW15VHAyc0tqV1hraFozWW9DNkFuQnU4WlpUQ3hJanZhZ0I0SW5lcDFz?=
 =?utf-8?B?dWsrd3dsSUE1OFJBc0N4cjE4bW1wbE14Z1c1R2NXeUR1dWRXZnM1MHZ5TytW?=
 =?utf-8?B?Ty91ck1LSUxkZ1hlbUNPaHBxQUk4eFVXandVN1EzOEk3UFlIdWhScWwzZUVH?=
 =?utf-8?B?eGowRm1GblcwQ3ordDJ4Wm4zTTh0YldQZElOWkNNSjFxOHp2eFdVMFpaUlds?=
 =?utf-8?B?ekZBeklqbWVYZ0U0K3FiQXVvVXVVSG5HaXQ0UkxiaUhkMmxmeUlZcTlCemFu?=
 =?utf-8?Q?NBlPiCjbtZ+qg7qiq4TwOPgUCaUxHX8wCshsbEVotH9HW?=
X-MS-Exchange-AntiSpam-MessageData-1: qAHkandTfBIQPA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93702d85-f0bd-4893-ab58-08de7546e93e
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 14:54:15.5354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ufGt/ZRmmi/kV8nhA+knetTfyw+hgkORXYJ/RL2oEilw7mEz22xVfsDrEOdx4tXX11gcj8z2PWs3YPi/YF3pwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4066
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
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 9CC6E1A8063
X-Rspamd-Action: no action

Fix some inaccuracies / old doc comments.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index d68b93ddf7cc..a3e039117120 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -528,6 +528,7 @@ fn notify_gsp(bar: &Bar0) {
     ///
     /// # Errors
     ///
+    /// - `EMSGSIZE` if the command exceeds the maximum queue element size.
     /// - `ETIMEDOUT` if space does not become available within the timeout.
     /// - `EIO` if the variable payload requested by the command has not been entirely
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
@@ -710,22 +711,20 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
 
     /// Receive a message from the GSP.
     ///
-    /// `init` is a closure tasked with processing the message. It receives a reference to the
-    /// message in the message queue, and a [`SBufferIter`] pointing to its variable-length
-    /// payload, if any.
+    /// The expected message type is specified using the `M` generic parameter. If the pending
+    /// message has a different function code, `ERANGE` is returned and the message is consumed.
     ///
-    /// The expected message is specified using the `M` generic parameter. If the pending message
-    /// is different, `EAGAIN` is returned and the unexpected message is dropped.
-    ///
-    /// This design is by no means final, but it is simple and will let us go through GSP
-    /// initialization.
+    /// The read pointer is always advanced past the message, regardless of whether it matched.
     ///
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if there was some inconsistency (e.g. message shorter than advertised) on the
     ///   message queue.
-    /// - `EINVAL` if the function of the message was unrecognized.
+    /// - `EINVAL` if the function code of the message was not recognized.
+    /// - `ERANGE` if the message had a recognized but non-matching function code.
+    ///
+    /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.

-- 
2.53.0

