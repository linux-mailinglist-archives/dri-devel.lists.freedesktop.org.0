Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 380F06D29DD
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 23:13:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FFC10E132;
	Fri, 31 Mar 2023 21:13:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7801710E132;
 Fri, 31 Mar 2023 21:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680297225; x=1711833225;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ERkudohxz5iKQLcGo5MpSlfnLT2yyAUYQY2JDHbJ9nE=;
 b=QM5otsCVmVsRTu97lWQj1HTiEDE4kW4P/a+Jb8XG8UMQBr5INVTE2i6P
 tuvOF/1O8VdlI6xJPwG9kyGdzobfJvbQ+0GiYdYr6eUS0eVqBp+QAd5L4
 L4D01++95/Nyhji3yHaHM8jqHLWpfYinjabu98MdT2vUCgOLWW04tEei+
 XtUAxpapwNvHI4wZh2XByf0crNIVlxZFCvMqy5186m6hc3u6afmgKW7T4
 d3FFvLc7QoeKAhMeg6Qo8yB0Tn9EM/jgZtY8cK1pRay7Ulz+Q1sa3zoSy
 YuNrje1lof3phQuS72474t9td+JD+vJd8E++NHrLh3JL7BJ4MTtW7O5gG w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="321952480"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="321952480"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2023 14:13:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10666"; a="662541533"
X-IronPort-AV: E=Sophos;i="5.98,307,1673942400"; d="scan'208";a="662541533"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP; 31 Mar 2023 14:13:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 14:13:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 14:13:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 31 Mar 2023 14:13:35 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 31 Mar 2023 14:13:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADCvg1Olrra5IB8lTKkq6i3YiWfqEafrHnVk5uhXphmMKq2PM962ELAXIuwGokBVCywxq7m5O8iv/qcmd6eFE36TrLreIpy1YDbfyivlyYyRyuEImnkW0GVemUyhvovddbVLsy2cO0z8YO5CiWsGLSD7kgmQdokpavBR4Fc/ei3eM6rA47V0YOHx8duj5a1lMEio5GCMB5s6DJJSgqe/AOYvTn8plUMmBMihqGwC6+y0QAiexkYqo8dYN+wq09l/KYBdUj92FcMh1/j1vXiamqkBLKkteJPtC4H3VjvVxM4tiYQhNsAM8UKe3OzXyCZf7c1SY2zHGMJqfzG0QafC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dlTSWcUEW4of3w/XbKx7p7f8z0UcbukweFMlaUXFSso=;
 b=AnwhXSQI2IS+pPRhvEWVt35Bp+dP8nreHCii+P6KbYzu4iMCFeQagYjeCMsyDFQlCYN/gSPv2CK4uDl/ecftEg1w24YZYJFeuM23aYx9UXyEtxpUGpW5sd+LGFq3j5VPPma4QkKZmbwkkgaGIgR5jAF6dF7C1sBccoi6aMMcIdMzBcnEA7+7aLe8oIhkFcv3I9NoJmhWSl50NP9l0bfAB22ozEk2kBnci+GkYWoPKyscYFZMg4VbmWE99hRHYQGnkHpEQnGbMqHXOjc50HTwBIMMv/lHNfGeGjvp+ZFisXTvE6ARqtdCcSLqYnicki6Wzgx7HaZRcAGv+VvTqedWsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5791.namprd11.prod.outlook.com (2603:10b6:a03:423::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Fri, 31 Mar
 2023 21:13:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%5]) with mapi id 15.20.6254.022; Fri, 31 Mar 2023
 21:13:34 +0000
Date: Fri, 31 Mar 2023 14:13:31 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-xe] [PATCH 2/3] drm/xe: Fix platform order
Message-ID: <20230331211331.ycmb46z6rgfi5sw7@ldmartin-desk2.lan>
References: <20230324051754.1346390-1-lucas.demarchi@intel.com>
 <20230324051754.1346390-3-lucas.demarchi@intel.com>
 <20230327170238.GJ4085390@mdroper-desk1.amr.corp.intel.com>
 <20230331131955.qunxulyrz2ruddja@ldmartin-desk2>
 <20230331204720.GS4085390@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230331204720.GS4085390@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR05CA0054.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5791:EE_
X-MS-Office365-Filtering-Correlation-Id: d7dfc6ca-35c7-4c81-7404-08db322cc90e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vSM4ixeA3AkcnIhsJmbnrrxiVshYWIcXAVNoGtzSoX8noHXJkilukG6AMqt6tuHuC+9XS/Xm7tmDiZs7peSYurkQgagf8gcRTXAnS809kognDZXJd1cOY5dvST59+nYdsuX7dSt/DpiEoRG3vjIBNU0kyx5P46osOQz69xtcShyctKEem7pBiiomW+mYg+Jlv8gOLo6j1TdLkr1fwNs2VcsbDa/80xzfs3Hk+xWG6RtTqbLjOa3CSSev45IHB2jNS/X6/nGowiEd8FM5hFNFETaM4vX0JaWGrkfgbEXsSNrRaTqp5PMswm1Ibi/cnyW7PVx0DHUajAsEmd05LMElng/0lu/a4Pllmpj6qdkNTDWGJCGnylUpe4PtHXG/8WRD7V0eHa3xZNDYHfJvMK/DdDeMWdkmRO757hkR2Zg9Dx9lu0Y2V9qm02VRBGYQJ36CH4xMtzYBGG0sw3Ksa30sSEMyXzFvvF0JR5n9JmltaH7mrNccGk4h0tcuqEqdHtttLo86pdLWgOp+IVj7T20+XCF7/m4njmx5XqJR8yLgabSjlQ02SF3BYUHHZ/f5ZQKh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(396003)(136003)(366004)(376002)(451199021)(6486002)(6636002)(66556008)(186003)(6862004)(66946007)(54906003)(6666004)(316002)(38100700002)(41300700001)(82960400001)(5660300002)(8936002)(8676002)(66476007)(6506007)(478600001)(6512007)(1076003)(9686003)(83380400001)(4326008)(26005)(86362001)(36756003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vSwaiKaZB49AhYXZkvo3LQVm0DruhtLQ3GKwH/llVuNPuWpNTm+VtXVj35hP?=
 =?us-ascii?Q?smG9Lv0oTc8xArMNxW40N/SxpIm5zDn0TB8CAiBgAE7L8ySODKdhdFchdxCs?=
 =?us-ascii?Q?FnRPLxLEQ9SuWZNuf0L7gb4H+VUQv366BJkYrIebwwKBR4BTmHHW1zmYCaB5?=
 =?us-ascii?Q?OKVPDjOAIIFe5Y8io5xNyHCsx8gxFBoCI2TOxaTQL2P65/FaJ8IZhdE1Pk5r?=
 =?us-ascii?Q?3JfHL5yjnvdSTgN7jPNXGWxnIBRnlwmz9DBYtAiMAbiqtWXtc3apXxBs521N?=
 =?us-ascii?Q?BnwDn5sexbUO3j5c4kXZotg5Q5OtDlZTemqeenUrm7D3U6y7wTl1UuWpNmET?=
 =?us-ascii?Q?LKH6OERveKKpvf9ncHr3rVigLqEpQtXLNJOpuIssKG1+OiV91emSEuy/x8h9?=
 =?us-ascii?Q?ZLIfXBisP3qT7LnlHrNrkKGcF13sjKU5E7tzcwvZiK+wTQvhw9XpWPUMKN6C?=
 =?us-ascii?Q?m2j/QsGE3py1iahAG/thBV9uCe7uG9dqazCLG2hDudn1BLiBusYkAtRWYDUz?=
 =?us-ascii?Q?aqMWYEz52ERyp91P8aiiGTESb4QnGl4S8JoreURd0VHR/zEGfvgA0qbSqkby?=
 =?us-ascii?Q?GdBDZH0jupMRgSVZfhG037LBLkMXoHO87tyHk7eW19kvvBbm0Tb2eHK9N25x?=
 =?us-ascii?Q?qegdr3AnUs+342N3KOPmcoyE7tMzcFXUrCeWV95xQ1XmUTLhzo39t470rFDm?=
 =?us-ascii?Q?dyBRV5X6BrfiiqTAQkFc9d9f1xQxsnbCZjh91gstJAhP3EXCBXqTVCJ6nDs1?=
 =?us-ascii?Q?wJeUwLHnzoChtzIAW8Axb0P2Y/IG6SUxPY93GEdW2Nf9JzorwJOrDRbbe+O9?=
 =?us-ascii?Q?ZcrJti3QmzZyIrEs/W4sQthTWIahjrrLhfsmCa2cfADmytYPULpFskOfYyux?=
 =?us-ascii?Q?aVjnW1DDU6JY7QYSr91Lui8r7biff7I9TkktgWpewqdRA1xtZfhV+4ObhTaO?=
 =?us-ascii?Q?GHBvyj2L8eGVjEp6WFR/WS9/BfYutkhWvzwaMbylX9mmTXVcf3m9aohHijnD?=
 =?us-ascii?Q?5hlpFbXBuksf73c06OP9Lc78nGmddOHfTE175eLU+Uirl92qMANvTCfamYzr?=
 =?us-ascii?Q?+BdQRNSvnULR+Cq+lVWKv6Y207JzFtWxpSvrFArcHmoAfTGB/ZF2EQClPpc3?=
 =?us-ascii?Q?D8UdjrEruYNnpl1eTLyIKoa5MxiZbUaaAa0Q4UQgIPy5E8ICAtgqgOblO3p6?=
 =?us-ascii?Q?/QnMh8Di6GJsYXTy6JCVij1HB3iZ8ulhFS09qGUuWHhDZI4g2MLWqid/veRd?=
 =?us-ascii?Q?XJ+UACS73BoF6YKgkkVeEAfIWSCQLBQ7BtScvcU0+DogUg/m/qJLhR2wBv35?=
 =?us-ascii?Q?OmUpB+laqxetPA2AtVYHTuIL/WwLVKK5QV9BUwgfPrUZiESnTk9gYZ6r3dRW?=
 =?us-ascii?Q?BNHzvEXinw4boKEmNswIow9njPVHdQPuX1Nk2k0MMdcl0rJuNfcfaX4q4ezx?=
 =?us-ascii?Q?/Lxl59eCZgbQGhLjU/DCdIEenWvkR7fQdRW8ha6KC/kZRLTDVZ5aQdWaGLGf?=
 =?us-ascii?Q?72SwVpN1+MuaTfmk8XXKaU45BtuVG04duVKE22hah8h/pRLIZaniWPVa3+NO?=
 =?us-ascii?Q?YWSZF2S0xzaR2jpKletmuUh4fWVizAfifUGXu0VAozUmP9QwVuyH6TaRooGa?=
 =?us-ascii?Q?qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d7dfc6ca-35c7-4c81-7404-08db322cc90e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 21:13:33.9161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJXuKMl7p9PX5yqvmpfRTSsXa6HAz3Y9WJAognZtrgVBxJbuloWPhsJZMNh13gNV2Rfu7f2k29LUPNGXu3ycq9Dr4queIEyaZ2BcBJzpoTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5791
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

On Fri, Mar 31, 2023 at 01:47:20PM -0700, Matt Roper wrote:
>On Fri, Mar 31, 2023 at 07:22:06AM -0600, Lucas De Marchi wrote:
>> On Mon, Mar 27, 2023 at 10:02:38AM -0700, Matt Roper wrote:
>> > On Thu, Mar 23, 2023 at 10:17:53PM -0700, Lucas De Marchi wrote:
>> > > Platform order is important when looping through the list of guc
>> > > firmware blobs since we use it to prevent loading a blob for a newer
>> > > platform onto an older one. Move PVC after ADL.
>> >
>> > Shouldn't we be moving the ADL platforms (graphics versions 12.0) higher
>> > than DG1 (12.10) and DG2 (12.50) too?
>>
>> question then would be:  would we be ordering them by gt
>> version?  Or by when they were introduced?
>
>Since all of the platforms here have the GuC inside the
>graphics IP[*], then the graphics IP version seems natural to me.

The order in drivers/gpu/drm/xe/xe_platform_types.h is unrelated to
anything GuC is doing though. It's the firmware loading code that
decided to use the platform enum value to stop early the iteration on
the table.

>
>"When they were introduced" would be identical for all of these
>platforms for the Xe driver (since we just dumped a big megapatch that
>contained all of these platforms at once).  But if you want to match
>when they were introduced *in i915* that would be reasonable too,

I was meaning more in the sense of "the HW being introduced", not the
support in i915 or xe. My main goal was actually to have the order
in XE_GUC_FIRMWARE_DEFS on the third patch be so that the platforms
using the full version are the top ones.

As you also mention, whatever we do it's sufficient to keep the same
order (for now) in the both the enum and XE_GUC_FIRMWARE_DEFS. I will
send a new version just using graphics version (and updating the comment
on xe_platform, so it's easier to see from the xe driver alone what
order to use.

thanks
Lucas De Marchi


>although the ADLs would still need to come before DG2 in that case.
>
>
>Matt
>
>[*] MTL has a GuC in both the graphics IP and the media IP.  One of our
>questions early on was whether the GuC IP itself would differ between
>the two GTs (requiring different firmwares for each).  The response that
>came back from the hardware team was that that's technically possible
>with standalone media, but at least for MTL they'd keep them identical.
>So for now, just basing 100% on the graphics IP version seems fine.  In
>the future we may need to stop tying GuC to platform at all and instead
>match on the appropriate IP version for whichever GT we're loading on.
>But that's a problem for the future...
>
>
>>
>> I think it makes more sense to be by when they were introduced as a
>> platform in the driver.
>>
>> 	1) what about media/display?
>> 	2) allow us to always be appending in the enum and elsewhere in
>> 	the driver.
>>
>> Lucas De Marchi
>>
>> >
>> >
>> > Matt
>> >
>> > >
>> > > Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > ---
>> > >  drivers/gpu/drm/xe/xe_platform_types.h | 3 +--
>> > >  drivers/gpu/drm/xe/xe_uc_fw.c          | 2 +-
>> > >  2 files changed, 2 insertions(+), 3 deletions(-)
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_platform_types.h b/drivers/gpu/drm/xe/xe_platform_types.h
>> > > index 72612c832e88..10367f6cc75a 100644
>> > > --- a/drivers/gpu/drm/xe/xe_platform_types.h
>> > > +++ b/drivers/gpu/drm/xe/xe_platform_types.h
>> > > @@ -9,14 +9,13 @@
>> > >  /* Keep in gen based order, and chronological order within a gen */
>> > >  enum xe_platform {
>> > >  	XE_PLATFORM_UNINITIALIZED = 0,
>> > > -	/* gen12 */
>> > >  	XE_TIGERLAKE,
>> > >  	XE_ROCKETLAKE,
>> > >  	XE_DG1,
>> > >  	XE_DG2,
>> > > -	XE_PVC,
>> > >  	XE_ALDERLAKE_S,
>> > >  	XE_ALDERLAKE_P,
>> > > +	XE_PVC,
>> > >  	XE_METEORLAKE,
>> > >  };
>> > >
>> > > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
>> > > index e2c982b37e87..174c42873ebb 100644
>> > > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> > > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> > > @@ -43,9 +43,9 @@ static struct xe_device *uc_fw_to_xe(struct xe_uc_fw *uc_fw)
>> > >   */
>> > >  #define XE_GUC_FIRMWARE_DEFS(fw_def, guc_def) \
>> > >  	fw_def(METEORLAKE,   guc_def(mtl,  70, 5, 2)) \
>> > > +	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
>> > >  	fw_def(ALDERLAKE_P,  guc_def(adlp,  70, 5, 2)) \
>> > >  	fw_def(ALDERLAKE_S,  guc_def(tgl,  70, 5, 2)) \
>> > > -	fw_def(PVC,          guc_def(pvc,  70, 5, 2)) \
>> > >  	fw_def(DG2,          guc_def(dg2,  70, 5, 2)) \
>> > >  	fw_def(DG1,          guc_def(dg1,  70, 5, 2)) \
>> > >  	fw_def(TIGERLAKE,    guc_def(tgl,  70, 5, 2))
>> > > --
>> > > 2.39.0
>> > >
>> >
>> > --
>> > Matt Roper
>> > Graphics Software Engineer
>> > Linux GPU Platform Enablement
>> > Intel Corporation
>
>-- 
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
