Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CQZL9VdqmkhQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9D021B92D
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 05:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D2E10E384;
	Fri,  6 Mar 2026 04:53:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mtZRd1L+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010070.outbound.protection.outlook.com [52.101.61.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4131C10E384;
 Fri,  6 Mar 2026 04:53:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fENJR9QwqN6uxWECdb+JBvhy7AMEAixTQ2JC4N/blaUtlCE1nMGD749S2VdFwOYGdd43blz75wo118aQL7aXne2fqP888BVV4pFZKZ/H+x3a/ddUO5uuION3UVC7Kr3XP7pqqRPGucDJuZBKSxNynjsBYX4Hv27JeldaQRKoD9OTEyMdRY9dtIUvuJ1BV8ZesA1fesC4RBXiHnIX//whctn/c+vz8F8eacRHghlseYfU5kbhwUDApTL9h+fssR+Ea9UMAck9ELv6PJeB+DmdR3PMGCn5boBr/OytA4KZsHxRyxO41jBviDLd/bPjwa1X6kmOpfSmi4Nkxkag2NK1tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DLFJ4sDNJvlRBmDnNPHN7HlEI2AJTdXpa6A6FJ+7xoQ=;
 b=ps41vJAXGIY3h6qw3v8aTJwXSqN85J8XGdyLXU7uYN+SOgg4bV3rCt4oVCw103LRUdR1fWOqtPDyzTM4YrGbU4HttgxIC4U7oQSlmaQHaKAbgIYJ68QrU/UZdzbn5JNVpvXhsSzaFtTWRyOmkuu6e4iGBPIIEW89ETbWIfgNOE9tleZ+b32MOOZKgaIRdUtSF+8x9fxCYDJELuYVPB4+fefeFa1uQ6ojV56lImeI0BQOvEVGShr6rhqg0/44r3nrZSxhUMu0rz+fyYbG8JDjVUImBh7TGgNoV77pbuNbu1f6W2cy0zG0iV3qqk2DIpo4T5oNo5St72LSHvExExVPOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DLFJ4sDNJvlRBmDnNPHN7HlEI2AJTdXpa6A6FJ+7xoQ=;
 b=mtZRd1L+vZFWsj7zc+JXC6YEPdrqv4WKT0vxn3vGgp9ytMKvttFGderrrCZPcr8DxS7ujFveSMuAbjOIiLaCkff5kLUiFRwqhQw5MIQfftOG0Hnb5X4yAO90ALSrB6x0v6w1ZlTaIqfpJbXcSwWOTlFCu5Wu/u4vCWGpTUit769hNoJ+75PT8zCz2zpamgOeoKCn2tYezLtMFbjvWXlZHO6+6PaVJxNmtMio2kDLmaSgSBUZZLdirbpZ3byb3SC5e1HhSIiBdIhtyX3xJLScaHsFWe7QgeYrrwP8tzXBTvb63Yavm0oxDcKthV6oeVTRXqJG7tnsU6R7Qfm7iGAnzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7554.namprd12.prod.outlook.com (2603:10b6:208:43e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 04:53:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9700.003; Fri, 6 Mar 2026
 04:53:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 06 Mar 2026 13:52:49 +0900
Subject: [PATCH v11 12/12] gpu: nova-core: use the Generic Bootloader to
 boot FWSEC on Turing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-turing_prep-v11-12-8f0042c5d026@nvidia.com>
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
X-ClientProxiedBy: TY4PR01CA0035.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::17) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7554:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d031b12-61cd-4fad-8d9d-08de7b3c5222
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|10070799003|366016;
X-Microsoft-Antispam-Message-Info: tuKea8Ym6IWXt13JPozNdjwnzGQ/YuHAUMJwJMf1ZsB8ZXZ9PNeGg0D9bNi5XAv0D4ewAjUH7P0vGU/++nF3KUKpZne6+3kqqA2B2wWkXSaI3gPBZLMlF/WqgBJffkDLNSXlRpfs85ga1ZP5ciKtTwk4jiP3gOfJh6l5iI1DO5WPynBI2VAORNrtHGtOxCKBDKkDU05v+7nZENX+u2AsFvegx3+z475MkSw3Jo4G0R1GtufeoegxqnHfZBPKhphMxSxuxhSVnZTLzbZCqDRVgjhQ8wjt9rZEp0/9+3vUbwR1DbzyEOvJjApDxox9Mprlkw1+Ytu0XL3dljadowea7X1M5h8xIfh4LHq4AD0Z+tf3D/Kc1TfQ6NUS+jlHtz+ZoEosbP27ascUqf37Edn8N9qVcKu/2xa4/GB/J64Y+YpoWB/iCL1ZChdJCcI3PfC1O1U2hI4WhaythgM+lrlJctfdDqWWy/hzU6gsP9B7LGzrQaH2y8YJRJgVBrjdI8h0KH17hAlOOmO3etnpJWJQICK0ApG580NMg6wJ/W8HYoZF2ArASkUr4hMQeCoswae5eJxJnFrX3NpAhretkX2J6TrMbnJAN2kMVLfk1JOXj9mUSbrne27YClCQK/9ipGj5KzpUvJDjN3oqxXxAV9IKTBX6xdlMV+/wOKRS858SuJ6tdZdnYvpQR3rsKdWb+9SY3FLry9RXEvzZ6XPs2kqKFDWYJZhXyhikcWxnCgc0eJk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2pHMXBLenpwSGw4eXBFYzkyUTBWejhCYm5zUllpbVg3Q01yRzBoNDluK2Fl?=
 =?utf-8?B?RzBYQWgyYlBycEpwamhGR0owQURSSFI1V2ZjWG04TGNpOEdRbUIzTWVtQUdh?=
 =?utf-8?B?ZGdxRWJhTGJIUjhDdDBBM0dWQ2p2Yndmb2thUFpUUUFvSFVlYyt4bEtKdHdy?=
 =?utf-8?B?NHRuNCtKcjZkRTUyZjV4aWJGL3U0K1pJTlE3QVpTYjNtY0IyT2ZrM3RQZU9z?=
 =?utf-8?B?bDUrenl0Mnc2U21WOHo0ZGlrSGtlSXlKdVVLSzM4VkdWVmVrNndNNTZHUUZI?=
 =?utf-8?B?SEEyRXl1VEFreFRyMktrVGY5dm1ZeDVWeVVCQ2NWc25NTlNLNlp4ZVpWZjJi?=
 =?utf-8?B?U2lpMjJWL2tHNFNtejE0NUZoamp0MXlYY05ZR0t3N1VmZjZidTl5L3VMclhJ?=
 =?utf-8?B?bzFQbUZHTmhQYzJUYTNyVEZCZmcyZVUrMUVwQWMzSTZjLzhDL1Jxcys2VU1h?=
 =?utf-8?B?aDdaTGJXNkRKSkdCaU0rbmd2S0lEL1dTNGhoQ2luQ0ErY0s1aDNiVW1aV2Mr?=
 =?utf-8?B?R2JUUDZjNkNxK3FjWEkyK0Uwd0d2VjRGV0l5cWwwSzdCb3pYYmlsSmFiTFVi?=
 =?utf-8?B?bUR4eFBzQnVUaHZJeTN3OERBb2pnTEV6L2hKRjlUUXpoUFJqT29uaytzZVBj?=
 =?utf-8?B?cnp4dk5kOGorTTRvVTRldXpSTlpwVHU4dStjNHVES2ZGTFZ1NzB6NERrU2VB?=
 =?utf-8?B?YTBEZHpCOEM2dWFoOUFFeDlUSS9UOXRpTTMwQWhTVUIyMnltZFQ2azRXYjFj?=
 =?utf-8?B?S0VneVRaWitILy8vZHNqdEVJTzA3M21wSVdrRzNibDZkLzZhN3Juc1R2SzhZ?=
 =?utf-8?B?MzdabWtjOEw2M1VJRG1uRmhCQkU0UlBFalhVeis4aGh0ckxUemxrZXphcklH?=
 =?utf-8?B?Qzc3Y1p1V0hJYk1XeDdIZ0NhWElVOTd4MEJrczZEUGdtc25LOU9KT2RVbWpM?=
 =?utf-8?B?OU1MMEd4MWc4SFYxZWQ0TUJvRjQ5SEI1ZzVBYzEzSVdtQllTb2pEaDJqR2tq?=
 =?utf-8?B?clN1TWZhVjhTOTRGTWJyZ21TV2l6M3ZwQVZVVFRMVkkwNGZ5RmtIdjRwemJI?=
 =?utf-8?B?ZlFVOGwrN0luQmgyMnR1ZkZ2ME1TeGNsai8wa1JjdjNXTVlPU0dBQ3lMam9B?=
 =?utf-8?B?RXY0QzFEcUExTFZUeXFlUXZwRVlnaW83ODlVT3drNkQ3cXB5aVVzSk1TYkVE?=
 =?utf-8?B?N1g3TExBQmVhTytQMFdrSDFRR0dXejFlbmRGZ0s1TEVyRzZud1JDWVNhSjdj?=
 =?utf-8?B?RGZBT0xGQjdvVnhKeUs3dEl6YlhvZmpqUHNmV1BXSlMxV1FPVEZhVXZ3aDRM?=
 =?utf-8?B?WGFaSFMrYUN6KzFnK3BST2wwc3p6NTd6aGdqWHhqSWsyb2hrd3NDRnhPc1dF?=
 =?utf-8?B?SFUwZUZYMmRjTExQNFRuT01FdzdJTmNrYmtQdnlHRGxsbFFKZ2FTakxiNzZK?=
 =?utf-8?B?Q0gzRlBGajJjMkVSK3FUbGVCWVBQUWlQclRyMjdxWmNtWTlaSENoWWswYXJk?=
 =?utf-8?B?NEVPdTlRZmFhWDZSUFRYZys3ZnFyblhia3ZmUlMweTlqNFMwTlAwLzhUMEZN?=
 =?utf-8?B?WHpkWFhWcGh1VjNJY0FpUWsxdVdRR25yNUp0dEwwQ1pYYWtrQ1drQXljZEZR?=
 =?utf-8?B?WEtzc01hSW0zTnVJN1haRWlhOURsMit5Nk9FL1R0emRZQmNxUkU0UUJkcnh1?=
 =?utf-8?B?bjJvRk0xdzlaK093a1Z0SDcyM2VURkpmK2hWUHlpM05uVmF6ZDU5N05jYm92?=
 =?utf-8?B?OUp3Vy82Q3UwbkpnNEVPVlBqbWNML0JhRDViK1lLdHNYNDh6dkg4T3pMRVdQ?=
 =?utf-8?B?VXErbDgva0tpUnJCcVlJNktCekZmV0dkVE9qV0lBSjFBK3RXendkREpqZGRt?=
 =?utf-8?B?SXJSeE5BZThjNXpTbEdQMHNWK2ZoaWp6MFVOL0owV2tmelNUYnVNZWVxUFZy?=
 =?utf-8?B?cHhESGQ2Zm5YM01rbVNDRllOSDM4STR4Wi82aWNvQVloWmtkak42M05DL0Q5?=
 =?utf-8?B?SURYTEdxb3BHeEtCcGJBdXpmcFdpVk9sL3RFRzFTZkNTcVV4ZjBpdkJjdDcv?=
 =?utf-8?B?S1g3UGZCR08wUlFEVTNEYmxLcVZ5b0lKY1Fsa2Mxb3lFZkFrTmxoWmp0bi9p?=
 =?utf-8?B?bGhLbWphNFI1Y1hqY2FMOG5CbWVMQXluQTRIY25uRWZQRDhYazJHUGlWaERZ?=
 =?utf-8?B?V0lJRkRWYzAvcEgrcThYbGVBSGZFSk9PTXhxaEFrTmRmOTZhTmFaVU9JNEI4?=
 =?utf-8?B?eGp0ZjMza2dUQ0p1ZTVmODU2NTBuTTNPQzRJSGJTaTh1aGEycS80c1V0dVVz?=
 =?utf-8?B?Y1V2REgzSnBMcjV1MXgzRjdJSmhYWlRpUE1HNVJPR2lSYlFxZ01YaVRJTUla?=
 =?utf-8?Q?gxXo3PiCkXv0oP8EWGwKzHt/Y0NrOoia58ZhS238faCY8?=
X-MS-Exchange-AntiSpam-MessageData-1: r7yFamvKYZpKtg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d031b12-61cd-4fad-8d9d-08de7b3c5222
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 04:53:34.5825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mmb1fiwk1/GhgM97HMs+TzEREAichgJxNJDS2VgRfYg4A95qs97s2I6axh8qJDUCuE0ii2HDf08KDK5DMTKIog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7554
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
X-Rspamd-Queue-Id: 6E9D021B92D
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Timur Tabi <ttabi@nvidia.com>

On Turing and GA100, a new firmware image called the Generic Bootloader
(gen_bootloader) must be used to load FWSEC into Falcon memory.  The
driver loads the generic bootloader into Falcon IMEM, passes a
descriptor that points to FWSEC using DMEM, and then boots the generic
bootloader.  The bootloader will then load FWSEC into IMEM and boot it.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec.rs            |   6 +
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 348 +++++++++++++++++++++
 drivers/gpu/nova-core/gsp/boot.rs                  |  15 +-
 3 files changed, 366 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 87495d1d6cac..fb2bb14b9b33 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -10,6 +10,8 @@
 //! - The command to be run, as this firmware can perform several tasks ;
 //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
 
+pub(crate) mod bootloader;
+
 use core::marker::PhantomData;
 
 use kernel::{
@@ -385,6 +387,10 @@ pub(crate) fn new(
     }
 
     /// Loads the FWSEC firmware into `falcon` and execute it.
+    ///
+    /// This must only be called on chipsets that do not need the FWSEC bootloader (i.e., where
+    /// [`Chipset::needs_fwsec_bootloader()`](crate::gpu::Chipset::needs_fwsec_bootloader) returns
+    /// `false`). On chipsets that do, use [`bootloader::FwsecFirmwareWithBl`] instead.
     pub(crate) fn run(
         &self,
         dev: &Device<device::Bound>,
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
new file mode 100644
index 000000000000..b106bae170ca
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -0,0 +1,348 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Bootloader support for the FWSEC firmware.
+//!
+//! On Turing, the FWSEC firmware is not loaded directly, but is instead loaded through a small
+//! bootloader program that performs the required DMA operations. This bootloader itself needs to
+//! be loaded using PIO.
+
+use kernel::{
+    alloc::KVec,
+    device::{
+        self,
+        Device, //
+    },
+    prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
+};
+
+use crate::{
+    dma::DmaObject,
+    driver::Bar0,
+    falcon::{
+        self,
+        gsp::Gsp,
+        Falcon,
+        FalconBromParams,
+        FalconDmaLoadable,
+        FalconEngine,
+        FalconFbifMemType,
+        FalconFbifTarget,
+        FalconFirmware,
+        FalconPioDmemLoadTarget,
+        FalconPioImemLoadTarget,
+        FalconPioLoadable, //
+    },
+    firmware::{
+        fwsec::FwsecFirmware,
+        request_firmware,
+        BinHdr,
+        FIRMWARE_VERSION, //
+    },
+    gpu::Chipset,
+    num::FromSafeCast,
+    regs,
+};
+
+/// Descriptor used by RM to figure out the requirements of the boot loader.
+///
+/// Most of its fields appear to be legacy and carry incorrect values, so they are left unused.
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct BootloaderDesc {
+    /// Starting tag of bootloader.
+    start_tag: u32,
+    /// DMEM load offset - unused here as we always load at offset `0`.
+    _dmem_load_off: u32,
+    /// Offset of code section in the image. Unused as there is only one section in the bootloader
+    /// binary.
+    _code_off: u32,
+    /// Size of code section in the image.
+    code_size: u32,
+    /// Offset of data section in the image. Unused as we build the data section ourselves.
+    _data_off: u32,
+    /// Size of data section in the image. Unused as we build the data section ourselves.
+    _data_size: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for BootloaderDesc {}
+
+/// Structure used by the boot-loader to load the rest of the code.
+///
+/// This has to be filled by the GPU driver and copied into DMEM at offset
+/// [`BootloaderDesc.dmem_load_off`].
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+struct BootloaderDmemDescV2 {
+    /// Reserved, should always be first element.
+    reserved: [u32; 4],
+    /// 16B signature for secure code, 0s if no secure code.
+    signature: [u32; 4],
+    /// DMA context used by the bootloader while loading code/data.
+    ctx_dma: u32,
+    /// 256B-aligned physical FB address where code is located.
+    code_dma_base: u64,
+    /// Offset from `code_dma_base` where the non-secure code is located.
+    ///
+    /// Also used as destination IMEM offset of non-secure code as the DMA firmware object is
+    /// expected to be a mirror image of its loaded state.
+    ///
+    /// Must be multiple of 256.
+    non_sec_code_off: u32,
+    /// Size of the non-secure code part.
+    non_sec_code_size: u32,
+    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
+    ///
+    /// Also used as destination IMEM offset of secure code as the DMA firmware object is expected
+    /// to be a mirror image of its loaded state.
+    ///
+    /// Must be multiple of 256.
+    sec_code_off: u32,
+    /// Size of the secure code part.
+    sec_code_size: u32,
+    /// Code entry point invoked by the bootloader after code is loaded.
+    code_entry_point: u32,
+    /// 256B-aligned physical FB address where data is located.
+    data_dma_base: u64,
+    /// Size of data block (should be multiple of 256B).
+    data_size: u32,
+    /// Number of arguments to be passed to the target firmware being loaded.
+    argc: u32,
+    /// Arguments to be passed to the target firmware being loaded.
+    argv: u32,
+}
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
+/// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
+/// operation.
+pub(crate) struct FwsecFirmwareWithBl {
+    /// DMA object the bootloader will copy the firmware from.
+    _firmware_dma: DmaObject,
+    /// Code of the bootloader to be loaded into non-secure IMEM.
+    ucode: KVec<u8>,
+    /// Descriptor to be loaded into DMEM for the bootloader to read.
+    dmem_desc: BootloaderDmemDescV2,
+    /// Range-validated start offset of the firmware code in IMEM.
+    imem_dst_start: u16,
+    /// BROM parameters of the loaded firmware.
+    brom_params: FalconBromParams,
+    /// Range-validated `desc.start_tag`.
+    start_tag: u16,
+}
+
+impl FwsecFirmwareWithBl {
+    /// Loads the bootloader firmware for `dev` and `chipset`, and wrap `firmware` so it can be
+    /// loaded using it.
+    pub(crate) fn new(
+        firmware: FwsecFirmware,
+        dev: &Device<device::Bound>,
+        chipset: Chipset,
+    ) -> Result<Self> {
+        let fw = request_firmware(dev, chipset, "gen_bootloader", FIRMWARE_VERSION)?;
+        let hdr = fw
+            .data()
+            .get(0..size_of::<BinHdr>())
+            .and_then(BinHdr::from_bytes_copy)
+            .ok_or(EINVAL)?;
+
+        let desc = {
+            let desc_offset = usize::from_safe_cast(hdr.header_offset);
+
+            fw.data()
+                .get(desc_offset..)
+                .and_then(BootloaderDesc::from_bytes_copy_prefix)
+                .ok_or(EINVAL)?
+                .0
+        };
+
+        let ucode = {
+            let ucode_start = usize::from_safe_cast(hdr.data_offset);
+            let code_size = usize::from_safe_cast(desc.code_size);
+            // Align to falcon block size (256 bytes).
+            let aligned_code_size = code_size
+                .align_up(Alignment::new::<{ falcon::MEM_BLOCK_ALIGNMENT }>())
+                .ok_or(EINVAL)?;
+
+            let mut ucode = KVec::with_capacity(aligned_code_size, GFP_KERNEL)?;
+            ucode.extend_from_slice(
+                fw.data()
+                    .get(ucode_start..ucode_start + code_size)
+                    .ok_or(EINVAL)?,
+                GFP_KERNEL,
+            )?;
+            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
+
+            ucode
+        };
+
+        // `BootloaderDmemDescV2` expects the source to be a mirror image of the destination
+        // and uses the same offset parameter for both.
+        //
+        // Thus, the start of the source object needs to be padded with the difference betwen
+        // the destination and source offsets.
+        //
+        // In practice, this is expected to always be zero but is required for code
+        // correctness.
+        let (align_padding, firmware_dma) = {
+            let align_padding = {
+                let imem_sec = firmware.imem_sec_load_params();
+
+                imem_sec
+                    .dst_start
+                    .checked_sub(imem_sec.src_start)
+                    .map(usize::from_safe_cast)
+                    .ok_or(EOVERFLOW)?
+            };
+
+            let mut firmware_obj = KVVec::new();
+            firmware_obj.extend_with(align_padding, 0u8, GFP_KERNEL)?;
+            firmware_obj.extend_from_slice(firmware.ucode.0.as_slice(), GFP_KERNEL)?;
+
+            (
+                align_padding,
+                DmaObject::from_data(dev, firmware_obj.as_slice())?,
+            )
+        };
+
+        let dmem_desc = {
+            // Bootloader payload is in non-coherent system memory.
+            const FALCON_DMAIDX_PHYS_SYS_NCOH: u32 = 4;
+
+            let imem_sec = firmware.imem_sec_load_params();
+            let imem_ns = firmware.imem_ns_load_params().ok_or(EINVAL)?;
+            let dmem = firmware.dmem_load_params();
+
+            // The bootloader does not have a data destination offset field and copies the data at
+            // the start of DMEM, so it can only be used if the destination offset of the firmware
+            // is 0.
+            if dmem.dst_start != 0 {
+                return Err(EINVAL);
+            }
+
+            BootloaderDmemDescV2 {
+                reserved: [0; 4],
+                signature: [0; 4],
+                ctx_dma: FALCON_DMAIDX_PHYS_SYS_NCOH,
+                code_dma_base: firmware_dma.dma_handle(),
+                // `dst_start` is also valid as the source offset since the firmware DMA object is
+                // a mirror image of the target IMEM layout.
+                non_sec_code_off: imem_ns.dst_start,
+                non_sec_code_size: imem_ns.len,
+                // `dst_start` is also valid as the source offset since the firmware DMA object is
+                // a mirror image of the target IMEM layout.
+                sec_code_off: imem_sec.dst_start,
+                sec_code_size: imem_sec.len,
+                code_entry_point: 0,
+                // Start of data section is the added padding + the DMEM `src_start` field.
+                data_dma_base: firmware_dma
+                    .dma_handle()
+                    .checked_add(u64::from_safe_cast(align_padding))
+                    .and_then(|offset| offset.checked_add(dmem.src_start.into()))
+                    .ok_or(EOVERFLOW)?,
+                data_size: dmem.len,
+                argc: 0,
+                argv: 0,
+            }
+        };
+
+        // The bootloader's code must be loaded in the area right below the first 64K of IMEM.
+        const BOOTLOADER_LOAD_CEILING: usize = sizes::SZ_64K;
+        let imem_dst_start = BOOTLOADER_LOAD_CEILING
+            .checked_sub(ucode.len())
+            .ok_or(EOVERFLOW)?;
+
+        Ok(Self {
+            _firmware_dma: firmware_dma,
+            ucode,
+            dmem_desc,
+            brom_params: firmware.brom_params(),
+            imem_dst_start: u16::try_from(imem_dst_start)?,
+            start_tag: u16::try_from(desc.start_tag)?,
+        })
+    }
+
+    /// Loads the bootloader into `falcon` and execute it.
+    ///
+    /// The bootloader will load the FWSEC firmware and then execute it. This function returns
+    /// after FWSEC has reached completion.
+    pub(crate) fn run(
+        &self,
+        dev: &Device<device::Bound>,
+        falcon: &Falcon<Gsp>,
+        bar: &Bar0,
+    ) -> Result<()> {
+        // Reset falcon, load the firmware, and run it.
+        falcon
+            .reset(bar)
+            .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
+        falcon
+            .pio_load(bar, self)
+            .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
+
+        // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
+        regs::NV_PFALCON_FBIF_TRANSCFG::try_update(
+            bar,
+            &Gsp::ID,
+            usize::from_safe_cast(self.dmem_desc.ctx_dma),
+            |v| {
+                v.set_target(FalconFbifTarget::CoherentSysmem)
+                    .set_mem_type(FalconFbifMemType::Physical)
+            },
+        )?;
+
+        let (mbox0, _) = falcon
+            .boot(bar, Some(0), None)
+            .inspect_err(|e| dev_err!(dev, "Failed to boot FWSEC firmware: {:?}\n", e))?;
+        if mbox0 != 0 {
+            dev_err!(dev, "FWSEC firmware returned error {}\n", mbox0);
+            Err(EIO)
+        } else {
+            Ok(())
+        }
+    }
+}
+
+impl FalconFirmware for FwsecFirmwareWithBl {
+    type Target = Gsp;
+
+    fn brom_params(&self) -> FalconBromParams {
+        self.brom_params.clone()
+    }
+
+    fn boot_addr(&self) -> u32 {
+        // On V2 platforms, the boot address is extracted from the generic bootloader, because the
+        // gbl is what actually copies FWSEC into memory, so that is what needs to be booted.
+        u32::from(self.start_tag) << 8
+    }
+}
+
+impl FalconPioLoadable for FwsecFirmwareWithBl {
+    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        None
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        Some(FalconPioImemLoadTarget {
+            data: self.ucode.as_ref(),
+            dst_start: self.imem_dst_start,
+            secure: false,
+            start_tag: self.start_tag,
+        })
+    }
+
+    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
+        FalconPioDmemLoadTarget {
+            data: self.dmem_desc.as_bytes(),
+            dst_start: 0,
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 78957ed8814f..9a00ddb922ac 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -24,6 +24,7 @@
             BooterKind, //
         },
         fwsec::{
+            bootloader::FwsecFirmwareWithBl,
             FwsecCommand,
             FwsecFirmware, //
         },
@@ -48,6 +49,7 @@ impl super::Gsp {
     /// created the WPR2 region.
     fn run_fwsec_frts(
         dev: &device::Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -63,6 +65,7 @@ fn run_fwsec_frts(
             return Err(EBUSY);
         }
 
+        // FWSEC-FRTS will create the WPR2 region.
         let fwsec_frts = FwsecFirmware::new(
             dev,
             falcon,
@@ -74,8 +77,14 @@ fn run_fwsec_frts(
             },
         )?;
 
-        // Run FWSEC-FRTS to create the WPR2 region.
-        fwsec_frts.run(dev, falcon, bar)?;
+        if chipset.needs_fwsec_bootloader() {
+            let fwsec_frts_bl = FwsecFirmwareWithBl::new(fwsec_frts, dev, chipset)?;
+            // Load and run the bootloader, which will load FWSEC-FRTS and run it.
+            fwsec_frts_bl.run(dev, falcon, bar)?;
+        } else {
+            // Load and run FWSEC-FRTS directly.
+            fwsec_frts.run(dev, falcon, bar)?;
+        }
 
         // SCRATCH_E contains the error code for FWSEC-FRTS.
         let frts_status = regs::NV_PBUS_SW_SCRATCH_0E_FRTS_ERR::read(bar).frts_err_code();
@@ -144,7 +153,7 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
 
         let booter_loader = BooterFirmware::new(
             dev,

-- 
2.53.0

