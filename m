Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8382C7D172C
	for <lists+dri-devel@lfdr.de>; Fri, 20 Oct 2023 22:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6298B10E5EE;
	Fri, 20 Oct 2023 20:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9A110E5EE;
 Fri, 20 Oct 2023 20:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697834389; x=1729370389;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=q2hlIHO5iirT/jy3hfz8dAeaU8dQ8FAgTPkaGLPElyE=;
 b=RX16hbDikFjaaKP1akmuI0eh3vnHcFvkIWFf/ovlTqLCWDb3h3pArVVq
 IJQnQrVydb6T5PhQ2Q+YdHTiJeY4ym/pkde3LF84GIU+p9YsCsxpdZo5P
 DHvXJl5R02AodgvtHG4LTO95IsTGaINSDXFZijBc7kHCrTPHJhWId07f9
 Kd64j4H0BxMF4j7LT56/FJ+uD1FRpWumPTZUYzzl9L26HGDfWd1j9s1VL
 3aV7WXQamb6IgLSo0BaxKUtXRWykYpBCBjlK0LpV4c/P3DdJToXKgPS0I
 tFyZof3c1qNSm2JtdhpDWgWRIRv23x/gdIaBn+C0rqLt1EsWuIUs4mUw9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="376945942"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="376945942"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2023 13:39:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10869"; a="734072208"
X-IronPort-AV: E=Sophos;i="6.03,239,1694761200"; d="scan'208";a="734072208"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Oct 2023 13:39:48 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 20 Oct 2023 13:39:48 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 20 Oct 2023 13:39:48 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 20 Oct 2023 13:39:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhL4ouVlr4Zs8CM+hCM/Etb0jMYzv35h5AJXS/U5y1NaHkj5kNzni7Bh9rfkGne8FE7Oay9yDrh6Ug57GuAT/h7h9i4vmNy7iLuw5vr5OTAHiq26dhRIDtu9j/GvKmuetp3f3tFXpRRzvE0Cp9eI/abZF4h1Al3xZGyKbvAxXBDI1NbI/XjAwKvYL24YXXwF+NBnnO3NIrtZ+v+N4FIWYNTMCJkBLfeFMQo8pYs1qlmeyModKx1haX5XOD4c2fyFPiGCN/tSQHrKQFfi1/ftq9dk6aCquimMMDAtX3VD499ZwJx/R2QHqxsLsJ+gjzPH5HI8wW0J1i4KkfdV7KljOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FVuGlfIvAJf1L7KM9ldPa29mwIPvS/TMt0RGRPUzRCc=;
 b=VA/rrOc8ozOXbQ+y5Gw3+Delhz/hcXT6RRYR0nUlfgRgL8P4oJuML2txU6vXW9sF7kGmDZ6o0BpiTieKrlEjz97Ci+WpNUj0RfIdl3Rp6mdGH9iUAIj5or2/C4oVMnv5yjyHmreU6J0JE3wDmE7rKLvVFZ5DWz00GFYV5oxMDXukBrJuovcKpVjQMDWTReDJ8V8rnX/DmPRaF7cxUhbMC6lGrtfIVV1TRi3Ke/SQCiQufAc95pPmgjIoQbKvc0Vw/A1qGdGvc1rZdyWX2BjwDTN1+ElryAbm+G4QIk8JxjcDu6joAAEfks0YNGqRHuB4nLpHrLmSXXpONjAjLWcvGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by PH0PR11MB7657.namprd11.prod.outlook.com (2603:10b6:510:26c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.24; Fri, 20 Oct
 2023 20:39:45 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::bff0:69bb:b4e7:dacb%4]) with mapi id 15.20.6907.021; Fri, 20 Oct 2023
 20:39:45 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "ogabbay@kernel.org" <ogabbay@kernel.org>, "Tayar, Tomer (Habana)"
 <ttayar@habana.ai>, "Hawking.Zhang@amd.com" <Hawking.Zhang@amd.com>,
 "Harish.Kasiviswanathan@amd.com" <Harish.Kasiviswanathan@amd.com>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>, "Luben.Tuikov@amd.com"
 <Luben.Tuikov@amd.com>
Subject: RE: [RFC 4/5] drm/netlink: Define multicast groups
Thread-Topic: [RFC 4/5] drm/netlink: Define multicast groups
Thread-Index: AQHaA237raHcjO+M8k+qsPGq0HmaKLBTJDdw
Date: Fri, 20 Oct 2023 20:39:45 +0000
Message-ID: <IA1PR11MB6418BD9A2842715433369857C1DBA@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20231020155835.1295524-1-aravind.iddamsetty@linux.intel.com>
 <20231020155835.1295524-5-aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20231020155835.1295524-5-aravind.iddamsetty@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|PH0PR11MB7657:EE_
x-ms-office365-filtering-correlation-id: aff65c95-d973-4955-e2cf-08dbd1acb23b
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q5eDkK+5gkYHPjtiSaWIkd14Rjf//D0rbkCED949Cn7s+QXWirfTpc6oYAs0zcmz7WBIw/D1n30tPcePr/tXP2CbiZ8FkuhqLZd4hlUwi5RTglPDo69xqlUAIKbYU2kHU02yaAkErLR1jzp13OFBDDDGlMOocMCh7SB0RSh16W76ldmk0tuaMFJXjWf44QgiWDWlJRC8ZzkQj7g6dQUZkoMzntdRl8cQfBndSHYfDSf5EdbZX7q62Ae38vTjtuuqd3uiqmhjmIGCXRGOC/a0Z/kLFtzFXaOGr2sWwhTHRXbszRiqB5hGAVc2gNXyF3/y2m3SekaTzOmFW0sm49+JY7qG1hrBaVCfdZRzCYiPiCy4rdMxbMmm8zDa8DP3zAD1ym0PQ4xjVrW5QdDbgs1JAZ3VVo0/w8+RMC4Tw5+31FO1RHYE7cs9xXlI6Vy/hvbrBgyDYYjsu3pyKxO5xImNEy6YjS7Cc81t5NNFpTkDLGA8GI1M/MpDC5cescTEiMqXlmasIcYf7QE8JlIwVzQFK6q0jylE5b76J/AN7YukbQlGUkSufYmSI8oiEAlfVnOBBGHsx2YFbDOgKnGEp+et5bWjPaFK07ZpEINGm7ai5HlrFCifXWZnKOs8Mori+2O1VgmiqgaJiD/NDBnzwJkFnQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6418.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(39860400002)(136003)(366004)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(55016003)(38070700009)(2906002)(86362001)(7696005)(38100700002)(7416002)(52536014)(41300700001)(5660300002)(83380400001)(82960400001)(122000001)(6506007)(9686003)(26005)(8676002)(8936002)(478600001)(33656002)(66476007)(110136005)(76116006)(316002)(64756008)(66446008)(66556008)(71200400001)(921008)(66946007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZRebkFpmDuptRmWah2lQ99VyebT7323HrWKEvXagjLXJ9+2R10fTo+IWtWQ6?=
 =?us-ascii?Q?tL5aEfYtzgqSFy/GqQ+9fnRITbCz1x/hLAnJMMtEHcCurkS4+lQXqjALXfPs?=
 =?us-ascii?Q?fHwqXqwgfmExqGG1y8FAOBq7WQwrN4C6xnnP6cehMJA7z0m5EhSqRuk9l9MM?=
 =?us-ascii?Q?oP47OrbalfoW7nDn9+lyimRE1fgiKw4lDMpJpE8HgPJEdIvisK0qP7G/9vLo?=
 =?us-ascii?Q?PBRta4PjhK8H+xmsgdb1qscm9H0zC8tL3s54IyVagqwDZLJFeuoVx0xzKRNY?=
 =?us-ascii?Q?Sul7ddd6jCtMflEREyyB64ehPaht8iHsuvz4+sG7iVgKKWG67odXLXX9SC/k?=
 =?us-ascii?Q?K9DMoiDyCqc5mFFmSPrjtA7SbcBpmLvkGUa8HloGkU4tg+cQQJU8YTCA7F+A?=
 =?us-ascii?Q?KCVdbH6d6kN8KiLlvGderfJrQmDsKCHE1/zWkNhaSGiYzWoEFc6bqW7bs8F6?=
 =?us-ascii?Q?dcbR/0lHnedrKt/rOsN+TytATmOBMsj6VQFCOrpG4y5WxDTomxNlUDMTOjSV?=
 =?us-ascii?Q?au+AvU8BKUOCdsuf4u3qzqquE1OCqvzTWRGrIwv2PyA/5fiW1t02oLL/u2To?=
 =?us-ascii?Q?LiKouw8vhrOjNWrRh0wHE0FadFwBMY1O9L8XMA1cZ7B9qlY9w2sveR9R++hS?=
 =?us-ascii?Q?ZaG5dl41l940WEBETmPQGG60WlvNobEkWxB8fiai4oZeU9ClX9txvRrbUGSP?=
 =?us-ascii?Q?34BzDxIH5gHqGGUkpb0oguVccyKsEKWPdr7vJeemrakRAxMno7cvhANntI2H?=
 =?us-ascii?Q?Sy4zaxJJsjshZ954x+5XpEswkkLikb2r04yzcXwiOrfIsVkLzUcOIgjHZMSv?=
 =?us-ascii?Q?H7sE1vtRVvXJuchEBXL63OvAFV7csmOcl7sOmnFs+QumR2vNnSR13jqi7+1j?=
 =?us-ascii?Q?C8sQYvzdOFGkPAQaJ1P8en4UE14XNjgpp7uvAjYXcclvPCmIhtGN3VKKRrr8?=
 =?us-ascii?Q?8FZNEVKAXxcaGSyFCuX2b4yZBgT9YjuHwz2RX5dHMx8U+pDezjZKX4FSOiIF?=
 =?us-ascii?Q?V8ngZD9bQFAGYgmeep1D2AojzGDHid29Ybyqyq09paanvUAx6P9pciSs1yR4?=
 =?us-ascii?Q?XCl9Gfc5/3iDQbxpXAWH6n0h3nXg3Ztd0GWGZLJBu/EzGzwudqC7KqCiBvdn?=
 =?us-ascii?Q?ujo9C4YidRie2ozQn3IIwzfjIgXQHpHhrON7oNGVpzocbjzdYbybYa3L6yAq?=
 =?us-ascii?Q?9IsFSIeArTeiTwkHJqa+wgE0QiUdG2DDI9GyUc85i1rXANPTf9FDdxLCsQMW?=
 =?us-ascii?Q?kFbxLMuT1b5R73pk9CmcEmtZMoB/x6GPNfi8vqrLCwcPpy7c6c5CiORJGHM2?=
 =?us-ascii?Q?qY9ioywtxVe0ET9d1Z+eifNw8/1N/TKMC8NeN08NMTD5qNCRBpUm6aovcEHo?=
 =?us-ascii?Q?z4DhUyTII+QgQSI4bJLxMmlR187XcOwL4f30VnxFlYc+RbVwC3e2S+wemF4u?=
 =?us-ascii?Q?1af3XGnYEKsYwTVOxASLtmrDBi90MRUv2L4pmrETnLTmBRzkPc7Ftg42M+Y8?=
 =?us-ascii?Q?sTvPHff2ywFzZcrErKtNlcWbqdht8+fT8VEcR8pDp5GmPKosCvNHktGr067G?=
 =?us-ascii?Q?Zs4aWfdYM+K5mEKgsOBXPBk/pqvpMKbIfqTDgOpe?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff65c95-d973-4955-e2cf-08dbd1acb23b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Oct 2023 20:39:45.7465 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0K9DHHByLt5NmSA+oVRFKJAyVsc3xYTiQUbHo5uYtyzHaS8giL/Q7DrOG7BnXraBIoefztxkylfSCiBmIfg5bj3thWu66k6VTLNjCmw71a0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7657
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

>-----Original Message-----
>From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>Sent: Friday, October 20, 2023 11:59 AM
>To: intel-xe@lists.freedesktop.org; dri-devel@lists.freedesktop.org;
>alexander.deucher@amd.com; airlied@gmail.com; daniel@ffwll.ch;
>joonas.lahtinen@linux.intel.com; ogabbay@kernel.org; Tayar, Tomer (Habana)
><ttayar@habana.ai>; Hawking.Zhang@amd.com;
>Harish.Kasiviswanathan@amd.com; Felix.Kuehling@amd.com;
>Luben.Tuikov@amd.com; Ruhl, Michael J <michael.j.ruhl@intel.com>
>Subject: [RFC 4/5] drm/netlink: Define multicast groups
>
>Netlink subsystem supports event notifications to userspace. we define
>two multicast groups for correctable and uncorrectable errors to which
>userspace can subscribe and be notified when any of those errors happen.
>The group names are local to the driver's genl netlink family.

Hi Aravind,

This looks reasonable to me.

Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

M

>Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>---
> drivers/gpu/drm/drm_netlink.c  | 7 +++++++
> include/drm/drm_netlink.h      | 5 +++++
> include/uapi/drm/drm_netlink.h | 4 ++++
> 3 files changed, 16 insertions(+)
>
>diff --git a/drivers/gpu/drm/drm_netlink.c b/drivers/gpu/drm/drm_netlink.c
>index 8add249c1da3..425a7355a573 100644
>--- a/drivers/gpu/drm/drm_netlink.c
>+++ b/drivers/gpu/drm/drm_netlink.c
>@@ -12,6 +12,11 @@
>
> DEFINE_XARRAY(drm_dev_xarray);
>
>+static const struct genl_multicast_group drm_event_mcgrps[] =3D {
>+	[DRM_GENL_MCAST_CORR_ERR] =3D { .name =3D
>DRM_GENL_MCAST_GROUP_NAME_CORR_ERR, },
>+	[DRM_GENL_MCAST_UNCORR_ERR] =3D { .name =3D
>DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR, },
>+};
>+
> /**
>  * drm_genl_reply - response to a request
>  * @msg: socket buffer
>@@ -133,6 +138,8 @@ static void drm_genl_family_init(struct drm_device
>*dev)
> 	dev->drm_genl_family.ops =3D drm_genl_ops;
> 	dev->drm_genl_family.n_ops =3D ARRAY_SIZE(drm_genl_ops);
> 	dev->drm_genl_family.maxattr =3D DRM_ATTR_MAX;
>+	dev->drm_genl_family.mcgrps =3D drm_event_mcgrps;
>+	dev->drm_genl_family.n_mcgrps =3D ARRAY_SIZE(drm_event_mcgrps);
> 	dev->drm_genl_family.module =3D dev->dev->driver->owner;
> }
>
>diff --git a/include/drm/drm_netlink.h b/include/drm/drm_netlink.h
>index 54527dae7847..758239643c17 100644
>--- a/include/drm/drm_netlink.h
>+++ b/include/drm/drm_netlink.h
>@@ -13,6 +13,11 @@
>
> struct drm_device;
>
>+enum mcgrps_events {
>+	DRM_GENL_MCAST_CORR_ERR,
>+	DRM_GENL_MCAST_UNCORR_ERR,
>+};
>+
> struct driver_genl_ops {
> 	int		       (*doit)(struct drm_device *dev,
> 				       struct sk_buff *skb,
>diff --git a/include/uapi/drm/drm_netlink.h b/include/uapi/drm/drm_netlink=
.h
>index aab42147a20e..c7a0ce5b4624 100644
>--- a/include/uapi/drm/drm_netlink.h
>+++ b/include/uapi/drm/drm_netlink.h
>@@ -26,6 +26,8 @@
> #define _DRM_NETLINK_H_
>
> #define DRM_GENL_VERSION 1
>+#define DRM_GENL_MCAST_GROUP_NAME_CORR_ERR	"drm_corr_err"
>+#define DRM_GENL_MCAST_GROUP_NAME_UNCORR_ERR
>	"drm_uncorr_err"
>
> #if defined(__cplusplus)
> extern "C" {
>@@ -43,6 +45,8 @@ enum drm_genl_error_cmds {
> 	DRM_RAS_CMD_READ_ONE,
> 	/** @DRM_RAS_CMD_READ_ALL: Command to get counters of all
>errors */
> 	DRM_RAS_CMD_READ_ALL,
>+	/** @DRM_RAS_CMD_ERROR_EVENT: Command sent as part of
>multicast event */
>+	DRM_RAS_CMD_ERROR_EVENT,
>
> 	__DRM_CMD_MAX,
> 	DRM_CMD_MAX =3D __DRM_CMD_MAX - 1,
>--
>2.25.1

