Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UFcXFFItlmm5bwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EA6159DBE
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA95510E623;
	Wed, 18 Feb 2026 21:21:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YH44OcqN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011025.outbound.protection.outlook.com
 [40.93.194.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A8310E64F;
 Wed, 18 Feb 2026 21:21:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hk88KPuuUFpcmp9NKGKYjIUB5xRE7gyMS5wbeFfe5HpaCxAD6PG+MndZXgjuus58cjbnnXPowEuBtVfOhOyRo1F7AV6nVSMSlC4osstLzseAf/6xGgXs2gVbDJrBLj8Eev5p7iX/N/kHdAb9r3Li8IdWFWoDLsgZz0UZjxh+lU7a96ebAorl1drFGGYRle5WS3g4dZVEe30Kjqi4XZ//6KLMNt9w7P5FozsWX3v2LSTGiglfaQsR7B7by+N0jUWiBP6mplp6Rw/71TRpaSHHUJulM7j/38l1SU9FZvdt/9GLAb5SWCs6aBB4Ihccikls9ftpk6Qg7tENDZXRTedh/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N43u8WIb9/kth7+DPlL7LJD7dd8ELTlJE2ouDBo8tBc=;
 b=N8oEMEsdSujchSAlTmNHKXSDJxSXzEF4mL6ry+F8z7wlnl4evTJ6iGH8rsYO1zoikJw03ADBduBKRyb24gvCfjTNNHf3/IW0GFW3sAWnOTpXHRKwfaVioT4paCopOJUX+i5zddZ+U455ibNGIx7LfNJIOoz1P7HFgAewri2ub1bJoTRi73+9oY/s4t0YLjaequuEiss5+upJU0sOUZSnICP9nJu/F2M7FVvQCNp+M5X8FbkT7Yj8VwWtuMVUwW2m/wCG7bPBd7AjeqQVqjgjaIPHQJ2EPR7yiz/GOSBNwVvC6QE7+eB3ZQezW0DG4pH44c7k0hVcwsm7sd32awVsuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N43u8WIb9/kth7+DPlL7LJD7dd8ELTlJE2ouDBo8tBc=;
 b=YH44OcqNUxYCZxTNl9wdpmtrPgmWy81VPnLs2b8bJi4b/W1dhU/08WXOf+J+5sdzYLUERLlSFgfof2UdS1KJ/mZt7TRM1/qqT0bt78ihizksJsz1v34CohD1KrNpBtA5/ABZAxuF1pL+7mQfHZjKk570l3xlZKPIE4SlQMed1Q+okyXFnZ+sjS6Et6lETLkrwEOTMIB7DtcUMqNfdXSeabpezUU6guMuOyazQhLkg6R3bv2g8NSjtiwIEvc/A/yYp00p3UBFTfdr2jBzuqNVw8xpZz7unjfSFlsj7tZzIAx1/rU4YkTvS2VBTO6hrB38mT6mlgVmi+LZXJOmXWcoLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:12 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:12 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v7 05/23] nova-core: mm: Add common memory management types
Date: Wed, 18 Feb 2026 16:20:02 -0500
Message-Id: <20260218212020.800836-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0056.namprd02.prod.outlook.com
 (2603:10b6:207:3d::33) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: 42550899-4c5f-43dd-6d92-08de6f33a412
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?736sAp9PNKbYI3b5k1Em30H3tonnZNmTpW6at8LhoRyISTnak4QQVm/SD2fo?=
 =?us-ascii?Q?ChKrwRnaSgHGuruAyQcKrjgeWpPhZrfuKSOlr7jo8I3EKflKao+/YmM1agBh?=
 =?us-ascii?Q?oNkFsMEuAnsjaHx5Qxt5ukVLra2tKAcgND7OBbsBkW+/prWZ4gz3Wsv1n21a?=
 =?us-ascii?Q?CsBSScgHDHIcNWwUWKTUDb+A0QoQzHrWrg5hpM9BO79L0keo2O6nPlT98KMe?=
 =?us-ascii?Q?XOqVb6MoTCJ5wmsPWmktArHHZBBZK6CYJCX6t0/ttfVg8I8ctdXvUTuLdHRr?=
 =?us-ascii?Q?fdGSfYLiFTvYeDg7VWu3CU1k8S/gf6IC0wucnMuCW030AmmSBC5phkXcmOC8?=
 =?us-ascii?Q?aNf1iQNtxq+WxVAbChH6oDPxxZFJr3FnJzikocWQltbQWVv4ndv5HPXKw7Gi?=
 =?us-ascii?Q?rrruoNuIEoKzGmKNMjzK0gw7eV+uNDwFG2l8c4gPT8nhPNpuZdcz0d5TT5cC?=
 =?us-ascii?Q?UO5i3kXTjpmsI5pdiVeFRedLI5/e0HVf47SUyxxcRYGKhU9qjV50xSLziT1V?=
 =?us-ascii?Q?gwP+TD2rh9WVx1++XMRZI3Nlw28SygdOkAFPdxUrzP1PP6DdeACYmuoqhzQM?=
 =?us-ascii?Q?RQKnHk3AbTXynqZ5f5qweuHGE0HFkjNN3oGF3W1wxQwpBQ3miEPQGWvF3KQn?=
 =?us-ascii?Q?dWDtXE6sCXVEFPgrMc/0RwLhomuRqKkjXvtYLeN473bCiKvjNgqd/jY07Njg?=
 =?us-ascii?Q?+gHwhpMPFiYM3G2QnIr4WPou/Pi+Odumjz34kFvleSpzMU4gNGfJdlsOMOFW?=
 =?us-ascii?Q?BgDL6Q+c0pQIrdF0IZbWPtfRwYb0xYP+OmaXMzJIfitijpc5VBHeHIrjJMUj?=
 =?us-ascii?Q?F0IdrFLL941F/GBeuvYY0cqxPy3czLe8fHiLCO+6wGIQybUi8w6PqQYDUc2A?=
 =?us-ascii?Q?aX2jkLgQrPBocBzF0u5ffCsKPqAEGAo+882aWU82fbOfY6pVwlHtOQhJTu/Q?=
 =?us-ascii?Q?K+rQYiGGitjkvEhe3MXyF2C+XDFahLCFQeN1xtwnVXC0VrEsBPi5fU+a5bUB?=
 =?us-ascii?Q?1Xrfu4R9iMk5IzgaaMmXhyt+hT2cnV/hTzzUnFF69t8Z43Ii2OHab0FGVoEI?=
 =?us-ascii?Q?IX+bYItBNkd2LeOZ6FoRp0Jt+ZPqVujOPhh7l+gUBqg0BZP5VbHH6FGIpbtG?=
 =?us-ascii?Q?DuGc36qow3MiydP0r0KKp/FoSfl01nPjigKA5kOUkzG9jeHYHpWJLd3WODb8?=
 =?us-ascii?Q?61Z/BCNYA18oVbLW6t7pydjkJjQsFWNlqMTKm+4DWRnuX9lSXPmebqfNZimJ?=
 =?us-ascii?Q?lW7VtgdtDBqitViFab1kyzxSh2SyuznN6FH4QaXWo2tOFidpH/7X6mGVGF5h?=
 =?us-ascii?Q?6ATZSfaHvw5bxny3YsVd8MT92cDgQe5PHjvSM4T6Y0kd+Vmq5X7L7QPxV0JZ?=
 =?us-ascii?Q?tSCNoQeyvHtm/ASjgQa4XrnKbddzk42IqHoCCEcACm1dF/CE6lfssIstrP1O?=
 =?us-ascii?Q?qwXfDrFDKwqHjIz+qg4CWyrFWRgU2AvSSG3kRwihANW6UBCPhKERUIqUkYxI?=
 =?us-ascii?Q?QgykFhDlsVARb13Za/qk+QndMbvyNoPLwAZndQkYMcp9o37/TDrivVJZeir/?=
 =?us-ascii?Q?O+mf4YIGPwxsUmD4QGA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Pt3IWrkyd+X3fc1NL/CYDQPuIqYb1WGAS3M7t/0LGUpu14MImdyNZbHk8lSU?=
 =?us-ascii?Q?XTu/Jh3GwmNWx3fYuJVBtuB/06vAtIcNhHOnpfby8JE4a4wEgVgcvYmqc3sp?=
 =?us-ascii?Q?6v7B/9YzbvxYOoocP/O+cvhtB2FcOb7e2fv60a6LstNBoPIoHQeyabLxcG28?=
 =?us-ascii?Q?4qolxedpASWJDYGTjEnUbzPybgSjo1kJCZ2h3nILO686mm6JYHWSd34RdGth?=
 =?us-ascii?Q?VXK1maSL232wM4xB1tiZFiEzpSGauH5ri2i7moiV7ykwl9tb36noyjGfkg67?=
 =?us-ascii?Q?1POY+W1Xzl9uS9L4ESIRkVV31I77lzca2SFYEPQikR8vGkG0wVOjTeLpUNS5?=
 =?us-ascii?Q?0uXL4frltKHGPw5iFPk9e5Ej0eZEgvBBDGDp/OM/75emOmBp96gosQFgSRtW?=
 =?us-ascii?Q?OrCPsyirMV6PVfOXUfmchHxwlOjYXR/+yDECR5TzNSS02Iv26MX7RdAxAvkt?=
 =?us-ascii?Q?fDsPptbivUa1SYVu73KD7l2dugs45RZEaLemJ6SUMxIYCQEewOXUQMqG96UE?=
 =?us-ascii?Q?HXTSPar9OpwrHYLlF90VeBVCHRSuPGDnTDEdMmj4WfrnLFN05wF/BOAmGO8b?=
 =?us-ascii?Q?pB6Mx0Hiq1a/uPVCcqrIL1rVqGwvcvFDEJk3DNtXky8qgZYj1D90oCG166Hi?=
 =?us-ascii?Q?bpfGZnnvEMhz7bhM2dcnNJIUZMJZBK+aAHi1RWFQ7+jEgL0wFkPrEU7rr6zR?=
 =?us-ascii?Q?TrakkVGN98nO2lBFed39/LhV8G2GZtdAvlUAdvI3ngAwy5cxwmQjLVclt9tg?=
 =?us-ascii?Q?hYX4/XUV984aJAu36a5I03S4gL9r4wTmTTB7e6acgaHSB6Wvwz/UOxSEu4pn?=
 =?us-ascii?Q?YjvzE0FJvDyniVXt4iRCn1/y2FroFV1Ok/Q1Jz0qNAsFfsVqg48x20GsFlX5?=
 =?us-ascii?Q?aq0o+aEx3dGYTRkm6itatdqHZicz0zaQW0rnLUJxQQYnMFHqOL5HBvAQlj3R?=
 =?us-ascii?Q?zury/sVeQDwmqsVHDr6oqFOH7kG/gN3IlfxV8YXuDTet7d+h0t8LeTUxAyjj?=
 =?us-ascii?Q?BdWtbrzof37VwXEHDnWrRY40t2OXxNyaqqF0cBYIrvd+tIOthei1hP9w2spl?=
 =?us-ascii?Q?UIX2GbORVpqpkoERRt08ijBfIuzMNNxLWIZglKa9ilRCTFvPns/nwHcwfCxD?=
 =?us-ascii?Q?POWhQL2CrkFAaMgpybTGhtuPQtyG4W78BRAQWHuXzYTC2n7ZzuQpIIPOjYCQ?=
 =?us-ascii?Q?HjqNX3qzR1UbRJOaDhp9nyhibS1jSYRxLn/xD8y+e2DGqd+AIOxrYYCOaF9X?=
 =?us-ascii?Q?lDu4zbR4YIaPxb5czXyQIM3skV01bbM8ZDXOcPZQOc55gtazqM1fLZchv3QM?=
 =?us-ascii?Q?v8f8PaQjQVlHSdJ7CVYzOg0F2+nEkh3htCBF7m3sSBY3nRfsZdcLuwpL+yTZ?=
 =?us-ascii?Q?2msBBWTVR0YRBCeBg6PYLVgSoXGLyaJOpHe86JzO9ffgPLLZmuVvtTUDx7JD?=
 =?us-ascii?Q?+IQNDw/SVrPVPm+wKmS7aStUoVqN5cmdiOg3UKO9PH656Ojo+wzIWmnzeT0l?=
 =?us-ascii?Q?hDvx4Eu17mWiEUwF/HwenfqgUPKrglDYPpXwJX11EDszBzBb5Pz4nUyUYI8b?=
 =?us-ascii?Q?t0W+GX/PHoGbm4kIhiwfi8KQdDz5MWe77+qj2Pv6KVTA+wWIlk8ruhRBOWBq?=
 =?us-ascii?Q?3oeAp1Dm4IBvZP8/heqtX1T44ky/dd3GT36RQCK46vcJuDWAIRn7MX3cLnWZ?=
 =?us-ascii?Q?pAmDyHkQA6brilF7yQdNghjbRei1KALWmmCAKSAKr63yT23esyA++zYxsCWq?=
 =?us-ascii?Q?tB5kO98B5Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42550899-4c5f-43dd-6d92-08de6f33a412
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:12.2062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARYOqoMfj7uN0A7z2NThtdPR6tijZ4JJ11c7PoQzsgHGj6DybiEFejSHPNVe0feXtEqZHzETRLDlSofoc78EYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999111
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
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 02EA6159DBE
X-Rspamd-Action: no action

Add foundational types for GPU memory management. These types are used
throughout the nova memory management subsystem for page table
operations, address translation, and memory allocation.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/mod.rs | 171 ++++++++++++++++++++++++++++++++
 1 file changed, 171 insertions(+)

diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
index 7a5dd4220c67..04d9baa7220e 100644
--- a/drivers/gpu/nova-core/mm/mod.rs
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -2,4 +2,175 @@
 
 //! Memory management subsystems for nova-core.
 
+#![expect(dead_code)]
+
 pub(crate) mod pramin;
+
+use kernel::sizes::SZ_4K;
+
+/// Page size in bytes (4 KiB).
+pub(crate) const PAGE_SIZE: usize = SZ_4K;
+
+bitfield! {
+    pub(crate) struct VramAddress(u64), "Physical VRAM address in GPU video memory" {
+        11:0    offset          as u64, "Offset within 4KB page";
+        63:12   frame_number    as u64 => Pfn, "Physical frame number";
+    }
+}
+
+impl VramAddress {
+    /// Create a new VRAM address from a raw value.
+    pub(crate) const fn new(addr: u64) -> Self {
+        Self(addr)
+    }
+
+    /// Get the raw address value as `usize` (useful for MMIO offsets).
+    pub(crate) const fn raw(&self) -> usize {
+        self.0 as usize
+    }
+
+    /// Get the raw address value as `u64`.
+    pub(crate) const fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+impl PartialEq for VramAddress {
+    fn eq(&self, other: &Self) -> bool {
+        self.0 == other.0
+    }
+}
+
+impl Eq for VramAddress {}
+
+impl PartialOrd for VramAddress {
+    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
+        Some(self.cmp(other))
+    }
+}
+
+impl Ord for VramAddress {
+    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
+        self.0.cmp(&other.0)
+    }
+}
+
+impl From<Pfn> for VramAddress {
+    fn from(pfn: Pfn) -> Self {
+        Self::default().set_frame_number(pfn)
+    }
+}
+
+bitfield! {
+    pub(crate) struct VirtualAddress(u64), "Virtual address in GPU address space" {
+        11:0    offset          as u64, "Offset within 4KB page";
+        20:12   l4_index        as u64, "Level 4 index (PTE)";
+        29:21   l3_index        as u64, "Level 3 index (Dual PDE)";
+        38:30   l2_index        as u64, "Level 2 index";
+        47:39   l1_index        as u64, "Level 1 index";
+        56:48   l0_index        as u64, "Level 0 index (PDB)";
+        63:12   frame_number    as u64 => Vfn, "Virtual frame number";
+    }
+}
+
+impl VirtualAddress {
+    /// Create a new virtual address from a raw value.
+    #[expect(dead_code)]
+    pub(crate) const fn new(addr: u64) -> Self {
+        Self(addr)
+    }
+
+    /// Get the page table index for a given level (0-5).
+    pub(crate) fn level_index(&self, level: u64) -> u64 {
+        match level {
+            0 => self.l0_index(),
+            1 => self.l1_index(),
+            2 => self.l2_index(),
+            3 => self.l3_index(),
+            4 => self.l4_index(),
+            // L5 is only used by MMU v3 (PTE level).
+            5 => self.l4_index(),
+            _ => 0,
+        }
+    }
+}
+
+impl From<Vfn> for VirtualAddress {
+    fn from(vfn: Vfn) -> Self {
+        Self::default().set_frame_number(vfn)
+    }
+}
+
+/// Physical Frame Number.
+///
+/// Represents a physical page in VRAM.
+#[repr(transparent)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) struct Pfn(u64);
+
+impl Pfn {
+    /// Create a new PFN from a frame number.
+    pub(crate) const fn new(frame_number: u64) -> Self {
+        Self(frame_number)
+    }
+
+    /// Get the raw frame number.
+    pub(crate) const fn raw(self) -> u64 {
+        self.0
+    }
+}
+
+impl From<VramAddress> for Pfn {
+    fn from(addr: VramAddress) -> Self {
+        addr.frame_number()
+    }
+}
+
+impl From<u64> for Pfn {
+    fn from(val: u64) -> Self {
+        Self(val)
+    }
+}
+
+impl From<Pfn> for u64 {
+    fn from(pfn: Pfn) -> Self {
+        pfn.0
+    }
+}
+
+/// Virtual Frame Number.
+///
+/// Represents a virtual page in GPU address space.
+#[repr(transparent)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) struct Vfn(u64);
+
+impl Vfn {
+    /// Create a new VFN from a frame number.
+    pub(crate) const fn new(frame_number: u64) -> Self {
+        Self(frame_number)
+    }
+
+    /// Get the raw frame number.
+    pub(crate) const fn raw(self) -> u64 {
+        self.0
+    }
+}
+
+impl From<VirtualAddress> for Vfn {
+    fn from(addr: VirtualAddress) -> Self {
+        addr.frame_number()
+    }
+}
+
+impl From<u64> for Vfn {
+    fn from(val: u64) -> Self {
+        Self(val)
+    }
+}
+
+impl From<Vfn> for u64 {
+    fn from(vfn: Vfn) -> Self {
+        vfn.0
+    }
+}
-- 
2.34.1

