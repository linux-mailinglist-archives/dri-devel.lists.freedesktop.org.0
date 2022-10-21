Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0B0607BDC
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 18:12:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301EE10E3E5;
	Fri, 21 Oct 2022 16:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A00B10E3E9;
 Fri, 21 Oct 2022 16:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666368723; x=1697904723;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2Di6MkG9I66WRnbMiWTrSUpCmteJ9/ONLeel5xu+PpM=;
 b=MYchMCSAmfCihT9X6DQxUx6mW1+LoDfkpXwmE8hHvyntpG+PFGZ/19kl
 P+QZQk1wqXBfCCkJ3txR+AbCNPqMZgmHtUnV4+QDxQK+0/sd2Fo9oS0l6
 kP821Isox/9zjx05xyPHc84ds4/96oRr9QqMAHuBANiO3tdHkFeumbwet
 ec2Jyn7zhkN9yV6tFdTVusw8cLQc+3C52EmyGXr6QCPR0nmKRUuHUAO/3
 5AWZcr424WkerAaP7uUawkeN+KoHw0ErjVVGftgRQpTbYHF0f/X9HAYjh
 mioC3hshF8XRUREch+5hmcNjZi3x4fjXMOW0UEEPtd87xwPZF9EP4OhJH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="308725392"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="308725392"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 09:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="959693136"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; d="scan'208";a="959693136"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 21 Oct 2022 09:11:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 09:11:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 09:11:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 21 Oct 2022 09:11:38 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 21 Oct 2022 09:11:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T3J3GDwSIsg4eGaQmXU9biAvmS1mGyeZMDLtKbAsHDrv9tAKSjmbhjXMZGDsZ02UVDzJSu/IPacV89iK64aNk/X4oxiRJMRZf1AzwECr1AeM0j+y73lfZesA/K6V7JOGEkzKBXhgNZJcO2YGdZgwXY7Wt2JW4oopaBvCA0P2bVLTaCsgEzk2+J+AuKHNO4ZLWq9iFpMNK2bZxyjDvwYjdXQ9zmp6r+a61aBit/G8OkCv5riddYXrXID6zo8lWfwPAPBBI9LxA+q0cPiw1uzEycFWzxSTFAXSQRxzWraJFcJeu83frxTDGG0uIAJZwt9CSLzDCgyeGt7XKdfJt0wZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lHicNK4FVRpKkpIRk81lTueEC/2ov8ozcbKC2pCKJls=;
 b=LkQHQzcSU8z13O3J92SHuiLF9d/y4C/p2eKoGCur3NKKRfTn3oUzBXXaAk+d5Fg1tyrj6sFumuHdGMpUHKTVH09OsjiQw0iJZSWs3uCtJPBm72xqAOFDGxyfvJVDB0kAGH/5LWEhinZ0nWirfHWVqvgK4gpAyQQlmPPp7lPDKYDt0/gl6SromY7W2w+XRrgF14Gfz/XXEbFfM353dgFzKoh7361ejIuXxqU/yX5+KQE16fFJtZCI8kuUMx1usCOi5R4XWxAA1uT/94embvh27mpvDSeJRUDUejn8ZgbUmkgPmHtNQQ7rXVlg5YWjIG7pfhQkRHTh+6aMSqK8MVpeUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7353.namprd11.prod.outlook.com (2603:10b6:208:435::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 21 Oct
 2022 16:11:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%4]) with mapi id 15.20.5723.032; Fri, 21 Oct 2022
 16:11:31 +0000
Date: Fri, 21 Oct 2022 12:11:27 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 1/5] drm/i915/rps: Prefer REG_FIELD_GET in
 intel_rps_get_cagf
Message-ID: <Y1LEr6pVKwFdxsMx@intel.com>
References: <20221019233721.3270601-1-ashutosh.dixit@intel.com>
 <20221019233721.3270601-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20221019233721.3270601-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR01CA0016.prod.exchangelabs.com (2603:10b6:a02:80::29)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7353:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be30a2c-3284-42b7-bd86-08dab37eeae1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YKzSuPRLvMLcZfxhNTTlx/ugFg3GWU8PKnSMD5x6W/Ie6BSEI/BWEkL9dWtECl3H0+uNNgBG5WSN1e27OZZtdTC3n0mAS9ii557vkAYOn+gISlLEmagOXe3RpYOK7Vo/CYTuZj8W54a7bB6ENCeRnCnp/gRfzgpj2fJbdzlBSej+Cexy+37UO8bN1MhrMmDAqy86FEk+TBKrJ9Y70v5PEnUEmzMKIfiJ5/RQ4xyeFs+MvYkVljvtY5XXSH9CDOU4lEAx5jwsmne7eHpAmlFANZTFxwQuIUSY5F3c8rho5yWJpDjl4R5h5IrZ/pv9gJONvLbZMbMo59bQaeTA1J3IDP2FEiXD81vbjfEhjuQjW14VjOHEYOme4u6lwtHmzQQ5D7l3WUN1YYFoSHJlIDS4gCD6oL191dx8De3LCNNI5M92XsTrDlTnbIaavSNFFwOhccfpcjDVj0w6122qFIWLMEFSS/c9lKsViCgyae19MTAiAzC+Qvk1zPjSNlRSvY09ADJHCdCRf68aQW9FM+1u02gBQBDWEBRQtxaG3OPu4pdpXFy6Sgj/Gk88XSUTligrEV9pGXs1gmtjMD2H+UOgsmGOtWzl170ilb9AFwJ7wscaU8S5vwxten7cNks0J6G11vrelz20jOhz3xKY0J8e41+eKPuvpqu2s7gf3yWhS0wTsh0RME3dBCzsmnQg5/FaRmOwAnWziAVfch574hxVcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(136003)(396003)(346002)(376002)(451199015)(41300700001)(66556008)(83380400001)(8936002)(26005)(66476007)(2616005)(6862004)(86362001)(4326008)(186003)(54906003)(6636002)(450100002)(6512007)(66946007)(8676002)(2906002)(36756003)(82960400001)(6486002)(316002)(44832011)(37006003)(6666004)(5660300002)(6506007)(478600001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r4lB6cJxtc9MeEDkMqkWYM7ZrIfU/e2DtOEy/hhl63GDshzAU2NqCEEXx4yL?=
 =?us-ascii?Q?gcaEzPhsnBvyYmeiRSbQb5dj/8FtptdtPFydq+PDoEEmoUS5Dp7jRBe3mCZb?=
 =?us-ascii?Q?ibMgFLxwBthCjleDz6n1sTrJ5+6cXKrpncFR/TBSk7R1VbiinI9d94+LLlmg?=
 =?us-ascii?Q?meMZbIKHjv1YcxLoEuFVWMOjXZgzyv0j+lEAlEJzoM3hYKGbiyrfQwpHpmE3?=
 =?us-ascii?Q?kRvUdNh1VmHBH8f8BKCxENei6CirxJUnnpfjzHJtj66F0SYxXC+9jL/ZQX41?=
 =?us-ascii?Q?1F0Z5rL3+HgTUThqZJNSrSOFWZB/usF52v/OZ1pYVO+psdAJnrHdeD2xEa40?=
 =?us-ascii?Q?/RDbbYKw8wCUiwYNNQeV83h8XSVC55qc40wbIcu14RipMXEQmfNUpoIHY2/I?=
 =?us-ascii?Q?vIK6b3Z/QZlk/ey6X036cwQdPAlN8qYpjZ3zWA4kIFtvD1dHcVoaS51zYhVa?=
 =?us-ascii?Q?WpJvWZBd34QETPcJxrsWTzXlhQX5Qd7mGOcQyEIazTvlWDWsExDm88nTF/8a?=
 =?us-ascii?Q?H/2k/PJt8rEszFXYLpVJBweFeQF9b+K/70igTKzCUqmoDLMJ5kaj1ypEgqKL?=
 =?us-ascii?Q?REnzP5jWCa3DvwIYLDMnxAFtiyvUDSF2XLo4ZD4gczrKqLhV1ifuSZlaFWgh?=
 =?us-ascii?Q?eQNKR8bdUSE1xFic8pXCKGR9gfkQfZgTzqVF4pQDsNsOz3KLglowiU4hNc5u?=
 =?us-ascii?Q?wnRgd2fiatTOhVzgR0MVE2XNhN/TsJMDfetAsnQ1Dt8hpbtl27SwomORzFYr?=
 =?us-ascii?Q?2bpjbol4YmOwQvSwOyaJAXDnP7YnrmR/Pg35q4cvgnOw/XbheDpnwXHn67qc?=
 =?us-ascii?Q?tnibrDK0EE9xHNslh+SG9BLBHYyrsYYYCXKmT40V9HzosSTuwyzxYDTRBZma?=
 =?us-ascii?Q?kzszkONJa3exW1wTxW/oTm9h9o/2Dnvglq2UJk7//tucI7xGFVsCAjlPbULA?=
 =?us-ascii?Q?pwHSw075zmDYP6GZ36boxMm+4Y8JjqQlo3xgcHxP4NTczUiem3lgMnZt5yZO?=
 =?us-ascii?Q?RabSHwNBGoDuq7wVt/4I6NVV9VnQakLhpKiLfAkHEAGaYKsTEfhd+aRnUqlC?=
 =?us-ascii?Q?qRzu5l1ZcQnfob0ZQgj300zyrj+Ib5iaoYOhkiLxC7yd/2ooP7Y/sloQ7tKT?=
 =?us-ascii?Q?gfjAhj9cgPB8fcYLCWMoDnwcIm3lUJ5Ash42HkDEUmn/mmFL5WI3nVN4BlTs?=
 =?us-ascii?Q?KKE11cTS27FacBYsEj8Q0PJ310VaM5tTbYzI79P6XxW6plfdZU5abmq1HyQM?=
 =?us-ascii?Q?/571dScTKhmKZkw2E3e76c0EFJuvO717bVKE/tv3xR6fWfp5DRP3Um5ejI7k?=
 =?us-ascii?Q?GoQyZWlMikEC9BIlNCXaHl+TBPif9mqXus5RKuUpJPj6TCaQhTiUXZxUMxw0?=
 =?us-ascii?Q?pu4MJHjfbkJWwUytMADiyVRcDJiKcdJmfzBlH9NtxPXX6XhNI+80neLfJNrL?=
 =?us-ascii?Q?q5s6QkoLvbSNy60FcX1/fqgs+f5+SOyEVNTWpThf6yeaXBs+9Q/cIXnCPubB?=
 =?us-ascii?Q?x3AMJ2CC00Yn+7vFSf5/kTCb5iMU11UEcSP07KyFckvKaOH046UuiPhiq2qy?=
 =?us-ascii?Q?J0lMCIPrwTQt9LgI8tM5xFj418/j0hv62KW7R4bn?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be30a2c-3284-42b7-bd86-08dab37eeae1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 16:11:31.6759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Okbj5P5kwjfSbT93J+WzfUP3b8lVHAdTZHmQCD9wV+wOBi07BfnZ4DDBqzw1V7NZ084g1dm2FOc7EtDruBxXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7353
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
Cc: Anshuman Gupta <anshuman.gupta@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Badal Nilawar <badal.nilawar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 04:37:17PM -0700, Ashutosh Dixit wrote:
> Instead of masks/shifts settle on REG_FIELD_GET as the standard way to
> extract reg fields. This allows future patches touching this code to also
> consistently use REG_FIELD_GET and friends.
> 
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |  2 +-
>  drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 12 ++++--------
>  drivers/gpu/drm/i915/gt/intel_rps.c           | 11 +++++------
>  3 files changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 40d0a3be42acf..979e602946549 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -307,7 +307,7 @@ void intel_gt_pm_frequency_dump(struct intel_gt *gt, struct drm_printer *p)
>  		drm_printf(p, "Current VID: %d\n", (rgvstat & MEMSTAT_VID_MASK) >>
>  			   MEMSTAT_VID_SHIFT);
>  		drm_printf(p, "Current P-state: %d\n",
> -			   (rgvstat & MEMSTAT_PSTATE_MASK) >> MEMSTAT_PSTATE_SHIFT);
> +			   REG_FIELD_GET(MEMSTAT_PSTATE_MASK, rgvstat));
>  	} else if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915)) {
>  		u32 rpmodectl, freq_sts;
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> index 36d95b79022c0..35c039573294c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
> @@ -794,12 +794,9 @@
>  #define GEN6_RP_DOWN_TIMEOUT			_MMIO(0xa010)
>  #define GEN6_RP_INTERRUPT_LIMITS		_MMIO(0xa014)
>  #define GEN6_RPSTAT1				_MMIO(0xa01c)
> -#define   GEN6_CAGF_SHIFT			8
> -#define   HSW_CAGF_SHIFT			7
> -#define   GEN9_CAGF_SHIFT			23
> -#define   GEN6_CAGF_MASK			(0x7f << GEN6_CAGF_SHIFT)
> -#define   HSW_CAGF_MASK				(0x7f << HSW_CAGF_SHIFT)
> -#define   GEN9_CAGF_MASK			(0x1ff << GEN9_CAGF_SHIFT)
> +#define   GEN6_CAGF_MASK			REG_GENMASK(14, 8)
> +#define   HSW_CAGF_MASK				REG_GENMASK(13, 7)
> +#define   GEN9_CAGF_MASK			REG_GENMASK(31, 23)
>  #define GEN6_RP_CONTROL				_MMIO(0xa024)
>  #define   GEN6_RP_MEDIA_TURBO			(1 << 11)
>  #define   GEN6_RP_MEDIA_MODE_MASK		(3 << 9)
> @@ -1370,8 +1367,7 @@
>  #define MEMSTAT_ILK				_MMIO(0x111f8)
>  #define   MEMSTAT_VID_MASK			0x7f00
>  #define   MEMSTAT_VID_SHIFT			8
> -#define   MEMSTAT_PSTATE_MASK			0x00f8
> -#define   MEMSTAT_PSTATE_SHIFT			3
> +#define   MEMSTAT_PSTATE_MASK			REG_GENMASK(7, 3)
>  #define   MEMSTAT_MON_ACTV			(1 << 2)
>  #define   MEMSTAT_SRC_CTL_MASK			0x0003
>  #define   MEMSTAT_SRC_CTL_CORE			0
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index fc23c562d9b2a..5bd6671554a6e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -2074,16 +2074,15 @@ u32 intel_rps_get_cagf(struct intel_rps *rps, u32 rpstat)
>  	u32 cagf;
>  
>  	if (IS_VALLEYVIEW(i915) || IS_CHERRYVIEW(i915))
> -		cagf = (rpstat >> 8) & 0xff;
> +		cagf = REG_FIELD_GET(RPE_MASK, rpstat);
>  	else if (GRAPHICS_VER(i915) >= 9)
> -		cagf = (rpstat & GEN9_CAGF_MASK) >> GEN9_CAGF_SHIFT;
> +		cagf = REG_FIELD_GET(GEN9_CAGF_MASK, rpstat);
>  	else if (IS_HASWELL(i915) || IS_BROADWELL(i915))
> -		cagf = (rpstat & HSW_CAGF_MASK) >> HSW_CAGF_SHIFT;
> +		cagf = REG_FIELD_GET(HSW_CAGF_MASK, rpstat);
>  	else if (GRAPHICS_VER(i915) >= 6)
> -		cagf = (rpstat & GEN6_CAGF_MASK) >> GEN6_CAGF_SHIFT;
> +		cagf = REG_FIELD_GET(GEN6_CAGF_MASK, rpstat);
>  	else
> -		cagf = gen5_invert_freq(rps, (rpstat & MEMSTAT_PSTATE_MASK) >>
> -					MEMSTAT_PSTATE_SHIFT);
> +		cagf = gen5_invert_freq(rps, REG_FIELD_GET(MEMSTAT_PSTATE_MASK, rpstat));
>  
>  	return cagf;
>  }
> -- 
> 2.38.0
> 
