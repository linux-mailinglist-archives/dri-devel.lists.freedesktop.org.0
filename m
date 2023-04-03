Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C93B06D4E03
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 18:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BE0710E522;
	Mon,  3 Apr 2023 16:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D07110E522;
 Mon,  3 Apr 2023 16:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680539742; x=1712075742;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3jonqV/qptYXxS9X+duGqRexqdUjGZ4YO8F25Ff7Vg4=;
 b=KwjUnQSUU4pC4kS7DNV3PuwJtIiODT42L3lXJ8F4V5VHgmeb3IOaV/AZ
 n9d0STtbW/zj2xLf1uaVTVqrJqlQJ1LzjQT22VliQh8/8Yj4tUvTIC+Oq
 PGLSOSC04XbrvMquOlFcOHqjln//xu7RVQqXP23pLrFGoBTBLZ4viHz10
 hGO7fmIPrAnGFxMTKiwkzDvotRyB1dQ/auGM0Vf5POTxG3Z+XHrMNyI1A
 ZOl5CGQcuitG34CrYT421s7ftZ3zSene/JC9N3QC5pHSenLJzDDv+HaCa
 cisraC0rRPjYWVygjGh/QMiH0eHCA1mIN7YmuBPmYol6YA1+qpAkNVuB9 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="340680872"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="340680872"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 09:35:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="679530008"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="679530008"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 03 Apr 2023 09:35:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 09:35:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Apr 2023 09:35:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 3 Apr 2023 09:35:39 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 3 Apr 2023 09:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPCJPLAcQVRQpaT2bEhu8ca2NvdvB6+viw0/LDpTRa4LhL+KTqQJ+da3gQyZ2MqCQO48nHD3MFNBBRBR2hpM+tjh4OoLhGIW1pMBpTklCgLlfEsiD6XIsratX93dausYAW807AHqVnHPyFSEXEsKX+NqEY9S0atQh/upoJ8f5Ewc2/J4fENv1m+eKU5MH/6ybH4vNRtYHCxJmxy7NwsjVjXtXenFp6LKdrBL3G8IR8XaKgIrCfs5pTcSwyZYOaN4NnH/4oLMH0NXYk36Y3yKKcFseaYS5/T9d5amPT1fWOoy95LGQ4Nl/DkGx0kdTil8/s/HEGAgsgQOGIQvNwyPHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gCiwk+nwHgB1m4D5uOuEz32r8lBMTNIGvRV+l0N8csA=;
 b=QyH+nisuNyh7hDqqYrd60yliqHETmFFUYyqbWPa5A6yowqR9ZKel8NbDyb9bEEjVurgWIDRkmXoso9gHnT56xnqw0DVh1JtENhZb6lWg3iOnaT3QzLlnjsk4HNgIm69chJJ06/WuC2VhUYDit5M03OICdEyGnOON63JtmR2Wzd+Xm0/QJdWiJeScRKhPtKFtEK+A38zR1Pxyuiggo9Ug1tSewTvnUYaAMP9scvQERB4ljq0JQwjrPueekcpUt3r0PurJvJbDMJqukufOgvJ/s1YKIHBvWUoWzzAIXILcxUC3KjdbOUzSKycHPOpUZLt0ws3yWH7Iyl2p5/uB2PGM2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 16:35:37 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%8]) with mapi id 15.20.6254.033; Mon, 3 Apr 2023
 16:35:36 +0000
Date: Mon, 3 Apr 2023 09:35:32 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 7/7] drm/i915: Allow user to set cache at BO creation
Message-ID: <20230403163532.GT4085390@mdroper-desk1.amr.corp.intel.com>
References: <20230401063830.438127-1-fei.yang@intel.com>
 <20230401063830.438127-8-fei.yang@intel.com>
 <ZCr4gB8Q75+QWr19@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZCr4gB8Q75+QWr19@intel.com>
X-ClientProxiedBy: BY5PR04CA0020.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::30) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|IA1PR11MB6099:EE_
X-MS-Office365-Filtering-Correlation-Id: f49aec66-48cf-4f2c-1371-08db346173f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7iqkgO/n/wnvqDlhBEtfEv+VzPCLyjaLan8zPG0qUdKpRonPerfbR420uGyNWoKsiB1ooIEbZyvbOh8w5SLfKTI1apdoXqHhseiUOi8+FS3DoX9NQOImOwraM95CPKmG0YlaPwOffThCKNTUwgslNPtap3F+ZuPc1i8J5clwdBo+BzWQBwdpy2OtLrsCmTdepYyvE3YczHwQo118sR3Hnv7d5aV0ZTvfP2Vwer7JQS0QQ28TvbJeYQqW9ayGDjI8HMSuni+G3Eg/FRs4+iyJkZTm1ZJHtFBUVQBS9aK2twq+d5fhf0LDYb1wFzbDv+zkLe5LuyY7fXcB5OWovC9LhUi7e+Wl+dKqbBIGQmxjw6KhHjRbaN2/5GziFlfzHvBno1tlRSWzhMPsQafslge5l6ydQiUy7kxrbBtTnWSdzteqrH0bETzrHzSrF8zBLKMVt3l5aBgLBk0By+VQZZJoYE8G+qlf3FVl5bWLcAEjV/GP9ZJmVQytR5dTPuu1qtHnSRVp2SnnlXr8WUld+2wQ/8aUlcWYrf5hFcTqUtsu8l027xy1uB+CHaf7k0EZudJ2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(346002)(376002)(136003)(396003)(366004)(451199021)(86362001)(33656002)(2906002)(6486002)(83380400001)(186003)(66574015)(6512007)(1076003)(6506007)(26005)(6666004)(4326008)(8676002)(66946007)(66556008)(6916009)(478600001)(66476007)(82960400001)(41300700001)(5660300002)(38100700002)(316002)(54906003)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?7xlwzDL+t3oe0R8CDZHiDrgMpVy+ZwGGYLNx64Kd04xfBzTdmgikWPfZHh?=
 =?iso-8859-1?Q?hdnjtjpHYKE5VqGzPdxfvNsURMJapCnfepsud6JfHyeiyabsE2u99VdHm4?=
 =?iso-8859-1?Q?zFJaRo8wpDGep8UZ05fzO4Yt8M8YXA0I638flDTRUQJQlRZ318Asc/rZJp?=
 =?iso-8859-1?Q?462DS9RzPx57tomlAlpX5Qtvx+9fOsGWk7l1lkuf6Q3i6LJv4BvjdlPhHG?=
 =?iso-8859-1?Q?Nzsy1j5RMKz/VxbUp9/nFFHERERkP1fArUbkw5a7HMwNVf4v/a9qi93lfP?=
 =?iso-8859-1?Q?4gkrXXlMlTEAcCwl0071L5Nv3A3om1yYjSkhFHPLVlRH4dmn5a6R6DOJQk?=
 =?iso-8859-1?Q?R4TJZuokhVvEtpV1hyWWv4V2zRKErX/kVSoJbGSNohqnKl6n5qRaPTbblj?=
 =?iso-8859-1?Q?O4EHntZEb447YkXexKe7kENgY7SNb0plvys+xZ3xwdWer+9htNzxbSG5g0?=
 =?iso-8859-1?Q?vjmcHD2C80BGt12LhY+/A5I0xJAVx62MOuSDqux10lW2ZzOGRKt52zRS7D?=
 =?iso-8859-1?Q?uofFWHuhcsY8EK5xjfDAleRVsy9ihcxFgP4PVJam+O+Mq6amAbBUYW6fRu?=
 =?iso-8859-1?Q?eLgDTMAfHRlgDyl8p1E8lPTPnzP3WbEzj1twy2YeX2Vu4rbwRGvaWyRvjk?=
 =?iso-8859-1?Q?owEdNXI7/Y3OhCZhRvrPGHZawlQhVApgLHu7YZ8BoXHl9Lr7PMxAQorXrf?=
 =?iso-8859-1?Q?5ddEVf+kk0p/J5n1tH7RTiAIQ4dkW0xj1ChgPUWVsObWkdIEcsiq4PPp3a?=
 =?iso-8859-1?Q?jQAc2LmzMSQig2X4JfL7Nbpq1vuOVW9yNBVwDgmM94B30olh0j24HuNokV?=
 =?iso-8859-1?Q?PQSQgqamYQXIXBqDqsMRt+/LGX4+fUs2h9QUWqlvBT6wqlhWKDwLp6a/ld?=
 =?iso-8859-1?Q?5Sv1nwd8l/qlEDmHvXMsbT+rkXyVr8bEzCBpSM7aIyzbSEVHBTXdSWppqf?=
 =?iso-8859-1?Q?Tp5Ht7iODIYIe/FckYv2opacjqFaUVVYtngc9uuGxAmbuX6hhNt5qY1lky?=
 =?iso-8859-1?Q?Yi9qfG4vsl3GGJkXvBP23gq0pvzGsyxvxZz/av82CvVGctvwG6nD/YCfOW?=
 =?iso-8859-1?Q?9bzRXDlHCCG/t9LojM5gaHIo60ySU+Q7X7+4bd11rXMAxxhbeoRrJHZMTR?=
 =?iso-8859-1?Q?QlwoRh7Dxt7apX/DgjaLeTsB+Oz8JtTlX08QVUpOE6kmu56w0R/oBvdDAX?=
 =?iso-8859-1?Q?1OACPariUuARazoiD3khnY3w1rGAoQusqSqBNs0bKhOecGOdGgedGlNVwW?=
 =?iso-8859-1?Q?/zTOpQbQAhCsaNnlkKC//Nzxvaa2fm/3ZF2OK/6sfMZ9YR8of18uwRIAqf?=
 =?iso-8859-1?Q?5wJnNkOuvUef8osvQf6H6anhEWAO4UPy1O2kmwSLRfac3kY0HQImKWdtTx?=
 =?iso-8859-1?Q?sbCh42J4FUGj50RrGhQnws+9GuLKhTtXV16dl3179X3C2FVxksgkVShL21?=
 =?iso-8859-1?Q?pAlTZnOFCDU0zsz6bDyQ+B5TqhdB5cjOlODLT034maVWa/0lJfBzpuhn0Y?=
 =?iso-8859-1?Q?+7xygueQMjNl3I8a828DLUGmvBOeejcEophU43LKa2zu6nQa0MAtA3WoAw?=
 =?iso-8859-1?Q?UNg+vTCUM6IP+VPPbzg0ew+LtLtOtMNbtrMcLDDx5DwATvis4nB1+nMxVK?=
 =?iso-8859-1?Q?MGEHULtW3t4W8uFmwZu3Q7AVB58915r/gWGwiiPIwuJ64TiQdDVgBfOg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f49aec66-48cf-4f2c-1371-08db346173f0
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 16:35:36.6923 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ibDG98ErmAoF8sUUB7qi9U3LoI8WYgUK+MR75KhV2567JBQCfOqkbxgZEzQNA5yiCm5Bcm1e2KHokOBhyfAI4e2HFkZ2Ipk1inv2g+DwOy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
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
Cc: intel-gfx@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@linux.intel.com>, dri-devel@lists.freedesktop.org,
 fei.yang@intel.com, Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 03, 2023 at 07:02:08PM +0300, Ville Syrjälä wrote:
> On Fri, Mar 31, 2023 at 11:38:30PM -0700, fei.yang@intel.com wrote:
> > From: Fei Yang <fei.yang@intel.com>
> > 
> > To comply with the design that buffer objects shall have immutable
> > cache setting through out its life cycle, {set, get}_caching ioctl's
> > are no longer supported from MTL onward. With that change caching
> > policy can only be set at object creation time. The current code
> > applies a default (platform dependent) cache setting for all objects.
> > However this is not optimal for performance tuning. The patch extends
> > the existing gem_create uAPI to let user set PAT index for the object
> > at creation time.
> 
> This is missing the whole justification for the new uapi.
> Why is MOCS not sufficient?

PAT and MOCS are somewhat related, but they're not the same thing.  The
general direction of the hardware architecture recently has been to
slowly dumb down MOCS and move more of the important memory/cache
control over to the PAT instead.  On current platforms there is some
overlap (and MOCS has an "ignore PAT" setting that makes the MOCS "win"
for the specific fields that both can control), but MOCS doesn't have a
way to express things like snoop/coherency mode (on MTL), or class of
service (on PVC).  And if you check some of the future platforms, the
hardware design starts packing even more stuff into the PAT (not just
cache behavior) which will never be handled by MOCS.

Also keep in mind that MOCS generally applies at the GPU instruction
level; although a lot of instructions have a field to provide a MOCS
index, or can use a MOCS already associated with a surface state, there
are still some that don't.  PAT is the source of memory access
characteristics for anything that can't provide a MOCS directly.


Matt

> 
> > The new extension is platform independent, so UMD's can switch to using
> > this extension for older platforms as well, while {set, get}_caching are
> > still supported on these legacy paltforms for compatibility reason.
> > 
> > Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Fei Yang <fei.yang@intel.com>
> > Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_create.c | 33 ++++++++++++++++++++
> >  include/uapi/drm/i915_drm.h                | 36 ++++++++++++++++++++++
> >  tools/include/uapi/drm/i915_drm.h          | 36 ++++++++++++++++++++++
> >  3 files changed, 105 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > index e76c9703680e..1c6e2034d28e 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
> > @@ -244,6 +244,7 @@ struct create_ext {
> >  	unsigned int n_placements;
> >  	unsigned int placement_mask;
> >  	unsigned long flags;
> > +	unsigned int pat_index;
> >  };
> >  
> >  static void repr_placements(char *buf, size_t size,
> > @@ -393,11 +394,39 @@ static int ext_set_protected(struct i915_user_extension __user *base, void *data
> >  	return 0;
> >  }
> >  
> > +static int ext_set_pat(struct i915_user_extension __user *base, void *data)
> > +{
> > +	struct create_ext *ext_data = data;
> > +	struct drm_i915_private *i915 = ext_data->i915;
> > +	struct drm_i915_gem_create_ext_set_pat ext;
> > +	unsigned int max_pat_index;
> > +
> > +	BUILD_BUG_ON(sizeof(struct drm_i915_gem_create_ext_set_pat) !=
> > +		     offsetofend(struct drm_i915_gem_create_ext_set_pat, rsvd));
> > +
> > +	if (copy_from_user(&ext, base, sizeof(ext)))
> > +		return -EFAULT;
> > +
> > +	max_pat_index = INTEL_INFO(i915)->max_pat_index;
> > +
> > +	if (ext.pat_index > max_pat_index) {
> > +		drm_dbg(&i915->drm, "PAT index is invalid: %u\n",
> > +			ext.pat_index);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ext_data->pat_index = ext.pat_index;
> > +
> > +	return 0;
> > +}
> > +
> >  static const i915_user_extension_fn create_extensions[] = {
> >  	[I915_GEM_CREATE_EXT_MEMORY_REGIONS] = ext_set_placements,
> >  	[I915_GEM_CREATE_EXT_PROTECTED_CONTENT] = ext_set_protected,
> > +	[I915_GEM_CREATE_EXT_SET_PAT] = ext_set_pat,
> >  };
> >  
> > +#define PAT_INDEX_NOT_SET	0xffff
> >  /**
> >   * Creates a new mm object and returns a handle to it.
> >   * @dev: drm device pointer
> > @@ -417,6 +446,7 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
> >  	if (args->flags & ~I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS)
> >  		return -EINVAL;
> >  
> > +	ext_data.pat_index = PAT_INDEX_NOT_SET;
> >  	ret = i915_user_extensions(u64_to_user_ptr(args->extensions),
> >  				   create_extensions,
> >  				   ARRAY_SIZE(create_extensions),
> > @@ -453,5 +483,8 @@ i915_gem_create_ext_ioctl(struct drm_device *dev, void *data,
> >  	if (IS_ERR(obj))
> >  		return PTR_ERR(obj);
> >  
> > +	if (ext_data.pat_index != PAT_INDEX_NOT_SET)
> > +		i915_gem_object_set_pat_index(obj, ext_data.pat_index);
> > +
> >  	return i915_gem_publish(obj, file, &args->size, &args->handle);
> >  }
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index dba7c5a5b25e..03c5c314846e 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -3630,9 +3630,13 @@ struct drm_i915_gem_create_ext {
> >  	 *
> >  	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
> >  	 * struct drm_i915_gem_create_ext_protected_content.
> > +	 *
> > +	 * For I915_GEM_CREATE_EXT_SET_PAT usage see
> > +	 * struct drm_i915_gem_create_ext_set_pat.
> >  	 */
> >  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
> >  #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> > +#define I915_GEM_CREATE_EXT_SET_PAT 2
> >  	__u64 extensions;
> >  };
> >  
> > @@ -3747,6 +3751,38 @@ struct drm_i915_gem_create_ext_protected_content {
> >  	__u32 flags;
> >  };
> >  
> > +/**
> > + * struct drm_i915_gem_create_ext_set_pat - The
> > + * I915_GEM_CREATE_EXT_SET_PAT extension.
> > + *
> > + * If this extension is provided, the specified caching policy (PAT index) is
> > + * applied to the buffer object.
> > + *
> > + * Below is an example on how to create an object with specific caching policy:
> > + *
> > + * .. code-block:: C
> > + *
> > + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
> > + *              .base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> > + *              .pat_index = 0,
> > + *      };
> > + *      struct drm_i915_gem_create_ext create_ext = {
> > + *              .size = PAGE_SIZE,
> > + *              .extensions = (uintptr_t)&set_pat_ext,
> > + *      };
> > + *
> > + *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> > + *      if (err) ...
> > + */
> > +struct drm_i915_gem_create_ext_set_pat {
> > +	/** @base: Extension link. See struct i915_user_extension. */
> > +	struct i915_user_extension base;
> > +	/** @pat_index: PAT index to be set */
> > +	__u32 pat_index;
> > +	/** @rsvd: reserved for future use */
> > +	__u32 rsvd;
> > +};
> > +
> >  /* ID of the protected content session managed by i915 when PXP is active */
> >  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
> >  
> > diff --git a/tools/include/uapi/drm/i915_drm.h b/tools/include/uapi/drm/i915_drm.h
> > index 8df261c5ab9b..8cdcdb5fac26 100644
> > --- a/tools/include/uapi/drm/i915_drm.h
> > +++ b/tools/include/uapi/drm/i915_drm.h
> > @@ -3607,9 +3607,13 @@ struct drm_i915_gem_create_ext {
> >  	 *
> >  	 * For I915_GEM_CREATE_EXT_PROTECTED_CONTENT usage see
> >  	 * struct drm_i915_gem_create_ext_protected_content.
> > +	 *
> > +	 * For I915_GEM_CREATE_EXT_SET_PAT usage see
> > +	 * struct drm_i915_gem_create_ext_set_pat.
> >  	 */
> >  #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
> >  #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
> > +#define I915_GEM_CREATE_EXT_SET_PAT 2
> >  	__u64 extensions;
> >  };
> >  
> > @@ -3724,6 +3728,38 @@ struct drm_i915_gem_create_ext_protected_content {
> >  	__u32 flags;
> >  };
> >  
> > +/**
> > + * struct drm_i915_gem_create_ext_set_pat - The
> > + * I915_GEM_CREATE_EXT_SET_PAT extension.
> > + *
> > + * If this extension is provided, the specified caching policy (PAT index) is
> > + * applied to the buffer object.
> > + *
> > + * Below is an example on how to create an object with specific caching policy:
> > + *
> > + * .. code-block:: C
> > + *
> > + *      struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
> > + *              .base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> > + *              .pat_index = 0,
> > + *      };
> > + *      struct drm_i915_gem_create_ext create_ext = {
> > + *              .size = PAGE_SIZE,
> > + *              .extensions = (uintptr_t)&set_pat_ext,
> > + *      };
> > + *
> > + *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> > + *      if (err) ...
> > + */
> > +struct drm_i915_gem_create_ext_set_pat {
> > +	/** @base: Extension link. See struct i915_user_extension. */
> > +	struct i915_user_extension base;
> > +	/** @pat_index: PAT index to be set */
> > +	__u32 pat_index;
> > +	/** @rsvd: reserved for future use */
> > +	__u32 rsvd;
> > +};
> > +
> >  /* ID of the protected content session managed by i915 when PXP is active */
> >  #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
> >  
> > -- 
> > 2.25.1
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
