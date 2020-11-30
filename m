Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF142C8C5E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 19:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CE5E899E6;
	Mon, 30 Nov 2020 18:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94EE2899E6
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 18:14:45 +0000 (UTC)
IronPort-SDR: H28AEGC5eWOSUwv3Vn8IS2E0S4JYNm2HNJhWH2aTS+LsSWT/CZl14cxz4Sf+2NAcOKtDbyOLq5
 J7XDJGV4FTiw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="172785324"
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="172785324"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 10:14:31 -0800
IronPort-SDR: WblWKgPf350RbllITzTRShcV+aS2qLcmG0yP5DaKHpUVH8qNWdmkDCrtDx3d1DPOXW0ba3f2iR
 pe8mJ3CygOXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,382,1599548400"; d="scan'208";a="537093756"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 30 Nov 2020 10:14:30 -0800
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Mon, 30 Nov 2020 10:14:29 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Mon, 30 Nov 2020 10:14:29 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Mon, 30 Nov 2020 10:14:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6mN0dekbGRTj3Ll+HopaaZ1S+rnYT0ujeOios8ZJOtLfajRk3so3CBydLnM5Dahoqt8n/n6wtjE8jhs254jl6XTMif6ItLHLY5UUsYkBMMWYNdWxBgemNINjBZyujsj05sTnu2LKqOgS+hWPnBDZsfPs+aGoi7r4UWiW3M5AJJuVZaSnGNDTr3ihxp1UeZ+s1VRp8VEkWMCs0n6ZxFAvJj+9xS3oI4Jo+X/VYKzWyHESQh5Ztp7yvtES3kbSYNTFsbuzDrO2J3oIwy6j77ldYxOKDERRkRQmprS31SEZaEHTT9gAA+dRXxqs6II2iruSREQzN5h4l+zLihRUDOiJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4gL6g1aWTqOZZcNnuzGR8g50aYcVMcTKx7szoie8UI=;
 b=MPIcAMBqffGKbQ9oVFW9WnEM3sIxGIbZ8NeYuNMGKeIs4Z2Sn0wlG8VCkzN6UlhjWffs5JIT3twFqT4nsqEOaGxj1yMNueJhH/GoqOCgezWjOzQ80Gd8L47qKOq1s8+ekHPETA5lUem3XWQMI2fp7kAZnRNRH7T1UItUTAL97oHANQvmqNNBT3hwMP9PVaS9ZNeA6BShtbdK9spOse4VNBdRvthWlkBJpVoQ5MDJXJ9p+A72jMSU0mXB39ttczmRyZdNSCJMjAFjqRzRK6eRSSIFJqHBwstwldEjkEhlVBbSgKQIF8q6cgYNGJNBWhaU/Ff/cKWaYIFTzX4lzGkDCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4gL6g1aWTqOZZcNnuzGR8g50aYcVMcTKx7szoie8UI=;
 b=v1is/lx8ZC2mV2hItGD+o0SpW9XYSlgUarav/zNsj6GcTiB1jNy8Gc05tlHyHy2V91rZ4TUF17+W3S82jz5VABG7f8k09Cekqmu626PTGhLB+9G0w1WWHHXTQHWb8r9Tobhutz+nqDv8WQc/PGHdRL5h3gtOICgv0D7OeiuT4bw=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by CO1PR11MB4947.namprd11.prod.outlook.com (2603:10b6:303:99::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Mon, 30 Nov
 2020 18:13:31 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::7510:71a5:3cfe:ab94%9]) with mapi id 15.20.3611.025; Mon, 30 Nov 2020
 18:13:31 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: RE: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Thread-Topic: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
Thread-Index: AQHWxP3mzzChdz0pgEiMI6YqGjGmSKngyFGAgAA0b+A=
Date: Mon, 30 Nov 2020 18:13:31 +0000
Message-ID: <MW3PR11MB45552B10703B7DC0858F10D6E5F50@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1606510543-45567-1-git-send-email-jianxin.xiong@intel.com>
 <1606510543-45567-5-git-send-email-jianxin.xiong@intel.com>
 <20201130145741.GP401619@phenom.ffwll.local>
In-Reply-To: <20201130145741.GP401619@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 49a465eb-b4ba-4e58-b586-08d8955ba53a
x-ms-traffictypediagnostic: CO1PR11MB4947:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB49474BCF8461F091998610A5E5F50@CO1PR11MB4947.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:751;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xdOcXHqATY/EriwaEEsPpEPlt1Vonayg/qbpZJObh1aUm8+jljvEPHONIINMSRvaRsTO+zIxzubMIlywM/FrBO+oew/xJuOx9XMbjG93DsJMtGV5AMTEx6Hy0WLnFpSHAhb557o01ibWbhB3HU+BsY6eEQDqVRUX2RfyCu/jCDcZlQiQAPGY7tNjicz2RTvhF0CTb/692dha1c7tlcEUm70NmaDwGcAfhTQpgali/h/UwCrpEscfEjxx//S+yKs2y6L+4xi2uNQvMwgP5Pc3OSJgSbDB1poMjmAexK46pL6ce8+ja/t3vzWsY+vltuOecJin6munJ+NysMXLlPDQSg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(39860400002)(366004)(346002)(33656002)(86362001)(6916009)(2906002)(52536014)(8936002)(5660300002)(478600001)(8676002)(4326008)(71200400001)(83380400001)(66476007)(55016002)(66556008)(316002)(7696005)(54906003)(76116006)(6506007)(66446008)(64756008)(26005)(9686003)(186003)(53546011)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: Crufg3ZbpGenlUHWTz7l1FNK78g85w9TYUFCW+Db4QXAdg7tGIJjh46S9UhJLa2ImgSkLFTXgyaBkuRscvSVhARnxB3Vb3wF4yx+w5xTmK2TBb8/GDZfdRkQ6uorZ9PjpW9yJFnmjoWLo9eobTxvku2zVf1sWZk931TWSsKQiPPHaxUXoia9xohz4VVPyGSZVIjvWGX0GHHfhS/9XICNklK2pJbEfqZvoetKjl8LT9/TknGyZza1+06mj3ZUlTWvv3b/4TplJZQ9T9ZtQlGRw/GFahnjwvL0ZsLRJ6/Ph6wORa/9XBk81Rdy442uLawB/pGynEbtmvULzp4QuBN/6Ud4szL97ocp8K4t3PoUY+b6Eeb6PohEHKH9Pu2mH44+Q9moBjSXCSBDxPpzOLX93ZthNcTH0Uq0OsEZpKBxy2wqgeVLV68XijVa2B1TDk3Km7qGn/Tc4VA8TyLyYR905lKChYkdzFJPfRnB0+X0aroLK536hjyH9X2BeAeiQPDDyHxCysiiDDTXu/C2LdT2jZ+8KnJPgEMpLWs0BOEbFBnkHla6MUykbk8Xfw0JmMO9k9w9wmAi3PwAM1RIu5jyVGtLEwXCnlJ7T5ZBJXkSo8tGef4bfKhQo3Jt3LB2XRPBdKWOE8oGu68qTeuChXjuUHRKu2/U/Cq+rIgS+AtbNBlCElypf3TtEGNnRpydry3stiN9eMHTX7cVa26+t1uYAfDrf48APDUtrlQuHVdQgUg=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49a465eb-b4ba-4e58-b586-08d8955ba53a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Nov 2020 18:13:31.8948 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 65LUA/hMBEhj50UyssVjeTLTVp58EupnzgNfByhMC+3UDzEfiSseiij3IGvQjGJt8umKAmIzzuBbuvv+tWR2eA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4947
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Doug Ledford <dledford@redhat.com>, "Vetter,
 Daniel" <daniel.vetter@intel.com>, Christian
 Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: Monday, November 30, 2020 6:58 AM
> To: Xiong, Jianxin <jianxin.xiong@intel.com>
> Cc: linux-rdma@vger.kernel.org; dri-devel@lists.freedesktop.org; Leon Romanovsky <leon@kernel.org>; Jason Gunthorpe <jgg@ziepe.ca>;
> Doug Ledford <dledford@redhat.com>; Vetter, Daniel <daniel.vetter@intel.com>; Christian Koenig <christian.koenig@amd.com>
> Subject: Re: [PATCH rdma-core v3 4/6] pyverbs: Add dma-buf based MR support
> 
> > +cdef class DmaBuf:
> > +    def __init__(self, size, unit=0):
> > +        """
> > +        Allocate DmaBuf object from a GPU device. This is done through the
> > +        DRI device interface. Usually this requires the effective user id
> > +        being a member of the 'render' group.
> > +        :param size: The size (in number of bytes) of the buffer.
> > +        :param unit: The unit number of the GPU to allocate the buffer from.
> > +        :return: The newly created DmaBuf object on success.
> > +        """
> > +        self.dmabuf_mrs = weakref.WeakSet()
> > +        self.dmabuf = dmabuf_alloc(size, unit)
> > +        if self.dmabuf == NULL:
> > +            raise PyverbsRDMAErrno(f'Failed to allocate dmabuf of size {size} on unit {unit}')
> > +        self.dri_fd = dmabuf_get_dri_fd(<dmabuf *>self.dmabuf)
> 
> dri_fd seems unused by the tests

It's used by the read/write methods of the DmaBufMR class for performing mmap.


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
