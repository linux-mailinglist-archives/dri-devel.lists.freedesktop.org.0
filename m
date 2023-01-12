Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E0AF6678A9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 16:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2821E10E8FC;
	Thu, 12 Jan 2023 15:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E52510E8FA;
 Thu, 12 Jan 2023 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673536268; x=1705072268;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=ERVu8xXBjEelY4mdg+iweJYz/t0cuDYeweqlQUwWccE=;
 b=WmrAQ0ql+uBNDX4t8tcPGSXo9+HpVqiE6fgF3vXkDXS5kzKB4KCXbWcb
 5LFMsmDQzrAyMb3lrvL0gdzBan4MKoJt+MHDlYyKl4lPdt3NrTq0r8HWp
 DMI0ZCpVf9W9b4qEbQBmeYd1k0oBwmKUWLgacwwYdtfyV2PD/qGaO1lGM
 5ijkDWWDEryPrZ2YvMnMoOP37q5Qp64xW7vNWY0XrCq6yTam2eYDrZraB
 +CTk5pbVuN7/EOyzklJY2sWKB1pxCPxXA5+i+xYcJMOkB1TVTtVlKC4WP
 7rGCBn3cWQTeIZ7Jh85s9uzpTCNO0kEfY7aH4JMlr/C9ITZ8K+fIK2J6L Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="324975129"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="324975129"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 06:37:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="635401778"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="635401778"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 12 Jan 2023 06:37:27 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 12 Jan 2023 06:37:27 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 12 Jan 2023 06:37:27 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 12 Jan 2023 06:37:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rw688K17UEHAv0Rs3qqTGsSffL3Vfh2Os/rvMoSzHOTQfZjcDcrDdHjBhGwkrRen3ZftQgRkEpt0LCkpOY6mHtj5Zsfob88km8zT+8jxKXL99BLeiKJfSvrHX+tTEd39bWfk5JWAJ80JCkzuPnWP2e/NVfM0LwrhMolJtcJpgT+odJwmqScsIB9Tmj+Uc863OcCmbun0BA9SY6QT1G44MKlDNXRR7B3+8A952uv3PRcN+Eoy+efGbflJT5/XKuFA1q1Srjiy71Q5YeayC3DrbajIYe5m2s9xsSVNOsWjZcc8THwYeDRsxEodaRkejy+UDldkXt0jHwl1Ka/3iv1BtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SKEIqs1+ByRYVg3dapwEpxGUpoubowmjHfq1Xao3xLI=;
 b=jSdis2s6Ehg1zMGBnLY/AsRm3CL++ZTxaIjl73Ju6687YIr9SnLbiNE5JNz4ef5Xmh9yBQ9QqGbPQhT4q6TWpEhvDcGSbawUjBzh9/Fva/dPU/9SCsl2It/NAXF/ObSdZQpgYNC03/tT9sPB8szFeDGRFEwqaWl8Av0pN5DHKahR8f+gXtNhNSYqh+UaMPElDpDn7Agsaipz+wXPbr9j1DoAs2kpCGczqBFjUc2JG/jZdaNJeWhlpYyi99ntnNQnaDgp/+i3Ms0nK1eVIHZ1DuVnI8q5xIeffMsWRj+mW9KiPO4lr0vEH/fCcABB7P9CHK1W4tn7WvAioL3p4X7E9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7986.namprd11.prod.outlook.com (2603:10b6:510:241::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 14:37:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Thu, 12 Jan 2023
 14:37:23 +0000
Date: Thu, 12 Jan 2023 09:37:17 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <Y8AbHelGeXc5eQ8U@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SJ0PR03CA0227.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::22) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ac9729-9e9e-4b2f-7049-08daf4aa8450
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kB+FNFkgb78DaHRZkjT4iYaKGpxoZ+QxZz9tJK4wm7X9xc+I8QAYMgHALmt510JfvNYtRJ2E5lYwhCoNyH6nkdy866EASdQygDYiNE8T19tRpyIIq4SbmxGEbOIMLvKkV1+W6LwkcX2MnJulmPaMxzlAw1IlmNWeYrf325PCHm4p48jTlxOardtbFBdt/21lKPnWpuEVyOBLGG6VW83uB0MCMfsiqb2jPBqMXdyYpkuGwM4ZdRll0NHJchV2458V5RnqkUhTwfaBF3egfAHcqzmvlN6BZuP7AHamx9i1y89+TNEvBvd6bFAnN8wpPwcXvlgt06PEW8yYve9Eo1F1PSlBTbF/3hoR7Jb++IUqJN419XvNMNNgLraXY1qnrmV66qnH0UShgpJwF2TsqU73btUotBmLn9mulh4XSUVmvJl5Hor/mqOa9ssFMlvc3XoLUDU8UROcr9yzBzTLVh61VvGg504cRjm2dPepsYAkXquUX/27z3GLr3GAml9xBcOB372X/SuHb1/F8cNX21qVtAZ/Aioz28B5Du4B/cS6qRoH2msRp3Nvl+FyRr01m9YBUst9QqFNv2MfaU4YOHuKQmpz/Ao0bkiZ3LZj+LtLeT3Tyl8ilVD/VWAux41dB9qp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199015)(8676002)(66946007)(7416002)(41300700001)(2906002)(44832011)(8936002)(36756003)(5660300002)(66476007)(316002)(66556008)(6512007)(110136005)(54906003)(478600001)(6666004)(6486002)(6506007)(26005)(186003)(4326008)(2616005)(83380400001)(86362001)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qUhmHQGpQ0HKyO2ZhZCl8/BIA65AI9+TqkDF25tGl7lm7lMA/CQKfAElyDJY?=
 =?us-ascii?Q?L3m/Vr0FXIk4ZbxAm6U9rrAklxuldiBAO/A0c4mo4ow6PgS0V3n6HSO1DoDy?=
 =?us-ascii?Q?kjus2WqHlfxxvpaBwOLJ5saSuJDi+2Kou1FeN+W75iVFyRdR1L6qeGIh0VsI?=
 =?us-ascii?Q?Wob6mEthUc7Isec0jQYJE4PEMVtfGiEPKh5CUPXZXtOlNOx6uRHwHFuUAqUR?=
 =?us-ascii?Q?eSyONR7VnXkUe3ncxfT3y1Y42rcgtoQBu6sAxTWCQ9LN7ms39CYsPY0a1Tpu?=
 =?us-ascii?Q?EPb2dhcTzkncvVgPVvc3R8YyxVj69xnRpkk0hH2ReE35HyMfGpXThtjWvRzf?=
 =?us-ascii?Q?JB6cu5RDwjx+z+T/NEgLQy8pkLCUxX+651kbYx1zCnHwe6YhwsKSpUBlACyD?=
 =?us-ascii?Q?MrIRme4Cu4Dz8rebi5UwVhEm/RPgKHulfUx+Wuzm6mZyFuyRvO2V/AilCzal?=
 =?us-ascii?Q?pX2v5WdRGpIdj27n2nJ5DXiaNn3IcDRbyQ4+Mpm/Nr8pTP0zq866TAHkYUMw?=
 =?us-ascii?Q?xFJwJqbbAG0s2RRj+8D/FlIOVwYTFCIwrbZJwsk10QV1eg/AEXT/DOMNV1VZ?=
 =?us-ascii?Q?YjrP6OBzjrwpFJmBNoAyUqKCPy9TYIzhflaIN6Fk0HiKl2SlX+WzzyWd0fFa?=
 =?us-ascii?Q?QFXAmezQbFbvgLjhDLswbe4agyKwyZ4EzFe7rfAp3Kods9c4mFCU+65yz6an?=
 =?us-ascii?Q?4hVXJVv6bmjHg2Mn3ouZ+7NP/DXzcEb4ENZ1PQ0NmFsCdTXT/YsSMm7nF1d9?=
 =?us-ascii?Q?rb4jz0iGkD13Qv6UKtpaF/I0ruRdStWZCxzrieGngM+us7JYS/2w6vXiWze/?=
 =?us-ascii?Q?fTV54ZQslGKShrrqoBa1rbDeE8VLF4rC8p/RxY9NFnP+SAKpQ7Nkc2c/bgRN?=
 =?us-ascii?Q?UvAYYZe/Hm1ur+ATgHeTngn5RMETcWt6/wFplbINxDMwkZzkG1/PJBiC4yMT?=
 =?us-ascii?Q?K0b97QyaTqzb+A7Qw+HnXScMZ7G20AD9lSmJSbQOsIPWJwY54x60AhZUlutT?=
 =?us-ascii?Q?2TGUU0Qehfm5skTkuYuvExkZcZNKiQ4P5TRukFALA8rJ+2HQ/aGuGBIcwXIh?=
 =?us-ascii?Q?8sQjQeNH2BpXUC4N63gUExZUHAWy3lygeVNeSlSQDmlQOQ/k9ljw2be6+ilt?=
 =?us-ascii?Q?7g9daY5Ul7i5ZxOW39w8dr9LX1H5T8ebp7UIfUr03Cj/hhxND5aT4AlHlIoK?=
 =?us-ascii?Q?lgifTFsy1ZcVcA5cMb4uDHVIE+LyMbAp0TzMR6KVjVVXacwVixU016oiEjXy?=
 =?us-ascii?Q?EwGmA0np3lE4Y95w7Of8JaxQ1miB9kXmZyYdwOFefGF6RZsSg2eulNsiFzH+?=
 =?us-ascii?Q?3VoYPxdRJBnP85VuSs9YDGJx0lhrJMq4iSi2yxABzVUMJJYBrBaq0lvLeVcj?=
 =?us-ascii?Q?o45Ugo9y7z+W0wMdBgcVtyh+lqS/BTwKiRtXFKLkuZo/cDzEeYA7Rtxaw+8A?=
 =?us-ascii?Q?kFfpm21vjgDnj7EInp/qIVNqE4AREHvMwYlubTPALtQ8Iq3KxNKpZtxc1uZg?=
 =?us-ascii?Q?/WyiUzG3ypRUyDEg6MfpyS3/bwp62oEV9imzXho/bB7UTeKG+w9iDqjSVaj9?=
 =?us-ascii?Q?gHYNSuA9g+o8yCZUZXeXDb31ZXwMOQOFKFTupvBdLhBC/fz0Q1Y+RshuacGZ?=
 =?us-ascii?Q?Pg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ac9729-9e9e-4b2f-7049-08daf4aa8450
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 14:37:23.0014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8RSvJ24/pR+JKza8EZ6iZARWGksi52UjLWFXkDfoHoQanoxx6Fs+4C8ueo67Bd36rCxd0RuqWEssVTbk3ZwaqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7986
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

Here goes this week fix.

There was only a small conflict in the multi-cast registers fix,
but that's pretty trivial. Just go with the -gt-next version if
needed on your side.

drm-intel-fixes-2023-01-12:

- Reserve enough fence slot for i915_vma_unbind_vsync (Nirmoy)
- Fix potential use after free (Rob Clark)
- Reset engines twice in case of reset failure (Chris)
- Use multi-cast registers for SVG Unit registers (Gustavo)

Thanks,
Rodrigo.

The following changes since commit b7bfaa761d760e72a969d116517eaa12e404c262:

  Linux 6.2-rc3 (2023-01-08 11:49:43 -0600)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2023-01-12

for you to fetch changes up to 58fc14e14d288d728bf48377b81bb77fd17bfe3f:

  drm/i915/gt: Cover rest of SVG unit MCR registers (2023-01-11 09:53:45 -0500)

----------------------------------------------------------------
- Reserve enough fence slot for i915_vma_unbind_vsync (Nirmoy)
- Fix potential use after free (Rob Clark)
- Reset engines twice in case of reset failure (Chris)
- Use multi-cast registers for SVG Unit registers (Gustavo)

----------------------------------------------------------------
Chris Wilson (1):
      drm/i915/gt: Reset twice

Gustavo Sousa (1):
      drm/i915/gt: Cover rest of SVG unit MCR registers

Nirmoy Das (1):
      drm/i915: Reserve enough fence slot for i915_vma_unbind_async

Rob Clark (1):
      drm/i915: Fix potential context UAFs

 drivers/gpu/drm/i915/gem/i915_gem_context.c | 24 +++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  4 ++--
 drivers/gpu/drm/i915/gt/intel_reset.c       | 34 ++++++++++++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_workarounds.c |  4 ++--
 drivers/gpu/drm/i915/i915_vma.c             |  2 +-
 5 files changed, 51 insertions(+), 17 deletions(-)
