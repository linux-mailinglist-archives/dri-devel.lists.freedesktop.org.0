Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sIN4Fwjpb2lhUQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4E14B88E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3A410E656;
	Tue, 20 Jan 2026 20:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G4mk6Npi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010043.outbound.protection.outlook.com
 [40.93.198.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598BC10E221;
 Tue, 20 Jan 2026 20:43:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O9ydnogvx6KZgl0bkPY3h28+J8nTa6JWzZjx+rrm4WHfnqHrTgNyPkd757MPdMxaH3RDo3H/p/EdijnOH8KNE9t1vt2bgpKDnWrlv+5F8rHouZqWHZ+Yft6d3E60fbbZeY4b2htESrZziJDYoS2OxiORTTMezgNhImYcxGL8+tDN4i25dzqSBioHeo/TyI2q2fWQ598QYdMz2aAwbDZu8PPSkaRh4+kktkeaWTv9iGgexCAmrkQ6TwpBwdZuXOJzJT+2Z5b5SNNdhP+UUZlLUIjyeE4NpX1G4fwCh197/sAdtxVzcBJJuwRyS8R/Bj8TNLkeuk9Bq9zPrHNDNciXgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUBZ6L+/xZVS1Ji2XUB+n8k6WjuNk14WaceTCfHlB9A=;
 b=GRJYP6QOxP7eEdk8JVYmrJ1IR2RZegfsMCfHNkSurJ782Jhh7lKfokUo+4gw55sx1DVx3dV5A7Y1aVtYTV/DXCt63vaEaIKe2AOTIm744jAo7dSueJge+zTZT8nKBk1dV17SZFghhajQ+Xtqo3eHX7JfG5ZhRPbz5IeEj5NRcQH2z942WeTNn4SW9wnEufUwhKHQLoQzDJGPnjb6Lux3cvCaDp8CAkjlOrp7UB1SvGkC/aFaUF1nQWeYkGxOgy7AOl1bmRwnXzBTe31h7SAuAfvQ+fcqvc+Bi8VF+UX1wPW2dLAYE4cZeGqdPixZW9CMIsenDqUsoaANd6GuY/+cPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hUBZ6L+/xZVS1Ji2XUB+n8k6WjuNk14WaceTCfHlB9A=;
 b=G4mk6NpiofxK5lDZ+BgWU801jRfwrpj1K6av5d576iGycIyLD5gcAVqUR4g9ODjNm0Tny3hOCt1bjnMtVb3pZIBA/ZdLnm5q7hfONo+HDukWWiuhXjfkOH15WXO84lH/cxMVcz52Nr52RmwYb0hSaNw6G82yN9QIcV1KhaYjpRbOxP0rhoCDZ6TqosQO5kRcL/aHCTGSWaCSGh9E2tfZiif3fhzgNdnY8EE6P1Viop+97pIrOOzRgBS+L/do19SKnHjbTHT1jx8ILCTr1elMgWSrbRLBDq1n4dnNP0BJYLEAGgY4eyVRlkYEXMwAHADXWqGvT9IpD/ZG86Lfa/M2YA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:43:34 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:43:34 +0000
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
Subject: [PATCH RFC v6 01/26] rust: clist: Add support to interface with C
 linked lists
Date: Tue, 20 Jan 2026 15:42:38 -0500
Message-Id: <20260120204303.3229303-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0279.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::14) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: 59bf7c39-03ab-4bb7-b455-08de5864939b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zedivzF8LOtonffT6d+08jkNUh9aCZ8lBfNIuVMWMdgZAwShuUJz3mQgluCD?=
 =?us-ascii?Q?4w+jp1bXUNyNzDhkr/uyGAcKy/1cpb1LL9fDGaqNVP7vsf3WkTiO/SaxWpEH?=
 =?us-ascii?Q?JXnj1O7BEJsM48gweg0qz7pcNMEsxmAm/upJuZcm4lvqeYgMpEivFIUH+OB6?=
 =?us-ascii?Q?6Bk8DhYly9mWzprp5PzU+oBmaRk2XE0QXqDTgJLFljjPbwhu4XZPtkfPFnye?=
 =?us-ascii?Q?iaAUu76wMAyhHHdHiP3OovQ+LibKKp48cCWCw04szBAUiIl4vyAOXPLoRIfd?=
 =?us-ascii?Q?HKAsJ55CmRb5gMfFEP5hsg4p9CyeTp69dSIhNm/tzIRBU2JDGBsad5LTZcVL?=
 =?us-ascii?Q?HBSSGPZWf78rgut3L8sHwvDYvY+oVlpy1jA/VjPSyVu36fyCWqyStkIW8/1X?=
 =?us-ascii?Q?ODqB0KHYtedOoR9gyIDdUgC51Ly0mg52xDaxKZcbhpPscrnRfGXEFCclMUHe?=
 =?us-ascii?Q?jWtqogArpk2fnTLfLq2OVsQgdnL6WVq9SF1+UzqEFfKtYzoBh4rgror3198U?=
 =?us-ascii?Q?nO/crLetqYnPbi0WixDRlGUvQWNW4RrstbvyeNrt9t4+Xt1dCkSa6Xlwf4da?=
 =?us-ascii?Q?KFafbH5P7bF0BfnHEpt0IteYxaUOJ083Um9u3rbffBACtmWWvryxLOwipymU?=
 =?us-ascii?Q?v+OLNzLqd9I5tZXWf1oT1qFtWP4JGy4YoE+pVUehrtwad2TE0Tpu3hA7aaOU?=
 =?us-ascii?Q?it5YvdPZYQfnFI9vEk2ehWlsgayhTGFILN0FnlYd7vCUpwKKUTnItM+Dhm0W?=
 =?us-ascii?Q?NkZB1PsooYTfMWhgU97or0IrobgkpJvcD/yGE5ybiM2Bm5lon6NM6nZczQ3q?=
 =?us-ascii?Q?iSNuRX/iY91dnor/cKDc5B+STKb4IfyqwacvYJb6ky1EfENXUvR7LCD/1sLc?=
 =?us-ascii?Q?upD6vqdmsSvhtD050A0j2z+Q3uOxsux5jrUwHnn8wNVS/h3eo5B9jXDjSnwL?=
 =?us-ascii?Q?n3cvCT/FVaF0HanKlASLtrFsTyPI55g3zTgm1vDL/0fKr0+jX0bOoaJH2IZ4?=
 =?us-ascii?Q?S/df5BzkZpud3Ga0HKF0SdGJpQQIFKA+khb7MYn96L7l9yVISwG3qjxhAdyg?=
 =?us-ascii?Q?C6NuVY6s1sB/NdTKdkfAjqIB6mfuWxK1iAqwyrAMEXPAOxXCaKi4cBajxskN?=
 =?us-ascii?Q?NUfA8oY4WU4bc/U5Vsxbm46CyCXopADdFiupApOx9uhoPkKcBs5fq9oTLiWi?=
 =?us-ascii?Q?zht7suMNnDwrmqFxqNSKfQy+Yy1yYOyzKbyPukBzcDoTAAo7oIOT+V30RF4p?=
 =?us-ascii?Q?gWHdI7zgtt06Ro/VykUqiUZlsXX3NLNeowJVEbmTxeCPWte6Yj990whrlKwz?=
 =?us-ascii?Q?eVFNvdx17XuJQEPSv3FlATntYzWLJRA9ZdlSjS0IqQVlDooVpeKloQfqSfT6?=
 =?us-ascii?Q?hW0xl9B3iZMxuTdRGKxzC5maeJLdvfaVrzN+JDVozs3wBk3cUyS0C3V/aRbf?=
 =?us-ascii?Q?Yv2aRnoWKM235P1Vum+eYBkWZhhe8HBD5fNKUqlAgjEsFbWhOJR2HUK45Z4a?=
 =?us-ascii?Q?M7643SSfxGpHEHdJdFfNtPPdQCONtwTkaLtfZzI/My6/9HrmNur3UEx1bHHA?=
 =?us-ascii?Q?aix+0hXtDBRySRqR7tM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9EvbWrNr8ZKcT4TEP4c6u8dxWeGiKq3TMp7fCuxOLDhaQxeyLe1vY4XHb78+?=
 =?us-ascii?Q?ZuJtTN7qLcgGbbnXLxZ1Qu0Nq/bRJSG+rn53c8DYC6fwbaqRfbvTDXDUMroD?=
 =?us-ascii?Q?cVaW86H2LH/U0EfKEp0kzwq+IyNwK475vBUCM8RuO1mHtC++M9nhbhTugrgj?=
 =?us-ascii?Q?G/2lTNWQYeo8lv/W9A2vTW2yHAp6FbHOp1Kn81/UTjOmFmLaDbuW6kln+hRa?=
 =?us-ascii?Q?eThECKNd15cMbvAlClmrNboVpQAjYlUwj3N/RpdLwuDEtF9znRY3roz57VKq?=
 =?us-ascii?Q?ZxDdI64DhoRnkKi57yNzIJpguHQQ1R9Ca6ulD/8Oy9pWBGoPnoPsIL4Dl0sa?=
 =?us-ascii?Q?klVilPWzK7PfBZLlTf7vEeyp/LEwS4T3XaxFVmlDJC8A7NO1sZXdZ2yTV5w1?=
 =?us-ascii?Q?9fWy2MfyQfKr1jqsOFBLsjI9RR14M6dqVyxGmXlOtEMfeWuKLnSJbbRZVKKv?=
 =?us-ascii?Q?p51UKC9sw+tzqP9OjmE37YsxJIsJxVBKMDkdDg/x8QkOEwgL8ZQTIdM8ehCZ?=
 =?us-ascii?Q?4Fq6cvrbp+hR68nKR2uW1WpolJK1SWNQmcSWGnjZ9QY2eWWLhaNAg1XbnBBt?=
 =?us-ascii?Q?bMhZcFG0TvSgtwnuVwSPAueBysaMKQ6aPKGsOY1DQQc9t+F9l22QM6ko35mk?=
 =?us-ascii?Q?c69XkAnw6g2iwGLkX1aF4VtTOd+kXMR0B7zMAAnCiu8LnvHh/ETGr3CJSUVD?=
 =?us-ascii?Q?Ua99jHY5ton7KVXgdQmnuTh1iORG1bRtT6aCcjeCvj3IlWo82UvRjZAuQ+am?=
 =?us-ascii?Q?5wmXwH7oP33ZETnMbroysUkEyT6NTtEbJx6n0NILzhunLUgrcUMyQZxhpKOq?=
 =?us-ascii?Q?md+U0zRi9Jq+M5ZKWy6b9y8OLWNE5l613893xXKwUy4O7G9WrjQ32qkLh+UE?=
 =?us-ascii?Q?i6W/9K9t+A3mHyn1+9qiE9ICsZkBsDKQgHCNkfwC/gtCuXWcG9IJ6FW9YHIu?=
 =?us-ascii?Q?O6AcdmwnzyOccB8sCY4hNSqS35/IKMUEzx9agIvkAO+3y6ABPtNEV0CGpt52?=
 =?us-ascii?Q?1YBg6VJ7PFki2gHbHDPhmbe55zpYD9+dOdHLflJKYjOGt/E5YBIFOnSAkAss?=
 =?us-ascii?Q?ZB+vCituvcRP1KZq47eXZ4H1Zcxkh68TnvJ1AQ3YIZLcUDRGFUUHB9Kb8KhK?=
 =?us-ascii?Q?RdxNO0hwTxSTQ69PdXp5NhdtL4iL2tElwI6AVUmluP9phWX3qUKFTNJAI0wQ?=
 =?us-ascii?Q?xltqsOQS2tKo6y57/j3htXoTSjpGbZnvzC/kdDJ87LfiwlGQBV84oOCN+nlb?=
 =?us-ascii?Q?+jrJOJS14yTCW3rqaiocEfWxYlqlvnCUYXcUvjwWBUHS7RansHI25fNnIL1S?=
 =?us-ascii?Q?AN+XStKrYURX3mMUvlpMpdqcEzuC5dX0ROwSzOOzjnS+X0qC8EPMTEomts+X?=
 =?us-ascii?Q?Y/gOzj0blWdwb6dcN49DHRYcZnZOCz7ODZu93OYb60BfsIiguyFYRkD+VZf9?=
 =?us-ascii?Q?Ur6Ktq0EjGroeZEXw32FVx5QOmhbU7LpskVpryRn8UoexthiLssDjUE+ATdO?=
 =?us-ascii?Q?vWzINVrbN512OZRq9X92V3Ej1/HYYU8huypveNiYlkPwp1evLSiMXifj3pwc?=
 =?us-ascii?Q?gdKc6k1kFUXTde5rApryS00Cri1wRZ0Re6LlxETRYTRH3I16ddBnxTZK8Ap1?=
 =?us-ascii?Q?ioBwsnYO76ueb8J3+OsJHMln7E5l2D3qqEZf0RoSP/NCZTC8Y9BfHwMYdFWg?=
 =?us-ascii?Q?6dCiis96pXXC0PQJC+btomS0f4jWhBXoxtXNr18YuEj9GxO3MoQvpxJzwcsC?=
 =?us-ascii?Q?ygYEird9ZQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59bf7c39-03ab-4bb7-b455-08de5864939b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:43:33.1205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQytbN0oYIyUuAMqku4BMl7g0cGoCWn8ODRUFNROZeMisghTo5bI2Kv6ACSCX0XCTqH1k5UwhAMYLApQPEZwBA==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 0C4E14B88E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add a new module `clist` for working with C's doubly circular linked
lists. Provide low-level iteration over list nodes.

Typed iteration over actual items is provided with a `clist_create`
macro to assist in creation of the `Clist` type.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 MAINTAINERS            |   7 +
 rust/helpers/helpers.c |   1 +
 rust/helpers/list.c    |  12 ++
 rust/kernel/clist.rs   | 357 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 5 files changed, 378 insertions(+)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d044a58cbfe..b76988c38045 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22936,6 +22936,13 @@ F:	rust/kernel/init.rs
 F:	rust/pin-init/
 K:	\bpin-init\b|pin_init\b|PinInit
 
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
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c..634fa2386bbb 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -32,6 +32,7 @@
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
+#include "list.c"
 #include "maple_tree.c"
 #include "mm.c"
 #include "mutex.c"
diff --git a/rust/helpers/list.c b/rust/helpers/list.c
new file mode 100644
index 000000000000..6044979c7a2e
--- /dev/null
+++ b/rust/helpers/list.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Helpers for C Circular doubly linked list implementation.
+ */
+
+#include <linux/list.h>
+
+void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
+{
+	list_add_tail(new, head);
+}
diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
new file mode 100644
index 000000000000..91754ae721b9
--- /dev/null
+++ b/rust/kernel/clist.rs
@@ -0,0 +1,357 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A C doubly circular intrusive linked list interface for rust code.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::{
+//!     bindings,
+//!     clist::init_list_head,
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
+//! # unsafe { init_list_head(head) };
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
+//! #         init_list_head(core::ptr::addr_of_mut!((*ptr).link));
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
+/// Initialize a `list_head` object to point to itself.
+///
+/// # Safety
+///
+/// `list` must be a valid pointer to a `list_head` object.
+#[inline]
+pub unsafe fn init_list_head(list: *mut bindings::list_head) {
+    // SAFETY: Caller guarantees `list` is a valid pointer to a `list_head`.
+    unsafe {
+        (*list).next = list;
+        (*list).prev = list;
+    }
+}
+
+/// Wraps a `list_head` object for use in intrusive linked lists.
+///
+/// # Invariants
+///
+/// - [`CListHead`] represents an allocated and valid `list_head` structure.
+/// - Once a [`CListHead`] is created in Rust, it will not be modified by non-Rust code.
+/// - All `list_head` for individual items are not modified for the lifetime of [`CListHead`].
+#[repr(transparent)]
+pub struct CListHead(Opaque<bindings::list_head>);
+
+impl CListHead {
+    /// Create a `&CListHead` reference from a raw `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - [`CListHead`] has same layout as `list_head`.
+        // - `ptr` is valid and unmodified for 'a.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Get the raw `list_head` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.0.get()
+    }
+
+    /// Get the next [`CListHead`] in the list.
+    #[inline]
+    pub fn next(&self) -> &Self {
+        let raw = self.as_raw();
+        // SAFETY:
+        // - `self.as_raw()` is valid per type invariants.
+        // - The `next` pointer is guaranteed to be non-NULL.
+        unsafe { Self::from_raw((*raw).next) }
+    }
+
+    /// Get the previous [`CListHead`] in the list.
+    #[inline]
+    pub fn prev(&self) -> &Self {
+        let raw = self.as_raw();
+        // SAFETY:
+        // - self.as_raw() is valid per type invariants.
+        // - The `prev` pointer is guaranteed to be non-NULL.
+        unsafe { Self::from_raw((*raw).prev) }
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
+    /// Fallible pin-initializer that initializes and then calls user closure.
+    ///
+    /// Initializes the list head first, then passes `&CListHead` to the closure.
+    /// This hides the raw FFI pointer from the user.
+    pub fn try_init<E>(
+        init_func: impl FnOnce(&CListHead) -> Result<(), E>,
+    ) -> impl PinInit<Self, E> {
+        // SAFETY: init_list_head initializes the list_head to point to itself.
+        // After initialization, we create a reference to pass to the closure.
+        unsafe {
+            pin_init::pin_init_from_closure(move |slot: *mut Self| {
+                init_list_head(slot.cast());
+                // SAFETY: slot is now initialized, safe to create reference.
+                init_func(&*slot)
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
+        self.as_raw() == other.as_raw()
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
+    current_head: &'a CListHead,
+    list_head: &'a CListHead,
+}
+
+impl<'a> Iterator for CListHeadIter<'a> {
+    type Item = &'a CListHead;
+
+    #[inline]
+    fn next(&mut self) -> Option<Self::Item> {
+        // Advance to next node.
+        let next = self.current_head.next();
+
+        // Check if we've circled back to the sentinel head.
+        if next == self.list_head {
+            None
+        } else {
+            self.current_head = next;
+            Some(self.current_head)
+        }
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
+/// - `head` is an allocated and valid C `list_head` structure that is the list's sentinel.
+/// - `OFFSET` is the byte offset of the `list_head` field within the struct that `T` wraps.
+/// - All the list's `list_head` nodes are allocated and have valid next/prev pointers.
+/// - The underlying `list_head` (and entire list) is not modified for the lifetime `'a`.
+pub struct CList<'a, T, const OFFSET: usize> {
+    head: &'a CListHead,
+    _phantom: PhantomData<&'a T>,
+}
+
+impl<'a, T, const OFFSET: usize> CList<'a, T, OFFSET> {
+    /// Create a typed [`CList`] from a raw sentinel `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
+    ///   representing a list sentinel.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
+    /// - `T` must be `#[repr(transparent)]` over the C struct.
+    #[inline]
+    pub unsafe fn from_raw(ptr: *mut bindings::list_head) -> Self {
+        Self {
+            // SAFETY: Caller guarantees `ptr` is a valid, sentinel `list_head` object.
+            head: unsafe { CListHead::from_raw(ptr) },
+            _phantom: PhantomData,
+        }
+    }
+
+    /// Get the raw sentinel `list_head` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.head.as_raw()
+    }
+
+    /// Check if the list is empty.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        let raw = self.as_raw();
+        // SAFETY: self.as_raw() is valid per type invariants.
+        unsafe { (*raw).next == raw }
+    }
+
+    /// Create an iterator over typed items.
+    #[inline]
+    pub fn iter(&self) -> CListIter<'a, T, OFFSET> {
+        CListIter {
+            head_iter: CListHeadIter {
+                current_head: self.head,
+                list_head: self.head,
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
+/// Create a C doubly-circular linked list interface [`CList`] from a raw `list_head` pointer.
+///
+/// This macro creates a [`CList<T, OFFSET>`] that can iterate over items of type `$rust_type`
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
+/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
+///   unmodified for the lifetime of the rust [`CList`].
+/// - The list contains items of type `$c_type` linked via an embedded `$field`.
+/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
+/// - The macro is called from an unsafe block.
+///
+/// # Examples
+///
+/// Refer to the examples in the [`crate::clist`] module documentation.
+#[macro_export]
+macro_rules! clist_create {
+    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) => {{
+        // Compile-time check that field path is a list_head.
+        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
+            |p| ::core::ptr::addr_of!((*p).$($field).+);
+
+        // Calculate offset and create `CList`.
+        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
+        $crate::clist::CList::<$rust_type, OFFSET>::from_raw($head)
+    }};
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index f812cf120042..cd7e6a1055b0 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -75,6 +75,7 @@
 pub mod bug;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod clist;
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
-- 
2.34.1

