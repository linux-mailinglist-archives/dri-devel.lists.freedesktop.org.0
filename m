Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLrJKHAQfGl7KQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 02:59:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51018B64C0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 02:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5084610E350;
	Fri, 30 Jan 2026 01:59:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sqj4cEEp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012036.outbound.protection.outlook.com
 [40.93.195.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B380F10E291;
 Fri, 30 Jan 2026 01:59:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twULQ9o34p9WDsaTD5PTQx/9UM0xxyzR4mFfzi8v+k/Nwib0q786odrtj1g/Sy3sRB//pl7J2tHOhOer9uRqmkcLoSnbYfbcsqJxqvO+3xcCie+H7Sz9afntrrK239UQmpeelrg3BHhVz+jbl1pA43PK0oTFw4BD6JgZ+iEM5WrKeZUv48XSleXg2gKwKkSHmB4sy6mGjUc5qSdrNAJ42e5CVvK35XkqxD20ews5J/RorDlFy7dMEWdKEVRo0ghTGNy+f3EZVMfUknTF3xZADWta787KCn16z6EM0KL+IK/e0gPJqeL2eTZiF2rePgBD9JJR6bmff83ecHWw2trVQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t8uwZZFe345ckehcaJX3Zd9I4EoGeaLV8vw0jNsyuh0=;
 b=zQYZuuYhZkwyO8c0PvJivLI5lMlG16zn5XmMpd4lPM4Ie2PMwWX+cUAs3RdZlEdK2d7XZHz4ULE4iy0SRmT96+s5LN4jpAjxSejMzgfZ+VFQXWLIrl4OYuML8lZIskuqiIM+PenoDBMWDuXOb84SM3ucgj4l2XGQ8+wvB5Z0Q1G1Q+hTHg9ph/rDi6gVoiN/oXGtNz+RqhCG9VQCmVtusinp5n3FdLzadj+aHS/CnLdwwO1KNi5t7543CStb4PHs1h+frVoBlXJ57sGscYBjSvwsR0VSdcvqjI2R0N3j1A+ZUgf2soN7Su8tN8ZsRhgP4BpfOnpuQs1lKNBpI8kUMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t8uwZZFe345ckehcaJX3Zd9I4EoGeaLV8vw0jNsyuh0=;
 b=sqj4cEEpEH//9Pc4RhanD3ah5P0dt7ytcxr6NvSNXnlOa0fqh95znrS014q/wVjnwW7DcDqGDiH/0xQyp42p2pcRGgxkD/7iY8HMCNCEzeY0/Ea07JB9+ZR995lTu1y+wXBG30tMc54CyhlCKyEOXS2zqHjqAs4OQ+/trKKIET0OGIjAUhBgmDjrknjR1eDl+fKUc4pKiQ/qHQ6itX7iQoQ5ezpOt8WDylaUy+PJnI5r5G0nG+5zY43n1/UzlHGLnWwTvmUy4yaKcMEEGqsuBsjLLTB0OdIg6YbJRHZGO4i3PCB+BOxHas+OMCbbGayVNimOxVGd2zLHAZWTG/gFSg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 MN0PR12MB6078.namprd12.prod.outlook.com (2603:10b6:208:3ca::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Fri, 30 Jan 2026 01:59:03 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9564.007; Fri, 30 Jan 2026
 01:59:03 +0000
Date: Thu, 29 Jan 2026 20:59:01 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
Message-ID: <20260130015901.GA301119@joelbox2>
References: <97af2d85-a905-44d4-951f-e56a40f4312e@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97af2d85-a905-44d4-951f-e56a40f4312e@nvidia.com>
X-ClientProxiedBy: IA4P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::12) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|MN0PR12MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 77860c16-153d-40b9-dc5f-08de5fa3246c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qMfNy2zerNI6JcmRv3TOxN19T2Q+fvNC+oAxWiKodIw4rYYDL6YAQ6rfzFi3?=
 =?us-ascii?Q?q8zA5KOuVqls7LQaACqSJ+Lx3dooW9xqFdVBUrWRxH+oX0Vw6xZ9HL6EkHiq?=
 =?us-ascii?Q?uxjz7xnqsc8Q/ZcdriTmBxgfItBjXMj2cfR4lQVssmw68U/pgRrPuL+WN68q?=
 =?us-ascii?Q?42tlx0YXSrOvgXlWCTPtXnkZUZ/8UtjFycx7Hwc3eU/noJ8xhEhm5TZM21Y0?=
 =?us-ascii?Q?yPtbPZuICKsFHbVTqX/yWelSCPGTkIAaHAnWFF2Boqtx3Qchn68/PwvD4C7g?=
 =?us-ascii?Q?4Azg5W9GOyCdit2lfeAXpCj5aMqveDFCZM1HntfTRyS4qsAzIikiuqDHMY1C?=
 =?us-ascii?Q?QR5s7WrXGlX5I+v5HzUfucx+a4hKbViCIBtGPwUdt0/wL8J1zqsiUYBjuwBw?=
 =?us-ascii?Q?JNJcX+PEWy5mwSOGlsdTuESCSupEbR60EkWsi3L5bEVr76Bf5pFgSEngLw3k?=
 =?us-ascii?Q?F3rOqSAdIJZ1drCrG2efPvv9sNCQVEnn295C8E0PQ+2woRlGhEpQJz9YCERk?=
 =?us-ascii?Q?oaWuvufbVmKTfiO4l1AvbIOGFHNdo3qn2mlZoyyrIXNk3knKJ8uJY0A2A8jl?=
 =?us-ascii?Q?+tIv2LeC3kak1q2Ak8V5tk5c7uDbM9s3B4m7x5Idjpjrx7Wv8gzKi7HEtn2Q?=
 =?us-ascii?Q?Dqt9DmERJWGZ0OsCWJcDl9p0zdG0lG6Qw7IYCL+WGchs1VMdk2MrUrsHsWS8?=
 =?us-ascii?Q?bq6bwtsSHdZZbD8potTewEIu1uV/9Md9IHnPyq2YjTd3LIz1ngJXkT0eqUCx?=
 =?us-ascii?Q?30QTi9ibnscKGEpEfh9sVSphg4oPHYWAVxpajq6mATGwvFyb314c4JoGoqMd?=
 =?us-ascii?Q?J3M1XOhIddjGPXfbiLis5BOO4djNUjb3URTDmNp4clch1AmirrTZxUxGIfKC?=
 =?us-ascii?Q?95zsa/PdEIETAY67sDAx3Lr/pdAebds8IyQpOC7P+VfgidTYjHPzBid7UUp7?=
 =?us-ascii?Q?oZUBVUvhTHArWgcmrKOTaOzZnU705+mVbLRihj1C/qaYIdV0Zjc6+wUUO8DE?=
 =?us-ascii?Q?YvDWOcehvTZGyLpURhfSFPbuUqU/ahzGddiysnwxhRTOQ6ensnjvuO6PgfYl?=
 =?us-ascii?Q?SGZ+1hNgnQ3jzN78rlnXhbqhZ4XjIg0UJrGDx58nbcA6HseXolGoj56yb8ZN?=
 =?us-ascii?Q?eLNN3FTcpBrB9l0sTWQcr77lry4bxL/rbOvUQwbjqjDA9CMZGDYVbKtMAyPp?=
 =?us-ascii?Q?qFcowp+wAZi+v1Dck3LKF/TmwCK+QluI9/CWuc8ZsKnjXKJ6DTYRBomw1QZG?=
 =?us-ascii?Q?CkAin24GV6fGwcbNeoJquy9VDhhVLCluwbv3hLBHDnYKi1vWec++k9Y5R/wy?=
 =?us-ascii?Q?nmO+3GzJwXOQv9i+Q/eZLAFI4oxMLKXbe3PJT5+5x6brfBkMaybrz/fiGIZ2?=
 =?us-ascii?Q?eZESYXTEZZh6NP3aT5icQVr5HqmS6IrDbG84bAKzZq8QwIstYfmID3aMtDRq?=
 =?us-ascii?Q?n2LUKLEOp2WkGOMuF/i43b2zCbiNypQKOEVT4Lb6VbDKKDMnh1kMxKGr7laJ?=
 =?us-ascii?Q?rwUUC++GL0SsRye1SJklfj4bcjULXPeq5c3lo/v3rViBmskuUFTvCx7qtnWJ?=
 =?us-ascii?Q?+V/YfsnEyXme7ecBVFE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y7E1GFph+UIByjF4aREA1ZmPCFNpxZ+8o7LB5S/r1xGM2r3Vo8yUNxM210zN?=
 =?us-ascii?Q?u4bLYVY0BvHKsPXqNdAwiwHagK1SNyPCgXxlWhzLy1vuqEbA3Yav+d/6ZOi5?=
 =?us-ascii?Q?+ZgI0lH8a/6I3WSCDTVdzckkbtaCYfGiZTBYpi7NcaDt4AcINAI6h7rdUOlI?=
 =?us-ascii?Q?Sg8h13p5OD9Tk5+LW2ppP/siQ4NCeKTHBhZIA+ZYOUebHKqGcfpENfx8vPYN?=
 =?us-ascii?Q?7X0UuJVP3Seh1SempW2HAEFEJp7uYHePqAYZ1h64/PNZxypreXU9f4/6y/UM?=
 =?us-ascii?Q?CpnfrRh09a8ewZT/+Wzky+CsyZP0AWXku2w3DmI56IjiJWiST1DRcTn0Q0kZ?=
 =?us-ascii?Q?yWSw8wRk+TokR68WjomKowZoi8OMVf86VoaJrrFowA7JPKeJpvT/c5OZ+jai?=
 =?us-ascii?Q?/nwNUdTcq8jwF73HAVpusA0ww/4P6MgmvMz6BmYHT07wtXiOzxIWmtDraCVM?=
 =?us-ascii?Q?FkYK+jeisadmw99QlPJUpWWtwTWmIMFD8UiS7N9LMzqL2F59LsDbg1ZpprMV?=
 =?us-ascii?Q?K5ewPTagg+rtaLdj8tqsmLN6V2NqtzM1LiQnG+UN080/b676ucmHjfOn/Vsu?=
 =?us-ascii?Q?dD3yvzO15RLDktOCN+3rbliF8IZ/UYKvg90YTloUuEknhlEzWWs19G2R7E6V?=
 =?us-ascii?Q?9qFVthLmFAECSxypSRMBSgrYIgYLtfxR54+tlizKUdP7+FRbAPvvKICWRdPT?=
 =?us-ascii?Q?Eku68Kxl8iQg1ebZPny4V+kKw3yShMrBlNKumE7eXQjW9TXdEaefPv3VI3bS?=
 =?us-ascii?Q?rmK7n+LxeSP/DsmAJy7c0Y0TsqPe0jIl8h0XTYO85Vw5p4l7f+EhzWVI8avE?=
 =?us-ascii?Q?n1wtQd+sXozTOhLXHwnmjVguxycNK8OZ8NWt9hnRqLGj8ufQ8dDwME1EGnlf?=
 =?us-ascii?Q?mYz7zA1UowUa7XTbQQAk2w/mFOFUcqXg+7ZVTZm0I6baK1EmZZshy9wPw+He?=
 =?us-ascii?Q?xoE/GASL8JlO/hEjrlNUzgHa1XpT4LQZoaaKxCT1f6qsRRfdo656xgfbN+Qw?=
 =?us-ascii?Q?Z87TtG6Q+l9CaaTYlW40L0R8CCgKXyuV/TG5Cabz2sLZEOwnyUieR9dcn2+1?=
 =?us-ascii?Q?X4GBHWGhPZgoKPpyrLWCV4HFCcdvjTtIkS/7K0hukI2Eqn1s33ZAVUhg2GzR?=
 =?us-ascii?Q?gIVpLdRdtiT7Sddc88ThMtOupDhW4jfRN7larL3prabs8aIaP1DXeCzaj6L+?=
 =?us-ascii?Q?EVXL3wOTv8EpbFqiGRRcDf+paJsN11MrJ3eBDadm1zK02aKCLjw4DFjklrBB?=
 =?us-ascii?Q?UHJ3hwCN4Ton8uwlH/m4j0iYD0wC8yMuB03Zoe+hNwgfvrHZapvBSW5f83IS?=
 =?us-ascii?Q?8kcP8j/C0MMzV0SjqhFLQaRum046CvVHJbELA1RgVrpPYR52aMKP9MBuo3Q6?=
 =?us-ascii?Q?QJj6Yo0WFcLS999U76y+UkjhXwVIGSieKbT4dspNIQDUjKSRp8/Bmhmxd3WQ?=
 =?us-ascii?Q?3j5NeGD0pCcWdg2FkAltDdD7yGDwZ7kaSVb+rttf+qZhfMu4icg/8m+PO3x8?=
 =?us-ascii?Q?b64NzyHrJKnXhDS0jev72PIqjDIM4Ec5aYMrZMDnRvyWjNS0CWr5AQSmjPgO?=
 =?us-ascii?Q?pCZPWUUB70FDxCXxHm53SGhRDVaS8ZYlB42uZPxUaX0CPXsa31L1vF+Wvk0L?=
 =?us-ascii?Q?jx1pLIxl4HQwT0SHCAquIp3WakY7jBrfQ4AAAjJU1TJa9Tn1oJF17BRf0hgx?=
 =?us-ascii?Q?hql5oyFzAPxxJjhIZ0uocNt0fflmND8NCZ9+jIUK6mOay322mJpQErKftBUb?=
 =?us-ascii?Q?Iwzs2heiTQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77860c16-153d-40b9-dc5f-08de5fa3246c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 01:59:03.0457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Un5MB4eu3JoyZGplYhtgG3Aq3Ge14cpAb11ykBRO3KEsReMVO4rQi68Sm7H8LV9fu+QJU12802cyOIlkJuH0Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6078
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
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,nvidia.com,vger.kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 51018B64C0
X-Rspamd-Action: no action

On 1/29/26 8:12 PM, John Hubbard wrote:
> On 1/29/26 4:26 PM, Joel Fernandes wrote:
>> Based on the below discussion and research, I came up with some deadlock
>> scenarios that we need to handle in the v6 series of these patches.
>> [...]
>> memory allocations under locks that we need in the dma-fence signaling
>> critical path (when doing the virtual memory map/unmap)
> 
> unmap? Are you seeing any allocations happening during unmap? I don't
> immediately see any, but that sounds surprising.

Not allocations but we are acquiring locks during unmap. My understanding
is (at least some) unmaps have to also be done in the dma fence signaling
critical path (the run stage), but Danilo/you can correct me if I am wrong
on that. We cannot avoid all locking but those same locks cannot be held in
any other paths which do a memory allocation (as mentioned in one of the
deadlock scenarios), that is probably the main thing to check for unmap.

Thanks,
-- 
Joel Fernandes

