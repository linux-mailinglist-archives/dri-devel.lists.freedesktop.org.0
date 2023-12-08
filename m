Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 225D380ADCC
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 21:28:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0360810EB2F;
	Fri,  8 Dec 2023 20:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F04810EB24;
 Fri,  8 Dec 2023 20:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702067282; x=1733603282;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=IixOSWjAJv/undmhiNikPlZXzxpZFGVYQcZ7AWEL9sI=;
 b=P7jivz7VZC4S8RPkKyzhclSvmTudFlTyIku6AURhi8GHgy4B+XYdjxfl
 k/9IfpBB3kzQXbSJEWJO6QIrhQpPLzLKyWQerkaOt76ZTnpkx7A3QWANd
 GE3OebClm1sseoAdJHFMj5AakKGF8tujLr7BKE+GIYNUQrRIgMF5maN4h
 eqJBtf4S3DZeP9Nudz/GJ4bk/kE3Ah7OKqK7CxvZpOb3ldWOWyet2f/D7
 EVymY4R6gJ7/CtjW4EKm2rroeO+mS14ztIH15Q16F4zDuNsqZPsoNYACV
 vox/Es0IgbNZVm343a/pH4Yf6t89z2psmuSqwKbQiwl7Pr+Ea6sf6SNFH Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="384870165"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="384870165"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2023 12:27:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1019466195"
X-IronPort-AV: E=Sophos;i="6.04,261,1695711600"; d="scan'208";a="1019466195"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Dec 2023 12:27:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Dec 2023 12:27:58 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Dec 2023 12:27:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IxSauHbX96YXxcJbF3aLa7tg9/iZceOm8TfBNt11r7bQzLNi+9VbGEA3ngsjUI5g1wcuMGa05vHREnrlIwO6gWCHQ3fk8TC/RvY63lf4QNUHjOgpAwJNj01z1wS4kgMNrGMRcipYfv9RUpIkh/7QY3WpdiUxQ5i7uwJRrxtAY3EYvl2OrbLy/kC07m4qismD09joncCYgKDQuZK2RfkNdGm+qf8otTKYb1IhD3giEW39uL9Hnp5X8abyjkNbMSHmii/ChQZ9aVFJ3HFrJrxrYwyTl5ggOs1XTKpiUuylWSj31qylTaHS+RYyp6PbHYitSmnBfFT8pLH8uyTaFOgtBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxYfbRuayPBa65eJ7NrCpnNxpfyemY/4C/O00Ii2rDc=;
 b=CoWQRcnnFw06YKfd+PL9f7tWldo+997wgYl9JitUFxtUZ2LI2KIcB16vwMky6tSzj+SaFryLmv1dUH/NZjtltLmKMFxgNEbNvPeSayHei/0qUQADnfrohl3+WRRmeE2VJE7JpO/J3RH6fQqLXXXeg04qPTrvZ24Zu5iIF8f80NjB0pbq8ozeOJoucK446+H3b3q68J9MFLJGFT6he/lmPuI3JOyfB7LK5WU9r7Nx2Lt4k9YF/zRnlkMmBuclWAFNhGizfbfQQ6DWnxr776wLOAp9eyI+j13lemNVjc4a3e5lgO5gThzV89fJMVpZwXoCejXKb4zY3hYbRPAOSME6Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB8527.namprd11.prod.outlook.com (2603:10b6:510:2ff::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 20:27:56 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 20:27:56 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH 10/13] drm/sched: Rename priority MIN to LOW
Date: Fri, 8 Dec 2023 15:27:20 -0500
Message-ID: <20231208202723.918082-10-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208202723.918082-1-rodrigo.vivi@intel.com>
References: <20231208202723.918082-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0046.namprd17.prod.outlook.com
 (2603:10b6:a03:167::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB8527:EE_
X-MS-Office365-Filtering-Correlation-Id: eb65f5f4-990e-4dc6-2275-08dbf82c298a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ljjH9oXmDWrE8I7zVGbv/8SPGsb/pr0wbCSaJ/Hf3/vTMYDSmZO5G2sxo40ZosfjX8ccmASEsax3OhoJ5HsejZHDVHExw0yHDjpAfLbL4bdEmU2y935Y5YBGCBEz/FIPQ/YzzUcmbLemJfkqvegxgrzJtc0+piFGK28X6G9LSUY0RAfcHh/JmZMCgDpxznOynQqcR7/GVKb6E8U3YznRt+3xGSzSCsVoAGPQ2gHD3RPnyoUf0tc7NMfFyeeW+8jVWmlN9mOOIxx4vw65BknuZ74ZUiH06zJMpCYIt9fYeA5vjAmARZ9v6oUdfs/fpLMrdFwI0W5+v/SFg0kisy0A8pG5Mmz84BEl5ocyEj76rmYjK8stq6PWGN4/LuXHKI9HhtAdVYfJJqApbWw6TKXR0IOh5q0pZrdBh3TryC9TvmOovx2Fjh2XBjYoBxdpMZBCY80c16NPQq3/KBvI5BiMeBEM35H9UFLyW2+JmREapUPBzgGY0PlG4DK1opqVnHXqVGLjMlPrdMy+nWHuIFfp9BlDxQeXu4zQxYt/xkgFWn4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(6506007)(26005)(66574015)(6512007)(2616005)(1076003)(83380400001)(41300700001)(4326008)(8676002)(8936002)(2906002)(7416002)(44832011)(5660300002)(478600001)(6666004)(66946007)(66556008)(316002)(54906003)(66476007)(6916009)(6486002)(966005)(82960400001)(38100700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUFzWEZ1NjZEeUdtakg0K0M5eTVLZEZObDVzVE14U2plMnc4aVZ6MHhBaXhU?=
 =?utf-8?B?S1dtdlZTZzY0cmlLR2RuZE9oTmMxSFAzK0FJNTJMeVQvV3RCWjZEL0FkWTJo?=
 =?utf-8?B?SXhuN3BaYmRvanMxVWwyUHkzYjNnZzdLUllqWmVxWkNMRTVlcS93RHp2ZmNI?=
 =?utf-8?B?MVQ1M1lmV2xubEhJeDJSVi9IVE9oenZrbERUWDFpbFRFRWU2eWE1RGZvWTVF?=
 =?utf-8?B?Qlp2T3ZuL083MTIvNXpTZ3phV2RpTm5NbktLM3BBeUl6dmNOWERsU3pQZEFX?=
 =?utf-8?B?VVY1MmlUaFFRZThMSVVoc3piTVpSQXRpR1BKa0FCcHdkY2gzTzIzVFoxVTdo?=
 =?utf-8?B?SlRoZkN1Q1VSZzY2dDBMKy9Ic2t6MGJFaGJIRmJ0bjVZa0daVm4vL2s5T2pO?=
 =?utf-8?B?Zmk4RjJVbGQyR09mdll3L0NqMVhvWWl2UmFSVS93MUd6S2Q3R0VDK1BsSW9T?=
 =?utf-8?B?RlQ3Y2dqRFlhUlB6TStEeUVnSW4wOCtLY0Nub0tMSmRNYm5ZTU0vZVMvT2VF?=
 =?utf-8?B?SnVnVFp4YStBWkc5VnVmRVNVdjBDOTAwQlZFUVJPbU1lNUluVFUzS0FEVXFm?=
 =?utf-8?B?S0hpZzNHM0RLcWFBVDdBRytNb1JGeCt3bC9Cb2ttbzYzaldLQXJKQUlBb04v?=
 =?utf-8?B?a2ZqYjlpWlRRSnlIckZ3MTA4TVFBaGI5Z2RwdXNlY3hxMjVsR3pZRURPYzhD?=
 =?utf-8?B?UkFrNXhnY0tOdDRLaXBKRjIvT0pJVXA2bDVJOExmWE9ERHZ1RnRhcDdnV0ph?=
 =?utf-8?B?V1llZC9nazV3RUxqVGVRVmZxdVIyZEc0TG9jWmNGMW5hcjJWM2JyLzFtTStL?=
 =?utf-8?B?Tm5wVUdocnJNb00zRExBbE8ybkF5aW1GbktrKytJcDJUcHZLY3ZnWFNUQTVi?=
 =?utf-8?B?YTdkM1hzb3lKSnRONDV6RkdzQjJCS3F4WmZwUjR2UXdVdHZiNFNEbXpuaTV5?=
 =?utf-8?B?YktlbXFERUpLRjgwdk1HUkhCVlRQREhNZ1J1dXRqWW5SQnRnYkl5K25Xb2pn?=
 =?utf-8?B?WU1RMnlySlNYMk4wdDdJbU1nY2xWTTBWdCtaM3NoSEptdXE4Y08yck55bE0r?=
 =?utf-8?B?TjFyczhsQThac1lHNndpWnVFVjM3cDdENnhLdWdzcHQ4WEFvQjE4d1ArSDZE?=
 =?utf-8?B?NHJyWlJnVDQrelRQOWdGZDFteFJOR3psTUtiRW92SFdEeHJxbENhSnJJL2F3?=
 =?utf-8?B?VUducjk0dEFHY2tBb0luUFZlMGdTVXp2cERmWjhJWFVvV2lWMGZUUHFseVlG?=
 =?utf-8?B?dWdsdm5uNHBrT3dQK1JNTjUzaW5VdCtjVTZsUVQ4U05Lb1JaSm5hajlWSkNR?=
 =?utf-8?B?dml2UWFoUWtnOFFDem5OYXc1ZTFpZGxYaEpJeEtXclIwUzdFeTg4cHpCRlU0?=
 =?utf-8?B?S0xOSDlpQ0tOaWRzNnoyNkFrNUJtSnIwYmM5UUxMWnJPOTl0SEE3Q0s2S3N3?=
 =?utf-8?B?eGtISTVEekdsTVRQNWlTNjFHMGprQjVybnJVRGQ4TUlsYkRJUG9qUmFPL043?=
 =?utf-8?B?TzY4eUZGNm4ycnVuL0Z0cVplVUUyMDAvYUh6SFNsUlJFdzNnRkhSekYwVmVk?=
 =?utf-8?B?RUdsUXZ3anptY0tPVkdEVCt1NHU2Vm1FS0NtcE83Y1puNE5kd29KT2I2aXV3?=
 =?utf-8?B?aThaV29ESVZOWVg5ZXVhTWl4SDE4MGcrZmZxTEQwNzhCb0xLRVc4NEx6cWw5?=
 =?utf-8?B?cldLaE1maFFxWEhBMXFwNFVQUC9PQ1JGLzZ4NHZ0bTBub2E0d25mQmtOQU1K?=
 =?utf-8?B?bU5FOHBjckhUMUkrTEM0R0grMkNtLzEwcm9OR2FnWFdLcGpUYjVOU0c2M2kz?=
 =?utf-8?B?czZZckhjeFFvOEhTcTV5ck9CWCtXNFBiYUc1NXA3Y1VabWdhU3gxTHVHaXlG?=
 =?utf-8?B?ZktwUlJBUFBhNmx3NDJzQndNTzZPSFJuOXZuWWVzTjcrNmtwZXJpekpFQmtu?=
 =?utf-8?B?TWRMb3R4aHZaKzZpNUxZL1Z0NkpaQllJdllHT1hrVjFPclF4UFM2QWFsTWtF?=
 =?utf-8?B?TzN5cXFLVkJ2Mmpjd0htUmxyZ2UvNVhaaWkrR1hBNU0ycUR1Z2kwUFN5VnNT?=
 =?utf-8?B?RkNnckVlcmxHdTdBVzV6WENHUGNpK3k1dUo1eGxMRjRtSHJCZUVzaEhjL0Va?=
 =?utf-8?B?cSt0ZEtLYkVRQXdnbm5ZNEJrSVlmTElURzl1WmRscmFiLzJqbUJJUHNSajVD?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb65f5f4-990e-4dc6-2275-08dbf82c298a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 20:27:56.4181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+44CBKAbTGFJr1qwTBW60vzpHCX4FCF3MDJ29mFKxOmtrLyBF06sOB+bzM/1BrZ7r6V+rTp5EsA5i2k4DziTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8527
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
Cc: Luben Tuikov <ltuikov89@gmail.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Alex
 Deucher <alexander.deucher@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Luben Tuikov <ltuikov89@gmail.com>

Rename DRM_SCHED_PRIORITY_MIN to DRM_SCHED_PRIORITY_LOW.

This mirrors DRM_SCHED_PRIORITY_HIGH, for a list of DRM scheduler priorities
in ascending order,
  DRM_SCHED_PRIORITY_LOW,
  DRM_SCHED_PRIORITY_NORMAL,
  DRM_SCHED_PRIORITY_HIGH,
  DRM_SCHED_PRIORITY_KERNEL.

Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Luben Tuikov <ltuikov89@gmail.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20231124052752.6915-5-ltuikov89@gmail.com
(cherry picked from commit fe375c74806dbd30b00ec038a80a5b7bf4653ab7)
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c  |  4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c  |  2 +-
 drivers/gpu/drm/msm/msm_gpu.h            |  2 +-
 drivers/gpu/drm/scheduler/sched_entity.c |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c   | 10 +++++-----
 include/drm/gpu_scheduler.h              |  2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index fb050345b9f2..d46786618061 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -68,10 +68,10 @@ amdgpu_ctx_to_drm_sched_prio(int32_t ctx_prio)
 		return DRM_SCHED_PRIORITY_NORMAL;
 
 	case AMDGPU_CTX_PRIORITY_VERY_LOW:
-		return DRM_SCHED_PRIORITY_MIN;
+		return DRM_SCHED_PRIORITY_LOW;
 
 	case AMDGPU_CTX_PRIORITY_LOW:
-		return DRM_SCHED_PRIORITY_MIN;
+		return DRM_SCHED_PRIORITY_LOW;
 
 	case AMDGPU_CTX_PRIORITY_NORMAL:
 		return DRM_SCHED_PRIORITY_NORMAL;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 62bb7fc7448a..1a25931607c5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -325,7 +325,7 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Signal all jobs not yet scheduled */
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 4252e3839fbc..eb0c97433e5f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -347,7 +347,7 @@ struct msm_gpu_perfcntr {
  * DRM_SCHED_PRIORITY_KERNEL priority level is treated specially in some
  * cases, so we don't use it (no need for kernel generated jobs).
  */
-#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_MIN)
+#define NR_SCHED_PRIORITIES (1 + DRM_SCHED_PRIORITY_HIGH - DRM_SCHED_PRIORITY_LOW)
 
 /**
  * struct msm_file_private - per-drm_file context
diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index ee645d38e98d..dd2b8f777f51 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -88,7 +88,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			drm_err(sched_list[0], "entity with out-of-bounds priority:%u num_rqs:%u\n",
 				entity->priority, sched_list[0]->num_rqs);
 			entity->priority = max_t(s32, (s32) sched_list[0]->num_rqs - 1,
-						 (s32) DRM_SCHED_PRIORITY_MIN);
+						 (s32) DRM_SCHED_PRIORITY_LOW);
 		}
 		entity->rq = sched_list[0]->sched_rq[entity->priority];
 	}
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 044a8c4875ba..b6d7bc49ff6e 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1052,7 +1052,7 @@ drm_sched_select_entity(struct drm_gpu_scheduler *sched)
 	int i;
 
 	/* Kernel run queue has higher priority than normal run queue*/
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
 		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
 			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
 			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
@@ -1291,7 +1291,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	if (!sched->sched_rq)
 		goto Out_free;
 	sched->num_rqs = num_rqs;
-	for (i = DRM_SCHED_PRIORITY_MIN; i < sched->num_rqs; i++) {
+	for (i = DRM_SCHED_PRIORITY_LOW; i < sched->num_rqs; i++) {
 		sched->sched_rq[i] = kzalloc(sizeof(*sched->sched_rq[i]), GFP_KERNEL);
 		if (!sched->sched_rq[i])
 			goto Out_unroll;
@@ -1312,7 +1312,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,
 	sched->ready = true;
 	return 0;
 Out_unroll:
-	for (--i ; i >= DRM_SCHED_PRIORITY_MIN; i--)
+	for (--i ; i >= DRM_SCHED_PRIORITY_LOW; i--)
 		kfree(sched->sched_rq[i]);
 Out_free:
 	kfree(sched->sched_rq);
@@ -1338,7 +1338,7 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
 
 	drm_sched_wqueue_stop(sched);
 
-	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+	for (i = sched->num_rqs - 1; i >= DRM_SCHED_PRIORITY_LOW; i--) {
 		struct drm_sched_rq *rq = sched->sched_rq[i];
 
 		spin_lock(&rq->lock);
@@ -1390,7 +1390,7 @@ void drm_sched_increase_karma(struct drm_sched_job *bad)
 	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
 		atomic_inc(&bad->karma);
 
-		for (i = DRM_SCHED_PRIORITY_MIN;
+		for (i = DRM_SCHED_PRIORITY_LOW;
 		     i < min_t(typeof(sched->num_rqs), sched->num_rqs, DRM_SCHED_PRIORITY_KERNEL);
 		     i++) {
 			struct drm_sched_rq *rq = sched->sched_rq[i];
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 9a50348bd5c0..d8e2d84d9223 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -63,7 +63,7 @@ struct drm_file;
  * to an array, and as such should start at 0.
  */
 enum drm_sched_priority {
-	DRM_SCHED_PRIORITY_MIN,
+	DRM_SCHED_PRIORITY_LOW,
 	DRM_SCHED_PRIORITY_NORMAL,
 	DRM_SCHED_PRIORITY_HIGH,
 	DRM_SCHED_PRIORITY_KERNEL,
-- 
2.43.0

