Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2C75B24FF
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 19:42:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FEF010E35B;
	Thu,  8 Sep 2022 17:42:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5E710E35B;
 Thu,  8 Sep 2022 17:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662658930; x=1694194930;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=cRiTKcyp8zALloJYiRXem1ZjkZQ3IcnO3yJ9KX18Yi0=;
 b=lXE9i1u9dB7Jr6Emgxat/WEMUW7HonXlB+s1FJgy7O5An8tfA5TILiHZ
 UFA6VdAs2PKd+vvfog6wQZeKhhY4wJD+4hns0gMKcE8P1jPMqDerVnXui
 ZB0RPWcLy5LlEjLTWQ1dAxthz0aXKjbvlyhygZCh3hsymEIQKxmNFMHZK
 c2uRhhvvBtvAfh2tCKPBsNIzaWvlFC1hi7BEs34Oy/CW736C/3yEH4aRs
 UvuUsiO3LYcijyGtbc/2ym/YnJwRtpvK5jd/2KQSTTTOj39g/GMk0rDI7
 vW02xxdG1gKbUl6193OIqFJWFVt9U5efgF+vZGRrKTFstj5llyPqUxSCv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="383568775"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="383568775"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 10:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="943445201"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 08 Sep 2022 10:42:10 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 10:42:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 10:42:09 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 10:42:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EWRB456MJIyzH98AR0MkTGlN3RZ1QkBzZlRcQzufgH8yCSND+/9jhT9In8L0zENV8TBwm6j5k26WpqMmtMVOQu4nG3sdgjjUE/IIEP5fVD/VYdQLk12cuYaAdf0vB9sM2+SAnpfLCorcSD63AIcx8HCwwb/5ai+BFi7Lr6dzPxa9ZWJzML7hXSWhWix5nFWKPb+DGUu3mfy/T3XTa0Km9d14bMBCyvOiE5ro77GnpU6ac9Mi+VT7AqYiLN1f5Pv2WnkkrPfj30PfQ0Lhk0FpeeumabL1a/vkxj0hFV55rOCjTwLhQKN95M0WG6l2oSvVJ7cy7mfDwMYYAT2tF7/dMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4xcCqGjZX6oJNo1gF02BlvdpRfNDM80qbRXP3KYQBjM=;
 b=HrwI0yo8+pDFSmaX0fu9QdqMLYL7U6jByAocVkhNuQZMmsHskW5KQ/g/UI0UKzbFz/jUJnx3aCaHk1avyF3AijVZvIfHJ1/Yyg8fRsCSkj1gbcCUFcWzdv9E1ICuTKSfaHO8E9+W2eaKpsQ5VeyYI0aDNadICElAHpXqmX/gOpAiBjn3P+9tEPZpIS7CCKOb7w52UaXSowJAL3WdHdJTdjry90Sj8S8iEil55DItjVOZQ6n05swt+sYUDyPSiLQgIiHtdt+LW1DvV1FW7DeltGt5mlgzrnt1AS4r5H+yWUy9iurld/4aKxwEygGd8dxDsfYNzM9lYvF66wR+DGzjmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MWHPR11MB1632.namprd11.prod.outlook.com (2603:10b6:301:11::11)
 by SJ0PR11MB4926.namprd11.prod.outlook.com (2603:10b6:a03:2d7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Thu, 8 Sep
 2022 17:42:05 +0000
Received: from MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514]) by MWHPR11MB1632.namprd11.prod.outlook.com
 ([fe80::ecc9:50cb:5951:2514%12]) with mapi id 15.20.5588.015; Thu, 8 Sep 2022
 17:42:05 +0000
Date: Thu, 8 Sep 2022 10:42:02 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 03/11] drm/i915: Parse and set stepping
 for platforms with GMD
Message-ID: <Yxopar5WYF5mTxRE@mdroper-desk1.amr.corp.intel.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-4-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220902060342.151824-4-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BYAPR11CA0060.namprd11.prod.outlook.com
 (2603:10b6:a03:80::37) To MWHPR11MB1632.namprd11.prod.outlook.com
 (2603:10b6:301:11::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bcca4e1e-6822-49a0-b12a-08da91c171bd
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4926:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9pZw3BOG3tkd1j1jRrD1K+O47Smj44Mb7xkVBhIa2J4heiB9Nc9yR0VG737VWGMyR5P/2WZRLmLzZ1JrOBoTbNr13SwcHtJVOUsNSoVbsdekghnmKW7fsli83OXz/sSRIYOgdjjyG8pJ7/Xr2VPvDY0HAzKx7nNOrCgGnQvgv4PF0+oqJggiYz7a+dwDGCnJS7n0OmrnNPSzW9lm9aHaYDw00ufxsBjQ9AqdTfd9N4b5QLvJlo0Yogg9RHt88H8/5iWdZJHTB0qzMCBhiizIREm/+JMG827AT+GFse6hAjwUZNuIE2PPm/QVgb/dL9dwdxtm2MATW2cRlLaFNhpx5no4vhgYlMZErGrid12dkST8zqYyRw+H3NGNZy8gMqPq108Sidfl2W7J4oOmAQ/sJzlLf6sMV5+Ik5N6sOU1r5A3BuiTS04QHMKNaGGjXR6/zkFc1pgEHGDmt/tJ2dYl3aVPM/gaZW2gR4F4T48h4jPeBGaRqPqjekCZzW+tEi5p4+1BcrqWshEyIpK4OXp25wmd+NKt0rH8YfXgOgh0CtqSk0QcunV88OqwU7X3kAcP6KZxdco07iXswbgbKl4e/bR6eD6TL2iVhFPCW2iPxA8hoiZhQZEuAnWBJs+BB1ku57GktlHIdG+HyfCQMbueK8Pxs3OWbHnZNbM9voSvIV+Bdjay6V2hok69Meu9gFJJNaxzOq0PNBqhguEYG2aGYQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1632.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(136003)(39860400002)(346002)(376002)(6486002)(41300700001)(478600001)(86362001)(316002)(6636002)(26005)(38100700002)(6512007)(186003)(82960400001)(6506007)(83380400001)(6666004)(5660300002)(2906002)(450100002)(6862004)(8936002)(66946007)(66556008)(66476007)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ErhcStM2IAgIlUAzdTwqkgJJR5+Lt9hbDbbK/WTSO/rnraNpnjzGs1qOtc?=
 =?iso-8859-1?Q?JlCI9moewpdvYrNbV4LDRsv0ycOjPhe+5WFo/DR8cUgrk7Ss7DBufQhR+H?=
 =?iso-8859-1?Q?cKXcmXmd3Pqwyo/vbgVzDwP05EF0ExTXQy7xSfQnUC3x40FbEZJ0woRU4g?=
 =?iso-8859-1?Q?ACjyxIM1lYTvr3PM2JFcZH5tNAZT5Mdag7YppMeTVNnwd09USy3qqx0D9O?=
 =?iso-8859-1?Q?HzdaMrY/eR2b5ydqjArtTQwTJ8Y6PCGNUu8TvhhwqQKTQ39oHVn9sIT2AS?=
 =?iso-8859-1?Q?VhYQ9sTHpl6SYVm6zaDET9CIDcHIDuqJJ8Rodk+GvUN9U0Nb1qm3uaBFSw?=
 =?iso-8859-1?Q?rh4e2btQ+6/v+mKxlkiZUfBbfFKLGPyt8WX5EDGkvNk0WgVHSGL231YYPp?=
 =?iso-8859-1?Q?XRZpLBP4Brty4xEo3fqYxP8cFbj3+U+EHRovK2NAzTbNlPya7VDzz6W+Wq?=
 =?iso-8859-1?Q?x2RAU4uFvZwdqiUjtWOYn9B9/FnVmmg2l3pM92yyHSRY2sn4IqkYYKoeOb?=
 =?iso-8859-1?Q?oHNsOcGCvMfy6nt3FXDCQV4TwFcOklcneMCJy7jroi/bWO+8WQIEydlW7C?=
 =?iso-8859-1?Q?R7WG/ChEB2ShQJHXsbbCMZQhLyO8KwC1VdBgVHA9/KKoxXta4v14OgsR++?=
 =?iso-8859-1?Q?lZ69+Zn/6Qo/kJqQz/dtFVB4OZxgzvV7KJ/j6f4gSh7Tu/rtpwnHNAboXo?=
 =?iso-8859-1?Q?MKRapb3JNPkum4cxox7vMb+dIEhAx1z2Qqw8zrwOsFshWGW8t2RJv33Kn5?=
 =?iso-8859-1?Q?28QLzYaNzuuLPwHLBCue5ncqXOpDr5Xidgd45k/PwSPbTJjhEk7D79ql1D?=
 =?iso-8859-1?Q?fvbU2cv4uksetAohn7NH7ZwRqN4IDnFVPW9M25yPidV4e4hIuCBOVLAmic?=
 =?iso-8859-1?Q?MjhDGZWVStWzAfMM1sL0iQjoFcOsufW3TvAay6fdgyNWIrrIQ9xiHZaPQ3?=
 =?iso-8859-1?Q?HvphpUanqxrlFeM9BjltNGWkQk/0qrJajDQ3CSkkNclQ9FmPXQz9ogIOF6?=
 =?iso-8859-1?Q?D4US51zV0mEcWcGCETHzqsK2iEdJq1GRimnjZnRzfrw5luKLi2L2mqERy+?=
 =?iso-8859-1?Q?zmHkXqigNpW5n+V8/94c3kUzqAMqO7nEUWtX1AQU3C/kpzLUuNfjetMwZp?=
 =?iso-8859-1?Q?iXTjLvVQ+Qu/x9VIK5hniPXfvJ+VSHNtTqrEpDTFm2H9xOmKbjXjUwjM1t?=
 =?iso-8859-1?Q?1pkbI1ZDsEZYbMSFE3XNmLAelGz9shA3aS6Ow58JBZ+cCL3NmuvNjpOMEE?=
 =?iso-8859-1?Q?If3Lr/J9TV857bJvYm9ffsScJ8ktSEwwUkWOd4HjWqjdtEIGZ8yVVdx/4r?=
 =?iso-8859-1?Q?Xm8jAxht0ptJsy6zIGd6c1tkFPYcbMBR8/TqaTrdHfc73rGMHkEJqBVAz/?=
 =?iso-8859-1?Q?eIn4Q2NfQf4FMgtQd4xmkeattwqZbCaTLv7zdOuzgaMithYJ4MPBG8yDNl?=
 =?iso-8859-1?Q?Iv2SOfrir21EyjJMyL+adcl/zzSMh7hi78l1LBIUevfvOsSwfCx/8XLO+G?=
 =?iso-8859-1?Q?++SlO5LuspA6e6T6xNP0NdPXzmrjTMcmoZFnGPRYoWaADcDRHoVZaWsLzc?=
 =?iso-8859-1?Q?7yzD39/XsbvMmGwAg7DIrufB/h7a+xZTa3ugxl1GmalpH4jwQQaUv87pUl?=
 =?iso-8859-1?Q?MgTnOAkEFdH92gjRuOU0OTTY88Wo1avJ8uJwT9m734OMYVclwGh8IamA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bcca4e1e-6822-49a0-b12a-08da91c171bd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1632.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 17:42:05.2912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4lgBrfN2g8IoumH7EOjFMLaIUT/HfLZKdNa87dttl88U9aVY4MugPSHSaQzMNOGiTVbI05PuGUsn86MsNwGlcfrXz9GzqjsnGN9aIdgsoO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4926
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 11:03:34PM -0700, Radhakrishna Sripada wrote:
> From: José Roberto de Souza <jose.souza@intel.com>
> 
> The GMD step field do not properly match the current stepping convention
> that we use(STEP_A0, STEP_A1, STEP_B0...).
> 
> One platform could have { arch = 12, rel = 70, step = 1 } and the
> actual stepping is STEP_B0 but without the translation of the step
> field would mean STEP_A1.
> That is why we will need to have gmd_to_intel_step tables for each IP.

The (unofficial) claim by the hardware team when GMD_ID was introduced
was that they planned to standardize stepping numbering going forward
such that they would leave space for up to four minor steppings between
each major stepping.  I.e., B0 is expected to be 0x4 on all future
platforms, C0 is expected to be 0x8, etc.

While I'm not super confident that they'll actually stick with that plan
forever (e.g., what happens if we wind up having an A5 stepping
someday?), it seems like we could at least start with that as our
initial assumption and write generic translation code for now; if/when
we encounter a platform that deviates, we can add a platform-specific
table for it at that time.


Matt

> 
> v2:
>  - Pass the updated ip version structure
> 
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_step.c | 60 +++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/intel_step.c b/drivers/gpu/drm/i915/intel_step.c
> index 42b3133d8387..14ea103d6dab 100644
> --- a/drivers/gpu/drm/i915/intel_step.c
> +++ b/drivers/gpu/drm/i915/intel_step.c
> @@ -135,6 +135,48 @@ static const struct intel_step_info adlp_n_revids[] = {
>  	[0x0] = { COMMON_GT_MEDIA_STEP(A0), .display_step = STEP_D0 },
>  };
>  
> +struct gmd_to_intel_step {
> +	struct ip_version gmd;
> +	enum intel_step step;
> +};
> +
> +static const struct gmd_to_intel_step gmd_graphics_table[] = {
> +	{ .gmd.ver = 12, .gmd.rel = 70, .gmd.step = 0, .step = STEP_A0 },
> +	{ .gmd.ver = 12, .gmd.rel = 70, .gmd.step = 4, .step = STEP_B0 },
> +	{ .gmd.ver = 12, .gmd.rel = 71, .gmd.step = 0, .step = STEP_A0 },
> +	{ .gmd.ver = 12, .gmd.rel = 71, .gmd.step = 4, .step = STEP_B0 },
> +	{ .gmd.ver = 12, .gmd.rel = 73, .gmd.step = 0, .step = STEP_A0 },
> +	{ .gmd.ver = 12, .gmd.rel = 73, .gmd.step = 4, .step = STEP_B0 },
> +};
> +
> +static const struct gmd_to_intel_step gmd_media_table[] = {
> +	{ .gmd.ver = 13, .gmd.rel = 70, .gmd.step = 0, .step = STEP_A0 },
> +	{ .gmd.ver = 13, .gmd.rel = 70, .gmd.step = 4, .step = STEP_B0 },
> +};
> +
> +static const struct gmd_to_intel_step gmd_display_table[] = {
> +	{ .gmd.ver = 14, .gmd.rel = 0, .gmd.step = 0, .step = STEP_A0 },
> +	{ .gmd.ver = 14, .gmd.rel = 0, .gmd.step = 4, .step = STEP_B0 },
> +};
> +
> +static u8 gmd_to_intel_step(struct drm_i915_private *i915,
> +			    struct ip_version *gmd,
> +			    const struct gmd_to_intel_step *table,
> +			    int len)
> +{
> +	int i;
> +
> +	for (i = 0; i < len; i++) {
> +		if (table[i].gmd.ver == gmd->ver &&
> +		    table[i].gmd.rel == gmd->rel &&
> +		    table[i].gmd.step == gmd->step)
> +			return table[i].step;
> +	}
> +
> +	drm_dbg(&i915->drm, "Using future steppings\n");
> +	return STEP_FUTURE;
> +}
> +
>  static void pvc_step_init(struct drm_i915_private *i915, int pci_revid);
>  
>  void intel_step_init(struct drm_i915_private *i915)
> @@ -144,6 +186,24 @@ void intel_step_init(struct drm_i915_private *i915)
>  	int revid = INTEL_REVID(i915);
>  	struct intel_step_info step = {};
>  
> +	if (HAS_GMD_ID(i915)) {
> +		step.graphics_step = gmd_to_intel_step(i915,
> +						       &RUNTIME_INFO(i915)->graphics.version,
> +						       gmd_graphics_table,
> +						       ARRAY_SIZE(gmd_graphics_table));
> +		step.media_step = gmd_to_intel_step(i915,
> +						    &RUNTIME_INFO(i915)->media.version,
> +						    gmd_media_table,
> +						    ARRAY_SIZE(gmd_media_table));
> +		step.display_step = gmd_to_intel_step(i915,
> +						      &RUNTIME_INFO(i915)->display.version,
> +						      gmd_display_table,
> +						      ARRAY_SIZE(gmd_display_table));
> +		RUNTIME_INFO(i915)->step = step;
> +
> +		return;
> +	}
> +
>  	if (IS_PONTEVECCHIO(i915)) {
>  		pvc_step_init(i915, revid);
>  		return;
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
