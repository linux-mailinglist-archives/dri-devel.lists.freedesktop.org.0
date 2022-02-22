Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1A14BFB37
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 15:52:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C0210E883;
	Tue, 22 Feb 2022 14:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFE4B10E8DA;
 Tue, 22 Feb 2022 14:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645541517; x=1677077517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=XuACy3dh4LXalFHQsmoyfA/3HxkUIuEncSlter9HMdg=;
 b=egrrLgGhy9Uyj17bJ7v9Lkjs04zFACaDrgkAMDL5k+0jUs96o/6gvliI
 gdwmzJvfWQD0Hgwg1arVi7xFyYl5ZYDcApu6ooYUzEfYrwtSY7w0+ojPu
 6fkusxmoI7bOxw81rEsY9gsL7zf9/mVG+EE/kdf0IV9PDdD9FziCFbN7q
 olHHdYc7M4939xwAHHue5iGsAtuKArtItu5s7uw48TRYxwGpuSLyLuHNC
 fXqNwkJvnwZ9q0NEB758Umvnvw0U7idnrWJx5LvgLgkT4xLwoBIEzAp+7
 D/qVty0DjpVT7GRZFVMc/hF/J1AbAqWLZ4PDzWvLjmcsYlXT5suI+U4TZ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="338153205"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="338153205"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 06:51:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="683541140"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by fmsmga001.fm.intel.com with ESMTP; 22 Feb 2022 06:51:57 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 22 Feb 2022 06:51:57 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20 via Frontend Transport; Tue, 22 Feb 2022 06:51:57 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.109)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.20; Tue, 22 Feb 2022 06:51:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jz3V7K03eyDjL/V1MinSaVoeQQDnMN4lW+wRZF+5GMnWhRH3ZaGaB6EunS5a0Bh5riVmqUzjvQGMBKy5ljHs/Dk7Hlx7/8zRH5/4I2MLqIgFWJH+HMZng6NxetwreP8uoAq4QKADVhbDtKAJ08dT7WJRgQ7J2QfdrDKY/24DHKdlAlibTQdoptvQAvSQiYcQVQtZbZUx7zu104SSzQyh7+ebb18p4Q6/kaQOLbkUd3tGv3P8nF3UkAe6bQ5ALINU7kP0tD575JVDSK4NOXb4KvPixXGw/wGkb//zEGkt5FP6AZ+4dS0g+npigImR5Y2wivTBNM3b9MS2bdGsYn4VMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yi4z+uAe9t/1S1OUBMjXcaY8sZ5dKyGDNhqsy+3v7m4=;
 b=Hodb4VpBc7J+NN2a6yR9GwmJ2tgcHSu038slMI5HuMrL1IcJ/GGsPLO9V5CaO10xUJI40HqC2lWwdInrjc29qKfzdCo41pXrOddtlmOCNW722uiaJIzXgCh2hoE7z22cKc1hYOPVSD4t6phQ7LGCbLxr+9TXvzWMhmF5LR/KD1lYuGRnlZPyN0ukovV8niFg3SOEJqrF3iGwxtjFAmc47mYu5iL2RJoqHeWpKqiMAbFoqPZPSSirGpPFzc6Ki+kg4gU1a8Xb4ORYaGgZx1Iv0ovdwCiG7Qm61gZ829osdqOyTrtDSLGZk6sUmXBmd+DxvK6nl9BEfu7qrhjAH3q10g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5)
 by BYAPR11MB3221.namprd11.prod.outlook.com (2603:10b6:a03:1c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.21; Tue, 22 Feb
 2022 14:51:55 +0000
Received: from SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475]) by SJ0PR11MB4894.namprd11.prod.outlook.com
 ([fe80::d67:8a16:f4cd:b475%9]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 14:51:55 +0000
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/7] drm/i915/gt: Avoid direct dereferencing of io memory
Date: Tue, 22 Feb 2022 20:22:05 +0530
Message-ID: <20220222145206.76118-7-balasubramani.vivekanandan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
References: <20220222145206.76118-1-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BM1PR01CA0080.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:1::20) To SJ0PR11MB4894.namprd11.prod.outlook.com
 (2603:10b6:a03:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 385c5e73-0916-4e1a-4706-08d9f612de62
X-MS-TrafficTypeDiagnostic: BYAPR11MB3221:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-Microsoft-Antispam-PRVS: <BYAPR11MB322102F68129F32CA8891C7B9F3B9@BYAPR11MB3221.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AKwTa0wQT5gw5pBhvxskPt1JdPuw73ET7Z2dujUT5kEodZvrmC6cQ3Tk2fcHKkmLBcxPgzJGSIV1l1c694ZvOi91bmRPvxbGvih3tgpaoNeQXHot+Da62FGUWjbVfvBbK4tMoVRwMOCEo4pNVlcsDRDYeATGQbDeWyPog7Pv99bhdN96mHWpMjo41DL2d98IrJf3JqfIQv7IBRfjMufMw16mg3IVhTi/v7JHe0w0e0/OgsCBaQvviHt7MH/kLQWlf2E++lTeua4tcsfVNK6Z/nY97wVi4r+N7WZzqoBlNzVf7fp9q6yiV76Oslb7BfLB8Hqvq9o0JQuLf77t6a7ZdlKGabLBPHloa1THPjmQh0qrUeJCkedNP6HSbWHlLUGbv4xOmxjV7dDtS7Vd2xZo5/v45/siVaWv+9bZHx2QAfuZg7WqaTgTVhVp/uDS8jsaoxnR/55e7eEQadaeLvWY+IcYnceea+CShmiyFVNMAuxJtqj8Mk/NrxzF9Mktve4Fex9PImawNaaz/q0Xb731wtcyw5Ajjpc88F35CwRFjcPfxiGbpAC+ZCbISwj1TQ6zsRDsqkK/e9/q+f7CKb0Fs2/23wnrZcte4BbA1BhbDLln+L2TTKnxf3vt8FpbrBb1putT350Hf5Hns+Y4nr0A4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4894.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(6486002)(2616005)(316002)(66946007)(54906003)(83380400001)(4326008)(450100002)(8676002)(186003)(1076003)(66476007)(38100700002)(66556008)(26005)(6666004)(6512007)(6506007)(82960400001)(5660300002)(44832011)(8936002)(36756003)(2906002)(508600001)(86362001)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eHBIdHkyVTN6VThURStqR1lBdmhtZkZhWEJ0b21jZkM2ZFpBd1huL3gwSUg5?=
 =?utf-8?B?c0hGUkVBMXljYXFONlp6ZEczUnZXR3YvazhOaDFjQ0RoNkxEOHZpWEVTTWFJ?=
 =?utf-8?B?RjdkVjdteUZiSkRuUEVBR2tWM3EyR0pDeHRhcUwvVEpLeFpvUjQzUFVJQlFw?=
 =?utf-8?B?TDNLOEMyWXpBbTBPZHh0TG9wR2VlUmFoaG5PSlp0Ym5KVUkzWjlpY1ZOeGRQ?=
 =?utf-8?B?QlZtMDUycWhwM3NxMjlDWVE3RkFzZTlvWmVXS2JhZ1NxcHlUeDFtakhRYm52?=
 =?utf-8?B?ZC9PbEtuWUdtRjNkYWtia3VEcnNBVGlNYlpOMk1RNTlOVVN2cDFJVlp3NFNQ?=
 =?utf-8?B?YkVJaUExV2swZC9ybC80akh0SUM2QmllVWw5QUNtUDF4b2Z0N1MzREJZd2lT?=
 =?utf-8?B?RlJUTUp5cXRDNy9JUnh0VDN5VXVmcWZva2VjclBrdkN3SVAvemxCVFRBMHJj?=
 =?utf-8?B?YkhLS3BGbmpZbmtTU1U4U3k0bXhwNis1dlNpaUVRai9zd3NKeFh3RnNJS2ds?=
 =?utf-8?B?TjZ0VVVkcW1VT3JhNTZkelM5L1NnNUNtejBkVnY5T0M2aFlYa0JPQXI2NTZx?=
 =?utf-8?B?eTZaM2t0TWV3c2lsbFl4UHdjMVh1dlpzeEtRZU13K0crL2tFZmQ3MWtBNU5F?=
 =?utf-8?B?OVJmMEx2MFc1RGdIUXA2MldYNlhDcVJxVjlrTnhIY3B6cVNOSFE5d2d4c3FL?=
 =?utf-8?B?NnpMSytiSHBiVHphdVlVc3Z2ZmJBT3REVVZJK0U1dVBETVVyU2h1U3ZjaFln?=
 =?utf-8?B?WVdZTlBFb0ZQM3Vtb1J3Zkh1MTZBeFljTHVPMHcwbmViUTFnQUd5dkFrRTJH?=
 =?utf-8?B?N0tVZWFHSUphWjR6VllGRFNDQlE5dWlXbGtMM2tZaWV3Qy8wY0k5ayt6aC80?=
 =?utf-8?B?a3RZUzNMVXNHeTB5aEJ1dlZ2MXdRNVNRTU5xV0ZvcjhlS0hPVWU0bDNHL0Rq?=
 =?utf-8?B?eGNnRXhFYW1aMzNZSnVtbU5XMCt4WUVLM2FnazBPWDYrcUVqNWVlMUhOUmhE?=
 =?utf-8?B?R1kyODJkYjZmUnJNcDZlaU1CMjZJa1ZQNUlMMlNLYUJXdnF3cFk0UE5rTC9l?=
 =?utf-8?B?dUZ3WVBHbGordWpXY3lZbEpuSHRTNUJZMDFqcXRZZjRNS1pJcjV5ZVVSdkFD?=
 =?utf-8?B?ellEK0p5VGFEcHFBNEc3VTNGQ0k0dmoyUmdnUitrME9DNEdwb0docEFiMUNM?=
 =?utf-8?B?RStqbFhQc2F0NkMvNmd5N2pmUWxNc2FidlBjZDFLQlVUVGNzcVVqTUJsWldj?=
 =?utf-8?B?ckZEMjVQOWZ0THhLclRMZkhDZWtxRC9WQW1XVGVKS1V1emNJQ1NTdlZway8y?=
 =?utf-8?B?dGdNN25iL2U2ZXZOTURUcEFjaXVUQWN6RWpqRDhyaTZKUDBoNklqbzNYZmtJ?=
 =?utf-8?B?TUttQzZqQ283R3l3U01MRGMwOHFvYnpaSjJ2cEdPT29aQVN1VFFMTTBsNk4z?=
 =?utf-8?B?MS9FQ0xaL0lMQXNpcmd3NmFzaGR2cHc3SG43QVVCZzN4UDdmUnR4RWptbG5Y?=
 =?utf-8?B?a0VQNDJxSCtFU1lENHA1MnRZWllWVmZPS2dGeW1zSEZDVjBHeTM4cEorK1ho?=
 =?utf-8?B?QXljWEpXOWo2MHhUTGk1dlNOMmF5L2xjMkc2dFFaMkRTTjc4YkZpdndRbk5Y?=
 =?utf-8?B?MERvUmNDQlkvTW5tbG1PUlprVEtoU1FENHlSU0ZlMzFOTm83ekdqS3VYZjRk?=
 =?utf-8?B?a2MzbnpoeGdXY2l4T096Q0hmYzZIS0hFQjA0VWlyNlFwUHVnb1JJQVBYdExC?=
 =?utf-8?B?RktMY0V1Vks2VlNpVkpJKzR1Q2pCWTVld1dybkNCSzgxU3RSazdsc1JLTFgw?=
 =?utf-8?B?QlJDcFBKVCt5RXQ2RDF5ajRJV3NjSDk0WllWem0xV2VMSW13WFpPZlRnSEhR?=
 =?utf-8?B?OGphcGh5MDZMakZWa3RVZHNDdWp3OGhkdHBRSXNJVTJCK3VkRTlUbm0zajVO?=
 =?utf-8?B?NEV4UXRaZFhwSXRPRHJBUnBOY0p4akJsUnRaaXgrU2x1dW4vMUxXMllqdVo0?=
 =?utf-8?B?bGVoTEQrOXFjL20zLzBDNXV4TTNsaU5XakF5b3NkTVBHTi9zTk1jUzd1V0Vx?=
 =?utf-8?B?Z0hxUlZFeElDaXM4b2VSM2hoaWwrVElZc3dweWI3YmZ3V3VyWXBJcTY5c2xB?=
 =?utf-8?B?R1hLRTJncVh2aktzbERrdWdVUEFtZURYNXNXeVo0K0ZURGlBeEptYVM3d3VK?=
 =?utf-8?B?Z08yaXZiR1JxSHhsNy9aR0NRRGRMaDhLMFhMTWpIOENmM2lXQmZNU0dxcVRz?=
 =?utf-8?B?YWNUZllxa25NdWtnejRGaEJLUFVHT25TUngwQkVwOUV6emJTS3I4TlBSdmlD?=
 =?utf-8?B?eHpIYkhheGdQRUd4ZFZrNFVVMk13TkQ3VXN5Wm0rTzlFRFMzUXNJUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 385c5e73-0916-4e1a-4706-08d9f612de62
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4894.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 14:51:55.1400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ikRinPxjPGlrmIKc0uz6LUa4L45bPJKFkRVL8rCw0Dv9zghMh/TgSnoAQTo3oUNoRbrGaALoQgZmEYNtcQ5xYUAW/EHToyucizanNrGDWBS6jmmCB6Xc38Gn5uhPngFW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3221
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
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 siva.mullati@intel.com,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

io mapped memory should not be directly dereferenced to ensure
portability. io memory should be read/written/copied using helper
functions.
i915_memcpy_from_wc() function was used to copy the data from io memory to
a temporary buffer and pointer to the temporary buffer was passed to CRC
calculation function.
But i915_memcpy_from_wc() only does a copy if the platform supports fast
copy using non-temporal instructions. Otherwise the pointer to io memory
was passed for CRC calculation. CRC function will directly dereference
io memory and would not work properly on non-x86 platforms.
To make it portable, it should be ensured always temporary buffer is
used for CRC and not io memory.
drm_memcpy_from_wc_vaddr() is now used for copying instead of
i915_memcpy_from_wc() for 2 reasons.
- i915_memcpy_from_wc() will be deprecated.
- drm_memcpy_from_wc_vaddr() will not fail if the fast copy is not
supported but uses memcpy_fromio as fallback for copying.

Cc: Matthew Brost <matthew.brost@intel.com
Cc: Michał Winiarski <michal.winiarski@intel.com>

Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_reset.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_reset.c b/drivers/gpu/drm/i915/gt/selftest_reset.c
index 37c38bdd5f47..79d2bd7ef3b9 100644
--- a/drivers/gpu/drm/i915/gt/selftest_reset.c
+++ b/drivers/gpu/drm/i915/gt/selftest_reset.c
@@ -3,6 +3,7 @@
  * Copyright © 2018 Intel Corporation
  */
 
+#include <drm/drm_cache.h>
 #include <linux/crc32.h>
 
 #include "gem/i915_gem_stolen.h"
@@ -82,7 +83,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	for (page = 0; page < num_pages; page++) {
 		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
 		void __iomem *s;
-		void *in;
+		struct iosys_map src_map;
 
 		ggtt->vm.insert_page(&ggtt->vm, dma,
 				     ggtt->error_capture.start,
@@ -98,10 +99,9 @@ __igt_reset_stolen(struct intel_gt *gt,
 					     ((page + 1) << PAGE_SHIFT) - 1))
 			memset_io(s, STACK_MAGIC, PAGE_SIZE);
 
-		in = (void __force *)s;
-		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
-			in = tmp;
-		crc[page] = crc32_le(0, in, PAGE_SIZE);
+		iosys_map_set_vaddr_iomem(&src_map, s);
+		drm_memcpy_from_wc_vaddr(tmp, &src_map, PAGE_SIZE);
+		crc[page] = crc32_le(0, tmp, PAGE_SIZE);
 
 		io_mapping_unmap(s);
 	}
@@ -122,7 +122,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 	for (page = 0; page < num_pages; page++) {
 		dma_addr_t dma = (dma_addr_t)dsm->start + (page << PAGE_SHIFT);
 		void __iomem *s;
-		void *in;
+		struct iosys_map src_map;
 		u32 x;
 
 		ggtt->vm.insert_page(&ggtt->vm, dma,
@@ -134,10 +134,9 @@ __igt_reset_stolen(struct intel_gt *gt,
 				      ggtt->error_capture.start,
 				      PAGE_SIZE);
 
-		in = (void __force *)s;
-		if (i915_memcpy_from_wc(tmp, in, PAGE_SIZE))
-			in = tmp;
-		x = crc32_le(0, in, PAGE_SIZE);
+		iosys_map_set_vaddr_iomem(&src_map, s);
+		drm_memcpy_from_wc_vaddr(tmp, &src_map, PAGE_SIZE);
+		x = crc32_le(0, tmp, PAGE_SIZE);
 
 		if (x != crc[page] &&
 		    !__drm_mm_interval_first(&gt->i915->mm.stolen,
@@ -146,7 +145,7 @@ __igt_reset_stolen(struct intel_gt *gt,
 			pr_debug("unused stolen page %pa modified by GPU reset\n",
 				 &page);
 			if (count++ == 0)
-				igt_hexdump(in, PAGE_SIZE);
+				igt_hexdump(tmp, PAGE_SIZE);
 			max = page;
 		}
 
-- 
2.25.1

