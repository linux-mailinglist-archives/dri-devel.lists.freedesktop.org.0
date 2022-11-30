Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FF563D9B4
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 16:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F0F710E490;
	Wed, 30 Nov 2022 15:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9C910E48D;
 Wed, 30 Nov 2022 15:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669823032; x=1701359032;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NzpcWVwuvvqkGW0feeeDIBlWc8+sBV1zkpdK3Wzyw8I=;
 b=LBpWzoWdVRYj+xmxFGHpMq0X1gRQ6b4EM8pVSQ18Vz8yq4GniI9/rKci
 nJK4gS+pbRazO8UntQpusN98+4hRZhApkwnNLLw2HroH6TtPvJcOR80yn
 +HkRQHNzcF/B1GtMjHT2qWmkQVucUI2kl+eYnQsByF0rlpUH4XWqO9W6k
 bQnGYEu/EvtAt+6Qddtx3QA/CmdfTumPHUjzOZPqDBUu2J2TFBqnPMlWL
 EUZlulsOad67Im/vmVFZ12MKJ0z5yT8hL3HZ4+gkzO62p/9KVUakM13tr
 cy5MGTHi1AcAwiTF4LB1cAuE7ozNi0le3KOXBK41B40YynHKpJIXEiDYQ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="377587658"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="377587658"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 07:43:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="786506076"
X-IronPort-AV: E=Sophos;i="5.96,206,1665471600"; d="scan'208";a="786506076"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga001.fm.intel.com with ESMTP; 30 Nov 2022 07:43:49 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 30 Nov 2022 07:43:48 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 30 Nov 2022 07:43:48 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 30 Nov 2022 07:43:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6kGZXVyHle2hw2u2HEzP+lbQ6gsq0mYhY95AaXBOOFgJ8wYBze5WO+P9N0FioxAXC2b49/2Ss6fYiDZI0+u1oiNwu2wVH9iScbZEHeI2UzU+LfGu79uePVgNDG/7o23Alnspk0i/Nl5JcaAFmseD0KAkKd1Bj3mcLfCv6fZDepBjM1ZK417GPvIoMGDQ+rNWSjYI3Oneb1mmt2tSAUF5p8MtD9Iqjildmsnd18Pf4lFNeT4PcWbDuunRbbSjuzFLnB1AwN/kET1rzj2LsG0xDmRO8DlrfWo27GtCeN2WYjmbzrr4toRr/7kSG8nI6BpLAStOUReUym06maaTRj/ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvYsAJX++6rvXf7pBWmxBfGiSA3nyMuYRkacdv4/TII=;
 b=KkunsALi5Gk9WNmfk4posUQv4tXX/giEblcrWns40Ayg+mhUNhfwm6ED53Q5LbmfqdneP1seuExazUkRnCySyuvIM0IvoH91P8aWogI9f00ldCMbV46z3uruQZEujYvlIspst44IyJm0QYqdnPIKLoCfztglJTaCETYGZPJEBgvWIvxCf101yl4pPRGrPkcPmxEfOIVsGvvisObCfmlVK02SB/B0NdWc0qfPVtmQEFiRC1erWOp287pzwcq70Os2xObsXniREQf8TWUTPcO29+t44EQ5c5YfjQUFuNUsxvkgtGbGXfMzGGvHRrWZXqzBeajzymt6E3RQ1v7M5gHTLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 DS0PR11MB7580.namprd11.prod.outlook.com (2603:10b6:8:148::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Wed, 30 Nov 2022 15:43:42 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::d7b9:3194:2145:7afb]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::d7b9:3194:2145:7afb%3]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 15:43:42 +0000
Date: Wed, 30 Nov 2022 21:13:32 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/5] drm/i915/gt: Pass gt rather than uncore to
 lowest-level reads/writes
Message-ID: <Y4d6JOb6IISn64Hq@bala-ubuntu>
References: <20221128233014.4000136-1-matthew.d.roper@intel.com>
 <20221128233014.4000136-3-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20221128233014.4000136-3-matthew.d.roper@intel.com>
X-ClientProxiedBy: PN3PR01CA0075.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::15) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR11MB1897:EE_|DS0PR11MB7580:EE_
X-MS-Office365-Filtering-Correlation-Id: af6a29a7-bab8-4e77-bfb4-08dad2e9a84c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: An1zyekxADANP6LgL1cd6N3RfLXteHq0JlqyOERMaicnX3xQJh1oNXGKa9CD5FUPkBvh2uJ6PSl6PRa78aF7dYrvzwDTKLecqBMliLqMTQlH3NCqw2EHeGflJ7Q3Ax8p20C1tKYVE4KEwejlWg5FGqiXnNq7bYPWcD9mJ+utpHzjkA9yU8AUYRrWLK/4Q6YNaD0mluaaQdyyqMe7AdJq0W5EmlAxVv3oel7CSMAAFMoRSrH26Jym5VXkB2sL/7GQuItn9qLtCh6cKXfsMxGHksachuHxEGOZWe3V4lhN4UE/4skPqM0VgAKF3iXx114Dc9Oq8zVN6exDSkDpMie12sUTWwuAn2JSmNDGyPwD2Eyaw6LMMA4DYukSzPVN1XqwFVrNTvqvL9Jc7cIBG8Dcxh62KoTNtxs/dL4JbCJSnc7NGUibQyBwyYNWz/YdtOQF/wIZGo9Uwanr/QXJdcBLL7YUQ2eq/o2+q2YV1Uw2dsGU9SGSIqMTp8NEgwgooIVk4MYhtNzS+p2+yz543Gko6WAGCCdXQ0rdlli7cEEHisff66Zu2yGqr3ISxPqxSXRODyQoHpJ1c2QsFY0GeQtvmzknKst5gpPKeS869AQYI5F5KbkEpCJZqxQukDIepG/Rw3QnxgW4tgv1TdO+OY0E/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(39860400002)(376002)(346002)(366004)(396003)(136003)(451199015)(6506007)(6486002)(66946007)(6666004)(53546011)(450100002)(66476007)(41300700001)(8936002)(26005)(8676002)(9686003)(6512007)(5660300002)(186003)(82960400001)(4326008)(86362001)(2906002)(478600001)(66556008)(33716001)(83380400001)(316002)(38100700002)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3BUWTh6aDc4US9ZWmplbjZML1JxZ1NOQXM3VlN6cVNzbTdPN0lmZjU4RW1n?=
 =?utf-8?B?dVFQb3pZbUFILzQ2VXRUb2hUR3k2MHM1SDBOQ2JBdi9MNE5sdHQ4NFczMXdo?=
 =?utf-8?B?eS9TRG1Nb0s2R0daT0dGTDJ4SmViZ0xDTnB6YVhsamhITXhOaGFKeVBadnlR?=
 =?utf-8?B?b2FWVW1nelR1UndJYlQyN1BqVk52UER1bzBhTHVrOGRITCtvMjR1cXpvOFdT?=
 =?utf-8?B?N0cvSTBhQW9pZWc0eEJxUWtFS21hL3h3N1E1aTQzZnFuM1lBeHUyeHB3NUly?=
 =?utf-8?B?dUZGejdaZDhERVVabFhZdjk5N0ZDSjgxMExlM2oxODZ3VHdrcHpIditYZlJZ?=
 =?utf-8?B?NnVtUERuNWF4dklpK253VlFNdDZVcjBBNUVRMWo3by9DVkZwT3l5bzBJUGl1?=
 =?utf-8?B?ODBsZU8wa1RNck85L1A0YTl5VnlQOUp4dHF5MmZVU1EwdkZxK1V4ajNJc0M0?=
 =?utf-8?B?OEt4aWh5bmRZQ000amJSbncwZkdERTAwcFpwS1MyZmZyM05LcndzL0FwMWFQ?=
 =?utf-8?B?aStwL3diK054YlY5Y2lCVkJrblZIdVJPc0VzMkhOS09hVUx6UzhvcitBZ2h1?=
 =?utf-8?B?N3BsTDdUNk1CWDRJNE9tOXNHNTl5ajRnZDdoQVhNOTU2VlBIMThVQStFUWRE?=
 =?utf-8?B?d3hyamIwYVVQTTFESnFOMGQvQ2QzVGJZVkdsUm90WUVGZlF1Tlp4WWw0YjZV?=
 =?utf-8?B?TEk0aEU5WDVVQ3ZKS09PM0trUHdzVHhoekRhTXc5VGVsSmhNZXNiV25iUUFt?=
 =?utf-8?B?Sm9HUnRNVlNkYnNFOFhLYmpCOGZEUUx2cndLUi9vQzNZL3krU1hFejRaZGxt?=
 =?utf-8?B?bThYOC9rdlExTVQ4aW9RTEJIcWZqVFJOQVVwL0lZd1R0YzBLb2U0RUxab0Iw?=
 =?utf-8?B?cnpCak1KUnd0Q1FzYkw1Y0Rrd2tLUlhaaDNCN3NXWGNBUnVTRmxwVnFtRjFH?=
 =?utf-8?B?Q0J1YXhrQ29uRVI4WEcxZUJ2Y0xxaS83RU43c1ArUHJodWtYajZUd3NjaXNw?=
 =?utf-8?B?ZmR1bzVBditjOGRBMlczUmhFeGRrOTdlditYNjZrWnU4c0lkQ014Mnk3ckpo?=
 =?utf-8?B?U3RGRWtSOE1FQWdCU2pnZHBSVnpVS0psbVNuWmF4YWc4aDBiYlovd2NwZy9s?=
 =?utf-8?B?SVcxYk4vdklrK0doMjI2Z0hzT2ZRUVh0ZkliSmtwaitNR2wvSXpHbW1VMjN5?=
 =?utf-8?B?bktjaVJtZmsxMnB6RVIzRC85dmgvR1V2enRIQ09URnFzNWRGT0ZySUVEcDJC?=
 =?utf-8?B?WmYwQVI2dDR4UDFOa0lBZTZCZ3ZmZ2tMdHFzMHhjTC9HdFpKNVFzb2hQS0x0?=
 =?utf-8?B?Z3docWlMSVMyMHZxbUEybjRCVDFYOE5jVGZpc3lyZWorNm9mMDFneGFQTlFr?=
 =?utf-8?B?Z0M0S1VHVnhVZ0N3cm91VXJTMjZqVlAwaUs1Ym85SGxoQ29adldLWnBDZ2tl?=
 =?utf-8?B?QndTYmkreTZZK2FzcS9YWnF1VisyaDRLdytyKzd0NjBlVWU5RVBWS0g5djJR?=
 =?utf-8?B?UXpKdlVFbGlUbzhkVjl0eXFNWUh2RUJVa3B4VWhnTXhGS3lkL0ttQm5VeTEx?=
 =?utf-8?B?OHd2ajlRSGhqQXlXcitPMUtleWZrbVpCc0pqSGdOa2pqZlUyZnB1eTNNQVM1?=
 =?utf-8?B?TnRZQmRXdkltTytNUHNqbkNwbjF5UWxqd1Z6WEVWdTVvMk43aXlORWZBeGZw?=
 =?utf-8?B?OGxTWkdZUUg2U1FGcEhZZElyM1hoYjFDZ05OV0I2R0RLUkg4elE5TVN1SnZt?=
 =?utf-8?B?dVh4UzJPN0hiV2lJc0hDempyVHQvOENpdk93QXc2YmhXYUlYOGE4RElFV3FI?=
 =?utf-8?B?S1FFcmg0VjduZnJBRFpKdVNxUmYzNExBTWNGNWFadVVLeFhIZWVER2tXUjRS?=
 =?utf-8?B?WisvT1Z1SHJFSCt2LzUydGV1dVMvZVYwd3l1RW5wdGkxRXd6VExNdWtIVity?=
 =?utf-8?B?Z25CQmlhRVpKWHVRd2h3MWpXQXdwblVtMmt5NlFJSHJ4UDRhUnh1dnFLcFNZ?=
 =?utf-8?B?QTRMVU5VTFo5V3daNzlmUUR5SVBlNUZuWWRobllUSVg1S0NOMXlOQ3E1RHBi?=
 =?utf-8?B?aXVWMkpqY2NiQmVMOVZZQ2lJL2RwdEFOMnpObE94SDVpWnVRUUZuY3h2NXNO?=
 =?utf-8?B?Zk02b0NKZVpvbktpOG5IQkpSWE9FMU85WUQxLzEwRnVybXMwamVPckdpNHpU?=
 =?utf-8?Q?ZLtTN394PPBD+JVK9WrmsWs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: af6a29a7-bab8-4e77-bfb4-08dad2e9a84c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 15:43:42.0880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3lpSJiHzUmyqaQ95kPUIclrOCAA9g9iuOZ8JlSP53atUhfUjShFsnoFOXF15Gqqn+i7o0wBdKJl3mGgBDxvEvzMEti3a5/bxm23kzOAIQ4S61oUThp6prRBTnc6gaJE0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7580
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28.11.2022 15:30, Matt Roper wrote:
> Passing the GT rather than uncore to the lowest level MCR read and write
> functions will make it easier to introduce dedicated MCR locking in a
> following patch.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> index ea86c1ab5dc5..f4484bb18ec9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
> @@ -221,7 +221,7 @@ static i915_reg_t mcr_reg_cast(const i915_mcr_reg_t mcr)
>  
>  /*
>   * rw_with_mcr_steering_fw - Access a register with specific MCR steering
> - * @uncore: pointer to struct intel_uncore
> + * @gt: GT to read register from
>   * @reg: register being accessed
>   * @rw_flag: FW_REG_READ for read access or FW_REG_WRITE for write access
>   * @group: group number (documented as "sliceid" on older platforms)
> @@ -232,10 +232,11 @@ static i915_reg_t mcr_reg_cast(const i915_mcr_reg_t mcr)
>   *
>   * Caller needs to make sure the relevant forcewake wells are up.
>   */
> -static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
> +static u32 rw_with_mcr_steering_fw(struct intel_gt *gt,
>  				   i915_mcr_reg_t reg, u8 rw_flag,
>  				   int group, int instance, u32 value)
>  {
> +	struct intel_uncore *uncore = gt->uncore;
>  	u32 mcr_mask, mcr_ss, mcr, old_mcr, val = 0;
>  
>  	lockdep_assert_held(&uncore->lock);
> @@ -308,11 +309,12 @@ static u32 rw_with_mcr_steering_fw(struct intel_uncore *uncore,
>  	return val;
>  }
>  
> -static u32 rw_with_mcr_steering(struct intel_uncore *uncore,
> +static u32 rw_with_mcr_steering(struct intel_gt *gt,
>  				i915_mcr_reg_t reg, u8 rw_flag,
>  				int group, int instance,
>  				u32 value)
>  {
> +	struct intel_uncore *uncore = gt->uncore;
>  	enum forcewake_domains fw_domains;
>  	u32 val;
>  
> @@ -325,7 +327,7 @@ static u32 rw_with_mcr_steering(struct intel_uncore *uncore,
>  	spin_lock_irq(&uncore->lock);
>  	intel_uncore_forcewake_get__locked(uncore, fw_domains);
>  
> -	val = rw_with_mcr_steering_fw(uncore, reg, rw_flag, group, instance, value);
> +	val = rw_with_mcr_steering_fw(gt, reg, rw_flag, group, instance, value);
>  
>  	intel_uncore_forcewake_put__locked(uncore, fw_domains);
>  	spin_unlock_irq(&uncore->lock);
> @@ -347,7 +349,7 @@ u32 intel_gt_mcr_read(struct intel_gt *gt,
>  		      i915_mcr_reg_t reg,
>  		      int group, int instance)
>  {
> -	return rw_with_mcr_steering(gt->uncore, reg, FW_REG_READ, group, instance, 0);
> +	return rw_with_mcr_steering(gt, reg, FW_REG_READ, group, instance, 0);
>  }
>  
>  /**
> @@ -364,7 +366,7 @@ u32 intel_gt_mcr_read(struct intel_gt *gt,
>  void intel_gt_mcr_unicast_write(struct intel_gt *gt, i915_mcr_reg_t reg, u32 value,
>  				int group, int instance)
>  {
> -	rw_with_mcr_steering(gt->uncore, reg, FW_REG_WRITE, group, instance, value);
> +	rw_with_mcr_steering(gt, reg, FW_REG_WRITE, group, instance, value);
>  }
>  
>  /**
> @@ -588,7 +590,7 @@ u32 intel_gt_mcr_read_any_fw(struct intel_gt *gt, i915_mcr_reg_t reg)
>  	for (type = 0; type < NUM_STEERING_TYPES; type++) {
>  		if (reg_needs_read_steering(gt, reg, type)) {
>  			get_nonterminated_steering(gt, type, &group, &instance);
> -			return rw_with_mcr_steering_fw(gt->uncore, reg,
> +			return rw_with_mcr_steering_fw(gt, reg,
>  						       FW_REG_READ,
>  						       group, instance, 0);
>  		}
> @@ -615,7 +617,7 @@ u32 intel_gt_mcr_read_any(struct intel_gt *gt, i915_mcr_reg_t reg)
>  	for (type = 0; type < NUM_STEERING_TYPES; type++) {
>  		if (reg_needs_read_steering(gt, reg, type)) {
>  			get_nonterminated_steering(gt, type, &group, &instance);
> -			return rw_with_mcr_steering(gt->uncore, reg,
> +			return rw_with_mcr_steering(gt, reg,
>  						    FW_REG_READ,
>  						    group, instance, 0);
>  		}
> -- 
> 2.38.1
> 
