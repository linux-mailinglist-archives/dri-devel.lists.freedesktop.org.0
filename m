Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED246F490
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 21:04:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F19410E267;
	Thu,  9 Dec 2021 20:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BC2410E264;
 Thu,  9 Dec 2021 20:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639080275; x=1670616275;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u+GxTHeVVUW+LNp5tJ4V1HBRZGKlJ9nB+RV5tZ4pY/0=;
 b=mobEDnqoRIjMxZtQzJN0+XSbk6M4R7X+JMRqNTjBJ2tO+oYxcYFaer7N
 /6ymGWV6/iWe+pKQ9cMcsPYCz1V89M3DRoH5xn0idBVPG/FTrP7DWXGNG
 HGsLI7fKbJSK7HCDm8N2DpdIZzTrdXxPTR5CPamwF1CX2hJl1q7ofx/wm
 xJXUrATKpnUWT8+1W307+5af4YbetmR/aXhRjLEO5ltqaKqrxMgXxFomU
 wZnVFRKrkdX7uAvM7eAAyM1ZyppVOrvfv74410wzjutoiYp8cwFYeE7bo
 tsKy8JmZuX7zZV40NqfV4t69tAWta4qcFXdbtT4MBtgKDvpN8B/MvLs2j g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="218220190"
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="218220190"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 12:04:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,193,1635231600"; d="scan'208";a="680474018"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 09 Dec 2021 12:04:34 -0800
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 9 Dec 2021 12:04:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Thu, 9 Dec 2021 12:04:33 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Thu, 9 Dec 2021 12:04:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vw6hC8TU+W/vy1/yR57/Ab/Lx/fr3WV3vRMOoPVuC980EWuYw3RlOTB5joiXC9kwxzI0QKEb+ErN1sDnzp2pk/Xw4FAOLOmE7+Tlcv/+Ds24c1o7BmjIJ77+kTZHRJRA9gxAc/laMJlsflHSVAAqU72Wk/nP9LUvaK0RxYDsquPxU9Yy98B4IK2Vj6VvRCdctZV1NvGa1RpXSWTHwyfsygM7MB0WqyuyIeya//O6jgTtdqFkN86tNRvGFhBJ5P/mwYblc/UC6HuVS0XKTGbRzaQZQMFPKmht+2LJ/w6UjA+5xZzdiRVw6+J+mrBQvDO9aRCFlgGPhZYIzq39N7zagg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+SV5M8pto6QYNEw8LfBzxg2dvG89vhMOuGEOs2tT5M=;
 b=EG0X6qVTaQqQTq4Rdz25fj2ZknhTHIGIif6wEFLcKWtrn/FkkLPwDmss1ojd/Ae9VR9sPm0S+wAXAkJSFQqdQjNoyBuBr9wDLFuRgKQG7PAyxNhfzvypsg3DaO0ZhiEyi2B33BAAjMjG+clKCMQ/c+bVfelHpKuq5+c7yYmeh4+hpJGXeSzPgFMI+pMBE0iq7vuXQIb6yGHYXP+UjPROR6vXtqDRQc60AMjOzvUenT3l8X1iCHCtojx7S/MLWnNnT22ywtWHZGVWLx2qVsesxDh4HDZyODT5wm8vFqrmUYJatKB4K3hid3wEnpWnXe5Bnhj6YTvKooaaOeuOEVv4jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+SV5M8pto6QYNEw8LfBzxg2dvG89vhMOuGEOs2tT5M=;
 b=NnrnRNv7j0tAO9gs+3jJnww65GV/3j+mzHYihS/MAME2k+Yf7nJ5n9L5+GfFSTv3JIkFLjV9P8rjJRj2azc7Q4s8jQn2TLro4ZVwTAcxPRATkpMQkWxHH/0KbBDdjwsRXjbI9ZLYZcnvTcWwLYd8LveE2EzwDaa7xcUFkCIwfoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5488.namprd11.prod.outlook.com (2603:10b6:5:39d::5) by
 DM6PR11MB3722.namprd11.prod.outlook.com (2603:10b6:5:13b::29) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.19; Thu, 9 Dec 2021 20:04:32 +0000
Received: from DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::d91a:c903:855e:5f24]) by DM4PR11MB5488.namprd11.prod.outlook.com
 ([fe80::d91a:c903:855e:5f24%4]) with mapi id 15.20.4755.025; Thu, 9 Dec 2021
 20:04:32 +0000
Message-ID: <88b23ff2-82c9-0941-4568-c0fc178190b0@intel.com>
Date: Thu, 9 Dec 2021 12:04:30 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [PATCH] drm/i915/guc: Remove racey GEM_BUG_ON
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20211209185141.21292-1-matthew.brost@intel.com>
 <a6b95ad6-4c50-ff97-99ac-dc2a75625de9@intel.com>
 <20211209195719.GA21632@jons-linux-dev-box>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20211209195719.GA21632@jons-linux-dev-box>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0225.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::20) To DM4PR11MB5488.namprd11.prod.outlook.com
 (2603:10b6:5:39d::5)
MIME-Version: 1.0
Received: from [192.168.1.65] (99.72.232.53) by
 SJ0PR13CA0225.namprd13.prod.outlook.com (2603:10b6:a03:2c1::20) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 20:04:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c35e8e6-0ae2-4855-b98b-08d9bb4f1d55
X-MS-TrafficTypeDiagnostic: DM6PR11MB3722:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR11MB3722F7A6C6E01B52E292C006F4709@DM6PR11MB3722.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eQJ1kqJWb8GWbRx8bCtf0hU7g+fqoY+Frt6ia4pMOWWo3yx8p2ZYvMtrKnXQMFW3YOOrlX3ayc4Df4MES7CsE9v/KiM2uO2dl8f63r4SwPHy4Nmw8zEP0lam5XOAmzrUunWSgENC6PZaBHxbjPS8HpJL6E0QzGmXQVd1KsSRcskjN1/8YMd8w98HEUrgoCqtXz1sjFNiuYO6stzHQZ269kOVnETeaFj3/8CowMF4IOTbsySCXNBsoLw/ejaCsV0ghpYTGbUwTFZrIG024k/Pl2ucL+qU9AcSC3KfBCSbovo5oCTmVMXca6vbDLVz9tG/3Pb9weOjFmcO82mTwxsSuTGzIVMJyqG+TUW3wWn07qkLpFsoQDv5PGkGRpGnZv+tZEfzuZpnWZwBCW4GGRmdx24xDQ50y2GSW21MOq5Z6d+xMhVc53Fjid7u/mTkwAD+mFPW8Pe2Il0FhqT982N2+1P+WgdLrnzyV1yWdGhZ36nRaiqfRIeMBaogFS92aCx82WAlLFgvwBVEjpfXX9cL6b3Hq+RnKdAQugI7epLNeCFJ81yodRI3ZHdl1dYvGY0dTIW905uKCb9z+QeTZjdzEfDPjIsAtycBvtrBvBmTwsLGmWRN/QQsNAKJ0DzgEwsjW4SES9KktiiiAEg4zuMNO2GsKMdhAQLiLtBo8C+d2T4T5iq13b073iSGwoU7drjAHiAkcE311LgoKi0FfwmQhn/5/unoS/9rxcSzKowDX4Osg7ZDf9kXctDRWaV2hbCc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5488.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(36756003)(450100002)(16576012)(53546011)(26005)(38100700002)(83380400001)(31686004)(37006003)(316002)(6486002)(6862004)(8676002)(5660300002)(4326008)(8936002)(66556008)(508600001)(66946007)(66476007)(2906002)(956004)(186003)(2616005)(31696002)(86362001)(82960400001)(6636002)(107886003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVpkOHh1ZTI0YlB4cyt2Qldqa2pwb1hKYVlJQk5SSGxtSVBjN0diaGNsYndC?=
 =?utf-8?B?YUN6Y2FzMXlCejNHN3pNT1FSQTdqd2xuNVloaUJ4YkZ0OEQyclJ1Zmtjd0Nr?=
 =?utf-8?B?Zmt2N01MK1NPcmJ4bTgzMUNIakxJbVROck42cm9yc3dRTXdDa3NKbDNQVm4v?=
 =?utf-8?B?ZU1ZR01hTWtXUlJzUUxHa041RVQ4ckI4Q2QwUDdBYTY2cFo3UTR1Y1lmV1ho?=
 =?utf-8?B?RHJvSWNKQ0ZoVGk1TTB1MjN4WWJBZ1ZUbWVkbjhZN2NuNGpqRUN4SklxS2or?=
 =?utf-8?B?R0Q5RmlCcmUyeEF3d0dSVjdIY2p4ZGdXVW4xTWg1Sk9TNGVVNUtCUEtBbnYv?=
 =?utf-8?B?Uk1IZmFITWJHV2FnR010UUN1YUx3VUNYR01la0RQeGJOMXpMTVFvRFNaMjFK?=
 =?utf-8?B?Z3NYYnd3VXdWUDM3clk0clNXZlFzblZ4YzUxbXZkSDVtOVdhK2FtK1VDNlZl?=
 =?utf-8?B?alJxZGV6VUtmRjBOQk5lc1pDL2JYR2NkeUdtMnAxR1l2NU91UVZibTkwNWND?=
 =?utf-8?B?a1hPVkhsMnhTQmo4bC9qcXlLMmQvdEJGSHNKS3J6cUQ0cUtoMHlVTGRqekZ6?=
 =?utf-8?B?VDlLWVhWV2ZsM2dYWkd3ZS9sT2F1ejZQOVBFMWRkODRBU1pWcE5paUZhekp2?=
 =?utf-8?B?S29iMG5hK1c5YWxMbHdJNTVWRWlYc0lPVTZIL200cFNPMzdzUVJheStWKzFK?=
 =?utf-8?B?Tk1PbVVVWWhDUVROOThLZlBSYS9kVTV3Y25SQ1RxZlIwUEN2b3dRZGhNL3pr?=
 =?utf-8?B?WlR4Z2hjYnl3dXdnMzNrSTNuUGtITGJMSXFma1RGNkpzUWoyZC8yem9yODll?=
 =?utf-8?B?Q2NLb1JqM1Y4aFJYQmhoT1JlWUJ6MnJhajRmd0wycElKdXAvVmU0UmNOREE1?=
 =?utf-8?B?MU5oVld1MHBvVEh4dW15OGxpTks5Szl3NHoyb282Um9pQm9maThML0pWV3RU?=
 =?utf-8?B?L0ZrK2tRc1FCVmQwNGx0R1FPMitKZlFMYzY0NElHSEhybzJML2w4TE16ZU1X?=
 =?utf-8?B?SkhDQ3dwL3FxMkNIWGRDbVZSSEFESjhXbzgrQnpRMDZKckV4U0NKVEVhQmFZ?=
 =?utf-8?B?LzA5NXdEM3IrTUNSWEs1Q0pXZExQRFdvcjI2MWJtQTY5UmdpakZSYStuZDV6?=
 =?utf-8?B?K1NuWUZNNlJOMzRHWGtIdDkxS083SXhZWms0QXJpc3lKVW53eS9BV0VGeE02?=
 =?utf-8?B?VXNqMlNTRmNuZy85TWtNUzNJN21BY2pBU3d2NjBUSjR2MS95dkNZYW1FTXpV?=
 =?utf-8?B?QTVZWGRzczZDOFg1THpxaFBQWjlwQkJ6RzJrSFNiM21FaWVzSlJxU1NCWWxP?=
 =?utf-8?B?YmwzRU1TcXZDRmVReXIyT2V5QUNnVUViMit3OVB6OEZBQnN1bmMxNkc3TVEx?=
 =?utf-8?B?S00wd25SMlZhcDFJcFpjWndGSmtZUWlSU0duTUJBZlhOZFUzelg2eGQ0MHJW?=
 =?utf-8?B?THQ1SmRVRTA5djFoMDdWd2hpNE5hM0RwT3RWY2dxeWI1K215ZUxzK1dDaFJ6?=
 =?utf-8?B?N2xlMnNIU0tUUmdvbkEyWHl5L09ITWlLMWg5TGJ6czNuQVBtNlF2MG5YRHRn?=
 =?utf-8?B?Uk1GSzFZUHFIY09xUTRtMFJNQTRzcFVWREZjdXNBZFlIL2RwclpPc2UxWStT?=
 =?utf-8?B?VW5KeG1vNUJGYVZwK21sbWdGMFJjczNCc01CenFXY3FXVjVJN3htaDI5aGFa?=
 =?utf-8?B?YmhJTFVaeEU5eWxBd1lBV2tzRlloS05XNnlITllxZGdnVThKOFVhRzMvWGt2?=
 =?utf-8?B?Uzhxc2tIN09OejI0MFk1MGwzT1QreHpnRGJVQ2RjTC8xM3kwaUtYNS9jdTVu?=
 =?utf-8?B?QkNMQVhHSXJJbFJFM2U1Znc4d2RVOWU4cFBqUmZmVGUwT3R3OEM3QXJpcW1y?=
 =?utf-8?B?WVg0bmFXN2g1Wi9UTE1uWFVqRTNYWFR6MVFGWWlPWEdxZENnNUNTV2Zsc3Rp?=
 =?utf-8?B?Q2FPa29HM08rZTg0WEJWdG5QK2Y3dzJaLzg2YVN5S1c0TDNMb05xSlkrQmZk?=
 =?utf-8?B?a0pJV01BelR0cUR0NlBabFFuWURUTWxYaHR2VkNVa2x2V09ydWVoL3FOdUFJ?=
 =?utf-8?B?aGVIZk5CZUZ3RVZ5cHU0UzRDdUZPcC80MTAwdENNazU5bUdaM2xlSXJJMUgx?=
 =?utf-8?B?WS8vRnYzSXpxWVJXcVd1UG1MU000UnpONHVuZWlnNk01M0FDdXo2Q2hWUWpy?=
 =?utf-8?B?Q3Q5YVJMRFgvOG9JQ2xMaC9sRndnaGoxK2MzWlpJUmFudEc5Q3NqeXUyRnJu?=
 =?utf-8?B?QWs5dVdsMjhPaHZQMUlUcXh5OXdRPT0=?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c35e8e6-0ae2-4855-b98b-08d9bb4f1d55
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5488.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 20:04:31.9853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /953G9nVQ8c1GZTllT+6tmTy3wZN/O/nSnZDFbswpC+kICtxvl2MF/8vWYpSPAj9MkNas0IJd0T4vxaOzUxNxdGZv8SodRsWJk+UW/ORVb4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3722
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
Cc: intel-gfx@lists.freedesktop.org, john.c.harrison@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/9/2021 11:57 AM, Matthew Brost wrote:
> On Thu, Dec 09, 2021 at 11:26:09AM -0800, Daniele Ceraolo Spurio wrote:
>>
>> On 12/9/2021 10:51 AM, Matthew Brost wrote:
>>> A full GT can race with the last context put resulting in the context

forgot to mention earlier but you're missing "reset" here

>>> ref count being zero but the destroyed bit not yet being set. Remove
>>> GEM_BUG_ON in scrub_guc_desc_for_outstanding_g2h that asserts the
>>> destroyed bit must be set in ref count is zero.
>>>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 2 --
>>>    1 file changed, 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> index 9b7b4f4e0d91..0f99bb83293a 100644
>>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
>>> @@ -1040,8 +1040,6 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>>>    		spin_unlock(&ce->guc_state.lock);
>>> -		GEM_BUG_ON(!do_put && !destroyed);
>>> -
>> Do we need to re-queue/flush the destroyer work to make sure it runs before
>> we reset, or is it ok for that to run in parallel?
>>
> The code in the put path will either see the reset or that it isn't
> registered and destroy the context without any interaction with the GuC.

ok.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
> Matt
>
>> Daniele
>>
>>>    		if (pending_enable || destroyed || deregister) {
>>>    			decr_outstanding_submission_g2h(guc);
>>>    			if (deregister)

