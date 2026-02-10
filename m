Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eILZK2z9imlyPAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:42:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B511119018
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 10:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2DD10E523;
	Tue, 10 Feb 2026 09:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OLxI79n9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012000.outbound.protection.outlook.com [40.107.209.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB96110E523
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 09:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qu+HajaXrabr223j1dlYfpQQPRob363GUeAU4cZIYWQdghmtD9inDVag3ltEzE1xiwUvaX/k4hKL/BL6lMLoaISLM4UmAlBItUbFn9Vs68/2zK66CCB5QhTsmyjnStGyuApbKW+ifFwLjWHQdesesYUupENcU3I9ltLTg0kx03WfqdlqqHOaWGOl5vhGfnertzfrtdMHkBI0Lo3X4x6Ejw7u75ZngCy90xX9v58RAY8PJYljDaPB5TsNx9Y5glDuVcHr1NgaS0XMN4+wMf2szKnzuenju0hJ3/pargSN9WBo6kBlXBebNmzDine0N3eRW0IEB5+v876KDp2CUZo8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxQl8w6t+1X3bzfXZ2YosoKQGpLbxcNdyvwT4OEq2DQ=;
 b=bSco77UEt8Kjx5qdu4UQZhUOczlofiNvKQ4TOpKXxeLcmFhx/InRIgttRwJbObImPFNHy/Fq3ImdeC0YoY5LYE2zqXyMAcQyLXhgWE71Wxuu58xYKXTcCHkt2bBKEBQn5UdxKdsjazTXC5ewHpvI9dzSExGjLhUVCXdr+0kf21Jli59BGCx0v1E2YkCjoKFrEoeBaZ63i13r7XEXqPl1vTHmFrVSnne66HEViaD9YZ3nk0LS6dNKhWKBzimAvFlzUjZEp7Frm/axjMw6Z9RMlCDIG0xv/YalCTPqNAgcDbrVNU2z+tiUZRalWvNqbJq4GQqnNdisKQh2mJIooJI/Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxQl8w6t+1X3bzfXZ2YosoKQGpLbxcNdyvwT4OEq2DQ=;
 b=OLxI79n9PgOHKvRi/LiTLgdyaEEB9baiZW6LjbPJtJfZqcL6+IggI1QYJ5BexDIJdGPAusncZoyshMdg29XHXQcISiENVFSR5ugsq1qS01zKZzg6Ql9rj/pmi7ZeG7JJSXm04WAiM6bUHT7r7Js9wg0Yj5Oh9gC4stzqc4ic57BLyOi1BSLdUZBhw1h7eZG/As5nJOJI2CYzZBY6lFES2+CfeJUBnyVjJpiAGGUBmUEvyR4xFL/RzqO3qkBVF5PPfsl0T76E0AnpmE10u9poRSaHp769GAqYM/7OSeqZ3A4EtyTsos0TDGlAYtVD18yNdzcd1NaFJCHEj76qRkdLSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DS0PR12MB7827.namprd12.prod.outlook.com (2603:10b6:8:146::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.8; Tue, 10 Feb
 2026 09:41:49 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::2920:e6d9:4461:e2b4%5]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 09:41:49 +0000
Message-ID: <ce09c3f2-4295-4e5c-b3c2-dea034206bc0@nvidia.com>
Date: Tue, 10 Feb 2026 20:41:42 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 11/16] mm/migrate_device: add THP splitting during migration
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-12-balbirs@nvidia.com>
 <e73bdf49-0a6e-4e82-9727-3a241fa9722c@kernel.org>
 <13f3fcda-7328-4aa5-afc6-75a294a82b2a@nvidia.com>
 <76750d20-cdfe-41bb-a228-9b3f171675ec@kernel.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <76750d20-cdfe-41bb-a228-9b3f171675ec@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0011.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::16) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DS0PR12MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: dba6005f-f3d2-48bc-9174-08de68889cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjBPb1FzYUNnYzZsWnFGUWE1UnR5NGIyV3dDSUlCdThrZEg3ZTlQYzlRQlBQ?=
 =?utf-8?B?SWVSdWFRNjdlYWowUVBKS1ZPN2tIY1A4bk00cW9YRXkzYmRZTzVYbS9mMlNL?=
 =?utf-8?B?UlZ3Q3c3ZTd2dVlTTXM3bTBLeUk2QTBFcm14QkZYME12MFMrQWwyRlU5Wndj?=
 =?utf-8?B?Z21WOEpWcEZaZXhualBjNHM0OHcwVmFCeHdLWWVxK2c4Rjc5RXdoQVMyUEU4?=
 =?utf-8?B?dWRneHpzbUdCMjhsd1k1WU1Ca280YzFQeTQ3ZjdoeFYyRVVzTHN2cjZyTlNT?=
 =?utf-8?B?c2R4c1JFemp1clpEQWNHb092RE50REVsWnJ2MDM5UHo3czBINlMzQThpeWpW?=
 =?utf-8?B?YVBSTkZyQS9wNmRhejNmcW9BWW1XeEt6cklOTytaU1JjcitIT1BSMjJGNGJO?=
 =?utf-8?B?REpSM0VYWU4vWUxGemtwSnVVaGZlR2kyTWs3RUVtR0NyWlJKV0FzZkhXc2d3?=
 =?utf-8?B?TW1HRUs5TUQxd3paQXhQZGlCaHUrNUNVcG1sV0xrRGszYmdBUzYwTHRuM0NB?=
 =?utf-8?B?WlRyQUYrK0pweEVJdDFCMjJrY1JYd1lwQXc3Z2lQUFJ1alZwNjZoNjBIMFFU?=
 =?utf-8?B?T3NjMU1SRGlvSDJma0tKS25pV0JSQnEzR0xYeUZNUisxNGc5bUJvdjNxT3l4?=
 =?utf-8?B?SERld2hJS0pBQVVHeE5kTjQreVNSRFFSVktqS21CUHo5UnJ5cXZWSm1NNGJW?=
 =?utf-8?B?V2FEbW1lbWF1LzNmQmNEdTI1V080L2ZOaGVXYWczcytDZVA0OXBvY3pDVTVY?=
 =?utf-8?B?ZXIxc0ZQYVk5YytjWlZleFBYRmpTWC9DdDdSaC8xMzh6Yi9yZXBsaTUzc0h1?=
 =?utf-8?B?dVY0bnAwdFRYUFJzK1RLQnZCN2xZQWZTTzNBU0U3QXFPVjgwQlJjYnVqa01i?=
 =?utf-8?B?NnViVytiV2N4emlWZkQ4N29RcGZjWVhNMVNvNnZrMUQ3NXovUWQ2czZwRnVr?=
 =?utf-8?B?QUVUMWpaeXJzSllLRjNFQWhmNFNvZDgrQk9KRjVVTUc0MUp2T2lPRmRuQU5G?=
 =?utf-8?B?SnI5bEcydWY5VFVZVXdxR3lyMCs3Y2w2NmkwMlovYlNXUFVpN0tBU2d2M0Nu?=
 =?utf-8?B?dWF1UEhqK3JIMjlmQzZpd3JENDhZREE5cGdPZUU0ZU1scUNVRStiN0YzdHVX?=
 =?utf-8?B?UVAzYWpldVlINHl1VDh2NVp4em9oS1crd2grNHZUbDB2R3JteXowd0U5N1Bv?=
 =?utf-8?B?cTRsQUVvczdob2N4aEJhelFRYWVpY3FKbVRSVWkwQ0puL2xqeUt0dUdmVGww?=
 =?utf-8?B?a1M3dTQwWnJSODYzRmluWS9MSllOb2tFVWIxckxJZXVuY3lWRzJxei8rSGYx?=
 =?utf-8?B?N3FZVmhMSEtLN0hxbjBNYjA3SUwwdkU0Q2cwTTdjSlVjcTNCQ0x3b3VtM1Bu?=
 =?utf-8?B?ZWc4V2ZuOHlSTmV0L2Fxd1UwcTBNS2xhYUh3VUVBbmRwYWJoOEREZlJPTERO?=
 =?utf-8?B?N0lxVzVsUlo1L1FRdmNEMDVDZTlkdnpMbmlLTWtKTGtwaEpodVNyTmdpNHkv?=
 =?utf-8?B?OGhTQy81cm9KeUVOcHFJUmpmWlB5M3Rvb1NnUUZxRzJhN2RGT2txMGwrbk1X?=
 =?utf-8?B?QzhoK0dGa2pQa04zUDR0WGoxbVYrUkNIaXNvUE1Yckt6Vml5eFVDWGJVUFpt?=
 =?utf-8?B?em5WbW8weDdVdmFVUUw2YTdKOFM4UEVjdlVKWDZwcXhqenZJRVB2aXNEV0dU?=
 =?utf-8?B?TmVRWWlKcm5zQVFheDlaWldrR296WHFGT0NQZEhxdVBEZVF0Vk9BTGgvUk16?=
 =?utf-8?B?a2lSamJYKzJ1d0E4dkRWY3BUZTlZNnhEOENUKzlKbzZWMGU0M09ONk10azdF?=
 =?utf-8?B?ZDdxdDJJNE9OcXI2b3ZHL3FocEdPMFFoYWtlQTh4NjlXZDNYdFI0eEhTYWJH?=
 =?utf-8?B?OXI1MGY1Q2UzODVZdm5pWjduWlNnNTdKZ0EzeEM5SVlydzUrd0lEWFo1VXpY?=
 =?utf-8?B?cUFYNXVnalVaalN5SlVjR2tOdHB6OGlCZUZuWHJXMUNDemo4YU1EOWxXVTFS?=
 =?utf-8?B?Z0hFbU5lVkV0cTBUTzJIMHpFNllvOVNXcXVpQWV3bjRweE1hOWh0bUpBMERN?=
 =?utf-8?B?SnhENkx0NEM2RWVXQU5TSDhxSUloNDE1dEZieHhpV0Fmdm82UDNlSDJwZ3Zh?=
 =?utf-8?Q?rmtc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eG5XWVdpWEVZOXp0NmRVRlh3VVV2dFpoWlUxc1grVURIdEgrQnJFaVBBcWxa?=
 =?utf-8?B?T2pUbmRXUXorWG9XYWhBQW05UXplVVJIdis1aFhiaTdiZ255bW9qdjVldkpL?=
 =?utf-8?B?SmNJK3FveXEwZnlSRzVQbjZHTjlQSHhtR000bE1GM1E1VG5zT2tuVzlPRjF3?=
 =?utf-8?B?YVpKSUJoZElBeWxINm95c1NkSXdwVW9NMGpTVUlLMUdZeEljOFRnalg2QUp2?=
 =?utf-8?B?VzlhQUp6LzhPQ0kxdk9ROThGTWxPdEs5a25JNjdPNjBkR2ZHRXpIMDh6bzM1?=
 =?utf-8?B?dXhmNzFmajNiWk1pVUR4VG5TSWdTdkszR0c5aVU2ejdScDM2OHVQalJxNkNj?=
 =?utf-8?B?cTA2UG5Ld0dzRnBiZ3dxTFFRYnZIV1FtWGJnSnM0d2I3UmtvQk9MKzBhL1FN?=
 =?utf-8?B?ZklCMnhNOWZpMFhFS2wxVFBjZEd0bkljR1pxNlNwY2hSeEFZSjhURFJpYmRi?=
 =?utf-8?B?V0hSVlh3Zis4bkNRM1VuQ29FazFjSUpGdE9WNGRaM3Iva3dQWlhZMlBtTEtw?=
 =?utf-8?B?RGJTQTN5Wk9Uc2Z0N1pEOTJIaytxUnd5Vnl5QmJGMWlQTWhuN0FQVCsvUFph?=
 =?utf-8?B?Y1FTemp4S1pqZUtwbjNxZnRxTXI4VXk4Mkg2NnpSemdDM3liL3ZGN2RBaDhC?=
 =?utf-8?B?T1pXWXNoQ0dWQmNRa3RzNlZtY0ZhSExXRGlPQWR5RDQ5YzJldnVMYXRheDd6?=
 =?utf-8?B?WTJVVnBFMlFJUjhnYVltMi9wc3liY1FDUXpZZy9kTWZWWTFsQ3VjMlRxQjRM?=
 =?utf-8?B?WGFxakQ4ZXFXQlIrMDJXZzE5Q1p3aHlmZ0UwanE3eUxFZFdXMXkyL1FZNHRG?=
 =?utf-8?B?eExldWlzOWR3YUZldWNBVmxEWk04MHNEM0ZQbFlER2RhZXEvc0p3aVBlZVY4?=
 =?utf-8?B?OXZNQlFnMjArMXAyWGczc2VsaU5FQlRMRGkwS3AwRk5XamR3M0VaWGxydjlx?=
 =?utf-8?B?SXo1VFplSTZzeE44ZkpqdTRjblQreFhYNXVOSU44YmloZjlPOFBEN1JXcjBN?=
 =?utf-8?B?YjBRbW53Zy9MZ09raFBZRzZ1dmNXbFcxbEovaUJRTkl1eFp6TW01Y1FoQllj?=
 =?utf-8?B?VXA2QWhKaXd1d3JOdVBYb3Rac09BMFU3WjgzVXhob3JyWHV4UXpUbFdRY3Jv?=
 =?utf-8?B?U0pOMEJtdWYwRDRjTkVUa3NPVjRJVi9ha2dScHlTQ2RiZWh6Z003UkN1K0NR?=
 =?utf-8?B?N3VQbHh0K0V2V3hraGVHcUo1UndQcWhYUWp0OFR6dFlacTZhVW1rb0YxdTN5?=
 =?utf-8?B?VThOSkZTb2JINjl1cnpUV09PNTJXUU5EZmVwYjBtdFkrTzNwcjQybEhuN2hT?=
 =?utf-8?B?NmYvUmlwdXB4R2lpSlNabVFRdHNGSUhPWjVKdmVSTXg4SEtDTDZvOWQ3MWZw?=
 =?utf-8?B?eGo2Vk9RcWdvdldWRGFQb1hNWjZDOTBlaTFyZVdiQ2NLY3J1Zy9OMmgxZ0JX?=
 =?utf-8?B?VmhheE5yMXY2V0FMYktjd0g1UGhienpSZXczZTkvMEZKamNEQzlNMGJCR3hx?=
 =?utf-8?B?OEp1L1FrYVZ2UGtvN3UwQjRCUDhsTWZlYUx3Q3I0TWFHSnFmcDBzVzhEcSt3?=
 =?utf-8?B?Wllsb1VOM0kzNG91SzBQTlRBeWptRlJRc1N2ZzZvQkY1b3pKYVJpUTlleXZl?=
 =?utf-8?B?SXRuYTBiYW4vZU8wQVlOSnNUdHZrdVRIWXRlWmtWMVJMTXZXaGR1T2pMeDlS?=
 =?utf-8?B?RWV2TjdLZlBYMmtnL1FUSUlOSGZ5ZjVTRzEwTnFOZ3JTdGlzSmNmVi9mVEkv?=
 =?utf-8?B?Sm85azJwRnd1a0RyOVhlbmo1ZkczbnFyYnR4dkl3a1d4OFZaS3kzL2s0VnRT?=
 =?utf-8?B?VHE3cmtQMDdhNjZ4QXl2NWR1UzNFNDNGbFVqOHlFQVJTUWc4eEVySVIxNHh1?=
 =?utf-8?B?ZytzTUxHWjJPMmdwbXVoQ2tzcnpQZVJ1L1Z0a0lmdzZtbGh0TVNYY2hleU9t?=
 =?utf-8?B?QXIxK3BZbmQ0eUtENHJOZXJPdWFhZ2ZwUzBtNVNGUzg0YWlMOGF4dVJvaU9P?=
 =?utf-8?B?RXpYSTl1WVdNa1hsZllYSlA5U2JFeVczM1R2K3pKYnk4MFYvcEMyeWRzN2pJ?=
 =?utf-8?B?bWVwMmJRMm1oM2FzNnJJZUgyMGJPeFFlMmE2VDJnbFZma25DeHZxNkx3VGFR?=
 =?utf-8?B?aTlObmxlYWNDSFdCa01ua1BpUkMrT1k0T2JCeUtaWGpzdjR6SDk2N25PQ0py?=
 =?utf-8?B?WlQvREZ2bXZFdStYVXFvMGh4QkNBZTBWV3k0QTFKeDNZYTl4Qm5QNlhYdG5Y?=
 =?utf-8?B?cFFrQzRLYzNEbHFKSnd6bFJWNlA2enlLd1ZoOW1aREt5eDNnU1pjWm12bjJv?=
 =?utf-8?B?MktqMkE4T1YwTjBRbEpFZ1R4V3ZBekY2bitjSUdPYW5STE1Ea1dGcWxHTXhQ?=
 =?utf-8?Q?Np5x9IUCzhqTUW2khtxwM9/o/cA2qFlIBgu2hRuV2PQju?=
X-MS-Exchange-AntiSpam-MessageData-1: xDC2Yb391mlGUQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dba6005f-f3d2-48bc-9174-08de68889cff
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 09:41:49.3564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 51yAbf9iG/DiEYZrXV/SVVfmGLuPq9YFyqwBAUapG2ZX+Z3/26OWV6Gjtb66bSGcS/lAMnnDiH5MgdGsHqWkaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7827
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
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:ziy@nvidia.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:osalvador@suse.de,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lyude@redhat.com,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:rcampbell@nvidia.com,m:mpenttil@redhat.com,m:matthew.brost@intel.com,m:francois.dugast@intel.com,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[balbirs@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[balbirs@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,nvidia.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,suse.de,oracle.com,redhat.com,arm.com,kernel.org,ffwll.ch,intel.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1B511119018
X-Rspamd-Action: no action

On 2/10/26 20:39, David Hildenbrand (Arm) wrote:
> On 2/9/26 22:57, Balbir Singh wrote:
>> On 2/10/26 03:00, David Hildenbrand (Arm) wrote:
>>>
>>>> index 8c95a658b3ec..022b0729f826 100644
>>>> --- a/mm/huge_memory.c
>>>> +++ b/mm/huge_memory.c
>>>> @@ -3463,15 +3463,6 @@ static void __split_folio_to_order(struct folio *folio, int old_order,
>>>>            new_folio->mapping = folio->mapping;
>>>>            new_folio->index = folio->index + i;
>>>>    -        /*
>>>> -         * page->private should not be set in tail pages. Fix up and warn once
>>>> -         * if private is unexpectedly set.
>>>> -         */
>>>> -        if (unlikely(new_folio->private)) {
>>>> -            VM_WARN_ON_ONCE_PAGE(true, new_head);
>>>> -            new_folio->private = NULL;
>>>> -        }
>>>> -
>>>
>>> Balbir, why did you drop this check?
>>>
> 
> Thanks for your reply.
> 
>>
>> Are we running into this somewhere? This change clearly seems unrelated to the intent of the
>> patch that made this change (by me). 
> 
> We stumbled over its surprise removal while discussing something related.
> 
> I thought you removed it because of some ZONE_DEVICE magic; the check has been proven helpful to catch bugs in the past.
> 
> We always document carefully what our patches do, and why; and avoid doing unrelated things in our patches where possible.
> 
>> I was seeing new_folio->private as NULL everywhere during
>> my testing and so I removed the check, happy to bring this defensive test back.
> 
> I'll take care of re-adding it if is still useful after the other ->private changes we are planning.
> 

Thanks!
Balbir
