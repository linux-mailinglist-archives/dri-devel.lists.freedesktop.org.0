Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C07F06EFC03
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 22:57:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B976D10E08A;
	Wed, 26 Apr 2023 20:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45D810E08A;
 Wed, 26 Apr 2023 20:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682542642; x=1714078642;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=9D2jkKlK/Yv2dNSC5NwYDAPbxO0QWUw2m7bLW7lMIbg=;
 b=Y3C6PBu2YypdQuKSxAjbac3svc0K1W6eggAoC/R+e3kYIwb2NJ9bfmrH
 srhVqw0zt55aC/Ug6YHlcW0RUXfjNrKAjTu/W9n48qT225PEYz31hUjcB
 ZqGl+lN4xjzSiqnKv8PFrznVus4ZqT87axgdFEdrgJHkgFZff2z074nAb
 LX1xpRm/+HOmJTKzJTXg5qiwYKxbxFpBnX3WVscCQNKLIqdrd8JMYDeJd
 UqhKz10uWbN6LFgphk2EaivCqcWuYb7KmvOfRlW+Lgm0DEvprGtL7kLNg
 K7XEtVTCUuLPhseSk5HjhFZMQK3m71EoR1n7lxyf+wrtlkdp7FGyaCp9h g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="410249401"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="410249401"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2023 13:57:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="868434933"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; d="scan'208";a="868434933"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga005.jf.intel.com with ESMTP; 26 Apr 2023 13:57:21 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 26 Apr 2023 13:57:20 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 26 Apr 2023 13:57:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dHsqdlxnLyEjK3xZMyZS+TDuV3MkbBHjhTJoBlBl8/igncSN9EE/ZloBBatM8hhmIA7ozx8d4FAe1Fagob8GiySxguGh8wuCqjbEgZIaqxKuKqAyfYjkSY66nVEII/vkGV42RAKrKwvnKxdK2HKCafdHoWf7V8qj0G0d4i3DCJKY0zEzEhQ7mba2aLnJWT1tw+IRXS59q+VshQEVfWxY7zVKZlXFRqAzTJ7lEQA3wvJFMP6/7QqsE3i2EWnJMo5sv1yEn9hJJEhBoZGF5Zq1Ywkrg15zsbL7IJlCigc5hiwjn4oVJlqdjTts55xJKU6ybwFhBUljC9KJ5bvP0ihXww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgXF+NQtExQyzfizyKO62/ZuXuIGFrL88he986oCiUw=;
 b=BY8lm4nBJO1ZjydkX5Ghgpuh0NQ5P/oO5i4YPmbmeBrsOZIJ0IslmIwdOBVJp+jWfjAdzydhNmVljIn2EbMNfEvK++j21ZQ1/znEVYswZtSeo5StYoLP0nTadD4FHtMrHRgjPXHT6z8KrghbPF3o4Jtx30AAQed7BJplatM4ZFOn43Vt6NdwhsrNv7zPhW9hO0jZ+FElAcJgHEiyZtcOZP5mnw8yRTnKRanp9+nrpjnDB/AwBm3S9YbP1+OM39XCJUUb9bORSI3M9q4LtvImg8XtHW9YG6ledSwVHjx9v9q4uqq+eV0jAXHCbi8HLBaNkeLhTFCSTa1jPCrId/kdVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN0PR11MB6182.namprd11.prod.outlook.com (2603:10b6:208:3c6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 20:57:19 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6319.033; Wed, 26 Apr 2023
 20:57:19 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 00/14] Introduce xe_devcoredump.
Date: Wed, 26 Apr 2023 16:56:59 -0400
Message-ID: <20230426205713.512695-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN0PR11MB6182:EE_
X-MS-Office365-Filtering-Correlation-Id: 82043de3-5f28-4426-9482-08db4698d2ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yVI6exqcEkT8bvEUDQtfBtIqj09S8spQmYqWl3aoFul78XiZuH3x7WNt/ANM8dOAUQYC7rDHevulY779pmW44hswa7z7dXDzaU8H2u8rd0/I2/drIcFTer6cW7HB66BI/687npdjX5+wNvtrxOmM+HTnQk8Olk0ejTWZ9oNMwt/vmwa3ObZR1RnOdtZoprkccozgbjj6YPMRCQ7g9EImU7pzwTiAQ0TOnkAAkmSwBQLqwrDeVWSx5Rid5QdYK0X9FkuUSoPaRwRlujxoncQOV8EqFVoRrzhKF3s+Lwmx0E41yK8rWyLeKLd/oJEzeeBxd2wOxy5brQrqu+yZfhwafevqCYNJ7ElORnrem1gx7K3v1UvrnGYWduSB5N98ZelZ4n9bCOIUNVchyq2hFVLgzP+Ugk/uFxuhTDCzIrabtdA8WSN+OlFlVQDn5/ba9J9i8TNMv1mQtnnUY+BIP0KrOnAyenYMHGeohaYy9DMxF7I0BPoDVPBKUHE3a4YaHhM/6dXvgQe8eqV9b/fxu4WMkdtfMcMNpKannG9HdkC3q60AsBaeUixuB/+E7wQbSXk7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(366004)(136003)(376002)(396003)(451199021)(2616005)(83380400001)(186003)(1076003)(26005)(6506007)(6512007)(316002)(6916009)(66476007)(86362001)(4326008)(38100700002)(82960400001)(66556008)(66946007)(2906002)(44832011)(41300700001)(478600001)(54906003)(5660300002)(36756003)(8676002)(6486002)(6666004)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R36Lla7u+xEizIZf/qZIJJy3BuTvIxNXdlZ2/mPbuuMlcj1oxiQpM0pcuKua?=
 =?us-ascii?Q?kMGzyG/cFT5S2YkQdx6Qe0hJT+GNqWUyIarQ6XpwAMX5lS3UwLK0IzGIf0fy?=
 =?us-ascii?Q?gRmELnNcFkgR2ysuiVIbCGH/3ObnCAtjp0KMv/10c+TecrNphK7ylp4ulRbh?=
 =?us-ascii?Q?KTwq9pXNGUz636bYt+8FOAUdUNcv7ftkh+WQ5CP04iC/bW/MJVvTIT3MAAD9?=
 =?us-ascii?Q?OB+AB1si/u4mNYCqqapl/k4BJKIw+Tim9UEzjXOer/2ufIf0IfXWMXqDCkKw?=
 =?us-ascii?Q?4/e6kRAPkQ8ryZsCswXnTj2OgfrVjQp1AUNi1NsdM5IMI284dMfX5Nxz9gNr?=
 =?us-ascii?Q?YDPERIamF+uVSNfWtC/TadFRjtb41qQFh/9Bd7q/Glck3wb+BalDsmGOEJdA?=
 =?us-ascii?Q?TmEE+GfaQysSycGDOmegHvgDVD7Np99/HeFBGRnGtp2CNttRMzDM05KQBW9U?=
 =?us-ascii?Q?EK+InSqIBRYBtFhf+HQkV7BCbZy4dssowW8aasg8MPJpTcyFi01S7mk+QkaR?=
 =?us-ascii?Q?T20Nepmd88Djz0XbZxJA5laaYh4loGTnWQbBcYS59IPUlcR7qfH6Mtbwe4vY?=
 =?us-ascii?Q?rUHydBweshFXrpT4KOtcrJb123WHpJtv35DvhgzQyTW0e3SG0K2fNW7AsDgG?=
 =?us-ascii?Q?QbTGmAcBFOUZASNF7QzJGlCamJrnKuHseU638z5GteuLLw0k6kamyDJjDgwy?=
 =?us-ascii?Q?tcXT3+7oXqDua2ljFGhHrgNGpjTI4eiAiW0GjMBpE7KlmOmPyI45hLgQosEs?=
 =?us-ascii?Q?sra6FVoamMAfBvuvR53Dijr+HvSrOlhO6t5FIkgN613psKt2BkYYmvErU43J?=
 =?us-ascii?Q?x6VVIJMA+kkeR/RrjvdDYZdWRSp5qof9Bsou1Css4NJTOL7bjpup43ocolPK?=
 =?us-ascii?Q?uuejfpRMLVgB6/q3MVIuk5dXuPY7ZDWfBcrxjrUnkKWCaqyA16LnazaKszfi?=
 =?us-ascii?Q?NCUoymAoJBV+dCAHGxP4GKKo/ZfAPOAbE3DNi/03ofIKXS/TAcTToL898458?=
 =?us-ascii?Q?30sgfCPhu9oJLGGcekpOHlqrmb/m/838+VaQJg8msdVUWxh6Ei7z4/EHgu7j?=
 =?us-ascii?Q?hnrSuMZTk1TZEVBaTH1YRirpWpsigWn69cVyg/kYHxIA0P+svX5sPnUYDnvE?=
 =?us-ascii?Q?ZGu0ky6Fke1RdntxAx18f6iY9UDzkVM6tn3HyAAHELuMLaXSaOx5pCkVPwpo?=
 =?us-ascii?Q?/Ogsd3lY46cnp7jUkHmA6+3/XbVRRT6tR9iTR1xKKyD7t+Dm/sFZ5zm5tONE?=
 =?us-ascii?Q?id+FRYKNiblVUKXLGoFJhBnHNVgWKi8mAqttMi7otq1iiXijUBMPf7wWbQL3?=
 =?us-ascii?Q?gHk5B79+E0S4yWU0xV5QXCnqHTtMS0GvJ8AiGddhrQg078W+kHOCMW2FRUph?=
 =?us-ascii?Q?O0LtlttAAgvuAtsxD6uYnhfQvycx8UO2CnVTtihC65A5CFx5kzN24NoUOQoF?=
 =?us-ascii?Q?XdIA3CR0jMNd1PYYkyoQWDeru39EUh4G8subar7HDTwKeKvV7RWpuO723cz+?=
 =?us-ascii?Q?TxW23Zi+4+99BJBKwCtysYB1JdmsmxQ6cDycx/MuxflDpXNy8Sf3iG6BhCJO?=
 =?us-ascii?Q?6YvPVBqfO46qzOGRhEIMXudOWkPIap8tOnQay6s4?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 82043de3-5f28-4426-9482-08db4698d2ba
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 20:57:19.1429 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fny4jY8X1Oy43BGhtYTN71HRkpzskLJQTr2dHkHISquq9ewGcJ4+NUSso2nHTs4rkSWPmYZ36WDacFAzFKsxng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6182
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Xe needs to align with other drivers on the way that the error states are
dumped, avoiding a Xe only error_state solution. The goal is to use devcoredump
infrastructure to report error states, since it produces a standardized way
by exposing a virtual and temporary /sys/class/devcoredump device.

The initial goal is to have the simple_error_state in the devcoredump
so we start using the infrastructure.

But this is just a start point to start building a useful and
organized crash dump, using standard infrastructure. Later this
will be changed to have output that can be parsed by tools and
used for error replay.

Later, when we are in-tree, the goal is to collaborate with devcoredump
infrastructure with overall possible improvements, like multiple file support
for better organization of the dumps, snapshot support, dmesg extra print,
and whatever may make sense and help the overall infrastructure.

Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Rodrigo Vivi (14):
  drm/xe: Fix print of RING_EXECLIST_SQ_CONTENTS_HI
  drm/xe: Introduce the dev_coredump infrastructure.
  drm/xe: Do not take any action if our device was removed.
  drm/xe: Extract non mapped regions out of GuC CTB into its own struct.
  drm/xe: Convert GuC CT print to snapshot capture and print.
  drm/xe: Add GuC CT snapshot to xe_devcoredump.
  drm/xe: Introduce guc_submit_types.h with relevant structs.
  drm/xe: Convert GuC Engine print to snapshot capture and print.
  drm/xe: Add GuC Submit Engine snapshot to xe_devcoredump.
  drm/xe: Convert Xe HW Engine print to snapshot capture and print.
  drm/xe: Add HW Engine snapshot to xe_devcoredump.
  drm/xe: Limit CONFIG_DRM_XE_SIMPLE_ERROR_CAPTURE to itself.
  drm/xe: Convert VM print to snapshot capture and print.
  drm/xe: Add VM snapshot to xe_devcoredump.

 drivers/gpu/drm/xe/Kconfig                |   1 +
 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/regs/xe_engine_regs.h  |   3 +-
 drivers/gpu/drm/xe/xe_devcoredump.c       | 227 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_devcoredump.h       |  22 ++
 drivers/gpu/drm/xe/xe_devcoredump_types.h |  60 +++++
 drivers/gpu/drm/xe/xe_device_types.h      |   4 +
 drivers/gpu/drm/xe/xe_execlist.c          |   4 +-
 drivers/gpu/drm/xe/xe_gt_debugfs.c        |   2 +-
 drivers/gpu/drm/xe/xe_guc_ct.c            | 275 +++++++++++++++-------
 drivers/gpu/drm/xe/xe_guc_ct.h            |   7 +-
 drivers/gpu/drm/xe/xe_guc_ct_types.h      |  46 +++-
 drivers/gpu/drm/xe/xe_guc_fwif.h          |  29 ---
 drivers/gpu/drm/xe/xe_guc_submit.c        | 258 ++++++++++++++------
 drivers/gpu/drm/xe/xe_guc_submit.h        |  10 +-
 drivers/gpu/drm/xe/xe_guc_submit_types.h  | 155 ++++++++++++
 drivers/gpu/drm/xe/xe_hw_engine.c         | 210 ++++++++++++-----
 drivers/gpu/drm/xe/xe_hw_engine.h         |   8 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h   |  78 ++++++
 drivers/gpu/drm/xe/xe_pci.c               |   2 +
 drivers/gpu/drm/xe/xe_vm.c                | 140 +++++++++--
 drivers/gpu/drm/xe/xe_vm.h                |   6 +-
 drivers/gpu/drm/xe/xe_vm_types.h          |  18 ++
 23 files changed, 1288 insertions(+), 278 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.c
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump.h
 create mode 100644 drivers/gpu/drm/xe/xe_devcoredump_types.h
 create mode 100644 drivers/gpu/drm/xe/xe_guc_submit_types.h

--
2.39.2
