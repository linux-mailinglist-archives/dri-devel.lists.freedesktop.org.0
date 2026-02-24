Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACUxHQ8snmmkTwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D7318DCA5
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87C810E665;
	Tue, 24 Feb 2026 22:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YfDTY0C0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5D710E693;
 Tue, 24 Feb 2026 22:53:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=op3MK24ozoShy5WzLOD4UUgLvCyRPAp8D9nJeAgDJFCAYhWekiAc73r0+8GNyOpMV+Aah50RvZE4flpTotAeo7FlQUsB4+eAoOgsLh/19hh899qoshLCk+ElswWHj6MvoZOEI4OdBbHxaNu0nmNbTfaSNRGaUQ1LJ5g0vUXiM8YWf8u4yVV4Od+oeGxSjr85eWz5dEiVUPDJ3AzU9Yux+w2E+JSfAjihXBS3OhEyipyTgDfCkvMJl+gMLrnJMkvZnxlwZz/GEH6sHrzjhsrWuMUBbLO4czQgvVcxRDhrcBNJ5sKJi9WoPrnuP1swXFXUUtQK3xP1+diq2dG7NO7i+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gaZGsToBemDutnVDRVR63UF4u2CUHT1Lwlg3rbjh36Y=;
 b=RDPV89OMljGj7P+1CZJgfqoBqPLwNU+x+gLk5BgjC24Y/vIeMFv4WpUj1idKfvAbqPmNjdbNqXslX3tHRqgSjZ0LGrlpPHoR5gDoALunwmNPk2wRIWDUF3zdmA4N/gBZquHDMSt951gfvSjJSmhTmJfNmNhd+OYKMb5vzOd/F4anw9OOufJESj9sX0N4haVzFkfuff/OF9hyRnUTAH0iYP7E3rOFo5iDp9tDWsCt4Y7k0j2G7bs2QmShurv9ZkWVhlcWxtYmAUn0OTdGRGJ8UgowHDgU25jAe68g/wZnlvg8BP62/u9Eg3JAKtn5b0BAAEHOELEHhKbSLRLc2AnF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gaZGsToBemDutnVDRVR63UF4u2CUHT1Lwlg3rbjh36Y=;
 b=YfDTY0C02FgaPfnvYSLGQdG6b+cqlJElu31dE9pY2fpM0+yRyb8/yqZqxD9lG4koAbYGe7ssqClszQCwyaEFIVC2qllXG+R62LVRuRMMH8dPM/lmVewDfAU8dy9OLid4e12ArAGrpi5cKub2AC1HZJmqyym0i9KxtksAi9FclSboVrQkSmoH9Gy2Wf4enR9ngGWrHSbbB15bKMnIRieDUw5+FeimZZSFbMdYWzA7MdUBtEC/qnKZAf8590MoT2MeIQbXadpt/pPUdLESj+2EFsgPQL4c0nhv3Nw7vBIq6lVh7keharaO7nYcWOgyf3WD/pg29rKBsvyGRhknGbQygg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:50 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:50 +0000
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
Subject: [PATCH v8 11/25] gpu: nova-core: mm: Use usable VRAM region for buddy
 allocator
Date: Tue, 24 Feb 2026 17:53:09 -0500
Message-Id: <20260224225323.3312204-12-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR15CA0039.namprd15.prod.outlook.com
 (2603:10b6:208:237::8) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bd9b7f4-b7ba-43e4-f9bf-08de73f79378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p9C326EMI3q1sC2VDoDPBCQYiIZoyvIM5Hi9AVTUVDZTUXyPJxjGwlQjfKbN?=
 =?us-ascii?Q?+NxuoLzY60PAKBBUAywBHW1v4gA3GlcmQkAXKf/wLlFs1OddM10cPT7ml0fa?=
 =?us-ascii?Q?wrC6DwNVtVNLtC50YRdX0ospKLt7BGtxdDJ1YJPZwA8wmB9V9zjLi3FxQc39?=
 =?us-ascii?Q?PImvUA8CLKFobBVeug3tCm1F+QSUFEfTdMj5KzbN7IqGhxgzG/vAq9NqGQo6?=
 =?us-ascii?Q?en+C62ZliQuul8jKvdoUQBShB7zIfhbq2negUwAJ2yVhWLXeVdKIcJksnGYM?=
 =?us-ascii?Q?nVv2/l0kPFJFZMGY3d7jmrKDX3isPBOX9sh+fuNwfWGMprd94ydwr88YAuTC?=
 =?us-ascii?Q?UrYllTK72eRw1GD5UncqxDM39wz9jffLh19jhIc4qt1GHKVJ0uBOS8mFpfCJ?=
 =?us-ascii?Q?YP+nBBKCUHEex2fG69CBG9M9ve2W/NHSTwna6cZT9tKVUCF9FUNPH6V2h/9y?=
 =?us-ascii?Q?e1FbB6gd716qaJxFCZF1p2QrTtcrGnpZ0RB8EYvZ/48LlvHICcf3I7kkSI2u?=
 =?us-ascii?Q?U0MoM9QX1SnLRwKx61KB93OES8gSp8a/VZuTO5PSP3BOcXWZzGx87sqK/ywD?=
 =?us-ascii?Q?yNyJRp8KA+3XUuD3y/Jx1uoUtT89LhqU0DAzc22zxFlrVwHPAT1it/nwe9cX?=
 =?us-ascii?Q?8++oYLP+NIVNfCUDA49sDv+QhyTq3Q/ut3kdj3TSxMUzptboRdl2nMeSm5dW?=
 =?us-ascii?Q?m+xk6sABXFn2YK7CMMHMjCAlvHuKLY0bCi0SN+OHZ+KSMqGH74eC8eoQ6SH8?=
 =?us-ascii?Q?+stbLEPnKskTdLnfUr/mnS6z5NSEhQESektoNF8B9veYbRYWI2DChdxBRA9e?=
 =?us-ascii?Q?eV79sNMDiHIntnECvIwbPCTGya/KlZH4/A7/WBO7KllNWRKvYuFKINzzhgGp?=
 =?us-ascii?Q?kTAW+q1FrYdmBtbF0C1v8Y/I/zn3AV7zIH8I7OwOTIXUZ4YCoOWQgOH/Kivc?=
 =?us-ascii?Q?aEvhPjjK9ubl1zJdSP6Z0PSLrofb7MFrt+Idp/sV1mZumydTZvHHb3N2WZIv?=
 =?us-ascii?Q?xuIQkbQnd2GzJX3P6rcz2ci6XBxbRjRoKch4H1+D6lNY90DUpEc2191pakNV?=
 =?us-ascii?Q?yk0aevOnVYn2MCXW8BxgCGiSd0BGkqaNhmNTUqa5kksgjDASZKNatefow2r4?=
 =?us-ascii?Q?P6tiXgfp955KGyrujhQ5nh9kOxjM0tM2kVGQBpPcvQE0nHXykp23O0i/5iHG?=
 =?us-ascii?Q?bym6Tl0veciQ/mA/dPM5ti5oP14ncOTwEc2tbheacnqtYkpLVPCMrGfSaQ5n?=
 =?us-ascii?Q?diCrsphb+4ztWjK7s19EWE2nlmMc27TBCw3+H8WH47cdOaipNA/A2bpcLeYS?=
 =?us-ascii?Q?lIqwC0pphZIw9DM9C0GQntyxyr4fxbpxHsPNurGdAd79fBPAxkoVPCuTF3uo?=
 =?us-ascii?Q?KHQ84XjKr1jo5G1nDeVDp99oTsa81UQLbn5HBxqlI5H1iq08pV2C4mCMdZFG?=
 =?us-ascii?Q?BAbed2KOfeeU70SygTGWxHb4+u5WBqYOdOP56VvyzHq6j3YVHXu8v9f414Ci?=
 =?us-ascii?Q?kaUgbiNbik0fuhY5Koyk2dxrxR5AOv5l/apWexBI0SfP+4S+ASApSq+m8NWt?=
 =?us-ascii?Q?j5snvAIpP+tWuuQJs0Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6E0Xyz9XyBac8A8KQrPqaA8QIuWn6cOWcxEDDw1gfI7SHYoantZNbQlzU4lc?=
 =?us-ascii?Q?SRsdbjhTDvzK+M63NG0DFlxNj6loO4szr+Fnx9R7DeJ9qUp+xtRdl5YF9j6g?=
 =?us-ascii?Q?jeItXq1XcA2ZYdyeonIkGXN/rtonUFQJOcE+tEbRZQJg8fLbAkFtbTpPiarD?=
 =?us-ascii?Q?qWX70ZwtET9EsQ4YVl3XZDxSwyUJOEeUsDsF9GpvBCLRHcoCI+M6S4pHTF/u?=
 =?us-ascii?Q?m7jvUKxNVz3SJKuyvnGAfi7d6b5W6HylAVxMBgw//7cwCOr8G/g/6x4ipOUz?=
 =?us-ascii?Q?rglKt/sypdx0SKqq7MIN8kV1rC/6NWNa757pD2RxwFC0WrfqiFre0tboxf6U?=
 =?us-ascii?Q?iZYXMuhvBx7oj7F0OqfjU8Xa70c5WeaOVSmbv84c7muR/DHIeZjp1ToF+/bm?=
 =?us-ascii?Q?RXrHO5kqjwLNmtJeVwAIQVK8qWRaOYu5q/o912eJqS4/lUnci5bCRlOUqQis?=
 =?us-ascii?Q?OwSQ+lYKwGrCCFDe4yYfydQ8Agn94rklDmT20ARvP1T326mOKEBDHPZWfAtA?=
 =?us-ascii?Q?Q8XmYiNNXnlz2adtkWakrtFjUPgG0xcz9jdOXeN3TSXFaTqi66Q4x0pa1JG3?=
 =?us-ascii?Q?J30PbWzbu5tbm9uw8oSvl/scgnCCUhUsDfYivDgURV687Z66xAXSJtuOXmoZ?=
 =?us-ascii?Q?csg9MRyZgIS+3L7OuIoWFuVFEoTU2aqmUrCkB/zmnT5ZstAWdQmUk16fm47h?=
 =?us-ascii?Q?KIyI9A8U6V28fLLIPuGzjz2gV/04Sho8pEwpFlAPI8e9KHr+Vm8yuGB0X3nt?=
 =?us-ascii?Q?dl0DG4uL6qkU7a0RV/rqC1NOtDvwHwcfygck8G3zddnLx7f04yxWKCC/xK0p?=
 =?us-ascii?Q?aSqfFQMdcZgqfTKZ7N5/S+v3AQSuCeS2IVkulyquebBHSPN+Mf/qPtIR5wLN?=
 =?us-ascii?Q?wJCyEtkZ0aBXevinCFtFYfimGx+jubnhnSj0o22w/6hprdcRtlxOYYS2szlt?=
 =?us-ascii?Q?03iRhuTZpBxh3ybeozT+NJ9RPy3NUqd1kDcRj1HLK3hyErgbhW+Kb2ao2KFr?=
 =?us-ascii?Q?rmFx0B0W8BUHAwAA+j0/apYB2Sf5KX0oX2uKHghbX0ws+gp/lHXpxQ1DYn/q?=
 =?us-ascii?Q?8Vuo17iDi5WlOpvV01pQfAk+zJPHXhnwJGqtcd4kmvQrLFI7vs2g2o2q5IXM?=
 =?us-ascii?Q?jzGhtiGTZbPATT5pa2dqDhXIJ0Yl8XFh6jOWP9UhNMqvYz4zEbWzVMeF9XPh?=
 =?us-ascii?Q?xEvH7T5eXSiS8+JSt9nS4eWFjmjadIPuWxrFIVwkGap9tnxDQ+jnWNbvEbno?=
 =?us-ascii?Q?gFD9hd3kIUh/Ac0ZLMD5/izFZRos5pdzOab3LkdlhlkO3BcXyvM3YrFN3QFq?=
 =?us-ascii?Q?mbCV2fx/HON/D/4eaqOYPGMghjy457J7R94yYMWObO/+kxfSErkly8BPO3Wx?=
 =?us-ascii?Q?ULOu1dTvE0CStYDNtFA6d4K9gHE8hh5xudVqZLfMLEZsFY1X0pjp5MKl2TBq?=
 =?us-ascii?Q?VN0lWop14sTza/HkDp4zbkvtsUIBq8rqN4TFLU5cyLtpd5gDZHLPi1wPKFCk?=
 =?us-ascii?Q?do7D4YbFsuQZ2dCIuhA962qPqHV1+v7TKWq8XmJHc2340Vb0KlTK2QiDRMtD?=
 =?us-ascii?Q?YFakV9mNIyNySXiqMfaBoQXhxS8DPkcuulEw9TQG6uE0p1H+pMWuKWmo0AQ1?=
 =?us-ascii?Q?UPpOrExVv0khiAnHliewl094AyGzJp20oV9DppZTdxU2PDfbp/Ci+sbAyff2?=
 =?us-ascii?Q?WM0tTNpx+4LZbNVB9/Ey/Ui/bkjFxgAfwEwPUWAPchW3vMSQefpJLKW0P+dK?=
 =?us-ascii?Q?9uKwrfKRGg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd9b7f4-b7ba-43e4-f9bf-08de73f79378
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:50.3399 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v4sNCeLzGYVV/d07LUHWiTvTLHIClsjKrf1llMEofAM7+MDBuwV5f70w6KKd65zQEgcakLanJDPKSUXQ1EpwqQ==
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
	NEURAL_HAM(-0.00)[-0.924];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 26D7318DCA5
X-Rspamd-Action: no action

The buddy allocator manages the actual usable VRAM. On my GA102 Ampere
with 24GB video memory, that is ~23.7GB on a 24GB GPU enabling proper
GPU memory allocation for driver use.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs          | 66 +++++++++++++++++++++------
 drivers/gpu/nova-core/gsp/boot.rs     |  7 ++-
 drivers/gpu/nova-core/gsp/commands.rs |  1 -
 3 files changed, 58 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index ed6c5f63b249..ba769de2f984 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::cell::Cell;
+
 use kernel::{
     device,
     devres::Devres,
@@ -7,10 +9,7 @@
     gpu::buddy::GpuBuddyParams,
     pci,
     prelude::*,
-    sizes::{
-        SZ_1M,
-        SZ_4K, //
-    },
+    sizes::SZ_4K,
     sync::Arc, //
 };
 
@@ -28,9 +27,17 @@
         Gsp, //
     },
     mm::GpuMm,
+    num::IntoSafeCast,
     regs,
 };
 
+/// Parameters extracted from GSP boot for initializing memory subsystems.
+#[derive(Clone, Copy)]
+struct BootParams {
+    usable_vram_start: u64,
+    usable_vram_size: u64,
+}
+
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
     {
@@ -274,6 +281,13 @@ pub(crate) fn new<'a>(
         devres_bar: Arc<Devres<Bar0>>,
         bar: &'a Bar0,
     ) -> impl PinInit<Self, Error> + 'a {
+        // Cell to share boot parameters between GSP boot and subsequent initializations.
+        // Contains usable VRAM region from FbLayout for use by the buddy allocator.
+        let boot_params: Cell<BootParams> = Cell::new(BootParams {
+            usable_vram_start: 0,
+            usable_vram_size: 0,
+        });
+
         try_pin_init!(Self {
             spec: Spec::new(pdev.as_ref(), bar).inspect(|spec| {
                 dev_info!(pdev.as_ref(),"NVIDIA ({})\n", spec);
@@ -295,18 +309,42 @@ pub(crate) fn new<'a>(
 
             sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset)?,
 
-            // Create GPU memory manager owning memory management resources.
-            // This will be initialized with the usable VRAM region from GSP in a later
-            // patch. For now, we use a placeholder of 1MB.
-            mm <- GpuMm::new(devres_bar.clone(), GpuBuddyParams {
-                base_offset_bytes: 0,
-                physical_memory_size_bytes: SZ_1M as u64,
-                chunk_size_bytes: SZ_4K as u64,
-            })?,
-
             gsp <- Gsp::new(pdev),
 
-            gsp_static_info: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?.0 },
+            // Boot GSP and extract usable VRAM region for buddy allocator.
+            gsp_static_info: {
+                let (info, fb_layout) = gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?;
+
+                let usable_vram = fb_layout.usable_vram.as_ref().ok_or_else(|| {
+                    dev_err!(pdev.as_ref(), "No usable FB regions found from GSP\n");
+                    ENODEV
+                })?;
+
+                dev_info!(
+                    pdev.as_ref(),
+                    "Using FB region: {:#x}..{:#x}\n",
+                    usable_vram.start,
+                    usable_vram.end
+                );
+
+                boot_params.set(BootParams {
+                    usable_vram_start: usable_vram.start,
+                    usable_vram_size: usable_vram.end - usable_vram.start,
+                });
+
+                info
+            },
+
+            // Create GPU memory manager owning memory management resources.
+            // Uses the usable VRAM region from GSP for buddy allocator.
+            mm <- {
+                let params = boot_params.get();
+                GpuMm::new(devres_bar.clone(), GpuBuddyParams {
+                    base_offset_bytes: params.usable_vram_start,
+                    physical_memory_size_bytes: params.usable_vram_size,
+                    chunk_size_bytes: SZ_4K.into_safe_cast(),
+                })?
+            },
 
             bar: devres_bar,
         })
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 7a4a0c759267..bc4446282613 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -150,7 +150,7 @@ pub(crate) fn boot(
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
 
-        let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
+        let mut fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
         Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
@@ -252,6 +252,11 @@ pub(crate) fn boot(
             Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
         }
 
+        // Populate usable VRAM from GSP response.
+        if let Some((base, size)) = info.usable_fb_region() {
+            fb_layout.set_usable_vram(base, size);
+        }
+
         Ok((info, fb_layout))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index c31046df3acf..fc9ba08f9f8d 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -234,7 +234,6 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 
     /// Returns the usable FB region `(base, size)` for driver allocation which is
     /// already retrieved from the GSP.
-    #[expect(dead_code)]
     pub(crate) fn usable_fb_region(&self) -> Option<(u64, u64)> {
         self.usable_fb_region
     }
-- 
2.34.1

