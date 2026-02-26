Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJJLFISvn2kAdQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 03:27:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F39651A016C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 03:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DBF10E0E1;
	Thu, 26 Feb 2026 02:27:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X1F8Hv5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011071.outbound.protection.outlook.com [40.107.208.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C3710E0D9;
 Thu, 26 Feb 2026 02:27:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwC6vCfdXPpMQwItHZUoeUq77VkwhiUSytWcBU2B29xnoakMelc6+WmDgGtHvQSwGVwwquIecuMCS/FUA7kuWH29tTlR9gKJxQrs6uV2PbvpzgdNjaWCVVttlw+mvpAyCo9epYfQtx04TcUhNsu91HmX2ehukCn1t8ouGcJLH4DRJuvXgJTfJ4SJ7CqIpZU863pSM40K9PO67r1H+OR7iBAFUCtITmA3TAdnTbqye3YAYrHf4XSvb+MKe8pKQcZ/eY9JBkqLwLSVcykAZ7DiCz8IZBTKVu48VXnHulptYN422iYTpfyqKmTKNcixltD46fv4J/2zKS3D1VmXToKTbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zupC/OuGYn3HEsJXl3TBXAqSp8sLYr/EoOIz28aNPJs=;
 b=c72REXHUvciF1qN3XGjuUx+zDa53JxuHs9kKGeewKTSI8fReB9oSFRfDmzQ8fb9JjAL3IaIsZN5B8untADR2XNdUKQbuubEzPyby2bcg8EnAfvpbt7rd+iH5duRLD9yhCN7stFVEQKjOwV0XzqEPj9c7xJhmEbSwTeDANl0qaWNtbeJiCer7fe9D94+ydrDN0TxcEbks5QfedXZc31eFxo97vAmOlUXQppOKfFB0qhJuNC4BWbXPYxpuhtNpGHxGo5voVbk182d1T4llyRAG8LbhnviSBnOtHEh85iW+a7pt5+mfZCSdVrZ5pjkSi4IE59jWXoZXsvOD1lRb6OCG5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zupC/OuGYn3HEsJXl3TBXAqSp8sLYr/EoOIz28aNPJs=;
 b=X1F8Hv5WqTuM8xxJ83yeb+FTE0J12CYxsR4H2V8n3N9zPW78PBd4QVy8IWryXH9PXA/ESKTVE5+BRGJWAAKq7BMH1772vXiRrzVuttoJqQi+Fg0UR3Jj/ucUNR+RvJ9xk807EQrOEm6QbtZN0jV3fbb8aeoeRJlg7L6HTZrE0F4PMpKZOQNjPrz8Hglqo4P4HfRXyVu8cWW2bTGxvhwcCo3J2MZvm6/AeLFhfEG9Ob5+Y/GPnQ/kz53IdsNsyNpbzwOyv9GxQ2HbrQ2RbSjtYDvNCXtnd8Ed4M5tVbDbaN4O2ydXbwrFWyGbYssi/k+WHdp9wZcEdRxEBHuuIvi9Dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8775.namprd12.prod.outlook.com (2603:10b6:510:28e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Thu, 26 Feb
 2026 02:27:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 02:27:03 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 11:26:57 +0900
Message-Id: <DGOJDXWDOJD0.2J6NENL44SQJJ@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Bjorn Roy
 Baron" <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Dave Airlie" <airlied@redhat.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>, "Christian Koenig"
 <christian.koenig@amd.com>, "Jani Nikula" <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi"
 <rodrigo.vivi@intel.com>, "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang
 Rui" <ray.huang@amd.com>, "Matthew Auld" <matthew.auld@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>, "Lucas De Marchi"
 <lucas.demarchi@intel.com>, "Thomas Hellstrom"
 <thomas.hellstrom@linux.intel.com>, "Helge Deller" <deller@gmx.de>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle
 Rhumsaa" <elle@weathered-steel.dev>, <alexeyi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
 <DGO4BIQ6MQ9Y.KB3JJQI71ETU@nvidia.com>
 <eff888d1-2caa-45bd-a611-e5772ee94e1b@nvidia.com>
In-Reply-To: <eff888d1-2caa-45bd-a611-e5772ee94e1b@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0180.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8775:EE_
X-MS-Office365-Filtering-Correlation-Id: a7dcff9b-1f2d-4dd2-8aec-08de74de8626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: H73ysd4dXLUMwhjWXe0opVOeClSxBfIGEctQJf5y4kIAoLptVhEvZBlUhbX/xtZJMqL0SEFhCwKuVzOctQy/BDEUy0sUtatjvLIIQPfxko7+4q3YD4Zoduhrajattegp5s7x6tqgJWsQqRT8ZtYnz3krT31VKadvP3Dto1peHuA8e1j23VY2Kzzbm6Noel8QCVWcMFPq+Viw2g1Y9b5Wqin2K1iaArJSN1COT8scV1ZRWre4db2yWCNv5odw7u9i6QkV7rxEW6lJI5oI/NQdScnJgJdxVLKQDJDqPThw9tl8A1ny2/E2NXwwnNVkI1+BSAKzbttr7jpdMkyaesEAaOdZYzBD0q/tgro95rXaQYz9KFp9vhqtKseEBKWjb0JuZSaAzti+DMMp2fiq825oBhTno5miEk0itCsA/ETuaReM+cKI94Vd8N0kUvCYeEiL6OmubufMCu//M1MDO8/3gvZzzotv0++/4voq/IY1xWnieYJg67L/qzcu1P4LSHtRFQyOtO01aGMQqT/XDk1/fpPB3oyxX7MVJGh7zRanQ7E8/4QziezcXBKx8ENiGmadMZTrJAr+afgmAQf3l8OWeL6X0Um4rljoCehGeG3w0j4kLkeWkPS2y4agA3U8tgkbSmJ1gsOHuHYCSEEGOnF+jHqIbPIL7WKbvMa6Oar5FsHOR/GMfC13YfS4S0iK0b5EHpWLkzHLTBVAnfmQlGFwdY7hvsvMY478q26QlFdDVNk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bjhUcUV6ancreWN2Qjg4aWgzbzBaNVVvTUxBRGY5cTgvV0lHRVNScHg1OWVW?=
 =?utf-8?B?MzE3cFFzRU5IVkhLbWVWNysrRXRLL29tQ0FQZ1BWbUhEc01sTVh1N3E0MGZI?=
 =?utf-8?B?dHFvNVhYOS9UbU5UY1FvNG1TYzk0cURaWGJkeFhBek95Q3gvNW0wTUY4b0Ny?=
 =?utf-8?B?NHB1K3EwUXBEQUxIUEZmOGdXR3RwTnVyd3VCd25NYnlpTzJIN1JETVpoaC9p?=
 =?utf-8?B?NEoyNS8xSXhFbzkwc0tCcTBvY2E5YmttYzNYSWJScER5OWEwVVBkQXhoVjJu?=
 =?utf-8?B?cXZVdlZHMVNhMWtaQ1FlbUQzUk1qYThYSGdBYng4aElQdDR2Q0N5ZnpPaFF0?=
 =?utf-8?B?NUlObzNRSSthVnNkS3FueU91Ylh4RC9XZUJuUWFKNmNvRm0rcFVQTUxPUnVW?=
 =?utf-8?B?Y09rcDU5VjNvbCtsTzlJeVJHdlVJcFZmdEdlV2xpUTZKUDNUb2hVQ1Z2bTFJ?=
 =?utf-8?B?R0RNQjVYOEFLRXgvUnIva3l0Q0RpQlVSTWVBRXBOYVdYem1ZMUgyUnJ2eUxF?=
 =?utf-8?B?T2hscll0WjY0SURneW83cVdmS2VSd2hycXNnU2ZCM3Qwam9mT3VONnArMml1?=
 =?utf-8?B?cm1KZC9QeDZXdkIzZHUxYjRXUUpEM1R6anNpdFp4T3E3NG93QzVmVXhEWnFt?=
 =?utf-8?B?bzE4eWpEU010MjdkTEc2d3A1M3RvNlpCOUJwWW1nKzVPbTdHUldtekttUEhr?=
 =?utf-8?B?THBLMnY2SVJ1WHBVZWhIV05hVWUyVXRNZjhST1Q3KzVCaDhIamdMN1N2L3VC?=
 =?utf-8?B?UDEyc1JyOHZPZlN2RUFNUGxFaDdrTzJnYjQ0L1VRQXdYSEVtTlVnUGhYSm8y?=
 =?utf-8?B?Vnd4ZmcrbDV1aWh3YTJSWEh6QXNvZmhhdXpRaEpmNzVMbEpwQjdpdlh4WmQy?=
 =?utf-8?B?b0J2QVRlRXdoSE9xNU41UC9aa29MV2FYSVgyK1QzWkozNmY5S1RLd1FaR2hP?=
 =?utf-8?B?ODY2c3d1SzRjdnNyZWtTUGxhU2xyQlFsb01STGMzRlZwUnIyaE9qWVNqNHZV?=
 =?utf-8?B?V3A4Y3lpN0RXM2tFWThneVgvczMzcCt0RnRMUjRHclh5eUZyRDlpVzBXY2d2?=
 =?utf-8?B?V1BNRFpXYWlzYW1leEFzUG43SWRIUVR3eEtBaER4ZHY5bnhydHp6RFZMS2s3?=
 =?utf-8?B?aElaNjltUWJoeW9JZTk1d1NrbzJjaVg4RWNUT2pqRGdYbGRtSjVTY0V5NU1h?=
 =?utf-8?B?TUgyRG5pcDhQOE5CMW03c3pXNVc5WUc3WmhmS3pRMGZTMmVyaUlxWE4wd3dm?=
 =?utf-8?B?VXA5N3ZoUVBPNmJQdEt6bjh4SGFYaGRkN01KUHhmMlhNK1pTVGQ0c2tZc1FN?=
 =?utf-8?B?MmFacmxPZzgzRHY0ZS80N1lENkpiLzhFbmpGOFhKNWpuY2xlcHQ0MEdhNmg0?=
 =?utf-8?B?azZTZG01T3drQXFTSmVob29vTUlCbi9BeGdpQU0yak9hUXdpUUlXbEMwTjJK?=
 =?utf-8?B?Y29LK0Z5dlNuRXY4bUV3U2I5ZW9pek1MV3MxOElkaTRvLzloWGgxbzgxSGNM?=
 =?utf-8?B?QkZiZk1oSHJMRWRvNnV4SmdCVm1Vd0xNK0VKL1JIcG9jdXI1OW1QQWZLNjFV?=
 =?utf-8?B?UVllemwwa2xNM1ZvREhDdlMyTS9kRnhNN2t4dVhZWE5rZ1luTVNKRk1Vc2Nt?=
 =?utf-8?B?QklGbXo2bkFRWmpCc2IrQTc1cXhMWWVqZmJkUkxuakRqNWI1Sk9LTndOdjB3?=
 =?utf-8?B?YTRBZ2hKY0VxaXRDTE0xWEJFVUlZL2F4ZWJmNTlEUGxsN2FTM3ljckltK1Ja?=
 =?utf-8?B?UUh0a3lsdWZYblFoYUtMMS8xYXUwU2RUWEZpMVE3QmFVN3VvZVdkQlF5S1ZN?=
 =?utf-8?B?eHI3S2haYVRSSHVIdnFEQUNlZE5EUVc3WW9iU080azhZV1dDN2U4ZUNZM2Uy?=
 =?utf-8?B?UEI4eUhmeDBNVEo2R1ltVDlucHVvbFowUkNZZHlqZEloNDVkV05jVE5kYkdI?=
 =?utf-8?B?VzBPZ3l5VmhtRXpWS3pwV1FoVkg0UTROU0VIVis1SUk4YlNzSGowcC8reUdV?=
 =?utf-8?B?QU1yd2V2R1A1K3lrS0IzcmtHYTQ1NzNZeVBkVklaMlUybEpxYnY0Q1BTQVpX?=
 =?utf-8?B?RXNOQzFuSWwrSXZjZU0wK3dFOWVocFlYM1BqQ3RDMnlXQnZ4cWlsZWsvajVL?=
 =?utf-8?B?VWpUSkFJemh2YTM1d05zMjVqN3JYSW5KWFF6SzRPdkl3MG9NNFNsRzZydFVR?=
 =?utf-8?B?UXYwUWZEMkM2OGM5NWVqcDFVUTk1YUp3Wlh1MVV0cUJwcll0Q1pMMDBMVFV4?=
 =?utf-8?B?VVIwR2dlL1l3a2w4WG9kYUlYSDcyZjhsN1RETGg3V2N2QkQ2cEFvamFXeldQ?=
 =?utf-8?B?cENva09QbWNveDkzd29QVXh4eGVhUUJTK0xEc2ViL0dKUjdQSVU0emZrQ0x3?=
 =?utf-8?Q?e6Zt4Zj2fOASFfkTZI+n6Cx/I/vIeWVrobb7nFsudFw01?=
X-MS-Exchange-AntiSpam-MessageData-1: iOrNunZRjCg1qg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7dcff9b-1f2d-4dd2-8aec-08de74de8626
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 02:27:03.5047 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wGLDxBMfcpp3CAUvpPDqj9i8UhrwAa+HP1H7u3EFLakeBnTMph9Sp2Tz768x07+rpUznzJUfGz7Yn1WhyqxFag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8775
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
	RCPT_COUNT_TWELVE(0.00)[48];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,gmail.com,weathered-steel.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: F39651A016C
X-Rspamd-Action: no action

On Thu Feb 26, 2026 at 5:41 AM JST, Joel Fernandes wrote:
>> This structure doesn't seem to be useful. I would understand using one
>> if `GpuBuddyParams` had lots of members, some of which have a sensible
>> default value - then we could implement `Default` and let users fill in
>> the parameters they need.
>>
>> But this structure has no constructor of any sort, requiring users to
>> fill its 3 members manually - which is actually heavier than having 3
>> parameters to `GpuBuddy::new`. It is even deconstructed in
>> `GpuBuddyInner` to store its members as 3 different fields! So let's
>> skip it.
>
> I'd prefer to keep the struct -- all three parameters are `u64`, so
> positional arguments would be easy to silently misorder. The struct
> also makes call sites more readable since Rust has no named function call
> parameters.

Fair point about the 3 parameters being easily confused. If you keep it,
can you also store it in `GpuBuddyInner` instead of deconstructing it
into 3 members?

>
>>> +pub struct GpuBuddyAllocParams {
>>
>> This one also feels like it could be rustified some more.
>>
>> By this I mean that it e.g. allows the user to specify a range even if
>> `RANGE_ALLOCATION` is not set. A C API rejects invalid combinations at
>> runtime. A Rust API should make it impossible to even express them.
>>
>> [...]
>>
>> That would turn `alloc_blocks` into something like:
>>
>>   `fn alloc_blocks(&self, alloc: AllocType, size: u64, min_block_size: A=
lignment, flags: AllocBlocksFlags)`
>
> The C API supports combining allocation modes with modifiers (e.g.
> RANGE+CLEAR, TOPDOWN+CLEAR), so modeling the mode as a
> mutually-exclusive enum would lose valid combinations. More importantly,

What I suggested does allow you to combine allocation modes with
modifiers. I should have pasted a bit of code for clarity, so here goes:

    #[derive(Copy, Clone, Debug, PartialEq, Eq)]
    pub enum GpuBuddyAllocMode {
        Simple,
        Range { start: u64, end: u64 },
        TopDown,
    }

    impl GpuBuddyAllocMode {
        // Returns the flag corresponding to the allocation mode.
        //
        // Intentionally private - for internal use.
        fn into_flags(self) -> usize {
            match self {
                Self::Simple =3D> 0,
                Self::Range { .. } =3D> bindings::GPU_BUDDY_RANGE_ALLOCATIO=
N,
                Self::TopDown =3D> bindings::GPU_BUDDY_TOPDOWN_ALLOCATION,
            }
        }
    }

    impl_flags!(
        #[derive(Copy, Clone, PartialEq, Eq, Default)]
        pub struct GpuBuddyAllocFlags(u32);

        #[derive(Copy, Clone, PartialEq, Eq)]
        pub enum GpuBuddyAllocFlag {
            Contiguous =3D bindings::GPU_BUDDY_CONTIGUOUS_ALLOCATION as u32=
,
            Clear =3D bindings::GPU_BUDDY_CLEAR_ALLOCATION as u32,
            TrimDisable =3D bindings::GPU_BUDDY_TRIM_DISABLE as u32,
        }
    );

    pub struct GpuBuddyAllocParams {
        mode: GpuBuddyAllocMode,
        size: u64,
        min_block_size: u64,
        flags: GpuBuddyAllocFlags,
    }

Now instead of doing something like:

    let params =3D GpuBuddyAllocParams {
        start_range_address: 0,
        end_range_address: 0,
        size: SZ_16M as u64,
        min_block_size: SZ_16M as u64,
        buddy_flags: BuddyFlag::TopdownAllocation.into(),
    };

You would have:

    let params =3D GpuBuddyAllocParams {
        // No unneeded `start_range` and `end_range`!
        mode: GpuBuddyAllocMode::TopDown,
        size: SZ_16M as u64,
        min_block_size: SZ_16M as u64,
        flags: Default::default(),
    };

And for a cleared range allocation:

    let params =3D GpuBuddyAllocParams {
        mode: GpuBuddyAllocMode::Range {
            start: 0,
            end: SZ_16M as u64,
        },
        size: SZ_16M as u64,
        min_block_size: SZ_16M as u64,
        flags: GpuBuddyAllocFlag::Clear,
    };

Actually the parameters are now distinct enough that you don't need a
type to prevent confusion. A block allocation now just reads like a nice
sentence:

    buddy.alloc_blocks(
        GpuBuddyAllocMode::Range {
            start: 0,
            end: SZ_16M,
        },
        SZ_16M,
        // `min_block_size` should be an `Alignment`, the C API even
        // returns an error if it is not a power of 2.
        Alignment::new::<SZ_16M>(),
        GpuBuddyAllocFlag::Clear,
    )?;

And the job of `alloc_blocks` is also simplified:

    let (start, end) =3D match mode {
        GpuBuddyAllocMode::Range { start, end } =3D> (start, end),
        _ =3D> (0, 0),
    };
    let flags =3D mode.into_flags() | u32::from(flags) as usize;
    // ... and just invoke the C API with these parameters.

> if the C allocator evolves its flag semantics (new combinations become
> valid, or existing constraints change), an enum on the Rust side would
> break. It's simpler and more maintainable to pass combinable flags and
> let the C allocator validate -- which it already does. The switch to
> `impl_flags!` will work for us without over-constraining.

The evolution you describe is speculative and unlikely to happen as it
would break all C users just the same. And if the C API adds new flags
or allocation modes, we will have to update the Rust abstraction either
way.

Rust abstractions should model the C API correctly. By hardening the way
the C API can be used and stripping out invalid uses, we save headaches
to users of the API who don't need to worry about whether the flag they
pass will result in an error or simply be ignored, and we also save
maintainer time who don't have to explain the intricacies of their APIs
to confused users. :)

>
>>> +/// The internal [`GpuBuddyGuard`] ensures that the lock is held for a=
ll
>>
>> `GpuBuddyGuard` is exported and not internal though.
>
> Fixed, removed "internal" wording.
>
>>> +    base_offset: u64,
>>
>> This does not appear to be used in the C API - does it belong here? It
>> looks like an additional convenience, but I'm not convinced that's the
>> role of this type to provide this. But if it really is needed by all
>> users (guess I'll find out after looking the Nova code :)), then keeping
>> it is fair I guess.
>
> Yes, `base_offset` is needed by nova-core. The GPU's usable VRAM
> starts at `usable_vram_start` from the GSP firmware parameters:
>
>     GpuBuddyParams {
>         base_offset: params.usable_vram_start,
>         physical_memory_size: params.usable_vram_size,
>         chunk_size: SZ_4K.into_safe_cast(),
>     }
>
> `AllocatedBlock::offset()` then adds `base_offset` to return absolute
> VRAM addresses, so callers don't need to track the offset themselves.

Sounds fair, I'll check how this is used in Nova.

Ah, another thing I've noticed while writing the example above:

> +#[pinned_drop]
> +impl PinnedDrop for AllocatedBlocks {
> +    fn drop(self: Pin<&mut Self>) {
> +        let guard =3D self.buddy.lock();
> +
> +        // SAFETY:
> +        // - list is valid per the type's invariants.
> +        // - guard provides exclusive access to the allocator.
> +        // CAST: BuddyFlags were validated to fit in u32 at construction=
.
> +        unsafe {
> +            bindings::gpu_buddy_free_list(
> +                guard.as_raw(),
> +                self.list.as_raw(),
> +                self.flags.as_raw() as u32,

`gpu_buddy_free_list` only expects the `CLEARED` flag - actually it
silently masks other flags. So you probably want to just pass `0` here -
adding a `Cleared` field to `GpuBuddyAllocFlag` would also do the trick,
but it looks risky to me as it relies on the promise that the user has
cleared the buffer, which is not something we can guarantee. So I don't
think we can support this safely.

If you just pass `0`, then the `flags` member of `AllocatedBlocks`
becomes unused and you can just drop it.

And another small one - some methods of `Block` are `pub(crate)` - I
believe they should either be `pub` or kept private.
