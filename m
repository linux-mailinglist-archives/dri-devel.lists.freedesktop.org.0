Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IKkoHQ/Ai2m1aQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 00:32:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201B611FFD0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 00:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5C6C10E120;
	Tue, 10 Feb 2026 23:32:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X03L3i/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012063.outbound.protection.outlook.com
 [40.107.200.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5372310E0EC;
 Tue, 10 Feb 2026 23:32:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zkiki1kr2KDIkoY8ivqK/6HjBvtc8exMYshUID2u5ene0COKu+SZheabOUcVCPnJEM5m9fGUs6tw1H95Pb6y7THmaiGnK1ZJeM+ReUaUCcipo34k2YcMaihIobbs97HTCBI0Sqq9jkYvloHR1aiAkqmBZCKCvMuPoGyIYdU2oSV95yod18GJBPl9fChYvcPVhBIfRyd2c9bp74VHywIIpW4afp8F34gb0RHGi+4/dN6OPRB4zZ42ocfHyXXEKgCFOzOaypR+eWTTM3DVSlkJJu/sUbq2ZWUPChA0frQ13WLZ53Q8AvTiLTNPr95LquCcgOOL+xtdOmzuN96Nl6IqsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gtoHDQkt6SKHCVxHIaW5+24u06Aw4W4MlX+cpB+gHQ=;
 b=RSFcKipbm5gkPe+Pm5C5HP9eNooWgFDlFSxpPfA9HiJlz+h7OnsJlrTHC49BQXgnn2Z/iEhbDhin1G6l6gDaYZMnanBkTpu0TcQ2n3KTsjnv36mob3jEcLSU7yKlchp8sq8FYIdsLf/Izix/EWYsItXzfZbC3xGYmF0CyjC1KvPUrasef7qouMu+WcjR1NVuJbQSLvg5CTE8C31q04M6iDEH8lqZyDRFV/FhLbiTh9g2WmiyBYVHvgyEI8QEw05ootoE4QNR9C7fiCyrR29GEu0Cq0aTxSPmiJQga6BEogED9xomWE+IEXQRU40CvdHR45s3vw6XMncBJOsjUlKrqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gtoHDQkt6SKHCVxHIaW5+24u06Aw4W4MlX+cpB+gHQ=;
 b=X03L3i/W/AWltg8GMubxf2yxa6NL88AHe3FJ7A86vQGRsBw9Evpryrl+SK2fvaaXRcrc7mlf3IU3vA/8L0A47NuAB+gMiA/W4ai+dphjeH7OXSl1fFjqSoGxkFk1VZjd4WQOr8Bu9YZxdxqS8zvcB4wczsFLe6ty3lG+1t5f5ohmUBd/sL9LXlpxUKAWRyTqdMTzWZq4E3x4rGZ2isSX9qNXolFxK6pkZYh4bcCB5W1eARHvro1+7S8w1ieEJFXD8fVIwfSQLMaXxuLxGy+23vFxar6uQBghll16xKnb0UPL7JE+fMCJswXVDEeTmgkhPXBVzfS05zNfMuBBIWcJnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA1PR12MB8586.namprd12.prod.outlook.com (2603:10b6:208:44e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Tue, 10 Feb 2026 23:32:16 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 23:32:16 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
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
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 David Airlie <airlied@gmail.com>, Edwin Peer <epeer@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH -next v9 1/3] rust: clist: Add support to interface with C
 linked lists
Date: Tue, 10 Feb 2026 18:32:02 -0500
Message-Id: <20260210233204.790524-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210233204.790524-1-joelagnelf@nvidia.com>
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CY8PR19CA0014.namprd19.prod.outlook.com
 (2603:10b6:930:44::19) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA1PR12MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 266f87e1-76bc-4051-a500-08de68fc9fa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?30gBbsqJesYBvQ1ONGH6+rHWp4wSCGP+DUf22sm6NTS1Yk16nOaFpITxUt67?=
 =?us-ascii?Q?m7eDnYcnSEBJJbvNci+QEIV+6yjsFuOnGgzMETsA+Dw6bno05B81+sjy6zL+?=
 =?us-ascii?Q?oZ6ufnS/ciev5L0ivQqIJdwmGiOXh+nFREISwdk2XxDzvMTXzEhclvIGnYeI?=
 =?us-ascii?Q?cObLkyOdCelwh46YoXtSA3sTGHacm0L8QQAkwYdfAXMPlOqzPMLHnvW+wo1A?=
 =?us-ascii?Q?XPtfHxFqeUly4wHDS+nvZ5VkZijHMrL8usGpm7p314vwbm5BctEmi+CXEOr7?=
 =?us-ascii?Q?LCtawwWRnK4cklI4qljCoAFdQw+ohem5n6s2W+Sxt9RMwdeRPeWSK79ZVeRz?=
 =?us-ascii?Q?m3HHkR+ifcb4OjJN/+edA1J6tT4NnhPSPeoZjCDEnwi7rU/XQBzqsMP9U5h0?=
 =?us-ascii?Q?oXj5U/3XOtxZgQSvC1c7wYZ6J/sMcGzaeKTR9wllyD21AtQpslRNKebx2kJU?=
 =?us-ascii?Q?DUmCuQul98XW/+ObnFJVVfcFd20MEqiTlbVo8S5eWsWLI1kapIWYt2qUmI9B?=
 =?us-ascii?Q?qBi9I8XAoc+gF6XxFpgfEG6rNJyeoyq7guTavE+3C7jwYVgana5bJyPgwZox?=
 =?us-ascii?Q?PpCBbNZlLDNovtMR6HBJQB3tTQTF+lAG6EFiTSZhmDwrqpjhi2jGpUTOHRem?=
 =?us-ascii?Q?w0nAAwJnduhFVMwLeNWaB/NrgSiH7Uj6KwRoKYN6yas3kS0NZblKRAkOz8L/?=
 =?us-ascii?Q?4+TPzXKUdhJVG/fYGYANtdikSLCSzGQxzX1XJb2Mbt/3RjEGpOgTDmBmyxux?=
 =?us-ascii?Q?sqfW95VLbzexhxMHKhCwj6E8gNk2ln5VsORBq+28Ht//6z//Uz66TyprURgh?=
 =?us-ascii?Q?McHKq7sw8YEy/gO1fQx+R3J8QO9WWDzBQtV3HZzmpkgNvhwWtU6uF3zDy6Rh?=
 =?us-ascii?Q?prfTtXdbMsoMQ6ifuWpTy4/askvsLElg4uhhXoJgGNeMx0d/KdmKP0IilW7l?=
 =?us-ascii?Q?wavO0RPq6mP+GH64kEY8sj9PyHrFd6S5hvDxHcfIcjhpI2zj6ydOsZV68Zp3?=
 =?us-ascii?Q?ASDg1rOQJOHiaqWe00UXgz7vbMJi06knUDOdSW2/jtZKg7JB5l8FEThVUJfn?=
 =?us-ascii?Q?TcLjqs5ud8dGFMjLBoSIR4gejK4jJ3kbX2aU68qZqDDW2XhUZPL4hXljUFMx?=
 =?us-ascii?Q?MU6ghTj4PrbkdT7p9p1Cnk2vjVC2JxFHhsIIT2u7xo8xUKVBhFyx4x2Pm98b?=
 =?us-ascii?Q?aTpGpPWRVPJuqbnD6pFiuIJsWxnnpZC9QzuPYIkjte7eI7Cf0WGWOhu2Dl0I?=
 =?us-ascii?Q?zt+6EB8OG6OCnx8uyzJc7lGBBMiVlACR9aCNODW176fPZF+KeigkI8ialBHX?=
 =?us-ascii?Q?XUY+4IsygA4uYfvaiaHg6/+XJR4hna4KzHYv2x7cD+eekGRMf9U2dbU5nPbH?=
 =?us-ascii?Q?PIQrUEwFn3n3m6Rgv5JWL4y+4dEyiWmS8I4MkuuADfsn2cgHhe6KW+PRYB8G?=
 =?us-ascii?Q?X2dZQsjwqiCct8usZE1dBEV5K+G061Oed/RURKEeTauD7wY4GsCi57DsJ613?=
 =?us-ascii?Q?E7SWbyzkh/4SkZFSvHUeiAh0ZwWY1V53WMkOB9or+0InuTDOrUYAa1MzqPqC?=
 =?us-ascii?Q?ODKq+tOe6T2eA0OpiB4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WZV7k3dLuXmdw+FwyRlbkwxPVFjPvh/jz17rAvMjvYYxwlb96U4H2ATll5gG?=
 =?us-ascii?Q?XWyu9ikB9hmFejU/ZA4vpnNPiFeIHP4z+ym7T3cNZz3rQPY4xZckqVYw4Ijv?=
 =?us-ascii?Q?hNaUKbliQ3MvdplDRzowF9038LMHPIoPn/A4y8CXyfG/HqN9cPv3x5s6qoui?=
 =?us-ascii?Q?85Tsv0BerTzhjg11zjSi+JFBzGcnxWZdE41lCmgrIgbOzDb5Pb+MMdFmBTMm?=
 =?us-ascii?Q?wnxLSY9tpEz/kuZpQaZyZaxxSws/nh3ghv4CNnwXHg8IcZDDQKclnOWIL6Ki?=
 =?us-ascii?Q?qBfYhPzOXcL2O3PTur9XAlEBZBdUE/NFnVifTFN1+UFuiYRGKjTGOcXK4oMx?=
 =?us-ascii?Q?V0TdphcVR/4VapOpwFirpvo5XnFQV75nxtIRlQXblSPhfydz3i3/Dh7KISsA?=
 =?us-ascii?Q?wCUWNbi2BkgVhD5cTv09FfcIJuPjIvLSHHjme6W0V5U/CoxKXe9ZlNnrIS1O?=
 =?us-ascii?Q?Gl6ELAFlPZH7tKfBD/+MDucCByfS7zBL7hxtmZ7j7Jxb7nZFv4GQMfOu4xwH?=
 =?us-ascii?Q?3NoKznyy37rvp/HQMMGxDpvSUczyIJV+jHOri3PGiMjlAyidO2trRoII6vJU?=
 =?us-ascii?Q?YVl1iSJ8gpH2SP/YkMKhe1YCq626y09NydXMivLZ/U69t7O5DbOPk+XOxvBr?=
 =?us-ascii?Q?3S/vou5+YOtIX+PSuR9jjEeQqnTHxKmxU4UzB74hAYigDZQew5EvK38m3KEB?=
 =?us-ascii?Q?s67lTtcD/YfkUNWz6EdMD0VbelWF4a8e4EgH0/H9WMQaWBnydBXauPGlMoO7?=
 =?us-ascii?Q?TsOmAotrRRjFWB7zXDlt5q3HP432ZtZZQHUj/Kz+2UTaPqQYhUtuWdSjrTPu?=
 =?us-ascii?Q?kpN6UBUFjD+mGlE/HW8p56KwtPqUbX7Gs8KgIDAF1AMzq40dXVpgTdnBSRUy?=
 =?us-ascii?Q?exiNAzlzYwi2u9B4FCcI99LsYdVon2Pz+OHzTAhoFt8snif59vw9ZulZF7vF?=
 =?us-ascii?Q?CTlsRtf6WPeoGbR4qciVqPuk9svHtjKjBFf6SteaOIW9pcf8r14k+aE1UfXS?=
 =?us-ascii?Q?dCUYBjHqbuz/7SoETNraE0mOR43xy2TpjCULZt2gV6RhXw/8wpFT9nmQqErU?=
 =?us-ascii?Q?3vXdnPx840oPwAOtK+eNz8YFmCS3z9KbCpDPcT0alk+cJQXUe6QwSz2u3xsK?=
 =?us-ascii?Q?6Iu9gDdVuRN6fdN6GEwawvm6aTAvaeWa3N1MmFMbZwOyjrFoKcy4A9qnySvE?=
 =?us-ascii?Q?Jpxv6w56tTdyTOorY2Q2YWl94hiWPA7Zih42Fc81BjaJNfu4WCsmU7Kq4x/c?=
 =?us-ascii?Q?6w/R3cNyYWUH6ok7a/2SqSkuaQHx3H0FpCTArFMofRiIUjYUr1xYbXSzVEoh?=
 =?us-ascii?Q?UbVoSZZwsjJYvO6WomFHYvPxxDpSlKYTvi7m1zLge2uXWOBUo4ddTxU9QVD6?=
 =?us-ascii?Q?kjU6XsoZLm2whYPQ2r9kbBujSm0EKL6tueWyVVRtwEgYD6tUSPRP3kmdgurS?=
 =?us-ascii?Q?84uDKfwhHl5aRTrpd9T1vPyXqnT9W31UlzdaEEfeeSiGKiDIn+F6ll/YhTyl?=
 =?us-ascii?Q?OkVpRODbdnTx3WIRPmzKlsPkcLamKphq9lLAa2kbaahP9jvbvOHVOXk9b/+3?=
 =?us-ascii?Q?45pFvBhW/c/hghklER3uLO9xqpa8jNsE/TL9Trz7YXWL2vhyM2y+sX11Zr3B?=
 =?us-ascii?Q?3FTuxRbXHYpk342fCWpbh5JsOhTgQbgqf7YGlSndUbHwTqKAJ7x+1LBiRz5A?=
 =?us-ascii?Q?20zab8x5fdxDeyhYCD9n6/0OWtQ6N63YY5FDshzQbDn8XAjYwZdexOhZ6AoO?=
 =?us-ascii?Q?YOAqTQVJQg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 266f87e1-76bc-4051-a500-08de68fc9fa9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 23:32:15.4490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QXKOUpfiT0jz7Xrw0xqZaBJ35BZJKk4Ojcj88ZOUGBS6SqdSIwHZ7WOTIAmToPHs88nyLscuoLkR4kN/dxYY1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8586
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
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,garyguo.net:email]
X-Rspamd-Queue-Id: 201B611FFD0
X-Rspamd-Action: no action

Add a new module `clist` for working with C's doubly circular linked
lists. Provide low-level iteration over list nodes.

Typed iteration over actual items is provided with a `clist_create`
macro to assist in creation of the `CList` type.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Acked-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 MAINTAINERS            |   7 +
 rust/helpers/helpers.c |   1 +
 rust/helpers/list.c    |  17 +++
 rust/kernel/clist.rs   | 320 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 5 files changed, 346 insertions(+)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 7cfb766112cd..b0050b478dc9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23205,6 +23205,13 @@ S:	Maintained
 T:	git https://github.com/Rust-for-Linux/linux.git rust-analyzer-next
 F:	scripts/generate_rust_analyzer.py
 
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
index a3c42e51f00a..724fcb8240ac 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -35,6 +35,7 @@
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
+#include "list.c"
 #include "maple_tree.c"
 #include "mm.c"
 #include "mutex.c"
diff --git a/rust/helpers/list.c b/rust/helpers/list.c
new file mode 100644
index 000000000000..4c1f9c111ec8
--- /dev/null
+++ b/rust/helpers/list.c
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Helpers for C Circular doubly linked list implementation.
+ */
+
+#include <linux/list.h>
+
+__rust_helper void rust_helper_INIT_LIST_HEAD(struct list_head *list)
+{
+	INIT_LIST_HEAD(list);
+}
+
+__rust_helper void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
+{
+	list_add_tail(new, head);
+}
diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
new file mode 100644
index 000000000000..8aa72b5d54be
--- /dev/null
+++ b/rust/kernel/clist.rs
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A C doubly circular intrusive linked list interface for rust code.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::{
+//!     bindings,
+//!     clist_create,
+//!     types::Opaque, //
+//! };
+//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
+//! # // emulated here for doctests using the C bindings.
+//! # use core::mem::MaybeUninit;
+//! #
+//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
+//! # #[repr(C)]
+//! # pub struct SampleItemC {
+//! #     pub value: i32,
+//! #     pub link: bindings::list_head,
+//! # }
+//! #
+//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
+//! #
+//! # let head = head.as_mut_ptr();
+//! # // SAFETY: head and all the items are test objects allocated in this scope.
+//! # unsafe { bindings::INIT_LIST_HEAD(head) };
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
+//! #         // &raw mut computes address of link directly as link is uninitialized.
+//! #         bindings::INIT_LIST_HEAD(&raw mut (*ptr).link);
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
+//! pub struct Item(Opaque<SampleItemC>);
+//!
+//! impl Item {
+//!     pub fn value(&self) -> i32 {
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
+use pin_init::{
+    pin_data,
+    pin_init,
+    PinInit //
+};
+
+/// Wraps a `list_head` object for use in intrusive linked lists.
+///
+/// # Invariants
+///
+/// - [`CListHead`] represents an allocated and valid `list_head` structure.
+#[pin_data]
+#[repr(transparent)]
+pub struct CListHead {
+    #[pin]
+    inner: Opaque<bindings::list_head>,
+}
+
+impl CListHead {
+    /// Create a `&CListHead` reference from a raw `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    /// - The list and all linked `list_head` nodes must not be modified by non-Rust code
+    ///   for the lifetime `'a`.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - [`CListHead`] has same layout as `list_head`.
+        // - `ptr` is valid and unmodified for 'a per caller guarantees.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Get the raw `list_head` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.inner.get()
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
+    /// Check if this node is linked in a list (not isolated).
+    #[inline]
+    pub fn is_linked(&self) -> bool {
+        let raw = self.as_raw();
+        // SAFETY: self.as_raw() is valid per type invariants.
+        unsafe { (*raw).next != raw && (*raw).prev != raw }
+    }
+
+    /// Pin-initializer that initializes the list head.
+    pub fn new() -> impl PinInit<Self> {
+        pin_init!(Self {
+            // SAFETY: `INIT_LIST_HEAD` initializes `slot` to a valid empty list.
+            inner <- Opaque::ffi_init(|slot| unsafe { bindings::INIT_LIST_HEAD(slot) }),
+        })
+    }
+}
+
+// SAFETY: [`CListHead`] can be sent to any thread.
+unsafe impl Send for CListHead {}
+
+// SAFETY: [`CListHead`] can be shared among threads as it is not modified
+// by non-Rust code per safety requirements of [`CListHead::from_raw`].
+unsafe impl Sync for CListHead {}
+
+impl PartialEq for CListHead {
+    #[inline]
+    fn eq(&self, other: &Self) -> bool {
+        core::ptr::eq(self, other)
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
+    /// Current position in the list.
+    current: &'a CListHead,
+    /// The sentinel head (used to detect end of iteration).
+    sentinel: &'a CListHead,
+}
+
+impl<'a> Iterator for CListHeadIter<'a> {
+    type Item = &'a CListHead;
+
+    #[inline]
+    fn next(&mut self) -> Option<Self::Item> {
+        // Check if we've reached the sentinel (end of list).
+        if self.current == self.sentinel {
+            return None;
+        }
+
+        let item = self.current;
+        self.current = item.next();
+        Some(item)
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
+/// - The [`CListHead`] is an allocated and valid sentinel C `list_head` structure.
+/// - `OFFSET` is the byte offset of the `list_head` field within the struct that `T` wraps.
+/// - All the list's `list_head` nodes are allocated and have valid next/prev pointers.
+#[repr(transparent)]
+pub struct CList<T, const OFFSET: usize>(CListHead, PhantomData<T>);
+
+impl<T, const OFFSET: usize> CList<T, OFFSET> {
+    /// Create a typed [`CList`] reference from a raw sentinel `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
+    ///   representing a list sentinel.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
+    /// - `T` must be `#[repr(transparent)]` over the C struct.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - [`CList`] has same layout as [`CListHead`] due to repr(transparent).
+        // - Caller guarantees `ptr` is a valid, sentinel `list_head` object.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Check if the list is empty.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        !self.0.is_linked()
+    }
+
+    /// Create an iterator over typed items.
+    #[inline]
+    pub fn iter(&self) -> CListIter<'_, T, OFFSET> {
+        let head = &self.0;
+        CListIter {
+            head_iter: CListHeadIter {
+                current: head.next(),
+                sentinel: head,
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
+/// Create a C doubly-circular linked list interface `CList` from a raw `list_head` pointer.
+///
+/// This macro creates a `CList<T, OFFSET>` that can iterate over items of type `$rust_type`
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
+/// This is an unsafe macro. The caller must ensure:
+///
+/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
+///   unmodified for the lifetime of the rust `CList`.
+/// - The list contains items of type `$c_type` linked via an embedded `$field`.
+/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
+///
+/// # Examples
+///
+/// Refer to the examples in this module's documentation.
+#[macro_export]
+macro_rules! clist_create {
+    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) => {{
+        // Compile-time check that field path is a list_head.
+        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
+            |p| &raw const (*p).$($field).+;
+
+        // Calculate offset and create `CList`.
+        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
+        $crate::clist::CList::<$rust_type, OFFSET>::from_raw($head)
+    }};
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 3da92f18f4ee..fe711d34ca1e 100644
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

