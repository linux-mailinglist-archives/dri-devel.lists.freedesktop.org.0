Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B47251C5FC
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 19:21:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D5C10E74B;
	Thu,  5 May 2022 17:21:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A070A10E74B;
 Thu,  5 May 2022 17:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651771277; x=1683307277;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xFXQDJ321mw3NcEaoRSl3p8Au2NJcX1Yc/C6yfU1CEU=;
 b=Tmj7eAIdGhRsdwIK7hqsw9c7I2TzfHZ0JDnHssz63x9b7by/Mv7uXhIn
 DfppHRU4hFMkzWiNDIQ6/6opqRRncOaYplpvJoRn8yz/E2xrtIoVLxaAM
 x/hTxPUtHiQTNj/HVouiKyCDxHgSPeC5kbMmm8AeYR3j6kwtEMjnb3LKw
 t0hIynPYZl+kwrxz3WRYNjBylIqCVUY9p02EwUCSKXas3spDzp0fm4kPb
 /Wv+8J1HUDVLYVIpN1JpMcCOwuXHzh9UTfMYkqHXTG/5kT01iYM01HCp7
 EaeKq+zGWJTfd0ASxE4DXqwLW0gdrnfG3ugyj7KOcV/nMi94WoorheLst g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268080626"
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="268080626"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 10:21:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="632531576"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga004.fm.intel.com with ESMTP; 05 May 2022 10:21:15 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 5 May 2022 10:21:15 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Thu, 5 May 2022 10:21:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Thu, 5 May 2022 10:21:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 5 May 2022 10:21:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dn9bQf1xHuoPfU0c6jvSH3tAk/RtD4Y/sB6rrg+kpVCblbBLgx7ksJc54qjnQV9/qmOxwNPiLEa0wBgcaCaVrlQy+NqLpSnaRPtUe3AP4S9P2g9p4zCZHzWasEnbNl5xszjwS/Qf82INL9XdX7oG56rsMeataJTch10ihPyfPPQVq+7OpvV6h7ILZ0OAGaO0/PEqDV9pYAXz/7gxC53EuybS1UajqR4nVzwrIUrAABfB+scbIsGuDpvG3Tz1DJHe7dLfqwhxD2UyiIfND5TY1yFONIxo7sqkI1IElrVdmx5VN/+h7VVnd9gzDbcfwJmp0XuDRBSZYg0J1YiBJCbNbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oZrSAWrHgqP16Dv8inP+SALFw07PPkk1Kz+KJy/mjMA=;
 b=i1BRIzfJErJf2YTx/cGbrCB2umZ96piLiQ5q0NfgbnDlvWnjXkIq9+IG6ujbAiXSQQaV64ADV7XaQuAxkKiXA8aRx/amrW2MlxpMJUMQzWm5rxWWlW6GH9GU4hU9hnUfq3b3SOsua6/r7GpqHegjR2IFGmzWoH44s2TJTQzJDhTlWGptbLLOASC8QCX1N7FqGrIrNnIsJXYM1qG6tzpTagii1nBYJZ2QCG4F+hZVmGtV74CdnZfQxzOY6ba2Io/WUnLGnUyDizCYNH4iLOAomdreu/68eCq2kltVAs4FAViW/ifD/0ayvYXdtdX06dgu6W2j4nND+UunAOpNWYQO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB4284.namprd11.prod.outlook.com (2603:10b6:5:205::28)
 by SJ0PR11MB4991.namprd11.prod.outlook.com (2603:10b6:a03:2df::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24; Thu, 5 May
 2022 17:21:13 +0000
Received: from DM6PR11MB4284.namprd11.prod.outlook.com
 ([fe80::c908:84e5:6a8f:7b7f]) by DM6PR11MB4284.namprd11.prod.outlook.com
 ([fe80::c908:84e5:6a8f:7b7f%5]) with mapi id 15.20.5206.027; Thu, 5 May 2022
 17:21:13 +0000
Message-ID: <8c8dea74-aa2b-44c1-e1d7-1f613c05bf32@intel.com>
Date: Thu, 5 May 2022 10:21:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc/slpc: Use non-blocking H2G for
 waitboost
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20220505054010.21879-1-vinay.belgaumkar@intel.com>
 <de063b19-e5f6-342b-d816-c112c446a68f@linux.intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <de063b19-e5f6-342b-d816-c112c446a68f@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0071.namprd05.prod.outlook.com
 (2603:10b6:a03:332::16) To DM6PR11MB4284.namprd11.prod.outlook.com
 (2603:10b6:5:205::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86bdf5f0-9e77-4325-cbc5-08da2ebba763
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4991:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR11MB49917E8CC3283934C8B0B0C285C29@SJ0PR11MB4991.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ERUWYdGW5al4h2JoaUkhYQJxBxmINWVbeTACINYNPpa2/yjeEEkSvTxGFPX1V6OqhGrt9OV1ogLeYwVeFea3fXM2Km+dAXYEM4pSNIy847buMJbc2AAChO0EP82Rg7gGcBq9LsSlXTXMI74wxCqhDHgEkXJB18qZW5Vwczr+ehQswaBkez6qaLjEAh0Wo42vkZWfpzIxiQk7BHor8RNlwblMaBNHmxUcXrAVck5DNUVS5TXMs9R+opL/yyKPa0eYDCdO0fkG8qCgBx6jkyS2cIHHCptRZdzX+mKiXAUeDvdUU7di2LM0z5mtOhqmcyJ9DLVyXt44Hu7mpRrIpYSiLy3nIrRf17GnN2C7CfKYx+R3XYUNGNfV7tp6vqc1Ernd3WdAfbLNNVHkrY+K841lQyDjZvH/BD0NicmH6lpdp8nLCSXtAMd0uwvfywbc2/1uGT2xvPx2mjNlpe4uMFYWnI1GEbtjvAOEfev1uvR3XAI4FUknpafQFSCdNotO49rWHUCV8xs92oFAPDAMN/IsgTLPbTYMLnOhI0c1CC1MQtcaMLibaZg4dLTz+bXJnCz5egYbSjl25nkJxkM6jtjboHjBHQ1Mgl8wFxWBwhBfXdTh4t8JtbbeslIX8kpQbY6BwgYXBSQXnHQZOI6TfF3rDLsjaLienseoq5aCcHOVB7Nhmzrh97h631UqFvCitCs7AAYK75xPVYZXoyZWKcC7wCOt9Edip3s+yCPNJQkjVgI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4284.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(31696002)(6512007)(26005)(82960400001)(2616005)(66556008)(66476007)(31686004)(66946007)(8676002)(186003)(316002)(6506007)(5660300002)(8936002)(38100700002)(86362001)(53546011)(36756003)(83380400001)(2906002)(508600001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3Z3R2R5Y0h3bnlpT2NBMlU4NG9Da3B3WjBFZW9BbmFhSkNEL2kvODI2cVZH?=
 =?utf-8?B?UU1ZM1VJWUlPVE80bWlUaEY5b0JkOFozdHZudmM1bHgyUXpINzlQUmJDaWwz?=
 =?utf-8?B?RFR3aS8yT1JGRjJ0SDV5SmtkVGpLd0k1WDFWQlFycUxEelNoSzNVdHdxeVl2?=
 =?utf-8?B?cURyRHZCSlM1cjhxN0JZVHJUN095Nm1MY21HZnQzQm1XVlpDbUY5V1RWcGFh?=
 =?utf-8?B?NWE3eGJSOXJrbFhaL0pRcGlUT0lNSU44ZXY2OHVUcXBaM09MMHBVb1lITk1R?=
 =?utf-8?B?RjNUc1ZrVitkTkNNejZ2cXJSVjkwd25OVnVZZDhvelFJYXVLNFZSb3R6YitX?=
 =?utf-8?B?Tnp5YmFnT0NEVlBxblh3NElVbGl2dHVZMUp1NHo1Mi9SQUJjSloxd0ltWUxS?=
 =?utf-8?B?QWltTkxDZDVCdXlDcW1QblE0V1RlUmlobnZFOGtUdmczakNzaWdVdkNSVmZx?=
 =?utf-8?B?Yks5WjIzL0VGTDdiWFhWRHpjQ3lSa0pBY2xqTWFxSVVZYVBKREphNHRsL0NN?=
 =?utf-8?B?clRUemdPSmFVSXBiUUx6NHBTTjVPY0VHU0Jwb0Z2RkNYZVpxd1NDNWN1WFdl?=
 =?utf-8?B?dUsxb2ZnK1ZhTGhuS0o1WHJrdHRkbVhWSGVPWHVJaDNZZVFnVWx0NmdmNkUy?=
 =?utf-8?B?aCtUQUkxaHFic3U2d0c3Y3hDQTJ0cUI5WjdiNy9hcVBtWUN4cEpSR2l1VEZH?=
 =?utf-8?B?bkNOVEpxT0ttMklMb1FyT0pWVFY3QnU5WDRsYWl0ZThxLzRjNGhoaUtUUnU2?=
 =?utf-8?B?Z0VNQjlRQlF6bGp3anduaElMWDZFdWg4QVZzQ3JTMDMrN21QbkdTb2NYRVRz?=
 =?utf-8?B?dHNCM3N6bWwyM1NoTVpsay9Td0NpK1hjWW9jQ2xSWW0xQVNVV1BIWms3NFph?=
 =?utf-8?B?WXo4MVJ2MTd6SnJURElhQ1NWa0J4N21mcDZTRUZxcklIbjFtTDRWRU91UFN3?=
 =?utf-8?B?T0hNV0NoQW9zam00enpoSlhZZmRlaUN3ZVJVWTBuRUo2RDFwUnkwY1FBa0k5?=
 =?utf-8?B?OXlLYzN2VS92MzhyREIyN1Vuc0JDZXljZTJnQ0ZFWEZsU2dhQXhjWnQ2c3pT?=
 =?utf-8?B?SlA5SjYydWxuSk1XcHBUUGRsTnR2Y2tGdjFWL3ZaVWZyT0xFcjdob3oyQ21r?=
 =?utf-8?B?U2dVVnZuVlBkbDNNb2dUSyt0MUx4WWVhYXgvWk1IdUk5TXo0aHBsanZwQ1Vr?=
 =?utf-8?B?MGFkVFpoTk1DaXk0QU9YZWptRHNrUFZ4NmNPVG5xenVpOFdxMk4vMlQza3Er?=
 =?utf-8?B?ODF0RTNacXZ1UlZCaXpLUmhNVmlEN09KSXF5OU82R3FzN3lKV2pENVdUQ280?=
 =?utf-8?B?OE5TcmkrL2JDWnkxYjg0c01JZjZpVDZaK1pncWU1M3pueTVFRFVGTGpnSjVU?=
 =?utf-8?B?RVpWaitDMUJiKzQwaHoyak5aNGhWRmRpSzQzVjd4RVUyT3VqZVRSQWhGK0tk?=
 =?utf-8?B?UWlvNHl0SVd1cE4vNjl4RllNMW43dXU3Y0VhSCsvaHg1dkFuY3NnN2NZdXdP?=
 =?utf-8?B?WkxiM1A4ZHZ4bnVRWjUxRTZ0cVc4OUtLRlIrR01GSUVyMUJtL1RLTTFkREF0?=
 =?utf-8?B?ckJnRnQrRys0UUlsZ0ZhaVYwV0JFV1JlTzNndk5jem9mTmNXaXdGeDgwc1pU?=
 =?utf-8?B?ZXc3Qi9ydkNoYXo5S1RyMURZeERlZ0dnaFdrcTB2WFI1ZFBpTmQ5UWtJNUxl?=
 =?utf-8?B?RENwSGNqT1BmNy81aHJaYWFKMURoT2sra203d3BreHlqQWZBYUdxaDNyZFFK?=
 =?utf-8?B?NzlLLzhSRDAvV05ZeE9DUDdqRnd5K0V6OWdKMVFNWWdNZUhwK2NlRmZRVEds?=
 =?utf-8?B?eFBrbE9ROFVXdVZyam12OVFiS3V4SVB1cVUzUjFZUkFDaVVVVlFINWtjbm9O?=
 =?utf-8?B?bTV0MjhLWkY3VythRlZlOXdQbUt4QUdlczB0eHMyd2pUeU43SlQvSHRheUg2?=
 =?utf-8?B?VzB1dzZydUNjenhsV1Vla010QzQrTk85MGtZRnZKblJvakUzaU90ZW54Y1hD?=
 =?utf-8?B?YnptVGEyZEtWemNVVCtCcEVyYlpjVVo5aFlSSzJPK0xzZWdVVDJSNFB4MWF3?=
 =?utf-8?B?VnNXbllaRFpQR1l3VER1dmQ2alBBNFcvNm1wM2RUNVY1UUh3LzVBdGtKTlRs?=
 =?utf-8?B?aktNdmhVTm0rZzk2Q2k2dGxQeEdBaFpuQ0lYSWN5MWJtODMzZkxBeEtuOXpK?=
 =?utf-8?B?OW1iZHRqVGlXWkkwb3JUZkk1aWRRTFE5MmY5K0tRbElZcm1aT08rT3J3dm5H?=
 =?utf-8?B?anVZckFpL2YxZDQrSUovRk5KMnRjYU83ekNMQThkRkZBVkRtbkZSbGtvRERJ?=
 =?utf-8?B?TjdIOUowWE0xbW01RVF1Vm9qMkUyNGY0YTNESDYzNjhOSjFhM0lnZFB1UlNG?=
 =?utf-8?Q?lnkZUcpC7OG8HnIU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86bdf5f0-9e77-4325-cbc5-08da2ebba763
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4284.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2022 17:21:13.0162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kS/6tBXpXcfhVS8UxKlt79hXuzDzXs+zxYqw2hfpd24v9Hz8hRSQiQFZX/TFLee6LM0yecoPYoE1TyF2q/4jD19+QT4wrOe9iE209icmu7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4991
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/5/2022 5:13 AM, Tvrtko Ursulin wrote:
>
> On 05/05/2022 06:40, Vinay Belgaumkar wrote:
>> SLPC min/max frequency updates require H2G calls. We are seeing
>> timeouts when GuC channel is backed up and it is unable to respond
>> in a timely fashion causing warnings and affecting CI.
>
> Is it the "Unable to force min freq" error? Do you have a link to the 
> GitLab issue to add to commit message?
We don't have a specific error for this one, but have seen similar 
issues with other H2G which are blocking.
>
>> This is seen when waitboosting happens during a stress test.
>> this patch updates the waitboost path to use a non-blocking
>> H2G call instead, which returns as soon as the message is
>> successfully transmitted.
>
> AFAIU with this approach, when CT channel is congested, you instead 
> achieve silent dropping of the waitboost request, right?
We are hoping it makes it, but just not waiting for it to complete.
>
> It sounds like a potentially important feedback from the field to lose 
> so easily. How about you added drm_notice to the worker when it fails?
>
> Or simply a "one line patch" to replace i915_probe_error (!?) with 
> drm_notice and keep the blocking behavior. (I have no idea what is the 
> typical time to drain the CT buffer, and so to decide whether waiting 
> or dropping makes more sense for effectiveness of waitboosting.)
>
> Or since the congestion /should not/ happen in production, then the 
> argument is why complicate with more code, in which case going with 
> one line patch is an easy way forward?

Even if we soften the blow here, the actual timeout error occurs in the 
intel_guc_ct.c code, so we cannot hide that error anyways. Making this 
call non-blocking will achieve both things.

Thanks,

Vinay.

>
> Regards,
>
> Tvrtko
>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 38 ++++++++++++++++-----
>>   1 file changed, 30 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c 
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> index 1db833da42df..c852f73cf521 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -98,6 +98,30 @@ static u32 slpc_get_state(struct intel_guc_slpc 
>> *slpc)
>>       return data->header.global_state;
>>   }
>>   +static int guc_action_slpc_set_param_nb(struct intel_guc *guc, u8 
>> id, u32 value)
>> +{
>> +    u32 request[] = {
>> +        GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
>> +        SLPC_EVENT(SLPC_EVENT_PARAMETER_SET, 2),
>> +        id,
>> +        value,
>> +    };
>> +    int ret;
>> +
>> +    ret = intel_guc_send_nb(guc, request, ARRAY_SIZE(request), 0);
>> +
>> +    return ret > 0 ? -EPROTO : ret;
>> +}
>> +
>> +static int slpc_set_param_nb(struct intel_guc_slpc *slpc, u8 id, u32 
>> value)
>> +{
>> +    struct intel_guc *guc = slpc_to_guc(slpc);
>> +
>> +    GEM_BUG_ON(id >= SLPC_MAX_PARAM);
>> +
>> +    return guc_action_slpc_set_param_nb(guc, id, value);
>> +}
>> +
>>   static int guc_action_slpc_set_param(struct intel_guc *guc, u8 id, 
>> u32 value)
>>   {
>>       u32 request[] = {
>> @@ -208,12 +232,10 @@ static int slpc_force_min_freq(struct 
>> intel_guc_slpc *slpc, u32 freq)
>>        */
>>         with_intel_runtime_pm(&i915->runtime_pm, wakeref) {
>> -        ret = slpc_set_param(slpc,
>> -                     SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> -                     freq);
>> -        if (ret)
>> -            i915_probe_error(i915, "Unable to force min freq to %u: 
>> %d",
>> -                     freq, ret);
>> +        /* Non-blocking request will avoid stalls */
>> +        ret = slpc_set_param_nb(slpc,
>> +                    SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>> +                    freq);
>>       }
>>         return ret;
>> @@ -231,8 +253,8 @@ static void slpc_boost_work(struct work_struct 
>> *work)
>>        */
>>       mutex_lock(&slpc->lock);
>>       if (atomic_read(&slpc->num_waiters)) {
>> -        slpc_force_min_freq(slpc, slpc->boost_freq);
>> -        slpc->num_boosts++;
>> +        if (!slpc_force_min_freq(slpc, slpc->boost_freq))
>> +            slpc->num_boosts++;
>>       }
>>       mutex_unlock(&slpc->lock);
>>   }
