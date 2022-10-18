Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 838CD603100
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 18:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB3910E28A;
	Tue, 18 Oct 2022 16:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E54A410E28A;
 Tue, 18 Oct 2022 16:48:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666111706; x=1697647706;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ai5NoiYaXx//FXimkZ4TdSTp9Jo8Gp//3AoNeMZK2eU=;
 b=j9ezYluqkp+i7zRvSBaIbRJfGx4xZPCpvqV0Yw9v58WY9XzrUTzzEDt3
 iXlld5pbW925RubqZpus7VhRZum9hJKmFfaatvUi+ERJHBpcMf6Lqzlzi
 1xdsa/SLmn67nQIK21xp4WUOOFuR1JNEB4aS76F2lyxPmMFTAtnUT+ZHe
 7iIxxzbsTdpFobwr+3owQXkTPBtbTTIjWL3ytnKjArhFcE+hOolRsFzt4
 Yk33x7pv1OaM9GkyfZ3UzlpOvceAqCC6WbDFpclodE66vAqDQPACb/a6O
 BzZWtowxF0A7PK2GAiMRn2bMIIc//wTN4U9+ArVZ6C4j+QY/TgH0mT7Bt w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="285886070"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="285886070"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 09:48:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="691900854"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="691900854"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga008.fm.intel.com with ESMTP; 18 Oct 2022 09:48:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 09:48:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Tue, 18 Oct 2022 09:48:14 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Tue, 18 Oct 2022 09:48:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jn+5X5F+o1AZURfaa50QqZLYfn9FdmlgQtJVRgnl3rAQIya/T+abPIctqvdyBlckhCVPrhsO8sFZR/zv3yTI0An79deXfQfy6EWWRpsuZ936LXJwt8kR+3LoiPfnXhEUs6o532FLQsQe+lTfyve16E0IIx3B7ccDwsHMoyMKifjtKS4VqcQJ/6njylpGEx1JWmf3YbKvJf97p+vOlRTcVzT34ijUHSXV0pczB5p94j+3GiE4icNZKyPL/pi+N3qAL8f/RcAEAtmH1Eaj/Fh/wZ8Z8XT/5a/Zfw78MjEQmSsqFTH8KrrOQ5zwoXEjaA1aosFU+b2wK7bUIPHNRiWlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7UPlMJJhRWdvQxfFN9i4gyDQmvsHLFol4z9TD+W5nE=;
 b=W9tXfqNM3h8cEQ3+J+IzxAD5sbWz9Q8Jyle88vl9iYfxYD1Yy5PA3HS445ip4+QJqwfsmaYK7JQtqvuvCm2+LHmBYUvGIpyzLPN5MpxZyOuiW8aRoyKpFLPeLQeNxBSN2nLd+/I/Fm88pqTm9s/cfTDTm5//f43/inHb+XKLj/LZJrIqIlHyAaWSOCtjoUjQXQLh47LO60M3MDQ5VXXcFsiCHuP3c0tzl9Hk6J4DpCaaDwpQ12BzbnjP7oN/Mecu6yWnJ+PjChnZ4/BByzRFZhoU8wnWOtRmXQTxyhl99tKKIhb4euLAOFuM3IOSdfeZOABjgjzoE/FgKGQoyPmAww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB6499.namprd11.prod.outlook.com (2603:10b6:510:1f0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Tue, 18 Oct
 2022 16:48:12 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.033; Tue, 18 Oct 2022
 16:48:12 +0000
Date: Tue, 18 Oct 2022 09:48:05 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v4 17/17] drm/i915/vm_bind: Add uapi for user to enable
 vm_bind_mode
Message-ID: <Y07YxSU+aEXA84D3@nvishwa1-DESK>
References: <20221018071630.3831-1-niranjana.vishwanathapura@intel.com>
 <20221018071630.3831-18-niranjana.vishwanathapura@intel.com>
 <4e3cfa72-b5d4-edf6-09b2-0a21b1e255d8@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <4e3cfa72-b5d4-edf6-09b2-0a21b1e255d8@intel.com>
X-ClientProxiedBy: SJ0PR03CA0019.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::24) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB6499:EE_
X-MS-Office365-Filtering-Correlation-Id: a3d63dbc-c946-450f-18b2-08dab1288b2f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: np7DeyNl8Wfp8RC5n4jYsuF+IUV2i50B8ogmz5sLgtNvPZ3TPIVE2+V680CT1LXLotp98mEidt+8vCSBORQw6fInsOzzVjOJJ9oGLtXunDXqpuCHjO4SDNYqNFn0ruZhL9Of9ekSfjrEADDmcNUzzpR08sogJHnAezb2ZkGRJMKlDvbNJt3Y+6pFX+IYHUKshpXLIJ/DQG9hUWOEoXJ84E6rfWCrLrMF/Y/N5jJd/HyZbo4ikHKJL4qiMVbIWipJWU0kc20v3nhd4Pg33H/7xBOFnOoiYDSakQOeC98aOr4jwb1/NozSyVmrNQUsa/Z7R5pVjKahhNvTPoT/Bvs2hgq9o3wIhLc3UFNiexXcH75hFXZ0BqRMiiLrJ1pf2o3Ej70B+/nACqXaQ7dHYtj2KTC5C7UsxMDSPQbFeBQPiaeKY02Id5M1QPP/oX7XE4d+cvONLHaL/27kUFLJgPThkQXw6nVePhHsAAt9k6irEHtDmos0hhNhUkvOI9qWgpnfJStajx/2fWNeG9PJFkun1xPEmB2kTYwD7nXKtKYQIMGy9RGY5XhmidGW/Pzl/5VsRqu1avx+69i6wVLhmkCCW1VG7a//3eQkzgQaYMAto0XWP0jF0sNTAwl/MKsbGGAkUdYS2/d4L7q+M2qLG72m5rrjB9DhttfqGK2YJeLF8qd3N+gc701M6DwdT5IR2rEml+G7EOpL/IHpsn5ArYLuTUiKz/nJMyuWaS6QjceQP5GqK3JOuJ2UUtT1r/53sFmiKIUeWcr13BNPNCI/5OkP6g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(136003)(376002)(366004)(346002)(39860400002)(396003)(451199015)(6506007)(6636002)(478600001)(6486002)(6666004)(6512007)(9686003)(26005)(4326008)(66556008)(66946007)(8676002)(44832011)(41300700001)(6862004)(8936002)(5660300002)(316002)(66476007)(83380400001)(82960400001)(33716001)(2906002)(186003)(38100700002)(86362001)(67856001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o9o9LOAq9qoO1h37+YynAxhXdZB1jx0Uj+Wg6VNt+7USf1Gb4xOfPvwANNZM?=
 =?us-ascii?Q?bggbIhrGVBjkEL8DBDuk4BvTwSZOJaRd7PrPq4LXFXMhWCOc/oNUOROrq17S?=
 =?us-ascii?Q?Iqb1hi8tRikxpNK2pL8tRqgBBOo9hi6C01e1hrxdmgckpNRQQbclRQywiKHC?=
 =?us-ascii?Q?MTLpyHxlbK/v5tUNRkMHQDTd2Zatol7ATw8FmLfKu+4yQ+jTb/Gv65nbw0aR?=
 =?us-ascii?Q?3XSTLquAzzw7KierXT1d/o54VHTY1BhPN49SKMOC0GmtNulm9WqQL36yJh3q?=
 =?us-ascii?Q?zvTOY+ORNzuBld37/EZrbcGE/5WC9Cm0UboeaKkuN09b388TiWh2zqzj5vqi?=
 =?us-ascii?Q?qrLZLQWAnivrzYkSn9KgpuXpNWYDiG11npVmzixbKdR4bz2VsLTSsfgtVm+G?=
 =?us-ascii?Q?nKMmGZCagRZ1lRYOg3T59uuhWl+fZkFoTACDG7NOWxP02xIaEDH5no6pcmPg?=
 =?us-ascii?Q?wCh+iyNP+V9TN1rNxAE+H3S5+t5PgZx1PGi6b/pHJUhd7TSy2l7MsZd7+Yoa?=
 =?us-ascii?Q?rb/WnFxAW2vcLQdeY5Mp9HCZ6/v+LKaGsvTYBbEFohd/tOOAuY9q7aGxyVVv?=
 =?us-ascii?Q?6vjdfZ/yG8AWN15vzXdwL0XXP8ZUFuXfli08xg9FyWXSlg4FdrHW1ppAGs5v?=
 =?us-ascii?Q?8rdTMCYfBrsKB9Oht26WlKUONfYDR5IuUPsXLKLYSRdF62oZr4Vp9XyqRUHp?=
 =?us-ascii?Q?uRqpQozMeeDqxiFb75kJ0lnDhMo02m5Kw32kqJAA1DIaJl4VFcDdrff0uTN4?=
 =?us-ascii?Q?IJj5qL9R8mGAUMDaPZPRHfLEHb0HRps8cNI0AuBDJCqKn8xj8peMnYojBMJv?=
 =?us-ascii?Q?dXjC8QE7d3bNPJddxPl0tHQHBy2MLf1hwBmlHTOeG/OD/ZXrsWFEL542u3cS?=
 =?us-ascii?Q?UWPU7mONnjlEPCnTMQChd/FMGu+u5kXlZ1NC3qeh9tgVeG+AyJkmATnjAIpR?=
 =?us-ascii?Q?GV718kceBJWfz2KzeuW9NFL79rf5m/S721j8K6KF0doVlJHTky/+9aPuuyDq?=
 =?us-ascii?Q?HEYKz+kYQjcJp1sZzsVMg9DKBbKNmLH0Xq/fRoo6WQLDA845JwaWjOw/lUSU?=
 =?us-ascii?Q?wZosyb+BDKsZiPnrLUD0AcLWJBmFg+JbMTQoFIewzAouCP+0LygbfBX3ZI8G?=
 =?us-ascii?Q?NNlS0R5cOqtwyKGP5DTlTu3zAurF2WduWWdDNZhIsMxJ1L8IZnjrGj5XkvUX?=
 =?us-ascii?Q?dN/mXz3E9D8QLP1DWfhuyioDnmWGfuDsV21p6b+bdRQWXHj/EEZxYjX1T3R/?=
 =?us-ascii?Q?n8sk9N3x7V97FDuUWbQmYYOwcIhYdvLxZzRhFQykt03mMqs5R+oGqLlLxvUW?=
 =?us-ascii?Q?/a8JF+A4py1pDSLVFqoZrU5j2va6HcYGZcOWKFq9ObkJu4MBYESImkYpfnjx?=
 =?us-ascii?Q?HEA4j7AclG9at5koxxNDHFm0dQ1qqFYbuC+WGeRncpFSqmSvgDgXB/25JH+c?=
 =?us-ascii?Q?7SLoZky+IKu37GrAmHh1LSBv4T9yW5cVSzwP77IWgcLZepcFRfBvi99uOb0x?=
 =?us-ascii?Q?yPr1UGmEXJkBQQ0qORpiPZFgSxFqOPArIzSLY3Yg/8N1JvUG1EmCJak5Cael?=
 =?us-ascii?Q?feEjriLcQnK4Cqy/TADpOipLmhUQGWCBnFmwvDT7teXU0Ee1ODIcgIA1eBm6?=
 =?us-ascii?Q?5pZ7T4pdPLO2cCSCm8EOIOs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a3d63dbc-c946-450f-18b2-08dab1288b2f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 16:48:11.9199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5P1ByFTdfsAumoYyAP33wTBuQAc8SY38/e67qdKQV0/uLwfqAGZZTnQ3gR2v2LbowuWpELJG7KP6w8L4U8GvGAJ/qDqLJ52NLNgQ9Kl9TgZ6c+wwLWM2v3+DReIkatIm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6499
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

On Tue, Oct 18, 2022 at 05:03:16PM +0100, Matthew Auld wrote:
>On 18/10/2022 08:16, Niranjana Vishwanathapura wrote:
>>Add getparam support for VM_BIND capability version.
>>Add VM creation time flag to enable vm_bind_mode for the VM.
>>
>>v2: update kernel-doc
>>v3: create vm->root_obj only upon I915_VM_CREATE_FLAGS_USE_VM_BIND
>>v4: replace vm->vm_bind_mode check with i915_gem_vm_is_vm_bind_mode()
>>
>>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  drivers/gpu/drm/i915/gem/i915_gem_context.c | 25 +++++++++++++++++++--
>>  drivers/gpu/drm/i915/gem/i915_gem_context.h |  3 +--
>>  drivers/gpu/drm/i915/gt/intel_gtt.c         |  2 ++
>>  drivers/gpu/drm/i915/i915_drv.h             |  2 ++
>>  drivers/gpu/drm/i915/i915_getparam.c        |  3 +++
>>  include/uapi/drm/i915_drm.h                 | 22 +++++++++++++++++-
>>  6 files changed, 52 insertions(+), 5 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>index 76c6419b7ae0..0376adbbeecc 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>@@ -1803,9 +1803,13 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
>>  	if (!HAS_FULL_PPGTT(i915))
>>  		return -ENODEV;
>>-	if (args->flags)
>>+	if (args->flags & I915_VM_CREATE_FLAGS_UNKNOWN)
>>  		return -EINVAL;
>>+	if ((args->flags & I915_VM_CREATE_FLAGS_USE_VM_BIND) &&
>>+	    !HAS_VM_BIND(i915))
>>+		return -EOPNOTSUPP;
>>+
>>  	ppgtt = i915_ppgtt_create(to_gt(i915), 0);
>>  	if (IS_ERR(ppgtt))
>>  		return PTR_ERR(ppgtt);
>>@@ -1818,15 +1822,32 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
>>  			goto err_put;
>>  	}
>>+	if (args->flags & I915_VM_CREATE_FLAGS_USE_VM_BIND) {
>>+		struct drm_i915_gem_object *obj;
>>+
>>+		obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
>>+		if (IS_ERR(obj)) {
>>+			err = PTR_ERR(obj);
>>+			goto err_put;
>>+		}
>>+
>>+		ppgtt->vm.root_obj = obj;
>>+	}
>>+
>>  	err = xa_alloc(&file_priv->vm_xa, &id, &ppgtt->vm,
>>  		       xa_limit_32b, GFP_KERNEL);
>>  	if (err)
>>-		goto err_put;
>>+		goto err_root_obj_put;
>>  	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
>>  	args->vm_id = id;
>>  	return 0;
>>+err_root_obj_put:
>>+	if (ppgtt->vm.root_obj) {
>>+		i915_gem_object_put(ppgtt->vm.root_obj);
>>+		ppgtt->vm.root_obj = NULL;
>>+	}
>>  err_put:
>>  	i915_vm_put(&ppgtt->vm);
>>  	return err;
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.h b/drivers/gpu/drm/i915/gem/i915_gem_context.h
>>index e8b41aa8f8c4..b53aef2853cb 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_context.h
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.h
>>@@ -150,8 +150,7 @@ int i915_gem_context_reset_stats_ioctl(struct drm_device *dev, void *data,
>>   */
>>  static inline bool i915_gem_vm_is_vm_bind_mode(struct i915_address_space *vm)
>>  {
>>-	/* No support to enable vm_bind mode yet */
>>-	return false;
>>+	return !!vm->root_obj;
>>  }
>>  struct i915_address_space *
>>diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.c b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>index 50648ab9214a..ae66fdd4bce9 100644
>>--- a/drivers/gpu/drm/i915/gt/intel_gtt.c
>>+++ b/drivers/gpu/drm/i915/gt/intel_gtt.c
>>@@ -178,6 +178,8 @@ int i915_vm_lock_objects(struct i915_address_space *vm,
>>  void i915_address_space_fini(struct i915_address_space *vm)
>>  {
>>  	drm_mm_takedown(&vm->mm);
>>+	if (vm->root_obj)
>>+		i915_gem_object_put(vm->root_obj);
>>  	GEM_BUG_ON(!RB_EMPTY_ROOT(&vm->va.rb_root));
>>  	mutex_destroy(&vm->vm_bind_lock);
>>  }
>>diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>>index 7c64f8a17493..f4e7f3d4aff9 100644
>>--- a/drivers/gpu/drm/i915/i915_drv.h
>>+++ b/drivers/gpu/drm/i915/i915_drv.h
>>@@ -972,6 +972,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>  #define HAS_BAR2_SMEM_STOLEN(i915) (!HAS_LMEM(i915) && \
>>  				    GRAPHICS_VER_FULL(i915) >= IP_VER(12, 70))
>>+#define HAS_VM_BIND(i915) (GRAPHICS_VER(i915) >= 12)
>>+
>>  /* intel_device_info.c */
>>  static inline struct intel_device_info *
>>  mkwrite_device_info(struct drm_i915_private *dev_priv)
>>diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
>>index 342c8ca6414e..f45b3c684bcf 100644
>>--- a/drivers/gpu/drm/i915/i915_getparam.c
>>+++ b/drivers/gpu/drm/i915/i915_getparam.c
>>@@ -175,6 +175,9 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>>  	case I915_PARAM_PERF_REVISION:
>>  		value = i915_perf_ioctl_version();
>>  		break;
>>+	case I915_PARAM_VM_BIND_VERSION:
>>+		value = HAS_VM_BIND(i915);
>>+		break;
>>  	default:
>>  		DRM_DEBUG("Unknown parameter %d\n", param->param);
>>  		return -EINVAL;
>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>index fe7ee8f19c83..c2dce8633005 100644
>>--- a/include/uapi/drm/i915_drm.h
>>+++ b/include/uapi/drm/i915_drm.h
>>@@ -771,6 +771,22 @@ typedef struct drm_i915_irq_wait {
>>  /* Query if the kernel supports the I915_USERPTR_PROBE flag. */
>>  #define I915_PARAM_HAS_USERPTR_PROBE 56
>>+/*
>>+ * VM_BIND feature version supported.
>>+ *
>>+ * The following versions of VM_BIND have been defined:
>>+ *
>>+ * 0: No VM_BIND support.
>>+ *
>>+ * 1: In VM_UNBIND calls, the UMD must specify the exact mappings created
>>+ *    previously with VM_BIND, the ioctl will not support unbinding multiple
>>+ *    mappings or splitting them. Similarly, VM_BIND calls will not replace
>>+ *    any existing mappings.
>>+ *
>>+ * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.
>>+ */
>>+#define I915_PARAM_VM_BIND_VERSION	57
>>+
>>  /* Must be kept compact -- no holes and well documented */
>>  /**
>>@@ -2622,6 +2638,9 @@ struct drm_i915_gem_context_destroy {
>>   * on the same file. Extensions can be provided to configure exactly how the
>>   * address space is setup upon creation.
>>   *
>>+ * If I915_VM_CREATE_FLAGS_USE_VM_BIND flag is set, VM created will work in
>>+ * VM_BIND mode.
>>+ *
>>   * The id of new VM (bound to the fd) for use with I915_CONTEXT_PARAM_VM is
>>   * returned in the outparam @id.
>>   *
>>@@ -2638,7 +2657,8 @@ struct drm_i915_gem_vm_control {
>>  	/** @extensions: Zero-terminated chain of extensions. */
>>  	__u64 extensions;
>>-	/** @flags: reserved for future usage, currently MBZ */
>
>This looks to remove the kernel-doc completely, instead of updating it.
>

Ah, will fix it.

Regards,
Niranjana

>>+#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1u << 0)
>>+#define I915_VM_CREATE_FLAGS_UNKNOWN	(-(I915_VM_CREATE_FLAGS_USE_VM_BIND << 1))
>>  	__u32 flags;
>>  	/** @vm_id: Id of the VM created or to be destroyed */
