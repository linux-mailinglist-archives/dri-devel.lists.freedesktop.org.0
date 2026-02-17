Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHMFMhexlGlbGgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 19:19:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D0814EFCC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 19:19:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A22AA10E0FC;
	Tue, 17 Feb 2026 18:18:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EDjB51qk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013037.outbound.protection.outlook.com
 [40.93.201.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F70210E0FC;
 Tue, 17 Feb 2026 18:18:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bh6KM9C8idu2xYuklyi4YJpnuQ2JyrQcozUKwh+LlOiEMHpCoGoy6xlRvEghzHGaiQ+eBwfinFV+iD0fRVTiGbPN0YwLaNoxKXqH23U+7SiWW87F5L7Ed0uMuKEh3WS4be431ES7e1DGr+xigUKIBSOzkPvrmS36Fu249lp81vZRae3JPT7ofsdMIw4elyrnhU7MJkqQRfWTDsqwb4aeV44Ba1Lm+Qy9VYx4HJR8PEFxh/SNxA0qXsllLBfRYnqZ3XmF1uC1PF9rmu0WJhoRg6E2HBjTh2wx8sIXZvpGpJ79cN1dk6wKnnKzeo8wVH+56bEX8tXPhFnsqIvYBDwHVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gBEP8Xx8sV22WxoGJ36c4T2tiv/EhhSmT5q7hi7Iz+Y=;
 b=k2jmI1no3Vw+rub89SawocK4LKhz0Y+KT5vJRdPViaGRNKFv3cSwKBlKbDT+nkSbUe1yVrX4kpxJaW+2nP1nk/V3KCfH3smrbxpqFXC9Q2N5Gmd8lUdjlW0qxzmTXj6bNC6fNdPTbr6l12nEydTO07NAjP4IVhV0h5v3nSDslbVDkDlJnlE8mSvTRQkVBVD/NuIgI67y/dD6MYo0X6CkSdM2ine9bZq8tOLR++DnG3O1KqKCHm8Q3/SRZI2gq/FkXRQIgTeU7tHhWs+5LaFRbd6V8GJD0d9+Dw28DSs6+cJi2GXnf9zzYwXIyhJ2IYZnuFQsVTVamlVq9l1ZUzB5Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gBEP8Xx8sV22WxoGJ36c4T2tiv/EhhSmT5q7hi7Iz+Y=;
 b=EDjB51qkSniF4EwKnV9pwdKA/2VyKmPOQSt6vMzgpmCNgebG1S1qPib+9lJmZX7sSeNNaI/6Yxf4UPXA0k5VSnp6dhwZvewLMt3hn5HVwPFSTAtERNEnooOjuQQ01EmLWp0CnCd2Q4MVu9RKG//UGHbT31TqcdgW55Ai4PLmyQXUeyaKAFKO7GYXb0pLKe6ryg64m6plrZltddeNlAxDcuTsDsTCnEoaJ+HrTgBk52do6xQ1abPtoIps+WsMAw5YwtOrjGm2e+/BiWQxDii/DxShGa7gGVllLSieMiA/veifk0hcl8yrF0AG3uztzAijCMCbcln1MUikwrDVVkyG/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SA5PPF8BD1FB094.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d3)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Tue, 17 Feb
 2026 18:18:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 18:18:41 +0000
Message-ID: <b03da418-4e62-4256-9c2a-8a1a271fbeca@nvidia.com>
Date: Tue, 17 Feb 2026 10:18:31 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] gpu: nova-core: gsp: add continuation record support
To: Eliot Courtney <ecourtney@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SA5PPF8BD1FB094:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b5ea236-196f-4cda-f07e-08de6e50fa8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWRjS3VBODQ5U0o3VU5ZUEt6QWZZdXMzajFqNkFoeE1tZGlRL3ZJMEdMTEhx?=
 =?utf-8?B?Tmx0SHcvTCtPcmR6bXM2WXJJbmdxRTlXbXdBMDRQWDF4Y2hHMVJUOW1QaVh0?=
 =?utf-8?B?Q1haeThTSjc2VzdSS1EzR3FncjJIUFc2Y2tSNjRNSGpHdG4xcmpKUnhWK1pm?=
 =?utf-8?B?aHMramhraXZaaklGUDM2ckI3S2Nad0w0YUFiSTU3ZFhVNUFiN0xWWTlyZldr?=
 =?utf-8?B?Z2MvdXZ2aTNoTkQ5c2NWSXZFLzB0YnRCSjdZeHl1U1pzTkgza3hvV0F5SitW?=
 =?utf-8?B?T3JnZ01Rejc4NVBRNGw4MkRtWksyOHI4SkIxVGgxVURXME4zMmtEeWgxbkxY?=
 =?utf-8?B?clpmWFF5MTZxTDVySkUxS3ZmKzUwZGpLb1FzcTRqNG9iWFRldjBreVRTYXdx?=
 =?utf-8?B?bE1BUzRUMHdDRmVoelgyeVpwY1pVdUg3WDlIS2hZWTZFR2M4N0tPYWpDZlkr?=
 =?utf-8?B?WFgwM2FKMnJXdE1mUVhYYk53bG1DQWlvTEZpY21ILzdWblk5L0R6Z1hYOTV1?=
 =?utf-8?B?NzhvWkQrdUtWQ3kyWFl6RFFXRHFvQnFIbk9NcG9nVkZacGxjNEpYSVJEN2t5?=
 =?utf-8?B?aCtXeVRGQ0F1NEd6UGY2SjRvSkVkREh5c2VFcTJIdHJkTytCZ2c1ZVUwSGNq?=
 =?utf-8?B?SkhLMC9wOFdta3NlRFc5OERORDJXV29Gb1ZNMzl1TmUwa3pQR0pPdGN6dnRD?=
 =?utf-8?B?NUhRQWRCQnEwVCs0bmYvNmhzZEZjdFE2dU95VS9QQWFsaTMyREJlQzQ2TXZU?=
 =?utf-8?B?blZGWHNDbG5jNW10QUhOUDlMQU5NL3FXNWVWWGJFeVE0cWxKemV6Wm0yVGdL?=
 =?utf-8?B?YkFGMndGMVJvL1VnVFNXTzhxU3BZalRCMW1xN1JNb3l2RWdIOUliRStDbE94?=
 =?utf-8?B?akxZS0swcTVtRUpGTHFHZ2FuY1Z2U3JnYXRwR3crYi9mVHdLY21ZaEFHMVpx?=
 =?utf-8?B?MUNsUy9iUTFoZ3RvMk5QV1IyMm5PZFVEOHdQRVhHTmRJejV4djNONElsS2JN?=
 =?utf-8?B?TkwxT0V4ZEVtTjExbFJ4TGduK2tJL0lQTWtDcWhFQ2hVZURIWUZpWnY5MTNY?=
 =?utf-8?B?dk1Od3Njb1pzS2FFdkRXOTdSUWNPeDhjNVJWaTZteFhKN3FpUGhMNVExcTE3?=
 =?utf-8?B?SGJ1eUpoeiswRUFoOXFtUkhWSTZuRUlra1d3bHE3clFGUXhFbVk4OVFXTEFH?=
 =?utf-8?B?SGtmY2pFa3JLb3ZsR2NWY2ZTbG8yemF4Sk9SVWl2emZWbWtoaFg0dHF0T1Rp?=
 =?utf-8?B?VjMwUEpPRG9YWVNnUEt4UTZhS3ZoeVBlSk1xeEJ4QkFML2FwRkdQdVdBN2hK?=
 =?utf-8?B?Y29GcVlCVXhtcGdudGJxam1sQjljOUk3aFk0R1hHTENkUmtZV01qaTAxNkpn?=
 =?utf-8?B?bzhFN0drbmRIMFlWZ0k3TW1FejdST0lSUTFlc2pNbnN2K0todWZGVll6S0ty?=
 =?utf-8?B?Zytnd0k1SW1reExXaUlQUi9PQ1RRMng2UG90a2F1RzVxYzNlWmZ6RU10bHJQ?=
 =?utf-8?B?OU1ZMHB5MnhBTXVidnVGblh1TkFIZlRoR3VBYU1GOVNkZTA4Y1JWa09tZkhw?=
 =?utf-8?B?MEV3WHozQ1JsM1UzY2JoQU13YTJaMEhEUGhzUWY3WkFuZFBxNHpMSEpZWllq?=
 =?utf-8?B?SlJtSDVPTHZJVVBrajBFbGFpNCticDYyVkJ0ZTVlS2h2QjZKdnNlN2pndVhj?=
 =?utf-8?B?THpvUmM1R2h2clJyQlhkd2RXU0dYRE95a2lkL1ZHdzRDTWZNOStwMndkQUdT?=
 =?utf-8?B?OU5FM21VUGpZN2UzempPV29qUlRWYlZOcHZ2WWRDT09KY0g5MDQ5UHNTQWZT?=
 =?utf-8?B?NHdOalBFOStsZ0k1UmlISFhKd29HQXJTTDZTZ290YmRKS2szRTNXQ2NkMWpS?=
 =?utf-8?B?Nm5zWEhzTkJkakM2MmgxaTMzRmtIdjJlN2pveEdvYTh6MXhwRnVwRXVGL1JM?=
 =?utf-8?B?RUNQb0NyNERuMTFFTmJQMWhKZTVyVTQ4Sys4UmRUVVBoWG1zeGtadVVkcThu?=
 =?utf-8?B?Umt3UUE0QTZKTXNabFpJZzNLMjRvODZmQzhMU2lMeXVDTTlEaHV5K3BTSWY5?=
 =?utf-8?B?Wis4TUw4U0l3VUsvcU5rVVdXZ0sxWEE4NEFmc0lFaXA0dXB6SENlOS9QZkVu?=
 =?utf-8?Q?2cp0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWdSN2VXemJ5RFJHRTRhcDdBRCtybG5GQnl2RnFLbUw4RStuTVhZb1JBYm83?=
 =?utf-8?B?anlXSkRiK1ZPWTRIbThyelpGWlFkZ2JCN1hrZjBsQUVxbXY3WlMvTjJBcmk1?=
 =?utf-8?B?a1Evdk5laU1pTGJwd1o2dncrZi9ZSFZZUkZLejBjQm9XWXFYSUJuQjZwREZq?=
 =?utf-8?B?OWEwbnV4Ny9sZnpMZnhZRXZKbXFTU0g1M1BkV1ZUWWNHaVczZGs2cEZ4YmFs?=
 =?utf-8?B?NTkxQml5bFVlOTROU1JqS2VhSFB0RXZ6SENKOHJmMGMwcHNNUExabjVUODhy?=
 =?utf-8?B?VnIxdGZYd2xSQVlrSUM4TTZxU1dvZU93ZnZoYWRWWnQ4cjZNQU5IRGZGdWRP?=
 =?utf-8?B?SE9sRzlpNkxhTDRMekl0d1grMnMrWGFOTzJHa2lNajRmdFUyZXBWeG1GWnVJ?=
 =?utf-8?B?aDhvRUg4a0tYRGNzbG9GMmkwODQxM2Y0N2JaRnFYQkxERk81QU5RN1BacDVy?=
 =?utf-8?B?RVlrd2VYekxmSGcvcVNHYm1kbFZMUGpQN3ZoTXpJMVFnbkVXbENaRmJmS2JB?=
 =?utf-8?B?UjZFaGpaT3pDUWJNSW1WVWlBQ3B5V0JJZzBQRlgwY1R6M0RybVJBeXFKaUZu?=
 =?utf-8?B?WFFDU1VickR4YmMwaStRVjNMTzN4OTFqWHQwbnovanBqR3NnZm1jUmk4MHpL?=
 =?utf-8?B?dGMrc3pFdy9pNm8yNnNWamxyeUpmd2lGOFg0NjRYRDNyMUNYejdhMERQanpu?=
 =?utf-8?B?NHJwL1FXcjJwQjcrMXdsMW5aeVFoeHZONE5FbTFEbG9MZDBzN3BTWVhjWThz?=
 =?utf-8?B?NEpMQnltTE42d2FMcFdWR3VjSU5wdXFyYWpwQm5JL1N6c1pRM21mZzc3aGli?=
 =?utf-8?B?TEFLZkJ2T25VazRSa2tDMHVzMlFZQVlQMnV2Z1dzZC9lcWUyemc5OWlrVDky?=
 =?utf-8?B?dWVJc1RNcitTTnhKbzFLRVVqYmNGS1RkKzd1YUZsVVJaVGxOWEdJdUpEUTBn?=
 =?utf-8?B?eUF0RHB0VnJHTmRxeVZNSWNUVFdpZUFQM1BnTVB5cm1EeDBwcVBGTHJkZCt6?=
 =?utf-8?B?NnorMzhSa3o0RU9saHpJN0MvcEdSc3lnUHlKQldmbG41RjQ1MlpsQWpxbE04?=
 =?utf-8?B?engxMEt1YzZoWE0wVlUvTnlEclJEaUpnaCt6cWVHTzdlQmZZd1BpSnd4ZUNn?=
 =?utf-8?B?Y1BXY00wUThXSk96dThaRXkydXRFR3ZTYjN6YUNSd3hrd3NCTXVXRXFtUElw?=
 =?utf-8?B?RG1UQ1NzOWgzY2lEN3cxLzV4QWpKRmt5YWYxalFGc0tJd1dmYnIyL0hIcGhs?=
 =?utf-8?B?dDh2a0o4TmloOWc0Q3JKYlUwNW5RUDBvRzFwc1R1QmtzOHpmUy92Q1NHa1Rk?=
 =?utf-8?B?ZWtEMkJuQ0YxVytoRGordVRVYS9PaThwVnFLTUpxQU5aR0dGV2VFQ0tSbnRH?=
 =?utf-8?B?MXA0eUgrQnA5SDRnWUdHd2lJNncrMTZMczB4RWVtZktXSVJFRFJ6OHJLNzI3?=
 =?utf-8?B?dk1IR1VCWmdIM3Eyc2I1MEtzR3YxaEw4Qi9rVmp0UEFmQTk5QzdGOWdZNkRG?=
 =?utf-8?B?WUEwdXpqTXRMMXBDQUpMQVI1Q0tzcU1DM1YxbzEzTlRvaXZHVTFGMWZmYTJC?=
 =?utf-8?B?ek16dVdsYXRkMitDdE9nNmZpamtoSXp2OHNwSWJWMHFqeUtNd1JEZ0xMQlor?=
 =?utf-8?B?Q1RZUXlFcmhYd2lqZytLR2dNdGJjKys1T08yYUE4b3cwSUhnTFpZZk1HOEFM?=
 =?utf-8?B?SS9yL2hKeUNJakswZ1c5WW5meGFPSzU1WEp0d1NwOGI1ZXlKWS9iblcxdnVE?=
 =?utf-8?B?QUEwV3Bma29MVERZZzBCYk4vUU5TaXNwYU9LdjFTVThCOUh1dmlTbnhtSXd2?=
 =?utf-8?B?TW8vVytWYVhlb2xoT0N2MGRvaks3a1ZMR1VjYjlnVlNnWUJaME01VDNEajlx?=
 =?utf-8?B?Y3BUdE1Sa2FIR21DaE52QkJvYW5kTEdSNG5IUm5IdEdTV05NWFFNOU1mZU9i?=
 =?utf-8?B?MHJ3eHk4djMyTVI3MmlEZVZrWmV4cFBSakR0RllTbFBNTlU5R3lSTjBsZUwy?=
 =?utf-8?B?b0JQdUlObjR4OExGZ2s4ckRabVlsbCtqSnMzUnlUV0pCaDBOMGFtcWtZcXg3?=
 =?utf-8?B?SWc3R2o2RkoxUWJNaUcvdDZrWEpBOHNDWkZTcW9YMXlOV0VkNUdJQW1nWDN5?=
 =?utf-8?B?TWJSZzlsS0JtVXlqR3cyUG53c1JtYjFZdDlNSHlTY0tiUUQxY3gxR2JMV2Uw?=
 =?utf-8?B?OHFQdjJMQzhlakpJaExHcURkUzFMVHd3aXdZa2NsY1d5RENIMW5vSWRyY1Zj?=
 =?utf-8?B?Z2tkN3BubEtXQzlLS3ZQRGxqa1NjUmNzSkRkWDFVVVRacE01N21DeW9SZjJ4?=
 =?utf-8?B?ajFVbGhFRUttTkhaMkhtN015dTJYRXUrL0hHaGlYTDVIakhhT3h6dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b5ea236-196f-4cda-f07e-08de6e50fa8d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 18:18:41.6105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wrwf4QxY3ek2nH8OgZfn2d0BuihMxGNWK70HogjOuzL6JfLUew2MUat1sEjS66Er+DSh1Yev6HoMd6Tc4sqFfQ==
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 35D0814EFCC
X-Rspamd-Action: no action

On 2/11/26 10:28 PM, Eliot Courtney wrote:
> GSP commands over 16 pages need to be sent using "continuation records"
> which essentially means splitting the payload over multiple commands.

Let's please include rust-for-linux on Cc for Nova patches, for a while
longer at least.

thanks,
John Hubbard

> 
> This series adds a command type `ContinuationRecord` which just writes
> its header and whatever payload it is given. It also adds a type
> `WrappingCommand` which supports splitting a large RPC into smaller
> ones.
> 
> The send pathway uses `WrappingCommand` to send all commands, but if
> the command fits into 16 pages, it still writes directly into the
> command queue. If it is larger than 16 pages and needs continuation
> records, it writes into a staging buffer, so there is one copy.
> 
> This patch series uses EIO for mis-sized commands to be consistent with
> the rest of the code.
> 
> Patch 6 introduces a single helper send_continuation_record. This is
> because the compiler can't properly infer the types without this.
> 
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
> Eliot Courtney (7):
>        gpu: nova-core: gsp: sort MsgFunction variants alphabetically
>        gpu: nova-core: gsp: add mechanism to wait for space on command queue
>        gpu: nova-core: gsp: add checking oversized commands
>        gpu: nova-core: gsp: clarify invariant on command queue
>        gpu: nova-core: gsp: unconditionally call variable payload handling
>        gpu: nova-core: gsp: support large RPCs via continuation record
>        gpu: nova-core: gsp: add tests for WrappingCommand
> 
>   drivers/gpu/nova-core/gsp/cmdq.rs     | 113 ++++++++++++++--
>   drivers/gpu/nova-core/gsp/commands.rs | 247 ++++++++++++++++++++++++++++++++++
>   drivers/gpu/nova-core/gsp/fw.rs       | 102 +++++++-------
>   3 files changed, 401 insertions(+), 61 deletions(-)
> ---
> base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
> change-id: 20260203-cmdq-continuation-b99f3d5966c3
> 
> Best regards,

