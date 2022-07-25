Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC98158049C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 21:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC696928E5;
	Mon, 25 Jul 2022 19:41:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50D08F40C;
 Mon, 25 Jul 2022 19:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658778095; x=1690314095;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=WzwyC+M3VtycZuhnc+cCib+YJ1adu0Z93k1Wj9FRR6E=;
 b=nSFA9oJPDQzVWE7+2C6V89BYR7h/fwZC1wpC6MycM2TRaI3coWahujiW
 Bnx5FvB+ZvS9LoBMMB2RVrfMMl8O74yPbctjgCRbIBoKvfI5mfANNwRug
 F2+WSdNy+Cln0GrSm6xe0EUbksX64MdJaljNnqkv75iuKAmrLPPgic3Bx
 6nBWuzxrgV3wrRoAaKoMoPPBBaQINQtTDN35Jp4j4UwNQrIcIfApp5Ewf
 JsnumqjgVgiOWVu+5syL95b3hlRNiZEREj9Wn3MYHoILiTAb0kcC3SnvJ
 0wlY1+l63roL83q/xWetehMq47Hix69V9lgNot8nakGHF9yYCyd68Vf/0 g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10419"; a="285330754"
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="285330754"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 12:41:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,193,1654585200"; d="scan'208";a="726277870"
Received: from fmsmsx605.amr.corp.intel.com ([10.18.126.85])
 by orsmga004.jf.intel.com with ESMTP; 25 Jul 2022 12:41:34 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 25 Jul 2022 12:41:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Mon, 25 Jul 2022 12:41:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Mon, 25 Jul 2022 12:41:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CuS+dB7AP4VCYisEMuTUht0r+BXoJs2bsC7GpieGjejdlcqHYMccDhkS/w/LFLszeQh6M/wnkJ1/aXsUz0IBgkU9EeN9CcUtbnqWeINxkhHkQ3Lp+5ACaQdY3c49ze5MgIZhfjBAc/j8FExUWzSYZpcgCm5lQ38G7mgzObXL7v5ONdkDcLttyHyOV1h7/KUJJnN4mwqCm8R2p1M8f2szn45CTVj0Enmhn7rYnrmlNRUCtN0u46tt2AFaut8NfiM/dy4tf+O+xaM0w3fyj6xnca9FYtxjnTW2mQLWgPDbh7cSEePFWbMdtPO5C+2L9TLbNggpKguLVgty7UrhOYWQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oY9YwvYxztQsFS3WwfuRZAmy7hNtvWJz4/fQr/uldxY=;
 b=btbOmmyOK7l3RIZiTxH+5mBd08nkFeeRxZuSgV0k3w2PtOci/VWyD3mV7KpcDuMmumlocKk43xO+NNEcvF49oZ+pQy54YKCQS5tImpCHOpOf4YHrh1wXlw8yowmkqFXgMblq2Fg+CzxtK84HYCJrRfzIkQbGmrTLbc8GiNPTVi29xx2zftXaiOLPS0pykZ51WQyBrD3TJmxI85cxyF14BIJ9u+iaCVq6luqCiusp5PdT7uHBWwxjyrdpVlwaUC2aTZul06EibuQwKXg+si6H1QkgjWvNx4bEnUFAlSFNKdhpsY7hUAy4hAJ84vR8qzAGJdhfOoAcSm6bemgXI9Filw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1372.namprd11.prod.outlook.com (2603:10b6:3:11::14) by
 CO1PR11MB4851.namprd11.prod.outlook.com (2603:10b6:303:9b::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.19; Mon, 25 Jul 2022 19:41:32 +0000
Received: from DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507]) by DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507%3]) with mapi id 15.20.5458.024; Mon, 25 Jul 2022
 19:41:31 +0000
From: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/2] drm/i915: Use of BARs names instead of numbers
Date: Mon, 25 Jul 2022 21:41:04 +0200
Message-ID: <20220725194105.4054734-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725194105.4054734-1-piotr.piorkowski@intel.com>
References: <20220725194105.4054734-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0634.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::9) To DM5PR11MB1372.namprd11.prod.outlook.com
 (2603:10b6:3:11::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3b43f1ab-2649-4221-d412-08da6e75ac9a
X-MS-TrafficTypeDiagnostic: CO1PR11MB4851:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IUq45lEVQAybMT0Jyq/5HFOgOC1h4G7I0B4QsKx4+wHg/6CZWvEN+rspMKGKfZ5N2o/0xc09l64iw6QVOtxrw4kLoN5GoZXU242tV43vg6EDpLlFqQWbvg/8BxowiIU9eJqzc8Bg+OfE88US5TtGpfvyPvO96TN4Novgf7xE7GYeHtb06wW2tG/dWnNL716NtmQOF4xpbMIyhiqjTuMvHmeVnoZV17vv1r8QRee2Ru0K5wDsRHH3zbHs2RahhtLGyhyjrxE9r0P38QdUXVQY2eEQaJp62TsHiH2Mt1awu0IfKX5JRutS8RXQIRJHRzv4AAMjN2BlCpMsvTNdrtwWSJXXbXImFU+LWJauVd4/0AI/dVFOmTa4mY2wiB+ZbwkkT3DXr/szncUV1NBqmDZwSKBstmfmZFAqeqqYdwkt7a1eYBjflwDTt6XUot9+SPP9m8BBR7oibw2f6d44Yk82S/ySmZrVpAxXdmZyD2rKWRj7npyhsNHbnLdjPVpSml3Guw5C19pVebdtNQGNjkturuG5bYGKlU90XlXJRlCPlErtBOwdViQBbD9GwFeaSuX1jBQZlzMX5H6klAhsXnhKaKoDkcRUVrLokAersSmOB7EPEVUpn4ERcCBTpghnL/xenhxZqmD9nq6YoIcHPLabv4t9/rIzLbrzU/FuqVJovnFwI57pbCdp0EWzzedIMiN2p1sm4wnfxZxkbAGzdatnrKePOoHHLpdpm/l4HMN2Y88yVl5bfNqXW3q8VOnywsVd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1372.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(376002)(396003)(346002)(366004)(39860400002)(38100700002)(86362001)(6486002)(8936002)(82960400001)(478600001)(5660300002)(316002)(66946007)(66574015)(66476007)(4326008)(8676002)(66556008)(186003)(1076003)(2616005)(54906003)(83380400001)(41300700001)(36756003)(6666004)(2906002)(26005)(6506007)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWZ6SG1vNG8yQkZ4N0xwSDB1aTRYdW80dWkzdFdNS0RJNktVUzFrODYrMXo0?=
 =?utf-8?B?S21CdGphMjNGM3ZoczRjUnNLK2NGRmgwR2gzQktUcDhvY3RrKzBDR3BlRVJK?=
 =?utf-8?B?QVFsZlY3VzVwanhOVDRyOTRKdzNQK1liL1AzeU5sK2gwOHZRd05SSjAwREc0?=
 =?utf-8?B?Z01WcnI4T1NvVE03Q1hySEVyODc4bGd0OGJuUWFPOXg4b2JtblNXL2w3bTdB?=
 =?utf-8?B?cW1HL0VtWmtJenVWbG54aHFuWmhIUk5IdlVXbllSOEI4aTRCU3VISGx2L1Zu?=
 =?utf-8?B?MnlOcTV6b09yaGpjSGc2VHhnNmw4bjNyR3JWODBKYVlNS0JoMnB4NFpmdHU4?=
 =?utf-8?B?MU84MVZDRlJoVFlERXhDQUgvWWhndGYzc01LbjI2aWE1NHVEZ0Rjb1dDSUNL?=
 =?utf-8?B?czBLVHFXSG14ZjE5ZUVoY3l1cXdMMXloYVBXbUw4anY3aStQTUpXS1NNbzhX?=
 =?utf-8?B?TWdvRGo1NVJPN3JiNngwdndGSldTVFpMK3VOUzJObXlqOERhQkxBSU1CSWRB?=
 =?utf-8?B?WFJIZ3pxZnZkWjJGbEdWWVVicHAyaGpwWHVZYzlUZDFDQzZmZjRZK2hXckFz?=
 =?utf-8?B?SGlUblk3WDdOdDdRTHNsOEh0L1F2emQ3b0pkdTlUalNEcVpIY2JjdmdndWs5?=
 =?utf-8?B?RzZXakxaNElkZmt2UXllQm1hOEJPT1pNbFFWK2xUN1NGdzVTS0kxWUpFVXJw?=
 =?utf-8?B?czIxekUwQ0ZnNW0yRkEzSmNFRmtnYVN1bWN3YmE3RUJFYjhNUEl4UVo0N2RY?=
 =?utf-8?B?UFAyc1N3ajE1VTFaWHlSQ0dWT0JObFF4NFJmN09MbEVBUWFpY0xycTBEdFBG?=
 =?utf-8?B?Sm40dXlybmFkMzhrZTlYNEM1UkkxU0Zkc20vM0dxQXplR1k5ZlBuS0lOSE4v?=
 =?utf-8?B?WDdoUGtWSTZvNGh2MjhDb3B5ZjVLdU1xQ1BnNDZjMm5VbWNTUXVLTGlKYW0y?=
 =?utf-8?B?Z2FtcGNqVTRJdGhJZTJFby9LbEFQby9oaCt5K3ZYcFRPRmRPN2VMeWFzc09j?=
 =?utf-8?B?QldqaVhBYkZGRFRNaUNiZVJlQ0cwaVF0Z2V6UHZ6clZQRnE3OGtvV29WS1Rh?=
 =?utf-8?B?V2Vrd3dsR0J2TXpTWEpCMVFxY2ZUSFpOUU5PQ0dGNzd0bVNielZBU25qZDVm?=
 =?utf-8?B?UThQSFUyUHlwWFdPV1MwcVlWUFdDM0hqaEI5Q2VqTWhQUVhCZ2ZmZFNzdXBQ?=
 =?utf-8?B?cWRKRVRRRDF0NEp2ZGVXNjRoa0JQTnA4OUlSUUlTYjB5Yzk5emRzamoweFln?=
 =?utf-8?B?N2RjWWdiWTNnRHNlR3crampmdFBIZUdsekFXdFZER3U4T2ZiTUh1RHE1dm9X?=
 =?utf-8?B?cU53SWFEcDAzQlZmYnFCdVN2TFMwcnlURzcxdldiZVhkTk1YdWV1SHdseHBC?=
 =?utf-8?B?SkRTYW5KS0VRUWViL01BWVNPSjRaQWYzTVNlQ05TZThDNmRHVFlXTkt2Q3J3?=
 =?utf-8?B?WXlkMk81YzBTczl1ME41NzIvK2VPdUwzQ3A5aGNBVitGMjlqS0RUOXRualVL?=
 =?utf-8?B?azFxMnBJRlN2aGxjbG9ZU3gyLzkxUEg0bytGMWRhN2l6TjExWGo5NndjMk5i?=
 =?utf-8?B?R1Z2cXVWZHkxK2hSdURjc0lMNkVBa3BqVjU1d2luWjZnOG4wZ0tXaFBhcTNE?=
 =?utf-8?B?azVlZjVzZTRmN0t5TUM4dENUVk01UDJxVWlPdTc0QUc4Y0d0bWVoQXo1Kzg3?=
 =?utf-8?B?eit2bnVOa2ovazRhK3pOZHJ4Uy9jM2RWWkNXME5kOWxyR0dITGwvelJQMjcx?=
 =?utf-8?B?QTRYcnpmZFZRelgxWkd3TGxOSk14c1BPYUNjaWZ5YXk5Zjg3YmZUK0tWU2tW?=
 =?utf-8?B?Ulcvd1lNUWFCeXFFVmJzKzRINXI3WlU4TDNaTW8weStqZHB3YXNkNFlFUThY?=
 =?utf-8?B?bVVxUytCZGR0OGsxK09Gc0tWK3BGUHUxQWx4d3IvODY1K0hSdjRtRU9Wb3Bm?=
 =?utf-8?B?TWxuc0dabW54dGZ1V0R4SWZsR0ROb3BtQ05pREdpcjJVeUQzRFlWKy9uWVQw?=
 =?utf-8?B?ZE1WajFKc3JPVm9LdFFJS2JCZkRJSHIzdlViTzNsMVZXS016eEdZQzYvaUlE?=
 =?utf-8?B?KzliSDVvWDc4QWxVaVFlT1FkUTFEMFR1cEszTGVHaUhmckVkQVB5aUJlcCtH?=
 =?utf-8?B?NXN5RVdIeEpBdGcrTHdDMDJFazNlcmFGQ1RRZjlvdzN3L1kwckViRUljaDVJ?=
 =?utf-8?B?Tmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b43f1ab-2649-4221-d412-08da6e75ac9a
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 19:41:31.4590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SyBiUyx/MWjOjqoh5Ig418YcW44BtGJJ8wQzBBxPvRKzKgeBrxp3+Up5R0fTtB8Hndgp1Ev/ttNPfZHKXUeeAOhcoUM3oAzE1G43Zv2809o=
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

At the moment, when we refer to some PCI BAR we use the number of
this BAR in the code. The meaning of BARs between different platforms
may be different. Therefore, in order to organize the code,
let's start using defined names instead of numbers.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/display/intel_lpe_audio.c |  5 +++--
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c     |  7 ++++---
 drivers/gpu/drm/i915/gt/intel_ggtt.c           |  9 +++++----
 drivers/gpu/drm/i915/gt/intel_gt.c             |  3 ++-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c    | 13 ++++++-------
 drivers/gpu/drm/i915/gvt/cfg_space.c           |  4 ++--
 drivers/gpu/drm/i915/intel_pci_config.h        |  7 +++++++
 7 files changed, 29 insertions(+), 19 deletions(-)

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
index 68c2b0d8f187..7b059fdf8cbc 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
@@ -24,6 +24,7 @@
 #include "intel_gt_requests.h"
 #include "intel_migrate.h"
 #include "intel_mocs.h"
+#include "intel_pci_config.h"
 #include "intel_pm.h"
 #include "intel_rc6.h"
 #include "intel_renderstate.h"
@@ -827,7 +828,7 @@ int intel_gt_probe_all(struct drm_i915_private *i915)
 	unsigned int mmio_bar;
 	int ret;
 
-	mmio_bar = GRAPHICS_VER(i915) == 2 ? 1 : 0;
+	mmio_bar = GRAPHICS_VER(i915) == 2 ? GEN2_GTTMMADR_BAR : GTTMMADR_BAR;
 	phys_addr = pci_resource_start(pdev, mmio_bar);
 
 	/*
diff --git a/drivers/gpu/drm/i915/gt/intel_region_lmem.c b/drivers/gpu/drm/i915/gt/intel_region_lmem.c
index 6e90032e12e9..0b78a5f3a996 100644
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
@@ -44,7 +45,6 @@ _resize_bar(struct drm_i915_private *i915, int resno, resource_size_t size)
 	drm_info(&i915->drm, "BAR%d resized to %dM\n", resno, 1 << bar_size);
 }
 
-#define LMEM_BAR_NUM 2
 static void i915_resize_lmem_bar(struct drm_i915_private *i915, resource_size_t lmem_size)
 {
 	struct pci_dev *pdev = to_pci_dev(i915->drm.dev);
@@ -55,15 +55,14 @@ static void i915_resize_lmem_bar(struct drm_i915_private *i915, resource_size_t
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
@@ -106,7 +105,7 @@ static void i915_resize_lmem_bar(struct drm_i915_private *i915, resource_size_t
 	pci_write_config_dword(pdev, PCI_COMMAND,
 			       pci_cmd & ~PCI_COMMAND_MEMORY);
 
-	_resize_bar(i915, LMEM_BAR_NUM, rebar_size);
+	_resize_bar(i915, GEN12_LMEM_BAR, rebar_size);
 
 	pci_assign_unassigned_bus_resources(pdev->bus);
 	pci_write_config_dword(pdev, PCI_COMMAND, pci_cmd);
@@ -232,8 +231,8 @@ static struct intel_memory_region *setup_lmem(struct intel_gt *gt)
 				  mul_u32_u32(i915->params.lmem_size, SZ_1M));
 	}
 
-	io_start = pci_resource_start(pdev, 2);
-	io_size = min(pci_resource_len(pdev, 2), lmem_size);
+	io_start = pci_resource_start(pdev, GEN12_LMEM_BAR);
+	io_size = min(pci_resource_len(pdev, GEN12_LMEM_BAR), lmem_size);
 	if (!io_size)
 		return ERR_PTR(-EIO);
 
diff --git a/drivers/gpu/drm/i915/gvt/cfg_space.c b/drivers/gpu/drm/i915/gvt/cfg_space.c
index dad3a6054335..c22d3a388aa5 100644
--- a/drivers/gpu/drm/i915/gvt/cfg_space.c
+++ b/drivers/gpu/drm/i915/gvt/cfg_space.c
@@ -353,9 +353,9 @@ void intel_vgpu_init_cfg_space(struct intel_vgpu *vgpu,
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

