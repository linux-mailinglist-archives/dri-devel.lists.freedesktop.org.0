Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PJNOggsnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE6318DC3B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB16510E68E;
	Tue, 24 Feb 2026 22:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LU17rnwE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C82010E67C;
 Tue, 24 Feb 2026 22:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AA44LE7glNme9gwlmRWlP6zmkOK6jcnnjp47ppdP9bH1rz7T23inzVgAG3tuhFjHxSoMZq6Dyf2LVujjrOeFeB1oBF5ZLi2Zhx8pLaxef3RiAFNT6BWzkzNvG25zNzvKqkUFaRXBxosCPSrCcRFIVjZZInCm3LqC6wQp9+jyTQ+kI8+nOuIoaJPQe5BAKODsYOarz22nbM1jBUYGJgwzTp4WGXumZvG5IoBPZ3qbIP82pu7L9/xAvuRoBPNG9TiaAZkXEnsMPqiB6wj5EPksBzL6qC0zpg3gdkL5Q5BdvoaqX9sDzfs710/+sRBtR7VaeDeJzMVgn8qEJdFhigtITg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9le9zPmfGGE54JcHse8SBISSPbKA3QFpZI2evo42hs=;
 b=cpdV+6e9n6CfsMlAEbcTVHhoh9zR++hCq9EsaF2kwjTt1ZOb4Y+7OP5ZwzB8KUOM8/qyUedANGo9DjdOaeGcwjSNLd+9IrPPl2CM/4oBZzWzd81FJEZtb/yGwHu7512NRDBE2V4Xm7N3APbrPZZUsJ2r7Nr3ulxR5I7Med/kQCtu2I5bdGGb8Tz1CaNgEZg1YC/tEhMmnAUj5hGJ5RWlegeADSLaalY9EC7F+ha5D4R4fLSVhNbHUp5CWY34KblWBlsP6GK26GMSCF3pWkdejCX0tbe+pHy83BDSya73QLY1+q8qoo7X6V5GjcNQ9OU4LX3qW/zjgMLKwHDyFfQYjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9le9zPmfGGE54JcHse8SBISSPbKA3QFpZI2evo42hs=;
 b=LU17rnwE8LGH2f3/J611OEOWRZWKQoAriE5iAfIhY1VsXk13xNrwMVgRkJ2ua8pwt7dpuicU37WlxXBDZ20zF+IszEDUfoCr5cO4SrB8z1pMX2Vk342hRyYOUu1fX6WKBEPWs4G6siKkZGBveyzdOKIC4NI0evqL4S7BFkdasorFLVlPA6JhciJU+ZyWV+BywLM4+2bQox6da4ueLzME7U1sw8NBm8x+SeypRuoPYyqVMJsg69IgRjC/A7ZTYIlhfZutvNCLQfUxqejPTBH6AiEXafcZxRo/R8jZZNIk08BGXd0b04IwSIzYyJUI0FWUL5fqQi8EKjGwTqWqa+NILg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:46 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:46 +0000
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
Subject: [PATCH v8 08/25] gpu: nova-core: mm: Add common memory management
 types
Date: Tue, 24 Feb 2026 17:53:06 -0500
Message-Id: <20260224225323.3312204-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA1P220CA0022.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:464::11) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 91b23abe-cfd7-4132-2b78-08de73f790f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J6SfvEsXhJ1c/MZGm3T1IDcdFROETZa47t5vUbWze3CnotMjeZ6eGu7hmZgK?=
 =?us-ascii?Q?FBXr+3myWQu0i0XzeJ2ecGuAIi8I9B5z8+6ZDUsF3TY7t/IpfiQVtbwVznEp?=
 =?us-ascii?Q?AoYGTY6+ZWrmuJpASAYZLv1cNDLqXEL7xwkHkwPUXaInVlLQUWUpIq09i/sP?=
 =?us-ascii?Q?QIG22dRizJ8N4MyAkhsnyl0248hysO9lCyFhPBTUs+FpOEGLTqDLc29abm9m?=
 =?us-ascii?Q?KK5lnzbMZTNDm5Py4ZRmlnBIEMD/aBR7F/Hw0JNVOvTWyYDzKU3lTduZs6Ue?=
 =?us-ascii?Q?kn1zmlz4ubxfiCxsS5orZdtaultxb2V5wy6QgbC3WtbhsJ4D52/pDovoPjT4?=
 =?us-ascii?Q?y2Y8GRJQ3MomhW7C3FbZoy9H8R7J1ZaKGG6ef7tBkG9nWJG+EFpOJZEsrf7Q?=
 =?us-ascii?Q?HAyX3BzmuLrm0iyWQpz+D5m5IPKXzdps/AqBsbtsTxSN2W1RBTo8NtQn/0A9?=
 =?us-ascii?Q?5cXyrSfVHdeMUkxet72rh+woTfqJ9ifSR8Hmb8pDfjsDERX9yOADQsoAblEO?=
 =?us-ascii?Q?QhPbCFaSUvL11PrK5N7CaTlY3I49qywLAY7XK0Gw+Rairs3raQoXvk1eFk/b?=
 =?us-ascii?Q?dieLlkkEaXjO0jY4A8E3n11++sNDLsilbwh0vGtw9b/Hc1xne9JstPVIElni?=
 =?us-ascii?Q?ShqocuAjs+N0OXdBGMY7P6a+GwH/u6lE85FoBTjoV/CVsWTx7UFUEChZWglh?=
 =?us-ascii?Q?XWPhSmPZTS3KEqd5znAH1Y3jiy0tb/JYA/Hn0jcXyqtL9iuRC6sKb3J2nuZc?=
 =?us-ascii?Q?APuOetD4x9+JxvxfDF9lz3v7brn5xLAV4UBY/wh5Pp6blTSRV2LOzXBefnz3?=
 =?us-ascii?Q?thooOlZdC2xT654VnBa9wJeAG9fTe1FAqNOPER8DHuGRlfip4U2acEUER4K2?=
 =?us-ascii?Q?7bqh9ZZvhzWKnAmpO7Y5TSqJ1TS3uZR2hGa1SHqjh03wbJZyr9Vr37Da5GVh?=
 =?us-ascii?Q?2K0n5Ax7FGcLGG+6Fyt2bOT+fztrQ7jhTMKfA9eX0MXtMCo3Awe3uOC6cl81?=
 =?us-ascii?Q?h3Y3EtnWoC00IgobA6jhSnW++iXCo9vq7mhO4ulm/0PVg61k9t8ntScxaD/9?=
 =?us-ascii?Q?BNUdzUcmSHZeyMGb0q0H0Vr613gWc9PZyGffu7SKZ3p7TnUgge5iyDaWw8AP?=
 =?us-ascii?Q?LjUhji7K34uUVYF8enkW5TtQSYNqZ50gmhmbOlClCpCDREZqc+//BG1hyd8w?=
 =?us-ascii?Q?RPMACof0yOHVXyJb7vZIgUkcvG68qAVfqZVCIjJBYOBJqjDPIbmsbNTPbeZn?=
 =?us-ascii?Q?waI2znjcFB0ELRArgvG2bT7J5IsONai0xZb+hWdJT7f/i1oCQzMOfqRnN0Mh?=
 =?us-ascii?Q?UmBAVbKJrTubDK0WJ1XVFwpN8M95n47tN5LY3mm1BmDruM3r0Scovv3/AJQ2?=
 =?us-ascii?Q?yT6wkhsmuKkOczedpbUWIeCiVcPZX3UbvULIFfzUCGwj5KR9EgezIEjuq/j/?=
 =?us-ascii?Q?XCRg1QL2tUBykx/on8Tuh6aDwmlI7elQuJ6ztBMVOTj0592woAp3NnjmF2lN?=
 =?us-ascii?Q?7rvUrNjp8BIsczPUqmL0Xzg4POzOScj2zcjlXfJmbrPaPAXqNGD6MdYDBVYF?=
 =?us-ascii?Q?MEHKW5SEBIM76m4FrSs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p8TmyLjshuVpHZdQSb11zVGxxk0hLEKhUshw1gm2zS0T7CRQ4OO1qb52ecHW?=
 =?us-ascii?Q?3ncLZZhTPALwX0gAnmuaZykPFBxrf06XSbV+DZf2uNrXeeIxoPAbN0rknuBm?=
 =?us-ascii?Q?gF2YfpsAh0J+zz8p/hEf/VUWrSzDw+gSpd3+XO7y8meaAR6TumruAZxHhGrT?=
 =?us-ascii?Q?zbDKLW+NniAqlxspXjNp7fYriMYKZxNZZi2eUyjd/pGr/LOv2j4jjOjiiA4e?=
 =?us-ascii?Q?4oWlIOFzUiGiwto8fhRFq3REReZ5uToGJkCm1mtLRrf/N/YHn4R0KRVRGpbh?=
 =?us-ascii?Q?eXX+rZIo3zlsbOpDX1Rs7lUmEZ0oJUEv86LTRbdmxl41CCdfNiLrcm1vLfdI?=
 =?us-ascii?Q?zIXTy3ogFrSKk2pXY1g6Bkn/zrNRLDwl9auGjU+JTeKOl9ZMosKfV0aYWLYw?=
 =?us-ascii?Q?FxsMC2/y1nVJw5uQ3mpW6KgYY0WoC/ZeD1ROTHOihm7L3vda016tDJ8HiL0/?=
 =?us-ascii?Q?PLzpBwW4ITsJa1Pqfo7X0EkZQEH5DdBRD980XNN+mo9So5hGgoauHtV0KxwO?=
 =?us-ascii?Q?4UAkmPoTD2qdj/8gpIOy5W6pdQfYyI8yJBM26WiK6FSk0kLdZ3C5MqnV/2QP?=
 =?us-ascii?Q?+czVsjAU3NqcKKttyVmir3tJs7WY6ydHg6nJG4Xbsy0vo7pxN9K5F/6NPVZg?=
 =?us-ascii?Q?wHdBO2ypM9XiHjC6YODSYU/s6VRpaoSOMy8+Yh5tokAzL/a71Q346AAN0zHT?=
 =?us-ascii?Q?ul19Yh3nArov+DHKj6/zyL1j4jR85C1MAmeIsN8jgSt0xJB3ERrpIZrT5PYx?=
 =?us-ascii?Q?OimMrzZJNju6uieRJsipvifDIiaYz9ouzGG368T7xrV+GBCg7YDLJ5eyk938?=
 =?us-ascii?Q?7Tpdt2TY1jz+eh3y2gOTDsJAEz5pZquu+poM4bHpiv25JJND2hX5I0LF3d7c?=
 =?us-ascii?Q?uW7+T1lH5MQPQFZ+d9fjQbcBqNHYQ4okFrbpi+35FlkyGlK3FqVGUyQjibtB?=
 =?us-ascii?Q?sdjuXcH1jGZF65zDkJvpc191IqyvIRW5yA+KbNH2SAB4dG0Ptu0N+Rw4gh8y?=
 =?us-ascii?Q?R8mklyatR9uPdpZ/iuhbC9xBpUznVFseJQKaPCcZT4nsr31uVyM5e+gqOD/L?=
 =?us-ascii?Q?yNMzG6pN3gRSkCuhf6mbh9dSjc1SlSM/nce6ZowfvxoL+gbOjmRyfPAet69W?=
 =?us-ascii?Q?5pQpgQ2QmypRHI6JtzpV26ljHgs074r6gQpdO3NHjAIhCL2pyFmlt5F/SzEA?=
 =?us-ascii?Q?Dv7KAF4tjZRzUTg7YArhDwg2f87lppdbecZ0PPgaXygMeBDILw9ZH8Y9Zt2I?=
 =?us-ascii?Q?nCM0oPot2xhSD6zx72L4HPKWddVexBqF7qqLsVc1i/wpy1KyXDd5sLU46c/U?=
 =?us-ascii?Q?5iLNbQYdTbRLons8jBSR3Gx5OUrgDYd4SaTFInaCRfEs12MD5r9+QgqQXzm+?=
 =?us-ascii?Q?KzR+wXWKuvzKjngV58fMZ/O2UXIlkEZSUrHzvmdk45zp03GI1Nlg7GPssVrI?=
 =?us-ascii?Q?kXssCsnyJ2TFfuB9FACTmkkraEPysYjiNaQLLZBacaldHcjn8C5go7S7Sdxz?=
 =?us-ascii?Q?U9DPTiw6sehtgY/KJVKaK+MJxSiJk8B1UbL4yuRzUJgFU8yNPJ73YH9oNvF4?=
 =?us-ascii?Q?trjEDp8Ztbl0PuurryuYu4okh3SZKcTN66ugqHI1DLMyM8SYjKQozY49aaMO?=
 =?us-ascii?Q?iOmmmayMloCZXNiuxHDm//myDmZJNVQsFYIiwyLpaOU9kGc9UAbpvJkTMwof?=
 =?us-ascii?Q?EDp6D86L6gkkLZu8uepBch5pF+SEt5JIdyVslaDgN+R8Bco2PqxU8Xti/O3o?=
 =?us-ascii?Q?pitkzLnemA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b23abe-cfd7-4132-2b78-08de73f790f2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:46.0404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jwM6NEAkcbbhlNgBgHIpDqcippdYZXghMG9ptmKTv0qoY87Y0k0uZ5e2H1ITcg0Nqr4IU5KUAnP1j2DZspD81A==
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
	NEURAL_HAM(-0.00)[-0.936];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8FE6318DC3B
X-Rspamd-Action: no action

Add foundational types for GPU memory management. These types are used
throughout the nova memory management subsystem for page table
operations, address translation, and memory allocation.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm.rs | 174 ++++++++++++++++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index 7a5dd4220c67..a8b2e1870566 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -2,4 +2,178 @@
 
 //! Memory management subsystems for nova-core.
 
+#![expect(dead_code)]
+
 pub(crate) mod pramin;
+
+use kernel::sizes::SZ_4K;
+
+use crate::num::u64_as_usize;
+
+/// Page size in bytes (4 KiB).
+pub(crate) const PAGE_SIZE: usize = SZ_4K;
+
+bitfield! {
+    pub(crate) struct VramAddress(u64), "Physical VRAM address in GPU video memory" {
+        11:0    offset          as u64, "Offset within 4KB page";
+        63:12   frame_number    as u64 => Pfn, "Physical frame number";
+    }
+}
+
+impl VramAddress {
+    /// Create a new VRAM address from a raw value.
+    pub(crate) const fn new(addr: u64) -> Self {
+        Self(addr)
+    }
+
+    /// Get the raw address value as `usize` (useful for MMIO offsets).
+    pub(crate) const fn raw(&self) -> usize {
+        u64_as_usize(self.0)
+    }
+
+    /// Get the raw address value as `u64`.
+    pub(crate) const fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+impl PartialEq for VramAddress {
+    fn eq(&self, other: &Self) -> bool {
+        self.0 == other.0
+    }
+}
+
+impl Eq for VramAddress {}
+
+impl PartialOrd for VramAddress {
+    fn partial_cmp(&self, other: &Self) -> Option<core::cmp::Ordering> {
+        Some(self.cmp(other))
+    }
+}
+
+impl Ord for VramAddress {
+    fn cmp(&self, other: &Self) -> core::cmp::Ordering {
+        self.0.cmp(&other.0)
+    }
+}
+
+impl From<Pfn> for VramAddress {
+    fn from(pfn: Pfn) -> Self {
+        Self::default().set_frame_number(pfn)
+    }
+}
+
+bitfield! {
+    pub(crate) struct VirtualAddress(u64), "Virtual address in GPU address space" {
+        11:0    offset          as u64, "Offset within 4KB page";
+        20:12   l4_index        as u64, "Level 4 index (PTE)";
+        29:21   l3_index        as u64, "Level 3 index (Dual PDE)";
+        38:30   l2_index        as u64, "Level 2 index";
+        47:39   l1_index        as u64, "Level 1 index";
+        56:48   l0_index        as u64, "Level 0 index (PDB)";
+        63:12   frame_number    as u64 => Vfn, "Virtual frame number";
+    }
+}
+
+impl VirtualAddress {
+    /// Create a new virtual address from a raw value.
+    #[expect(dead_code)]
+    pub(crate) const fn new(addr: u64) -> Self {
+        Self(addr)
+    }
+
+    /// Get the page table index for a given level (0-5).
+    pub(crate) fn level_index(&self, level: u64) -> u64 {
+        match level {
+            0 => self.l0_index(),
+            1 => self.l1_index(),
+            2 => self.l2_index(),
+            3 => self.l3_index(),
+            4 => self.l4_index(),
+
+            // L5 is only used by MMU v3 (PTE level).
+            5 => self.l4_index(),
+            _ => 0,
+        }
+    }
+}
+
+impl From<Vfn> for VirtualAddress {
+    fn from(vfn: Vfn) -> Self {
+        Self::default().set_frame_number(vfn)
+    }
+}
+
+/// Physical Frame Number.
+///
+/// Represents a physical page in VRAM.
+#[repr(transparent)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) struct Pfn(u64);
+
+impl Pfn {
+    /// Create a new PFN from a frame number.
+    pub(crate) const fn new(frame_number: u64) -> Self {
+        Self(frame_number)
+    }
+
+    /// Get the raw frame number.
+    pub(crate) const fn raw(self) -> u64 {
+        self.0
+    }
+}
+
+impl From<VramAddress> for Pfn {
+    fn from(addr: VramAddress) -> Self {
+        addr.frame_number()
+    }
+}
+
+impl From<u64> for Pfn {
+    fn from(val: u64) -> Self {
+        Self(val)
+    }
+}
+
+impl From<Pfn> for u64 {
+    fn from(pfn: Pfn) -> Self {
+        pfn.0
+    }
+}
+
+/// Virtual Frame Number.
+///
+/// Represents a virtual page in GPU address space.
+#[repr(transparent)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) struct Vfn(u64);
+
+impl Vfn {
+    /// Create a new VFN from a frame number.
+    pub(crate) const fn new(frame_number: u64) -> Self {
+        Self(frame_number)
+    }
+
+    /// Get the raw frame number.
+    pub(crate) const fn raw(self) -> u64 {
+        self.0
+    }
+}
+
+impl From<VirtualAddress> for Vfn {
+    fn from(addr: VirtualAddress) -> Self {
+        addr.frame_number()
+    }
+}
+
+impl From<u64> for Vfn {
+    fn from(val: u64) -> Self {
+        Self(val)
+    }
+}
+
+impl From<Vfn> for u64 {
+    fn from(vfn: Vfn) -> Self {
+        vfn.0
+    }
+}
-- 
2.34.1

