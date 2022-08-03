Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D535888FA
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 11:00:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFC610E313;
	Wed,  3 Aug 2022 09:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41BA10E085;
 Wed,  3 Aug 2022 08:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659517193; x=1691053193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=V+7ErSAB7qGqBFKCqqKRA8Uul4Tdk9euRkh1yYPI/do=;
 b=GW74qKlcN3Q63zwHnBGmrNaPW+pZPW0WdP3tTJb/Rn5zEG92Dyj7pFxV
 rmp90Nl2cM+6T1BkFETOqACV8CqBBFRQ1V6Pp8VeM1wQ2ofa/7SRSiZfT
 qVBMCUSeZXF8fmwZfXZZJo4oSG9xi7NBWK354VK3t3GAMAuZclMJr1Bd2
 zo+g0vocdvIc9zoK09Ou3PcLgAANzix+qYPBm6i2ziY5aV/GknpxpEoFr
 Sadov7OL8az308D0EQo+swHqFjfPxIWgE7yHUcjrsGODCRtTMOKiFlCB7
 r8xPGOs9/WSaULDrQA2e/WhMRLQD282Zgb9PDMc21pO+wr1bC7AXt5ZcE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10427"; a="315481311"
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; d="scan'208";a="315481311"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2022 01:59:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,213,1654585200"; d="scan'208";a="553247724"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga003.jf.intel.com with ESMTP; 03 Aug 2022 01:59:49 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 3 Aug 2022 01:59:48 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Wed, 3 Aug 2022 01:59:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Wed, 3 Aug 2022 01:59:48 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.28; Wed, 3 Aug 2022 01:59:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ci63AM+EPP9Gq02bO7zdXzi7pOAR0TWl9RAHIBx7Y6rdz92QTL0T8eyfT2o1XVuwXqMOG1hN9wbgOy38qisBs3IbCQDPFJ0RiDCe10iUZxn3jP5pLCCDj4ofBX1ALk9Jnvv650V0bS+eIli7GTxhNUBlT+J/DWTVOGlPw6MDUAgN07MmhOY0NzR5lqcMjOWucUjll9aCISqjCqHpWeTHdj53wI4RyJX7GdVY+0tPRtc2g+LLp4ZVQaGQ7bAIE3gHpsSlkzzzsyJc94xO7TsEgbHpEPDT9ftRC4k1Wrdt14nozNENPs8tcKePzCiwzcwY2oOfDeLmGPERGeHWQMLbPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LahfnnIJ0HFYqBC0a3ZmG+G9bPTiJ7XSjk1kL2ExcL0=;
 b=FOt52hjc8pMpYCAaRKd2xayeTaSivXIp7q3k0N+W1RO2uc6jI5AIhuu1lteuwtmQ7YaPYCT2/OZ39nLI/pdIO+yKpc9YFZ/UBZ/ISRnBHrl+9wr5iADhUzCjpIcbR5eH+qmg4ttsc/wQk7zX3eNu71yNKBTqGCSOkdg2Zs16rhwnChGb5knLOakOyjSAasoUUY6UHRvVHAYxIa57iTKi2nQRUEcbBNT1eEPEQh8NS1EjQeJs/P32yp63Wo9DP3zPjTJuCvYDa7QThk+nCuxeLSyHe1d9o3UPpYodTLk40kxgt/QmMS/H/1t9i6JndBmkfo3yYBlnSfn4FBrdo+w2Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM5PR11MB1372.namprd11.prod.outlook.com (2603:10b6:3:11::14) by
 DM6PR11MB3034.namprd11.prod.outlook.com (2603:10b6:5:65::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12; Wed, 3 Aug 2022 08:59:45 +0000
Received: from DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507]) by DM5PR11MB1372.namprd11.prod.outlook.com
 ([fe80::bc9e:4951:a404:5507%3]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 08:59:45 +0000
From: "Piorkowski, Piotr" <piotr.piorkowski@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/2] drm/i915: Use of BARs names instead of numbers
Date: Wed, 3 Aug 2022 10:58:28 +0200
Message-ID: <20220803085829.1466903-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220803075549.1464461-1-piotr.piorkowski@intel.com>
References: <20220803075549.1464461-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0106.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::7) To DM5PR11MB1372.namprd11.prod.outlook.com
 (2603:10b6:3:11::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74a272bc-aab2-48f2-c835-08da752e82ba
X-MS-TrafficTypeDiagnostic: DM6PR11MB3034:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mE0YIvwxexFk4QL8Sr23bfcC8D5Mb1GNlD8m8nIu6IaYZQwiCDHYkt6wcO5l7GSIVsomPNesvurhQftHDSYlfOkS/XffMEe1CfVDOLs6NrA0WL3Q03M7xCxeygnqvY9LDut9LGNsyWF1ZJ32WAkYev2bn772nRchuPm54lWinpSO/mdoE61/hoMKXOUkaE+LyvqZ0RYIepj/wyOCw6pjvfcXz2EfZNON76t8vExmt+lSBCc7grkgBEyAqeWRdKd9Mkn2vl+FizSOVlOIBUXhlpUS37Ef2UJwmj5YFDc7v7KtDJav3t8rPW5ORpFZnTM/wfy35R0VN1v9xfWqqFXVxuAJRD6bb6sUrWx/GQt3DfDsbk8l1pl43xauRRwSTOfJYl/Y9FKnSel65ZOUDMLjsiRpi4H57MMcDcg+F6oLJLn7HhQbvhkm3Td1Lb18YxZJQA/QimYmxzBOilhXHh1W6r2iqtevILleBLjrdb1+tZ/T8alfoJHWLrqR4ewJJM8OcHbrXWk5iGddayPJu3TN4voHJvWpQI3Rfl4KGIlg4mlFKQ6n5gOCM/RRiGXCZyYDOYlg+60mucecZUnX1F7li7GJ5Za+71F5RskBaUW4PcaPyen3FAy3oOw9pfmvfl/F46qKoJu0AzUnuyLN73epm6YyzeMrEKY+YvNz8qieb+cRaYNgFtSaOrAWM2ilIx3G19mJhM2b9JspPvRF4NbuDE2aOCVrtcrL9TlM892Qog3x/0RcaXZadg5sukS7R8iK
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1372.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(376002)(39860400002)(366004)(346002)(136003)(66574015)(8676002)(36756003)(1076003)(2616005)(26005)(6512007)(186003)(41300700001)(6666004)(6506007)(38100700002)(83380400001)(478600001)(2906002)(86362001)(5660300002)(6486002)(54906003)(82960400001)(316002)(4326008)(66946007)(8936002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aU1SbUJTMTZkb0VSMHY5azgzTDBCVGowcTJsTDRqV084b05hR3lNNmdrV1lt?=
 =?utf-8?B?WkF1N1Bpb25Ka2MxSzQ3RG95VmZmeVY5dWhkV0pXS2hISEx0N0RkckYvQS8y?=
 =?utf-8?B?TUd6bXNWQ2lVNUUxOUIwNVhHVzdwQ09MUkpSVXp3VnRteVljK01WYlgrNU5k?=
 =?utf-8?B?NXFEc2NlMGp0VnhydU9pQmUzWHVub2hLbmxmL3hIWmJaejZuUWM2RVdadXdN?=
 =?utf-8?B?SnNBVllBK1NqVUxsdENjZlZHdjNtQmI0QXZKdmpLL08wS2xHUU81SkhoWng1?=
 =?utf-8?B?RHJEUkIvcGRlY2h6aGxMdllhSzJHZk9meldsdDhHTW1QZXNUV0c4TnVlTVZh?=
 =?utf-8?B?dmJ3WWY1Z1FTamZKTVA4YTMvYiszdGFlb3dXZmNqa0Y0TUJ5YWFaaXN2elFE?=
 =?utf-8?B?Z1VzdGY2eitzTEpSbXVkN2J4WitiVGhlM2pvYzhPSmR4RFRWVE1wOEZwRjRP?=
 =?utf-8?B?YVgrcGVxbUkzcWN2ZEU4ZlovWUVSbHFtRm8yb0JNR2Y0bzhDQ3NLYkF6K0tY?=
 =?utf-8?B?amd3bnpnbFprclhkMGRiVnNlNk1HSGJkNDBCMzNsMHhvZmJRM1YzVzZZTVF0?=
 =?utf-8?B?cE43Wkw5V2ZQTTFucFFoSjFQdk9yMmVydkx4TlhMOUxJSm9tbTVZWnRTR25O?=
 =?utf-8?B?Rmxnc1lyL3Ezb0ZSSlh1OHc3Znhsc2oxVzFmQWQ3eHBHckM5Y00wNWZVMVhx?=
 =?utf-8?B?SXJBcU9GY2ZvMldhVVJMUlBGUUJKSmhjeWFOWjFhU25HR2hRczJnOHFXcnQy?=
 =?utf-8?B?aTczckFhVVZVakVzY1o2cEdqVmtWY2U0NDdEWTNHZVR6Q0JGZnpCTjBaNkxs?=
 =?utf-8?B?b0JZREl6MVFJUmRUcm1mSFZZRStSTFZwR3BaQmJ3YWpCcUg3SVhWeEN5Q3ll?=
 =?utf-8?B?ZWpPSmlTRjBMRW0wTUREbS94ekVDcGNybzBPbnpqMC9aSjBCMU5PS2htcm94?=
 =?utf-8?B?YjEzWmdxZWM4bFJxTTc5bkRZeStyZnBvb0tlQ3NYVWtTWnRCdnordUNIS3k2?=
 =?utf-8?B?K3gzcHZ5aTN3a09lRzZncHNCRDd2N093NDErdTBiK1ZmQVBFNEdJNERKUFA3?=
 =?utf-8?B?YVE3NStrckZtU0Q4VElsVlAvSWlrR2xJNUxmdUZwL0l4UlcxemUwcHNFY3Y3?=
 =?utf-8?B?K0gxNVZ4Q2Rxd0RSSytQa01DZFVaVlo2bG4vOERBVkRFdmtaZXRESnl1OUxU?=
 =?utf-8?B?TDNERDBEMWo2c1FuNGYzeGwxK0d3OFY4T2w4VkxLaE9DU0pRTnBiaUpxVGkw?=
 =?utf-8?B?akxLQnY1WjVDVjlqWkVsSGpHemlGZVBZMUV4cnVBYXpzRW5KbmZYNlpvTnB3?=
 =?utf-8?B?bm9KOUlyeDJraWJpemhGejVray9WSkdoTVQ2KzZhcnIveFV6dXpzbGFDWjhk?=
 =?utf-8?B?QXRsMXIzNVVYd2FPdGRpM3QwQ2gwY0Y0MVpkZXRYaG9yaXJEY2YrRGhQcHhj?=
 =?utf-8?B?ZGI2NG5iOG93K0VoVFk1ekJLOW1oVll2bVc5V21PQ0hrQ1pxc1RGVXlaMWwz?=
 =?utf-8?B?K1kxZFBXNHQ4SWxpNVdCei9qM1Y2aDA4RndkM3FLZVlYaXNNVG50UjA2RU5P?=
 =?utf-8?B?Z3ZPUC9vOURwdWN5RkNiTlg1Z2ZYeTBkWjgrK2V0SFZ2Nyt5ajNUUjk2RHM4?=
 =?utf-8?B?TlVHbHFocWVLd2dOWlMxcm9JOVJMOWVxSmFqb0xaT2ZsOGNnRnVLQlp4cnJK?=
 =?utf-8?B?YjNxRGVncVB4RUw1aElqb0N1VG5wQkVueW4rOXdzWTBMQ3E3V3FORTVaWDZH?=
 =?utf-8?B?YTJoVjNrYlU1NERraFptaytuYlZBZzNFdnd3TmRjNUVRREVCSmx5bjJTYmF6?=
 =?utf-8?B?NVhwNXY4Rkxhd2FIcDN0c0F6bks3S0JSNjJNcjExeFprcXp4b1Z1Z1EybU5N?=
 =?utf-8?B?blJjcjdXTjkraW9iMmFGbnpZYmptSndhbnVwUGRPb2JKMHFrNUh5N3ExMm8w?=
 =?utf-8?B?UXhDdmVmcmlrdHBMNGhNc0JpZzRvd2FoQXowQUVjbkhLa0FNV09ERG83VTZq?=
 =?utf-8?B?cFV6MVhoYVNEMzRJVllaS1Vlc0pyMWk2R2xJZ2xlVUs0QWtiajhuOERYWWhz?=
 =?utf-8?B?UnNOeEM2Z3ZtVEh4K2RuWWlYdFlWbkFwVXhPRm9EcWJyUmg3RUFjaUR3QVAy?=
 =?utf-8?B?aG1HZnpRUCtjUnRQc3J1cEovb0xVSnovTHJ3SVg1RXNpYTZxYWRVUmJoTDV0?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a272bc-aab2-48f2-c835-08da752e82ba
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1372.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 08:59:45.0914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MilpmEDnZJPDVhg5X5+v6y5N38WRpAbKKwqVrK9CCumBhdb09Jp0VCGCIJQ0LB+Sij+Wlj7ydGO7+SVGY60DxWSLzMccphenc37a34n0T5U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3034
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

v2: Add lost header in cfg_space.c

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

