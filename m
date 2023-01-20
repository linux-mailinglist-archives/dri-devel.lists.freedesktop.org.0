Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F680675BAD
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 18:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7837D10E094;
	Fri, 20 Jan 2023 17:37:08 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2B0F10E094;
 Fri, 20 Jan 2023 17:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674236226; x=1705772226;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0iq+aHlTB1bmbIB/hb6WIIWZpLlOvIswDXMRiVLWuis=;
 b=PvHHfjWctJl7QRNuvZlz+hcdlKeOYgVHmUggluKXTMiFAlfdyb4hcyEe
 aRbUuVpHLGU82IgH1gneNAseRy/TIqjKlMupyTiiU2LVcpkMVWYd5ahF4
 hEy3uYVDZIbO95Kgxo9QDEZFp2JflBOlNOPkuYWSIJ3SILXgL5TdSKk9/
 vG7+RsxFqkbegi1NHpsPAk0DZzinFKD9F//Bw7bxOBrqgFa3yjk0wecrx
 W4Gon9mQ95xJk75FfCIuOHqTlVj51LZGvISLxEfWxU0WsfjFVKQ29geOF
 j3hGKLS7xwFjYE6z16hrLbKdOVXU9+5F4uqPT0lk2sIZ27taVJBc38QG5 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="352892751"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="352892751"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 09:37:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="803133802"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; d="scan'208";a="803133802"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2023 09:37:05 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 20 Jan 2023 09:37:05 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 20 Jan 2023 09:37:05 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 20 Jan 2023 09:37:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WI86fLZllNbr7DmJ473/VtSHe9MFZWDRaUxFlCjAFoGdPczhifUBp9kSrBTlRQnx/Rt/HHRZudQnDpqx8w1Lk3Glqu7n1v8MWSa675v1mshJJnV61AgonBDhJ3MPiqBz8kGHH+TVsVhjc6Iwk42uHfOrSITqtYZ5JQkywmrCvo5Ss6pI/h9+SLUeL8UnVknRthNAcESHL+MkIo+6mGkA59eujuugn7JdC+A151Zs993PYv1VfNNBO6NOtqQrah97cEYOOEkbiw1Yd6oZaDLat5zJQ5cHuRv1Kx2BxyvMFSqcoQNJH0JZdlX2gM9uO6uqd4ha1bSpSfcHjBlSUTdKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkiKLIzwkplcZFvcJrmuY8JgKBv/mOzYfbkhzS3Rcg0=;
 b=gqOznaoFB3LyU5EpCHpV62KwjU7RbrABrkvOXYMBDNyTr3D7Aa5yiwaxeVX9iFkHp1PNOZI+6U1IVZbOn3EDFSxvp9vbGwYX2boXe/r7Z7DtoOXUaMQsqz/w0pr7PrUwynU1v3M7PyLXsOQFeSqsZiJiSe4Nut6x+kMqAS3U6J2jGeja/Vu1h0N8CFa1nwJEI6AwN2e9vP0/G9Tm1TwBqJbkQlJobDCLa3nitTuzJw9QMoIRx/N65hCNKdr61w+1wp8k0A3xao1Tw5RfTjMlOVPJbzDtitOCApRzqbL0lzV8IThmvS1jV+fAnDkKG8I7Y2uaFN2cXOg2MBnCBklh5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 17:37:01 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::81f2:9a76:638:28eb%2]) with mapi id 15.20.6002.024; Fri, 20 Jan 2023
 17:37:01 +0000
Message-ID: <232c6a45-86a4-fd2a-3246-1ae9fea41987@intel.com>
Date: Fri, 20 Jan 2023 09:36:58 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v3 3/6] drm/i915: Allow error capture without
 a request
Content-Language: en-GB
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 <Intel-GFX@Lists.FreeDesktop.Org>
References: <20230119065000.1661857-1-John.C.Harrison@Intel.com>
 <20230119065000.1661857-4-John.C.Harrison@Intel.com>
 <8580bd3b-e65f-73e6-dc55-edd99bfaa6f9@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <8580bd3b-e65f-73e6-dc55-edd99bfaa6f9@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0080.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::25) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|DS0PR11MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 63403ace-fc09-4e97-f8f1-08dafb0cf041
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dtJBKQEOhVEytK3/SOwgnYWydZEQbjY698t7pnY1NDnNQLDx/K8GcLiUyYzG7drBiMSp7oBChrYeWHsds39bP9Jq11ytUoCH7Ls1ii86uz7kUBWRTV4TeC8CPRz27HqJB1xU1MWBpgVLWN6iC01XWRpc7LelzQC1x+gT9l07fJMKJPITBMntFtjh5otIjQWyyUi6dPyvHzwTBI3Rjt6hgHte0+pq5ebkSIGlxkGcXNsHn3Ac7XxbujXXbuwwR7YtmKrVhU61X2/HSoRCJaM6HyZ6a6nDnG6AQH6ggns+GfYq0mqHzHsWXEf9WsYjyyiUREMe/gy08uBF47ltMVj2p+nGpxehljlg6E1Ewn9mfDz7eJp1NudAEbexkftT+9W+qdYQ8R4U2v7W2DjbTQziyzbw8vz71WcbQN4pE6vspLWYg+yI5+ImaNXT7t/msRxs+FRKZ02jVf+f7vwjtNBK8y1JJEXZrk/Bdif8xMXoq9IuH+0e+L254qwpWPdtzmmMnd8NgKvKeEBvaq0jZazTD9KgISJjnVSYxcl+ek5d1u86T3/tceZm2K0v8nX1DzwDs3QyxDmzLmrEgRlI+8AIIKuNzPfJ40tLOsYRKs3/4vr4XZtDWesCiw0KrXFIeKIz1KCT2l6LOHPDecpIxhflRW6cpo9ksXJmtjg2qSa3ZRQDm16EwHzqym/vclbUDmMpwslqTOcXpFfnCBk8gqC40xGjt6Jhot9mXprsTVfFl5s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(366004)(346002)(39860400002)(376002)(451199015)(31686004)(6666004)(6512007)(38100700002)(26005)(478600001)(82960400001)(186003)(31696002)(6506007)(86362001)(6486002)(53546011)(41300700001)(2906002)(83380400001)(8936002)(316002)(2616005)(5660300002)(66476007)(66946007)(66556008)(8676002)(450100002)(36756003)(4326008)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHNQRGhwUXQwNktHb2JxZzJLbi91allvUnFteVFBMkRjYS9hTkZPcVpWTFRs?=
 =?utf-8?B?dVN1NU1YNDdvU3QyMmVKYTc1MlVMcmJMOVlENHFpdkt3WnoraWhKeG5VSzJz?=
 =?utf-8?B?SmpPNHpjMHFjRVBDd3JDa2d0c0JJTDhSUGc0ekhoZ1RhdDlBUlRBclFsL2xP?=
 =?utf-8?B?OURHclpOZWpGdHYvaFpDTFlYVTNQSy9FczNHekFLQ0phQkRyb1lIbDBkY1Fq?=
 =?utf-8?B?bTNqM3FqWmdDTUpqc05RblhkdEsvSjVnMG5qUm4xcnRkTkh4SFdVcjcrWGtZ?=
 =?utf-8?B?cmZjbUJNWEUzdmlxNUl3d0Z1K28vNVRIZ0I4V0pHMldORW9nVnpWWldDSzVW?=
 =?utf-8?B?NTFML2xIcHRtQ2w0V2FHWUMyR3NsbjlvandNekkvQkk5UGYrdUNkZkxhYzBs?=
 =?utf-8?B?RzlFVWU4Ym9KSjd1Vk9BQnJ2WEEyeFRFVmhjaDg2b3IvWjk3eS9wY215NUJP?=
 =?utf-8?B?ZGdUVUVJazE1R3JYR2VRQndVQUlVemFraU5kR0luSDlXQ3MwR3MvSHZKMkJZ?=
 =?utf-8?B?MEdpSExPQk9zREI5eE00Wk9sSlVDU0t0Yjd4dmN4TDZsNG9oL0JidVpkK25I?=
 =?utf-8?B?aFZKUTNiTWtOckJVUmU2UWlQS2lGOE05dnhwNDc5YjhjRE5laXBLL2oxNWVz?=
 =?utf-8?B?VGFmSWo1QStHbXVyMFYrODYvdy9KWUl3eVk5VDNET1NZd1pkc2ZqRFN2UUNH?=
 =?utf-8?B?UklrNUVxdGRublA1b3NPRElGVkNFc0pZVDFpV0JGSnc4cmhDUFUvRkFJRUZC?=
 =?utf-8?B?QTZmKzVFb1NiZG1HTTJUdFR6UnZYVHl4T1Rsdks1T0gyeEtQa1lCaDhkbWJN?=
 =?utf-8?B?WkFaQW5UOXNQYlNvOFpqSEdxcXJ4SXFXRDNMVmhYMlNqdVVjTkFjOWpLazls?=
 =?utf-8?B?TFJSb2RvVWtaRUEyZzQzTk1sc29VOFVtUWdyUlJKc2l6aUcvUmdaemdhUzFB?=
 =?utf-8?B?cVY3UnBianQ2aTc1d09VSzErbFFmWFhSNjZQMUdrUkJieHBnTmY4cWNTRXI2?=
 =?utf-8?B?U25VSC9aZytIMFBzZXhGRXozNmhCdlpDTS9qbFJoamdkakd6ZGNPSktJclFI?=
 =?utf-8?B?Njk1UStvZzZLbnRCaVFwS2tmOGZHZSs0dCtJQmVEdG9ON0tYMDMzOFlhOEs5?=
 =?utf-8?B?U2EwZGIrVHZJYnNHNk9ScnRXOWttWElKV3RLSVpMQURpMTE2L1JGakl4MDJ4?=
 =?utf-8?B?Y1Jxd2RnM0JEeDZUcDRRTnByc0hHTHNPeng4RzBWYlFSZUNRV0RDS1FMR1Iv?=
 =?utf-8?B?bjA3eG9Cb2d1YWs1Y1NVV3JlVGdtMVplblRDNVhrSVg2cnhhbFRzTDBLRmxF?=
 =?utf-8?B?ZXVJaUtYZXc2VUV3Y3JnS1lRUE5jcmkwSmhTNnBxV3V3ZVg4emxhQlNkK1Nw?=
 =?utf-8?B?QXZlWUZJYUp5L05SNmoyQkduZ0lZbmFSYmRnejlCTmM4dkVaSm5kczNVK3Vl?=
 =?utf-8?B?YXdwV2p4aDRzU3Jsd2pWVXdZbkg4Y25IczlOVkpTbElpc01CZE8rdzNMaXRB?=
 =?utf-8?B?OHpycFJ5NXQ4RDlIZmFVNjIzTUdIYWlIREx1c0dUcDVFNG9zQmtwV0FJRHht?=
 =?utf-8?B?aUF1ei9VNThUaG1XcTlKOXJvU3dTbTFMbE5lcXpFTkJTNmdJT1Vvc2NUUkgr?=
 =?utf-8?B?dTZnRmxjMjRRREVTNkRXb1RhL1ZiVk4zeFh5MElOWUhJbm1DKzNveXRETjBx?=
 =?utf-8?B?UmZ1ZG5VVjUyQlQ5WXo4Unh0clIxbnBjc2xCK0duT3Y4cExGVlJpSjl3dTZM?=
 =?utf-8?B?dk1iTmxkdUNyWWp2WWxJYzVXd1JPOGYzQkplcjA5V1Q1MXNvbjNLSk9saVZp?=
 =?utf-8?B?QlYvaFE4QTlLQnpVTFFJZURWb3JpK29QZGp1U3l6QWs1eGlGZ21DSnEwbWxl?=
 =?utf-8?B?bEYxbGRwVGlGblNhb2psWko5MmtiUkE1UGRDaGkvNVlxVk5yY1FIdU1kU2tX?=
 =?utf-8?B?Y21DZmtGZS9NODBFa0NSaWtGMFk5VUxDclh3U3FqTWpkNmlESkg0a1VTWklV?=
 =?utf-8?B?MXBiSnoxZXd0dkdwUlJlbmZKWUpCejlzSmJWdnpyVU5UUnFlMjNva3VseUtQ?=
 =?utf-8?B?eDJ5emNyNnUvbTcxM0FKekhQMTRnRFF0K3dwNXhUZkpoZHA0eHJSRVptNW9Z?=
 =?utf-8?B?NGNhQlIxUjZFZWFxTksxeFR4QUZETkdQZzdxVWN1Z2MyTkR5a0VTUDVJRVRS?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 63403ace-fc09-4e97-f8f1-08dafb0cf041
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 17:37:01.7099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GTHhQ6L61WDo7JdXnEKHi1CrinIxcxqMG4kV4uKhUcYu2Q/6IRYsWYYkwHXxonFEMzIOoeUkesLzM0fHUy6NWQhptGidjBo4h4TOlK7n3zU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 1/19/2023 17:54, Ceraolo Spurio, Daniele wrote:
> On 1/18/2023 10:49 PM, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> There was a report of error captures occurring without any hung
>> context being indicated despite the capture being initiated by a 'hung
>> context notification' from GuC. The problem was not reproducible.
>> However, it is possible to happen if the context in question has no
>> active requests. For example, if the hang was in the context switch
>> itself then the breadcrumb write would have occurred and the KMD would
>> see an idle context.
>>
>> In the interests of attempting to provide as much information as
>> possible about a hang, it seems wise to include the engine info
>> regardless of whether a request was found or not. As opposed to just
>> prentending there was no hang at all.
>>
>> So update the error capture code to always record engine information
>> if a context is given. Which means updating record_context() to take a
>> context instead of a request (which it only ever used to find the
>> context anyway). And split the request agnostic parts of
>> intel_engine_coredump_add_request() out into a seaprate function.
>>
>> v2: Remove a duplicate 'if' statement (Umesh) and fix a put of a null
>> pointer.
>> v3: Tidy up request locking code flow (Tvrtko)
>>
>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/gpu/drm/i915/i915_gpu_error.c | 70 ++++++++++++++++++---------
>>   1 file changed, 48 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c 
>> b/drivers/gpu/drm/i915/i915_gpu_error.c
>> index 78cf95e4dd230..743614fff5472 100644
>> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
>> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
>> @@ -1370,14 +1370,14 @@ static void engine_record_execlists(struct 
>> intel_engine_coredump *ee)
>>   }
>>     static bool record_context(struct i915_gem_context_coredump *e,
>> -               const struct i915_request *rq)
>> +               struct intel_context *ce)
>>   {
>>       struct i915_gem_context *ctx;
>>       struct task_struct *task;
>>       bool simulated;
>>         rcu_read_lock();
>> -    ctx = rcu_dereference(rq->context->gem_context);
>> +    ctx = rcu_dereference(ce->gem_context);
>>       if (ctx && !kref_get_unless_zero(&ctx->ref))
>>           ctx = NULL;
>>       rcu_read_unlock();
>> @@ -1396,8 +1396,8 @@ static bool record_context(struct 
>> i915_gem_context_coredump *e,
>>       e->guilty = atomic_read(&ctx->guilty_count);
>>       e->active = atomic_read(&ctx->active_count);
>>   -    e->total_runtime = 
>> intel_context_get_total_runtime_ns(rq->context);
>> -    e->avg_runtime = intel_context_get_avg_runtime_ns(rq->context);
>> +    e->total_runtime = intel_context_get_total_runtime_ns(ce);
>> +    e->avg_runtime = intel_context_get_avg_runtime_ns(ce);
>>         simulated = i915_gem_context_no_error_capture(ctx);
>>   @@ -1532,15 +1532,37 @@ intel_engine_coredump_alloc(struct 
>> intel_engine_cs *engine, gfp_t gfp, u32 dump_
>>       return ee;
>>   }
>>   +static struct intel_engine_capture_vma *
>> +engine_coredump_add_context(struct intel_engine_coredump *ee,
>> +                struct intel_context *ce,
>> +                gfp_t gfp)
>> +{
>> +    struct intel_engine_capture_vma *vma = NULL;
>> +
>> +    ee->simulated |= record_context(&ee->context, ce);
>> +    if (ee->simulated)
>> +        return NULL;
>> +
>> +    /*
>> +     * We need to copy these to an anonymous buffer
>> +     * as the simplest method to avoid being overwritten
>> +     * by userspace.
>> +     */
>> +    vma = capture_vma(vma, ce->ring->vma, "ring", gfp);
>> +    vma = capture_vma(vma, ce->state, "HW context", gfp);
>> +
>> +    return vma;
>> +}
>> +
>>   struct intel_engine_capture_vma *
>>   intel_engine_coredump_add_request(struct intel_engine_coredump *ee,
>>                     struct i915_request *rq,
>>                     gfp_t gfp)
>>   {
>> -    struct intel_engine_capture_vma *vma = NULL;
>> +    struct intel_engine_capture_vma *vma;
>>   -    ee->simulated |= record_context(&ee->context, rq);
>> -    if (ee->simulated)
>> +    vma = engine_coredump_add_context(ee, rq->context, gfp);
>> +    if (!vma)
>>           return NULL;
>>         /*
>> @@ -1550,8 +1572,6 @@ intel_engine_coredump_add_request(struct 
>> intel_engine_coredump *ee,
>>        */
>>       vma = capture_vma_snapshot(vma, rq->batch_res, gfp, "batch");
>>       vma = capture_user(vma, rq, gfp);
>> -    vma = capture_vma(vma, rq->ring->vma, "ring", gfp);
>> -    vma = capture_vma(vma, rq->context->state, "HW context", gfp);
>>         ee->rq_head = rq->head;
>>       ee->rq_post = rq->postfix;
>> @@ -1604,25 +1624,31 @@ capture_engine(struct intel_engine_cs *engine,
>>           return NULL;
>>         intel_get_hung_entity(engine, &ce, &rq);
>> -    if (!rq || !i915_request_started(rq))
>> -        goto no_request_capture;
>> +    if (rq && !i915_request_started(rq)) {
>> +        drm_info(&engine->gt->i915->drm, "Got hung context on %s 
>> with no active request!\n",
>> +             engine->name);
>
> Shouldn't this print be inside the "else if" case below? otherwise if 
> we don't have a rq at all we won't see it.
The intention was that the message is specifically for the case where a 
request exists but is being ignored. It is obvious when looking at the 
capture if no request was found - there just isn't one in there. But 
there is no way to distinguish that case from the situation where a 
request was found but just was not considered 'active'. Hence wanting to 
add a dmesg log instead.

Could pull the better message in from the next patch to this one to make 
it more clear - "Got hung context on %s with active request %lld:%lld 
[0x%04X] not yet started".

>
>> +        i915_request_put(rq);
>> +        rq = NULL;
>> +    }
>> +
>> +    if (rq) {
>> +        capture = intel_engine_coredump_add_request(ee, rq, 
>> ATOMIC_MAYFAIL);
>> +        i915_request_put(rq);
>> +    } else if (ce) {
>> +        capture = engine_coredump_add_context(ee, ce, ATOMIC_MAYFAIL);
>> +    }
>>   -    capture = intel_engine_coredump_add_request(ee, rq, 
>> ATOMIC_MAYFAIL);
>> -    if (!capture)
>> -        goto no_request_capture;
>>       if (dump_flags & CORE_DUMP_FLAG_IS_GUC_CAPTURE)
>>           intel_guc_capture_get_matching_node(engine->gt, ee, ce);
>
> Are you keeping this outside the "if (capture)" below to make sure we 
> consume the GuC engine capture even if we fail to produce the error 
> state? if so, a comment might be useful.
Yeah, hadn't really noticed that the original version was effectively 
leaking the GuC capture in the case of a failure. The buffer would 
overflow and discard the oldest entries eventually. But it seems better 
to deliberately free the buffer if the related capture is done whether 
the capture worked or not.

Can add a comment to the patch description about it.

John.

>
> Daniele
>
>>   -    intel_engine_coredump_add_vma(ee, capture, compress);
>> -    i915_request_put(rq);
>> +    if (capture) {
>> +        intel_engine_coredump_add_vma(ee, capture, compress);
>> +    } else {
>> +        kfree(ee);
>> +        ee = NULL;
>> +    }
>>         return ee;
>> -
>> -no_request_capture:
>> -    if (rq)
>> -        i915_request_put(rq);
>> -    kfree(ee);
>> -    return NULL;
>>   }
>>     static void
>

