Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qCc9L00tlmmlbwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AB1159D6B
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 22:21:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0756E10E62D;
	Wed, 18 Feb 2026 21:21:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cZIpnjcW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013069.outbound.protection.outlook.com
 [40.93.196.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E508410E62F;
 Wed, 18 Feb 2026 21:21:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjK/NH3ss+eR+a60dlDpLSQRDaLpq5TXRdpaXT+iIpX1tSZ7SiirlbD3LPIdn1Dm+gihEkYKL7CWDH6qFowrWGV1UysfikNg9MWH2YIK99uHGAYifmVW/73zynkKbXc+emGtrrUZtQmeO6fOJGd69MXv3udhtCevvV7AjJooqBmjZWtFTCBX1/tz8M8KRj74oXiXR3T7j7EcRYMxN2E15Iik4CORpj9B23y2ULTUamg7UN5/QsvDZLfGAm4TIQyq7zuyl+KR1DDlkx5w4sdlJGCbwu+LI7+8GzBidJazHA684q1HtpHwuqUcoNPbZB3kzIlQP4pkHfVDN01g5XaPLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F49cACl3HIGmeiyHiHJIq2FrsVqFrqeo3rTN1RQXi6c=;
 b=JJjlCORCaTv5MnLv5LgIuZYdHuFIl69B8eAzmW0QiNILHJ2Z/ggb9o4JML2nHybqy/Orn7tFxFhRJ76d/kcdsrtvp3bpFGtaQx/9FuX9IqvdAl+4/F+c9I5yYcrxMEDzzBX2U/nP5eylO//0LhnKZZiMReblWh1mK9V4YCpLwYYGrvYK/3Smv5Y3Rz6OA4KmvhONHfBz3fk/fcoGXZZU2pe7StkZ+v2Z6CsB9+dVNlWMG3gE2ftDcnKkRzhhwpgL4yq9TW4eDd0oPr8tBtalqnhqYWGKO4xR05XCsfNqQJgt4l4hWaohTOH0h9TWnOqyLoNdNhulZaCHW1V6JWKq0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F49cACl3HIGmeiyHiHJIq2FrsVqFrqeo3rTN1RQXi6c=;
 b=cZIpnjcW5Z50sQb5qSFbmqG8HCHwmiD3Y1EKWeyORGwHkDeR8Y6qmTn6ic55vH+kMYeBIxMGM9AHZd+qwZ2xYc/DKEC2xehm39FX2ZWIOIa78HXZMQPVRtFtolwv9kz8gPAinHOIUH2O5mwOz+yCrcv5WXCJU+f0RVMFQZUY3UeuC6RmbVoH3+4E0HR1WJVcJ1n4q9t69JraQCNJU7MsW9+Qlg7dT+kYQcr5aZ9SkvKioWR0mDu97LRf2JSt9jEwfLOzeUiroYT4yeuAbtV3CndkLSOio3k0iOvM7R/osQSXVq0JOLJ6RGjdiyzFcZ+s3Z9jDEhW+/xWVYYBcmpWQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB999111.namprd12.prod.outlook.com (2603:10b6:510:38d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 21:21:07 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 21:21:07 +0000
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
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v7 02/23] docs: gpu: nova-core: Document the PRAMIN aperture
 mechanism
Date: Wed, 18 Feb 2026 16:19:59 -0500
Message-Id: <20260218212020.800836-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0024.namprd13.prod.outlook.com
 (2603:10b6:208:256::29) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB999111:EE_
X-MS-Office365-Filtering-Correlation-Id: cf9292a2-33dc-42d8-e32a-08de6f33a0fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?soSNqlV25EH8Xs/C4cIPTCqZs7m4NezxSWVpL87lzd6AQzqMQfC/TZ1Llrra?=
 =?us-ascii?Q?cy7L2xNQH7kQ4Xwl5AnQ8xvkfR0Pd3n+sHAzHuZeGHbpTuxELf/nE7FLz2ZW?=
 =?us-ascii?Q?snl4+cLdUssBrLuwf9G1L6+cEt954lGlCxlqOOEqO6xUEAJyKe53dLSiL6IL?=
 =?us-ascii?Q?bR999n/J6im2fNyOykxciu/W40bUlFTMmzc5CFWjJB5zbg3XlSskENmL8oAI?=
 =?us-ascii?Q?hKGOiUsgvUMN+JhOSnJaXuGiZ3QeUIU8yLTXsgoJ/5tAEMepK6RgY5TOTjWP?=
 =?us-ascii?Q?RtHZNQrs0AAtRH4OR2wDvg9mwj5syMK6U+LKeA45IPV47FvvlPEwRf/Adns1?=
 =?us-ascii?Q?v/ibGa7Dd+7sVGduwAqjiW9U7y5PTRMqe8yCF7ldbVqHlfPVB3i8kIoHf06e?=
 =?us-ascii?Q?gU4HlZI2eWpZb7n5bE8JcyaKetfvNiwOoL+LJSnI6LatLxYAfqwBE9EcvDUE?=
 =?us-ascii?Q?sied4GUHzkKdA0gsM0SURDszBnEmzNcuk9tCGZ/HRgpiq8s3mEnKzborbvGf?=
 =?us-ascii?Q?UaXL/YYS4k8mecE6gIJDbjN5KUg6ORvIBWPFeb7LiHWWlc909pQqq/zS6mkl?=
 =?us-ascii?Q?XCDBRnxAs9BHiU4QSRBnhZwzWHe7eTItL8xZja4oAJmBTBWW3vwoa/yHNIUa?=
 =?us-ascii?Q?ipU+dHUaYgZYqjs7bHwGnlvw35p5Z7kV7s5bEoEgSk60vflNsTcBoQ1W+dWw?=
 =?us-ascii?Q?RH1M8T5Nr1ATJ8ldYx4HStUb5DMDvD36JvJKja5PnP09kMEn+i9SI7TiEbCX?=
 =?us-ascii?Q?BV343dBBAO4tIMYD8Q3QWjusYGBFg0DEBKu/EJTOoaBA2+n4vEV51Jb++Ydh?=
 =?us-ascii?Q?p6HZM5T6trbLYQWBFjZnQlCSRSyolig+zhRKqOW5J+4ugrAC8jbmJs7+LrSR?=
 =?us-ascii?Q?fQCZMEU0HRvH5mOWqYx5474HKYVq/yZnVukdKQX42VI9u/ut7TptyoNQVl2O?=
 =?us-ascii?Q?7RgNzs02YWjWA78S+Paoyp8u4FUhgty26zbytWcbFoXmX0gvpCqtu52dTeP/?=
 =?us-ascii?Q?xlp0JneZxq7ZK7rI6IdwirjOskE61C8NF6+1xRS9cdRtAE48dhI5GwUUh47k?=
 =?us-ascii?Q?bc98Y5/FYyt6mZ2IDLkaqyaSEwVCCsUwkv+9g1FttBAraFlY89GDGYeJB0h1?=
 =?us-ascii?Q?nz1bUFDx+lY+8R25B28gep3fIiN+N0llE9LoONp5VRtJKjJ6A4XBFS3rJerN?=
 =?us-ascii?Q?K6edfjPB3Q7mfMdiPzNikU2mZ01cQhPaEQo0MaYMzcIy5xW0w43qdRF+a3tM?=
 =?us-ascii?Q?Oqo4/Ou556xKBCgvX2tU5jADfS3ilXDmjPduCIMN9k6zGG7Y763eKwKfqibc?=
 =?us-ascii?Q?zEgA0OvogLem0j4xsahaEoLnpoiQSMUUBLNFe4yk7PvLfjx9Lz7e/6jE5/xY?=
 =?us-ascii?Q?0REHHTD2yegoN/29zM2iZJ9zcpKBLkYi/Ep4Kn3QkEEgtdAQBQLDi6fEuTGz?=
 =?us-ascii?Q?tbdlbYky8KpYpOWrMHScJc44JfgYt2jSJ3aqUWLwMwOT/10l9qbIjtcJMMmZ?=
 =?us-ascii?Q?1Vk/IU497fv2Ja7yngMIf/50Vfxd3rw/30JaKbnqrE/vsYdkSmAtEoYNJAMi?=
 =?us-ascii?Q?cR0uk7ho037Gh8QkgQs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/RsDB0mcc4o7Qre3Aq9h7KOFTBZ9Rjid4rmfoJqgW8xnYb9D5BlM6p3tiu/k?=
 =?us-ascii?Q?m4PwAvMDBZJLG5GmK3OI0dQtg5YPTZb3+uLaQnkbGQGIOtvnan1xE9l7SWQi?=
 =?us-ascii?Q?idagW7+JqY08gsvr/Z+jgQe6av0khXFlZpxR19O/upG+h0zEGOxbAlP6mkro?=
 =?us-ascii?Q?9rXhThFUYK4fpARsbiKLKwYpMEqBCHAysVqsw4Je6bRWbxguXpxwJtJLaFCj?=
 =?us-ascii?Q?SZ6XY1dOWDtI57ujxQh62NuPSHar90irZs103C4sFRy/grd7yRuuswur9gRX?=
 =?us-ascii?Q?cHm8NZmVbR38v2TOWRajZwSMoMeqt7/r70oVR2ykXQB5384zrH8HVRTZbZx2?=
 =?us-ascii?Q?gO4iO5CjqAtKaXmpM7COmq56MNdGyJFDKOG0WqXUxg6TLr7wWwjSM4XeWE4F?=
 =?us-ascii?Q?MBZHLwsbqX/BgXnZi/o7G8OPA8OWEK5Ne+sG469pXVOl9CLWpvHIW+D4TUKt?=
 =?us-ascii?Q?GOWhScFwtzz6p+eBn/biu+HuXlkK8VpbqP43RXjSYkWJTqyOOgFdDi2D7kAl?=
 =?us-ascii?Q?bdWPNDCt0GXc0Mdq0GuU9lyVWZ8woRSAExprLIMr7NqSuSF9h1a3+Uz+PSEe?=
 =?us-ascii?Q?nsfl5tYzAEMQwQ+lL6XEXRSMVxaYLGIcoW47lTzUcbHhtaQMeSjiqTXfWsnm?=
 =?us-ascii?Q?g6JL1EgNaHCWGh/SqnKhGBa11Wt+BigVkszNR3D2cCx1PwoMgPY2w39lPPaH?=
 =?us-ascii?Q?qco0Nq5LXXV14ajGmhtf0er6A1KwzigFOyLOqEShdPhzKwQ2I2PkzpiH1b1y?=
 =?us-ascii?Q?P0nPFv7sry+u+dNtGnHD8zQul5ytvncm1jOY0X5CYnSHQpjZi/JTb0Txyedk?=
 =?us-ascii?Q?sIBJuGVQGTb8QO+jFvCg5J/u4ALnKzbDOmi1LleZox0/fYcund4nYs4nuSbO?=
 =?us-ascii?Q?z/4fDJTLeQBJTPIkoZfH81+f0qp0wFX0iFXIoKCCZTEJZk/8RIthLiWvWjeR?=
 =?us-ascii?Q?45e6bmvziCCYUdOl//W9VJ1XyBU46Wn0EFv7C5gfG5iyRu9GBcgVvnke8XTv?=
 =?us-ascii?Q?jTCkyaHjOFGWfNOhtNGjaKF6ABRtD9DdaF6yvZyzkF8D/8jHnHCw5b0Z9/y+?=
 =?us-ascii?Q?xPWg7NrtEvFpVnnzQMKLSoHFD4GYyd26Aq29HUCyx7xm9tjHBxhjOhhqneXn?=
 =?us-ascii?Q?RSpHzhIkI13DAJsPEbi4gRzAeFBiv7OCQpreE+84Y3hq+hCknRDX8/ts5BEF?=
 =?us-ascii?Q?ER6cXZnoLpVrS/OZQqPvVlUl1wg0UJRqOGjsIqKxdQCnoNk12xbYzeF9ZhFJ?=
 =?us-ascii?Q?piC8x30YiK4oq0pEP90zgPhYRljQwd0Aitswuye0chuFZ7eFZWhhNpk+Y7up?=
 =?us-ascii?Q?YHxDtLxYI7EijMjfKiJYDXa6AvC1UU6qjnei9c3vx2tc61/RHWPfh79yMoRC?=
 =?us-ascii?Q?IHWn10fse53j70AKGjTSGmBsbt/YB0F+PAqsiIPqd4IDxTqjWhyaD2wmY4t5?=
 =?us-ascii?Q?jQsczGhnyqonWJiNyNkqSds+8ig+f4PZFsrfLx7YsiAa2VT+ZTQS4XgLDFRE?=
 =?us-ascii?Q?R/Pn16SIAKvA6YuQ+Phz/qJFYnHfIJtz7VrMKPhGulGzloTtOAPx8fwqVFRf?=
 =?us-ascii?Q?5e7jYeQ/f6/08NsmgGQtOZR7KRrfy0vS6IIV5z22UtLWnICcSvHqT0IAFjAI?=
 =?us-ascii?Q?mMJJXAUBngytzqR6a5x2A4Rvo4Q3+DteNMPyy8dTLKjEHxyRGtRRypNQpMtQ?=
 =?us-ascii?Q?lQxL3N0IQnaIP6v/9QU5YIVUQ8/SsfadH9MxOaQsgKP0f5fZlitW1xijkUtd?=
 =?us-ascii?Q?xRXrFVFMGA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9292a2-33dc-42d8-e32a-08de6f33a0fa
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 21:21:06.9949 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQ6mKBFP2qb9JOUEsnQBrYuNX1sqnHQ5HDOF3KqrNAH0/AkJ2GrI9XPq7g+dzdl75Y9LrXBOot+O1FekLMOmzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB999111
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
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[53];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 70AB1159D6B
X-Rspamd-Action: no action

Add documentation for the PRAMIN aperture mechanism used by nova-core
for direct VRAM access.

Nova only uses TARGET=VID_MEM for VRAM access. The SYS_MEM target values
are documented for completeness but not used by the driver.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 Documentation/gpu/nova/core/pramin.rst | 125 +++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst       |   1 +
 2 files changed, 126 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/pramin.rst

diff --git a/Documentation/gpu/nova/core/pramin.rst b/Documentation/gpu/nova/core/pramin.rst
new file mode 100644
index 000000000000..55ec9d920629
--- /dev/null
+++ b/Documentation/gpu/nova/core/pramin.rst
@@ -0,0 +1,125 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=========================
+PRAMIN aperture mechanism
+=========================
+
+.. note::
+   The following description is approximate and current as of the Ampere family.
+   It may change for future generations and is intended to assist in understanding
+   the driver code.
+
+Introduction
+============
+
+PRAMIN is a hardware aperture mechanism that provides CPU access to GPU Video RAM (VRAM) before
+the GPU's Memory Management Unit (MMU) and page tables are initialized. This 1MB sliding window,
+located at a fixed offset within BAR0, is essential for setting up page tables and other critical
+GPU data structures without relying on the GPU's MMU.
+
+Architecture Overview
+=====================
+
+The PRAMIN aperture mechanism is logically implemented by the GPU's PBUS (PCIe Bus Controller Unit)
+and provides a CPU-accessible window into VRAM through the PCIe interface::
+
+    +-----------------+    PCIe     +------------------------------+
+    |      CPU        |<----------->|           GPU                |
+    +-----------------+             |                              |
+                                    |  +----------------------+    |
+                                    |  |       PBUS           |    |
+                                    |  |  (Bus Controller)    |    |
+                                    |  |                      |    |
+                                    |  |  +--------------+<------------ (window starts at
+                                    |  |  |   PRAMIN     |    |    |     BAR0 + 0x700000)
+                                    |  |  |   Window     |    |    |
+                                    |  |  |   (1MB)      |    |    |
+                                    |  |  +--------------+    |    |
+                                    |  |         |            |    |
+                                    |  +---------|------------+    |
+                                    |            |                 |
+                                    |            v                 |
+                                    |  +----------------------+<------------ (Program PRAMIN to any
+                                    |  |       VRAM           |    |    64KB-aligned VRAM boundary)
+                                    |  |    (Several GBs)     |    |
+                                    |  |                      |    |
+                                    |  |  FB[0x000000000000]  |    |
+                                    |  |          ...         |    |
+                                    |  |  FB[0x7FFFFFFFFFF]   |    |
+                                    |  +----------------------+    |
+                                    +------------------------------+
+
+PBUS (PCIe Bus Controller) is responsible for, among other things, handling MMIO
+accesses to the BAR registers.
+
+PRAMIN Window Operation
+=======================
+
+The PRAMIN window provides a 1MB sliding aperture that can be repositioned over
+the entire VRAM address space using the ``NV_PBUS_BAR0_WINDOW`` register.
+
+Window Control Mechanism
+-------------------------
+
+The window position is controlled via the PBUS ``BAR0_WINDOW`` register::
+
+    NV_PBUS_BAR0_WINDOW Register (0x1700):
+    +-------+--------+--------------------------------------+
+    | 31:26 | 25:24  |               23:0                   |
+    | RSVD  | TARGET |            BASE_ADDR                 |
+    |       |        |        (bits 39:16 of VRAM address)  |
+    +-------+--------+--------------------------------------+
+
+    BASE_ADDR field (bits 23:0):
+    - Contains bits [39:16] of the target VRAM address
+    - Provides 40-bit (1TB) address space coverage
+    - Must be programmed with 64KB-aligned addresses
+
+    TARGET field (bits 25:24):
+    - 0x0: VRAM (Video Memory)
+    - 0x1: SYS_MEM_COH (Coherent System Memory)
+    - 0x2: SYS_MEM_NONCOH (Non-coherent System Memory)
+    - 0x3: Reserved
+
+    .. note::
+       Nova only uses TARGET=VRAM (0x0) for video memory access. The SYS_MEM
+       target values are documented here for hardware completeness but are
+       not used by the driver.
+
+64KB Alignment Requirement
+---------------------------
+
+The PRAMIN window must be aligned to 64KB boundaries in VRAM. This is enforced
+by the ``BASE_ADDR`` field representing bits [39:16] of the target address::
+
+    VRAM Address Calculation:
+    actual_vram_addr = (BASE_ADDR << 16) + pramin_offset
+    Where:
+    - BASE_ADDR: 24-bit value from NV_PBUS_BAR0_WINDOW[23:0]
+    - pramin_offset: 20-bit offset within the PRAMIN window [0x00000-0xFFFFF]
+
+    Example Window Positioning:
+    +---------------------------------------------------------+
+    |                    VRAM Space                           |
+    |                                                         |
+    |  0x000000000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x0000FFFFF  +-----------------+                       |
+    |                                                         |
+    |       |              ^                                  |
+    |       |              | Window can slide                 |
+    |       v              | to any 64KB-aligned boundary     |
+    |                                                         |
+    |  0x123400000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x1234FFFFF  +-----------------+                       |
+    |                                                         |
+    |                       ...                               |
+    |                                                         |
+    |  0x7FFFF0000  +-----------------+ <-- 64KB aligned      |
+    |               | PRAMIN Window   |                       |
+    |               |    (1MB)        |                       |
+    |  0x7FFFFFFFF  +-----------------+                       |
+    +---------------------------------------------------------+
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index e39cb3163581..b8254b1ffe2a 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -32,3 +32,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/devinit
    core/fwsec
    core/falcon
+   core/pramin
-- 
2.34.1

