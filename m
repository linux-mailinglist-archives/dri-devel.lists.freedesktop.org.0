Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE145B8D39
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 18:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B06CE10E00C;
	Wed, 14 Sep 2022 16:38:42 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B2610E00C;
 Wed, 14 Sep 2022 16:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663173519; x=1694709519;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cvkQlHklHbQe1mo1Wd+6ieMaXz55g+tctJCceuSU81Y=;
 b=n9VroVIDPNFoF5SzSqVeOPPNAmB+JLEKjZnOXLlbe7pZsc5zoFLnxpqw
 2KNBWBTHkxvcEs23XctO+vmd80aYUbGdKpilgp1WDn2mq9LRQZ7FaQWEY
 WIokBdK2zw8QMajO+4stzVEJ906jDausZH3GGC43aQPQpr6nXQmUa3dUr
 BSK/gk1VXUvxCoab1YvuGN+0ky3ChjkUuVvBSz7SGe6ZPa8wfZTXKWlUY
 Q/UGcBpscnAhCXnK+K9TAAZBlwQpMtAuFBO5PJciiM6ntsiTJc7Or9Tdf
 YBobWlbYKHYebXnLYX5UjNRqb3NB8fsmdSgej18SHJh1o4SNOZ9NIbJvP g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10470"; a="384770464"
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="384770464"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2022 09:38:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,315,1654585200"; d="scan'208";a="706012975"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 14 Sep 2022 09:38:38 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 09:38:38 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 09:38:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 14 Sep 2022 09:38:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 14 Sep 2022 09:38:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAv90N5ZXAka+AqGoI0oNQVWj/vYHB8VqX6DNsypKmnFyPj3KG17i1402mxPP9qNr9t7BaRzV3cnfxGovd6jEopugLPsTL4uOm6/0WMDmw+HA3TdWV1ppAxK9zj/rEh6IDjya3JSuwVJ1LeWta6l9UkxVXcSeL+wVhYH+1oAhxckhkJpnU8GVcFMUt5kRlZHF1sq6ZuG3DTE0LXAMCPx8RrelUUbFmXOXS3T2jHB3wgmpZsguy/c6z3Ekki2HsdDaWb5uuTutBlCR7vZ7EHK5l4iZs/nmpmuAQCigbkRVsDZMNl733A9Bhi6lZFaqF4MV4KkfCU/1Qrc9fCOhWxZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MDGpMjQDZj1kpUnt2ljqZ6V9mMu/PYZavjkSqidZupI=;
 b=JwMQR3lSfU6zuWqEIBY8CB9EC05EmQ/8rMqR9Jopf7kLLL2FVmwihPjEWjGHQzNmkc+1JGBMF1jdj7SGtnIfLVpaXoqwgd513Ti6VsMv87anIJriF/uwaamEk7gRXWwiMJATNC+xm/OCScYflNSsQyNjGR8C0Tw3YZGHflV+09qYU574QkCZmCLo/qTDNoj1E+y22+lSGlLHjr0Cv2p2bb3DslgikCAR5qjcXg9hr9otpyRTfUQT0+uCxUd58eyiekv3Iz5ZCVHBgYUo8e4UWLipLcGxXEUBTFZ69matBqdY/BlUzGJhmoEaNm1oBJ9pqbbsCVEIuqF5JgGA4eteaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN7PR11MB6749.namprd11.prod.outlook.com (2603:10b6:806:267::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 16:38:30 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::fcdf:8f15:5eaf:b57]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::fcdf:8f15:5eaf:b57%6]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 16:38:30 +0000
Message-ID: <1ed3607a-5a8b-9937-9316-8d90011e15f1@intel.com>
Date: Wed, 14 Sep 2022 09:38:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/1] drm/i915/uc: Fix issues with overriding firmware
 files
Content-Language: en-GB
To: <Intel-GFX@Lists.FreeDesktop.Org>
References: <20220914005821.3702446-1-John.C.Harrison@Intel.com>
 <20220914005821.3702446-2-John.C.Harrison@Intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20220914005821.3702446-2-John.C.Harrison@Intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0065.namprd02.prod.outlook.com
 (2603:10b6:a03:54::42) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SN7PR11MB6749:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0da191-7227-4fd7-9a0f-08da966f8e88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Is36wVZyEeQtQIRRTF4WxMPVykZulksyUZn40e67W/8dlBoHb23u3WwN3GLLKvaQFiWSYpUBdAeUgHE7Tk3cjuvjqMNwu00IrGqIcL0xYjsrexxyC+PYOf0Y9Um+AUIgPNrRU2fP3tZtg2nYWwEHQF91G2MA8Tjujg/mYabEV9FICCpPLAGUfy7qJUWsrY5InQociuli5fv5x/3Oe/p6dkz5vyuZH4S7Oo4WRl7fqsrObtoHD45WJiCdcDEczCO54ysq8J51/kzR4I4wW+7/u2K9S2cJdGsP5hs/MMDC5iLzwlLmoyRmbOJN2yya/mN1NlXmkSE+WH1vUWPqy3vkuk91ptb7hyQvw9RiMBmQnAYbFnAplq2Sp5hzhssRL+FJUSuIDeiPaJbxjB7Uhcb6f7D2GGfbr9821kS4iLpNPLsh0fYtnljxloR4K+H0c9EwpLP1SWWELHu5exol6XLvPs1O6T66vBinuYjRxs0xDK3syjK5RT4dKmwVDwsSIYkMmZOr2vP2JoliVg6jpvepuwJ8opJ2SZIWUdNf2r3Pd2xFG0DUq3ipX0UMr1miUCZKvTgQGhj3rsx4rgT+LHcXBKEhuaKr8SFxqjDrt2uv6NvMPBXvXXDwkHv8a41//Xau2bJqVcJuJU1AOBLdVOl5Q+cfGj3pLzNl2qCcnxaQjoQquGAKg1AIozo6f9hh6va88BJFm36blkB5vp2R7kTx73OyNWItBcSxlMBSIvwYkt9IkCZnW+n22kig+0daD6snnaItGQ+dTuQD7Z6GHbqx2fv7Dh2njyN2S6pM3RRw6w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(396003)(39860400002)(376002)(136003)(366004)(451199015)(83380400001)(2906002)(66476007)(478600001)(31686004)(5660300002)(41300700001)(36756003)(82960400001)(8936002)(6486002)(26005)(66574015)(66556008)(6512007)(316002)(38100700002)(8676002)(450100002)(4326008)(53546011)(66946007)(86362001)(31696002)(6506007)(6916009)(107886003)(2616005)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3hYQWpBcGhETUZrUHVMVzE0U0cySXpReXl4cUxNdDdoYVNLbU5KaDh4OTJ4?=
 =?utf-8?B?b3EzN04vQnFMOUpnUkY0QzRhbXYyN0NiaFlMeFdHNHNSQkVpOGpJc1JPZVNj?=
 =?utf-8?B?WVo4ODRXcjFRMFBUajdWd0JUVXN6WlVLc3BHNUpUSDdBanQ2cENQaUp5SHRQ?=
 =?utf-8?B?QWNTc2J2T1NoWUlJcnczMkZxTEdnQndQSklRZHdoMVpWVEpKL0J1Ymp5dzBx?=
 =?utf-8?B?QXBUTVBXek5QYXRxRy9uQWd6K1pCeDI3U2RXOTUyK2M4M2p0UjJacE9naHE5?=
 =?utf-8?B?RHVRMUVFVmdiOVBuWXhyL1NZREpwbVNjS1JHdGRvTjNxNHBSenZxQWJpYnJL?=
 =?utf-8?B?Yy9SZHBGSDRtbzdnUVc3dHdaYUpUTnNxNll6a1RpSk9La3p1SFY3ODFHVU1G?=
 =?utf-8?B?dUljWlREY1hhS09pSi8yQ2VpWGdBcWJpM3JJY0MwWW9LM0hTVmptTlo5cnR5?=
 =?utf-8?B?TDlQWW1GdWlCdDJmRlhUeWp4VG0zMjhKcVlTbWwrM1QxYXZzUzhZSUZmeDFW?=
 =?utf-8?B?NEVzOHdJMEtMSXJBOGVUU2MrWWhFb1doN3MwN3hGZmlwWjgrV1B0bUJGLzRn?=
 =?utf-8?B?Wm9TYlJHN2NCbkhidWNyMU1RbEkybHRZK0lCa2hUSFZDM1hlTnVXQzJwZ1gw?=
 =?utf-8?B?T3phWXdrdnF6MklIZFlibDJZcHd0Zm94Yi9ISTFOSWFKSmNzZmpUSE5JdXNk?=
 =?utf-8?B?RzhTODlKRWs1bytNTW0xclBlTHB1U25BYWUzamZOZUd1S0w1MnY5Z29ZeFFD?=
 =?utf-8?B?Y2hTL3Q1NGJPUkFmQ3BNRlMwWEpNSllhTkFWc3NZTzlGMHgzNDVSY2dydjlC?=
 =?utf-8?B?czlhMmJlemFSZElKVUlNV25UU3JmcnlKNGh3dzBvNkxKWS8xNzlpeXhFZUdx?=
 =?utf-8?B?emRLSzVvUnJqVlI4QWxIdDMzbWJsSkR0RjNXVWlMNlI3bGZuQnpRWVJYSXgw?=
 =?utf-8?B?ckY0eWFhOEJ1RHNGV1BxOWN2eWlSTk5IZ042cGVLZGR6V0dBb0RVdGZlc0hq?=
 =?utf-8?B?cWhuRzZoR3FDamt6eTRmUC9HU0hXOWcyc0lBRU5iUmEyT1NuQ29IZkVsS2sr?=
 =?utf-8?B?YjNWSklNNzVwc1lEZGdsdTZ1TDlxVjdxWHAwOHdlSzdYR1JSRGpkQTh2aVFJ?=
 =?utf-8?B?SFNPWFBqV1BuSXlyaWo3NVMvQ1V6dTZFMzZLcEpjN1RVSC9VVlE3OXB3NU9u?=
 =?utf-8?B?U0JxMlBEVkdrQ0xaVU9hWkdseFF0ZWRXWjgrdDV5SXEwVUtGNTMyaG9rRzRQ?=
 =?utf-8?B?SWJ1cFV6QksxcmtzMVZFeGM2NUhqMWtMT0tFZUp3aFowU21IdTFsOWNhSHox?=
 =?utf-8?B?dlhLMnVCeW1NV0xtQWhTN05FY283NmZZMVRTOHVhSDVqTWRWcUVXVWp2TS9B?=
 =?utf-8?B?d05YTVoyLzhHZjI3RlJwZFcrK21WUWYxYXZNd01sTWhvTTduU24rN2JLWXNB?=
 =?utf-8?B?alRJOXlBbkZXMHkxS1pCWm1oMTRzUVBPUndLeWt1SXowUXBEUHFjYnRHREh5?=
 =?utf-8?B?aURYSU9GaGRJRXZzUGxLSHNPRDNnNHBvUWNaR0dEalBkbDIvQXpxOE9QdzdR?=
 =?utf-8?B?RlA2Q2ZLQWxYWU43K0FXNGNIZEsvL1FXaWE5cFY4Vm8wVjFrTkVqZzROd2J5?=
 =?utf-8?B?SWc2cEEvM21qRWVzd1Z6Q0lVSGhrYXU2UC9uais3cm9Qa0RtTWFPRUV5b2k5?=
 =?utf-8?B?cldjSFg4S1Z6SDBwdlFCVEQyZHBNQStKQTFpbFlyQWVJRG1qV1BDcXMzZThw?=
 =?utf-8?B?dUZIZlg1MEN2WlIvZW1sMXdvZitBVk5BOVZOMnhLU05rc3NncUp0d1VXR09W?=
 =?utf-8?B?N2Z6aXAzeTJNRzBlRys2NDJWS3g0ZFI4VVI5Q1FMazlwRFdiYWdvN2pUaXpC?=
 =?utf-8?B?cGgvdXVOYUVpeU40WXRKekdZVnNmcEpCTnlBdVQyaEYvODBQckgxT2dpZjBu?=
 =?utf-8?B?anlFZWJkSkZkcWtnN3B2SE1VU1RuNFVJcXpjYmdMY0xhaEc4WWVjS095c0RX?=
 =?utf-8?B?Zkt4dXM2YjMrM01GTFlrWUN5OGlPY1BoLzdoU1JCbU0xYk0rbkJrYWNLY25j?=
 =?utf-8?B?OE5yc3NkdFF4KzVwTVZEczV4ZWlhYmYyaHR1aXVDTTRqNW9vUXVYZGFnQ291?=
 =?utf-8?B?ZWVPTUV0aEEvdDhhejFwNkZCcFJIaDNlVU5qVG05QnphTG5jRFlrMWFhVlZp?=
 =?utf-8?B?ZlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0da191-7227-4fd7-9a0f-08da966f8e88
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 16:38:30.4137 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVommVhKuj6+tYj1SY0419naNv7BXQTIAneGp8RHs095va/s5qMOFWUEPp4kXwFxNCcqLCLUE6jomhdrvTKxliK1jmXnBmawJ1T/27Zgv1s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6749
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 9/13/2022 17:58, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The earlier update to support reduced versioning of firmware files
> introduced an issue with the firmware override module parameter. If an
> invalid file was specified then an infinite loop could occur trying to
> find a backup firmware.
The above not entirely correct - got myself confused while typing it up.

A self test would specify an invalid file name (invalid meaning not in 
the table) both with and without setting the override flag. The 
*non-override* case would cause the infinite loop. I.e. a situation that 
is impossible to hit outside of the selftest because either the file 
name has come from the table in first place or it came from an override. 
However, the override case was still broken in that it would bypass some 
of the later processing.

>
> The fix is that if an explicit override has been set, then don't scan
> for backup options because there is no point anyway. The user wanted X
> and if X is not available, that's their problem.
>
> This patch also fixes up the scanning loop code so that if an invalid
> file is passed in, it will exit rather than loop forever. So if the
> impossible situation did somehow occur in the future, it wouldn't be
> such a big problem.
It also flips the logic on the override early exit to be negative rather 
than positive so as not to skip code that still needs to be run.

John.

>
> v2: Also remove ANSI colour codes that accidentally got left in an
> error message in the original patch.
>
> Fixes: 665ae9c9ca79 ("drm/i915/uc: Support for version reduced and multiple
> firmware files")
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
> Cc: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 20 +++++++++++++++-----
>   1 file changed, 15 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> index af425916cdf64..1169e2a09da24 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> @@ -232,6 +232,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   	u32 fw_count;
>   	u8 rev = INTEL_REVID(i915);
>   	int i;
> +	bool found;
>   
>   	/*
>   	 * The only difference between the ADL GuC FWs is the HWConfig support.
> @@ -246,6 +247,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   	fw_blobs = blobs_all[uc_fw->type].blobs;
>   	fw_count = blobs_all[uc_fw->type].count;
>   
> +	found = false;
>   	for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
>   		const struct uc_fw_blob *blob = &fw_blobs[i].blob;
>   
> @@ -266,9 +268,15 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   		uc_fw->file_wanted.path = blob->path;
>   		uc_fw->file_wanted.major_ver = blob->major;
>   		uc_fw->file_wanted.minor_ver = blob->minor;
> +		found = true;
>   		break;
>   	}
>   
> +	if (!found && uc_fw->file_selected.path) {
> +		/* Failed to find a match for the last attempt?! */
> +		uc_fw->file_selected.path = NULL;
> +	}
> +
>   	/* make sure the list is ordered as expected */
>   	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified) {
>   		verified = true;
> @@ -322,7 +330,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
>   				continue;
>   
>   bad:
> -			drm_err(&i915->drm, "\x1B[35;1mInvalid FW blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
> +			drm_err(&i915->drm, "Invalid FW blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
>   				intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
>   				fw_blobs[i - 1].blob.legacy ? "L" : "v",
>   				fw_blobs[i - 1].blob.major,
> @@ -553,10 +561,14 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   
>   	err = firmware_request_nowarn(&fw, uc_fw->file_selected.path, dev);
>   	memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
> -	if (!err || intel_uc_fw_is_overridden(uc_fw))
> -		goto done;
> +
> +	/* Any error is terminal if overriding. Don't bother searching for older versions */
> +	if (err && intel_uc_fw_is_overridden(uc_fw))
> +		goto fail;
>   
>   	while (err == -ENOENT) {
> +		old_ver = true;
> +
>   		__uc_fw_auto_select(i915, uc_fw);
>   		if (!uc_fw->file_selected.path) {
>   			/*
> @@ -576,8 +588,6 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
>   	if (err)
>   		goto fail;
>   
> -	old_ver = true;
> -done:
>   	if (uc_fw->loaded_via_gsc)
>   		err = check_gsc_manifest(fw, uc_fw);
>   	else

