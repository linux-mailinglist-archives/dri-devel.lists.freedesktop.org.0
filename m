Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCcUNB8snmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8303418DD77
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E5110E6D5;
	Tue, 24 Feb 2026 22:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JqzD3T2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B2110E676;
 Tue, 24 Feb 2026 22:54:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W1ExxxsWQJFbjGB8uZn5QFN1lSrFY+iNBOoGz+7XPn6V6Hgfd5UQoOoVOj1MsRpGYSo35zXE0/uoAD3W0LbcvZT4ZTUurJmbqbK/oL4n0emPRzE1v2rx0MDlZTbNe7m+uP6gxrWqWXLP6+UwXfVeKrfmYPDiJCABDfGzgQQz841rHb+qywSV0aDAoxJV19DKAxBBVT2Ki+IdxHRwWClzmjBmyyio19MhgZWfjKaT1at+2fugelMQBTplN32ziERHyI72XmUuFGwG+aPtHcK3jz/dByRewFZUUr8vGIKovePQB8zlJZncKQtlRE/4PU+PpXvo9HWAK52r3rcUMmEq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjZlGVk0YUn8kEJoKw2b/0gO2H+7pm7reeSqNEgmikk=;
 b=FtoY2yHnPIKY2+vACNAKRVbEB36KCmViIhjTVwDKbIx6TC13KFlGIs7gFlKTN3QMP158DK8WGkFJLWSEqWvtXsEQLJXGHh1y99YY/gQMecOOhEeVTWK00M9x+exko9vTcvOUjHTw01+4YrJXGywKnr5zAD81jux94s1/Dbhceef8Z64Cg0qh4WTRxsKDh25x4PTbLRDIY2AtrDHVKyeZL+BkfZAMt1+MnSySvWMnNwUvDRwWY/9ueL4OkuEXiZaKIjFj71SHgsE/uYFU6hF/EToXY3lyrTA0WU3RCjKQCkMWwqayX9FsWayBiYcPXnjqBDXqwJqRWWbTZgmyh5WjEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjZlGVk0YUn8kEJoKw2b/0gO2H+7pm7reeSqNEgmikk=;
 b=JqzD3T2o4zD7ARWil0REMIAH17huB3GDU77IIPtd4u+AC/cDBKIE8HFtge6j8s2W84ELUaWrwzg0ULiK6Enk6saQeQj3Wn2LLgUaUn9uL1ewwttYbzw95ClTQDgfXMD6Ke8wQVEZYhbSq2tJjPBQamoJIJO3tJ7uauCL99fzQWqsgbDutEp/AUzSarDckVsndYWO2ljp83TaqWZE1XoyZAMyEU/my77NIjBwKmW4T3PurLrUmHs/02+Fm84LwYHCAwG4vB+KcLaKLim69xeEdKIJnRXbpI9ydrsTkHhad8vXgnHqrGHajLUG7RJcaihW3bBb5F5++gLUpj06RCSpIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:54:00 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:54:00 +0000
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
Subject: [PATCH v8 16/25] gpu: nova-core: mm: Add page table walker for MMU
 v2/v3
Date: Tue, 24 Feb 2026 17:53:14 -0500
Message-Id: <20260224225323.3312204-17-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0003.prod.exchangelabs.com (2603:10b6:208:71::16)
 To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 5048f266-ea32-4310-8c2a-08de73f797a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4FhG0r65jDIZ6XBWusmWJDgLGsqOF5b8S7Yogxz1ZdBp4DGkilpQSzl0xU7f?=
 =?us-ascii?Q?26VCmK8ElIYcwX8F+XncJuDHjrAwZoSV99dyIjTrcO+GxQr5GUHFIL6BtFjV?=
 =?us-ascii?Q?8c/c4nr4zziOuRafmX9lRpio59Qd1M/jwsRFm01mlmCTa4E+QQt76GV6rJom?=
 =?us-ascii?Q?JN6+SVX3VrCyVQc/esg3Tf5X/ZSSmXR0TOoPaMIuuHXqeFJcHJnI6sGFdHTl?=
 =?us-ascii?Q?AZRdLzbbwfWlxN6bv5m0kQJnFzHdfWo3dvdso/XFxoUs60YZK0DWnX5xm3+E?=
 =?us-ascii?Q?YA8VyvKZywgikj6UOYx1txPiHUNmd7OdqKcXoP83AFwBkJqM4l0SfvNzwNfV?=
 =?us-ascii?Q?c1jU/2oXTWE8jqP3jtHgneCOPJJung1JExs+GGqYan3qIAvvSKnFxorJ5plh?=
 =?us-ascii?Q?bgSb/ahdPrJ7y0cDJeqJUL6qP87nv8rzNTSq8mEHT9Ui0jj4Y5mkS90pCEtC?=
 =?us-ascii?Q?5A8ZEuGoe7VzJomnrtV//bqe6xm7fCL7ERRGG0OsXVY1T6hTjmgiCo2iAk3V?=
 =?us-ascii?Q?R7/OKgpSWzI0UvtQh3cE0QxKDMLqWcceRTxia3oKBR0gYFA7RCSk+cfMl0ol?=
 =?us-ascii?Q?HiFHB6TLKKP/XQ9KewAGja7zmPzLUEofZ7w+ES6BWh5zgP3hVLdiN/VzbZa/?=
 =?us-ascii?Q?MGmuWBGR+WcvCmKJDAr1gz1x4kypGeWkYglT0qA8EX8Y4uAkxp0Gh+gO13Je?=
 =?us-ascii?Q?GvEmuxEbVGSK3jDz8soCGr9EB01ZvS3a6JIjXfWwePKoxMhxMP1ExcTxTxCt?=
 =?us-ascii?Q?REELRLY9ON5H9yE+cI74L9ncnTJ+iuGv8D/F5oeOIbMIjsa65j05WP4NYfvg?=
 =?us-ascii?Q?PssK1VFiIIgzzHxznZc+gjgzjObHAHzroieMQPLGJpl/rPYrhLekchQeDYy5?=
 =?us-ascii?Q?b54IFSzdjUI1Bn7PjBls/AD0kJmldCCtUoZYXTKGobnpkrlK+nPalsWKBzy7?=
 =?us-ascii?Q?se1O5WSxcRKxB0Mn2lKmMrMY0unD5/G13L8Ej8vMxexN1CUp1tZRkXDfognU?=
 =?us-ascii?Q?tRKINKDzyEadDqvSOrccWkIHwjuPrFN+y7kekudC8ssIq23AEsgKs+YjY6wp?=
 =?us-ascii?Q?/0NZHkqcPgpMKxjSqMqssF2Um/I8hu0aaMvc2xIarSksjWbzFq8yzUlF2kRw?=
 =?us-ascii?Q?RovJP2T/azPTPwngrJLWFgj6xMadiD7fHbQP0Ln73Yhjml1QzQkJUNs0cpiA?=
 =?us-ascii?Q?njfAm3dvo22g6lukqCOREYidc5bh0g91YaoFndhD6LUoF0EEvwUsHMU/wQVq?=
 =?us-ascii?Q?CuJyH0T5PGKbYbThlt0XtaoZzw96K5GHXznz6QYoMNfd1VsO6F4zGaumwave?=
 =?us-ascii?Q?Z6n+6eJOxDNfWb5mxtRUT1cZa2EPR49GOVms1ZoIyBkYfwgtSBBJYBs5EMVx?=
 =?us-ascii?Q?MFuUi3G6MRX3zSgr9zm+ujwxPRNWRabwDO8FtsTGgD8MATxYbi3RtYpeK7GO?=
 =?us-ascii?Q?gQBhcLETafmNlfRBIopvSQjqWWMQTl5Jj2xsobiWT5QQB+wfIlAwALNjAJQM?=
 =?us-ascii?Q?xDBumTYFjyUjHWYVGXtBnyVeVxDZztVVsfJ/yOMs9Yw+l65Y5Iw7JerfDxrL?=
 =?us-ascii?Q?kp7qvY5Cb8mVoOvN8aE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?amqUJt+j7WJV7liVFFWdHkRnyomTisfEOIIlzQU9egxJWYO0nFaU59c4OZNT?=
 =?us-ascii?Q?BRGZmUHQKlOqbv4KJJPMge8ipGxhhdNgkkEnQSHgqFyoa263QoWVA3N8V8Wh?=
 =?us-ascii?Q?f27Z/v7GDL7Ttp0YM1XC1FXLaR4LO/L2jru6wxvapc09UGKwO5X8HdZ6V+56?=
 =?us-ascii?Q?CTp9eU42lAvNZFVjWhXeQKKu6PjaWul9YyaBZBkthpLc21el19zl9mUh2WMk?=
 =?us-ascii?Q?oQUT/5zYjlRIdEz26alwcD1uX26luUnxcPZubvxw7p+2wZPsCP8cqB2C/5kU?=
 =?us-ascii?Q?ap+RRky1ZxP76qUe3RFPQ7fTGcAmCFnbK1E4yhWkM7PFO4mv65hXlS/T19TY?=
 =?us-ascii?Q?8xQjFx9GRehqhx+w8aUJ2iV2Drj1tj4j/FC0DM2Cykf0K0dFA4ikvtAO2QsF?=
 =?us-ascii?Q?PPaATJ7yqNVEd857M8lf+7LjqYWhLKWAsoKKY/mB9YLNkjekLD6rRTNBmpEs?=
 =?us-ascii?Q?n23RFbKmW11F2jetPytrXx+FoqmR5kGQ8c5pjdzOBMYSuPzHPJTjqtO1oq7P?=
 =?us-ascii?Q?rFE22Z54BPUz0rQ4dend6j5zWS8vCyJGPOTJ9Tdwmp3FwSP0MoUhCgOaLCRQ?=
 =?us-ascii?Q?GbZ/eUMVAS/pQV5zGksKsPvwFGlIvpxEW/3UPvPqFbxNv1lA9GennpayMmHU?=
 =?us-ascii?Q?73AUKxF6flHMDROsLY6IyAhqmwHojhL0w8bKm5DGEb5ZHvCiiFBrVj0JvZp3?=
 =?us-ascii?Q?n0FGbeFP+FIQQ835v+rxX+QcUTHYFQ3MXvgfJKSrES++oBI6DbzsQ+ISjDke?=
 =?us-ascii?Q?ApEbX3hM6QMwh3bkd/EGb9RCwoZbcHLBN9IXInmBMWgSG4hIo7KUEPVA8Vsn?=
 =?us-ascii?Q?k0ywy2PRW83jF3Jj/5ODsRY3F/zHyj2Tkd6SiF7YY/FDKoJqsp4womrZUvYL?=
 =?us-ascii?Q?ahsDs3vD/08ptOWhR6MmKfAZsTR0h2s0bGq5sQ9Lw//p6IzikmV5U7/pKv1M?=
 =?us-ascii?Q?vtwEOCd/gOPf9ZE6tGdcZjGKV5Uv6QuB7W90ELXMyzSHEg3FvECCKCYUptQq?=
 =?us-ascii?Q?jGDsP8wNwVumQcybW8fkdoZJgAwET9WI22wqiMv3fVbRh4fk28iYQnTXNYHa?=
 =?us-ascii?Q?w4OrNm6gJaqeRT149z/bQA6pJ63gnocvL2db5p3OLAmVd6CSl6d9qEMUE/DG?=
 =?us-ascii?Q?rrgmlGjvILmT6RyMGo1T2LvYYmsT49LUYlctVG6nEF5rhVWPVZe0UZaSHGdS?=
 =?us-ascii?Q?9jTbqylCWcwoH6eaYjNDmWZ+MS8AxziWAr5dYXzUystbhccIN7K1H+C01TkO?=
 =?us-ascii?Q?vrE6Uo3z7GrrIO9mG3SBVVIBh9o4dhUZR4PqzHA/VjH8e7vwjLJVwtawht/m?=
 =?us-ascii?Q?CaicrRDz8w2Hf84S0O+vhV552/Nrrx2SMWmKArv5oTKOROzMVsPIP8epX1/G?=
 =?us-ascii?Q?bS6bVNIGGo6QmXtIDulAvYznRrpjOvPauqsi1Kr0pDNSS0ieiCPxwYzvoEXj?=
 =?us-ascii?Q?bn5HmKBJFI04u4SV0uhNr4/u13CSwprYOI/Un+9Of3eycFRc9Feice/3iyPd?=
 =?us-ascii?Q?SdyqMXjH15S+0Mon3eSTvN/LcQYkJXnCng+TkIBJ2LBdqvoYO+o38KQbVSuz?=
 =?us-ascii?Q?Tf0qhHmCm4NhQWTYxA3aBodgrWsMgTpX4DXrFPzYmBmuGbOXawF+THxp9De9?=
 =?us-ascii?Q?Qe7FgWU9PoscVgtiYDJPI1nZLRkGYr9Q2WQu55IRYIpV4Vpk14EvFrsNOOH/?=
 =?us-ascii?Q?9zCGrp5k53i8HiGM+VqxFu5bjkG/dbmQhG1cEBd5xCfVqQ6kQeOwZj6SYOyO?=
 =?us-ascii?Q?ET6diAq8Hg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5048f266-ea32-4310-8c2a-08de73f797a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:57.2775 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4HsFxylrD6fMnVY15cjoImRF40+cJHt6Zl69fmkuItJJYQLKjXCVFIzks+yvFPISwgbBPGkFlf8NkbiDe5row==
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
	NEURAL_HAM(-0.00)[-0.909];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8303418DD77
X-Rspamd-Action: no action

Add the page table walker implementation that traverses the page table
hierarchy for both MMU v2 (5-level) and MMU v3 (6-level) to resolve
virtual addresses to physical addresses or find PTE locations.

Currently only v2 has been tested (nova-core currently boots pre-hopper)
with some initial prepatory work done for v3.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable.rs      |   1 +
 drivers/gpu/nova-core/mm/pagetable/walk.rs | 218 +++++++++++++++++++++
 2 files changed, 219 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/walk.rs

diff --git a/drivers/gpu/nova-core/mm/pagetable.rs b/drivers/gpu/nova-core/mm/pagetable.rs
index 33acb7053fbe..7ebea4cb8437 100644
--- a/drivers/gpu/nova-core/mm/pagetable.rs
+++ b/drivers/gpu/nova-core/mm/pagetable.rs
@@ -9,6 +9,7 @@
 #![expect(dead_code)]
 pub(crate) mod ver2;
 pub(crate) mod ver3;
+pub(crate) mod walk;
 
 use kernel::prelude::*;
 
diff --git a/drivers/gpu/nova-core/mm/pagetable/walk.rs b/drivers/gpu/nova-core/mm/pagetable/walk.rs
new file mode 100644
index 000000000000..023226af8816
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pagetable/walk.rs
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Page table walker implementation for NVIDIA GPUs.
+//!
+//! This module provides page table walking functionality for MMU v2 and v3.
+//! The walker traverses the page table hierarchy to resolve virtual addresses
+//! to physical addresses or to find PTE locations.
+//!
+//! # Page Table Hierarchy
+//!
+//! ## MMU v2 (Turing/Ampere/Ada) - 5 levels
+//!
+//! ```text
+//!     +-------+     +-------+     +-------+     +---------+     +-------+
+//!     | PDB   |---->|  L1   |---->|  L2   |---->| L3 Dual |---->|  L4   |
+//!     | (L0)  |     |       |     |       |     | PDE     |     | (PTE) |
+//!     +-------+     +-------+     +-------+     +---------+     +-------+
+//!       64-bit        64-bit        64-bit        128-bit         64-bit
+//!        PDE           PDE           PDE        (big+small)        PTE
+//! ```
+//!
+//! ## MMU v3 (Hopper+) - 6 levels
+//!
+//! ```text
+//!     +-------+     +-------+     +-------+     +-------+     +---------+     +-------+
+//!     | PDB   |---->|  L1   |---->|  L2   |---->|  L3   |---->| L4 Dual |---->|  L5   |
+//!     | (L0)  |     |       |     |       |     |       |     | PDE     |     | (PTE) |
+//!     +-------+     +-------+     +-------+     +-------+     +---------+     +-------+
+//!       64-bit        64-bit        64-bit        64-bit        128-bit         64-bit
+//!        PDE           PDE           PDE           PDE        (big+small)        PTE
+//! ```
+//!
+//! # Result of a page table walk
+//!
+//! The walker returns a [`WalkResult`] indicating the outcome.
+
+use kernel::prelude::*;
+
+use super::{
+    DualPde,
+    MmuVersion,
+    PageTableLevel,
+    Pde,
+    Pte, //
+};
+use crate::{
+    mm::{
+        pramin,
+        GpuMm,
+        Pfn,
+        Vfn,
+        VirtualAddress,
+        VramAddress, //
+    },
+    num::{
+        IntoSafeCast, //
+    },
+};
+
+/// Result of walking to a PTE.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum WalkResult {
+    /// Intermediate page tables are missing (only returned in lookup mode).
+    PageTableMissing,
+    /// PTE exists but is invalid (page not mapped).
+    Unmapped { pte_addr: VramAddress },
+    /// PTE exists and is valid (page is mapped).
+    Mapped { pte_addr: VramAddress, pfn: Pfn },
+}
+
+/// Result of walking PDE levels only.
+///
+/// Returned by [`PtWalk::walk_pde_levels()`] to indicate whether all PDE levels
+/// resolved or a PDE is missing.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum WalkPdeResult {
+    /// All PDE levels resolved -- returns PTE page table address.
+    Complete {
+        /// VRAM address of the PTE-level page table.
+        pte_table: VramAddress,
+    },
+    /// A PDE is missing and no prepared page was provided by the closure.
+    Missing {
+        /// PDE slot address in the parent page table (where to install).
+        install_addr: VramAddress,
+        /// The page table level that is missing.
+        level: PageTableLevel,
+    },
+}
+
+/// Page table walker for NVIDIA GPUs.
+///
+/// Walks the page table hierarchy (5 levels for v2, 6 for v3) to find PTE
+/// locations or resolve virtual addresses.
+pub(crate) struct PtWalk {
+    pdb_addr: VramAddress,
+    mmu_version: MmuVersion,
+}
+
+impl PtWalk {
+    /// Calculate the VRAM address of an entry within a page table.
+    fn entry_addr(
+        table: VramAddress,
+        mmu_version: MmuVersion,
+        level: PageTableLevel,
+        index: u64,
+    ) -> VramAddress {
+        let entry_size: u64 = mmu_version.entry_size(level).into_safe_cast();
+        VramAddress::new(table.raw_u64() + index * entry_size)
+    }
+
+    /// Create a new page table walker.
+    pub(crate) fn new(pdb_addr: VramAddress, mmu_version: MmuVersion) -> Self {
+        Self {
+            pdb_addr,
+            mmu_version,
+        }
+    }
+
+    /// Walk PDE levels with closure-based resolution for missing PDEs.
+    ///
+    /// Traverses all PDE levels for the MMU version. At each level, reads the PDE.
+    /// If valid, extracts the child table address and continues. If missing, calls
+    /// `resolve_prepared(install_addr)` to resolve the missing PDE.
+    pub(crate) fn walk_pde_levels(
+        &self,
+        window: &mut pramin::PraminWindow<'_>,
+        vfn: Vfn,
+        resolve_prepared: impl Fn(VramAddress) -> Option<VramAddress>,
+    ) -> Result<WalkPdeResult> {
+        let va = VirtualAddress::from(vfn);
+        let mut cur_table = self.pdb_addr;
+
+        for &level in self.mmu_version.pde_levels() {
+            let idx = va.level_index(level.as_index());
+            let install_addr = Self::entry_addr(cur_table, self.mmu_version, level, idx);
+
+            if level == self.mmu_version.dual_pde_level() {
+                // 128-bit dual PDE with big+small page table pointers.
+                let dpde = DualPde::read(window, install_addr, self.mmu_version)?;
+                if dpde.has_small() {
+                    cur_table = dpde.small_vram_address();
+                    continue;
+                }
+            } else {
+                // Regular 64-bit PDE.
+                let pde = Pde::read(window, install_addr, self.mmu_version)?;
+                if pde.is_valid() {
+                    cur_table = pde.table_vram_address();
+                    continue;
+                }
+            }
+
+            // PDE missing in HW. Ask caller for resolution.
+            if let Some(prepared_addr) = resolve_prepared(install_addr) {
+                cur_table = prepared_addr;
+                continue;
+            }
+
+            return Ok(WalkPdeResult::Missing {
+                install_addr,
+                level,
+            });
+        }
+
+        Ok(WalkPdeResult::Complete {
+            pte_table: cur_table,
+        })
+    }
+
+    /// Walk to PTE for lookup only (no allocation).
+    ///
+    /// Returns [`WalkResult::PageTableMissing`] if intermediate tables don't exist.
+    pub(crate) fn walk_to_pte_lookup(&self, mm: &GpuMm, vfn: Vfn) -> Result<WalkResult> {
+        let mut window = mm.pramin().window()?;
+        self.walk_to_pte_lookup_with_window(&mut window, vfn)
+    }
+
+    /// Walk to PTE using a caller-provided PRAMIN window (lookup only).
+    ///
+    /// Uses [`PtWalk::walk_pde_levels()`] for the PDE traversal, then reads the PTE at
+    /// the leaf level. Useful when called for multiple VFNs with single PRAMIN window
+    /// acquisition. Used by [`Vmm::execute_map()`] and [`Vmm::unmap_pages()`].
+    pub(crate) fn walk_to_pte_lookup_with_window(
+        &self,
+        window: &mut pramin::PraminWindow<'_>,
+        vfn: Vfn,
+    ) -> Result<WalkResult> {
+        match self.walk_pde_levels(window, vfn, |_| None)? {
+            WalkPdeResult::Complete { pte_table } => {
+                Self::read_pte_at_level(window, vfn, pte_table, self.mmu_version)
+            }
+            WalkPdeResult::Missing { .. } => Ok(WalkResult::PageTableMissing),
+        }
+    }
+
+    /// Read the PTE at the PTE level given the PTE table address.
+    fn read_pte_at_level(
+        window: &mut pramin::PraminWindow<'_>,
+        vfn: Vfn,
+        pte_table: VramAddress,
+        mmu_version: MmuVersion,
+    ) -> Result<WalkResult> {
+        let va = VirtualAddress::from(vfn);
+        let pte_level = mmu_version.pte_level();
+        let pte_idx = va.level_index(pte_level.as_index());
+        let pte_addr = Self::entry_addr(pte_table, mmu_version, pte_level, pte_idx);
+        let pte = Pte::read(window, pte_addr, mmu_version)?;
+
+        if pte.is_valid() {
+            return Ok(WalkResult::Mapped {
+                pte_addr,
+                pfn: pte.frame_number(),
+            });
+        }
+        Ok(WalkResult::Unmapped { pte_addr })
+    }
+}
-- 
2.34.1

