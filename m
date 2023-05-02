Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C446F3E7E
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 09:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5739210E4A1;
	Tue,  2 May 2023 07:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD42710E4A1;
 Tue,  2 May 2023 07:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683013503; x=1714549503;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=5285e+mPkjqS+ome2MPJt/cx6lSH3rUCms7139Osgzg=;
 b=mG/X5fibjHVhXPBD7Tpl5yh1z+Cvm3H9KsFSMdZydgtrzlHzdhM0ol+6
 oe81bjB3ws8LHMvpIn7ilZmb5PcdSzmvKfMXDSeXjhbQ8APDNpB7n1m/M
 8oIbfMtU8Bsncu1nALQWK5HzyzP9f9I63Quqa42xCJcsQVFWvR8NBxzpU
 gmPg1N4JbMog53Mj2Ale55XN9UtJTjlhh+CRwwVBdywEPU5ojEKtUeulX
 n3ReRldibX/WL5uBuQ6CVRmg10JIjcwZHXIHIWnAzJluV1CoBdPs7vBpZ
 O4GWUj2JQ3mPEMzWyzYpW7/MSHGRwK199wwA9Ve+Hg7qu5VesvwZxC5l/ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="376393638"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="376393638"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 00:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10697"; a="728837086"
X-IronPort-AV: E=Sophos;i="5.99,243,1677571200"; d="scan'208";a="728837086"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga001.jf.intel.com with ESMTP; 02 May 2023 00:45:02 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 00:45:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 00:45:02 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 00:45:02 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 00:45:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eX9z5ZFttdQ9nPb7pfwA6/ZAWE99rlVTv0pLd/sB3fbk2h2yjFK3VMPHSZuwpnZ8Mh5A03pFDIGZEJ7Rt0aARCHs3n6NI0BfL1QL+keQ3ViTYxfevF10StHKPqBy9VITRVfgtWzGN8ibr7pPRm2EKwdlNI7rzezj91a6B3TJ6Pbi3tmCcBFLQf3My5ZMDPoAHnws7AMpx6F4LHk2o5Y20Zxjy9ivufyHiRijc1EdupAEd3z72hqslRKD0KYNFGBpQkmGwsjv8/0nGBcqd1TOjAAqzMGBUq1x1zIsR21SfY2JgUCrR+wl9j7H7OfnQn7AIUskF3rroeZkxMKJmOS/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+i/4eFyJsUs51/vrs3bNc4+0fCH9BmEK5GyLy2LYVD4=;
 b=MGms/F4h6ivShr6wkXlhcHIxe0dggZf4KCWp6g912RR7fvVyQOM013n3hCbWrtRmFNi3x+d53WurkliMKLl5yKrEEyEM3LPlOnpJ06ORENxWZXmcADJu3MsR8QU4UudTaSMFfAylNP8fNaTbiUpgsKIqWHJ1of3CNO2srVEQ/76SKJ4/9mKBdPpMvG0XV3xQCytUfOT0whK8Uwb8NDrb+Ay/c/WFoQyQZxTCreAxIy+ile/EKedXrHafsQEOYi90TxOc0VsbqmieWRR4x0/9fT7gYX8BtziHePSQcWUxD6iB7DIQAP7+EE775maN3mADPcXIBGHhKpekZ+B7IPyOxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 07:45:00 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 07:44:59 +0000
Date: Tue, 2 May 2023 07:44:44 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 07/14] drm/xe: Introduce guc_submit_types.h with relevant
 structs.
Message-ID: <ZFC/bEux3EERqL+0@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-8-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230426205713.512695-8-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR05CA0131.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::16) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b32ccc7-db65-43f0-7595-08db4ae12114
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iQjBwYWg6Ift7kudYiPf5HkHpXkobWXXwPdOTA6iOkPIR+85AwON8bgqWJ5j6vSnQTuBuAvtj30upA7xtvY4ywmes6FbUpJuIa+Fk7cJ1RAtRTiU36cZL3D7jo4W6LhKPjl1/1eyheEBjF3ULaUc5w12fu2+FKyupz980RgJLi06QKn9a4McWXYYVHr+Kb+F4och2Sea0ENOu4FwQRfmjC8ii8r+UEu5WXzllTo5oYfVGMHAV0vzmU3Obg1NM1Q9QFeW+Zp+j0GGm/UX9Fa8UJDnGSCSruJDXSms4juGRfO79NEJG8jQrQ/a7J4sbAgmxYqCmX9lfeqPOaKB6sPe4b5gCISTc4UJNDL14JyvenwZKfHcPzdTiCYRAtPoCXR23++FjaFK5bzfnMijHCVMiLOjC+AWCb2lbS6N33o0F3A+kx+ZzeM1BAMxmFfcmi6iRFUCyGucoP2ecPKInvasfAGZEZpT2GfyzlFG/4OmcXgqOkkKZkPs4PKjdANntFF7ZM1VCRm/lmn8TcMKa/LCkvWNS5wRV6vsfp/NYl9FvI1GN1cdpZ4JGO1ha19E1ulZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(136003)(39860400002)(346002)(366004)(451199021)(450100002)(5660300002)(82960400001)(8676002)(6862004)(8936002)(41300700001)(44832011)(316002)(86362001)(2906002)(38100700002)(186003)(478600001)(83380400001)(6666004)(26005)(6486002)(6506007)(6512007)(6636002)(4326008)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?rqshuAxp3RmewgBrrNFpygjC7Apg30xjFYzWE0zh29Na4x2SrB86SsMfkq?=
 =?iso-8859-1?Q?S4ZfhG++LrQNHrJZ9VkT/tEBi7pwwbVp3b/cK3IZcmCTi9PcjEpnAQb0W6?=
 =?iso-8859-1?Q?Z3yho9FACH6NYrPqYfG9wV90hRdXTln1rZ4Af9lxbYNWsUM5PIA+kKWwES?=
 =?iso-8859-1?Q?p9Br+TAY90I3mYoJ4egXhs6Rmu3CwTZxs6kLv8f1MBuKq5ehZwVeo7TiyU?=
 =?iso-8859-1?Q?ZYL8zO4GSkD7OMcL880Mzpv+61NSJoW/l4ZyIHF3g4vrs/dy1okaB6lvlk?=
 =?iso-8859-1?Q?XiXRHs2KLzwtC401nIb4f/pmiEctWbj9Z/deCSVNcXTHVOeHqVSKtBjRSH?=
 =?iso-8859-1?Q?y6Me1FUbaD9EqwNNUr9gwgtV5NdlmfUzfGPDhnXBpV5WpxvUl4kwZY5fgf?=
 =?iso-8859-1?Q?2PKeWNfkUN5T2QfLDrHFPh1bVqMsR3LUvUriZ+yVabAPmHE3AJgfhCXAaE?=
 =?iso-8859-1?Q?Udf0/mEF/loEId0E4QpoHqiaBqlBq1N3hyM20Iwr0pUO4+geSTeWYFgKf2?=
 =?iso-8859-1?Q?IIF2xmt5cNozV4m1RBqq9iwq4ZtbjuU6b1mlQQDEKkBAdv2CLYHo7igU+o?=
 =?iso-8859-1?Q?2uSbjZBUyGtCRUI0vDW44A8nBRONDoIR0HD5UgF/B2W3gn9tl9DS/yiihk?=
 =?iso-8859-1?Q?dZH08zrdeVjP2AJnUVLObYS9xDOWU+qI4bfY7uQQe8HLVZTjzAhr5HIWtS?=
 =?iso-8859-1?Q?wS+xY77Vsv/C6NO/Y6zhmWDRcbw9tnHHsHcSwVMA1MzdummjKze+zaY6i8?=
 =?iso-8859-1?Q?O9GWZPUBJMxDWW4RR8qvjCx2wC1Qi7/aoJkX4tUPltfOwWNeVKMW2bPcbG?=
 =?iso-8859-1?Q?gkY47oheJRcPaRHa8+yZdp50Q+FxmGI6kzI3S8nJEa1lSPyLp8mnEfkh2T?=
 =?iso-8859-1?Q?7ELwHxQf3cWWV3vyxnwL7B5M/+Et9VComNbh+id0UV2Pm3BWI4BEPjo6D+?=
 =?iso-8859-1?Q?ZuOjWnL8MGCab3MbW+RAkpm+srhLjCk4hL6TbxkBs+8BQnUdXaxvLgl20l?=
 =?iso-8859-1?Q?EZUaFqEZT96b8Mkae5YnGarSGbY8JH8D6CLk6Ax/qemBVlQrayqnb9Fr15?=
 =?iso-8859-1?Q?lZLAZ3qP6Vdl/CYNoXkYVmyKpMYvZrP2fd76jBBbkb/GOskOYjGuNj0i6i?=
 =?iso-8859-1?Q?LI6AavRVZ/fs1dPRXA/nHkePZWzFMwx3J+wSS036638CH0JJdvVTONqmqm?=
 =?iso-8859-1?Q?Z0zs6pyndWX0auVcohHEN2ryCU4qRpnkfczQ0UfDhlmnlFzXlvxr7+Icqa?=
 =?iso-8859-1?Q?REP0bGlbWLg+EgAQ7a92FDPYRB+biWk5tJrNeUH2P9uHdzrYeFdoLN72so?=
 =?iso-8859-1?Q?F7CeG6z42bQ2I9VexrF9ZEhu0drDifuBtmjxVl8l7I2+FU6F/DK2081G28?=
 =?iso-8859-1?Q?xvWq6efsThU5FzehcfOdUao2JxwquXLbGUSG/LjWS/tMo2vjE4dP/RwTUz?=
 =?iso-8859-1?Q?ei8FTJbm6VVVXhDdGQI9LPXGHrNRIDeKA5Tml4TzWiWGejl8f+kmPQxy1z?=
 =?iso-8859-1?Q?5EbYeJHhHCoSAJBOz+husiVu21pgnJrTjNGnMKLJjTfY0uNw9PjHDF1ucA?=
 =?iso-8859-1?Q?3AySsJejGH39DMhwLEkdFma67MrvTYceT2W/b9PlF+aRdyN55EDX3M/gw8?=
 =?iso-8859-1?Q?uFS/01LXls6quqa+6NT+/56esnsRyTgyFayFNG6MoAsIXHY7NPUc8zOA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b32ccc7-db65-43f0-7595-08db4ae12114
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 07:44:58.9465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7JcH7fS9IS1wfzHhh1VKbZOFwY3ZkmsSyaaAXlUIEblL2PoQLxe+HKIyivpp1Bmw3KUlyI2CgsQiTx70o9m9fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 04:57:06PM -0400, Rodrigo Vivi wrote:
> These structs and definitions are only used for the guc_submit
> and they were added specifically for the parallel submission.
> 
> While doing that also delete the unused struct guc_wq_item.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Side note this reminds me we need to implement to parallel submission
handsake in xe_ring_ops.c if we want parallel submission to truly work.
Should be a straight port from the i915... Also should write an IGT for
that too. 

> ---
>  drivers/gpu/drm/xe/xe_guc_fwif.h         | 29 -----------
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 40 ++++-----------
>  drivers/gpu/drm/xe/xe_guc_submit_types.h | 64 ++++++++++++++++++++++++
>  3 files changed, 75 insertions(+), 58 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_guc_submit_types.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h b/drivers/gpu/drm/xe/xe_guc_fwif.h
> index 20155ba4ef07..27d132ce2087 100644
> --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> @@ -46,35 +46,6 @@
>  #define GUC_MAX_ENGINE_CLASSES		16
>  #define GUC_MAX_INSTANCES_PER_CLASS	32
>  
> -/* Work item for submitting workloads into work queue of GuC. */
> -#define WQ_STATUS_ACTIVE		1
> -#define WQ_STATUS_SUSPENDED		2
> -#define WQ_STATUS_CMD_ERROR		3
> -#define WQ_STATUS_ENGINE_ID_NOT_USED	4
> -#define WQ_STATUS_SUSPENDED_FROM_RESET	5
> -#define WQ_TYPE_NOOP			0x4
> -#define WQ_TYPE_MULTI_LRC		0x5
> -#define WQ_TYPE_MASK			GENMASK(7, 0)
> -#define WQ_LEN_MASK			GENMASK(26, 16)
> -
> -#define WQ_GUC_ID_MASK			GENMASK(15, 0)
> -#define WQ_RING_TAIL_MASK		GENMASK(28, 18)
> -
> -struct guc_wq_item {
> -	u32 header;
> -	u32 context_desc;
> -	u32 submit_element_info;
> -	u32 fence_id;
> -} __packed;
> -
> -struct guc_sched_wq_desc {
> -	u32 head;
> -	u32 tail;
> -	u32 error_offset;
> -	u32 wq_status;
> -	u32 reserved[28];
> -} __packed;
> -
>  /* Helper for context registration H2G */
>  struct guc_ctxt_registration_info {
>  	u32 flags;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 231fb4145297..a5fe7755ce4c 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -22,6 +22,7 @@
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_guc_engine_types.h"
> +#include "xe_guc_submit_types.h"
>  #include "xe_hw_engine.h"
>  #include "xe_hw_fence.h"
>  #include "xe_lrc.h"
> @@ -378,32 +379,12 @@ static void set_min_preemption_timeout(struct xe_guc *guc, struct xe_engine *e)
>  		       __guc_engine_policy_action_size(&policy), 0, 0);
>  }
>  
> -#define PARALLEL_SCRATCH_SIZE	2048
> -#define WQ_SIZE			(PARALLEL_SCRATCH_SIZE / 2)
> -#define WQ_OFFSET		(PARALLEL_SCRATCH_SIZE - WQ_SIZE)
> -#define CACHELINE_BYTES		64
> -
> -struct sync_semaphore {
> -	u32 semaphore;
> -	u8 unused[CACHELINE_BYTES - sizeof(u32)];
> -};
> -
> -struct parallel_scratch {
> -	struct guc_sched_wq_desc wq_desc;
> -
> -	struct sync_semaphore go;
> -	struct sync_semaphore join[XE_HW_ENGINE_MAX_INSTANCE];
> -
> -	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
> -		sizeof(struct sync_semaphore) * (XE_HW_ENGINE_MAX_INSTANCE + 1)];
> -
> -	u32 wq[WQ_SIZE / sizeof(u32)];
> -};
> -
>  #define parallel_read(xe_, map_, field_) \
> -	xe_map_rd_field(xe_, &map_, 0, struct parallel_scratch, field_)
> +	xe_map_rd_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
> +			field_)
>  #define parallel_write(xe_, map_, field_, val_) \
> -	xe_map_wr_field(xe_, &map_, 0, struct parallel_scratch, field_, val_)
> +	xe_map_wr_field(xe_, &map_, 0, struct guc_submit_parallel_scratch, \
> +			field_, val_)
>  
>  static void __register_mlrc_engine(struct xe_guc *guc,
>  				   struct xe_engine *e,
> @@ -486,13 +467,13 @@ static void register_engine(struct xe_engine *e)
>  		struct iosys_map map = xe_lrc_parallel_map(lrc);
>  
>  		info.wq_desc_lo = lower_32_bits(ggtt_addr +
> -			offsetof(struct parallel_scratch, wq_desc));
> +			offsetof(struct guc_submit_parallel_scratch, wq_desc));
>  		info.wq_desc_hi = upper_32_bits(ggtt_addr +
> -			offsetof(struct parallel_scratch, wq_desc));
> +			offsetof(struct guc_submit_parallel_scratch, wq_desc));
>  		info.wq_base_lo = lower_32_bits(ggtt_addr +
> -			offsetof(struct parallel_scratch, wq[0]));
> +			offsetof(struct guc_submit_parallel_scratch, wq[0]));
>  		info.wq_base_hi = upper_32_bits(ggtt_addr +
> -			offsetof(struct parallel_scratch, wq[0]));
> +			offsetof(struct guc_submit_parallel_scratch, wq[0]));
>  		info.wq_size = WQ_SIZE;
>  
>  		e->guc->wqi_head = 0;
> @@ -594,7 +575,7 @@ static void wq_item_append(struct xe_engine *e)
>  
>  	XE_BUG_ON(i != wqi_size / sizeof(u32));
>  
> -	iosys_map_incr(&map, offsetof(struct parallel_scratch,
> +	iosys_map_incr(&map, offsetof(struct guc_submit_parallel_scratch,
>  					wq[e->guc->wqi_tail / sizeof(u32)]));
>  	xe_map_memcpy_to(xe, &map, 0, wqi, wqi_size);
>  	e->guc->wqi_tail += wqi_size;
> @@ -1674,6 +1655,7 @@ static void guc_engine_print(struct xe_engine *e, struct drm_printer *p)
>  		guc_engine_wq_print(e, p);
>  
>  	spin_lock(&sched->job_list_lock);
> +
>  	list_for_each_entry(job, &sched->pending_list, drm.list)
>  		drm_printf(p, "\tJob: seqno=%d, fence=%d, finished=%d\n",
>  			   xe_sched_job_seqno(job),
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit_types.h b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> new file mode 100644
> index 000000000000..d369ea0bad60
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_guc_submit_types.h
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GUC_SUBMIT_TYPES_H_
> +#define _XE_GUC_SUBMIT_TYPES_H_
> +
> +#include "xe_hw_engine_types.h"
> +
> +/* Work item for submitting workloads into work queue of GuC. */
> +#define WQ_STATUS_ACTIVE		1
> +#define WQ_STATUS_SUSPENDED		2
> +#define WQ_STATUS_CMD_ERROR		3
> +#define WQ_STATUS_ENGINE_ID_NOT_USED	4
> +#define WQ_STATUS_SUSPENDED_FROM_RESET	5
> +#define WQ_TYPE_NOOP			0x4
> +#define WQ_TYPE_MULTI_LRC		0x5
> +#define WQ_TYPE_MASK			GENMASK(7, 0)
> +#define WQ_LEN_MASK			GENMASK(26, 16)
> +
> +#define WQ_GUC_ID_MASK			GENMASK(15, 0)
> +#define WQ_RING_TAIL_MASK		GENMASK(28, 18)
> +
> +#define PARALLEL_SCRATCH_SIZE	2048
> +#define WQ_SIZE			(PARALLEL_SCRATCH_SIZE / 2)
> +#define WQ_OFFSET		(PARALLEL_SCRATCH_SIZE - WQ_SIZE)
> +#define CACHELINE_BYTES		64
> +
> +struct guc_sched_wq_desc {
> +	u32 head;
> +	u32 tail;
> +	u32 error_offset;
> +	u32 wq_status;
> +	u32 reserved[28];
> +} __packed;
> +
> +struct sync_semaphore {
> +	u32 semaphore;
> +	u8 unused[CACHELINE_BYTES - sizeof(u32)];
> +};
> +
> +/**
> + * Struct guc_submit_parallel_scratch - A scratch shared mapped buffer.
> + */
> +struct guc_submit_parallel_scratch {
> +	/** @wq_desc: Guc scheduler workqueue descriptor */
> +	struct guc_sched_wq_desc wq_desc;
> +
> +	/** @go: Go Semaphore */
> +	struct sync_semaphore go;
> +	/** @join: Joined semaphore for the relevant hw engine instances */
> +	struct sync_semaphore join[XE_HW_ENGINE_MAX_INSTANCE];
> +
> +	/** @unused: Unused/Reserved memory space */
> +	u8 unused[WQ_OFFSET - sizeof(struct guc_sched_wq_desc) -
> +		  sizeof(struct sync_semaphore) *
> +		  (XE_HW_ENGINE_MAX_INSTANCE + 1)];
> +
> +	/** @wq: Workqueue info */
> +	u32 wq[WQ_SIZE / sizeof(u32)];
> +};
> +
> +#endif
> -- 
> 2.39.2
> 
