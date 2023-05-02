Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8166F46FD
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FC9C10E394;
	Tue,  2 May 2023 15:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FBA010E373;
 Tue,  2 May 2023 15:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683040910; x=1714576910;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=M58kcaPinFq3d7rvatcGQcW90lmkwh8Qj/9VUPZY4Iw=;
 b=F/r0vTA6pQ4DmU3qIfNi3exy+Q9nnX3beM8DX3PmHSoEkNIAoZq7OX0N
 HZqB+28bRiog/wQBPZ5+zXvX92PuPxKBkHNaH1+AYd+h9K5HK1C6GH7dc
 jSmg3XJNercJWd67ssIIInezdeIyL7v16YHvmwPkAoeMCYGZH/GVrK4EJ
 0F6SHxPtvBFwf5h/Hw/sl68xZmxAUtVUiw3MkADeQ/+ZhAfo+5Ymg/am7
 3tGZ3meseGyt/KZ4Wedz17IogzimgcL18G2MZIxKR1P7439Xz+SO8cuwW
 1Lr/aks+lFAnbF2TZUYVJmvZuvgJSc40GgHaLyh0Com0vjU7x/X0tpt6g Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="413881130"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="413881130"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 08:20:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026127144"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="1026127144"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 02 May 2023 08:20:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 08:20:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 2 May 2023 08:20:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 2 May 2023 08:20:52 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 2 May 2023 08:20:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DtEFMRn1XD9r/+K5ZHDqsL4107AOsX3wXNMJikxDB12LnAJ/PKetxkKDDlm06XoDpP5zgomY9+sHHDIrFwPj/wOIy3k9LibpMz06q1yLQcqbu65rFbiKvl6r1v1Ld5hMkYZLdPOb03lKrDjqI4BNT6onqSyle6W9q7DEecs/CIM/3kWgLjV2LuGPyO0VNaxgYiN26z7pWI6K+BghAXxa+nIZgFk8pP42mbQzVTqo6R7kRk4deARdXi9NrWerNyqZ9Zb+QLiWyqnZJM+YbmIqAPjj7BGLlHQmGOxxSuf9XuwUP38LthN1Uod/7XPZrUMZ2qf7vEM/LDViOMaMZmP6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xUOR2QHW6Va4VyCry0SxDSMJyQI5FE8W7eI7bXgZ3oI=;
 b=dnsBJqzYY47NWD6NqfudsHUYtFg7fy+3Jk2HjkEFhzQB7HQVyJQ+kkRkJH61VmIneKloh0/icAWydjcw33GyxVkgyoloLOFpNI3R5hfklx/+0JUiJtCpbeSY8S7cliYPsJ9shb++InOpeKh/pvAxQlb+tdcN62mQRsUv/smlQGjfNrqiay1aZEttzKQKm1TKq2Cc+Gmf4BQ7EQ4NIHpQ6wTJpZe2hEQFajMOuK2Wjyk0ug26N0bNvLagJLtdMDa315HWAdJCnOax8cy4J3CbCI+ugylAJ58esqJlAMuT0VBuJkvuWIYfq+4OhkIHeuCoNjDxNfkmbfzp1g8zEWKI5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN0PR11MB5695.namprd11.prod.outlook.com (2603:10b6:408:163::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Tue, 2 May
 2023 15:20:50 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::ff06:a115:e4eb:680e%4]) with mapi id 15.20.6340.030; Tue, 2 May 2023
 15:20:49 +0000
Date: Tue, 2 May 2023 15:20:33 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [PATCH 10/14] drm/xe: Convert Xe HW Engine print to
 snapshot capture and print.
Message-ID: <ZFEqQQdlEy9DNxt5@DUT025-TGLU.fm.intel.com>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-11-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230426205713.512695-11-rodrigo.vivi@intel.com>
X-ClientProxiedBy: SJ0PR03CA0218.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN0PR11MB5695:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f01f820-10e6-49e4-dc5b-08db4b20cf56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVzSSTf8ePanYkbLDceLlUg7gWEyGEeAfJpqPR1ReBqYxI1lDwnB1KR3mYgEW/IBUoAe/A0eO4lMG+MuDY0L0lVWFIl0nR7MLaBZyj3XlSSQqqpi/1Nx3+OCI6CB03QABWDFarDRxCj85IF0nztxpS7phpiTRBzYkwjWCemxd9TRfUxEtud0Fs1iRFfQERBYm46H29cQZY+7S+/bpYlMmLGdqpYXgxqF9l7bvsSp3fFv7FjOUWJKUTHcja5MI/SPVl3emPuUYP6hJARD7jAkoPoalqzCRyMVUsrgSoSZ/ThOczHctGq9Zs9/wzLomtiyYLN0AVvKbNBZXq+Dco4ZjOWGZrfkbuTckznieGHxGtBVQFa//6SkAeCSgeLauH1Aj6C95cCT4lbaYKuoMwrlIeawFuJ8umUlr/EadPBqveeQs2cQyroLXpK4J6dKv2ljBlQHmrhhasOLtbKe8+21u8Tz8PJiadI7GmcVLxdtW1HHCOA96lXJohHZO3rhGmqPG+QUe4FkbPOdfFaAg5bGb8ArRr7A0ZkECUkBYQLGYLxpg+Logc+cwT7sonQ8bwrf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199021)(41300700001)(44832011)(5660300002)(83380400001)(2906002)(30864003)(6862004)(8676002)(8936002)(6666004)(316002)(6486002)(38100700002)(450100002)(66556008)(66476007)(4326008)(82960400001)(86362001)(478600001)(6636002)(26005)(186003)(6506007)(6512007)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jnn9rpIs8bt9jKdzxuei27Uma5B1CgbB0yrdyxdCr+g2UGw5xrra06IDPaI6?=
 =?us-ascii?Q?aYmXpt6mFvV8Hb9bEMCXIcRvqd+6S320TovlO7zHT/qoHXBeSwueIbVAguID?=
 =?us-ascii?Q?NuawhIl1UDIvxo3xSMxah8NzwgR+veAmoUv5j8rzd+a4g/nKn2+gt/IOmwnk?=
 =?us-ascii?Q?cCVvWSciffHxakolU/Dzyzl3bZsZ0roFrnQMvAxy+kQ/LkNiRaUdgHvZraTB?=
 =?us-ascii?Q?3nBdCOT7WYV/l3DcIx7C4FjEqftyIRqa20oeBC1gZUHBfIo50oHWs0yCne78?=
 =?us-ascii?Q?2ja2yM+1brW12sGwfZwyJB5GiwgeJT2zCfd/PmjpRsBH3xEsTHMLLdAcYUr0?=
 =?us-ascii?Q?czu8uJ6qCT30bX5N1WmLPMKlo26yRXca3woQEsus6WEp9QWsdhJAN+zMnGqX?=
 =?us-ascii?Q?EqRaLMiDmfoo0S/iiUMU1jxzKFlD0KZwyrHfTHHmxrjcpCj05UUtcigod/Hi?=
 =?us-ascii?Q?/YhCe6ZncdKmeY7aLS8nZiZq21cwt+Oof3rOcPGRTvTgFcxhlYA1fxS6d/vZ?=
 =?us-ascii?Q?A3TUEXlnvY6D3cDkEe1igmAMP7EUGMnfaJtGzOGhpHL9pZ+h2lokzxvQzQlH?=
 =?us-ascii?Q?4ie+ahOkhhNDNRC3kWT33Ae7I2rKnoOhP48zUcitWTsasXpOqKbKvxlO/4qj?=
 =?us-ascii?Q?vd2wg3V1Hqu65EMRekVGbaJl9z4gRvDi5VD/52tu3DyiRb59qG1MQbs+VCYX?=
 =?us-ascii?Q?ptoQRJeu51A+BpbOvbRilOHwDHTMXov1+XSydsThRFddRzZBd/i/5Hm5VNu+?=
 =?us-ascii?Q?b51pvdnLrTLRh7HbwG4u85Pr02Zxt2ghegp12cI83ZPse1XxW/nSWQqXFUTG?=
 =?us-ascii?Q?+on/0CT0upnRW3ztrU5VBoLXgL0eZodSbFB1vBow0nSdrVKvjysO6kXHstvI?=
 =?us-ascii?Q?yTXScPnwKlQMQaUeMuZ+hU8k3KMTrzwLEGEXQRFOein+ZX+tKAy/q5TwrkLP?=
 =?us-ascii?Q?LvdtmMh9Ionml8y5Jvsqgub6y0PAU0Nih0QLz8t42+RX6OMLuP/HmAsy+YnM?=
 =?us-ascii?Q?gFWMl4cJnAgl5BSnW+RRUgfcUQI5MGJD1eP1IgXK01jC6N8fshLb2jjbmAza?=
 =?us-ascii?Q?s0BvvW3fqpSyCCwVJcnsvLvXDTLp9J/VnJJueYiR1hzLvor4o2qu2R8dqlcQ?=
 =?us-ascii?Q?vAQxAuYS2VcPOcX6hD0xO1FiqVmDX2oBWJY1mIMaqILXWGZ2YhyUp2s8zjGk?=
 =?us-ascii?Q?jLnQs9A0QWnxb6Z+lboupb3+pSWseI8itA+RkmaXfE6bZ4CvDfdFIe6eLFHZ?=
 =?us-ascii?Q?XuvjlttSBZ+9TsiWFQ9mHJhN1+lIXU9mUKdo0o5Ky+/dm3aSKGPU19yQp6Mh?=
 =?us-ascii?Q?XNOL9gIPYoQYrvPDwClFt5u4q9jn9JPpSW+Dxbd+nUDcEyjbZ1LKuwZawRNv?=
 =?us-ascii?Q?A6D/8GQqP1M1wgFLfEMcXL/MKeIGitKaa2BnQRL5DNkejIoboQi+6urWwAIm?=
 =?us-ascii?Q?l0OF3WUhOwFFvRzdD08jRtZ6FXYIAt/JkL0CAQic3n2eZ0bGkb1rh6auVCd5?=
 =?us-ascii?Q?TTRspZHbk5bWu7kx5eHzOaRsyXUxOU2307PjLH2Z8G2wpdGstWkg1Qs6mfLD?=
 =?us-ascii?Q?yqIjMYBUktx7zo1Kx3cnVK0GeuBGsJICNilwYahQ06LR1fMOBwdh1b8FpGt3?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f01f820-10e6-49e4-dc5b-08db4b20cf56
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 15:20:49.4608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wuYurQPjlBL+YkbbBAx/XeNrx2Zyh81JX7Ph9RvHPEo6q84rvxkFETIKspQqwnBurrt69P+tPcVOy/vdr43RDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5695
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

On Wed, Apr 26, 2023 at 04:57:09PM -0400, Rodrigo Vivi wrote:
> The goal is to allow for a snapshot capture to be taken at the time
> of the crash, while the print out can happen at a later time through
> the exposed devcoredump virtual device.
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_debugfs.c      |   2 +-
>  drivers/gpu/drm/xe/xe_guc_submit.c      |   2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c       | 210 +++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_hw_engine.h       |   8 +-
>  drivers/gpu/drm/xe/xe_hw_engine_types.h |  78 +++++++++
>  5 files changed, 241 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index c45486c2015a..8bf441e850a0 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -42,7 +42,7 @@ static int hw_engines(struct seq_file *m, void *data)
>  	}
>  
>  	for_each_hw_engine(hwe, gt, id)
> -		xe_hw_engine_print_state(hwe, &p);
> +		xe_hw_engine_print(hwe, &p);
>  
>  	xe_device_mem_access_put(xe);
>  	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 9c06411f857f..74659d0a69b3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -751,7 +751,7 @@ static void simple_error_capture(struct xe_engine *e)
>  			if (hwe->class != e->hwe->class ||
>  			    !(BIT(hwe->logical_instance) & adj_logical_mask))
>  				continue;
> -			xe_hw_engine_print_state(hwe, &p);
> +			xe_hw_engine_print(hwe, &p);
>  		}
>  		xe_analyze_vm(&p, e->vm, e->gt->info.id);
>  		xe_force_wake_put(gt_to_fw(guc_to_gt(guc)), XE_FORCEWAKE_ALL);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 23b9f120c258..eda0666bfa2f 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -505,77 +505,175 @@ void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>  		xe_hw_fence_irq_run(hwe->fence_irq);
>  }
>  
> -void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
> +/**
> + * xe_hw_engine_snapshot_capture - Take a quick snapshot of the HW Engine.
> + * @hwe: Xe HW Engine.
> + *
> + * This can be printed out in a later stage like during dev_coredump
> + * analysis.
> + *
> + * Returns: a Xe HW Engine snapshot object that must be freed by the
> + * 	    caller, using `xe_hw_engine_snapshot_free`.
> + */
> +struct xe_hw_engine_snapshot *
> +xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe)
>  {
> +	struct xe_hw_engine_snapshot *snapshot;
> +	int len;
> +
>  	if (!xe_hw_engine_is_valid(hwe))
> -		return;
> +		return NULL;
> +
> +	snapshot = kzalloc(sizeof(struct xe_hw_engine_snapshot), GFP_ATOMIC);

Same alloc problem as previous files.

> +
> +	len = strlen(hwe->name) + 1;
> +	snapshot->name = kzalloc(len, GFP_ATOMIC);
> +	strscpy(snapshot->name, hwe->name, len);
> +	snapshot->class = hwe->class;
> +	snapshot->logical_instance = hwe->logical_instance;
> +	snapshot->forcewake.domain = hwe->domain;
> +	snapshot->forcewake.ref = xe_force_wake_ref(gt_to_fw(hwe->gt),
> +						    hwe->domain);
> +	snapshot->mmio_base = hwe->mmio_base;
> +
> +	snapshot->reg.ring_hwstam = hw_engine_mmio_read32(hwe,
> +							  RING_HWSTAM(0).reg);
> +	snapshot->reg.ring_hws_pga = hw_engine_mmio_read32(hwe,
> +							   RING_HWS_PGA(0).reg);
> +	snapshot->reg.ring_execlist_status_lo =
> +		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0).reg);
> +	snapshot->reg.ring_execlist_status_hi =
> +		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg);
> +	snapshot->reg.ring_execlist_sq_contents_lo =
> +		hw_engine_mmio_read32(hwe,
> +				      RING_EXECLIST_SQ_CONTENTS_LO(0).reg);
> +	snapshot->reg.ring_execlist_sq_contents_hi =
> +		hw_engine_mmio_read32(hwe,
> +				      RING_EXECLIST_SQ_CONTENTS_HI(0).reg);
> +	snapshot->reg.ring_execlist_control =
> +		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg);
> +	snapshot->reg.ring_start = hw_engine_mmio_read32(hwe,
> +							 RING_START(0).reg);
> +	snapshot->reg.ring_head =
> +		hw_engine_mmio_read32(hwe, RING_HEAD(0).reg) & HEAD_ADDR;
> +	snapshot->reg.ring_tail =
> +		hw_engine_mmio_read32(hwe, RING_TAIL(0).reg) & TAIL_ADDR;
> +	snapshot->reg.ring_ctl = hw_engine_mmio_read32(hwe, RING_CTL(0).reg);
> +	snapshot->reg.ring_mi_mode =
> +		hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg);
> +	snapshot->reg.ring_mode_gen7 =
> +		hw_engine_mmio_read32(hwe, RING_MODE_GEN7(0).reg);
> +	snapshot->reg.ring_imr = hw_engine_mmio_read32(hwe, RING_IMR(0).reg);
> +	snapshot->reg.ring_esr = hw_engine_mmio_read32(hwe, RING_ESR(0).reg);
> +	snapshot->reg.ring_emr = hw_engine_mmio_read32(hwe, RING_EMR(0).reg);
> +	snapshot->reg.ring_eir = hw_engine_mmio_read32(hwe, RING_EIR(0).reg);
> +	snapshot->reg.ring_acthd_udw =
> +		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0).reg);
> +	snapshot->reg.ring_acthd = hw_engine_mmio_read32(hwe,
> +							 RING_ACTHD(0).reg);
> +	snapshot->reg.ring_bbaddr_udw =
> +		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0).reg);
> +	snapshot->reg.ring_bbaddr = hw_engine_mmio_read32(hwe, RING_BBADDR(0).reg);
> +	snapshot->reg.ring_dma_fadd_udw =
> +		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0).reg),
> +	snapshot->reg.ring_dma_fadd =
> +		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0).reg);
> +	snapshot->reg.ipeir = hw_engine_mmio_read32(hwe, IPEIR(0).reg);
> +	snapshot->reg.ipehr = hw_engine_mmio_read32(hwe, IPEHR(0).reg);
>  
> -	drm_printf(p, "%s (physical), logical instance=%d\n", hwe->name,
> -		hwe->logical_instance);
> -	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> -		hwe->domain,
> -		xe_force_wake_ref(gt_to_fw(hwe->gt), hwe->domain));
> -	drm_printf(p, "\tMMIO base: 0x%08x\n", hwe->mmio_base);
> +	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
> +		snapshot->reg.rcu_mode = xe_mmio_read32(hwe->gt,
> +							GEN12_RCU_MODE.reg);
>  
> -	drm_printf(p, "\tHWSTAM: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_HWSTAM(0).reg));
> -	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_HWS_PGA(0).reg));
> +	return snapshot;
> +}
>  
> +/**
> + * xe_hw_engine_snapshot_print - Print out a given Xe HW Engine snapshot.
> + * @snapshot: Xe HW Engine snapshot object.
> + * @p: drm_printer where it will be printed out.
> + *
> + * This function prints out a given Xe HW Engine snapshot object.
> + */
> +void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> +				 struct drm_printer *p)
> +{
> +	if (!snapshot)
> +		return;
> +
> +	drm_printf(p, "%s (physical), logical instance=%d\n", snapshot->name,
> +		snapshot->logical_instance);
> +	drm_printf(p, "\tForcewake: domain 0x%x, ref %d\n",
> +		snapshot->forcewake.domain, snapshot->forcewake.ref);
> +	drm_printf(p, "\tMMIO base: 0x%08x\n", snapshot->mmio_base);
> +	drm_printf(p, "\tHWSTAM: 0x%08x\n", snapshot->reg.ring_hwstam);
> +	drm_printf(p, "\tRING_HWS_PGA: 0x%08x\n", snapshot->reg.ring_hws_pga);
>  	drm_printf(p, "\tRING_EXECLIST_STATUS_LO: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_LO(0).reg));
> +		   snapshot->reg.ring_execlist_status_lo);
>  	drm_printf(p, "\tRING_EXECLIST_STATUS_HI: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg));
> +		   snapshot->reg.ring_execlist_status_hi);
>  	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe,
> -					 RING_EXECLIST_SQ_CONTENTS_LO(0).reg));
> +		   snapshot->reg.ring_execlist_sq_contents_lo);
>  	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe,
> -					 RING_EXECLIST_SQ_CONTENTS_HI(0).reg));
> +		   snapshot->reg.ring_execlist_sq_contents_hi);
>  	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg));
> -
> -	drm_printf(p, "\tRING_START: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_START(0).reg));
> -	drm_printf(p, "\tRING_HEAD:  0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_HEAD(0).reg) & HEAD_ADDR);
> -	drm_printf(p, "\tRING_TAIL:  0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_TAIL(0).reg) & TAIL_ADDR);
> -	drm_printf(p, "\tRING_CTL: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_CTL(0).reg));
> -	drm_printf(p, "\tRING_MODE: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_MI_MODE(0).reg));
> +		   snapshot->reg.ring_execlist_control);
> +	drm_printf(p, "\tRING_START: 0x%08x\n", snapshot->reg.ring_start);
> +	drm_printf(p, "\tRING_HEAD:  0x%08x\n", snapshot->reg.ring_head);
> +	drm_printf(p, "\tRING_TAIL:  0x%08x\n", snapshot->reg.ring_tail);
> +	drm_printf(p, "\tRING_CTL: 0x%08x\n", snapshot->reg.ring_ctl);
> +	drm_printf(p, "\tRING_MODE: 0x%08x\n", snapshot->reg.ring_mi_mode);
>  	drm_printf(p, "\tRING_MODE_GEN7: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_MODE_GEN7(0).reg));
> -
> -	drm_printf(p, "\tRING_IMR:   0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_IMR(0).reg));
> -	drm_printf(p, "\tRING_ESR:   0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_ESR(0).reg));
> -	drm_printf(p, "\tRING_EMR:   0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EMR(0).reg));
> -	drm_printf(p, "\tRING_EIR:   0x%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_EIR(0).reg));
> -
> -        drm_printf(p, "\tACTHD:  0x%08x_%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_ACTHD_UDW(0).reg),
> -		hw_engine_mmio_read32(hwe, RING_ACTHD(0).reg));
> -        drm_printf(p, "\tBBADDR: 0x%08x_%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_BBADDR_UDW(0).reg),
> -		hw_engine_mmio_read32(hwe, RING_BBADDR(0).reg));
> +		   snapshot->reg.ring_mode_gen7);
> +	drm_printf(p, "\tRING_IMR:   0x%08x\n", snapshot->reg.ring_imr);
> +	drm_printf(p, "\tRING_ESR:   0x%08x\n", snapshot->reg.ring_esr);
> +	drm_printf(p, "\tRING_EMR:   0x%08x\n", snapshot->reg.ring_emr);
> +	drm_printf(p, "\tRING_EIR:   0x%08x\n", snapshot->reg.ring_eir);
> +        drm_printf(p, "\tACTHD:  0x%08x_%08x\n", snapshot->reg.ring_acthd_udw,

The alignment looks off here, looks like spaces rather than tabs.

Also I hate 0x%08x_%08x, can we just do 0x%016llx?

> +		   snapshot->reg.ring_acthd);
> +        drm_printf(p, "\tBBADDR: 0x%08x_%08x\n", snapshot->reg.ring_bbaddr_udw,
> +		   snapshot->reg.ring_bbaddr);
>          drm_printf(p, "\tDMA_FADDR: 0x%08x_%08x\n",
> -		hw_engine_mmio_read32(hwe, RING_DMA_FADD_UDW(0).reg),
> -		hw_engine_mmio_read32(hwe, RING_DMA_FADD(0).reg));
> +		   snapshot->reg.ring_dma_fadd_udw,
> +		   snapshot->reg.ring_dma_fadd);
> +	drm_printf(p, "\tIPEIR: 0x%08x\n", snapshot->reg.ipeir);
> +	drm_printf(p, "\tIPEHR: 0x%08x\n\n", snapshot->reg.ipehr);
>  
> -	drm_printf(p, "\tIPEIR: 0x%08x\n",
> -		hw_engine_mmio_read32(hwe, IPEIR(0).reg));
> -	drm_printf(p, "\tIPEHR: 0x%08x\n\n",
> -		hw_engine_mmio_read32(hwe, IPEHR(0).reg));
> -
> -	if (hwe->class == XE_ENGINE_CLASS_COMPUTE)
> +	if (snapshot->class == XE_ENGINE_CLASS_COMPUTE)
>  		drm_printf(p, "\tGEN12_RCU_MODE: 0x%08x\n",
> -			xe_mmio_read32(hwe->gt, GEN12_RCU_MODE.reg));
> +			   snapshot->reg.rcu_mode);
> +}
> +
> +/**
> + * xe_hw_engine_snapshot_free - Free all allocated objects for a given snapshot.
> + * @snapshot: Xe HW Engine snapshot object.
> + *
> + * This function free all the memory that needed to be allocated at capture
> + * time.
> + */
> +void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot)
> +{
> +	if (!snapshot)
> +		return;
> +
> +	kfree(snapshot->name);
> +	kfree(snapshot);
> +}
> +
> +/**
> + * xe_hw_engine_print - Xe HW Engine Print.
> + * @hwe: Hardware Engine.
> + * @p: drm_printer.
> + *
> + * This function quickly capture a snapshot and immediately print it out.
> + */
> +void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p)
> +{
> +	struct xe_hw_engine_snapshot *snapshot;
>  
> +	snapshot = xe_hw_engine_snapshot_capture(hwe);
> +	xe_hw_engine_snapshot_print(snapshot, p);
> +	xe_hw_engine_snapshot_free(snapshot);
>  }
>  
>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.h b/drivers/gpu/drm/xe/xe_hw_engine.h
> index ceab65397256..a0514bf859c6 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.h
> @@ -14,10 +14,16 @@ int xe_hw_engines_init_early(struct xe_gt *gt);
>  int xe_hw_engines_init(struct xe_gt *gt);
>  void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec);
>  void xe_hw_engine_enable_ring(struct xe_hw_engine *hwe);
> -void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p);
>  u32 xe_hw_engine_mask_per_class(struct xe_gt *gt,
>  				enum xe_engine_class engine_class);
>  
> +struct xe_hw_engine_snapshot *
> +xe_hw_engine_snapshot_capture(struct xe_hw_engine *hwe);
> +void xe_hw_engine_snapshot_free(struct xe_hw_engine_snapshot *snapshot);
> +void xe_hw_engine_snapshot_print(struct xe_hw_engine_snapshot *snapshot,
> +				 struct drm_printer *p);
> +void xe_hw_engine_print(struct xe_hw_engine *hwe, struct drm_printer *p);
> +
>  bool xe_hw_engine_is_reserved(struct xe_hw_engine *hwe);
>  static inline bool xe_hw_engine_is_valid(struct xe_hw_engine *hwe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> index 2c40384957da..c15d6c671fbb 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> @@ -109,4 +109,82 @@ struct xe_hw_engine {
>  	enum xe_hw_engine_id engine_id;
>  };
>  
> +/**
> + * struct xe_hw_engine_snapshot - Hardware engine snapshot
> + *
> + * Contains the snapshot of usefull hardware engine info and registers.
> + */
> +struct xe_hw_engine_snapshot {
> +	/** @name: name of the hw engine */
> +	char *name;
> +	/** @class: class of this hw engine */
> +	enum xe_engine_class class;
> +	/** @logical_instance: logical instance of this hw engine */
> +	u16 logical_instance;
> +	/** @forcewake: Force Wake information snapshot */
> +	struct {
> +		/** @domain: force wake domain of this hw engine */
> +		enum xe_force_wake_domains domain;
> +		/** @ref: Forcewake ref for the above domain */
> +		int ref;
> +	} forcewake;
> +	/** @reg: Useful MMIO register snapshot */

Should be down 1 more line.

Matt

> +	/** @mmio_base: MMIO base address of this hw engine*/
> +	u32 mmio_base;
> +	struct {
> +		/** @ring_hwstam: RING_HWSTAM */
> +		u32 ring_hwstam;
> +		/** @ring_hws_pga: RING_HWS_PGA */
> +		u32 ring_hws_pga;
> +		/** @ring_execlist_status_lo: RING_EXECLIST_STATUS_LO */
> +		u32 ring_execlist_status_lo;
> +		/** @ring_execlist_status_hi: RING_EXECLIST_STATUS_HI */
> +		u32 ring_execlist_status_hi;
> +		/** @ring_execlist_sq_contents_lo: RING_EXECLIST_SQ_CONTENTS */
> +		u32 ring_execlist_sq_contents_lo;
> +		/** @ring_execlist_sq_contents_hi: RING_EXECLIST_SQ_CONTENTS + 4 */
> +		u32 ring_execlist_sq_contents_hi;
> +		/** @ring_execlist_control: RING_EXECLIST_CONTROL */
> +		u32 ring_execlist_control;
> +		/** @ring_start: RING_START */
> +		u32 ring_start;
> +		/** @ring_head: RING_HEAD */
> +		u32 ring_head;
> +		/** @ring_tail: RING_TAIL */
> +		u32 ring_tail;
> +		/** @ring_ctl: RING_CTL */
> +		u32 ring_ctl;
> +		/** @ring_mi_mode: RING_MI_MODE */
> +		u32 ring_mi_mode;
> +		/** @ring_mode_gen7: RING_MODE_GEN7 */
> +		u32 ring_mode_gen7;
> +		/** @ring_imr: RING_IMR */
> +		u32 ring_imr;
> +		/** @ring_esr: RING_ESR */
> +		u32 ring_esr;
> +		/** @ring_emr: RING_EMR */
> +		u32 ring_emr;
> +		/** @ring_eir: RING_EIR */
> +		u32 ring_eir;
> +		/** @ring_acthd_udw: RING_ACTHD_UDW */
> +		u32 ring_acthd_udw;
> +		/** @ring_acthd: RING_ACTHD */
> +		u32 ring_acthd;
> +		/** @ring_bbaddr_udw: RING_BBADDR_UDW */
> +		u32 ring_bbaddr_udw;
> +		/** @ring_bbaddr: RING_BBADDR */
> +		u32 ring_bbaddr;
> +		/** @ring_dma_fadd_udw: RING_DMA_FADD_UDW */
> +		u32 ring_dma_fadd_udw;
> +		/** @ring_dma_fadd: RING_DMA_FADD */
> +		u32 ring_dma_fadd;
> +		/** @ipeir: IPEIR */
> +		u32 ipeir;
> +		/** @ipehr: IPEHR */
> +		u32 ipehr;
> +		/** @rcu_mode: GEN12_RCU_MODE */
> +		u32 rcu_mode;
> +	} reg;
> +};
> +
>  #endif
> -- 
> 2.39.2
> 
