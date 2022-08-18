Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 075B9598894
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 18:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC2D10F9D7;
	Thu, 18 Aug 2022 16:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D821410EE5A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 16:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660839608; x=1692375608;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=dxQ1I04QyYFLDVYPs7G5ILzoFQSbTTioDz8GLRYr5Xk=;
 b=T/8smA8GWOnYhB4de3Z1uWXW7M958EuEnlJhhX2KBWqWXiypHlPoX1Jo
 dE595n1d+/LMesod0JG1774touNmWCfNWytFK8bswBl/wO3+4ltpGSb/5
 lTtdPyRd6RmvJglz00XnCZ89zBDf97ZEXr+QuaVl9zkaIT0AGpjIxB/jj
 DywW1mb2Y0zcdSuyMZYrV/2eKOtBZpmzqQG8U/vuawdmCL3aOWwv/peVC
 dfikqLYqJtzBkdgbUfLI5C/4WFSQ/LhhkhNCPXaC+vcLVTKxDWMxubnbR
 IRqq+M3SF/bgFbL/k4vSXuuRger2oJqkXO4erhNhAfliV56QoeVelAS3l w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275849135"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275849135"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 09:20:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="668178657"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 18 Aug 2022 09:20:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 18 Aug 2022 09:20:04 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 18 Aug 2022 09:20:04 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 18 Aug 2022 09:20:04 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Thu, 18 Aug 2022 09:20:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PB9zmqQO7S/eSbmKVv0gM4vjbLT4WpqcZp66ZxlirrVT4FUuxFvslYqcJ+eXX+LqnFIbpjmc+0nanMLpJp+10Qc5MqDuCoT1SfC1F/80GaInAET9+Ucc0HmxJsjMx05hR1NfPpssgJV3kzlskGGwHURDwTtucnHeHnhaMD6xrZQf/uXkyQMXMSa0jWtZt7diwnr8IXH0UuAZoXKvbLMlGAn3YDR1WQ1K0eVi5yry97WRHea5FYPpOh6x7yOEOKxYqgMp9POGjX7IcHkDStQaMj/IPNZlBCg366SSfnKnCwv/Tz+PlUFYiZn7jBZ4qgXmUbMeU5ieLrYRbqxASjoOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alq7hF/CdmfDxnz9kXJ2dakQk5ynWnRvM14RJn5mRog=;
 b=fbokFnbsi+fMJY6gvWhpw5DnCfyqHtdzZC5r25Rlo0S+glIwHJCEDVB9dXVMj6uksa0D9frTsce+bx9hk/iFtO8QkfCHdpUCa6qJyAzVrggNBvfTrThgjQP1CF+GEVd03qnKUYhMblg9W6+49izJfXMWFYN8SGLHjpV/1Ar6r4v/tCvaCdhveRtVk0DK+wXygdDTBh3LGngPVnTy+nlDJuPvAIkK16cMQLsgmXktcUtsQdz8y/YxeuBpe+E+dq1IvdhUGhPVzIxK/MUJYVmU/mygQQCoBBoUhIsUUKvYBVPnVdhFnjLv9QFDA2Ek+G19dhbhNzfJ+R+w0jNcVdGUWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BN0PR11MB5743.namprd11.prod.outlook.com (2603:10b6:408:165::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5525.11; Thu, 18 Aug 2022 16:20:01 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5546.016; Thu, 18 Aug 2022
 16:20:01 +0000
Date: Thu, 18 Aug 2022 18:19:53 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH v2 1/2] drm/cmdline-parser: Merge negative tests
Message-ID: <20220818161953.2kfwu5vrfpuf57kx@nostramo.hardline.pl>
References: <20220817211236.252091-1-michal.winiarski@intel.com>
 <cb4263a0-c5bb-bf27-0e06-9b62eff2d1c1@riseup.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cb4263a0-c5bb-bf27-0e06-9b62eff2d1c1@riseup.net>
X-ClientProxiedBy: FR3P281CA0172.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::10) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4d3a795-0f65-42f1-af11-08da81358027
X-MS-TrafficTypeDiagnostic: BN0PR11MB5743:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gUkpGgCg80ta6HQQHVT65letE4gH8lMhDegd1V+wTDVZkbgxksD31ax5byGzvua/RZDo3nkv95hwyesmloHJIrIkT4sQC9ZNvvlN4kkxQBUmb2IDxA16iAcqHTbbymDwZUMDqfRMV8z1g5AVq6qI8lphRrdADUe7fcFFAQcsVzSDqwQ46EUrpuvp2L+FRoGmc2uvEZrKbUeiWGGqpxl2KA5DnwC+iutsI418+jZysXjHL3bJ8MCQkEKx7U/aVv0nsCJLTDTVK5S0Uh2hWi/zuEZAdw9A81/JWiN7e5zDZ2KmIQlJKYNMWirkhBjMwxxP0Fu4qfxkYQ6TO6/+BzAcZXr10/IxbHibL1S4S0RAETQQPT7HbhU7SaRRN9FSyCcvn/XyAjt9mGTjtNAPbPU1Q/ThYPZpyqOoG2OlNrreDgM7HIbd4NpYskQt7fC3CXsjVlGozgQ0/3c/BHQDtMnfDDhUnfPSGnjWDGqLcTjD7IBFBkLTwj+4ZehtLZxm9N/eLFBG4afgsvm/NFrWJnZVtKAWtBh5R7iyrmkH3pRrVL2xR+crygmAxcJxV1XgMieRTksCGYGyS7+uRw3Smr5KhduzLqk5qz8UtoidOzPgxyF6UFucXvacE5w0jMllj9j+3tv2q2Fc2ipKjOQ5g4EnjD6kk+Wr+HQWsVVtXeNOFBiuvUgVk36cAAL9WS+VWoHrEqV/qT/X4vLczXpKD31ANA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(136003)(396003)(346002)(366004)(86362001)(82960400001)(66946007)(38100700002)(8676002)(4326008)(66556008)(66476007)(54906003)(6916009)(316002)(2906002)(1076003)(30864003)(186003)(8936002)(6512007)(6506007)(6666004)(9686003)(5660300002)(83380400001)(66574015)(53546011)(6486002)(478600001)(26005)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkRnMkpRL1FjVFNOWGJZdXVadjMwMC93WXhkV2M5Y2J2cjdQcGhzVThoM1NE?=
 =?utf-8?B?dWxlRXY5RzhJSU11TzkzT1BvNzE3QUp5SnJjMDN6WTFSZDhVenZFZmF4S0NL?=
 =?utf-8?B?T1JHaXlPNjBxZCtNbDV5WERScDVERG4vVTBYMndoSFlCTTRkQnliNUE5bDhk?=
 =?utf-8?B?OTdQZFdtL29DUHhjWTFrRkJoRjJjWGhBS3prVDkrSXBCQjZYNjQwd0E4TU5s?=
 =?utf-8?B?aFpneFFrcVh0eDRUNGlaeUhSaGdzaHV5ZjhkOEpDUzllMnlNVVcxZVUyQ2Ji?=
 =?utf-8?B?U3pGWHdaSVlWeUJ1bDhYSFJsQm16UVVHcnR0cFIrUW1EYW0rTWVLYU9LTGdW?=
 =?utf-8?B?NGd4NjBoMi9YK1JzZy9vYjdmcHdURk1zUkVudHBHbHYvRUxHZ3NzOUQ4KzdZ?=
 =?utf-8?B?TDFybTJ5V0RXQU54MVZYcGhTcE9ZelM0d3BEOGFiM01mV1N3bzVxZ29SRDRo?=
 =?utf-8?B?bWZkcHRreStXVVZZaVZ0QVd4b1pEZEdpTFppSGtiWFFvOXhkRDVDZTZhSUM4?=
 =?utf-8?B?TmhENTVDQjNTOFpNWk5wanQ5Z2hSL1NLL1lwcGdidThDMW45S3JobklSMExl?=
 =?utf-8?B?QUN4U0M0VkpaWkZGd1JBZnppTUtGcFg1NTU0U09CQ3FaZDU4dkxyQkY3YUZ2?=
 =?utf-8?B?aHNVRSt1RmN2Qlh0RGhFbzA4aHExZFVBVFR2TDd4VTA1a2FacXlYblFRMEYy?=
 =?utf-8?B?aW0yWDM3UDFTWDlsR3kwOEsxKzdnTWFkaENFRVpUdEhja2FuNUlrSGNnY2Fo?=
 =?utf-8?B?RTFWcVNNajhSUVJZSWlDeFJpdEtvNlN2RFFIQ0lIeW1ZN1N2MjNwK3ZJdXlj?=
 =?utf-8?B?Wi9UOEx1VEVycmtxOFNKVEg0WXBqOThsTS9EZjEzN2xHaWRSUnBlVWRVTldF?=
 =?utf-8?B?cCtaaHNxc0lqVG82L3gvaVFGWlNic09pMDdqZ0dmY281MDJ3enVjQXRabVhF?=
 =?utf-8?B?QzhEeUcrQmdtcU45UHQ5dVRJV2lHcCt4ZW1NU1hyNU90U1hUdXV5RGZ6ZUtu?=
 =?utf-8?B?a0V4algyR3RZZ3llRzRTZm9BWGxaME9qN3NrN25wU2JzT0EzSHhrNTE0S0Jl?=
 =?utf-8?B?dlF5Zy85SytOMkwvajdjODdveC9VakxHZXg2dUI2SEFtV3R4MVJHYmFsRDND?=
 =?utf-8?B?RStra0k3SUhoVFYxQUoybFY4djFqM2dxSFZlWDJLMlM3SDA1T0tHd0Z2akg1?=
 =?utf-8?B?OUdxNGVwaGY1VFVVRDdtN3JsMUtTOWxIUU9pK0lTR0ZDYlJHREdpbVFOY0c0?=
 =?utf-8?B?M09pVjBrakxrZEY0ekVuZUVSdjhNVENBa0Q3WmdlYlVCR0paV0xOWnRFV0Jr?=
 =?utf-8?B?dXRFZjdvSkltZHRMK2Q4NmFMS0FlSUlqL1U0dHlHSGVQbjdWWU5ZdjBBUjJw?=
 =?utf-8?B?Zm5FVmxLbmJUbVlyMTEzcGhMZEZNNzNuVG5RbjBJVVJveFNmaGduMjhRamVX?=
 =?utf-8?B?TVJlQ0FqVzlicy9Oc1A3bVdhWDFza05qQU5tUXErY1cvSmFTYzgrVFZXNEpx?=
 =?utf-8?B?bWRWSTYwVWdVSUE5S2YyNDlWOWk2M0xXVFZmcXpyYUY5KzRDMGZwMVEybzVN?=
 =?utf-8?B?R1JydkgxcmV6VkhzOXU3Um9SY0xnTnpzOGVhRkUxMmFKNUxLa0REdFJuTzlD?=
 =?utf-8?B?WDkvWjBZT1ZVek01TWFBQ3dOSWJ0VVJCMVZiek95QVE4UEhpWEpUL1dxdDhk?=
 =?utf-8?B?TThTUWVKRmV2Rkx0ZVRwRE82U3Q0SENseUxNV20vby9mMVRhOTRjTTZlRkx2?=
 =?utf-8?B?eWNOU1REKzZIOWVoc0ZFRjhtMUV6RWJBZUxCNEozQlNqSFRqejZHQzJpOXZX?=
 =?utf-8?B?a3lOR2R3UDB6dUg5Mnc2RHdTYzNPUUFhWDZSSHlGUU1QNCtlZFYrWDdwR09I?=
 =?utf-8?B?QTdmSFpKTkdaS3BQZW8yOUswa2dsU0cyWmkvSDVzZk1PZk1kWFFMcmExRGMz?=
 =?utf-8?B?cHJCRWsvdFpDUzlFZW05RkdoeDBlck5RWmhYU3hXTmJ5WHUrTUhWc2hJL240?=
 =?utf-8?B?MlgzU0VMcHZ4enZvVDkycVhYTm43OVRucVlBVUVZUnczbUtlbkRIemhRcGtT?=
 =?utf-8?B?ZGlGcW42UWllaXNqZDlEU3YrYWxsSjUza3RwRXVoTmZ4L1BGejFxQ2lMcDB6?=
 =?utf-8?B?cUJMcWwwdnMzak1JaGljck45TmhJWnRua0kwYkN6L1FHek01ZDNaMy9DSG5M?=
 =?utf-8?B?d2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d3a795-0f65-42f1-af11-08da81358027
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 16:20:01.1242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rtckXORhc0CoHKD8e0ngkfIxrN1nklC1XbSdjIQASDD5igEs6AFh44KtIfIyP69NEyzadKTpoT4loXe1s9jYHLNtkPVwOOlcG6fO8MNLxrQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5743
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
Cc: David Airlie <airlied@linux.ie>, Daniel Latypov <dlatypov@google.com>,
 Arthur Grillo <arthur.grillo@usp.br>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 18, 2022 at 11:15:39AM -0300, Maíra Canal wrote:
> 
> 
> On 8/17/22 18:12, Michał Winiarski wrote:
> > Negative tests can be expressed as a single parameterized test case,
> > which highlights that we're following the same test logic (passing
> > invalid cmdline and expecting drm_mode_parse_command_line_for_connector
> > to fail), which improves readability.
> > 
> 
> In order to be consistent to the change on the testcases, you could
> s/negative/invalid on the commit message also.

Already did that - s/passing negative cmdline/passing invalid cmdline.
The tests are still "negative tests" - in other words, tests that pass invalid
data, and expect specific error condition to happen. We can't use "invalid
tests" here, as that has different meaning (broken test).

We could expand it into:
"Tests that pass invalid data can be expressed as a single parameterized test
case (...)"

Would that work? Or should we keep it as "negative tests"?

-Michał

> 
> Best Regards,
> - Maíra Canal
> 
> > v2: s/negative/invalid to be consistent with other testcases in DRM
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > Tested-by: Maíra Canal <mairacanal@riseup.net>
> > ---
> >   .../gpu/drm/tests/drm_cmdline_parser_test.c   | 293 ++++++------------
> >   1 file changed, 103 insertions(+), 190 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> > index 59b29cdfdd35..3a46c7d6f2aa 100644
> > --- a/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> > +++ b/drivers/gpu/drm/tests/drm_cmdline_parser_test.c
> > @@ -109,24 +109,6 @@ static void drm_cmdline_test_force_d_only(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_OFF);
> >   }
> > -static void drm_cmdline_test_margin_only(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "m";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> > -static void drm_cmdline_test_interlace_only(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "i";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> >   static void drm_cmdline_test_res(struct kunit *test)
> >   {
> >   	struct drm_cmdline_mode mode = { };
> > @@ -149,42 +131,6 @@ static void drm_cmdline_test_res(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
> >   }
> > -static void drm_cmdline_test_res_missing_x(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "x480";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> > -static void drm_cmdline_test_res_missing_y(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "1024x";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> > -static void drm_cmdline_test_res_bad_y(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "1024xtest";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> > -static void drm_cmdline_test_res_missing_y_bpp(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "1024x-24";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> >   static void drm_cmdline_test_res_vesa(struct kunit *test)
> >   {
> >   	struct drm_cmdline_mode mode = { };
> > @@ -274,15 +220,6 @@ static void drm_cmdline_test_res_bpp(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
> >   }
> > -static void drm_cmdline_test_res_bad_bpp(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "720x480-test";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> >   static void drm_cmdline_test_res_refresh(struct kunit *test)
> >   {
> >   	struct drm_cmdline_mode mode = { };
> > @@ -306,15 +243,6 @@ static void drm_cmdline_test_res_refresh(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
> >   }
> > -static void drm_cmdline_test_res_bad_refresh(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "720x480@refresh";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> >   static void drm_cmdline_test_res_bpp_refresh(struct kunit *test)
> >   {
> >   	struct drm_cmdline_mode mode = { };
> > @@ -411,15 +339,6 @@ static void drm_cmdline_test_res_bpp_refresh_force_off(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_OFF);
> >   }
> > -static void drm_cmdline_test_res_bpp_refresh_force_on_off(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline =  "720x480-24@60de";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> >   static void drm_cmdline_test_res_bpp_refresh_force_on(struct kunit *test)
> >   {
> >   	struct drm_cmdline_mode mode = { };
> > @@ -563,24 +482,6 @@ static void drm_cmdline_test_res_vesa_margins(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
> >   }
> > -static void drm_cmdline_test_res_invalid_mode(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "720x480f";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> > -static void drm_cmdline_test_res_bpp_wrong_place_mode(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "720x480e-24";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> >   static void drm_cmdline_test_name(struct kunit *test)
> >   {
> >   	struct drm_cmdline_mode mode = { };
> > @@ -608,42 +509,6 @@ static void drm_cmdline_test_name_bpp(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, mode.bpp, 24);
> >   }
> > -static void drm_cmdline_test_name_bpp_refresh(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "NTSC-24@60";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> > -static void drm_cmdline_test_name_refresh(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "NTSC@60";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> > -static void drm_cmdline_test_name_refresh_wrong_mode(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "NTSC@60m";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> > -static void drm_cmdline_test_name_refresh_invalid_mode(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "NTSC@60f";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> >   static void drm_cmdline_test_name_option(struct kunit *test)
> >   {
> >   	struct drm_cmdline_mode mode = { };
> > @@ -762,33 +627,6 @@ static void drm_cmdline_test_rotate_270(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
> >   }
> > -static void drm_cmdline_test_rotate_multiple(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "720x480,rotate=0,rotate=90";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> > -static void drm_cmdline_test_rotate_invalid_val(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "720x480,rotate=42";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> > -static void drm_cmdline_test_rotate_truncated(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "720x480,rotate=";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> >   static void drm_cmdline_test_hmirror(struct kunit *test)
> >   {
> >   	struct drm_cmdline_mode mode = { };
> > @@ -885,15 +723,6 @@ static void drm_cmdline_test_multiple_options(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
> >   }
> > -static void drm_cmdline_test_invalid_option(struct kunit *test)
> > -{
> > -	struct drm_cmdline_mode mode = { };
> > -	const char *cmdline = "720x480,test=42";
> > -
> > -	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(cmdline,
> > -									   &no_connector, &mode));
> > -}
> > -
> >   static void drm_cmdline_test_bpp_extra_and_option(struct kunit *test)
> >   {
> >   	struct drm_cmdline_mode mode = { };
> > @@ -1006,64 +835,148 @@ static void drm_cmdline_test_panel_orientation(struct kunit *test)
> >   	KUNIT_EXPECT_EQ(test, mode.force, DRM_FORCE_UNSPECIFIED);
> >   }
> > +struct drm_cmdline_invalid_test {
> > +	const char *name;
> > +	const char *cmdline;
> > +};
> > +
> > +static void drm_cmdline_test_invalid(struct kunit *test)
> > +{
> > +	const struct drm_cmdline_invalid_test *params = test->param_value;
> > +	struct drm_cmdline_mode mode = { };
> > +
> > +	KUNIT_EXPECT_FALSE(test, drm_mode_parse_command_line_for_connector(params->cmdline,
> > +									   &no_connector,
> > +									   &mode));
> > +}
> > +
> > +static const struct drm_cmdline_invalid_test drm_cmdline_invalid_tests[] = {
> > +	{
> > +		.name = "margin_only",
> > +		.cmdline = "m",
> > +	},
> > +	{
> > +		.name = "interlace_only",
> > +		.cmdline = "i",
> > +	},
> > +	{
> > +		.name = "res_missing_x",
> > +		.cmdline = "x480",
> > +	},
> > +	{
> > +		.name = "res_missing_y",
> > +		.cmdline = "1024x",
> > +	},
> > +	{
> > +		.name = "res_bad_y",
> > +		.cmdline = "1024xtest",
> > +	},
> > +	{
> > +		.name = "res_missing_y_bpp",
> > +		.cmdline = "1024x-24",
> > +	},
> > +	{
> > +		.name = "res_bad_bpp",
> > +		.cmdline = "720x480-test",
> > +	},
> > +	{
> > +		.name = "res_bad_refresh",
> > +		.cmdline = "720x480@refresh",
> > +	},
> > +	{
> > +		.name = "res_bpp_refresh_force_on_off",
> > +		.cmdline = "720x480-24@60de",
> > +	},
> > +	{
> > +		.name = "res_invalid_mode",
> > +		.cmdline = "720x480f",
> > +	},
> > +	{
> > +		.name = "res_bpp_wrong_place_mode",
> > +		.cmdline = "720x480e-24",
> > +	},
> > +	{
> > +		.name = "name_bpp_refresh",
> > +		.cmdline = "NTSC-24@60",
> > +	},
> > +	{
> > +		.name = "name_refresh",
> > +		.cmdline = "NTSC@60",
> > +	},
> > +	{
> > +		.name = "name_refresh_wrong_mode",
> > +		.cmdline = "NTSC@60m",
> > +	},
> > +	{
> > +		.name = "name_refresh_invalid_mode",
> > +		.cmdline = "NTSC@60f",
> > +	},
> > +	{
> > +		.name = "rotate_multiple",
> > +		.cmdline = "720x480,rotate=0,rotate=90",
> > +	},
> > +	{
> > +		.name = "rotate_invalid_val",
> > +		.cmdline = "720x480,rotate=42",
> > +	},
> > +	{
> > +		.name = "rotate_truncated",
> > +		.cmdline = "720x480,rotate=",
> > +	},
> > +	{
> > +		.name = "invalid_option",
> > +		.cmdline = "720x480,test=42",
> > +	},
> > +};
> > +
> > +static void drm_cmdline_invalid_desc(const struct drm_cmdline_invalid_test *t,
> > +				     char *desc)
> > +{
> > +	sprintf(desc, "%s", t->name);
> > +}
> > +
> > +KUNIT_ARRAY_PARAM(drm_cmdline_invalid, drm_cmdline_invalid_tests, drm_cmdline_invalid_desc);
> > +
> >   static struct kunit_case drm_cmdline_parser_tests[] = {
> >   	KUNIT_CASE(drm_cmdline_test_force_d_only),
> >   	KUNIT_CASE(drm_cmdline_test_force_D_only_dvi),
> >   	KUNIT_CASE(drm_cmdline_test_force_D_only_hdmi),
> >   	KUNIT_CASE(drm_cmdline_test_force_D_only_not_digital),
> >   	KUNIT_CASE(drm_cmdline_test_force_e_only),
> > -	KUNIT_CASE(drm_cmdline_test_margin_only),
> > -	KUNIT_CASE(drm_cmdline_test_interlace_only),
> >   	KUNIT_CASE(drm_cmdline_test_res),
> > -	KUNIT_CASE(drm_cmdline_test_res_missing_x),
> > -	KUNIT_CASE(drm_cmdline_test_res_missing_y),
> > -	KUNIT_CASE(drm_cmdline_test_res_bad_y),
> > -	KUNIT_CASE(drm_cmdline_test_res_missing_y_bpp),
> >   	KUNIT_CASE(drm_cmdline_test_res_vesa),
> >   	KUNIT_CASE(drm_cmdline_test_res_vesa_rblank),
> >   	KUNIT_CASE(drm_cmdline_test_res_rblank),
> >   	KUNIT_CASE(drm_cmdline_test_res_bpp),
> > -	KUNIT_CASE(drm_cmdline_test_res_bad_bpp),
> >   	KUNIT_CASE(drm_cmdline_test_res_refresh),
> > -	KUNIT_CASE(drm_cmdline_test_res_bad_refresh),
> >   	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh),
> >   	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_interlaced),
> >   	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_margins),
> >   	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_off),
> > -	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on_off),
> >   	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on),
> >   	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on_analog),
> >   	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_force_on_digital),
> >   	KUNIT_CASE(drm_cmdline_test_res_bpp_refresh_interlaced_margins_force_on),
> >   	KUNIT_CASE(drm_cmdline_test_res_margins_force_on),
> >   	KUNIT_CASE(drm_cmdline_test_res_vesa_margins),
> > -	KUNIT_CASE(drm_cmdline_test_res_invalid_mode),
> > -	KUNIT_CASE(drm_cmdline_test_res_bpp_wrong_place_mode),
> >   	KUNIT_CASE(drm_cmdline_test_name),
> >   	KUNIT_CASE(drm_cmdline_test_name_bpp),
> > -	KUNIT_CASE(drm_cmdline_test_name_refresh),
> > -	KUNIT_CASE(drm_cmdline_test_name_bpp_refresh),
> > -	KUNIT_CASE(drm_cmdline_test_name_refresh_wrong_mode),
> > -	KUNIT_CASE(drm_cmdline_test_name_refresh_invalid_mode),
> >   	KUNIT_CASE(drm_cmdline_test_name_option),
> >   	KUNIT_CASE(drm_cmdline_test_name_bpp_option),
> >   	KUNIT_CASE(drm_cmdline_test_rotate_0),
> >   	KUNIT_CASE(drm_cmdline_test_rotate_90),
> >   	KUNIT_CASE(drm_cmdline_test_rotate_180),
> >   	KUNIT_CASE(drm_cmdline_test_rotate_270),
> > -	KUNIT_CASE(drm_cmdline_test_rotate_multiple),
> > -	KUNIT_CASE(drm_cmdline_test_rotate_invalid_val),
> > -	KUNIT_CASE(drm_cmdline_test_rotate_truncated),
> >   	KUNIT_CASE(drm_cmdline_test_hmirror),
> >   	KUNIT_CASE(drm_cmdline_test_vmirror),
> >   	KUNIT_CASE(drm_cmdline_test_margin_options),
> >   	KUNIT_CASE(drm_cmdline_test_multiple_options),
> > -	KUNIT_CASE(drm_cmdline_test_invalid_option),
> >   	KUNIT_CASE(drm_cmdline_test_bpp_extra_and_option),
> >   	KUNIT_CASE(drm_cmdline_test_extra_and_option),
> >   	KUNIT_CASE(drm_cmdline_test_freestanding_options),
> >   	KUNIT_CASE(drm_cmdline_test_freestanding_force_e_and_options),
> >   	KUNIT_CASE(drm_cmdline_test_panel_orientation),
> > +	KUNIT_CASE_PARAM(drm_cmdline_test_invalid, drm_cmdline_invalid_gen_params),
> >   	{}
> >   };
