Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2BB605014
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 21:03:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5156C10F182;
	Wed, 19 Oct 2022 19:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D91F10E05B;
 Wed, 19 Oct 2022 19:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666206204; x=1697742204;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=g9MTH/dl6BSBqRJsuGVILb8StsZ25Abc84FfGvUExL0=;
 b=EO9AVWDy+ytw2LdIOf7QcqRWB1v/IFdYp7Fp0umMvaH1K9WTSKrV2B4J
 Oocqt7jJZ8KxvMNJxmS7hbN3MIzfyBLlUtBxRTq8sVy5GKfh/mBbdqoTJ
 6InLx0ORrcQEXH+i9/YfYKNvV0Bid3OaYJ7L3to+rEXpUtjfkIznjyyJZ
 L7xRM0f/ZXQXLY8u8+wYmAMLtBnfY3PDL5MkXZx/iQOZaW30dZFaYqFSa
 4K8Sl/D+ESKyXEU8Ow4JYHVCaU/zm6uTQ8YZ8lEaaNDnRdwdbp97Hb8AF
 r78+Gsp27xZi+RRksXs9nNsyNcKbKNnKDIaFGoWMGZRzJwRBdRmSdfXxA Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="286897861"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="286897861"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 12:03:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10505"; a="607239871"
X-IronPort-AV: E=Sophos;i="5.95,196,1661842800"; d="scan'208";a="607239871"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga006.jf.intel.com with ESMTP; 19 Oct 2022 12:03:23 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 12:03:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 12:03:22 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 19 Oct 2022 12:03:22 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 19 Oct 2022 12:03:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3FFR3Z3ofnG39HhVeIn4D+xM225l+bc/Uj1f1Mm34KjShXJ1d3+nsmSEYiX9Gq0tRotVS0TrHXZivo9aLE/LkjBGzM3kxZnCQOu3vzX1fsOrrW6bsNifmmpiJGhc9+QBAlo5ZK+CiHoEg/ckrr8tzo2FD6ODCEniQI059ba+63+2ufDApFUClnORNuDLOiEWsY0FgB7xMwR5+8MzXsuQ3zqMklUHfHPvpj5HUWJwdmrryl8edmAFXcsFEazjKHTF6t+JbU+qvGvuAQ7+H4J5+pTK4ICdkcePEA4ltmm/H4SaQGmM31fzgH+yx+73zZbo9Hl6UqIJC7PgiHnuIiJwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QgrTj5/jpB3FLJGZoWYFS+88NVC1sme/BoQ34XmbgwA=;
 b=G3LdBbW997tsWDA6wf0kENZpwNKz+tfyedW81mMoH9u/mlRXvev6R3OLY0lM5A99ZX2BqskjwXxhlPbnnKGuPbXYH3owvWLfCnEqzlLafxtIycqF9jc+7OkbkCT9AuKvCXwKVOeE67uIZrBX22NFucvDYg4Se0keG03tYzS6NU1Gto2bCeWKP2uuluqSxubQf2ETOdKH/hGCWFzQKXGHEKZxi2YTluZCskabSqIRmW1qTNakU1MDozBC7ZncoLsOR0g106CIvpfGi0PzguuNB5b0Itg0pb20eWwgb25rRHfsxqZZQd1dvsq6AfLYZQuD8HOqHmReHez19FkKFJycMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by SJ1PR11MB6180.namprd11.prod.outlook.com (2603:10b6:a03:459::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Wed, 19 Oct
 2022 19:03:20 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Wed, 19 Oct 2022
 19:03:20 +0000
Date: Wed, 19 Oct 2022 12:03:11 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 12/17] drm/i915/vm_bind: Implement
 I915_GEM_EXECBUFFER3 ioctl
Message-ID: <Y1BJ76I/Z1ARf+Pr@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-13-niranjana.vishwanathapura@intel.com>
 <1d48bd33-ea96-e753-eb82-12948baa4573@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1d48bd33-ea96-e753-eb82-12948baa4573@intel.com>
X-ClientProxiedBy: BY5PR17CA0016.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::29) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|SJ1PR11MB6180:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ed2319-c94f-466f-2734-08dab20496a6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4VQtJLGcElHI/2qpTo0uMpr6kcaom4rHYmrwcD947BrRxhL8aYErsOo3tAWuamj2U4nALE7EwShpl4dMaFG/HVv4NuK65qZdR8H0hffXJQ9K1Ccsr/b14MK1y4XIGUu6dJBs804PUaMF6vK33YSFESiFUVP3iDbKl8/67zCdY17vO3PAVp1cikrd2TFltVesinpFWZOdNzqpjt1JtbbpGHem/oq1+q9RZoCLntuOVaCHSmwYLMo252GXBXO4X4BngyxBugd1uWUsOOOpiPikWV2MsYjW+w8/L1GhwvMc4ju2Uu4PUSKa13JLVn/rN6qGKcG7KYv3uX74A8Nx1Qtn8IyPTOQalOBi841g2SphgXuinodSjwPm6LKBN7hlej5bZ0zLaNyVaEDkXyorUjdUxzdH+8le/kJBh8JBXq8SQjdpjiI/wQcsLq6YzFi3DM3u66aUYq/00FQT7kp2PNbXlf+X9XpDbLa4SphAaLAWpMtf7r1l279ijEPCGD8JgmYr+sR8xIYWDchI/NEC9JkE8vjG9/FQ2YfARJ69rTaAUf2+L3mhhQL9+nFThPuamEQofbsPO3l4QCg7TxkEK49m+5CctiF2pkE3f8dWIe+388mXVpN2y4t3s1oxbW5cMohyQebub7WJeteYdDR9yCIpoWS1mkSHazz/5tKIxAfJAPaefkc3iIIUtbuB6yTnZ7MoVASMoZMyDThhGY9fk/91sQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(346002)(39860400002)(366004)(376002)(396003)(451199015)(86362001)(66556008)(38100700002)(82960400001)(316002)(33716001)(66946007)(6636002)(8676002)(4326008)(44832011)(2906002)(6862004)(5660300002)(8936002)(41300700001)(186003)(83380400001)(478600001)(6512007)(9686003)(6486002)(6666004)(6506007)(26005)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4MHimfo64yAh4QoTXO2QAN4VHizopz+LrjvHlz40qRa1ufbQJVABwl8Vyv?=
 =?iso-8859-1?Q?p8R4XI91UM78qXB9IN4WkrOZ/KW4N8caXjbI6UsSsFp6FN6mSN7gkhyrYB?=
 =?iso-8859-1?Q?N9ozlsvVY0C//R9j5Ms08b/zHkH6M/pJenfUGvsZn/o2QCxYxSSbV1ru5l?=
 =?iso-8859-1?Q?xoze4syUews5oY3+JClcHcaqmmAgK10h+9ocdXEbKL8NPXlHMygobF1BXH?=
 =?iso-8859-1?Q?gqEBCiIxU6A/jNfhZP9ptYC0KKrLlzOmvtQmZiKwsVkL/uN/ssT5LT0uKG?=
 =?iso-8859-1?Q?AYqaVhr3flJmxw5D3lVTTNDBy9GfOONOr8zUWU4CnrJRvlLzUBEyuf9HsW?=
 =?iso-8859-1?Q?9hx86q6I4ma8/7Rd41Gk+BX4dZmIHeN0t0QFPRJ79Brcw2qhqhHiXxsxMF?=
 =?iso-8859-1?Q?NB9SUfIYeG13dYN85m8XeRWYYZNL7ZFXJHoUWv8eQe/pJD+GIpXbY6aTzs?=
 =?iso-8859-1?Q?Jqx5xddxVbu6YiRhNyBg9mKQxRHrsbnSvkvSiva0VPkjHQY2qZx9eoHa3Q?=
 =?iso-8859-1?Q?L6pW9kfRE/6qUHxnCXcUN6QercfGYT7L9JfgCmDY34EK6lWd2hVs9rhDu+?=
 =?iso-8859-1?Q?vIvoTTIORRvK8tyxYFh/WCMEnYg9ZVtoJAjZxt7pfI3Dxo4l49eS1IhReE?=
 =?iso-8859-1?Q?QiliFKUS/YLoN3zzzvaVtbTdXwvgBMmmGH1FLR5bSNG+w3shQ/NmwKZNyr?=
 =?iso-8859-1?Q?5r7CPAmfTT/oYM8Oc3itYESzbLzeNvG+WtGunXErl6Vn8B1Zn0nVhvre7L?=
 =?iso-8859-1?Q?VzDrHjVZZ7QZ9T/OyoldDjhvQbqvvZ0C63g4/RldzQ0//4nKlKSQQgvDTb?=
 =?iso-8859-1?Q?i60pCoUkCTn49QpFWD7t3sJWD1ZcPOEDWipR6/VGR39e6XhVAgjxJHKahH?=
 =?iso-8859-1?Q?PWnEo9gzjn96nLYaska0jBeZxP6rGFcB4s0DeB3aWf+GJRAFXKNDkLvJCb?=
 =?iso-8859-1?Q?f+sdjHxj9OzzeYkEZViAEnBYJrQZcJW/PHAjnKKgVFY1vH/Kv9b2y+4MWq?=
 =?iso-8859-1?Q?CgPEQNzNDJFZiIHNwv43T7znGQQZ4s6Grg9Pu8PgYAy7nWJZqPGB6V9sx5?=
 =?iso-8859-1?Q?No6uGgQPX6B7Umnec5E94h0peed6MlhBdnWqKkKGvgrqh70vCkK0xv8P6V?=
 =?iso-8859-1?Q?br0R4RPoPsnXGgv5bblnDY8ul3W4REtWuqflzCXakvhxYP2vfUuQ46o5xZ?=
 =?iso-8859-1?Q?ax6+JJ1xalepCR5/IMvSB0tj5DdzoJdGSuMgh+6D8raNx+D1zRDUX1qvFs?=
 =?iso-8859-1?Q?cBiitZfZtA6vagF1umFa7EnUH37QOcuHxGtGbSF5FyoCUDjDPTKWBjrjcC?=
 =?iso-8859-1?Q?arxxdHyBm0uQtYLMVzqAHp1bGJ60SDnwfbfX11GSfAdhwiciGZnSY+bsJS?=
 =?iso-8859-1?Q?mbiRQNBYLTTPaSm9NtzARQSiyi2nDpgSlx/YY+LIomqjvJXNRu6Im5/oRt?=
 =?iso-8859-1?Q?h6TK2t9eShvk16v2/yJnxX54qvW+LvxNJVj71zs4F1bwBK+R29yPmRdRr3?=
 =?iso-8859-1?Q?4dbrsTb6dAkZeZ7NcEnfEdpFnT0j5LaNgDLn0mRoJO4dXXHuyKeRhfBJ7S?=
 =?iso-8859-1?Q?EGBlxdQds/LfhzAaVkQ5EcDron7WmTuDiCmF/1eoDwh3pCi7TOVjbLqsZA?=
 =?iso-8859-1?Q?k3QfYpni7LiF4EsJQqfck6He8HcCQl10it/DzO4YuG+DsNXMDneL9ftLj5?=
 =?iso-8859-1?Q?A/qB+O4jV4TqBu0JCx8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ed2319-c94f-466f-2734-08dab20496a6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 19:03:20.4212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ipNOvhIR3h9myd+cgt7NKfVqNnxNdmScPpJiKLEIZ745oA3sJq7v5VGJK01HfTJDaVVEfTtU3q8fLOass7Brd9aNN56nFKjOe78tkcqsWrJEGHB/ol/7WuLYEIE2VvhW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6180
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

On Wed, Oct 19, 2022 at 04:20:49PM +0100, Matthew Auld wrote:
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
>
>Are we building/including the docs for this somewhere? Looks like we 
>are missing some stuff like @fences/@num_fences in the kernel-doc.

Looks like we are not. Will include it in Documentation/gpu/i915.rst
and also include vm_bind+execbuf3 design there.
Ok, will add missing params here.

>
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
>
>It might be good to also ban recoverable context support somewhere for 
>eb3. It should be non-recoverable ctx or nothing for new stuff it 
>seems (VLK-40081).

Hmm...I am not sure. Looks like contexts are by default recoverable.
So, at leaset IGTs by default will fail, and would need update.
Need to check if this works for all UMDs.

Thanks,
Niranjana

