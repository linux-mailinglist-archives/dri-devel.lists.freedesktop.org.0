Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294E5825B94
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 21:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A278E10E691;
	Fri,  5 Jan 2024 20:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB8910E691;
 Fri,  5 Jan 2024 20:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704486372; x=1736022372;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=xe9dZqd46RTGNaGlatORInyHdyQ+S4oTyhGlrmx47l0=;
 b=X7inZGPf5eDu6GDKazJ9AUWyWFSyIWL0TS7NFsKejsbLsr/FRsHjT2fL
 HA8bZacDUQ+mGod4C0jM4wQI/u7VmraGNY9g3SxJZuvlJMQ3NHeFy1f7B
 wWY17Upl482paES/90i2SYJ8qhl1Euq0O0u+lnIw+veGW45rpi9MF/0M+
 40WQTE6K6pm+VsqW2ZAwgMSnz8jK1G/LO46Bfy+4Lu3mjdbq1JElykZww
 4l1TOhUY273h4VYWbJNQxfPkT0Cn0Lq85Zf5MP32EbFSLr3CjeAlF0ki8
 zEPpkmIbkZqS7b0seMlVHGyBRV53wdfKPT/GoX7ugZw3QAa6iEDdafIBN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="463975134"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="463975134"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 12:26:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="899748272"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="899748272"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jan 2024 12:26:11 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 5 Jan 2024 12:26:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 5 Jan 2024 12:26:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 5 Jan 2024 12:26:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ggjXh/VJmd/dSQCtj/0ML7ca7RDMD0XNOVyhwVaYWJbaVqmgKdpQMNquVXBax2rqMN5hV3NvmeTWMQ04bBlIHdnqk158sDJy4YsSCLgblvEQCj+Aiq63jQ7EYH1vGb32OkwF4XKXByl4zh7YSe1WqjqKF5oje7OsOj8FZ3Q5JcniieNi7Mwryj+wM7j6HM04vMNsainlQlXein+SZ99Rot1GFyeOLWAW1tZe18fVURHWdnndeL4fow4N+Y40oAZJQGrnRBXzpZJE8sqZ1QCbfci8IjSJ/VtAhZq11v9GEyXNv/gtrwJsCc/qcsA5bV7XQDa/ZAMjY2RsWtwlzck++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O8WDAvI+lksw/lHULtJnYmyqiYksH4MBwLuzaeByCeA=;
 b=aIIpSmkjU2fzrdQWRCNc2YyPfdwkM2j5jgXXaudShH7nT4QY7JURNFD53fv8KpzMdq87tk59S55muQMi/UdiF/L4ZRn61cefRswpMjBmipZPh8m3kBu0k/MWmouwrqyNwydbFgXPiUrEq58FkqqbV4bxk6s4185QN5zbHYNYZ8jUmvFxzPD7HrbJC9kd3R0+2S7vYQ3SxgCuMG6toPbVbTNzx1kaGAzIR6QQ/NHunv9h6YjpkPlfqZcWo5HhjnAoqGkbHPC0nuuRP2WWGzIOdovIYXeCBNv5BS4LWZFx+lhUUmlpXkgZZQslxcAu/Rxfnw/4fMl+CtKAmEyqYRvHGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MW3PR11MB4667.namprd11.prod.outlook.com (2603:10b6:303:53::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Fri, 5 Jan
 2024 20:26:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 20:26:06 +0000
Date: Fri, 5 Jan 2024 20:25:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH] drm/xe/selftests: Fix an error pointer dereference bug
Message-ID: <ZZhlp4NXToubg+PJ@DUT025-TGLU.fm.intel.com>
References: <5c0db456-2d8a-485f-875d-6408386fcaa5@moroto.mountain>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5c0db456-2d8a-485f-875d-6408386fcaa5@moroto.mountain>
X-ClientProxiedBy: SJ0PR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::9) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MW3PR11MB4667:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fb56bdf-01b6-4fee-f2e2-08dc0e2c8b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DnCAXaUOazpOJOz2+YxJ5m1XVMY/Etu+JHu/zkmC+aKgPEHJeHNMTw3HUP/dSIY7lp5CaHlrzbuZTl8/yJV+Q+m2MV2TX26pkAHfLyjO00R/+Ute6PUOiLdYkRuvjG0SDv7/ZV0om2gIIrmxMQGvYS8Im/lNNRUVF6JP+Ei858XgtgW/Fm8aou3JtX+a3jafhqYdq1r3UK+WKTTE6w6srEDJN+0RU7NeiwS2BZInIIYMaynqCLaFBaOwzFNN0dY7BXaGSotIXs8e2efDQY+C7d3JpVbQYxtPqqICUh925vex2lu1OWCNOGA/nwZFmn9V4+6VpLD9HktY3mUE5CxyjZjA5xUIHhhTi1i0EnaiFCTH5fGzokOIsnkC4L+WXA2nBgg2ClMUbJjegync2GFPiM4UapqRrCLf4t9k+YWgOgRaeX0ICKya4zWI0BrrgCr2HST9v+dKJc7HpgJKSUqMhhe16P5tJLJ2uktSLPp1Ve7ZjWUtBctcqCGTFV6iEXs4n463zn3U1LnBB4SoB/fLn8qEAteoohW1tRGHttSNkULOL+p95Kp5dFwIkHopyWCnxHa+0CW9nO6L78qVGdfJGUGdkr5g4o3ypO2QTkSE0rs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(136003)(366004)(346002)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(83380400001)(86362001)(478600001)(6512007)(41300700001)(6506007)(82960400001)(6666004)(44832011)(54906003)(5660300002)(7416002)(2906002)(6486002)(6916009)(316002)(66476007)(66946007)(66556008)(8676002)(8936002)(4326008)(38100700002)(26005)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7vckuvt2BZTv0excb/OkmeqrN3NsUS3Luqz1i7h9x5s2P7o8RIpVsiXFgiRZ?=
 =?us-ascii?Q?jE4uHpIlL7VevCewCTmU8j2cRXq5asoKggBMvaFf5P2bnJY2KtNfEbmORdh0?=
 =?us-ascii?Q?PyZ9Z0NQB6/aMJiXEuXZlGL3B+OvLXoRQhxcG4STcDSIxQgA/1WrNMLkVTpp?=
 =?us-ascii?Q?6QGREfqsz6P2LdNBEumpYpynv92a8dO46E6f7lw21v7zjkWNeGgUBguNwYkD?=
 =?us-ascii?Q?hpttqT9ImmjSyxsAokIV8jUARe7lMzwUf5mVRLwxlrYK7W18lYVVjVZRnIAN?=
 =?us-ascii?Q?0nbSjZq09TqR+lHFosyxnwRf1hO7iD/Lv2Eh0obvVbdooUkK/ZY4bTNxC/oO?=
 =?us-ascii?Q?7WYmd98Ty06UB8bIo4aLmHSW4UyhsaBOpQspduhiiHQUI+ptpzWCVrWt5Whe?=
 =?us-ascii?Q?MJprK+lh51W3TVowbfPFtdxmccUWISOXy/fvMNI+1oGr1/hHJq4pF83jbPbL?=
 =?us-ascii?Q?9zculgQlqOT+UgwmIJJ3QRkuQwu2Dj0Shy89pjFtJ4MmZSsEt1CIy1ATN+nE?=
 =?us-ascii?Q?EHEwaItE0UGSndTxbJR/vQlRynxu9PwvFiaeg6NkeEIaktbywO4FXDclx3g1?=
 =?us-ascii?Q?qgAXcAvXv3tiZj42x/JqFSgcabn0rcTH1fLydwb+AFZRkcCkF0GfExJqsK0b?=
 =?us-ascii?Q?B/ZwzElryw6NHzvXaf1KLOysvtEY3wQAhOfgec/Xzsm7SK40M6TsgCidrWpl?=
 =?us-ascii?Q?dsYD0OF540N0XOAcbjMkRhNJrJx5awJuhAZpqNtxVJh60AFQgkPeLMbDE3HM?=
 =?us-ascii?Q?Sj7zRjhyPYL+wFK7EyJ7BouXEyvlqqHlHbLlIaZE8FkB3G0P9DNW2tfE7bD3?=
 =?us-ascii?Q?cZDwZWrD7o65vYCHiMJbOGN6qOAl/ckp+53TQjqIncsy2yHUTjV3tJoFySFW?=
 =?us-ascii?Q?BmLXTVZWJ/CmyuALX+kUPraymC7ujHjG7/FVayxJYEhnsv8euCz+lmfUJ1EM?=
 =?us-ascii?Q?+wldbc0DUVWmMdjslroknUi9Gk2KTgdgzwuYv3x9fCUrfya53aEH0YVwbB0X?=
 =?us-ascii?Q?5uBzvvjYRiJmeAvQhi0tTfmHdRglX6AGVHCfHVBUHSLHEIqA1URHEirrQRSj?=
 =?us-ascii?Q?YvY+OAbswIcvyO/o0FdIvwsPNVZt9/mlMIAVQDzBMneNKVXhFVN6t2/OjRLZ?=
 =?us-ascii?Q?Vz6c+oW0FJ2QxGAlRsKLEzmT/ZuC7MxcduQWfcrnJWMXWETUf9BYHl7gPgAS?=
 =?us-ascii?Q?AYiAL3L+oifbN3lbF0TrSBbvozW/zyNPKjRxOAHDuMJfahAb22L3N1qcFl+Y?=
 =?us-ascii?Q?lzLvk9seWq6IcTd8y35pcnVZDZjNZgRG4P1bDjUheuIpElcLHfcli4okxtOx?=
 =?us-ascii?Q?19bF8SP3WSM+ZtH/tFFG5Ru3LVIRAWucx+PuS3KsTgBZkjQD7U9NoTidPGhU?=
 =?us-ascii?Q?JiNeaJb0TM/Sdeg54oDuSmrNsFqT60cdsJc1MkThf1Q1afGypc6/mv+d59ez?=
 =?us-ascii?Q?I5EjAnuinnK9b64IK085g6uynprBmo4HFQHsRAe7+OhspAXWjyRzUl1/TFmD?=
 =?us-ascii?Q?pQRwkFuLTE92siR5qHGaVnxaKTPUG1oOYN1mJBuhfHVWgnXI8v6zZNkQ+ol1?=
 =?us-ascii?Q?21YPkVNZ6r8fWwQZw+/CX/Ham67Sp/4qBcWPPdNTz+GMOPJwo6Co8WP3hR3V?=
 =?us-ascii?Q?3g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb56bdf-01b6-4fee-f2e2-08dc0e2c8b46
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 20:26:06.0161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8QUnUzjoRUUAT6XM2AhuiN2eaWbt2bdYYkihqgiYkCnI8tpAxfnPdW79hTY6JtWe7R9zWC90gRqZmbf6a47G/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4667
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, Pallavi
 Mishra <pallavi.mishra@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 05, 2024 at 03:20:35PM +0300, Dan Carpenter wrote:
> Check if "bo" is an error pointer before calling xe_bo_lock() on it.
> 
> Fixes: d6abc18d6693 ("drm/xe/xe2: Modify xe_bo_test for system memory")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/tests/xe_bo.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c b/drivers/gpu/drm/xe/tests/xe_bo.c
> index 412b2e7ce40c..3436fd9cf2b2 100644
> --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> @@ -125,14 +125,13 @@ static void ccs_test_run_tile(struct xe_device *xe, struct xe_tile *tile,
>  
>  	bo = xe_bo_create_user(xe, NULL, NULL, SZ_1M, DRM_XE_GEM_CPU_CACHING_WC,
>  			       ttm_bo_type_device, bo_flags);
> -
> -	xe_bo_lock(bo, false);
> -
>  	if (IS_ERR(bo)) {
>  		KUNIT_FAIL(test, "Failed to create bo.\n");
>  		return;
>  	}
>  
> +	xe_bo_lock(bo, false);
> +
>  	kunit_info(test, "Verifying that CCS data is cleared on creation.\n");
>  	ret = ccs_test_migrate(tile, bo, false, 0ULL, 0xdeadbeefdeadbeefULL,
>  			       test);
> -- 
> 2.42.0
> 
