Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FAC6DE123
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 18:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDFA10E5A9;
	Tue, 11 Apr 2023 16:41:20 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A610C10E105;
 Tue, 11 Apr 2023 16:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681231277; x=1712767277;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gG5hEfTvq2Ua2aG8a8CnIkoBS56AxV+ms/p6saK2qtc=;
 b=LKETRBclihPI5252MNbPDnoUwKZcQudch2xuUW3eCQ70oB/2FYW1S5Q8
 qmWrlkUaKmMmCD+cSwjPC/zVhcFvb6rugAMBGXWTF2wFNH5Eu5D81edP5
 LpmY99sLcwfzfZBOk4bTZkjYXR8yjPT/cn9QY5X0tHJRK5IF7Ninta+Tp
 Xypufzorv9SpAaLN0AlwilRoHgwWzNKBrskqhKw8hoJ+Jv1mOfbwyTdUO
 JNX3AvZEyS9byjgCAckV8ArHgBirwNvwNZyUc0b+k/h2gQJ7qYA/n3NWq
 QtgICBfJTdFKubOlxV+Ki3wZKfER7eMnoixUfH70dReE3Awxh/h2tDkgI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="341159729"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="341159729"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 09:41:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="812632731"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="812632731"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga004.jf.intel.com with ESMTP; 11 Apr 2023 09:41:16 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 09:41:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 09:41:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 09:41:15 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.49) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 11 Apr 2023 09:41:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WxwbBoTukaYLbBYZluTPWwu6qiAvtmIqr0D2WdjxnXLSzIU6cq6CIN81sTvVGPgryn9a94Rh5gxhOdP7o/oMkiE3McHf8CrxooUk97/9x0QdB7DCnRcGdoieNb56FIc07eC6D5jYV4D1gLZJEUq1VzNfp9en1XIsYPtVVR3PH++gUTLDw3/KUvgNN91sOHQj/VHhL8z7nr9ofEyCgws0VX91E0aaYS9Zg7NAVju6CyrI1ff3okTU9SafhhkykNx5iiwZbEowaaVnL5y6NXJqgIow4yin1+6Jv2ftPsEdJWyzXkjhzgDiGIgjExAB9CGbzsnMU99y7Oc5DWM35cwWOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fYwQqBY6xF/czPS58O/zThLmZ2Z7QSd28SPfIZMZw6M=;
 b=oLQOFdfncv1YYZBoBnLh5JuJsNdj3wQzqFRAXrFm4gVrcu2YiEN1kCuWnaVcAdTvTbrnEaOP3pDkH3uily576nGwEGuQN/lDr072NXOBbioFwCC9P1nSZhtPSJq+DryxurHtLVLBWNRwq9JDz7WYTUZ+pPf86wGHcIjnJ1//BGXEu8rZCCiYEwi8etXVUvbGZFmTyiLy39WGHNUoQ656NwFaLG8uanpurH4RFLiDl7OHLf/xxBsqYYglTr+Y+FQ7kbxgODFnRAJ6y15Zz5DkxfdvqADLS4xJ0FR8mz95vtyeK/5DuI7ajoFBjY5N7SGnP3TnZU3vG7K7BmDrF2Xpfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CY8PR11MB7362.namprd11.prod.outlook.com (2603:10b6:930:85::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 16:41:08 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::f5ee:24ed:9a25:c59d]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::f5ee:24ed:9a25:c59d%3]) with mapi id 15.20.6277.036; Tue, 11 Apr 2023
 16:41:08 +0000
Message-ID: <f4c5dfbf-6dc2-52cb-c31d-c6e78646bcac@intel.com>
Date: Tue, 11 Apr 2023 09:41:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.1
Subject: Re: [PATCH 0/2] Add support for dumping error captures via kernel
 logging
Content-Language: en-GB
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230410192523.2020049-1-John.C.Harrison@Intel.com>
 <ZDVxocPZR1Ad2QLa@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZDVxocPZR1Ad2QLa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0095.namprd05.prod.outlook.com
 (2603:10b6:a03:334::10) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CY8PR11MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7caa64-2f9e-4a2d-9a23-08db3aab8d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: STv1IJj4B0JsKZs1ylP9/To00RO77S2aZgDgznY1AAetRQLMtAgARJ8g05C+cT1L7CBLV7Hv9uuJ1AUpS6/+4NOH9BaBVwXd/Y883Mv7Q9kdySEYNihprZqxsJCsI2hJxM9Zn8zhFZVN/qSAdPuYT6NS4syiSSUZHQ4l4QT8zpmx7XkPygM7Qca8A4NcUtaUymIOmPuqtnS5wZIsEGJYd+mUBa1nYY8DGdeAFQ4pZQQk2QgMewmhJ6HonYkLTXunHP5JwG+42qfk4mR90eQt6V9WpyJCGMXWFLbYyK4j0XfmCEvDaiscvu3NOh+Ew7GMt9PugnWXuFoUNEuG3GbjrLprJvdZe4fd1tbomphB8/FAgNKxUPC51SWwZvGxp/yHHfzpQXumLPZHPLrX9Li+ND6HyW2DfmOWCRxsbqp89/4ZHZ2QHmjj83cicNeEW0RFIXuiZJjrGssplFy0nQkVNVICy7Wipm2W3RGtZzWHJo653UiW5O0dnUw3V5ENJmMfvzFICG94ysTynbcVexv3qnnhit0Hgl7+O6XSTG3wp2HRaFG8PDaKUhMO95oFfnIcsrF8yAhBauZapsBLGhLaCn9ddeKULlXjRArP07Hh2mZSaE3xEp3WGZEyOP1qLFp7YXqdhWWpw0dD+CXSMhi0Tg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(478600001)(6506007)(316002)(6512007)(53546011)(37006003)(26005)(186003)(6636002)(5660300002)(6486002)(6666004)(450100002)(2906002)(66556008)(66946007)(4326008)(41300700001)(6862004)(8676002)(8936002)(66476007)(38100700002)(31696002)(83380400001)(36756003)(82960400001)(2616005)(86362001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDZZdEloenkrZUlweGI4WVpFVkRiVlhlcEZFd0t6KytVVUZoanlsMGRoOG9H?=
 =?utf-8?B?ai9aMEFFUXV5N29wdTZVUEE2UzNJRUd4bVZPdlNMUUFqT0M4MDdZbTRtR2Y0?=
 =?utf-8?B?VStYa3lrcE1jVTZWWC9tbmZEMFhtWldIdVo4T2t0eDZQRWRVV0dxQ3lhMGx6?=
 =?utf-8?B?R2RSc1RZNWZoeXFXczE5VTFwVWUyK091cVIwbWd3K2JsZFY1K0NiM0htbUp3?=
 =?utf-8?B?Y1NwVDJQRC9CWGNmUmRwaGp3aWliSjRuazRzbHM1V0txS0kvdlhncDFMWFlW?=
 =?utf-8?B?U2YzS04vOE00c2JpK2lCbWNLdWJjOU9US2VyZlVYLzhueFhvNiswamZRM1Iz?=
 =?utf-8?B?WmphTXdnQ3hvVTdlYkVFcHhFSWlBeGc4RmJSOGJTcEZ1cHh1UjAvNVRObWxL?=
 =?utf-8?B?YVZqN084ZHlxZ3NjMlJvcVJNOS8vejZLa09mZU4ySXdtTlBLK0JpQzdJdGJE?=
 =?utf-8?B?Um0yRVN4UDVmL29ja0pUOXZFMXVDYmJVbndRcm1PSXF3Vlp3WTg5SVBYcy9T?=
 =?utf-8?B?aUNnbTJ4R0VzbE5kS1dBNWhMNnZwZTNkUHZaYktvTUdWNnhrR3FuMSsyeXJ2?=
 =?utf-8?B?NWFTOHVsYjJPbXpmclhBYVFuUStVK2thc1lCYzNZVUh6ZkhKTXU0SDVrMXpL?=
 =?utf-8?B?djVINGJrdHkwQldma3dCcVhMblBCdG52Vit6WUpicVVSMytIMlR3VVdITDFh?=
 =?utf-8?B?Tk9GNks5cWxUNDFXSlZZOVY0L29jUkJvanVJVCtJRXE0dmVQMm1EQlJNVW9H?=
 =?utf-8?B?dEdmUnlQMlFvYlk1QzhhcDhVVTdaZCtERjIwYUxoUS9td1MrazJSRDlVdUUr?=
 =?utf-8?B?NkM3aVpMSlYySlYzVWlja0kxTkc1R0FCRTN3UnZ2Z096NFlxTzMrREF2QWhM?=
 =?utf-8?B?eEdpOVRvM3Jtb3R0c2YvR3A0ZDBTKysrZlhrUWhuK0pmbXAvdUFDRFRSYjBz?=
 =?utf-8?B?ZlFaQ2J6b0kzOW5pS3ZrWU9oOFlIaW03NmNFZklWa0prY0NFRldrN1M3YlRY?=
 =?utf-8?B?bFlPb0p5c054cmJIVytPQ2J2NFMxNVJNdk83VGJYaEpQRmFtNEVTQUNoN2Jk?=
 =?utf-8?B?RWU4L2JLdDAwYkhFbmxra0JOcG1MUnczYlJEanRrQVlacXBRck1hVDdPK2pz?=
 =?utf-8?B?SWNER1FTcVcrbCtaZGVtOEQ4akU0elJzQTBLNFFVZWhpOFJZV2lNMDBDdHVC?=
 =?utf-8?B?RzQ3YnIzWEFiVVhFSUdTTjUxZ21vUHc0djdLOXlVSVErVEwxVTBTNWFBb1hs?=
 =?utf-8?B?S3Z1ZnJFUGtrVEtEekZTb0VaUTZNNmRrQk1qWUsxZjJNeUpxWksrWHNvRFdr?=
 =?utf-8?B?RE1zVWR5eHVhT0tJWU9RdFVnY3FVRko0WU5QV3gxdFltTGFsUGlYdGlBc0Rj?=
 =?utf-8?B?aUNrNTdPdytwem9HZ1hpNFRQQWxiOEM3VDhvazZUMU0yclRRK3AzWnd6b2Fv?=
 =?utf-8?B?cEo4aVdySHlDemlZZjV0dXNydENqdldQaWhxaUp6emVORTNjeVY5SEM0OUl6?=
 =?utf-8?B?NkkyUHhsVGJIL0hPU1J5M2JxNnREU2tETGZnbGIvMjRHa3grU2FKaFg3djN3?=
 =?utf-8?B?RHM3UGVtbk9kOHV4UllDMWNXYlRaNkJoeGFka0pUMFBnSklYRzVIOWd2VE84?=
 =?utf-8?B?cjNXdzhPYXFXSHpkUHJzSmpWWVZMdmdSMFVNakk4UGdBZVJWbUpOUGVnUXBv?=
 =?utf-8?B?UlB2NUV2RHhJdWNzcFJFSUFqQlpRRHRzTkt6clBjU3RPT3RYaWY0dzVuQkxM?=
 =?utf-8?B?YmllQmhJaWdVVm1PWU9NL05TUkFjeG8rZlFhTkF0NGdWUmkxSE5YZWR0T01m?=
 =?utf-8?B?YmkrdTFmejRWUkhRQThaUEI3UUEzT1lxcEVNTVVEbkF0bndvOWhnWVdsSkZs?=
 =?utf-8?B?VVhBVWR0Z00vK1QrNngzcytjMWlDRFU5eS9WZXZNSERkWUIyY2I2ckRWK0sw?=
 =?utf-8?B?RENNSTI4dDVIYVl4cVJjeW9oY3p6anZTTEdKV2x4YW05QkQvUzZJaDFuQTN3?=
 =?utf-8?B?L0NjdU4wcjBSaklhRTlSdU9JbW11R2d0MmJBNjRVVU15ZTlhMTRxcThoaVZO?=
 =?utf-8?B?R1h2Q0tCeDAwd2htcGpNWURWd2srUUE1QzBXcmMrRW1pcnlnZ3U0Wk43ZTh3?=
 =?utf-8?B?Q1VSZWhuWHNUT3lod29WUU1VdW5QU0Z1T0ZvRTdwczRHMWNaUjdrb0VibFhK?=
 =?utf-8?B?Y2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7caa64-2f9e-4a2d-9a23-08db3aab8d2f
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 16:41:08.8220 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iRprxNYoADsBZk2LnwMiTX5a2J8svTpV3PpXa0EnuFWPREsv1hHjhJVt5cr4tj9EMJRjxoclIhiBzRHDPyD+cQmiPgcHJbwmsZxKhQeYBp0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7362
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
Cc: Intel-GFX@lists.freedesktop.org, DRI-Devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/11/2023 07:41, Rodrigo Vivi wrote:
> On Mon, Apr 10, 2023 at 12:25:21PM -0700, John.C.Harrison@Intel.com wrote:
>> From: John Harrison <John.C.Harrison@Intel.com>
>>
>> Sometimes, the only effective way to debug an issue is to dump all the
>> interesting information at the point of failure. So add support for
>> doing that.
> No! Please no!
> We have some of this on Xe and I'm hating it. I'm going to try to remove
> from there soon. It is horrible when you lost the hability to use dmesg
> directly because it goes over the number of lines it saves... or even
> with dmesg -w it goes over the number of lines of your terminal...
> or the ssh and serial slowness when printing a bunch of information.
>
> We probably want to be able to capture multiple error states and be
> able to cross them with a kernel timeline, but definitely not overflood
> our log terminals.
I think you are missing the point.

This is the emergency backup plan for when nothing else works. It is not 
on by default. It should never happen on an end user system unless we 
specifically request them to run with a patched kernel to enable a dump 
at a specific point.

But there are (many) times when nothing else works. In those instances, 
it is extremely useful to be able to dump the system state in this manner.

It is code we have been using internally for some time and it has helped 
resolve a number of different difficult to debug bugs. As our Xe 
generation platforms are now out in the wild and no longer just 
internal, it is also proving important to have this facility available 
in upstream trees as well. And having it merged rather than floating 
around as random patches passed from person to person is far easier to 
manage and would also help reduce the internal tree burden.

John.

>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>
>>
>> John Harrison (2):
>>    drm/i915: Dump error capture to kernel log
>>    drm/i915/guc: Dump error capture to dmesg on CTB error
>>
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c |  53 +++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h |   6 +
>>   drivers/gpu/drm/i915/i915_gpu_error.c     | 130 ++++++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_gpu_error.h     |   8 ++
>>   4 files changed, 197 insertions(+)
>>
>> -- 
>> 2.39.1
>>

