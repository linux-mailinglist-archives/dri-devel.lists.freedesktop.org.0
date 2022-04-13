Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A409B5000AC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 23:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC2B89B57;
	Wed, 13 Apr 2022 21:08:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE6A89B05;
 Wed, 13 Apr 2022 21:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649884124; x=1681420124;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=1kThAo9pm92onLW+G+64UaA5FBheq/P1DkKa0PuQ450=;
 b=Hzhu721xUDEFlqx7hRuneeH9L5sJr33OgyZ2/m95z6TSrHTdIa05gRcz
 RA6PByEEksjYBZG4Dmh1v6yg1sJKF71bR73LoBTHD8RXOVKPHBdewkrrm
 YTVPnAxLAiwdTmCsfbVhGh89ZhBDC6/deZTDseIpNlg1bMGWy0fkrwRL/
 B9vg01/51eKNxYCdG8vcjEIlL/XFwVUFUI1awCN58wZ2YyvtxH9VeYfIF
 loly+1D+n1sKOe/Cmfljd+Q4M0TGIXhy7Q0P3ef4yEF8YSPp3UETS92ZN
 Va+zbfvT6JdkBb2zZ+OpRk9MWSKFdXxxIeXKxkgyE/ZlF/sEWoIFQUZwx g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10316"; a="260370533"
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="260370533"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 14:08:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,257,1643702400"; d="scan'208";a="612041493"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2022 14:08:43 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 14:08:43 -0700
Received: from fmsmsx606.amr.corp.intel.com (10.18.126.86) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Wed, 13 Apr 2022 14:08:43 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Wed, 13 Apr 2022 14:08:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.174)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Wed, 13 Apr 2022 14:08:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OT+pwLMQExHt+sGo8/y3vx2cv10JaJbNCJ943MyEl8UAn8HAdiAYhogJ8IfLZ9h+2QqDi1qUYRMivOh/iaGIprKdrrt6pphGk8kHg+RLX5SE+esbUYejq5K+eLq5ZhIEN9+Nsg6atrFD/3ErFnfiifw71QDZxBvDGtliKxNIvn1EsaiibN2tdOa9YxvMQNqOLZAhdb/7ytiCTI96NU57JVJZMUU4U1b1ptbARCdWVM8nrJC6U15OracduJL8z65JBSaogGcL9UnhxPCAfCOKLC/dRWgwvio97Xe/qx7soQ6AIooLECO1hbEljYdf9ao+84KK/M2v4V2Wt4DPlCCXBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6U5XS/8H+9DTIqo9+fJMZlxvvEk/8qps/daoKHuM3bk=;
 b=HRqKOXrwj6cPmS0F5LYq3gh8WMoklf8Ks31p2WyYL9bkaeM4kLEmiSciPhgv5Dc5o5/IdS2GuL3i5DmPcoyuzqVhlyT2mMd9NizuKc3ezq+t4uH1dDO9hPXcnRa8+two68DSqQKz4384YYT00DJhXUCUnnIQfQFNIM96R9Tb62sR4+2hAobkwAewcS8visHzStUBDiWQ0lJWPEO2C+FukCRT4EtZbacbQ7qEcpJFguyfnhOKgTDgWrFg51WmFY1lLXl36KtIawuWgILRRIL7GFo51jRSfGLUjXpiIZr5elEKyd2kuCWYTRNYx4ovEUI1MgZizGzAW2RxQ4Bx2eQcpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5549.namprd11.prod.outlook.com (2603:10b6:5:388::7) by
 DM6PR11MB2985.namprd11.prod.outlook.com (2603:10b6:5:66::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5144.29; Wed, 13 Apr 2022 21:08:40 +0000
Received: from DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab]) by DM4PR11MB5549.namprd11.prod.outlook.com
 ([fe80::e5b8:93eb:e06b:f1ab%6]) with mapi id 15.20.5144.030; Wed, 13 Apr 2022
 21:08:40 +0000
From: "Wang, Zhi A" <zhi.a.wang@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Thread-Topic: [PATCH 1/9] vfio: Make vfio_(un)register_notifier accept a
 vfio_device
Thread-Index: AQHYToWBxoFJZjoJdESeYYuxVyKPnqztWRcAgABgPgCAAEpdgIAAA2kAgAADOQCAABLpgIAAHA6AgAAM+gCAABH7gA==
Date: Wed, 13 Apr 2022 21:08:40 +0000
Message-ID: <bc3f32ee-0dd5-d525-0536-dc18ade338a6@intel.com>
References: <0-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <1-v1-a8faf768d202+125dd-vfio_mdev_no_group_jgg@nvidia.com>
 <20220413055524.GB32092@lst.de> <20220413113952.GN2120790@nvidia.com>
 <20220413160601.GA29631@lst.de> <20220413161814.GS2120790@nvidia.com>
 <20220413162946.GB31053@lst.de> <20220413173727.GU2120790@nvidia.com>
 <661447fd-b041-c08d-cedc-341b31c405f8@intel.com>
 <20220413200418.GX2120790@nvidia.com>
In-Reply-To: <20220413200418.GX2120790@nvidia.com>
Accept-Language: en-FI, en-US
Content-Language: aa
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8ae8e121-60a8-48fa-6d13-08da1d91c92c
x-ms-traffictypediagnostic: DM6PR11MB2985:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-microsoft-antispam-prvs: <DM6PR11MB2985C2B7124A33F5CCF5C2FFCAEC9@DM6PR11MB2985.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pmB9tpD3+hPz1PkJoBx38OR2BP/nzEJDjIQKlCaFQW1qe8ksvwGuzm3QumIMHVYhqOPQuTpM8KGDnUbJjmIAbWtgmmpadrN5Cs6//wz9MsSsVbwLcH1co3PfQZvO6LvbtQeDIzT14nW3G0JAk0WHqbvuZmYowIelUnurZoEEreVynBkY5+XU2LRgGL6q59+hSYzQ7jQzhI8/Im0ZiQYaGrMRQ3CVxg16jW8wAUKhf6Vlmtk50oQo3PuYNiUpAxI3jLID/bO84cDaZ+uPMBiFzbUST63fcY/2aDFDfoxguLC2/SDOWIp+r4bRSiRUQNLKIkfYFUte06iakqbHNRGIb2fQDaPjEt7U02Hgmjypr4Sh6iYCzMajXk6OiBHw05sT3t6ATpKiIpRyR+bMYpcNKnBH6CX4e/zRuLGja6UOdDLSte1TKi7VqQQ9KS9il/B4xoQQFfNrnpgtl5RS5r5yJ6Hc8p9Czk3frviQ8a1Bnn68GwHD6KUdPZ8whVb5EUOUXr51TMR3cX3rYNCWxKaEz3CyuFSwrHeXfOCdYXnRVZRNVG6IVLNjx5aaHJ/ETJ7miR2BFjtkIyyzBosIPlD/4Yy5DVxZ1KhXo1gEHW+UMrdXeu7EyRSv2XrEmsE7s1dZelCwzvkeih2AzmhIZmHuYIEO3liRcgTNpdIEKqzl4e4unOeSH5Rvhl/YxCtxDmKj7wiwLjewKcNO0Wcy1qe+EgE7JrWfDe4R5g4UzzxUahREvJ8oMNKAmCrowcfvknFeTOIurIVYGzyS/OdfdcSfog==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5549.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(66476007)(64756008)(26005)(186003)(6916009)(54906003)(71200400001)(66946007)(76116006)(66446008)(53546011)(4326008)(8676002)(66556008)(91956017)(2616005)(122000001)(38070700005)(6512007)(2906002)(508600001)(316002)(6506007)(6486002)(5660300002)(31696002)(82960400001)(38100700002)(8936002)(7416002)(31686004)(86362001)(36756003)(7406005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?Xx/VFyliS57/Zd8vRmH1EXGjc33PTi52DslixIVOTsmKs43C/5idsCUf?=
 =?Windows-1252?Q?4Gv72OVa373V65DW1UUHbG1GsoXzkcEL3Sg7Ue8kdVBQB0wVoCqA+DuG?=
 =?Windows-1252?Q?qXBId9/g4idr4cpZfMyghUdfMZZWcvnFa7ADGev5fGeWGxJs8lr6RHsa?=
 =?Windows-1252?Q?BZTv8n1GTMrG3PrNIBXIwK72gWlob2Yna1aYQMvOiOqmqmar4iA/3YVa?=
 =?Windows-1252?Q?lJhmN+q3gDOxIyCotRWdz62IKrEfDGofC/JmcKMaaYOcLri+Zn/UGFNW?=
 =?Windows-1252?Q?8/kEq7VTupsysEEHcKnnM6tG7loHhgZ9JcOPXRe0lEQD3QVmJeYHtGek?=
 =?Windows-1252?Q?J9KkdKyRm9HOturzeDbnew1me0zvnlprbbNOwFwCnW0AKU48H+24CADx?=
 =?Windows-1252?Q?ybT8HlGQ9/GzpURG4gurR+8F1siWUscNfxoAr/Y0qaEzyN+M+1qr8x+J?=
 =?Windows-1252?Q?fOQVlcLb0oqNGjic8xOmnad+Se9DDugCZpfXVJflVng6YAvQNPL8N+ym?=
 =?Windows-1252?Q?m2ryUGo46mFwJUPxvtT/T4DNCuMvVG4oknlX0CZYjS5CMv+8qFoxc7X+?=
 =?Windows-1252?Q?hW9+wzJKtcl9taEHKDjg/saPqEwwogQiamdKkrerNDTSlVB5RkslfzCP?=
 =?Windows-1252?Q?1zoD2nf4myBWxjnZJie8tbT1dptFjqx90/OXtSsZ0cwSOPrlYAYGL1gD?=
 =?Windows-1252?Q?xQMb1LkUfZ+rWzPhY136OdnL8mgNSzk/pom4Xy+4g6fj9H1YF9FmhHlq?=
 =?Windows-1252?Q?kIUU4X/B15VZI7dxrqWbh7ScmJiiXlSVcYj299pcZvzucR6fz9ZiFMsI?=
 =?Windows-1252?Q?UUz5CR/xRO9w50zJ8pOfiYnsBNGexVeyTvmvVSJsklTmmab095gf+Xtv?=
 =?Windows-1252?Q?dWuIhuKwgkSBO4J0THNY/Fat7QfKfCzfT6/S/GKrCJRna0edP6HxX2qx?=
 =?Windows-1252?Q?PyuLaiBjZAOpuvRJ4yMwZkUp7htvy4W9M7FUAefCRXC5OvEz1HwZwqXP?=
 =?Windows-1252?Q?xKBeSuXYp0nLiZN/hARH1/PLVVeVQ75DPm6c7iMW2lButcZakBa5BNmL?=
 =?Windows-1252?Q?OcJl3xF3cIWUMKzOrpg/I214Qp6KuRr0Sdb5LcQZFyuUwavTsQmM98Uy?=
 =?Windows-1252?Q?kFfND2JG+wfMe+qcG0LTj4La0Hdf+TuLe+A6DB3H6o6qcBo2aVs2B+ek?=
 =?Windows-1252?Q?mWLAae8lQ0YGnnwGmY7IDjGNlCeCbs9O7KbTwBhe+GCSMeyJAPyhZiRX?=
 =?Windows-1252?Q?7swOEUxbgBx00k/8qAqhtUKBziNkSElSxeWIInpSIj4ICMp4mFzUiuc0?=
 =?Windows-1252?Q?Ry4BOQ2XkPI5ZYydJdP4L9ij7KRe3gh8FMi1VDO0peSUuaqifx48Ongm?=
 =?Windows-1252?Q?lnexZvuWhdtivYOKWDA/4t0qLv6l7hFT5rPDMIwYKFJjcgZdAvOX9riO?=
 =?Windows-1252?Q?OdeWFIyHA1PmD82q3ahd/8seYfVQAWiGgJWLT5X+BYVMSR1Foi4Tapx7?=
 =?Windows-1252?Q?mGCyHZbAAZvb3ukxPu8S4E/h5I5Zp1R0Q1vSqwd2iN95dZwPt4h7bE5K?=
 =?Windows-1252?Q?Tn5JfTb8uDhRSivzfUG2MttyeGPxtU6dQ2/890EHz7GyiMrKOZaK1r8H?=
 =?Windows-1252?Q?y6LS87u4Ds0iyAk1TecQ3goETDKlVWOGOTAbcQZRyNC39fopqRjPc2rr?=
 =?Windows-1252?Q?LrWKyoU72/3xiwWU5x0NCKIHIxsrfVN3Vh7LsuVwum6FvF4WD9dH1TgR?=
 =?Windows-1252?Q?K6eK9bKbh19EBwZxHCp49HmA89zHfIwWc+La74RFgM26Q+STh3zeuCHT?=
 =?Windows-1252?Q?KFv/lCswziMtdH3nTY5OGQWrCKaGYccHmA0Stdq8m9czqYmwMRXRcZaN?=
 =?Windows-1252?Q?b9or4pzPGKDkHA=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <E81ED54A9278C14483967DFC6DD875D3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5549.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae8e121-60a8-48fa-6d13-08da1d91c92c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Apr 2022 21:08:40.4099 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yMlSboAy4Z7hPnd1/Jt2aBSXFjMwI8Dgd4qbmE8GDjQPc3Hl68fyb1dVZfW1sPIYtXhlY2Njbjd7tXs/qkM4Zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2985
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Eric Farman <farman@linux.ibm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Kirti
 Wankhede <kwankhede@nvidia.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 Jonathan
 Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>, "Tian,
 Kevin" <kevin.tian@intel.com>, Vasily Gorbik <gor@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jason Herne <jjherne@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Oberparleiter <oberpar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/13/22 8:04 PM, Jason Gunthorpe wrote:
> On Wed, Apr 13, 2022 at 07:17:52PM +0000, Wang, Zhi A wrote:
>> On 4/13/22 5:37 PM, Jason Gunthorpe wrote:
>>> On Wed, Apr 13, 2022 at 06:29:46PM +0200, Christoph Hellwig wrote:
>>>> On Wed, Apr 13, 2022 at 01:18:14PM -0300, Jason Gunthorpe wrote:
>>>>> Yeah, I was thinking about that too, but on the other hand I think it
>>>>> is completely wrong that gvt requires kvm at all. A vfio_device is no=
t
>>>>> supposed to be tightly linked to KVM - the only exception possibly
>>>>> being s390..
>>>>
>>>> So i915/gvt uses it for:
>>>>
>>>>  - poking into the KVM GFN translations
>>>>  - using the KVM page track notifier
>>>>
>>>> No idea how these could be solved in a more generic way.
>>>
>>> TBH I'm not sure how any of this works fully correctly..
>>>
>>> I see this code getting something it calls a GFN and then passing
>>> them to vfio - which makes no sense. Either a value is a GFN - the
>>> physical memory address of the VM, or it is an IOVA. VFIO only takes
>>> in IOVA and kvm only takes in GFN. So these are probably IOVAs really..
>>>
>> Can you let me know the place? So that I can take a look.
>=20
> Well, for instance:
>=20
> static int gvt_pin_guest_page(struct intel_vgpu *vgpu, unsigned long gfn,
> 		unsigned long size, struct page **page)
>=20
> There is no way that is a GFN, it is an IOVA.
>=20
I see. The name is vague. There is an promised 1:1 mapping between guest GF=
N
and host IOVA when a PCI device is passed to a VM, I guess mdev is just
leveraging it as they are sharing the same code path in QEMU. It's in a
function called vfio_listener_region_add() in the source code of QEMU.
Are you planning to change the architecture? It would be nice to know your =
plan.

>>> It seems the purpose is to shadow a page table, and it is capturing
>>> user space CPU writes to this page table memory I guess?
>>>
>> Yes.The shadow page will be built according to the guest GPU page table.
>> When a guest workload is executed in the GPU, the root pointer of the
>> shadow page table in the shadow GPU context is used. If the host enables
>> the IOMMU, the pages used by the shadow page table needs to be mapped as
>> IOVA, and the PFNs in the shadow entries are IOVAs.
>=20
> So if the page table in the guest has IOVA addreses then why can you
> use them as GFNs?
>=20
That's another problem. We don't support a guess enabling the guest IOMMU
(aka virtual IOMMU). The guest/virtual IOMMU is implemented in QEMU, so
does the translation between guest IOVA and GFN. For a mdev model
implemented in the kernel, there isn't any mechanism so far to reach there.

People were discussing it before. But none agreement was achieved. Is it
possible to implement it in the kernel? Would like to discuss more about it
if there is any good idea.

> Or is it that only the page table levels themselves are GFNs and the
> actual DMA's are IOVA? The unclear mixing of GFN as IOVA in the code
> makes it inscrutible.
>

No. Even the HW is capable of controlling the level of translation, but
it's not used like this in the existing driver. It's definitely an
architecture open.
=20
> Jason
>=20

