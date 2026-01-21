Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO1oAm0ccWmodQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 19:35:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA0D5B562
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 19:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CC710E864;
	Wed, 21 Jan 2026 18:35:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d+Il0Ocm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010038.outbound.protection.outlook.com
 [52.101.193.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEE210E85E;
 Wed, 21 Jan 2026 18:35:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPoseDd27hrsJxWXWXVDG8uJTjeAY6FsdS9eHBCwU3bo0qkWLF4m9cRBKHIzsLZVjujdfH1WRucwh0HkCxFzubIN/68K1/mAqQR0QgculCAptSvwxFy39l0hyxqaF5OVz49FHZ8gnJo4GRdeTDtb7qiH69texFNYQGQx3BHdXnFU5UqQnNZgA9x0lHQ55Mnc8ToXwSsEmCAbnz2hNGUbXb6uOOmvU80gNz/3J6xuDEHfLi4/nPud06I0blHnHXEJaNkxTN3fogONYzQy9fxrjs0X9CDlMxRDL9RciI44e6qiTtPxGu6KQA6pm/AjaN7xvlqqK1ywmYRGRgFtyBNFtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U1LLixYnyy6MyF1z+KU6eZupHCFRavUEN7WI9J1l/+o=;
 b=C/G2cXSFrkBV1mXabZSlRV4H97UMvOGgkcVKALp2+9kFVb5aoDrfojo4qZ4uqoMm5w9WQFIPywVyWYuebpBfXvg8l6AGsDeHwK7KSewpNfewzkWnvTmJXPiVltUC7vflb1oJHTwHSytmm+bL+OD8RZSiwwquDkaUGAPxCR6rO8bWeyzQpaV4PMSzYKRXeusEkt3Q++AELzWgwJOj1MpF6fc0kwGU3pEbHLOMrv/Sqo7GbnVPEM2x6xCaPGEKI/c+xqhkpIs7y1AaHH4OoJFNORCR8Qh7w1FvKb56Nd8lxYybzawf0N+Rpiz+JXGQN1DFvMfchFWkkgszPl/6FeLqxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U1LLixYnyy6MyF1z+KU6eZupHCFRavUEN7WI9J1l/+o=;
 b=d+Il0OcmfGLtn8yBo+TQNHllkzWMxzh0P5M9gyHGk77MtTc/c7yls2XjPX2yBZaVETt1DAIMMIzvdhIj6TtW7/Y8y5r74W5RrO90WXjHFA4kQqMEn3elVas0qO/cF2won7MSjoVQ3VH7wrJtqTY58x2EsV1SwCJVEwXQXB2FVQl2hRayJaVqHFDGPWYRv65NZPsiP583EwL0OhBG42VRBJ1b6e1/lXe2dBxgz0LfbTSu06li5/WSP3Ss7zq77CmqNM+Q6ekVYDk1rKZb6PhdKUov1f9MYlH6kZ7v1dxONZBczkr/WfS2iPVHP9b4kkhlATpy+MAEHpkeZHwetNd4FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 MW4PR12MB6973.namprd12.prod.outlook.com (2603:10b6:303:20a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 18:35:11 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 18:35:09 +0000
Message-ID: <925b7dd5-c941-4946-8148-ebd7e8eeca65@nvidia.com>
Date: Wed, 21 Jan 2026 13:35:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 13/26] nova-core: mm: Add unified page table entry
 wrapper enums
To: Zhi Wang <zhiw@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
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
 Alistair Popple <apopple@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Alexey Ivanov <alexeyi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-14-joelagnelf@nvidia.com>
 <20260121115436.45e174d3.zhiw@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <20260121115436.45e174d3.zhiw@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1P222CA0001.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:208:2c7::6) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|MW4PR12MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 52f835fd-45e8-4623-3815-08de591bce3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnZSczY0clVFRG9IQXRBZ2hOK2hSSTM2YUVKRktjK1ljeis3MDZSU2Q0dXlu?=
 =?utf-8?B?UGptbWtTQkcwQ0F4RzBQUHloaHduOGFvbHN1cEljeXB4NnZpeVUxVldTb2Iv?=
 =?utf-8?B?cUhSRUpnMjVHQWhHdGNWNGp4OHh3OWJmbHBjQzRrL0NlT0h5elZtbmhTT3pv?=
 =?utf-8?B?MnFCRU1iYzhxREhLWGF2Vms5cjhKR3RpWTl0S25MSXk4T0VaREhNWithMGZv?=
 =?utf-8?B?UmpCVll5VWVVWUplb3d0Q0x6TDhSbjF3S1IvbG5walRpZ1lvY002MnB1RURT?=
 =?utf-8?B?Yk5WKzA3bEg4TzFHeTlHRjZVK1BJdmhoc080dk9NRyt3ZEovTmVQU2o2MjJP?=
 =?utf-8?B?TUExYk1SVkw2ZHRXNVNVcUpxUVJzakZCS3AySE1TUEtGMlEwSm5VN1FtSE1w?=
 =?utf-8?B?ZWh2QzFsdVdEd3o3WnFtZ3A2Z0EwWW9POVdpRlp3emk0TjNhUkViSjRxWXlq?=
 =?utf-8?B?b2J5RUdpL244dVlJWlRZdXhFZmFwL2xwekxtMmpGeXJGUnI3akFBeFR5anVh?=
 =?utf-8?B?OTgwS1hLTzl5R0hyc2hpVUhidnlwWUdhNkVIN2RXdVBDVzdFU1ZrUkJ3SkpR?=
 =?utf-8?B?b3RWWXdqNEp6ZDBuKzdNeEhaUnZ4UWJNeVc5V0YySFpDNkJZZzJ3aEJqNkpj?=
 =?utf-8?B?VEJVWXFLTExYTGpGL0M4eFRFOEtHOVViZWk2dFh5Q2djWlpJMlVyYW1uZS9q?=
 =?utf-8?B?MHVDdzZZc3ZidFROU1ZoNkxKOUZVS2p6bml0YTRaVFVWbGdxanNsdC9nZE9M?=
 =?utf-8?B?ZkEvcEFLUCtOU1VidXFUcE90cmZvRUExVEF3eGY1dWtEZ3BNakorRVJ0cWt1?=
 =?utf-8?B?blliM3M3YnRhUEQ2dGhaWkt3bUdpUUdqMEhLNFZLdzRwaVJUZjNzRldOcU9R?=
 =?utf-8?B?dnNNS0xMbllSL1FyVkdXS0ZUZW5MWnY4QVJvMUc1M0Y1RTFINGpGZ3AvOHpC?=
 =?utf-8?B?TldzOFczRGlPUHZRRkN0NmpXdXhrVnBSZXRWVkNqYVNxa1dKQ09KeXlyUlhL?=
 =?utf-8?B?M2pESk9lcDBEcU1rODI5RnBkcG1CWW10TldpVVBNRDRjMnFJYXVoN0pLWnF6?=
 =?utf-8?B?cWMzcC9IVFozMEgyRGM5RVBnOWd0RUxFbkhkbFUvNStIWW5FVEltSHh2SVIy?=
 =?utf-8?B?UUgwRC9VTXJoZWtnQ3RYV013RFNpZ2pzVGZCUGJrU2x0L1cvYTgxd2gxUWl1?=
 =?utf-8?B?MGdSTFlJZHFtQ0wyYUpCT3kxalM4MWNadE5wa2lnb2ZXa2VWYXFqSnYxbWNJ?=
 =?utf-8?B?ekw2YmxJemxsdmhITi9IT1dOcVorLy9PaVFFMUNmb01DV3VRNlpFRGRFUllX?=
 =?utf-8?B?YjkzR01zVXVSdEF3YlR2S1hNak4vNXFqYS9YQXMvZGZyTHFtZlJDSXhCL1Fn?=
 =?utf-8?B?U0xDdXQxMTBnYzdqQjV5eE90a1pNZ1ljQmFrREcranNHMEplL1pIOEpUdnJk?=
 =?utf-8?B?WUQvNlRkSGJib211TUhhTVA1TFFuWnd6ZncrV1d3MlFYcUNYbmJjRG4wOXNu?=
 =?utf-8?B?UWU0OUdxRlBJTUR0NFczREZhZytFTVZhR3dEY09GRTlUWTQ3SDgvMEJPMUhI?=
 =?utf-8?B?NWZJQnMwOVJNU1hQRC9lYVRDdTRJV1RpeEFOQXVxT0hqczh2OURMR3NQVFFn?=
 =?utf-8?B?ekJwaDAyYnFlZmhIdUNIeU5LWHJ1L2tmSS9PS2N2K1BvQWNPb0Y2Wm1ZMGVU?=
 =?utf-8?B?VC8rYVl2bXJOTkJDcnRYVS9zclZyelJnSEl0NnA3M1plRGVHT29hdzRLdk5D?=
 =?utf-8?B?QTNqWlRvSkZnSysxY1lwd1lHdWQ3eVFld2VzdkE2bnhRYWJrRThoWWNFWm5E?=
 =?utf-8?B?M0h6RmZYc2RJYTJwKytzdmVzVDRpR0Q2OE5vaXZWbUx0THNiODF0L3JKVExT?=
 =?utf-8?B?ZXQwcmR4aTBkcGtybG5xN3JFYllNcElrdkV2Y2xjSGppeW4vQXRxNVJGaHc5?=
 =?utf-8?B?SkwvUGJYQnl5L1pMTUdXQ0kxV2k5ZTFZdDhPL3NtTHVLSE42QkYvZ0Z6TzZW?=
 =?utf-8?B?WWVENExONnpwNVVTbXIvL2hJYU5xZ2EvR2lGMWFrMUN3a283T3lidWd5VnBp?=
 =?utf-8?B?bGcvWWw0V3hVWkJ1Y05ERkc2a0ZkZ2trMkZwRGQwdENVNTJvbTJLK3M2dGRt?=
 =?utf-8?Q?Z8Kw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QUM3UmZUTzB6eTJhZkx3UC9yVmdOa1JKcUtjUTV0Z1Jac09uem9vK2ZEZ3pI?=
 =?utf-8?B?Q2hxbXJLMnR3a2VMMnB0empqcDlGemczSVE3amxGcHZBOE1PVFR1c3NOYzd2?=
 =?utf-8?B?Z3ZaN3pYRjlhZUEyRnFQSEx4MjNhZWp3SnhhMkRWWURJRmJlNDNBTUtHbmRl?=
 =?utf-8?B?aVNWcU1ubWpjcFFTWkdXakJwbGhwMEVoZEkwSi81eFpqNEl0YldWV0hXdzQv?=
 =?utf-8?B?N3B1Wm1rNU9zNEVRYlNpS2JNTUkwTHh1RkRKZkFTeC8xVWtiZVI2dllxeHBT?=
 =?utf-8?B?SkdFazZhaTVrYjVVb0cvRmszZ2kzL2FoQi81cHdhNG9RWUF5VjZ5aXdyMEhZ?=
 =?utf-8?B?cDZveXNKNWhnMis1d01PWTlORFEvMnF4MUhteFV6RGR1K2o4RDJnV0hEYXZH?=
 =?utf-8?B?MVYvOTYraXdLSFdVSE1aVlM3aUwySm9OR0JvUGcxUU96NnJMUWZQNnpSa0FB?=
 =?utf-8?B?dFVWZmhEYTBwQnlsQll1VVZNcHhuWjR2WmpJTHdLcU9yeExEVFMyZXNiUW9W?=
 =?utf-8?B?RHU1MENuUUhUUGRqU2RKL1FvaWpMTTNtdkFHRVBPYWQzbnBVeE5yL1BBcDdW?=
 =?utf-8?B?Zzg0MnMzNXcyRUh3NTFqRVdkaXA5UFNTODBCNlZuMnJNbUtld0F5VStpS050?=
 =?utf-8?B?YWZZMUNkY1hwYU9xR0FDMlh3MXpMbkFLc2RUT0JoMU9zOVQ4MVZib1doTWg1?=
 =?utf-8?B?UHJNMXRDQTVPaFdTSE5QSG9tSHJ2NlJRbkhJRWdNNjEyUUxWNjZESXc5Lzdx?=
 =?utf-8?B?bHRjb0ZuSjFqQ3VWU1FQeHVqb1VScmtTSGw0ZzMxWUx6ZGdwYmtSV29KbzBk?=
 =?utf-8?B?N3dsL094OGFxaUxobUJhWDF5dm1xK1grM1lwL0kzdDU2SDdhMW5TUThpU0Fo?=
 =?utf-8?B?R3ErbFFZeFRlelZ5alQwYU1VNUV4ZzQvcG1henk2YUxURllKVlNXK3NaZ0pD?=
 =?utf-8?B?b2k5STBWYVhGbWVocWNpRVNURlNQTjQ1cHB4cDNlVmVKSzd4eFhUMWNmR3VB?=
 =?utf-8?B?Q3pybEtnSFJwdXR0Rlc1TWlFZy9yeE9yUmtGMkdTRGx3YW1OaGo2eWpsN0py?=
 =?utf-8?B?VjdVbm1vbC9sMG9nckVjN2dsejl4MW1kblRVOXd4elVpYU1FQXhNWkZhNnUz?=
 =?utf-8?B?VXpJTkY4VUVPeGFwYmNGa01FcGgzMXRKaVBWb0lLWTRrZG9WOHVZQzRWM2Ju?=
 =?utf-8?B?b21ySnJxWWljWWhMS3pRV1BQNitTSEU3VTlpZTlzNVlYcUwvSTZUT2RValJi?=
 =?utf-8?B?a3RCRXpvZitVZzNSYWhDeVRUOGZLTnlub2hKWWlaUmVBQkx4czEvN3dNaUhr?=
 =?utf-8?B?Zm5MVE1QODJXenRGZW5QdU8xb2ZXdzRXRzFxaW1QZXRBaWRWOEhnbVVmRmxo?=
 =?utf-8?B?emprWHF4UUxaVVd4b3Fsa3N0ZlZwTFFHcGFKYkRQdnZXTm5pQ2IxcXRuMjV1?=
 =?utf-8?B?NjJ5R0lsR3hPcVhLMnkrUmY4WndENm1Zem5kaE9xelpJQnoyS1hsNmozVHF6?=
 =?utf-8?B?bzExZGtJODRRWDh1am16Z29nZVJHQm42NnNONDFRYWtIM0N2cW1meTNJalgw?=
 =?utf-8?B?VnArWENVb0ZNWm42Z1lRa3lIQVMxNE5vR3VmM2JKRm12bUh2cERvQmZweDlj?=
 =?utf-8?B?QnY2a2M1M3N4dElwK0tBUHlaU2d3UmtMZUhKb29naG10WVYxL3YyZTB5VjVW?=
 =?utf-8?B?YTRNY1hIYkRRNFdGZUtsdmdmTVRhVGpLNnFyMmZaUkZBNTc0TCtXU0JxaFEy?=
 =?utf-8?B?ZHdVUE1xNVpOY0VDR1BiWU5YMnlIaVgyU0YzdmlieDMyaVdBNUpFVmpPTGRx?=
 =?utf-8?B?aWtBdXVNd3hjUzZKbDVqVUZob1dkWHliajY4bks3Yk50dktNaG1PRWxSY3F4?=
 =?utf-8?B?SEVTeWJyMkxFc2p1RXB6bkhVUzVmVzJjeHhIWFJHODQ0Q1VwcjVleVhYdXpl?=
 =?utf-8?B?ZDhRZmpNNFR0VUdNUHZ5dTRhdE5RMGw2dDFncURoZ1VibFNETnlyL1VnUUVI?=
 =?utf-8?B?TklmcGI5a2FGZXBnNWZLd1hZNXFvS3puUEFtVVZpTjZyVkVOMENGckNlQkg3?=
 =?utf-8?B?UEdnRjF0RDMzWEFoeENoVTgzQmc5UkdneGNjZE1BQ0RiRUl4TG9yUHYrYmtk?=
 =?utf-8?B?V0N0U3c3L3JKOFAwZ01USjgxdWpFb0E4bmhDbVBmSm9ONForN0tSYk5ZSTNW?=
 =?utf-8?B?NXhpbjBwRFJXb3o1UlJoY0dRLzRmejFzMm55Rk5ja2NhTmI5Z1htZmhFNDZR?=
 =?utf-8?B?bjJEOGN1MUlseDdFSWZ5enBMRXR3c3JFeFdmdnVLOWlPMHo3dGp6M3pBN3pE?=
 =?utf-8?B?TTk0NU1SR04zcWFRQmE1NGh4YzVwQjhXN2ZzR21YYnBVU08xTnNmQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52f835fd-45e8-4623-3815-08de591bce3f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 18:35:09.4048 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qQAQkLQyQYd88YVfp31F9yb9+XC28lqxprIZ+SS4rX9/qP5GQBLdNDYQj2lUrlDtcSmSNAMiIO8lS6qBVGH8Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6973
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[44];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid]
X-Rspamd-Queue-Id: AFA0D5B562
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 1/21/2026 4:54 AM, Zhi Wang wrote:
> On Tue, 20 Jan 2026 15:42:50 -0500
> Joel Fernandes <joelagnelf@nvidia.com> wrote:
>> Add unified Pte, Pde, and DualPde wrapper enums that abstract over
>> MMU v2 and v3 page table entry formats. These enums allow the page
>> table walker and VMM to work with both MMU versions.
>>
> 
> snip
> 
>> +impl DualPde {
>> +    /// Create a [`DualPde`] from raw 128-bit value (two `u64`s) for
>> the given MMU version.
>> +    pub(crate) fn new(version: MmuVersion, big: u64, small: u64) ->
>> Self {
>> +        match version {
>> +            MmuVersion::V2 => Self::V2(ver2::DualPde::new(big, small)),
>> +            MmuVersion::V3 => Self::V3(ver3::DualPde::new(big, small)),
>> +        }
>> +    }
>> +
>> +    /// Create a [`DualPde`] with only the small page table pointer set.
>> +    pub(crate) fn new_small(version: MmuVersion, table_pfn: Pfn) ->
>> Self {
>> +        match version {
>> +            MmuVersion::V2 =>
>> Self::V2(ver2::DualPde::new_small(table_pfn)),
>> +            MmuVersion::V3 =>
>> Self::V3(ver3::DualPde::new_small(table_pfn)),
>> +        }
>> +    }
>> +
>> +    /// Check if the small page table pointer is valid.
>> +    pub(crate) fn has_small(&self) -> bool {
>> +        match self {
>> +            Self::V2(d) => d.has_small(),
>> +            Self::V3(d) => d.has_small(),
>> +        }
>> +    }
>> +
> 
> Should we also have a has_big here as well?
Good catch, I will add that in, thanks.

--
Joel Fernandes

