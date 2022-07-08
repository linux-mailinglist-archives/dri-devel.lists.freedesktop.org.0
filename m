Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B0756BB37
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 15:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150FC10E6FD;
	Fri,  8 Jul 2022 13:54:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34C9610E6F1;
 Fri,  8 Jul 2022 13:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657288452; x=1688824452;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6Ov7xhxedg7Diaq23sv93c7AEx6nLTxn7chrlQ/YRZs=;
 b=e2+1w5ulgr01ANGtbdShHpw15bYSd1RILo/FK2gI5o0VkfsQ2rlxj3uE
 EzOZDok6aobwMf2UdoK6PQxqeRm6S500NHDF3zNMOG8DBCoA5Rb6o61p0
 88f6Tq9lb1v7VTq74H55D/usa2cJZPm5D12Tevw0Jz7/MjmaFy49jPenO
 /vybZEl3ItTVWSea0bpwP0Gk3ntnDS87BCARRECecR7T5SceSCcWug6B2
 W3YWxRsJN0OPfq11jhjTOG3xcqgNFU5FB7CMKlFXsYidxZZjHjbn0W4Zt
 JL9hwSa6bO8h2c4hijyuxTPZGGf6DrgYpK5ZGibxgxV7D684IeyE1iGAo w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285411848"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="285411848"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 06:54:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="651572114"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP; 08 Jul 2022 06:54:11 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 06:54:10 -0700
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 06:54:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 06:54:10 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 06:54:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jwJOYEQz+fSDpch7ou6UrrXfDIx4IKfSgz5rhfpjYprRy8RKGvd52OYlH+W7+ZlQGlJMAowRdrUDPlQBSIm+VIMjj/+7vSDK06NC+B+HfpvF/mWn9FhXGJAK0+ZVzCqX0UOBBKsPXoB6ZhRbvykomdVkxzsaWy1fVOD76CwGmZzo5m+lH+wrGGZ2Pk2vQVm2Ok6SMVWoy1sjyhF99Qmo65J4VTBAxq0fu/qbPlr4aUDzX6Y7YU/wDhyG74kTTjl5nEFof+VwKscUyYc4jE/1DO1ztgHS0Iiezv4ZRDw6VnG92Sqr44rGNa8iHg7KRFo/tBEUct5sdsTAIihF0jf2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Ov7xhxedg7Diaq23sv93c7AEx6nLTxn7chrlQ/YRZs=;
 b=IfxYvkputyGr3TrlLhZ4ic4nNEmUF7Aww2kJ7nm9cyZkRiqDiRt+kD0qOjHdbkuQThMVyoP5r74Z4uJuTKX8LJaqqwk1D/OIUGuj5a09RjSbkK33VlXAfTfx9hLMYZr4bmODM/f35Wj0QTYnEQ1GQr6WmnpzR58NMwCgXesNahByy89AC167xs9ywUlg+YrCkkJo9YglaFBu6wz51k5i1ooj8nxb81EKV7P7b0ztV05SDPJTeDRFpwDLD5ahkGfDEez0kothk1f9Yp/pTToIxFRlvj/o/Vcpo/ckSkYgbc6Xwyy/dFfRjcoJcoc+yCOBNALxBtx5nrRGu4kxz9PYdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 BN0PR11MB5758.namprd11.prod.outlook.com (2603:10b6:408:166::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.20; Fri, 8 Jul
 2022 13:54:08 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::79c1:20d:d786:eba9]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::79c1:20d:d786:eba9%11]) with mapi id 15.20.5417.021; Fri, 8 Jul 2022
 13:54:08 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH 5/6] drm/ttm: stop allocating dummy resources during BO
 creation
Thread-Topic: [PATCH 5/6] drm/ttm: stop allocating dummy resources during BO
 creation
Thread-Index: AQHYkev2TlzUqfa0l0yWGi7l6zZj4610gHSQ
Date: Fri, 8 Jul 2022 13:54:08 +0000
Message-ID: <DM5PR11MB1324BE20799D4483155CB44BC1829@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <20220707102453.3633-1-christian.koenig@amd.com>
 <20220707102453.3633-6-christian.koenig@amd.com>
In-Reply-To: <20220707102453.3633-6-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.6.500.17
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 975df4f8-569d-4a2f-6ead-08da60e95472
x-ms-traffictypediagnostic: BN0PR11MB5758:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VKxGyFEOcKDBd4A1V4u/B596t+a22sH5ymezYeDOctv8AOiH0VrdM9m/C0hS/DAMxjBWnz4eqBJn38fACOITSId43DpYibFmJC0p+/JexTdwaLHdpbNcxlpTVZeInJSl/JPDvO11hua3iDrPHcbJKNrXW0//MwvjrwmIj8fLsxlR9cmwYQvzbw5D4knS5rpmk6xBRTuj9lkCunYJWBXbL11IZk2p4/5BGPfIovWTIniy54u+CdAGHnAJRccT7GAlbKBgsKI6zQdfMmt9VSlPMRy1jji3zILBD69D1DeShBakUslrY3FSYOGxuRjl71iKE58ROt6Ve2njQcIrPOBd1egvKbvFiZuGP3CjhSG71VauZe4+J0MALDLG9OV+s0OoxDbo8NpZbfNWYg1oFYbB8yGGwEmVNQHyZPrlyNeaAaJZKDsMCtMItlTExF1Wb1AdaiD25xDcoMRFmdW/SZ0TUXMDE3ggTjt2q87ixyafiak7FlT9K+u8+YCK5lBlI9wveMX8A9JJAj7Flvhrph2MqffY3Tz+cUFwHlPj7AyPwwL0f39h+Tg+YhFk9ApVHhCDTzqheK8CwVODgYoHDjTLx4+LQo4PdwbBthdfiltNfTsvOGWYoXEEDdgweaVEkE8pCe1E3HfjsgghVQtGwpy/z8WZbzs+rPRhYl6+15h5Mdqeb6JGHajqkcza+9USNL4UkSjclQC1usa9DTFrMjkWq6H8Xh1cQ3SswLYDMk098i3BGJHxrySfJ5FAQlmAlnlvcr47kt+2NfA9rXiGQwxdLgRvkAif4KF1WOcW0fYcFKnjTSJ14kSnaCtN7ouWYi+i
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(136003)(39860400002)(376002)(396003)(366004)(346002)(4326008)(86362001)(6506007)(7696005)(82960400001)(2906002)(52536014)(55016003)(38100700002)(41300700001)(38070700005)(186003)(316002)(66476007)(76116006)(66556008)(66446008)(83380400001)(66946007)(64756008)(478600001)(26005)(8936002)(33656002)(8676002)(122000001)(5660300002)(110136005)(71200400001)(9686003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Snhha2tEdnhheSs2ck1CZkNtL213U2c2TnM2WlVyREJCUTIxQVVmNTlSWmR6?=
 =?utf-8?B?OUZZWUdYK29lak1BQUlyZURua1g5eVhtTlcrTnJ4VUdQam9mWmFPRHcyNkFT?=
 =?utf-8?B?eW9icWFlMmhIcVEyKzFyeG1mOEZhZjFPbTdhNFVzZUVuRkp3SWdrQXBtSjVm?=
 =?utf-8?B?WGRFRlJXa1lTMTJPaWJ2Tm5Yc01DWmt5SnVTcVdqM0hYLzVFbUgzMEw2amVL?=
 =?utf-8?B?RW1meGw3RlRyZGl5Zk5Db2pYbEZ6cXJhMXZwbmd5ODVwRjdQNWNOWnpNL0NU?=
 =?utf-8?B?QTZBbFd1Nzl4dFI5UElkQmMva1FzNVBEdklFeDhkLzJ0L0RPUjNnSVpsRWpj?=
 =?utf-8?B?ZlBqUDNpTFlQTlArVnlWK0VjRVNuOHY2ck5MQ3dMRDR0Slo3aVpFSGo0SXN4?=
 =?utf-8?B?Nk81alA4Wk1wemJTcGNyUGRQV2VhTmNEQS9zUE1SSXMxU1d6WkNyUU1MaG9z?=
 =?utf-8?B?S2RhQ0t4cFlqMzN0NEFjR3o2dWhZU0QvT3NEeWdyc2t4OFlhZFY3QmhjWERL?=
 =?utf-8?B?ZEl2RXY5VTlDb1MxSVFiblJDSnJIaEkvOE8vSjh0NlNFVTM4TDMraTYvbVlM?=
 =?utf-8?B?enY1b0tUZFR4bWZjbEJCSk80YndmQjY3emRrTFlBL2FTL2srMmlOR056MGJP?=
 =?utf-8?B?WXRoOURYQk5HMlg2Vk1QNVRTbFlpbXVOc3ZsUXJrVzJ3aW4ybGdMTlBCRzVu?=
 =?utf-8?B?QmlTb3c0RnRveTg0RjB0VjQxK3J6REc0NWZqK1JVYmRRSDFjWkNzcEZ3K015?=
 =?utf-8?B?dDNUT2hkaVVHSVhUZHE5M2NJNzdLOWxJZEFNVzFBNWFHQUphdVh3SkI2TmUy?=
 =?utf-8?B?TmRNaHVZVGw2YjBFTm5yRzRDbFR1TFZIS2FheFQ0cXY3NGlMUkNRL2ZRaGoz?=
 =?utf-8?B?TitZaUFsektsakxXdmRHcTUrMWFaOUNTRzV0RS9oaGx6ZEErZmtpSFdKOHY1?=
 =?utf-8?B?WTYwSUhBYytvaS9qWU94cXVVZHZ4RGVTR1lBcmVxUGVoZW1uU3MvZFJOUzVB?=
 =?utf-8?B?bHpGektDM2RyTHptZVdnSTRYY3JiVUtxTFdIYi9jbytjU3FCLy83a2phMkpQ?=
 =?utf-8?B?R0VvSHlNaE1kZGJmQ0srVk5iNWFHa1FjYUxpajdkSU1CTjhXbnZoWHBtSVZ5?=
 =?utf-8?B?YitzaS9PRnU3bTBlVnJFQTdNUVAwVjdVa2lKR2RENDROQjh0bnhVbHJsLzli?=
 =?utf-8?B?QU5hOXhqQytYM0F4VWgxVzBnOXdjSnQvVktja1JobTl5bHVCQVIxaVNPYzZQ?=
 =?utf-8?B?WGM5WkdTQ0dYYURRMHYrbjZTWnB1VnZocGh4MEd4MXk3bEkxSTFDanBzbXRH?=
 =?utf-8?B?b1U5NXdHczFOMnZoZHhSNERRTVVjeThsMFZqcmFJLzR6NmU4SWtVVEZsOWV1?=
 =?utf-8?B?cUtlVUcrU21BcFRLTHNhWndvWER1MUhVTUhySGFmMVlCSW1CSEJpZTVNQ1Fl?=
 =?utf-8?B?Vmg2d3dXY1Yxc3hvTlVaNTdTaG1ITklSWHgrUG85V2pzeGR0Z25ra2Z0UlVM?=
 =?utf-8?B?OXQ4ZmZ2R3p4OTY1SXYwZ0hLQXVySVJ1aDhTRjhaRTRzYklLTnhxSFQ1b1ox?=
 =?utf-8?B?MnFCbHNLTDJMOWhsR0Z4ZnFTY3V0ZzZ4b3BJUUE1eHpBVkRhRjRtSUR1d3kw?=
 =?utf-8?B?aGdzbzIzMDBzbnFiMHM2RWlVSTBlWjRKcC9ZcVpXSkx6dHEzZzVtWlRCTHRY?=
 =?utf-8?B?dWVWRXVheGdVbFhQSUJzd2hJRFR1d2ZOV2YzajBoc2xJdU5hdzliT29ucE1h?=
 =?utf-8?B?aUlmeDB4bm8zKzR4RE40dVpzS3RYWkhCTFN5eWZhQTByMGU2c3hyNmx6TmQz?=
 =?utf-8?B?bHBSYmxEamdRTjFIdmRNbFkvSk5HNlZuTWFyblByVlNpSXBiT3d6c2piMjQw?=
 =?utf-8?B?RDdubGNhUUJPK2xMeUtnSXlRZzZ5bzhPQ0xzUG03ZHEyb2c2T0N6eTNRbkw4?=
 =?utf-8?B?TThDODVzWEdLMlZLQVNnN1hsOXQ2d05xY01La09qditLbXQxMXNoRnJjMU9q?=
 =?utf-8?B?STNnc0FkKy8yeVVMSEhiZXpJbURvM1RQbGsrWlhKVHJJcFdreERkcm5Uam1t?=
 =?utf-8?B?MGt1b21EZ2x2NXo3Sm5ONWR6NmViMVRIOHhBYXdoZExzUkFBQ1ZNZEpmM0dm?=
 =?utf-8?Q?6ERRtB1BC8PDBaR05Pubq7RLR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 975df4f8-569d-4a2f-6ead-08da60e95472
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 13:54:08.6153 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kdzkp9iY9K8l7pAHsFFRKljMnPbXM/uRBj8P1KqZ+dtGC3GRm/tRj8VJmDZD5Kg9mdctmTOhWoyXjl5Dj1deNABeuJbfKHwS3M0r+XhWI7I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5758
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
Cc: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwt
Ym91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZg0KPkNocmlzdGlhbiBL
w7ZuaWcNCj5TZW50OiBUaHVyc2RheSwgSnVseSA3LCAyMDIyIDY6MjUgQU0NCj5UbzogaW50ZWwt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZzsNCj5ub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcNCj5DYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pg0KPlN1YmplY3Q6IFtQQVRDSCA1LzZdIGRybS90dG06IHN0b3AgYWxsb2NhdGluZyBkdW1teSBy
ZXNvdXJjZXMgZHVyaW5nIEJPDQo+Y3JlYXRpb24NCj4NCj5UaGF0IHNob3VsZCBub3QgYmUgbmVj
ZXNzYXJ5IGFueSBtb3JlIHdoZW4gZHJpdmVycyBzaG91bGQgYXQgbGVhc3QgYmUNCj5hYmxlIHRv
IGhhbmRsZSB0aGUgbW92ZSB3aXRob3V0IGEgcmVzb3VyY2UuDQo+DQo+U2lnbmVkLW9mZi1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KDQpSZXZpZXdlZC1i
eTogTWljaGFlbCBKLiBSdWhsIDxtaWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQoNCk0NCg0KPi0t
LQ0KPiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgNyAtLS0tLS0tDQo+IDEgZmlsZSBj
aGFuZ2VkLCA3IGRlbGV0aW9ucygtKQ0KPg0KPmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYw0KPmluZGV4IGEyZjQ5
YmRkYThhMS4uZjQ5MWJlNzUxYTJmIDEwMDY0NA0KPi0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMNCj4rKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jDQo+QEAgLTk2MCw3
ICs5NjAsNiBAQCBpbnQgdHRtX2JvX2luaXRfcmVzZXJ2ZWQoc3RydWN0IHR0bV9kZXZpY2UgKmJk
ZXYsDQo+c3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywNCj4gCQkJIHN0cnVjdCBzZ190YWJs
ZSAqc2csIHN0cnVjdCBkbWFfcmVzdiAqcmVzdiwNCj4gCQkJIHZvaWQgKCpkZXN0cm95KSAoc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICopKQ0KPiB7DQo+LQlzdGF0aWMgY29uc3Qgc3RydWN0IHR0
bV9wbGFjZSBzeXNfbWVtID0geyAubWVtX3R5cGUgPQ0KPlRUTV9QTF9TWVNURU0gfTsNCj4gCWlu
dCByZXQ7DQo+DQo+IAlrcmVmX2luaXQoJmJvLT5rcmVmKTsNCj5AQCAtOTc4LDEyICs5NzcsNiBA
QCBpbnQgdHRtX2JvX2luaXRfcmVzZXJ2ZWQoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYsDQo+c3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywNCj4gCQliby0+YmFzZS5yZXN2ID0gJmJvLT5iYXNl
Ll9yZXN2Ow0KPiAJYXRvbWljX2luYygmdHRtX2dsb2IuYm9fY291bnQpOw0KPg0KPi0JcmV0ID0g
dHRtX3Jlc291cmNlX2FsbG9jKGJvLCAmc3lzX21lbSwgJmJvLT5yZXNvdXJjZSk7DQo+LQlpZiAo
dW5saWtlbHkocmV0KSkgew0KPi0JCXR0bV9ib19wdXQoYm8pOw0KPi0JCXJldHVybiByZXQ7DQo+
LQl9DQo+LQ0KPiAJLyoNCj4gCSAqIEZvciB0dG1fYm9fdHlwZV9kZXZpY2UgYnVmZmVycywgYWxs
b2NhdGUNCj4gCSAqIGFkZHJlc3Mgc3BhY2UgZnJvbSB0aGUgZGV2aWNlLg0KPi0tDQo+Mi4yNS4x
DQoNCg==
