Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HhUHB4snmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2381F18DD69
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F84410E6C6;
	Tue, 24 Feb 2026 22:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NhyiBT3a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71CAC10E6B5;
 Tue, 24 Feb 2026 22:54:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ls22ViGBvsK653UdTcOiz2NXyOqao8h93IDLzeACNP3al7yN14xl5ogmGq7HrqfhJddD3o7X6FMwqN2Caq1Pnn7YFRRKV1/wnr6SboCgWPkQNz5+BGcWLO/hBJGIyCFcjBdcIyuHZe/m+Q6ZVkBKTwovbnW7LhD/+GNYAAQ+I1ZhePZ/3ylZy9q2OrIHnBKYVVCJ/TJaGiTwAYdIq14+Z9q5MXJ676IvigOwr/fSN6fsbCFC2rOhTzqCbZSWa4zZPRTUX3uEE/D/ghe3cm6xPF8+pJIvEfVON8kEBDgHCaqt2UYdcaYHTyR6DaxrCa4+mkfETN58oTyyalT8qmP5uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFw+WNHc8Av9B2RbCFxOS840z/XHizG8MRocBJ7NORo=;
 b=PmEfWy1dGImQKFutVq6RFBqe/SQORlqD34Ysu4CwU/QjkqTfyShhz3Fb2KV1V0PntjquW8esz9+J3X1nYIluGejyXejH62biZ0u2J496f+N1pHN5OXPaMU7nBSY3gUp9Eieh3h0Yv/XCSoS48Bd1MeQCox6qbH0jRqyfP2siy6986iFrPErqrGmcSH41K1k/xlyms4q7i6onKD8vFXGe2XVunmw3xpHSJ6PEuimRV3v8CNtNIfcy485ROJP4YLpXXZh28TNnH6QL8zzBdE9NrwhS/BoM6jfKV9jp4IaumMl2W3FpwTv9R5Z9RSbY0w40u0AZZO5kgIsRLu6sWqIUWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFw+WNHc8Av9B2RbCFxOS840z/XHizG8MRocBJ7NORo=;
 b=NhyiBT3anAU4S9Wm5HaRpLli9d15c6rRM+7U3Yv4pQg+F3/wrHHytuN9MLels1W7UcM1w4yRJW/Bpgk6s5a1nw9kabH9kjIKofmPJ6cSam1gOso46HnjmYqMQr10u8bRv8aKqrR3pU05/gZteGSfVyIQKaIiGz+IV1xpNCDS/Q/JSM6nBd2mT4ZuZcxG6wQ/5TAmYE+t5ZRf6JdbJeYkB8yiGMofMmwZ8wSWURfguvfiaDsEoj8N+tYBzNCzHrTBx8cjXf4m+DB8P3U+b8hNxZOOEpQB/Dgdh+s9kkqGRb4AYH9JcLaoz+Rf4RSsC9xH2U+Kz7FxGMlzuug4vKtV1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:56 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:56 +0000
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
Subject: [PATCH v8 15/25] gpu: nova-core: mm: Add unified page table entry
 wrapper enums
Date: Tue, 24 Feb 2026 17:53:13 -0500
Message-Id: <20260224225323.3312204-16-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0042.namprd16.prod.outlook.com
 (2603:10b6:208:234::11) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 263199bd-54a3-4dee-f0f4-08de73f796e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yRkMkfcTK+C+XXSnqwAeS3gGIb/5X/UfswL9XHAmJ5psN4yEgoEDOAKcQQTp?=
 =?us-ascii?Q?HvMBTDOcCjPR6Xlr5jOQKhPlpc2IQMBK2maHbdUKNMrRZnFcHV58FadC3pF4?=
 =?us-ascii?Q?xoljgt6ebWiTurhgYcN/NGZAkO81hqP5S17TZkgWB1orZxnCZ4M1QTGuy/8o?=
 =?us-ascii?Q?DyR7XxaXF+udJgr8AuzLbpyFCzRUh4DPgmcNMrUo9xoHdY79dab9A2dCj/Dz?=
 =?us-ascii?Q?h01eioh08oYFwJadzLBzUmFfHGmxicWQIlD8I6kcoQ6OpRYPEAmQOCiGYIk5?=
 =?us-ascii?Q?QGs97gIz5L+z9xm9hXTrtug1ZSRXuQw5vlwwN60IqN5O6oNq17rXHWUAqkC4?=
 =?us-ascii?Q?8RcO+ifpWZNdElF3MSp4cDwTdpPOfs7m6wGJ7ZehpMtYLbIk9KeID2+9YjhU?=
 =?us-ascii?Q?v4ssvTZ5CpkR7uyYS+v0iK8eeBa/sKOCdorx2fTRpEtINg/bClni1Gxio88F?=
 =?us-ascii?Q?U2PkdjI1712TRO6/Fgx4njdSLB5OTRfM2ja3jxV3r/a84uwIuLKOkKYtjA49?=
 =?us-ascii?Q?/hAUFfD6j1C+5LnlIRcYHpzm0kuGU2HRvZKxw5SybDeFp/egGOsatc8OjG+0?=
 =?us-ascii?Q?oQ9UCFPzCAWqfg5KqUbTxkhBGlyEFbgwW7pkhZwM5xd2j9gMAAj7Y7ex/QJg?=
 =?us-ascii?Q?m04pqfhHyevrcks21prY5Grxk1okXQeguybuYP4V5g0YYZZdsy/F4z0FcDsm?=
 =?us-ascii?Q?Xa/cYqpTgUERP9l+Mv5SkW/EDqXHmOpRSnbCLmHxn3tdV0ETTgUqs9fUSUL4?=
 =?us-ascii?Q?ufveCRVE/xiUjSUcpaXAf08VnTZAf3IXUQaahPhvkTwC0kocOXjRxyQ6Jjce?=
 =?us-ascii?Q?laIiXwbi5JW755227WZUOjzxhLRp21iIh5TXQLTLiL3QTfs9IXGU/mgFD84z?=
 =?us-ascii?Q?6sO72tpaHKf6j+5XxiV1KULyKNCP6qb73eJyFQg03gVulBGOy89JVtAM8G5I?=
 =?us-ascii?Q?Unclv+bKdmWnL3Uc5FB2ZjvVjLrZbSnu8ufUPhHXA4trOyaX0GOukwdl5fjk?=
 =?us-ascii?Q?fzcJsO6f66tpuHNajOI/KRl8dozPnoKRGM3MhjyiFOsDZK3JmGKco3Ipeq5J?=
 =?us-ascii?Q?qTpO2mDF9sKjRkNiof004Tm21bDsIayA4oSjtBBMbspRdJi6AFICeDcTpwHJ?=
 =?us-ascii?Q?sz2A8EgZGxYu87nSyT61G53KkL9cWV9qkQkyvRLyv2uLlbdfn4KBYt3b8u+q?=
 =?us-ascii?Q?rvGjMRDfwxDsgHSs5TFCoKmmBVmAQoIiJ1ca6xojQSOOamgAWPbnO7pZr2bC?=
 =?us-ascii?Q?CQXg78AUJnUzrEE5x2XIsVmyfU9ilxxMt+u9p05ZWAyIL9l37Mxaka2z1Rkl?=
 =?us-ascii?Q?1OiNK+UqtZsSAR0cqJKSFfky3H8tKAbKMHVvIy5OdlVSrKm7YzWV0O/37GoZ?=
 =?us-ascii?Q?cp/4vi5pyrClmqtpPQ+DuupK8cGCtNWcUO7o0ASucbhTY9vZIn0prc6RmXsE?=
 =?us-ascii?Q?eCVyORHyjD0nYXnpn5yxfnc/Z0ajVG5hgH82vDkdu9qq3nzltYJkLQVHDEP3?=
 =?us-ascii?Q?3XI6I5TKHisNHSM6CjkACTr/z85ANbtJLJf87cyB4UeoibParlYDFXNMQuiv?=
 =?us-ascii?Q?vsQVsIPOtg3GC3/mcX8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tvVCKEksd6Hjvn2prUB8IMhC+SpCvhhMO39o+cJVW+RjH5fLXx3VLqdj3v0x?=
 =?us-ascii?Q?FCbzfiVRe4WyrV2V+/fpX50Lq+nZt45LWBjHN94N8w+9wBywus3p/lWzb8kM?=
 =?us-ascii?Q?kfUQLBARHfO0ZulJrPgZ0VH95tMNTRy7SG/bUXHz8R5rx3k/Oqj0OGqbkyqN?=
 =?us-ascii?Q?Zt46Jl5Ziav42p3Ry+Fcj9NJcNqRhrguBdVEWcpPurb6Up2EYH0HciQG7Zfn?=
 =?us-ascii?Q?ffmpVK7AK7ToKblfmXYG3zXfcdh/DMYS5tCO3s6+ordO2RJe3rnKN3QCjjl3?=
 =?us-ascii?Q?F22xZP3UV7nVG8kx8NwW15Ww5BCYS7YLycQUDkIY18kbX4Bm5Ri/FohFdMLa?=
 =?us-ascii?Q?kjk32VDecHOgLXHafSzp3NgTuA+V1F18pNlSFWq96zlGf3EHkh/Zt93wVpqq?=
 =?us-ascii?Q?Pf0oHh5NI1ttBHkm3k+i2Oung2p7rMxKO5s0fMbXMzcV4/7MlEUN6fLFCmQe?=
 =?us-ascii?Q?5gHsNnctFszNX4VwopXSOIYf3yiEfGmpXI3ADAyyT9covKhCrXDA2Yg+dKfW?=
 =?us-ascii?Q?SGXG5H8Ya+gVKtX0OS6VNStXZKnG0YjhyTIDxgWwHxdUWHA07Mtr5GFWB4ED?=
 =?us-ascii?Q?ut9reQ5QyIUxY6BNBJzZ5JdC5apDXCXD27YlG57nPqPn17dRX4GeclweYcT1?=
 =?us-ascii?Q?kNnAgC6nRvX6hTHcrBIqT9QnbmIof948GBnCBXHTYDMj16fZPBLqfCIKFV4h?=
 =?us-ascii?Q?Um704CRiEYAC8jSSGGk1/xZaaqTTOc+2CC+Hm62vU3yaIErgy6H9DiIdElDE?=
 =?us-ascii?Q?XIZoapG9JABzF69eYX2cBL76JGvPWf60gvn9TvDxVhr3wAVZ/3C8P3JxeDdN?=
 =?us-ascii?Q?1DWXFLC+JezhkwcHO83DQcRJsUxNW1gASZsKd/x2sW+NP0EdBeFRNq0lsbip?=
 =?us-ascii?Q?xNkbKzuCNBsSgVsrRgY24BeBKopOgPuGeCR6oy2U2FLcTcOylSyNX0uUJUwE?=
 =?us-ascii?Q?EE0j3JnXYiRbExST/cb4dUY1rMv4q3e4L6bzl0MCo3aWeX3GQ7xdf7BkF8yV?=
 =?us-ascii?Q?Y03fu3znPqR0C4QPBNnvawTQB910L4+lc+9mK9fgtOXrntRZvgNbCNxHdzVZ?=
 =?us-ascii?Q?HNY8R+nNvUb0anLX6HAqFWCxxOTTNDLy4sJ18HgRrN0n6t6yJQxNNUVaTfaI?=
 =?us-ascii?Q?X2q5PQNOifiwTOzWR7WfR6Vxg65ssMTp6Vaecc+fINpYolqLdvPGClFt+1VN?=
 =?us-ascii?Q?veb5lYSbBwq71cvq6Ct7lESHY3WO65T3gxuu5azPLecsdkwT5vzurZSr7lhO?=
 =?us-ascii?Q?TMKnLgNVtqD7WRHTVaENEZ1UkqvvEOfrUO8hXPewNZ4c+9x2rQnkHAfgqBzH?=
 =?us-ascii?Q?TfYUnkPk/+2LQ7awGsSgvkgn2beaQHxYpSN74ZnmcUMN/6RFZdbJido8yzDw?=
 =?us-ascii?Q?dAgloyJchIcYKXUme71rc20fV++rmeZE2uzkp7PVvjnP553nnNVk5RkCSvzq?=
 =?us-ascii?Q?vsxAag+zONvCA0Ejcyw5qjwRSdWfER4xU8rNeGUKhFbtvmFpv6cS7cgpVt3G?=
 =?us-ascii?Q?AIdSAPDvIBLYowdNyrfACGjzP/mLhNKGOxrk/dFxpb9cMPKr/7jIyYGroBGU?=
 =?us-ascii?Q?qc8duH+ozstF6yoYcroMxFU32aHvr4lVuln6GBeSYpr2PftvEVLbXmk+1/Z7?=
 =?us-ascii?Q?FNQkZpUGYzLIcuEuH5xNIFOKvtibQen47lYty5Lv77c2JsW5RX1eEmY4kJcO?=
 =?us-ascii?Q?idD6LI2137iZhQm8MjWQZuMZLfPnZ24mvRjm2+J4KYRHRQUKdZjZtJtzvela?=
 =?us-ascii?Q?VwZM7etxaw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 263199bd-54a3-4dee-f0f4-08de73f796e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:56.0222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHkPj7/WOQgQEorSRnfsHXCMW+TQwAH81Nl45LIJbk/d961VTlYK45S53SGhKeFgp95Lr0a8BqVy6VkRJamt3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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
	NEURAL_HAM(-0.00)[-0.917];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2381F18DD69
X-Rspamd-Action: no action

Add unified Pte, Pde, and DualPde wrapper enums that abstract over
MMU v2 and v3 page table entry formats. These enums allow the page
table walker and VMM to work with both MMU versions.

Each unified type:
- Takes MmuVersion parameter in constructors
- Wraps both ver2 and ver3 variants
- Delegates method calls to the appropriate variant

This enables version-agnostic page table operations while keeping
version-specific implementation details encapsulated in the ver2
and ver3 modules.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable.rs | 301 ++++++++++++++++++++++++++
 1 file changed, 301 insertions(+)

diff --git a/drivers/gpu/nova-core/mm/pagetable.rs b/drivers/gpu/nova-core/mm/pagetable.rs
index 5263a8f56529..33acb7053fbe 100644
--- a/drivers/gpu/nova-core/mm/pagetable.rs
+++ b/drivers/gpu/nova-core/mm/pagetable.rs
@@ -10,6 +10,14 @@
 pub(crate) mod ver2;
 pub(crate) mod ver3;
 
+use kernel::prelude::*;
+
+use super::{
+    pramin,
+    Pfn,
+    VramAddress,
+    PAGE_SIZE, //
+};
 use crate::gpu::Architecture;
 
 /// MMU version enumeration.
@@ -77,6 +85,74 @@ pub(crate) const fn as_index(&self) -> u64 {
     }
 }
 
+impl MmuVersion {
+    /// Get the `PDE` levels (excluding PTE level) for page table walking.
+    pub(crate) fn pde_levels(&self) -> &'static [PageTableLevel] {
+        match self {
+            Self::V2 => ver2::PDE_LEVELS,
+            Self::V3 => ver3::PDE_LEVELS,
+        }
+    }
+
+    /// Get the PTE level for this MMU version.
+    pub(crate) fn pte_level(&self) -> PageTableLevel {
+        match self {
+            Self::V2 => ver2::PTE_LEVEL,
+            Self::V3 => ver3::PTE_LEVEL,
+        }
+    }
+
+    /// Get the dual PDE level (128-bit entries) for this MMU version.
+    pub(crate) fn dual_pde_level(&self) -> PageTableLevel {
+        match self {
+            Self::V2 => ver2::DUAL_PDE_LEVEL,
+            Self::V3 => ver3::DUAL_PDE_LEVEL,
+        }
+    }
+
+    /// Get the number of PDE levels for this MMU version.
+    pub(crate) fn pde_level_count(&self) -> usize {
+        self.pde_levels().len()
+    }
+
+    /// Get the entry size in bytes for a given level.
+    pub(crate) fn entry_size(&self, level: PageTableLevel) -> usize {
+        if level == self.dual_pde_level() {
+            16 // 128-bit dual PDE
+        } else {
+            8 // 64-bit PDE/PTE
+        }
+    }
+
+    /// Get the number of entries per page table page for a given level.
+    pub(crate) fn entries_per_page(&self, level: PageTableLevel) -> usize {
+        PAGE_SIZE / self.entry_size(level)
+    }
+
+    /// Compute upper bound on page table pages needed for `num_virt_pages`.
+    ///
+    /// Walks from PTE level up through PDE levels, accumulating the tree.
+    pub(crate) fn pt_pages_upper_bound(&self, num_virt_pages: usize) -> usize {
+        let mut total = 0;
+
+        // PTE pages at the leaf level.
+        let pte_epp = self.entries_per_page(self.pte_level());
+        let mut pages_at_level = num_virt_pages.div_ceil(pte_epp);
+        total += pages_at_level;
+
+        // Walk PDE levels bottom-up (reverse of pde_levels()).
+        for &level in self.pde_levels().iter().rev() {
+            let epp = self.entries_per_page(level);
+            // How many pages at this level do we need to point to
+            // the previous pages_at_level?
+            pages_at_level = pages_at_level.div_ceil(epp);
+            total += pages_at_level;
+        }
+
+        total
+    }
+}
+
 /// Memory aperture for Page Table Entries (`PTE`s).
 ///
 /// Determines which memory region the `PTE` points to.
@@ -149,3 +225,228 @@ fn from(val: AperturePde) -> Self {
         val as u8
     }
 }
+
+/// Unified Page Table Entry wrapper for both MMU v2 and v3 `PTE`
+/// types, allowing the walker to work with either format.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum Pte {
+    /// MMU v2 `PTE` (Turing/Ampere/Ada).
+    V2(ver2::Pte),
+    /// MMU v3 `PTE` (Hopper+).
+    V3(ver3::Pte),
+}
+
+impl Pte {
+    /// Create a `PTE` from a raw `u64` value for the given MMU version.
+    pub(crate) fn new(version: MmuVersion, val: u64) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pte::new(val)),
+            MmuVersion::V3 => Self::V3(ver3::Pte::new(val)),
+        }
+    }
+
+    /// Create an invalid `PTE` for the given MMU version.
+    pub(crate) fn invalid(version: MmuVersion) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pte::invalid()),
+            MmuVersion::V3 => Self::V3(ver3::Pte::invalid()),
+        }
+    }
+
+    /// Create a valid `PTE` for video memory.
+    pub(crate) fn new_vram(version: MmuVersion, pfn: Pfn, writable: bool) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pte::new_vram(pfn, writable)),
+            MmuVersion::V3 => Self::V3(ver3::Pte::new_vram(pfn, writable)),
+        }
+    }
+
+    /// Check if this `PTE` is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        match self {
+            Self::V2(p) => p.valid(),
+            Self::V3(p) => p.valid(),
+        }
+    }
+
+    /// Get the physical frame number.
+    pub(crate) fn frame_number(&self) -> Pfn {
+        match self {
+            Self::V2(p) => p.frame_number(),
+            Self::V3(p) => p.frame_number(),
+        }
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        match self {
+            Self::V2(p) => p.raw_u64(),
+            Self::V3(p) => p.raw_u64(),
+        }
+    }
+
+    /// Read a `PTE` from VRAM.
+    pub(crate) fn read(
+        window: &mut pramin::PraminWindow<'_>,
+        addr: VramAddress,
+        mmu_version: MmuVersion,
+    ) -> Result<Self> {
+        let val = window.try_read64(addr.raw())?;
+        Ok(Self::new(mmu_version, val))
+    }
+
+    /// Write this `PTE` to VRAM.
+    pub(crate) fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
+        window.try_write64(addr.raw(), self.raw_u64())
+    }
+}
+
+/// Unified Page Directory Entry wrapper for both MMU v2 and v3 `PDE`.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum Pde {
+    /// MMU v2 `PDE` (Turing/Ampere/Ada).
+    V2(ver2::Pde),
+    /// MMU v3 `PDE` (Hopper+).
+    V3(ver3::Pde),
+}
+
+impl Pde {
+    /// Create a `PDE` from a raw `u64` value for the given MMU version.
+    pub(crate) fn new(version: MmuVersion, val: u64) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pde::new(val)),
+            MmuVersion::V3 => Self::V3(ver3::Pde::new(val)),
+        }
+    }
+
+    /// Create a valid `PDE` pointing to a page table in video memory.
+    pub(crate) fn new_vram(version: MmuVersion, table_pfn: Pfn) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pde::new_vram(table_pfn)),
+            MmuVersion::V3 => Self::V3(ver3::Pde::new_vram(table_pfn)),
+        }
+    }
+
+    /// Create an invalid `PDE` for the given MMU version.
+    pub(crate) fn invalid(version: MmuVersion) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::Pde::invalid()),
+            MmuVersion::V3 => Self::V3(ver3::Pde::invalid()),
+        }
+    }
+
+    /// Check if this `PDE` is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        match self {
+            Self::V2(p) => p.is_valid(),
+            Self::V3(p) => p.is_valid(),
+        }
+    }
+
+    /// Get the VRAM address of the page table.
+    pub(crate) fn table_vram_address(&self) -> VramAddress {
+        match self {
+            Self::V2(p) => p.table_vram_address(),
+            Self::V3(p) => p.table_vram_address(),
+        }
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        match self {
+            Self::V2(p) => p.raw_u64(),
+            Self::V3(p) => p.raw_u64(),
+        }
+    }
+
+    /// Read a `PDE` from VRAM.
+    pub(crate) fn read(
+        window: &mut pramin::PraminWindow<'_>,
+        addr: VramAddress,
+        mmu_version: MmuVersion,
+    ) -> Result<Self> {
+        let val = window.try_read64(addr.raw())?;
+        Ok(Self::new(mmu_version, val))
+    }
+
+    /// Write this `PDE` to VRAM.
+    pub(crate) fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
+        window.try_write64(addr.raw(), self.raw_u64())
+    }
+}
+
+/// Unified Dual Page Directory Entry wrapper for both MMU v2 and v3 [`DualPde`].
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum DualPde {
+    /// MMU v2 [`DualPde`] (Turing/Ampere/Ada).
+    V2(ver2::DualPde),
+    /// MMU v3 [`DualPde`] (Hopper+).
+    V3(ver3::DualPde),
+}
+
+impl DualPde {
+    /// Create a [`DualPde`] from raw 128-bit value (two `u64`s) for the given MMU version.
+    pub(crate) fn new(version: MmuVersion, big: u64, small: u64) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::DualPde::new(big, small)),
+            MmuVersion::V3 => Self::V3(ver3::DualPde::new(big, small)),
+        }
+    }
+
+    /// Create a [`DualPde`] with only the small page table pointer set.
+    pub(crate) fn new_small(version: MmuVersion, table_pfn: Pfn) -> Self {
+        match version {
+            MmuVersion::V2 => Self::V2(ver2::DualPde::new_small(table_pfn)),
+            MmuVersion::V3 => Self::V3(ver3::DualPde::new_small(table_pfn)),
+        }
+    }
+
+    /// Check if the small page table pointer is valid.
+    pub(crate) fn has_small(&self) -> bool {
+        match self {
+            Self::V2(d) => d.has_small(),
+            Self::V3(d) => d.has_small(),
+        }
+    }
+
+    /// Get the small page table VRAM address.
+    pub(crate) fn small_vram_address(&self) -> VramAddress {
+        match self {
+            Self::V2(d) => d.small.table_vram_address(),
+            Self::V3(d) => d.small.table_vram_address(),
+        }
+    }
+
+    /// Get the raw `u64` value of the big PDE.
+    pub(crate) fn big_raw_u64(&self) -> u64 {
+        match self {
+            Self::V2(d) => d.big.raw_u64(),
+            Self::V3(d) => d.big.raw_u64(),
+        }
+    }
+
+    /// Get the raw `u64` value of the small PDE.
+    pub(crate) fn small_raw_u64(&self) -> u64 {
+        match self {
+            Self::V2(d) => d.small.raw_u64(),
+            Self::V3(d) => d.small.raw_u64(),
+        }
+    }
+
+    /// Read a dual PDE (128-bit) from VRAM.
+    pub(crate) fn read(
+        window: &mut pramin::PraminWindow<'_>,
+        addr: VramAddress,
+        mmu_version: MmuVersion,
+    ) -> Result<Self> {
+        let lo = window.try_read64(addr.raw())?;
+        let hi = window.try_read64(addr.raw() + 8)?;
+        Ok(Self::new(mmu_version, lo, hi))
+    }
+
+    /// Write this dual PDE (128-bit) to VRAM.
+    pub(crate) fn write(&self, window: &mut pramin::PraminWindow<'_>, addr: VramAddress) -> Result {
+        window.try_write64(addr.raw(), self.big_raw_u64())?;
+        window.try_write64(addr.raw() + 8, self.small_raw_u64())
+    }
+}
-- 
2.34.1

