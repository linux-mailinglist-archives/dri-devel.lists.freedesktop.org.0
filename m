Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNrBGlGdp2naigAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:47:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5BD1FA029
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 03:47:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 881DC10E932;
	Wed,  4 Mar 2026 02:47:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lIxvICVF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010006.outbound.protection.outlook.com [52.101.56.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D52E10E947;
 Wed,  4 Mar 2026 02:47:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fr04NvW1asJ8WDWCvyTVkMO70Cpmhx5JSoCPCx5K44sN+Mv6fAGfLFoPHXjZImY0dzmudhatzuKMFfDegfDDTBgGrruMrwhQDvt8jqFeIFY3cKkxqjBXSziB+xhtTeebm52V7LXZlZBQTtPucOScN8Ldpz+qSyQ+FQ0Eds4aYaExA8l1nCHZH4oeVUS1jC9IkSixs69YlCBov7X4V0x9CodnNMacfTVzBGl/bd5aAwpiCtr0d5cOUrWc7okAp0jOWvQeLdYnI1OS9pX+H1nyu1yScpglfuzjKA8t9THSBXUFvRFFtFNyZ70AzrySPPRxuezuPMs6VSR6CoUwNvU1hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2vk1UC7Hb7lUmDaId0vcTikFvAHO2h2yM9wjz/o38g=;
 b=uF2/AWgTkeFWQDHSILr8VDiRydkgzTEwYQEM+86K1/Pybyynl2/80Ssfd+XAWLMkp9/L+bWOmFD1HrNQKZbM9il2w1/Tq+SC+y94HEN0GVQ6JXrcqLoi+ce+zeBdbRCzXYJAZisQK0ARAjQ/RzUu5jshcbIblYO/hk4B58Ksnf0HG5EKUuMuGIpxjKAgeQWeD9wy1rIIXvzzmQJ97h1vLRL5etmH7lTLd2KCZO7c+tWkeR3dKoWBFaXbgcWpJ/giGcKBaiXeWRGg23dy6twt94DiHMHFRk2MYRoNwgsUIb7iceC6Piee+Gy+qq7WJdInlzHW0PVQE6fNRiJ/9egTdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o2vk1UC7Hb7lUmDaId0vcTikFvAHO2h2yM9wjz/o38g=;
 b=lIxvICVFrptkynjNCidiSz+sIhSGsAJxzJvrXGs/RH0JcSwXlJG5zY9PbPWF9LlhQVqO7a36EgRRO4g+OHz4f+jN29E099LESAwPRg4clpMhTlplYZtDAD2ymYJYQ7bZu6j3yIq93qwREA+/7DC0PetX3TS6eFzNldF1x9Gvwrd7OjbE0LOZ6znflgf+tLYklLGOAtxJzgP1JH9wBVtikNWp+nTyz9zNvQikqxVAdEzoL0KforhqA+5gRM2dZB4eluJqq2DSV2KwCXpvvMDfJ36o2eCbFyRIIdF4vQegJg+XqbwvTEgG+/GcqYhMNxEtwHekugPZ27GgjJihPwi37w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH1PR12MB9574.namprd12.prod.outlook.com (2603:10b6:610:2ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Wed, 4 Mar
 2026 02:47:33 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 02:47:33 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Wed, 04 Mar 2026 11:46:40 +0900
Subject: [PATCH v3 5/5] gpu: nova-core: gsp: add mutex locking to Cmdq
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-cmdq-locking-v3-5-a6314b708850@nvidia.com>
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Benno Lossin <lossin@kernel.org>, 
 Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0097.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH1PR12MB9574:EE_
X-MS-Office365-Filtering-Correlation-Id: 4287b0d9-9170-4970-a3b9-08de79986298
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|376014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: Kt703F5tgsMdoagVd7T0KFMQQJCR0JwxXJJZ0krccrTj/UdavhxQfunR1mcV1ovRowFNItQTrLv4aClumQfo0HD4w3RHihl27DTpFhyLpp/XIAUhnVCQDRw2wXxfLUL8b2N7Cd5njxP2YeSS8g+jTH69rpFincPePnmo2Yln37Vk+OSkutvvtHYiRqsD2i7sq5WufDkvI5nuVD3fn6YBe/VZcB9Ir42XCjv5iLIE1T0nFxfi43zw/FmHP6toMGRfg4mpvaVCwl3CzXXeaO8EEhEDUCY1ymEprAq/iRq2+KntFzwgbsAu2lC8+V++GNNjBRnxCt39itL+LvrE5o+JmCAMeHjvwhRRwG5uZ5A+vRnH5cFazDgk1GAig/UqF1wWV5CUyC8qxDOIota31W7xpPvlGsdN+81Uwu+ajr56yVapIu8lRoW7WoYiMfaWAKXDMOB0cklapRpubiMcHFfpPf8vMpljQg5c8PqWn6NC/OtISXeWaPdwYbn5RmV7wOtb4xjAWZw+JT2ZGFzJDCt5xEqBpmfsMgXDu5I7C2Dh930qmPp7PEJoYSUbUCzdw9cfR2WOdbc7Sja7E+bIwi8vgENPvj+l2sC6/dHDNXqen1a9gg0Km4l/S8s6Iynv/NLBcu3u4Km228a3BmI0QcUG+bZyc8UkgBzPJEGzPGbLuhIk1/R/3jez/72BluWhLouPGfoPE+CsIVEj1alkv4ncbbslFVzgiPu9iU6VrzLm9wg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(376014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1psL3gvTE5FenFDYkhWcTZKVzRpc1F2T1ZobHYxZ2d4Q24vRlpQQVkxak9n?=
 =?utf-8?B?TWxwTC9EcW9pNVdVSlRqNmxSQUhKaVhHeTYzZWZPY214UjNGZGxyeStOWHI2?=
 =?utf-8?B?M1lmVjBWWTBBem12SGhBbW8yMmFZN01FeWxWQVFhaHRGN1Z5K3VWaXNqWnpD?=
 =?utf-8?B?L05TNGUrQjNkaGJvK1dKYVlHNUIvVGREbzJiK3B3Vis5TXdXSHV3OGczNVd2?=
 =?utf-8?B?M1Z6cjl1cnpBY0VPZzRxMVYwbm1mbnhxUURXallXeERVcVRiWXhEK2pLRkRD?=
 =?utf-8?B?bTdwMDFZdHUwL1JwdTEvbkEvaEsyTDh1ZnFpL1ladFpnWG1UbTNmRlNhdnJH?=
 =?utf-8?B?a2dlc3pWRW5vaHViMUd5UnFsOTJQTzhsVks2QkpDeDFxL2JyQmZWWFJjaC9w?=
 =?utf-8?B?cHJYQWNOTWlvYkUxMVE3RE5FcmF0Nk5XVXFmRXkvR1FISFZJSDlrTFNNaVpD?=
 =?utf-8?B?YTVWalJiNTBGdVNqbW9yamZqK0wzMGxxMkVjSkplMjRuUndNWFlLV0thbHdh?=
 =?utf-8?B?OE5tU2FKZFh0Ym5iNjNob1Bsakw5dUVseHp5ZTR1NUcwV3lFQWI5NDk1NHNw?=
 =?utf-8?B?VkRNVjN1SEEwT0U3ZVVrcCt3ZlJTRkZLdGpOdW5BbEdrV3F3enhCYXdFVHIx?=
 =?utf-8?B?QkRXaWxXdjdaandGQ2V0WEw1THNSSWxBNkdESHdML1RFK1lEVXZVYVVwMCtK?=
 =?utf-8?B?M1VHS2FtUS9xL1NEcDBrS29Fa3lTRjVHU3pVQ2RkcFBHK05qNVJrNXBtNmp4?=
 =?utf-8?B?NTI3N0sxaG1MRnozM2xkOHZHZWVpd0xTOW5tNEx6ZnE5QmIwbVpZU3IzeEwx?=
 =?utf-8?B?RXlWWm82R0hmd3VvMHpjUkxHS0w4NE9xdnlRaGlBZnQ4V2tLM2RKNHNxY2Jp?=
 =?utf-8?B?VllhakJrYU83eG9iZFZsbEs2ckNxSmFJVStkOUt3am1CVnNFMWlSV0UySGFG?=
 =?utf-8?B?UlErUGpYb1huQWJQV3JiZmJEcGt5bXV6dVFvVFpUdTZud1dkNmZ0Mm1jdmlT?=
 =?utf-8?B?OWswRnFMVklJTStGbHdFLzEzak1Ra05ZamRVQllhZ2h0OWhURGw4Mi83cHZh?=
 =?utf-8?B?aXFQUHkvY2RKcjNxR3doUjJJdWtCYW5tdzVJR2Nldm14b2NKRGViZ0o0YVM5?=
 =?utf-8?B?a25TQlNkTHlTbk0yaVFBVDIvQkNpYm1oU3VtZ1RGd01pN0dGUG5HNWJQLzFs?=
 =?utf-8?B?aHFNcE9sU1FCVFNKdndoZGd4bWhCQ0VqaUg2Yk9YT2x5UUgwOHc1Zm1vREtF?=
 =?utf-8?B?c25hWlQwL1FFUTE1MmJvNG1oZGdaU2NrRGVNOEI1bVFKOEU0TXlMNUtyaEkr?=
 =?utf-8?B?MDRUdHRuUFZWbGZyamp2L2xiM2RDYmZZNDlvVTBySitxZk8valFPNXdYOEZP?=
 =?utf-8?B?d20xS1czVy9ESXlDSHloRHVmVE05RHNsMzdISGtxNEtVaWNjSERrSkFWSUxj?=
 =?utf-8?B?b2E5TDVYTmd3RE1jSXJnUVpQU3doZmhCY1JYVUFteGIybVBKM2VPYnBzd0xF?=
 =?utf-8?B?a0EyTVZXL3QwNTBlRnYxRTk0SnFtZ0pRcmcxK3ZhaGQ5MmlPNjNNS3NrR291?=
 =?utf-8?B?SmtGbFpITFk1eEZ6UWVVMEhMUHlUL1llTmxVclFHOUZtem96c0JrVUx4MFVT?=
 =?utf-8?B?ZUJKaHZUOWE5WlFuckdDYjg3YUxQdzErRnN3aStqc25sS3VFTkFsbVJ5K3VJ?=
 =?utf-8?B?QnNsWE5rRzRMbzBOUVg4UEo0NUkrR2dGekFjb1BDSFkxaTM4WW9RcFk0VC8r?=
 =?utf-8?B?OGd0V2ZiNzgwcERZcUVHVFV3UWZNZ28rUzZydHFNVVBoM052U0lqak5hVzNL?=
 =?utf-8?B?eVN0RTRwS2ErdThCbXRUMlJneFVaL2ZSUS95WUk2SmNqTUh0cmVudzVRRUZU?=
 =?utf-8?B?c2YwODN4ZkFhSU1QUEFBZTJETUg5YURCVnlMdWFBcGtMMVhQdUpaR2s0MzNx?=
 =?utf-8?B?ejliNU1qdi9mT2szNkRscEhmcUNQM3ZvZmFXZWl4TVZDMkRPc0NjczNNN211?=
 =?utf-8?B?QnRqcDNlTVdnb2JjZHlodGF2MDFpVzNvQldLVVdZRVg5Ni83eTZLMllhRi9P?=
 =?utf-8?B?UmxVVmVEcThmempNRmJudzczNDRhQkNUR3dqejgxaFRQUzF1VDBqTk5JTVAx?=
 =?utf-8?B?ajRRejRydFlTVUV2SnlaTzF3WDB6MzhWaHFSYzh4ZWpSc2dNUUV5UEpsMzEz?=
 =?utf-8?B?ei9DQ2tOdXI3aUhGbEdQVUoweWlSdlBKSlgxeEptL1RleE9QcmhRVERjbnZh?=
 =?utf-8?B?ZkxycVMyQ1F0YTJUalRZVEdTenVrSis3TzBZVUxQWGRhaW9veW93dEo4SHh2?=
 =?utf-8?B?ZkFMWDRFaFdKaWcrVElheHJSNFhrOW5NWW5DN3laRGF2Mi9xU3YxVUtLcU16?=
 =?utf-8?Q?MrJ3nXPe1TAu03J0dnHoQjKqi2Tu91kY8SK7CQY2XPXSZ?=
X-MS-Exchange-AntiSpam-MessageData-1: V2b5UbfEHy7XVw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4287b0d9-9170-4970-a3b9-08de79986298
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 02:47:33.0463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Osnpmd8vPYF59g+GU+5IaA/W/nwpYtITDAhtUM8yeVC6ibQZwqi0lIM4ygnxQHksL7u7nrLqyx1Z7M74NA5w7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9574
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
X-Rspamd-Queue-Id: 1A5BD1FA029
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
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Action: no action

Wrap `Cmdq`'s mutable state in a new struct `CmdqInner` and wrap that in
a Mutex. This lets `Cmdq` methods take &self instead of &mut self, which
lets required commands be sent e.g. while unloading the driver.

The mutex is held over both send and receive in `send_command` to make
sure that it doesn't get the reply of some other command that could have
been sent just beforehand.

Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Tested-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs      |   8 +-
 drivers/gpu/nova-core/gsp/cmdq.rs      | 247 +++++++++++++++++++--------------
 drivers/gpu/nova-core/gsp/commands.rs  |   4 +-
 drivers/gpu/nova-core/gsp/sequencer.rs |   2 +-
 4 files changed, 146 insertions(+), 115 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 991eb5957e3d..bc53e667cd9e 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -128,7 +128,7 @@ fn run_fwsec_frts(
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
     pub(crate) fn boot(
-        mut self: Pin<&mut Self>,
+        self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -214,13 +214,13 @@ pub(crate) fn boot(
             dev: pdev.as_ref().into(),
             bar,
         };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        GspSequencer::run(&self.cmdq, seq_params)?;
 
         // Wait until GSP is fully initialized.
-        commands::wait_gsp_init_done(&mut self.cmdq)?;
+        commands::wait_gsp_init_done(&self.cmdq)?;
 
         // Obtain and display basic GPU information.
-        let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
+        let info = commands::get_gsp_info(&self.cmdq, bar)?;
         match info.gpu_name() {
             Ok(name) => dev_info!(pdev, "GPU name: {}\n", name),
             Err(e) => dev_warn!(pdev, "GPU name unavailable: {:?}\n", e),
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index de84a298909f..94cb2aa6568d 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -18,8 +18,12 @@
     },
     dma_write,
     io::poll::read_poll_timeout,
+    new_mutex,
     prelude::*,
-    sync::aref::ARef,
+    sync::{
+        aref::ARef,
+        Mutex, //
+    },
     time::Delta,
     transmute::{
         AsBytes,
@@ -57,8 +61,8 @@
 
 /// Trait implemented by types representing a command to send to the GSP.
 ///
-/// The main purpose of this trait is to provide [`Cmdq::send_command`] with the information it
-/// needs to send a given command.
+/// The main purpose of this trait is to provide [`Cmdq`] with the information it needs to send
+/// a given command.
 ///
 /// [`CommandToGsp::init`] in particular is responsible for initializing the command directly
 /// into the space reserved for it in the command queue buffer.
@@ -471,12 +475,8 @@ struct GspMessage<'a> {
     contents: (&'a [u8], &'a [u8]),
 }
 
-/// GSP command queue.
-///
-/// Provides the ability to send commands and receive messages from the GSP using a shared memory
-/// area.
-#[pin_data]
-pub(crate) struct Cmdq {
+/// Inner mutex protected state of [`Cmdq`].
+struct CmdqInner {
     /// Device this command queue belongs to.
     dev: ARef<device::Device>,
     /// Current command sequence number.
@@ -485,58 +485,10 @@ pub(crate) struct Cmdq {
     gsp_mem: DmaGspMem,
 }
 
-impl Cmdq {
-    /// Offset of the data after the PTEs.
-    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
-
-    /// Offset of command queue ring buffer.
-    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
-        + core::mem::offset_of!(Msgq, msgq)
-        - Self::POST_PTE_OFFSET;
-
-    /// Offset of message queue ring buffer.
-    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
-        + core::mem::offset_of!(Msgq, msgq)
-        - Self::POST_PTE_OFFSET;
-
-    /// Number of page table entries for the GSP shared region.
-    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
-
+impl CmdqInner {
     /// Timeout for waiting for space on the command queue.
     const ALLOCATE_TIMEOUT: Delta = Delta::from_secs(1);
 
-    /// Default timeout for receiving a message from the GSP.
-    pub(super) const RECEIVE_TIMEOUT: Delta = Delta::from_secs(10);
-
-    /// Creates a new command queue for `dev`.
-    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
-        try_pin_init!(Self {
-            gsp_mem: DmaGspMem::new(dev)?,
-            dev: dev.into(),
-            seq: 0,
-        })
-    }
-
-    /// Computes the checksum for the message pointed to by `it`.
-    ///
-    /// A message is made of several parts, so `it` is an iterator over byte slices representing
-    /// these parts.
-    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
-        let sum64 = it
-            .enumerate()
-            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
-            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
-
-        ((sum64 >> 32) as u32) ^ (sum64 as u32)
-    }
-
-    /// Notifies the GSP that we have updated the command queue pointers.
-    fn notify_gsp(bar: &Bar0) {
-        regs::NV_PGSP_QUEUE_HEAD::default()
-            .set_address(0)
-            .write(bar);
-    }
-
     /// Sends `command` to the GSP, without splitting it.
     ///
     /// # Errors
@@ -617,7 +569,7 @@ fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    fn send_command_internal<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         Error: From<M::InitError>,
@@ -637,51 +589,6 @@ fn send_command_internal<M>(&mut self, bar: &Bar0, command: M) -> Result
         }
     }
 
-    /// Sends `command` to the GSP and waits for the reply.
-    ///
-    /// # Errors
-    ///
-    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
-    ///   not received within the timeout.
-    /// - `EIO` if the variable payload requested by the command has not been entirely
-    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
-    ///
-    /// Error codes returned by the command and reply initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result<M::Reply>
-    where
-        M: CommandToGsp,
-        M::Reply: MessageFromGsp,
-        Error: From<M::InitError>,
-        Error: From<<M::Reply as MessageFromGsp>::InitError>,
-    {
-        self.send_command_internal(bar, command)?;
-
-        loop {
-            match self.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
-                Ok(reply) => break Ok(reply),
-                Err(ERANGE) => continue,
-                Err(e) => break Err(e),
-            }
-        }
-    }
-
-    /// Sends `command` to the GSP without waiting for a reply.
-    ///
-    /// # Errors
-    ///
-    /// - `ETIMEDOUT` if space does not become available within the timeout.
-    /// - `EIO` if the variable payload requested by the command has not been entirely
-    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
-    ///
-    /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command_no_wait<M>(&mut self, bar: &Bar0, command: M) -> Result
-    where
-        M: CommandToGsp<Reply = NoReply>,
-        Error: From<M::InitError>,
-    {
-        self.send_command_internal(bar, command)
-    }
-
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
@@ -717,7 +624,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         let (header, slice_1) = GspMsgElement::from_bytes_prefix(slice_1).ok_or(EIO)?;
 
         dev_dbg!(
-            self.dev,
+            &self.dev,
             "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}\n",
             header.sequence(),
             header.function(),
@@ -752,7 +659,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         ])) != 0
         {
             dev_err!(
-                self.dev,
+                &self.dev,
                 "GSP RPC: receive: Call {} - bad checksum\n",
                 header.sequence()
             );
@@ -781,7 +688,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// - `ERANGE` if the message had a recognized but non-matching function code.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
-    pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
+    fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
@@ -817,9 +724,133 @@ pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Resul
 
         result
     }
+}
+
+/// GSP command queue.
+///
+/// Provides the ability to send commands and receive messages from the GSP using a shared memory
+/// area.
+#[pin_data]
+pub(crate) struct Cmdq {
+    /// Inner mutex-protected state.
+    #[pin]
+    inner: Mutex<CmdqInner>,
+}
+
+impl Cmdq {
+    /// Offset of the data after the PTEs.
+    const POST_PTE_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq);
+
+    /// Offset of command queue ring buffer.
+    pub(crate) const CMDQ_OFFSET: usize = core::mem::offset_of!(GspMem, cpuq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Offset of message queue ring buffer.
+    pub(crate) const STATQ_OFFSET: usize = core::mem::offset_of!(GspMem, gspq)
+        + core::mem::offset_of!(Msgq, msgq)
+        - Self::POST_PTE_OFFSET;
+
+    /// Number of page table entries for the GSP shared region.
+    pub(crate) const NUM_PTES: usize = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+
+    /// Default timeout for receiving a message from the GSP.
+    pub(super) const RECEIVE_TIMEOUT: Delta = Delta::from_secs(10);
+
+    /// Creates a new command queue for `dev`.
+    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Error> + '_ {
+        try_pin_init!(Self {
+            inner <- new_mutex!(CmdqInner {
+                dev: dev.into(),
+                gsp_mem: DmaGspMem::new(dev)?,
+                seq: 0,
+            }),
+        })
+    }
+
+    /// Computes the checksum for the message pointed to by `it`.
+    ///
+    /// A message is made of several parts, so `it` is an iterator over byte slices representing
+    /// these parts.
+    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
+        let sum64 = it
+            .enumerate()
+            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
+            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
+
+        ((sum64 >> 32) as u32) ^ (sum64 as u32)
+    }
+
+    /// Notifies the GSP that we have updated the command queue pointers.
+    fn notify_gsp(bar: &Bar0) {
+        regs::NV_PGSP_QUEUE_HEAD::default()
+            .set_address(0)
+            .write(bar);
+    }
+
+    /// Sends `command` to the GSP and waits for the reply.
+    ///
+    /// The mutex is held for the entire send+receive cycle to ensure that no other command can
+    /// be interleaved. Messages with non-matching function codes are silently consumed until the
+    /// expected reply arrives.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available to send the command, or if the reply is
+    ///   not received within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command and reply initializers are propagated as-is.
+    pub(crate) fn send_command<M>(&self, bar: &Bar0, command: M) -> Result<M::Reply>
+    where
+        M: CommandToGsp,
+        M::Reply: MessageFromGsp,
+        Error: From<M::InitError>,
+        Error: From<<M::Reply as MessageFromGsp>::InitError>,
+    {
+        let mut inner = self.inner.lock();
+        inner.send_command(bar, command)?;
+
+        loop {
+            match inner.receive_msg::<M::Reply>(Self::RECEIVE_TIMEOUT) {
+                Ok(reply) => break Ok(reply),
+                Err(ERANGE) => continue,
+                Err(e) => break Err(e),
+            }
+        }
+    }
+
+    /// Sends `command` to the GSP without waiting for a reply.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializers are propagated as-is.
+    pub(crate) fn send_command_no_wait<M>(&self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp<Reply = NoReply>,
+        Error: From<M::InitError>,
+    {
+        self.inner.lock().send_command(bar, command)
+    }
+
+    /// Receive a message from the GSP.
+    ///
+    /// See [`CmdqInner::receive_msg`] for details.
+    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
+    where
+        // This allows all error types, including `Infallible`, to be used for `M::InitError`.
+        Error: From<M::InitError>,
+    {
+        self.inner.lock().receive_msg(timeout)
+    }
 
     /// Returns the DMA handle of the command queue's shared memory region.
     pub(crate) fn dma_handle(&self) -> DmaAddress {
-        self.gsp_mem.0.dma_handle()
+        self.inner.lock().gsp_mem.0.dma_handle()
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 77054c92fcc2..c89c7b57a751 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -165,7 +165,7 @@ fn read(
 }
 
 /// Waits for GSP initialization to complete.
-pub(crate) fn wait_gsp_init_done(cmdq: &mut Cmdq) -> Result {
+pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq) -> Result {
     loop {
         match cmdq.receive_msg::<GspInitDone>(Cmdq::RECEIVE_TIMEOUT) {
             Ok(_) => break Ok(()),
@@ -234,6 +234,6 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 }
 
 /// Send the [`GetGspInfo`] command and awaits for its reply.
-pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
+pub(crate) fn get_gsp_info(cmdq: &Cmdq, bar: &Bar0) -> Result<GetGspStaticInfoReply> {
     cmdq.send_command(bar, GetGspStaticInfo)
 }
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index ce2b3bb05d22..474e4c8021db 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -356,7 +356,7 @@ pub(crate) struct GspSequencerParams<'a> {
 }
 
 impl<'a> GspSequencer<'a> {
-    pub(crate) fn run(cmdq: &mut Cmdq, params: GspSequencerParams<'a>) -> Result {
+    pub(crate) fn run(cmdq: &Cmdq, params: GspSequencerParams<'a>) -> Result {
         let seq_info = loop {
             match cmdq.receive_msg::<GspSequence>(Cmdq::RECEIVE_TIMEOUT) {
                 Ok(seq_info) => break seq_info,

-- 
2.53.0

