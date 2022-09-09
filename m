Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C88FA5B31FA
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 10:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC09F10E58A;
	Fri,  9 Sep 2022 08:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D8F10E58A;
 Fri,  9 Sep 2022 08:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662712968; x=1694248968;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Cbvh/0gxGrIky4n6j4ntmS3XDSCP7OfRC8OMs2KUmMw=;
 b=cgU2yqZqziwDcysDg68IiIB5cObOkK/zVy55sv4cSuNFgvcdL0vUDGPL
 yJCshoaPPjYvL8D6n4P946vqsHK6xwGmfb0zcbSxdpeXVsC4I/CHOStWM
 Q18U2w+1NKbud9qeN1fsqWg8tc1ESa9JDNsGe3jKATgVl7WycN7y/L9P2
 XIfoBtsFQ7Rsx3DUcDWQLCrqwuGRBux2g4aPjZqMpuyJYZ0lm0hBLFLoC
 yVRvgECmDCQ5fERn4VVflD7QC79KJk3xl7Ygj+QL4JYHVfyd7/qxx7nsG
 43yD5zCLtf1L48dm0zEcgQAVV65qtVJ82yUo32o8XTRlXUYSXpUXU4BlS w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="383722669"
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="383722669"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2022 01:42:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,302,1654585200"; d="scan'208";a="592533845"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP; 09 Sep 2022 01:42:47 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 9 Sep 2022 01:42:47 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 9 Sep 2022 01:42:47 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 9 Sep 2022 01:42:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=goiTbaO0XoAYLsEMlLrVEBfQxYbifyJ1QGDcbVikX3QA+ucJzhKx4prNmjrikiYIoTCbYUG4YKkRyEWP90M5dVvfjJcws5cXTdQl9kpmyXM77U6jQ1W0M/+2jAG2O5eB2nCUiT05gvu4GTMxsIUOUHKnlr77sc4h78aL6B856B7jouzetJ8yQf9P+dO5KSPWqaWATsPVw99UgYMdNljbS5o11Jd8oliot2WIFAH46pXrK3wRavftoPPVDF2YrPu62zy4JUbaSzNIETi1zQytLVI573C4J5pV7saGcqTZ3V0Nc+/vO2+0T6zDZ7Zg0cr2q085XdSCgiDi10KkfwEpwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cbvh/0gxGrIky4n6j4ntmS3XDSCP7OfRC8OMs2KUmMw=;
 b=mOPlWDjLUni8ivRreq2NYr6eNTJ03OLhndZEuig+h57lujTF8wTYwsni2NLdBA9AZ+jjaYjc7yxsh0WIUEP29veYbUmXRjOMOd0nhj8K08ZAP0OY1QHgn/6PyO87iiz4tQOl4h7GO3cYIxoZ2P1++GHdF7S7m/Io0z0e9IYxFXOhSGJxr6uKY3Lmsrna9263BkC92RM8o5RHcnN52l0OI3yObM01nDP2m/GbTD/zgPgXljNluwPjW9Lu3QShKoSyJAisq2eCNhCALaDwZwQRtMmtXhIEKAvD3AuE0NLIdMZL96kY64BUXiZX8xkck2P80RqST951SoK6OAzGMBCO0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by BN9PR11MB5244.namprd11.prod.outlook.com (2603:10b6:408:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.20; Fri, 9 Sep
 2022 08:42:26 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 08:42:26 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Ethan Zhao <haifeng.zhao@linux.intel.com>, Zhenyu Wang
 <zhenyuw@linux.intel.com>, "Wang, Zhi A" <zhi.a.wang@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Eric Farman
 <farman@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic
 <pasic@linux.ibm.com>, Vineeth Vijayan <vneethv@linux.ibm.com>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger
 <freude@linux.ibm.com>, Diana Craciun <diana.craciun@oss.nxp.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Longfang Liu <liulongfang@huawei.com>, Shameer Kolothum
 <shameerali.kolothum.thodi@huawei.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Yishai Hadas <yishaih@nvidia.com>, Eric Auger <eric.auger@redhat.com>, "Kirti
 Wankhede" <kwankhede@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Abhishek
 Sahu <abhsahu@nvidia.com>, Christoph Hellwig <hch@infradead.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: RE: [PATCH v3 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Thread-Topic: [PATCH v3 01/15] vfio: Add helpers for unifying vfio_device life
 cycle
Thread-Index: AQHYw/jLjZLOoaiy7EuTkF4i11USR63WwwyAgAADXPA=
Date: Fri, 9 Sep 2022 08:42:25 +0000
Message-ID: <BN9PR11MB5276E41114EEE687975C698F8C439@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220909102247.67324-1-kevin.tian@intel.com>
 <20220909102247.67324-2-kevin.tian@intel.com>
 <acbaf0f2-91d4-3eae-5716-244893ca34c7@linux.intel.com>
In-Reply-To: <acbaf0f2-91d4-3eae-5716-244893ca34c7@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|BN9PR11MB5244:EE_
x-ms-office365-filtering-correlation-id: 23cbfd69-30ae-44c5-3e27-08da923f38b0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HcBhQCcJPMBfX/iAEL0r94VgQ+ZxTidZbuiuVK+3lr+LgXegLB3xwGjPQPiBUAUwpA7Q2uV+mwz43/80eboOaZDdBX9YtmpVdO//nRXdL2F2utpqptYT6sgBSB0oHQJlnDg/1XX3K68jL4AGCoobf/+FRft9/c9kbbIDTXr8m5Nj6HtOxpl0WqAVbVCToZdxsTSBuhs5TidU1SEIF73owoa5+diR7ubewsyWRfYtt1DsgXgplx8o/VxEzRjPQ8bVwM02MCCDKbWWf7b/6h86OR5pgMW1hi2E79dz9B+NDK9s3RD8Imo/5TJml+UGPAZuEkaIOsFn338W0toFwlKMJht8dZRQt5c+OvQ3Raa3OrlDmh5hG9iih3RqEvah5Fx82D6HvPE2qbwLsyEwoIK+kyVvs6Z6qNMKbGo/4v1uUatOY3ThHGD/jXIuEpP4+uUXGDuXuCzuOvjrs0Ij+i0+zLY1Smx8Fa7Wyz1GNhYawjLfyk3BQeOkE0V2KkEdJ9VaCCc2uF956W4Vcw4UJ2jmLdXnnk7FOTatGY9OKP3+8h2rpiH4EQpn2lyHBzi7+DQu1LTNjLiGRJh55ElremRTKHVK1+F3HDAaAQIR9dcAzij3wUl+/p8TPaEtujzOqqh3o+S22fPxRunRD79U4zZPb+4dCBc5Nm4ekX1X1mBx90WGWmrZ7afeMyvjCh7yex4kkLBFlYlWIHnzjAPFlyYZR/OcPg5kFyRS1Rf/O0wrdKlmWkxWGueVsL1HFpuM24/HyB7eDHGG1nV29H54sRQDBP+Rv0r8rcgh00KrE0Bf2Qo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(136003)(366004)(39860400002)(346002)(396003)(71200400001)(478600001)(41300700001)(26005)(186003)(7696005)(83380400001)(6506007)(9686003)(7406005)(2906002)(7416002)(55016003)(4326008)(66946007)(76116006)(33656002)(8676002)(110136005)(316002)(8936002)(52536014)(66556008)(5660300002)(66446008)(64756008)(66476007)(122000001)(38100700002)(82960400001)(921005)(38070700005)(86362001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eFlpNDRNZHdoVzBTMkpuSEhhTXhzN3I3ZVpGVmp5TUFRdTNFZThkUjVaYTJm?=
 =?utf-8?B?Ly9TclA4OEdkWkxTblZMWXRhcWc0a0hqVWErS2hzd0dmaFptNk9MV1RWUWlK?=
 =?utf-8?B?RUxONHF6cEZLeVVNWFVQM01vOFNHdG1rVC9uLzN1OUZtaURJN3RtaURHbXNQ?=
 =?utf-8?B?WkFIM3loNUMvZThneXd1NjgyMGt3aTlXSGJzZTlaN1Z2eHBiRm1aNk8vS1lE?=
 =?utf-8?B?WDJpaklicy9uZWpHdUxTL0ZUZ0lQdHZpMkRyM1lIcDB5eHlFWlRSeXNTVmw1?=
 =?utf-8?B?QmZ4N0dNZ2R6dkdnUFBGcnh6VlhCWkg3MTVibnh5eXlwT2VKS0FPU3ZQN0FR?=
 =?utf-8?B?WG0vRHRCS0paV2J1YnBqVVZWcnRhdlUwdEZuemwrejAxZDR1R054K0tzZG9U?=
 =?utf-8?B?OEpiVlVMZ0NveTgwVVovTXhtMUlwZDdEMU1NY01ENUo3ZFNycGNXNkpIRGhv?=
 =?utf-8?B?NFVuRnpiK1p1bDdvdXBRV2ttYUpmWnd6VXRleFE4MGtrUXc5MldXeC9pMXRF?=
 =?utf-8?B?M2xHL2RSQkNweVZZZkJYYTE3SDM1UnZtdXp3aitvVkdtZlZNa0VKUmJwVDFw?=
 =?utf-8?B?WkVmcTZqcU5DYytteXBoVzNTcWVTbFdaR1dsRllWcVovK3U5eWhMQ2lKYzdO?=
 =?utf-8?B?Y0ZxNjlLN0VNL0dJaEhhdUFmMVQ1NXA2enV4cW4yNDN1aVNqcXZjZytOTVho?=
 =?utf-8?B?YkkzSXFuOENVLzhtVnpmWnMydG1Mc2lVVUU4dnVsREo5Y2xOOUVPZnExeEpr?=
 =?utf-8?B?NDAvNmc1bUwyQnQ2OCtWbVlINkgrdC9WSHc4TFRuSXN3Uk9zSko3OWZFWjRN?=
 =?utf-8?B?R1FzVUVWMkkyN25zMWtGclE0RkRUQmdnRWtMbnI1SUJieXA2SGJ5QmJ1djc3?=
 =?utf-8?B?a29hQjRSemE2TWIxNWxVb0xObXlYeGE0VXZWUG9PemxIZ3lrVE40YlAwNVU2?=
 =?utf-8?B?eDR4MFB5aGF5dVMrajduVVY3aDVWUUJiVThRYlFIeUU5WXBiVDBLbFhiU3N6?=
 =?utf-8?B?MkNLQ1phTTI1RSt6RThMWHFXaHYvZFBlNkNrajNOK1k3V1BjNWJCMWF1TE1C?=
 =?utf-8?B?OEZsdE15ZHhISTFCRnNVcCtDelZ3MG5HbDcwMFJCRndvaHVGRDdSVFp1R0NJ?=
 =?utf-8?B?RXRyZndHQ1RHQTZSeUx6Y28rYXM5RFRaZHpLaG04WE82Z1BkUUM1am5iTXMw?=
 =?utf-8?B?VVRDcERxM3F5cHJ2M2NLdFdkZnhMRDd3dUJXZDZaY0s4ZzNkNzc1UTNSS1E1?=
 =?utf-8?B?T2N1N0JFK0g3Sy9JZ1orRGlaV1laM1RzSURiWFBFekZSOUV4Q0trLzZEOTRh?=
 =?utf-8?B?eXJWMmo4d3RFbzk3NDNDR0FqbEpuRXRhTlNWRjNhMmFHZDltSEtZTGd2QlVK?=
 =?utf-8?B?UFlrTVZTNFo3YnBLQXRRL0dKdjVBUDhlSEU0bXo2MldmaTdXMERCcU14WmpP?=
 =?utf-8?B?aXFtOXpHY2lvS3BNZHZPVHk1REsxaHFsZnVzRytNSENZN09NUUJIK1diU0JV?=
 =?utf-8?B?QkNJT3BHcm9JSGdKMVBhZ2M4Ykd2eXpGTWlzUlBEWEFNNjhZZEp5cm9pTGFV?=
 =?utf-8?B?bFhFSHZOWDViWi9kYmFHaE16cDNoS1czRlJaTEVseFpCY0pYSWh6U2I5UVVM?=
 =?utf-8?B?K1VDYysvc1A4OTdzNU5QQUY4dkw5ZEVoV09YdFk1bXJQeTRwMHg4bFJBenhq?=
 =?utf-8?B?SC9sU1VxcTdyOThRYlFBZmQ4UzYzaGpQbjN6YUZRTVo1bXVhVUJzcUhBVjdu?=
 =?utf-8?B?dVE3OTJqMEw3YjNVSjR5L21nY3VnV2g5b0xnSkR5WWkxQitwYWpjWDVlZ2p1?=
 =?utf-8?B?bHI2WVY1YkxiWElJWlFGblJJOTlRbkJaVlVEdnRMTlEyQUlENy9ta3VpTDVp?=
 =?utf-8?B?Um8zMnhKaWtvelZpaGxpL3dscnJsejZjRGpXSFliNTM5RVJodStvVWxXSzhu?=
 =?utf-8?B?OElPQlhRalNrM3hUOVd0ZEpRTzBPNVp5blIvUlFnRmJKNHJrZUM5WTRFajBj?=
 =?utf-8?B?cENiZGxjUHRabmkreHZlQWY0bzlBQVQxQjIvSGlYOWpFTWRoQ1pSUnhIMitm?=
 =?utf-8?B?c1dWVXZ4T3ZrT0JDUnlFeTRsUjFMSkVGejBSRXRHdjVvRHY2YmFDLzd6UGRQ?=
 =?utf-8?Q?g7mtUhEpsQU7LMFJW5MudK8+6?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cbfd69-30ae-44c5-3e27-08da923f38b0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 08:42:25.7547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hDaMRV6ojkii7sib099zLC2XN62V1Ku1UAposBn4s2H/nSZs911rTNb+hi0W6P5eqZFaJdATu+Nydv5dNWczEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5244
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
Cc: "Liu, Yi L" <yi.l.liu@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiBGcm9tOiBFdGhhbiBaaGFvIDxoYWlmZW5nLnpoYW9AbGludXguaW50ZWwuY29tPg0KPiBTZW50
OiBGcmlkYXksIFNlcHRlbWJlciA5LCAyMDIyIDQ6MjQgUE0NCj4gDQo+IEhpLCBLZXZpbiwNCj4g
DQo+IOWcqCAyMDIyLzkvOSAxODoyMiwgS2V2aW4gVGlhbiDlhpnpgZM6DQo+ID4gVGhlIGlkZWEg
aXMgdG8gbGV0IHZmaW8gY29yZSBtYW5hZ2UgdGhlIHZmaW9fZGV2aWNlIGxpZmUgY3ljbGUgaW5z
dGVhZA0KPiA+IG9mIGR1cGxpY2F0aW5nIHRoZSBsb2dpYyBjcm9zcyBkcml2ZXJzLiBUaGlzIGlz
IGFsc28gYSBwcmVwYXJhdG9yeQ0KPiA+IHN0ZXAgZm9yIGFkZGluZyBzdHJ1Y3QgZGV2aWNlIGlu
dG8gdmZpb19kZXZpY2UuDQo+ID4NCj4gPiBOZXcgcGFpciBvZiBoZWxwZXJzIHRvZ2V0aGVyIHdp
dGggYSBrcmVmIGluIHZmaW9fZGV2aWNlOg0KPiA+DQo+ID4gICAtIHZmaW9fYWxsb2NfZGV2aWNl
KCkNCj4gPiAgIC0gdmZpb19wdXRfZGV2aWNlKCkNCj4gDQo+IFRvIGJlIGhvbmVzdCwgdGhpcyBw
YWlyIG9mIGZ1bmN0aW9ucyBtYWtlIG1lIGNvbmZ1c2luZyB0byB1bmRlcnN0YW5kIHRoZWlyDQo+
IA0KPiBiZWhhdmlvdXIgZnJvbSB3b3JkaW5nIHBvaW50IG9mIHZpZXc6DQo+IA0KPiAtIHZmaW9f
YWxsb2NfZGV2aWNlKCksICBPa2F5LCBpdCBhbGxvY2F0ZXMgdGhlIHZmaW8gZGV2aWNlLCBubyBy
ZWZlcmVuY2UNCj4gICBjb3VudCB0aGluZy4gYnV0LA0KDQpJIHRoaW5rIGl0J3MgcXVpdGUgY29t
bW9uIHRvIGhhdmUgYW4gYWxsb2MoKSBoZWxwZXIgaW5pdGlhbGl6ZSByZWZjb3VudCwgZS5nLg0K
dmZpb19ncm91cF9hbGxvYygpIGJvdGggaW5pdGlhbGl6ZSBpdHMgdXNlciByZWZjb3VudCBhbmQg
YWxzbyBjYWxsDQpkZXZpY2VfaW5pdGlhbGl6ZSgpICB0byBnZXRzIGtyZWYgaW5pdGlhbGl6ZWQu
IFNpbWlsYXIgZXhhbXBsZSBpbg0KaWJfYWxsb2NfZGV2aWNlKCksIGV0Yy4NCg0KPiAtIHZmaW9f
cHV0X2RldmljZSgpDQo+ICAgc2VlbXMgaXQgd2lsbCBkZWNyZWFzZSByZWZlcmVuY2UgY291bnQg
YW5kIHRoZW4gaWYgaXQgaXMgemVybywgZnJlZSBpdC4NCj4gICBzbyB0aGV5IGFyZSBub3Qgb2Yg
b25lICpwYWlyKiBhYm91dCB3b3JkaW5nLg0KPiANCj4gSG93IGFib3V0DQo+IA0KPiAtIHZmaW9f
YWxsb2NfZGV2aWNlKCkgLyAtIHZmaW9fZnJlZV9kZXZpY2UoKQ0KPiBvcg0KPiAtIHZmaW9fZ2V0
X2RldmljZSgpIC8gLSB2ZmlvX3B1dF9kZXZpY2UoKSwgcGVyaGFwcyBub3QgbWF0Y2ggdGhlaXIg
YmVodmlvdXINCj4gaW4gZm9sbG93aW5nIGNvZGUuDQo+IA0KPiANCj4gDQo+IFRoYW5rcywNCj4g
RXRoYW4NCj4gDQo+IA0KPiA+DQo+ID4gRHJpdmVycyBjYW4gcmVnaXN0ZXIgQGluaXQvQHJlbGVh
c2UgY2FsbGJhY2tzIHRvIG1hbmFnZSBhbnkgcHJpdmF0ZQ0KPiA+IHN0YXRlIHdyYXBwaW5nIHRo
ZSB2ZmlvX2RldmljZS4NCj4gPg0KPiA+IEhvd2V2ZXIgdmZpby1jY3cgZG9lc24ndCBmaXQgdGhp
cyBtb2RlbCBkdWUgdG8gYSBsaWZlIGN5Y2xlIG1lc3MNCj4gPiB0aGF0IGl0cyBwcml2YXRlIHN0
cnVjdHVyZSBtaXhlcyBib3RoIHBhcmVudCBhbmQgbWRldiBpbmZvIGhlbmNlIG11c3QNCj4gPiBi
ZSBhbGxvY2F0ZWQvZnJlZWQgb3V0c2lkZSBvZiB0aGUgbGlmZSBjeWNsZSBvZiB2ZmlvIGRldmlj
ZS4NCj4gPg0KPiA+IFBlciBwcmlvciBkaXNjdXNzaW9ucyB0aGlzIHdvbid0IGJlIGZpeGVkIGlu
IHNob3J0IHRlcm0gYnkgSUJNIGZvbGtzLg0KPiA+DQo+ID4gSW5zdGVhZCBvZiB3YWl0aW5nIGZv
ciB0aG9zZSBtb2RpZmljYXRpb25zIGludHJvZHVjZSBhbm90aGVyIGhlbHBlcg0KPiA+IHZmaW9f
aW5pdF9kZXZpY2UoKSBzbyBjY3cgY2FuIGNhbGwgaXQgdG8gaW5pdGlhbGl6ZSBhIHByZS1hbGxv
Y2F0ZWQNCj4gPiB2ZmlvX2RldmljZS4NCj4gPg0KPiA+IEZ1cnRoZXIgaW1wbGljYXRpb24gb2Yg
dGhlIGNjdyB0cmljayBpcyB0aGF0IHZmaW9fZGV2aWNlIGNhbm5vdCBiZQ0KPiA+IGZyZWVkIHVu
aWZvcm1seSBpbiB2ZmlvIGNvcmUuIEluc3RlYWQsIHJlcXVpcmUgKkVWRVJZKiBkcml2ZXIgdG8N
Cj4gPiBpbXBsZW1lbnQgQHJlbGVhc2UgYW5kIGZyZWUgdmZpb19kZXZpY2UgaW5zaWRlLiBUaGVu
IGNjdyBjYW4gY2hvb3NlDQo+ID4gdG8gZGVsYXkgdGhlIGZyZWUgYXQgaXRzIG93biBkaXNjcmV0
aW9uLg0KPiA+DQo+ID4gQW5vdGhlciB0cmljayBkb3duIHRoZSByb2FkIGlzIHRoYXQga3Z6YWxs
b2MoKSBpcyB1c2VkIHRvIGFjY29tbW9kYXRlDQo+ID4gdGhlIG5lZWQgb2YgZ3Z0IHdoaWNoIHVz
ZXMgdnphbGxvYygpIHdoaWxlIGFsbCBvdGhlcnMgdXNlIGt6YWxsb2MoKS4NCj4gPiBTbyBkcml2
ZXJzIHNob3VsZCBjYWxsIGEgaGVscGVyIHZmaW9fZnJlZV9kZXZpY2UoKSB0byBmcmVlIHRoZQ0K
PiA+IHZmaW9fZGV2aWNlIGluc3RlYWQgb2YgYXNzdW1pbmcgdGhhdCBrZnJlZSgpIG9yIHZmcmVl
KCkgaXMgYXBwbGlhYmxlLg0KPiA+DQo+ID4gTGF0ZXIgb25jZSB0aGUgY2N3IG1lc3MgaXMgZml4
ZWQgd2UgY2FuIHJlbW92ZSB0aG9zZSB0cmlja3MgYW5kDQo+ID4gZnVsbHkgaGFuZGxlIHN0cnVj
dHVyZSBhbGxvYy9mcmVlIGluIHZmaW8gY29yZS4NCj4gPg0KPiA+IEV4aXN0aW5nIHZmaW9fe3Vu
fWluaXRfZ3JvdXBfZGV2KCkgd2lsbCBiZSBkZXByZWNhdGVkIGFmdGVyIGFsbA0KPiA+IGV4aXN0
aW5nIHVzYWdlcyBhcmUgY29udmVydGVkIHRvIHRoZSBuZXcgbW9kZWwuDQo+ID4NCj4gPiBTdWdn
ZXN0ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRpYS5jb20+DQo+ID4gQ28tZGV2ZWxv
cGVkLWJ5OiBZaSBMaXUgPHlpLmwubGl1QGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBZ
aSBMaXUgPHlpLmwubGl1QGludGVsLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBLZXZpbiBUaWFu
IDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gPiBSZXZpZXdlZC1ieTogVG9ueSBLcm93aWFrIDxh
a3Jvd2lha0BsaW51eC5pYm0uY29tPg0KPiA+IFJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUg
PGpnZ0BudmlkaWEuY29tPg0KPiA+IFJldmlld2VkLWJ5OiBFcmljIEF1Z2VyIDxlcmljLmF1Z2Vy
QHJlZGhhdC5jb20+DQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL3ZmaW8vdmZpb19tYWluLmMgfCA5
Mg0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICBpbmNs
dWRlL2xpbnV4L3ZmaW8uaCAgICAgfCAyNSArKysrKysrKysrLQ0KPiA+ICAgMiBmaWxlcyBjaGFu
Z2VkLCAxMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmZpby92ZmlvX21haW4uYyBiL2RyaXZlcnMvdmZpby92ZmlvX21haW4uYw0K
PiA+IGluZGV4IDI3ZDkxODZmMzVkNS4uYWRjMWI2OTdiYjc4IDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvdmZpby92ZmlvX21haW4uYw0KPiA+ICsrKyBiL2RyaXZlcnMvdmZpby92ZmlvX21haW4u
Yw0KPiA+IEBAIC00OTgsNiArNDk4LDk4IEBAIHZvaWQgdmZpb191bmluaXRfZ3JvdXBfZGV2KHN0
cnVjdCB2ZmlvX2RldmljZQ0KPiAqZGV2aWNlKQ0KPiA+ICAgfQ0KPiA+ICAgRVhQT1JUX1NZTUJP
TF9HUEwodmZpb191bmluaXRfZ3JvdXBfZGV2KTsNCj4gPg0KPiA+ICsvKiBSZWxlYXNlIGhlbHBl
ciBjYWxsZWQgYnkgdmZpb19wdXRfZGV2aWNlKCkgKi8NCj4gPiArdm9pZCB2ZmlvX2RldmljZV9y
ZWxlYXNlKHN0cnVjdCBrcmVmICprcmVmKQ0KPiA+ICt7DQo+ID4gKwlzdHJ1Y3QgdmZpb19kZXZp
Y2UgKmRldmljZSA9DQo+ID4gKwkJCWNvbnRhaW5lcl9vZihrcmVmLCBzdHJ1Y3QgdmZpb19kZXZp
Y2UsIGtyZWYpOw0KPiA+ICsNCj4gPiArCXZmaW9fdW5pbml0X2dyb3VwX2RldihkZXZpY2UpOw0K
PiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBrdmZyZWUoKSBjYW5ub3QgYmUgZG9uZSBoZXJlIGR1
ZSB0byBhIGxpZmUgY3ljbGUgbWVzcyBpbg0KPiA+ICsJICogdmZpby1jY3cuIEJlZm9yZSB0aGUg
Y2N3IHBhcnQgaXMgZml4ZWQgYWxsIGRyaXZlcnMgYXJlDQo+ID4gKwkgKiByZXF1aXJlZCB0byBz
dXBwb3J0IEByZWxlYXNlIGFuZCBjYWxsIHZmaW9fZnJlZV9kZXZpY2UoKQ0KPiA+ICsJICogZnJv
bSB0aGVyZS4NCj4gPiArCSAqLw0KPiA+ICsJZGV2aWNlLT5vcHMtPnJlbGVhc2UoZGV2aWNlKTsN
Cj4gPiArfQ0KPiA+ICtFWFBPUlRfU1lNQk9MX0dQTCh2ZmlvX2RldmljZV9yZWxlYXNlKTsNCj4g
PiArDQo+ID4gKy8qDQo+ID4gKyAqIEFsbG9jIGFuZCBpbml0aWFsaXplIHZmaW9fZGV2aWNlIHNv
IGl0IGNhbiBiZSByZWdpc3RlcmVkIHRvIHZmaW8NCj4gPiArICogY29yZS4NCj4gPiArICoNCj4g
PiArICogRHJpdmVycyBzaG91bGQgdXNlIHRoZSB3cmFwcGVyIHZmaW9fYWxsb2NfZGV2aWNlKCkg
Zm9yIGFsbG9jYXRpb24uDQo+ID4gKyAqIEBzaXplIGlzIHRoZSBzaXplIG9mIHRoZSBzdHJ1Y3R1
cmUgdG8gYmUgYWxsb2NhdGVkLCBpbmNsdWRpbmcgYW55DQo+ID4gKyAqIHByaXZhdGUgZGF0YSB1
c2VkIGJ5IHRoZSBkcml2ZXIuDQo+ID4gKyAqDQo+ID4gKyAqIERyaXZlciBtYXkgcHJvdmlkZSBh
biBAaW5pdCBjYWxsYmFjayB0byBjb3ZlciBkZXZpY2UgcHJpdmF0ZSBkYXRhLg0KPiA+ICsgKg0K
PiA+ICsgKiBVc2UgdmZpb19wdXRfZGV2aWNlKCkgdG8gcmVsZWFzZSB0aGUgc3RydWN0dXJlIGFm
dGVyIHN1Y2Nlc3MgcmV0dXJuLg0KPiA+ICsgKi8NCj4gPiArc3RydWN0IHZmaW9fZGV2aWNlICpf
dmZpb19hbGxvY19kZXZpY2Uoc2l6ZV90IHNpemUsIHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiAr
CQkJCSAgICAgICBjb25zdCBzdHJ1Y3QgdmZpb19kZXZpY2Vfb3BzICpvcHMpDQo+ID4gK3sNCj4g
PiArCXN0cnVjdCB2ZmlvX2RldmljZSAqZGV2aWNlOw0KPiA+ICsJaW50IHJldDsNCj4gPiArDQo+
ID4gKwlpZiAoV0FSTl9PTihzaXplIDwgc2l6ZW9mKHN0cnVjdCB2ZmlvX2RldmljZSkpKQ0KPiA+
ICsJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOw0KPiA+ICsNCj4gPiArCWRldmljZSA9IGt2emFs
bG9jKHNpemUsIEdGUF9LRVJORUwpOw0KPiA+ICsJaWYgKCFkZXZpY2UpDQo+ID4gKwkJcmV0dXJu
IEVSUl9QVFIoLUVOT01FTSk7DQo+ID4gKw0KPiA+ICsJcmV0ID0gdmZpb19pbml0X2RldmljZShk
ZXZpY2UsIGRldiwgb3BzKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJZ290byBvdXRfZnJlZTsN
Cj4gPiArCXJldHVybiBkZXZpY2U7DQo+ID4gKw0KPiA+ICtvdXRfZnJlZToNCj4gPiArCWt2ZnJl
ZShkZXZpY2UpOw0KPiA+ICsJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4gPiArfQ0KPiA+ICtFWFBP
UlRfU1lNQk9MX0dQTChfdmZpb19hbGxvY19kZXZpY2UpOw0KPiA+ICsNCj4gPiArLyoNCj4gPiAr
ICogSW5pdGlhbGl6ZSBhIHZmaW9fZGV2aWNlIHNvIGl0IGNhbiBiZSByZWdpc3RlcmVkIHRvIHZm
aW8gY29yZS4NCj4gPiArICoNCj4gPiArICogT25seSB2ZmlvLWNjdyBkcml2ZXIgc2hvdWxkIGNh
bGwgdGhpcyBpbnRlcmZhY2UuDQo+ID4gKyAqLw0KPiA+ICtpbnQgdmZpb19pbml0X2RldmljZShz
dHJ1Y3QgdmZpb19kZXZpY2UgKmRldmljZSwgc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICsJCSAg
ICAgY29uc3Qgc3RydWN0IHZmaW9fZGV2aWNlX29wcyAqb3BzKQ0KPiA+ICt7DQo+ID4gKwlpbnQg
cmV0Ow0KPiA+ICsNCj4gPiArCXZmaW9faW5pdF9ncm91cF9kZXYoZGV2aWNlLCBkZXYsIG9wcyk7
DQo+ID4gKw0KPiA+ICsJaWYgKG9wcy0+aW5pdCkgew0KPiA+ICsJCXJldCA9IG9wcy0+aW5pdChk
ZXZpY2UpOw0KPiA+ICsJCWlmIChyZXQpDQo+ID4gKwkJCWdvdG8gb3V0X3VuaW5pdDsNCj4gPiAr
CX0NCj4gPiArDQo+ID4gKwlrcmVmX2luaXQoJmRldmljZS0+a3JlZik7DQo+ID4gKwlyZXR1cm4g
MDsNCj4gPiArDQo+ID4gK291dF91bmluaXQ6DQo+ID4gKwl2ZmlvX3VuaW5pdF9ncm91cF9kZXYo
ZGV2aWNlKTsNCj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTF9H
UEwodmZpb19pbml0X2RldmljZSk7DQo+ID4gKw0KPiA+ICsvKg0KPiA+ICsgKiBUaGUgaGVscGVy
IGNhbGxlZCBieSBkcml2ZXIgQHJlbGVhc2UgY2FsbGJhY2sgdG8gZnJlZSB0aGUgZGV2aWNlDQo+
ID4gKyAqIHN0cnVjdHVyZS4gRHJpdmVycyB3aGljaCBkb24ndCBoYXZlIHByaXZhdGUgZGF0YSB0
byBjbGVhbiBjYW4NCj4gPiArICogc2ltcGx5IHVzZSB0aGlzIGhlbHBlciBhcyBpdHMgQHJlbGVh
c2UuDQo+ID4gKyAqLw0KPiA+ICt2b2lkIHZmaW9fZnJlZV9kZXZpY2Uoc3RydWN0IHZmaW9fZGV2
aWNlICpkZXZpY2UpDQo+ID4gK3sNCj4gPiArCWt2ZnJlZShkZXZpY2UpOw0KPiA+ICt9DQo+ID4g
K0VYUE9SVF9TWU1CT0xfR1BMKHZmaW9fZnJlZV9kZXZpY2UpOw0KPiA+ICsNCj4gPiAgIHN0YXRp
YyBzdHJ1Y3QgdmZpb19ncm91cCAqdmZpb19ub2lvbW11X2dyb3VwX2FsbG9jKHN0cnVjdCBkZXZp
Y2UgKmRldiwNCj4gPiAgIAkJZW51bSB2ZmlvX2dyb3VwX3R5cGUgdHlwZSkNCj4gPiAgIHsNCj4g
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92ZmlvLmggYi9pbmNsdWRlL2xpbnV4L3ZmaW8u
aA0KPiA+IGluZGV4IDBlMjgyNjU1OTA5MS4uZjY3Y2FjNzAwZTZmIDEwMDY0NA0KPiA+IC0tLSBh
L2luY2x1ZGUvbGludXgvdmZpby5oDQo+ID4gKysrIGIvaW5jbHVkZS9saW51eC92ZmlvLmgNCj4g
PiBAQCAtNDcsNyArNDcsOCBAQCBzdHJ1Y3QgdmZpb19kZXZpY2Ugew0KPiA+ICAgCXN0cnVjdCBr
dm0gKmt2bTsNCj4gPg0KPiA+ICAgCS8qIE1lbWJlcnMgYmVsb3cgaGVyZSBhcmUgcHJpdmF0ZSwg
bm90IGZvciBkcml2ZXIgdXNlICovDQo+ID4gLQlyZWZjb3VudF90IHJlZmNvdW50Ow0KPiA+ICsJ
c3RydWN0IGtyZWYga3JlZjsJLyogb2JqZWN0IGxpZmUgY3ljbGUgKi8NCj4gPiArCXJlZmNvdW50
X3QgcmVmY291bnQ7CS8qIHVzZXIgY291bnQgb24gcmVnaXN0ZXJlZCBkZXZpY2UqLw0KPiA+ICAg
CXVuc2lnbmVkIGludCBvcGVuX2NvdW50Ow0KPiA+ICAgCXN0cnVjdCBjb21wbGV0aW9uIGNvbXA7
DQo+ID4gICAJc3RydWN0IGxpc3RfaGVhZCBncm91cF9uZXh0Ow0KPiA+IEBAIC01Nyw2ICs1OCw4
IEBAIHN0cnVjdCB2ZmlvX2RldmljZSB7DQo+ID4gICAvKioNCj4gPiAgICAqIHN0cnVjdCB2Zmlv
X2RldmljZV9vcHMgLSBWRklPIGJ1cyBkcml2ZXIgZGV2aWNlIGNhbGxiYWNrcw0KPiA+ICAgICoN
Cj4gPiArICogQGluaXQ6IGluaXRpYWxpemUgcHJpdmF0ZSBmaWVsZHMgaW4gZGV2aWNlIHN0cnVj
dHVyZQ0KPiA+ICsgKiBAcmVsZWFzZTogUmVjbGFpbSBwcml2YXRlIGZpZWxkcyBpbiBkZXZpY2Ug
c3RydWN0dXJlDQo+ID4gICAgKiBAb3Blbl9kZXZpY2U6IENhbGxlZCB3aGVuIHRoZSBmaXJzdCBm
aWxlIGRlc2NyaXB0b3IgaXMgb3BlbmVkIGZvciB0aGlzDQo+IGRldmljZQ0KPiA+ICAgICogQGNs
b3NlX2RldmljZTogT3Bwb3NpdGUgb2Ygb3Blbl9kZXZpY2UNCj4gPiAgICAqIEByZWFkOiBQZXJm
b3JtIHJlYWQoMikgb24gZGV2aWNlIGZpbGUgZGVzY3JpcHRvcg0KPiA+IEBAIC03NCw2ICs3Nyw4
IEBAIHN0cnVjdCB2ZmlvX2RldmljZSB7DQo+ID4gICAgKi8NCj4gPiAgIHN0cnVjdCB2ZmlvX2Rl
dmljZV9vcHMgew0KPiA+ICAgCWNoYXIJKm5hbWU7DQo+ID4gKwlpbnQJKCppbml0KShzdHJ1Y3Qg
dmZpb19kZXZpY2UgKnZkZXYpOw0KPiA+ICsJdm9pZAkoKnJlbGVhc2UpKHN0cnVjdCB2ZmlvX2Rl
dmljZSAqdmRldik7DQo+ID4gICAJaW50CSgqb3Blbl9kZXZpY2UpKHN0cnVjdCB2ZmlvX2Rldmlj
ZSAqdmRldik7DQo+ID4gICAJdm9pZAkoKmNsb3NlX2RldmljZSkoc3RydWN0IHZmaW9fZGV2aWNl
ICp2ZGV2KTsNCj4gPiAgIAlzc2l6ZV90CSgqcmVhZCkoc3RydWN0IHZmaW9fZGV2aWNlICp2ZGV2
LCBjaGFyIF9fdXNlciAqYnVmLA0KPiA+IEBAIC0xNjEsNiArMTY2LDI0IEBAIHN0YXRpYyBpbmxp
bmUgaW50IHZmaW9fY2hlY2tfZmVhdHVyZSh1MzIgZmxhZ3MsDQo+IHNpemVfdCBhcmdzeiwgdTMy
IHN1cHBvcnRlZF9vcHMsDQo+ID4gICAJcmV0dXJuIDE7DQo+ID4gICB9DQo+ID4NCj4gPiArc3Ry
dWN0IHZmaW9fZGV2aWNlICpfdmZpb19hbGxvY19kZXZpY2Uoc2l6ZV90IHNpemUsIHN0cnVjdCBk
ZXZpY2UgKmRldiwNCj4gPiArCQkJCSAgICAgICBjb25zdCBzdHJ1Y3QgdmZpb19kZXZpY2Vfb3Bz
ICpvcHMpOw0KPiA+ICsjZGVmaW5lIHZmaW9fYWxsb2NfZGV2aWNlKGRldl9zdHJ1Y3QsIG1lbWJl
ciwgZGV2LCBvcHMpDQo+IAkJXA0KPiA+ICsJY29udGFpbmVyX29mKF92ZmlvX2FsbG9jX2Rldmlj
ZShzaXplb2Yoc3RydWN0IGRldl9zdHJ1Y3QpICsNCj4gCVwNCj4gPiArCQkJCQlCVUlMRF9CVUdf
T05fWkVSTyhvZmZzZXRvZigNCj4gCQlcDQo+ID4gKwkJCQkJCXN0cnVjdCBkZXZfc3RydWN0LCBt
ZW1iZXIpKSwNCj4gCVwNCj4gPiArCQkJCQlkZXYsIG9wcyksDQo+IAlcDQo+ID4gKwkJICAgICBz
dHJ1Y3QgZGV2X3N0cnVjdCwgbWVtYmVyKQ0KPiA+ICsNCj4gPiAraW50IHZmaW9faW5pdF9kZXZp
Y2Uoc3RydWN0IHZmaW9fZGV2aWNlICpkZXZpY2UsIHN0cnVjdCBkZXZpY2UgKmRldiwNCj4gPiAr
CQkgICAgIGNvbnN0IHN0cnVjdCB2ZmlvX2RldmljZV9vcHMgKm9wcyk7DQo+ID4gK3ZvaWQgdmZp
b19mcmVlX2RldmljZShzdHJ1Y3QgdmZpb19kZXZpY2UgKmRldmljZSk7DQo+ID4gK3ZvaWQgdmZp
b19kZXZpY2VfcmVsZWFzZShzdHJ1Y3Qga3JlZiAqa3JlZik7DQo+ID4gK3N0YXRpYyBpbmxpbmUg
dm9pZCB2ZmlvX3B1dF9kZXZpY2Uoc3RydWN0IHZmaW9fZGV2aWNlICpkZXZpY2UpDQo+ID4gK3sN
Cj4gPiArCWtyZWZfcHV0KCZkZXZpY2UtPmtyZWYsIHZmaW9fZGV2aWNlX3JlbGVhc2UpOw0KPiA+
ICt9DQo+ID4gKw0KPiA+ICAgdm9pZCB2ZmlvX2luaXRfZ3JvdXBfZGV2KHN0cnVjdCB2ZmlvX2Rl
dmljZSAqZGV2aWNlLCBzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gICAJCQkgY29uc3Qgc3RydWN0
IHZmaW9fZGV2aWNlX29wcyAqb3BzKTsNCj4gPiAgIHZvaWQgdmZpb191bmluaXRfZ3JvdXBfZGV2
KHN0cnVjdCB2ZmlvX2RldmljZSAqZGV2aWNlKTsNCj4gDQo+IC0tDQo+ICJmaXJtLCBlbmR1cmlu
Zywgc3Ryb25nLCBhbmQgbG9uZy1saXZlZCINCg0K
