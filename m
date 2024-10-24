Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956F99ADBB4
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2024 07:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E5110E070;
	Thu, 24 Oct 2024 05:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8oxHqp5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1074710E070;
 Thu, 24 Oct 2024 05:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729749532; x=1761285532;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kPmr17ZNnNGB+0Yo0Q0jKleUgWfukV1sh7ENeStYPdk=;
 b=Q8oxHqp5qKhCQlpNmUEwAFU/7SoIdEhaANaAo3RcaGZ4Rp4yc1HywF/f
 U06gZuiVWM3kEyAwQz//TydKhGqaxyQ/KDR59nE5pZIPzh02BOz/ePYqV
 /tJ/6pBtKW/OF3HKIjgt4ncImFUgVI0m8KRrEaX/WulKVtJra4WYL6vCp
 DZYSCVgs0idMLhLdHZ0RXiXWv8iCEqf2o9Ew/W4Og32QnW7uOveBwcQaS
 0FAld4XzWM2UnhUoHooSr0ZlT702DDO3QpkJblOD940pp8dgSCHA9/cQW
 5+FBkGFVC/4WKYGCMzHLGXJdf34oHhnkhPqiaM402AFT7428YeDdbfbJ6 Q==;
X-CSE-ConnectionGUID: MELlyF1WRsCPr02oC1jgtg==
X-CSE-MsgGUID: xxuQ64D/RfOrYeYgKxuF/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29139866"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29139866"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 22:58:52 -0700
X-CSE-ConnectionGUID: u+mjQOQVQQ+orJ28hbS2+w==
X-CSE-MsgGUID: 8muqQg4ZSfyKlh8eXlNLNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80409048"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 22:58:51 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 22:58:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 22:58:51 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 22:58:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yFTvYpVf7XaPQNiAS1z6p+zri+I+44gjBT7k+xm8HH1Ra4G49uNkbVh2OKO253tqF49wl/ktKm36eBDMkHaAthC1jgZp0Qrq4ek0Ggb1F9hAu5+dMQmEgWmJghGb+kPyr8S/PHyUPUB7DT8GyNLS2s7B8e9YJj690f4A2TOM+jF04UghKVQVKMZdy4sYB2Emmv9KZnk1WMrjgGFlmlGgqtqgSlr+LA5uL/FUvrtjTcxvv0KbLa2NWcXzEGY2FXO0lIxmbfiF8m0KpK243rtdgwkOrJK/osv6AmCQyEgo+D0PujaeFfsoF/BkNnoTmyr1shezFrsTFsOvPbfzZwKzUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Et++NWQ06xuzarKkV2wOXRkvQ4ApUhPxa/ag5qpGZb0=;
 b=r3m/D4rfp/2VQrmkl6+Ql4YvQouEYereEk1eOMxN/DEhFVKmZHoCcyPIAxqSq/3699evVmlz3JsSQxHNKrOlQOgEH9VfWG+cYK4BbZeGvWVCXYHj6LJWfrRwEeoUXDxBHvSX218b1uZXjIgCZrztC5KLuR3doDIc91uOtayI3hcXHXt70pZHmVrFA/FJRd3LOBdPeF4jFH+dKSF73S/0aEmiXJG2w32GbjTb72dMXc+mT1BCo2ePIFi1GKAv8o9c+jRqF3YFMZvtgHdrkfhIlYT2rdYv7WF/qT1JktcTe50J7T5Qvy4Rs/8f0TW53Eue6A5yki9Wcd2IYmGAZW1LSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by DM4PR11MB7254.namprd11.prod.outlook.com (2603:10b6:8:10e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 05:58:48 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%5]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 05:58:48 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Bjorn
 Helgaas" <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: RE: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Thread-Topic: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for functions
 of same device
Thread-Index: AQHbI3yK84LIcNeUG0KOOkjZ4cDCubKS47QAgAKA/4A=
Date: Thu, 24 Oct 2024 05:58:48 +0000
Message-ID: <IA0PR11MB71853199C12F60897CDE80D4F84E2@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20241021052236.1820329-2-vivek.kasireddy@intel.com>
 <20241022151616.GA879071@bhelgaas>
In-Reply-To: <20241022151616.GA879071@bhelgaas>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|DM4PR11MB7254:EE_
x-ms-office365-filtering-correlation-id: 3cf2fbcd-3dd6-4bb8-df33-08dcf3f0edd3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?KF62fTQgFuAZgfp1ztZSmpGGM9Jih+mCVbKzacQBs0S4wsZCQa5gDxUDvCzD?=
 =?us-ascii?Q?Ao1DjVgmuOhidNpNKInphj8t+8eqC9X9RgcdKrUYyxLvgT6eft6zehxdUS/0?=
 =?us-ascii?Q?wFMO0RFSTA3w0P6KXvS0ZZPOgJHI80CT4ROXGneDIzlCNarcbJ7b2Z+7ZkI/?=
 =?us-ascii?Q?6On/nNTm1ZQfX4nKx5ZA/zkCo6qBULl54XvMm1EqfsERUdzWnSSMJLB3XyGt?=
 =?us-ascii?Q?aKNzGtOpBIZx89wqW5PMkzyqqbEjW9Xh+H24B6XnpeUYBnWBPtYxcysdab7w?=
 =?us-ascii?Q?zL/kbxnDigPqef/KcY30dCGEQgHweI55z6NeVsaZQjUL07JdOIIjF0bH136r?=
 =?us-ascii?Q?y1iKFohYD6seUd2DKvlTW2X6FbRU8fJOw2rOZI+AhkRE8pagt9SJRvQfapuy?=
 =?us-ascii?Q?8xBmqdH19fN/OvkVKyW1/lZKzc1q5tBzNShPrNvDbbhPVd/0JG8STqMY1Lzj?=
 =?us-ascii?Q?4rWt3o9BzIbpoYfc9Tv96hf/fB30y6zSw2T38TqMq8/8Jcb0cp372P6V0Zt6?=
 =?us-ascii?Q?mr1zOyCccXP5qBM9gc3dtaipdexr6dyGu1lhc/q7CzoI7v9ZpZKmgmOffXyf?=
 =?us-ascii?Q?WenEdFZKLDKJVJ4y7uKqh/UxGu+hOZHBUEgAoT8lYNAdcbum+qrqSf+GhloJ?=
 =?us-ascii?Q?WWwBLBNx4wpvUP63pMlyfFoZOIH5COPvJp2hp7h6XF01VpC28535La9byEl2?=
 =?us-ascii?Q?AvvWiVU4XE3q+cxQy8KH4cInI6LegjWfkPEwFiHh8UDcrAEhdY3k6p1GdUFW?=
 =?us-ascii?Q?6hY4AaWjUSlYbC04sa2n2NEJsXNVGa/ynvByCHsUxdbK/kw42LzEpBCcqdCW?=
 =?us-ascii?Q?99TBALdSqRNwPP0Pqsc6E8sox3CYFZF0QpmLkotne4IPVKGNmd1IKhTZTqHe?=
 =?us-ascii?Q?sWXG9Rn8ZAbxVxWLcGNP1bokGv6TBx3x+a38oe6Ns6JRJ2hnQxMp05XyY4+6?=
 =?us-ascii?Q?C72iZ7E/wSpomazbWDVa8gjBd3cCbUxZTShBLCnvg1O5kyEw6+3s/VSF/riR?=
 =?us-ascii?Q?tR2c45CXBTFKD+/7imR6nChfW0QvV63u1nzFVw/44t+/7DzRf0UbANs3wJXv?=
 =?us-ascii?Q?RhyIysGe1rHEJVNurhWxoyU1kAqFYpcf+fHhsSMW67/OIrNq/MTHNwGP8x5Q?=
 =?us-ascii?Q?K5gFvBclQmSfUcFlfcvK1nVBsyD1kInNFGcbGjsUH2+phqAT0TnVbU+697sU?=
 =?us-ascii?Q?c7h5jr+3LQAjvd6C7Zcn5vDm5KMnn3jzE9VKP2G9GbMqHmQspOHr19G5qjyB?=
 =?us-ascii?Q?KJj2pqZ3ZxyAg44F1YinWEJHFHB6Eh8awLcaLSfQ5DmwKxWzbRvsqBj5J3Wz?=
 =?us-ascii?Q?VsrlbFedg+WpYHEhBzxloXlc+GfKGsoKc1yIdFS0I9/r+Q2IYRIqeiSNUFvy?=
 =?us-ascii?Q?N+hmpKaKE+vy3XvCN/UD/P+SZ3hC?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?VvPm4hPcOWDJMYRXXYtXvsu49X6gmfA6F68k3X+FKMhoGOsehHbqciLL1+oM?=
 =?us-ascii?Q?VmIZNXMh/gaNYz20q1uQxAdS7Go2bsEO7eTByVoj9CxRsi0rAk0nT8OaSviy?=
 =?us-ascii?Q?4N75ElhSfAq9bGh4CchM+VDIuBwekP9tJXqN3XTgEKu94wSlqM1/+wO0PArs?=
 =?us-ascii?Q?SLfj7ZWIVYL74k8dX5P9zO8ktVFsBzhMlq+XCPFez7MZaC2JMgisDgtsO6AB?=
 =?us-ascii?Q?HPCPJSby7h7WNSyMVZzMw37lq5tXiikEbt6ekk/4aPXhFKj5U7ZFXdqDa7aL?=
 =?us-ascii?Q?UpRT0G8rGhClJ84aBEvXeZ/Zef2Ndi0BGh97wEwzK3w/JhbgHZCJywEJXPs+?=
 =?us-ascii?Q?pGd+BvaBnTLo1dIfVqWhEl1tsM328NzUSsREyBG9YSt22BDY8qzgvXzT+83d?=
 =?us-ascii?Q?/lILDhn2t+Vtu1YWxzy+7x4VyZksf3zO95xTyJTiy70kAlky1+N/2GAIqL6S?=
 =?us-ascii?Q?2rcZdEifLkPTQKAtQ+oyI6WdjpwfQAsnV7ad1cyCfjra6zTV5qRHuWxrNNm+?=
 =?us-ascii?Q?ppME3gKU1tKK3Oxf15Mq/6/1vcS6Y0QMptc1diFu+9KiYRRaHj7ucQltZwYZ?=
 =?us-ascii?Q?ZD52fEac0qgZYhloy/YpV53kLfCwfUgu9ockq3KnnN6SdwDJAmfUFCTcEeJN?=
 =?us-ascii?Q?6Ik8CrHyDPCy1fQimyIoCC+/Omh8nbKnaFcVMv6TFul2IvO5rSzLJLrWuG7I?=
 =?us-ascii?Q?KYW8eOWMwtYIw5ljpHntAslh4VU3RZwjKGyl6mszkNI0HWd+DW03ZRgNC7HN?=
 =?us-ascii?Q?icYml6RNO16W87p8/UjWBEAD2w1Y8nmAj3JFPbu/mwTE+7VrNX5VM37Z4SPY?=
 =?us-ascii?Q?oWp5QR2liN7K9Ev7uBIxNxp0Q2zjiNR0w/I0B+HE3aXC7WaRKVOnsN59RpWu?=
 =?us-ascii?Q?QWioBD8YJSYGe5ugUv4bPqR8a/ROsH9okXYRR359MgQA7RwNyUEYumLommIg?=
 =?us-ascii?Q?XBIUtnSlQDUhMsNKMPU9eqge1OWlakEAgFU299cSbURq4qfViMRp9836C9rk?=
 =?us-ascii?Q?1o52rmymdi4OoLvZdC/0OQ3nR4Lxmaxl/2kx+xa4bSqgwu+2eDlfJlEOT5yH?=
 =?us-ascii?Q?ZCNRz9OBS59+g2MBKaVkmZriQJE51kkn27X/jd2mZnIMvNTAwjqpaxg5ixi6?=
 =?us-ascii?Q?+R2zVL99OKqK6sZeYmCN/6i8ZHUx5Wl4F1HnesLaY+trQbHLvjwBZIxZI0z9?=
 =?us-ascii?Q?62UidYk/cceXgb9W4qwHIZa1A2+UbErnRtk2zhsmESvbTzaZaMpLBbe9W9jH?=
 =?us-ascii?Q?G7GuRnVDYGPCJE66zKxTjao4VpXdQILAgFZI2hkRptitABJHI8ZMKOqFacHE?=
 =?us-ascii?Q?2DLQlk6kUoE6cAks8wM0ZHt7+Jy9UOhthhof6YXfF0ogKQm35ePpqBO3AUoh?=
 =?us-ascii?Q?HQ9dTUC4iUwdJ6VMtjqcIP5sjxg1Pn/UC8dwlL6pknK0OhXZ1mpU4fTDRfVC?=
 =?us-ascii?Q?GRqq96PYNZfmnmVmORKR2mL22TfQSc5BvaElNE82R0F9lK16nhEXqjNjIhJC?=
 =?us-ascii?Q?Wv6pNqerqVb8nMxMOAOoAyzFf54VO+snC6KdKcrx97omXBuXa9SuVVbnjU3c?=
 =?us-ascii?Q?SonP9wpYqruWXuOc8SArg3Qjbsngef04AkfcACbg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cf2fbcd-3dd6-4bb8-df33-08dcf3f0edd3
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2024 05:58:48.7072 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5QGWN9OMkGhrTGKSN82xKoHJPaMWsRH3onGleT6rP46+36COk6kZbDM8nNzrVUBmoUdH1qMpURV4yYFLaJCPkUG5ctc3HFIfQT2VWFxZHZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7254
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bjorn,

> Subject: Re: [PATCH v2 1/5] PCI/P2PDMA: Don't enforce ACS check for
> functions of same device
>=20
> On Sun, Oct 20, 2024 at 10:21:29PM -0700, Vivek Kasireddy wrote:
> > Functions of the same PCI device (such as a PF and a VF) share the
> > same bus and have a common root port and typically, the PF provisions
> > resources for the VF. Therefore, they can be considered compatible
> > as far as P2P access is considered.
> >
> > Currently, although the distance (2) is correctly calculated for
> > functions of the same device, an ACS check failure prevents P2P DMA
> > access between them. Therefore, introduce a small function named
> > pci_devs_are_p2pdma_compatible() to determine if the provider and
> > client belong to the same device and facilitate P2P DMA between
> > them by not enforcing the ACS check.
> >
> > v2:
> > - Relax the enforcment of ACS check only for Intel GPU functions
> >   as they are P2PDMA compatible given the way the PF provisions
> >   the resources among multiple VFs.
>=20
> I don't want version history in the commit log.  If the content is
> useful, just incorporate it here directly (without the version info),
> and put the version-to-version changelog below the "---".
Ok, noted; will follow your suggestion for the next versions.

>=20
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Logan Gunthorpe <logang@deltatee.com>
> > Cc: <linux-pci@vger.kernel.org>
> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > ---
> >  drivers/pci/p2pdma.c | 17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> > index 4f47a13cb500..a230e661f939 100644
> > --- a/drivers/pci/p2pdma.c
> > +++ b/drivers/pci/p2pdma.c
> > @@ -535,6 +535,17 @@ static unsigned long map_types_idx(struct pci_dev
> *client)
> >  	return (pci_domain_nr(client->bus) << 16) | pci_dev_id(client);
> >  }
> >
> > +static bool pci_devs_are_p2pdma_compatible(struct pci_dev *provider,
> > +					   struct pci_dev *client)
> > +{
> > +	if (provider->vendor =3D=3D PCI_VENDOR_ID_INTEL) {
> > +		if (pci_is_vga(provider) && pci_is_vga(client))
> > +			return pci_physfn(provider) =3D=3D pci_physfn(client);
> > +	}
>=20
> This doesn't explain why this should be specific to Intel or VGA.  As
> far as I can tell, everything mentioned in the commit log is generic.
>=20
> I see the previous comments
> (https://lore.kernel.org/all/eddb423c-945f-40c9-b904-
> 43ea8371f1c4@deltatee.com/),
> but none of that context was captured here.
Ok, I'll augment the commit message to include this context.

>=20
> I'm not sure what you refer to by "PF provisions resources for the
> VF".  Isn't it *always* the case that the architected PCI resources
> (BARs) are configured by the PF?  It sounds like you're referring to
> something Intel GPU-specific beyond that?
What I meant to say is that since PF provisions the resources for the VF
in a typical scenario, they should be automatically P2PDMA compatible
particularly when the provider is the VF and PF is the client. However,
since this cannot be guaranteed on all the PCI devices out there for variou=
s
reasons, my objective is to start including the ones that can be tested and
are known to be compatible (Intel GPUs).

I'll capture these additional details in the next version.

Thanks,
Vivek

>=20
> > +	return false;
> > +}
> > +
> >  /*
> >   * Calculate the P2PDMA mapping type and distance between two PCI
> devices.
> >   *
> > @@ -634,7 +645,7 @@ calc_map_type_and_dist(struct pci_dev *provider,
> struct pci_dev *client,
> >
> >  	*dist =3D dist_a + dist_b;
> >
> > -	if (!acs_cnt) {
> > +	if (!acs_cnt || pci_devs_are_p2pdma_compatible(provider, client)) {
> >  		map_type =3D PCI_P2PDMA_MAP_BUS_ADDR;
> >  		goto done;
> >  	}
> > @@ -696,7 +707,9 @@ int pci_p2pdma_distance_many(struct pci_dev
> *provider, struct device **clients,
> >  		return -1;
> >
> >  	for (i =3D 0; i < num_clients; i++) {
> > -		pci_client =3D find_parent_pci_dev(clients[i]);
> > +		pci_client =3D dev_is_pf(clients[i]) ?
> > +				pci_dev_get(to_pci_dev(clients[i])) :
> > +				find_parent_pci_dev(clients[i]);
> >  		if (!pci_client) {
> >  			if (verbose)
> >  				dev_warn(clients[i],
> > --
> > 2.45.1
> >
