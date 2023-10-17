Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561B27CBC76
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 09:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1AA10E27E;
	Tue, 17 Oct 2023 07:39:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8DC10E27E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 07:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697528388; x=1729064388;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u5sUFGD0jsnXqzGJoy04Oi0twMOP5KAuoR9fF+Ozcsk=;
 b=ez3BKwVEWuTUyiUw6U4e993Q33uEsaeorqlEXZcA2NGvkHgyWNFeQr8Z
 h+LvorK4m/TTMndqJVUxp1MnGXsISLnsEXLkwGtqbbWDynjzX9uUvPqoU
 d13Ftb885ILTv3mRDkq77tU2vCPNH36iycTSycA6k9hCLugNtmyZZM1il
 EHzEGvCbY17NodFp2lAENGo9ZVJDEWf2Mi/HDxpX20xE0Myyslj73tPt4
 mhlq6OG2oYnpfd52X2Mz2wazCrW+B1ByttyLkP+tSCxwKucWIg+8TlZhC
 YboEnuFe2siFoibqFPBoFfK+ecvsrhCeURnWCTDOmB2byTKYrzikQeWmi Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="365981659"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="365981659"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 00:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="821866054"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; d="scan'208";a="821866054"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Oct 2023 00:39:45 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 00:39:45 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 17 Oct 2023 00:39:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 17 Oct 2023 00:39:44 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 17 Oct 2023 00:39:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFi25y3MyJ4uRQIQ4VSzAMb75ufRXFAXW0ywj6Vagxy+d7PV/QZviMi1i4rmWFqMszbRahyt+GxHICv2Mgq4RPBUpH5VXduqM1yqxMVuGvlpzMx5p8FvMh+KW7AqUSGlU77b3l4l4vJ2uD0gEo/AbyMQlOLGG9v7qOlRX7XgLPr/LTZRadXneVbJsqkqD9EhocV3TahG+lUEQKEePho3kC8fHuNKS7+lFRHyMCWRLqvA58aN91j9sxa+lpdj71S6Gyw2IoZRw+9FJ2LNmGghVRlv85YqAch7aZ9nXoTL2hIOWbinVU6J1iWWATEx3ecw15zyO55woDb6RiHW+eQJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u5sUFGD0jsnXqzGJoy04Oi0twMOP5KAuoR9fF+Ozcsk=;
 b=m2QOWC8j6qiVe5CYI3XqgDKuWrVSz0wmSVPucY0t566Cv2ucFE8/DAmEYPexRYF2ffnBPVXBwMHQkQ0A3ZF58LedRaw8Kn6UYxW5Qn9YytNBYGoMfW/gDSmPgkjtR7CH5isC2U5qIAF3DGm53BatL2ybQw7TGtTYMnqdCQbFRH2XI766w2mmYHP7NIXVU3svTDdbahJnsAeDkE+yTJ5Y2MPlho6UqlGnzkAyXXwrFbQwH0AT1yZNJx2wj9uhUxu0Vswagt+fxUZWGie/1Q6VoZUJonPS1AOtWoXxcoktqjWkVEI9JoF3u2XVRBhn3UTaa/RnEw/NE63xIjxoBpB4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by PH0PR11MB4952.namprd11.prod.outlook.com (2603:10b6:510:40::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Tue, 17 Oct
 2023 07:39:42 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::fe3f:b90e:4eaa:fac8]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::fe3f:b90e:4eaa:fac8%7]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 07:39:42 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: David Hildenbrand <david@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, 
 Mike Kravetz <mike.kravetz@oracle.com>
Subject: RE: [PATCH v1 1/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages
Thread-Topic: [PATCH v1 1/3] mm/gup: Introduce pin_user_pages_fd() for pinning
 shmem/hugetlbfs file pages
Thread-Index: AQHZ9dBncuzVfdq0Q0ym8E792hbNn7A8a5KAgBEX8qA=
Date: Tue, 17 Oct 2023 07:39:41 +0000
Message-ID: <IA0PR11MB71854366B1F8773DBC54CC0AF8D6A@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20231003074447.3245729-1-vivek.kasireddy@intel.com>
 <20231003074447.3245729-2-vivek.kasireddy@intel.com>
 <4c272313-d2cd-fa29-3126-496636e14115@redhat.com>
In-Reply-To: <4c272313-d2cd-fa29-3126-496636e14115@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|PH0PR11MB4952:EE_
x-ms-office365-filtering-correlation-id: 6fc4b8de-ed3b-450f-3493-08dbcee43995
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dbHgdH2fvaAiZdTzx+g72QfZQnaXyfNYnzJX6sgqoX4ZZP40/WDr1511ifYjIcjlWb5FWdcFncdElX/fUMiAXG7B97a7Dj0myAkzQbB9V6qEsWDNrVsCTbGxo4vRxdXqjPgm0v9WnUCgy7QYDg+DUf2OnBLXbQ6R/Z6CPvCKl4FqpS+5p9pAVW2ddR1ikhcN8Vq24BFFv4fJda0M76TEyueEBrbzQvxohKBxJD1ryUG7C+NmfgZOyhKkoneWiBKXIWTBzoj7J6yDdyuBUaHAfFoqkY+fJFsGSoVoHhD5PGewrzyJ2RtwoN5l+bEm4hW3sOOAY9wmKcvmrczbLO2jA5TUr5QqQXX/NlazAfNf3ShBzIUc9soNAxkv5g0nqVkVL18G6pH7/daqYy8u1+L+sOcwIQI9Oi8R4JK4fzwP7lVtDKzV2zO43jfLcOt4pDfwJepaGuz4AXCtKcGwfmL6D9HYKxUil9EYjZz41OMIhS+D/z4h8Fi6ME8eBlKLek8qO4H6nOlruFLVUFiG3oAWqz6viiT0y0YSRJ/aZv8+0ECMbJTJN6vrg6xOAH7VpdssCbiSm9vdy4m7ePD3up/Kchyygxy8eXnqHPYeUfRB/Xc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(376002)(39860400002)(346002)(396003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(55016003)(66446008)(478600001)(76116006)(66946007)(110136005)(54906003)(66476007)(64756008)(71200400001)(66556008)(6506007)(83380400001)(38100700002)(82960400001)(86362001)(316002)(9686003)(33656002)(26005)(7696005)(122000001)(38070700005)(41300700001)(8676002)(4326008)(52536014)(5660300002)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cXNGRDBRQ0VDeWVEaXdWMldjeGwwaU9oSGkwNTNqNVpuL0RsN3lwNFNkUWI2?=
 =?utf-8?B?OVVYRlJ2QUJRVGJCeWJrN2FTWkVUZjd2WEFwQlFQR3ZYb1VENHVldDNtdnh5?=
 =?utf-8?B?WUdvY2hzT2tmMURXYzBDZUhCNDNuSUVlOC95Y3hDNWJacFFlRWE4dGo0TlI5?=
 =?utf-8?B?OWRkWHVTMURSWXE5ZnhCVGVWdW5NRVB3eTQzZ1oxYnpIdy91dHhXKzVmdU9O?=
 =?utf-8?B?VXBaM01Sem5sak9saVpMM1F3Y1FaTmtMakxab1dlVjJtSlZ0cjVrUVhyYUZ5?=
 =?utf-8?B?MlJvenRabE4ybUJmUUUzVThhRG5OM0hQYWlYaWpjaDBTVXJxSE0yUzZNcUV0?=
 =?utf-8?B?Tld5NnA2NjRiTUhaWDkraDZaZjhqMW1ia0crYlVWU0ZCdGZRRnR1TUNaSGxY?=
 =?utf-8?B?ZWx2U1RTNHJDZklSZVNaZnd0N3FxOFZEUzNKZVV4ZlBOeEtQVmFsREZ0ZExn?=
 =?utf-8?B?SGJHRUVIRjlWWkJKYllhaW5zSkJDVFNXVHdmMVNBZ2tNaDJZSHdjbHlNSVlx?=
 =?utf-8?B?K3lSRnRTQ3lub1cvaTczMjhTTG5wME43OTArWFp5TXdBNXdoV2RvM0o4WGhl?=
 =?utf-8?B?dEF6Q3IvQWxLd05NS3VyTDVZaVNaMk5oSm9lajdFcGsyZ0dpOGVvYWU0aCtE?=
 =?utf-8?B?TVdzOFB0ejhoRytTT3JWWDNuZnhQUnRnOGduZ0RONmpTY3BsTjVScnpwR2lD?=
 =?utf-8?B?SGtvVkxnNzBacTVCQldySFdsQVpOejBGYTd0VG9vUE41WmFkRCt0YXV5ZjNG?=
 =?utf-8?B?cDUyRzRhNjYrZ1FCVG9YZ2h4UGN0R0xOdyttQnhBY0YwWWFMN3M2bnZlSWhp?=
 =?utf-8?B?VStMOCsvQ0dDcWd6TzNCTGptcEZxODJhZEVhR3V6QW9uNVlHbFR5VThNWkwx?=
 =?utf-8?B?ZGJUQm5CcFVRM2Q1emI2bXRxZzZ1S1ZIMlJBd3p4MGR6NHVGMFZIVEFPT005?=
 =?utf-8?B?c0gra1praW96MHltci9xdFNyQlVJOGtDalBla3N0cUo5ZjhpNW5kMlpEV0NQ?=
 =?utf-8?B?bnhlb0lSblRyOWE1QVM5Vi9ZS1M3bCs0U3I0S1RjNy9NMVYwMmxNLy9yQkxi?=
 =?utf-8?B?eDV6b1JIbTJiUlFRY3JPQytzRktOWVNGdnQxVGNOYktScUpxMXNUSURTSUVZ?=
 =?utf-8?B?V3BRSjkrSys2ZXFLS1lQNTJPdkp5Y0RuTUg3bHB5eWh6WmNKQkU4UklLZVNG?=
 =?utf-8?B?ZEZkVGlmVWdSalR2ZHEzeHpOL0drZ0NJSWxkdm12bmJ4cW1KL3c3RGYwVzJJ?=
 =?utf-8?B?TFdJV3BMODJuSnhLVHNZTHU5dnJCTTB1Y2F3UkM3dDlTRjRQc2g5M0J6MnN2?=
 =?utf-8?B?Y3R2VkJ4VDBKRmNYck9pNk9wckN5RzVNaGZhcndxaEVHM0xWNUUxbjVBN0hO?=
 =?utf-8?B?bGVZYlJKRXJzRDVpbkF5YjhvSmRWeHhKY08rbnZVVmFGTTVSOFVvSUJ3dnA5?=
 =?utf-8?B?N0YvVUxTL1B3T0RYcjVZOXpuZWJEWHpZSmtLUytRZ3ZneSsxT1hNYXJQcjNY?=
 =?utf-8?B?b0k4MWM0MDJNU1J3Sjg4L1RwK2g2SU4xaDFDS3haenNJNE5RZkpnRjFMa1JM?=
 =?utf-8?B?NkhYelk5L0kyQVdLYytBOE9ZRWZLWEppR3NmUmU0NUJVTmhDeG9FaThSdVl4?=
 =?utf-8?B?OXhXbEY5R3Yrcy9OV0NzcEFsVDVDRkJaM3NRMy95Q3FSd2VGcnh1Z01uclJS?=
 =?utf-8?B?bXpmYlFvMktYQk5xS3B5S1hPWW5pSnNybWVrYjlNYnQ4Nm4xcXU0VndlYmw5?=
 =?utf-8?B?NWpVUklMN3lmL25NemFOSUZ1MGRnK2c4aXRPZ0d6RVZJWjdkNlh3RjV1dko2?=
 =?utf-8?B?U2VXWUlSSWEyNU5qbWZVRUdQVFJKTmNDQldraVN5ekdlNThFV1hnekd0c0ZV?=
 =?utf-8?B?UzRHc3RBNFVzZkVaMWdoRERMNVZOdFhleUxNeC9xZ3hoRGdEMXRjalpKaWFj?=
 =?utf-8?B?NjF5bkFxSXZxZkp3bHovSHUxckVpYUlLYU02Z2pXWmozVDNRdFBHUXNsU2RF?=
 =?utf-8?B?all3ellWU09YZWF0alUyUGxDcW1rL1ZVb25CQXg5ZUZXR09sRWNwMVJzSm8x?=
 =?utf-8?B?bEVDUDFRRTJLNmtLdW93ZFh6N3RSODJqNThjQTlSQWJqN3F5VWdsblVkUEF1?=
 =?utf-8?Q?jgRrXahVj6wsMB3UPTqcCCg/b?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fc4b8de-ed3b-450f-3493-08dbcee43995
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Oct 2023 07:39:41.6862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wuvcGJbYOB7hpBXVR/d3q/laafFJc3ztbFljGRDg925RrDHRaudo0XwG/O3fml9d5zlF3K57jdivhY+W1bMsvfXq8AgJmrY3y5r7DECFU0c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4952
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
Cc: "Kim,
 Dongwon" <dongwon.kim@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Hugh Dickins <hughd@google.com>, Peter Xu <peterx@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGF2aWQsDQoNCj4gPiBGb3IgZHJpdmVycyB0aGF0IHdvdWxkIGxpa2UgdG8gbG9uZ3Rlcm0t
cGluIHRoZSBwYWdlcyBhc3NvY2lhdGVkDQo+ID4gd2l0aCBhIGZpbGUsIHRoZSBwaW5fdXNlcl9w
YWdlc19mZCgpIEFQSSBwcm92aWRlcyBhbiBvcHRpb24gdG8NCj4gPiBub3Qgb25seSBGT0xMX1BJ
TiB0aGUgcGFnZXMgYnV0IGFsc28gdG8gY2hlY2sgYW5kIG1pZ3JhdGUgdGhlbQ0KPiA+IGlmIHRo
ZXkgcmVzaWRlIGluIG1vdmFibGUgem9uZSBvciBDTUEgYmxvY2suIEZvciBub3csIHRoaXMgQVBJ
DQo+ID4gY2FuIG9ubHkgd29yayB3aXRoIGZpbGVzIGJlbG9uZ2luZyB0byBzaG1lbSBvciBodWdl
dGxiZnMgZ2l2ZW4NCj4gPiB0aGF0IHRoZSB1ZG1hYnVmIGRyaXZlciBpcyB0aGUgb25seSB1c2Vy
Lg0KPiANCj4gTWF5YmUgYWRkICJPdGhlciBmaWxlcyBhcmUgcmVqZWN0ZWQuIi4gV2Fzbid0IGNs
ZWFyIHRvIG1lIGJlZm9yZSBJDQo+IGxvb2tlZCBpbnRvIHRoZSBjb2RlLg0KT2ssIHdpbGwgYWRk
IGl0IGluIHYyLg0KDQo+IA0KPiA+DQo+ID4gSXQgbXVzdCBiZSBub3RlZCB0aGF0IHRoZSBwYWdl
cyBhc3NvY2lhdGVkIHdpdGggaHVnZXRsYmZzIGZpbGVzDQo+ID4gYXJlIGV4cGVjdGVkIHRvIGJl
IGZvdW5kIGluIHRoZSBwYWdlIGNhY2hlLiBBbiBlcnJvciBpcyByZXR1cm5lZA0KPiA+IGlmIHRo
ZXkgYXJlIG5vdCBmb3VuZC4gSG93ZXZlciwgc2htZW0gcGFnZXMgY2FuIGJlIHN3YXBwZWQgaW4g
b3INCj4gPiBhbGxvY2F0ZWQgaWYgdGhleSBhcmUgbm90IHByZXNlbnQgaW4gdGhlIHBhZ2UgY2Fj
aGUuDQo+ID4NCj4gPiBDYzogRGF2aWQgSGlsZGVuYnJhbmQgPGRhdmlkQHJlZGhhdC5jb20+DQo+
ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+ID4gQ2M6IE1p
a2UgS3JhdmV0eiA8bWlrZS5rcmF2ZXR6QG9yYWNsZS5jb20+DQo+ID4gQ2M6IEh1Z2ggRGlja2lu
cyA8aHVnaGRAZ29vZ2xlLmNvbT4NCj4gPiBDYzogUGV0ZXIgWHUgPHBldGVyeEByZWRoYXQuY29t
Pg0KPiA+IENjOiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4NCj4gPiBDYzogRG9u
Z3dvbiBLaW0gPGRvbmd3b24ua2ltQGludGVsLmNvbT4NCj4gPiBDYzogSnVueGlhbyBDaGFuZyA8
anVueGlhby5jaGFuZ0BpbnRlbC5jb20+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBKYXNvbiBHdW50aG9y
cGUgPGpnZ0BudmlkaWEuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFZpdmVrIEthc2lyZWRkeSA8
dml2ZWsua2FzaXJlZGR5QGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGluY2x1ZGUvbGludXgv
bW0uaCB8ICAyICsrDQo+ID4gICBtbS9ndXAuYyAgICAgICAgICAgfCA4Nw0KPiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrDQo+ID4gICAyIGZpbGVzIGNoYW5n
ZWQsIDg5IGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgNCj4gPiBpbmRleCBiZjVkMGIxYjE2ZjQuLmFmMjEy
MWZiODEwMSAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgNCj4gPiArKysgYi9p
bmNsdWRlL2xpbnV4L21tLmgNCj4gPiBAQCAtMjQ1Nyw2ICsyNDU3LDggQEAgbG9uZyBnZXRfdXNl
cl9wYWdlc191bmxvY2tlZCh1bnNpZ25lZCBsb25nDQo+IHN0YXJ0LCB1bnNpZ25lZCBsb25nIG5y
X3BhZ2VzLA0KPiA+ICAgCQkgICAgc3RydWN0IHBhZ2UgKipwYWdlcywgdW5zaWduZWQgaW50IGd1
cF9mbGFncyk7DQo+ID4gICBsb25nIHBpbl91c2VyX3BhZ2VzX3VubG9ja2VkKHVuc2lnbmVkIGxv
bmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcNCj4gbnJfcGFnZXMsDQo+ID4gICAJCSAgICBzdHJ1Y3Qg
cGFnZSAqKnBhZ2VzLCB1bnNpZ25lZCBpbnQgZ3VwX2ZsYWdzKTsNCj4gPiArbG9uZyBwaW5fdXNl
cl9wYWdlc19mZChpbnQgZmQsIHBnb2ZmX3Qgc3RhcnQsIHVuc2lnbmVkIGxvbmcgbnJfcGFnZXMs
DQo+ID4gKwkJICAgICAgIHVuc2lnbmVkIGludCBndXBfZmxhZ3MsIHN0cnVjdCBwYWdlICoqcGFn
ZXMpOw0KPiA+DQo+ID4gICBpbnQgZ2V0X3VzZXJfcGFnZXNfZmFzdCh1bnNpZ25lZCBsb25nIHN0
YXJ0LCBpbnQgbnJfcGFnZXMsDQo+ID4gICAJCQl1bnNpZ25lZCBpbnQgZ3VwX2ZsYWdzLCBzdHJ1
Y3QgcGFnZSAqKnBhZ2VzKTsNCj4gPiBkaWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYw0K
PiA+IGluZGV4IDJmOGEyZDg5ZmRlMS4uZTM0Yjc3YTE1ZmE4IDEwMDY0NA0KPiA+IC0tLSBhL21t
L2d1cC5jDQo+ID4gKysrIGIvbW0vZ3VwLmMNCj4gPiBAQCAtMzQwMCwzICszNDAwLDkwIEBAIGxv
bmcgcGluX3VzZXJfcGFnZXNfdW5sb2NrZWQodW5zaWduZWQgbG9uZw0KPiBzdGFydCwgdW5zaWdu
ZWQgbG9uZyBucl9wYWdlcywNCj4gPiAgIAkJCQkgICAgICZsb2NrZWQsIGd1cF9mbGFncyk7DQo+
ID4gICB9DQo+ID4gICBFWFBPUlRfU1lNQk9MKHBpbl91c2VyX3BhZ2VzX3VubG9ja2VkKTsNCj4g
PiArDQo+IA0KPiBUaGlzIGRvZXMgbG9vayBxdWl0ZSBuZWF0LCBuaWNlISBMZXQncyB0YWtlIGEg
Y2xvc2VyIGxvb2sgLi4uDQo+IA0KPiA+ICsvKioNCj4gPiArICogcGluX3VzZXJfcGFnZXNfZmQo
KSAtIHBpbiB1c2VyIHBhZ2VzIGFzc29jaWF0ZWQgd2l0aCBhIGZpbGUNCj4gPiArICogQGZkOiAg
ICAgICAgIHRoZSBmZCB3aG9zZSBwYWdlcyBhcmUgdG8gYmUgcGlubmVkDQo+ID4gKyAqIEBzdGFy
dDogICAgICBzdGFydGluZyBmaWxlIG9mZnNldA0KPiA+ICsgKiBAbnJfcGFnZXM6ICAgbnVtYmVy
IG9mIHBhZ2VzIGZyb20gc3RhcnQgdG8gcGluDQo+ID4gKyAqIEBndXBfZmxhZ3M6ICBmbGFncyBt
b2RpZnlpbmcgcGluIGJlaGF2aW91cg0KPiANCj4gXiBJIGFzc3VtZSB3ZSBzaG91bGQgZHJvcCB0
aGF0LiBBdCBsZWFzdCBmb3Igbm93IHRoZSBmbGFncyBhcmUNCj4gY29tcGxldGVseSB1bnVzZWQu
IEFuZCBtb3N0IGxpa2VseSB3ZSB3b3VsZCB3YW50IGEgZGlmZmVyZW50IHNldCBvZg0KPiBmbGFn
cyBsYXRlciAoR1VQRkRfIC4uLikuDQpSaWdodCBub3csIEZPTExfTE9OR1RFUk0gaXMgdGhlIG9u
bHkgYWNjZXB0ZWQgdmFsdWUgZm9yIGd1cF9mbGFncyBidXQNCnllcywgYXMgeW91IHN1Z2dlc3Qs
IHRoaXMgY2FuIGJlIG1hZGUgaW1wbGljaXQgYnkgZHJvcHBpbmcgZ3VwX2ZsYWdzLg0KDQo+IA0K
PiA+ICsgKiBAcGFnZXM6ICAgICAgYXJyYXkgdGhhdCByZWNlaXZlcyBwb2ludGVycyB0byB0aGUg
cGFnZXMgcGlubmVkLg0KPiA+ICsgKiAgICAgICAgICAgICAgU2hvdWxkIGJlIGF0IGxlYXN0IG5y
X3BhZ2VzIGxvbmcuDQo+ID4gKyAqDQo+ID4gKyAqIEF0dGVtcHQgdG8gcGluIChhbmQgbWlncmF0
ZSkgcGFnZXMgYXNzb2NpYXRlZCB3aXRoIGEgZmlsZSBiZWxvbmdpbmcgdG8NCj4gDQo+IEknZCBk
cm9wIHRoZSAiYW5kIG1pZ3JhdGUiIHBhcnQsIGl0J3MgbW9yZSBvZiBhbiBpbXBsZW1lbnRhdGlv
biBkZXRhaWwuDQo+IA0KPiA+ICsgKiBlaXRoZXIgc2htZW0gb3IgaHVnZXRsYmZzLiBBbiBlcnJv
ciBpcyByZXR1cm5lZCBpZiBwYWdlcyBhc3NvY2lhdGVkIHdpdGgNCj4gPiArICogaHVnZXRsYmZz
IGZpbGVzIGFyZSBub3QgcHJlc2VudCBpbiB0aGUgcGFnZSBjYWNoZS4gSG93ZXZlciwgc2htZW0N
Cj4gcGFnZXMNCj4gPiArICogYXJlIHN3YXBwZWQgaW4gb3IgYWxsb2NhdGVkIGlmIHRoZXkgYXJl
IG5vdCBwcmVzZW50IGluIHRoZSBwYWdlIGNhY2hlLg0KPiANCj4gV2h5IGRvbid0IHdlIGRvIHRo
ZSBzYW1lIGZvciBodWdldGxiZnM/IFdvdWxkIG1ha2UgdGhlIGludGVyZmFjZSBtb3JlDQo+IHN0
cmVhbWxpbmVkLg0KSSBhbSBnb2luZyBvZmYgb2Ygd2hhdCBNaWtlIGhhcyBzdGF0ZWQgcHJldmlv
dXNseToNCiJJdCBtYXkgbm90IG1hdHRlciB0byB5b3VyIHVzZXJzLCBidXQgdGhlIHNlbWFudGlj
cyBmb3IgaHVnZXRsYiBhbmQgc2htZW0NCnBhZ2VzIGlzIGRpZmZlcmVudC4gIGh1Z2V0bGIgcmVx
dWlyZXMgdGhlIHBhZ2VzIGV4aXN0IGluIHRoZSBwYWdlIGNhY2hlDQp3aGlsZSBzaG1lbSB3aWxs
IGNyZWF0ZS9hZGQgcGFnZXMgdG8gdGhlIGNhY2hlIGlmIG5lY2Vzc2FyeS4iDQoNCkhvd2V2ZXIs
IGlmIHdlIHdlcmUgdG8gYWxsb2NhdGUgYSBodWdlcGFnZSAoYXNzdW1pbmcgb25lIGlzIG5vdCBw
cmVzZW50IGluIHRoZQ0KcGFnZSBjYWNoZSBhdCBhIGdpdmVuIGluZGV4KSwgd2hhdCBuZWVkcyB0
byBiZSBkb25lIGluIGFkZGl0aW9uIHRvIGNhbGxpbmcgdGhlc2UgQVBJcz8NCmZvbGlvID0gYWxs
b2NfaHVnZXRsYl9mb2xpb19ub2RlbWFzayhoLCBOVU1BX05PX05PREUsIE5VTEwsIEdGUF9VU0VS
KQ0KaHVnZXRsYl9hZGRfdG9fcGFnZV9jYWNoZShmb2xpbywgbWFwcGluZywgaWR4KQ0KDQo+IA0K
PiBDZXJ0YWlubHkgYWRkIHRoYXQgcGlubmVkIHBhZ2VzIGhhdmUgdG8gYmUgcmVsZWFzZWQgdXNp
bmcNCj4gdW5waW5fdXNlcl9wYWdlcygpLg0KU3VyZSwgd2lsbCBpbmNsdWRlIHRoYXQgaW4gdjIu
DQoNCj4gDQo+ID4gKyAqDQo+ID4gKyAqIFJldHVybnMgbnVtYmVyIG9mIHBhZ2VzIHBpbm5lZC4g
VGhpcyB3b3VsZCBiZSBlcXVhbCB0byB0aGUgbnVtYmVyIG9mDQo+ID4gKyAqIHBhZ2VzIHJlcXVl
c3RlZC4NCj4gPiArICogSWYgbnJfcGFnZXMgaXMgMCBvciBuZWdhdGl2ZSwgcmV0dXJucyAwLiBJ
ZiBubyBwYWdlcyB3ZXJlIHBpbm5lZCwgcmV0dXJucw0KPiA+ICsgKiAtZXJybm8uDQo+ID4gKyAq
Lw0KPiA+ICtsb25nIHBpbl91c2VyX3BhZ2VzX2ZkKGludCBmZCwgcGdvZmZfdCBzdGFydCwgdW5z
aWduZWQgbG9uZyBucl9wYWdlcywNCj4gPiArCQkgICAgICAgdW5zaWduZWQgaW50IGd1cF9mbGFn
cywgc3RydWN0IHBhZ2UgKipwYWdlcykNCj4gPiArew0KPiA+ICsJc3RydWN0IHBhZ2UgKnBhZ2U7
DQo+ID4gKwlzdHJ1Y3QgZmlsZSAqZmlsZXA7DQo+ID4gKwl1bnNpZ25lZCBpbnQgZmxhZ3MsIGk7
DQo+ID4gKwlsb25nIHJldDsNCj4gPiArDQo+ID4gKwlpZiAobnJfcGFnZXMgPD0gMCkNCj4gPiAr
CQlyZXR1cm4gMDsNCj4gDQo+IEkgdGhpbmsgd2Ugc2hvdWxkIGp1c3QgZm9yYmlkIHRoYXQgYW5k
IHVzZSBhIFdBUk5fT05fT05DRSgpIGhlcmUgLw0KPiByZXR1cm4gLUVJTlZBTC4gU28gd2UnbGwg
bmV2ZXIgZW5kIHVwIHJldHVybmluZyAwLg0KSSB0aGluayBJJ2xsIGRyb3AgdGhpcyBjaGVjayBp
biB2MiBhcyBKYXNvbiBzdWdnZXN0ZWQuDQoNCj4gDQo+ID4gKwlpZiAoIWlzX3ZhbGlkX2d1cF9h
cmdzKHBhZ2VzLCBOVUxMLCAmZ3VwX2ZsYWdzLCBGT0xMX1BJTikpDQo+ID4gKwkJcmV0dXJuIDA7
DQo+ID4gKw0KPiA+ICsJaWYgKHN0YXJ0IDwgMCkNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4g
PiArDQo+ID4gKwlmaWxlcCA9IGZnZXQoZmQpOw0KPiA+ICsJaWYgKCFmaWxlcCkNCj4gPiArCSAg
ICByZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKwlpZiAoIXNobWVtX2ZpbGUoZmlsZXApICYm
ICFpc19maWxlX2h1Z2VwYWdlcyhmaWxlcCkpDQo+ID4gKwkgICAgcmV0dXJuIC1FSU5WQUw7DQo+
ID4gKw0KPiA+ICsJZmxhZ3MgPSBtZW1hbGxvY19waW5fc2F2ZSgpOw0KPiA+ICsJZG8gew0KPiA+
ICsJCWZvciAoaSA9IDA7IGkgPCBucl9wYWdlczsgaSsrKSB7DQo+ID4gKwkJCWlmIChzaG1lbV9t
YXBwaW5nKGZpbGVwLT5mX21hcHBpbmcpKSB7DQo+ID4gKwkJCQlwYWdlID0gc2htZW1fcmVhZF9t
YXBwaW5nX3BhZ2UoZmlsZXAtDQo+ID5mX21hcHBpbmcsDQo+ID4gKwkJCQkJCQkgICAgICAgc3Rh
cnQgKyBpKTsNCj4gPiArCQkJCWlmIChJU19FUlIocGFnZSkpIHsNCj4gPiArCQkJCQlyZXQgPSBQ
VFJfRVJSKHBhZ2UpOw0KPiA+ICsJCQkJCWdvdG8gZXJyOw0KPiA+ICsJCQkJfQ0KPiA+ICsJCQl9
IGVsc2Ugew0KPiA+ICsJCQkJcGFnZSA9IGZpbmRfZ2V0X3BhZ2VfZmxhZ3MoZmlsZXAtPmZfbWFw
cGluZywNCj4gPiArCQkJCQkJCSAgIHN0YXJ0ICsgaSwNCj4gPiArCQkJCQkJCSAgIEZHUF9BQ0NF
U1NFRCk7DQo+ID4gKwkJCQlpZiAoIXBhZ2UpIHsNCj4gPiArCQkJCQlyZXQgPSAtRUlOVkFMOw0K
PiA+ICsJCQkJCWdvdG8gZXJyOw0KPiA+ICsJCQkJfQ0KPiA+ICsJCQl9DQo+ID4gKwkJCXJldCA9
IHRyeV9ncmFiX3BhZ2UocGFnZSwgRk9MTF9QSU4pOw0KPiA+ICsJCQlpZiAodW5saWtlbHkocmV0
KSkNCj4gPiArCQkJCWdvdG8gZXJyOw0KPiA+ICsNCj4gPiArCQkJcGFnZXNbaV0gPSBwYWdlOw0K
PiA+ICsJCQlwdXRfcGFnZShwYWdlc1tpXSk7DQo+ID4gKwkJfQ0KPiA+ICsNCj4gPiArCQlyZXQg
PSBjaGVja19hbmRfbWlncmF0ZV9tb3ZhYmxlX3BhZ2VzKG5yX3BhZ2VzLCBwYWdlcyk7DQo+ID4g
Kwl9IHdoaWxlIChyZXQgPT0gLUVBR0FJTik7DQo+ID4gKw0KPiA+ICtlcnI6DQo+ID4gKwltZW1h
bGxvY19waW5fcmVzdG9yZShmbGFncyk7DQo+ID4gKwlmcHV0KGZpbGVwKTsNCj4gPiArCWlmICgh
cmV0KQ0KPiA+ICsJCXJldHVybiBucl9wYWdlczsNCj4gPiArDQo+ID4gKwl3aGlsZSAoaSA+IDAg
JiYgcGFnZXNbLS1pXSkgew0KPiA+ICsJCXVucGluX3VzZXJfcGFnZShwYWdlc1tpXSk7DQo+ID4g
KwkJcGFnZXNbaV0gPSBOVUxMOw0KPiANCj4gSWYgbWlncmF0ZV9sb25ndGVybV91bnBpbm5hYmxl
X3BhZ2VzKCkgZmFpbGVkLCBzYXkgd2l0aCAtRU5PTUVNLCB0aGUNCj4gcGFnZXMgd2VyZSBhbHJl
YWR5IHVucGlubmVkLCBidXQgcGFnZXNbaV0gaGFzIG5vdCBiZWVuIGNsZWFyZWQsIG5vPw0KWW91
IGFyZSByaWdodDsgdGhlIGFib3ZlIHdoaWxlIHNob3VsZCBub3QgYmUgZXhlY3V0ZWQgaW4gdGhh
dCBjYXNlLiBJIGFkZGVkDQp0aGlzIGNodW5rIHRvIGNsZWFudXAgYWZ0ZXIgYW55IGVycm9ycyB0
aHJvd24gaW4gdGhlIGZvciBsb29wIGFib3ZlLiBJIGd1ZXNzDQpJIG5lZWQgdG8gYWRkIGEgbmV3
IGVycm9yIGxhYmVsIHRvIGNsZWFudXAgYWZ0ZXIgZXJyb3JzIHRocm93biBieQ0KY2hlY2tfYW5k
X21pZ3JhdGVfbW92YWJsZV9wYWdlcygpLg0KDQpUaGFua3MsDQpWaXZlaw0KPiANCj4gPiArCX0N
Cj4gPiArCXJldHVybiByZXQ7DQo+ID4gK30NCj4gPiArRVhQT1JUX1NZTUJPTF9HUEwocGluX3Vz
ZXJfcGFnZXNfZmQpOw0KPiA+ICsNCj4gDQo+IC0tDQo+IENoZWVycywNCj4gDQo+IERhdmlkIC8g
ZGhpbGRlbmINCg0K
