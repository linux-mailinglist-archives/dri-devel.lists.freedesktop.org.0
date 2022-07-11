Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F085701DB
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 14:17:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B411121EA;
	Mon, 11 Jul 2022 12:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8037A1121EA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 12:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657541865; x=1689077865;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PdVwqzslCIPKut3wulWtFRMHLmB5kcHuu9EJv8GQq4w=;
 b=AOvdyqBcK5M5cxcx5vsLWlM6cIyhxoOWnQ6FHbDR8IAgIfld1owBpPjf
 ZeF+twSeCQS1kGZOEMGlorapdGh09I1LG7yPJt/MOP97gNh3XwtR0ityq
 PdZmLUDknkyAuMevlFavGnf4YiBULnqOy5bN8rUezBKQO12OW8n7r/Kr5
 QPN8duJsCF7hRTCmoZYY7yCtOgLPHTkFhGC3/XoG9MHIjNdYF1wqT4ha1
 DWwO9rXHZPYAru2mXrU6137rWtCMyrNJC4IpgLzyI9MTLjMP4rfp84HkK
 YGoANIGA6k5G2OSgKQehZ2xiJrIzFYhfaqxKOXCkQDovQzCXrqqNVHyA3 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10404"; a="282195694"
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="282195694"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 05:17:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,262,1650956400"; d="scan'208";a="684361657"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Jul 2022 05:17:44 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 05:17:43 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 05:17:43 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Jul 2022 05:17:41 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Jul 2022 05:17:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AcYea5hOu+OdgfVOs/v9TUBz1HwaXyXT4Dcplh+J9lALYvzXk0cqIUTuKKSH6tBms7WN3LfIeB4H+Zfk8wKi0C/qBSY5Voq3y2NcKnp8KoF2NIBtb7E27DDhzgPMJ+kzlyZFnuBvn7mY1oyxsJRazrCEMiCaFbtVgX57+FHy+PC7UG/mfIrf4eT8FtJpyT+f051hQ86gUChXz04e5/Ci0MbSGrZhRB1SuE7gK0rKRMLg1MLlCIwYfNbpjJBslvasB+mtxtSqUi8YhoO483gTTVQ3jMolK2+krgdVjAMRCCWwoKdXozipMMkBCNCTdM8/bfH15REqD0DGz/Jx9grc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c3EijBxZJKXV88+nCMJorEHyrk8C7mMZER2jXIVeoD0=;
 b=YAdWznK5phJNMCMB1ap2ddWZKaf3Zlwl3ysiZF82nKhtzmG8vR25a+8mATLrzbPeO8P5Ic4waVhOZqb4GWm0V7l3Fuo8gfFnNrQOESPj1iskzAcWIK6HBLzYTyPoMyiJUjulFnK6BSQeGQFPkE40VAnkuB4Mt4uMmPn3CFLlwNLHQWom1j7DcQC80c+QZrJnJJm/EUrB7tzylr8b0oZGPO0C1QEDG1FgBcocecs6e25lT6w5zQd6xYbk/iJLTvEoHEfiKKMxz25w68wgVKfsf1O4xN02vIDOe/S9ATLhifThyBxoMKAIKYd4lZki5AMJYmRY+8ifdi4FWDbNrcIMPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by BN6PR11MB1763.namprd11.prod.outlook.com (2603:10b6:404:103::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 12:17:36 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::d84a:6462:d08d:d35a]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::d84a:6462:d08d:d35a%4]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 12:17:36 +0000
Message-ID: <fe4cfc97-ca20-b28d-8369-5cd404f27e19@intel.com>
Date: Mon, 11 Jul 2022 14:17:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/5] dma-buf: return only unsignaled fences in
 dma_fence_unwrap_for_each v3
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
References: <20220506141009.18047-1-christian.koenig@amd.com>
 <20220506141009.18047-3-christian.koenig@amd.com>
 <f67d23e2-3953-7717-9c41-65075929525c@intel.com>
 <4c9598f0-4ba7-c18e-2ccd-f508769a72e9@amd.com>
From: Karolina Drobnik <karolina.drobnik@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <4c9598f0-4ba7-c18e-2ccd-f508769a72e9@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 719d3e9e-75f0-4d52-a03d-08da63375730
X-MS-TrafficTypeDiagnostic: BN6PR11MB1763:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cuhKvoyCuKOS8b5z0LCL3VaWwvvfCshpIbYzQyOGBFJ3UUjgCtKlDNJPnOpAynuEP+HBVVzIFb5CHcUp+42kPFPuz+ajwYc+wXkQq7QE/f2ubFbKWc2lOlRMwUX/sV1mYBQ6NEJePE0dUzs7GKrx5OHu5debrtcL1mZkbaEKk5AZeFOpSRfLBoJbUbz3JVgBT9N7tvLMlEri+IMs/AX3vI9cnb5LYATbpBpwBRuOX7Y17g5trLkzunjOzkK1+B8rshouKzBb7fbbecq4pjeP6AyVz2QFYbG3XBPtz/LjQFIpZ86400CKepMbipErmTRLEgBW3yVek//TzcQ5FH2AtkB0auvIs8mX3QIxLBQZHZu+T0btOjZT2c+TI3QYYgaCr218bhvKJE13e1+LM5Pij+jRIpPGX5El1ZQ6V7ZCryPkj+QVi/yneha6PtwdXkOiKzxOOxAlzMQNrpCVSPjfyDVLNE5e2x5Ga4UVtPFi3c9jnDcHkmAWiqUGstxxT52HCdslQLpaT2u+5hw48KFWbjDHHTsnpAYe4/beOeq7KsX5Fu9+2PS2vm7j6/giVt0gXp2wmo5c/jXiABJdeoWLFqgze98T7lFwjLLcoawFfB3MHB4NoYcS3VwKqapqE7FBAwvnkBNn1T5WNHL3gZie8gWyI64ftNOR1dQE4wR8x5dV6Kf5vMTs4TSFNi3bqoXhawfSftcLQLP876Y3n74w8slevMwD81pStzBGwvfRp5cZYyYEWc8ywkz1nfc4SewZdquhWBWsQtPyhrOFGMOfORH1HYP0s6Pn6g5TbWUHyj8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(346002)(366004)(39860400002)(376002)(396003)(136003)(8676002)(316002)(36756003)(44832011)(110136005)(66946007)(4326008)(83380400001)(5660300002)(8936002)(41300700001)(6486002)(66556008)(966005)(66476007)(31686004)(478600001)(2906002)(53546011)(6506007)(36916002)(66574015)(26005)(186003)(86362001)(31696002)(82960400001)(38100700002)(6512007)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejVDc2t0Qk02SStiVWJreGdER21XcHpFdDVZMkNBWG8zcm01enVEV1huN1JM?=
 =?utf-8?B?NmtHUFpMNlVYSUtINWpPTDNyT3BwYlVtY3BaQUg5SFBJOU43bDRtZW1Xd3I5?=
 =?utf-8?B?dTBINmQ4dVdvQVBSL2FxdE5HcG1rOTA1bTZKZUkwUCtkQy96UWo3THl1OU9R?=
 =?utf-8?B?Mm5LSTJKbWpQbzdWelV4bE96YlpGMERVZFRrL1dBTXVkZHlXM0xRNWdSZ1l1?=
 =?utf-8?B?R1lBZlBRbEhjYXJqSFh2VlZ5S0RtdDlCL0dFRHU3K1NHZmd4Sjl5YmVibGtB?=
 =?utf-8?B?dFJ0cTg0bnpkdU9YdjVCaXY5L1FZVHhGYjJDRHlvZzVESzlnRTNKcEJRaHhM?=
 =?utf-8?B?Z2gwWkRWUWNwMGo3RG55RFp1TEo4MTlZQWdHa1Mxall5dTFWYzBha0dhSGgr?=
 =?utf-8?B?UzhvclRKWkltcGVqR2J0a2hUaTJiY1JLMVJRN0NyWjlGaWdwYTBaZ054TzVn?=
 =?utf-8?B?anZ3MVdvcUxDK0NsaHhiOW1nTDBVdW9yQXFMSHd3QzQyM2VnOE1TT0hKd1dt?=
 =?utf-8?B?NGdZTWtCYmRUMG9UaXRFdEs2TzlCMU1lQSsxWlY3Y2ZESGc2VFo1NmRwK1RH?=
 =?utf-8?B?WDRqNWpBbGpVRE02U2ZhNVNPTzZvbUR3UnJrdklnZ3ZGQWJZVlJpWHZNT3hK?=
 =?utf-8?B?RC9NTWpFdjdtL3dVcEh0Umpud3M1N01RaW15MmNacWpYbkxSN2wzSkw5NnlC?=
 =?utf-8?B?RnlPaWxweGtpelZvNklrcEVSN1BtN1NpcGhaTEc3akszbVdhOWhseTRVaEUr?=
 =?utf-8?B?VXhwbEUrb01KZGx6OTNwRG5wWmVDME1QOGdhZUZZeUhZNXNGN01rSWVBOFpF?=
 =?utf-8?B?ZmN3bnlqbURlOE43R0ttS1lwT2IxbnJGMnRja2c5UFJmWU5sMXVZVFhWNkUv?=
 =?utf-8?B?Y1NGWThmWDRwYk9qai9DZ2h4UmZMWmFNcnY0YmVrY0poTEIwd3RsREgxZmhs?=
 =?utf-8?B?MHhsZGdFS1IydWpKckEza2RrSm9IcWpqNXcwdUZuZHR2OW5VR2lQZE1XRWhZ?=
 =?utf-8?B?ZHRIZU05eWpRWGIyMTlQd1dWN0dJQWJoYXNkT3RZU1JPVUs0UnExTFd1S2Va?=
 =?utf-8?B?dHFYbXZRWE45S2lwUE0rVU9lbUlmZ0k1MUdXbzZnN1Q2VU41WmFyTTZwdHAx?=
 =?utf-8?B?dlg3alpRYjhlZFdja3RGdlYzWnJRblpCa0F6SkY2ZzNDSEhwa0ZaZTN0aEw5?=
 =?utf-8?B?ZGFkdDlqNnVzRmVTSFdqNVhiSzl0YlgyWUlzVEFaaGJUS2p6TjJaQ1NHc01w?=
 =?utf-8?B?cDU5bWhuQXA3eEFsR2w4Q1RPRWNnMGpWOFBmSWhyekRULzZTaisvY1JjZDVN?=
 =?utf-8?B?Nm9BQXFYeFYxRHNtT3BVUHEzejcwejQ0WlRmdlo3Nm9Na2FqMTFVb2VDeVNU?=
 =?utf-8?B?a0tiTDNyN2g4Y2RxN0JZaE1jMmhadFJXL3dTWlNKeWYrRGtzOHNzZFNBZ0pi?=
 =?utf-8?B?eCtPTk5Gb3Zqc0VwaUZGT3NucG82TUxndGxlWFB1MEpwSmx4ckZIRWpscEpD?=
 =?utf-8?B?bGJYa24yb01nMmwzTVEyK01OY09xMjV6bnRoUmd5NGUwR0Z3S1QrdnhTOVRh?=
 =?utf-8?B?a3hzUzhhS2ZkcjdVUjdzQU5tWlR3Nk1TSkVlRlBaNXRoRWZKK1hNN2YzcVQv?=
 =?utf-8?B?dlNvdmx6R25wOFBWM1dISVNiMHB1K3JaTVBZY3kwU2ZQNWUyZUtRemxGS3RV?=
 =?utf-8?B?NWN1dXBIQVlrK3BZNXV1YWU4QWxBVmREK1IySi9DYkFKcjlLZEN1TDkxSFJR?=
 =?utf-8?B?NldrZ3RhTi9Ob3JlOSszOGozUjU0M3lxSEhSUWUrU3VxTFFuWHEvbGtXODNJ?=
 =?utf-8?B?MG4vT21MNjF1QVVKUloxWCtXQlFkZlFwUHF3bFBzYnZQUTJMOG16Ym5tUklL?=
 =?utf-8?B?NTVzcCtLNTcvRjgyenZOdUg5MXBHTXErNWZ1cWVLblJta1FJQlZNVS82aWs3?=
 =?utf-8?B?WWNyVDBVMzl4K2RxMU1hZmxockVtVHA1UERXbDU2TlZaYzNCNExFTjcxcUJ1?=
 =?utf-8?B?MEo0ZURYMGsxcU43Z1FPSUVCaGI5MVRwdlYyNXVnZGZUMjZmaC9FNVhkdzh2?=
 =?utf-8?B?Y1hGang5MCsvRDVoT3RqK21WNCtsd0NaVnJZTTZNaERSOVNubjR0ZGpYWGY0?=
 =?utf-8?B?L3pNYjU1d3YwU0dlSlhqektpcXBlUWJCZGFUMUlqV292NWNSK1lSSEM1T2ZQ?=
 =?utf-8?B?Q1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 719d3e9e-75f0-4d52-a03d-08da63375730
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2022 12:17:36.6158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4bE1ratVHenA7GEDGr1Or10eipEZQslWXRq5vaXJgK2nsIqE+4SK998k2p+ayyXDDmH5trKYikdn5r+znrctSz/xQ92wbKNccCTyp24nTdc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB1763
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 11.07.2022 11:57, Christian König wrote:
> Hi Karolina,
> 
> Am 11.07.22 um 11:44 schrieb Karolina Drobnik:
>> Hi Christian,
>>
>> I'm sorry for digging this one out so late.
>>
>> On 06.05.2022 16:10, Christian König wrote:
>>> dma_fence_chain containers cleanup signaled fences automatically, so
>>> filter those out from arrays as well.
>>>
>>> v2: fix missing walk over the array
>>> v3: massively simplify the patch and actually update the description.
>>>
>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>   include/linux/dma-fence-unwrap.h | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/linux/dma-fence-unwrap.h 
>>> b/include/linux/dma-fence-unwrap.h
>>> index e7c219da4ed7..a4d342fef8e0 100644
>>> --- a/include/linux/dma-fence-unwrap.h
>>> +++ b/include/linux/dma-fence-unwrap.h
>>> @@ -43,9 +43,13 @@ struct dma_fence *dma_fence_unwrap_next(struct 
>>> dma_fence_unwrap *cursor);
>>>    * Unwrap dma_fence_chain and dma_fence_array containers and deep 
>>> dive into all
>>>    * potential fences in them. If @head is just a normal fence only 
>>> that one is
>>>    * returned.
>>> + *
>>> + * Note that signalled fences are opportunistically filtered out, which
>>> + * means the iteration is potentially over no fence at all.
>>>    */
>>>   #define dma_fence_unwrap_for_each(fence, cursor, head)            \
>>>       for (fence = dma_fence_unwrap_first(head, cursor); fence;    \
>>> -         fence = dma_fence_unwrap_next(cursor))
>>> +         fence = dma_fence_unwrap_next(cursor))            \
>>> +        if (!dma_fence_is_signaled(fence))
>>>     #endif
>>
>> It looks like this particular patch affects merging Sync Fences, which 
>> is reflected by failing IGT test (igt@sw_sync)[1]. The failing 
>> subtests are:
>>   - sync_merge - merging different fences on the same timeline, neither
>>          single nor merged fences are signaled
>>
>>   - sync_merge_same - merging the fence with itself on the same
>>          timeline, the fence didn't signal at all
>>
>>   - sync_multi_timeline_wait - merging different fences on different
>>          timelines; the subtest checks if counting fences of
>>          various states works. Currently, it can only see 2
>>          active fences, 0 signaling (should be 2 active,
>>          1 signaling)
>>
>> Reverting this commit on the top of drm-tip fixes the issue, but I'm 
>> not sure if it wouldn't impact other places in the code. Please let me 
>> know if I can be of any help.
> 
> 
> Thanks for letting me know. Not sure what's going on here, but I can 
> take a look today if time permits.

The reproduction with IGTs should be quite easy. You'll need to 
clone/download the IGT code and follow instructions for Building[1] the 
project (make sure you have meson and ninja installed):

   https://gitlab.freedesktop.org/drm/igt-gpu-tools

Once you have it up and running, go to <igt path>/build/tests, and run 
the subtests:

   ./sw_sync --run sync_merge
   ./sw_sync --run sync_merge_same
   ./sw_sync --run sync_multi_timeline_wait

You can run all the subtests with ./sw_sync, but I think these are the 
most relevant to you.

Many thanks,
Karolina

------------------
[1] - https://gitlab.freedesktop.org/drm/igt-gpu-tools#building

> Do you have a description how to easy reproduce this? E.g. how to run 
> just those specific igts?
> 
> Thanks,
> Christian.
> 
>>
>> All the best,
>> Karolina
>>
