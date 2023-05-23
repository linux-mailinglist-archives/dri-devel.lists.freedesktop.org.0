Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB62070E40E
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 19:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DA010E103;
	Tue, 23 May 2023 17:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A25410E103;
 Tue, 23 May 2023 17:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684864265; x=1716400265;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aa51mCR2pxobO8DlIo55jsHxJN98zod+KLO19IO3VD0=;
 b=L+lNXPbGx95kNNJv+2m/6Xt7JQjLH0LKQSxnWPqrIHvY73CpJofHzChj
 Tu5vhasZB+dnZBpkllaVweEYQBGs8aXMLO3xrD8th1fIYKTeXy7BUL7ir
 HRsFDZ6TcyatTsJRcJWAmo0YDQG6pmrZBnqDx6QqQGhNK1tX1M66q+sxp
 yTlPB2Nt1wSfcEI8E9PXTt6PZSWxgmCg1VkB/7CGdtDBspeS8lczfDJGw
 M9EpHbERCMcTZcJV4d9RRMblQmR7lTwzRH50BS7br3NkerjrXA8xRETEZ
 5YYQN7V9XbXGtQF8RNS+y36QwSDtHcs0Iu/Iq6g/nV81KooxXODagM9up w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="381558670"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="381558670"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 10:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="707113047"
X-IronPort-AV: E=Sophos;i="6.00,187,1681196400"; d="scan'208";a="707113047"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP; 23 May 2023 10:51:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 10:51:01 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 10:51:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 10:51:01 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 10:51:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nmd3D61J7MiPTKUeVzmtKN1Srd+1lrMQMX4LJydBb3AQSQg0RoSQAGucxCkxgH4037nBCPL5DfHlrp+aWl4m6CC1YXngXxybc3y3+rtaoRJ6DtE7cCMGd5TNx7NqBeXyMRQ5zgdAx+bL1p6MO2+Bwo3uPfqPnaclOJ7gMEU2RxmY8vZetkJAiICHaIg2m8Y4sRFc6uLbyTZFFIKVsX9TqpZk+KtB0yL1s+geqIS1fB2fAR3yFQwja6IUj3KBmexgUbfIkqNTMQzyILP223klMXvDNruVBakCHCf/DeeM7/02gahGGkFuBIbgUMak4isxW5MZZ3LEM/DSZdPlfiXrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yslng8HY47qt/omlzdbODxqqZFfG6B7KF/ifVnTP6qc=;
 b=Jba0tArIqZX/2nPx8KHr0ytZLVMiL+2y1es3lQa2wv1w4y1tUUdSTqKX9b3hy59fzhSVJZsV98/vNAqt+h5ybEYDvmzD7EX6+LjGERb1kowyIsFBgQ35cCCCHikehPPF/SrxK1oL4e8zcRgy4gMw4Lin760rENqVefDTE8j1ZUg4TYiOLNayc7FpZw216J8U11PwtDuYV3km4AbPrZ3ut/vOYtKiBsxvztp9XEPgI8IE/nVF4zTjeUisvQDaksVD23+EUVnvAfeTPJ8HKduAdjzNgM6NyTY7wtSsnJRsfmfNeKVHC7eVKklgJY7vUggqYLYXEuzI2C1+krr7gHxSww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 SJ2PR11MB8567.namprd11.prod.outlook.com (2603:10b6:a03:568::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 17:50:58 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::daaa:41e1:8dc4:d281]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::daaa:41e1:8dc4:d281%7]) with mapi id 15.20.6411.028; Tue, 23 May 2023
 17:50:58 +0000
Date: Tue, 23 May 2023 10:50:56 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/i915/perf: Clear out entire reports after reading if
 not power of 2 size
Message-ID: <ZGz9AJmHGbCMTdVp@orsosgc001.jf.intel.com>
References: <20230522201749.4094742-1-ashutosh.dixit@intel.com>
 <ZGvf2pYJkdEGZRLp@orsosgc001.jf.intel.com>
 <87lehgqblw.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <87lehgqblw.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BYAPR06CA0013.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::26) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|SJ2PR11MB8567:EE_
X-MS-Office365-Filtering-Correlation-Id: a1cd556e-9ddc-44d8-cb07-08db5bb643cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lMf9Bpr6GlsRMSHy9vUFQg+arMwZSP4UnXycUUflDPLQB72Ao1B5EjoC/pxNSKRO1WlPOSf/wNnn2xy6gTXHFx+GrBR6+kLOotxjKlic3WbM2rEfGdHbUro6Kyc+8GqOW6qzlh1rUHs7eQLk6xLoUJ5OGL8lnr5n74vilsfynJgOo29NF8h0uVqw+5Pw+oDspQtThLOKl79cpyRdx0xqAnsU+c1HxgvOaQHdsnS+506zDGI8bjqbOZpj9yA2t7BTakHe7MwrLiqUxkh+k3CnrmqZ79EasxawQQLnYuWFMJGAhvepyS4FoG8TL/VoUXQvD1U+Ui8UAg/atXK+PgUM3E5z3lmH2b0bYGpmn3FLGGYsQ28qzxoxmlzkdE7eDpB0t5t5MTAPOeFa/sj9Wg4Z4U7lIn4Gpn460Y1Wxgowv//3WY6RWq/U9Zmy1mErWXRIl1NpGB+lYEFtolcuAEZjlQpzKg0xUloswXKQaWEw9igxX/nTAH64tS7NqRFaVipwgRqaxUS88vAoDw15fmNq3i4yWIuiyUwdhxIylUFU8M2MxSytqAebCZM8dLkM3eJL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(366004)(136003)(376002)(39860400002)(451199021)(83380400001)(86362001)(478600001)(38100700002)(450100002)(186003)(66476007)(66946007)(6636002)(4326008)(66556008)(2906002)(26005)(316002)(82960400001)(6506007)(6512007)(6486002)(107886003)(41300700001)(6862004)(8936002)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWxKajkyTDFwTUcxUTN5V2FqWlN3bmZBMDJHeGRoK3hqVnJXWnBBWTNOTlli?=
 =?utf-8?B?MTJlMEFMNlBmWkEyRlRjWDdPOE1DNFFKVzVBYlJ3SUlIYUlES2xpcHEwbVQ0?=
 =?utf-8?B?YndFcW1NbjJFSy9ObnVyRFRBR09kSHJEWmlQYjlhQ0JsVFB1NkY0RUNBTEdP?=
 =?utf-8?B?UHVudEJDRnlBak9tamhZeFhXMU9Jb1RyTDEyM1RxaU9xeHJsanJpdHlJeS9j?=
 =?utf-8?B?RUtCV3kzck43YitrWmwxbk1LbER3S1dxdFZFeDI4TnZUWXp2c0ErTEJsTGxw?=
 =?utf-8?B?TmRFZjF6aXM5aUlrRzdVWVYyd1dNbE5EYlNEZlJWVWZRVkQrU1RLamNyN0NM?=
 =?utf-8?B?aGpTT05pbWFmVkQxaU5MV3VCVG9uWDRCVkdDbFVWQUl2bjdZMUMrWG0zNWx5?=
 =?utf-8?B?SUFkck5xc0JXL21lVG4yWEpUM2dDZ1JCejZWNWRwTHg4N1FvSTdnN2hsdkdr?=
 =?utf-8?B?QVZkQnNCT05zSUFQcHdKL0g1aVl3Yk10b0hzQS9RUEdSUDQrQVFIUlZXRkVH?=
 =?utf-8?B?RnZVTFBjU2FkYmxmZEpPSlhUeHhoZm5ZVDhYZE90R2dKOUtIV2tSZWdQVVRH?=
 =?utf-8?B?Y1dFN2M1V2owTDVPQlpiZENJYmhjck40V1lCMjRvalRFQ3lJTDVwMkU5eHFT?=
 =?utf-8?B?WEl2a0tyTFlQUFBqRUF2Uzl1c1M3bGJtTnh0VW9XaHBzU0NEWHFvVm5EdUlz?=
 =?utf-8?B?OGJrV1AxbFJWcklaK01JK1BzamQ0WitEYlVXRlpsU2VkRFFueEJsc05wUVVs?=
 =?utf-8?B?ZG1MV3YraXR1TXhnTWhlSXZOYXRrYm5EV0NQc09vamwzUjBtdFBLb0VjMGQ2?=
 =?utf-8?B?cXZJVWdMdENlM0NwWDN5RXJiR3ZQMU1ZVjBNQ0hjd1daT0dBVDZ0dHExdHNM?=
 =?utf-8?B?YS9BKzdjR2w3eHRUdk9TQTRrVXhVc3VLZEpJcmVTMVA3MEg3Zm55czN2bmlD?=
 =?utf-8?B?Tk15MERwR252TDNZT0FsV3RQejI3b0dKK09GTHBRcENIRVhTL0o4UjAyQ2Vm?=
 =?utf-8?B?Z0pHMFhJRTZFYUR4T2xTUlJRaUZQQ2xQU25rdTZ2NXNoK3ZkRFMzeGlmNXpl?=
 =?utf-8?B?cXlWNnZoREkxQVZtRlBQOEFFYkRvVWtQaVZ5cGxYdHZBcS9lYzUwYzRaSC91?=
 =?utf-8?B?Szlxc2VyVndDVDVnajU2VFhIeVN3ZGp3OS9qUW9HN05nOFFIbmZ5Vmo4dHNn?=
 =?utf-8?B?YVJFU3pXdzMrdDVSVzdldzdNQjR3ZXMrVkNucUVwTEwwekhRZFNDYTRuaVhn?=
 =?utf-8?B?cWJKUktNcDRIZDNPNGNqZzlPOHFwT0tad1Z6UzRmbUZmWVdpZ1BsU1FKSHJz?=
 =?utf-8?B?cXhHSTZnWVRuZ1N5aElFSFAzNmhBNVFSMmpOWFBHVVVxQmdrb00zSk1nZ2Rx?=
 =?utf-8?B?YStqK3hObnlXTkhieCtFckI5SFlMUThoNVQzeW9uQnJBaFVCVyt2dTZuVytm?=
 =?utf-8?B?T0h0aDBobnRta3ZQTEVxaGlWVlZtQ1I4aHhiQXFMTXB1V2hON05uSHpMTk83?=
 =?utf-8?B?T0NOeDkwZkpBSDBENURrVlc3Szc5S05obGsxcHk0MEx0YjA4ejhRZTYvSG9x?=
 =?utf-8?B?bTJpK1NWS1FBRmdSSVNZd2J3dEdUZFArNWo2bG5GRE5vUE9KeGw2T2lnbkNu?=
 =?utf-8?B?M0JqQU8rUDBpVlRLRENsQU85SmNDSUhoRlVLMktwa0NoMDc1bmFGSnU0WnpJ?=
 =?utf-8?B?T1M5c3F0WEpNS1pUNW92dXBuZkxHUjZKU01QZDYzd3JZS0lJbW5Kb1o3K0pV?=
 =?utf-8?B?MHM1Nk0xZ2NCa0prb0pGS3JQckdzSmFiRko0dnYvWU9BdGpxdjNURCtBZ0hn?=
 =?utf-8?B?Ylc2NE1FRW9KMVNTTmlyRG1hTHphempEcGd3YURMWVdKWnlVMW53bDJpMWJO?=
 =?utf-8?B?R0QvSHdzTzRMYzJoVGFjUjc0UnV5ZUNqa21TeFU3aHcvcW4zSnc4SUJ5MHk1?=
 =?utf-8?B?MWk1OUFtZEFmelNDT0E3M3BGbGpIVWpUcUtTemFtUTdsTzU1VnVuSVMwL1kr?=
 =?utf-8?B?dVdXbjV3UmxoZkVQVlZLZHo5SHlqQ3RHSk5iT3c5TGFZSCtjdldmTUJTcU9s?=
 =?utf-8?B?RXQ1OGdwTkRZc3NyL215UWdYRG4za2NZUCtoY2VCdWlRZ0NBYldWbFhUZGtQ?=
 =?utf-8?B?QmtQQWlTYkZLY003ajFBbFBhSnRpbkUvZTh6OUdaZzFBVitIeWVERVMyenFE?=
 =?utf-8?Q?SQ7dNYxln0BF6BMCiIXvgmI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a1cd556e-9ddc-44d8-cb07-08db5bb643cc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 17:50:58.4651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipZVten4Xn6Ex7bzkrd2iJBSuLgSJmMPjBM5sSC6A1hbi1rgHk/fXmQ1Dg8OW/+fU9NSCuYAtyBnR3N++wlhKWjXd6j+2Ht0QsYcoXB8RQ4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8567
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
Cc: intel-gfx@lists.freedesktop.org,
 Lionel Landwerlin <lionel.g.landwerlin@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 22, 2023 at 02:50:51PM -0700, Dixit, Ashutosh wrote:
>On Mon, 22 May 2023 14:34:18 -0700, Umesh Nerlige Ramappa wrote:
>>
>> On Mon, May 22, 2023 at 01:17:49PM -0700, Ashutosh Dixit wrote:
>> > Clearing out report id and timestamp as means to detect unlanded reports
>> > only works if report size is power of 2. That is, only when report size is
>> > a sub-multiple of the OA buffer size can we be certain that reports will
>> > land at the same place each time in the OA buffer (after rewind). If report
>> > size is not a power of 2, we need to zero out the entire report to be able
>> > to detect unlanded reports reliably.
>> >
>> > Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>> > ---
>> > drivers/gpu/drm/i915/i915_perf.c | 17 +++++++++++------
>> > 1 file changed, 11 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
>> > index 19d5652300eeb..58284156428dc 100644
>> > --- a/drivers/gpu/drm/i915/i915_perf.c
>> > +++ b/drivers/gpu/drm/i915/i915_perf.c
>> > @@ -877,12 +877,17 @@ static int gen8_append_oa_reports(struct i915_perf_stream *stream,
>> >			stream->oa_buffer.last_ctx_id = ctx_id;
>> >		}
>> >
>> > -		/*
>> > -		 * Clear out the report id and timestamp as a means to detect unlanded
>> > -		 * reports.
>> > -		 */
>> > -		oa_report_id_clear(stream, report32);
>> > -		oa_timestamp_clear(stream, report32);
>> > +		if (is_power_of_2(report_size)) {
>> > +			/*
>> > +			 * Clear out the report id and timestamp as a means
>> > +			 * to detect unlanded reports.
>> > +			 */
>> > +			oa_report_id_clear(stream, report32);
>> > +			oa_timestamp_clear(stream, report32);
>> > +		} else {
>> > +			/* Zero out the entire report */
>> > +			memset(report32, 0, report_size);
>>
>> Indeed, this was a bug. For a minute, I started wondering if this is the
>> issue I am running into with the other patch posted for DG2, but then I see
>> the issue within the first fill of the OA buffer where chunks of the
>> reports are zeroed out, so this is a new issue.
>
>Yes I saw this while reviewing your patch. And also I thought your issue
>was happening on DG2 with power of 2 report size, only on MTL OAM we
>introduce non power of 2 report size.
>
>> lgtm,
>>
>> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Maybe this should include Fixes: tag pointing to the patch that 
introduced the OAM non-power-of-2 format.

Umesh

>
>Thanks.
>--
>Ashutosh
>
>>
>> > +		}
>> >	}
>> >
>> >	if (start_offset != *offset) {
>> > --
>> > 2.38.0
>> >
