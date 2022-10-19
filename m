Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FE36038CF
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 06:11:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B7410F0F9;
	Wed, 19 Oct 2022 04:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 090C310F0F9;
 Wed, 19 Oct 2022 04:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666152670; x=1697688670;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SqMSe5HMUhqYYPfL/L0O0sLGfDvZGy69F4Wms8uw9RE=;
 b=MWsVsqi2SDgnbEefxCLvg7QEeOjB+ikLisT4IdeOVv/4MIrFnDiVMHUS
 q6IZm/o5dtuRbflUGnjhvEyynLefTJ0ISWuhVH2yNY1PjlcNbV0Zr4DAe
 1l5DeNJYovuFF2Fq+OZOdD046x/jhq1my65NeMBFZ5qQHoxMxRmWdAMDj
 HUyInWMnDl7RamIy6fcTScdNucmu23BzXXTc9HBngqvo4l38FGQbOh2qm
 E/StnLCCMtkq+KhapERbjTy9b+fmIRpqgrg/H1Rf/E63gxUGGVs0a1jyw
 acI5/oZYiSAUI5xUt6L1F7RW3zPJR6INFd24LoXZEMleJfVaWxzi3yPEn A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="307409199"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="307409199"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 21:11:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="606886095"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="606886095"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 18 Oct 2022 21:11:08 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 21:11:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 21:11:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 18 Oct 2022 21:11:08 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 18 Oct 2022 21:11:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eoApkW1wubiLZKaIUsjns9RqAZlIOQO2yLnxaQAqBkk3+0IJnQRYkl73wz9cZEQHk1HD83p2r4cYgbTHZccm776SY5Xa8po0S1OG2Em3pUaebEKBJyxOvfj/zG6NzdWzgBPEI4ZkvNHOVWtFK5HmyAMfl3EQH6Fl3vLwUsTDWgG1dimkjSz5cZVPxsNgrSuOmn9kho8TV7QEdB6clBeAeGA0usZeBYdYzCdtUmLZ8UHPMSyX3rCRFw66inq7EATs9PJcVtDUVLSzFBMAaecuXYBkfIGKQCF65lQd9Fa/FaqspOy6noOPKdtrX2un1QWlogJLg/xnCimVcvNzsagq/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4sjjWsrC9dAWOabCnTO2ruTXUgupIKSV1QYRnas6jS4=;
 b=BoochJV4UnrZcjKy+lL468/+iyfPtre2GnNIGto9oFYhGlC2WXqltmH0BPreXVqNz0bA8lP7IHTQMibFCGDYVndVyWjZBz45fU4z8pKldcwAxQ0w8y8wwabBZuINy/7uCaaD0ROim8iHhsgB9ugffgQdR0d0BkGUKp42pIXKpdy/+KFhc2Ki/6FCRvqgk61fduNA/GoPC2Qy4mGetGw/8R/CHi19bI+vZKHFC/WVkJCvzUT42IDv+agFXmsTLFA2xyBfTALpl1mOt0lbL1EpJBSIhx4BEQoTT7SD476tdvIb7Q0eDZpsdFCprIEGA2Ho+la+1VAmt/buharx/ANnAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30; Wed, 19 Oct
 2022 04:11:05 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 04:11:05 +0000
Date: Tue, 18 Oct 2022 21:10:58 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 12/17] drm/i915/vm_bind: Implement
 I915_GEM_EXECBUFFER3 ioctl
Message-ID: <Y0940kuXg/3o5X7z@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-13-niranjana.vishwanathapura@intel.com>
 <5bc04ae0-7d25-1734-eefc-253be0c8e79c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5bc04ae0-7d25-1734-eefc-253be0c8e79c@intel.com>
X-ClientProxiedBy: BYAPR08CA0071.namprd08.prod.outlook.com
 (2603:10b6:a03:117::48) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SN7PR11MB6948:EE_
X-MS-Office365-Filtering-Correlation-Id: e95a0a91-e366-4a61-b5e5-08dab187f151
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cBsD1bXYLEB5f7y3rUze0VcNOWDNM89/4k2bXyiC9fOOBIZ7MMI4SXcy2GKHK/rAWlPOTUMZxQ7sKLnup0TZJ1yFCj2bwRu/uEcbUZemW4EkatcZzX5CL+dyVUB5YjlXiFyjXlNaYu1ZCVd5+Ls7H8zev3+EdJSGak8aqEjFvkpVt47Ta0ZIc5iTQlcelumlFYad2NdoiCMBoOr4V+Rw1ELVgigtxfT7jqwg/6SuwX4gImMnSQU/hFm73xJlWiQMm8BjF6XF52mAxxQSBpk/olg4LsG0mBxPbYKDPTuBCNBYFcHVaY/BTGJ4BhWJ+gP3r7svT8+o9TiMr/PMpt4zdttOj+oB2ftoI5fAWwNKMDWHEb+WoBIk4LIv0Y5X6o27gWmdp+MPdhH84xt14nlelE8HCBhFkghBKSueCBqS82lJw1sQL5gJBLii7gS7f/AwOhlDzbqTvvDZo6FUS/n7R++ZQpnYeuxfYHduXpyaqDvgUQLkxmi8zE5ve0hG9NASogaiIR84pSL2006lEFM5ITc53todD4651lLymWtAxseofFxsysqQzRpKFEaC3I7+/yYxNx2/PcHY7QbpNjVrx9PZI0Y09bYNgeYTakZMX7Ats7wzcdGbnmSosIwf2yuhH6IyNJajzo3Qh7voZuW/qVUZEk6aHfQ4XXYrD5izItXftLPv7qFM1xquItjS8hYH2TpLstY1+LXqm9U2DO+4pg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(376002)(346002)(39860400002)(396003)(366004)(451199015)(4326008)(30864003)(8676002)(6666004)(66476007)(66556008)(6636002)(6506007)(41300700001)(5660300002)(26005)(316002)(6512007)(9686003)(86362001)(8936002)(6862004)(83380400001)(2906002)(33716001)(82960400001)(186003)(38100700002)(66946007)(6486002)(44832011)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?KZn2zVcsp47NfLS2inFGLZrfV851qTFIub1RZW77qMABsUVyO4Kc4FzlgO?=
 =?iso-8859-1?Q?a/3wPPkea2jimhORL1nDutc09JzQVVMKQIXkIwAlaIIcBCw7vKKjx5Y5Ic?=
 =?iso-8859-1?Q?kWd4+kAfy2FnM4nufFGfWb35idei9RcbOMU4gE7gsaR6JsASqIJfxBp6Ye?=
 =?iso-8859-1?Q?m5Qu4OdNgrDC3josnZGBj/+SHuTse2cbJSgKzNBsl3AA1Kxp7/2gP6/XQs?=
 =?iso-8859-1?Q?ITCgF+ChLBlCMQuf5NfMMSGAE4Ty9r1zJMvtATR/aTqL7zjCRzynUMuxCg?=
 =?iso-8859-1?Q?bx6zV/d80nkKbD07/pp9Rg0p5C5oviqsC6oe/VqGfajLJFGuXmJMOxawGK?=
 =?iso-8859-1?Q?ftm4EFu49FN519FkQEH1XdoJN0BH5+FeJeAqcCRiytfpoJVn2vRFHqSSiA?=
 =?iso-8859-1?Q?QEpUHzAReeANAYv5XGQQ/Vlq2pxMgVg+YIyuUdxzYSaprC0YHu3MA1/WmA?=
 =?iso-8859-1?Q?6ACJUNY5CgqaC4+l4KSNpGjkWOirnxdSfMpo2jYH19rBhFVU7bG98KBDu0?=
 =?iso-8859-1?Q?wV4pIWXxrQwIjK/6PA9Cn6rld9Byv7Qhari+0X2ZHG5kpj8mz0j8dj67+g?=
 =?iso-8859-1?Q?eVEG18wS6qaoRu9bGz2tK+iuJ9YhapyIhiMiJHn2YJLINuDufSnFbccF4d?=
 =?iso-8859-1?Q?COeuDMi6dx0DbClynz0qXiVZ0284l1Lb8/Lns3h8E2Apg3wP0s4zvBI72B?=
 =?iso-8859-1?Q?4bo0qLrYI3AbDM41TRfu4AQhIza7sWUl2LLgqo8RD/wjUw76jXH1WL5Vml?=
 =?iso-8859-1?Q?N0eC/y+lynpU47XrbD/NxoSBQxWC1ie+lSuznWWapO9NBkn+Wpb7RcotRW?=
 =?iso-8859-1?Q?w1+dKP55FrQtKy3Ncq/mjnAx33rR5IBJKnR6F67e2M/pvaZ2Uk8YpMz+M9?=
 =?iso-8859-1?Q?otCvw+ntv/zIc8cWBweKgCbaoD2DDPJvcprkMD4VEVkxu7X7I+CVYZY18e?=
 =?iso-8859-1?Q?uvd0GSx1MEhLZ1dEmM6MWidRqUVEuK0qJ6uHEQnfv9sO9WgksDyt2etrEN?=
 =?iso-8859-1?Q?I7m+sQITRqJbdryuFtNAuxcSou7uTdo+tDzhlgBFUoa0L1CuTgRr/KgZDv?=
 =?iso-8859-1?Q?6TeZ1qNZv0EuZJBcXcc5A5G6oLa/wy5y8nVoSozFV2V/FmqDX9WVr9BMaG?=
 =?iso-8859-1?Q?uOl7R8d9vmx64J22kSfjXK1KgvqtfKpjKYrTP2G6zkhfgzscu9GbNGqZv2?=
 =?iso-8859-1?Q?60/+DcB6rx8gPzRE8N54m+c65XnoZMLTK5YsQL26u5c5CjjkQy7aTXRINN?=
 =?iso-8859-1?Q?aC5NhIBiNOhx51VEL9n6xrnEoZEkgrwG2a0RrPyeFwW52DoxJAnDUWrXfc?=
 =?iso-8859-1?Q?Q36RLXmX3FAlO3mZYHYKrjiqhGaVcIfFR8YcqkzkwEuqExzBz6CX4QxGx8?=
 =?iso-8859-1?Q?dQWjJTH7WWyfOofq5de0pZvXkIfEapMKDqDYTIr6BN4KiKXulNc9LWack+?=
 =?iso-8859-1?Q?+buSM7CnLSIUi36yWIcV7NWlmqsalSrR+SYnonGjnMua0lH4+lmDIVP0Hq?=
 =?iso-8859-1?Q?VHHs13bivlDuSZFYHxT222d60FCVvHO3TZzf2wJeeqTcG/mi+RyrZy9rfL?=
 =?iso-8859-1?Q?MxumLrwRPMwiOGRuLwjHeJ9jUjgAyMtX0xpPGsAFv5NuS05Cw780ubiUri?=
 =?iso-8859-1?Q?q1i0RIjSHvM+ki+70QXXea+u+9eZsfJigL3l4SgdZnBPdsPnU8pzL2r3MF?=
 =?iso-8859-1?Q?2wNuOp8x2hxGFFvnI40=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e95a0a91-e366-4a61-b5e5-08dab187f151
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 04:11:05.4805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QT//5aV5F+mCMOP8/858wvzuW2a0SPcPOvTVozpJUwBYKAkGsteJzCzQUsq6vQbATH5hxRCsVtTk0AAAS+p1BS+5JFdTzZWnvJMtleghS+fDVIJoSwIhaSyNB/ExJJa5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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

On Tue, Oct 18, 2022 at 06:30:58PM +0100, Matthew Auld wrote:
>On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
>>Implement new execbuf3 ioctl (I915_GEM_EXECBUFFER3) which only
>>works in vm_bind mode. The vm_bind mode only works with
>>this new execbuf3 ioctl.
>>
>>The new execbuf3 ioctl will not have any list of objects to validate
>>bind as all required objects binding would have been requested by the
>>userspace before submitting the execbuf3.
>>
>>Legacy features like relocations etc are not supported by execbuf3.
>>
>>v2: Add more input validity checks.
>>v3: batch_address is a VA (not an array) if num_batches=1,
>>     minor cleanup
>>v4: replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode()
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  drivers/gpu/drm/i915/Makefile                 |   1 +
>>  .../gpu/drm/i915/gem/i915_gem_execbuffer3.c   | 580 ++++++++++++++++++
>>  drivers/gpu/drm/i915/gem/i915_gem_ioctls.h    |   2 +
>>  drivers/gpu/drm/i915/i915_driver.c            |   1 +
>>  include/uapi/drm/i915_drm.h                   |  61 ++
>>  5 files changed, 645 insertions(+)
>>  create mode 100644 drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>
>>diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>>index 8d76bb888dc3..6a801684d569 100644
>>--- a/drivers/gpu/drm/i915/Makefile
>>+++ b/drivers/gpu/drm/i915/Makefile
>>@@ -150,6 +150,7 @@ gem-y += \
>>  	gem/i915_gem_domain.o \
>>  	gem/i915_gem_execbuffer_common.o \
>>  	gem/i915_gem_execbuffer.o \
>>+	gem/i915_gem_execbuffer3.o \
>>  	gem/i915_gem_internal.o \
>>  	gem/i915_gem_object.o \
>>  	gem/i915_gem_lmem.o \
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>new file mode 100644
>>index 000000000000..a9b4cc44bf66
>>--- /dev/null
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer3.c
>>@@ -0,0 +1,580 @@
>>+// SPDX-License-Identifier: MIT
>>+/*
>>+ * Copyright © 2022 Intel Corporation
>>+ */
>>+
>>+#include <linux/dma-resv.h>
>>+#include <linux/uaccess.h>
>>+
>>+#include <drm/drm_syncobj.h>
>>+
>>+#include "gt/intel_context.h"
>>+#include "gt/intel_gpu_commands.h"
>>+#include "gt/intel_gt.h"
>>+
>>+#include "i915_drv.h"
>>+#include "i915_gem_context.h"
>>+#include "i915_gem_execbuffer_common.h"
>>+#include "i915_gem_ioctls.h"
>>+#include "i915_gem_vm_bind.h"
>>+#include "i915_trace.h"
>>+
>>+#define __EXEC3_ENGINE_PINNED		BIT_ULL(32)
>>+#define __EXEC3_INTERNAL_FLAGS		(~0ull << 32)
>>+
>>+/* Catch emission of unexpected errors for CI! */
>>+#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM)
>>+#undef EINVAL
>>+#define EINVAL ({ \
>>+	DRM_DEBUG_DRIVER("EINVAL at %s:%d\n", __func__, __LINE__); \
>>+	22; \
>>+})
>>+#endif
>>+
>>+/**
>>+ * DOC: User command execution with execbuf3 ioctl
>>+ *
>>+ * A VM in VM_BIND mode will not support older execbuf mode of binding.
>>+ * The execbuf ioctl handling in VM_BIND mode differs significantly from the
>>+ * older execbuf2 ioctl (See struct drm_i915_gem_execbuffer2).
>>+ * Hence, a new execbuf3 ioctl has been added to support VM_BIND mode. (See
>>+ * struct drm_i915_gem_execbuffer3). The execbuf3 ioctl will not accept any
>>+ * execlist. Hence, no support for implicit sync.
>>+ *
>>+ * The new execbuf3 ioctl only works in VM_BIND mode and the VM_BIND mode only
>>+ * works with execbuf3 ioctl for submission.
>>+ *
>>+ * The execbuf3 ioctl directly specifies the batch addresses instead of as
>>+ * object handles as in execbuf2 ioctl. The execbuf3 ioctl will also not
>>+ * support many of the older features like in/out/submit fences, fence array,
>>+ * default gem context etc. (See struct drm_i915_gem_execbuffer3).
>>+ *
>>+ * In VM_BIND mode, VA allocation is completely managed by the user instead of
>>+ * the i915 driver. Hence all VA assignment, eviction are not applicable in
>>+ * VM_BIND mode. Also, for determining object activeness, VM_BIND mode will not
>>+ * be using the i915_vma active reference tracking. It will instead check the
>>+ * dma-resv object's fence list for that.
>>+ *
>>+ * So, a lot of code supporting execbuf2 ioctl, like relocations, VA evictions,
>>+ * vma lookup table, implicit sync, vma active reference tracking etc., are not
>>+ * applicable for execbuf3 ioctl.
>>+ */
>>+
>>+/**
>>+ * struct i915_execbuffer - execbuf struct for execbuf3
>>+ * @i915: reference to the i915 instance we run on
>>+ * @file: drm file reference
>>+ * args: execbuf3 ioctl structure
>>+ * @gt: reference to the gt instance ioctl submitted for
>>+ * @context: logical state for the request
>>+ * @gem_context: callers context
>>+ * @requests: requests to be build
>>+ * @composite_fence: used for excl fence in dma_resv objects when > 1 BB submitted
>>+ * @ww: i915_gem_ww_ctx instance
>>+ * @num_batches: number of batches submitted
>>+ * @batch_addresses: addresses corresponds to the submitted batches
>>+ * @batches: references to the i915_vmas corresponding to the batches
>>+ */
>>+struct i915_execbuffer {
>>+	struct drm_i915_private *i915;
>>+	struct drm_file *file;
>>+	struct drm_i915_gem_execbuffer3 *args;
>>+
>>+	struct intel_gt *gt;
>>+	struct intel_context *context;
>>+	struct i915_gem_context *gem_context;
>>+
>>+	struct i915_request *requests[MAX_ENGINE_INSTANCE + 1];
>>+	struct dma_fence *composite_fence;
>>+
>>+	struct i915_gem_ww_ctx ww;
>>+
>>+	unsigned int num_batches;
>>+	u64 batch_addresses[MAX_ENGINE_INSTANCE + 1];
>>+	struct i915_vma *batches[MAX_ENGINE_INSTANCE + 1];
>>+
>>+	struct eb_fence *fences;
>>+	u64 num_fences;
>>+};
>>+
>>+static void eb_unpin_engine(struct i915_execbuffer *eb);
>>+
>>+static int eb_select_context(struct i915_execbuffer *eb)
>>+{
>>+	struct i915_gem_context *ctx;
>>+
>>+	ctx = i915_gem_context_lookup(eb->file->driver_priv, eb->args->ctx_id);
>>+	if (IS_ERR(ctx))
>>+		return PTR_ERR(ctx);
>>+
>>+	if (!i915_gem_vm_is_vm_bind_mode(ctx->vm)) {
>>+		i915_gem_context_put(ctx);
>>+		return -EOPNOTSUPP;
>>+	}
>>+
>>+	eb->gem_context = ctx;
>>+	return 0;
>>+}
>>+
>>+static struct i915_vma *
>>+eb_find_vma(struct i915_address_space *vm, u64 addr)
>>+{
>>+	u64 va;
>>+
>>+	lockdep_assert_held(&vm->vm_bind_lock);
>>+
>>+	va = gen8_noncanonical_addr(addr & PIN_OFFSET_MASK);
>>+	return i915_gem_vm_bind_lookup_vma(vm, va);
>>+}
>>+
>>+static int eb_lookup_vma_all(struct i915_execbuffer *eb)
>>+{
>>+	unsigned int i, current_batch = 0;
>>+	struct i915_vma *vma;
>>+
>>+	for (i = 0; i < eb->num_batches; i++) {
>>+		vma = eb_find_vma(eb->context->vm, eb->batch_addresses[i]);
>>+		if (!vma)
>>+			return -EINVAL;
>>+
>>+		eb->batches[current_batch] = vma;
>>+		++current_batch;
>
>current_batch == i ?

Yah, bad porting from eb2, will fix.

>
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static void eb_release_vma_all(struct i915_execbuffer *eb)
>>+{
>>+	eb_unpin_engine(eb);
>>+}
>>+
>>+/*
>>+ * Using two helper loops for the order of which requests / batches are created
>>+ * and added the to backend. Requests are created in order from the parent to
>>+ * the last child. Requests are added in the reverse order, from the last child
>>+ * to parent. This is done for locking reasons as the timeline lock is acquired
>>+ * during request creation and released when the request is added to the
>>+ * backend. To make lockdep happy (see intel_context_timeline_lock) this must be
>>+ * the ordering.
>>+ */
>>+#define for_each_batch_create_order(_eb) \
>>+	for (unsigned int i = 0; i < (_eb)->num_batches; ++i)
>>+
>>+static int eb_move_to_gpu(struct i915_execbuffer *eb)
>>+{
>>+	/* Unconditionally flush any chipset caches (for streaming writes). */
>>+	intel_gt_chipset_flush(eb->gt);
>>+
>>+	return 0;
>>+}
>>+
>>+static int eb_request_submit(struct i915_execbuffer *eb,
>>+			     struct i915_request *rq,
>>+			     struct i915_vma *batch,
>>+			     u64 batch_len)
>>+{
>>+	struct intel_engine_cs *engine = rq->context->engine;
>>+	int err;
>>+
>>+	if (intel_context_nopreempt(rq->context))
>>+		__set_bit(I915_FENCE_FLAG_NOPREEMPT, &rq->fence.flags);
>>+
>>+	/*
>>+	 * After we completed waiting for other engines (using HW semaphores)
>>+	 * then we can signal that this request/batch is ready to run. This
>>+	 * allows us to determine if the batch is still waiting on the GPU
>>+	 * or actually running by checking the breadcrumb.
>>+	 */
>>+	if (engine->emit_init_breadcrumb) {
>>+		err = engine->emit_init_breadcrumb(rq);
>>+		if (err)
>>+			return err;
>>+	}
>>+
>>+	return engine->emit_bb_start(rq, batch->node.start, batch_len, 0);
>>+}
>>+
>>+static int eb_submit(struct i915_execbuffer *eb)
>>+{
>>+	int err;
>>+
>>+	err = eb_move_to_gpu(eb);
>>+
>>+	for_each_batch_create_order(eb) {
>>+		if (!eb->requests[i])
>>+			break;
>>+
>>+		trace_i915_request_queue(eb->requests[i], 0);
>>+		if (!err)
>>+			err = eb_request_submit(eb, eb->requests[i],
>>+						eb->batches[i],
>>+						eb->batches[i]->size);
>>+	}
>>+
>>+	return err;
>>+}
>>+
>>+static int eb_pin_engine(struct i915_execbuffer *eb, bool throttle)
>>+{
>>+	int err;
>>+
>>+	GEM_BUG_ON(eb->args->flags & __EXEC3_ENGINE_PINNED);
>>+
>>+	err = i915_eb_pin_engine(eb->context, &eb->ww, throttle,
>>+				 eb->file->filp->f_flags & O_NONBLOCK);
>>+	if (err)
>>+		return err;
>>+
>>+	eb->args->flags |= __EXEC3_ENGINE_PINNED;
>>+	return 0;
>>+}
>>+
>>+static void eb_unpin_engine(struct i915_execbuffer *eb)
>>+{
>>+	if (!(eb->args->flags & __EXEC3_ENGINE_PINNED))
>>+		return;
>>+
>>+	eb->args->flags &= ~__EXEC3_ENGINE_PINNED;
>>+
>>+	i915_eb_unpin_engine(eb->context);
>>+}
>>+
>>+static int eb_select_engine(struct i915_execbuffer *eb)
>>+{
>>+	struct intel_context *ce;
>>+	unsigned int idx;
>>+	int err;
>>+
>>+	if (!i915_gem_context_user_engines(eb->gem_context))
>>+		return -EINVAL;
>>+
>>+	idx = eb->args->engine_idx;
>>+	ce = i915_gem_context_get_engine(eb->gem_context, idx);
>>+	if (IS_ERR(ce))
>>+		return PTR_ERR(ce);
>>+
>>+	eb->num_batches = ce->parallel.number_children + 1;
>>+
>>+	err = i915_eb_select_engine(ce);
>>+	if (err)
>>+		goto err;
>>+
>>+	eb->context = ce;
>>+	eb->gt = ce->engine->gt;
>>+
>>+	/*
>>+	 * Make sure engine pool stays alive even if we call intel_context_put
>>+	 * during ww handling. The pool is destroyed when last pm reference
>>+	 * is dropped, which breaks our -EDEADLK handling.
>>+	 */
>>+	return 0;
>>+
>>+err:
>>+	intel_context_put(ce);
>>+	return err;
>>+}
>>+
>>+static void eb_put_engine(struct i915_execbuffer *eb)
>>+{
>>+	i915_eb_put_engine(eb->context);
>>+}
>>+
>>+static int add_timeline_fence_array(struct i915_execbuffer *eb)
>>+{
>>+	struct drm_i915_gem_timeline_fence __user *user_fences;
>>+	struct eb_fence *f;
>>+	u64 nfences;
>>+
>>+	nfences = eb->args->fence_count;
>>+	if (!nfences)
>>+		return 0;
>>+
>>+	/* Check multiplication overflow for access_ok() and kvmalloc_array() */
>>+	BUILD_BUG_ON(sizeof(size_t) > sizeof(unsigned long));
>>+	if (nfences > min_t(unsigned long,
>>+			    ULONG_MAX / sizeof(*user_fences),
>>+			    SIZE_MAX / sizeof(*f)) - eb->num_fences)
>>+		return -EINVAL;
>>+
>>+	user_fences = u64_to_user_ptr(eb->args->timeline_fences);
>>+	if (!access_ok(user_fences, nfences * sizeof(*user_fences)))
>>+		return -EFAULT;
>>+
>>+	f = krealloc(eb->fences,
>>+		     (eb->num_fences + nfences) * sizeof(*f),
>>+		     __GFP_NOWARN | GFP_KERNEL);
>>+	if (!f)
>>+		return -ENOMEM;
>>+
>>+	eb->fences = f;
>>+	f += eb->num_fences;
>
>I guess this was mostly copy-pasta from eb2 which can in thoery run 
>the same TIMELINE_FENCES extension several times, but that looks like 
>it's not needed here, since this is not an actual extension with eb3 
>(Looking at the krealloc() stuff etc).

Yah, same here, will fix.

>
>>+
>>+	BUILD_BUG_ON(~(ARCH_KMALLOC_MINALIGN - 1) &
>>+		     ~__I915_TIMELINE_FENCE_UNKNOWN_FLAGS);
>>+
>>+	while (nfences--) {
>>+		struct drm_i915_gem_timeline_fence user_fence;
>>+		bool wait, signal;
>>+		int ret;
>>+
>>+		if (__copy_from_user(&user_fence,
>>+				     user_fences++,
>>+				     sizeof(user_fence)))
>>+			return -EFAULT;
>>+
>>+		if (user_fence.flags & __I915_TIMELINE_FENCE_UNKNOWN_FLAGS)
>>+			return -EINVAL;
>>+
>>+		wait = user_fence.flags & I915_EXEC_FENCE_WAIT;
>>+		signal = user_fence.flags & I915_EXEC_FENCE_SIGNAL;
>
>I915_TIMELINE_FENCE_WAIT
>I915_TIMELINE_FENCE_SIGNAL
>

same, will fix.

>?
>
>>+		ret = i915_eb_add_timeline_fence(eb->file, user_fence.handle,
>>+						 user_fence.value, f, wait,
>>+						 signal);
>>+		if (ret < 0)
>>+			return ret;
>>+		else if (!ret)
>>+			continue;
>>+
>>+		f++;
>>+		eb->num_fences++;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static int parse_timeline_fences(struct i915_execbuffer *eb)
>>+{
>>+	return add_timeline_fence_array(eb);
>>+}
>>+
>>+static int parse_batch_addresses(struct i915_execbuffer *eb)
>>+{
>>+	struct drm_i915_gem_execbuffer3 *args = eb->args;
>>+
>>+	if (eb->num_batches == 1) {
>>+		eb->batch_addresses[0] = args->batch_address;
>>+	} else {
>>+		u64 __user *batch_addr = u64_to_user_ptr(args->batch_address);
>>+
>>+		if (copy_from_user(eb->batch_addresses, batch_addr,
>>+				   sizeof(batch_addr[0]) * eb->num_batches))
>>+			return -EFAULT;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static int eb_composite_fence_create(struct i915_execbuffer *eb)
>>+{
>>+	struct dma_fence *fence;
>>+
>>+	fence = i915_eb_composite_fence_create(eb->requests, eb->num_batches,
>>+					       eb->context);
>>+	if (IS_ERR(fence))
>>+		return PTR_ERR(fence);
>>+
>>+	eb->composite_fence = fence;
>>+
>>+	return 0;
>>+}
>>+
>>+static int eb_fences_add(struct i915_execbuffer *eb, struct i915_request *rq)
>>+{
>>+	int err;
>>+
>>+	if (unlikely(eb->gem_context->syncobj)) {
>>+		struct dma_fence *fence;
>>+
>>+		fence = drm_syncobj_fence_get(eb->gem_context->syncobj);
>>+		err = i915_request_await_dma_fence(rq, fence);
>>+		dma_fence_put(fence);
>>+		if (err)
>>+			return err;
>>+	}
>>+
>>+	if (eb->fences) {
>>+		err = i915_eb_await_fence_array(eb->fences, eb->num_fences, rq);
>>+		if (err)
>>+			return err;
>>+	}
>>+
>>+	if (intel_context_is_parallel(eb->context)) {
>>+		err = eb_composite_fence_create(eb);
>>+		if (err)
>>+			return err;
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static int eb_requests_create(struct i915_execbuffer *eb)
>>+{
>>+	int err;
>>+
>>+	for_each_batch_create_order(eb) {
>>+		/* Allocate a request for this batch buffer nice and early. */
>>+		eb->requests[i] =
>>+			i915_request_create(i915_eb_find_context(eb->context,
>>+								 i));
>>+		if (IS_ERR(eb->requests[i])) {
>>+			err = PTR_ERR(eb->requests[i]);
>>+			eb->requests[i] = NULL;
>>+			return err;
>>+		}
>>+
>>+		/*
>>+		 * Only the first request added (committed to backend) has to
>>+		 * take the in fences into account as all subsequent requests
>>+		 * will have fences inserted inbetween them.
>>+		 */
>>+		if (i + 1 == eb->num_batches) {
>>+			err = eb_fences_add(eb, eb->requests[i]);
>>+			if (err)
>>+				return err;
>>+		}
>>+
>>+		if (eb->batches[i])
>>+			eb->requests[i]->batch_res =
>>+				i915_vma_resource_get(eb->batches[i]->resource);
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static int
>>+i915_gem_do_execbuffer(struct drm_device *dev,
>>+		       struct drm_file *file,
>>+		       struct drm_i915_gem_execbuffer3 *args)
>>+{
>>+	struct drm_i915_private *i915 = to_i915(dev);
>>+	struct i915_execbuffer eb;
>>+	bool throttle = true;
>>+	int err;
>>+
>>+	BUILD_BUG_ON(__EXEC3_INTERNAL_FLAGS & ~__I915_EXEC3_UNKNOWN_FLAGS);
>>+
>>+	eb.i915 = i915;
>>+	eb.file = file;
>>+	eb.args = args;
>>+
>>+	eb.fences = NULL;
>>+	eb.num_fences = 0;
>>+
>>+	memset(eb.requests, 0, sizeof(struct i915_request *) *
>>+	       ARRAY_SIZE(eb.requests));
>>+	eb.composite_fence = NULL;
>>+
>>+	err = parse_timeline_fences(&eb);
>>+	if (err)
>>+		return err;
>>+
>>+	err = eb_select_context(&eb);
>>+	if (unlikely(err))
>>+		goto err_fences;
>>+
>>+	err = eb_select_engine(&eb);
>>+	if (unlikely(err))
>>+		goto err_context;
>>+
>>+	err = parse_batch_addresses(&eb);
>>+	if (unlikely(err))
>>+		goto err_engine;
>>+
>>+	mutex_lock(&eb.context->vm->vm_bind_lock);
>>+
>>+	err = eb_lookup_vma_all(&eb);
>>+	if (err) {
>>+		eb_release_vma_all(&eb);
>>+		goto err_vm_bind_lock;
>>+	}
>>+
>>+	i915_gem_ww_ctx_init(&eb.ww, true);
>>+
>>+retry_validate:
>>+	err = eb_pin_engine(&eb, throttle);
>>+	if (err)
>>+		goto err_validate;
>>+
>>+	/* only throttle once, even if we didn't need to throttle */
>>+	throttle = false;
>>+
>>+err_validate:
>>+	if (err == -EDEADLK) {
>>+		eb_release_vma_all(&eb);
>>+		err = i915_gem_ww_ctx_backoff(&eb.ww);
>>+		if (!err)
>>+			goto retry_validate;
>>+	}
>>+	if (err)
>>+		goto err_vma;
>>+
>>+	ww_acquire_done(&eb.ww.ctx);
>>+
>>+	err = eb_requests_create(&eb);
>>+	if (err) {
>>+		if (eb.requests[0])
>>+			goto err_request;
>>+		else
>>+			goto err_vma;
>>+	}
>>+
>>+	err = eb_submit(&eb);
>>+
>>+err_request:
>>+	i915_eb_requests_get(eb.requests, eb.num_batches);
>>+	err = i915_eb_requests_add(eb.requests, eb.num_batches, eb.context,
>>+				   eb.gem_context->sched, err);
>>+
>>+	if (eb.fences)
>>+		i915_eb_signal_fence_array(eb.fences, eb.num_fences,
>>+					   eb.composite_fence ?
>>+					   eb.composite_fence :
>>+					   &eb.requests[0]->fence);
>>+
>>+	if (unlikely(eb.gem_context->syncobj)) {
>>+		drm_syncobj_replace_fence(eb.gem_context->syncobj,
>>+					  eb.composite_fence ?
>>+					  eb.composite_fence :
>>+					  &eb.requests[0]->fence);
>>+	}
>>+
>>+	if (eb.composite_fence)
>>+		dma_fence_put(eb.composite_fence);
>>+
>>+	i915_eb_requests_put(eb.requests, eb.num_batches);
>>+
>>+err_vma:
>>+	eb_release_vma_all(&eb);
>>+	WARN_ON(err == -EDEADLK);
>>+	i915_gem_ww_ctx_fini(&eb.ww);
>>+err_vm_bind_lock:
>>+	mutex_unlock(&eb.context->vm->vm_bind_lock);
>>+err_engine:
>>+	eb_put_engine(&eb);
>>+err_context:
>>+	i915_gem_context_put(eb.gem_context);
>>+err_fences:
>>+	i915_eb_put_fence_array(eb.fences, eb.num_fences);
>>+	return err;
>>+}
>>+
>>+int
>>+i915_gem_execbuffer3_ioctl(struct drm_device *dev, void *data,
>>+			   struct drm_file *file)
>>+{
>>+	struct drm_i915_gem_execbuffer3 *args = data;
>>+	int err;
>>+
>>+	/* Reserved fields must be 0 */
>>+	if (args->rsvd || args->extensions)
>>+		return -EINVAL;
>>+
>>+	if (args->flags & __I915_EXEC3_UNKNOWN_FLAGS)
>>+		return -EINVAL;
>>+
>>+	err = i915_gem_do_execbuffer(dev, file, args);
>>+
>>+	args->flags &= ~__I915_EXEC3_UNKNOWN_FLAGS;
>>+	return err;
>>+}
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h b/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
>>index 28d6526e32ab..b7a1e9725a84 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_ioctls.h
>>@@ -18,6 +18,8 @@ int i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
>>  			      struct drm_file *file);
>>  int i915_gem_execbuffer2_ioctl(struct drm_device *dev, void *data,
>>  			       struct drm_file *file);
>>+int i915_gem_execbuffer3_ioctl(struct drm_device *dev, void *data,
>>+			       struct drm_file *file);
>>  int i915_gem_get_aperture_ioctl(struct drm_device *dev, void *data,
>>  				struct drm_file *file);
>>  int i915_gem_get_caching_ioctl(struct drm_device *dev, void *data,
>>diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
>>index f44a864e0b53..49ebafb5c6d2 100644
>>--- a/drivers/gpu/drm/i915/i915_driver.c
>>+++ b/drivers/gpu/drm/i915/i915_driver.c
>>@@ -1853,6 +1853,7 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
>>  	DRM_IOCTL_DEF_DRV(I915_GEM_INIT, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
>>  	DRM_IOCTL_DEF_DRV(I915_GEM_EXECBUFFER, drm_invalid_op, DRM_AUTH),
>>  	DRM_IOCTL_DEF_DRV(I915_GEM_EXECBUFFER2_WR, i915_gem_execbuffer2_ioctl, DRM_RENDER_ALLOW),
>>+	DRM_IOCTL_DEF_DRV(I915_GEM_EXECBUFFER3, i915_gem_execbuffer3_ioctl, DRM_RENDER_ALLOW),
>>  	DRM_IOCTL_DEF_DRV(I915_GEM_PIN, i915_gem_reject_pin_ioctl, DRM_AUTH|DRM_ROOT_ONLY),
>>  	DRM_IOCTL_DEF_DRV(I915_GEM_UNPIN, i915_gem_reject_pin_ioctl, DRM_AUTH|DRM_ROOT_ONLY),
>>  	DRM_IOCTL_DEF_DRV(I915_GEM_BUSY, i915_gem_busy_ioctl, DRM_RENDER_ALLOW),
>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>index 87f5c2a470f5..fe7ee8f19c83 100644
>>--- a/include/uapi/drm/i915_drm.h
>>+++ b/include/uapi/drm/i915_drm.h
>>@@ -472,6 +472,7 @@ typedef struct _drm_i915_sarea {
>>  #define DRM_I915_GEM_CREATE_EXT		0x3c
>>  #define DRM_I915_GEM_VM_BIND		0x3d
>>  #define DRM_I915_GEM_VM_UNBIND		0x3e
>>+#define DRM_I915_GEM_EXECBUFFER3	0x3f
>>  /* Must be kept compact -- no holes */
>>  #define DRM_IOCTL_I915_INIT		DRM_IOW( DRM_COMMAND_BASE + DRM_I915_INIT, drm_i915_init_t)
>>@@ -538,6 +539,7 @@ typedef struct _drm_i915_sarea {
>>  #define DRM_IOCTL_I915_GEM_VM_DESTROY	DRM_IOW (DRM_COMMAND_BASE + DRM_I915_GEM_VM_DESTROY, struct drm_i915_gem_vm_control)
>>  #define DRM_IOCTL_I915_GEM_VM_BIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_BIND, struct drm_i915_gem_vm_bind)
>>  #define DRM_IOCTL_I915_GEM_VM_UNBIND	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_VM_UNBIND, struct drm_i915_gem_vm_unbind)
>>+#define DRM_IOCTL_I915_GEM_EXECBUFFER3	DRM_IOWR(DRM_COMMAND_BASE + DRM_I915_GEM_EXECBUFFER3, struct drm_i915_gem_execbuffer3)
>>  /* Allow drivers to submit batchbuffers directly to hardware, relying
>>   * on the security mechanisms provided by hardware.
>>@@ -1562,6 +1564,65 @@ struct drm_i915_gem_timeline_fence {
>>  	__u64 value;
>>  };
>>+/**
>>+ * struct drm_i915_gem_execbuffer3 - Structure for DRM_I915_GEM_EXECBUFFER3
>>+ * ioctl.
>>+ *
>>+ * DRM_I915_GEM_EXECBUFFER3 ioctl only works in VM_BIND mode and VM_BIND mode
>>+ * only works with this ioctl for submission.
>>+ * See I915_VM_CREATE_FLAGS_USE_VM_BIND.
>>+ */
>>+struct drm_i915_gem_execbuffer3 {
>>+	/**
>>+	 * @ctx_id: Context id
>>+	 *
>>+	 * Only contexts with user engine map are allowed.
>>+	 */
>>+	__u32 ctx_id;
>>+
>>+	/**
>>+	 * @engine_idx: Engine index
>>+	 *
>>+	 * An index in the user engine map of the context specified by @ctx_id.
>>+	 */
>>+	__u32 engine_idx;
>>+
>>+	/**
>>+	 * @batch_address: Batch gpu virtual address/es.
>>+	 *
>>+	 * For normal submission, it is the gpu virtual address of the batch
>>+	 * buffer. For parallel submission, it is a pointer to an array of
>>+	 * batch buffer gpu virtual addresses with array size equal to the
>>+	 * number of (parallel) engines involved in that submission (See
>>+	 * struct i915_context_engines_parallel_submit).
>>+	 */
>>+	__u64 batch_address;
>>+
>>+	/** @flags: Currently reserved, MBZ */
>>+	__u64 flags;
>>+#define __I915_EXEC3_UNKNOWN_FLAGS (~0)
>
>(~0ull)
>
>?

ok, will fix.

>
>I'll probably circle back around again, but for now all looks pretty 
>reasonable,
>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>

Thanks,
Niranjana

>>+
>>+	/** @fence_count: Number of fences in @timeline_fences array. */
>>+	__u64 fence_count;
>>+
>>+	/**
>>+	 * @timeline_fences: Pointer to an array of timeline fences.
>>+	 *
>>+	 * Timeline fences are of format struct drm_i915_gem_timeline_fence.
>>+	 */
>>+	__u64 timeline_fences;
>>+
>>+	/** @rsvd: Reserved, MBZ */
>>+	__u64 rsvd;
>>+
>>+	/**
>>+	 * @extensions: Zero-terminated chain of extensions.
>>+	 *
>>+	 * For future extensions. See struct i915_user_extension.
>>+	 */
>>+	__u64 extensions;
>>+};
>>+
>>  struct drm_i915_gem_pin {
>>  	/** Handle of the buffer to be pinned. */
>>  	__u32 handle;
