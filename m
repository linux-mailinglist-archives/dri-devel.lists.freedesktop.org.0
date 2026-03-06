Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oN4OLPA6q2mAbQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 21:37:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 631132278BF
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 21:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7710E10E3F7;
	Fri,  6 Mar 2026 20:37:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="O+PFUNd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2419910E3F6;
 Fri,  6 Mar 2026 20:37:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwD1Bh9uCL9N2XvrIJaCWJxXI+4E/XejvhxFpNYBOuj8+ZTnMPG0ewB+fbAfaF6oiXovMhbg9orOkg3tqaOxnTxe3No/GmethAOKgVP+W0m8sKeXj3FVPerrQTh1kvfrPGTKI5GuFpkSBip2dFbWpFK0ia9lvE1xrHNgNxHQY4gZqjphj4QqsfqztmQlIqrlnYE2ECPbi6KqNiVDPdVwrg8K28ffRpeZqM9904qQRhZ9KGgRpNJmx9pm4mPLaK6nFYk/1W8rSwtJeCnUkyZxRELoR9LyY2GauyPvlrrW7+r4Rl75ZSU/1LzVnehjDopYvphFEZ7puxtl9pHnvLLxmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2XNkb1D12AsW3gTS+bYnTkPz1ejCDjzZVfRD0TfyXaM=;
 b=N8DaETYHVWope3d7kqwQ8mIE/84+uWABmfX5Vq18Sn2DU5A69GXjGJetvRHSqJnjY6tS+p0JoQJTpjmJQ9vNegVaalGvx5R3X9wzgHlFuSeiPaJHK1eokJ0mSkJUo+q2iNf7wwTK5RIdT8/v1hpA4PO2dXRlW45zdxBfAY/oe7/IVC3rgpVgACuIYDC3lENzxXPAdyBl+E9l3Zuoej3AmO7xCC0Xy1IDxmNDOj8NHZV20aUvuUxFM4QBCtEb5395HET07XHedUbxXpWjLGoYuHUIPd82xWkgw5Kz5neuIP3MN2fcUiKjbz+4Ts54mcw1gqhNsr9HLvDWfsbUOyhmMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2XNkb1D12AsW3gTS+bYnTkPz1ejCDjzZVfRD0TfyXaM=;
 b=O+PFUNd61PUz7HkDcK6hexVEzIMTTcv6FJ/8kcFonXt/NrVvE+3dglY8VABRhxBIDAlB/Deg2fqRQnRHQaUGaL3j/U66Dm7dAxkEYndm7RpNd8YLfSHM+5aVmQlRRZUd+cZxyFuoGA26esxbW3320uMD6PU5bl3TSLpVZYdn7sfiHYOdKzWRRAuPfhDXVu68U/o21JjDB1Nhxi+Un/kYjRA0WS1/FpV+nBEnlYDPvdz37RYThl5FCVcFX0K+9W2JbzjJqqgZJhhqwy3RlA2W2SJ4C6dUB1LuX/p+GrrzIhEF1sVwqaQ+s9c70O9/kV0gJv0ElJaqeanurS+2OT9xcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY5PR12MB6528.namprd12.prod.outlook.com (2603:10b6:930:43::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.5; Fri, 6 Mar 2026 20:36:54 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 20:36:53 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>,
 Nikola Djukic <ndjukic@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>,
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
 Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v12 0/1] rust: interop: Add list module for C linked list
 interface
Date: Fri,  6 Mar 2026 15:36:47 -0500
Message-Id: <20260306203648.1136554-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYZPR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:930:89::9) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY5PR12MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 60e1cbc7-a73a-464a-7c13-08de7bc01a17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: TEbSWHHTto1pZmxh74cjjskEnuxjaM5zFabi7UTPXoeDUGGwDZgUTTrsyEK2fB4tFez6jiUZa5i0G2sc55KpgOehRBq5HObkiROLX1ZUVojL27wdWpY462pQpJEcgIM65N/AcHt+Yan4Dh7drBqpo29BHYCqF7GmqSMevLMUydAK/hzbIzxosV0nKNcXdopRpO083ZrvTSxxWwYIJyzuGYKhuCr2ct258E2fr1zhmU7Mh+rFjz+hEW6Ry0v++C6e4Uii5mz/Eq1MRfQbHWGo2b0+1Tmeb3h+4P9+OSBGvi9S0xLWlArBWonXFBxQx3aBSZ1m2bLmuZTkrjCZSKOrSkbQhNMwZDHqnJpECaIFUlV8mzbhAjkgu8UI93hzMwaLCXSzRYCcsaXejnw7w9kgJhB5NjYmIfefsCrjii0o/9Hybg9uPIB1f+FPbHQmqjE9gq2MJy7cSNR/ycLCeyQVW4Lvjk6jwBDTsbBggY6ADzHgoBnZHIwjabHcrMcCoWWmwK0c9s3o+eqSLEZkIFIi+lO5Lo4AtG0VO/rXYj0njRPfztLHYDjAV/t/J05Ghk2QMHvMntv4sxZOX2fkgKfcy1vk2mPOjr8JgoD+h03GvbcKZmeUk/kO32EWn+L4qyQbGNCBVjmOn5QSNZPoZ14+N16krV+IpHYL5jnpih4MPX1U/rOKfMDy1Ycccwo28e5mJ1LscV4TzyHoRnScRSSS86rTjbUu/emPYiCkLskmhzc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zbYKxRLTCTAbMsxglHq3g+raF3LFFskHb4VwLuNOWeLrRo6azNtbQBBe/anf?=
 =?us-ascii?Q?8GqVNYmU2Epjn9VcWoz9ZMH8BEwGrtuo39VXRWqHOHZBA7HCvFKSWFtzNult?=
 =?us-ascii?Q?ZWWHKwHnNFMM+RFx01vvzScwEahz9389u8al5EeVU3dQ5bwiyD8tV/A8oA95?=
 =?us-ascii?Q?g7tjQjHNjJcpwpouoFUcGjQFI3voPbsUnlR2l5Ts0vFJRRwe4KD3MeC2Q20L?=
 =?us-ascii?Q?qlAUH0zOC7/v52tWgdtHfnz+B8+VaMGAEGcTzLEjWTdNQNWR4ajsyuMxIi4h?=
 =?us-ascii?Q?pMrk5ufVZzZ6NNWQ/6pv4xO6aYhvdO+R/FUBhpYJyEf70PId4L6FDF73En78?=
 =?us-ascii?Q?gnnYqj7jT7lDE6LAY5HQ50/3VmZAdf45ZtNl6QVgC/XX6dFBloruAuhnRYZU?=
 =?us-ascii?Q?xM6eCI3wdg4mMZJZhg5EdP8OhTnaz47gErmhb48Lynnx2kOArRxBHb5VR6sD?=
 =?us-ascii?Q?J2emJ3aynH2XRNW4OjUBeg9mGN/xYeL2SK7K88IE3CjmDUTKcz1faZQLdY4s?=
 =?us-ascii?Q?cilfBwj6FxK8YEHu9Qk3HJbOXHFDfgjlixQ4GMDZG/SPmAcgrrw321e/TMCG?=
 =?us-ascii?Q?SAxt3rpnmcfgq33RdDkVbeBJFhEL872WN755XRGziJRXUqBU6gAPnrPoxB8f?=
 =?us-ascii?Q?AJSM5bpqWeFEsuRo3CEqQYB7IyeqWmPYWE8P8xLnfndGlpSj5LecbFIke+Rj?=
 =?us-ascii?Q?iBAnjYlfSOF98FIfUf4pxTzK9FrDzvVtj/SjXpmDatuCORDDe+9K+57WLdzj?=
 =?us-ascii?Q?KG2x8GlF3wobufACLoldqybIzHF1pmQQAJnM1GO26eNHQTNF0v+GABtiDWct?=
 =?us-ascii?Q?b5Gzk8MNuUs3fVJJmRY5H9QEPLMIsn75GYNE0cwKvV2cJM2b6c21P+5HQe2Y?=
 =?us-ascii?Q?ZIm/whwh5PiShq7KoI6h4EC5uVQ+szkMaOtEku0qAf55Kr/bffLBKiW8JVUk?=
 =?us-ascii?Q?uP4rjFb1gsWlgY9sQUQ7dkCjvEFvzjGwCrJR7BdP6VnPssgIfNtFCRYcfD+4?=
 =?us-ascii?Q?uqM5XI3gxpZ6i/PkLM2N7CuIEVnW+6borGFMwkjSMUhijeMb4i/uRZIm+zG+?=
 =?us-ascii?Q?ebOEwNZ2FhXz1Uo2ug4TDMhd6dYfT26VolW/9mmQMQAu/f52RyL9DvD7G2sI?=
 =?us-ascii?Q?8MG2HDxmNgmV8gLjkHohA4fTw2GnfupgjZhhttCMx5hXGpOndPuvOM1Sisph?=
 =?us-ascii?Q?KAv+5Ha9jezXug8rUcdtlJwC6fyv3UXo1NxORtoPmd4H5UTgOHUzO6As8niP?=
 =?us-ascii?Q?QSYO8mso2X7syv+hB3QsYTJn6LUupotOGP/UkXOEH6ZLUtjVPWmIKAhfi1BF?=
 =?us-ascii?Q?hh+t7WPkfq7RCbipaJj2wsQU75qishyVTcvJTGHc2oqCT2deDTeK2BS6TlIR?=
 =?us-ascii?Q?9Kpku/gCGueMDnMLPgACOn845JB2xsKfWmitMoflkWiE9zx0bwwZWXsdKLUu?=
 =?us-ascii?Q?uxRIyaN/FpBUZm+o4o6rJKz291193tptjcHx8BpkGED9MQN/t5m5L+tjqBCe?=
 =?us-ascii?Q?d+gNhcy+nNzwXAAw+9xMvO1VrmpfYA3HIPL753XTIpYvnz7fbEeUhuY1qiYE?=
 =?us-ascii?Q?gPg/WbJV8TYw43gGGhVtgjzzl47U5BHAGBvl6lB1CrER1J8ev09LkUbM4EKK?=
 =?us-ascii?Q?0ADs2h9CPbnYamZqmp12ThuTLNf1nLjT+NoivEogIrmJwn5GNbh7LQn8zwL/?=
 =?us-ascii?Q?n0+VWvbyOTIA4vlTwpFvWRRqnZnAa4AQMzzj4XhbnvDgfIMGqvhci4IzsPlT?=
 =?us-ascii?Q?NxTbfHngVw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e1cbc7-a73a-464a-7c13-08de7bc01a17
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 20:36:53.8106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IjuXA6RBy5zzUFBU31/2jZvp+WyNca9gg/4Kik6lQDVf/NmTE7knCybeEq4zKn8nYa9qjf/9MlgaO3HTlpTKGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6528
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
X-Rspamd-Queue-Id: 631132278BF
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
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,gmail.com,redhat.com,linux.intel.com,suse.de,ffwll.ch,collabora.com,nvidia.com,weathered-steel.dev,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[55];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

The interop/list module provides Rust abstractions for iterating over C
list_head-based linked lists. The primary use-case right now is iterating
over GPU buddy allocator blocks.

This series provides the interop/list module required for GPU buddy bindings,
which is inturn required for nova-core memory memory management. This patch is
being sent separately from the rest of the preparatory patches (DRM buddy
movement, GPU buddy bindings, etc.) as it can go in independently.

The git tree with the patch can be found at:
git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: interop-v12-20260306)

Change log:

Changes from v11 to v12:
- Renamed module from ffi/clist to interop/list, reflecting community feedback
  that 'interop' better describes the purpose than 'ffi' (credit to Boqun for
  starting this idea.)
- Updated MAINTAINERS entry from "RUST [FFI HELPER]" to "RUST [INTEROP]"
  and updated git tree reference.
- Added Acked-by from Miguel.

Changes from v10 to v11:
- Sending only the ffi/clist patches separately from the rest of the
  preparatory series, as these can go in independently.
- MAINTAINERS entry: Renamed from "RUST TO C LIST INTERFACES" to
  "RUST [FFI HELPER]" with (CLIST) scope annotations for maintainers,
  following Danilo's suggestion. Note: There is still an ongoing
  discussion about the MAINTAINER file entry naming between Miguel and
  Danilo: https://lore.kernel.org/all/DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org/
- Updated clist.rs module documentation per Danilo's review: generalized
  the FFI usage description and added explicit note directing Rust-only
  users to kernel::list::List instead.
- Implemented suggestions from Alice related to safety of CList wrt
  concurrent modifications.
- Removed unnecessary trailing comment markers from example imports.
- Added feature guard for offset_of_nested (Eliot).

Changes from v9 to v10:
- Combined clist/ffi patches into the larger "Preparatory patches for
  nova-core memory management" series (8 patches total).
- Added new ffi module patch: Convert pub use to pub mod and create
  rust/kernel/ffi/mod.rs to host clist as a sub-module.
- Moved clist from rust/kernel/clist.rs to rust/kernel/ffi/clist.rs.
- Added Reviewed-by and Acked-by tags from Gary and Daniel.

Changes from v8 to v9:
- Added nova-core Kconfig change to select GPU_BUDDY.
- Minor fixups.

Changes from v7 to v8:
- Various changes suggested by Danilo, Gary, Daniel. Added tags.

Changes from v6 to v7:
- Extracted clist and GPU buddy patches from the larger RFC v6 nova-core
  memory management series into a standalone series.
- Changes based on suggestions by Gary and Dave.

Changes from v5 to v6:
- Part of the larger RFC v6 nova-core memory management series
  (26 patches).

Changes from v4 to v5:
- Part of the larger RFC v5 nova-core memory management series
  (6 patches).

Changes from v3 to v4:
- Combined the clist and DRM buddy series back together.
- Added Rust bindings for the GPU buddy allocator.
- Moved DRM buddy allocator one level up to drivers/gpu/ so it can be
  used by GPU drivers (e.g. nova-core) that have non-DRM usecases.

Changes from v2 to v3:
- Consolidated 3 patches into a single patch.

Changes from v1 to v2:
- Dropped the DRM buddy allocator patches. Series now focuses solely on
  the clist module.
- Dropped samples and added doctests.
- Added proper lifetime management similar to scatterlist.

Link to v11: https://lore.kernel.org/all/20260224222734.3153931-1-joelagnelf@nvidia.com/
Link to v10: https://lore.kernel.org/all/20260218205507.689429-1-joelagnelf@nvidia.com/
Link to v9: https://lore.kernel.org/all/20260210233204.790524-1-joelagnelf@nvidia.com/
Link to v8: https://lore.kernel.org/all/20260209214246.2783990-1-joelagnelf@nvidia.com/
Link to v7: https://lore.kernel.org/all/20260206004110.1914814-1-joelagnelf@nvidia.com/


Joel Fernandes (1):
  rust: interop: Add list module for C linked list interface

 MAINTAINERS                 |   8 +
 rust/helpers/helpers.c      |   1 +
 rust/helpers/list.c         |  17 ++
 rust/kernel/interop/list.rs | 338 ++++++++++++++++++++++++++++++++++++
 rust/kernel/interop/mod.rs  |   9 +
 rust/kernel/lib.rs          |   2 +
 6 files changed, 375 insertions(+)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/interop/list.rs
 create mode 100644 rust/kernel/interop/mod.rs


base-commit: 877552aa875839314afad7154b5a561889e87ea9
-- 
2.34.1

