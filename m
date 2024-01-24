Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2593583B4D0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 23:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B5F910EA8E;
	Wed, 24 Jan 2024 22:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E666F10EA8E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 22:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706135810; x=1737671810;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GOSeZhRTJo+kJG/ox2Ei3ZfE0TkSMXRekq0wbgMFWcY=;
 b=lhy+v1Pjr2RavLsXsJ/Po879a2PND6enwqR0O4/0PpH4lXdG+yIxI/Ye
 ayzsSlR47c0CZCx+Cr6XEqtoWHcJJDeO2fe+2J/T+2Pxqqr78l346+Iot
 A9q1GvINiFXE5Mk6dml9OMJEHiBUPsCLwm/nekvpSsjQcQorxLyUaj0dH
 1YqaieLmpMSP9TNNPZKMStBo5apjlW9RAE31hknXElKSC3Y87qaTG9FQW
 OfV22cBqeVah/ivCDuQLZBC+rkOlMrs/zzCubE9fUqrUXCS87F7m5daQa
 ful+8N1ixE5RD+zTFE21JTxABYkixshO0wzEqvgOZLcEDAeT+Sgvh0ZyJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9375646"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="9375646"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2024 14:36:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2200079"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jan 2024 14:36:49 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 14:36:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Jan 2024 14:36:47 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Jan 2024 14:36:47 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 24 Jan 2024 14:36:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfPRts43H329O8FvfNAYEf+vWDdry4eAeNg7RTvc4jV3KHvwZfi2eJBdOvzjyBx5C9p8edISv9rjAy+gEYjadGgXOmY87laIhL2cat0xnAiY7H6F8W3huXq0whbdSc+WYGH2Q+kUFOP40z3X/x7AscrHT5ESg1rtpDNdDgYBP/vIyH3aEwX28vXwr0xfMIZ746b9Rb+EtBGU4wGYq3dere395RMpm0y5T7SewjYSucWOdAwOICLVvlnj1WUSb19l3MuzjK40NPzJu43MjaWm0Wbjp9Clflq4fKc7VHcfI9Nr7jua6ZfmwhsFo9ZVxDQutsPXmgEXSmg5N2o1XMD63g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5333MOUYoASUk1V30idXWjOzmj/FbK6+L+B0X6Yi9h8=;
 b=C94TwuCVpIWWMZ+iocdBey1we68NgCZkSwmmbOwaUKIwAf/+wq/vUQBUM2yYsZlPWmN9k5LG67IlCmqWtRDwmoiQhnfOB8q/pNtyeegwqc505VExNN85ffS+TdkaPwjnO3vOTtD9qSs0m8nz0ha0Q1TqDnHVrjTQrNftxQONs0lz+KGTs2X84/ECKb6K2ORqRw4qNdPDDOQcMOx7e4NU7MJHrMpsX9Dqxab1snSSKmeva/s30fGLMB7o5B8bncO3U6GJbPtmt/u2eVUq6j2/GSjsEgVWrvMayu1ATfQUegB0SE5v640SKCgfOd5xRxmtUGv5aypWHCwRKjqRuH+pEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by SA0PR11MB4592.namprd11.prod.outlook.com (2603:10b6:806:98::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.39; Wed, 24 Jan
 2024 22:36:40 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::cbc8:6370:5df2:b2df]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::cbc8:6370:5df2:b2df%4]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 22:36:40 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Andrew Davis <afd@ti.com>, Gerd Hoffmann <kraxel@redhat.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
 <christian.koenig@amd.com>, Paul Cercueil <paul@crapouillou.net>
Subject: RE: [PATCH 1/3] udmabuf: Keep track current device mappings
Thread-Topic: [PATCH 1/3] udmabuf: Keep track current device mappings
Thread-Index: AQHaTklQejyxD8ekVUytWta26SfJq7DpjYjQ
Date: Wed, 24 Jan 2024 22:36:40 +0000
Message-ID: <IA0PR11MB7185C76FC248EDDC5FBC49EFF87B2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20240123221227.868341-1-afd@ti.com>
In-Reply-To: <20240123221227.868341-1-afd@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|SA0PR11MB4592:EE_
x-ms-office365-filtering-correlation-id: 9622ae00-7b3b-454c-7a54-08dc1d2ceecf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZenmA9ojFlgqwtxzQi8Kklw0a5qSf0qzweNca1evOb62VsTKwgj2lJhr7hdr7EBOnZgw8Pu055lwY6Unq8sVPVBSUWX4scBN6/xpIXpRBuxe5qcDmcl5CSRfUspw0EfGO7mBwYKOvVrofXaj0s/E7SJE2dpxpfl97m3Yw8XQYcFTLdOOp8hkNjcbFwdwdOk9BXxJzOZjcOWwZXznrXwDSLwwyr2NOxhGt43NdX4LlQvjj2L2q73esCqUgqtBpnLuuyDi5Y9YHvBffEObShbNGuYoQ8Upldb4F2y4+fr+oJsZvvkE+iYVBrt5S7v6UN/0ylJojh16vUc3w1pPVA/0w+wg+7HEi00SGD4sSIqfGy5/jjZy9+Cl7O4wU/EkPHfBxAnEZ2kFs7F9y7ep0xCDVAImwEjdzqn94iy2/8ycHY9w7oB0c7zQnI6oAFYio0SFQSxJrUG5hTZwcwF9dTVjKf1jLeFGaQawTVzeTdMadwqZRRhFyjgZam9Q+9efnCyzBd6WwzzZMb+4pqVn7LYrfrBVgADIyWJUsW05GzoMmO+9Z5t6lMwOT9H2sjeBQfNlFbTK2/cSRepLC7s6i0CJBhU3IqygDV+PFz7MTl+BzIk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(346002)(366004)(396003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(55016003)(83380400001)(41300700001)(86362001)(33656002)(82960400001)(38070700009)(122000001)(38100700002)(9686003)(2906002)(26005)(71200400001)(66946007)(66446008)(316002)(64756008)(110136005)(6506007)(66556008)(4326008)(7696005)(52536014)(76116006)(54906003)(66476007)(478600001)(8676002)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?jPLRuqTEA1Kw2GxJksSXiKvkMiYvSHWrg2dBsJlTB8VUQ4xdMGr3Ojo0G2?=
 =?iso-8859-1?Q?trVc1Ijah0fG1jFyPuX2Dm8sao56vR7U4AUb8LTiEBCuWPPpc62kLestn8?=
 =?iso-8859-1?Q?/aeOV493/JuAXsZyxXFNj5OcqFQXQdEc2A8OGYpa3a3APIckXVS6zJt+rw?=
 =?iso-8859-1?Q?Q4bGla8XC2saMqI+5Mk9wix/ZDSPz1lxE9ZXekXVD+k7inLvH6JL/+fJEZ?=
 =?iso-8859-1?Q?oA3FfBDbzFfXyb5tuKihNbmqtTJTR9nqirifY43VmTqmcdLF2XYzS5k+81?=
 =?iso-8859-1?Q?ykAMhx7i5V4KKJqByhvCyhnQxLQkenpCtPsxtdbE221Iy9GMaJsCjlgr4z?=
 =?iso-8859-1?Q?7E7Jr+iWFnuIGdU1XJo8Sy/c6ka/c1t0iXYsXRRbVO5a28Me7DsCXVMBSU?=
 =?iso-8859-1?Q?bmo/NDjnape2TPhbifm6LmAFm30DSBpK58rkhFEVa0B1YZB0QOXa52QKjO?=
 =?iso-8859-1?Q?etMhgAeYAAcPWVu+8t9ZRnbkub7VCPxO9zA33goCVJdE4v+42ji5b3HwN2?=
 =?iso-8859-1?Q?z4P0jDd6ObR1UAeHbmiFU0YpkpzQxI7V6nCPwngotPw9UWUkygiooYdLFz?=
 =?iso-8859-1?Q?fBOJIjEM285DOrVid7nyzDo+WLMWRMCOJFGorSESsg1YCaGNdMyfJ4O1wD?=
 =?iso-8859-1?Q?EC0PSOuN5aoXoCwkeoD8KuacenUlUhYdimJxuU6zP+I5csdP6U+6lFG0vE?=
 =?iso-8859-1?Q?94YJPO1Z0uDfcnSP1u6wHNFC+IPLFN+OTbbBFUeTOdhbos55mj9TQOzul3?=
 =?iso-8859-1?Q?92py+mBYNvOs3tnftNEwWKZgkKiC56qzOKkZzO4K1f+/V3XVIt798Di9XP?=
 =?iso-8859-1?Q?PEOA+WLv92cDH46T44j/zE54jOl1NfRxJHNcFXhn5ACtq1iG4ip08r723R?=
 =?iso-8859-1?Q?HK06CqvihiFRveaUCYe0yBfZg3djVMnjhTackeVlBgmlvZuVs1IGK8OXOJ?=
 =?iso-8859-1?Q?qE8F7crviG0vaVvDKMQcLuW01Fh+LnpJxlZTptUu2xN/x0uDkZpWC31Wff?=
 =?iso-8859-1?Q?/aiq1SZmh0YbLQyWx44QpIU6SPGNqaofOpvlhO0ka/IOUcPn336bkTLWPG?=
 =?iso-8859-1?Q?MZZGLjtmC7bpXvi7X4NaAPdo+Glsmex/hvwoq54gOddkQo/kmOIDjLkZWn?=
 =?iso-8859-1?Q?Pv6MDOOIQ55xBEVz0S3Wd+qHng92UU0WRW2XEhF+xnOyR7dLE1UMyJo0zU?=
 =?iso-8859-1?Q?AujIOP9r8ZN8yyob0VbY1Nk/dbFQb76ViKRYoNC7c9sWCTGK+dolGktCSx?=
 =?iso-8859-1?Q?O+uPVWqlvHxKuywzT7ifSt26kDut9MwBJ4zJVBj6gam/vwcZzzWQNj2btJ?=
 =?iso-8859-1?Q?5eXqXJ8iF5w1oe9+Rd2OIDsZHz4NX5628lCFcikBs1xjhKnJosFPkZlUA4?=
 =?iso-8859-1?Q?J1jA5F7t0vfn59+KsIen9/wHj9Nxsw8ZQOcE7l7wM90G5U7am/yH43vFXM?=
 =?iso-8859-1?Q?DyzYb/bHj85PJc4ehwP5VRr9tesmVba2OzuV+Mw3+fjE3jhGnE7OtPAfO+?=
 =?iso-8859-1?Q?WAH4S3THDkx5EcIoV+0pwzVvxVICbR+Fie3GYPZBd5qDa1wHMifNeBuMfF?=
 =?iso-8859-1?Q?e1lAgSPfc1WLJ5AwcEvDqiMUpVq99Mh0g5Rh1nHuGpB+hlw1Dbpdzoz7m7?=
 =?iso-8859-1?Q?t5KfrrfdcSoNJPgCwnsh8jG5RtLafJKgWJ?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9622ae00-7b3b-454c-7a54-08dc1d2ceecf
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 22:36:40.2025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jm7OM9ozEW8uOWYgEOtAltCCfIenk0hjKXLr/KQ457jKDYifKf7m2azRzvgIEqHk0OsLGA194B8/pUjyHGNQ1rkUdWD2fW/t2uEBR2QWW+4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4592
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
Cc: "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrew,

> When a device attaches to and maps our buffer we need to keep track
> of this mapping/device. This is needed for synchronization with these
> devices when beginning and ending CPU access for instance. Add a list
> that tracks device mappings as part of {map,unmap}_udmabuf().
>=20
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  drivers/dma-buf/udmabuf.c | 43
> +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
> index c406459996489..3a23f0a7d112a 100644
> --- a/drivers/dma-buf/udmabuf.c
> +++ b/drivers/dma-buf/udmabuf.c
> @@ -28,6 +28,14 @@ struct udmabuf {
>  	struct page **pages;
>  	struct sg_table *sg;
>  	struct miscdevice *device;
> +	struct list_head attachments;
> +	struct mutex lock;
> +};
> +
> +struct udmabuf_attachment {
> +	struct device *dev;
> +	struct sg_table *table;
> +	struct list_head list;
>  };
>=20
>  static vm_fault_t udmabuf_vm_fault(struct vm_fault *vmf)
> @@ -120,14 +128,42 @@ static void put_sg_table(struct device *dev, struct
> sg_table *sg,
>  static struct sg_table *map_udmabuf(struct dma_buf_attachment *at,
>  				    enum dma_data_direction direction)
>  {
> -	return get_sg_table(at->dev, at->dmabuf, direction);
> +	struct udmabuf *ubuf =3D at->dmabuf->priv;
> +	struct udmabuf_attachment *a;
> +
> +	a =3D kzalloc(sizeof(*a), GFP_KERNEL);
> +	if (!a)
> +		return ERR_PTR(-ENOMEM);
> +
> +	a->table =3D get_sg_table(at->dev, at->dmabuf, direction);
> +	if (IS_ERR(a->table)) {
> +		kfree(a);
> +		return a->table;
Isn't that a use-after-free bug?
Rest of the patch lgtm.

Thanks,
Vivek

> +	}
> +
> +	a->dev =3D at->dev;
> +
> +	mutex_lock(&ubuf->lock);
> +	list_add(&a->list, &ubuf->attachments);
> +	mutex_unlock(&ubuf->lock);
> +
> +	return a->table;
>  }
>=20
>  static void unmap_udmabuf(struct dma_buf_attachment *at,
>  			  struct sg_table *sg,
>  			  enum dma_data_direction direction)
>  {
> -	return put_sg_table(at->dev, sg, direction);
> +	struct udmabuf_attachment *a =3D at->priv;
> +	struct udmabuf *ubuf =3D at->dmabuf->priv;
> +
> +	mutex_lock(&ubuf->lock);
> +	list_del(&a->list);
> +	mutex_unlock(&ubuf->lock);
> +
> +	put_sg_table(at->dev, sg, direction);
> +
> +	kfree(a);
>  }
>=20
>  static void release_udmabuf(struct dma_buf *buf)
> @@ -263,6 +299,9 @@ static long udmabuf_create(struct miscdevice
> *device,
>  		memfd =3D NULL;
>  	}
>=20
> +	INIT_LIST_HEAD(&ubuf->attachments);
> +	mutex_init(&ubuf->lock);
> +
>  	exp_info.ops  =3D &udmabuf_ops;
>  	exp_info.size =3D ubuf->pagecount << PAGE_SHIFT;
>  	exp_info.priv =3D ubuf;
> --
> 2.39.2

