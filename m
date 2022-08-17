Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96519596889
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 07:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89E8210E8F6;
	Wed, 17 Aug 2022 05:20:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D22BF10E8F6;
 Wed, 17 Aug 2022 05:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660713603; x=1692249603;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=QSBAcOXXFlLpyIU+XdCjMNnlP2uAAsypdlgIE8p0sWg=;
 b=jde0ih/JCYFzDOlGjng0Y9f3v63GGJRsPiBgOz7cbOIuwrTrwJysld+3
 C5djGqfSpxXQkP3RrirIGDaqiOwIoQXyb8HnAfI0FezL4+beDikezjtq8
 G2nCdhFJ7FT6bZ+cXH+VnrVF39D1cMWvC3f1FOdyzhyXlp2UD3OP/Qqau
 tjlmaTO8usUoIbEZoWT75norV5vrXQnz4JCPfDfiSwr7Oj8PWdW9fXuBH
 0jzTw0JFVWRi++LajmeLTn+a64SVuCZvmIDHwcSGJywUimkkqt/8mJYA+
 Ll3m+oD8hRaV3Lej+QJltORGEUgPRAzqEhbdO6bort5lyBBXHSm63P05Z Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10441"; a="272796047"
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="272796047"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2022 22:20:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,242,1654585200"; d="scan'208";a="603770753"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP; 16 Aug 2022 22:20:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 22:20:02 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Tue, 16 Aug 2022 22:20:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Tue, 16 Aug 2022 22:20:01 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Tue, 16 Aug 2022 22:20:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L3tSSZu9MdMB023B1VSaV9VdHgomMmaomxuAXdX5s3PvvDV5O0hlykTRFFWoSHFxBcWP6oC02fdxt2iYf/OGoWn5Q9Cqjr1O53eB8+U/SwWPEC2tyPCkjsZfJlqxNN9K34d3g0G50hSNxDXqtrke82vixrnWBhtf3KLes9Ls0Wi2oujRZPnqCyM9l3KAv22Wl91pM98ijYubbTewHrIjr0QTAwQBnRQqP26OmJF10OETCRD8gfPxm0lF0X4vma+jzDbM8GQg45YgBFvUNAMeHWwySvrTy9FcHaBFZMf2GR2DbLqD+YUpqOhjwb0fWD1hMyArP7TPU8jgoA+zax5x/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wPYKs6HswmwaAjFR4TvPN3jMzd/b1tFac9F+0pFHoG0=;
 b=axHgF69M68V4QH33gj+112ES7JNUSSy3NsahTVtgy8XhOFKEDDjuKmKR8MDT6bdJMW5ijqh9A//1jInXQ+mKgvK6Wrrh4Br1i4o/bMGSYXTgeIvmNcldOAnJRqcZHbp7c2lV3UpA6dolqM6e5QCf4/O5+M+jYV+JTUx658Hpg4KxR8IY8yRNiAyeIfTuryFrekP1IRFk1xtVFKpT844bZhFJKVCYfCwiCHogAwWopZ9ucwPS+ndzpGbnb2Xip8CIQwcmRqFzfmqQvttQ14mOPaTDDuYbeG+h0i+SE5tM8D5VNoQZczEMBESLum0uq92mpkl53DP2BX/y6U1XfRnfEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL0PR11MB3185.namprd11.prod.outlook.com (2603:10b6:208:63::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.17; Wed, 17 Aug
 2022 05:20:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::a012:82da:5edb:513%7]) with mapi id 15.20.5525.011; Wed, 17 Aug 2022
 05:20:00 +0000
Date: Tue, 16 Aug 2022 22:19:57 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH v2 2/2] drm/i915/dg2: Add additional tuning
 settings
Message-ID: <20220817051957.y2o6bl3lkhztmjtm@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20220816210601.2041572-1-matthew.d.roper@intel.com>
 <20220816210601.2041572-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20220816210601.2041572-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: SJ0PR05CA0145.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20252944-7922-423f-8f9c-08da801021b8
X-MS-TrafficTypeDiagnostic: BL0PR11MB3185:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1x5+a5hoqhIVlpUxpNr5V5jFsczYTTIGghW4Lf27AOowbm4mwKZQeWc5Xk0b4DGo5cZ+9rraWeCVI9VxIMY9JbyVuchstmW8dfUfs+aJHEeptQibs/5X8fTAZfT5oO6tFTNWEiNYypBAZn/UPKTqxB6SkzM+fkkocppSx15OszF0utocGttgVqdNuh8RCzWNvoCyLdDrxP3I+VOTABwDbzEoSZ2gCosZWwm7P/W422heAqHAy781s/l7ZW0ci4aedMcC0m6kmoUNpvOMTBgCPzl1yZKNKS6/DyG4DCow+2L/ysGs124awWMoVu7ESSKc+NFwr8q4avLKiq4IaGOFxGcGkH3r7eR9nLoM8U7g0DyTlNb5KzB3rto8zkVpwcgIADUe4KsPQnqpHaX+1b+nnfs7wIuOO8x4Oosn4xAvH8UWq7qnBxZaT2NnLd1rZj0mEgyGE3vgsW70SymSFjichxu3fbAwSfnGbcpfN4BonCFH10sLOnn81CLgodZkUuZoW8wcKcx2K7J3MLg6iZ9sMuwC4xTNUX4g3hj+QY7fwIunfEEAhKDV0Ar0XcdSvBHEjFTs9ATTRvhQAkSS1dlpHkik2EKzTGqEiLNw5V+GgEOnpeAE+RgufS8/8UtgThr+kfIBoCckqR9FK+Q7y18IR/UKiNk/RAJk+G1ed5Kq0vwvHOYbowrnOJRiIX2A8KhT5DYICtNm6xjxezAbhbAdmgFuVjXYZDZpHr3z9dOkiBlq5V2QOntfUaMaQOrCO/iu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(376002)(346002)(136003)(396003)(39860400002)(316002)(6636002)(41300700001)(478600001)(26005)(6512007)(6666004)(9686003)(6506007)(6486002)(2906002)(66476007)(66556008)(66946007)(4326008)(8676002)(450100002)(4744005)(6862004)(8936002)(5660300002)(38100700002)(86362001)(82960400001)(36756003)(186003)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?elgAKkE5eJQn7NdprpAhgTfcjDQ+zwc66hLOvdpF063cVcyFr6ut4WCw7xsa?=
 =?us-ascii?Q?E0vAI7dSQHBz/8wGTX9sNnvuJdvTdzGgih+6XcUAQpqv1JnL7SBGJqgm9gz0?=
 =?us-ascii?Q?4s6Y0eJSUO6fu6qJV/ophniWqxRrdrYCOIWt9mIlkvsHZtM/iVZy8Y3C2uwm?=
 =?us-ascii?Q?gsfnnhatcr1iy4zlf5Q3JgFdMNEWoz+BwWwa4/8SfTbXxjLz6m77wY1Xkg30?=
 =?us-ascii?Q?/speRiRsyOAcDYg1hhd5k7sb5OWue56heufOWpZpdSm8qgT0wTgy5JseyXiT?=
 =?us-ascii?Q?814lyHOn+jDM7GKhV/4Hrugzbx+yn0Zw+/sN4I1CwtCPZqCBM09J0KzSpKEa?=
 =?us-ascii?Q?WSCMgyKw367NIRNLZKhz40HHs6CI1bN4dz1lKGKdc9v7ZwPe9DiBYlD1dzhN?=
 =?us-ascii?Q?4oLIvKL6nMGC9lbcIksLnjzoU2Wel8r3V6SxeTEPs6PJclUG+5EtAgHpXRK+?=
 =?us-ascii?Q?b1+kaqN+y3R64DvOHI0fjjb6gvgSLHkP3eLiyg0l6/XR/NG+XeFV7rGcdLf2?=
 =?us-ascii?Q?VkS7Ivid9tK3hwa+LP8sW+yJ2RuWCvNLEkjwuNcWFKEu0SoDvr4mmHe8t4jt?=
 =?us-ascii?Q?mJM0nFyv5Q/gJeAmEy9xAjc+S/261cfFoAZNjtFmctQCthWBHGi5UDS11Axj?=
 =?us-ascii?Q?ir+95nj/kvUZjT+VpbXjvrmixQeQKyWZr9ZK7JrA/5M0csitsGTy1wwZ5Cb6?=
 =?us-ascii?Q?Wkz7hlw/OpWBoYQz5u9fOgvqNx4D1xprqCLydMFiTnkX5l3WmzGuNiRYyg1g?=
 =?us-ascii?Q?XtuoRKyypIAX5w9gkMntklxKW+kYncyc1jEspOHOmrklRbpiN29oLRFSV/AQ?=
 =?us-ascii?Q?FZpsKgRAiFeKjtBfgroy4jJB9Ko/W+Z6OBhEXTm45YYCtw1ciXk+2nl5SklB?=
 =?us-ascii?Q?FD/s7G4lnBxeYI5+XFg4TWRJY59TBNqR6eSGmPZbURuD77KHf1pqxI/d1V+0?=
 =?us-ascii?Q?cSaXm7XgMtXk8XprM+hckz8A7Gq3fVRBK41PyZQtFSi8zvQPSr3snlG4zGr5?=
 =?us-ascii?Q?GWBzzqVXkyhygaIy5Wtj4TK0oto3rLSCWNbQTMLswzSJNWvxQFzk+h3g3BC/?=
 =?us-ascii?Q?KzRznRQzfh9txbCkT7dmYmK+Yfvas0Dc2GFsGmj+TYI3OVou7L59VFgKUlU7?=
 =?us-ascii?Q?3h359U8B3TNoPTMRkm6l73dCJrtZmgSHAHnY0McCLlSGQbcR57FQ7+hUQVoI?=
 =?us-ascii?Q?sibEZmN9/wkABEdE9IQIK4ruqzxiQHhSDLLtjN/Ry2FbkRxe1ke1GEwTTI2c?=
 =?us-ascii?Q?iMNllsKNYaEBKNAbUBXuT2JOzr+aqKWkr0XI2RVrcm7t9dDByZc0gB5tijmS?=
 =?us-ascii?Q?sf1QDccLEzRpAkn9nFc80WbjtEhYwsnvUkkQtu8r7x61YQdemOKP618u7QIU?=
 =?us-ascii?Q?Zy4bapExgyE8aBbJNIxOe3Q4j0UKU4/+w9wB/4wG4Nns8ulL42au4B8SM1Mq?=
 =?us-ascii?Q?STMq/wGsYy4/Npggi6Uj3gvOERXCfmYuvw7WFWSGvP65Aow0c4nc7IsrgVsj?=
 =?us-ascii?Q?zIEXpjbpGn3QSMhXfSeY7tduUJlGgVGi6zo+08hPwGnuxmea0eBD9L1sWee0?=
 =?us-ascii?Q?bDwNwHbDgQ2dR4nXd0PQmiSMhUEguqh9luE6oKUJIfjg+wMbVMt7P6+gqoT0?=
 =?us-ascii?Q?0w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20252944-7922-423f-8f9c-08da801021b8
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 05:20:00.1328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /smFdBTBYGpWwVRaNOnKx1UjIqf80otj/uO+1bm+/NpVH8jpS54Q0k6H9GLliYqDqD+d0pjFahO4wq8dDqbk2uKuF2kuu/zrDP1vtupYCr4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB3185
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 16, 2022 at 02:06:01PM -0700, Matt Roper wrote:
>Some additional MMIO tuning settings have appeared in the bspec's
>performance tuning guide section.
>
>One of the tuning settings here is also documented as formal workaround
>Wa_22012654132 for some steppings of DG2.  However the tuning setting
>applies to all DG2 variants and steppings, making it a superset of the
>workaround.
>
>v2:
> - Move DRAW_WATERMARK to engine workaround section.  It only moves into
>   the engine context on future platforms.  (Lucas)
> - CHICKEN_RASTER_2 needs to be handled as a masked register.  (Lucas)
>
>Bspec: 68331
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
