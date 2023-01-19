Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1EC672FB6
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 04:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A8E10E89C;
	Thu, 19 Jan 2023 03:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8192710E89C;
 Thu, 19 Jan 2023 03:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674100170; x=1705636170;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=TacaHHyw700HoqJx5Loy5n++y/XjKwWBl1nb9bQ77ZA=;
 b=KejZEZciiWqsD1pOmwRLJHQPVftETx4sGvPnl7K5v8recuWFiYsA0h4v
 UWb6TPXexnjFBYAKwptyUS/XAskKY2VteJ01qiHAzpw1lKToATYf6PzRR
 iFP3oPowX1793B17k/JQ2JmwI8EQtWoj+tZvHkMCgZ5aKfcfnuT+wp6ql
 THBBL9lBUsKFIom9oDGsLF9Jakv/t3stIhPoylSKXJ38QxZHusPY//3jZ
 f26E96mCQn4SV4xZ1jZzfqSGypOAe0vn2ePPb+JQ6tvK1FL/b0Yzn0FTb
 PBp14hdnv2g46V4FgJl6Ni/m6O4JHhvqkoWJiXrYhZUGCdhoNxXhmCc1c Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="411423934"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="411423934"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 19:49:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="768029377"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="768029377"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2023 19:49:28 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:49:27 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 19:49:26 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 19:49:26 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.106)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 18 Jan 2023 19:48:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WJ4uJAonhjNhHNHE682HdOnczrIikC+lRHi7w+/mBlMYaS3AeqU2mgmthQ8BinIoPkOnfy0EmdsPEBEfZGvYkMpbp6Rar65XanJmSruna60RXdEGlUMmg4tD3lAOq19RL0azlvPj5j1v0ycQVz72b/sm0NxYyfxGEq5BH22OKktnbyGNjiLVLwGiYX9FJ/XJ17icyTvHD3vd/HFXjHggR08M4STNi3ssI8NPoqG1LxlD5MHB7Q79998dbH8IViTj8j7jz190k2yBHIrjL7UOIh69btSNjMbbbST2hR2RLGtWYZFlL1WqYPuRKvrfUeI5wgOnOElCSxAoHIoo420BWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TacaHHyw700HoqJx5Loy5n++y/XjKwWBl1nb9bQ77ZA=;
 b=kOQMcehpANHBpbIWT5hsjBMmflXlCWO4X2UinsjTwMvMf8C7ZOxksMN53elJQeUG3SMC1a/j//NeAIQtNcCkZb2+q3/aZxZfd5D2AluLYUeHs4yeJhtIZc/DZbn4/Voxt8T2Rji2/aRfP1FxcRVZxm4xLZ87/uXXuDupciTEGjaXtfQlc6FZnJKzMYVe6bOIMA8J5jLJb8mmwCeWria4YRV2l0zJDqEL/gssMGUNI8wpnpWtFYpguKeccENKIchOKtI4ZxjgfRtiNr83Ain5x6SlcPLanUjTpHHcivjhhejadGN8q3r8rUSLmacl1EeWc9Pa+7wuymo6qpAHWWlIjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB6948.namprd11.prod.outlook.com (2603:10b6:806:2ab::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 03:48:50 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::6a8d:b95:e1b5:d79d%9]) with mapi id 15.20.6002.025; Thu, 19 Jan 2023
 03:48:50 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Robin Murphy <robin.murphy@arm.com>
Subject: RE: [PATCH v2 05/10] iommufd: Use GFP_KERNEL_ACCOUNT for iommu_map()
Thread-Topic: [PATCH v2 05/10] iommufd: Use GFP_KERNEL_ACCOUNT for iommu_map()
Thread-Index: AQHZK2bmBvk1zKEuTkmXlfrKZFuY2K6lGsdg
Date: Thu, 19 Jan 2023 03:48:50 +0000
Message-ID: <BN9PR11MB5276B57F724238DB11EFB42C8CC49@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
 <5-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
In-Reply-To: <5-v2-ce66f632bd0d+484-iommu_map_gfp_jgg@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB6948:EE_
x-ms-office365-filtering-correlation-id: a54b30e0-b37c-4bdf-5275-08daf9d013bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pSNocdRi4c8dUbuIleZ0DLigl+GRvZJ+RhZq5moO1V79n2SOSO2nIJuIM3XZ202xLEno9qYlxpUeOA8Q2l8l2b45xo/UYv0APOMqUenk4ib0nH+pmcbMzz75K9Pux+Dvxup9abJFT44sWZpFwfJ7XXwIOOrmD3Zet0vOuQHIJ4qVDdH59sf3W+QUBrv3EJxff6+2PVpa24IDZd3CCHP8/zuszqBvEP6uqIeQTnHbtmEBXi2DFpE+loMIhpkwlxivEvAF2vRdlxtZA/SZR/iDfyNExFPdvidL9WRBtajrZyg8bp1WuVrdgVKOXsUfpFijVDmZnqLDYKT8DeOD1BLDA9CDD3pVOCOgVQY50aPqJ3fzDSZhANg/hC8h/qZ2L7JQ0KwBmGRuS/mL8dNh2GWoWX99rwkI1fOH+SwtaBlshqJlnoQLD6UA2z7vFyIy7on9Iy5SpfMkd76ab9XmOJ11p8mSuknR+kJ1BpnPgRKFfwlD8xkzP58p+TFHs80VGwJEZqmPqx9aW++mpSg72j00PrV+7rtnxRfjITSvhYmoDVlpNa1AlaMiCET8sUhrFJGJvkVR6ugQOOWf0M42kMeFxGVu6hk7bemBjIaHO8aANL5o2e2gmdYmdk6CIHOxYr3NMqiffexhEJx7LadCxU+N9N5W5ARCZ//w+debjcxjvkZAMtjN1xlELTxlkht4C4Obobjescrc12O6kpjfikYn/w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199015)(6506007)(26005)(186003)(9686003)(7696005)(122000001)(71200400001)(33656002)(478600001)(54906003)(316002)(110136005)(76116006)(66946007)(66556008)(64756008)(66446008)(8676002)(4326008)(66476007)(41300700001)(8936002)(83380400001)(52536014)(55016003)(7416002)(2906002)(4744005)(5660300002)(38070700005)(38100700002)(82960400001)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?N+gjjgipAXDw1974qBrKytSqy9LKiehGJgeTTPsM12qAsNQ3VFri8zs3Yd/4?=
 =?us-ascii?Q?nMofPhAiFhV6aXo17rKjaB88VgM8wM7hzFhmbxyxmmXhiBbt7ShTKov/vuD3?=
 =?us-ascii?Q?AOGToIKklXy9Co1n+bT7ThEuvEY2tlXQqGc0dvRSlnXXUoj12WZI96s1itc5?=
 =?us-ascii?Q?qIxBzsQNU56Q5hS5ssQ+M66XmMkqNlR8pXoCII50t7kpySUYyx7qOHjOZPoq?=
 =?us-ascii?Q?/AfFm2RyqwQ5PUHbo5J7KKqrQcDWEqH10YlFdu7RAdWwL7Bt8QLRHuC77uLM?=
 =?us-ascii?Q?g/+o/u15Cvo/GnT7IKws+xmLkzjX/YgOOe9BqY8j1oSkIUQvwSjJHQ+e5mc3?=
 =?us-ascii?Q?vOiSkg5qeBRNaEn1OvaD9TryxpvQ5GRnMBFhNysIP7tPSeDbczgqcNcucY1c?=
 =?us-ascii?Q?UhqkIjuvEo/0/r0+wvSqbOr0cr8V2CpmtCQYJ4EUur09M/RGf6uAQoMclz4F?=
 =?us-ascii?Q?BfyjgbBoDxcDTtc2L49b3PCkX+l+C1j/YlSBV+nKVudzskt6dr5rNNuea8M0?=
 =?us-ascii?Q?hLDfAbxxk3fZTsR/+1qsMaYlhDYdRA3eiBlez9h/sqA8+0Xb35mDPD+TEuHE?=
 =?us-ascii?Q?VZKQ7tzIsnQcD3aMh96Tu4b33UDofBNbzRgCkqn5MGCeC5Uy3tmeOiUNkGnl?=
 =?us-ascii?Q?6LQhk6A9bo9qiaSExH4NNRiFKvLxXGwa7IrdRtd9SrMQznopfIdGOLu4PMzO?=
 =?us-ascii?Q?tr6kaU4dBzUvH9/BvFus4H3lbVHZhy7iJbWF9sAp6skuoHtySmXfBdqM87OZ?=
 =?us-ascii?Q?+QuYP6YierVXWqLKAWQ/Qy+pf8pG5vICmxoF7Z/UOM1sL6d//tVnCS4m+9KK?=
 =?us-ascii?Q?RG6IMt5ym/JgVNajGqBq0KHM2wCg6KyxiZfISug/S9qYMs+/DVKfdCSxaigr?=
 =?us-ascii?Q?AygVHNVGJXjQ+MCaaG7zZlERZbeZuqSfBTQWmrJzWBhmgQEVglKB3LDorfLD?=
 =?us-ascii?Q?sUEkYuUJFaA0xVVSV3SuQx5bbcxXQft2nPdCWJyXzTTPFXJEsIBcePydmn/U?=
 =?us-ascii?Q?8j7t2xQR6b2/57edXGgw5YbA5JW7K1uMTc/h3rx1iyfOcTipsKkoiYpyHy+v?=
 =?us-ascii?Q?ndS0/jDqZAkuVOOinO5dArk3HmzruEA1CEu9QxgcI1Mj6pG4l4sPvKGtOi8D?=
 =?us-ascii?Q?zK2gQi5mmXgSUe77qiiEcEF4ZIoyrMcYxSPHIpGiqewHMGWlgJQRubYkT8q+?=
 =?us-ascii?Q?9qDk0j258BwXrgQOiBcRUZcSEv7xHd5903UNm8iPT0i1f7Nw2sscUzxUtd7Y?=
 =?us-ascii?Q?tiW38pMWcx/LGreffgZfEDZGsqGKSp5EPXu0CtD5mjCHRaLXNhhVA2HoMWXx?=
 =?us-ascii?Q?oWRW/6Xzm3mawaYfuy/tRZZRoRcqxfU8jhFiwcW7+CcR0Ccdi8zo6csIO5r9?=
 =?us-ascii?Q?aCMncrJZc4B+9p2mcO451aqjYPwbrAcQ4Ezsidkmdr5v9jIjDO3vJkIWlv1F?=
 =?us-ascii?Q?xhOC5iPToYDosjiwxj0u853rZgA9F+UHe2RBEHgn7Ivx6H1b4a2wt7t9YxDM?=
 =?us-ascii?Q?99DtCcXdk9zHavNQUoTZSSOqw2PL7DvcqRSPhVHOFMOdtS7Bxzt8axaV/vZQ?=
 =?us-ascii?Q?qtR9/ZuvlsbKuxZg4YZnuZFMat2eopV6cKk2gEIc?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a54b30e0-b37c-4bdf-5275-08daf9d013bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2023 03:48:50.5541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: svT/qlcNhPIuKPPqDXB/BevUcaiFEmbBElXahPwL1bNxSIrsB/oOUHP+tQMqDXZe/I8iAcEeUesSUNZVq0gYkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6948
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
> iommufd follows the same design as KVM and uses memory cgroups to limit
> the amount of kernel memory a iommufd file descriptor can pin down. The
> various internal data structures already use GFP_KERNEL_ACCOUNT.
>=20
> However, one of the biggest consumers of kernel memory is the IOPTEs
> stored under the iommu_domain. Many drivers will allocate these at
> iommu_map() time and will trivially do the right thing if we pass in
> GFP_KERNEL_ACCOUNT.
>=20
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
