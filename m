Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 231663D8F3D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 15:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE6F6EA9C;
	Wed, 28 Jul 2021 13:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1EA6EA82;
 Wed, 28 Jul 2021 13:39:03 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10058"; a="234545828"
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="234545828"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2021 06:39:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,276,1620716400"; d="scan'208";a="499225634"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 28 Jul 2021 06:39:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Wed, 28 Jul 2021 06:39:00 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10 via Frontend Transport; Wed, 28 Jul 2021 06:39:00 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.10; Wed, 28 Jul 2021 06:39:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YsNforoJTD8R6migdLtDnYY3kS+pcQg5lKnHZz85zxAjZWyMczQrBpTT0gjSDTCpbddIwdns/RjDy2lEfDDJVBQ3RRnVdLPWfYhgCC6LX7ejuafRB3f2uliofxavWmDD/dvUXHOHUHpazmGTaKDfEI/SD9oET+kmbcimcEu07PZHXD2gj6/qj4yuiSguKEkVlD6bmvIB0V8J9kvOVnAW9Fz9/raUxRiNImokocWf4U1F/wehu8SmmqyqlQ6b0ToMExjYBnmBf3cWzbhszEWF0r18a3dy8XvXvoWlnUvifS4yxWlBRFBuTS1RG4/GTV7foZ7CmQRcvxI/aDE2KXOFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GfrOlCvpWwRpFMROyQYwdWHTcvkwgDHX5ndUmW02Ko=;
 b=ErPAmHEXO6QnrHogzXEfNodDvd7kaYmEsHcMBqA5S9sNOBV3e1dwAusV1HhO2cKW8r5HxcRL8dARhzkDNoBNhUlPkt6vVvprpd2HQ6cY4WuzpAZkXi1oxfrK7VVPn/+vAcydJfR7XKiEVxieGmGD/Bm+7HaKzQxFqO+NvHdaf7d/iN64dIY5dAoEY0Z8rS6jAFLOzAn9FVwOmiKTJ42Epelj7OuyhOi4Cn/i4e/Di4w9gfjU/kKzbLwzf6xkmrBCyvwZ2/OkDnb0PuFP7wGNOGoWFZtzj7XgGXMKi0aFUGakHvNy5IqYaa3eI7Vpez1XFlN6raSPX3la3TLJDmoO1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GfrOlCvpWwRpFMROyQYwdWHTcvkwgDHX5ndUmW02Ko=;
 b=GY4NR6A7pzEXiox4UUbfoQhEqBPFvZ+gl3wpA6IefoNAEm3ZM+hFqhYD8OENY80KF1fnNDc5B1qosfdupoDoAG+kQFsfCUHi7VM1HLx664+stvn3vBs95Tlrvru92twct1P9U+sRIuoDzOUROP3954WwhDfod+jNQnUMhE4HFFY=
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM5PR1101MB2123.namprd11.prod.outlook.com (2603:10b6:4:53::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.29; Wed, 28 Jul 2021 13:38:59 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4bb:d75e:3801:1b2d]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::d4bb:d75e:3801:1b2d%9]) with mapi id 15.20.4373.019; Wed, 28 Jul 2021
 13:38:59 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Gerd Hoffmann <kraxel@redhat.com>, "Greg
 KH" <gregkh@linuxfoundation.org>
Subject: RE: refactor the i915 GVT support
Thread-Topic: refactor the i915 GVT support
Thread-Index: AQHXfkkPR74j3PcQBUqzVfBaHB7ETatOyPlwgAATUQCAB+h0AIABoDZQ
Date: Wed, 28 Jul 2021 13:38:58 +0000
Message-ID: <DM4PR11MB5549EC882AA6076F3468274DCAEA9@DM4PR11MB5549.namprd11.prod.outlook.com>
References: <20210721155355.173183-1-hch@lst.de>
 <DM4PR11MB55496531B246A4604FC86998CAE49@DM4PR11MB5549.namprd11.prod.outlook.com>
 <20210722112636.wj277vqhg4dez5ug@sirius.home.kraxel.org>
 <20210727121224.GA2145868@nvidia.com>
In-Reply-To: <20210727121224.GA2145868@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7777033b-75b9-481b-e466-08d951cd0dd1
x-ms-traffictypediagnostic: DM5PR1101MB2123:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB21231AAC7A9E1635C94771B9CAEA9@DM5PR1101MB2123.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fnErwjFtN0OkaU6aVFtAjgGrZ3hVpaP+1yb4KuTgGJW0+WTrGi6sc7WKIwCEa+Fh8OqRoZ7wILwbd+pK/FxtKZ6ICJmSc+uN0h60Fe+0Ie7Y5a760af0EhthBHRoW/j0rkHtRoPegHJ+yvI3rJqbX83TQejixssWZUp8wT8wlPrkeUsNFMvc8agASur/zV9PRdhR/w2DGAq/98aiu/Rrlmv5TtQ9c3vLPYn50R78DACS1LgHFYplIThxHPIEPHwi4bFJX2l4wyajdy8A/ix5sy5L4I1tJLAPlk2GjtsXbvQdykpK+tLQHiLAyDIjZlV4f3ygIowD4b3CDFXkL4zEAHUqxMW184PwBtpl5B+OdB7mLp9PPox17wpgmvVCs9DoXgW8fnBXobgYoQywzDi/fBcYNuhJRX1kvwPfcGgMIcAnNFMoWBGm7fUWYD/TOJj4sZRhHWdaJoXJwml5/dU7bYgkkeTG/Qf05U9nTdWYFgK6sZ9UQseMrT6PFvB+YvheoLDeluCypbtbo6+YiMoYLM941VpqeYjKD/vNxqKgwyjioWHhZelFZy6cw7SNxPNUh7AdlImPmTbWThB8kRQKrK27gpJpN+krpA7ArmuHBU3FcuFFBUzycJ9U0p9SZyqoNHmfi9RLYHMjcXTzDPfFMLQe1QRDKqi3wpxMBCAB0xWERRt3AyvJNYvDT8vac+gzq5Q/FKU17z3zeK+sLbYwWeZ7aaPqcLCrWbhbSYvIQtcSMMQJgT4HzcpYCMHpcSEAnhv3UrXIOmUXD7CIvElzvgQWU1q+ftvoW098WoeJtkY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(7696005)(33656002)(66946007)(316002)(86362001)(55016002)(53546011)(26005)(966005)(186003)(7416002)(83380400001)(8936002)(478600001)(54906003)(66556008)(76116006)(52536014)(6506007)(38100700002)(9686003)(66446008)(122000001)(4326008)(110136005)(8676002)(71200400001)(64756008)(2906002)(66476007)(5660300002)(38070700005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4DSMTfgF4pBZwEj7K74n0lqVnjovYOse121zAlW0nEPWZeAJrDVSKAPNXoEH?=
 =?us-ascii?Q?XcPSNkWtW9VHt1CFm/pQ4uGlc66rgejktBHc2D4gHMLibivCbZdH43g7On3m?=
 =?us-ascii?Q?VWsgRGIgOucWIcMojGX9Hd7fFcEhYi5gt6r1Or8rLuiZCBQPn1J6sLb5WIaT?=
 =?us-ascii?Q?GQ0GLX9H75z6kf/SGeXufGqX6hUVb/RwoU2Iftr4GQVmni+cZrVYSILmODCr?=
 =?us-ascii?Q?s8ojg6wdpE5skc+QVxma3coVPzULPiKQbtQqvHHDCjT9wRHTh2sgtQf/Hx6d?=
 =?us-ascii?Q?gOGB4ctTSpf6DIIKeCSCD5yCTvBjwWvHg+kqDXkCo5XiYLOdhDhIvimrmHcX?=
 =?us-ascii?Q?YkWzjFFBf1lThdnF5OI8n0EhS0rBwh041o6DFd4kLMjerusDGBa7HMH0X/pm?=
 =?us-ascii?Q?wfObe7uqVX+xncPAx13iV6azhC4uHH34EVsMzwDaiZLZbv8btF4kjZDtjSNM?=
 =?us-ascii?Q?A/a0Mrj/CQqeOEK7i55Jolx6cL1lD1n3Q04xv7+mEYvYxi4rvghEQS4kT92g?=
 =?us-ascii?Q?dHQlAeZDMUOeyRoh0gAelr1reoFxdq4A/07EYJL8oIVRdGX4tFy2t4KxJonT?=
 =?us-ascii?Q?io6bRiAaA7m/BEqiqyR01bEIQOWFlHlt2TIh69VeFHlzyvhrSmvbswNcaZx/?=
 =?us-ascii?Q?+tNQuLjlgJWW5BBe8ip1FtCCXZeKzExpgPIu38ymGII+o20FZWv5k6iKDAL6?=
 =?us-ascii?Q?TNOhwAf6oZXBvrZZ7KsL+P8WebYGD5BZEcm1nE2MUQAG+doDJ1M7FK0akEke?=
 =?us-ascii?Q?IgHTH74ze1WGtx65o+EtH7mfAL5g88p/3XgcdYb7Vcc1LfO5bGqfGAYUdWVc?=
 =?us-ascii?Q?nslxAuvPmVP5+RIkNcw06ikfikkexqoJvn+Y4TCnSN9pMOsOWfc40sXvaIkT?=
 =?us-ascii?Q?hOYIr/zbNKPJR/QYnOpk195kHp0bCwkVbeMbmOhuHZUWR5o9QBHq4HjofOfK?=
 =?us-ascii?Q?ZQ0U3V0NBtxAlTjLBSU8eKBG1RCzlbx7pABCLrAPwv5BCWBi9askZPYfENSs?=
 =?us-ascii?Q?t49kbQ5TyA1CNszqA1GeM79X8lnilU1EtXBEmSYYC3tmmnub3ylW+WyY1Juq?=
 =?us-ascii?Q?IjDVOu7L1cZOitNyUl/7jqz75DDknFAI/nkq5rp2UninCxpkXLIhXd9ohqHt?=
 =?us-ascii?Q?eDHWjzr2pmKkV2Ccea8I+PcWQ7mv+S7qdym7vtKHd+OvDKCFRPfjh0OKdFhq?=
 =?us-ascii?Q?xywa+1sr4BricD6HTWsCvWDG2UXLfgBR8KWM3Wv88XI9G83ZJdDc548g2IgP?=
 =?us-ascii?Q?qM6ZEWapm8/pR74ARwUzcSLUApazW5Qv4C+IAHGBVvSbswe5clq0Q8/Dm4zK?=
 =?us-ascii?Q?yPY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7777033b-75b9-481b-e466-08d951cd0dd1
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2021 13:38:59.0177 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2VFSMjyiMiAZI0hGoofwThZdLxd7z3Fg9RCdhJ2Wy7Ywc+ibfB/X1vHLCnKPojivcHyK0jiu9RTThiWvpuez7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2123
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jason:

I guess those APIs you were talking about are KVM-only. For other hyperviso=
rs, e.g. Xen, ARCN cannot use the APIs you mentioned. Not sure if you have =
already noticed that VFIO is KVM-only right now.

GVT-g is designed for many hypervisors not only KVM. In the design, we impl=
emented an abstraction layer for different hypervisors. You can check the l=
ink in the previous email which has an example of how the MPT module "xengt=
" supports GVT-g running under Xen.=20
For example, injecting a msi in VFIO/KVM is via playing with eventfd. But i=
n Xen, we need to issue a hypercall from Dom0. So does others, like queryin=
g mappings between GFN and HFN. Some GPU related emulation logic might be i=
mplemented differently under different hypervisors because different hyperv=
isors might provide not exact the APIs we want. That's the reason why they =
get a callback in the MPT (yet not perfect.) =20

As you can see, to survive from this situation, we have to rely on an abstr=
action layer so that we can prevent introducing coding blocks like in the c=
ore logic:

If (in_hypervisor_xen)
	Issue hypercalls
else if (in_hypervisor_kvm)
	Play with eventfds.
Else if (in_hypervisor_other)
	xxxx

Thus some of the APIs have to be wrapped in the MPT module in GVT-g design.

Sadly, not all customers are motivated or allowed to get their hypervisor-s=
pecific modules into the kernel. We have a customer who runs GVT-g with the=
ir private hypervisor. In this case, they don't want to get their "xxxgt" M=
PT module into upstream since their hypervisor has been in the kernel yet. =
Also, we have customers who ported the GVT-g to QNX which is another widely=
 used commercial hypervisor in the industry. They can't get the "qnxgt" MPT=
 module into upstream since it's not allowed.

We do understand the situation and try to figure out a solution that can fu=
lfill expectations from different people in the community and also customer=
s.=20

According to Greg KH's comments, we are collecting the requirements of MPT =
modules from other open-source hypervisors in the kernel, e.g. ACRN, to see=
 if they can get another MPT module into the kernel, which will show an exa=
mple that how the MPT abstraction can benefit. Also, we are evaluating the =
impact on our customers if we have to remove MPT abstraction in the kernel =
because there is only one MPT module.=20

Thanks so much for the comments.

Thanks,
Zhi.

-----Original Message-----
From: Jason Gunthorpe <jgg@nvidia.com>=20
Sent: Tuesday, July 27, 2021 3:12 PM
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Wang, Zhi A <zhi.a.wang@intel.com>; Christoph Hellwig <hch@lst.de>; Jan=
i Nikula <jani.nikula@linux.intel.com>; Joonas Lahtinen <joonas.lahtinen@li=
nux.intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>; Zhenyu Wang <zhenyu=
w@linux.intel.com>; intel-gfx@lists.freedesktop.org; intel-gvt-dev@lists.fr=
eedesktop.org; linux-kernel@vger.kernel.org; dri-devel@lists.freedesktop.or=
g
Subject: Re: refactor the i915 GVT support

On Thu, Jul 22, 2021 at 01:26:36PM +0200, Gerd Hoffmann wrote:
>   Hi,
>=20
> > https://github.com/intel/gvt-linux/blob/topic/gvt-xengt/drivers/gpu/
> > drm/i915/gvt/xengt.c
>=20
> > But it's hard for some customers to contribute their own "hypervisor"
> > module to the upstream Linux kernel. I am thinking what would be a=20
> > better solution here? The MPT layer in the kernel helps a lot for=20
> > customers, but only one open-source "hypervisor" module is there in=20
> > the kernel. That can confuse people which don't know the story.  One=20
> > thing I was thinking is to put a document about the background and=20
> > more description in the MPT headers. So it won't confuse more people.
>=20
> Getting the xengt module linked above merged into mainline would also=20
> nicely explain why there are hypervisor modules.

It would also be nice to explain why a GPU driver needs a hypervisor specif=
ic shim like this in the first place.

        enum hypervisor_type type;
        int (*host_init)(struct device *dev, void *gvt, const void *ops);
        void (*host_exit)(struct device *dev, void *gvt);
        int (*attach_vgpu)(void *vgpu, unsigned long *handle);
        void (*detach_vgpu)(void *vgpu);

Doesn't vfio provide all this generically with notifiers?

        int (*inject_msi)(unsigned long handle, u32 addr, u16 data);

Isn't this one just an eventfd?

        unsigned long (*from_virt_to_mfn)(void *p);
        int (*read_gpa)(unsigned long handle, unsigned long gpa, void *buf,
                        unsigned long len);
        int (*write_gpa)(unsigned long handle, unsigned long gpa, void *buf=
,
                         unsigned long len);
        unsigned long (*gfn_to_mfn)(unsigned long handle, unsigned long gfn=
);

        int (*dma_map_guest_page)(unsigned long handle, unsigned long gfn,
                                  unsigned long size, dma_addr_t *dma_addr)=
;
        void (*dma_unmap_guest_page)(unsigned long handle, dma_addr_t dma_a=
ddr);

        int (*dma_pin_guest_page)(unsigned long handle, dma_addr_t dma_addr=
);

        int (*map_gfn_to_mfn)(unsigned long handle, unsigned long gfn,
                              unsigned long mfn, unsigned int nr, bool map)=
;
        bool (*is_valid_gfn)(unsigned long handle, unsigned long gfn);

Shouldn't the vfio page SW IOMMU do all of this generically?

        int (*enable_page_track)(unsigned long handle, u64 gfn);
        int (*disable_page_track)(unsigned long handle, u64 gfn);
        int (*set_trap_area)(unsigned long handle, u64 start, u64 end,
                             bool map);
        int (*set_opregion)(void *vgpu);
        int (*set_edid)(void *vgpu, int port_num);

edid depends on hypervisor??

        int (*get_vfio_device)(void *vgpu);
        void (*put_vfio_device)(void *vgpu);

Jason
