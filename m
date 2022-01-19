Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16536494224
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 21:56:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B4A10E1B3;
	Wed, 19 Jan 2022 20:56:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C1D710E120;
 Wed, 19 Jan 2022 20:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642625789; x=1674161789;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nKzFLlMOSmNLTMXiu2gHiD0jhpplPkee4pNVuqeV0As=;
 b=af/skXN/9RQ7Or+mEL97F7Xpdge//Gie1hthaYc0ID2iOLvmtdn7g4IF
 CS6QsYGOZOqSZuKZi9QoRe/50AVAtCS2yFcVaO5t3aPZWEM6dww97/JC4
 6AiDEolw5TR2M1kQIfEfN/KQpeLH4Cxo+Ilxrq3f4v8B3lXbS5kXlRyop
 2wShRSPWOyYkWga44u/HW1746z5f7pc8S/yq935/EkYkcAJyBeWpUTeut
 7L6Oc9jFxcup0FRm9Lq0xurK7oDaN3xyY0vCcse4fL1Ifb97zMrw63Tfl
 8jsFkIK3E1bOjdGhFp73gSQHx9fkG0WGtx2nnW30z53d7YPi5qwI0hhPA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="232553747"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="232553747"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 12:56:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="477531796"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 19 Jan 2022 12:56:28 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 19 Jan 2022 12:56:27 -0800
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Wed, 19 Jan 2022 12:56:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Wed, 19 Jan 2022 12:56:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Wed, 19 Jan 2022 12:56:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTL9KP5FBp3CN15pJBdis7HKMom6gh9PR8qIGFDVmcThQbmt/s8XEHO+6AENuGuplZcJ1jrVDBTIDqNwqEDO/8djXS8y+avxjnJ7afcANHsWvakTmWesBmSgbhV1UA9cUa6Thxv2h8iyi5vqOfIYO69v5QBZ09m9EKGYZt4FJEzj3VuC3vkxz+cFN09qtIST1MOoRa14P2WWk2s+iGY3F9QaEm3ULTNdDbS6gvaMu64zHR4Tl+yAiRrgotpgH47SeGl9xCBNeuS6A8uKj6m0pxe5xVZtQtpL0wZdpSvEXrJCi48A8BFuFQ/5Hl5HukdsoSzTH3IomOeLaA4osTJoQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+blfhCnp/tC9lzypPYYCFwnBzNfejySqxH4dn9zidpw=;
 b=cRlHCWHQ44aaHlS9xBzO500Szs9gI68xb23XoYcC5WyDnzbyZFgSjj7Eu8Zrnpj/LLWgvR5bmsmgVjrBSuRio+pBxcoWYCBeNpzj91me41K0UbQqY01zbU/owZa9plyjs2lJSngKHrTW5y7V0Mcpdy628dIYf9zKeVmFENN9H/avDb8M6gWTHWjhBJBhoUDuxUrn/baiShCMzV9dLcosYUqG9d1i+9keNMaHMLnyvZddeecpEu5HY1cYlesYCGe414bck23NRyTY9G6Rtx1Gt11TOkdzvJNKIiZhqVhP4QqgdLV6yQDZuK7Uzglbt65s3PYdNpmc7nooFmLleODD4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by BN6PR11MB3905.namprd11.prod.outlook.com (2603:10b6:405:82::36)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.11; Wed, 19 Jan
 2022 20:56:13 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::b006:30e2:f354:3ea5%5]) with mapi id 15.20.4909.008; Wed, 19 Jan 2022
 20:56:13 +0000
Message-ID: <f5096680-08fd-04a7-d979-7e3bef61287c@intel.com>
Date: Wed, 19 Jan 2022 12:56:11 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 1/3] drm/i915: Allocate intel_engine_coredump_alloc with
 ALLOW_FAIL
Content-Language: en-GB
To: Matthew Brost <matthew.brost@intel.com>
References: <20220118214357.33740-1-matthew.brost@intel.com>
 <20220118214357.33740-2-matthew.brost@intel.com>
 <22b0f8c6-fea1-f03c-d91f-253de481287f@intel.com>
 <20220119204722.GA32405@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220119204722.GA32405@jons-linux-dev-box>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MWHPR22CA0047.namprd22.prod.outlook.com
 (2603:10b6:300:69::33) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ceb4135-e464-4adc-2c3f-08d9db8e20e8
X-MS-TrafficTypeDiagnostic: BN6PR11MB3905:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BN6PR11MB39055B2EE7BA5A40FD3B5CB2BD599@BN6PR11MB3905.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pnLpNaGLSy512b0mCwby3d27n6kl7BQDF9y+8VbapV3oAMAUCRghYd0kTRir7sB9YqH7W/XRkXfqFXKA8zqCeA+z7yDieKHA2AecBW/6roJWdop4MHFK0VTyvm9WUmFyb8wFjxUaq7JXa60f2JPCTGB+BoY1MUq+lNaESmTQDKuJzvhprTTKH4PEE40NVV0FK5Kod2cbcW5mCcXZ25EgneDTZXb8GF2qBSyJuNRy76BCKCwbFVBKrKoHJUPIzaDLD+xs1akERS9V4s6QxXYSieSEBdOTUsOYc+1VmdtBK163PHMIpvI5hRNP4JzBGS0WtBwvxeKnogJ1JlxlKSmxSnzYL8dWzjj0EoApPpqwewFkdEz63f+tGcBNytVtYUIetJ105l8NhYumXpAv+UIe7uCb15IdR8jVYrMj2fsV97wX9iGmlN7X9Ck7vNW042i1nOAooAhHVzZiT2T7dzGoB/6he1NYm2pvIXE6klnQaP8rnd6Gwm5xEzYxu79AxbLf+eN+WqC+mBl4jQEA/ey0YRQ976+KFpY1zFvegoQazMgn8PPLKIhzNnZ4qa16OEblia+Nyy9Jwlg+k1OXP26AqmrCsTMBrjFplJKyy/7mEFBudKFYVixgSvb5GOQ+FQlqIfkaNxL84fZHa/dz4MqxnP3LLYg036MDRO1CojuCxHLBuIx1rRDJHl3BMxuNkZkhWRA7h5BSqQWuPzw3Q7bFJk2j2aX88tMpH/qVKaWd85w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(31696002)(86362001)(8676002)(31686004)(5660300002)(6506007)(6512007)(37006003)(66556008)(66946007)(186003)(8936002)(38100700002)(66476007)(6486002)(316002)(36756003)(6862004)(2616005)(26005)(6636002)(2906002)(4326008)(82960400001)(508600001)(53546011)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFBWZmRRV1lWYVVPd25MZ0VmU2dYVUZCY3RwWTRhMnJ0TXhMRlRvMU1HQTRH?=
 =?utf-8?B?R09lMDl0U1BlaUtWNVhTQitXZ2U2K2RRalNPVUlUYWVJZ284NVhTMEZpZytz?=
 =?utf-8?B?Zy9meE9UdURFQ2U4OGNIbGpsSldZWDFjeU92blpGamlEZForK25PSFJDc2V2?=
 =?utf-8?B?emI4YzdUck5OeHU4MHVHdFZZaWhWbGtXZEd6eThJRjJ1UGJ6dFZkSjM5NTN1?=
 =?utf-8?B?UGdSS1M5NDhqZDVoL2JjYUM5U1pGdUhhVE43Z0lwRmFZM2R3UGlKK3pmMXhp?=
 =?utf-8?B?Q05mQ0xVcm43K1VaL2VBNXNlUVRoR05wRUtBaEs3NFZIOXl0RlE4dUxST25C?=
 =?utf-8?B?WkhXajVxaVBUVk1Qc0JhQ0NCdUdRSmM5Y2VSRzlKTlhoajVnVGhmeWVjSzRh?=
 =?utf-8?B?bjQ3UFdPUDFwU2pocXZSOFJsV0pxQk9JVVo0MVRROEo5YVRzTmp3S0RWeVBq?=
 =?utf-8?B?MGdRTkpmN0txSmFMa1R2TmptcklzRVl3dDJKN0RDVllBcUFCTWRJd1FNc1l0?=
 =?utf-8?B?SkFsVnduaCtnSThUdjlTekNsQlQrOE9QdjJkQkZ2RldvMnFKNWI3R3J1ZmIv?=
 =?utf-8?B?K0VLNTZ6eHdkYzA5QXNoSis3VXM0U3pXUGhDWk0yQWNCZGh0ZVhUazRxTVFi?=
 =?utf-8?B?elFsOTNQWUY1em9SSHpRYWw5Mi8vNmoySnA5RXYvRGgyRGtDNUpMSG1EL01M?=
 =?utf-8?B?b2cxT3RtUUNUNElCdU5aZHVOSVpUTXdEeHpYL21nRVdFTEtnTmY2eXpLYlIx?=
 =?utf-8?B?cjJkdGpPS0NFdU9FMFVveVhCQ1d3NlU0VTVHc1RlMkltcVVxZFhZQWtlbC9T?=
 =?utf-8?B?YUNNUW8ra1F0RERWMnZldXFiUTdUS3A3SlZDWFJJRCtuN0krMERkdU85VlE5?=
 =?utf-8?B?a3lEbkJuVXQ0OFQzRlJ3R0RHUnlnc0pRREhXOWhNamtPcEszNEhBTEJsaXNi?=
 =?utf-8?B?NW9PQUhIdWpRN0JLVkUra3dHajBhZTNyUGpDTGErQWhOTFpnSUxjeHFXM29B?=
 =?utf-8?B?ZUdsQjJSNG1mdG8xdVI0bnpVenI2MEVTUTFCMkNEb0x5S3FjU2k2N2hPYUtC?=
 =?utf-8?B?NUY5VnZwNExac1JlTkFsS2VrcVNvRzNGUlBhU0g3d2xlR0hSNlhwWElvVEIr?=
 =?utf-8?B?aVB3ZGZXTU1SaldFNnpPU2ZkemN3UFRRbTdaWDR1NENLM01sNURhVnRWWVNL?=
 =?utf-8?B?eXlUVFJlaCt4cXBJNCtYdlJBbVV3b1JDcGlnUHVUZjlHUVIwUXIrTjdrRXZU?=
 =?utf-8?B?eUIxOFRXbmJidWhYLzd2aVpuK1hDeCtzL1NOcDFYMnJsUERFNlV2MWpsRXpV?=
 =?utf-8?B?aW5kR3B0RGNadm5qWmJrMXBhRmxJY0RZemFObDV3RHpTZGthMGc5NHdpOXZZ?=
 =?utf-8?B?NGRUZGZFdGZtZWpQcmkzRGphVTE4YTJNK0E4RjM1dGcvaDFDRnFybXRzZ0JQ?=
 =?utf-8?B?UFJWaTdpYlhSblRGRlFteHBmS1RlTFFPWEt3cERvazBOKzdFd3NBNHVxcU1F?=
 =?utf-8?B?aUM1QjFnaTRDdkhnam92d1MxOUIxa2E2c2F3cmZKMldzVmg4UE0zeGNyMjIy?=
 =?utf-8?B?WWg0TXJZQ0xMbVU5SU9sS2JUaGUvOCtNTWN0cDk1SkxwZXhTWjB2WTg1d2pO?=
 =?utf-8?B?T3pHWUIxdk5kWWpNQ0ZpL1JvVVpscEhaQmtKWEwwK25ITkNOdmNUTk5JS2JC?=
 =?utf-8?B?TVFYWlhTS0xYM1p4ZzF5TFV4ZDYzOVZXVUUzQzdEUFNrWVZINUhLYkpCbENh?=
 =?utf-8?B?TjdpMEZaQ21HWlBSUFZuWm1VTUlkVFF3TWdwNmR6TTQyd01TWFo4UjNCSVBn?=
 =?utf-8?B?OC82Y2cyY0lSTm54eG94cnVzcTN2UjduZnFNbnk3bjlRY2JKNXlJS1RNQ1d3?=
 =?utf-8?B?aWlMZWwwRG03aHlST2w1cUdUWU9XbW5LWnlvZWx4VTdtUmh4eXVHckpGeG1G?=
 =?utf-8?B?YzJoR2RaNXUrZjFvcStvUzFtcHREcFRSYjlkSU5qZzV3OWt5TEJ0dzhZaFla?=
 =?utf-8?B?U3dPWGUzc1pDNFNyM3BjU3dseW4wdCtuRm01ak1WVktmaSsvTVV3SHY0Z3Nr?=
 =?utf-8?B?Q09tR0w2bWlIdHYwV3drWWR6djhCeWJRd1h2WVBwbXM0cFZPOUNZMkwxS0FP?=
 =?utf-8?B?dGo1VlRKSkJJcUh1a1FTMktEemluTWE0dVI1UHovaHVkbStCemZ3UUdoM25Q?=
 =?utf-8?B?VmxPOGNVQWtWUkhQMU5WN2F3WGhzUklOTWxtR2R3aEd0cE15ZndhbENqYWVq?=
 =?utf-8?Q?Xwe+e2U9QGNkwizhikqBar0XpTIzi/0xClI3FARS7c=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ceb4135-e464-4adc-2c3f-08d9db8e20e8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 20:56:13.4655 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8qrRgZN1iI+mOg+CX/n7DI93Ok6Mxe1mSNLnQS8mIem5DlwavYcR/AuzyLTFg4aHeaW6MuRGsd26DYJf1e5wuzjerKax5jCL+4X6gvyyFGQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3905
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
Cc: thomas.hellstrom@linux.intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/2022 12:47, Matthew Brost wrote:
> On Tue, Jan 18, 2022 at 05:29:54PM -0800, John Harrison wrote:
>> On 1/18/2022 13:43, Matthew Brost wrote:
>>> Allocate intel_engine_coredump_alloc with ALLOW_FAIL rather than
>>> GFP_KERNEL do fully decouple the error capture from fence signalling.
>> s/do/to/
>>
> Yep.
>
>>> Fixes: 8b91cdd4f8649 ("drm/i915: Use __GFP_KSWAPD_RECLAIM in the capture code")
>> Does this really count as a bug fix over that patch? Isn't it more of a
>> changing in policy now that we do DRM fence signalling and that other
>> changes related to error capture behaviour have been implemented.
>>
> That patch was supposed to allow signalling annotations to be added,
> without this change I think these annotations would be broken. So I
> think the Fixes is correct.
>   
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/i915_gpu_error.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
>>> index 67f3515f07e7a..aee42eae4729f 100644
>>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>>> @@ -1516,7 +1516,7 @@ capture_engine(struct intel_engine_cs *engine,
>>>    	struct i915_request *rq = NULL;
>>>    	unsigned long flags;
>>> -	ee = intel_engine_coredump_alloc(engine, GFP_KERNEL);
>>> +	ee = intel_engine_coredump_alloc(engine, ALLOW_FAIL);
>> This still makes me nervous that we will fail to allocate engine captures in
>> stress test scenarios, which are exactly the kind of situations where we
>> need valid error captures.
>>
> Me too, but this whole file has been changed to the ALLOW_FAIL. Thomas
> and Daniel seem to think this is correct. For what it's worth this
> allocation is less than a page, so it should be pretty safe to do with
> ALLOW_FAIL.
>
>> There is also still a GFP_KERNEL in __i915_error_grow(). Doesn't that need
>> updating as well?
>>
> Probably just should be deleted. If look it tries with ALLOW_FAIL first,
> then falls back to GFP_KERNEL. I didn't want to make that update in this
> series yet but that is something to keep an eye on.
>
> Matt
>   
Okay. Makes sense. With the description typo fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

>> John.
>>
>>>    	if (!ee)
>>>    		return NULL;

