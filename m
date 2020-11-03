Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261EB2A4BA3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 17:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3ACE6E8CA;
	Tue,  3 Nov 2020 16:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903F46E8CD
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 16:35:07 +0000 (UTC)
IronPort-SDR: RwesnOvM5oebrZusIBD2SX1buOpurf5851/LK+dNlKKE68ahyBkMbwmAHfLQSMdKJXZbsyL4ZH
 6CpoEdJi5Vhw==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="148363617"
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="148363617"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2020 08:34:58 -0800
IronPort-SDR: jPmIJ73a/hUAPRRZOY3nFmbB9NHCby+4vYWam2HVXHLyitC21Kwu0zHfEycXBCB/ZHuKq6zUHX
 SV02g1sy9YeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,448,1596524400"; d="scan'208";a="357737174"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
 by fmsmga002.fm.intel.com with ESMTP; 03 Nov 2020 08:34:57 -0800
Received: from fmsmsx609.amr.corp.intel.com (10.18.126.89) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Nov 2020 08:34:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx609.amr.corp.intel.com (10.18.126.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Tue, 3 Nov 2020 08:34:55 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Tue, 3 Nov 2020 08:34:55 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Tue, 3 Nov 2020 08:34:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWGlGhOVenLdiQd/JqcjS6MgdrjKTS16bKHoFrA7EYhu2TBdBahA/wQtSgnKsUa1A5zLI2dAehlhEPAjRrSukjutsBW+J58jr2kEPnhib/yO1+n3IiL3mFfhedjvXwgPV9dnvn50RiAuhstNcLO9OmVMDXoWABo7SAG2EErr+dVzoX1AAcAPj+pTM4MfvqluJJYLGqNG9/ReZGKwFm2nXhWZndbZKfKokYfGhqwjv40WyJw7Oc/MeVk56b54DdsvnSPomy7+YqeACtsmuvcrvQjlgglx4+V/2D5cVrgNqZysDTbbglg6ZH59T2m52hA8PYXsdyKk6gymwNeKaObVZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afWK5eoPDyMZMzwKr7oDR52c9smNUFs9ZZSetjZ25lg=;
 b=Y8Z/Tg7F9edXuZgAECyPJigVnWt8dIr67dPIOn37ajlvhF0k71U65MbfTiUwQVVxzHFM4QCEgxSBhaMaoXwe7Q0XCxbFcpm8MAMwy7K2zyeLrZDpdNcSXgv+EUUI3/2q3D6wB61JZ3msvIFArs1MBA1e0BqsITh+78zzX432GWQfqZUvYSnOeF5dK4HJSVuwRewaKS71FmlA9+dSj8HU5+X411E/oeO2Wd6y2AcbSuqlWHtB7QPUtddNOtY1XDgdEvaeV4riy0jdH2lRegIV75t/0aQ/mPu/IwCoejMyjZTVHFneTDtgCRddvjsWDu1JWMRjvu0EuU/ZKDk0vDFUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afWK5eoPDyMZMzwKr7oDR52c9smNUFs9ZZSetjZ25lg=;
 b=x/aA8ksohPIvpB7XvVmnO/f4iFBHw9KAVWOFlVLGljl2IqkCr5HY7LrE7mAJSx5ogR65OzUgwknO67umyLAfS1EFwm34pVxP/RH8L3wSgMbJLx6Ku7mf69kHZ6NUsBYRaHmEwn6diEntcYfUvfCeBjd6SafYEv/etrr1PJmmFdY=
Received: from MW3PR11MB4555.namprd11.prod.outlook.com (2603:10b6:303:2e::24)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Tue, 3 Nov
 2020 16:34:42 +0000
Received: from MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9]) by MW3PR11MB4555.namprd11.prod.outlook.com
 ([fe80::8d73:60dd:89aa:99a9%8]) with mapi id 15.20.3499.032; Tue, 3 Nov 2020
 16:34:42 +0000
From: "Xiong, Jianxin" <jianxin.xiong@intel.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] dma-buf: Fix static checker warning
Thread-Topic: [PATCH] dma-buf: Fix static checker warning
Thread-Index: AQHWsZLFFdeAFmUyy0yIPVoIS3nbiam2CruAgACQUsA=
Date: Tue, 3 Nov 2020 16:34:42 +0000
Message-ID: <MW3PR11MB4555974434FBA00BAD7C97DFE5110@MW3PR11MB4555.namprd11.prod.outlook.com>
References: <1604375518-145511-1-git-send-email-jianxin.xiong@intel.com>
 <e44d5574-904c-b8c3-51b1-8f967e6a92fe@amd.com>
In-Reply-To: <e44d5574-904c-b8c3-51b1-8f967e6a92fe@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.53.14.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ceeb321d-7ef0-44bd-3df2-08d880165e04
x-ms-traffictypediagnostic: MW3PR11MB4538:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MW3PR11MB4538EB9B4FC99ADA12D080C8E5110@MW3PR11MB4538.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:131;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: X77lfgXt5FNT6jKwonHP6ZLJl31OPLfgBFupQABrB5jK/dK2gDfGzJeA4esWNDGPBqLjMWkmECWK+JZyajZb9+SbEztiD+jwi5RYVD9/8LmwBqLmIjHHVYInHl7I9tqQpga87UWex817aIOKHjDm+xlROAxsXb8qVWFqiA6O1uzrOr23XAb7EotshBS0uo+Y1EYpJSo092U9o7M7QebP/cfAhNeXW7NcvLSU6UiSgLvFU5rSby5j83P1YvZfbIyG/REOu6s7xK1gfFnv5sDKQlwFMOfVGdWWcEqQ2JWsKKDrmDq6s3C6pyXrrfuoBVlntsTLJdQKyMxdsPi97uS2dg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4555.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(39860400002)(136003)(346002)(2906002)(6506007)(53546011)(52536014)(76116006)(66476007)(66556008)(83380400001)(64756008)(66446008)(66946007)(55016002)(54906003)(26005)(110136005)(8936002)(186003)(478600001)(316002)(8676002)(71200400001)(4326008)(86362001)(33656002)(7696005)(107886003)(9686003)(66574015)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: +8TdsPuPtgfamiWYqs+wYXbfxcv2AxtG6y4c6yF6ZIU3xguD+tOrdB5XtKjBxKI0D+hJzZs/hC1QYM47Vs20SizGvQqj0A/SKE/gZPNX4XBttCdy7S/qq2IgD9eEljCboV0PbCOFg1Ngc+FPbZsMW5/+38GNnFx1ntryrjWUoYAgwLiC3o4MuaHUIejS5AamAcDVyYIYigwNoyc5Mb13504jEL1DfvI4chVaLJxWwKxF2AF2WuSqMOhT7rzBZTUJ1YMIJ/YV8hM87+oPSUxKFKWbUhtEv3H9wbwZoToXd0PHj+nMYhudT6qsjlNe1qoRE0kADFIfEo35E1Hz1KmM0rG1KmLo+XkCfvEfPgErxss2Ujlu4E4o7e8b0bX4JCFYiFURzq+4YRemBJ7IV3jfYLFGvXQjWfCrhqOjRW9sKUr57buJQlV4kE3uaur28qOvXZj0BnWb+8ONlVqBNbSMEZsm2vBdov2qfQ0Rk1UwPI/evR1dUERFDXl2mcJMxxcnZhvFTeHLMsSV/nyMDHhK+QAzaDokCBH32zjxBbZvHg8+4NwmANIwLmJc9s/NZrxBSLC5sLcNauzxDnc7s4Wm3p6UnQgkPYB8gvkqSDhSq1/ItHWoDWPbOUYueFNVMvr3MFElSfgnOtnhVHqMYqOw+g==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4555.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ceeb321d-7ef0-44bd-3df2-08d880165e04
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Nov 2020 16:34:42.6354 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2x58cCXlzviCaa8mAk+gnp0Plp8vI27XHTUGZ9HT84KPa5iab4vd5lpG/RdIygGAWF3VzXCPaCiFYD2IGbBuUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
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
Cc: "Vetter, Daniel" <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBDaHJpc3RpYW4gS8O2bmlnIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgMDIsIDIw
MjAgMTE6NTcgUE0NCj4gVG86IFhpb25nLCBKaWFueGluIDxqaWFueGluLnhpb25nQGludGVsLmNv
bT47IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IFN1bWl0IFNlbXdhbCA8
c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+OyBWZXR0ZXIsIERhbmllbCA8ZGFuaWVsLnZldHRlckBp
bnRlbC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRtYS1idWY6IEZpeCBzdGF0aWMgY2hl
Y2tlciB3YXJuaW5nDQo+IA0KPiBBbSAwMy4xMS4yMCB1bSAwNDo1MSBzY2hyaWViIEppYW54aW4g
WGlvbmc6DQo+ID4gSGVyZSBpcyB0aGUgd2FybmluZyBtZXNzYWdlOg0KPiA+DQo+ID4gCWRyaXZl
cnMvZG1hLWJ1Zi9kbWEtYnVmLmM6OTE3IGRtYV9idWZfbWFwX2F0dGFjaG1lbnQoKQ0KPiA+IAll
cnJvcjogJ3NnX3RhYmxlJyBkZXJlZmVyZW5jaW5nIHBvc3NpYmxlIEVSUl9QVFIoKQ0KPiA+DQo+
ID4gRml4IGJ5IGFkZGluZyBlcnJvciBjaGVja2luZyBiZWZvcmUgZGVyZWZlcmVuY2luZyB0aGUg
cG9pbnRlci4NCj4gPg0KPiA+IEZpeGVzOiBhYzgwY2QxN2E2MTUgKCJkbWEtYnVmOiBDbGFyaWZ5
IHRoYXQgZG1hLWJ1ZiBzZyBsaXN0cyBhcmUgcGFnZQ0KPiA+IGFsaWduZWQiKQ0KPiA+IFJlcG9y
dGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+DQo+ID4gU2ln
bmVkLW9mZi1ieTogSmlhbnhpbiBYaW9uZyA8amlhbnhpbi54aW9uZ0BpbnRlbC5jb20+DQo+IA0K
PiBSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29t
Pg0KPiANCj4gRG8geW91IGhhdmUgY29tbWl0IGFjY2VzcyB0byBkcm0tbWlzYy1uZXh0IG9yIHNo
b3VsZCBJIHB1c2ggaXQ/DQoNCkkgZG9uJ3QgaGF2ZSBjb21taXQgYWNjZXNzLg0KDQo+IA0KPiA+
IC0tLQ0KPiA+ICAgZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyB8IDIgKy0NCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1
Zi5jDQo+ID4gaW5kZXggNTU2ZjYyZS4uMGViODBjMSAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJz
L2RtYS1idWYvZG1hLWJ1Zi5jDQo+ID4gKysrIGIvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYw0K
PiA+IEBAIC05MDgsNyArOTA4LDcgQEAgc3RydWN0IHNnX3RhYmxlICpkbWFfYnVmX21hcF9hdHRh
Y2htZW50KHN0cnVjdCBkbWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwNCj4gPiAgIAl9DQo+ID4N
Cj4gPiAgICNpZmRlZiBDT05GSUdfRE1BX0FQSV9ERUJVRw0KPiA+IC0Jew0KPiA+ICsJaWYgKCFJ
U19FUlIoc2dfdGFibGUpKSB7DQo+ID4gICAJCXN0cnVjdCBzY2F0dGVybGlzdCAqc2c7DQo+ID4g
ICAJCXU2NCBhZGRyOw0KPiA+ICAgCQlpbnQgbGVuOw0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
