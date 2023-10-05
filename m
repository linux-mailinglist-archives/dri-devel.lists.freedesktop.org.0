Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4037B9ED8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 16:14:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A1AB10E3FC;
	Thu,  5 Oct 2023 14:14:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D69510E3E1;
 Thu,  5 Oct 2023 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696515277; x=1728051277;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=qbOgTICTwBiwz9ccpvNY4ZalzFV5Qh12RqVsWqWrywk=;
 b=cV2h3zAPFBeWdvt/NxMolPPD9p3Um8JXdWjAhBQqmXfK0zz+uPvv0mVS
 zkSY96NAr96SeRh2dLVatt/NhLdxjC8XeznGjrr9DWGDe5InX357nVET6
 jvHLX7vAiOaMmBnCf1/V59H8UVXLZBFp+N4/ntSXsjLphjDmoLddvsL/C
 3XfWvHTVvnX6P6a+x0/hD2KaZ+gG4ODFbWmeIxpSSWXMKkALJTu+1Az5/
 xncd0fsMChRVTjh7Pvh1WboBISLaZN9BEw93y7KJxjXd3fNe4R2/qdMDz
 X5h8YQEWntV9vPj9WazqL1q3bG4GvyeT5dQJIuAGqKb/S+6Z7k8mj3868 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="2115059"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; 
   d="scan'208";a="2115059"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 07:14:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="781265102"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="781265102"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Oct 2023 07:14:35 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 07:14:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 5 Oct 2023 07:14:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 5 Oct 2023 07:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bq3Zxg5sHjJv1Uq6kjKAPRxN8/wO2KmIcMVvrXsjiSPhrjySsi6z2LVEp41yV/Vdw2PSsEiVr70aMAgmFwWS+q+pAXhRR6XxL+qhEJVyDf2jw/Z+SnSpw3jxMoeHhCN/+IZFdC/Vjvew95lXey+zKzFL3OWL0gohmX6CfSOGvrXLa2so73PvPozzWsU3kd56R6iVmU0vBXUdgh6/yBZZXcjJWmk3TYF+wBeNVfwsJwvUUcUioRQXnbQxwc2Uuru+RPEwU2GqeVQecl38lziRIVldu5/oil8UCgraReKKEaU3zJ8KZjrNmaVBVD64WKcteVwnlw3Fd/ysqaZ1ri92Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w/J0zywVDtlftRxkS86K6xU3KrAeRVwU0u3HXAI1J3E=;
 b=e0UMhuqDuvKPEC5d3kQWhzydEoiOAhKXvqLp3uaF0VXReg0a0S2Hkk8kBlMEXScxOZj5m74JgCqTvVzCMLbOVxl4wGs5uZvd+QR3zldIvY19+AIPGJ2XmIMZm5RVu59Uk4Eh51AYmagUTRMvbUKdJlvT8Pc+/5b+cxIOsMx0STuaWJbZFmQnPZHcde9Fgq1jcpi97LkT75uH69mlweFFGKkFuHt6ejWXKNOgfSfRRZ7lE5G6zDiXa2GRslkiEWJYXyUrlP9Qef1OCZkGlkAoElICjHorXEYioRXcfG7s8EwIYA6BZwNkRswTHkYwT5z5bI8TibGqMGhUBoPUPkZYxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6431.namprd11.prod.outlook.com (2603:10b6:8:b8::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6813.28; Thu, 5 Oct 2023 14:14:27 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 14:14:27 +0000
Date: Thu, 5 Oct 2023 10:14:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <ZR7EvL+ucWI4uDTX@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: MW4PR02CA0028.namprd02.prod.outlook.com
 (2603:10b6:303:16d::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6431:EE_
X-MS-Office365-Filtering-Correlation-Id: 94869bea-b9d8-4754-9888-08dbc5ad61ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oOQKIlb36pOuQDgFwhmJK/sKL0jDT06u5X2BY6PGZHJZjZlv3aGu/e4uxgDaMUUjLFRUyzy8oRKpU7358IBu3YFaN15WbB16vQpNmSkt9uwjOwMRkWNkgfIxMQMarrODlOKetyEDtG4mp2onEKodz7XC1Z8aHqVmoG84a+TrKLzWneu2rys35/yXXC3JMAi/cgbrG3jKEw4d/ukkUsa3wownVe1xa4k87Mu+JMI5JSZaO1H7XBca6FZozkSKciUERPEi41wyAZ0n/cq37hgDj8abDEV8Kp3Ich7SANAldyvUp4VNcDbDqL70Kl6cRBztD5V4Osev3EextLFwqk+jB2e0vlpeaj+KyX+bVPLPgpsVrQSV1RNjaz/nRFpyvpk1v6sR8XWsBtIJ7ZkyvRmS2Gm2L4lvgL0d2hrqIQ+A5v4zHFLEXLI0kwVgGS/FPZpA2mB7A2zKfCiCOxBt+UCcO6tLAU/Lgqdb6F3I3vo/+yjY+TzPXfCz4EjNZp8fwEfL2hmW/pJIBlBsv1r564BcymXxU8BDJ3Fn/mN73azSyam5eievqoQgjJOCVXNa5P191+s793FJjfYEw/ETB7d6k+UXFtMa/tz/g12OV/YYxEs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(36756003)(83380400001)(2616005)(82960400001)(6486002)(6512007)(26005)(6666004)(478600001)(38100700002)(6506007)(316002)(86362001)(41300700001)(66556008)(66946007)(54906003)(66476007)(110136005)(44832011)(5660300002)(2906002)(4326008)(8936002)(8676002)(7416002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5NRLHF7LNC5YMbkKX950xiAiGgHqPA5mit6evefNa2UeXTJzbDM3k0s3ea2o?=
 =?us-ascii?Q?UcjEkboNH6lFJsAEyJQ08cUMqECigSqTjHiARp6FMS0xIAvGL4tuor5JiXm/?=
 =?us-ascii?Q?IbKn45YUQsbjzY6VUhd1RS7zaFOd/JMDrx/62oPb3UXCEbo27zXYQUF0UYIq?=
 =?us-ascii?Q?TvbIlz5BBtgVdZpBXtaisPqKpgULQSW2uEjF+lc+mjKPA0lCWhyDD8TeQ0zS?=
 =?us-ascii?Q?65OJqA++0WTnWenGLLRC7DmLbhYLGQyJiBfh+tAzKC83NOgkC+wApFMYLzOd?=
 =?us-ascii?Q?NcwUNb8Ug07QNfk0yqixVubminbrV7Ksgn0yjV4hKtn8eR+FHjr7Nd1tVIzy?=
 =?us-ascii?Q?jb1ZmI/Snjzg0h/tZ+QUn/NVaaKsOy/dalPZeHjrCXA91p3+qpQxlspPV2gC?=
 =?us-ascii?Q?YJSapXAhiSnfGD/7hxdo2NMwAovhBBklz5O5mJCIUx2GjngbXEUPyCWe41BY?=
 =?us-ascii?Q?KcUH3+ZcZi1+0MMlnv3X8jAGEix7gSw28yxCrrgkHtyEMEJO6xbUpCPvJxpj?=
 =?us-ascii?Q?cXkBrnfQC7o7G8vuyTqkuMjAxCv3aloWR/qWc9LDdNxlS7qbjoRd0ZQ1LjP0?=
 =?us-ascii?Q?nH1Xg+v3AarQLnueRKXasy/CFuCauFkq0jDcNw0Y4fhB//4z6LmJrOYjcwv0?=
 =?us-ascii?Q?ghSe8NQuynmLEGv1Iv9AmRkJejdHOpdRnFvOlGs2WQqtNkdblPyT5ZgMc4f9?=
 =?us-ascii?Q?H0kGurmbRVkIGUHP+7SHoTY8EF1PSk6u3XlQ/xD5UMs7cmSrNkyZjyh5NiIs?=
 =?us-ascii?Q?FxpwdeUCb6BqIGQQINOUaKD7mslZAJUk96GElY6qpjcv2YNpWpZQDTPJRdJY?=
 =?us-ascii?Q?oSvp3mOzX8wSf/qIAcXzBI3+RH2dQeKfHsfSxK/lsulSKkgiXNo+6GLNcWsY?=
 =?us-ascii?Q?lF+DwoUtwQwDBzsu5za4becaHijj3Ji73iKHWrqBvNEZ14ZAW9gbZrkx/2BX?=
 =?us-ascii?Q?2PV8hDqTOO3g/z/lWaXmtTBjh8qk/D5Fhdzr/s/hYOe28zIxrP/LxOCQD6rh?=
 =?us-ascii?Q?s2Q6t4ygbD57x4zK9/z79BbKn+MpvQA25DyWlu8Rw4UQxWKovur6XC56bAgc?=
 =?us-ascii?Q?R1dpLNt+TjO790IGeF8Dj68tWE26gyK+UL5rhlXSZJwuDboLerPecE2pawT7?=
 =?us-ascii?Q?JBo0DVGUQTLoRPNszQyny1QnAIT0kzlOuU8GpSYRy7RLUxvqguqOEf32cBUW?=
 =?us-ascii?Q?ZV58QtY0WD9JRO5qmwfsRakGVyPDahkISLOKsyKWCNQXvfMUVBMfJmew4NhL?=
 =?us-ascii?Q?+cfSeqUiINoo09r8dqNPYfYw0QwdDfe+Ee4oe5cKl/B01lJ50VwvFdYP7vNP?=
 =?us-ascii?Q?DnS3Msh8QIpn4qsgM7mntbx2lOFA8NtWBGVgZBlQRSByw/ySxuLzjT83WbVZ?=
 =?us-ascii?Q?7Qx7yO/jfiTmflfWliWzOhU1Mvmux8/VSGL/qRkRM2Bs16l374MYyEJCQB4q?=
 =?us-ascii?Q?i8B9y+Vz/fiBg4HD14QBX1M06fpvmERltwjc6bn0TtREGO+fL7I1zletkyVo?=
 =?us-ascii?Q?igAF8InZNOyVSTCarH0nKKOu9UK2GC7c37PgoChR4banKXlrExtGSSUeOht+?=
 =?us-ascii?Q?QER2JRq4WX3JyzIVvZWNrzeRzc2K1Ppimnv2lmwTN0Rm/Oa0+frKd5Cu4NW8?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94869bea-b9d8-4754-9888-08dbc5ad61ec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 14:14:26.7142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 980Xtpz2d3XWWuuHPLyaLAZfSztKSrz8Q9hvnQ3/PL7hEzPCnud/+9zTUNG4NyMY6lGlV5+1nHh8Jdvr1isajA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6431
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
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-fixes-2023-10-05:

- Fix for OpenGL CTS regression on Compute Shaders (Nirmoy)
- Fix for default engines initialization (Mathias)
- Fix TLB invalidation for Multi-GT devices (Chris)

Thanks,
Rodrigo.

The following changes since commit 8a749fd1a8720d4619c91c8b6e7528c0a355c0aa:

  Linux 6.6-rc4 (2023-10-01 14:15:13 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-10-05

for you to fetch changes up to 1fbb6c1d88c421bf9e7fc456aeabc5dc026062e0:

  drm/i915: Invalidate the TLBs on each GT (2023-10-04 09:00:37 -0400)

----------------------------------------------------------------
- Fix for OpenGL CTS regression on Compute Shaders (Nirmoy)
- Fix for default engines initialization (Mathias)
- Fix TLB invalidation for Multi-GT devices (Chris)

----------------------------------------------------------------
Chris Wilson (1):
      drm/i915: Invalidate the TLBs on each GT

Mathias Krause (1):
      drm/i915: Register engines early to avoid type confusion

Nirmoy Das (1):
      drm/i915: Don't set PIPE_CONTROL_FLUSH_L3 for aux inval

 drivers/gpu/drm/i915/gem/i915_gem_pages.c |  2 +-
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c  | 11 ++++++++++-
 drivers/gpu/drm/i915/i915_gem.c           |  9 +++++++--
 3 files changed, 18 insertions(+), 4 deletions(-)
