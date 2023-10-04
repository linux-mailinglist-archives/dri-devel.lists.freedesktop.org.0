Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EE97B8C5A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 21:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17EAA10E18C;
	Wed,  4 Oct 2023 19:19:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB6310E3B8;
 Wed,  4 Oct 2023 19:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696447177; x=1727983177;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UnO5BqAFPgDeGGrVO63Hy+xBkOQtvKk1XBPjbMlTpOE=;
 b=L82+WgW/QL8alrAS1AeYp17D5V1km7JreCJ7AtabOEFMFugKjrs11ZrI
 a5ztPhoj9Uy7ViE85H5B7JvXPfnHbvPMULIl2v1Qn9/dw9gx3Xqdpbaz2
 ej6/oiy3mUxI4hcjJJP+MGiBFXe2Zv/VTqDB496teh8D3apoje5kIdayC
 VVq3dAwP87v9tpnOD5Z09AJfKmELJv3McB81ZGCVrF1ZezUsgmT2uknDf
 GWmOyjTfHsJY7qIzh6h08XNhMcRycxHXwr8LdBeytqwrfs1Gg/uWNJWMR
 BL231xANPzVEhM5SgZVCtr9bKm5FSHCv2ts3CDQ0xR8/sAzfA/2mAExAz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="449765627"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="449765627"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 12:19:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="925285671"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="925285671"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 12:19:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 12:19:29 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 12:19:28 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 12:19:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lI0f4zic6tgWNPE1t6KQzsDyriEtXKEDAek1D/Gi6XyyTzM1Qpy6pfgquj2n1JO84hz8HT2p6Ojtihlvv8wuEw3RTb1ivbOR+cDV8FPgP0YfTpaeM6VC/g/hC81ERQTFSviKHe94TIB025y44jCHTKAlaMoIJtaokQGcXcGDGDmYBenG314jXKspbKldapdAMVotafBB2N+WCZv3gNSf28qrEBT0msAbbXYg6cNbt3Z65GsSgC1JLHxqmKpmedYmoyadBd0GNZIP1jdpRf2CuEiq+caVi4XtsUP/smw5rSLjr3/LLlL55/kKeFmBWBk2Mhc16y4trtVuw+NCzyHqTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHDogILyZZERf+Phpn055F0R25juSM31/II7vFSHzrc=;
 b=Hc/q1AX7uh6jgMzIadyE26vwY3FFcfWDD7LlYdhMc80yigmv65AZRsdqz9Y3R0ZpozO5UsOW3+AY2G+1RceoVPMPnopwmb3zXdUamXghlW2FrjSmUChg4j48BCJv6jRNpyheZkhk6rIUfu5wlHzl3s9IcwQYqOfDas/igavXNq1m9lP8FV2lf3r4v3JnDdBeeLpR9FTKcTvRyYHu5TW2bUeSMpZsyrL0gNqbdBvBZFzbUXRiEYSihEIVPmLUStGTtiK7crRi/yR4Ysgb553jCZqWUu2X1z9ZaEKFqfu9qMy2xEXJBGaJp7kvjMTPKgtMZ3pjXyZqTDu3i7XyP88rrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN6PR11MB3908.namprd11.prod.outlook.com (2603:10b6:405:7d::13)
 by DM4PR11MB6357.namprd11.prod.outlook.com (2603:10b6:8:b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30; Wed, 4 Oct
 2023 19:19:27 +0000
Received: from BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::92a:bbbf:656b:dcb5]) by BN6PR11MB3908.namprd11.prod.outlook.com
 ([fe80::92a:bbbf:656b:dcb5%5]) with mapi id 15.20.6838.030; Wed, 4 Oct 2023
 19:19:26 +0000
Message-ID: <4feb3f2e-ecbd-1fca-9568-409830f50ee5@intel.com>
Date: Wed, 4 Oct 2023 12:19:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.1
Subject: Re: [Intel-gfx] [RFC PATCH] drm/i915/gt: Do not treat MCR locking
 timeouts as errors
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
References: <20231004094357.634895-1-andi.shyti@linux.intel.com>
 <eefc8c62-1ac5-6604-2ee5-576ca87c2be5@linux.intel.com>
 <ZR1x0jlEzrCUNoip@ashyti-mobl2.lan>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZR1x0jlEzrCUNoip@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0146.namprd04.prod.outlook.com
 (2603:10b6:303:84::31) To BN6PR11MB3908.namprd11.prod.outlook.com
 (2603:10b6:405:7d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PR11MB3908:EE_|DM4PR11MB6357:EE_
X-MS-Office365-Filtering-Correlation-Id: ce3405e4-424d-40d0-6b59-08dbc50ed302
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dYXy4m+eIus6UTV3d21at53ynyExI041ubIyIf/fU/gH0lzV5Q2Tp33TwT5CCTXVLharCH2wAsKxQpxwiy735WnLp7A/yEL+TELu4qXFrmYU6nVZtEiV7i9kTZrjB8FX6sVKz2vszSVWE1VUzGoxDwwS7S8LftfSCAy8K9Ok+t5VWjx58mB0d3t5/yeYlV/iLCMsje4zgPJKU/B/y0XpkQj1uSN0NW1G2tr3pm1PUftUdtqKdwLr7qYQRfW14RySmI/oBRo8mGElgKuoghS2NHLLtI9gpaR6pocdIdNBjb3L397VrVDH/fB0736/AvoxFZM33cd4FLDeU7QoJlkFiC3lXXzDHTEYVTOBP3bzMe/BaJLQ8X+T/bAzCsapLmE1LhBWFl/bHA7l+zvP5+q2wPqLANsw4e9zjv6Ro9uP9irVTsCFPb9xdUghIjdGmfSuCPYglKcdeHKDsx5zrj+mQqORbcM25KXma1BxQpBOpoA55/t+7rBAw8JdqNU+6vg3YahUvW0rubW93Ztoh4/oAKdll0qAIK2InKk3DtGJM3WgsxQORjIXAgMrqIM6J/Wcgzt38/b6X0CfS22LuDteIpsHVcIaBW1fg0rajITEMjWacXe9EdGUMYdjbBAUiEDvrXJZTVVJc0vKzLlYW5kucA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN6PR11MB3908.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(346002)(376002)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(6506007)(6666004)(6486002)(53546011)(478600001)(26005)(2906002)(83380400001)(2616005)(6512007)(110136005)(41300700001)(316002)(4326008)(66556008)(66946007)(8936002)(54906003)(5660300002)(8676002)(66476007)(36756003)(31696002)(86362001)(38100700002)(82960400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1RIWUc2YjVvTDJweWFEU2pCSjJkUWFiamRpMEdidDFITTRzZWgvM3BiKzlm?=
 =?utf-8?B?VlVqSGtoZTc0dG8vWERaeUU5UDlzMDV3czVMOFFYL2RkbllTWjVCVEJIQnlE?=
 =?utf-8?B?R2lPTlF6NC9wQmRianhZMjFuZ0ViUWFWODRJZUtJSHlSbDNuWEFCa2tlMU91?=
 =?utf-8?B?aXVmTUYvNEhxWE5EWG9KQ09KSkVIY1lmTUpncS8yZTUrVFhhV0hvU1BuNmZn?=
 =?utf-8?B?WnRobDkwaC9jS0RXT080d25IU1hXU0xTUHZrRHloY0EzeDZTY09zc1ZvMXU0?=
 =?utf-8?B?cVFDeDlRcTlubk5wMHJZZDlDdmFrQ2cyZmJmaGl6VmNhZWNNSkprcmJzSUVU?=
 =?utf-8?B?ay9WT0RVQ1M1WEdaZmEzSjl3N2ZsRzhjekh6SnVNNmltQ2MrYy9SL21nZHlX?=
 =?utf-8?B?aHo3MFhPa1NoN3BzNFoyQ3M2RTBQbEdwTDBnUklnaGtiNlBlRVVnUk9FVEpJ?=
 =?utf-8?B?SGQ2bEZ2MUNFeDA3bWZIVXkzeTdZNE9FWG1xR1JXZGhwMU94M3ZXOG1ZaDVo?=
 =?utf-8?B?ZkozeWc0V1FwVllWbGh0RzNuZEZqYzNhUVJwaXg2SDNPQVhyUWd5djlhWUxJ?=
 =?utf-8?B?cWdZODVtSzBoNG9nbHpmYysxYUVpalIrWUZDT0M3YWFzK1ZGbnlvSENUdENt?=
 =?utf-8?B?VkdoUWFKcnBDNEZLcjd5S25QSWJRNmhJU2hTaVVXdEQ4bUh4L1Q2di9qVXRs?=
 =?utf-8?B?MjFNTGxQZVlyekFXUFVvTVVrVTJZcnFRVERFYUdJbkZBQmJiQUdXYzRhTm5O?=
 =?utf-8?B?WEtVTnVHQ0N2bnB0QklEY2NVOVptVHhKWHQxRmxkemJDb1JPcUZnc0pLRFFi?=
 =?utf-8?B?c1RZWUFhVzI5MDkyZ2U3cllwWGlxNVF3M3BHemp1VXB4WkxiYktRc2VqbmJn?=
 =?utf-8?B?MXdLZm5kb3BqbW9vTUF3aDlqMFU5SDJuZDVYUWFaMC9VMG5sdnJ2UVRtaHJF?=
 =?utf-8?B?YUN3YUpmVG9FS2RuVjkxMzd3WHEyb3hPNG8yRzFGRTZlR1JSMTAxcElHRm96?=
 =?utf-8?B?YUkwN1BNdWlncS90eUVyOEgzVzBWMTkzdEtBWkZpK1p3NUpIRGNDV1ZYSTZv?=
 =?utf-8?B?UFJZS2xIb1dZbFFBZTcvbGJkMEczSXJPZURRK2xhdmk2UlNISjBzMUlkaW4v?=
 =?utf-8?B?WkVFdWdic2dsakNHQklJejFCajJvYlZvcEdmb01QeTdSeHN5WUhMTHIybmlh?=
 =?utf-8?B?VnBvb2pYZkRJdUExQ3djeFdwaVE5SmpOcTNmaGRDWHhtbGJtTSt3bzF1R2pV?=
 =?utf-8?B?Si9tT0Q1VXROY3hOOXhPelRCRzMrT2Y2dGxpeVk4L3d5amlmem1VcU5OeS9G?=
 =?utf-8?B?REJMZElMUld4VnR4VTVHN2VUNWVEUWF4bVdiOGRIT0JSSjg1aUJLR0hVcFpL?=
 =?utf-8?B?Wk8zR1Y3T3ZLbWhoZ3VvNmV1alpwR3EvUjY2NG9yRmtlbHBkcEtVaE02cGxR?=
 =?utf-8?B?aWd0ZDdjQzFaS2dmMC9nbFFQMSsyc3BUOE5HbG9LdXR0ZTZxdlVYOW5ZR2NC?=
 =?utf-8?B?eERFMklpbUpmU1oxZWkwNHFMZG12S25iUkZ1bGkwVVQ1OUh1Rkt6T0tydm5K?=
 =?utf-8?B?ZVBsVEx3WUdVTysrVGFGQUptN3RXbnJ2c3BFUzVGTkpTaExVZS9vZGw0aTlo?=
 =?utf-8?B?azJjOGVNczZZRnl2UFVHOGNYYy9RcW8vaU1NdkFNRFR4Y0h3UGlMbGdHb2I5?=
 =?utf-8?B?RmRsZm9IbE1MNFQ5QXNOTVFxb1dyRWFjU3VqaHVzSUxPZGJQdHJHQnBVOVgv?=
 =?utf-8?B?dHY3cUFzMk8zaHlQZ1VFS3ozdFN2U2hwYXBCNlczT2xRZmxCRytlQVZmSjBC?=
 =?utf-8?B?bVBSclRBTlVBMFNISW05QjBEMFFjTHAyOE1JbHRacHFoekphVjMwbXV4aEJO?=
 =?utf-8?B?azFKM2tQdEVGK290NEZ0Smp3VkNHc08vbmlrTmU2RkpEamxkYzdTUVc4S0FY?=
 =?utf-8?B?ZEJjbkJOcEQweERiVmtybzZReEFsaVhybjBHUG02L29jS3Y2d1FCZ2dKQTFY?=
 =?utf-8?B?MTEvZWc2WlJmS080QzAzN29BRU10MW9BYU5yTUFINXAxWTV3ellmR3pac05J?=
 =?utf-8?B?NWF3RHJIcG45TElLR1lUN1JHOEgyNmw0MU0zSDcxM3JxYWY2ZTA5ZloxUW8x?=
 =?utf-8?B?SXlOZXM5Ym5IbDhVelZJQW9OejRLR3lsL0lNNXFYamVYaDZUQW9SQko3aDJP?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce3405e4-424d-40d0-6b59-08dbc50ed302
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3908.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2023 19:19:26.5351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UEoNI4ypLUhaRmtHEF/4HYY1dIfO86fmS33c46i2huRQlw94RLbW6Hq1BfcR+FBobKH0q4YK/7oGogiyfelGGoC+HIsaQeSXdaVtfT4jkuQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6357
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, gregory.f.germano@intel.com,
 Matt Roper <matthew.d.roper@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/4/2023 07:08, Andi Shyti wrote:
> Hi Tvrtko,
>
>>> The MCR steering semaphore is a shared lock entry between i915
>>> and various firmware components.
>>>
>>> Getting the lock might sinchronize on some shared resources.
>>> Sometimes though, it might happen that the firmware forgets to
>>> unlock causing unnecessary noise in the driver which keeps doing
>>> what was supposed to do, ignoring the problem.
>>>
>>> Do not consider this failure as an error, but just print a debug
>>> message stating that the MCR locking has been skipped.
>>>
>>> On the driver side we still have spinlocks that make sure that
>>> the access to the resources is serialized.
>>>
>>> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_gt_mcr.c | 6 ++----
>>>    1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>> index 326c2ed1d99b..51eb693df39b 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_gt_mcr.c
>>> @@ -395,10 +395,8 @@ void intel_gt_mcr_lock(struct intel_gt *gt, unsigned long *flags)
>>>    	 * would indicate some hardware/firmware is misbehaving and not
>>>    	 * releasing it properly.
>>>    	 */
>>> -	if (err == -ETIMEDOUT) {
>>> -		gt_err_ratelimited(gt, "hardware MCR steering semaphore timed out");
>>> -		add_taint_for_CI(gt->i915, TAINT_WARN);  /* CI is now unreliable */
>>> -	}
>>> +	if (err == -ETIMEDOUT)
>>> +		gt_dbg(gt, "hardware MCR steering semaphore timed out");
>>>    }
>>>    /**
>> Are we sure this does not warrant a level higher than dbg, such as
>> notice/warn?
> We might make it a warn, but this doesn't change much the economy
> of the driver as we will keep doing what we were supposed to do.
>
>> Because how can we be sure the two entities will not stomp on
>> each other toes if we failed to obtain lock?
> So far, in all the research I've done, no one looks like using
> MCR lock, but yet someone is stuck in it.
If someone has the lock then that someone thinks they are using it. Just 
because you can't see what someone piece of IFWI is doing doesn't mean 
it isn't doing it. And if it is a genuinely missing unlock then it needs 
to be tracked down and fixed with an IFWI update otherwise the system is 
going to be unstable from that point on.

>
>> (How can we be sure about
>> "forgot to unlock" vs "in prolonged active use"?
> There is a patch from Jonathan that is testing a different
> timeout.
>
>> Or if we can be sure, can
>> we force unlock and take the lock for the driver explicitly?)
> I sent a patch with this solution and Matt turned it down.
Presumably because both forcing a lock and ignoring a failed lock are 
Bad Things to be doing!

Just because some entity out of our control isn't playing friendly 
doesn't mean we can ignore the problem. The lock is there for a reason. 
If someone else owns the lock then any steered access by i915 is 
potentially going to be routed to the wrong register as the other entity 
re-directs the steering behind out back. That is why there is an error 
message being printed. Because things are quite possibly going to fail 
in some unknown manner.

John.

>
> Andi

