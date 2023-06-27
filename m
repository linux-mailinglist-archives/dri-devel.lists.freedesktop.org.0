Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F34073FF87
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 17:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 534D910E302;
	Tue, 27 Jun 2023 15:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB8CC10E302;
 Tue, 27 Jun 2023 15:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687879166; x=1719415166;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=ZIeZvyUqAdDjeciQ8rbPObon73AZM11bxo+yaH/c2NE=;
 b=Kb9wlHf0yRWNvBD7IMk6MaMyoaKrBSy1LXfZ82yYfO5rEHoQqno18qnT
 K5mw0DfuHmhlZkkpfBDEsWdUOll5H+/TIkmzOcGMODQQpu6dP79g412Nj
 sKzXD0xlYerFZWCf/Heune7PIvdFr33MvVqCi8JSqSQJrlmblyO/lkmo3
 g0bGWOs39PnFbr311YylvXxmBk5z1egi76s4krsbYSnmEQOA22wjXsjmy
 PfhomxvBdnYMe0NLwZoY8X2GwfZtfAk1nmvx7tVgT/5jzOnKSrG/sZrPo
 3aDZujS6oiG73aWOR9EM85miAhj7herBPy7x1vilWp2S8Mpr210yoyU/K g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="425270799"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
 d="scan'208,217";a="425270799"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2023 08:19:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="1046985012"
X-IronPort-AV: E=Sophos;i="6.01,162,1684825200"; 
 d="scan'208,217";a="1046985012"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga005.fm.intel.com with ESMTP; 27 Jun 2023 08:19:12 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 08:19:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 27 Jun 2023 08:19:11 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 27 Jun 2023 08:19:11 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 27 Jun 2023 08:19:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZob6tlDfymRphP5wOj3oy7kaHTUKJuvma4OTM4PXB0xHcqPqvLhiSYv4zWDjIWGDrTnv+RT4BKXHVIbogazJ52pJp1GVFteAMnyi4qgQhmABBt/lSvwpjtd5MrOtjKwQ6FAS7SL1gaWwEUl19Y7mSo6d4VJQ9dN+tqjKkWK42roSojCgM+etZ2h0hrrnRay9mYkxNDE2jwIsOP+swQW3213lpp+BG7JtyT09IQXOSgNd63Jo6lXE2WVJLwtrSL28RAjgonu1mXw68I31AgozVmUUmlJesVT6rigZ2w+Uk0xJ4hbPOsPh4nbpmq3vlnGqxZdd4Z3IM6KunxRdmk+nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNgJ9arNUtwPLvEgBb/A12CbID8ZypSZ1nbGWnC35rE=;
 b=LXLNUG5Q94loAjhR3HW7I5Finb4sUix2DHL9vDQMXkl99dMAAGzxhT/bmlU6sb2tdrTjiF4nxAf9iFuudb72TLXIBYlYzPULJNZpafiUd1enJhrCnE5IWw4yEBFy5M+TYDQ7sPAkDB0ZWaZTqjmugjCPEGYZBfxW3I1fm9WNDii88i9//O+hRgBKxqIJYwfXF0/O2Hs/qmkjcTFNdo50LO4BCy+qIIFtuYGS6bSmnR6wfwhKtS5zFk3LOeI2EzququzMk5VxUth1cR7W8lWmL75VCe9tjAu3UUH5ge1ac4ICVE3Rb59Z1JkGzbFldwfm+tD9T1Ir7hrafwQak4FKLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB2567.namprd11.prod.outlook.com (2603:10b6:a02:c5::32)
 by SA0PR11MB4765.namprd11.prod.outlook.com (2603:10b6:806:9b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Tue, 27 Jun
 2023 15:19:06 +0000
Received: from BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46]) by BYAPR11MB2567.namprd11.prod.outlook.com
 ([fe80::28b4:ae85:a4f0:3f46%4]) with mapi id 15.20.6521.020; Tue, 27 Jun 2023
 15:19:06 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v8 1/2] drm/i915: preparation for using PAT index
Thread-Topic: [PATCH v8 1/2] drm/i915: preparation for using PAT index
Thread-Index: AQHZqPtKSp2FRhkCV0qbq97s7geB/6+eruEAgAAQaICAAACqwA==
Date: Tue, 27 Jun 2023 15:19:06 +0000
Message-ID: <BYAPR11MB2567CE754B9EE98E5646D05D9A27A@BYAPR11MB2567.namprd11.prod.outlook.com>
References: <20230509165200.1740-1-fei.yang@intel.com>
 <20230509165200.1740-2-fei.yang@intel.com> <874jmtt4pb.fsf@intel.com>
 <b22c7111-0587-19b5-d912-9d07b81d2bb0@linux.intel.com>
 <ZJr6aRb8SrLug7SQ@ashyti-mobl2.lan>
In-Reply-To: <ZJr6aRb8SrLug7SQ@ashyti-mobl2.lan>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB2567:EE_|SA0PR11MB4765:EE_
x-ms-office365-filtering-correlation-id: f7c8e33a-cc6d-4405-2b93-08db7721d960
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SAZyaFcHBnQjoA4lylZ8tjjRhiaHKabZAJWEWxdg27S8h5vdWnS8qRhw29r3Ct0b7hHzxgVRVYTHlPhwavPym0HKsaJrrcJEBFpecBppKuo2vM5I0Vbam/+I4/km5FWmdKUgR+JRHPU+RPb0dtToDbsjniP5YtcSyQFR3QoGTXsZqjUJBtY6i/33z8XR1ttYwPCjLHJT3MR3zzmAfCyco1AmcKkREiFKIAxaQWk6EMNmQLsUdmUrihOSQrje1eLZNTjAaW3V1vpi8ic2ylLFWli83oD2ES/E4g04knb4v3A2ptvEYkYEHr7VTLkLgyZtAbzvzutFT5pybI9xXw2oVCUx56YUt1C7Z8qaiLzvyGN2js4EVTozeQTL2k3Z6Vv+PLxYtLvs/hE+FPtwXvtzXam4LfnYPjSpqVmILgjH+KvhZ3vlmHc3yh6so31F7BaVrA/Fub5MZnVY/9pNlHbyYzCdroRBQ24fuZ3yr1eK+c76KRJYuqUYBhXa1xBGKGx0KhzG3a6uNB4QCV59ImPWYUhtb34Ni41oRM5IUpkBb253HFVMqQpTOjmSRKie+bayX3ZdI5YOoacvZVyMJCVO91MHJQxqYHWD84yh4f6UdYE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2567.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(8676002)(8936002)(66946007)(55016003)(76116006)(66446008)(66556008)(316002)(64756008)(66476007)(4326008)(9686003)(186003)(6506007)(26005)(7696005)(110136005)(54906003)(71200400001)(966005)(41300700001)(91956017)(2906002)(5660300002)(52536014)(478600001)(38070700005)(82960400001)(122000001)(38100700002)(19627405001)(33656002)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?1XVGRWfUklmTjuRrKECZdzxT8Bz800XjepIBDCjS7ZxO3kwW16OvZX1aTn?=
 =?iso-8859-1?Q?3eH/VFNmwcV8ozDeI5t+4KlLfpyj57Fk1F73Cd5qGhPz5KHyQTkHx9kpav?=
 =?iso-8859-1?Q?ks6J5pox5a6wiJOx+6IcuzOdthdGyp4Fqd+JFNBa4Ipa8r+s1gRnp/JYjp?=
 =?iso-8859-1?Q?CHBZ8pV5RthfsydfHRngJFmbtMvgcJ5uWDugsT8EK+NPuMSppbLKM56olB?=
 =?iso-8859-1?Q?i3P8hWGIzkk9r3ZWQPRo/HNFeWRv8Rns13Thdd2wFF4liVYdIJXupiJ+pA?=
 =?iso-8859-1?Q?ErfA5uwkYBDD42rh/zarW1slriq5eYxS7Q/uBEZ/f/9Bo4FruT26nMYFKP?=
 =?iso-8859-1?Q?ows7MSwQ4mcJ2UTrqZ5HgQh0Xr5Mnd4iV/1ltRF3CYCpSGLBQ8dXPE5zdG?=
 =?iso-8859-1?Q?UOqv6ZSqqe0MBZFTetvfuUj430hrp7Gs2OBlW9WN0asvv7riYPpISdtouI?=
 =?iso-8859-1?Q?QEMO/GEpwnMYlofwT+bs1LEYyUkji5lmqKInXN8cKHl4fwayCJIdlbJBTu?=
 =?iso-8859-1?Q?721RwjbOa2xVpsQgqWn5S5BH1H6u+Ksmbp5VNQwtOwAkWWegiroBn1hc7Y?=
 =?iso-8859-1?Q?0o3rpWo+XWsJ38Uhho2uqNPyCk75/Rtb8oq5/yphKola+4Joxl19wxdrWx?=
 =?iso-8859-1?Q?4TOmxmKcArFZ4CbZOlb6XR5nIAxoYTMfvbG1dfqHiMUgPPPj2LfRB6cDnS?=
 =?iso-8859-1?Q?rSjgaruzk03z3crQ4yKHdv2pHItVu1bNu9qlqSAmKT+kknCFTdfMzNKEum?=
 =?iso-8859-1?Q?btOlwgwpZg/0C1tdTvIPkKyAOgXjqybJommMSqqfwdTPBh6DA/LuM9qzio?=
 =?iso-8859-1?Q?Twym94H5UewM6/RDwdemA5Hwz5lPdT+zPLUnyvemLahIilUF/b5Nop6l5I?=
 =?iso-8859-1?Q?y4atmwv6Llupb1pwSALgSu/uWcSS2sW+sIQm2IO5LBu2Fm1dV84qptm0gX?=
 =?iso-8859-1?Q?bjlSKgsSa+fgbpcdNR+eHTzMBO99sbsA/NX8UQtqnSTgozRtI6kveac9Z9?=
 =?iso-8859-1?Q?aq7dnrnpUzXvHzDD5uFyZ+k/zJFxhmL0fy0vYXIQkab2Zj/U1wUyFk8+AB?=
 =?iso-8859-1?Q?Cgt+08TG0gquO8hVGcHRbehEiofvSLOs8mDnDGRkD9GUPnPkc5Gywrr/Y+?=
 =?iso-8859-1?Q?c15bb0DgXce+lTg0cN2EnasalBjNlbR3WWCQz4Ut2M5xoFdfK6p4pImKeu?=
 =?iso-8859-1?Q?A3Gn9tOWRGTqG4kCkI6VmFypLLh5wFqzHMJILEkmmjgW8jArB8BRRLjdvW?=
 =?iso-8859-1?Q?JUlb+Jo/qVLVRIbquQn00wg88dze1eZ7rkBtEFfFei2vBxqHT8y/s/KjhP?=
 =?iso-8859-1?Q?aPgZDzMx5chF3gLZokCXr+V6s4mxd2HQ4SIELzSKsN8vimwLXd3knXbTJ3?=
 =?iso-8859-1?Q?97wKgJolgEIRLlD/eSF/UVd+kyglJsYMIjnhlpX/Ye/1Krqqt+qL9o/dPc?=
 =?iso-8859-1?Q?yNp5blPL6lCcCCmgHAau52CzRBW7Vo8mA4ejzKDWhEUZefXjRqq2xVvkfq?=
 =?iso-8859-1?Q?ewFNWcpcvd+R9P8YrxlKrhqB42vBI1cW+EXsP1KQ5m9r7jXaZo9RN4TAha?=
 =?iso-8859-1?Q?I0SvxJm5V8hqUDbddBfrcmncyBV/MUJ9MIcvWxPaJpSna0guS8Yv1/dMaZ?=
 =?iso-8859-1?Q?RcDbSAsPelyMY=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BYAPR11MB2567CE754B9EE98E5646D05D9A27ABYAPR11MB2567namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2567.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c8e33a-cc6d-4405-2b93-08db7721d960
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2023 15:19:06.7388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CmZege3sKd4TWtjgIy9KsRfgMgE4o8ADZFdcNEG8G4WWvr3jXooFGGTZKn4KVGdeLnfQ2stwh+Qqwfb3YnQ8Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4765
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
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Roper,
 Matthew D" <matthew.d.roper@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Hajda, 
 Andrzej" <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_BYAPR11MB2567CE754B9EE98E5646D05D9A27ABYAPR11MB2567namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Hi Jani and Tvrtko,
>
>>>> This patch is a preparation for replacing enum i915_cache_level with P=
AT
>>>> index. Caching policy for buffer objects is set through the PAT index =
in
>>>> PTE, the old i915_cache_level is not sufficient to represent all cachi=
ng
>>>> modes supported by the hardware.
>>>>
>>>> Preparing the transition by adding some platform dependent data struct=
ures
>>>> and helper functions to translate the cache_level to pat_index.
>>>>
>>>> cachelevel_to_pat: a platform dependent array mapping cache_level to
>>>>                     pat_index.
>>>>
>>>> max_pat_index: the maximum PAT index recommended in hardware specifica=
tion
>>>>                 Needed for validating the PAT index passed in from use=
r
>>>>                 space.
>>>>
>>>> i915_gem_get_pat_index: function to convert cache_level to PAT index.
>>>>
>>>> obj_to_i915(obj): macro moved to header file for wider usage.
>>>>
>>>> I915_MAX_CACHE_LEVEL: upper bound of i915_cache_level for the
>>>>                        convenience of coding.
>>>>
>>>> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
>>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>>> Signed-off-by: Fei Yang <fei.yang@intel.com>
>>>> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>
>>> [snip]
>>>
>>>> diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/driver=
s/gpu/drm/i915/selftests/mock_gem_device.c
>>>> index f6a7c0bd2955..0eda8b4ee17f 100644
>>>> --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>>>> +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
>>>> @@ -123,7 +123,9 @@ struct drm_i915_private *mock_gem_device(void)
>>>>    static struct dev_iommu fake_iommu =3D { .priv =3D (void *)-1 };
>>>>   #endif
>>>>    struct drm_i915_private *i915;
>>>> + struct intel_device_info *i915_info;
>>>>    struct pci_dev *pdev;
>>>> + unsigned int i;
>>>>    int ret;
>>>>    pdev =3D kzalloc(sizeof(*pdev), GFP_KERNEL);
>>>> @@ -180,6 +182,13 @@ struct drm_i915_private *mock_gem_device(void)
>>>>            I915_GTT_PAGE_SIZE_2M;
>>>>    RUNTIME_INFO(i915)->memory_regions =3D REGION_SMEM;
>>>> +
>>>> + /* simply use legacy cache level for mock device */
>>>> + i915_info =3D (struct intel_device_info *)INTEL_INFO(i915);
>>>
>>> This is not okay. It's not okay to modify device info at runtime. This
>>> is why we've separated runtime info from device info. This is why we've
>>> made device info const, and localized the modifications to a couple of
>>> places.
>>>
>>> If you need to modify it, it belongs in runtime info. Even if it's only
>>> ever modified for mock devices.
>>>
>>> We were at the brink of being able to finally convert INTEL_INFO() into
>>> a pointer to const rodata [1], where you are unable to modify it, but
>>> this having been merged as commit 5e352e32aec2 ("drm/i915: preparation
>>> for using PAT index") sets us back. (With [1] this oopses trying to
>>> modify read-only data.)
>>>
>>> This has been posted to the public list 20+ times, and nobody noticed o=
r
>>> pointed this out?!
>
> That's not cool, indeed.
>
>>> Throwing away const should be a huge red flag to any developer or
>>> reviewer. Hell, *any* cast should be.
>>>
>>> I've got a patch ready moving cachelevel_to_pat and max_pat_index to
>>> runtime info. It's not great, since we'd be doing it only for the mock
>>> device. Better ideas? I'm not waiting long.
>>>
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>> [1] https://patchwork.freedesktop.org/patch/msgid/0badc36ce6dd6b030507b=
dfd8a42ab984fb38d12.1686236840.git.jani.nikula@intel.com
>>>
>>>
>>>> + i915_info->max_pat_index =3D 3;
>>>> + for (i =3D 0; i < I915_MAX_CACHE_LEVEL; i++)
>>>> +         i915_info->cachelevel_to_pat[i] =3D i;
>>>> +
>>
>> I'd simply suggest having a local static const table for the mock device=
. It
>> should be trivial once i915->__info becomes a pointer so in that series =
I
>> guess.
>
> Fei... do you have bandwidth to look into this or do you want me
> to try Tvrtko's suggestion out?

Please go ahead Andi if you have time to help on this.

> Thank you Jani for reporting it and thank you Tvrtko for
> proposing the fix.

Sorry for the trouble here.

> Andi


--_000_BYAPR11MB2567CE754B9EE98E5646D05D9A27ABYAPR11MB2567namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1 ContentPasted2">
&gt; Hi Jani and Tvrtko,
<div class=3D"ContentPasted0">&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; This patch is a preparation =
for replacing enum i915_cache_level with PAT</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; index. Caching policy for bu=
ffer objects is set through the PAT index in</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; PTE, the old i915_cache_leve=
l is not sufficient to represent all caching</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; modes supported by the hardw=
are.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; Preparing the transition by =
adding some platform dependent data structures</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; and helper functions to tran=
slate the cache_level to pat_index.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; cachelevel_to_pat: a platfor=
m dependent array mapping cache_level to</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; pat_index.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; max_pat_index: the maximum P=
AT index recommended in hardware specification</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; Needed for validating the PAT index passed in f=
rom user</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; space.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; i915_gem_get_pat_index: func=
tion to convert cache_level to PAT index.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; obj_to_i915(obj): macro move=
d to header file for wider usage.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; I915_MAX_CACHE_LEVEL: upper =
bound of i915_cache_level for the</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;convenience of codin=
g.</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; Cc: Chris Wilson &lt;chris.p=
.wilson@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; Cc: Matt Roper &lt;matthew.d=
.roper@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; Signed-off-by: Fei Yang &lt;=
fei.yang@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; Reviewed-by: Andi Shyti &lt;=
andi.shyti@linux.intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; Reviewed-by: Andrzej Hajda &=
lt;andrzej.hajda@intel.com&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt; [snip]</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; diff --git a/drivers/gpu/drm=
/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem=
_device.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; index f6a7c0bd2955..0eda8b4e=
e17f 100644</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; --- a/drivers/gpu/drm/i915/s=
elftests/mock_gem_device.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; +++ b/drivers/gpu/drm/i915/s=
elftests/mock_gem_device.c</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; @@ -123,7 +123,9 @@ struct d=
rm_i915_private *mock_gem_device(void)</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; &nbsp; &nbsp;static struct d=
ev_iommu fake_iommu =3D { .priv =3D (void *)-1 };</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; &nbsp; #endif</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; &nbsp; &nbsp;struct drm_i915=
_private *i915;</div>
<div class=3D"ContentPasted0">&gt;&gt;&gt;&gt; + struct intel_device_info *=
i915_info;</div>
&gt;&gt;&gt;&gt; &nbsp; &nbsp;struct pci_dev *pdev;
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; + unsigned int i;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; &nbsp; &nbsp;int ret;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; &nbsp; &nbsp;pdev =3D kzallo=
c(sizeof(*pdev), GFP_KERNEL);</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; @@ -180,6 +182,13 @@ struct =
drm_i915_private *mock_gem_device(void)</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;I915_GTT_PAGE_SIZE_2M;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; &nbsp; &nbsp;RUNTIME_INFO(i9=
15)-&gt;memory_regions =3D REGION_SMEM;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; + /* simply use legacy cache=
 level for mock device */</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;&gt; + i915_info =3D (struct inte=
l_device_info *)INTEL_INFO(i915);</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; This is not okay. It's not okay =
to modify device info at runtime. This</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; is why we've separated runtime i=
nfo from device info. This is why we've</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; made device info const, and loca=
lized the modifications to a couple of</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; places.</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; If you need to modify it, it bel=
ongs in runtime info. Even if it's only</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; ever modified for mock devices.<=
/div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; We were at the brink of being ab=
le to finally convert INTEL_INFO() into</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; a pointer to const rodata [1], w=
here you are unable to modify it, but</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; this having been merged as commi=
t 5e352e32aec2 (&quot;drm/i915: preparation</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; for using PAT index&quot;) sets =
us back. (With [1] this oopses trying to</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; modify read-only data.)</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; This has been posted to the publ=
ic list 20+ times, and nobody noticed or</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; pointed this out?!</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt; That's not cool, indeed.</div>
<div class=3D"ContentPasted1">&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; Throwing away const should be a =
huge red flag to any developer or</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; reviewer. Hell, *any* cast shoul=
d be.</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; I've got a patch ready moving ca=
chelevel_to_pat and max_pat_index to</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; runtime info. It's not great, si=
nce we'd be doing it only for the mock</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; device. Better ideas? I'm not wa=
iting long.</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; BR,</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt; Jani.</div>
<div class=3D"ContentPasted1">&gt;&gt;&gt;</div>
&gt;&gt;&gt;
<div class=3D"ContentPasted2">&gt;&gt;&gt; [1] https://patchwork.freedeskto=
p.org/patch/msgid/0badc36ce6dd6b030507bdfd8a42ab984fb38d12.1686236840.git.j=
ani.nikula@intel.com</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;&gt; + i915_info-&gt;max_pat_inde=
x =3D 3;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;&gt; + for (i =3D 0; i &lt; I915_=
MAX_CACHE_LEVEL; i++)</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;&gt; + &nbsp; &nbsp; &nbsp; &nbsp=
; i915_info-&gt;cachelevel_to_pat[i] =3D i;</div>
<div class=3D"ContentPasted2">&gt;&gt;&gt;&gt; +</div>
<div class=3D"ContentPasted2">&gt;&gt;</div>
<div class=3D"ContentPasted2">&gt;&gt; I'd simply suggest having a local st=
atic const table for the mock device. It</div>
<div class=3D"ContentPasted2">&gt;&gt; should be trivial once i915-&gt;__in=
fo becomes a pointer so in that series I</div>
<div class=3D"ContentPasted2">&gt;&gt; guess.</div>
<div class=3D"ContentPasted2">&gt;</div>
<div class=3D"ContentPasted2">&gt; Fei... do you have bandwidth to look int=
o this or do you want me</div>
<div class=3D"ContentPasted2">&gt; to try Tvrtko's suggestion out?</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">Please go ahead Andi if you have time to help=
 on this.</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">&gt; Thank you Jani for reporting it and than=
k you Tvrtko for</div>
<div class=3D"ContentPasted2">&gt; proposing the fix.</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">Sorry for the trouble here.</div>
<div><br class=3D"ContentPasted2">
</div>
<div class=3D"ContentPasted2">&gt; Andi</div>
<br>
</div>
</body>
</html>

--_000_BYAPR11MB2567CE754B9EE98E5646D05D9A27ABYAPR11MB2567namp_--
