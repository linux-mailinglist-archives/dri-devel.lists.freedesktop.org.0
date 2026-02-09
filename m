Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YChtD+9Uiml9JgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:43:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8700114E44
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460BB10E495;
	Mon,  9 Feb 2026 21:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tS3+AQlx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012066.outbound.protection.outlook.com [52.101.48.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849BC10E494;
 Mon,  9 Feb 2026 21:43:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+zLbLUb2IBruy2CvMbEs2bQo8DKGmQhSA5pZUdxbGD8PMDkuvQg1VjbfrTPgUI/PG/Hos35coZzFUbbLHNB+OW0l4li0cjep1v5PM60lVnLQiCPtFvb1l/iN+WMIuasVGDkHRC1gOsXJZDGue6JlAmhue3HItYpYAgLb+YU+ZOTRBDzPW2V5Gr85ryY3pWcyaoKmnw2ZDDjDDNcYfQ2I3puXHB/6Gx+mQWRQRtJUKqSOvy1s+2+OR8bHJMtkVAPUwnpWH3aRCc9uKfzSR56AGe+oQn8jpI05rfchf/cBG9SxvzO6SKGiYCJNjzKVfvBVCG65eV/NbPD7W/m3jgl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utUoWEkcA/x9uzytAw2kCDNy9UddOYZOThBVEW2ToYw=;
 b=nCSnONm/D6yE5vEtxPfzeftYnrsiNE/v33lV6lXjvCu8WLp45cV9PkTObfy2Gndy0zp7+gdhm2C9fGNuFZ+ZY9+MSJcgAezzTe6ZC19OdRq4RotPqQIoNTbgy8dp2sY+6s8tR4bCo0MBizWQIcKwp1W6r8B18SB48oCCecgdkLkNfgX16y2ZB6/VustO/p/b5Hk6QpQ+V/0BNSGx/FKOlb8miUKq2M59VtyCDW5RV9+c98D02bp7VuvQ5g25R3By96fa8WDQbMWvySxoF05YUdiypMzEiqbxMHXAXFlxK9quzQB2MvqCkPTzHUISRn3XUHdNlqexjv9JcE0rOPspiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utUoWEkcA/x9uzytAw2kCDNy9UddOYZOThBVEW2ToYw=;
 b=tS3+AQlxx8Yf3r9Nf9OJk/8+U9e33sdynURx3H8dZOELEyYFOrkoTbMM2Yiu9O/fO5jZ6q1uLTzFP4F2FrckzLWH1AuQ+sXeuPqXXeQDLyHoXSPuttZh9WUPfhphIu/WDn2erGdcc4xN7yrJOcDwElDcg63MSDZD3CZIlp4sCG63XTUsUqeSjNelifF0Pee2qMqthX96sMy83CDRmqgESirk5zdlUJTxRzx/poq2xfoPDSe+jHGeIMyp2E8jk1EJ9eM31AgwBVJEwVABAstf34t65hR01YJh4m7As6D1YziQ5wX/EBOzpkY3HY3KkmNrRMIyv6YEd8zGSY7ilZ8fFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.19; Mon, 9 Feb 2026 21:43:03 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 21:43:02 +0000
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
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH -next v8 3/3] nova-core: mm: Select GPU_BUDDY for VRAM
 allocation
Date: Mon,  9 Feb 2026 16:42:46 -0500
Message-Id: <20260209214246.2783990-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209214246.2783990-1-joelagnelf@nvidia.com>
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0026.namprd13.prod.outlook.com
 (2603:10b6:208:256::31) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY5PR12MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: ebc4fd9d-30e6-42b0-712c-08de682431f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?g6VGRZYm2F6TdTONpvBz69avznSd+0cqvXo3ChPfkWsqa89W9ekSXZ4zezJj?=
 =?us-ascii?Q?bvtGiAqdfXhZ4XjCTWBVNlRKFmatuwcmB44cE4khe6NKgImP47l4ujJux1eq?=
 =?us-ascii?Q?6txNb5tHO85xg6nsFzkgblIJh6Zsaq/IIOuePM2tMieNKsQ/aXr6RUEIWjHm?=
 =?us-ascii?Q?w8/mgEU7iVKUVA4XMkRDTFKNvkAkaIFV/IMjNUK2rf1gaHyEwkxfnayk4hBW?=
 =?us-ascii?Q?veeYZJKvmibVWpKwDGtZopAt2faOOpkMHwRSLb6ZegQrgOYu7VsFVriXwVk7?=
 =?us-ascii?Q?VRJaSmKnLNQsYYcatKThKmWDIEqbCIdq0QX1AbaigUCV8/Kz63kVIvZht2Ak?=
 =?us-ascii?Q?Sk9DYp4TPCcyc+M5StC3nbn28scBJgfkHVjVnaF6YEglY9XS09pkXEADbBEC?=
 =?us-ascii?Q?Q/jDgEeVKjf6eCxfHo4L9lMGpx8rMJRjbwa47v5uu28dgqwcGLl98/JOTQK2?=
 =?us-ascii?Q?X7v7c5Ia2P37dB9iJgFh8tE2eTEMZxAJemuVm8KjltNLrljPBVUBSg68VZhk?=
 =?us-ascii?Q?8kkAq3NlkFoYlnkd+tudvKUtQ4nmqaOfGrXJqkfCQLBU9vK0jDWZEIwY0+6H?=
 =?us-ascii?Q?vldJgcB8RhYmMsJ82MOPix5MHzO5gTrkkXtzOSqaWZqS8+46MP1Zf/LAPjC5?=
 =?us-ascii?Q?jKsZ33HgPzbMRysv+LCkfbXavEZ0TYrLg4jS8wwVEqjwhXZ+OkgC283RKygj?=
 =?us-ascii?Q?xW9zHDgkvpejl2HklfZiVkzwlycfcdSW6AAfH/F+g99IuKRcMn22HgRw/3lK?=
 =?us-ascii?Q?tSKhryg/+sldDu/HePIOkCjfjmEMaCM+UXDJmiVRroPfgAzf8puTSgcpIS5j?=
 =?us-ascii?Q?UHnB1v0JkizjaqEHdEZb0D0k5yNYC0T3OnEZn6efTiim2XpekbfLTY34vSb3?=
 =?us-ascii?Q?7VARZ7uyW+d8zTIax1od/Pi2V+YdEge4tvIqH4zRlBf15V+8RNdaEzzCcEjM?=
 =?us-ascii?Q?zL7MXMpWBjn4n6qfuwLz5Nc9sXgXqKTgbWKoGGtI/TQ5VZJfIpfrvhxsZh8I?=
 =?us-ascii?Q?/jed/MQnITFiPouDtjs26b4eoyLzYkwTf+i+Uy39ThNaUfkhqf/MszpVutoN?=
 =?us-ascii?Q?/fYmh96JOEruCxDKBUArU4UP4RwN3Saz5x6HfzG7L/cujvC0Z0ga7eAH/iEM?=
 =?us-ascii?Q?0+3Yy0iq1Ph8rUOYyXlMtgt18J6i9lxOfNoHkrQxac5uv/K4nWwPcDaxOK1s?=
 =?us-ascii?Q?jqJrJvhqPblRnCZwe6ZXjGQoNxZt8zszFwlSQtPMa5mW8sDHKpJeL12gLa2C?=
 =?us-ascii?Q?K1oDG+Wsf22GXx2kQs5ybhPXhBvLBIpUTLVrloY+ijtnL295e0p+MJN8f9NZ?=
 =?us-ascii?Q?sFR/lfnf/jmh4QIQC1pe8oQDyE52N5AoCVdvylB6tO+H8Q9Vkcgl0EXv0Kzk?=
 =?us-ascii?Q?TWHxlcELJPOq9dzjjDCPBb04M/mJ/CObHf+iL+b0Rhh7vB+vshPZHLOE5isX?=
 =?us-ascii?Q?xayeC2caVoUuFz7iWsJDvIffv143rwx46hevKz9SMWT89kW/FxjlQLvJr0n6?=
 =?us-ascii?Q?Dm7UNv2oMkLpw0QI/GAQdhcwENBvfc/3Gzos1IwPuZyVYFJb4v40BL3rc8RY?=
 =?us-ascii?Q?JlJfRqVsRGffY+YBI+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F6ORBMOvjhhWNkYlZX1eHT/aksEDClheDT+Eb+GEF+ZVtraav+hSY8AZamJe?=
 =?us-ascii?Q?q67fnJUr4MYBnuHPNXT89Uir7DIEcHl3J8CCvUW7ZNa1T2tngTfDqBxLGP5S?=
 =?us-ascii?Q?NUcoDd2CbUNFjWWaHc3EL06vWQOR80SjHjtV5gmYoQfZYrTBGnNvSuXZ6F28?=
 =?us-ascii?Q?qXo+SRn3a8JMHwZf2z9XxyjRp3Tw+xTR6Op2tgj6e0GIMoG3NmKwIYvFQhXB?=
 =?us-ascii?Q?McXaEchppg35BK8MJfqetm+3EKXwlDMFhkwmbvxNmHSf2hyoob1ilX8SSgyf?=
 =?us-ascii?Q?0+XVy1VWoN3fDNKHzVMN65LL9Ou30fgQTHScHBRIQ/NmCAJMXYuZpchzezeM?=
 =?us-ascii?Q?VAtajuQYbJOA6jUvMn6FploA2+4aLj+XjXbrmUzhfdjtVvGWwJ/rMd/ma0Sb?=
 =?us-ascii?Q?C9H1frjFeladAYtr8v8G9reFuvCuxDeqhiJoQ+bgh2BEGWDnL253zGLoPeAB?=
 =?us-ascii?Q?2ojd49Bb8NwwkjHrbJQ5IRp6od+ZdP43G9uBr5yMP8R0mVnsJxRXx6ktgMh/?=
 =?us-ascii?Q?T4oNJJEW5Di6Qrpjy4V6+3xZsc0XgNYauhaohJHcJo43zO0OzYgDjccCxe3c?=
 =?us-ascii?Q?EZZnPm7jDKBiUI+aBYpsmGzzSXOwA1NJcY+hf9/smnPeyaHOoU8LqJsW0DAW?=
 =?us-ascii?Q?3RP9BZSD4rlQ5Rz2xZ9vnYxBln5++XqSfkUqdHXUu3jP+opal8LVhVA1bI+S?=
 =?us-ascii?Q?MflQHw2QBDJByt3b8u9Lvwi8Gr7iSM9uiU+Wn5VEAJzP05+p67VkncLgAWkC?=
 =?us-ascii?Q?kblevHM+66Yn6idr3D2WXwdHAIBbIz8F+clop7AuC+/ZpNPJhP8s/k4GhXaf?=
 =?us-ascii?Q?XnCM3cLyTxxYZKdoOlJUcPZ/e4jJOgpWAXaGicdwoMo+bVMEGhV+TplRPtZP?=
 =?us-ascii?Q?d/j2DsFRVmlw3s+2g01lRWIXCX3ylOXmca8n6ZCEO++sw/8hyqmzItIvZNka?=
 =?us-ascii?Q?+aMv+4r+J+5Lz9SJN/sWPHnfYl2bODxDf6fIllLAxQYKcWY/p6sbjAqYN5OQ?=
 =?us-ascii?Q?dj8E1jp5hVFrmeW4ZnjgVFeqdrEKHjhAUYYSDnGbM9vSbi+Awd5jRX+tah0w?=
 =?us-ascii?Q?p/x64L3QAHT138ogJmwbXT3gjkVktxJpo+mvkk/WHBQuDmf3xka1/34Q9C3W?=
 =?us-ascii?Q?DLsAsehTSl7N3Rb0LC8Jq+pNY8rhCfHiR770vbNL8teolkPY+9BR/QQ9ylwU?=
 =?us-ascii?Q?6aazsiZR0lbfRSCG67084aHLmLh2jw8MUDIbWDFMMm/REhrTX6BN9TqogFcM?=
 =?us-ascii?Q?VwZDxA2JnlcXVdkPIOeTKEfGGjYOmypPntjJboUn+qOqHlCWQF3uJiVd4WIc?=
 =?us-ascii?Q?Aywm+vdnc6kfNnSaF5+7KvucjOw1F7Wf4wJITWzjdefp5UcPNihozxiW8mN/?=
 =?us-ascii?Q?BTEzfzlKTYGwJYC1zEFXxI1eROpzphjG5I1QqINrBXye4diqBP8nV+34VE9g?=
 =?us-ascii?Q?Yw8z9MnW4cxZIo+Qu6eRaGWcW3fSlnSbO5r8LWk8oNG9NkYKYsWakX0OM3j7?=
 =?us-ascii?Q?Fo7odqNl5Jlq9sHWysDhVMMhRDaWH1j61J09NxSvy/qo0gXYHvNeAYHc6UzH?=
 =?us-ascii?Q?/F31/uouDwvOXIK9tMnbpOunqI3kgbub0TMmvih9E6gRDdpeNR9FSzshStov?=
 =?us-ascii?Q?CT1AFt/edXaNRia3fObxBbKL0whW1QpgTCWjbzG9wDZMBhMFyASKxyBWJ34F?=
 =?us-ascii?Q?FqByC2koHY9NcEUrj1HHNF7NsWBM96UsCHSRkcONNCwziMsKtlreu19e6TQa?=
 =?us-ascii?Q?TUMsDADZ8w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebc4fd9d-30e6-42b0-712c-08de682431f4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 21:43:00.0864 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Af6qYgmQDMsI20uZRNUNJiI0A+SYjCpr6pt0ZWxyMb+1C7Kwi4bi5t9K3uB+dD4fDJpvFbnz3oaqwLI5UAR3nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108
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
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D8700114E44
X-Rspamd-Action: no action

nova-core will use the GPU buddy allocator for physical VRAM management.
Enable it in Kconfig.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/nova-core/Kconfig b/drivers/gpu/nova-core/Kconfig
index 527920f9c4d3..c129764daa23 100644
--- a/drivers/gpu/nova-core/Kconfig
+++ b/drivers/gpu/nova-core/Kconfig
@@ -3,6 +3,7 @@ config NOVA_CORE
 	depends on 64BIT
 	depends on PCI
 	depends on RUST
+	select GPU_BUDDY
 	select RUST_FW_LOADER_ABSTRACTIONS
 	select AUXILIARY_BUS
 	default n
-- 
2.34.1

