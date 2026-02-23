Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NPCJEGlm2nY4AMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 01:54:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CEC171069
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 01:54:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49F2210E155;
	Mon, 23 Feb 2026 00:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tff7Ts98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013047.outbound.protection.outlook.com
 [40.93.201.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764ED10E155;
 Mon, 23 Feb 2026 00:54:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMYwU3jK1jLlOfSRLPvXPyDLgmzRTIQM3AszCHVzmYlicSt1zXm2I5QqGDy50xsTeevMNeHNQDaeDjAFeHnbGEHnTdugy64QPD+tdYoqz0B8mJdzRXZk5CkufE3lTUz8A2hKubwOPvbKJXO+5g+a15vZB6VmkSErbGS2zt4c7vN64XXSnk/MjwjXjMCs12qFByZ+C4ooK5rdL0/cepWIS67gBOFkNV9J0pW2MqGcotUU+GIkthuhaYYDtSc6lBPYboCf+hCiny45aM1l9WlUX0pe0dQjpLHNtGtaFBr0TxKpAtwTxgTu3jgzPkgYX0huE/5vsVmF7aaGr/l0D3AJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vrK6NdzArNO70dtefVbTm7eNep3Zntgjqm+YOmjR3lY=;
 b=DFgEgtC6gcC9TCr+fAEtM0p3I8sMdhVS+Vy6oIOurUyIJlkfTczkM91vGS9Z6Y0xCVstekMkcyUl/5BG+DGatE74JnT67zDPFT445IqiAaNuKcIFN9dQyzhl+MOLV1LOFvVK7+OARKPXBvxwR11zFsk4nDLh4e9/+5DA6TPdFi5Bh49tk53YrDHkfV6k4qLyLpOwehYw4tG6YAEm9Rn/KwyOB1Ho5dwi6te35FoQgqg5A2rL/ylcB3MkOAv90NC6nd+gU8J5haOCR4PtYh/p3IRKOtNDo4/ycj+D1kS4z2/KXAlgGZx6vpgslVx773yK6pFBCT7U3pCHXv5ZLyC8Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vrK6NdzArNO70dtefVbTm7eNep3Zntgjqm+YOmjR3lY=;
 b=tff7Ts98sZjy5OkJNtbzGSfBRm7OTaUdDNwz0IxKVMPnsBOrYhibPRELK52XcVUwV61Xob07uagU2Vt+xLNYtvQEeH40ZI+eP14wqu7O4zOEnxlt0g40VSHkHvQc70LYN2lAoaKNoXqQ+Br+NlppjNRU8PehAdDhoA4Yj/0z2iZtZXZr9owAe1Z74hMXIHoem5sFLXHmfURbcZpxU1xuiFaQjpZIPW941e4xfJJ7PQyWAHNhuHT2Vr9r9t0USskpiyWW7evcpFbGzdqNBl4QqwJ+sLZ6k6k4t3NwvSbb64elZYLBdUrJtchJy/VQXJL6ySfVF8z0kwIyVpgtzlb6aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ0PR12MB5675.namprd12.prod.outlook.com (2603:10b6:a03:42d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.20; Mon, 23 Feb
 2026 00:54:16 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 00:54:16 +0000
Message-ID: <859ee9c5-f37a-475d-81eb-6f9de6d34b4f@nvidia.com>
Date: Sun, 22 Feb 2026 19:54:14 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGIWDQTR76Y5.34L9IHKU2SEKI@kernel.org>
 <eadfa4662f403fa01f19c1c17a435c1a@nvidia.com>
 <15a193fc-b2b9-476e-a9f6-57e3a210b74f@nvidia.com>
 <DGJ2TNVD8AS7.2P0HYYKKE8CBQ@kernel.org>
 <4ad9fd6598e2688c88f6ef22c088c683@garyguo.net>
 <DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGJXYEXCYIII.Z6FOAA8YYMAZ@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0221.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::16) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ0PR12MB5675:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a2f064-1b39-4925-e1c8-08de727611c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzlWSWE1NHNZaTV1WUFKWFVTYk5sQ1l5TG9pK1FWZHJ3SGF4TVJhL3cxTGFs?=
 =?utf-8?B?VVFWcGVKWC9lTTRwaWFpQVF1aWJnSHc2NDRJdDN2SUdMMUpyMFNmTzhXN092?=
 =?utf-8?B?anFVVUljOU4rVGRZdCtwU3JlNzNjMmN6MjE3SC83MkxpQU1IVEF3K1l0Q2s5?=
 =?utf-8?B?Y3RMWHpVVGE3VTM4eDRpSVFUN29XOElnc2I1TWM5TVhNRWdCZHZjMjlhRFFt?=
 =?utf-8?B?VCtnSUxhYUdLTUp0VUY2QVpZQ2lscmxITjBKVVplckFEVnJoSTdIVHdMK2xC?=
 =?utf-8?B?Q1lpQzd1a09rZVJ6eWN4SUlUSDFBazdVM1hab0l5djlIeFRIS1FDeDZINkZa?=
 =?utf-8?B?WnNDMmlGTzVsV1Rvb2NjZXNPMVlzR2d1WUNsWmtDNjR5RGRFUzJON0xxZjNX?=
 =?utf-8?B?SUlYbUNvV2FwMW04YTJyT2lFNTlrU2JPK25PWDB2ZVFYcmZtZlB6eFloUjc0?=
 =?utf-8?B?ZDlieFFIaDRacUoxSTkxUWFKVGdEQ3RxRUMySHRFbUcrdkQ2ZWUxTC9NYnpH?=
 =?utf-8?B?dlZCR2s4b2RiVmlGK2t1TDR6bDBZWTJPU0U0enZrZytZcjlvMUVhOGlHUWN5?=
 =?utf-8?B?akM1MjNQeEJubkwzNE9SRmY5bktYZW5PanI5RUpSYVluQmxVZGhPbDBPUXVM?=
 =?utf-8?B?a2dxaVI0cjR3MXJHUDFtTkVxSXRNY2ZCam9NNHYzMUM1dDZWM0YvTEUvUDRi?=
 =?utf-8?B?M2I4QnJiekpUb280NThMUndhUmNUNWdQclBOU05oRWgyL3gvYmJibmJ2VURY?=
 =?utf-8?B?L1ZjbkJ0MittcGpNN3ZvTFA3TjFHRDcxcWFDUThMc1JoMTYzUklDdWswbGFh?=
 =?utf-8?B?bmZRVEZjSnYwQm9lYlUxSjRHb0xYMEI4bUJGZzhaNm4vSEptYVZidXJtaG9u?=
 =?utf-8?B?M1I5N0RSNWpDMmJyWHhFRm5SOGszMU1RZ1hzb3N1TXFCS3kzUktPdUMwTkMw?=
 =?utf-8?B?a21PQ1d5OHIrcHIrVlpJN3pOU2Z1OXZhSEhJdHkwK3RMaTNwOU9YUUVzcEpt?=
 =?utf-8?B?RkJ2cjhEa1Q4d085RTh3ZEZzR3lRT2VhT3ZsMWJuVFkwajVXRnJlRVl6aXY1?=
 =?utf-8?B?Sm1iU25ZeVJPWHpqcUxFM0dUOFR4dHFkV3BOTHNuZ3NnSGoyU0ROODA1eHgz?=
 =?utf-8?B?R3ZUSzJhcUZNRGJ0SzdZc0dXOUV2OUp2cHNjK2NtQ2hIc24rWm9DazR1emJF?=
 =?utf-8?B?b3NpelVkNkhaT1FaZW8wRUhscURIcFQwV3NkNThHVndmdmgvU1FKaGJVQ0xE?=
 =?utf-8?B?V0djalE2VWVMSnNmREd1Q005anA2eHN5YjA4blZqZEpMeDRUbkRzMHlrRG9v?=
 =?utf-8?B?bHNzS3p3ejIwazlyT2NuWGdFTFB5cnp6aEJYWlFWd0tRVE0vUHhrZmE3c3lH?=
 =?utf-8?B?TXhYdUI3TExjNm8zQWtJbHRkN1ZSZjFvNzhEdTdEbWY1dkZoNm55K0J1R2dV?=
 =?utf-8?B?WVJtbzAxa1pKQUZ2RUQ4Nlh2dFpTQ3pScVFKM3k5MHprNjB3bW9OSlpybitQ?=
 =?utf-8?B?WVNwVzkyUi9UNkJ1clpmZEdmdFlqUjVuOCswWGo0OHUvZHg0VFV1cHBBMVIz?=
 =?utf-8?B?ZHpOLzBjS1k2K2JudWNScVZqTldscWV4bU5GUmtKYWhsU3RXUUc5TkRqUXU3?=
 =?utf-8?B?WVJzV0dhSE5qUzUxWm5pd3FNelp4OGtNa3l3ckNBeUxEcDNWVkRzUVphdTNY?=
 =?utf-8?B?akUxcGJQaDFzK1RFejdtYkVCM054Zk5xQm1kY3AzRFZ0STdKY0prYzEzRnZK?=
 =?utf-8?B?ZjJLU1VQcmo0RzhJZ1lYOHRmQ0ZFYmVXREUzN2dkbW5td2s2WmZvMmhPYzE4?=
 =?utf-8?B?SjJTVVdFQXJPWGJsN2s4VVBPVHc3WGxhQ2cyblZGWGhqRU5lRGZhSzhNMVR3?=
 =?utf-8?B?YTlDTVYrM1g1QXp4UDUwU3cwdTJkRVlOOWlIZGZtdE9QQ1l5TmxXYlQzU3FZ?=
 =?utf-8?B?YmU1ZzRrQXRvTllna0JTUUdxMHQrdGkycGIxODNiUk83NEhqbTV2NjFGandZ?=
 =?utf-8?B?ZzBweEpEeHNqaStob2U3cngxL3BZNUd3ak9nSGFhcm5XQXdZaEhMalRhekZD?=
 =?utf-8?B?ckJrUkdQd1V1aTFaMnVZOG5KeWJzSEppU2ZKK0JzUzgrUHJiNW5SQVp0d2Ex?=
 =?utf-8?Q?JC0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NWFPamV0dlhkZ0UxdnJGRFJtTlNCT2plb1NYOUhXbi8waldrc3lSWEtHRndF?=
 =?utf-8?B?UTJpRFYvMTdaVEJUaE0veXRpenIxRjRkaTdLRVdoc1d2ZHpVMzQrbTRYOUhT?=
 =?utf-8?B?KzIxOUsrbnY1RndnemVMc1BmZXM4S01tUUFQaEhNUkhOamFKMjJzY1d2ZUtp?=
 =?utf-8?B?eG5zVTRvTGZtREZRYzRwWTNmOXNFMDZzSU55M0R2dmJmTk9GdGxGeGhzSnRR?=
 =?utf-8?B?Wk43VGVKYlJ5aHlKK28vMWhXbGpSa1M0Uk81SE5mcVcxWUgxd1UwNjdxcURL?=
 =?utf-8?B?dVc5citmaldhd0k4aXRJTnFJMVU1K0UrSVRaSzcvKzBvclFxcnlRR2xqN1oz?=
 =?utf-8?B?emIrVEZDSXQvajZrWHFZOGRoVElBZllLNFQ4NGNzZDdUelo4SlBBc2c1QUQ1?=
 =?utf-8?B?RG1ZSDMzdTBCbEhManRBTDMwOXB2YzFFRHp6aGhJVGVoYVdvRndMUUpCcG1N?=
 =?utf-8?B?bVBBV3hNNU9QZEJpcVVFMXNSSmswN3JDeklsNTZoWFA5YWdHR0ZwUVBWMlpR?=
 =?utf-8?B?bFJWMzZJU082cU9wRGpEUTN0cmo5ekh5Q0xpM25UT2pyRldRL2tEcGdFZUI0?=
 =?utf-8?B?NUxVMHVlZ2hFbC96ZE8xMjRLZ2p2WENYV1hlUFMwUStoYWlKekxua1VaZlZh?=
 =?utf-8?B?SFZrRHJ4eklZQVZBYUxrZFhicDBGTXdjODRSd3FkSk9LU09PZXJmakZBazJR?=
 =?utf-8?B?UGtyTGFLVmFKc1gvbWtXN2YzNkhFSjlqTHdFWUZiVzhydlRDendkaE9hTDVT?=
 =?utf-8?B?TUpFMVFvM1dqd2hYVmlFUE5uMEhYOHZubHZROE5hT0xXa0VTWnl6eWpBUUNI?=
 =?utf-8?B?ajZiRjdMdHM3dGM2Nk5WSXlLOUZza0YxMWdZMXZLSTNSYmxSbVhlMmVPSGh3?=
 =?utf-8?B?eWkwa294MGRsODRPQWpxWUdHZzRVU2NGRG02RTFkdUd0VVhXTnoyQ3dsVjF4?=
 =?utf-8?B?cEV2Nlk0YUhsWHVTOTdZMHRWL3RBREVKdHNucWhDdDYwTjBkZkpKd0NXdkV4?=
 =?utf-8?B?UXRZMU1nVWJmdi8yd29qL1JQdERSZnpudllHcWZyTjdUL0d1dFJTd3h5TzdT?=
 =?utf-8?B?K29ocmdlamRlNjJLUnkxTDlEU1g0K0NGblJ3N01QVmhZT24weGxUZnhCaUFy?=
 =?utf-8?B?eEF2b3o3K1Z5MHNvVXIvOWNJTVd1Z2xuQlVSdlRoSjM1UTRKVG8zRDVaNmZh?=
 =?utf-8?B?RGIweXhtUkpvWWVsR0JvYVBFd0h3Vks0dFZzZE0wdWNjaWxOM2RKbko3TnB5?=
 =?utf-8?B?c0toOHYxTWdEV3JneGtnTEJqN1NpQlY1QnE3cmFjR1ZVS2RkR2JuTnNaSlBh?=
 =?utf-8?B?M3VjMlBLSFBjWFMzOGN0QmRwd3R6d2xoQzFWbkxmUXZmOW8rSGRYOTBJempI?=
 =?utf-8?B?azBneGhONUZQYTF2TEdraVZjU1NVdVQwcUlSaXUvY3lKc1NwVkdDQkpnY05C?=
 =?utf-8?B?R2FlMVRNY1BKWlZoN0ZHZWk5ODhkWGREemxhMUNGaHZ4VzcrcWpiYzJ0K2RL?=
 =?utf-8?B?TUdRcExsQUJpaWRkZTJKZUFtT3V4Zk01SGNmMm0vdFEydHJ5NndQWEcvUEpV?=
 =?utf-8?B?anR0K2tnUHhiNkhVMk5FdWtCcG91dTVtdzJwYzRQNFowVzhkNktCVTgvWFJO?=
 =?utf-8?B?emZ4SDNiWWt1eElEWExteTJhUHZWdjVoZUdoY2gyM2tSVHp3cUNQTExvVDM4?=
 =?utf-8?B?cTU4YktwdHVzM3ViQ3JLYXVvOVRhd1ZEengrS1dBeitjaDVEUjZtcER6TU5Y?=
 =?utf-8?B?ZG9mN0trZmlPd1lJL2RJck9CN1FQSFF1a2NRSFBwNlVCN0FBZ0lQcmc5UlpR?=
 =?utf-8?B?eGk4OVJQWGI0VUxHejIxR2lhUG03M0h5Vkp6RUhvYm4wbFdkMjM5bm1sanBv?=
 =?utf-8?B?NW93RmJJV0JYYnRNa0x2akdOUzhXMFFEN0JmNkc2OHJzelFQcFpnVzJsalBZ?=
 =?utf-8?B?MUY5a0dSMGF5cGl5cldmQ2x3ZVRLYzd0bVRsbVBzekZnQnRkUXBmV3ErZENy?=
 =?utf-8?B?TWl2RmRKYUd2S1NxRGtFVDJSa1pkeTM4TGovR0JwT1B2bG5CN1pVc29laG53?=
 =?utf-8?B?dDhJbGZpbHBOclMyWFBqSUVLNVAwWERmNURqd21uaVA0SVVOZSs2T1Q2RWcv?=
 =?utf-8?B?a2dHZ1hjQ1FJdWVjdjZvczZEaGc3WG1JSVBkRit6dEZHUXRNaE1ZNGQydko3?=
 =?utf-8?B?V2l6Nlp5NDFJU2RuNzdZMUFoNUpjVHlUa0RNanJoYThTN1hhc29RNXpybDlC?=
 =?utf-8?B?ZHh0Nnc3d2dsSVg1bUt0UFVLak16RTFTR3pUd3FmN2hmL05uUHhjcm51bDZu?=
 =?utf-8?B?ZU9CRSsyZ0hEMUIzUkpibWFzVmxLSDh3Y29ZaytBRWJJTlVFSE0xUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a2f064-1b39-4925-e1c8-08de727611c4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 00:54:16.4652 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4WE6qpzihtxDMo2i3Wz3Hsw33DzAWz08OQXiyUcjqIhoeOPLyuSrB9rL5TnRss6kO+pE6Qu/LJodCkjRZ7CijQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5675
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
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,protonmail.com,google.com,umich.edu,nvidia.com,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F0CEC171069
X-Rspamd-Action: no action



On 2/20/2026 11:48 AM, Danilo Krummrich wrote:
> On Fri Feb 20, 2026 at 2:09 AM CET, Gary Guo wrote:
>> On 2026-02-19 16:24, Danilo Krummrich wrote:
>>> I feel like it makes a bit more sense to have an entry for the entire class of
>>> "RUST [FFI]" infrastructure.
>>
>> I don't think so. Most of the kernel crate is doing FFI. We have a `ffi` crate
>> defining FFI types, we have `CStr`/`CString` which in Rust std is inside `std::ffi`,
>> etc.
> 
> The idea is not that everything that somehow has an FFI interface falls under
> this category, as this would indeed be the majority.
> 
> The idea is rather everything that is specifically designed as a helper to
> implement FFI interactions. (Given that maybe just "RUST [FFI HELPER]"?)

I do tend to agree with Danilo on this. Unless someone yells, I will change
the maintainer entry to "RUST [FFI HELPER]" for the next spin.

thanks,

--
Joel FErnandes


> 
> For instance, this would also apply to Opaque and ForeignOwnable. But also CStr
> and CString, as you say.
> 
> But there's also lots of stuff that does not fall under this category, such as
> pin-init, alloc, syn, num, bits (genmask), fmt, slice, revocable, list, ptr, assert,
> print, arc, etc.
> 
> There are also things that are more on the "partially" side of things, such as
> transmute, error or aref.
> 
>> I feel that the FFI infra is the core responsibility of the top-level Rust entry,
>> while specific stuff can be splitted out.
> 
> I think the core responsibilities are compiler and general design topics, such
> as abstraction design, (safety) documentation, etc., as well as core language
> infrastructure, such as pin-init, syn, alloc, arc, etc.
> 
> Given the definition "helper to implement FFI interactions" I feel like we have
> much more infrastructure that is not for this specific purpose.

