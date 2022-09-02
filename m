Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAF45AAD18
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 13:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADCED10E7F7;
	Fri,  2 Sep 2022 11:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D43310E7F5;
 Fri,  2 Sep 2022 11:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662116816; x=1693652816;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=/jX/e+RsA6GfrWvkZWwXDzhmC5P0sKhIdozxSZcGDng=;
 b=FuprKsVGanb0YkStXUO05wd7I99xEMuXZQuIaLhy1D1nHlWwx4+76U9P
 IRQL1ZKtf9xk6UBYUHLuHi5hWfBr0mh/vKysPpXfvNI6cthxRR1YXhIk1
 btouzkxrZWAsPWh2RKzFtgccWNqndIzZNv9gc7rQEm4fmHzkMc/ikSgbv
 /hkn/tUCaIsTVXZraGbTLE8QuoGstSjB1Ves3l9aL7KZQVrvEqAlFlX8B
 RVS03Idj7uwYIGQHOQRhsKskZV/3By5hOUO2gQ8dGyN4pzRFLlr6uykvx
 AgrlEG02NqvGNKYQpxT6yXZ/KztcaoCYhw0yJ1x4J9gpStgrGFUtlfxSq g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="282944243"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="282944243"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2022 04:06:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="858202887"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2022 04:06:55 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 04:06:54 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 2 Sep 2022 04:06:54 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31 via Frontend Transport; Fri, 2 Sep 2022 04:06:54 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2375.31; Fri, 2 Sep 2022 04:06:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=knBn9mevK6AQ3hWTeZCWSGBSdahHIC+eaab9KB10f7uThuRFi2yhL6Wm+w2/v9yrDEOZztEy6OIL0OsV0YW4E7S5FjIjt741DBaG+eF8VEMPoZN2xymb95mEGCvrwA1R08xlD6M4bVqBt+zKiwUh/n1sxx2vMfYMApjrtetfoqy2VoDHyPe2RFaau0zK9yhifV7akgZkhdIKL7XUj6QBaBJ65+QbjHcGFSKtcNhjWCMQ0CPHOc8swTnL+qydT6XaEshz3JsxcdT6oVVNakGZwIgPwkJE0PpjgF7tfT5qjW/O9jUNf9UT2dvL13ZcM1Hgtb27DRJTA1noKZqdJPm5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/jX/e+RsA6GfrWvkZWwXDzhmC5P0sKhIdozxSZcGDng=;
 b=n88wcgdG2eqCGQMzK7ytv0/UgpPLctYGQ5nnX6ZtoGen4QVV0/dneesKloE3BaA4xSS93M3ypFnXjYl1UpxHkHgUDkSV0O14ApYBnMpO8kssh4cBkTtZb8IHS8BgLTXIUTZulH5X9PRgEHhKkxpwqnKWnt9dZSVipWhAuuSjFPo7AAfmLkI6l17xX5AJaCH+6RaWXlHyCz4JPqJG7U2e8F8b/3QaGOtXh6qBMoCz+5ykZWUSzjHRKI7Zto+mKEkOmxvKn1NZPO03hh19k2n0JlD9dQImkVJlQSkn9ff5+b/HwIoThaSze/kNGw0yRpzCh16dtp+59iFPUjC0eBxj4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 (2603:10b6:301:51::10) by MWHPR11MB1630.namprd11.prod.outlook.com
 (2603:10b6:301:e::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Fri, 2 Sep
 2022 11:06:52 +0000
Received: from MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::549e:abb2:40dc:6591]) by MWHPR1101MB2157.namprd11.prod.outlook.com
 ([fe80::549e:abb2:40dc:6591%9]) with mapi id 15.20.5588.015; Fri, 2 Sep 2022
 11:06:46 +0000
From: "Kahola, Mika" <mika.kahola@intel.com>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: RE: [Intel-gfx] [PATCH v2 4/4] drm/tests: Set also mock plane src_x, 
 src_y, src_w and src_h
Thread-Topic: [Intel-gfx] [PATCH v2 4/4] drm/tests: Set also mock plane src_x, 
 src_y, src_w and src_h
Thread-Index: AQHYtuPsgrBuWJhI3Eio7cIHrSs9Wa3MCdcA
Date: Fri, 2 Sep 2022 11:06:46 +0000
Message-ID: <MWHPR1101MB21577A59655D65D84FCE55BDEF7A9@MWHPR1101MB2157.namprd11.prod.outlook.com>
References: <20220823112920.352563-1-jouni.hogander@intel.com>
 <20220823112920.352563-5-jouni.hogander@intel.com>
In-Reply-To: <20220823112920.352563-5-jouni.hogander@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fd7ee0b4-2179-4786-2704-08da8cd33a26
x-ms-traffictypediagnostic: MWHPR11MB1630:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A8u9nlMR4IuuY7+YlY/Biyiw7tyLRyhLVBP0drVM78C41vdbwv9bvWhp7yecrJhsYcIYMVv3U771h7P/pZBh7+vaQtkkcHS2OnZZVaqgdBJj8T8goOV+gzmcXz0r+NJtcJj4Des6I1dCJgb5pCJH04uv2tS0Mh/QF04uNLIF+79RIGyUqTy8TilS+pTjpYx4f9bRlkmU2cHvyi5pItL/vmn2k5olUF02zsE/q8qxrOOR+N2xk76abrUacm+1Q2K95r129VErU6yrnG7A2VWsobj+UBL5b2WcjJsGCO43QffUZ0EJ56T+zUPxF4ol20buwGVEqIWnloqMrFmjyHbrK0T1xlnHLsqDfDqqhjHK1wbXaQK00xOV8DZS4Y9gzP0HwjCiCjpdjXWcmXbIvJT7If4mz/xZkHjd+KCSgkOnDFdJ1RVhehxLkYiaDG4MF9EMOI25UmqcBY9AguEmZH7luFgzcaRoISkKbmKVDkQxb5XLhuu6mu2ix6rfzGMMRY9Wdx4l8GE0HSUIAPc6ODkUolk56Z/zO9BUcTBKo5B4GkaI8+nrIaeObzRbiwqoUXzzuvH+SNDY5gjfXP9Yg5E1zZZrLe36xgPNdtN/KVskCb751EprgnV0kX3ck8uAbQio7qEeLZ3gkA1MW27ZCTbMx6iY2pMaF0/Y5xCNUPy71HhiQ9KOC25IadPJTWXhaaOLQ3wOdJe4TEVU592Bsh8RDrcUS+LbxN+rK2Vr9QMVR84MYhFpfhQ3wUmfw+oYADW3HGexmlpmnf99AeYjrBkbgw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1101MB2157.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(366004)(396003)(346002)(136003)(39860400002)(376002)(53546011)(6506007)(7696005)(38070700005)(9686003)(26005)(71200400001)(478600001)(41300700001)(122000001)(186003)(82960400001)(83380400001)(55016003)(38100700002)(52536014)(66556008)(66476007)(66446008)(64756008)(8676002)(66946007)(450100002)(8936002)(76116006)(5660300002)(2906002)(33656002)(316002)(86362001)(110136005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bStoTGsxWHBMdk1yNnFuOGRlRXorQlVuazhpLzVWSUp5Z3pVbzl2VGR5d3BC?=
 =?utf-8?B?T2NsaC9NM2VRajFNcWpCczZvZy9JOEQxbnI3UzhRbWxxSThzQ1FNVW1ON2x2?=
 =?utf-8?B?VFVwcnZlUk11R3FiWnR3MnhHa3ZtdjdlejZzdDlZeWtSOFlNK3l4TGMxMlBQ?=
 =?utf-8?B?UkhWMjltblk3Q1dSUEtBb0ZyeTRwbmdTRDVTU3p2RFF3RmMzUFhJSldhSXI2?=
 =?utf-8?B?NWF2VHpRdi9QSUFlcFZpR0oxSkdGTjJyTXpWcEo3OWFTV2NRczVidFJydVJY?=
 =?utf-8?B?RVhzUkFBcnZCbS9ZMjRlZHBXczVrekRFT21pRXdRYmZ2ckhvQ043T25kVFdZ?=
 =?utf-8?B?emRnU1JYaFl1TE12V2Z0aEczTSs0cDVmeEZVTUcrTEFBT2lhVVllOUVGZVFR?=
 =?utf-8?B?ZjcySGROcHhzZHh6TWVZeldoZ2dvdmFNaGtONG41bWduVlZiaWtVdVNFT3V5?=
 =?utf-8?B?aWVvSjl4VnZvSmcrMkNsWG5RVCtrUUhHekNEaWpQa1pvTDMzdlcrNFJPaEFR?=
 =?utf-8?B?clJTUXorQVR3cWhNVVMxY1UxVDZQTFM2dXdTeWVQRU81RWlSbmJ5TUFxcTdY?=
 =?utf-8?B?T1ZETld0Z0hZM0haR2RPaHVINWJyRDcwZUg0V1BMSlp2aCtlaCsrVDNXeCtB?=
 =?utf-8?B?elJjQlBZdlVDSDEzdWtPOTZnZkswcmtHa3JzUnh3OTFVbjNGdWpaRk85RjVS?=
 =?utf-8?B?OEt2Q3ByNU1WaFNMVUkyRTAxV1FCeFQyVWo4N3hMbnJsYmJ3eFpJZ3JKQkRw?=
 =?utf-8?B?K3Baa1RNR2VQa0tTRnZEZ0cwL2xUdG1qYzVLbnRHSzEzSFc4VjJWUm5tUHhF?=
 =?utf-8?B?SW5Ka2owdjVqWlRSRmVPN3l5VnNhQ2JWSnVhSmkzYWNPdUhrMGdvZEZMVjRE?=
 =?utf-8?B?K2VHUlZBM3ZQNy9BQWN6elR2YmJFY3JWUEY2TjY4YmdldGcwKzlTenBIQUcw?=
 =?utf-8?B?dVA4YVQ3UGsvKzNOR01VdFZ6TVVnSTVnN1lUWmZ4emVnT3pPeHY2TXJDVVhj?=
 =?utf-8?B?anpyTzd5dHRPTHJkZDlyZXkyTnVCaE1EeFdXTjJrUnRVMWROcEpORzcrTUtv?=
 =?utf-8?B?ZzA3MXAxell0UWFRWFdPQUR6RDg2bS9BQVI3MmxHdWh4c2VNVUQvenZjMUY0?=
 =?utf-8?B?cEYrNzRhTVNINy91Z2o1dW4yQ3lGMklmOTdoYnlTakg5K1h0WGVIbHhUcEJ6?=
 =?utf-8?B?THJRd0hIZFZxb2ZleEpmbXd2SFRieEt3UjVHVGw1TjdpemhZM01qcjlHc0pP?=
 =?utf-8?B?aDArajhsY0pJL2YrdVBIZ080Z1Fjdktpa2ZndERUbkE5UVFtZXZvU3VyL3Ja?=
 =?utf-8?B?bVBncWd0TEJDVEFtVUZibC9RU3YweEszY3lTTVZhTCtuOWMrY1d4TXFUNHlM?=
 =?utf-8?B?WkQ3NE9oNm9BVFJtbG9hKzFqS3VQN0tPekgrMzZTNEVUcVlXTTdqTUdDeG8x?=
 =?utf-8?B?RW92YVdZbGNhTkU4RGU1WTNaTVhRdXNiYmNidEZIN3lqU0xHY3BQL1NoWnJ5?=
 =?utf-8?B?UkFMTWt5TDdCa01FaDdGcVZML0Q2eWJ0ZG01U2tOb3MxVGZWSTBUbUUxSkMz?=
 =?utf-8?B?M3dCcktEbjlSclJSdVZMTkJqYVgrSG1oby9Wcy9SdUhRTjl5UjBmZnRhMWVB?=
 =?utf-8?B?QjFXR0RPbmo2d2hxa0dwN01nNk1WQVR5NFh4eEhLOTJzL2N2TWwrSmJhbml2?=
 =?utf-8?B?aTI5cjhEbzZacWZ2blN2eVlReVY3dTRMUzJSSUFHU1I4RWp5T2JRVng4cUNl?=
 =?utf-8?B?NWZYVmZCN0Q1V0JDVk9wNmZYNFM3OGFvYkFreXFneGlpME1mWDVDc0pkRUZP?=
 =?utf-8?B?dEZuelRleDFudE9zaFcrejFFRlZNYW5DMjdDTjVlWHBmNm1wNlFaR3VIU0M1?=
 =?utf-8?B?Y0dXQmZQUUd2WXI3NHI2WmVtNnhRQjNqSjZrSFc3bDY3NUFHR0dvRTZXd09Q?=
 =?utf-8?B?RGU3RC9ETUhEZ0VnV2VJWWY0SysvTzFiMVhTQUxBSVo0WEZpNmhpdy9qTWxm?=
 =?utf-8?B?QTFLWTcwVjNua0I5d3YrSmhQSkRndVIxdlQzeFFnUHNWZkp1c3cvQkxsd3M5?=
 =?utf-8?B?YzBLTGFIWllSWlJBeTBRV0dBaFRQbGhoM2t3bHRtdzJ0a2FOSHVYZWhzb3lD?=
 =?utf-8?Q?gLzpQYAHqPHCfCk1Wh91gS6n9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1101MB2157.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7ee0b4-2179-4786-2704-08da8cd33a26
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2022 11:06:46.7288 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lqBMzFTTTYdGRB47nuNy/O8QFs9RN/T0vqMeBxa8YmrijtF0DtU9/YV9QonRC5P5Lf66NMxt5np18n10SgCHEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1630
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

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBJbnRlbC1nZnggPGludGVsLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEpvdW5pDQo+IEjD
tmdhbmRlcg0KPiBTZW50OiBUdWVzZGF5LCBBdWd1c3QgMjMsIDIwMjIgMjoyOSBQTQ0KPiBUbzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgaW50ZWwtZ2Z4QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiBTdWJqZWN0OiBbSW50ZWwtZ2Z4XSBbUEFUQ0ggdjIgNC80XSBkcm0vdGVzdHM6
IFNldCBhbHNvIG1vY2sgcGxhbmUgc3JjX3gsIHNyY195LA0KPiBzcmNfdyBhbmQgc3JjX2gNCj4g
DQo+IFdlIG5lZWQgdG8gc2V0IGFsc28gc3JjX3gsIHNyY195LCBzcmNfdyBhbmQgc3JjX2ggZm9y
IHRoZSBtb2NrIHBsYW5lLg0KPiBBZnRlciBmaXggZm9yIGRybV9hdG9taWNfaGVscGVyX2RhbWFn
ZV9pdGVyX2luaXQgd2UgYXJlIHVzaW5nIHRoZXNlIHdoZW4NCj4gaXRlcmF0aW5nIGRhbWFnZV9j
bGlwcy4NCj4gDQoNClJldmlld2VkLWJ5OiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwu
Y29tPg0KDQo+IFNpZ25lZC1vZmYtYnk6IEpvdW5pIEjDtmdhbmRlciA8am91bmkuaG9nYW5kZXJA
aW50ZWwuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fZGFtYWdlX2hl
bHBlcl90ZXN0LmMgfCA1ICsrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9kYW1hZ2VfaGVs
cGVyX3Rlc3QuYw0KPiBiL2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fZGFtYWdlX2hlbHBlcl90
ZXN0LmMNCj4gaW5kZXggYmYyNTBiZDA4ZDdlLi5jNjA4YWUwNmYwZTMgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90ZXN0cy9kcm1fZGFtYWdlX2hlbHBlcl90ZXN0LmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3Rlc3RzL2RybV9kYW1hZ2VfaGVscGVyX3Rlc3QuYw0KPiBAQCAtNTks
NiArNTksMTEgQEAgc3RhdGljIGludCBkcm1fZGFtYWdlX2hlbHBlcl9pbml0KHN0cnVjdCBrdW5p
dCAqdGVzdCkNCj4gc3RhdGljIHZvaWQgc2V0X3BsYW5lX3NyYyhzdHJ1Y3QgZHJtX3BsYW5lX3N0
YXRlICpzdGF0ZSwgaW50IHgxLCBpbnQgeTEsIGludCB4MiwNCj4gIAkJCSAgaW50IHkyKQ0KPiAg
ew0KPiArCXN0YXRlLT5zcmNfeCA9IHgxOw0KPiArCXN0YXRlLT5zcmNfeSA9IHkxOw0KPiArCXN0
YXRlLT5zcmNfdyA9IHgyIC0geDE7DQo+ICsJc3RhdGUtPnNyY19oID0geTIgLSB5MTsNCj4gKw0K
PiAgCXN0YXRlLT5zcmMueDEgPSB4MTsNCj4gIAlzdGF0ZS0+c3JjLnkxID0geTE7DQo+ICAJc3Rh
dGUtPnNyYy54MiA9IHgyOw0KPiAtLQ0KPiAyLjM0LjENCg0K
