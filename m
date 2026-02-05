Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICr5FtLrg2k8vwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 02:01:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E9EED89B
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 02:01:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B79CC10E78C;
	Thu,  5 Feb 2026 01:01:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FghBsdpX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010046.outbound.protection.outlook.com [52.101.85.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C85C10E0DD;
 Thu,  5 Feb 2026 01:01:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DBLfv/6uygDQz1gPwrQTGOyxWUDn/6QxL3Uqs9Itv41UtvzIbpplk6d37wfULygU102U5I/Glv/KXBXSn2i+QbJHOt3KR7tD/wBkAbgENHeNTTVYkx8zCcDuzFK0sKJVBABeCiLVebimgdCbp1fWCssskZ3VnhgHOL8fla6w9BDLNDvsIoGkuML2vtlFGqqu7oibr/CUW5VpaxcG7oiy17/Vucq1ec/Fo5bFPgtwchv0i28PYAnsEPJXc6Bdjf2wfMMUQQH+rVlIwjsGKoAq+L5WNrmJf4SgnUMiA6Cv3F8njok/wcm6PAVSJG5cv9H+9zxJxQgNAvtBkx7dBfaBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/eAPA9hixaxhMxX43P4kqNE2UmKff4Xh7Po98+osGY=;
 b=c062usohnsgQ/Ymu62WIl7mkEuXaa/VwRzOgLjtJ034+1In1LH3Ef/faQi2fQjcH9hGjMduJAyIUBuqQdxsRgaq3XphBvA4K6oStctXTDqHZDWv7lqXMrbHIc9qqohRmUhxOZF/M2AEOiMBnUhlqDCS1Jt1WfCuF7MV5nH7BOJWT4qU54eL4i7e/yb0UheU+IQaYzER3n7FQAYzp5DcsSOqndxD1daHOlQ/V/v/vPT1fWn33bXtHvjXhbrdPfWc2RpZ3IRTeztBudILa1szTaMI7zOUlUouvyNrd+fyrsno42hKng5EzmsdftisCyJ6pHq0FlNuFi9IRQdxxzJL4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/eAPA9hixaxhMxX43P4kqNE2UmKff4Xh7Po98+osGY=;
 b=FghBsdpXBgbif9qFgAAUQdWVGN3gmZLNxEMrGM6PjeHjMZb5s3OKRNMzbJeNnVT5B/yzBrrF6aiIMBOXI6dlbL+U3egGuE/cBUFtqcE+Pw8xpIGbLUfoMZ0hgtUoGgTvPaNwm4m0/CkKV0NbH1J5qFypBbFFIhtDBA1l6CjTJOahqqTKXenJAfTv94UDzC6UkdG1bzkB1Z7hhG3AKWDKUVOM3lrjDN6bEbXMb9Mr03mOKub7OvtjcJn1pxF5QyWGmZlv1oXLtFjhetPDqdpAeRhy0Q0SIdLtLc8lOimXSO1er6tXQ+Qv6dgUbaFEGpH6SwPU8JpgFRMYJj5AYAp6ig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH8PR12MB6891.namprd12.prod.outlook.com (2603:10b6:510:1cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Thu, 5 Feb
 2026 01:00:55 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Thu, 5 Feb 2026
 01:00:55 +0000
Message-ID: <ace23f5a-f4cb-44d6-a0d6-f3b72440394f@nvidia.com>
Date: Wed, 4 Feb 2026 20:00:50 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 03/26] rust: gpu: Add GPU buddy allocator bindings
To: Dave Airlie <airlied@gmail.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-4-joelagnelf@nvidia.com>
 <CAPM=9tyL_Cq3+qWc4A41p7eqnNDLS1APUEeUbaQyJ46YDkipVw@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CAPM=9tyL_Cq3+qWc4A41p7eqnNDLS1APUEeUbaQyJ46YDkipVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0361.namprd13.prod.outlook.com
 (2603:10b6:208:2c0::6) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH8PR12MB6891:EE_
X-MS-Office365-Filtering-Correlation-Id: a823e5ec-9257-4d89-9482-08de645203e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q1J3VXNzZWNOeHdPQU9IZGYyUkZFVGFJRzVDa0lSbnBiN0N1cDBZWnFFaVhs?=
 =?utf-8?B?aUp3aS9xTC9lUjFsdTFJeERIRlBpS3RlQmJhMFlnalBvRWpTNUxkUWo2MlBB?=
 =?utf-8?B?YVNvM1M2NUNpRUkzejZla2krOCtqWnd6ZXFzaEdyYnZoUHJCZUp1cHVPMzV1?=
 =?utf-8?B?RlV2WStDbDJodEtRMHFTdkdpckxsMVI0eVo4cHBoNVpwcVNsZHEvVlRjQTVJ?=
 =?utf-8?B?bEZnZEV2UTYvRnBmSGhNckhTZE52NG1lWjhxWGhaZks4SnhheU55MThBTU5U?=
 =?utf-8?B?czFxK0VxOEdtMk93SUVJcG1iSkVZbGlIczZWK2xIR2hZNGxTbW54N1lUZDha?=
 =?utf-8?B?aTZRTXJUQzRrSVM1eHYzYzFHNnpFSWVUdUZWSGdHRkJ1UTV3VWNzK2IwNDVU?=
 =?utf-8?B?emZTdjl5SmRxUFBvdTJWY2NaYjFXM0RVUGZMSWJiMEdxeDVFcWF5Y1gvOEhW?=
 =?utf-8?B?WUpoWWthM2NzUE9vSjFIaDFzcmVkZHROY1NrYkxCbG9BKzFZTkphcVE1K1VL?=
 =?utf-8?B?YmVqak83WUR2aDFJcWxVZjA0RXhzcXFRZXRCcnZ5VHFCRHFxcEFyMXExRFkw?=
 =?utf-8?B?YUxOR0h6QmdlcmNWYUJUbkxHTXhqanhUMHA5MmNabmdESEJyZDZNSGVVazln?=
 =?utf-8?B?Qi9WYnNhL2NZR092VC9XT0ROV2hzSERWekhMblo5TFY3V05Kb0xMQm80ZFln?=
 =?utf-8?B?SW5IY216RE5JbGJIUDhEMGRkeFcyOHlBci9YQ202bmZaMUdJVHFkRnp1ejQ5?=
 =?utf-8?B?THJoU3JvSHJqWFgxUkFnSDBqSHF3WjVaT3M4d1UrcDRnMlQvTUlZOVhRVHNL?=
 =?utf-8?B?aTJTQ0NVcUVYd0RQZkdSdlB5ODRmL2ptYkxjdWxjbVBLR3V4UlUyVGxyZ1pL?=
 =?utf-8?B?VVlBWm9saGhWQUhNUlo0NWMxOTRmQ1hTUzc5WnRrVis5TmxFWXBTSjdTV3lD?=
 =?utf-8?B?T1oxUWhYeXdiUFdYR09lTkJXdTV2V3hxRDUwMGRvaG9YQ1BKVXlSbDZpM3Vk?=
 =?utf-8?B?OEhBaTBISzZZNFBoN2g4d1d0T1VPSUtHeWZWTlc2ME93aTluUnhvL3FiMXg3?=
 =?utf-8?B?SWw4MDV3K0JEV1l0YXQ2L3dzN0gyN09rQkU5T2ZxVEpvYzAxemFZQUcrM3R1?=
 =?utf-8?B?MWtCa1RjdEI0MlBudEdoYWYxWE80Qk15RGtMU3YxWjNoMDhFQ3NESVJqOEgv?=
 =?utf-8?B?clJsbFlSaFZDako2c2JrUXVDYnpsaWZKTFQzZXRyRjdIcWdodEh6cGg0K0xn?=
 =?utf-8?B?OVZURklKZXZHeUFVTlBmL1VGVy9PeUFyWDdpYjVuTXNTdUhaYjlHSWhKRUdC?=
 =?utf-8?B?Uml5UnlhV1ZNV3dEWUVwTlpLSU14R2hPczlLaDdub0RlanJEK1NEMFVtWmJC?=
 =?utf-8?B?a1pTdFRma3FaeERnYk5UcTNBak1kVDJTcVd3WDJGL0JtR0FjQ1hBWlV5MHh6?=
 =?utf-8?B?aW1wS1haWENqVlJ6ckVXeDYwSlg1NnJUc1JiZXltS25FQzk2ZDRVV1BVc3pC?=
 =?utf-8?B?UlBmc1BzNHFvdW0yaGlPUFN3ZlIzQjNqUHBzQThESFV2QUFCUWxVbHdpRmI3?=
 =?utf-8?B?Z1Bjd25VbEtoMHlaRXRWY1lta01XaGhaNlYxWURUYzV2R2pTbGVlOHlOcGFN?=
 =?utf-8?B?OFlpTmlpemRxS0JRV2hmRE10N2NZZlh5aDlSQnloTHluOTlNQkRMaWJjVEo0?=
 =?utf-8?B?Y0xzK3JrNmNpbzlBZmwzeEp1MWp5R1hZM0FHckp3eDV3VDYvemFzRU9Fcm5y?=
 =?utf-8?B?ZzllRVpXN3ZrM0tTWVlqbE5sbFRWSk5aVVY5VHZiTkxaOCtHZW50dEIxbmtO?=
 =?utf-8?B?RTk0b2tFdGM5VndCNjZGZytidU5pNUZ6dXhkTjB0TFpVZ1VNa2V2TjJCQ1lZ?=
 =?utf-8?B?cHFHcG9XSDFyRWhRcFlkdEl4VGRaZWQ0U2o1MkErbDJZZDhVUjUrQXFyWXE3?=
 =?utf-8?B?OENYVXlhdVFleFlPcWF1OHdZTXZKWkZoVGNTMmF0RjVWU05LYlBRalpoN2Np?=
 =?utf-8?B?TklVMUdud2I2MHdZRThsQUFHQWlscDBPaGJwaXN4TjJjL1RkQVJoZVlWMlRm?=
 =?utf-8?B?RVJBWnRpWlE0ZGVROWtxbkkxMi9HVTlaRXVFN1pTZFlCSGlJUFFHN2wxSDZI?=
 =?utf-8?Q?hrUc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVRUVHFFQXU5Z2NwbWRsb2hadmw3a3BxdldkWC9ML2xvQXBKbVJ2dXoxYmRo?=
 =?utf-8?B?bVZDalJhaTV1Q2htcVFQWXlTMEVRSUZxby9GbTBCWk9kWXQ1QWFUVGMzaDFl?=
 =?utf-8?B?L0d5QmQ3Z2lZQlFRSCtaZ3oxTlg4czV2MzZsNEtoUkhTbzFGTUJTSGtIUXlI?=
 =?utf-8?B?V04vbnF6QjJaUGdYUjNkc0EwOTRXYjdzQWlibE5GcGRQcSs5QjdpbEs2ZUJM?=
 =?utf-8?B?dDNCQ2xUNEVOUkRablg3dmNsRzYrWkEwY3hiTlUzemszZFpuYVBGeDBaTWRB?=
 =?utf-8?B?QUJEZUFPWXM1UFl4clBUWUtuZ2xXamlkd0hSY3p2RDdFVXUwWGdQclpsQ2pY?=
 =?utf-8?B?Y0cxWWl2U1pEdDdFcjlwQkVXYW8wU3AyT25GY3FYdGR6bVpzbE82OFNxZXl2?=
 =?utf-8?B?SEF5SnR0TVFsajJ2aG1QZkZUbUxrbXNZVGJ2emNiUFRmMmtlVkJpSTNodlFL?=
 =?utf-8?B?TDNnTkIwVFp0RVJnWWc2aG5td1MrNlFqR2kyejZ0aFlyOFlVYnROdlVJam44?=
 =?utf-8?B?d1pKZEc3em5yTmZVVEFnNmdNc0JaNGxTY3JyakdoV3cyMUM3UzhQSjRSU21X?=
 =?utf-8?B?TS9DZTh3Q1FhalFQemdCYTlPUDBJUUVCOFozbHJQSEZSSVNtRnZrZUlsTytC?=
 =?utf-8?B?U3dJMmdscXpTVXc3UkJhd0dBU2Z5dGJuZm4vTXFodWJyT2ZuOHRYTVhHSlRh?=
 =?utf-8?B?RmpLOWxLU2VuN1JvUU1tSXRDNGtsa0V4c05RSlZPbHJZaXlYL1NvajFpcGJX?=
 =?utf-8?B?TjRYOXUvZ21qMmcySGhwczZKUjhJdVl3alY0dkdtbitWWkR4UFE5YnhHR1N2?=
 =?utf-8?B?MStTN2NVR08ra25DY3J3Q05yN3VFMm11NmxORWwwZm40SEp0dEl6b1pVV1RG?=
 =?utf-8?B?dDV6YXM0Tmp4M2duZGtWSDIvQ1NHMzR0KzdGZkRRWVFJMlB0SjRBRVhYOTRV?=
 =?utf-8?B?ZUFtKzZRc3U4aGJueG0rUC9XVndPTUhnYjh4VDhKMkFoL1hVYmJXSS9LMTlo?=
 =?utf-8?B?enNxamJsRHA2TVRyY3dvWDJMbCtiNXljT0thWUw3S0dVK2xtNWxnQ2xQZGor?=
 =?utf-8?B?Wk5URTRhMyt2TGNYUXpvaUhhcTBwVkRFTHA2cEtGVzNXd013MGRQTFo4Y1ha?=
 =?utf-8?B?RUdFamo2SEltZGJlUkgvWlFKTHd4aEc1cDg0T2NxKytXQVhvbmxJR2tvTHJk?=
 =?utf-8?B?K1VBTm9xc3JPS0U3RjAxK3lQOHlDR2FwNEVkWHE0REZqQW9xTlh5ay8wZHhT?=
 =?utf-8?B?cVNSMm8rWVYwZnJqdU5YK3JkRGxVdkJQajhPRk4vckhVT0F5cEF3RVhHWWFD?=
 =?utf-8?B?cnkrMTF5enJVRThoVktjZmZPcnR5Qnc3V2R4YUdMZExxTCtHY2pRSU1sdXRu?=
 =?utf-8?B?U0N5VkdFZ1B2MU9EV3RheWRXZEpza09sTHBCZUFCV2NYNm9zWmFmcmxxYmYy?=
 =?utf-8?B?Qk52ZjNsSUJ4NW1kOHUvaG9KclZzUXhqNDE4SkNjV0o0czFBbTJtM3Myc05y?=
 =?utf-8?B?cThyczlCaGNESXQyZGpqSytkS0R6RUg1L0RROUR6aEt0N3Q1a2JMQzJPcE1p?=
 =?utf-8?B?c3Q2S1pCK0gzMGtSME5HWXN1aHJvdnd4R2NOR0toamVsT2UyVFN4Sit2ckd1?=
 =?utf-8?B?S2hWK0QvTUYvUmpCaEdJd0dCY1BqQ1hUSDN6TTE5UjFidStzWFVjb1EycmdZ?=
 =?utf-8?B?a09PbXNZTzhjRG11aVB6LzBvSW9TeVBrT1Z3bjdoTmtiUU5SZTRVcVdKbWRT?=
 =?utf-8?B?RnNlMGlraDcyK3o3R25pY0lnMUFxbExVckVyNG5DOWI4a2xhZG9IbkxrelQ2?=
 =?utf-8?B?aXN4VFBUNGswcm1tSklpaDBpWkhkc2ZvZ2FueHBTVTUrcytVSGpRbDZhLzRz?=
 =?utf-8?B?NGlUaVh3Yjh4Y2xTL1hzbUxRK1VFOWltQ0hRNnFVSVFDV3lmYXk0MGRhMXg3?=
 =?utf-8?B?ZFphMVZFWmNZT0dWWlNHMmZhVm5BZXg5UFZ6bVd6anEwSzV0dlZvd0xuc2FJ?=
 =?utf-8?B?KzRFM3pLTkxsSksvQ0N5aXR6ek1yMThHaEtnQjVydS9TbVRFdm9aRU1oMHZk?=
 =?utf-8?B?TTBTZGFNeWk0L25NMGtaeUtKZFQyVGd2V0xjK0JNdjNBSlJqbmVHMEg4VUh6?=
 =?utf-8?B?bnd2RjJ1ankveE9zTlE5WGNuM2g5K2VhVDlUUGxCMEpHR0xGOTVGRmJrd0ls?=
 =?utf-8?B?a2JJQVVIODN6QW9DanQ5cXNXN1BIZjh6MitJL0Z4bDlFQXRSMEU5YUZLc2d0?=
 =?utf-8?B?eUtXTVhDcUhSdEVsb3JqRW1qWDhaNGdCRUwwNTQ4blk5dGNRTHNMSVhyN0Fq?=
 =?utf-8?B?Sm9ZN2lvZ25KK3I2Y3lEbDJOOFF2bDh0aXRCZHp2aUw3dWEwTWdlQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a823e5ec-9257-4d89-9482-08de645203e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2026 01:00:55.1304 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tn+qnZgY+rWeNetBXBtj/ec3XR4FSLp5YkRgXI2QU5zbktXK1IhIU5fR1s/tSWwp9QlyjOWzgplndRynPVG2/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6891
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
	URIBL_MULTI_FAIL(0.00)[nvidia.com:server fail,Nvidia.com:server fail,gabe.freedesktop.org:server fail];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B8E9EED89B
X-Rspamd-Action: no action



On 2/3/2026 10:55 PM, Dave Airlie wrote:
>> +///
>> +/// These flags control the allocation behavior of the buddy allocator.
>> +#[derive(Clone, Copy, Default, PartialEq, Eq)]
>> +pub struct BuddyFlags(usize);
>> +
>> +impl BuddyFlags {
>> +    /// Range-based allocation from start to end addresses.
>> +    pub const RANGE_ALLOCATION: usize = bindings::GPU_BUDDY_RANGE_ALLOCATION;
>> +
>> +    /// Allocate from top of address space downward.
>> +    pub const TOPDOWN_ALLOCATION: usize = bindings::GPU_BUDDY_TOPDOWN_ALLOCATION;
>> +
>> +    /// Allocate physically contiguous blocks.
>> +    pub const CONTIGUOUS_ALLOCATION: usize = bindings::GPU_BUDDY_CONTIGUOUS_ALLOCATION;
>> +
>> +    /// Request allocation from the cleared (zeroed) memory. The zero'ing is not
>> +    /// done by the allocator, but by the caller before freeing old blocks.
>> +    pub const CLEAR_ALLOCATION: usize = bindings::GPU_BUDDY_CLEAR_ALLOCATION;
>> +
>> +    /// Disable trimming of partially used blocks.
>> +    pub const TRIM_DISABLE: usize = bindings::GPU_BUDDY_TRIM_DISABLE;
>> +
>> +    /// Mark blocks as cleared (zeroed) when freeing. When set during free,
>> +    /// indicates that the caller has already zeroed the memory.
>> +    pub const CLEARED: usize = bindings::GPU_BUDDY_CLEARED;
>> +
>> +    /// Create [`BuddyFlags`] from a raw value with validation.
>> +    ///
>> +    /// Use `|` operator to combine flags if needed, before calling this method.
>> +    pub fn try_new(flags: usize) -> Result<Self> {
>> +        // Flags must not exceed u32::MAX to satisfy the GPU buddy allocator C API.
>> +        if flags > u32::MAX as usize {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // `TOPDOWN_ALLOCATION` only works without `RANGE_ALLOCATION`. When both are
>> +        // set, `TOPDOWN_ALLOCATION` is silently ignored by the allocator. Reject this.
>> +        if (flags & Self::RANGE_ALLOCATION) != 0 && (flags & Self::TOPDOWN_ALLOCATION) != 0 {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        Ok(Self(flags))
>> +    }
>> +
>> +    /// Get raw value of the flags.
>> +    pub(crate) fn as_raw(self) -> usize {
>> +        self.0
>> +    }
>> +}
>> +
>> +/// Parameters for creating a GPU buddy allocator.
>> +#[derive(Clone, Copy)]
>> +pub struct GpuBuddyParams {
>> +    /// Base offset in bytes where the managed memory region starts.
>> +    /// Allocations will be offset by this value.
>> +    pub base_offset_bytes: u64,
>> +    /// Total physical memory size managed by the allocator in bytes.
>> +    pub physical_memory_size_bytes: u64,
>> +    /// Minimum allocation unit / chunk size in bytes, must be >= 4KB.
>> +    pub chunk_size_bytes: u64,
>> +}
>> +
>> +/// Parameters for allocating blocks from a GPU buddy allocator.
>> +#[derive(Clone, Copy)]
>> +pub struct GpuBuddyAllocParams {
>> +    /// Start of allocation range in bytes. Use 0 for beginning.
>> +    pub start_range_address: u64,
>> +    /// End of allocation range in bytes. Use 0 for entire range.
>> +    pub end_range_address: u64,
>> +    /// Total size to allocate in bytes.
>> +    pub size_bytes: u64,
>> +    /// Minimum block size for fragmented allocations in bytes.
>> +    pub min_block_size_bytes: u64,
>> +    /// Buddy allocator behavior flags.
>> +    pub buddy_flags: BuddyFlags,
>> +}
>> +
> 
> (not a full review)
> 
> Any reason these two need Clone, Copy? I'm not seeing a use case for
> that, maybe we should pass them as non-mutable references, but I don't
> think there is any point in passing them by value ever.
Yes, one reason I did that is because the doctests reuse the same params. But I
could also just pass by reference as you suggest. It might remove some mem
copies in the doctests. I will make this change then, thanks!

--
Joel Fernandes

