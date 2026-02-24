Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIeaH2wInWk7MgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:09:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31167180DDF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB0110E474;
	Tue, 24 Feb 2026 02:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NQYAnPBd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D16210E46F;
 Tue, 24 Feb 2026 02:09:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAh20ynwc+7CB1Ypn2vYnaiYPno/7IVXU4SpUj3RfmZk4l/K1qOjm8LN7urqOfMaodKR8IC5llcvaOkliLFeASYhF5sMg2Ly/zisNUEj7l/M/a95c3CXf4K9vjF0rMx0ILBp9fGTDKwuV3cy50Lt+OqQe9giTv2y+7A/WOyKO5lhhGxCk2LNbOB62P4CPxuRO5Ea07Ch5Fg7uqBRIiw5RtdBlL3arsPnr7gINORz3/GlpMBDWgl59jVi+g2cCO1w82xggmTjxaEyYmuMvK0plDDaF3KIYOmcx6ypPuA1y59kgHbYDuQogDh5hC8H5HZMYL+V/Yis/PueYV634IfILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ZLyWxkaGdXAoIK2g3/lxDZJMmj1vg7cNvp1MAXK6Qo=;
 b=u73AODammKh9D4RptqJMfBtAAWH8Skb4/yu9MiwL1aXwI/gJG8foqAPq4mWnrhVPRFOs3jv2em0sUyfakUSbIT2ODiNGGpc+WMLEtdG2ja8aJNTReKIBECr2zhpuGwQGRtDPaXRXxZdG7H9yHIhKYgYSvYR/nplTUSchibveMdKZ1LgB8abBjT4QhYZWzZuGU5xZhIJjxn4/fm1Wfp6gkPuHX6iYb/qZfpNr2lzvE+JIVuPq0TQlcBKW5zYWyB4K39X3x+lFPyjGziba+37Subz+hMpybJmfnPko4doVO73NNxuSJM8lNPjRGES8Uxxi5d8cEaN58p4HMWQ0ya2s8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ZLyWxkaGdXAoIK2g3/lxDZJMmj1vg7cNvp1MAXK6Qo=;
 b=NQYAnPBdx2iYBgW8SGQ12MSSoNZWXiVsfIjsERbRsbVn78pDjoE27/0SR/nGvtf3IK8+KsTugEBFJwHmR/Eex2vBC9wAfkRoq6CuNl+TFT/ofw5MfXlKzy/BCCromizQ87/9l+EZ5T7rXL4lAA2XhO3SJE+z088rMI+6CQV17TGAV0/udQ6Gp4Y3IjmxxN4Md7SL3r+0Zh+tAwojwR1IN5gz4NwZVyh86rKRPidc5QMBzgvkgDDA3M2JZMpfZxZu4CVolNP+eH5KbLxRszRR7VqwZdfHL7Kj4/s+EqQCJauH3NoVYNVLy8Pt/eCQxOzQ1ALhN5YAQNm83xv2H3RzpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by MN6PR12MB8490.namprd12.prod.outlook.com (2603:10b6:208:470::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 02:08:23 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 02:08:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Feb 2026 11:08:19 +0900
Message-Id: <DGMTQKXL3U6C.3J5W7ZI3B0B6H@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <linux-kernel@vger.kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Dave Airlie" <airlied@redhat.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Koen Koning"
 <koen.koning@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Nikola
 Djukic" <ndjukic@nvidia.com>, "dri-devel"
 <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
 <DGJN2M93S4ED.3272CCZWMRYOA@nvidia.com>
 <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
In-Reply-To: <a7be758a-65ee-4572-b8ba-6d4a8d65af73@nvidia.com>
X-ClientProxiedBy: TY4P286CA0046.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::13) To SN1PR12MB2368.namprd12.prod.outlook.com
 (2603:10b6:802:32::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|MN6PR12MB8490:EE_
X-MS-Office365-Filtering-Correlation-Id: 539544c7-7309-4fc5-fe1e-08de73499657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eHVLd1p3RXpwdmZkR2FxckZNakkwSDdxd213NmV4VnkzcDZFTUlvWW5sSklp?=
 =?utf-8?B?dHpoMDRjU2dDdmFYZ0owYkIyZDlYQ1hqVEQ2NVVWcGtFdTZtcW96TW5WcFZM?=
 =?utf-8?B?eWJxL1Y5Ykg1d0FIVXIwbVBZdmxEdXRjZkJsWHJCL2VuZVJkYk1ybElBeEFw?=
 =?utf-8?B?WVFxcnpnYVJSNlcvclBiKzNZZEQ1cDVvcUZRWXJ2T0hqOXlXUC9QM0JRY3or?=
 =?utf-8?B?MlBYRzhNeGpmek0wSkFmbzBYdGIvTEFtNU1vYTFhY3V3TEl0V0l1dW15VXQ0?=
 =?utf-8?B?ZXhqS0FEVGxjK3R1dkZQTnVYS0o3Z3VHekVwUnhZMCtIeEVJM3lSZFphelBS?=
 =?utf-8?B?TW9DM25NMU1ucWRKcEVyMUNpQ0V2aDZnUUQwM3QrWkp4SnptWW5GSUJOSVho?=
 =?utf-8?B?QzY1dXJjT1RSeE9kTkVnNVIyVkYyMzdLMVd5dHpERWh5VmFNcC9RRy8wUUEy?=
 =?utf-8?B?Y20vZFVrUVBCZUMrejZqdTcrdGdiSW5oMmNLeUYzWWwwc29VT3AzbmJkTlRZ?=
 =?utf-8?B?Qk9EbzIwVGtRODdNQ1VrVVM2TTVRTnpnUXl6U0FVNjFUUUdLWHU2UW9Ueld4?=
 =?utf-8?B?S3MrV0MwWURPbmVLRStRendpWFVkbHFqdlY0ZmZHcmZmL1YrMWtTdW1oV2RN?=
 =?utf-8?B?ZFFwZDFBL1hPamd1Z052NUpGSFZKN0g1dEdVZXRMcjBSOE0yY29sWm9COWhv?=
 =?utf-8?B?Tm9zMTBIZTlNaGhuc3o4ZE9MWDUzTktQOUtKajJ3M25tNGlRc1NnZ0FyQWRy?=
 =?utf-8?B?bmk0V0tJNVZrSUhOVGtSVHNqb3hlS1prMVlhcDJQMVR1eHlJL2F3MjdkZDNm?=
 =?utf-8?B?cnF2OFg3V0hBZFA3NzUxK0swR255Z0NTU1h0VVVxUVdHNWJ1di9CbXdZdnRP?=
 =?utf-8?B?UmxHMHY0OEtVd21hQzlmVjVPdnB5NXhDazVpUlpkUGw2MXU5NGN6VlhSOHl2?=
 =?utf-8?B?YlFta3lQbDl0K1VSai80OFQweU1IM3A2WklQWThYMCtReFNBSmZmUFNHa1ZW?=
 =?utf-8?B?Y1JHV3FRVkt5MmxST25JZGxEZDI3TzhoYWxuVTFRUE1IcE4wTHRUK0dRYVlj?=
 =?utf-8?B?ZUF0aVNOMWlNSjk4cmR3T3VNNC9JTTlvUzY5M2U4YTVYRnhKSWVnQ0ZtWWty?=
 =?utf-8?B?NFZCQmJVR21OUldNdnpNOUN1bGV5QlNzcE1GQ0l1Q3NDSjl3Rys4YWFFam5R?=
 =?utf-8?B?R1VrRG5IU3g4Wmp1dmxEblFxV2R2anluai96WlNucDVXU1JGL1JnRlFsWlhp?=
 =?utf-8?B?c2F0T1cvN2NGYWlwZVd6OEkxc2lYV29CT1l3ZSsyb3IwSFlIc2ZiS2M5UktF?=
 =?utf-8?B?OE1wN092QWR0SHdpYnY2aWVrRW5sRzN2enh0RlIzL3hyR2ZDNjZ5NGsrNnRr?=
 =?utf-8?B?Z3RrZlVSRlNTQ1JMRHExVkpmRnltMDIxa2paMWpFYTF1VUNIUGNhSHFEaWZJ?=
 =?utf-8?B?WXdUeGVhWDZ2WGMxWmxhS3ZGUWRsZXcxUmorMENmTkxqQ09RVHUyQnhVcDJn?=
 =?utf-8?B?aUdCQW5Nc0ErNkhEVlkxYVFJaVpwVERaYnRjWXF3VDNxTzlKVlZHUmJPK3dV?=
 =?utf-8?B?NzZlUHd4VVhGdDQrTi90M015cXlnMm5OREFCSUV2L0NYaUtsL2Z6ZGdKcWJX?=
 =?utf-8?B?dWQrRWpZYnJkR3JMT0RsMVVqR21WbVFkMUhWc0RUUUVuT2tEY3oxQS9nZDRK?=
 =?utf-8?B?NEo2OVVGR3RIVUlxZ3hWakFzL1lOZlRITHhXTDRkc3d1YjFuVDZMSDVRYS82?=
 =?utf-8?B?RVFoWWo0NFN0NVF3SVJ4cGp5bTdJL05RZlF0Q3B1ZGR2L1VHMS9jSXI1VnpQ?=
 =?utf-8?B?NnU1ZDgrSm16U3lkNXFsVnhUM2JnZTY1MXVTZWFzY1l4WXgxQWVLWEZFUUtn?=
 =?utf-8?B?dHAyQmE3S2lORXYxRjQxV1hxb2ZXM0lNdlBVN1pJanRlUGZkZmV6YU1SbGlR?=
 =?utf-8?B?S0xGTHhDd2Q0N2dIZnhLK3NCU2pGbUdtTXdEZmk5VDVzUUREUnM2U3FUazhw?=
 =?utf-8?B?OUZQb0NsMUh3YzR0NHhZY0x1RXNYRlZ6ZWdva2hYR0J0VTR6WlZ5dENOTWhU?=
 =?utf-8?B?dzVnMm92azMxcEo3K1FFWmFWRmJvajVrM3NkaEhFSkxDWCtPSGI5cmt0WFo4?=
 =?utf-8?B?LzhrOUhhYS9RdHkvUG1qd1dtSWtFSUhZaGJPOHFDaktkZTQxS25LRVVtTU41?=
 =?utf-8?B?Znc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U29lMVJoV2t2MkhucCtlWVY1ZmRORFVDdVhBd0pwa1Y5Qm5YM1ZWNFlscGMy?=
 =?utf-8?B?L29qNVFaTG1BNHhVVTVlc3BGTWdDT1VITjRoTXBGWG8xRGE5eG1uN3paNlBU?=
 =?utf-8?B?eTV0cytoMlRCMVBDOElxRjFhY0cvZm5uYy90dGtNUXRRbys5M2xrYUZkOFBq?=
 =?utf-8?B?N3k0cWFqRkVTZXNCanFGa1ZKSzFOSU9CblJGdHNXWHZtdUc2MjJ0MzlkYWla?=
 =?utf-8?B?bHp0UHMyRDdzSEhoZW5oeFRxYW5iekRqN3gxWitOcWIySWJVRzE4ajdLamNj?=
 =?utf-8?B?d3FaeWdKeFdMN0RuWEx4U0F5VVU2SWY0SXVYQ2J4WWhqVkNDQithR2pMZlRU?=
 =?utf-8?B?TFh1YUI3eW1rMk51Z0hyRm9HbWczWUN0Q1ltSjBTM0I4Wm5lUjV5dWltQmti?=
 =?utf-8?B?dFpaYmdiZXVhN1pKajVqV0ZWRjV4QTRPK2xwS1doVllxZm1tNS9oOG1FazdH?=
 =?utf-8?B?S0kzdzVTcU85ZXM2S1MyOGN5NW5WZW5tcXNLTVhIR2FONS9tTGNLK09jdW01?=
 =?utf-8?B?Sm5Ya25wTHR1aTNUWE5xRms3NXBvUUpXOFlYdFhTRzBIc2d4MXQ3Qk4rMTRJ?=
 =?utf-8?B?dUpsaStkUWxUOWR0WFhQNHJ3VExzZHFOVG05UDBGeWNEQ21aeVVWd0NHWGJY?=
 =?utf-8?B?c250Mkk5YmJvWitkNzZRYXJZbmx5bjNUTGFnWjJrUXBoL3FTdHhSRm12WHoz?=
 =?utf-8?B?c0FMdDA0TW1MbHExUVRFR3haYVZXY1VKcnQ3QTBtUXFyS3BhVm9HMXkzUDV6?=
 =?utf-8?B?ZkZLUGFRbVhKUytId2VnMHV1OFJsWk1jb2dGaVFaVTdpZXBoYnVPYUYvME9p?=
 =?utf-8?B?akYxUTd0VnZGVHBtYm1GcFdvalZsbXQxZCtNaS9OaUxid0EyUit1R293NU56?=
 =?utf-8?B?NkpBd2xRd1ZqS00zWHlBbXdWR0ZMZ3JLVGlrRE14dk5ESkVmQm9KZTVDRjhn?=
 =?utf-8?B?SVdHK2JkUmhnMVJKaTEzV2JiUDRBbW1rTXZDb3IvQnIvcnl2QzkwT0cwU0hR?=
 =?utf-8?B?Z2ZDQTFEN1pvK0lpZDR2N0QrdGtoVkQxMUpnMkZDeVhjUzdiSHZsaVZ2RHNt?=
 =?utf-8?B?ZmhocXRhUWROUkNHOU9jdjUvWk5QbUl3M3lBVXpiMTQxaTN4R1p3aXBCTDZQ?=
 =?utf-8?B?bmg2T0dBWklEWk04RWdsUmRmYWFlOCtVc3ZYWkpDZmNuN1hnczdiQjhoZDRx?=
 =?utf-8?B?TUxHbWxCOUNNUUpldG94Y25CZVpZVWVFQ2xEbXNBem1lT2ZWYWZReWN5R2FY?=
 =?utf-8?B?UXZ3aWJncGdEcVViaUoxRUNSV3JCZzZoUnFjVWxIOFNVQ3lvNU14WmFnb3FH?=
 =?utf-8?B?RGplN0IxTlpxczJqdmt0a1JvSjRlMnZuS3plQzNENjh0UVhYdm5pWnNPZ3Y0?=
 =?utf-8?B?V1o5YjFXSThFbTVuZzlKTmhKTUo5V2RHR3RVelBpYjh2VzhoVkh4MnNwb0Rn?=
 =?utf-8?B?amZuZHJOZjFrRW1EQlFvNUJCRkZPajRRdWtqaThRdDBWWHJrbHFmeldUc2Na?=
 =?utf-8?B?RWk1Zzk0cnJoUTdsUEkrMXA5Yzl1UFdqdzVXcVVrRmhycjJSUTgwKzhIQlZl?=
 =?utf-8?B?S0RaQ2o2UzZhK1E2SkxqZ29ydUlaUHlRQWorVEQ1QkdYK2srK2JnMm5FOEFN?=
 =?utf-8?B?cXp3N1MrUW1ObFh4bzNSZ3FvOFhyQll4V3VJL2NrSmFic2lKNjU2b0VjTEJZ?=
 =?utf-8?B?UjI1bE8rNlhHOHhwK1RKRzB2YUVOZW9MMnNjUU1VN0dCNXR2VmtweG9FMmhP?=
 =?utf-8?B?N20yNFJzYzY3YmV1eFVnMElRTCs0V1ZwMjN6TUtjRHlUQXc4V2ZubU5YUStM?=
 =?utf-8?B?bEs0bElBMzc0Z2Z1UWJId3hVbHF3TTllb081MFMyT1o0ZUJNa2ZLMHMxU2pK?=
 =?utf-8?B?S01jRzl3M01qYlhvSnU1dytIMTZBMG9jNTB4a0ppWjN1T0xNbDJqVFA3aXcw?=
 =?utf-8?B?UVpKZ3h1VTVuYjB4OHM0MHRsNll3OHl0Vm5sckhTN2lPN3BnYVBES01waEZI?=
 =?utf-8?B?dlFzKzZIanRxSFpRV2ppaG1ZcmxkdnpSMklyeVUxY3ljdDQ4NTJpcWM1aDUw?=
 =?utf-8?B?N2FON3Fvdys4eWk2NDhjNlhKUU5lbnhtTTJ5aGV5eE1ManhTTUkvS1JyYW5n?=
 =?utf-8?B?NkFKSlNPRTN0ZHhKVUhmY2kydnI3em9iUkZneGNjMHdvNnl6OUpTYlVsajB0?=
 =?utf-8?B?dTc1SjZpVXRGa1c2QVFNTDRndFdaVWZiRzYzVThvYlRNTWl5Qlg5RHJVaFhV?=
 =?utf-8?B?QVo5bFZTWFpGa0daMThQYUVrejhnc0JZMVRqRFB6SmhuNThraVJTVFBjbjZS?=
 =?utf-8?B?dTRTcFNDOXVTdTRROXQ3K3Nlc1NKT0ZoVG9ENk5hR0xKa2ZmcWtUblZMZXZS?=
 =?utf-8?Q?Z/HrslygYxmH1y/6OAr/nBbKbuQO6JePBazJ9xTQitOUZ?=
X-MS-Exchange-AntiSpam-MessageData-1: rABNtj2/E0S7fw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539544c7-7309-4fc5-fe1e-08de73499657
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2368.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 02:08:23.4030 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27un53uYtqLoVpYamhKyQFK4P/lErai5IhjnVVwDlGhnXM6HWVvitXMskOXVbsdYGX5uZY3JgBI2vVsSkMxGsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8490
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: 31167180DDF
X-Rspamd-Action: no action

On Mon Feb 23, 2026 at 10:13 AM JST, Joel Fernandes wrote:
>>> +macro_rules! clist_create {
>>> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) =3D> {{
>>> +        // Compile-time check that field path is a list_head.
>>> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_hea=
d =3D
>>> +            |p| &raw const (*p).$($field).+;
>>> +
>>> +        // Calculate offset and create `CList`.
>>> +        const OFFSET: usize =3D ::core::mem::offset_of!($c_type, $($fi=
eld).+);
>>> +        $crate::ffi::clist::CList::<$rust_type, OFFSET>::from_raw($hea=
d)
>>> +    }};
>>> +}
>>=20
>> This uses offset_of! in a way that requires the offset_of_nested
>> feature, so it doesn't build in rust 1.78.0. The feature is already
>> added to rust_allowed_features, so I think it's ok to add
>> #![feature(offset_of_nested)].
>
> Maybe I am missing something, but why should the feature be gated behind
> that if all compiler versions (>=3D 1.78) support it either in a stable w=
ay
> or via an unstable feature flag?

I think that's why it's in rust_allowed_features. IIUC that's where we
put unstable features that are stable enough in all supported compiler
versions to be used.

But, rust_allowed_features doesn't apply to the code here, so you'd have
to add an allow to rust/kernel/lib.rs.
