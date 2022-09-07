Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18AA35B0FC7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 00:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D2110E8D8;
	Wed,  7 Sep 2022 22:22:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAD010E8D6;
 Wed,  7 Sep 2022 22:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662589364; x=1694125364;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+rLa0K+s15ZviLg9XmsGVtzujZyZhCJ6OMPPm3qSF/Q=;
 b=YRI5nHBH27TgOBxOHUjp6h4lNFDoQP6jYiT+jZ7Sljfs0hhyr4JRRwCo
 QuQrZdUhPJ/A0Vf3B+FCJ2vrWkws838ZlIylcvAdvaUKiGsXDFR2Nj5Th
 IhoxXfmAaYr3J0Pg8ufm94Ex2Qq5M6niYuhvsBuOpI9lZfwTp5kBN5bMj
 FYEznVS4IFd5HHilznOBh37QZbxjolpqussBAbyPyYUZrxnBGbRq2HPl1
 552POvDX1IpAVCgYFgNJzTPkp07yf/VlTCQ7BdO7ZkJdz42F+dZlSeB4s
 na/Ux5ax3iB0wrKfSxQ759eGgn3f9TUSYyIsM2fo4gBMBmKhZn9OEE2d7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="276748614"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="276748614"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 15:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="644808213"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 07 Sep 2022 15:22:43 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 7 Sep 2022 15:22:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 7 Sep 2022 15:22:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 7 Sep 2022 15:22:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcUSZ9v0Oq8YQZFWc8zXEZBLOVXKXVg2DgMx6Rz6ZU6HAmf0wlmfatOsfycxfG8Rg3Mwfg1NhOovtguWuCEdW8veWS27oNrwM1EKoNJhW94DJEYBUnWtmV7IvuiVJhyo1GkVt4xxTvi0TJ9QB9zkiDSq7iCjDINcXoaPFAGzRS0Vs8O1wJxb7yCaRqBeDlm94fqv9OGIz5l9dUTCHNkN15gazMxQgCFjfn9DbDfVNxLLwjjhshQ3SyDKicwB/uqARyahB6GGe1kys0EtJvvgeKkufE6fkIckmLa1b6l1fb36PkYAenM4Ra2xYsKO8h8jMrzsRd9bV1INDmVJKbdkQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GE8SBGFb5+yNhGWu0fkArwDWH6e+uoRz2yaLP//26rs=;
 b=kSaaBTiULYYtqduoF45rjXyzIOEKKJh5blnzjff51xLc6Ozv54ljKP4Cyq7ZbyMtOEVSdeKcKSdEjQwH3ZekGwNdmrX6zfWy6Nqwc/tt3ZmaWB2VUAYB26MGsOMm/BJ7Doehdjw/FKJpf7Pyle6RS/ObK9kF7ETzzdLIsQsTzfTxAKgIQl772KTUfV7N9CfQzDqs+v1TpbCBAlnTTjfncox7p8m5xgqTmNnCSPoDt0spXx+/OgBBB7HACyRqqV09JPYEdzJEBS4p2U+ttn/Nf1P+RI8JiRV9WNFnosLSY9x9mfAnQ+PiMaPfXtW8Dc7vp/xOfip8XMnRob7PaSr+fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO6PR11MB5617.namprd11.prod.outlook.com (2603:10b6:5:35c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.14; Wed, 7 Sep
 2022 22:22:40 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::211b:a022:39b6:5d2%5]) with mapi id 15.20.5588.018; Wed, 7 Sep 2022
 22:22:40 +0000
Date: Wed, 7 Sep 2022 15:22:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH 1/2] drm/i915/gt: Use MEDIA_VER() when handling media fuses
Message-ID: <20220907222238.bwryapwyre7jbnlo@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220907203911.1662804-1-lucas.demarchi@intel.com>
 <YxkYmBbpe1/QnaVf@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <YxkYmBbpe1/QnaVf@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::25) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6c7b66a-b32d-4601-5ae4-08da911f7a1d
X-MS-TrafficTypeDiagnostic: CO6PR11MB5617:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJN4zjt7L3g+ATj2Eqb30wb5vFniWxpd0Vxzz+6EczAKSlMdHxs/euK24grY6tFMAvxV/u97e4FCwSG3TtXqPqAYV4sFIds5a0XDA/J2OtCoNuqHrR5+Qlw12Jjr/Al+mbWz1+NUFys/DDskgek2eQmH3ODcT0peLjn9qLFOTFXJeaYYND3deCz/tmTokK4cLKx6pc6geD9Rjuv9cDe26kjA+J4QwV65PDmF7VJITVGAI2vPngKnZt9vg3HwpHZc5wz6hPH4OGeo8A0bVtEiKVIdTzngO4yr2SVB7S4UUIHyeW32JmE1MwUCTYm9xx6YlemvYliP/IqFxWtPvZ4UkyvQq09QW2vau0qihZITxPDiuTaY/ns0VpONSkG1gNl5zzQ6DhxmsAmjO10OewYx0uiW0BcQHzVih+21losbrDAXrCqoYaUwsZi6uuvbRTEFFYvvpPLBXJzf1Q+xVayXhx5dDyopeqCu4DkU7pcypVMNwm3RG/dVtsW73gtdPaNk4y3M5gOcqvkzwWrT22RQj3l05a7WnRDR1cJCEuU7uXrbvtcV+zjEkPDs1pD7sky7Hp38c/AsPAZLvGytPDFsuWjLKF5rR9Uu6h1DTzYX9bvWu9LI65NSleBa8wjDj7HNWUwD2tz3fuyWBkUnr+vKW/hduSkXC7lFlAe49dmv9/Vl3LtObCXnidQMf5zuqdEz8qobq5AbioaQGAfp3ZMlpQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(366004)(136003)(39860400002)(346002)(376002)(450100002)(4326008)(36756003)(2906002)(66946007)(66476007)(66556008)(5660300002)(6862004)(8936002)(6636002)(316002)(6512007)(6486002)(9686003)(478600001)(41300700001)(8676002)(6506007)(26005)(1076003)(38100700002)(186003)(83380400001)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CePRO6bmmM5kmGYYLXKyC5k0sQ18GttAes/7pPzCUwZyE+JhLnxUlZsmLmZv?=
 =?us-ascii?Q?y3RY7GXSlumwDGE0ecsJgTEa7Hl2PnIPX+UN54O5h/Da7+3PfPqaCHGToLrZ?=
 =?us-ascii?Q?EzgldMRrB84JdpT70OuKqi5vUYm0+TgIHMWxcyzIEOpU1LYdMFRIe21OfOxX?=
 =?us-ascii?Q?O3tV9XDTBNWL349LfPmKTdZFu74XEcH3UTegyWSFeMIQYRcokllgXtnsZyyF?=
 =?us-ascii?Q?/bcsqrFdZDMfhi0kdziejix+gb3zybEhLwxTcPPzDNMqfHIi8WRPj/1jGW0C?=
 =?us-ascii?Q?gpnZrGoiG0QKMerN2/Tqkcpd2khmP+fqP5zr98JSQRRl1N99NL62HweIjH58?=
 =?us-ascii?Q?ymqoRs5J5Ul+Cd8RCbGExwEUPSHIB6lCvU1KrDuYKnX7WM2WPG3I/bgvxOsT?=
 =?us-ascii?Q?oWFblMpybtjLj3mZYnYtVOED+e3e5rGLC6wHFOYJ0hxk30+UUcEswP8B4ocg?=
 =?us-ascii?Q?4UUUr7m5fV+/PFJPcfNRwJV2eoBZUNiIYVzkaRPdW2oNDZbJd2gOdxm6b7wd?=
 =?us-ascii?Q?Pz7dtyBuOu2GwsuzxIxOvWvp2LbwbahraviLEW7H9s58Op6AqKsDraTwfCtD?=
 =?us-ascii?Q?O/5u/wZWqZICHcXctMCcSIZs7IV3xHHYF/Z+n/Eoe+RRWZk+WLPQ+WkjYGDj?=
 =?us-ascii?Q?GZgtycLcyD3il139VELa+2edrFtmQmU0oJ91bguGZOppC+LItZqhWMivF1Vx?=
 =?us-ascii?Q?iuaceUhvER6FPHn+a0vTfnZTTPzHfwMAKORB97PjlUXxxevOyGYTC7pvESVu?=
 =?us-ascii?Q?XBe5M+wVq2CsXRQBe1JMp3t49/sEmPi9AWmysbL8MQ0QdZBX/mVhMGvr2aBE?=
 =?us-ascii?Q?0uSfBGbQwWRxGH6o7KLv/WGonqh4Scy+b9vVagFs2CF48/6SJjMKColAy/nE?=
 =?us-ascii?Q?DxH8Pu9McSCuLhrydsdjXenX1ZPLbbAHQnfHM90B6HucenPQxdHUcOsVnZCc?=
 =?us-ascii?Q?7fLpgepKeQHa4DaY71j6n0D4ag1iHpwT4Vx20orsQ7yNxpSnYo2EvecaBdge?=
 =?us-ascii?Q?qi+j1L0IwrbHN3207inOvKCd3/0PbcIAd2cjvJQlr66DMt//22RMHjrnBE/w?=
 =?us-ascii?Q?nGGur8XmT38g2w8GKjRu6AaQhmQfLowAdzs4vhD4pHCFc5RqkuWNbkGJFiSZ?=
 =?us-ascii?Q?Cx5K7auuRkIqwPchvORHOP9m1364RIKM2T738RXCfrq+IHc/IqmfCRFMPw8x?=
 =?us-ascii?Q?/KQl9zD+CDGwEFZxE7q7OWO7HxgFjRXgvPGShPe04fDYKFZKB6JOKEao6HDF?=
 =?us-ascii?Q?uMZyX+4AJXthioz9IwQG2cpvnnAvTbVdI/nTc4gDcOOr8+MMQB5agmUvB9vZ?=
 =?us-ascii?Q?0mZzi/MUrnV11FKWlF50bdTK3h7NFsYESVbGe/ASRRTEgec4CX52iOvmQ3jn?=
 =?us-ascii?Q?n0iMsS7gfmu+yALe1fTFnosduw9T8o1ZcPi182cVcIPLTOStF5nilVpCwY5b?=
 =?us-ascii?Q?41ligvttv2m2uoCBmk9WrhBXfBfE0R/Z/wTAn62YlykwSa2ED7BCHq2ex8Gs?=
 =?us-ascii?Q?JBF2j/DduYOdrDz21BAprWEXZbKN8Vh3wCPsHjMvgoes22+T6yZaRil2ag87?=
 =?us-ascii?Q?bwFXi6m6lx4wVYlR4/U8zLUwQZEMgxxQa1dbh8bEfWwHP17BkWm1N1v/NKpz?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f6c7b66a-b32d-4601-5ae4-08da911f7a1d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2022 22:22:40.6041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZCeR0OQxSsThIVj2LlIHbhNHp2P7IiG7YdNDp2u0XF9qqH9TDsW65iDQt2br/OO4ZyvL6yjdCrOucaPuxqOANs3Ce9QG86QABxQzppHPGT0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5617
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

On Wed, Sep 07, 2022 at 03:18:00PM -0700, Matt Roper wrote:
>On Wed, Sep 07, 2022 at 01:39:10PM -0700, Lucas De Marchi wrote:
>> Check for media IP version instead of graphics since this is figuring
>> out the media engines' configuration. Currently the only platform with
>> non-matching graphics/media version is Meteor Lake: update the check in
>> gen11_vdbox_has_sfc() so it considers not only version 12, but also any
>> later version which then includes that platform.
>>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>  drivers/gpu/drm/i915/gt/intel_engine_cs.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> index 275ad72940c1..5cddee7c2f1d 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -654,13 +654,14 @@ bool gen11_vdbox_has_sfc(struct intel_gt *gt,
>>  	 */
>>  	if ((gt->info.sfc_mask & BIT(physical_vdbox / 2)) == 0)
>>  		return false;
>> -	else if (GRAPHICS_VER(i915) == 12)
>> +	else if (MEDIA_VER(i915) >= 12)
>>  		return (physical_vdbox % 2 == 0) ||
>>  			!(BIT(physical_vdbox - 1) & vdbox_mask);
>> -	else if (GRAPHICS_VER(i915) == 11)
>> +	else if (MEDIA_VER(i915) == 11)
>>  		return logical_vdbox % 2 == 0;
>>
>> -	MISSING_CASE(GRAPHICS_VER(i915));
>> +	MISSING_CASE(MEDIA_VER(i915));
>
>Do we even still need the MISSING_CASE given that we now have an
>open-ended upper bound above and this is a "gen11" function that doesn't
>get called at all on old platforms?
>
>Personally I'd axe it, but up to you.  Either way,
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

yeah, I will remove it

thanks
Lucas De Marchi

>
>> +
>>  	return false;
>>  }
>>
>> @@ -747,14 +748,14 @@ static intel_engine_mask_t init_engine_mask(struct intel_gt *gt)
>>  	 * and bits have disable semantices.
>>  	 */
>>  	media_fuse = intel_uncore_read(uncore, GEN11_GT_VEBOX_VDBOX_DISABLE);
>> -	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
>> +	if (MEDIA_VER_FULL(i915) < IP_VER(12, 50))
>>  		media_fuse = ~media_fuse;
>>
>>  	vdbox_mask = media_fuse & GEN11_GT_VDBOX_DISABLE_MASK;
>>  	vebox_mask = (media_fuse & GEN11_GT_VEBOX_DISABLE_MASK) >>
>>  		      GEN11_GT_VEBOX_DISABLE_SHIFT;
>>
>> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
>> +	if (MEDIA_VER_FULL(i915) >= IP_VER(12, 50)) {
>>  		fuse1 = intel_uncore_read(uncore, HSW_PAVP_FUSE1);
>>  		gt->info.sfc_mask = REG_FIELD_GET(XEHP_SFC_ENABLE_MASK, fuse1);
>>  	} else {
>> --
>> 2.37.2
>>
>
>-- 
>Matt Roper
>Graphics Software Engineer
>VTT-OSGC Platform Enablement
>Intel Corporation
