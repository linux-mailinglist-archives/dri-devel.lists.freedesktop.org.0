Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C42603921
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 07:18:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9D310F127;
	Wed, 19 Oct 2022 05:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CED510F127;
 Wed, 19 Oct 2022 05:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666156692; x=1697692692;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Ob8bRRDpAG8k7xzrIFtCun8kqjGdAn/wNPd8IMwPqWI=;
 b=fl9lbyLdJq5CyPDL7nLmnG/vb9AUFjfD6Qh1r3VWevUXerx3W2x1618f
 SkanLkAMiW33Zv539ZsXXgoi8ibAfr8UbXkQKqDYZPEMH5EmOEkOtu9DE
 lL1UjqxE511drmdYFwSr2U5Gobebg8/6O8NpGVd9z+f76Cifu1cC6GkvZ
 Er+GmLOL0VsvE68CpDzVZ4RabvvNQ2V6Y3rpHhUeXlyqJvzSq43GId250
 fGMjNs6iS4wv36GJhAiAyFZLnmAcfbXY8O78wnBJiM2xRKce42TfrcTlW
 hAFh/2s4f3vaOjtOavIOfUrZd5heieZQHJUleOnNvs3eyH5qz5nygOmbo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="305043696"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="305043696"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 22:18:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="804112479"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="804112479"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga005.jf.intel.com with ESMTP; 18 Oct 2022 22:18:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 22:18:10 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 22:18:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 18 Oct 2022 22:18:09 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 18 Oct 2022 22:18:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPS06TAswpEoaaplUl0jcA7y1x8oN4cpsz3r4tzJeyjjUjsYTfIBVtk3jYMCONnfu2UpvsNPAU4duxOl8hR3ZkOhmtggbyBQHhcq9o08T2KlSBZMTQHnQyOuyfAvQZiv8SpOHCl+4vHyTnncC5rBtpvTAnXSBFQrBgZk4+E0vI1RdGvtV8ey+3YqBp1ewhRp+DwOpSeFP5czKuApGjwYuxuMJQxty6qKNmhvoj0lQp4UDOL4zqBIQySFvsiEyix2IKRxqKM1Cn9yzZgRqlOjQl0GnoyHsqnXhuZVhQok8o3KyNyGUnq3bAZmxm6O5qxO2a/VwvHasCDo0F/VnWFiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYdfBS0Mpe41jrb5sggtwzAw6M0ttUWtO6kS3dc9Ov4=;
 b=D4qxHWMDL0oaKN7xOda1COheg8XmwpzMVNuzHUybtL5koD4lZHkxErpB8Ibi7TzKWK5tpAly4NP/qKUyc9t6bC7u9vaafIZOGGsVcME/t+z43Rpqd4sEZrwnfJwfqc+m5ChYF9Mq7zQumIJVEV2MU+7vpMFa1Fa6VD/XwwKBHgD9yNqmhcxOUUHxNouOinvjqtNkKO+8Xs2J5oDNC/XBI+xn/8YeYjps9MAssUr9RbjWmk25H5X4sk2QCjnf00IBJsEF98PXIs0J2BxElpJkLw1sdQHD0UAnksmiFH5afi/EPuRSM4wRWBTV2XCe5zLxNtlM7XHUQZdv0oD71SyFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.33; Wed, 19 Oct
 2022 05:18:06 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 05:18:06 +0000
Date: Tue, 18 Oct 2022 22:17:56 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH v4 15/17] drm/i915/vm_bind: Handle persistent
 vmas in execbuf3
Message-ID: <Y0+IhCIUJYJXVPJc@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-16-niranjana.vishwanathapura@intel.com>
 <a3e3ddb4-b41d-70f5-cda4-082e9e61b62f@intel.com>
 <Y08KdqpguNKmVNz3@nvishwa1-DESK>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y08KdqpguNKmVNz3@nvishwa1-DESK>
X-ClientProxiedBy: BYAPR08CA0018.namprd08.prod.outlook.com
 (2603:10b6:a03:100::31) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SN7PR11MB7566:EE_
X-MS-Office365-Filtering-Correlation-Id: a39610b5-d920-42af-f1fd-08dab1914dfc
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1wGEfYdq4TJpCWNqDUwJypJNp7BJJYswlEbRLuwdT9wv0h9l0n/MQBv/PZW2PSeT9hgjYicg2LNvpNre1qp4UnCe8fOuNwJTaZ+yKqutC4azGF/d3vZSo5TEoLz4X8f8pu221lLDPS8r4GZmA0ehDRp42bHkG+S5xnhkjK7RHBbkNUVdQ+3b5ds4je233FOujo+DH02E2VYgbtFaqpK+tFlkTTcBQe8xQrWRmF1AnWsmQcZUpVJD7dmNnin/YMIy4BRgxkhge4les8X8w1keLQxVzSge0LLrrikJzv9YDJur0PCDz9X3DneuqWH2lF84k2zRyuN0ir/jJYLLL4gDCFEluNmc9WL48Nu38CW+Tt9OJs3ZKi2AFVBkL0RGa7xmF5E1Kq7EwrsGpGdNvAAi2iINabOSPCfskn9PZzwstgRpVw9PBPf05DdZ+/kOJCwQ4M2RZDV5XW1EqRbsDCG9X7rO+eCepCOpgmAx9mEvKVlDO7jPsWMJw89FDpW0VnS/Frm0ATC/c/F9hSJNMg2aEmuNbJAZ8ABsF+ngKsImCcdhhxjjkz6UcazPEkz3qam2ISxWhW3vLGNAUQCwD+2q11E1MYz/eBSPY8Q5ZUPOEsCnKTRKqULpYbKHuv/jgoQCrfru0w2nZnjo1PFgojSE5sV2DM8nMi4DxeQD/eVpxwwW0IUJrjuWxg4I1Q/9E2swRrO11SfmXJvVpNOE2d7WWmTSKuGeS3TgzW9JlEpiphT/g+aGbLoI8KxeNd7Cv/Km
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(396003)(366004)(376002)(39860400002)(136003)(451199015)(6666004)(33716001)(6862004)(41300700001)(6506007)(8936002)(478600001)(4326008)(8676002)(66946007)(316002)(6486002)(66476007)(38100700002)(186003)(86362001)(82960400001)(9686003)(26005)(83380400001)(6636002)(6512007)(44832011)(2906002)(5660300002)(66556008)(30864003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6VKdlKahH7FhpHHuQy7OEz0fpEzkXzFqeui+V0Si9R6AFvpCnP1C3Om7H9?=
 =?iso-8859-1?Q?jUAs3ffJrfDd2nBMDJ3pAgw0MkSP9Fn10tw2sp6TNlAZrQ+75OeKtm3rA5?=
 =?iso-8859-1?Q?BzzIZsqthT8gz03Xffqfe1vmmE8/KWuuBFdMyIoOJDR4ZX/jjh6cfkFhZy?=
 =?iso-8859-1?Q?yrj4d0lelZYiwre0uiFBnZpb7wdF4BRq7e3TEDzYb90JGIIjbr5YDipgEv?=
 =?iso-8859-1?Q?Rzi/HXU9QvkYFrQjS7kZHlu65uSGBknBACLvOo4430tS0Cg7GwceRAwLG1?=
 =?iso-8859-1?Q?4JRtDiEblGxSEifGF6qUu/MZD/jqdjRFx+qPv2SBFMBk0ZYGKhvi3AbXXl?=
 =?iso-8859-1?Q?XN7GHTEY+tBth+nN4Hnn/lt5eLbrFOexdj4nOGGH0uHVNwW6/W9NMKwcxq?=
 =?iso-8859-1?Q?VpSYA0NyC6WVpFOBmhk2UN6XWaBL8/OFJDMCSAb3m02aAjoCpm6oQ6/Hqd?=
 =?iso-8859-1?Q?bSrIde90FE+E3NaOEwgbNf2kolTQbV+an3RuScZeoMBGVBv2L0N/5WWFpA?=
 =?iso-8859-1?Q?z7RwaxTQw6r2qKI92tKgHbspFTNr0IyHPSqdaD2o/35yw54hTPrWPjWpWL?=
 =?iso-8859-1?Q?i8t8A0vQbE4DlILAO4XQt1jw47P9SRcJ5bg/C9+RVkMhsteqtYOnA0Pc22?=
 =?iso-8859-1?Q?hw8dIngDIp6UtO5ZlDDMfunUKCKJrqiZ2MFjz8OioDttUJmhg1GCejgxqJ?=
 =?iso-8859-1?Q?jlkdCCcylT13fp8Dd2+cjdHKGKejRg33aSM1MQFLDkPI8cTVedWu2amKTt?=
 =?iso-8859-1?Q?p7JKROYUwXLgOxdapt8mGsMY8/2R28hIb/hj+qZCDTxqUDOrEFU/fQcItm?=
 =?iso-8859-1?Q?Jvp8tKjcU7b6lOton9GuTWaMHb5p+c5/5eRz2g3nYbmp+BYUT4EiFzWiTv?=
 =?iso-8859-1?Q?fMozLlg82KlLbZr6i0DcFQNM8RoJMQTgu9FweFFLP9dsgisqxTKFe3RkMv?=
 =?iso-8859-1?Q?nwSq0t9n5JMXg7xcNnEUG9OtoX11OFluk5ROMtTbLwTLX4fsrDvNFkZgcM?=
 =?iso-8859-1?Q?wQ5aNEiluZvowivGEw1b8usLKvjcJf/pzGBERE9YBSHsm2icttIof3HDVk?=
 =?iso-8859-1?Q?sH/LrGparu79d4a8dDQS6gR0BwrIMQ+NV/bmW3VLdPuFgoHlodElYwY7GV?=
 =?iso-8859-1?Q?F93bgcQfxHTy52EiQkB4Xgz8lC7g2KC2Q/Gge6gMfhJGAu0joi36/fOPi8?=
 =?iso-8859-1?Q?jISWH6EevVLjWgeDlAse3kWw/4MHbD1bCsp+kQLPdwDDY+7hF9X5Vz12+z?=
 =?iso-8859-1?Q?vIBNzx4YqzJGfI+OXfCGgJaHP/HLK+9p+Tl/M7Hsh6jFjWk/1yuUdWK3fS?=
 =?iso-8859-1?Q?rdaev/k1hw0/8ltemdwguuMTMdHa1NJQpaMtD3m36Ayz81OPpIva5BXpEj?=
 =?iso-8859-1?Q?649OD/19PAHLGDOPMHpnOEdtjzZwbJ1w84yAy/LL3Lywwh+KyRRr5f0OKw?=
 =?iso-8859-1?Q?B5CMdbiTFK5i5kyWk4HZidvFBKCwkyAmmbh+xwzEDA9Qe7FYIYtLUbAjB2?=
 =?iso-8859-1?Q?BfYmkX0jDJgYRWut8XagghspMm59H6yGz1F1MmunGhXVjmsrg2M0Ft6LrK?=
 =?iso-8859-1?Q?F4dKR+44VaaBttF7jsFOdqhpoQx+Nos8JM+e9oxCoGjWqjuNaknDb0T75U?=
 =?iso-8859-1?Q?JPPsPTX4UvTep3CmHxY08hBDPYGAOwaM+D6RYSiysbJruCv4lj8bzekXb6?=
 =?iso-8859-1?Q?i4nNQpuW3qi371nlWgw=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a39610b5-d920-42af-f1fd-08dab1914dfc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 05:18:06.4861 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1IvEO3X1dgBny6nKtz4PgZA5lJ/0cBwtuiVFq/e9euPX6dIbla9sEQgMeuEYSx8qbxQcpShlkNaunmj/XN5ZqhiybGZa7pWLElc+6wwwj41nmElhj/I0IsPqRbNzOFrN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7566
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
Cc: paulo.r.zanoni@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 18, 2022 at 01:20:06PM -0700, Niranjana Vishwanathapura wrote:
>On Tue, Oct 18, 2022 at 07:01:57PM +0100, Matthew Auld wrote:
>>On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
>>>Handle persistent (VM_BIND) mappings during the request submission
>>>in the execbuf3 path.
>>>
>>>v2: Ensure requests wait for bindings to complete.
>>>v3: Remove short term pinning with PIN_VALIDATE flag.
>>>    Individualize fences before adding to dma_resv obj.
>>>
>>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>---
>>> .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 208 +++++++++++++++++-
>>> 1 file changed, 207 insertions(+), 1 deletion(-)
>>>
>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>>index a9b4cc44bf66..8120e4c6b7da 100644
>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>>@@ -3,6 +3,7 @@
>>>  * Copyright © 2022 Intel Corporation
>>>  */
>>>+#include <linux/dma-fence-array.h>
>>> #include <linux/dma-resv.h>
>>> #include <linux/uaccess.h>
>>>@@ -19,6 +20,7 @@
>>> #include "i915_gem_vm_bind.h"
>>> #include "i915_trace.h"
>>>+#define __EXEC3_HAS_PIN			BIT_ULL(33)
>>> #define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
>>> #define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
>>>@@ -42,7 +44,9 @@
>>>  * execlist. Hence, no support for implicit sync.
>>>  *
>>>  * The new execbuf3 ioctl only works in VM_BIND mode and the VM_BIND mode only
>>>- * works with execbuf3 ioctl for submission.
>>>+ * works with execbuf3 ioctl for submission. All BOs mapped on that VM (through
>>>+ * VM_BIND call) at the time of execbuf3 call are deemed required for that
>>>+ * submission.
>>>  *
>>>  * The execbuf3 ioctl directly specifies the batch addresses instead of as
>>>  * object handles as in execbuf2 ioctl. The execbuf3 ioctl will also not
>>>@@ -58,6 +62,13 @@
>>>  * So, a lot of code supporting execbuf2 ioctl, like relocations, VA evictions,
>>>  * vma lookup table, implicit sync, vma active reference tracking etc., are not
>>>  * applicable for execbuf3 ioctl.
>>>+ *
>>>+ * During each execbuf submission, request fence is added to all VM_BIND mapped
>>>+ * objects with DMA_RESV_USAGE_BOOKKEEP. The DMA_RESV_USAGE_BOOKKEEP usage will
>>>+ * prevent over sync (See enum dma_resv_usage). Note that DRM_I915_GEM_WAIT and
>>>+ * DRM_I915_GEM_BUSY ioctls do not check for DMA_RESV_USAGE_BOOKKEEP usage and
>>>+ * hence should not be used for end of batch check. Instead, the execbuf3
>>>+ * timeline out fence should be used for end of batch check.
>>>  */
>>> /**
>>>@@ -127,6 +138,23 @@ eb_find_vma(struct i915_address_space *vm, u64 addr)
>>> 	return i915_gem_vm_bind_lookup_vma(vm, va);
>>> }
>>>+static void eb_scoop_unbound_vma_all(struct i915_address_space *vm)
>>>+{
>>>+	struct i915_vma *vma, *vn;
>>>+
>>>+	/**
>>>+	 * Move all unbound vmas back into vm_bind_list so that they are
>>>+	 * revalidated.
>>>+	 */
>>>+	spin_lock(&vm->vm_rebind_lock);
>>>+	list_for_each_entry_safe(vma, vn, &vm->vm_rebind_list, vm_rebind_link) {
>>>+		list_del_init(&vma->vm_rebind_link);
>>>+		if (!list_empty(&vma->vm_bind_link))
>>>+			list_move_tail(&vma->vm_bind_link, &vm->vm_bind_list);
>>>+	}
>>>+	spin_unlock(&vm->vm_rebind_lock);
>>>+}
>>>+
>>> static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>>> {
>>> 	unsigned int i, current_batch = 0;
>>>@@ -141,14 +169,108 @@ static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>>> 		++current_batch;
>>> 	}
>>>+	eb_scoop_unbound_vma_all(eb->context->vm);
>>>+
>>>+	return 0;
>>>+}
>>>+
>>>+static int eb_lock_vma_all(struct i915_execbuffer *eb)
>>>+{
>>>+	struct i915_address_space *vm = eb->context->vm;
>>>+	struct i915_vma *vma;
>>>+	int err;
>>>+
>>>+	err = i915_gem_object_lock(eb->context->vm->root_obj, &eb->ww);
>>>+	if (err)
>>>+		return err;
>>>+
>>>+	list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
>>>+			    non_priv_vm_bind_link) {
>>>+		err = i915_gem_object_lock(vma->obj, &eb->ww);
>>>+		if (err)
>>>+			return err;
>>>+	}
>>>+
>>> 	return 0;
>>> }
>>>+static void eb_release_persistent_vma_all(struct i915_execbuffer *eb)
>>>+{
>>>+	struct i915_address_space *vm = eb->context->vm;
>>>+	struct i915_vma *vma, *vn;
>>>+
>>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>>+
>>>+	if (!(eb->args->flags & __EXEC3_HAS_PIN))
>>>+		return;
>>>+
>>>+	assert_object_held(vm->root_obj);
>>>+
>>>+	list_for_each_entry_safe(vma, vn, &vm->vm_bind_list, vm_bind_link)
>>>+		if (i915_vma_verify_bind_complete(vma))
>>>+			list_move_tail(&vma->vm_bind_link, &vm->vm_bound_list);
>>>+
>>>+	eb->args->flags &= ~__EXEC3_HAS_PIN;
>>>+}
>>>+
>>> static void eb_release_vma_all(struct i915_execbuffer *eb)
>>> {
>>>+	eb_release_persistent_vma_all(eb);
>>> 	eb_unpin_engine(eb);
>>> }
>>>+static int eb_reserve_fence_for_persistent_vma_all(struct i915_execbuffer *eb)
>>>+{
>>>+	struct i915_address_space *vm = eb->context->vm;
>>>+	u64 num_fences = 1;
>>>+	struct i915_vma *vma;
>>>+	int ret;
>>>+
>>>+	/* Reserve enough slots to accommodate composite fences */
>>>+	if (intel_context_is_parallel(eb->context))
>>>+		num_fences = eb->num_batches;
>>>+
>>>+	ret = dma_resv_reserve_fences(vm->root_obj->base.resv, num_fences);
>>>+	if (ret)
>>>+		return ret;
>>>+
>>>+	list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
>>>+			    non_priv_vm_bind_link) {
>>>+		ret = dma_resv_reserve_fences(vma->obj->base.resv, num_fences);
>>>+		if (ret)
>>>+			return ret;
>>>+	}
>>>+
>>>+	return 0;
>>>+}
>>>+
>>>+static int eb_validate_persistent_vma_all(struct i915_execbuffer *eb)
>>>+{
>>>+	struct i915_address_space *vm = eb->context->vm;
>>>+	struct i915_vma *vma;
>>>+	int ret = 0;
>>>+
>>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>>+	assert_object_held(vm->root_obj);
>>>+
>>>+	ret = eb_reserve_fence_for_persistent_vma_all(eb);
>>>+	if (ret)
>>>+		return ret;
>>>+
>>>+	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
>>>+		u64 pin_flags = vma->start | PIN_OFFSET_FIXED |
>>>+				PIN_USER | PIN_VALIDATE;
>>>+
>>>+		ret = i915_vma_pin_ww(vma, &eb->ww, 0, 0, pin_flags);
>>>+		if (ret)
>>>+			break;
>>>+
>>>+		eb->args->flags |= __EXEC3_HAS_PIN;
>>>+	}
>>>+
>>>+	return ret;
>>>+}
>>>+
>>> /*
>>>  * Using two helper loops for the order of which requests / batches are created
>>>  * and added the to backend. Requests are created in order from the parent to
>>>@@ -160,13 +282,80 @@ static void eb_release_vma_all(struct i915_execbuffer *eb)
>>>  */
>>> #define for_each_batch_create_order(_eb) \
>>> 	for (unsigned int i = 0; i < (_eb)->num_batches; ++i)
>>>+#define for_each_batch_add_order(_eb) \
>>>+	for (int i = (_eb)->num_batches - 1; i >= 0; --i)
>>>+
>>>+static void __eb_persistent_add_shared_fence(struct drm_i915_gem_object *obj,
>>>+					     struct dma_fence *fence)
>>>+{
>>>+	struct dma_fence *curr;
>>>+	int idx;
>>>+
>>>+	dma_fence_array_for_each(curr, idx, fence)
>>>+		dma_resv_add_fence(obj->base.resv, curr,
>>>+				   DMA_RESV_USAGE_BOOKKEEP);
>>>+
>>>+	obj->write_domain = 0;
>>>+	obj->read_domains |= I915_GEM_GPU_DOMAINS;
>>>+	obj->mm.dirty = true;
>>>+}
>>>+
>>>+static void eb_persistent_add_shared_fence(struct i915_execbuffer *eb)
>>>+{
>>>+	struct i915_address_space *vm = eb->context->vm;
>>>+	struct dma_fence *fence;
>>>+	struct i915_vma *vma;
>>>+
>>>+	fence = eb->composite_fence ? eb->composite_fence :
>>>+		&eb->requests[0]->fence;
>>>+
>>>+	__eb_persistent_add_shared_fence(vm->root_obj, fence);
>>>+	list_for_each_entry(vma, &vm->non_priv_vm_bind_list,
>>>+			    non_priv_vm_bind_link)
>>>+		__eb_persistent_add_shared_fence(vma->obj, fence);
>>>+}
>>>+
>>>+static void eb_move_all_persistent_vma_to_active(struct i915_execbuffer *eb)
>>>+{
>>>+	/* Add fence to BOs dma-resv fence list */
>>>+	eb_persistent_add_shared_fence(eb);
>>>+}
>>> static int eb_move_to_gpu(struct i915_execbuffer *eb)
>>> {
>>>+	struct i915_address_space *vm = eb->context->vm;
>>>+	struct i915_vma *vma;
>>>+	int err = 0;
>>>+
>>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>>+	assert_object_held(vm->root_obj);
>>>+
>>>+	eb_move_all_persistent_vma_to_active(eb);
>>>+
>>>+	list_for_each_entry(vma, &vm->vm_bind_list, vm_bind_link) {
>>>+		for_each_batch_add_order(eb) {
>>>+			if (!eb->requests[i])
>>>+				continue;
>>>+
>>>+			err = i915_request_await_bind(eb->requests[i], vma);
>>>+			if (err)
>>>+				goto err_skip;
>>>+		}
>>>+	}
>>>+
>>> 	/* Unconditionally flush any chipset caches (for streaming writes). */
>>> 	intel_gt_chipset_flush(eb->gt);
>>> 	return 0;
>>>+
>>>+err_skip:
>>>+	for_each_batch_create_order(eb) {
>>>+		if (!eb->requests[i])
>>>+			break;
>>>+
>>>+		i915_request_set_error_once(eb->requests[i], err);
>>>+	}
>>>+	return err;
>>> }
>>> static int eb_request_submit(struct i915_execbuffer *eb,
>>>@@ -483,6 +672,7 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>>> 	mutex_lock(&eb.context->vm->vm_bind_lock);
>>>+lookup_vmas:
>>> 	err = eb_lookup_vma_all(&eb);
>>> 	if (err) {
>>> 		eb_release_vma_all(&eb);
>>>@@ -499,6 +689,22 @@ i915_gem_do_execbuffer(struct drm_device *dev,
>>> 	/* only throttle once, even if we didn't need to throttle */
>>> 	throttle = false;
>>>+	err = eb_lock_vma_all(&eb);
>>>+	if (err)
>>>+		goto err_validate;
>>>+
>>>+	/**
>>>+	 * No object unbinds possible once the objects are locked. So,
>>>+	 * check for any unbinds here, which needs to be scooped up.
>>>+	 */
>>>+	if (!list_empty(&eb.context->vm->vm_rebind_list)) {
>>>+		eb_release_vma_all(&eb);
>>>+		i915_gem_ww_ctx_fini(&eb.ww);
>>>+		goto lookup_vmas;
>>>+	}
>>
>>Is it not possible to grab the object locks first, and then move 
>>stuff off the rebind_list to be re-validated? Or if not maybe a 
>>comment to explain?
>>
>
>We need to do the rebind_list scooping in lookup phase of the execbuf
>path so that userptr_submit_init() can be called on them without
>holding the object lock. Object locks are held during validation phase.
>Ok, will add some documention where we invoke eb_scoop_unbound_vma_all().
>

Hmm...seems bit more complicated than that. For userptr, we have separate
userptr_invalidated_list. So, probably rebind_list can be scooped in the
validation phase under the object locks, unless there are other ways
the userptr objects gets unbound other than through mmu invalidation.

Niranjana

>Niranjana
>
>>>+
>>>+	err = eb_validate_persistent_vma_all(&eb);
>>>+
>>> err_validate:
>>> 	if (err == -EDEADLK) {
>>> 		eb_release_vma_all(&eb);
