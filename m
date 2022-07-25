Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA9E58049B
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 21:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B923F8F256;
	Mon, 25 Jul 2022 19:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 011A614AFB6;
 Mon, 25 Jul 2022 19:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778098; x=1690314098;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=h9b/JiXLgXkhA3nZdvNS2izSFOoQqV9JDyJ0MUKnaxw=;
 b=ByRXV4ILBVCBVAHZwULqUQo8Ww+5kvspSaGDu+P1EGifWyKZGvgZ81+s
 5nGYlI7aO0m086x2hOxQWtonk/MGMyyi12Hm1Px2Sy01zwNnDXSGgFV7h
 wXlrn/W+tvvcfMp3rqUso+JPRfkTMw/FN1+QinaciXReWB2UCavkRYpg2
 WxBe2jfucDooooKSfKEy5624UMKvtYlPC+vBEcuurbAwKDZr6gS4dCuWk
 O8qAwXISvcQqpnOVX1qMpcAkTN+2azc13ciFy7AMG8iTkwmHJjiYZEKjm
 SsC2zehJJePs0lmI9cGqsvnPMPOkmEG3DIs2ERvXLSb8DqR1bRSSRGRpo Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="313536899"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="313536899"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:41:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="627589969"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga008.jf.intel.com with ESMTP; 25 Jul 2022 12:41:37 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 12:41:37 -0700
Received: from fmsmsx604.amr.corp.intel.com (10.18.126.84) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 12:41:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 25 Jul 2022 12:41:37 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 25 Jul 2022 12:41:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HqRwMWaJK3yhyOnqTy7Ke+Km8QN6nMUP5vZzqJTP4uEEMn8VBJFykbsX/SNFML+LQ6ccPx3V8RBs6xRHhZRbkRNRCisKWYitXYgjIoIHgI3E8vVRS4m9DxpOGaeibLszbFOrXKBibXOtQUIVBiooTItNSo6EQ1mddLlp/GMFm7Q2Zx3GvbABhBuokfgSshA8bAnN7+22uyUKSjvUbThlLKAucBCU46X1Anp+T58MzqnUcVVEK1YqMv+TIVlKdg4Kuhp/LHlNuc27yNEKKavlYipfAN+peiEu3gFiqz55imtpEAOVA0aNG9A1QZ1iyalg8pnosenzvurKWfcDiUluLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPvd+f9gOQad9iLMy6G1lHNHmdTV/DuoRvf+i1gIaVU=;
 b=brKbevh+QxG9Qnekgvq36dcCDZWgNzvUj1M1Oq5LO1lcz5fGU5ST/iKt9auiuRXTl3HMNN8DVG6Wopwk1MpXl87ppi0tv8QuXHyRZXHzJ/VAz2l0DQpjv4mClxd2JvMuXZ7vP+gbAIaFO6X8Q2HnRR+aKs7BzwP7Be1DO3vTnq7e8OeMeyxjW3YOlldJ4np26rrCCrLmRvUS6PjFhjHaf90MWUd7EA+SYZ15bPUKd5Bc7p6QxxkNGP30li1RiajACpL+1VTESyn3MR9/LuPAM/RSHXEbI2EIdOxVjvWQ269NCJuaMtWPEin/xU2ivhws5Q6lfGW+wyQCyrXF0JCP+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1372.namprd11.prod.outlook.com (2603:10b6:3:11::14) by
 CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Mon, 25 Jul 2022 19:41:35 +0000
Received: from DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507]) by DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507%3]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 19:41:35 +0000
From: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/i915: Sanitycheck PCI BARs
Date: Mon, 25 Jul 2022 21:41:05 +0200
Message-ID: <20220725194105.4054734-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725194105.4054734-1-piotr.piorkowski@intel.com>
References: <20220725194105.4054734-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P123CA0009.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::21) To DM5PR11MB1372.namprd11.prod.outlook.com
 (2603:10b6:3:11::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b703608-8412-482e-fe2a-08da6e75aed6
X-MS-TrafficTypeDiagnostic: CO1PR11MB4851:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gx/PgK5Cmwo2kkNn7z7JBZLoWZcwfvsBJafUxHiZnyGLVuGpnWtKisY9nGXcNDrK/dWxHIpqOyFE1zqW8groYkfx1Gvc6w5ZO+E9FFJJLxZSzCUllaYOlAz2gbkgEBHQnIGv3AvTl5yghiSmIPzsJWT0t/1e0QaCSjLDUmYoN/SUIIcE5foUSbQtTT54M7uuyXNwDcZhOgWP4YZ6b9lj1Z7boVcVvNSWqj70vfdCEB/f+smQOeZetayj2BB0CGqVLCAissVT5fEaswEniZj95rG5t2yPXRU+ANt4CnT9FCrnZIwwcYNYpU3qxCGCEJph25kkdVq2DQs1LJInENCaDmkfWq/WNstYZd++NO/rH1Hwn7d35xByb7GGq8/Xwesj/GGQJ78X1xikOUBPv525sjJCDglxeQw0sBDkYPTlIqe65ItuIRy6P5xPPlObHEezsc1fBRpQ+NxJ1MdF/Ut9JT+wvffPZ3sY7f1G49BhfzPOGfxminLB2Yx9GoIA9WL4qn6LqxWpK4a6ymN0ssJcpN4ezz+rfvGtMp/MM8/w+C2JoMArn6Jj2Tak58JhnOaArX/3rLOFNe5z3+EAokh4brrxnx6gYb8SU8V4RhRUtE2YKaSIb+XvwxghylZ04HkylFfVMmjAwWheQGEfGwkdrJN6C7Irrd8bMJlnkKzAeScE80ihHweExAfN37cL0EL9kPxjpml9JQparWCAYRervNOwCsxUHhWO6XwNDQg+zP8rNVX4ct7Z/TeS8DsYtqIt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1372.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(396003)(346002)(366004)(39860400002)(38100700002)(86362001)(6486002)(8936002)(82960400001)(478600001)(5660300002)(316002)(66946007)(66574015)(66476007)(4326008)(8676002)(66556008)(186003)(1076003)(2616005)(54906003)(83380400001)(41300700001)(36756003)(6666004)(2906002)(26005)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm1PZ05LbU9XTUpTMHVHOEJqSklkWWQ5WTdNZXRieFM5MHpMUTNRK0RHMnBz?=
 =?utf-8?B?VXNxNXgrNnI4VTdxUXpNMDkyUmVBS2czZEU2MFFpWVVrUDNLbmlsMXBKNHd2?=
 =?utf-8?B?eHlmaXQ1NWxPVU90UjVWMnBKU0FVV3JRTFBiR2g1d09zWmdHYkxkaE5Rb1Yv?=
 =?utf-8?B?V0tHL3cvNjRMZm1EOUw5eTBvcTREYjU5N2xiZ1p3emFhTUJRYlNUeE5xbytP?=
 =?utf-8?B?M3Rlck9sSFVyOXh0RmNGdkhzVDFsOHhVOUVWdEE1RnRqb0VpeGdHdUgrVkpr?=
 =?utf-8?B?VTlhRjJtcU5WQ1l4NktpVk16dmN5U0JGQ0RHNVV2Uy9tc3lGTzY2Qko1WCtN?=
 =?utf-8?B?dUZGSDNjQU1zV3BnQytmR1R5Q0JIMWNWamdKeVN2ZHVKZ3cxWGg5aUdrckJH?=
 =?utf-8?B?a1RLTTNjR2p3NXo4MHRzVzVuU3d4TGsrTWhweFN0OW5xdXNmN1Y5ZkNxem1G?=
 =?utf-8?B?T3pJSVNEUHJWcnVGVTBPY3F0bmRiL0t6emFoNjFiUVVSTDFndi9MaWc5aDg4?=
 =?utf-8?B?NEpRK0kzRFBtWnVleDQ0SDZtdU0yZVIrdmNESkpISllnTkhjT1djRUZucW5L?=
 =?utf-8?B?bmZ4djErM0F1TnJId25kQ1RjUTFkSDk3RlhJdXNBcTd5R09lUFBiMmxyV3A5?=
 =?utf-8?B?Q2FoRFNDN0xYSVVwcDcvTzlaRGVobytXaEpNU0VFZGgrS0hYTWRjUGIxS3pU?=
 =?utf-8?B?RTJ3L1UzSWY2amNPY2J0NTltODR3K2grMHQwblpKNzkydEl1TVo3YVl5c2pY?=
 =?utf-8?B?UHhvai96VGZDclhqa1NrcU1SVTRqbkRZS1Nhb1ZBSGNla3U4cEdTbXY5MmNC?=
 =?utf-8?B?enpia252TTIxSFBpeDJmZnRPVHpESS9nVWpsZklwYjZHdjdPOHRuYW9VSytJ?=
 =?utf-8?B?TW91WlZwcFF2NDdsU3NYMHREazB2M0IwTEE5RkovVXZ4TXc2TjNUOVE2MHRP?=
 =?utf-8?B?bHMyQzhIQ0xlUWlOV1hMVktZaUFCM3hnOHdqYWtnV3hRQ0d3TnlMbjFXOEVu?=
 =?utf-8?B?K3RNZGE3NkJheUp5SUdXejNyd3FPQksxdWtxdDJQekJpMjRua3NBUi9Eb0lt?=
 =?utf-8?B?TjhxckV1cFhPc002YitzY3Z1aGkrUDIxbGZQbVkvUVY1djA5TEExZ2dZNVQw?=
 =?utf-8?B?VzlQQitFQUU3enFTbVpvK1FtT0FNRFpadTJGeWZScFA4d2N6SllwaGt6OGFU?=
 =?utf-8?B?UGc4L3g2Nk5YWWFEL0Q0V0tLY01XMmI2TlZXUjl5ZFV5eEM0N1pQZ2FGRkkv?=
 =?utf-8?B?MzdieVBXTzhhY2RreENOd2RyblJNSkcvVzVzL2xieW5DWEZPSk5YTDdoeGxr?=
 =?utf-8?B?YzRjQ0I2MHZEbHJERGFPaWZXSW5EM3BZTGM0N0xKM2RGb2VadVo5eFJteUdX?=
 =?utf-8?B?MzFka1IzMUdWUE55UmduWDQ4VXE0SWJWSnFGaXNwWG4wU1hLMThZcGV5eEZj?=
 =?utf-8?B?YXE2ZWxON2MxTkhsekVvUFF1VnA1RXVzaElqNTBXMDkwYmtvYkdsbkxnTStN?=
 =?utf-8?B?NGxBV3RNVW9wNWtIM3JNaDR3Y2hTNmxEUngzdXFXUVZCbHJPV0tJbERvZWdK?=
 =?utf-8?B?M1VvblFqZUNGTXByeDNDMmM5QzFTY0M1TjhBa2ovRWI0cjMzTWp2OVBZL2Zx?=
 =?utf-8?B?MzBacExKdDIyY3VtY21oTVYxbXF0UXNBSWlscSs1alMvMmJ4ajAwZTYwUTY1?=
 =?utf-8?B?K0RFTXdmYnFNM0prVGwxNStYKzdJRW5HNWdCaTYwV1dZZWY5NXU2VUFhQ0ZX?=
 =?utf-8?B?dEdodGM2a0FXSGtTd2pjLzErQ2JuRUlwNVBoNU0rTGtoZ1haWkVpRDk4cWhj?=
 =?utf-8?B?MjFyZjZKMXBXMVZsRGdkYjRTTld0TlMyQ09ZSlQxc3M2a2g0TU9pbmFCVk1t?=
 =?utf-8?B?aUhyUkE2elJ1WGhMeWhZUFd6VGg2ZGp2blNMY0xEUWFiWWd0NGs1dXc2SXh3?=
 =?utf-8?B?bFg3QS84cDJzQ0hkaVAzNG50WmQ5NWRiV090T0E5UWozYmZqRFlFUmljYit3?=
 =?utf-8?B?TnltcUJKOGt4M0hXbWpTelgyY01LczhGZWpBWVhBMnVIVFVicUZvWGE3MXp2?=
 =?utf-8?B?T0dBWlJ0MCtISE94UUxZSEw0STczV21lLy84WlZGWWhCbHNhSmlIbDlhMVMx?=
 =?utf-8?B?RmM4eFFlT3ZrbUt0RVNTekhIcjJCY2lhTWpMV3h0Ymk4dzdjdUZVRDNWV2dI?=
 =?utf-8?B?Snc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b703608-8412-482e-fe2a-08da6e75aed6
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 19:41:35.1619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Kza4S+lx4DiWp/3H6HaUa/rf8Dshhp2Jk1F+0vbU9RXZPfN6QLowe7PxXsm4nVVRZkhSNPxhcSTAuFq6pOGIqjcFAy12mxre0ldEt/nRD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4851
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

For proper operation of i915 we need usable PCI GTTMMADDR BAR 0
(1 for GEN2). In most cases we also need usable PCI GFXMEM BAR 2.
Let's add functions to check if BARs are set, and that it have
a size greater than 0.
In case GTTMMADDR BAR, let's validate at the beginning of i915 initialization.
For other BARs, let's validate before first use.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c  |  4 ++++
 drivers/gpu/drm/i915/gt/intel_ggtt.c        |  7 ++++++
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |  4 ++++
 drivers/gpu/drm/i915/i915_pci.c             | 25 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_pci.h             |  4 ++++
 5 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index c369cfd185bc..4f4c9461a23b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -18,6 +18,7 @@
 #include "gt/intel_region_lmem.h"
 #include "i915_drv.h"
 #include "i915_gem_stolen.h"
+#include "i915_pci.h"
 #include "i915_reg.h"
 #include "i915_utils.h"
 #include "i915_vgpu.h"
@@ -828,6 +829,9 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	if (WARN_ON_ONCE(instance))
 		return ERR_PTR(-ENODEV);
 
+	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
+		return ERR_PTR(-ENXIO);
+
 	/* Use DSM base address instead for stolen memory */
 	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
 	if (IS_DG1(uncore->i915)) {
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 8214e07a0f5b..30cf5c3369d9 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -18,6 +18,7 @@
 #include "intel_gt_regs.h"
 #include "intel_pci_config.h"
 #include "i915_drv.h"
+#include "i915_pci.h"
 #include "i915_scatterlist.h"
 #include "i915_utils.h"
 #include "i915_vgpu.h"
@@ -931,6 +932,9 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 	u16 snb_gmch_ctl;
 
 	if (!HAS_LMEM(i915)) {
+		if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
+			return -ENXIO;
+
 		ggtt->gmadr = pci_resource(pdev, GTT_APERTURE_BAR);
 		ggtt->mappable_end = resource_size(&ggtt->gmadr);
 	}
@@ -1085,6 +1089,9 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
 	unsigned int size;
 	u16 snb_gmch_ctl;
 
+	if (!i915_pci_resource_valid(pdev, GTT_APERTURE_BAR))
+		return -ENXIO;
+
 	ggtt->gmadr = pci_resource(pdev, GTT_APERTURE_BAR);
 	ggtt->mappable_end = resource_size(&ggtt->gmadr);
 
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 0b78a5f3a996..360b11fd57bb 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -4,6 +4,7 @@
  */
 
 #include "i915_drv.h"
+#include "i915_pci.h"
 #include "i915_reg.h"
 #include "intel_memory_region.h"
 #include "intel_pci_config.h"
@@ -197,6 +198,9 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 	if (!IS_DGFX(i915))
 		return ERR_PTR(-ENODEV);
 
+	if (!i915_pci_resource_valid(pdev, GEN12_LMEM_BAR))
+		return ERR_PTR(-ENXIO);
+
 	if (HAS_FLAT_CCS(i915)) {
 		resource_size_t lmem_range;
 		u64 tile_stolen, flat_ccs_base;
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index aacc10f2e73f..9fd788e147a3 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -30,6 +30,7 @@
 #include "i915_drv.h"
 #include "i915_pci.h"
 #include "i915_reg.h"
+#include "intel_pci_config.h"
 
 #define PLATFORM(x) .platform = (x)
 #define GEN(x) \
@@ -1262,6 +1263,27 @@ static bool force_probe(u16 device_id, const char *devices)
 	return ret;
 }
 
+bool i915_pci_resource_valid(struct pci_dev *pdev, int bar)
+{
+	if (!pci_resource_flags(pdev, bar))
+		return false;
+
+	if (pci_resource_flags(pdev, bar) & IORESOURCE_UNSET)
+		return false;
+
+	if (!pci_resource_len(pdev, bar))
+		return false;
+
+	return true;
+}
+
+static bool intel_mmio_bar_valid(struct pci_dev *pdev, struct intel_device_info *intel_info)
+{
+	int gttmmaddr_bar = intel_info->graphics.ver == 2 ? GEN2_GTTMMADR_BAR : GTTMMADR_BAR;
+
+	return i915_pci_resource_valid(pdev, gttmmaddr_bar);
+}
+
 static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	struct intel_device_info *intel_info =
@@ -1287,6 +1309,9 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (PCI_FUNC(pdev->devfn))
 		return -ENODEV;
 
+	if (!intel_mmio_bar_valid(pdev, intel_info))
+		return -ENXIO;
+
 	/* Detect if we need to wait for other drivers early on */
 	if (intel_modeset_probe_defer(pdev))
 		return -EPROBE_DEFER;
diff --git a/drivers/gpu/drm/i915/i915_pci.h b/drivers/gpu/drm/i915/i915_pci.h
index ee048c238174..c0bda6aae806 100644
--- a/drivers/gpu/drm/i915/i915_pci.h
+++ b/drivers/gpu/drm/i915/i915_pci.h
@@ -6,7 +6,11 @@
 #ifndef __I915_PCI_H__
 #define __I915_PCI_H__
 
+#include <linux/pci.h>
+
 int i915_pci_register_driver(void);
 void i915_pci_unregister_driver(void);
 
+bool i915_pci_resource_valid(struct pci_dev *pdev, int bar);
+
 #endif /* __I915_PCI_H__ */
-- 
2.25.1

