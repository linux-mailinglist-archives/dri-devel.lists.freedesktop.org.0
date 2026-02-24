Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0D14KQ0snmmkTwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5513018DC8E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182F110E66A;
	Tue, 24 Feb 2026 22:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tG0MN+QT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010002.outbound.protection.outlook.com
 [52.101.193.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 616DF10E665;
 Tue, 24 Feb 2026 22:53:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WD2O+/UTUJzql2Ce56wmnwc5zE3hX9oecKrmqOkVFrENbsi64Y79WKeaUE5OAuKB0n+U3oL5VsZchgWN8+nAaDkpY6xEODkK3M7nouqaxTY7F8kkh53MRAK+DmspCw15YS0UgpCt2U44IVzg7XmOrPURmecOGbrR94bgyyaT+ymll3k2E62D0z2j7Llrhrk9fyAp8ZztrSxXxHKBlvWO9KuWxU6ff5Gq+gIeaa2A4jSUckIcEF3cK9J33JS+CX54uoPxBnNul3ESni6PTH29KF8oxJO0CECHEY6+VPDCW20h7rKwB3bPe+Hqwn2oG/GDW3wTNynaEwNhKUt5yCz8bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rv2O5IFUWnJS0FMgeuRik4bdtWoi9KSDBpZammhvhB8=;
 b=DMcjNnNydxAWkgdmv/ie/hPzzkbRrIbC5F3w3PB60SSOXt5a6SrDFarkccPMwAVjwXrvGCQBRyGHm0cdD4GgdlrMKvSqjzK83CfAY8dlD8X/8J9yH4+Bc+EztVARbRATvUvdjKNgtHG0fEscoYAJWG8dZcyk5M0rtj1no6YlrHM7TMqKa48bCGCbCxYeniop8dYq6uvQ0K9tL6wSOtxXUcDFbTwTGF/BKcqrC7jt0K0zWHfOGKBzEfJiZozSwOdKjNoIsUV0JUC0SFl12hCGZKlj+xZBhThw/ep+chr6jVBcdQ4CzCmtF3OW5Thu+sQxqjG+me2v+k+rPKwT/kEymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rv2O5IFUWnJS0FMgeuRik4bdtWoi9KSDBpZammhvhB8=;
 b=tG0MN+QTG2hPjggHeAvXuR4ktvmG0a8X1DxzrA+1pEkYrdVEesI3cVH1vm5ygiQvSI33mPLnxFwOeKUDrtjEY2CRsJ79PZmF+kVIC1pYV5zndGiCE5oKQKe3Ys3ENm4gYwgirMTgbYMXnWwhdFYysZMQs4Vt8NgJV2FqooWLi2673bsxBEHCT9tiPletSuvGwE+/k3uS/hz6bkB7YuAxoTZ1/HxlMGPcLa3cycuDzIfy81W1AMnuJk4wNyfhLKNSwWCwQvsZNbmehvRcLHsHoGcEt3Pkch6b47oahpxqontZWa4ds079okAJhMyLJYIdevWpk8GjAVgiF6lD0w5Wfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:51 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:51 +0000
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
Subject: [PATCH v8 12/25] gpu: nova-core: mm: Add common types for all page
 table formats
Date: Tue, 24 Feb 2026 17:53:10 -0500
Message-Id: <20260224225323.3312204-13-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P221CA0001.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::7) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f8cafd-ce83-4cfb-59f3-08de73f7944d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dz6xIyj4HqGKPwQwQt9xdyA77afimb5/YYmzIsyoXni9EbBimddz6OZsUY1h?=
 =?us-ascii?Q?rl9gwN4mPkZzMpKOky8mOelZnN1Bt6uIJIJRTIZ34qEEZROYNP265Lwwuv7P?=
 =?us-ascii?Q?BJDBHIa1Zqz7mP97RIDd1/7K2OCVaODfHCp5L/vj0xuZgP5dF7mNrLmlQ/iW?=
 =?us-ascii?Q?/fi/iFH7s01/nq/oCo45DGaFplMhtp5MzL1KhoaxLlEADTm2VgjNNKxU1YAj?=
 =?us-ascii?Q?GQ2AjeB+fpyWjFtfW1luSnJ/EX9hSqsG9P0uVPXdPVz/+iBMmvq+ewYd2emf?=
 =?us-ascii?Q?y6o6I45WjY/jFfWL8pvyJSbjuMNbvtqq92xk8hi46qreJyS8z4PfTZJrVkuf?=
 =?us-ascii?Q?8Gn058nhlbvCrlpYOyfcnShFs6omw6x0N+mgK3V8tlaxpa9DQQQPfCc7fC5I?=
 =?us-ascii?Q?EX16GTU13uJgByxNwl8VyKp12wNHv1eUczd4Pj/oNmX05TkFH3kjqRp/Hstn?=
 =?us-ascii?Q?X+T38jRiv+pk+mmEckQYqHcuIWgEUqZxzaOgavCtNc9ILm8sDIMvKOwkyOht?=
 =?us-ascii?Q?boEJ+pd9aeR4LHiRk2epawpOD4geW5pqSzV3hHMCif7LLFGBZA1OIabZXcno?=
 =?us-ascii?Q?Uxt2+FyDtLQydBlQe3xEMAPrwf2ia5DXZD6KbrZNJvkwsY2Mow/N9+QQQfFs?=
 =?us-ascii?Q?dok/spu5NbfGsck76A0hingd0mO9nUBDs5KzY7dqBJdx3WNuSj1UKn1qtaFz?=
 =?us-ascii?Q?AyngSF0Or3G3XpjOvv8SwM5csztB2Ved46f6TyRxltqIar8uZClWtd30co7Z?=
 =?us-ascii?Q?4UH9ITMxMEKI8elStLBQFRHhYgz/skFOtqKoruzhxJDVGwBDud5UPV+LoO3X?=
 =?us-ascii?Q?miaGNsy/dXP2euoJJKgtS6ydGI1yR7tC3Wfq9N8QX0ydhxtSIr2TuvYvEcQT?=
 =?us-ascii?Q?4YGIKJqtq/wTjC/zNb7eMDxts2PBR/gUBMd+EhF7zL8JCfRFxpMjDzQJY/aR?=
 =?us-ascii?Q?jFGEYQJddpPsoGZW2uG9IqA2nV9AIXIkO5+MOpjbaq+/2IDqaNv6C6NcIaP6?=
 =?us-ascii?Q?3b83fH90xyJNudK/A0j3fY2qbQmnKeV7lMdC22QaMWg7Blf5Sukwoy6OCS+g?=
 =?us-ascii?Q?DGE1pQbum1x6/2KpCggqfQI2n9YCjP+sVe5Ka3GBYVelrVXBlqFvjnsIBXql?=
 =?us-ascii?Q?/UjcZo1+smwcwBksVY3iu0SgBmSWLOlgkgvCxDbAQkNmuxXLzM/4Kd/j3keJ?=
 =?us-ascii?Q?J38yL3ygH6eQjzv3pOvrEdlOGntVe+lddCwNrVqKbmXElnZMhew22MHZ0nlw?=
 =?us-ascii?Q?G/1Kyzb2O38W8YRS9+y9wD692JMvFO+oFfU3nrEXg++Ypak5DTEgSbIY7koI?=
 =?us-ascii?Q?VYyPUE5WquEPluQqmSLZnfyOvT9mlW2I+yFbUxZj2bj7FpkcWiFNZ51fWw+v?=
 =?us-ascii?Q?RSolUPZRmxow+5DbBboxo1gW0a25GZLiqBTpH+RW3bpI5RxiopTDFeMKzGYB?=
 =?us-ascii?Q?YLoYVENOCmdE5eucgJcRxM7L6VOMpp9ZyTLX7PANLFvDjf2E+LtqCE3lk2du?=
 =?us-ascii?Q?kAzvabpx5olt6Med4w1tU1+82FfnxYHUyQK37Tf6fQsuFbuwCLDhTR8M3pAL?=
 =?us-ascii?Q?V+LjXuO5y3SK+zjKIGo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uNs5ucwtsn+8Fuy4oXG9NbdSpZW25oa5JK0mXI7PtJo2yvG1GYVA2V5c9fFQ?=
 =?us-ascii?Q?ijcbrrNBv3k7OW+oWccbPtKrlNQnJDH6czNpBOgvOj7xA/HYIPpzbJB5Nexh?=
 =?us-ascii?Q?WlD04NgOpYP4W/bq5fbLjRNMdS8Q3Yyc3izeONiP2EoEeP83xTlsrHaALLG4?=
 =?us-ascii?Q?/+62LWkJp0HEoyuTGQKOF22m43CJbdU4pgp7Zv/Xt36Jf1l1h77szv6DYIYj?=
 =?us-ascii?Q?CqsISn6zXI+l/PaKIz7ThL0Mds7aqjnY6WlLcFZ3TFQ5sWv9dElm9iGL5X1e?=
 =?us-ascii?Q?PvqAMsjNBi6Am4gPVWyadw1HhoEDFU+uRdC5ddUP/XHvmkwunqQn2mQmnS8Q?=
 =?us-ascii?Q?+zSAp19FKtv7AQm9yxHsoJAKGD1MA6/z9pE7QZsQ305QXMix15MdviHIZnX0?=
 =?us-ascii?Q?vKVBho7LQPLn2RUtzWnLGr+NO/tke49UAx5vEasfoa1Q3CQpx58R1JD0Jy5J?=
 =?us-ascii?Q?4Ay90n4+XsdIDCIKwGvCvAGIB9eY3EWvDFxlOG7i0ZgWINeQCJ4LAf9fWMvk?=
 =?us-ascii?Q?NFsSkwzuOXgqAMKQPaZaFGTx+wPsy6sBrCt8N4IeT7JdgO4IT7tVm4zTsagk?=
 =?us-ascii?Q?TSIyIXC/voVsWxv43sPIR70YMaHSPpZizC6IIMNToanngeTV5NPWEQzNSAkM?=
 =?us-ascii?Q?7dhGHeprggaD4vhiukcUXGpORVp5c5bPJwUd5UemPz4Csk9MT132XW3mrcwB?=
 =?us-ascii?Q?lWBPASBH64syRv9ltC7Z5sBv+KMQiPYH7zQvZpRqlTzvesjWWxtoPoQQe03l?=
 =?us-ascii?Q?p5nVdH8HLV4R4Erip1ljdWcuZd2lfrX9fRe4afMPGe+CpNrVYsA5e2UY/KHk?=
 =?us-ascii?Q?aAadeLMcC7pobJNBpjbW4H0lt28OiAGm366LpOF0c/7D7KC4TX5AxTrIyasF?=
 =?us-ascii?Q?iq4GaK5xEUKH4FxfSqZneldWEI0VH7Vrx1lYJdHH1ZNuUZH9H9ZNKm3jyAx6?=
 =?us-ascii?Q?mHkE6+PfZbDud1lOeR155NLGxz9zsxbdLYltlWvp89737yecbpYeRT4yskL5?=
 =?us-ascii?Q?Bk7CJNCdyTbzHEnMTflb/1Z2rjHTL76UpNGTtXjcbnk0UpJgYBfCl9oYsimv?=
 =?us-ascii?Q?QMu67+48gJMklNUPW7d9EywdqfFEWtNn/lrKdGaQj98OAib1Qj8RZM+ghvIU?=
 =?us-ascii?Q?TBcZketlmkS8C1Ez/AF5DPxszji0EOk8OmMHtDkq2Eq5bsEqQAmanfdxC3ez?=
 =?us-ascii?Q?SQ4y/SUQuWjAuEqrnQpoZxL/ozKuwk9FZHgoCZXYbxbOvFLTamsgIHPiZMA1?=
 =?us-ascii?Q?GDe9rHy0lZtKj/Q5RE+rhJxQ5HCciv4Rz/My6D7bKQiPfNSFj0UFWs0pm56h?=
 =?us-ascii?Q?LvPNIvcOIWV2+2Z6K/OZou6G7kXQSKa+w3Cr/NKchSN5p5QTDTuifHms8sVD?=
 =?us-ascii?Q?jRuywNhHX96Nt2BOxJs5UWZMcQ3mtP2TRUKVvH2MLDP9phSNZPN7HPKGKtzT?=
 =?us-ascii?Q?ZmxvPQZpz9TBThMpa0OPQVWi1TLUIofV2OYKvqFeJyiLngWWktC2/CKD/tJi?=
 =?us-ascii?Q?CWgCeKRnindVAXiT4GXYYsDJ97xNy86JY09bekx4R4V6rl5VwwWfPcJGfayJ?=
 =?us-ascii?Q?VSdV11hTdTUmwPyfj0AvmUn5+5YgM01Ty7tSckn16LtDIFZW7JLRQkj8wMye?=
 =?us-ascii?Q?/pygL0fi+AlR9rbaE5pHvjzHEB266/OWtlBS37heyOVEyQ/SHWlQXYWsJ0D6?=
 =?us-ascii?Q?VPpiD98He9iCFnl6m2zc70WUhrwogTYnRkqdyr1lmnmNbh8QNNQoFjST74Nv?=
 =?us-ascii?Q?fwOVAHw0BQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f8cafd-ce83-4cfb-59f3-08de73f7944d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:51.6674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRTtShDl0WRb7POIeIYl4CsUDmbUk1k5lhtFaqY18LMOXrnWFNgaRKVrX0jzmHl0S5/cTNHi9THllJZ42gvBwA==
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
X-Rspamd-Queue-Id: 5513018DC8E
X-Rspamd-Action: no action

Add common page table types shared between MMU v2 and v3. These types
are hardware-agnostic and used by both MMU versions.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm.rs           |   1 +
 drivers/gpu/nova-core/mm/pagetable.rs | 149 ++++++++++++++++++++++++++
 2 files changed, 150 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/pagetable.rs

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index a3c84738bac0..7a76af313d53 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -4,6 +4,7 @@
 
 #![expect(dead_code)]
 
+pub(crate) mod pagetable;
 pub(crate) mod pramin;
 pub(crate) mod tlb;
 
diff --git a/drivers/gpu/nova-core/mm/pagetable.rs b/drivers/gpu/nova-core/mm/pagetable.rs
new file mode 100644
index 000000000000..aea06e5da4ff
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pagetable.rs
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Common page table types shared between MMU v2 and v3.
+//!
+//! This module provides foundational types used by both MMU versions:
+//! - Page table level hierarchy
+//! - Memory aperture types for PDEs and PTEs
+
+#![expect(dead_code)]
+
+use crate::gpu::Architecture;
+
+/// MMU version enumeration.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum MmuVersion {
+    /// MMU v2 for Turing/Ampere/Ada.
+    V2,
+    /// MMU v3 for Hopper and later.
+    V3,
+}
+
+impl From<Architecture> for MmuVersion {
+    fn from(arch: Architecture) -> Self {
+        match arch {
+            Architecture::Turing | Architecture::Ampere | Architecture::Ada => Self::V2,
+            // In the future, uncomment:
+            // _ => Self::V3,
+        }
+    }
+}
+
+/// Page Table Level hierarchy for MMU v2/v3.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+pub(crate) enum PageTableLevel {
+    /// Level 0 - Page Directory Base (root).
+    Pdb,
+    /// Level 1 - Intermediate page directory.
+    L1,
+    /// Level 2 - Intermediate page directory.
+    L2,
+    /// Level 3 - Intermediate page directory or dual PDE (version-dependent).
+    L3,
+    /// Level 4 - PTE level for v2, intermediate page directory for v3.
+    L4,
+    /// Level 5 - PTE level used for MMU v3 only.
+    L5,
+}
+
+impl PageTableLevel {
+    /// Number of entries per page table (512 for 4KB pages).
+    pub(crate) const ENTRIES_PER_TABLE: usize = 512;
+
+    /// Get the next level in the hierarchy.
+    pub(crate) const fn next(&self) -> Option<PageTableLevel> {
+        match self {
+            Self::Pdb => Some(Self::L1),
+            Self::L1 => Some(Self::L2),
+            Self::L2 => Some(Self::L3),
+            Self::L3 => Some(Self::L4),
+            Self::L4 => Some(Self::L5),
+            Self::L5 => None,
+        }
+    }
+
+    /// Convert level to index.
+    pub(crate) const fn as_index(&self) -> u64 {
+        match self {
+            Self::Pdb => 0,
+            Self::L1 => 1,
+            Self::L2 => 2,
+            Self::L3 => 3,
+            Self::L4 => 4,
+            Self::L5 => 5,
+        }
+    }
+}
+
+/// Memory aperture for Page Table Entries (`PTE`s).
+///
+/// Determines which memory region the `PTE` points to.
+#[repr(u8)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) enum AperturePte {
+    /// Local video memory (VRAM).
+    #[default]
+    VideoMemory = 0,
+    /// Peer GPU's video memory.
+    PeerMemory = 1,
+    /// System memory with cache coherence.
+    SystemCoherent = 2,
+    /// System memory without cache coherence.
+    SystemNonCoherent = 3,
+}
+
+// TODO[FPRI]: Replace with `#[derive(FromPrimitive)]` when available.
+impl From<u8> for AperturePte {
+    fn from(val: u8) -> Self {
+        match val {
+            0 => Self::VideoMemory,
+            1 => Self::PeerMemory,
+            2 => Self::SystemCoherent,
+            3 => Self::SystemNonCoherent,
+            _ => Self::VideoMemory,
+        }
+    }
+}
+
+// TODO[FPRI]: Replace with `#[derive(ToPrimitive)]` when available.
+impl From<AperturePte> for u8 {
+    fn from(val: AperturePte) -> Self {
+        val as u8
+    }
+}
+
+/// Memory aperture for Page Directory Entries (`PDE`s).
+///
+/// Note: For `PDE`s, `Invalid` (0) means the entry is not valid.
+#[repr(u8)]
+#[derive(Debug, Clone, Copy, PartialEq, Eq, Default)]
+pub(crate) enum AperturePde {
+    /// Invalid/unused entry.
+    #[default]
+    Invalid = 0,
+    /// Page table is in video memory.
+    VideoMemory = 1,
+    /// Page table is in system memory with coherence.
+    SystemCoherent = 2,
+    /// Page table is in system memory without coherence.
+    SystemNonCoherent = 3,
+}
+
+// TODO[FPRI]: Replace with `#[derive(FromPrimitive)]` when available.
+impl From<u8> for AperturePde {
+    fn from(val: u8) -> Self {
+        match val {
+            1 => Self::VideoMemory,
+            2 => Self::SystemCoherent,
+            3 => Self::SystemNonCoherent,
+            _ => Self::Invalid,
+        }
+    }
+}
+
+// TODO[FPRI]: Replace with `#[derive(ToPrimitive)]` when available.
+impl From<AperturePde> for u8 {
+    fn from(val: AperturePde) -> Self {
+        val as u8
+    }
+}
-- 
2.34.1

