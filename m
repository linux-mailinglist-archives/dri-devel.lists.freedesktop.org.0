Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEEA60B13B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 18:17:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BDD10E233;
	Mon, 24 Oct 2022 16:17:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E593610E233;
 Mon, 24 Oct 2022 16:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666628266; x=1698164266;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ev67m+6wSqjeypo9BfJrQEut2DVgnPsJ96j9QB8Su5A=;
 b=Sh6oeGnM1VM1tWAKTJc+gjvk/SBLPrD7XbX5sLDgPDBCj+3Vc8aBPCym
 Qf9K8XeHoDMetbXZRyfhy8YGGhFPNgT5NhB4NokpZod81R5gEheff7VKB
 WDTnQ61qzV7X3ThnW83xUORwB9bObWAPSRSdi9BxhKcZcOVFwOP03ukJB
 idDysXwc+xIzTj+wH3P1TxoIltlZsKRNJz/hKrA9y+bWRM4m1P3hQDwDI
 Awt6t8BBoHQnfzkYotvHW+SE4Vb3oZ75dsAITcnznke0gPmcJmPb688an
 jTeYJrB4dtQKZoJd7y+pEssTeRLIUN+aU8ONkUw53ZNkIMre8Y/hRGPfa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="334050554"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="334050554"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 09:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10510"; a="633766380"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="633766380"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 24 Oct 2022 09:17:31 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 09:17:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 24 Oct 2022 09:17:30 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 24 Oct 2022 09:17:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=flcZsocVOEDrZQ2DcQjDMCCxvlLMLwVOwfwQlkZDD57/p3GS/YfU7ojm5IqTu/RkJiT038SI83Oksa4w3NOBMYpu3AnEdZPDZQ09lESSjFSnoNTZ+hXJM4fOvSodQJvZATtwy3GXHvBvGYC/xZE3h2mL9dGqBd1+ue1/ndVQHAJM0VnkhpGEWKRbK6AeCJ+Z4VmCg4xpgdEqtnmCAiie881bmSmgWEMk/rD+lI/YUfhzgcwifXAIrEMBX7V5PfnSQdKJox2sPWvd8dza7bsSf1iirfAnvdVPLG06+lNTWyye69ZbZ8JkHtECZMDojNMn7JRVeMVB2a+TWQI704SBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULcPV2kaENzQ1DgIMLnlidnw+ZfNehq/Z9EyKJ6dAZI=;
 b=IXoxVIPgnd4uA/QWLoKq91ZgCsZGewb8DPp8B1bs82TtnQlvkjmvyoad/MGvE79EH3zT4RZjOG8XnlseOnp+8llcFMby08x3T7USE6pVVvwIDcGYDUbaILJr3yEwfs8rnBpbH+kZPdSSTZJdhv4pBoA0HfE+btV4rB0J8hmeEtNtLv1icGiHihTC+yTScbElBcq9r97xqN+3RRpGORCE68lb6o2jwcTZZpOsvJrRZfBXOTk/UFZIge2UIpWrP4vPr/g3TzWDJ/dPGcmenw4DilKwng7L0q+Fl7+pZh+Dn9ulwsiDoNYtPUhaZ90wwk9orZL6hAVRbvL1/352zlDJYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM4PR11MB5534.namprd11.prod.outlook.com (2603:10b6:5:391::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Mon, 24 Oct
 2022 16:17:28 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::725e:5836:c99d:a1a6%5]) with mapi id 15.20.5746.023; Mon, 24 Oct 2022
 16:17:28 +0000
Message-ID: <d61aa9ad-6f9e-c77b-4f4a-7417f2003f90@intel.com>
Date: Mon, 24 Oct 2022 09:17:26 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [Intel-gfx] [PATCH v4] drm/i915/slpc: Optmize waitboost for SLPC
Content-Language: en-US
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20221022002452.36716-1-vinay.belgaumkar@intel.com>
 <87wn8sppyp.wl-ashutosh.dixit@intel.com>
 <102c7cfd-c7b0-48b4-8fa6-7719f5529783@intel.com>
 <87tu3vpste.wl-ashutosh.dixit@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <87tu3vpste.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0011.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::24) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DM4PR11MB5534:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f1e61f-a55e-49bb-b399-08dab5db3f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IiE3Y4bqU4nhIvHNDKPsk7enYI9m2ynkydR68JQg1X/B8EriGOf2AKhKnz+CG8B3Gi2aqApeDqjs99mSX63k4jOMunspBhb1duOK4QZbGmRUesAn1ZTwNDtONqkzLeqSB3JAyMHCNOfmmGVSY4iYa+8wyp1eB3I/oFXS/jo0k0dOk5sgQzpunYjR5uQdocKJfwyXFpyhqaVAHn3A81vMz81rXcuyLyvog7ZeqNUe0eFTGSghSXnYJlNpSQMnNT++xrfN14WM7Obf8qDjZh5CfSmzKkjGeY2d8NRhAn1+hYB1AFLDOAd12UyUz+xphevq6zDn6U8+EYStvbXC9AW6EjHrzdFUbGj/kpLudxc7wCDqLnKYHJ9/E61m1qyvU8osRvrs3df7oMwecKnrDpIjT+7EXEHLKmbJOAHmFNv+ot0ULsRYnLjY4hEHXjAsZxDthqFgqZtY3rUCk2WHpXqDti9cjiiD55OjmzZA27kbDHEJSoy//JbadXboj1cdN7zlIu1CKnJcagn9ZGJrcWrybq9kzctW04hFo42PNmKkZqIxWkjs1byV9vAF1bWO5fJEmr34aNAHjQIJgYmNITa7V5LkcHIHlQ1VHUFydU73iqngshNruuIgbfe7E+dzpraEW2aH5H62cBm5q5IH5qz38uthqH2jCg+9f+xSYkYyq3xnZgTdMP8KGaRlWYqz9S02qiewUDlKaPwwktecCiGc2nSJpGh98Pn1AjVRhWQZtMnOnHWMl7Z4XPaAp0KMOx/cDFccXU+MCEBE8S91PoSPMSKKA+Qjsvpm3vMulU7asoM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(39860400002)(376002)(136003)(346002)(396003)(451199015)(6512007)(2906002)(26005)(2616005)(5660300002)(186003)(8936002)(6862004)(450100002)(31696002)(38100700002)(82960400001)(86362001)(83380400001)(41300700001)(316002)(6636002)(36756003)(478600001)(37006003)(31686004)(8676002)(66556008)(66476007)(4326008)(6486002)(53546011)(66946007)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2VDTDVEUU16NjdGcFlkMkJMdWwzQ0dFZFBRa1Jzdi93bDI5djlqWndIVllS?=
 =?utf-8?B?c3kya3hTanNaRzl4RnB0bUZBRTYvUjVkWW8vRmxBQUp5c0RMRkw4UTVaRHVx?=
 =?utf-8?B?Mk16YmpDV1lPR1ZucjhFSmNnZG52SjBPOHNPSnY2R1hndU1BenhVKzRMcytx?=
 =?utf-8?B?V1E0amN3MWJtSkt4cWt3SFl1ZlNXK1VrbmhpT2Z4NWNWWnFrL3VmRVhYNHpr?=
 =?utf-8?B?Z2JmL1daYlMyK0cwK0ljdG5OYkhXOG1zS3hEYnkvRDR5T3FxUklocFZqR2Fq?=
 =?utf-8?B?MHJDL0kyajJxRDI5RmJ4alQwcW5YQ3BRU0ZodEJHaktzUDd5dGtHSTBIVkpJ?=
 =?utf-8?B?MjJWK0p5Y3F1MWRFVm9jWmJPYU1LckxMQXU4Szkrbzd6MW5XaGpCa1BhbTF4?=
 =?utf-8?B?UnJpaXljYk9IbkJoa3d5cEZGSDVGOWt6K2JBaVhTNTA2b1Bkb240WVl5SEFB?=
 =?utf-8?B?c2VTTVlHMnZBS01FUWhjUDBFUGxvWjJ5eGdETy9iUkJIcDY3WWRoNlo1SVZ6?=
 =?utf-8?B?STVCZE0weEc1dlRJOEZBU1dRQld3K3RQOW4yejVYVUNEQmQ1dFFzMmw5VlVu?=
 =?utf-8?B?YytCQ21RbzgyaURoVUFwZTc2cGNmRVp1SDNNOTkzd1NtR29nVmtGRkdPREQr?=
 =?utf-8?B?b3R6TnJHcnFodG9aNS9wSHhhQisxQnp5Q0pGZ0FJTmcvRThYWnQ5aFlBc3VT?=
 =?utf-8?B?Z2wxY3JvRi9sZTk2OGwySkl0Sk90aEphZFZSNXQ4OUdkbFUyRk00cXRIVXBa?=
 =?utf-8?B?NGR0RkhWVkxNQ2RHVEROc0RYZ3JRTkhBZFpoeHU4ajZUL1N4b3pyamlOajNV?=
 =?utf-8?B?akFMd3laNlpjSFBsaVhqaU5iVjRSZVJTV2RiOWxmYXR5NDh5Z2hDWlA3Rkt4?=
 =?utf-8?B?eXlvaXRhQ2prc1hCbDFGMktqTW9Vc1NWbjZmMWFRRTR1QlNlMjdMUVVqbFhT?=
 =?utf-8?B?M0d5cUdNYkxhRjFoYURyZHpwbkJtTUI1cW1rL0FFNTJPY3lrUG5BYmJTTlFo?=
 =?utf-8?B?cGVzb2JxeVpuQ01DNFNUbXN0K3JrczhCNkRvd1dlY21RRTRmaW9QU21qREJa?=
 =?utf-8?B?b2NTVFB6QWg5UEV2TXlGSnFaWXJ3YitEaWlkQlZDWU1jQVI1Q0tIb1l0QnV2?=
 =?utf-8?B?Q3hNalM0SUpjZ1M3NG9PVEhOeHB3VjFNUWxCM04waCsvUWJqUmJSaUdxZnNP?=
 =?utf-8?B?R1dnR3lBR0t2RTZhZE80ZkV6UnRUeGQ5QVVUSDhjcE5iK1VvQXp6a1JXRlAv?=
 =?utf-8?B?elVmaGZ6OXJRQ1lWNGp4TjJuY2pQdm90UXc5Zkp4VmticW9tOUIwemJzYTFm?=
 =?utf-8?B?VzhRaHNpVlVwNGx2Zjd4UHFHWHREaXozdGt6dXRBY2hyc1JZYjVsMjZ2aFdB?=
 =?utf-8?B?YlZtK0NoVEVxd2FBNjZwN0FyRjd5OHVraFU5L1dUR2E2b1U0cUwzb01ibnhR?=
 =?utf-8?B?UnJJMkM2dk4wYUdBdndvb050Ums5MXJVQndQN2dMYm1ENm0vQ1RFdlUzSE14?=
 =?utf-8?B?bXpjVFE1NEdmMGNMVm1Yb0tEUjlSbVF1Q1JHb2ttVG5LSHR6YjFjdUxDMlVP?=
 =?utf-8?B?RlBDOE5jbkNyQ0lGTVRIVmFsOFZDUithb2tyZXZYWDNjekQ1T3hYVGJ2N1E2?=
 =?utf-8?B?NnhDVjhOUlpLRmdJd3FtaUdjNERyaHh2Y3FvN2hvVTVRVkxDelFTRFlNcHQ2?=
 =?utf-8?B?TGZtTVZqdjUvOFJQaUluTld5d2p3SzRIM2pYTmRZdHNHRXhYTTVQQXBaVnBG?=
 =?utf-8?B?Zzc4Z29aSWJPSlRicTJzc2N6Rkp3aWJaWFZ0ak1QRE5yY0hsSmdqdVhVdXlR?=
 =?utf-8?B?U2UxR2kzcW5zWDN2RVdXT2UxcnR3SjZBbUhZaVh0M2xOeGEzaVJNNmtRNFBO?=
 =?utf-8?B?WlBtNE5pZmhLbUNjNmVDQ29Fb2NXanovS08xZFdFZjRuN25uYzdPYnlzRmQx?=
 =?utf-8?B?N0ljblR0TEUyMTI4U3JqN3BBTW1TVlNqWXJEYkYrRDRYQkhlc2U2NWNFb3dT?=
 =?utf-8?B?R05qQndabmlTNGlyYkFnQ29pSzZrOGlhWkJ4aEJMUU9pU09oWVR0d3ZiMGdh?=
 =?utf-8?B?TW9zWWppSzZmMnRtK2FNTUw5Y290V2phcFVyZzdBcTRuYkVOYnYvTUFKWEJZ?=
 =?utf-8?B?RDVwck10NStvN3h1L0FTNTAyZE0xeE5kdW0rRmQwL1cvWElTRkowOHltdmxp?=
 =?utf-8?B?UkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f1e61f-a55e-49bb-b399-08dab5db3f01
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 16:17:28.7294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NFbq0LpebWXw+Nqjhbs2VO+nwwvASPpRkbWuBUfpRWW8B64SeNDvbf1S8hPYTKHHu3hgaQTMbvWG5snmHs9rjqUIhW0hrG2XaMTgRmj14I4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5534
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


On 10/22/2022 12:22 PM, Dixit, Ashutosh wrote:
> On Sat, 22 Oct 2022 10:56:03 -0700, Belgaumkar, Vinay wrote:
> Hi Vinay,
>
>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> index fc23c562d9b2..32e1f5dde5bb 100644
>>>> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
>>>> @@ -1016,9 +1016,15 @@ void intel_rps_boost(struct i915_request *rq)
>>>> 		if (rps_uses_slpc(rps)) {
>>>> 			slpc = rps_to_slpc(rps);
>>>>
>>>> +			if (slpc->min_freq_softlimit == slpc->boost_freq)
>>>> +				return;
>>> nit but is it possible that 'slpc->min_freq_softlimit > slpc->boost_freq'
>>> (looks possible to me from the code though we might not have intended it)?
>>> Then we can change this to:
>>>
>>> 			if (slpc->min_freq_softlimit >= slpc->boost_freq)
>>> 				return;
> Any comment about this? It looks clearly possible to me from the code.
>
> So with the above change this is:
>
> Reviewed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Agree.

Thanks,

Vinay.

