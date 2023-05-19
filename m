Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49731709F50
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95BB110E60B;
	Fri, 19 May 2023 18:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF4110E601;
 Fri, 19 May 2023 18:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684521945; x=1716057945;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CwlqGzjX3in3Mo0cqrAmdS59T6hU6gEYmK6OTvmxvis=;
 b=WboHBzgFeFnXolnQVaWmFDsW4OjNUzzwQDYY0oxUWLebjsby5nITUoSa
 bn8AP/hCu2zCcuzA/gtO29JaFVbPDPIajrEtY9ILfXBCBuhvBprxbUdwv
 i7j+PoYGY7c+WS21WYlf4blorkSQKRds7Unxhf4J5UYR4xiVjRBUIHaG7
 iw2r2Pq1bgXOzX+Ro/cCBqJksaNFB21/J17Hf9p9l+9cFu4qqC59HvnlH
 KZ700tbWZrPyAKEloOw5mO7o6m6sZyHjiqaNkfFJPBGEXr50g1k1zyVHy
 m0ZVyy4if9UuxX9rn+vwAG2q4ko5uyRHfRU4UCfrDKcLH8QDeWou7WBYE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="349965543"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="349965543"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 11:45:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10715"; a="1032695384"
X-IronPort-AV: E=Sophos;i="6.00,177,1681196400"; d="scan'208";a="1032695384"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP; 19 May 2023 11:45:43 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 19 May 2023 11:45:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 19 May 2023 11:45:43 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 19 May 2023 11:45:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xoc23hYp+rNcVMFTosJfHAo18lLjmq/y2Ozh5QQdtHZV/jhtd7dFXuxa5jz5Bniujl8CtvvbBGD/ekvNGM2PuMV7BN5ElSo9j9Wt2i4WzX1gsUYfRZlkG1lYPdubFYU9hccdTWEsu7E/gUgI7mT7QrxAVsGQiZ9q3NCsfg7UA3vhnXW4Vem6meN5YMw7P+d6eq0xq26WXciZGJ7cJCy3L8UZ8nSuYEd806Ygc04qUQKhXwT3bsEXWspCMZ8gteqqlKDBYeK8JNFbgG0aSqUlvquaCxmLfzP1iy365jZA+bjY0LpAg4a6KpxNUfaYfVCoBn0bQSmADGT0hClFd8yqDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WP+imHHcgVkxYp01tusomRuaiS8TNFumj4VYB/psY1E=;
 b=KnLJok+lki+rgW42iUZKSaTPpFILct3J4Oi8KN60fcciu7Bjimbxwg0Cw28jNGGLiB1Fts9uG1jR0fWa4SoNoEQCovYRupmO0huciCXpYzGgjYXiitLRTbsBIXFFUF4nFMfWOrYdwVuYCSnSvbY9vrO3D4lb9MdpFoq7F1hmGn6nwe9gvlzew0T0n4fdh5wMoSeR4IwnoXKsTPZrU9FtL4t9VCAD072+dLBk5asS69BK9+ssD0aSiF2ZYbf+UOFZnc3sgWs5YxxgBLcYyG0mOfmkesaLwl3h7TVtprO4JsWmJ4+8Qway7Lscjg9ldjzKZrAJmE12cO4CxgsleX0a3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BL1PR11MB5495.namprd11.prod.outlook.com (2603:10b6:208:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 18:45:40 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::871d:4695:ebdf:9df1%4]) with mapi id 15.20.6411.019; Fri, 19 May 2023
 18:45:39 +0000
Message-ID: <16f2fad7-f8dd-21cb-ca10-cf3bf3435756@intel.com>
Date: Fri, 19 May 2023 11:45:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [Intel-gfx] [PATCH v2 5/8] drm/i915/huc: differentiate the 2
 steps of the MTL HuC auth flow
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-gfx@lists.freedesktop.org>
References: <20230428185810.4127234-1-daniele.ceraolospurio@intel.com>
 <20230428185810.4127234-6-daniele.ceraolospurio@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20230428185810.4127234-6-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|BL1PR11MB5495:EE_
X-MS-Office365-Filtering-Correlation-Id: 67bedd96-dd64-4bd7-0ed1-08db58993dca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gUh78bHjVsBqz52LrAy4482norBoomknE9yfX+TWXSMb05O8z92iQfkZ4muQbLjVh394YpqpLX9Ibz5R8VRenxsFQ9tgXwCukb7lx1lSCUPlrHYccOpNKA5iJQ00Hl22PzeNkDAh4+YztEfKxQ3az4DaBwsXR+FpGoedx948VEIBE0dI9+Cv0/xe9lvdbOMvgrLF/xZ0BScLpyvZWR/0sd7d/d/P0eC82aOtYy8aRSV9Whr7Z8cCG+WYpGPkQZwCqVzbg5zKzQaW1YFRoxjY0GqFlGRrnd2/1pX511bmPC4KNWaFnA+9kmZOiitZViLYMZ01cyqDtEnH6gTiXbDYM+ZVKJtN1PDkmuGjyvV1OE+MM15USxFtrd1w3NQ+UoKrD32xOR5IRr0Velmw36qlUY1T9YMcKCPXd/QCa00+mNBxDPy2tQNY70uZBgeXffzsnHeV/XW9aaXpOBkSNdZ+4fCGyTbrsiIqa336/JiRDMySx0bmMq9k+BihfJ6hmuF7weAQY5n2zXTzUSmgTA1XNc4CKObWc2oTEeG2Q9N/GUUEeqi6ezLmpdp0es4xHac57yiegMzaijJgl0THjQlwoABIIhOvSmE6/8fZyx/mCwAvOpjYdWjuaOPkfjvs/fKiB8oM6cij3A1Q2Hj6y1xNSQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(136003)(346002)(376002)(451199021)(82960400001)(36756003)(38100700002)(2906002)(31696002)(83380400001)(30864003)(2616005)(66556008)(66946007)(66476007)(450100002)(316002)(4326008)(41300700001)(86362001)(31686004)(478600001)(6486002)(26005)(186003)(5660300002)(53546011)(8676002)(6506007)(6512007)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzIyZDF6Y3ljZUEzSnlteEt6U0xMM0dhU1QwYXlhT3ZhWWFHb01nSjFwUmRi?=
 =?utf-8?B?SkpkU1RLVURzcHRUSzZ4dVdQRms2bHBaM0huTEVhaUN2cUx6YTI4cHNMMXZl?=
 =?utf-8?B?S2U0blpudkd4U1pYcmlZVEwzVjhnV2x0REE3MytJYzhvNVBxOWc1ZmRlMVJu?=
 =?utf-8?B?WVBDUHRPMWJZOVVXZEdqNytPS3hTTzk4YVMzWklGYlBpQzB4MjdGNW43aTlx?=
 =?utf-8?B?SlVDVEdLbHhiSC9ES0xqdUdJQnc5UlpnTEJGbG9GcjJUdkdwcXZ0TjdUMjBQ?=
 =?utf-8?B?Nm02SnNPc0tsVnZGb1BqMi9qdGNLNmRkQWpJSUkxRTlEM2VPWHd6bzlNb2hT?=
 =?utf-8?B?MWxCWHVFNUpSa1lucnVmQmVDUWZpeGZ2UTBtaktMUXRINDVVWUFjWWRIaWpK?=
 =?utf-8?B?TUs3NGpCRjgrOTl1VTJ5Y1RGQWhGdm9zWDQ0WjdzUEZ2YW95b0FFTzVualEw?=
 =?utf-8?B?RTJRMFl6bXRkRG9YT2ozTnR0YlBVU0Z0MVRHZ0hCRm5wOER2VThkaXRWR0hS?=
 =?utf-8?B?MVdSbytxSGo0emFtYXNMZ3Z1Mk9jRjdFQmllaW1kQitBUDBhMytEVG0rVFhX?=
 =?utf-8?B?VEE2Nkt5OEJNTkN6c2txZGtqWkRPK0xMQVBQU2VIbWtRVGY3UHRKWEE0aFR1?=
 =?utf-8?B?QjhuMEdGb1EvaUZkWTFrbzJ1UndPWEpFQ2hheUYvU2xCUFYxTWlIQjd3TUph?=
 =?utf-8?B?aDBEOWhCcnRETWpRY0hwUUlhRTdld2tQOU90RmJCWFFkejNhbElCdFZBeG5l?=
 =?utf-8?B?cGVMdzA3THJYMElwaWlPUjR6ZWpEelVZTUlQK25nQWtqU2l6dlJ2ZmZPZ1lM?=
 =?utf-8?B?ZS93dEU5VmVhTzE4cUdubURaZDBaK0pVdDNrbktNZ3JsSGRXUUJRT280ZWxM?=
 =?utf-8?B?U2pUVkJ0TDBHRmJHYWhNTktRK2N0MkpPS2Y5cUxPOExISjU2dk04ZjlsS2Rp?=
 =?utf-8?B?cU5VNXJoVWQzWlJDWC9FbXpsNnRIMGFEZGNUOVVVelRNelBHcGdVMCtSQnVk?=
 =?utf-8?B?VE1PcWQ2YnY1YS9GNEJON2orbXZGYzl2ZVpTT1RvaHd4NVZXOEl1Skkzd2kv?=
 =?utf-8?B?akxScVk2aFVyZkc1MFZTbTUzOGVhVFhhWm1tbDFka3lZTzdpS3IzeVdlWmxs?=
 =?utf-8?B?dit0cCtzOVZTWEZkR0NuM2Z4VlJwU29Fdms0WmhlRE5reGJvbWY2K2xNbmFk?=
 =?utf-8?B?VDNobHlrazNwNkVjZFdmZTFZWDkwb2NjdTF3a3MzVCtQMUlWNmFLY2J2bHB6?=
 =?utf-8?B?YTV0SUZINW1hOVUvK3ZSZEc3SUE4Nkk2SnJmMUdEZTlBdmY2VEpNSjFtbEZO?=
 =?utf-8?B?eDV2VnNYQzRaclJYYkdxRFJMckY2aGRYeGZneTQzcHlIU0MrWWVxeEVXYU1t?=
 =?utf-8?B?SDVRYnduSEJVN25qcmRTM1Y0NlZKcFFYcVcwTSt2VEk3YlJob2NuRjBseDdK?=
 =?utf-8?B?dDVUTHAwRUx1L3NLN1ZwNGpCbnBGWDk0eTAva3JMRlpsNVAxSnJtYkFCWmQx?=
 =?utf-8?B?ZGpZcWRRbDM2bzV6SEp5L1dMMFU2Y3lNMHR2MG92eTFzejE1bmFKcDFySFR5?=
 =?utf-8?B?cSsvYzU1RDRlRU1tcERkdnpYZDFyM0ZpWGxPTlZuZWF3L3htL3NGbWZMNnhm?=
 =?utf-8?B?NTBtcWtodU9yODVzdHN1TUQ4MUgvcVZ2OVhNancvb2FXcTByU3dyVHNXMndw?=
 =?utf-8?B?Yno3YTM3UURIS3ErVXhsZXByeVZZYXNmUDg3aEV1VFdsZDlJZ2NZcmVDWWhR?=
 =?utf-8?B?cTk5aGpvK3VPRFdVZjl3ejVkREYrcXJ0MU8yQ1h0ZDJ2YitRZ1lBemtZT3ds?=
 =?utf-8?B?bU1ROXBYY3dDMkhNblZkSE5GbmtVYU5ZT01oVzY4TlFFSkl2bEZqVCtlQkJO?=
 =?utf-8?B?eHd6em1nYWdWM09SNWFOenRSTGt1ZUN1aDJvTDYyT2ZqOEFtWFQzMVBzWTUr?=
 =?utf-8?B?MVdPWXVUaTVuUXRLTHZJK1RsaVZFeUNsZnFjeDlhUWFJbUo2bmozRXNOVDZo?=
 =?utf-8?B?clNSS01XTFFlSDg5WVhIV0pFOFlSL0xmY1FCNUk4UC9hN0FNdG1iTnpoNXVZ?=
 =?utf-8?B?dTk2RU4rZHhDa2o1eHlKcDc4R25ialN6UlRtNi9lblYxSzVZR3g3cnlvTHh0?=
 =?utf-8?B?ZTRMVFozbFhUOS95SWpsTGd4dmZ1NzVFSHhoUmtPSnBLL0pTcHl4K1I2amor?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67bedd96-dd64-4bd7-0ed1-08db58993dca
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 18:45:39.4314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjfAHQ9erHlIGdH/LcD2MiozChU0nR6P6cjced0+Lr4cdqdWQDHr8eh/YrUKDtOIZwFN0BIone+L0FXDaGHquhi7f3/0o9Xt8638PedjsqE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5495
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
Cc: dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/28/2023 11:58, Daniele Ceraolo Spurio wrote:
> Before we add the second step of the MTL HuC auth (via GSC), we need to
> have the ability to differentiate between them. To do so, the huc
> authentication check is duplicated for GuC and GSC auth, with meu
> binaries being considered fully authenticated only after the GSC auth
> step.
>
> To report the difference between the 2 auth steps, a new case is added
> to the HuC getparam. This way, the clear media driver can start
> submitting before full auth, as partial auth is enough for those
> workloads.
>
> v2: fix authentication status check for DG2
>
> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_huc.c    | 94 +++++++++++++++++------
>   drivers/gpu/drm/i915/gt/uc/intel_huc.h    | 16 +++-
>   drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c |  4 +-
>   drivers/gpu/drm/i915/i915_reg.h           |  3 +
>   include/uapi/drm/i915_drm.h               |  3 +-
>   5 files changed, 91 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> index c189ede4ef55..60f95d98e5fd 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
> @@ -10,6 +10,7 @@
>   #include "intel_huc.h"
>   #include "intel_huc_print.h"
>   #include "i915_drv.h"
> +#include "i915_reg.h"
>   
>   #include <linux/device/bus.h>
>   #include <linux/mei_aux.h>
> @@ -106,7 +107,7 @@ static enum hrtimer_restart huc_delayed_load_timer_callback(struct hrtimer *hrti
>   {
>   	struct intel_huc *huc = container_of(hrtimer, struct intel_huc, delayed_load.timer);
>   
> -	if (!intel_huc_is_authenticated(huc)) {
> +	if (!intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
>   		if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_GSC)
>   			huc_notice(huc, "timed out waiting for MEI GSC\n");
>   		else if (huc->delayed_load.status == INTEL_HUC_WAITING_ON_PXP)
> @@ -124,7 +125,7 @@ static void huc_delayed_load_start(struct intel_huc *huc)
>   {
>   	ktime_t delay;
>   
> -	GEM_BUG_ON(intel_huc_is_authenticated(huc));
> +	GEM_BUG_ON(intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC));
>   
>   	/*
>   	 * On resume we don't have to wait for MEI-GSC to be re-probed, but we
> @@ -284,13 +285,23 @@ void intel_huc_init_early(struct intel_huc *huc)
>   	}
>   
>   	if (GRAPHICS_VER(i915) >= 11) {
> -		huc->status.reg = GEN11_HUC_KERNEL_LOAD_INFO;
> -		huc->status.mask = HUC_LOAD_SUCCESSFUL;
> -		huc->status.value = HUC_LOAD_SUCCESSFUL;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].reg = GEN11_HUC_KERNEL_LOAD_INFO;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_LOAD_SUCCESSFUL;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_LOAD_SUCCESSFUL;
>   	} else {
> -		huc->status.reg = HUC_STATUS2;
> -		huc->status.mask = HUC_FW_VERIFIED;
> -		huc->status.value = HUC_FW_VERIFIED;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].reg = HUC_STATUS2;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].mask = HUC_FW_VERIFIED;
> +		huc->status[INTEL_HUC_AUTH_BY_GUC].value = HUC_FW_VERIFIED;
> +	}
> +
> +	if (IS_DG2(i915)) {
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].reg = GEN11_HUC_KERNEL_LOAD_INFO;
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HUC_LOAD_SUCCESSFUL;
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HUC_LOAD_SUCCESSFUL;
> +	} else {
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].reg = HECI_FWSTS5(MTL_GSC_HECI1_BASE);
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].mask = HECI_FWSTS5_HUC_AUTH_DONE;
> +		huc->status[INTEL_HUC_AUTH_BY_GSC].value = HECI_FWSTS5_HUC_AUTH_DONE;
>   	}
>   }
>   
> @@ -381,28 +392,39 @@ void intel_huc_suspend(struct intel_huc *huc)
>   	delayed_huc_load_complete(huc);
>   }
>   
> -int intel_huc_wait_for_auth_complete(struct intel_huc *huc)
> +static const char *auth_mode_string(struct intel_huc *huc,
> +				    enum intel_huc_authentication_type type)
> +{
> +	bool partial = !huc->loaded_via_gsc && huc->fw.is_meu_binary &&
> +		       type == INTEL_HUC_AUTH_BY_GUC;
partial = !loaded_via_gsc?

If it is not a GSC load then there is no two stage authentication, is 
there? Does that mean the single stage auth does not count as 'all 
workloads' even on platforms where two stage is not supported?

> +
> +	return partial ? "clear media" : "all workloads";
> +}
> +
> +int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
> +				     enum intel_huc_authentication_type type)
>   {
>   	struct intel_gt *gt = huc_to_gt(huc);
>   	int ret;
>   
>   	ret = __intel_wait_for_register(gt->uncore,
> -					huc->status.reg,
> -					huc->status.mask,
> -					huc->status.value,
> +					huc->status[type].reg,
> +					huc->status[type].mask,
> +					huc->status[type].value,
>   					2, 50, NULL);
>   
>   	/* mark the load process as complete even if the wait failed */
>   	delayed_huc_load_complete(huc);
>   
>   	if (ret) {
> -		huc_err(huc, "firmware not verified %pe\n", ERR_PTR(ret));
> +		huc_err(huc, "firmware not verified for %s: %pe\n",
> +			auth_mode_string(huc, type), ERR_PTR(ret));
>   		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_LOAD_FAIL);
This means that if stage one works but stage two fails, we mark the HuC 
as dead? So the previously working clear media support now stops working?

>   		return ret;
>   	}
>   
>   	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
> -	huc_info(huc, "authenticated!\n");
> +	huc_info(huc, "authenticated for %s!\n", auth_mode_string(huc, type));
>   	return 0;
>   }
>   
> @@ -442,7 +464,7 @@ int intel_huc_auth(struct intel_huc *huc)
>   	}
>   
>   	/* Check authentication status, it should be done by now */
> -	ret = intel_huc_wait_for_auth_complete(huc);
> +	ret = intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GUC);
>   	if (ret)
>   		goto fail;
>   
> @@ -453,16 +475,29 @@ int intel_huc_auth(struct intel_huc *huc)
>   	return ret;
>   }
>   
> -bool intel_huc_is_authenticated(struct intel_huc *huc)
> +bool intel_huc_is_authenticated(struct intel_huc *huc,
> +				enum intel_huc_authentication_type type)
>   {
>   	struct intel_gt *gt = huc_to_gt(huc);
>   	intel_wakeref_t wakeref;
>   	u32 status = 0;
>   
>   	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
> -		status = intel_uncore_read(gt->uncore, huc->status.reg);
> +		status = intel_uncore_read(gt->uncore, huc->status[type].reg);
>   
> -	return (status & huc->status.mask) == huc->status.value;
> +	return (status & huc->status[type].mask) == huc->status[type].value;
> +}
> +
> +static bool huc_is_fully_authenticated(struct intel_huc *huc)
> +{
> +	struct intel_uc_fw *huc_fw = &huc->fw;
> +
> +	if (!huc_fw->is_meu_binary)
> +		return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC);
Is it not possible to load a non-MEU firmware on a GSC system? Don't we 
just treat that as the legacy part within the MEU blob and load it for 
clear media only via GuC auth? In which case, it is as 'fully 
authenticated' as it is possible to be but it still can't process 
protected media. So it should not count as 'fully authenticated'?

> +	else if (intel_huc_is_loaded_by_gsc(huc) || HAS_ENGINE(huc_to_gt(huc), GSC0))
Why not &&? Is it possible to have loaded_by_gsc != HAS_ENGINE(gsc)?

Is it even worth making the engine check a part of the loaded_by_gsc() 
helper?

> +		return intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
> +	else
> +		return false;
>   }
>   
>   /**
> @@ -477,7 +512,9 @@ bool intel_huc_is_authenticated(struct intel_huc *huc)
>    */
>   int intel_huc_check_status(struct intel_huc *huc)
>   {
> -	switch (__intel_uc_fw_status(&huc->fw)) {
> +	struct intel_uc_fw *huc_fw = &huc->fw;
> +
> +	switch (__intel_uc_fw_status(huc_fw)) {
>   	case INTEL_UC_FIRMWARE_NOT_SUPPORTED:
>   		return -ENODEV;
>   	case INTEL_UC_FIRMWARE_DISABLED:
> @@ -494,7 +531,17 @@ int intel_huc_check_status(struct intel_huc *huc)
>   		break;
>   	}
>   
> -	return intel_huc_is_authenticated(huc);
> +	/*
> +	 * meu binaries loaded by GuC are first partially authenticated by GuC
> +	 * and then fully authenticated by GSC
> +	 */
> +	if (huc_is_fully_authenticated(huc))
> +		return 1; /* full auth */
> +	else if (huc_fw->is_meu_binary && !huc->loaded_via_gsc &&
Why sometimes use the huc->loaded_via_gsc directly and sometimes use the 
intel_huc_is_loaded_by_gsc() helper? Either way, I'm confused - isn't 
that backwards? If the HuC is not loaded via GSC then it can't do two 
stage auth and therefore cannot be partial? It is either fully 
authenticated or not at all?

John.

> +		 intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GUC))
> +		return 2; /* clear media only */
> +	else
> +		return 0;
>   }
>   
>   static bool huc_has_delayed_load(struct intel_huc *huc)
> @@ -508,7 +555,10 @@ void intel_huc_update_auth_status(struct intel_huc *huc)
>   	if (!intel_uc_fw_is_loadable(&huc->fw))
>   		return;
>   
> -	if (intel_huc_is_authenticated(huc))
> +	if (!huc->fw.is_meu_binary)
> +		return;
> +
> +	if (huc_is_fully_authenticated(huc))
>   		intel_uc_fw_change_status(&huc->fw,
>   					  INTEL_UC_FIRMWARE_RUNNING);
>   	else if (huc_has_delayed_load(huc))
> @@ -541,5 +591,5 @@ void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p)
>   
>   	with_intel_runtime_pm(gt->uncore->rpm, wakeref)
>   		drm_printf(p, "HuC status: 0x%08x\n",
> -			   intel_uncore_read(gt->uncore, huc->status.reg));
> +			   intel_uncore_read(gt->uncore, huc->status[INTEL_HUC_AUTH_BY_GUC].reg));
>   }
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.h b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> index 345e1b9aa062..adb063cd27a0 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.h
> @@ -22,6 +22,12 @@ enum intel_huc_delayed_load_status {
>   	INTEL_HUC_DELAYED_LOAD_ERROR,
>   };
>   
> +enum intel_huc_authentication_type {
> +	INTEL_HUC_AUTH_BY_GUC = 0,
> +	INTEL_HUC_AUTH_BY_GSC,
> +	INTEL_HUC_AUTH_MAX_MODES
> +};
> +
>   struct intel_huc {
>   	/* Generic uC firmware management */
>   	struct intel_uc_fw fw;
> @@ -31,7 +37,7 @@ struct intel_huc {
>   		i915_reg_t reg;
>   		u32 mask;
>   		u32 value;
> -	} status;
> +	} status[INTEL_HUC_AUTH_MAX_MODES];
>   
>   	struct {
>   		struct i915_sw_fence fence;
> @@ -49,10 +55,12 @@ int intel_huc_init(struct intel_huc *huc);
>   void intel_huc_fini(struct intel_huc *huc);
>   void intel_huc_suspend(struct intel_huc *huc);
>   int intel_huc_auth(struct intel_huc *huc);
> -int intel_huc_wait_for_auth_complete(struct intel_huc *huc);
> +int intel_huc_wait_for_auth_complete(struct intel_huc *huc,
> +				     enum intel_huc_authentication_type type);
> +bool intel_huc_is_authenticated(struct intel_huc *huc,
> +				enum intel_huc_authentication_type type);
>   int intel_huc_check_status(struct intel_huc *huc);
>   void intel_huc_update_auth_status(struct intel_huc *huc);
> -bool intel_huc_is_authenticated(struct intel_huc *huc);
>   
>   void intel_huc_register_gsc_notifier(struct intel_huc *huc, struct bus_type *bus);
>   void intel_huc_unregister_gsc_notifier(struct intel_huc *huc, struct bus_type *bus);
> @@ -81,7 +89,7 @@ static inline bool intel_huc_is_loaded_by_gsc(const struct intel_huc *huc)
>   static inline bool intel_huc_wait_required(struct intel_huc *huc)
>   {
>   	return intel_huc_is_used(huc) && intel_huc_is_loaded_by_gsc(huc) &&
> -	       !intel_huc_is_authenticated(huc);
> +	       !intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC);
>   }
>   
>   void intel_huc_load_status(struct intel_huc *huc, struct drm_printer *p);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> index 88ad2c322c4a..3b8edaba97d2 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c
> @@ -141,7 +141,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>   	 * component gets re-bound and this function called again. If so, just
>   	 * mark the HuC as loaded.
>   	 */
> -	if (intel_huc_is_authenticated(huc)) {
> +	if (intel_huc_is_authenticated(huc, INTEL_HUC_AUTH_BY_GSC)) {
>   		intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_RUNNING);
>   		return 0;
>   	}
> @@ -154,7 +154,7 @@ int intel_huc_fw_load_and_auth_via_gsc(struct intel_huc *huc)
>   
>   	intel_uc_fw_change_status(&huc->fw, INTEL_UC_FIRMWARE_TRANSFERRED);
>   
> -	return intel_huc_wait_for_auth_complete(huc);
> +	return intel_huc_wait_for_auth_complete(huc, INTEL_HUC_AUTH_BY_GSC);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
> index dde6e91055bd..1a62e73c3d9c 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -941,6 +941,9 @@
>   #define HECI_H_GS1(base)	_MMIO((base) + 0xc4c)
>   #define   HECI_H_GS1_ER_PREP	REG_BIT(0)
>   
> +#define HECI_FWSTS5(base)		_MMIO(base + 0xc68)
> +#define   HECI_FWSTS5_HUC_AUTH_DONE	(1 << 19)
> +
>   #define HSW_GTT_CACHE_EN	_MMIO(0x4024)
>   #define   GTT_CACHE_EN_ALL	0xF0007FFF
>   #define GEN7_WR_WATERMARK	_MMIO(0x4028)
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index dba7c5a5b25e..43b8de42a94e 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -659,7 +659,8 @@ typedef struct drm_i915_irq_wait {
>    * If the IOCTL is successful, the returned parameter will be set to one of the
>    * following values:
>    *  * 0 if HuC firmware load is not complete,
> - *  * 1 if HuC firmware is authenticated and running.
> + *  * 1 if HuC firmware is loaded and fully authenticated,
> + *  * 2 if HuC firmware is loaded and authenticated for clear media only
>    */
>   #define I915_PARAM_HUC_STATUS		 42
>   

