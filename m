Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D326D2A09
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 23:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEBB10E2DC;
	Fri, 31 Mar 2023 21:35:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D239110E298;
 Fri, 31 Mar 2023 21:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680298538; x=1711834538;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TXESyZC2muc2kIU5LFvtt6TlKDdAvn7Y3y7tEFWsYIY=;
 b=PE9WGHS6E3kS5GD6vCoSaJsrFg1zEHXvP/8zXcz7I47A+vWJDRGNfY5l
 MSwRrwdIdEedI2sZl8PHl6Q693ozY8UKKqADQfx+NlBqwkVsInAAUKEWT
 4xyhjgjUS6iY2h4ARrObJFv1R5WG6twmIonMVUywz6fYKP/fmJ27AR9le
 03lPuiQMWskmL+XQjFg9QzXlNeuGJK+yF9aASxGz5v2yWQaHgw8+/4+Vk
 uWNiYvueAk2j2axW+DfHpoz68iXuwIeyqcVNBZbhM7+LCcmF9UIB4iT4V
 q7Tvd7RYh+YFHncIwXcr1Up4ddyyrS80ozlsXuU5x0cqyDgFm01HJluiH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="341580541"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="341580541"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 14:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="717869703"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="717869703"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga001.jf.intel.com with ESMTP; 31 Mar 2023 14:35:34 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 14:35:34 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 14:35:34 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 14:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j49yFZmWy1wwGm1zwosaZycNJvAk5iWIWIEPDqJbOb2rQ1IMpG38DrPApTyFQYLutApIEw//YShhBfZVy0nlI7KIKGZltoT8LAsysQDNQXCJWK6iwB02AGe6a4YGI4ZMAXu/CacKjf4mAu6dhd91rFZBoUhfhXVjoqsBW/ZXh9WmcfrxEGeghMW06PQNOUMqAhrrDXcR8NxsEYNNN1mpKfrWNWrYSyfuhf3aJngyjfyWhrL1jYLffX7dp5OgayY7q/vLKS51XfPvgA9y3IUK6PL8bQs3FIuB4vGTQF5LM60zpm9qOFfjAffILxPENXhOsGkbe2iSRubn4hvg+K1SzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7T3z67eawq3ncugw8HxDzRO6j2vaE6vSy+kUUX3keI=;
 b=lX3Nv1+HNlBoXk1V2tt74Q8FFNVSsjkiqG+WDjfDJW1dMFbN2ThGlf/AmmQcrmtnySUDhBdJ6Gz471pmXW2WLMO5+XzY0fJgjL4j3B0kyhm+yzQlt9VV6V2NGCk1md1z8vHcoQM0aTkRN6Hw4wDmovJ/b+7Ke+h4d+tWE4nOZEoz5ueZwEvSpCbv0DaOXllWC+67bdAqPt9xZzamFCbCzVTq1vL0yC5ac+X7wmvV9L51T81q4BH8XY+/+6daIhssHNoTVtn76RiH/U2I9nCG7Za1yHupkPAYiVCa1+RVKsOpM1fV6ZHG55s7SXjFh2qiDkpNQ/WsIEBD/BpbwTZzYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6810.namprd11.prod.outlook.com (2603:10b6:303:207::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20; Fri, 31 Mar
 2023 21:35:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 21:35:32 +0000
Date: Fri, 31 Mar 2023 14:35:29 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Remove unused revid from firmware
 name
Message-ID: <20230331213529.p4th6rtasyj7s2wq@ldmartin-desk2.lan>
References: <20230324051754.1346390-1-lucas.demarchi@intel.com>
 <20230324051754.1346390-2-lucas.demarchi@intel.com>
 <20230327165955.GI4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230327165955.GI4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0285.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::20) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6810:EE_
X-MS-Office365-Filtering-Correlation-Id: cda734e6-27ba-45ed-190b-08db322fdabd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3JQhG/C7ItVZhbgqqruQo5jycM6bT2J0M39WGfQ+Dn2MMDOWEyNx6oBTcIlL0xwZmlHqSaZkKtQ3TR6Re7goMLG+Nyh+Zf8Y1SJKWAL9iKpOrLamY72bUbNTKZbdZkKS70mMueZ1n44dwMvo+ph4k45nkLdZi2qVMjrAgh8UOcWsfS7q9wHP2t5hM5TeJNpdySWoKm0z2lk0TwUqV1hDYALs29JN8L3PA6yMDiMeOIqqx28ahhfgA43xr/Y2liLH7GS53Nv0mq+33WeJM0+mlrhBV/PlTnYp2of1Q1mDRU04fJHHgWjavuQLaRq97lSUFihDWcdpIG2rYjIAS+Or9mv0HR+KZbi9kBBsdBbFEB/MNPo+8p3ohzzXucGM9luTXdO4AkP1CW/ZFY6qEOoLo4bUs9O3JSM1mWTE0Y6wtZ5rdmbZaJl1UW05JVSGLvoLiQ/QlLVenQr+5hsvkMapgJcf/9OICus/SYVwLJ5A34mOa92oWJ5sS4i+I99TrgJtNAeImaqeNK0r5UJx8CDB2h5o0XTl8rOalswJ2KGTRO2/OhrkQWH1O25cTXZF3FCk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(346002)(376002)(39860400002)(396003)(136003)(451199021)(86362001)(26005)(1076003)(6512007)(6506007)(186003)(9686003)(6666004)(66946007)(5660300002)(66556008)(6862004)(478600001)(66476007)(316002)(8676002)(36756003)(6636002)(41300700001)(4326008)(6486002)(54906003)(8936002)(4744005)(82960400001)(38100700002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qJ3+AUtsfyJQd/ML3rQRYRko47c+V/Emd+rokt+HQz6nO3yECK+8MesO8NwP?=
 =?us-ascii?Q?/uCo4AOHH+catWWxehQLdzN9pyVFBaxI1mhwi6k/6lk9V6h9kJmonEpjK8TZ?=
 =?us-ascii?Q?GQsgOu8BuDWCRt54QOzpw+OZR+r0WXskXW3I9McChgsjibz/CfuRoPtNxCnC?=
 =?us-ascii?Q?RbUIZ4Y9cYWK3WoeqMmq0MmV8r5JAx4diLWpI6OzDykk46nsBoJnyCuc+eyL?=
 =?us-ascii?Q?vy/WEbnBQrtQJc/KDeZCDZCmF+Luq0Pdr1K/6NBS7PC04Ei5SlCXm7Sxq9CQ?=
 =?us-ascii?Q?K/Ht7Zg+sGdxEZN52S3wgzKUWxs+tlGwrDRe07TddwUMYSPGNEansKymT+j9?=
 =?us-ascii?Q?7MOLKyiujhBRbFo3Y4R7fH9Xuihu8OtGdkwy8HFM+sMzos+mWnqdy7MIa/Yf?=
 =?us-ascii?Q?VuzD0276hAf/YXedZu2Siz/plduqCN/xwDZRimfPUZiD2G9zBhRVxFRjSt+T?=
 =?us-ascii?Q?C//i71RuEJPeeKTiqGwe4UyFumDPWRJaNnLUi7FZAZReSJywMbpQbEuHXREz?=
 =?us-ascii?Q?Vha/SnaB94PTak/17n8jASH+F3eSWgN6+EZnRoXSJGIIRVd2XJMmsXOorX4a?=
 =?us-ascii?Q?W7NSsthDqHW/np+zf+QL1z7OfpAO/i6ekMQU/RefFcC2KkvvbiRYAoqupD46?=
 =?us-ascii?Q?QhTCFr5E+r5gj41MJeYhluSk2Uh2XoXMGoG1NUv500EjfEHrD1wc/Rzl7Rra?=
 =?us-ascii?Q?DlUe6UgrUIJ1pIruoAUVQas3TgHA5WrKUMaLF98M49qian9s4SpDAGU5Y9bo?=
 =?us-ascii?Q?0Ao6ojwzSPR2dBKTBa6XHrAJ9/Q8IZQa51JnXhtTcf4vVmxauNsISJPnGrVQ?=
 =?us-ascii?Q?mRl7s4w19SkHMDIGaTytVRba4fUuI1tQA9g/BPN8sSItSveuitHfmDah+eIw?=
 =?us-ascii?Q?1le1hfBFHb81xvvG4PCUGSPo2S7NohHxRyzqJ39Qu61dYQTYYn4gXkMh9Tvo?=
 =?us-ascii?Q?PRV0QeTuj4eJeZTkApxgJMfvZGbRyzeVW7N1GCn4Lo0+Vxe1WWXXjziTbcUS?=
 =?us-ascii?Q?A88q2PrHgR4S1kwPw1GnlRDQCiGu+0OVeQy2/Qoe2px/l4pIqJu+VpWhpxjY?=
 =?us-ascii?Q?AX2bP6YOB/frH2tm8Jm9uhwmExvtaqN3KBuynclO3QwB16iEbc8r8nuOHPNj?=
 =?us-ascii?Q?hUbvby/IAE0PV0cgr7ugUx0o6vOWxYiRFs0OXSuzDyCHxFEqPV4aFHq49MFD?=
 =?us-ascii?Q?zPi0BK88vEXs85JBc/wQVk8b54qj7zOOkZL4MRcjwYWwOgqfq/3Xp7iPGGmg?=
 =?us-ascii?Q?jp34D83QKm9bA2Zq72le/ZrUks39Zhd7pGEBtvWDqsoqsqVOD0bI1unmwOQ8?=
 =?us-ascii?Q?p/sG7YH8klxT8TT++6D2eTUETuL7stxlSbQ2btBXX1RJszDDaoxoZDKLVvqX?=
 =?us-ascii?Q?iexr9U5OxjMMRoNTUNAGEyseRFhvoIiDl3FkL+Pr6cvTqAk9V9JHDOozTVoJ?=
 =?us-ascii?Q?Y2llYrwvrbXbQzLMJwfywxi+koiHfnJyIM48VPvv86ddAKNJdXg7vHcx/MMr?=
 =?us-ascii?Q?mAWE6t9NBAnlaxmN31tqq/h1lx9EwIsKe13KDrtLynTZDlBp9MIrJhcwT2yA?=
 =?us-ascii?Q?i94SrmVJbnDxfPKH/BRroxeJdHkZt/zWDWnbWB/dOKMVjUBJrnHYatnFwmRI?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cda734e6-27ba-45ed-190b-08db322fdabd
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 21:35:32.0004 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9ylGpnRYyYwauu0fLihX+tF5akNYDYHq3pfALItVX39FiX0vsA4QS+rP4vGQ8coGEnBaeY+CLI0/xg3l9mbmuRtantZDB/5DnoGuRE+SnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6810
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Anusha Srivatsa <anusha.srivatsa@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 27, 2023 at 09:59:55AM -0700, Matt Roper wrote:
>On Thu, Mar 23, 2023 at 10:17:52PM -0700, Lucas De Marchi wrote:
>> The rev field is always 0 so it ends up never used. In i915 it was
>> introduced because of CML: up to rev 5 it reuses the guc and huc
>> firmware blobs from KBL. After that there is a specific firmware for
>> that platform.  This can be reintroduced later if ever needed.
>
>I doubt we'd ever need the revid again; more likely we'd want a way to
>select different firmwares for a given subplatform (which is something I
>think we need to add anyway for ADL-N).
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

thanks, applied this first patch.

Lucas De Marchi
