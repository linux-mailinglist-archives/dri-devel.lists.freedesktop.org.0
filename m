Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB5lODjpb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9613B4BA56
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242B810E6AD;
	Tue, 20 Jan 2026 20:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="toT30Znn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010055.outbound.protection.outlook.com [52.101.46.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D06E10E66E;
 Tue, 20 Jan 2026 20:44:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPgfZAc3czQKem7FCM4cSd9BGeBbyunqHawbI0zt/J9DOwMJHKh8bpkPQqZHqoJsuqjTk//0dCJKbLRbEUdXXJDnTduvMyVvzr/PaoRwr2/uGIt0lKB3HbQpADgQS40wUM/dcbZcMgMGTCBGZp8SWAKeGZOIN/qTeyvPXXiu4QNty7pqR4N5FtAOqJUcXxxIImzA7etQ9B/SEbQK7rFf+IaEJN+51LO3SsbeY2tbef5HsutUAJ1ILhc+JK/Pw4RMS6cpEDC0wfEWxmEngay6pwTubDvU5UrjCytHBero8ZK5LNawyfpHLd5MCEkhLHQ2hj3VzPBrUmmwQkoCtTWBBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6Fym6IOxLH1oGvPyGRIWX/L4NxJ8hy/yyw44QYQMrk=;
 b=mkAzFFKGdwkxt3hmBS3Vh5C4OWP3LHWDsEfKzztarvi647/Il0WRWORcjyZdF97tAYux7q00g9+jjkXuLPAfMMMN3OCIWsrxgoi8J2rjBRTlFY7TsjAg81To4IKxEpLTZLK2+m8zx5MItTc7SoHlYtyRpVJ6l7xDwFduOH3lxY6Q87AfrnDKWWhA3+7+I8oqLsm1T6nUqXR+2VKt3ACjB7x1YknwF9LBNvpOtnw2/OgsC3aXk4hrJ6yzOZ8JhOI9Aey75F4wZeOVrRXJpyNXOTYyoueGUOaBvMCflUenYcJV7q0NvP+q/zMWDl6sxOcu/k1TfS33ICeGkaO0keujFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6Fym6IOxLH1oGvPyGRIWX/L4NxJ8hy/yyw44QYQMrk=;
 b=toT30Znn/Re0xdwSCrHUFnM373jquqmzFhlWUmBBHNpn5Jrz8ce39+/HfrlF03g5ESI0c/QODiqBZ6APX/qnlQXx38g11DgT1FH0vwsWI4WlAlhSmQtq8vsP2kE4LsZl/tVmES94zv9zsOUrhJJ02JS8BlLEqYTdOWdZwbnqV8G3UvR3TIZZxlCICC+1I9ypJ2AEW1tNWs194BgefLfpNl888h7XL5uIiuwjAoDe2BeX4ErynnXgBmbTqC4pDQJPKcsYFSU0g8y4MEh2BqKtvw2SvXqZduBV8+iji9Q40OnonuwNorCWO6CdNUWgTTybrSECJvjbBMszUyeLhjmRag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.13; Tue, 20 Jan 2026 20:44:25 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:24 +0000
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
Subject: [PATCH RFC v6 20/26] nova-core: gsp: Return GspStaticInfo and
 FbLayout from boot()
Date: Tue, 20 Jan 2026 15:42:57 -0500
Message-Id: <20260120204303.3229303-21-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0024.namprd05.prod.outlook.com
 (2603:10b6:208:36e::20) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY1PR12MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: 59890a79-e509-448d-11e3-08de5864b262
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VOBJ69LBQQbwbDf/iom5qc11vHrWGDJ063aEmgdIT0xWKAlpqxT2vuh0gDCZ?=
 =?us-ascii?Q?IflDYYucYmVdYaxaXMz8D4N55Jm2Coqc6/3N8S1C4AEe6mIJsiZwxwtAdenc?=
 =?us-ascii?Q?zrsKhfzCbRduuXA3axmj4bZ7G8pcrvcQM2tBdrYu5pDK9y9U1NtnbKT3jwPf?=
 =?us-ascii?Q?LTjw0dwk4Mi2M1t4pPEdnrv6eAR2KmYiObkig8uZqSlR1uPY1Dg1rdC5KtNp?=
 =?us-ascii?Q?9snN0vDLSdAv0HtCtD1tsHKtN95j0voZOtCIXpmkrdmoxXwl0Y7HT23OjgnI?=
 =?us-ascii?Q?c3HM8MXfHKpHgrwfKdgyc8r04Zt/AbGDWv8gWPR+OPDu0KOT4vEWlq5jB83J?=
 =?us-ascii?Q?vXhCiBxCtAH7w7xvMHTWIsOWRnj5vGm+MChVpF6yrE+I6ThtaytmR1hJDXbT?=
 =?us-ascii?Q?TuoFcRRiXfB6dqENihDPQldbfHALh+E189gnbN3yQn/HEZMN2JanTO8mwV7X?=
 =?us-ascii?Q?QHD48BAzx2niSJpFhEWLDJX6p1bLHhLoV03X1Kz+mU99H/dTa9zxGQIOl/O/?=
 =?us-ascii?Q?AOtgCwNlZWvPl37zIeE41iyP9YBnp9L/zIAxk6wQ1Hpgk2tVJ4guvfmIGS3/?=
 =?us-ascii?Q?lJcN4HHZEHEB9BE9fWCfyPDFtty8z3uPRzOYh8uJiagToZ9hAoMf7aBjgeVN?=
 =?us-ascii?Q?gHt02RarbTwmjtA98NY3v7SD4qUJqHxEFua9Zg8I5Lk0UYPsgKkWy1gbOdW6?=
 =?us-ascii?Q?n8W70DkF9+jQAQUCUR2Y5UES5FALuS6jtCLZN9pk1nIUf9aAH3kqbZTlb6B6?=
 =?us-ascii?Q?mH/2tEW88qMOrVLb0m6nYPrJJi0zpo5H4O3yFiefMcbyQlDY5SxRP0HFY8zI?=
 =?us-ascii?Q?8AXya9cZuqJOGBhRFuTTfwJisSGHJcK/avgN6Si/SUCm+0WkWpVZH6G+Xsst?=
 =?us-ascii?Q?SLtTcefvbVLOb1QOYKpLv2SQtviAzH1sraREMZToRvMNXasDY+jYwakbjwZn?=
 =?us-ascii?Q?W6SjyPw4Vv7sZpbIOg1iR2ZjLfROJAs5uZCVuNS9++0ZKeWHrk2pbZWzlSK4?=
 =?us-ascii?Q?xttq2wWJzi5w//CqE0wLkvyVnv+LKz9P0hN9tqqfOiciu8bpGxmoJJ7R+Tn/?=
 =?us-ascii?Q?dkoVCub6iB5mGsMS+9+phDzBLGQVZBvEdDVq4mNe41WX864WJP09IXuekeC/?=
 =?us-ascii?Q?1NFFTlA5whf9vjIAjMaBtPE+O1v5gtbAccI0CdDDzi+VIb8zqv1Ixb1DoePO?=
 =?us-ascii?Q?JrzflmpxJXFeYKExEy58nizCiJ4oWsFQcwzaNpHukIqONJH/aypcOwiQd+ay?=
 =?us-ascii?Q?Tdlr5cThtUvqDfR4k6A1Bye6TNoTbIUBLR3IYnoqXZ2zALdeXP4d7Qto5dzX?=
 =?us-ascii?Q?D0S/921wA45zaG/WifkkfBuAZqxF1ndLCob1HSNlBMWjFTdnpx064sISUFuJ?=
 =?us-ascii?Q?hdd7LXF+l/LkLGPnU4MtQrq6cMiwxJ9aANLO57xYjzoBfrm1+8T1HIj0YbPq?=
 =?us-ascii?Q?vaGj0zFcUOXKfWL6RMrQWkFEq1h/6iE93ggEHqKrtpXLUXsAKtMQzEvT4FK0?=
 =?us-ascii?Q?i2pRgP/z+kPaBEy9rEX+52UmNQU30JIYoYzBWh1tG36vC2S4rUK4N49KMDPg?=
 =?us-ascii?Q?ayqdMDLn2QJvQA7VJm8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OIxYE2WNAGHf/QxYeGvQGKTv11OgJFadCLtyy6gDy0iIlvp7XFh1ZPwVI0ZB?=
 =?us-ascii?Q?jCxbWBUG92+reBZeL88Nrjj3aqW5SGll0Dt4Nwvjb+RIYNk/PAYTnebOrhsO?=
 =?us-ascii?Q?80XyOtojXe0hhReWLXAX20JQWl+NzeUEMWerJQRT6KF6Heb+udzQ/j8EKVzX?=
 =?us-ascii?Q?7c4jFudY5bV4sndBieqsGjMcy4+KGQ8APcaZb/3lfNEqFNNVfQINqL6fozLE?=
 =?us-ascii?Q?6o2GwEFW4odn2adRtJMXULUy7V23wLOx1mPCWuaEZysWLJlvcB5oENOBYLHo?=
 =?us-ascii?Q?1XViv93t1rgvYmlvu/yYiQiQrs+mAcqlsNcQCVTVeY868tE41ipYuIz1lGpr?=
 =?us-ascii?Q?t05j0APXMKLzeUHYp4DGBUjlu2UprH5hrL/w895lBbD/zsnxXdm/uNMiYH2+?=
 =?us-ascii?Q?efoSaqQhgTScvO7aJFLnCEqaMKZQG6nMuaCpFXQmTVV/AMGKpZ/ux0wpElV1?=
 =?us-ascii?Q?sHGbTsSr7dIKyrC18onZON7PYEE5etxED72FqTjo2J18EH4lfTq6/B9B1MS9?=
 =?us-ascii?Q?9wbnajx5L8dJMet6bqrNa5Bn8ID74EBdoFVgZY12UgJocgLuLKKbG7OUVfX/?=
 =?us-ascii?Q?cgrQMhIldrDWLDmc62pnS4BtKdMa2L0r2DYJnT5K259ar0D2pqsEyqC0MP3G?=
 =?us-ascii?Q?Zrlrh1mHlvcJhvFLgrGA+c/5ym6a2z53hhtF6QmstjrQmkob2g9IJ/DewP+d?=
 =?us-ascii?Q?+W67cHiPjiF2wYM0uhvNEwj7+uhGxheblaiRTWoTCID0maMHWP13bcQV7EDb?=
 =?us-ascii?Q?q8DHX2rKet/dIDMUQTeCtCM+YoIfxjNrqtPWsKKtSq6u8LtGmj+2yY29TSIx?=
 =?us-ascii?Q?8ADh2NuVrxYFTlD80nM8DsxXugzwNZwA6oYSwAMQNyPpMBTnvZpjKcOHayZD?=
 =?us-ascii?Q?Mzrjd0lE7TdgowJEAcOOXww5OHW1bArhH9JHAthE8vk5uA7OUjnV8DJ+MM+Z?=
 =?us-ascii?Q?2qdTEKMh9Lbtim5JKLzw41zCPun1fYUfTB+h0QogC8Rev7p7Hcd0Knisn00N?=
 =?us-ascii?Q?7Cr8ZRBJbG4vz+6D2jXg1gGwwnuQaA6MwoDfkdhjAqVhW/nmGYg4UnIoWVsT?=
 =?us-ascii?Q?+RHtaqFeiASHFOULVGIliTG26bceiIDzEeDv6PBo3lJFNSexNIdHSz78MmOR?=
 =?us-ascii?Q?msfJiXkXF9v/fipDXk69S47rS2DtmWFTSxdLRSwqZVPG8yOfALbnT/T5kGzW?=
 =?us-ascii?Q?qZqYh4a0KGExD3cjAJq8p0y2TO1YC2DNhWw3+qRPHb6jme7B8aO7E8dQwSRv?=
 =?us-ascii?Q?swPqEf8cs2D16o/bLZxx4IV4nuTVjncfB8fd3vT9Uruc8B5RE8GGG0EZboYF?=
 =?us-ascii?Q?l/jPuJw/CYRU/vF/A7hgZNTrGSlA698xcgbjX4nsyp9v7GdD3ML8VEWmjnx4?=
 =?us-ascii?Q?HoYFEUUUuSWKkz4XUJ52eHy+wUY2L+qqCms9sT0MAp/yd8E25aMeC9JtXqi7?=
 =?us-ascii?Q?p1LBRZSP1BirKqGbHkvShaZgLDuU1ZjiJ133BITHl6xIAw9pnC/gY8NKI80i?=
 =?us-ascii?Q?HFbDVOXTKYUM7BEAEye7iJ3bbbmFpbAs+DwTP4VlGf9+J+jqI8geO3z1uEkW?=
 =?us-ascii?Q?4Xte7CvbOumZTtXfRPKMmlx/XfWJSI/R+W9ei75aquAuDO+Cgv2+YO1dwyn3?=
 =?us-ascii?Q?4KmKxgXJ5GkNCPXat9MPEblCyTJfvxdszNQ47aEGkhgUf1nJ8WFPMISdUipW?=
 =?us-ascii?Q?WOijNIiFJukT0lyvps7TQ120oU/65Xkqe6UE9QkRpva5Ol3rAmM9K7EcqXwC?=
 =?us-ascii?Q?UmAgkSPPcg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59890a79-e509-448d-11e3-08de5864b262
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:24.8029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ww+EmJl/fWsKzZdmDU1G1/iWD1GSViGcTM6wOzGUM6yNvPu0DflLw7zLhH3MM96+WnybY56T2CEaKWkoyG1bew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9651
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
X-Rspamd-Queue-Id: 9613B4BA56
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Refactor the GSP boot function to return the GspStaticInfo and FbLayout.

This enables access required for memory management initialization to:
- bar1_pde_base: BAR1 page directory base.
- bar2_pde_base: BAR2 page directory base.
- usable memory regions in vidmem.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs      |  9 +++++++--
 drivers/gpu/nova-core/gsp/boot.rs | 15 ++++++++++++---
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 572e6d4502bc..91ec7f7910e9 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -20,7 +20,10 @@
     },
     fb::SysmemFlush,
     gfw,
-    gsp::Gsp,
+    gsp::{
+        commands::GetGspStaticInfoReply,
+        Gsp, //
+    },
     mm::GpuMm,
     regs,
 };
@@ -257,6 +260,8 @@ pub(crate) struct Gpu {
     /// GSP runtime data. Temporarily an empty placeholder.
     #[pin]
     gsp: Gsp,
+    /// Static GPU information from GSP.
+    gsp_static_info: GetGspStaticInfoReply,
 }
 
 impl Gpu {
@@ -297,7 +302,7 @@ pub(crate) fn new<'a>(
 
             gsp <- Gsp::new(pdev),
 
-            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
+            gsp_static_info: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?.0 },
 
             bar: devres_bar,
         })
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 581b412554dc..75f949bc4864 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -32,7 +32,10 @@
     },
     gpu::Chipset,
     gsp::{
-        commands,
+        commands::{
+            self,
+            GetGspStaticInfoReply, //
+        },
         sequencer::{
             GspSequencer,
             GspSequencerParams, //
@@ -127,6 +130,12 @@ fn run_fwsec_frts(
     /// structures that the GSP will use at runtime.
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
+    ///
+    /// Returns a tuple containing:
+    /// - [`GetGspStaticInfoReply`]: Static GPU information from GSP, including the BAR1 page
+    ///   directory base address needed for memory management.
+    /// - [`FbLayout`]: Frame buffer layout computed during boot, containing memory regions
+    ///   required for [`GpuMm`] initialization.
     pub(crate) fn boot(
         mut self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
@@ -134,7 +143,7 @@ pub(crate) fn boot(
         chipset: Chipset,
         gsp_falcon: &Falcon<Gsp>,
         sec2_falcon: &Falcon<Sec2>,
-    ) -> Result {
+    ) -> Result<(GetGspStaticInfoReply, FbLayout)> {
         let dev = pdev.as_ref();
 
         let bios = Vbios::new(dev, bar)?;
@@ -243,6 +252,6 @@ pub(crate) fn boot(
             Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
         }
 
-        Ok(())
+        Ok((info, fb_layout))
     }
 }
-- 
2.34.1

