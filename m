Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C52462CB220
	for <lists+dri-devel@lfdr.de>; Wed,  2 Dec 2020 02:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F93D6E99F;
	Wed,  2 Dec 2020 01:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0666C6E99F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 01:12:52 +0000 (UTC)
IronPort-SDR: fqDD/S4kWpwKz+lWK/NZre9RsX2w9UXTPzfxc36Dw1fXXDixrBx9oL4OYu92xm6j6aL3HoS8L2
 GZCfwkPr7v2w==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="170369441"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="170369441"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2020 17:12:48 -0800
IronPort-SDR: NdnE5iDkKQmUvTgDzXd52242P7wAxuQWGqbr2q/CkV3g4+9q3KvSOgcVuBgVdNFDMf9UEszhoh
 e/NQph1xKpSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; d="scan'208";a="372990328"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP; 01 Dec 2020 17:12:46 -0800
Received: from fmsmsx605.amr.corp.intel.com (10.18.126.85) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 1 Dec 2020 17:12:45 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx605.amr.corp.intel.com (10.18.126.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 1 Dec 2020 17:12:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 1 Dec 2020 17:12:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDK0tH1IaoQY/3F1W15M5vsGxg+lK1kiIxSFNgbcECtU8qHiN/ej99FGBtWbu2CyNXHkIUVmRueVH3XpEGzqrh69CKuvOYmHobbvFLW/TAQcedKG/6LtALXw8eHlMrJOBYyBexP8VZyjelrcLQ9PBl/oGuQnU8nKOiJv1QsBZcyTjB2ddFhdAfrDt1Qcwj8gnf86Z95mLmuVNGG6TD7AITWOTZb7cQYpomgTK4sC/uiR7XkhidU2pcCvKmpHH4qSQi5aBdcYZNAxJsEtPaO2XfuUAq0o1EYmOgA9ZKh/xcTKHViUN05Jk1U6bjqz4CXkSb+aDB8zU+hfkqpF5/DPNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASbMbTLESEbUKSLiRuSVhZalpIk8cE9DJ2TKSykGWvQ=;
 b=OW2zpH153JcGrYsTlpiSOc53FB12G0cHZR4MM4pVeSn2JugMZaZCQqMbaSapsJ5UebtC6FY+/R7r5AuW1LFKDp4qngdov0ekmHyHSD5pe9LlouBzJFntZan1OVPnQpI4EgipKjf3OXFFN3D/ll1QpDjKHKXc8VOD3fL+wdNG9nO3nMLi+RckhCXhGwVsu4oZll3nawVC8L7mBLrEWzb6mOW+36MW0Al2WcXl4gpS64reqYLrS3gPwxDLbP6t01E8coWNIWzzwYS514JqvPpOmHAmif7pc6Go+uoayNO8UuDL7CnUN9SMHd/sUJrMN4JlP2l/HSVNtTe86B/vD8H2nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ASbMbTLESEbUKSLiRuSVhZalpIk8cE9DJ2TKSykGWvQ=;
 b=e2VjM3ZWHy/rz/EiytImH11gYEkazPXmI2k79MKaO6R5cB6jEYueoL3FJQ8I5qe7wncpKbIE07ruiTbHCYudRdwaQPzM5Kt2fiCQH3/SXNoFdN7JSkqjIWicnvWKgevEDuqGHuVGzq499IAkaYwfHiIA9ui0pmnY5DhJuaMJfaw=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MW3PR11MB4554.namprd11.prod.outlook.com (2603:10b6:303:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Wed, 2 Dec
 2020 01:12:31 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%9]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 01:12:31 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: RE: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Thread-Topic: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Thread-Index: AQHWxP3mzzChdz0pgEiMI6YqGjGmSKng3A+AgAAA12CAAiBGgIAAAInQ
Date: Wed, 2 Dec 2020 01:12:31 +0000
Message-ID: <MW3PR11MB4555DAFD7546E762F47F5851E5F30@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
 <1606510543-45567-5-git-send-email-jianxin.xiong@intel.com>
 <20201130160821.GB5487@ziepe.ca>
 <MW3PR11MB45556C1BAD4AF795DF0F783EE5F50@MW3PR11MB4555.namprd11.prod.outlook.com>
 <20201202003923.GI5487@ziepe.ca>
In-Reply-To: <20201202003923.GI5487@ziepe.ca>
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
x-ms-office365-filtering-correlation-id: 704f6dde-6224-43cf-3b17-08d8965f5826
x-ms-traffictypediagnostic: MW3PR11MB4554:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB4554DE9D390C7109843EE5AAE5F30@MW3PR11MB4554.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RnDD3rqegGozNXc45BdMElU9fJIHzBANAZ8duFvChHVZh85DP1uep0Wv8OXBIoAtwEC7CtfWXausEM63SXiGg1px6lOJN1d3V3icXQEDnX1sZweWOjAy8NXtR3Y14JWGAHhUfqUMEdAmkYvKj0P6MDxxY+AFd+1WQPW3Ft16bxHX9YkSCusUVF/r/it6q54SPJ8zT6f0c2mwMk0ei3PZxkRxbn34fPZNHB3IlQCpbn4GmrnbADFcRLLoiyIFoMGF/MDBT0LG08vW0nVbB+SWnPn0Pvq57Cm7urxY0WDfsk9EBD1oM9wlVmVbdVISyTAQVE+LGQnTtR1sNxrp7cv9OQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39860400002)(346002)(376002)(366004)(8936002)(53546011)(26005)(8676002)(186003)(6506007)(107886003)(83380400001)(478600001)(316002)(54906003)(86362001)(7696005)(55016002)(76116006)(5660300002)(33656002)(66946007)(9686003)(71200400001)(66556008)(66476007)(4326008)(6916009)(2906002)(64756008)(52536014)(66446008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?ZF0xLRTCgeiF4mtChn35yMzitfrRf4lKbYg0EzKMwxe1GI2JH0XdKhTZ9tiQ?=
 =?us-ascii?Q?M2cVl+55NJdF/GLN4wr3nCZAu1L74ybsqf4i20zh/EMojh2DGzyaqh4B+B3x?=
 =?us-ascii?Q?HAUMEYZQDYkcdTJvmRsHgbnC/2Kg7jfG0es2GmCW0jmmQ809DMKvbcB73x87?=
 =?us-ascii?Q?k2ED3NGfrMchKeOQcQvRZ/ldXs3+Ze5tKLq5pc4vEz0bYe+9Zqt4OHhs0+fp?=
 =?us-ascii?Q?Kk+DDQCGcyIE8jmZpinTmsydZ9445N5olBcEdoLDLTyX2Jx7Mfo5gQEhdPQP?=
 =?us-ascii?Q?n23FEAvmpXdMXkw8OlQgRwowTH/s6XRw5GWAW5dYYVUGQKQWN31caM0hZEnj?=
 =?us-ascii?Q?cR+i3hXVHIlvC5JasIkblPktwz+WzDBnsduYPncnj1+ZSXGxXauJdNkI8LtV?=
 =?us-ascii?Q?rfgADzjFO2wWkEepCpgu7dJCK3Uz18Fu1WkCtsVEjiQLwmvNY+qaw6Am44Uz?=
 =?us-ascii?Q?EDruRU1RaVAwOGxzmbvPoLuLE2nCY/NoMLt0wl/rYZ77mo+IhrWV9J3HBEpf?=
 =?us-ascii?Q?pm9hK+j+SPDyUzQPCzKUxLSEEnLVrBsmSwZYsWbVOw1HpqRlPbYLpxZ7lNxm?=
 =?us-ascii?Q?pQdcFjdmNVIDKPATnmMe9FtsoypA3rEyxrrNg6WGgdWSoa8cdMbMF26ZJH12?=
 =?us-ascii?Q?JL/9Q+9RCaz9NtOvWZgXR8jX0krTPmgfirwz/8FU1wzqXlxOu1vv2bCDQX3V?=
 =?us-ascii?Q?SW+5I5pjTZsZAV2lpUIn3KklsAHQRwDaFC3u11wWgZZPywlcCWzgzHk2uNDx?=
 =?us-ascii?Q?0ODiSITas21xOKUmzu15hiOwwcW92LBZLJJA3q3TIr2MRRLnama/fmlYmnsv?=
 =?us-ascii?Q?E6FVUfcBwdrygpYDXyIPdwKk+OZ4r1zRavPrOEqCWk4e3ardrDXpqnrlPAhe?=
 =?us-ascii?Q?yC+I4ObCb/plX3X4u39MtSz+/+7mqtYeQrqGjE/jM0z8mrfJPrDIWqhRkzm/?=
 =?us-ascii?Q?Vr2qYZ6Zrt35L/OL0Te3WpJvc1TOJZWsfhE6WECsKho=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 704f6dde-6224-43cf-3b17-08d8965f5826
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2020 01:12:31.7317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2XxHl5LAH6Ep79CGCsWetdn0++40w/jf4ezQXAYT9pYZ8lGonsbY/ThUS+bFEgbV2l2iVXA0lhiw2UoLLUL6Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4554
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
> Sent: Tuesday, December 01, 2020 4:39 PM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian Koenig <christian.koenig@amd.com>; Vetter, Daniel
> <daniel.vetter@intel.com>
> Subject: Re: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
> 
> On Mon, Nov 30, 2020 at 05:53:39PM +0000, Xiong, Jianxin wrote:
> > > From: Jason Gunthorpe <jgg@ziepe.ca>
> > > Sent: Monday, November 30, 2020 8:08 AM
> > > To: Xiong, Jianxin <jianxin.xiong@intel.com>
> > > Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org;
> > > Doug Ledford <dledford@redhat.com>; Leon Romanovsky
> > > <leon@kernel.org>; Sumit Semwal <sumit.semwal@linaro.org>; Christian
> > > Koenig <christian.koenig@amd.com>; Vetter, Daniel
> > > <daniel.vetter@intel.com>
> > > Subject: Re: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR
> > > support
> > >
> > > On Fri, Nov 27, 2020 at 12:55:41PM -0800, Jianxin Xiong wrote:
> > > >
> > > > +function(rdma_multifile_module PY_MODULE MODULE_NAME
> > > > +LINKER_FLAGS)
> > >
> > > I think just replace rdma_cython_module with this? No good reason I can see to have two APIs?
> >
> > rdma_cython_module can handle many modules, but this one is for a single module.
> > If you agree, I can merge the two by slightly tweaking the logic: each
> > module starts with a .pyx file, followed by 0 or more .c and .h files.
> 
> Then have rdma_cython_module call some rdam_single_cython_module() multiple times that has this code below?

Mostly like that. Here is an outline:

function(build_one_module PY_MODULE MODULE_NAME ALL_CFILES)
    string(REGEX_REPLACE "\\.so$" "" SONAME ${MODULE_NAME}${CMAKE_PYTHON_SO_SUFFIX}")
    add_library(......)
    set_target_properties(......)
    target_link_libraries(......)
    install(......)
endfunction()

function(rdma_cython_module .......)
    foreach(SRC_FILE ${ARGN})
        ...... # commands to parse file name
        If (${EXT} STREQAL ".pyx")
            If (ALL_CFILES AND MODULE_NAME)
                build_one_module(${PY_MODUE} ${MODULE_NAME} ${ALL_CFILES})
                set(ALL_CFILES "")
                set(MODULE_NAME "")
            endif()
            ...... # commands to convert .pyx to .c
            set(ALL_CFILES "${ALL_CFILES};${CFILE}")
        elseif (${EXT} STREQAL ".c")
            ......
            set(ALL_CFILES "${ALL_CFILES};${CFILE}")
        else()
            continue()
        endif()
    endforeach()
    If (ALL_CFILES AND MODULE_NAME)
        build_one_module(${PY_MODULE} ${MODULE_NAME} ${ALL_CFILES})
     endif()
endfunction()

> 
> > > Here too? You probably don't need to specify h files at all, at
> > > worst they should only be used with publish_internal_headers
> >
> > Without the .h link, the compiler fail to find the header file (both
> > dmabuf_alloc.c and the generated "dmabuf.c" contain #include
> > "dmabuf_alloc.h").
> 
> Header files are made 'cross module' using the "publish_internal_headers" command
> 
> But we could also hack in a -I directive to fix up the "" include for the cython outupt..
> 
> But it should not be handled here in the cython module command

Sure. That can be fixed.

> 
> Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
