Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB0B5FE8F3
	for <lists+dri-devel@lfdr.de>; Fri, 14 Oct 2022 08:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D80D10E42D;
	Fri, 14 Oct 2022 06:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EF510E395;
 Fri, 14 Oct 2022 06:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665729279; x=1697265279;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SZz+IG4WmZqLD53+3+KAigQEOFGq56EJJnlaWxX1HM8=;
 b=YAwHHeP47/mQpHzu911yWSqmH0/atWm/bYgrKKrhW4YITyhVI6IUBNpY
 ZDOV9WTNTfFJpMUJvdwlSs7lZBUkqH95vR5qOlmBDsvANxz8AKFLqf3Ud
 6EkJfLui39qcYqVllRNIANaKfuYmwGYTOS17i8hoAnX9ukMmHI8nMvtRs
 HpojF72rkCvBKVdBA4tuB5YyWPUBlp3VObi5pwIISs5rTPFG/jYBscCij
 vgJkG05ZGfejBqnCapTOJ+WSsfIt50weT8wL+oer5yIPopMLie3wgp77i
 wvkON086TxjGUHp/2d71GsQcIzzQKvHO1yIeygptLUelOhIkslgawh39V g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="306952800"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="306952800"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2022 23:34:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10499"; a="752815439"
X-IronPort-AV: E=Sophos;i="5.95,182,1661842800"; d="scan'208";a="752815439"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP; 13 Oct 2022 23:34:38 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 23:34:37 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 13 Oct 2022 23:34:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 13 Oct 2022 23:34:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 13 Oct 2022 23:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nrclfxfGq3mzJHpSD6oO6qwr2wam5zxzG6kBMbuffZP3GgJrUiK+3nVLn7ZiEACd8+P7qOqLNnTsmCuuqJBLUsqmYYSddniaFMCfoib2ghV6gg3TsJmfn8vkVJdzz2p0Su2AlSFZQNErit5S6t4f8CPJ5LOqfVupeewF3nQp6SLmCRMMknLK3uJ740vaNZCC6BxyM+I7C9HiUm/3SZ5P7Si/uC2Pa31RzoMj22wrAWKoNQQqa/4hO7usjSxd/9nlvLET9WnBYqqnjA1cGVtagJ4VwzTIm/K0ho2pMY0O+0VTkeEqdauq+dpvWNtmKvBW7TAzlK3epJt+24l9BVB52Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEHO6jRdqyXfp+f/xhkYVeKBBWyBAJyfylYEfwWMWzY=;
 b=DPU+IS8txIXU/qL0CBLfAHeJe1ANo4BIFjuQfSeE6VrFV48Kg9jM7ao5JrMJ43RWtIdbBrbdW5s+mI4ws7+xrg8r0HJIjVynxDf0c9V9/+LAlcPyrIoNA4IjfZjHdtuoDDl1bFFqheF/hICldL4cM6ORy+LPpAerdRoRWk8MN9hTdUYMdAjcExowWahs+VqlDKjBajkc/Zj2EJzy4W3gmgHpEt4NCcp/ibqrbtJXBvGliWnRWBiyz/5+FLmtNgV5aV8ZraPEE10VOkIuAaykshgdVCCg3lPUYS2+mer3pOOVKkMIvG+HRKXDX06pDS31+4oRPYvvLN1V+pjd7JOAmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by BL1PR11MB5555.namprd11.prod.outlook.com (2603:10b6:208:317::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 06:34:33 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::91e7:70e7:97c5:a23d%3]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 06:34:34 +0000
Date: Thu, 13 Oct 2022 23:34:26 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v3 06/17] drm/i915/vm_bind: Support for VM private BOs
Message-ID: <Y0kC8hehWC2uR1ZA@nvishwa1-DESK>
References: <20221010065826.32037-1-niranjana.vishwanathapura@intel.com>
 <20221010065826.32037-7-niranjana.vishwanathapura@intel.com>
 <e3e99b0e-5b2f-4e51-28f3-b04712b2f2ea@intel.com>
 <f8fe2903-371c-dea9-b2aa-b36b665c0a99@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8fe2903-371c-dea9-b2aa-b36b665c0a99@intel.com>
X-ClientProxiedBy: SJ0PR13CA0152.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::7) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|BL1PR11MB5555:EE_
X-MS-Office365-Filtering-Correlation-Id: fd700d9e-5df1-4ce0-4787-08daadae2885
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w/NGZtkOn8FuY+uJ0VEjwqTrIiBCxm/enKMvXxWUdKbiCIcOYLLXtZOBeFZOQRqQV21vSn6pSq0soMfLAPCM50kMie2OwIPBYPWhng1TeZokIfelR+ATBDOBsH328dAWlffx1PAfDMls57ehkQhuggeofWPsdMOiBdWWKjvKgZkiS7azqN98z9lG4RBneClTDXFQg/rMVfI72i7jkLkEeKs9/MlWOinnKoQZbj38iRPYN9rLhIZ/n67hrTIapsL3RzexafiTmkDLklZY8mySPc1ujxZeIxsxZI6GU1w8sq/Pybx8vIIQ8VRkQV119KGCh0DYxCSHJA3TmV3AFCvZwVrVHux2wUIxpwGn9b/zE3CqZFJ9PtcuHavKp3Vb06qC4qhvXoLYsyuk6NLCZRk580zUx4iKNAon6nPsd6AKo9rPxA2K1LIG9CB0q7waQkpQYq4yAAMWKFZDh4kaAokqFtmaF8DX1Jlp8QUtnf3vUeUddVNSIX385zisBQPuyPS/QO602P1/TL/LQMo/SW0M/YVti21Ihwo7Zlb6xERWgehZgz6jXr2Zulc9NV1QVmdiLO6xmBKkeOV8pR53TobxurF92ABKMPsgAJyVkyshhSfPaTFU/zvx8FrJNf0h8DDrrmRy4b94Rv5dxZs5M2d27K3SlQCKrWP7bKAFi//hTkbKUP2oPjxJkmBnd0I1JCw9snElKRHboqaWcNy5MMe0dw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(7916004)(346002)(39860400002)(136003)(376002)(396003)(366004)(451199015)(316002)(478600001)(6636002)(6486002)(6666004)(66946007)(4326008)(66556008)(66476007)(8676002)(6512007)(9686003)(8936002)(26005)(41300700001)(6862004)(33716001)(186003)(44832011)(5660300002)(6506007)(2906002)(83380400001)(82960400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?vDHCPJcL1GSQGRbKb3j3laQFwOWXxt2rsgh1AEM1V0BsHaNdUp/jkdUsHC?=
 =?iso-8859-1?Q?vRoujMFJjUORqZM7DkJPOiRaaplQ+F8fp9PPLEDu6pdkwfmyX4U8jY60Ei?=
 =?iso-8859-1?Q?SieCrrrwi1j1SKGWfg6jenDlG64U2dXI23gEy4+nBr6WCfSx2RQMv3qGbI?=
 =?iso-8859-1?Q?raIFNIF9rux0VWp4fNcQcIG0cfjtA69Hhx/UqB4SjAqhAB7209pPByjHRa?=
 =?iso-8859-1?Q?NR+IkOSkPpm8RXQJp/bqvrqMR+p9BJdS8fd3GYjnI055GPIZQ2iZ2Cqglb?=
 =?iso-8859-1?Q?lAlPEcdtJSUO7ItdvIOQ7j12FSW2gDGUL8oF5vXQFQHoB5W1wDLej7IFRE?=
 =?iso-8859-1?Q?v7lxgdy9XHeb6Fg6+r6CbyaR+DtJVMRlYjzRvWAAZ4pEr5ECbZjJcGUGte?=
 =?iso-8859-1?Q?AeLBy0l3tsOKHFjkuxcLSePeie0J0HLmwzC3FLkGhtUipKe0FbI88b7rEr?=
 =?iso-8859-1?Q?zNc8B6owMV5/9fWwiV5VGPIntJ654Z5/9u5MWCuBi2bKiVw810yR6lUFY1?=
 =?iso-8859-1?Q?FUEHz1a6eN1GnDIn2dsZ8Op12eAsSF7/NqJqpDGq+ZDZqOHh71pHM9Eirn?=
 =?iso-8859-1?Q?qoAGyHauXUKvWMaU9z5WsB6FPDefpT1w8hGBs7keqnMxxk/4hazUefEL5u?=
 =?iso-8859-1?Q?VznJPfi9aIZbXYJ7TTb7dBoDuZ1fwTf1RsSvDYu9Y2QFVSS4+whal5bL6P?=
 =?iso-8859-1?Q?zk/WBl7jUH8+Ao62VGpGM3IkdAJ7fROQp5IpROGTHcSWFkYkZ9/eDqlRkK?=
 =?iso-8859-1?Q?P5kQN/Jf+M/3ku9KQNGci0RT+iWNX0Bb53DcKL9kVYi6cV9dnnWnp5sjv2?=
 =?iso-8859-1?Q?D7dZSHlDmVfnvrssNLVz9MKMmV79NBccezzf6HHkvTK/fa2fnqRJf5C9jg?=
 =?iso-8859-1?Q?cnwwA52BLdq6Btrg0Mid9R7L6xu3BrEsGboS9hX0lz3w2IHfavktVV9FEa?=
 =?iso-8859-1?Q?+/3VgxC/dw90RsMpb95drQ6edc6QN6Ns7Qp7+zmznYatw7lpXTQMHeYDlB?=
 =?iso-8859-1?Q?sRlrtz0H/qHHgksV7NJ1dz2WOTtOqJsqdQiFIVQzwyb8YMpFRwvWW2qTGJ?=
 =?iso-8859-1?Q?r/j/t8vk+0W/RzA0NmhfVMLndyPMcj357PO60CwAiPzso+kpdAVoV65I68?=
 =?iso-8859-1?Q?yPa47SJsOqD5lRzLJFb5IYU6FjvqJpjCunYsnhkGt+2twwakDA1ZkkEkdD?=
 =?iso-8859-1?Q?UW2g0vEXfvZtpzDlAVH9qFr3Lico5hBVNmn7OquQ4Iirfp9r3bcVwUSFVj?=
 =?iso-8859-1?Q?+QXWO1+GnXJWKzOzy6YWIg1p/sAknJIWrZIjtp+IgnYXp2Rh+xop6Zvz7M?=
 =?iso-8859-1?Q?MToQ/ik0MAW1s8p3A5ob1JGU97rAQMzXm9qyJ/AMeALlsd9g5sc1N1o4LA?=
 =?iso-8859-1?Q?0l8dSBA+JIB8OW1iz0543shr9jgVqdF/CpaTx2Tm4MjXZhSWE8DqCaD3AC?=
 =?iso-8859-1?Q?yK+8knSmunefnftlzeFQA9yqO47X/BbrBmpZdw4yGNG/q80gOlX816v7AA?=
 =?iso-8859-1?Q?RPOtgfdzMePVhEQ9Ns2Y69rQHYUEy60rcrLYu18f4jP7C4izvmKrjXLKwC?=
 =?iso-8859-1?Q?wRlTz0rMsaLrhK/d8cQ/EFPLaEmZ5LVEXH77k0niswGO7+nS82VMCrQzPh?=
 =?iso-8859-1?Q?OqrnNxnDGwyNcSB6Fo37C8P3At0sYikPl+/dKZAzMuJwdt4ux7lnzLSAm8?=
 =?iso-8859-1?Q?N0hohI0rEQkIIyb+HAY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd700d9e-5df1-4ce0-4787-08daadae2885
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 06:34:34.3334 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: II+RgrAZQYJ52igWX5fXuhHWBZdNINaoC0Ro+SXkwxkh23y4SSxnCsmWx433Cmi2i6OY3qzhZ39AbgNbqhHTkyK837smi1tWAXmoDSqBbaSUMixXbbGj+w9ERJFLTGTo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5555
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

On Tue, Oct 11, 2022 at 06:41:23PM +0100, Matthew Auld wrote:
>On 11/10/2022 17:27, Matthew Auld wrote:
>>On 10/10/2022 07:58, Niranjana Vishwanathapura wrote:
>>>Each VM creates a root_obj and shares it with all of its private objects
>>>to use it as dma_resv object. This has a performance advantage as it
>>>requires a single dma_resv object update for all private BOs vs list of
>>>dma_resv objects update for shared BOs, in the execbuf path.
>>>
>>>VM private BOs can be only mapped on specified VM and cannot be dmabuf
>>>exported. Also, they are supported only in vm_bind mode.
>>>
>>>v2: Pad struct drm_i915_gem_create_ext_vm_private for 64bit alignment,
>>>     add input validity checks.
>>>v3: Create root_obj only for ppgtt.
>>>
>>>Signed-off-by: Niranjana Vishwanathapura 
>>><niranjana.vishwanathapura@intel.com>
>>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>---
>>>  drivers/gpu/drm/i915/gem/i915_gem_context.c   | 16 +++++-
>>>  drivers/gpu/drm/i915/gem/i915_gem_create.c    | 49 ++++++++++++++++++-
>>>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  6 +++
>>>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  4 ++
>>>  drivers/gpu/drm/i915/gem/i915_gem_object.c    |  3 ++
>>>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |  3 ++
>>>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  3 ++
>>>  .../drm/i915/gem/i915_gem_vm_bind_object.c    |  9 ++++
>>>  drivers/gpu/drm/i915/gt/intel_gtt.c           |  3 ++
>>>  drivers/gpu/drm/i915/gt/intel_gtt.h           |  2 +
>>>  drivers/gpu/drm/i915/i915_vma.c               |  1 +
>>>  drivers/gpu/drm/i915/i915_vma_types.h         |  2 +
>>>  include/uapi/drm/i915_drm.h                   | 33 +++++++++++++
>>>  13 files changed, 131 insertions(+), 3 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c 
>>>b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>index 793345cbf99e..5ea7064805f3 100644
>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>>@@ -83,6 +83,7 @@
>>>  #include "i915_file_private.h"
>>>  #include "i915_gem_context.h"
>>>+#include "i915_gem_internal.h"
>>>  #include "i915_trace.h"
>>>  #include "i915_user_extensions.h"
>>>@@ -1795,6 +1796,7 @@ int i915_gem_vm_create_ioctl(struct 
>>>drm_device *dev, void *data,
>>>      struct drm_i915_private *i915 = to_i915(dev);
>>>      struct drm_i915_gem_vm_control *args = data;
>>>      struct drm_i915_file_private *file_priv = file->driver_priv;
>>>+    struct drm_i915_gem_object *obj;
>>>      struct i915_ppgtt *ppgtt;
>>>      u32 id;
>>>      int err;
>>>@@ -1817,15 +1819,27 @@ int i915_gem_vm_create_ioctl(struct 
>>>drm_device *dev, void *data,
>>>              goto err_put;
>>>      }
>>>+    obj = i915_gem_object_create_internal(i915, PAGE_SIZE);
>>>+    if (IS_ERR(obj)) {
>>>+        err = PTR_ERR(obj);
>>>+        goto err_put;
>>>+    }
>>>+
>>>+    ppgtt->vm.root_obj = obj;
>>>+    ppgtt->vm.vm_bind_mode = true;
>>
>>Won't this temporarily break execbuf2? Only in the final patch does 
>>this depend on the new flag? Perhaps the patch split could be 
>>improved, or maybe we can just keep this as false here, until the 
>>final patch? Could also maybe also keep root_obj = NULL, until the 
>>last patch also?

Yah, it was expected to be set in the final patch.
Ok, will move creating the root_obj part also to final patch.
Also, will remove vm.vm_bind_mode flag altogether. Instead the
'vm.root_obj != NULL' check will tell if VM is in vm_bind mode.

>>
>>>+
>>>      err = xa_alloc(&file_priv->vm_xa, &id, &ppgtt->vm,
>>>                 xa_limit_32b, GFP_KERNEL);
>>>      if (err)
>>>-        goto err_put;
>>>+        goto err_root_obj_put;
>>>      GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
>>>      args->vm_id = id;
>>>      return 0;
>>>+err_root_obj_put:
>>>+    if (ppgtt->vm.root_obj)
>>>+        i915_gem_object_put(ppgtt->vm.root_obj);
>>>  err_put:
>>>      i915_vm_put(&ppgtt->vm);
>>>      return err;
>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c 
>>>b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>index 5c6e396ab74d..694d4638ac8b 100644
>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>@@ -11,6 +11,7 @@
>>>  #include "pxp/intel_pxp.h"
>>>  #include "i915_drv.h"
>>>+#include "i915_gem_context.h"
>>>  #include "i915_gem_create.h"
>>>  #include "i915_trace.h"
>>>  #include "i915_user_extensions.h"
>>>@@ -251,6 +252,7 @@ struct create_ext {
>>>      unsigned int n_placements;
>>>      unsigned int placement_mask;
>>>      unsigned long flags;
>>>+    u32 vm_id;
>>>  };
>>>  static void repr_placements(char *buf, size_t size,
>>>@@ -400,9 +402,32 @@ static int ext_set_protected(struct 
>>>i915_user_extension __user *base, void *data
>>>      return 0;
>>>  }
>>>+static int ext_set_vm_private(struct i915_user_extension __user *base,
>>>+                  void *data)
>>>+{
>>>+    struct drm_i915_gem_create_ext_vm_private ext;
>>>+    struct create_ext *ext_data = data;
>>>+
>>>+    if (copy_from_user(&ext, base, sizeof(ext)))
>>>+        return -EFAULT;
>>>+
>>>+    /* Reserved fields must be 0 */
>>>+    if (ext.rsvd)
>>>+        return -EINVAL;
>>>+
>>>+    /* vm_id 0 is reserved */
>>>+    if (!ext.vm_id)
>>>+        return -ENOENT;
>>>+
>>>+    ext_data->vm_id = ext.vm_id;
>>>+
>>>+    return 0;
>>>+}
>>>+
>>>  static const i915_user_extension_fn create_extensions[] = {
>>>      [I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
>>>      [I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
>>>+    [I915_GEM_CREATE_EXT_VM_PRIVATE] = ext_set_vm_private,
>>>  };
>>>  /**
>>>@@ -418,6 +443,7 @@ i915_gem_create_ext_ioctl(struct drm_device 
>>>*dev, void *data,
>>>      struct drm_i915_private *i915 = to_i915(dev);
>>>      struct drm_i915_gem_create_ext *args = data;
>>>      struct create_ext ext_data = { .i915 = i915 };
>>>+    struct i915_address_space *vm = NULL;
>>>      struct drm_i915_gem_object *obj;
>>>      int ret;
>>>@@ -431,6 +457,12 @@ i915_gem_create_ext_ioctl(struct drm_device 
>>>*dev, void *data,
>>>      if (ret)
>>>          return ret;
>>>+    if (ext_data.vm_id) {
>>>+        vm = i915_gem_vm_lookup(file->driver_priv, ext_data.vm_id);
>>>+        if (unlikely(!vm))
>>>+            return -ENOENT;
>>>+    }
>>>+
>>>      if (!ext_data.n_placements) {
>>>          ext_data.placements[0] =
>>>              intel_memory_region_by_type(i915, INTEL_MEMORY_SYSTEM);
>>>@@ -457,8 +489,21 @@ i915_gem_create_ext_ioctl(struct drm_device 
>>>*dev, void *data,
>>>                          ext_data.placements,
>>>                          ext_data.n_placements,
>>>                          ext_data.flags);
>>>-    if (IS_ERR(obj))
>>>-        return PTR_ERR(obj);
>>>+    if (IS_ERR(obj)) {
>>>+        ret = PTR_ERR(obj);
>>>+        goto vm_put;
>>>+    }
>>>+
>>>+    if (vm) {
>>>+        obj->base.resv = vm->root_obj->base.resv;
>>>+        obj->priv_root = i915_gem_object_get(vm->root_obj);
>>>+        i915_vm_put(vm);
>>>+    }
>>>      return i915_gem_publish(obj, file, &args->size, &args->handle);
>>>+vm_put:
>>>+    if (vm)
>>>+        i915_vm_put(vm);
>>>+
>>>+    return ret;
>>>  }
>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c 
>>>b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>index f5062d0c6333..6433173c3e84 100644
>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>>>@@ -218,6 +218,12 @@ struct dma_buf *i915_gem_prime_export(struct 
>>>drm_gem_object *gem_obj, int flags)
>>>      struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
>>>      DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>>>+    if (obj->priv_root) {
>>>+        drm_dbg(obj->base.dev,
>>>+            "Exporting VM private objects is not allowed\n");
>>>+        return ERR_PTR(-EINVAL);
>>>+    }
>>>+
>>>      exp_info.ops = &i915_dmabuf_ops;
>>>      exp_info.size = gem_obj->size;
>>>      exp_info.flags = flags;
>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c 
>>>b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>>index 9fb9f6faafd8..4673e0812277 100644
>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
>>>@@ -864,6 +864,10 @@ static struct i915_vma *eb_lookup_vma(struct 
>>>i915_execbuffer *eb, u32 handle)
>>>          if (unlikely(!obj))
>>>              return ERR_PTR(-ENOENT);
>>>+        /* VM private objects are not supported here */
>>>+        if (obj->priv_root)
>>>+            return ERR_PTR(-EINVAL);
>>>+
>>>          /*
>>>           * If the user has opted-in for protected-object tracking, make
>>>           * sure the object encryption can be used.
>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c 
>>>b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>index 62495d5d0038..b799c53ac4b1 100644
>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
>>>@@ -108,6 +108,9 @@ void i915_gem_object_init(struct 
>>>drm_i915_gem_object *obj,
>>>   */
>>>  void __i915_gem_object_fini(struct drm_i915_gem_object *obj)
>>>  {
>>>+    if (obj->priv_root && !obj->ttm.created)
>>>+        i915_gem_object_put(obj->priv_root);
>>
>>Can we not ignore the ttm.created here? And then drop the 
>>object_put() below?
>

Ok, looks like __i915_gem_object_fini() is called for both
ttm and non-ttm objects.
So, will release the obj->priv_root here irrespective of
obj->ttm.created and will also move it below.

>Otherwise,
>Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>

Thanks,
Niranjana

>>
>>>+
>>>      mutex_destroy(&obj->mm.get_page.lock);
>>>      mutex_destroy(&obj->mm.get_dma_page.lock);
>>>      dma_resv_fini(&obj->base._resv);
>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h 
>>>b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>index d0d6772e6f36..b77bf0e07fe1 100644
>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
>>>@@ -242,6 +242,9 @@ struct drm_i915_gem_object {
>>>      const struct drm_i915_gem_object_ops *ops;
>>>+    /* For VM private BO, points to root_obj in VM. NULL otherwise */
>>>+    struct drm_i915_gem_object *priv_root;
>>>+
>>>      struct {
>>>          /**
>>>           * @vma.lock: protect the list/tree of vmas
>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>>>b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>index d63f30efd631..233d670a91de 100644
>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>>@@ -1200,6 +1200,9 @@ void i915_ttm_bo_destroy(struct 
>>>ttm_buffer_object *bo)
>>>      mutex_destroy(&obj->ttm.get_io_page.lock);
>>>      if (obj->ttm.created) {
>>>+        if (obj->priv_root)
>>>+            i915_gem_object_put(obj->priv_root);
>>>+
