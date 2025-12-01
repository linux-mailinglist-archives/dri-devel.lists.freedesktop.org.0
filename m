Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 164F3C989F7
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 18:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73B210E444;
	Mon,  1 Dec 2025 17:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JTa42XVH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1874910E441;
 Mon,  1 Dec 2025 17:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764611736; x=1796147736;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jUqm+NoJse/V6ST3n0fddX1nsoGHdB9thrfiHyDCOHw=;
 b=JTa42XVHSFPMQ8rj1gmuappggXIzqOOELtFVKbvC7VtHSRNo6K2nNrvZ
 a42V9SUBTK9vQ9s683IlyHwXsLrCM9dCg4RTCtCQ5bczuszCrr5Lj0lge
 3gg4jYdj5qbNdqoL2p1zdY1mMi+mWpdtuFISz7w5PIJ2X9BhteyqUPaB9
 Ulg0wV5UoCQ6lPL28hRvx0Rw+nrmETWiViod6r+nsJLX6MJoXO73evvDZ
 51jUReoVOSQY+nTPasv6XU8a18v3NwyPG018Q5BgILIR8M+XZqsLddSE2
 /yI2fNdsb9oiYDYYsGSh85aTn3EcBxdb8FbpxhjTpHd6pqrqaWhS6OsNJ Q==;
X-CSE-ConnectionGUID: AgdBvs4hR+64p1Bx+dQhXw==
X-CSE-MsgGUID: DcuCz479SNqoou87m/AAfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="77908998"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="77908998"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:55:36 -0800
X-CSE-ConnectionGUID: rBsq14sbTIqGdx38ae51JQ==
X-CSE-MsgGUID: CTua6ZZuSiiGB4+tkHqeSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; d="scan'208";a="217480114"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 09:55:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:55:35 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 09:55:35 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 09:55:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C/2qY1ZXRr2epf0PPJMHjBW9J2GgmsE5r4ozvtOSxpltEnL71CO7vT5w6xd9YbXwYPtfIuMlhtkj7RyMQ1XYfAsJPsbJbQMO7H08wLVq4Wvom+6CJGqYmd7Dw1zLt0z2xedT10B8TODLErqxaSDkuU/BVuCSgB7OKB0GsnfyJ/pXzNSPshdYwErkSToaoeULOsANoekRGGbLtgtBHPk75DcVi109R7OFChqEERyqPRPnFdx9hdwJ70fug1zDG4HtT5LGduXDL6Cgdd8k4euAn08SDFaK2+3egMQi3/50PgvwsBMWu7m5+Tr1U/40DttkmIubEesk/a4N/Nm69X7oig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=llxPgnPF1SIesNvbHBYSKclZcZEHLMGrFt9UKKaXlRk=;
 b=YJxup8eSUeTRP6ETZ+FpQFSdOe/HXcvJmujS7FA4pLzQL9Q8FKoXDW5lFarDl4cnRYAXPiZkLyAGotGZ1Pr1Iv3485F+DcBC75rhDw0f0WvJ/fOGogi30HDmHOQapXn+JNbj8sgA2RQ9Jiix8RXNXq6FK98YJc4rDcaggw1rgUy+U+XIYPDEbvFh/OzVzbKb4bkPxdgxELQ7kxEDfO97LsQ9zsIkEunEVoIfw+uO9LGtmobBTC0ndVSbmtKKWQKe76PKuJ8OZe383i+13aYPK3xPujkFu+4fwBjW++2d4XGEH9GoG+R10JtvZJ88cuoUj9pSRdfAQmhYqoWXditO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CO1PR11MB4788.namprd11.prod.outlook.com (2603:10b6:303:97::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 17:55:19 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 17:55:19 +0000
Date: Mon, 1 Dec 2025 12:55:15 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, "Dave
 Airlie" <airlied@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH] MAINTAINERS: Remove myself from xe maintainers
Message-ID: <aS3Wg418oQKUFOE1@intel.com>
References: <20251126224357.2482051-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251126224357.2482051-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0061.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::38) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CO1PR11MB4788:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bba14da-a3e6-40d0-3463-08de3102ca4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?WwonRDAgOyumYTchfLIfOO0SSfX0MREbvTDozDyD4qEmv+tZYEHPfaJLdy?=
 =?iso-8859-1?Q?Daqonzr5e48Shs3iDc4hOk9QwKdsDb4ZVsjVqP2n6qf5+KBOtj1LOjlf3S?=
 =?iso-8859-1?Q?MBARSy9o6W50aZNFVDo7/4pan9bQGujGPwPIB5EwQnHvc9BY5+ThsjCC9X?=
 =?iso-8859-1?Q?gZls79Fqv7o/SQ/+J6MnuTLrQ+QKRHXuEKAyY6ZRiATDj8O3e8Hxy9iV+0?=
 =?iso-8859-1?Q?PoG/BPdo4RuOs/dUD3Gy3zxYYur5TEU7a6OmdPgnaOcxedj3lNsNmBVCzX?=
 =?iso-8859-1?Q?kL+U8BZ4qIrrMC0PPcilC4/pSbYtUshPT2gwcOQcmKlxmuSqdpnGUWxFCN?=
 =?iso-8859-1?Q?tSIgqi1EYLN1+/S6Wg0riLWddchad7osfJJbF+onZyA9Z+NdhSKsI4hxL9?=
 =?iso-8859-1?Q?qVnCv2U6X1Hs6WiQ1L1MmbFN+qn8l5c/i+sVibDl20dV48JU+XvvLley0g?=
 =?iso-8859-1?Q?RknhrrQciiONxfXqomtd9aaGQ/6xGwiwjyX56P7tTrQy4kSVygKEvgipAh?=
 =?iso-8859-1?Q?DPf/mGka+fsj2ImFpL0naqdgdNLpWmCd2jkA4/JnGD7HK59BqyyPHYCSrc?=
 =?iso-8859-1?Q?KcKeh0fWkNwKjOFQ5YMT+4d0SmaqqX8wKa8bCHQsZteEs1A4x6CzbFn9+3?=
 =?iso-8859-1?Q?P7Hz80I5Ye0Yt0fZ9ygz1YIZaDHs7CDzyErjwXvGkQ9jlq2EfOw58cuYy+?=
 =?iso-8859-1?Q?73PPAT8TkOMd/u5XWXk6N8nePWCoZKXWIPAurO3DeBJdTiinMf7kbfDbN9?=
 =?iso-8859-1?Q?ZDInjKjhH6kfZX+1t2C80y05Uiw/U9rgOMe5xhEekX1IMBnfnNLCdalypt?=
 =?iso-8859-1?Q?4FeJVGwH5FgIkEBzEmQkP2vdXZ5vsSDcVqx9X4S++jdAP/SLo5bEQwhtSY?=
 =?iso-8859-1?Q?4dNshiJLI4q6jJcIfXrEUFZTQukpcYJttHTmrmhgBaRr+PXhZ1T1wFZp6x?=
 =?iso-8859-1?Q?ziNTdbfOAQE9xrdpgendG66q/is3pBxwW8PMTrgm5yNgyhoioHqWWGqWBN?=
 =?iso-8859-1?Q?cpsP0HIk02dHB4oABtcw2Fd4gUy5m+S+hj/7RG8WDroh7pE+23Bku43aab?=
 =?iso-8859-1?Q?Fx/xNGYCdoXnxDsPFCyq6n7ATP2xuK4SurwJyFOL0LKA7if9ZLEIvN2PGo?=
 =?iso-8859-1?Q?q3y52kWj/61/HCeYTVayWuG/gPzhacd08jllHFa1Wcunf0sv+oJ+W5gt1P?=
 =?iso-8859-1?Q?3EeTR67wMjRDQajGlV2cVpt6IAGJKeNi6U95t4bhmJA50ts9tY9OiJlF8E?=
 =?iso-8859-1?Q?zk6Pb4/l84g0tFYC+fyppF91IkmDDLKF3JVURf0Fk+s3BR4W1dIutZnm0k?=
 =?iso-8859-1?Q?M+0nV1tnph/wSmCre2Dirj81BapvLLJbADUNu4sEOFcQZTdyIExJLe3Ct1?=
 =?iso-8859-1?Q?zqaaPZpdwzFoVbm1Bie0LPWcG8wzoXeHe9/vkAGAaCiti4DdQaBe+Vdaoh?=
 =?iso-8859-1?Q?mHHHrrUdLXCCT7SLwHeF6sHhtMiBUokc6exXhgqKduh+GZN5QlYeBNTzqu?=
 =?iso-8859-1?Q?sPWubvw6qrQVnZaPmuaKYY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?IINhd8l0gX/bzITVmI1JODD15C2f8YHiJ2dc2YoPlnIQ1t+stRyDyDmoCi?=
 =?iso-8859-1?Q?3e5qG1HL/qbSGYxrTvRhQW4YAj0YNopuim0KE1iLd8HF6S8nOF3CqUJZlN?=
 =?iso-8859-1?Q?ErNtzmCJ3OFen1jf6cPn5cj7kBXcF0l+ofOOiC5Hv7Uf0BMrwCYo29Ci/y?=
 =?iso-8859-1?Q?lV4e/bO2rWwVcpCqGVaMZm0WbwmTirHF6I1yOBaplHwuYM2OJZPRWBhuiR?=
 =?iso-8859-1?Q?Zr47CrIGvJFNuADNEBIPkP4AgWXZK5TYbtkowEOd2tP2qvfJOrxmbhTdYF?=
 =?iso-8859-1?Q?4CltwNFrV0QLS1xkfkQfMUuahYo1DBFkYUyNsmMiL9+puPKt0d1p3D1k9Z?=
 =?iso-8859-1?Q?kuXtHQljYhnV0yEYMzSP17v9B6LP4G62sMgbff/vO5azjHe2bbT9IR5sy2?=
 =?iso-8859-1?Q?3KThacRzBQoQPM03m6Y2a+AzpQ/Iox1qVqBvWK/bVHfCf6HOBGc4bjFJbU?=
 =?iso-8859-1?Q?vAoyk73m0EgE1hYQC8TMQZbRZYII3NPwqM0uxepz8wqyrzMKGk2VoQbBf3?=
 =?iso-8859-1?Q?x4jVaR1RKgPNOhrrBaW5U5Ci7XrQ8nltTw8TMNNeek6eoymUgV+9GrLuwN?=
 =?iso-8859-1?Q?JdHIJoFIC15JmztCpPUGJqG+8K5CUBOcBuBbk3IdEV5KtTiTZC77GzhzuY?=
 =?iso-8859-1?Q?NpAQg/nO4xxKBOi8Owh8JQ5CZFJ61cbenpnaCOShoycveCUAz8Xh+/aI4a?=
 =?iso-8859-1?Q?tG/ka5ugciCp/Ul/wGwjse7+8HShwH1qOzfKKwKPbEXu1OQ/Og33qfe6jJ?=
 =?iso-8859-1?Q?fMWzENQqottINud/gfQwhuUTWrMZ2CRP1KZ/GoFm7T67AMw60pdooYwl+3?=
 =?iso-8859-1?Q?DWxdV65wHFj36BPwS/7HaUsAs7eSd7A4weDtE1K5jCwt0/rzcZV/LqD91N?=
 =?iso-8859-1?Q?E8FRD1pUwHj6HJWBZdgi6jaAKwjfw25+g/JbiYDnpf0aKzp0+FlQhEmiwd?=
 =?iso-8859-1?Q?AmajYT/nYRUZeMQs3sEH/omaWR+0REwOYQ7RXdGd1K4YhirnWWiC2veCZW?=
 =?iso-8859-1?Q?HHQaCwtxb4Dj2ZXugqIt7W0rK1b88sHt4Lt7Meb85nNZNTbAO0u4aKHNn/?=
 =?iso-8859-1?Q?li2sD1Emjo13CGHoyJpgdMII6Pn+5yUQfmN1w69HArUtmEQZwDNGwsA5M9?=
 =?iso-8859-1?Q?CPzYCUxWRQLCef6HtL60I4tgXlgw3P3oL7ZRz7iJlAF4d18Ofi88unNNEh?=
 =?iso-8859-1?Q?HUYockfW7hR02K0PtMunppQSc8YBcbnQSNqmMBNibblNRSV+Yre7RU39CM?=
 =?iso-8859-1?Q?ILNF4ZTo1oDHmlNmj+X2xeSfKGPWNFkbbG4iFSmyuxpZUW3+0g5V9no+8X?=
 =?iso-8859-1?Q?/8lth0cldX5qwTFjB2kA8bdAWko820LNLN5jhjZylye5NA8IqmjmXed+TH?=
 =?iso-8859-1?Q?lXisL4wYUTdh+q2edwKzuP1sVrfHGzGrjnHGnWSMUN6eZJwdj++RStR2hx?=
 =?iso-8859-1?Q?E4f64zgHHzK3bUE7JRg+myi2+yQGB+NhgTH+GILdWZ/tX8NY9OM2yGpkvM?=
 =?iso-8859-1?Q?zPvWwdh2M0GfVlIalS9kFmUsReG9rksgkJ0TAZGp/MHVtouXGBl+Lf3p8X?=
 =?iso-8859-1?Q?mRCaVNiTMMhxHZn6c6ufmWq0WIC6vQ0nSHzAX0HcfE/QAiaGxUODlRXOy+?=
 =?iso-8859-1?Q?U/zLEbOK0pm4pvPleBmnWBU8ZZYzizi6/U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bba14da-a3e6-40d0-3463-08de3102ca4c
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 17:55:18.9507 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gs7QVd6Y0nxOuK63j6AtboIRYHd3vpuDUxABznvKqwVynmxtwwMZY13v7qpFo7KXGa0PCMzuipemyFQfrN58FA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4788
X-OriginatorOrg: intel.com
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

On Wed, Nov 26, 2025 at 02:43:58PM -0800, Lucas De Marchi wrote:
> As I'm leaving Intel soon, drop myself from the list of Xe maintainers.
> Also update the mailmap to switch to my kernel.org address.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  .mailmap    | 1 +
>  MAINTAINERS | 1 -
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/.mailmap b/.mailmap
> index af6e4fce9bfe1..716c0573db214 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -476,6 +476,7 @@ Lorenzo Pieralisi <lpieralisi@kernel.org> <lorenzo.pieralisi@arm.com>
>  Lorenzo Stoakes <lorenzo.stoakes@oracle.com> <lstoakes@gmail.com>
>  Luca Ceresoli <luca.ceresoli@bootlin.com> <luca@lucaceresoli.net>
>  Luca Weiss <luca@lucaweiss.eu> <luca@z3ntu.xyz>
> +Lucas De Marchi <demarchi@kernel.org> <lucas.demarchi@intel.com>
>  Lukasz Luba <lukasz.luba@arm.com> <l.luba@partner.samsung.com>
>  Luo Jie <quic_luoj@quicinc.com> <luoj@codeaurora.org>
>  Lance Yang <lance.yang@linux.dev> <ioworker0@gmail.com>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index acc951f122eaf..c3fe83ea713cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12517,7 +12517,6 @@ F:	include/drm/intel/
>  F:	include/uapi/drm/i915_drm.h
>  
>  INTEL DRM XE DRIVER (Lunar Lake and newer)
> -M:	Lucas De Marchi <lucas.demarchi@intel.com>

:(

Sadly-
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

>  M:	Thomas Hellström <thomas.hellstrom@linux.intel.com>
>  M:	Rodrigo Vivi <rodrigo.vivi@intel.com>
>  L:	intel-xe@lists.freedesktop.org
> -- 
> 2.51.2
> 
