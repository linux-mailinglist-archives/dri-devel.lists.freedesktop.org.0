Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD427AF91D
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 06:14:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54AF310E463;
	Wed, 27 Sep 2023 04:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060C110E39C;
 Wed, 27 Sep 2023 04:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695788081; x=1727324081;
 h=message-id:date:from:subject:cc:to:
 content-transfer-encoding:mime-version;
 bh=QZnSmq6wu811OIBhTXT2b3qE/gCSp52FoSZ8v6WqLh4=;
 b=Ef8T6VtasSuULrzath7Q2LfkrJ6lWiXOOrwo6LHBmb73r7DBGPgycRhj
 iuDgF1Wy0ZV6CXFYPN37xR2rykoYIHeMQObi47HdbQ+ohxojiF2fWuTtA
 QdX7C1kLsXZcAQ5PvlSmDC9XnDcZRU02iy9RZERH/IzAtCrs4DierPLQA
 Ve506EfsUlfg0BCoEK/8wDKyVp9EDmBw0A7R7q/+zP7nhYjWmpuwnoY8a
 ds+Rpgx/dVRm+7cfnbHToI/v17LmIMp4+oK3WPSHUHERKuUt9Lf+QHiLY
 o02sOpGbne1jyNVi4L5nLAHeuj8VmXox02p+0Lmj95I7l+zx7qBFzIWO2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="372058179"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="372058179"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 21:14:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="864650697"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200"; d="scan'208";a="864650697"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Sep 2023 21:14:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 21:14:39 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 26 Sep 2023 21:14:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 26 Sep 2023 21:14:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 26 Sep 2023 21:14:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gy3rjQ05CU78fy2h8k7P1d9WnH+gE+1O+VJHMLwHeNjIIX0dyXwOia1cB9p7DD2umevW+V35E6MpvOhjz7YiPWNG7FN8zKFPHwq814POt55azyVGLaHOzZwzeovsLUzcw9OOndthYCh7OSQ5A8VYtkx+NuI04Jk8NeRdTw4HPDug5jY1m9sCuiN8E2Iw7EvcpuGD6sCdJm9Fw73xqyjny5FEaiSitZ8VbvepPv5Ol9QykfPGMg/vQd+HL8HFOl6nbXtcUm3rLbQnGV6UyrrXBMPUQb+KMt0QfJnQS2slQPVng2EH51aO8foSJWvK54rdLOIAb+rIgd9GM4calFABeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sos/D0sgJ15PIk5Zm+T//D7FwXaG5+N8RG1yUyFCtes=;
 b=kNjmoBPlhBmNxMbyckJ/YNf/o1JUX+OfHUJNM/DtpN8JsadL4aI+/HKfqyTCcwUDMGqEN3UwS2W7B3PsXUwQbygR7TQQuM97i5R2rJNpXyoLim74SVhTvSq0h/8UVJiKvFuI4GneMiGEhVYADzEugs6g/e0YsN5PgC9aB6ZU3olXbAVw4pQC3KT4bCYrat6Lk/QAS7Pxbm8WxSuTNveJaUJxUZWLEs55kQu4Ea2Kj4poo8io/cohkrq0xg2VECC/v7NRdRUbMkf1gSZQYwhjO2B9EzkT77IfD5DUFqw2eOa6GnCyplDmWRzyqrGKeeH4DwvcIY51+T7icgloZE9gdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3406.namprd11.prod.outlook.com (2603:10b6:805:bb::33)
 by DS0PR11MB8688.namprd11.prod.outlook.com (2603:10b6:8:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Wed, 27 Sep
 2023 04:14:31 +0000
Received: from SN6PR11MB3406.namprd11.prod.outlook.com
 ([fe80::1189:a7c5:3536:65fc]) by SN6PR11MB3406.namprd11.prod.outlook.com
 ([fe80::1189:a7c5:3536:65fc%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 04:14:31 +0000
Message-ID: <900c90f4-8db5-b0b3-caec-4d7d76291f2c@intel.com>
Date: Tue, 26 Sep 2023 21:14:28 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Content-Language: en-US
From: "Balasubrawmanian, Vivaik" <vivaik.balasubrawmanian@intel.com>
Subject: [Patch v1] drm/i915: Add uAPI to query micro-controller FW version
To: <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR10CA0028.namprd10.prod.outlook.com
 (2603:10b6:a03:255::33) To SN6PR11MB3406.namprd11.prod.outlook.com
 (2603:10b6:805:bb::33)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3406:EE_|DS0PR11MB8688:EE_
X-MS-Office365-Filtering-Correlation-Id: abbf1995-25a9-4286-680e-08dbbf103f53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 74JeUMw5o7u/eDpB9AYlYo/aIFDtmL6vKv5a+Uvz3kRyBiCKGVtBMGyWX4/MnqeEWKeuolaWJkckLzBy/gMbR+I0R/qipCxA4PWhLlRF/tedUmDdZzAszfmBjej5yrLtogVXfAlAANfRcXmVU0UscrjW3RrhoIJKnr0qyffOqw3LC/RyP6JPzaPmvqh1Sp/gUvR68rfrRnsIvfaw+ayK1hvOpFWMXUJW0BUUW+EPnSG7kuC91bbmc2D/1AIZwqfLCXKfGo57UdAdlgUADoBtCrQokJgcN2M6WPuSDu5BMptuQi6D3bjyTYB/fYI2e8kt5+301ceDSYKiko5wniCWTrCxR969CJvbPdAd/xJ2GBtvynrpCvOZPANVJqjniR58j4G1ZwSb9GwOqMN89P6sUAqYuCo75vAIwHggHsqbXn3P7sFucbZf1LE6lcCPJtYAgzyh/qW9TDTHIJVMZQSx1iyPWR/ExUjobq6ORy4pK2f/X/7v1IEZDR3iMvFrSKrT+0YffPqKIPwYyw9LJY0czVpvYjZtMzK8zxEtFVqs/ILjy+oemb9VXLRvW4zN0iyyx7VFiZ6zvl4fej9VPZnUzyW+FDHS+pNjZxn/o+dyzI4Bj5/0FXPEU+LitM1AiA7kBBHDcG5otal2DiL2lfVJigux8JAqlkntnp2zl96LeCQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB3406.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(366004)(39860400002)(230922051799003)(451199024)(186009)(1800799009)(450100002)(8676002)(31686004)(86362001)(8936002)(4326008)(5660300002)(31696002)(6916009)(66476007)(36756003)(41300700001)(2906002)(66556008)(66946007)(478600001)(38100700002)(966005)(83380400001)(6512007)(316002)(2616005)(6486002)(82960400001)(6506007)(26005)(6666004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmxweGpNWjA3NVdJbGZqcVp2blVjSzFwUzk0UTA2cTZSTE5Kd2VKMU5JSGIx?=
 =?utf-8?B?VEl4YjVoRVExK3pxSDAzU1B6MUZmUHRHWm1nWFJCaCtpMm9TQXlja0lld2Jm?=
 =?utf-8?B?WXpXVXlLTW1menZ3VkZiTHJaWnZCSGJDKzhJTXk1bDFpK0g3MEx6ZnJFNHEz?=
 =?utf-8?B?OWdoR3RhbWNyUlM4eGEwNkNQQWFvN1hwNWI5UTlXbjhFY0FvK29DTS9QTHhR?=
 =?utf-8?B?NmVWL0c0eTJFdThWRFJ4NTNONGJ2K0ZINUhHZ2RVNFJRTU8yYURyTGpteSs3?=
 =?utf-8?B?Mlcxek5YK1RYY0RpSm9xSklXNENlSU51TVFzc0NzZFlIcXZpTWZqTDlzNHpj?=
 =?utf-8?B?enRFK0pDd0Faa2xHOXNLanYzakdzcENsY25xdWNwT1pNS3dsVFBaQjhJcGt6?=
 =?utf-8?B?QWtmbUh4Y2ZMbXZnVGo5aU1rMW95TWlVZ3c2L2YwcGUzQnhaMW9XSmpLYmVZ?=
 =?utf-8?B?VXo5V294bmxVM0RUUjlVajF0OVpJV3hOUDZleEp4dUN2KzRkV3ZIZXB4RFhL?=
 =?utf-8?B?a21JNFdwRE5CTGlFT0t1ckllYUV0N1FYNVllWjU4Mkk4OE9JaEN1ZVZuemN2?=
 =?utf-8?B?bDY0L1BlV2tLN0VNRExWU1U1WFFzZFlyQ2xuWXNpdjFMTDV6WTBlcUFheHBo?=
 =?utf-8?B?WWhQNXgvb21LYk9MODNYSW5HZVpmWWtiemtydldpN3ZwRlJndm13OEZwbUpK?=
 =?utf-8?B?dzVMSzVkSDVDbjNYVTVibVFFNWVUbm5UUkxQRktNTjNIcFJDTFRRV3NWWWlR?=
 =?utf-8?B?QVdrSDQrUTAwdmNVMVZhb2RWQTk5T3VWNlRQcGFHZWtzaG5RTjVYSUFhZkZx?=
 =?utf-8?B?K25OLytPN2Y2WkVlWHZsUHd4OERGcHlrOTVVMnVWelB4RmJXWHAxZ2g2WTV6?=
 =?utf-8?B?bURjeFZZSVNqbGYvdDFOOElPTXpvMHFNNDV3QTBsanlxZzB1VlB5VTNwNjMy?=
 =?utf-8?B?Uy9mRGJnWU1MSk5PRlNvMGM0eEZPMElsM0NTemFzNWRzU1VBcHlPaWZqZnYw?=
 =?utf-8?B?Z0hqbTVZTG9XOUdzUXVkeWtJcmM3WFYxcTFSc2FUaW44cE02UWttcFkrSHox?=
 =?utf-8?B?aC9iTEJnNGY2czhmTmtqM0ZzdDM3WHpTS1hXZXphdjk5WTFuQ3IzQ3BxVTFV?=
 =?utf-8?B?dTVZa3BFNHE1dFhMNkdya2RyY1lYd0hJbldTeFZGQTlJcmo3dmJhTG8zbkZj?=
 =?utf-8?B?Nk55VkNubGNNRFE0aGFmUlFqYjNyc0lwVDZHS0RPQ3crd3g4YVdCbGtjejBq?=
 =?utf-8?B?TzNyN2UwRkpHdTcwQURxUkhrNXc1NnhZd2xKWE92K25La0ZGeHJ5TXZmSG1s?=
 =?utf-8?B?ZDBzWmVaTVAxVTdDU1hlTHc4ajJBVEcyVnV4MVV2OGtKdHJ2YVZxNWpXQlRt?=
 =?utf-8?B?YWtGMVNWcGZSV1BVa1F3b0ZjV1hFeXFtdVVhTGwrT1FVRW5rWVdEUGtyYlBr?=
 =?utf-8?B?ZHRyLzV6d2RJbkxtU3VaSXNVbnI5Y0VNR3ErazFheWtuMXd0bkhPUjZ3aVBL?=
 =?utf-8?B?YWRUcDNjNE1ScStwazRMV1A5bUFkNEF4Z3ZrSklIRVlHVXVZQ2ZRZzUrdFNH?=
 =?utf-8?B?ZHh4RmQrWXJtMWNRVjlLNGlxUXlzZlExQ0ZtYkQvWVptMUd4cWNJV0ZQbnpj?=
 =?utf-8?B?MGFrSm9oRUQ5Wk1oeC8xdi9rSU1mcXZQQXdoL0EzVjZ6U3N1MFdVYWdtUVNS?=
 =?utf-8?B?N0ZqSGMreDVkdkthejV4M1VpMld6Nmk2WEJJQ0RlSFhvQStldCs4cVRIZzNy?=
 =?utf-8?B?MjJoWVhvZlVFZnYvMWliUEpmU0hjWmVkWUZoR3VFYUlDQVhlNWJFRExHSW9t?=
 =?utf-8?B?N3AvNFdsdkQvemVQZEZtTXFHbmxzWmp5VFdnWlBHSnJwSW9leTVTdDhnU012?=
 =?utf-8?B?MGtEdzNJSTE0S2FpdHVkYWZMVlBDeEt3YzE0SmxCRDRRVWhyY0FSbEhPcksv?=
 =?utf-8?B?QnZDY1hjWlBCMWZlbitIWlVsd1VDOFAwaGZXU3YraFkvNHd1QUNpeUkvN2hF?=
 =?utf-8?B?SWljUnU4d1M2UXZwbnVKZ3V2dEhSRXFOV2JGRTdqckFXcnFLRXVQQmdpVlRY?=
 =?utf-8?B?NUlwS1dCMXlxa1d0L1NSUGxNYkNtb3dZUS9UbC96N0paMGpra2FZTDB3L3RU?=
 =?utf-8?B?V0dYMkVMSTFoM1ZXQ3YwdTFpeEl6MlJEZXFKdWF5aGR1dHJXVGtGTFV3S0dG?=
 =?utf-8?Q?xJhbkIq1+7MlEtUDCPFg9U4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: abbf1995-25a9-4286-680e-08dbbf103f53
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3406.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 04:14:30.8449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wLKqzp3jasdqluJl6UPDJz4jjdxCD+aMyHtsPycWkw76me3U+eGPvnI4pMmctHN2pbwTua0xZp+CyOxDNFcdUWs5dv0E1llS7dfm1/LLcv/3T/g2ln2SP5rZ3W06Gkqt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8688
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
Cc: dri-devel@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 jose.souza@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Due to a bug in GuC firmware, Mesa can't enable by default the usage of 
compute engines in DG2 and newer.


A new GuC firmware fixed the issue but until now there was no way

for Mesa to know if KMD was running with the fixed GuC version or not,

so this uAPI is required.


It may be expanded in future to query other firmware versions too.

More information: 
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23661

Mesa usage: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25233


Cc: John Harrison <John.C.Harrison@Intel.com>

Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Cc: José Roberto de Souza <jose.souza@intel.com>

Signed-off-by: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
---
  drivers/gpu/drm/i915/i915_query.c | 47 +++++++++++++++++++++++++++++++
  include/uapi/drm/i915_drm.h       | 32 +++++++++++++++++++++
  2 files changed, 79 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_query.c 
b/drivers/gpu/drm/i915/i915_query.c
index 00871ef99792..7f22a49faae7 100644
--- a/drivers/gpu/drm/i915/i915_query.c
+++ b/drivers/gpu/drm/i915/i915_query.c
@@ -551,6 +551,52 @@ static int query_hwconfig_blob(struct 
drm_i915_private *i915,
      return hwconfig->size;
  }

+static int
+query_uc_fw_version(struct drm_i915_private *i915, struct 
drm_i915_query_item *query)
+{
+    struct drm_i915_query_uc_fw_version __user *query_ptr = 
u64_to_user_ptr(query->data_ptr);
+    size_t size = sizeof(struct drm_i915_query_uc_fw_version);
+    struct drm_i915_query_uc_fw_version resp;
+
+    if (query->length == 0) {
+        query->length = size;
+        return 0;
+    } else if (query->length != size) {
+        drm_dbg(&i915->drm,
+            "Invalid uc_fw_version query item size=%u expected=%zu\n",
+            query->length,    size);
+        return -EINVAL;
+    }
+
+    if (copy_from_user(&resp, query_ptr, size))
+        return -EFAULT;
+
+    if (resp.pad || resp.pad2 || resp.reserved) {
+        drm_dbg(&i915->drm,
+            "Invalid input fw version query structure parameters 
received");
+        return -EINVAL;
+    }
+
+    switch (resp.uc_type) {
+    case I915_QUERY_UC_TYPE_GUC: {
+        struct intel_guc *guc = &i915->gt0.uc.guc;
+
+        resp.major_ver = guc->submission_version.major;
+        resp.minor_ver = guc->submission_version.minor;
+        resp.patch_ver = guc->submission_version.patch;
+        resp.branch_ver = 0;
+        break;
+    }
+    default:
+        return -EINVAL;
+    }
+
+    if (copy_to_user(query_ptr, &resp, size))
+        return -EFAULT;
+
+    return 0;
+}
+
  static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
                      struct drm_i915_query_item *query_item) = {
      query_topology_info,
@@ -559,6 +605,7 @@ static int (* const i915_query_funcs[])(struct 
drm_i915_private *dev_priv,
      query_memregion_info,
      query_hwconfig_blob,
      query_geometry_subslices,
+    query_uc_fw_version,
  };

  int i915_query_ioctl(struct drm_device *dev, void *data, struct 
drm_file *file)
diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
index 7000e5910a1d..9be241fb77d8 100644
--- a/include/uapi/drm/i915_drm.h
+++ b/include/uapi/drm/i915_drm.h
@@ -3013,6 +3013,7 @@ struct drm_i915_query_item {
       *  - %DRM_I915_QUERY_MEMORY_REGIONS (see struct 
drm_i915_query_memory_regions)
       *  - %DRM_I915_QUERY_HWCONFIG_BLOB (see `GuC HWCONFIG blob uAPI`)
       *  - %DRM_I915_QUERY_GEOMETRY_SUBSLICES (see struct 
drm_i915_query_topology_info)
+     *  - %DRM_I915_QUERY_UC_FW_VERSION (see struct 
drm_i915_query_uc_fw_version)
       */
      __u64 query_id;
  #define DRM_I915_QUERY_TOPOLOGY_INFO        1
@@ -3021,6 +3022,7 @@ struct drm_i915_query_item {
  #define DRM_I915_QUERY_MEMORY_REGIONS        4
  #define DRM_I915_QUERY_HWCONFIG_BLOB        5
  #define DRM_I915_QUERY_GEOMETRY_SUBSLICES    6
+#define DRM_I915_QUERY_UC_FW_VERSION        7
  /* Must be kept compact -- no holes and well documented */

      /**
@@ -3213,6 +3215,36 @@ struct drm_i915_query_topology_info {
      __u8 data[];
  };

+/**
+* struct drm_i915_query_uc_fw_version - query a micro-controller 
firmware version
+*
+* Given a uc_type this will return the major, minor, patch and branch 
version
+* of the micro-controller firmware.
+*/
+struct drm_i915_query_uc_fw_version {
+    /** @uc: The micro-controller type to query firmware version */
+#define I915_QUERY_UC_TYPE_GUC 0
+    __u16 uc_type;
+
+    /** @pad: MBZ */
+    __u16 pad;
+
+    /* @major_ver: major uc fw version */
+    __u32 major_ver;
+    /* @minor_ver: minor uc fw version */
+    __u32 minor_ver;
+    /* @patch_ver: patch uc fw version */
+    __u32 patch_ver;
+    /* @branch_ver: branch uc fw version */
+    __u32 branch_ver;
+
+    /** @pad2: MBZ */
+    __u32 pad2;
+
+    /** @reserved: Reserved */
+    __u64 reserved;
+};
+
  /**
   * DOC: Engine Discovery uAPI
   *

base-commit: a42554bf0755b80fdfb8e91ca35ae6835bb3534d
-- 
2.34.1


