Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNniL3Etlmm5bwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7452B159F56
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3765010E6A8;
	Wed, 18 Feb 2026 21:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="c3jQdkLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010005.outbound.protection.outlook.com
 [52.101.193.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D8810E682;
 Wed, 18 Feb 2026 21:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQb/5rXXUwlP+led4Nxcnm478Zvu4qj+38OeYRsRWy55PBYX2csoXGD2UK0kRVNNv9lfOM6jZ1IfoM5qWv9OQIUGRIvRS+Kxedz+m1yJ7GCJVSHbkJkzfKXGzaamFlU0rIK9waXQRxnMQC0sY5Wax4rt39UW/k56lkWR60ew7FZ5OPhnQprE02l4p4Sqb8oqfe+E9faMc2jNOanzJG20WwipGGpd/mxXNFVRSAVYmMmWcrJiYAryni6bClTukBd7W2gl8XNgcVWACdGqHtQoBMF4RiJpYyQBg//rprUJ/5Mc2L4+zXvilBsKVzUlBldqE6kVNgro8ymSZBLwyYSLyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uC5xqeRpKePwkM8gzGQTJz9rgA0jif1S/46rGUE3Z9Y=;
 b=JW0NuPcwQEN/xKnwIaINmrP0hqzzj5dIYFg5iQOrXJWrojIV+K8HHEkfx3pbczDQwoVsVOB8BOGISf12QdCoL43fFwxcpd9uelxJ8HoNbBCJDQ3sADUJptDRXVvg9StvH3uPoASuohYpq/kYizNTMgAZmyO+NiFlCefIquivG7Oze5Plt621mLWFKdUTw39FRvB5U2Mjem6b44EKyZFeOIXSKamQntoPLPhLExwc7TB03ljZscn+3fZLi51RIlqBQ56qNc4UEV9Do+KvBBbWDRTx7nd0odWLJ9ic0n631sIDrIvh71DSQ8Yv159G5sEJIfb2iuVsybNPpY87sCFlvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uC5xqeRpKePwkM8gzGQTJz9rgA0jif1S/46rGUE3Z9Y=;
 b=c3jQdkLzxetiBuHDjjVaOvJAIIskL3baet+Yxm93lLTLjL/WIBjF4JzXfOmQntF3LoG/l1epIM1WwKW1vgImD2ikiWlL63TBikB4FMr8k82bY6HpzZKp85zsc+rxvkKMjMGz0wxR43GHq0gORdJ8KGeh5gjHIIKc2/5RIwz1i29wR/7v1EIzjg3sIYi9ABqxOKQ8AKT5zrLFewEZ4zOKGmwH1BDttHQ0/U8Sz0q709Hcj8FoxPhTTz09krQn2YNOclWlR0gTbWOILQf7cwpTEbLdzdfWLWyVF7uPKeCUyxD8JyS8ODXpGtzWa5LVrZwz38ZKn9WGPVvEGuKSkEpk2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB6805.namprd12.prod.outlook.com (2603:10b6:a03:44f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.16; Wed, 18 Feb 2026 21:21:38 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:38 +0000
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
Subject: [PATCH v7 21/23] nova-core: fb: Add usable_vram field to FbLayout
Date: Wed, 18 Feb 2026 16:20:18 -0500
Message-Id: <20260218212020.800836-22-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0043.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:5b5::13) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB6805:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b825681-d8f1-4f0b-c1c9-08de6f33b3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LWjguJrYKFADJXqSVDTST7cRj0JaYQNDTUDgMv9jSwAgHXuHfnK1ipwJsg/Y?=
 =?us-ascii?Q?BIK8eYJ7kBfBSMvQmtxpTaaN35/YzfrL2qW+WDGm4BYijFQ1jprU+Gm7tRCb?=
 =?us-ascii?Q?VDhw3tASLwCSTvGOgFpOIhctllK89Nmowwzsg9xEFe/TXuTi7YTzgNZs3B3L?=
 =?us-ascii?Q?+ZIKalaPdLLNI46J10Rr3RyCWQp3GE8FnNqQd89jb+C3GT3gwig/MfuJq2sB?=
 =?us-ascii?Q?skJmV4JOpPXmp9PUd+Z0LmZ+MO1ExcsMorxbu/9+KzjxlANIquOyDEaHOPFA?=
 =?us-ascii?Q?Hb5bfTVEpz+J0fKk/RwlVxcJc85FWfszyV9D8IppDvnpUeyDE/a3VXR5cZ79?=
 =?us-ascii?Q?P93LYDDcfczR1yLT4UPqpzySmdCLI/hB6f3wlWhDzqqAxiUHhtafRpcT0NzC?=
 =?us-ascii?Q?EPw8EAMgRE92/mkGRSd+YGPG1tkUWuV3Kbrdy82srCa5C02DhCx+ic37eFVE?=
 =?us-ascii?Q?DUbXhMaj6Tusc4AX7eri91cp0e+5E0PirSseiUzYLI/ApENLdEwCaTQNJzc/?=
 =?us-ascii?Q?AXjmwZmcXSOpGp3Syo+Apnr+W18PJCOlwc3BNW0vPQS74pwp/s9z6AWreRg8?=
 =?us-ascii?Q?/U42ubZsIsx4H18YZkRqw8oj7pfqWgyNeZpijE2X/AsE4efFkDfGldUzwOEP?=
 =?us-ascii?Q?Pal4fRM3UtfaeJadq/PHJwKzZBTFWSJqVTOzjZP8rpaTB6ZN1tkf6CMjK+TR?=
 =?us-ascii?Q?qFPmJOC32lU7bFpxTzVKNAPBAYscHlvgdP68SO9WrTDp9OnpKUavKOvwim3R?=
 =?us-ascii?Q?qzR3pH3GBtJ4Rf4snO5hKcrJnl5vb4SIOsND/EF1I0fQUaMDctbZe9GNMyfm?=
 =?us-ascii?Q?zm6jtxRDvHkSFIpXTWIdmDwZE9HLMYeoxk7wvvrC92DY53kiROD/rzjtbCOx?=
 =?us-ascii?Q?gk+D4kHJGKGNDNs3qfloPpBvHyixYBNmPXXGdBTortsnJfVOsOT3Uh7uX5g4?=
 =?us-ascii?Q?TM7ukakMaX16bXkZVYJYnET6I0t2CAlgFeTQPyyUMi93OhFNfySXD6vkMKK+?=
 =?us-ascii?Q?niockTKjijtJbi0IO176q6RbrerJNT5knzH8XA9Q52pk590qUm1T+tp9hcqR?=
 =?us-ascii?Q?AeaUGR/AwK/sEbH1d8tUCj9Ng/aJixFIsZAQ56vcaelaYzvFOrkOt46yCaqu?=
 =?us-ascii?Q?9WjuMQL3EXqvf7A4AHaSEWC9s86DTAHZeDaGgMFSMdDtG37vzXMc+lnzklDh?=
 =?us-ascii?Q?FLjcixbJpyWY27PuCpScRkZNKLbf+rU/6hHZceF/l1n2oyWxwb3WluyBleme?=
 =?us-ascii?Q?3IzwtN4sIRUeauOi/KopbSLOV+nLbcPT/Cbj9wKmMzvFnbFC9oTaJznhoj6h?=
 =?us-ascii?Q?tjtZwAf7wqHXUWeQ8lyNKXyaghDwQP9Lw8NOVvHME7WZqYu7XhiMtMnZnCDL?=
 =?us-ascii?Q?MlM+rZsHaVx3Mdk54qCOaw4rxYqLw4nrjmJ6C6FC9Uy1Ab32yGlWCrEUWCyh?=
 =?us-ascii?Q?/vfBmprzhjks1UCzqC9gL1E/l7Oe6OzMaVvAyh/klH0apWt9D5+bNxUyofb4?=
 =?us-ascii?Q?KxEebepQIGHf8r3i33/IX06Bho0HUAOh8gTWQW+erH66goKgAz9s7AKeaCDV?=
 =?us-ascii?Q?yGsTyM9Z+/eTPavBshE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y0KsSnfpifeBJlPneN6ReXG1MX3NFhFVihs/TnIm88V3BIZsDm2IDg/fQWbB?=
 =?us-ascii?Q?1ZZn5dvOHxcTPJYyEezF8geXQ/yQR5LXjimGiJlVU/TcfD18lL8FPxOYbuMv?=
 =?us-ascii?Q?Jdl2zMwsPq3XJw3HVzACjDIEIxsOI48Oo4wB89ocusO4Ool8C0CCV22RMB1r?=
 =?us-ascii?Q?AmE4LaEJKkGKizapigqoshi0GmSjXMHwzh6GllsAlqfX3MMnFv56kRQFEEdL?=
 =?us-ascii?Q?CIBnJKzYBuqGwVJRyH09Yj9c5MFzSMZXbhJC2qTyiIZ7gQnKA4hDvEilxFrb?=
 =?us-ascii?Q?UUr4PxFMY2piEo2vzH5voZYH7YkKcZ9HakY6oiiX+vzc53kJTXRujNUab3TG?=
 =?us-ascii?Q?fI7r8r5YbJSZTS0Ihl+WYRFiNComr1JaTU+9i6G6PBgWHQx4czrrSotkO4w5?=
 =?us-ascii?Q?KNgvjWOY0rHA0siX59FNwNQ8jY9XshGfwDlzRW3JJ8R3is/DM7B0QJN5WsO4?=
 =?us-ascii?Q?TgMNCy2P/vWNYECm7gvRwFfp9WW2UJmSNl3url3kr4MH33nGRuiqoHlLWlQD?=
 =?us-ascii?Q?CIM3dxUTjO0M6DkgdyMr/vzLbIi/V+GSwY0gSd4MCgJzcEcNvmD9yzT5RqkG?=
 =?us-ascii?Q?X+dlSqBgcE5bGqLoEBQ+pw/N2tIXpGpyu601NnfI+BCchZqkYX9q3UH5SVj4?=
 =?us-ascii?Q?2c0vBn462FyTN14jixPWywXEHvSnwLEf008l9tsIi4ZeJevTeTGjoxIGw4T4?=
 =?us-ascii?Q?PLUuXO6ddzeqQAZn0uxtCWC193gqPrCpaRhV4k6MR9EdYplpsQapHantuaZR?=
 =?us-ascii?Q?YhIY2g8WF90oqhpQjB0lX1parvujIECgyliZnzWVKIjJLW1tgCgdzx7v1FDs?=
 =?us-ascii?Q?gDINNGNI/p202P5+MZ+snonCsRAbbgGqFaCpN47gQ2rW2Lfw13jm1oEwzmZ5?=
 =?us-ascii?Q?cNsYQG08Gw9+OPV/Vs3IC+Qd6XictCOzUrgPw79L3Mwl6n9QZwg1Pwwr66wW?=
 =?us-ascii?Q?Vqz0H3CUE0YocBZAjKcQp4ze2bAfLbY6sZMIZ2XMmHAluaqd5VpGTROnCp3X?=
 =?us-ascii?Q?1uH4VVNimjnPmztk5jb2t4TLh81PrUdYfGJ35QiVGA6BQgXLksDKw5QOUGir?=
 =?us-ascii?Q?++o+EDtYxViyhEe3VbIdqbTxYAHhW64jPeZgahCX9CP8APWMIS0fs8zSOY9t?=
 =?us-ascii?Q?VBeSXGf0xsTd7wh7GGs3K6uVf7YN6hWzv79A1P0FxpbdtptrvvZMapOlhf2D?=
 =?us-ascii?Q?dHZWFDW65VFL0cnlJHYtgH8jDCURYOQyVPYe7+utvobiNAPwo0soHXJku6op?=
 =?us-ascii?Q?0WvwvNkDGjnmWsZZcIpIDSJ0FqEnnkBfchsltKLvpZHKi1lyNDWfrHlihIpy?=
 =?us-ascii?Q?hFEXpp+5yXZB8B7gei5pW1tvmBl/yywbctBXPvojzxEzppH2Sx6aLUFka5Az?=
 =?us-ascii?Q?d5It2+CcjcGFgVLOTr0YeLxImNKQ647sDNC6wd5AN23br3+hrCxAgq/y03IK?=
 =?us-ascii?Q?4KFgDnBwUfPtYlu9NHOid33Q/6927GQrHI99qhGXebTWH9UIVDO1M9kzXFjr?=
 =?us-ascii?Q?Kbx4HK5FPYW4ckmRbI2rnIG8abnUodbfkk8iZ/h7OD6SFbanNjcTi1OGw4lI?=
 =?us-ascii?Q?vLYQ0+/RK7IxoF+OoCZbYqsFiDNo6TfMvvGh+wLl2kSNW9tqG17j2gtCXOx9?=
 =?us-ascii?Q?Yl/R/Ny68bfPonYbdzPz0H0yiq0N0hH8DlWfIfgCBj69ZAswUvs7wmcbOZww?=
 =?us-ascii?Q?BChGPVGbYdpellXPVAHByjzV8rj2drgp6Dh7ynd5BFmcmqPnqi6W+O9nORSW?=
 =?us-ascii?Q?XfBtJik3iQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b825681-d8f1-4f0b-c1c9-08de6f33b3ed
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:38.7510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MlljmiwNWpPyrbZ5m7M21rdPQBiXPtVbFMFR76P5E8roY8ASvIY903iF9lVTtJaG/qJBoXOI/UvY0M5/rMYpog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6805
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 7452B159F56
X-Rspamd-Action: no action

Add usable_vram field to FbLayout to store the usable VRAM region for
driver allocations. This is populated after GSP boot with the region
extracted from GSP's fbRegionInfoParams.

FbLayout is now a two-phase structure:
1. new() computes firmware layout from hardware
2. set_usable_vram() populates usable region from GSP

The new usable_vram field represents the actual usable VRAM region
(~23.7GB on a 24GB GPU GA102 Ampere GPU).

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index c62abcaed547..779447952b19 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -97,6 +97,10 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 /// Layout of the GPU framebuffer memory.
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
+///
+/// This structure is populated in 2 steps:
+/// 1. [`FbLayout::new()`] computes firmware layout from hardware.
+/// 2. [`FbLayout::set_usable_vram()`] populates usable region from GSP response.
 #[derive(Debug)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
@@ -111,10 +115,14 @@ pub(crate) struct FbLayout {
     pub(crate) elf: Range<u64>,
     /// WPR2 heap.
     pub(crate) wpr2_heap: Range<u64>,
-    /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
+    /// WPR2 region range, starting with an instance of [`GspFwWprMeta`].
     pub(crate) wpr2: Range<u64>,
+    /// Non-WPR heap carved before WPR2, used by GSP firmware.
     pub(crate) heap: Range<u64>,
     pub(crate) vf_partition_count: u8,
+    /// Usable VRAM region for driver allocations (from GSP `fbRegionInfoParams`).
+    /// Initially [`None`], populated after GSP boot with usable region info.
+    pub(crate) usable_vram: Option<Range<u64>>,
 }
 
 impl FbLayout {
@@ -212,6 +220,19 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             wpr2,
             heap,
             vf_partition_count: 0,
+            usable_vram: None,
         })
     }
+
+    /// Set the usable VRAM region from GSP response.
+    ///
+    /// Called after GSP boot with the first usable region extracted from
+    /// GSP's `fbRegionInfoParams`. Usable regions are those that:
+    /// - Are not reserved for firmware internal use.
+    /// - Are not protected (hardware-enforced access restrictions).
+    /// - Support compression (can use GPU memory compression for bandwidth).
+    /// - Support ISO (isochronous memory for display requiring guaranteed bandwidth).
+    pub(crate) fn set_usable_vram(&mut self, base: u64, size: u64) {
+        self.usable_vram = Some(base..base.saturating_add(size));
+    }
 }
-- 
2.34.1

