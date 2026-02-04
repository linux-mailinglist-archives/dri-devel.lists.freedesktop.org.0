Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C1yCl3Zg2nEuwMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 00:42:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE996ED53E
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 00:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F9D10E393;
	Wed,  4 Feb 2026 23:42:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q6HQLuVs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013041.outbound.protection.outlook.com
 [40.107.201.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA2710E393;
 Wed,  4 Feb 2026 23:42:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tv8p4tBeMcCYY1o9BHFe/MnGByHQpCCDVIoz5BelG/euQzy2CmFY4dFZ4Z1pdBTrwHkWkBp7OKqmscDp+HLivv2rQQCx29gA/sL27kj5Hgz0OKwYDGaN8aIxFdjYFUDnfCJ3CiPxQVWQKOnSOtG32UB0Ub8COxF3ZRTQWeE6DwjqPZP9F0c2hbsPJXUUJm+x6AqVGzrN8ptqAWLUMUkOvNxqEg6NwfPX/+JdzAzEiUQBaqkjwXAaY6CBdzD/Hy/M3fnmjhHdrCsQgSK5IZuuroc+W49xWotm8l3Vgq14MlS2QDeOm99JeaWyi2FU8eBVmrhrHluVody5q7GcMStT8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKo2tnyMCjGfFmxloIQkBh9Ziq9EQEMQ+dPG8GwYeGE=;
 b=kI4XntVQeJEZsT0zJV2241PTT3uU/k2HB1LIYuV54M4LQjCn/Umb47Z2FVbvF4AX6qJ0dWKUuomQdzcU2XdDMl2DEkti72cmFRXuP+QiiQFN/hOzca67gec6A9zERRW+iLRF3TukAalmBdhTlfblCxVKUh/th8pZP4w5avmrnOdNtQpEuJB9CkyKOLjaOknpKWCczV/MWnDMB84WP3jVHvP6q5RFpqj9nZL+nC0JdjRyeOm+X1uzmLtOMu2Tp2ZfHCVEpCVI9dtoQjRWYTUqeGHaoOlx8bAc/tGFsPedUyldazQOL82OI5BB6zg2gRAv+r/tn6D2SXwvwdkPrwC7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKo2tnyMCjGfFmxloIQkBh9Ziq9EQEMQ+dPG8GwYeGE=;
 b=Q6HQLuVsQCm7fj/eBFTHSMcIBHhlKlmbqPHXOnAciSaBaJPMqfLvlSvoyYwahpoqQc2XX7v0U3wBR4t4uMnYZj1ACO35G2sCB8FiH/sBhQwZfPifo+RskdbDpb/0yo/c5f4HgMzlCjx4BN6HkBTY/GE//LCKUaaUSEaEyPw/RgnQbaXHED8SQbg8GXOSP5SY7QjON7TxV5gFYYge/gH0Fz//QAgaxO31FcB8nHMf2tFQv53bRhw/HtA4gVcRfdOxAf3f78nbmS9KIWlg5Xj9CWPLDACBE4DacE+af8foMys4puyCU2YPevK8SweO7j3pK0bEhHKr2PRGywlJQC0hyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY8PR12MB7537.namprd12.prod.outlook.com (2603:10b6:930:94::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.13; Wed, 4 Feb 2026 23:42:10 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Wed, 4 Feb 2026
 23:42:10 +0000
Message-ID: <e5938ebf-c888-4af0-ad0b-66f983ed0dfe@nvidia.com>
Date: Wed, 4 Feb 2026 18:42:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 05/26] nova-core: mm: Add support to use PRAMIN
 windows to write to VRAM
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Dave Airlie <airlied@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Zhi Wang <zhiw@nvidia.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas Hellstrom <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <97af2d85-a905-44d4-951f-e56a40f4312e@nvidia.com>
 <20260130015901.GA301119@joelbox2>
 <c064fbdc-9202-437d-80ff-6134d2a33778@nvidia.com>
 <70d88203-2fe1-4bde-b254-51e8107744eb@nvidia.com>
 <CAPM=9twm1x9rH==uoGQLYa8b4feQMz=Ne14WPuhCPy9_H1u5Tw@mail.gmail.com>
 <a50c9e31-a182-4ed7-837c-4a12d220c022@amd.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <a50c9e31-a182-4ed7-837c-4a12d220c022@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR05CA0027.namprd05.prod.outlook.com
 (2603:10b6:208:335::7) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY8PR12MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: 376844bc-9bd0-4d8b-fb07-08de64470319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bENLWEhha25KWlNCYlVHTGU0U3p5ejVQUHhiaURpSnlyQlN0U1JzVkN2bDNT?=
 =?utf-8?B?MUs3blUxc1o2Mmd5eHRGSDlpZ0MrR0xjOFlXTHNtalBwcHJVejNXeGJHVkJJ?=
 =?utf-8?B?SEZWRW5VZGVuZGRWZDh5N0Fzb1lrUDZpTXhiVTBXYlNvRDVNVkE3ZzdLRnVC?=
 =?utf-8?B?OWc5aFFvNERvaXF5SDRESGkxaGc4bHRpTDkyUzlTOTVNNjZma0ZLWWxJUldF?=
 =?utf-8?B?SXBqblNlWkdwSkZyZ2YvdDFRcm1hK3krYW1BbWx6dUVURWRBblNVUlYwSWlR?=
 =?utf-8?B?eTcxam9sV1hndEcyYVdCT2hJcWhtVjBwWFJ4V2VxeHJ6Yzl5eTdqY2lyYkZZ?=
 =?utf-8?B?NGJWUDB1SHNrdW42dkZzOE1UMXpVWERrNld0a09WTzQzeWdmN3RxakpDVTdX?=
 =?utf-8?B?OUo1WTA0OWVBSlI1c2MyWVQrb0ZTQVJ6VEE0aEZzN21SNkpJdUdDSUdLUmNq?=
 =?utf-8?B?VWMxZDNrR09FYnlwTGYzaHByT1pnSE9JSTN1OUR5ZktJQVRYVDZ2U0g0Wlk5?=
 =?utf-8?B?QXRmc3FHVE02VHpFa1F1QkduWGZTRkgrbGhFMytEcHpyM0IxbVZpWGZ3TmRm?=
 =?utf-8?B?eGhXUnFVbGF4bk0xVW1Wb1BDZ0RyZlJ6SHRrUVJIcjg2ekpSbGVUUE1SdWJE?=
 =?utf-8?B?azVuVnlQdjlZOHViTzlTUWkvL3pXaGFQSUwyQ0ZaTFZpYnhkNnpHQmVnTmU5?=
 =?utf-8?B?Y2t1OStremQ1K2ZsQUljVFE4WUlaM2FBb1NlMHJuYjBRY05wZmVXd0dFUm82?=
 =?utf-8?B?WlZ2NVFrM3kwZkhpMHBSRWt5ZTBsVy9MTFYrSFpvQ2Y3d0lHMXl2SnNTNDBQ?=
 =?utf-8?B?RVhKUUhQMlJraTIrVWdkOG1IK0lPYUVGNGFqbkJhaEw2ZTVNNXB6cGdYYWNi?=
 =?utf-8?B?UStXekZ2UGlDVVYrdzNzVGNTeFlUMms1MHpSV2ZZL09zWjFiU00zUDRSMC8w?=
 =?utf-8?B?a2pjMEtTM3dTNlBCdVN6UUhTNEdOVFpiekwzZElrM201S3NreW5mSjdCWlQ1?=
 =?utf-8?B?VWJqYWJGQy91MlRpaDFIc2ZydFpYblUzM3hJNlBPbm0yNDZqeWxCbTVyVlpS?=
 =?utf-8?B?WEIxMXRUSEQ4NWI5TEhlay9qUmhBRFZpYVl5MmF2WHk4QUE3SmhUV2FvUk5s?=
 =?utf-8?B?bWVHMndGSEVuYnRuejVMTmJqM0NaR2l1K2RWWVlOeFhSZTFCaEttSCszOCtk?=
 =?utf-8?B?ZEtRWmhKSnJVdVVrWWYrVTVDd2pBTlh5R0NsK1Y0UUM5cHUvc3cvOWdQcThx?=
 =?utf-8?B?YndsNFZmbURFeDJtaDljWWgyY3phS2p3WVdhS0R4L0Q1SVc1Y3NBemppTjRi?=
 =?utf-8?B?a3VZTFA4ZUlBdWZ1LzRzaW5SaHFKVjJzaGpLOE45RTZZUUxwVmxWM2Vua0pL?=
 =?utf-8?B?QkMvcm9aZE8xM3R3WDYzZG5NcTVKVmk5cEg2Z1lGbzJ5L3dGK0VDQnFpelNj?=
 =?utf-8?B?c2xQcS9Ua1Y1VzhYcVRZdU1OMHJaNXh1YW81YTZtOXpmVVlYRmc3ekFTSVJS?=
 =?utf-8?B?V2VYUldwZ1E4dGRzeHdFRU1kWEFUYy9RcmtNNWNUN1FyZ3JaVWxHUWdISkhj?=
 =?utf-8?B?MitrVjZyYUIwZHN4cW5Hd2NBSmtReVVoaXVpZGw5YW00c3cxQnZraW5pWVVa?=
 =?utf-8?B?b2NLS1llalNvMVFWYUFXNG1na05RSWExR3cyejJXd3FzdGJFUzArTFlhUTRG?=
 =?utf-8?B?RVk0YUcvR0wrM0Q0K0R4Z2JlMEl4dFBFZjhzS0ZNRisrZjhDejJrMXZOZkFw?=
 =?utf-8?B?N3BEOC9uY1EzZUVLNEdUcy9NOHpWbnVveUoyOWgxSm1QQ0lmWFI3dFpJWWlR?=
 =?utf-8?B?UFc5UytWWGkrREFhYVVpM0JmZXhsOVRIUXlWRkorQUxkVjI0K2ZRSzlsaHQr?=
 =?utf-8?B?NURhZkFzdGhpdFFyODFLcUZvb0t4SHNrdkNLY0UxMDVhMks5QkhGbEw5S1Fl?=
 =?utf-8?B?K0NQNDgzN1dCZWN2c2x4VXpGYnZENnpaam8vRUxnQnV2S05zcm1MNHEzeEtW?=
 =?utf-8?B?TjhoNHpMNHdYWDM1dTBsVlpxVlVKNTBDZmw4bC9pTGdEK3pDVTJTazRBdzNs?=
 =?utf-8?B?SjFDYm9JSGFiOXdHbC8wa2w0TVNSSkwvSitMYjZ5YWl4bUZVWW5sSEgzWU9u?=
 =?utf-8?Q?jKog=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmpKN1ZNVVJKK0RQRjBzSzBkR0dnbVQ5VmlPMHZ0SzlwSXplZ2hESEkvYVF6?=
 =?utf-8?B?cElOR0h2SGFlYmJidjRCbE95Wk5XbXVDLyt0bFo1MGlubk1YQVI0b1k1R2RL?=
 =?utf-8?B?c2tpcWYzVGxSMWU5b0J4dXJndDFvOEszeGtiT0NOT2o0ZWdxbUQxUHdKaWhN?=
 =?utf-8?B?MTZqandiUE5KSmRRYW51UVZoenpDbHRROW0ybjRjeFd5NjJFVE5YM3VKUVh4?=
 =?utf-8?B?ejZ6ckk5UVVZVU9yUk10dDBRS1RXZkJEb2dzNzBCQ3NLNVFWcWVIaU5HU3ll?=
 =?utf-8?B?Mzh5b1Q5ZkhyTUtKcTZ1TStkUmZORVN3SXppUjZ5emkyb2RVR2xrZzZIWUFk?=
 =?utf-8?B?ang5MmVsKzJCMU1YbXhRRzB6YnBIWEFDL1hFTnBpU0h5eEhTQWkzeTBkR0ZE?=
 =?utf-8?B?VmNzS0YwRVFralVkcnRvb0hNalYvRE4zTitqdFp0dmJrMVY2bm8wanRYTzNB?=
 =?utf-8?B?eDhGSms0a05jcVdpZjJzQlhIQzZERGFUU0ZqL3F1Wk1xQ2l0aURiWWFNRWxa?=
 =?utf-8?B?QWdHaFlLQ3hHUnJLTklqd3FkaE9MTFEyckwyeTBsWXkwaHU4WVNwKzFNZWla?=
 =?utf-8?B?bDc0MnV5QXR2WHNiamMrSHRTbEs4TmVqL1ZCK1NrM1lib3R1NVBQSFhVa0Iw?=
 =?utf-8?B?TGxzWjNhV1FOemFHRFpkd2FJYkQyOFNiZHp3NW5XVEcyYnRLc2kxeVhmRkox?=
 =?utf-8?B?dnNEQ09WYXJFZDJIWUwzeTJkWFN4bWdKQ1BIcFU5a2U1ZjI4bjlBU0ZuQkgx?=
 =?utf-8?B?azhHMi85NExnTDlLOEtCWGxUc1NDeER3ZEpkRlI5U3F1ZDcxNjROMHIyMGtC?=
 =?utf-8?B?TnliM2dpU3gvZWZHL3hINEVJbGdYQnNidW9wUHhTT0QvLzY5V3N3b1ZkUDBr?=
 =?utf-8?B?a0JrOEFmWTRBUlZDUEViNmovcGhEc2hIZjZaMTVaQ0EwYkVBYXpNa1JpZnZk?=
 =?utf-8?B?TThSSlpGelBiZ20yUXRycVVJN1RWRnBQMjhnb0Y2emV6Sk81blFudmkxRFlK?=
 =?utf-8?B?ZjRnWjlkZlJPQkdFRVdndzNJNVY3Ym9hQXRZSnRJekxaZSt4aStsRjdvUW9h?=
 =?utf-8?B?ZThmenpDOTFCUVdJT09lRktCL3dOa2k4Z3JSdFF2N0VHc0RjWFpsODhuMjU3?=
 =?utf-8?B?R2lKMlBpMTYwN3ducVZPRCtUQUNrZ1RPUlJwc2Z5b0xoS3JlSlJ2THI1WkJD?=
 =?utf-8?B?ZERuOUQ0YkJzSjRiMXVOKzlVY1d5ZWtHbC8xR0lhTHlBMEVCbWdVbkcyZXpM?=
 =?utf-8?B?SUt1SXF2OEJrMVdHcjNiRm1qSVc1VFZzbEtYbE9vanVhb2pOdEl2UHA0OE5F?=
 =?utf-8?B?MmppeTdRNHVjOHVvSmVMTXJ3ZDRmZFZwZ2VVdjhzMllvZDg3RkFObEhQcHl1?=
 =?utf-8?B?MmFjdEFPbm1pVWh2N1hiOStGdUZPWHcwdWtuc05mUjNTSFNZLzl6SHBHVnFo?=
 =?utf-8?B?dE9UcU9aTzdweWlQb0R3emprbUY1UFYrSEtFazNPSzAyWklTQXpCblYvcUlp?=
 =?utf-8?B?WS9GK0QzTVNuVXI2MUVybU5xZHpQbTU0K0swa2d3QStvKytWWWdYZWRMZjNQ?=
 =?utf-8?B?V0trSWh5SVo5WjdZdE5QVS92VWp1eW1ESmptNHlpcjUzVWlkMnFNVnZBZWFS?=
 =?utf-8?B?UzY4RHpaSkJJVjRVVENTc0ZuUU9OWkp0MnZIbWNMZEdiVG9RcTV2djJyOExG?=
 =?utf-8?B?ZlE4ZE85LzJvYkVPQVl1RHEwQ3gvcXRRTmhGcWM1UHdxNFpEZm1nS3FZT3gz?=
 =?utf-8?B?Rnh5b1N4L05PcnAxeFcvZGpwTzBrUVpKaGNJaXJOSUwreUNGQmdtTXgrQlUv?=
 =?utf-8?B?UFFNVUE5cE9IamNIQjV3NS9uTzN4OEpCT0JmbCt5dUVUT0ZmSUxaWk9DUGtO?=
 =?utf-8?B?R2dCOW9OL2V6WkJBTnZEWUlRbTdQNUVPYlJ0YzJSMkxqR2c3enpwb1BGUEVJ?=
 =?utf-8?B?OWlQYU9EdWp2OGtza1RjK1QrMGlGcU9DSUF3VFJ6aGR5NjYvSC9IdW9ZblhO?=
 =?utf-8?B?eW5uNWNKUDJKN3dPR1NqazVMN3hUQm5DUEs5MEJ1U2R0T1RoelR5WHNPdSsv?=
 =?utf-8?B?T1FvcFhnQmV5UE9HVXZGNVFQbWxJSlo5WG1iOTRSSlI4ZzVOL3UrVWc0S3Ra?=
 =?utf-8?B?S0p0YXUyRXc4SVZCcEo2VW9yR1kvVXF6WnJnVkE0MitPWTdHMUx2UDlFa0xy?=
 =?utf-8?B?TGZjSUhBdkdGYzhlNDFuQUJCTkxDMmtwNjhkbWtRQzZQY1V5akZBRjhpemZC?=
 =?utf-8?B?US85OVJicGY4dGxNdGc3aUxoWlNSM2d0VmdYK3JINzg1R0JTTVNiTHIzTkYy?=
 =?utf-8?B?QWNPZXRMTElsTWdGV0NZdW9pdkRIRkJsRW9pZkhTSXBOQzVXbDhDdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 376844bc-9bd0-4d8b-fb07-08de64470319
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 23:42:09.8694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9HFoVqwHleR53IUIJrlqkIqsvjkDbEf1HTWZJhfi4QRuJRKplBxARw6dIb6pqGK5kVXpV20Sqn9TZmbXiJZD5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7537
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[amd.com,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[nvidia.com,kernel.org,vger.kernel.org,linux.intel.com,suse.de,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: CE996ED53E
X-Rspamd-Action: no action



On 2/2/2026 4:12 AM, Christian König wrote:
> On 1/31/26 04:00, Dave Airlie wrote:
>> On Sat, 31 Jan 2026 at 07:14, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>> On 1/29/2026 10:38 PM, John Hubbard wrote:
[...]
>>>> For the deadlock above, I think a good way to break that deadlock is
>>>> to not allow taking that lock in a fence signaling calling path.
>>>>
>>>> So during an unmap, instead of "lock, unmap/free, unlock" it should
>>>> move the item to a deferred-free list, which is processed separately.
>>>> Of course, this is a little complex, because the allocation and reclaim
>>>> has to be aware of such lists if they get large.
>>> Yes, also avoiding GFP_KERNEL allocations while holding any of these mm locks
>>> (whichever we take during map). The GPU buddy actually does GFP_KERNEL
>>> allocations internally which is problematic.
>>>
>>> Some solutions / next steps:
>>>
>>> 1. allocating (VRAM and system memory) outside mm locks just before acquiring them.
>>>
>>> 2. pre-allocating both VRAM and system memory needed, before the DMA fence
>>> critical paths (The issue is also to figure out how much memory to pre-allocate
>>> for the page table pages based on the VM_BIND request. I think we can analyze
>>> the page tables in the submit stage to make an estimate).
>>>
>>> 3. Unfortunately, I am using gpu-buddy when allocating a VA range in the Vmm
>>> (called virt_buddy), which itself does GFP_KERNEL memory allocations in the
>>> allocate path. I am not sure what do yet about this. ISTR the maple tree also
>>> has similar issues.
>>>
>>> 4. Using non-reclaimable memory allocations where pre-allocation or
>>> pre-allocated memory pools is not possible (I'd like to avoid this #4 so we
>>> don't fail allocations when memory is scarce).
>>>
>>> Will work on these issues for the v7. Thanks,
>>
>> The way this works on nouveau at least (and I haven't yet read the
>> nova code in depth).
>>
>> Is we have 4 stages of vmm page table mgmt.
>>
>> ref - locked with a ref lock - can allocate/free memory - just makes
>> sure the page tables exist and are reference counted
>> map - locked with a map lock - cannot allocate memory - fill in the
>> PTEs in the page table
>> unmap - locked with a map lock - cannot allocate memory - removes
>> entries in PTEs
>> unref - locked with a ref lock - can allocate/free memory - just drops
>> references and frees (not sure if it ever merges).
> 
> On amdgpu VM page tables are allocated and PTEs filled outside of the fence critical path.

Does that really work for async VM_BIND? If we're missing anything in nova-core
related to the timing of when the allocate and update of the page tables, it
would be good to know.

My understanding you have to write the PTEs at the run stage of the job in
question otherwise you may not know how to map? Are you saying amdgpu writes it
during the run stage but somehow before fence signaling?

> 
> Only invalidating PTEs to signal that a shader needs to be taken off the HW are inside the fence critical path and here no memory allocation is needed.
> 
> Keep in mind that you not only need to avoid having memory allocations inside the critical path, but also not take locks under which memory is allocated.

Yes, this part I was clear from Danilo's email and clear about the various
deadlocks. See my analysis where what you mention is in the cases I covered:
https://lore.kernel.org/all/20e04a3e-8d7d-47bc-9299-deadf8b9e992@nvidia.com/

> Simona added some dma_fence_begin_signalling() and dma_fence_end_signalling() helpers to add lockdep annotations to the fence signaling path. Those have proven to be extremely useful since they allow lockdep to point out mistakes immediately and not just after hours of running on a test system.
> 
Yeah, I looked. Nice! Thanks,

--
Joel Fernandes

