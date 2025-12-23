Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAD9CD9BB8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 16:06:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5689710E243;
	Tue, 23 Dec 2025 15:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fKWsV1WY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7FFF10E184;
 Tue, 23 Dec 2025 15:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766502411; x=1798038411;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HNtbQOT5QQobPro8/Y/0sQ3JBLH9HvR7sRVFSLkLaRE=;
 b=fKWsV1WYxoE4j+oC+HzHWbQ89LvPrHcicBkyU2GG6ZE5WHOnjlcXAI3A
 Q1GbyeOHemTyEXfVSpCUZUzG163r4ek+UAkKtarU3bZvmBE7WIliRLPl/
 uh6v/mcIuBf+Bp9MKMed6MIP0Gdtsl+1VH+lv9lNPHZ5+uXeFbV9eSTTz
 3g9HTvicyXHsSPWWHU2OTdtxEZw3ReA5goDOknvVBXQcnS2rJJ3aD8y6M
 83aztorpq1GDRr8r0orrlmulov0v4CpARACqDkcX4miNfZ7/RTU96YLSu
 TBoWovzhl0jfy4dDVkiENfTvUgaNgAYA5HUTCmw1o5Ylgf80mazEX+Gef A==;
X-CSE-ConnectionGUID: Lol4TZn0T4Wc2lcPif35xQ==
X-CSE-MsgGUID: Vtb1MW2WSsu20KGCXqkUCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="78984474"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; d="scan'208";a="78984474"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 07:06:50 -0800
X-CSE-ConnectionGUID: TYtjmAd5RK2Nqko9B+furg==
X-CSE-MsgGUID: mIhmIiE3Q1iPkcN06mz2Kw==
X-ExtLoop1: 1
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2025 07:06:50 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 07:06:49 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 23 Dec 2025 07:06:49 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.38)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 23 Dec 2025 07:06:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F19AjkE5ekWspCWjvwvxUPzLwHOFxXvSnnX6UDS5IzJyluYj1whnoeMDPzQ8vfXQNF5L+XmiIrAa88NNTdm+8h9Naio+eNAqC7rYVl3Rw4ugJtzSKQPtGeu4QamQSFdndXd8IRk3501dyKyPzzA3IS3mZ1yQi4KN+DypAvldk27zJ9Ib9d3V/CIlXISfpP1SmfWj87/pQNEOwMk6XCG5nluX8R06nwK7a+cSGLcce+6hYZFJ7D9kfJEMy2inu3QJD3O9ezJt5GNU2KdepxrrKr9KRIsYaQzRf0kzel3IHkalnQEaR6vqiHSCwQkKtFZ7HpmE0+BglIcuyR9yepvLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmuA6SSFWUarVEKlE+e56fjFWLW99XMSHtSzCSfbaSA=;
 b=D+eSgqm1VZxot8MhOmhnMnEpCMnu2a2gA2gH05WzJBeyx424E++6uQx1VZphzjNnWeY1iMyJPjN3tCFj2wmao3kAtVCYkMZvQcn2hNjV3D9N+ScfeTSExpmjY4IFt0d349tXEEpon4/XM+dx+7aWun3gTqiEUBt/bukskDmSiySmVnkW6SqcMCop9U5nSGsNyNyld48I/DUZsOw0V2l4W6TaVb/Rnysf450Ay/igEd0FDfc4XCjbRbaYCY8VsIpsc/Q0uwwrIy1GXLFaoDunfWi9zVnX6sO+Cs4ZSpsxoTIsTL8W+3ngTys5A+6bteKXW1uikqMvgZzWAUYeFRpmbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW4PR11MB6840.namprd11.prod.outlook.com (2603:10b6:303:222::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Tue, 23 Dec
 2025 15:06:45 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9456.008; Tue, 23 Dec 2025
 15:06:44 +0000
Date: Tue, 23 Dec 2025 10:06:40 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Calvin Owens <calvin@wbinvd.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "airlied@gmail.com" <airlied@gmail.com>, "lucas.demarchi@intel.com"
 <lucas.demarchi@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "simona@ffwll.ch" <simona@ffwll.ch>
Subject: Re: [PATCH] drm/xe: Don't use absolute path in generated header
 comment
Message-ID: <aUqwANs-HdhISQ5Z@intel.com>
References: <7fa5ef0acc89a9d94c328f6651c1d405bcd833a4.1761920974.git.calvin@wbinvd.org>
 <aUhQHcgL4U-HgSv6@mozart.vkv.me>
 <40b24664850c231b1a2fd80a084d4a7f32b8148e.camel@intel.com>
 <aUmpZzD_5RauueUo@mozart.vkv.me>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aUmpZzD_5RauueUo@mozart.vkv.me>
X-ClientProxiedBy: SJ0PR03CA0055.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::30) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW4PR11MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 99198501-3f45-418c-5ee6-08de4234e2c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?b9ffZCdp8quP96BaxtcZ+9e6Y21E70OnSgCWANcPro112Co7n0++Qgva+b?=
 =?iso-8859-1?Q?0QVpKyZZEe5IvCwYyjE8oKPXCdikywYABmBftzVWMHVEgC3zyyH+ZXSBHc?=
 =?iso-8859-1?Q?fasebrIp5cnHZjhKHnlxavFbZKznWUOrL4UOFmMEtbGDZbWHn7qjVp0Cpw?=
 =?iso-8859-1?Q?8ikPr4m2s1Y27KhrJeaRAksstq4grlqONvP8Pmi/hIDiO5gUVyMdwGGyOX?=
 =?iso-8859-1?Q?z/jUOhcs3HJ6jnAiZyLCriGYRSXzd2rsPWqfu92w1c+CdWMmJKeevVATMM?=
 =?iso-8859-1?Q?JBUfbwqFMOtBWDNbsR+Pc8qyk0TM1q2h7O9vsWCMrpNgcrfExRY3Xd9ui7?=
 =?iso-8859-1?Q?nfp5Mo8OC0C4GMaxU3YiSfSaLmKLqizX0BA19yTsrq73T2F9+ShSt+Sysv?=
 =?iso-8859-1?Q?bjQH6wgBxxPGKN+8neO8R99xj+gK2AUAle/CNtphlCnkjJ901YZrCxaxET?=
 =?iso-8859-1?Q?5WTsWF8gNGGIOiBxtuYvU+Oe970DJuKJ8VgYc+zVlc5M3Sx2P9j0fhgvW6?=
 =?iso-8859-1?Q?asAQtspeQBMKprfkqQa9XEspBgFsNWsjOSxsnDKn2yx7EkNm8mVUGulAV0?=
 =?iso-8859-1?Q?9lZUKuJbfNWw/TNM8ubmvXMOliJtKUB1BGs1QgefEPoVM14yEERZ6dEJ52?=
 =?iso-8859-1?Q?WhJGqkDrdj9T8u0pKmNaH18CtHcOCPX9QPr7eq1Vo9bqL0fvioGplIzXUp?=
 =?iso-8859-1?Q?BqhKvDXGmKgW3446NlJUXgNAwXJDG2lriF7ox01JsDepx0VhVza8jyS2Eb?=
 =?iso-8859-1?Q?OJ4yQZZ72bjwZa4+ILT0vbqwG5GaDu3FTyTJqEgsYZlOMgF+mKpUBmgEGb?=
 =?iso-8859-1?Q?n73VvhQOqANL1e8WGJoCs8bvWyuL5TGElI9Y504KMKKc8Y4DeKlBH68qRU?=
 =?iso-8859-1?Q?hZXV5CO260+HeeHI1obZYQ1VCpYr0QguFdtYLYcZp5f6eaE6zylsYbBdoD?=
 =?iso-8859-1?Q?ri8CxQ00R7rTl+I+qakIAQTtTxP5d/8sfCWejh9YM3xkqRezD8Cesges88?=
 =?iso-8859-1?Q?JFBZ4So04aeQNsiiQMhaR4HIka2M6+m9IidjYyHJFxty8Z88hr8tKTp5so?=
 =?iso-8859-1?Q?DWGYiEUbzqIKg3eX0Dw1XAm5JitYYPLazBRE+rQYnwgbZnv9BmXQJda1N8?=
 =?iso-8859-1?Q?zvI3BLG8WXkcc6bN1HqA3PUH2rH4j/ozG0u8bASh1ZIRt6DKf15xEJphZ0?=
 =?iso-8859-1?Q?RpsKj8t+bnsoF5okLDL9wnlMRi8+J4Cufngzkha35RZz3/3b5pptZ2ktI4?=
 =?iso-8859-1?Q?Ef/nTHK3pPO799if6TVbkAV5iNrw0sg48llhvDHkQoH5MexPGr8rKtodNX?=
 =?iso-8859-1?Q?sFp7Rsf2MIlieNH/2hTWNSaNNWHF//S/eScDoGL4lPzZXI3TO0+PfNkH5J?=
 =?iso-8859-1?Q?jQiT9BvP6Y72utiYPZkVtwOmlYn0Vm5BfP9wXHFmTqrxy9u7v55yKY76fh?=
 =?iso-8859-1?Q?oAC6+7jqdR1u6GrAgJGbt1gJGEk1V8Q/5vkjMUA3euZjCYc9r+1O3ogwQJ?=
 =?iso-8859-1?Q?VYj5cg2vNwFeEDLYCRDVxQPgmlHkBARChr8ThnOxbJEQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?voy3J4zCumspq7uuswmuUmQmRUl70SKBh3vFKAf10VMIR2eqBrb7FCaNDj?=
 =?iso-8859-1?Q?WnahQ2W3+RncdwY0KmzHN4lxPKzmwEC1kgcha3FWBTQ4gJRkLEMJMKFXxj?=
 =?iso-8859-1?Q?0Ea3ufbHML3WbhPvMXI4Mg4VGgITY9/yl8gqt6e6ruidGYmOhH7KY/EE8A?=
 =?iso-8859-1?Q?LB4hKVzXLSl4AvtZ7dn26zi7nsfx9Vyqgn0V9CSUpuyjSc1AlbV1xX6H9t?=
 =?iso-8859-1?Q?B1sJtNNHjNd3xym1RJXvkhoXmd0GEFGlLKgHE9Hksdg/0YNGf/oXBU532R?=
 =?iso-8859-1?Q?m/+pXMMwCE//n60LeCcJXEBCNKK4YemWQhCKbQo4eGzS4Fj0mJt8vgNrqw?=
 =?iso-8859-1?Q?NNZViyRNGLNROOwVq0IThPYxovNM+Q5EGfTMZ1aNw7jqjhIze0h5haWsOi?=
 =?iso-8859-1?Q?IqWNFClSHZ3xtFzkAYs2LI0TqQinlluO6YagBP0+4uN2ViUEFFYm43rAbG?=
 =?iso-8859-1?Q?u+Ep0rznlyYan/LUWty48HXmcF0fdf1AizHl1U/huww+bA13Xl1fp84p+m?=
 =?iso-8859-1?Q?jNIt8Yu7YySriz4ihkzH0maHGsWkWwizfQgzqbBuGX6QJ4xChME56RgN/T?=
 =?iso-8859-1?Q?E9ew4gLJ1isLoSo8jF7TtbKGLRLkxG0PbVWNPUsH1+TBSyHvpiXYmClMB0?=
 =?iso-8859-1?Q?99mtrqVSjGr3Bz05rrVELSNtu5g5BTIGD+xg1cQue5F1tyTAmohM1MpkmY?=
 =?iso-8859-1?Q?VsUuQRJwrKGP2QicP9ZWR7sck4L8OIZr2Z58ZST8y9S9SvS8dvSDg6qHYq?=
 =?iso-8859-1?Q?4o0sIB2lyfqXqLaVD4CuJBVvklFpIJoys3T/R2gpZxKcD9Q0zfuN0MP8XN?=
 =?iso-8859-1?Q?jY3JTy47pRINxdPdtApqn8oBeOL9NVS3tKD1VoM9FbhWoQbkurKA2Nzfto?=
 =?iso-8859-1?Q?JEK0uJJgqZOPZZGt6papTpFa0yvVcuqvnfP3JnWcaOQ0dsyEfB0yQt5XOB?=
 =?iso-8859-1?Q?Be5XcHytyxW1GDC3M/4ud2AvRBbOZKTavYNCdGb9VxggUlkkVZ57NFYMoO?=
 =?iso-8859-1?Q?P8ACrwVztPSyXSOj6Qj47LakwvmreAjYL8ws5En8j5RZfOR3kRrWSX7isV?=
 =?iso-8859-1?Q?v5kSGWmS0Usz37WRwFqtbZcy5pdavoupQuP0n0oWcu848jCaJfho8kNDHb?=
 =?iso-8859-1?Q?BjymD4fNjFsqSarzLOyLBV/tSZinMqIzVuNQbsu7IbRHsS9Xh4yKzn9SQl?=
 =?iso-8859-1?Q?LwCVq0fM1dubl627wBHBr2HD2r1GdFNMCzp6AkK6j21/VVBL86MH3p9Sp1?=
 =?iso-8859-1?Q?LG6ouNS0wRw+gygHkcRRkCGm1pyfaEn4dBuEhr9t5aegSshf0kU7ov00/k?=
 =?iso-8859-1?Q?EMsc3f3mN67rxWZJXV14Y3eVk6apqIS2OGM2O0/LYlPy/iFNADWm+aP+li?=
 =?iso-8859-1?Q?PFaE++nGjjmNnpbtpykIVV6u/vCT1RbpashzQta22eHI5M/S+XI56fpMak?=
 =?iso-8859-1?Q?nNKgf6UJkdVJYOVWUJUNev5AP5L6Q4jyG1p3cQVXC3CqT8lx/VJBZmC5hL?=
 =?iso-8859-1?Q?uL+b3iUO64aJTyQ3z5OvM/3X81ojKnn7R3BLJROOO/7Foy4V7TVuH9Y1D9?=
 =?iso-8859-1?Q?IiPnXcVYm5Ocq5omC/ogZO5Dg9jdhHNp388tIEOrO26DPZ+4TGXkNQM8fT?=
 =?iso-8859-1?Q?D+1dVl7iO3cC7bRW7A3eCRmLEbtOTXvB+SvK1nTyrvPi46L1LLKY/WTqFU?=
 =?iso-8859-1?Q?aHXBCbgbnEqoa3vq502dijO43Wf5TL3vhx+vBDDI5nwUD5pa4HDWNvhkvU?=
 =?iso-8859-1?Q?HOaOHXiwPOhMF9kkQVkwNm0byOKcH66hHDaSF4GJp5H++wxLy8yNcYWHUt?=
 =?iso-8859-1?Q?GYdYJw+QEg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99198501-3f45-418c-5ee6-08de4234e2c1
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2025 15:06:44.6428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2s/ofGzoDezkgUOPpgXEiBGWrIC7XiyMlOxdg9aloZQZE/g8Y7cqFPeSyP/sQpPAzMtyCfCmRsWj62qvt3vNnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6840
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

On Mon, Dec 22, 2025 at 12:26:15PM -0800, Calvin Owens wrote:
> On Monday 12/22 at 16:56 +0000, Vivi, Rodrigo wrote:
> > On Sun, 2025-12-21 at 11:53 -0800, Calvin Owens wrote:
> > > On Friday 10/31 at 07:48 -0700, Calvin Owens wrote:
> > > > Building the XE driver through Yocto throws this QA warning:
> > > > 
> > > >     WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue:
> > > > File /usr/src/debug/linux-
> > > > stable/6.17/drivers/gpu/drm/xe/generated/xe_device_wa_oob.h in
> > > > package linux-stable-src contains reference to TMPDIR [buildpaths]
> > > >     WARNING: mc:house:linux-stable-6.17-r0 do_package_qa: QA Issue:
> > > > File /usr/src/debug/linux-
> > > > stable/6.17/drivers/gpu/drm/xe/generated/xe_wa_oob.h in package
> > > > linux-stable-src contains reference to TMPDIR [buildpaths]
> > > > 
> > > > ...because the comment at the top of the generated header contains
> > > > the
> > > > absolute path to the rules file at build time:
> > > > 
> > > >     * This file was generated from rules: /home/calvinow/git/meta-
> > > > house/build/tmp-house/work-shared/nuc14rvhu7/kernel-
> > > > source/drivers/gpu/drm/xe/xe_device_wa_oob.rules
> > > > 
> > > > Fix this minor annoyance by putting the basename of the rules file
> > > > in
> > > > the generated comment instead of the absolute path, so the
> > > > generated
> > > > header contents no longer depend on the location of the kernel
> > > > source.
> > > 
> > > Hi all,
> > > 
> > > This is about as trivial as it gets: it's been a couple months, can I
> > > get some eyes on this please?
> > > 
> > > This is the only place in the entire kernel source where the content
> > > of
> > > a generated header depends on the absolute path to the kernel tree.
> > > It
> > > makes kernel source packages non-reproducible.
> > 
> > Sorry about that and for the delay.
> > 
> > I just resent the patch for CI:
> > https://lore.kernel.org/intel-xe/20251222165441.516102-2-rodrigo.vivi@intel.com/
> > 
> > We can push after passing it.
> 
> No apology necessary, thanks for kicking it for me :)

Patch pushed to drm-xe-next

> 
> Calvin
> 
> > Thanks,
> > Rodrigo.
> > 
> > > 
> > > Thanks
> > > Calvin
> > > 
> > > > Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gen_wa_oob.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > > > b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > > > index 247e41c1c48d..e7a50b1348b7 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gen_wa_oob.c
> > > > @@ -195,7 +195,8 @@ int main(int argc, const char *argv[])
> > > >  		}
> > > >  	}
> > > >  
> > > > -	fprintf(args[ARGS_CHEADER].f, HEADER, args[ARGS_INPUT].fn,
> > > > prefix, prefix);
> > > > +	fprintf(args[ARGS_CHEADER].f, HEADER,
> > > > xbasename(args[ARGS_INPUT].fn),
> > > > +		prefix, prefix);
> > > >  
> > > >  	ret = parse(args[ARGS_INPUT].f, args[ARGS_CSOURCE].f,
> > > >  		    args[ARGS_CHEADER].f, prefix);
> > > > -- 
> > > > 2.47.3
> > > > 
