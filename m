Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFfGAnOJcGkEYQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:08:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A03D0533FF
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 09:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05F3910E6DD;
	Wed, 21 Jan 2026 08:08:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oemnVqHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011035.outbound.protection.outlook.com [52.101.62.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EFCD10E6D1;
 Wed, 21 Jan 2026 08:08:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2l342ef7IroXVigXOVsON7VcFDYHdIdYS9dM2fFd81wys5JNE5M0RU2P+XIYU5CepLE6qUbJmIPeNA8gt1zXwfePPUEcsXvtAAikTcH/9oa2FjNs8SIYILgWZbdMIJeH229V+g7qyS2CvXTu9BbfWGia4eUrpNxJUR/x/lWcLmgbHx8I0zDEec+md6QI1U6DpYSeEPPOoJhARJ15rZsx9inLQS7PW/SFSXopycela1SAYyoCSH333TR3tp3W6sOth9WFB/CgRfq3PgSb/00+bPS0LG4AVPD90w6SatAA9CAsjAM0YFxUtGiqkQgFNCf7C4ojeOfg2LRJQnDgxi4mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHVJd6REl+meqWtvaqgwQfiNlcwUHCoPoutxoGdIu94=;
 b=u9I8+/PZ4EohZj1aMWxp7znT4ryVc/j9TyxrL34UxNGdNcRVhayb/01ZkhpwetqYyWDrDVLL65BCduCnpgBVGKL9AqiKFqIC0bz6QF8ImMaeubf6ebYUlDy+PuSm5HijndVVspgU5PMafHVxwziuliHnrSZtKF1/CTJDnamnVxaO/ghX5depeLVX62IKwptFAxsBcQYOU7Mb1iXjCBiC0viDC2qRpIDXUrrhA7bmGQls/V93edtkt2KaSDclcrRgonbIWtMPtHGGwDKwyWYhfAp8ZEpOLzTX3BXeA4fXlu6oMb3hu0VYAO43MOqO6eTNvxp0eXa51b4N8YXQBcTX9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHVJd6REl+meqWtvaqgwQfiNlcwUHCoPoutxoGdIu94=;
 b=oemnVqHSZLDs0H2V9KuAbRc1b3RmiPFn4VMa48LEenyhPL+zYRz1vmKr1PzhXv6BcmSs80wsV+8gmHmqx839jKCoN1hIhwmLFCrU70Jpk0ziPTclVu5vTqT2xmYxl0nF8tfdtf5mfGaisCcLpb0dti6NG2d2VBc7SnN+zLP5XpsTlmlYmNIdCfSgBCkfDX72j5WR4F30rce34GDvsxsUlyUEGkiHJY2hHtQsLprCpCPreYNQ/kJD8FVdHCaOTr0CtKQVW1VrEV9WZMgVJpz4iJ2FX+9IdjsP0JOHEiz+rh0KD6TH41YHII4isiBMqSGoCeAhpKctibgQztFs4wPByQ==
Received: from BLAP220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::13)
 by PH7PR12MB8016.namprd12.prod.outlook.com (2603:10b6:510:26b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 08:08:06 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::4) by BLAP220CA0008.outlook.office365.com
 (2603:10b6:208:32c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 08:08:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 08:08:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 00:07:57 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Wed, 21 Jan 2026 00:07:56 -0800
Received: from inno-thin-client (10.127.8.10) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 00:07:46 -0800
Date: Wed, 21 Jan 2026 10:07:45 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, "Alex
 Deucher" <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Helge Deller
 <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, "John
 Hubbard" <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, Andy Ritger
 <aritger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>, Balbir Singh
 <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
Message-ID: <20260121100745.2b5a58e5.zhiw@nvidia.com>
In-Reply-To: <20260120204303.3229303-6-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-6-joelagnelf@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|PH7PR12MB8016:EE_
X-MS-Office365-Filtering-Correlation-Id: 46ebc44a-58ca-4049-f78b-08de58c43520
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+/DG+zXL3MSiopJ83yiyS9mf3jozI9zbO4SatqCGczg1jsR/lUflES9WN9t+?=
 =?us-ascii?Q?2Y3Pw6zMZUEQT48BPPN1c+ezscimrAyhG7Tjp55J4/3gWDYz5IeXAN/69WxA?=
 =?us-ascii?Q?s91+QWGt1wsgIAEIDdt+cW51yMHT/wpX0kiYc6EJYYvpNTwL5H3PNga5ysJi?=
 =?us-ascii?Q?w4SS6vN0rBRwSBpTs4BVnPOj60s7ztDvOhQYzhz7R52URABLosy17wumdMTY?=
 =?us-ascii?Q?Pg9CjSer4dmrWdpn5c5Gyv6skwtOwiaCaqbF5mbeGVwAX2ziU2+JpnP+XD7D?=
 =?us-ascii?Q?ewSwblu5BJTda2IPwMlI5tvhSLgrN7UHOSY4wdrf7u3xFNbDP0uLGzqyhzYH?=
 =?us-ascii?Q?VX+Sj4/VMNky+qKf3uQD8E5bqMsN1bgqZtTpal0338PqroXWMJAnFVmIuqb3?=
 =?us-ascii?Q?RwwtoLM+KUJ8BiOVVprEC4vUGI01XUKv2n/GGWi9ON86sTayLIeL67NNL1KA?=
 =?us-ascii?Q?ZHm43I5Zfw3fk79U7WpGON8WooMhmwDUzGEO0zquHzN4eoU4k8+VvT/Lyokh?=
 =?us-ascii?Q?Bqq4YuPgQGvjApb9K2qfxsb0Xg7hEgpoMcywsTERFnm73OuK4Oe2AZdZFPWO?=
 =?us-ascii?Q?WVp9INkBlj8ZteS/DKrf2fG6CzU/MYcj5YcS/c7M/QPWLHs4Jp444tXoEPbC?=
 =?us-ascii?Q?XVwcLljII4rcq6yVVfRWEcYIAkMseOQEnhNjOtGFPZtyKFFLlRQHwWxA1VQv?=
 =?us-ascii?Q?HD2H7TMrZkum9tvwZ4WreNRPudjUr1CiwKQoiTv9Vb/O/CynZ5gBu5jV1bL6?=
 =?us-ascii?Q?1RYTyX2L0pcUxPpcGTm1+q4BYrgSYSWFKtqcPy0Gt2JfPwtB3KEcaSehyY5C?=
 =?us-ascii?Q?4mS2Uf6XHghFslk71Mfuh9J/XmkWEMdhcTyDKqMcbgb75c/Py//Fbk/apCCd?=
 =?us-ascii?Q?ufN54yv1WyE+t15nNXAGPdEadm+RFlAe70B0pnb5pnQ8/PdEZI+wsCZU9z3T?=
 =?us-ascii?Q?BA+UV+c/VaHfJ9iSTJTXBvPQTtbEMzhQ7L1A64/HJ0Vm15/a2nTCIfs/ramH?=
 =?us-ascii?Q?mOTYT3dJVqyqe0/o70FL2O2rF7yGjJBwZ40WITqj70mzpQgXOW/SKGD2tgzl?=
 =?us-ascii?Q?MgECeWYl1vy4callMa5HMjR1M9xVJUHrrs9LWTGXUEcqNWT4UWwz5pbnRKkk?=
 =?us-ascii?Q?IH7RuvG747cxP2wqs5i2nhSwIOvyBzSONmpJTtNLEdDXQ5eYyEyUzDE49fk0?=
 =?us-ascii?Q?UNAWT12UWt/4AKa1VkOoUoo3ref2yKdqnGnn3KdNS3JLmlt7ojtIVUnUF92d?=
 =?us-ascii?Q?c3yi78FqojwbhRWGFjT7nG2jq2PRFovD3LYR54Q/mySZmbUEUNRM858wkjy+?=
 =?us-ascii?Q?Hzn/lL885c2j5hE/Q/xgXo3Bo1P6XQQf6oExvY+nTiJHdlPZ6M6jQrEm/Gao?=
 =?us-ascii?Q?fU5sWK/t671wJuttIYikf+5lnvR3aG59d2soQsfnm0pZyuD+ow+9Ujlq4/Ul?=
 =?us-ascii?Q?brytRNEQbd/qwwDRwKNKIjTVsaTS4/5Aev0MnFLtma1kq4m2BUXDyeOseO1U?=
 =?us-ascii?Q?VcttVioRg4KJ2SbgJyrX3jAORUy0jQarVMP1z7YWFndDaYAnYjPq1BVTW4R4?=
 =?us-ascii?Q?AKlzZ5V7NNmfrbqtxYKHMJk+umk3jWTEaW1lDSPcIlc33iVZ7M/xQKjRy8cI?=
 =?us-ascii?Q?xe65WhZknvWB70PQmJnYt1uJnDlYkR2P8+v9d7dYAVlVPUOWvlaScHrMvXAi?=
 =?us-ascii?Q?jOOLAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 08:08:05.9895 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46ebc44a-58ca-4049-f78b-08de58c43520
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8016
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhiw@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: A03D0533FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026 15:42:42 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> PRAMIN apertures are a crucial mechanism to direct read/write to VRAM.
> Add support for the same.
> 

I went through the code, this seems not designed for multiple users. As
this is used for writting PTEs for page tables, can you shed some light
about the plan of how we should handle the concurrency of writting multiple
page table PTEs, e.g. when two GPU memory mapping in two different GPU
page tables are procceding concurrently, this could happen when people
creating vGPUs concurrently. 

Z.

> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/mm/mod.rs    |   5 +
>  drivers/gpu/nova-core/mm/pramin.rs | 244 +++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/nova_core.rs |   1 +
>  drivers/gpu/nova-core/regs.rs      |   5 +
>  4 files changed, 255 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/mm/mod.rs
>  create mode 100644 drivers/gpu/nova-core/mm/pramin.rs
> 
> diff --git a/drivers/gpu/nova-core/mm/mod.rs
> b/drivers/gpu/nova-core/mm/mod.rs new file mode 100644
> index 000000000000..7a5dd4220c67
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mm/mod.rs
> @@ -0,0 +1,5 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Memory management subsystems for nova-core.
> +
> +pub(crate) mod pramin;
> diff --git a/drivers/gpu/nova-core/mm/pramin.rs
> b/drivers/gpu/nova-core/mm/pramin.rs new file mode 100644
> index 000000000000..6a7ea2dc7d77
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mm/pramin.rs
> @@ -0,0 +1,244 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Direct VRAM access through the PRAMIN aperture.
> +//!
> +//! PRAMIN provides a 1MB sliding window into VRAM through BAR0,
> allowing the CPU to access +//! video memory directly. The [`Window`]
> type automatically repositions the window when +//! accessing different
> VRAM regions and restores the original position on drop. This allows
> +//! to reuse the same window for multiple accesses in the same window.
> +//! +//! The PRAMIN aperture is a 1MB region at BAR0 + 0x700000 for all
> GPUs. The window base is +//! controlled by the `NV_PBUS_BAR0_WINDOW`
> register and must be 64KB aligned. +//!
> +//! # Examples
> +//!
> +//! ## Basic read/write
> +//!
> +//! ```no_run
> +//! use crate::driver::Bar0;
> +//! use crate::mm::pramin;
> +//! use kernel::devres::Devres;
> +//! use kernel::sync::Arc;
> +//!
> +//! fn example(devres_bar: Arc<Devres<Bar0>>) -> Result<()> {
> +//!     let mut pram_win = pramin::Window::new(devres_bar)?;
> +//!
> +//!     // Write and read back.
> +//!     pram_win.try_write32(0x100, 0xDEADBEEF)?;
> +//!     let val = pram_win.try_read32(0x100)?;
> +//!     assert_eq!(val, 0xDEADBEEF);
> +//!
> +//!     Ok(())
> +//!     // Original window position restored on drop.
> +//! }
> +//! ```
> +//!
> +//! ## Auto-repositioning across VRAM regions
> +//!
> +//! ```no_run
> +//! use crate::driver::Bar0;
> +//! use crate::mm::pramin;
> +//! use kernel::devres::Devres;
> +//! use kernel::sync::Arc;
> +//!
> +//! fn example(devres_bar: Arc<Devres<Bar0>>) -> Result<()> {
> +//!     let mut pram_win = pramin::Window::new(devres_bar)?;
> +//!
> +//!     // Access first 1MB region.
> +//!     pram_win.try_write32(0x100, 0x11111111)?;
> +//!
> +//!     // Access at 2MB - window auto-repositions.
> +//!     pram_win.try_write32(0x200000, 0x22222222)?;
> +//!
> +//!     // Back to first region - window repositions again.
> +//!     let val = pram_win.try_read32(0x100)?;
> +//!     assert_eq!(val, 0x11111111);
> +//!
> +//!     Ok(())
> +//! }
> +//! ```
> +
> +#![allow(unused)]
> +
> +use crate::{
> +    driver::Bar0,
> +    regs, //
> +};
> +
> +use kernel::bits::genmask_u64;
> +use kernel::devres::Devres;
> +use kernel::prelude::*;
> +use kernel::ptr::{
> +    Alignable,
> +    Alignment, //
> +};
> +use kernel::sizes::{
> +    SZ_1M,
> +    SZ_64K, //
> +};
> +use kernel::sync::Arc;
> +
> +/// PRAMIN aperture base offset in BAR0.
> +const PRAMIN_BASE: usize = 0x700000;
> +
> +/// PRAMIN aperture size (1MB).
> +const PRAMIN_SIZE: usize = SZ_1M;
> +
> +/// 64KB alignment for window base.
> +const WINDOW_ALIGN: Alignment = Alignment::new::<SZ_64K>();
> +
> +/// Maximum addressable VRAM offset (40-bit address space).
> +///
> +/// The `NV_PBUS_BAR0_WINDOW` register has a 24-bit `window_base` field
> (bits 23:0) that stores +/// bits [39:16] of the target VRAM address.
> This limits the addressable space to 2^40 bytes. +///
> +/// CAST: On 64-bit systems, this fits in usize.
> +const MAX_VRAM_OFFSET: usize = genmask_u64(0..=39) as usize;
> +
> +/// Generate a PRAMIN read accessor.
> +macro_rules! define_pramin_read {
> +    ($name:ident, $ty:ty) => {
> +        #[doc = concat!("Read a `", stringify!($ty), "` from VRAM at
> the given offset.")]
> +        pub(crate) fn $name(&mut self, vram_offset: usize) ->
> Result<$ty> {
> +            // Compute window parameters without bar reference.
> +            let (bar_offset, new_base) =
> +                self.compute_window(vram_offset,
> ::core::mem::size_of::<$ty>())?; +
> +            // Update window base if needed and perform read.
> +            let bar = self.bar.try_access().ok_or(ENODEV)?;
> +            if let Some(base) = new_base {
> +                Self::write_window_base(&bar, base);
> +                self.current_base = base;
> +            }
> +            bar.$name(bar_offset)
> +        }
> +    };
> +}
> +
> +/// Generate a PRAMIN write accessor.
> +macro_rules! define_pramin_write {
> +    ($name:ident, $ty:ty) => {
> +        #[doc = concat!("Write a `", stringify!($ty), "` to VRAM at the
> given offset.")]
> +        pub(crate) fn $name(&mut self, vram_offset: usize, value: $ty)
> -> Result {
> +            // Compute window parameters without bar reference.
> +            let (bar_offset, new_base) =
> +                self.compute_window(vram_offset,
> ::core::mem::size_of::<$ty>())?; +
> +            // Update window base if needed and perform write.
> +            let bar = self.bar.try_access().ok_or(ENODEV)?;
> +            if let Some(base) = new_base {
> +                Self::write_window_base(&bar, base);
> +                self.current_base = base;
> +            }
> +            bar.$name(value, bar_offset)
> +        }
> +    };
> +}
> +
> +/// PRAMIN window for direct VRAM access.
> +///
> +/// The window auto-repositions when accessing VRAM offsets outside the
> current 1MB range. +/// Original window position is saved on creation
> and restored on drop. +pub(crate) struct Window {
> +    bar: Arc<Devres<Bar0>>,
> +    saved_base: usize,
> +    current_base: usize,
> +}
> +
> +impl Window {
> +    /// Create a new PRAMIN window accessor.
> +    ///
> +    /// Saves the current window position for restoration on drop.
> +    pub(crate) fn new(bar: Arc<Devres<Bar0>>) -> Result<Self> {
> +        let bar_access = bar.try_access().ok_or(ENODEV)?;
> +        let saved_base = Self::try_read_window_base(&bar_access)?;
> +
> +        Ok(Self {
> +            bar,
> +            saved_base,
> +            current_base: saved_base,
> +        })
> +    }
> +
> +    /// Read the current window base from the BAR0_WINDOW register.
> +    fn try_read_window_base(bar: &Bar0) -> Result<usize> {
> +        let reg = regs::NV_PBUS_BAR0_WINDOW::read(bar);
> +        let base = u64::from(reg.window_base());
> +        let shifted = base.checked_shl(16).ok_or(EOVERFLOW)?;
> +        shifted.try_into().map_err(|_| EOVERFLOW)
> +    }
> +
> +    /// Write a new window base to the BAR0_WINDOW register.
> +    fn write_window_base(bar: &Bar0, base: usize) {
> +        // CAST:
> +        // - We have guaranteed that the base is within the addressable
> range (40-bits).
> +        // - After >> 16, a 40-bit aligned base becomes 24 bits, which
> fits in u32.
> +        regs::NV_PBUS_BAR0_WINDOW::default()
> +            .set_window_base((base >> 16) as u32)
> +            .write(bar);
> +    }
> +
> +    /// Compute window parameters for a VRAM access.
> +    ///
> +    /// Returns (bar_offset, new_base) where:
> +    /// - bar_offset: The BAR0 offset to use for the access
> +    /// - new_base: Some(base) if window needs repositioning, None
> otherwise
> +    fn compute_window(
> +        &self,
> +        vram_offset: usize,
> +        access_size: usize,
> +    ) -> Result<(usize, Option<usize>)> {
> +        // Validate VRAM offset is within addressable range (40-bit
> address space).
> +        let end_offset =
> vram_offset.checked_add(access_size).ok_or(EINVAL)?;
> +        if end_offset > MAX_VRAM_OFFSET + 1 {
> +            return Err(EINVAL);
> +        }
> +
> +        // Calculate which 64KB-aligned base we need.
> +        let needed_base = vram_offset.align_down(WINDOW_ALIGN);
> +
> +        // Calculate offset within the window.
> +        let offset_in_window = vram_offset - needed_base;
> +
> +        // Check if access fits in 1MB window from this base.
> +        if offset_in_window + access_size > PRAMIN_SIZE {
> +            return Err(EINVAL);
> +        }
> +
> +        // Return bar offset and whether window needs repositioning.
> +        let new_base = if self.current_base != needed_base {
> +            Some(needed_base)
> +        } else {
> +            None
> +        };
> +
> +        Ok((PRAMIN_BASE + offset_in_window, new_base))
> +    }
> +
> +    define_pramin_read!(try_read8, u8);
> +    define_pramin_read!(try_read16, u16);
> +    define_pramin_read!(try_read32, u32);
> +    define_pramin_read!(try_read64, u64);
> +
> +    define_pramin_write!(try_write8, u8);
> +    define_pramin_write!(try_write16, u16);
> +    define_pramin_write!(try_write32, u32);
> +    define_pramin_write!(try_write64, u64);
> +}
> +
> +impl Drop for Window {
> +    fn drop(&mut self) {
> +        // Restore the original window base if it changed.
> +        if self.current_base != self.saved_base {
> +            if let Some(bar) = self.bar.try_access() {
> +                Self::write_window_base(&bar, self.saved_base);
> +            }
> +        }
> +    }
> +}
> +
> +// SAFETY: `Window` requires `&mut self` for all accessors.
> +unsafe impl Send for Window {}
> +
> +// SAFETY: `Window` requires `&mut self` for all accessors.
> +unsafe impl Sync for Window {}
> diff --git a/drivers/gpu/nova-core/nova_core.rs
> b/drivers/gpu/nova-core/nova_core.rs index c1121e7c64c5..3de00db3279e
> 100644 --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -13,6 +13,7 @@
>  mod gfw;
>  mod gpu;
>  mod gsp;
> +mod mm;
>  mod num;
>  mod regs;
>  mod sbuffer;
> diff --git a/drivers/gpu/nova-core/regs.rs
> b/drivers/gpu/nova-core/regs.rs index 82cc6c0790e5..c8b8fbdcf608 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -96,6 +96,11 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) ->
> kernel::fmt::Result { 31:16   frts_err_code as u16;
>  });
>  
> +register!(NV_PBUS_BAR0_WINDOW @ 0x00001700, "BAR0 window control for
> PRAMIN access" {
> +    25:24   target as u8, "Target memory (0=VRAM, 1=SYS_MEM_COH,
> 2=SYS_MEM_NONCOH)";
> +    23:0    window_base as u32, "Window base address (bits 39:16 of FB
> addr)"; +});
> +
>  // PFB
>  
>  // The following two registers together hold the physical system memory
> address that is used by the

