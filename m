Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eArvASEsnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DFC18DD7E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73B8910E695;
	Tue, 24 Feb 2026 22:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qt9aKpJG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A2010E676;
 Tue, 24 Feb 2026 22:54:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tL7OBOKeVCKJUFhVOYsKFr9RhzewEDC2J00CVdBLnYZPOqmvbQqgvAfju8IJ1ZOkEnaQg7ca7N7wcCKceCOokjk7mCJN38mCo8gSMzVLjfgpF9hXBZzIuWSIxVPGoAu/ovW8pH+8d2NWY783JeOiLOSfyBemGEMU0mn0oqQt2NjM4y+Emg3KlxNSEfQMAdBc70TiB9GnDzqC3PXUnOmXN1RlvdswkbjERtK3H5zCrb17VuLu/uw/jSHVkDfNIKF1ETUij6TpjatmzXyboYU0iVBk6uCKnstaUYnYh5fLofnILzv/1n9Bjnsf2fPlR0YG72lt0Q+dRXzX3BoDkNe9/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRLvMC1d8ZGSqanoXwzTAst8Iwx3wmTxtQ+nr9leKHs=;
 b=eLvEwm2faO5x46Dmrxay/4qYVmvTuwYDh13saKO3V0Mz2jlwAnBfvkflVoadQ8hKD/QyKDn2lviXYO5/Q4p6FJlehKm66uL702X5ekx4iSBAf0DgqrlbTvsFq+KxqIW8s5AgQyem/vyHLypAXpq04iBBLeBNMHuCtIWIldyqenGa8umbeGKnk3p7LnFRqcZKmPDQfXEQsrMdc9YLfGDtXlN//geDzgPojX8iNt0asEHVmdzYuJgvkhSQjbBFcNysvQKaF65KUlx2vJ2nyjve2Cyk7YD9iWWhi71XCAgnRBxfAwUb5mEQRkf9uqrFtNlYQ3s+bM2P6WHc0AUjSFCqdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRLvMC1d8ZGSqanoXwzTAst8Iwx3wmTxtQ+nr9leKHs=;
 b=Qt9aKpJGdzMRMN3UFkkjdJw3t7gs+lidM5/GvtCLMc/GbuhkLdgNVcvJkh3xpZY/NCtvo0bdVdEzawlEDsCf5apV15Czwjj+77TSO4ItKhJPZqtDIG9H8mh26VAmNeXOFqoR+zWUBPAJtjbGIr5fcR4L95IcOlajQac1o15EgtzWvp14xIIktaY+NqX3srWZhS2+GBsxL4C35NzqbvEghIf3rsB5haFrJXbG6h+K7gDzkrjHOrWS2twkWQU3ufVVm6ugQvUrWty4Qw5K0o2GyBxK5Omv7rAsJEaL2zOgeI3VkacslvL9VUjnRFGhYEAYtVDOH3UoDJwuFip3cVw2UA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:54:03 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:54:02 +0000
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
Subject: [PATCH v8 20/25] gpu: nova-core: Add BAR1 aperture type and size
 constant
Date: Tue, 24 Feb 2026 17:53:18 -0500
Message-Id: <20260224225323.3312204-21-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0031.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::6) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 2da57846-b251-45db-4f06-08de73f79ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GaKtzA+g6LmnrDbSRmfOGPpjzEjSUAz3n3fN3OXVVhsMmsXP5K7bq59P9Z+h?=
 =?us-ascii?Q?PknJQhW15IeWnk3SYMGE0p5x3RzW31eJM/5g4Jgnq4LRdGGUZQZo7xkttMN7?=
 =?us-ascii?Q?WiVs5Xxr52Q4NO7fazV5PcZont/rRVtwsTZsbx5x34Q2Z/YanD09zRkq04ux?=
 =?us-ascii?Q?7VWUDaNFz+sf1/oUw5w5PyJKU0O5ll2giMZJEl94iQ+1Aoyob/Ip4NJzQRbc?=
 =?us-ascii?Q?qCcQlRe3cZwDxXfGEyWCrb/+C6qkCN14lZ8ewqCZmhE4DOBxT7C6o0GWzcj9?=
 =?us-ascii?Q?m01u9SPXoxajP8p5P5c/VcxqhIKc0JhsyEnviXeJerqyhArR2+gkiBfqo+kv?=
 =?us-ascii?Q?eYaRz8DbAPeQfwlZLIMuYVH0pGK6gN5hIquzbkdDeXekcBmNfLHs725w9meH?=
 =?us-ascii?Q?ZqwtXIqgz/wsVJLBx72HKtpUXrvNYN4eVyt6gpVPS7DJnHZ0KXvJTPAVT3mt?=
 =?us-ascii?Q?u+Z7TF7/ZicZ6i6+UvPk7ylX9P577/TBCb01lYYeJgSNp6VJcn4/MtZREv6t?=
 =?us-ascii?Q?+EiGQmjrDG3VXpiOcZ/Cg1W+lhcU0COgPxeAEXWm+nvcT6A4PqW0vcGCG5c0?=
 =?us-ascii?Q?HMz8tHcedXQSX3S93qLIVF3zKnZl346APxZiy27kTCpbb0TfEiFBvIwZY+yJ?=
 =?us-ascii?Q?JIqJtVo4Qdd7I58K2bvekQBUtC4vTjj0l7CA4M6vVamJxx4ecofeHedLbpvd?=
 =?us-ascii?Q?9XWGuOQBp8haSQXFvquLkqkL9i2SdVZLmHFUPUcB06L9RD2yUu8harYIYv3q?=
 =?us-ascii?Q?/OjdYahbHkMDYcTO9jAUX1pifNmbgYgz5XhVls9i8rENXdk+4HqzLaEWhH7L?=
 =?us-ascii?Q?UCnw90vTzPi/oZm+wPocgGzt6a6BGr/AVz0NuHKuPNRxU1YV33YuhvYwN9SB?=
 =?us-ascii?Q?ug0Wi5iwJCc03163FzLFZeL7EJWrFh+bU+zsNTnvIZEFJS62HV9XXI/VxdNB?=
 =?us-ascii?Q?XO8TzzZ6v0kTNI/InqYnkvXaal9Eo68QFVOe3dnuVMO7Wunh0nU7xzL0nEPh?=
 =?us-ascii?Q?gd0etkJN+D09yLcB9zJh8blydpMXJbsFSyMdnNyoNhLCr+jyWQTbcH9o/iLT?=
 =?us-ascii?Q?zZYOF50sEMKpp1ucgxRstM5tus+B0r323Uy8SVBEEbPeRHx75YUmT8h9x9LF?=
 =?us-ascii?Q?Kr4hvU1eeNbh5iIMIClOAfmumE+0w9LugbVMVsRb92cPDI+mOdaQebkUrG9M?=
 =?us-ascii?Q?HYzisEk+RIbocwaCgSsOm6R3E4hSrAj1JmKI4b1fG3ThFVr5FB268VjX5tJw?=
 =?us-ascii?Q?4SDxyq7Q8zuvfTIT3+xZE2uh84raxlm/ZN1AyQLpyZP6ZMOVWN/c3f6fa/N5?=
 =?us-ascii?Q?RzO2cIPo1W/M+f2eHlXN8IyKNusVGnm+CuTdhqps+6CzGqKq/mGKSO4HpkIl?=
 =?us-ascii?Q?QYs/C4op3l12l/rzlyilEiBBlyG24zswCuVZRLEYgXClO0ux5Ozfgng76YQM?=
 =?us-ascii?Q?9ybxKADnMbX2BwRx+Qj76RwsiHgXihintR6he9XaUk9lo4rB57vIYpx02xP2?=
 =?us-ascii?Q?x5p2Mbfq5IazL2revAQ5iN3EsQflEk6cKcla8IrUWo4PiN5NqRj2OYc06N/F?=
 =?us-ascii?Q?zVs4TPHF7zTE5z5LOh0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LsN9o7/RjSiBXz5K3Xo2gD5rneBQEdxXy9MomXUBUoOlI6/0Bt1wErO5pa7l?=
 =?us-ascii?Q?PXiEKiZchAQC2z1MbgXA0esWsu8DpnY2CoEOWTCaQ1TvXo5rCX0NBr2ByKJn?=
 =?us-ascii?Q?r3+8cTZGypc+NzvMnYLwQpjiDE9zOdoW4RHBhkQ1hZP9Zv/wVvq0gX5wrvu4?=
 =?us-ascii?Q?LDughhIoSBpOMkpJlUZY7Ub+IUmIHoKPG0NfVcvUANoIg9wyT8wKF0MDADzp?=
 =?us-ascii?Q?dJFEd/9yFZq0mCCYmUU3PBWVNJsxPvymyumAIBKJr8XJ47jhpYoGCNH9lvry?=
 =?us-ascii?Q?0b2HNlVuzyq7JRnM42apMzW9RGXVpo9T4QSRL7cor1vzbzyAIGai9ogGCX7q?=
 =?us-ascii?Q?vqKASbzVIvk9uMYmWVLFkgDKKvm5FepWdIPHLADbj+clOss9r096WFGijQ4/?=
 =?us-ascii?Q?f8jsFOFMwUH9SwGnWWkBBfwLCU1QPeKCU7aXK316XVTCkUnAgNmWxlfbVNtO?=
 =?us-ascii?Q?ZCSXVCe4mA7fnXsz+cw8eBKZFplRPibrk78uSkO0kZyLTZSanuNtsf9ndIon?=
 =?us-ascii?Q?ivBPZHfAc4c9VFh7d0Og0D9MXCD5uY8v0aXOollB7xsEWKKlgXoAGTI/rASW?=
 =?us-ascii?Q?VvZwkOAsSgs7ky5Rpip+1xIUasrHfM5T5tr3q75jkJ5QbJyGu0CigIAR/u8C?=
 =?us-ascii?Q?GePgsPe/X8P3U7U2LOxsnb8CgoZMatce90okW3mfcoWBb+M8WQzLj+q9oQKc?=
 =?us-ascii?Q?vHkFYrsULSeeufLbT1CbceBlfNXLGUBCQ91BMGXTrW1NRVkAbNnqZ6YFsH/h?=
 =?us-ascii?Q?l6wWuYsdSKRoDO9Q8Vl1WXqZvtCVZgvDWtFGqT8qfSJpiXLuTctDqoB9jsW4?=
 =?us-ascii?Q?m11f6i3wLPsA/fUFdPOlbmvCjgwzP/nzIKsHZSWd7YWO/1OxhszIk3qaHsKC?=
 =?us-ascii?Q?N2FJ5gjRaoJPUDcVjTKj34LdRDwnFGCTsZ7uDI3jPdbEzVxdlPd4OW/MNa6F?=
 =?us-ascii?Q?a9fKoO3vswNZvyfg3Ttwg8LjqL3rtcTrWbzHuRKVzn5xJr4rIyJC6m+7Gj7N?=
 =?us-ascii?Q?HhHYJlMKk/Jc9JNPTjm3ErC9mxykJgp7QNCmDyDlXUgOxkI2+9J/Q2lhYgOD?=
 =?us-ascii?Q?PUCWT/vPh2wuYwlGaG0YmrKsLbqiNYSNWxetWltgTtTARW7sLtsKNRlvaOAX?=
 =?us-ascii?Q?h6X/6OieOS98nAi4QCOfexAe+fm+B8Py94Gojo3KxcMbR6272dzp0KKRbDDF?=
 =?us-ascii?Q?MuHzRmlP56sA401lbPoX2MLlhmAAS2Vjh8wJn5mJlCzmtZTQEBlwcmk38OzT?=
 =?us-ascii?Q?6GjMnv0+qA6N/8dpgaAmwckSizkC8jLhfJd74qN6TO8Hv1k0sJWM0Qb0Bkpl?=
 =?us-ascii?Q?r8HNARVrji4Ftp+zCX66+txlsMwamsTf/ueD+S1qfVPw7c5ppyiu/9J7i863?=
 =?us-ascii?Q?oWV6VAPmcn856h2fC6e0u97ZYN4gLuMLIB2ssMbRlAiSHu9XM+6zcjYQHtUL?=
 =?us-ascii?Q?n6WcqnawiCV6GnB453z0YwdBBCupC+Nwcztw5NHdKtfesx/jcrQhYk8ay38g?=
 =?us-ascii?Q?P2RDofa8lFMFpTvGlmhHZXupG2oqtUkRn8Irgoe/vx1ZK/zjt/fA9bZ3Knnm?=
 =?us-ascii?Q?TeE7fJQyjZ8SI72wo0uAEiWydiD2u06SJZo+wyeJCUi3VA1U25dxDsR7Oc7Z?=
 =?us-ascii?Q?OgjuDrLZ+bsqFZqu6Vi239CU9mOn6wbC7/Iw2dhmlYni/SWUP1zi5qmi0GAl?=
 =?us-ascii?Q?WIi8aNXpeXHd2MZWBZmjqyk8WMvFz1jpzdcRp4QyusOTEVlt/wLICBDrYnQ+?=
 =?us-ascii?Q?cMFCqyH+qQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2da57846-b251-45db-4f06-08de73f79ab7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:54:02.4123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3AO3VF/Siwc9/0UmtmBQ3US4c3TB5mFruDNIasHs5uVaXJOWmSF+urnAvUH/F2pZST2oIHhkwzNUjqDGX66kRw==
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
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
	NEURAL_HAM(-0.00)[-0.956];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 83DFC18DD7E
X-Rspamd-Action: no action

Add BAR1_SIZE constant and Bar1 type alias for the 256MB BAR1 aperture.
These are prerequisites for BAR1 memory access functionality.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 5a4cc047bcfc..f30ffa45cf13 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -13,7 +13,10 @@
         Vendor, //
     },
     prelude::*,
-    sizes::SZ_16M,
+    sizes::{
+        SZ_16M,
+        SZ_256M, //
+    },
     sync::Arc, //
 };
 
@@ -28,6 +31,7 @@ pub(crate) struct NovaCore {
 }
 
 const BAR0_SIZE: usize = SZ_16M;
+pub(crate) const BAR1_SIZE: usize = SZ_256M;
 
 // For now we only support Ampere which can use up to 47-bit DMA addresses.
 //
@@ -38,6 +42,8 @@ pub(crate) struct NovaCore {
 const GPU_DMA_BITS: u32 = 47;
 
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
+#[expect(dead_code)]
+pub(crate) type Bar1 = pci::Bar<BAR1_SIZE>;
 
 kernel::pci_device_table!(
     PCI_TABLE,
-- 
2.34.1

