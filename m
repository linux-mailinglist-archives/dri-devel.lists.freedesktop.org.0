Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E92F34A170
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 07:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2CF6EEA9;
	Fri, 26 Mar 2021 06:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C6FE6E193;
 Fri, 26 Mar 2021 06:09:59 +0000 (UTC)
IronPort-SDR: 57TbRBKd64R3QMD8VPnqvj35QgY9qXHq+XVOjJl37Sle1OQmhjFewLvX3ClFhHwzqhVsZ3GM17
 NKEFAmR/vBBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="178635742"
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; d="scan'208";a="178635742"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2021 23:09:58 -0700
IronPort-SDR: 5/+kBjE5P15XA6Oz/SOYfUpozk7IHTVpw09bWeu7MP8vIQFVFWld0BcXABKu4vybVaUI0pl/fn
 6WqAtV98x2Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,279,1610438400"; d="scan'208";a="375363979"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
 by orsmga003.jf.intel.com with ESMTP; 25 Mar 2021 23:09:58 -0700
Received: from orsmsx604.amr.corp.intel.com (10.22.229.17) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 25 Mar 2021 23:09:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Thu, 25 Mar 2021 23:09:58 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Thu, 25 Mar 2021 23:09:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jjl/t7w/pCAop9bamzuQE5afEyNNBUie5/dzyHlDtdVwWakeMu/uEKiZ4GGFu8sNdeP2vv9779fsD+04g31iW3zkwDOxGk3AcmJBV9o9ptKvAxTe/xqoovdsmw9YHOm1MvwpN61H4x/v/pR6f9YxdzAMyyCS5BmJU0Y3ANQ/IViqbQtGHY1bcKL2zu6hGK5voIRx8J87DhTej8V9t/9NNfNkJpYfvKkMChyeIZRNZaoc3mop0czr2syPy58g43pB9tNkmP2RNKjt9O8R8VhyNoLpvbbQhc3v2bmaA3DtNNVw+LeD7SRPwnQhCJKWg+QN7o7qzw4FBihaIAjYlhI9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMV4ozLBoa0vwljzz5uTYr/uM1qj8rpBGYd/Td6vMPg=;
 b=gSQr2DK2L+vpkNTuUjt3ohUe+7cz9/wIiqanelLQotePUVXQcoF1Y3CgSnHDoiJi0UjPnQ2SVErBp+HCdTiopEWpHXsYRmhEiNL1vtIbzAJMalhHfEIwMXyjMXG7+TesD1Sqf3OIR3QnddHrw9n3pY7GPAVPdqn9x5i/SDPoIwRdRzM7AOBkGUlSe/v3kIGCRtaGTBMjowGbN7Fy9HNJAqmATmd6xB4GjOJYE9qQCrZQuLP7eIQ6F/FpQTbf+/TYH3CKkNyFTC8mM/j3c9Zgtc6CTFg8xMKODhB5HP0+JZk0rVCnyhm44vT8k2Aqr2ssdD7A5AUsuYbsuOZRPg1NoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMV4ozLBoa0vwljzz5uTYr/uM1qj8rpBGYd/Td6vMPg=;
 b=NtFKMcfNE/tuodEUQHY5McPO9l6K1YfnFAnWwfzDVUoAnZmbsKJU/4epEWvf/BJ54HQrAiVf61NJwuoIPAZAj5y2jqPhdvIbOcR5rQ2DvYCfXd7xrxNJroGMqk4kdez/tD17G7px1mx+2+wRgQAhJpw/WLY25X0itInNRm+uqIc=
Received: from MWHPR11MB1886.namprd11.prod.outlook.com (10.175.54.9) by
 CO1PR11MB4946.namprd11.prod.outlook.com (20.182.139.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.24; Fri, 26 Mar 2021 06:09:55 +0000
Received: from MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29]) by MWHPR11MB1886.namprd11.prod.outlook.com
 ([fe80::75b0:a8e9:60cb:7a29%9]) with mapi id 15.20.3977.026; Fri, 26 Mar 2021
 06:09:55 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-gvt-dev@lists.freedesktop.org"
 <intel-gvt-dev@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>
Subject: RE: [PATCH 16/18] vfio/gvt: Use mdev_get_type_group_id()
Thread-Topic: [PATCH 16/18] vfio/gvt: Use mdev_get_type_group_id()
Thread-Index: AQHXIA7IxuUOLXPBnUqOWPPZvZ1YgKqVy4bw
Date: Fri, 26 Mar 2021 06:09:55 +0000
Message-ID: <MWHPR11MB1886BA46DBD0C4F98087B2978C619@MWHPR11MB1886.namprd11.prod.outlook.com>
References: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
 <16-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
In-Reply-To: <16-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
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
x-ms-office365-filtering-correlation-id: 523089f1-b325-4a53-c59f-08d8f01dc71a
x-ms-traffictypediagnostic: CO1PR11MB4946:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CO1PR11MB4946CD4D2AC2AF209A6E03A68C619@CO1PR11MB4946.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1247;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: s5gap0lPNleiqs35urzZgY9gc/RBCi4FkQyrgLwe6A/G8+suF5sowxDTuQ28WYc6xAzFc1XDUh7L6Pt03CGVCL7vw/3gMCj6sYQ1fR4fvZuvTQq2cgBf5pH/azZX8CQUyZAtP5QJrFPp6ea8cPbxChYdWdrU2TSts5ine+ZvY4J2CeEkkdTibKxM2nr7rC9mYpAiT5cILAMwTAge3BUJDF6uPGB8Kfh+KV8M5XXGP3wRTt+FdN5XaW5w9LtIOhK0jeVpwhIU0dSq/Xw9dT8XwlRk4p+yMlL7M2es0KBLK7Muf+YuU+ebZlQ7pFO85MHDSMrvQnleuYzCvfjjYrVe9l1CqvLc7WCSo60k09NKNmb+ySAbMHJj40k8qwlKA4Yk0XWWTGOGiEn1BcngU6HVGAUvHIrn1o7zVZ9i29/0rRfqsn+OAYH7MNv7A8LbozZJUUhOEOw87iHF94OrRf6o1Sheb+XBpROktQiZH7H4/3HgavyDcw7PQ07glP0i1OSQrkHVaGeV8SbHrozYgjjVArWaA57KkfFLWTcFXeZCrJM5oSHnLb0I9XkHcCg4oiCN3FQ7nk5pYTJigcxKaP5H6hSYrrhsVttOJ4bn7TQyIGU6sOhU0374vQzsdWac3aHq+fDKHAyB+Rf8yS5G2ehmY+BPngNsmQfEfkaJ4j7z69xL4yxqllaXwD6TrpqtU1GqNPpjjkfD/JXJoL5T6z32Hg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR11MB1886.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(376002)(346002)(366004)(39860400002)(110136005)(316002)(54906003)(921005)(8676002)(8936002)(966005)(33656002)(7696005)(6506007)(86362001)(83380400001)(66946007)(66446008)(64756008)(66556008)(66476007)(71200400001)(9686003)(7416002)(76116006)(2906002)(52536014)(5660300002)(55016002)(186003)(26005)(478600001)(4326008)(6636002)(38100700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?Vup0KreOa0ZQPoRbchYaHK9KJ7dQr16iBk0MFT5qGH0AekfdKKoiNIM+L4lE?=
 =?us-ascii?Q?0gB7Tk1tht5VrlxtZ0kOwyzF7dMx6u1Lg07Xef+YJNvpdB6QLN6Hd1Tahsf2?=
 =?us-ascii?Q?V6NpsI9l+AqUDGwgSMEh3AOdO2lG9zMiNxvHWidfSe2SaWjFLKmaOTDvl2sG?=
 =?us-ascii?Q?+ZAvht5nI470zix+KS0L3ZUCDu1jWiE1bJvzY/HwbUTeNWKTEsAe9GxeKV0/?=
 =?us-ascii?Q?O75oD6nhXfM1n1AbWaC2tjCB8VgppuJIF1pGV/h/ekO/vAbbVywJETdn+iNW?=
 =?us-ascii?Q?StvITLAAOPfEMWVlNRLvxzasWAL26onpaG6ec9a6UOIi2Fa/UphMIYnlHVWt?=
 =?us-ascii?Q?Qc6CdJxZS7Dl+9K3ssAHI9oTzhqvuayukDqfECEqRPhJ1hPad0vF1TFYpDXG?=
 =?us-ascii?Q?LRpAy9g8cjZUfLIf5WxYW/Bck5hHC+ybbdw4X608XGW2O4BA+pR4ny1RHmjg?=
 =?us-ascii?Q?WBGBpvNi76fkJODOPTJpjwi/a82x9awrJBug/reCcbWyWLNAvFNZHf5J+i7a?=
 =?us-ascii?Q?fIiLkB4VzfzybXexxivdmvaU8vnUarPlGKfY4tEYR96OGCwhFsdb4f8ZfztQ?=
 =?us-ascii?Q?rwz+9Wy8oKAC//X1MhsaqXnmELpwgyqmc4UZNCF85r48m5LzDrAcWSB+FMbS?=
 =?us-ascii?Q?nt3528bmz8xEtSo8NwjYimEu8SiVo+tRhMk56yG7lBuG+sozRK4xEsBKY02O?=
 =?us-ascii?Q?cqdf/4jPg71RdKY/wxzBW4+w1GbhHJRkWaXIZ4Ml+B5sbIIjlykbKQ4/ecW3?=
 =?us-ascii?Q?CGgi4cLuSye1XjBTah19mLpqCBtB2stWsNHFEsR+kYcbZmxwZvol7ZZp8TWc?=
 =?us-ascii?Q?e/UaIyQx0QTAU1tMdJV6SqFH0ZkxX7GOgwPmWJmgm9v6j0qLTR0wV0/iOf4O?=
 =?us-ascii?Q?J7w7leK2LwJsWrdIT/AVPIA9r/eC14rPmsFVg8lCSbY5CMiejt36bKOLjhJz?=
 =?us-ascii?Q?ouXXhWJnegf7+MmrBzQ6t2CxtQTCAkUMsobrMjnsmzPOwXLr00Foy2vJvql5?=
 =?us-ascii?Q?AlEKdXz/tlY+iyx2D+lxlmJxkBGrVQpG4F9nOq10rQT7fAwjeHdf57HG/uEe?=
 =?us-ascii?Q?bs4vRL32SSustLHCOo7n83eQt2/v39qisRL9PJlt5u5p4KbWQheiGfjiypCb?=
 =?us-ascii?Q?CKPI07LPD8V81zoZowI1XhHiF/jugZm1jOWEA4RfWGfEaBhJcgmMEq7l78cy?=
 =?us-ascii?Q?YTWf9QR8JssiVeasoedH5yTLc14IkscBQKKZhLEj0AsXoc+aeE/937Ztcyrc?=
 =?us-ascii?Q?K4yGOLALk+X1r26ufG/yn7WXO5fKBInQy+J/zbERN9Qd3beWnuVOkisNTEOG?=
 =?us-ascii?Q?pbDN7C++S9+wiL8QBpaImcrd?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR11MB1886.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 523089f1-b325-4a53-c59f-08d8f01dc71a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Mar 2021 06:09:55.6624 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G678f13LVOy6MO9vMtGfpNXnTKBbXv6R4vwqWWRNrnHaEw80IqBoqEEj6poGhb7EvMrGWC9E6k2q5Ug2XrAu1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4946
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

> From: Jason Gunthorpe
> Sent: Wednesday, March 24, 2021 1:56 AM
> 
> intel_gvt_init_vgpu_type_groups() makes gvt->types 1:1 with the
> supported_type_groups array, so the type_group_id is also the index into
> gvt->types. Use it directly and remove the string matching.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>

> ---
>  drivers/gpu/drm/i915/gvt/gvt.c   | 24 +++++++-----------------
>  drivers/gpu/drm/i915/gvt/gvt.h   |  4 ++--
>  drivers/gpu/drm/i915/gvt/kvmgt.c |  5 ++---
>  3 files changed, 11 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.c b/drivers/gpu/drm/i915/gvt/gvt.c
> index d1d8ee4a5f16a3..4b47a18e9dfa0f 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.c
> +++ b/drivers/gpu/drm/i915/gvt/gvt.c
> @@ -46,22 +46,12 @@ static const char * const supported_hypervisors[] = {
>  	[INTEL_GVT_HYPERVISOR_KVM] = "KVM",
>  };
> 
> -static struct intel_vgpu_type *intel_gvt_find_vgpu_type(struct intel_gvt *gvt,
> -		const char *name)
> +static struct intel_vgpu_type *
> +intel_gvt_find_vgpu_type(struct intel_gvt *gvt, unsigned int type_group_id)
>  {
> -	const char *driver_name =
> -		dev_driver_string(&gvt->gt->i915->drm.pdev->dev);
> -	int i;
> -
> -	name += strlen(driver_name) + 1;
> -	for (i = 0; i < gvt->num_types; i++) {
> -		struct intel_vgpu_type *t = &gvt->types[i];
> -
> -		if (!strncmp(t->name, name, sizeof(t->name)))
> -			return t;
> -	}
> -
> -	return NULL;
> +	if (WARN_ON(type_group_id >= gvt->num_types))
> +		return NULL;
> +	return &gvt->types[type_group_id];
>  }
> 
>  static ssize_t available_instances_show(struct kobject *kobj,
> @@ -71,7 +61,7 @@ static ssize_t available_instances_show(struct kobject
> *kobj,
>  	unsigned int num = 0;
>  	void *gvt = kdev_to_i915(dev)->gvt;
> 
> -	type = intel_gvt_find_vgpu_type(gvt, kobject_name(kobj));
> +	type = intel_gvt_find_vgpu_type(gvt,
> mtype_get_type_group_id(kobj));
>  	if (!type)
>  		num = 0;
>  	else
> @@ -92,7 +82,7 @@ static ssize_t description_show(struct kobject *kobj,
> struct device *dev,
>  	struct intel_vgpu_type *type;
>  	void *gvt = kdev_to_i915(dev)->gvt;
> 
> -	type = intel_gvt_find_vgpu_type(gvt, kobject_name(kobj));
> +	type = intel_gvt_find_vgpu_type(gvt,
> mtype_get_type_group_id(kobj));
>  	if (!type)
>  		return 0;
> 
> diff --git a/drivers/gpu/drm/i915/gvt/gvt.h b/drivers/gpu/drm/i915/gvt/gvt.h
> index 03c993d68f105a..0cf480f42850d2 100644
> --- a/drivers/gpu/drm/i915/gvt/gvt.h
> +++ b/drivers/gpu/drm/i915/gvt/gvt.h
> @@ -569,8 +569,8 @@ struct intel_gvt_ops {
>  	void (*vgpu_reset)(struct intel_vgpu *);
>  	void (*vgpu_activate)(struct intel_vgpu *);
>  	void (*vgpu_deactivate)(struct intel_vgpu *);
> -	struct intel_vgpu_type *(*gvt_find_vgpu_type)(struct intel_gvt *gvt,
> -			const char *name);
> +	struct intel_vgpu_type *(*gvt_find_vgpu_type)(
> +		struct intel_gvt *gvt, unsigned int type_group_id);
>  	bool (*get_gvt_attrs)(struct attribute_group
> ***intel_vgpu_type_groups);
>  	int (*vgpu_query_plane)(struct intel_vgpu *vgpu, void *);
>  	int (*vgpu_get_dmabuf)(struct intel_vgpu *vgpu, unsigned int);
> diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c
> b/drivers/gpu/drm/i915/gvt/kvmgt.c
> index b4348256ae9591..16e1e4a38aa1f6 100644
> --- a/drivers/gpu/drm/i915/gvt/kvmgt.c
> +++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
> @@ -700,10 +700,9 @@ static int intel_vgpu_create(struct kobject *kobj,
> struct mdev_device *mdev)
>  	pdev = mdev_parent_dev(mdev);
>  	gvt = kdev_to_i915(pdev)->gvt;
> 
> -	type = intel_gvt_ops->gvt_find_vgpu_type(gvt, kobject_name(kobj));
> +	type = intel_gvt_ops->gvt_find_vgpu_type(gvt,
> +
> mdev_get_type_group_id(mdev));
>  	if (!type) {
> -		gvt_vgpu_err("failed to find type %s to create\n",
> -						kobject_name(kobj));
>  		ret = -EINVAL;
>  		goto out;
>  	}
> --
> 2.31.0
> 
> _______________________________________________
> intel-gvt-dev mailing list
> intel-gvt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gvt-dev
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
