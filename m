Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WAtzEGonlmnxbQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:56:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65BE159A4F
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:56:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A70D10E61F;
	Wed, 18 Feb 2026 20:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QoJxQrZb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013029.outbound.protection.outlook.com
 [40.107.201.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239C810E626;
 Wed, 18 Feb 2026 20:56:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h60PnXSiaJmjsvq80qRWTEjvoEExIbfXNKa3IuuEzCbMIhT+qXa4DH9UzhmJTyUCx+NBxtdA8XAgO/DvcA9ywKyaA16ALb2btDA9m/Mk+YHCe3tI9cDohQ/l3gULgR8r78t1hUkLj+0tqOkjO07WZus17diakmgJqdHXSZOuedna9zjskFO7PVb8okdY7zseKRRqOOmeEHe2KXlwiKyLGiBLSo/10kACfabX5NUKjSPVQGVatx+sF4v8CbRQmeIke41o3rFzx5dHoPhpsyFJPuWmFazGTC/gDSBERCb3bdgRFchUqirOYvy0tD4KkFfh89O/5coNOe3pcsVBxepzOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qxuC+zfhLe5Q7zewzUbI0fSaDTYjR+lExDd5j90/3Gw=;
 b=TAA9g9tPyIhmR+8zzPFXijP8JXM5Ph5ZJ5mYrzROVXKzmnKZ0wlkaOI46Z2armXIoFOls0fCD5FUp4Ra9n8MmpOOpYi7+tUDc6ha7WiPHEo1JnyC5uuy5ElWN9YhEoyXi6IOw/B2pjDOA/BuBjCrbmGFUjm6Cq5CuDgZne+GiZi+sfPWkR4SLDqfjhhAzWMhx0XARMy4uOhqKnGGoVBZhwm8s7xDtYKaRE6YfYXcxq7IsDM0g57/CeamIqzXaEfkDxNQZTfs5ZVhP53uI1jDjNZm+ocuj29AkdN9yUNsfhAuU9Vixr9Fn2wD7Y8c4pWfrx28s/6WzqWGAMRXIVmQTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qxuC+zfhLe5Q7zewzUbI0fSaDTYjR+lExDd5j90/3Gw=;
 b=QoJxQrZbt6obRx0L5M+TavS6KMw+Z0+rKRZP/P/Wk8tphtniRjJBPBQQTtf71L0Iv7UGoTl4WQQpKENkWV7lODOoDO3JzU4/CONMhz3Zi/lQGW5a7rIeMYjWnoSwhkARElduewDwNg8xyG3hMqfLQnb87XdZ6eCoqZde1Ja8AAm7U6Ppd+Ot2xacVnEw4fw/G+LF8eQrrPSCeNO4cG8NRu6Wd8S19KmsPaYIXqXtYqR3K2cDKkANZfMf7FO0v9GrFvkPGIgdXvM7XQGyI3eOGQc4KFw24cYw4qivFxEBd9idH0vpdX0tKSFCXlJ+Do1iJpv6H0mIqFChpXI+1QyNGw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB8031.namprd12.prod.outlook.com (2603:10b6:510:28e::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Wed, 18 Feb 2026 20:55:59 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 20:55:59 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Miguel Ojeda <ojeda@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v10 8/8] nova-core: Kconfig: Sort select statements
 alphabetically
Date: Wed, 18 Feb 2026 15:55:06 -0500
Message-Id: <20260218205507.689429-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218205507.689429-1-joelagnelf@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P222CA0021.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:531::28) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB8031:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd8d25f-4581-4f8a-f696-08de6f301e3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R1lWtXU5ot/7kwD/CHsdZP07MJ+xRXV405Jx//66VQImnsHFnbWrEb25ffhg?=
 =?us-ascii?Q?zrGjvo4RU9vQjVXGPjcGGe0hOmvRRraUg1zQIuiX1B0upFAFyJTTpeIz/LWU?=
 =?us-ascii?Q?KNJwQ9wiDGY5HGJuRcjoc3/pyQdWXD050aVadkjLG+UdXLkq1701eaeFRiaB?=
 =?us-ascii?Q?fokvAof+8uUowEnoZeKBDPk3YPLHHRa79iAjiQngcpswR7DLXxUoPNgF8kuc?=
 =?us-ascii?Q?p8rORbvjxC9e9F8EfHk7LMy/S0dfOSAoHYyQ7KyjUMvuOCehXZhpOWrhCMbB?=
 =?us-ascii?Q?SY0tng/yyd28+85t9496MRayBZcFW7rBdYNihliFZkA8SBOPCRH9j8ADM5g0?=
 =?us-ascii?Q?XMkrPCFqk4m1y+vsmXUjbo14s+eY/ruHqmfaBB7TeBLBWy58sxHJF6gL+GGC?=
 =?us-ascii?Q?OcPJ9zsWWhM1fDrHTpl7YqdiRiglQKKdO7/FmtUd/F60ZpDEkeb/J5MGivc+?=
 =?us-ascii?Q?xl0+BJh5/T9ISHxdv3850Xf/Q6QZAJcPdtkPfI0AOc0JIdX1cLvm96sUiagR?=
 =?us-ascii?Q?V177M3250Zue6p0qgGURIGxtL4fLsa296qE3FBHdCyBviRms1Ng3b1ioWhtF?=
 =?us-ascii?Q?MAp90Bp1yMPU6GOwg/4kUYO7XHZsBZpMzhDSFmkga3SLjTjJYAwxzwlzCbB6?=
 =?us-ascii?Q?vld6dh8XEfpwn2n5ilq2Lc8NFbWkA58KnTYACpD+9CdRFqwyBitSVYvvHDWe?=
 =?us-ascii?Q?08AZtbnqnDKMzi97g5DU9brTbA9CY/ObOTUYTiMOsHd71HapmeE6RAB5HG0D?=
 =?us-ascii?Q?WFQhFGZ2q8iboS8Jbx73IYSXg41RuYtGZo4HRqlrBHnhvxs87wHP9D5WA5+K?=
 =?us-ascii?Q?ju6P/ppc8/6DiwoAxPMb05ELCaTj31bouL7vfDw1azwt626drc8hfbV3Ft3r?=
 =?us-ascii?Q?lXtlsIoItiNdBe9QL0mxXE/mTHdafETOcwarzZXOWqtQhGKkxsGXD9xjuKis?=
 =?us-ascii?Q?TvYu8SbvYw0nxhNIuD2doxu+Y8PW7amiiwIQJ2rolGxvgcBwI6fSLsHv/nTx?=
 =?us-ascii?Q?A96b+mpmreyFhuzzjCvS4ewQDJL3BmKhNF1AnpVGK0IH65PlO34uOKszNomB?=
 =?us-ascii?Q?0QaE41Yc2NkE4zdqcVX2vBAsTakXjnAN2i/ag4cBc8Dh3BZtcmaYDnOpB+fV?=
 =?us-ascii?Q?7SDXtAbhNhnR3Kz1bz8iUmdCWwipA4sYXb7wXg4rt5VE+r9tfwvBczJLWayb?=
 =?us-ascii?Q?GCbjDJxG491N3YzoGzHsLI3MbiAaMuLcOrMrPjpj8rz6S2/y1X5JlIvc0/go?=
 =?us-ascii?Q?q0C/tQxfOXTZiWsL5fJSMf0/2TUR70ClE7Rd7QpOzbo7kIc7cBaow12qmSQj?=
 =?us-ascii?Q?0UnWQv1duwNvMwr+KIA6Zn3A9+iDsWJMO5ZlRCYuWQ3om8Y8SL6mXe3RDvGp?=
 =?us-ascii?Q?nrRaftFA5ZykjaXYjp/a0BvQtmbXpBchIDx+ITe5cA0HWCFbs+b10nZr5vbg?=
 =?us-ascii?Q?9l7/qAbvJ/auzfR3OYD2CLlmb/Eu1ZoqX4tikhZ4K3ulcCkL65kto+lyHhTl?=
 =?us-ascii?Q?0bf++CiLvMuA9KQ6gRMF/W18qeaIZc1mZGVSsNfV4QwuCWvvJlUMFOLSDjjQ?=
 =?us-ascii?Q?0dgHgjvNxN4RnqEeyPI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RgQGi7kctHm7plS7vTg5XBWURPVjUxMFNChTXSUr+/z/0NriluFIKCgYMDi8?=
 =?us-ascii?Q?bNEB+MPIFrdfp/Vz34PmDoEWIAArCdiJ0X599iCQFFzJNq1zLRFjEVqlVkTz?=
 =?us-ascii?Q?7wFVfGfDc21HfaYPoR2SHis/i7Rl1ITdDT2L2li7j4YovbfvhsmxHOy1jIeM?=
 =?us-ascii?Q?BdxNzO+IZY6/vszrWryqCcTByBd5dFCOaM1WkVot2G5ErSeEJjDwqpPY97WJ?=
 =?us-ascii?Q?761aRc0Im2tscvT6DtUSxYy9gjYwOR94d4oHJYDxOMDVBP6bwVxpIJAbEDaj?=
 =?us-ascii?Q?jS1HOCb9h539L3wEO7d6+EherVMO+n1m2Xcg7aQqOVXILRqLchODjAUw8zMe?=
 =?us-ascii?Q?aWIu5QG0gRdzoFvIoVJxFf22ImLeUrNo0neBhNC4GHhphOs80fO3KprR2ZIo?=
 =?us-ascii?Q?MMev63FZbYTWeU3nvrVXKvfkkf5H1ni1j491839zpIOkUtAU+mZwo7JQFB4/?=
 =?us-ascii?Q?P1ylDED42KkeRHVziokNoFLBpAtVBFiON4NMyi/JNhzH7x92cQ9R9DgMcgNl?=
 =?us-ascii?Q?/sI6W6uIB1fqpmhRzmUK27bH6ePsn12Y4WXEfvDeRgSynJoSBHMSqEuW+aAy?=
 =?us-ascii?Q?y5AsTAxg9SGxzZl8QRy5N9y1XkNAFUzCGuUJ6gUAUk2NGkcvNpdfOE+Karak?=
 =?us-ascii?Q?dNRmV00olbqYDtcEaxWWNvtc+m5ifwy8PEBdHzfeXC2SafHuG57tk9BQ2433?=
 =?us-ascii?Q?PbQsrVhS3T3/6e4hfL6+3CaRd9PoPczDyCGFWEzGfk6xLMUSCURUuuuoIpmE?=
 =?us-ascii?Q?2mmkvgK3oBlYr1nxR6b1bye49ExbmRp2Tg9Hdlp0zEjkiiS+lp/oFzUQWO5K?=
 =?us-ascii?Q?Nbv0KEf7oOrN70gLaPa0XY29yA/LptHtOTFSX9CBkhYdGW7WbElm7G88DYah?=
 =?us-ascii?Q?jjTu4B7jcNGsKPJILtvoR8lK6hszMqFdqtl9NlJeIdYTGqK4erLJfaM1J4pT?=
 =?us-ascii?Q?sqVKg3AJl/nBNUKKc8b3FqR701em9BoyUPpZvGA4kb5CxK28RUJVBpKVZVX2?=
 =?us-ascii?Q?fhIR5NKVOSG8WtSBhKZI9QYJXkldbfA7b/DASCslsXp89iJfK7OKySCwwair?=
 =?us-ascii?Q?5JFyRQdl8LAlIA+5exvYwXnTItnAsbhmvmuS6mYWr1HOcRBJG3IJ6/qahdYF?=
 =?us-ascii?Q?zrRRwr38aX6Vy4tQ6pvLgJGY9tNFp0tBiu//y5hl2Shc552rPn9b9jzY+XMX?=
 =?us-ascii?Q?V4WqzwUjsEDZ88Q03Yd5yAiiedIrTzM5A6Afcwm7yCOsYsdOjn4ZDsCvcL5B?=
 =?us-ascii?Q?LmKPnY1vRz/bMpv/kRNySZIoFCuT0jvU6eCvodiWJLLq79k5bm9AoUjJkslO?=
 =?us-ascii?Q?RocjYjtVf2Ag0+iBiKpU30f5cobXD2EkHeCfOpqqLihillm+VojuhY+QFbVW?=
 =?us-ascii?Q?82izswuEoa33ouJ8O20TE+8MUKFug7v5a1z9OU4Ao4Fv/Sz87I6DRltOsQpx?=
 =?us-ascii?Q?H5QmD2H3i1kdbxvxYtilvqT2OO8pWgB0dtYIQrnBGArU4bfY5Ux1zA3Zwk06?=
 =?us-ascii?Q?lsrCEp5ZoV4spEVguc6EfejqTR8j5rUMqrzoghk1MrjMNuk1EJDOaOyawwJY?=
 =?us-ascii?Q?H1MwofnLWCYZGaeQtz3bmZ9lg2P2bV+mQQ1DMY0cZQ4mo7AL439dX5t16Yt8?=
 =?us-ascii?Q?aMEnCPGh/HF4NWTptqnHRLHnJ5SQUkwGUkFqLC9uk/5Cg0MGjhORwMWBWY7l?=
 =?us-ascii?Q?DV5aofLMALJGd9rnq1tnHYgg2ivcrYO3AylWfbNF3mGd6seliWzdIj7oQ6Xx?=
 =?us-ascii?Q?VN7DlQ5yMA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd8d25f-4581-4f8a-f696-08de6f301e3d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 20:55:59.1088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0fxIswqyPxvC4Pyyuw7ETjs9HZgUThLOh/yxuOKUFPWC69PDahiz3SScx8OlNqnSSxJTiyGp/lkkgkvRWu6jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8031
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: E65BE159A4F
X-Rspamd-Action: no action

Reorder the select statements in NOVA_CORE Kconfig to be in
alphabetical order.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 809485167aff..6513007bf66f 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -3,9 +3,9 @@ config NOVA_CORE
 	depends on 64BIT
 	depends on PCI
 	depends on RUST
-	select RUST_FW_LOADER_ABSTRACTIONS
 	select AUXILIARY_BUS
 	select GPU_BUDDY
+	select RUST_FW_LOADER_ABSTRACTIONS
 	default n
 	help
 	  Choose this if you want to build the Nova Core driver for Nvidia
-- 
2.34.1

