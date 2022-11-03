Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136136175B0
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 05:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B35E10E595;
	Thu,  3 Nov 2022 04:39:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6264510E595;
 Thu,  3 Nov 2022 04:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667450352; x=1698986352;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0QCPqPCCUDswZUC6kri3PJz4KzIbFvUy5HBHgRqCfV8=;
 b=hZeVHN9qOxiiX8ITN/TgJOmQBQ6chALStjtnuRbx3ONm4Gu7OJIYxH9A
 4nowpP3tPnmv/lYkWbEwbAPqHVj3pjCeSwb8Kp06xp1Cvkfei3PQaX7he
 KMnYf5bVDe4bh1xg1K9KptMB76ZnbWBAWNLCixY6uMMAnYHR2bpHShnwT
 L6lrm3AZ4g96brVv8YKAFqeS8N4NPqAHy4UEX/a2BOrZ1oSDvclj0RlJD
 HOrqHfT9mtu6/cvbndNIzi1SkL6p57IqbOtQhtX3cz+pDyZLzXqGyNejs
 tnLsm3J0srDaRkDGPETzvUFJ37tLXCiEeGSD7LeR8P+H/0hgljNcrMvWi Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="309582000"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="309582000"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2022 21:39:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10519"; a="777160929"
X-IronPort-AV: E=Sophos;i="5.95,235,1661842800"; d="scan'208";a="777160929"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP; 02 Nov 2022 21:39:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 21:39:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 2 Nov 2022 21:39:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Wed, 2 Nov 2022 21:39:10 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Wed, 2 Nov 2022 21:39:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwSnUvguxjFeadWSaiHb/+horWb+RExMuiThuLSc9iZ/pEBcl21LoutYW5pO3YEPRiG/cMeC0Lqh/UE5oGXYpmFdNL/jmIc01KgyotYzLQ4Xp/aHpubWnGNFLtq7GRQpYfW6prOPd6MIXysPZwT8hBlER1IZoW85HAIaHunJ7DHQdLDLhbUiNwsTBXYHpst4X+9Ma9aMmjW+vHFEBimrwGC+Kqhuycfhxel1+LDaRxuPgtrRJAVqahaxJLoZJvx3d0dcRwTg+Tk3aRo39hc1DZTSc4izBkpVydsU8vfoQ75ukAril+v3R+6ewjOGkr08x60AI5mlUZUIQg2sewNDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0QCPqPCCUDswZUC6kri3PJz4KzIbFvUy5HBHgRqCfV8=;
 b=XC1XKqPaBoiBe0Q841EXPBVZ/p/V/qbVKk9anJsAXSv2YdNuVCEqyFxtKEJgDNxpoNgwFFnBBN7bQu3Y8RvmFk5qFoV7rFnwdizcPgVEIjIiqpbyHo5PnIBfTLfQTbQftdixztjKCooG3pYof1LNOC81Ak7B58l9TTbWOBTHl4cKQzpKJ41/r6GQ0bSmNDnYaxidR7ylQPSLFC5KnM3fqJXJMSnSKBJXPRdHQGSJGrRtlNy1g/iYWnJeO0fJo4oar4VbElFvkAl1FglDhukW9x+OOVSbeAj7PyJonCTstE0hdVZFXEON71TMDnnRGL2mKIP9ViuRJfTpV+l1+mV5CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by SN7PR11MB7539.namprd11.prod.outlook.com (2603:10b6:806:343::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 04:39:04 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::737e:211a:bb53:4cd7%5]) with mapi id 15.20.5791.022; Thu, 3 Nov 2022
 04:39:04 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>, Nicolin Chen <nicolinc@nvidia.com>
Subject: RE: [PATCH 06/10] vfio-iommufd: Allow iommufd to be used in place of
 a container fd
Thread-Topic: [PATCH 06/10] vfio-iommufd: Allow iommufd to be used in place of
 a container fd
Thread-Index: AQHY6KK6QfY2Z63NYEOqTFk+KqN9SK4pvJ8AgAAYFACAACp0gIACq9JA
Date: Thu, 3 Nov 2022 04:39:03 +0000
Message-ID: <BN9PR11MB52767A0298EA3A1E3BAE91CA8C389@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <0-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <6-v1-4991695894d8+211-vfio_iommufd_jgg@nvidia.com>
 <BN9PR11MB527655AB662598A9D5F9F1778C369@BN9PR11MB5276.namprd11.prod.outlook.com>
 <Y2DkiM/o2wTf9Mjz@Asurada-Nvidia> <Y2EIJRtlpZ4Bq/8o@nvidia.com>
In-Reply-To: <Y2EIJRtlpZ4Bq/8o@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|SN7PR11MB7539:EE_
x-ms-office365-filtering-correlation-id: e7a07c43-f4da-47de-25af-08dabd5555f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mtZr2kStCnHPneyc1r7o88Ty+DgkxQLUuOmBYm5bcDvJ03ngf5SSIK3y4MoLyBys/jjUdy1gMceAMEge6qI2xKgI311t40Hc0oQKZgXx0kdtPiWPqOjbZOyVDnkpX0jlfVWv6+gncLVVYJdLqt4Cc/GRGh/60mR1hBqnlxkHQX7yHAMbGSWi0yNklvauOB6vHurTUy4CmeegtP4xiMcpIQsApsg7Jfm7Zn0zmzNNm4QNzvaM+Gyq5hVuyOzRmlPpf5wK8WZxd98NH+e5QAgEK2YiixrNvNY/GYkPaali9afI7bDGwOt+tHEZPzpTvfs3mhUhcmyVWIz30pvelmzazIFiEZCDfQZ8rLONw3OWThu3XDv0Au//GCxtjqy8CIapMKcZ0xPXfkw43g1lvHDgZtad1lOprKoApfXKjd3wqOz+ELMEbQ4UvrhIAdsh1FHs1NAdqLhEw49d6+ENvBkhaqyEOYO7oKtH4mW98fjkOgHfleLyNXUaqfSbydoHvOU00p03KUVe9SmhaQj9EGo1OY9PiLLeTebPFyereGQHJHI7xdNAa0mXYXSEiWkag63rIbXsJqM4yD+hhibeQyzVaw+EBLTAvKinxuzRQmu9hG0pgmGZDv1DAJIQqFlXif1iHdlv/whcN/sbj87Bx1Nr34R0cUe3nltFouuCsl1I7E1BwpNON9wwECfQDPhFUyG/W4s8PctY8uA4qPRheC1dGKoiCkbAV/iANoCmNNMH1VuVpu9zGnD4dCFsyNp2nTPCo5oiHereJgUG8sTmI14nNQgVN3t7fjySjnEqib5N7PY=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(366004)(39860400002)(136003)(346002)(376002)(451199015)(33656002)(66946007)(186003)(54906003)(110136005)(4326008)(66476007)(316002)(7696005)(8676002)(66556008)(6506007)(64756008)(66446008)(2906002)(76116006)(5660300002)(38100700002)(7406005)(52536014)(9686003)(7416002)(41300700001)(478600001)(8936002)(86362001)(4744005)(71200400001)(966005)(82960400001)(122000001)(55016003)(38070700005)(26005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dE4ybmJRWEM1ejJ0cXM3L0wzNjZ2SUZIV001d1o4TmJuVmlSeldmdjFyMG5L?=
 =?utf-8?B?REI3K3ZjeDBLS0s4T2ZJbndpcGZJemlrWUVsa1RGQ2kzQXpCSWh0QjliVVpv?=
 =?utf-8?B?R3luWHZxWTBRcE1LMjgvUEt0Vyt2dFdkWXVlMWJRenVuNEdrOFZybUQ1YUdN?=
 =?utf-8?B?UVViVTJsaXhJL1NrQStJVk80em9OWE95N2tiU2w0WWJYSWJ1N1A1bG96OUJ4?=
 =?utf-8?B?cDgxc1FyT1orKzFLdEJrOGdNWkJWTFNTcTlFZ29xNTczWGtVdWNpWmIrZVJr?=
 =?utf-8?B?SFFCU1Via1hLWTFROENWbEdhNHE2WCtQYlFVTGk5cXNhalBJZU56MktBbUUv?=
 =?utf-8?B?dVZxMlczNGNJbUlkNW42NXF1eUVMZzZHSDZiWWZUZWlvZlM0TmlhMGw5Nkl3?=
 =?utf-8?B?ekZGTnJyZG9LY1MvcWFLU3dhRitYL1hnZnlTcTNzN2U5V1NCVXUrUDFoS2VS?=
 =?utf-8?B?YVVmaU5lNUVpa2d4aW9kSWsweUNPeTFWY0l2QldsV2Y4V1hOTDkweDB1TEtL?=
 =?utf-8?B?aEd5dU8yL0RnUmJidm1XV1QraWZNMUxjaHlaQUp3dkhDb3BodERoMStYcHJQ?=
 =?utf-8?B?enBoY1hMdzVneU5qbHpGL3Bzb1pxczF6eWxOWWdnMmMvbDJwcmZnUXdiYlA3?=
 =?utf-8?B?VnRScHA2clY5YVQzZ1Mwbkt0N3pDcVdXcEUvWXBxQmlxN2paTWowS1BYalB0?=
 =?utf-8?B?aVdsR2lzS1dzSUtHS3M1NDZvcS9oLytJSW9qcWtOU2gvc2xzdEk4cWZzdlZi?=
 =?utf-8?B?MDNQK2dTYnBBSEU1R3dPZ0hjakhXUWxJQldlb1ZQUlh5KzZURTUwSzB2TEN6?=
 =?utf-8?B?a3pCUVkzTGRTSVNnOTVRdWF4TWY5Mmk0Rm1HSmo3ZjNGeTRDcTRWbFU0Mmt3?=
 =?utf-8?B?eHRLdFRUOGs4a1htWnZObS9rdWpVZW14TmNHU1NJZ3pEem02dzF0aVJvd2dp?=
 =?utf-8?B?TVRsQXh1Rm1xMmtCTENEcG5yUWE3dldoNWZHeW02RVk0djhWTEdQbGd3ZkZM?=
 =?utf-8?B?QkU5OHlpNXRIb2xpNWh4NUZtdm5nNE5GVG9xcUMrNjNzUFBFWWJ3bjVWSWht?=
 =?utf-8?B?Z1VmcUd2RVQ1SFcySUhEaHFvbU9BSVhTVS85WWQrTGdjcldhVThMR0tkdVly?=
 =?utf-8?B?Szl6eVRjQjdIUnozMDZiWEFNeGpKbGRJSXRkdjVYVHB1em9ZVWhFRlA1TTNV?=
 =?utf-8?B?OHUrUk9JT1JiOXNPV2M4ZmN2alNmRTBDc29kOTBmZEx3YzFkcDNZeldzNmtq?=
 =?utf-8?B?UGN6dTlMdDgvbzJFOGFsN1NlYnoxdVh3czF1TmpZdDJqSmhZTzJuYmFxRjNt?=
 =?utf-8?B?U2VZVXJsSlo3MXBMN2pVM2lTTGNxRmhXMmJVTXVIY01HSUlvZjZJTTdHMUVH?=
 =?utf-8?B?UG9iWEZ3Z091Z2paYWwrczV5VXJUQWJ4MEZmN2wyR25leWRxS1FCZmVXV0pM?=
 =?utf-8?B?bUVmcTl6aFAvZFFxTFdiWGg4Y0lnQjRtTTdyUW9rUEFGdUZ2S3RkUFgrQ3Bs?=
 =?utf-8?B?TGRYbDFXUnlZdkpIMUU2NHpFNGNFeUxlRVlseUM5anlZS1N2Y0hYdm5FSWdz?=
 =?utf-8?B?VCtTRzZOZWtPVkZwZjBZWDQ4cGt2dFJydW4wM0xFa2xyZG9HQndjVEhubnhI?=
 =?utf-8?B?NUphSkZ2R1B5c2dOck1RVFY3Z1A3LzRMS3REd1lhV3NDOXIrK2FzSmdEYWJm?=
 =?utf-8?B?eHVZUTcrdGRsa1ZNWkxaZ0wyaXZRc3Z1OGo4WFlJR2owcVppcHNEVW1Hay8z?=
 =?utf-8?B?N21vUlgvaVJIOVVMR3BxbHNOUU1aWVd1NFVjMjllK1Y1Zjh2OVc5MW53QXVJ?=
 =?utf-8?B?Wm5sbVFlbWNzay8wL2QrUkV2cGhNQk41Y1Y1YXlpdExNR05rL2RBVGloWTNy?=
 =?utf-8?B?OG1ubWNuT1lUL3hXTUNJZjI3aHo3STBodXl0WVFFN1RPc1hxZ09FcFJVVzZL?=
 =?utf-8?B?R1hrTVRzTzhtWldPckhsamdHSjBCdG9vckdENWQvc0Vaa1hJQTJ2SVdtR3Bu?=
 =?utf-8?B?QUJocWJnbXo2R0d4RDNjRWQ0N1p1cWh4VVcxSlo3dTEvTGJRWG1lYy9OUE9u?=
 =?utf-8?B?VTN4dUJmWWFaZlR0SWExbVFtWTJpenhHbmJvN3RMZzFVVjZoM1ZzbDZ2YXE3?=
 =?utf-8?Q?qkJBSIJdxHG/2xA+OgQaNNB5S?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7a07c43-f4da-47de-25af-08dabd5555f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2022 04:39:03.7876 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /GfbbpmImaDd3u3xHTFWr7D40NX3GCeF06BR2MdHgPlQG0YWf6upLrRFpxdWV5XFu5AvxuMYqc0lOnMHv38AkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7539
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
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Longfang Liu <liulongfang@huawei.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "Liu,
 Yi L" <yi.l.liu@intel.com>, Matthew
 Rosato <mjrosato@linux.ibm.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Wang,
 Zhi A" <zhi.a.wang@intel.com>, Jason
 Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Eric
 Auger <eric.auger@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Harald
 Freudenberger <freude@linux.ibm.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 Tony Krowiak <akrowiak@linux.ibm.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Yishai Hadas <yishaih@nvidia.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>, Shameer
 Kolothum <shameerali.kolothum.thodi@huawei.com>,
 Sven Schnelle <svens@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPg0KPiBTZW50OiBUdWVzZGF5
LCBOb3ZlbWJlciAxLCAyMDIyIDc6NTEgUE0NCj4gDQo+IE9uIFR1ZSwgTm92IDAxLCAyMDIyIGF0
IDAyOjE5OjA0QU0gLTA3MDAsIE5pY29saW4gQ2hlbiB3cm90ZToNCj4gPiBPbiBUdWUsIE5vdiAw
MSwgMjAyMiBhdCAwODowOTo1MkFNICswMDAwLCBUaWFuLCBLZXZpbiB3cm90ZToNCj4gPg0KPiA+
ID4gPiBGcm9tOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPg0KPiA+ID4gPiBTZW50
OiBXZWRuZXNkYXksIE9jdG9iZXIgMjYsIDIwMjIgMjo1MSBBTQ0KPiA+ID4gPg0KPiA+ID4gPiAg
bWVudWNvbmZpZyBWRklPDQo+ID4gPiA+ICAgICAgIHRyaXN0YXRlICJWRklPIE5vbi1Qcml2aWxl
Z2VkIHVzZXJzcGFjZSBkcml2ZXIgZnJhbWV3b3JrIg0KPiA+ID4gPiAgICAgICBzZWxlY3QgSU9N
TVVfQVBJDQo+ID4gPiA+ICsgICAgIGRlcGVuZHMgb24gSU9NTVVGRCB8fCAhSU9NTVVGRA0KPiA+
ID4NCj4gPiA+IE91dCBvZiBjdXJpb3NpdHkuIFdoYXQgaXMgdGhlIG1lYW5pbmcgb2YgdGhpcyBk
ZXBlbmRlbmN5IGNsYWltPw0KPiA+DQo+ID4gImlzIGl0IGEgbW9kdWxlIG9yIG5vdCIgLS0gZnJv
bSBodHRwczovL2x3bi5uZXQvQXJ0aWNsZXMvNjgzNDc2Lw0KPiANCj4gWWVzLCBpdCBpcyB0aGUg
a2NvbmZpZyBwYXR0ZXJuIGZvciAiVGhpcyBzeW1ib2wgb3B0aW9uYWxseSB1c2VzIHRoZQ0KPiBv
dGhlciBzeW1ib2wsIGFuZCBpZiB0aGUgb3RoZXIgc3ltYm9sIGlzIHR1cm5lZCBvbiB0aGVuIGl0
IGhhcyB0byBiZQ0KPiB0aGUgcmlnaHQgeS9tIHZhbHVlIg0KPiANCj4gaWUgcmVqZWN0cyB2Zmlv
IGJlaW5nIGJ1aWx0LWluIGJ1dCBpb21tdWZkIGJlaW5nIGEgbW9kdWxlDQo+IA0KDQpUaGFua3Mu
IGEgZ29vZCBsZWFybmluZy4g8J+Yig0K
