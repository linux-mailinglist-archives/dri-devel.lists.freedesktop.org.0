Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKFbCQfpb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA82B4B885
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A8810E64D;
	Tue, 20 Jan 2026 20:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CgLmY+8c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010043.outbound.protection.outlook.com
 [40.93.198.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9467910E225;
 Tue, 20 Jan 2026 20:43:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pRGZX5wmH/nve4X/HnuO8Y/Xfr+X8drG91wnt25jXKPzn6p5c/gZMl6/nibzFx7q2RUgAnEyH+0U8qVgDyU9rYYzlLwOiTpVA7ADURlOAWeJyCbYj1qJ73Ej8YVAkq7emKOY816ldOfdoxx+4CUvIYcv3k2dOav9PgdU/zYIoQWxlu8w0RNmOdaQZRJTbAzIdaSczWKRjoNj8b6l1RNU+VoHyOOzqNGkxSwiohU0qBnCxJiTk04FIFO0jXYpBb0fL1mxB7Q62BjLblf7jk7fBi82q13iIwDUkkl6nRsjCjF09WtvWpCW1c5B5BshHwa9OAgiVHtcTzvsLJ6fmKvpYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n+x0ei/AWu/7WupWw4pDblQ/NkgXVbipSpkrLiLj1wU=;
 b=uw0NM6weGDZgRuEoiX+GCK5f1QN0pY0/GE/AMTJvjBsc0U4FWDPvLQfKGTdPEdbPgRai3RqyzwFrtoQBhlcFuTRzOYLWQef6DEZsOz5Iq+MWnceXK361x5e5XfsUHS7+2zCl+0ZWPleRlsCi6F7z2ihZ2T7eKByRwH//BX/hnoRS8agfaPPr1kbhdKOahjECByOH1Rino7lS7UmMXHnfd58CVzgW70zmKf/RIJZ2uFavvS7SXOWeAXwGJXJ6hJnoDX885wTwmwbHoP3k/3xEGCKUWDmPToPurjszxA7rfDF77WxfOiHi+KO956OpQh6BEkTopsW62WqheR6gmNcpQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n+x0ei/AWu/7WupWw4pDblQ/NkgXVbipSpkrLiLj1wU=;
 b=CgLmY+8cpJXlHLh1DwwcCtgPjDs1vDeUfdi1ieLuM+49JNh3MP9BpeZH61DLbVIsnRuoJNTbFy0jjpWkgCXnR+WTtW4G3ni9AF1D2ook/rl+LIsnXskFKo0QL4xbbSChh3NSMrj8Z5Buugj9uyB5fOLLy3/J3ntbT25dMiQ3CSSOcsBDEl8Kea/ArXAob39hN8uRL9s3pBtAR7zzeXPqfGr7sImMi5KPhaz51e207biJA22OwHuYRei9d8qNn+kIsYAcCQ3TbkZW1Ny3ndUGLktFiM9CwRy4944pfs5kCDZ10DvvSd59zMImLMGy01bo8FcfAAohyLdMjHSWB5ZPqw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:43:39 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:43:38 +0000
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
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH RFC v6 04/26] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
Date: Tue, 20 Jan 2026 15:42:41 -0500
Message-Id: <20260120204303.3229303-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0018.prod.exchangelabs.com
 (2603:10b6:207:18::31) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: c32edea7-fc6a-4e6f-db3b-08de5864967a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/MgQc5bwZ6UpJmOQOu2NqWVJ2CSfwyQnHrZVx5D4Xg5SDftzlCpubCNpkr2+?=
 =?us-ascii?Q?Hb9RPcqwcmdfCoJbJiEiKWrIZ9vN31fOw4kaa5jT9ZkaoX0w0Dne6kYbxnOx?=
 =?us-ascii?Q?XCy0l8nop+bGFaEhGEHcU/6oaUVPnDdZ7M0YFcaGudyVI9eI/iyxMOGBadYn?=
 =?us-ascii?Q?as2gE0hKVIRzYrs8yVJeP+2qsOULbzoTkoO5zJDKYRliGV8UJ82QyhEVqYuZ?=
 =?us-ascii?Q?DEwQx8o2oVt7w+wSdYFB6Ve7quKpluAb8Prya7p17jooWOGe8jazNwy34ANc?=
 =?us-ascii?Q?5qGrQB/+G44WemDgymNLTgfp+J4KXlbdeBYtABwhHuPmXeLbNGEGNAH759g3?=
 =?us-ascii?Q?bYNX3usN1EiCWPu5dMZtBTb+tk9y2S3OBjc2ZWkyodwJqBvpRaiP0eoAUcvY?=
 =?us-ascii?Q?9qG3SJPHcR15kXjOrDFf73IK7YADNgO3u0snxxOJ7WT4+psx8dZHvJVZ0bLp?=
 =?us-ascii?Q?K/SleUWAHu2iqj+6xCdhyO9aOICsiq8BUNvTQckluNpw3640BqKbKKNeFdyz?=
 =?us-ascii?Q?H1iFFrPYDfkJkcpuIh7CVBismbchRPv5ir+ABGwwz08hLoZAm9JSMW2iUmOw?=
 =?us-ascii?Q?ksWWciqiLf2SxecRjxUGXewYFF/J0Pk1eKr/hLbMlQgulpJHFf5qxNrDvDFO?=
 =?us-ascii?Q?iu27un1D4gbjnfcdBq1cqug7YJyo3gsCHIAGlD+10nFA5GqKa9zWXAvCC3M2?=
 =?us-ascii?Q?JjbxA6wXChsUYD31KJurN4C4zsHM4lLmpQ5jskuE7YpHQUdNMRVxXAQ9RU0r?=
 =?us-ascii?Q?LvTz+PbFvcHvLmN4h06Wbb96UYN/Q29FWcpMikGQgAEesfOThqoTwEYpq9V6?=
 =?us-ascii?Q?YMVcRLRO6ILZXxKw9ocujJd28Ye5B3eKVYDxX4BaiDxBM0uKcH/8zUiI+iOb?=
 =?us-ascii?Q?Lyw4CAGjC9jXZWaqFAGuaFWfuSasyyDkLtG0D6T+Z1erX3Enp2b+LIYvLRxf?=
 =?us-ascii?Q?A8NT5WGj6izmrsiaLii1zy7TrvkFe597lNcfG6C/oHfCzjFnTtg3VoW/EdlV?=
 =?us-ascii?Q?hZ3FlOempQrYqzBwpTZlsOu44cjqkDtD1Fv2e5u4TAnVLlkFC3E9YZ49fIRc?=
 =?us-ascii?Q?BlF+ljHrOHE1H+hLTa/qVKgYGIHVm9rgpnQGVYkIOXHLIiJbNlUfm3nqhFwb?=
 =?us-ascii?Q?R+uHsGliYrtLphVeBHkDEnI+BBiahza/gWw9OWiSueQxKdePwSQBB3X/Krju?=
 =?us-ascii?Q?Y43pbDjzBBVZb3QsTm9/d4tqB4Z1Yp68X14Cpyptqnc1oclwngKEBRAfbhDM?=
 =?us-ascii?Q?4futi9QdTuDGIimsxUIB5z98iHsZPbe8Hs2gTjojPo29kv+clDotZEGj7iwN?=
 =?us-ascii?Q?l+zy+qP9CFNyCMk2AfDXbzcWUJPUVSIcpHrVcFhUpkYNZwizAOCRM6SSuZF1?=
 =?us-ascii?Q?V1Mg6oykanILaVpB5Hfdu7oi9S9MfEyOOhcn2R+P3RPjFxu4gIwpQu4YnX1n?=
 =?us-ascii?Q?G+EfhNapIr1BEJftBdGfbxdJo0c8zxT2FsfSSODJMTTPFCChsVXpayYEb3xv?=
 =?us-ascii?Q?bC+nOyBJxRIpP55vpTfExGjBPuaPWphMadeCAOCxiuC6HnOjWVpf646/iPid?=
 =?us-ascii?Q?UuUmLPDX8Q9QWMPnHkI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N9s2KYgkuvuvtNdO01soKnsiY8DVEnjJK2sPZp3EKTJEf3KryHdntbjAnSUS?=
 =?us-ascii?Q?rkl9OFxDo13gD1X7ZOh7VSiBuhAxsmkueF1De1COVObGGGQ/IadHPw2Of3fu?=
 =?us-ascii?Q?xj6dVabkgzWboue+fvpEMvcqhHQ01s/EJSm7M6HDXhCRqDlm9SYBvDNPyAN9?=
 =?us-ascii?Q?eCujEZUiGA8OXIJEklU2BwK02+g/0kMaKpLDBQMuw5iA+aL6z+2vnKOaRK87?=
 =?us-ascii?Q?PEAT6hsaEXbDxbOVtYlrXuhjrs2XqWKKWyCR6wGF+M6GA+PJ4/1F3A9XTt8p?=
 =?us-ascii?Q?9UP5XqOsiOfWM0a1FTVCx7TPxOLd9mobRUOAE6vrQZf+xKtFaA5OZJkkILz4?=
 =?us-ascii?Q?VdqOJ6sUCoYXaC5KJt/G7qUj1P8s0DWNYfYogVDeULUM2ItD4jL5JB3q1tYP?=
 =?us-ascii?Q?vAjI/wLJbAolDy5PZ3v6PS/L7mjgMLsUAylBG3OOS9ACaT9aaTlOvpfu0mPa?=
 =?us-ascii?Q?/AYJ2PJlDJXyTCRpzncHctfHHebijnKU9CZSO1ksfECGuBJ+vKG1aZCP0SJm?=
 =?us-ascii?Q?YU12Yms0I6yq+qeVwcEQQymXj687hFhCpNgUVTMr9Go26mQy3nknWyRyJh/7?=
 =?us-ascii?Q?h7EUc9PGLdnQTH8uZZsPoKsm0KdeXCmrWOwixf5TXE4YfQDwEbhquOsV/Hs7?=
 =?us-ascii?Q?93ramke6j0r7VlLadEJRw6nptTX/fJUBPUzVWGtypN3JAFB6vJah3lGWTqNY?=
 =?us-ascii?Q?vka7lAnlsrZuC3LS5y0HaXcBumY57cesSsEO6ozTWz97KjUVI+EyxVnvfgoE?=
 =?us-ascii?Q?DGqKjRslD07pcVRPdIX6TfsihK46wO1RQ192R8JTcqAa3oVE9PbdQOP4U0PE?=
 =?us-ascii?Q?AOJfquRMLcIdfCngCepng9dzIlfI5sslMgwCREgv0WG1A5KVrrhqG/Stu1Hw?=
 =?us-ascii?Q?07aJvCAjuzRYE4H4H7/2dU9KsqbX3kOTqSfsPncKeqxdONTEtl+yXiJOlOzu?=
 =?us-ascii?Q?dcEQx+hL3VRK2X1mGf2v8LP7UU9umUPkcue7pKKG3WFltNZXTQ1DEFw2teoi?=
 =?us-ascii?Q?KhB/dxOchh8nWj5bETIUiaELjc4VvUN4paW6i87ESFPn0VAu4R4IgXHVw6TL?=
 =?us-ascii?Q?/TW1MsNQJ1G0MwJjGOo0AekDFyXcJI3mU3/zCejOpSiM2SBC8yr0XrCFH0mQ?=
 =?us-ascii?Q?QuN2WDVWCYkeegBlcTzPSRnY8FeIMTT2Rou36ye3H4KRer+XndvaYwTLCb3B?=
 =?us-ascii?Q?gesYcyG5EiyLXGAyMs0eKdV8/fBKMezdvMr44qX7MxJ6pvlp6iH124T+x5VC?=
 =?us-ascii?Q?DLgaT5aQ3x+dlKT288nJasD6zhBpcwmPpKTyKu7VjCtBrV48iT1diESGjC7v?=
 =?us-ascii?Q?q3fIWsjZw2qK8xlzwJl4O2B9vu7nbjx+pHDTDG4UyyshuO2K8TrK+ynch2UH?=
 =?us-ascii?Q?ifDsiXH03E/64vQz5LTfNZvHKbNjN6I5LuNmF3YEHaHy6tntnIzZgCkrrwlC?=
 =?us-ascii?Q?V0jClS/cNK+mMZEnmSqHsZqTpO207nCLeDZus/4NT3uCnrLhLniNfFt5A4gi?=
 =?us-ascii?Q?u3QqakOk9nce/KXGpy2eeG0I89azkN9ugtQUlrZnvv6/mGzPLdvdVQdOxxMI?=
 =?us-ascii?Q?rfhfIBiHpDFB6wtXl0dS1DCRucSda/tyXc/UITmS3Jiq9VcVb0flqcFc5m4T?=
 =?us-ascii?Q?Z4uBaVB97aRibsldPY8XCRLsQtCFwMoIDA1cHvuiwBAQCnTN1B3XvyazSLky?=
 =?us-ascii?Q?4exIhK/KoXFPAHtNSBbi6bgmPUoEmd/YJqsQRKYUFxosyaIiWdbxdu/wt0hF?=
 =?us-ascii?Q?OIBn4488cQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c32edea7-fc6a-4e6f-db3b-08de5864967a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:43:37.9878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sto/BtlBzKE8ZAYCVd/M/NufiTSxi4o0+K9BgN7loOsEioNT4zNI5kzF5C6WPJgK3Ie34C68ki3bmn2Uf1+xtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: CA82B4B885
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Select the GPU_BUDDY allocator config option, which provides the buddy
allocator bindings needed for VRAM page allocation in nova-core's memory
management subsystem.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 527920f9c4d3..809485167aff 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -5,6 +5,7 @@ config NOVA_CORE
 	depends on RUST
 	select RUST_FW_LOADER_ABSTRACTIONS
 	select AUXILIARY_BUS
+	select GPU_BUDDY
 	default n
 	help
 	  Choose this if you want to build the Nova Core driver for Nvidia
-- 
2.34.1

