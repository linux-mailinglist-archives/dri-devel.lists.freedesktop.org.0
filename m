Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFqcGDTpb2lhUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 104954BA27
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C556E10E6AE;
	Tue, 20 Jan 2026 20:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m4kyjckk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010068.outbound.protection.outlook.com [52.101.56.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D4CC10E69F;
 Tue, 20 Jan 2026 20:44:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LZs9evmn2BGRhj35gG3BqOUO6dHSAcNo2NhPKtj8rAQl2Su1cVT+r4YhHJ0AOUgoAl7EIc0ScIlXgz4eseg8SAfZ8HD5HEehR/AVO5hUV3SQzzSCP2KCea5WRFGiKmid9iYN/6s1OvGpV3MzoEVr2rj8V1lM5SoceFy9Xh2EDH2ygco399WHgPwSxqqFjjBhspIKhwfvEbbDh/0anMPYr/7kDIG2VmaZ0aXtTxd2gu/uxK+EwHe2cTmocRfyzdX4X7hFJyc0EGS540A6/v6r0t/9F6G0/rv4ip7mHoHPp+WbaQdQyNJfvo7O8EbqtmQ62vdbZhd8hRKNVTGdNNHD5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3B6BwPSG7uPgdLz7djf2QctppdbLx2NhrqSzuC8zHsM=;
 b=iDuAIcEzmPltioUKi4nmViMAvOVrb/d0yfp++P+1qVIyOXIUFmtTE5ZJzRLC3THcAaiek4KLdFc2Hxvk9kPS5/GAM06Cmiw3cBBljjgb4L3aLaG0EhrDG8BTagxR9cgUio8DSYWZULQG1Kforhw9PDt1FSuwfuxNMNxGoqDHvJe/xUqf7pM7Mx7AH/04fNl4PpMHZKH+GusnUwqGPVROMkm/xINFdfHKM/NRlzOZR62GfDtnkKxgDs2I8EsGXWB4P9ari7iOidp6LpPXcUg7QrEkvBFk50JV0tz2p3q3QhiJ3V26073WbEbXFfsrRmz00Al5QG7+suSwUyhw7FcGCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3B6BwPSG7uPgdLz7djf2QctppdbLx2NhrqSzuC8zHsM=;
 b=m4kyjckkcnvU8g5gZk/XtsNYhfr2/dUpLLpCVUr7J8vkCiyfdejjDdqNnmBkgR/208rwi07eIrgiyNg15kpO8zoIylQKeQ9NcwO+E2sUm9we5sqGqfgbDns82Xer14R6zyRIAwjD0uzNqTMRn+YcQQi50Oj14Hl5+0zInjaz0g7IaGyJ1V98mqOwCnEtsWPq6CB/zD/yBHvQgjE2aHnK/b6akBg1IBg6pagRTH2ptrnqBRh3L0de5eBeYGASHEIPaoiEenfFvc5AQZnYsmKgqKPfBZMqVnOROPoaCgZawaOHbK3aAfxAqZuk0FwB3jaJgfObQDwQ9pfUErPQdUhODQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:44:19 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:19 +0000
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
Subject: [PATCH RFC v6 17/26] nova-core: mm: Add Virtual Memory Manager
Date: Tue, 20 Jan 2026 15:42:54 -0500
Message-Id: <20260120204303.3229303-18-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0055.namprd20.prod.outlook.com
 (2603:10b6:208:235::24) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ac031ca-be4a-468f-6028-08de5864af0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Mv2IUTHe7HHKzs1exZAgzBnNba0Z5sDDq0Igfg5xMwPWuUMLg+BBuN1BLa1o?=
 =?us-ascii?Q?jbA+Vth/zMR5KgOvuV6pbtVTJL+ER7tNE6pM3/bAtfr4LYHc7oX2sCKraGV7?=
 =?us-ascii?Q?7z9bw26cmu1chW6k1t+p7EIKDeBfVv5TMdQorycG9qvvTz3DJ3aKepx8mWgS?=
 =?us-ascii?Q?e5RJTQ3O8SnoCyluNrXx0R7kMSqQkW7+2c58ly0F/SWhs0eKNRsZE3cMV75R?=
 =?us-ascii?Q?sJXeBPdWc9RaK8NQ6y1vlkJat53qkxlF7XsLFlepi+bn+ZpGt37m/PI7jPHM?=
 =?us-ascii?Q?oafrodDTy0YHZHlsOKN1DO1dA16DSjGZTqtHOSwuGbs5mWvfbjIH9JTIBp5q?=
 =?us-ascii?Q?VQDbL+7yX4WM7xoN8o4w2M0pfEe/nTPYbDpr9kMd8zQT1vhgmlTEaRMHDJaV?=
 =?us-ascii?Q?0qf0Zg/+rt4vM4E70+p4mBjzgQJZXDIBcrNwYQu4MhuI8oU+lLoT88MBRB3s?=
 =?us-ascii?Q?4qnSgfBzIZCMCVhwTFGfEWpeWhbPwIUCCBogxayvPhs/0lN3mhG6QiUssL+z?=
 =?us-ascii?Q?FT2d7kdG0gzBelzrHtivixSOTaRQmpKL4LZOKiP3Q7fNc2mojoMBppcRnmrf?=
 =?us-ascii?Q?wAfdGnR1EwGCOin5krzqZ1VYtreZNXwQ2V8FquJ4al+e4Obun6e7yMyfoyEy?=
 =?us-ascii?Q?zymp0vCkhaWt0CIk/NFog/K3AEh4R1p1otjX0hqawyHtAwFvAKTsSljG5xim?=
 =?us-ascii?Q?QgVxOk6LHmTEQMjhNqVeLWMCc4ek0wM01Mra0dFeyTAPlDcO/pyC0XUO1Bj0?=
 =?us-ascii?Q?GnxiJE3n3+fhmCS3LexhV4elMmd9PiD4S7tTwTpOgnnFsztWkPy8fc//Mn++?=
 =?us-ascii?Q?2XUNNW2qR5mLodSPvUEDTuzr7T7IAdyWdDI7FNhfhpquVDnjyrgJ3koGDdc/?=
 =?us-ascii?Q?Z+RULRUhvYjz/NP0sAiBENsuG2HhhhUAVpNDeXY/q3ahyhk3o/1okVTnlmfk?=
 =?us-ascii?Q?185wlFR+Xb2Ze6HSRBMtfPO1mBbEm08G50gzikeKHlD8wegRQhQEPRZvA+In?=
 =?us-ascii?Q?tuGiWOyexSuYOHSkrhL7nV0FIgjQ5Na1Fd9gz6maJovhjR1JPRQawHmKEoPW?=
 =?us-ascii?Q?h6zFhJ7huGWWTvgtUf9MoCM93H76dc8ekQfTjmeOfRLpXFquQTs3eJ2Gi/vd?=
 =?us-ascii?Q?D9gCHrUoTYz7wmjAN7ruvhKKacmXTXKZGKT/JIb6Vk95jRspe3Ke4VMtqidz?=
 =?us-ascii?Q?+vHET+1tjAsygx5YKK6v3LqkDxrNIqoD/5Bthbvj1JTHx3p4i/vBNQ8sjgIP?=
 =?us-ascii?Q?CWjxYQmFZc106pj3wE4ao4mAJ0KFyHZxl+BJyv+X4QBVPqC4DtceNhseJyZe?=
 =?us-ascii?Q?XA4N7SPxPSBQGFYjnNTDH/xCKsERsQKAAAe9E9b5wjUB6DyU1CY6Vqy5S+yD?=
 =?us-ascii?Q?bztmGQNNULOC2UF8DUAI6I+/YFhQTCxybypbyEE6plW0yukgWpU357N+gSIO?=
 =?us-ascii?Q?jZrSP6bjaceijwd8ZdJpuCmQgCD/iNhovoBnydKHSI3IDfAb88NQcLY7U40O?=
 =?us-ascii?Q?lZ0JzqgE216c1en00L7tfNO/FYHwWiFdYkDU9tJTNOnsRelIffakyMtHipww?=
 =?us-ascii?Q?vtSvef7H9OtzrxSuEE0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cYHvAC6RMBqd8pNjtglYPzziiZY7j+uT9SAbKfAZ/C31gP4//12XopEjo6Pg?=
 =?us-ascii?Q?0a/st+5ff57y+pdyj2/ZTDQt2Hx6FXjoVUd6+4la01yiI/fysOdgNzSoTtje?=
 =?us-ascii?Q?bQQ99M2G0uCGiSnX/yLya4qMH2CVqmg7QP0MecHFEU8l1H3bEliAxgmLvxEC?=
 =?us-ascii?Q?KJT+7/86gKVuJqCwwPFdY10jeEb1+DvuPXRmnMD3Ii6lpsP3Vv7uxRDSiUKj?=
 =?us-ascii?Q?wkYzcZSru+fUTcG0EV2cg8kq6mYrROWqKQQzoPJg4W4LoiyJfKxUMxLox0HE?=
 =?us-ascii?Q?x50gv8l8c+oYRbrRo1WbX8q3YxHsu7il17hw6x5EZmg101B/X/4aKMEByVJc?=
 =?us-ascii?Q?8AllOMtm44joxv2URnOjCV1m98jGNtuarHnYMLJCxs8fEx/0zXb/kuKmbSiQ?=
 =?us-ascii?Q?DQmi1c0yPFyTFWRQZVNR3K9MUtIj5F7ZnbAPbkoxG48RU9lzPezQEPgYrnBE?=
 =?us-ascii?Q?mzAm4RBOZDzCmsZQ8Hoz64R3ISLSYNwxj/6MIbpVDWloINjpVyfzR52gC2iE?=
 =?us-ascii?Q?YMcfEEPWmt0LyXqfNO7jGKiE1ThKuUc7v298KOQSjL6+uK14Y+JhXlqbKry8?=
 =?us-ascii?Q?3r7gRsVOnFlq2SrkutaYa/sAejJug5CqM3d4OdiWqpKnTFccGV7gUaqXx+Rf?=
 =?us-ascii?Q?pQFT6An5ePgxHP29dLoLDb5zuPikg7zudg/0ejdDtHJh9lBVYLWDHJPn1aE+?=
 =?us-ascii?Q?B6ri0QNFGIf1bk5MYrMAXVbFUwqm2EejPZ8bW1AVorihk1vXSFPYEOnrG6zt?=
 =?us-ascii?Q?Ml0MTNPMz2X10SR/L3VTPaopHvt8iSjUVWMb/qml5nuOdg3ksQCIaIRrlldt?=
 =?us-ascii?Q?e6cymAtdn+pr8GHvkgeF6XMgStxRPkUOmxtwG0o5s6KbElsoGPHQc+QROe+c?=
 =?us-ascii?Q?wQe46P+7hFZb9K7MuxbwZezqA5JIH+kZY4aitWg9W7nUp8QjecNv3QICG1gz?=
 =?us-ascii?Q?LeRE2mrO00+btJLB3RSXmxDx7zpDSkrgXV/HNBJ1cGEuElqRdy4HkF2dLbtH?=
 =?us-ascii?Q?W/rRyVQFIYJms//XIMMAk8czLyM8l3qYO/L2gygGci9pFK5nog6P6r+ryQJO?=
 =?us-ascii?Q?eboNDqPKiO239SzHdlGFIsKjis4eazfF+hf1bJfcZLJRrlYLCsFO4crOGZfj?=
 =?us-ascii?Q?cGiw9alfM6ghZxvyu2kS0n2XmVjcHGHxPfnF77/kiYdssMxXh31nJoXeOoS5?=
 =?us-ascii?Q?q6L16A8pUvDXpZhcRX0k/iT+U1eNAr7RtCXCII55bQxYwXauawQ7ZdoG2Pxd?=
 =?us-ascii?Q?yekRy5vAyvMWevG+E8aaWSxqQLRgpxCbCVazopJoYVsdRkEkzjjgKNlTY+4v?=
 =?us-ascii?Q?kzSkZdz1it9s0iL8dmR0wZniceArwsANJ8ST6BMiglE4HAZ8gVZmtXL1T9I6?=
 =?us-ascii?Q?FiEYTUu15GbrvMCStXUj5OPLm+3goytl1eNMNwEWPp6AHkLTgE3fhHd2D5sa?=
 =?us-ascii?Q?mY3fsbl+Ah3rhFTRKSufL/3fWeEMrokaffoJHeimENbo/W9kr+Q6MShODf8T?=
 =?us-ascii?Q?GnUuzsX7tcePno/6P5YQCS5YuRh2orcSskzWQUs20gM/X04S0aMz//Pbigaa?=
 =?us-ascii?Q?h4/nrQdHjvKy33Z8v/15CnPhS02FwQnf+6t365RLjAOXxvvvYeemByxjTbOV?=
 =?us-ascii?Q?beA1+k3pdjPgR8Jx8zcxIl5w3pfkRJ25PxjHyAK48GucqH4uA39JbBrZQfnU?=
 =?us-ascii?Q?r477Bli6u/sebdmVhBDMQi535VJHDpYYddvClRmAmj8LN8WwZnpjCRU59Fep?=
 =?us-ascii?Q?n/Jm6E5gWw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ac031ca-be4a-468f-6028-08de5864af0e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:19.2015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PB5lB8uuv5y/N4XP3nqJAckqBxq6waiuNVeTLI3k4lY32ZMi8s9D3yF/3+GNlkqG1EhrDCeI4L0ETTKxM+KiHw==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 104954BA27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the Virtual Memory Manager (VMM) for GPU address space management.
The VMM provides high-level page mapping and unmapping operations for
BAR1 address spaces.

The VMM provides mapping, unmapping, lookup, and page table allocations.
Uses GpuMm for access to buddy allocator, PRAMIN, and TLB.  Extends the
page table walker with walk_to_pte_allocate() for on-demand page table
creation.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/mod.rs |   1 +
 drivers/gpu/nova-core/mm/vmm.rs | 204 ++++++++++++++++++++++++++++++++
 2 files changed, 205 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/vmm.rs

diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
index 56c72bf51431..53d726eb7296 100644
--- a/drivers/gpu/nova-core/mm/mod.rs
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -7,6 +7,7 @@
 pub(crate) mod pagetable;
 pub(crate) mod pramin;
 pub(crate) mod tlb;
+pub(crate) mod vmm;
 
 use kernel::{
     devres::Devres,
diff --git a/drivers/gpu/nova-core/mm/vmm.rs b/drivers/gpu/nova-core/mm/vmm.rs
new file mode 100644
index 000000000000..a5b4af9053a0
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/vmm.rs
@@ -0,0 +1,204 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Virtual Memory Manager for NVIDIA GPU page table management.
+//!
+//! The [`Vmm`] provides high-level page mapping and unmapping operations for GPU
+//! virtual address spaces (Channels, BAR1, BAR2). It wraps the page table walker
+//! and handles TLB flushing after modifications.
+//!
+//! # Example
+//!
+//! ```ignore
+//! use crate::mm::vmm::Vmm;
+//! use crate::mm::{GpuMm, Pfn, Vfn, VramAddress};
+//! use crate::mm::pagetable::MmuVersion;
+//! use kernel::sizes::SZ_1M;
+//!
+//! fn map_example(mm: &mut GpuMm, pdb_addr: VramAddress) -> Result<()> {
+//!     let mut vmm = Vmm::new(pdb_addr, MmuVersion::V2, SZ_1M as u64)?;
+//!
+//!     // Map virtual frame 0x100 to physical frame 0x200.
+//!     let vfn = Vfn::new(0x100);
+//!     let pfn = Pfn::new(0x200);
+//!     vmm.map_page(mm, vfn, pfn, true /* writable */)?;
+//!
+//!     Ok(())
+//! }
+//! ```
+
+#![allow(dead_code)]
+
+use kernel::{
+    gpu::buddy::{
+        AllocatedBlocks,
+        BuddyFlags,
+        GpuBuddyAllocParams, //
+    },
+    prelude::*,
+    sizes::SZ_4K,
+    sync::Arc, //
+};
+
+use crate::mm::{
+    pagetable::{
+        walk::{
+            write_pte,
+            PtWalk,
+            WalkResult, //
+        },
+        MmuVersion,
+        PageTableAllocator,
+        Pte, //
+    },
+    GpuMm,
+    Pfn,
+    Vfn,
+    VramAddress,
+    PAGE_SIZE, //
+};
+
+/// Virtual Memory Manager for a GPU address space.
+///
+/// Each [`Vmm`] instance manages a single address space identified by its Page
+/// Directory Base (`PDB`) address. The [`Vmm`] is used for BAR1 and BAR2 mappings.
+///
+/// The [`Vmm`] tracks all page table allocations made during mapping operations
+/// to ensure they remain valid for the lifetime of the address space.
+pub(crate) struct Vmm {
+    pdb_addr: VramAddress,
+    mmu_version: MmuVersion,
+    /// Page table allocations that must persist for the lifetime of mappings.
+    page_table_allocs: KVec<Arc<AllocatedBlocks>>,
+}
+
+impl Vmm {
+    /// Create a new [`Vmm`] for the given Page Directory Base address.
+    pub(crate) fn new(pdb_addr: VramAddress, mmu_version: MmuVersion) -> Result<Self> {
+        // Only MMU v2 is supported for now.
+        if mmu_version != MmuVersion::V2 {
+            return Err(ENOTSUPP);
+        }
+
+        Ok(Self {
+            pdb_addr,
+            mmu_version,
+            page_table_allocs: KVec::new(),
+        })
+    }
+
+    /// Get the Page Directory Base address.
+    pub(crate) fn pdb_addr(&self) -> VramAddress {
+        self.pdb_addr
+    }
+
+    /// Get the MMU version.
+    pub(crate) fn mmu_version(&self) -> MmuVersion {
+        self.mmu_version
+    }
+
+    /// Allocate a new page table, zero it, and track the allocation.
+    ///
+    /// This method ensures page table allocations persist for the lifetime of
+    /// the [`Vmm`].
+    pub(crate) fn alloc_page_table(&mut self, mm: &mut GpuMm) -> Result<VramAddress> {
+        let params = GpuBuddyAllocParams {
+            start_range_address: 0,
+            end_range_address: 0,
+            size_bytes: SZ_4K as u64,
+            min_block_size_bytes: SZ_4K as u64,
+            buddy_flags: BuddyFlags::try_new(0)?,
+        };
+
+        // Use buddy first, then pramin (sequential to avoid overlapping borrows).
+        let blocks = mm.buddy().alloc_blocks(params)?;
+        let offset = blocks.iter().next().ok_or(ENOMEM)?.offset();
+        let addr = VramAddress::new(offset);
+
+        // Zero the page table using pramin.
+        let base = addr.raw();
+        for offset in (0..PAGE_SIZE).step_by(8) {
+            mm.pramin().try_write64(base + offset, 0)?;
+        }
+
+        // Track the page table allocation.
+        self.page_table_allocs.push(blocks, GFP_KERNEL)?;
+
+        Ok(addr)
+    }
+
+    /// Map a 4KB page with on-demand page table allocation.
+    ///
+    /// Walks the page table hierarchy and allocates any missing intermediate
+    /// tables using the buddy allocator from [`GpuMm`].
+    pub(crate) fn map_page(
+        &mut self,
+        mm: &mut GpuMm,
+        vfn: Vfn,
+        pfn: Pfn,
+        writable: bool,
+    ) -> Result {
+        // Create page table walker.
+        let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
+
+        // Walk to PTE address, allocating tables as needed.
+        let pte_addr = match walker.walk_to_pte_allocate(mm, self, vfn)? {
+            WalkResult::Unmapped { pte_addr } | WalkResult::Mapped { pte_addr, .. } => pte_addr,
+            WalkResult::PageTableMissing => {
+                // Should not happen with allocate mode.
+                return Err(EINVAL);
+            }
+        };
+
+        // Create and write PTE.
+        let pte = Pte::new_vram(self.mmu_version, pfn, writable);
+        write_pte(mm.pramin(), pte_addr, pte)?;
+
+        // Flush the TLB.
+        mm.tlb().flush(self.pdb_addr)?;
+
+        Ok(())
+    }
+
+    /// Unmap a 4KB page.
+    ///
+    /// Invalidates the [`Pte`] at the given virtual frame number. Does nothing if
+    /// the page is not currently mapped.
+    pub(crate) fn unmap_page(&self, mm: &mut GpuMm, vfn: Vfn) -> Result {
+        // Create page table walker.
+        let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
+
+        // Walk to PTE address.
+        let pte_addr = match walker.walk_to_pte_lookup(mm, vfn)? {
+            WalkResult::Unmapped { pte_addr } | WalkResult::Mapped { pte_addr, .. } => pte_addr,
+            WalkResult::PageTableMissing => return Ok(()), // Nothing to unmap.
+        };
+
+        // Invalidate PTE.
+        let invalid_pte = Pte::invalid(self.mmu_version);
+        write_pte(mm.pramin(), pte_addr, invalid_pte)?;
+
+        // Flush the TLB.
+        mm.tlb().flush(self.pdb_addr)?;
+
+        Ok(())
+    }
+
+    /// Read the [`Pfn`] for a mapped virtual frame number.
+    ///
+    /// Returns `Some(pfn)` if the [`Vfn`] is mapped, `None` otherwise.
+    pub(crate) fn read_mapping(&self, mm: &mut GpuMm, vfn: Vfn) -> Result<Option<Pfn>> {
+        // Create page table walker.
+        let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
+
+        match walker.walk_to_pte_lookup(mm, vfn)? {
+            WalkResult::Mapped { pfn, .. } => Ok(Some(pfn)),
+            WalkResult::Unmapped { .. } | WalkResult::PageTableMissing => Ok(None),
+        }
+    }
+}
+
+impl PageTableAllocator for Vmm {
+    fn alloc_page_table(&mut self, mm: &mut GpuMm) -> Result<VramAddress> {
+        Vmm::alloc_page_table(self, mm)
+    }
+}
-- 
2.34.1

