Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEbnGHNHpGk0cQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C10FD1D0196
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBA5310E3FE;
	Sun,  1 Mar 2026 14:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ApKMGljU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010065.outbound.protection.outlook.com [52.101.85.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2E310E3DC;
 Sun,  1 Mar 2026 14:04:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cbeiF9LaLQBYUAbi9OcNU43XDJ0sSQselisrjSdqGl3bwDsIJoCho3Ij8uB/UAK18RJGG+AcomsIINh4SA8snHsZkcwkqf73dc5eyxa41pyjMOzG9CWYxhcT7gT14X7vyJQcBISqakJTFV39J/c7YsjCN8WX8FjTbwkW/0Tz/1JepWjX6XlNF4KEsSVZe1OiCj/w2p7JuxV09QQ08+cJaQKjjMwnXzpIGbXhNhJxIyMAhTbSANUSOU032rDBuOb6fBX7AewhL2q8kmQjJET9wNefXpt7ECzg6UxgnTx8HyG1jE2fESgNf/BBNUbVzuVTjWL9Nt8tZx9QoHvobnibzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcI1DYyWJor8M7bTf0EZ1PwbMPr6PQlJuNaACoWqGzA=;
 b=JHzCwhgHuAJpyFybHHypqEM/6uIjhKEE27BthdKoxlfqg2NTcO5l6JoWsIO8n1VA0AbhqcpvSCfvwh8jKvp1sYwBilBrpM3Z69pn+tL+FMhbYOOFMZ1kpBkWPofAph/EQBLp1laJTAtQ/FmnMPQ5qbmeHPTsBSWlx/f3s4gdlp+uJWoq1LB/Kxuj+gLSK7+xkkBZT+VWuQMh4IS5k5yyuet0Y2srgbvqAJ5nqXO+UgqDNeQcaNc8FWITC88l+TJm3rZt0AVWRwnZ0tAStDrepAUFZqghkaqQTv9HxKDWctMYrOqmDX/SN8ga674AIvTn+2/gBErWymqgXzCxDOF58g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcI1DYyWJor8M7bTf0EZ1PwbMPr6PQlJuNaACoWqGzA=;
 b=ApKMGljU9X9FYGUpRCO1YG8I4ITcLvkArjSdtRFZeQwdZR+gYqYct30gbXYlQtWAgKcWWnV0pjyOaM5Ys5cyhXztnzn7S1PhJkeJheClpquCsC04bZVzh32xcJ52XdLGe3Vv/4a2KR/RdCBVT5WW796/LTQp3mcE2Cl2FKWDcTokWDFTb/RErJ7grSg5iNE5g3UcaMAoD0/kmrnUPYg5t9USlmNhKQ2k5ISmO+CTaw0sD4zam8Y/lQ1Iik7uWpasloDarbxplKc+KNpxjtIgp2of+HBUKwAyxFEXDukXU52poTT0jab1+6ll+X2HwHgHUkPCd09EcsuNOrc5+ERjtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 14:04:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 14:04:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Mar 2026 23:03:50 +0900
Subject: [PATCH v10 07/10] gpu: nova-core: add PIO support for loading
 firmware images
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-turing_prep-v10-7-dde5ee437c60@nvidia.com>
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
X-ClientProxiedBy: TY4PR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c58d95a-8b4d-44d8-a769-08de779b7255
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: kc9MP1N8jRzmy/6Oulw141fa+n5NEzFANLldEEvRgk6WeMrOWRzuWR2itjLw86m0Yd5SyqbDvpYnk3WAKVHqTAcXaj8r1kAQAgOUdSoPzELRfuMHYdoxhYz61d3koKYVUPlCc2wSXFTfiM0kJBgUg3mw6Okzv/tQX28QTxfC1B9DM5wAPNKaGU7x1Nh6iJBS2ErB4U2j3sLI5ho3F0R33GBDVirqIJRagqhvw87/ogb8EJeqBHQIVzrjsJoG0TU21aIKwS6VCh+2Xe9jSYQ8HTFjZqEeYWBQWFm+P6yMrF4mNAuV76Em320tufCGnvLWMGq36N0/3qtMXHvd6w7pDmq4g9VEXIs+eUZ5J8VGYM1jN+HmbpgmWXxnr3YNkPvPZtxLflirBOtGG/5CvMbupUz06Q3ydB6zIvnsmE6RnJvxWh6VCQk88CtTh8pioyHt8lvPa+pdQuh76dNnwk/Gt0VRD+FSRASr6KkSBMAtaQUWzDPe1mKWttN6R04WKN9TT3vQ/ySrz9w/lfGYLO5MsxtxKqTUuBiO25dN6/Riw5f8NP6LTzHi+fSiX2f9tCQIxzzFENnvV9t5nLPjMY/yX9XAYXwYAzCyA125NgJhw7BDZjEdOz4RsC/LfbouS0VXLScvAI8S4NQDh+hJGiLzUEyX4gW/mVRnjYWcN0wsUq6swYLnkQfwjOTIjzfdwSmVbFgA/QMIy/2o8WUMiqQbpxDNJ4Sp+vW37q4mwBeRIao=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T09KQk1tZHFVSU5mUG1QN2g0eU5Pa1VSa1VFS0dJVk1GRGpraU9zazdrazFC?=
 =?utf-8?B?Z3dmdmltQjF6RUR6blF6am9qbWgzbnZPdWEydC9xcTJ4Vm9XTm5iL29lY2JD?=
 =?utf-8?B?eGhHOHdNUlBEc0tOTU14ZXhGU2RmbnluUjNOVUVGeGhsUU1xcVhHTE4vODBS?=
 =?utf-8?B?NENTR042a3VMWE4vaEVMekV1UUk0eVMxdGtRZTZOaldhRitsTDhDd2piWS9N?=
 =?utf-8?B?ZFVTV2tNMHVaSTRKcHB4Vy9CMU9Gb0xOdGN1aVBaWEhPRW8wL3lDdlhBK2Jv?=
 =?utf-8?B?YmoyVE5uYXFzc2ZQOCsyVkNUdzNXaFd4VXZIRjBXNU0zSUNWL3JydC9KaE1M?=
 =?utf-8?B?dHRSbGFpWitIb1U5azhOL0g0bnlmZXB1YU5HNUdIRC96bUZGemt4V3dRbzRF?=
 =?utf-8?B?QjBZTFJiZkdzTzMzRmlGOE5DaUFDbUJxMlphT0FoSkJpakJoT1RuWmM5Wks4?=
 =?utf-8?B?cm00Qk95L211N2wrbDJxcDN2N2N1SFhxSy9uZ3llTFMra2hqL0lJUXRlNnFn?=
 =?utf-8?B?TXVBa3J6UGNkQ0ZPeGlqR1RZWjdpUHFuZGlyR2ZsU1MyeHJ5L3FoVVlZK1lE?=
 =?utf-8?B?SVpHY2tSRWJvbjhzNFB0VEVQVWlLNlFqeU5qdHhpSUtwaDNybEJTS0l0S0lm?=
 =?utf-8?B?NHJxeWpjSGJ2U2N2cWJTbk9ZbGkyem9pRmdVUXNQb0ZNZ0svUTNrTWUyWk45?=
 =?utf-8?B?bjgrU01oZEFkWUkwS2E3cjJBNnNQckNha2NqdTB6T2UxWlVJQzZKS0NIRVJm?=
 =?utf-8?B?bEhyNzVUS1ZWYjd3K0hwRFIwaDF2aVRUcUVqNndGZWJQVkZUSFUzNnNOUGph?=
 =?utf-8?B?THMxL2NJWldnS1RqVkMrSTVNK3FuaG8vT216ZWVFcXFzbTdaSTQ4dVBrRkZ6?=
 =?utf-8?B?WXF5aHdMcDZLNEhKdmVQb3UwOUs4VHVqcUNRejNxQXovc1dJWGVibFBEeTM3?=
 =?utf-8?B?UlhiQnZpQy8zNG1ZNEdyekNKOEpiQktCdEdadWtmUnI1cUVrVzdNbHlBMEVw?=
 =?utf-8?B?cXg5Mk9oOUt6clpxdC9FYXY4Z0FQaTlLQVpxUVdUNk1DYUdvSHRSdkFNdWRY?=
 =?utf-8?B?MEZZRjRrMmJqUXNWSTR1emhpV25qWTErenZlSGdsOGN4VGNmUUJqa2lpVndo?=
 =?utf-8?B?Zk1YM0c5Q2ZnS3NGTVcyWE1nWjE2SHgzT3hhOThnUkN0dzlhR3ZFYmhJKzRX?=
 =?utf-8?B?SlNiS2doVXFxcFNLb2ErL3F3RllQekNnRXZiUzRLM0Nxd3BTVXdnYmJhUGtP?=
 =?utf-8?B?RHdGRGpCYUZIS0RuVmMydmx6cVNpS09LU294T2VkbHpLTS91RlFIK3pHUXAv?=
 =?utf-8?B?TFNuOCt2SlNYWlpFMDBzRTNBMHQwMW1MUExYaTBOU2Z6QW0zcnd5bGNJWTRC?=
 =?utf-8?B?MWJZeHZNZWxtMWUrNnNtRHNsRDF3WWljM3J2NVY0WjdwVFhva1Mwd1orSkUw?=
 =?utf-8?B?MGM1RkdaQUtrMnZiYS9HV1IyUzUrQmtuMHdUa3YrY3ZhZmJJdm05eWk5WFIy?=
 =?utf-8?B?TmNOdWlzV3VHUGt2czc3aDVyajMxTlBSSnA2NWtVU0t5cFRNMTdsTEVjTHVK?=
 =?utf-8?B?dVZHV2ZWMjl0UE1ld3VMdjJCcmxZeDd4aGNrbFhpRGZGck5NVHhHaUhhN1N4?=
 =?utf-8?B?OUhXRU1Tc05ybU9lcXVOVzc1UVhacml4WnQwWUl0ZjZDYWkrREVvR0s4WVRl?=
 =?utf-8?B?aHp2ZG1FTkNBSnFCbDFKaFZlczdqWGd5U1hMNXBUM01GMGFBSVlQSElRRzVM?=
 =?utf-8?B?a2JXbHg5QWlTMlUvaVF5U3RIaXBWK1M4TE1JaitIYVNqUmJORDRzVGxCb3Rs?=
 =?utf-8?B?S1d3ZzU5MFdOd01KMkNrOTdod3hXdmpKYWZnR2xFdXlrQzg3Mnp3cnhpbENZ?=
 =?utf-8?B?aWxBWVFDZ2VJRm5QSFYxR0p2NTFBY2hybDNUVjZWOWZGYWNoM2REUkdZM2NN?=
 =?utf-8?B?aVR1QVBjYXNVOG1RVHVldEhsMTczK3g2dEIwK3lBaS8wL0VlS1ZxWU1RVTVP?=
 =?utf-8?B?NCtZUHdGL3I4dndLeGpkeXpUSTh6TVc2bEZ3b1RNY2wxTlBKZjRCOUxVdksw?=
 =?utf-8?B?YlQ0Nng4ZFp3eFVsNTR5RFBpdWlBS3FuMVFBK0JvNEtWdklPTUlxVEw4Q2dV?=
 =?utf-8?B?ODJrS3RQQy9pUjZ6R0FkSklDQXJuVnI4aW9CaHg1b3FuOWdBdFNlU3RPVFhQ?=
 =?utf-8?B?VTFkMVZBWExHZnVnazBucXE4WGViZG4zTVNlRFpjeU9jNVZKcGRuTnNiVjRo?=
 =?utf-8?B?L0liSjQ1dU10d0lGWGtzOFNsak00QnNJaWVWODBOalpoT3VCczhEM2grMlBC?=
 =?utf-8?B?bmpIeDdna0c4MGNoa0laTkRGRG9LT0NLZzdGZ251SU41M1BweDM0ZmxwMlpz?=
 =?utf-8?Q?ZhGXVzAQH3pPrdwxWEy5j0RtDDVtaTvRfjaPlezWqA9Pz?=
X-MS-Exchange-AntiSpam-MessageData-1: zYt2amzn8XAk1A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c58d95a-8b4d-44d8-a769-08de779b7255
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 14:04:25.6298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rOYnhW+WTJ3dDeHZoov7Fug6XZwyyvdLgYsIsPdcaX4nFjeos1blHhcdnZad1aj0+ZMVIT1CbFgzx+t+gSW0sg==
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
X-Rspamd-Queue-Id: C10FD1D0196
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
index 53ee388f88be..7097a206ec3c 100644
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
@@ -652,7 +865,8 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         self.hal.is_riscv_active(bar)
     }
 
-    // Load a firmware image into Falcon memory
+    /// Load a firmware image into Falcon memory, using the preferred method for the current
+    /// chipset.
     pub(crate) fn load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         &self,
         dev: &Device<device::Bound>,
@@ -661,7 +875,7 @@ pub(crate) fn load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
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

