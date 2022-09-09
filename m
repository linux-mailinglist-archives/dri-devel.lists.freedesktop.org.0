Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 539A55B2BDB
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 03:52:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7181110EA0C;
	Fri,  9 Sep 2022 01:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8335810EA0A;
 Fri,  9 Sep 2022 01:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662688357; x=1694224357;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=7dTm9E7PwPx1N3HKWWXPRoJkKmCbkh8vtd9FgLwlRb8=;
 b=jfeYeiAoP+NTEPtg1Q87t0gh4S1mWYlxJXAwPo7hJE1n0oo4tuhNKvev
 fBBJwA8eDJcxEDeTke5Lg7QDVyRqy/J9aEynvbn6PnqZAflly7SSYnY3J
 K4+ZCmZd2YflFojuzFzF8Xdo8QPR6m6cXDeJrF2CVXc7eKgVFsPelqCLZ
 hhqc4RWp4Ix/RiCva2o30XpuFVWiPLvkRKWrFpwWLV2qMcA2AxIfUbjrn
 48Vkm4qGhfHqLotJnKw9DRpWbuV1aa7dDkSvptCJIWel5Xus9nUVBS49J
 1h5qz82WSC7HjMN9W7IPOuYFaTAgedYfnud5VeEK0viSYikC2g/IAHT8n w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="298174777"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="298174777"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 18:52:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="740891676"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP; 08 Sep 2022 18:52:36 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 18:52:35 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 8 Sep 2022 18:52:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Thu, 8 Sep 2022 18:52:35 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.172)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Thu, 8 Sep 2022 18:52:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UcnkmRRu/swMUxc5dYDMXMa6Z9aYlYfDvh27svPr4qDOl86gfj7wumakFNPio13sd5pArpQ8IQD5pK3tRGvQmfbwmp/FcUntMPi0FgIt+jRXvo/SC+QgzR348OaHpWo0qpbGHlk6xoKHuODch4DJxxNDTe7dpitxlFpL4mW0QyeuoJj9sSxnoGda2i7tLHd6fuZg7AQMScXyt1uZzhaq8N6rl+khm8do8jR2SKE3JzdlLZIezyyjRiBREzLihU5IypYgR4Z7ipkRdgfUhc69x2ywyZpgvP8Jy6ZJzSicidL1E/JjfREfzoYygqeBDYct0vmpMs7KbnJPk5yXTPIoIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dTm9E7PwPx1N3HKWWXPRoJkKmCbkh8vtd9FgLwlRb8=;
 b=Xy3Rv7/pMFZm1MONN6y/lcCM/PrdWkbfZY30/qdjPx/hIY9Hd3PrUqdNKs3FtC6eEW615/I8A1dsYGPX2jsYJ2l4J1imNggp24KzqgPUDnA75z3k2IzzUPYzrs7SBpdkvkJm4GBtIZ8s5CdwPNrJXQejtv1+ZX5kirt4CAKeJCI3h7UkvNxP6vwR9SVQcoZ9buYKX2KFrPyLvdi7B7qqdNPWcXkPjrNvYs7DJTQSDd9NtkIBjmM4ZA38EPkp6F2IPo/iG5yAAe2aJVO9B5TB6YuAQmUmk0KLNdMD3EmytFztTC9Zmm7PULeVHFFYj/CjTVLAwnEAqXySch5/TKk41Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5276.namprd11.prod.outlook.com (2603:10b6:408:135::18)
 by PH8PR11MB6950.namprd11.prod.outlook.com (2603:10b6:510:226::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 9 Sep
 2022 01:52:33 +0000
Received: from BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7]) by BN9PR11MB5276.namprd11.prod.outlook.com
 ([fe80::a435:3eff:aa83:73d7%5]) with mapi id 15.20.5612.014; Fri, 9 Sep 2022
 01:52:33 +0000
From: "Tian, Kevin" <kevin.tian@intel.com>
To: Eric Farman <farman@linux.ibm.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, 
 "Wang, Zhi A" <zhi.a.wang@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, Vineeth Vijayan
 <vneethv@linux.ibm.com>, Peter Oberparleiter <oberpar@linux.ibm.com>, "Heiko
 Carstens" <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, "Tony
 Krowiak" <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>, Diana Craciun
 <diana.craciun@oss.nxp.com>, Alex Williamson <alex.williamson@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Longfang Liu <liulongfang@huawei.com>,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, Jason Gunthorpe
 <jgg@ziepe.ca>, Yishai Hadas <yishaih@nvidia.com>, Eric Auger
 <eric.auger@redhat.com>, Kirti Wankhede <kwankhede@nvidia.com>, "Leon
 Romanovsky" <leon@kernel.org>, Abhishek Sahu <abhsahu@nvidia.com>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>
Subject: RE: [PATCH v2 13/15] vfio/ccw: Use the new device life cycle helpers
Thread-Topic: [PATCH v2 13/15] vfio/ccw: Use the new device life cycle helpers
Thread-Index: AQHYvdM5RUa3xQeyw0Gckqb1cQ4Gx63VKjKwgADjeQCAAFQDoA==
Date: Fri, 9 Sep 2022 01:52:33 +0000
Message-ID: <BN9PR11MB527615BA1E3DA129EA11DA178C439@BN9PR11MB5276.namprd11.prod.outlook.com>
References: <20220901143747.32858-1-kevin.tian@intel.com>
 <20220901143747.32858-14-kevin.tian@intel.com>
 <BN9PR11MB527631B53DF92D47B18F42448C409@BN9PR11MB5276.namprd11.prod.outlook.com>
 <847e98a82d8027ea9c6060467157fc697e1df7ce.camel@linux.ibm.com>
In-Reply-To: <847e98a82d8027ea9c6060467157fc697e1df7ce.camel@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5276:EE_|PH8PR11MB6950:EE_
x-ms-office365-filtering-correlation-id: d08d9ac9-f07b-4ad8-bd0c-08da9205f672
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BKv/60IXhXgjj0YGz48k/AdtZfWCuOp0kXkI/ha+5wScdZmSZoV/Yq60GhOJTM2nu0x/gzvja9WMaUXztsjQYT8va/2QzwTsaOcY0IFfa778xJcOuhTgwsmKY+V9mibZ04YjDhsrVK9tolfVVYpmm3O8XG0fZPXL1gaciBp0rgtEhJP6rcNqas2VPpmtdimPXe493etZDMn8BfNFiIF71nq0RpQmcv6wIKpSlVx0uHrATcpILwXpiypinulZg49k3Uxbg/4cg1x7u6XJecurN043jLB2C1zQeZDJXFrhmm3wkc6ioCO4AyYruLKWB7JbaljcSof8nJtaGH9MUpV+ttGK7X6gZyJi4V9L9YUXkOjEdviXmF0XcuDx28AbSu1E6XOSWttIW59H2Q+Ju41fxlHCQav2GxahfpEPcOuz2RAJjVvAOnbX9ITkuNff6N5El9WR36HguLW5ljey27krjyL4krH8dRXb2sFQ2lsrJ3yzMPR0ho3ov1EPFtCRIlqdGz6QShk4iP/3N5Zc9oSWTwGGLwNX5N7tvo1LZ0yeKTqLIbP7HXBbL7ZFchF/0a0tDMG24/IJRNuGfASXLdVfrRnzjkMfXzuAgfD5Z7YK3fHq90MF2xwCAijL8r7U+ZIQDwCP7dA5o5r0FxiHyVrVx3F8PQl5nqkVSiqLtlIRzPacy6SRvpg6gpdhtMTsDN775MadlzaNGQEWcfSLCwjW49jgpiMpOQgNQqiSol4g8jIhdwSwNjhIslg6Y6IJ51b4MrGewqjO5q2Yg+Bvyy2IbKHrH3Beu6Mif9HInLUhQxc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5276.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(136003)(376002)(366004)(346002)(8676002)(66476007)(66446008)(66946007)(64756008)(4326008)(66556008)(38100700002)(186003)(122000001)(8936002)(33656002)(55016003)(76116006)(2906002)(7406005)(52536014)(7416002)(5660300002)(86362001)(6506007)(316002)(110136005)(26005)(7696005)(921005)(38070700005)(41300700001)(478600001)(71200400001)(83380400001)(82960400001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K2ZaNjlqNVZITkhvOEE3Nnprc0paTHdqTjJ2aHZGUkcvU1VFNVNyRzltdzdj?=
 =?utf-8?B?RjQ0dHo3Y29jOEVGeTRLYk9mSlV5WDBhZUMvcHNIanRYTytqU1B2THFDOHZs?=
 =?utf-8?B?QjgrV2l1Rnd4ZzhaTzFiWHh0eXVQK3J1VmR5RDgwV3czajBBcUloeXFHTVRn?=
 =?utf-8?B?WlduRnhoT2dib1hnQzdwT3M0OTdGbmJsaDYwdXpUaklDQjRPVmJvbGNMQXJz?=
 =?utf-8?B?NmgyY2g5SEtKMVBvaVlRN0o3WWZPRmUyV0huSEkwdnc0dFBPQUVZdG5zQ05K?=
 =?utf-8?B?YnMzdEJVVmRDdVdpb2o0Uk1FY2xTTTMyY09WK0ZxRWFPQ2J4VVVSQUlaM1Qr?=
 =?utf-8?B?SDVqeHN2OFZFRjE1ZG5GSVdEc2lVbWNrVUpjVWEzblR1YVlia0dMaU5MOFcw?=
 =?utf-8?B?cUFMOUpnaVRXUFBIWURzSmlSaDZLeFByU2dyZU8ydG9EKy80ZGJvNHhjVzdI?=
 =?utf-8?B?ZGVyVU10bHJUVkV6ZDBGZkhqS0dYQ1pLY28raEk1Y3JqTEN4TGNiMnNzYzFI?=
 =?utf-8?B?Y0xFTVp2OXYyc0QwTktLNElFVnl6dEFEVWhjeHRkR0E2NVB1UEF5ZkZuZkFY?=
 =?utf-8?B?UHc1WlMxanhwMnRsN1JpdnZNY29ZbHU4b3dtNS9YakRrWllnalJQR3AyMFNx?=
 =?utf-8?B?ZTJaUVRLZEZGMFBqMnFld3ZJcEpLNHpDSVQyK2IwdTVuamdJeUF1TWdGSkxT?=
 =?utf-8?B?NElzZ1B0MS84ck5GU0VTUG5TYmRpTm5sbnloTE1BVHYrUkN0d2lPMHZLdlhs?=
 =?utf-8?B?NURxczRVd0diSGhORmExZXNLelR6UytzWUJwT1lYL3QwWnJQK2R4OGJwaUdQ?=
 =?utf-8?B?YTdMUjJqVUI4M3RzL0JJeXVqd05PTnI4cUYyVFFDQSsyaWtLc3l3OGV3a20v?=
 =?utf-8?B?bSswaEVsYXhXa2liTjI1MG9HdFBNTm5Mbm5XRFBUeGh6ZXdZVXdHRGFzNDBo?=
 =?utf-8?B?eitOcWkvRDJWM0dtcnN5VWIzaERvLy9UNjRsbXBOb1M2WDY5UjQvS1BSeGNL?=
 =?utf-8?B?YWdrWGlBYm1yN3R4bUxGYlR0MC9XcWlkS2RNTHkyWHRFZ2lLT3hsWUdwVXMw?=
 =?utf-8?B?RWdVYmw5QS9Dc1FiYVdYRU83dnlYWWY1Y0VYMDdRUVVNdnNRNkdTemlPR0dX?=
 =?utf-8?B?NHJEQjYzdlQ2SGxsNm1UdjNkV2xyaWM3K1gydy9oeTdSdG0yT1psQmRWOUhk?=
 =?utf-8?B?N0ZyYlhwU0l1T0VrN2F4ZFMveXY3TkV4RFNLeVJrbFRpd21GdlV3T3JBdEJU?=
 =?utf-8?B?UFhTYjhVZWMvcmV5YXVHQmt0NmJ2bmJ2a1hkRzlveUVZUjJSM25KZXcyNUdC?=
 =?utf-8?B?VllNb0FiOENKRTVrbzRJVlhDOVFGaTNMaHNxaktMZTNpK2YwWm9FeVorMkcv?=
 =?utf-8?B?N3dWQVRoWlMzSnVnN2NQQ1NKdm1wV09HN1NNL2NyVUs0bEZ6REcyMnU1RWF2?=
 =?utf-8?B?cHo3R251TUw5VUxNMGhZNlJYVDgzUURhNVhoeVRLY2d4a2JDd1U3NjU3RGZC?=
 =?utf-8?B?OXV0ZmE2Ry8yNmdEcUJmT3ZSSmYzL0VSNmlWeDFrTEZKcTgxQ0RUckxpZlB1?=
 =?utf-8?B?RHE5SGFhVndxSVdOSTc5RlpyZDlOV2NOU3o1NFFLajMzcmt3ZnowVVltOTNN?=
 =?utf-8?B?WjFwdWNYaThXRlcwRmY2WVlJaW1ER0hkT0tPdHd6Y2NKdUI1UU1hNFd2Nk5m?=
 =?utf-8?B?ZDhRazdMQ0RYUHpOOW1oKzVqVUxEQ0tpOHV2eEw0TFZ5VlpFcWpKeGtpMUxR?=
 =?utf-8?B?V01PVjF2aTlBdEdNcDFoNmRrTngyT3ZkVlpFVjBYZmR1RWNmU1EvM0VmRzV0?=
 =?utf-8?B?SWVGS0wxai9aWHJjVmtyZ1ZpV3JXOE8yN1p0T3d0dXFLUldOL1ArcXkrNktM?=
 =?utf-8?B?b2lTT0xzOGQyR1M2d3FWMEVEWnVtS2VWbEdNZVNCYVVpbkY4cW9ZZnFlMGZw?=
 =?utf-8?B?eXp0cDM0U3AwVGtQd2dDOEkySElDY1pvSW5FdHNRZVNSUlVFVHhmRzFiNjRH?=
 =?utf-8?B?eDB0bDA5MElUbDRGQk1HVFpkand0aENzWm4zQXhIc1pFTTc0UysyZ091Zy9N?=
 =?utf-8?B?d3I1RU9jZmRrT2tpWGJWM1pkdFQvQTB1TEl0Z2NuM2JabmIwYSs0c0RpNXEx?=
 =?utf-8?Q?qOc1AKtW3+1VGWaOuhnjLruGs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5276.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d08d9ac9-f07b-4ad8-bd0c-08da9205f672
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2022 01:52:33.3396 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6EFqG/6hLYHzeCADfcehXvz7Ry+YIJVesuk3G1b55uvVf6jUfccKTen9mJc/WDLM0Vf2LMcfu9cTJkQLcRArgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6950
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

PiBGcm9tOiBFcmljIEZhcm1hbg0KPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciA5LCAyMDIyIDQ6
NTEgQU0NCj4gDQo+IE9uIFRodSwgMjAyMi0wOS0wOCBhdCAwNzoxOSArMDAwMCwgVGlhbiwgS2V2
aW4gd3JvdGU6DQo+ID4gcGluZyBARXJpYyBGYXJtYW4uDQo+ID4NCj4gPiBjY3cgaXMgdGhlIG9u
bHkgdHJpY2t5IHBsYXllciBpbiB0aGlzIHNlcmllcy4gUGxlYXNlIGhlbHAgdGFrZSBhIGxvb2sN
Cj4gPiBpbiBjYXNlIG9mDQo+ID4gYW55IG92ZXJzaWdodCBoZXJlLg0KPiANCj4gQXBvbG9naWVz
LCBJIGhhZCBzdGFydGVkIGxvb2tpbmcgYXQgdjEgYmVmb3JlIEkgbGVmdCBvbiBob2xpZGF5LCBh
bmQNCj4gb25seSByZXR1cm5lZCB0b2RheS4NCj4gDQo+ID4NCj4gPiA+IEZyb206IFRpYW4sIEtl
dmluIDxrZXZpbi50aWFuQGludGVsLmNvbT4NCj4gPiA+IFNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1i
ZXIgMSwgMjAyMiAxMDozOCBQTQ0KPiA+ID4NCj4gPiA+IGNjdyBpcyB0aGUgb25seSBleGNlcHRp
b24gd2hpY2ggY2Fubm90IHVzZSB2ZmlvX2FsbG9jX2RldmljZSgpDQo+ID4gPiBiZWNhdXNlDQo+
ID4gPiBpdHMgcHJpdmF0ZSBkZXZpY2Ugc3RydWN0dXJlIGlzIGRlc2lnbmVkIHRvIHNlcnZlIGJv
dGggbWRldiBhbmQNCj4gPiA+IHBhcmVudC4NCj4gPiA+IExpZmUgY3ljbGUgb2YgdGhlIHBhcmVu
dCBpcyBtYW5hZ2VkIGJ5IGNzc19kcml2ZXIgc28NCj4gPiA+IHZmaW9fY2N3X3ByaXZhdGUNCj4g
PiA+IG11c3QgYmUgYWxsb2NhdGVkL2ZyZWVkIGluIGNzc19kcml2ZXIgcHJvYmUvcmVtb3ZlIHBh
dGggaW5zdGVhZCBvZg0KPiA+ID4gY29uZm9ybWluZyB0byB2ZmlvIGNvcmUgbGlmZSBjeWNsZSBm
b3IgbWRldi4NCj4gPiA+DQo+ID4gPiBHaXZlbiB0aGF0IHVzZSBhIHdhaXQvY29tcGxldGlvbiBz
Y2hlbWUgc28gdGhlIG1kZXYgcmVtb3ZlIHBhdGgNCj4gPiA+IHdhaXRzDQo+ID4gPiBhZnRlciB2
ZmlvX3B1dF9kZXZpY2UoKSB1bnRpbCByZWNlaXZpbmcgYSBjb21wbGV0aW9uIG5vdGlmaWNhdGlv
bg0KPiA+ID4gZnJvbQ0KPiA+ID4gQHJlbGVhc2UuIFRoZSBjb21wbGV0aW9uIGluZGljYXRlcyB0
aGF0IGFsbCBhY3RpdmUgcmVmZXJlbmNlcyBvbg0KPiA+ID4gdmZpb19kZXZpY2UgaGF2ZSBiZWVu
IHJlbGVhc2VkLg0KPiA+ID4NCj4gPiA+IEFmdGVyIHRoYXQgcG9pbnQgYWx0aG91Z2ggZnJlZSBv
ZiB2ZmlvX2Njd19wcml2YXRlIGlzIGRlbGF5ZWQgdG8NCj4gPiA+IGNzc19kcml2ZXIgaXQncyBh
dCBsZWFzdCBndWFyYW50ZWVkIHRvIGhhdmUgbm8gcGFyYWxsZWwgcmVmZXJlbmNlDQo+ID4gPiBv
bg0KPiA+ID4gcmVsZWFzZWQgdmZpbyBkZXZpY2UgcGFydCBmcm9tIG90aGVyIGNvZGUgcGF0aHMu
DQo+ID4gPg0KPiA+ID4gbWVtc2V0KCkgaW4gQHByb2JlIGlzIHJlbW92ZWQuIHZmaW9fZGV2aWNl
IGlzIGVpdGhlciBhbHJlYWR5DQo+ID4gPiBjbGVhcmVkDQo+ID4gPiB3aGVuIHByb2JlZCBmb3Ig
dGhlIGZpcnN0IHRpbWUgb3IgY2xlYXJlZCBpbiBAcmVsZWFzZSBmcm9tIGxhc3QNCj4gPiA+IHBy
b2JlLg0KPiA+ID4NCj4gPiA+IFRoZSByaWdodCBmaXggaXMgdG8gaW50cm9kdWNlIHNlcGFyYXRl
IHN0cnVjdHVyZXMgZm9yIG1kZXYgYW5kDQo+ID4gPiBwYXJlbnQsDQo+ID4gPiBidXQgdGhpcyB3
b24ndCBoYXBwZW4gaW4gc2hvcnQgdGVybSBwZXIgcHJpb3IgZGlzY3Vzc2lvbnMuDQo+IA0KPiBJ
IGRpZCBzdGFydCBsb29raW5nIGF0IHRoZSBhYm92ZSwgd2hpbGUgdGhlIG1kZXYgc2VyaWVzIGlz
IG91dHN0YW5kaW5nLg0KPiBXaWxsIHRyeSB0byBnZXQgYmFjayB0byB0aGF0IHNvb25lciByYXRo
ZXIgdGhhbiBsYXRlciwgYnV0IGZvciB0aGUNCj4gcHVycG9zZXMgb2YgdGhpcyBzZXJpZXMgdGhp
cyBwYXRjaCBsb29rcy93b3JrcyBmaW5lIHRvIG1lLg0KPiANCj4gUmV2aWV3ZWQtYnk6IEVyaWMg
RmFybWFuIDxmYXJtYW5AbGludXguaWJtLmNvbT4NCj4gDQoNClRoYW5rcyENCg==
