Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D1F5AEB4F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 16:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26B410E68D;
	Tue,  6 Sep 2022 14:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B18510E68D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 14:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662472918; x=1694008918;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=DC7emnL1Rd1ov5yo99+wUyjvWYzf/G/5uD2gtcO8fpA=;
 b=Yy3vYUAxLx7HXG99IKyzWMSdeso0a7cyWEuDKr8ZxE/3k1Y+6YIoI/Vs
 o3JMcMxeruR0MVunC5xRxp8DaiZ36cg09d1Pr9xnxbsOhLme7FhwHWgi7
 v36HV5yMX7M7QN3Fb2mWOmiOReK2lZtXf3dBcwNNKAs1ZKV/2WUjKjrbB
 nvEltMugK20Rd/InkDCK9AK2paw0OYfjSVprzDSmJRMGwV2JV9YN7UpLI
 d9uReJ5Oos8lutRPlp6cQe02yi/qycxnC2fobqF8ULwfxWaPJd1OEskZB
 eaCN0Ur8luVe8ahqqYZMQK8QhUQ7wo81rr3ZWZZFAO+5IWuiAOiibDmVO g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10462"; a="294185126"
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="294185126"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Sep 2022 07:01:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; d="scan'208";a="565102052"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga003.jf.intel.com with ESMTP; 06 Sep 2022 07:01:53 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 07:01:53 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 6 Sep 2022 07:01:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 6 Sep 2022 07:01:53 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 6 Sep 2022 07:01:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HMQxhU/82QHA7hCoWl6oZxMgtuI/0vpgMift+VYoUYEfnXB2veu1EAYEg0GGRb/uDwcCogkucDuENlj9LHasovNRisWYIdRSD79UsUE3lwa8HOm3jZ4CntvSC4F6HmPksJD1VEAAM8HOK02f3XXC85DZYTMgsayA43RAs75wpdRZ5h7hWc2omFS8gFa2zEJ1CgzEXDb/QhAbRkIHasfEc61kaMHQMpIwvmOpj4p234sH5sPj1SUS1M6ciAivROhpQYkJAc352fjVwJwyKvb1BVbva3WH80wwnxn3Xela8RC7om5/kumo1n4BXEhnzkm4rTmylXsXr4N4a1se03V+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iBgUulvf5HQ8zeOQMaHA4OvwUuG/ZvDUlMFqE4GfICQ=;
 b=dP+I2kgEirVyksCdptn4r/hylik7bUGCp/kI8iRIOqPhZ5hfaBCUuTA+jPK00wH5YMqjkxJFJAkhaeFkcKZMohfo7wZbbiUR8P2IiEcstm6/s14S/XPhE2WeWougPB/Sbl9A6Pr05KmHBGKsajiVY0/ITrAo4tMB1jU7cty7wtIUYgpPIg4iF2CFL+Rh/uJUijqP4Y5NRsbAJcPVKU4b1yKyMD1Wpdav6Cm3oiPRA3ifEOhHEuxy8/iZqLUchwxpThGzFlTo8Am5KV5IVGJD659MfFSVH9NZ9Mp5NWGjpDxRR01yKZJZv7Fi8eoiXh4EMHM1RTbxFXCvrH0uHI9CQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 BN7PR11MB2804.namprd11.prod.outlook.com (2603:10b6:406:ac::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.12; Tue, 6 Sep 2022 14:01:47 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::b04c:807c:4ea0:c62e%9]) with mapi id 15.20.5588.018; Tue, 6 Sep 2022
 14:01:47 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/4] drm: Use full allocated minor range for DRM
Date: Tue, 6 Sep 2022 16:01:13 +0200
Message-ID: <20220906140117.409852-1-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.37.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::6) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ebcb8d6-f032-4917-72d4-08da90105696
X-MS-TrafficTypeDiagnostic: BN7PR11MB2804:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: flYHnvw4EY1fWGM1DA2eqt/sNp6n7T06fE2QQn26aO4F30TXHjYNi8axU/xk+hOPjzmMDm8Dxb1wTZU0UH74bHR3iRt89oLwUyvcMA92Po9+xy9txgOAGnRsNaRB7f9fD/AjvDrfMqCs47BoV2+jTmW8nJvdbMbLtVftiK2ZDXCAKGr6BghMt4NDzrkjU0Ie/2GQIyEjJJPNpEsMo3433AyvAUzMX4NGUoKTSLijcrT6mz+7oO+6U4gGl2vggdKrsepMjNUWc4ipfeYz0gopIgpdn6VAwVl1hgKBTU0WFbFD/pabssAOt4sYHREgkVIV5mpadXePsWMiFQ4x0xmbk187PpaBVC4zEFt/x89reDddVW0yB8Yw0C7nNrFvttWdR85e4YvHv+9rz/xQ2SzxeCpmO+HQtDqNDT4HJ3Gv0ByeONuttbsecaS2oYZRBuQnaajemPf0e/EnOW4Z8+3yaQOgXy+80rkakI2XTHx6s/iuN5DTsJQSR37TdoJjJoQZXjZxw3PXgf7pQre5FzzqlsBAfFxa2Qt2eyygZH3jLYE37ptMVdKKmbDfvxA5jd4unndMPPwxeYQfZFe+FYJi+U1vVDyVewzzKFHNpbdbOn30yqLm2lv3TnHqjMBxBorSoIrPFvmFpJkeLgtZ2EoqBpiKsaLT01dNaU3NaQAbZ2cZ5fmL2znaiGyTM/K/oHfdK08uzAdUJvlmUnMHohpVGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(376002)(346002)(366004)(136003)(4744005)(8676002)(6486002)(66476007)(83380400001)(66946007)(66556008)(4326008)(478600001)(6506007)(6666004)(26005)(2906002)(6512007)(5660300002)(8936002)(186003)(1076003)(86362001)(2616005)(41300700001)(36756003)(316002)(82960400001)(38100700002)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1pZckQ2ZngybktFcllaemwyK3ZwbzFuZGNUN1Y0WHZqSDF3ck9keE1ZUERJ?=
 =?utf-8?B?YTRMUDRvV1loZ0FoWDNnNmpUMGc1c1BCVC9zaHdQNGN6Z2RhZzkwKzZsMzBM?=
 =?utf-8?B?bmJhZXI5UTNLd0lRYWUwU21aOGh4MFBCYU5vWEhRTVFoa2xzNEFrSlV5cG5n?=
 =?utf-8?B?U1UwSVUrejBYejVqWXIvUnMwc1U0VlBIQ2dieHlja0VzTlQzenVhWDBUbjFq?=
 =?utf-8?B?QUQ3VHFkQWczbGpjbkNucCs4ait4cTgwYVNsSlRLaHVuakRrdEFlQWtLbWd0?=
 =?utf-8?B?T1NMQ09Bc0QxR1hYcTJSNDkzelV2cHpoSUpPYzUyTSs1Tkx0bnF0TmRjQXBk?=
 =?utf-8?B?NXl2aWpYOHgzMjFvVjdoczVyZjNBd1NvTWd3a1lUbUR0dWhTRTdyZGJXMTl3?=
 =?utf-8?B?S2VHVU5pam5ieXlOd0F3dWFjcDBRY1NiZjl1ampuT3NpbHhrL253RlZ5WGF6?=
 =?utf-8?B?cnE0VnNKODBEZFFNZzgwZDAvazhORXQrZ2l3REtGMk5tVC9DUTUrM0NqSXdx?=
 =?utf-8?B?YzgrYzJwREF4RkpOblNBSXZmbTRQUHFGZFJSMWsxRUt4NUdkRldrdHh2OHpy?=
 =?utf-8?B?RnlTMVJ6aDZsL3J4cWlMZEw4cFRzNTgvb0l0TlpsSFBBVmZobVlnVEU3SmNO?=
 =?utf-8?B?K3BtMjZKZUpkZC9RMzBRU1BYa2NPOS8yR2lobXJRSExlZ0RWeVhDc1dVbEdD?=
 =?utf-8?B?SjU5KzYxSC9FM1ZyUU1QRDJCRmNMRzR3R1FPbDAzdlc4bE9LaGVrY202SlQy?=
 =?utf-8?B?bGNBUU1mS0NzOXoxbU1qY3l0dUJlQmxibVBOWTlONWxFZDMvWnJVNjM4RHRN?=
 =?utf-8?B?ZEpnbFZBR3k0ajNvc2YxZEdaTzU5cTMwQmRwRk9DN3g0ZGplV3YxR1RnVUtT?=
 =?utf-8?B?TFRzMWpCZWcwbnBITUNXTXpoVm90Y1RYQ0hLcTVtQi83ZDlyZGZhQlorRHZ4?=
 =?utf-8?B?L1NIQ1VvMk90UFQ1Um52Q3N0N3hDM21xcHlJYjZjUTc3aEFUTlFkNVhZbUs2?=
 =?utf-8?B?c1QrQngwZ3duQTQ2cmJuZVBQZFh3UXRSVGdCMVdqbEMxRFdSdGtON2R6eVEw?=
 =?utf-8?B?dGNBbjQwQlNtV082UnNFOGozaGNEQzR5QThlZWRjUHlxV0Q4bjRaS1JTbzhF?=
 =?utf-8?B?MFAyemlsQVhYQjBLRUx1Tk56NjJONjUzMld0YWZuT0s2Mi9kaTRnZ1lrSlJk?=
 =?utf-8?B?b1hXMmNhNHBWN1VrM0lqMEpMelErV2JwTUQ5RW1sNmVNSHBlQWdKay9QcFk2?=
 =?utf-8?B?d09hQmxGWHdZS3prVkhSajdod0N0bEtlZ2g3dDJYUTg0aHQ0RUpLUTBXWDc0?=
 =?utf-8?B?QStzVUJEVWRYYjB1M3ExK0ZnT2F4cVhsZzNtWjZuUFZ1UFdpdG9DOEJTWEFw?=
 =?utf-8?B?Snl6WTIydmRZcHgrc0RTb0JSZ2dDY1N6RTRraGhwQ1dHUUd1cE1INktIY3hC?=
 =?utf-8?B?Rnp6TmFzWmhqMnppSWVvcm9CVm05Q3kvc3A1RDFUTVNvRUJCV0NOajNPUzBv?=
 =?utf-8?B?dHh6NHlrbHZqNjN5TUpRUUpyRWFBSlFWL0x5OWJpT2VoTEhNTWZCNWdIWGx4?=
 =?utf-8?B?S28rUVhwb3ZqS3BKK1Q2dktGOEozMDdpR3JUWlFSZ01yZU9Eb2xHc2RmZE56?=
 =?utf-8?B?czIwdmFqaEtaS2Z4MHROT3Q5em1SNDNoOStBZzhmMFFaMWhBbEpobXdTYkxP?=
 =?utf-8?B?dFBaSG5CVU5ab2xNL0twSDF1TXdBUWo1dUlDTmFpd2lNMVBuUTY2WjBvRVpV?=
 =?utf-8?B?ZzdWSlFhMFMwcHovS1F0cGgyODJBZU9rRzI4U00wY1hvUzhkT0wrQjNEU3NR?=
 =?utf-8?B?MzREcmR2QzRSNXpHU3hpMitlTmJTTHhFOFJqdERHcjc2VXBSNjZLR2NHR09o?=
 =?utf-8?B?dDV6Ym1rUVdwVVlsckZYbXk4VnlWQzJ3RlNGT2ViYnhvc0xiZDN0MUphakY4?=
 =?utf-8?B?K2Y3elNkd284TFcyZWhBbTdhNWpUMDJzWXBMTiszcjZjUE10amxLeUVTVWg2?=
 =?utf-8?B?WVdRM1liWjVrTVBUdnMxQjh1VXRON3d3SHdrdWFqUDB4Qnc3cDU5cHZmVkRM?=
 =?utf-8?B?SjRCZzM3aWlRNmNYVTdqUkk1bDcrdG1KU0haNHZPMDY0SXpaNU90MWtTdUx4?=
 =?utf-8?B?Wmhha0xxdGd6dmVPTWppUHlYY3Q2dkN3RnBlTEtEOWpyWXB2RkJLMWhCcW1I?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ebcb8d6-f032-4917-72d4-08da90105696
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2022 14:01:47.4796 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uDrHr9BxhRImXNGK5goICuPim0hpDCNj8qKshsdPuFOIiPn4VlBxeAdOu4AQMs12FP3cWw3KMKYWZ/ZP0VO2KetfHSdXUETk6z9HrbAXFD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2804
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 David Airlie <airlied@linux.ie>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

64 DRM device nodes is not enough for everyone.
Upgrade it to ~512K (which definitely is more than enough).

To allow testing userspace support for >64 devices, add additional DRM
modparam (skip_legacy_minors) which causes DRM to skip allocating minors
in 0-192 range.
Additionally - one minor tweak around minor DRM IDR locking and IDR lockdep
annotations.

v1 -> v2:
Don't touch DRM_MINOR_CONTROL and its range (Simon Ser)

v2 -> v3:
Don't use legacy scheme for >=192 minor range (Dave Airlie)
Add modparam for testing (Dave Airlie)
Add lockdep annotation for IDR (Daniel Vetter)

Michał Winiarski (4):
  drm: Expand max DRM device number to full MINORBITS
  drm: Introduce skip_legacy_minors modparam
  drm: Use mutex for minors
  idr: Add might_alloc() annotation

 drivers/gpu/drm/drm_drv.c | 55 ++++++++++++++++++++++-----------------
 lib/radix-tree.c          |  3 +++
 2 files changed, 34 insertions(+), 24 deletions(-)

-- 
2.37.3

