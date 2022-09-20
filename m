Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B60B25BED6E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 21:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D05A10E759;
	Tue, 20 Sep 2022 19:16:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D7F210E755;
 Tue, 20 Sep 2022 19:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663701411; x=1695237411;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=62Hl45vblpkyNjA+CV34OhZfkK5xVdC94+Q0ub1KXsU=;
 b=lopq5ofF74gFjh5Qk5jMp5RgpGmOcDdrnoGYLdA2E/JQMOn0ifj0istn
 6MvbfBniUrBmp1F1kjXs8OJ1n3xm9IqhNiUpr3wGWOAexTGRt10VxEt7L
 iHsd6loQz6tmqPJLfrKrQrJW87++9d1InGl2jJKCDzRMNnuxh3LF3HN88
 nSu4aJZU18z/itD5p0iUgD8WWx9qMWWLJobv/+DzLwEc/nSkVblg0fS7Y
 N3vSTrEdxTbBGeWj9us2R9iF4tUCl1tnYcr9qJHiOhyyIzl1rGKPGURYO
 1UHrqZclwillBZ1twQMMsGxBHEaepeh9LtJwU3NRo6zHSH1WTrKOO/dFz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10476"; a="326104976"
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="326104976"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2022 12:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,331,1654585200"; d="scan'208";a="621388732"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 20 Sep 2022 12:16:50 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 20 Sep 2022 12:16:50 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 20 Sep 2022 12:16:50 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 20 Sep 2022 12:16:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIAhfXfj2XaFhOJVKjtpiGHogfH7Ypy3s8zQrsVjgmmuk1ENKLxvWs7TBJFYCh+erlhVrRe/kKzofHB0Iw4jIfhZ6240wy/kQK8hxjmC06dIWsQTkPFkWVpybw8AXgmcYYZ8g9ykujTrqxQTK2TxqWXP3Z/noQ9D+cN1Snci42GnKZCjSc4wcqAtpayroC9n+MlM4/yp9sHLbVHEszEHZA1LV+PoKEvMTRPTflYw1VFZcs+O5LyQWf9HmJKr60jesSCY7Td0LRaL0+aersbb/nXjUAq/EVGXF4VnhgGdJse940mYD+F8qeqnej/ks7uSnbQVUb4QMzJc0O9qGyb1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omKIswzSSf+HvV/JPIuw4YllSkjJwHsPvFy6yVVq6Kg=;
 b=P8n/9xwVmCvsZz7dXNxrAAj/Q4VYkZddT5HnMFsLfeGK3IVUaqN2v+5yOoioQmOtSklOunuILmbx+kdYBv1bEQdW6XxmEsC0095XO/RxP7eTE7i/bputSF8riJ/T2wVTniHJMVVbn6klODnSYdfEmx10ScvB7kK19g32yzNvpsgW3dKslmF3kg9UYK9ZD9WB8m4fNkTNVMTzYoMNEcSPuCvyEVZKnDFcu0XbLeHV0eVOZAJNIbl/dKGGSC4jN1tAY/WF3Yzkq4t6EtOlUH9j5P0z+WaBuosFnwaml/tlethqsSUI20tNguOpqzbUPAKbnOPxLqzUTSDh+aQArKSeuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5108.namprd11.prod.outlook.com (2603:10b6:303:92::9)
 by SA1PR11MB6712.namprd11.prod.outlook.com (2603:10b6:806:25c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 19:16:48 +0000
Received: from CO1PR11MB5108.namprd11.prod.outlook.com
 ([fe80::60be:993e:a3fc:1cf9]) by CO1PR11MB5108.namprd11.prod.outlook.com
 ([fe80::60be:993e:a3fc:1cf9%9]) with mapi id 15.20.5632.021; Tue, 20 Sep 2022
 19:16:48 +0000
Message-ID: <b8a4eb14-f378-c0a5-df93-622845c330b4@intel.com>
Date: Tue, 20 Sep 2022 12:16:47 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH v2 2/3] drm/i915: Split i915_gem_init_stolen()
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-gfx@lists.freedesktop.org>, Caz Yokoyama <caz@caztech.com>, "Aravind
 Iddamsetty" <aravind.iddamsetty@intel.com>
References: <20220915-stolen-v2-0-20ff797de047@intel.com>
 <20220915-stolen-v2-2-20ff797de047@intel.com>
Content-Language: en-US
From: Wayne Boyer <wayne.boyer@intel.com>
In-Reply-To: <20220915-stolen-v2-2-20ff797de047@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::28) To CO1PR11MB5108.namprd11.prod.outlook.com
 (2603:10b6:303:92::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5108:EE_|SA1PR11MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: 2de1706e-89ac-4d13-24a5-08da9b3caa2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kdMzsio5tdbgpMh7o6ILot1Cwk2lExK4ekIcSftWrqOzYZ7r3zSGWms0sejirwuTuz+JS8emdS20PraFztY3HloYKW9kUBKjGsih+RqQJloS12UkWBRGNvn9hiobvUECMTSo0ep3g37BAQOPjILX1E4GRlME7z1U32TcoEAlkJM9KD/dVW7ohHG4OxeXu3uK0Mtk/+wBCE4N2P8VvVin1uPkiK7DGdR7o+U/9Aphh9pi4SPm6MEQVDp9NCvz/WLCrM/GA4RhsWTCbgj8njx3Y/tf9M+nZMfJOD/0o3WspTtSUBONJ0Ay8fjdN6v/1VuMaL8d/WU8ULIjMLkwt870+4S+uue54VPVLKrRr6EPK4Txgx8rYA0w5yb8R9MIPiRA+xJHqIxHIY6fyocKK+Ht0IgR6SN0eLpP3iFWqrJG/8B9ozuXbYUX0lL/XP9IvoCinhvQbWltxDad4nyszSFEzxf1t6O/gWmEKq2Sb1lDQFVd+t7IJ8MN+ACLLgRIUqQIkbU3wzgyq+wRSa1RhS67oO1smJw44dgtn4ImJCNqOF7T8dPWqIH4JK8z5yA+Xs/5vwsndOFaO8rihFV85uDcJuuBbrhMUYdDPp/YqKDtsTg713ViewaXxudmiPDLxpJbNb0dr8maXgIJHMkQhPWtU4HiA/aacQmv4vOkCRooxz9Z4ndJxm6UeFlZKijKGEbyXTYHhxNcEA2/R6Qx7xSStVZusygrDX/SawxPjGAjSXXdlAxxXwsk9UDZWddZkB4NGXqlh2zXcEImeZON2fDaJW3oyZhMzzZLbjLyZt+esM8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5108.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(396003)(366004)(39860400002)(346002)(376002)(451199015)(36756003)(6636002)(66476007)(66946007)(5660300002)(8936002)(316002)(110136005)(31696002)(66556008)(86362001)(4326008)(8676002)(38100700002)(82960400001)(83380400001)(6506007)(107886003)(53546011)(6486002)(41300700001)(478600001)(2616005)(186003)(26005)(6512007)(31686004)(44832011)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T0hRZnBwNTBQbWtMZUthdlNqMmpXZXNJMFp4TWc2RVlPeGdzTXAxcEVkTXVY?=
 =?utf-8?B?d2FHcGd0SG9uQ012SHc0eUxIQ05VUGFCRWpNc1FCdldZZGhHNTVGbC9JNVhh?=
 =?utf-8?B?UUhVK2VicTBubGo5WTY5cDArUzQ0M0JTQ29kV3JGSGROTGpmWkkyVEExWjVZ?=
 =?utf-8?B?RTRzTk1tSEp6ZFlaQ1JmM1o4cnhOV3ZRaVI4UTVSaVhJYVJTRGMycjErMm9B?=
 =?utf-8?B?NjJISFZQeUhldHh1aTBWd0pnaUVHUUQrQis5V1JtcHo1MXdyOVpWRks1b2VM?=
 =?utf-8?B?U1dqYmdQQVI3YWRjTW1uRGhRNS9PNDNrUFhMZUpRN1U0NEMvbjJVZ01BSG1r?=
 =?utf-8?B?czZ0S1RIc0FTWmczRHFLeS9Xc2p5N2N6cHRnUTV2WHc0VTA5WHhteFBYbEJQ?=
 =?utf-8?B?QmY3MU14RXBaK0NMd2ZmK0RNZXRXODZXNXRPZ3pJWU85MmUyWnpoY3dxd2ZL?=
 =?utf-8?B?bHhEREhOb3BBYm9WUFhjME5rMkUrVDRwZllxa3htcnVZTE5PTGxUNnRRRjRV?=
 =?utf-8?B?bW1RQ3RzQ0ZzTStSWWRuUDBCQkI3eEdSM05ZV2E0dTdURll5VS9iRDlZeHM5?=
 =?utf-8?B?OU1kY3p6bFFhN3B2cmU2VzErNmR1cGVMZ0FDTWwrMTdaVXI0NG1FVzhRcWQ2?=
 =?utf-8?B?bzJzRkdJZVBKYTJiSWhtRWRqN2V2d3BrVEtWN0dFcEdvZFdOc2FhdkJWVDho?=
 =?utf-8?B?R2VyTmYwa24wakZ3bUxIZ1VWMFM2aFZhZ3BGbk14TW9LNUFHZ1Z1ekgwT0lu?=
 =?utf-8?B?VlR3VGRtQ0VEY1VkUVpqYWlnUXBpUWZWOVhIQlRQajEyRVlmVmFDb3laU3Fz?=
 =?utf-8?B?YnhndnVFc2Q4NU5TeWRTb2lFMUNsV2tuK283WTlWL0dJeWVrTERFK3RVMHhO?=
 =?utf-8?B?dDlsR2NyT2IxczJHWWVYNVF0cnZhTlRYVWI3RnFRMFlqQWlUTjhQTFVrUUow?=
 =?utf-8?B?Y3U2S1F6MWswRm93emRmcXJNQmZSeENGNUtvRG12ekpMbWtNZ2Z3dFYxWEVB?=
 =?utf-8?B?Mkc0bTVFdklMRWs0bUtaSHNMN25VVTF1em9ZMXU3M25aMjdjTTBscXJPbDVJ?=
 =?utf-8?B?VGZVb0JRVHFGR2MrbEtPc0dReTVZdzdxUEEvUS92RnFzODR4Mk53QTNvZlNs?=
 =?utf-8?B?R2lOS3dkekIzZ0lDZ3I2LzAyajdRVzhHc1o2eUNKaVl5c052b2dabGVMcVVt?=
 =?utf-8?B?eFYrb2NBVDdEMDVSSmpWaE5wVWhOWms1aWlGb1Zxc0REelprOGFDd3NjUGsy?=
 =?utf-8?B?VHp0SUpGaEd1YnVYdTJYOFd0UlF1K25kSmpjd3JGWjFyZGxiYnJoRmIxRW9T?=
 =?utf-8?B?Q2lyUEdlMWRzNTZhaHBiejdEbWtWUVROeEdHenEvRUVmMEJWeGlMeWU0SmI5?=
 =?utf-8?B?SlpaRm1Vb3FuTFdtMnYvbDB1Rm95eFlLcFFKa0hweWdNTDhQeklzUFpQNkhk?=
 =?utf-8?B?YURFbndrcG9xK0lsTWF4LzVPV0cwVityLzVKUjI5WUN0RWdXWE9wNXo4d1No?=
 =?utf-8?B?N0lPUDNCVTQ1MHE2aVg2blA0NXdHUllsT01NYXZUeFA4bTZRK2Q5Z2ZqL051?=
 =?utf-8?B?OWxXa2MrK3pDaStNSzFSWEtSVFJLZDc3K3E5QTFpK2h5K1B0QjRYOGtQVXdz?=
 =?utf-8?B?Q2UwdE9JQlpDZEJBU29qN0ZSbEgzZS9vb0Z6YWxUQ0YycDNXcnY5SnVEa3Zw?=
 =?utf-8?B?cTZWR3hQRXM1TEYvYXpSTHB2OUh3RHBIMXMyL3dpMWwySHFDUzlWaUszRzU3?=
 =?utf-8?B?L2tabEdYTGpHSE5wQTE2dDl3ZHQrWHhsRmcyTDFqUUtSQmdUMjBJdDFkUlBT?=
 =?utf-8?B?cWg5dVQ5UmdTKzU4M0xXZGNKSlpwT29WTDgwdmc0UVVCQ0ZIQnRFR0szYTdG?=
 =?utf-8?B?WHg5dGdveVJQcmF3WVM0ZlBMblZvVTNOR1ZqclpnTjlDeFc4UlhhdTl0MVFM?=
 =?utf-8?B?MU9ZSXJwZjNvL2M3M2RudTM0OHBvbWhtS01zMkt5clZDakpVS1ZtaW4vVXk5?=
 =?utf-8?B?bDI2RmllWWhqM3lOSTU0ZUpaak1BWU1kblJTRXplV2c2am5XeEplVEFVa0dI?=
 =?utf-8?B?RjRPaTBJWFN5dlhsOVlPUnJFTS81c0VJYitxM1BiOEFWZzljTFJWODVqcVp2?=
 =?utf-8?B?bXQ3QVZHZUIxZGJ6TnMwaThyRnNPOU5tMjE4R3dtcVdXNzVwYjdUMWNSWjMx?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de1706e-89ac-4d13-24a5-08da9b3caa2b
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5108.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 19:16:48.3830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7TJqS/l21vz5ZDhYlEbqNxq3+lUsFClaZ2oSlJQGH5earcJp+mg8JYj/KTAVBSCniCEmlOpB0kKntHP4xn/9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6712
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
Cc: tejas.upadhyay@intel.com, dri-devel@lists.freedesktop.org,
 radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 9/16/22 10:36 AM, Lucas De Marchi wrote:
> Add some helpers: adjust_stolen(), request_smem_stolen_() and
> init_reserved_stolen() that are now called by i915_gem_init_stolen() to
> initialize each part of the Data Stolen Memory region.
> 
> Main goal is to split the reserved part within the stolen, also known as
> WOPCM, as its calculation changes often per platform and is a big source
> of confusion when handling stolen memory.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> index 3665f9b035bb..6edf4e374f54 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
> @@ -77,22 +77,26 @@ void i915_gem_stolen_remove_node(struct drm_i915_private *i915,
>   	mutex_unlock(&i915->mm.stolen_lock);
>   }
>   
> -static int i915_adjust_stolen(struct drm_i915_private *i915,
> -			      struct resource *dsm)
> +static bool valid_stolen_size(struct resource *dsm)
> +{
> +	return dsm->start != 0 && dsm->end > dsm->start;
> +}
> +
> +static int adjust_stolen(struct drm_i915_private *i915,
> +			 struct resource *dsm)
>   {
>   	struct i915_ggtt *ggtt = to_gt(i915)->ggtt;
>   	struct intel_uncore *uncore = ggtt->vm.gt->uncore;
> -	struct resource *r;
>   
> -	if (dsm->start == 0 || dsm->end <= dsm->start)
> +	if (!valid_stolen_size(dsm))
>   		return -EINVAL;
>   
>   	/*
> +	 * Make sure we don't clobber the GTT if it's within stolen memory
> +	 *
>   	 * TODO: We have yet too encounter the case where the GTT wasn't at the

nit: as long as you're updating this comment block, s/too/to/

Otherwise,
Reviewed-by: Wayne Boyer <wayne.boyer@intel.com>

>   	 * end of stolen. With that assumption we could simplify this.
>   	 */
> -
> -	/* Make sure we don't clobber the GTT if it's within stolen memory */
>   	if (GRAPHICS_VER(i915) <= 4 &&
>   	    !IS_G33(i915) && !IS_PINEVIEW(i915) && !IS_G4X(i915)) {
>   		struct resource stolen[2] = {*dsm, *dsm};
> @@ -131,10 +135,20 @@ static int i915_adjust_stolen(struct drm_i915_private *i915,
>   		}
>   	}
>   
> +	if (!valid_stolen_size(dsm))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static int request_smem_stolen(struct drm_i915_private *i915,
> +			       struct resource *dsm)
> +{
> +	struct resource *r;
> +
>   	/*
> -	 * With stolen lmem, we don't need to check if the address range
> -	 * overlaps with the non-stolen system memory range, since lmem is local
> -	 * to the gpu.
> +	 * With stolen lmem, we don't need to request system memory for the
> +	 * address range since it's local to the gpu.
>   	 */
>   	if (HAS_LMEM(i915))
>   		return 0;
> @@ -392,39 +406,22 @@ static void icl_get_stolen_reserved(struct drm_i915_private *i915,
>   	}
>   }
>   
> -static int i915_gem_init_stolen(struct intel_memory_region *mem)
> +/*
> + * Initialize i915->dsm_reserved to contain the reserved space within the Data
> + * Stolen Memory. This is a range on the top of DSM that is reserved, not to
> + * be used by driver, so must be excluded from the region passed to the
> + * allocator later. In the spec this is also called as WOPCM.
> + *
> + * Our expectation is that the reserved space is at the top of the stolen
> + * region, as it has been the case for every platform, and *never* at the
> + * bottom, so the calculation here can be simplified.
> + */
> +static int init_reserved_stolen(struct drm_i915_private *i915)
>   {
> -	struct drm_i915_private *i915 = mem->i915;
>   	struct intel_uncore *uncore = &i915->uncore;
>   	resource_size_t reserved_base, stolen_top;
> -	resource_size_t reserved_total, reserved_size;
> -
> -	mutex_init(&i915->mm.stolen_lock);
> -
> -	if (intel_vgpu_active(i915)) {
> -		drm_notice(&i915->drm,
> -			   "%s, disabling use of stolen memory\n",
> -			   "iGVT-g active");
> -		return 0;
> -	}
> -
> -	if (i915_vtd_active(i915) && GRAPHICS_VER(i915) < 8) {
> -		drm_notice(&i915->drm,
> -			   "%s, disabling use of stolen memory\n",
> -			   "DMAR active");
> -		return 0;
> -	}
> -
> -	if (resource_size(&mem->region) == 0)
> -		return 0;
> -
> -	i915->dsm = mem->region;
> -
> -	if (i915_adjust_stolen(i915, &i915->dsm))
> -		return 0;
> -
> -	GEM_BUG_ON(i915->dsm.start == 0);
> -	GEM_BUG_ON(i915->dsm.end <= i915->dsm.start);
> +	resource_size_t reserved_size;
> +	int ret = 0;
>   
>   	stolen_top = i915->dsm.end + 1;
>   	reserved_base = stolen_top;
> @@ -455,17 +452,16 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>   					&reserved_base, &reserved_size);
>   	}
>   
> -	/*
> -	 * Our expectation is that the reserved space is at the top of the
> -	 * stolen region and *never* at the bottom. If we see !reserved_base,
> -	 * it likely means we failed to read the registers correctly.
> -	 */
> +	/* No reserved stolen */
> +	if (reserved_base == stolen_top)
> +		goto bail_out;
> +
>   	if (!reserved_base) {
>   		drm_err(&i915->drm,
>   			"inconsistent reservation %pa + %pa; ignoring\n",
>   			&reserved_base, &reserved_size);
> -		reserved_base = stolen_top;
> -		reserved_size = 0;
> +		ret = -EINVAL;
> +		goto bail_out;
>   	}
>   
>   	i915->dsm_reserved =
> @@ -475,19 +471,55 @@ static int i915_gem_init_stolen(struct intel_memory_region *mem)
>   		drm_err(&i915->drm,
>   			"Stolen reserved area %pR outside stolen memory %pR\n",
>   			&i915->dsm_reserved, &i915->dsm);
> +		ret = -EINVAL;
> +		goto bail_out;
> +	}
> +
> +	return 0;
> +
> +bail_out:
> +	i915->dsm_reserved =
> +		(struct resource)DEFINE_RES_MEM(reserved_base, 0);
> +
> +	return ret;
> +}
> +
> +static int i915_gem_init_stolen(struct intel_memory_region *mem)
> +{
> +	struct drm_i915_private *i915 = mem->i915;
> +
> +	mutex_init(&i915->mm.stolen_lock);
> +
> +	if (intel_vgpu_active(i915)) {
> +		drm_notice(&i915->drm,
> +			   "%s, disabling use of stolen memory\n",
> +			   "iGVT-g active");
> +		return 0;
> +	}
> +
> +	if (i915_vtd_active(i915) && GRAPHICS_VER(i915) < 8) {
> +		drm_notice(&i915->drm,
> +			   "%s, disabling use of stolen memory\n",
> +			   "DMAR active");
>   		return 0;
>   	}
>   
> +	if (adjust_stolen(i915, &mem->region))
> +		return 0;
> +
> +	if (request_smem_stolen(i915, &mem->region))
> +		return 0;
> +
> +	i915->dsm = mem->region;
> +
> +	if (init_reserved_stolen(i915))
> +		return 0;
> +
>   	/* Exclude the reserved region from driver use */
> -	mem->region.end = reserved_base - 1;
> +	mem->region.end = i915->dsm_reserved.start - 1;
>   	mem->io_size = min(mem->io_size, resource_size(&mem->region));
>   
> -	/* It is possible for the reserved area to end before the end of stolen
> -	 * memory, so just consider the start. */
> -	reserved_total = stolen_top - reserved_base;
> -
> -	i915->stolen_usable_size =
> -		resource_size(&i915->dsm) - reserved_total;
> +	i915->stolen_usable_size = resource_size(&mem->region);
>   
>   	drm_dbg(&i915->drm,
>   		"Memory reserved for graphics device: %lluK, usable: %lluK\n",
> @@ -759,11 +791,6 @@ static int init_stolen_lmem(struct intel_memory_region *mem)
>   	if (GEM_WARN_ON(resource_size(&mem->region) == 0))
>   		return -ENODEV;
>   
> -	/*
> -	 * TODO: For stolen lmem we mostly just care about populating the dsm
> -	 * related bits and setting up the drm_mm allocator for the range.
> -	 * Perhaps split up i915_gem_init_stolen() for this.
> -	 */
>   	err = i915_gem_init_stolen(mem);
>   	if (err)
>   		return err;
> 

-- 
--
Wayne Boyer
Graphics Software Engineer
VTT-OSGC Platform Enablement
