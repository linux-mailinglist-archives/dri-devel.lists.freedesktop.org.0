Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mHsnEPU6q2mAbQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 21:37:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E06FA2278DE
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 21:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA8E10E48F;
	Fri,  6 Mar 2026 20:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eXSfqUdd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012010.outbound.protection.outlook.com [52.101.48.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1065E10E401;
 Fri,  6 Mar 2026 20:37:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHUXT+ER7C0VgvZu41Og3PucBHSEtYx3Fp5UfaJqVGnFDADl46xW9RIR5No8h/zxNZvtp6A4V6hCv0hHKAMUs0JanPUNJtII8lxoqv7IgnpajUilrMbnJKL+S9jYx2fsl2R/j6JTWZFO3lsOtOwhY1RuFs6uVKJJLqxqe/HTX2JbSENlazCIsMsTN4ShuYebKPq10B/25IlMBKY2JxeLZiKi1FWpuDy2AoruGRtDeo3PD4zdsvH9mEC+dnyLQvS1u0oI0Amv4AMLwo38V278t1LHOssX1hoZdpywWAeSVU1yv2Uro0IuDHLQBFfjM/ldkeoKYOOnZJHt1PN/bXqRnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PqwAtGr6lBx4Gr2Q5yfeZq1NZMiCotSNePc1frykR0Y=;
 b=HhYAlFrBrZ31qRR1Eo6vou/87VWxAP5Aje7JZ/UNshZeyDs3F3i1mdBJfNzFlzm8IJazk13xMH0FByHuVn2omUWLMq5Vx6ZmAllMMV0E0P6B/aLux6ddTCqoReEXU8/1RO7w1ziWIrNmLS+i0MMYMeUtma8jDwGTp6/HIYCuX5XHe+O03RAL+S4RyilcBLARIUvUMUSWw2og0VhOpPQwT3cfohheFoFs+0v8y6Uf+m5KwstIB6ZoDegtXs1gvbCz8CBKuA0c3eklq1GrRBlVBUhCnh7DZxbYeEEhG26gHUWY3WSk/UqSwkjS7P++hBFinPEHhcJj8HF8DI67xbwUwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PqwAtGr6lBx4Gr2Q5yfeZq1NZMiCotSNePc1frykR0Y=;
 b=eXSfqUddpIrIz5f/ZqfAyQjRq0LuFy8DkHM0htXKc5Oa5ki7KCvHeuH8ya5ajqETmUEc9DkG+nLuc70YQPNMTXHN1v5puLheu0NlE8HEZ3efMa/NtbhdeVn5ErChvdzhjhvUjQq57O+rUkgozmbY1UkmhCkchZu0X877z5nBoebHd/lV+MT8QEefSxwFRc0c3cWmBvbIrhPzFAJLkY5PBS8PNlI2TPYLkagqpa3GhFj4g3HcxfLo1Vr4tZrRhNJrxIDc12z5R3psuJ5X/6NuG6MSsc7AzXoj1FXnp3tZskbtXRcEH0jYsH806P/FChemFB5YqtpeD0i6EcWqR8Ngxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY5PR12MB6528.namprd12.prod.outlook.com (2603:10b6:930:43::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.5; Fri, 6 Mar 2026 20:36:59 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9678.017; Fri, 6 Mar 2026
 20:36:59 +0000
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
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: [PATCH v12 1/1] rust: interop: Add list module for C linked list
 interface
Date: Fri,  6 Mar 2026 15:36:48 -0500
Message-Id: <20260306203648.1136554-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260306203648.1136554-1-joelagnelf@nvidia.com>
References: <20260306203648.1136554-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:46::10) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY5PR12MB6528:EE_
X-MS-Office365-Filtering-Correlation-Id: 91786a50-36b2-4347-fba4-08de7bc01d8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|13003099007; 
X-Microsoft-Antispam-Message-Info: V0hPppVDtt/CojlPl5X1ldVCPLMgXzWlBd4bpYD/u3eJx1hgGtD/nXjPVljQZkwg8fq4b5uinTxjKyvU8OI1s6yh16envCBxMXSefTVmql6BW7qrTnUTtYlTiO6JfAJ+3fNBJUMoECmwjhMtSQdGRoQgZFH2q+5W0xstZD3BrWFkMBuf4RgdPTPRG8DWTo4SxCBWJpvGczD8mY2oyFyJoIIvvWBUQShkjfxXp0QcrACn0E68AlewKqGeumoOWKKJoXkj3YYGz/vsIsLHcm+ctTj5gllNYuf17Wr+Wn+ZT1XrZGnnXze/b63Q78MOaosI4w2DsYp6/hRXtbkQtMsiY576Fc19IQVNqQXdN4GiyRmYVAmM81P6oe//oRowQsiRebF8UOFNsMdfGcx5bD9Oqu6hmPMv5ZmZREInlcuUGWHrqjd5FLll526I7SNo1w/I0rGl4M1FTatDdMMnFuIG9DfnCxRxQ4OKnfeZlVctLmcptDvt3FurCdntm/wIMtNhY7wF8lmGiqN5eWpagmXJMYWLFPM0TlEiK0vuA+HkXWiDKpxPkSLWNrH97VxTZs13m+RkHsKkDzriMhznBwaSdveF5m0OA24PBR136eZEh74+b2X+tfbu6abps4tQ+Pl45Z8LS24rZpcyxXDaWgGSQPhgx5BUnSZjflUnDlOTq/GiK36U66+gWivDbRuNBOpsvBLEsxBzeEhKEMykXD6TSOljWHU8OXNo+VaOmv4NvNA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QcTHCMLc7YqtQ1V3puUG8lQqRyC6hGaE7sQaqn5bK1u6bLCpHpa2lyWRHBTG?=
 =?us-ascii?Q?u4CawUd0H8OW8d0OboveuDNkocq9pOXGE+Tdzqqaaz3gjjDn1Jw4PxqpY2eA?=
 =?us-ascii?Q?5LpsRNscycqo0H8esnXZPCo2F5ozByO18JJN2t1JKgOKMOFuENC8cIO6wIAJ?=
 =?us-ascii?Q?0W+ORa0astFxtlA5yTwPy2FM4CMe64C9FWKfUq3K9BmiDHv+M8KXgdLlr638?=
 =?us-ascii?Q?8r+5pNJfk+OEHVC0+SMPWO/KlbXxC8yyZsCq+DynpIFcsCGow4ev5x6jend1?=
 =?us-ascii?Q?mjwKRsBCPMylph6351zUIsN7kJUzGyVqcYOHlKskBrZl2lgAiR02gPl9tf6Z?=
 =?us-ascii?Q?SE4lKKu+JnGhx6b3haHC/OP2IFIKQ67H25ZVMZtV/Ar/DGnBmT8CjFnLKU+N?=
 =?us-ascii?Q?2ITAZ4vfzIvPMPB1JRq711GBhlVTkipcgo52PkM/U/d5wm/NFdI178Ovf59j?=
 =?us-ascii?Q?eWbc2nUcmC1diogI1kj9JwxVYrnWRFDO/bndmoTuFODE2Q846VMqP2sjIlhx?=
 =?us-ascii?Q?B9ASF5mUKCN0vpdlJ6ff248S9mVvYq7DD3MOEy20f7DJnkFZuQFVwWLx7IK5?=
 =?us-ascii?Q?TLdiec/n8zUir3M8D0LCooWtxxXMW9tmTp6jhcpiRrl0oU13ow9uFAn/Pk73?=
 =?us-ascii?Q?UdMyzdyYGwFFGiGNhXdN5fqzZoFgDcz+Mn00/bseouI3DBf+zWOb3ZYA8JRO?=
 =?us-ascii?Q?QGkT5JYZYZRoUnfltdzvIJzR7N+3iHKGfLmcVjGn0K/DByEo8viswVEDjstg?=
 =?us-ascii?Q?UPbrIXcqB29nEdhf8S/ev+Z6++rsNQbN79qwPzNvznuhCUrFptU1cq8YAE1C?=
 =?us-ascii?Q?Ww8JB9iTwDLo8i+8+XMv+ECXJxC8K+GInt85tE6rYXgwczYbvOMwPhVq9bEj?=
 =?us-ascii?Q?+zp/iKSk4MQu81viTPaNbpyw548qfk7f3N9f5WQI2FAo7Lpi04oOyEBa5Lp2?=
 =?us-ascii?Q?2xuxqKROJ4LbN0mzNJokRHne6cV+QgQiCSbuVMYAOTXx2hZMAWqFhp/Q0iL2?=
 =?us-ascii?Q?6h6eLjVkIHFNS3ls/sxtMvTH30bkAMKxkt/IjdpSdvkfW5tcCE7Zr/6GoQLb?=
 =?us-ascii?Q?C9BYT2GaFMFgiYjvP8Y7lHoR/u0Z1bzY9bbQkZAOjqbiUcTXlehzW/sl2/X9?=
 =?us-ascii?Q?DUnEcWwjFz9UvKnHsteRZIezAu2veaeJ68F4thonVjsybH92apnS+r6BPkcx?=
 =?us-ascii?Q?1jgLdR5Q5y9PVIp1XtzCIzEIKu2R26i4TCx1xXmnorFA5df6h8BaQpjY9EIS?=
 =?us-ascii?Q?UJY+FZGD6F4vPLPGMf4GNR9FZF+ONRplwHXjdopPkUWch6l37agPi+96/DWd?=
 =?us-ascii?Q?tTU/EKztO1h7rzOZiUDQGOfdhqvVLzRMuDOpJZzWHsWfqDhPHF1QxM8YIcgX?=
 =?us-ascii?Q?Lu378WAEyQ7UhaKVZ4sX+dg6ax9/UyCXD5skWxPbu+dhhXUCtmNqjGPegEFS?=
 =?us-ascii?Q?qwX0VeCMLOiklcJq/nhbSsRg4AoIHB9HoKh6PlaU66kB7Zw5fPIOEOsbLh6g?=
 =?us-ascii?Q?2kvr9YBOeGesRiKkqo4jkuhljcRGkuISdJRgxH0qYTS1aenFsyjpaFuKkENa?=
 =?us-ascii?Q?vFf+j5UpfMevpY1VBo4afz/QUKYyRyOrg8JyWOxS7FQ9fTQZUNMF7FCKMlqQ?=
 =?us-ascii?Q?n0Otav+YRtSGSTN0H+JIQ33hBxjFEjwsZAQQHzUCAPA4iqYV8p4NkqyNFwGk?=
 =?us-ascii?Q?a/vHke03xJobjeALyBGDHJtlCHf6sBvrUWSjrOqnIojwgKUHzy7eCx4Lix0d?=
 =?us-ascii?Q?5I/2FW0Fng=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91786a50-36b2-4347-fba4-08de7bc01d8f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 20:36:59.6562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TDFT/f3mA/wFFYrTNJSARUHk6NRh4GuX3o7oLsgVYZ7FqT/J+G+BX5BZZfhjTPhu8SXHUILpkzBtiG8mvglK1Q==
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
X-Rspamd-Queue-Id: E06FA2278DE
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
	RCPT_COUNT_GT_50(0.00)[56];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,collabora.com:email,Nvidia.com:dkim,garyguo.net:email]
X-Rspamd-Action: no action

Add a new module `kernel::interop::list` for working with C's doubly
circular linked lists. Provide low-level iteration over list nodes.

Typed iteration over actual items is provided with a `clist_create`
macro to assist in creation of the `CList` type.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Gary Guo <gary@garyguo.net>
Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
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

diff --git a/MAINTAINERS b/MAINTAINERS
index 2842d7529a65..4c66f8261ff2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23219,6 +23219,14 @@ T:	git https://github.com/Rust-for-Linux/linux.git alloc-next
 F:	rust/kernel/alloc.rs
 F:	rust/kernel/alloc/
 
+RUST [INTEROP]
+M:	Joel Fernandes <joelagnelf@nvidia.com>
+M:	Alexandre Courbot <acourbot@nvidia.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+T:	git https://github.com/Rust-for-Linux/linux.git interop-next
+F:	rust/kernel/interop/
+
 RUST [NUM]
 M:	Alexandre Courbot <acourbot@nvidia.com>
 R:	Yury Norov <yury.norov@gmail.com>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index a3c42e51f00a..724fcb8240ac 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -35,6 +35,7 @@
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
+#include "list.c"
 #include "maple_tree.c"
 #include "mm.c"
 #include "mutex.c"
diff --git a/rust/helpers/list.c b/rust/helpers/list.c
new file mode 100644
index 000000000000..18095a5593c5
--- /dev/null
+++ b/rust/helpers/list.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Helpers for C circular doubly linked list implementation.
+ */
+
+#include <linux/list.h>
+
+__rust_helper void rust_helper_INIT_LIST_HEAD(struct list_head *list)
+{
+	INIT_LIST_HEAD(list);
+}
+
+__rust_helper void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
+{
+	list_add_tail(new, head);
+}
diff --git a/rust/kernel/interop/list.rs b/rust/kernel/interop/list.rs
new file mode 100644
index 000000000000..bd6409f8bca2
--- /dev/null
+++ b/rust/kernel/interop/list.rs
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust interface for C doubly circular intrusive linked lists.
+//!
+//! This module provides Rust abstractions for iterating over C `list_head`-based
+//! linked lists. It should only be used for cases where C and Rust code share
+//! direct access to the same linked list through a C interop interface.
+//!
+//! Note: This *must not* be used by Rust components that just need a linked list
+//! primitive. Use [`kernel::list::List`] instead.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::{
+//!     bindings,
+//!     clist_create,
+//!     types::Opaque,
+//! };
+//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
+//! # // emulated here for doctests using the C bindings.
+//! # use core::mem::MaybeUninit;
+//! #
+//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
+//! # #[repr(C)]
+//! # pub struct SampleItemC {
+//! #     pub value: i32,
+//! #     pub link: bindings::list_head,
+//! # }
+//! #
+//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
+//! #
+//! # let head = head.as_mut_ptr();
+//! # // SAFETY: head and all the items are test objects allocated in this scope.
+//! # unsafe { bindings::INIT_LIST_HEAD(head) };
+//! #
+//! # let mut items = [
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! # ];
+//! #
+//! # for (i, item) in items.iter_mut().enumerate() {
+//! #     let ptr = item.as_mut_ptr();
+//! #     // SAFETY: `ptr` points to a valid `MaybeUninit<SampleItemC>`.
+//! #     unsafe { (*ptr).value = i as i32 * 10 };
+//! #     // SAFETY: `&raw mut` creates a pointer valid for `INIT_LIST_HEAD`.
+//! #     unsafe { bindings::INIT_LIST_HEAD(&raw mut (*ptr).link) };
+//! #     // SAFETY: `link` was just initialized and `head` is a valid list head.
+//! #     unsafe { bindings::list_add_tail(&mut (*ptr).link, head) };
+//! # }
+//!
+//! // Rust wrapper for the C struct.
+//! // The list item struct in this example is defined in C code as:
+//! //   struct SampleItemC {
+//! //       int value;
+//! //       struct list_head link;
+//! //   };
+//! //
+//! #[repr(transparent)]
+//! pub struct Item(Opaque<SampleItemC>);
+//!
+//! impl Item {
+//!     pub fn value(&self) -> i32 {
+//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].
+//!         unsafe { (*self.0.get()).value }
+//!     }
+//! }
+//!
+//! // Create typed [`CList`] from sentinel head.
+//! // SAFETY: head is valid and initialized, items are `SampleItemC` with
+//! // embedded `link` field, and `Item` is `#[repr(transparent)]` over `SampleItemC`.
+//! let list = clist_create!(unsafe { head, Item, SampleItemC, link });
+//!
+//! // Iterate directly over typed items.
+//! let mut found_0 = false;
+//! let mut found_10 = false;
+//! let mut found_20 = false;
+//!
+//! for item in list.iter() {
+//!     let val = item.value();
+//!     if val == 0 { found_0 = true; }
+//!     if val == 10 { found_10 = true; }
+//!     if val == 20 { found_20 = true; }
+//! }
+//!
+//! assert!(found_0 && found_10 && found_20);
+//! ```
+
+use core::{
+    iter::FusedIterator,
+    marker::PhantomData, //
+};
+
+use crate::{
+    bindings,
+    types::Opaque, //
+};
+
+use pin_init::{
+    pin_data,
+    pin_init,
+    PinInit, //
+};
+
+/// FFI wrapper for a C `list_head` object used in intrusive linked lists.
+///
+/// # Invariants
+///
+/// - The underlying `list_head` has been initialized (e.g. via `INIT_LIST_HEAD()`) and its
+///   `next`/`prev` pointers are valid and non-NULL.
+#[pin_data]
+#[repr(transparent)]
+pub struct CListHead {
+    #[pin]
+    inner: Opaque<bindings::list_head>,
+}
+
+impl CListHead {
+    /// Create a `&CListHead` reference from a raw `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an initialized `list_head` (e.g. via
+    ///   `INIT_LIST_HEAD()`), with valid non-NULL `next`/`prev` pointers.
+    /// - `ptr` must remain valid for the lifetime `'a`.
+    /// - The list and all linked `list_head` nodes must not be modified from
+    ///   anywhere for the lifetime `'a`, unless done so via any [`CListHead`] APIs.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - [`CListHead`] has same layout as `list_head`.
+        // - `ptr` is valid and unmodified for 'a per caller guarantees.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Get the raw `list_head` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.inner.get()
+    }
+
+    /// Get the next [`CListHead`] in the list.
+    #[inline]
+    pub fn next(&self) -> &Self {
+        let raw = self.as_raw();
+        // SAFETY:
+        // - `self.as_raw()` is valid and initialized per type invariants.
+        // - The `next` pointer is valid and non-NULL per type invariants
+        //   (initialized via `INIT_LIST_HEAD()` or equivalent).
+        unsafe { Self::from_raw((*raw).next) }
+    }
+
+    /// Check if this node is linked in a list (not isolated).
+    #[inline]
+    pub fn is_linked(&self) -> bool {
+        let raw = self.as_raw();
+        // SAFETY: self.as_raw() is valid per type invariants.
+        unsafe { (*raw).next != raw && (*raw).prev != raw }
+    }
+
+    /// Pin-initializer that initializes the list head.
+    pub fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            // SAFETY: `INIT_LIST_HEAD` initializes `slot` to a valid empty list.
+            inner <- Opaque::ffi_init(|slot| unsafe { bindings::INIT_LIST_HEAD(slot) }),
+        })
+    }
+}
+
+// SAFETY: `list_head` contains no thread-bound state; it only holds
+// `next`/`prev` pointers.
+unsafe impl Send for CListHead {}
+
+// SAFETY: `CListHead` can be shared among threads as modifications are
+// not allowed at the moment.
+unsafe impl Sync for CListHead {}
+
+impl PartialEq for CListHead {
+    #[inline]
+    fn eq(&self, other: &Self) -> bool {
+        core::ptr::eq(self, other)
+    }
+}
+
+impl Eq for CListHead {}
+
+/// Low-level iterator over `list_head` nodes.
+///
+/// An iterator used to iterate over a C intrusive linked list (`list_head`). Caller has to
+/// perform conversion of returned [`CListHead`] to an item (using `container_of` macro or similar).
+///
+/// # Invariants
+///
+/// [`CListHeadIter`] is iterating over an initialized and valid list.
+struct CListHeadIter<'a> {
+    /// Current position in the list.
+    current: &'a CListHead,
+    /// The sentinel head (used to detect end of iteration).
+    sentinel: &'a CListHead,
+}
+
+impl<'a> Iterator for CListHeadIter<'a> {
+    type Item = &'a CListHead;
+
+    #[inline]
+    fn next(&mut self) -> Option<Self::Item> {
+        // Check if we've reached the sentinel (end of list).
+        if self.current == self.sentinel {
+            return None;
+        }
+
+        let item = self.current;
+        self.current = item.next();
+        Some(item)
+    }
+}
+
+impl<'a> FusedIterator for CListHeadIter<'a> {}
+
+/// A typed C linked list with a sentinel head intended for FFI use-cases where
+/// C subsystem manages a linked list that Rust code needs to read. Generally
+/// required only for special cases.
+///
+/// A sentinel head [`CListHead`] represents the entire linked list and can be used
+/// for iteration over items of type `T`, it is not associated with a specific item.
+///
+/// The const generic `OFFSET` specifies the byte offset of the `list_head` field within
+/// the struct that `T` wraps.
+///
+/// # Invariants
+///
+/// - The sentinel [`CListHead`] has been initialized (e.g. via `INIT_LIST_HEAD()`) with valid
+///   non-NULL `next`/`prev` pointers.
+/// - `OFFSET` is the byte offset of the `list_head` field within the struct that `T` wraps.
+/// - All the list's `list_head` nodes have been initialized with valid non-NULL `next`/`prev`
+///   pointers.
+#[repr(transparent)]
+pub struct CList<T, const OFFSET: usize>(CListHead, PhantomData<T>);
+
+impl<T, const OFFSET: usize> CList<T, OFFSET> {
+    /// Create a typed [`CList`] reference from a raw sentinel `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an initialized sentinel `list_head` (e.g. via
+    ///   `INIT_LIST_HEAD()`), with valid non-NULL `next`/`prev` pointers.
+    /// - `ptr` must remain valid for the lifetime `'a`.
+    /// - The list and all linked nodes must not be concurrently modified for the lifetime `'a`.
+    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
+    /// - `T` must be `#[repr(transparent)]` over the C struct.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - [`CList`] has same layout as [`CListHead`] due to repr(transparent).
+        // - Caller guarantees `ptr` is a valid, sentinel `list_head` object.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Check if the list is empty.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        !self.0.is_linked()
+    }
+
+    /// Create an iterator over typed items.
+    #[inline]
+    pub fn iter(&self) -> CListIter<'_, T, OFFSET> {
+        let head = &self.0;
+        CListIter {
+            head_iter: CListHeadIter {
+                current: head.next(),
+                sentinel: head,
+            },
+            _phantom: PhantomData,
+        }
+    }
+}
+
+/// High-level iterator over typed list items.
+pub struct CListIter<'a, T, const OFFSET: usize> {
+    head_iter: CListHeadIter<'a>,
+    _phantom: PhantomData<&'a T>,
+}
+
+impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, OFFSET> {
+    type Item = &'a T;
+
+    #[inline]
+    fn next(&mut self) -> Option<Self::Item> {
+        let head = self.head_iter.next()?;
+
+        // Convert to item using OFFSET.
+        // SAFETY: The pointer calculation is valid because `OFFSET` is derived
+        // from `offset_of!` per type invariants.
+        Some(unsafe { &*head.as_raw().byte_sub(OFFSET).cast::<T>() })
+    }
+}
+
+impl<'a, T, const OFFSET: usize> FusedIterator for CListIter<'a, T, OFFSET> {}
+
+/// Create a C doubly-circular linked list interface `CList` from a raw `list_head` pointer.
+///
+/// This macro creates a `CList<T, OFFSET>` that can iterate over items of type `$rust_type`
+/// linked via the `$field` field in the underlying C struct `$c_type`.
+///
+/// # Arguments
+///
+/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
+/// - `$rust_type`: Each item's rust wrapper type.
+/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
+/// - `$field`: The name of the `list_head` field within the C struct.
+///
+/// # Safety
+///
+/// The caller must ensure:
+///
+/// - `$head` is a valid, initialized sentinel `list_head` (e.g. via `INIT_LIST_HEAD()`)
+///   pointing to a list that is not concurrently modified for the lifetime of the `CList`.
+/// - The list contains items of type `$c_type` linked via an embedded `$field`.
+/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
+///
+/// # Examples
+///
+/// Refer to the examples in this module's documentation.
+#[macro_export]
+macro_rules! clist_create {
+    (unsafe { $head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+ }) => {{
+        // Compile-time check that field path is a list_head.
+        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
+            |p| unsafe { &raw const (*p).$($field).+ };
+
+        // Calculate offset and create `CList`.
+        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
+        // SAFETY: The caller of this macro is responsible for ensuring safety.
+        unsafe { $crate::interop::list::CList::<$rust_type, OFFSET>::from_raw($head) }
+    }};
+}
diff --git a/rust/kernel/interop/mod.rs b/rust/kernel/interop/mod.rs
new file mode 100644
index 000000000000..b88140cf76dc
--- /dev/null
+++ b/rust/kernel/interop/mod.rs
@@ -0,0 +1,9 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Infrastructure for interfacing Rust code with C kernel subsystems.
+//!
+//! This module is intended for low-level, unsafe Rust infrastructure code
+//! that interoperates between Rust and C. It is NOT for use directly in
+//! Rust drivers.
+
+pub mod list;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..bb741f1e0dfd 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -28,6 +28,7 @@
 #![feature(lint_reasons)]
 //
 // Stable since Rust 1.82.0.
+#![feature(offset_of_nested)]
 #![feature(raw_ref_op)]
 //
 // Stable since Rust 1.83.0.
@@ -103,6 +104,7 @@
 #[doc(hidden)]
 pub mod impl_flags;
 pub mod init;
+pub mod interop;
 pub mod io;
 pub mod ioctl;
 pub mod iommu;
-- 
2.34.1

