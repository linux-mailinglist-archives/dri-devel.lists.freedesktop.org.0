Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8E2BD503E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 18:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D0010E464;
	Mon, 13 Oct 2025 16:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H4OSjRfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15A010E17F;
 Mon, 13 Oct 2025 16:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760372836; x=1791908836;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=0ONJoUgO9ZwletoxvGtn6IA4Gvuyhqgg4cvobMpYuQ4=;
 b=H4OSjRfgTMQu5ti3sbYLKJ/V30vYrhAEc/LdX9OGiy/MHbAMyStzob1y
 KF8CsAnuWYKqkCxC/2symNGuwT32AtIZyBwIpToe/xmYNZh2HjQN40XwM
 f86cHyeVYPOqqGxG61QjCZPP9zOn4MarhjnF0IRMN61Qo5qmQwNwEovtk
 fvGIh5GvwprZ04mX0++lEmOi5BGDoOK9++2tCSuu1Dj1Y+2MbZ3UBOExd
 09YNpuh2fQiEQ3Xnt50Re7lUZMHrpjMDIApF5LnSFbrl++dlRBOv40rhg
 I9MNSlw/egE9Wkg26q2FmElErvqQaMhTQSNj058ipkE4YtF0DHmpPMW/M g==;
X-CSE-ConnectionGUID: /e0FDAwQQtqA8+yA5tAIxA==
X-CSE-MsgGUID: +kdhJtYJTyqctq13dRzrjA==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="87975585"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="87975585"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:27:15 -0700
X-CSE-ConnectionGUID: omK50NU/RpyVNLoO6s9jAg==
X-CSE-MsgGUID: D7PCjyfmTdSCvOy66eK/lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="185903428"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 09:27:13 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:27:13 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 09:27:13 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.4) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 09:27:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ftU+hbK8wJ+lUji3Dk2PGdaGNurWXvb4Ra+6fAb1mKEVmGT8ihIUhQQVplnZmer7zLZ+gV1iBD0w3gf4HWQKrpwI5zI6ca/iZRj+wpG/6DwJ2/p8yIDgGqNQTyhzayfK+1zsS4udDmhxfKJ1QCPjKiocSLcnAypiERr7ROFZmjdiTCCiMkETUVnTyquUwfgtQ+21awMtKwVfGYUuky9ZJ9nveg9LWe7zRjL0R6ztFZCuockobrq9t2QlZijR7Am/lCBOEsco7brRjoyx/Q7Y+gs+0pbWeZj9mliwIMKjQND9tbyIVcfOHf0Dd33eLRBo+HBhCZKAge8g+nyXfHtyqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mVfJLpmWoatyohxVE7POIsrvkQw8hCLMzRsyVlKPgao=;
 b=jOsidhOOkb5W6HzcekemMeGFzi2UMqEqwclDYcegMmDFyVR8gR0If2v4OseGtrpa889BhyZ1DotmVX2myGXTZfCyrQTjaFSASIagLVZ2cBUo86ZkyVWyhCFd6OJBsnzt4IltaTdyzvYElCT7H73yVKGw36pPbBVIXhgLTQ5aR0UzDPDtTcR/8b8w0UThVF5y+pjrpX2P17rTBHVOF+hNBJ3xdKnIyhkF+aWxQTrysP7CUz6h9ZnbQwMlLcPKmm3gPrWF6kRBgLrnFvo9ba5FjSrba7vBfAvYvKzSsgr1EEbmCkvX0hkp5MVFFxMmYeTC3WpjQsB8uFqHDC4rFU9dxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CY8PR11MB7108.namprd11.prod.outlook.com (2603:10b6:930:50::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 16:27:12 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 16:27:11 +0000
Date: Mon, 13 Oct 2025 09:27:08 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Simon Richter <Simon.Richter@hogyros.de>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/ttm: Avoid NULL pointer deref for evicted BOs
Message-ID: <aO0oXPwaRa3RfmCU@lstrano-desk.jf.intel.com>
References: <20251013160311.548207-1-Simon.Richter@hogyros.de>
 <20251013161241.709916-1-Simon.Richter@hogyros.de>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013161241.709916-1-Simon.Richter@hogyros.de>
X-ClientProxiedBy: MW4P220CA0004.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::9) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CY8PR11MB7108:EE_
X-MS-Office365-Filtering-Correlation-Id: 23e41155-cc50-438e-7f29-08de0a755cac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?h5Bw5KNny4ZPeg6VxD2CSw6kf23H7MuwrxJcgBuqop8rtslHkl7V8Jjg8Ceb?=
 =?us-ascii?Q?THLK/AaB0XA7/Ajv/1TvYOYUMW/X8s8EicjXCSmY0xPEUuwK6NoVOJmPn/t9?=
 =?us-ascii?Q?95UDPB6iH6WUhWryEuWGncf7ycjA44nDbmNGDs+6qa1VKzfCjCUEsi407VKp?=
 =?us-ascii?Q?d8Uvc2WEH0CfANIxmq8jsyav8a2IHL/TIA63RwbvkW/vmMWF8dqgOFdH9DF5?=
 =?us-ascii?Q?DMROvqhWA9skXHf/Oui+YCV+/8p3arGqgQavByJVRRaDcNrn9JscNRpXCnHW?=
 =?us-ascii?Q?LM63ayiM8+NveJwDV/3SCpiV7UQnWF/jY7NeMEf2D51AHg3ozoM15yX4B36e?=
 =?us-ascii?Q?fw8EhqkgnKQwZNMLi33wKr6PiQs58HGdd9rZh+toP2cb+I4RVoy7lz92y+A0?=
 =?us-ascii?Q?cNwuY9kMw72OPJskx/AIzR4FfKfl11OIIc9cJMSf2k5AJRHXpCiLnah3a5Vg?=
 =?us-ascii?Q?PVbBmQv1VNczZil+3od3nXp6MsER5f+WUJCmY5g0YovJFNUdyJIyH1GyrSZg?=
 =?us-ascii?Q?NHKqW0BzIfdree557CvZrkceM74PMbQGDaE05YircUcAWovBfIisuoX3jBx3?=
 =?us-ascii?Q?+wS7LZnK+JPMV5i1Ua0DN6ntiQSrqZSdrddCNss68QSWlQShqNlgxfkkutDz?=
 =?us-ascii?Q?53C966n4cNE/hrfL1o0lkq2v1glSZAEMZlgLWfOi6BCZ4itama6p9m3Eq0Za?=
 =?us-ascii?Q?dGYdGRX/3CfHpbZC3ih03Xa7uZMks4BAeDMvgXcuKg313yCrOt/pjFnm6eXC?=
 =?us-ascii?Q?LzGaNM1X3NlWJ0T9lBa+oBuIveaS5ikP7Yit9SzLrIyL/Ilq1zyoDFELa/eg?=
 =?us-ascii?Q?WPB3lS2iMRUaLHkmxS1CsUVee1h7p+L+FF6p7EMFM2qUzcr+ECBPuB/jGM7v?=
 =?us-ascii?Q?jG5+Y08Dx6j0ukYheeJQo+P6DoDUlyvAdKBOtGEpdRtetR8FdD+kxQsCLdCw?=
 =?us-ascii?Q?xNsjPy1IDkbwjXXqzlX0hlgHzrP9p4HSW3Rci2PLoYZv+mZhhYSlfyK0K5fD?=
 =?us-ascii?Q?r86v1+vAfQ8BMT4yYfWptLK8tomn/yA3y97HF5u1Y/+8fbbNj/3UbciXtr5R?=
 =?us-ascii?Q?Z7NkmVkq6u8rgTjcvhqMZfZfdqzvp9YVsWbdelDnQJqbvCj/fgU4WUai+KKD?=
 =?us-ascii?Q?EznASuicbypsDprlu8/jWmrVucEUkImozQahLNE5nkMWTbdCjptMX/dHvp2y?=
 =?us-ascii?Q?VmzmiRQ6X9W/ESpt2gLfv3FgAiySx12K48WIyiC2tx+6v9CzLoTr3ygAmJKS?=
 =?us-ascii?Q?tCWGLWjxjRisK2ZElzmce3e9caRdXbQ4LDoBK1PWxZ0+8rAgDuUhXyZaJpE1?=
 =?us-ascii?Q?fl8YzkWXhrjOYdYLXQmSTsj9An64fTAHYMcZ8kgh2K5YAu/HyR0h25EIhjxI?=
 =?us-ascii?Q?YTYLqPbjYvjdsH51b+pm2ZsptxQWvYZ4UCUv8SEmZaIGwU2lNg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wDLNoyGvFuSgC2uqrk50Cv2Kl0uQDojW9lNlh88tI+qzVdNsljEdsF8IP5HJ?=
 =?us-ascii?Q?yVbBxYXGAj/hUPVqdngJsTOv0zTzdnOY08j9CYG8hKKEHlcaPW3IDwntWRsJ?=
 =?us-ascii?Q?YRNRfSEupHuvMsjYUCoTi+NDtSS16IN4JaaLCs2T2phGMqbw9eAnRpwYPICn?=
 =?us-ascii?Q?j+jZG/2zdKHOaxQcO/NBjHANdtxYnIYPG8g5kU53pknmNcVs3bQavFqkA2Ql?=
 =?us-ascii?Q?qR70ZOhPdC8X7eoocXVX66F6uD3nnBzqGIpy7KgJL4/sloX0AqUWrpKEDMGL?=
 =?us-ascii?Q?SgDPAvRBjmxB8WyeBYGcOcE4e7N4QkVVC5CyqWHOFXMjfEoXUVPRUVS5lrhS?=
 =?us-ascii?Q?7PDIdP0UAjIXhww+o3n/SmZhijGyzmdy+8qPywXiUEmM8vloQjkA4ks+RrwL?=
 =?us-ascii?Q?qTQoxViU/bnxTNGQDJ5pKS/LATQzCQzJlGUvDKWJW6lH3/avGjTe4HZRRRoT?=
 =?us-ascii?Q?YBkZGC3TKbl3tT0TUvAKt2Cs/0/ik0Cle4jepvkAkdEZY5BOae4lRWcPs7Vh?=
 =?us-ascii?Q?YlYvnM8zH5TpghyxgEgRq9TZHosz/hN+uxw0wudcIfVaANCX8q96GFsyETX0?=
 =?us-ascii?Q?CaRzSXjfSQq3UqRkTTln7koFhD5Pb/z6k3Xc+l/PosICuL3F9YGRYe0L4uql?=
 =?us-ascii?Q?A9eL2iFM/5h8HKoGgu9jsGbEHTRbnklXRFx+NzzqbCuOtfkR2zWwgH3x9dQg?=
 =?us-ascii?Q?HqABITVvMFHpfZhbZdFvo53JKbd6OuLoCMRE6m2CwRVWFW/Rw0klBBx7ZR8A?=
 =?us-ascii?Q?MDFwdEP9XCI7Z/U9WniRf18fg9guq8eRaMUeZjZ+kQq5BiK12xcEdYlBN0PB?=
 =?us-ascii?Q?hlEVVRm4yToPFBnHsVw1B2fjaACAny3JlxbgMfUIpuT08ntg83QUKMLu/fOn?=
 =?us-ascii?Q?H5HUpKrKXatoc3umgdgKN2NimgSKzGgKfN1lS7uyCjsI8uXP49NqAV0wHvau?=
 =?us-ascii?Q?vYDFvmgd7pd+WdAFzdx5mPi2ZOjG5Gecdf5wOemuzeADjzFBGnNRvx3mqDQv?=
 =?us-ascii?Q?4CDr3ZDWuEvEAbsuN9Eiq16Ceip4heVU97F6J/EVCgB6mu+t9inc3KFYFCnj?=
 =?us-ascii?Q?n60BcI8RnWmsxZuatGH/GcvyVWE5ur001aFmZrhIbTeEdjJJmYTBNjNIVfuC?=
 =?us-ascii?Q?6VQgP6U8TROvqvlNaFxTptaFcilaC+OOVutEOrGCQWt4Ocs6H3ig3ZLUHiBB?=
 =?us-ascii?Q?u3wbrlQQhb9CUZuM58DEMKidQ+kO7nMwJfMH2JDg7+9m74IBYrTrb1qhBPTu?=
 =?us-ascii?Q?AoTWRSdG6Vrx1IOgClXFJk7ad+8F2QT1NBpwAwgPlYkJgxNHz30iir1WTdDi?=
 =?us-ascii?Q?z5B8WXdYnhe+EyPWZPNZoFUxrXW3sdSx5uzWcXt/3d8ien88miICOZwqqROQ?=
 =?us-ascii?Q?ydHP0kz1pEDkBpeCDR4P3PreIL7AVFVrz2hiU7Cer+g75KWklbC0TmElYhnk?=
 =?us-ascii?Q?r9V1KbBUZ+hUqXkpLnsdxapn9BFVcvN9x8UYtT4fmELVMNjrZWA9cbVYMQvR?=
 =?us-ascii?Q?W9j2YD5wkYQIUKKX3dO9T4XuTpK0MhUSeNwPgaoNad65Bd47+TZHZmgSRrd6?=
 =?us-ascii?Q?CZSeRoSwhNZrfIoC4VrzCerUnnZYb+YFnXTbMM5IY+zSNZGR8hVaHIMHcKfH?=
 =?us-ascii?Q?TA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e41155-cc50-438e-7f29-08de0a755cac
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 16:27:11.7254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDWDEFnMGePubnxrN63jMguH/NDFyYPkeZVqYTEd9/qEwEi1Fvt3Jo/xzyPizdpiF+Q3rTRXm/uWnPjtCmI9dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7108
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

On Tue, Oct 14, 2025 at 01:11:33AM +0900, Simon Richter wrote:
> It is possible for a BO to exist that is not currently associated with a
> resource, e.g. because it has been evicted.
> 
> When devcoredump tries to read the contents of all BOs for dumping, we need
> to expect this as well -- in this case, ENODATA is recorded instead of the
> buffer contents.
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6271

I think we need a fixes / cc stable but I can add that for you when merging.

Anyways patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> Signed-off-by: Simon Richter <Simon.Richter@hogyros.de>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_vm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index b47020fca199..a101ff95b234 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -434,6 +434,11 @@ int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>  	if (ret)
>  		return ret;
>  
> +	if (!bo->resource) {
> +		ret = -ENODATA;
> +		goto unlock;
> +	}
> +
>  	switch (bo->resource->mem_type) {
>  	case TTM_PL_SYSTEM:
>  		fallthrough;
> @@ -448,6 +453,7 @@ int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>  			ret = -EIO;
>  	}
>  
> +unlock:
>  	ttm_bo_unreserve(bo);
>  
>  	return ret;
> -- 
> 2.47.3
> 
