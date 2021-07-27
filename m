Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B523D7DF0
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jul 2021 20:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588106E270;
	Tue, 27 Jul 2021 18:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F23D6E270;
 Tue, 27 Jul 2021 18:47:08 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="199730911"
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="199730911"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2021 11:47:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,274,1620716400"; d="scan'208";a="662936277"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 27 Jul 2021 11:47:07 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 11:47:07 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Tue, 27 Jul 2021 11:47:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Tue, 27 Jul 2021 11:47:06 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.103)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Tue, 27 Jul 2021 11:47:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3Kw0aT09HwjDhu54VSGbYb1weXYv993XrKp1UGsDO1s43e0PO/PQFFzfSJ6q8VsZD6FX0VIBUpRaWc1Pb3MjbPWPtdJZwodjiPJOgakeUYX8T7Sgk9BDFrE4Y3Eu29c0Dt+/6AYrPabN7SnXPOHm4hehReekmcYrltvUn3wRl0obAgUJ1s+8Wmpt7betvBxPAlONFkNB6tw1pTz+rhMvzVbDifWddn0t4Rbs77VBJ+1Z6AXquLRdYBt0o3iTtq6gU5NRxDqXdqXVKYVZH22r9JybbeQNjD4pz27AqBGbz8O8+gyKGw5q6R1mUzKR2OgDezZIGQ/Dcj6zAWLOPcoGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBOQRcB85vIFtYitqElXEUVlqhM0+a/patudKo/rZJU=;
 b=nl992TVBx0Ay5N7U4QDyOranK0dmorXLbcyIIW+eJN4KJHwAYG3G2bCD5jLK4uoMYU/qehXVc24VqiH7g8ASNDzYvfdH71xzr+jibC6ZaYXuWTCgX2538b0m/r6jHSsGbC5umigAV8kGW8o1MnqkiZC5++22ldcJBsSa2X3J/7iojwxwAx8wZi0F9/rR74ergK5EB45TFpJMVB8sz/TV1qalCZOY7LoDZzFyKIEBQt7k1NXj/gCGsNmzbkPpnKBB4wJKOontUrJfBpqbiDVFUEvNnIUKqYvOvSS75PvPbtmQ7ILukCxh3mkkr2TJwJ/HxLnzixgZ8a9K/91kHN0KCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LBOQRcB85vIFtYitqElXEUVlqhM0+a/patudKo/rZJU=;
 b=InRvrrnqFaEG/ItHokzH3GZV4V9a0nSH6S/4Y8L3qPldv5tXcvD88caUNw2g/WYMmp85/5xpD4xI9HqOrV2H+UXQrl5FoXL0E3k9bQSTvlNKthKl5I/ihn3+IUdim2kHENiYzh/wQwlP1PkahZYuGflh/uPTWPOk6M21LvccpYc=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from CO6PR11MB5634.namprd11.prod.outlook.com (2603:10b6:5:35d::20)
 by CO6PR11MB5617.namprd11.prod.outlook.com (2603:10b6:5:35c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Tue, 27 Jul
 2021 18:47:05 +0000
Received: from CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4]) by CO6PR11MB5634.namprd11.prod.outlook.com
 ([fe80::5d5e:b6bf:aafa:ecd4%9]) with mapi id 15.20.4352.032; Tue, 27 Jul 2021
 18:47:05 +0000
Subject: Re: [PATCH 02/15] drm/i915/guc/slpc: Initial definitions for SLPC
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20210726190800.26762-1-vinay.belgaumkar@intel.com>
 <20210726190800.26762-3-vinay.belgaumkar@intel.com>
 <f78d8fe0-cb2a-7c66-fcac-caa185ef7de2@intel.com>
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
Message-ID: <dd0835a6-713f-06e0-c0e1-3625e89dce19@intel.com>
Date: Tue, 27 Jul 2021 11:47:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
In-Reply-To: <f78d8fe0-cb2a-7c66-fcac-caa185ef7de2@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MWHPR03CA0005.namprd03.prod.outlook.com
 (2603:10b6:300:117::15) To CO6PR11MB5634.namprd11.prod.outlook.com
 (2603:10b6:5:35d::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.71] (99.88.121.38) by
 MWHPR03CA0005.namprd03.prod.outlook.com (2603:10b6:300:117::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Tue, 27 Jul 2021 18:47:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b2a9bf96-3f94-47a5-b5a8-08d9512eee23
X-MS-TrafficTypeDiagnostic: CO6PR11MB5617:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR11MB56171082FB0ABE810840C4C585E99@CO6PR11MB5617.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9PxCfbRKxMs/R6B7BiWgnxts1SomPj9IrBVI9pBTpMMIgvrF1o0IfnIJNvT8KcalVPygajZO76IsnCC3ZfKZL7Qw9hOyF+o4nX5FSpot3qEsiuw//uVB0HoImirmopsJddxCCd2X0n50VejSdZTWhpdvlpwigaDIsl8lo7XZYlon2uJCURt9dglOqc5bMudrK/sbhZiFHTznGykYKLSNunc6d3xAdVZtOrZFmqR5uNzz7Ww43c+Fzo2H2MZfLB0B1kMv+2R5pgrWt7RF9UoW4sqpHOCFS03QLF9ktxCYlrCxPv7nGQ/qCuYZTBd+9GJiQnNy1ubsapKvIlASrDAs5CBCCXIh92gXi+riS9MW/rtKw/VKpPTxOZz8xGjPdNiCuZHBNyiqfZXe0C91931dieYMvHTjXUcv76KpvnaMa4wo2D6NQkmK4rAW77QwNm76+npd+Qa6PwrmnPDSKHXNxhQYEOipgdXZuc7fuqYdWDZsgpnZCY4WSpQd/fxYKEK3KglerbOnODK41iqtvLXOMnDWVu0oprsLordiads2cRp8eKPu6RbLPOQ/Fvh1r/63/J23jks6PjQa7mIe5xxxsfahFOSZoUkG5u8AU/J/6vyKWYc5eHesBSxe5YcMKw0fbrdqa8XcCgr5tpfvOrEf6CXhJZve6JD4W1fnl3Y6qgAobE/hEc2RQnCPqXdhiYyqJe6oCZqxO7mEoj0nWzWthYqGZNIS5VRCd+n7q8F6YwxGkZbbyuijEzxGT3w6h6ew
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR11MB5634.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(66946007)(66476007)(186003)(66556008)(478600001)(26005)(36756003)(450100002)(5660300002)(6666004)(53546011)(31686004)(2906002)(83380400001)(8676002)(8936002)(316002)(86362001)(2616005)(31696002)(956004)(107886003)(4326008)(54906003)(38100700002)(6486002)(16576012)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fA+FKwJ0yyIFLZVT3BCNpSRokvMdvhlMPhpJh2noA/uD0zHhMt9opb2q20oF4BgaPlNb2WMGauIGd1ik68zFVfUr7D3eb0ayl4QSBfUjPauwh6iU8cVSAF1EVgiURw798+h2uulNj0s/wTTd8k0hzNkD3tanG2WsBzyxs6VBbsB/TU1C229uzZ5cGkemCKN6pg9x+Fd8KRRKgoaCxrkAYqvorxUm+gwHscsOeEeN+bkfjYkOCerQLlqpyFsI21cB7BkYH5UhftBeLhLQqg33zP++dyFgyDj1gOU2wtebyTswlEc6SmEsXaEZAj4jBSFJ/i2oZMSwlByj+rC5f/b0pwjd8eoul2OUWo/tyVI86jrD0S6gVWDKfr7507z2cg2JDeX2zuQva2tNvpjS7Xa7wPMq5aMcW2wRmcCOl7gYn0p/QOpjiIAKRVbkq1B+VpN8i2SSNHEpHLbKgftKE+avzeyYMp1oqP/e25tgAtdjLK5MkVrOg6o9Q2VR9g99I3zbnXREEdNvd+/XnaOyrE3vqsjsQNYQwj2IRCcs9P/E6PxZwkZlDQKOXR9RvReQpwoQ/lsBRBS3Nd4tkJf18cHKzRxF9xSOzV3IBuPx4lRu/7Ai4sh7luqVoeSlm8mjjgyY5H8qGSifrB24hU6r8pr3JHHb0dz8wNiXe+BjhD5rlatjnpUqMXcsLJSMJW+fKL0Z7nwJ4HJL/ckIPW9pdpOwTIcqyZu98N289JJY014MtW4X7CKw2nPEaIfaKqXXnVis
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a9bf96-3f94-47a5-b5a8-08d9512eee23
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5634.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2021 18:47:05.6185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLhrL9f0szqEf6bKzRi+c9cz4eaADZ43xZInji2wvSutHTTBZRT09E2Cb5H2K8f7biGRfA0t+yXTLI4PzCKErVglB0DnfBryIrguCsj05DU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5617
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Sundaresan
 Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/27/2021 6:43 AM, Michal Wajdeczko wrote:
> 
> 
> On 26.07.2021 21:07, Vinay Belgaumkar wrote:
>> Add macros to check for SLPC support. This feature is currently supported
>> for Gen12+ and enabled whenever GuC submission is enabled/selected.
>>
>> Include templates for SLPC init/fini and enable.
>>
>> v2: Move SLPC helper functions to intel_guc_slpc.c/.h. Define basic
>> template for SLPC structure in intel_guc_slpc_types.h. Fix copyright (Michal W)
>>
>> v3: Review comments (Michal W)
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>
>> drm/i915/guc/slpc: Lay out slpc init/enable/fini
>>
>> Declare init/fini and enable function templates.
>>
>> v2: Rebase
>>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/i915/Makefile                 |  1 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  2 +
>>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  4 ++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   | 45 +++++++++++++++++++
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h   | 33 ++++++++++++++
>>   .../gpu/drm/i915/gt/uc/intel_guc_slpc_types.h | 12 +++++
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  6 ++-
>>   drivers/gpu/drm/i915/gt/uc/intel_uc.h         |  2 +
>>   8 files changed, 103 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>>   create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index ab7679957623..d8eac4468df9 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -186,6 +186,7 @@ i915-y += gt/uc/intel_uc.o \
>>   	  gt/uc/intel_guc_fw.o \
>>   	  gt/uc/intel_guc_log.o \
>>   	  gt/uc/intel_guc_log_debugfs.o \
>> +	  gt/uc/intel_guc_slpc.o \
>>   	  gt/uc/intel_guc_submission.o \
>>   	  gt/uc/intel_huc.o \
>>   	  gt/uc/intel_huc_debugfs.o \
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> index 979128e28372..39bc3c16057b 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
>> @@ -7,6 +7,7 @@
>>   #include "gt/intel_gt_irq.h"
>>   #include "gt/intel_gt_pm_irq.h"
>>   #include "intel_guc.h"
>> +#include "intel_guc_slpc.h"
>>   #include "intel_guc_ads.h"
>>   #include "intel_guc_submission.h"
>>   #include "i915_drv.h"
>> @@ -157,6 +158,7 @@ void intel_guc_init_early(struct intel_guc *guc)
>>   	intel_guc_ct_init_early(&guc->ct);
>>   	intel_guc_log_init_early(&guc->log);
>>   	intel_guc_submission_init_early(guc);
>> +	intel_guc_slpc_init_early(&guc->slpc);
>>   
>>   	mutex_init(&guc->send_mutex);
>>   	spin_lock_init(&guc->irq_lock);
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> index a9547069ee7e..15ad2eaee473 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
>> @@ -15,6 +15,7 @@
>>   #include "intel_guc_ct.h"
>>   #include "intel_guc_log.h"
>>   #include "intel_guc_reg.h"
>> +#include "intel_guc_slpc_types.h"
>>   #include "intel_uc_fw.h"
>>   #include "i915_utils.h"
>>   #include "i915_vma.h"
>> @@ -30,6 +31,7 @@ struct intel_guc {
>>   	struct intel_uc_fw fw;
>>   	struct intel_guc_log log;
>>   	struct intel_guc_ct ct;
>> +	struct intel_guc_slpc slpc;
>>   
>>   	/* Global engine used to submit requests to GuC */
>>   	struct i915_sched_engine *sched_engine;
>> @@ -57,6 +59,8 @@ struct intel_guc {
>>   
>>   	bool submission_supported;
>>   	bool submission_selected;
>> +	bool slpc_supported;
>> +	bool slpc_selected;
> 
> (I know that you were following existing code, but we might do better
> and since you have to resend it anyway without patch 1/15 ...)
> 
> as we have here:
> 
> +	struct intel_guc_slpc slpc;
> 
> then maybe both supported/selected shall be moved there as:
> 
>   struct intel_guc_slpc {
> +	bool supported;
> +	bool selected;
>   };
> 
> so the struct wont be empty any more, with that fixed:
> 
> Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Ok, done,

Thanks for the review,
Vinay.
> 
>>   
>>   	struct i915_vma *ads_vma;
>>   	struct __guc_ads_blob *ads_blob;
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> new file mode 100644
>> index 000000000000..7275100ef8f8
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
>> @@ -0,0 +1,45 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#include "i915_drv.h"
>> +#include "intel_guc_slpc.h"
>> +#include "gt/intel_gt.h"
>> +
>> +static inline struct intel_guc *slpc_to_guc(struct intel_guc_slpc *slpc)
>> +{
>> +	return container_of(slpc, struct intel_guc, slpc);
>> +}
>> +
>> +static bool __detect_slpc_supported(struct intel_guc *guc)
>> +{
>> +	/* GuC SLPC is unavailable for pre-Gen12 */
>> +	return guc->submission_supported &&
>> +		GRAPHICS_VER(guc_to_gt(guc)->i915) >= 12;
>> +}
>> +
>> +static bool __guc_slpc_selected(struct intel_guc *guc)
>> +{
>> +	if (!intel_guc_slpc_is_supported(guc))
>> +		return false;
>> +
>> +	return guc->submission_selected;
>> +}
>> +
>> +void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc)
>> +{
>> +	struct intel_guc *guc = slpc_to_guc(slpc);
>> +
>> +	guc->slpc_supported = __detect_slpc_supported(guc);
>> +	guc->slpc_selected = __guc_slpc_selected(guc);
>> +}
>> +
>> +int intel_guc_slpc_init(struct intel_guc_slpc *slpc)
>> +{
>> +	return 0;
>> +}
>> +
>> +void intel_guc_slpc_fini(struct intel_guc_slpc *slpc)
>> +{
>> +}
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> new file mode 100644
>> index 000000000000..c3b0ad7f0f93
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
>> @@ -0,0 +1,33 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#ifndef _INTEL_GUC_SLPC_H_
>> +#define _INTEL_GUC_SLPC_H_
>> +
>> +#include "intel_guc_submission.h"
>> +#include "intel_guc_slpc_types.h"
>> +
>> +static inline bool intel_guc_slpc_is_supported(struct intel_guc *guc)
>> +{
>> +	return guc->slpc_supported;
>> +}
>> +
>> +static inline bool intel_guc_slpc_is_wanted(struct intel_guc *guc)
>> +{
>> +	return guc->slpc_selected;
>> +}
>> +
>> +static inline bool intel_guc_slpc_is_used(struct intel_guc *guc)
>> +{
>> +	return intel_guc_submission_is_used(guc) && intel_guc_slpc_is_wanted(guc);
>> +}
>> +
>> +void intel_guc_slpc_init_early(struct intel_guc_slpc *slpc);
>> +
>> +int intel_guc_slpc_init(struct intel_guc_slpc *slpc);
>> +int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
>> +void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> new file mode 100644
>> index 000000000000..bfe4a7f9ce15
>> --- /dev/null
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2021 Intel Corporation
>> + */
>> +
>> +#ifndef _INTEL_GUC_SLPC_TYPES_H_
>> +#define _INTEL_GUC_SLPC_TYPES_H_
>> +
>> +struct intel_guc_slpc {
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> index da57d18d9f6b..e6bd9406c7b2 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
>> @@ -75,16 +75,18 @@ static void __confirm_options(struct intel_uc *uc)
>>   	struct drm_i915_private *i915 = uc_to_gt(uc)->i915;
>>   
>>   	drm_dbg(&i915->drm,
>> -		"enable_guc=%d (guc:%s submission:%s huc:%s)\n",
>> +		"enable_guc=%d (guc:%s submission:%s huc:%s slpc:%s)\n",
>>   		i915->params.enable_guc,
>>   		yesno(intel_uc_wants_guc(uc)),
>>   		yesno(intel_uc_wants_guc_submission(uc)),
>> -		yesno(intel_uc_wants_huc(uc)));
>> +		yesno(intel_uc_wants_huc(uc)),
>> +		yesno(intel_uc_wants_guc_slpc(uc)));
>>   
>>   	if (i915->params.enable_guc == 0) {
>>   		GEM_BUG_ON(intel_uc_wants_guc(uc));
>>   		GEM_BUG_ON(intel_uc_wants_guc_submission(uc));
>>   		GEM_BUG_ON(intel_uc_wants_huc(uc));
>> +		GEM_BUG_ON(intel_uc_wants_guc_slpc(uc));
>>   		return;
>>   	}
>>   
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.h b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> index e2da2b6e76e1..925a58ca6b94 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.h
>> @@ -8,6 +8,7 @@
>>   
>>   #include "intel_guc.h"
>>   #include "intel_guc_submission.h"
>> +#include "intel_guc_slpc.h"
>>   #include "intel_huc.h"
>>   #include "i915_params.h"
>>   
>> @@ -83,6 +84,7 @@ __uc_state_checker(x, func, uses, used)
>>   uc_state_checkers(guc, guc);
>>   uc_state_checkers(huc, huc);
>>   uc_state_checkers(guc, guc_submission);
>> +uc_state_checkers(guc, guc_slpc);
>>   
>>   #undef uc_state_checkers
>>   #undef __uc_state_checker
>>
