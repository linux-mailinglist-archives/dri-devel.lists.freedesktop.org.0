Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954FF812A34
	for <lists+dri-devel@lfdr.de>; Thu, 14 Dec 2023 09:21:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2249F88C11;
	Thu, 14 Dec 2023 08:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5172310E00E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Dec 2023 08:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702542009; x=1734078009;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7fGhCMjtFWJootMOSEWZTDRor3jphEhe1ElYhyRNEy4=;
 b=mlmlEo6rrX/3Rq8XtAz+dbh8ltsC8OblRl9yB0g6HzjIzjGpd6/RzXkR
 oa0PSyA7/y+vrg4hDh1B019jf4uYJqpSBPuRNbFOfAYdvCKY9gdocPLsA
 uKOtb8B6YDMlH+PaRZghIqexSSVMe18deTpiZ5rY8NDO20lmxF2hGd3l6
 7EbsIiPQW7QuTdnX6pmhMCKGlfus44fWn0/daDe0UuLzKFgCM3ahBL8Pt
 yI4nBE/mdmF8YXYkESebE6z9qrem6TemCHtWyRB67JMjtQitmQ/3TmgCn
 ivKsXGFmbUoLcUc213e0oy98WILgcenhFGQhV1guUPYkrs0mlt10/l7Wx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="392261325"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="392261325"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2023 00:20:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="723980191"
X-IronPort-AV: E=Sophos;i="6.04,274,1695711600"; d="scan'208";a="723980191"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Dec 2023 00:20:02 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 14 Dec 2023 00:20:02 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 14 Dec 2023 00:20:02 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 14 Dec 2023 00:20:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgI4E7FMJEoc1k/fgOtMqCU29pKhTvfoW7FNly4Pa1gZrSzCiCD1+guNu+4W/9A70giNjUbu+1GCFKQ55Yg2bBoVV8g5vqosBXg+TQr5N2LXDKdBR16kaEZZ2Pyo8Y1NBT+SSgnxHACS1Syo0MAURPkJisopVNuPbuIVw05gWUAqP68u0lxtAFcURSPDF/BlRtWHUr3QdVQdRbFihY865MuaMGVsyF0E6oUxjEPOxZf3MZk7dri6QXxhG2O1T5FjsFRatw9OfyYqmzOWvxGg7KGsVclLgt4SMGbTtSuWli5kYRgfskjxQ/eOfcIFqdPccHoR/IuetdzhIEwwzRpG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbQ767vOoQ4o3TxI92RwZaML7KvFYNI9nv2Gayzi7VY=;
 b=BxIWtwHS/wIT1kFwUc4lHgxPC9VZbeBS7wDsopGmkOiAqVoPkdhWtjwmqFNB7+xftwDkQnc7Ox+n16gO/K+pO7969q8grVk6bLd+2mkXFC7/M4TesNZDgPZhOdi9CEJgaBibpZNC5HEmx3kVsJ8H4ABkh9GRmWwqhdrCYL9ANo9+j28wuw2HvMURd1ybCeF/pNhNM93k5uM/uyR1IVT33+DPFSDTKRxaYElYN+w97MLfQLbp60/KrvHo1C2Q2mL/sEM6ma92MMuzCI5FgJbI6CXGfqNad4alwGQ7GZqxT7r9gLOQybgUf1S8wSZxeIcvLgqM1z+QL1lnrKvPKxvKVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4243.namprd11.prod.outlook.com (2603:10b6:a03:1c8::16)
 by DS7PR11MB7806.namprd11.prod.outlook.com (2603:10b6:8:db::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 08:19:59 +0000
Received: from BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::e053:28ad:6a0e:9692]) by BY5PR11MB4243.namprd11.prod.outlook.com
 ([fe80::e053:28ad:6a0e:9692%6]) with mapi id 15.20.7091.022; Thu, 14 Dec 2023
 08:19:59 +0000
Message-ID: <cf7472e8-d2b9-41cd-90cc-b7a467bf08a0@intel.com>
Date: Thu, 14 Dec 2023 09:20:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/8] Improve test coverage of TTM
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <cover.1701257386.git.karolina.stolarek@intel.com>
Content-Language: en-US
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <cover.1701257386.git.karolina.stolarek@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DU2PR04CA0241.eurprd04.prod.outlook.com
 (2603:10a6:10:28e::6) To BY5PR11MB4243.namprd11.prod.outlook.com
 (2603:10b6:a03:1c8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4243:EE_|DS7PR11MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 16f322b9-73cc-49bb-2cc4-08dbfc7d7622
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vD3lf8EViUv8W4JxX9qG5HGh/9GMxEcv8g/j7aJn78U4CoIzgJwBDfgtbNEYbH7PejuA+PkIUYQk2myCk4jszwICHUNVfHcW5KhYWXEg+V8/nbqHFV9RTUMyOpb4TMEKkuJFAfAKBwRx2Az59WWVRYRR/jVLuHSEejILBYLxPIkM57zyv8LAidAzdcqZnH6iU+TrOTzrXHlo4viUAtGCXDBcUCVFp1j9taSy3zmC1JyKieoCXC6IqKNM/VP0NBnjTHKFJa6lML8r3WFV18wFnYMf33p8MbKpn3YcHmMsCtBVX8BUv9Qko+Ut/ha/tvg1JEouFXG0fI4A0jsaPutZfDp7VrWSNsTuj4Wc47mB05P4+V56qidzM23VvHMDgtjMgJFt+HDJ+EwF2qbWYjT7SdzSuBvE4KKqHJQuEQmnhvIVebFYSyGmLgWwpTvOyLAcPHVXR/2C9N/xEuq67V9ZpUpYMLgmP7j2W7xzmGcmTYePVlcKrRtf55DNqKhK6yylKoFVLT4SEGx2JGx8VQx/s+X8uyEeer72FrSsgcZipOaLCkNzY503vh9PFWiWAPWsQoj5Y8S8T9g1lnJnBoCUOH46y582lXnuDEKl/FL3PKxscNwxIBDoJAxANSd8ca4V4KnKgjhrHYv5GrYniytO3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4243.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(39860400002)(366004)(396003)(376002)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8936002)(4326008)(44832011)(2906002)(5660300002)(6486002)(36916002)(6666004)(6512007)(478600001)(6506007)(53546011)(66556008)(66946007)(66476007)(316002)(6916009)(8676002)(41300700001)(38100700002)(31686004)(31696002)(86362001)(36756003)(82960400001)(83380400001)(2616005)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEZ6dlV5WHZkTXZwbUpFWThVcitHWTRUZEp6WUdaaDF6NnhObGxGSmViMU0v?=
 =?utf-8?B?UTZHUEErYVVuVGg4TDMrWjFRQXdrY0cxSGRQaitLWjZiYU9MTTErcEhxcGhE?=
 =?utf-8?B?cDVza0VGeTlJSDRBYkhVbGo0ZFFUVElLYjI1OGY2eWhHdFZKb29JcHE2blJo?=
 =?utf-8?B?LzBWNCs2blNwQUQ5UU5YSXlIb1pFdDZTbHRxWlUzQjkrNE15Qm5xdW5TM08w?=
 =?utf-8?B?U2NSUUo3VXdRQjU0eU8yRDBCcDVKblllTWlHcHJoSlk5eWdwLzllb1FxbVYv?=
 =?utf-8?B?NUVyKzVhSUhjaER1TnJIVGdISWV1bHhSSW82L1FFbWtsLzVjemZYVXdLMWdh?=
 =?utf-8?B?N3F4OCtnTWhVYlMzc2VWZTQ5dEN4ZHRZSzJZWXVvSTN0VkdoUS9Vd25ZNlN0?=
 =?utf-8?B?M1U5Q05Oa0tjMUM4U3FZSGE4dlMyUkVTaGpTR2tPUENTWElNUjhLdDlCT0VC?=
 =?utf-8?B?WSsvektwZmhpeUM0YVhxekcrdXU4UDczRlRkMWpjaXVPWlpCWU92MHlzd3pW?=
 =?utf-8?B?dE10SjA2VG1BeFQ4dzk5T0dQUEF2a3dXdUY2QWtaajRsbFdtcWE2Q01ncmJD?=
 =?utf-8?B?d0tBd2t3V1ROZHhhR1FwaFRpaDNoZG9DbmFscUNsRnNGNVpsZVBsa2pSSVFz?=
 =?utf-8?B?Q2RCRTI0R0VlQTVPOW1uQ1FENHRCdTVSR0hSa3JPMWg2RHJ6OXgzYTlSQTBN?=
 =?utf-8?B?Q2RNSU1Sam54TzlzclVHZFJLbjV4YjE0Y3NHektjMzNYOE9PQTFua0dUMTVE?=
 =?utf-8?B?cGZKRWVZUkFHRlJsYWNuQjV3V2RPNE55WU1qUVFyMGFVZWlUSU5PVUNua1Fk?=
 =?utf-8?B?aU1vbXpXaFFSOTdrdHUwejk3SHd0RnhmSFRnYS94R0ZGZUFreEkzS09kMnZa?=
 =?utf-8?B?bDYwa00xZTE0SDl1MUNTdjdObFR6TnVYOWJjR0JGYmM3MTRjSW53cW5pQlFR?=
 =?utf-8?B?ZXgvaTdaUXZudXY0N0FsbUpWdGl4SWtqYTBUY2gwRUx4NUNva1E0VGNCb1ZX?=
 =?utf-8?B?clh4TSt2LytmNlJSN2RLdm82Q1kyUjhIckhWc0U3MWZGVDB5SjRoUWxhVHJn?=
 =?utf-8?B?UDdNTm42b0tTWUJoRnkvbnNtQ3JodVdQUThEdExRL0pvajlRZEY0bFlQRSsr?=
 =?utf-8?B?OG1PelNJQVFNTXpHNm01bzh3TVNGeDRlTmdsVGRFRlJrR2dvT2Rna085L2tQ?=
 =?utf-8?B?bXBsYUQ2UHZEdGZObDhmSTUyOVVLVFB0T3RvbTZieHcwSCtXaldHdXRnc3NI?=
 =?utf-8?B?WG9Cb01HSUFnVXlXQVJOaFNnSGR5RU5naVloSktTdXdNTWRiWnlkd0tUZU5l?=
 =?utf-8?B?blQzMjExbkdVcG9XVEhKYjVuVnlqU25kcjhQdUpFVHUxWERuV2hMU3l6Z1FG?=
 =?utf-8?B?V1MwT2ZhY0xocEJQTFBGd2ZTMG9FTE5zWDlOK2ZiVTk3WDB3V0p2djE1WEgv?=
 =?utf-8?B?Z3dOYjZ3Sm12UnZwc0syK1B0aDFxRVU0MytISEJxeVB6SGE0aWJwM2JmOGZ2?=
 =?utf-8?B?ejIwMVNOek5LK3VCd2NGM3VJYmZKZzhDai8ralAyamVmTXlDSWJTd1dLcDZX?=
 =?utf-8?B?NVZPeEFMeUNscjByWHF2N1RoM1BEb1dRaU9tL04zS0k0ankyZ29xL0FaWERF?=
 =?utf-8?B?OUUycGEzZkYzS0c1ODFTMm04QzNFSGt0c0FUWVlGOWt5QUgzWDNMeE5MN2dR?=
 =?utf-8?B?bm9IVlc3VnNOYVRLeUlBWHBEYmFEWkhYRC9rdW9Na1dFaS9Ibi9zaFZCZ251?=
 =?utf-8?B?QjJZN09IQld5K3lseitkRldQcnVmWnoveDRlRDQ0RGwyVVBOUVZoZjJWTVlL?=
 =?utf-8?B?ZExTMGZaYTVHTGlpRHo4SUR3R25xRVEyNEpDUzJXV1RmcVYyVWhaVXVVa1Zo?=
 =?utf-8?B?M1I4eHRjUmtUdmVVVnhVeFJNdjh2V1BHdzAxNERtWlQzMUdrOE1id2RDMGpj?=
 =?utf-8?B?L2VtVHVZUitGekNneVVhdk82ajQvNlRENVVOSnNId0FkQ3VlaWVRQm5NK1Vu?=
 =?utf-8?B?Z1FaVmEwSDBjRWYvTksrUHYwZ0tyZjRydW1nVzd6U1hkbkxnejRidmdxZi9h?=
 =?utf-8?B?RjZ4NnVSanF3UWU0Mzl3MHRDQSt4bkRIbk8vYThKYStUSnZEeUk0M1BJU1dk?=
 =?utf-8?B?VkxpajloYW8vSE4yS04zNFJ0eWZtZUlydTJNK0JJNDUvK3VyMTBCME5YVDUr?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16f322b9-73cc-49bb-2cc4-08dbfc7d7622
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4243.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 08:19:58.7493 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xu6+ZpUf6IP+qXDw2PUGJK7tOhHTLoQ/0OIpwPr2yw97Eire+IOf5FZHBjm94wi6RONqmayV3QL6ea6VNb7AogKJHw62907j2NvxT75HRk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7806
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Hi Christian,

On 29.11.2023 13:02, Karolina Stolarek wrote:
> Karolina Stolarek (8):
>    drm/ttm/tests: Add tests for ttm_resource and ttm_sys_man
>    drm/ttm/tests: Add tests for ttm_tt
>    drm/ttm/tests: Add tests for ttm_bo functions
 >    drm/ttm/tests: Fix argument in ttm_tt_kunit_init()

Would it be possible to get these patches merged? They already have
r-b's. There are a couple more, but these don't depend on any other
patch that is pending review, and should be easy to get in.

I'm asking for this because I have three final patches ready for
submission (eviction, ttm_tt_populate, TODO file) and wondered if I
should submit them as v9, or if I could create a new series. I'd prefer
creating a new one, this patchset is already big and intimidating :)
Having said that, thank you for taking your time to review the tests, I
really appreciate it.

All the best,
Karolina

>    drm/ttm/tests: Use an init function from the helpers lib
>    drm/ttm/tests: Test simple BO creation and validation
>    drm/ttm/tests: Add tests with mock resource managers
>    drm/ttm/tests: Add test cases dependent on fence signaling
> 
>   drivers/gpu/drm/Kconfig                       |   1 +
>   drivers/gpu/drm/ttm/tests/.kunitconfig        |   1 +
>   drivers/gpu/drm/ttm/tests/Makefile            |   5 +
>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 622 ++++++++++++++
>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  | 795 ++++++++++++++++++
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 109 ++-
>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |   7 +
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  | 207 +++++
>   drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |  31 +
>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     |   3 +-
>   drivers/gpu/drm/ttm/tests/ttm_resource_test.c | 335 ++++++++
>   drivers/gpu/drm/ttm/tests/ttm_tt_test.c       | 282 +++++++
>   drivers/gpu/drm/ttm/ttm_resource.c            |   3 +
>   drivers/gpu/drm/ttm/ttm_tt.c                  |   3 +
>   14 files changed, 2401 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_bo_validate_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>   create mode 100644 drivers/gpu/drm/ttm/tests/ttm_tt_test.c
> 
