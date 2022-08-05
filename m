Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDEF58ADCE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 18:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4101112F46;
	Fri,  5 Aug 2022 16:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21FC9A3A12;
 Fri,  5 Aug 2022 16:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659715268; x=1691251268;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=d6oQcgkSZUFLFzGx1qOhwgVjbpRgYdJZTMwiCO96jfY=;
 b=gUGtAOEPbLjeBJN6T2YJXuDeClh2xxQfKg8ELwjnmKrA8hSJnMssisRu
 P5poCLfjRy89xRrPx3doCciXOuLz+JpGZ9LxAk0tA4deFcME48MPti6Xv
 mKuAGzzA3Nf1AuTQFPnt+kW6RR5/Re5ZwFAsU+QAVtIRWmb7qlprWywyg
 mJiwiCRjzaVvYp5GV3X5y82x6VQwGSghiFlEB/Ob6o3qR7Lv0HEE8oH6s
 w4aL2cHpVsWwK/FnlkZ9qHX40enkbtmKitvj8dlS5zXKpZR1qevc24sgE
 /Gfrcsxvucko9YZjDhExf2os/vsplEiLk4TjctbKCCDX1JEdDHRicUqMB g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="273275965"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="273275965"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 09:01:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="671731824"
Received: from orsmsx605.amr.corp.intel.com ([10.22.229.18])
 by fmsmga004.fm.intel.com with ESMTP; 05 Aug 2022 09:01:04 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX605.amr.corp.intel.com (10.22.229.18) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 09:01:04 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 5 Aug 2022 09:01:04 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 5 Aug 2022 09:01:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TK2xR6LuRjimk6do0X/9TCzjaVt9KjeQ2dKcyswDtZcNsE/B9KGp+57F5/83cDl/MsdfLj0Gr1eh/cyV40cSyIDQsh0iuNvqFCMUHUQ43zJtF4VagpqHQ/b888iZnFrh4M+wHGv9gGlMAz9+RaZHvBAhA5bxZUUQ9+QGQ+CzdjHROntnHYkS/Em3Ixuk84RhIar33gnNiZUuHfNqkMyLJYq7fn6YGBoE/CLQeWozB4GGWLmZDAMM1GWTwEVfpeaih1xC6swRmyvOyJyurH+p/oC34ek2XsjK6azUfv3Q/uNyT9qcPbOUKIP/zhYq+gmyA/t3QwGt9f2qrQG7tDP5fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04ICKZfsoFXyKBPItVNMf86hBDmjQOyJbMODJjuB13M=;
 b=nrauLgWlrx4sBYg6jCjMzXuT1ajMsGAJcdg2TgOspD5axw0a/fOiycJwYp2wtX2CUcUxYr/cFoY/t6ucfIa+qNWTF1JASaoL0tIr+cNKDEpWNJUUr9iKmbkTYWvWLZhkiQ9UZhHVu1Qv7xHg+VdGp4b3zNmnpQ9vYWhV2+GgfBSine5K164hxROcUn2t6qfcnmCiiZHVhdPfDAarFxOQERabhkr/33N4sGvl7dhbNeEdpH/aG8u75LQafiSoMWpuufarGhAoGTGQJ+clhYg54zG55QLRsii21W9pbmqjUptCxvqBobjm/KFMdn9OM8CoIyoH6az3cExnc8D2XLu4qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1372.namprd11.prod.outlook.com (2603:10b6:3:11::14) by
 DM5PR1101MB2075.namprd11.prod.outlook.com (2603:10b6:4:5a::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5504.14; Fri, 5 Aug 2022 16:00:45 +0000
Received: from DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507]) by DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507%3]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 16:00:45 +0000
From: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 1/2] drm/i915: Use of BARs names instead of numbers
Date: Fri, 5 Aug 2022 17:59:58 +0200
Message-ID: <20220805155959.1983584-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805155959.1983584-1-piotr.piorkowski@intel.com>
References: <20220805155959.1983584-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::21) To DM5PR11MB1372.namprd11.prod.outlook.com
 (2603:10b6:3:11::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad934820-8b23-42d4-0d72-08da76fb9a4f
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2075:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lX3/VlVOZLCkpm8iH6mwvgqw6IgxszBknIzL2Pj+Ylnkml0gBU/1gZNvx7Pq9wwxHqw9qENBTLe79yubIwcNMtSk4UKaUFGgaX26gwC2Yi57N4pEAlkHrDW2N7ymp3l9q9AbvHUb5EUhHM/fWOQLViPEeywN3i0gJeoR7wMkIdDZ9s96yPx/j2GLzjwYJIQ23odO/3h4vyy01lhBqjHZ1iLY7LYH1VEBEt89Ss51WHxWI32Wj1m/yUrpyTcu/fkxZ1UQwr6CcEdLjE1j1ekLlnBtkOD67e3xBckMccHs6AGZDSoOr5zoHuxwPJ58+0IKbY5F0Q18B2UT+HXQYLmFolHuSmBv1khjHT5TDQP5jpNvLhZGThF+Ya4ZSW6NWS/RvdpwXpqMazB/tN9QpR4DlyJLxKfcLGJtu8Y0VsvI6kX9+F6PytnfFq2W12ny8qcAXDsFHA4NE+pguoEBlJ+3vD81eqVOvURNoLq4p0dz3k0OdhSs03rQFojZU1JyBVV0e0/+BZ61U5LJ1OTkNFJ/co2eqpcpbrEB0hRMI9HI53sQcQyIsmXrWsEckIQzA6WFtzvyCV3kcxl1oD8gls4+LMnLh0B4tpi4CmwYmJ4DSekaH7lFfHbMrEe2kJl+DAimriDtIMLIzPjdNsjw27sryRUH7q8g/7pY1SwfcvYRCKw1/4IEOr1ibfqLq+3kEJXmqs/kifwoD5d1Kpza/ZuBLkTb8zUDnHPJtzyheVHmrKdVgQK1myI7nifpFc4C3GHv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1372.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(396003)(39860400002)(376002)(366004)(2906002)(83380400001)(82960400001)(38100700002)(6486002)(316002)(66574015)(5660300002)(66556008)(54906003)(66476007)(66946007)(8676002)(4326008)(6512007)(186003)(1076003)(2616005)(8936002)(86362001)(41300700001)(6506007)(478600001)(36756003)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzFQbmxwd3pRWFh4VHBxdVJlRVdhNU1pelFaQitUeXNZRFFhSXlSSmxSYXJB?=
 =?utf-8?B?dUd0TEtSSGlzeHBMTTA0YzdiVWtRQm1uYUJ6ZnhrOEY5a1BKbHlhbDNiKzdt?=
 =?utf-8?B?NkdGeTRqazQwNUhzaEZSQ0QzdW82Zk03cm5NWDVMUlQxMTVtck1NM3RWQ0Vt?=
 =?utf-8?B?TDZMQlNpMlpPZy94ZXNvaUErOFJ5dEY3T1ZjT3d0NThsOS90WmlnVWpSa253?=
 =?utf-8?B?SG5XeVIreDR0NVVIY3lpRlZpRTdIU0xMVndNZDA1RGduNHhDZUQvcGRtZ2gw?=
 =?utf-8?B?MWZlL1FlVHBzeDYyWFBSQXdYSXVGYlpTSlFTTThjMTlSV096QUpHQ0FMR2pY?=
 =?utf-8?B?SGVTQm4zaHhUbG1PbDVYRXZ3REM1aWtTYk5pV2lwRTM1cXJNclAxVElsQ1RL?=
 =?utf-8?B?a0I1QnNsOTJOM0JSbndsdXE1U3F0Qkx6SlRZYmlXNnRtZThjRU5LM25LVVU4?=
 =?utf-8?B?M3lldE85cjRYS0U2VjVIUGRwRWRxSWVMekowWjB3blBaSlRLRFh0Y3pvODVN?=
 =?utf-8?B?bVNoNVF0OTI5VEd2ckV1SUNiWnQzemh5ZWlwSitkVk1DdGZYUnJDMldDb1gw?=
 =?utf-8?B?QmFHbVJKN2dvMTgzKzQ1SXFIRXNTVzNSZy85Z0NFMVd2MWFVaTBaREM0czYw?=
 =?utf-8?B?TEptYnJ1Y3Q5QUJVa1NKVTNocFFqSDVFZkFaYngyMytLSXVLWHVwVE1OT050?=
 =?utf-8?B?QUNDOUEzWWhKN2lGamo1UFB2UkJid3JBQThqVkRMVWtKMGV0aFFDVkJDMDBG?=
 =?utf-8?B?NG5hTFB5VGFJSjlVOVVqMnhDbHh5TjJ0bDVod1hpaXUveEV1ZmdXOEpSUVNS?=
 =?utf-8?B?MEhiWnJIK3RBaFBwODNpY1ViRWpnSHZGdTZwbTFXV0xlWGpzWXBrOWp2TFdE?=
 =?utf-8?B?cmVvcXEwMW5iRGhZWkNvMTZLNENHRXNPazQ4ZncxUnM0OWk1TmMzQjF1NjNJ?=
 =?utf-8?B?ZFNBckl5ZlRDRUR0QjhsTyt1bURzeUc5OGxJU04zbXZjeHlWOXhxSGt3KzBo?=
 =?utf-8?B?WmZPK1VJSVQ5VlgwUGMxdkR2WXpSbzNQYlJhWWZETmNRWTVoNjJwTkl2NUJY?=
 =?utf-8?B?OUhYUUtFdnV3NSt3U2wyazVlSy9BSzF5a25XdlByTDZLM3RlV0ZUVDJ2TEk1?=
 =?utf-8?B?MjFlWXE1a1R3dVUxUEpISDR0cWp3TjdBd2lKdS9oNHJZeGNNaEJ2eXJHMm0z?=
 =?utf-8?B?THlzT3hwdTVlN1lCd0JXRlhiU1l1WWlJZzdWQzh6SmkySDR2WkljbGJQc2Qr?=
 =?utf-8?B?dnlZOWJtalNJTHBpR3pYT3BNRm94aTJOVys5TUkvWnJXd1g4RWFwNEp4TXVS?=
 =?utf-8?B?OGhiajJDSTdNRzJmU05jNGYzQ2xNUG9xMmo0Wjd3L2d4dWRXdkZnUUFtM3RG?=
 =?utf-8?B?TDJOSU81MWxFQU1iNVVQVDZmT0xzY3dOYmZtWHozcGtqd2U4czhaZUFKYTRR?=
 =?utf-8?B?QW5SMjUzSitNc0UxSy96TlVFcDlDZjFCdWtuUm45ZjVuMlZUQzBzSXFVb3JS?=
 =?utf-8?B?bDNTT3B1cWVGZ09MdW1XWkErd2xudUlIQU9YWXhnYmNrOTNJMFBkNVBGV0Iz?=
 =?utf-8?B?eGNPYkhuamlsTmZnejVZOUEzL3pObERrdnJVanI1bjRLaWpMNm5UVlBLcXlD?=
 =?utf-8?B?YjdJVmlEOTV5UG8rRjdETWVnMTFVR3JmWmJtSVB4OCtKbFZDbnIwUVVvUmIw?=
 =?utf-8?B?TDh0OUJTN0s2cVJJYW9lazdDQ0lEa1dXeGhhSWQ1YytFZzNBMjJHOERWK0Rn?=
 =?utf-8?B?ZjBmZjZBRGt1WGkvdk54VmdrNWtmR0t0WlI4aHdnOGQxQ3JQaDdvcWh5dXp6?=
 =?utf-8?B?M1R4Q1kwY2ZNbUpyVG9PZ1VyRUVSZVhtUUVhek82ZVdBM3kwQnYzK3l0T1Y0?=
 =?utf-8?B?a2JqcWNmdXBFY2wvN01rT2RNTEZZcVFvS0VabmZlY3NWVkt0VkVITkcrZWNJ?=
 =?utf-8?B?eFQ3NXBURGgzWlljZ0FuZnhuK2FWSXhIRTV0YndQRDlVTWE2bTFrMFVrYnZF?=
 =?utf-8?B?aFYrNDJRMnBBR2tYUjY5ejVLekM4TVA1ZldQNlpaSEFldnErTThrVTlReldB?=
 =?utf-8?B?eG8xdE5yNHJPdzlyVmc4SmNabWFRajRzRkJ2TENpcWxCbzBnMFEwVTFXUm9D?=
 =?utf-8?B?dERoZG04KzBSeWR0NHlLTTAzMTE3WU5hK2JoL250YTJxL09YUisrZ3FMRWRP?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ad934820-8b23-42d4-0d72-08da76fb9a4f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 16:00:22.5649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WXUwv47z9SmtTmAhXs1JaJm4SNaDL04a+0YYcXDYEiTT9/B3rt90EYdy2vulq8U+Xc6Wm8F8IXOUBzaqAEzBuOKdeEx/XRRt7NU9m3g5Dgk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2075
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
Cc: Jani
 Nikula <jani.nikula@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

At the moment, when we refer to some PCI BAR we use the number of
this BAR in the code. The meaning of BARs between different platforms
may be different. Therefore, in order to organize the code,
let's start using defined names instead of numbers.

v2: Add lost header in cfg_space.c

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lpe_audio.c |  5 +++--
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c     |  7 ++++---
 drivers/gpu/drm/i915/gt/intel_ggtt.c           |  9 +++++----
 drivers/gpu/drm/i915/gt/intel_gt.c             |  3 ++-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c    | 13 ++++++-------
 drivers/gpu/drm/i915/gvt/cfg_space.c           |  5 +++--
 drivers/gpu/drm/i915/intel_pci_config.h        |  7 +++++++
 7 files changed, 30 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_lpe_audio.c b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
index 4970bf146c4a..1e18696aaecf 100644
--- a/drivers/gpu/drm/i915/display/intel_lpe_audio.c
+++ b/drivers/gpu/drm/i915/display/intel_lpe_audio.c
@@ -73,6 +73,7 @@
 #include "i915_drv.h"
 #include "intel_de.h"
 #include "intel_lpe_audio.h"
+#include "intel_pci_config.h"
 
 #define HAS_LPE_AUDIO(dev_priv) ((dev_priv)->audio.lpe.platdev != NULL)
 
@@ -100,9 +101,9 @@ lpe_audio_platdev_create(struct drm_i915_private *dev_priv)
 	rsc[0].flags    = IORESOURCE_IRQ;
 	rsc[0].name     = "hdmi-lpe-audio-irq";
 
-	rsc[1].start    = pci_resource_start(pdev, 0) +
+	rsc[1].start    = pci_resource_start(pdev, GTTMMADR_BAR) +
 		I915_HDMI_LPE_AUDIO_BASE;
-	rsc[1].end      = pci_resource_start(pdev, 0) +
+	rsc[1].end      = pci_resource_start(pdev, GTTMMADR_BAR) +
 		I915_HDMI_LPE_AUDIO_BASE + I915_HDMI_LPE_AUDIO_SIZE - 1;
 	rsc[1].flags    = IORESOURCE_MEM;
 	rsc[1].name     = "hdmi-lpe-audio-mmio";
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 166d0a4b9e8c..c369cfd185bc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -22,6 +22,7 @@
 #include "i915_utils.h"
 #include "i915_vgpu.h"
 #include "intel_mchbar_regs.h"
+#include "intel_pci_config.h"
 
 /*
  * The BIOS typically reserves some of the system's memory for the exclusive
@@ -830,7 +831,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	/* Use DSM base address instead for stolen memory */
 	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
 	if (IS_DG1(uncore->i915)) {
-		lmem_size = pci_resource_len(pdev, 2);
+		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
 		if (WARN_ON(lmem_size < dsm_base))
 			return ERR_PTR(-ENODEV);
 	} else {
@@ -842,11 +843,11 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 	}
 
 	dsm_size = lmem_size - dsm_base;
-	if (pci_resource_len(pdev, 2) < lmem_size) {
+	if (pci_resource_len(pdev, GEN12_LMEM_BAR) < lmem_size) {
 		io_start = 0;
 		io_size = 0;
 	} else {
-		io_start = pci_resource_start(pdev, 2) + dsm_base;
+		io_start = pci_resource_start(pdev, GEN12_LMEM_BAR) + dsm_base;
 		io_size = dsm_size;
 	}
 
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 15a915bb4088..8214e07a0f5b 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -16,6 +16,7 @@
 #include "intel_ggtt_gmch.h"
 #include "intel_gt.h"
 #include "intel_gt_regs.h"
+#include "intel_pci_config.h"
 #include "i915_drv.h"
 #include "i915_scatterlist.h"
 #include "i915_utils.h"
@@ -869,8 +870,8 @@ static int ggtt_probe_common(struct i915_ggtt *ggtt, u64 size)
 	u32 pte_flags;
 	int ret;
 
-	GEM_WARN_ON(pci_resource_len(pdev, 0) != gen6_gttmmadr_size(i915));
-	phys_addr = pci_resource_start(pdev, 0) + gen6_gttadr_offset(i915);
+	GEM_WARN_ON(pci_resource_len(pdev, GTTMMADR_BAR) != gen6_gttmmadr_size(i915));
+	phys_addr = pci_resource_start(pdev, GTTMMADR_BAR) + gen6_gttadr_offset(i915);
 
 	/*
 	 * On BXT+/ICL+ writes larger than 64 bit to the GTT pagetable range
@@ -930,7 +931,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 	u16 snb_gmch_ctl;
 
 	if (!HAS_LMEM(i915)) {
-		ggtt->gmadr = pci_resource(pdev, 2);
+		ggtt->gmadr = pci_resource(pdev, GTT_APERTURE_BAR);
 		ggtt->mappable_end = resource_size(&ggtt->gmadr);
 	}
 
@@ -1084,7 +1085,7 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
 	unsigned int size;
 	u16 snb_gmch_ctl;
 
-	ggtt->gmadr = pci_resource(pdev, 2);
+	ggtt->gmadr = pci_resource(pdev, GTT_APERTURE_BAR);
 	ggtt->mappable_end = resource_size(&ggtt->gmadr);
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
index f435e06125aa..e4bac2431e41 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -26,6 +26,7 @@
 #include "intel_gt_requests.h"
 #include "intel_migrate.h"
 #include "intel_mocs.h"
+#include "intel_pci_config.h"
 #include "intel_pm.h"
 #include "intel_rc6.h"
 #include "intel_renderstate.h"
@@ -830,7 +831,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 	unsigned int mmio_bar;
 	int ret;
 
-	mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
+	mmio_bar = GRAPHICS_VER(i915) == 2 ? GEN2_GTTMMADR_BAR : GTTMMADR_BAR;
 	phys_addr = pci_resource_start(pdev, mmio_bar);
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index aa6aed837194..1e79d3c8b126 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -6,6 +6,7 @@
 #include "i915_drv.h"
 #include "i915_reg.h"
 #include "intel_memory_region.h"
+#include "intel_pci_config.h"
 #include "intel_region_lmem.h"
 #include "intel_region_ttm.h"
 #include "gem/i915_gem_lmem.h"
@@ -45,7 +46,6 @@ _resize_bar(struct drm_i915_private *i915, int resno, resource_size_t size)
 	drm_info(&i915->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
 }
 
-#define LMEM_BAR_NUM 2
 static void i915_resize_lmem_bar(struct drm_i915_private *i915, resource_size_t lmem_size)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
@@ -56,15 +56,14 @@ static void i915_resize_lmem_bar(struct drm_i915_private *i915, resource_size_t
 	u32 pci_cmd;
 	int i;
 
-	current_size = roundup_pow_of_two(pci_resource_len(pdev, LMEM_BAR_NUM));
+	current_size = roundup_pow_of_two(pci_resource_len(pdev, GEN12_LMEM_BAR));
 
 	if (i915->params.lmem_bar_size) {
 		u32 bar_sizes;
 
 		rebar_size = i915->params.lmem_bar_size *
 			(resource_size_t)SZ_1M;
-		bar_sizes = pci_rebar_get_possible_sizes(pdev,
-							 LMEM_BAR_NUM);
+		bar_sizes = pci_rebar_get_possible_sizes(pdev, GEN12_LMEM_BAR);
 
 		if (rebar_size == current_size)
 			return;
@@ -107,7 +106,7 @@ static void i915_resize_lmem_bar(struct drm_i915_private *i915, resource_size_t
 	pci_write_config_dword(pdev, PCI_COMMAND,
 			       pci_cmd & ~PCI_COMMAND_MEMORY);
 
-	_resize_bar(i915, LMEM_BAR_NUM, rebar_size);
+	_resize_bar(i915, GEN12_LMEM_BAR, rebar_size);
 
 	pci_assign_unassigned_bus_resources(pdev->bus);
 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
@@ -236,8 +235,8 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 				  mul_u32_u32(i915->params.lmem_size, SZ_1M));
 	}
 
-	io_start = pci_resource_start(pdev, 2);
-	io_size = min(pci_resource_len(pdev, 2), lmem_size);
+	io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
+	io_size = min(pci_resource_len(pdev, GEN12_LMEM_BAR), lmem_size);
 	if (!io_size)
 		return ERR_PTR(-EIO);
 
diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index dad3a6054335..eef3bba8a41b 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -33,6 +33,7 @@
 
 #include "i915_drv.h"
 #include "gvt.h"
+#include "intel_pci_config.h"
 
 enum {
 	INTEL_GVT_PCI_BAR_GTTMMIO = 0,
@@ -353,9 +354,9 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgpu,
 	memset(vgpu_cfg_space(vgpu) + INTEL_GVT_PCI_OPREGION, 0, 4);
 
 	vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_GTTMMIO].size =
-		pci_resource_len(pdev, 0);
+		pci_resource_len(pdev, GTTMMADR_BAR);
 	vgpu->cfg_space.bar[INTEL_GVT_PCI_BAR_APERTURE].size =
-		pci_resource_len(pdev, 2);
+		pci_resource_len(pdev, GTT_APERTURE_BAR);
 
 	memset(vgpu_cfg_space(vgpu) + PCI_ROM_ADDRESS, 0, 4);
 
diff --git a/drivers/gpu/drm/i915/intel_pci_config.h b/drivers/gpu/drm/i915/intel_pci_config.h
index 12cd9d4f23de..4977a524ce6f 100644
--- a/drivers/gpu/drm/i915/intel_pci_config.h
+++ b/drivers/gpu/drm/i915/intel_pci_config.h
@@ -6,6 +6,13 @@
 #ifndef __INTEL_PCI_CONFIG_H__
 #define __INTEL_PCI_CONFIG_H__
 
+/* PCI BARs */
+#define GTTMMADR_BAR				0
+#define GEN2_GTTMMADR_BAR			1
+#define GFXMEM_BAR				2
+#define GTT_APERTURE_BAR			GFXMEM_BAR
+#define GEN12_LMEM_BAR				GFXMEM_BAR
+
 /* BSM in include/drm/i915_drm.h */
 
 #define MCHBAR_I915				0x44
-- 
2.25.1

