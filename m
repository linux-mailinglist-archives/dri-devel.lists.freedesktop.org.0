Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJw3MTgQe2nqAwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:46:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5766CACE70
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 08:46:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252EB10E7FB;
	Thu, 29 Jan 2026 07:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S9kcGSdj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012004.outbound.protection.outlook.com [52.101.43.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B22E10E7FB;
 Thu, 29 Jan 2026 07:45:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQzt7zjRgN1mNOQw651ZA8GzHDnhQfB1i/fHMbYWoEjlpLfYDn30b4psS5zdOGpYuvDOnCnmvCXLQEvRygsze6k/n/+N3q7R/23d9EuZkg52DxGIqJaikCxWc64j0QfYm/4BdaPenqvrNaLWBo3zJveksAUexajBHHzWCXV6OuKWXzSyvK/16jjtqoAbgO0AVpgqxtzHsgEEcQfSBFzvikXXZ+sWj3sGriTXrXqhQwM8eyC8BcFdx+BmilYipvhPbzMUxzJPU/hMPbMsVHJfI11BwwJ9fE7mXTHk+FgalQny9gVFWFC7IW1kydCZXJu+JNsTgVSQTOEWf+tAyuQfCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNVsXzDaJQaEzdWpUdy3qjlQjCrcrbNoABpkNLo1jIw=;
 b=eOk8s3ALuP4k6f/Oc6+k7Jf/WOc0HGtnbyQaH256yuikpqhjdhl4FpeXrY2Ku8FdKRGvnDkVGKMlZ0OqlVPHADafF9nCKj8+s0ma9dAlGsRugRzNvNbTbkMhiX21lRBUExgBEbmrbihmeyWrzqiJB0R1xVQka8iryk850vUwJBBSx3n8upKwTcmBiLjmoVMoVqu/3dZ839VBxbaUAuwflUTsie7U0BTng/cntpVw0PbgMoVOQKcZ6yxrhlrJdBBuYh378i8DdWaklooIz0KPSgpoDR8uOOYzeFtbE3cxZd+NLCmAJ4BmjyWH+i12CrI5UxJLg2zy5ID7a/O9GiRwFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNVsXzDaJQaEzdWpUdy3qjlQjCrcrbNoABpkNLo1jIw=;
 b=S9kcGSdj8ygtW7tvJCBC8pk0QoHQLnY4BAfHAXziYflhU47a89/ykpgIFxWPqDnxyeCWyV8oUbR+S4FVK5b+EeQ4ELxfwzIWqo4rtl77SMrvi5H84dmHEkWltfoHIQCzMdlJV9oU5ETMuYrWSwEHlylKh1hHJhq7FT9kCVSxq2hDqUukG+gpE96J+W+GfxDssjMaVJla9HHxi1epsycYYF5OHGNBOjZsVa9nBdedqkFAZyUgUBOxU6H7z9vYcuTod4msbz+WrU4mJWH7MP+RPu60y1fLVquL4YhEVpKoW3+DhP7OUblhpM8io13+daTVPEy0DD7mUtb0Hjd/w/lBpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by CH3PR12MB9124.namprd12.prod.outlook.com (2603:10b6:610:1a7::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.16; Thu, 29 Jan
 2026 07:45:48 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 07:45:48 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH v3 0/5] gpu: nova-core: gsp: fix command queue ring buffer bugs
Date: Thu, 29 Jan 2026 16:44:58 +0900
Message-Id: <20260129-nova-core-cmdq1-v3-0-2ede85493a27@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XOTQ6CMBAF4KuQrh3DFMKPK+9hXNQyyCxopS0Nx
 nB3K7rQuHyTvO/NQ3hyTF4csodwFNmzNSkUu0zoQZkrAXcpC5nLKkeJYGxUoK0j0GM3IVRKqaJ
 qG1nqUqTWzVHPyyaezu/saJoTHN5HcVE+le04cjhknRvBzT6AoSWIV2FgH6y7bx9F3Bqfcfk3H
 hFyqPump7Jqih7xaCJ3rPaJ37Aov4HiH5AJoLqtSeOlxlL/AOu6PgFT3oyhIQEAAA==
X-Change-ID: 20260121-nova-core-cmdq1-6aaa369824c4
To: Danilo Krummrich <dakr@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alistair Popple <apopple@nvidia.com>
Cc: nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0197.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|CH3PR12MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8038b8-c481-4c1b-6a4b-08de5f0a6af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|10070799003|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODIyY0Rscld0R29TSlhhTG5CMk83NGJxYXp5Lzc2OUxzQzJFRHdJeFp0VmZt?=
 =?utf-8?B?Wm54NnBFdXpUNlhhNVZrYmdFZ1Z6b0kySTZ1NmJEYVpHS3psT3JDK1Q3QzlI?=
 =?utf-8?B?M2VvbjNHMGd4VmFCa29HOC9xSm5UWjZQK1UvN1NTZVU0Qk9jYXR6Sk9kNDh5?=
 =?utf-8?B?TUJHODBSZGlwdkZWTTlGOGhvKzV3bjJhRmJXR2tQVzgzVlV0VG5tWW8zVURq?=
 =?utf-8?B?Zk5HZXgxNnJhZzFiVW53TXBDb1ZqdThNVFFYWnM2V3U2S21zSFdmblVRdDBV?=
 =?utf-8?B?QkQ1elJnMGFNd3FUdy81QXRoaWtwTUtsTWQ1QzJkTnA0aTU2WlpMemVUSVMz?=
 =?utf-8?B?MGMwaTVSTmE0L2JUYWRvdjBLdk9LWlBjbit5NmRGeWQ2bmVPMVRGTXdhUUdk?=
 =?utf-8?B?ZzhyU3BTZ2J0MlhCemthaHRQVlUwMlpPVElRYjhpelh5OHg2bG9YSHZNdjAy?=
 =?utf-8?B?WFcrTlNGbWJlSkVuVmhHUFlOWUVFNHBxMks4WURWTlJ0eXhLTjhLb0pUbWp4?=
 =?utf-8?B?TytYSE9aaFhPM2lrZmRsclFSVFkwTU9BUEVmQ1ZQbjdWSXZZTDZmVnA2bU1p?=
 =?utf-8?B?OC93eDBjMHRpd0hHZDNjNUs2eXpMNktHR1lPbGVDL1hzQms0N1VtTHEzbENO?=
 =?utf-8?B?VDRlcXhWaHRrelhUeGQwZkF6V0NqcW1rUjAwWjhMTlZMelkwLy96a1RSYno1?=
 =?utf-8?B?N25XSU1IT1NrcURCL2FjczdJR1ZSUittaTd0SE8zTWUrUHV2QkJLRHFpdFQz?=
 =?utf-8?B?NDlGakpRTjRIOEF4SEplcDRXZWZlM0NxcUJpOFVKeFltdDRoM3hzMitPMjgv?=
 =?utf-8?B?U2EwdytGVkVjK3laL3Y2LzZybFRGK1hUeVhrK0ROZ3NkU1lrQ2xwUTZTdTFX?=
 =?utf-8?B?T0RJZE9rVjNuSExicGxOSUJJd1JxK3RsUk0vZ2lYRWpaYzZWUURLNGpVZUNx?=
 =?utf-8?B?WlVZZFpaZTRvUmJMMEZDcE9UMHNzZUkwNVhrcnk4SmppSnhYeHJHUytGa29C?=
 =?utf-8?B?b2h5dlhoWit5OStZMHgxcDYzZWZDRUJycHBWeWVKZWVKSjFPNUZvYmx3R3lx?=
 =?utf-8?B?ZjRlb0FrMTZETW1ueXFiV3FtN3gxWjdGc0Njb0lzZEQwd0RtcjFMeEZhL0NG?=
 =?utf-8?B?ZlhJQ2ZHdGhkOUt4Rm5PVXU5RHhFelJLVWE4bzNWeHFCQXhxMXlDWGc4eWlq?=
 =?utf-8?B?TFMrcEQydnl2a1dvYm9QU0M1R1Izbm1qSi9ETDBObzd3OGk5MzRvOWczT1dy?=
 =?utf-8?B?Tm04MG15bTBCNWtoSEp4cGM1STRhSnJudmtQektMdk55OTByTWo0c2xNNWNq?=
 =?utf-8?B?cExrZ1krbmdvQTlIL2ZhaWRLVnF1am14VnJ0aDlKZkVFa1kzOEw4U0xGRi9S?=
 =?utf-8?B?THg1MDNUVG9nN1ZzcThOMW5KNDJicXF0ZEpSQ2NEMXFLZ2RvK01mbkhBZHU3?=
 =?utf-8?B?WlhJdzk2NmVwS0I5c3JhOWxFL05GanVrcktKU01XbmwwMXVaVHljNlB4Z2RC?=
 =?utf-8?B?cWNVbklXWWdlT2hTWWJoWEUrMnhlUHJuVVpycjhwSVBOKzNlU1l3ZzRUM1pR?=
 =?utf-8?B?MUFZMnFYaklxWE9saHJ4SlE3STNWTTZCVWM5cHU3SC9xck1EQWxZTDBHRmVi?=
 =?utf-8?B?M2ZReThHeHR0cmE5WWYrVUpHV2txbHIxM1ZIQjIzcjZrRXdOSFR5NktwVDhk?=
 =?utf-8?B?eEhBQVIzZTRXZ2xsemFFVU90bjllNVVjQngvUy9iK05GZUpmWlc3Sk0rR1g1?=
 =?utf-8?B?THozblptbDVmR1Vub0l0Z1RkeWpvWGxLUERGeXVRbUwreS9BRXltQlZ0aHll?=
 =?utf-8?B?WVRTZThBV2NBeW9hRTNKbElicXdodXJOUGo3VGZCSzZhUGZDbHo0V2NwT1Rv?=
 =?utf-8?B?d0NEdFMyZ1gyQ1FCalJFSVlxRHJJMlBGZEVBTlV0allCRmpsYUFTaC8zRG1l?=
 =?utf-8?B?SnlhYnlJOXJsNjBZRTlSTmU3dVZvSm1sb0VmNXpFUEVUb3dxSE9BaUtjanBF?=
 =?utf-8?B?NDZrUDJHU1piZUhBazZkNWVsTDlhVUVtWStTNEdidUlwSzdJQks3cnh4cDlx?=
 =?utf-8?B?NU92UU5QK1lZcUZDN1JrVVFTTVhsb0t2N1FxamR3eTVRbVZWR3ZxdksxdlBR?=
 =?utf-8?Q?ET7Dc3+TGJFd/HlGWovYV19U9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am8zbXJabDF6b1NITDEyT2ttREZkOVE5OU5qaTZ0LzRmRFppb3pjNk83NHds?=
 =?utf-8?B?TmlKMkZxLzVpT09IVEVDQ1NqdE5nc0VKejM3Yi9DNEhLUWwxOFVMVTc3SS84?=
 =?utf-8?B?WklaQ1BsNzVZRkdueGdwNTRjdWJpN2thbzVGZGRZb2ZDdW0rZE91YzVCMDFC?=
 =?utf-8?B?NE1tZU9ZODJGMXZBdm9HODFJS3JhTWcxbkxNcTBPR2JJeUdrek4wRFZudU9v?=
 =?utf-8?B?cG41dXBRcVBpZDZFYzhVdWl6Yms4RCtDWk5iWDhrbXB2d2pwQW94eUVER1hv?=
 =?utf-8?B?NjhsZVlyQWFjRE91Mmx4WUp3aXJFMG91R24rMVhzaXdIb1B1aFFDS3NLOStC?=
 =?utf-8?B?UE1hVU9Jay9LUFB0d2hkSlhLR0VHbXh2VlFBbm1VaFJZc2xuaFduMnNmRy9R?=
 =?utf-8?B?Ly95RXJuTWdlVWRYdDlUQUFTdGdESEkvbGdTeUtVYkhpZHBiOElpL1c5NHZC?=
 =?utf-8?B?QTZzUS9abzhjSGtmeWtHUXZ6WWlsR1pMZDJTaFUveWZaVU5KUUZKcER3OVBr?=
 =?utf-8?B?cThVWmRyK1ZiUU5GY1F3Uk5LUjlhYlVITHNTWkkwU3ZFcjhpb2I2MS9oMEpF?=
 =?utf-8?B?UHAxY05vZGdHeE5hQ3orUUYzT0RKL1FJSUVwYmFwS2VMeERjZS9aTkxLM05v?=
 =?utf-8?B?S05pNTZUaE9tZHpwQmt5K0NCZmJUTEcydUxpKzdmN3Y0a1hwWDZOVFVDNG9N?=
 =?utf-8?B?QUNnTGZYUEVnc3IrZmpoVUF5RXVmZ0RQeUh5Z1ZRU2NQM25NNmpYditqLzdE?=
 =?utf-8?B?TnY3bEFuMUVxZGZ2NjVyMmhJZ2piL2tSY3ZZNGp2OG9IT1VlV1N1U09BK1dK?=
 =?utf-8?B?VVdjTFFEbGdyek4wU1VHNVJnNDU0dXBsdm5oVHhmM2NleFBoZmJPR0RUNFI1?=
 =?utf-8?B?anVocmVobWdZWFoxaFo1VGticTRCTGc5TjhSUHlSb2UxTXhYWlgybzdyYW1S?=
 =?utf-8?B?QmZDWGZzTWIwOGVpUGJtT216Sm5na1E1ME9KUEkxYUpYbjFQSXBsZk5jdUdm?=
 =?utf-8?B?NnU3YnlhbTRyd3FpempibUpPMVFRMXlyaGR1NE8veGtnYzcvandxdFR6U0E2?=
 =?utf-8?B?aXpoM2xWbG9WNzVRWXh2eVRsRXl0Wm94bTlXNkdMRUVvcitzRXppV0Zjc3cv?=
 =?utf-8?B?dU11dGM4c0l6clAxalZhaTl4amxUYTdjTEdKN2lkb1VxUThjbUhFNGVRMFM5?=
 =?utf-8?B?S0liemhFOFBzV2RNTXA4OG9PZ01JM3ZGa3pPaEkyMVE5Qmc3R0tlTFMyZFl3?=
 =?utf-8?B?eVFGT3ZoeUQwaVRTL240UDJmV1lCYThJWkdBQ3BKVHRrZmkrdXlwYWdBM1gx?=
 =?utf-8?B?b3k0aHlGQzdjN0s2NnVkUElKY2QzRDV2WVA0dCtFaW5ubExKbnhVMFFvSzJr?=
 =?utf-8?B?T3JhWlI2c1NiV3l0Si9VeklCaUptT1dLNGZIN2dvUDl2cmxBVlBiblVOazA3?=
 =?utf-8?B?S1h1YXlSN2RFVUpvRmVmV3hwZzFCOVpvL2x0ZnNyL0dTWTY2WXMzNldnRjAx?=
 =?utf-8?B?VnV0M20vY1M2bEhZT1NiQXM0a3hxMHphaEM5RjdFZ1VxeFI5NmtMditWMVJ3?=
 =?utf-8?B?T2FURDFvb2NqMzEwaUhkbWtIUG53VTVIWXFaN1BEQ0lGcWZSeFMwUVMvVGJw?=
 =?utf-8?B?QUJnZjdXbWFkMWxyaDRrTzNPYTJEMk9QV3N0alRBOU82cTc3RHBXeTlIcnQ5?=
 =?utf-8?B?Z3JBV2RGTGRzZm9mNytGSUIxTWpwcUZWQmdCWk5PdmFITEtMQk9EbW5JT1pX?=
 =?utf-8?B?VWlKdUV2SmhCdm5CbGI1UjRnQzg0am9oMjdaVEExQmt5QWlHWlVGbnFib0pU?=
 =?utf-8?B?Tk4wT2ZpbFpVMnltQ1ZaK1pCRWxhUmlJUUpnUm54VHNzYVdjYU94aUV4Ky9X?=
 =?utf-8?B?LzYvSnc2cHJCRThyTEJBOWNHZ1F3dnV5QmRSK2JZRCttdGdYeXRoZGxTMkUx?=
 =?utf-8?B?eUxHeTM3dTlJdWpEL0V6eW1xOE9FQ1JvVGtQRThpN3dkTS9BWUlFaU1SdVBQ?=
 =?utf-8?B?UWViemN2NVB4cXZSSXVLNnRlai9XY2twTHNYNmpESitxV3JseUYyMjYvNFN5?=
 =?utf-8?B?ZVJuU0tkZk5XazRHa3V4Qm03RDVlL2xPbFJITm5kT2RVSk9hOEFoNUhqV2da?=
 =?utf-8?B?Z1oyR2F5cDBIa3JPa3V4ckhMTlFUc0FvSTFZNHJzUWExdGpiNEtGTTNEeDhq?=
 =?utf-8?B?S1NrbGhEWmgwdlJsWWh6MzhyaUdDUEJhVzN3R2R6emtSU0VhNkdGZWREbXBU?=
 =?utf-8?B?RUx2MDV4NFVCWXU4N09rRWcxWGE4QUJhb1JwVnZVeDVnUnBQZEh2OWw2T0to?=
 =?utf-8?B?azRuK1NqK2JiSGFxS3ZEOXhWVzN1Z0t2ajZZSmVkaUtyOFVpay9MNVJDL1Fi?=
 =?utf-8?Q?51wEXqgxKbqp3p+79i8jZXN/moMuoRBm2J69m63pB12FF?=
X-MS-Exchange-AntiSpam-MessageData-1: AdpErVekdWXLgQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8038b8-c481-4c1b-6a4b-08de5f0a6af4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 07:45:48.5172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7HNiQloASGw1gncLydkg2zlCLgte6qSF+AM8PYTanqiewfqf5v0p+i0uFYl8V8+GoyzHA0XBmTAL1fFGmlf9ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9124
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
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,nvidia.com,google.com,gmail.com,ffwll.ch];
	URIBL_MULTI_FAIL(0.00)[gabe.freedesktop.org:server fail,nvidia.com:server fail,Nvidia.com:server fail];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 5766CACE70
X-Rspamd-Action: no action

This series fixes a few bugs in the GSP command queue ring buffer
implementation in nova-core and also clarifies some of the comments.

The ring buffer uses read and write pointers (rx/tx) to track which areas
are available for the CPU vs the GSP to read/write into.

In the ring buffers there were some indexing issues which could end up
causing panics, so I fixed those and added more rigorous proofs of
correctness in the panic comments.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Changes in v3:
- Use `&mut []` instead of `&mut xyz[0..0]` for empty slices.
- Simplify driver_read_area by removing unnecessary split_at.
- Use range notation for comments (e.g., `is within 0..MSGQ_NUM_PAGES`).
- Fix up branch order to mirror existing code.
- Link to v2: https://lore.kernel.org/r/20260123-nova-core-cmdq1-v2-0-e797ec1b714c@nvidia.com

Changes in v2:
- Modified PANIC comments to match existing style.
- Link to v1: https://lore.kernel.org/r/20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com

---
Eliot Courtney (5):
      gpu: nova-core: gsp: fix incorrect advancing of write pointer
      gpu: nova-core: gsp: clarify comments about invariants and pointer roles
      gpu: nova-core: gsp: use empty slices instead of [0..0] ranges
      gpu: nova-core: gsp: fix improper handling of empty slot in cmdq
      gpu: nova-core: gsp: fix improper indexing in driver_read_area

 drivers/gpu/nova-core/gsp/cmdq.rs | 71 +++++++++++++++++++++++----------------
 1 file changed, 42 insertions(+), 29 deletions(-)
---
base-commit: 58d26d42818c0f8c9b334cc7cf318b43046e675f
change-id: 20260121-nova-core-cmdq1-6aaa369824c4

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

