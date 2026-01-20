Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJk3GC7pb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122AF4B9CD
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18D110E6AB;
	Tue, 20 Jan 2026 20:44:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iINq9nxG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011005.outbound.protection.outlook.com [52.101.52.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485BD10E690;
 Tue, 20 Jan 2026 20:44:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWZ2VG4Odnz38iYyL2KWE7mAoaK9iWyoVu89Rm8ige/byVboS3zT37FVosSKG2u8EIAETVrzKnLiE6/OqzBPuD17Bc+T15lbMEPB/4lz4oHdzv5KfR86651Q6H/Ph3JFnJbf2zfSKucAdp5+W8I/57JMssvnUfg3OXiYSbOogCh/9rYPdjKGJyBGB9WdArO7/7bLz9WhG7uxoCvlHvet47l5Yp3RbsuJ8OCXUIf5ksTBvwa66AUxlqIdklFkrHnKn7X7MTtjpM9T42MLesy0HTuTD1/6pG1IOlfWs7Mx9xqbw124fNIxEIgPjLYSzDA9voHe4JgA1nZKQMqRuK4mUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n59T/sI62CfsToz/1MW58q4KPy+lMHIfvqiYHqkPmeA=;
 b=XN0QmJc5XUqhpQ5FlM+kqlrTPFKFG+mipbi63+0AoDuTDpLSaaH8JExmCBaXFcMsoxfbNg6tAPXVUKsKjCwP2rjHldxcJqW9yNIO2XxiKoy35nEEFvM3o0h+0mt1yV36NjNIEWtiryS2buUpff9tQGF8Hpgpfhw5yev3DQehZ+CP+GnQQKoqm6J/WuBOJnuOCvRcupKJIvR9G/is+fYYhYJESjRvF38p7ZwLs0Wta8AcOB30kWY8D33ijcfz6GGCiZbfj/kliDeD9vnuUSTPMrM5KDNnlLFZv5uRgd7OYkvQ4OJEwp5ybcvbRctqvSbP5YZgbPpwUznCaxNmdY23SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n59T/sI62CfsToz/1MW58q4KPy+lMHIfvqiYHqkPmeA=;
 b=iINq9nxGcEb+TGYS97y3/UtwuD0DowUJKjsnFmN4aG8Qw8W2Vqz2dvL9b4xqskjaZdVI1zJ2ZPHhFnqGfFxptF83XhsrkB32aFyH/6da3+j2467PI0ST8L5Nv8LAW599jCRIWDjYcZfU/GGxCGhygUwkRzyNYytaQFJ4XZPCHlOZ6ZdlY8sgJMxWPSVcKzZwlcF39rVFK2Mbx2FmbRv90PeihE8zmqaz6d/JnWpG+hExOK28ZRhbxuZz9wxq40WKULr7nxAid/4ysfQFuA53Z++fjIs+RQrfgTB+nd7/OuvbRMNsVqEu3od5NSaia30YzrnC2EvdulyGSs0R1OwpOQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:44:16 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:16 +0000
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
Subject: [PATCH RFC v6 15/26] nova-core: mm: Add GpuMm centralized memory
 manager
Date: Tue, 20 Jan 2026 15:42:52 -0500
Message-Id: <20260120204303.3229303-16-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:208:36e::24) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 65527064-d98f-420e-65fa-08de5864ad4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zCvglsB+xuoYhW333MrXxWNpXxjZkrJR44eAewxgp8bgabadP4RR+hgyoXa0?=
 =?us-ascii?Q?MvJVEhC9B+P1m1jOsJfbHxije5vjNAaxK8H4pusvzCtVegW7CVYrznuTNiLU?=
 =?us-ascii?Q?XRgdKRnO8j9QE3hAqH7mcBwD9s8Vma6oNb3pTorQVeWflqk+sPHwMrut/i3E?=
 =?us-ascii?Q?Y9rOjtT+h78azlO21SOyH43w7MZo70VACK+7TKpm4q5reZ5sgEhqKcS8KHje?=
 =?us-ascii?Q?gVrF3gcvtP/kzNGXlAElimoj1roVLiu8mK27vKOJYEEOW8PAn9HAyPuMa/4X?=
 =?us-ascii?Q?dzdOlpgCjdmQKDyDhoRXeK8q1VaqMDMV4hTqAypQou6BvuOws4V/GdyPncZM?=
 =?us-ascii?Q?XTaLFdDFLq5tQLfBfiEYlm47U5LWpI3qzgiCKfEfMDPyS+y4eyDJ+6qSPwe+?=
 =?us-ascii?Q?KXQ9h7QDwwThhJFuztcTQE0a2KmheUmASyq1IZWwnvdgrGhVZ0PQOmC2GYg8?=
 =?us-ascii?Q?DUCfa4nuhT5kcDFfgbfjr4H6J9zPkSerHKBNlO2/ZWmvgqTj5rYLWiq5ndcJ?=
 =?us-ascii?Q?Mi8Ob+v1et6LOgesNGgzRDOXikLZnGnff9xWAXuZjceFeGiQ6BzoM+yuEQ8B?=
 =?us-ascii?Q?rDfZupi7bi9tcUBhxGFoQ2MVZgtyI15OtH9sIhyzd4rVPFd31vcIq6j9G4tq?=
 =?us-ascii?Q?9Velixhtk+5P6i4XNVCybKC5vp9w0cuyj5Vaz/b1FDd/5I5xtjIeo4e+QLlI?=
 =?us-ascii?Q?oXZDTHuKYBrz1FkA0Abs6Vn0L9sxr99vl7zE6713uSCzT0iVglX1ohKfbWiA?=
 =?us-ascii?Q?TV1+EnABk+D4z4o07PbwJz/vspVVJI7FYC5fIYZZyv55DCVXCbAC0SG59PPc?=
 =?us-ascii?Q?/Ch9gF9HfcCgVRdwtdlTf6acYfY4+hd9qBDX8nIFpKy/MEFrjfZu/msEYLFj?=
 =?us-ascii?Q?kmtHxt+qh5TJSK9TpW+dw4VSHsmWS7VJFHez0fvLDlkXeHnQ4p5aCSXUJ54P?=
 =?us-ascii?Q?5wonK/JDOuiCNo0XlheEsqsBKYKxjiiOkQWZmFAMVRjohtaFJgUlYxXsueYp?=
 =?us-ascii?Q?GVA1pGmqQPYtuq3Cf6ndwKRA+8nkNDUEVC7dXyg03tlXazDpT+PJz0gZrHhk?=
 =?us-ascii?Q?2ALXik/c3VJWHv8p8jNnd6+aAakvldhYBrkI/WhQqxnkL9uGpn2wkGJU8nL6?=
 =?us-ascii?Q?4mPiq8GRmziRsn+KPaniV1+nMRz3Ggl3dO0ULY744ALZZm5H9Q/8v4KYUz8r?=
 =?us-ascii?Q?DYh27TwxSvpgzlrlQVMureZm0E1vUl881vtJ9oR1cWV0jWIhd+ROiBuCHkfZ?=
 =?us-ascii?Q?Ann0efN80oYJ1IxAF63XtGexrpi6z6lTwUXTnghyoKU6g6iVaxQQeSxHnh0r?=
 =?us-ascii?Q?8PYtyewE8xIFcq6gKCDm//82v/6+oo2QaGbjgR9taFsaFSHyN6SSHR7q43l8?=
 =?us-ascii?Q?uVUpzRf8dPqzmBstM1w5CCr6vDizWrlUmV4Qq0p7h3rjlyKefNndzFL9WYvD?=
 =?us-ascii?Q?pWUKqPRbPgluINvHa/QNYShT7HRIjxMrZbwjNFjRnYHtrCX6wmie1EoHM626?=
 =?us-ascii?Q?idsCVKqPLe5cWwGvNmTikRPASFiBTCIba3XrrLgODTzGh48uPtjmdgFCTM0s?=
 =?us-ascii?Q?Tznp7cOgrFJi7mgyHSE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hXWbXFmqzucuA13V/XT8sWg10uGAky6Zta7BoDXBWdT5NLjAmluFotCDcwRY?=
 =?us-ascii?Q?Z2HxUv1MG/eFdmhx7RGCXkyW8X66x0IIgfin2S/V0tYja0iLpylvEvy5pQdE?=
 =?us-ascii?Q?p4qQ/bUUjzG5oMp+ZNlKKxPE/D/DOMeSy2POgQ/gUOpAKKv87VMQ3iDsTzac?=
 =?us-ascii?Q?/lSlZkFz368eGb1LTp7mjN46tKgqTGcVFjg8eqVCaP695vH/Yxw+I/VGI1WX?=
 =?us-ascii?Q?VHR1P7gJedIWagbItx0MPOuiTjQ0+vmlRwsp98JeItZW3ADQWhebmTnj2n6j?=
 =?us-ascii?Q?jo9uPXwuYFlqbTelVAjj1tNPUvW1R2nVbj/JLl/wHYyTtOpaJXGOhP+lrvp4?=
 =?us-ascii?Q?dFIQEYLjKwkp25V9O4zqoVpww7vpFLuEseFdDMQAuSaDVu+C8oWnj6fJYJBo?=
 =?us-ascii?Q?UuwSBSHBJjv0TWHg9GRnn/PsNmFdp/u99CBK+fOONex2YDz10aslzz8vEr7p?=
 =?us-ascii?Q?TtEowIhO/wrK6Yksj9VnQyhTwLkrcQ+isqD3y5Pao5hlTT8nqJ44XNae9z7W?=
 =?us-ascii?Q?u3JUSn8qrjXYJIuy2Zn/VQfzGu00V360Ei/8nHEx5lpkVEnLP6TeEJZ2Fgl/?=
 =?us-ascii?Q?EYkT6psAVBsgHhA2D4txIHXW7I2WqKxjkrYh2IphA6gZiIP/1vx8WVvr1gSZ?=
 =?us-ascii?Q?iv+bz4OtuCBwkvzrU/2ZbebxTvUnbtKbkKU2atcQP6lqIVvQKiur7RyC/qBN?=
 =?us-ascii?Q?rmGc5jEYD08dT9dDsKEMJPw9ovtSc0WME9P+n3DH4KxPScV/Jz4vvh/rIoKw?=
 =?us-ascii?Q?r9xNUW628AY+fibw1nl9DxOT9BGJz0Ec/4KdoR57odmW09vjEsXiXoP7oXbR?=
 =?us-ascii?Q?lyFYYtRiZcE4buYMqiEJhs8s1uUMCmQ4jL4LkVPIshuEQcq6GA3QHDcPEWmR?=
 =?us-ascii?Q?5ln4xka7N3Rg6a2ePXlifgaTl/fiJmkyyLZ155bakOWsXRnHDwFKieH/E8Bh?=
 =?us-ascii?Q?xo0U7GUtx52igvf5tXGDmZUMoF/tPTHKx1GjPbKxNruxsWVr7O4V08006epX?=
 =?us-ascii?Q?YLGTYzza5NI8sg/MuJ8wIuCny1i60qc7zVBWzQxy/pfI147pftcFZ3gvMIt6?=
 =?us-ascii?Q?mvge/33Koh8O6dyIPeCHxdOpnI5tB1xFHABtohMM9EyFBuJDvMsGobwBVAOd?=
 =?us-ascii?Q?aaFtfu6f0H+0ZTl8i2hoxTv4lQd/MV9GVZiUK94u5ouo7XqX5oAI9SDkE21C?=
 =?us-ascii?Q?e2KmL1xRoG/BqUDxvFe0ovG1RU88TChzGPdSciNwDz9YccF8Fd6PO8Hhk8Nj?=
 =?us-ascii?Q?TO+lctGffxil8RBgh9a6CdskIH7GkeowR3VSX2U1AEHTETE+Dd3AAOuQwN8H?=
 =?us-ascii?Q?ND0Q29lVsY0v6As0PtHDd8zE+u5+RFFuEC1bJaB/VfTdmj0EX70YJvvMXD17?=
 =?us-ascii?Q?+OUmwi41g1psYe3CiYg4qpBNyw5OMWrhm0jBYN0UK/VjpWOd+HbzdM6Sd04I?=
 =?us-ascii?Q?h61aE93AAbYGgG8Xbz0F5Qhu4ovTUFMzMDRxr68G2qiE/cl953cATKxXUgXv?=
 =?us-ascii?Q?H+yU3wWJ7a/iY2hnXzgts7w9jpGO9hkdRV7xlXFO5EcLkprkD6WBRA8nrr3A?=
 =?us-ascii?Q?XTJ89rYB8iGV+Y+dUlUt0MepANeKCQRpigWiHXc6GLfVGMBeBsD67isfd7ft?=
 =?us-ascii?Q?1pH0sQ1TAn54Z883RqyhB2haN18fsqk/a9KY0GFoAsdUGaz/EzFhfrvr6z+N?=
 =?us-ascii?Q?ZWwdvlSWL5k39ftfNnpkUkAFgzzdwCbqpSZKVpyuA/7ki9vFOr7rOU8TsvpG?=
 =?us-ascii?Q?DvlY15OpPA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65527064-d98f-420e-65fa-08de5864ad4a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:16.1794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k9uMqTDR7dlA5H7w4wm5aknAO5sqxFG+ewLM6FdWSCEZ6LTZD3/JtxVa4g0Jrnx6a6dsuof1/dbMIkipw1KexQ==
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
X-Rspamd-Queue-Id: 122AF4B9CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Introduce GpuMm as the centralized GPU memory manager that owns:
- Buddy allocator for VRAM allocation.
- PRAMIN window for direct VRAM access.
- TLB manager for translation buffer operations.

This provides clean ownership model where GpuMm provides accessor
methods for its components that can be used for memory management
operations.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs    | 14 +++++++++
 drivers/gpu/nova-core/mm/mod.rs | 55 ++++++++++++++++++++++++++++++++-
 2 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9b042ef1a308..572e6d4502bc 100644
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
 
@@ -249,6 +252,8 @@ pub(crate) struct Gpu {
     gsp_falcon: Falcon<GspFalcon>,
     /// SEC2 falcon instance, used for GSP boot up and cleanup.
     sec2_falcon: Falcon<Sec2Falcon>,
+    /// GPU memory manager owning memory management resources.
+    mm: GpuMm,
     /// GSP runtime data. Temporarily an empty placeholder.
     #[pin]
     gsp: Gsp,
@@ -281,6 +286,15 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
+            // Create GPU memory manager owning memory management resources.
+            // This will be initialized with the usable VRAM region from GSP in a later
+            // patch. For now, we use a placeholder of 1MB.
+            mm: GpuMm::new(devres_bar.clone(), GpuBuddyParams {
+                base_offset_bytes: 0,
+                physical_memory_size_bytes: SZ_1M as u64,
+                chunk_size_bytes: SZ_4K as u64,
+            })?,
+
             gsp <- Gsp::new(pdev),
 
             _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
index 39635f2d0156..56c72bf51431 100644
--- a/drivers/gpu/nova-core/mm/mod.rs
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -8,7 +8,60 @@
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
+/// - [`pramin::Window`] for direct VRAM access.
+/// - [`Tlb`] manager for translation buffer flush operations.
+///
+/// No pinning required, all fields manage their own pinning internally.
+pub(crate) struct GpuMm {
+    buddy: GpuBuddy,
+    pramin: pramin::Window,
+    tlb: Tlb,
+}
+
+impl GpuMm {
+    /// Create a new `GpuMm` object.
+    pub(crate) fn new(bar: Arc<Devres<Bar0>>, buddy_params: GpuBuddyParams) -> Result<Self> {
+        Ok(Self {
+            buddy: GpuBuddy::new(buddy_params)?,
+            pramin: pramin::Window::new(bar.clone())?,
+            tlb: Tlb::new(bar),
+        })
+    }
+
+    /// Access the [`GpuBuddy`] allocator.
+    pub(crate) fn buddy(&self) -> &GpuBuddy {
+        &self.buddy
+    }
+
+    /// Access the [`pramin::Window`].
+    pub(crate) fn pramin(&mut self) -> &mut pramin::Window {
+        &mut self.pramin
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

