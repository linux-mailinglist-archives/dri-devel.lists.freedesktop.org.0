Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BE5666329
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 19:55:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5AE10E7A5;
	Wed, 11 Jan 2023 18:55:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9229210E7A0;
 Wed, 11 Jan 2023 18:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673463336; x=1704999336;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3rRdYglDZbf2g05mc63ZARZoIvfIyjfaddCgQgnBxiA=;
 b=g0CNuTZufMJmYpatoCMvhIiuqH4G/S65pqI5MGFEZZFjftq000tSlacm
 Yee/3XWrs3xA7zzS82WcxGUELNasOxJ8Dgkw6qE8gFwDEFNssTbnIeLp8
 aWafU24JLZgmWZ0kMQDKqz//OS1mU3lRBShYamIzyOqrd2jqicYKHoU2S
 ksLwXvmVHby1XMqRKiLgv8QDNA+elnectphK9YLHtbxWcWSRamItFy2cX
 wqT6MJ72M0oAfSrKMwx4i8/eO4gOBuyepjMVftRwVr+3WSirvUB0lETts
 o8STwnnZIgDvylcs7SiwNG6/vgxtA5kf629KZnENpz5CfGrykNrRICkKf g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="307029016"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="307029016"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 10:55:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="765269042"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="765269042"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP; 11 Jan 2023 10:55:34 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 10:55:34 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 10:55:33 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 11 Jan 2023 10:55:33 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 11 Jan 2023 10:55:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dGRlAtVyOguXVhtbqOjwWzIzjY92TBrHttgZgFiAvcw1yGzUvMLwqcgcpaj/zazrX72hzxChtkRC8MMzAqmKIfGNZxzYns7E0HJl4OJX/pr0/bNXxvsPy8Mqb88Liik1zyPDwhsbZzT8oPyvwZK+BAZz7FzFB1ujhaWit03P76rEmRbgyZXNqfYJ1Yctt++PU6HNlEpnbjbnDjZlCBizJJOoRi2aLZzMvyPXvJV/E29+7GRt95eQ1n+pjuETLIYvFKLGFsLBncLYVIFFIe4IC/bx3xPz3avI1isJFFQu3yXQ8e5V8Z3PweFvZ0XWg1tRexg5cDWUeeq9+l0LAuzn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFWMZZ8laF09S1l25yvmzqW+YzMJ7ZjOUjJIgJGA0LE=;
 b=YOVytdZRzfstLwnlTcaWayhU+Z0EP9otYIs9rLr9zJ2MJlxmED0uBSGzyVGKzCZeRWGi8HF6WmLqj09oyATz7aoYPhGVbeyrjY5vPr6rbN0keDuEqc4UXNztMd275wHr2CmvJj8w5Mg0ix1+a+L8kdVoPwnhYadsetspBL8DxPAfKtBraLDVbEA0dGpjqb+2ul5zwxsYmgQdLplU1ab/WOpQsBIOXDwxVbSpTs4WNXp1ThbdEOPH3XZb/h6t8MtLyQTvTLT84pD+VIBQBrwWlHTtc0hkJfW9K48yy4p3PKotLvElI520H+7ky0Tr50ELCC5iDB3HDis4zzEE1O5ehg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA1PR11MB5897.namprd11.prod.outlook.com (2603:10b6:806:228::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Wed, 11 Jan
 2023 18:55:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.5986.018; Wed, 11 Jan 2023
 18:55:30 +0000
Date: Wed, 11 Jan 2023 18:55:16 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler
 to use a work queue rather than kthread
Message-ID: <Y78GFFB90EQUUn5T@DUT025-TGLU.fm.intel.com>
References: <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <3b1af19f-3500-3be8-9d28-ac7da5b7d728@linux.intel.com>
 <Y72KdvHchbAzbYW2@DUT025-TGLU.fm.intel.com>
 <b3225349-85fa-b30a-319c-604334e2f7e2@linux.intel.com>
 <Y722HdwGKB8swy0B@DUT025-TGLU.fm.intel.com>
 <703310df-21c8-57ac-8b27-4ae342265df1@linux.intel.com>
 <Y776yIC+iJDlchjo@DUT025-TGLU.fm.intel.com>
 <2bad7ddc-05e5-89f3-11b9-160df10ddd3b@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2bad7ddc-05e5-89f3-11b9-160df10ddd3b@intel.com>
X-ClientProxiedBy: SJ0PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA1PR11MB5897:EE_
X-MS-Office365-Filtering-Correlation-Id: 140bcddb-465e-40ee-3daa-08daf405694a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WbbSSgFJ9Puhb5niXAYVW//7LA2Lol8wFjOj+IBBn+S4jMpP8vAV9hLsG2cfAPguGsbJM4JTZMcad5YEM5k3SZhaB0z6flBJW4/Kjf3gd0MTE8sVWDDU5Rs03QrRO9BNCKv2KsKqlWncir8u62SoXoku8lmJ8MKYqidBuUK47HGEkX1ic9ifBzvI0g3mVdyZvND/HQAozPeIE3+wrv6cmK4jDwDZeWJX32lhRjICukPYmkoxTuWViBIRMdEZRLWWEvQCagaPIAq1e0Ayym42bSGMhEes1QcOKImxg+Y3v6S5v5CxqlAF78J4WzDeYohGc7VS/xWZtqfapD574uKyRKW4we00sp0yFFAB/yfQiBPEAaJuoOuknUi9D3zPleCVWIHGjk1JWY900n8IR3jXcz16SL2MvHunicT8k66Xl/jizXOpY1F5gBpsFoEbSu21OiHOg7zZCI3wPbaY/KDrPS2EX+GBUsy5a20NoxOWt1zdOkTuPewdKeU1sbyepnSTAQdTdFVavCykm/F5+f86Ia1NtNpqJ8T4RYygafPuWpbLKOWn3GYiBie1KogU289nAIAGQNV8yhDUQcehVc7jvGjd51ES5jOyCVhXJUfALqPdIskM7qLmdmzv1YIq8Of9Usz5AzxkkMcipLokZib+KWSBTkZ5nALy/BunIKsqvkWYyMsLuXsLPs7eYA8/+oRk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(346002)(366004)(396003)(136003)(39860400002)(376002)(451199015)(66946007)(4326008)(6862004)(41300700001)(316002)(8676002)(66556008)(66476007)(86362001)(8936002)(83380400001)(38100700002)(5660300002)(44832011)(82960400001)(6636002)(6486002)(2906002)(6506007)(6512007)(53546011)(478600001)(186003)(66899015)(26005)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ZMhwW67XLGaslWMl9ChaE1GnQHEmm+oD42YN1R/G9VI/CU/o6BfocZ3Zvy?=
 =?iso-8859-1?Q?yVCzwzrsIrk37QKYH2DIGGTZn8hc1FX0PADbUrK+awgsL31jn+6OpFBKCC?=
 =?iso-8859-1?Q?wjYXC8FERVe4RS7hhKYyK99hu9eUhTl+Q9kcQvN7IEPBpsaW27SwGK8xgb?=
 =?iso-8859-1?Q?ccaqDSd8fK0Klwqu7dJOR1nhFtewzFizeibIrFOv2sBhRHB48wve5VcQln?=
 =?iso-8859-1?Q?fZG8uXnvjMCUPjyRulUQmay2Zz2vpN8aMqYC3ENUTW8pJvK3Eq8o5IKhlq?=
 =?iso-8859-1?Q?QXLE2RZmgvkPDivEy7fl/jXvQvs5bd7qLZFX8+IOCtOJX6iKus1lyMuMO+?=
 =?iso-8859-1?Q?DMwfIY1Q6WDeq+OvtotB1XxniOkXCHQVRes6Nl8UMD4MY1a97RFMqZB1q5?=
 =?iso-8859-1?Q?w9T3Kkp9zQKYh7oxLwEPFtL8eUQ3ftnWiKfu2ryy6XRuXo4IRi4NyPqLv4?=
 =?iso-8859-1?Q?jzwqKEL9psuKnAqG2I/rlxF1cDeDCmgkFv2U32bH6NFXpimKQznLREJkJI?=
 =?iso-8859-1?Q?7sbDAifWkCtJe4o+0AVNO+E9WRmyEoO+j1vv5M5Zps9f5l8a09+HGj6VUX?=
 =?iso-8859-1?Q?wSv9hYyLbHQbJlCOEK7Hp7LGuyvqinNvFOb15/UTt8ey0Krz89chRdeK0U?=
 =?iso-8859-1?Q?5xOT8smmFmWV+U1bjvxrnEcryzqy7Jmjkyvpa8oxSM8UKvRCqVgxFSOrmQ?=
 =?iso-8859-1?Q?m7p6J1nSd3mmqaxBThtb2OWW0bEnJ83GyCAjUHCXyp2As0n2z+3sz5Vrod?=
 =?iso-8859-1?Q?BIp07un91b2z5T0P7QFHZKqmNTr5e9idxaSRXnQ4LnMjpmJPGD7t0vUSLz?=
 =?iso-8859-1?Q?PyIvB8bt/ZJZcFaNP4xqUkxUjQ70aLcdC1bg+2CDV6Gw4qYUh2NSR/5Pzm?=
 =?iso-8859-1?Q?W5TdPUBWUMzITGR10TOtNB4faMttwa4KD550gjeUKqb4PNJtsQshaei8cf?=
 =?iso-8859-1?Q?fuQ7arVbIyBv2zGlsjyx/GiHs7f8ulFT7yQLS5sLR8BxWTdle807ca/S3D?=
 =?iso-8859-1?Q?0l6QEm9l1AwlL4XaYKcXw4K+4P+ffZlcL6s/PMyw05npJIpeR/nqG64B5Q?=
 =?iso-8859-1?Q?Xo3OMivpJnqu3nurKNM8G3JRdwe9aj96FYczgGxYAys//HFUX44ldkfl4K?=
 =?iso-8859-1?Q?gctIza7taw/c8q0LKi/k58ztsBykx1wX95R7xafismOSebblwUfyGdzTC1?=
 =?iso-8859-1?Q?djH7svWqr/TrT81oAqTwEtFL0csj5E/Q3ZKyNojI54Pic7vE73K6qet88q?=
 =?iso-8859-1?Q?W+BvYkXRRwX9GhUwZkTV4ovIcSWrEDvLxUEAs3F6ULsWCLFLoASDKEdzEd?=
 =?iso-8859-1?Q?tit9icVKVSlXuvwxmfgn7pL0YSwEXx2CsmRItOSDkF0vMNrT9o6or1K94c?=
 =?iso-8859-1?Q?IXNGDt1ypze67dD8jX8QQyO+kYVzrh9D+YiSUjQiyKJPZYVRDCwWpj3nGk?=
 =?iso-8859-1?Q?Fol7rCY1L/e71rIJPMoWLWSNalvh0oQH3OU9c4MpFIGPSx7tj/xXqyP0mi?=
 =?iso-8859-1?Q?ruCX55GsvCb9b8Ai2aGkNc+eAUuex28fCdgcxb3FohoZKnA22YMOpUBDIA?=
 =?iso-8859-1?Q?KTLLPIq1FSyQUPFWl8bw/Ffd8+1tHN85QZW5zAQbmODDn9CJzBQQrz2iy5?=
 =?iso-8859-1?Q?yqFwv3x6EfXji7zVmgStBmdLoG369nmcO3PN5ZO3WE+PrN3EAziPrc4w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 140bcddb-465e-40ee-3daa-08daf405694a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 18:55:30.5770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Z+lt8yA9iPQRyHu26OtRLExzsER49VGFDaC3AnBXDNgr53czetL3emZatlR5zb+cPAXUY3EVRiYK4Cikzaj0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5897
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 10:52:54AM -0800, John Harrison wrote:
> On 1/11/2023 10:07, Matthew Brost wrote:
> > On Wed, Jan 11, 2023 at 09:17:01AM +0000, Tvrtko Ursulin wrote:
> > > On 10/01/2023 19:01, Matthew Brost wrote:
> > > > On Tue, Jan 10, 2023 at 04:50:55PM +0000, Tvrtko Ursulin wrote:
> > > > > On 10/01/2023 15:55, Matthew Brost wrote:
> > > > > > On Tue, Jan 10, 2023 at 12:19:35PM +0000, Tvrtko Ursulin wrote:
> > > > > > > On 10/01/2023 11:28, Tvrtko Ursulin wrote:
> > > > > > > > On 09/01/2023 17:27, Jason Ekstrand wrote:
> > > > > > > > 
> > > > > > > > [snip]
> > > > > > > > 
> > > > > > > > >         >>> AFAICT it proposes to have 1:1 between *userspace* created
> > > > > > > > >        contexts (per
> > > > > > > > >         >>> context _and_ engine) and drm_sched. I am not sure avoiding
> > > > > > > > >        invasive changes
> > > > > > > > >         >>> to the shared code is in the spirit of the overall idea and
> > > > > > > > > instead
> > > > > > > > >         >>> opportunity should be used to look at way to refactor/improve
> > > > > > > > >        drm_sched.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Maybe?  I'm not convinced that what Xe is doing is an abuse at all
> > > > > > > > > or really needs to drive a re-factor.  (More on that later.)
> > > > > > > > > There's only one real issue which is that it fires off potentially a
> > > > > > > > > lot of kthreads. Even that's not that bad given that kthreads are
> > > > > > > > > pretty light and you're not likely to have more kthreads than
> > > > > > > > > userspace threads which are much heavier.  Not ideal, but not the
> > > > > > > > > end of the world either.  Definitely something we can/should
> > > > > > > > > optimize but if we went through with Xe without this patch, it would
> > > > > > > > > probably be mostly ok.
> > > > > > > > > 
> > > > > > > > >         >> Yes, it is 1:1 *userspace* engines and drm_sched.
> > > > > > > > >         >>
> > > > > > > > >         >> I'm not really prepared to make large changes to DRM scheduler
> > > > > > > > >        at the
> > > > > > > > >         >> moment for Xe as they are not really required nor does Boris
> > > > > > > > >        seem they
> > > > > > > > >         >> will be required for his work either. I am interested to see
> > > > > > > > >        what Boris
> > > > > > > > >         >> comes up with.
> > > > > > > > >         >>
> > > > > > > > >         >>> Even on the low level, the idea to replace drm_sched threads
> > > > > > > > >        with workers
> > > > > > > > >         >>> has a few problems.
> > > > > > > > >         >>>
> > > > > > > > >         >>> To start with, the pattern of:
> > > > > > > > >         >>>
> > > > > > > > >         >>>    while (not_stopped) {
> > > > > > > > >         >>>     keep picking jobs
> > > > > > > > >         >>>    }
> > > > > > > > >         >>>
> > > > > > > > >         >>> Feels fundamentally in disagreement with workers (while
> > > > > > > > >        obviously fits
> > > > > > > > >         >>> perfectly with the current kthread design).
> > > > > > > > >         >>
> > > > > > > > >         >> The while loop breaks and worker exists if no jobs are ready.
> > > > > > > > > 
> > > > > > > > > 
> > > > > > > > > I'm not very familiar with workqueues. What are you saying would fit
> > > > > > > > > better? One scheduling job per work item rather than one big work
> > > > > > > > > item which handles all available jobs?
> > > > > > > > Yes and no, it indeed IMO does not fit to have a work item which is
> > > > > > > > potentially unbound in runtime. But it is a bit moot conceptual mismatch
> > > > > > > > because it is a worst case / theoretical, and I think due more
> > > > > > > > fundamental concerns.
> > > > > > > > 
> > > > > > > > If we have to go back to the low level side of things, I've picked this
> > > > > > > > random spot to consolidate what I have already mentioned and perhaps
> > > > > > > > expand.
> > > > > > > > 
> > > > > > > > To start with, let me pull out some thoughts from workqueue.rst:
> > > > > > > > 
> > > > > > > > """
> > > > > > > > Generally, work items are not expected to hog a CPU and consume many
> > > > > > > > cycles. That means maintaining just enough concurrency to prevent work
> > > > > > > > processing from stalling should be optimal.
> > > > > > > > """
> > > > > > > > 
> > > > > > > > For unbound queues:
> > > > > > > > """
> > > > > > > > The responsibility of regulating concurrency level is on the users.
> > > > > > > > """
> > > > > > > > 
> > > > > > > > Given the unbound queues will be spawned on demand to service all queued
> > > > > > > > work items (more interesting when mixing up with the system_unbound_wq),
> > > > > > > > in the proposed design the number of instantiated worker threads does
> > > > > > > > not correspond to the number of user threads (as you have elsewhere
> > > > > > > > stated), but pessimistically to the number of active user contexts. That
> > > > > > > > is the number which drives the maximum number of not-runnable jobs that
> > > > > > > > can become runnable at once, and hence spawn that many work items, and
> > > > > > > > in turn unbound worker threads.
> > > > > > > > 
> > > > > > > > Several problems there.
> > > > > > > > 
> > > > > > > > It is fundamentally pointless to have potentially that many more threads
> > > > > > > > than the number of CPU cores - it simply creates a scheduling storm.
> > > > > > > To make matters worse, if I follow the code correctly, all these per user
> > > > > > > context worker thread / work items end up contending on the same lock or
> > > > > > > circular buffer, both are one instance per GPU:
> > > > > > > 
> > > > > > > guc_engine_run_job
> > > > > > >     -> submit_engine
> > > > > > >        a) wq_item_append
> > > > > > >            -> wq_wait_for_space
> > > > > > >              -> msleep
> > > > > > a) is dedicated per xe_engine
> > > > > Hah true, what its for then? I thought throttling the LRCA ring is done via:
> > > > > 
> > > > This is a per guc_id 'work queue' which is used for parallel submission
> > > > (e.g. multiple LRC tail values need to written atomically by the GuC).
> > > > Again in practice there should always be space.
> > > Speaking of guc id, where does blocking when none are available happen in
> > > the non parallel case?
> > > 
> > We have 64k guc_ids on native, 1k guc_ids with 64k VFs. Either way we
> > think that is more than enough and can just reject xe_engine creation if
> > we run out of guc_ids. If this proves to false, we can fix this but the
> > guc_id stealing the i915 is rather complicated and hopefully not needed.
> > 
> > We will limit the number of guc_ids allowed per user pid to reasonible
> > number to prevent a DoS. Elevated pids (e.g. IGTs) will be able do to
> > whatever they want.
> What about doorbells? As some point, we will have to start using those and
> they are a much more limited resource - 256 total and way less with VFs.
> 

We haven't thought about that one yet, will figure this one out when we
implement this.

Matt

> John.
> 
