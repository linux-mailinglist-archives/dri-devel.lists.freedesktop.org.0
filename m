Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC25959F643
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 11:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8425B10E431;
	Wed, 24 Aug 2022 09:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2A4A10E431;
 Wed, 24 Aug 2022 09:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661333503; x=1692869503;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vRo+OvM+3qGqVjyEmkuoxBE8kd8tr3CMW7//TOTHE+o=;
 b=BcMgq9kpmN0NWeVgHWASBWrSOVQ5rCc4FvAhtECya1lyIVw3jnw4i5nl
 P6jdqiz4KgWftYrWiMSOfFu9FktPtiLlStaaDH8n5JPqKFD/BQ7pcexim
 Dn+IED7fN8+FopclldELfn+GiG23B3MMAgo2ztt0XRTG1A5CtWqztqEzi
 8enuZPO++g3Ns7yRn5iw1Tpt6ks7+fayfjTneA1Qig7iQ5eC3bmNgdEet
 mii+8Pme8fLqZvRBDrzOtfVgkqXmujGO6mojuc8hOKulsY+7XZ50uYczu
 SWMxQcFTWmRr0KDzAwlYjEcpp4xgazArpQF2jgaLD6y0eBd1lN0kgjhXf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="273670657"
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="273670657"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2022 02:31:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,260,1654585200"; d="scan'208";a="560529014"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 24 Aug 2022 02:31:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 24 Aug 2022 02:31:41 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 24 Aug 2022 02:31:41 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 24 Aug 2022 02:31:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L05M3IslBLpXLa+BxNIyJzSUh/8m5pV0+KvFXugu2mgnWcMhka3g0woP4gzs0yp8uPNunHw9ZR/gl+cTJmMo0ugG9+NxGQEeO9LuBT1gwbsV1WXr/hYFHmLICdRLCZCqBQsTBWiMTtEA/A3kIK5iRbKeSHmOZCTKIXOdCYzix72s8zzhySl5AWDdhtUhwJ735DDiY4/hu+HVi5TR8LC/RUuCDC3quPDIrCZp1JpBJpXGMu56pC5POG2OlNbHEbSEF/BXlI3OlwUqfehF2E3SPoQiOA9fvO7FJG0Wa2x4NJOtJX/YQl+V9/3wsVNi5ovvLFNZTol1aDGnsxJhaTbXCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bhI5VoG/gaDYeNPRpBBq2SbxJItlFFx/+86sLq1+ZF0=;
 b=JIs/Jok3QaJtkRPOCx8jy7SNfVxsId2XNbG8gyuZ222zV3mQjTSfkib9tkhgIiNKNWJPn8iZQeNTjsZiDmuQC2mcM2WM87JixCv8YUhxfKjr56JLALn3GRE0AdY5BXkpi7gHUUvis5sqJ7x0HFJC9qUz1zSzvY+ABez3DTrJ9ImtlBzJ3BcT8HWiaK8r9Otzm1/w19wpqY9q6px8ugJhk0KLUF7W9Z8xhaHss9q2aUUaPz742XLAWU3G8+cW3PxXlhFkWGCde8x9HowcykoV1Uf+tVhgvon/hujDZq6xYjOGYWSAGgxF+1/+TDiER4REEFLW8LfKRP9mNggPlBBZ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5409.namprd11.prod.outlook.com (2603:10b6:610:d0::7)
 by PH7PR11MB6473.namprd11.prod.outlook.com (2603:10b6:510:1f3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.21; Wed, 24 Aug
 2022 09:31:39 +0000
Received: from CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::70e4:76ca:fc65:df73]) by CH0PR11MB5409.namprd11.prod.outlook.com
 ([fe80::70e4:76ca:fc65:df73%4]) with mapi id 15.20.5566.014; Wed, 24 Aug 2022
 09:31:39 +0000
Message-ID: <89531bbc-03f3-6212-d2c8-939a0e3261ab@intel.com>
Date: Wed, 24 Aug 2022 18:31:15 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [Intel-gfx] [PATCH v8 1/8] overflow: Move and add few utility
 macros into overflow
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>, <intel-gfx@lists.freedesktop.org>
References: <20220823101729.2098841-1-gwan-gyeong.mun@intel.com>
 <20220823101729.2098841-2-gwan-gyeong.mun@intel.com>
 <44d2da7f-6632-8382-73c9-6df76b7eae0c@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <44d2da7f-6632-8382-73c9-6df76b7eae0c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0104.namprd03.prod.outlook.com
 (2603:10b6:a03:333::19) To CH0PR11MB5409.namprd11.prod.outlook.com
 (2603:10b6:610:d0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e57589f-1af5-45b5-0ae5-08da85b37241
X-MS-TrafficTypeDiagnostic: PH7PR11MB6473:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pSPzDcPmOeWTU8Qc3nuaXNKnig2c7LxgiIKqmhq/R7ewsRYO+eQG+WfyhsmSAMhte4RV++TaZIxBeZ8IcXphQ0wOx6VnSk8PgxyEdcTtBBwOGM8iUKjtzqggDKcik0AmiU8NQMOKhudKSbTMQCmYqkhkWbPzjoAhu+Fa/j3ol5FHPVmWaF+AkPh9E5n4y6NmgXENwvsFEOtcP+PcwtGbBAYaDdVvW1KZqJ7hQfFyHRibqaM2WhBUZjoVEmaUaLA+aScm5/cnfR0fTcRQ9QUkeynulZWZkPQ0IyI13SHBuf4oAGyB0JTfAuwpLa3yTP7Mb0HUD5Gm64FxtPZnQ6iL7MlLjWck62Ru316LE6SFZMWtdyHgScYY4vh2+BxG5hPC+/Z//TNFCiTGgPq8s/F1RoEPkHtM4m/r6JNWTBjPLKx2hadRX5QgB+v0DNTwdQ0N95AxiTMHat9cZpDAjwP3xuEIRmDXyE4BjK63fG04+PlYyZFlu9wpVHP5UdrWugQLDTJzlv6HZ+YrDY3Uyj8NKLzWhW+ie9GVJQynUBDzqxcqiWfQzbvMkGGeM9yR+A/zIfa61wvmPZNAfr9VFwDg/IlMgLeomf1O1r3lXGN3Tn+xJnhw0q3pJohO9Zae3jwX+dDD68P05TqOaV0Wgqcp5XaTvwqICS10w6oXMBsnYTk4X0EKyYi/a1XkTw27cRw8hBfX67H2y5B9KAIw4+heQFtroEZunHqcRgQfw5SZ+TQ2MU30fJ2qwIANF+jU3bvzaXoLHaFWK4hBuyXMYGnSwkK18gWgqrKKkN2zREqeWMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(366004)(136003)(346002)(396003)(8676002)(86362001)(83380400001)(66556008)(2906002)(31696002)(6506007)(4326008)(6486002)(66946007)(53546011)(478600001)(7416002)(66476007)(6666004)(8936002)(5660300002)(82960400001)(66574015)(41300700001)(2616005)(26005)(38100700002)(316002)(31686004)(186003)(6512007)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFJZQXg3RWlXMzRFRTdYNlh2dXdrOU5rajBmUGNseGpybEVjWkl4RVRuc1VK?=
 =?utf-8?B?dUw0Um5jK1ZESStRUmFWMzlRTUNMWGdQQ0hkN25nUzNCam96OWE0MTBTQWlO?=
 =?utf-8?B?a2dLOXJVQU5tUUpkcnNneDhiNGw0T3FNWFVESUdHdHI4cncwU0VGKy9ieks3?=
 =?utf-8?B?SVFRdHNnQWxCc1Urd2duTXFZeTJ0Mno2QXArQWh3SGVoMXN3MlM2aWc5T25K?=
 =?utf-8?B?Ulc5U0RmeVlWbnpaSmg2aldEUlpRWlRrWFhMUlI5NC9XbEZBNXR2QUJRQVpY?=
 =?utf-8?B?Vjg0SzVpcm1ySndOOFJ5YXlkSk9rc0xSaUM4RjBzMUJiWTdIbWVWNkgySHcy?=
 =?utf-8?B?YmdXUlRCRnZ3OWNPbzBhZ01FZGdSQjJDcHgzM2Y3ZE1SZWNYMnYzeTRmeTdy?=
 =?utf-8?B?cFpXRnQ0Y002OHU3YmVJaHlUZEJ5Qzd4TFNXWUxUcXgzb0RWTStLQTZoaDJF?=
 =?utf-8?B?dGpWOVdJc0dtN3NQQ29jbnV0VjI0QWwrU0pUL3lIYkNpTy90L1JLUVVZbDNo?=
 =?utf-8?B?M2RqaVRaNnA0RVdrZmtTVTZPVmNvd3hjRmFJSVFhSERlejllZ0t5d2tyMWti?=
 =?utf-8?B?T1IrWTV5dXNvM2dyRi9mK0M4UTZOT0ZVM3VFaEI4cnIrR284ejVzVXliMWVW?=
 =?utf-8?B?QnBYa3N4TGQrTWx2Nnk4cWJTMklBV242d2lGbGE5S3F2Sms1a1A2TXF6bkpU?=
 =?utf-8?B?U3diZUtxVGl5bGV1VUc3TFI1b3AweThDNnNWTzc1U2VHNkc2cVQyM295cnYx?=
 =?utf-8?B?QksrQ05qKzNiWGlnT3lZVGxjamJBRkpwbFUzaUt6V09lUG5YZXZWU1hDOFBM?=
 =?utf-8?B?cWs0MDR5bVVhLzJsQ0VZSTVmSlhLT1JDbTdFdXBoSGV5bXFQRmgxWW4xcGVU?=
 =?utf-8?B?YW11N3VUQW93WFlmNUpOaUlveUR5N0ZyTTBFczNKT3JYc1EyVjUwNGpUMDNs?=
 =?utf-8?B?VjRkTjJJSGlDSjVPbTJ6aEJ1aG9xSnd5aVJqbFRpRmZFMDVxekN5V0V6ek9N?=
 =?utf-8?B?WFpjV1BkM200RDMzL1BoMjI0Tm9YY0Z3amZxUGNkYzA4Y0hnMTJKY2F6M2Vm?=
 =?utf-8?B?S3VrYW55SEEvUTBLTG54TytPczl3dEFsSWRqTjBlZ0FXRERsWWFuWXVudm5C?=
 =?utf-8?B?QlkxZ1Qwc2ZRbFVVZTMyUnZ3RlUrU25qcThPY2QwOTNVeGxITWx6VzRta0V0?=
 =?utf-8?B?czVsUk1iQnkzblN5ak5aN1pnSDN1bTQ0YXFjcWVEZlQ2MENUQVFpMWt6NUJp?=
 =?utf-8?B?RC9iSlRIc3hVOEFXMWM0alBWZTE5aThIOGpEY1FFZHUzVmlQOHRIaHdabjU2?=
 =?utf-8?B?djNSRW5EZ2Z4V2Y5ekJKK0VJckJDM2loRS9FM3pEVjM4SkJ1K1V1aDBHMTA2?=
 =?utf-8?B?YzJuZmdqR05MUWJsSy9jNFVjTy9VYWtIc3N2Smt1U0lydDh6TkZ6aHpqTGsv?=
 =?utf-8?B?bDhFVGZablpyU0xRK3FIbmFSTTEvS0p6Vjhzdk9GSmVkajkwZytyNEY3bXFt?=
 =?utf-8?B?Q0t6WVNDMlkzeVZ2em1PZ2NtckU4NzNDUFBLVlAzQzBiM0pQYW9OSVJOd2Mz?=
 =?utf-8?B?blpOL1Q3dGFnbWs4NG5EVXcxblVXOW04ejRlR1R3Nzh2MXYxR3I4Y2lmU0hO?=
 =?utf-8?B?V2tjRUdkc2g2b0VaT0tUcHRDMnR2U3lkRkJnYkh1b1p3Nzl5bzhwMXdKRmtN?=
 =?utf-8?B?MjgxVXdYQ0NjaE5pODNaQll5UDEvdGY4Zis5Z3d6TTltT1hkbGVvaUwxM2Zu?=
 =?utf-8?B?K2ZWVE0zSWZ3QnJVb3gweTZmQk9sMUQ1UWVNT3haWTBmY0F3U3pLTWRqaWFJ?=
 =?utf-8?B?enNDTlBscVBSNFZRdGh1VkR5QVp6bnlEZlNQZGx5VHJZZ29yUmN3SUIrY1F3?=
 =?utf-8?B?cWt4MGg1TzZTZjZKaE5VWVBCdFhpSHlRQ05RVjZuR3EyNDhSV1RHak5aM0JC?=
 =?utf-8?B?RUFCNHJsbmdHSXJoMVBreDYzaEZRQlpVNHZ4cFF2Qkd4d0VsbXU3SlFSZ2NG?=
 =?utf-8?B?RUg4cHkvRWZEN0diMGppdjNnV1FGdVMrbkRDbFBzMjA3ZUo2V0FNZkdnSUV2?=
 =?utf-8?B?eUR5RDUyWnBwdmR0ckZodFZ5SEgzdkkxTkFKS0xFall1VHUwWHFyRWdhMmxv?=
 =?utf-8?B?b1JCekkrNFZMaEVQekJoM1JNdVZJdi94OFdrNkRRZnFwc2lLbFlQRHZGdnNi?=
 =?utf-8?B?NGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e57589f-1af5-45b5-0ae5-08da85b37241
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2022 09:31:39.1976 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iz39BtjPEldv5+ArYvfno8bSfMbVlmLfvOdp7jOONJgTxZS21MDJmLBXgdLGFw78mdbiWF4ABhuk8z4uEVGMo/fOL7MK7CqmMHhy6j48tII=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6473
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
Cc: thomas.hellstrom@linux.intel.com, keescook@chromium.org,
 jani.nikula@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, intel-gfx-trybot@lists.freedesktop.org,
 mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/23/22 9:35 PM, Andrzej Hajda wrote:
> On 23.08.2022 12:17, Gwan-gyeong Mun wrote:
>> It moves overflows_type utility macro into overflow header from 
>> i915_utils
>> header. The overflows_type can be used to catch the truncaion (overflow)
>> between different data types. And it adds check_assign() macro which
>> performs an assigning source value into destination ptr along with an
>> overflow check. overflow_type macro has been improved to handle the 
>> signbit
>> by gcc's built-in overflow check function. And it adds overflows_ptr()
>> helper macro for checking the overflows between a value and a pointer
>> type/value.
>>
>> v3: Add is_type_unsigned() macro (Mauro)
>>      Modify overflows_type() macro to consider signed data types (Mauro)
>>      Fix the problem that safe_conversion() macro always returns true
>> v4: Fix kernel-doc markups
>> v6: Move macro addition location so that it can be used by other than drm
>>      subsystem (Jani, Mauro, Andi)
>>      Change is_type_unsigned to is_unsigned_type to have the same name 
>> form
>>      as is_signed_type macro
>> v8: Add check_assign() and remove safe_conversion() (Kees)
>>      Fix overflows_type() to use gcc's built-in overflow function 
>> (Andrzej)
>>      Add overflows_ptr() to allow overflow checking when assigning a 
>> value
>>      into a pointer variable (G.G.)
>>
>> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Nirmoy Das <nirmoy.das@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
>> Cc: Andi Shyti <andi.shyti@linux.intel.com>
>> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
>> Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org> (v5)
>> ---
>>   drivers/gpu/drm/i915/i915_user_extensions.c |  2 +-
>>   drivers/gpu/drm/i915/i915_utils.h           |  5 +-
>>   include/linux/overflow.h                    | 67 +++++++++++++++++++++
>>   3 files changed, 69 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_user_extensions.c 
>> b/drivers/gpu/drm/i915/i915_user_extensions.c
>> index c822d0aafd2d..0fb2fecbcaae 100644
>> --- a/drivers/gpu/drm/i915/i915_user_extensions.c
>> +++ b/drivers/gpu/drm/i915/i915_user_extensions.c
>> @@ -51,7 +51,7 @@ int i915_user_extensions(struct i915_user_extension 
>> __user *ext,
>>               return err;
>>           if (get_user(next, &ext->next_extension) ||
>> -            overflows_type(next, ext))
>> +            overflows_ptr(next, ext))
>>               return -EFAULT;
>>           ext = u64_to_user_ptr(next);
>> diff --git a/drivers/gpu/drm/i915/i915_utils.h 
>> b/drivers/gpu/drm/i915/i915_utils.h
>> index c10d68cdc3ca..eb0ded23fa9c 100644
>> --- a/drivers/gpu/drm/i915/i915_utils.h
>> +++ b/drivers/gpu/drm/i915/i915_utils.h
>> @@ -32,6 +32,7 @@
>>   #include <linux/types.h>
>>   #include <linux/workqueue.h>
>>   #include <linux/sched/clock.h>
>> +#include <linux/overflow.h>
>>   #ifdef CONFIG_X86
>>   #include <asm/hypervisor.h>
>> @@ -111,10 +112,6 @@ bool i915_error_injected(void);
>>   #define range_overflows_end_t(type, start, size, max) \
>>       range_overflows_end((type)(start), (type)(size), (type)(max))
>> -/* Note we don't consider signbits :| */
>> -#define overflows_type(x, T) \
>> -    (sizeof(x) > sizeof(T) && (x) >> BITS_PER_TYPE(T))
>> -
>>   #define ptr_mask_bits(ptr, n) ({                    \
>>       unsigned long __v = (unsigned long)(ptr);            \
>>       (typeof(ptr))(__v & -BIT(n));                    \
>> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
>> index f1221d11f8e5..4016f1378bcc 100644
>> --- a/include/linux/overflow.h
>> +++ b/include/linux/overflow.h
>> @@ -52,6 +52,73 @@ static inline bool __must_check 
>> __must_check_overflow(bool overflow)
>>       return unlikely(overflow);
>>   }
>> +/**
>> + * overflows_type - helper for checking the overflows between data 
>> types or
>> + *                  values
>> + *
>> + * @x: Source value or data type for overflow check
>> + * @T: Destination value or data type for overflow check
>> + *
>> + * It compares the values or data type between the first and second 
>> argument to
>> + * check whether overflow can occur when assigning the first argument 
>> to the
>> + * variable of the second argument. Source and Destination can be 
>> singned or
>> + * unsigned data types.
>> + *
>> + * Returns:
>> + * True if overflow can occur, false otherwise.
>> + */
>> +#define overflows_type(x, T) __must_check_overflow(({    \
>> +    typeof(T) v = 0;                \
>> +    __builtin_add_overflow_p((x), v, v);        \
> 
> 
> Above works since gcc7, since gcc5 you can use:
>      __builtin_add_overflow((x), v, &v);
> 
Yes I'll update it to use __builtin_add_overflow() like where the gcc's 
overflow check built-in function was used.
> 
>> +}))
>> +
>> +/**
>> + * overflows_ptr - helper for checking the overflows between a value and
>> + *                 a pointer type/value
>> + *
>> + * @x: Source value for overflow check
>> + * @T: Destination pointer type or value for overflow check
>> + *
>> + * gcc's built-in overflow check functions don't support checking 
>> between the
>> + * pointer type and non-pointer type. Therefore it compares the 
>> values and
>> + * size of each data type between the first and second argument to 
>> check whether
>> + * truncation can occur when assigning the first argument to the 
>> variable of the
>> + * second argument. It checks internally the ptr is a pointer type.
>> + *
>> + * Returns:
>> + * True if overflow can occur, false otherwise.
>> + */
>> +#define overflows_ptr(x, T) __must_check_overflow(({    \
>> +    typecheck_pointer(T);                \
>> +    ((x) < 0) ? 1 : (sizeof(x) > sizeof(T) && (x) >> 
>> BITS_PER_TYPE(T)) ? 1 : 0; \
>> +}))
> 
> 
> Doesn't linux assume that all pointers have size of long int ?
> Or at least all pointers have the same size.
> In such case we can use:
> #define overflows_ptr(x) overflows_type(x, unsigned long)
> 
yes it looks a better way. I'll update the macro and comments.

Thanks Andrzej

G.G.
> Regards
> Andrzej
> 
>> +
>> +/**
>> + * check_assign - perform an assigning source value into destination 
>> ptr along
>> + *                with an overflow check.
>> + *
>> + * @value: Source value
>> + * @ptr: Destination pointer address, If the pointer type is not used,
>> + *       a warning message is output during build.
>> + *
>> + * It checks internally the ptr is a pointer type. And it uses gcc's 
>> built-in
>> + * overflow check function.
>> + * It does not use the check_*() wrapper functions, but directly uses 
>> gcc's
>> + * built-in overflow check function so that it can be used even when
>> + * the type of value and the type pointed to by ptr are different 
>> without build
>> + * warning messages.
>> + *
>> + * Returns:
>> + * If the value would overflow the destination, it returns true. If 
>> not return
>> + * false. When overflow does not occur, the assigning into ptr from 
>> value
>> + * succeeds. It follows the return policy as other check_*_overflow() 
>> functions
>> + * return non-zero as a failure.
>> + */
>> +#define check_assign(value, ptr) __must_check_overflow(({    \
>> +    typecheck_pointer(ptr);         \
>> +    __builtin_add_overflow(0, value, ptr);    \
>> +}))
>> +
>>   /*
>>    * For simplicity and code hygiene, the fallback code below insists on
>>    * a, b and *d having the same type (similar to the min() and max()
> 
