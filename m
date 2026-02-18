Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2HmrL10tlmm5bwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7071E159E4A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03FA10E675;
	Wed, 18 Feb 2026 21:21:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wo+I71ex";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E237C10E653;
 Wed, 18 Feb 2026 21:21:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2nm0NnkA1/y/I2p0LelgJsswPd9wt5Couk77QTeNsLUFdB8aNeoLgGFQVntnn3gIC0nIzhuUX1hWZsqhJfXe60PNXLXbIsFlq/6TEK/OErT003MPxPB2QpE48CXxDGfoYk93ZN43j/fMywBHxaDUhTpfP9tXCqUXpdY5PWhkr9Od33I5k65eVwoqKKb9QfFx4wmQ8ftsA3d3/6I1/23Q9l5rnMhdp+3YbWPqHQDLyHab9OrKvd75IrkzpNGFzCXILUI8QgauyV4TYrWrs6YLStnvKEXwTAmACuvJMt5jPqGZz2K2Lt3fNAO2VC5pSopWaiSvdAqElzuoC7dhoMF+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dg5EMgWYo0DHB/uO+FhKSLFh/5BwlURcswAEZZ2IK88=;
 b=tTh6EJ09KZXC4p1GuFciP3vebES+6jtf1Yy2CIYpZt2LGU4047nmKKtfrA3p7HRSgtfR3CE3sCIiVNzt9avkfaexwVD+H4SfKyRaLqcIGgfAwRck4G+6X5aokEknUbMMzQUlhOQaO8qrKrX/fG6zZAzo4IEuvC9kzqmj7bffot9CDqpDBLPOIqGsQlSE3HixvEhHsst7EX/WXmybUDqDwOn5SIA8pyziC2go2/j3HeqXBkZy1RnaSCkjMegwYm6/Vqrf7J6opvlF5DR0FHIErcZiVJdIfxVr4pIuLadtbSNkf7RPPpL3bO/XjaeifDOImy7NjugvrP83DZZEsvPMnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dg5EMgWYo0DHB/uO+FhKSLFh/5BwlURcswAEZZ2IK88=;
 b=Wo+I71exBVqOpCW1WuiGV1tN7gIqUZ+Gf5DguXxf2AETEzh7Gl8G8vBrkCivK6viBzi4omlpeqH9qTEaYNg+2wLbjVG5rTXHiwXh9dgMmC8IXswC/eEzb25bVOXzyUkooG2NB/j2Owqbx94ZW4KbnFi2bdGncxeX21vhBU4M8vZtBGMazULVFV39FGwb4MDABQ6/oonzlwzoJem40F5mAYdu3RdLW/hOwJyujlRyXL6iFu9YI2LI/3ArIQdQ9FFQ28bAhqGLU70giUi9QdDzpOFXXF25typkfWaEHSHfLmlpne0SKJL59s9+ZYTK9EM0LFIA93TYJC51U9BlsELpNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:23 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:23 +0000
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
Subject: [PATCH v7 11/23] nova-core: mm: Add GpuMm centralized memory manager
Date: Wed, 18 Feb 2026 16:20:08 -0500
Message-Id: <20260218212020.800836-12-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0131.namprd02.prod.outlook.com
 (2603:10b6:208:35::36) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: f4869207-405c-4944-c4ca-08de6f33aa9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WfvZOr7+dDEqzP2WiSaMKk1uYgQT0rkv97i9Lv32tVl3GM1xIP8BCk7a3iTw?=
 =?us-ascii?Q?f7AE9RHa3vKB7tKTQiFqfDdW9InvXg8OF24993jw4iU99Kp+lw14cG6Yij+t?=
 =?us-ascii?Q?VOWDdd4LBL0hUqmNxqhdFEin2ycLr3hGSvsrEkOW7XzRVCH7t6gChfAFxfHv?=
 =?us-ascii?Q?HmMCUgak6bcB+ndxGQp49GpeSQw3rMc4YMwEdmhI6f1xYp+GDJyGqJemqv/3?=
 =?us-ascii?Q?eUCXgPKa+JJFSYox36f4YKIzeYSDgV8sg4Y1qCzBWE1o8glpVyycdAq1coRX?=
 =?us-ascii?Q?iIaJi1xCbJplU3ZX2WQDA+VKW3RXpWftUkrUyUP3lbTGM22I2rRKTbR1N/Bl?=
 =?us-ascii?Q?Mjq2+n3Q0UTKxEbjnUs8Ljwpe8GGxYp5agqISYHtIqXpITawoYOptp9Pav+w?=
 =?us-ascii?Q?VeEoNFx/PY8uGCdH7T21xGOMSIAy1Y1G6hz1tjQBb3BNt0G2EfwAYI7TD9jj?=
 =?us-ascii?Q?jnCCXSdE/Zs6cfYNqmKSSg2f1ZGByV7a6MgoZKGbdKWNeReoVjoRqnYXSj6h?=
 =?us-ascii?Q?7Iwm2z0uSkjzwoOBl+hCnb7KUlxD+78fL+YZ0Cz6ZBUa33WQ4KMjmkT9JShn?=
 =?us-ascii?Q?NqlWDM7EkOm9k9G1XYCCI1g6OBb/erRogiVtvBjQ2Ly+ViDqnu196amu8qYL?=
 =?us-ascii?Q?N1E3StPQpTNhVOcJM5xemZGAkOSEDqgWDQzvLoBo7BbWpRRPK+S6/LywVn6f?=
 =?us-ascii?Q?VuPIo5EQPEUDSFzeXyp7UVahLeLzBZzBNrU9WBHXHSvnm0IllfU3HsrYdEYv?=
 =?us-ascii?Q?rts2mk8ObEzAZP/bzW4AF8FdoP3dr0uAhSUqsuVouV4jOZb+Y6/4aoZl38Rj?=
 =?us-ascii?Q?x9dPpT5O7nhD2yNIL5WE+8UvRZuzJyOLPNSonrVQSwPHPttEstD7sktAKflW?=
 =?us-ascii?Q?ctjDBEqbSh3tKD8X5HrTb/27se8qPxJ1n9cd2kWACDhFVvuOr7Mo6d5IjxrH?=
 =?us-ascii?Q?HU0ruQv/FCyRTuXfxsZhAva5RJQXbaDGWy633SZv30QTF7YBaNMdg8qjZ3vm?=
 =?us-ascii?Q?oaxR7uiL8WEIExrCKLBtsKylWODKjzrDYXIm6rwUKcyUGarqIsEks37qY8D5?=
 =?us-ascii?Q?JlmbZI6tnPwAsRPUUcbmfGXTD7AxgCSET0XnmaQFY+HR44fx38oocWrvEl12?=
 =?us-ascii?Q?yrpkya7z345tif1eFi9JBZSaKqScmutPzVyJz7d/vbjc/sDl9KJ985a12pbF?=
 =?us-ascii?Q?n2+Hk00knsDUimju8v34GmgAccdoSL6NDmkKpFK92mZeI5dmQkOlCR0DAWAx?=
 =?us-ascii?Q?wKhjSt4QzlYs2m1eONPO5dd8VTxXUGa53X1zRqYGsP1+7igbZKrpZwAfBmCd?=
 =?us-ascii?Q?rXg9yH+1ZXQaXsVzwH6nU9K/V1o80trb7c5a2wTzJHIU7NBRFJF68pV6M6rF?=
 =?us-ascii?Q?mhoJT2r+oHw6K2U//Mqc1tmAZ1w4vbesN45LQ7lhf7dVbeomwQDSx41QVujt?=
 =?us-ascii?Q?r3xYwcE47dMcNxomV7vjp1cBb6t4gJZ0IQv4aitGZpnNHHGJGIA/ocPyb5gq?=
 =?us-ascii?Q?GcnjqeZsDJlCDbdtCgrqhpP9Q57elt3Kz5lmcvl8/8UaHmdkkiTvVsfe5pIu?=
 =?us-ascii?Q?yorFRfaoFGKBdZGZx74=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3TGCOxjMxtr6L1VfVTg54iAMLqiCD5RLgOYcOKDIeGwe0NM1Ybe6HbFw5tfM?=
 =?us-ascii?Q?oMeuxiyLdlf4gfjQP67bdL0T91+E6t/6macGwbiVo94AtB65UMTbtKVtNXC3?=
 =?us-ascii?Q?Fc4VAjaY5DxR/C3aPlXy/g68KZfpkDBTGazNByIzNxtaDPg4S/NTVSF3Yp4S?=
 =?us-ascii?Q?sI/U34y2iLTXclT9Egbbhc3JmGb0/YjNZCFgel0rAIqDs3RY7obeMK7ncJrM?=
 =?us-ascii?Q?Rc8H4xceDXk8Vfv4hUA9oogHIHbaTEl5xXdY1VdJ9EHeZ7Nwrkff7fsrd02q?=
 =?us-ascii?Q?VFu+YtwJBkutdS+w78FoYUP7fFwOWqgTHeRymzZHDW9B1+6TCVx8X/sIQDXP?=
 =?us-ascii?Q?oZk1HKSa9AD8mYaLiuv/SqwMClwlH+C6est3whjrlCP40B2oK6EDDKuVhn3W?=
 =?us-ascii?Q?P9hC4o66qfJGlzZn4xh/RPaeq8uSZCQGtzCoYT1oZ1DLVLI8qMqSYPEZfQFz?=
 =?us-ascii?Q?ZL03QyFofoK4oL0EMa2/5mbXVXp84j4ZH4Z5KFfAYvukUsvrUsgB9yD70COi?=
 =?us-ascii?Q?bsnK0/OFpH4Ll6A3Dehpw4waEeRB8xRsYdqJHXcj0bj+MmPI2xtoBXV/BiZT?=
 =?us-ascii?Q?msedDRWjtjlR5Kvzl39DB2Zy7ZDEtO3kIQCuE0ZMEJY2vFSVIPX79DHpwLmk?=
 =?us-ascii?Q?ndyl4prM/y9bA3aLQG2lMMXicpQiuIyFBzeWXJnRLr94zbbvAY5KrJjw8ASd?=
 =?us-ascii?Q?oa7dCN+ay+GzNVYGm7DC9eoOqJdhDY9i4IjtlU2XIK2DzPY/Fdt78o6JHqQV?=
 =?us-ascii?Q?HcrqkwH0MsvleuL7Pws/skryJ3kCs8j19U8S+BhcKR4PY7M8RIvvhSyLZjkj?=
 =?us-ascii?Q?r20wH9v2ewgrutRkqD/e+8Vxk1JqKac9XMxVQ+RXw00GCRTZ7/GI0lXakS21?=
 =?us-ascii?Q?4L4OsTScmX14CR0A+oiMinzlFsH+R3dI40rP0YkXsV6bjeVI0QsqyZX5dKj6?=
 =?us-ascii?Q?uqZnzPbRhuyocnO0g6draUsPCGwomQX7x0kDo5t/8k9dq4VVOySYMZCdJTwu?=
 =?us-ascii?Q?t3nM9FZVTFZpNs/dTPmIRcBfgfFZAG9WIyONRhKwXhJpV2clAYX2Mh403ITX?=
 =?us-ascii?Q?KveaGgjyhSuOpyaKLmUxhnYjUsV/yMPk3SH3DP/LgVkaBdmrfFY3ZAugbzh8?=
 =?us-ascii?Q?6tgyYFi4/TCLorQv9L2UKUuCAPq4yd4K9A4EY1PApqTrvyqwZ51wbueeMVEA?=
 =?us-ascii?Q?Isf2X8NGWeW4m00LqMAozHuI+WxGRsja7R7XIsOQaRi3oo4luuEn3ngwy2CJ?=
 =?us-ascii?Q?Yb3WBs6ILsLUQ3j+FuZfvnv8CGhhJ9mQd7ptXeGNkqAiMV1hDYB916auVqRw?=
 =?us-ascii?Q?8U1RTOJOWqi9C+W9B/bN+cvKI01lQf+pbWP919q3WDO+B/ayF1a82wakNuO0?=
 =?us-ascii?Q?JgPEQJJUxadMulBZz0L2pvYthzs1luVOzRE/5vO7cbJ+2yvk8aejaVDg+Wvn?=
 =?us-ascii?Q?47kCoVITpHbCxOJ88k/rlcWimWjHWfdIC8ihvXNEVvEV3TpUWzLTR40P1MCx?=
 =?us-ascii?Q?tjPgWsHcjEcWdzFkegqZ2fAk4wEDPoz2FK14uXP35GEx9OgngJsEAHwC9VeU?=
 =?us-ascii?Q?qrmYzAzMmOl+3Hy4Fr7rytPv5F3oiXGQ+aJLuyKIIl1lBQe/nJRrHTJZdjQM?=
 =?us-ascii?Q?0FtgSxSlhYsDgnKJ4DM8aEB+4Q8fPl1Ebfn3vtdO7fBFYBsz09HzOlm1cynd?=
 =?us-ascii?Q?NoHxtMDNkCyt0GwE4KLRnMjRPqE51wzNO2Xu4PQfGhptdMc9c04NtZdW7dPf?=
 =?us-ascii?Q?jNtXSZ5YHw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4869207-405c-4944-c4ca-08de6f33aa9a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:23.0762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zj7UxBlgKDPmUyQwEJDoy3fGxeTVzusb33NVJz1eqN9pQbiE2aQVs0RuMvnPx/8utLdaE7wMuarceUDm6ixLHQ==
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
X-Rspamd-Queue-Id: 7071E159E4A
X-Rspamd-Action: no action

Introduce GpuMm as the centralized GPU memory manager that owns:
- Buddy allocator for VRAM allocation.
- PRAMIN window for direct VRAM access.
- TLB manager for translation buffer operations.

This provides clean ownership model where GpuMm provides accessor
methods for its components that can be used for memory management
operations.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs    | 15 ++++++++
 drivers/gpu/nova-core/mm/mod.rs | 63 ++++++++++++++++++++++++++++++++-
 2 files changed, 77 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9b042ef1a308..396d5bf57167 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -4,8 +4,10 @@
     device,
     devres::Devres,
     fmt,
+    gpu::buddy::GpuBuddyParams,
     pci,
     prelude::*,
+    sizes::{SZ_1M, SZ_4K},
     sync::Arc, //
 };
 
@@ -19,6 +21,7 @@
     fb::SysmemFlush,
     gfw,
     gsp::Gsp,
+    mm::GpuMm,
     regs,
 };
 
@@ -249,6 +252,9 @@ pub(crate) struct Gpu {
     gsp_falcon: Falcon<GspFalcon>,
     /// SEC2 falcon instance, used for GSP boot up and cleanup.
     sec2_falcon: Falcon<Sec2Falcon>,
+    /// GPU memory manager owning memory management resources.
+    #[pin]
+    mm: GpuMm,
     /// GSP runtime data. Temporarily an empty placeholder.
     #[pin]
     gsp: Gsp,
@@ -281,6 +287,15 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
+            // Create GPU memory manager owning memory management resources.
+            // This will be initialized with the usable VRAM region from GSP in a later
+            // patch. For now, we use a placeholder of 1MB.
+            mm <- GpuMm::new(devres_bar.clone(), &GpuBuddyParams {
+                base_offset_bytes: 0,
+                physical_memory_size_bytes: SZ_1M as u64,
+                chunk_size_bytes: SZ_4K as u64,
+            })?,
+
             gsp <- Gsp::new(pdev),
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
index eafd56964b1b..471f8eb0635c 100644
--- a/drivers/gpu/nova-core/mm/mod.rs
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -8,7 +8,68 @@
 pub(crate) mod pramin;
 pub(crate) mod tlb;
 
-use kernel::sizes::SZ_4K;
+use kernel::{
+    devres::Devres,
+    gpu::buddy::{
+        GpuBuddy,
+        GpuBuddyParams, //
+    },
+    prelude::*,
+    sizes::SZ_4K,
+    sync::Arc, //
+};
+
+use crate::driver::Bar0;
+
+pub(crate) use tlb::Tlb;
+
+/// GPU Memory Manager - owns all core MM components.
+///
+/// Provides centralized ownership of memory management resources:
+/// - [`GpuBuddy`] allocator for VRAM page table allocation.
+/// - [`pramin::Pramin`] for direct VRAM access.
+/// - [`Tlb`] manager for translation buffer flush operations.
+#[pin_data]
+pub(crate) struct GpuMm {
+    buddy: GpuBuddy,
+    #[pin]
+    pramin: pramin::Pramin,
+    #[pin]
+    tlb: Tlb,
+}
+
+impl GpuMm {
+    /// Create a pin-initializer for `GpuMm`.
+    pub(crate) fn new(
+        bar: Arc<Devres<Bar0>>,
+        buddy_params: GpuBuddyParams,
+    ) -> Result<impl PinInit<Self>> {
+        let buddy = GpuBuddy::new(buddy_params)?;
+        let tlb_init = Tlb::new(bar.clone());
+        let pramin_init = pramin::Pramin::new(bar)?;
+
+        Ok(pin_init!(Self {
+            buddy,
+            pramin <- pramin_init,
+            tlb <- tlb_init,
+        }))
+    }
+
+    /// Access the [`GpuBuddy`] allocator.
+    pub(crate) fn buddy(&self) -> &GpuBuddy {
+        &self.buddy
+    }
+
+    /// Access the [`pramin::Pramin`].
+    pub(crate) fn pramin(&self) -> &pramin::Pramin {
+        &self.pramin
+    }
+
+    /// Access the [`Tlb`] manager.
+    pub(crate) fn tlb(&self) -> &Tlb {
+        &self.tlb
+    }
+}
 
 /// Page size in bytes (4 KiB).
 pub(crate) const PAGE_SIZE: usize = SZ_4K;
-- 
2.34.1

