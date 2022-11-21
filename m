Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE3C632BBB
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 19:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45B610E326;
	Mon, 21 Nov 2022 18:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E84BC10E325;
 Mon, 21 Nov 2022 18:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669054069; x=1700590069;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=DiDXkytBcmfTe4y57NfxOPAoP42gXJjjX0DDHESRT/M=;
 b=mpZCaziaMq7/UeZMl8nMuSKFAqSdBGAJ6VOAcz8+2QEfzViCOrhPf3hw
 D58M+wPqZCp/iwJH6XdsDXqPAkUMYBlkfetAN/RXtXaZiguy09ubAlikn
 ixg4h8FVP833EkCNvRabml2wcsp9ARdUCUNVrj0Xt16p/dJVm3Gamd14a
 tNOIiSxIcvt4xN/UFy6hdg+411LQ0JOUX4FBB0logk2jvQNTLSRLhg1nF
 YcwnUb4BkIIf7OJcyveyvjLpEvh3xyizQohbDUG4D69tOi0WRVLNUQ2g8
 a9mdbGMtDR5qOocUDh8rOvy8sbbFWqLMe6xEG2mrY8LWiLURkhzGKMWxw w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="296982782"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="296982782"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 10:07:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="730098994"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="730098994"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2022 10:07:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 10:07:07 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 21 Nov 2022 10:07:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Mon, 21 Nov 2022 10:07:06 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Mon, 21 Nov 2022 10:07:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FBmxjCkNM6CEUgs72N6cEwcZHU8HPFwfr+R/h2xbasgHwl7W/Fq6EIwMb/Sa3DNaSNBoMenEz7yUTLMA6/UxDvbWuYgLJ1rbOvjABgkWbyOJ13QiSQNn588pbt+KmfoOIB4Ulzd/xuHj+VFhJMOIeHfQHLgLAg1um6897Plikm6TjoX5Y6Qm/9Ls5imRIgRl/tLA/4bRX4y20LEfiUP93TGkTPYNbQ+8iG/PdNfwafILaA0rzx1rvXSlH0TtRtUQerzBQSHHStUjHUoFfKYiYWMNJjxVHf7NAs1z2mT7p7+hrdKVjWz/wvUiI8TCPTtB4015r+8ZlAN2BOx5mqrygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DiDXkytBcmfTe4y57NfxOPAoP42gXJjjX0DDHESRT/M=;
 b=drlWs+5ZzVtwLRvI4/lK7dEs5zEAgkOfxA2SEJYUYiazJfJBc4FMHnRCxzg2UFmRGTMeSRrAtZeXjo/9mHSwbIYFS9eZkJ0QuXLBhy55rWKZ+i3IIgVDZ0zun4u44uBj1cMlaTAyWBfYA6s1g67DKJ0FWCCAfJf8oH4eLQ9DM3dI/pERgrfzdM/S56SjDchoDx7pGAI4+XDMeuM7KkhnF4DeL5wBIg9cVbXZmf++NAtsMw3/ClbKTsgbg+Nkh8bHBoqSbdT01McfuMMScirezTH1eMdJnEbWdmr2F3FUQR7uQ0ROcsxqCi8mrB6IEME/3bJ8iTZ+3rfe2toVtBzMWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.15; Mon, 21 Nov
 2022 18:07:04 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f4b9:901c:6882:c286%4]) with mapi id 15.20.5834.009; Mon, 21 Nov 2022
 18:07:04 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/i915/mtl: Enable Idle Messaging for GSC CS
Thread-Topic: [PATCH v3] drm/i915/mtl: Enable Idle Messaging for GSC CS
Thread-Index: AQHY+3vOvSF5Aby0v0KE1ozhqswYWq5FArAAgACVhgCABBjuAA==
Date: Mon, 21 Nov 2022 18:07:04 +0000
Message-ID: <3eb43552a6847a23190044bb0718405743136b6a.camel@intel.com>
References: <20221118183354.1047829-1-badal.nilawar@intel.com>
 <be06273fc45d5cc758a57c2244a1ba43e26458d3.camel@intel.com>
 <929fb32b-7dd9-c9bc-f735-a0d0aab51cec@intel.com>
In-Reply-To: <929fb32b-7dd9-c9bc-f735-a0d0aab51cec@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4 (3.44.4-2.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR11MB6059:EE_|PH7PR11MB6053:EE_
x-ms-office365-filtering-correlation-id: b93bda96-7337-494f-5e16-08dacbeb31fc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SxY49e37w6IIsnvUNEIyB7AAxKUJl03npnlRqlRlFFhSXh+ialGWqueWH7rq59gqq5JDk6GUI3WouFXukgn2Jr2aGDrulY8jzcmZQDZvljY5+Zkyln4OzIlJsbsaIKD5go7PAQHraVYz2bvvTpFiy4mL84Kq3ze29z9w6UMGlD8ArabSTODXVPpriHK2lHJ585uFHRi3J2+tj/8XGnkeFOeiETAJtmcGVEnfdIXK1DxO404S4SAquXfmebAJQnIKrKhEAS4V+roTLDWvz90QCREoeadfmvHuJekguWMAGGZ/+oUdoEaaaRwYKNqwhvLOlK/AMBemIiHu/RwzsPVh7togwmu4xYvh1LmRWJ2Q0lE6jWjKoP7Tl0QAnkstXB6Cq62SOfXAQ4p7D4iEQC7GJbk+ru+K+YPmxBppIn6UZnd8Z2B0AGlmAeVH9V+J9TWjGd7qiy8bn7vv4eD2iaXe/rrM5sc9qz7artoTx2esb5iWYI3aNNKMZRO0HtYDRFuW5t5L384UipocriU8aFNgKSKqly9FsGqD/SmMc3H2hAkioA/5eAWdrxEEq5UJaiOugKD2nXPkrlvDkkln0rZmS6oVS72p5XC+vTEsTEHpU1wR1kUG52PDft6NKTU6eqvQOLXmHFjwe/WhlQ3TpYliwEejNcjYbsiw3mzWYJToCu9szzcyNw1XMyonJDqjN4rXJUoid9BPzVePo9zj6UKPUw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(366004)(396003)(376002)(39860400002)(136003)(346002)(451199015)(38100700002)(122000001)(83380400001)(38070700005)(86362001)(8676002)(4001150100001)(8936002)(82960400001)(4326008)(2906002)(41300700001)(66446008)(66476007)(66556008)(5660300002)(53546011)(26005)(107886003)(6512007)(6506007)(71200400001)(2616005)(110136005)(316002)(450100002)(54906003)(91956017)(64756008)(186003)(478600001)(76116006)(66946007)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SG1mQ3dTNnM0b3ZySjVsQ3NBaEJEMTNPazdSM05KMnpLK0V4ZWtreXhybm1z?=
 =?utf-8?B?L2dzNWJTdXFkZ2dEUE1TQ0xYQnh6b2RkeDYzWjdremhaNVRxYlFOamFQTC9O?=
 =?utf-8?B?VU4zcmd5Rmx5cVlZcEx5Z1VuTmovQ2tLcnFSSllYdEN6UkRUaGVFRjBEbS9m?=
 =?utf-8?B?M056TlVuTXQ5RUUyeTRYYnREbzhlNlcxODlIYkI0YldKOFEwOS9OMGZEVjRH?=
 =?utf-8?B?L1dwbTR5Z0JWNytDSXhvUi9iZ3JqaXNUSFJzK1VWMmdDbGp5Z2RoazZKYlBE?=
 =?utf-8?B?c2NVbXV0TnRzQlJRaHNCWGhzWXZvaUc4dklIUS8vQldQaHplYWZjYjdPS3Fm?=
 =?utf-8?B?NDNhSHQ4TFRsSkVNVlJveGozVWNxWXBiRVg4dWI5eDZoYmF6azVmVnZ4cEp6?=
 =?utf-8?B?NWcvNXRaM1lybUtZZHBNL0FGN29MWGF5YkpBNVNhMStPdU4rZ2JGZmE2Y1Jp?=
 =?utf-8?B?OE8rZWdyNVlERFdOdnYrcXUzTlZ4MUI3cHhxcjdneUZucktrMkFuM2tNWXlE?=
 =?utf-8?B?blI4aUR4R0VHelRodW8wUXVzeTM1NUthNnJVcFJuUVpLY01ieEdYazBCcTd4?=
 =?utf-8?B?RzdIb3hDcENIdTFxdVJmWkwvUTFxdXpXaFhvS29EbWdWd1BKaGRGejE5b1ZQ?=
 =?utf-8?B?VEEvUGJHT3RaQm51K1JpMGs4V2RXc2o4S2VXTVQydEphWWVoOTlWb3pWV3NB?=
 =?utf-8?B?Y0diL0JOS3JsOWtzN1E3M3FLd0VMMlplclhMVDVhMUI4UnorSnBrT25tNDIr?=
 =?utf-8?B?a3FVQ3FtVE8yeG5XV2NmWjdSSVRVRStYZEVhUnlKWWhWTWNFTjZqUDJVVFk1?=
 =?utf-8?B?cmEyckRNRW44ZTBYcndYMDdRVU9TcGsrRCs3NDZNcjRodGhtT1pLQjJFSlho?=
 =?utf-8?B?MzBjRXlHbWpScWl1UTJWNk94RldtYURkT0orTU1RZW1Gb0ZLZ1BUNlBVS0dr?=
 =?utf-8?B?VllWaVJPTWxQVlhWSXBQeFdqckFNaDhwMjN3clJ6UlJVVFJlbGJzZmtNRmRP?=
 =?utf-8?B?S1Fkek5pNWtuODlDNDFpbi8zWjN3K29KZUEvS0poY2pDMy81cXRjYXM1ZUVR?=
 =?utf-8?B?ZlZXUEp3K0h4VnJWY1F0WVp0ZGRxUWU4aVBsZjl6NE4xYk5lRmFQRHRKaTVh?=
 =?utf-8?B?bERKSkNXVUdWMGpreDlCcmdwMUdlcjJEcmRRVk9GWk9seUtWZThZYnlhSW9L?=
 =?utf-8?B?cnEzVDJHcGR6MytQVDZpbjNkRHhaWnhWanBFZyt0c1pDTUtFT3lqVkRpVGt0?=
 =?utf-8?B?b291eXV5blhHWkhtRm8xMzlZdzJUZXFYVk5GS2ladWZNYTRmaEVEWkhKeDN4?=
 =?utf-8?B?ZW9LWEY5RGZqdlhTTVJNQWpIMnpOUXJOME95d0p4YS9mTmo2dEw5U3hlMjI2?=
 =?utf-8?B?L09SekhZbWZva2hVbjB0RFI1bFNhejk1Ti9zV1I3U2RWcnpSSFdzR3dXSnZn?=
 =?utf-8?B?VGFWMFVmYnZ4dFJ1c0ZyR3l5cDhJSVFpNlQyL3ErWWJjdkZDS2xOVjhKbGp3?=
 =?utf-8?B?WmpienNtbVhiUVZRdS9RZ3NNQXgxT3NiWnZsYVFybVY4c3lFN2ZWNENnbW0z?=
 =?utf-8?B?RGowMHNtSDEvbTBkTGNZZW5tQkF6aEVoQURxeUhGZW14cTRDbkoySlhGMjZa?=
 =?utf-8?B?Nk1QbEE1UHlJWTBuZ2ZTQTd2WUoxM0dqR1B6Zmc4WDRsUTZvc3RBalFqMkFk?=
 =?utf-8?B?aVJXQTZ4bXdTbUVCeDNKSkJlZHNXeHE0UEZzWmxTZjNpNVpmTVg3TFVodU9K?=
 =?utf-8?B?YmtodHZ0SVlXN2dEMU9KYS9mNWlwSUxCUmswZVU2OURYMncvRGxIT3VieUFm?=
 =?utf-8?B?ZzhKTWJ2K1hsU1U2VEdxN21ZeXZjN09JRDFLak5JakdUKzNSOUREVWNKMDBL?=
 =?utf-8?B?T3FwK2J4VU1BWktXYnpSVDUzcGtwdnlFWldOZ1RFMENZcVNpZW81OUprVU04?=
 =?utf-8?B?YXVUTWIxTnFVTXZ2Z3dtSEM5UWN3V3l1RFU1dHpRUTFhc2lIb3pZNjRocyt0?=
 =?utf-8?B?cDZhdC9MNHdWVzUwNnFXZzVHQm1uRDQ3eDI5M282QUVtVVNpT1JJeS9qUmFy?=
 =?utf-8?B?Y0pra1Y1b1BvSXBzN1ZYUm1lVWJ2eUdBcFp4WjFVY0JObldtZmpyckMrLzFW?=
 =?utf-8?B?UXNKR3Y2VEUwMlEwL21BRzhocjA5U2V1UjA5VWpCQVJUaXBhRzg0dllyL0wr?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <EAA43B91F7999F4098FEA660124DB93E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b93bda96-7337-494f-5e16-08dacbeb31fc
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2022 18:07:04.2253 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +Ha/ZJ6iZFuon6z2bio2r8lqFDMfuxraFv0I5ORdDDuGi6yDhlWNBF8hyRNTJSWvQHcYz2ZJdRV/J9pzPuMZ9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6053
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
Cc: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Dixit,
 Ashutosh" <ashutosh.dixit@intel.com>, "Ewins, Jon" <jon.ewins@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Belgaumkar,
 Vinay" <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDIyLTExLTE5IGF0IDA5OjAyICswNTMwLCBOaWxhd2FyLCBCYWRhbCB3cm90ZToN
Cj4gDQo+IA0KPiBPbiAxOS0xMS0yMDIyIDAwOjA3LCBWaXZpLCBSb2RyaWdvIHdyb3RlOg0KPiA+
IE9uIFNhdCwgMjAyMi0xMS0xOSBhdCAwMDowMyArMDUzMCwgQmFkYWwgTmlsYXdhciB3cm90ZToN
Cj4gPiA+IEZyb206IFZpbmF5IEJlbGdhdW1rYXIgPHZpbmF5LmJlbGdhdW1rYXJAaW50ZWwuY29t
Pg0KPiA+ID4gDQo+ID4gPiBCeSBkZWZhdXQgaWRsZSBtZXNzYWdpbmcgaXMgZGlzYWJsZWQgZm9y
IEdTQyBDUyBzbyB0byB1bmJsb2NrIFJDNg0KPiA+ID4gZW50cnkgb24gbWVkaWEgdGlsZSBpZGxl
IG1lc3NhZ2luZyBuZWVkIHRvIGJlIGVuYWJsZWQuDQo+ID4gPiANCj4gPiA+IHYyOg0KPiA+ID4g
wqDCoC0gRml4IHJldmlldyBjb21tZW50cyAoVmluYXkpDQo+ID4gPiDCoMKgLSBTZXQgR1NDIGlk
bGUgaHlzdGVyZXNpcyBhcyBwZXIgc3BlYyAoQmFkYWwpDQo+ID4gPiB2MzoNCj4gPiA+IMKgwqAt
IEZpeCByZXZpZXcgY29tbWVudHMgKFJvZHJpZ28pDQo+ID4gPiANCj4gPiA+IEJzcGVjOiA3MTQ5
Ng0KPiA+ID4gDQo+ID4gPiBDYzogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJh
b2xvc3B1cmlvQGludGVsLmNvbT4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IFZpbmF5IEJlbGdhdW1r
YXIgPHZpbmF5LmJlbGdhdW1rYXJAaW50ZWwuY29tPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogQmFk
YWwgTmlsYXdhciA8YmFkYWwubmlsYXdhckBpbnRlbC5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTog
VmluYXkgQmVsZ2F1bWthciA8dmluYXkuYmVsZ2F1bWthckBpbnRlbC5jb20+DQo+ID4gDQo+ID4g
SGUgaXMgdGhlIGF1dGhvciBvZiB0aGUgcGF0Y2gsIG5vPyENCj4gPiBvciB5b3UgY2FuIHJlbW92
ZSB0aGlzIG9yIGNoYW5nZSB0aGUgYXV0aG9yIHRvIGJlIHlvdSBhbmQga2VlcCBoaXMNCj4gPiBy
ZXZpZXdlZC1ieS4uLg0KPiA+IA0KPiA+IG9yIEkgY2FuIGp1c3QgcmVtb3ZlIGhpcyBydi1iIHdo
aWxlIG1lcmdpbmcuLiBqdXN0IGxldCBtZSBrbm93Li4NCj4gQXMgaGUgaXMgb3JpZ2luYWwgYXV0
aG9yIEkgd2lsbCBwcmVmZXIgbm90IHRvIGNoYW5nZSBpdC4gWW91IGNhbg0KPiByZW1vdmUgDQo+
IGhpcyBydi1iIHdoaWxlIG1lcmdpbmcuDQoNClRoYW5rcyBhbmQgcHVzaGVkLg0KDQo+IA0KPiBS
ZWdhcmRzLA0KPiBCYWRhbA0KPiA+IA0KPiA+ID4gUmV2aWV3ZWQtYnk6IFJvZHJpZ28gVml2aSA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gPiA+IC0tLQ0KPiA+ID4gwqDCoGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9wbS5jIHwgMTgNCj4gPiA+ICsrKysrKysrKysrKysr
KysrKw0KPiA+ID4gwqDCoGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0X3JlZ3MuaMKg
wqAgfMKgIDQgKysrKw0KPiA+ID4gwqDCoDIgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygr
KQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50
ZWxfZW5naW5lX3BtLmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5n
aW5lX3BtLmMNCj4gPiA+IGluZGV4IGIwYTRhMmRiZTNlZS4uZTk3MWIxNTNmZGE5IDEwMDY0NA0K
PiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZW5naW5lX3BtLmMNCj4g
PiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2VuZ2luZV9wbS5jDQo+ID4g
PiBAQCAtMTUsNiArMTUsMjIgQEANCj4gPiA+IMKgwqAjaW5jbHVkZSAiaW50ZWxfcmM2LmgiDQo+
ID4gPiDCoMKgI2luY2x1ZGUgImludGVsX3JpbmcuaCINCj4gPiA+IMKgwqAjaW5jbHVkZSAic2ht
ZW1fdXRpbHMuaCINCj4gPiA+ICsjaW5jbHVkZSAiaW50ZWxfZ3RfcmVncy5oIg0KPiA+ID4gKw0K
PiA+ID4gK3N0YXRpYyB2b2lkIGludGVsX2dzY19pZGxlX21zZ19lbmFibGUoc3RydWN0IGludGVs
X2VuZ2luZV9jcw0KPiA+ID4gKmVuZ2luZSkNCj4gPiA+ICt7DQo+ID4gPiArwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqaTkxNSA9IGVuZ2luZS0+aTkxNTsNCj4gPiA+ICsN
Cj4gPiA+ICvCoMKgwqDCoMKgwqDCoGlmIChJU19NRVRFT1JMQUtFKGk5MTUpICYmIGVuZ2luZS0+
aWQgPT0gR1NDMCkgew0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGludGVs
X3VuY29yZV93cml0ZShlbmdpbmUtPmd0LT51bmNvcmUsDQo+ID4gPiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFJDX1BT
TUlfQ1RSTF9HU0NDUywNCj4gPiA+ICsNCj4gPiA+IF9NQVNLRURfQklUX0RJU0FCTEUoSURMRV9N
U0dfRElTQUJMRSkpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qIGh5
c3RlcmVzaXMgMHhBPTV1cyBhcyByZWNvbW1lbmRlZCBpbiBzcGVjKi8NCj4gPiA+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpbnRlbF91bmNvcmVfd3JpdGUoZW5naW5lLT5ndC0+dW5j
b3JlLA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBQV1JDVFhfTUFYQ05UX0dTQ0NTLA0KPiA+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAweEEpOw0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gK30NCj4gPiA+IMKgIA0K
PiA+ID4gwqDCoHN0YXRpYyB2b2lkIGRiZ19wb2lzb25fY2Uoc3RydWN0IGludGVsX2NvbnRleHQg
KmNlKQ0KPiA+ID4gwqDCoHsNCj4gPiA+IEBAIC0yNzUsNiArMjkxLDggQEAgdm9pZCBpbnRlbF9l
bmdpbmVfaW5pdF9fcG0oc3RydWN0DQo+ID4gPiBpbnRlbF9lbmdpbmVfY3MNCj4gPiA+ICplbmdp
bmUpDQo+ID4gPiDCoCANCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoGludGVsX3dha2VyZWZfaW5p
dCgmZW5naW5lLT53YWtlcmVmLCBycG0sICZ3Zl9vcHMpOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgaW50ZWxfZW5naW5lX2luaXRfaGVhcnRiZWF0KGVuZ2luZSk7DQo+ID4gPiArDQo+ID4gPiAr
wqDCoMKgwqDCoMKgwqBpbnRlbF9nc2NfaWRsZV9tc2dfZW5hYmxlKGVuZ2luZSk7DQo+ID4gPiDC
oMKgfQ0KPiA+ID4gwqAgDQo+ID4gPiDCoMKgLyoqDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ3QvaW50ZWxfZ3RfcmVncy5oDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2d0L2ludGVsX2d0X3JlZ3MuaA0KPiA+ID4gaW5kZXggYzNjZDkyNjkxNzk1Li44MGE5
NzllNmY2YmUgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9pbnRl
bF9ndF9yZWdzLmgNCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L2ludGVsX2d0
X3JlZ3MuaA0KPiA+ID4gQEAgLTkxNyw2ICs5MTcsMTAgQEANCj4gPiA+IMKgwqAjZGVmaW5lwqAg
TVNHX0lETEVfRldfTUFTS8KgwqDCoMKgwqDCoFJFR19HRU5NQVNLKDEzLCA5KQ0KPiA+ID4gwqDC
oCNkZWZpbmXCoCBNU0dfSURMRV9GV19TSElGVMKgwqDCoMKgwqA5DQo+ID4gPiDCoCANCj4gPiA+
ICsjZGVmaW5lwqDCoMKgwqDCoMKgwqDCoFJDX1BTTUlfQ1RSTF9HU0NDU8KgwqDCoMKgwqDCoF9N
TUlPKDB4MTFhMDUwKQ0KPiA+ID4gKyNkZWZpbmXCoMKgwqDCoMKgwqDCoMKgwqAgSURMRV9NU0df
RElTQUJMRcKgwqDCoMKgwqDCoFJFR19CSVQoMCkNCj4gPiA+ICsjZGVmaW5lwqDCoMKgwqDCoMKg
wqDCoFBXUkNUWF9NQVhDTlRfR1NDQ1PCoMKgwqDCoMKgX01NSU8oMHgxMWEwNTQpDQo+ID4gPiAr
DQo+ID4gPiDCoMKgI2RlZmluZSBGT1JDRVdBS0VfTUVESUFfR0VOOcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgX01NSU8oMHhhMjcwKQ0KPiA+ID4gwqDCoCNkZWZpbmUgRk9S
Q0VXQUtFX1JFTkRFUl9HRU45wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgX01N
SU8oMHhhMjc4KQ0KPiA+ID4gwqAgDQo+ID4gDQoNCg==
