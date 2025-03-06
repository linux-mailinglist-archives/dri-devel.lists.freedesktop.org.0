Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C30A54DE0
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 15:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8244410E9B3;
	Thu,  6 Mar 2025 14:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eB+zJFfE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3471910E9B3;
 Thu,  6 Mar 2025 14:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741271676; x=1772807676;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ik1oGWIaGgoSRDln8i6MpNAeE5nKORzAaivGgPnGOx4=;
 b=eB+zJFfEJbO9+bHLXOfZJABrgEt8UeGdt88rbP+Xb/ED4iRRHN4wb+fr
 c+UGTuF7GoJXv8/EV0j4kiHhHPQlQil/faTu4sqbyhUKn3673zfDFSoHk
 NcWChDBC2CJv7rGsEZ4Fea8DeAF5WJbpP4ANvIQ+fNMiV4nL77qFanMdR
 jxYX0JhzZeJgPRchaQHuNaRUtZLCW8O4dWS2jqik68jnpbOgYl81OSNc0
 ZCaOdOCZoWlRJubYFZ0aPD8HjT48l4Mzeim+8IAvs/mdR9YPQYRe8lbSU
 2dEr6u4A1wmsFzw0rVLMiQPZmHYkLpdPTH5OuOFpdCNBzGTP0YA1wFdBO g==;
X-CSE-ConnectionGUID: kGARmSqRSx299z3hapno0w==
X-CSE-MsgGUID: 98Gr/fo9TOqNBORnqLNg1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="42417063"
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="42417063"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2025 06:34:35 -0800
X-CSE-ConnectionGUID: C8JY4Is6TjmuMdp3PlmTnQ==
X-CSE-MsgGUID: 8jSW/IfYSFqEUIqHFmpzBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,226,1736841600"; d="scan'208";a="119539351"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2025 06:34:34 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 6 Mar 2025 06:34:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 6 Mar 2025 06:34:33 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 6 Mar 2025 06:34:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Th3Is/reFZuYLfIv1iBVN6lzyp2nIGYGGQr+fbNpHbBWhAoxNE8q4OaKgZc8hq6rjPpmnIRk7p8/uzfSzt/TkZaq8Nm3GEcM/rERRNaHck0kLOgV1lLw0I4dPG+o/KNwNSwPO4MNLs0ok2Nkx+kJcShzCmYHxfz0HpqNBBx07VayVutQK6tn4UssakN108eYAHvalVxQ/ICd24uvwgZhiOayrkapq4cDiC5rqMtFmsFz0txSdjRNu6aIAGMdoScghxBVsL83nvHiE6nkoUv0s7j7zv54DqCxNtOobwY2uiFW4fFQDLcy87X/gcI5ubg73vHwaVqobjfputpX/98LpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IrUuP/RChZEZ3ifCmRG5Do+qT+NWXGrYH0aIF+cnLeE=;
 b=IRsRJZyKJLQMhaRZBxwoNWkktiqB9I3tsEYa/RTA1EafUWO8geT3ni/au7VJMpBdNGmS/9lxeuNoHCn2o2Waa/Uo6VadSPF0hN3bF/pW4M0yV3ztJEjrBv4TXfzSLNIWL5FeTt84oH5Wmp5pUp5GRGiV64ooYuVknqXkRGx/XsFppr5hoDeUCEhKiZS9M5p8iGZpFPboZ5NDqRi+1A1lR+GtzhP6JG1HQPeY3U4KPg2PVYiFMZWUE93Dtxkd/JdRF47dPGHf+Xx75dMiEpdDtLbIOiwfAjQ3py5cGjcYgrnh0a7UaKz6uFza5JjeCCxuTLCqdA7SxjqEhCdysOJXEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7521.namprd11.prod.outlook.com (2603:10b6:510:283::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.17; Thu, 6 Mar
 2025 14:34:29 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%3]) with mapi id 15.20.8511.017; Thu, 6 Mar 2025
 14:34:29 +0000
Date: Thu, 6 Mar 2025 08:34:23 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <mailhol.vincent@wanadoo.fr>
CC: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Andrew Morton
 <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Andi
 Shyti" <andi.shyti@linux.intel.com>, David Laight <David.Laight@aculab.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 1/7] bits: split the definition of the asm and non-asm
 GENMASK()
Message-ID: <fao7tp2y66f7nuep4nl6kz5zenfpzswp3hwqiw325uitgu6u6u@7dipwr3vjui7>
References: <20250306-fixed-type-genmasks-v5-0-b443e9dcba63@wanadoo.fr>
 <20250306-fixed-type-genmasks-v5-1-b443e9dcba63@wanadoo.fr>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250306-fixed-type-genmasks-v5-1-b443e9dcba63@wanadoo.fr>
X-ClientProxiedBy: MW4PR04CA0164.namprd04.prod.outlook.com
 (2603:10b6:303:85::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7521:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed14512-4479-48db-b3ad-08dd5cbc007f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sN7VLzr1ntZgb6uxJEZs7QBqSSGGfWA69J8IKrgMb8iRGepOTfYOJIvQ98+5?=
 =?us-ascii?Q?AWJsmZEHWMkW11JDSpKiJrmBIIE2hrDq6yaDIPy2Gue5VG6JKaLrPtadJW5e?=
 =?us-ascii?Q?G355cuwWX3/+1wkv+DN8y3ZLDdokkzFA7y5ypYQV3mhYFBVEKjU0LMvkvFsH?=
 =?us-ascii?Q?7Gpc5hQhY2bNtkzjaOKly8LWpPaqDx9qkoYyMZjQNHm/0YKLFV7akqmN6AIQ?=
 =?us-ascii?Q?Son3oJeWLmK5SB/zdI0rhiAP7hfsFE80BT6dT+R8Elj7bl1AFzuLe1zsGVl+?=
 =?us-ascii?Q?8TIOU/YHUd6e6JMO+FiIyUHkmGPTQ+hxEhq7btaXZW6PEcGLTDpM0IqNM2Cg?=
 =?us-ascii?Q?qzIl5NDR4aBM/y1uSb5bHrSh4dUQ7SkfJAj7AbaKv7nS6WeVis0Qm3typFu5?=
 =?us-ascii?Q?PnWK0eiuk7xInMH264Acz1JRruP4infe+hyAWDdkvVKTsGiOunM3RZYwM1qa?=
 =?us-ascii?Q?qfh56nukVUMVwuuA5nsbpRdGzwt4baDSUjIpS/DfRTttEvTyqUShOThPZR2f?=
 =?us-ascii?Q?xDXYz5fRPUgMOZwkvgx7vJAhc/Nv8S27GuANOdyXt0lEsMmW6ca/Ey/r9vqK?=
 =?us-ascii?Q?Yu6JkEKIIhph830qcniGaUldPWes/roHLXMEKjP4NMwFPcpk494qoYWTT8WI?=
 =?us-ascii?Q?ZQ+70vllne8MvLr5cA0ddjScoJVcg9KQ6uWwZszeyOidinZr3tYfE93i/Kne?=
 =?us-ascii?Q?9MPjfcIEkuClAsLGWlyRfhsQYKL8/FuSCXaT7mzL/FDRR7b7IiZkt6Sf0OuS?=
 =?us-ascii?Q?n6vcV7rF0dLt5dHNWvWJB/kQZGe/IBy2IDQ9mx8WIvZ4pl7LTeMsyQTtXdqH?=
 =?us-ascii?Q?8XCOPF9WnlAijdulxutVuqDC6YttXnvNe6HzZzfkYfvDQlS2uhV8Q7K9y/Uq?=
 =?us-ascii?Q?DfDagBrPrxTd4tl1azQlHKGmEmAXBD+r6ZfCOyESkxaCzatewDAh/1KJXyTw?=
 =?us-ascii?Q?qptJtLN1a6/MgL/EYRM0u5+zPQwko/ldjBSOhEANPR9q1ViFcoyUiqb11sAP?=
 =?us-ascii?Q?k/qE4JSV/02OMuGttte5DfXq7lIIUVFZdWwmNnkxdhJeTDuGU/LZvIV1h0Cj?=
 =?us-ascii?Q?KsYSZHI+wL3reilMXSPj/CDI3amkbeRiSSHAx8xUf7Bo3oW2eUJqsQ48Kik/?=
 =?us-ascii?Q?8NBjm8gjIMbFtbegrs3Nk7u2Hj7MzkVaALhtsZPJWVyNe0XumN3NUaYRl+o4?=
 =?us-ascii?Q?TejE9jJfzIze4/qMIiK0b+3xP73RNDkpsKGy/IatT7jYcnsC4DV+PcRZul2o?=
 =?us-ascii?Q?ldwt2WzqQU/+O7uncYR7LKsEF49K0RfJYLsL0kgkOd8asLwa0hxCnu79Wv8B?=
 =?us-ascii?Q?I6X8giAgv9iPrTpRYc/RjB+FBlOXTQOG6uPo9oLILDg/WAP+d0d0vyx8uCOn?=
 =?us-ascii?Q?M/bD0CxWf5xxmaw6dDpDKEi6kGMY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zck3WZW1bafjAAHyNvB/zX0JY/wYD/xka6+WeAolSxethWpxjaxT3tVDcM8q?=
 =?us-ascii?Q?Gj/CUtoTrgWB1bjCKQwnDfjt1FKv9OmEYOcZX6cleEwTLrMiqV1ko/aAAkRz?=
 =?us-ascii?Q?dByM7kJvOQ1kh+o9Ij9xpMhvFYtACVaB5gNVKeqBPTT/R3WqzrXKlRVZVDZ+?=
 =?us-ascii?Q?cQevjr4ro4Lorh43YpauxCAxXn2G/TXXc9FcRaSdJHinSNgmNXYMAzpBXRtC?=
 =?us-ascii?Q?q+r5d4/Y6HM0LSGV40T6csxLuECH6vWQLFfuce3pfXmTnoKhfLI+bhCMgVHn?=
 =?us-ascii?Q?x815iKvUgwIX0gtrbHJK0xFi1F6sUsbxUbqCUUBKb+OoBlw7NVcz+EvxcdN4?=
 =?us-ascii?Q?OqiSC2/VKtdM9R1EK4+AnQEV9bZAM8z5EynTYMdaQxFO+BxBz+6R4RsuaTVa?=
 =?us-ascii?Q?gSKh8sBSAC/1Dx8DSuMeJrHKkZLl5GECketmwDi4dLiUl8sO3zYzuIY2RiW2?=
 =?us-ascii?Q?T7nal8eoRCXVir1/TRhBsWVSWoHqAi+sQQKF88R5kTvcz0tEUCxSkT3ZE+gr?=
 =?us-ascii?Q?8W63GR+eaRm5f4OIalLJAy/SVALAytU4ETKxPodRChxb5xP7C+oJZd2d0iNz?=
 =?us-ascii?Q?dihpx0Iy9QUCUQou1K7Ke3sIbSiYo2P4JYY1MEfFZlzXOCAv4dyOZ0B0PPgo?=
 =?us-ascii?Q?llGuyuxttIUiyZ91kH33iaP6JNQ5r3QzOO2IVk5nsOoKf/d+koYotvjDAh/z?=
 =?us-ascii?Q?IzaP2a2xFE9XoYUbwaycIfUSPHa4j7UMQ8OGCBaLkKgGlUqfD4KhieJ7MEDL?=
 =?us-ascii?Q?pOM+9nU11BSX61NEUbg3nupOoqBpN1RtBa0ZhNAGvsfDwBP4e3sr/zn2kAer?=
 =?us-ascii?Q?dCZsKffAmPN+pp1W7yTE7qbadPboAesO9vF1smSFj63GNEtXl/yx+MTKP0Py?=
 =?us-ascii?Q?MmfHtSC37Tro14/C2ZNGpd3KPDn0ENd/iSj5QE80snFNeDa0cpXR/CJZtVzK?=
 =?us-ascii?Q?SkIMKoxU83yLkrq6z7Ectk5T/qYUyHoV/fkL0Wu1tdQ8fak3u2nR1zC7QLFU?=
 =?us-ascii?Q?bC/Ec3xNbgwYkGOToKsaOD58GxQMLoDtLztLplfR15A39EtQDzBRglrT5QVu?=
 =?us-ascii?Q?YBRq0RCB+KDviRJlybxNDt0hJ8moVZb7jWDNZUQZ/RG+s6g+8EYUb3ejukyP?=
 =?us-ascii?Q?2i+u4Nk/GhqRnp7nYEbgNLJa5ycy9bvjHrlEUjH0kk8YqqvNcXxG9VPp/9Eu?=
 =?us-ascii?Q?52blKXxGwoSZu7qHPRu90TYEvvwcTagMvKgyIJeYsInqhtSKgrhuyy0AvZxx?=
 =?us-ascii?Q?K0PDbo5r+3sSIAeOi71G5EvtuTa3NC6DFeM/MfmksAxLaddYJ6unMxzi5PK+?=
 =?us-ascii?Q?NPoPElGGOUJAeQCDOwpsGHyOCdJ9HLSfTx6KiSOqaJw0LVPyDKKpVnzuiPod?=
 =?us-ascii?Q?To02jcPakHBSWbNuw/tQVN8CiryTIsOIixVz/P4ECVVfnbMuffNc+CBSsrIJ?=
 =?us-ascii?Q?LSrtXocvIbtNp3BeR847FBmLX0MNSJHhh2NLJzYQLugr+bKJPtEUw1wVJKDv?=
 =?us-ascii?Q?HqDBX6fTTC08Q0GV819qTp/CfHFeJooVdBJMglMFSEc3Wj2xVdd0FV5IyhUV?=
 =?us-ascii?Q?iikbYdFOYPNzMDvW7yRme4F7GVMI2+719Ux54JeSqRF7OC4/vMWPcPoSqNsU?=
 =?us-ascii?Q?Uw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed14512-4479-48db-b3ad-08dd5cbc007f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 14:34:29.0343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PYMhRuQhnI6UL4gMk+69tsOYyCD+W0sJOxj0AJ4ATbUT6Y1kg8x3aM8yhrZ5u6qQ7C1TGtSo53Sw+V86xcmZC50S/7t5Llxgfoa9i5RFy8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7521
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

On Thu, Mar 06, 2025 at 08:29:52PM +0900, Vincent Mailhol via B4 Relay wrote:
>From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>
>In an upcoming change, GENMASK() and its friends will indirectly
>depend on sizeof() which is not available in asm.
>
>Instead of adding further complexity to __GENMASK() to make it work
>for both asm and non asm, just split the definition of the two
>variants.
>
>Signed-off-by: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
>---
>Changelog:
>
>  v4 -> v5:
>
>    - Use tab indentations instead of single space to separate the
>      macro name from its body.
>
>  v3 -> v4:
>
>    - New patch in the series
>---
> include/linux/bits.h | 18 +++++++++---------
> 1 file changed, 9 insertions(+), 9 deletions(-)
>
>diff --git a/include/linux/bits.h b/include/linux/bits.h
>index 14fd0ca9a6cd17339dd2f69e449558312a8a001b..4819cbe7bd48fbae796fc6005c9f92b1c93a034c 100644
>--- a/include/linux/bits.h
>+++ b/include/linux/bits.h
>@@ -19,23 +19,17 @@
>  * GENMASK_ULL(39, 21) gives us the 64bit vector 0x000000ffffe00000.
>  */
> #if !defined(__ASSEMBLY__)
>+
> #include <linux/build_bug.h>
> #include <linux/compiler.h>
>+
> #define GENMASK_INPUT_CHECK(h, l) BUILD_BUG_ON_ZERO(const_true((l) > (h)))
>-#else
>-/*
>- * BUILD_BUG_ON_ZERO is not available in h files included from asm files,
>- * disable the input check if that is the case.
>- */

it seems we now have 1 inconsistency that we comment why
GENMASK_U128() is not available in asm, but we don't comment why
GENMASK_INPUT_CHECK() is not available there. Maybe move this comment on
top of GENMASK_INPUT_CHECK().

Anyway,

	Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks for picking up this series.

Lucas De Marchi

>-#define GENMASK_INPUT_CHECK(h, l) 0
>-#endif
>
> #define GENMASK(h, l) \
> 	(GENMASK_INPUT_CHECK(h, l) + __GENMASK(h, l))
> #define GENMASK_ULL(h, l) \
> 	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
>
>-#if !defined(__ASSEMBLY__)
> /*
>  * Missing asm support
>  *
>@@ -48,6 +42,12 @@
>  */
> #define GENMASK_U128(h, l) \
> 	(GENMASK_INPUT_CHECK(h, l) + __GENMASK_U128(h, l))
>-#endif
>+
>+#else /* defined(__ASSEMBLY__) */
>+
>+#define GENMASK(h, l)		__GENMASK(h, l)
>+#define GENMASK_ULL(h, l)	__GENMASK_ULL(h, l)
>+
>+#endif /* !defined(__ASSEMBLY__) */
>
> #endif	/* __LINUX_BITS_H */
>
>-- 
>2.45.3
>
>
