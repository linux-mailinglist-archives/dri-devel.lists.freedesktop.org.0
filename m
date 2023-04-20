Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715DA6E9B82
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 20:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8935010E4E6;
	Thu, 20 Apr 2023 18:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECAD10E159;
 Thu, 20 Apr 2023 18:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682014898; x=1713550898;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=BYglts+ORVqKhBD6ob4ot4EAGFYUzdzaO5RJSs3v6rE=;
 b=kcGeu+/00EkCW9Vq0i6P9TQwnWcAy4Xf9d2NxFzp5oE/KZWcB7lHqGoc
 kOU65C/96rx34+7ibwcdURhwv4OGUzy341TNAay58Y9i4n1dJijOuc0b8
 d+qPg7MifPbr+UGvTHLPc+5NHFf4XXGbg+gWqmNsFwzajSJc1ttmqDFtn
 7eekQA3obXeUdMxeirl1VXlBeCwUl31RL/OBj5YW6/hTDrsbTc4OvWFs9
 IKPdqmpl8jOfsCskEn+E6IGhBj7/gpGU8tBR/li6cUu5fPSncQVb52kjN
 jjDImR8MjONCRBM1AX1qcKwNlzEmvc44jfpx5++qo8hBwAGi2UoYGI4by Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432097100"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="432097100"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 11:21:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="835855861"
X-IronPort-AV: E=Sophos;i="5.99,213,1677571200"; d="scan'208";a="835855861"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 20 Apr 2023 11:21:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 11:21:15 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 20 Apr 2023 11:21:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 20 Apr 2023 11:21:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 20 Apr 2023 11:21:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obTt3Y+s/BzmraoF/dtx8pqcxxyYDtiDoCmpMfZQdgJ6W7emwNZxIqP1AuAWRvFeh/TCQPGCZ+f4Dw7/CqtFLNTgEiakSwcfvxTdfusYSl4l/4R6WJuIsB8iS3/VJpnANq8mi9p6tQy0FgQodSZUnqJaMQ6lPHTaNXtJ4MK9gSbJfQDPGvg0bZE4QK9Xn7NA8Ioxl5Q033fJKlFjAeFwF63+6ZLcmtkl4cZgEZZDhtokwmNVpy2O/MsmxeT8R9N4dluBQfHbjFQdCHMXDXJdwEkZ8WgLdFP/p28g7StaKs+cJ8ha/ygv7pyEj3oiY1SOaQgFgNAmBByz3iZ08welXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vui0aAfOiQPPpt8i4SlmKdkweLdKN3XVKBSQ3Wddy6Q=;
 b=C3vbAhXqu+/sw0hjflK7XT4Zk3BzsIBj0C/T76S5CnYFp6BJUFYykTjcQSWKiU6StGiYVREg9n5onUQdoJkvYz1qB9Ch895ETKiN7ahQkOdxv6TDA6N+8TpSyu5c66JsS5axZDDj4OY7aQaHvxDZtEyNJGTWCyc4/K40gxuXHfa7alXrx3F/wk99mFtuGcAfyssX/ISZoxelra0EjcKO76yGYS8NmYz3+8eadF0IIo3vZT6QpsO/Egaafq2DgEvJX0C7rJw2iYDzsYfcPYgZR4LMFnyLmYhMHpjgjg8mPOuoPL03QqPq46AMlKxQAGJeBq5mwwbTZJRJUhl5Jvyd8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5389.namprd11.prod.outlook.com (2603:10b6:5:394::17)
 by DM4PR11MB7184.namprd11.prod.outlook.com (2603:10b6:8:110::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.22; Thu, 20 Apr
 2023 18:21:14 +0000
Received: from DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458]) by DM4PR11MB5389.namprd11.prod.outlook.com
 ([fe80::31f7:5096:35b0:b458%2]) with mapi id 15.20.6319.022; Thu, 20 Apr 2023
 18:21:14 +0000
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH v4 0/3] drm/xe: switch to using drm_exec
Date: Thu, 20 Apr 2023 20:20:59 +0200
Message-ID: <20230420182102.3302646-1-francois.dugast@intel.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0348.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::11) To DM4PR11MB5389.namprd11.prod.outlook.com
 (2603:10b6:5:394::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5389:EE_|DM4PR11MB7184:EE_
X-MS-Office365-Filtering-Correlation-Id: 718e5343-61d1-41f5-2f89-08db41cc05d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g59ngEB3ha2EkN2EjglpjaBlYAkyHR6o1WezMXnj/KJ3Y4jj0HPp0J0xf6Agl6lOLDN951ts5U/UQfK+sTM+6HwimesLWaWOEUsZ+WNqMv6rRGcnVY3jmeIfatj1R6GVGrV17QaszZ270N9w+KHpVU5R0lr+vIk8E+GrrPlHGNe9doVHHfTZdL1oF8fHWFi+0kf4NdjYEmM3xZXHyIMSyFXAUAMi4mWmikWTCDhyH4uNWGTkRZYnSBAr7nt5N+1cXi+ZxyZ2dwhD2mEQNk0e9hEsV9GPsoeEbxM1kgIJkcglWMbWOFTxBt9rJen1Zc/UUkwB/ZV64+w5ycGZLBfPkBGHhTqDDXJwkYNX89xt1FjGiXkOmd9YUXizkFFawVm/7cJTlR2zncxzn/ofcmlj8VErkRM0uPxN/bHSc8qApjGbmQriXw+06aVkYDpdW+CIKQPnkmvAh4VdolZT8XuJ09q2+WbM8I3doj1gKYeo2katKxOu+9+RNwwjmhbv5WyTC5bnCs+wtrwutMxrkKIn7w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5389.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(366004)(346002)(136003)(451199021)(38100700002)(41300700001)(5660300002)(44832011)(8676002)(2906002)(8936002)(36756003)(86362001)(6486002)(6666004)(6512007)(1076003)(26005)(6506007)(107886003)(966005)(478600001)(2616005)(83380400001)(66574015)(186003)(66556008)(66476007)(66946007)(316002)(6916009)(4326008)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnJSRGhESFpEWnVEWUNPdkJmSngwME91QmF0TFM3TlZkcVZYNmgwaTRUMnlz?=
 =?utf-8?B?aHJvY25XVUMvNHZtWWlKb2tKTmQ0ZEtGU2hRcjhqUHM3VnVEbTRST3Z1Ymph?=
 =?utf-8?B?dnV0OVpFdFBLVk5hNVJmVlEzUmZFUThwY3ZSQnVERHRhK3VsWW5xSU1tdkRq?=
 =?utf-8?B?V1ZRSW5JWUtDaEdVZXFSeEtrSkRIUWlrcWVhNGVJcVVrbk4vU0xJZk5POU1m?=
 =?utf-8?B?dW1tSnJmelZ0YnBUaFNxbmlUNHZObk5RMFJxRG1SMTl3MDA5SVhsMzd2SE05?=
 =?utf-8?B?bnE1Zng4N1VrQXRRWUJleDY4UytZRWg5ZTRORHJRUnlEczBUVlZYTHpoUkli?=
 =?utf-8?B?Rlo5ek9ZS24ySUtLdTdNS0wrL3V3WGZxL1p4S2xnbWtXWEloZmc4WXhUZWx2?=
 =?utf-8?B?dmJVR0xaTjlGZlFzQmp2RVVlY1Q2N2Q0TFltcnpaUXpMU3RjNzJJV29aK2lI?=
 =?utf-8?B?NkdHblBjRjVCb0xVTmN0TWpLalplbzRuOFB5aFJiOHNLdjFDbUZlUk9JaVpu?=
 =?utf-8?B?S1hKNnZzM1RUa2d1S0JHM1J6THNMSFZlOG9PU21iQ3FYTFNOQytGZ1NCckVY?=
 =?utf-8?B?Y2poY05taVJ6MjVwZFBYSjk3WEZva2FaL2syVTBUVjdQYzRtQjNEdGRCaGJp?=
 =?utf-8?B?VTRQbFF4aVZhSmJoaHZvYzM0LyttOFlXakljdEw1ZVBNYVBvZWQ3cUduWG5S?=
 =?utf-8?B?UGtpTVFMbitCOFhqTTJaeVAwNGt0ejE2RHZsRktCYjllRTB2NWtvT053SGxL?=
 =?utf-8?B?MVgzcjY1NW03eU1JZG9jQlFJRUY5Y0NzdUJzdzVqSmxhdDNqVnBsZTlmSGZV?=
 =?utf-8?B?aTN1Q21jL3IzL1Rqd0tDMlRpc0w2VEViZjNYQW9JQm5TaUgzVXFqbjdpeXFx?=
 =?utf-8?B?aWExT2xEaEllazlYQ1lhTVp6MFQ0WDhQbS9lUjBCRENDNGE5QWU4Z2Nob1BK?=
 =?utf-8?B?TXNsVWxISWhKa29tNGhSeURwdXJBQWtBWGQ1aTJKQUh3TkpLNmUxaW5lRVZi?=
 =?utf-8?B?cENNS1FrNlJkVk5VQW93UkE4bUNuTEQxRTRjVVgzM3lScGJoMjd0SFdFRk52?=
 =?utf-8?B?UGlUbk5lL09iRjFzc0dFTGhVejlWM2N4ZC80QktKN3o0Z0pCdTZ5eUc4RE1q?=
 =?utf-8?B?ZXRsdmVzUmNjYnh0bEJjemlqdkZoRkxhbmF2bEF1bXc3S1pKVU13d0VkT2VF?=
 =?utf-8?B?a3dPK3kycFZWQ2VCekk1UEF0Q0J0TDVsdGlrRTkzRVpOdy9pMnpFUWNIOFEw?=
 =?utf-8?B?VGlSbDRxWXhNMkdpUXNLUHh3QmlZdHBLYkF6NEs1Tlo4dE92VVBtZXZ4V0ZI?=
 =?utf-8?B?RmtDa013UzVKR1NnZkIweE9oSG9QdE5Vbmg5WGJBU1gySjdxeHZ2Q3NveWFH?=
 =?utf-8?B?em1PdFJVYmpmLzQ5T2J0S0lPK0ZvSlNTSGZIRUNiVHR1MzZGNnpzTnU5bHJo?=
 =?utf-8?B?VnpaOFEyRVZ0ZWlKZ0VmOWQrTlBYa2VVZFpLQThRdXcwU0tLZ3dSOHVwc05y?=
 =?utf-8?B?OFg3UFRvZmdsbzhVTkdJRGJna1phU2ZEQ21kS3oxYkM5M2VBZDNPYmpRVFJi?=
 =?utf-8?B?QVgzWEhQemN3STBFUTZZVDdjb1pFZEoyMDJSVllBdkMxNXMzMjhjME1XMElL?=
 =?utf-8?B?YTZPTDh2aWdyMERXQUdkUmNwMnJBNmdYdjcvQ0w4Q0Z0YmJRTEhHc21vUGVS?=
 =?utf-8?B?a2hXOFhBVUxqbGM1a3FJZEx5WXgrdi9jeHdUWGpRNWI0WFNwRFlhRnM4QjhQ?=
 =?utf-8?B?VmxzM202cy9KbnZldE4rRnYrelBGcVIzWjAyWkNpYkowTldGdjBXOXJlWWh5?=
 =?utf-8?B?bmtkV3l6Mit4bUFPV21CenFrTVIxb2tTc1BsSTJuVDFvSUhrK0lYWVRPcUhG?=
 =?utf-8?B?YnlBSWkwcTNuNzYwc3N6MVltbXRpYmg5V0VBYVRxcWpuYzNFT0Fwem1WQmd4?=
 =?utf-8?B?ajRaOEcxNnZoR2hWMW1BZG11ZytWcXkxSUJZOHI3LytZNTlndVFuSi9DSWxD?=
 =?utf-8?B?ejBaRUk1c3FLZk9ZcHNhVmJxelA0Z2tua2VHeEkrSi9VN1BVMkxRRkdhcnZZ?=
 =?utf-8?B?UG0xcVNSa1B3MTJ5Nk9KVzNDRERJcmgzeXdxdFh2U1pCelNiY1pNc1lmRjFC?=
 =?utf-8?B?dW1NNG00V3dLaGFNVGpCbHU4d0YrSUNHNkFjTE8xQkEvcHdtMXZYaFR1SmZt?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 718e5343-61d1-41f5-2f89-08db41cc05d4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5389.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2023 18:21:13.9385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SsGM40nr2KPZAPj+uNYdA7ZrkMBbeiWOP5PL43+pDp9M7+vnS+bCzYL9zJUIH0ggVxZWEb5cV4Ba7UdesqnvtW9MZS8DLtMzIa8xE3o/d1I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7184
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
Cc: matthew.brost@intel.com, Francois Dugast <francois.dugast@intel.com>,
 lucas.demarchi@intel.com, dri-devel@lists.freedesktop.org, dakr@redhat.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This makes Xe use the new drm_exec helpers provided by this series,
which is not merged yet:
https://patchwork.freedesktop.org/series/114464/

with this fix:
https://patchwork.freedesktop.org/patch/530670/?series=112994&rev=4

v3 includes code shared by Matthew Brost.

v2: add a first patch with squashed dependencies (Lucas De Marchi)
v3:
  - remove "RFC"
  - add dependencies as original patches
  - move drm_exec calls to xe_vm_lock_dma_resv/xe_vm_unlock_dma_resv,
    use new helper functions xe_vm_bo_lock/xe_vm_bo_unlock, fixes in
    drm_exec calls (Matthew Brost)
v4:
  - fix compilation error in display
  - remove unused code, use same arguments for xe_vm_lock and for
    xe_bo_lock (Matthew Brost)

Christian König (1):
  drm: execution context for GEM buffers v3

Danilo Krummrich (1):
  drm_exec: fix double dma_resv unlock

Francois Dugast (1):
  drm/xe: switch to using drm_exec

 Documentation/gpu/drm-mm.rst                 |  12 +
 drivers/gpu/drm/Kconfig                      |   6 +
 drivers/gpu/drm/Makefile                     |   2 +
 drivers/gpu/drm/drm_exec.c                   | 248 ++++++++++++++
 drivers/gpu/drm/i915/display/intel_display.c |   7 +-
 drivers/gpu/drm/xe/Kconfig                   |   1 +
 drivers/gpu/drm/xe/tests/xe_bo.c             |  26 +-
 drivers/gpu/drm/xe/tests/xe_migrate.c        |   6 +-
 drivers/gpu/drm/xe/xe_bo.c                   |  35 +-
 drivers/gpu/drm/xe/xe_bo.h                   |   6 +-
 drivers/gpu/drm/xe/xe_bo_evict.c             |  24 +-
 drivers/gpu/drm/xe/xe_bo_types.h             |   1 -
 drivers/gpu/drm/xe/xe_engine.c               |   6 +-
 drivers/gpu/drm/xe/xe_exec.c                 |  30 +-
 drivers/gpu/drm/xe/xe_gt_pagefault.c         |  56 +---
 drivers/gpu/drm/xe/xe_lrc.c                  |   6 +-
 drivers/gpu/drm/xe/xe_migrate.c              |  12 +-
 drivers/gpu/drm/xe/xe_vm.c                   | 321 +++++++++----------
 drivers/gpu/drm/xe/xe_vm.h                   |  33 +-
 drivers/gpu/drm/xe/xe_vm_madvise.c           |  36 +--
 include/drm/drm_exec.h                       | 115 +++++++
 21 files changed, 659 insertions(+), 330 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 include/drm/drm_exec.h

-- 
2.25.1

