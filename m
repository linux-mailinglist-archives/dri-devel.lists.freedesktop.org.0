Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A522767DB0B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 02:05:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1752810E143;
	Fri, 27 Jan 2023 01:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B078910E160;
 Fri, 27 Jan 2023 01:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674781535; x=1706317535;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=EvsjWv70YFOwYghx39qa4/paBo/UJlhS2WDAT7Gw+ZQ=;
 b=cD6q13GR8dTRkMRip/UZoT+KRso6KPOCP32/thGQYy0TTTj4se+sKRM6
 rlBx56bQbU+CEf3kbroXjhNE1fO1tCUFcZz0kJO0oJrZ4TdVPdkoZ1DER
 hItH/J7w+YgMt/7YB42/wXWjakZ+F4kcGqM26ZqmOvNz7rYOFXolAV5Tn
 dU9UAr8+oOUpecahlY4muqafhToOggAMryfYZOnACtNs7q2V+bK1ONiEN
 frTVmx6rtd0GRo0We0TtcUrxlPX0PXTVoaU+iTrgIUVwBBqd+Zov95KDU
 pdpZnm6o85Vh85jd/ybi6TtMF7/vTV0EI4VxJ9OWAK7DTXX1BfaUl7q4o w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="329127459"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="329127459"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 17:05:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="656437784"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="656437784"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 26 Jan 2023 17:05:34 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 17:05:34 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 17:05:34 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 17:05:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SJtLZ42RIe/+wy50/iPcwN5oz3KYYeu+N3JHg2YtwYq/k7aASbZ87i9fKbw/PRqvyGolD66XzjaK8qE6QNs/rIhUM4R2qN8K0t4eafglGFehCWosKP/LeI7oCloEMNjpRB5kp80qpw8wqULjQYI35R6Y5s8bN86byFWUGVLZIkweT3iDKsGD0CzTCUsoESzABGTS8Dopk9MsI0o6ORc3iLbBjaDXcHq5nv1JjmAGqb3A3dJF/iP8mf4bVwXKCXFv3Irjnf5cCUrNv/ZQELcLtnufKrgS9zv3MCHu6pA9TExajgfatDwfW6U6/QBoMCwTiT17dvhSeQrJdkDkuAuH4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUNpxN8n0ubw1zp+xL1roOk9l+yC+6xEemk1Y0iGcXM=;
 b=VXg4cxJ64xxEcVqPmhJFKt2WguFz+gd1YMcz06EiF5XcKSlX7RKvtKh9BBwm8LFnEnYpDacNujrtcJcvQtumiJrMs0o75duwhi7zQOHzw2CdgdC1HVItdkfzs8N4cmFcLY60ddd39Xjq5tr7Wm5zMKgHpyt9X8HsuNaa11AXq/oKMehnkNJMRujEOBssV1GGCC78I0MG9NdmsDKVLx2KCE14Cz8PNuI8t1uI8OXBtGP9MSSSk3MVHq/ZG5PM6IZR6yV3n7THopdpvxm+VU2kkDsLM0IH/CpyciLHy3Vg9VKpnV+o6GwgOHsOl/MtglgFYTm9uA1abnwLeRSnu1RPEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6507.namprd11.prod.outlook.com (2603:10b6:208:38e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 01:05:31 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.6002.033; Fri, 27 Jan 2023
 01:05:31 +0000
Date: Fri, 27 Jan 2023 01:05:13 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi interfaces
Message-ID: <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230118061256.2689-6-dakr@redhat.com>
X-ClientProxiedBy: BYAPR07CA0091.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6507:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab1f08d-1edd-4544-3559-08db00029613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6edcgxEyFrYc6FJdBE1n3iBi9y6/kIX2jhYmlnonhuuvsgRWcrgocCw06YjOnKJTG4Yl4l5lzreQ0ynidD8TSQnmu7yxTMVr2zqUn0ShyMIHofA198xvf2z/Wx5Wraj9fUam4eb2yc/O4n8ea45JD7fQpO2T9C+Ec2cndmSPwtE1091WoS8YwwWOA1R+6rt0NsEK0ICSVIh10RLS2/caV6NGnp4ubwd7SBliKMjsnn/IZzbdhHkJwouKncvFogRGY0J3laTkY0IFpBwqEuteurrEt8abgIbQObxOUdBOqKsQANRyr81vwqjT26BzUWDWy4XUL0PQ4hpNlpfpcftBbcsfzse6VUh5ZKml6vbHkxMBgUw8oUQx7x9e0etOoD/3xqtj+XqWdqthLqW3OmRCFLZQB9yYmyl1hDBhlhzWQwEkeHCgmjzwaveP4uo06T46tr47Udv3kSFNkj6rm6sEAf6g2wCaFoSagufhhJkgG948OVl8J/AfehC4XIa/ZPDBGpCgx5/UW0710SS8rxZnJ1OHzHPpYVDn6P1hOxJbBF4/1f0EWN3PkezQHAqFXhao7XlvWs0ZMtNiDvYzKgmF+1em3bkLkiCPqeIxlIF8zJqNb9VdpThGv+KCJ32m+qLAf2pue/Hmp9dTmnQZlTXFDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(136003)(376002)(396003)(346002)(366004)(451199018)(6506007)(6512007)(6666004)(83380400001)(316002)(186003)(26005)(8676002)(4326008)(478600001)(6486002)(82960400001)(66946007)(38100700002)(86362001)(66556008)(5660300002)(44832011)(7416002)(2906002)(41300700001)(6916009)(8936002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EXXlu40EPfjCjMlyYB5rvC9Qp1Av9ruXikU80si2aahUNDv/qm5pHCwP6IYE?=
 =?us-ascii?Q?lXA0Mi5cvJy9+6s1nfWreqTRWd/FRkmrQIuaveAhpAJBbMuFcCd5qwTWIZPQ?=
 =?us-ascii?Q?2+iHHwnitxMeruXK3nGU6wFLfN2+4gAtbT44StUVNzhmK0qc5WFkW8O4U46M?=
 =?us-ascii?Q?ROCxUAfgB4ykML6VtvOP6VKlrcarVxuit9DN0Pq7TWDML6YYu2mayzcZ30vf?=
 =?us-ascii?Q?UEaqatzH6F1CpLTcEg0SFoEdbv8wmP5lzUaoF8o7URqinylKKmFqTa7IZEsX?=
 =?us-ascii?Q?T/w5tFDiMIaieEq5//sAaacl2IrwLND2PjRytnV3lfZBm1/iFSwLKDNr16n0?=
 =?us-ascii?Q?Wf/FBmWqs93Ot6XOkY+i9ZoWV7VXrMlLy1aml3OUXzXFA5le08jD9xGgu4Cr?=
 =?us-ascii?Q?8NLf7ALHfgmFpMTHBEVS1RA7jCvPhXIJFg0r9mT3lHIoo5huCdh9tR2XvEUG?=
 =?us-ascii?Q?69zE0Qn0raPm7wdZZq86yCZtTl435gXyqnSZkP7OMaW7zwa8iM0Qwnn/+4lQ?=
 =?us-ascii?Q?Et6SxOmsO10BbkFCRwMvHfcz0Bu/MFcMWkZLics16Cnr770o3Hg+8Z9YiyAN?=
 =?us-ascii?Q?FX3ajVZ9snaJb5uZyOGkM50kLGc2LvAwkUDug4J/TzW6SXS/SLV08BJnVzKX?=
 =?us-ascii?Q?CLClVyv0nOMujgqx5mVQRznJ6AnkQXRfayFSs+UPUgzv0HRznctXor6rh3tb?=
 =?us-ascii?Q?L1L4qwl9RE8wk2xEdIt4kdPa+egVKcvggqckPYc62f/kp0vRTBUKLMpaVA4Z?=
 =?us-ascii?Q?tbnzx1Qw10t8Lww00pnoEWqPsJ8nus5iM/7sRfo+dCL/6ItFuIlELQfCMQye?=
 =?us-ascii?Q?cQKP9EeRTixZWCE5tQrkbWMvTArcxtdxdHGNzacjTi3BBBXBmYQrPGJpgktM?=
 =?us-ascii?Q?hfEvK0oE6Hq5/y0HeTX4mBJW0NKRuk54aU9ITafutByGg9Sn08YJWUs4oD3f?=
 =?us-ascii?Q?1ey7GwfESmfNH6KZJgH5zNlYO+SdeNpvMWV1eiPghrjQBxEilo7M3Y3NfKcp?=
 =?us-ascii?Q?F/8RKKc9jUlsKOmd9Y9H0tFFZ3p6JZJQ3yAKwNcCMA06IHYq6dS6JpvBLRUh?=
 =?us-ascii?Q?cbLySeDLGpvo29k7Vme/5BNJPDX/EJj6CoAVhBe90CjxBQUBkISyQb8g820C?=
 =?us-ascii?Q?p0vqmww8UFulVPQK/cnPGh9loo8E8S68yJ1azBwIHIilGMafoCQfTGEbvxYz?=
 =?us-ascii?Q?0JyLHBlifcouyIeG/tDNQfWVeTl3TecVhEifUzT4+l9sFB7Ukyu5zr6IGauG?=
 =?us-ascii?Q?WGUDeHsyWk7x21s3PH+uBdZmnZ4OXtwUD2uH0+23YeEtCQXbu/5RE2JNHgDP?=
 =?us-ascii?Q?9rCE9sa9bhjDUa0QpilCBGyXczDkuoyv1sIa58gvHRw1a8whq1SxKnlG2x+L?=
 =?us-ascii?Q?Yt+3sx+qwQDmZIhrT1h65yMx7yC3xnMVCqIjrMHdEU1c/1EP+pxzrYnO5kPn?=
 =?us-ascii?Q?p1VXJIHhLTm1jF02/6zuWcRYisLXmGtiPuZ6DE77BWcZ1prdb67OemsBkpfI?=
 =?us-ascii?Q?MiB5pyjJ92zLX26MlA+qxB/Bp3WyRMx/prbd6i/iPgFStFj0HFA3Kdk5UNFQ?=
 =?us-ascii?Q?90aYZYrT/XiBprgNXzvmwTuxlDcnJOqrF7CT4FSIcEIW/0Z8g7bsp2zanx47?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab1f08d-1edd-4544-3559-08db00029613
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 01:05:31.2707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VQKB1LUx8zEcqwp7eFHQlAgzdfD1gx+6Xt9SOSe3r6FOT0elJHEN3910MSqUAUEVX89uq0n8neydp7/dl9enug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6507
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
Cc: tzimmermann@suse.de, corbet@lwn.net, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bskeggs@redhat.com, jason@jlekstrand.net,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 07:12:47AM +0100, Danilo Krummrich wrote:
> This commit provides the interfaces for the new UAPI motivated by the
> Vulkan API. It allows user mode drivers (UMDs) to:
> 
> 1) Initialize a GPU virtual address (VA) space via the new
>    DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel reserved
>    VA area.
> 
> 2) Bind and unbind GPU VA space mappings via the new
>    DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
> 
> 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
> 
> Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support
> asynchronous processing with DRM syncobjs as synchronization mechanism.
> 
> The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,
> DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
> 
> Co-authored-by: Dave Airlie <airlied@redhat.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  Documentation/gpu/driver-uapi.rst |   8 ++
>  include/uapi/drm/nouveau_drm.h    | 216 ++++++++++++++++++++++++++++++
>  2 files changed, 224 insertions(+)
> 
> diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
> index 4411e6919a3d..9c7ca6e33a68 100644
> --- a/Documentation/gpu/driver-uapi.rst
> +++ b/Documentation/gpu/driver-uapi.rst
> @@ -6,3 +6,11 @@ drm/i915 uAPI
>  =============
>  
>  .. kernel-doc:: include/uapi/drm/i915_drm.h
> +
> +drm/nouveau uAPI
> +================
> +
> +VM_BIND / EXEC uAPI
> +-------------------
> +
> +.. kernel-doc:: include/uapi/drm/nouveau_drm.h
> diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> index 853a327433d3..f6e7d40201d4 100644
> --- a/include/uapi/drm/nouveau_drm.h
> +++ b/include/uapi/drm/nouveau_drm.h
> @@ -126,6 +126,216 @@ struct drm_nouveau_gem_cpu_fini {
>  	__u32 handle;
>  };
>  
> +/**
> + * struct drm_nouveau_sync - sync object
> + *
> + * This structure serves as synchronization mechanism for (potentially)
> + * asynchronous operations such as EXEC or VM_BIND.
> + */
> +struct drm_nouveau_sync {
> +	/**
> +	 * @flags: the flags for a sync object
> +	 *
> +	 * The first 8 bits are used to determine the type of the sync object.
> +	 */
> +	__u32 flags;
> +#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
> +#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
> +#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
> +	/**
> +	 * @handle: the handle of the sync object
> +	 */
> +	__u32 handle;
> +	/**
> +	 * @timeline_value:
> +	 *
> +	 * The timeline point of the sync object in case the syncobj is of
> +	 * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
> +	 */
> +	__u64 timeline_value;
> +};
> +
> +/**
> + * struct drm_nouveau_vm_init - GPU VA space init structure
> + *
> + * Used to initialize the GPU's VA space for a user client, telling the kernel
> + * which portion of the VA space is managed by the UMD and kernel respectively.
> + */
> +struct drm_nouveau_vm_init {
> +	/**
> +	 * @unmanaged_addr: start address of the kernel managed VA space region
> +	 */
> +	__u64 unmanaged_addr;
> +	/**
> +	 * @unmanaged_size: size of the kernel managed VA space region in bytes
> +	 */
> +	__u64 unmanaged_size;
> +};
> +
> +/**
> + * struct drm_nouveau_vm_bind_op - VM_BIND operation
> + *
> + * This structure represents a single VM_BIND operation. UMDs should pass
> + * an array of this structure via struct drm_nouveau_vm_bind's &op_ptr field.
> + */
> +struct drm_nouveau_vm_bind_op {
> +	/**
> +	 * @op: the operation type
> +	 */
> +	__u32 op;
> +/**
> + * @DRM_NOUVEAU_VM_BIND_OP_ALLOC:
> + *
> + * The alloc operation is used to reserve a VA space region within the GPU's VA
> + * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to
> + * instruct the kernel to create sparse mappings for the given region.
> + */
> +#define DRM_NOUVEAU_VM_BIND_OP_ALLOC 0x0

Do you really need this operation? We have no concept of this in Xe,
e.g. we can create a VM and the entire address space is managed exactly
the same.

If this can be removed then the entire concept of regions in the GPUVA
can be removed too (drop struct drm_gpuva_region). I say this because
in Xe as I'm porting over to GPUVA the first thing I'm doing after
drm_gpuva_manager_init is calling drm_gpuva_region_insert on the entire
address space. To me this seems kinda useless but maybe I'm missing why
you need this for Nouveau. 

Matt

> +/**
> + * @DRM_NOUVEAU_VM_BIND_OP_FREE: Free a reserved VA space region.
> + */
> +#define DRM_NOUVEAU_VM_BIND_OP_FREE 0x1
> +/**
> + * @DRM_NOUVEAU_VM_BIND_OP_MAP:
> + *
> + * Map a GEM object to the GPU's VA space. The mapping must be fully enclosed by
> + * a previously allocated VA space region. If the region is sparse, existing
> + * sparse mappings are overwritten.
> + */
> +#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x2
> +/**
> + * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
> + *
> + * Unmap an existing mapping in the GPU's VA space. If the region the mapping
> + * is located in is a sparse region, new sparse mappings are created where the
> + * unmapped (memory backed) mapping was mapped previously.
> + */
> +#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x3
> +	/**
> +	 * @flags: the flags for a &drm_nouveau_vm_bind_op
> +	 */
> +	__u32 flags;
> +/**
> + * @DRM_NOUVEAU_VM_BIND_SPARSE:
> + *
> + * Indicates that an allocated VA space region should be sparse.
> + */
> +#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
> +	/**
> +	 * @handle: the handle of the DRM GEM object to map
> +	 */
> +	__u32 handle;
> +	/**
> +	 * @addr:
> +	 *
> +	 * the address the VA space region or (memory backed) mapping should be mapped to
> +	 */
> +	__u64 addr;
> +	/**
> +	 * @bo_offset: the offset within the BO backing the mapping
> +	 */
> +	__u64 bo_offset;
> +	/**
> +	 * @range: the size of the requested mapping in bytes
> +	 */
> +	__u64 range;
> +};
> +
> +/**
> + * struct drm_nouveau_vm_bind - structure for DRM_IOCTL_NOUVEAU_VM_BIND
> + */
> +struct drm_nouveau_vm_bind {
> +	/**
> +	 * @op_count: the number of &drm_nouveau_vm_bind_op
> +	 */
> +	__u32 op_count;
> +	/**
> +	 * @flags: the flags for a &drm_nouveau_vm_bind ioctl
> +	 */
> +	__u32 flags;
> +/**
> + * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
> + *
> + * Indicates that the given VM_BIND operation should be executed asynchronously
> + * by the kernel.
> + *
> + * If this flag is not supplied the kernel executes the associated operations
> + * synchronously and doesn't accept any &drm_nouveau_sync objects.
> + */
> +#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
> +	/**
> +	 * @wait_count: the number of wait &drm_nouveau_syncs
> +	 */
> +	__u32 wait_count;
> +	/**
> +	 * @sig_count: the number of &drm_nouveau_syncs to signal when finished
> +	 */
> +	__u32 sig_count;
> +	/**
> +	 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
> +	 */
> +	__u64 wait_ptr;
> +	/**
> +	 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
> +	 */
> +	__u64 sig_ptr;
> +	/**
> +	 * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
> +	 */
> +	__u64 op_ptr;
> +};
> +
> +/**
> + * struct drm_nouveau_exec_push - EXEC push operation
> + *
> + * This structure represents a single EXEC push operation. UMDs should pass an
> + * array of this structure via struct drm_nouveau_exec's &push_ptr field.
> + */
> +struct drm_nouveau_exec_push {
> +	/**
> +	 * @va: the virtual address of the push buffer mapping
> +	 */
> +	__u64 va;
> +	/**
> +	 * @va_len: the length of the push buffer mapping
> +	 */
> +	__u64 va_len;
> +};
> +
> +/**
> + * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
> + */
> +struct drm_nouveau_exec {
> +	/**
> +	 * @channel: the channel to execute the push buffer in
> +	 */
> +	__u32 channel;
> +	/**
> +	 * @push_count: the number of &drm_nouveau_exec_push ops
> +	 */
> +	__u32 push_count;
> +	/**
> +	 * @wait_count: the number of wait &drm_nouveau_syncs
> +	 */
> +	__u32 wait_count;
> +	/**
> +	 * @sig_count: the number of &drm_nouveau_syncs to signal when finished
> +	 */
> +	__u32 sig_count;
> +	/**
> +	 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
> +	 */
> +	__u64 wait_ptr;
> +	/**
> +	 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
> +	 */
> +	__u64 sig_ptr;
> +	/**
> +	 * @push_ptr: pointer to &drm_nouveau_exec_push ops
> +	 */
> +	__u64 push_ptr;
> +};
> +
>  #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
>  #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
>  #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
> @@ -136,6 +346,9 @@ struct drm_nouveau_gem_cpu_fini {
>  #define DRM_NOUVEAU_NVIF               0x07
>  #define DRM_NOUVEAU_SVM_INIT           0x08
>  #define DRM_NOUVEAU_SVM_BIND           0x09
> +#define DRM_NOUVEAU_VM_INIT            0x10
> +#define DRM_NOUVEAU_VM_BIND            0x11
> +#define DRM_NOUVEAU_EXEC               0x12
>  #define DRM_NOUVEAU_GEM_NEW            0x40
>  #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
>  #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> @@ -197,6 +410,9 @@ struct drm_nouveau_svm_bind {
>  #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
>  #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
>  
> +#define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
> +#define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
> +#define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.39.0
> 
