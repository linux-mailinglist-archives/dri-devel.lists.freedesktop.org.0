Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EDF64424DC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 01:47:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638316F3E2;
	Tue,  2 Nov 2021 00:47:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9531E6F3E2;
 Tue,  2 Nov 2021 00:47:33 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10155"; a="229872917"
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="229872917"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 17:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,201,1631602800"; d="scan'208";a="467492867"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 01 Nov 2021 17:20:53 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Mon, 1 Nov 2021 17:20:52 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Mon, 1 Nov 2021 17:20:52 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Mon, 1 Nov 2021 17:20:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VjQqPp4FXPDolffdju8jhMjie0WwCCozWgUU6rCruV3TC2CD9R6Ub9mNnhMYGiCQxOZa6DSXe3p+CKCTl8VCbv1wPNnN99UX6bh8P6JcvM/pX8OAH8OCFYq5MvR9CRq8AwdhUKVBROyQmDgek5I7ZoaPeZEJAhkUFtR3ptEzC2ECnMbXtJgpx9zqYhNAG14Vor5ZYM51aipGxGvvB0A5IBE03CPtTqluECz/VdEXGxzMlD4TfizONg7gK/dhU7ZKNQ2jxShLIE9KrsqqP6cv7Gjyxiwach30Yy4XOxtv9akfwZOOeVU+NH89Brwy/iv9myNXjwplhUXP1lGP508Uug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=no7GhW2IC9n4OJcgofSbDoFc/XOPpzefVMgLjFM9Ams=;
 b=NM6tBQw3zCH+8E5GUQKN3Gxq1MSJhHW4ZVNAQtVPnuXzkHICgUh5d6EePyjcpp9z/nm8CeebGMKmBGxrfWXCaEIsEM0YAL5JS/ibSN2ZelXTG1mwS6ABiiX9fPTqPX4F41oUftslyS2dxh+4Th+YjnUQl6MvOd0/llV4Q+PG86RnnpmFLCd0APaW0ixDv9KrOy13FIGTumlZl1rua4e6iyUrUWmPW3XUG5LtsZu4GBorpx3aqLo1nxXPDzcZQtftOpDbhyp5JQYxE+45Rlw9/mA2u+SVoloW2drjuyOouc6DfS3ozCywSAYcx8YH5GV9tPck5b8OGhn2gHMGMGDpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=no7GhW2IC9n4OJcgofSbDoFc/XOPpzefVMgLjFM9Ams=;
 b=ERmjalEN7P6L10lsNVbb3QH9Uurcq7WvgjQDzDa50CG5JhaEoeqXC9iIVXPTA7N16drQAOOqpUqrMkv1C/sa0utB1/yl8tNz9qiF/0cRng8J9Okv42ov6lhTaJpkbMGG3sUCftQHA3TgZ4AcBIehzZtePP1xLXnHBocWQqSPCMQ=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5618.namprd11.prod.outlook.com (2603:10b6:303:13f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Tue, 2 Nov
 2021 00:20:50 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::912:121e:18c9:732a]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::912:121e:18c9:732a%8]) with mapi id 15.20.4649.020; Tue, 2 Nov 2021
 00:20:50 +0000
Message-ID: <a078b6eb-b9b7-752c-2467-31f5e6fc6044@intel.com>
Date: Mon, 1 Nov 2021 17:20:48 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.2.1
Subject: Re: [PATCH 1/3] drm/i915/guc/slpc: Define and initialize boost
 frequency
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20211101043937.35747-1-vinay.belgaumkar@intel.com>
 <20211101043937.35747-2-vinay.belgaumkar@intel.com>
 <87r1bz39n7.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87r1bz39n7.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:a03:54::42) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
Received: from [192.168.86.49] (98.255.111.182) by
 BYAPR02CA0065.namprd02.prod.outlook.com (2603:10b6:a03:54::42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.15 via Frontend Transport; Tue, 2 Nov 2021 00:20:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db39b08f-6f10-4067-f22b-08d99d969fe4
X-MS-TrafficTypeDiagnostic: CO6PR11MB5618:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <CO6PR11MB5618CFDDE5F38E5CE774FA70858B9@CO6PR11MB5618.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WIyE/ZLmHWiSZM4LYYj9pNgJ0hP1iZJ/zEVKCXaMJDiTfuh/uZXPUDTiRSeHynEIQoSyYuNvDsQxZ/+itW7m+i4htr0B1x9gyOdBu82WitOr23PGRBTNrZjAVOZDfotcMxm0WM8Woq6KmzjvnFp3s/ucm3onra0PsT7Yq+J+8xpn/Yur6eXRpVipjNWaV9uulX4yfY5Us3l+psqdXR6OPl44MzWIAssu8iHdFhEtNNxmZbQiatEJTKxWkx38xYu8XTTt4IercMelHBqhbDaTujZNam1rbXLZlANES3y19QPepWCSVkOvP+sJf/qzQ/SWEC80RLR9bS77hox5RpUdQ12jEsBqHIsCz71OZLO7Jb/riV1/GOF1IOmIK7ghUhi93S0zwr25exb3LXKmpMWtse09thyb1h43ZQpTapQKLQrS/FR+WNIPiEFmDztthhKFeQpK/sgkqQbTlbooPgAbyvTl+RRQka5x9haAdHAcvMA8iauXgcH0ALwTwTlL3hCypWc+7DeJTBpYY/XBTzC7V5FAj+2WM1Ge6G4Eq8kIjMPRQwDxT6Jt5U86CPhQ/l9bjiI5pVY7vv0nCSWTp38eOps4Fqz9jg25LcdzHbN0TjyUt1pnM3/3cNmVAsj6+CbxL6OQrOZUcDHPojTm4DnbUmZrVplfginyP+AkN34/2KYa1GmGovGXr1v/JfT3+ZUyzYmzlH5FsTUYR1GsfRfG2xlHjzjlzhMR1MmIBtMF/9hoq36lFTWd94bR3I7RwMGo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(2616005)(6486002)(186003)(37006003)(86362001)(31686004)(36756003)(316002)(8676002)(8936002)(54906003)(956004)(83380400001)(53546011)(6636002)(6862004)(66946007)(508600001)(5660300002)(450100002)(31696002)(66556008)(38100700002)(26005)(4326008)(66476007)(16576012)(82960400001)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0lwNkVXRW5BanZTSDBYZk1uRWoycndVRHJsUzNEVjhaTy9UUFFhS1NNYXFB?=
 =?utf-8?B?SXdwMWRnRTNzdGtqdGFIMEp3UnR3d0o2aUhxdFk2c2NHWEVaNnlZS2tLMHQw?=
 =?utf-8?B?M2lndHZ4cUoxMjJsSXRsRWp4NHBIV0p2Vko3ZXZKVzNidE9qMzBRN0ZUdkNU?=
 =?utf-8?B?b2VTUWJva0Qwamt3VDhBc3pJMWFMOVVuSFVJMTRuQ0MzTXNqcG5hamlGYTZF?=
 =?utf-8?B?M0xoTWdmZ1FFdGl4akNSdEJmdVBTOFNzUTdydStGMlZHS25SdGF3N1BqYlhN?=
 =?utf-8?B?VHI3WTNQQmtnYzlPOTNtZXIyWGpqcEN3ODBFS3V4SzlkWnNhaFdjcTdJL01n?=
 =?utf-8?B?bm5nRTJtY3pDd2xRalVkbUs1eGJycEJDelNVMmI2VElTdTRNWmFCWGtIYjl1?=
 =?utf-8?B?Q2FycmFmbjF5VjVlSVdmT3BTNnpMNUlyYzYzRWovZllWUGFEMEpFSGV2MUc4?=
 =?utf-8?B?Q3M3anR3UUhnRldTQmg3eWJLVjI1NlpjTExkVnMzbVY5QVk0djY2RDhyTUhC?=
 =?utf-8?B?b1VBcFo4YXZuejB0b2M5dEJJd293VFFIanRYM3ZiYlUyMlhWWHJmUFJ6a3lr?=
 =?utf-8?B?Q3VJR3Y1bmRWMk41N2t1Z3VmVUxqSUdKK01OQWxRcVhSN2dNUUl0RlM3WVJz?=
 =?utf-8?B?RHVSbWcrajlQdWYvc2VxNmVMbXV2SWVRbjRndlpTYXQzRXBWc1lxajFoanlt?=
 =?utf-8?B?anpXb0Z1OU1iMERFdTJGbE9wNlFWR2llUk1MZWxiSlMrVGo0NlFGZkpFYWYv?=
 =?utf-8?B?SVVDWmZhMkdzMmpMYWdpOTRSRmtXWEFMdGkxY1d3N0hRQnQvdEMyRllmQ2VD?=
 =?utf-8?B?b0tGK2hMM2dnVGxUdnczV2tuYzJaRGV3STZEMEhISlBOSlNSTklZdVFBSUky?=
 =?utf-8?B?QUs4N1dxcERhbTFzUEo3ZDNNNVpIc0VXMjRmbW9UNXJ4S21OaDhzWG1uK08z?=
 =?utf-8?B?MkJWeWxaVndtOXNyNDlBdUdRcXZ5SE8wdjh5Uzc0RDNqNzVia0Yzc0RFS0lQ?=
 =?utf-8?B?bWFsTlpMWE9ySjBibllHVjRlcklqV2hFNVV1OTRVbVpJUmJBNmw4eUFSV0Nt?=
 =?utf-8?B?VnVhQUpZTFdGSTNPcG5MVDZzZklCdStiU3hXRHBTQ1lYTVgzMVhrR1k5S3Mr?=
 =?utf-8?B?SHlDalJycTRDZU5Pb21udmwyOXdac0hLdzk0U2t6Z3VtaHdPbi9mU3ZyUFcw?=
 =?utf-8?B?UVo3WDN5WDNNTmhaaXQ0bDRLWGtreXF2V3FUa04wZTJmRm96ZEpqcEVDamx6?=
 =?utf-8?B?a0loN2RlanM2Zmp5a2xDQ0JpenYzUDUyU0RQQnFOSUtLK05ZdWUydm9TODhZ?=
 =?utf-8?B?VUR0S3ozd0RLMWtickxIVUI4Q0hKYmV6Ykg0cyt0ZzZ3alJvMjNQazU4eElB?=
 =?utf-8?B?TUZKbjNtUGlPeFhGT2lpa245L2dHeDRjT3JhcVlJbnB6ZFpidVBsK2lDRjlO?=
 =?utf-8?B?eE91bi9TMDY5UEJGdUY1N3JlV3Bobk1xdXFLSHltcW40THUxd25WZG9XMWZ3?=
 =?utf-8?B?ZUNnYUc0YmYwZS92YjRqU0FyeDljNms3eHZTNEUybURLWFR2TWF1ejhta1ZO?=
 =?utf-8?B?Mk5oWG44WGFOUDVkNk1hM0N4Uk9xVHlLMWpnbENNOHAwcG4xaUJMajJBN1dT?=
 =?utf-8?B?Tm9kTkNIYzVXaDUzeVJBMDNTUGJEejRDbE5WNldINGNtYkxYNms2dkhSVk5y?=
 =?utf-8?B?Y3dRdGpQRWUvU0JWMEhFczczSUZyUFd3OWdHdTF5NEJ4MDhTOGFxWXFDNnVS?=
 =?utf-8?B?SW1qMVdHTkZxK0REbzFNd25hZDgzT2lYNzl2RHNpR2lwRjhzbHljZG55TXlB?=
 =?utf-8?B?YkU2UkF6K3RVS3ZNc3hpbTRibEhHalNCT0R5aWVJNkFhaGxRa3NXTkJucUpx?=
 =?utf-8?B?TFp4VXZWY2JoeHhTTGkvcDNlZmFsMzlnd3RsYVNiZUQ1N2Y5NGhPTFhaVGlt?=
 =?utf-8?B?RjdzS25md25oci82SlVjbWlYQnMzUU9lVkF2YUl2WS9mRDkwaStFSm5nbW83?=
 =?utf-8?B?UUtGOTNJeTZCQTVCQ0tZRFhSQmVKbzU3a3Z6Rzd4dmM4bGNvZVVENXJNamxw?=
 =?utf-8?B?dlphU1g0ZWM3R0Z0NTdDTFZqVHNuUmVFRzY3aG1aS0l2KytDWW1qeW5qODE1?=
 =?utf-8?B?cjJNYlVjTDZLQXRoRTZESTlrWHk0emtsamhsRE82R0tYTldwY0NmeGVNeGlG?=
 =?utf-8?B?SGh2QURadjBlLzJuMml1U0J3Qk5RcjFhdTFIM3RLUkpIR1FYbkNIUTVsSU5V?=
 =?utf-8?Q?E/wTgRfpNHHxthuu1svVpqyY4of5njUYy5LDPoB3ck=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db39b08f-6f10-4067-f22b-08d99d969fe4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2021 00:20:50.6884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q9jLYkI/M6Crt8mkqU9ZvNBZ1BH/Y8RdZdL+VNM1oJwzDawbFjcGf3lML2ifN8rmquO1fJ/iJfeXf2A8j9nBz6NtsVRE2/F40yDEmTUXtfM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5618
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



On 11/1/2021 1:26 PM, Dixit, Ashutosh wrote:
> On Sun, 31 Oct 2021 21:39:35 -0700, Belgaumkar, Vinay wrote:
>>
>> Define helpers and struct members required to record boost info.
>> Boost frequency is initialized to RP0 at SLPC init. Also define num_waiters
>> which can track the pending boost requests.
>>
>> Boost will be done by scheduling a worker thread. This will allow
>> us to make H2G calls inside an interrupt context. Initialize the
> 
> "to not make H2G calls from interrupt context" is probably better.
> 
>> +static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
>> +{
>> +	struct drm_i915_private *i915 = slpc_to_i915(slpc);
>> +	intel_wakeref_t wakeref;
>> +	int ret = 0;
>> +
>> +	lockdep_assert_held(&slpc->lock);
>> +
>> +	/**
> 
> nit: this I believe should just be
> 
> 	/*

ok.

> 
> /** I believe shows up in kerneldoc so shouldn't be used unless we want
> something in kerneldoc.
> 
>> +	 * This function is a little different as compared to
>> +	 * intel_guc_slpc_set_min_freq(). Softlimit will not be updated
>> +	 * here since this is used to temporarily change min freq,
>> +	 * for example, during a waitboost. Caller is responsible for
>> +	 * checking bounds.
>> +	 */
>> +
>> +	with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> +		ret = slpc_set_param(slpc,
>> +				     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> +				     freq);
>> +		if (ret)
>> +			drm_err(&i915->drm, "Unable to force min freq to %u: %d",
> 
> Probably drm_err_ratelimited since it's called at run time not only at
> init? Not sure if drm_err_once suffizes, probably not.

Keeping it drm_err as discussed offline.

> 
>> +				freq, ret);
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>> +static void slpc_boost_work(struct work_struct *work)
>> +{
>> +	struct intel_guc_slpc *slpc = container_of(work, typeof(*slpc), boost_work);
>> +
>> +	/* Raise min freq to boost. It's possible that
>> +	 * this is greater than current max. But it will
>> +	 * certainly be limited by RP0. An error setting
>> +	 * the min param is not fatal.
>> +	 */
> 
> nit: do we follow the following format for multi-line comments,
> Documentation/process/coding-style.rst mentions this:
> 
> /*
>   * Line 1
>   * Line 2
>   */

Ok.

Thanks,
Vinay.
> 
