Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651A479A7B3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Sep 2023 13:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B683510E057;
	Mon, 11 Sep 2023 11:47:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B37C10E2D7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Sep 2023 11:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694432849; x=1725968849;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fXWprjxbui9c1+e9+UN7MCO+N6gSYEcQxEEDK4PVn7s=;
 b=X+18AKLapfpjztWWLsAE81+yJhvMZUGmyf0JSCUpTwlsyiRSOJA/iKVu
 kJXx6I4qSDvlocFEIgNy2sqBFhNMEERXiJSx2SB4poGgqpWS7caPmg+RG
 U0zblOJrnfEBjhc6d6Ldgimdd0LunO3PeDm+RpPUBi+iGdYt15AeURxiN
 cOlgoogv3tr1YWpDsVtUuapHunG24tIsZ0rGnceD6ACFR/NvDV7cIGInH
 +gGPVO9Qb+9udaB7irzivWKaIz7d15dlDMK8dJoCJ3vyw1tfA3qKMaiMn
 knGez8VUXtYvgADMctR6KPieyc6wpsHpO7JfIx22dbgzS2sH9t7cjV/xD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="444475201"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="444475201"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2023 04:47:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10829"; a="719965502"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; d="scan'208";a="719965502"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Sep 2023 04:47:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 11 Sep 2023 04:47:28 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 11 Sep 2023 04:47:28 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 11 Sep 2023 04:47:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPyKvhpskX2549eL29G7WzaDvT4dwN7PyTl9G6WtDlG1fEYNJ5l3dtJkcHvsubzyEYB6HXPmnoPVytfRw2Oirvm8YHiDN8DdcdZNXPLBIKyV9xWTQHTUe5YG/+nk0tHOK8JmCD+wnh6/55klsrhdQT3BdtAtL7tTxhByeCs3G2pWnES6DOUWNfImVX/qDXfVts7w69x13VbvJY0o4/kqfTfoTYBcIJtZlhBMqxMHWmz47i6ej9v+4YJ8f+P4o0734aoJMCqpb7LWFvS+ugk4GhKAIm5j6hTkbG51JmjvIYkL4uqGtvc+2gHe/jmDAwrOdZJAnFkh/7mYPTK5iVhA+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItW+V/ERrjfPz1IGUSKVVamcXZlZ840y5w0fXPeSvzY=;
 b=nhj28mYMSU2gHxuJdbMS2Pm7xKklxoahx66WqmqiPvTWEIqgbsXpiSVD0pCwqBH8c71v+9+h2LcU3bcjhYjfF65/rYdVMCLeAbk9i1DzZE+XpwNWwrQ5jWXmVMrqU+J/bjXvd+q7mUnlZJLhU78RwBNpj2WTfWzmqCJjosUuU1uiZfKGLN7ryjhFqpgaAIKvTn4W4zRWzRWE+fuNqdXxMfTIsxK4q0I+G6ueFq7gmsOh+OPu7U5pxAN/WKAdweu8dGS5wrUQh18Zo+ZR6ZiH5pal4eqBtJAYMheP5Rm+2BsOqcggZxd6JwLQk3oWMRw/+5Sd50adh8nvz0zssterZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by PH7PR11MB6908.namprd11.prod.outlook.com (2603:10b6:510:204::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.36; Mon, 11 Sep
 2023 11:47:26 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::59cb:e244:fe8b:184d%5]) with mapi id 15.20.6768.029; Mon, 11 Sep 2023
 11:47:26 +0000
Message-ID: <60ffa6fe-4750-c864-9012-7a047a0f1c3b@intel.com>
Date: Mon, 11 Sep 2023 13:47:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/5] drm/ttm: Update Makefile for KUnit
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
References: <cover.1694422112.git.karolina.stolarek@intel.com>
 <3782fd55e8479296daab7041430fe7b0848bf621.1694422112.git.karolina.stolarek@intel.com>
 <87fs3lf0ht.fsf@intel.com>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <87fs3lf0ht.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::13) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|PH7PR11MB6908:EE_
X-MS-Office365-Filtering-Correlation-Id: 21c7c974-f7fa-44ca-fa9d-08dbb2bcde06
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EQOTonx/rTKi2yBXHb09KABGwYmzZbwmid8EpC6X1etQGv6eXatBbD1SbHSZFlLdkzovYYNXPAV0DBlJ5Z/Fl5YWBjBn604NbDjaJLJ55Ptor/MuBQZ3tIbt/C0M5rYNq5QZi0bnMXQBMb2jz8lFOa9cIEmtdmCkVBtrOvBNtf9Bp6FGsM7N++dLSMsVe3NTJZUYaMZXMLB7s9zYBLZgR4bdgAiccOgef0EgivCJWzrdBlJ3XmBji81alll/S2GdKkzGxrbPblJD3b7ydlBmkcCABWY7AtezGbk6wQLXI50y4PZwlotS8FzEKlW0NN8+5/J7PD3toSKf5UEjWkHNeMrWQQN9hpJZQs2buDAij9fdcNeO7ldnboWwCZ30RbYldeRfRSvwj5DDhcGUnmklV75KXpvOQ2JmhBoaBOThzcbnIvJt5b47Y1d3pl5AC1MPYT7lEI0wd19/UsdjmkNIxQ/6h1IhexsU+IqOXi0E8Qn0JYwNMTgzIlH6ojrdRGEwLwlGJHF1YPsQrKSt2ujjA3kN2PlSJ8Lc4eVwWFnSOOR8h3jVaAZdbukdcAm9G7nAzzn4ee5LVejfBv+OQJnZ8vL6YQdZNsejmkqmSzMH99jASs8ztnOQMSEDNYPXgtQ/WauzJAVXFi5xoJkiBUOz/c5LJwbMSYP6eMYVVa6Rr+XTyZnqWHb63X8CI4QFlbpl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(136003)(39860400002)(366004)(396003)(1800799009)(186009)(451199024)(6506007)(6486002)(36916002)(6512007)(6666004)(66899024)(83380400001)(86362001)(31696002)(38100700002)(82960400001)(36756003)(53546011)(2616005)(26005)(66946007)(66476007)(66556008)(54906003)(316002)(15650500001)(41300700001)(2906002)(44832011)(4326008)(8936002)(8676002)(31686004)(5660300002)(966005)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bE1kTGZBKzNjY2s1MFoyRDVQNURPZ3dlZ1hBYUt0T3JKY2oydzR4b0pMMzAv?=
 =?utf-8?B?aEdWeTljdVNQUzI3OHE5cnZHL0R4QlFsYmNzUERPTHIzbkVRQlltMGxIUlFz?=
 =?utf-8?B?WTNTeENzME8xb3NJMXJQb25ENm1oMjFVa2h6Qlo4RWxxVDViSy9JVkxraDJB?=
 =?utf-8?B?WWVTaHplQ2RFbmdJZk9td25EcWxQbzIvV0Y5K0wxQlFsVW1iRjZVSVBUUEF1?=
 =?utf-8?B?RFBkVFVQWWZLd0lzSHZYSUloMzVZOUp0S3I2MnNwU3UyOWJWNFhsNnQ2aTFV?=
 =?utf-8?B?cWVhUlBCSzJGZ0JYaUdwcTZWUHJkY1RYaEtQT2pKMnNrNk1ZUUVsbG1Vc3FY?=
 =?utf-8?B?aGxmc2JTMXluR2FKbE0waC9aTlY5WVdMVllpWkhXQjFvSHd3K3hpUCtTUnc1?=
 =?utf-8?B?VXNGdUhFZzlNVXB5R0R2azNJSENMRmc5dkk3am5EejM1SVNPOWRpS1dvcXVx?=
 =?utf-8?B?VXUvN0dXSWFvckxmS0NMS2hwTlo5V1o4WndSWnplYkxLSW1kY2lEajNrcmdN?=
 =?utf-8?B?QktNSjMxbkJNcUY5bUdkVUtRbVYwT0dCWUM4elpkSGRQb1R5T2JHR1hmd095?=
 =?utf-8?B?VjR4NXBUd1dWVUxtUjVHbUk3Y2h0VlE0THBCQkVsTjJkTlpmd3F5cDN4M1p5?=
 =?utf-8?B?TXJhMDRlR0NHdkNpTi9IRVdWOFdUVWtxd1l4WVJkSUJoKzFZQmlCdjZIYjNt?=
 =?utf-8?B?NVlKMlUyTG9sUUJtbHg0MG9tbjcxOWsyUWJUN2d2Ly91OXNjbGljTVNrUi9h?=
 =?utf-8?B?TnV2eTVjU1c2d0FoWGh1YXRZalpVRXUzVUI4VlEzVU5Ea205eTR0YkFIcFJa?=
 =?utf-8?B?aWRTb1gzbUc3MzNrZWltV2hpNVRBSE1LUHl3SUFuVlhsMjcwNGdUT2xjTyt5?=
 =?utf-8?B?ZC9xZGpiNEl1Y1VwZ0FqelJSMTJEWTRaR0hGT3I0TlhJYkVSMHBDMm5JR0I5?=
 =?utf-8?B?UGZjdHEySUtLQVhaNmdraUtlMWhjSUR4SmVOWmpuZkxuUXIwSWJ2OGxqS0Qv?=
 =?utf-8?B?OWtKYmNNanI3ejZrRklBczNlNVJpd1NzMlpLdWRWanljTXRIZTY3K2xONjh2?=
 =?utf-8?B?WWdiaDdKZE5ocTAxTDc0MUhucVNjelgxb012WHhDelpEUjNBZFB6VmZ1cXg3?=
 =?utf-8?B?b3pGcmRlRHV4RUJaaUpTMGxPREJSbjV5TkswbHNSbGNTZEtMM1FXbnNiRVVm?=
 =?utf-8?B?bnpqRllDcFpvR1NzY0kxaGJxNVZxM1g3U294aWxIakM2OWk5aWdDTGo0WW9P?=
 =?utf-8?B?Q2ZmK3Z4RllSeWd1bTR2ZDJXTGJNcUJtTVdwYU1JalBCTDJrMzZFem9pM1cv?=
 =?utf-8?B?OFYva3dDZVRMYllTcUxSaGg2RitDUXF1MS93eFJLMFpZd3F4VjZtYUpxSG9r?=
 =?utf-8?B?ZWdBbUdvbE9DaVk0WTNXRHpuNGhDRWcxbldyeHk1d0daTWpzTTZyRThydUs4?=
 =?utf-8?B?ZHJGaVJBNFZNSUY1U2QxdHQ5K3p2RFVIVFpyUE5oOWRDZjZCY0FSQ2dzR0lo?=
 =?utf-8?B?cUFHMDhIUS9ScFpQWU4xM0JKUDZVbHdabnVUM1dCdmFtbzFjY2owUXM1ajMw?=
 =?utf-8?B?eVRNcndTb25jRFU5a0tEMEFpT2xMejFFYXA4OSs5cnlYWXgrcU9QWTN1OUh5?=
 =?utf-8?B?am1MWU1ML2FlNjBEL3dEWG5CQ3FCR0piNnY3dExnTkYxZm1ybTRBS0hvdzdx?=
 =?utf-8?B?TkhsTDd2TXBNVnk4V2gzUWN3VGt5emVxTlI2NFdzZ24xNFhDR2psRy95MlND?=
 =?utf-8?B?aEk0RSs3U0hBbGUwWVk3K1IraXY1alZjZ3MvTGtZM0lqM0dxNXpZTmtJMndQ?=
 =?utf-8?B?WFNaVXI5RGF5dW0yR0xvbnpta3dSQjltcExjNGI4aVZMVW5CNHRvQU45Nk5T?=
 =?utf-8?B?bEg3c0hJZzlYdXR2aC9DVlMwQTlSZFpWVlNSTmRkRDcrZ2NIWGk1RWozRWdh?=
 =?utf-8?B?NjJ1WnJVVitFOEtObWw0MzBWTVllT2NmcUdRM2hTN2swVWplUlFyN0gwb2Vo?=
 =?utf-8?B?aE5uNWlwT2tWUFNiSjIrQlFEaWFFTEdRWnlNZXJVa3ZiQTF1M2R3WEg3Qk1B?=
 =?utf-8?B?MHlLZXViVExZV1c4RzJtbFliUHFsNHo0blI1S1Y2YVpUbno0cldOVHIvS2Nv?=
 =?utf-8?B?VXRGWEN1enFWdTByeEd1cjZtSDRXczJ5KzZrK1NJNXg5bFZFQ1Z6dTcrN2RI?=
 =?utf-8?B?MkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 21c7c974-f7fa-44ca-fa9d-08dbb2bcde06
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 11:47:25.7688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ARcL+NrZb1Ee2scybRRDe/XjXDDrYChnGKQC24R0FpgIsbarZw/BHxGhgpQV1QgPW7gOXSudAvN14rRHQl6lc8BNHrmxyxa8IZ6JDtN5zo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6908
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, kernel test
 robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11.09.2023 12:49, Jani Nikula wrote:
> On Mon, 11 Sep 2023, Karolina Stolarek <karolina.stolarek@intel.com> wrote:
>> Update Makefile so it can produce a module that consists of TTM tests.
>> This will allow us to test non-exported functions when KUnit tests
>> are built as a module. Remove the tests' Makefile.
> 
> I'm asking questions instead of making assertions, because I'm not 100%
> confident, but I don't feel like this Makefile could work right.

Questions, assertions and comments are fine, I'm glad you're taking a 
look at the patch :) I'm not 100% confident either, so I welcome 
suggestions on how to improve it.

The problem is that TTM tests try to test symbols that are not exported, 
so I have to compile all the files together into one module if I choose 
to build KUnit tests as a module. The other option that I'm considering 
is to make the tests are builtin only. I'm tempted to go with it (for 
the sake of simplicity), but I'm trying to get the module option to work 
first.

> 
>>
>> Signed-off-by: Karolina Stolarek <karolina.stolarek@intel.com>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202309010358.50gYLkmw-lkp@intel.com/
>> Closes: https://lore.kernel.org/oe-kbuild-all/202309011134.bwvpuyOj-lkp@intel.com/
>> Closes: https://lore.kernel.org/oe-kbuild-all/202309011935.bBpezbUQ-lkp@intel.com/
>> ---
>>   drivers/gpu/drm/ttm/Makefile       | 18 +++++++++++++-----
>>   drivers/gpu/drm/ttm/tests/Makefile |  6 ------
>>   2 files changed, 13 insertions(+), 11 deletions(-)
>>   delete mode 100644 drivers/gpu/drm/ttm/tests/Makefile
>>
>> diff --git a/drivers/gpu/drm/ttm/Makefile b/drivers/gpu/drm/ttm/Makefile
>> index dad298127226..6322a33e65ed 100644
>> --- a/drivers/gpu/drm/ttm/Makefile
>> +++ b/drivers/gpu/drm/ttm/Makefile
>> @@ -2,10 +2,18 @@
>>   #
>>   # Makefile for the drm device driver.  This driver provides support for the
>>   
>> -ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>> -	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
>> -	ttm_device.o ttm_sys_manager.o
>> +ttm := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o \
>> +       ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o ttm_pool.o \
>> +       ttm_device.o ttm_sys_manager.o
>> +obj-$(CONFIG_DRM_TTM) += $(ttm)
> 
> Does that not lead to each object in $(ttm) becoming its own module?

Huh, yes, that is what would happen here. Not good...

> 
>>   ttm-$(CONFIG_AGP) += ttm_agp_backend.o
> 
> Does this not create a ttm.o with just one object, depending on
> CONFIG_AGP?

I just left it as it was before my changes.

> 
>>   
>> -obj-$(CONFIG_DRM_TTM) += ttm.o
>> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += tests/
>> +ttm-tests := tests/ttm_kunit_helpers.o tests/ttm_device_test.o \
>> +             tests/ttm_pool_test.o
> 
> I'd preserve the one object per line syntax. It's nicer for the diffs in
> subsequent updates.

OK, will update it in the next version (if such comes). I just followed 
the style of "ttm-y".

> 
>> +
>> +ifeq ($(CONFIG_DRM_TTM_KUNIT_TEST),m)
>> +    ttm-test-objs := $(ttm) $(ttm-tests)
> 
> Isn't the -objs syntax for host/userspace programs? And if not, doesn't
> it lead to objects with exported symbols being present in two places?

I saw it in use in other Makefiles, so I followed it. As for the 
exported symbols, I tested both builtin and module configs, and it was 
fine, but it's possible I missed something. I suspect that the variables 
are first expanded, and then processed by the Makefile.

Many thanks,
Karolina

> 
> Confused.
> 
> BR,
> Jani.
> 
>> +    obj-m := ttm-test.o
>> +else
>> +    obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += $(ttm-tests)
>> +endif
>> diff --git a/drivers/gpu/drm/ttm/tests/Makefile b/drivers/gpu/drm/ttm/tests/Makefile
>> deleted file mode 100644
>> index ec87c4fc1ad5..000000000000
>> --- a/drivers/gpu/drm/ttm/tests/Makefile
>> +++ /dev/null
>> @@ -1,6 +0,0 @@
>> -# SPDX-License-Identifier: GPL-2.0 AND MIT
>> -
>> -obj-$(CONFIG_DRM_TTM_KUNIT_TEST) += \
>> -        ttm_device_test.o \
>> -        ttm_pool_test.o \
>> -        ttm_kunit_helpers.o
> 
