Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFGkNPMlnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:28:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DA418D38B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 095F110E641;
	Tue, 24 Feb 2026 22:27:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bYGmJQiP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012058.outbound.protection.outlook.com [52.101.43.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52A110E632;
 Tue, 24 Feb 2026 22:27:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9Z8+RRHL4NfbmAn7i8VKT75aa/IgTm3jngvk1ilfnSk/ds0nmGRe1G0QLMsvJ5Va4DyLmo7RUqLjHA8mm7us9vXmw8AAKjELRenaex8o3HGX2I7dNKsCgk78/LFEIeNApLoPJumGbxPQ+K9+FQEa4SZHmTN60XDikdc3hy1gMqd9kEybB6Eyc69dURI+cswMaNOmoBksUoLrGVTLbsAk2aUYXTnv8egBl4nku6kal155DZPgn08MgSBdQDtABxDYfhIIqV8whwaeTCVu3RlKIMTHDz8XTMBaPLAml8B+WpmNLZ1rYinAADFOjdJliFo7sVb2K600xLO8lmgW4Qk5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n73UB9l3l2hQ5w75qU0gG6GfdgVJonggXKxRFTyRQCc=;
 b=ckNPuucyoTKQwjDBPKEAZTJy0P/W6H7oo6WKLYMmCXQy0WL3d9rRj15W7ruE+whEZxX+CM4IAMZ3PS0TFf3LFbpKPJeY/8uroao7CDd/Sx8Z4Nc1sGr2VbBJ2sMR2i+AjE8kL7BehglSO7pbKXIKOvkFSQ0phoQqAVOvPLVDdvc6grHG2lktLCAlF2MapxlwT7dpeaW+9MxIyLKL1xsX/pjmwwvfEQ1exq1+juIg1Ca8PuEqQv5Gz/GVMERHP7huCgZpyLGE3GeJ0qBNxPP+QQe9AWCh+bHzNaxkPjqrZjkJVCU/Cqy+uIA3Z1rpBsvvaltFNdm1Gno1CDUEhf0q7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n73UB9l3l2hQ5w75qU0gG6GfdgVJonggXKxRFTyRQCc=;
 b=bYGmJQiPjOIod0x6tqRmBWRD8F1gbHN1HiaYZDdE+zXFCMnmzHQvf8FGfLM9x7pwwMACgP8jlgFN1QCXNUNMoimLi4vROSKXricoEJWonzxcjrWL1v2ABa1DA2Z342yDIKONo50bz/2BIvBNPDDuiw2vxAOdsY4pNiB30oLulyBG1EkyFVPOeUSe/0nFd0WTayNXXX6krWQgEvBSI6fl8W4x4e6h3NZe/fkQ0r5wUa0nX9BnHvRH3jQt9GxO0Wlt1l4iGaz2/gjiXdVEXN7qb8h4BLv3qM17ZFFUdwJ3VQRWqhFndLQH7U9uB8c3PnMditzvl6xPBkC1q0wFexfZFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB5855.namprd12.prod.outlook.com (2603:10b6:510:1d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:27:47 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:27:45 +0000
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
Subject: [PATCH v11 2/2] rust: clist: Add support to interface with C linked
 lists
Date: Tue, 24 Feb 2026 17:27:34 -0500
Message-Id: <20260224222734.3153931-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224222734.3153931-1-joelagnelf@nvidia.com>
References: <20260224222734.3153931-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR22CA0006.namprd22.prod.outlook.com
 (2603:10b6:930:45::10) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: d745e3e3-92ed-4021-fa2d-08de73f3ee61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WFAG92bgbvBNTxAUGMondb1+iVw0FI/NGSjB2vSz/DYpHRfGrRBOAzoZhQHG?=
 =?us-ascii?Q?jzuzQmF4m8ynmeF7hSIEmetGe5FhTO99iqRSQ25WwfYlvaZ+QTizkBNsjd/8?=
 =?us-ascii?Q?305D945JXcsWYUAJh06Us7HvqQANPR4kCXv/g28R/eotIv1g51lRAY/4HL1S?=
 =?us-ascii?Q?TgmEOrLO819WnaAvXPmPY0Bwmk1b21bEABgoyNX6ieAwIsXTtzW9mjxtwoi/?=
 =?us-ascii?Q?J/yHjUCCqBaPlsC9QzJLoUgW91kjvuqEkrVPrI2qFxIVdnvu6gpWhY6stlUQ?=
 =?us-ascii?Q?Ip3AxJp0q0E5i/qMkUpaIug70CNISl/6sSBppx6+YbseVbuO9AGnltNGFm6+?=
 =?us-ascii?Q?sLpXL1lR4NaAQ0r938yA57NF6jRSnhVJXjLybQHcZxwd9vpmFyN0OhzqCpxv?=
 =?us-ascii?Q?GkMhwFqXoDyNgtE367RRgCpKP3T97qNba0KTnxaFNIkLZN0PXqUGuiNrpmSC?=
 =?us-ascii?Q?pebc0Hjq40TH9Q5lVQgORMWGWNNJ/Q1PFbNpjDsn/Te5V3x/7iUllz4SZmth?=
 =?us-ascii?Q?kBVOyuQ1N2RO+J8++T3OY5hiCLSckTArh60r//CC2+PgBnf6JrfXG2d79vfS?=
 =?us-ascii?Q?APk52W16iq8UDaFRH93QcflbgH3uT5YrbNdONGExw2SNh3+Gi0KBpBFLjE9m?=
 =?us-ascii?Q?8wLLUDZfhBG/fwDYL7dy+p7cyRAmOyDe+Ptu/E7dOOzDBn7fZuY8/I8qApfe?=
 =?us-ascii?Q?ZsUdZqNXRJ6eUixiQJip6MyVim0r1tFn91m9mjm+yWcnIp9SOx+dnVyYnDdJ?=
 =?us-ascii?Q?S765gZe9uhUSVRjpfIckSThVyy5Hm7eN1HVVPaTspa83QUhNwj87ONzZswO7?=
 =?us-ascii?Q?dmCn4oNRJWiDOtU9zcrPhBW/rrFtgJzeKFvhwEY9XB69wqEqHPkE2NjDL5au?=
 =?us-ascii?Q?SinSjYFKViH8ixBbN9ugwdWbAd402wTYprOraZokrRac+uDlvO6AY67eAKjf?=
 =?us-ascii?Q?kaYrYUvNVKnw1FhcZKhtbcxeKpKd4d2MN4hKXUaSAou86RnAH2Mwt6EosCvQ?=
 =?us-ascii?Q?3QZ8ZPw/qswUo9q5HRp/Xs321S1P3soasPRh1ml4TO/3ERXXnQXifAFxajMw?=
 =?us-ascii?Q?m/AQsi2fzlwrwLSXFzwuPw+pAs91uKz6O1oZKflL41Ue3vf4eyd5k8D+edfa?=
 =?us-ascii?Q?opUQE8TkydhVzDMmP96FGuKf4DvbOUiLFzk0JK4YKo2p3GNI9k7OhGp7utV+?=
 =?us-ascii?Q?8laJ1RT0Ss5/dnkHSJWU4MAB1rGosiqEWTyvLEXg7gdoxMK3IJJVf1nfX64f?=
 =?us-ascii?Q?RaKagx4sYTuxU+H8ZiUfbz8HeTeYYbmHRDz54gQSX8L53nra82FKi+G+hJ7U?=
 =?us-ascii?Q?ZTJ4HiVW6t1Ft1oo89DnVrbH2QX+dhpnWs/fDxYOQ6sMNBiQVMLF3zXLPlK+?=
 =?us-ascii?Q?XFlt47pT5Iii2nkJ3Z0Dzl7JrnM1syAFSIXMAj5iUdLiLlgG0pRnwBMrOQv7?=
 =?us-ascii?Q?pu1JJBwW7g+LI/5q+u/IbdXiAvgys94uJnIAj5uMpfc/hvPE443p4gt6lFew?=
 =?us-ascii?Q?rTrcAHw+dqisgexWX+RGTlGf5cGhyeYBnXN998CdLj6sDdex3z8h2Sk1r+zh?=
 =?us-ascii?Q?BRx8AbxueHeQrBf9HJ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zpjvm0YQ+AZUt+xidblpUczzTHREpFfW0PiGbggIPgS3/ZozbafIfF0R3gh3?=
 =?us-ascii?Q?b19PKZFezB6gW9AbySbwMMIQgIkDghE0c1psgsY5sm8a6qmfMnnOoWmYOf/j?=
 =?us-ascii?Q?lFz/lQvgNAUunlGtC1aRyaPHsr0Ea+4kZG0RzOSEUwzpoeEKEku9fq0FXLm9?=
 =?us-ascii?Q?pJz1iPD9LTQoAw1nKscwmZUbcRzKasbSWs7P3wdwBBHN+LVFTQZjrZmz1sFa?=
 =?us-ascii?Q?jhtIM3HP6CCvC18NlDOUzAmGscU0AUn14pTjK5f7XCfzg/U9mHtLLRQBDIwd?=
 =?us-ascii?Q?uUR4qf+xy7kU9JKf/a5J9LcvnJscNekhISgBVBN3sWL+HcSNklIbHWEqYkA/?=
 =?us-ascii?Q?P08FNVwF6jfDWyOzm5NsrnYnk3R6Ty5W0nAUUhxLKlv5eyZZ86xG7q0XYPBL?=
 =?us-ascii?Q?RiOpY/sA6Tt1gHY1Qm6bFIGmErFvaMhaG7d67O/ZpmXpHD/WJsRLL48BGAp/?=
 =?us-ascii?Q?AldY3zQtl+JZwJ/srdxqjVC+mQuqnSqE+lCeApw555VY9BxQMMDbBwrbQBMs?=
 =?us-ascii?Q?6mUaRMDc0M/W9voCgqIJyKV0hdKI6wwGGKwVf9KwCsvQOwBvIUuQxKypjE1t?=
 =?us-ascii?Q?m/V/FfO5LD2sPBUaj4RB3exoE2Jap7zACILPTNgqT+yHgkzhWr0yUqtCnzW6?=
 =?us-ascii?Q?ZpLOe1zCejGPmQ+MEzGhx/9v9bLMk3N3Ur9+5Lqrf6Y0vr2YB7GvRgM737kA?=
 =?us-ascii?Q?azBBjLqEUxI5zsih/R+iyVT2w8VbyjP21/fhJ1g6HXxpnV8JZ0AfvBrET0fA?=
 =?us-ascii?Q?oVGqU/3L+z5labt26oPypuahpB+x4bPCwW0VJYZprfEj4+gG2MCVVFip76au?=
 =?us-ascii?Q?9OjHYKujvFOHi4sROm5eT7xzAgYf9OORDJkFkR6e4f+Lk4NbMYmIG7YOlHQ8?=
 =?us-ascii?Q?BZQdXfmes1fdLv51wLH2U4u7ymdxH7bNajCRjg2S4rxJtVkrKB5L8Y2gEmRB?=
 =?us-ascii?Q?mXtxrhuhW9xKd8SlPgtQ+mGRx44exh1K08bhEMZMiokZswF9/YjF8kpek6ln?=
 =?us-ascii?Q?7G542cJ7TovYmXh37GrzZejeYcm8vdCCsap85fpfxgeeMUeJ39go30Xz0PBQ?=
 =?us-ascii?Q?BHtbfGu6ZlzWZURqMNyp99/s/Wu4IYAEuY8z+/e8eG1nXaXIVa7ADw7eNpHE?=
 =?us-ascii?Q?zHNk02O/DMDQsgYCuggzzLqYh0skjbuo+3giXoJuqzDChX8eo0+tSWnPMNQ6?=
 =?us-ascii?Q?C1QwEFoacKX+Z4Eols6pk6eGdneQMCj8wbc9P2f29Wl8AVpF+w/JEzAzA98C?=
 =?us-ascii?Q?m3GUAgBBw46ruTumfMOt1SqdSDFle/3nhT2ZgAk2OIpBTv1dOkU2PGcxU6MO?=
 =?us-ascii?Q?4R+n1AOGpkAX6ST8sJoJOke3FAUoFYVGjtVa/m8gQy1nlv6nQYfwaAvS4u1w?=
 =?us-ascii?Q?imIlR1D0qOfYTmmzFuIHwGJmTiK8mRxxFyq8d0bdJ1jOMASU7MWqpJBo2PGw?=
 =?us-ascii?Q?Mau7inMjeDNZtlXtyL85CX9qDAGoWVRRuS4DGi3Y+zPKf+PGJZ2UHwBfDa0g?=
 =?us-ascii?Q?mWRhi4qUEODOUo/10JEzDt1IKnRvT79SpcGdn6a+I1pfJwIMjLD9CFSxV06a?=
 =?us-ascii?Q?Yqd+IOyx2ciWpDH1lzuqnCqB/s7sK91B6NRAXgHWLyU5F4Rh4Ynk2gLb34vk?=
 =?us-ascii?Q?g9dPrk6eEki3tR05aB6xOpxCQwxbO3jYk2MHJTAC0WWyRhhW9MBr2LDRZWST?=
 =?us-ascii?Q?XooG/BwrXjHcHLHXY8sQP3kMjAs0bo55/4cNtf6tr3BDqNWiRgih+sk/GvIp?=
 =?us-ascii?Q?4XLV/W0SsQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d745e3e3-92ed-4021-fa2d-08de73f3ee61
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:27:44.8540 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eM4tgBXJzdKWqdLlhFnO4omqt64V9zki1e/2eedDjRlb+ABugpAzJxH9q1NvFptpbn3hLAGQXVo6ny++RGpXZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5855
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
	NEURAL_HAM(-0.00)[-0.791];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 46DA418D38B
X-Rspamd-Action: no action

Add a new module `clist` for working with C's doubly circular linked
lists. Provide low-level iteration over list nodes.

Typed iteration over actual items is provided with a `clist_create`
macro to assist in creation of the `CList` type.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Acked-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 MAINTAINERS              |   8 +
 rust/helpers/helpers.c   |   1 +
 rust/helpers/list.c      |  17 ++
 rust/kernel/ffi/clist.rs | 338 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/ffi/mod.rs   |   2 +
 rust/kernel/lib.rs       |   1 +
 6 files changed, 367 insertions(+)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/ffi/clist.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index dc82a6bd1a61..0dc318c94c99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23181,6 +23181,14 @@ T:	git https://github.com/Rust-for-Linux/linux.git alloc-next
 F:	rust/kernel/alloc.rs
 F:	rust/kernel/alloc/
 
+RUST [FFI HELPER]
+M:	Joel Fernandes <joelagnelf@nvidia.com> (CLIST)
+M:	Alexandre Courbot <acourbot@nvidia.com> (CLIST)
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+T:	git https://github.com/Rust-for-Linux/linux.git ffi-next
+F:	rust/kernel/ffi/
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
diff --git a/rust/kernel/ffi/clist.rs b/rust/kernel/ffi/clist.rs
new file mode 100644
index 000000000000..a645358eee58
--- /dev/null
+++ b/rust/kernel/ffi/clist.rs
@@ -0,0 +1,338 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! FFI interface for C doubly circular intrusive linked lists.
+//!
+//! This module provides Rust abstractions for iterating over C `list_head`-based
+//! linked lists. It should only be used for cases where C and Rust code share
+//! direct access to the same linked list through an FFI interface.
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
+        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated using offset_of!)
+        // is valid per invariants.
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
+        unsafe { $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($head) }
+    }};
+}
diff --git a/rust/kernel/ffi/mod.rs b/rust/kernel/ffi/mod.rs
index 7d844e9cb339..8c235ca0d1e3 100644
--- a/rust/kernel/ffi/mod.rs
+++ b/rust/kernel/ffi/mod.rs
@@ -5,3 +5,5 @@
 // Re-export C type definitions from the `ffi` crate so that existing
 // `kernel::ffi::c_int` etc. paths continue to work.
 pub use ::ffi::*;
+
+pub mod clist;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 0a77b4c0ffeb..58dbb02c5197 100644
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
-- 
2.34.1

