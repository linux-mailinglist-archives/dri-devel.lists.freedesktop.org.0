Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4584F9D8B48
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 18:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD7F10E6D6;
	Mon, 25 Nov 2024 17:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WltKYp3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8000E10E0ED;
 Mon, 25 Nov 2024 17:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732555618; x=1764091618;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UrUZ5gutYM7aBk1drJhmEeQAXuku+2OVdBjYqqXY83w=;
 b=WltKYp3Y0T9M3v8L3iz/+/PeyT3cjQUpWusCP5hC6JwhDHMCDdOKgDvo
 TPVz6qbRUzGQLJDW5foen2fzEYqxNMbjTT+IWa51CsBhbuf11WysYvoWe
 hPT9RDP912HtMC0Zyt02nLv35KMbg3t1ptsCq0SA1WU4S9hFxpattc0bw
 /rFGMVqxxzsETTugbDblsgTPgTJpdvZwZOuJJlakealR5wFgggDWH3czB
 FV2N884o0VmpXul0fQljnF9UQCH748S70TQuVCyfIrV82tXTQSXDH3g2n
 nd0DAMY2itPQvHsJv/qIqptFmU+BFZO5b7HkMjtg9fxMCbVQEvmQEp8qe A==;
X-CSE-ConnectionGUID: rCWKurecRIO54Wjtbaz3vA==
X-CSE-MsgGUID: wJM5Sn6dRRiupH+Ayb+ktA==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="44059812"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="44059812"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 09:26:54 -0800
X-CSE-ConnectionGUID: 4atFp9LeT+yhrs37shPLeA==
X-CSE-MsgGUID: ZnhZbOq+QS2ROaOFa3jyMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; d="scan'208";a="96248785"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 09:26:54 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 09:26:52 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 09:26:52 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 09:26:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D2tb2QgIOgNhx16v1kSyz6ROuTTpWkJsi0I7BrtM7I7x3iHaPo9mF01izAQcCNVIP7BYoLI5+mhKr6c0yYietW3lOyJnW6EDUpaEAYoAzT5DSpaxr3xPd6GIc7ObBqWXnctTqO7HLb/HjIqYjcYOkzqz3QA7z4lquxYqdENBmN4Jn+ZA39jsz/DtmTtLUTHvrS3saVXBVDyh75PlP2cWbjT7yGWlGTgTL3cdXuB0Xf3VJD+JQYJtnO7+EsOqSUaalfxbosOCDWYcfM30RNdMkziGZhParLECRJ6mqb7yOeDz+5Yy0roslv6gMYQvuthyEiY/x743kasQ/eOM8UC6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNKhsXiQbZMjSqDIzPZL6IA+blD35ESSuB1VaGlm3qU=;
 b=qolvgN1QF3ppj/nLVhsxWFtTP5EVIxJKT444i+Y2OMihWfybrR/9HEU47iDbJsAhH182FzyeX2srTs3m9QQZwDlKwkccOj3Eg+4sGCpgqCVX07uG/lR93PFyoodiso6uFf8ZWycoeF94flrfcSd5N/9Jq7NqbASdUw3nRjVTYnpTWwQ4/RD4IifHtsAneNKATZ5v+M3t0XmA0q0qRf88T91OuXrGtJaf2db9ZgeqEe/zTXuQosffuqrUqipv0wuOc+v5/uDNi0oGv+L9LrMtequTUQrizMq9adGYMoLSGvMm1Fu50sjj83N+ZU4M7/22czTBwoOyneCglT9MaHqasA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW4PR11MB6763.namprd11.prod.outlook.com (2603:10b6:303:20b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.19; Mon, 25 Nov
 2024 17:26:47 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 17:26:47 +0000
Date: Mon, 25 Nov 2024 09:27:17 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
CC: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Christian
 =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Huang Rui
 <ray.huang@amd.com>, <intel-xe@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <matthew.auld@intel.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v6 2/8] drm/ttm: Add ttm_bo_access
Message-ID: <Z0SzddLDzR8NDWmV@lstrano-desk.jf.intel.com>
References: <173141886970.132411.13400253861916730373@jlahtine-mobl.ger.corp.intel.com>
 <27f8bd540ac1f04daf8a7786f4ae7828017d061b.camel@linux.intel.com>
 <c62e5298-1ca6-4cd0-a558-3d2a91175fa0@amd.com>
 <d469ab3509a1b875ad0c44d01569675682d6c61c.camel@linux.intel.com>
 <6ab9e754-6f4a-48ec-b143-02585bc40291@amd.com>
 <5a16ef4ff06a530c52df7633833db19aaa15b33e.camel@linux.intel.com>
 <8d17a8a2-9a44-4f80-92b5-a8aa3efe6bf2@amd.com>
 <ZzeSr5ut6GVEwSJY@lstrano-desk.jf.intel.com>
 <Z0SX8WJCPADGLVE5@lstrano-desk.jf.intel.com>
 <634b07dd-aa5a-410e-8f62-0a96567c7932@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <634b07dd-aa5a-410e-8f62-0a96567c7932@amd.com>
X-ClientProxiedBy: ROAP284CA0182.BRAP284.PROD.OUTLOOK.COM
 (2603:10d6:10:43::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW4PR11MB6763:EE_
X-MS-Office365-Filtering-Correlation-Id: f8453b90-21b8-4dc6-965a-08dd0d7656e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?gmVPs4Z7B7X2lGrWo9JStEaMFhkPRKsOoX2Usq+R1ZzlknE3GFV6jSExIS?=
 =?iso-8859-1?Q?9FyFzr1L2nPziQP5qma1v3KmVQQ62kcwlqdOasDGl1nn5FLGRXoj/ICjNN?=
 =?iso-8859-1?Q?6LjcEb+1Mkedtjg2JF97T/OAIwwgqyic2iTm8xvEh40MkmuLX0jRWXtgZy?=
 =?iso-8859-1?Q?O8BbZYj7Po2DasQKUy+1XyrMz9GguTaJicrxHcCOHga2wR95quTo33lzds?=
 =?iso-8859-1?Q?3DSKoD/YXqgAP4Weu4azefiQ+o2azCZF0Qxed5CeCPQfJcbs27iKNyYgMT?=
 =?iso-8859-1?Q?2TNs7QjeyYRu2YTjU99/Xs/VbLh5nOc8rq/9oDZSCyJlJnzk2A60vfTwWU?=
 =?iso-8859-1?Q?Vd5Bvp3T2OY70Kpk+f+cZTmvM7fHdMDFTzQk0Mh8ZWvG49r6BsTWJae/mU?=
 =?iso-8859-1?Q?oTEQ0mBQx+dg30q/OD3Vm4XFjEVnkChOrLwScSFzBjHzlbPHCa6apzrVuC?=
 =?iso-8859-1?Q?X5ItEBcUHSIwl8pRsu470Nlfh/K7n7Mscex7LuKDQzggVVkCFuoeqjcoaF?=
 =?iso-8859-1?Q?enI8TMJBTY0RVZ3KwU12XemoGmmh8IxD+u/5MohpY4Ezl4u9vwLA5zMysa?=
 =?iso-8859-1?Q?Hxrf0AfjDkY7BiOCXbOT5rFMiIIJR4jNWNQVsTtMiOnYH6pUfTDoFRfJCa?=
 =?iso-8859-1?Q?E5aTlebL93ycjQqTpKsht71geLPMZ44HfAFeFh0HtH0xf21e58E+e8YJFH?=
 =?iso-8859-1?Q?dnhqPo0A+UEEgrvStilbcuAUNhXWe4cICXbGth91gfXvK7p/zW0nT8EWlQ?=
 =?iso-8859-1?Q?FyBw/vtuNxC1W+aKhJXJIu9Tvi0LwZH2ybOw8y1ALVu6cljK3cS6TQhi9K?=
 =?iso-8859-1?Q?mvO8YgCdZC9KJTDptP1ST/1gQlJzZLV9SvqiAuG5+jQlxZ8Mcu0wV4hjp4?=
 =?iso-8859-1?Q?uQ6a/OpFmc/7qcbnIvFv8zM4mFxK1vgOWT5frEwrLUvNUBaw8cnXECjxre?=
 =?iso-8859-1?Q?sUXO7015N64vsUxSLWBaTrsT83vxxRgxwF9rhwwCpRyB4QAiRn6mG/mGx5?=
 =?iso-8859-1?Q?++QrjSxG+GPZlMLdcmVKfAVt++40b4hCe5/NGZzRqPAnWYT4h2jqBW81Bc?=
 =?iso-8859-1?Q?RKDmMfDMM4gpLn0uzTidf9/IsnUqJ/D1EWubfYfCh6q3cmLHupZpYLR7KJ?=
 =?iso-8859-1?Q?aQ+XnLgPQBX5ZAf0ashzgjek3qu0pBs+Fo/XrhtqclciRJ9rNn04IhXBr1?=
 =?iso-8859-1?Q?KfqgFD17F7+ok1Uxpt09uJgCWVSQRPUc9dyN4S+IsJwTULpV5QmVPxs/ji?=
 =?iso-8859-1?Q?8W8rinuIrmcEJ9P4ouF+l8H5PnT5x1jr8OZAq30t4Di8aKHoEydRt33qxi?=
 =?iso-8859-1?Q?03Ai2dV/aJ83dzbykTc0AGtpACLnvIXbvImuOz2Y0/9VIEi7+uaBccGuDM?=
 =?iso-8859-1?Q?y5mPqSnkBf1O7Pa3LBFd8tKDu7AqsCag=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?bRFT9jaQJAbCfErjd80/7TLhB6mHH/2sxHO6h/pEjSwK3ht9A4Vm8rOMud?=
 =?iso-8859-1?Q?kKxbRkV07Ys/S+NvKlV+FcNhiywc2RK/9xdhW3AUev8IWF3KscdChGOOoT?=
 =?iso-8859-1?Q?5P2uDBNCZMQKX1+hGS4mJBV7a19kTOgg6jOpT9opxLj9+lfqNTDhyoLU7E?=
 =?iso-8859-1?Q?tJzy8QPhd8vkuGjA4FFfoYGcYeVD4BeuswKsuPUWJ1JyYIVgmT21wxQ3Ck?=
 =?iso-8859-1?Q?2Nmc9GjZjOcBxwJVOdNb3jvrQ/nWTdECO/3MC/xkfu85k1J+O1TpI2YIbb?=
 =?iso-8859-1?Q?sgeVM8kP0aZpMsXNavbfegVt9vyEZ7k1OSu0ZY+FJmqwXZNuTs2LuZByLV?=
 =?iso-8859-1?Q?K12PBlXofpv/r3Nj8hFuNjn+Rf0AKH4RmQNaWmPOKiPxhcU/4b/3t8K2DV?=
 =?iso-8859-1?Q?CYSoWtmKenPGrAU/CC6cM7XKPRyiXgs84IPAOlCj+cGR4KNtgnLf+PIBEk?=
 =?iso-8859-1?Q?aofl5d4r8jkwIZYIAiN+SGwTAflj2tidBtIAGJc+TL/Ow4cdfepRvr3zQV?=
 =?iso-8859-1?Q?x76srhC6KHR4wfTnCRfYj4i4Q/MXsfX8p3OLpToM+XZZbqGhpDtnG6LCtg?=
 =?iso-8859-1?Q?Vb+sYYiwsWVrxhQBXh7qzn11WbmCJbQ2Nw5AVyc1spOF0kqnP+W8kU4QbL?=
 =?iso-8859-1?Q?UajC//zmY4DnTGIkxG4vXAcROYB6dBRtXGQJ85P9IRKntTRj+OTctiJewh?=
 =?iso-8859-1?Q?uQyWknnhI/V7TTqxtuGQv/xZwsl7t3T8vszr9P5fR2Ktrf7N8zV0K9LkbM?=
 =?iso-8859-1?Q?6fwq+/j+dIjyheDYRkkkHOFOEzb3wrjPfoilaGgaJ9hgzU+gA2mei7YK+Q?=
 =?iso-8859-1?Q?JCAXEKaxSp4moJ4S20e39mxjdFTlzVU2HKbHn5jOMKP2ep6ejj39+S02YD?=
 =?iso-8859-1?Q?hDfSBxbFfdVof+qvHI98RFztkR90NbAwDvNDJa89v9ouSgjycsOjZ2iMx7?=
 =?iso-8859-1?Q?UbCWQppE/AKz35xpSdScJOfN77Da/hdLCVkBG9ermPh0wDGMGl6ztdlV2G?=
 =?iso-8859-1?Q?kBixRqZ3i5KXYU3XGhIiO14y2l6dy38xMOi89DdieBCnQIdZcfWFTV4gx9?=
 =?iso-8859-1?Q?4tIXaNTTy14lhwYqwjgRulSWTbDP2wxWF6gsgxaSuMnYNSnCUfVrRak+ta?=
 =?iso-8859-1?Q?RYp1jzXKOremXc6nsIqgN8b8v5XugYTm/PrUI6Ex8b7/bzbFBvsYoFRMbn?=
 =?iso-8859-1?Q?yQXuo0dE+cB7H987lbFDT59smfDkXUUepBg2h1fCvuqwXAbZYpEfH7rje2?=
 =?iso-8859-1?Q?ro80LDINcnAFnCMR0opXQ+IlNeWHvw0Ra66bKP8Riv+H22fqvfVWJHdtE4?=
 =?iso-8859-1?Q?eRpmfalJcaVJilZ3AH9gAZqnSqfW8UJ5INO1/wufTStmtISVL1afIopCBy?=
 =?iso-8859-1?Q?iMNdp3qLadak4tHOS2e/+3vKfVk3LzUVPaAsVnLfn+sEsbczqRaEGV0EvS?=
 =?iso-8859-1?Q?yEnnNLfOw44TmuTRBr+eyp4swanV60yME3YQtbdDmsnJqLLR8sOHMeVl/U?=
 =?iso-8859-1?Q?a0IyzviyzWkHF54Ril6Ti1UYXAHVyAB/eTZl2eZyeQu55PDZ1j/07dnH4U?=
 =?iso-8859-1?Q?W8o8xopetLQPqrgcKVED2/4wL8/pGMnZLrj5EDP6QBVGO3UNSr08rjwZu2?=
 =?iso-8859-1?Q?GE0e8SvGPODDMDp+aDNKMa4vpF2ITej9/A2NGxkoCjP2e4r/DIWGDOxw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8453b90-21b8-4dc6-965a-08dd0d7656e8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 17:26:47.5065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CSzY4oYz5epZOCJP4KKeFghMQ8Bpqcf2DRihFaifsZEKrq9TVI+snStZrMwsctEZNue2QsTStSg92nwybhQWxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6763
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

On Mon, Nov 25, 2024 at 05:19:54PM +0100, Christian König wrote:
> Am 25.11.24 um 16:29 schrieb Matthew Brost:
> > On Fri, Nov 15, 2024 at 10:27:59AM -0800, Matthew Brost wrote:
> > > [SNIP]
> > > We use this interface to read a BO marked with a dumpable flag during a
> > > GPU hang in our error capture code. This is an internal KMD feature, not
> > > directly exposed to user space. Would adding this helper be acceptable
> > > for this use case? I can add kernel indicating the current restrictions
> > > of the helper (do not directly expose to user space) too if that would
> > > help.
> > > 
> > Christian - ping on above.
> 
> Sorry, I will try to give those mailing list tasks a bit more time in before
> the xmas holidays.
> 
> That is an acceptable use case, but the problem is that this helper won't
> work for that.
> 
> See during a GPU hang you can't lock BOs, so how do you want to look into
> their content with the peek helper?
> 

Agree we cannot lock BO directly in GPU hang path (TDR). Our error
capture code takes a snapshot of some the GPU state which is small and
safe to capture in TDR and kicks a worker which opportunistically
captures the VM state which has been marked to be captured. This is
where the helper is called and it is safe to lock the BO.

Matt

> The only thing you could potentially do is to trylock the BO and then dump,
> but that would most likely be a bit unreliable.
> 
> Regards,
> Christian.
> 
> > > Matt
