Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9B30FFF0
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 23:12:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F55D6EE75;
	Thu,  4 Feb 2021 22:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEBD76EE75
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 22:11:54 +0000 (UTC)
IronPort-SDR: AVUb7P3Mo6SAFuWyZB7iDzZEKA4oOud+3vjWHttVYeJQ/fYvZJaloPhV988Mv9ybR+y5gJ2GQh
 JRwAbQUHVxiA==
X-IronPort-AV: E=McAfee;i="6000,8403,9885"; a="266167370"
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="266167370"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 14:11:54 -0800
IronPort-SDR: WQwVcmO9GZF4+iUkyGi3FwrxeeZakmxJ7AwS50XNa0mOM4Lx2ZJVoP7yeWQaLp4uEw3ypLAxBF
 MCcLF84Cj9VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,153,1610438400"; d="scan'208";a="415332835"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2021 14:11:54 -0800
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 4 Feb 2021 14:11:53 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX609.amr.corp.intel.com (10.22.229.22) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 4 Feb 2021 14:11:53 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 4 Feb 2021 14:11:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Thu, 4 Feb 2021 14:11:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltyADJIJdISKaRRJgoQdNYMQrRph+oiT+3kMLAuL7+zasTubZBnVbWW029esv/l8KHiY4GzCcJxsNf470MU6ThqRX6ML7ABQ7gTkGq+mfTWrfKCP1MC4pK0LwapQlN2xL9tkFz79X3YLa8AvldzMeN7sWedZW4hj4nqmkvejvLWj57Gk6DTVzxHhYOYFVc0yldniFI6zdldYL2fv9F5FIQ4z8A56zsWXmXeANRWqnmrpFd/H3voNzWsO+bmhdcus7438p3P1Iwweg/1qt0NIRQFSY//4eRdelHU9WwaPyD2PICFZjoTfyK9W64F/6BOh5Xh1XtFZerH/ak7YGWP1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fqwdNlorYab4bpeQIS1sz5uVOZrHoBRCqW2GCVbTcI=;
 b=gzlk2MEcbcJHRskahIu6/3vkKuzEOu4EPeQYGw0qQs2A+WLfIjmr/i0dsB8oEB9xI2Ve5vHcVD95LzAR85vbVe+C9AEqDZEJffLEao/eN6qybsbYqnZ09DzLTYzF4B6652zEmySeKzL+x1+1RRWrXi1IzGVN+7pSPIUqCqSde/G9UD8vZS/ZhBEDFLIYv7KoAyqSwdgPt2u8u5JTIdtwERTyHeTo31I4sbpo4hHWERJoFCqEnvaSAB/iyD3tvD7wks6t9cJjlXueVXmOGddmq5rrBzZnjzOXIk3Gj4Kfs14cZyi/mg3BCG/PLbkol9f3DvppiFf/xUEwitE6ehSBKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fqwdNlorYab4bpeQIS1sz5uVOZrHoBRCqW2GCVbTcI=;
 b=uHzIj2MVQzpk5phOmWwLDjERFcQoitGddVYnntHsZRv+fFT2LtYhumwiJCnzNmG90II1LAuOHTWZRRVoIwc7D3MRQ1ub9SeTMGa3FPFxSLvCeupIiHaADWh1xd/GEeYlELAdThXGZ7Byj/xQTrIKiVyEuIPoruZ/twOgLV0HFl8=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MWHPR1101MB2190.namprd11.prod.outlook.com (2603:10b6:301:5b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.17; Thu, 4 Feb
 2021 22:11:45 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::4476:930f:5109:9c28%6]) with mapi id 15.20.3805.026; Thu, 4 Feb 2021
 22:11:45 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: RE: [PATCH rdma-core 3/3] configure: Add check for the presence of
 DRM headers
Thread-Topic: [PATCH rdma-core 3/3] configure: Add check for the presence of
 DRM headers
Thread-Index: AQHW+yScRpf+OD9gREyLpSuEhxG5P6pIfoMAgAADCQA=
Date: Thu, 4 Feb 2021 22:11:45 +0000
Message-ID: <MW3PR11MB45557821DAFD15937DEF488CE5B39@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1612464651-54073-1-git-send-email-jianxin.xiong@intel.com>
 <1612464651-54073-4-git-send-email-jianxin.xiong@intel.com>
 <20210204211210.GQ4247@nvidia.com>
In-Reply-To: <20210204211210.GQ4247@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6795bc4e-ab49-41d8-59c9-08d8c959dbf7
x-ms-traffictypediagnostic: MWHPR1101MB2190:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2190A75B9E67BB68C0B7F0A3E5B39@MWHPR1101MB2190.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C7Ckccn18LtNiv9IXfNALJNZQk2H8G2BBxyUNtgnuhidbJX5b5btfu8u4YuiAPLyqoBxXqbJBPPVvgBsEjh+SuU4++4L+qD43PwwyM6bjQnyeXPW+U0hj+w/kQlFkaBzT2krdO+K+OJbrpa9CGXRMGGxSyT/R0kfKzx5NNyNG6LeRYOL9sRGuXthwJEBzEDK1DpM6tZE2uig/sBYiinm+YWwqeQadOVYZtsVF/J3ltyRuP1Ph5Cb2Wo8UsBvzMNV2TYYTv0NejEcQcuQ3DAuvOBXqDh1pd2YxG7A+NDV5cds6ekGFZepB+vjaw/UUFstV3raUAZPQB3J0tORC22bETpboi+DzJXZF7zOvDZolq5hqNYSOwn17aG+civ1VBVe8UXQnCwPLY890HaHisaB6LW9Y6VCowBZ6aJhjEUiRQ/GDvSkYjJ/K72hIU3oqgzrOCX/wxKSWx9X2vIG3YSLzIzL2vKGzFgoldLU4Wf9Kj0vqr1m6Mf8tdCglL1At33Lbi0mY8SO/WLEKzYzc/6MZQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(346002)(136003)(376002)(366004)(396003)(66476007)(66446008)(52536014)(7696005)(66946007)(66556008)(64756008)(54906003)(9686003)(76116006)(316002)(6916009)(4326008)(55016002)(33656002)(8676002)(7416002)(2906002)(186003)(5660300002)(86362001)(8936002)(71200400001)(478600001)(26005)(53546011)(83380400001)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?d4WvFGeOTSfYZodJgQZ4LlHBqlzHlzkNlVz2qA5OhKa0ho3VywcxBzfmUH1P?=
 =?us-ascii?Q?TZVomoLrSh8PMtNS15jE98LVZOzS3Ayp5NrmpWCv0NZkWtBTfLhEOI9WIvbG?=
 =?us-ascii?Q?AOZizAvYOGQAw+xfJL23w5B0Fb8U69pEHX1qpGkbmoggoLfGOze34Ev64M7z?=
 =?us-ascii?Q?NjcDhbakfHoSP71Nx783Hnu8n4rJqNOb8y02b91t3Tkp+XxI2Q4nYB9OOxBv?=
 =?us-ascii?Q?0em3Liqp3X7KmTDZHiMQKDJZ55qQiECgKlXy9Wg79X/en6LUcbRWuKesHqGD?=
 =?us-ascii?Q?WMKgnFyLioOxaD9XKGc9BBwl7pyWxPZ6VBk3TWgC0ijs20j9HchOg9Q1Jg4V?=
 =?us-ascii?Q?yIacUSLy/vmQIdUZal/LOSTdmRKvrepWQa1EUEzBkMJ4m2gY7eWJH43xiNtk?=
 =?us-ascii?Q?N3Z80esgDQje9swStp8OjlEH4GOCHKlgJNtaxytoXROhxULBejMhTrmCNsr2?=
 =?us-ascii?Q?WmrQhAiZAVHPlQs5TWNRmFj05ai/KHZud1gOKmFgYRm2rJJkGcJN6udytFbv?=
 =?us-ascii?Q?dwnto5SNOndAbo7Lf+vBCMak2iXEftUgWkkcfYfngddoH6wK8CZK2BAgHvFY?=
 =?us-ascii?Q?nkJebL9OI6Ha0TJcBrFCmBqmUvZ4IVJPyY6gXhsHLaYYAxdhlaz6ITxCBb4b?=
 =?us-ascii?Q?SlROhai0gZaPfAEtlPnq8ROmQPZw6mYFXh5/Mp7oVzVkgX/yBQM3HKA8LED1?=
 =?us-ascii?Q?F+wQ5dXY2yGQn4Aetk/F4VrADrH7ilA5edg3LLd0RsgeoxVVL/6VP1CYiCqf?=
 =?us-ascii?Q?hVIQraabYelDiBusMRdCAI5+9mGeLjQ2F5bQF2L4eXnxjq5NuXeaeKF+hIkz?=
 =?us-ascii?Q?aH1b025vSNYWm4K0SkvICj0mgWaHCmSMNCRumbOaxbjapJoRMmK+OiGKjKcL?=
 =?us-ascii?Q?rpCVA7p3NpVDlVHhbdX7OyXtl8pbegMmv6W1sV0I3VYlQc13Fm4LZ8va5zKc?=
 =?us-ascii?Q?vjq26PUXV+L/6enE++S35Kc27itA0rJXk3NrFJWoiK9NJraQHC/6KIqbQnzL?=
 =?us-ascii?Q?WXHe/b2EpzBFSQhevfPFaUoqiGboWWREuRs75qKjx1g2VuvYuC7HQa7wRF8F?=
 =?us-ascii?Q?OqTdzYKIp5egcdP6+w1u9PWC6DEfTPxZ8YsO2aGdIzce0DHDQUJ0zyK421uu?=
 =?us-ascii?Q?bjs+XGWi2tFHSBiHD+X5Kj628U5GVmGSS1RzUX2qqXSrFC90KJoPp91dYDIL?=
 =?us-ascii?Q?I+k30R/iap5XNyL+pFp3EFeWK9z0s6jcSun0+7Sh/ufYSKCSxn9OGKEmLW8I?=
 =?us-ascii?Q?7Iewq8QxO5dMlS05EOw4hDj7jNVeXOI4pq0ZZXGFaKTLLzHKZjb3mOMARbQz?=
 =?us-ascii?Q?jBE=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6795bc4e-ab49-41d8-59c9-08d8c959dbf7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 22:11:45.1443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HF0idR0tmMDSCC2LdCTzX1Uvao7qvlrDJBzsis4Mg0KD82HLjZr7Puzgw4bmMP5uYdRPUoSOraHdxksTbgARtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2190
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
Cc: Yishai Hadas <yishaih@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, John
 Hubbard <jhubbard@nvidia.com>, Edward Srouji <edwards@nvidia.com>,
 Emil Velikov <emil.l.velikov@gmail.com>, Gal
 Pressman <galpress@amazon.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Doug
 Ledford <dledford@redhat.com>, Ali Alnubani <alialnu@nvidia.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, February 04, 2021 1:12 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>; Edward Srouji <edwards@nvidia.com>; Yishai Hadas <yishaih@nvidia.com>; John Hubbard
> <jhubbard@nvidia.com>; Ali Alnubani <alialnu@nvidia.com>; Gal Pressman <galpress@amazon.com>; Emil Velikov
> <emil.l.velikov@gmail.com>
> Subject: Re: [PATCH rdma-core 3/3] configure: Add check for the presence of DRM headers
> 
> On Thu, Feb 04, 2021 at 10:50:51AM -0800, Jianxin Xiong wrote:
> > Compilation of pyverbs/dmabuf_alloc.c depends on a few DRM headers
> > that are installed by either the kernel-header or the libdrm package.
> > The installation is optional and the location is not unique.
> >
> > The standard locations (such as /usr/include/drm, /usr/include/libdrm)
> > are checked first. If failed, pkg-config is tried to find the include
> > path of custom libdrm installation. The dmabuf allocation routines now
> > return suitable error when the headers are not available. The related
> > tests will recognize this error code and skip.
> >
> > Signed-off-by: Jianxin Xiong <jianxin.xiong@intel.com>
> >  CMakeLists.txt         |  7 +++++++
> >  buildlib/Finddrm.cmake | 19 +++++++++++++++++++
> >  buildlib/config.h.in   |  2 ++
> >  pyverbs/dmabuf_alloc.c | 47
> > ++++++++++++++++++++++++++++++++++++++++++-----
> >  4 files changed, 70 insertions(+), 5 deletions(-)  create mode 100644
> > buildlib/Finddrm.cmake
> >
> > diff --git a/CMakeLists.txt b/CMakeLists.txt index 4113423..feaba3a
> > 100644
> > +++ b/CMakeLists.txt
> > @@ -515,6 +515,13 @@ find_package(Systemd)
> >  include_directories(${SYSTEMD_INCLUDE_DIRS})
> >  RDMA_DoFixup("${SYSTEMD_FOUND}" "systemd/sd-daemon.h")
> >
> > +# drm headers
> > +find_package(drm)
> > +if (DRM_INCLUDE_DIRS)
> > +  include_directories(${DRM_INCLUDE_DIRS})
> > +  set(HAVE_DRM_H 1)
> > +endif()
> > +
> >  #-------------------------
> >  # Apply fixups
> >
> > diff --git a/buildlib/Finddrm.cmake b/buildlib/Finddrm.cmake new file
> > mode 100644 index 0000000..6f8e5f2
> > +++ b/buildlib/Finddrm.cmake
> > @@ -0,0 +1,19 @@
> > +# COPYRIGHT (c) 2021 Intel Corporation.
> > +# Licensed under BSD (MIT variant) or GPLv2. See COPYING.
> > +
> > +# Check standard locations first
> > +find_path(DRM_INCLUDE_DIRS "drm.h" PATH_SUFFIXES "drm" "libdrm")
> > +
> > +# Check custom libdrm installation, if any if (NOT DRM_INCLUDE_DIRS)
> > +  execute_process(COMMAND pkg-config --cflags-only-I libdrm
> > +    OUTPUT_VARIABLE _LIBDRM
> > +    RESULT_VARIABLE _LIBDRM_RESULT
> > +    ERROR_QUIET)
> > +
> > +  if (NOT _LIBDRM_RESULT)
> > +    string(REGEX REPLACE "^-I" "" DRM_INCLUDE_DIRS "${_LIBDRM}")
> > +  endif()
> > +  unset(_LIBDRM)
> > +  unset(_LIBDRM_RESULT)
> > +endif()
> 
> I think this should be using pkg_check_modules() ??
> 
> Look at the NL stuff:
> 
>   pkg_check_modules(NL libnl-3.0 libnl-route-3.0 REQUIRED)
>   include_directories(${NL_INCLUDE_DIRS})
>   link_directories(${NL_LIBRARY_DIRS})
>

Yes, this is much simpler than the pkg-config method. 
 
> > +#if HAVE_DRM_H
> > +
> 
> Would rather you use cmake to conditionally compile a dmabuf_alloc.c or a dmabuf_alloc_stub.c than ifdef the entire file

Sure, will try that.

> 
> Jaason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
