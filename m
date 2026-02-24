Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMpeKfgrnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E3418DB6E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A996810E637;
	Tue, 24 Feb 2026 22:53:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ipppsdA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010044.outbound.protection.outlook.com [52.101.61.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0D610E630;
 Tue, 24 Feb 2026 22:53:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uE8IYDHvdDSqbEdyC/T+mqRDMCBbozDD4pzwWO8Laly1e+EuOGHWJgcmRvi1pwEAIx+gHpiozoaWxToE9gd7gGCeuFB3rfd/bgEjkOx26QXmrPZHgqXmkKLfxdphOdLb3yIqLpHg2Q5VXMaqiE/3QCtwOCpcNatppGV/I4FqWMzEhhuyefFQgDW4Mma9ig7GE091BWyzG4Zce2DnM0PlEW/iANLSdyrjnoAglKTLn4iP9jpyzkdWxe0TcDHqbVr4TZew2FIoSrqhGsW8gwIfebTjdxWZQSrMJeGQTHaopHOK1e1MkO4gSpL7Gxlpb7HdMhmX+a56aTrkjUCKA9ye7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jEHPUJPMQROjSOa6xbisefxYIaTDEM0bYv0NvvUaCCU=;
 b=tbUtuWfkTHtMbLt865Shn46WXj5+WTjhleVn/LL0Z8eQxk2zKJsQ0JyvqP55Z0a7InD1arVLZvODk/IW3+bfJb0yt8UYb8g4GULZZhhpCLPSqfnZEjCthAVuvNdBP9VdPpPYF+t1FJvv2E4BxeWw6eO0eb4TpzPqpeKFo+bKF4pqNMYh7vW0PYkJkFfJF32BEHJTidDjTRmeKGgikEMC3A+pydBMfKWeb3aLSlzNtrJpCZPfTIY86D73q4eaKdhi42LvgHoDq3DmcZ8+hqkna0metnUIwsrcmxKq91nkpJGTq90bgjOAbkFlGNiI0YYfeW15MM/BSJFcvVTxo3qWvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jEHPUJPMQROjSOa6xbisefxYIaTDEM0bYv0NvvUaCCU=;
 b=ipppsdA6Ghm8MkhH1x/YxPrfFoDzsLjgx+v7rkmQFsJN9LtxUfw+JExjGjRSOqwmwc365sp5MW/uFmMUSp5LgFB056UY8eK7oJMNL0Rum7r8fCO3ykXYe9CPVrzigwhC+JJd8j3uwXy3wU0cUNIm60usHmt/YMQa/DBShq0a3WhhxlQNYQmMD0Zp+Siidr5OkZTX5V4jawe5yxjVp0uQ1ZyicOv7LyCjurNkNX7zoxCyzkDwj+uK/Qph2vxZ4fwsE1DlMLr+9PXgKSDCeEXSOoDNReC+chl8RACUPaM4fGvVmsvsUGK++6ViyPSF28gE5VZCyAfTO2Z7otLfY+ygHw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY8PR12MB7562.namprd12.prod.outlook.com (2603:10b6:930:95::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.22; Tue, 24 Feb 2026 22:53:34 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:34 +0000
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
Subject: [PATCH v8 00/25] gpu: nova-core: Add memory management support
Date: Tue, 24 Feb 2026 17:52:58 -0500
Message-Id: <20260224225323.3312204-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0068.namprd02.prod.outlook.com
 (2603:10b6:207:3d::45) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY8PR12MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 9307053d-3c97-4464-9399-08de73f78983
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xcaUR1D0GddoWbcKoHUGHouHFQ1BK2P5vEVlccdVlS60aulJP8HOnHw27iWj?=
 =?us-ascii?Q?35KmQ7E4fRT4m3bf46WYwZKC0gWg65wNp91Sa5MRt+O0LLpKzk949jQjtLUg?=
 =?us-ascii?Q?RxN65wZi+hzRxsEaUhi9aYg8CVSOeAozgS85FBwKUSJJs/V3I9EPOzfOY4WP?=
 =?us-ascii?Q?vvXQ2vjaXgHfAIaVdB/c5BgostKY5wkyZLcg4bx56Edx+gmoChOfHYyIz4PI?=
 =?us-ascii?Q?cpO6pExEdeYingQpD39XSj0mUd8jpWzWxwSrr+ag7erJtp6k9V7VIUskA5VO?=
 =?us-ascii?Q?VRWQALof9iX7j9S/VTj6AJ1BPr2llqGdGTiOhu8ODz38rNL6wFvpfSQIdYUa?=
 =?us-ascii?Q?t7NcT9T0lyzKQItNPxltfEArMUtFN0pg59PeCj6cNKG+raNN05R2wtkz4+0A?=
 =?us-ascii?Q?px93YvCIpwgKg6qia020Gr8pKCxL82DQ11Rtyc8s8NNhCsrsQdXUcN3JVWn0?=
 =?us-ascii?Q?eqi1164sgHMj+1zQeIYvlgiy7hZmMtIt0yaX01fTgPyHPVEHwopa+R1Mk3Mi?=
 =?us-ascii?Q?XusBYJ39ucU/ttywifHO9cWDZx2CLWdtyRY2M/RfrhK7zrl0G8sb9d0CaNGn?=
 =?us-ascii?Q?FoEirGIUm1JYsrYo9GjrFJ4RF4iXHCANiFArYuD0rlbBHRR7+cPccA5LwG0D?=
 =?us-ascii?Q?f7vP2P2Vuork1HU2M5m2+4XYW6QvKSh9OaqslS00tjxto0OGI6nTsR9K1qHc?=
 =?us-ascii?Q?xNdY2p/ccq3LYyvt8RwOGxqoTHxicAhiODoiX2mmz1HDmkjsWquUrCxq+kIs?=
 =?us-ascii?Q?uXVryvIlu0bSbDmfVWGpG4/vMhJtx/ui5hnTlwwPy4IGt67FoSakuru35brk?=
 =?us-ascii?Q?h6OtsRjSAMkE0XvfTXvURa1AVNieTtv9zpud9BLgHyhJbFBPXFgFhrE7PhCz?=
 =?us-ascii?Q?xtDP7zS3EcXasCOqK9dvs2Zk/h/qiPnVrurPnmLjbvINWYI8iEwSKAOANWQ2?=
 =?us-ascii?Q?PE2aE2WxZ8coVGJKqEWwOlelxArPokVIQWdrqJTmVfWLsFfi8PNYTsMNM/5X?=
 =?us-ascii?Q?GFq/ERIecg0oryifY3Jih7TEjqsSs8Bk+LMdtAZOmGIyUu1IM84Qh83KdAkI?=
 =?us-ascii?Q?ntbEjMe1+eXf4BUQ6zY3F4SvdFiUwpa9no01F3p5FYK3L591Lz4mS9cHCF14?=
 =?us-ascii?Q?0O1R7gwVYumUPCoK36mXNWnoosCYpKeg+fC7IjRsicBLLX0N50eIwz1LP/g7?=
 =?us-ascii?Q?e72LegXnqP42fO0W3yKeXQs4Jyaq5fbiA35zM5GcYO6u7f7Og+uVinZLxlYs?=
 =?us-ascii?Q?XKqMdXhwl56+fwVuVSrekYjbPrVii+AVhL7nhbTseXlJNUv3JihUqKw+A8BE?=
 =?us-ascii?Q?mItjQBtxmRyoUhLx5GE/L3MAAy5HEoYrRczL2uZTP7H8JGnxK05wl4iO3aSW?=
 =?us-ascii?Q?0cpMUjG6Md5neIlLO5manWY9kQAtLnBwv/ButCX16UvW22ESYUjhqWsWxkrh?=
 =?us-ascii?Q?TsBynZdKtKpUZRVlBdEEA4Zihea/TxNluUY+wIfm6B1AQGz70OZfU7LaluNJ?=
 =?us-ascii?Q?qiU/D4CSAZzrDc212wPikt7zwbr7WNrsOpu/eYMkbhD+iqNqSJsu64KTncrp?=
 =?us-ascii?Q?4jkqeecIJIy4HLUkTvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rx9ndl40AGGdB12pRW4r1aFKrdbIW9t7/d1ygXZ3BNSwlSMHqQ/wZQcw+7hd?=
 =?us-ascii?Q?e9EgGfIIjS8kuA7CdHQWz3c3+qJJ17Bbl6ovWOQKPM292keer997aKqcyvag?=
 =?us-ascii?Q?aWxDYlTrs7zn0klpuSH1f69C//AVPmfHM3RKi+iVuRQWbn4KMmlfaHZq3iyG?=
 =?us-ascii?Q?rBsALNSZxBWq0jyxsLDeWH1kphjymrTNX7s4UNdZJi68k2FSNUe6SEmdbPdo?=
 =?us-ascii?Q?4FAqv6x5uZEowEH4z3skvdm0jzKk8ZLBRMxLYaK6Rs5UbskVEa+Jh/zBVVRK?=
 =?us-ascii?Q?sLdWrP04C+jItplzbxC0u0pnk+AmPDw3to/v2RRO/BLH/fiMrDvGIE8Va/yv?=
 =?us-ascii?Q?vJEKkMbfaSTz3j4pLf/fEqGFEuYcAADRTOGqvTDM6bpSsqfxvLySPDMKsrmd?=
 =?us-ascii?Q?te7DZy/Qm7AK7HptAo4PL4U4tLwTWYarQKB7Hfn/bIax/u21nOwdnLi4jfOz?=
 =?us-ascii?Q?hYXjEQiobM3PaMNVqemsXeJ+40Tw4xGuCxbBrQSHOFmaxQf1zb93aK7craum?=
 =?us-ascii?Q?1OVOguIR3p1EJKeWSzijR/FJ5REx7srwMPh1ncsivNwJJiud0mddeTUCpbYK?=
 =?us-ascii?Q?ek2vdGWk3bHE/PV64lTy8yyc5C59+m284pQJNhG1+YNr9EIkWuXdWvG0E42N?=
 =?us-ascii?Q?OKAmbaJ8ooiZrK3wuNiB8Aa6oLwKA/QhEDyFAu+DPTspKCXWTlE8RU+1x1gA?=
 =?us-ascii?Q?n9sszgJn52rgKGzMLOsASrQI/VX1gtzrTsApzVHndaKtgVJPRvX+ZI+m5dXW?=
 =?us-ascii?Q?I0iUq7DLntaxQZYubJCzseIgXpLl4A4ISjJKV3gwJydpr04+TyCYSLCtja8o?=
 =?us-ascii?Q?8srBfT9gvSDu+UvYyZWjYqf4UO+xXjhANoYlNB9QyW1zOLdoor9CMAWwH6dL?=
 =?us-ascii?Q?L2BJhQ4UtziSzKEEVjzeum/RcHxOE0dcoh6akbGPSPAlzIoUYf7AA30cM1gU?=
 =?us-ascii?Q?k5TGz3ybgPf+Taz+olK/u5n0s/ktfzS6xnr8u2M5+iz5Z248GkRC4WbuTV9G?=
 =?us-ascii?Q?1H8yja/ep4gdWuzXbHy5kZkZ8tXKVaGi8svrWSWAfo0EUhKopYb/8iSSeRfM?=
 =?us-ascii?Q?BAQHb5nyrCvzedjfvypw8PBdml3/Dc+LEjpco/StUZxzL3QWpccGPDBw9Gnr?=
 =?us-ascii?Q?ESMFFo5LdnaUzB4yDC0Wvgk9CzukYpaj9KBPwwLw6tWAYboaZm9uXCCgiHdQ?=
 =?us-ascii?Q?rI/fpDYI0OUXgsMLL6eYXdIVCTZGKaWmwO5a32oQW4ZtCx3urkp5yUi+n4TZ?=
 =?us-ascii?Q?QoEUBi+uOElkCd1I2aJvYcNcH2NDEwE6n/SojdPyjEfXdWhE0DfTJAzvx0eB?=
 =?us-ascii?Q?gGGHYFm9gpx5L5k7HDBfpXKN6i1PJZY5LvCMHHEBYhOWlX7przV0REMpPPcg?=
 =?us-ascii?Q?E+A5uN704pp+DDhaIQx7HPhOD/SwYDEpqphhSDpllkkHB6/dzRauxP57NP5i?=
 =?us-ascii?Q?dybU3asZQNvr2I7SlKQBU1+YSmyAqg0wnDM4Yu6t6b/fOYzhkwRJDO1w17a1?=
 =?us-ascii?Q?7ExrUhcjCt1SWYTP1dxnm2CrVmeGW1RqE7USz6eSdm3ZrA5H2eRaiBmSMyX2?=
 =?us-ascii?Q?Rf0jKSkiyDDhxPiit1xwqkT+gm+BkerNLDCKrYKaV/4R3TrnJDZs35X+zz1P?=
 =?us-ascii?Q?/FWFbnWXA2pGIl1PfeChNNYf6zxvxom/KlYVLgV6tGFr7CFUBWiqhfesIxMU?=
 =?us-ascii?Q?pRfpswXkG0LsfPiFNyAXY97fAlfOok4ZU14SEWX0IbLxNN6jrNCM5ZBDWpem?=
 =?us-ascii?Q?nevQm9s/Lw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9307053d-3c97-4464-9399-08de73f78983
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:33.7885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rIASB9doCWPtVHC+kNDjJfoycP57wYoWQPBOg+K8/z7AFYFSsSnWVMRXlRWYZ4uJ63VHcyTSqu7zhXo6XMPkoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7562
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
	NEURAL_HAM(-0.00)[-0.921];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: 57E3418DB6E
X-Rspamd-Action: no action

This series adds support for nova-core memory management, including VRAM
allocation, PRAMIN, VMM, page table walking, and BAR 1 read/writes.
These are critical for channel management, vGPU, and all other memory
management uses of nova-core.

Changes from v7 to v8:
- Incorporated "Select GPU_BUDDY for VRAM allocation" patch from the
  dependency series (Alex).
- Significant patch reordering for better logical flow (GSP/FB patches
  moved earlier, page table patches, Vmm, Bar1, tests) (Alex).
- Replaced several 'as' usages with into_safe_cast() (Danilo, Alex).
- Updated BAR 1 test cases to include exercising the block size API (Eliot, Danilo).

Changes from v6 to v7:
- Addressed DMA fence signalling usecase per Danilo's feedback.

Pre v6:
- Simplified PRAMIN code (John Hubbard, Alex Courbot).
- Handled different MMU versions: ver2 versus ver3 (John Hubbard).
- Added BAR1 usecase so we have user of DRM Buddy / VMM (John Hubbard).
- Iterating over clist/buddy bindings.

All patches, along with all the dependencies (including CList), can be
found at:
https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (branch nova/mm)

Link to v7: https://lore.kernel.org/all/20260218212020.800836-1-joelagnelf@nvidia.com/

Joel Fernandes (25):
  gpu: nova-core: Select GPU_BUDDY for VRAM allocation
  gpu: nova-core: Kconfig: Sort select statements alphabetically
  gpu: nova-core: gsp: Return GspStaticInfo and FbLayout from boot()
  gpu: nova-core: gsp: Extract usable FB region from GSP
  gpu: nova-core: fb: Add usable_vram field to FbLayout
  gpu: nova-core: mm: Add support to use PRAMIN windows to write to VRAM
  docs: gpu: nova-core: Document the PRAMIN aperture mechanism
  gpu: nova-core: mm: Add common memory management types
  gpu: nova-core: mm: Add TLB flush support
  gpu: nova-core: mm: Add GpuMm centralized memory manager
  gpu: nova-core: mm: Use usable VRAM region for buddy allocator
  gpu: nova-core: mm: Add common types for all page table formats
  gpu: nova-core: mm: Add MMU v2 page table types
  gpu: nova-core: mm: Add MMU v3 page table types
  gpu: nova-core: mm: Add unified page table entry wrapper enums
  gpu: nova-core: mm: Add page table walker for MMU v2/v3
  gpu: nova-core: mm: Add Virtual Memory Manager
  gpu: nova-core: mm: Add virtual address range tracking to VMM
  gpu: nova-core: mm: Add multi-page mapping API to VMM
  gpu: nova-core: Add BAR1 aperture type and size constant
  gpu: nova-core: gsp: Add BAR1 PDE base accessors
  gpu: nova-core: mm: Add BAR1 user interface
  gpu: nova-core: mm: Add BarUser to struct Gpu and create at boot
  gpu: nova-core: mm: Add BAR1 memory management self-tests
  gpu: nova-core: mm: Add PRAMIN aperture self-tests

 Documentation/gpu/nova/core/pramin.rst     | 125 ++++++
 Documentation/gpu/nova/index.rst           |   1 +
 drivers/gpu/nova-core/Kconfig              |  13 +-
 drivers/gpu/nova-core/driver.rs            |   9 +-
 drivers/gpu/nova-core/fb.rs                |  26 +-
 drivers/gpu/nova-core/gpu.rs               | 130 +++++-
 drivers/gpu/nova-core/gsp/boot.rs          |  22 +-
 drivers/gpu/nova-core/gsp/commands.rs      |  18 +-
 drivers/gpu/nova-core/gsp/fw/commands.rs   |  40 ++
 drivers/gpu/nova-core/mm.rs                | 245 ++++++++++
 drivers/gpu/nova-core/mm/bar_user.rs       | 406 +++++++++++++++++
 drivers/gpu/nova-core/mm/pagetable.rs      | 453 +++++++++++++++++++
 drivers/gpu/nova-core/mm/pagetable/ver2.rs | 199 +++++++++
 drivers/gpu/nova-core/mm/pagetable/ver3.rs | 302 +++++++++++++
 drivers/gpu/nova-core/mm/pagetable/walk.rs | 218 +++++++++
 drivers/gpu/nova-core/mm/pramin.rs         | 453 +++++++++++++++++++
 drivers/gpu/nova-core/mm/tlb.rs            |  90 ++++
 drivers/gpu/nova-core/mm/vmm.rs            | 494 +++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs         |   1 +
 drivers/gpu/nova-core/regs.rs              |  38 ++
 20 files changed, 3273 insertions(+), 10 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/pramin.rst
 create mode 100644 drivers/gpu/nova-core/mm.rs
 create mode 100644 drivers/gpu/nova-core/mm/bar_user.rs
 create mode 100644 drivers/gpu/nova-core/mm/pagetable.rs
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/ver2.rs
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/ver3.rs
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/walk.rs
 create mode 100644 drivers/gpu/nova-core/mm/pramin.rs
 create mode 100644 drivers/gpu/nova-core/mm/tlb.rs
 create mode 100644 drivers/gpu/nova-core/mm/vmm.rs


base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
prerequisite-patch-id: f8778e0b72697243cfe40a8bfcc3ca1d66160b12
prerequisite-patch-id: 763b30c69f9806de97eb58bc8e3406feb6bf61b4
prerequisite-patch-id: 2cded1a588520cf7d08f51bf5b3646d5b3dc26bd
prerequisite-patch-id: 4933d6b86caab3e4630c92292cfe8e9d3b8f3524
prerequisite-patch-id: 9f58738611f42a330b00bd976fbcafe2b7e6d75e
prerequisite-patch-id: 07f81850399af27b61dcba81ad1bb24bcf977ac1
-- 
2.34.1

