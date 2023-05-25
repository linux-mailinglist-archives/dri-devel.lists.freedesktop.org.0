Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5027117B4
	for <lists+dri-devel@lfdr.de>; Thu, 25 May 2023 21:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65EB10E744;
	Thu, 25 May 2023 19:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68FC010E744;
 Thu, 25 May 2023 19:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685044427; x=1716580427;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0csYLLnldJtAZTbGWv8lMF7zOmFfnDnGl+8jk14tnFg=;
 b=Qe2XmPidzgBA7b0wjH30nK7BUDTrF2P7bDyShtZVPUKrcNMicOVs3oqf
 XBBLCRDg9Mx7r2JkUCCOc3FdRyv2hh5PJ/bR232PiWYBkhGARJpWc6UhQ
 mMUOdSAAUi4H1k5FS4dKFcot6ZVLk1SVay8qv35snR2vWn6uzsmTF6AlV
 GRgw7Ipynfk6D2Vonj3pWX5jibgBnI1sFs+gRdcnY/e/lHo9UI6eQmjVv
 tBGOjhTjE7dJAoU7fBZim6TJTAQCyp29FNEqT2o+y1DlSpiOsUDj5y3tN
 AYcK7WpQV583u7F0qhF2/hCi8Ao9hgQrvho1B3Q5mDVuIjpletuTTVO5d w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="352849766"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="352849766"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2023 12:53:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10721"; a="737941428"
X-IronPort-AV: E=Sophos;i="6.00,192,1681196400"; d="scan'208";a="737941428"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 25 May 2023 12:53:46 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 25 May 2023 12:53:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 25 May 2023 12:53:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 25 May 2023 12:53:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7yBf/baVWMM5IbiGcWaOhABlde0umx0ijZqSqZ3GjD0B50RX+R9ek/MA2t7Ef6RAHZg5fCtNVBdUreq3gF7vIJX4Ixozs8qDiERRIenhuM5n4uIg9ToBFPduM7ltKGpkeevgLHvtDQUN6undCZUlzKUCD51TVOzYszHX/x2UbWkA8qEx+k117uGQ+iPTyD0HrwtdQbe5naj1BuOCGcgnWJwlq+uQ1ebps93VF0MC0gf4IAnL1J4HADGXwyAzMrXqcMEwCeI7SG+Kkksrb0kkTTOeaGrevClZbzGCmGM2eBJ9XNM9UOQRePHVoIqjcEa38LPnJijP3T6EBdUXeVGEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dXOOydYb13wvd6M3CPfInA7cB0RXM63zaApi6/EXPTY=;
 b=gOA3dl8QUZ8V5PbHxCRbsr1Ofm5xoOLDzEHUOY2tEQzjnedC8kirKRUBTnRFDk+ceCuzEJ2Wc/pwHhC+IXPj+6ew7ojXnVqtb7dqf+xeU6MDhD1ec11J4jdCeV5ThhhJLoPdAdxzuskBo2nn+7Zdhgd/oY2d52sSU3pqtGk4gCMNi4RRFnb/N97AZ+8x5o+vAfXVEviYd5QNsCFQbPDLBXi+2Qh/3dmJW7ZjJHELAJ2FOuGuuG4xxkzBCdKJkuV9dZ7wSEGfMa+nLNPILhDJ6huB3ZqxJ2EGHkq+diXTozNaAx0NXlt7YE1U49sQs+4G+KCSBVgG2W1vpurPAEdQbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CH3PR11MB8140.namprd11.prod.outlook.com (2603:10b6:610:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.17; Thu, 25 May
 2023 19:53:43 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6433.017; Thu, 25 May 2023
 19:53:43 +0000
Message-ID: <93544ec1-02b1-9668-2514-5b9e452dd735@intel.com>
Date: Thu, 25 May 2023 12:53:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH v2 7/8] drm/i915/mtl/huc: Use the media gt for the HuC
 getparam
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
 <20230428185810.4127234-8-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230428185810.4127234-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::19) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CH3PR11MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: a68be104-685e-448c-8d56-08db5d59be6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +KRZVWlV/ei5RGxyoh/xEfWOJQz+J3X5kKkaiokePfp4DQHjsSo8Dfsqn5CgQ6oVtSd97uXW6n1V43wf3xE+FoF79dS3Imvv2vKLyRUl2hNm7BiF26tYHf4e/fM8onmmT+dsvJPohyiObtkXtvsBGm86FVg7ZDJb7EGApOPHPfSsBAIxZDad3TKrYj48oGz5pO7Kb+wbSr6CYJy/VLwAzxGTsaAm8A37KUaAUGKwYQ/Gzm92Wprd+qBM/Mqx+5hfGA5J/YFFbynF1it9mjhBU6w2lb0sIufBVDn2BSb8hWdAs6zJAaxF82l25kOUjlWqLXjP7oyNk6cne0bdRxlCEPdfe+C0kx1E7rFapTbydlQ+SbCekc9v8vCzhwYJSb09XcJPodPP0XtOOxJgTa4iX2zy/Klg8x3PFPL8A+1sVI/Qh8ZbCha7RQ+QvkYMEq1vX2LyN4/Lau2LrIMcOJvpf1O+ADyL/ZEHpaRLQXsOHfApjMN3Ej3u9kOhGlg9i3UsxqBhTrRavYzeXCpcnSEVuqNY0sN47ZsABlnCdC1TR5SDxxqfhJRlqUNDPkOhqISDmIHYfsoFefL6DWe2i9HqwL6kFfQEmYpIjj69Zoq2GQGYS6P7fMsHBcgIbxnYmX+vU3r1i3FUzpNzNSxvN8pW4A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(136003)(346002)(376002)(366004)(39860400002)(451199021)(31686004)(450100002)(66946007)(66556008)(66476007)(478600001)(4326008)(316002)(86362001)(31696002)(36756003)(83380400001)(26005)(6506007)(6512007)(53546011)(186003)(2616005)(5660300002)(41300700001)(8936002)(8676002)(2906002)(6486002)(38100700002)(82960400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnhSQktjcm8wa2xqdTlhSmNudEtxL3gyRVhUdXdWMDFxS1JhcEtRM0xlcW9T?=
 =?utf-8?B?cHVMSElnSFpFbXN1c2VRS0ZmWmk5ZTJxYWVLcWpoWnd3Q3BCQUwxSFRDYUlm?=
 =?utf-8?B?NEVLUUZQNk1tdWFEYnBtVnVOc0MyY0syU052U1M2YmR1WCtxQVV5WkJNR2dB?=
 =?utf-8?B?U1FQMGFiNUJLazl3eHU1TXE5QnNyVjEzOWRKTGx0c3lPOXVHSG5CZ0UyNDVx?=
 =?utf-8?B?MEJFckt5TEJWSGJkZTNOemx6YjB4RXMzRnRFQ1pReldZUlZyOXNjRWp1Y3ZS?=
 =?utf-8?B?eWpBQjIwZVY0L280S2lIYUdNc1Y1MHNFb3VLQ3BKRTdRWUI5UnhKalBBMml5?=
 =?utf-8?B?WFdSWVViWVlPVzg0aWYvamVCd21TR3cyeXFJdGI0aDRsNHQrVVJtZUNUUStN?=
 =?utf-8?B?c3BxRjRjR0FyR0pPdEFRWGtjNGtiY0prdUZMRVhFekJ2RFVqZXptbkVSdzV1?=
 =?utf-8?B?UG1mMTBKaFRTS24zcnlLZ3BieitJdEp0SjF4Q2VzQTA0MWZ5VWxQZ0dFL2x4?=
 =?utf-8?B?WXN5RmNwbTRIOFFGVk81Tkp5Unp2VDgzWnRnVW5ZS3BGbWdaU1R4ck5OeEx1?=
 =?utf-8?B?bTBWNG5vSWI4UU1QOGJraG9OenVaODlzVktIeVJOR1VXdjlXaS9NR1E3OVRl?=
 =?utf-8?B?UkxIVkdjaVdsTGJQT01CWFBZcFVJcnJMZnEwa3BXOFJiTjhGaFRSWFZFc0FM?=
 =?utf-8?B?cXdMeXBFemV1b3pEdGI4Tkh1d1g0bk5ydkxHZmNYby9SS0p5Zm1iRGZuWElv?=
 =?utf-8?B?eEFkcXoyR0xhVStHcHBrbWhvNGpOSjNOb0VQeUxZRXNMbElERzNPenZscEVw?=
 =?utf-8?B?Rkc1c2wxcWF6NW5HL1V1dkdGbUJnSWswUnRqNkN3WE1sN2RxS29wVDJFS0xl?=
 =?utf-8?B?Z3UxN0FscGI0TjlTUUNwVk43OWRVN2pqd0g2MDFmc2lXaVQ0cko0MnliSm5X?=
 =?utf-8?B?dG5wRXpvb3VpVFdXWnRrMDlObGZHK2IwaFlETjA0YUgwdmRjUngzSUJhV3ZP?=
 =?utf-8?B?SGFMK1dGUmc3RUFzM25xVXRDclArQURaSmFKdGtDbUx5Sk5Cb2FCU0dRc1di?=
 =?utf-8?B?d1pzSW9McUg2SlBldHdHVUVUd3NoY01MVU5lV0h6MUx4T0pjbG9kVHNxSkl4?=
 =?utf-8?B?ZUZyWEFBdGUwVHRKaVhjUkRKbi8vWXllRHlYQ1hNSDVuQTNtd2VCTmY2eXk5?=
 =?utf-8?B?dVFac0YrKzdFTDl0NFYraXc3clJMR25tZ05SalJ6eHNMbFBuOG5HZEpqa2xX?=
 =?utf-8?B?UHFFeFovMi92ZkZyRkg0TThWR0lDeVZuaWJoeDRXZmpZcG9TUXpnSFExRU4x?=
 =?utf-8?B?cXkza0huczFrTVdjUTFoWDc5a3RjMGFwVGFsWit4a21RdHFSZmNPazROU2Ey?=
 =?utf-8?B?czRHMjNVREM3dXRNdWNyNjQ2Z1NZU1FDSE1JbTU5NnA1OHV6MkFWUHMzeDR2?=
 =?utf-8?B?T2JaOGpWWFlUcmhXanR3UTA3enBINkdiYWtNZ2JkcG9COU5tT3hCZjFWWDE3?=
 =?utf-8?B?S1FzN0V1V25kUzg2V3I4NzJhVk5tQU5IbFYvWVBaYVJySmNOcS9jUXhydXRV?=
 =?utf-8?B?dVNVcWFQQWttMUJXWDI3NGJEWTdoTUMxQ3RFM1ZzczhTV3pGc2hNanNEc3la?=
 =?utf-8?B?TUgyeGt4a0V6S0h1NjBQMlBCL3JPL2Y3M3VYdHZTMTZROUMvNmcxa2Q1dmc0?=
 =?utf-8?B?b0l2TDk3a2c1NWNiZUZTdVQrdHNhc1dqRU90Y0kyemxDZDhTZ2RCOWJhQy9C?=
 =?utf-8?B?YzhUKzloSU03VjFNKzg4aWp5ZWhrOTd4UmtVZnlzQkEyRzdrNFJUWGJLaDcr?=
 =?utf-8?B?NktUTEZSbFoyaVQyS1o4UjFCOGZmZGV3bzRUU0M4U0pVMVpUdUpLRXZxZC9o?=
 =?utf-8?B?dVRpNmFHNEErOTZxRjdDZTZuQlFpNFRvZ2dHYmRiVU16RkdyRjYzYTRjQnh5?=
 =?utf-8?B?b1Y0b1poZVVHR0FHdmx4YngrMzhlNDM3bkFlN1UvOXFUdVNLbkpoQ3dFR2VE?=
 =?utf-8?B?Smc2d2tBcmdlUEJLRnhxYWtpWGJqOXJyRXcxdkd1SlBNUDl1ekd1LzR5YUUx?=
 =?utf-8?B?NndRT09aM3NZa0ZJRmRmQ0RNd0oxSEsvSEdTL0NEUE5WU3hkZWVaTW41U05P?=
 =?utf-8?B?SUZGWGhNUFdka2d6VFRCR1Z3a0VHWWxMZXdnWGZaVVhkVlZ5UTVTK2k1ODAx?=
 =?utf-8?B?emc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a68be104-685e-448c-8d56-08db5d59be6e
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 19:53:43.3804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5DWaEnaFnN0AvqskOjbN6HPVAcrU6jXuARhpOD7BRnLi9i1OaAO3ImFBMGHtG8+1LUzOmZosfUnOfKUAaAVCmFmqMDQaGZBCdv1wb4ikRxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8140
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

On 4/28/2023 11:58, Daniele Ceraolo Spurio wrote:
> On MTL, for obvious reasons, HuC is only available on the media tile.
> We already disable SW support for HuC on the root gt due to the
> absence of VCS engines, but we also need to update the getparam to point
> to the HuC struct in the media GT.
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/i915_getparam.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> index 2238e096c957..7aa47550e4f2 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -98,7 +98,11 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>   		value = sseu->min_eu_in_pool;
>   		break;
>   	case I915_PARAM_HUC_STATUS:
> -		value = intel_huc_check_status(&to_gt(i915)->uc.huc);
> +		/* On platform with a media GT, the HuC is on that GT */
> +		if (i915->media_gt)
> +			value = intel_huc_check_status(&i915->media_gt->uc.huc);
> +		else
> +			value = intel_huc_check_status(&to_gt(i915)->uc.huc);
I assume the intention is to ignore multi-tile complications? As in, all 
tiles are guaranteed to be the same so there is no point looking beyond 
the root tile?

Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>   		if (value < 0)
>   			return value;
>   		break;

