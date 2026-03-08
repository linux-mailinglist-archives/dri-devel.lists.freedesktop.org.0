Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOoNE0a6rWk+6gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 19:04:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD86231880
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 19:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773DB10E0AB;
	Sun,  8 Mar 2026 18:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UoipFnRL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012044.outbound.protection.outlook.com
 [40.107.200.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 705BD10E06D;
 Sun,  8 Mar 2026 18:04:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTurcWn75uGAN4xKlcN3Y6EP0Gr3DBj+edhp8D8pxF7Hj1ZlLqEiQJJ+TVg/dEWfk1ugKAOB0rcEvU4Vbx4rZbVMmGizQPd9/EhoNnE3GidueqBeeDqFre/GDwpHD5JXNzQhkdL9JTS7RDJfbveH6EdeNZI6f4QPofRP2WXJK700BFnU3mLCw2zrJvsef/7hzPffCUFMZCJqanpIvTG8qDUZeuha/jVcMLJA3z3TX3iM6eLVkHFEefvc+qRHipv1TnMA24mBkn/syIixfWgEinYtx0D0ghe1vaTgAdha9ij1w777lCi7JJWMuSrdPBAdJYt8ubcsCKyQrjopLwXKpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vm/yi/B0SiRtuoazW8QXTYVEUol9azZQQ9DlDHCtI9o=;
 b=l2hUmVcfIQ3bw3X0OtNzKHZvV9SRb+knFEmjq0OnBnDGlP/MmVVKqaIexg6M7t7R6iCde3Tu44NVNR4OU1ay9Ramvey9g/Xd95i1OSiEZ+qqAeBVhnJBAVz6/si26gKgdwDBZIutIHwLpgi09JbGEj8xj2rzShIB08QtQMtC6EEX85LzVm1gNEKF7uQxEBZO7v/RZvdGCRu92FhqzwHas6orydisNrWhdCD0YK+Q5c7MTfN0RF32488YQNycHSdQtjuVBE3+rphx1jMDaA5o6Husi9/w/IR9RnNKP9Ev2ltekXwTENaOawD+9jkPxM7+qAYPJGjJPLd2A2sNUefKXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vm/yi/B0SiRtuoazW8QXTYVEUol9azZQQ9DlDHCtI9o=;
 b=UoipFnRLQ+35ExOWmYPc1hgryO1cijMGEtbSNu/Fwq/uwvLPp5bsFkX5gdOyDElrzTgbZRw3j2Navzl1/r+ucuj0NmvqM25yrpbIMjUOZXhAtGDgQPGHHcXx4vgYfdQfC2uBm+LWg3YmPRci5WI3tz43dp6W5mj7WcFmykmzU6eWivXNgLNFqtcVYJgy56C3urxNU2AVTmPLy10hHUMyaxvP0IYtn9D3XOcxUAYVhOxgIsFaeAV8e5i+Kau8B9cMNGrpaAQEvYuKMTacdE6FS1OfDZA+dF4Bp0neK2mooyBVcmXTCYwY8Gfn/1fYJZ8ojtXvdwdR0uV/5HJ/FX9RpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS7PR12MB6022.namprd12.prod.outlook.com (2603:10b6:8:86::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.9; Sun, 8 Mar 2026 18:04:37 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9700.006; Sun, 8 Mar 2026
 18:04:36 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v12 0/1] Rust GPU buddy allocator bindings
Date: Sun,  8 Mar 2026 14:04:06 -0400
Message-Id: <20260308180407.3988286-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY5PR15CA0145.namprd15.prod.outlook.com
 (2603:10b6:930:67::13) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS7PR12MB6022:EE_
X-MS-Office365-Filtering-Correlation-Id: fb8aaf5e-a432-47de-a243-08de7d3d28d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: YrplS0I3IVIn3sX/Px231fd2NQsiXjWtpWrFoItTyMADJEjf6P4ssO2hL+umywd46itnQOTyrkObhNKNFTSlDY9pFP4Y3ZxiY1Gvrhd89J/DHxvbYNTTlXjy2jk+GnMiJI0/4WtwuhinzW1AdpIaN350rZlONm6VcuVcQtPMrXY7gCt+kyoe0TzF37H4oAgN+P4A/QG1f98tlgepMgG0I4L+pE2g6Ixpak2oqdV9HTzy/gRSdTBxsrvpPE0wGaHr9ytuxORe9nUJdDnrd/+B6CfHl8dRrR00T6AiVv5b9TuFw/+NXH/9mDD3batvBIlILUZtWacv92MNF98swvB09pe40js5c+g4rFKGdPJcbXlHFG2gOgbch34iHqhL+UPJYSuDVoM6P01CPVZdi02FOUnXUwcDOTXnevPHLXzNVPQF+0jg7nLdJWC1upKatdz8utUVxktleXgN50wRa6t9cv83VreQTrywM4b5DdlKZcQ3BSMcL0U2aKYTdx0ojXa23LeHYEj4d9x8Htl6HY8s7Gtl6IO0NeqPD/yq5KUiu0x+VwTUNFK49Pk8aL7qHv//PpBSE8HMar06l3GMxHZ1XCoAIBpy5gZawvnqLzT9YFPb7TlU/KSaccsSjdKzo5kaUm2TKfLu+ntvj6kZrGGh+o+ATR+nY+slO4XT9uLThsWuyFkwcUYAgo7SFPNPR7eZyLMw3kWZk2TGsrjoBkwU4Sxm3y+N6yx5LjxyU9h0FGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?stwp3e6ORK8sFGXA+zyS37dS8a6iIsHOLmjL6478v5zV8Kx9qXh6lq8fINKQ?=
 =?us-ascii?Q?NQPRaL40wykV5gndLQ09ffjCteujswDw0ItSDxqOgWB0rxmYLbYKCTQN5k56?=
 =?us-ascii?Q?bGMTdBKDeI2odhftWnog+UKzoS7IYmgx3qWCNXOB8zw75sQUJljG5J4dzMBs?=
 =?us-ascii?Q?96A9Zz90deBPXjQiZi04aEEUYtoVKi9ZSjYG1BhjnwWAHk0nI1fgO833gpIj?=
 =?us-ascii?Q?acLOE3PxAVEcP5A1vq6VunIOHY/W/hnelbja1plwsSl4pFOG1HveBHFuTNrl?=
 =?us-ascii?Q?NUcgdCMZTfnzoTMM9VHhvuFYL++1MPhuGzCGpl0C4XXLao/krXuIi/Adl2bC?=
 =?us-ascii?Q?Jbd1FOnURmHcup3AudzZx/w1LKnxNEGXQyTEFA1I8uHEm0vtEmbNTtoCAHPx?=
 =?us-ascii?Q?zT4RnbsoN1euf2Ov4A3jNY9rCHVf3sdqwRv7f59rPNZZBt9dofmNonmxbSuN?=
 =?us-ascii?Q?XKxNcMgYYzkM31Xvvh/vDSVMNINg7pETMgJs2lYqXpcpfZbhVXWXAKh6lPOu?=
 =?us-ascii?Q?omEkqqrOoA+8MEnjHGguG1JwaSnfDj6CpOGOEYZczxTWZuc2RpUvf+h6bfF8?=
 =?us-ascii?Q?QVrsIkRcwA90siciZUCO7qzEwkdEMyEJSz1berP/tHuowy/7p7HjDhomCnm+?=
 =?us-ascii?Q?65U0lpZETIKz3fR6QGkPfMURtc2vntipY1nazRTtEbaQMuzbkuwS4SZxmf5i?=
 =?us-ascii?Q?oozSsgNPLJ+dEGpGk3VAon+d9fUxnTrnZed8Px5Tvq+K/ZNXdk9RTUjNb8up?=
 =?us-ascii?Q?qW5iJlRcBZArSnqi2EVIugXDHOLtGXyFmRmA9q4uhIySYWnDfCJYNV9uZiTE?=
 =?us-ascii?Q?J7AehoFltWaoPbBPCW5cIbQchdvbnZZToFaU3MwQHvouvUC5zN11Wu5q+lnP?=
 =?us-ascii?Q?uyFpRcy1PAYFWjSTKlgsAWPfDXF2c1fsWnXQTIQ2dYcHU3hzfTcdxjFwmJJa?=
 =?us-ascii?Q?AWO9IOhR0eOHI6cuxEsaoDwbVF+Llj7VUns7sfWjMAy4fA8aw+jm1SesAc7B?=
 =?us-ascii?Q?Al5oe9kAswNemizANziNpoUig4LG26iU6sH9ymNWzTDzhBvDgI2tQ0LJSCNn?=
 =?us-ascii?Q?TT4+0Vka8YrrJCNIjXIBJtaM4T/FIPJMPkoQ30DuJhQdD2+1ZklHB+E6jpzN?=
 =?us-ascii?Q?eySZXawAHJIqHWcUwPcxDvcJkrqq3bSVp2G59rvhYnpP1p8QLW/coRkLF9iK?=
 =?us-ascii?Q?w8TYL3HOCwCiJ4S+xQCRKzGBTsgkeyPqkszca6tgba+inunCyv28luhkPEUc?=
 =?us-ascii?Q?MRCvCBKny9mVcAnvYTqltodJb2D++8VlalW5sPu5kO0OywHIB42/DIQLezP4?=
 =?us-ascii?Q?8uRuCdGNFRfdwBl9Pmaqawm1ZuLdJMHc5QsZAaqhm6mehX4gFTRpuXNiMf60?=
 =?us-ascii?Q?wobxRIuK32S12ScSLO+B5ihTR8bb7efTu5u+87zcpYFtn6KpzGIrpazq2qC5?=
 =?us-ascii?Q?qs/3mZR0cbPU49opK5M/7/+uYAjJoR2PqxHOD6z8ZJhayIGpCcO4VXxLlrAn?=
 =?us-ascii?Q?O62B0WmCXPNN+Sh2IdHrTPaknWFT6UtXdTxiILb1f/ml571uXi3jrrCGqH4m?=
 =?us-ascii?Q?v/RRHWbJu0HIWzZSdptjJUBUMfVAjeXO7u0tHpeFMHp4J5Ibe00aPct/3cNf?=
 =?us-ascii?Q?JOAv5AVtTCFy697f52aY8Q8qRLb6pnS+7Gaib1LQ7h5lFt5y0BqepkkaxjwM?=
 =?us-ascii?Q?R9D66jgQWr2EpvisE0+OUhf2GuFl5PJAKakxEBTg+YzXX85IfD/OsVqbdHDx?=
 =?us-ascii?Q?ArIXY9MY1A=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb8aaf5e-a432-47de-a243-08de7d3d28d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2026 18:04:36.6408 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ElYqE94SjxhkWdd+DDv/YuyXP9TRt99RjpajKVWl6sfJRqtoYRc3/u2jhazOhYu67JFiBE4KKr5ycR5UC2Rkgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6022
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
X-Rspamd-Queue-Id: EDD86231880
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,vger.kernel.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[57];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

This patch adds safe Rust abstractions over the Linux kernel's GPU buddy
allocator for physical memory management. The prerequisite infrastructure
patches (DRM buddy code movement and the uninitialized buddy fix) have been
absorbed into upstream -next, so this is now a standalone patch.

The series along with all dependencies, including clist and nova-core mm
patches, are available at:
git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova-mm-current-3-8)

This patch is also here:
https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=gpu-buddy-bindings-v12 

Change log:

Changes from v11 to v12:
- Rebased on linux-next his is now a standalone single patch as dependencies
  are absorbed (but not clist is a prequisite)
- Redesigned allocation API (Alexandre Courbot) for better Rust ergonomics.
- Split single long example into 4 self-contained examples (Alexandre Courbot).
- Several safety and invariant comment changes (Danilo).
- MAINTAINERS changes (Arun, Mathew, Danilo, Dave).
- Fixed `#[cfg(CONFIG_GPU_BUDDY)]` to `#[cfg(CONFIG_GPU_BUDDY = "y")]` (Danilo Krummrich).
- Updated `ffi::clist::CListHead` to `interop::list::CListHead`.

Changes from v10 to v11:
- Dropped "rust: ffi: Convert pub use to pub mod and create ffi module" patch;
  the ffi module restructuring will go through a different path.
- Dropped "rust: clist: Add support to interface with C linked lists" patch;
  the clist module will be submitted separately.
- Dropped "nova-core: Kconfig: Sort select statements alphabetically" cosmetic
  patch.
- Patches 1-3 (DRM buddy movement and fix) are included as reference only;
  they are already being pulled into upstream via drm-misc-next.
- Removed clist patches as those can go in independently (Alice).
- Moved the Kconfig GPU_BUDDY selection patch to nova-core mm series to enable
  it when it is actually used.
- Various nits to comments, etc.

Changes from v9 to v10:
- Absorbed the DRM buddy code movement patches into this series as patches 1-2.
  Dave Airlie reworked these into two parts for better git history.
- Added "gpu: Fix uninitialized buddy for built-in drivers" fix by Koen Koning,
  using subsys_initcall instead of module_init to fix NULL pointer dereference
  when built-in drivers use the buddy allocator before initialization.
- Added "rust: ffi: Convert pub use to pub mod and create ffi module" to prepare
  the ffi module for hosting clist as a sub-module.
- Moved clist from rust/kernel/clist.rs to rust/kernel/ffi/.
- Added "nova-core: Kconfig: Sort select statements alphabetically" (Danilo).

Changes from v8 to v9:
- Updated nova-core Kconfig patch: addressed sorting of Kconfig options.
- Added Daniel Almeida's Reviewed-by tag to clist patch.
- Minor refinements to GPU buddy bindings.

Changes from v7 to v8:
- Added nova-core Kconfig patch to select GPU_BUDDY for VRAM allocation.
- Various changes suggested by Danilo Krummrich, Gary Guo, and Daniel Almeida.
- Added Acked-by: Gary Guo for clist patch.

Changes from v6 to v7:
- Major restructuring: split the large 26-patch v6 RFC series. v7 only contains
  the Rust infrastructure patches (clist + GPU buddy bindings), extracted from
  the full nova-core MM series. The nova-core MM patches follow separately.
- Rebased on linux-next.

Changes from v5 to v6:
- Rebased on drm-rust-kernel/drm-rust-next.
- Expanded from 6 to 26 patches with full nova-core MM infrastructure including
  page table walker, VMM, BAR1 user interface, TLB flush, and GpuMm manager.

Changes from v4 to v5:
- Added PRAMIN aperture support with documentation and self-tests.
- Improved buddy allocator bindings (fewer lines of code).
- Based on drm-rust-next instead of linux-next.

Changes from v3 to v4:
- Combined the clist and DRM buddy series into a single coherent series.
- Added DRM buddy allocator movement from drivers/gpu/drm/ up to drivers/gpu/,
  renaming API from drm_buddy to gpu_buddy.
- Added Rust bindings for the GPU buddy allocator.

Changes from v2 to v3:
- Squashed 3 clist patches into one due to inter-dependencies.
- Changed Clist to Clist<'a, T> using const generic offset (Alex Courbot).
- Simplified C helpers to only list_add_tail (Alex Courbot, John Hubbard).
- Added init_list_head() Rust function (Alex Courbot).
- Added FusedIterator, PartialEq/Eq impls.
- Added MAINTAINERS entry (Miguel Ojeda).

Changes from v1 (RFC) to v2:
- Dropped DRM buddy allocator patches; series focuses solely on clist module.
- Dropped sample modules, replaced with doctests.
- Added proper lifetime management similar to scatterlist.
- Split clist into 3 separate patches.

Link to v11: https://lore.kernel.org/all/20260224224005.3232841-1-joelagnelf@nvidia.com/

Joel Fernandes (1):
  rust: gpu: Add GPU buddy allocator bindings

 MAINTAINERS                     |   6 +-
 rust/bindings/bindings_helper.h |  11 +
 rust/helpers/gpu.c              |  23 ++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/gpu/buddy.rs        | 611 ++++++++++++++++++++++++++++++++
 rust/kernel/gpu/mod.rs          |   5 +
 rust/kernel/lib.rs              |   2 +
 7 files changed, 658 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs

--
2.34.1

