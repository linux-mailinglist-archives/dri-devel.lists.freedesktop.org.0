Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B339EBF35
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 00:19:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D455C10E9FC;
	Tue, 10 Dec 2024 23:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GZDhy6Ys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D734910E9F9;
 Tue, 10 Dec 2024 23:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733872753; x=1765408753;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=12oiIH3pJag+214K/F68nAZ2p8EALFleNUfprPKW9Pw=;
 b=GZDhy6Ysppm4B3n3RRB8gUlOgAXzFsClLjVOSpnh/oAZzaYXNp1gc/z6
 jyqO+Z9/xEwbU7dIHHIC54AeS0bRcVPZ8Xc113mo/eQAlUpFMLCuojp7q
 QL2fxCc7K5MwSGTqolrXCGPfQXr3MLPksgLM4xXX65m1kG0F2qM7HFOvK
 XTW/fT4Fjc7vKUNgrjdyNKVsU0gXwBcuA06lwgjyqW3kEUrWaWrQPQB9C
 HbOAOVo7cLrdduyTUIkDRbGChmjzdFl/bdGcWfq7OfGk1/o0y5lAQlspD
 Mtj+YOIZ4ygpQ8aBLmoWpES9ebliv3nO+yOhwbQSNCoyG/by1sQiLwdcN Q==;
X-CSE-ConnectionGUID: /ysDpb5nRySROocU+pPHdw==
X-CSE-MsgGUID: 7IMvB3d7Q/u/9rg6KqD5HQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="59632762"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="59632762"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 15:19:13 -0800
X-CSE-ConnectionGUID: EYyyOrJXTR6rv8mNK+InwA==
X-CSE-MsgGUID: CZzV12eoR6aXdlQg92N75A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="95432313"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 15:19:13 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 15:19:12 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 15:19:12 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 15:19:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DTdRssWt1WCFjEBYC//Ba4UFZoUZ0JHra7HedPlI3xUsO3DrJ1KwWRiLesDuD2bZ+48mAQJQWV85nnmARSlS8F+4KwDepMTzESFRoS6bLCe/q2/ozmHSK2ut1/ezYOWmxjfQxgxA/tvYEXAUb5CbcXZJiVHhi9514dAWhp1QTD6mHZCymDUncSLsepmMM8jyQJ2bkIcHukf2Coqu2y4TvvXb0ntt1EyYwB7/9vObCTpMw25lYHI9JWaJTCdtRS/Li6EK3TQ4hP25Z9N0Vq7B0Sw7dO70X/7EuKuQtBlOVcwGQBQMZyTja+votvOVKuX2LCPiDds/n6tv+g6NxDq3OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKZNmUhmZwRxsjWWoSt9vi12ly9LSEVoT2dBe0Y4QkE=;
 b=o7CLSadGb+wrGPwLwachAzn7UzHmHxXJSzw/oRaJg0kh7GDZDUUjapZZ6ZiX64uIpZZkagmCPBdVHC1+jBw2+aT0liaabBqys0UNDwAnZ9ExJm08QLjcQ4q9W5mOZtZo8GyFbUwvXqJ6VdSQ/9Z6tN/KWNXwVr7Lw7cxLnO59tqf5qc2IvQeFSG1D0nx0lE/iVuBixOqECB4mj/9g9yAh1P/rE5Y2SML8jCUBGQXcdFkmUjxxZslUQjktfftJoM8F+4xQ1OzofL+Hy9/ZowEMBa4janiwMFhaKunFM0M7VSG24dUDr05DtDXYlvLUndivpS3xpypxttBg6/fPXSAtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by BN9PR11MB5259.namprd11.prod.outlook.com (2603:10b6:408:134::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.20; Tue, 10 Dec
 2024 23:19:05 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Tue, 10 Dec 2024
 23:19:05 +0000
Date: Tue, 10 Dec 2024 18:19:00 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ed Maste <emaste@freebsd.org>, Chris Wilson <chris@chris-wilson.co.uk>,
 <chris.p.wilson@intel.com>, Greg KH <gregkh@linuxfoundation.org>
CC: <intel-gfx@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/i915: Update license on selftest lists to MIT
Message-ID: <Z1jMZNgMssHyAzg2@intel.com>
References: <20241208151727.71695-1-emaste@FreeBSD.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241208151727.71695-1-emaste@FreeBSD.org>
X-ClientProxiedBy: MW4P221CA0023.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|BN9PR11MB5259:EE_
X-MS-Office365-Filtering-Correlation-Id: f71a6dbe-2ba6-4b51-6412-08dd19710a49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mTNt4qq6xlrJL6KU8iuXP1BIckddn61bwsQkvtX+ceFJ39LYkFdNsym+RX6U?=
 =?us-ascii?Q?DCYRC6piE3KpAU5j8WcVCcAGibhh23CUX1sKU76lx7DXDicVktmrJCosNjXI?=
 =?us-ascii?Q?vbhF6UKTS6JgBrvU58fROBlV3ctsL0gpZ6+443QJbKXWnkTz0yClbi9CsogV?=
 =?us-ascii?Q?vd2RkgdUOaL3OOBou9GqC2/r5+JP/t77BBIVDBXD0Ap3BF6Q3s/7HZ9m/Vmh?=
 =?us-ascii?Q?I7T0eavFtzos++F2L2LqnJD6NPM6+BFBzXDw2RZFlg6Si3yuwuWZaxBQ9nio?=
 =?us-ascii?Q?bwZz3eY5rQ85UXROmVHdh0XWIykIZVBavibAJjVDEUOOceFyUqTtAkOrlJIK?=
 =?us-ascii?Q?bedHM+7n9RCsxFLGCYr7gNxFV70+YVWWIxQiA5nunGQ5IhWtlOhQH9/eCADv?=
 =?us-ascii?Q?2sdIMucsMX1KCUsdF/hpq9Mkt//fLKs4pCiqgmfQpI5kLwOfXDQVlLd5W9O2?=
 =?us-ascii?Q?ZpLoMUIuh52h9hRxv9L72n6oVcKeyIbcLEXFLcJv6t+qxG/lyVdtcSBc7o+4?=
 =?us-ascii?Q?ZkU/D1Hre7uQHGSfQZ1KOXZPXJyovKQAM/BmLDqKCSOg0bLRW9nh9UEegUfq?=
 =?us-ascii?Q?ho8EITijF3D3Q7/6MREIyg69wCZqJ/CAywH79K5W4JEVFbTLN6m8UqD4M0pU?=
 =?us-ascii?Q?sWCODL74CaWfZEK6T1B7POyvbjj67HWbmKurWJ7LW0YpbwkXRCcErp9LE+Ri?=
 =?us-ascii?Q?xtC76hFOiFLVhasVRaEiUBCo62f3H+BFQIuNnvKn8OLKoFnGCgxU/TZzA443?=
 =?us-ascii?Q?mZTQaS3VNUHNg9DjTP7cDMnp1Y1LMrn6SGAt1vHUuUlCriDiQflmAjTrNPvb?=
 =?us-ascii?Q?gKNkDsM201pIcT01Som1bthJZqKCp5RUEHDA5Ka3U3LGJ/GmbZ0tHqhSupvS?=
 =?us-ascii?Q?f8Ka1YzaFdGIfi0xouN+iEZsrcgzHPnlQBkIsW2EazS6HdaEEbY9B/DH3QU6?=
 =?us-ascii?Q?62+NrvTt6wo2MJDVuqT/bF6in4IghYAiKrB87e57YFpLAZwBRuQ0MKaXObGE?=
 =?us-ascii?Q?U2Elvwp+/dhsyaFUwfGY2XvATHnlHpLsBvapSNx8BWIBUAyONMJo8Nmz4ad/?=
 =?us-ascii?Q?VygVoy5IwBttpoMLXREvvgzbT5trMOg5RepWVbFUsjHhqXpZF9cHUfB67ZMS?=
 =?us-ascii?Q?7d4/ACLDFK/5JN159oXjKhvAnRcw3elSQzKQwZOJ3ZF2GOnwa/hYoFh5f72B?=
 =?us-ascii?Q?ct8Lwh8Vvj1HAVt2yu0C/QpiGCDtWyePjas2FYhhKxGbu6RNUiMtoSbv4MOC?=
 =?us-ascii?Q?4nrug50qBSgK2uBRdfhF3n1OhcXqzpsJhx+xHiRqxXVL3h/4LzDh0GjNdbm6?=
 =?us-ascii?Q?wGqUzuSoGuk9BfUpnQl5WfWj8F4+JLqAOAdw6GaBqBJP8g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/lbpmtzERNnbdMo7k9EouzLYqBeax2lJCToMNBtBuNkJq55vznGAirg7v+kF?=
 =?us-ascii?Q?6vMn7q5tqJM+2AXTdCSALVB9p1a7gtage3RII3Ow+cf+cPnUOIoqq+mLEx0a?=
 =?us-ascii?Q?AOYaHLxj/utZv/Et+/yITbJMsgu1gobGo50jfxOG0glriHD3cOQIzjdidCxl?=
 =?us-ascii?Q?z0BYrXtfbXXYchyAlnc1mMryDojYtl5fg3cQa/Ai1+YZ8wn4pATrLdec54Pv?=
 =?us-ascii?Q?BX3Ou6agzlXfNZTB4OostYdEUzIBqao5ZCoOxfgCENyFkdW1YO7ohO0e+DQM?=
 =?us-ascii?Q?0h0K0Urd3WMAgTZAUOaB17Rsy+dHOZzshbZhJPOUyfeqlgmBdBAxofNkc885?=
 =?us-ascii?Q?jorQKWY9lM9/5sajQAOFeJnp8VnwhzH6EaZGWMxLAFge/UKT5/tCQHLV2Hw5?=
 =?us-ascii?Q?3pZQCI49lkyF0IUlfVdwsufGDGQQjX3JoUxzzVL0jrghsw6+YOj/1sxuDCtc?=
 =?us-ascii?Q?IqAGyzzHPPGBHCw7ItPCXEBePIgHHVdtNdaJKNu495pTBEEdK+ZnzlAlAgJ+?=
 =?us-ascii?Q?zBqN3clE7BrCAzo0K0aiCFvb7cF0/VRV+ea6GnRVlFbcskbFCOHYKqn3GNrp?=
 =?us-ascii?Q?6yj6FUpHFynJOqCeRRIdQpMwSNkoMKb14UEqcihcsCc347bmHcwS6nfjS4LL?=
 =?us-ascii?Q?Xe8Dk7J83eXHPQF3LFcLQL5lEe6PcrA2igWSa0UTbbPrS1+SHLPK1wJD9iNc?=
 =?us-ascii?Q?OP/t9FXS94FN3/aUZ6kQs97hi8aFVPa9gQw1e7QXZ+KysyPdwbma6BV+jZdo?=
 =?us-ascii?Q?e05qChDh+CpSCSiYaWvC60FauxrZJaoLeDJ2k6oXZGOt9L+vHmq+5ib9WEXN?=
 =?us-ascii?Q?3IkQ4UuuybJcjYOv4YtPXYl8I7PPV4TyyifY4uwhw9WQ27oFyHPaN6hqGjyv?=
 =?us-ascii?Q?F57bL7Dx79FzH/M8crSd+e9DEvrDtXxe4HGZyEdjgMtZ2aA7Lfy6sXdaupvP?=
 =?us-ascii?Q?65f8iJaqaOmF1BgwibxPJ5lxj2nhQkwyXWJMzQw6Yir1o3OuncWYbvYbXLEv?=
 =?us-ascii?Q?V+u/GoIJK7BuzWA55GWRPiRw+nUP9LegKoL56jOTp8fsVGp187sSEIJ9nb/u?=
 =?us-ascii?Q?C6LnkNrP7+XXN/fqYeWUXUmn65yje/aIIfT4n767Bmd2PGt3LY61TBGE0Mb8?=
 =?us-ascii?Q?NSBgEAanJpQyAVk7C45HWGAA3b4vrMrVbgyrqtFiPEmzwuC4Ka6MiSJoIVlC?=
 =?us-ascii?Q?w8NJuNepUBP/iIa4MV+jNcp/DKZtyt1e9f/S3T1LraYObOfVP+1dt0+eNpS5?=
 =?us-ascii?Q?/4GlXHyu5N8sMHhAGtnfRLrOALG/eFWQBlR9cDJb4YOZgC7UDbkUPD+JWyxe?=
 =?us-ascii?Q?QhmMPZJNKqBkWn4VVBGAh9Uvfhq/8w6MYvjaWkBd3UwVXOjXh5Krr+HqAQO1?=
 =?us-ascii?Q?kYGObkVgGld9owu73+jJP1e8MM1wPvXk/QdjdFAeGaWoUzZc+6bVSnPWTy65?=
 =?us-ascii?Q?Lv6oXVImFqfzKukVsAxrLtGOd37HCmspodT6MMyROSTtEm2yDDJswwNsT9Fn?=
 =?us-ascii?Q?q9nNiBw1sPnKgwKS9naVgQ4Xb7a/XtZ8uhDMpOsofsiOMYVK0sma4tvXzYEi?=
 =?us-ascii?Q?cgh1qYn5n0P8Q6kNhALRCiJ6EipuAKF/FXv3dAIe/lqunU3dEv0Gakm0WwUk?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f71a6dbe-2ba6-4b51-6412-08dd19710a49
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 23:19:05.4536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTSvmLapVrCmbW+8Wp4VVgVGXr5p9BSNMyPnOUAF0KGGnnllkj/ttKGbhPJmDDpRW9Cw9EgwUKp35RB3Xlcw3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5259
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

On Sun, Dec 08, 2024 at 03:17:27PM +0000, Ed Maste wrote:
> These two files (i915_live_selftests.h, i915_mock_selftests.h) were
> introduced in commit 953c7f82eb89 ("drm/i915: Provide a hook for
> selftests") and are effectively just a list of selftests.
> 
> The selftest implementation itself is largely in i915_selftest.c, and
> uses a MIT license.  Graphics drivers are shared with other operating
> systems and have long used a permissive license (or dual license) to
> facilitate this.
> 
> The two selftest list files carried no license when introduced in
> 953c7f82eb89, presumably as they were considered trivial.  Notably the
> general selftest header i915_selftest.h (which does have non-trivial
> content) also has an MIT license.
> 
> The GPL-2.0 SPDX tag in these two files came from b24413180f56, where
> Greg Kroah-Hartman added the tag to all files that had no license.  This
> makes sense in general, but it is clear from the context of the original
> selftest commit here that these files are a trivial part of an otherwise
> MIT-licensed patch to a MIT-licensed component, and should have an MIT
> license.
> 

Cc: Chris Wilson <chris@chris-wilson.co.uk>

Chris, do you confirm your intention of MIT and not GPL for these files?

Cc: Greg KH <gregkh@linuxfoundation.org>

Greg, is this acceptable?

> Signed-off-by: Ed Maste <emaste@FreeBSD.org>
> ---
>  drivers/gpu/drm/i915/selftests/i915_live_selftests.h | 2 +-
>  drivers/gpu/drm/i915/selftests/i915_mock_selftests.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> index 5aee6c9a8295..264b951c4f77 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> +++ b/drivers/gpu/drm/i915/selftests/i915_live_selftests.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: MIT */
>  
>  #ifndef selftest
>  #define selftest(x, y)
> diff --git a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
> index 0c22e0fc9059..18935e311748 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
> +++ b/drivers/gpu/drm/i915/selftests/i915_mock_selftests.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> +/* SPDX-License-Identifier: MIT */
>  
>  #ifndef selftest
>  #define selftest(x, y)
> -- 
> 2.46.2
> 
