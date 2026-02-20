Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDUrGFjcl2lv9gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 05:00:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E9516473E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 05:00:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41EF310E13B;
	Fri, 20 Feb 2026 04:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BW2cGBMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010056.outbound.protection.outlook.com [52.101.201.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E1910E13B;
 Fri, 20 Feb 2026 04:00:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMDqT4HoO86YizeDIcU0Y4dTd5tSgv0O9zdZt416ycOwh95MRhX46njhoJ0tXptv6snCXGBBpu3OxrIciSO/iEUHSIPWWube+GBJPQ3VAloWLFAhkYgv1S3whrbI41zVhnpNbqC2aGYxMhEERyaaZ7DBQ1rA5U3bq8YrZgZW2/0iKs7Eonz/H8NHM+LTYxUWk2QC2Mz82TpcF6WageDaCBtZvP33WfmkoL+n2hi6NqsDvJbCAZ49huKHrpxxLWfYzTE5+p5g7y67yMHINGobLFHTVU0FGVMasS/W6xWaVnXpJ4mTWVoHRAHifSeijlG91R7rq0K7OrM1b4Re4m3SoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cSZsd8w2KjgUcIJDXa9p3/4laTet8IGqGU3sp3hDBM8=;
 b=IuhdDgPWQl8uw7Zl1UHdTAKiyvDiyVm34n2Ruix7y9s6maavshwdT/REJHDKRHrREhzgzVsOecNe5OFZbo1IQoQclsenMCC9xXdqyfeIvJDh1EWeCSp+83plNzTNZ7Ryvdnr7RCdv6WnAwypX0UqASh8VJlQCLlraQsEeZy6cT1SbKm10A+RxgeQ8spqNqX8VxSb2o68N9K9vMkcgD7x5kptp9xudYm2DYyb1IniZfbqvVp0b82IowS/XP5cj9dE6gVoBBmcC3VvU7zgNA6ZEXaCUI10giP4fperSVTaVvmgopIvPd8ttUgftkDfFJWNifNTU72Qe8WpqPawe7nWAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cSZsd8w2KjgUcIJDXa9p3/4laTet8IGqGU3sp3hDBM8=;
 b=BW2cGBMYcCaJEjFlmEBBEhTkTGs0tdMPOdkxoKdwLP3PAr3qWQMtds58/6JIzsUz9W5ENRZf0lnqzXeTD6iBiKlbB+gsZQivjoKmWUNNmwAyUBHLSxwTTC6FEmGC2CT++4vgRcniNRQLIra627V1R6wfgmXI5Xa4o3603giPJw0mC955ZVTd1VmtqOQxki9elmSJMtY0gkOHGsz0vh+rRHop/eIhH+5Umk4UcIFNCuLn8llbFlHOWozNR+lpVjouHrXl4KGVkMR+PgHQCKzbU1dtBpqoAwkqRO41bWk8ljLBqYD7Gwi3bs1Uli/EYEZKaertpdZkhKYrb5I3vjrYUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA5PPF8BD1FB094.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d3)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Fri, 20 Feb
 2026 04:00:11 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 04:00:11 +0000
Message-ID: <0f16029e-35f4-41f8-b436-857d2c1e987b@nvidia.com>
Date: Thu, 19 Feb 2026 23:00:09 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
References: <CANiq72=2Hx9QYbdFee7FZzF2tt9dzAOs7A+xe=tAXZi3_o2DCg@mail.gmail.com>
 <FCF46102-0B7A-4972-90AF-985A9F45CE9E@nvidia.com>
 <CANiq72=A22Xn+Ocd9-GU_CVU88LD6i1hTHAeQPqLEf-j17131g@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CANiq72=A22Xn+Ocd9-GU_CVU88LD6i1hTHAeQPqLEf-j17131g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR20CA0045.namprd20.prod.outlook.com
 (2603:10b6:208:235::14) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA5PPF8BD1FB094:EE_
X-MS-Office365-Filtering-Correlation-Id: 521df883-6d33-4893-659e-08de70348b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWRaTGsyTEJrczdISnBnWkp5VVlrK2dHOU43dHJNeEZVYnp3cnBqMVdQb05X?=
 =?utf-8?B?R0hVQUFYL0xxazhSaG83VHQ4aHJuSGlET0NYQmFmVTNPcm9zSDg0Y255c091?=
 =?utf-8?B?S0dCbkFxLzdXUDhOS1Axc01kdUw0aHhPYVNqUDNUcjFoaGlGMHlmaXozWld1?=
 =?utf-8?B?SlNFcWxRZzlhVFFMQnhQWTQvRmRXOWdhbTNIenFQZzFZbURac0N3allvTmsw?=
 =?utf-8?B?K3FVaW1uOW5IRDFFb1NPZTRJM1JtY0t2ZGFZeTlUaUYzM0hYUFBYQjhobUpL?=
 =?utf-8?B?VlI1dWVNVEp4eTduRlZzNUY3YmRtdS9KblZTQXUxS0lvSkN2eVV2WFBIQmhl?=
 =?utf-8?B?akRONGdNUHB5akhCMzA1dk5vVXJSQm9tVVZPaFIwQmJGdVYyQTNuTjgwOHdS?=
 =?utf-8?B?RXBLdHZCdTRhQXM1M3pINWhVTVdGV05hUWRUL2tEeldPVUJkNG1Ua0JJc3dx?=
 =?utf-8?B?U1B5SFRnUThkU05IUlk4cURYYWhIdmFINTVuc05TU2QwdEQzMzQ5cU9zTk1i?=
 =?utf-8?B?bkY3OWRBa1FqdlRqa2VqcWF4b29NWk9DVDBqaklZQkcvMDJmeUZZaUc4aUJH?=
 =?utf-8?B?Tm9INlRKNUtQQ3FHUy9NMXVTTUgrMHRkaXlDNWFuNkFyWWpYL2ZaTmd3U1g4?=
 =?utf-8?B?cEtwOXpFNVh5Y2tWanNFaW5sZlhyYm84b1ZqODFlVmhjY1VvQi9EbG9LRDUx?=
 =?utf-8?B?czhadWcreXlZMzc2d1VlTmo4eG9McG9TOFBjTjlPZi9jMmJEaFNoajM2Mmdu?=
 =?utf-8?B?RXU0ZnI0clY2UU9XRm1kM2tEcXNtVU1vRXN1bTg1dHIzZmNYZk05WVgyaXNG?=
 =?utf-8?B?TWVIc21qT0RrMmRsOXNITUFCaTh2aTVhbWtPUE1NY293MzNYRHRINDlJRUtM?=
 =?utf-8?B?d2hUb1BCMnBGY1prSjExSWFuYjh5SkNWSURIZnY4Nld1aUJkL1FvNTg1Zi81?=
 =?utf-8?B?RExzYmhrZ2dlcm8ydW1Fa1BGdTlHc0d4V1B0WWJ4VzRqRUNyakRsVnl4eExT?=
 =?utf-8?B?S2RSYndscTZIcE5vb2ordk51Q2s0T1dLdmNFaXRYNmNJWUcyRzhhTGRVQUxD?=
 =?utf-8?B?MG9Vdk9kbHRxU1FUK2VGZklRdjZRbWVWTEFRTHJlY2c4V1J0ZDJOelVENkZ5?=
 =?utf-8?B?UHVIMTBYbDZSb2FneFZoekJrOU9RVkVQSmFwUXpRa3dWNk5xMVpJSXJldG1H?=
 =?utf-8?B?ei9WZVhWQWRVNjRIY3RlTVhwS0k3RVdxVFVBalpiTUdFdWNRSTQvM3F3V3N3?=
 =?utf-8?B?SkhNYkVRQVhTbWphMjhGR1QzUzhpTFlKRUt5SUNEUlBxc25iWFhWbEJWY1RG?=
 =?utf-8?B?U2xxczhFMEFWTmdlOG81RzRFUXhSRVlOSTZ0dXAxQmpjWGw5R1FEQXk3TTBw?=
 =?utf-8?B?dVZjZ1VsZ0NUWGtCanBHM2tYRlVXaGY0SkhEOFR2eWN4cFBVZGVCcWxqL3Bm?=
 =?utf-8?B?OW5SUERhbHlLUXV3eWNnZ2hmT2MxWjZzelhBTHRUcVEzek9xTVNubzBEd3Yx?=
 =?utf-8?B?cVZub3JDQTJpSTREZDJKYnhXM3R0MG5vbkZMUG1TSXZ5Q3p6a0U2WHRxa09S?=
 =?utf-8?B?UUlMbng4dTJWZW5oUlZhbFQ5UXUwSGtWSjg0T3lqOS9nRGJjdDBiNjV1ZTdj?=
 =?utf-8?B?TUw1NGZ0b0hJVERiQTFDQXluYU80alRFbW5IcXRnb2xPU2pSZXk4RkFkUUZ4?=
 =?utf-8?B?bE5iYlFOVExVckUvVXJCR2dhNDlpb2JuOXJ5bVgxTTJaTlB5amlZQW5aRzlr?=
 =?utf-8?B?aXpXRmZWVGt5cFFnSnlVb3pxRW12bksra0o2ZkF4eXk2bjZxTjFsVm5oak9u?=
 =?utf-8?B?YWVVc0wxUnM5RFlSTEV1N3hSME9XbTJPNkJ1SktOd3Vpc1I4Zy8vT01KRXJO?=
 =?utf-8?B?a3VJQjZ2K2ZROXl0S0J3RGJNakNReEVoRVpTWklMKzNkc3JJVy9JYnFzNCty?=
 =?utf-8?B?Mjk2VzZ2YWwwMDlpajBwbWI3OTRjYmIwNlUwS1VuM1pRdHBrdlVPNlNaRmV1?=
 =?utf-8?B?SzhXejlyWGg3WUVrbVdhY0JaNVdWKytyU1hmazBGYjVYWVUxNXJFS1JUZjEy?=
 =?utf-8?B?M0tpbG05Rm9lZUh1SzNQUG1WZUVUdnFVZ0NEbkRpKzRvS1FoWVA3c1A1T040?=
 =?utf-8?Q?LPRU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bktvbmluMGlFL3ZDajE4d1JEdEJ4MkhTczJZMURFTndKL2NVVnA4RXNtcnJU?=
 =?utf-8?B?Tk1VNVdjM244NXVkbmRRZmZmWTB4QXhwaGx5YkxmS2NZOGtKV1MyTXVqUzhi?=
 =?utf-8?B?RWUyUUpMdUU4ZzJOZEgydjBjT0ZqWHFncXJYelhDcnhNc3JnbkZaYitCbmxK?=
 =?utf-8?B?aEJBNUVoTWI1NkNkay9iVTFpKy9USGpNQ0NleXJMcndqMmhRR1NCMmlzWnpR?=
 =?utf-8?B?cmc4NldOT2lPYWRqbzk2U0pCeld6RE5kUit6UTg0dVVWWTIxNXpBOFZBWTZE?=
 =?utf-8?B?STFSZFl1TzR5bVBKVHN5aTE3VkF2ZC9EV3pWNG1KdW9COVljQlJ4TEpNM1Uw?=
 =?utf-8?B?VTgvcTRPZTJvcHA4Q1FHbTQ4b0RXYlhVb1ArZCtDeEVNTHZCUXNqQ3hpOXpt?=
 =?utf-8?B?SHFHNUV0NDlaZmJhUFZRTElUblVtZ0xLNTZ4WG9yWW5tOTZWMHhub3U1MWMr?=
 =?utf-8?B?NGt3S0JHNWxwQi9LZFc5MnhNdkpBTmo0YnVIOGEwVThXU1Z5dkpVSUtveXZj?=
 =?utf-8?B?WGRhTDBycVhvYVJsQ3ZSTy9wdWI5RmJjZ3hSSlY2TmVsbUVhY296RC9RNTlK?=
 =?utf-8?B?TWQvY1p0UFRUSEJNKzlqeHZqM0RTeTFoWWl3ZjAxRGo2OWdUMTFDOUswQW16?=
 =?utf-8?B?SkhRWi9pbHZ5b2QwTjFidk9uVng4eWFPTFpGZC96M0t5Q3hTc0dkRzZMYk1J?=
 =?utf-8?B?VE5aRk4wN2hPRlVRMWtJZXZ3azUzZXMrR2t1cGNNQUx0TGU5cXE2OE5JMG5i?=
 =?utf-8?B?T3FGN3U2ekZaVTJZOGN6ZXRLRUdzUURuRFdyZEFiNDc5SmhWaFI4Tm5WZVl3?=
 =?utf-8?B?ampnRWNWZWFwUnZ6Ui9qRnVyQzVzdGNFTEU2R0FqOEQvVW5YbkFmU3JEVUFB?=
 =?utf-8?B?dCt2OWtTVEdRUWcxVjIrYnBqL3FXMGlrWU9TalR1ZXhvZTg1aU5LbXV2aTFk?=
 =?utf-8?B?TkJXY3Zhck81ZjVPTlliWFV6ZndTdHZnV0IzS2dkQ2M3MzZzZTRlblN5b0Zj?=
 =?utf-8?B?SCtQVkJ0Ky8yOTBianJGa0JmNVgwR2o2Wk1sdGdzbnZDa2NEVGpiZCsxS05W?=
 =?utf-8?B?eGlxamJxUDlBVDZDVWx0MkR6VnBCSnNRa0EvcUNtZmEycXlsYXVTUnpiV2VG?=
 =?utf-8?B?YmtqY1BNVjlWUUZWaEZPbXlrSitoYVJ0U09sdmJtOGlLYTVmaXpPSW1ZTzBB?=
 =?utf-8?B?STB1bDFSL0Q2KzRsbFlENi90S004SHJ4d0cvVzE3NVJlSXhBcE9zcXI5d3Nl?=
 =?utf-8?B?TjFRWGNVY0lVOU1tYmUvTE93N2NKQkdaRThEOHRWbjFOZXN5c2JvS1Y0eHBN?=
 =?utf-8?B?VEJ0Zll4K1prTDlKeWpqZUpqcDFyUVJQeVdncDdlbE5ETldJazFiYmZXelps?=
 =?utf-8?B?dzlIbkIwQmk4eWdVbzN5aC9jYjVraVEvNTV1S2dCVElrZVJTTzJueVJTNVJY?=
 =?utf-8?B?dWsyU2hLMkhZSm0vQ01mYVdkcUgwQlI1bks1MzBReGdCeEZYZno0dWh3V0li?=
 =?utf-8?B?cjllYm9kSllVWW11MHQ4NzhYRFdkKzdkYmdsR2c3RjBFb1llZ3VpbVkzUW9H?=
 =?utf-8?B?MndkUmVZSDBtQk02UVhRczJJRm1GaUVXOVJVeE0wT0liYzdtdFRTcy93MUpw?=
 =?utf-8?B?V0p3MDBrRnNQWk93Y1FFcjRSZ2pMZEhKbEk1dWZLaXhaZTV2Z2RPR2RVMjJH?=
 =?utf-8?B?RjU4S3JhdUY2b1pJdW05a1p3NFczd2djTWpKNks2OEhGdVdXS2p1Z09HWXFv?=
 =?utf-8?B?OE9pRTF3NVU5R25xVlVDTWlPKzBrREM5cmNWVkNZVFFLaVMwSGVXbWVSVlp2?=
 =?utf-8?B?ZjNMSXZMMkRWYlRQUDdiL0lJbW83a2pRaEtGL0pXWUpqOFc5Zm1IUDl1eHBl?=
 =?utf-8?B?cWFTdUM4bmZ6STd6NlU0SnhWVUw3alhvU0hQN3Z6M0E0RDdjb3BzaWR6eG9s?=
 =?utf-8?B?dU1GMDg3YUtVcGRPZU9KMFRSYlFheE1naUFLL2dydDd2VDI4V3AwVXNPR0dh?=
 =?utf-8?B?eW12UmpBb1NmT3JQYWl6aG4zZmlGb3RTRExsOUhJQjdyZDZ2d2ZFRVh5STRR?=
 =?utf-8?B?N2R1dzJSMUp0QmVqVldEL1dzcWhidDc0dGlod0hVTUE3YzB2SWJDR1hwcWxU?=
 =?utf-8?B?YXZJWWpFN1JSd3l4dU9xQjcyYWZMTThjS1RsRyttcW0xbUpLYjdlcUxSbmw5?=
 =?utf-8?B?bXd1RjVpUWUxUWV5L3Fqc1Nza2xhaXprUFU2ZVBtSVZRNk4vdmZWQ0lQQzFh?=
 =?utf-8?B?dEhkaFJJR016Tzk4MFJ0WWcxcXZFVWgzYi9lVFp6RHA1WGp6cUI2Yk85U2hx?=
 =?utf-8?B?UlAwY0hpemhYZUdqbE4wN3MzWk50VldQZnVpM3ZFOG1aeWx2RnJUdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 521df883-6d33-4893-659e-08de70348b97
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 04:00:11.7360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ENbutY1Ta95pbALFzF/JHRnBubArlb2vIn9gLbKCqQlqpBkUoV6Uvtcoj0wD/7mUDmaTTxfS725lWWiq5vN/cQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF8BD1FB094
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,nvidia.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,nvidia.com];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C1E9516473E
X-Rspamd-Action: no action



On 2/19/2026 5:55 PM, Miguel Ojeda wrote:
> On Thu, Feb 19, 2026 at 8:29 PM Joel Fernandes <joelagnelf@nvidia.com> wrote:
>>
>> I think let us see how it goes and how much is the volume? If it is
>> light then I/we could send you a pull request from personal kernel.org
>> repository, if not then we can set up a branch at that time. What do
>> you think?
> 
> If it is very light, then we could just do Acked-bys, but setting up a
> branch is easy:
> 
>   https://github.com/Rust-for-Linux/linux/tree/ffi-next
> 
> Please feel free to use it (if so, please let me know your GitHub
> handle -- I already have Alexandre's); otherwise, we can delete it.

Sounds good, my github handle is @joelagnel

> 
> Having all branches in the same place is good for others to have a
> single place to look into, and has the advantage of being able to add
> it there as a `T:` field already.

Sure, I'll include it in `T:`.

Thanks!

--
Joel Fernandes

