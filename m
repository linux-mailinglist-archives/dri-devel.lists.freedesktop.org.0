Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LvAJR0snmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CB218DD62
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9444C10E6D6;
	Tue, 24 Feb 2026 22:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cYj1AvIe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CEFE10E68F;
 Tue, 24 Feb 2026 22:54:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VOL020/PtSQagBacsFY1hzUA+IItLquEFMV65Q451nnnOB6LSdgYPlbD3z7yCZdRAxSwhHEqXoyYBKQQLjr2UxflRS9a81eQYvb2ZkT/Aykwk6p01A/5wEkPKwmhB+2DBsag+KI0ldHfbdHtA/HAjoqYJFGbCXloLf1pUtYXXuUwzMDc8Oc5zN+KiD8ARmAnMHkgp5cqvbj4TfB2wOSCdRFYaBs37Eq25FvfSwCY9TKA40Au1iGakq24hgHaR5xAUXtGAoDVOqYELCzdbOTLgTgP3C7or3RrGjhU4h+m9LSJqWDAJ/hpo0Mo6TsX9DQ+06gWMxDRwSSU2y6CafcpLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+qUf2iboRMvazHpjdRBDOOgqdeDeqXtYy3LUB+lVVI=;
 b=mkh+we/XFAI4Et/2sY0h3mNDaIyGBk5f1xDq+14Ps/GrnxkHiCuFsL1Bx4c5cABmZAyZd+OYhJKsxKDKm1bsF0OA8XAimV5n1z7znQ248TqZi84GWboz5+UeDWsQbWKxyqgQk16wvJR3TEF47yxQtkDhA7Pwmiq2/ifbDjTJYF23CSE5HHjR4EjQ+5wCj21NOfEn7LU1xi9zIqumzUeOYkr8830mEjRukao/eM9mV9tn6PPBBD6Cc27SQ2cnf73S0T95EydTYuzzHUw9Lnk1h3rvMtEgIMF8zrk4HrHuVPiNIYP2Kkhw/qmqMQaXrPgnDWPNIw5EWWfOloJjc5BatA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+qUf2iboRMvazHpjdRBDOOgqdeDeqXtYy3LUB+lVVI=;
 b=cYj1AvIezbBpZAZ1eSa39TC7EtUAOv++j1hl7LcHOHOXHnvR/DsryM2/FngQR0PxreuHE5teCWbZsllX6VBvX3KPw6vyQTHM843AYAby30Pdo5hYCjZiSOINVcO9mqF+Z4gLR7+yPauZWVDesRQOD7JKq1zO2VBAbj4M76pFo3HfXNXVswnHHebB8otBsdSwi64i+yED+2D9lBPgoq3NdnxyVTXcRhivIAwOIUG+/YzlZyx7Wg7SLLT7SU4cVG5wL2oWjAD3XOWgXH6QpYoSvyB+ATzB8Ik3QWkkfX6uP7z/yIKFRVvsFVtnU7TKlODPnNYDryZFLplRcQ6RXO6Zig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:54:01 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:54:01 +0000
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
Subject: [PATCH v8 18/25] gpu: nova-core: mm: Add virtual address range
 tracking to VMM
Date: Tue, 24 Feb 2026 17:53:16 -0500
Message-Id: <20260224225323.3312204-19-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0007.prod.exchangelabs.com (2603:10b6:208:71::20)
 To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 9515fd78-d4d4-4507-0b3d-08de73f79923
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?igFpFTeOvjSgVx2/L/Cn45tFVjxCto6L9vk1Kt1LsTCPsUJzfoAl2ZXu6T9u?=
 =?us-ascii?Q?WCjf5ZoIngdYtvQmXYSCzYOK1QZiJ6jL7dRM7eFPTq87BqCBJxpK3QUFdfbp?=
 =?us-ascii?Q?hhg9VxLJRwcfjQbMngAFtr9j0A4Cdd+c2N90M6yXKbYWyx6ktg1lfcCzHN9a?=
 =?us-ascii?Q?yKVf909boD1IZoS/8RKPMcJN3ZMCTagW+OW5NFgN73xaBHHzKbspBWwXYouH?=
 =?us-ascii?Q?RgPoUevdw+n7d58YRGPmJNPJtLy38O8EiI5MUYmgwLJk4LkOdFkelqCfhMif?=
 =?us-ascii?Q?Tm7Lr81QasTA7uZ3Tl6LwcijaUNYBPyuFT2pyAa4EXqYvG08X+qtNaAA1ce7?=
 =?us-ascii?Q?NMkF/YFsnxEtqCwZEBBkf/oxQPog/OftRiKhmf+T6ovOx+FDzObUI4/owThj?=
 =?us-ascii?Q?tNPbSZdpYmRGlLTVYNdUR7BhAkwjPPn79o2pb5Wg9EJkPaQnkGOvHrxjaLVW?=
 =?us-ascii?Q?FxdbGwjdvl7YNXRVzr4RF1T2rSJkBzuN7KSNu7SxOatLKOfqQ1YlUjK60N6p?=
 =?us-ascii?Q?WIh1J2hMc60G1pX/8HedhfFfzEiSnjP1wIk2FxaAUnAQWgW+TrJFzn4E1Z8W?=
 =?us-ascii?Q?Z2uu0FoQ65i808kwkaq3NWFMGru6ARid+WppCK2qBbCQL0dlKk+EbQ1sg5m8?=
 =?us-ascii?Q?2KaktyMvb81/E5ijSIBTsnL2TOwnRTkqxyKoWa/8xCCqGDzmC89iyD4g1gwu?=
 =?us-ascii?Q?pZr9yga4HANnu/pDQnY/xGMOsr+IZClo21UsYoszzbjHSeR4nWkX6egP+r3F?=
 =?us-ascii?Q?2UfiNyON5PEwqBJ3cAlJRQ5lXTVpb1ocdSS6s7Ru03yPa1NFv5hzc3U4gJBL?=
 =?us-ascii?Q?FYN4F+GR2rihNMgW995d/GrDAdtlXC2gpQZS4fEE/8sE4moTjDtZKCpQkW78?=
 =?us-ascii?Q?HAqsuMeWwCDAW/SdXgdRqR7rgrIE2GQ7cnDRJQlfDM5W4Z31drwMGD7zO70G?=
 =?us-ascii?Q?t/0/Ufcz5/5gw+bXgxPO0sT0dP/WmHvmfDduxFbznzdulZonbv0L2oNOuUNb?=
 =?us-ascii?Q?8u67I/oscQOIRkEi49/dZguT1YpimZjzicyc8adhO+OQPfwzIEjzxzd4vDOS?=
 =?us-ascii?Q?7kxA5fwFumbcv6CE09CFzvTk0G39iGNsTJ00ExQwD0G2C3pyYPAblFEoCqSt?=
 =?us-ascii?Q?eKHd6n+vJXgKxuc8i2loaVRa1oqNOMoeLEDktPP4jwU4ij2+6jGGdb9YKykB?=
 =?us-ascii?Q?dORIz00TDJpPOHJaYXOVHfVsMWw1mkzcfEysZisAhY+gimLhLX4JxW3YOM4A?=
 =?us-ascii?Q?UePXPwrGv6V/1rPn4mSnuTWWQAAmCZFCJu1J1bbLPdrBq9O8VekG4SsxDce6?=
 =?us-ascii?Q?5hyTIROGbJxvvi+TjpDms+DkdZSi/toua20YDllpD8ROcaZTPMdPu4vB0Geg?=
 =?us-ascii?Q?TjzqSBGk8HRY2igMUwZn7ktSfHpM7BlRHIX2mQIwqX0i/RaCi3TtrEyGRgAU?=
 =?us-ascii?Q?tbagPZ3fbw2giKGG8wMlRD3dyDijuwLur66/hF5dRe9z8g5r8NmoA73jWKDL?=
 =?us-ascii?Q?bdc533h+seosbrxQcD5kcRMLkQiMjQK1QJV5cPv+PZtn15+vp/s3eelc9GuS?=
 =?us-ascii?Q?slHwrHJrElJJ7f9NEXk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ny9gxcdPOTDiK91gHDoyuSkVuLuxWWUD7tZzTeHqB8k+EdMqvAByrFLCUtPa?=
 =?us-ascii?Q?F9MHSIc7Ls5tgdOAEvP4gqHuIF+tm5hi2+NeQG/iD8uFI3BCVoJzkq13JZXj?=
 =?us-ascii?Q?dXGL8sVkJUxtce/OSCp36XrgeVKrhLOfAIOt59utc10XO3/lk/52CXc1Woar?=
 =?us-ascii?Q?1stF2rizSwynDJKiRc65y49GQMD/S+s6cLq/pityCiIgOAytZAqMYLXsQ7o4?=
 =?us-ascii?Q?YEHhcm0nRVGQ8HaDwbMld2r0EDpYjRviAm4a5n4FKc8SmMHIIJk1cxIM/APw?=
 =?us-ascii?Q?ONBo+TrnkFPoXP24CFsVpKMr2AZ7f2jv+254GNy5WMkGCwgzS9PgHHrmFZ/C?=
 =?us-ascii?Q?A5dB0qlE9CTJFyE1kZOGEeNCDlzyZ4DVwcYJm0YxWZAD8SqdvVaWjJe/vkgy?=
 =?us-ascii?Q?ck6CJsCmV2N5NjdYnuZsQtv9+9cKJX2jI0wWMPhiVKjYtN01bGtYuJkJjLLx?=
 =?us-ascii?Q?MiqMUbpKDYD9LlkJ0OGnCCW7O39/1Tj3TJwVL4vuB/TQSxKucWxnSczU32Z3?=
 =?us-ascii?Q?f3Wy8EL8RJLkAmvbzylk5Gp76LzxIz8TRAJxtRjfuGYI65ZlC2OeCVf2mWeK?=
 =?us-ascii?Q?QDqJhF5r/dwzN9Tp3KBjo+Kf5XiOpNUqKd5quBT/T/zWFINRxvISEZEgpdCa?=
 =?us-ascii?Q?j5aXEdEQBEdGwIqJXY9XyfvqkSI5D4BkqUVp00N0GhatjY34P7j5qZSugpi2?=
 =?us-ascii?Q?HfivPzypyPuj3IvdvvObzjNNrAHCf7nY48Q57IkgTGgCb1P4MhCfIlQhowHh?=
 =?us-ascii?Q?LanOXChpEB2dyvBfrnUtqhyU45LCjrrmHZ7gyWbuWvhZrClno3NHl4SmxYoT?=
 =?us-ascii?Q?DhknFg2OCt3pjqWfqxtlw96HbB9i0Q+aDvoKbJ1xozwQmgmg7mGEtcqDD7o9?=
 =?us-ascii?Q?Gv40pl6AB0bjLhBJVkxCAdFIgxVu3vrqDmX2A73fbS5bOyXFjAIA1MW8iP5r?=
 =?us-ascii?Q?YWyckEtAdxpvv+HKINTL/GSA8G/8TgKl301NR6rbImSZZXf1Ao9bvDjr1A2C?=
 =?us-ascii?Q?wdYVLf5oNU9N5R94IQEL2iVqJgAK/ZitRh67+X8MDeNlG+F7SBbZViP0/U26?=
 =?us-ascii?Q?S3tRA4sDc4uzxkbgMzdTDa7bigqoBahg6iacPFzAjLLF3N6LbBA0O6Rwxc5G?=
 =?us-ascii?Q?mxBfV6CH9f1uJaLj6t8HPaue3ZSWLgpJgHigwf8U4S9D3MPJ5WT5k+fmHjPb?=
 =?us-ascii?Q?dccZUHZPfupYxS4zJrMLvSU6OehKd9G4kvLyCWAp3j1Beyo2LH06ktEVYuam?=
 =?us-ascii?Q?KhGnEEuNjqh6jEX3BeFi8XoEBpzR3TEVN1VAPdZWZCApqOTSKy087ysaancl?=
 =?us-ascii?Q?Us/dANNKc4qsWALdIYsG5cyFu5+6lMh4SompcJ2jdnJQ2zKoGMux2lOW+wiO?=
 =?us-ascii?Q?zQXjasE2fnJS19rZ3dRvF6ha3eK4U5rs1CZPso3rwdblpzkew+ScDIdxsial?=
 =?us-ascii?Q?3Njn6WzKFggARqLHtvlrBUJulMFVlvEMJoGIjNJ2Z209QQnJL/gsSmAquHJz?=
 =?us-ascii?Q?KmXRkoFr311xtMIaNj8oeBcrPYLSSxtCv+R89ucQ/NLakIIaXTHK1POrpeVQ?=
 =?us-ascii?Q?hFWqF7qSaiqGv+7AJwOyOvN6TiYyHebhyPTeygreZQzcoyz89SazCTD9GnUA?=
 =?us-ascii?Q?2CCaA4dBuPIzjQNJ/RHjaDb/zZhdxCgmW3wr3gADIkI0P7mPdzYKtBY2xJwK?=
 =?us-ascii?Q?nVLrq66XRvygHyny0eOwRBR6XxBAObGK22ZgFkzt8xFwGu/7niXs84mPQmqP?=
 =?us-ascii?Q?BSjU62EGfg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9515fd78-d4d4-4507-0b3d-08de73f79923
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:59.7685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: igmq6zmteWLA/I9P1Hnq2H1EkATmXId1mFSKLaSeJ228sOiib9MBWoIKN97r6RH60N6hdHfCcVKcyOKUK9p1cw==
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
	NEURAL_HAM(-0.00)[-0.920];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 48CB218DD62
X-Rspamd-Action: no action

Add virtual address range tracking to the VMM using a buddy allocator.
This enables contiguous virtual address range allocation for mappings.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/vmm.rs | 98 +++++++++++++++++++++++++++++----
 1 file changed, 87 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/mm/vmm.rs b/drivers/gpu/nova-core/mm/vmm.rs
index 0e1b0d668c57..d17571db2e2d 100644
--- a/drivers/gpu/nova-core/mm/vmm.rs
+++ b/drivers/gpu/nova-core/mm/vmm.rs
@@ -9,19 +9,34 @@
 #![allow(dead_code)]
 
 use kernel::{
-    gpu::buddy::AllocatedBlocks,
-    prelude::*, //
+    gpu::buddy::{
+        AllocatedBlocks,
+        BuddyFlags,
+        GpuBuddy,
+        GpuBuddyAllocParams,
+        GpuBuddyParams, //
+    },
+    prelude::*,
+    sizes::SZ_4K, //
 };
 
-use crate::mm::{
-    pagetable::{
-        walk::{PtWalk, WalkResult},
-        MmuVersion, //
+use core::ops::Range;
+
+use crate::{
+    mm::{
+        pagetable::{
+            walk::{PtWalk, WalkResult},
+            MmuVersion, //
+        },
+        GpuMm,
+        Pfn,
+        Vfn,
+        VramAddress,
+        PAGE_SIZE, //
+    },
+    num::{
+        IntoSafeCast, //
     },
-    GpuMm,
-    Pfn,
-    Vfn,
-    VramAddress, //
 };
 
 /// Virtual Memory Manager for a GPU address space.
@@ -34,23 +49,84 @@ pub(crate) struct Vmm {
     pub(crate) mmu_version: MmuVersion,
     /// Page table allocations required for mappings.
     page_table_allocs: KVec<Pin<KBox<AllocatedBlocks>>>,
+    /// Buddy allocator for virtual address range tracking.
+    virt_buddy: GpuBuddy,
 }
 
 impl Vmm {
     /// Create a new [`Vmm`] for the given Page Directory Base address.
-    pub(crate) fn new(pdb_addr: VramAddress, mmu_version: MmuVersion) -> Result<Self> {
+    ///
+    /// The [`Vmm`] will manage a virtual address space of `va_size` bytes.
+    pub(crate) fn new(
+        pdb_addr: VramAddress,
+        mmu_version: MmuVersion,
+        va_size: u64,
+    ) -> Result<Self> {
         // Only MMU v2 is supported for now.
         if mmu_version != MmuVersion::V2 {
             return Err(ENOTSUPP);
         }
 
+        let virt_buddy = GpuBuddy::new(GpuBuddyParams {
+            base_offset_bytes: 0,
+            physical_memory_size_bytes: va_size,
+            chunk_size_bytes: SZ_4K.into_safe_cast(),
+        })?;
+
         Ok(Self {
             pdb_addr,
             mmu_version,
             page_table_allocs: KVec::new(),
+            virt_buddy,
         })
     }
 
+    /// Allocate a contiguous virtual frame number range.
+    ///
+    /// # Arguments
+    ///
+    /// - `num_pages`: Number of pages to allocate.
+    /// - `va_range`: `None` = allocate anywhere, `Some(range)` = constrain allocation to the given
+    ///   range.
+    pub(crate) fn alloc_vfn_range(
+        &self,
+        num_pages: usize,
+        va_range: Option<Range<u64>>,
+    ) -> Result<(Vfn, Pin<KBox<AllocatedBlocks>>)> {
+        let np: u64 = num_pages.into_safe_cast();
+        let size_bytes: u64 = np
+            .checked_mul(PAGE_SIZE.into_safe_cast())
+            .ok_or(EOVERFLOW)?;
+
+        let (start, end) = match va_range {
+            Some(r) => {
+                let range_size = r.end.checked_sub(r.start).ok_or(EOVERFLOW)?;
+                if range_size != size_bytes {
+                    return Err(EINVAL);
+                }
+                (r.start, r.end)
+            }
+            None => (0, 0),
+        };
+
+        let params = GpuBuddyAllocParams {
+            start_range_address: start,
+            end_range_address: end,
+            size_bytes,
+            min_block_size_bytes: SZ_4K.into_safe_cast(),
+            buddy_flags: BuddyFlags::try_new(BuddyFlags::CONTIGUOUS_ALLOCATION)?,
+        };
+
+        let alloc = KBox::pin_init(self.virt_buddy.alloc_blocks(&params), GFP_KERNEL)?;
+
+        // Get the starting offset of the first block (only block as range is contiguous).
+        let offset = alloc.iter().next().ok_or(ENOMEM)?.offset();
+        let page_size: u64 = PAGE_SIZE.into_safe_cast();
+        let vfn = Vfn::new(offset / page_size);
+
+        Ok((vfn, alloc))
+    }
+
     /// Read the [`Pfn`] for a mapped [`Vfn`] if one is mapped.
     pub(crate) fn read_mapping(&self, mm: &GpuMm, vfn: Vfn) -> Result<Option<Pfn>> {
         let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
-- 
2.34.1

