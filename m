Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NNzIZijcGlyYgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:59:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3963B54D05
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 10:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A336D10E739;
	Wed, 21 Jan 2026 09:59:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gTz7XHKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011063.outbound.protection.outlook.com
 [40.93.194.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF5D10E734;
 Wed, 21 Jan 2026 09:59:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gHr9bOGGqolEc/TlZ9Jp9vFs6/mLwl4o9EEaKHHpalkoLLaKPCon0AuLkxsyq+6Z7HG7VPCZWwCewkf8J7qEWhJ6dCHoVR7NK7zqbaQstHpKraNmUINCvczSnbi2UW6KxY7VvoW9vt5D2NifdKxq5Lu4LD+Ht4vNXIlj/TDmm9DTVcx24AZHQ4YotuUIE/fi1FwUWaKu1R5zPCnTWBgmRyM/AouJekgl7FnqXf0roEmw2vMXU5ioGPM0Wt8xIE9vUfWSyj9UNczXLTsGvozDwpSPMC3gIR0oZwss42O1ehpgBYuPIMAyL4ZHtxM1WpRG4VZOpCpR8fahYEqGnU8JZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BhLejjHzebkpeBB918wFBlMp1KJz6gj6pkiO9mSWBA=;
 b=ORjMFno5zFs5oCPg0yM8seOe2QFWiO02ROAAtv12FN4PP0p0QFAhwpt5tvhq7n4OdPOmzFqBUCeByTP6XTZV537zhSLb3NvL7ASG1kpSf3CQB1X+hOL/ckUB9ygER07AeE3Q38pdC+/OIltoV1XFOzWzuf1wngSNoAUQhHQHcexo03ZfR3YIvRJYT6JbFpSK7Q+yeRzVEeisMmxNtS/s+fw6iswA5VwELE7RQ+Vqctahz4eHK6AETf4pjNtbBpBVZlslmPJ6PPcjqRZfOHJIC1FDkBmuUxdxz6eJKmoHdCXghSpNuzNqc4sx6bvw8rIkI/WJ+omgc0OQgICswaUP3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=protonmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BhLejjHzebkpeBB918wFBlMp1KJz6gj6pkiO9mSWBA=;
 b=gTz7XHKud6iu0rN+ZEwTP7Dpj7ViBD+Ef6V+37mX2XmEou72Ns2igUjSjGDJozX0DCOHiC/Y67cuKNqMaDXhicf/wuEOzMoHNux5yn+DwKEfcmnrHeUEPyalXsaKwjr0txZJz5ro9c3mmc42gSshZHlXNY45PeOUBf7FsbSEGYPhD1JLnCJO+A5KY9AwnVLq2Dcjp4BI+DxPziNGnO/9Rj6fMZXJfvds0CIxKmhErLtFOapyDbDQfVW5WdNvbEe7vuk3+1nM1baou17/XmpfaPoFoJQkptKF39RxuJCcaPviT0u2nmeoaA4iCsUCyTbpPyWKiZ722e1G52Rruqsxpw==
Received: from PH7PR02CA0012.namprd02.prod.outlook.com (2603:10b6:510:33d::12)
 by DS2PR12MB9775.namprd12.prod.outlook.com (2603:10b6:8:2bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 09:59:43 +0000
Received: from SN1PEPF0002BA4E.namprd03.prod.outlook.com
 (2603:10b6:510:33d:cafe::7e) by PH7PR02CA0012.outlook.office365.com
 (2603:10b6:510:33d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Wed,
 21 Jan 2026 09:59:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002BA4E.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 09:59:42 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 01:59:28 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 21 Jan
 2026 01:59:28 -0800
Received: from inno-thin-client (10.127.8.10) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Wed, 21 Jan 2026 01:59:18 -0800
Date: Wed, 21 Jan 2026 11:59:17 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
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
 Hindborg" <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 "Alistair Popple" <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>, Alexey Ivanov
 <alexeyi@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH RFC v6 14/26] nova-core: mm: Add TLB flush support
Message-ID: <20260121115917.73cfcc7f.zhiw@nvidia.com>
In-Reply-To: <20260120204303.3229303-15-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-15-joelagnelf@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4E:EE_|DS2PR12MB9775:EE_
X-MS-Office365-Filtering-Correlation-Id: fee268b6-aaa7-43e4-d889-08de58d3cc6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vxRT2M8s9l+u73JAASCw8kiQYktLr2/PLsIvrTlM0RLjsFEhMA9JktuUxY+O?=
 =?us-ascii?Q?uKdX13iCDnd06e0Lhk8Jmqe8zErgn4o8Ey6bNejovc7rTsckaOCvTdinfKri?=
 =?us-ascii?Q?KozYCPPrnGEZGR5FjoSOTKEKVsHVU2oWmZKWGJ2zmzxI2AoRfVjzsxLH+EK/?=
 =?us-ascii?Q?nKCUmYg/gq/y75nEJR6QtLjQW4WIZoEamUZD4yB8xLQWo0fSztsoVdkLaE2L?=
 =?us-ascii?Q?r2phLrkP4izO7c4ss9LuBSgzISwY/jaVnaBDGEwMFhfLb5Df6ghOVYDE3vqI?=
 =?us-ascii?Q?2yOQ4kfVu54EGhKURuWfwLEoqFUHzkFnhGEbSUqtzHWh2bWn+YaQpalMkRQr?=
 =?us-ascii?Q?yGman1io6IeBTrrkn6Rw2OPY1XclnuZningACB4zeBvWIGNYdszMitHEkkNo?=
 =?us-ascii?Q?BFu+ucIKnw8Wx53KyEi1Zqb1VSCtLOc7FNdkSzJIll0XzdwLxONHkJ2jE06N?=
 =?us-ascii?Q?v6obM/EQJHzo3BZJmkGkxTNKmGhCd6qVwnHpbDA+1Q7+as66OBuEHNYMtCJJ?=
 =?us-ascii?Q?2K1wCDjW6M6s2VfKTdAyWbADcl1X8FW8L0Crtfi0HEFh1T3lLPGaQA0q77vA?=
 =?us-ascii?Q?i7dijOJGP2M/9zvUy5kIfnRqv8zWumJQVGQVpTlClS3n32srJfEhAhwhYxh/?=
 =?us-ascii?Q?ikvwMEgph4Ne+Uo5J4pH0daPouIL5n2n0jZLExJvAUSBKobyINznD3c3HK78?=
 =?us-ascii?Q?oSShYo8grYtcVjsuz8CPiKAu7tYJvxOGKFfvRGgW/3HGn0A4BwJlN91BF6bp?=
 =?us-ascii?Q?6y1/S8eIjSDpvO+x39DF+DromnKt/zJHcLFN/EydO8axhusGRMh93zNe+cXz?=
 =?us-ascii?Q?3Vxa/wGUcu4DMz+Z4kykHwNUI9zWhs5wu1XS2sjvYhcRZ47iyhb0i/z8vltC?=
 =?us-ascii?Q?/vbhnHSWQWKThvheh2Cv9YWh/kfxLIqYl1X4/QP45OPVfpTdQ2SdwuYheIrH?=
 =?us-ascii?Q?HOitbiI9vqedoPXQOBNUmKFCyrmlODRESdz+ICfaf3zaL0D+YuA+RGiNs4YN?=
 =?us-ascii?Q?D34zROGPD7aZJyFsh4xw+Xo+fAJ69ISu/j+m+iVFuDx8JXhJC7nlqT+K8NS7?=
 =?us-ascii?Q?4rFtumBQl+zICbIkWwZFS95l4olhtM27BTNM9FAliPxheDza6r7/hiynbkjV?=
 =?us-ascii?Q?AfAPgGtKMgXNbbi6ivxZ6QMJABVsqoIBTHsZkMjm1A30EYX0RncXJEUyUCtI?=
 =?us-ascii?Q?0NPAlsobzCPZe3iGcJAHaSv2OFs9kkLd4TLxqQn4XyzOAfIDN6mC8WJXDsLA?=
 =?us-ascii?Q?9/TBpCBGbdRvg2uI57MmSPXns9JBMZk4w9pzzukxE1tAPjIx3gZs4r7rF8++?=
 =?us-ascii?Q?96GpYjsrESddClZf9ADVLU7mYYS9U+Hq0O8wLvFXfmsAQmHDLDxTOcFbcIhM?=
 =?us-ascii?Q?dSfcmIf4YKPkOFicTOWBmvVndiL27G1YA+vvTog/WNc0WlrrIpNb4YlrRVTF?=
 =?us-ascii?Q?/VD8SG+oyB55yZnjVc2Y51bau1IGUVVvKqcwDydnEAR/7506digH6UAjgLbO?=
 =?us-ascii?Q?JfjpyWfs3N0x+bBdZEPhmkmyA4wg6yrSC1gfgD2J1CoHi5eOHjcIOyUJ4iot?=
 =?us-ascii?Q?OuFzM1XOPNcRqDLZc4yf9CSer+upWQ5AD8aSvSkgdYy4kknoBO0QBDBVeSnZ?=
 =?us-ascii?Q?Y+5+duURztvbkJI6zEP03cGDB5XwRdMf9Yf2pEFv8EfO7SeBnQYpbmHyX9qB?=
 =?us-ascii?Q?k/FCmQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 09:59:42.3045 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fee268b6-aaa7-43e4-d889-08de58d3cc6a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9775
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nvidia.com:email,nvidia.com:mid];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhiw@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 3963B54D05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026 15:42:51 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> Add TLB (Translation Lookaside Buffer) flush support for GPU MMU.
> 

The same concern as in PATCH 5, guess we need to think of concurrency for
TLB flush.

> After modifying page table entries, the GPU's TLB must be invalidated
> to ensure the new mappings take effect. The Tlb struct provides flush
> functionality through BAR0 registers.
> 
> The flush operation writes the page directory base address and triggers
> an invalidation, polling for completion with a 2 second timeout matching
> the Nouveau driver.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/mm/mod.rs |  1 +
>  drivers/gpu/nova-core/mm/tlb.rs | 79 +++++++++++++++++++++++++++++++++
>  drivers/gpu/nova-core/regs.rs   | 33 ++++++++++++++
>  3 files changed, 113 insertions(+)
>  create mode 100644 drivers/gpu/nova-core/mm/tlb.rs
> 
> diff --git a/drivers/gpu/nova-core/mm/mod.rs
> b/drivers/gpu/nova-core/mm/mod.rs index 6015fc8753bc..39635f2d0156 100644
> --- a/drivers/gpu/nova-core/mm/mod.rs
> +++ b/drivers/gpu/nova-core/mm/mod.rs
> @@ -6,6 +6,7 @@
>  
>  pub(crate) mod pagetable;
>  pub(crate) mod pramin;
> +pub(crate) mod tlb;
>  
>  use kernel::sizes::SZ_4K;
>  
> diff --git a/drivers/gpu/nova-core/mm/tlb.rs
> b/drivers/gpu/nova-core/mm/tlb.rs new file mode 100644
> index 000000000000..8b2ee620da18
> --- /dev/null
> +++ b/drivers/gpu/nova-core/mm/tlb.rs
> @@ -0,0 +1,79 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! TLB (Translation Lookaside Buffer) flush support for GPU MMU.
> +//!
> +//! After modifying page table entries, the GPU's TLB must be flushed to
> +//! ensure the new mappings take effect. This module provides TLB flush
> +//! functionality for virtual memory managers.
> +//!
> +//! # Example
> +//!
> +//! ```ignore
> +//! use crate::mm::tlb::Tlb;
> +//!
> +//! fn page_table_update(tlb: &Tlb, pdb_addr: VramAddress) ->
> Result<()> { +//!     // ... modify page tables ...
> +//!
> +//!     // Flush TLB to make changes visible (polls for completion).
> +//!     tlb.flush(pdb_addr)?;
> +//!
> +//!     Ok(())
> +//! }
> +//! ```
> +
> +#![allow(dead_code)]
> +
> +use kernel::{
> +    devres::Devres,
> +    io::poll::read_poll_timeout,
> +    prelude::*,
> +    sync::Arc,
> +    time::Delta, //
> +};
> +
> +use crate::{
> +    driver::Bar0,
> +    mm::VramAddress,
> +    regs, //
> +};
> +
> +/// TLB manager for GPU translation buffer operations.
> +pub(crate) struct Tlb {
> +    bar: Arc<Devres<Bar0>>,
> +}
> +
> +impl Tlb {
> +    /// Create a new TLB manager.
> +    pub(super) fn new(bar: Arc<Devres<Bar0>>) -> Self {
> +        Self { bar }
> +    }
> +
> +    /// Flush the GPU TLB for a specific page directory base.
> +    ///
> +    /// This invalidates all TLB entries associated with the given PDB
> address.
> +    /// Must be called after modifying page table entries to ensure the
> GPU sees
> +    /// the updated mappings.
> +    pub(crate) fn flush(&self, pdb_addr: VramAddress) -> Result {
> +        let bar = self.bar.try_access().ok_or(ENODEV)?;
> +
> +        // Write PDB address.
> +
> regs::NV_TLB_FLUSH_PDB_LO::from_pdb_addr(pdb_addr.raw_u64()).write(&*bar);
> +
> regs::NV_TLB_FLUSH_PDB_HI::from_pdb_addr(pdb_addr.raw_u64()).write(&*bar);
> +
> +        // Trigger flush: invalidate all pages and enable.
> +        regs::NV_TLB_FLUSH_CTRL::default()
> +            .set_page_all(true)
> +            .set_enable(true)
> +            .write(&*bar);
> +
> +        // Poll for completion - enable bit clears when flush is done.
> +        read_poll_timeout(
> +            || Ok(regs::NV_TLB_FLUSH_CTRL::read(&*bar)),
> +            |ctrl| !ctrl.enable(),
> +            Delta::ZERO,
> +            Delta::from_secs(2),
> +        )?;
> +
> +        Ok(())
> +    }
> +}
> diff --git a/drivers/gpu/nova-core/regs.rs
> b/drivers/gpu/nova-core/regs.rs index c8b8fbdcf608..e722ef837e11 100644
> --- a/drivers/gpu/nova-core/regs.rs
> +++ b/drivers/gpu/nova-core/regs.rs
> @@ -414,3 +414,36 @@ pub(crate) mod ga100 {
>          0:0     display_disabled as bool;
>      });
>  }
> +
> +// MMU TLB
> +
> +register!(NV_TLB_FLUSH_PDB_LO @ 0x00b830a0, "TLB flush register: PDB
> address bits [39:8]" {
> +    31:0    pdb_lo as u32, "PDB address bits [39:8]";
> +});
> +
> +impl NV_TLB_FLUSH_PDB_LO {
> +    /// Create a register value from a PDB address.
> +    ///
> +    /// Extracts bits [39:8] of the address and shifts it right by 8
> bits.
> +    pub(crate) fn from_pdb_addr(addr: u64) -> Self {
> +        Self::default().set_pdb_lo(((addr >> 8) & 0xFFFF_FFFF) as u32)
> +    }
> +}
> +
> +register!(NV_TLB_FLUSH_PDB_HI @ 0x00b830a4, "TLB flush register: PDB
> address bits [47:40]" {
> +    7:0     pdb_hi as u8, "PDB address bits [47:40]";
> +});
> +
> +impl NV_TLB_FLUSH_PDB_HI {
> +    /// Create a register value from a PDB address.
> +    ///
> +    /// Extracts bits [47:40] of the address and shifts it right by 40
> bits.
> +    pub(crate) fn from_pdb_addr(addr: u64) -> Self {
> +        Self::default().set_pdb_hi(((addr >> 40) & 0xFF) as u8)
> +    }
> +}
> +
> +register!(NV_TLB_FLUSH_CTRL @ 0x00b830b0, "TLB flush control register" {
> +    0:0     page_all as bool, "Invalidate all pages";
> +    31:31   enable as bool, "Enable/trigger flush (clears when flush
> completes)"; +});

