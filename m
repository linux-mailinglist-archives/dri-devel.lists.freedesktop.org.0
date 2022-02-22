Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0F14BFB2B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 15:51:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842FC10E812;
	Tue, 22 Feb 2022 14:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A109E10E808;
 Tue, 22 Feb 2022 14:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645541476; x=1677077476;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ROh3HGh00QCGaRPxIqNwNICg9u5t4xM7HsatGcTP0vY=;
 b=WlRBqfmZjaVEWzYhbS2t6vW/ZLGxZjaq9GGQvYByVGAlMcbRsbTjVMXB
 n96B0T7kBBDzvuN2X/YRPaKosczJlbjVjyn1N4IiUSPJeF5Ul9WPdE7n4
 Ny0/B+dPQPDVG5w/RUKVcVZaBwqiW4aGk4MEC1NEUjNGxFFi3GbY0jdhy
 F3mxykugnTOmAGGEHDo09/dgu9gNX/ZCJ4mzX5Qbmxmi8xBv5zNxtbTQJ
 /WKiFzIan5lL4g+AJjejUt2uqhe/ELkLvLtXd2/tgEfvTtoKMphx9k4ES
 07mmSO706EOlr+1oj5uvsqdiw5Z+K/zS1jyUGjiIjU1GCgTyDpgxoMNgu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="251907049"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="251907049"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 06:51:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="573453787"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 22 Feb 2022 06:51:15 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Tue, 22 Feb 2022 06:51:14 -0800
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 06:51:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 06:51:14 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.106)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 06:51:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ilYuo53HtPfWfuRLivdmX11YG9MzsozJN1BkpLnUQY4lH8EWqerzexT/dz2yoYKD2W7PoyWg8YcriOyOzGU1IL8tz/8UWqvFVo/jNA7kDzWhNdlW6lIG95ecoA4qIW9ddL+nLVklBdaG964S0QjqOnoQmk8Y/r+GocKMI9FklNge4x/lareyJGz8k39sCHrtqGQNZ4FaRvP3SI6W5yXVG99hKGk2alOC+XQ03ZocGa/09w3Zcpq0bkRwRS9+GdCtU2InvY3V1MuDpdEMhAWVF7lHdudlNCX0W1IOGpUE8zSUbRMzwy+LDLMEVudVrqFS67h96rlsLiDXPGXxJprTag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QkJyr2r6/RAzTzoHryd1ZoV46DxKDp09E/+h5Jq+7a8=;
 b=GRmyG2pG+n59pi3EUhuMq0nDtNs2rdFLbU3ruuww9m/3uUdTrWQ7rWpl0hhXtxv/rlELcWnyZwnkhSAFcSQvJ88LIShKFzz4m5DuPzI7gViKP0MumtP9x9LuKbBZRbzL7bxUnXmyytxgY7bezCvQgz6MAcfsJ7XuV6rzN/ZHokflYJbbzH1eGdrVW9WDNaWBw+PsbyxX/PTZJn3C+nCSIQaODBwCI/CtNwy72XQ3LB/b3pzJ3eCn5K6kpeCW7OFwxcL7KZpllyVmN95sRQaLBD4TXH3tPhsHYanyvlDiqaT1V+oxjtDUElXM/B7uePEl4DHhoJNNKsGhLd/v6fFeRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by PH0PR11MB5627.namprd11.prod.outlook.com (2603:10b6:510:e4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.22; Tue, 22 Feb
 2022 14:51:12 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%9]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 14:51:12 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/7] drm: Relax alignment constraint for destination address
Date: Tue, 22 Feb 2022 20:22:00 +0530
Message-ID: <20220222145206.76118-2-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BMXPR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:54::18) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52556341-36a8-4d91-8960-08d9f612c4ce
X-MS-TrafficTypeDiagnostic: PH0PR11MB5627:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <PH0PR11MB5627F8D3F7BA30D219653E469F3B9@PH0PR11MB5627.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6bM3ld4dWTvQGDutyF1qoP8dKeUxw4dGjjLLagNkZ7ftEncVDzXC4Way3NOvTXI4HCqbvONf4SyuXLLm+dHlWQEDXujX6sQ+EqgTGB9QvdCP8y1StuFcyfBLDiFUZ+Lou+6SqX8vl5DV0NjwS+cTb+rOMgouMKWa5HBsp6qztqK8HgvIH4M2TtIXFmdyVFFhyIvbJDNcsVnqN6x2R3s+0fiPpfcsitH2ya5pHKJo4fW2d4mrbX7ArPPEJLER4aIU8+wmTbmfGtSTuJfBoiSXWuOwxPrmQGA3ZN5ZSnihY2xAhDJ6ss4Acu3umSNpKJ4DKfJc9GixXNoGH7Z/FidxKURMqxeBm7W8JRn2uXO/ss76DA2V+SUKyvHcp2oclPufm8kO6+9soWkN23mOVZDE+4BV21oBfxTByAg+4h3+vUhFz48DBao5mnI5maky7XnW8KrG4ruMPFqCZKrsNbQdAVz/EwYYxNeXJkgjQHqpiQtBP6rwQaAGpsKQKQN3diYOSMZbpRqgPExFNCAhjoHmmWt+9F1p1zLRc/q9lzOYg739XHAYBcF45+FNSWc3yoyUo19KudqLQM2J85XsrL9FrwhWKjvLOrODCcTblxTFNRiO5XlOeWBa4Y1DCMuDOl7UKqMFsMqWkTV/oZDEx12eMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(86362001)(82960400001)(38100700002)(316002)(66946007)(66556008)(66476007)(4326008)(8676002)(54906003)(8936002)(44832011)(5660300002)(2906002)(2616005)(36756003)(186003)(26005)(1076003)(83380400001)(6666004)(6486002)(508600001)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/pwr757P9nBOlOoctbUVuyYAu4uLzRHvl5OQSYuI4LErL7PJjhW5yJzRHRuY?=
 =?us-ascii?Q?PuwB6bstORiBY2FI9Mr9pxgtMpm1LHoJZmP34DLC0pRvPHp6HmhZtq4sO4th?=
 =?us-ascii?Q?6oRz3cv2npG4Y6rKsJDTTAb3qN3pqWSkYn2aykKahd67NLWsLiK30W+549/j?=
 =?us-ascii?Q?RXVvVKk5rucU8OrK26XCR5+2Gl218vhfyYI3DV/XJmc2QRlIEORhrBrKAwQH?=
 =?us-ascii?Q?7pb9AB10iTY+d4sTJ6jI/sHUW+4QLeE91SLVe/x3ldO56KsiARFk6MURkJI6?=
 =?us-ascii?Q?uTbpC7qA+9DcVfZrheSJUe39lgNTKq0kEI4E5+evwBG3nipJAhnKaGh8U2Y9?=
 =?us-ascii?Q?Y91kkm9crq7qaUYatUvF2Y5fK9/YsxNgdPiGmR/Xr5xpLiK1qwKk0kuUoEHm?=
 =?us-ascii?Q?Tg8+vitubGGr8dR36Kic3qo7rlQ0OEezoDRqnQViH13g8coqKiTExxBiy+pc?=
 =?us-ascii?Q?ZwWKc7qE/dM+sn48cDlBTAkeQzmBoZCNnZISALwCY6Q+GDqccmxOJRY0w46p?=
 =?us-ascii?Q?9/7qUMPuh/oaqdHGolgEvW0JXua7sJuRREO64lTME97dhK4weHxVVX0tGcJM?=
 =?us-ascii?Q?33ZMgY2cRDaKEtUFV/3nbenlZdUl1P1I+dKcXQ2VQgTzZgP39stJY2JuWg9J?=
 =?us-ascii?Q?+xQcsRMSpguyyZiC/DOZ2PG9hR45OUCi0VORT5oE8SVEd0NyQf/GKiC42NJL?=
 =?us-ascii?Q?nUt/K6AsDg03Nno6bDzJnrMQRQi7M7MABHwoPaQYqDDBv5uKiys6/sAIlMgX?=
 =?us-ascii?Q?GYHSSMsfmddyqKI7HCSqx2TI6BYBcVV4+2SSPcDHW47pyvHSdKu47qLb3QrM?=
 =?us-ascii?Q?USzL4dgO+9plXP9yVpQNwif+mw75QNmmK54FN+jduXH2AxSm3420Ia5yIz8M?=
 =?us-ascii?Q?+c1KQ1NELKqopNIPfXTT6P7ks8v+UCq65LGdSRp2kSLM2y/cdzCoKyyAwdi1?=
 =?us-ascii?Q?rMxFbMB2ltXii6fR5WN1729urp7LMEf3BP886cy1bB4wjDlBqeeBiejl83Hw?=
 =?us-ascii?Q?w12wMfUVZHGhUxf1xy9vANReyib2CAG1a1TK/3Vyg0WAFDDHwZ/22dJoYBIH?=
 =?us-ascii?Q?He4SksYNAkLdTUA6jK2tJ+mAl9Qd9JYZ1GUQXcWsryzNADLSdrlOm25ND/gC?=
 =?us-ascii?Q?N4CiQ3feO2rtXVJ77LG93LmMStEHCto+0nfbarQI0fZgothTwvJFTaQy59gO?=
 =?us-ascii?Q?BzO5KNX81C52QPROHyueSNrND//OMpQSBd3La6b3OCL48yg0W7jJmbu6bPoS?=
 =?us-ascii?Q?oeMDq8kMKT8b1dtMGEWjhcHCt3TO0SfNMgmaSMiO7mdlnqd0QmxCjFLUY8aG?=
 =?us-ascii?Q?gIvUeI3/pKOIJaHZLj7WbosxoMk54vivpF3k1w6Ots/3Mh+iP9QMmg/kJbEb?=
 =?us-ascii?Q?fPYO1kgCiTJXewJCNW1qHNkI5JvOSRGG2Sw/oedl6MybzwhuU7EVRVubinTs?=
 =?us-ascii?Q?cwkvvvvemP3BjjRZfrLWOoYC8C1AkmHi+XVI7zm3Ek/d1LBYS/nmRXyReiQ7?=
 =?us-ascii?Q?mve1wsb9ccFQJEUDOCrJBBdWs3manfPSbXPmWu7qNLBvONVOB/yK9pU77fKt?=
 =?us-ascii?Q?Mq8ixNh7Dmz0B6O4sAer+Cme12EdO0EeL1hPuJYq6Y7LSqZKu2W0Aj5ge1Ta?=
 =?us-ascii?Q?tWDqTX8l070THC9sXPw5N9a1BZJxwut5dxACnabON1OSOMqwse/luS0WGsL+?=
 =?us-ascii?Q?vYTlm31PGxxD7oxfM0DvL/1IaHuTWX48q2Lmw7BIejinMYHid9wfvI4W8t5v?=
 =?us-ascii?Q?hf6fIlsM6A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 52556341-36a8-4d91-8960-08d9f612c4ce
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 14:51:12.2443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CRUMLq2XNr9uLUtiE6EHWm/8Zy9NOwOaitr3uC7Ava6rh2gF07Ix0Ivuu6PrFPr0enIAv1spwL2ouYBDl5hptKH4WOjaU1bWpv8pMnAXbnMBBj4fQEdUjdiCEwq/3dSi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5627
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
Cc: michael.cheng@intel.com,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 wayne.boyer@intel.com, David Airlie <airlied@linux.ie>,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com, siva.mullati@intel.com,
 Chris Wilson <chris.p.wilson@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is no need for the destination address to be aligned to 16 byte
boundary to be able to use the non-temporal instructions while copying.
Non-temporal instructions are used only for loading from the source
address which has alignment constraints.
We only need to take care of using the right instructions, based on
whether destination address is aligned or not, while storing the data to
the destination address.

__memcpy_ntdqu is copied from i915/i915_memcpy.c

Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Chris Wilson <chris.p.wilson@intel.com>

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/drm_cache.c | 44 ++++++++++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_cache.c b/drivers/gpu/drm/drm_cache.c
index c3e6e615bf09..a21c1350eb09 100644
--- a/drivers/gpu/drm/drm_cache.c
+++ b/drivers/gpu/drm/drm_cache.c
@@ -278,18 +278,50 @@ static void __memcpy_ntdqa(void *dst, const void *src, unsigned long len)
 	kernel_fpu_end();
 }
 
+static void __memcpy_ntdqu(void *dst, const void *src, unsigned long len)
+{
+	kernel_fpu_begin();
+
+	while (len >= 4) {
+		asm("movntdqa   (%0), %%xmm0\n"
+		    "movntdqa 16(%0), %%xmm1\n"
+		    "movntdqa 32(%0), %%xmm2\n"
+		    "movntdqa 48(%0), %%xmm3\n"
+		    "movups %%xmm0,   (%1)\n"
+		    "movups %%xmm1, 16(%1)\n"
+		    "movups %%xmm2, 32(%1)\n"
+		    "movups %%xmm3, 48(%1)\n"
+		    :: "r" (src), "r" (dst) : "memory");
+		src += 64;
+		dst += 64;
+		len -= 4;
+	}
+	while (len--) {
+		asm("movntdqa (%0), %%xmm0\n"
+		    "movups %%xmm0, (%1)\n"
+		    :: "r" (src), "r" (dst) : "memory");
+		src += 16;
+		dst += 16;
+	}
+
+	kernel_fpu_end();
+}
+
 /*
  * __drm_memcpy_from_wc copies @len bytes from @src to @dst using
- * non-temporal instructions where available. Note that all arguments
- * (@src, @dst) must be aligned to 16 bytes and @len must be a multiple
- * of 16.
+ * non-temporal instructions where available. Note that @src must be aligned to
+ * 16 bytes and @len must be a multiple of 16.
  */
 static void __drm_memcpy_from_wc(void *dst, const void *src, unsigned long len)
 {
-	if (unlikely(((unsigned long)dst | (unsigned long)src | len) & 15))
+	if (unlikely(((unsigned long)src | len) & 15)) {
 		memcpy(dst, src, len);
-	else if (likely(len))
-		__memcpy_ntdqa(dst, src, len >> 4);
+	} else if (likely(len)) {
+		if (IS_ALIGNED((unsigned long)dst, 16))
+			__memcpy_ntdqa(dst, src, len >> 4);
+		else
+			__memcpy_ntdqu(dst, src, len >> 4);
+	}
 }
 
 /**
-- 
2.25.1

