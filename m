Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472AA81CCFB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 17:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2810C10E7C5;
	Fri, 22 Dec 2023 16:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB4E10E798;
 Fri, 22 Dec 2023 16:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703262515; x=1734798515;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BzuFRwrbvkZ5NBUall44xmhrSoW/AFp28SN1QSraeMA=;
 b=ASko+KJ+qvMVwZnou7McY709wcyKPKjnKS9cR0EsfacfgYlbzKtozB8n
 V7NOAniZXeH58k4XJwgY+9mG8f9se2V3lm1XWKKXnM9muHLZuuvPUCwqj
 Qk3JC8nicceJyLgvNLueHGEO7h8UVWH3FM4CE4pMmesIuunqV9QTezqD6
 ugf7cTde1Umt0HPZgyDp1H2ZyxAikTmNuLIZrgN3XCgVR6gLoEVii2hp8
 C7lIN271vLuFWHRrpH+aDMKHiqF3E7rfEKs9yDDbGdJziDcqRYZyu9/jO
 wnonQwazDb9DbKgJD4H1VeNm2xJDgP+82n5kCHvY8eWB+p4bd7D4yislm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="395024406"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="395024406"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 08:28:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="777081237"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; d="scan'208";a="777081237"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Dec 2023 08:28:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 08:28:34 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 08:28:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Dec 2023 08:28:33 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Dec 2023 08:28:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwSD9dQGZ4wv9LKpATbgVAeBKCcClP9EvttYiKPm/3nS7E1d0llN6nXhgvU+0e4LKX+sPGP47oMVV6qGJP7nZehgf80kAdjtAhA4PVyWinQjCM6wOJKA52bUahbLZQT0ojEWoqyXTwrL5TWUjHURyXuNbUL/SC41yIhozu6yHPFep5FnkYn9DIWS39B6k08rVWgN8+AoJQPY0VCCzWxIuXqgLbPrjVRxZTc9PsRg/owfwY54xuXi8aMTGvVXM06PuElENclodCU9lcZkFjC1lTlIa6Q7wS/3wJ+k6u75vO+sGEOFmq+g6BYrHC72Dbdg2Z2ssIRSkuCzA1O5PsW+Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iEp1UxcklIkMVAC9OfGCVeb73fQNSos84FyHwc7QimI=;
 b=h+ya9PPgN6APlxtLyS73rJuiJ0xRpS5W/wmoNNapG8jDtVROY4niLDRHTSDyv6pmHuiv72NWt8pSIQwYs4yldbCjtab9g8k4sMcR1z3hoTsxMZdnMZaN+kFxL/1bAn7/2Oqsw+qI98iJWZCdu5Antx7Vnl1VotYSNp1NOCAJDkeCjVxLD8oONSTNmAFD4bAiampOka/u0lOFTxanP99HQ7rf+bOgXHgMzHbaFOvsAqPm8HH8Z9JBvujwfLRMNWuXX9Awd6c+ncPisuQyH0xzn/fZXyz7xHclAzkhcnqkGdNm8rgNi2LoTCmEM1l1GjUbWXPdd5esgCYX995A0T76Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8285.namprd11.prod.outlook.com (2603:10b6:510:1c5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Fri, 22 Dec
 2023 16:28:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 16:28:31 +0000
Date: Fri, 22 Dec 2023 10:28:27 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] nightly.conf: Add the xe repo to drm-tip
Message-ID: <ofbaryl76bbqcaqu2g5lvbre2ny7xtkz74eh4muunvkhcioibr@76qwoychzxmh>
References: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231222113640.14038-1-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0134.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c2e656-bb5c-46d3-dc5a-08dc030b0922
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: k6hg2Jsi6c8oY9HtckwVZG7q59l6XlARmFMaIMsco82OU9473fVE9/HN9IzGNFo6s7sBTHKW52kbg6JwpGfPw42YVlmR73ANr/oF2SN8JYK7DgOOqmOG8SZzcwEKI/Ap6O4kV3em7/cNAGLuoYB7woBk5GI1HbMF3QUzWTxpsQ54r3jWlj8z1a+gEa5FBoQs9xPkTvw5mgmNchv91zbw5BNBW42lUyKv427HT1iJTDbUotWSWUSYTvwz5U/EpZcvnajtNp7pR4uD/lGtB+pGU1R2FytaRTjKkBm3R9STNMyXAImgxY5pq60TtvwqDLGe+cyK9kh9JI3k34i1IqIAM8JXYJeOrDXxLqzDhYHQgWIuPd9OVf0+GnzYNrG6Xvzn5o9znnQZV/GkcKe8/S8g/ge6EegNORmdvaBgjIiAVylWLjBARI/fveIDYlr7Lj1sNEd1CM936R6CRpYm4X8wWAK0cmrLd3qXrsuVBhi0KqZwvglUyDGA+XkDIEiXLkmYYV3k6FGLNjP+YtcgcpHoYh1OmbKPZ+Gl26yvz8OAF+Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(366004)(376002)(346002)(39860400002)(136003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(966005)(5660300002)(6666004)(6512007)(6506007)(478600001)(9686003)(6486002)(26005)(66574015)(83380400001)(8676002)(4326008)(8936002)(41300700001)(2906002)(86362001)(33716001)(38100700002)(66556008)(66476007)(66946007)(6916009)(316002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?q2Ru9M7j3pOUTN3bIEoZZOuAwkIkVAowUFjqSAOO++PPBUJjof6jLLrWXm?=
 =?iso-8859-1?Q?ooSn9fPqHtTzU9ckzah111BzT6jR4h/keIZAHRGBYC1Ls3k16uKtiH4WrE?=
 =?iso-8859-1?Q?8/x2DF4jNi4MyYx/KKu5EKEbLheNxnrGERPYE69t4aza6yNWcYpkoQjeJX?=
 =?iso-8859-1?Q?Mkaa0NEv7rAOFasmADfPmlVSobeVHLXpftGWSy0YpVirZ0QcwKXq5NwtaD?=
 =?iso-8859-1?Q?Rhz9vsSRi+fh/MaYVsFOaEnCOqP94hq8xGj9k1sQPV378FKpOqZUbf7p1o?=
 =?iso-8859-1?Q?jwNLOA3NM4rxQtyYg+rolvmWNgOKZ4Pa9xcsC1v5udV1cPb4bBVyWs0+Sn?=
 =?iso-8859-1?Q?cZxCLddWzzDbc2vv0h0lzdwOvuE9MNhrKFDUPcoX+33KHGt97/sHTQV+vQ?=
 =?iso-8859-1?Q?DxBILyo82gFC3WFfdY0hlGOWSZX/gaQUWsRFLKUHX3s1wJVgZcLXSCMEAv?=
 =?iso-8859-1?Q?GHoBTjOERUTx5H06O0k22cNWfkOkn9BZamuzn/GEKxfia4COjiA8ZjhGls?=
 =?iso-8859-1?Q?YNE7nkVe1O/Io2mOoXfQ1EoSz7RdgvkUuzZIOmxI0v2878JxRtzU5nuBtu?=
 =?iso-8859-1?Q?oigMgG7UPX/sqNsK72ZHhro8HIwOXW/VyonbNOZBwq82wlZ7QJOuBuMVTM?=
 =?iso-8859-1?Q?z4HMaVScuulViUgmow4nn2RqM4OGNI2PkZIKns73dBDavnlxMn0iL1iDPf?=
 =?iso-8859-1?Q?rVBBTouoOz5XY9GLZnYIcyX2uK9DidVr2u/TVaMhRWckU0pwQfxsZbSVWU?=
 =?iso-8859-1?Q?DgVImEcAal+tpOMa1EXC/eu5/KKeSJczXU6ZSfut0WXxAKS2RsVpq3LM2Z?=
 =?iso-8859-1?Q?Wv0npqVRm69MSXB8JQI9RDMCNSagEaUH+BesZ7JSz/adnx4/1kfJtXn+QM?=
 =?iso-8859-1?Q?tZx3HZElGyQabQC0oFj0NCQRt7JOsF9PahsUn6hy1zRoA91Qn1noD4+/tv?=
 =?iso-8859-1?Q?528RK7OQqA7txaWEsKC8OVDVt7UaiiCIPre0Xr4yhu2i5c6GrNu9d/a7Xk?=
 =?iso-8859-1?Q?+BGA4V4iv0z23aMycJkD9W6uepn9AkXS5HXri+GDW/YkkR3xvqZw2do3lJ?=
 =?iso-8859-1?Q?U3l7gRkc1H3ETCzJlaEzAXn2Z2UiMoRO/Hnf04uhz25sVa7GQ165GuPbfG?=
 =?iso-8859-1?Q?lS66McHTbwPklTIjC23oJZp2FonqX9+093W1FvOuQVT2OyfJzSQNyBlz7p?=
 =?iso-8859-1?Q?YKzIc7aS3svBwhh8tM3cqAekzrZFdeqZojD4EP7vsqMUBo9Dy37Fs84Bi3?=
 =?iso-8859-1?Q?ZABj/ZIUWLdqU82x+NitX4abyqG8A5eVR9haU/1+hplDJxDwFL5f9Zx2qR?=
 =?iso-8859-1?Q?e5KywjWDnujpx+9kiX9B7J1yre6xjW9g74/u6GVRKVyxZeWAbe/5vRWJo9?=
 =?iso-8859-1?Q?YxgpElucA9vtSmzDCzx/PePLgKFkV+jPEs81NS0vlW4AeZvdN07H3LGA1E?=
 =?iso-8859-1?Q?WVlr8P/nKp0lAAqj5EGbVYOr11QQCToojK4abT2xO4agxPTU6Nvc/FGPmp?=
 =?iso-8859-1?Q?H66HvaZovwPLt9rbXLtKz9rOahIBTvnP3BmTI5e/lisXA9F/t9m0pwS1uQ?=
 =?iso-8859-1?Q?erU3qHDkmNVw9DHYu9qAbiLfnMQOPRPV6d3ngM/VSu0E3V3AxoGAQ5UlqW?=
 =?iso-8859-1?Q?m7mivB+vnj3v2DOeIVt/ybA+ox5tZ/SlvyvRdhghPozSgL7bAHAj5XJw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c2e656-bb5c-46d3-dc5a-08dc030b0922
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 16:28:31.4287 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQi4A8aeGFTTfglc6WSiNqRfCY4ZWR0qxOnJwcHqa+jzu02AVZcfozOW8AnkSsHaAY4UNXhbdvUnIKwqUNiORVEG0p8sAlRYBQ/xR3YhQTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8285
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
Cc: dim-tools@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 22, 2023 at 12:36:39PM +0100, Thomas Hellström wrote:
>Add the xe repo to drm-tip and the dim tools.
>For now use the sha1 of the first drm-xe-next pull request for drm-tip,
>since that branch tip is currently adapted for our CI testing.
>
>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Oded Gabbay <ogabbay@kernel.org>
>Cc: daniel.vetter@ffwll.ch
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: dim-tools@lists.freedesktop.org
>Cc: dri-devel@lists.freedesktop.org
>Cc: intel-gfx@lists.freedesktop.org
>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> nightly.conf | 7 +++++++
> 1 file changed, 7 insertions(+)
>
>diff --git a/nightly.conf b/nightly.conf
>index 24126b61b797..accd3ff2cc39 100644
>--- a/nightly.conf
>+++ b/nightly.conf
>@@ -24,6 +24,10 @@ git://anongit.freedesktop.org/drm-tip
> https://anongit.freedesktop.org/git/drm/drm-tip
> https://anongit.freedesktop.org/git/drm/drm-tip.git
> "
>+drm_tip_repos[drm-xe]="
>+ssh://git@gitlab.freedesktop.org/drm/xe/kernel.git
>+https://gitlab.freedesktop.org/drm/xe/kernel.git
>+"
> drm_tip_repos[drm-intel]="
> ssh://git.freedesktop.org/git/drm/drm-intel
> ssh://git.freedesktop.org/git/drm-intel
>@@ -65,14 +69,17 @@ drm_tip_config=(
> 	"drm			drm-fixes"
> 	"drm-misc		drm-misc-fixes"
> 	"drm-intel		drm-intel-fixes"
>+	"drm-xe			drm-xe-fixes"
>
> 	"drm			drm-next"
> 	"drm-misc		drm-misc-next-fixes"
> 	"drm-intel		drm-intel-next-fixes"
>+	"drm-xe			drm-xe-next-fixes"
>
> 	"drm-misc		drm-misc-next"
> 	"drm-intel		drm-intel-next"
> 	"drm-intel		drm-intel-gt-next"
>+	"drm-xe			drm-xe-next b6e1b7081768"
>
> 	"drm-intel		topic/core-for-CI"
> 	"drm-misc		topic/i915-ttm"
>-- 
>2.42.0
>
