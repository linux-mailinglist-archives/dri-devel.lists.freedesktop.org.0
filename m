Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK/0Ocx5lmlhgAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 03:47:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C03A15BC72
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 03:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B49C10E144;
	Thu, 19 Feb 2026 02:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WeBPwpdW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010003.outbound.protection.outlook.com [52.101.85.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E1610E144;
 Thu, 19 Feb 2026 02:47:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=autLfW/V6tAsQEm0NhRcnb1OuCqq4UbTl2fo+59i8JY5fp00lhQLaXDw5LO+JGGJVfQBHVwqQfZPO55yg2SfTMuDaTyJsxO9s+1W7x5jGNiPKaemFo2TkVeM5zMB8aKpKjFyDTqz6FkxBaSIwQvK/5F1cEJY5TXGmYtQVWr5zZC6HGfbgOz9V9DXSU86MpxDkhKrwN+Z2hBu5iRWeLX8SaEDB+T+ILLHJ/V0Ra1CLKsnOPzdrUPJkHrQPC/gJZWlOtzyMYU6I4iQXZL1kp3mW4DoyC8xGSgp15CY9GM37f2aiXsKNVVafH4LBoH+i0PBcQvK0WPNOxZBzk2TwW5D1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YA7W2sNFbqlH0NfuSnr9TQTVoZTcEKStLwAH5GFyidY=;
 b=uLv6dE8/cATsZLXpJ/LoCdwqx3gAlHBRb9e88hQzOjmDdubJlJMXFTGGwVvw5dcyeF0+tMmSEXFP7nKixI2IMtMCUW4YF+Sl6gMKsAsXADbPTL8eLNJvZaXo/0ZXDNSR8TpqYcKabYkWhlrL4+H0XGHed4Na0hrgBDWx6+K2Zm8Sumhdlmb/TBUHNPZXrr9reHtVpkwF/F5nUrf6AgvA/CHlkgiwvRNqE+ZfAKO4IlGMsBMUAOsPn2uv7O7f90c0daz/DPveKgJSkJGOLANf9lyu3aKnj9wJnEAPSwUtyhN2w8NrLzcgkmJjdMkn17DVBQ78zTzWlo7aGV2kIBxd2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YA7W2sNFbqlH0NfuSnr9TQTVoZTcEKStLwAH5GFyidY=;
 b=WeBPwpdWwDFdmnfjCR8yc3avHnqi3H4yNwRP9py+LdTz7oTq8PCMhfhbQKPVoNnHF2iACmTBqmzuFL/v5HgHxjUNFmfFjd8MqjY03fd4AIXA+ziwTcoCY3Sy/FXcIIw4ZKzxP4eajcc5F+EAHHTmeXxPS2rvtdRqGuYD/aix0RCqgsXBwKEHny6XVRoyQ3Avmz2PRPYQUOH7742uMBsDN97fGRVB31zwp92iBWzd7iRR6bU3aYybHqnzmBFkuQlbDtC3cKdqaIvthfn+dex2v4EOR3J04EiBDt5CGoaRZ76ddDa2xzHOQbifb6MyFDUxdr5hEn0Imnc5/MT7YUR7TA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8095.namprd12.prod.outlook.com (2603:10b6:806:33f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.15; Thu, 19 Feb
 2026 02:47:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 02:47:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 11:47:23 +0900
Message-Id: <DGILFRPORZFW.31EV2LX1MGXMK@nvidia.com>
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
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH -next v9 1/3] rust: clist: Add support to interface with
 C linked lists
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
 <20260210233204.790524-2-joelagnelf@nvidia.com>
 <DGIIMT4F1GWA.12UFBEUAC80VW@nvidia.com>
 <1771462209.c70cb872032e4abe@nvidia.com>
In-Reply-To: <1771462209.c70cb872032e4abe@nvidia.com>
X-ClientProxiedBy: TY4P301CA0024.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: e3a75bc8-1789-4ea9-9a1e-08de6f613739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QTlFQXZEN1VvZEs1STlET0pRVkl1S21NR1JPUUR5dEpOcmVkNVBxZ3dCcEdY?=
 =?utf-8?B?V25DOENINTFqOUVDbDJDamhSb2ZqbE5HZDRXQytVUlQreEVXUCswcWt6bHVC?=
 =?utf-8?B?SGMzNitIeWR2Y212RCs4RG1hTGNTQS96bTFGRFZGdnpTMkxFK0Vha0R1WElG?=
 =?utf-8?B?NEFsWStuSkdGd3kxMzY4Uy84U0JQNFc1SDVYK1J6T1BsZ1ZzbFJqWmIzTGV1?=
 =?utf-8?B?ZUdreXVkMDdRREFTYmVXSWVEcG5PM3A3MlI4NDFMbDY5T3FuMUhkY0NTdGJn?=
 =?utf-8?B?bVhPcmtFMHA0ZU5RK0JTejVlbHhBb0pITlpoQXV4U2NhRU9QY1M5UFFoOFMr?=
 =?utf-8?B?QXkrRnlZMXhuS29qZlNWTXZ0VUpOYm92S1U2M2xvYWQwMnlLSVJJNnBCTGV5?=
 =?utf-8?B?S1kzRjBtcWovODNlVFUrMG1sYzRleFBQM1ZyVW9WTEhSZ0VYTlltbWRWTXli?=
 =?utf-8?B?MEZERnlCajZLTm1PNEtxRTlQaEdTbW1iZU9QbWtpdm1ZWDFnaFJPQWRQMnEy?=
 =?utf-8?B?SFNYWjhjNDN2eGZQN3JQWVhsUzJBSVBLbEt4ck54TTh2TXNvK1lYWUpqRGwr?=
 =?utf-8?B?VG5pc3JqSUt5cFVRcGpXbXBZdFZzQlBzdkhUOWpSR3hmcStsU2F2djhyb005?=
 =?utf-8?B?azQrTmJuR2xDZmdMcjZ0U2tzNHRCaHdHcGNwNWZIMnNIQ1lwajhMMjBHSHl1?=
 =?utf-8?B?VGhBMG1Sa1l5Q1hvMzl3Tll3dFQreVFTRlJpNzZnNXFrNTR2MGljUmg2TWk4?=
 =?utf-8?B?WFE5ZGhFUEFxS29zdnR3U2JYUitiekdTNXV0bTd3akJMOWwrNUcyUTRVdzVO?=
 =?utf-8?B?bGEyRmsrQmduY2Vkc3oxaHNheCt5QVhoOXdqdlgzRXk5UUoyZTlzc1pMY1pJ?=
 =?utf-8?B?NWpGZ1Z6OFRVYzBVUGpFcUZRQTl5c2FCWDFkblNielBNWW4yQVphV1U5MUdv?=
 =?utf-8?B?WUJFeDFoZXhLR2RESXJ5Y0s3eWtzMWY5THVjdHd0b1ZTR0Z1STZDb2FSdjVT?=
 =?utf-8?B?ZmxYak8ya0dzanBWNFJoejRXb1k1a3g1U2tRNXNRSWRmZkxJbTI3dTBmTnlh?=
 =?utf-8?B?cytpWGtQR1JxdDE3aXJlVGpQcFQ3RHNOZE5HcWdGaFYraDhXWG14K1BJOEdP?=
 =?utf-8?B?Ukh4SnR3alVyY2tyL3lib3NIUGhxZ0xDcVVvY1BIVnlkOFhXbFlqdWVFdFFH?=
 =?utf-8?B?RTVJTHc2NlF0VHVQdjR1QVM4c25uQkxTRTNubFpNUEhzcC9saW1iSWVBMkRw?=
 =?utf-8?B?WENuM3JhK2kybUlkcFIyVGJnMnM3OEZDbktYWlZyekhLd0ViK3RITDRxMDJj?=
 =?utf-8?B?aXdra2xadGdvTUlwU3Y5M1pUREpXcEZYeVh0c1M1cTJYcmYrenA1ZFROa05X?=
 =?utf-8?B?RXFXZStEanZvRUVBTndHWDRGNlJ4WnBxbmpvUGdPNXVHb2FMbVZnVkV5STVG?=
 =?utf-8?B?TXRZWDV0bnRZZGdBZVFCU3pMMTBVQndubnJ3RjQreXdDSExSZ1hmcGZJeXIy?=
 =?utf-8?B?NFNKZFFzNWJFNkRjUUlFSVRFMHBCK1V6OW83WDBrRkc3cml0Q2M4OEU2a1hD?=
 =?utf-8?B?VHJCb2c0MmFmUGphVGJFMk1samYzOVVuSVp4M3UvSWJEUTJYdkZPYVNSRVly?=
 =?utf-8?B?UWp4V280NWxvbHE0ME5tbU9nSGh6Ri9ZcTlmMUVibjc3VndOS3lSU2crNmh4?=
 =?utf-8?B?Zjk5NlBqTS92ZTlYTDcrT21xUHk2VWtVbFAydTJCVE1yWHhGMjl6WVhpeEpq?=
 =?utf-8?B?SVliSTVESnhSQVo4ZWVmT3NOL2NkdlZ0b1dlYi9oNXRHMWlMRXVVS2VGOXdv?=
 =?utf-8?B?K0hIU2xJQWp6Uzh0ZHYvVVRwa0hiWDl4SkRqZlVKSnpqUlNZamFZbWZXZjk5?=
 =?utf-8?B?QVVMZHVKZWNkUERyWDVidm84UVVmYVNnQjI5UGtYTXVPM1I2QkJSalF2ZHhm?=
 =?utf-8?B?cUpiUnA1Qk5rb3FLd0JlTXduNnZpbHVTem5xckdIb2Zuemd0TWZBTTFMOEtG?=
 =?utf-8?B?UmdPMDNWRmZCanhOQXN2MzZ2OE5MMFV0YkRWTldSZHUzV0VBZi8rWkx3SExD?=
 =?utf-8?B?RjhyQmltQkZ2VTBKMXBSVXZSUGtLV3FlamwyVFNiT01uVVRxM0VlU1Z4ZEl4?=
 =?utf-8?Q?BRvY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1RITWlDV21HVHl2aGpNZHRJa0Y4VU5SbW1XOXFLY1FYRVNKelgrS09LR2JZ?=
 =?utf-8?B?ZzFLTVVjSjBBZDJwaDNXeVZVTTJsZDdTb1V3UGp1SnppNDJXV3RYRmg2eCti?=
 =?utf-8?B?MEh4Z090ME1MZTdBNXlFU2grR0tGYk5iYm1OOUw5V1pzM1drRlhSTytsV2du?=
 =?utf-8?B?YTh3OG1iZE8xU1UzVSt5T0tndXplZ1I5NHBGQ0h5THJIcTB3bnBkaGhRZWZq?=
 =?utf-8?B?cnZUSmZxK0tCSnZOb0dtcm84YmxIazRWNHM4Q2dvWkhmR2RPWnhzRnh2NGdO?=
 =?utf-8?B?VXZORzh2amhvQ0o4N1NGaWZkSVBaNUFNQ29ZVmRhVEZ5L3NkbzZoaEZpNEVV?=
 =?utf-8?B?VGtqbGl6dmU4cktYaDBXbTQ0MHFqRE1sbHhqeE1vZjlackZWdEpFOFBvT2Zr?=
 =?utf-8?B?ZnEvRXFjUU5BWGpRaHVJd1hIWVZuWENIVW5CSDczZVRTVDJSYjl4ZGZpUmVy?=
 =?utf-8?B?bGtiMjRMVGlYQ2VETjhaN3ZzWXNvQUZLc0syeUlkR2l5M2NyYkdIZ1ViSEpY?=
 =?utf-8?B?aUxDeDJzWWpMME5sMjMzMVdiQjJlejQ2SlAxdkM1bnVDUkcvY25ORnhXS09u?=
 =?utf-8?B?Z0Q0OVFIOWhBbnJIT2tIb3lOK1V2KzQvSjB2aFROY201Y1FiN3JjQWN2Rm9T?=
 =?utf-8?B?VUFrZlRRMGM4a0VHcmJ0eHJTK215T1RWWi9Zc3FBZ3dKMUJELzJpRFUvUTZ4?=
 =?utf-8?B?TjB5TzZ0K2owU1J3MDZXNWpqK0UvdDFSbEI0ZWFJb25DVFJhREJ4QVllU1lC?=
 =?utf-8?B?TVIvTFpwYUl3a010dlRVWmNTV3lFaFlyMnhsMjB0b1RUMjNXYzhNM0F5ZTRk?=
 =?utf-8?B?Y1U4STBvNDIwY01Xd2ZmRG9iOTVMaFpGeWl1cVhkd2xmcEhYV0t0NlV3Snps?=
 =?utf-8?B?L1dOdjJSTTVpZmxwNWxIYmo2cld1U0tGNCtQRHpwK0JXV1JvcVF3MlVNeVJL?=
 =?utf-8?B?djRETW84bS9GZkNIcFBWbm80NTYxS0EzWmtDTnNGdittTXMxaVNRNnoxclFR?=
 =?utf-8?B?SU5RTDZCeHBjMHplWmxUbTZ5Z0tHY0tLemxIR2Z1a281MThQU3dseWIwZ2N4?=
 =?utf-8?B?N1IyY2ZXL1c3SnZxNFkzdHBSK3NqRFQwcHpmL3B1VmtCeWlhK0lTRERMRVd0?=
 =?utf-8?B?Yi9NSXM1T3JZazZtMVA4MldraU5QdDl1YndGRWJsWGV0TG5Bd08wcGZnbEtt?=
 =?utf-8?B?R3VMMG1PTWxzb0R4K2Y3UEdzWWhUSFNlZVM3Z1hmSEx6djJrYkhiaGVvR3JX?=
 =?utf-8?B?eGlJczlKNHl6RC9jbDdXbmhyRURyVGFMcitoc2RvNlFnUVFrYVRuZm1OQlQ4?=
 =?utf-8?B?c0wxeWVBL3RwZFMzbXNJc0FhU09TL0Izeld0Sk5vRjMzT2tiSmxSS1Uya1h3?=
 =?utf-8?B?YlAvY0gvTkZ1ai9iMThOUzZtUGVoc2svdWlUSlI0RDRJQTFwdlR5NWZtbUNv?=
 =?utf-8?B?SU9iMTlGNGd1bDJlWmZjdnE1VEZwQjVuQVNhTHRGdC9NeFU4ZURZWVFwb3VF?=
 =?utf-8?B?VWlWZGduZ2VnSi9zT3hxcGt4bzRhTlBFYm9aNEJ4Q3B6VUVjaE04TnVPcWNR?=
 =?utf-8?B?bzZ5QnZjOXU4c2ZZV09mMFlpRXlwZmxqVTMvR2FzRldRRGdxN0NjN2NpRjBM?=
 =?utf-8?B?a3Zac2N3U1o5ak5nVk5HY2xoNTJxVlIxTnc5TVQ0ejRiRVc5VFhLbFUvVE9T?=
 =?utf-8?B?OHE4Q3pIYzgwVUovK3hXMTg1aFNsVE81N3hXRmE4MVErQzJRR1RRV3h3Q1Rx?=
 =?utf-8?B?cTdGcTVNazd3VzRFYzU1VGFFQUVuYUxtWU1YK1lkaytxN01LODdVNkZsdzl1?=
 =?utf-8?B?a2VXYjVpRTJNV2tqNHgvUDBDYjdFRjdkV0NvRFJHallwaHphMnV1ck96dGtU?=
 =?utf-8?B?SHZFNnJMVDdEaXFxMzB4cWhOU1NoV3NOanBRbm1HOVVoeTFibVluSWkxTnFP?=
 =?utf-8?B?NFVMblVJWE5TcnlFYVludjY0OHcxbEoyZC95bUFaSjB4dkIxY1Bud2czZmtN?=
 =?utf-8?B?aVJ6VUVFM0c2ZHhJUjk4UG9laGpTbm96cTdEbVl6V3Q3OUNRTkhEYVdhUXd4?=
 =?utf-8?B?ZnNrcWR5Tlp5bGlXLzlXay9RR3Viemk3NzZ1WnNmalhaRFhnd1FpVEt1MlZv?=
 =?utf-8?B?RzV0K2hTMzNkeGc5RXoreWMzMG5NbnpuUUlrYzVPTVVRUFBwSlJoR0pCSnFr?=
 =?utf-8?B?YmszVWlxbkdmaU1sMHlmVmNTUXQ2aU8rNElQRDNNd3FPTVJzQ0sxVzFMb3ZK?=
 =?utf-8?B?NzFtSHN0L3J1SCtqbE9YQW9GdDJOWjRaQkp0REU5eFBaUEVSUEVTUjVrTThm?=
 =?utf-8?B?NHRLWUtQVHA3dU5MZTdTZ0ZIV0U5Q1UzT0ZIYmF0SDVLbjArQnhMSG5GbFY4?=
 =?utf-8?Q?/W5UZQeo4r07xflu/AA5heWaMmCIdngJFuLzpGkhHCQpT?=
X-MS-Exchange-AntiSpam-MessageData-1: Uuh/Z8B7vQcPhA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a75bc8-1789-4ea9-9a1e-08de6f613739
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 02:47:26.8976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qxj8vantii3ApNogRWfpDBb4wVgBUXP0QOyCfsDpq1CXPY4LjVj1ZueeA7fOE8XTpRFdflNFyOv/2EFwa9CHnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8095
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 5C03A15BC72
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 9:59 AM JST, Joel Fernandes wrote:
> On Thu, 19 Feb 2026 09:35:31 +0900, Alexandre Courbot wrote:
>
> [...]
>
>> I asked this a couple of times ([1], [2]) but got no reply, so let me
>> try again. :) Given that `list_head` is doubly-linked, can we also
>> implement `DoubleEndedIterator`?
>>=20
>> This can be done in a follow-up patch but should be there eventually as
>> C lists are often parsed in both directions.
>>=20
>> [1] https://lore.kernel.org/all/DEGQCMSX1SGZ.2NQDPG5KUNA9D@nvidia.com/
>> [2] https://lore.kernel.org/all/DEOLRLCZQMBG.1WHBR4YL8SKYR@nvidia.com/
>
> There was a lot of redesign and you only mentioned it as an optional
> suggestion and there several higher priority comments.
>
> Anyway, I disagree. I don't think there's a use case for
> DoubleEndedIterator at the moment -- none of the current users of clist n=
eed
> reverse iteration. I'd prefer to keep the interface minimal and add it wh=
en
> there's an actual need for it, rather than adding API surface that nobody
> uses. If a usecase comes up, we can always trivially add it.

It's a double-linked list still, and `DoubleEndedIterator` a standard
Rust trait. Adding it now would spare us the trouble of deciding which
tree takes the feature when it eventually lands.

But even without it the series still stands, so your call.
