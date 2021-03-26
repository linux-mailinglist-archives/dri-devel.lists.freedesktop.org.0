Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9685B34A24E
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 08:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A206EEB9;
	Fri, 26 Mar 2021 07:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70546EEB4;
 Fri, 26 Mar 2021 07:04:11 +0000 (UTC)
IronPort-SDR: d0Kxq7qMYGroKzoB+9LyxjLoBT1UeM0KeDkjx3oiCOOC2EvKASHmCBmFSCMr/argNoEXL3OOMw
 PCb7N2bU0VsQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="276226973"
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; d="scan'208";a="276226973"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 00:04:11 -0700
IronPort-SDR: +1CxLmWgD78fvB9JzzHi0/9W+VtuDs6E2qm+066+qcua1DauENqzdK20W6azCsQxXtQMkyvg4x
 AUf3zjHkLCDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; d="scan'208";a="414452602"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga007.jf.intel.com with ESMTP; 26 Mar 2021 00:04:11 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 26 Mar 2021 00:04:10 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Fri, 26 Mar 2021 00:04:10 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Fri, 26 Mar 2021 00:04:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hczo/otdpVYCJZnS8+gwKow1yX3kf6MftDMNlGzbvzO9rfBic4vpb9OfH/QMAGbe36P2blCDvztnXAOw6M4cwp6Np5OoeLRhQFNnyARQtOfXDcSaLgKZBX9QknWTYdkvhatlmUDBAtkurAqWT3epFnfK97kysuM7irg8MkHiHCltCU5j4FqTKjL4Zmwa4hZkXT2kQLgtA9Alz3BjrUM5xbRa74o3X004kD1TaGhuwkZiNx4IESQV+K2iKTIiGP1ZP0wuaeTbWekT7Ydc4cMhW6ZFxJiwBce0HtQW41oWnn3FnG4yJYM604V3mWnJliq2aGquAFxIKZak592b23cwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZo9nFwwnVIcTZFzLoWHccO1OnfIgzDqq2+9TcCu758=;
 b=glM4c9wJ8sNbTO0KT/K/sBDTArHguH+j7u1Em47CGh+wJR6EriO7PIBYfhQJEbM5Nj/uSNUtG4U7vQJ2x7qR61zKoDyHzsbewYLuRE3gkOALWHBZhadBSxUlFFqMBv4/fOUjunnKqQJme40/8vrNFpc9HjcCJOhj/TMiubSE+goCeW9u2AZbupHp2pZSAeuXe7Ol8oLQuiIrIPM7scQ3qmWWVr6KO7Hxgp8aEi4Jg4SssF/wWmBh40iDkofB68VDnXrqSAq+7wNI7zf+m65y/whTmooFB40aqgEsQ+SElORmX9qBVbux+NV/lke4CKGlYQoOilEcZ83HIrVa9VwH6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pZo9nFwwnVIcTZFzLoWHccO1OnfIgzDqq2+9TcCu758=;
 b=eYfVfOmYvuZ03cxJPPTgxJFTPUdmdg1a2/QmwBSdt9Qdj2i5comK77wQb8ELcxfiapaUyxmw8sJn0Fz28kLmVwwgw7REZUgYMItZbU9sA/eE3M2j+7ZlcvFAXDuxidzxw2c7MO8a3V53bJtve4N69IDZuu3mIi0j+YnMslUediE=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (2603:10b6:300:110::9)
 by MWHPR1101MB2079.namprd11.prod.outlook.com (2603:10b6:301:50::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Fri, 26 Mar
 2021 07:03:36 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.3977.026; Fri, 26 Mar 2021
 07:03:36 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, "Tony
 Krowiak" <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Eric
 Farman" <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "kvm@vger.kernel.org"
 <kvm@vger.kernel.org>, Kirti Wankhede <kwankhede@nvidia.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Pierre Morel <pmorel@linux.ibm.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, "Zhenyu
 Wang" <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH 18/18] vfio/mdev: Correct the function signatures for the
 mdev_type_attributes
Thread-Topic: [PATCH 18/18] vfio/mdev: Correct the function signatures for the
 mdev_type_attributes
Thread-Index: AQHXIA37YLSDA08tg0+Z4ATtZCis0aqV3AIQ
Date: Fri, 26 Mar 2021 07:03:36 +0000
Message-ID: <MWHPR11MB18866F9854E5E85E7D8B804F8C619@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
 <18-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
In-Reply-To: <18-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: nvidia.com; dkim=none (message not signed)
 header.d=none;nvidia.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e564405-0fc1-46f2-67e4-08d8f02546e9
x-ms-traffictypediagnostic: MWHPR1101MB2079:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1101MB2079272962F7CB7F1D9DF4F88C619@MWHPR1101MB2079.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:346;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TpDAjXMdsZ5/JTltH2+79Gd2zC1wDm5mPlxymcsm4De8q2XMML2fkj5kyIpq0weKS3iUj/KPWMd6tltryFSIOLayw/OmIhG3mK9x2eHJtkuufgC7HNOXQJ8iKlU25cq01yofzik1g4FUxV9LgV49Wr70Ri9R9r7mXIom6ZDvvJvn7z1ehtrS2HVqiVkiK79t1raV+WRlySyseNLaPXGUxNvN2blYx+ZHVCkXiXik8XFUk3n3Ngdo2ua58+ghtVu7CwiEv7b7v2jT8evwvgS6DNCbYj62X3PkbDdXzVTFN4L4U5QeHWbj+v6DnxV8iG5CdGCqBFqGe9YCUGCLhSyTMGejVfiFGBpT2qOeycv1G9u9eT9b0/MJj06Czcf0/jUiJwT8e6V+MIy+TcsidVIghY+oQ4XUX1FOfPS/JOaXFvj6W0S56pYMSLShmcp/PIqnYLqJ1A1pSx8poXE1zv0lA3lOBFCcQHcpgEL6bqdQMA13fV6/4ohmgUDH22fYS1AAgwSvZ7OCAznAtzWhcrW7v/VQAnpb4J0uNRyH21GJcTqia9fm/cnXySF6ADPXhmrpq9cPGtVxDzJCNn1uo5NeiSCcjFt0Zjgm3bMD0XCmYFzrwsx8nxu6ThqibK2TULVQ76jKfa7t4ew9f8tVIhIYFEK76xiopfVnaVS9JE99zRc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(376002)(396003)(346002)(136003)(39860400002)(366004)(38100700001)(110136005)(7416002)(54906003)(30864003)(316002)(52536014)(66446008)(8936002)(76116006)(5660300002)(2906002)(66946007)(66476007)(6636002)(66556008)(64756008)(71200400001)(478600001)(186003)(55016002)(8676002)(9686003)(921005)(4326008)(6506007)(83380400001)(7696005)(26005)(33656002)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?3/NXymuaDwujyQcV4SN0O18Nbh3wbAIHHzpU5mdXzlHlHenAgEQNF4KEdDEW?=
 =?us-ascii?Q?Lqg5EVdLp2BBc7x4upLHSeX9oS2DUo1hj0NpQnWg+niMFe6LC69MV0qajTFE?=
 =?us-ascii?Q?OOYByE/ZrQf2VDIePwbU8QThaSmB5WOZB+7or6fVYJDj/rV9H90nEVSNRCFD?=
 =?us-ascii?Q?D2Diw+UynOU5VNVOEtBoJbRM4Qmzgo62c9sOOUY0hrI8/B9+q4iraWlfVYMG?=
 =?us-ascii?Q?n8UXD29+9vy4Tn7MGuf3vD5thfQEIhrROPSFnjbI4k21zGnKYkU30sI/ZNys?=
 =?us-ascii?Q?kStTruQ2027bSAbbKkdAc44ICq+FyxY3rRbJY6SbBdpRXza2JQJOtnQyhb0y?=
 =?us-ascii?Q?25r7bRsKghxAwF3LqUqif8WCULPj2qQXyqt0ylR/7KCv9bds1ShMpHiP4fzV?=
 =?us-ascii?Q?OY+C+izYV8LBnBn2bXpgEMSxqSPL9K+uYe17R8LSAnOS2TPhyHCd2pLg3vL4?=
 =?us-ascii?Q?8qQwRAZomwzPhBxf9znoZTFGBZyXxrS+Hwipm83Zuif8RhOhy9jSy89FYAvD?=
 =?us-ascii?Q?DaXog2GhzAHJPU8+TPHhlc1BgIWRgLSMNvIPHCSfZT5IWWtbyw+DQabvZkgE?=
 =?us-ascii?Q?LoYM0vVmzgiiWQjXfgYhEThLsJzVW/8/0QOknw+sO2pOo5dRZ7xcJ9K2HRY3?=
 =?us-ascii?Q?ROxzUP2C6HWypFVt1hatSaXd4wcjGelQJhmpCgsbKqHmf922A7STfjk8uGnH?=
 =?us-ascii?Q?leqQ6P+NyBcePUmH7pzrItudcvoLLf7M4jFzhfPAv8atnlYVoRtlH7FpFTXQ?=
 =?us-ascii?Q?4Ey66F8D8ExeK4zny6LykjejvA8jg1n8rd67FuJ2k23/wbAHp/5l/RVwarJr?=
 =?us-ascii?Q?rp4Cv2nmj1y9M4zvifofWVtoezXmHzKGF0bzmvbMJllUU8heIgai4KcJHWan?=
 =?us-ascii?Q?CgPi3IWijKO9Moc34Ib0ZPQ2+dxIGQWdbIt1NkqyMqKCKGqKJ/T/GOqz+NU7?=
 =?us-ascii?Q?C4YF04HpPiqKjL6IByrfsz8Oa9X/VBPdNOAViwxAXUxnug2vWDNlnPy/fJt+?=
 =?us-ascii?Q?CZXuDcju8v8SA3Oe3K9+7/0TfLnjw/lBN8x/FlGvcvNddw13/TZunhhBt99X?=
 =?us-ascii?Q?yuQGqkI4EY4SLbnU9XiYXoXuV6M7fDAw6mE5IuYfUbkJ4kqh2n7M4nYlePbv?=
 =?us-ascii?Q?a7AlbK9rVkFfWWSI1JWyCQGj//5CGQeKVPg167N28hjCKs7C4P+n2Ojkc8iK?=
 =?us-ascii?Q?7ym3GbsTcJCu9JULJY06sq0JjwVKXnB0tXcPwiP0w+i7ilxdyGSTjlCgEpH6?=
 =?us-ascii?Q?MvNFQT/acvh+IlobWGLVJ4xM4hdCOegStJXgxFPvuzbre+C/vqng0yX1NhxJ?=
 =?us-ascii?Q?GNpJIFGuYy6duQiwxS4JyE4p?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e564405-0fc1-46f2-67e4-08d8f02546e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 07:03:36.5243 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z8U9LYC29bYg+XYFNF+Wfmz/YRucKIxBScpvIqPWGc5oB8CRGqK53mDAHag7FVDxJ6xkZJj8qGAWJhGTgr6D/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2079
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Tarun Gupta <targupta@nvidia.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Wednesday, March 24, 2021 1:56 AM
> 
> The driver core standard is to pass in the properly typed object, the
> properly typed attribute and the buffer data. It stems from the root
> kobject method:
> 
>   ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,..)
> 
> Each subclass of kobject should provide their own function with the same
> signature but more specific types, eg struct device uses:
> 
>   ssize_t (*show)(struct device *dev, struct device_attribute *attr,..)
> 
> In this case the existing signature is:
> 
>   ssize_t (*show)(struct kobject *kobj, struct device *dev,..)
> 
> Where kobj is a 'struct mdev_type *' and dev is 'mdev_type->parent->dev'.
> 
> Change the mdev_type related sysfs attribute functions to:
> 
>   ssize_t (*show)(struct mdev_type *mtype, struct mdev_type_attribute
> *attr,..)
> 
> In order to restore type safety and match the driver core standard
> 
> There are no current users of 'attr', but if it is ever needed it would be
> hard to add in retroactively, so do it now.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/gvt.c    | 21 +++++++++++----------
>  drivers/s390/cio/vfio_ccw_ops.c   | 15 +++++++++------
>  drivers/s390/crypto/vfio_ap_ops.c | 12 +++++++-----
>  drivers/vfio/mdev/mdev_core.c     | 14 ++++++++++++--
>  drivers/vfio/mdev/mdev_sysfs.c    | 11 ++++++-----
>  include/linux/mdev.h              | 11 +++++++----
>  samples/vfio-mdev/mbochs.c        | 26 +++++++++++++++-----------
>  samples/vfio-mdev/mdpy.c          | 24 ++++++++++++++----------
>  samples/vfio-mdev/mtty.c          | 18 +++++++++---------
>  9 files changed, 90 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
> index 4b47a18e9dfa0f..3703814a669b46 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.c
> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> @@ -54,14 +54,15 @@ intel_gvt_find_vgpu_type(struct intel_gvt *gvt,
> unsigned int type_group_id)
>  	return &gvt->types[type_group_id];
>  }
> 
> -static ssize_t available_instances_show(struct kobject *kobj,
> -					struct device *dev, char *buf)
> +static ssize_t available_instances_show(struct mdev_type *mtype,
> +					struct mdev_type_attribute *attr,
> +					char *buf)
>  {
>  	struct intel_vgpu_type *type;
>  	unsigned int num = 0;
> -	void *gvt = kdev_to_i915(dev)->gvt;
> +	void *gvt = kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
> 
> -	type = intel_gvt_find_vgpu_type(gvt,
> mtype_get_type_group_id(kobj));
> +	type = intel_gvt_find_vgpu_type(gvt,
> mtype_get_type_group_id(mtype));
>  	if (!type)
>  		num = 0;
>  	else
> @@ -70,19 +71,19 @@ static ssize_t available_instances_show(struct kobject
> *kobj,
>  	return sprintf(buf, "%u\n", num);
>  }
> 
> -static ssize_t device_api_show(struct kobject *kobj, struct device *dev,
> -		char *buf)
> +static ssize_t device_api_show(struct mdev_type *mtype,
> +			       struct mdev_type_attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
>  }
> 
> -static ssize_t description_show(struct kobject *kobj, struct device *dev,
> -		char *buf)
> +static ssize_t description_show(struct mdev_type *mtype,
> +				struct mdev_type_attribute *attr, char *buf)
>  {
>  	struct intel_vgpu_type *type;
> -	void *gvt = kdev_to_i915(dev)->gvt;
> +	void *gvt = kdev_to_i915(mtype_get_parent_dev(mtype))->gvt;
> 
> -	type = intel_gvt_find_vgpu_type(gvt,
> mtype_get_type_group_id(kobj));
> +	type = intel_gvt_find_vgpu_type(gvt,
> mtype_get_type_group_id(mtype));
>  	if (!type)
>  		return 0;
> 
> diff --git a/drivers/s390/cio/vfio_ccw_ops.c
> b/drivers/s390/cio/vfio_ccw_ops.c
> index 06a82ec136080c..74fe21eceb66cc 100644
> --- a/drivers/s390/cio/vfio_ccw_ops.c
> +++ b/drivers/s390/cio/vfio_ccw_ops.c
> @@ -71,23 +71,26 @@ static int vfio_ccw_mdev_notifier(struct
> notifier_block *nb,
>  	return NOTIFY_DONE;
>  }
> 
> -static ssize_t name_show(struct kobject *kobj, struct device *dev, char *buf)
> +static ssize_t name_show(struct mdev_type *mtype,
> +			 struct mdev_type_attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "I/O subchannel (Non-QDIO)\n");
>  }
>  static MDEV_TYPE_ATTR_RO(name);
> 
> -static ssize_t device_api_show(struct kobject *kobj, struct device *dev,
> -			       char *buf)
> +static ssize_t device_api_show(struct mdev_type *mtype,
> +			       struct mdev_type_attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "%s\n", VFIO_DEVICE_API_CCW_STRING);
>  }
>  static MDEV_TYPE_ATTR_RO(device_api);
> 
> -static ssize_t available_instances_show(struct kobject *kobj,
> -					struct device *dev, char *buf)
> +static ssize_t available_instances_show(struct mdev_type *mtype,
> +					struct mdev_type_attribute *attr,
> +					char *buf)
>  {
> -	struct vfio_ccw_private *private = dev_get_drvdata(dev);
> +	struct vfio_ccw_private *private =
> +		dev_get_drvdata(mtype_get_parent_dev(mtype));
> 
>  	return sprintf(buf, "%d\n", atomic_read(&private->avail));
>  }
> diff --git a/drivers/s390/crypto/vfio_ap_ops.c
> b/drivers/s390/crypto/vfio_ap_ops.c
> index 6d75ed07bcd49d..cdc5edb0074690 100644
> --- a/drivers/s390/crypto/vfio_ap_ops.c
> +++ b/drivers/s390/crypto/vfio_ap_ops.c
> @@ -366,15 +366,17 @@ static int vfio_ap_mdev_remove(struct
> mdev_device *mdev)
>  	return 0;
>  }
> 
> -static ssize_t name_show(struct kobject *kobj, struct device *dev, char *buf)
> +static ssize_t name_show(struct mdev_type *mtype,
> +			 struct mdev_type_attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "%s\n", VFIO_AP_MDEV_NAME_HWVIRT);
>  }
> 
>  static MDEV_TYPE_ATTR_RO(name);
> 
> -static ssize_t available_instances_show(struct kobject *kobj,
> -					struct device *dev, char *buf)
> +static ssize_t available_instances_show(struct mdev_type *mtype,
> +					struct mdev_type_attribute *attr,
> +					char *buf)
>  {
>  	return sprintf(buf, "%d\n",
>  		       atomic_read(&matrix_dev->available_instances));
> @@ -382,8 +384,8 @@ static ssize_t available_instances_show(struct kobject
> *kobj,
> 
>  static MDEV_TYPE_ATTR_RO(available_instances);
> 
> -static ssize_t device_api_show(struct kobject *kobj, struct device *dev,
> -			       char *buf)
> +static ssize_t device_api_show(struct mdev_type *mtype,
> +			       struct mdev_type_attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "%s\n", VFIO_DEVICE_API_AP_STRING);
>  }
> diff --git a/drivers/vfio/mdev/mdev_core.c
> b/drivers/vfio/mdev/mdev_core.c
> index 71455812cb84cf..9ef1d5bed8069f 100644
> --- a/drivers/vfio/mdev/mdev_core.c
> +++ b/drivers/vfio/mdev/mdev_core.c
> @@ -47,12 +47,22 @@ EXPORT_SYMBOL(mdev_get_type_group_id);
>   * Used in mdev_type_attribute sysfs functions to return the index in the
>   * supported_type_groups that the sysfs is called from.
>   */
> -unsigned int mtype_get_type_group_id(struct kobject *mtype_kobj)
> +unsigned int mtype_get_type_group_id(struct mdev_type *mtype)
>  {
> -	return container_of(mtype_kobj, struct mdev_type, kobj)-
> >type_group_id;
> +	return mtype->type_group_id;
>  }
>  EXPORT_SYMBOL(mtype_get_type_group_id);
> 
> +/*
> + * Used in mdev_type_attribute sysfs functions to return the parent struct
> + * device
> + */
> +struct device *mtype_get_parent_dev(struct mdev_type *mtype)
> +{
> +	return mtype->parent->dev;
> +}
> +EXPORT_SYMBOL(mtype_get_parent_dev);
> +
>  /* Should be called holding parent_list_lock */
>  static struct mdev_parent *__find_parent_device(struct device *dev)
>  {
> diff --git a/drivers/vfio/mdev/mdev_sysfs.c
> b/drivers/vfio/mdev/mdev_sysfs.c
> index 91ecccdc2f2ec6..9b0f1a8757a0df 100644
> --- a/drivers/vfio/mdev/mdev_sysfs.c
> +++ b/drivers/vfio/mdev/mdev_sysfs.c
> @@ -26,7 +26,7 @@ static ssize_t mdev_type_attr_show(struct kobject
> *kobj,
>  	ssize_t ret = -EIO;
> 
>  	if (attr->show)
> -		ret = attr->show(kobj, type->parent->dev, buf);
> +		ret = attr->show(type, attr, buf);
>  	return ret;
>  }
> 
> @@ -39,7 +39,7 @@ static ssize_t mdev_type_attr_store(struct kobject *kobj,
>  	ssize_t ret = -EIO;
> 
>  	if (attr->store)
> -		ret = attr->store(&type->kobj, type->parent->dev, buf, count);
> +		ret = attr->store(type, attr, buf, count);
>  	return ret;
>  }
> 
> @@ -48,8 +48,9 @@ static const struct sysfs_ops mdev_type_sysfs_ops = {
>  	.store = mdev_type_attr_store,
>  };
> 
> -static ssize_t create_store(struct kobject *kobj, struct device *dev,
> -			    const char *buf, size_t count)
> +static ssize_t create_store(struct mdev_type *mtype,
> +			    struct mdev_type_attribute *attr, const char *buf,
> +			    size_t count)
>  {
>  	char *str;
>  	guid_t uuid;
> @@ -67,7 +68,7 @@ static ssize_t create_store(struct kobject *kobj, struct
> device *dev,
>  	if (ret)
>  		return ret;
> 
> -	ret = mdev_device_create(to_mdev_type(kobj), &uuid);
> +	ret = mdev_device_create(mtype, &uuid);
>  	if (ret)
>  		return ret;
> 
> diff --git a/include/linux/mdev.h b/include/linux/mdev.h
> index c3a800051d6146..1fb34ea394ad46 100644
> --- a/include/linux/mdev.h
> +++ b/include/linux/mdev.h
> @@ -47,7 +47,8 @@ static inline struct device
> *mdev_get_iommu_device(struct mdev_device *mdev)
>  }
> 
>  unsigned int mdev_get_type_group_id(struct mdev_device *mdev);
> -unsigned int mtype_get_type_group_id(struct kobject *mtype_kobj);
> +unsigned int mtype_get_type_group_id(struct mdev_type *mtype);
> +struct device *mtype_get_parent_dev(struct mdev_type *mtype);
> 
>  /**
>   * struct mdev_parent_ops - Structure to be registered for each parent
> device to
> @@ -123,9 +124,11 @@ struct mdev_parent_ops {
>  /* interface for exporting mdev supported type attributes */
>  struct mdev_type_attribute {
>  	struct attribute attr;
> -	ssize_t (*show)(struct kobject *kobj, struct device *dev, char *buf);
> -	ssize_t (*store)(struct kobject *kobj, struct device *dev,
> -			 const char *buf, size_t count);
> +	ssize_t (*show)(struct mdev_type *mtype,
> +			struct mdev_type_attribute *attr, char *buf);
> +	ssize_t (*store)(struct mdev_type *mtype,
> +			 struct mdev_type_attribute *attr, const char *buf,
> +			 size_t count);
>  };
> 
>  #define MDEV_TYPE_ATTR(_name, _mode, _show, _store)		\
> diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
> index ac4d0dc2490705..861c76914e7639 100644
> --- a/samples/vfio-mdev/mbochs.c
> +++ b/samples/vfio-mdev/mbochs.c
> @@ -1330,37 +1330,41 @@ static const struct attribute_group
> *mdev_dev_groups[] = {
>  	NULL,
>  };
> 
> -static ssize_t
> -name_show(struct kobject *kobj, struct device *dev, char *buf)
> +static ssize_t name_show(struct mdev_type *mtype,
> +			 struct mdev_type_attribute *attr, char *buf)
>  {
> -	return sprintf(buf, "%s\n", kobj->name);
> +	const struct mbochs_type *type =
> +		&mbochs_types[mtype_get_type_group_id(mtype)];
> +
> +	return sprintf(buf, "%s\n", type->name);
>  }
>  static MDEV_TYPE_ATTR_RO(name);
> 
> -static ssize_t
> -description_show(struct kobject *kobj, struct device *dev, char *buf)
> +static ssize_t description_show(struct mdev_type *mtype,
> +				struct mdev_type_attribute *attr, char *buf)
>  {
>  	const struct mbochs_type *type =
> -		&mbochs_types[mtype_get_type_group_id(kobj)];
> +		&mbochs_types[mtype_get_type_group_id(mtype)];
> 
>  	return sprintf(buf, "virtual display, %d MB video memory\n",
>  		       type ? type->mbytes  : 0);
>  }
>  static MDEV_TYPE_ATTR_RO(description);
> 
> -static ssize_t
> -available_instances_show(struct kobject *kobj, struct device *dev, char *buf)
> +static ssize_t available_instances_show(struct mdev_type *mtype,
> +					struct mdev_type_attribute *attr,
> +					char *buf)
>  {
>  	const struct mbochs_type *type =
> -		&mbochs_types[mtype_get_type_group_id(kobj)];
> +		&mbochs_types[mtype_get_type_group_id(mtype)];
>  	int count = (max_mbytes - mbochs_used_mbytes) / type->mbytes;
> 
>  	return sprintf(buf, "%d\n", count);
>  }
>  static MDEV_TYPE_ATTR_RO(available_instances);
> 
> -static ssize_t device_api_show(struct kobject *kobj, struct device *dev,
> -			       char *buf)
> +static ssize_t device_api_show(struct mdev_type *mtype,
> +			       struct mdev_type_attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
>  }
> diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
> index da88fd7dd42329..885b88ea20e234 100644
> --- a/samples/vfio-mdev/mdpy.c
> +++ b/samples/vfio-mdev/mdpy.c
> @@ -652,18 +652,21 @@ static const struct attribute_group
> *mdev_dev_groups[] = {
>  	NULL,
>  };
> 
> -static ssize_t
> -name_show(struct kobject *kobj, struct device *dev, char *buf)
> +static ssize_t name_show(struct mdev_type *mtype,
> +			 struct mdev_type_attribute *attr, char *buf)
>  {
> -	return sprintf(buf, "%s\n", kobj->name);
> +	const struct mdpy_type *type =
> +		&mdpy_types[mtype_get_type_group_id(mtype)];
> +
> +	return sprintf(buf, "%s\n", type->name);
>  }
>  static MDEV_TYPE_ATTR_RO(name);
> 
> -static ssize_t
> -description_show(struct kobject *kobj, struct device *dev, char *buf)
> +static ssize_t description_show(struct mdev_type *mtype,
> +				struct mdev_type_attribute *attr, char *buf)
>  {
>  	const struct mdpy_type *type =
> -		&mdpy_types[mtype_get_type_group_id(kobj)];
> +		&mdpy_types[mtype_get_type_group_id(mtype)];
> 
>  	return sprintf(buf, "virtual display, %dx%d framebuffer\n",
>  		       type ? type->width  : 0,
> @@ -671,15 +674,16 @@ description_show(struct kobject *kobj, struct
> device *dev, char *buf)
>  }
>  static MDEV_TYPE_ATTR_RO(description);
> 
> -static ssize_t
> -available_instances_show(struct kobject *kobj, struct device *dev, char *buf)
> +static ssize_t available_instances_show(struct mdev_type *mtype,
> +					struct mdev_type_attribute *attr,
> +					char *buf)
>  {
>  	return sprintf(buf, "%d\n", max_devices - mdpy_count);
>  }
>  static MDEV_TYPE_ATTR_RO(available_instances);
> 
> -static ssize_t device_api_show(struct kobject *kobj, struct device *dev,
> -			       char *buf)
> +static ssize_t device_api_show(struct mdev_type *mtype,
> +			       struct mdev_type_attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
>  }
> diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
> index f2e36c06ac6aa2..b9b24be4abdab7 100644
> --- a/samples/vfio-mdev/mtty.c
> +++ b/samples/vfio-mdev/mtty.c
> @@ -1292,23 +1292,24 @@ static const struct attribute_group
> *mdev_dev_groups[] = {
>  	NULL,
>  };
> 
> -static ssize_t
> -name_show(struct kobject *kobj, struct device *dev, char *buf)
> +static ssize_t name_show(struct mdev_type *mtype,
> +			 struct mdev_type_attribute *attr, char *buf)
>  {
>  	static const char *name_str[2] = { "Single port serial",
>  					   "Dual port serial" };
> 
>  	return sysfs_emit(buf, "%s\n",
> -			  name_str[mtype_get_type_group_id(kobj)]);
> +			  name_str[mtype_get_type_group_id(mtype)]);
>  }
> 
>  static MDEV_TYPE_ATTR_RO(name);
> 
> -static ssize_t
> -available_instances_show(struct kobject *kobj, struct device *dev, char *buf)
> +static ssize_t available_instances_show(struct mdev_type *mtype,
> +					struct mdev_type_attribute *attr,
> +					char *buf)
>  {
>  	struct mdev_state *mds;
> -	unsigned int ports = mtype_get_type_group_id(kobj) + 1;
> +	unsigned int ports = mtype_get_type_group_id(mtype) + 1;
>  	int used = 0;
> 
>  	list_for_each_entry(mds, &mdev_devices_list, next)
> @@ -1319,9 +1320,8 @@ available_instances_show(struct kobject *kobj,
> struct device *dev, char *buf)
> 
>  static MDEV_TYPE_ATTR_RO(available_instances);
> 
> -
> -static ssize_t device_api_show(struct kobject *kobj, struct device *dev,
> -			       char *buf)
> +static ssize_t device_api_show(struct mdev_type *mtype,
> +			       struct mdev_type_attribute *attr, char *buf)
>  {
>  	return sprintf(buf, "%s\n", VFIO_DEVICE_API_PCI_STRING);
>  }
> --
> 2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
