Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E342CB4574
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 01:09:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5466510E1EC;
	Thu, 11 Dec 2025 00:09:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="le/hnyMi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A61410E1EC;
 Thu, 11 Dec 2025 00:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765411746; x=1796947746;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=5cp1SStiaPySu4BUP4v8qMEvDvOyAzOaxT8QcC8B8ek=;
 b=le/hnyMi9SgDFru900i/9Nvu/TQVfwjctE8IwSAKpr+UUfFIbK/Tk/O5
 SZR3i2Xs5WMM7pLD2Hmc0duLwekFIh7PWmxLbldzx6O3rJ33UQPBcrvCQ
 ZOFLRNS+7TEWIyElEPDd338Y8TxTxEVpkRv+iDKPao3MY3cAj7LSDoJ5Q
 hrgOLnjCdBIKeXkHs8FM1rCDyMZMaiCRzyHTFGf3ULqOIov3KpyXNL3b9
 I86o5P1ilGhKsKuwJUEwH7WwpwUU/okapQL9kgqRvvIDi0Zm2JBDPR5qC
 AS1K6/cz4vTbfXuBMY09jgsUy+ajiaoQyZ/0WJ0eJ0Qf/HtsaEo9IeFf4 w==;
X-CSE-ConnectionGUID: /8ja3czzQb249xSqFa1gkA==
X-CSE-MsgGUID: /GBMfuebRhyR/l3JuEd6kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92869040"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208";a="92869040"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 16:09:05 -0800
X-CSE-ConnectionGUID: PziFcxGZRb2PCQnsxLaAug==
X-CSE-MsgGUID: Y3FfAUxbSHO5p1XjDUrbIQ==
X-ExtLoop1: 1
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 16:09:05 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 16:09:04 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 16:09:04 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.70) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 16:09:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hb/Z3CR1Y8CS1iLc1xJmYLRcp8wpm95pldAKoHn3LgII+PVpmXrwcjHoxrouy2Pq5oECxhJ6I1asBCHVodiZuqnqIJcjJeu0SMmBQIR5Wc9MKNE/NqWWJ2E2dYDwdtSDoINd5R4zi5ZWdrHa+Q9FUsZO+O20w8Z+Ggd6PbzYqLP9DPtNzXsasBy9LSrIZqenuC1ZDxY94YLozqZ7vAfQ1k9v3tMEjM6sWavajTEFBmR8VgfOpeCxyRJfNGVJxD6I4zTOcEsjwl+fUl8P9nG44Xo4jj2Xtdj3/JHZmcdjgh3szr1Wu10uDtWqU/c4E6aH8WsctKtxB5vHv3VeN8kqig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibUfd3qhP+bS34g7R/yKJRvpSiKZCAQ7ljOr4yvppUg=;
 b=AZeMT1d7RzhS3UP/Iw6GeBXyqweTjnKpHCrBjsqjLH/ZNwB0vVU46wCcYGoM8uMxg7ybR6Wnm5yDQASN8Xl6tFI2k15gUxt+aZdY4pUvGK1oASB8s997XnnkHogeLc3+OfD5Vw14BPiaHKgM0+7v8tLgM3oJjRAP/4vneXnfHzNrrdG8EREc2NMlBPgBxYPiwV20OB5LTSVLgKt8Hw2YRe7BIiCsR9zL1iZdsLmhl53GdxokU4koERd3D5hvSvGVDbXkqGXcYkJjgyeJN2GvJEhOwmpr4rdFlyELdJucg7q6BPXIyROzY4ruBKhe81azbJcLswgT1NQD6D4cPS2Lxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MW4PR11MB7152.namprd11.prod.outlook.com (2603:10b6:303:222::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Thu, 11 Dec
 2025 00:08:56 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%4]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 00:08:55 +0000
Date: Wed, 10 Dec 2025 16:08:51 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
CC: Uma Shankar <uma.shankar@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <chaitanya.kumar.borah@intel.com>, <ville.syrjala@linux.intel.com>,
 <pekka.paalanen@collabora.com>, <contact@emersion.fr>,
 <harry.wentland@amd.com>, <mwen@igalia.com>, <jadahl@redhat.com>,
 <sebastian.wick@redhat.com>, <swati2.sharma@intel.com>, <alex.hung@amd.com>,
 <suraj.kandpal@intel.com>, Joshua Ashton <joshua@froggi.es>, Michel
 =?iso-8859-1?Q?D=E4nzer?= <mdaenzer@redhat.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, Victoria Brekenfeld <victoria@system76.com>, Sima
 <daniel@ffwll.ch>, Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [v8 00/15] Plane Color Pipeline support for Intel platforms
Message-ID: <20251211000851.GG4164497@mdroper-desk1.amr.corp.intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
 <328637065f79e8ef7e6ca0ab5a22b03887ad6b6b@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <328637065f79e8ef7e6ca0ab5a22b03887ad6b6b@intel.com>
X-ClientProxiedBy: SJ0PR03CA0182.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::7) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MW4PR11MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 1724a738-e102-4a0e-b617-08de38497910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V3uLYuj3U6pUKUewit1H0wjVbgONNGzZyL21LFroDZ3mRVHBJBuHEV5sbdKX?=
 =?us-ascii?Q?M8qugzuIRRvjxwkL0dNt8vh2oYZdmBhAzdkuGKrO3QgLo/D+1UPDwlOtYSKR?=
 =?us-ascii?Q?nqJ4AYL+KSDhYTSMLxnyZeFpH2v62ROpDH/ivu+hgtCRX7H9BWJyyNelR74F?=
 =?us-ascii?Q?tjcCHLGb39iJxEFk0iX1pAvo8oFxfVZ2Vqnipwk/avMQKcf8EFgNmUD/CRcC?=
 =?us-ascii?Q?iuXGxwlz3Y79qUI7gO82HGpRxm0p8lKyJVYoxxl8tTfb4hJBVeqzxG+wGmtB?=
 =?us-ascii?Q?GAM8FcccZMSavjx678d3WdHpHGw4fqe9WBp47zyl2Y2gFNQ+eF9AajavQMar?=
 =?us-ascii?Q?BxYWcdLkLNrrnVVdLiXYXZxKLfG8mUL5oOSbj5W9i0TQDr75cBzrEPO8qREL?=
 =?us-ascii?Q?c9CZRoFR+FfLVmOPqopphzf6udf8/g89Jyqd166sQPPqrl+M8geTV2vF8yq8?=
 =?us-ascii?Q?+qtEvlc4qWxu+Iwcy4INe2uieFM27Tp/UKNbwt0NjjBS24OSYX5ikNhv2anB?=
 =?us-ascii?Q?jge7TWn24rvfJbsYKKBtTMIsAdygV+01YYe4jEHaAdy2h+xD3yG4Rx/op8h9?=
 =?us-ascii?Q?x/RMrS/7oRwGP7RQH9OFy2j5rxfyoMMSArUxVs6kX9rGgV4ck/Lso+wiEP10?=
 =?us-ascii?Q?9nSwNgC86i0e/vxWIQ157s9+8d9BjsECQWryTRU54PX7fiMejp9/ux4drVjd?=
 =?us-ascii?Q?xizVHOkQlNXUUUxykCSdFAiOVNP0vfYEL3pA48/XLl3RIHblvt3G/AEouBhz?=
 =?us-ascii?Q?FG2jyIcJMTMR4xmnqXTTyh02vHEHo3dCIBihnkZRUQ5Tvm9GHOm+rmB9uXl6?=
 =?us-ascii?Q?gMelEB6bGA/xsN3krjVTazKm0y6WtlB85cCbDx06WTW7L4RjGZ74PTdw4qE/?=
 =?us-ascii?Q?YpVXfSm9wtLdSecaDWJ3+iR9K7MV3v6qpwj0ikVlDvGnv+flOav30QrNVF9f?=
 =?us-ascii?Q?VCZPYr5bGQztC24LNG6IkrgLSaRXBLaM5E+kaGlqjgBdQF2B2HIOq3lgEHLg?=
 =?us-ascii?Q?d7TskYqSbhc5Vl2dg7BMXUaWrUwSgse9ON+/bRfj8qkC8N5mq+ccop9ebeg0?=
 =?us-ascii?Q?5E/AID+jR0Aj0JaY2DgAaIBQNtokxHaVG3zIlwQhCkrhNKcsbOJhlGyJi0dR?=
 =?us-ascii?Q?+TnlRMYbP3TBg49yXu+mKJSMa7+Mu7/IfvqlzL2/6wor2it34k6ov2Lw/Pd+?=
 =?us-ascii?Q?uEEH5PqNN6RRo7B7iiK/6gOuHy5BIiH+bdqmwjXBys/Qw9+uVhxKaf00rrkU?=
 =?us-ascii?Q?zpBH4tBc4jt0boTPCVVxg+KIIauL0z7tswszQVBJP/g7XqJCcLdttN9GOt2z?=
 =?us-ascii?Q?pTH0kQkN0DIJ/MZsDCfne1EL1TUclxQ/tl/hoEHGs+hCS+OTnv9HDWt+hJxG?=
 =?us-ascii?Q?4sasd1NsjeG1ImzOLu0jg64ujiR5bkx06xT2isasOrczF475kw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5AQ7nnJK2gHGBD6eg6DbKDTRbNdhCNiSDNr8bPJBQ9U2a/wPd+LZZ0v7BoKm?=
 =?us-ascii?Q?8dzqKLDTSj9IQ/rdYrR88UzAQbBBXi73S/lMxQ+9jQ2yFHqdMfyPoDiep/u8?=
 =?us-ascii?Q?gbpNFobXOWwszK+x2hLsbUv9xQqiTPYPZE3IejmfBtcLx2QWQxpHQYpfm1xR?=
 =?us-ascii?Q?vuwlIfPVkrbdx02RrFBk13Pn7cdQRrBwyOVin9wXBv8g4bTsmgELnd95Vqnt?=
 =?us-ascii?Q?KtJEWqLhuA+3fvrAGewB5dsGakHpK6FCsHmtNhnXERDqzyGJsmSnfZ9x7K6J?=
 =?us-ascii?Q?AqrgVmjgal+/mUNzJto9X02+OpUIUpyNr4gaDdDa8oSWOufguFnt2c6HdA2p?=
 =?us-ascii?Q?d9cwD+gHQYfKL+ycTwDFn5JlZYd1sOpcAtxNkZQqTzBwafHYMIk4imG0d7Z/?=
 =?us-ascii?Q?/4S7oekre++Z5b1/CAYNC4Y4I7hZv9p0PEim14Y8ww5wrfpDa6ZmI+LUU9Q+?=
 =?us-ascii?Q?yUwYP9ER7fIPO0pbHF4/nA/hr8qFvg4eDSd1jCnU330VxwJ58eg2VprfPrWp?=
 =?us-ascii?Q?0Ccy7jT1WOw1L9ArvcjbCgHFQOIJaDO0Hjn7Ct1kLMoCr5OplhEY3hZVwwrG?=
 =?us-ascii?Q?dY6dJozRYopDGwZGd9hmMtiEV7Y7F0cZ/LolzalvbPrczOLMoLYW1bdcBmUz?=
 =?us-ascii?Q?/iLC1jegVCMyhYGwbLr9iSXfdtZEOR6D1AAVBiEqETtmy1KP1HdFOrdxQwTD?=
 =?us-ascii?Q?kvs8AUmrGqNaG27/XP8djnsf925z+3cUd5Luvl+l5QF7oPCrdznxswdNvAKN?=
 =?us-ascii?Q?ZmDkpj65+POnpnEjoye4V86UJqZzjUHa/F4HPDQxyD0VwOmJA71WXJW7yJ13?=
 =?us-ascii?Q?U56esQQH6A59Nf1Lght5fnuXIm7RyaPU739RiNQSSlsNVbrXJdaB5jD3429a?=
 =?us-ascii?Q?6hs/sPF1rJlvZJ55TbbzzABA0mvEZP/L982Jieoh/3i8YZFJ42/OEu0kY3iv?=
 =?us-ascii?Q?FfadguDkKovIa/d8LnxL5M8XJzqxbOKWMOqchQsXCKycq2brj101wCWqeO2Q?=
 =?us-ascii?Q?STcAdYXH8669GCzkD7J7rpu1Unr9wYwsmeEG5TKXLC42m7z11L5vXZiF2qi9?=
 =?us-ascii?Q?Ukz7h2oALa+lfpdY6DIoB9P1wGPdmrnQtdiEBwT/bwVUrq9hspqWV2K/HhES?=
 =?us-ascii?Q?R4a92XrOmvuIeJNDad2SURcHYTZcknNMmDddrtM+aGQcJx+A5kiK3XhG09ym?=
 =?us-ascii?Q?jdVq0Du9atP2nxewX+7YDvd4zUnvkmcY+ogLRbsJey+q9YGeAF2j9Bw/+7cU?=
 =?us-ascii?Q?1ZjdouHk7/IIqXYTp8Vi/EqJp5kLot79sYnfAEIODGx/iu/noPBgbhrDJnoE?=
 =?us-ascii?Q?EK7mzitLgH+g3wt/QV3RTSlaaJmJcEGuXgqKNd/lwx1S+YzXfvthPR7NhikI?=
 =?us-ascii?Q?V3PkytlWAT6nIDhqVbU/e8XulEm/MacMsEQAC6jMNm+vY+LhZz3KV1zmMIj/?=
 =?us-ascii?Q?fitSMFtjzv1caIpmulXPqsjho3XVKAAHMiC8TJAZFErcbXKg6ENOZj64MPZm?=
 =?us-ascii?Q?G6eh+dcmf71Lu98+hoRVJ5V5RpIkj5md/Zk6UPfQbsx4FKH8svCUE5mECO/l?=
 =?us-ascii?Q?hy8mkSvTcbvi0mOq4n4wJ78F4b8nfr3Tqw+QZdwrmziAAnQDtPOrXOUftGnw?=
 =?us-ascii?Q?+w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1724a738-e102-4a0e-b617-08de38497910
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 00:08:54.9955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jaf11qiEAFDiQK8Ioq//0CcuujXwJsA/lwLQ68hdWjL4toNZhy8Sr1nfp38EQ5JBDA+nJlC/4O6Q1pWd10jolpobMGSzVt0y3JwjOOSiSOI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7152
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

On Thu, Dec 04, 2025 at 08:44:57PM +0200, Jani Nikula wrote:
> On Wed, 03 Dec 2025, Uma Shankar <uma.shankar@intel.com> wrote:
> > This series intends to add support for Plane Color Management for
> > Intel platforms. This is based on the design which has been agreed
> > upon by the community. Series implementing the design for generic
> > DRM core has been sent out by Alex Hung and Harry Wentland and is
> > merged to upstream tree:
> > https://patchwork.freedesktop.org/series/152970/
> 
> Thanks for the patches, pushed to topic/drm-intel-plane-color-pipeline,
> and sent out the pull request [1].

Drive-by comment, but does this series have some memory leaks?  Maybe
I'm missing something, but I see various allocations that don't seem to
have corresponding free's anywhere.  E.g., the colorop from
intel_colorop_alloc() doesn't seem to be freed anywhere.  And
drm_colorop_pipeline_destroy() / drm_colorop_cleanup() don't seem to be
called from anywhere yet, so I think the state allocated by
drm_colorop_reset() might also be leaking in the intel_display code?

Maybe I'm just overlooking something obvious; I haven't reviewed the
series in depth.


Matt

> 
> BR,
> Jani.
> 
> 
> [1] https://lore.kernel.org/all/e7129c6afd6208719d2f5124da86e810505e7a7b@intel.com
> 
> 
> -- 
> Jani Nikula, Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
