Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIDZKaO8lmkylQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACAC15CB61
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6499F10E6A3;
	Thu, 19 Feb 2026 07:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P5MJTfQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013000.outbound.protection.outlook.com
 [40.93.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D647F10E6A4;
 Thu, 19 Feb 2026 07:32:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdUsyRo52mB/7Jo8JlD/dQziGldLf48BNU98PR4TCo0wLPceSn9yP4YIYwC6P1A82u34LhBFW7z1xdhMVHZTzr2USfcuJrm7mtA4f+HwgpJqfxpqba2FOUhP3sF44iKO9Lc5cgrDgI7z/O48Q8S+BT/7msrZSDx5coZC6/2rfqfybqvtcuNVjkvA4Ch1cnp6cokItbB214N4oZwNUAYF23NL+OA4dIM9zm224pUiOAsZ3SpIcUK45Yvso3PaB49sB+MyxwQ+UWAX2BvTBCZNhOPWvgKoF6Rjk0M1GOylhryNIZB+Yv0bWazxGgaMds/Z7/Bpsy+CxwXo1m0jq9OapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h5QWOzuRDkVZzrs86iA2FgbsG85pkVEEwAuRoZfrPOs=;
 b=AHlUfNAIqHFHdTKxTVbyXLrFMeeo0wzHbUxuWfP9Xxc9wk9tWcuFx9wN25V2UQY8wfJK9f4LC8comvnKThh+HfwaJmnn6fsy04CYLO3mLRyfyjT2IFOsUdqr6L36oOcs3bdatiTks+fKLI1MCXN9LbZGQg/qZPtiSasrYbhV+hlQoSniNg4yBIVBqGNrAKuaQVLL/+VZucnzQypDO6zv8URId5fsPoDkchQXXdpHnUOzk76HUbn3eB8XPFzNBxQyhXX6HxYxyOkD+FRwwiRMcivhjI6mPUh/J3njMDnZO/pQ8Y9IzfHO4WD7lH4KR4MLvLlxx1b3I5jl2HDWDAUhXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h5QWOzuRDkVZzrs86iA2FgbsG85pkVEEwAuRoZfrPOs=;
 b=P5MJTfQQI+J4IqjDcOvkX5wZgHDo4iwAUj5RXmC552RBPCI/uPFtL4yXciN/SpS9ha4MLck8/oJqV2789Bgp/rXHalplZE08Idj44dnT7FIVfF/AGuzIiGpoZYs0ooCVr5mSxJvn3wOqEOrgOjBJXeYaooccwCB6DC2esevCV1BJbLbaUtXGttovkev79/tiZyFuF8RieF1Y3QUlSxbGeQX5ljXtT9OQR3W1gk/hVKF0gt8jK/ItbA6hrbAk0LTJb5E3Z30Y9//l13AB6gyiswfM/f2EMo8wxPyAeWkkQZ3T3XW/d0ODMbHIdmzddugbeYX7yti7k0nReTX+KojDBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 07:32:44 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 07:32:44 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 19 Feb 2026 16:30:57 +0900
Subject: [PATCH v2 8/9] gpu: nova-core: gsp: support large RPCs via
 continuation record
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-cmdq-continuation-v2-8-2e8b7615536f@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0144.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::8) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: 46df6398-2aec-46b0-02c5-08de6f891243
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWxJbmtJWjJsaGE5Q0h2dEhvZUlKUFdwZldUYlovZFFBN3M5SU1pUFg4TllD?=
 =?utf-8?B?TG0vdlZLWEtCUkVvbWJubTNFUktEbFNvb1ZCZzlrWkVGU3VybkpYYXQxYjdO?=
 =?utf-8?B?L1docERrUHRXQ1ZBS1c3cVRjVksvaEwzR2NJN1B3K2Noc3puZkU0Rkd4eWxO?=
 =?utf-8?B?ancvNWhGUSsyYmFGRnN6dHoxMEZhVlpBL1VjR2F0TG1sSWtXMXEvMy9YbEE0?=
 =?utf-8?B?c1dDMGI3RVRxU2lnUVB0Uk9rdldGK2JFMXhiWDZCSFBldFU1VXNNWGtSNTl4?=
 =?utf-8?B?eVBOVjlVM3RBa0lsMlNUTjJRZnlmT1E2NTF1eTlZRmtGOFROS1ZaQXBBdG8x?=
 =?utf-8?B?U2VVVFZwSUVPVW4rWlRXcmRscS9jWmJlU2FUeVgrVXphbmpiTTU1RFBhQzlJ?=
 =?utf-8?B?OVFFZHRhOVJoVFY2K01xeXg0UVNLUEFRcXVKUkMydlgyR2lEUXdHT3c2TlJh?=
 =?utf-8?B?U2hMa05sOWhCMHJUTFlQcXExSXZDTXFqMFJyV1BmQWpaZzVTVk1hczEzQ1Rn?=
 =?utf-8?B?eG1WU3ArR25oYWFKMlpnUnJUMk5OR2pTTi9pRWdtZG5KeExaSVVpYklmd2xR?=
 =?utf-8?B?d2lKU2R1YTl5SWxNcHc5OFN0djRiNWZ1bHE3YmQ5bXBoYWVsenFTUnYyejV5?=
 =?utf-8?B?Vk5FYUlNYm85aGJtbGMwZDRPeDY3cWVOWFNmNDc5SE1mbGcvOHNPZUY2WGVB?=
 =?utf-8?B?dUprdEoyNnNNZjg2VEU2Mm1iL2JEeUQ5Z3loQXlvcXVDdEJYemV5Z3pKMWFy?=
 =?utf-8?B?M1dqQ0JYUktlR1Arbll5U1FnTXZDTTc5VGpSbzBXdVByK3JjNyt6UTdqa21R?=
 =?utf-8?B?eUxPM3MyVS94YnZJYkhsSEptTmU2a2xEMGJlRnNqcWlMZHZlcmZIQ1pTUEs5?=
 =?utf-8?B?TWFDWXE0azllY3VranRGOTQrNEkxdUQxaVp3RGs2a0lFL3NMTnEzN1RLWkJ4?=
 =?utf-8?B?aGRtYjdmZjkyTWplMXRNSFVRQ0JEbUF6SGxzRGJESGRPOUg0MUJTT1JlWFFH?=
 =?utf-8?B?bktGTlNiRjMrYkVubXhITSsrV3FSMGxTSjJnWVdDdWN1YUlONkxMZk5HeWlI?=
 =?utf-8?B?YjQwNEUwdFBNQlRHblZRc2U0dU1ZQmp0TFlDYk9ZVTVmUWM2SHk5ZjhOZFVX?=
 =?utf-8?B?T1F2a3BxckJhbzR0WU9DZ1ROWnpXUzIxVnd3UTJZS0xVZFFWVXhBbzMzODQ1?=
 =?utf-8?B?VFZrNmlvbEQrKzBGeG9pNjBqTWdKbHBvdTZhMlRMQzlrMzF3MExGc0JQNVNn?=
 =?utf-8?B?RVBFWWRZZlpmUnd4SmVabzFDNjBhWEhQZzg2WGhiR08xVFJaZkt4L2ZzWlFO?=
 =?utf-8?B?a3VnVDlTWG9KNjR5bDV0RmVCcHUxeDJsVlhoL21NSlVmeFRqQ3gyTEw5ZzBO?=
 =?utf-8?B?R1dweGplTDVPS0ZiWVc1YnpIZzVmZ3FLR3grZ05Gd3FUNytueFNMYzZiR2Vw?=
 =?utf-8?B?a0ZXdUd6Rks2Yit4bGVQTXJ3c1FTeHZRODNkS0Z2YUJmVks1b3ZjdzJTNHJY?=
 =?utf-8?B?c2dRU1Z2Y2pFcC9waXpPRHp2V3V3ejRkZ3hwUTExN09ZOFRQNUhqaUkxSGc4?=
 =?utf-8?B?WVJleUlxK0d6N3lMazdpc0hRNnQwcHJlQkZVYmx6eUxUTEJNcVlCN3g0MUlD?=
 =?utf-8?B?NnRwV0tQQ3M0bEMyK1VhU2pacFhKNHBrZDJ4SVJ3eUJIWXlmNWh2clhvanJW?=
 =?utf-8?B?NzlzVnBCa1I2UW9aMmxuVGVZUGpVQU5iejkrMzRMWjEvWE94cVZ3azVQMUxR?=
 =?utf-8?B?Y0NuNDA0VVhzbURoU25Sekh3VVFTMjNaT2Jkcitmc1ZaV3dWbi9EamNZV0tR?=
 =?utf-8?B?dEZkUzc3azdUZHMzTEd4cEYrcWVCam9zcHRiMis3L2VubnZ1WGwvdmFjdUxt?=
 =?utf-8?B?RlRrSTE2aW5iMmVXOTI1MlFsQmI2S0pCcnpkTklOSWFsWElsYkh6eDRuci8y?=
 =?utf-8?B?bjdjMFAxenJkTVhBOWFwWGFTY0VtOW5WQmhuMFFqVjZrdmRLMnZya0pZZHAz?=
 =?utf-8?B?eERtMVg0K0c5Qnpka0RYUmZSSWJKTW9KdEpzT1o2ZDArYS9NSDg1dUFHSnkw?=
 =?utf-8?B?djhZNWdlZWhSRFZUZzcrUkJXYmlBYzFlZGxLS20rYTh3VlJreWVoNEJVSU5h?=
 =?utf-8?B?Zi9FNmdqdUZqck9JYWpkT21lSCsvTGI5cHlLMTBqZWNVVlFocWtkTmE3YnBG?=
 =?utf-8?B?UXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDI4bW5hOUFmOGFsMjVrcG9ndUVHbHRkd3ZEY1M2V293QWR0VVdBNzNVTUZR?=
 =?utf-8?B?eGFlUWpxdVg5VHRxaHhqZkljMFR4YWljdXkrRGdFcU1XN05WbXczUjlDNHdT?=
 =?utf-8?B?Q3RlZzRkR2tYMytwTnNmeW5kek9wUlJrcUdicXhNdVA4UFBlaTNtZC9sajVX?=
 =?utf-8?B?eHREbDYrVjFUZHc4cVh3SUN1UWdmNUs4aWZMT2Y3cFl0Zi9FUUJDaEJSZDFw?=
 =?utf-8?B?UmpKNC9yRG5CVjJqcVhaR0g1Ulo5YkQydWNSZFpmT25KWkMzM3VkaUxMVndp?=
 =?utf-8?B?ZmJsNXArdGZ3VGdkZVlqRC8zaGdFSFJPbW1CZm1CTlNiZEdlMnBGdXgxWjIy?=
 =?utf-8?B?Wm1FODFEU2xIbmtoREo3SHRQYit3dWQxNThXUGVRWjFURCsvdVZDaDhqNHRE?=
 =?utf-8?B?ajdMaTV4eHVzYmhqSUYzSzFyY1FZdUdkclRTNHFVaURrQXpWQ0UxOVNRSXls?=
 =?utf-8?B?bENoNWt4NnlVbUVpTnlGNTBsdGZmUVRVZlZEdTR0SGFkZlFEWS9UeEIxMFBx?=
 =?utf-8?B?NUM3TlRPWi9vUjFrRkRMWkIzZlJlVGg5ZzZBV3BqWTB5Mm16Q2lpdTZmdjA4?=
 =?utf-8?B?ZjM0RzJNNXQwSHZ0V0w2dXBOck5la2JpVWJVelQxU1pXZmJBNUhVT0RiVGQ4?=
 =?utf-8?B?KzJqUlVEMGlEMHdTQXN0RkUrRHJvNnlUdm5vbyswR09vdUJ2SXNseklJaWp1?=
 =?utf-8?B?WjM1ajNpeks2WXdyY0xqaFF4SHZ3SnA4K0dETXhzaXQyVkNXM0QwUW4xQUhl?=
 =?utf-8?B?TFFXS2RTVkYzLzFZRGRVRndZbnQ3VWwvL21nOTVKU3ZrMDc0ZFhHZDlKMzlW?=
 =?utf-8?B?ZlRSbUVlR0cyMEdVczVMZUVoZ2tmSnltcks5b01hR2RPc2s0YlpDN2tmempq?=
 =?utf-8?B?aEY2c3FaLzM0SWdHSFBKS3RaZXA2aExLZzB3Z0wyYnBRQ1o2aVVicEMwKzV0?=
 =?utf-8?B?ZjJPNHVKbXhUQlgyNzUyWWU0ZDFCRHZZQWJNb052dlgrN3FOR2tRTnFqNHdW?=
 =?utf-8?B?c2pvQ0lZNHR3UXRYU05ya0RyWE9SUkswUTJkcHpDczlLWU5aaGM5QzJvb1Ax?=
 =?utf-8?B?dURWTVhTY2lOZnBUellWUDRMSVcwZ3VOYU9ubGVkK09ONkd1MVljdDhPZmsy?=
 =?utf-8?B?d0xSRmYwM1hDeHJUUnE0bGRKY21QeCt0YkErRWxOT2dtOHZ5WGxiakJldHZK?=
 =?utf-8?B?cGE0eEFnejhkYnhHcG1SSlgyOEdwcGxzVXZ4TjNiQTJIRFQvWVdldjlrd2Ro?=
 =?utf-8?B?aDZlbDVOczQxaE52dm5WKytnKzdMSHNQek9uWWp0aGMzZXhaaEdJVzdTQ1A4?=
 =?utf-8?B?VldwbGJpQWl4cFFld1FWSUtPaGZwK3NjemZFYkFjMDROVVZ3ck9PRTlSSC9l?=
 =?utf-8?B?VEJRc2cxbnlTbGJlMW5XdzBZMmkvTzRUNk1XK2Nod3laUm13ZE1kRGpIQ1dD?=
 =?utf-8?B?MzErL2k3dmZHSmlTeTdXTi9Yd3JWbXd2TkthS3pVVFpWTEV1MlhCMy9oYVJG?=
 =?utf-8?B?ZHRLTk9XdDBSVHlXbkVodEZ1c0Y4V3ZrNGRqQXN5Q2JGVFFNUTRZQTA2SFJV?=
 =?utf-8?B?L3d2ME9hSnFtL3lBS0hibmhOUXhSaXlZcGtjd3JSeUdSdzZqSmxXY1R5OHpJ?=
 =?utf-8?B?SWlMRDJ1WGRtNDZJOGVjTHNYTU1FcGlOT3RId0hveDZJbDVnOGVneUJXZVZx?=
 =?utf-8?B?MjFuS0RKeGkvak8xcDk4aW52d1g0T2RUN2VlTW9CVzlTZjFvaDhQdnZqanBT?=
 =?utf-8?B?MGJSbVNMbDFEWE1abnRodUJTZ25qNWZDRjlrYkdxSXBRKzk1TjFqNzdWbjli?=
 =?utf-8?B?cDNSWWd6ZHpKMm1LQ25uRVZvK0ZYTHBtWm1IYTd2UFJBL0lSRUxCNitQNmVP?=
 =?utf-8?B?aVZodUtjemNLcXB2TDFDZFhxWlFrdkc4NUsrcWdEV3hQRWFoZkcrcExoRFJ5?=
 =?utf-8?B?eDBtTHEwN1Q2REdTeXQzcG5vZjhMWFZ4SnRzc1lSWXd4T1FmKzFNdVkwcVNM?=
 =?utf-8?B?R0FDNU5IOVZzcXNlaUY5bjMwdzBjT0M2Ky9BV0IyS0t6NWczUEpqb0dUYVgr?=
 =?utf-8?B?MGZ3UFVxM1VSZ3k1S1Y2RndaQzVBODZXVkVzMHNmOHpCdFJLa3J3dmp0L0sz?=
 =?utf-8?B?cE5LcjNRblRBdkFselQwcFVyakRCQlBLaDd5SFVudlMwRHVmakFWSFVldXZu?=
 =?utf-8?B?V2NYMERJQUdQRWZMd3IzVzhZV3FJak92K0ZGajVNK0NUdHVGV3A4QmVpbjI0?=
 =?utf-8?B?UG9QNXV6VDBPOFFVdVUrS3ZYSHRGM2ZnY0xzeUtDam5OUEFvZGorQ05wSWUz?=
 =?utf-8?B?QWN3cm5CQ0kxM3pzZzlOUmI1NGxTdUUyYnlVUFhWY0RxdTRJNWNjUE5nSDVS?=
 =?utf-8?Q?e+bIOKxRWRxnWRrDavCVKYh2p5TBbOccG2SmNL/VUVP4v?=
X-MS-Exchange-AntiSpam-MessageData-1: 8W0pN7gLshxaUA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46df6398-2aec-46b0-02c5-08de6f891243
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:32:44.1532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0BwOw1dWBsSasvI3zU/PUqM3hxCe+ad8SQ8+gDLGy5/HffuVMzPK8M39BPjEgdJsf746EMVhkgzJSgQ++F2QZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
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
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1ACAC15CB61
X-Rspamd-Action: no action

Splits large RPCs if necessary and sends the remaining parts using
continuation records. RPCs that do not need continuation records
continue to write directly into the command buffer. Ones that do write
into a staging buffer first, so there is one copy.

Continuation record for receive is not necessary to support at the
moment because those replies do not need to be read and are currently
drained by retrying `receive_msg` on ERANGE.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs     |  43 +++++++++-
 drivers/gpu/nova-core/gsp/commands.rs | 143 +++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw.rs       |   5 ++
 3 files changed, 187 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f832252ae45c..402b0b9418ab 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -29,6 +29,10 @@
 use crate::{
     driver::Bar0,
     gsp::{
+        commands::{
+            ContinuationRecord,
+            SplitState, //
+        },
         fw::{
             GspMsgElement,
             MsgFunction,
@@ -439,7 +443,7 @@ struct GspMessage<'a> {
 
 /// Computes the total size of the command (not including the [`GspMsgElement`] header), including
 /// its variable-length payload.
-fn command_size<M>(command: &M) -> usize
+pub(crate) fn command_size<M>(command: &M) -> usize
 where
     M: CommandToGsp,
 {
@@ -507,7 +511,7 @@ fn notify_gsp(bar: &Bar0) {
             .write(bar);
     }
 
-    /// Sends `command` to the GSP.
+    /// Sends `command` to the GSP, without splitting it.
     ///
     /// # Errors
     ///
@@ -516,7 +520,7 @@ fn notify_gsp(bar: &Bar0) {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
-    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Result
     where
         M: CommandToGsp,
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
@@ -575,6 +579,39 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         Ok(())
     }
 
+    /// Sends `command` to the GSP.
+    ///
+    /// The command may be split into multiple messages if it is large.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the variable payload requested by the command has not been entirely
+    ///   written to by its [`CommandToGsp::init_variable_payload`] method.
+    ///
+    /// Error codes returned by the command initializers are propagated as-is.
+    pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
+    where
+        M: CommandToGsp,
+        Error: From<M::InitError>,
+    {
+        let mut state = SplitState::new(&command)?;
+
+        self.send_single_command(bar, state.command(command))?;
+
+        while let Some(continuation) = state.next_continuation_record() {
+            dev_dbg!(
+                &self.dev,
+                "GSP RPC: send continuation: size=0x{:x}\n",
+                command_size(&continuation),
+            );
+            // Turbofish needed because the compiler cannot infer M here.
+            self.send_single_command::<ContinuationRecord<'_>>(bar, continuation)?;
+        }
+
+        Ok(())
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 8f270eca33be..e722c6091ec8 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -4,6 +4,7 @@
     array,
     convert::Infallible,
     ffi::FromBytesUntilNulError,
+    marker::PhantomData,
     str::Utf8Error, //
 };
 
@@ -22,13 +23,16 @@
     driver::Bar0,
     gsp::{
         cmdq::{
+            command_size,
             Cmdq,
             CommandToGsp,
             MessageFromGsp, //
         },
         fw::{
             commands::*,
-            MsgFunction, //
+            GspMsgElement,
+            MsgFunction,
+            GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
         },
     },
     sbuffer::SBufferIter,
@@ -242,3 +246,140 @@ pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GetGspStaticIn
         }
     }
 }
+
+/// The `ContinuationRecord` command.
+pub(crate) struct ContinuationRecord<'a> {
+    data: &'a [u8],
+}
+
+impl<'a> ContinuationRecord<'a> {
+    /// Creates a new `ContinuationRecord` command with the given data.
+    pub(crate) fn new(data: &'a [u8]) -> Self {
+        Self { data }
+    }
+}
+
+impl<'a> CommandToGsp for ContinuationRecord<'a> {
+    const FUNCTION: MsgFunction = MsgFunction::ContinuationRecord;
+    type Command = ();
+    type InitError = Infallible;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        <()>::init_zeroed()
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        self.data.len()
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        dst.write_all(self.data)
+    }
+}
+
+/// Wrapper that splits a command across continuation records if needed.
+pub(crate) struct SplitState<C: CommandToGsp> {
+    state: Option<(KVVec<u8>, usize)>,
+    _phantom: PhantomData<C>,
+}
+
+impl<C: CommandToGsp> SplitState<C> {
+    /// Maximum command size that fits in a single queue element.
+    const MAX_CMD_SIZE: usize = GSP_MSG_QUEUE_ELEMENT_SIZE_MAX - size_of::<GspMsgElement>();
+
+    /// Maximum size of the variable payload that can be sent in the main command.
+    const MAX_FIRST_PAYLOAD_SIZE: usize = Self::MAX_CMD_SIZE - size_of::<C::Command>();
+
+    /// Creates a new `SplitState` for the given command.
+    ///
+    /// If the command is too large, it will be split into a main command and some number of
+    /// continuation records.
+    pub(crate) fn new(inner: &C) -> Result<Self> {
+        if command_size(inner) > Self::MAX_CMD_SIZE {
+            let mut staging =
+                KVVec::<u8>::from_elem(0u8, inner.variable_payload_len(), GFP_KERNEL)?;
+            let mut sbuffer = SBufferIter::new_writer([staging.as_mut_slice(), &mut []]);
+            inner.init_variable_payload(&mut sbuffer)?;
+            if !sbuffer.is_empty() {
+                return Err(EIO);
+            }
+            drop(sbuffer);
+
+            Ok(Self {
+                state: Some((staging, Self::MAX_FIRST_PAYLOAD_SIZE)),
+                _phantom: PhantomData,
+            })
+        } else {
+            Ok(Self {
+                state: None,
+                _phantom: PhantomData,
+            })
+        }
+    }
+
+    /// Returns the main command.
+    pub(crate) fn command(&self, inner: C) -> SplitCommand<'_, C> {
+        if let Some((staging, _)) = &self.state {
+            SplitCommand::Split(inner, staging)
+        } else {
+            SplitCommand::Single(inner)
+        }
+    }
+
+    /// Returns the next continuation record, or `None` if there are no more.
+    pub(crate) fn next_continuation_record(&mut self) -> Option<ContinuationRecord<'_>> {
+        let (staging, offset) = self.state.as_mut()?;
+
+        let remaining = staging.len() - *offset;
+        if remaining > 0 {
+            let chunk_size = remaining.min(Self::MAX_CMD_SIZE);
+            let record = ContinuationRecord::new(&staging[*offset..(*offset + chunk_size)]);
+            *offset += chunk_size;
+            Some(record)
+        } else {
+            None
+        }
+    }
+}
+
+/// Wrapper enum that represents either a single command or a split command with its staging buffer.
+pub(crate) enum SplitCommand<'a, C: CommandToGsp> {
+    Single(C),
+    Split(C, &'a [u8]),
+}
+
+impl<'a, C: CommandToGsp> CommandToGsp for SplitCommand<'a, C> {
+    const FUNCTION: MsgFunction = C::FUNCTION;
+    type Command = C::Command;
+    type InitError = C::InitError;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        match self {
+            SplitCommand::Single(cmd) => cmd.init(),
+            SplitCommand::Split(cmd, _) => cmd.init(),
+        }
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        match self {
+            SplitCommand::Single(cmd) => cmd.variable_payload_len(),
+            SplitCommand::Split(_, _) => SplitState::<C>::MAX_FIRST_PAYLOAD_SIZE,
+        }
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        match self {
+            SplitCommand::Single(cmd) => cmd.init_variable_payload(dst),
+            SplitCommand::Split(_, staging) => {
+                dst.write_all(&staging[..self.variable_payload_len()])
+            }
+        }
+    }
+}
+
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index c604f423fff3..1a317dfb0bc9 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -203,6 +203,7 @@ pub(crate) enum MsgFunction {
     AllocObject = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
     AllocRoot = bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
     BindCtxDma = bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
+    ContinuationRecord = bindings::NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD,
     Free = bindings::NV_VGPU_MSG_FUNCTION_FREE,
     GetGspStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
     GetStaticInfo = bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
@@ -238,6 +239,7 @@ fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
             MsgFunction::AllocObject => write!(f, "ALLOC_OBJECT"),
             MsgFunction::AllocRoot => write!(f, "ALLOC_ROOT"),
             MsgFunction::BindCtxDma => write!(f, "BIND_CTX_DMA"),
+            MsgFunction::ContinuationRecord => write!(f, "CONTINUATION_RECORD"),
             MsgFunction::Free => write!(f, "FREE"),
             MsgFunction::GetGspStaticInfo => write!(f, "GET_GSP_STATIC_INFO"),
             MsgFunction::GetStaticInfo => write!(f, "GET_STATIC_INFO"),
@@ -277,6 +279,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT => Ok(MsgFunction::AllocObject),
             bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT => Ok(MsgFunction::AllocRoot),
             bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA => Ok(MsgFunction::BindCtxDma),
+            bindings::NV_VGPU_MSG_FUNCTION_CONTINUATION_RECORD => {
+                Ok(MsgFunction::ContinuationRecord)
+            }
             bindings::NV_VGPU_MSG_FUNCTION_FREE => Ok(MsgFunction::Free),
             bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO => Ok(MsgFunction::GetGspStaticInfo),
             bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO => Ok(MsgFunction::GetStaticInfo),

-- 
2.53.0

