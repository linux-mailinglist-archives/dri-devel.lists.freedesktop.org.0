Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +AgpCBLQmGmcMwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 22:20:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7110916AF64
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 22:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3710D10E092;
	Fri, 20 Feb 2026 21:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nQAxXbm5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010017.outbound.protection.outlook.com
 [52.101.193.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67E610E092;
 Fri, 20 Feb 2026 21:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOy8tb2nyCh90ZuUcKDZ3J6odMMVTLBot3YoKu+9O9C/A0F2knYWN0lQ/UqGhfrUuPsH68h1t5qn2DIChi/PRrnPtVZ3elo8Pmh+IZoeBFl3f5nWRZYycDhvXvSIQGYcWG+PsynpzZRxk3A2XyvH+s42HXa8vrUa861Yp264zJX2Ff+H2Z5TzpfWuCgwbxnKtB7M/PW8Bl7EzOhweC7qT9p2O5STVyx5+6n8cttsXZnmLPa1I0fOpjP4wwIolUMg0N5mNCvHDj28uT0Z6psrdzBHpyfS9LHCbTPlsVsfj3q193OxR3fNxJh4bMzwM3UtDq9xEBND+1IeZASJ5v5S6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4iEPJ1l1Hoiw1ReTimmiyqBUB1MU7hT4Cliu3QnR8hc=;
 b=t/cHoPz7j/7JwIjXV93b3wSmYODm/JvtOh4HJRR9arfiSIP/oau5SgVRXFmxeGOw44V8pcn4ti/JRQ1A2cVAr0H2UbhwQMw8yxJXsMhnWFZ1KV7L77CQ45z04UIF8ZqHy8qufnZwZAr1w6ZtJNAgrLCor9u8oPjMpaLJvUQtX87JIww44RVcXETCi069C2UYJZaQBceLUFye6stixbLph29wGUnsWnfF7CgOWHipE4T6+/M0+UMqy7f5o12wgUmYO25Rdx9aB8BA4TRB4j0rs/MWKBn8E7cvkUO8jFZ+sYEZSkd3NMm3snVf59zLxrxRJhjLZD3IouBaY2MgEwLiVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4iEPJ1l1Hoiw1ReTimmiyqBUB1MU7hT4Cliu3QnR8hc=;
 b=nQAxXbm5bvycUCEgY7j78wyPHMsngUZ/jjCAYo7IkVZAqHAUyMP4SCwq/mJCNT4ZjUTlTHNUidq9XCfNcGMTGB/OUD1jxLdABJjWT74XLzgYmlrVcBpiFVpohRNTUh6NiU38LVXwIh82rzS4VUu44gaReeM23vvP6vjvZt+nyf92CVWQou5eJolEGuubcqBQKIsZSqG0nKAJtEMqlFAPNjrlEaktEzICrzXyDxpHswD/09Uhu0bKbuIgA4N7KxXnpVGo8bmRntBhaOqZH0XT+tfyZzb8q0dzOnMLsGAXu0blP3X6Kv/BpdBdtdyDmO3u8v1UQhbbKc0PGJ8QgamLBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 MN2PR12MB4096.namprd12.prod.outlook.com (2603:10b6:208:1dc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Fri, 20 Feb
 2026 21:20:07 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 21:20:07 +0000
Message-ID: <f5627be1-0598-4ee0-9146-7ab9d1bdd0a0@nvidia.com>
Date: Fri, 20 Feb 2026 16:20:05 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
To: Danilo Krummrich <dakr@kernel.org>
Cc: Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGJN74VW6HS2.29CXZ59K9M220@nvidia.com>
 <ece7e6c1-f91c-4e7f-801f-28b228bddf3a@nvidia.com>
 <DGJWS7GBIQ2H.3VSOWO6T8Y482@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGJWS7GBIQ2H.3VSOWO6T8Y482@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN0PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:208:52c::20) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|MN2PR12MB4096:EE_
X-MS-Office365-Filtering-Correlation-Id: 023170c2-45ea-418c-8bf0-08de70c5d26f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UlAwL0QzNTVwc0dETWZ3MVA0enYwT01pWjhjaGUwL1R4Z2xnM3lZTzNMY3hu?=
 =?utf-8?B?Y1NGSnByUnI2U3l3UlRHeUFyR1Nic3g2UHc5Qm5KQ3QvYXBoTjZKY29JWk9B?=
 =?utf-8?B?VXBhSU9ENXVsOGZidjlTWldyVUNGY0ZKaklQcGcvQ1U4YmRmUWloL3JmSjlh?=
 =?utf-8?B?N1NPSGkxNVkwWVVKdmFaejBDSCtvbWVDUkc3a1RNenNqM0psNDAyZzNKNEtP?=
 =?utf-8?B?UlYyczNMY1NDZlozTksrR0ZxS0JLYkJjNEYzN0ZTdVVHaERPaHZhSDhHdFNj?=
 =?utf-8?B?Y3F5K283eGxQZ0t0dGY2Vml6Z1FxUFlUeGp6SE1HWTFnYlljaXRPeGRna0lv?=
 =?utf-8?B?d0Z5ZDVyakFGNzRPMXJhQ291czlJbFhwR2hkeFV5S05qbnFZRjlENnVCMHlM?=
 =?utf-8?B?ZjNnRkFsZjl6b2tqSUdxMnJUak1pUEFwaEJMWUlPTXY1ZnltZ0Z6YlpaeFFt?=
 =?utf-8?B?dWdFMjBtUjlEOFhuditGV2tqWERwSFRoTmlOY015b0E3U2RoQ2dUdyt3VjlB?=
 =?utf-8?B?M0tjckd1VE9uM3AyelBDRGNtL0xHV0picjZQeGhWVTBjbEltU0hoYVpyYlFB?=
 =?utf-8?B?VnRhTTVhTms0YlI5Y0VEZkpJQVUwVGxJMk1vMG5FVDhBeDI2UktvbTJ3aXlU?=
 =?utf-8?B?bFZncnk0czBZYUN6SzhTTFdpRGlxamp5UVVNZHQvclJDa3hVQ2VNY01UNHA4?=
 =?utf-8?B?eUpiU0lHeTJyZzNBWXNhVS96SHpkOCtpV1hqaHMvUk1JL014cnV1STl1ODBE?=
 =?utf-8?B?aDY2ZGxGUXdwMUVNc0xuZVV4bTM5cHo0R002MVJVMVlTOEZ5T0loYm5zcDc4?=
 =?utf-8?B?TEYwbTNiaHFlY2lWdEZPOUFLY21EU3pxeWNxSEZTaEVEZjcxOXZNemFRdFJY?=
 =?utf-8?B?VzhyVnRVN2J1V1NJM3NLYnhpcTRwU25kQjkvcmNJeDFaL1Y5Q3BCcGZHYkpH?=
 =?utf-8?B?ZHFCaFJmVzlob3lIMkRwVmdqKyt5VGZnNXJVZkcxSWZ0aG9Ndkh4dm5wckUy?=
 =?utf-8?B?WXBWTFNKTll6aXFPeFowRE82OGVIa3RSTm5uUDVCK2grUHpiOFE5RFFQOWZD?=
 =?utf-8?B?SkdlNVp4enFRSVA0dGhUWDYyVktrWndUWWpXMExRVm54N21kVXZobnFDQ3dz?=
 =?utf-8?B?cS9CZEpicE0xSDU3RDlGK3lWSFRKZlU4NjdHSjRzSis2bHF5d25hY1JWM00v?=
 =?utf-8?B?STNqM0g4OEJkaStXMU5kQUsrNG5Dck1kRnJDYzYrTU9nUTZaL1Z1QUxwRUNG?=
 =?utf-8?B?M1pTS2FyVG9pYVlrcFg5Lzg1eG9TeVRrekFtNW01T08wREphMHhVS2NrTTJJ?=
 =?utf-8?B?NGhwMFBoT1NLREExSFFpUWNYdWpaazZHakozSGdXNTB5Um5DSW0rdnlqZXBP?=
 =?utf-8?B?V0VNK3ZOK0hvNU9uY2pQU0oyUlpkcTB3czVmOGtLZkhsNU56Z2VOVk0vWURz?=
 =?utf-8?B?VHlnNWhrbEpkTldNL2t4aGU2OXFsbGNFWWtYWC9zVWFBL1JGa0labFVKTFI4?=
 =?utf-8?B?U09QRURwZTBUeCttb0ROdlp6aVlzd2ZXYVhpci9GdThYVVRZV0J1VFkzZUZB?=
 =?utf-8?B?a1NDenFIcWpwTTlCOGpIRlRMZlF6SDJlTEhGV0o3cnc0bGJWcXZPVEhyU1lh?=
 =?utf-8?B?MVpJaWxlVDJxcWJ2RFRMOUk2RFQxSnY4dE92NnNNMzA3NmR0WHY2Z3BkNGhj?=
 =?utf-8?B?cGwvQjhMazJjc1JvM01NM2NlSW01VE5jWUthYnk1OXpRZkM0L3hiNllpbjJ5?=
 =?utf-8?B?VTdqdnZrMjkzdytkamhsQlMvdHNYTjMxc0hlOFJKRlhwOWl4R1RBaEtyOS9j?=
 =?utf-8?B?NVUwN3VoWG9lQ1lBdGs0a055UUZNRWVUekUyb01xMERBZHVMenBseS9TTWlO?=
 =?utf-8?B?N3BYUHJHTnJaazU5TzEyVFYya3plSHJmZ2pqNmNZbVQ0ZUxxWkYyWGNtZkE4?=
 =?utf-8?B?c2UwYi9yZXpSSHc1dWxBd3pGQlkzS1lqRG5SNTcwaFRiNFRkcDh6dFhXYmpj?=
 =?utf-8?B?Y0Rrd040ZlVDait3U3RIczk5bmhhbHlvNXY2UTFIcFJmOWk1S0FGcmExMFpp?=
 =?utf-8?B?WmJNU09uVFJYdk4ycUpUdTRNMUJIcHpZV2JWWEM2VzVmQjk4MVpSTGtvVTZN?=
 =?utf-8?Q?yZq0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TDN6SzhnRE9zY3ZaWlBMM2hJcjRsNnAySUphUlU3YmxOdmVDclhSaGFrS09t?=
 =?utf-8?B?dlFyRklIamVhVGppdFlyb1pWSWZwWGFjN3NKTlcrR0NHYUxTeXgrc2VONnVD?=
 =?utf-8?B?ZlIzcURqSzZueE1RTmZFcVpuTkhsYzR4c3FMRDBLM2hwQWVlVURNUm9HQjZq?=
 =?utf-8?B?cUxkZ3pzSlRPeXRXcGM1OXdtb1UrRTJEU05wK0dyNVdlMUZheFl6MTZMM0tv?=
 =?utf-8?B?bEsvanJWN3o3VStDNk9MQkFUdUh4eEVFNTN5K0FWcW5uRFJ3UmNNVi9jdHRx?=
 =?utf-8?B?ZUpLZ2lJQ0xZWmdUTzB1SFlheDlMRjA5d2pYZEJteHZiS28vRm83S2NZR0Yw?=
 =?utf-8?B?NkJZNVQ3aHlzUkF1R2EycFJLS2V4QXpTVHBvTnpzWVRGejBkdGRJc21UU3BJ?=
 =?utf-8?B?VVlUcTAyNXdWTVJUNnhkOXBvWnZwekNTR0hJd3laM2lhZmlRZDVzbWRUY2xC?=
 =?utf-8?B?aHgyMUVOYU1aU3ZMNFk1bVg0aXo3aTlsM0dZQVlDOWhuSzd0eVpSeGM0Lzhs?=
 =?utf-8?B?TUh6U0w2VWQyOVhWM3hLYWFXUXgxZGZjTmY1TnRDQWdyNFpyTHUrQ1Zra1dv?=
 =?utf-8?B?T1JKNzcvRXd0anNIYkpVRG1hRFhRelkrSmlWaHYzUFRTRGxQbmlXdnlJWEc1?=
 =?utf-8?B?bGZYWjZYY295QVlRZnhKNlJuV1Z0Vkk0eDVuTEpWK2x2ZDJpay9vNzRwWDha?=
 =?utf-8?B?SVdOcUZyblhtU29NYWpIbXBPRFp4K2k5UWtsQUJEOFdMeVJRS21JRXFKWnU2?=
 =?utf-8?B?bGtrRUpzeDBmS1hRcTNWY2JLcjNZbzZxOS9yUlpjSWFrbWxLOGU2ZTVJWGt2?=
 =?utf-8?B?Z21KWWRORnh6YzhrNnV2TmdTMTNLVUtDSmw3MmZ3RnBMVXpOem45Ym9LeXZy?=
 =?utf-8?B?UkxpWVJGWjB0WThYNmZXN2V2ZmUrRW1LRStSL3p0TjZHdDR1M3pvVzNkcXZS?=
 =?utf-8?B?VWhPRTdhVmo3QzN4dlJ2Zld5YXBtZmtSdWhYZ0k4eTd6WCsvMk1semxKSnFz?=
 =?utf-8?B?WTNiazlwTmt3WXVhdHhzcW9kVVFNVzZzblNnOUllMzErS2xwVmI0SHRsSFZJ?=
 =?utf-8?B?SWFuWnNkVkFsZmxFWDRBbGNaSFBDV1ZxK3N5VVpDVVBZZUZ5ZkpoTFhicG03?=
 =?utf-8?B?TGMxZXZBcEZ3YjlIaWliZi9ZWWJZZmpudUZWT0JjcmRXTjFFbEVISG9OWnBW?=
 =?utf-8?B?eFBXR0s1aHhDRnRQSzZnanQ1c3lvM0dvYjJTZHpTd0IwV1BLdWJDeGl1QUh5?=
 =?utf-8?B?WlhsNHVrTHVZVGRHc0kwZitlUjNhRm5QdTJsS0dNb1htdWVzTEZZbTc2clcr?=
 =?utf-8?B?RUJDMU5jamJ3QUl3amw5ODZObld1a3lKWGlvU2J5eFdqWjYvbmhpcjNTclYz?=
 =?utf-8?B?cG1ySTlSSk9KRnJzZmdaOXRHOG9ZVW1WcFFEeUlIdkg3dk9jQjlYRTJ1Qjdv?=
 =?utf-8?B?b1RhRnJUMWx0ZmNxRWova0J3QmlUZENzc25YT0Y3bUpmd2FLT0ZONGJUaEdK?=
 =?utf-8?B?SlVwaVgwdGhuZWpucVBwTmxjaVVCNk9mQ0pzeDM0ZHU2UXVxOWM3WnE5SkdZ?=
 =?utf-8?B?TFZRZEFSYjhTVE5yVWRWNERpYUxxNEw2TEtTSXUxVVQ4ZktjMmpFc3h5Mkpu?=
 =?utf-8?B?SEprd0lIWXB4aDdjTzRWRkdUblZhanVwWXMvOUhzMVVTUEFJdm92ajhDT1Ro?=
 =?utf-8?B?VjlGRUlRZDZsVVRZS2ljM29hNCtCbnJmNXBGM1ZpaGJxMlZlSkpFUkl5Tmdp?=
 =?utf-8?B?RU1BcnNhSStrS1gzTklpR3kvQlRRcStUdXZLbzZ4V3RCa1N5OFRwVUQxQkNy?=
 =?utf-8?B?R1pudFNSZTBaSWhST1E5OU9oa283eWxzTmthNHFOa09WNnBPZFJkL0JqV2wy?=
 =?utf-8?B?UHVyQW9sWjU2RGFhUDduOFFXdGtUemdKWUNKUVhvdk1vVkxTVjhmejNhK3dw?=
 =?utf-8?B?dCtiaTNmeUlVVkNwaWttRk1zUW9RcmMvOEk5cmlBbEJZTXdNWUx3NkFqbHhZ?=
 =?utf-8?B?N2Iwb1lSeE9iSk5pcFlvenJVc1NuVktaUnJVWlhJZXdOUHVnVG8xM2JSYWZE?=
 =?utf-8?B?amFCM0lHM1hWMGJoeS83emluVFZ2eFYwcmJQTlZDYXJBY0ZlOHBobmhER1Zl?=
 =?utf-8?B?Ui8xVkdvMUIyb0RFdUNSMy9pcnRqRjYxV0dzUnVxaUVHQWo1Q2d4SjJXaERK?=
 =?utf-8?B?eTFycmh0cFBwOFExVmRBbTVqKzlHbVg0Yk44YUNlUWs4M2dRaWMvaW1iNGxB?=
 =?utf-8?B?Qkw3QTRmTmpHdDdSU2ZPLytYbWFFMzhMZzBsdnFHZjlxVEhEbDV3UUZEUGRC?=
 =?utf-8?B?VlRhd3NWY3dJMVliNmk4LzRLNWFwVlhWazRyOTFnb3dMN041SVFPdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023170c2-45ea-418c-8bf0-08de70c5d26f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 21:20:07.6076 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WfA57wVNsCzxt4ZUiSsljYfxr6AHBAbRlpDGY0QS81Do3eIg7HyLaHdiC13nebKkUfwBu2BhAbuuNn/+LH11OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4096
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,buddy.rs:url]
X-Rspamd-Queue-Id: 7110916AF64
X-Rspamd-Action: no action



On 2/20/2026 10:53 AM, Danilo Krummrich wrote:
> On Fri Feb 20, 2026 at 3:54 PM CET, Joel Fernandes wrote:
>>
>>
>> On 2/20/2026 3:22 AM, Eliot Courtney wrote:
>>> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>>>> +__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy *mm,
>>>> +						   struct gpu_buddy_block *block)
>>>> +{
>>>> +	return gpu_buddy_block_size(mm, block);
>>>> +}
>>>> +
>>>
>>> Will `rust_helper_gpu_buddy_block_size` be used in the future? It
>>> doesn't appear to be used in buddy.rs.
>>
>> I think it is worth keeping because it is a pretty basic API the underlying
>> infrastructure. Finding the size of a block can be important in the future
>> IMO. It is only few lines, no?
> 
> The helper should be added with the code using it.

I will add this as a test case to exercise it and include it in that patch.

thanks,

-- 
Joel Fernandes

