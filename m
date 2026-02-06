Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBJEJLk4hWlf+QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 01:41:29 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD03BF8B6E
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 01:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3E310E1DC;
	Fri,  6 Feb 2026 00:41:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fihigphp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010026.outbound.protection.outlook.com [52.101.61.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D2910E1B2;
 Fri,  6 Feb 2026 00:41:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANGUu/rLzQDSMPMYEk27VtOYCQIIZY6nhlquIP+RhSIFz0wuD4y+rGOxblfEmpKSAt4tCUH9lvQ51XYM/MNkt6cBLvm8eQ9mOYpLX8WNYScwqO09VjooUdK6xGwfR7XSBMXS+XNr/OW3GgknqHe0EgQrmV20EMhYXAu/9/+bUCsGTwMM0/MUIyvvMllbuYMfxt2GKZlWNUJ8JIBW6xbpw9DikzAqD321/ojqW6btDTDt2+kS7IaZBlSsf9qWXwYRUZ/gF6YxyfO1SO9eqvkl4e4UEMK3iUB+bmAQCTDUkgAqYrYrsjwg0XBQ1KVIRg9DLsdvp7gzPsxWuWZL/zYrNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/N2eTXdnNSZYon52NQ5R5o6KDITC31jjVpRTyIukIX8=;
 b=Hi2oPzcxRiGMqo4Jsna/GrBiEG5/w5JbmIh9urZ3k1OKQ2c22Ix+b6OlNCrSCv7qSfrN8fuf7bivFm4uoLGkNIjTP+JHj/7XCd5myvpVTqwL5bmzCBR4ohqIC9xrwY9iOyp/1W1UDAoqHxWg7eOOvKKcr7cSbE9J7aycJHibJicSyt+IO8iYdC5NNIJJIO1BrL+zOLDdxRK8AHe4RDMKgXD8mobMfZB9JegwyFYMxsiDJMZBHrUqQEe3mn8G2B5pAk6swUNqhZSxz6ptGpF25Td2xTOnUW9Z//cs9vUsEjCMwID0WGQ8Va8u9hDPz/17QWnNG2jZOW9yFaOzceXFeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/N2eTXdnNSZYon52NQ5R5o6KDITC31jjVpRTyIukIX8=;
 b=FihigphpaLpMRPEYlh/1bsXLMXSxCIdWIzK5GeU/UYY5cGjnxs7KqMn1BMd2vAYcvdnZsHkyVDkMKd4eMcrCK8kKaBavkUebcpII+f+qE1PggQ/QSusuccrg/+FMmPJ4tQ+6/4aixSkXDWpIfz7Xo/NaZb7s555o8LuCTcEeq97s/ozihxr0LA8dCq9/Wi2oMZZYzPsAeuWURmpt6XkKQi+irFYtynpqYnNW5KfsUTcMUcV1Y8oy3CdmyYy9INgJj9lyFWpLdDKuuFymUkbsqOgeWG9QRFTQjCEyDf8ZNbfyjwuEsn3eLI+OJtj5sGqvaCuyiUghtYr+TLoTtaY1xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA4PR12MB9833.namprd12.prod.outlook.com (2603:10b6:208:55b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 00:41:20 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 00:41:20 +0000
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
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH -next v7 1/2] rust: clist: Add support to interface with C
 linked lists
Date: Thu,  5 Feb 2026 19:41:09 -0500
Message-Id: <20260206004110.1914814-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206004110.1914814-1-joelagnelf@nvidia.com>
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0089.namprd02.prod.outlook.com
 (2603:10b6:208:51::30) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA4PR12MB9833:EE_
X-MS-Office365-Filtering-Correlation-Id: cb870c6f-400b-4925-7ddf-08de65187213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l9lgxLB8dKKxCY1bxv+ctNxbpaoqHCOl63Qi2M/PWWF/gEWZsI9zCdecbAfs?=
 =?us-ascii?Q?9PMdFwm1FHQFeHEQKilMu7CueuY+ZT1j8BEUUt3aQ+xQBakCXEcql1Wh/GS9?=
 =?us-ascii?Q?QaGs4UAwbYMfwhhabaFEUCPm4kb9Mxo0JxwIZ3g65nWCiXle+ezPYgT1FlNY?=
 =?us-ascii?Q?Dxgoe9adfYVAgmWB2PZ0DIMtdAtLWc8z04CifdCXBoE/nUvJRoQ0sjvUnCpo?=
 =?us-ascii?Q?oNQnpJJYvCjKLIyKvjjWY7RqN6mEo12+F/GL9pZ8ZfXpDX4wK/SzetWZ5NNV?=
 =?us-ascii?Q?UIktsth43wrQXF8TGIS1mAfwEBSQ48Q80nJ39ZLSI3KZ+1myiGkys1jwYI/N?=
 =?us-ascii?Q?6aDjSAb15K5gVJUZD4eD4UvyOBr3aax3h1FOLkfeLKkHzC4kdbROhA9PKZcq?=
 =?us-ascii?Q?axzVhdqbIDtSwRfDOxvAeKp59VO/oG+f92fg5kRIiFkVlDl1nTl+yMM8l3sQ?=
 =?us-ascii?Q?nk8LlHtj7FRRFXkzPgZ+X+vvVApnwjf6nPTgWT0ifo7cnHZh6u3d7AOsO5QV?=
 =?us-ascii?Q?OjNXSIwx1Zn7jBpIA1AmTCx1pKc19FVHjN6hxpZbtywA+7/jV1YLe09Yl/gY?=
 =?us-ascii?Q?qB1SEwBc37I4m80WdKuNDBLX2ytt4swl8fts8mfu20DLaJKBx2V9ytyQ4p58?=
 =?us-ascii?Q?gKElAec/+JjNIel3d7ZvuHUrj/bC8/IPvLJB5+meKMlNTYjksPotqYzDHTvn?=
 =?us-ascii?Q?QwP9nDkHIPaXej0Z1GlIhLjcI7QRjS9AZMeHZ3jLjNaQOtFgkSxQizfTfE3B?=
 =?us-ascii?Q?p/3LmN/bNbMM/b5V6YtXTVQfW+Opa/EcAMLoKV7d9RJ5yEsUWtj3VFDO+H1e?=
 =?us-ascii?Q?e8tiZhBU7U99j2jZ26A97Pdr8pX/smctU6pEWg64+LDS3FncO30aPXEhxX7d?=
 =?us-ascii?Q?/ON71EFcYLkg3rxg7pxwITbfb3eUzPINBCPkwBFSfB84SKQ8MxIcBJmncQ35?=
 =?us-ascii?Q?KGE8lWuIjModSuFeS5uPgaRok2fnQK1xFc+qsLkLWBlhZb8hnSuOId/KwBXp?=
 =?us-ascii?Q?72YfV7fJPCHR4G49U+CRa/LpEH2V1/T9ezKxiFOVKOIxbzQmvkRiSFTN6i1S?=
 =?us-ascii?Q?P0qXfUsCIaQvgL6DsS36+s4sq5x2oruIaBV0EzUwL0ByresqSOLADpvK9+mg?=
 =?us-ascii?Q?LCeAYYtJ52huzFVXffUw9BnhP534YJINAGBtcJo2UzgGMdrZ+gURMlQmEXe4?=
 =?us-ascii?Q?cBhGx1CICIDqX3+f3WYZRZ0n2TJTg0mNR4o62WIATomcd7BuqPvi3GU1tXvO?=
 =?us-ascii?Q?o29lkNkW5uf6azQ3RcbvKm4U7+mOk48ktX/SU5/xOUszUc8l7w4C30R66pzU?=
 =?us-ascii?Q?Vb/q5KXkLwkEMh05QZnRbZzDkHbikbDj25e6UY71Lqi/7klw8FtdZyo1rXHm?=
 =?us-ascii?Q?iSQQ4unoMmKfqfb9CMTJXsIq3Epx7Xxzm3vdWuHE4Sh0D9ogselQLnUUET+b?=
 =?us-ascii?Q?p513m4JLYszN2hq1tF3rtzQTu+yOLzjV1gGF/EXvqdAyuQfxEtA2kazPsg//?=
 =?us-ascii?Q?2edUlrSkFhE1Q9qQ7XwlUDBBe/D6L4O/pw/fkmPmpsenPYPkWmubIODiqyOC?=
 =?us-ascii?Q?6p2c9F3Rt1ItKnGtX9E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5dC+3aKxvD0xgdJzxPLL+rB/jYG7cjP5MtXw4hUUft+5xYVX1qi0GriqZ0m0?=
 =?us-ascii?Q?vURl7sri9MpH3WKfVD/KL3JmkwlzYIhN5cZxqyXV4bO1W9MBf/C23BXULn8N?=
 =?us-ascii?Q?xgwKturtau/jcaFH6nOz4gSPp3PehyFAnahkfwLNaYT62gPqdyYvF9AF8ADA?=
 =?us-ascii?Q?mYmbxf2smhJ7vrBhkL7foyoFxtuomgdHTWK3AEdGZ6tbJV9R24K8EYtani/v?=
 =?us-ascii?Q?goGP5ajmfxcz7JYzHdidtNvJ0yjMyXxO++zfh5pS8GJjighmInGB6zh3/59R?=
 =?us-ascii?Q?BkfJ5MLyk1ohEAWIlVxZBR9S1hPTWpLYU3e67axKsuNtDuRm21NkH5Xa4ACW?=
 =?us-ascii?Q?Cl8+lNpN3HI5RsnTUmpz5BwcJwEVf5Sj5BN6q+OJLcU3UIzgR8Lzm65XY5q2?=
 =?us-ascii?Q?jB8KvfrBexggFgnYrUZav7MJOXH1xB1m845bbpCUtyInmo5M3WTGeZRqV5Un?=
 =?us-ascii?Q?gamIauXBFMveCMNpi4Pkl7SCTHxi7wkiHiEwevTkLX+vR0TkGBsfsvventFD?=
 =?us-ascii?Q?XCM/2a5FYwE5qTMl54YYLjatsqemoRSp560dDWyulqZ7DH5WYi+nguupS46W?=
 =?us-ascii?Q?yoNwvAS4JKZ2dhTgagzypfOgNcX99cLAkT0buKUMzaLWQ505WpXGbu3pPako?=
 =?us-ascii?Q?R3bAmAyio3wKx3EGUiXaGoqYEqJZbtPRUIhc5oO2xwfBGwHp7h8d4OzzHuF6?=
 =?us-ascii?Q?KaWG4sxEn/FtD0SbjzLX2EJ9ObcZta5lhDYocEJJJLS+u73PtgpGUI1oketS?=
 =?us-ascii?Q?5PpJK/snmHW2ofdI1YDuCfGQurKMpNTzs607iClpNPylk5bmawS7lyTifE6R?=
 =?us-ascii?Q?NK/KVmfx0DQ44AYHr+9XYMzE9IZKAGhLJGV+qC2pV0KR9DEzwsSyyTNwTfWK?=
 =?us-ascii?Q?6A9Eh5O2tGvUPKJWvJiAfGM/nbWAkWpgWwp2HfBwWIELAkkmtUMVD62i/GuY?=
 =?us-ascii?Q?E0KLmtwVcDJSdZRh2Fc8KsYYQIRzifj1ZyMxZ20pjwZCpP1tETxeUmsBOAtV?=
 =?us-ascii?Q?YAYHGkFBH0/hzarOdKmS1VXB+hwD1+8NqxVCzQp0mtdejMJaKZQpVZXXJDxP?=
 =?us-ascii?Q?aE6ofBAA+DgCl5MTM2eDmcifDyTv3NgUnqI01BQQyMU+YsfGRt3zcVhQ7BfF?=
 =?us-ascii?Q?nEiee4ndbglooxadLOnsI1kX9Ftzx7Ol+9erGsfNu4B3jTTCs2ctIOoxuPLn?=
 =?us-ascii?Q?XkfOWmo8JWG1sHPafMxgJ6pp3A6GI5FxyrKGw3km/0NBe8GQSeAHitXZ3a4d?=
 =?us-ascii?Q?ouh0UBvAZnP8Z6TrCfNQC6jmYRHVhI9AKxrJ4/cOiZfrPhSt1KTyFG1FPEqO?=
 =?us-ascii?Q?UmkSryOpgBk9gK3JsEK4rBKbPEqZZq08tpydTxKThTtx6TreO5ZGXGAdT2M+?=
 =?us-ascii?Q?ekH4KsstukcLIW08M74TMknVSBKjK4Z2NpE9Zw82cIiARdAh3SDBjlUXUID1?=
 =?us-ascii?Q?ir7O8ruzy+O4QZHn5DG1/Hz90acCsg/sdXh20ru/oeHUPEZW9Uwe6wW5zOdN?=
 =?us-ascii?Q?IPq4Dj270AnxdHjaMHAmksjX++NIeyHl/cpf/3IRr43i4keryj6ZIqtyjEKx?=
 =?us-ascii?Q?0ld85NUudfmuZrUu0Og8t1QK6bScNaKZC6NZevjNJwE340hnEt9Zyz32YRwe?=
 =?us-ascii?Q?RqubS8wQTP0AhfD3tiDLJiN81MHzlPSjpSogwp3ccDEq43N6gH+KAAaVeL8H?=
 =?us-ascii?Q?wW5p7YF+S8otRVozw8CRmaJUVky/lQd2xK09wwma34BD6NqrXD1RIU8UDnE/?=
 =?us-ascii?Q?Ya+z71N71Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb870c6f-400b-4925-7ddf-08de65187213
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 00:41:20.2180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tU6t2hguXw4uxjj9g8ZnMFNH3aiJZ0wlstGxePZvSZquxLI0inL7gpxpBM3OcYCCYxNmyiPUlE5LyPYQqmgRKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9833
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
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: BD03BF8B6E
X-Rspamd-Action: no action

Add a new module `clist` for working with C's doubly circular linked
lists. Provide low-level iteration over list nodes.

Typed iteration over actual items is provided with a `clist_create`
macro to assist in creation of the `CList` type.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 MAINTAINERS            |   7 +
 drivers/gpu/Kconfig    |   7 +
 rust/helpers/helpers.c |   1 +
 rust/helpers/list.c    |  21 +++
 rust/kernel/clist.rs   | 315 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   2 +
 6 files changed, 353 insertions(+)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 900fc00b73e6..310bb479260c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23204,6 +23204,13 @@ S:	Maintained
 T:	git https://github.com/Rust-for-Linux/linux.git rust-analyzer-next
 F:	scripts/generate_rust_analyzer.py
 
+RUST TO C LIST INTERFACES
+M:	Joel Fernandes <joelagnelf@nvidia.com>
+M:	Alexandre Courbot <acourbot@nvidia.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/kernel/clist.rs
+
 RXRPC SOCKETS (AF_RXRPC)
 M:	David Howells <dhowells@redhat.com>
 M:	Marc Dionne <marc.dionne@auristor.com>
diff --git a/drivers/gpu/Kconfig b/drivers/gpu/Kconfig
index 22dd29cd50b5..2c3dec070645 100644
--- a/drivers/gpu/Kconfig
+++ b/drivers/gpu/Kconfig
@@ -1,7 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0
 
+config RUST_CLIST
+	bool
+	depends on RUST
+	help
+	  Rust abstraction for interfacing with C linked lists.
+
 config GPU_BUDDY
 	bool
+	select RUST_CLIST if RUST
 	help
 	  A page based buddy allocator for GPU memory.
 
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
index 000000000000..3390b154fa36
--- /dev/null
+++ b/rust/helpers/list.c
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Helpers for C Circular doubly linked list implementation.
+ */
+
+#include <linux/list.h>
+
+#ifndef __rust_helper
+#define __rust_helper
+#endif
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
diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
new file mode 100644
index 000000000000..1f6d4db13c1d
--- /dev/null
+++ b/rust/kernel/clist.rs
@@ -0,0 +1,315 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A C doubly circular intrusive linked list interface for rust code.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::{
+//!     bindings,
+//!     clist_create,
+//!     types::Opaque, //
+//! };
+//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
+//! # // emulated here for doctests using the C bindings.
+//! # use core::mem::MaybeUninit;
+//! #
+//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
+//! # #[repr(C)]
+//! # pub(crate) struct SampleItemC {
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
+//! #     // SAFETY: pointers are to allocated test objects with a list_head field.
+//! #     unsafe {
+//! #         (*ptr).value = i as i32 * 10;
+//! #         // addr_of_mut!() computes address of link directly as link is uninitialized.
+//! #         bindings::INIT_LIST_HEAD(core::ptr::addr_of_mut!((*ptr).link));
+//! #         bindings::list_add_tail(&mut (*ptr).link, head);
+//! #     }
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
+//! pub(crate) struct Item(Opaque<SampleItemC>);
+//!
+//! impl Item {
+//!     pub(crate) fn value(&self) -> i32 {
+//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].
+//!         unsafe { (*self.0.get()).value }
+//!     }
+//! }
+//!
+//! // Create typed [`CList`] from sentinel head.
+//! // SAFETY: head is valid, items are [`SampleItemC`] with embedded `link` field.
+//! let list = unsafe { clist_create!(head, Item, SampleItemC, link) };
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
+use pin_init::PinInit;
+
+/// Wraps a `list_head` object for use in intrusive linked lists.
+///
+/// # Invariants
+///
+/// - [`CListHead`] represents an allocated and valid `list_head` structure.
+/// - Once a [`CListHead`] is created in Rust, it will not be modified by non-Rust code.
+/// - All `list_head` for individual items are not modified for the lifetime of [`CListHead`].
+#[repr(transparent)]
+pub(crate) struct CListHead(Opaque<bindings::list_head>);
+
+impl CListHead {
+    /// Create a `&CListHead` reference from a raw `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    #[inline]
+    pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - [`CListHead`] has same layout as `list_head`.
+        // - `ptr` is valid and unmodified for 'a.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Get the raw `list_head` pointer.
+    #[inline]
+    pub(crate) fn as_raw(&self) -> *mut bindings::list_head {
+        self.0.get()
+    }
+
+    /// Get the next [`CListHead`] in the list.
+    #[inline]
+    pub(crate) fn next(&self) -> &Self {
+        let raw = self.as_raw();
+        // SAFETY:
+        // - `self.as_raw()` is valid per type invariants.
+        // - The `next` pointer is guaranteed to be non-NULL.
+        unsafe { Self::from_raw((*raw).next) }
+    }
+
+    /// Check if this node is linked in a list (not isolated).
+    #[inline]
+    pub(crate) fn is_linked(&self) -> bool {
+        let raw = self.as_raw();
+        // SAFETY: self.as_raw() is valid per type invariants.
+        unsafe { (*raw).next != raw && (*raw).prev != raw }
+    }
+
+    /// Pin-initializer that initializes the list head.
+    pub(crate) fn new() -> impl PinInit<Self> {
+        // SAFETY: `INIT_LIST_HEAD` initializes `slot` to a valid empty list.
+        unsafe {
+            pin_init::pin_init_from_closure(move |slot: *mut Self| {
+                bindings::INIT_LIST_HEAD(slot.cast());
+                Ok(())
+            })
+        }
+    }
+}
+
+// SAFETY: [`CListHead`] can be sent to any thread.
+unsafe impl Send for CListHead {}
+
+// SAFETY: [`CListHead`] can be shared among threads as it is not modified
+// by non-Rust code per type invariants.
+unsafe impl Sync for CListHead {}
+
+impl PartialEq for CListHead {
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
+/// [`CListHeadIter`] is iterating over an allocated, initialized and valid list.
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
+        if core::ptr::eq(self.current, self.sentinel) {
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
+/// A typed C linked list with a sentinel head.
+///
+/// A sentinel head represents the entire linked list and can be used for
+/// iteration over items of type `T`, it is not associated with a specific item.
+///
+/// The const generic `OFFSET` specifies the byte offset of the `list_head` field within
+/// the struct that `T` wraps.
+///
+/// # Invariants
+///
+/// - The [`CListHead`] is an allocated and valid sentinel C `list_head` structure.
+/// - `OFFSET` is the byte offset of the `list_head` field within the struct that `T` wraps.
+/// - All the list's `list_head` nodes are allocated and have valid next/prev pointers.
+#[repr(transparent)]
+pub(crate) struct CList<T, const OFFSET: usize>(CListHead, PhantomData<T>);
+
+impl<T, const OFFSET: usize> CList<T, OFFSET> {
+    /// Create a typed [`CList`] reference from a raw sentinel `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
+    ///   representing a list sentinel.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
+    /// - `T` must be `#[repr(transparent)]` over the C struct.
+    #[inline]
+    pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - [`CList`] has same layout as [`CListHead`] due to repr(transparent).
+        // - Caller guarantees `ptr` is a valid, sentinel `list_head` object.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Check if the list is empty.
+    #[inline]
+    #[expect(dead_code)]
+    pub(crate) fn is_empty(&self) -> bool {
+        !self.0.is_linked()
+    }
+
+    /// Create an iterator over typed items.
+    #[inline]
+    pub(crate) fn iter(&self) -> CListIter<'_, T, OFFSET> {
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
+pub(crate) struct CListIter<'a, T, const OFFSET: usize> {
+    head_iter: CListHeadIter<'a>,
+    _phantom: PhantomData<&'a T>,
+}
+
+impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, OFFSET> {
+    type Item = &'a T;
+
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
+/// This is an unsafe macro. The caller must ensure:
+///
+/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
+///   unmodified for the lifetime of the rust `CList`.
+/// - The list contains items of type `$c_type` linked via an embedded `$field`.
+/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
+///
+/// # Examples
+///
+/// Refer to the examples in this module's documentation.
+#[macro_export]
+macro_rules! clist_create {
+    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) => {{
+        // Compile-time check that field path is a list_head.
+        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
+            |p| &raw const (*p).$($field).+;
+
+        // Calculate offset and create `CList`.
+        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
+        $crate::clist::CList::<$rust_type, OFFSET>::from_raw($head)
+    }};
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..8439c30f40b5 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -75,6 +75,8 @@
 pub mod bug;
 #[doc(hidden)]
 pub mod build_assert;
+#[cfg(CONFIG_RUST_CLIST)]
+pub(crate) mod clist;
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
-- 
2.34.1

