Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 973586033DB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 22:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B5E10EFFD;
	Tue, 18 Oct 2022 20:20:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E001E10EFF7;
 Tue, 18 Oct 2022 20:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666124420; x=1697660420;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5Zu0AW2e3lRy7R0DSqoh/Ror772NXfVJc4GH0WYxgFY=;
 b=lH9YA5jN2vt1y/pWQH/iDO3cKV+7iVZNOA4Ss3eh1txPMoRP3jnbStXO
 t/KwPkaqw6u4/bM+7ExFNZQRrnz9rdo/plqGi/uhdby7jhweCF8BhkviK
 bzrVk3QENrvh47AMPDqaJc6qvFPq5FHuPlUJQWV3sFL2emPpr1wFtTriz
 PDGDy7M6MJb3+zBDKYafYguHGM1Ped82N7yz/fCjd3IpDBvY40qVzxqQ9
 hThQy0nGDOszy4fFxc8z0MfvBBBSQPW7EuLlhE4svgWTIYjvGX99VTzkl
 Xhx1ck7gyx8uPp16oFyAKeBbagebgSFgpdV+olKhJKGC8CwczS8YH4S2S Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="293619938"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="293619938"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 13:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="606729114"
X-IronPort-AV: E=Sophos;i="5.95,194,1661842800"; d="scan'208";a="606729114"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga006.jf.intel.com with ESMTP; 18 Oct 2022 13:20:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 13:20:19 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 13:20:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 18 Oct 2022 13:20:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 18 Oct 2022 13:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6yxbVZQaHpHZttzubE7orAP5Dd7uFngQNS3urpq9eVaas+fjeBZGsOV3cBGvX7ajFwglv/pzx3+nGNIrgMMyX/tDhDjGcmtm+PEeukJlv6nKB7FrLGDPKDlDzD2yUBKtrhZiBdmdUNZL/zodKDuhxnkPI25MIs/H/hP1oP9dMnDAsFm0DGeRRJWeeBXm/kxUIKo+oy/4M0e0xfmY8HvTMdtY9rs5+0mB/tMjARM3DhGwnr532ZRMPXpaXnSzYcaaBa/Q1n/haCF7G3GzB/EaEn57W1LedQOdUQemEg0C29rmOob2O2sxGjQl225z/mpUEACWegRZzxp7JwVuXVfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Qz0Ayrnqb0JaRewwx/w2NVwE2SiFFH+qcxYifXOxQA=;
 b=JyWFmvAwBx70Bnlp4UmvhPe+jgUDSr3Kbl6sgvt8m8XBOYIZRllYX6Huv0hZJ7GLph5LOaRx1wXLmu49Ryu/It0vQTwEWwCACBrQ4OkwSgw8Wn22Fr8PwZlg5ygY6EurSY2vtcHCF5F4FocLuOaolErgbfW33rRwZediXalea9omSgndGL/ExzCuFSMtVSwdxR2PnBhHT0ctfhHl5GURbJWCLl37Kpz8GwrXZgQtafsHvz80gAM8naCJlDIYIgEAKnG4/ALQv/ML4maXyNuSq7TiCWnrncbhmgdAwuNjo/ZxDpcvEMLfjuagqUP0KeOYUKqYXO+0UIE2hpLXXGBvhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 20:20:16 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 20:20:16 +0000
Date: Tue, 18 Oct 2022 13:20:06 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 15/17] drm/i915/vm_bind: Handle persistent vmas in
 execbuf3
Message-ID: <Y08KdqpguNKmVNz3@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-16-niranjana.vishwanathapura@intel.com>
 <a3e3ddb4-b41d-70f5-cda4-082e9e61b62f@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3e3ddb4-b41d-70f5-cda4-082e9e61b62f@intel.com>
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CH0PR11MB5297:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d3469e-2c82-4373-56c7-08dab1462b49
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ek/S5QT2qrpM4uke5YKDhxmvblf2wPl/U2ErhkoN6053gaN3mmhWrlLofmzKaU/QNEHDG1k3QE9iVXscKz6j5Ahb5WuE58TU9lXappJli3+AZ/mvJdQBW/UVH18CEaJVlCVR+Chd7Anff7vAqLHGl+EV1Zu8jv0HB0CvpYgQV9p0oXb5LIAr+S6Cgwai5OG92yigb7M3k41S6uYehneacIlP4FVzDfL44yEwGbcxzVFstg4xDzzEHLrmDIKvQtIJjJJeXH/UxGkkuIJXUt+LGN7CGGBt0wliCsPFaRiE04tCzkxoh9AY+Gj8QLuGCANn4i5wWs0+uuS/+eL/084P3uENDFzICl5rQ2wmjN+/BeJmdipiI5SlpuEhzMLgwsT8ocMWLw+O5Ne0cjALNXTohU8hnZnKrMv5vzdOjHJOkwZPbRWkDsBgvmKL0BY6Icx5G3CdTWmOYL0ZkANT1NCXRnEl0CbtkIbKF9GQlygN9zk5LT1JiYf0O8JsoT3NiW24hPWY+Zrm09aLpwdZEtfTcrjSmMtw33snz4qavDASv3SObNeFl9/hofzeX4TQZRry33CICUoo5QPvFtppsvIvfaXiN3B2UzOIOzj8BTqVRGVuzQ++sIQ1oGwGixpdtBgZti7y/xpj4P5NUJIQynQJMIQhO15COeI2+V86fLtiRXhc9QDzR4AqrxBuhqGHx+xWy/7oB/JEivH9V/gjt5y9Gw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(366004)(39860400002)(376002)(136003)(396003)(346002)(451199015)(86362001)(83380400001)(82960400001)(38100700002)(186003)(44832011)(5660300002)(33716001)(41300700001)(8936002)(6862004)(6506007)(6636002)(6486002)(478600001)(9686003)(6512007)(26005)(6666004)(8676002)(2906002)(66946007)(66476007)(66556008)(316002)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?0sXLrrgiHFDVQqme0NDACshAlx1awtqFjNSL7kO1DPUPDyyJTH8qu1BMy/?=
 =?iso-8859-1?Q?A1gJJGL7EzXaUotCKge88HhJcluBFmqg7QBtSw9+iaEP7FJdeLYFFK8RAA?=
 =?iso-8859-1?Q?O0cXdkPxN+XiauaNQAPQ+BEtQcr+B/VvTpzGtLb8ni1IL+wrs9zFoMqs+J?=
 =?iso-8859-1?Q?nJ1Yd+CYp9ul4yueBfCirxj3CRlZ7vskq2JRhRWb1e7xs95bq5TORWgbUJ?=
 =?iso-8859-1?Q?dVsVdJf9GLW42yAxEEuB8iAi2hNuOMjUe/V9j4l8C2L+RsitsHcgZiRCFQ?=
 =?iso-8859-1?Q?9HpcuLS+MuG2hSoQSV7wEVdojrp7Txm22Ga+nQzKlXm0JK1IlDodwxYm4k?=
 =?iso-8859-1?Q?HJwJuiT+oyPMIgjZzzBsLnyCKFztJ0yIiFoJIGh5okZlaERKLzztkCJzU+?=
 =?iso-8859-1?Q?f/Aj41JRdx1lLIGHVbA+JDCSvfqpmfFTf2ocPi0ZRFTuXSg2jb5prSsbaD?=
 =?iso-8859-1?Q?ufcpNX8eyNnr0ACghyyiKNgfDtuKDeLCGY5sexXlofTz2tOcgxwPcRcj1P?=
 =?iso-8859-1?Q?ii2gHnf+jCrjaeJzfoP2e6j+WNPuHIqtuDGmA3WvPcDgWRGWRkkvwN1XcO?=
 =?iso-8859-1?Q?vj6SCT4xhAqOGdXbUbfthi5fqkVai0cE+f2+UASAEiWHUuYtUodspXcTyp?=
 =?iso-8859-1?Q?CgmhigA4fAkQB2z1D1Z8Lh0jzml9y8Kwg04mEFyjbgTmOYRyHtotcaeiwk?=
 =?iso-8859-1?Q?DuCcVciZTqn8l/Y2mtnpvLQIazm+n9iykGoMRfFXGqRgZSc1nj4H/M/DTS?=
 =?iso-8859-1?Q?cHfbx/CZYpgxEN0t3BvLHahZSVpcgUokWHyQcUB5B6hvzIA5fniWitQter?=
 =?iso-8859-1?Q?SILVyZ91vWq0YIiwsfCAeAYShzLbNCzecC4vhwvrjFO4k5bwgeY98795rM?=
 =?iso-8859-1?Q?KY9iggx6Vpb6PLdvVWTGuocW+giZ5jfW/BFxEqLeEPaHUQbsp4goDK74Ry?=
 =?iso-8859-1?Q?pENDI0KhpoS3yIGK9+S7POgqXpKKR8p6ur0W/fghtuZGO3Pm1IuWtvo6rY?=
 =?iso-8859-1?Q?ilIuuX1wzSzAQsKUv45lxVtlUzDKgAEW1o4ySc3heoIimksrREYeJ6TRmO?=
 =?iso-8859-1?Q?E+bVQsHbdlYwWQM8jPeIR7r//WJ9jEST0CKG/CTDqDs6Gr4pal3hwxwsJx?=
 =?iso-8859-1?Q?K/thL7pKhojdaS+7LfIULuA3te21nIaOOTmquBUt/kfw0Yd0lxnQ0TC6CL?=
 =?iso-8859-1?Q?uB0WjnBsU52jMKQFLKYu5h7BqKw/RgTKMTU7+ncLyDmRH7CKiDqMVcG5Bq?=
 =?iso-8859-1?Q?oysAJMi+48Muiv1NCBJkLGuirWuADU0R70V0zbvimghDcbK5q8HCHLFdYx?=
 =?iso-8859-1?Q?UQvfbL2DphJCJQgdeUX46SbXukfNBA5T/Z9S5hBWesmEs8dxnl7duI661D?=
 =?iso-8859-1?Q?TrkSeVOrd2PbxXNFfHoTHsHF0MvqQwJQsjbCddAnNudZkqMBnGSzouWwJf?=
 =?iso-8859-1?Q?s8FFvDm2CgSlcvqpNfEUx0MQTWhEz9kpyRAlsZfcCAKpdqF+M3ghG7ntLg?=
 =?iso-8859-1?Q?ldFIlPzyRLT8F6p78m96E0i6LuvAO2Ms055x7qk3ydeCpfQOxmt+6NvIJA?=
 =?iso-8859-1?Q?u6yDazv+lra2AkZvbJ0UN4/otwaFB51KeqkCR2CCZbk5O0nGKyLcVopWbX?=
 =?iso-8859-1?Q?NhRV6VEkgkOOy3apUnWgNol/5GBO6v2xdy3DwDN6l9ukzojIvStvkzCBdM?=
 =?iso-8859-1?Q?SfehapGHpBXhfZQlR7A=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d3469e-2c82-4373-56c7-08dab1462b49
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 20:20:16.0118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i9+kz1lY+tJ1G16oFS8xn7Hwx91FIJ0GuTaxkPvqwmoIrB/plEPFhe4ZkogqWeu9TzlgrPp83cVbP/MhP3sK8MV/SwzE+GiIj5UytSuJwxgmzEfhH4GcH8s+ASzMTOgm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 07:01:57PM +0100, Matthew Auld wrote:
>On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
>>Handle persistent (VM_BIND) mappings during the request submission
>>in the execbuf3 path.
>>
>>v2: Ensure requests wait for bindings to complete.
>>v3: Remove short term pinning with PIN_VALIDATE flag.
>>     Individualize fences before adding to dma_resv obj.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 208 +++++++++++++++++-
>>  1 file changed, 207 insertions(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>index a9b4cc44bf66..8120e4c6b7da 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>@@ -3,6 +3,7 @@
>>   * Copyright © 2022 Intel Corporation
>>   */
>>+#include <linux/dma-fence-array.h>
>>  #include <linux/dma-resv.h>
>>  #include <linux/uaccess.h>
>>@@ -19,6 +20,7 @@
>>  #include "i915_gem_vm_bind.h"
>>  #include "i915_trace.h"
>>+#define __EXEC3_HAS_PIN			BIT_ULL(33)
>>  #define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
>>  #define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
>>@@ -42,7 +44,9 @@
>>   * execlist. Hence, no support for implicit sync.
>>   *
>>   * The new execbuf3 ioctl only works in VM_BIND mode and the VM_BIND mode only
>>- * works with execbuf3 ioctl for submission.
>>+ * works with execbuf3 ioctl for submission. All BOs mapped on that VM (through
>>+ * VM_BIND call) at the time of execbuf3 call are deemed required for that
>>+ * submission.
>>   *
>>   * The execbuf3 ioctl directly specifies the batch addresses instead of as
>>   * object handles as in execbuf2 ioctl. The execbuf3 ioctl will also not
>>@@ -58,6 +62,13 @@
>>   * So, a lot of code supporting execbuf2 ioctl, like relocations, VA evictions,
>>   * vma lookup table, implicit sync, vma active reference tracking etc., are not
>>   * applicable for execbuf3 ioctl.
>>+ *
>>+ * During each execbuf submission, request fence is added to all VM_BIND mapped
>>+ * objects with DMA_RESV_USAGE_BOOKKEEP. The DMA_RESV_USAGE_BOOKKEEP usage will
>>+ * prevent over sync (See enum dma_resv_usage). Note that DRM_I915_GEM_WAIT and
>>+ * DRM_I915_GEM_BUSY ioctls do not check for DMA_RESV_USAGE_BOOKKEEP usage and
>>+ * hence should not be used for end of batch check. Instead, the execbuf3
>>+ * timeline out fence should be used for end of batch check.
>>   */
>>  /**
>>@@ -127,6 +138,23 @@ eb_find_vma(struct i915_address_space *vm, u64 addr)
>>  	return i915_gem_vm_bind_lookup_vma(vm, va);
>>  }
>>+static void eb_scoop_unbound_vma_all(struct i915_address_space *vm)
>>+{
>>+	struct i915_vma *vma, *vn;
>>+
>>+	/**
>>+	 * Move all unbound vmas back into vm_bind_list so that they are
>>+	 * revalidated.
>>+	 */
>>+	spin_lock(&vm->vm_rebind_lock);
>>+	list_for_each_entry_safe(vma, vn, &vm->vm_rebind_list, vm_rebind_link) {
>>+		list_del_init(&vma->vm_rebind_link);
>>+		if (!list_empty(&vma->vm_bind_link))
>>+			list_move_tail(&vma->vm_bind_link, &vm->vm_bind_list);
>>+	}
>>+	spin_unlock(&vm->vm_rebind_lock);
>>+}
>>+
>>  static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>>  {
>>  	unsigned int i, current_batch = 0;
>>@@ -141,14 +169,108 @@ static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>>  		++current_batch;
>>  	}
>>+	eb_scoop_unbound_vma_all(eb->context->vm);
>>+
>>+	return 0;
>>+}
>>+
>>+static int eb_lock_vma_all(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	struct i915_vma *vma;
>>+	int err;
>>+
>>+	err = i915_gem_object_lock(eb->context->vm->root_obj, &eb->ww);
>>+	if (err)
>>+		return err;
>>+
>>+	list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
>>+			    non_priv_vm_bind_link) {
>>+		err = i915_gem_object_lock(vma->obj, &eb->ww);
>>+		if (err)
>>+			return err;
>>+	}
>>+
>>  	return 0;
>>  }
>>+static void eb_release_persistent_vma_all(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	struct i915_vma *vma, *vn;
>>+
>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>+
>>+	if (!(eb->args->flags & __EXEC3_HAS_PIN))
>>+		return;
>>+
>>+	assert_object_held(vm->root_obj);
>>+
>>+	list_for_each_entry_safe(vma, vn, &vm->vm_bind_list, vm_bind_link)
>>+		if (i915_vma_verify_bind_complete(vma))
>>+			list_move_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>+
>>+	eb->args->flags &= ~__EXEC3_HAS_PIN;
>>+}
>>+
>>  static void eb_release_vma_all(struct i915_execbuffer *eb)
>>  {
>>+	eb_release_persistent_vma_all(eb);
>>  	eb_unpin_engine(eb);
>>  }
>>+static int eb_reserve_fence_for_persistent_vma_all(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	u64 num_fences = 1;
>>+	struct i915_vma *vma;
>>+	int ret;
>>+
>>+	/* Reserve enough slots to accommodate composite fences */
>>+	if (intel_context_is_parallel(eb->context))
>>+		num_fences = eb->num_batches;
>>+
>>+	ret = dma_resv_reserve_fences(vm->root_obj->base.resv, num_fences);
>>+	if (ret)
>>+		return ret;
>>+
>>+	list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
>>+			    non_priv_vm_bind_link) {
>>+		ret = dma_resv_reserve_fences(vma->obj->base.resv, num_fences);
>>+		if (ret)
>>+			return ret;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static int eb_validate_persistent_vma_all(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	struct i915_vma *vma;
>>+	int ret = 0;
>>+
>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>+	assert_object_held(vm->root_obj);
>>+
>>+	ret = eb_reserve_fence_for_persistent_vma_all(eb);
>>+	if (ret)
>>+		return ret;
>>+
>>+	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
>>+		u64 pin_flags = vma->start | PIN_OFFSET_FIXED |
>>+				PIN_USER | PIN_VALIDATE;
>>+
>>+		ret = i915_vma_pin_ww(vma, &eb->ww, 0, 0, pin_flags);
>>+		if (ret)
>>+			break;
>>+
>>+		eb->args->flags |= __EXEC3_HAS_PIN;
>>+	}
>>+
>>+	return ret;
>>+}
>>+
>>  /*
>>   * Using two helper loops for the order of which requests / batches are created
>>   * and added the to backend. Requests are created in order from the parent to
>>@@ -160,13 +282,80 @@ static void eb_release_vma_all(struct i915_execbuffer *eb)
>>   */
>>  #define for_each_batch_create_order(_eb) \
>>  	for (unsigned int i = 0; i < (_eb)->num_batches; ++i)
>>+#define for_each_batch_add_order(_eb) \
>>+	for (int i = (_eb)->num_batches - 1; i >= 0; --i)
>>+
>>+static void __eb_persistent_add_shared_fence(struct drm_i915_gem_object *obj,
>>+					     struct dma_fence *fence)
>>+{
>>+	struct dma_fence *curr;
>>+	int idx;
>>+
>>+	dma_fence_array_for_each(curr, idx, fence)
>>+		dma_resv_add_fence(obj->base.resv, curr,
>>+				   DMA_RESV_USAGE_BOOKKEEP);
>>+
>>+	obj->write_domain = 0;
>>+	obj->read_domains |= I915_GEM_GPU_DOMAINS;
>>+	obj->mm.dirty = true;
>>+}
>>+
>>+static void eb_persistent_add_shared_fence(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	struct dma_fence *fence;
>>+	struct i915_vma *vma;
>>+
>>+	fence = eb->composite_fence ? eb->composite_fence :
>>+		&eb->requests[0]->fence;
>>+
>>+	__eb_persistent_add_shared_fence(vm->root_obj, fence);
>>+	list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
>>+			    non_priv_vm_bind_link)
>>+		__eb_persistent_add_shared_fence(vma->obj, fence);
>>+}
>>+
>>+static void eb_move_all_persistent_vma_to_active(struct i915_execbuffer *eb)
>>+{
>>+	/* Add fence to BOs dma-resv fence list */
>>+	eb_persistent_add_shared_fence(eb);
>>+}
>>  static int eb_move_to_gpu(struct i915_execbuffer *eb)
>>  {
>>+	struct i915_address_space *vm = eb->context->vm;
>>+	struct i915_vma *vma;
>>+	int err = 0;
>>+
>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>+	assert_object_held(vm->root_obj);
>>+
>>+	eb_move_all_persistent_vma_to_active(eb);
>>+
>>+	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
>>+		for_each_batch_add_order(eb) {
>>+			if (!eb->requests[i])
>>+				continue;
>>+
>>+			err = i915_request_await_bind(eb->requests[i], vma);
>>+			if (err)
>>+				goto err_skip;
>>+		}
>>+	}
>>+
>>  	/* Unconditionally flush any chipset caches (for streaming writes). */
>>  	intel_gt_chipset_flush(eb->gt);
>>  	return 0;
>>+
>>+err_skip:
>>+	for_each_batch_create_order(eb) {
>>+		if (!eb->requests[i])
>>+			break;
>>+
>>+		i915_request_set_error_once(eb->requests[i], err);
>>+	}
>>+	return err;
>>  }
>>  static int eb_request_submit(struct i915_execbuffer *eb,
>>@@ -483,6 +672,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>>  	mutex_lock(&eb.context->vm->vm_bind_lock);
>>+lookup_vmas:
>>  	err = eb_lookup_vma_all(&eb);
>>  	if (err) {
>>  		eb_release_vma_all(&eb);
>>@@ -499,6 +689,22 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>>  	/* only throttle once, even if we didn't need to throttle */
>>  	throttle = false;
>>+	err = eb_lock_vma_all(&eb);
>>+	if (err)
>>+		goto err_validate;
>>+
>>+	/**
>>+	 * No object unbinds possible once the objects are locked. So,
>>+	 * check for any unbinds here, which needs to be scooped up.
>>+	 */
>>+	if (!list_empty(&eb.context->vm->vm_rebind_list)) {
>>+		eb_release_vma_all(&eb);
>>+		i915_gem_ww_ctx_fini(&eb.ww);
>>+		goto lookup_vmas;
>>+	}
>
>Is it not possible to grab the object locks first, and then move stuff 
>off the rebind_list to be re-validated? Or if not maybe a comment to 
>explain?
>

We need to do the rebind_list scooping in lookup phase of the execbuf
path so that userptr_submit_init() can be called on them without
holding the object lock. Object locks are held during validation phase.
Ok, will add some documention where we invoke eb_scoop_unbound_vma_all().

Niranjana

>>+
>>+	err = eb_validate_persistent_vma_all(&eb);
>>+
>>  err_validate:
>>  	if (err == -EDEADLK) {
>>  		eb_release_vma_all(&eb);
