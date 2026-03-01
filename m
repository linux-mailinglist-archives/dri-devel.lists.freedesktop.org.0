Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4J19MXVHpGk8cQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDC71D01A5
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BABE10E3E7;
	Sun,  1 Mar 2026 14:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NUWzWBOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011000.outbound.protection.outlook.com
 [40.93.194.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AE010E2C8;
 Sun,  1 Mar 2026 14:04:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYf41rcVXvlgOdRl9GUV1sEmsCdjeD6L95ZbTVzzmXUffmcwBVy6sz2RgwkMYn5JwvpUYm5H4iQQDa9ly0epPHO7aEyX4KFw1NyDIyvmfxxPUq1JUBIRpzmrqdU0kzEmswbWcScfX0tPBWVAu4ZSuPlVy7pCt45zM1TI/1yHmTEkVpEpkp+b3iX8qHLn1uT+/nq5guTT4ij4BONH0J2oEIo1KjpNaDvDKOqUxI9xqeiNLmwDydnmBc/ym7VzEKo/jH8UpY6PiZa9le0SCOLzF0XZ30DQKMpvYYx2OL+eAY4unSAu9u8fNm/ip9GIFcGh9ymTb38bCMA9awsok7KoEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pkt90Vjva5r/lyTLtWUJ71F1ymOkq45s2ga8Pq+ASd4=;
 b=KW5iNshQnhbgIW8lJPWARiMMfQxrKnInP7DVRUwD6kYLXwhdk/s800nmJg//JRKQNyfjHiYjDP15UlwL0CPoUf9WGE7Opn9+UFs7Ym0D9OwqHLGy363l7E8RBsO7/6syHjshokeA3X3Y2QMMhBSmsnTyvLlNJBgoDQ1tDHhfWn8xEpQJJi/wOy2NwZHSw+ie67pYXVgRXXRrrQl63+Z8ddVFBl2ouOZ2vA21kKZbkih3/Xgp6jdUnnjvcChENCKwiuas9XVAlMntDiZUedGcDZ8H2WYLERxi+UMA4A5Nof5GQMzM+DAXNnlctMfr+K/ddFEDu4hAv2CjZs6+7uuPYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pkt90Vjva5r/lyTLtWUJ71F1ymOkq45s2ga8Pq+ASd4=;
 b=NUWzWBOt5LXT1IwI5VD9qIvz3KHysCsxdcvZZqMtmqgcnM60qmghrKaft/zTxSKXFyzniGpucCsxbkTROOMWc70tjSY9prop1pLbi0yhq3N7YtZzY3Yt9fuycWXuhIIghN0II+1H0DSdeGSVsXuxS9dtO8GryNEBmddy4N6mAvcF5Q3J9do8FKWx7fXld3HnXeF1W5qJamK0opxX8GOgscss7Mzu3CAMQqImlP02zP4+5IJp1Q4933i8vhvRhqjmCP+GHNNMejtPvy8EOSXf1sSGzL28QYk4/Wosd788u/d6z5rK+LkXJWv3DdrSLjAxGFMVPCcJcsn25tXSxXm5OQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 14:04:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 14:04:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Mar 2026 23:03:51 +0900
Subject: [PATCH v10 08/10] gpu: nova-core: use the Generic Bootloader to
 boot FWSEC on Turing
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-turing_prep-v10-8-dde5ee437c60@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0180.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: aee14834-7115-4a2b-bf44-08de779b74b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: GbG6nUSL1v9Sj8gkfSIdAsfmq12HqQvIKedwFG6w9/Msg8Zy//HDRybqs495elJ4HYnUS9u8QYmHr52CNgiPI//MOBw2CoHTBojbQ7x7j3Bxq0Wf/9RY4fzv0myN5opVU3fwmZetf0WtTBb+a97j0FeLRU3u72Ze49oBA3nk0p3o8fPjEVFuikpcjDTRiD8GvzblYopYXa5MsL7r61jV0l90SQjZTfFsIdXQST7mRJOutej72BrAoJFi4xGYj3cxgZzQ/Dv0AcqsuyVTxr0mBV4NrCLivGmoH1Se2UMKjQcoy5k5+AAX0F8zm5IG0eYSw3JnySiltgGZNiNjvDgTXm2RFGPxFmc3kAR+GQbL4jnTOCh0lnaIfZZ53iBeEvjGq+eHr5dVVicaafxSLeAIEc4YB1ckQunhEnLQk1OnegsXHXME7NmASTmz+StuR38WUQYglQv1pTRgl1bhWPPhyN8Qmn5mIP+HOHok/vxi/0ORFzO2oy4Unz3hqoVz4zpdsyUru9G420KXvSwiQAQzzeVte4WNnL/rfwWSXhNvUh2keqynLnqCO7JYmob3GoYFPxOgw9jfgypQh8bm8v3Lc9dp5liaLxHS6kOX1uQdiId02VFVKp2CzF8m3olsuDxL7n/3TcDBNYF9XxePPAd2Vrk8ACl06WUSnhaNzhUoABM73WspSLU8PSMDEypG0IPeYUlOlIXuQxTLuWYWX5G6GMKIgxLNjGfy78CoXmbCUPo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME5lZTIzbjJMU1U0TlZQOXM3REt1bkU3djNUSzdJQTRWQ2JqbXlQajErVm1p?=
 =?utf-8?B?S2FsTm5TR3FKNDdjQ1NMMytVUXpETmxNaVd3UjNJRlI0QXA0a01PRUxuaWEw?=
 =?utf-8?B?NkhsU1c4SThiRGdmcGlWNnp6Tnp4ZVBvRkVacDYvdmVlR0hyZHJhOUVISjlT?=
 =?utf-8?B?NlFPaWR3dllWb2hHYzRYK2ladDhublNRc0NkaGpPRjYvMWh2YU1wY01ab1k0?=
 =?utf-8?B?TitkZXdWUjVzRjZJQm1GU3FmMm1vd2MyWDZpcU8yeW5aRE9tcjdwN0pjM1pF?=
 =?utf-8?B?UmlLaHVtNlN3azM0TXpKdVFsVXRURDNsOXgzNU5iaVhyejUzb2ZTWXc2VXFJ?=
 =?utf-8?B?ZUFHRHZiVStUSkN0R0s3WHdRTHpHcGkxN013cFV2cTlHd2dKeEtaT1hTZmpO?=
 =?utf-8?B?NVVXem9nbUtDdVNLNEljV3J0NkdTKzl0V3ZEMU0wZlNQU08veGdpUFFrRnNn?=
 =?utf-8?B?NGdCUWZRbldRSnQwK0dlMzVUV1RBYVhabnJMbWJCZ3JzLzhtcVZ1OHlmcmRa?=
 =?utf-8?B?TXlmT0dEVTZSeTMxNk40dmNoWDBiaDIrdkoybGQ0cU9NbmdZSlRlcjZ5VHdj?=
 =?utf-8?B?S3lLWjdJYmFWMXNkM1NSQ3V3elk5ZTNIZXhqTU5rYU1vQ2VweE96Q0YyZGNw?=
 =?utf-8?B?cEt6TFF0cHppUy9naXo4Q2Q2WFNFN2JsSDRYTWhMYllrSjNCbEx0Y0x0UHRW?=
 =?utf-8?B?YnYzMUMyTjVVTmhDRk1MUXNEYXZlTkJzVVVEcllvbE1FNFVqTUFSWEt0T2Vr?=
 =?utf-8?B?MGJ6NHJOd3hIWHdQTFZLTVBpdm5YNVVrL2lGb3hrTWwzYVZHK0h5dXNXYnVp?=
 =?utf-8?B?dTNCL2FjMUJjaTdJNjNSUFFoYWVjQUpEeHF6SGI1REh1ZDhCSW5URkI5cEJO?=
 =?utf-8?B?bSs0TEJwZGFGdHduZXVpV1V5Sk1LZmdRUktzRW96WmJZQ09TS0VvV0Y5M0xM?=
 =?utf-8?B?Q1cxcnRIQUN6dFBjK1lOcEJlUHlwYmN3S2ptVEJaYWsvVkxJc3E3ejd4NVYy?=
 =?utf-8?B?TytTcjM5MzkvdW1LdHA2ODc5M3FOL0RaWTlpVkJDOVRHZjNoMDBzL0NhY0VS?=
 =?utf-8?B?MTlkZlVPYkw2cklOVVd5bDI0QUF2T0c2RVFjMk1vblhvbVA1NWYzOGcxRDhh?=
 =?utf-8?B?NFVJSFdFdUxlVjhhbUw1WnNLR3o5Y2NMQjNVTW94aHBaL0pzdHlaOVlQOExD?=
 =?utf-8?B?eGpiUURHRlQza0RqQWNHV01MdUJGUDN6VlNIbzJxMzlmM0szRFNDNzd3MnM3?=
 =?utf-8?B?UU1Xb09uWXhqOE5GalBkZlpraFEwaHF5cnh5WU5LZmgxOVJBU2FTc25rdjJv?=
 =?utf-8?B?QUlHb2RvVDlZRE9jMUNwNmZzSnp0K041MXJjUllsaGtzcFFoNUxRZm1mcmpW?=
 =?utf-8?B?UUxya1kyaTc4emRCVjEzRm9vWE1XOXlMdUlFMmN4RTY0NEdBdUd0a2F3aC9y?=
 =?utf-8?B?QkJHQThkSXZ4Z010b1pDZlFTeHNXOWhXK3V5eFh2VEVQQjdnUWdZeG8yR3NK?=
 =?utf-8?B?bnNsRlM4c1VUZDZnQnFsQmE2cWN1eENIakpmK0FPQ0UxRXFYQXAxUUpSZ3Vy?=
 =?utf-8?B?OTBtczBuK3RVamllcHJNMjZ5OGJWR1o1MUUvVFlqOVBXU2tQY1o0aVhpWlZH?=
 =?utf-8?B?anpiM1A5RFdUSENZdGVCdnI1cndmOWw5bVlSQjloS1hoTlNCeUlRNDQ4ZFpZ?=
 =?utf-8?B?Um9LUi9pbUdzN0czakJZeHRGUytlNXVnZ3BVU1lkcU9zSFc1LzVIUHhtcEpq?=
 =?utf-8?B?SXBWUGorMHVmdUJkSFUrQ2pLQ0RGZlZNeWJtR3c4amptalROYjlVb2pmQUx5?=
 =?utf-8?B?SVNEa01PYUYxWWU0ZkxTMW1UR1FNMVY1cStmelhmOTFISHp6T2hmeU53d1B4?=
 =?utf-8?B?QWw4RUh2cEhtay9MQkkxajVIZEhSQ3d2QjBwWE5vMGd5cHVqZC9kSnBQTVNH?=
 =?utf-8?B?K05FbGpxVEhtcEdRV1NRa1c5dzdXZ3NEZmxqWWdRTEhqUWtHcEpWNms0MnRE?=
 =?utf-8?B?Z3BtTWhsQkhrZ2pKdXI0OFh1clFaRzd6WElHYk1kbXk5NUpBSnZmYVpkY0Mw?=
 =?utf-8?B?UGhKamx6aTJOeE9tYnZXYmdSWmlHTmw4RTZNcXJaMzFMeUFkT0E2NkFDd0Vi?=
 =?utf-8?B?TlIwRmxkeXJQMHVRclJYaWk0M29XS1JSWjVqa2xrY0xVUW8yVU9tNFBjS1dS?=
 =?utf-8?B?QkpDK1N5Y211Y3o5MHlqcy93b29RbDdlSjc3d1RVMzFGNEFKK2ZiSXhDcUhk?=
 =?utf-8?B?YjhaSlQxUUYyNGxvTlVLenp3UVpZMlROLzE5YlQ4OEpwWG5ZM3ptV0xmTHcw?=
 =?utf-8?B?eUhMU3ZiRU5uVVBvQzZQZ2lGakMxRHV5Yk1pNHZMbzVCR25JSlkvZGFKQ2Jk?=
 =?utf-8?Q?DBAKhV0QQJiiv35FYYiNW/nga5J+ETOoWuJDsx5Fw8pJL?=
X-MS-Exchange-AntiSpam-MessageData-1: 8VQVMgNKm55uBQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aee14834-7115-4a2b-bf44-08de779b74b7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 14:04:29.6688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lERJmnNSXq6EFW5PvQmPVSh2Sfldyfu/YXwSIbjIGpJcHsiuWJMMOu+ax0XlbuYJwmv5esLIRskkq+1FIHw8Rw==
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
X-Rspamd-Queue-Id: 6CDC71D01A5
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
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 289 +++++++++++++++++++++
 drivers/gpu/nova-core/gsp/boot.rs                  |  15 +-
 3 files changed, 307 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 07404164ef12..afa39f04cc8a 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -10,6 +10,8 @@
 //! - The command to be run, as this firmware can perform several tasks ;
 //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
 
+pub(crate) mod bootloader;
+
 use core::marker::PhantomData;
 
 use kernel::{
@@ -378,6 +380,10 @@ pub(crate) fn new(
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
index 000000000000..dcde2d21dd4e
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -0,0 +1,289 @@
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
+#[repr(C)]
+#[derive(Debug, Clone)]
+struct BootloaderDesc {
+    /// Starting tag of bootloader.
+    start_tag: u32,
+    /// DMEM offset where [`BootloaderDmemDescV2`] is to be loaded.
+    dmem_load_off: u32,
+    /// Offset of code section in the image.
+    code_off: u32,
+    /// Size of code section in the image.
+    code_size: u32,
+    /// Offset of data section in the image.
+    data_off: u32,
+    /// Size of data section in the image.
+    data_size: u32,
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
+    /// Offset from `code_dma_base` where the non-secure code is located (must be multiple of 256).
+    non_sec_code_off: u32,
+    /// Size of the non-secure code part.
+    non_sec_code_size: u32,
+    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
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
+        let firmware_dma = DmaObject::from_data(dev, &firmware.ucode.0)?;
+
+        let dmem_desc = {
+            let imem_sec = FalconDmaLoadable::imem_sec_load_params(&firmware);
+            let imem_ns = FalconDmaLoadable::imem_ns_load_params(&firmware).ok_or(EINVAL)?;
+            let dmem = FalconDmaLoadable::dmem_load_params(&firmware);
+
+            BootloaderDmemDescV2 {
+                reserved: [0; 4],
+                signature: [0; 4],
+                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
+                code_dma_base: firmware_dma.dma_handle(),
+                non_sec_code_off: imem_ns.dst_start,
+                non_sec_code_size: imem_ns.len,
+                sec_code_off: imem_sec.dst_start,
+                sec_code_size: imem_sec.len,
+                code_entry_point: 0,
+                data_dma_base: firmware_dma.dma_handle() + u64::from(dmem.src_start),
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

