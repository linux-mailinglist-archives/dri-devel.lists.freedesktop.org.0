Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFA96CAB2D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 19:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B258A10E38E;
	Mon, 27 Mar 2023 17:00:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FD310E38E;
 Mon, 27 Mar 2023 17:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679936401; x=1711472401;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=lc/Os+Cab92Nlr6tqmXSSWS23q5sASrcLlVf7GOlawU=;
 b=daMJ8Is3WBZf5tOikEn2GPeojLm0Mp0ysQW/Is6AuYHPDzLBrxf+CCVq
 FuAR486WNrnN+uC63+TTckbRJlKkct794tGxkfg5XI2Fv5Jx70VrFBQva
 CS4cNJbTs9bzJ/vjds9KXEyFavwiYPZWCSuGyJbV9a4zQ5OFMxq/DvFJY
 7WVeuIN5sS875u9r7hvWGphZ3kUZQgKR4VB7tJ0gYrPtn8i6mExniUPJM
 scpGRZg/XImKR7wmS/MsB1tCwUCAPpoeYcdU6bMFd0kb3+VYo64iHO5bt
 LnUsfJeBsXSMPmNLki57xd1UlH6h7qIkEJC17xBlmDZyHzoX5sFHmtAAL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="405256098"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="405256098"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 10:00:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="772786449"
X-IronPort-AV: E=Sophos;i="5.98,295,1673942400"; d="scan'208";a="772786449"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 27 Mar 2023 10:00:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 10:00:00 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 10:00:00 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 10:00:00 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 09:59:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rdd2KME9J4zQ2gCF7X2bUtmtZdj6ubtOWRbCu174tQ2NNOmn9eHfUZEh+2H8oMbLZduvzbSf2W8Ex3oJrKjYAhM8/CamBOP3/xRwrb+GniW/Bz6iH6Md1W81+32y1wW+m7gR2U6MM8d8fNQXr26Iww3lzk4Rg9nPSLkOgMKNy68amrDJAWunjqU64OCT1xK3vbpUcEm0bbv5QJADz4eU9tUAa7kUPXa4CAUt9vn2apaxVZyaFi4B7IVlloQlf9a2I9reO+qQnsRbqvAVIxaZtN/WuObdgHtIk2foo2z8U2lfNUYaNBB7VvIavy2WpRdMdur7kMF4siSApvgETrE90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9AC+B+slXwOS/PHHtRT60YDLYTxPyVHfyAn4z+KruOI=;
 b=kyPqS++X5YBQoqrgvG2r+NYFrTTI8nGvOIDP4FWPTX66wsDzJ2wtC2doALDShk7zQTRogGmw4Q0snPjGUptdIBV3889J7VrC6rt/Ckw71s4WfCbPxxBR9293dLy+cpFySkh2YYpbLqHb6FUU9nO3CbHof0/hJ1FCvrKpEqwabMLzNempB/1YlWMoBSLCpLaKETy67cY1HgBNw1nx8SEqBNcNz0lNiF4jp/r4OJkBGRmW5xy1pKGxmc6l56s6ZlmrqobvCoftDWGksmXxhPm+X1cISYVPrK9e65fp7DX97Q4xHOjSWLIpwdxAei5iCsQyxhC6gW+LOA0QUYBlSuup4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB7373.namprd11.prod.outlook.com (2603:10b6:8:103::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.30; Mon, 27 Mar 2023 16:59:58 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%7]) with mapi id 15.20.6178.038; Mon, 27 Mar 2023
 16:59:58 +0000
Date: Mon, 27 Mar 2023 09:59:55 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Remove unused revid from firmware
 name
Message-ID: <20230327165955.GI4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230324051754.1346390-1-lucas.demarchi@intel.com>
 <20230324051754.1346390-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230324051754.1346390-2-lucas.demarchi@intel.com>
X-ClientProxiedBy: BYAPR06CA0021.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::34) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: aeb67238-2ac3-4f5c-ece1-08db2ee4b219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AwvCU8Dejy/GUBFWUyezCWrklP0DtkdOAn/IH/M5bgHTcP0ZATwz7AuHcTVQf/bBHfX2qb+M/FU3/y3vI8m/ze0A5QpaKI2FwoMEp9TRLZ+/bFq/3/4fIETjbf5JyEjNnPtOZQrshABT3/5QRbo0EymBQ5WZg4lDOxaFOlquqaW7H8483oBUmjBYF4rsuxawTr7g2OTaOAqMwg+xc9iHMZOn00cQ1daBCYzuEvIYe38CpzoisUxABZAaYX0iaDK1crE0sI7FBvfVjcaB1CUVFDX66BqJ9xMY/k/CMqKRzedVy/yauAR+jCcNSfQmqBqqit3IVdzue8wz0geks5Nwf5L+MJsSxPFRWBTnKzjMKA0ZB36S90HYkgbWZdwUda/pVIU8Eas9NuMgcRrCKeNCWQzBUHMENrbmvT7qSYbJUXtE05pLeVUPxN/56v+Xn96rwNjZIt+TGP/mIcz3syPOT2UBjWlAGdbEoEsbSTA6pSTpyZ7BNjyylmA75mERkZYcROlG5dnpCrudTV6lXtpM2WzZ1YrPCHtucLFY5AruLqilIwQh8bap84uMA49/TkCf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199021)(26005)(6506007)(6512007)(41300700001)(1076003)(186003)(6666004)(6486002)(83380400001)(478600001)(54906003)(6636002)(316002)(4326008)(38100700002)(2906002)(66476007)(66556008)(66946007)(8676002)(33656002)(82960400001)(86362001)(5660300002)(8936002)(6862004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z66mNSgFovZuRpidH2rzW1OWfeRSBhW8xZLQfpeW2X5JfWlcnb79Yadv6nW8?=
 =?us-ascii?Q?osRkebBMiQcutwNvNBOJidRHRvLbX6l/THER6HuyILX48PblM5nXWvMpT/6l?=
 =?us-ascii?Q?n/nhsvMpBLho3IXck/J1FT7m4VvEMZmm3prcb7fhbuv7nmo7PXNDm2/+5bYa?=
 =?us-ascii?Q?ZuFEyKxkUIysk3LZ4xtYlOGl9lDjyT16RcTPKaFrwgzMB3Fy5wP6RpZfjCrM?=
 =?us-ascii?Q?dInvrsEftvULwEfkrNQJOcnVkeGH6kkZvfgZYtcLOSp0udEVtmRzLIAr/xLP?=
 =?us-ascii?Q?FRPXzjDWCKTanJJVkLhFFUCaeKelc0fE2ck6BOv2O0ptvZMZKDDeiy08MzFs?=
 =?us-ascii?Q?dTNeM2x429k56SEp1M1Qr6aJECiVxDJOtpuRmNKETXS9K6nmG0QBEBdbcL8Q?=
 =?us-ascii?Q?U/SnxgKqX0FLqQ39YubpEFHZl6jNr+9SjTf1yH7CcGouk96Wap7P4+9SODxq?=
 =?us-ascii?Q?fIWYjKJw+taxcvBKXOkBl2J396DR/idegcGuTWYMUJpDOsm4V39Yk+Ep7Gqq?=
 =?us-ascii?Q?J+5VHZMuXuxed07yMFA+R+v1iXWPPa2X1eMD3Iv6KKh2qv9OJtjuQdQYfL3j?=
 =?us-ascii?Q?i469egDVR145YaeAURi+z4u3QYjpmsABCU5Vgh4ReARLMW0U6YrdqEV9o+HE?=
 =?us-ascii?Q?sWPb1BjPBiBkWSYNbCxzBWTxb3eYL5PFPui/q8lL4Pn/YADf1g58b4Ogf8P2?=
 =?us-ascii?Q?3gqboiWiEl+tcE+DYZuOrk0u2mrqtJE9hpSqo9bm+pXJllacyo34KPKQnGYF?=
 =?us-ascii?Q?Bpw7DJGVR+mxbooQ5FGYA13ieYt/K1CY/YUz20zNZjmQ25L2O1YRyR3p+KN5?=
 =?us-ascii?Q?ydSHJR410UPtbkIA3EqJV4Oq0T6Bzcfkm9s6VIGEYK8ZC4c+nPBFYY6pKy1g?=
 =?us-ascii?Q?71GQDH4K2xy4Po1RxHw6u9NFpVgdb29Ct2T9tMJmoYXRm87IDZDbxuVha+6a?=
 =?us-ascii?Q?HPgYu4WmqOEo2ooHh3s4oVsZ00UO+nzskVg8apj2bLJx/k40VFwqUHjTxqGo?=
 =?us-ascii?Q?uLw3k9Qd50Kr3Fyt5TXxuskc3JGwPkEy8peEtfke8ubJDY8x4XI1cfVDC81k?=
 =?us-ascii?Q?yAp9bnskXS8imwHq2CPK1I+jRVYOai5gG/EYcdwav+bydOyPjosb7AGEEdQV?=
 =?us-ascii?Q?5LrDqa0h7i+ekat/z6hfLVBL58CwRYBecU2iZXUfrUIOKVsZwFfc9GqCVee6?=
 =?us-ascii?Q?5XtAXifw7lZchDCBdi+GmEBCpMBUsbGknujzweMV3JyKl8d35+NigmVg2ANu?=
 =?us-ascii?Q?INsvTrLQiG8mAlLhMRiD0AuTgXzqYMsKlI9DLB+J7xzhjyGQz4xGOV0iiLYR?=
 =?us-ascii?Q?VnPbgTbG0j6LbCucLt3hszUMELX24OSdN49VFJR0kwQbnaGcnnS6VB7+gzHG?=
 =?us-ascii?Q?7Tv3mbl0RVofQ1OkLjpcA74cwJcNnxUrhAcbodaoHAz3qEhbDXm7X/Dr6tlL?=
 =?us-ascii?Q?H3utoZcCL30vtPZfjLj1IdOH1TPLGvk7vOSVdAJflLxazDfLe/NzoFFxjCkE?=
 =?us-ascii?Q?ZBOHbxgQf4DP/IuhX1ttijuUNc/TGLubNlu4OL6MN5wLB6gkjuvKL0Mp8TCv?=
 =?us-ascii?Q?uQetJIfYK6Vc5URsbf3SgsgMxMzrBh+kxw2XP+lVp32e3p4u2HuBxt0k5t0v?=
 =?us-ascii?Q?0Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb67238-2ac3-4f5c-ece1-08db2ee4b219
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 16:59:58.0084 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSyxAU7MOgNhab4WmpMdImQmm3xnWGUaZUVkNqhn9LR1i3pCi35SS6ohsXfcv9Y/BNRXUOQHMvpX0UNjuqr6O9DZ/AQLKiCofjZSGhKCFtQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7373
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 23, 2023 at 10:17:52PM -0700, Lucas De Marchi wrote:
> The rev field is always 0 so it ends up never used. In i915 it was
> introduced because of CML: up to rev 5 it reuses the guc and huc
> firmware blobs from KBL. After that there is a specific firmware for
> that platform.  This can be reintroduced later if ever needed.

I doubt we'd ever need the revid again; more likely we'd want a way to
select different firmwares for a given subplatform (which is something I
think we need to add anyway for ADL-N).

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


Matt

> 
> With the removal of revid the packed attribute in
> uc_fw_platform_requirement, which is there only for reducing the space
> these tables take, can also be removed since it has even more limited
> usefulness: currently there's only padding of 2 bytes. Remove the
> attribute to avoid the unaligned access.
> 
> 	$ pahole -C uc_fw_platform_requirement build64/drivers/gpu/drm/xe/xe_uc_fw.o
> 	struct uc_fw_platform_requirement {
> 		enum xe_platform           p;                    /*     0     4 */
> 		const struct uc_fw_blob    blob;                 /*     4    10 */
> 
> 		/* size: 16, cachelines: 1, members: 2 */
> 		/* padding: 2 */
> 		/* last cacheline: 16 bytes */
> 	};
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_uc_fw.c | 33 +++++++++++++++------------------
>  1 file changed, 15 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index e9b30e620fd9..e2c982b37e87 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -39,21 +39,21 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
>  
>  /*
>   * List of required GuC and HuC binaries per-platform.
> - * Must be ordered based on platform + revid, from newer to older.
> + * Must be ordered based on platform, from newer to older.
>   */
>  #define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
> -	fw_def(METEORLAKE,   0, guc_def(mtl,  70, 5, 2)) \
> -	fw_def(ALDERLAKE_P,  0, guc_def(adlp,  70, 5, 2)) \
> -	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  70, 5, 2)) \
> -	fw_def(PVC,          0, guc_def(pvc,  70, 5, 2)) \
> -	fw_def(DG2,          0, guc_def(dg2,  70, 5, 2)) \
> -	fw_def(DG1,          0, guc_def(dg1,  70, 5, 2)) \
> -	fw_def(TIGERLAKE,    0, guc_def(tgl,  70, 5, 2))
> +	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
> +	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
> +	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
> +	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
> +	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
> +	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
> +	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
>  
>  #define XE_HUC_FIRMWARE_DEFS(fw_def, huc_def, huc_ver) \
> -	fw_def(ALDERLAKE_S,  0, huc_def(tgl)) \
> -	fw_def(DG1,          0, huc_def(dg1)) \
> -	fw_def(TIGERLAKE,    0, huc_def(tgl))
> +	fw_def(ALDERLAKE_S,	huc_def(tgl)) \
> +	fw_def(DG1,		huc_def(dg1)) \
> +	fw_def(TIGERLAKE,	huc_def(tgl))
>  
>  #define __MAKE_HUC_FW_PATH(prefix_, name_) \
>          "i915/" \
> @@ -82,7 +82,7 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
>  
>  
>  /* All blobs need to be declared via MODULE_FIRMWARE() */
> -#define XE_UC_MODULE_FW(platform_, revid_, uc_) \
> +#define XE_UC_MODULE_FW(platform_, uc_) \
>  	MODULE_FIRMWARE(uc_);
>  
>  XE_GUC_FIRMWARE_DEFS(XE_UC_MODULE_FW, MAKE_GUC_FW_PATH)
> @@ -109,16 +109,14 @@ struct __packed uc_fw_blob {
>  	UC_FW_BLOB(major_, minor_, \
>  		   MAKE_HUC_FW_PATH_FULL_VER(prefix_, major_, minor_, bld_num_))
>  
> -struct __packed uc_fw_platform_requirement {
> +struct uc_fw_platform_requirement {
>  	enum xe_platform p;
> -	u8 rev; /* first platform rev using this FW */
>  	const struct uc_fw_blob blob;
>  };
>  
> -#define MAKE_FW_LIST(platform_, revid_, uc_) \
> +#define MAKE_FW_LIST(platform_, uc_) \
>  { \
>  	.p = XE_##platform_, \
> -	.rev = revid_, \
>  	.blob = uc_, \
>  },
>  
> @@ -143,7 +141,6 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>  	static const struct uc_fw_platform_requirement *fw_blobs;
>  	enum xe_platform p = xe->info.platform;
>  	u32 fw_count;
> -	u8 rev = xe->info.revid;
>  	int i;
>  
>  	XE_BUG_ON(uc_fw->type >= ARRAY_SIZE(blobs_all));
> @@ -151,7 +148,7 @@ uc_fw_auto_select(struct xe_device *xe, struct xe_uc_fw *uc_fw)
>  	fw_count = blobs_all[uc_fw->type].count;
>  
>  	for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
> -		if (p == fw_blobs[i].p && rev >= fw_blobs[i].rev) {
> +		if (p == fw_blobs[i].p) {
>  			const struct uc_fw_blob *blob = &fw_blobs[i].blob;
>  
>  			uc_fw->path = blob->path;
> -- 
> 2.39.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
