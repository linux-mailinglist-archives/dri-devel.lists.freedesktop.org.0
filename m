Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CB29F56AB
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 20:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA8510E222;
	Tue, 17 Dec 2024 19:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="I5CG8W3q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C029410E222;
 Tue, 17 Dec 2024 19:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734462331; x=1765998331;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=f7Xji6UgtohMwe9fTNOJouVx9asByQ3jOLHrCKemOGs=;
 b=I5CG8W3qysmsKeU0ufZPzCFqN7Dcf6WHp4hK078IvZrwqQ2wpa/xZslB
 NVmDg0rvO0b52/xHQJ23YyJ6T/0NAHtw2sbvFz67OaeOik2kyUydgjwXL
 uZxbEvyGZjwUZCNsCYvass9+437xaoSJEF6iXdiNQEn8k79ggg8MQNG6x
 /7HGh//unTOIo4ynxi4vGpr3QS8gYILytOvKY+hZX2qUFLIcmYUhrrJQM
 4LImXklmLok/fzQQFfJNSDA+E3HqI74wsU185k4+7T6qObdjQU2nCalnK
 91nlHC36qvO+6TuKfyGylE8eo1VkvhrL8fgOkzABTUPWQbP78VbiUAP15 w==;
X-CSE-ConnectionGUID: MyXeakiATxODKLbMFbBInA==
X-CSE-MsgGUID: zteD6cGBQKOjkzspgUQr5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="57384348"
X-IronPort-AV: E=Sophos;i="6.12,242,1728975600"; d="scan'208";a="57384348"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2024 11:05:31 -0800
X-CSE-ConnectionGUID: /SHJ3wQdQMuYpZcTzFhURQ==
X-CSE-MsgGUID: MQwI3epbTI+AlfrVvw78UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="101758025"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Dec 2024 11:05:30 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 17 Dec 2024 11:05:29 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 17 Dec 2024 11:05:29 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 17 Dec 2024 11:05:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARiLrqZUMVv/OUNLobixf2iCQt7zxiKEsD/NfJ7/gZx24pDKulGnn8fbo3KecpSEWvCdYlq84yniNizPl31n/WrvCcxXZoNOJyvoirM6VDSmIKU/EM/25+6GdGJDY49tq22ocNrmCEmoBxZw5+8xrxXotY+0l06n1niSK6NZw8J6xOnzgmNlzjI7ljNt0949rrEjO+F3+9DKn9S8SlPrXclNLh7sMjc+T6d8T4/oSU1kWd7FUWNDki1LMz2bgr7hVVCF1SVPdIr+9+88XFTBN0jHnOpAQ2HFyLADbdaAXEGGoEIR8PGmqkAfP68Iuyr4rS+K0p0ngZrENTKBtGYJAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AT7kCzz/sqA0v4Nkms38HPsmsM8zDedMF2qXbjgbxJs=;
 b=GBWiRzWNL0ck/Dch+QVKuOqKAcNf5I94zkPvNM2MNwCsY0FkQp1g3l8vEGndJjD4mcUYn4qIuEZ6G9ZbcCK/ynsyb0c1YCb0fbKW9/qz52V6CMhtUVWLMSinwOOd5BWwLpMRNsplHxas8s0KQhQABouO7jMIX19kvNqX9ogVx/hty2RY807Kjjn1jhrHSX07MK+xF9p/9LB41WaLDo1LHWqEko1AJTkzv305cXyiChMCZC1jtKnDzUFEIrhEhg25cBQFqNKR0tlXeWhucmhRIhRVg0ujh/s9ZucYEq606DEIqNTuP/Qnf73hIWwl8JRElW4phY6McpzLS+YU94/IiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0046.namprd11.prod.outlook.com (2603:10b6:510:1f6::20)
 by BL1PR11MB6002.namprd11.prod.outlook.com (2603:10b6:208:386::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Tue, 17 Dec
 2024 19:05:27 +0000
Received: from PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc]) by PH7SPRMB0046.namprd11.prod.outlook.com
 ([fe80::5088:3f5b:9a15:61dc%4]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 19:05:26 +0000
Date: Tue, 17 Dec 2024 14:05:23 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
Subject: Re: [PATCH] drm/i915/slpc: Add sysfs for SLPC power profiles
Message-ID: <Z2HLc1x6WtlxK3jn@intel.com>
References: <20241217005704.3101181-1-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241217005704.3101181-1-vinay.belgaumkar@intel.com>
X-ClientProxiedBy: MW4P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::22) To PH7SPRMB0046.namprd11.prod.outlook.com
 (2603:10b6:510:1f6::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0046:EE_|BL1PR11MB6002:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a9393db-bf8c-41dc-057c-08dd1ecdc41f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O40drY3zbOaB2sBf+fPZS8J89ncDYdWLf3cD+RGKRTdoKpbnRYB6ugmgBdUg?=
 =?us-ascii?Q?FRvKQjTDgiqOkWLnzu17an0bSCPPaoP0Vi+satatqnVz1LCTCHA4YR7Efg/U?=
 =?us-ascii?Q?Qj5UuPNamqb2RVoN9UL7F6SxNFCt3lTo1ya0OiKVtcWvZ/HsldzfR6O17Dlr?=
 =?us-ascii?Q?ezNYjSudeUGZ6UzTkQZh4rthWzWXbYTpF9lU7WkzDIVb0z/+zNldsW80lvsP?=
 =?us-ascii?Q?lwU9wyvlh9MF8GMJU1qxVS1kssyjigk43ciK24MvsfgiosCQS6FjuuP8mQEI?=
 =?us-ascii?Q?N6PvsuXyR3PaBEsanBTnVknxANNQDugHM33zfrSnHPV9oDGDG7aQGXl2SJfL?=
 =?us-ascii?Q?uhCsXbxKRAHR7y7YfQw7Jlzt0/WdKB/XcbxqQZfyUK/4kP/1UDWmEDWi84Vq?=
 =?us-ascii?Q?ng5FZqiitjxa6vMnKqOoYG7W6yru1Jj2eoYVVafcdv0JwID5aHvkIsulBD+T?=
 =?us-ascii?Q?zvZnYjy/eu4UyJkCoOhPZvgV+4gkenOO568rDda847eI2Wgm0Bd55cfVAI7u?=
 =?us-ascii?Q?fHbFC0iDvArM+LdNEs1uXwC0B0OzgErMsqLO2Jrkjs2yZdPIXtEd/cVr+ftx?=
 =?us-ascii?Q?M+FuXBSkXmG3nOsLxUBTE7l11Z84J0RP8aHll8S19IukVvHdm0c01KH8suae?=
 =?us-ascii?Q?yqkM8jCgEpa716enAOdO5fMDSfMUz2ZOpw/sp4QjYczRbHVPAkqf+B/SAYwo?=
 =?us-ascii?Q?GgTCzx/8ZUFHjePZpT+hWum35vggjlWuw6RNj6mx2LY5OCthKk9mQjxJNqiM?=
 =?us-ascii?Q?v5Zpzoog5a+7bTfp2O/CG7oiewE2252pU2ePYSfZV/kEkrdvkTfE6gNwdpyg?=
 =?us-ascii?Q?Wy4j398wO4/Cpvgj5LDANPlclkz2YMDQj78Heo23MS0ufYVpcxysS2ml6RNc?=
 =?us-ascii?Q?tfBbhiGiXT/75pWcewjnSNsfmzBoxrIMq/qqi0yJDXp+auDeLq/X4nxrXtQk?=
 =?us-ascii?Q?pCI2/e9HCw+l9Il43aNgIVywxIoI/L9d5WSzVXCz3HXs5PifUEH08uMqY2Wu?=
 =?us-ascii?Q?vYFXEAF5srMFjd7tn0UVHNogSYPT6AkrRZeE9GXjnN7T5fAaDZVxLmvr5/eU?=
 =?us-ascii?Q?7EkSHNbWCuQ/L4SVYhVV6iYdiIYmrTamOxDeGewuTiCVP6VQ+OvFl81z+NKV?=
 =?us-ascii?Q?9XRay6uyHKBtVPr/hATvk+04Ztg3E6yP4fKyLhmxP/e96jS+FVnNIBIpKger?=
 =?us-ascii?Q?I8z3PmUP188b5WFlws5QSfb85+WJcUtqfXcqwCxD3SSPUtS5KmyZKpIytg6o?=
 =?us-ascii?Q?0oumXSQ9+ZXgfrSbRMworNyMET7WxkCJmqigZFhHQXtBmcy4vutTG4b31Yve?=
 =?us-ascii?Q?akdoqb/UVVgNAGwHh2CpqyPwyDrBuOiMdO43RMAKhc/G8Xfzp5bcrWaOi8bk?=
 =?us-ascii?Q?Q/s6RXPm1CTAnKskCRIO/he/qKgY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?06KcuwBfGDOB1LjJWnfe4stc2EHNZe2lPZwBOo7rxg2tqswiRaFbwIvLMKg/?=
 =?us-ascii?Q?Kc2gFMs5cctaOVfAgH8hDGw62aBtXejDjb5Iz4n0u1GcvoNHK15c8v6Hald7?=
 =?us-ascii?Q?Z+IUtlLpYdXKpNk2VyWI93qvMLxAIN7aMwQ2Neot9saa+JZW3LZJdNlo4Bmz?=
 =?us-ascii?Q?O/vDg8HI0C1vKrRxFQmJnq9JNLEud3lVaVRDqMLbzt+fZtNyNtpXepAk6Svn?=
 =?us-ascii?Q?q6W+Vusfkatz1yP4XTomKB4LuopbBS5yJXJQJa8q/+cFwlFtU3s8ZBnBNTI/?=
 =?us-ascii?Q?4rZlkAZjAapNfg/66lMrbDW3nFJzLAnDxB5sxFsfdcy1PJmxHDA5KHjq0DUA?=
 =?us-ascii?Q?Vj53vBCL0s6M9S9PmV+E3irJl1X9hY/m0y4OQRaMCn+2AeYa8NaglCgUNpya?=
 =?us-ascii?Q?8f+LvgdUEL+XlwdR1/4Mquk2LCkpY1+UfNMOHdInCowm0YdjJLbwuEpyA4Vs?=
 =?us-ascii?Q?KqL14bzL4HaYj4lLSUP2Bju5LQdWBkT3mnSN+1kECHjn2IAQ1oQ+rnQetd6N?=
 =?us-ascii?Q?ngbNe9piGWhEeeUwZloSjPS9CvBs2rY97IwIaUQXbW0m2qXZzYjGe4psv2bK?=
 =?us-ascii?Q?0T7r1iMkjo0ZzpIWCuKE49+2HgOzj3EHLlGn0iUmWtVNZa7pvtSGn7p06Qea?=
 =?us-ascii?Q?mvIjXdDAjwckwlHgb1CojnPd/JCYWv0AGb2cmIZfqsnv8yFTKdZbDKbB2nno?=
 =?us-ascii?Q?DpRUeilNkFd3aMvEQEN3BMSa3G2zEw1pASIahhNfbBwKkm4dh7/DfRS3rkYB?=
 =?us-ascii?Q?Hc51C19ZndWDEkcktwQg4L5m6JS9uyrayD3QKWmZ7H/DVEZVl1AeV72AUF3b?=
 =?us-ascii?Q?Rxnd6kGkzscV6VkKQhW5hb9tsuajVLNX9Y+YRIGp3wAfkwQGTSG13lVNYEIl?=
 =?us-ascii?Q?cjeURh+G47pDmOinVaTd9SuY3UCvKZr3C3rCdDifomIpEIMfzygVs1gBO8+1?=
 =?us-ascii?Q?e/RsecTFVQKKeu1qdJrZ7b7TSpVpR66CAM2Krx8dJbulmh0waftg5gDriwdW?=
 =?us-ascii?Q?Xvbb+AMvYlRDf45mj1vIk3fJ/eNXMG5+F0Va+rPlMY8aoXTg3PKoqUbaoB1X?=
 =?us-ascii?Q?AzvK52aI/f36dv5IJMtll4tD7TrxyJ91GYmy5AUziwIb0FwlKRILdVvDdfPD?=
 =?us-ascii?Q?YjqnzgX3odr2CTjVHipBoFBVxbVGyO7MFBG/vcE7jDag/2yxgv4wcgLxMz67?=
 =?us-ascii?Q?Q2GtACU6Wn4z6pIjD7AP9fOX6v1nEG13iBcZOoTIPB6Ep9Wb+RPqWcg7T5Oc?=
 =?us-ascii?Q?+P84086hn57guhQvs+4bAyjKiI0oq9lH2mUzRl1flTbbBTwuI5ghnOyh0IkC?=
 =?us-ascii?Q?Zp/OxnLS0q7BJUhyMAPwp9Vm0CRprzUCkC6q59flRARI6aMt8Os7M13Flrpl?=
 =?us-ascii?Q?DrJToXPXEWnrTwuynVnGv1NTR5qWwYtgp9Y2dSlgecY1xybst0/6S16B1WuL?=
 =?us-ascii?Q?wrV3+QwgvI4H9p2L9u/BZc0ydBySM8jTlix89Etn1Z6rhf744mgj3ZJmy2vL?=
 =?us-ascii?Q?5IXd7PP5IZ1YKGkmvoHVaVRtpgDzSHseqbmtTG/GJRoHhH2DdItqjYNtT+DE?=
 =?us-ascii?Q?4VT49C/Y1P4tkWJvu7C8xJZ2km3I/tYLAtQwg1tyKvHpPq+uTrkUbQzPAb8G?=
 =?us-ascii?Q?tw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9393db-bf8c-41dc-057c-08dd1ecdc41f
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 19:05:26.6189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kh02Ax7RF4EUYVH+L1nMxzgABL6NRjplEQH6wazbGeJkz6WlnnTBhGE2mwspnUWDm57JL1DytmKr+u/WkswVDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6002
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

On Mon, Dec 16, 2024 at 04:57:04PM -0800, Vinay Belgaumkar wrote:
> Default SLPC power profile is Base(0). Power Saving mode(1)
> has conservative up/down thresholds and is suitable for use with
> apps that typically need to be power efficient.
> 
> Cc: Sushma Venkatesh Reddy <sushma.venkatesh.reddy@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 35 +++++++++++++++++++
>  .../drm/i915/gt/uc/abi/guc_actions_slpc_abi.h |  5 +++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 33 +++++++++++++++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   |  1 +
>  .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  2 ++
>  5 files changed, 76 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> index d7784650e4d9..52a5ff94a0e3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c
> @@ -464,6 +464,33 @@ static ssize_t slpc_ignore_eff_freq_store(struct kobject *kobj,
>  	return err ?: count;
>  }
>  
> +static ssize_t slpc_power_profile_show(struct kobject *kobj,
> +				       struct kobj_attribute *attr,
> +				       char *buff)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +
> +	return sysfs_emit(buff, "%u\n", slpc->power_profile);

what if we do something like this:

cat /sys/class/drm/card1/gt/gt0/slpc_power_profile
[balanced] power_savings

echo power_savings > /sys/class/drm/card1/gt/gt0/slpc_power_profile

cat /sys/class/drm/card1/gt/gt0/slpc_power_profile
balanced [power_savings]

And second question, shouldn't we disable waitboost so this won't
compete?

Also I believe we should provide some kernel documentation documenting
what would be the governor levels like and recommended settings for
each level.

And then in Xe we should probably add a governor selection in the same
style as devfreq, but with our configs...

Thoughts?

But the code looks good and I believe many cases out there could benefit
of some extra Watts saved by having this option available...

> +}
> +
> +static ssize_t slpc_power_profile_store(struct kobject *kobj,
> +					struct kobj_attribute *attr,
> +					const char *buff, size_t count)
> +{
> +	struct intel_gt *gt = intel_gt_sysfs_get_drvdata(kobj, attr->attr.name);
> +	struct intel_guc_slpc *slpc = &gt->uc.guc.slpc;
> +	int err;
> +	u32 val;
> +
> +	err = kstrtou32(buff, 0, &val);
> +	if (err)
> +		return err;
> +
> +	err = intel_guc_slpc_set_power_profile(slpc, val);
> +	return err ?: count;
> +}
> +
>  struct intel_gt_bool_throttle_attr {
>  	struct attribute attr;
>  	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
> @@ -668,6 +695,7 @@ INTEL_GT_ATTR_RO(media_RP0_freq_mhz);
>  INTEL_GT_ATTR_RO(media_RPn_freq_mhz);
>  
>  INTEL_GT_ATTR_RW(slpc_ignore_eff_freq);
> +INTEL_GT_ATTR_RW(slpc_power_profile);
>  
>  static const struct attribute *media_perf_power_attrs[] = {
>  	&attr_media_freq_factor.attr,
> @@ -864,6 +892,13 @@ void intel_gt_sysfs_pm_init(struct intel_gt *gt, struct kobject *kobj)
>  			gt_warn(gt, "failed to create ignore_eff_freq sysfs (%pe)", ERR_PTR(ret));
>  	}
>  
> +	if (intel_uc_uses_guc_slpc(&gt->uc)) {
> +		ret = sysfs_create_file(kobj, &attr_slpc_power_profile.attr);
> +		if (ret)
> +			gt_warn(gt, "failed to create slpc_power_profile sysfs (%pe)",
> +				    ERR_PTR(ret));
> +	}
> +
>  	if (i915_mmio_reg_valid(intel_gt_perf_limit_reasons_reg(gt))) {
>  		ret = sysfs_create_files(kobj, throttle_reason_attrs);
>  		if (ret)
> diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> index c34674e797c6..6de87ae5669e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_slpc_abi.h
> @@ -228,6 +228,11 @@ struct slpc_optimized_strategies {
>  
>  #define SLPC_OPTIMIZED_STRATEGY_COMPUTE		REG_BIT(0)
>  
> +enum slpc_power_profiles {
> +	SLPC_POWER_PROFILES_BASE = 0x0,
> +	SLPC_POWER_PROFILES_POWER_SAVING = 0x1
> +};
> +
>  /**
>   * DOC: SLPC H2G MESSAGE FORMAT
>   *
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> index 706fffca698b..0ee88ee347ae 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
> @@ -265,6 +265,8 @@ int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>  	slpc->num_boosts = 0;
>  	slpc->media_ratio_mode = SLPC_MEDIA_RATIO_MODE_DYNAMIC_CONTROL;
>  
> +	slpc->power_profile = SLPC_POWER_PROFILES_BASE;
> +
>  	mutex_init(&slpc->lock);
>  	INIT_WORK(&slpc->boost_work, slpc_boost_work);
>  
> @@ -567,6 +569,34 @@ int intel_guc_slpc_set_media_ratio_mode(struct intel_guc_slpc *slpc, u32 val)
>  	return ret;
>  }
>  
> +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val)
> +{
> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
> +	intel_wakeref_t wakeref;
> +	int ret = 0;
> +
> +	if (val > SLPC_POWER_PROFILES_POWER_SAVING)
> +		return -EINVAL;
> +
> +	mutex_lock(&slpc->lock);
> +	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
> +
> +	ret = slpc_set_param(slpc,
> +			     SLPC_PARAM_POWER_PROFILE,
> +			     val);
> +	if (ret)
> +		guc_err(slpc_to_guc(slpc),
> +			"Failed to set power profile to %d: %pe\n",
> +			 val, ERR_PTR(ret));
> +	else
> +		slpc->power_profile = val;
> +
> +	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
> +	mutex_unlock(&slpc->lock);
> +
> +	return ret;
> +}
> +
>  void intel_guc_pm_intrmsk_enable(struct intel_gt *gt)
>  {
>  	u32 pm_intrmsk_mbz = 0;
> @@ -728,6 +758,9 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
>  	/* Enable SLPC Optimized Strategy for compute */
>  	intel_guc_slpc_set_strategy(slpc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
>  
> +	/* Set cached value of power_profile */
> +	intel_guc_slpc_set_power_profile(slpc, slpc->power_profile);
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> index 1cb5fd44f05c..fc9f761b4372 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
> @@ -46,5 +46,6 @@ void intel_guc_slpc_boost(struct intel_guc_slpc *slpc);
>  void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc);
>  int intel_guc_slpc_set_ignore_eff_freq(struct intel_guc_slpc *slpc, bool val);
>  int intel_guc_slpc_set_strategy(struct intel_guc_slpc *slpc, u32 val);
> +int intel_guc_slpc_set_power_profile(struct intel_guc_slpc *slpc, u32 val);
>  
>  #endif
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> index a88651331497..2351a1693aa1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
> @@ -33,6 +33,8 @@ struct intel_guc_slpc {
>  	u32 max_freq_softlimit;
>  	bool ignore_eff_freq;
>  
> +	u32 power_profile;
> +
>  	/* cached media ratio mode */
>  	u32 media_ratio_mode;
>  
> -- 
> 2.38.1
> 
