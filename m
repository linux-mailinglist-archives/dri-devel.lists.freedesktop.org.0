Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D3A5E5481
	for <lists+dri-devel@lfdr.de>; Wed, 21 Sep 2022 22:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E505510E0DC;
	Wed, 21 Sep 2022 20:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93D6310E0DC;
 Wed, 21 Sep 2022 20:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663792403; x=1695328403;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=a/8d3Nm4D1tQz16iMlwlblxVbfanP3sabVQgqhh3tV4=;
 b=DvbSnGPLPlE5uhdxi9jNdCTi05F+QVKxzwUR/zBNHPAZlrzfBeyWweh/
 Oy8h5yv7HPKCXYHulE9UYkfB+hh59cNgktDJV3Pae12iKmYH2bIyEas2p
 gToZWyYDQyA0STo47Z1sH+Q+gfz6c7MGPXzRss4TX93u5VyF9tH/LiN1x
 lW/puBculiaymBznfzxHdmGCFFv3f23ybnqRUSHcCUUNNDboDulIFiVwG
 Qw8kbmbM3tMuMUIpMP+q5dHF0XcWIArLo4kvQDQ6/IfqiaI0mfZj+wXQn
 s6VFxc6MqHa1kjo4ygSDo18aklOt/L2iEj+hDcrBLle/subOHuXNZGu60 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10477"; a="300106212"
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; d="scan'208";a="300106212"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2022 13:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,334,1654585200"; d="scan'208";a="619509030"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP; 21 Sep 2022 13:33:22 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 13:33:22 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 13:33:21 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 21 Sep 2022 13:33:21 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 21 Sep 2022 13:33:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mu5OZj/pIAkiWYfvezw4sHqwPQ7ANReRIIftecdP2HUiuAf5EnmW0dohCA6JzqpX9d4TtEpn+dhSc05T1uXcIo66k62FsYS8r/W+9o3PnnpF0EL3cfGK0Qgf7O7NPiygWnXlf1N7dTsBKe4AsfxKN4agLGGDP9c9vjKNu4DYifJxe4oPLp1dRMYgq4RppoSA2FkDC8wSUcP4LhRoXJUAivjYdLMFjr2GW2znYfI33nrGByOzMONCVO9E/1JyJcpvetrmoXI+4L9lXM51EehUTj4Eo+OkQsED0wtecySwKLyM1GbvbKUkhb4uvFYInY6goHr80ZE7MK5aPzclrGb9qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZV3cp9v3M7CSt1+980YsP8xZ6vWI2kq8fLJVxDoXj6k=;
 b=g4I2sE1vzQtNtw91oYaoZy8I25M9vqH7TKOjk6CR3lbkB6YFZswos2hbRSGBkiaDHpM5j7XwTMLd3+NcIAGJlqvxdYE1crWQ/KSLqViQdlpVnZZsf7bEjTGXplstohDEz5n1QaotqxWO+yCMxVhJD1CYvrb/81WyT8OYLimB4VZfzOjvjWgMcQEOeFyT8ZXtLyRFMI/UVagurFtRuEPubKVappAR+uMHE0UbVMKoemIWbvA/QiqF0PFVBF7SAFAWTb6OBFtL1NAm0H02M2MjdmIzggnNrZ19bFe7bWIr4yDWz7QIsiQSgknoOvtPQvWygoSLlHYfhOc60rqyBjivDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB6454.namprd11.prod.outlook.com (2603:10b6:8:b8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.18; Wed, 21 Sep 2022 20:33:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7ea6:6f6c:f2dc:cec7%3]) with mapi id 15.20.5632.017; Wed, 21 Sep 2022
 20:33:19 +0000
Date: Wed, 21 Sep 2022 16:33:13 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Yyt1CV+YIjKQZZMB@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: BY3PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:254::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB6454:EE_
X-MS-Office365-Filtering-Correlation-Id: c1b64d83-6527-49ee-f906-08da9c108515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UtsYk6+em0+1f1YQvz8Yh4HmNQgSMy6c7k/oTM/2Gcb7ZBq/V8EpB7EJtMkHSb7/EM3AM2Vo+iNqZxnMNluf3iWSIuw2nkSmV/ceV8D4Vw9Zg/FaN0Gz3PcmENdKuilM32P3w147SkFM9Sz2oSBPwEEmmb1QYtjBG+Nv+BXYKb21yFMzNcaOxSVCF4tXgYiwvrg05QQwB+C4+pf0idpY4jBmuRgF0vNfWTvplyvCAdiua1svcmkFjUYXrXy7rgzsIekigK3IOtA+LMeX1wV5OZeq0fH63wj/PntHQ0nnnRyCyyjyeZG7DFe/efXSFZeTqj/1RHQyB47KQpMFTWAt0oYuaGW2SAhJym2i87SbBuJSUxNC5YrWC3yH1f48CtEyq6L/sn72Yrb27qnyeRfGkTmBg3/Zcu4uR8jvnJb38f/GV+DGIwPfMBeBZwQ1IO08misMzyRbUy4wodOzsGQhgx74G27sS+TR+35wgBbvo0cqe+kTIywKuPiE0G6cMgq0pJ8272qXeDs89sSJtIptITKgxe18CQcLDj9l2yAXakXISZtujMqoEbRbgUnADrchwz0AoQq6ledJu8xNxH9gAQTd17QX8LKYrGAy34zo3kWEYBBFxaBoMDfvXk2Es2yMzJ0I+Od4cfHQnhwVbzV/fVI1rzGrwo/w+m/6hJ4OW/nmXDDL23EpPIxRcDtDr1ASH/Msqe2Pvv/tis1hawYzOsElTc7Bc57jUwhHagE7R4+lpBXUzL4ZAn+bg3Vz1VCT1cf0IvJN9J0nh1Wd4tHKnQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199015)(66476007)(86362001)(41300700001)(26005)(6506007)(6486002)(8936002)(4326008)(186003)(66556008)(478600001)(54906003)(66946007)(36756003)(316002)(6666004)(6512007)(2616005)(2906002)(83380400001)(7416002)(82960400001)(5660300002)(110136005)(38100700002)(8676002)(44832011)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nq/pVTC52Zr0a+rYsqUI40VP+Ued2empa3JJIvGKTs4x7enzzVFWKQPCeKbl?=
 =?us-ascii?Q?UgIJRiF0tSY/wlWjPW8ligmUolL3pUupaTh6BLS1nxUx9Vf915QxPpMmRb2R?=
 =?us-ascii?Q?Ex5utPN+Nlk54OLqMAHMF/YB9UYkK7M50ESIm1LzOkcRsejdWFa0tisoKxva?=
 =?us-ascii?Q?tquxXz3ujb2P+n2igtjwYAYV69yafHLt8O+rurIkwluvtnVyzTd9qkJ0yIG+?=
 =?us-ascii?Q?JBOj8VZx5XRLAjIY8MtlxpoGTzlI+d2uGXM5Op2rPyi+n/u99ZXwIOKwY9Ey?=
 =?us-ascii?Q?2GSMByk0SSdm5r1QVavkX3msCLDEIb7tcLnIH+OkTH06TXGfquSIkwhv5JiR?=
 =?us-ascii?Q?fd/7W9mK4MlYbs7Btm6JRaIMNFTiyZ+he5x50ewaYmctwY5fmzw22/Sq2F2h?=
 =?us-ascii?Q?KFEvl5DddvhdpG/iiucHRAqYfoSR8vsvNVbQ13skHVcLkd0uYlzpm70ZmI67?=
 =?us-ascii?Q?ZpafhNJ8dyynIhDr4iDb3j4n6hHmg+VFJiwSF/vKi8rQwMR2GhwvEmj1uvr1?=
 =?us-ascii?Q?PKUL7CTpwHFhwX6gNeJpq1ZdrZPXdT46XnexdxUGr/E6vOBV5OhKPM/6c8EH?=
 =?us-ascii?Q?bd3pmXzd/thUdY8NytBUuCUbLpXhZNto53d2SZl89y1jGlRYAGZGE07OVW8f?=
 =?us-ascii?Q?zQcaBlVkj5NctN7TfqTZStcvAST8XClpdPDoirMKDYL5Hbe8rJw8sM6wGZaQ?=
 =?us-ascii?Q?FmK0wvanXyrqz7eKRdyorTKZAqkiGrmOwMQ+fDvJx2vigFQbOh2m4ctbaPyY?=
 =?us-ascii?Q?updBTUFnDubeqFHsdxCqmh19zoUiwtxjf92yqitvuNSDGkce/ngTZU9dw6V4?=
 =?us-ascii?Q?5almgHOINYTRXZ8bLEWon8CdpFOLDSk9oYg9qm1u6YOUVtAFWsueybHlsqSQ?=
 =?us-ascii?Q?0rieFAfxovU6bw9iezwrQbkWCMsh6JW1QTisaaLu9A77pSgKQ1iIlw18y53C?=
 =?us-ascii?Q?Dyl0hT1m/X+CJkAUxrmgoN/R4+mVIj5OXBfurPqeIptmm3IRyWhA0eiHCZ8A?=
 =?us-ascii?Q?Eo31zF3c334B3idUAK/ewkHAe3R8kmvlZKxCxxuvnbNz2ynyNfP3G7nuW54P?=
 =?us-ascii?Q?unklLXq1eCS1fXXWkmtxjD5eBsz+uTY0VwKa2UdCmjOs/+SPGsfFf3pExTZT?=
 =?us-ascii?Q?L30efHiDK00KYkoW+AM89wdaHkiiJmyoRxxHDL6rHlg8d8f6wIR8IavxYnxe?=
 =?us-ascii?Q?cZtGhYpcACay9tcd3LX/FuM4zhh1jk6CCdrjYdOPZpcNTStoW7ck+Iiy5MVV?=
 =?us-ascii?Q?Fbo2Tl+7nhb7W3Wyd1Qp/+ZcKsv1SNppnrbqP5So+wxey9PtAGSeWMBssdyF?=
 =?us-ascii?Q?uP0coxU8VqhxY2pIl7TTD/AlWUgvRUFUVdhO1isRyFmW33+Mnw6Ux9ycvBGL?=
 =?us-ascii?Q?beWB1nzhvbB/yPBv3Gs0lLPNrCaCMr1TY/2viG7pV0lEbuwgoJx69mUVfYDx?=
 =?us-ascii?Q?Iubo31VfjEzTJTsZx2icqtYhxw0kow/EOvEmZVI3ksBYVtK+0FzTEe1ugeP+?=
 =?us-ascii?Q?iDgZbMjiyp9Ik/ZsSsNjkG4JTCCA/N2ox+BVSc8jYl7Zaj0JGnF4lqj2lvAQ?=
 =?us-ascii?Q?czB4zZi7i1nX0jDMlzrYaO0SW6UWEWYas6flKYzBVjQMOyyPNH94tAqMYwTb?=
 =?us-ascii?Q?Mg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c1b64d83-6527-49ee-f906-08da9c108515
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2022 20:33:19.4128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXyaiRy6EjRiddx9UhyqK2u7YRcYPtIua6oYBFYUfpeLcUbDPAjEBpS6oK3IV8Jd+803oy3scsvu3Gm5exx3LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6454
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
 Thomas Zimmermann <tzimmermann@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

Here goes drm-intel-fixes-2022-09-21:

2 gem context related fixes:
- to avoid a general protection failure when using perf/OA (Chris)
- to avoid kernel warnings on driver release (Janusz)

Thanks,
Rodrigo.

The following changes since commit 521a547ced6477c54b4b0cc206000406c221b4d6:

  Linux 6.0-rc6 (2022-09-18 13:44:14 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2022-09-21

for you to fetch changes up to d119888b09bd567e07c6b93a07f175df88857e02:

  drm/i915/gem: Really move i915_gem_context.link under ref protection (2022-09-20 10:19:05 -0400)

----------------------------------------------------------------
2 gem context related fixes:
- to avoid a general protection failure when using perf/OA (Chris)
- to avoid kernel warnings on driver release (Janusz)

----------------------------------------------------------------
Chris Wilson (1):
      drm/i915/gem: Really move i915_gem_context.link under ref protection

Janusz Krzysztofik (1):
      drm/i915/gem: Flush contexts on driver release

 drivers/gpu/drm/i915/gem/i915_gem_context.c | 8 ++++----
 drivers/gpu/drm/i915/i915_gem.c             | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)
