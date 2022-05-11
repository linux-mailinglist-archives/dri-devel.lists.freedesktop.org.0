Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 557E4523826
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 18:09:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FDF010FB6D;
	Wed, 11 May 2022 16:09:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D5710E29A;
 Wed, 11 May 2022 16:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652285350; x=1683821350;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=jJYut7hrb1wo1/mcdhkxI1lsONfk94q6Na77nTZTqxo=;
 b=JIVVIkJ6tn3kdZSF+FVfy4du1LtgPnuVzQaLCEwu9u7coVAhq7FGyjMs
 RWo6eGJb+MezQjYaQm7effZECP5fjgoGNPrY3H3pvXcxOJZJV+UxXwVuW
 lw46CiOgL+/x/cZMa7dCGpuVsRrAYJy1Ttjukok9x+gCpZFdFiOxPZTXP
 XHtC4DiYlvKgzBTDmbeRTiUCFAjkpeL2TpIWeebp20buyIUkd1dVv1gbh
 c4oFLWcTZ9c8Hpt/sO3eKcmkmWI13SOX3v7/JvHmR6VsvnJ+mOhgVQMgR
 fNBVEj8m9AjhqluHfsjuo62jhS4L21f0FI5Dz+Oa4w5zWSmBkW50UuCEi A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10344"; a="249639003"
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="249639003"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2022 09:09:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,217,1647327600"; d="scan'208";a="697638152"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga004.jf.intel.com with ESMTP; 11 May 2022 09:09:08 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 11 May 2022 09:09:08 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 11 May 2022 09:09:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 11 May 2022 09:09:07 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 11 May 2022 09:09:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y1BCH/xXd5zJuxjKSkAY+Ea8/1DR0xtU6frjbefExYYCaE7AV5UF8CTnPQsfezYHWoVbqkY9mYV6w2JA4df/H97xsrKqq7M7Ela7RJLuvAU30iTVlpjeaEPGo80T3Vkc5xQAyFcMJpRDzRx4RwE4U/fsW+Ky46m+8fZg1JyfTqCTbA5jlYyrF13KD1IzieexB3CAicWbdahsGuamtnciz42h7X9a1q+XXriyvNXSC6Gu9wDX2LQ7Y93lAynqyPg/O7GQFLUeUgfl0kVU7Y8eZNncISEsHIdGKQeiNFhhik3jvj05tKKRwKseFBPt9lUrnN0EVm3W5LdLCgx7krUGOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORODlmO+5Nx6qYLjLlPnRnakc6Eh41HfiNjwnBL8sss=;
 b=bOxUjiv65pcKjJpdWZrKBGbRdHB/+vSI7ZtLiau//1cvimJpTYD9LBLQxP75VqxVTfhd8msi4LlzUy5eZkB1Vd4cSzf0LbjmEdDWT9N40sY8j5cXa/S9OlpUYfXYZqIma8hPvzD+BQjWa617QDlODh0549NoW8GOcJjehAtLrIOoX0hndVgBJgox6N9gDAzqeD1+Xam9V776oZlZVjd5IwX7517zWiFQH1uZ29uEJZyr4h8DcITuf6tke0coLa2dEceg1XqGed+K+XMFrjuzaKXrWEuEMcTXwLRwWsyTbSHCPQg3dEAny4naK7b7/o51lCLUXHRJ6hwvFdKDJ7aYEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 CY4PR11MB1351.namprd11.prod.outlook.com (2603:10b6:903:26::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.23; Wed, 11 May 2022 16:09:05 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::748e:ed0c:39b5:fe99]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::748e:ed0c:39b5:fe99%6]) with mapi id 15.20.5250.013; Wed, 11 May 2022
 16:09:05 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, David Airlie <airlied@linux.ie>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, "Jonathan
 Corbet" <corbet@lwn.net>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Harald
 Freudenberger" <freude@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Jason Herne <jjherne@linux.ibm.com>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Peter Oberparleiter <oberpar@linux.ibm.com>, "Halil
 Pasic" <pasic@linux.ibm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Sven
 Schnelle" <svens@linux.ibm.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: Re: [PATCH v4 5/7] drm/i915/gvt: Change from vfio_group_(un)pin_pages
 to vfio_(un)pin_pages
Thread-Topic: [PATCH v4 5/7] drm/i915/gvt: Change from
 vfio_group_(un)pin_pages to vfio_(un)pin_pages
Thread-Index: AQHYYN1+FhwmIsgoC0ix4OMMkjK73a0Z4SMA
Date: Wed, 11 May 2022 16:09:05 +0000
Message-ID: <07c413d5-14d3-da9b-28be-29409ed0ce1f@intel.com>
References: <5-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
In-Reply-To: <5-v4-8045e76bf00b+13d-vfio_mdev_no_group_jgg@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8189c335-235a-4eed-bacb-08da336892a3
x-ms-traffictypediagnostic: CY4PR11MB1351:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <CY4PR11MB1351D14EA5405725511E9035CAC89@CY4PR11MB1351.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: v1/r5M3IjJFOHpZ2STc7PbvLYp8QScnumlg3vt4cBEaBmlMeniFeF4DB63AoQ6pqFFE3dH9F06L5NyfyJMRYRs7HY3o43bFF7GzefU3OFNtQC02ZkypgXEGUGwhgIFrkP26Fd/pu5YXjWknVz7Q/AUOXCwU1uYXgQk0QJNlAYQgUSYdfhFdMV4xahhIpJtapK7b4bP6lPZ6hlCsEEQ5Sk387APVJ9ECYBtSytdeGi22MmobUoZg0/+FXQluCsOxRR21Hqo1s1QJkPF/BJjg66OAHOy3+hwtB3IIUh0skIBrXQhMLxvXvFaWWBZ2a2TGf3hocStk3hpp3X2FIqMtysnm7eBsPXXTWj+N9jTYIK4E8YSYNn4TnfqgR3qJWeuHa+mNwYn+Oy0c+F15N1miBesAeT4giXJtVupkGLQXb99DVyYc3OI2wxrKuCj+bWkGckEtJAPMEv7eZbx7v0TyT0fd9ZdWp1eLWEWBF9imrBoWG+y+w2E7+JQUaSgN13B/bkUh+GFaiEE3K21d8QIjRKcQfYneSn1stMI17UiID8UrIqC2HOXbNJiEHUz4hKdyxudE2nUYh+JZpi87hZcevk+EKMK7Oedx+XH+YqIcyUWIAkrC/5UWmhd/kNx0B8bTfRpVyPoB9QvTU73LAJLXZyyONF/k5Okb823l0oaek198jMcee0rNSdRA4liVJeTA/6PyqODNBfNhRtorrYG/8kQ6qIvWD0RE9DusSmw0Da4w2DxT2va+oA8IvrfsT7BIvsRn/yoAjpssQuhGf746Ymk55Wbh9qCMjucp87CizTzw=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(508600001)(122000001)(82960400001)(6486002)(38100700002)(7406005)(7416002)(31696002)(5660300002)(71200400001)(8936002)(38070700005)(86362001)(53546011)(6506007)(316002)(921005)(66476007)(64756008)(54906003)(91956017)(66946007)(66446008)(76116006)(66556008)(4326008)(8676002)(110136005)(83380400001)(31686004)(186003)(36756003)(2616005)(6512007)(26005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?sFiwEYQ2U287NdXnoMCQvHoV/sSBeSmEYGq0e0aDpiDTAKXZWl24kvlJ?=
 =?Windows-1252?Q?Id+5tjMQb6nzMgUuQrm5D99hb95dfOBXZ6NY42cH1485v7qsJZ7+gxg1?=
 =?Windows-1252?Q?HDaxVNlPixdBTOshJVSb7WA9EDwhDVHadg6RtSYnrAb4W79BfvEnuCBK?=
 =?Windows-1252?Q?RCSyXEJQs0HtYrxOY9EtVnpEZ8x1bQCl4LLfgjzGT6oE0LnGLAlxbAYI?=
 =?Windows-1252?Q?I3bdR+XndXHBjisS690wZ4eOPCQYWMlwbXtwra49pgEl69b3qqoOvL2l?=
 =?Windows-1252?Q?QZdDY5Qy6fU6KIqzolRjFbs2P9Z2TAZrY65di5N/UlZs92zFvYt09UnW?=
 =?Windows-1252?Q?n0Oxxqp/9e29vDRforubsUuRg9Y79c11iCA7PXqpR2cL1pWAfsLDrIwk?=
 =?Windows-1252?Q?/Q7W54qnraUYSVx1lnBBcjwnDHR0ncrpQXeGx5hhWFTqtloxg3Legjcd?=
 =?Windows-1252?Q?S6j+zEUurp6rGq5lvGltOpdl+z+QWumkAtaFOQd7/zo6yq9withHOjJF?=
 =?Windows-1252?Q?DXojwd7cr7LVW8h67hQZeD+hL2nhRrYxUV5jtj6gRFlI4vybG8nQcpDt?=
 =?Windows-1252?Q?S+HkbaFNYuOQ7lJfDa0+KVmeUyDjZsqSmisHsLXNqH78iUTI63Ws8Dil?=
 =?Windows-1252?Q?XkcEAQf1E96LtqZSd+K+OJusKmKEqYVibWsO5vuwW4zun8kaS5+rD6Xo?=
 =?Windows-1252?Q?u0fiqVWhGIA9jqxoM2v9pbswz347JrFEHKoaX3+T8khQF9+IXWW88sJW?=
 =?Windows-1252?Q?toaed9ad3T9wShgFJx9gtyI2DmJN49uYHC1CZYq/DbMkhwLxmLwRg2ny?=
 =?Windows-1252?Q?CKHe7BdvB+rhNd6ZCZT0njmbFtOGn7VwBrnAwJFXi66QT0hz5P5HEazV?=
 =?Windows-1252?Q?ZQMsWA1f2QERoAOpeZWXDg1pcYTeEQcrI8GfKr7m/+0Ae1Tb1gaf7dO6?=
 =?Windows-1252?Q?4U/VPaVYUonhE50lP2utGfvJzMnEBW1xyTs/6KpNIWFSPr3iDLo2kchL?=
 =?Windows-1252?Q?bfAeTkIBUoZw0gnrmZdRZX1T4XzqHL1OALcR2YDltEiOI1z+dH2Wu88P?=
 =?Windows-1252?Q?a/+wv3iuqVeutC2jmSyoRZMz+n2uzEkMfx7yBpSWLgNl4pQq4TKpXfzC?=
 =?Windows-1252?Q?t7txNJT0+bfRbYCBQaSXzVtI4nrcDZPeZYt20DNeNIJ/cN+642baU7AW?=
 =?Windows-1252?Q?0iARxicOwt+Z1nmQdMISIZB1sYX8Or6B4h+fWjsqul1OxAFu9aXEzFIN?=
 =?Windows-1252?Q?lt4CElxlCziUWeM/MarTRZdMytd8wU7TI+k7AH+1uUW+wuyBtaXJ0zKG?=
 =?Windows-1252?Q?M1yg5tcmztvgg8q/T4Ng5lCXPEWSs4szz4f21+Iii4fK2aiSmO85nmeH?=
 =?Windows-1252?Q?ybALUFNah8kwnQ3xPE6b2xTusOSQAT+JT2ZeLpR2UOINd9SZUxvgKIKl?=
 =?Windows-1252?Q?Ycb0OBIpzy6aFl2DbvU1J87IfZn77Q6P66HC6H8khc2PMCED8tc46pok?=
 =?Windows-1252?Q?5TqrwO1qajNPiRoDQq4xOaXYqJ9w4sw1mujc9/BQ44tWh9bMkPyedxsS?=
 =?Windows-1252?Q?BVnwSZ3C/hqkB43uve0OEkH/mwXx9EKGa6GDvRbewPQ8ielKpK+fSChy?=
 =?Windows-1252?Q?MONZQFELWTZfMnBfG3FE52F2WsGWbLyZNTjQlPzwEhoK7zr1vlF9s4d5?=
 =?Windows-1252?Q?PCBZomtkfEgNIFItFVj2TzC+QTFZUEjgLVLil0OIo4yGpB7/iXkrcffr?=
 =?Windows-1252?Q?06WzBxi8TQgFsIvrzFetlxKy5yQ8npdXdl24fIT41qMJ/b1o2C8pQIoj?=
 =?Windows-1252?Q?tMx6cqMyjA04NKUL8/Bhod/8ztyRL1fpzEqqmz7k7janbCFboOKZfNpQ?=
 =?Windows-1252?Q?MV5xugO8QGonIg=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <89D90BEEC5C4B945BA074C28D3BB8914@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8189c335-235a-4eed-bacb-08da336892a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2022 16:09:05.5853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FnDijik8P5PSHouhsF27ktxMCgxUxk828sWSBrUaiJQLd474VAzOiMqOnfgx3eZ7ZoifjUdODpf88P73QUXrjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1351
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, "Tian, Kevin" <kevin.tian@intel.com>,
 Eric Farman <farman@linux.ibm.com>, "Liu, 
 Yi L" <yi.l.liu@intel.com>, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/6/22 12:08 AM, Jason Gunthorpe wrote:
> Use the existing vfio_device versions of vfio_(un)pin_pages(). There is n=
o
> reason to use a group interface here, kvmgt has easy access to a
> vfio_device.
>=20
> Delete kvmgt_vdev::vfio_group since these calls were the last users.
>=20
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/gpu/drm/i915/gvt/gvt.h   |  1 -
>  drivers/gpu/drm/i915/gvt/kvmgt.c | 27 ++++++---------------------
>  2 files changed, 6 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gv=
t.h
> index 5a28ee965b7f3e..2af4c83e733c6c 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -231,7 +231,6 @@ struct intel_vgpu {
>  	struct kvm *kvm;
>  	struct work_struct release_work;
>  	atomic_t released;
> -	struct vfio_group *vfio_group;
> =20
>  	struct kvm_page_track_notifier_node track_node;
>  #define NR_BKT (1 << 18)
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/=
kvmgt.c
> index 1cec4f1fdfaced..7655ffa97d5116 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -243,7 +243,7 @@ static void gvt_unpin_guest_page(struct intel_vgpu *v=
gpu, unsigned long gfn,
>  	for (npage =3D 0; npage < total_pages; npage++) {
>  		unsigned long cur_gfn =3D gfn + npage;
> =20
> -		ret =3D vfio_group_unpin_pages(vgpu->vfio_group, &cur_gfn, 1);
> +		ret =3D vfio_unpin_pages(&vgpu->vfio_device, &cur_gfn, 1);
>  		drm_WARN_ON(&i915->drm, ret !=3D 1);
>  	}
>  }
> @@ -266,8 +266,8 @@ static int gvt_pin_guest_page(struct intel_vgpu *vgpu=
, unsigned long gfn,
>  		unsigned long cur_gfn =3D gfn + npage;
>  		unsigned long pfn;
> =20
> -		ret =3D vfio_group_pin_pages(vgpu->vfio_group, &cur_gfn, 1,
> -					   IOMMU_READ | IOMMU_WRITE, &pfn);
> +		ret =3D vfio_pin_pages(&vgpu->vfio_device, &cur_gfn, 1,
> +				     IOMMU_READ | IOMMU_WRITE, &pfn);
>  		if (ret !=3D 1) {
>  			gvt_vgpu_err("vfio_pin_pages failed for gfn 0x%lx, ret %d\n",
>  				     cur_gfn, ret);
> @@ -804,7 +804,6 @@ static int intel_vgpu_open_device(struct vfio_device =
*vfio_dev)
>  	struct intel_vgpu *vgpu =3D vfio_dev_to_vgpu(vfio_dev);
>  	unsigned long events;
>  	int ret;
> -	struct vfio_group *vfio_group;
> =20
>  	vgpu->iommu_notifier.notifier_call =3D intel_vgpu_iommu_notifier;
>  	vgpu->group_notifier.notifier_call =3D intel_vgpu_group_notifier;
> @@ -827,28 +826,19 @@ static int intel_vgpu_open_device(struct vfio_devic=
e *vfio_dev)
>  		goto undo_iommu;
>  	}
> =20
> -	vfio_group =3D
> -		vfio_group_get_external_user_from_dev(vgpu->vfio_device.dev);
> -	if (IS_ERR_OR_NULL(vfio_group)) {
> -		ret =3D !vfio_group ? -EFAULT : PTR_ERR(vfio_group);
> -		gvt_vgpu_err("vfio_group_get_external_user_from_dev failed\n");
> -		goto undo_register;
> -	}
> -	vgpu->vfio_group =3D vfio_group;
> -
>  	ret =3D -EEXIST;
>  	if (vgpu->attached)
> -		goto undo_group;
> +		goto undo_register;
> =20
>  	ret =3D -ESRCH;
>  	if (!vgpu->kvm || vgpu->kvm->mm !=3D current->mm) {
>  		gvt_vgpu_err("KVM is required to use Intel vGPU\n");
> -		goto undo_group;
> +		goto undo_register;
>  	}
> =20
>  	ret =3D -EEXIST;
>  	if (__kvmgt_vgpu_exist(vgpu))
> -		goto undo_group;
> +		goto undo_register;
> =20
>  	vgpu->attached =3D true;
>  	kvm_get_kvm(vgpu->kvm);
> @@ -868,10 +858,6 @@ static int intel_vgpu_open_device(struct vfio_device=
 *vfio_dev)
>  	atomic_set(&vgpu->released, 0);
>  	return 0;
> =20
> -undo_group:
> -	vfio_group_put_external_user(vgpu->vfio_group);
> -	vgpu->vfio_group =3D NULL;
> -
>  undo_register:
>  	vfio_unregister_notifier(vfio_dev, VFIO_GROUP_NOTIFY,
>  				 &vgpu->group_notifier);
> @@ -925,7 +911,6 @@ static void __intel_vgpu_release(struct intel_vgpu *v=
gpu)
>  	gvt_cache_destroy(vgpu);
> =20
>  	intel_vgpu_release_msi_eventfd_ctx(vgpu);
> -	vfio_group_put_external_user(vgpu->vfio_group);
> =20
>  	vgpu->kvm =3D NULL;
>  	vgpu->attached =3D false;
>=20
Acked-by: Zhi Wang <zhi.a.wang@intel.com>
