Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49291D3B00D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:10:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9536510E4A5;
	Mon, 19 Jan 2026 16:10:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="bl2Ywp83";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022095.outbound.protection.outlook.com [52.101.101.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E023D10E4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 16:10:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XNNDgje0TrmWXb9Ckma1BadnU3VJ57bzxr6yYUWIXWglMh7scK4xchdUU3Sr7kAvVX4xBje2eemHY7kI46mlPJuZm8AFSEhrMtbRFM49aYqUlLkaVmveO6TPmvZJ8zet9D85GeCAAMK6KtKNnqM8xgMc/1J9hMHjcnGKURfwqxDEhqdJOGXDHIbxTDnnXCDafTyvXSjBRo9fpVbTAIyq6ahNH66s2BA3x1p96LhiOsXR2kqCWhu4MFWk9dIWX8wCv3S7CM7v2MZ4Dm1bP6szWsNKXgA2ySMO7cXfbgpdxQslBynUU3T3MTdKpoYgKfPJJWt0NdG2W2uAv/wfImdpZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VNsxF0BZQeUbHh+C8UM/T4wD9mfBiEW33Vxk1wPMKzs=;
 b=bUr3rMXHfXPli30KGmh6OaCCTiOVNTVLbRoJLlQISlfUewU14uROlfMo3qQQi4x2vXlUle+awa+prVx5A07miaoSvzUv261LGpzBQeXqJc8EmSDqCsj9Z6Gx7OW2BthxEBvh7rv5UrDMLhJJpjyLznAOyvlJdZ2GUZ3BHMb6FR1nLwyZkTv0xusDCar80y6pSRmG/cbj6AfaEQ+lBhBOhqyohy26W8Ap5wSxRROxl8i5aclZlKfeHzc1rbKOxQmzI8sOx2fJz2ZJllu4iSuiWBw6lo16bJ4qe678v+YAyfWhD3NwfJlt5hrCp/oD5Zq84eUuRRzP4Y9t6n14D5UKOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNsxF0BZQeUbHh+C8UM/T4wD9mfBiEW33Vxk1wPMKzs=;
 b=bl2Ywp83FAOHX2LP33aWkHhovZ/UGhtxIPKyUtT5UZkFIEJJFKEhEgIM78nUh2f4xMfTQsUs7dkmmFdl4RzghWTaIElIDCFGPe/gv/uMjKB/lMHhLJR8JukOzJmUweSWw+i01yXgcAXv/pvfrsGWRMfAsHrNlFl7fl5R3ZFq6wM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB2274.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 16:10:40 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 16:10:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 16:10:39 +0000
Message-Id: <DFSP3WYS9DNB.N49UG5X44LKK@garyguo.net>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Gary Guo"
 <gary@garyguo.net>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Drew
 Fustini" <fustini@kernel.org>, "Guo Ren" <guoren@kernel.org>, "Fu Wei"
 <wefu@redhat.com>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <linux-pm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-riscv@lists.infradead.org>,
 <linux-pwm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com>
 <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
 <CANiq72kcRQShDgMJKZ+ekUEdP1T6Jr=4PDiMJCqnQjgCQEK_eA@mail.gmail.com>
 <DFSODY3NWRBQ.2VGQWXERVW1R1@garyguo.net>
 <CANiq72kCi8=mK8V282O-tsbWvLC6M2vdc50mnLW3M3pWTACyOA@mail.gmail.com>
In-Reply-To: <CANiq72kCi8=mK8V282O-tsbWvLC6M2vdc50mnLW3M3pWTACyOA@mail.gmail.com>
X-ClientProxiedBy: LO4P123CA0573.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::6) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB2274:EE_
X-MS-Office365-Filtering-Correlation-Id: 8894c9c7-c503-45f0-85f8-08de57754a85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUtMemJPS2c0UjV2WWNLNldnR3YvQmZ1OVhaZlVKNldsVVRKRHhGMkFTMkRS?=
 =?utf-8?B?V2pWQXkxYldBSXErOG1JZ0d5OUIrZXhlbUF2TkpXTDkzNFBvZ3Q0SnNTdVFD?=
 =?utf-8?B?MVdLNGROZUtpRUlyYkg4THpxaFVFL0NjUWNFY21Tejc1RWRkMldRRmk0WGFZ?=
 =?utf-8?B?bHVpWDR4MFFQL0ViM1BtVTV0b25BSGI1akU3KzZCdjNZOU1LbWQ1WGNGWUEy?=
 =?utf-8?B?bk9teDQwUitRV05HUkFwaE9NSGFYOERibVI4R2JyZElvd3JnUFdvZkp6QzBY?=
 =?utf-8?B?bmNUcG5ybGZJNnU2OExSZVl2ckI0RmpTNnVBZVNvODNaanV0dHdNVkJRQW5F?=
 =?utf-8?B?cnR0RlVNcWFWVGI4T0pJZkxZSDY1N0ZlSnJRSFBpNjhVUTQ5SWtVSkhnemF4?=
 =?utf-8?B?WXQ2R1hydEpSVkJxZ1JwdFZ2YTVZUjBNektIQW9vSGFGcHlQc1dTZU9JbjYx?=
 =?utf-8?B?VGp0T3hjTzF4ME1TVXk1amNWQ2s5Si9QMG80UzRqZ0pyeFcrQUd6YXRGd2NR?=
 =?utf-8?B?VjUrcFJGYzZBeFZLNm8yejV0SFR0SjJzVGZUZXUwMFh4NmpiMS92NjliRm1L?=
 =?utf-8?B?MmUreWhxZHBROWpWL0h6aHd3Z0llSnBzTGs2YkNFSVZtdVJsMmZJRzJ5UTZL?=
 =?utf-8?B?bmNHUVBXK3JVSXdIMCt2YTRKMS8vY1c3MUN1VVpuTjFHaUIvOThXVm1RcEV1?=
 =?utf-8?B?VUFqZVVPK096aUY0RExjeXc4QlJRcXJveWpSa09tQUtweSt5WGtFVVRjZ0Ro?=
 =?utf-8?B?dnNVaWdHRVIrazBhSUN5dEc4cFNUVFdqOHNHL2xxbmF1dWU0KysvZ1JKRkVX?=
 =?utf-8?B?MHlBejhOTUY2QmJJQnJTdlpiZ1lkaXpTQ3c5WnJYMEF0dEN2VXFlayt5VzVk?=
 =?utf-8?B?UmQ0bkJQTmNIbitpMjI4ZzNRSThkQzdCVnNNVjJBbmp2L29PbHIyY24xY0dl?=
 =?utf-8?B?ZW5xUHBIRU9rS2Z1dVpYVGVZQ2dKSTRYVkZ6cDdyUmNkM3dPSFF1SmdlOHFl?=
 =?utf-8?B?NHdBaDFjSDZaSzBIWDgvMEtaWmJOQ3B0QWxCd3U3MVRBMWo0V1RyTjhNeGVP?=
 =?utf-8?B?UzRZcWpWbXEyWmd3b210blpVdHFINjR3dlRwZGowOUh3TGZkdjVlNjh4elZo?=
 =?utf-8?B?ZlVoVHcvamJuS1d0SFFlN1Rad2RDZTYzeW9EV2t4ai84dGFwVkpXdXVmWlZV?=
 =?utf-8?B?NXQzdVpOS0dHTkRCRTZ4eEx1b3RtSnp0UjRUZWhuSjFZNTAvb0NpRTg1UWl4?=
 =?utf-8?B?OHFaZ1I0RlBKa0N1QVFRYlB5aEk2eC8wSDhhU2lYcXU3d25wWjlEYWNnZ2Fa?=
 =?utf-8?B?N3JkU0VDMlZ0N3NPdkZkOWRXTTNodnpJaE1PTU16SW9BaTBHdXVEU1B1UFMw?=
 =?utf-8?B?cFBmSDJHbGRDMGNVSTJTTWxXZGYwYlRoNWd4bE5LZURXRTBxK0k2M3h4VHJq?=
 =?utf-8?B?QkJiSHZYQlFQUXdSQzF1bVY5a21oVEdydE1tV3VxTDdyOVlESjZ4OVJlR2dt?=
 =?utf-8?B?eEJ4WmJQOEpMalkzMmVLYW8yaWdERW1PQTBSVElJaTJ6cUNJZ0h0T3htWThk?=
 =?utf-8?B?TE5qVk4ySXA4aSs3L3J4RHZjTGFoSEM5K3dQYzl5eG9PMUY5VXRhZ0RLaC9S?=
 =?utf-8?B?c3VyZzFWRGplQWdCcDE4Y2IxM3RsYkRvYmU4bDZ1c2V6T0sxNVdESkZoQWg3?=
 =?utf-8?B?VEE5dFVKWHVBYjVLMnBTa3BYMVRRZWZrOEN4VWY2Wlo0MHpCZVEwN256QnFW?=
 =?utf-8?B?VFBNaDVMWmxoelhxUWwrZ3BiSTRqWlhjSnNWa2NQMDNVRUdXcjJmdllySWlR?=
 =?utf-8?B?ODJ2R05lWXl0T3BUTVl2V05SK0lkRWVFWTduMENXNTFWK015NzNKbXB1Z1Jq?=
 =?utf-8?B?eUlNQ1IzTVpUNjF3OTNTc0xhaWw5bk0wcUFkaEFJeVBkQ0I3eTRBNGFkYWVT?=
 =?utf-8?B?SDJYNm43dFQ1b2EyZWZxVVBOc3ZXQVY5TlRVcDlzMllqUUxVcnU3RHRUVTQ4?=
 =?utf-8?B?bGdGalZEQjVlMnJ2bTJZN1Eya1FKTGdJejluclFkWGFhdXl0UlR4QUpiVnFL?=
 =?utf-8?B?cDcxUFdEZVRtaFdabCtkRGhOOHpSY042QWNXai85aitUeDN1R25Cdldwd0FN?=
 =?utf-8?Q?x0/o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2RkT2twTmJuUGxxN0RJSTM4djFjN1poZFU4clZrb3JPeE1WMUZJTkRKaTJo?=
 =?utf-8?B?bWg1ZjhiaG4yZ05SUnJTTDlvdmVYQlJNWW5QZGQzQTdxdkp1VFA4d0dnVGFD?=
 =?utf-8?B?SGFmQytsbFNKUmVzUE9LaVJ6ZnBrWE9Ob0xPSUxzQnowY0xWVEIrVjhEVVoy?=
 =?utf-8?B?OFdoK3JiekJwZm1mRStTWFVkbC8xN21FVkxQM29uNkZpcm1Vd2lXWjVNWFNH?=
 =?utf-8?B?YkIzOGowS3dRVUlBMDI3NTU1MTNoYUpIOSs4VlR5eGE0U3B3TTBEZTBuQWxJ?=
 =?utf-8?B?T3lhbFBqWUp6aVg4U2RlenJiZFlqcFN2Y3NWNnZadGpKU2JkNjFUSDcwQmRp?=
 =?utf-8?B?MCtDWjdiNDB3UkNuL0dFa3BPUURaWDNjNlMyTUFaZDYydzRiYUFBbEJGeTll?=
 =?utf-8?B?STZPNzRHUnA2U2hhdzU1cFRlVlltdzZPVWNBTGtjTEl6RWd1V2JpOFZWZkUw?=
 =?utf-8?B?ajlmc2pmcXpZTnVMV1ZhVm1CSnplMjlOcXhUaGt4SXk2cnVpd3NXMjFkNTNY?=
 =?utf-8?B?TGYxQnRkT09SOENoaFc1azduR3ZDQlBDaGk4bi9kRHh1b0FjY05zYytybkhl?=
 =?utf-8?B?Q0c5dUxIdDExaVRLMU1zVkozcENUVW91cDVaNWJSU2hKUnlubnIvKy9ja25i?=
 =?utf-8?B?dDN6eUxwNEhlVjhaTDFaM201R2ZnQkdEb1RTdXNiUm1sQVZZZTdObmF5czBQ?=
 =?utf-8?B?c0ZCQlJjc2hRcmZ3WHlHMFJBbGpCRUJXVjk4UFdibExYbGpPQW5QaEdPa3Z2?=
 =?utf-8?B?bnBlVHZCczJZTi9TQUNqTHRLbTZHRWM5eWFjTXhzTXVaYlFCRDRQMER4VFEx?=
 =?utf-8?B?Qisvb0JQejc1Rlc0eFlIdmk5ak9CSkZzNGN2cSsvR0N1NVV6aWZqSUxTSzVF?=
 =?utf-8?B?YTNwWjF6bU1tWHo1STNQK21CbkptVnQrUEJ1c0VhOHd6enk3d2haemY1SEtJ?=
 =?utf-8?B?ek5QK05BN2JoRG9KK1BPY2cwM3ZESXZTaFNiRWErcUc5YmZ1bm4xUUc4Tlo3?=
 =?utf-8?B?S3BUVlRFekNMTHR1T2RVYnFzTk9MVUdXQXhXY3pzeFllMFRJKzI5Rkx1ajFs?=
 =?utf-8?B?M1RlMVE2eDdjZmlhY0RtRkdDbXJJbmhobXZad0sxV01lSHE0UzRtTndMQnQz?=
 =?utf-8?B?WVNaeUdJdXkrS0pLY1NuWjVxQVhyM1BPVjJKVmVpYitOUkdaS1c2N3hHbWZ4?=
 =?utf-8?B?Q291aTB0aWpyQTMyYjhxZkExSXdBZXN0K0xaaEprdmhKQzJhc05BQkRrcHlK?=
 =?utf-8?B?OVI2cFUxNlFzOE5LaGRaaDdLdERoNEZCWFpuZENJS0pRK1JoZnQ5N1RYT0Vy?=
 =?utf-8?B?Y3Y2SGVKMTE2QmdkVVNQN3VFY2pRb2hjTURHWXVJNDM2QlFDbU9mOFAxQnlN?=
 =?utf-8?B?N3N0OEJUZlBRZTNraTNacVZjVXBKME5PS2Z1YkNaaEE1ay91V3c5cU1WYVk5?=
 =?utf-8?B?aEZiZStjZjJmOHNjUVoxR1lpS3VPN05qMlVNbzh5S3l1eGFPRmJtN0RETE5K?=
 =?utf-8?B?cE9HSGcwSlArSENtbEZ2UUQ0VFNvZUJudm1aQzNpRFJkRUlsK3hjOUgzZGVH?=
 =?utf-8?B?QW9MV1dQNnZHdXJtSmRkbXdicStmeHlPSHUwa05SK1VSMjZZaWMzWS9XR2J6?=
 =?utf-8?B?clE2UWwvVndVUml3ZEJGSWt1Y0pKL0Q2SWIyL202b1hKZzdLSmg3VjNHRVV2?=
 =?utf-8?B?dUZScWdNN3E5MXFlbURSZDRzdnd6a1hUQXZFbXFTTGgxVW9vdjNpQi9mdmVk?=
 =?utf-8?B?Ylo1cEZMTy9rKy9WUGJRTGtjOENSTDRDQXlJeHRmSFNRQkVWWnRGbFlOU3VB?=
 =?utf-8?B?N2V3MjRWY0xTT0xybGgrVHJtbDAvdVJWV0txYS9FdXg2d01rZDc2Ykl5SVgy?=
 =?utf-8?B?TUtiSFZnVXVYRUdYVE1ma2RhekFUMGNYeXE4MDR5cHBSNUpOUWlGL1JBZkZH?=
 =?utf-8?B?bnY1ZmEwcVFoYWw0Q3djNE1FREdQZ0s2LzZ3K2lhUC9zdGpncUFsTWFydEgv?=
 =?utf-8?B?MGVDUmNxOXRTZEEzbXYvUlFvQUl2Y1lKSnJiSTdBTmx1QmlqQm82RDE1bGJN?=
 =?utf-8?B?c21YbEQ1Yk9MRTdBeEJhMHI4VEc1bWgvelUzNTh3T0lVTUplTGIxWjdscE01?=
 =?utf-8?B?dXhTUk4vNnphd1VLM0hNd3RoUW5JR0kvb3ZDRzFObzVQRXFCY3ltUFFmQmtp?=
 =?utf-8?B?WG1wdEFpUnlsK202VWtjOWRDS3BoK20vZnBYNHZBN05XWmpKM0NidE5PN3N0?=
 =?utf-8?B?SWhOSmVZeklxazk2bmIyaEJBdS9tVjh6blY1bnBPcmh4dndFSlAwd1hvYmQz?=
 =?utf-8?B?bUs4eE1UR0pTK3dhZUJzcDM0bjJJeVVsVUl5T1FqSWhOTjUzbDhoUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8894c9c7-c503-45f0-85f8-08de57754a85
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:10:40.6881 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kpra/Dx75d9cvoHEQJJQMPlPNnKDyVXNdeDl5gLwxjUYhMlG3Qcrhly7+Vo4sIcm2HSgpjERDtIKwO1ECSpdTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2274
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

On Mon Jan 19, 2026 at 3:46 PM GMT, Miguel Ojeda wrote:
> On Mon, Jan 19, 2026 at 4:36=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote=
:
>>
>> Which crate are you talking about? I can't find a linked crate in the is=
sue.
>
> The commit message (i.e. not the issue) has an (unused) link with the
> `sealed` crate:
>
> Link: https://crates.io/crates/sealed [1]

Yeah, some thing similar. Probably an even simpler version with only things=
 that
we need.

Best,
Gary

>
> Cheers,
> Miguel

