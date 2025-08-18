Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EE4B2AF98
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 19:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AB110E4B5;
	Mon, 18 Aug 2025 17:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfN5QGnU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13B310E4B4;
 Mon, 18 Aug 2025 17:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755538756; x=1787074756;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Z4j4LmZI1RgJ2K7eVLEvro8ULzsMzME7B/7jCppSHB4=;
 b=XfN5QGnUdOG8EyiTV6ghEB0om7ZVyUwtcieeV+V443VP+kQYhNXgmVhz
 qwp2NfFieUmC7ytjCQ7PMlJnfrMoLHgec/xsKuzuv2V7clfP3cptr9yKN
 2PX8urXI3nOGnuPj+Dy0a5ruF1roNpu8qH5B+63OtNswqYsJj/19U0JWf
 qUG1TnYUauwivput858LtM9uWyXwubJWxIkU0Y6QMEBHLe9EsYif6G42q
 ZKPOZvctyIncTWFnjzkeppgNTdUB+Jj+a8zwF7k+27yqKx+ufemAzliZR
 iUPt6Zbp+eqnJkYa7+EblaVko7xcTbwQS2DL81CDXd/r0BxUzTf+VqokN w==;
X-CSE-ConnectionGUID: Z37Do/ShRBWNdgHuXm5PRw==
X-CSE-MsgGUID: olTnYAqmQ8KLj5qUbT6QaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="61397420"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="61397420"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:39:16 -0700
X-CSE-ConnectionGUID: Z/Gj2BsiRqKEaeNLS2PnMg==
X-CSE-MsgGUID: zyE9pPhARTGzrsiDjk47bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="167991226"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:39:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 10:39:15 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 10:39:15 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.63)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 10:39:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tY/7G5yJeBdf69CGr8OD3bYUFJyZA8j+xGxiKU4NybpCO6RmZwwOWaiGrFmosDjRp3eX5xhi2Z4V08hN6wxjWemMjS9yrRIpUOp99YsOf4BtvQXe1a2mLvjmTE+NFngtMEuIdYaUi0eSvh/3pQzsEhQSR/IqhiILd/4N748AK/bqULlVRwZWh0yzNanuCSGje1GafnLmRZ0SQ1LpfElFw0o8KXijBLHLW+ulwVzOFiSBmI5MDq2QbBxyuutIQtcZnzDLP8G6s4EovIS+31rmo8BGSPEn3Wx5vwEDLurU0P+BWx/+GB0vhLo3HV9oJQnjObh319heNGFuphZx6RAlCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvR0I9OPu1NNr48DQft8kFAMEdChBQMM0voBlIi/qFg=;
 b=jFEtuceomFtPmcEVXVXEswGHq0U5342cflZvxF5bOqX6ngjnL2EFAFRgR2FA08W06GRwqwWgtQSLFZoELHv9f/Xz1bdmzDUwFsJSeWp8iGQ+htG2eMF5H0FLcDcEVfLCy5p4vbq2RKr5qlG2zGqrDRh4mQNMBMavGhQs8S7L0TukrE6FxlRIiuH9FlyKlbepm7hJ/VvFcX1IPB/R3hJgkYM5hYqshx/9UPEARLWHRypfo+iYEiMQoNw8Lv8+YdNw1OeKpcviE5yTt0unonm1bTfcs92Um+miTu+7wZ2PGoSB5QwUinzPwKTEHhbbbvc978W/dm2Q9cIAEXR+gLjNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA0PR11MB7881.namprd11.prod.outlook.com (2603:10b6:208:40b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 17:39:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 17:39:13 +0000
Date: Mon, 18 Aug 2025 10:39:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v5 1/8] drm/gpusvm: fix hmm_pfn_to_map_order() usage
Message-ID: <aKNlPkAEXJ9/j1Hy@lstrano-desk.jf.intel.com>
References: <20250818152152.67815-10-matthew.auld@intel.com>
 <20250818152152.67815-11-matthew.auld@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250818152152.67815-11-matthew.auld@intel.com>
X-ClientProxiedBy: MW4P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA0PR11MB7881:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ba4c54c-c122-42ac-9099-08ddde7e255a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZXNKSklBUFdWLzlTakprVmkzQnljLzE4UmVtMmFuN0JnbUYwSmhTNFBqQjZy?=
 =?utf-8?B?S3pLR0IyT1QzRFN4d0RZRjB6K3REa1VISzhFekRlL1E2eFVZSFdpOWdCbnRo?=
 =?utf-8?B?aUpaWUZWdkIzMkY0SEVPVmxtTi9YTEp5WG1WRmkwNlhLeDd0QWo0Qm1ZM05h?=
 =?utf-8?B?Y21NejhHVjlqd0Z2RTVNOHJYY1pYbURKZXUvRWVVMkpFMkptdUU4Mm5WYmlr?=
 =?utf-8?B?dmVwcFhOc3hmeURGVjJzbkNhTStES0g2WW9LSHZWa3lmMjEzbGIvVEo2cXlO?=
 =?utf-8?B?T3VMUmNkMHlkcVh4UVRSTmYxbVdrVVptTWRzMVkzWWlvWUs4MHFNTFJieFZu?=
 =?utf-8?B?TnRybyt4ekpqLzRnclNITUZnRjBLOGpnOGxSL2tyUngwaGlsbzBvMmZoWndV?=
 =?utf-8?B?aStxWUFHRGFaSlJKT1M2K3BFbm90TU5FWElwOWE5cTJLQWN1d2t5cEZqc1RO?=
 =?utf-8?B?ZGo4Rnpid0FGdk5XMHoyY1BOZ3VwS1I3OTN2VnV6cEk5OGt6SlBtSllNaEpl?=
 =?utf-8?B?ZmRjWHpXYk1LdjVJMTNqT0o2VzlQUGFGMHJIWHNQSzg0Sk05MGlhQ1NkQXVN?=
 =?utf-8?B?Q1QvYW5LTytsbEJIbFYwWExVWVRtaWY0SkRLSjlSTThtSnE4MkpvSVExR0ZP?=
 =?utf-8?B?SDhSQnJYY2ZlTzVWNjA2VmtWRFprRXRBcXU1WThQZWRqWGFTaEtTT0RTWkEr?=
 =?utf-8?B?OFFBVE9aUDBZWWpiTjVhbGNDSUE3MG5VZXQ0UTJRSjhKK0YzZ1JzR01INnVX?=
 =?utf-8?B?SEkvSSs5VVN4bW1RZEw5d2N4U0gwUjV0dDVKUnV1Q3ZBdXJwcnE3VStpVm1J?=
 =?utf-8?B?TGxIQ2R1dVovOCt0Q3JvMEF0Z0IwbVZrWkxIdXlqZnF4cmw0cWdBTjVSSzkx?=
 =?utf-8?B?UnpMVUFCODMvVUdmWGVZVmoxNW9zeW50aThLNGh0YUZYWEs5UThnRFR0M2NB?=
 =?utf-8?B?bjlid1VTamc1bDFEZXUzYnU1LzRyVWhkaHNuaWFNelRXaTEwdmtSWTU1UkFC?=
 =?utf-8?B?dk5VWVI1Q21IVlRNZ0U0RkVqZk1sOFNic2RVL0wyenJsQjJzVE9HcDhhVWN0?=
 =?utf-8?B?UlgxNU9CdnE1ZVEwdzRTcE5jendCaEVVazNOWmJsTWlVZDFBTDZYWlo2WEdv?=
 =?utf-8?B?QTVyVStrd0RKUWlpb2RhSUxabU5HbldEUGRWWVUrZVRQSXp6bklZQjA3SG1k?=
 =?utf-8?B?WlFGd3dtZE9hTjZXU0JDS1B3QndMSnhKQWxZaklBMWRwNm9uZFhGbW5GUUp6?=
 =?utf-8?B?d1ZKaXdITlF2UFFSZmpOd0ozQzc0VU9SUUU2eTdpNTBjS1BaWkhRUjBtdWtN?=
 =?utf-8?B?Q1BkcnFvQzMwYTZwVHFpNUZaMjVlU1FTdCtZa3ZlUVpLTmQxSVFlK3lCVSs3?=
 =?utf-8?B?d2gydVRJNmZOUStPb2hsUVNxd1lrU29NZTEvMytHTXRQeWdCcDdhZTRXbG03?=
 =?utf-8?B?dGZyR2p4T3Yyem80WXk1R1hlZDlTOU5qZTZPeUl3azM3Z2ZpenFjaWpqSFdo?=
 =?utf-8?B?Y0hsejBBSHpQK2JoUnBQS3FtLzNxaUNyVVYwTFZoMjFWcXFPUE5iV0tseVBk?=
 =?utf-8?B?cVZSSFdPa1hkZ0VSdm9KQjhJOFNaS2N1UWw1UjBlVTJpL2NpMS9zUDhwY0o0?=
 =?utf-8?B?TlY3eHBoU2U5V2JkcWFZbXZqQmVMMGJwL09qNTExbjNxTkJubVVRTE9HS1dH?=
 =?utf-8?B?UFZzTGJWbG96RU1FdG91dDV6Rkd4VlZsdTNkZG9weVhKdUltWHRrQ1FqU203?=
 =?utf-8?B?UTVHbHBmMFE5WmM1ZDNtdDhXN1hlaDN5VWVBS3pZeTlZaVUwMWwzSnBmZ0JJ?=
 =?utf-8?B?RlJ6ZTNmUk1WWmlzZUtHN21FZ3p2di9pK0xQN0RURnIyd1dPS1RJZnhOTC94?=
 =?utf-8?B?NDJSZ2dQRGxHQStiOUpKNG1STXZpYlE5QzVKZ1RvRTFhcmQxaEJ1QTVrK0dJ?=
 =?utf-8?Q?jgjNDkdHomE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU1sK3VkSm02V2dMT2lHQWFWUURHamEwT0VJekNIenhaakZpaGt4ZzREdW5o?=
 =?utf-8?B?cXNESjF3MjhNbFg5RnltVlFXSFlPaUN0VkplS1JMWjBXZldyRXMwUDJDSnVG?=
 =?utf-8?B?V085ZHloRWtRelJrakd6eTZZKyttSks3OWk5WGgxd00xOUR6cHg1TTJXTVFv?=
 =?utf-8?B?a2pNUWM0UlJYSTBydE0xVmtMSjJCOGFPeERYSTU4U0hiZVAvSkpKZDNKeDA4?=
 =?utf-8?B?bFFXOGdZOGpuaDJOanh4QkROYmExYlBhWGszbCtZWno0dStBZXhjL1dmanRK?=
 =?utf-8?B?bDRVRTFGVTRRWVQ4RXBkeHl5bDFSenJQc2QyWUEwell1NnlES2NzOUd6NWNq?=
 =?utf-8?B?TkNPZTB2QUpSa2E3MEhnTi80dEJZTEEyMHpuNStGN1RxNFNjanVhZVFyMG5p?=
 =?utf-8?B?TytwRXZUamhBcSt4ZWpqQ3c4ZWl0cllSWVg1U2tHM2xnbDBZSzRpUHpsc3Qx?=
 =?utf-8?B?WS93UFR0cU5uQjEvd2hGYUZZcHdFWEJGZmp1RFN4cElnVVRQWFZSbU9HblJq?=
 =?utf-8?B?WEorUE01am02WHdvaExXMzFYQUN5U2Q0dTlFMjlOKzNJOWUrRG9VVFJPdVRi?=
 =?utf-8?B?VGVqRmM1UlpQaDNtMXJTUHhXUnpEd1FqcG9tUm9NV3pQM05va1lXR2dZOXh3?=
 =?utf-8?B?Z1NNYXJWR0lBbkJZeHo2Q1RtN2pDcWNid1BSM1FkQS80RGc2anhTZ3hGQmw3?=
 =?utf-8?B?UkNzRlIvbjhtT0g1cENJdEZITStXRzBNdTlEdFpHOHdLOWJsMEFGcjhISFdo?=
 =?utf-8?B?YW1PSFNYSnRoL1dqVzFyZDFIQjltWHQwZXFVVVE2amJOQlZqS0p3c1RZMm5I?=
 =?utf-8?B?eDNMaXpjdExFeHhOdko5ZERUZlFPT1YyR1p1NEF5UERKeWNnNVZkaE1xLzlI?=
 =?utf-8?B?cVloVjk0Wjd6MU5MbVlRVnpSWHNmdzJHSnJOaXBObWYraVNyRmg0aDM4Mzdp?=
 =?utf-8?B?cjFHSmQrMHJhK0NnWnhhQTRQYzZ6V2NMY3pMMEZGUXBFRmdDck01c2FyOStW?=
 =?utf-8?B?aS9SUHJqU05ReWhTeVJ0MmN0cGNVZGtpNlpjcGxZcmo0R1FhclR3VnVaZVd2?=
 =?utf-8?B?enlGcEdCMUFiNUN6RnlyaEk1bmFFVTY1ZjRGb1V0S3lhbXd3NDRvVDlmaEZp?=
 =?utf-8?B?UDJ5L2ZBTFA3RGVTdDY3SG01L2hKaE9WdzNnc1krdVBiaDlZUCtxbWI2OWVv?=
 =?utf-8?B?MU42ajBYVk5TOGJieGdPeGlZdW1VaGs0N3VyU28ycFJ2Rm0rMVh2aVV3Y1du?=
 =?utf-8?B?N2V2REE3TzhGVVhKV1Q0VWwxTGkrejQrbXBUNS83STdDaEUrUHo1SkNvODhv?=
 =?utf-8?B?L1RsNEV4bE5nQ2hEVnJvZDJBMFV3NDZVblVqVUNNY0pQWldrMnE5elBobkM5?=
 =?utf-8?B?TXlRVEUyNXBVSmUxRmlmRmx5RFJsaHJ2bnptYXp2VUtKRmJWTnNrK2hqdUpo?=
 =?utf-8?B?Ny85c05TTFR0anNFMGY4T3BCKzF0MExPMlB3WGJDQi9WMW9ndW40UmJwVFRn?=
 =?utf-8?B?R0xDZlZRS0NBcUtWKzZTZVpYVG1STzNnL2hkencwVUNVVEg5ZWpUTVhsWHZm?=
 =?utf-8?B?NlVJT0p0SEE1NzVjOEgzdU5SV0tNVzFuTzd3aUxOdkVYNDUxMllEZ0t3WVp5?=
 =?utf-8?B?WkVBYnY1VXBzMGdBTmJHdW0wSzVzY1RGYXh6Ny9oYlNRQitBTkFaTGpYTnQw?=
 =?utf-8?B?M1FyU3pKOC8yb1lyTThYNFB6Q09mKzFIRW1qaklJVStUWnZIdGhhSnhYNUpC?=
 =?utf-8?B?OS9jK3RQSDRNQ3lqd3BFZkFwNEFZa0FiR1FFeUZFTjZZTGNNdE5iU1FZSGYz?=
 =?utf-8?B?MGZaT2VjcTg0QjJ2dXlVOCtQdjJGSEg5bWUwd3B1RGtoTG95RFlwR2pJVzB3?=
 =?utf-8?B?YlpBZ2V6UDFPd3VDZVFucmRCVU9HTW0rQ1o1eUhURnlsOWhTc0MzelF4aFk5?=
 =?utf-8?B?cUN4OGNkazYzRVF5TEl6dVdtSVFncXZhK2VPNnJKYmtYaUFYeXowS3FRR1FO?=
 =?utf-8?B?bnV3MXYvb1dLamsyaXAyRllxZy9jQXBjM1c0bWh1QVRBOWpDOHJBSHo4UDVD?=
 =?utf-8?B?d3l1UHQ3YmZDcmdERVp5dExtWE1zMTkvMVJqOEEvYXY0Wll1S1BKSW5UTzNT?=
 =?utf-8?B?SjVwdUljakEwRWZzbnltbGphSGxXc3g2VFh1S0FQaEZLMXRtN3ZwL3UxaGk3?=
 =?utf-8?B?UGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba4c54c-c122-42ac-9099-08ddde7e255a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 17:39:13.1669 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xzamnx0PynqT/TEPgtlHEO7u+9cv+D3SV6FJMGAT7VHXtkhFmAMAdi+sbBy/TRICyXCyduFzufVt+HpcG+9RaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7881
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

On Mon, Aug 18, 2025 at 04:21:54PM +0100, Matthew Auld wrote:
> Handle the case where the hmm range partially covers a huge page (like
> 2M), otherwise we can potentially end up doing something nasty like
> mapping memory which is outside the range, and maybe not even mapped by
> the mm. Fix is based on the xe userptr code, which in a future patch
> will directly use gpusvm, so needs alignment here.
> 
> v2:
>   - Add kernel-doc (Matt B)
>   - s/fls/ilog2/ (Thomas)
> 
> Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 33 +++++++++++++++++++++++++++++++--
>  1 file changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 661306da6b2d..50a36e7b71e2 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -708,6 +708,35 @@ drm_gpusvm_range_alloc(struct drm_gpusvm *gpusvm,
>  	return range;
>  }
>  
> +/**
> + * drm_gpusvm_hmm_pfn_to_order() - Get the largest CPU mapping order.
> + * @hmm_pfn: The current hmm_pfn.
> + * @hmm_pfn_index: Index of the @hmm_pfn within the pfn array.
> + * @npages: Number of pages within the pfn array i.e the hmm range size.
> + *
> + * To allow skipping PFNs with the same flags (like when they belong to
> + * the same huge PTE) when looping over the pfn array, take a given a hmm_pfn,
> + * and return the largest order that will fit inside the CPU PTE, but also
> + * crucially accounting for the original hmm range boundaries.
> + *
> + * Return: The largest order that will safely fit within the size of the hmm_pfn
> + * CPU PTE.
> + */
> +static unsigned int drm_gpusvm_hmm_pfn_to_order(unsigned long hmm_pfn,
> +						unsigned long hmm_pfn_index,
> +						unsigned long npages)
> +{
> +	unsigned long size;
> +
> +	size = 1UL << hmm_pfn_to_map_order(hmm_pfn);
> +	size -= (hmm_pfn & ~HMM_PFN_FLAGS) & (size - 1);
> +	hmm_pfn_index += size;
> +	if (hmm_pfn_index > npages)
> +		size -= (hmm_pfn_index - npages);

Hmm, okay. On the core MM side, we’ve discussed updating HMM to populate
PFNs only at order granularity. If that lands, this code could break in
some odd cases. That argues for leaving HMM as-is for now. For the
moment, this code works, but we should keep an eye on HMM—or
future-proof it by populating all potentially absent entries.

Matt 

> +
> +	return ilog2(size);
> +}
> +
>  /**
>   * drm_gpusvm_check_pages() - Check pages
>   * @gpusvm: Pointer to the GPU SVM structure
> @@ -766,7 +795,7 @@ static bool drm_gpusvm_check_pages(struct drm_gpusvm *gpusvm,
>  			err = -EFAULT;
>  			goto err_free;
>  		}
> -		i += 0x1 << hmm_pfn_to_map_order(pfns[i]);
> +		i += 0x1 << drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>  	}
>  
>  err_free:
> @@ -1342,7 +1371,7 @@ int drm_gpusvm_range_get_pages(struct drm_gpusvm *gpusvm,
>  	for (i = 0, j = 0; i < npages; ++j) {
>  		struct page *page = hmm_pfn_to_page(pfns[i]);
>  
> -		order = hmm_pfn_to_map_order(pfns[i]);
> +		order = drm_gpusvm_hmm_pfn_to_order(pfns[i], i, npages);
>  		if (is_device_private_page(page) ||
>  		    is_device_coherent_page(page)) {
>  			if (zdd != page->zone_device_data && i > 0) {
> -- 
> 2.50.1
> 
