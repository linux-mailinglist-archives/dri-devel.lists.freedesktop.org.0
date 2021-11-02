Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4068244248E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 01:19:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036E06EE31;
	Tue,  2 Nov 2021 00:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221756EE31;
 Tue,  2 Nov 2021 00:19:55 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="218344407"
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="218344407"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 17:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="449155268"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 01 Nov 2021 17:19:54 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Nov 2021 17:19:54 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Nov 2021 17:19:53 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 1 Nov 2021 17:19:53 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.45) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 1 Nov 2021 17:19:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPTWRhsjGFJ+2kP11/lslGE/hd4VCiULO93wuQvxfdOS0HNLJiLq/dEe92GAS/wF34uHeImNzZIeAHRx7qlyrFYvkW4psvEGFv4SxVAvtIOAFiLC9gENel84uGFMI4MTHaLvJm0tjl99nlPhS7GlF2XSbC4iatJ8BH/tAV2eeSqSRLxMRJ0jP2vTMYRuUn2QfjDgu0jwVH9fkiXyt73pR/eEgHj85FU/TtqCKCby6pQTmAjDaKfB23YOgHcuxP7JBWS75rGR9jolXNFZMo9w0g/cC+dUl3HMCh8neMxSKuhhzj2o2pRo6cG0kCPQ3/JqxypAesO0esF4jQthtgl/dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IxWT7N6tIs/OJbegk11tOfFsR7xNZCJ4wlerlYvL0jQ=;
 b=a/ztjWHkothpKXlVCnWhgty44PNX6yBl0t83S7nYz+t8JQJIApwtaj3z/r0/pb76n903O6myhSPGfa2w6xPGOcZ2VfQtBVyhGo5/cTmtvt9yOoaVsnyhzTNe7UiSgLBx/pnfVrcXrFWsdl49Ti9G6NpsNh5wvyY5DUnawFIu7c0LI+Ep+aNLV0Z9lMXT7DvKOsvWZfWsaM60/6paLs9mrYBjnYDLmhXs/5ILJGbQNVVuF7uheEEXMn3Rzp8p7lZG7F6wD78GO7d8FE5k5axWZbxmQ3zGbPUE+rHgzbo4bGFWk06Kvk1PlFd309xdvV7KX8eXhWzKEtJiKTX5RAfXzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IxWT7N6tIs/OJbegk11tOfFsR7xNZCJ4wlerlYvL0jQ=;
 b=y2MIPiMFnKlJ0vfAL5SAWMLUhwH9OICqv/WYAJ26aOPme+EW26jl54EqdIeRCQne/INkfEuHtnUNxXZDOkvnmwMSdNugHQsFA5LY7h/UN7SBX7Pl+dIJ2x7NyiA+jU2VP+2ITp+oplblsO2MD1VKlyqm7L2OU9cAYUSO1CgKE2M=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5667.namprd11.prod.outlook.com (2603:10b6:5:35b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Tue, 2 Nov
 2021 00:19:46 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::912:121e:18c9:732a]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::912:121e:18c9:732a%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 00:19:46 +0000
Message-ID: <61bcf30a-7d4c-d2ee-11d6-70d9c990ea27@intel.com>
Date: Mon, 1 Nov 2021 17:19:44 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH 2/3] drm/i915/guc/slpc: Add waitboost functionality for
 SLPC
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20211101043937.35747-1-vinay.belgaumkar@intel.com>
 <20211101043937.35747-3-vinay.belgaumkar@intel.com>
 <87pmrj39k9.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87pmrj39k9.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR16CA0016.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::29) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
Received: from [192.168.86.49] (98.255.111.182) by
 BY5PR16CA0016.namprd16.prod.outlook.com (2603:10b6:a03:1a0::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15 via Frontend
 Transport; Tue, 2 Nov 2021 00:19:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6472df20-2a81-4d6e-6322-08d99d9679dc
X-MS-TrafficTypeDiagnostic: CO6PR11MB5667:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CO6PR11MB566742507555C0D54036D9E7858B9@CO6PR11MB5667.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MYx8QFKjGJL66TI3QD1/37/UVqQUoosO5NqeQ9yvCC6MrdC3rQrj5p1TKKwlZ2pneHVwerTkiWe/iSEsxMq4LfNbNa8UUaxr4lb0u+1begcG1VAZemMvQYBwPMrz64WS7AeYhqovy6Sn8erqrldCRF58B+4CVLxC843eV8KKIFqVLswl2Nd0cxkB+9j2wUtCGDwsJ73JYnWdqmIoc/1gYBCmzmmDDPnQInJXu3ywxO21MT5EnRmhpJntXWPdmcH802r7U8opqDsu+SqpPLiUKK4ncD0k507ZZgrbPxBWZrNIWhyher+1tZVrCaVyvczFaPWesYGBIUh/Xamq9qlX63aIBQQ8eJP35SkTHxQjayTCPcaOudp4GrH6ZdpGWdytJW/Fad/gddm+iotgn7owlZ4dBtcB+Bdw9tgBfr9q3H4YIhYFqk2Uvr9ANRifxarYUgBeJ5K7WT54uUlEW6OQ49DTiBD0TvRimMnMLiz5yGUZVkOd8v5JjtgF8pIJuaRE6LPBiTgKNhJaqB1hh/wwODdGDRk9xaJEcmeHaSrQt0Zm09zfPUkYPHMV4L7X+wgG2c2lCnSTVWYIx5eHAkQHBdJJA21dY4rngHpeAumbHiXJbZg9MJejtA6epe3GgdHJOy4m0ZvWLvMI7M59Qx4vZvF2dNCco0r8eSzDEBfL/4A6KxHxNlq0nlFKW97Gb9C6chbcg7e7TzeAdODtPXNm4SZAg3hT+PGvZo7R/9ZPcOw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6636002)(186003)(53546011)(6862004)(54906003)(66476007)(66556008)(66946007)(2906002)(82960400001)(26005)(16576012)(31696002)(31686004)(38100700002)(316002)(83380400001)(5660300002)(8676002)(6486002)(8936002)(37006003)(4326008)(36756003)(956004)(2616005)(86362001)(508600001)(450100002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0xKQnU5QTFIdkw5U01ET2hkbEZ5S0lEQWxNVzAxQTdlbDlUWmp5Qy9xb1hr?=
 =?utf-8?B?cHZaMFFhMGUrRitmUEI2MW5TOERwUURldXNudzE1UEpHVUY3WTBiUTRDNzhq?=
 =?utf-8?B?cHVFZEtqTzhKUXZLVXRQZDBMMitWNXlUOUptc096ay9PNStlQ1h5ZTNEaWFW?=
 =?utf-8?B?M2thTVg2UmxxenFSbEgyM0lnSENEQTluUE1zMmpIVUcwSWF2TVVTbDJ3QnE4?=
 =?utf-8?B?ZFg0QVBsNWg1cStHMXhyRDRaMFVrNVpvSUNwb0o2aDlPL1VkUWRHbmN6UTZO?=
 =?utf-8?B?NTBUa2s2bGp6UXU5WWtpRXJ0NURFNkZ0aWx4R1JGZG1iRkUwSUltY3FYZlF1?=
 =?utf-8?B?M3N2MDZOZ0tIMFR5TmJtYTNMTWJDMFZ1YTFpVXVUR1dVUDNXMHd3K1JVS1c1?=
 =?utf-8?B?Tnhkck1ya1NMdWtRcDBBdUM4K1BSYXZvYmNudm9WelRMSHhYYWVSOGdSKzFW?=
 =?utf-8?B?dTRuT3Y5UWRWS1JVbzFGdFo4dExyQkQwaFVlRUxVTE9MeUhVc01sMnBMOFNz?=
 =?utf-8?B?NEE2bEU2QUdsRzZXK25PQUFkQVk1cjA3MVpWTlcrelhLbm1NMXp2c2V2cTgv?=
 =?utf-8?B?bjZLMm8wUVBPTHZRcVVmekFLT05Nb0l5MmM0Vnd3ZHU0RlNPTWRmYlU3QmVi?=
 =?utf-8?B?UnNxV3VVODJGYmRXU1lFWkdEY0dDZkZXbENONk1lckRkMCtESDNMRUEyM3pv?=
 =?utf-8?B?cTZsMG9wTVpERldKMnM1YUhoQ0pBeEU1NWtVNGgvbWpkb1Fwdld2RDhaTkVj?=
 =?utf-8?B?VitsTDZFVkRiZzlxc1dWZXFEWG5hZ2pUdGpDU2twa1VKaHEzZ2ZiRXYxaTN4?=
 =?utf-8?B?Szhmb0k0cjY1Tjl2Q2JvZXYvTExLb01NQVlBd2RLbTVrTHVTK1ZseDlvK0Rp?=
 =?utf-8?B?K2ZsYVFMWXVGOWVDOFc1YlpsVkxJQ09xRzdKeXIrL1VXOU1OMVRKYldCSkpk?=
 =?utf-8?B?K2dYZUNQcU9jSmt1aU5xOFVwUDZuRE01RFFCK0NEaTFYdUVlbmN0Ny8xanFS?=
 =?utf-8?B?c1BnSk9Jb3Z4RVZ0bzNGTFpKTXNHSkh4QkM1bjRDTVFENzk2cjJwUVVlbk1t?=
 =?utf-8?B?YVJ5UnBEbGNVcTlGZmJLQ2NkcGVIbVpQT3ZibHZucW5DcXYwMkM3MUZuWHZo?=
 =?utf-8?B?cm1BdlhyUTk3U3hCY2syUi9mTjNsVTNGck81am43SUpmQ2ZWSi9sZ3NaRUd6?=
 =?utf-8?B?YUMwczZJbGZUWlFIc3JxemF0VnhOVGhVeGRTcmpkR084KzgrUnZ4QWthSGtX?=
 =?utf-8?B?OVZYcE9Yc2RMeFpZdmdOQUlWc3VpNjI3ZFhrbElKLzhUL2hsUjIrZFo2T2VO?=
 =?utf-8?B?U3VXWlVlRVdtOUpsUkg0VVdjYjJXOVBNMmRPYWVyREVQNDRnR3ZnSVVNQy9U?=
 =?utf-8?B?US9SQWpaOUF2b21YK3c3RTVJOUhrVDFrV2tNZXUvNmtidnpObHE3VHVkZEJU?=
 =?utf-8?B?RDhmeUJscVdMbUI1aTdXZVh5Y21BQXdvOGozYm02UUMzWU1wMEFRMnEwVldD?=
 =?utf-8?B?UWdvMFRxUWFPZVd6M3NIR0J5SkU0MVNVL1pBbHM4N2ZoZC93S1hNeHhKaDNF?=
 =?utf-8?B?cEJuNzBvT2xDVUJtWkg2WGhGbFVmeHdQVjNsZzRndERPQm01ODQ0eHJjNnR0?=
 =?utf-8?B?UDM4bHFKUW9nUkJaelNhOHBMZ0NsR3E2ejRaTzJKcWs5aitKZTd3aXd3WkpX?=
 =?utf-8?B?ald6VWNHUkU5dkU5ejBHMDArZHYzNlEyY1hpdSsvODZBczlKUTRQbFpNTEND?=
 =?utf-8?B?cTQ4SGNmQVRFdzhZNWwzQytGQm9zenVsWFFGTU5VVFFyUjhkdVl2OHZaWE8z?=
 =?utf-8?B?TmFhWHhjNHdhY2YyVmtRMWxKaWV6dEJPY3NFeVlzbHRLVlgvczFBV2V2Mk93?=
 =?utf-8?B?VnFNTWFINnNiTjMyWU9wZ09ZSG51aW5IbUtOV2hMK0oydk1wTVRxK1NHajNa?=
 =?utf-8?B?Nkg3L2Nqdk5NMWMreWpkMWsxOFVvaURpYXhBTTdlaGpjTGM1RnpXWERQcTcr?=
 =?utf-8?B?eldoM1dZdjRPKzllT0FFYlhSUXpndWdsTm10R2xoaXY0a3hQK3o4NDdrVHpu?=
 =?utf-8?B?NnNyTFVoOFhuUHUxUXh0eWlmSllrT0U5bkh3VVUwcHpCUmtSVEZxRStxYm1s?=
 =?utf-8?B?clBiVUFJdU1vSk1DMGJnM0hMMFFxWnFpZENoUFdaaGhrblUvSnVEQU1yZ0xl?=
 =?utf-8?B?VnI3UGs4U0NiK2J3b1VnaGRlQmRaK3B0Y1JyeWZ3NkJDNys3K0l1R2lJYkE3?=
 =?utf-8?B?YWhVZmJmckhRZVFzeEVwNFl3M2lRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6472df20-2a81-4d6e-6322-08d99d9679dc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 00:19:46.8043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1k7RZt2sF/2V2rzAc67eubMxHLSlN6DImg60hezoZFA7flJwIGu8gvV6jqthLZrqp5RmkpCV9B+9qMiUYfxS/8PvjrXNAG9ya43i9GfS5Jo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5667
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/1/2021 1:28 PM, Dixit, Ashutosh wrote:
> On Sun, 31 Oct 2021 21:39:36 -0700, Belgaumkar, Vinay wrote:
>>
>> @@ -945,6 +960,17 @@ void intel_rps_boost(struct i915_request *rq)
>> 	if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
>> 		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>>
>> +		if (rps_uses_slpc(rps)) {
>> +			slpc = rps_to_slpc(rps);
>> +
>> +			/* Return if old value is non zero */
>> +			if (atomic_fetch_inc(&slpc->num_waiters))
>> +				return;
>> +
>> +			if (intel_rps_get_requested_frequency(rps) < slpc->boost_freq)
> 
> I think this check is not needed because:
> 
> a. The waitboost code only changes min_freq. i915 code should not depend on
>     how GuC changes requested_freq in response to change in min_freq.
> 
> b. What is more worrisome is that when we "de-boost" we set min_freq to
>     min_freq_softlimit. If GuC e.g. has a delay in bringing requested_freq
>     down and intel_rps_boost() gets called meanwhile we will miss the one
>     opportunity we have to boost the freq (when num_waiters goes from 0 to
>     1. Asking GuC to boost when actual_freq is already boost_freq is
>     harmless in comparison). So to avoid this risk of missing the chance to
>     boost I think we should delete this check and replace the code above
>     with something like:
> 
>                  if (rps_uses_slpc(rps)) {
>                          struct intel_guc_slpc *slpc = rps_to_slpc(rps);
> 
>                          if (slpc->boost_freq <= slpc->min_freq_softlimit)
>                                  return;
> 
>                          if (!atomic_fetch_inc(&slpc->num_waiters))
>                                  schedule_work(&slpc->boost_work);
> 
>                          return;
>                  }
> 
> Note that this check:
> 
>                  if (slpc->boost_freq <= slpc->min_freq_softlimit)
>                                  return;
> 
> (which is basically a degenerate case in which we don't have to do
> anything), can be probably be implemented when boost_freq is set in sysfs,
> or may already be encompassed in "val < slpc->min_freq" in
> intel_guc_slpc_set_boost_freq() in which case this check can also be
> skipped from this function.

We already have that check in set_boost_freq function. So, just adding 
the atomic_fetch_inc check.

> 
>> +void intel_guc_slpc_dec_waiters(struct intel_guc_slpc *slpc)
>> +{
>> +	/* Return min back to the softlimit.
>> +	 * This is called during request retire,
>> +	 * so we don't need to fail that if the
>> +	 * set_param fails.
>> +	 */
> 
> nit: maybe follow kernel multi-line comment format.
> 
Ok.

Thanks,
Vinay.
