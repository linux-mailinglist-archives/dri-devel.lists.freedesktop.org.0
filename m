Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1647672FA9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 04:46:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA39D10E22E;
	Thu, 19 Jan 2023 03:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8828F10E22E;
 Thu, 19 Jan 2023 03:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674100011; x=1705636011;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PX5YusB5CUnpwsxhfAyGefrEASU4/LgvBcy/ibB8iZ4=;
 b=RyTr5kZF9xJnR2NxNSDBLrV8fs9bv8wFURxMVJCq+We0jeqqOR3/6ZBc
 MtckYn7gSM6VAhCp7BxHSL9UznoTh23wcZiG42Xli495gwmQFj4nTWgb1
 /NHTTWQ3V+pvEYuD2ZILAXnsoR/E9A2fQWU2YrmpspSty6ummpyvo+zkD
 GLhWXUW0vKHYSBjj0xNmMiYXlkg1S9bcGKOe+UOqHTWJD7BZBK65KlOmy
 33/F5IV/H3ScZt700D1b50O8rrQeJwIcXpkj6+ehm6JXksMBx0utsavrT
 rSltziA8xVcLR6QXBMjBxn3FnfeEtg4zpsdeIUJjLQ2OWENAj17Sy+IeT w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="304868707"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="304868707"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 19:46:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609920673"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="609920673"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 19:46:50 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:46:49 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 19:46:49 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 19:46:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKrTAbxmTGqobylkaEBRmjbbyKiXzhbQinqyRFhVviGHEN4ZlOxaB79ftaYVRQ9kwCX8zpzhNGFmVb6iems/EPengcePQ07zFjvg3fMotm5Nq6agiWZIeOGwasUw4qbuj15iQmfIL4QVxvJYQBUdzFkWmmaQglVHaDpkFo+hTuWaaBPDOP4146dSuaSNjEhCmo2pJun8MkRMWGSa72IPYCTRJX+R0OQjLrOxt+ZAZ5wDYKeIEfuw46fmUjus2PdZXfmWH0kSESrVuqgesv0SoLmKf31214veyS0Z3oV4D7Hhc6ey64YtcVs8776OZaKGudagZxWKOEnRAfIjgnOiZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PX5YusB5CUnpwsxhfAyGefrEASU4/LgvBcy/ibB8iZ4=;
 b=B01gl4Hu1eopbY3bCZEPaKgdMPqcRJ5L4udfkWDM3raM2RKCJE8dM/BN4jBQkKrOrl2ebIEBTg/TYXcldX0N9+ngox+41RpQZZ5F2MjimOy9C9LhRb6AdwpYeQgRC/Lm/x36I/NGyJggZvVCy3RBgGg8TVbcU+Y1Yt04GQ63numyQ843BKPdd1DUakeXI+d2IZ4dba6OoDIHmJohjrDW/5SpJN9Bi5c4I7G5Z3X0sXSTNxuukLbAV1fGTBF3km+qM2qRBeuOyUPkf0S8h7FYgo06RJljDQu6FmBV095KxYebNkuunL443BMCSvKkMWhsZs98hfOIprxy9evvb8Pejw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by DM4PR11MB7374.namprd11.prod.outlook.com (2603:10b6:8:102::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 03:46:43 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 03:46:43 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: RE: [PATCH v2 03/10] iommu: Add a gfp parameter to iommu_map_sg()
Thread-Topic: [PATCH v2 03/10] iommu: Add a gfp parameter to iommu_map_sg()
Thread-Index: AQHZK2bf8Telb241lUmleVh9GYhoP66lGmBQ
Date: Thu, 19 Jan 2023 03:46:43 +0000
Message-ID: <BN9PR11MB52764620E4975A91878F1C868CC49@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
 <3-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
In-Reply-To: <3-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|DM4PR11MB7374:EE_
x-ms-office365-filtering-correlation-id: 696e30bf-d6c4-441d-8423-08daf9cfc7c3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NT2PVJ67+O0Wpv3XIEW69IoSdgN/SgZtE2Kny/tWRFrDm66zG7fkk9nIibI3MRcTGiubNeA+8J/P/ZmBeHaMJ32QP/ojdjbLTJGs48AR6TkJMsC8s1E2t+cVTEEjBC+PScGq9aKHjaBklT+gTNC69iyFSCRMbE+Un4+1t9GqgGgA8IAB1nScvnEzbdrT3PxM+mjtnTUGjy4oBDEkhI7U3fl76wxiS9lQ/Pvz5nxoV7XSCsSDgalFXDQdM6o4U60tff3kM2F2qbOabo6kIrTCiWp5c1rbV+hysXNRPnVjkBaOHbK96pfLVSIYxK+7Ks621nUIsFHXRMbb+Cszu9fEHLcb6Fq/R+vbzIZU7UTrn8PKey6Sb4fyUYwAK4r8nRlQz3FvW7Ue4iCaiMUWNfnjWCVeCBB8MopIA413+d1lTzH+1ndQIZigH3rVnQGkjVpD8xsjQOkLqlt8snESbsGLRmMlJit3Mj6CQq92nM1EMmj7WhC7ugAQ1n+pTNVnPbYx5ND6UpG869ABvXV2MA0c2HqIio44uj4eipGmLkRH38oZYh2NQlAOfKw+5KJ4tA3fVEavpL2lVD5DjWkCr4eVqUbZ8n78wFrY++kt7QXdPZP6QEI+c69Q3qy+FtJ1HWb8hK3HgWCAr6xXHTacfrTK1EtkfYbraWNrPcwJdQf4g+VN7b1T8vsHck71z2GlRqeVCU8Z4BjqpGhV5Zmpmxh7Wg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(39860400002)(366004)(346002)(136003)(396003)(451199015)(4326008)(38070700005)(64756008)(76116006)(8936002)(316002)(66446008)(66946007)(52536014)(66476007)(7416002)(8676002)(5660300002)(66556008)(4744005)(55016003)(2906002)(38100700002)(82960400001)(41300700001)(122000001)(33656002)(7696005)(54906003)(110136005)(478600001)(71200400001)(86362001)(6506007)(186003)(26005)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hI0Ir2dDOIWlZ3Vno0mxDgfm//JPCX9b0qWit2Dy1M9MN2PFb3qP1o6hLrFL?=
 =?us-ascii?Q?CehUeLxRo88+hVH6X5F2+RUgnkCKiuLE0pBHl67aaFWiUYKJSH6XiH7ptfbg?=
 =?us-ascii?Q?qRKGawOsmrpuH5vGifIKf5nS8am8O0GMwrX1tXYhLHVj/vVi/z4cZ+ZH8QeN?=
 =?us-ascii?Q?gY/JZ9VzPS8+ZukJoMV0q0CpOwnoYxfDldiemKsRnVBrvNX3m8kYmLp1287A?=
 =?us-ascii?Q?3Yefb3xF1tS1zu9pCGzmKChczQnMUvBY4OUZrpQ+rqJKrapBB5/IoIM2WGYi?=
 =?us-ascii?Q?WVU2wqUwzzSf7B7Nb182ZLUBoGaKeFV5grZeHRUDKsrEOm9N8VJUWt/N6Qus?=
 =?us-ascii?Q?vfJ8wEa04WIVYAPeHd9VhZ7n0xcz+GS+lf7DpeChEsLrnVojm5drDFr4eYyo?=
 =?us-ascii?Q?QZQ35a8nG3nB1uGWuVh984+Qw0dTIkxNBBucRuqTWkt0kZiKNIsmgtRT/qmY?=
 =?us-ascii?Q?nZnxMP/L9RBTqub5NhbvDCkk3EZDXDwr0sbXc9qEi680qoEe8NCJyC5jPXYC?=
 =?us-ascii?Q?DEQi4Z5B31LFxfEf3Oc1qZB+DMiJtxqCj2MWdMVs61gUFkkrudX1rj4zf5v4?=
 =?us-ascii?Q?YTvYixcs4L2FulCqgL6kudcQ1xl7gAwho3jGJN7bXvzgsmBLaOnsbgiM4+sA?=
 =?us-ascii?Q?sMd/E5b2YOmfLY59n3BvDhuVzRbmYqJWi/nuLkj+6dejv+WsNFGsSsjo7sKX?=
 =?us-ascii?Q?w6z+4Q4COrP2sUIIh+A3TnleFNRaej7AoCiVMmUOzBFN4dtkMbMn3wtNzrTg?=
 =?us-ascii?Q?CdM8uFkLDvWflrY9c50G4autwQ1oEex0yWo67U4+KhWVPOmgQFKUL8punYXV?=
 =?us-ascii?Q?mIeUUTLb/F0EIjvzpFAMAtHH8Jw+iyRLilyJzMQHp/PBoGTjShYZEQ6cF+Wm?=
 =?us-ascii?Q?+7gqKNZL7F/3fq8WZKsVtgAF7tcX9sfEwQH/9EQfvS5sQFkwLQrI+qx70h3f?=
 =?us-ascii?Q?EOrUGBO15VbXX+gQuRtaJfU14GXzcS9+KpTVb7jq93OC6yJ7FyjnNaTmlP9+?=
 =?us-ascii?Q?Xhc5Gf2nTrvmHB4C9tw25RlLCg+ErsK3nZim8067jQir7vdTfKS6+4bqs0PE?=
 =?us-ascii?Q?J1VBiuLfd+m3Yrl2zxlZCnMS3n2hIwhBe9aRJd8YWnT2zNui+jon53vuMz/f?=
 =?us-ascii?Q?CPHZ+GvnTDkiC1OsCQ0pTVBb/AMJEiWyjhYQihIDlmfxmCLjh0yrewKRwXij?=
 =?us-ascii?Q?eXmm1ikAL3D5Ac841SVCQWkLPuuVUXgj2viDGANKcUtYdj9Py7nO7wc7vG9j?=
 =?us-ascii?Q?ICOKbGyLed596c4tjP/3TLzBPv6eoMxpd/LEFG0iVmMzTxQ2x0viqO5r2Mcc?=
 =?us-ascii?Q?4LhdPwtRtGZEBV7ek1JjAzVR1c3cJi6odipEpDb2Me93hft1+YQwIdVwdsIz?=
 =?us-ascii?Q?MJTjV+MuXBFwfhCg31vb0cc5AHY4QsJ2xHkqmRNKdQ+xMRW/8QifNuUFqyi2?=
 =?us-ascii?Q?4AwHslQnhyKCavpgYHDH7rXGa8bHmidtdNnCcVDaykrEiTS5mqVB7suYGfNS?=
 =?us-ascii?Q?6p4shXllOzDJIr3HIbm9WdBy14eQC0x7Dvj5eeHQwmV5NVdGf8ZDHBToeAX2?=
 =?us-ascii?Q?Azg+3C2w0MV/CEsyvwS3jnhP/ZHk1eCODYBoMj+9?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 696e30bf-d6c4-441d-8423-08daf9cfc7c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 03:46:43.1060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cB5mjgBOVVODY2HVODsV4/VquAWmxS1Xa+Zedbg+cdpUU2OqGbTgdy6iWDD69k6XhI9GpUxhcWDhYwdSbLVVfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7374
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,
 "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> From: Jason Gunthorpe <jgg@nvidia.com>
> Sent: Thursday, January 19, 2023 2:01 AM
>=20
> Follow the pattern for iommu_map() and remove iommu_map_sg_atomic().
>=20
> This allows __iommu_dma_alloc_noncontiguous() to use a GFP_KERNEL
> allocation here, based on the provided gfp flags.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
