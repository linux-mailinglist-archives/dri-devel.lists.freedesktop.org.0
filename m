Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B37256723E5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D876B10E7AB;
	Wed, 18 Jan 2023 16:45:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC0110E79F;
 Wed, 18 Jan 2023 16:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674060304; x=1705596304;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=TSAXrMq+LyoMOLWK9iDIk7VjWgggumRchf2pT1mlzN8=;
 b=F3re7Ql1fOTmRx0NiWsw8bAm8aIlMqHnfLFSZRAwX4GCI6xpww+hJ82P
 AWbtq+F1oKZBoEtl9hxtCd90fPP4K127nOcndcgi3IbCtwhjcfHsB44cj
 dMo0XYLKp1h4pUWse/o9lnztADCsWfWrvFqJoI5tmupyc8khEMoQX/EIx
 drDJQs72DU21NuwymqbLCfXN4BPo8WjqNKAhVzcxUJZWju0pD9/QN7UeN
 1liWdvmyZ/kQt/VQbjZh2TnJkYLeKH2/U8JoRATvduMagwEvDb7ZrS7Yn
 L2IGzoiXkIBEMaTFLlSs50EfcOg74Ye6JybaHT5MHeUGnMckhHZOSdNnX Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322722205"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="322722205"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:45:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609714578"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="609714578"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 08:45:03 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 08:45:02 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 08:45:02 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 08:45:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lqKl89UtsHdVn02O1ENvH/fDXtfkUSEixpYsX7IVW51WFRV36hmEEczgb1xRHcGRxndk63Vv4Hx+blQTqR94yLfa0f3NuTS0F8ZFxhM4tMO/nGt/hV7n+b7zy6hkQtr0wCaz4cr45FknUos2ktzN/kjAsK7oZ+nVe+Q/AaxZFLRE9tk/dOQFFAGA4o0FznZBhxdmBKELhW28xYDzgj2qbFJfeHBWMwKYQ9dnD85y5nyb3cyvXLsyFDzbLCh2N9rwWm+a8dtHpV9s8uCB51nM3SXrGlWR1jXxYSaKEVr67sK4ZVBw7Q3xYZdfHroN8+9jwrDuzW6s74YtMu6H/Cew2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ItOJlyoyRzS1kmokJwRvFHl4Kry7KynGNXMbB02tybA=;
 b=a+B74ywaTwklj6qiL80nWbJ7YHNtvoi4BYzdrXjopAjTk8gjwUbmMZARiGRQ+SSg+biDEtxa/05WKJdi0Ksq8LCzk46hH98fodBMlucY1fIXhrKHyUnTxkpW5RK8SHaP+pjnT90h+6FZRsIR+/o7ueamhLBx2UnafVkEPQYEHpeXb0dg2gGdo1kRB+WBSbkgrSmE/pl7HqZ114jDYnfC0WAzOSvzuzc5j7UvnIQK/GnFQ7RAgEASqtr60Yi5doQ9VEoskZ3a/nrAZrXO0ngB50JvNaKg8qgyaOZCi+uvZ3LWQnTYziQbeloL9rd0StGtaMjz4YNabE4OlmQ0npHM9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6943.namprd11.prod.outlook.com (2603:10b6:806:2bc::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Wed, 18 Jan
 2023 16:45:00 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::1818:e39d:454d:a930%4]) with mapi id 15.20.5986.018; Wed, 18 Jan 2023
 16:45:00 +0000
Date: Wed, 18 Jan 2023 11:44:55 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/i915/gvt: Avoid full proxy f_ops for
 vgpu_status debug attributes
Message-ID: <Y8giB988U5cqsGdd@intel.com>
References: <cover.1673375066.git.drv@mailo.com>
 <188df08e0feba0cda2c92145f513dd4e57c6e6cf.1673375066.git.drv@mailo.com>
 <Y72zVXYLVHXuyK05@intel.com>
 <Y8TkTi+/GQwhiMvO@zhen-hp.sh.intel.com>
 <Y8b3IRhx976Ke99X@intel.com>
 <Y8d6CwD3dHLKOUZ5@ubun2204.myguest.virtualbox.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <Y8d6CwD3dHLKOUZ5@ubun2204.myguest.virtualbox.org>
X-ClientProxiedBy: SJ0PR13CA0092.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::7) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6943:EE_
X-MS-Office365-Filtering-Correlation-Id: 883d4d52-ac37-4007-8ced-08daf97356e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O3hArw0HyEP0EmJIufwueFbyFhKzEmRPGhopmZFQgUlb0b7M5YqiBuKOFPE68y8IjAwPrf3J4fODW+HyBgBhImHrCfKBCMQlMLf0wU0BOUHzLZMjF91DIXXX6ZznUL+Ex/vQcykMEj0zVo4MHnp6MARY6RyDLNUHy5vNM8p2aHQ5Jokjc5fHlX/c9J3+PQzbSAFAMKTLZF+e1QQDqL1YiAqWmAXozke4s3/F+ondvu/s39f1QktZAHwhD52i6KfEp7VrQaYyBrb3IF5Z+qI824OwimreGU749pMYabgpnVnQ1S81lJZdQ+k1a5f2vDJvAH5suv7ooR0QrI4MNPObx8xUuClTbxh7hbvgnaxxDzw9rHZTChtW6votPIdVzB3mufukBCcdsISjNCuTf9mlPuJyXF/vqMPUw527uN0YGID/wGm7XcB9X+x9Z+bd4aIFBLs8H0PFanw44uprd89DPavHP3F/ephMWQhYUpetUYOr+J6sk6/XUVQ5Y01pUq9vE4OyloVD1vV749/xNxwa6YPVIpNDsKzzAh/GP+QsMrrBzuq7KiLNamaUQVMforOeNLD/leFUNM9ezK4aZuajiFDnu+xmgtfWeGGZ6jW+FIRbC8H7OIVH9ipgJMocjyiSCrtD9s6mi66ohkNsjD+kodO3SzoZ/CgAwSPL4elEbxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(39860400002)(346002)(136003)(376002)(366004)(451199015)(2616005)(6506007)(6666004)(38100700002)(6486002)(966005)(54906003)(186003)(26005)(6512007)(478600001)(53546011)(316002)(66476007)(8936002)(5660300002)(83380400001)(7416002)(4326008)(8676002)(6916009)(44832011)(41300700001)(66946007)(2906002)(82960400001)(66556008)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xYdxfYNlmAI0tWXP/TIIxSGrcVBcDVkyRWba9SF38fixOVWBdRQ+qmoal2sY?=
 =?us-ascii?Q?76XAJKESbqr7wDRiMzs/YufEtpdX1Ne83AQM1cjSIMsDFeYCFH3doYYWo1iL?=
 =?us-ascii?Q?nVGbTiDvv42wEEThTu/i6bE8XOcwEfISrqqlaOjfnQyOyjRx30Mr1txXpdos?=
 =?us-ascii?Q?fzukIVNygT7RTwnbc8Pv3F0/Xz7+Fbjp7M7leGX/FREPNjoYe4aPR4IwwQsc?=
 =?us-ascii?Q?JsNxn7gGLyARjGN5WLLzxQsqQHtZN3WnOKLB6DT5jRWEoyTNdsSVkOLOtWal?=
 =?us-ascii?Q?oDVqR78jGpHvTdvL8r4YTRfeJm4qzHO98RjkEE8y5CA0j8ylFqFj8ekEoVNT?=
 =?us-ascii?Q?/kW+Dgqi811PetWNY0I7ReVxU2c8rLwT0kRJI5yT4RaeS6yQiygbUff78BUS?=
 =?us-ascii?Q?sOQedMSTZJTnTVT+9TP9fzyofGvmNjQFbtTDmViCxdA31oINOI57fC+VC43T?=
 =?us-ascii?Q?IqgPKTk3JwmVibAVV0opbecMGtwwI5p6SP+JdBiojGEY22p+i+OndaWQUxFZ?=
 =?us-ascii?Q?JGXPvorLSiaiMJP3luSfS7unBilXJo/B0DducvEJiwqLo18hLPc1VY/HxqEu?=
 =?us-ascii?Q?MNWzHYe8+WZOGmvdeTt0IuwQD4U1/ToaiXHW/473M3lEjOrIfUm3ivgrP/SX?=
 =?us-ascii?Q?unlVaRPapTQBBui4kBTFhjIpDedGcS0P9ugKdd2U46GY26Qv24AKg+kvscoS?=
 =?us-ascii?Q?EYN2hDZygmUiYshEkVhMN6xCwmdb7Jq7d8QioBc2soampVh7Q1TDLnQVaQCL?=
 =?us-ascii?Q?Ktwsa45fUh0xPrqVKBoesx8HX+w6tVxXYNIMnWjiLCrtzbVwavEHzuU2QqEe?=
 =?us-ascii?Q?60vx6IY8LxZ1KbdDd26xClJYexziK1cWlRqJJzkAiDgRkqL3LJP4ZbuhN8B2?=
 =?us-ascii?Q?P5uFYT7g5b2HazoZh/day6bPmm5LXyBHpwg3vxPcVisq83Vh97fhN/AsyDrN?=
 =?us-ascii?Q?gNIYhTt6D7GOomJGT7QhZRd4yoR0wucY06TPK2B5hNOSLIOa9mzf71MP6+Fs?=
 =?us-ascii?Q?lgNg1LiH/FvqEkDTAjRH+EH6cbWJjgLCpDL7NBJ9CedJlWvjL7m0WlzFx3kv?=
 =?us-ascii?Q?rcm7PPMtlSepZsl1YHbg8DgmKD2bChCQUi4+pH3PKfbgKYNIRm9EEvrE4qXE?=
 =?us-ascii?Q?G0Zjh9Di1DDeIQxkgXU5A+wqn7QqhrcwT+j66MRQwt+osP/Z3fsDA0gTI9Mp?=
 =?us-ascii?Q?yAE1HFcPkl2ByVRJ0LydYqJIo49qtJEVqGNgYhPRL0XfxYZj48cc29VRwDGD?=
 =?us-ascii?Q?v1DTVhTJLQCPY7yc9067TSsiy5GcEDiETUD6LLSe66L3JHpMA1/kaMQDDHUj?=
 =?us-ascii?Q?/Ci4dwVOHifbwGUdAmdSNhWjByRU+IM4O3aJpKNbVgEyxRb85efzWt87n3ZV?=
 =?us-ascii?Q?djG69Sqk51VH9l3I3c2S5DfXkFIMXNqXeA3u7r7KbSB89tYeyRjQSuaNzTcK?=
 =?us-ascii?Q?NRvNt4iSQy8lfYNtx2xXrIQ0va4aCdIFwdgj5cDQ8zbJ4I9nMl5cDUIJui9G?=
 =?us-ascii?Q?u+APiWbc29t1atEK5ONIgbe2+O1wmk7mzNqnBiQsO/JGXnkBwtYuqTVpS89c?=
 =?us-ascii?Q?Al1nr3FUNoL+6h1j4H+N11sHhwJsRjYOuP6NgYQ+GGBqjpL/yckQ6ypZje/1?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 883d4d52-ac37-4007-8ced-08daf97356e0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2023 16:45:00.5457 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3H0ZvmTws/0m6mg30pfdwDGoy9M/PVh6jyh6YJeaIbRpZUGUWeHz119yIOq9daOUj4uLeOzq1xEpJj/V8xPJHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6943
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gfx@lists.freedesktop.org, Saurabh Singh Sengar <ssengar@microsoft.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 18, 2023 at 10:18:11AM +0530, Deepak R Varma wrote:
> On Tue, Jan 17, 2023 at 02:29:37PM -0500, Rodrigo Vivi wrote:
> > On Mon, Jan 16, 2023 at 01:44:46PM +0800, Zhenyu Wang wrote:
> > > On 2023.01.10 13:49:57 -0500, Rodrigo Vivi wrote:
> > > > On Wed, Jan 11, 2023 at 12:00:12AM +0530, Deepak R Varma wrote:
> > > > > Using DEFINE_SIMPLE_ATTRIBUTE macro with the debugfs_create_file()
> > > > > function adds the overhead of introducing a proxy file operation
> > > > > functions to wrap the original read/write inside file removal protection
> > > > > functions. This adds significant overhead in terms of introducing and
> > > > > managing the proxy factory file operations structure and function
> > > > > wrapping at runtime.
> > > > > As a replacement, a combination of DEFINE_DEBUGFS_ATTRIBUTE macro paired
> > > > > with debugfs_create_file_unsafe() is suggested to be used instead.  The
> > > > > DEFINE_DEBUGFS_ATTRIBUTE utilises debugfs_file_get() and
> > > > > debugfs_file_put() wrappers to protect the original read and write
> > > > > function calls for the debug attributes. There is no need for any
> > > > > runtime proxy file operations to be managed by the debugfs core.
> > > > > Following coccicheck make command helped identify this change:
> > > > > 
> > > > > make coccicheck M=drivers/gpu/drm/i915/ MODE=patch COCCI=./scripts/coccinelle/api/debugfs/debugfs_simple_attr.cocci
> > > > > 
> > > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > 
> > > > I believe these 2 gvt cases could be done in one patch.
> > > > But anyways,
> > > > 
> > > > Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > 
> > > > for both patches... and will leave these 2 patches for gvt folks
> > > > to apply. Unless they ack and I apply in the drm-intel along with the other ones.
> > > >
> > > 
> > > yeah, they're fine with me, feel free to apply them directly.
> > > 
> > > Acked-by: Zhenyu Wang <zhenyuw@linux.intel.com>
> > 
> > Unfortunately I got some conflicts when trying to apply on drm-intel-next.
> > 
> > We probably need a new version, and probably through gvt branches it
> > will be easier to handle conflicts if they appear.
> 
> Hello Rodrigo,
> Sure. I will send in a new version. I am current using linux-next git repo as my
> remote origin [tag 20230113]. Are there any specific instruction/location from
> where I should access the gvt branch?

https://github.com/intel/gvt-linux.git

but with the linux-next your patch is probably right for them.

> 
> Thank you.
> 
> > 
> > > 
> > > thanks!
> > > 
> > > > > ---
> > > > >  drivers/gpu/drm/i915/gvt/debugfs.c | 6 +++---
> > > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/i915/gvt/debugfs.c b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > > index 03f081c3d9a4..baccbf1761b7 100644
> > > > > --- a/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > > +++ b/drivers/gpu/drm/i915/gvt/debugfs.c
> > > > > @@ -165,7 +165,7 @@ static int vgpu_status_get(void *data, u64 *val)
> > > > >  	return 0;
> > > > >  }
> > > > >  
> > > > > -DEFINE_SIMPLE_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > > > +DEFINE_DEBUGFS_ATTRIBUTE(vgpu_status_fops, vgpu_status_get, NULL, "0x%llx\n");
> > > > >  
> > > > >  /**
> > > > >   * intel_gvt_debugfs_add_vgpu - register debugfs entries for a vGPU
> > > > > @@ -182,8 +182,8 @@ void intel_gvt_debugfs_add_vgpu(struct intel_vgpu *vgpu)
> > > > >  			    &vgpu_mmio_diff_fops);
> > > > >  	debugfs_create_file_unsafe("scan_nonprivbb", 0644, vgpu->debugfs, vgpu,
> > > > >  				   &vgpu_scan_nonprivbb_fops);
> > > > > -	debugfs_create_file("status", 0644, vgpu->debugfs, vgpu,
> > > > > -			    &vgpu_status_fops);
> > > > > +	debugfs_create_file_unsafe("status", 0644, vgpu->debugfs, vgpu,
> > > > > +				   &vgpu_status_fops);
> > > > >  }
> > > > >  
> > > > >  /**
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > > 
> > > > > 
> > 
> > 
> 
> 
