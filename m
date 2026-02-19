Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GAuFUIql2nivQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:20:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B4C1600C0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 16:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3626310E118;
	Thu, 19 Feb 2026 15:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BYmcJQ0j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010007.outbound.protection.outlook.com [52.101.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C5710E118;
 Thu, 19 Feb 2026 15:20:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MvFoyWnDTnSP6JYbRbjJhviR3tVbSjXO78waqHHpgQqi2EqNLTDKVWuU8EiHkfhV/VznChjANlpJd4+SPFORrhFFKBpAH+wU0/czVfLhgswVmC3WXqHCyFO78vbYlWyEhof8nYqmCCCYMwZ221lXbU7cwKum4JMHcenY8FW3xl0ze4wOK5nF3cwcJbrIpblOK6ykiGLD+2bnNUgSTMtr6WViVvsHIjvXljD4MPyggmBC1YJ+Y1rRI19j8chLGTH/yU0TwPcP5khrOAmp4B6aSq1yp1AJe5+w3oRDcYB9pbTOqMUtB9LTk9zE5pTz0EOqpKuFMrAhw8nGkCvtdQfyew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=duHoQkQhvzo8SiVzZC6QSt9/wAnm+S32wPqEqpdq5fI=;
 b=fjmI08CFuJkOLaov65joCYJv441Fab1ogVAsDAA261kCIKwt+W+OgHyhjRXP770hirZaBN6RyHN1px7D5Y4xVDyry7kHYNwoeh3/TjHTDphzwPb9EhTLHWjFjMq7vcarKA7+r6AuPlWmhtiWu5Aipqy9xTxn5lVSUtT+2YF2X2KtNAI1k3Lz9MMUKgK02vexkDdk6R4hH3GWkwpm4gOxdX/xH3r8qHJvlsX36LJOB6bk9bu2SGKuoVtCdKequdcYgc7mmeitjNkOdsF3LKEAwau2qV54Bxb0kJG51NO/NKlmQUl0UrEaT4KJLhvYNNzVx9+IXjha8u7Xhuc7ZDKjJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=duHoQkQhvzo8SiVzZC6QSt9/wAnm+S32wPqEqpdq5fI=;
 b=BYmcJQ0jNHz6riHqhvxFLF2AAWMaXcMHj7+bEKoT4XtwMqI7W6CfX0TzCVURNBYubUhSkt1pZWtGC2ZrLpxSFlK5kvAX3GBo83txoGPSfuIp1I5hK/HMh3FwtD1eqI9imfZL2kcEQ9fNRsSzpVrnuvw8PmC2ErSCigSz//GTrGkGhA+S8iCToaCBWKXurFBz+IlS7rY+G8IMKJ1XG65S2TCK+W1Z8ADQFqSnHdRy+36eTGSpchgqYLbRb7G7Wog16Ynk1qIeVv6QxFHyINCr6AcdVAuVNEfZzpjbkcbzSdxT28ktPjypxhK1Lv4j1OfPg9bKVgwP9i5Vhqyq41vLgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by DS7PR12MB6070.namprd12.prod.outlook.com (2603:10b6:8:9e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 15:20:14 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 15:20:14 +0000
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 00:20:06 +0900
Message-Id: <DGJ1G3D32OMK.30HANB1W46XVL@nvidia.com>
Subject: Re: [PATCH v7 00/23] nova-core: Add memory management support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Alistair Popple" <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle
 Rhumsaa" <elle@weathered-steel.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
References: <20260218212020.800836-1-joelagnelf@nvidia.com>
In-Reply-To: <20260218212020.800836-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4P286CA0140.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::7) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|DS7PR12MB6070:EE_
X-MS-Office365-Filtering-Correlation-Id: acb3903f-b278-458b-d955-08de6fca611b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VERyMmZSdGN6MXF2U1FQc04zdU55TXdKOVYvZkwremFZRlZhSWpneVp0N2lN?=
 =?utf-8?B?bW53TnJwemxzNHk2Z3FYTVpzZXRoRlhJdnhvbnhsZkRtU29OYkVOUFVZanFK?=
 =?utf-8?B?UFJ5ZGw2Uk94aUVURS96cVVTUHNvZkp2c25QUVBPTVdzY2cvQlBub1Rnb3Ju?=
 =?utf-8?B?NDlvcmhXVEYzcjJJN1Q4UzdVdy94UlZsdVVzZXU0TGJnNWkvVXdad0thdXZS?=
 =?utf-8?B?VnVZa0NnTC9TN3lveEg2NnhmVWhOaXc4NkwwL3g4dlM1ME4zZytCcTNyK01N?=
 =?utf-8?B?VElLS3lwWjZGZU5mVmlhNUgrdjdNWGNSVmJCQUVSeVJHQ0ZURVBqcDJad3FO?=
 =?utf-8?B?REJZQlZsblFjcGRRcUZxSkFqRjB2S2s0TjVvcmxGOU0wTnhoVE5ETVlVSnRR?=
 =?utf-8?B?RVVtbnBzVXprTDdyTXYwSW84MGN1MFBpSy8yYzlpNFR5Z0Z3RnNJc091MWNI?=
 =?utf-8?B?VXJwL00xWHdybHY0b2NPTnNDM1dXNE9SWndsVWFvY0M4NEJZNXNzQUR1YjVs?=
 =?utf-8?B?ckhHNFIzcDFpZGl5MEs2UWZYUTZhb085S1R5NVM0cWpYZS9CK0VEZDZJU3h6?=
 =?utf-8?B?Z0tnemZDeHV4MksrVTZ4TVBWV2xkWkZJS3hzOVRZRmV5b3YvYUlaSlE2d2FE?=
 =?utf-8?B?a1pIaGlCSE82bmoxeUFKNlhDNHdxc281U05pMEVvS3BLM3V1bVJzZU9qdS83?=
 =?utf-8?B?N1RCVzlSV1pDMEF4WENxbmorcmZFQXpsbHpZaDZZdDl2VkpaVmQ4ZWVFY2V5?=
 =?utf-8?B?MkZSa2xOSlYvK0Y0OWVZU2NWdm1sMzJwVlRydEdwSTBDMzlPTmhaTlV4QXVx?=
 =?utf-8?B?bkNkYjZFb0oreGgxeG1ESWhFVUhTTkF0azNqMzVQV1RVV3BRZmhrU0VRUFFz?=
 =?utf-8?B?WnZ6T0twckdmdlBOOFZ1QXJuNVhDd1RUMCszeGs5WU1OVXEvbTYvVkVvVFUy?=
 =?utf-8?B?TVdWcm56cElJMlhNNFJySTVpRVphd3Q0MVBzdzA4ZERxdEZncSt0MkM4UlEy?=
 =?utf-8?B?Q1hjSWRSVGtTSXN3TXdXKzNjSy8zUktBTnNiZUIreWtQdk1pWU9BTStSaWRH?=
 =?utf-8?B?RWZJbHNHS2tJeVF3YTJHSFJ0SUhIVHJwb1RuUWlIeXAwS2VYVGNWb0h3MHlz?=
 =?utf-8?B?NE90Q1JkOGxSMHJTRmNuSTBJcm5Mc1QyWUpRNUtxcXlSaytzRFVkQ2xwNDhw?=
 =?utf-8?B?cjdiUUF5THJLbDZvaWFjalcvemFRY3dwc1Z0NjQ1Q282WWtBc2w1cGl2WGtO?=
 =?utf-8?B?OFhEY3R0RmorVXBMZ0lGb3BEbjBtVEw3ZFNMM0N3V21DMHNQMWtzek1Ed081?=
 =?utf-8?B?NzlIOGtDUTFlK1poMjF4KzBHeEV5UEttNGRBem1PTWVuUkVqZm5KbUhUQW8w?=
 =?utf-8?B?TG9tR3F1dXJxMm9nOUtyc0wraGN1U2tMSysvNFhWalV5YWFtcW5sWFlrRFhO?=
 =?utf-8?B?MG80UEVSVG5qazM4QTJraS9YUTN6ZlVsTEVTOEpDMGQwMGh0NDhlcHFJamo0?=
 =?utf-8?B?bHFGcjcxZXp5RDBEa0wwb3A1UnlXZWdqVWI2dnZBTHVSM3RoVHdlcTBJL3F0?=
 =?utf-8?B?YVZSdVBSeWJFOHNyK2poRTBYSUQxeVBtWTlPS28xRnRzSlBGNVEvWG5Na3JT?=
 =?utf-8?B?eElqRndHbzI3czdsbVQ0VHRmZDBDdE1NQURYUzZSQzhrMzRVRzNRNzBubkNx?=
 =?utf-8?B?YUlvT0pkTDN5TDREZXlmNXZLWmNjcmpmaDFFS1ZNWU5rYk8yTWQ1TnVQQ3Fx?=
 =?utf-8?B?NjZiSnNBVEc3NkNyWVNFYklNbnNIMjdMbjgwdmduNlpUWEpybzByV25qd2tL?=
 =?utf-8?B?VXJyYXRpNW1HcDdqcXZiVHlJbjFXd0w0RE53UHlzT25iZEhuRXprNVpXRXJw?=
 =?utf-8?B?WCtFWXFLQStQQjR0VTJrbWwzVUVuYTVydlVwcGI2b3gzRVBQTUNTZ0JneWho?=
 =?utf-8?B?RlFzb1E3R3laSHZSZVE4eVdaWHc3aCtkVEtLS2R3WVFyK2hmM25JZW1VcFhn?=
 =?utf-8?B?dWVSOHhJWUNES1pkOURDd0pjc3YvKzduMUhPL0Foa0k1WlQ5SC9oU2V5UDhi?=
 =?utf-8?B?MHd2akhrc1ZLWlJrbGpTWjJmNjFxc2dQWjhWT3VFaWlpbzJKbGN0Mko5aHht?=
 =?utf-8?Q?Osvg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEF0SmxZUlRaMVI3MHdwUXlxaVJwUEtSU3ZicHBVRVRqQzBERVNmSUszaW94?=
 =?utf-8?B?SEhEVTJZRnV1OUhSUjFkcC9oS21yUWpSdUhDTHU2d0Y1SU5zeTB1WDBxNDlr?=
 =?utf-8?B?NjlSeU9WczExOHRqM1E4R2IxZWRNQTNkdzkwMDBwVHlMQnpJZkRQeTg2NEx3?=
 =?utf-8?B?K3VIdTFNSlhNK25xYS90MGJ2NWl4c1UxeUhKaEl3bC93aTZDc2lCcU5kSVpD?=
 =?utf-8?B?WVZZazFmUG80TWVpME1yMlVEcjJ1ZHcrS3lnQTdPVWZJVnorYXdteXl2TG9S?=
 =?utf-8?B?RTd4MkR3Mm5YTlJWcmRVaERQeGlHWEtrK2p5L1haa1Y0QmZiYS9xbEs1cUVK?=
 =?utf-8?B?UU9HL0dKUlV0ejQzTTd5WGE3Kzg1blVoSEZweXdmNERNVTM2bGdXcHoxWEtK?=
 =?utf-8?B?ZVhTZUZCTTFUWGJZcURLcVFPT0tUSmRzU3dlODBtSFgyTTcyejNMV1FnSEpk?=
 =?utf-8?B?K04yU0Rla0cxVXhvdDZCUkljQUVsWDZVVFpMYkxsSEdyTlMyRDlmM3JVcHRW?=
 =?utf-8?B?OFhDck9tbDBkci9oQTlPMTZ6Nm5uWkFlbktRTzdQZXRtK1Vib3hLeFdwWENR?=
 =?utf-8?B?aFpNVEdsdWpySU5rWjlud2ladUd6MmZYU3R6YkJ0OVJaYy8xMXlCU25TdGZx?=
 =?utf-8?B?R1VlWEpVMFkrdkduMEJJbVloamh3eUZnMld0STZpTzVSdzhldG0vZlg4cnU3?=
 =?utf-8?B?Qmkya01NV2E0L1ZXaHEyTFZTRXVscHYwV3RnbDV3ZXJIZFpxYTA2NWovM24r?=
 =?utf-8?B?ZHdDd21FWkdBbU11SHpPaHRBcjFobFJWOXZQdHltZ003d0Iwc3RNdkJpUys3?=
 =?utf-8?B?ZG0zcDlzQWQwWVo0bFNIdVVqY3l0R2p0bE1BK00yTTJrWDVIdjJyWmJnRk1i?=
 =?utf-8?B?eEZPQWFHaS9zTjlwalVuNzlTaE8zcWJJQUkxVGlGUnhsN3k2TEUyRWhpRjcx?=
 =?utf-8?B?VUZxLzNpOU5nNG9FYkQwOGFEQ1Robno5bUsxeFN0c2hhSTBSQS95QWJsTGI2?=
 =?utf-8?B?emxHbnFENXkvbEs2N0x2Y2hXZ0p4UHFKWUsrakFPWUJkZ24yWlNzdUFSRGwx?=
 =?utf-8?B?YnNBS2dvVU1hYXBOdHZyZUpxSU1CSGRvMFQ2NGMxNmZTU1Jubyt0eS9lS0oy?=
 =?utf-8?B?RU9wZWJ6bUVCVU5IdG8xRjBUVlBadTJXajhoOU9TVFVvR2FmWnZoMnFpWGxL?=
 =?utf-8?B?ek84TFNkRGN4QTZUYTFMaW1QenZtOFU5cG9CY3hFR1Y0SGdobW9DSXkzM2wz?=
 =?utf-8?B?Y1prdXhXWGk5TXh6UVgyaDBXQWNZRkMvL1BpWU1kVk5ENk1uNXRuNVhjMUtJ?=
 =?utf-8?B?N29Ya0hxQjd4NzltanZhbzBDMFJyS1J6QVV5WDZ2QU1RNldhTVFLekJrMkh2?=
 =?utf-8?B?cEg5WUNNNFdOVzBhSVkxTlQwM3VRTTJKcFIwTFNUUGxMd2c2Zkl2YzhjWGVi?=
 =?utf-8?B?MVVFZmJPUk01SlJ1S0ZDT0NaTmY4QXFuWm04NXdRYXR2T014eDFHRXI0UEFv?=
 =?utf-8?B?U2c2eSs0ZGVFMC9Mb1ljM0lSWDU5TC95cXNsdk5pYWFmRkdDV0VFcEthaDU5?=
 =?utf-8?B?OG01VUQ1czIxRjlUQWNGMW40N2pWRmpYTG5GK05UUkovTUMyaFJiNW43VmxB?=
 =?utf-8?B?RThvV09LU1dYT1hEVmJOL3hheW9raWRHeHI4WTZMaUxSaHBpekU3WVZabDND?=
 =?utf-8?B?TlVSdGFZLzlkc2lLSXNnNHFjS2UrUkJPOWVKYk1PVTlGYlVIMnVFMk14Situ?=
 =?utf-8?B?bmZIc3Bqc0c4bVI2anJlemcxcFRuUmttRk1YQ01admVDMi9zakYzQWRtY1Fm?=
 =?utf-8?B?dkxjaUpvUlVEMS9hdTRPbEVnRW5hSnRlV1ZSbUdqK3cyUmFGOWJGK1VCYkVo?=
 =?utf-8?B?aXRRYzBNOFVsdFhpbnNyNFdFVU9TSXhGNWxHaUgycFJXOVZVYTZnZTRGc1l3?=
 =?utf-8?B?RjNlUmlzOERwbTJxOVJ2M0dHUEFmSEVXRW00QWxmT3ZjTEErd1hDZlgzcEN1?=
 =?utf-8?B?NGhRRmNVVXRHQ1duZXozZUEydmRlZ3RFQkZuVG5hMWRsUG4zdjRqTVNNZ09F?=
 =?utf-8?B?cnBObUhZK3dGNVVoVGpYczFQdGptNTE5YkZMWlJCS3k5a0tvQWRHMEJ0U3c0?=
 =?utf-8?B?TFpzYUlFZ1c2R1c5S0J2Qm9hYjNwUEMzNHNTSDUva0Q2cGxOYkROcWlMd2tk?=
 =?utf-8?B?NDZRYnlNci9RODQ5RmVVRkYwZ3hwOGZGR09URWR0aUx6ZTFodlNHRXlKWnIx?=
 =?utf-8?B?RU9hVFRvOVpIZ21tcUJjeEdMTmtaRk1pR3FjQ2F5czc2bm5lQk1ib0tiaytk?=
 =?utf-8?B?WElQZ2FvcVZaUFVUZXVXOFBFRmpuUmNCRERac1RoNTBUZ3pUd0phSFoxM3kz?=
 =?utf-8?Q?ZaNbhqs7QqxCtqQsH+4EXYxZwdNs7QPkO7qerrsMBoIEf?=
X-MS-Exchange-AntiSpam-MessageData-1: DfogXNjvG+Ra+A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acb3903f-b278-458b-d955-08de6fca611b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 15:20:13.8993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QulEVz8iu0wTHNwDUIrsBfUomsDAygyZnshmNQIOb4Bvv25oSr1NS0FregZOiCR4yqSXQbzO/uOO5GNlRHqLCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6070
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A9B4C1600C0
X-Rspamd-Action: no action

Hi Joel,

On Thu Feb 19, 2026 at 6:19 AM JST, Joel Fernandes wrote:
> This series adds support for nova-core memory management, including VRAM
> allocation, PRAMIN, VMM, page table walking, and BAR 1 read/writes.
> These are critical for channel management, vGPU, and all memory
> management uses.
>
> These patches depend on the following preparatory patches:
> https://lore.kernel.org/all/20260218205507.689429-1-joelagnelf@nvidia.com=
/T/#t
>
> All patches (including the preparatory patches from the other series) can
> be found at:
> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (branch nov=
a/mm or tag: nova-mm-v7-20260218)
>
> Earlier series of these patches:
> https://lore.kernel.org/linux-fbdev/DG0MRL6T7ACW.25G3GLJMP7PN1@kernel.org=
/T/#t
> https://lore.kernel.org/linux-fbdev/20260210233204.790524-1-joelagnelf@nv=
idia.com/
>
> Joel Fernandes (23):
>   nova-core: mm: Add support to use PRAMIN windows to write to VRAM
>   docs: gpu: nova-core: Document the PRAMIN aperture mechanism
>   nova-core: Add BAR1 aperture type and size constant
>   nova-core: gsp: Add BAR1 PDE base accessors
>   nova-core: mm: Add common memory management types
>   nova-core: mm: Add common types for all page table formats
>   nova-core: mm: Add MMU v2 page table types
>   nova-core: mm: Add MMU v3 page table types
>   nova-core: mm: Add unified page table entry wrapper enums
>   nova-core: mm: Add TLB flush support
>   nova-core: mm: Add GpuMm centralized memory manager
>   nova-core: mm: Add page table walker for MMU v2/v3
>   nova-core: mm: Add Virtual Memory Manager
>   nova-core: mm: Add virtual address range tracking to VMM
>   nova-core: mm: Add multi-page mapping API to VMM
>   nova-core: mm: Add BAR1 user interface
>   nova-core: gsp: Return GspStaticInfo and FbLayout from boot()
>   nova-core: mm: Add BAR1 memory management self-tests
>   nova-core: mm: Add PRAMIN aperture self-tests
>   nova-core: gsp: Extract usable FB region from GSP
>   nova-core: fb: Add usable_vram field to FbLayout
>   nova-core: mm: Use usable VRAM region for buddy allocator
>   nova-core: mm: Add BarUser to struct Gpu and create at boot

Nice series, a few overall remarks before I dive deeper into each patch:

- Use `gpu: nova-core:` (not just `nova-core:`) as the patch prefix.
- There were a few clippy warnings/rustfmt diffs when I built it.
- There are build failures introduced in patches 11 and 18 - basically
  the series doesn't build from 11 until the last patch.
- This patchset is using the `module/mod.rs` pattern instead of
  `module.rs` for new modules. The latter is the preferred norm IIUC.

The end result of the series looks coherent, but the ordering of patches
makes it more tedious to review than it needs to be. We start with
PRAMIN, then add some BAR1 types that are not used until 10+ patches
later, switch to getting the framebuffer size from the GSP, add tests,
go back to GSP, etc. It is difficult to follow all these intertwined
topics (even though they eventually converge) and to know which of the
previous patches are relevant to the current one.

But there is a clear path, and after moving patches around (with only
very trivial conflicts) I got the following ordering which is more
logical IMHO:

Phase 1: GSP plumbing
- nova-core: gsp: Return GspStaticInfo and FbLayout from boot()
- nova-core: gsp: Extract usable FB region from GSP
- nova-core: fb: Add usable_vram field to FbLayout

These constitute a logical change by themselves, by getting more
information from the GSP to know how much VRAM we have. You could even
display the result as a dev_info of dev_dbg to remove the only remaining
`dead_code`.

Phase 2: PRAMIN support
- nova-core: mm: Add support to use PRAMIN windows to write to VRAM
- docs: gpu: nova-core: Document the PRAMIN aperture mechanism

PRAMIN is needed by everything that follows.

Phase 3: GpuMm
- nova-core: mm: Add common memory management types
- nova-core: mm: Add TLB flush support
- nova-core: mm: Add GpuMm centralized memory manager
- nova-core: mm: Use usable VRAM region for buddy allocator

The common memory management types patch and TLB give us all we need to
introduce GpuMm, which makes it more accessible that after going through
all the page table types which it doesn't depend on. This culminates
with using the result of phase 1, which also allows you to get rid of
the temporary 1MB window hack if you rearrange the code a bit.

Phase 4: page tables / VMM
- nova-core: mm: Add common types for all page table formats
- nova-core: mm: Add MMU v2 page table types
- nova-core: mm: Add MMU v3 page table types
- nova-core: mm: Add unified page table entry wrapper enums
- nova-core: mm: Add page table walker for MMU v2/v3
- nova-core: mm: Add Virtual Memory Manager
- nova-core: mm: Add virtual address range tracking to VMM
- nova-core: mm: Add multi-page mapping API to VMM

The main course, required for BAR1 - these follow the original order.

Phase 5: BAR1
- nova-core: Add BAR1 aperture type and size constant
- nova-core: gsp: Add BAR1 PDE base accessors
- nova-core: mm: Add BAR1 user interface
- nova-core: mm: Add BarUser to struct Gpu and create at boot

All the BAR1 stuff now happens in one place. There is certainly room for
merging a few patches to avoid introducing dead code and eliminating
just after.

Phase 6: tests
- nova-core: mm: Add PRAMIN aperture self-tests
- nova-core: mm: Add BAR1 memory management self-tests

I have done this reordering locally and it seems to build fine.

I'll do a patch-by-patch review following this order, but I wanted to
share it first for other reviewers of this revision as it makes the
series more accessible IMHO.
