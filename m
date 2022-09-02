Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA305AB450
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 16:53:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B41610E869;
	Fri,  2 Sep 2022 14:53:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549F510E869
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 14:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662130407; x=1693666407;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Y5SmdJF5yuqagxXaxOVzz2Cqqi2wCc2J0jQJQb6JRRc=;
 b=XKNRszdUcDRR1XVCGpWHi6F519GBOmRRTLOCZxEJ6TXbD+aVk7v98ORL
 L+rXljaQ2Cz3TxBT9JurU4IyK/UuL4GRXaMPiXcdmJ//wOkz4SDKTlKrn
 MVwIu8Xl0WvLlwtc8xr96n5nuK71dWzkuFJ9/EIT9tNqfyok3Sg54ioYA
 FUI+5UjGZyvt3a2HVYP9yPMLp34hjZHOzi/QYWFOmUSGMUYV0oFev7KAL
 hTm3POy4KFIn6b8nDrWnh8wkpWfORNKOG8m1tJW/kJZYljVz8+FYolVyv
 TYCDbXyL9lxixQ8voBBX46epnljEN6ShHivcdtQII2OR3Z08UeqA2J9mT A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10458"; a="279011407"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="279011407"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 07:53:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="642931448"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP; 02 Sep 2022 07:53:26 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 07:53:25 -0700
Received: from fmsmsx608.amr.corp.intel.com (10.18.126.88) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 07:53:25 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx608.amr.corp.intel.com (10.18.126.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 2 Sep 2022 07:53:25 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 2 Sep 2022 07:53:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VAiLkDnttxEPv9sJfS/gRwojZkKm37Po9OHNP/xIrNfMDxvrp/Ng/3UM3ImHO2m+5kNLiS/0bzsKK1ObTBBWNbCmwabh/O3BfNM/6TK56DlnQvtD4gb31D9s3YezVDiIVaLGXvrIQbYI4mKeiVxptz7DrAR9b2dWc33TYn9A3HQlt5qYRDRS4kXiHQjx4628urafr5jXrUqKwrGG7Ien3IupiDdmwWquKHuUbjTQeLQ6D2/jVzA48yTkLUyK1g/JfGuUkSI/j/1wQsi1dal1FBlJRZ84iPd/yO2Tb4mNuMhgExon6jh4cg8NCIswBaqoOhM6nsFxlZKwtpBJqPLFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awVvUJCAqd13IA541H16joiw8iyrJSQyorrdEVqBgTE=;
 b=fDgM2Ne0AfnjlYDluji6JQ4gcXpdq3Muy1hzz5YlR6tMvapWL88ArFe5ZWbg+kBC6xR+qo6F/vM3ATx4fsK2S+CNOfhU/l60wwmYXX3LrVA8E5bP3Wrr4YeMo63ztO15TNxNCb88/OpneEpqfcUPKxIGknszydp5zuDMRLTJssXxXx7qEviLSgkkq8Sn0dJ5uPDIdLFije7NBc88QdVQt9QbsHF0xB/fUqEuT3UcJ2ysoZA4fM3lCa+6HJXSbdO2gfOUoaUTV3pHSmz1kGqoyJ0dWYA6ugQkjuOZ/yupkiWEsReTKCQioSYbeLicnJJT1TVhdaAN4fWm8dS0JSphGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CY4PR11MB1638.namprd11.prod.outlook.com (2603:10b6:910:e::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5588.10; Fri, 2 Sep 2022 14:53:22 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 14:53:22 +0000
Date: Fri, 2 Sep 2022 16:53:15 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: =?utf-8?B?TWHDrXJh?= Canal <mairacanal@riseup.net>
Subject: Re: [PATCH v2 2/2] drm/plane_helper: Split into parameterized test
 cases
Message-ID: <20220902145315.qk67emni4tdt7aiq@nostramo.hardline.pl>
References: <20220831204536.348930-1-michal.winiarski@intel.com>
 <20220831204536.348930-2-michal.winiarski@intel.com>
 <8931b4b7-16d2-24c1-fb4c-fc486d1ec186@riseup.net>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8931b4b7-16d2-24c1-fb4c-fc486d1ec186@riseup.net>
X-ClientProxiedBy: FRYP281CA0017.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::27)
 To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef1c5444-cd55-48a5-1b6a-08da8cf2e192
X-MS-TrafficTypeDiagnostic: CY4PR11MB1638:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3EheHg6ELiBkGwZACpTVZjuQBvYFxi6Jmi102T/n2VtIhK4wTkd3gJPuId4qZe3cBVjuywCLVjiN9lgGmc4VIf9jWnV1d3M/fwVGpUmajXzA58UaMd5MjKlZNYw5ISNv5r4VQnhtg069xZ6m8qlzUTX6XrW6JNfq672O2I1h2J8bk4mk9kypvB+oHaGU4cP4eiDr/axPysfNWv59WGa+zD8xIfeRyYa0balj1waxCc9fvYuSNWeYkl1Mk9EyXZgaii8y6WbdyeoGcMQ9TLrlV+43QmpwJCSz7vWyHz2OE4EIRE4NYk7n8Rph2VIuymxUqm25zky+cPx7aw9vhryjZHV45D4YulHKoYnFsFw0KQoucdNqHDRTY5UUmq1mR30vRetVL5E5+mP/hYs7I4ROI+Y6+/hwBjhIFeDpd37448dMkBetk2lq1Spo5rRqg7G4BtXcjQMZn0F5xwWKHHV47WGDDdF05NHmYHRNKZ4BoC6VLKVR/2KI+CewoMV6wZxpRzH3YeTJy8nY2X5bo6v2IZq0nL7Ena48l3vFOp3eCSEwRG44MyUEv3IViNjpIN/2BX9oteLMe5D0r858jSF6+7jV2zr8eFbbI8zcaTrwxgAQGY2efRJoSYZYLBUSdPsmu+uNQH2kpqN5i64sZGtbxksfOGQM5SR6UoiV8jfqJ+PHVKxqA/fHyoEGn0IEVfUClXqsiKi8qGpjK1qHy7H9sA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(366004)(136003)(346002)(396003)(39860400002)(38100700002)(82960400001)(86362001)(8676002)(66946007)(4326008)(478600001)(30864003)(66556008)(66476007)(6666004)(5660300002)(6916009)(54906003)(1076003)(6486002)(316002)(186003)(66574015)(83380400001)(2906002)(26005)(6512007)(6506007)(9686003)(53546011)(41300700001)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE44VUgwV2o4b1pjNnFORHVLY054NnIvNjFYb0t6T3IrR1A4REY1WjhhOHd5?=
 =?utf-8?B?eGptakwyUTJocWFYYTF1eVI4SExLUFpIR3NVVzVSYkRKMHZaN0ZvaDNLc3Ji?=
 =?utf-8?B?STBXNmx5MUl3dktYMFNVaXhzWGVQeTlNN3JqYnNTUDNlUlo5VHhpYkRmZjRC?=
 =?utf-8?B?Q3BvYk9QUkFrVm9BamtCdjR3S3haVGVwaitHa2Y3dmxIWC9EaG5Gb09mSmRF?=
 =?utf-8?B?cHdEV3VnSEVXVlpaVTR3U1NVd1hNMXEybUFDc1dYc2hvNG52b3IydkpXeDJu?=
 =?utf-8?B?VFhLbEFQc2RqaVcrRm11YzRTa1ZBTXN6Ukg1dG54TXdCMWhwMVVDbERRMW5P?=
 =?utf-8?B?VWgraGduUnFKZ3pGYTJHeW9peVFEcENPcDhLVFJ2YUNQdVZDcnRZcjREb2t3?=
 =?utf-8?B?SHVTcldmWUJZOUxMUC9lTHdTeFNFVGtuYXZCbWFnZTJkMTRIZlZBeWZEdkJL?=
 =?utf-8?B?bWMrUEcyeDF2RjhGZ0lDWXc4M2VURWp0WGRNS0FGdERWM0lCanZQWXRJQXpS?=
 =?utf-8?B?azNPU2ZhVmJsYWwzYWZmV1o2SGVKUW1MbC9VcDdHYVZQMWNLM0doSVJOV2ZJ?=
 =?utf-8?B?UDltZmNiRXgvOS9RcUtZaTUwK0Y1N0ZZNmQwQ0dJK0VzMjYwUzhHVy9LV0NN?=
 =?utf-8?B?ekRFZWMvK04yRXhBcXFNNkJOVU1zcE8wZ3ZxQVJoY3JLMVRDZUhRczVka1Yw?=
 =?utf-8?B?KzBxRGpTa21FYlhSa3k2dDhLT2dwcDU3ckJpdTFaZ3l4cWFsdHJDTm0yS0hl?=
 =?utf-8?B?VXQ2Y1NWOExkZHYxYitraW1IVFZXcFZmMmN0d3NPMHFpVDF0UXdqeDJOTWZq?=
 =?utf-8?B?UnBmSXlKZk9hY2RUREpHZTlVUEhzZHlyYTBHampXUDlKR3FoUnE3ZVZGQlcz?=
 =?utf-8?B?VWVCb0dSY2VRbytuVU9NSFUzaWxQSWJGTEx0M1ZwV1F4c25WYkpqT0NHMTBU?=
 =?utf-8?B?bGpzbU0vQXc2R2dqTnpkWnd1cnhGMXIrcXdDL1ZVVUFSWVNqVHB3UmxaNkJS?=
 =?utf-8?B?U1hXQnFLNFM2dUFRL2Z4MkpvTnhOeEdkNkw1RTNxNVZ2UzdObEhWanZYdW93?=
 =?utf-8?B?VTErd1pYVks1QUdWRlBObytWdDg2WENqd2tlQU43dmJ5Rit1Sy92MERMSGpT?=
 =?utf-8?B?N2QwUldtZUN2b1hpNmRvd3ZGL25uenBLYUtNeHhZT2JwYnppK1VkS2owNzc5?=
 =?utf-8?B?SWltOUJweUtDVGtVMlpBMEkyY3lxMmtGaFYxL1VZWmo3SkhCeTFpSGc2UmRz?=
 =?utf-8?B?WmhCaGZMR09YNnhMc1VtZWJjY1lLQm1QUTJhMEdhUVNuZStzY0pLYnAraVZF?=
 =?utf-8?B?WVhZNXdpQm5NUEl4Q01RZ2NkVDkwd1RRNDYwaEs3d0d1WFZvT1pxMG1LS2Zx?=
 =?utf-8?B?VHUrb3lhcysxbDlCNEFBc1RzdmIxTkxqZzhYUGt2U3V5a0NkMUNWVE8wRGNk?=
 =?utf-8?B?NVk0WFI5R3BnSkdKMERTMHFLQWhYcDdKSjdUMG1UTStFNTdCdXFlZklvT1ps?=
 =?utf-8?B?OGxDK01XR1JLQUFLMkJyZG4zQUJBbFFSQ0dMalpZb1FWSEZ1aEhLRThwd3B4?=
 =?utf-8?B?Y05ZcjJjbU84MkdqL1hqTXJaT1pHa3RjTEkzTjhMc2lkMTJFVGFvVU90eEdM?=
 =?utf-8?B?L3dtK1Fwbm0wL1Q0VDIvWVcreExPVUh1Q0JmdE80Qndhc0xxbGZvRnZrOGI2?=
 =?utf-8?B?SWdvNTg3R1BNOStVVi9URi9oeUxEampWcGVSREtYYkVMUkQ5TTF4ZDlpZ1Iy?=
 =?utf-8?B?WmtzQ211RDZwelJqbU9vajFHS1I2QlZUdERiQlB6RnFFM1UvU3FwMklYY0gz?=
 =?utf-8?B?V2hyOHRmNVk3WEgwTmhkTEcvUjVpUS9KY3FwQjJ4NmNxRVRGWGMxV1ZMdjhH?=
 =?utf-8?B?ZGZlUERJTXVUN3ljZDZuN0x1ZzhFTUFZQ1FKNHZqMVVGWVNsWWFMblRFY3lW?=
 =?utf-8?B?MWc4SVh6YWxTc3VlWWdIU1VYdGFpNVNDeVdCMVl2TmdrRG5UaFAwWGpYZmJs?=
 =?utf-8?B?dnlkYzBmMUJZTHFQTTU1NWIyOGxLdWxKSXd0U1ZCQ2VwY1BDUmJPRzVzWWth?=
 =?utf-8?B?cXlmTHgrUHl4MWlsaDFCVE1heTVoT3FWQmg3dTUrckQ1NTVBV2ZIUWpJaDJ0?=
 =?utf-8?B?N25tdzJxalBVVHJ0TmI5K29WenZzSnkzbkVzajdIVHc0U0lZTklWNGc3WjFz?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef1c5444-cd55-48a5-1b6a-08da8cf2e192
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 14:53:22.3581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VmrJilp08KRLa/qL/AH4Dgt88kbrJpb2lSYiyt02TeElvhSu6EuMOjQKnLapXCEkzdVliHSZFibI4jzjEKy3q4YC/o1D0a3MiFUY62eg1T8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1638
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
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 09:20:55AM -0300, Maíra Canal wrote:
> Hi Michał
> 
> On 8/31/22 17:45, Michał Winiarski wrote:
> > The test was constructed as a single function (test case) which checks
> > multiple conditions, calling the function that is tested multiple times
> > with different arguments.
> > This usually means that it can be easily converted into multiple test
> > cases.
> > Split igt_check_plane_state into two parameterized test cases,
> > drm_check_plane_state and drm_check_invalid_plane_state.
> > 
> > Passing output:
> > ============================================================
> > ============== drm_plane_helper (2 subtests) ===============
> > ================== drm_check_plane_state ===================
> > [PASSED] clipping_simple
> > [PASSED] clipping_rotate_reflect
> > [PASSED] positioning_simple
> > [PASSED] upscaling
> > [PASSED] downscaling
> > [PASSED] rounding1
> > [PASSED] rounding2
> > [PASSED] rounding3
> > [PASSED] rounding4
> > ============== [PASSED] drm_check_plane_state ==============
> > ============== drm_check_invalid_plane_state ===============
> > [PASSED] positioning_invalid
> > [PASSED] upscaling_invalid
> > [PASSED] downscaling_invalid
> > ========== [PASSED] drm_check_invalid_plane_state ==========
> > ================ [PASSED] drm_plane_helper =================
> > ============================================================
> > Testing complete. Ran 12 tests: passed: 12
> > 
> > v2: Add missing EXPECT/ASSERT (Maíra)
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/tests/drm_plane_helper_test.c | 456 ++++++++++--------
> >  1 file changed, 267 insertions(+), 189 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tests/drm_plane_helper_test.c b/drivers/gpu/drm/tests/drm_plane_helper_test.c
> > index 0bbd42d2d37b..505173b019d7 100644
> > --- a/drivers/gpu/drm/tests/drm_plane_helper_test.c
> > +++ b/drivers/gpu/drm/tests/drm_plane_helper_test.c
> > @@ -12,59 +12,97 @@
> >  #include <drm/drm_modes.h>
> >  #include <drm/drm_rect.h>
> >  
> > -static void set_src(struct drm_plane_state *plane_state,
> > -		    unsigned int src_x, unsigned int src_y,
> > -		    unsigned int src_w, unsigned int src_h)
> > +static const struct drm_crtc_state crtc_state = {
> > +	.crtc = ZERO_SIZE_PTR,
> > +	.enable = true,
> > +	.active = true,
> > +	.mode = {
> > +		DRM_MODE("1024x768", 0, 65000, 1024, 1048,
> > +			 1184, 1344, 0, 768, 771, 777, 806, 0,
> > +			 DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
> > +	},
> > +};
> > +
> > +struct drm_check_plane_state_test {
> > +	const char *name;
> > +	const char *msg;
> > +	struct {
> > +		unsigned int x;
> > +		unsigned int y;
> > +		unsigned int w;
> > +		unsigned int h;
> > +	} src, src_expected;
> > +	struct {
> > +		int x;
> > +		int y;
> > +		unsigned int w;
> > +		unsigned int h;
> > +	} crtc, crtc_expected;
> > +	unsigned int rotation;
> > +	int min_scale;
> > +	int max_scale;
> > +	bool can_position;
> > +};
> > +
> > +static int drm_plane_helper_init(struct kunit *test)
> >  {
> > -	plane_state->src_x = src_x;
> > -	plane_state->src_y = src_y;
> > -	plane_state->src_w = src_w;
> > -	plane_state->src_h = src_h;
> > +	const struct drm_check_plane_state_test *params = test->param_value;
> > +	struct drm_plane *plane;
> > +	struct drm_framebuffer *fb;
> > +	struct drm_plane_state *mock;
> > +
> > +	plane = kunit_kzalloc(test, sizeof(*plane), GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_NULL(test, plane);
> > +
> > +	fb = kunit_kzalloc(test, sizeof(*fb), GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_NULL(test, fb);
> > +	fb->width = 2048;
> > +	fb->height = 2048;
> > +
> > +	mock = kunit_kzalloc(test, sizeof(*mock), GFP_KERNEL);
> > +	KUNIT_ASSERT_NOT_NULL(test, mock);
> > +	mock->plane = plane;
> > +	mock->crtc = ZERO_SIZE_PTR;
> > +	mock->fb = fb;
> > +	mock->rotation = params->rotation;
> > +	mock->src_x = params->src.x;
> > +	mock->src_y = params->src.y;
> > +	mock->src_w = params->src.w;
> > +	mock->src_h = params->src.h;
> > +	mock->crtc_x = params->crtc.x;
> > +	mock->crtc_y = params->crtc.y;
> > +	mock->crtc_w = params->crtc.w;
> > +	mock->crtc_h = params->crtc.h;
> > +
> > +	test->priv = mock;
> > +
> > +	return 0;
> >  }
> >  
> > -static bool check_src_eq(struct kunit *test, struct drm_plane_state *plane_state,
> > +static void check_src_eq(struct kunit *test, struct drm_plane_state *plane_state,
> >  			 unsigned int src_x, unsigned int src_y,
> >  			 unsigned int src_w, unsigned int src_h)
> >  {
> >  	struct drm_rect expected = DRM_RECT_INIT(src_x, src_y, src_w, src_h);
> >  
> > -	if (plane_state->src.x1 < 0) {
> > -		kunit_err(test,
> > -			  "src x coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
> > -			  plane_state->src.x1, DRM_RECT_FP_ARG(&plane_state->src));
> > -		return false;
> > -	}
> > -	if (plane_state->src.y1 < 0) {
> > -		kunit_err(test,
> > -			  "src y coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
> > -			  plane_state->src.y1, DRM_RECT_FP_ARG(&plane_state->src));
> > -		return false;
> > -	}
> > +	KUNIT_ASSERT_GE_MSG(test, plane_state->src.x1, 0,
> > +			    "src x coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
> > +			    plane_state->src.x1, DRM_RECT_FP_ARG(&plane_state->src));
> > +
> > +	KUNIT_ASSERT_GE_MSG(test, plane_state->src.y1, 0,
> > +			    "src y coordinate %x should never be below 0, src: " DRM_RECT_FP_FMT,
> > +			    plane_state->src.y1, DRM_RECT_FP_ARG(&plane_state->src));
> >  
> >  	if (plane_state->src.x1 != expected.x1 ||
> >  	    plane_state->src.y1 != expected.y1 ||
> >  	    drm_rect_width(&plane_state->src) != drm_rect_width(&expected) ||
> >  	    drm_rect_height(&plane_state->src) != drm_rect_height(&expected)) {
> > -		kunit_err(test, "src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
> > -			  DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
> > -
> > -		return false;
> > +		KUNIT_FAIL(test, "src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
> > +			   DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
> >  	}
> 
> I believe it would be more KUnit-like to write:
> 
> KUNIT_ASSERT_EQ_MSG(test, plane_state->src.x1, expected.x1,
> 	"src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
> 	DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
> 
> KUNIT_ASSERT_EQ_MSG(test, plane_state->src.y1, expected.y1,
> 	"src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
> 	DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
> 
> KUNIT_ASSERT_EQ_MSG(test, drm_rect_width(&plane_state->src),
> 	drm_rect_width(&expected),
> 	"src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
> 	DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
> 
> KUNIT_ASSERT_EQ_MSG(test, drm_rect_height(&plane_state->src),
> 	drm_rect_height(&expected),
> 	"src: " DRM_RECT_FP_FMT ", expected: " DRM_RECT_FP_FMT,
> 	DRM_RECT_FP_ARG(&plane_state->src), DRM_RECT_FP_ARG(&expected));
> 
> And maybe explicit in the message which coordinate failed.

All of the components (width / height / x / y) used in the check are already
printed in the proper format (DRM_RECT_FP_FMT is widthxheight+x1+y1).

The suggested approach uses an assert, which means that it will terminate the
test on first failed check. If we use EXPECT instead, we will just print the
same information multiple times.

We could replace it with multiple simple expects, and drop the DRM_RECT_FP_FMT
usage, but that would give us less information and additionally, since the
values here are in fixed-point format, it would just be confusing, since e.g.
for width expect with "actual=1024.000000", "expected=2048.000000" we would see
67108864 and 134217728 instead:

# drm_check_plane_state: ASSERTION FAILED at drivers/gpu/drm/tests/drm_plane_helper_test.c:114
Expected drm_rect_width(&plane_state->src) == drm_rect_width(&expected), but
drm_rect_width(&plane_state->src) == 67108864
drm_rect_width(&expected) == 134217728

Bottom line is - it really is a compound check, we're checking if struct
drm_rect is equal to another struct drm_rect.
The "KUnit-like" way would be to define a custom assert/expect, something like
KUNIT_ASSERT_DRM_RECT_FP_EQ, but since this is just used in this single check, I
think it would be overengineering things slightly and would end up being less
readable.

-Michał

> 
> > -
> > -	return true;
> >  }
> >  
> > -static void set_crtc(struct drm_plane_state *plane_state,
> > -		     int crtc_x, int crtc_y,
> > -		     unsigned int crtc_w, unsigned int crtc_h)
> > -{
> > -	plane_state->crtc_x = crtc_x;
> > -	plane_state->crtc_y = crtc_y;
> > -	plane_state->crtc_w = crtc_w;
> > -	plane_state->crtc_h = crtc_h;
> > -}
> > -
> > -static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_state,
> > +static void check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_state,
> >  			  int crtc_x, int crtc_y,
> >  			  unsigned int crtc_w, unsigned int crtc_h)
> >  {
> > @@ -74,171 +112,211 @@ static bool check_crtc_eq(struct kunit *test, struct drm_plane_state *plane_stat
> >  	    plane_state->dst.y1 != expected.y1 ||
> >  	    drm_rect_width(&plane_state->dst) != drm_rect_width(&expected) ||
> >  	    drm_rect_height(&plane_state->dst) != drm_rect_height(&expected)) {
> > -		kunit_err(test, "dst: " DRM_RECT_FMT ", expected: " DRM_RECT_FMT,
> > -			  DRM_RECT_ARG(&plane_state->dst), DRM_RECT_ARG(&expected));
> > -
> > -		return false;
> > +		KUNIT_FAIL(test, "dst: " DRM_RECT_FMT ", expected: " DRM_RECT_FMT,
> > +			   DRM_RECT_ARG(&plane_state->dst), DRM_RECT_ARG(&expected));
> >  	}
> 
> Same goes here.
> 
> Other than that,
> 
> Reviewed-by: Maíra Canal <mairacanal@riseup.net>
> 
> Best Regards,
> - Maíra Canal
> 
> > +}
> > +
> > +static void drm_check_plane_state(struct kunit *test)
> > +{
> > +	const struct drm_check_plane_state_test *params = test->param_value;
> > +	struct drm_plane_state *plane_state = test->priv;
> >  
> > -	return true;
> > +	KUNIT_ASSERT_EQ_MSG(test,
> > +			    drm_atomic_helper_check_plane_state(plane_state, &crtc_state,
> > +								params->min_scale,
> > +								params->max_scale,
> > +								params->can_position, false),
> > +			    0, params->msg);
> > +	KUNIT_EXPECT_TRUE(test, plane_state->visible);
> > +	check_src_eq(test, plane_state, params->src_expected.x, params->src_expected.y,
> > +		     params->src_expected.w, params->src_expected.h);
> > +	check_crtc_eq(test, plane_state, params->crtc_expected.x, params->crtc_expected.y,
> > +		      params->crtc_expected.w, params->crtc_expected.h);
> >  }
> >  
> > -static void igt_check_plane_state(struct kunit *test)
> > +static void drm_check_plane_state_desc(const struct drm_check_plane_state_test *t,
> > +				       char *desc)
> >  {
> > -	int ret;
> > -
> > -	static const struct drm_crtc_state crtc_state = {
> > -		.crtc = ZERO_SIZE_PTR,
> > -		.enable = true,
> > -		.active = true,
> > -		.mode = {
> > -			DRM_MODE("1024x768", 0, 65000, 1024, 1048, 1184, 1344, 0, 768, 771,
> > -				 777, 806, 0, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC)
> > -		},
> > -	};
> > -	static struct drm_plane plane = {
> > -		.dev = NULL
> > -	};
> > -	static struct drm_framebuffer fb = {
> > -		.width = 2048,
> > -		.height = 2048
> > -	};
> > -	static struct drm_plane_state plane_state = {
> > -		.plane = &plane,
> > -		.crtc = ZERO_SIZE_PTR,
> > -		.fb = &fb,
> > -		.rotation = DRM_MODE_ROTATE_0
> > -	};
> > -
> > -	/* Simple clipping, no scaling. */
> > -	set_src(&plane_state, 0, 0, fb.width << 16, fb.height << 16);
> > -	set_crtc(&plane_state, 0, 0, fb.width, fb.height);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  false, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple clipping check should pass\n");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1024 << 16, 768 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
> > -
> > -	/* Rotated clipping + reflection, no scaling. */
> > -	plane_state.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X;
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  false, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Rotated clipping check should pass\n");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 768 << 16, 1024 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
> > -	plane_state.rotation = DRM_MODE_ROTATE_0;
> > -
> > -	/* Check whether positioning works correctly. */
> > -	set_src(&plane_state, 0, 0, 1023 << 16, 767 << 16);
> > -	set_crtc(&plane_state, 0, 0, 1023, 767);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  false, false);
> > -	KUNIT_EXPECT_TRUE_MSG(test, ret,
> > -			      "Should not be able to position on the crtc with can_position=false\n");
> > -
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  true, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Simple positioning should work\n");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 1023 << 16, 767 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1023, 767));
> > -
> > -	/* Simple scaling tests. */
> > -	set_src(&plane_state, 0, 0, 512 << 16, 384 << 16);
> > -	set_crtc(&plane_state, 0, 0, 1024, 768);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  0x8001,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  false, false);
> > -	KUNIT_EXPECT_TRUE_MSG(test, ret, "Upscaling out of range should fail.\n");
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  0x8000,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  false, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Upscaling exactly 2x should work\n");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 512 << 16, 384 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
> > -
> > -	set_src(&plane_state, 0, 0, 2048 << 16, 1536 << 16);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  0x1ffff, false, false);
> > -	KUNIT_EXPECT_TRUE_MSG(test, ret, "Downscaling out of range should fail.\n");
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  0x20000, false, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed with exact scaling limit\n");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2048 << 16, 1536 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
> > -
> > -	/* Testing rounding errors. */
> > -	set_src(&plane_state, 0, 0, 0x40001, 0x40001);
> > -	set_crtc(&plane_state, 1022, 766, 4, 4);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  0x10001,
> > -						  true, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
> > -
> > -	set_src(&plane_state, 0x20001, 0x20001, 0x4040001, 0x3040001);
> > -	set_crtc(&plane_state, -2, -2, 1028, 772);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  0x10001,
> > -						  false, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0x40002, 0x40002,
> > -					     1024 << 16, 768 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
> > -
> > -	set_src(&plane_state, 0, 0, 0x3ffff, 0x3ffff);
> > -	set_crtc(&plane_state, 1022, 766, 4, 4);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  0xffff,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  true, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	/* Should not be rounded to 0x20001, which would be upscaling. */
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0, 0, 2 << 16, 2 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 1022, 766, 2, 2));
> > -
> > -	set_src(&plane_state, 0x1ffff, 0x1ffff, 0x403ffff, 0x303ffff);
> > -	set_crtc(&plane_state, -2, -2, 1028, 772);
> > -	ret = drm_atomic_helper_check_plane_state(&plane_state, &crtc_state,
> > -						  0xffff,
> > -						  DRM_PLANE_NO_SCALING,
> > -						  false, false);
> > -	KUNIT_EXPECT_FALSE_MSG(test, ret, 0, "Should succeed by clipping to exact multiple");
> > -	KUNIT_EXPECT_TRUE(test, plane_state.visible);
> > -	KUNIT_EXPECT_TRUE(test, check_src_eq(test, &plane_state, 0x3fffe, 0x3fffe,
> > -					     1024 << 16, 768 << 16));
> > -	KUNIT_EXPECT_TRUE(test, check_crtc_eq(test, &plane_state, 0, 0, 1024, 768));
> > +	sprintf(desc, "%s", t->name);
> >  }
> >  
> > +static const struct drm_check_plane_state_test drm_check_plane_state_tests[] = {
> > +	{
> > +		.name = "clipping_simple",
> > +		.msg = "Simple clipping check should pass",
> > +		.src = { 0, 0,
> > +			 2048 << 16,
> > +			 2048 << 16 },
> > +		.crtc = { 0, 0, 2048, 2048 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = false,
> > +		.src_expected = { 0, 0, 1024 << 16, 768 << 16 },
> > +		.crtc_expected = { 0, 0, 1024, 768 },
> > +	},
> > +	{
> > +		.name = "clipping_rotate_reflect",
> > +		.msg = "Rotated clipping check should pass",
> > +		.src = { 0, 0,
> > +			 2048 << 16,
> > +			 2048 << 16 },
> > +		.crtc = { 0, 0, 2048, 2048 },
> > +		.rotation = DRM_MODE_ROTATE_90 | DRM_MODE_REFLECT_X,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = false,
> > +		.src_expected = { 0, 0, 768 << 16, 1024 << 16 },
> > +		.crtc_expected = { 0, 0, 1024, 768 },
> > +	},
> > +	{
> > +		.name = "positioning_simple",
> > +		.msg = "Simple positioning should work",
> > +		.src = { 0, 0, 1023 << 16, 767 << 16 },
> > +		.crtc = { 0, 0, 1023, 767 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = true,
> > +		.src_expected = { 0, 0, 1023 << 16, 767 << 16 },
> > +		.crtc_expected = { 0, 0, 1023, 767 },
> > +	},
> > +	{
> > +		.name = "upscaling",
> > +		.msg = "Upscaling exactly 2x should work",
> > +		.src = { 0, 0, 512 << 16, 384 << 16 },
> > +		.crtc = { 0, 0, 1024, 768 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = 0x8000,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = false,
> > +		.src_expected = { 0, 0, 512 << 16, 384 << 16 },
> > +		.crtc_expected = { 0, 0, 1024, 768 },
> > +	},
> > +	{
> > +		.name = "downscaling",
> > +		.msg = "Should succeed with exact scaling limit",
> > +		.src = { 0, 0, 2048 << 16, 1536 << 16 },
> > +		.crtc = { 0, 0, 1024, 768 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = 0x20000,
> > +		.can_position = false,
> > +		.src_expected = { 0, 0, 2048 << 16, 1536 << 16 },
> > +		.crtc_expected = { 0, 0, 1024, 768 },
> > +	},
> > +	{
> > +		.name = "rounding1",
> > +		.msg = "Should succeed by clipping to exact multiple",
> > +		.src = { 0, 0, 0x40001, 0x40001 },
> > +		.crtc = { 1022, 766, 4, 4 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = 0x10001,
> > +		.can_position = true,
> > +		.src_expected = { 0, 0, 2 << 16, 2 << 16 },
> > +		.crtc_expected = { 1022, 766, 2, 2 },
> > +	},
> > +	{
> > +		.name = "rounding2",
> > +		.msg = "Should succeed by clipping to exact multiple",
> > +		.src = { 0x20001, 0x20001, 0x4040001, 0x3040001 },
> > +		.crtc = { -2, -2, 1028, 772 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = 0x10001,
> > +		.can_position = false,
> > +		.src_expected = { 0x40002, 0x40002, 1024 << 16, 768 << 16 },
> > +		.crtc_expected = { 0, 0, 1024, 768 },
> > +	},
> > +	{
> > +		.name = "rounding3",
> > +		.msg = "Should succeed by clipping to exact multiple",
> > +		.src = { 0, 0, 0x3ffff, 0x3ffff },
> > +		.crtc = { 1022, 766, 4, 4 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = 0xffff,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = true,
> > +		/* Should not be rounded to 0x20001, which would be upscaling. */
> > +		.src_expected = { 0, 0, 2 << 16, 2 << 16 },
> > +		.crtc_expected = { 1022, 766, 2, 2 },
> > +	},
> > +	{
> > +		.name = "rounding4",
> > +		.msg = "Should succeed by clipping to exact multiple",
> > +		.src = { 0x1ffff, 0x1ffff, 0x403ffff, 0x303ffff },
> > +		.crtc = { -2, -2, 1028, 772 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = 0xffff,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = false,
> > +		.src_expected = { 0x3fffe, 0x3fffe, 1024 << 16, 768 << 16 },
> > +		.crtc_expected = { 0, 0, 1024, 768 },
> > +	},
> > +};
> > +
> > +KUNIT_ARRAY_PARAM(drm_check_plane_state, drm_check_plane_state_tests, drm_check_plane_state_desc);
> > +
> > +static void drm_check_invalid_plane_state(struct kunit *test)
> > +{
> > +	const struct drm_check_plane_state_test *params = test->param_value;
> > +	struct drm_plane_state *plane_state = test->priv;
> > +
> > +	KUNIT_ASSERT_LT_MSG(test,
> > +			    drm_atomic_helper_check_plane_state(plane_state, &crtc_state,
> > +								params->min_scale,
> > +								params->max_scale,
> > +								params->can_position, false),
> > +			    0, params->msg);
> > +}
> > +
> > +static const struct drm_check_plane_state_test drm_check_invalid_plane_state_tests[] = {
> > +	{
> > +		.name = "positioning_invalid",
> > +		.msg = "Should not be able to position on the crtc with can_position=false",
> > +		.src = { 0, 0, 1023 << 16, 767 << 16 },
> > +		.crtc = { 0, 0, 1023, 767 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = false,
> > +	},
> > +	{
> > +		.name = "upscaling_invalid",
> > +		.msg = "Upscaling out of range should fail",
> > +		.src = { 0, 0, 512 << 16, 384 << 16 },
> > +		.crtc = { 0, 0, 1024, 768 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = 0x8001,
> > +		.max_scale = DRM_PLANE_NO_SCALING,
> > +		.can_position = false,
> > +	},
> > +	{
> > +		.name = "downscaling_invalid",
> > +		.msg = "Downscaling out of range should fail",
> > +		.src = { 0, 0, 2048 << 16, 1536 << 16 },
> > +		.crtc = { 0, 0, 1024, 768 },
> > +		.rotation = DRM_MODE_ROTATE_0,
> > +		.min_scale = DRM_PLANE_NO_SCALING,
> > +		.max_scale = 0x1ffff,
> > +		.can_position = false,
> > +	},
> > +};
> > +
> > +KUNIT_ARRAY_PARAM(drm_check_invalid_plane_state, drm_check_invalid_plane_state_tests,
> > +		  drm_check_plane_state_desc);
> > +
> >  static struct kunit_case drm_plane_helper_test[] = {
> > -	KUNIT_CASE(igt_check_plane_state),
> > +	KUNIT_CASE_PARAM(drm_check_plane_state, drm_check_plane_state_gen_params),
> > +	KUNIT_CASE_PARAM(drm_check_invalid_plane_state, drm_check_invalid_plane_state_gen_params),
> >  	{}
> >  };
> >  
> >  static struct kunit_suite drm_plane_helper_test_suite = {
> >  	.name = "drm_plane_helper",
> > +	.init = drm_plane_helper_init,
> >  	.test_cases = drm_plane_helper_test,
> >  };
> >  
