Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F149A63D9AE
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 16:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638F610E48F;
	Wed, 30 Nov 2022 15:43:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD6910E48F;
 Wed, 30 Nov 2022 15:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669822981; x=1701358981;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=hDRbisR9BC7d6kU+cr+qv3ABsakZECumV/3ZlSoxdcI=;
 b=Mqsp6N+tGTE2DJcOvY5iSSVYTz/0c8nll5MulHtR0aLVro/qT/VBahKf
 ax3NoEil23DA6c0688LhfpGI/wzc3yIMiCevE1e8j/A+yllmNCx2Vs9IJ
 HM2FGOwcCsf/tm8dK4Nk2xzKfkcxTm0oKBUJ2sYUEkuJhca8KSvcgYJKq
 gMdZgA8m7tb9/fjFyAHLv/bi1Mbrh3KX7novAFaFi5GBcLJqYlRbBPIDR
 MM9aTb19NCRTvj+Llr4HyDZ/od3Ac0iIAoh13ME3Xb5xQQ36eFWcOQ7PF
 p3aWK/Dk84nOwVg7JFXPZZLUHaYicBlpuFmlH7gO6RIOwYq+pgRvbugbD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="342349259"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="342349259"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 07:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="973145453"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="973145453"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2022 07:43:00 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 07:42:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 30 Nov 2022 07:42:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 30 Nov 2022 07:42:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QgCGRoVB8qfd+MhlpV4chTlZKFYNj0FFCQp3AIoRPDerjRIh7rUnQWPTEqR61Jwa4gVGhmO1oufeZSdTz5x1EzgTXKaboUdHABA926neMKteVHrp9DJ6zBsL57rvrxZyGDNx50qPKBFDouSaDT9n9trMVxl70esSKYlnHsQr90bUteBZuUEN2Hm/sc0R5v80szVRv6G5RrJm6qp4v/3iSmtmf91f+tgHIjJ+6uq4lg6U8qO+X705aOOZRC/qNUrZMFO2V2kGBLcmp2V/PMM31JBG09oHLuW6LKKW0ObGa4hj4qKJPvLHWoCKSHF8Yi0Bz1LYcWcs0AJRz808X3D18A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2xduoblh7kTofZxG//CY8Pu2wbA/uo1ZL6QWTamaerg=;
 b=DYXqfUXLWTUQpMtfxwSiCKGIfBkgETZ6CrV0FoCVi+SGXB64GA3wFxhF0BFAzhK2PtjwLjnPsmucRdF1k//REC8M410WYARlRSNMWj7bjH4sxtf43VXukWKvCuHt02rYfaNPY8TMI7CDOd3Vr0+DAaPwyym2l0E/vjCj0cxByhM5VMwqqa6Qr0kNrdqAGMLg3WbAd6YKObG6+u4qe+XTVGoSRP70+Czinkqo0T1mylsLnEh1YL9QmMdDQzkFP15yEwXbfbrCqPnSZE8mX4N3FKMkMHEOmkmdkZLYXQVkWqlk/n9hYTb1igpyHVLDCswNW6cvftINEe/xb+Ksrs/Rmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 CH0PR11MB5346.namprd11.prod.outlook.com (2603:10b6:610:b9::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Wed, 30 Nov 2022 15:42:57 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::d7b9:3194:2145:7afb]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::d7b9:3194:2145:7afb%3]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 15:42:57 +0000
Date: Wed, 30 Nov 2022 21:12:48 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/5] drm/i915/gt: Correct kerneldoc for
 intel_gt_mcr_wait_for_reg()
Message-ID: <Y4d5+A+TJViznAcy@bala-ubuntu>
References: <20221128233014.4000136-1-matthew.d.roper@intel.com>
 <20221128233014.4000136-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221128233014.4000136-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN2PR01CA0100.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::15) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|CH0PR11MB5346:EE_
X-MS-Office365-Filtering-Correlation-Id: 87726c3e-fc96-45ba-0ea8-08dad2e98d82
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jThASPiKS4kI1rcSpl+EM//gzdumo9fqKHJIqE90Kd1gBU7I05vdW3kV/qn1m6ihI25bYnqPZPbjz46hlkrtulCZDU1wdIu+I5IOERrMwG51qE2obQIoOYHpR4+WaWfLYMVw0c7De9yLd2gpwOB4VgI5NzM2KAxRDFW+UgcGSp6RWFyTvGTyw7SygGLxtrzGAaBTlv3XVC5NrMHvmEOEqKxovnmJYylGFvW6JF8btpEeGRGHwK7oozmLU9VaV/DGrfT9ghcVoK/Mh/fplmFEAHFtSzcHRP0WWiNkgvjgVyNpxFwaanQxg83XTTgBp+CrHNxW2hltT2A4wNANravrnGNSyXxZIAzl74cUNgQl/NLxG5d9F8ul8j7TiGwKO0Nceb10LmYDPESY/07H/o5TylzUqIIO3qUzIGJeP9fSnx5jdt33ojzbvJxri6F3lMX9Z0xIFWkgUsHX6LXQlKIo6PEvo446uB6NPx0rD1dXCdp4gOIS/czfFcziU2hkpj56blxoNq9enscWoqeS3v/L1JB57yTJb2yjXRLD0UvxN477O/1xn6bJB4L77+TmMeE/LO98CQGVyUqFQEF1VFntwhj0YXFHNaOxU7zUhqc3nQbuM09JYXn5JQVfOdxZXy7L5PrAUD37MP9bxjgGCI1SEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199015)(8676002)(66556008)(450100002)(66946007)(66476007)(4326008)(8936002)(86362001)(41300700001)(316002)(5660300002)(44832011)(83380400001)(6486002)(478600001)(6506007)(6666004)(33716001)(38100700002)(82960400001)(2906002)(26005)(9686003)(6512007)(186003)(53546011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MHFheVg0MDFLTVhKUFAvZE1pM1Z2L1pST1F5VGhBNUtvY1B3RHJzS1ZPT3Vy?=
 =?utf-8?B?OVhRekhPbkFialV1QUVUSy9SbVpSa3J5YkM4d3NuYUtZRFlEZXNiUWZKRmZV?=
 =?utf-8?B?UFZxaGpBSmJ4c1BJbjM4bG12SWtpSUZLcE44ZGovQm1WbjV0dkJBOXBNRFNB?=
 =?utf-8?B?MjhVSnFrVDBwUldHSE5VeFZ4V1dsaHBJWEJ5TXc4U3dUVzdqUGNLNmtQMFNL?=
 =?utf-8?B?SFU5cTlUR1dCVXU0MlBVWUFpZEFHV29xbzFqYWxkbE15Vm1kQlpEYWhGY3Av?=
 =?utf-8?B?bFczQm5hYlo0dE1OeGl3ZTRLK0hoYWFyNTZrQ28xQ0hQdkhBTUpBeVF6WjA1?=
 =?utf-8?B?cVpEcEhYZU1zNmlQQTRxOTJ4RUU5cjlzSExoOVpRN3dXVHRpRFlCZm5KK1hK?=
 =?utf-8?B?RXIrU05rLzQ1N2dyekRteDJ4SE1Fb0tvcmx5eGFkcy9ld3I1QnU3by9PNG43?=
 =?utf-8?B?T3I2LzFoWVZCTGc4dzUzc1J1VEVoSkdwcldTdG9EOWlaVmtXTWJIUnFpcU5O?=
 =?utf-8?B?SWZWZ0t2Rllrcm5xNjBCS3NOWW9WM3Y5cUVlbUQ2c1laV2YvZEszcUw0WWts?=
 =?utf-8?B?UE5abW84Vk94enc5T290UFJ1SHVtS1FkdmhKNElJTjluZkQ3dmFMOFNqL2Nt?=
 =?utf-8?B?ajNsRFJzUHJ1bFh3NnF6NjY5Z2lyNXU1cDl4NUdFUTlTVkY1NjZ2L2gwL1oz?=
 =?utf-8?B?emxXSi9uYitXcnVPenlzL2F1MlZ3d2k3ZElUZ1pmLzF1RzRlcXVPdUdVeWp2?=
 =?utf-8?B?V3doOUtqeEg2S2dGRWx5dExOSXkwMXE2V1Jaa2NsblVJdHhlaURoZWsyRmgz?=
 =?utf-8?B?RXJIN2p4VXdjS3I1d2lUamQzTkZseFhiS3lPRGU4Y3BOSVljWjM1N0N0Ums4?=
 =?utf-8?B?eTlkQUJqazlFLzdRUWk4Ujc0cWRKMzdiVTM5NE9jV01zVGI4N0xVczRpTHBr?=
 =?utf-8?B?RnRybmxZRFdwbG10SkJiV3lLdnhOVERWOEZKYUxNYlFmS1UzdmpLTmdyREox?=
 =?utf-8?B?STJHazhrWlpieFZ3bWxETUQrdmsrRGNnbjdjQXlmYkIvUEVNSkhRMDcvNnFS?=
 =?utf-8?B?K1lHWWdFMFZRNUtzUU53d0xMY1VHa0xURHR4YUlHVy9rV3RDdUdqUWlJbVdE?=
 =?utf-8?B?MnJjbW1FV1NzcnhZZnFxY3NXY2czZ3g1SldLMGpEWnI3STFuWFoyYUNDcEpO?=
 =?utf-8?B?Qys4bkJ2NDhMdzRJakc1akVsTENPNUFzTkJGWkhMQnRHcFVzWnV0aHhVUjdW?=
 =?utf-8?B?K2VXbjc0c2lBZm1MZHdhNXh5c01SeG1XR3JzZHdPSlZWRFE4UURyZVl4UTlC?=
 =?utf-8?B?WEVkYk8zbjBBMlJiYW1sYUdkNHRmcmZCeXZKTStmRDV1dXNRdkRod1V5Tkcy?=
 =?utf-8?B?MWpWZkp2b3V6c3B2NmRBWVFnS0d2VDlNSDRZb3JHbU11MHhnWUExMERMNzdY?=
 =?utf-8?B?ZGt3MXRMdkl2Z004d2djMkowck1Ram5oQWZOeG5hNVlEd1dFNlpxdWRpT0t3?=
 =?utf-8?B?azI4bkRTeEVGeVNOV0RXc0RmbmJsd01OdVR6UGJaMjlQdXNoeEdIZXJHOE9a?=
 =?utf-8?B?ZUZMcTRxL2NNNytTTjYwVE53SldlWEJvamg5M2JPTzJuR3VabGUvdXlYU040?=
 =?utf-8?B?a01NZEo1TEdHY2g4WHhNenNZSWtKQmhpWFMvMTE1TEVvbXJZU3YrWkZ4Y1Fz?=
 =?utf-8?B?RTVBQmw1VEFVbG15WXRJcGV1R05pSkhza3htRmliNmhISjl5NXpyV0llazVo?=
 =?utf-8?B?MHVSOVdhWnYvelFuOUd0VDNYaldERjQ3L2FUaUFhOTQ3U2UzL2RJSnViUC8x?=
 =?utf-8?B?WE1VQVhteHhyT1o4VHBsWW9NMHFnNVNtcXdFY3VjTmo3MmhlSGJ4WGhlUENx?=
 =?utf-8?B?U1AvM0psa3ByYTFTYVA4TWdST2tFOTgzd0RBdXlKSzZWTzZ0MXU0QUVtQmJi?=
 =?utf-8?B?cWpJUDlkNlhkc3FPeEh1Y2k3c0JLYWlETHFIbW9sRzZQUjlXZ0VWVVJ3dUh5?=
 =?utf-8?B?eURscWNKNE01Nzl5d3hWZGc1ckJzSnRsSGVmbS9JMjR3bjNsSFhadXpqRkVr?=
 =?utf-8?B?ZGVXbXlZMjlEUVpiYjhGbjZWcHd2YlJuWU1DWmZuYlByb1JGMjlJME9NTFNr?=
 =?utf-8?B?ck91QVptZjlQUm9tMzBrOXVjYTlLSWsrSExpTjc3Z09qblJ5Y2pGVGo0ZVYy?=
 =?utf-8?Q?/g5L4sMJjmrjSbUg121BsNE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87726c3e-fc96-45ba-0ea8-08dad2e98d82
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 15:42:57.1545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8eOhWw0NP7+vdfnEta7EKISlI/l9BpfPIuTnis71CxjSlTGREeyCFZ/N1zI1O4/m4PqF4Wkr5kZVqlTV4h38J6Zeh4I1lcOEz2AOlH1SUM9Fwp+6WREea4pGkurySvS5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5346
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.11.2022 15:30, Matt Roper wrote:
> The kerneldoc function name was not updated when this function was
> converted to a non-fw form.
> 
> Fixes: 192bb40f030a ("drm/i915/gt: Manage uncore->lock while waiting on MCR register")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index d9a8ff9e5e57..ea86c1ab5dc5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -702,7 +702,7 @@ void intel_gt_mcr_get_ss_steering(struct intel_gt *gt, unsigned int dss,
>  }
>  
>  /**
> - * intel_gt_mcr_wait_for_reg_fw - wait until MCR register matches expected state
> + * intel_gt_mcr_wait_for_reg - wait until MCR register matches expected state
>   * @gt: GT structure
>   * @reg: the register to read
>   * @mask: mask to apply to register value
> -- 
> 2.38.1
> 
