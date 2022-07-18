Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CFA578989
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 20:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D13710E22E;
	Mon, 18 Jul 2022 18:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5719D10E9A2;
 Mon, 18 Jul 2022 18:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658168795; x=1689704795;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DWVal3e8aubChZieH7JHVNPFalfMvXX/su5mOr0iDf4=;
 b=DBSg8TXKpJy55Asq35An5wqGXgrua+DKYLHOblTEkyPiON1rcDsZV3MJ
 vusZL8bjbhqLLrOOKhHQYI2/thE9g/3qJ8IPSSJVroy0fJRH6CiYnYhir
 fOvLr4mr2coL/fEr0IIYbSF0BKEq3lSJyUh/ope8ejvACgn4STQkryqTm
 QpzZ9L9sYhrR+CDs5GwSwigckdjMQPmtnNYLSM6bFy8YSbTl6d/7+ilOm
 xRHHhqDD61eFWfCMwlRcVJN5f+M5PuCWV7DuXThXzS6lXB35rz6yye4r/
 XO2tTlfdyPcxr3Q+JnfjQ/ci23exaKfQw4RvLLTe7dcryKJk4lCtSvtBB Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10412"; a="266696334"
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="266696334"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2022 11:26:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,281,1650956400"; d="scan'208";a="547602015"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP; 18 Jul 2022 11:26:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 18 Jul 2022 11:26:33 -0700
Received: from orsmsx605.amr.corp.intel.com (10.22.229.18) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 18 Jul 2022 11:26:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 18 Jul 2022 11:26:33 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 18 Jul 2022 11:26:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8C9N3xsFo23iWiEoZiIQSh99ZIXWBmHp2QsTsU4tY9BCNBykyhNbbvFFGTWMT1iAHDQ7/7OgDbuAZK0DNexMlCDZN7u0oJZ6NdEv4wHL+8NCoMzrrEc/M8mUPamWfvSMzWQcTp3Y/mwF2REtZ2pqSvvoAZcs63pihxxUeTuL2zIiPAL3uuROHnXqnGg3DbKsPw9X7Vu9oIzA7gLJ8njg9cELBFfrLP8YBtpfNzZa7tAlvcKtW1qCPVF7fXIQEUHJz9npDkoGR/gJkf3mKQy0SgAFvKMHcuR06HSF3ViJ4X0/W6Ry3ES7NrwL/QTy2wPXfVB2bquiG4pex4czJlhdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T7Htee1nOHqwmCYmAoNCjlCmzbeftbwkR3xoZymbejA=;
 b=ZussmROSjCWmuW9euz8AMwzi96JpLjyNrhMxg3X3kfTNLDb8YlRhB1jIvkzW4b56sraegPkzO6POP69pgEEgcacyDFdEXJ3lTJdzTa505o5h3VdT6w1eV10prpLlhVKy427T/98xWmx2/fn51/zKkgo9cabXSMdfPFNJLQLpzGCxAWcR2DCOBzGIGmA/TgYIIwzcc46fJJ1WT/GuqQGepwn7m+xlAlnbh5AQ1WwLrIyohMp/Y8r1Z4CD/dXZui0RWXGDlkHVTnMJcKEb+x3nY8L2ma1nGHoN77AhrBmk+zqkexB79Q+LL49IR2HOzyIRB7F5aBBEpup3n1Owxo6x/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MWHPR11MB1599.namprd11.prod.outlook.com (2603:10b6:301:e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.19; Mon, 18 Jul
 2022 18:26:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::8053:3c59:9f5d:b615%9]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 18:26:30 +0000
Date: Mon, 18 Jul 2022 14:26:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: support v69 in parallel to v70
Message-ID: <YtWl0fPgvMvbPE75@intel.com>
References: <20220715225451.1294354-1-daniele.ceraolospurio@intel.com>
 <8b782ef1-89ca-b66f-c8ee-1466b26ce6b9@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8b782ef1-89ca-b66f-c8ee-1466b26ce6b9@linux.intel.com>
X-ClientProxiedBy: BYAPR08CA0050.namprd08.prod.outlook.com
 (2603:10b6:a03:117::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db096836-3302-426a-49fd-08da68eb08e0
X-MS-TrafficTypeDiagnostic: MWHPR11MB1599:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v1ffSg8kFJKgvRSoTazDd3c2KIZgyAfsighWdx0DIFLF4MZY3sJOaoMvGs75NlZZbP7e33cJjopnO5tBv93xJNT6ckHVZOLclrnL28MPRcJOivLfJFPiCH4zpkX7YQPb98ArUJ5wF+DhQhv0MGzphHK/bK7sgzohDnXvJFscliC8vCO6NwZIZmgfy6taL3+LcFs7+7Tu74Mg3ri4XAOGbk5pfy4Z20iDkRZ2JCw46o4LsiRSLsKzO58ItTGuLfrhAgZj8fwCTU6P1er0HCGcAn3B4GOb/BQer1P6ppjXIhNmyltLSjiXMLkKJw24SvZQBimvy1yFu9Ke6KE4Mhj0oTpVasy1qgnvck9HvP6jQ34vW6nDe3SygULCztjfinswGnJwsdwNczEFKWJRnw9g5KBJoao0EBr4ZsH1eCLSJZwniWM2LhJo7PhXEa7opgfGNzlFu0Gcs7v6YapmQZkeRX6tbl/xSJZEVzVf/vF4OD8/6YT0MVVh3KWGPf2swN6mClNydpT5QM+BR0LLJj0V4+FvnCgje1wCAnjRJXa5deRycIyRWS81g5LzAC0XQNhC4dHVikl85F2epIndW9mRxne1K0M4B8IRGKzMVqy2/kEB71rANl3RAKkrqkVzXO40CmrQL3aCD+GMqII0lghhbabYCBb/vHxvLzSkPzErap4H1NIPf84yPUcjWaH3UsMd+cBHjfN6bvMNnGGYoAsu1e5tYndosxfRnSAQncB/y6bRXJRutSky4b7hwWW1fQBQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(136003)(346002)(376002)(396003)(39860400002)(316002)(26005)(6916009)(30864003)(86362001)(36756003)(6512007)(54906003)(38100700002)(6666004)(82960400001)(4326008)(66556008)(66476007)(53546011)(6506007)(41300700001)(8676002)(2906002)(186003)(2616005)(66946007)(8936002)(44832011)(966005)(6486002)(83380400001)(478600001)(5660300002)(334744004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bsxjsh4IShQ6jivalk43degrhlGTycgYaNAJcldDlDE/Lm9isfBmgJm5xsYN?=
 =?us-ascii?Q?ZQYGuRyxJThDOOWkd13f1v/wU+dqO6i+mMymMd9D+rd8PLWM3o0IpG1b+dtb?=
 =?us-ascii?Q?F7mbp8GQBQAeJgLNmGvZw9lMS0I7cxlKccaMDmwzrIyWQ/Z6YrFhD02NzJrg?=
 =?us-ascii?Q?y2qWz/Qv2KNQP1nh3sAdo4drmlD5pCHDoSrxBehA8lnQ9phpx1D6S0xIbH2x?=
 =?us-ascii?Q?S6I9IsSEevI2aG+kxVIpCb9G7PviMcVl0+hqNxEza8FeXk24ShEj43lumIxq?=
 =?us-ascii?Q?BebL1EiN1FyOAB0KBBwg3dokOSHSgJkTlmZzYKiEcFAX9VHshoTuSIRx3eR6?=
 =?us-ascii?Q?ugqDBJZg8A/jyzBxv+MKuETzOIhRBYH2WHHPkbq7o0Iee1sebS07615IDBRy?=
 =?us-ascii?Q?s52zkEFXpLKV+ky6+0IhNRCqblT7d8N2WV+R/Xm6nsv5R0s5EQsyWpboMyFH?=
 =?us-ascii?Q?MmuEe7jPwkMjfctgLzsV6+G/wZVQbP4Eg4PdVXDh3CDSRElZrb5+aqmW8NxY?=
 =?us-ascii?Q?gFPYEeEaRock8ExxMld09P0Pop+NfQoI/F4YEgJ1tRdSS7VtVx4QTFVwirmi?=
 =?us-ascii?Q?ZZF0QnoticKLOQDea7Smd7BCpjAKCxRlca2um+v18BnsXwF/NLIrGaNzQo6A?=
 =?us-ascii?Q?uND/HwLjdLd3SEL+voscs+s0TMZMX1ZvONOdAh9s38Tv/w5l+C1SYMCpec7b?=
 =?us-ascii?Q?gmJuGOL1oyhts4+ut0bV7bAB3sbOS2xddejfrLma+6J+rbOrA/YIxrOnHE58?=
 =?us-ascii?Q?4q8FSJhMieielr+MA8PMJ7htaJVxf/US+wZwcg+HWpCTRLPPt0c9EuRA17Kj?=
 =?us-ascii?Q?EWkdl431303I/2rCpCZ6HfTB0nqmq4AwIPp2e6LpsHD5LytIyCqrw6gnNnLX?=
 =?us-ascii?Q?FTbdwaY2hQ8QVHlZHggizx8OAwbz17n3WxER5CBZktFfFm6H6ce2zvfPjNut?=
 =?us-ascii?Q?2CYMOBCPAMYYOAy7ePTtW5Y4MkAME0rhLFNvwLq11bheolXLyjiQHyTgLb3c?=
 =?us-ascii?Q?VduI/EqgwMqHCOqqcM2K5vWigHa82JnJPz9TzgJY1MdBjHWou2SNU9H63cwa?=
 =?us-ascii?Q?vthzT7EQxYNCI6Ge+sYq9Kv/HxnN9lO51H48y5J4uB0ZvV8yUWLbNy7RBw5x?=
 =?us-ascii?Q?N8XgYylpGznrLHFIztJFltF7MmuABZzmNP7/8NQ9TB9o9zxncW9UdLstN23c?=
 =?us-ascii?Q?4B7+swvsuRUcpFGc6P/fKlWz+LJV7Bc4nOdLPk7UFfdj944TuOdBkSuYekdk?=
 =?us-ascii?Q?xYXAvrcI88sVVAGaka7kkOA2OFSmU9DNw3blJVbbl/YzKUvOtozoRBgM4P/+?=
 =?us-ascii?Q?z4MrgXHyMqz7mUv7ODWiGQ9dwOGWN6qozxUO1+n4jLLtuXvqV0aFysYVm1/E?=
 =?us-ascii?Q?d8hKga2o3vY41Ik3Mu2eP6kxKTloyoLuJcX3Avl3CRzCGl9KmKWa/ev+v/TG?=
 =?us-ascii?Q?hpqNRBNFjNrbW1ToSEwhOFB+ydFv37mpjWLQjLNpZyq/ZwPxyEi4NEzmnc0e?=
 =?us-ascii?Q?ErSKDh7gTqYJCPck+pl+cC7us2w7d2McCkbcmk+010FPY667A5Pcq4eJ5Xt6?=
 =?us-ascii?Q?Hi9/YQwJQHsFoPIFqz0YGytAz/l9BeC64c6fpE3z0GCuAoDBOTplvCICqBiX?=
 =?us-ascii?Q?Bg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db096836-3302-426a-49fd-08da68eb08e0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 18:26:30.5928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IulJAFYA9wM8/Oxb2PMEWP4Xy24ZfA/DbfwLuu/H/PHZukuh8PtVSipDlD1xqDIqg4LoYJKGbb3qxlS3ynWtlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1599
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
Cc: Dave Airlie <airlied@redhat.com>, intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 18, 2022 at 11:02:03AM +0100, Tvrtko Ursulin wrote:
> 
> Hi,
> 
> On 15/07/2022 23:54, Daniele Ceraolo Spurio wrote:
> > This patch re-introduces support for GuC v69 in parallel to v70. As this
> > is a quick fix, v69 has been re-introduced as the single "fallback" guc
> > version in case v70 is not available on disk. All v69 specific code has
> > been labeled as such for easy identification, and the same was done for
> > all v70 functions for which there is a separate v69 version, to avoid
> > accidentally calling the wrong version via the unlabeled name.
> > 
> > When the fallback mode kicks in, a drm_warn message is printed in dmesg
> > to warn the user of the required update.
> > 
> > The plan is to follow this up with a more complex rework to allow for
> > multiple different GuC versions to be supported at the same time.
> > 
> > Fixes: 2584b3549f4c ("drm/i915/guc: Update to GuC version 70.1.1")
> 
> Please check if I got this right:
> 
>  * ADL-P was out of "force probe" starting from 5.17.
>  * GuC fw got bumped from v62 to v69 in 5.18.

the team had looked to get v62 right now, but that would be too disruptive
and risky for the 5.19.

For now we are going with this fallback to v69 to solve the 5.19 regression.

Then look to solve the v62 regressions with the -stable fixes as a next step.

Dave had agreed with this approach.

Thanks,
Rodrigo.

btw:
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Does this mean you would also need to handle v62 to avoid regressing ADL-P
> from 5.17 to 5.18? I couldn't figure out when ADL-P switched from execlists
> to GuC due a bit convoluted supported/wanted/needed macros etc, so not
> entirely sure.
> 
> Secondly, my concern with the approach like in this patch is that it would
> grow the i915 code base *if* there is no incentive to keep the compatiblity
> breaking firware updates in check.
> 
> To think about in tandem with this is the question of whether many more
> fallback versions need to be handled, even for platforms which only use GuC
> to load HuC? Those would also regress in the media encoding side of things,
> even if they don't use GuC submission, right?
> 
> If this is so, the approach from this patch would feel rushed in my view.
> 
> There is also the question of being able to automatically load the latest
> _compatible_ (same major version) GuC fw found on disk. Aka allowing a
> bugfix firmware update which does not require a kernel update. In theory
> should be possible but we don't have that implemented either, right?
> 
> Regards,
> 
> Tvrtko
> 
> > Link: https://lists.freedesktop.org/archives/intel-gfx/2022-July/301640.html
> > Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> > Cc: John Harrison <John.C.Harrison@Intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Dave Airlie <airlied@redhat.com>
> > ---
> >   drivers/gpu/drm/i915/gt/intel_context_types.h |  11 +-
> >   .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   3 +
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   5 +
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  45 +++
> >   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 348 +++++++++++++++---
> >   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  57 ++-
> >   drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   7 +
> >   7 files changed, 419 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > index d2d75d9c0c8d..04eacae1aca5 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> > +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> > @@ -275,10 +275,17 @@ struct intel_context {
> >   		u8 child_index;
> >   		/** @guc: GuC specific members for parallel submission */
> >   		struct {
> > -			/** @wqi_head: head pointer in work queue */
> > +			/** @wqi_head: cached head pointer in work queue */
> >   			u16 wqi_head;
> > -			/** @wqi_tail: tail pointer in work queue */
> > +			/** @wqi_tail: cached tail pointer in work queue */
> >   			u16 wqi_tail;
> > +			/** @wq_head: pointer to the actual head in work queue */
> > +			u32 *wq_head;
> > +			/** @wq_tail: pointer to the actual head in work queue */
> > +			u32 *wq_tail;
> > +			/** @wq_status: pointer to the status in work queue */
> > +			u32 *wq_status;
> > +
> >   			/**
> >   			 * @parent_page: page in context state (ce->state) used
> >   			 * by parent for work queue, process descriptor
> > diff --git a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> > index 4ef9990ed7f8..29ef8afc8c2e 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h
> > @@ -122,6 +122,9 @@ enum intel_guc_action {
> >   	INTEL_GUC_ACTION_SCHED_CONTEXT_MODE_DONE = 0x1002,
> >   	INTEL_GUC_ACTION_SCHED_ENGINE_MODE_SET = 0x1003,
> >   	INTEL_GUC_ACTION_SCHED_ENGINE_MODE_DONE = 0x1004,
> > +	INTEL_GUC_ACTION_V69_SET_CONTEXT_PRIORITY = 0x1005,
> > +	INTEL_GUC_ACTION_V69_SET_CONTEXT_EXECUTION_QUANTUM = 0x1006,
> > +	INTEL_GUC_ACTION_V69_SET_CONTEXT_PREEMPTION_TIMEOUT = 0x1007,
> >   	INTEL_GUC_ACTION_CONTEXT_RESET_NOTIFICATION = 0x1008,
> >   	INTEL_GUC_ACTION_ENGINE_FAILURE_NOTIFICATION = 0x1009,
> >   	INTEL_GUC_ACTION_HOST2GUC_UPDATE_CONTEXT_POLICIES = 0x100B,
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index d0d99f178f2d..a7acffbf15d1 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -170,6 +170,11 @@ struct intel_guc {
> >   	/** @ads_engine_usage_size: size of engine usage in the ADS */
> >   	u32 ads_engine_usage_size;
> > +	/** @lrc_desc_pool_v69: object allocated to hold the GuC LRC descriptor pool */
> > +	struct i915_vma *lrc_desc_pool_v69;
> > +	/** @lrc_desc_pool_vaddr_v69: contents of the GuC LRC descriptor pool */
> > +	void *lrc_desc_pool_vaddr_v69;
> > +
> >   	/**
> >   	 * @context_lookup: used to resolve intel_context from guc_id, if a
> >   	 * context is present in this structure it is registered with the GuC
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > index b3c9a9327f76..323b055e5db9 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
> > @@ -204,6 +204,20 @@ struct guc_wq_item {
> >   	u32 fence_id;
> >   } __packed;
> > +struct guc_process_desc_v69 {
> > +	u32 stage_id;
> > +	u64 db_base_addr;
> > +	u32 head;
> > +	u32 tail;
> > +	u32 error_offset;
> > +	u64 wq_base_addr;
> > +	u32 wq_size_bytes;
> > +	u32 wq_status;
> > +	u32 engine_presence;
> > +	u32 priority;
> > +	u32 reserved[36];
> > +} __packed;
> > +
> >   struct guc_sched_wq_desc {
> >   	u32 head;
> >   	u32 tail;
> > @@ -228,6 +242,37 @@ struct guc_ctxt_registration_info {
> >   };
> >   #define CONTEXT_REGISTRATION_FLAG_KMD	BIT(0)
> > +/* Preempt to idle on quantum expiry */
> > +#define CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE_V69	BIT(0)
> > +
> > +/*
> > + * GuC Context registration descriptor.
> > + * FIXME: This is only required to exist during context registration.
> > + * The current 1:1 between guc_lrc_desc and LRCs for the lifetime of the LRC
> > + * is not required.
> > + */
> > +struct guc_lrc_desc_v69 {
> > +	u32 hw_context_desc;
> > +	u32 slpm_perf_mode_hint;	/* SPLC v1 only */
> > +	u32 slpm_freq_hint;
> > +	u32 engine_submit_mask;		/* In logical space */
> > +	u8 engine_class;
> > +	u8 reserved0[3];
> > +	u32 priority;
> > +	u32 process_desc;
> > +	u32 wq_addr;
> > +	u32 wq_size;
> > +	u32 context_flags;		/* CONTEXT_REGISTRATION_* */
> > +	/* Time for one workload to execute. (in micro seconds) */
> > +	u32 execution_quantum;
> > +	/* Time to wait for a preemption request to complete before issuing a
> > +	 * reset. (in micro seconds).
> > +	 */
> > +	u32 preemption_timeout;
> > +	u32 policy_flags;		/* CONTEXT_POLICY_* */
> > +	u32 reserved1[19];
> > +} __packed;
> > +
> >   /* 32-bit KLV structure as used by policy updates and others */
> >   struct guc_klv_generic_dw_t {
> >   	u32 kl;
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 40f726c61e95..aa10db25cc06 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -414,12 +414,15 @@ struct sync_semaphore {
> >   };
> >   struct parent_scratch {
> > -	struct guc_sched_wq_desc wq_desc;
> > +	union guc_descs {
> > +		struct guc_sched_wq_desc wq_desc;
> > +		struct guc_process_desc_v69 pdesc;
> > +	} descs;
> >   	struct sync_semaphore go;
> >   	struct sync_semaphore join[MAX_ENGINE_INSTANCE + 1];
> > -	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
> > +	u8 unused[WQ_OFFSET - sizeof(union guc_descs) -
> >   		sizeof(struct sync_semaphore) * (MAX_ENGINE_INSTANCE + 2)];
> >   	u32 wq[WQ_SIZE / sizeof(u32)];
> > @@ -456,17 +459,23 @@ __get_parent_scratch(struct intel_context *ce)
> >   		   LRC_STATE_OFFSET) / sizeof(u32)));
> >   }
> > +static struct guc_process_desc_v69 *
> > +__get_process_desc_v69(struct intel_context *ce)
> > +{
> > +	struct parent_scratch *ps = __get_parent_scratch(ce);
> > +
> > +	return &ps->descs.pdesc;
> > +}
> > +
> >   static struct guc_sched_wq_desc *
> > -__get_wq_desc(struct intel_context *ce)
> > +__get_wq_desc_v70(struct intel_context *ce)
> >   {
> >   	struct parent_scratch *ps = __get_parent_scratch(ce);
> > -	return &ps->wq_desc;
> > +	return &ps->descs.wq_desc;
> >   }
> > -static u32 *get_wq_pointer(struct guc_sched_wq_desc *wq_desc,
> > -			   struct intel_context *ce,
> > -			   u32 wqi_size)
> > +static u32 *get_wq_pointer(struct intel_context *ce, u32 wqi_size)
> >   {
> >   	/*
> >   	 * Check for space in work queue. Caching a value of head pointer in
> > @@ -476,7 +485,7 @@ static u32 *get_wq_pointer(struct guc_sched_wq_desc *wq_desc,
> >   #define AVAILABLE_SPACE	\
> >   	CIRC_SPACE(ce->parallel.guc.wqi_tail, ce->parallel.guc.wqi_head, WQ_SIZE)
> >   	if (wqi_size > AVAILABLE_SPACE) {
> > -		ce->parallel.guc.wqi_head = READ_ONCE(wq_desc->head);
> > +		ce->parallel.guc.wqi_head = READ_ONCE(*ce->parallel.guc.wq_head);
> >   		if (wqi_size > AVAILABLE_SPACE)
> >   			return NULL;
> > @@ -495,11 +504,55 @@ static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
> >   	return ce;
> >   }
> > +static struct guc_lrc_desc_v69 *__get_lrc_desc_v69(struct intel_guc *guc, u32 index)
> > +{
> > +	struct guc_lrc_desc_v69 *base = guc->lrc_desc_pool_vaddr_v69;
> > +
> > +	if (!base)
> > +		return NULL;
> > +
> > +	GEM_BUG_ON(index >= GUC_MAX_CONTEXT_ID);
> > +
> > +	return &base[index];
> > +}
> > +
> > +static int guc_lrc_desc_pool_create_v69(struct intel_guc *guc)
> > +{
> > +	u32 size;
> > +	int ret;
> > +
> > +	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc_v69) *
> > +			  GUC_MAX_CONTEXT_ID);
> > +	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool_v69,
> > +					     (void **)&guc->lrc_desc_pool_vaddr_v69);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> > +}
> > +
> > +static void guc_lrc_desc_pool_destroy_v69(struct intel_guc *guc)
> > +{
> > +	if (!guc->lrc_desc_pool_vaddr_v69)
> > +		return;
> > +
> > +	guc->lrc_desc_pool_vaddr_v69 = NULL;
> > +	i915_vma_unpin_and_release(&guc->lrc_desc_pool_v69, I915_VMA_RELEASE_MAP);
> > +}
> > +
> >   static inline bool guc_submission_initialized(struct intel_guc *guc)
> >   {
> >   	return guc->submission_initialized;
> >   }
> > +static inline void _reset_lrc_desc_v69(struct intel_guc *guc, u32 id)
> > +{
> > +	struct guc_lrc_desc_v69 *desc = __get_lrc_desc_v69(guc, id);
> > +
> > +	if (desc)
> > +		memset(desc, 0, sizeof(*desc));
> > +}
> > +
> >   static inline bool ctx_id_mapped(struct intel_guc *guc, u32 id)
> >   {
> >   	return __get_context(guc, id);
> > @@ -526,6 +579,8 @@ static inline void clr_ctx_id_mapping(struct intel_guc *guc, u32 id)
> >   	if (unlikely(!guc_submission_initialized(guc)))
> >   		return;
> > +	_reset_lrc_desc_v69(guc, id);
> > +
> >   	/*
> >   	 * xarray API doesn't have xa_erase_irqsave wrapper, so calling
> >   	 * the lower level functions directly.
> > @@ -611,7 +666,7 @@ int intel_guc_wait_for_idle(struct intel_guc *guc, long timeout)
> >   					      true, timeout);
> >   }
> > -static int guc_context_policy_init(struct intel_context *ce, bool loop);
> > +static int guc_context_policy_init_v70(struct intel_context *ce, bool loop);
> >   static int try_context_registration(struct intel_context *ce, bool loop);
> >   static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> > @@ -639,7 +694,7 @@ static int __guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> >   	GEM_BUG_ON(context_guc_id_invalid(ce));
> >   	if (context_policy_required(ce)) {
> > -		err = guc_context_policy_init(ce, false);
> > +		err = guc_context_policy_init_v70(ce, false);
> >   		if (err)
> >   			return err;
> >   	}
> > @@ -737,9 +792,7 @@ static u32 wq_space_until_wrap(struct intel_context *ce)
> >   	return (WQ_SIZE - ce->parallel.guc.wqi_tail);
> >   }
> > -static void write_wqi(struct guc_sched_wq_desc *wq_desc,
> > -		      struct intel_context *ce,
> > -		      u32 wqi_size)
> > +static void write_wqi(struct intel_context *ce, u32 wqi_size)
> >   {
> >   	BUILD_BUG_ON(!is_power_of_2(WQ_SIZE));
> > @@ -750,13 +803,12 @@ static void write_wqi(struct guc_sched_wq_desc *wq_desc,
> >   	ce->parallel.guc.wqi_tail = (ce->parallel.guc.wqi_tail + wqi_size) &
> >   		(WQ_SIZE - 1);
> > -	WRITE_ONCE(wq_desc->tail, ce->parallel.guc.wqi_tail);
> > +	WRITE_ONCE(*ce->parallel.guc.wq_tail, ce->parallel.guc.wqi_tail);
> >   }
> >   static int guc_wq_noop_append(struct intel_context *ce)
> >   {
> > -	struct guc_sched_wq_desc *wq_desc = __get_wq_desc(ce);
> > -	u32 *wqi = get_wq_pointer(wq_desc, ce, wq_space_until_wrap(ce));
> > +	u32 *wqi = get_wq_pointer(ce, wq_space_until_wrap(ce));
> >   	u32 len_dw = wq_space_until_wrap(ce) / sizeof(u32) - 1;
> >   	if (!wqi)
> > @@ -775,7 +827,6 @@ static int __guc_wq_item_append(struct i915_request *rq)
> >   {
> >   	struct intel_context *ce = request_to_scheduling_context(rq);
> >   	struct intel_context *child;
> > -	struct guc_sched_wq_desc *wq_desc = __get_wq_desc(ce);
> >   	unsigned int wqi_size = (ce->parallel.number_children + 4) *
> >   		sizeof(u32);
> >   	u32 *wqi;
> > @@ -795,7 +846,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
> >   			return ret;
> >   	}
> > -	wqi = get_wq_pointer(wq_desc, ce, wqi_size);
> > +	wqi = get_wq_pointer(ce, wqi_size);
> >   	if (!wqi)
> >   		return -EBUSY;
> > @@ -810,7 +861,7 @@ static int __guc_wq_item_append(struct i915_request *rq)
> >   	for_each_child(ce, child)
> >   		*wqi++ = child->ring->tail / sizeof(u64);
> > -	write_wqi(wq_desc, ce, wqi_size);
> > +	write_wqi(ce, wqi_size);
> >   	return 0;
> >   }
> > @@ -1812,20 +1863,34 @@ static void reset_fail_worker_func(struct work_struct *w);
> >   int intel_guc_submission_init(struct intel_guc *guc)
> >   {
> >   	struct intel_gt *gt = guc_to_gt(guc);
> > +	int ret;
> >   	if (guc->submission_initialized)
> >   		return 0;
> > +	if (guc->fw.major_ver_found < 70) {
> > +		ret = guc_lrc_desc_pool_create_v69(guc);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> >   	guc->submission_state.guc_ids_bitmap =
> >   		bitmap_zalloc(NUMBER_MULTI_LRC_GUC_ID(guc), GFP_KERNEL);
> > -	if (!guc->submission_state.guc_ids_bitmap)
> > -		return -ENOMEM;
> > +	if (!guc->submission_state.guc_ids_bitmap) {
> > +		ret = -ENOMEM;
> > +		goto destroy_pool;
> > +	}
> >   	guc->timestamp.ping_delay = (POLL_TIME_CLKS / gt->clock_frequency + 1) * HZ;
> >   	guc->timestamp.shift = gpm_timestamp_shift(gt);
> >   	guc->submission_initialized = true;
> >   	return 0;
> > +
> > +destroy_pool:
> > +	guc_lrc_desc_pool_destroy_v69(guc);
> > +
> > +	return ret;
> >   }
> >   void intel_guc_submission_fini(struct intel_guc *guc)
> > @@ -1834,6 +1899,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
> >   		return;
> >   	guc_flush_destroyed_contexts(guc);
> > +	guc_lrc_desc_pool_destroy_v69(guc);
> >   	i915_sched_engine_put(guc->sched_engine);
> >   	bitmap_free(guc->submission_state.guc_ids_bitmap);
> >   	guc->submission_initialized = false;
> > @@ -2091,10 +2157,34 @@ static void unpin_guc_id(struct intel_guc *guc, struct intel_context *ce)
> >   	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> >   }
> > -static int __guc_action_register_multi_lrc(struct intel_guc *guc,
> > +static int __guc_action_register_multi_lrc_v69(struct intel_guc *guc,
> >   					   struct intel_context *ce,
> > -					   struct guc_ctxt_registration_info *info,
> > +					   u32 guc_id,
> > +					   u32 offset,
> >   					   bool loop)
> > +{
> > +	struct intel_context *child;
> > +	u32 action[4 + MAX_ENGINE_INSTANCE];
> > +	int len = 0;
> > +
> > +	GEM_BUG_ON(ce->parallel.number_children > MAX_ENGINE_INSTANCE);
> > +
> > +	action[len++] = INTEL_GUC_ACTION_REGISTER_CONTEXT_MULTI_LRC;
> > +	action[len++] = guc_id;
> > +	action[len++] = ce->parallel.number_children + 1;
> > +	action[len++] = offset;
> > +	for_each_child(ce, child) {
> > +		offset += sizeof(struct guc_lrc_desc_v69);
> > +		action[len++] = offset;
> > +	}
> > +
> > +	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
> > +}
> > +
> > +static int __guc_action_register_multi_lrc_v70(struct intel_guc *guc,
> > +					       struct intel_context *ce,
> > +					       struct guc_ctxt_registration_info *info,
> > +					       bool loop)
> >   {
> >   	struct intel_context *child;
> >   	u32 action[13 + (MAX_ENGINE_INSTANCE * 2)];
> > @@ -2134,9 +2224,24 @@ static int __guc_action_register_multi_lrc(struct intel_guc *guc,
> >   	return guc_submission_send_busy_loop(guc, action, len, 0, loop);
> >   }
> > -static int __guc_action_register_context(struct intel_guc *guc,
> > -					 struct guc_ctxt_registration_info *info,
> > -					 bool loop)
> > +static int __guc_action_register_context_v69(struct intel_guc *guc,
> > +					     u32 guc_id,
> > +					     u32 offset,
> > +					     bool loop)
> > +{
> > +	u32 action[] = {
> > +		INTEL_GUC_ACTION_REGISTER_CONTEXT,
> > +		guc_id,
> > +		offset,
> > +	};
> > +
> > +	return guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> > +					     0, loop);
> > +}
> > +
> > +static int __guc_action_register_context_v70(struct intel_guc *guc,
> > +					     struct guc_ctxt_registration_info *info,
> > +					     bool loop)
> >   {
> >   	u32 action[] = {
> >   		INTEL_GUC_ACTION_REGISTER_CONTEXT,
> > @@ -2157,24 +2262,52 @@ static int __guc_action_register_context(struct intel_guc *guc,
> >   					     0, loop);
> >   }
> > -static void prepare_context_registration_info(struct intel_context *ce,
> > -					      struct guc_ctxt_registration_info *info);
> > +static void prepare_context_registration_info_v69(struct intel_context *ce);
> > +static void prepare_context_registration_info_v70(struct intel_context *ce,
> > +						  struct guc_ctxt_registration_info *info);
> > -static int register_context(struct intel_context *ce, bool loop)
> > +static int
> > +register_context_v69(struct intel_guc *guc, struct intel_context *ce, bool loop)
> > +{
> > +	u32 offset = intel_guc_ggtt_offset(guc, guc->lrc_desc_pool_v69) +
> > +		ce->guc_id.id * sizeof(struct guc_lrc_desc_v69);
> > +
> > +	prepare_context_registration_info_v69(ce);
> > +
> > +	if (intel_context_is_parent(ce))
> > +		return __guc_action_register_multi_lrc_v69(guc, ce, ce->guc_id.id,
> > +							   offset, loop);
> > +	else
> > +		return __guc_action_register_context_v69(guc, ce->guc_id.id,
> > +							 offset, loop);
> > +}
> > +
> > +static int
> > +register_context_v70(struct intel_guc *guc, struct intel_context *ce, bool loop)
> >   {
> >   	struct guc_ctxt_registration_info info;
> > +
> > +	prepare_context_registration_info_v70(ce, &info);
> > +
> > +	if (intel_context_is_parent(ce))
> > +		return __guc_action_register_multi_lrc_v70(guc, ce, &info, loop);
> > +	else
> > +		return __guc_action_register_context_v70(guc, &info, loop);
> > +}
> > +
> > +static int register_context(struct intel_context *ce, bool loop)
> > +{
> >   	struct intel_guc *guc = ce_to_guc(ce);
> >   	int ret;
> >   	GEM_BUG_ON(intel_context_is_child(ce));
> >   	trace_intel_context_register(ce);
> > -	prepare_context_registration_info(ce, &info);
> > -
> > -	if (intel_context_is_parent(ce))
> > -		ret = __guc_action_register_multi_lrc(guc, ce, &info, loop);
> > +	if (guc->fw.major_ver_found >= 70)
> > +		ret = register_context_v70(guc, ce, loop);
> >   	else
> > -		ret = __guc_action_register_context(guc, &info, loop);
> > +		ret = register_context_v69(guc, ce, loop);
> > +
> >   	if (likely(!ret)) {
> >   		unsigned long flags;
> > @@ -2182,7 +2315,8 @@ static int register_context(struct intel_context *ce, bool loop)
> >   		set_context_registered(ce);
> >   		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> > -		guc_context_policy_init(ce, loop);
> > +		if (guc->fw.major_ver_found >= 70)
> > +			guc_context_policy_init_v70(ce, loop);
> >   	}
> >   	return ret;
> > @@ -2279,7 +2413,7 @@ static int __guc_context_set_context_policies(struct intel_guc *guc,
> >   					0, loop);
> >   }
> > -static int guc_context_policy_init(struct intel_context *ce, bool loop)
> > +static int guc_context_policy_init_v70(struct intel_context *ce, bool loop)
> >   {
> >   	struct intel_engine_cs *engine = ce->engine;
> >   	struct intel_guc *guc = &engine->gt->uc.guc;
> > @@ -2338,6 +2472,19 @@ static int guc_context_policy_init(struct intel_context *ce, bool loop)
> >   	return ret;
> >   }
> > +static void guc_context_policy_init_v69(struct intel_engine_cs *engine,
> > +					struct guc_lrc_desc_v69 *desc)
> > +{
> > +	desc->policy_flags = 0;
> > +
> > +	if (engine->flags & I915_ENGINE_WANT_FORCED_PREEMPTION)
> > +		desc->policy_flags |= CONTEXT_POLICY_FLAG_PREEMPT_TO_IDLE_V69;
> > +
> > +	/* NB: For both of these, zero means disabled. */
> > +	desc->execution_quantum = engine->props.timeslice_duration_ms * 1000;
> > +	desc->preemption_timeout = engine->props.preempt_timeout_ms * 1000;
> > +}
> > +
> >   static u32 map_guc_prio_to_lrc_desc_prio(u8 prio)
> >   {
> >   	/*
> > @@ -2358,8 +2505,75 @@ static u32 map_guc_prio_to_lrc_desc_prio(u8 prio)
> >   	}
> >   }
> > -static void prepare_context_registration_info(struct intel_context *ce,
> > -					      struct guc_ctxt_registration_info *info)
> > +static void prepare_context_registration_info_v69(struct intel_context *ce)
> > +{
> > +	struct intel_engine_cs *engine = ce->engine;
> > +	struct intel_guc *guc = &engine->gt->uc.guc;
> > +	u32 ctx_id = ce->guc_id.id;
> > +	struct guc_lrc_desc_v69 *desc;
> > +	struct intel_context *child;
> > +
> > +	GEM_BUG_ON(!engine->mask);
> > +
> > +	/*
> > +	 * Ensure LRC + CT vmas are is same region as write barrier is done
> > +	 * based on CT vma region.
> > +	 */
> > +	GEM_BUG_ON(i915_gem_object_is_lmem(guc->ct.vma->obj) !=
> > +		   i915_gem_object_is_lmem(ce->ring->vma->obj));
> > +
> > +	desc = __get_lrc_desc_v69(guc, ctx_id);
> > +	desc->engine_class = engine_class_to_guc_class(engine->class);
> > +	desc->engine_submit_mask = engine->logical_mask;
> > +	desc->hw_context_desc = ce->lrc.lrca;
> > +	desc->priority = ce->guc_state.prio;
> > +	desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> > +	guc_context_policy_init_v69(engine, desc);
> > +
> > +	/*
> > +	 * If context is a parent, we need to register a process descriptor
> > +	 * describing a work queue and register all child contexts.
> > +	 */
> > +	if (intel_context_is_parent(ce)) {
> > +		struct guc_process_desc_v69 *pdesc;
> > +
> > +		ce->parallel.guc.wqi_tail = 0;
> > +		ce->parallel.guc.wqi_head = 0;
> > +
> > +		desc->process_desc = i915_ggtt_offset(ce->state) +
> > +			__get_parent_scratch_offset(ce);
> > +		desc->wq_addr = i915_ggtt_offset(ce->state) +
> > +			__get_wq_offset(ce);
> > +		desc->wq_size = WQ_SIZE;
> > +
> > +		pdesc = __get_process_desc_v69(ce);
> > +		memset(pdesc, 0, sizeof(*(pdesc)));
> > +		pdesc->stage_id = ce->guc_id.id;
> > +		pdesc->wq_base_addr = desc->wq_addr;
> > +		pdesc->wq_size_bytes = desc->wq_size;
> > +		pdesc->wq_status = WQ_STATUS_ACTIVE;
> > +
> > +		ce->parallel.guc.wq_head = &pdesc->head;
> > +		ce->parallel.guc.wq_tail = &pdesc->tail;
> > +		ce->parallel.guc.wq_status = &pdesc->wq_status;
> > +
> > +		for_each_child(ce, child) {
> > +			desc = __get_lrc_desc_v69(guc, child->guc_id.id);
> > +
> > +			desc->engine_class =
> > +				engine_class_to_guc_class(engine->class);
> > +			desc->hw_context_desc = child->lrc.lrca;
> > +			desc->priority = ce->guc_state.prio;
> > +			desc->context_flags = CONTEXT_REGISTRATION_FLAG_KMD;
> > +			guc_context_policy_init_v69(engine, desc);
> > +		}
> > +
> > +		clear_children_join_go_memory(ce);
> > +	}
> > +}
> > +
> > +static void prepare_context_registration_info_v70(struct intel_context *ce,
> > +						  struct guc_ctxt_registration_info *info)
> >   {
> >   	struct intel_engine_cs *engine = ce->engine;
> >   	struct intel_guc *guc = &engine->gt->uc.guc;
> > @@ -2409,10 +2623,14 @@ static void prepare_context_registration_info(struct intel_context *ce,
> >   		info->wq_base_hi = upper_32_bits(wq_base_offset);
> >   		info->wq_size = WQ_SIZE;
> > -		wq_desc = __get_wq_desc(ce);
> > +		wq_desc = __get_wq_desc_v70(ce);
> >   		memset(wq_desc, 0, sizeof(*wq_desc));
> >   		wq_desc->wq_status = WQ_STATUS_ACTIVE;
> > +		ce->parallel.guc.wq_head = &wq_desc->head;
> > +		ce->parallel.guc.wq_tail = &wq_desc->tail;
> > +		ce->parallel.guc.wq_status = &wq_desc->wq_status;
> > +
> >   		clear_children_join_go_memory(ce);
> >   	}
> >   }
> > @@ -2727,11 +2945,21 @@ static void __guc_context_set_preemption_timeout(struct intel_guc *guc,
> >   						 u16 guc_id,
> >   						 u32 preemption_timeout)
> >   {
> > -	struct context_policy policy;
> > +	if (guc->fw.major_ver_found >= 70) {
> > +		struct context_policy policy;
> > -	__guc_context_policy_start_klv(&policy, guc_id);
> > -	__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
> > -	__guc_context_set_context_policies(guc, &policy, true);
> > +		__guc_context_policy_start_klv(&policy, guc_id);
> > +		__guc_context_policy_add_preemption_timeout(&policy, preemption_timeout);
> > +		__guc_context_set_context_policies(guc, &policy, true);
> > +	} else {
> > +		u32 action[] = {
> > +			INTEL_GUC_ACTION_V69_SET_CONTEXT_PREEMPTION_TIMEOUT,
> > +			guc_id,
> > +			preemption_timeout
> > +		};
> > +
> > +		intel_guc_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> > +	}
> >   }
> >   static void
> > @@ -2982,11 +3210,21 @@ static int guc_context_alloc(struct intel_context *ce)
> >   static void __guc_context_set_prio(struct intel_guc *guc,
> >   				   struct intel_context *ce)
> >   {
> > -	struct context_policy policy;
> > +	if (guc->fw.major_ver_found >= 70) {
> > +		struct context_policy policy;
> > -	__guc_context_policy_start_klv(&policy, ce->guc_id.id);
> > -	__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
> > -	__guc_context_set_context_policies(guc, &policy, true);
> > +		__guc_context_policy_start_klv(&policy, ce->guc_id.id);
> > +		__guc_context_policy_add_priority(&policy, ce->guc_state.prio);
> > +		__guc_context_set_context_policies(guc, &policy, true);
> > +	} else {
> > +		u32 action[] = {
> > +			INTEL_GUC_ACTION_V69_SET_CONTEXT_PRIORITY,
> > +			ce->guc_id.id,
> > +			ce->guc_state.prio,
> > +		};
> > +
> > +		guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action), 0, true);
> > +	}
> >   }
> >   static void guc_context_set_prio(struct intel_guc *guc,
> > @@ -4496,17 +4734,19 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
> >   		guc_log_context_priority(p, ce);
> >   		if (intel_context_is_parent(ce)) {
> > -			struct guc_sched_wq_desc *wq_desc = __get_wq_desc(ce);
> >   			struct intel_context *child;
> >   			drm_printf(p, "\t\tNumber children: %u\n",
> >   				   ce->parallel.number_children);
> > -			drm_printf(p, "\t\tWQI Head: %u\n",
> > -				   READ_ONCE(wq_desc->head));
> > -			drm_printf(p, "\t\tWQI Tail: %u\n",
> > -				   READ_ONCE(wq_desc->tail));
> > -			drm_printf(p, "\t\tWQI Status: %u\n\n",
> > -				   READ_ONCE(wq_desc->wq_status));
> > +
> > +			if (ce->parallel.guc.wq_status) {
> > +				drm_printf(p, "\t\tWQI Head: %u\n",
> > +					   READ_ONCE(*ce->parallel.guc.wq_head));
> > +				drm_printf(p, "\t\tWQI Tail: %u\n",
> > +					   READ_ONCE(*ce->parallel.guc.wq_tail));
> > +				drm_printf(p, "\t\tWQI Status: %u\n\n",
> > +					   READ_ONCE(*ce->parallel.guc.wq_status));
> > +			}
> >   			if (ce->engine->emit_bb_start ==
> >   			    emit_bb_start_parent_no_preempt_mid_batch) {
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > index 27363091e1af..210c84411406 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
> > @@ -70,6 +70,23 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
> >   	fw_def(BROXTON,      0, guc_def(bxt,  70, 1, 1)) \
> >   	fw_def(SKYLAKE,      0, guc_def(skl,  70, 1, 1))
> > +#define INTEL_GUC_FIRMWARE_DEFS_FALLBACK(fw_def, guc_def) \
> > +	fw_def(ALDERLAKE_P,  0, guc_def(adlp, 69, 0, 3)) \
> > +	fw_def(ALDERLAKE_S,  0, guc_def(tgl,  69, 0, 3)) \
> > +	fw_def(DG1,          0, guc_def(dg1,  69, 0, 3)) \
> > +	fw_def(ROCKETLAKE,   0, guc_def(tgl,  69, 0, 3)) \
> > +	fw_def(TIGERLAKE,    0, guc_def(tgl,  69, 0, 3)) \
> > +	fw_def(JASPERLAKE,   0, guc_def(ehl,  69, 0, 3)) \
> > +	fw_def(ELKHARTLAKE,  0, guc_def(ehl,  69, 0, 3)) \
> > +	fw_def(ICELAKE,      0, guc_def(icl,  69, 0, 3)) \
> > +	fw_def(COMETLAKE,    5, guc_def(cml,  69, 0, 3)) \
> > +	fw_def(COMETLAKE,    0, guc_def(kbl,  69, 0, 3)) \
> > +	fw_def(COFFEELAKE,   0, guc_def(kbl,  69, 0, 3)) \
> > +	fw_def(GEMINILAKE,   0, guc_def(glk,  69, 0, 3)) \
> > +	fw_def(KABYLAKE,     0, guc_def(kbl,  69, 0, 3)) \
> > +	fw_def(BROXTON,      0, guc_def(bxt,  69, 0, 3)) \
> > +	fw_def(SKYLAKE,      0, guc_def(skl,  69, 0, 3))
> > +
> >   #define INTEL_HUC_FIRMWARE_DEFS(fw_def, huc_def) \
> >   	fw_def(ALDERLAKE_P,  0, huc_def(tgl,  7, 9, 3)) \
> >   	fw_def(ALDERLAKE_S,  0, huc_def(tgl,  7, 9, 3)) \
> > @@ -105,6 +122,7 @@ void intel_uc_fw_change_status(struct intel_uc_fw *uc_fw,
> >   	MODULE_FIRMWARE(uc_);
> >   INTEL_GUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
> > +INTEL_GUC_FIRMWARE_DEFS_FALLBACK(INTEL_UC_MODULE_FW, MAKE_GUC_FW_PATH)
> >   INTEL_HUC_FIRMWARE_DEFS(INTEL_UC_MODULE_FW, MAKE_HUC_FW_PATH)
> >   /* The below structs and macros are used to iterate across the list of blobs */
> > @@ -149,6 +167,9 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
> >   	static const struct uc_fw_platform_requirement blobs_guc[] = {
> >   		INTEL_GUC_FIRMWARE_DEFS(MAKE_FW_LIST, GUC_FW_BLOB)
> >   	};
> > +	static const struct uc_fw_platform_requirement blobs_guc_fallback[] = {
> > +		INTEL_GUC_FIRMWARE_DEFS_FALLBACK(MAKE_FW_LIST, GUC_FW_BLOB)
> > +	};
> >   	static const struct uc_fw_platform_requirement blobs_huc[] = {
> >   		INTEL_HUC_FIRMWARE_DEFS(MAKE_FW_LIST, HUC_FW_BLOB)
> >   	};
> > @@ -179,12 +200,28 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
> >   		if (p == fw_blobs[i].p && rev >= fw_blobs[i].rev) {
> >   			const struct uc_fw_blob *blob = &fw_blobs[i].blob;
> >   			uc_fw->path = blob->path;
> > +			uc_fw->wanted_path = blob->path;
> >   			uc_fw->major_ver_wanted = blob->major;
> >   			uc_fw->minor_ver_wanted = blob->minor;
> >   			break;
> >   		}
> >   	}
> > +	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC) {
> > +		const struct uc_fw_platform_requirement *blobs = blobs_guc_fallback;
> > +		u32 count = ARRAY_SIZE(blobs_guc_fallback);
> > +
> > +		for (i = 0; i < count && p <= blobs[i].p; i++) {
> > +			if (p == blobs[i].p && rev >= blobs[i].rev) {
> > +				const struct uc_fw_blob *blob = &blobs[i].blob;
> > +				uc_fw->fallback.path = blob->path;
> > +				uc_fw->fallback.major_ver = blob->major;
> > +				uc_fw->fallback.minor_ver = blob->minor;
> > +				break;
> > +			}
> > +		}
> > +	}
> > +
> >   	/* make sure the list is ordered as expected */
> >   	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST)) {
> >   		for (i = 1; i < fw_count; i++) {
> > @@ -413,6 +450,18 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
> >   	__force_fw_fetch_failures(uc_fw, -ESTALE);
> >   	err = request_firmware(&fw, uc_fw->path, dev);
> > +	if (err && !intel_uc_fw_is_overridden(uc_fw) && uc_fw->fallback.path) {
> > +		err = request_firmware(&fw, uc_fw->fallback.path, dev);
> > +		if (!err) {
> > +			drm_warn(&i915->drm, "%s firmware %s not found, falling back to %s\n",
> > +					     intel_uc_fw_type_repr(uc_fw->type),
> > +					     uc_fw->wanted_path,
> > +					     uc_fw->fallback.path);
> > +			uc_fw->path = uc_fw->fallback.path;
> > +			uc_fw->major_ver_wanted = uc_fw->fallback.major_ver;
> > +			uc_fw->minor_ver_wanted = uc_fw->fallback.minor_ver;
> > +		}
> > +	}
> >   	if (err)
> >   		goto fail;
> > @@ -822,7 +871,13 @@ size_t intel_uc_fw_copy_rsa(struct intel_uc_fw *uc_fw, void *dst, u32 max_len)
> >   void intel_uc_fw_dump(const struct intel_uc_fw *uc_fw, struct drm_printer *p)
> >   {
> >   	drm_printf(p, "%s firmware: %s\n",
> > -		   intel_uc_fw_type_repr(uc_fw->type), uc_fw->path);
> > +		   intel_uc_fw_type_repr(uc_fw->type), uc_fw->wanted_path);
> > +	if (uc_fw->fallback.path) {
> > +		drm_printf(p, "%s firmware fallback: %s\n",
> > +			   intel_uc_fw_type_repr(uc_fw->type), uc_fw->fallback.path);
> > +		drm_printf(p, "fallback selected: %s\n",
> > +			   str_yes_no(uc_fw->path == uc_fw->fallback.path));
> > +	}
> >   	drm_printf(p, "\tstatus: %s\n",
> >   		   intel_uc_fw_status_repr(uc_fw->status));
> >   	drm_printf(p, "\tversion: wanted %u.%u, found %u.%u\n",
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> > index 4f169035f504..7aa2644400b9 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
> > @@ -74,6 +74,7 @@ struct intel_uc_fw {
> >   		const enum intel_uc_fw_status status;
> >   		enum intel_uc_fw_status __status; /* no accidental overwrites */
> >   	};
> > +	const char *wanted_path;
> >   	const char *path;
> >   	bool user_overridden;
> >   	size_t size;
> > @@ -98,6 +99,12 @@ struct intel_uc_fw {
> >   	u16 major_ver_found;
> >   	u16 minor_ver_found;
> > +	struct {
> > +		const char *path;
> > +		u16 major_ver;
> > +		u16 minor_ver;
> > +	} fallback;
> > +
> >   	u32 rsa_size;
> >   	u32 ucode_size;
