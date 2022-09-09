Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3F25B3DC3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 19:14:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A416A10ECEB;
	Fri,  9 Sep 2022 17:14:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CBCB10ECD9;
 Fri,  9 Sep 2022 17:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662743676; x=1694279676;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4bhnrZinKdy7Pm9fJqtcpLBOBZph6cIICS7E6scEjBk=;
 b=ek4yNnX37iZDET/lzVru6oPVShd9GTjPEK//y0YKCa1xCYIxNKftf8Ph
 PNO4YopFuhRtx4LxHWYg9VB4oqAs1xp67Ppe+xJUINtzXnm1K/D9bMr3o
 xlNeKf30v7hkuINtmsFb0aoM3A9jUgQ8Nd/Zc3+YM4KGqo9o7O4itw9aA
 eC1VTr4o+OQd5R/SYWCqWrDM3LS8BH+oQusb79djVkBvL24tkRma99c5l
 pnqC3+4hmMzUjWg09FpHfwGRu8ARweYsTFIIQwRzwjLQ69imv2FTV9J6x
 FniCVwgA7/cI6ZorHLlzky134R04HJqHb4UrtR2ghvj72HmT0IeHeIdnV Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10465"; a="323740923"
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="323740923"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 10:14:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,303,1654585200"; d="scan'208";a="790880672"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 09 Sep 2022 10:14:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 10:14:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 10:14:31 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 10:14:31 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 10:14:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oe7Y/ybUGZ+rZQp97sn7BJyjrcrkAYzyb4RyfpCLToaoXVCUm+JCL1Yrt1vlump7bmyalNVkxUYrvOzR+l6yp5s4NgQKF81SVrt6xvVqf0G5M7ndgfeE5QuXtTN9sj+hckcKZfiKLeQsrARnrfaOHInqekTt/ZdA2Ixn88UC5Fpo/dJ4woAf9mWzANWnp8xyug65uVl9F1GSAlQj+lu4SwZ3fW3UrH8uk5RyFMcGsnqnmHXlIr+2FoPuSexiYAQ2TR6bWDKBChARZCiMZl7TBen8coaPQ4+NvVFJ/ZR1O+5IW0yHaQ0/r68mSpXNglbGQDoS/Y+wywsBMEJRqGyaQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YOKAgbTXwIRjDdlmpWU1fcvzUFD58+yZlbRKRHEJjpE=;
 b=Wnnw6pl+VmXNtwcTFJMpDxALKzvDoIDB/XijGe5+vIPMJaij5EQlhuF0TcOczJDxBo08a4UP76how/k1OctIkGAaKmdM5KDLomDL+UmCZDYMEFJycI8ZYtbpDxXl5FZZJ8bzyU7a139SLCuMF4l8rhd79jomDMrkh/ZhkN8oZMjll3pvlqrNS1fs5GNcLfWQiBYN8wuqUgiol1qmmu1lL8dgyyUhEJ3Vq261+UDdMZZrSv01bPvmDwEh17EH4XeZx8eZw1H0zKgFoflYZ4dk6t/9MSecdc72ET+WbSVJNZI0kBbjTM61vvv5eCm6QG2nQxJxb9u63lGsDly4oPZVXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1897.namprd11.prod.outlook.com (2603:10b6:3:112::9) by
 SJ0PR11MB5023.namprd11.prod.outlook.com (2603:10b6:a03:2de::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Fri, 9 Sep
 2022 17:14:29 +0000
Received: from DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e]) by DM5PR11MB1897.namprd11.prod.outlook.com
 ([fe80::fc2f:babb:578c:f03e%6]) with mapi id 15.20.5588.018; Fri, 9 Sep 2022
 17:14:28 +0000
Date: Fri, 9 Sep 2022 22:44:14 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v4 11/11] drm/i915/mtl: Do not update GV
 point, mask value
Message-ID: <Yxt0ZjmbJeXP+kyQ@bala-ubuntu>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
 <20220902060342.151824-12-radhakrishna.sripada@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220902060342.151824-12-radhakrishna.sripada@intel.com>
X-ClientProxiedBy: BM1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::25) To DM5PR11MB1897.namprd11.prod.outlook.com
 (2603:10b6:3:112::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef1deb3b-dbd8-4cd5-163b-08da9286c0f4
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5023:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJxWa3toEpb+MMquk+OcMHXFC/pt3MQEm+DZeC5LmNpuPFrbnJnbY7vAuAdQDDSiZF+NS1sYz69OwWR+z8EKFSCGsmqv7PammrY2avXBZrqKZkKiUnogD8Dfa3pWvwt1dQRz3QeCdEIJD+/3Hmy6M8LbOqiJHn5cYPIspujQUjORver13mUPBO46XUjNViYGRF45D9t3oL9w5HLgPcRPEz2uyw57DQXikbR4HFQ2/FL6oJ73YFPMhcloqzHnJFdjhbgxNBAyTFRPSOdUilx2nvQd8R8kT09wWqXRSXBIkqi8YofehTg/R2ZjfdCoIq/IwvzHXFZl+RwnBKR9KGkcY9hRBR65u75wEOMjknIjFc32X3cMs5OI2EQAPLi9D2dDk7FQgJgIv7bSRMVzLGjSm9XyTakMAiXhKZbq1Et5uzB0qAa1byLLIa4GjeL7SbTrUKq60ZtXUE+TlYNWN6UnbcPaViNbtoCbhedQVB0Quelc4EVQBP75bIeCAm7wd95J7jKhOfxj9DyTfEg5aP0bOfUKkeVu5zv75Wb6Elx8+Wg+S/LFKbi+BeqcgWy/0PtG/pPWOLmU6a8iN26edYqUxAwYy13Bajpbctt/g0Rugo95O2qVRIwkoB6u+8QRChcwfek+u57DgUBciHjBHdIt3ZXlE98pXdt8yUBwFiD2t7yUKSovNFpe5TledZNu/k5khRVrwlNX3MdSfQSsXmsgPCCP/ZDTfNquLzupIwW2ivUREUTWVKv19iPWXT6N5F+x
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1897.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(396003)(366004)(39860400002)(346002)(376002)(136003)(9686003)(53546011)(26005)(6506007)(6512007)(86362001)(6666004)(41300700001)(478600001)(82960400001)(6486002)(186003)(83380400001)(38100700002)(4326008)(450100002)(8676002)(15650500001)(33716001)(44832011)(8936002)(5660300002)(2906002)(66946007)(316002)(66556008)(66476007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWFRaFlJUnhFSXo5aFMvNWxHWWpjSnVBUlRJKzRBRys0eDRLMmpLblpqV1FV?=
 =?utf-8?B?WVl3Vk1qaUMrQjNOZm45Ui9wNTZKb25iMVBJWW1iS2FpeUFUSlJLcFdzbXQ2?=
 =?utf-8?B?Sml6ekwremRqU3ExSnNZNUpLSzBSQ2FOOWMzRWxLSXNmaXl6dC9PMXMwd2FZ?=
 =?utf-8?B?T2pTd2tpRFpJS3ZuMUhIc2ZsME5uYWl6NFE3UVcwdStjTmNxN05IV2RhMnBF?=
 =?utf-8?B?K094L0FmZEh1QUJrRUN4SStyTGxnVEVyNUk1ZjNEZUhiS0wvSUtqUWZTZ05y?=
 =?utf-8?B?MytCS09OaGgvamFyVENEVngrNjlWc0hVMHd5OVh2THlOWkFlakwyRU5ycFVK?=
 =?utf-8?B?TXdsb3RFajAwMGZ2cjN3T25xam9UdDVMcm1xWUU2MDA2VkNqNGpGdDl2UU5K?=
 =?utf-8?B?UGNJVVVQL3N2bXhsODFaWUNub2tJZVVIaFUxR1hkdTA4S2Rlc3lhMkIwWlNE?=
 =?utf-8?B?RjByYmhTekY2d0lZOFk4V0Z2SnJLMWlTUEQzelhPRUdOcjJSenB4OUNwcElW?=
 =?utf-8?B?YVhWS2xlSE5KYnQrbCtJN0ZRK1BTL3RIdEdWU1RKQ3NIYU85V1FkRFk2bFBr?=
 =?utf-8?B?SFl2WEQ2YzZ4QmlmN1hNeTg4WWtrZGFDOXE0ZVZ4TFVLdlBJV3Nxb21QS0th?=
 =?utf-8?B?K3lYbWJMQzdIVXFwRW1XUkZEUytPbisvUUZZUHJ5WnU2NWY5MXVnNTE5M0pt?=
 =?utf-8?B?ZnF3RVFqRjlQVVRPQWNic3FDTmlZdTU4RTZsRFZDQVVyL2ZqVjVTVUxCNDFa?=
 =?utf-8?B?bUtRT0Q1UzkyUkJPcXpQRCs1T3hnMkNQRzJjd2RwaGJoTmRiUEdJS1UyYzRw?=
 =?utf-8?B?VUR6S29rYkgyY3g3aUdTVnRHOVRjZ2twNXdFOHhjNEJIcEJmZmRBNWJqM1di?=
 =?utf-8?B?MkJ6UFpIdzk3Z1RJcE0xN3lUNjMyYnQ3ZnJScW9SZklsTHhwakdub1p0STF4?=
 =?utf-8?B?WFhJTldZOFpyeG9nVXJCMTVZVlVGYnhjREFTcnAyeGZzNFBmeEplSGNYbTNJ?=
 =?utf-8?B?ZHE3V0xPYllRV2R2UVc4WGw1ZmhObmozR3UxVjhuS3EybmIvZlV0NDh4LzZS?=
 =?utf-8?B?RTU2dFpsN0JnemE4bHNZeFZ3SFRVKy9GZk56bGxKM3lJRE1scUZvdUh5cEl5?=
 =?utf-8?B?Z2YzaFRRb1dnN0NZeDF4bnYzNDNPVVNtYlptNXVFTHI5Z0RCeE5KMGxpR1Jl?=
 =?utf-8?B?c293dXY4dXFBc3JtZFpiMHB4azFJaVZPSysrbnlmUm82T1EzT200MW9yWk1Q?=
 =?utf-8?B?UWRPMW11b2d3SHZGS0liN1dvQkpONytkNUZSYXE5ZVBqS013QnFVNDgrK1Er?=
 =?utf-8?B?RGZsTklFT3duV0xkbEcwNEdhSmhPc3NkWldicG9UNmF6SFQ5ZG1GdzlWa3F1?=
 =?utf-8?B?SEQvYkkrOHFnL2J2U1ZsRDdwT1VpV2dHRlV5SFNUQWh0b2F3WW0xeDdUd1R1?=
 =?utf-8?B?L1NvZ2oxLzljNGtQTllscEdsSmxSbnhsMzJYVXRYMTVRYWpOOHNJdWZFYUdq?=
 =?utf-8?B?b1YvVmZ5clpQbjBKZmxqK3FPQmlIclVLd01kYUt1QW41bEc2UU5VeE5DUWtu?=
 =?utf-8?B?alBzVDlQS1VxMmJHUkgxV2I2TTRjWDVmWXpUYjlvSmlWeDlSU2RqOTFablpj?=
 =?utf-8?B?S0VQQUJJcDdnZGpsbFErazY1bUZUbUt6NDA0VFUrYmR5NExCaEg0WDdmSVMz?=
 =?utf-8?B?ZkRVb21mRG1aQzhTSHkyeUdVV2QrMlNib1VhbUZTMjNKR3VnSHQ2Y1RnelpV?=
 =?utf-8?B?OG8vWTFIVllqa29od0h5ZnJxWjFnaTcvbWJtbmZBdC9JQWlrcm5hT0VhbWsy?=
 =?utf-8?B?VTRXbWFSOUVJRC9ndG5iL3lERFM4VnB0YVVRZDRnNEt1MThSSkJNa1RKajZW?=
 =?utf-8?B?cnZXaDdlVTZ6VVhVYmRzbWpOMm9tUGtBMjA1dm9abktVRzBIRW5jYm80TWpo?=
 =?utf-8?B?MFBVZzFHQmNyMTRtYTc3UzdFS3U2UkFKSEdYOVRFL3M4L1MxaHpZN3NmTWdl?=
 =?utf-8?B?SWxaelBNQ05iWi9rUTV3SFE3WGJNM0lqdnFpM0hJdDdqcHhzTmVWRHdZV04w?=
 =?utf-8?B?UnJuTUpIdEM0dk8xTmMzR05ZMEtCczUvTjM2N2JzWnJLRU1icHZ3WlB5aTcy?=
 =?utf-8?B?T2g0MVhtOEpqM2NWaVdPSHhvZEM3YmlJaGIrZGJsQmh5OGNhWUdjWXgrL3lH?=
 =?utf-8?Q?BoVV8yHDTGKXRej0aGwZxGM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1deb3b-dbd8-4cd5-163b-08da9286c0f4
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1897.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 17:14:28.9184 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jd1vJXHny/pbPSysqbGdP7Ry2Mz6ODQiOwWVxKE1FYVL6vkvJOI1gSoYySISuiqDKSkJ4Jc32JqWiZbGIB7fo+HYu3lvuSgXC6VrQxL4A2g6RrLlK44F3+FKhG4eo/8J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5023
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

On 01.09.2022 23:03, Radhakrishna Sripada wrote:
> Display 14 and future platforms do not directly communicate to Pcode
> via mailbox the SAGV bandwidth information. PM Demand registers are
> used to communicate display power requirements to the PUnit which would
> include GV point and mask value.
> 
> Skip programming GV point and mask values through legacy pcode mailbox
> interface.

I agree to Matt's suggestion in v2 of this patch series, to move this
patch to the future series where we would introduce the new pm_demand
interface. It would make more sense there.

> 
> Bspec: 64636
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Original Author: Caz Yokoyama
> Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
> ---
>  drivers/gpu/drm/i915/intel_pm.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
> index b19a1ecb010e..69efd613bbde 100644
> --- a/drivers/gpu/drm/i915/intel_pm.c
> +++ b/drivers/gpu/drm/i915/intel_pm.c
> @@ -3923,6 +3923,14 @@ void intel_sagv_pre_plane_update(struct intel_atomic_state *state)
>  {
>  	struct drm_i915_private *i915 = to_i915(state->base.dev);
>  
> +	/*
> +	 * No need to update mask value/restrict because
> +	 * "Pcode only wants to use GV bandwidth value, not the mask value."
> +	 * for DISPLAY_VER() >= 14.
> +	 */
> +	if (DISPLAY_VER(i915) >= 14)
> +		return;
> +
My suggestion would be to remove the DISPLAY version check here and do
it at the place where this function is invoked from. So for versions
<14, intel_sagv_pre_plane_update can be called and for higher we need to
implement the new pm_demand interface.

>  	/*
>  	 * Just return if we can't control SAGV or don't have it.
>  	 * This is different from situation when we have SAGV but just can't
> @@ -3943,6 +3951,16 @@ void intel_sagv_post_plane_update(struct intel_atomic_state *state)
>  {
>  	struct drm_i915_private *i915 = to_i915(state->base.dev);
>  
> +	/*
> +	 * No need to update mask value/restrict because
> +	 * "Pcode only wants to use GV bandwidth value, not the mask value."
> +	 * for DISPLAY_VER() >= 14.
> +	 *
> +	 * GV bandwidth will be set by intel_pmdemand_post_plane_update()
> +	 */
> +	if (DISPLAY_VER(i915) >= 14)
> +		return;
ditto
> +
>  	/*
>  	 * Just return if we can't control SAGV or don't have it.
>  	 * This is different from situation when we have SAGV but just can't

Regards,
Bala
> -- 
> 2.34.1
> 
