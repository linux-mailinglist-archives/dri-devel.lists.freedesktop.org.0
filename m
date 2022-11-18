Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E9A62FF4E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 22:21:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE02810E7D8;
	Fri, 18 Nov 2022 21:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0A110E7D8;
 Fri, 18 Nov 2022 21:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668806453; x=1700342453;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XwO0nvnaLOCyT8u4GHFIFvx9oi8eJPEqbZKM66rAw1k=;
 b=QyhkidGpYUmroYgOSOQXr8wHbUIvOblSmTMMkyAaBV2aGshAtr4GpCeS
 d/1etweZiLofkXFPO7avWdG3vlxFOKmaSKSXGWlWhLHqZ2JOyJkMPsg18
 3ml3tM8rnrcIlV92PNMCbtfnf+3haJ5F6L2YVlWPExEMR9DPo0KUX0Me8
 MGuCyIgNE5bnkSYROPaPb9Xpv+ssTMPuBiax4fcNvuzIWrqUjpOPNR/gW
 7kvQUfgbFrSImOMAi/RSsCoiNrNgPAnLmbN5MOHn5O24i6osOUPjlQzWq
 plUAHBcK8mzXZd2y3AX5YWPdhW0oVPv9AT0Ac87BOEicDE+hJg1a6XmPj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="292948002"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="292948002"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 13:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="591146946"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; d="scan'208";a="591146946"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 18 Nov 2022 13:20:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 13:20:51 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 18 Nov 2022 13:20:51 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 18 Nov 2022 13:20:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBz9KR83H3jg5Fj7vGfOFlwUjdSnW542Khd1RLh5vNdXyYUu4qaKaQyLBx7A8oHSPZecXZNjxNhJDWDOlHrl8//z2ffL7PkSw2yIT+Hu+Wrv0HDj9FA111M7SSnjFqtK6DlKiA7yXMxtRVfZoP5GKxgjhhGy/SHpa0oyv2SkxsEnvQ/CM95Y8HcEoodAcnImUbaMDvgk+YyAS6L/VXla/J6S7UY0ermtemtjAHrq2+vx4VsET0vqwxHEfCF6PGXyQ+P8UG/mYfKTVo+AHd3cggj5VHZS+w+XA0WsrWmKgNhrWo7f1WhOLIfFGMPaNlZwv6kNZUcKizqIKyBsmcffVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBfSrrhexrTpMOUwOrfqR7/WqJ++zgS4HB100N3s6MQ=;
 b=KxWYTKGBBds5EPgUElR9ISr3IOwy3f5bosJCZ4iRt10/kDTpvpR+Vo7Ss8q7eCnnPCp2aj/ds7mQRNvGv1w4sOtx/1dNssfGl5+sRjWH8xtJYj66ndZEb/hbtw09aM/o036xEK0IUPeN2uNYYuTi+A7nzKBVHdGkiISTrlYV7PQtIDgxWk9k/xi+qfr+owOIGtwAP/bzSp4Oma4rvN92HMys812ERs+ZDLx6eBDmPnjRyMtGBsfHmZE+5pGDUpNHl4hHKl6TG93ydMFL8jwzOgsGfQyr1BqxXNJPxw7dq3pqSdXWqJh4c3UlUTmXDywWGfscmQDjetK1E6ECuqdYhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MW4PR11MB6691.namprd11.prod.outlook.com (2603:10b6:303:20f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Fri, 18 Nov
 2022 21:20:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::22:fdef:cea5:e8f3%3]) with mapi id 15.20.5813.017; Fri, 18 Nov 2022
 21:20:47 +0000
Date: Fri, 18 Nov 2022 13:20:45 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915/gt: Manage uncore->lock while
 waiting on MCR register
Message-ID: <20221118212045.ayn2d2vgd4l5uzvw@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20221117173358.1980230-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20221117173358.1980230-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR06CA0038.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::15) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MW4PR11MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: 804de4fa-d4b0-49bf-e3d2-08dac9aac2b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xWSz0K/vCkNLGp+0lNgrl4WHi3/0BfqASv+V/tE+Xlkc3bXUYTlDAhdrJg5CJohk6r5CXTcjhfXXLfziLwQB8faV9NyUVNj0cou+8ma4c9YHE+PNx7UsmQmZ/Y4WKPklulzLaWmIqxtR76x5UnmMTL+BNUh1BWJqBzTjXjeFxW4F0FJLpOJmj/kv/SdnRwS7UexodeWBREQh/MYwlVMDeSPQTVFceQK6GPrCiGmwxC8VVWdC40jTQBRmcRFttarCaUuZkkeCuElRVfpDav0uXuo+0lmkOS6PZ+F7+ovrHwOSg0pb8IANsLiFMqyqYvVDHzNlWcZnwlGD93v6+hv/4EC6CnKrOzt/DKszIWpbAZzdI5qHwBXuxH9GRTsvUXbZSwYUtX69PI1OIB6IRF8PFKW1khnfLmpv7jz+8TOm+J0qVw3+6QfQ9ApdW/M6yxbRJV+1AzvgpWB0BV8wJ6+bsPCXx/rIsR7JkRQ9nq2ETjszlmYZhzCyM1FqOBHUBq0AHPZJhuE/mEqMCa+ChLiY70+d83b0Qn0FFYqDJP9pfLJTEdVZlRVc4ey2VpI9dLZbTW/tWo3Z7JSOPGP6OGWoWI/GhWsVLxp0FVbHK4xgqYHp0I0eOsQYK1ruI2oNi9j1slNtoJSlwHx0kI47IELpAQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(396003)(136003)(346002)(451199015)(2906002)(83380400001)(6636002)(66476007)(8676002)(41300700001)(66556008)(66946007)(86362001)(186003)(1076003)(6506007)(82960400001)(36756003)(450100002)(5660300002)(4326008)(38100700002)(9686003)(26005)(316002)(6862004)(6512007)(6486002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5vF/INb9k+NYfiWznF5EMP8u8ZEMIygLqMONZwv2WEk5SdgIRvwpiyldluFq?=
 =?us-ascii?Q?N8EkGWGEDVg67LhJ6G3HzcsB574HoSgTW27gdg4WT1pxYl6RzvhkoqDI4RhI?=
 =?us-ascii?Q?RSPRxmiQ1QoblPqO2F7GO2cAEd7VfAO6Ra2ZPJ7dG2196Fi9/s2B642x/hJe?=
 =?us-ascii?Q?JtbGMXBHFheNnjZo9ceUlboBx2/yS3NdPtju/AogQkLGwh2o4PW3h3Iqakoy?=
 =?us-ascii?Q?rofE8O55ZJw7ytlZVzCX6tc7aSMVJHwszd2Yedk1fx7ZPA8Yn68oCpuxIXst?=
 =?us-ascii?Q?FyocidmZx5z5xMDPQRd2F+F29JOUxSDnUv/VdIdj2h0kE06Fe1O6wxfYlZ4e?=
 =?us-ascii?Q?rufv726yQQllMfYGhfbYAzscWU7oM6DboIgu1u8H+hYeK7Dx5BRIx+U6804w?=
 =?us-ascii?Q?5sog6rdsAeQVnXH7iOA2hHnQA3Pn1Kgyrqd5Byb1JX8t+4KWD2ZH7REw4hHO?=
 =?us-ascii?Q?0BmbL8nRdJaNPyT6MkiQ53R0whm3mwR6M+NdbaVEXaO0Ulad2epV57HtEFWv?=
 =?us-ascii?Q?OtxkPo8zaFWY2dvcnTiZLwK2/Nyql+ur5b7ej4LJZzK58H2wru02QW4PNMV3?=
 =?us-ascii?Q?EDpelRDif/sTWroHUcvCn2tMvaDBMa9WNpquk0FE+6oSuktr0DX4L78bt+nH?=
 =?us-ascii?Q?g1eMPvBbVfJJbg+mj6mi90SqOBht7NXXeQtEnkNRvc3sZ/awzVDjLc/F5Q8t?=
 =?us-ascii?Q?JlcBPKwCp9i/siiRe5fmpsRv/gpJ0smoRUmw0NuORC+rLiog+hzArRNXuRZS?=
 =?us-ascii?Q?1FbpOXp2XdqBXlw7SPNwbJVEk7y/2awxjvu99YL6GOKq4+SbvKipd1KhhIBI?=
 =?us-ascii?Q?ZMIvyWpaLutpUlIBiwB0b7s+fXKBO8KJNTvSp74bZqb6drNa+906axcR6/OU?=
 =?us-ascii?Q?Dx9uVU6Nhpi3isAUWr2HdoPz8shahNV6hKc99Qu2qDuxqCVrQswczneHybhX?=
 =?us-ascii?Q?AobGwaFqNpZdbjGkYS2rLgvySvjuxsu9YCUqRJ+Nh3Xwt/HBvbj9w1vDE5IN?=
 =?us-ascii?Q?XoBTm5M1Q+NVmUCPsuUmoDwmqk21P2SgeCzhlml8H+c8d7AbkXZYKOHGxLM9?=
 =?us-ascii?Q?LIaFL24a6P6Zy5groe1bq+ie2poAqPKNuhGNzabivBWMT3Oxn93Q1OBt1DJO?=
 =?us-ascii?Q?+53x3pAEB7DwJxOFUfJcZAcR/w6uMZOYLBri0vekbozseLvLkEvIbrFEtgMi?=
 =?us-ascii?Q?7IQKB/O0VLhyI5wiH5D6LUTbY2YeR6boYOI2/LkgTutWhxBwRPRO47Y3picL?=
 =?us-ascii?Q?JR351BD44OtD6E3dFA0/yv6pxoWaYDZJ2MGMqxYYSO6hSu09eiHAYwlUMSxl?=
 =?us-ascii?Q?yYB4UT9pZg91oiO7rxSs1gFO446drB8+JtVFt6IvZ0k4cnMroJvxxZKdXRkd?=
 =?us-ascii?Q?MEg6Pyumpyxe2cdHWoJNjgBf9Ovz8wQHLy4wVRIkeKjBOya6/YJZmzHfPf2y?=
 =?us-ascii?Q?8efjUJbGXLFuViKBR87xyLbop86E0eNbTLi/rcac2cpblZG2tn0ixwK+IYrm?=
 =?us-ascii?Q?xzMs7BnFx215RDs+f0ezsXaIc9K8/KTiSb9TzNgYg7M8Xs9ReAwc1aO++xU6?=
 =?us-ascii?Q?cFbNJb1oeNnt5w+an43mdw3EvmYaQF5dFUD/C/B06KmKHUJU+avzPEoaZNlg?=
 =?us-ascii?Q?bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 804de4fa-d4b0-49bf-e3d2-08dac9aac2b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 21:20:47.8119 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l40EueEGgHlm68CaFGaPgV3d0vzJsefMzw3PGoFke+XPly5B8j8J1lidMciJEB2gdJm3eRTlvcf3HyUo6p9fJx6wO3JEOdgOW3c7YxQg3z4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6691
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

On Thu, Nov 17, 2022 at 09:33:58AM -0800, Matt Roper wrote:
>The GT MCR code currently relies on uncore->lock to avoid race
>conditions on the steering control register during MCR operations.  The
>*_fw() versions of MCR operations expect the caller to already hold
>uncore->lock, while the non-fw variants manage the lock internally.
>However the sole callsite of intel_gt_mcr_wait_for_reg_fw() does not
>currently obtain the forcewake lock, allowing a potential race condition
>(and triggering an assertion on lockdep builds).  Furthermore, since
>'wait for register value' requests may not return immediately, it is
>undesirable to hold a fundamental lock like uncore->lock for the entire
>wait and block all other MMIO for the duration; rather the lock is only
>needed around the MCR read operations and can be released during the
>delays.
>
>Convert intel_gt_mcr_wait_for_reg_fw() to a non-fw variant that will
>manage uncore->lock internally.  This does have the side effect of
>causing an unnecessary lookup in the forcewake table on each read
>operation, but since the caller is still holding the relevant forcewake
>domain, this will ultimately just incremenent the reference count and
>won't actually cause any additional MMIO traffic.
>
>In the future we plan to switch to a dedicated MCR lock to protect the
>steering critical section rather than using the overloaded and
>high-traffic uncore->lock; on MTL and beyond the new lock can be
>implemented on top of the hardware-provided synchonization mechanism for
>steering.
>
>Fixes: 3068bec83eea ("drm/i915/gt: Add intel_gt_mcr_wait_for_reg_fw()")
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
