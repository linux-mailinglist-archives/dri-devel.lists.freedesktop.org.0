Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK4IDmlHpGk0cQUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD611D0171
	for <lists+dri-devel@lfdr.de>; Sun, 01 Mar 2026 15:04:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE5DE10E3BE;
	Sun,  1 Mar 2026 14:04:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r98JKGV1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010008.outbound.protection.outlook.com
 [40.93.198.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B12E10E3F7;
 Sun,  1 Mar 2026 14:04:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Os8v9PXTrBxrqL7hhtLiGlD9NtSajhgZtAA1r4Dwo//Y+IBdbD8hHigcl74s16Ne+NUhPmvO6wnDgFvqFY6TUiIo6FB++xwxlr5uHGPYaZD/exJJaJlieKBHmkmskGkSlgTp7du1X+S6usJ1KtQlxAEufElRK4NkSzVGMIfIujNe8tQ94aE6+uaCzqphQGYFcMRz9WMjPeSnLoci0tUYrND6UJqP7syz6BpRuy5M7+muYVEtwA9Lvtd2FibSz+FEH7bwq38qtshk2FFTKhX45xtCzZ4GbUEazq1mJGqKjE03FqGLFLqSxjG/SF35xqwc6AUKCUTBnOOmxsUbJyZLCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DqHgG/IphMPhH8T5g9qPaerrFfdXnk662HUzwWUs2ow=;
 b=WppFPEtDSNMHsxX8w4HybMKqpiRZNpezYrV410D6Xp5yrtQ7AbfDErx7u6Jy4f/As/OcWaby2AMX0tEI9rA/il8AkTmiaT7kjSCMjaIdTCHWcM7vuXykiNpdF0+ivsnd3ohdZl7MnKih0Qug7PtDDS8hH2YrMYDXYVmAj1Ywx2lJc5wl6YjMXoqNMh5f4+LcWM2445DlwG7tQPhnUv3W79zIZjSOmTv3ZAg0MdEu4TXH5+CHaLdi1HhxQQR7Wti6nZg6AQM0XUiA9IX71Zyj9C/BqDGJ49IvCTTOdnhzGKxN6Yd96+B7qo0hbQGyQ/2IWWQdFiMJp1BJmxHZUwOAUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DqHgG/IphMPhH8T5g9qPaerrFfdXnk662HUzwWUs2ow=;
 b=r98JKGV1k3O/lFo9Lfs0cV2xddiaNzlMf471qzQaPGBOTj2rwLLuqiNqyvtSQ7xZ0W9dEtXeQQeGdPVmDqAwab4+2KXCMByk58nE8BF3Y3uHYbvgIKh2R3w1VIgMiuZgytzSAox0lvXlmaRulGfcK/997sDj2Y2E4xS6/y1E4E76XWQjJRsrzl5s7uEsChBY2lQmTP54QPga0zFiQgcLbcsxEe0TMKLl3ZIhzMIXFheFusyBVjoYekuYY5LyU60TTScKAX7EX4Fz+ywiS3o+wvryBUawiaG4LpZ4CkOfhLFKllHtUG8fbQxwVMV6mjUHTkM8+TVcrJ/iglXpBNh7ng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB6632.namprd12.prod.outlook.com (2603:10b6:8:d0::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.19; Sun, 1 Mar 2026 14:04:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9654.020; Sun, 1 Mar 2026
 14:04:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 01 Mar 2026 23:03:48 +0900
Subject: [PATCH v10 05/10] gpu: nova-core: falcon: remove unwarranted
 safety check in dma_load
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260301-turing_prep-v10-5-dde5ee437c60@nvidia.com>
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
X-ClientProxiedBy: TY4P301CA0114.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37e::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB6632:EE_
X-MS-Office365-Filtering-Correlation-Id: b5ca7dd7-5ace-428c-7ecb-08de779b6e22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|376014|366016|10070799003;
X-Microsoft-Antispam-Message-Info: H/1EZHdyVfiNsk0jr2VXi6gIzr+0Z1viXPwSgtsm1190tKyhNJwGnVB9UaybzQ3+2OV+A9gaudRti7SNYZkA/gam43NKFqif8+z/tVoGD9fLBfs3ZImMdE1EkpGMeJvnVxXbqCI43ebarp6rphbmYjPm572kAivUj58/z4nhaQkd2ivgKWUtIq1H+BXKpSJnQ8/iP7/vL4bx/KuItamikhC+HlvJaDHNZUWXFnuyl7YBcfUgdZsMsIGP2fZniCE0pn+5oFcKQm04wtMcQokIlkQ7fPVxwZ6bjHGLUs03Hp/+481CqyonR0bC30YPthRGEuBF0Ng3caKAxZNx+Dr7jRO6G6QJR0H40MG7eKZQdYpQZHLeRoxX5cxqcRTtUjlL0EnEz2zjOGvJrMikSkzp76tmMJlf7H/UPEs0Gk45orYKVrXMGLafwt/9UkyLyaOlNQBiCSvNZHgv4mRr/2yKZ4/u5GsgvqqoXfhdaK6Qh0q1skZgxB353NidBHZvX4GLwscqfz6NGc9gaR6LSDalp1bdMyyPY6qaY10iHzNI+8dDG3ZvaN8AKcA0aXnrb0LrQULabT5vXOxkInie3gaevnLuOFliDlbQ05kjbiNoUo9QR9LEmoxZ7ynNRhfa8UE9mbWHvhxg/Dpia9yJDnMyjPtn/CQtDnJD7ecXz0bOW/9jYJaueOFyFg5aXfMw/nRxNr0Ck7XZmljxZcHvA+O4sEWvjelvcsjYaEw5GxsO6a8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3A2WUlBbkpqQkdFWXRFemUvWmtLVmZFU2htT0hvQkp6by8xVVROR2VqNTdy?=
 =?utf-8?B?R2Q1TU9wMG1CaHBGak1VblFlQURIL2ZLQ3FpQnNBYW1ldTNEc25MeWpjZlpo?=
 =?utf-8?B?QW8rK1VDUXMyaTRRS2I1UWVCTWlIN2pycmtWaTk5dFpxbnNTbWRzckFFMmJa?=
 =?utf-8?B?ZUFDdjRreFZiVGQzVWtUT3NtUS9lR1d0eVF0cXgzTzZsWVNhRDVoWVNwYjRU?=
 =?utf-8?B?Mnh2Q3N4eVpsTkxzendZd2d5NlJJa1N6NTJsWGdWQ0dHRHA3Rnd3VWNoeXVi?=
 =?utf-8?B?aHFUczdoM0l6YkdWMWxCZUhBSWtRR2ovOTlUUUora3VvdFptWXVXNVJFQlpX?=
 =?utf-8?B?U1JyUjhRcDFRQnJtdjhUdG04YkpxRmZDV1c2YWVrcDJkYVhVQ3F6WjlKRUxO?=
 =?utf-8?B?U1B3dHdhaVVUTTdFZTErNEQvaTE4UkN2bC8rZmgrZEd3czVuaERuT2xnK2xo?=
 =?utf-8?B?aHAwblBEbHJNWFhmK2JacFhkSkJ2YU9Zc1EvVE5YR0k4RzZqR2NObTB4NXZp?=
 =?utf-8?B?dWhob244UWhXMmlFWXNYSVdDU1pMcHVoL1F5dWU0Q3IvV0NKZmtYdmFOdkNn?=
 =?utf-8?B?NzlhWXQ1NnZtblNsVnVneWFMQ1JXS1pMTTFZSHNhVzU4aDVIaEVFaFo2SHdL?=
 =?utf-8?B?dWRUaUtnS25XSXZyd1VmamNxZ1crTklnOUVhMHdLUzRkcWRTemoxQVRrVjNB?=
 =?utf-8?B?aGVDUFQzZXJ1OFRPVnpZQ2xXS3IzUG5lQ1c3VjhqK0VOWmtvWGZTcGNxZDJy?=
 =?utf-8?B?NER1bG41S0F2MjdPY3MxZGI2M09KL3JYMVRUbDY2NFBRNWFYYnNhREYvUzB0?=
 =?utf-8?B?NnozZ2NPWEJHb1pSUDBDTEpFTk9kZzZ6c3V4STdoVmhudGZKNFo2RHlweFJ4?=
 =?utf-8?B?STRhOG45M0dpK21xcnlneEFFdzR6dTZsdEV6WlZGZXhNc2daSzl6SDMwSlBL?=
 =?utf-8?B?U1lEUTRnNVNyVTd2b1pZOG1IUGJKUDcrQmRmVHZoODJISUtZOUZycnNQb2RL?=
 =?utf-8?B?dk1zanlBbFNBdUdHY2RySldtTmFiejB0SzEraU9kMXN3TTU4MkdCYWZHaHFV?=
 =?utf-8?B?c05uSjM1UTBUam5UNERZNkVyRmEyMjJqUnJhZWlrNlgxaXlYWnFWWkFqWGdP?=
 =?utf-8?B?V0o1MUJuTk1TVmZVQ0l4Y25zR1RIU0JRMFlyYU5RUlF6VEZjcjM3YUlNUXg3?=
 =?utf-8?B?aEwwdGxGYzYrRG8yTVNKV3Y3SnZmb2VQTmdQQ1pCUHEyRzVIT2FwVnZxMmh0?=
 =?utf-8?B?ZmsyekIrQ29NYVIveVdEUzBoYjJkK283Vmd4WnpvY0MwYXIwS3RmbGlDbHh6?=
 =?utf-8?B?R2lVWkU4djBITTl0THBQRFJzVUJMU3pLUzZxVE9MRmRZZ2FqSWRkOU9JMXJs?=
 =?utf-8?B?aU5FOStpb0xGZ1o3SjlVOWdlNjMzaUcwNVpBcitGL0xLTXAzNmJhb0FoWTdi?=
 =?utf-8?B?UWNBTmRjZmUveXNDZG5hdTI2K0tISHBONzRoM3Jsdm5xc0NjaTdUampMNFBC?=
 =?utf-8?B?RTZnWHVZYS84WElydER4N1dlQWVjTVNwWUsrVFFFOTVXb0RMbnBaWm5ZZDVU?=
 =?utf-8?B?dnlsd3VFZWd6YmwyU2dTemVpbFg5TVlnbW11OW1MODVVSERLUVdGeFBmaUUz?=
 =?utf-8?B?Rk9ERS8ycnFZKy82OTd4YzZybkdKdmhEVzlNNFRnZFJQYnpta0p4MHdFQW9Z?=
 =?utf-8?B?TmJRNExXVkdIVzk3K2lkU1BNS0Y5QXJDNzN4eW1DTWg1RTkvUHhQbUxSbytL?=
 =?utf-8?B?YWJqbitpdS8wOXg1cnZybktjWTVCVC9Ka1BSNzJYeUVCTXZaQ29kZmYzbENM?=
 =?utf-8?B?WUllbVQ1WXlTaE5xUFJSNHhQRS9XeW5EcExLV3p0MWk0SjdIUEtMMng5S1ZD?=
 =?utf-8?B?cTJnak8vQ21pQklkV2k3Z3pHdVdVVlU0d1ZFTXgwN1R5ajQyM1poZTYyVnNs?=
 =?utf-8?B?Z2ZPY2JybHRrMTlFR25MSHA3UUNvN1JJN3RDd1dEKzRBdDlFOXpIQkVlVG45?=
 =?utf-8?B?ZHpxQnU0ZkhiSzcwTTloUWJkRElFNi9MODhTV251V3hQZ1ZZV2JsMjhrZUF0?=
 =?utf-8?B?ZG8zdGJMMjQybU5xMzVxaWF4RzU2cFFOQ1FNTklXd0hIR3ovNkxwOTR2YzVj?=
 =?utf-8?B?Qk44S1V6RVpkWUMzS01mbkkxWjJiZDJBaTJDYmIyQlJ6Q2IxT2xFN25OUDAz?=
 =?utf-8?B?N2ZJaHlvc0RmUmxScWw3WExkRlZmTTZkYWkyci9GNGZoSVg5bzA4MzhwN2N3?=
 =?utf-8?B?Z2FGWVZyWjdSdUFnY1ZXOGYxdmF1enhoWnN5MHNPV2c0YW84UGtsdEJHQk9J?=
 =?utf-8?B?NVZXc1lpL2kvUDg4ZjkvdmVrYmdZMXcweEcyZmM3T3p2a0VRVjVzNHp6OGh4?=
 =?utf-8?Q?drqHD2nSgLlx4vajKIR9tXpFSpc34m42xZ0qEx4w8cVNQ?=
X-MS-Exchange-AntiSpam-MessageData-1: mlaTmKC9tJtUgA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5ca7dd7-5ace-428c-7ecb-08de779b6e22
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2026 14:04:18.5740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iOpckmCtzYLdCOd+hMk+6179N3Eosx5kTenx14kik/2BC8x58vBLqs8309Gq/SZtK+aZ5eLzlyHivcKqt9Djhw==
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
X-Rspamd-Queue-Id: CBD611D0171
X-Rspamd-Action: no action

This safety check was an assumption based on the firmwares we work with
- it is not based on an actual hardware limitation. Thus, remove it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 450431804e1c..c02b73b1cfe6 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -527,13 +527,6 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(
         bar: &Bar0,
         fw: &F,
     ) -> Result {
-        // The Non-Secure section only exists on firmware used by Turing and GA100, and
-        // those platforms do not use DMA.
-        if fw.imem_ns_load_params().is_some() {
-            debug_assert!(false);
-            return Err(EINVAL);
-        }
-
         // Create DMA object with firmware content as the source of the DMA engine.
         let dma_obj = DmaObject::from_data(dev, fw.as_slice())?;
 

-- 
2.53.0

