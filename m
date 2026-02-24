Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAcgAAYsnmmkTwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A043418DC1A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF6110E675;
	Tue, 24 Feb 2026 22:53:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TLGnnpvV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C618610E658;
 Tue, 24 Feb 2026 22:53:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntJ1dXfeQ7cSve17v/fmtonkfBlFsa6W54x8+9psKG/s0nuIr+W8/ySd1HIGiXUoUoR9AFILZI2mFVvrk7m6uzPLGkwJkcfGSCsVUIL1wIMbcsn3qdmctX2gowbeM7DvFhsdUogU7NuixOPaQ2Qp+/eZByTUL2yYvOhDI3TusPe5/2/CMHM0ffZo68+Fg8ZuRkRAaIOVQLOfAQgWUmX2vf6iwnZO1j8XcuUPb/kZ9DZoxpLcAJgv8m8FayVeg4hZ2gOYlEOkWPuzo+6DkZHENyMoqDdMxtSjhwcup71sEm1+Omp0mi9Vr7nuvk798xPl/s7RjWSaQVTHbVQnzIKGmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS35ffwLIUKN0sCbhJ9Szs+fyzN29YQTxRT2bYXvTI8=;
 b=PKA48oX9mnmi5mA7Ejope36l+r1fdj2aeS+FVyB13EAMoGsN/rs38VgJrhiUn4ULQnxqe8rS7xvGwRXrdx4QwQyqlSMrWO5g4sIi6/CALyKyFFK58XokT+Iv10dHasGPk7yWYKxu1+Nzp7ZvDT4eMb1qZSEu7vL4oMtfy9iNrDFRBqel19nkCeW9XeK34pLJWxesT7ob4t/1gEyzOexVV7TzYCxbljdEx3edcK5GlI44E2SUm1sacw9pRkhy/qmpC5fMrOEM1Bo1/OCZaNmFXUkZW8mz5sS3Ut/w2V9nq9AtqCuUlZS+u5JSnoA4gVqIZ3wNktZB/6OhbxBAgYKRJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS35ffwLIUKN0sCbhJ9Szs+fyzN29YQTxRT2bYXvTI8=;
 b=TLGnnpvVMgrpVu3GQ5oS3fnEOHqTVZd6M1B22pVb6Lv9517a15fs+oOYIkVJSDrl7noxykb9GEVi4HnYFk6Pw2ItySVA65zY360KcwMm9XnvFkxA4OFeCLDq8fwQXAWdKLsGSjtjHwVS/PJxTZ97NourvQqgHBOSv7GbH6bZmOZIjyw3vUhcYCXZ5LeLyPbzANcJz4d3ooOqbUQqxYV9YKKCjdCPSCFZn9awjZJ95Wmn9uIZeROckebnOBxDW1qvOuJVNZR8+gNlJxU+i/wFxNZMMKU8EUrrvdir7zaPEMciaaad4zHn//rAXgg1JY43hZ4qMCDj8+tQ6SzAjjoDJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:43 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:43 +0000
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
Subject: [PATCH v8 06/25] gpu: nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
Date: Tue, 24 Feb 2026 17:53:04 -0500
Message-Id: <20260224225323.3312204-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: IA4P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:558::14) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 6109dac6-f7ed-4fc9-a1b6-08de73f78f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R+irCHOG/qkXTb951yB61jwSJovlDPwv+TUGOD3Bud+ER+GQhVxS4nj8ZQd0?=
 =?us-ascii?Q?yQG9FydrK17POepsVrDkLfX7ZkUjuTbG7o6Fpzqxq5LBhmOpumfkrq4Fwj71?=
 =?us-ascii?Q?KI0EiDQRAI/DLdmXBm8I43YIxh5hIvc1RZPziQTLL1+ZC9G0StW+pDrqtzVL?=
 =?us-ascii?Q?ds101YS65qDdE/Jsim3PQZb5cf/Oa5JVnDTd2Nbt7c4DsgNCwIt4iRWYcd9y?=
 =?us-ascii?Q?Sh7R7xCKTiFeMygK1wrxFakca24XzOl+dhfBxeAKcOKQsqAckUImE02RI6Do?=
 =?us-ascii?Q?95Z2jQsyPz7BX1f2JLGUwQNAu7uNDL6AQd1MpK+LMfRo8rbyhzDZvvcwrrT8?=
 =?us-ascii?Q?0J5TM7InDJbgNJg4PZYUuQSGl09ruaNnni23/d6VdPtf1UnV1Cgkw+bOUm6j?=
 =?us-ascii?Q?vtEP6c444v33UpG6c/6IesPUBEzCJaUDLHjoysnvtEW07VTCVTB0QusHCLNv?=
 =?us-ascii?Q?1P3peX1Wt+XTMX6QA73FBZfMyhnX/qGypxkZtwj+t+1/Zt5gci2NYIps2V3X?=
 =?us-ascii?Q?sXsTZShYIV4RJedRHp0cUSgFaSPaxM9m8wZ2Mwrn4uLmrjuaV4rOYY88ufYa?=
 =?us-ascii?Q?W5FohXF8ypF1WgE4skvTQxDkb804oZkTivbkM4ACnXjVJBel7Gs+523HqVtZ?=
 =?us-ascii?Q?bufUfS+VRAhZiAve8vPIvnyYWpG4hUgphPPov9g1+NAzq6O6aw5FEEEbmm5e?=
 =?us-ascii?Q?PuSTKfyKgyi02t5UqdxM/5F9RH+EiEpN2qw8lsc+mOlM9qOFWbFjKAlX3+Mj?=
 =?us-ascii?Q?+9uHhGjlbg6OBjuI1tbZLJi93c/BHRH0JvJ7L5VOye0r7koQW+2FRGHkt4by?=
 =?us-ascii?Q?Vnv4cbmSUOAFeUI2rSRmrM4BM5bu8qScweGQyO7DaIY6Mfk+dVGJgIZrIy9P?=
 =?us-ascii?Q?r+b+RlYWtZak59c2vNTg5ZlozpZrwQ/aJvvU5XK72+g2QlgrtoY2lk90EAcH?=
 =?us-ascii?Q?nYfCbAPaXVBanEGAks7w3ZLnXeXyU6AzO477QDvFUhXHExkM/zpEuOQpXRXy?=
 =?us-ascii?Q?MqqdkTx9LrXfhj4PGJ1DyCyysIrHRNcwmbFg4pCqJhbl/K9P5O4yEqyE8dx/?=
 =?us-ascii?Q?QtBTdnZS0x/ppQKHcm0IKQ+lhoYm1R1TEjTxgLrgCPoGTcIep7LFzRzN3BEw?=
 =?us-ascii?Q?0CuslXs23j6wQq35sl0OCNaXq+r+oljzpIUhgXE3yjrJf9ifqdgAaFxVj8V4?=
 =?us-ascii?Q?PlF09/UDQdecc2mOH34MDxfCWlkHzKRcqh0rpeNxJ1LXmhwUQ/USiQpMvWBz?=
 =?us-ascii?Q?9/LrWLQHoOc66EAW7bZrrAoMdalmG5au8FTsYe5ZpelP5SoCmHcaSnPB6A0S?=
 =?us-ascii?Q?zJ0tyyeJ9O/PyhbyfJLUougxYLNhtCIvd8pS7S6KC9A0atpRX4scke9PeE2y?=
 =?us-ascii?Q?6qICMUe7rl5snM+Z4we68gBpxRDEvgUpZMWhgS5zjsOqC72G/8I+1VgB/bT2?=
 =?us-ascii?Q?o4sRn5TVcsdxV2ApZLhecupRWo4JhrAj4yTKTKZi+J/CnvA4ZFrj8LFR4Rkd?=
 =?us-ascii?Q?Z6jTJgZ9kH35GtbYKofN1nbWrDkW0XMpfT0+f7UIsJGsGN6L1C7lfbfI6bm+?=
 =?us-ascii?Q?fRvD4yEz1KaRY/FsVLw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kyNuptF6YydKBs1nKm/zmhrlkQbZALAE70lXIXvTPIFNubdTq+O0Vg0A3xbV?=
 =?us-ascii?Q?3cMNNKZd7N+9zRbvwwsCRUeFgOeLc2kEOcO4fBNLIeLbUoi0Bk1wtryA/mNr?=
 =?us-ascii?Q?Nxn1rBZyW13l9U0AfZXR1DAaN1P0+d4oI89fQby0LLr/QeJwXl3yxDOFHb8U?=
 =?us-ascii?Q?fIbCiLIb9Dk05K0NXFQXTT3lBLdaY84j2tuxUT8k2jl1hWDiZFj5tL+MVo4t?=
 =?us-ascii?Q?WpKv4SOPks3jaat7m3rAnVl+m4v/Ey5+FOLYyf6ZJ9+M+60VTu6AAscudiAf?=
 =?us-ascii?Q?rM7pN9lxczfXCBel8lEJZzyzZWH9vhSLnkzFvDHOyRXq9HzCsdLoCtZAIrdP?=
 =?us-ascii?Q?IWxmzWCYydXtd+0Cnfk16h+WgNfLXeUf//nSfg+fo8it6b36zJfI4s/cAzUA?=
 =?us-ascii?Q?YP4mBLAM1z+Tae0QcWF1eihG2Z3djFpLZDrvOEXhqZa14n3VElpXns1aLTlj?=
 =?us-ascii?Q?N6L+q55KSGvvPEnRfVBzhofrAAL0BsGvWhD4LtTEqIZB0VAddF0Kg3q2YSdZ?=
 =?us-ascii?Q?ywo/uc5+YEHRtDTLZ/sdTG6mpm2fdvPkoLjEsNWVLGa5MMd3UyUFjYQTS4XH?=
 =?us-ascii?Q?fKetFNABfi6Xu7SCnRmNI4vfvPE7xI/LiMQcWJbTYcUtOvCiH5k6SmApUgvk?=
 =?us-ascii?Q?nCSHvsIxQPKfmNf61JntPumesfYivrqCz/cElIAoWGYpEhP0/kKKwPMuuZ/t?=
 =?us-ascii?Q?q2zJVo0ykD04xNvYCSsKCBpE6EvzR7XmZivJtH+A3nk1Ibg+o23+d5c6CJqJ?=
 =?us-ascii?Q?j1WF8BNZr/yjS1lH9Owy2j9+2cvzIl65y2rmShBro+lQO9vB6dgJtDSIRuLo?=
 =?us-ascii?Q?87rioiG0zfQ2CZcfisePPKZXeJD7n46rlpiRU0JYrR1qA+EpCF1+ETuhK53O?=
 =?us-ascii?Q?4xk6MfpX4lK7uPq2ixAenfopmMBm8LyecKBzoJQSSSuFixDHENWMxRncr/FF?=
 =?us-ascii?Q?XJGzLODdwr1LdUTf5zPgWgPLWup3IUZRkGaI+TYm4U9Jct+JsiCaYDc88F6R?=
 =?us-ascii?Q?2ezCvRoD5aaAGBF3RReYv6R4qIk3KecjX9OARf29c6jKrzJfmqhl2z9zQD5G?=
 =?us-ascii?Q?PVvzcMw5iUFvZFiqRMpAHXvV67+Awn3A6IqIXkZXxzsNaOfpCLAw7016jcUV?=
 =?us-ascii?Q?1ehxu1cg4XbUs59z9UTNZR5ZyfReu5hF7XZrrp1sT2sSXV6UPPva2HpYnabc?=
 =?us-ascii?Q?sxXOCU+2O10qKCAgJEGf5k8dUZagn/LrhfmoCNeOuS1wV115Hlpwa5JYA6xS?=
 =?us-ascii?Q?IKjxy3qGEAiXSCAJ/L4vRRk/yY7tSDCNgXP8L6EdpHweiqnAShY1vPa8ZjsA?=
 =?us-ascii?Q?XcACrEd/zPkjgJnJlKTtr0Kkzs3G5Eycwsin2wYWxsUoVUYDA5vD2MqsIFqh?=
 =?us-ascii?Q?DEa09f/XDf8EBhlD208rSlN5OhTpDEYczonLsJoHsFuc5vs31QU03Ki1K8Az?=
 =?us-ascii?Q?HYntohDQnnpAJ984fuB7D6pWo2xJ6uW4cN/sRc9f9zpRTQyERoC3fkv+K6a+?=
 =?us-ascii?Q?BivacJsiDlETXOh8UYGvmTMwe3z555mpGgIZlw7NHqbM4mtHu8sHMBXvR+4V?=
 =?us-ascii?Q?RbP0upMci9ihxwR7lECQcSzbOMaCaGWIhtu9Y7fQUudBIFRjWb4C8rxaTYQT?=
 =?us-ascii?Q?1R0cBcZSz21PIpC0zjKOpKCLKzyMErdBX0w3zIX42tDfF+oR2LemHtFUZvdQ?=
 =?us-ascii?Q?piPKm3JgMIf+exPTGfrKqKTNBDwlSN4YRU7I2Ua5uD6k16wkwIoyAHczhV5t?=
 =?us-ascii?Q?fOVq46pw8w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6109dac6-f7ed-4fc9-a1b6-08de73f78f2b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:43.2239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnsCAnEfv0vGpz1lLQPD3+Vml500mhM81YoiLoOYAwVJQZTU7eXLlpsidMV+ritW74C6Yf/7nqs5mruNK9cf3w==
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
	NEURAL_HAM(-0.00)[-0.935];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A043418DC1A
X-Rspamd-Action: no action

PRAMIN apertures are a crucial mechanism to direct read/write to VRAM.
Add support for the same.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm.rs        |   5 +
 drivers/gpu/nova-core/mm/pramin.rs | 292 +++++++++++++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |   5 +
 4 files changed, 303 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm.rs
 create mode 100644 drivers/gpu/nova-core/mm/pramin.rs

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
new file mode 100644
index 000000000000..7a5dd4220c67
--- /dev/null
+++ b/drivers/gpu/nova-core/mm.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Memory management subsystems for nova-core.
+
+pub(crate) mod pramin;
diff --git a/drivers/gpu/nova-core/mm/pramin.rs b/drivers/gpu/nova-core/mm/pramin.rs
new file mode 100644
index 000000000000..04b652d3ee4f
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pramin.rs
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Direct VRAM access through the PRAMIN aperture.
+//!
+//! PRAMIN provides a 1MB sliding window into VRAM through BAR0, allowing the CPU to access
+//! video memory directly. Access is managed through a two-level API:
+//!
+//! - [`Pramin`]: The parent object that owns the BAR0 reference and synchronization lock.
+//! - [`PraminWindow`]: A guard object that holds exclusive PRAMIN access for its lifetime.
+//!
+//! The PRAMIN aperture is a 1MB region at BAR0 + 0x700000 for all GPUs. The window base is
+//! controlled by the `NV_PBUS_BAR0_WINDOW` register and must be 64KB aligned.
+//!
+//! # Examples
+//!
+//! ## Basic read/write
+//!
+//! ```no_run
+//! use crate::driver::Bar0;
+//! use crate::mm::pramin;
+//! use kernel::devres::Devres;
+//! use kernel::prelude::*;
+//! use kernel::sync::Arc;
+//!
+//! fn example(devres_bar: Arc<Devres<Bar0>>) -> Result<()> {
+//!     let pramin = Arc::pin_init(pramin::Pramin::new(devres_bar)?, GFP_KERNEL)?;
+//!     let mut window = pramin.window()?;
+//!
+//!     // Write and read back.
+//!     window.try_write32(0x100, 0xDEADBEEF)?;
+//!     let val = window.try_read32(0x100)?;
+//!     assert_eq!(val, 0xDEADBEEF);
+//!
+//!     Ok(())
+//!     // Original window position restored on drop.
+//! }
+//! ```
+//!
+//! ## Auto-repositioning across VRAM regions
+//!
+//! ```no_run
+//! use crate::driver::Bar0;
+//! use crate::mm::pramin;
+//! use kernel::devres::Devres;
+//! use kernel::prelude::*;
+//! use kernel::sync::Arc;
+//!
+//! fn example(devres_bar: Arc<Devres<Bar0>>) -> Result<()> {
+//!     let pramin = Arc::pin_init(pramin::Pramin::new(devres_bar)?, GFP_KERNEL)?;
+//!     let mut window = pramin.window()?;
+//!
+//!     // Access first 1MB region.
+//!     window.try_write32(0x100, 0x11111111)?;
+//!
+//!     // Access at 2MB - window auto-repositions.
+//!     window.try_write32(0x200000, 0x22222222)?;
+//!
+//!     // Back to first region - window repositions again.
+//!     let val = window.try_read32(0x100)?;
+//!     assert_eq!(val, 0x11111111);
+//!
+//!     Ok(())
+//! }
+//! ```
+
+#![expect(unused)]
+
+use crate::{
+    driver::Bar0,
+    num::u64_as_usize,
+    regs, //
+};
+
+use kernel::bits::genmask_u64;
+use kernel::devres::Devres;
+use kernel::io::Io;
+use kernel::new_mutex;
+use kernel::prelude::*;
+use kernel::ptr::{
+    Alignable,
+    Alignment, //
+};
+use kernel::sizes::{
+    SZ_1M,
+    SZ_64K, //
+};
+use kernel::sync::{
+    lock::mutex::MutexGuard,
+    Arc,
+    Mutex, //
+};
+
+/// PRAMIN aperture base offset in BAR0.
+const PRAMIN_BASE: usize = 0x700000;
+
+/// PRAMIN aperture size (1MB).
+const PRAMIN_SIZE: usize = SZ_1M;
+
+/// 64KB alignment for window base.
+const WINDOW_ALIGN: Alignment = Alignment::new::<SZ_64K>();
+
+/// Maximum addressable VRAM offset (40-bit address space).
+///
+/// The `NV_PBUS_BAR0_WINDOW` register has a 24-bit `window_base` field (bits 23:0) that stores
+/// bits [39:16] of the target VRAM address. This limits the addressable space to 2^40 bytes.
+const MAX_VRAM_OFFSET: usize = u64_as_usize(genmask_u64(0..=39));
+
+/// Generate a PRAMIN read accessor.
+macro_rules! define_pramin_read {
+    ($name:ident, $ty:ty) => {
+        #[doc = concat!("Read a `", stringify!($ty), "` from VRAM at the given offset.")]
+        pub(crate) fn $name(&mut self, vram_offset: usize) -> Result<$ty> {
+            // Compute window parameters without bar reference.
+            let (bar_offset, new_base) =
+                self.compute_window(vram_offset, ::core::mem::size_of::<$ty>())?;
+
+            // Update window base if needed and perform read.
+            let bar = self.bar.try_access().ok_or(ENODEV)?;
+            if let Some(base) = new_base {
+                Self::write_window_base(&bar, base);
+                self.state.current_base = base;
+            }
+            bar.$name(bar_offset)
+        }
+    };
+}
+
+/// Generate a PRAMIN write accessor.
+macro_rules! define_pramin_write {
+    ($name:ident, $ty:ty) => {
+        #[doc = concat!("Write a `", stringify!($ty), "` to VRAM at the given offset.")]
+        pub(crate) fn $name(&mut self, vram_offset: usize, value: $ty) -> Result {
+            // Compute window parameters without bar reference.
+            let (bar_offset, new_base) =
+                self.compute_window(vram_offset, ::core::mem::size_of::<$ty>())?;
+
+            // Update window base if needed and perform write.
+            let bar = self.bar.try_access().ok_or(ENODEV)?;
+            if let Some(base) = new_base {
+                Self::write_window_base(&bar, base);
+                self.state.current_base = base;
+            }
+            bar.$name(value, bar_offset)
+        }
+    };
+}
+
+/// PRAMIN state protected by mutex.
+struct PraminState {
+    current_base: usize,
+}
+
+/// PRAMIN aperture manager.
+///
+/// Call [`Pramin::window()`] to acquire exclusive PRAMIN access.
+#[pin_data]
+pub(crate) struct Pramin {
+    bar: Arc<Devres<Bar0>>,
+    /// PRAMIN aperture state, protected by a mutex.
+    ///
+    /// # Safety
+    ///
+    /// This lock is acquired during the DMA fence signalling critical path.
+    /// It must NEVER be held across any reclaimable CPU memory / allocations
+    /// (`GFP_KERNEL`), because the memory reclaim path can call
+    /// `dma_fence_wait()`, which would deadlock with this lock held.
+    #[pin]
+    state: Mutex<PraminState>,
+}
+
+impl Pramin {
+    /// Create a pin-initializer for PRAMIN.
+    pub(crate) fn new(bar: Arc<Devres<Bar0>>) -> Result<impl PinInit<Self>> {
+        let bar_access = bar.try_access().ok_or(ENODEV)?;
+        let current_base = Self::try_read_window_base(&bar_access)?;
+
+        Ok(pin_init!(Self {
+            bar,
+            state <- new_mutex!(PraminState { current_base }, "pramin_state"),
+        }))
+    }
+
+    /// Acquire exclusive PRAMIN access.
+    ///
+    /// Returns a [`PraminWindow`] guard that provides VRAM read/write accessors.
+    /// The [`PraminWindow`] is exclusive and only one can exist at a time.
+    pub(crate) fn window(&self) -> Result<PraminWindow<'_>> {
+        let state = self.state.lock();
+        let saved_base = state.current_base;
+        Ok(PraminWindow {
+            bar: self.bar.clone(),
+            state,
+            saved_base,
+        })
+    }
+
+    /// Read the current window base from the BAR0_WINDOW register.
+    fn try_read_window_base(bar: &Bar0) -> Result<usize> {
+        let reg = regs::NV_PBUS_BAR0_WINDOW::read(bar);
+        let base = u64::from(reg.window_base());
+        let shifted = base.checked_shl(16).ok_or(EOVERFLOW)?;
+        shifted.try_into().map_err(|_| EOVERFLOW)
+    }
+}
+
+/// PRAMIN window guard for direct VRAM access.
+///
+/// This guard holds exclusive access to the PRAMIN aperture. The window auto-repositions
+/// when accessing VRAM offsets outside the current 1MB range. Original window position
+/// is saved on creation and restored on drop.
+///
+/// Only one [`PraminWindow`] can exist at a time per [`Pramin`] instance (enforced by the
+/// internal `MutexGuard`).
+pub(crate) struct PraminWindow<'a> {
+    bar: Arc<Devres<Bar0>>,
+    state: MutexGuard<'a, PraminState>,
+    saved_base: usize,
+}
+
+impl PraminWindow<'_> {
+    /// Write a new window base to the BAR0_WINDOW register.
+    fn write_window_base(bar: &Bar0, base: usize) {
+        // CAST:
+        // - We have guaranteed that the base is within the addressable range (40-bits).
+        // - After >> 16, a 40-bit aligned base becomes 24 bits, which fits in u32.
+        regs::NV_PBUS_BAR0_WINDOW::default()
+            .set_window_base((base >> 16) as u32)
+            .write(bar);
+    }
+
+    /// Compute window parameters for a VRAM access.
+    ///
+    /// Returns (`bar_offset`, `new_base`) where:
+    /// - `bar_offset`: The BAR0 offset to use for the access.
+    /// - `new_base`: `Some(base)` if window needs repositioning, `None` otherwise.
+    fn compute_window(
+        &self,
+        vram_offset: usize,
+        access_size: usize,
+    ) -> Result<(usize, Option<usize>)> {
+        // Validate VRAM offset is within addressable range (40-bit address space).
+        let end_offset = vram_offset.checked_add(access_size).ok_or(EINVAL)?;
+        if end_offset > MAX_VRAM_OFFSET + 1 {
+            return Err(EINVAL);
+        }
+
+        // Calculate which 64KB-aligned base we need.
+        let needed_base = vram_offset.align_down(WINDOW_ALIGN);
+
+        // Calculate offset within the window.
+        let offset_in_window = vram_offset - needed_base;
+
+        // Check if access fits in 1MB window from this base.
+        if offset_in_window + access_size > PRAMIN_SIZE {
+            return Err(EINVAL);
+        }
+
+        // Return bar offset and whether window needs repositioning.
+        let new_base = if self.state.current_base != needed_base {
+            Some(needed_base)
+        } else {
+            None
+        };
+
+        Ok((PRAMIN_BASE + offset_in_window, new_base))
+    }
+
+    define_pramin_read!(try_read8, u8);
+    define_pramin_read!(try_read16, u16);
+    define_pramin_read!(try_read32, u32);
+    define_pramin_read!(try_read64, u64);
+
+    define_pramin_write!(try_write8, u8);
+    define_pramin_write!(try_write16, u16);
+    define_pramin_write!(try_write32, u32);
+    define_pramin_write!(try_write64, u64);
+}
+
+impl Drop for PraminWindow<'_> {
+    fn drop(&mut self) {
+        // Restore the original window base if it changed.
+        if self.state.current_base != self.saved_base {
+            if let Some(bar) = self.bar.try_access() {
+                Self::write_window_base(&bar, self.saved_base);
+
+                // Update state to reflect the restored base.
+                self.state.current_base = self.saved_base;
+            }
+        }
+        // MutexGuard drops automatically, releasing the lock.
+    }
+}
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..3de00db3279e 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -13,6 +13,7 @@
 mod gfw;
 mod gpu;
 mod gsp;
+mod mm;
 mod num;
 mod regs;
 mod sbuffer;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index ea0d32f5396c..d0982e346f74 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -102,6 +102,11 @@ fn fmt(&self, f: &mut kernel::fmt::Formatter<'_>) -> kernel::fmt::Result {
     31:16   frts_err_code as u16;
 });
 
+register!(NV_PBUS_BAR0_WINDOW @ 0x00001700, "BAR0 window control for PRAMIN access" {
+    25:24   target as u8, "Target memory (0=VRAM, 1=SYS_MEM_COH, 2=SYS_MEM_NONCOH)";
+    23:0    window_base as u32, "Window base address (bits 39:16 of FB addr)";
+});
+
 // PFB
 
 // The following two registers together hold the physical system memory address that is used by the
-- 
2.34.1

