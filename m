Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KcBHtKwemk79QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:58:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8EE2AA6BC
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 01:58:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C18CD10E2F8;
	Thu, 29 Jan 2026 00:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OXFSLA/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010069.outbound.protection.outlook.com [52.101.56.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B1F10E2F8;
 Thu, 29 Jan 2026 00:58:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQMwu2F7zr7YO0CI1DqeZ08iD1PKRRIICtpQlNC0oTPW5ZYS6Y2mnsyl5XiSOfVuWCEpST5C3T/hiaXl4XyPDfnylLOHVfLtzK5RxxE+ca8ANLrqubnaFQhT8OkLjsICPwGYPU/F2hdfMrU0zXeDwdMBYxAQhNrUxlEHRhXfX1ffq7ebni65vEyrvr40lTFYcyMyj8aMQKBCrVN3TByNUTUA1xkmsiGuuc1neE1YEl04qJBgCrb/Qc+zaQm2QrP5zIBp7UWxBP9DerSKjX0+p5grYsJ6ApoV92i7BfoGr78HdXoeo5YauvpB234bgc/BYlE754Urh7ZoOfN+De5FZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lqruOZZCWm84lOyOBwcn6//Q9zISyC5L0TG4cv/2vGQ=;
 b=WWFdI4y8pRN2hGoOt6LGSDjnutSoYTFNtesD2dqVCgPK/qMV6+vheJHizvN8WaTVHOWyssvxacmlBrOpa7hrtRNL6uBjVJElFyopSmVq77EmmOEmb3owrNxkkLobXalg43+jO7bc7KPIWbGtDLNXYdQpBubBG6xjMYEK06D+K8KMlHGsImS5bDUISTDMeTzFu5dNy54P5olgd7Q8Aa8nhZgez2/hSi6gME7/JX/V4ksRM+K6rpXW1Xc0JwYCdBMhgkxcUFzUInpwmBCc3ulq7dp2ZPNWJM+7vaXxVJmkdUp6Tbdv981J59XpWiUHFXJr5fOMRsom9Yo5Kjg+iGZnbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lqruOZZCWm84lOyOBwcn6//Q9zISyC5L0TG4cv/2vGQ=;
 b=OXFSLA/BlGQIco7ph5hUkDL+EjVoVTY0CTMZ99dvqUezEN6mA+12VODUkGPTDY7hS0SXsbjd8LlGQHBlev4rt5v3xitNCWuTh5qpkTb68e+RFM78+PmQqWbX7ZoC4NgU7hh3v52UECJcSTlYSjlSvQ7d7JNoli+xhJAUxFBiDDWZze8Bo1B8vahr7HHySzpVgpEDv7NU/DnTktP6RDv50VB8afFrSFKMQjux3FzRBZkoklV5jgjbPohkb0AXaR3821yGeBM5ZZqKMGW3h20i1Y//MzZnT3lRdgG4YG+vIlzvN/LA52bfO0PKvwXTwqARUgWXiQCDoHleLCxrnbXhAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by SA3PR12MB9108.namprd12.prod.outlook.com (2603:10b6:806:37d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Thu, 29 Jan
 2026 00:58:48 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%5]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 00:58:48 +0000
Message-ID: <8859d68f-ca38-469e-8345-84059573ac97@nvidia.com>
Date: Wed, 28 Jan 2026 16:58:44 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
To: Danilo Krummrich <dakr@kernel.org>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Alistair Popple
 <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Helgaas <bhelgaas@google.com>, Alex Gaynor <alex.gaynor@gmail.com>,
 Dirk Behme <dirk.behme@gmail.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
 <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0004.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::9) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|SA3PR12MB9108:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d9004a2-7503-4de6-e1b2-08de5ed18f41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d2FUVHExRjUyM1hrV0JXTUp4TnVOYkdUM3NIZXF0bnVsS0pNM0c3UlA1SlE1?=
 =?utf-8?B?dXZwU3o2RVM1elZOdkdoOUNTQzV3a2swZGFGOTd2a0NSeXVzRTZtWDdzWnJF?=
 =?utf-8?B?c2VRN0Yva2djakZVVFk5QmpIUS9kaTJOT2pWb0J3eXRIVW9BUW1NSHF1QTZp?=
 =?utf-8?B?dklpR3puVzFIZlZMR3F2TGVZb0Q2eEYzOHBjdU8wWnJXd25OemFrdnhoWHNP?=
 =?utf-8?B?L3ZzNGFHUlRpME1JdnhpUHhqd0ZsYnlmNTd1bTFwb1V1NExTSllmSlBlcnUy?=
 =?utf-8?B?WFNBUkRvbW80ZnF2U1Z5OFlGZ0lLNnpNeU9oOHNzbWcyWDhmanZtZkNqbnB6?=
 =?utf-8?B?SzRzbWoxQjFPK1RLYyt0R2MvWGJOamdkNmlqNVBDQldNcXErVTVzNkE3eFkv?=
 =?utf-8?B?MGRvV1NGQVIzWjlGU2E1YkxDUldNSFBCSURERWFHNDdQMC92RkNCaE9nSUVB?=
 =?utf-8?B?RE1TRG5Bc1V0ZGlVMEwzV0FEMitBTDBoWlE5cWRJbEw2OS9yM29QMUduTEZG?=
 =?utf-8?B?VGZUNUNMbVRkK0ZnazVnNFZCVlp4dUFoRXRaMU0xOWNESWMraUtvb0tUYi9T?=
 =?utf-8?B?U1RpeDgyQUtqcEZ3ck9RaHhqblcxa2trYW1WSEttUzdrV1l5ZUFtbVJpMEVz?=
 =?utf-8?B?RHgxdTY4UXdENUJ0elREeDVaMUdIejBpREpRYzlQUHJvR1hmRTEyaDdHRFZX?=
 =?utf-8?B?WngrMy9QQlNyd3pwSS9PY2ZkUTRSUy9Lam5XeXErWWxiaFQxUnl1Sk9Cbndw?=
 =?utf-8?B?RGl3V1U3V0E2eW9jSzlBOFZtcVhBbThycks4Vkx2UWs0cjBaaFZKbkE2bGxv?=
 =?utf-8?B?eDY5U3Q0N1NabGcyd1c0YnVpWk5idEZreHF0ZUltM2FKc3J2YTBDam1rdlJV?=
 =?utf-8?B?NUg3N1FlRmJESnVpcjZRRjI4TlJWdTFuS291USt5M3VVZlJ0VE9VQnBIYm5q?=
 =?utf-8?B?dkNjR2g2MFduQXJETGY5RXR4Kzdhaks4UTE0V3dFZm1SL3RRalJsWmhpZkkw?=
 =?utf-8?B?V0hoQ0luREdYSEJVeVdEVGdVS2tWMEF5M0lXak5sZi95OWorMGNWaU5CL25R?=
 =?utf-8?B?dDltUHBKSjEvWFZEOVQwVVZjVEtTcW1VdWhuQlRqaTZ6MEhTbkZzdHZTelE3?=
 =?utf-8?B?eWdWdktnNUtkQzhUdk51WGhWT3VGMGVMdkNOZG1PUmRXeldISTk4TEFXNnNI?=
 =?utf-8?B?QW5oMnZKTzR6VHQwTlNNc1ZsWkd4M3ZQNVpKakhyY3JkVTU3bWNNRDJjR0NI?=
 =?utf-8?B?djRGeUI3aHRDT1VCQi8zQ1h1WTJ1RCtEcmx4dHVjVlJlS2xmOWVjN1NiVXFw?=
 =?utf-8?B?ZlBiZks4ek9PQk5Xa0pqRGduRW4yWFRoaDV5cTN5dmZzdVpxTC9mMGl3ZDMz?=
 =?utf-8?B?akRra2Z2d1ZKNDZ5b2dCQXBiVUJzalE2ZTdlWmd1M3JaalozNmhDQlRUOC9G?=
 =?utf-8?B?c3ptTVZXVkVUWHZ4REtGcGM4MXhobnJ2aHBxUWNXeVBnMWt3UkxpdTdpc3hR?=
 =?utf-8?B?c0lvcU1GckJpanM2bkNvZWh5eU1xbmRkeU9yVXAxTjJHckNtWWlHNDkwMlNx?=
 =?utf-8?B?enFyUjRvdFY3bWhuRGh6SXVra2lQYVdrVW13TE5yaVBhZ0ZJeDNLUGlycysz?=
 =?utf-8?B?ZWxYb2l3K3RydWdzcWhZandWZTRkby9BR2lteDE4S1U5UXk3N0hZcmF4MTZw?=
 =?utf-8?B?WTNFTktTMHhjRHBPNDB4ODFuQTJqdHV4UlRWdTY3MzlCYUtaVXk1YlBxYTRK?=
 =?utf-8?B?UDI2dXcvRXVmQW1KeC9Ld0VPQm93Z2tBaDNVYURRbEJGQ3hoUGptMkZuOVZR?=
 =?utf-8?B?ZENXdWxjSTBpZDRxQ2ZBdndkUHpTUjEyZ1lMbU1DNllPVENoRGlLTjZkUzRD?=
 =?utf-8?B?KzF0a1h2MzcvajdMaldyRnEwWThHeWZBVlpmeTFFNVZGNzEvQy9OOStjd1BK?=
 =?utf-8?B?RlRCNXVwZHJ2ODZuNG5CWVJMQXlSOU1kaGQ1S0RnYUhiZU5ZUDhZRndWNThi?=
 =?utf-8?B?Z2J3cUViZTgwR0lzS1ZqbDEreWYxTnIzOFNEcGIwekxBS1hQbjhvenpjWXVn?=
 =?utf-8?B?UUE5ZVp5UGFqOE12T1l6MG5wNXYzanNENlZLTlBXZ0pxMzNKdHVSVERibGMx?=
 =?utf-8?Q?d/Ug=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR12MB9412.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGxheWsrK2hiWkk0TmtnUWF3RXNrVFg0OXdTQkxocEhPZ3ZuNWRuZmFYWjJG?=
 =?utf-8?B?UW9uSTZpK3c4M1Q2SXhBV3Vyc0tuSjhsR0JnSVBjWkM3aHgvMjA2STZEaU5B?=
 =?utf-8?B?Ris4amhKVzlVek5KOHlGNy9hWlRKZ3JpUUhkU1psMHpZc3EzVFFsYVNIVzd5?=
 =?utf-8?B?ZHIzZHVtV2RBM1RaMzFsL3hva1lGTVpRSVdhcEdEeFd1SkNicHNJVUJxRmh6?=
 =?utf-8?B?d1Exb3N4WHBSZ2p3VjZHOGVnL2p6V0w2aGNlZFpKNjkrdldYY3ZaUmRjMGFN?=
 =?utf-8?B?UTRRVnVZRTlmYXlkSnJ0bzduM0JramhQODF0S0svVTNWd2hmeHE0MnpRYWZm?=
 =?utf-8?B?ZUNNN3k4MjYybUpTQU1wYW1lWTZON1A1K3dTR0ZVbTJjRHh1OTB3R0tzcXJs?=
 =?utf-8?B?dCtCTkpvWnhTbkQ0RXNYUEw1d1MzREhVWU44cmRSdDVwZkNZaWhWSXNHc1pB?=
 =?utf-8?B?RExpMnB4LzJScFBiS0c4ajBmVG1Wd2hKajNHdWRhSUxqNW9XUHduYU1YOEx0?=
 =?utf-8?B?VFBTUFc2amdUckNweWRPSllNYmtTRlN1NGdKakpEZlhUSm5NVkt4L3JkMEhj?=
 =?utf-8?B?NjZNcDFsek1yZDh3YTM4c01GdGRkRUc3dnd4MVY5UlU3WTV5TzZvdDZPUjRs?=
 =?utf-8?B?YTIyZWdKdHJvbkVEdndYN2J2b3FoN2w1OENXY0JMWHNsakg2SmtteU15a3di?=
 =?utf-8?B?T3VrZGlrZWJzT0ZPVFQraGx3S1lTOU9sbkFrM2lYcVpyeDhDdTVONjhJVCt4?=
 =?utf-8?B?UWtMd1l4N0g2YUF6Ty9oSksxcmFBRFhrQ3hTM0c1eTMzUm1RSFZaVG9CZUFI?=
 =?utf-8?B?RW03N2lXNFMwcTNiSllKdjhpd05Tc3ZPcnFTZlRVQk9XME5VUnhJOFE4NEd0?=
 =?utf-8?B?VWxJREZTb2VsYlN5L2x1dlpQY3VkUmtZUDMybFRLeWRWZnJCTk14VmtDWktG?=
 =?utf-8?B?Z05iN0JmR0lFZWk1TTA2UXhleENwWDdlQThHM082STF5SmNyYmFsQUQrNW9u?=
 =?utf-8?B?Ymg3cG5ZY0NZNkg0aTNCbnFZS09hK09oNWdZSForSjlkMXovTTl4bm1HTlZi?=
 =?utf-8?B?WEJNRHBaRkFxbTMrTU03NGkrUWFQVlkwaXA5MHN5MU5pdWw1OVdlKysvb3lO?=
 =?utf-8?B?dTZPY2UycUlLVHJaRjIvek9PeHN1ekhVcjRmNnYrY1hCRmtEMEZtODdVb2Zs?=
 =?utf-8?B?RmdCU1FFVkc5ZXByTGdOYitzRTllSWN1UGdFNndITktPL3FZMDNpeEY1WTZS?=
 =?utf-8?B?V0JKZTJ0cm5jWDRucU5ocG1zZFJMSkpuTFEweFJQcWlGRk8yQWlwZVZQM0FS?=
 =?utf-8?B?aXBQQ0o4aHA4cVgxS0ZmSkFQbG5WRlJTV09QeVF6ek40SnJSZkF0U25HSzlF?=
 =?utf-8?B?d2RaOTNtbm9wLzAwVnpNVHRUVlpZVERuL01LeWcwV0w2aGRESW1ubzJSTE4z?=
 =?utf-8?B?ZzNDUEJseXdNZng3WllPVGdzd1NJNHhYNlhhUkJGeHlYVFF3c2NWM0ZPcGF1?=
 =?utf-8?B?bTBHRnhmOUY4Q1YrWC9DSTFYU0xta2FTekZocGNSQjhNbGNaalQvZmRRNHNS?=
 =?utf-8?B?NGcyU3FUS2xqaHBiRVhiR1VVNHhSYjhvdU15K1JkSzVkbUdwSytmREN4OHg4?=
 =?utf-8?B?NERjalZESGxpVnd2ZE1pZWUrUVRsZXFDT2t2aUZld0lxL3EzeWI1MjhMdytx?=
 =?utf-8?B?Z3RJTUNOK3R4aUVHZ2NSZG55YW90MGZ5RWI4c205djQyMFlpSVFhS21CUG14?=
 =?utf-8?B?YjNaZVFrSlR3N1VjbW5nWFB0RVFuYWZpOVNzcWgreDJjMEhmRExFam0rSHZ4?=
 =?utf-8?B?Z2VaNUYrZFFVaHdSbG5TTzRXV3QrNFZrcVhRd0l2MmNwY3l0ZzhwTWtQWFNP?=
 =?utf-8?B?cnJIQnFkcFJ6QkJYV3JjVVVXUGFnTmxiWUFzV2RWOStMRG1aVWJPYW5iSGRq?=
 =?utf-8?B?MGlpcElKaU51cG0yMTZYZUJISm5zTlRhZTZGdTE3S2g3TjhCOXRSYmZQOXln?=
 =?utf-8?B?U3c0aGJZbSsyMUJUYWsrSENudDAyVzVFT1dYbFprOEQ3ZnlSdUttN1ppczhY?=
 =?utf-8?B?RmQ4TFFHanJaRklTblhTVkQ3TE9BTGJrd2xyVzhMOHRaRzhXYUZsUy9SNzI2?=
 =?utf-8?B?R05EZXVldTdJWWU1bjVKVWVnaDFQWjZWSVBjcXc0UlkzUWI5VjRLdWNIK0U5?=
 =?utf-8?B?Yi9RNUpMMDd1bWhWamVMYjg4SFpwcWtXbXdac3ZRbG5SemxrenR1emtKR2l1?=
 =?utf-8?B?TUpHOEJOSjJ6aVlVSGxxRXhFQTBvbW5tUWptRWhoNXdoS0RGN2c2MExTcTVV?=
 =?utf-8?B?cE9DVVZXZ2hXdEZCdGgyTFFRSVI4YmVWWk11ZFNCRDBrWWlrVHNudz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d9004a2-7503-4de6-e1b2-08de5ed18f41
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 00:58:47.9764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9Rf3UhbZLK/v8aEBA6LIleNqXvogCyoHh7QJHcdbONN1ZNcz1SBgD35rfdQ8AxIEd5c+zwVOit+o/8Mtd1K3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9108
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[jhubbard@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,dabbelt.com,eecs.berkeley.edu,ghiti.fr,gmail.com,garyguo.net,protonmail.com,google.com,umich.edu,nvidia.com,ffwll.ch,lists.freedesktop.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B8EE2AA6BC
X-Rspamd-Action: no action

On 1/28/26 4:20 PM, Danilo Krummrich wrote:
> On Wed Jan 28, 2026 at 4:14 PM CET, Joel Fernandes wrote:
>> On 1/28/2026 5:53 AM, Danilo Krummrich wrote:
>>> On Mon Jan 26, 2026 at 9:23 PM CET, Joel Fernandes wrote:
>>>> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
>>>>            let ucode = bios.fwsec_image().ucode(&desc)?;
>>>>            let mut dma_object = DmaObject::from_data(dev, ucode)?;
>>>>    
>>>> -        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
>>>> +        // Compute hdr_offset = imem_load_size + interface_offset.
>>>
>>> I do get the idea behind those comments, but are we sure that's really a good
>>> idea? How do we ensure to keep them up to date in case we have to change the
>>> code?
>>>
>>> If we really want this, I'd at least chose a common syntax, e.g.
>>>
>>> 	// CALC: `imem_load_size + interface_offset`
>>>
>>> without the variable name the resulting value is assigned to.
>>>
>>> But I'd rather prefer to just drop those comments.
>> The idea of adding these comments was to improve readability. However, I
>> can drop them in the v3, that's fine with me.
> 
> Yeah, that's why I wrote "I get the idea". :) But as I write above, I'm
> concerned about the comments getting outdated or inconsistent over time.
> 
> Besides that, it more seems like something your favorite editor should help with
> instead.
> 
>> Do you want me to wait for additional comments on this series, or should
>> I make the update and repost it?  Thanks,
> 
> As mentioned, I tend to think we should just drop them, but I'm happy to hear
> some more opinions on this if any.

Yes, please drop the comments. They were just echoing the code for
the most part, so the code itself will be easier to read without
them.

I think this is something that, when you are writing the code and
comments, it's really hard to see. But when you come back a while
later (or you are reviewing someone else's patch), then it is much
easier to spot.

thanks,
-- 
John Hubbard
