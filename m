Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFFA781C4B
	for <lists+dri-devel@lfdr.de>; Sun, 20 Aug 2023 05:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8554910E0A0;
	Sun, 20 Aug 2023 03:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6929010E0A0;
 Sun, 20 Aug 2023 03:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692503724; x=1724039724;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=EGRgogYnF4GDb+owhiWhdZ+0F8sBfNBGRJlJ4zIgOqY=;
 b=VaSGsO+YebWZtwAdTe42eBHq2YCmQpmWt2nBXd1idBPn4g7Wmcy1O3qw
 exl3JsoVLiyOS7DZHUivCQxHTVNXHQqah+saZy7A9hix7Nhk6UqMpj0Ab
 L364G4rNECxlwHTI77RxRV7gpwrGqymrEzQ3vbnRzCLsXr9FrChEn0sS7
 zK95Rr0nsuYZdOdDpUTfdwnK/lazlzUAQnb6y7YIxxy2LLSMOjurMbWdq
 KxYnMJPr/DUUjQMsJGraBP7Qv60nDOCwj1hbKl6HWlUpT9wXESMj4SeXC
 pF3/AOVzHQovKsBvY+LCnqd+KUnzTftmqfoQTT3Q79v/zg0VSktguB8Xo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10807"; a="377103044"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="377103044"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2023 20:55:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10807"; a="825537791"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="825537791"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2023 20:55:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 19 Aug 2023 20:55:22 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sat, 19 Aug 2023 20:55:21 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sat, 19 Aug 2023 20:55:21 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sat, 19 Aug 2023 20:55:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DzAPB04vf4T36q+D4QJl3ONd60e9Z/LS/3rrOmTIIwMyXDWQlCk+bcoYcwiebeDlw6AIb0tMaj+4iRhKDckJdv44FhDpJfNhbr3di95OzYIJ365dlCpH86O+gilixRmVrmUz2ziNmtTyZRi4b1KBzwtWTq5Ot3LXOppPL5W9fjNbRIZhobc49qQev+D+gW5mhgWXC27BphvAQo2mV5kS5/zVwk4EQhS2LvE3zOmZZOjV/vyfrd9JmNCkkXtpK4Y4qY9EVq6KiDemGhRVewDlmHqrjYEx5chm8GVlXdql4q/+YuU50wl/cmAfpmVoBa40R3i8tRmNyMfdV3atUrlV4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f8O0slwcPzSQsnX0plntBnnPN1lp6gLtI0CP+51Ft0Y=;
 b=IJEI7L4CyzEqiXXetdhSblgJDZ6dKKz+A4LT7jUB5zwvODk5tareC9LBbAp4QCpaAM+O6bUsupYuoULo7EiL047SVdZm2v0ln3mnFXZkOhECX0CNQOLdBhp8QsRIWWxFhNMP9EgkovGTrMZEYFLeV9SNfLdjqtVEGTEUSHcOSAId35s2sPcsv8fZzrbg/IdgGA4/+sd7sxvSpStbw649p0JRo1p21/5nqPrjeyhNhzgMXYW+dQycTccoHwWXh6af92+EIPRHP++4/eQvE+N4qFUv9pVQnvfHcaQ5c6Csn8E1h7vfrdBljH28/SLqL9TaAIbyZjEtYM6SCq70z5vT+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6512.namprd11.prod.outlook.com (2603:10b6:930:40::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Sun, 20 Aug
 2023 03:55:19 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b429:ee19:a001:eb69%5]) with mapi id 15.20.6699.020; Sun, 20 Aug 2023
 03:55:19 +0000
Date: Sun, 20 Aug 2023 03:54:14 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 4/4] drm/xe/uapi: Support pinning of userptr vmas
Message-ID: <ZOGOZsqw8+/VjxDs@DUT025-TGLU.fm.intel.com>
References: <20230818150845.96679-1-thomas.hellstrom@linux.intel.com>
 <20230818150845.96679-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230818150845.96679-5-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0002.namprd05.prod.outlook.com
 (2603:10b6:a03:254::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6512:EE_
X-MS-Office365-Filtering-Correlation-Id: 40404812-6cbe-46ac-f88f-08dba1314545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dII/4axfJWTq7j32UikAepWb4JvICxVFD5nXuO9VoNLShta27v9F/r86lDi2PuurDmaR1L84eNIi4VhOuddIoU4pnJEREuGQX5qJbxAUjSCqNhDJX/l2MpEkL92G/pvrmYQNZC3STyNIVKx3NYLEJagyPlnr/20MU/DyxIsud+OR8+XU0jxZYT8DnICrs72tSLIbfDUbXM5+vEWEQewTxFfn6h1p0pebl2H2xC7sCrnL1/hLa/IfNzIlH0S3XhBD0lcxh39CgaM0/ekdzfrzZltHpTPzJI1v1J4/4+YXK2d6BgNJWfhWZ5mpHGCfMbCxYs5zIq0qdip53tk7kBtwkoCYv+HQQD/rVFBsJU+6kF/Z34qxc43mm8n6Gop1uHcm9LIVTp+lrcCV6v6mg0ZO/iCWKOtBj3YluTvMZ+jyH8JIfT02tgPr5tjZ/zm1TkrG91xnqwO0hWxalh3GfEC5Q9cV96DNKOHPJ8okGYLO0kAzBiVhMQp+9x4/yX3aVNJDF2SJLbjLD9lty6dl88W/lJ1c5KaynZx5u4uzveuujHu7tR34VpiDGO9F3jYgDP7V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(396003)(366004)(136003)(346002)(451199024)(1800799009)(186009)(86362001)(44832011)(5660300002)(41300700001)(316002)(2906002)(66946007)(6916009)(66556008)(54906003)(66476007)(8936002)(4326008)(8676002)(478600001)(82960400001)(6666004)(6486002)(38100700002)(6506007)(6512007)(26005)(66574015)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?LnYZg2oQXR5qPKFOKSdlYxmsO7mLAhs89EaWAM2TqyP1NVQVx+9hBEcj25?=
 =?iso-8859-1?Q?RCZRUOpuSPd2GR59Ylr88QObqM/Pcx3RT3UOlf70D6jpQcurUxm2tqvOaO?=
 =?iso-8859-1?Q?2kkv/A+DCgpKWQYfpW/PCgNc7t/9HuD14g5FVKsI97Ntc4AlekUHpXozsr?=
 =?iso-8859-1?Q?3OZ9EP16A0mSkExT4yd0hanrF7dLMBnwk9GnWQLqNlFdXEGxJ8DK4a508h?=
 =?iso-8859-1?Q?gVc3RdG464ZRuiHpzgwlQgAZZFkcPzcQwH4EwGaO6JlIcNjrW6I6z3TfRD?=
 =?iso-8859-1?Q?KeYX47y9LgRofLj0Od3ebiFTJ+w6UHkFmgQxBF6IuZFrJlzrV5i8/L5cn7?=
 =?iso-8859-1?Q?YpzdTkPEhM6Mz+254E9K3jOq/cByy+xDoqSTmtBZOGr2z0yC8AAFMyzieP?=
 =?iso-8859-1?Q?SDc5MV+EtXIUBsTuG6bd9JpPzU7rQYY9zyEXWt9qt9rD4ygdZYCBbKEv2h?=
 =?iso-8859-1?Q?y8O4U6STQ2nzqnmZ81HkcX/QwG8QrZdIF67RUspQ+tnhYv2ymmLs37XhRn?=
 =?iso-8859-1?Q?t3hUqaPKBGF32xo5nyYMQMJl3Fff+JJywHZ6HDbDe+SVe9FpFZKP+8rs/a?=
 =?iso-8859-1?Q?gEoyY87nZ80rIuKhptwMGnAtOHO7sDlRqz3yZM+Rv8WlePfEeFPRnYzQq1?=
 =?iso-8859-1?Q?nCq/So1HhbA7cJyy/S832ux2VVcvVbceJBnD+ho1aTKsgUuUTM4iz9vO8d?=
 =?iso-8859-1?Q?wAYYsHO9ptoxzbD622h2GMtGpqMCVAPLYNunCZkAj7Hqjd/aWJRbbxWP0y?=
 =?iso-8859-1?Q?hOIdM4nbRH22+nTUVp/ISROeJWDo55QbNAlZIHxW1qFtkOqE3RxzOoCYPl?=
 =?iso-8859-1?Q?542sZ7FHZtwnmxUAhV6sLfy7xzCk+Fz50DwE4re9QH4Kv6oIs844hIYFge?=
 =?iso-8859-1?Q?IPvDcOcqUIYcCVwZBhh7An/JsvKykDq7S7MFTjx6RV7kTxOhwvUDIs/c8G?=
 =?iso-8859-1?Q?+VPetkpqIE4UXaJRQjgtIg5vW2LDAlLZOelkqkg25FKqxjNr1jUpvwo0z1?=
 =?iso-8859-1?Q?gZuK6Mgd7Hd10DE48ADP6hcErUWkNWBXIeUFi23CqQb1BpxOHDx1qsgjlI?=
 =?iso-8859-1?Q?AgkY3Vm0IVTxTZQLagB+ic/qL1itIAPcn9b3NDj+f/Z17NqUsjzK9CijZU?=
 =?iso-8859-1?Q?FkIcVIRKTEkvZukAPS0XfRABD6XP7Dtw67dpxJV2CJLALuRiQZv5o6Shsu?=
 =?iso-8859-1?Q?laL6Uki3OHrSyAnrqW4uY8e2q+ryUvhwQLVqT0ceYP/z3osF6UgCU4ZYnT?=
 =?iso-8859-1?Q?Sqb3B4fbjzdgv0IdAeyl30cgeFfcDENtxdWtNg8FOsUR0XD7xAIzYJN4GF?=
 =?iso-8859-1?Q?FwX2x8HB8XQ2ozViqUM1mb3GGZlkoPvlMNrmS4jRFfj6sGoiIh+TPK4DH1?=
 =?iso-8859-1?Q?tT4UQ/D3eYcqnHaOUpLhVo5OtXwzsEK0BHc8HPPLFCSmdnx55NqmCHp0Dl?=
 =?iso-8859-1?Q?DlNXbsulY+wO8BTxJDH3iocvCsRy/Q5nK6T/f8/OtAd6exjtey/DJVNBQr?=
 =?iso-8859-1?Q?77maZvgq0mvgXr9lHdOP/J4HqedUhR7tKDVa/GJUuDG3ffjfTYKKbO1Pjp?=
 =?iso-8859-1?Q?2EmIyzCS3SIs93j96q3K8jXcA+WpEHuWWTQ5fdAfjtgK8Hdx6EoJaXgpb4?=
 =?iso-8859-1?Q?l7yEaZop7C+5mOdXMrRkJ8GX0kOKKVae4q5qIjq1UQOOpQhXhiBZ8+Vw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40404812-6cbe-46ac-f88f-08dba1314545
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2023 03:55:19.2247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVL5cBtYCuVNn804t2JsYQ2hvC4WhLSw6TjJzjkMqkEluKCuu5DrXAsrm0M6TWDPN9arCuM85GQR6TGjE9UJmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6512
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
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 18, 2023 at 05:08:45PM +0200, Thomas Hellström wrote:
> Support pinning of vmas using XE_VM_BIND_FLAG_PIN, initially for userptr
> only. Pinned memory becomes accounted against RLIMIT_MEMLOCK and processes
> with CAP_IPC_LOCK will not apply the limit. This is pretty similar to
> mlock()'ing userptr memory with the added benefit that the driver is
> aware and can ignore some actions in the MMU invalidation notifier.
> 
> This will initially become useful for compute VMs on hardware without
> mid-thread-preemption capability since with pinned pages, the MMU
> invalidation notifier never tries to preempt a running compute kernel.
> 
> If that were the only usage we could restrict this to a flag that always
> pins userptr VMAs on compute VMs on such hardware, but there are
> indications that this may become needed in other situations as well.
> 
> From a more general point of view, the usage pattern of a system may be
> such that in most cases it only ever runs a single workload per system
> and then the sysadmin would want to configure the system to allow
> extensive pinning for performance reasons.
> 
> Hence we might want to extend the pinning capability to bo-backed VMAs
> as well. How that pinning will be accounted remains an open but to build
> on the current drm CGROUP work would be an option.
> 
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Patch LGTM but a few comments that are currently out of scope but want
to get out there for future work.

> ---
>  drivers/gpu/drm/xe/xe_vm.c       | 33 +++++++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 ++
>  include/uapi/drm/xe_drm.h        | 18 +++++++++++++++++
>  3 files changed, 46 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index d9c000689002..3832f1f21def 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -936,6 +936,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  				    u64 start, u64 end,
>  				    bool read_only,
>  				    bool is_null,
> +				    bool pin,
>  				    u8 tile_mask)
>  {
>  	struct xe_vma *vma;
> @@ -967,6 +968,8 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
>  		vma->gpuva.flags |= XE_VMA_READ_ONLY;
>  	if (is_null)
>  		vma->gpuva.flags |= DRM_GPUVA_SPARSE;
> +	if (pin)
> +		vma->gpuva.flags |= XE_VMA_PINNED;
>  
>  	if (tile_mask) {
>  		vma->tile_mask = tile_mask;
> @@ -2367,6 +2370,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.read_only =
>  				operation & XE_VM_BIND_FLAG_READONLY;
>  			op->map.is_null = operation & XE_VM_BIND_FLAG_NULL;
> +			op->map.pin = operation & XE_VM_BIND_FLAG_PIN;
>  		}
>  		break;
>  	case XE_VM_BIND_OP_UNMAP:
> @@ -2431,7 +2435,8 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  }
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> -			      u8 tile_mask, bool read_only, bool is_null)
> +			      u8 tile_mask, bool read_only, bool is_null,
> +			      bool pin)
>  {
>  	struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) : NULL;
>  	struct xe_vma *vma;
> @@ -2447,7 +2452,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
>  	}
>  	vma = xe_vma_create(vm, bo, op->gem.offset,
>  			    op->va.addr, op->va.addr +
> -			    op->va.range - 1, read_only, is_null,
> +			    op->va.range - 1, read_only, is_null, pin,
>  			    tile_mask);
>  	if (bo)
>  		xe_bo_unlock(bo, &ww);
> @@ -2562,7 +2567,7 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  
>  				vma = new_vma(vm, &op->base.map,
>  					      op->tile_mask, op->map.read_only,
> -					      op->map.is_null);
> +					      op->map.is_null, op->map.pin);
>  				if (IS_ERR(vma)) {
>  					err = PTR_ERR(vma);
>  					goto free_fence;
> @@ -2587,10 +2592,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  					bool is_null =
>  						op->base.remap.unmap->va->flags &
>  						DRM_GPUVA_SPARSE;
> +					bool pin =
> +						op->base.remap.unmap->va->flags &
> +						XE_VMA_PINNED;

We probably should move the read_only, is_null, and pin check out of the
next / prev if statements to just below the DRM_GPUVA_OP_REMAP case
statement. 

>  
>  					vma = new_vma(vm, op->base.remap.prev,
>  						      op->tile_mask, read_only,
> -						      is_null);
> +						      is_null, pin);
>  					if (IS_ERR(vma)) {
>  						err = PTR_ERR(vma);
>  						goto free_fence;
> @@ -2623,10 +2631,13 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct xe_exec_queue *q,
>  					bool is_null =
>  						op->base.remap.unmap->va->flags &
>  						DRM_GPUVA_SPARSE;
> +					bool pin =
> +						op->base.remap.unmap->va->flags &
> +						XE_VMA_PINNED;
>  
>  					vma = new_vma(vm, op->base.remap.next,
>  						      op->tile_mask, read_only,
> -						      is_null);
> +						      is_null, pin);
>  					if (IS_ERR(vma)) {
>  						err = PTR_ERR(vma);
>  						goto free_fence;
> @@ -3131,11 +3142,12 @@ static void vm_bind_ioctl_ops_unwind(struct xe_vm *vm,
>  #define SUPPORTED_FLAGS	\
>  	(FORCE_ASYNC_OP_ERROR | XE_VM_BIND_FLAG_ASYNC | \
>  	 XE_VM_BIND_FLAG_READONLY | XE_VM_BIND_FLAG_IMMEDIATE | \
> -	 XE_VM_BIND_FLAG_NULL | 0xffff)
> +	 XE_VM_BIND_FLAG_NULL | XE_VM_BIND_FLAG_PIN | 0xffff)
>  #else
>  #define SUPPORTED_FLAGS	\
>  	(XE_VM_BIND_FLAG_ASYNC | XE_VM_BIND_FLAG_READONLY | \
> -	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | 0xffff)
> +	 XE_VM_BIND_FLAG_IMMEDIATE | XE_VM_BIND_FLAG_NULL | \
> +	 XE_VM_BIND_FLAG_PIN | 0xffff)
>  #endif
>  #define XE_64K_PAGE_MASK 0xffffull
>  
> @@ -3205,6 +3217,13 @@ static int vm_bind_ioctl_check_args(struct xe_device *xe,
>  			goto free_bind_ops;
>  		}
>  
> +		/* TODO: Support OP_PREFETCH, OP_MAP */
> +		if (XE_IOCTL_DBG(xe, (op & XE_VM_BIND_FLAG_PIN) &&
> +				 VM_BIND_OP(op) != XE_VM_BIND_OP_MAP_USERPTR)) {
> +			err = -EINVAL;
> +			goto free_bind_ops;
> +		}
> +
>  		if (XE_IOCTL_DBG(xe, VM_BIND_OP(op) >
>  				 XE_VM_BIND_OP_PREFETCH) ||
>  		    XE_IOCTL_DBG(xe, op & ~SUPPORTED_FLAGS) ||
> diff --git a/drivers/gpu/drm/xe/xe_vm_types.h b/drivers/gpu/drm/xe/xe_vm_types.h
> index 9b90e649cd69..024ccabadd12 100644
> --- a/drivers/gpu/drm/xe/xe_vm_types.h
> +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> @@ -360,6 +360,8 @@ struct xe_vma_op_map {
>  	bool read_only;
>  	/** @is_null: is NULL binding */
>  	bool is_null;
> +	/** @pin: pin underlying memory */
> +	bool pin;
>  };
>  
>  /** struct xe_vma_op_remap - VMA remap operation */
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 86f16d50e9cc..fc3d9cd4f8d0 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -631,6 +631,24 @@ struct drm_xe_vm_bind_op {
>  	 * intended to implement VK sparse bindings.
>  	 */
>  #define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
> +	 /*
> +	  * When the PIN flag is set, the user requests the underlying
> +	  * backing store of the vma to be pinned, that is, it will be
> +	  * resident while bound and the underlying physical memory
> +	  * will not change. For userptr VMAs this means that if the
> +	  * user performs an operation that changes the underlying
> +	  * pages of the CPU virtual space, the corresponding pinned
> +	  * GPU virtual space will not pick up the new memory unless
> +	  * an OP_UNMAP followed by a OP_MAP_USERPTR is performed.
> +	  * Pinned userptr memory is accounted in the same way as
> +	  * mlock(2), and if pinning fails the following error codes
> +	  * may be returned:
> +	  * -EINVAL: The memory region does not support pinning.
> +	  * -EPERM: The process is not permitted to pin.
> +	  * -ENOMEM: The pinning limit does not allow pinning.
> +	  * For userptr memory, CAP_IPC_LOCK will bypass the limit checking.
> +	  */
> +#define XE_VM_BIND_FLAG_PIN		(0x1 << 20)

We are quickly using a lot of the upper bits, maybe we change the op
field to a __u64 soon? We have to break the VM bind api when removing
the async worker + updating sync mode to align with VM bind doc, maybe
we change this then too?

Anyways this patch LGTM:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

>  	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
>  	__u32 op;
>  
> -- 
> 2.41.0
> 
