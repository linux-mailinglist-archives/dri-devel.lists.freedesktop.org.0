Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5288162ECBE
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 05:06:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E7810E6EC;
	Fri, 18 Nov 2022 04:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E34A10E6EB;
 Fri, 18 Nov 2022 04:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668744352; x=1700280352;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FdXazBwcadqmfTMGP+in2TXzlV5xgQ+FR6qzcu8MByQ=;
 b=MMKaYjekRXOyBAzIADd5O7Cc6bORc/RobiU1UOR/7jJJ7kpAWgbdAXfj
 6peunJ4WYd0aVeAxKjbCCo//C+xkyQvl3L5rM9ZbU63U7aoDnsIrDGsuY
 KfpC3QhTNFuS58EYxFyB+OF3nFvejRo74z6IotiCepLxJU1WGbtT+eDGM
 Vv+k466SNv6wsV27oOfr2gvReKTc6ldiCZqlTHZh4u+kzhDCkCxu+VReP
 LYYAIn3Bj4u5FLwUIF66I6w0N/SnQGida5EDj0zgBASRONZbvWkS2SXRe
 D6xBYFLGTidVP4q8PAzqATdzo1z9/mookF+SRRrKzQqcjyjivKvYNDieh A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="292749833"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; d="scan'208";a="292749833"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 20:05:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="617876404"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; d="scan'208";a="617876404"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga006.jf.intel.com with ESMTP; 17 Nov 2022 20:05:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 17 Nov 2022 20:05:50 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 17 Nov 2022 20:05:50 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 17 Nov 2022 20:05:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EzkBdmrvtEv5/fau12tIv9lAyJI0K5gR/6andUnJpcNHVyQZIgwj/6Ghp7p2cxZZ+NrMBYh3BbMm3B5nFofysYtx2rfDMcUtRQZlSAMiOoECurTUgxI9/l2833PIkhzXQhMD601fA5yeR46ZuxVkdGi01ycj4MdSgXKf4OPVZdnStDz8s1q8f1gX8i/GQSeErv9yU7S2uIM/STqg+uD4W56sx5MJMOY2eCb0bCmUqx8WnJzx6fI/+7izhTcPjTUigUNpEvxX62xSLNu3JJBFefq/TsakDJe0GxApruV66ZirPQEXxf5imJjab+cm0shaEXgwnnU7nqeP2LURp1FelA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c6VdRJd+E1FpieGBVO+h+ECF3eyT2kOvmrUIE1bc4KU=;
 b=X7az1KBiZ84c6n8SmhkQIdFemcRGjW92AQ4PD/lLaUKrcVzlEHlnozao03jNgp6hqNv/mCeIkhtLkOVzQx1PLaOTVvN/FeLul2r3RwWejoO++X9WBe8m7Prog0i+iwJM15J4M/PlVYiX2tMsof0s2xRkQ5qj4lm20D5THcOoFWfFosbE/1vG9XbFNbF4IbuRjLxPpcaYbo7Aol76MEn4CX7oujY45czojPzY3eLPQI6rrUdRhFNiWl3enL+iYAb/z7FSc9NFKhERwATU4j0aOqVqpm7y62gRYg7JiijlzRqCvAwPggrvaZMCqQfadQSthF4WEpF6ytxMwdCtysKpBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by MW4PR11MB6569.namprd11.prod.outlook.com (2603:10b6:303:1e1::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 04:05:49 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1357:5e64:1336:fddf]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1357:5e64:1336:fddf%8]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 04:05:49 +0000
Message-ID: <b20afaa3-9ea2-28f5-b83d-bed0a0fcd394@intel.com>
Date: Fri, 18 Nov 2022 09:35:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/mtl: Enable Idle Messaging for
 GSC CS
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20221115134440.3669021-1-badal.nilawar@intel.com>
 <20221115134440.3669021-2-badal.nilawar@intel.com>
 <Y3ayWbqIZGIX8b5R@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <Y3ayWbqIZGIX8b5R@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::19) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|MW4PR11MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f70d958-eaf3-49d3-f0f6-08dac91a2ce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMcfzQ/miKJet3VmVrT0Mea8RctS+vtguFAWW1yAvbCWOSBn8tz+9/Cq+lwgZ/226IQVC4QYK1vfii1WfG8vo1Bs9kTIcn5eLdhQOXWXpmzGEY8tGhjbPShD7UOCNIEc3gCSKx9f8LrplNUhI/PfcipH9cZ5P6qLc2tYNHDpyx+fi0ejkMdQRYyYNfmxTQ/FTU6vnsPJadOPwkQqBmo9p3oQH0/vcl13kYrHuc5H2g1cNZGySwCf5ebwMW+NNBNGMbQ00ePXnAR+hlBs5yiSG+ihjwWhzH9/rHSxHod1LmccmNHOdDX6cMLcmZP+3KSsBvFiHKrhyC+DJnAeiIFO+8OpBA4nD9QKYAAnQBu2b3VSg9x/hjCaDZ8waAvC05WE/baovqSZOR7wUATu37vfSCSZzq1w+7rV2Go1vuME76swMvKIDhzNRcjTuPSLHqqoqmZSeqIj8w526Xo+cjdyzxklHFKVOdlnB42CDMo0eRFInjXiuxq7/kQZSSyJtsBBkQN9MTRDoKUzb7GAbZdJXCT+AJigKkOXFLE3bWRWB2dp1B0Uo3mKDe9UEobgb1/IGARF0L0veC8U25TLMHm/YGwse+NYSHmz6xCQaMpLyZ9Xjw8DOMdk6N89C7J0iAcNf361mdPaOVzIknERVVHXP/kaLqmi/Sw8GIu0mI9lDreFKi6z7bAbWlfYlW4d5eZe9pp611GfduWHCWb7Ho8ZmfGBOQPe1F03THkKEwaocIw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199015)(31696002)(83380400001)(2906002)(6636002)(316002)(37006003)(53546011)(6666004)(6506007)(26005)(6512007)(2616005)(186003)(478600001)(6486002)(86362001)(36756003)(82960400001)(66556008)(66946007)(450100002)(4326008)(5660300002)(66476007)(8676002)(6862004)(8936002)(31686004)(41300700001)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXp6NVZBa2RRM29jN3J0TUhQMUVZUUpvVld4M2xYYzdQSXg5SEhiUlpCazBC?=
 =?utf-8?B?NDhzMWsrMXFrNTBrT01Jeko0K0M2TFBXajBlSGZnd29oM3NDQ004SXlGako5?=
 =?utf-8?B?NlZnazRGdmt4UTAyNU95Qkt2ZWxpaThsWDJkQ2wrdllxY0JoekVKL2NHZmlS?=
 =?utf-8?B?clR6VkF5eDFKNi9VTjlLTG5odHRvaFZEOWtZbTM1dFM0QUtuYlRpcHN5ZWlF?=
 =?utf-8?B?RnAzYXhlWjl0cTd2clpCTStlTGNIc1Jpem5GZ0s0WEtYTW5qWmVRT2EwVmcy?=
 =?utf-8?B?TTBCYnlIeDVnKzM2N0M1RzlGZWxEOFBZNmtMRVNDVTR3Tk53QzJ4cElvdC9M?=
 =?utf-8?B?MnhEWE1OcU83SVZvN3MxL2pUcisyUXFIaWE0bjVyTDR5RVlJUEE4dWd4S2la?=
 =?utf-8?B?bURFaENhNFhwSjNwUGZrc2dEbEJPWEh0T1drWDVLUkdhYXRNYi9FK01RMTlF?=
 =?utf-8?B?ZkYvbDdUN0tUZGgzakpFaXF4MGo0NEYxcDhhZTBJYjI2c0RGcFpjTW9GMElH?=
 =?utf-8?B?UVdmZmRCdDB2YVFkcFNjOG1OT1Z3Z3pkV0ZxU2h1OWY3emRLUUNONHdDLzcx?=
 =?utf-8?B?NHVEV1lRSXhqTkJRRnE3VHNyRjlzSFcvQ254V1I1a25XUFhPSkpWSHMvQ0Jn?=
 =?utf-8?B?VzZhTlp0YTJKelY1RUNXcVh4djgzVlI3MmVhRXVvTU1JeDJrTFI5ak1DaS94?=
 =?utf-8?B?UmhGZ2FWRjFsbkl3NUdzWXdUUHFjU05LZmNoVWxIZ1NRUGo2YmNOaCtleTJG?=
 =?utf-8?B?V1BOUTh1S0NSRTVFSGM5RklRVXJuVnIwRjBITGY0NFcwZytqMm5yVUpueEtt?=
 =?utf-8?B?dE95WDNtR2pZUWZ3SW1HLzQ5VndDQm11aDlIK1dUSVpsR0pjWWhoVG9lT2Vj?=
 =?utf-8?B?OVkwOUVQNG9EU3R5N2ZWckhySk15TnVWdjhlTnQrSW5BWkxFSjNCdS82R2pK?=
 =?utf-8?B?ODF0NGRtMXV2c1hVK3FlRTVCSVdMcm4wY2F1QWxTa05MdXFyMGJuOUp1eWVN?=
 =?utf-8?B?Z1VuRlpJNGlSWEFZNjVWQVhoK0R5QnJVVk1SNFlOK0JmbXR4eTFnWkRwRWhH?=
 =?utf-8?B?SDkva2xxa2pDQ0V2enJPYXI2VyszV3JSMW1NUlErTldGa0xibTg5TVpHZFZ4?=
 =?utf-8?B?OWpaMnpxMWs0d09RY3QxeTQyRlNldllMSTdaWGxERzRGMUpkNFA1djlaNm1S?=
 =?utf-8?B?UmlnbGpJdkl5VUc0V3JiZTR0d3lTUHZ5T25Xdlo1K0pjQldLbnozaFY0cm1y?=
 =?utf-8?B?bmszODNNK3dxYXFjQUVlTFloYmgxLzBwUW05bjBaOWZzUlNsL1U0bTlKNXVM?=
 =?utf-8?B?cDAxODg4Qk1IN0o0V1FxQnEzMGMvbjBOdkVkbkx0NkpUY2ZnT1Vsdk5CcjZE?=
 =?utf-8?B?Y245M2czblhocVpRWndFQmR4eGYvQlFjbi9CMHhNUGM5OUU5NVFmN1VGTTdM?=
 =?utf-8?B?VWgvTVRLU0tNTkNVR1MzMlFva0lJKzU4RmVTSFJlYUZ6d3dpUFp2aFc1M0NQ?=
 =?utf-8?B?SXYzV1BXVkx2cjROengvOHRnZ2JwaHJxVkRTbW03Ty9ZN3FGL2w5aHdnT1N3?=
 =?utf-8?B?Ky9GSnQ4WENtQ2N5bGpBWVF3VTM5Q2h1RTJhOG1TaEJJL3g2dGo5eE41Myt3?=
 =?utf-8?B?azQ4S0tpZHNFQWsrZ2MrVjZScWV0WFZpNy9ZdmhCbnNqdnJ1WHJDenVmR3pn?=
 =?utf-8?B?VHRVNVlTVWVaekNLRkIyREp2dElqa0lEYzA3b3d0dzd6amRRbVlGcGhoN2g1?=
 =?utf-8?B?VU1VNDRDM016RkFYcVR6YkpKOVcwdEFQT1hsUG1lTU5udXh6V21pdVVuN0NT?=
 =?utf-8?B?YXJSVHdlSFlUM3hzeUtrUS9Kcm9zVGhzUDBSeFI0dG9WWmQvbm0zSmE2c3V2?=
 =?utf-8?B?TSt6TzNaRTN1MXRhcTMrTGtKR3pWMHcrSnFNbjFtVlRRYkd0a01ocWoreCs2?=
 =?utf-8?B?MVdIQlBweXFPWTJKOWRza1BiRUV6Z1BtNGJoanM4NWJJMUhITVFoaG5EZXBu?=
 =?utf-8?B?VnpDeGRaZXVlVUlaUytRUVZsQjZ6UnNQWnNWbGFjSU5UYVpYNkVKUEN6SW0v?=
 =?utf-8?B?ZlBIRXRJWk1vc0ZaZkRVOC9ZWEp2bGNwOFJLa0RBRC9yQzlUdzI3MkFrYWRo?=
 =?utf-8?B?UVVLVmxHdks1eVVuNndlQmZSMlhhOXY5RWlkaEt5eGhDd1pZaktuMUY1WkFF?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f70d958-eaf3-49d3-f0f6-08dac91a2ce4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 04:05:48.9018 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VcDI64iTYsDG+kyXgCirtG0B6cy/WEAMOh/3YKNCXl3VPs/ai59dXTOaHfTbhAixfiEcndaPfKRC7NBRQZqIbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6569
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



On 18-11-2022 03:44, Rodrigo Vivi wrote:
> On Tue, Nov 15, 2022 at 07:14:40PM +0530, Badal Nilawar wrote:
>> From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>>
>> By defaut idle mesaging is disabled for GSC CS so to unblock RC6
>> entry on media tile idle messaging need to be enabled.
>>
>> v2:
>>   - Fix review comments (Vinay)
>>   - Set GSC idle hysterisis to 5 us (Badal)
>>
>> Bspec: 71496
>>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_pm.c | 18 ++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/intel_gt_regs.h   |  4 ++++
>>   2 files changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.c b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> index b0a4a2dbe3ee..5522885b2db0 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.c
>> @@ -15,6 +15,22 @@
>>   #include "intel_rc6.h"
>>   #include "intel_ring.h"
>>   #include "shmem_utils.h"
>> +#include "intel_gt_regs.h"
>> +
>> +static void intel_gsc_idle_msg_enable(struct intel_engine_cs *engine)
>> +{
>> +	struct drm_i915_private *i915 = engine->i915;
>> +
>> +	if (IS_METEORLAKE(i915) && engine->id == GSC0) {
>> +		intel_uncore_write(engine->gt->uncore,
>> +				   RC_PSMI_CTRL_GSCCS,
>> +				   _MASKED_BIT_DISABLE(IDLE_MSG_DISABLE));
> 
> disable the disable? shouldn't be enable the disable?
> 1 = disable, no?
> 
>> +		/* 5 us hysterisis */
> 
> could you please mention here in the comment that 0xA = 5 us per spec?
> I got confused again even though you had explained already...
Sure I will add the comment "0xA=5 us as per spec"
> 
> BTW, how reliable that spec is? Because according to that same line
> we should be setting the bit 16, not the bit 0 in the previous reg!
Bit 16 is mask bit. Bit 0 need to be cleared to enable Idle messaging.
Bit[0] = 1 Disable Idle Messaging / 0 Enable Idle Messaging.

Regards,
Badal
> 
>> +		intel_uncore_write(engine->gt->uncore,
>> +				   PWRCTX_MAXCNT_GSCCS,
>> +				   0xA);
>> +	}
>> +}
>>   
>>   static void dbg_poison_ce(struct intel_context *ce)
>>   {
>> @@ -275,6 +291,8 @@ void intel_engine_init__pm(struct intel_engine_cs *engine)
>>   
>>   	intel_wakeref_init(&engine->wakeref, rpm, &wf_ops);
>>   	intel_engine_init_heartbeat(engine);
>> +
>> +	intel_gsc_idle_msg_enable(engine);
>>   }
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_regs.h b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> index 07031e03f80c..20472eb15364 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_regs.h
>> @@ -913,6 +913,10 @@
>>   #define  MSG_IDLE_FW_MASK	REG_GENMASK(13, 9)
>>   #define  MSG_IDLE_FW_SHIFT	9
>>   
>> +#define	RC_PSMI_CTRL_GSCCS	_MMIO(0x11a050)
>> +#define	  IDLE_MSG_DISABLE	BIT(0)
>> +#define PWRCTX_MAXCNT_GSCCS	_MMIO(0x11a054)
>> +
>>   #define FORCEWAKE_MEDIA_GEN9			_MMIO(0xa270)
>>   #define FORCEWAKE_RENDER_GEN9			_MMIO(0xa278)
>>   
>> -- 
>> 2.25.1
>>
