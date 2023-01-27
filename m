Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F94F67DC98
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 04:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A305410E3E1;
	Fri, 27 Jan 2023 03:22:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EA610E3DF;
 Fri, 27 Jan 2023 03:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674789732; x=1706325732;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NcGyxwplLJSRxR41EHKKTdtrPs7uvZ2++qbvnXlDgB4=;
 b=dAT2l/wM8F72fUca8okpUI/fNks1mIvoiZI9cVay0tcc62WqYwYy49bM
 uXgChmRHejNKYL9lzW+nx5zuCzG5zQrzdI6A1RCgELe+vIMOHdGOnAG8y
 s13Cs22gvNXhPFy9tbzI4n3WqIy5S+pHhFaNhIQOwNk4PSgfcyvRpgn9Y
 RgiedBo1PZS2zeRxHaYTCH43tz979Y2/lWrhqnMhr7KE40A03vADqlaE1
 9Qk4M5LDbtPE8MrRaQDkCo745FgO3Nq3UDVIIAL98mFANehTSlATIWvcZ
 MWL3ZgmybdHjaOlLLmJe3TuVdL6+SmaIotMwhEpiPO6FoNQxs/LWFUDtB Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="413236159"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="413236159"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 19:22:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="751853458"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="751853458"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by FMSMGA003.fm.intel.com with ESMTP; 26 Jan 2023 19:22:11 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 19:22:11 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 26 Jan 2023 19:22:10 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 26 Jan 2023 19:22:10 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 26 Jan 2023 19:22:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebwPYhxULFdKAvsvK4c90k2hGogOCNYC81JRTSNq95uCNzvE7H/RQfXi4wNQDf/yNdUhMgLMwvjRFAqqe1MYuMPMw5wWKPhpWiOQ+GMZOYtpAkmPvmXzRFnm99Fhww+yzuJSI4tFx2fdc5d2ehkytYJa+d8IPbIytKhiuBUMWU061K7vpRztczBp5N6TtvVt+O8G7kWLA3zFdDW8sFauQR//NqFDt5JuE3UunGhqjsannQ9VttQtUe8PS4gPDPH1/zmCIMj/UwWhybezH6gpHbdAObnqwzzEEHopL7QDTWOV25fvcRf4Ge9Sd935OvQ2N+o5+qFd+n+qZrbS5/y0Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hpAQhnkVVXlO5BglLLEWCmcw/e/nxEa3fbq832Fz/M4=;
 b=WPj9Cf3wXXGw7x0U2bvJiY3Mu8FOzie15U/oUQusa9bR/uvKKGDOqKSok/hvt1Brz5eKJkOg40ENn4+cJmm7F601J9wBB2qRfeCMsr0uC5Cx5bI1kpja+7qVjEJD/crgaaD+oapgj2wjpt3GFlECygDcFe8tQ+SV2ykEQpNuFciQgmnPIGkMZ0kRoHSRlwDQPcNXLjO8QUGMQwPsVgTsIFrWzCdy9v6Ud3ITlv8xjYw7laDMXpZlfJd8c3M1WyO1+/u5SM9pwD/7CSBXD9N/XoxloVGlW96kDAy89GKkN4CjPhvOtu6JmtyVMmtkCsjl2A9BLX8E1As9dpuzM1SABg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL3PR11MB6483.namprd11.prod.outlook.com (2603:10b6:208:3be::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Fri, 27 Jan
 2023 03:22:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::2ceb:afd:8ee7:4cc%6]) with mapi id 15.20.6002.033; Fri, 27 Jan 2023
 03:22:07 +0000
Date: Fri, 27 Jan 2023 03:21:50 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi interfaces
Message-ID: <Y9NDTrGhSXomICEE@DUT025-TGLU.fm.intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-6-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <0bf3fec7-5aac-d3cb-8953-a332f84bdf8a@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0bf3fec7-5aac-d3cb-8953-a332f84bdf8a@redhat.com>
X-ClientProxiedBy: BYAPR11CA0106.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL3PR11MB6483:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a264c72-6893-4546-40a5-08db0015ab74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cHFz2viMndLgIE+Zsf0gqZjG5Wp8ALpBq1M6vu/ssyTtMKZAfHWTWpU/hp1vp9tTXUwqEhv0oXgIIW9dw25zQGNSBaomoijKT/v9RMnsGUVs6aJe/wbGlkXqupzQec4Cmf4so9xXLMUHC2puKKoWBfN88wfWp8Lpl+Qn1O+tyLBYdVDAGBH74IFX8LFLC7PocP87GTQqmgpkz04CV88gvfXydGcBGiJJvzOjwyM2pirebcutrW53FzDSciP34OsTIEzIfbQPqXGmYwMZsuxBoYS03dtEcdjATy/Z9nQJ5CbyOCtnVJmYtkrl8zWpUjemzA3qtbxSvsIuCb2Mif6nq1QFxjfzhuSxFbWr9SIZ1BjurdZFsV+vZt4gR1Ki4M6AV7rWR5tFic8m+AGWC5Hz5DrdFrT/OIfDMbcVHNc/MefnQgfQm/eVHf5d9U3EdP1DIzL86WBAf8fzvWEQ0s2UhSgc7eq0NYL5zlidmENhkndsOiigmvtUnG9/fMJ50Kjr5pYDqxy5j0NmBYnao4D5CWYh4M2GcowZ7ecD3p0rgb779jz3W/dRiXSDbx9dbw0ABanQglGWUSwumzbr04WAJFymSGPubb7qySXQgPKQTlY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199018)(6486002)(186003)(26005)(6512007)(478600001)(966005)(83380400001)(6666004)(316002)(41300700001)(8676002)(38100700002)(53546011)(82960400001)(6506007)(8936002)(7416002)(30864003)(44832011)(86362001)(4326008)(66556008)(5660300002)(66946007)(66476007)(6916009)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L9YFl4SiQFXQmVT1LXAwF3cX8tERunUkv9y4djRQ6O55sTRMrqncK24ZHkXY?=
 =?us-ascii?Q?n9kKIDEWR6ypOa1JglC2V6m3llo7hh2HLFYY7GCfGpagITihDrY4KVf2D6CC?=
 =?us-ascii?Q?28LbnRP/bNLmLXH4JLR33fnZ9y+fahbMIVDeF8iQM9vQSTR8N6lLMNIftX7R?=
 =?us-ascii?Q?lD+K5vYsUsvPsP9C1eOZMa2wSWvlqcPWz6181BPwsYPTobFyG6UL+jXVW9WU?=
 =?us-ascii?Q?lpvuut82Ao/vm3DhTAY4D+ClNJU1wrJUFXvDmTQ2VzN5C9W3iHdkshooEd7G?=
 =?us-ascii?Q?nfdrlETtbb2/ttjQs+Myy2Liq6cmvVqiqYE5Kc+t65X5p0P/pUyc60dImQqP?=
 =?us-ascii?Q?lv+Bru37yctrmBiScc8M5icR1/Esc3qCmV2szmIJR+z9vil3APnfz5uwXSmk?=
 =?us-ascii?Q?xXGmtzub5rl5461M4JFy4g/8ITIJsSMFoza/3OehWErwYfh953hAysav4Tba?=
 =?us-ascii?Q?3zs1kClCWspHwHVHlcHxbYgPqNrAKna5FCsOUW4EnqRZYKrwTuHNfroNUO43?=
 =?us-ascii?Q?kDThI/Pnk2HTB/6Nc2qR2GgrFEyAMnNTsM00bBv+iYv2caN03uwxDz/uLX5j?=
 =?us-ascii?Q?wtcI7q8anRIu7O8OADaNNwhR2p3xi32CYMGamZKsYDCMRENmrCbNBV391w7l?=
 =?us-ascii?Q?GUPThh6uOARwBAP0klSWq3VVHm7ZB8evhzK4lHjVM0c62my7jlDTB39DNpWf?=
 =?us-ascii?Q?1hjSSxoNJ+ukYp8MlK3BtV3hFS+N6xc1Pw1sy1rONn7DvlOUSdiAky0oaaXu?=
 =?us-ascii?Q?vxVypj09WY+xfq+oXTGHVoNrKckXEJwz3177BOfCV/MvZMRDk6sAYftpR7oB?=
 =?us-ascii?Q?1lMkBWXIRQY91iIkn/vN2jXJYrhJrU9k+thFOG8iIULJrg/nh7BXeU/dLPWv?=
 =?us-ascii?Q?j8ZG1p6RF10ULalUrIhNclDDhBOy/wBolEr324UU+1wx51kdxQ+f03ztf4Ah?=
 =?us-ascii?Q?x/E85uI8iPJcEQgU3s6xiHU1lzwclzXjLHk8OZmP5y4mrcRUY7xs8fU8WBHj?=
 =?us-ascii?Q?zcBhrG71UKcNGcFSzVQdsZZC1CPy19I6cRFfP3Lb56b9M736xcRHSrBw/k+f?=
 =?us-ascii?Q?QPFa2RmhSaLxoj8BMzPEVDa0AnV9Hj3MqWfO4l0rph0ysPJUrFBMe1gwPzLp?=
 =?us-ascii?Q?JdyVs5zwDM7Cl5T6XBltRplRsXkVX3EJxp4eH0h+mBCsMVldGdRC2TTf0XHv?=
 =?us-ascii?Q?Fyf+OnSa82NqZOsPSXch3Nou3eEsHtRJP8pdFDu9ia9jeO0V6nmxqS8xtLpu?=
 =?us-ascii?Q?PgiBZPY0ls+NxE29hVdDTAlnjBp+04W/KLQrdPFGCBvUGTok5LQ6XuAlYoGS?=
 =?us-ascii?Q?REDKZ72tJhRcSIu4Pt82N0lg1XpPZWGkNPkMapngYFquqB1izLhotUzKbbF5?=
 =?us-ascii?Q?xYtE9gBAa28sTlLxxZ5XSbzISbUyvqsAgcK44xwqVi2rFq3i//XvUlHMUZDq?=
 =?us-ascii?Q?GaDiSNPpqU+oBy9ktcUu0//LCimljgz/dvUnAJ/jKydUCi/lVNm6bxhZAnBQ?=
 =?us-ascii?Q?1i6222/t7Ral9/CEX0Ppm4XEjrCJ65LLPi24uFX0MU/5Fjs4rQ7bpEIj3N9n?=
 =?us-ascii?Q?csM3vV/WKPhXUO0FZ31lsccYWAkEOLCu+QaBu9leMY6xFtBe6J8lgucSi6MH?=
 =?us-ascii?Q?Aw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a264c72-6893-4546-40a5-08db0015ab74
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 03:22:07.5611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t/bKgOG4SP54W80S+XH1VZQDCv/L5/Rf0igNEI9GWbCFQlkrak9pwdFz7jJ+1XTYz6arlbg1axu+yB9DgpHW2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6483
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

On Fri, Jan 27, 2023 at 02:43:30AM +0100, Danilo Krummrich wrote:
> 
> 
> On 1/27/23 02:05, Matthew Brost wrote:
> > On Wed, Jan 18, 2023 at 07:12:47AM +0100, Danilo Krummrich wrote:
> > > This commit provides the interfaces for the new UAPI motivated by the
> > > Vulkan API. It allows user mode drivers (UMDs) to:
> > > 
> > > 1) Initialize a GPU virtual address (VA) space via the new
> > >     DRM_IOCTL_NOUVEAU_VM_INIT ioctl. UMDs can provide a kernel reserved
> > >     VA area.
> > > 
> > > 2) Bind and unbind GPU VA space mappings via the new
> > >     DRM_IOCTL_NOUVEAU_VM_BIND ioctl.
> > > 
> > > 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.
> > > 
> > > Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC support
> > > asynchronous processing with DRM syncobjs as synchronization mechanism.
> > > 
> > > The default DRM_IOCTL_NOUVEAU_VM_BIND is synchronous processing,
> > > DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.
> > > 
> > > Co-authored-by: Dave Airlie <airlied@redhat.com>
> > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > ---
> > >   Documentation/gpu/driver-uapi.rst |   8 ++
> > >   include/uapi/drm/nouveau_drm.h    | 216 ++++++++++++++++++++++++++++++
> > >   2 files changed, 224 insertions(+)
> > > 
> > > diff --git a/Documentation/gpu/driver-uapi.rst b/Documentation/gpu/driver-uapi.rst
> > > index 4411e6919a3d..9c7ca6e33a68 100644
> > > --- a/Documentation/gpu/driver-uapi.rst
> > > +++ b/Documentation/gpu/driver-uapi.rst
> > > @@ -6,3 +6,11 @@ drm/i915 uAPI
> > >   =============
> > >   .. kernel-doc:: include/uapi/drm/i915_drm.h
> > > +
> > > +drm/nouveau uAPI
> > > +================
> > > +
> > > +VM_BIND / EXEC uAPI
> > > +-------------------
> > > +
> > > +.. kernel-doc:: include/uapi/drm/nouveau_drm.h
> > > diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
> > > index 853a327433d3..f6e7d40201d4 100644
> > > --- a/include/uapi/drm/nouveau_drm.h
> > > +++ b/include/uapi/drm/nouveau_drm.h
> > > @@ -126,6 +126,216 @@ struct drm_nouveau_gem_cpu_fini {
> > >   	__u32 handle;
> > >   };
> > > +/**
> > > + * struct drm_nouveau_sync - sync object
> > > + *
> > > + * This structure serves as synchronization mechanism for (potentially)
> > > + * asynchronous operations such as EXEC or VM_BIND.
> > > + */
> > > +struct drm_nouveau_sync {
> > > +	/**
> > > +	 * @flags: the flags for a sync object
> > > +	 *
> > > +	 * The first 8 bits are used to determine the type of the sync object.
> > > +	 */
> > > +	__u32 flags;
> > > +#define DRM_NOUVEAU_SYNC_SYNCOBJ 0x0
> > > +#define DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ 0x1
> > > +#define DRM_NOUVEAU_SYNC_TYPE_MASK 0xf
> > > +	/**
> > > +	 * @handle: the handle of the sync object
> > > +	 */
> > > +	__u32 handle;
> > > +	/**
> > > +	 * @timeline_value:
> > > +	 *
> > > +	 * The timeline point of the sync object in case the syncobj is of
> > > +	 * type DRM_NOUVEAU_SYNC_TIMELINE_SYNCOBJ.
> > > +	 */
> > > +	__u64 timeline_value;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_nouveau_vm_init - GPU VA space init structure
> > > + *
> > > + * Used to initialize the GPU's VA space for a user client, telling the kernel
> > > + * which portion of the VA space is managed by the UMD and kernel respectively.
> > > + */
> > > +struct drm_nouveau_vm_init {
> > > +	/**
> > > +	 * @unmanaged_addr: start address of the kernel managed VA space region
> > > +	 */
> > > +	__u64 unmanaged_addr;
> > > +	/**
> > > +	 * @unmanaged_size: size of the kernel managed VA space region in bytes
> > > +	 */
> > > +	__u64 unmanaged_size;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_nouveau_vm_bind_op - VM_BIND operation
> > > + *
> > > + * This structure represents a single VM_BIND operation. UMDs should pass
> > > + * an array of this structure via struct drm_nouveau_vm_bind's &op_ptr field.
> > > + */
> > > +struct drm_nouveau_vm_bind_op {
> > > +	/**
> > > +	 * @op: the operation type
> > > +	 */
> > > +	__u32 op;
> > > +/**
> > > + * @DRM_NOUVEAU_VM_BIND_OP_ALLOC:
> > > + *
> > > + * The alloc operation is used to reserve a VA space region within the GPU's VA
> > > + * space. Optionally, the &DRM_NOUVEAU_VM_BIND_SPARSE flag can be passed to
> > > + * instruct the kernel to create sparse mappings for the given region.
> > > + */
> > > +#define DRM_NOUVEAU_VM_BIND_OP_ALLOC 0x0
> > 
> > Do you really need this operation? We have no concept of this in Xe,
> > e.g. we can create a VM and the entire address space is managed exactly
> > the same.
> > 
> > If this can be removed then the entire concept of regions in the GPUVA
> > can be removed too (drop struct drm_gpuva_region). I say this because
> > in Xe as I'm porting over to GPUVA the first thing I'm doing after
> > drm_gpuva_manager_init is calling drm_gpuva_region_insert on the entire
> > address space.
> 
> Also, since you've been starting to use the code, this [1] is the branch I'm
> pushing my fixes for a v2 to. It already contains the changes for the GPUVA
> manager except for switching away from drm_mm.
> 
> [1] https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next-fixes
> 

I will take a look at this branch. I believe you are on our Xe gitlab
project (working on getting this public) so you can comment on any MR I
post there, I expect to have something posted early next week to port Xe
to the gpuva.

Also I assume you are dri-devel IRC, what is your handle? Mine is
mbrost. It might be useful to chat in real time.

Matt

> > To me this seems kinda useless but maybe I'm missing why
> > you need this for Nouveau.
> > 
> > Matt
> > 
> > > +/**
> > > + * @DRM_NOUVEAU_VM_BIND_OP_FREE: Free a reserved VA space region.
> > > + */
> > > +#define DRM_NOUVEAU_VM_BIND_OP_FREE 0x1
> > > +/**
> > > + * @DRM_NOUVEAU_VM_BIND_OP_MAP:
> > > + *
> > > + * Map a GEM object to the GPU's VA space. The mapping must be fully enclosed by
> > > + * a previously allocated VA space region. If the region is sparse, existing
> > > + * sparse mappings are overwritten.
> > > + */
> > > +#define DRM_NOUVEAU_VM_BIND_OP_MAP 0x2
> > > +/**
> > > + * @DRM_NOUVEAU_VM_BIND_OP_UNMAP:
> > > + *
> > > + * Unmap an existing mapping in the GPU's VA space. If the region the mapping
> > > + * is located in is a sparse region, new sparse mappings are created where the
> > > + * unmapped (memory backed) mapping was mapped previously.
> > > + */
> > > +#define DRM_NOUVEAU_VM_BIND_OP_UNMAP 0x3
> > > +	/**
> > > +	 * @flags: the flags for a &drm_nouveau_vm_bind_op
> > > +	 */
> > > +	__u32 flags;
> > > +/**
> > > + * @DRM_NOUVEAU_VM_BIND_SPARSE:
> > > + *
> > > + * Indicates that an allocated VA space region should be sparse.
> > > + */
> > > +#define DRM_NOUVEAU_VM_BIND_SPARSE (1 << 8)
> > > +	/**
> > > +	 * @handle: the handle of the DRM GEM object to map
> > > +	 */
> > > +	__u32 handle;
> > > +	/**
> > > +	 * @addr:
> > > +	 *
> > > +	 * the address the VA space region or (memory backed) mapping should be mapped to
> > > +	 */
> > > +	__u64 addr;
> > > +	/**
> > > +	 * @bo_offset: the offset within the BO backing the mapping
> > > +	 */
> > > +	__u64 bo_offset;
> > > +	/**
> > > +	 * @range: the size of the requested mapping in bytes
> > > +	 */
> > > +	__u64 range;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_nouveau_vm_bind - structure for DRM_IOCTL_NOUVEAU_VM_BIND
> > > + */
> > > +struct drm_nouveau_vm_bind {
> > > +	/**
> > > +	 * @op_count: the number of &drm_nouveau_vm_bind_op
> > > +	 */
> > > +	__u32 op_count;
> > > +	/**
> > > +	 * @flags: the flags for a &drm_nouveau_vm_bind ioctl
> > > +	 */
> > > +	__u32 flags;
> > > +/**
> > > + * @DRM_NOUVEAU_VM_BIND_RUN_ASYNC:
> > > + *
> > > + * Indicates that the given VM_BIND operation should be executed asynchronously
> > > + * by the kernel.
> > > + *
> > > + * If this flag is not supplied the kernel executes the associated operations
> > > + * synchronously and doesn't accept any &drm_nouveau_sync objects.
> > > + */
> > > +#define DRM_NOUVEAU_VM_BIND_RUN_ASYNC 0x1
> > > +	/**
> > > +	 * @wait_count: the number of wait &drm_nouveau_syncs
> > > +	 */
> > > +	__u32 wait_count;
> > > +	/**
> > > +	 * @sig_count: the number of &drm_nouveau_syncs to signal when finished
> > > +	 */
> > > +	__u32 sig_count;
> > > +	/**
> > > +	 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
> > > +	 */
> > > +	__u64 wait_ptr;
> > > +	/**
> > > +	 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
> > > +	 */
> > > +	__u64 sig_ptr;
> > > +	/**
> > > +	 * @op_ptr: pointer to the &drm_nouveau_vm_bind_ops to execute
> > > +	 */
> > > +	__u64 op_ptr;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_nouveau_exec_push - EXEC push operation
> > > + *
> > > + * This structure represents a single EXEC push operation. UMDs should pass an
> > > + * array of this structure via struct drm_nouveau_exec's &push_ptr field.
> > > + */
> > > +struct drm_nouveau_exec_push {
> > > +	/**
> > > +	 * @va: the virtual address of the push buffer mapping
> > > +	 */
> > > +	__u64 va;
> > > +	/**
> > > +	 * @va_len: the length of the push buffer mapping
> > > +	 */
> > > +	__u64 va_len;
> > > +};
> > > +
> > > +/**
> > > + * struct drm_nouveau_exec - structure for DRM_IOCTL_NOUVEAU_EXEC
> > > + */
> > > +struct drm_nouveau_exec {
> > > +	/**
> > > +	 * @channel: the channel to execute the push buffer in
> > > +	 */
> > > +	__u32 channel;
> > > +	/**
> > > +	 * @push_count: the number of &drm_nouveau_exec_push ops
> > > +	 */
> > > +	__u32 push_count;
> > > +	/**
> > > +	 * @wait_count: the number of wait &drm_nouveau_syncs
> > > +	 */
> > > +	__u32 wait_count;
> > > +	/**
> > > +	 * @sig_count: the number of &drm_nouveau_syncs to signal when finished
> > > +	 */
> > > +	__u32 sig_count;
> > > +	/**
> > > +	 * @wait_ptr: pointer to &drm_nouveau_syncs to wait for
> > > +	 */
> > > +	__u64 wait_ptr;
> > > +	/**
> > > +	 * @sig_ptr: pointer to &drm_nouveau_syncs to signal when finished
> > > +	 */
> > > +	__u64 sig_ptr;
> > > +	/**
> > > +	 * @push_ptr: pointer to &drm_nouveau_exec_push ops
> > > +	 */
> > > +	__u64 push_ptr;
> > > +};
> > > +
> > >   #define DRM_NOUVEAU_GETPARAM           0x00 /* deprecated */
> > >   #define DRM_NOUVEAU_SETPARAM           0x01 /* deprecated */
> > >   #define DRM_NOUVEAU_CHANNEL_ALLOC      0x02 /* deprecated */
> > > @@ -136,6 +346,9 @@ struct drm_nouveau_gem_cpu_fini {
> > >   #define DRM_NOUVEAU_NVIF               0x07
> > >   #define DRM_NOUVEAU_SVM_INIT           0x08
> > >   #define DRM_NOUVEAU_SVM_BIND           0x09
> > > +#define DRM_NOUVEAU_VM_INIT            0x10
> > > +#define DRM_NOUVEAU_VM_BIND            0x11
> > > +#define DRM_NOUVEAU_EXEC               0x12
> > >   #define DRM_NOUVEAU_GEM_NEW            0x40
> > >   #define DRM_NOUVEAU_GEM_PUSHBUF        0x41
> > >   #define DRM_NOUVEAU_GEM_CPU_PREP       0x42
> > > @@ -197,6 +410,9 @@ struct drm_nouveau_svm_bind {
> > >   #define DRM_IOCTL_NOUVEAU_GEM_CPU_FINI       DRM_IOW (DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_CPU_FINI, struct drm_nouveau_gem_cpu_fini)
> > >   #define DRM_IOCTL_NOUVEAU_GEM_INFO           DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_GEM_INFO, struct drm_nouveau_gem_info)
> > > +#define DRM_IOCTL_NOUVEAU_VM_INIT            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_INIT, struct drm_nouveau_vm_init)
> > > +#define DRM_IOCTL_NOUVEAU_VM_BIND            DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_VM_BIND, struct drm_nouveau_vm_bind)
> > > +#define DRM_IOCTL_NOUVEAU_EXEC               DRM_IOWR(DRM_COMMAND_BASE + DRM_NOUVEAU_EXEC, struct drm_nouveau_exec)
> > >   #if defined(__cplusplus)
> > >   }
> > >   #endif
> > > -- 
> > > 2.39.0
> > > 
> > 
> 
