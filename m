Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC9456BBE9
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 16:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EEC10E0DD;
	Fri,  8 Jul 2022 14:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A79D10E087;
 Fri,  8 Jul 2022 14:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657291498; x=1688827498;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=qphk4ciyPrsw0PBHWI8QGD12keEq2X4qK7Hjojx142M=;
 b=hQj28Sc8WcBR2ZciYgdeJ90fBxmzrBlHBDMPoMQLfkL3H6H9ecFQlMH+
 5HKAP/AOMI1W6iZCfIA+Naor4qVxK4YKsEDWcKO7f07DitI/HF6ooGqpA
 PYVWCiC2U/FcfY7qPNl7PF3slOBvoEAO68cwehOtchW1miyMnZQvdW7qT
 7GatGIc/LPZkBjGAYHTKshtHCN7fmamswOhv9odgN+cLVowdS9dHSn1tW
 BErJ4V0i33tdLOz8v2w1Ko1wb7RY/KhuDCVZZkzTFY5P5YppRs0r1/EnD
 FlOVJ/uI9vvnUFQYuhVccVtnSRMMNzpfZpXScliIBaW6fTWomrb3id5wh Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="267326028"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="267326028"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 07:44:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="544228004"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP; 08 Jul 2022 07:44:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 07:44:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Fri, 8 Jul 2022 07:44:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Fri, 8 Jul 2022 07:44:56 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Fri, 8 Jul 2022 07:44:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ReqHPmwvDT2Wqx5RFIsPyT4tW8tB41R6gbQd20f44Nfg0Rp+KTvdRx4hSu335dDJruBN65SdNRNcj/b5ldC1JQdGiwppIiZqvDneYxSheNeM4H8JbaqwkVE8pymWbPfi8SRbTHedQJqpPOVVDgw9ikKDja6wWlD0k5Tw/8n5nwyjLvEgc8fjoIYalFqrUkqkpziRLiEECpoPhfVLPhY57xyFKayK2iSdanSxlL5nOKdjw1XVaek1UyOTMvBiZBbhetl5slupYs1JkjpzfuxQgdKkf6c4mVHJnFgFZeqzZnz2TB9bZswcQNXd5mgU9gywxXjhyAnSKkOK/lvHg38SYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qphk4ciyPrsw0PBHWI8QGD12keEq2X4qK7Hjojx142M=;
 b=IzU0V5TlC3PJ5MVUJYeyX3Yvahho3hfHZv1APIS/7Ab+XNwWhvjIJQi2uxcyhIBZ05jrXstw3sHdgWEt7Aq4RK/Zhx0P1C8ExWx9vMU70lyxXJFBY3TABxsNKbO+PmJJbAFRsRkRNEufZLmVYOrdpF1yzcPdAYVAEF5RM+7H/kb2gnVQ3pAL89+MCZ9/9+pyi0NGFCP5W4ssX1Z1R7YwXDSXH8oNBYV0gi4E6yJpAm5NiJJlTLNJ07UAXvx8ZAqd4YPmB5nsbnb7NlWhCHCY5dJvpbrm2dqjrsPruvyGe1cFUoYzQV3Iwc9SMZBD0USdiEw3/ERMT7dd9Zidz+DmXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB3114.namprd11.prod.outlook.com (2603:10b6:5:6d::11) by
 BYAPR11MB2935.namprd11.prod.outlook.com (2603:10b6:a03:82::24) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5417.20; Fri, 8 Jul 2022 14:44:54 +0000
Received: from DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3820:8a37:de8b:ccbd]) by DM6PR11MB3114.namprd11.prod.outlook.com
 ([fe80::3820:8a37:de8b:ccbd%5]) with mapi id 15.20.5395.022; Fri, 8 Jul 2022
 14:44:54 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Subject: Re: [RFC 03/10] drm/i915/vm_bind: Support private and shared BOs
Thread-Topic: [RFC 03/10] drm/i915/vm_bind: Support private and shared BOs
Thread-Index: AQHYjZ0djP6r/JGZAUO5pv/twnHGaa1yvkIAgAG/6ICAAAgRgIAAERuA
Date: Fri, 8 Jul 2022 14:44:54 +0000
Message-ID: <b9cae3426f00b1f8335a45f6458c430710b06e8c.camel@intel.com>
References: <20220701225055.8204-1-niranjana.vishwanathapura@intel.com>
 <20220701225055.8204-4-niranjana.vishwanathapura@intel.com>
 <e004aef5d2c491e584d6d3c2e6627093ec89d119.camel@intel.com>
 <20220708131446.GU14039@nvishwa1-DESK>
 <14ea50c0efa43f569c0662bafcea5ad81f4886d9.camel@intel.com>
In-Reply-To: <14ea50c0efa43f569c0662bafcea5ad81f4886d9.camel@intel.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb9ea9a5-1914-430f-0926-08da60f06bff
x-ms-traffictypediagnostic: BYAPR11MB2935:EE_
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A7jIGfoL07gqfb+SU6wnMZgGFbBO6b9nKsDhT2HdvwnxmpCqSSTE5Wa8c8kR5HUdPE6CILbPdSLkKgO14MFkmakAX3eNRiy9WZYaULNQW7FYo8RdmcE4LiH0ypoeHe2PtEzFftbUiSoejMuKJQMNiKzHewWHCgWAONXAdx7Qb1hmEmlF2be6qrWAhgHaAcXawMk6HYmH+81f3kRCeWUpoCkFPK6qCCZsueMYnd71m90LfjApi36UV7WsYK+DVfaY+17RzbCa8vWsS2Wgxwy0o+BQANXTz/jVNM/2SqSq/uGMqaph85z95KlQN6+x/cvN72pjF1x6oy5kHxyTCZ1YrOYXHr6AEgmsOUwvD+WEgmKF8NIfN9eUlyLL4/RC0EZN6y0smYVa0HF70IasW7kZeKBGV532Eg5h5lRNJw2cS0h79VKEBfQKmXC2y+oj6PhppIWfwWbbZv1Cwx9GXxF52QTlYh1tjrjvazhJ3vvsxxoGTCdmH6/FadIJ7hOJVLiHU63SnqwJvQtnv83yikBFdse2d3oafWksYspCZyhUuhne1bbjdW11JYoLPjgEUB/e5JTlSGrEpi6KOYnelfOHXcYInQOZJEe3dJvg9x5gfYhDC4fLeVGJ7dsGXTfY4uJKuheghVJmLbVQRyZlMMjTmBAkZ2wTaOuyePYn0ykF5ddlFjWIolU3+obG16ufOvZTEmFAdPbAn5LDB446k8eYOXRzDdq7IIfdqgUD7Qr2pLmQ2EQJrqsh5rUoATpIuW/fHw6P7EC/d51Xf8d270PumqZG7zS7YJYo3ryXs7bJFTuyLWZKG5IrZBs+xGOjJ3MF
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB3114.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(396003)(39860400002)(346002)(376002)(136003)(366004)(38070700005)(86362001)(122000001)(82960400001)(38100700002)(64756008)(8676002)(4326008)(66446008)(66476007)(66556008)(91956017)(66946007)(76116006)(54906003)(37006003)(6636002)(316002)(5660300002)(8936002)(6862004)(2906002)(186003)(2616005)(83380400001)(66574015)(6486002)(478600001)(71200400001)(6506007)(6512007)(26005)(41300700001)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q3dNYXBNTjF2cFZ2ZUFDSTNvRVU5WFgzU2xaZTljZjJMYjFiLzA2MVV1dVF1?=
 =?utf-8?B?bjI5SXZZWnVzNW9VaHNvNFQ5eXo0SUlPSi9zd1psSkh0akNLRU5qdlVSaXV1?=
 =?utf-8?B?L1lCSWxKb1ozUEJCaEhxWDZ4NngyYTZmVEM1aksweTVFOTRQNmhWOXBtd2lq?=
 =?utf-8?B?OTIwUi9tbWRCUnlHWW15WEZIbHJ3ay9Ydlc1VkEzVkJkaW1EbkhhZjNvS0xz?=
 =?utf-8?B?UGh6d0NMUmUvdUNjeWJtQ1BYa1h5VjNtRmdFMXdjNGZvVXZ6NC9ydW55eUJK?=
 =?utf-8?B?L1lJSW5xcEVYVEtaK3lkbkJUMkMrOHc0ZHg4R3ZhVC9wYi9hYy9GNHZnRG9o?=
 =?utf-8?B?N1hELytuUEpIZW90Ym1xRlMwMWY2cWFPSEdEY0RZWlJVaHQ4ZUZEQ2lPNWJ5?=
 =?utf-8?B?V1dxNUU0VkpjbHczZHVVdHFTbldvRkRzU2hQUXl5RVdxR3NFNmYybW1Nelhh?=
 =?utf-8?B?aW5mSUJ2YkY3aGY4a2NOTDh0NHVqNFZBUDMwNDZmRHg3aEptVytnQ2RJTTBy?=
 =?utf-8?B?cGtWTjc2RUt6aWFRZ2dLUXlnN01yVG5mUWtXOTZCdnRDWWJ3am1ybTBlTVJu?=
 =?utf-8?B?d0I5V3kweVJmbHp0QmlMTmJvdjYwR3RlVE1EWlB2cmUveitna014WDFyaE5D?=
 =?utf-8?B?aXN5czR2Vko4ay9QN2s4Nk55RWZtRTFwTmEzRWM3SHlnd0pMY0tOZzRoV1VI?=
 =?utf-8?B?VjN6WGxsUEcwNHI0V21rWTM0c2hyeXp0aFZjYXF0V1JUV0ZPYng5U3ZSUmZa?=
 =?utf-8?B?YzdUUXd2ZzA2SDdVc2ZQTHhLSTF3bHFpajZHY3FqZldtb3VUVEJTOVlqS2M1?=
 =?utf-8?B?Y0tQU1hpMThUd0lKZlRldmZUZk5pR0didEkxZU1LQlpTMm5iM3I3MW5WaWt0?=
 =?utf-8?B?bndRR1ZnSEsrcWV3QlNBTXZtTWVlUk14UmJZZHh3SGZvK0x0ZnE4S0VHSVhx?=
 =?utf-8?B?WnV3dVloZkpDYXVqNTRwd09YVGd1ZERMckZKck9HUlgxKzFnWWtMR3lmd29S?=
 =?utf-8?B?VVVDM09wdEUxaE9jY0FaUWsxNVJIVGkrNUpUZkNjaXh1RGxrelZDOGEwVGxW?=
 =?utf-8?B?WkRZK2dMbXB0eXNFLzRLa081UUdNQS9hNU9uZGhEQmNpTnVLdjAwUE1LaTRp?=
 =?utf-8?B?U3JvY2dTQ1ZmYVRFMWdSZFB0cVkwV1c0cVBBcEdjVVJuSHNwZEdhS2cxS0lo?=
 =?utf-8?B?YjR3T0UyTnFEMU82TGN6aWlCS3ZBd0ZQay90Rm1lTkp3aTFFRHh4eE8zTVdx?=
 =?utf-8?B?ZlFLKzRwdFJlZ1NxazRBZUExSGZXWVA1WFZsb08rYmhoTThnMkJqQ0dLT1hG?=
 =?utf-8?B?VTkvRitOZUdJQ0JLV3ZYcis2Qit2cXU5aXNJYVVaZUhlRDVaUWpUcEZDcWkx?=
 =?utf-8?B?d2JjQVJpaXdibWhnbXJHdzJHcktlNG5wczF5WHVNelVNOFpWZU8zWWRnUVpq?=
 =?utf-8?B?VDVnSGxZUmNMQk1OTDl0L01TRUZZd3c4ODJCeGNtVE0vTndTbGR5UjBGZlpm?=
 =?utf-8?B?a0d2QVViUVdWTFVBTlZZSTBGUW9KK1RYYk5uNURIQitlTnlrbVJFU0RGeFVk?=
 =?utf-8?B?S1ptam5Ucld5Nk5ZaTVJUTdGOWRXSWJTM01ESXZaMkpaRXJhTitNMDRBQ2hm?=
 =?utf-8?B?MkZlamxscEZkZFFxNE9pTHFaOFNOZW5iVitqQ1lNQ1dTTjkwWG9nZFFsMk5i?=
 =?utf-8?B?amhkNlZzZTdTb29CaDNPOTZaMFB1eFZSd0ZpRmhlOGhwYm0zcmkvQjVwUTdu?=
 =?utf-8?B?YzBRL1A5dFRhSktTQzd4MFBQVExVRGJoKzFMaW9JLzdKTVlMeVQxN0hpaFVK?=
 =?utf-8?B?YzN3aHdYZmJpNFBJTlpNME1CYXQ5ck1ISnBLN2l5QXptRlBWd01jOGNxcGNm?=
 =?utf-8?B?MUhpM3daZkRVRzFJVFJ0cUszU3F4MFJodmNPTkt4ZW9INnZsMmgvaVpQeFlk?=
 =?utf-8?B?b21DeGtGUXIyaDlLanduRVJ4dWZGVVlXdGtQZERpTjdEa0NiWHNwWG1IV2tN?=
 =?utf-8?B?MnJvY0pmNnNvR3Rzd2dlenAvRFFNSGlKejhSWHc5Ykl1N2Fyak5oZWRVLzUr?=
 =?utf-8?B?aXZETWppU29tcFk0dUo2TEFsdzJocTJwSW1CUTNqcXlZUk5pM1J2MXZ0TzdR?=
 =?utf-8?B?WE4xRVNiZnl3S3VwdHNmNXV6M293TTBjUGdqcTJCT0tOYUUxL1kxaGIyK29I?=
 =?utf-8?Q?O0+dlPdOFfqJ2LqlMrq3YhU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5F0E465F4E06714A88FA93D8ABA3F9DE@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3114.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb9ea9a5-1914-430f-0926-08da60f06bff
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2022 14:44:54.6171 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 82O9Eqedu54iJ8AoikqhApr4P0zW3rKSEaObdCCpmtwl+OCqLT33qoZ9OkEdu+lqn36owgPF9HyuIuwM0S3sAlQYKHZGyh5lFcfPu7XZZq8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2935
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
Cc: "Brost, Matthew" <matthew.brost@intel.com>, "Zanoni,
 Paulo R" <paulo.r.zanoni@intel.com>, "Landwerlin,
 Lionel G" <lionel.g.landwerlin@intel.com>, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Auld,
 Matthew" <matthew.auld@intel.com>,
 "jason@jlekstrand.net" <jason@jlekstrand.net>, "Vetter, 
 Daniel" <daniel.vetter@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIyLTA3LTA4IGF0IDE1OjQzICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSB3cm90
ZToNCj4gPiBUaGUgdm1fYmluZC9ib3VuZF9saXN0IGFuZCB0aGUgbm9uX3ByaXZfdm1fYmluZF9s
aXN0IGFyZSB0aGVyZSBmb3INCj4gPiB2ZXJ5IGRpZmZlcmVudCByZWFzb25zLg0KPiA+IA0KPiA+
IFRoZSByZWFzb24gZm9yIGhhdmluZyBzZXBhcmF0ZSB2bV9iaW5kX2xpc3QgYW5kIHZtX2JvdW5k
X2xpc3QgaXMNCj4gPiB0aGF0DQo+ID4gZHVyaW5nIHRoZSBleGVjYnVmIHBhdGgsIHdlIGNhbiBy
ZWJpbmQgdGhlIHVuYm91bmQgbWFwcGluZ3MgYnkNCj4gPiBzY29vcGluZw0KPiA+IGFsbCB1bmJv
dW5kIHZtYXMgYmFjayBmcm9tIGJvdW5kIGxpc3QgaW50byB0aGUgYmluZCBsaXN0IGFuZA0KPiA+
IGJpbmRpbmcNCj4gPiB0aGVtLiBJbiBmYWN0LCB0aGlzIHByb2JhYmx5IGNhbiBiZSBkb25lIHdp
dGggYSBzaW5nbGUgdm1fYmluZF9saXN0DQo+ID4gYW5kDQo+ID4gYSAnZWIuYmluZF9saXN0JyAo
bG9jYWwgdG8gZXhlY2J1ZjMgaW9jdGwpIGZvciByZWJpbmRpbmcuDQo+ID4gDQo+ID4gVGhlIG5v
bl9wcml2X3ZtX2JpbmRfbGlzdCBpcyBqdXN0IGFuIG9wdGltaXphdGlvbiB0byBsb29wIG9ubHkN
Cj4gPiB0aHJvdWdoDQo+ID4gbm9uLXByaXYgb2JqZWN0cyB3aGlsZSB0YWtpbmcgdGhlIGxvY2tz
IGluDQo+ID4gZWJfbG9ja19wZXJzaXN0ZW50X3ZtYXMoKQ0KPiA+IGFzIG9ubHkgbm9uLXByaXYg
b2JqZWN0cyBuZWVkcyB0aGF0IChwcml2YXRlIG9iamVjdHMgYXJlIGxvY2tlZCBpbg0KPiA+IGEN
Cj4gPiBzaW5nbGUgc2hvdCB3aXRoIHZtX3ByaXZfbG9jaykuIEEgbm9uLXByaXYgbWFwcGluZyB3
aWxsIGFsc28gYmUgaW4NCj4gPiB0aGUNCj4gPiB2bV9iaW5kL2JvdW5kX2xpc3QuDQo+ID4gDQo+
ID4gSSB0aGluaywgd2UgbmVlZCB0byBhZGQgdGhpcyBhcyBkb2N1bWVudGF0aW9uIHRvIGJlIG1v
cmUgY2xlYXIuDQo+IA0KPiBPSywgSSB1bmRlcnN0b29kIGl0IGFzIHByaXZhdGUgb2JqZWN0cyB3
ZXJlIGVpdGhlciBvbiB0aGUgdm1fYmluZA0KPiBsaXN0DQo+IG9yIHZtX2JvdW5kX2xpc3QgZGVw
ZW5kaW5nIG9uIHdoZXRoZXIgdGhleSBuZWVkZWQgcmViaW5kaW5nIG9yIG5vdCwNCj4gYW5kDQo+
IHNoYXJlZCBvYmplY3RzIG9ubHkgb24gdGhlIG5vbl9wcml2X3ZtX2JpbmQgbGlzdCwgYW5kIHdl
cmUgYWx3YXlzDQo+IGxvY2tlZCwgdmFsaWRhdGVkIGFuZCBmZW5jZWQuLi4NCj4gDQo+IE5lZWQg
dG8gdGFrZSBhIGRlZXBlciBsb29rLi4uDQo+IA0KPiAvVGhvbWFzDQo+IA0KPiANCj4gDQo+ID4g
DQo+ID4gTmlyYW5qYW5hDQo+ID4gDQo+ID4gDQoNCkhtbS4gSnVzdCBhIHF1aWNrIHRob3VnaHQg
b24gdGhpcywgU2luY2UgdGhlIG5vbi1wcml2YXRlIHZtLWJpbmQNCm9iamVjdHMgYWxsIG5lZWQg
dG8gYmUgaXRlcmF0ZWQgdGhyb3VnaCAobG9ja2VkIGFuZCBmZW5jZWQgYW5kIHVzZXJwdHINCnZh
bGlkKSBvbiBlYWNoIGV4ZWNidWYsIGFuZCBjaGVja2luZyBmb3IgdmFsaWRhdGlvbiAocmVzaWRl
bnQgYW5kDQpib3VuZCkgaXMgYSB2ZXJ5IHF1aWNrIGNoZWNrLCB0aGVuIHdlJ2QgbmV2ZXIgbmVl
ZCB0byBhZGQgdGhlbSB0byB0aGUNCnJlYmluZCBsaXN0IGF0IGFsbCwgcmlnaHQ/IElmIHNvIHRo
ZSByZWJpbmQgbGlzdCB3b3VsZCBiZSBleGNsdXNpdmUgdG8NCnZtLXByaXZhdGUgb2JqZWN0cy4N
Cg0KQWxzbyBJIGRvbid0IHRoaW5rIHRoZSB2bV9iaW5kIGxpc3QgY2FuIGJlIGV4ZWNidWYtbG9j
YWwsIHNpbmNlIGJpbmRpbmcNCm1heSBub3QgaGF2ZSBjb21wbGV0ZWQgYXQgdm1hX3JlbGVhc2Ug
dGltZSwgYXQgd2hpY2ggcG9pbnQgdGhlIG9iamVjdHMNCm5lZWQgdG8gcmVtYWluIG9uIHRoZSB2
bV9iaW5kIGxpc3QgdW50aWwgdGhlIG5leHQgZXhlY2J1Zi4uLg0KDQovVGhvbWFzDQoNCg0K
