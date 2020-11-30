Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B082C8BC3
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 18:53:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A3D6E5D5;
	Mon, 30 Nov 2020 17:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBB46E7D7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 17:53:42 +0000 (UTC)
IronPort-SDR: HqzzAFmNFaW3F/JstHnZ7uuJLx4Tu6i4kjFM31buCpn84Oj4aWSp936SMp7Ni0iKP6BGZZ6BCm
 Q1v9rsOHzCig==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="151930661"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="151930661"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 09:53:42 -0800
IronPort-SDR: oA8hpsyjs5AXcTDatptegP4p99pYe3lQ/Dv9YxyW/1ipctlpn1Qvtnuz7LGdgaKg5JS3aMtAdU
 llmjHkPjZPHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="364337961"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 30 Nov 2020 09:53:42 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 09:53:41 -0800
Received: from orsmsx608.amr.corp.intel.com (10.22.229.21) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 09:53:41 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx608.amr.corp.intel.com (10.22.229.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 30 Nov 2020 09:53:41 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 30 Nov 2020 09:53:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gxKPcPyKzFcu5qBcVibsHmHVi2II/uQBhwfmdjskOA8gP27mOoIf3fjSwOSMbftJdHZ3qx/hftUq+jwGBiWJRzNU8H5/rb/h8kj12PZPkKDSRVCEmc5+q7+gIzD2VazRtVW9AsFXkOKOeqbpkA+pBGOuYhmGEPKVXHICjycljYElThNFr7lYIaxOnB5zHe8SHqBhNTImkjg3bWj69B2hzbr2n3VDpYxC3zI4Z9Q43eyvhGjfj75SrziLiX2svAJ1Da7FIniGaLVRSJF4zIu43ecLm43OZJkXig4eS71S9pThx8m6wiJIdIk7Ts+GDm6s4hWK8blrmgk3wNLTOAKbug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfHIusmWmWZYZ/tDnqY1XRTs3KL0re0YSiLh8shX57M=;
 b=NN61VK3DhumPLFKEOa9gRd311FBlR2l7aVzaICBQ1ZRID1O4Ja2MltMtfi4DjaDvJmoJDeA4WYTGRydth571VAovqejb2Ofqdpn9CwqAGyyzq7M7om7BWS6jTohvL+LghMuaO/Q413nSy4ZZfJBKEstyz3VLkm3E/L/4qpzQDt70YcwEthMdvdA7CAGdAv1sCgbnZc0pkAZwwJW54P+R/WNadtC3g2O4WsRxI6Jc/HQFtHQMM0CIoWQuRMy8KlR7G1mBsLtk8eid2N0OYeve6PJum5Zu0xO2Hh8sSti/UogZs4j1QuoWgDPmBzuZWFp14qozEk3/FlNWjgcoAdT4WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BfHIusmWmWZYZ/tDnqY1XRTs3KL0re0YSiLh8shX57M=;
 b=Egdj9VHeDe98rTR5d543uYY4HAPKzlXU+6ErVQzQegNRZfWta72Ss4TfinIXEl3/2h7c0wMIP+ThPNo/tOyszZVSWF8DLgqf6vKSDhGwvkIMag3TcUTUZx9LHTAI4rxeufn27LSoBMCRXok21IaPm7AekN8EbB/zFmjQi5TkBHo=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22; Mon, 30 Nov
 2020 17:53:39 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%9]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 17:53:39 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Thread-Topic: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Thread-Index: AQHWxP3mzzChdz0pgEiMI6YqGjGmSKng3A+AgAAA12A=
Date: Mon, 30 Nov 2020 17:53:39 +0000
Message-ID: <MW3PR11MB45556C1BAD4AF795DF0F783EE5F50@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
 <1606510543-45567-5-git-send-email-jianxin.xiong@intel.com>
 <20201130160821.GB5487@ziepe.ca>
In-Reply-To: <20201130160821.GB5487@ziepe.ca>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ziepe.ca; dkim=none (message not signed)
 header.d=none;ziepe.ca; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ac7d28fd-d302-4e6b-b731-08d89558de46
x-ms-traffictypediagnostic: CO1PR11MB5073:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB5073209217571316EA6D5E83E5F50@CO1PR11MB5073.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Txfgkb7RwMc+yqIW21hM8V6olggp/G5DRR/p6fnMJVrxHGRLRKg4ZYZEE6ib5gFipPTMqrlVWwgk2p7dGbUaEwkn4nCgETiLJvWi7KYXSBXJ0+AM1S8FI9birlbjjjb2fp3bstY3/8301WjCccE9xz2ZDHoAyYvhM4ofzniofeAH0r1ImAW2P9nXHCnJSLtT0m6smyRQp3DKd4Jk+SAzu2PJQNiHOSQ4PScln1ULAujnZzp9sfbew38GT3bupq0/Cuo4rVb4OV70FcMGzHJvNnGj7RV0Tf+HHWPl7U1MDLR9xuuWrHfAZ8/ndOaXOVQaBojqJVwv3QF8vlKY+Hxgng==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(366004)(136003)(346002)(376002)(8936002)(6506007)(7696005)(8676002)(186003)(33656002)(26005)(83380400001)(2906002)(53546011)(478600001)(316002)(64756008)(66556008)(55016002)(66946007)(9686003)(76116006)(107886003)(71200400001)(86362001)(66446008)(66476007)(4326008)(52536014)(6916009)(54906003)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Cs17p2ftTpbAgAZzQZbPpZm8GhW0DA90lyrb8b0NXBabEu1oL3TdDzZ7NoxU?=
 =?us-ascii?Q?H7rgzThb0SHNfHdnSGhctTxnW0uERIsyguY+ufCV5XfLGX6t1RVxXCuJjG6M?=
 =?us-ascii?Q?ST3oPUzInaoTRHDeqCuLcKissdmdIDF5i+Yb2vXZ9f/b/iuvWhvg0RC2K3i9?=
 =?us-ascii?Q?oiAD7Y1SNK7QkSsnTLByla6qW9A1ICxtAhOUtebTZ16Dcq0595/eAp4e/sbd?=
 =?us-ascii?Q?gJRKTHVMsZyhK0SnWQXFRSD+V3jBIWh3j8EDPDOCPwArQJcoUa/lWvJhwgOA?=
 =?us-ascii?Q?tTRfKRSqZ0VkVyRmGmGmc6YV63LvqqLC2wj8z5nv2QM95bKCC42BsW1EIr6J?=
 =?us-ascii?Q?R9O28pWIcmOwGJ6jaBYiDUYD0swSXF9f1/3Pog+3PRmsHiIjSEZxG0M0HTKi?=
 =?us-ascii?Q?sLu+SBrbM4QwZRMPk0++rqNcPoi1hYwtD9aU+ylO7MLN5GUUf9WH08fLzSEg?=
 =?us-ascii?Q?QwsrPuj9yf7PhTRlgxnbILEevKFTMswqgNbjUO5NRTKTEAS+zCr+gH5xCcWg?=
 =?us-ascii?Q?AJugpV829p2EwOs5CtZg5meG/SpT89b+k28csV4QOLXjXJxv6Zvim4PxRn3d?=
 =?us-ascii?Q?YW7U0FKL87U+MXV+Z3H/BTakitjXCJ+TaTz52MUoh1NSuRMWDX5F6cBKs/hI?=
 =?us-ascii?Q?cDzlcKZB2QND0uwyhuJCc+NvuDhGgZhdXBd5Mf4/cM74k2N9t/JneFzA5gxz?=
 =?us-ascii?Q?+mWzO1JH9VM7AWlOdmLDKFWx35Dv9L7CCujTmOS2Hyrn2FAKRGMzh0yrqZjQ?=
 =?us-ascii?Q?SHp4RNskE9kB4D+MH14aWO1okPtKbyT0U5HbVwVJLh6t6xVdkE0wfoCWQqW7?=
 =?us-ascii?Q?C/O0JPS7XRPUaNZs1ifyFoUxgSn9rKPIGU0MKueLx3t69xQcQmGUsXIOOf2L?=
 =?us-ascii?Q?wMfjXFNmLXxjxUYL79fNfB+Ea5zr9AXbAppfJcwxJhmOMpYXX1fq9hM6ci50?=
 =?us-ascii?Q?YDmy0OralBTJEjsLUm21ifCvtRryG3QyLlRLgHD2fo8=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac7d28fd-d302-4e6b-b731-08d89558de46
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 17:53:39.1154 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K4pChbahga/Wn0bCEMtZxzImIUx3YtSWI6oWW44stkVyOqvL8hKF28vRW4H8FjxLXn07idQikhYNRqP62v9ADw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5073
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
Cc: Leon Romanovsky <leon@kernel.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Doug
 Ledford <dledford@redhat.com>, "Vetter, Daniel" <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Jason Gunthorpe <jgg@ziepe.ca>
> Sent: Monday, November 30, 2020 8:08 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
> 
> On Fri, Nov 27, 2020 at 12:55:41PM -0800, Jianxin Xiong wrote:
> >
> > +function(rdma_multifile_module PY_MODULE MODULE_NAME LINKER_FLAGS)
> 
> I think just replace rdma_cython_module with this? No good reason I can see to have two APIs?

rdma_cython_module can handle many modules, but this one is for a single module.
If you agree, I can merge the two by slightly tweaking the logic: each module starts 
with a .pyx file, followed by 0 or more .c and .h files.

> 
> > +  set(ALL_CFILES "")
> > +  foreach(SRC_FILE ${ARGN})
> > +    get_filename_component(FILENAME ${SRC_FILE} NAME_WE)
> > +    get_filename_component(DIR ${SRC_FILE} DIRECTORY)
> > +    get_filename_component(EXT ${SRC_FILE} EXT)
> > +    if (DIR)
> > +      set(SRC_PATH "${CMAKE_CURRENT_SOURCE_DIR}/${DIR}")
> > +    else()
> > +      set(SRC_PATH "${CMAKE_CURRENT_SOURCE_DIR}")
> > +    endif()
> > +    if (${EXT} STREQUAL ".pyx")
> > +      set(PYX "${SRC_PATH}/${FILENAME}.pyx")
> > +      set(CFILE "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}.c")
> > +      include_directories(${PYTHON_INCLUDE_DIRS})
> > +      add_custom_command(
> > +        OUTPUT "${CFILE}"
> > +        MAIN_DEPENDENCY "${PYX}"
> > +        COMMAND ${CYTHON_EXECUTABLE} "${PYX}" -o "${CFILE}"
> > +        "-I${PYTHON_INCLUDE_DIRS}"
> > +        COMMENT "Cythonizing ${PYX}"
> > +      )
> > +      set(ALL_CFILES "${ALL_CFILES};${CFILE}")
> > +    elseif(${EXT} STREQUAL ".c")
> > +      set(CFILE_ORIG "${SRC_PATH}/${FILENAME}.c")
> > +      set(CFILE "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}.c")
> > +      if (NOT ${CFILE_ORIG} STREQUAL ${CFILE})
> > +        rdma_create_symlink("${CFILE_ORIG}" "${CFILE}")
> > +      endif()
> 
> Why does this need the create_symlink? The compiler should work OK from the source file?

You are right, the link for .c is not necessary, but the link for .h is needed.

> 
> > +      set(ALL_CFILES "${ALL_CFILES};${CFILE}")
> > +    elseif(${EXT} STREQUAL ".h")
> > +      set(HFILE_ORIG "${SRC_PATH}/${FILENAME}.h")
> > +      set(HFILE "${CMAKE_CURRENT_BINARY_DIR}/${FILENAME}.h")
> > +      if (NOT ${HFILE_ORIG} STREQUAL ${HFILE})
> > +        rdma_create_symlink("${HFILE_ORIG}" "${HFILE}")
> 
> Here too? You probably don't need to specify h files at all, at worst they should only be used with publish_internal_headers

Without the .h link, the compiler fail to find the header file (both dmabuf_alloc.c and the generated "dmabuf.c" contain #include "dmabuf_alloc.h").

> 
> > +      endif()
> > +    else()
> > +      continue()
> > +    endif()
> > +  endforeach()
> > +  string(REGEX REPLACE "\\.so$" "" SONAME
> > + "${MODULE_NAME}${CMAKE_PYTHON_SO_SUFFIX}")
> > +  add_library(${SONAME} SHARED ${ALL_CFILES})
> > + set_target_properties(${SONAME} PROPERTIES
> > +    COMPILE_FLAGS "${CMAKE_C_FLAGS} -fPIC -fno-strict-aliasing -Wno-unused-function -Wno-redundant-decls -Wno-shadow -Wno-
> cast-function-type -Wno-implicit-fallthrough -Wno-unknown-warning -Wno-unknown-warning-option -Wno-deprecated-declarations
> ${NO_VAR_TRACKING_FLAGS}"
> 
> Ugh, you copy and pasted this, but it shouldn't have existed in the first place. Compiler arguments like this should not be specified manually.
> I should fix it..
> 
> Also you should cc edward on all this pyverbs stuff, he knows it all very well

Will add Edward next time. He commented a lot on the PR at github. The current github PR
is in sync with this version.

> 
> It all looks reasonable to me
> 
> Jason

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
