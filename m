Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B72258ADD0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Aug 2022 18:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7CDA4E20;
	Fri,  5 Aug 2022 16:01:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED858CFC5;
 Fri,  5 Aug 2022 16:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659715290; x=1691251290;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=6njxYTDdzpMHLojrHDFMze77mQaREE49BSXeLqzmeFc=;
 b=eXcFVMYrcsSGBw3eeMTr3SOZzhXA1wyLSRStT2Ogc+7VEQoYImxGLOcF
 rmdR0YOUbhpwHCNLtEl9DGIAojPuHPxQ3sTG58I7d84W2rqGHYO+t7V8y
 cl6kGfCpOn665NDz5Yv8G07AgMMYahU+qihF/MGOtAA+L4YZ1J1V33fDn
 tW0BC02f5mf8H+tKuwtvD//rnEhyWU0HJ2a6TZtm7tHkxbmOEX6vz+HLy
 ZvP1meLLDVUSYh78Bbu5svL0LB7y9JasfjN+DMVzHmiUAw7Phu9lB/FJR
 5RAXOP2QOKBg5ugp3IamgAtDYkZZrkTAZG4IEEOYx3baI7hChJ5gRY1wB w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10430"; a="316123321"
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="316123321"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Aug 2022 09:01:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; d="scan'208";a="632057692"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga008.jf.intel.com with ESMTP; 05 Aug 2022 09:01:08 -0700
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 09:01:08 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Fri, 5 Aug 2022 09:01:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Fri, 5 Aug 2022 09:01:08 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Fri, 5 Aug 2022 09:01:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VgW13l+8Xhm2FgdLcSAM34/uHYOOM1qjUWgndLYuq9tZ2O4MEzvAxGlacFw0pNXTxpPPk8n286IkbRRPi7IXNgBA7ThVG00lJz5KefBeidzBFh7yuev9zeaY4DRyqYF4l0Skbg9gMUcaqDgGMaqp6sgMjgExPECn2tcbzMWRzPrxUAFb5lvrZJRdy6A+1PRQhpQKL1kwITXUitv1Oht7jTb/4qLqE+daazVknX+PyJMbJZeROxZnquSjnz5J8Pzc0kWnNdPjZAjKw0czzCxSNoCFjkPtQPaLjOGJIG07jSp68B/RPKuumKBnl0aM9eLUsmVwFPFvlMzmNOdqRkq0Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7WnDrQipR0PE3fTWyDx0XDMy9aurRWHpnLGywp8cjo=;
 b=Ri8CsEYEpTtg16e0f3GuHEqInVWBYHmJNAPQ9nDTt3p+z9N9aMVaY83Zna2k7pAOu62j9rKUI39bqbt2ecMBwtxcFUdD94Sf2FtozPIcPhkIEtWmUZzyl7Fx2dMnRXtpiJjBOjDU9JX/FnA7587cqqbGpB6RXTyuQeZenPgM5VrJ8W7/+TUSXIMPbq1Ty5MZqM1kMLihGWpxuFly6h+84QOurVkeO6z7/F8+bbhNcmR+T1kdU96bVRVGiNMPDAT7yga3X94Xzdg2AombCsWhINM1bZ3awqxSE/33GmRQTIQs4T3gaOYb2pMfsXFsg0rqHoJcPmE2NGNnk1h0X5Kc/g==
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
Subject: [PATCH v3 2/2] drm/i915: Sanitycheck PCI BARs
Date: Fri, 5 Aug 2022 17:59:59 +0200
Message-ID: <20220805155959.1983584-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805155959.1983584-1-piotr.piorkowski@intel.com>
References: <20220805155959.1983584-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To DM5PR11MB1372.namprd11.prod.outlook.com
 (2603:10b6:3:11::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 406c523b-80c3-4843-1d1c-08da76fb9f29
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2075:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CrEjMJQaorftnKi9L7z7pAC1nLRxhQlDcBUjypIFWmfCxm/imSa2CKbVYkC5oT48rO7YHJ/k8E3oogfvTyrA3App3SaWECdkWfB8SDc0hR8XCrgNDIWzO77CVdhUCZVtC5LEjIfvlf0ygDJGcP7+OFelT2KRrkqTuySwNBrdP+ilzBChRc4ncNcX+Y2ZymR30OsfMWp1iDKc1QJPByUyZfy8Pp21bvzJOT03dbqsdhRnQ8BxHrVHnwnpvV1dvDWW0GpYGU0yO18LVS3C6cDOW61AomjkUYMlBBel6Nq40RjDbXenlaYllLcqR7ar5IRnw6FLDvGvoq0k8MwYBaq1XwpoFgCWu6cdO1L1bslfE2YsKNNlPeZGlymv89n7nNYT21u5cbn1hSommm7dU8n0CFCovqkTIEITTPYz8sJdJJVHxEu1z1I2XyNCu1IqT/eofcG2SPmfh3Wlx4pS8ZXzuyoFdWs16d1/UT5A35v77CZc1H34SODe7TsVcvfOuIjex2387BCfnqzO22HyPiTyYDyYBIch7RBGS8c+57Q+HLTkGBdYcrCtRur7pZCeF5y7bB3/CAmJ4r/OyM/s8PoEc+ajVw5Y1ViCEiXWcSp01Wm2bmqdkZ8OLBVx3F169ccVIMd82AHIY2WvN/u/uuEFmx9U89/VXgLbf/LisBY6LP/kr7VAfnilBdVQvT4wEOsx5HQ8gwCOageKg+vloJPIoY1IZ3E8CImjqz4dQZqXBiP0VbPD3K9cGVkGkLHyucpE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1372.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(346002)(396003)(39860400002)(376002)(366004)(2906002)(83380400001)(82960400001)(38100700002)(6486002)(316002)(66574015)(5660300002)(66556008)(54906003)(66476007)(66946007)(8676002)(4326008)(6512007)(186003)(1076003)(2616005)(8936002)(86362001)(41300700001)(6506007)(478600001)(36756003)(6666004)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWxIYWUvU2RnT2ZOWERBb3dSUkg4dXF4OStsNjBvK3VOWmpnWnFqb2l2YkNz?=
 =?utf-8?B?YXpxSytlOGwyWG9HQVNnV01CNDNCQnJzOHRkMU5SOUtMcUFzYkpvNkd3T3Jh?=
 =?utf-8?B?aDl2RHZaMUw3WmRTdVg5NE0wNmZ3UW12ZVdVaTgyRlRLa2hKTkNwcFNwci9m?=
 =?utf-8?B?dHBpZ3oydjdUOWVDVXhFcjNuTTlGYnhJZEU3MlVVeEcwQWR5Y3BXUjNsSVRw?=
 =?utf-8?B?WXdOYnlVMW9lUVpLbXZRWEkrK2NsMVorMGRjWUJLQnFTU2ZUTGVObVdxamE0?=
 =?utf-8?B?TGs1RDBCbW9xYmhWK3lmNUlrUE1CbWlPYUtXYnZxQVQ0VEsyT3FwWjA2UTFj?=
 =?utf-8?B?ZEFnS0IxTjJRb0tNTVgxQXNlaEJEMFJsNVhyVGd0ZDNHRS9Nd1ppWm50SEZi?=
 =?utf-8?B?c0VnMnFJRWdqVzdEdUcwcmFwRWZaL1o3YlRSUlpIVzNJcS9RUWVtZzRaVU54?=
 =?utf-8?B?LzAyYi91RFUzbzBWTzVIc0FRT25EYUcxS1A3Mm9vMUpsdVRzNWRaVmJSQ2h1?=
 =?utf-8?B?Y0tTalFRRWRPZk1mVm8rMlBuMmlaZmNzc3lTcm1mcFd4OXZwb3J4M2FsZ1RG?=
 =?utf-8?B?Tlh0dkMzd0pOdmltaEFFRHE4UExhWHJNTForRWhtd3lSMjNlRUhYQUtPa2lr?=
 =?utf-8?B?Qllka2tQalY5UVh2cXJKYWRiVy9WTVV5VHBxU25aanJoTTZxSWFHQklyekc5?=
 =?utf-8?B?WXpBMFJKTURlNHNBa3h1MTZUdWpqWVhEdS9OcldtempVU0NZcUVqNWNJcm5w?=
 =?utf-8?B?VXZRYkJPazI0MEhNWld5WGtzZ1ZSdXZNeFlFL25mcjdNdlBvNk1Qc283a0dr?=
 =?utf-8?B?dnlEUkkwZHNiZ2FTTTZDQWFuSTVkTCtYdGwxUnRsWjZ4c29TL3hIRGlEM0RK?=
 =?utf-8?B?M3NNTGxNUHF3UXJid0duMjloWng1amZDV3o0QUdBTW1VVy9zblp1WWNvYVZP?=
 =?utf-8?B?MU9QcUhBUFA0cVBjdEo4eFRNakNZQTBBTVR4VmoxblJkaWFmcCtmWUxGNG9D?=
 =?utf-8?B?bVUxYktrNXV5b2lidWZsWS9XL2RtMTZvSkExK1Znc2VXV0ZBdGJkK0pNQklZ?=
 =?utf-8?B?WXFJa2RudDNOMEFSVmJVdEg4RktXdnlCbHpNVnZkRENrZEthMUdwNEhoSThh?=
 =?utf-8?B?cmFrK0VLVlZCZi9wSEluVC9FeThYVkJmK2FQeHExUldqRU9YVmpzRy9LaWV6?=
 =?utf-8?B?WjMvKy9vQ3dGamRGNXA5VFhQTUpEVTl4czd6SXk4STZaSndlRzJHcGdkbktR?=
 =?utf-8?B?eUhsUDhhc0ltNXFuMXppUzNwc01vUVZWbHZ1bEpNTEJIbm9Vb1NmeGwvZEs4?=
 =?utf-8?B?YjFwQTNtNFNHcFd1THl0VXFiK21CYU9uc3ZrcFFGb0lwYWtsVTJwRnVoVElE?=
 =?utf-8?B?M2h0U212VkRtSzFDUndLaXB6UjQ1U0M2R1QyZXFqOW54MnloTzE0Y1VWNWxh?=
 =?utf-8?B?andkcWNyblBHNjVPanNmS3N6bkFmaTdKOU9qZnlYalMrTVpiazJuWmNvenR6?=
 =?utf-8?B?UGl3d2JkNjMrNkRZSUtzeElQZjhhOVp6U3M4VnlwZUpzSEdZZUp0aXU3Z3hN?=
 =?utf-8?B?MzY0eEFJa3JkeUIyVk9iTUJyRTJhVDVTQkdoN05WUVBEZysxRVdhQmxheWtV?=
 =?utf-8?B?R2VNRGRrd0tMSDZvRHcrWi85am1HZFZ5RXBQbk56SmJheEFneUwvR1FWYThz?=
 =?utf-8?B?R25NVFcvTnlRV1ZYcUtweDB2cEwvbVFFN3lMeTVpU1dpSlliOE1PZFVXZnlO?=
 =?utf-8?B?UlhpdTg4UTg1d1BvT2dGdEhENXRQOWxIZ25oZURJcW1NdmoxZk9IdEdPTWRP?=
 =?utf-8?B?M1EwVFpRRStSQTNUYzB0eG5ubHRkbkxPZVQzczNjTUVLMUtXeTUrL1F4SHZI?=
 =?utf-8?B?bkwxa2RBdXBaZ1BDbUlsVzQyc1NVNE1VbXZvbTg3d1IwSmEzUmVYZUdjRzMz?=
 =?utf-8?B?N3RXTTFJcmdKM2piU3BZeThKVWY1Tnc0ZTNpS0lyNlBzRTNiRDZKbFNEcFhU?=
 =?utf-8?B?OFRLVDdCMWZkcjhXdStDY0xrMUhaMjNadjlYd3VaSklhUW15MVlQdGh1UVJG?=
 =?utf-8?B?b2VXeklNVU4yd3RxNVdSU05naDFjNWpGek5xdmxoVk50SnNwVk1nM1ZMSElC?=
 =?utf-8?B?REpmVVpVSmExeUd6SitDUk5ZUG9Ic2src3R3ajlLNVc2eFhHQThLejhTWlp0?=
 =?utf-8?B?U1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 406c523b-80c3-4843-1d1c-08da76fb9f29
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 16:00:30.7986 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kqfQsqQxaIlpC8veinSUWVgzUmay4Cts4A5nfqUroQh96ytmoMwhlabWrpBZFHTrmTrAxzGbTSYlOgwaE6JO9s3kl3Fw3RUrNHpkdjB/+oU=
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

For proper operation of i915 we need usable PCI GTTMMADDR BAR 0
(1 for GEN2). In most cases we also need usable PCI GFXMEM BAR 2.
Let's add functions to check if BARs are set, and that it have
a size greater than 0.
In case GTTMMADDR BAR, let's validate at the beginning of i915
initialization.
For other BARs, let's validate before first use.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c  |  4 ++++
 drivers/gpu/drm/i915/gt/intel_ggtt.c        |  7 ++++++
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |  4 ++++
 drivers/gpu/drm/i915/i915_pci.c             | 25 +++++++++++++++++++++
 drivers/gpu/drm/i915/i915_pci.h             |  6 +++++
 5 files changed, 46 insertions(+)

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
index 1e79d3c8b126..f3ad93db0b21 100644
--- a/drivers/gpu/drm/i915/gt/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
@@ -4,6 +4,7 @@
  */
 
 #include "i915_drv.h"
+#include "i915_pci.h"
 #include "i915_reg.h"
 #include "intel_memory_region.h"
 #include "intel_pci_config.h"
@@ -201,6 +202,9 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
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
index ee048c238174..8dfe19f9a775 100644
--- a/drivers/gpu/drm/i915/i915_pci.h
+++ b/drivers/gpu/drm/i915/i915_pci.h
@@ -6,7 +6,13 @@
 #ifndef __I915_PCI_H__
 #define __I915_PCI_H__
 
+#include <linux/types.h>
+
+struct pci_dev;
+
 int i915_pci_register_driver(void);
 void i915_pci_unregister_driver(void);
 
+bool i915_pci_resource_valid(struct pci_dev *pdev, int bar);
+
 #endif /* __I915_PCI_H__ */
-- 
2.25.1

