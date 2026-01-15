Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8E5D2276C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jan 2026 06:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B7A10E232;
	Thu, 15 Jan 2026 05:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KvEW/f2Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013056.outbound.protection.outlook.com
 [40.93.201.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E49E10E232
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jan 2026 05:54:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzbbyl2hyIKZzmVRk9Yal+OJWsSjJ7pmtpivBlSNMGpOqFFmeLlOSCS8aaOxerRre7PLBXoGQtFzQJ/mTXfZ842/2R21+5LmKlz6S9vPQBG8kdtY33d3nq0txw1Tj4TvigVuAKwAfCos+YXqJxgIzIJnqejGOFNBCrFLtCptXtZZxTfzvspigmWC3Ox8Nl+bq+VutIAseGgdoAHuk+7tUFW3Dhs1hJUhPvBe42peNIaJvV5noSKyWGVyBc8UaKVeustTdrinR/WBYQpWtpZWRt/szwGlg92GImsVQCUO3vGXUsbiDgruA1xAKa5sDPOP9YvOXLV5xn16A/ITuFoJ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/oMb6uc5M6ful+S1fylOD2pLO1Odhz/9xyOG8b/68w=;
 b=BeTt9wguhaBVr6cNEKgDcQl/bUA9tVDxH7NyvCiYxYLpbPRIDnUPVxV77vRKonHWZYexmErO/6HDVDioEx3XmETNTd9Ga12DuVSxfvN7A8iYYyEuooyiR3wf4L2qLL1+Rb4ZuxrXNv6sjEtxrr6MEMdLu9P5zfm50MSYx4S74qxdTfbB2n3Q7VHfr7pEiGNuOfVB3SrK+AHNlY7fn7JNRydVMn9U7LX82fPXwxEnf/uMM52vWrFTMxntWMhhD5Xbepb3t/mlOgJuHUNF6R5FGSqeutD4Yn4nxzmCLrPCkXHEDo79yQJKnXCzcxOhbccDjXvZSEib8zY/KonX9HObkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/oMb6uc5M6ful+S1fylOD2pLO1Odhz/9xyOG8b/68w=;
 b=KvEW/f2QyehJgT+clnF+Kwd+4s/0DdjpEXrPKCJ7wvHTHqCJAFFsnJU9V6QQZ4GqiS/xFdTdynZo2i9Vt+oTqix3SpcDrrNL6uEiQ6uVMXeO0J/9lNHDHiQYKkq675MlZ1QrsZp4zUpWgFBsHyWOrNVR8GI/kZYPUvwZzNgftKjiixfxybakCht0h2A18Cy03i8ei1KS1iYQz2zCTk8VnXJhqPorOOyGvR6qoZ/t57XqGM+M3qrKIm1L9T2+iMnb6TkvRiDzSGAE420gzuEEBe0K8JAizszGUj4Fj7aD0g9wF0xkfl3kdzqmY6WSMdqucYjSY0QFb5XoOZ30S44/cA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com (2603:10b6:a03:566::20)
 by CY8PR12MB7562.namprd12.prod.outlook.com (2603:10b6:930:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.6; Thu, 15 Jan
 2026 05:54:48 +0000
Received: from SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93]) by SJ2PR12MB9161.namprd12.prod.outlook.com
 ([fe80::1f16:244a:2a9d:2c93%3]) with mapi id 15.20.9499.002; Thu, 15 Jan 2026
 05:54:47 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 2/4 RESEND] gpu/drm: tegra: dsi: move prepare function
 to the top of encoder enable
Date: Thu, 15 Jan 2026 14:47:36 +0900
Message-ID: <7012249.lOV4Wx5bFT@senjougahara>
In-Reply-To: <20251204061703.5579-3-clamor95@gmail.com>
References: <20251204061703.5579-1-clamor95@gmail.com>
 <20251204061703.5579-3-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0364.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::8) To SJ2PR12MB9161.namprd12.prod.outlook.com
 (2603:10b6:a03:566::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB9161:EE_|CY8PR12MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ec0df3b-ebfd-4bff-9960-08de53fa972d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3pZaHRxZVlHSlFLMlU2UFJaRTRvT3NYaHNoMDNISFFESEQ2eUFacWorSyt6?=
 =?utf-8?B?Z2E1ZTdBTHBCdXF4UUVrcytxb1o1eHdmWEtYS3FkNlNXRmYza2xiUHdUalU3?=
 =?utf-8?B?ZThaUzRjaktEUmtaSHorTDdsdDJoeFhZM0RuUFBKUFBKY0ppSnRDbm1MVUxr?=
 =?utf-8?B?TDFuME95MWJIOVEwS0QzQnpScG44VzIydEEvelRITk5DKzFvdGorNFRqQXgv?=
 =?utf-8?B?UVhEbXdhTCtQN2ZJUHhuMzNmdTJxQ1FaWHA1bE5hNlVKK2pheFBrT05SUmxV?=
 =?utf-8?B?aGZLdVVwTEU0eW5UZXU3b052TVRYRTlTR3lYMjREQ05yemsvNHh1cy9qQ25i?=
 =?utf-8?B?ck5lNllNNldCdlhqMnlXZWJTc0dqaVBRWFloaEd5c0ZJUysxQ3RvRlpHaERZ?=
 =?utf-8?B?eWhuQUlxNmgwVC9TSzBwT0dtSkI2ZzlqWms2ejRBTjFGTTlyY2l6QVFmTHMz?=
 =?utf-8?B?cmJyRWdMQmdVZS9pVk1qM0x1SU1YNWh5ZlE3eGdybTlkQVdha25QR0tqaVBy?=
 =?utf-8?B?a0o2V2p6TXRCdy9aWEdzb1NtQm9KWjNHb3JoSTcwTkpHeklISnIrcWE3dGUw?=
 =?utf-8?B?YUtuOHJyWnNEaFpYd01zRUVqTng4MkJhZjdHTDZ4TDRqcGtHTG1nTXdsQzJU?=
 =?utf-8?B?VUNkZTI3M3N4NFk4UExtMVkrK09RYlBHWDVNMk1KTnlFUTJtWWt1RXJySFNC?=
 =?utf-8?B?blRDUnhpUm9rV0FSWjNrcW1QNEkzVmNIQkRFdVlSTWZnN3dYcGZWNG1PK1Ex?=
 =?utf-8?B?d0RycW5jckRoZ3RDTzFpYjAwYVBGWHNGd2dpVHhYN3dDcEZPMHhXR1BjL3Y5?=
 =?utf-8?B?RDAzaFM1eU1GSWppR2IxZUJoN0pZZ085czl3ZUt5SEpxekdDcTdtdnJoOHpv?=
 =?utf-8?B?TGdYUURHTUUvMHBrKzc3UUFLdStWaHRIYzJpUnY2T01iWWk2MjkwRHowdzB6?=
 =?utf-8?B?MjZaQmxXMkY5OFJITFhKMGExWDhLL0N2RFd6eFNnYWJuRTJtb3dBVEZQVThY?=
 =?utf-8?B?TGFRMWNRZ3pNdFNSYUtKRHZ2Z0dJemJJWEZlQytybXJLdkIvZ1NRUkFLZi9n?=
 =?utf-8?B?bHRMeGllaDRESEc1Zm1KMERjdFJSSWdXblRGY2pSQ0RqOEw5N3dOTHFuZlVO?=
 =?utf-8?B?bCtkeXFuSGJhU3hNSXhWZm1ycUV4MUFPVEY3MHdHTHBDSVB0bGdySGMvcVI3?=
 =?utf-8?B?eWRtU1h1eEV1Zk9wNUxSd1JFb2VNeW1jc3FxcVd5WjJmT3ZtRTE3aWlKVWdw?=
 =?utf-8?B?TGJOK2RPcG1ZMGorNFk3TllmdDRGaUxXM2VDdkVRb2VXUE56YUNsOUxEZVpI?=
 =?utf-8?B?MkVveWV4U0R6Z0RRbi9GK05ueDk5SjlvZDNvUHZYZlBXQTlSWVNkMVdVQnBy?=
 =?utf-8?B?V2lISUZ4bnZRd2p2ZjNnazVhenZuRWNXQkd3emUvS1VrTSt3MkxIeWlXOW5p?=
 =?utf-8?B?c2VaaEI1aGQ1UlEycXJEOG11Y2lIR1JmSnk2OGprdXlCbS9ZYnd6SDd2K0VQ?=
 =?utf-8?B?ZW4xTm50eWlyODFxSGlCblhMaW96VnFDNUJEZ0wyVWY3b3hhcURxaVlPNjZF?=
 =?utf-8?B?S1I1ODA4YmkzQzNrZ0hGeHlsM0p3NDhZNU83aUpGMklQRVkxME9pYUIzMjNj?=
 =?utf-8?B?NFNoNFowcUd6ZjAvZEs2MTdvVmJmUzJrVGptQVdEcUhGQ3VXbHpVVDFmWldq?=
 =?utf-8?B?YTlqT3MrVHQ4M0VkY2xKYTh6ZTlhb2I4YThSUDRpVzhDZE5YRGNvbEV0SmRK?=
 =?utf-8?B?T0hhNkhHbUx5MEJWb3F3SHh2VkQ2UWlpYWF3REVJS09iVlltR2VwMStDL2lK?=
 =?utf-8?B?YjdDWjZ6bXR4cEE2S1pZV0pIaTRKS3lUeUY1QUhER1E3RDRJMkxVVThselV4?=
 =?utf-8?B?MFFhZk5ZVU4zVml0aVZRay9kVFdWQnd1cWdFZGNkYzZleVhtanpwK1hDcTRV?=
 =?utf-8?B?Wm1MRUU1ZUlGRjdEOEtqcGZHeEJNNkVBeUZZdjh3ZjdVQzhjeFhwS25vQ1B4?=
 =?utf-8?B?aFdab1AwQ1ZWNVBMYkFRbmZFUUdxUjJhU3YrN3R2eEdwdFJXY0R1WWRPQ1hF?=
 =?utf-8?B?N1k5d0RlTk15TkJ5Q2ZHN0tnb3VUaWEvWnltdWdjcXJWMDlhenpKamdNUnV4?=
 =?utf-8?B?a3VRTFNxKytSZWNQcTg4bTB5d1lDdHZ2U3ZyK2YvbU1hNmtJaGJlRmhDVGFY?=
 =?utf-8?B?SkE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB9161.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0pOWGRwOVRIMnNsQmhzdHVIUFg1VWE0dTUwS0pZS2ZxUlVDeWFVQmYzMXVa?=
 =?utf-8?B?UzZQb2kwV2FwNVcrMk9GV25iSCtacjRGTDFKYlJ5SFVXN04zYy9HdUphNlRi?=
 =?utf-8?B?Y1JkS3ZTK09Xam9Gc1FnU0dZR3MwaDNhM200dUtMdThTUDZLSHlJQ3pqSUtm?=
 =?utf-8?B?SFNkenBMUkx1TytUTEc1WHg4VFRTVVRBcXNaNDY0SnBrRUlJRWx1RWJCNjlv?=
 =?utf-8?B?cHBLTHdBM1dnTFhlS2dWTjBrNjljdXN6SktvQnVPOHdWMFVYOW9aVE9WUHdK?=
 =?utf-8?B?bGJaWkRKS05MSWZjNVlTWnpQR21BWUUwT2wyYXJqbG1RYVQ5dUZWTER2SE9m?=
 =?utf-8?B?T0hqVnpNUGNZNnUyMDBMRkFsQ0ZNMDlmbVBDWTJDaXo2Yno5Q2V0THpPeGM0?=
 =?utf-8?B?LzZFbmgzaGdKai9FbG5JT1NnREVVVUZ6bkJjVTVNZlV0OGdJNnU3R2RPVTk3?=
 =?utf-8?B?YzBNeGhieCtJVjZ1MUpuWVN5ZDNKSlZmSDFZOEFjQnNPUW8zRGxqU0pldnZi?=
 =?utf-8?B?YlZqSWRJSURHL3hGaXVtaHowcWowRHg2TGwwQkFDVU81MnBiZmprZDZIMEJk?=
 =?utf-8?B?NnFNY0ZLWlRvZFRxUFU3cEJhN1VBSzNLNDZqM29UUGo2alBkM3F3cG0zMkdk?=
 =?utf-8?B?YUl4aEtFSTA4NGN0VlhjU0hETHFGc0pIOVFURUFKem9EZlVIT0o5ZCtOWVdQ?=
 =?utf-8?B?b1NuNWw4UFA1TmJQOXZjTDg2SlNwWnYwdlRwdGZTUndXZVVlbjhoWG5sdmNZ?=
 =?utf-8?B?bTNmYng0UlJKVGNzTHp6VjQzVS9xSlE3YkhwSVNNbW5QRzJWWVEyd1YyR1Jj?=
 =?utf-8?B?UUFXaVZOa3BReEtqZ2dEcmtRL2VMeFltRVdjeXhzblFJNEdTUXQwb25haU9U?=
 =?utf-8?B?UDZaUHlpcW1FUEg3Y2lFMzI4bXpkcmE3MVg0Y09CSXpuSFM1MWxrdE81UUl2?=
 =?utf-8?B?eDRhSkoyd0JVd29YbjV4THFnVklHVERSazVmMXVqdmNEYXlUT2dRNWlWQTll?=
 =?utf-8?B?dkI1UklJelhSWmh0TUZFOE5yZEs1UWs3bVhud0FVTkhqOGJXLzQ4dWVNaGhG?=
 =?utf-8?B?QWZvSzFNNmdHeVZEbmlJWVBCaSs1YXU2K083VS9GdXZxMi9zcHZWSmxiV25Z?=
 =?utf-8?B?RGNNUGxUU01NTWFyRmpxVVk4aTBYQWJHcFQ0MVVkZWZkVWdWU2RhQkQrMW44?=
 =?utf-8?B?U3B0NldWaWZvMU83TDh5NzI1L1dralpvUUppMFpSeGdvWDV3TzZ3M3V4Y2ha?=
 =?utf-8?B?T29BNWRQY0hXVnBRWFgzK0JXY0xpajcwZUZmdUhabGFINThWVzV6aXNIcmtF?=
 =?utf-8?B?T1V4QzQyVlp2ZU12akd5eGgrK2xhY2J3Y0RvZG9STXp0QkdPYTBFTU9kWE9T?=
 =?utf-8?B?SU5GN29vaS9PVURQT3Jvd2hUaG5sd2F0Mi9UK3RROHRxM0hiRTQrZWIyR0JE?=
 =?utf-8?B?R0JEZTlQTU1qVXVpYWEzbFE1YTNHbExhM2E1VU93TlNyb25jR3loTklRazJv?=
 =?utf-8?B?MGFZTGh3WjAvNDdJaHp6VExqR01OUWZlOGhmLzlPVzM5Unh5OEhIcXd2cDhH?=
 =?utf-8?B?SnNicWRkK2tCNWlXeXllV2hKZzBYMjI3RWlxSDY0VDN1QkczZmtTWm51WXpF?=
 =?utf-8?B?OEROY2tFczRkOFlwNnh0ZjFuY0h1ZmRLUzhUKzBubjFYZjVWTTVqcFN3Ym4x?=
 =?utf-8?B?NGtkZ2p0MTJFZVdoTTRLS0s5UkhIbXd0VHd2aGdaYVZKZ0NjYVA0OUZsMlpN?=
 =?utf-8?B?Y28velN4ZUhGRkI3aVlkSkRBZjFWTFlBVDFMVjN0YW14ek9yTzYyelkxb1A3?=
 =?utf-8?B?d2FWNWxHczRRN3VaRUZIakJiQVpwSjRVYU1SaWVtUFI3TEdaR1BJRnlST1hT?=
 =?utf-8?B?R3JNY1ByRFgzd3Y2WEZHSHhOUDg3Y0lMeWtyNkp6RXM1Q2N0VEk3QmhqcVFp?=
 =?utf-8?B?TlpBTUM1MTFIL0xQUkN1SW5SZlR1VlNWaGdxaDhhRHUvZkkzZnV4YnIzd2tD?=
 =?utf-8?B?c2VCY2dERmRNNW05OXBpNk9iajZiQW9vVnIxM25jdmNuaEJvd1VDN0tzcitw?=
 =?utf-8?B?RFJYdXFnT1R6czd4d1Jxc3VIb3VQTWdhNWxQZkc3S3JZSldKTjJsZDVPZWlB?=
 =?utf-8?B?aURpOHNidVkvQVpWbStnZGQvTjJSUWJCZCtHSHJJQkRBNnpPaXN5UHNSdjlB?=
 =?utf-8?B?SVVaenlDQ0lDVVp2UEdHeUhOQ2gvR0swRWx1eGtTVE9FR0ZCVEd2SmhXbjc4?=
 =?utf-8?B?Ui91U1BreXdVOEd2TGdoc2pOZXZRS0kyWGtzRTQ3LzdCYS9GVDBFQUdkMXlj?=
 =?utf-8?B?MzM0bm5ZZGxPQnZmUmFmZ0M5NDM1U0hMM1VqampmbnZ6VnhoM1ZJZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ec0df3b-ebfd-4bff-9960-08de53fa972d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB9161.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 05:54:47.8026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TN1XbUWi5FCfGee/NnHcLPa5ChB80vjC2Nz+y+Os3XCdfnGTHLzky7T9e6IemoUTHew/E6YN6LgoPyhiD1AEgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7562
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

On Thursday, December 4, 2025 3:17=E2=80=AFPM Svyatoslav Ryhel wrote:
> The tegra_dsi_prepare function performs hardware setup and should be
> called before any register readings or there will be a risk of device
> hangup on register access. To avoid this situation, tegra_dsi_prepare mus=
t
> be called at the beginning of tegra_dsi_encoder_enable.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dsi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
> index 278bf2c85524..8e80c7efe8b4 100644
> --- a/drivers/gpu/drm/tegra/dsi.c
> +++ b/drivers/gpu/drm/tegra/dsi.c
> @@ -914,6 +914,12 @@ static void tegra_dsi_encoder_enable(struct drm_enco=
der *encoder)
>  	u32 value;
>  	int err;
> =20
> +	err =3D tegra_dsi_prepare(dsi);
> +	if (err < 0) {
> +		dev_err(dsi->dev, "failed to prepare: %d\n", err);
> +		return;
> +	}
> +
>  	/* If the bootloader enabled DSI it needs to be disabled
>  	 * in order for the panel initialization commands to be
>  	 * properly sent.
> @@ -923,12 +929,6 @@ static void tegra_dsi_encoder_enable(struct drm_enco=
der *encoder)
>  	if (value & DSI_POWER_CONTROL_ENABLE)
>  		tegra_dsi_disable(dsi);
> =20
> -	err =3D tegra_dsi_prepare(dsi);
> -	if (err < 0) {
> -		dev_err(dsi->dev, "failed to prepare: %d\n", err);
> -		return;
> -	}
> -
>  	state =3D tegra_dsi_get_state(dsi);
> =20
>  	tegra_dsi_set_timeout(dsi, state->bclk, state->vrefresh);
>=20

The section of code before the tegra_dsi_prepare call was removed in 'Rever=
t "drm/tegra: dsi: Clear enable register if powered by bootloader"', so thi=
s patch should no longer be necessary.

Mikko



