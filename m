Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EC9794346
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 20:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A90410E1F1;
	Wed,  6 Sep 2023 18:49:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A715910E1F1;
 Wed,  6 Sep 2023 18:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694026185; x=1725562185;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qb9ftyAVApQ9NCHEOp/NFZ02R/r2UsZ0MAJy/LzFFGY=;
 b=JmVI9JGliBsVMpv/GkojpwZm+VEyfgA06jFhqnwhZ0c2naZ5dh6XQz5q
 Y6Kt5XOrHhPyHhJrB02eJNY/6AM2DzVRYYsi2pxp3tbu1N/oobVcO33Te
 Tf3dj46y198sj9hbk+Uw+oY+DJsYktYHWELtd8N+4/7dVlH0CaPW55ryK
 hjf2LoMHwVjm5vTw5UBEV/IqStuPTWNUf5YcYV9UjvwIj/NtNwAx2jJzj
 qCfGKNtYtdo1vPEf1IR16qIbui+QtKMOY4eGZDLjV/6STEDwYPnZHP4Ff
 jWnMleR81/p0mZ9pDCBdhWQXt3i/3q/Bl+X7YkFRng0xss72x0Ul/cK3k w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="357465160"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="357465160"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2023 11:49:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="988390144"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; d="scan'208";a="988390144"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2023 11:49:44 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 6 Sep 2023 11:49:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 6 Sep 2023 11:49:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 6 Sep 2023 11:49:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 6 Sep 2023 11:49:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OX9cxe63oUJwRVhdq7sEUfCORcuSKFqt3fbuqGZw+gNITYvXtfaPGEUquiwoC295OZA6wlLv7Aawq8+P5MPTJqSo8/Fy6Asa04Xf/yg9IOH2+XKI7+o9TBRAitirST+9iwJRaUjOMeRDDb5tk3NiYsXb3cM42TD22E9PIxJ2pD7/p5iFLvXvRwRH67p4wlhsb1gmt2wqNrLVqYLslNVKiSwS509NOT0pYjROt8cSbGp8jhn2BPcPK8g6pKIPr874NTwUxyEcHgT2Q8QiUGnb1UgUABaWRBwSrtBY9PNqprP0x/RWn+T8bFJZvqEPp11B2Uou0PgjO1JZkoUO+hwg9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nKB4CpAc/xnJZTmIszagXd4jGYkYBSXkSyEWSW/j9pI=;
 b=n92zGjbbRWg6fbrpDB4peeWJ2intxtuZ5uHIoI6JmJlRcGzsbOwTH6hRLtRHqZj2juGCpk3sHhVg0QtyiO270Vmju7Th5GataxGFzWwLCRRGPqSO2ajD8WzKlnmUdM1Vttp9mLN/IFWiG4TKesgOLdNsPSbY+iwFi3HelF/7NcHOy8p7qFk2s4dY+VA3BUpwjXEi0jX5/pO8uzh/lRCHH+PAFIAClpAmROWcrPefSHNVhWMNOc3eMol0pgGv+H5kanQXziWf2EO6zuYwBSL0h0entIi2VpbnWN3f4Qvd6sReMTrxsDpgIU4w559IjtS3MzaQRBV5AUxUXBthOUqusA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SJ0PR11MB5814.namprd11.prod.outlook.com (2603:10b6:a03:423::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 18:49:39 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6745.034; Wed, 6 Sep 2023
 18:49:39 +0000
Message-ID: <690d0159-4d50-033c-825c-f15d21e0cb06@intel.com>
Date: Wed, 6 Sep 2023 11:49:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [PATCH v5] drm/i915: Avoid circular locking dependency when flush
 delayed work on gt reset
Content-Language: en-GB
To: Andi Shyti <andi.shyti@linux.intel.com>
References: <20230811182011.546026-1-zhanjun.dong@intel.com>
 <3a745c83-e7cf-6a24-5556-8c0c019adfec@intel.com>
 <ZOYtNyqfvqJPeqq2@phenom.ffwll.local>
 <e31b1f49-88cd-d6e4-abbe-51f27712ff83@intel.com>
 <ZPCc4CU+S6Gv6GzQ@ashyti-mobl2.lan>
 <983eb186-5b6a-8df3-1e67-eb7da6a8dbcd@intel.com>
 <ZPhDqTusn9FYY8qV@ashyti-mobl2.lan>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZPhDqTusn9FYY8qV@ashyti-mobl2.lan>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0257.namprd03.prod.outlook.com
 (2603:10b6:303:b4::22) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SJ0PR11MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: d9b005c2-bd96-42ed-88ac-08dbaf0a0653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d4ffZxgXGFAwRClARuLebNkP0Fv0wqr5gzyeKEdPkSIThEmTjGwUexDu3E9Vi30F8OO8NAqlPjWc09v28/g82siQeppGaDk/3Yo4XrbeC/0Y9PoyH1NpDEgXL4aiTCzf3oCLtlJYSuRQuuYUPEc3IJTTTcU2YVF/B33xFQ+H+kHuS+LA6myhqNuDQNWJEoKz6VToHXo6q4DmYYZm+cB0H0YRP5RoAgU0gNaHGHVpkTp9ZPducpKNfVWAxMhYTeMCyLip36mbKY/zdSZ5rfThZRPP4YEHT56+gX870CZ0JbzKtmpXSjRXSsDn3BfUxXcN6x4kZloVRuZ6OeLpyNQ05P+uT1nJshUQ9nGVexCrSaEIwGjTdySScDyitiFpgeQGOn0Rt+UzTUjENVDu097EZcj5li4tVgeJ5R892O5yMU/1Ad/gjrcbj5oZo0Qa47mV64m5TK/zExhKBi8cAv/sHRZiz/7GA4630EyyPLVXHjRKUUQ398Trf5h1zE2mgj3L0XIT4YEj+kH2vYjxdNqkEgeF+yEjUSMKsOqBAax/3m61NBkS+/7JalPWOJGROTtmjlrCXq1EoPLlCh194VQ1TFY8Zw6RlVdj6tsLnIVXVAs+jvKakNHSRzakMuiTbbEMH1Ta4IBTrTNJb6Zfho75rQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199024)(186009)(1800799009)(31696002)(86362001)(5660300002)(4326008)(8676002)(8936002)(2906002)(36756003)(31686004)(82960400001)(38100700002)(478600001)(6512007)(6486002)(2616005)(966005)(53546011)(54906003)(316002)(83380400001)(26005)(66556008)(66946007)(6916009)(66476007)(6506007)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1FuWHlKWGZsMkhNNHhaMC9RaE5QcGlUWW53VXZGWmhaQUljTE5oUzNHMFVo?=
 =?utf-8?B?MUtUZVNqU2hxNVRzWUlNc3B1WmZDUUlGRjFFTEdOK290Q2JaekZORW9pYmRC?=
 =?utf-8?B?MXZXZk82M2lvMk1MelBhc241bTlxbVBJdjlObEdVbllQc005TExkOVpFV2Zj?=
 =?utf-8?B?alBVUGJvaFN2UVpVWEdNUFZib1JPUmtKb0trYlJzaE8wZjRoamM0d3dOWHo3?=
 =?utf-8?B?dEt4azVobGxhMjNuRHNEWXhSYVRlMW1rMWkzL3Q0eTZTTjlINUZXSlRrbWFt?=
 =?utf-8?B?dEJ6K2FHY0hBcTYwWk12OXBxT0tmRTZWcFZiYlJQU0JEZjk0ejRuNExXT3Fu?=
 =?utf-8?B?Z1p4NGJDNmJCcFdsOWs1ZmkyVDZtWG1HMG5SdklHYjc4N2dCenRaRDNUTnNh?=
 =?utf-8?B?aUpKVWdTOXRjSHhBNVhVZG1saFJSRUJkOWk0dVQ2Z0JRNDMvSGpNVjZMWWs1?=
 =?utf-8?B?QWplNWFhSGczYjZ2ODRIRW42bU9XZDFZRFNlREtMcS9xeUk4bXhvMGpaQVpy?=
 =?utf-8?B?UFdhNTBQQ1JNd1NTblh0bVo0N0ZIcjNoNzlLMzB3WFd4QXR1ZWFYMEE4K2ov?=
 =?utf-8?B?QjFHWXdSTG9WdFRvYVFhbGY1M3l5RFpxYlBqWUQ1MWQxRDd3VEl5MzEyWTVS?=
 =?utf-8?B?dDFNTEtwNDQ2bmlxcUFOdnZ3YXFOWG5zVTJ2QU5Ka2hMV1cwTmN1OEFPUmpx?=
 =?utf-8?B?UWtUL1lDZ0NFUWRObkRqTU8vRW51WUUyK1NkTys0Ynd4RGJLSmNQYUozckRJ?=
 =?utf-8?B?MnlidGpGVndkYk1mbVlrazVURGErc3hOOHJqV3R6MHZvajFJamgrVE5DclBW?=
 =?utf-8?B?SngxRVdvNHFtckZwejUzRXZOeGZkbVNwUVh1VndoZ0hRR3RyYi8xNldycUV1?=
 =?utf-8?B?ZnRpWEhLMGFrc2l2SDJORDBESGh3U3JUaFk3Tk4yZG5wTzVlN1ozQ1pBbXlR?=
 =?utf-8?B?MGZoRS9KMXhIY0ZQaCtIS3ZmYTNrZnY3SWErSjRVckF3RmNKUlM4SHVSMGJ3?=
 =?utf-8?B?a2VpNDM1dlJpTmlyZENIVjVBMUltVmNiVkNyTVRtRkJPanRzeXkrSGw3RXAx?=
 =?utf-8?B?RnlFTjBOQXBaVEtUR0xqWlpuNUpRekdwbEhpdCtQZStVTXhnSWFRaCtZanFI?=
 =?utf-8?B?aFJkaXg3bWZDVVdWL0JrZng5cnhTcXZKSFdCZTh6dFNvNXordVBkTXJiQ1lO?=
 =?utf-8?B?TzdmWWdEQmovTzdkVGRhNEZQdzVCeVd4U3V2aFJVTlZYYWNLS1JTWEtCc3dL?=
 =?utf-8?B?SUNtZkZCUlhjZUpFQkFja2ZMbnh2cWk0OXd5QUlsY28zWUxpMkF2ZjNwVER5?=
 =?utf-8?B?U2k1d2NXVndoUzhvb1JvUGVzNWZEc1FCL3hwQXVOeFNvMHdhODVGRHhLNkxF?=
 =?utf-8?B?STV2aHRFTHJ2dUcycG55RDQ1L2krdUg3YkthdkU3bGlHMDVsbElaeFordHRL?=
 =?utf-8?B?WW02ZU9UczFXZlU4emZFZjVPU2p4STZMUjA5bjM5WEZkUE9DN0FpNnhnZGxi?=
 =?utf-8?B?Q1FXZlZ6a0lJZkdvem4wZlZsY2RGclhhakx5MDJFYVRPTnVETUxvMHFYb1FO?=
 =?utf-8?B?ZnFuN2xkZUFIVHNRZWNpYWZUUldOQndSSS9UdVFzMXEyNG0yTTdKQXhBQ3hr?=
 =?utf-8?B?azNHZnVLTFJUcEpMQjh6OHNpU2dtZm1lckYyQ1hKak9CWEdjblc5V094YWdO?=
 =?utf-8?B?R1daRnZhNmxpZENxUWxZTkFsL1VpdkFQcXI1Q1BqdGJKRzRtUE5RU1k2MDRW?=
 =?utf-8?B?bnJZWGhEVC9XblRjeGRjaU8ycStMT2pjUnlLQlp6SVVSSERDOVJnVFZuMVM5?=
 =?utf-8?B?VytTRHRCczNhNnpDSWRWTDhudmlTcmRNV3Frdmpka0tDQVlRRE1oVmxtZDd3?=
 =?utf-8?B?LytXTW9GRHZYOXlsWXA2bHRjK0lBUXRSRFNNSjdaZ3U3NmR4UXhpN0IyNUhw?=
 =?utf-8?B?QU0wbWs2Z3RabHRhemVzRU45eWo4clVwTnJ3cFhZQ2tKbk9qZWlPbUJVSXVR?=
 =?utf-8?B?dmhjK1RZSi9MdEFIYzFtbmphRXZMWGpzZ2hrYWVZRXZ4bzRWYjNjc0JrcDNG?=
 =?utf-8?B?dlJFbktPejFzd0RJblowYk9QYWlRRmZrMktEUmpXenpDeFlRVEpzTDdick92?=
 =?utf-8?B?cHV2ZERtbGNsUlVMWklBMWZ5Und1M2V2d3RCeEZTK2N3VVJHeDZmNVJTQkls?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b005c2-bd96-42ed-88ac-08dbaf0a0653
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 18:49:39.5012 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLZQe/b67Ev0ykBtzAbnHtEzkEAdn5LMYMxmCjE0LAgXjyJ+6usweljgyJ6GzMoWd5qg4sDSBXJaBvn3OgNjerV4iN9V6wCRE/2+t6Znuso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5814
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
Cc: Zhanjun Dong <zhanjun.dong@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/6/2023 02:17, Andi Shyti wrote:
> Hi John,
>
>>>>>>>      static void guc_cancel_busyness_worker(struct intel_guc *guc)
>>>>>>>      {
>>>>>>> -	cancel_delayed_work_sync(&guc->timestamp.work);
>>>>>>> +	/*
>>>>>>> +	 * When intel_gt_reset was called, task will hold a lock.
>>>>>>> +	 * To cacel delayed work here, the _sync version will also acquire a lock, which might
>>>>>>> +	 * trigger the possible cirular locking dependency warning.
>>>>>>> +	 * Check the reset_in_progress flag, call async verion if reset is in progress.
>>>>>>> +	 */
>>>>>> This needs to explain in much more detail what is going on and why it is not
>>>>>> a problem. E.g.:
>>>>>>
>>>>>>       The busyness worker needs to be cancelled. In general that means
>>>>>>       using the synchronous cancel version to ensure that an in-progress
>>>>>>       worker will not keep executing beyond whatever is happening that
>>>>>>       needs the cancel. E.g. suspend, driver unload, etc. However, in the
>>>>>>       case of a reset, the synchronous version is not required and can
>>>>>>       trigger a false deadlock detection warning.
>>>>>>
>>>>>>       The business worker takes the reset mutex to protect against resets
>>>>>>       interfering with it. However, it does a trylock and bails out if the
>>>>>>       reset lock is already acquired. Thus there is no actual deadlock or
>>>>>>       other concern with the worker running concurrently with a reset. So
>>>>>>       an asynchronous cancel is safe in the case of a reset rather than a
>>>>>>       driver unload or suspend type operation. On the other hand, if the
>>>>>>       cancel_sync version is used when a reset is in progress then the
>>>>>>       mutex deadlock detection sees the mutex being acquired through
>>>>>>       multiple paths and complains.
>>>>>>
>>>>>>       So just don't bother. That keeps the detection code happy and is
>>>>>>       safe because of the trylock code described above.
>>>>> So why do we even need to cancel anything if it doesn't do anything while
>>>>> the reset is in progress?
>>>> It still needs to be cancelled. The worker only aborts if it is actively
>>>> executing concurrently with the reset. It might not start to execute until
>>>> after the reset has completed. And there is presumably a reason why the
>>>> cancel is being called, a reason not necessarily related to resets at all.
>>>> Leaving the worker to run arbitrarily after the driver is expecting it to be
>>>> stopped will lead to much worse things than a fake lockdep splat, e.g. a use
>>>> after free pointer deref.
>>> I was actually thinking why not leave things as they are and just
>>> disable lockdep from CI. This doesn't look like a relevant report
>>> to me.
>>>
>>> Andi
>> Disable lockdep? The whole of lockdep? We absolutely do not want to disable
>> an extremely important deadlock testing infrastructure in our test
>> framework. That would be defeating the whole point of CI.
>>
>> Potentially we could annotate this one particular scenario to suppress this
>> one particular error.  But it seems simpler and safer to just update the
>> code to not hit that scenario in the first place.
> yes... lockdep is a debug tool and might provide false reports...
> We need to have a great willingness to start fixing and hunting
> debug lockdep's false positives (like this one, for instance).
That is how lockdep works. It's like a compiler warning. You have to fix 
them even if you think they don't matter. Because otherwise, when 
someone tries to turn warnings on, they drown in a sea of other people's 
unrelated garbage that they did not bother to fix. If lockdep is to be 
of any use at all then it must be run regularly as part of a CI type 
system and any issues it finds must be fixed up by the developer's that 
own the relevant code. Where fixing means either fixing genuine bugs, 
re-working the code to not hit a false positive or annotating the code 
to explain to lockdep why it is a safe operation.

>
> It's even more annoying to reduce our CI pass rates, especially
> when in BAT tests, with such false deadlocks.
Maybe. But it is even more annoying when you have a genuine locking 
issue that you don't notice because you have disabled lockdep and just 
have some random hang issue that is impossible to reproduce or debug.

>
> It's the developer's responsibility to test its code with
> debug_lockdep and fix all the potential deadlocks and ignore the
> false ones.
You seem to have this backwards. Developers are not expected to run 
every possible test on every possible platform in every possible 
configuration. That is the job of CI.

John.

> I sent a patch for this[*] already.
>
> Andi
>
> [*] https://gitlab.freedesktop.org/gfx-ci/i915-infra/-/merge_requests/128

