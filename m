Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F084B556EC1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 01:00:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B155D1134B7;
	Wed, 22 Jun 2022 23:00:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C715112CB4;
 Wed, 22 Jun 2022 23:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655938854; x=1687474854;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NvCFtLd91q2MBWVFF1UFkJkbVut6UzDeLh0f89EyJnw=;
 b=h6893sICznjBiqkmxi10C+D7M2MCrT7KYLUhsYxgC/sqWhP24OOKCIh0
 udOF6ewyXexF8KzpMNscMeidvsOGFXE9D0rm/Ml1hpU0JbVYpxt4qoFa2
 LmRj1Lt3RlLpAlfurXOoR7gMqtWbLNHn59A80931+1RgvaSAr/ol5d5ki
 yKhe2g7swWrKv13/IwQrooQfCHQCManWZ3HUANyT0rVJjYTEDSrczuuai
 FUb4wu5Xhcfm8JpaxG8D5AcdQQchQk8zmh151smMsoshhv7R7/T4TnRv3
 nzIE+s0UFEGuAEqZd8mjAPpZtjZV/qqCiLu+A0eQMUqphpoK0HNwvjJoC Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="280615289"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="280615289"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 16:00:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="690740100"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2022 16:00:54 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 22 Jun 2022 16:00:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 22 Jun 2022 16:00:53 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 22 Jun 2022 16:00:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RT3crv57KfOzr1aOwcTiR3kdnkDUUhcUdOnbXKpaNpjv6t+0fs4poD2Ft4Ub48wxuk5rFA0GqcuD2vHgJ9ucbgDW3ExLJL6i0eIAeBjSKqfngSkcQHASnMTvZyrt4zOanSb/6LaBVJ7NAGv5i7l/ZjwYSnuGfqumIIU5TDlG4qRN8TP5gh9S7C0YSil3OgFhB0aZUrhb18uEEk3qTz80m9Yf9ch7wz88DswTMgUBVGiodlzH2JqMkRl2Y8shiQv5SUNe58SMfHUfXjnihOha8q7RO1Wd5RP2wbLLkz81cB5HYlUaPjKlKXeGk9Zp+W/55vI7BoP5SliDnAqcyFGb/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NvCFtLd91q2MBWVFF1UFkJkbVut6UzDeLh0f89EyJnw=;
 b=cIcZ4bik9DtvPzFtaD+TLOTcrlXmo/lDqs/KoUkFTARskffCaIiwrkbidDsFNbWj2AdQrvSwl9yQnH13O+EE4dernpE7HPDySrCupD6Ucb3lDTwTWEFLljoVouVNaA9ECt0CLZCw3WGHm5olEDNcPLJ7ueU8fc+ZAeVWA2ttfmQcSj8eVzu6LLQdI0V3Kh/vZUS4NlCULQBKwOAmuFmOF/zfKPVj0xdZ6OLZrCp8heMXRMB2pJDVW2xzvviJoW9lMHDpYnVPc48IvU836PQJpeK6rup7Gsyje8wJsKiRzIPRg6YiYvm2WZS0Xn0QrIoGvjFwY0ba/MaTAOX2EvOlxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BYAPR11MB3654.namprd11.prod.outlook.com (2603:10b6:a03:b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.16; Wed, 22 Jun
 2022 23:00:46 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fc50:22fd:6bdb:5769]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::fc50:22fd:6bdb:5769%6]) with mapi id 15.20.5353.015; Wed, 22 Jun 2022
 23:00:46 +0000
Date: Wed, 22 Jun 2022 16:00:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/2] agp/intel: Rename intel-gtt symbols
Message-ID: <20220622230044.qqxoduh5gxtzzi3v@ldmartin-desk2>
X-Patchwork-Hint: comment
References: <20220617230559.2109427-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220617230559.2109427-1-lucas.demarchi@intel.com>
X-ClientProxiedBy: MWHPR04CA0061.namprd04.prod.outlook.com
 (2603:10b6:300:6c::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46b83140-37d2-46ba-27d3-08da54a30af5
X-MS-TrafficTypeDiagnostic: BYAPR11MB3654:EE_
X-Microsoft-Antispam-PRVS: <BYAPR11MB36541E77BEC1E440AF78F7D094B29@BYAPR11MB3654.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X2BVMSXm7HBbvMNcrnEkCGpFQT3YHbP/vTDoZM9PAaAFaov899BoBam4b0euWe1B1XdKw1LXP1X9XTsl16hY08bUM+LhuUbbGDd4yYpwywtxTfAvhUVI0/AmzzrpIGZukQXdw32FT8DU6+jY+m/YeOhDFf7CD2nwXn6UQCSpgJthRFGloQeeFPLPRS7eX6FCuGlYGrczv9iPa7qikLrmEWUjjYQBTaKKmTw7jdpjJDV5m1kmwi97wg98PnMwdibo26QwtxkEx94f4emInJIiuXmY+b66pORBLcBAfw2al/MqqJq7osI0OCc47Z2IieuWVbwu+v4e3nqyoJikqKGkcbki85N9g6ca/AHrsL1tjs0ZTq7Q9RyJHIULBiCDDkaMy8naU3sBvjOIfCXfk0HC7IDE7Zr3cDYnLK+2rishUrxNGaebGQRVXuGY3vdTXQlWN3zi69xOoJOlp/3tyx+ztfXPPkJLSWJcheU5x24Uye6VVH5Fvd/8VRASRGu6HNy/nMl+uKn54sp3rZ6BKevvdOQYw32hBJVTUsgpu8xjiA5kNjDqt6Aezbqn4pWtcU+1CoYlrMivge5bHoLpJz7Xedg8ulrr2BgWUt0pASHljFoNyNxqZdQwILHwe5va1REQNGS/T25M3aK05LE4vPR9JADe4zKXVmNhQSaEqy2G+Ssh4ngzxlW+LlHwVzWjYpxu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(376002)(366004)(136003)(39860400002)(396003)(346002)(26005)(1076003)(82960400001)(54906003)(9686003)(186003)(41300700001)(38100700002)(6512007)(66556008)(4744005)(33716001)(4326008)(66946007)(8936002)(2906002)(6916009)(316002)(478600001)(5660300002)(66476007)(8676002)(6506007)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VC2QgzOusRWAlLoF0PsiTyU66whovpPj44S5NgVUhl6r/9+3W7gH1m4DaUDs?=
 =?us-ascii?Q?ryX/iDxwlo2FEmbvzDCsPzs8E53ko07zEreL22ACR5SSjyH61d/uYH2uxAGt?=
 =?us-ascii?Q?gaKq3PoFQTVsbE+tqLsd9hTfVJADtXzgRjRGeJc/eHf7SSENAJPKychGrD7L?=
 =?us-ascii?Q?fBQKzcuYmXOFPVxnsm9sDvbX9B5xLvjt2IXYPItVfHhLkHeNM9cHjbWtyVXk?=
 =?us-ascii?Q?koFk+45T4s60UrlWq/DnHdD/VWjrqwWIuX64dURaRYPzHQqXd3BNqb0mJMGL?=
 =?us-ascii?Q?ZyondASzzXMIgL/ZdzA4VpALbLw7KbcO+oov5u1FRRzaUMA4ji3rj5Jc73od?=
 =?us-ascii?Q?lQRw3lfkkqBqIXZI5l3BSd44vdhAJ9p5U9ShxPrHKoAeJkie+Py/KNPqTj4P?=
 =?us-ascii?Q?rF98Q4T+P/UpCamEZbUKH/5/zZaYzOi0Oaccr2CpiNiPQg4aMnmxgoW8pI32?=
 =?us-ascii?Q?6cBJmPvx7qULPwkCvIk1HJCGSnXUgBQ8x/JukSxzL/zELwR1VNOxk1UEi7cC?=
 =?us-ascii?Q?jRUm/5I9Gb6OP6lwVfl0d8MZRnCCJCRVlOgj8HUAX3wx9PXQ6VKEnBrYpDt2?=
 =?us-ascii?Q?R69YCJGUiP89gaRUZ3bs/Zk79wHhcthOgGDy8Ny6D0hB6cp/JoaA/gWuNb5s?=
 =?us-ascii?Q?7nTNAjls+S8nAEWmiSSobzFrB/C7MNj/y6E4LOeKHdyPtr0xdON0jClUBa0s?=
 =?us-ascii?Q?UYuH7pCG9P8No3zDATqTK0/ZKSrtOeVIyfBLVio8ZGu/FiVn5F8tyxvJppay?=
 =?us-ascii?Q?FNM/4CUtGUvXMZJcMUpoQax05Dp8pxj1W896RccKpO5snOiBOy0CYzhjatZT?=
 =?us-ascii?Q?b08RDxb/fviW414v4o3P/un/MqQrCA+CzVie5pDNe2FA5z4lVs8JWyZemF9z?=
 =?us-ascii?Q?gU2v+TyTZBBe3VSOc7Q6y/x4fvpp9lc1AQ/o8kwUyJA74Gh8LiXT/mYsxdLi?=
 =?us-ascii?Q?rbBw63Mq2zBh+ll3RgNQ2Tnu1p2BFHWPqNmTI79pPR01tZ5r0xRl2a4rbfTa?=
 =?us-ascii?Q?D/VGhk2tijBki10BI6k2qGfogwWP0+4pdz9UsHSJx4qDK+xVqhkC97rZIB1Q?=
 =?us-ascii?Q?kqqpkpx/eG8IRYkEYPStU3/v5HA3q8WQLd4RcEE3grI7o7YhgWeayqY5AeAK?=
 =?us-ascii?Q?7Fde4CiA3eNr3k8LtRPf35UVvgUn5ZpqB7lwZGPJsYYW2OEnANLdDCL5/Uez?=
 =?us-ascii?Q?HSun0I8NRGeoUWpzeYWcSUnvo5sYzEcDDLb1p99+8by1/xeDiDv/ak80gRW5?=
 =?us-ascii?Q?Rv+VeNMbHItPe4WIqqtCOhhT0XTLyi8Fij7s0AleCKvjh37tpKvFxcgXPYWK?=
 =?us-ascii?Q?Tna7DfCOj2Zg0bhU7Kx7ow4tJ1HNaxuGnNRcqExAS2TxAVLjmfn6StTqrasD?=
 =?us-ascii?Q?2aMNuULhRe2s4058T8smIKsaZIc1LpYWHtHs1MjO9Xkxd3zMpLuQLidr5u1E?=
 =?us-ascii?Q?45BrlbU1ix4ZEzRCUWpLChJJMCmb/Vio22tYi6XuSJbVqbPB341FHarUA4cP?=
 =?us-ascii?Q?IoLtC7LF79/M66y96r9Q4I4GvlzzAXgksGxM1BEZZfLKkWJ5GMxV0LTir02j?=
 =?us-ascii?Q?Mk6K8XjMu4t9zOoZ/c4XYWcmTwElcgCYQjfR2ZPsT8jRJMJhiheFrNcPyu8R?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b83140-37d2-46ba-27d3-08da54a30af5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 23:00:46.7837 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vfqbmDg3MI0NZHebTtS8lOeylGcWaFabVm8Nc3E8gCBzfp3A4DEGuL6v5ZgFS3ObRi/kMG1QXkauNe2xPzKpgXRTFF2kSDB5aBHaR0O0Ce0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3654
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
Cc: David Airlie <airlied@linux.ie>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 17, 2022 at 04:05:58PM -0700, Lucas De Marchi wrote:
>Exporting the symbols like intel_gtt_* creates some confusion inside
>i915 that has symbols named similarly. In an attempt to isolate
>platforms needing intel-gtt.ko, commit 7a5c922377b4 ("drm/i915/gt: Split
>intel-gtt functions by arch") moved way too much
>inside gt/intel_gt_gmch.c, even the functions that don't callout to this
>module. Rename the symbols to make the separation clear.
>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

I was in doubt if drm-intel-gt-next would be the most appropriate to push this
patch to, but after checking the last 20 commits (which goes back to
2015) touching drivers/char/agp/intel-gtt.c, 17 of them came from
drm-intel-next/drm-intel-gt-next/drm-intel-next-queued

Applied both patches to drm-intel-gt-next.

thanks
Lucas De Marchi

