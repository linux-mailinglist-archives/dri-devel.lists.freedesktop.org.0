Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C41D2BB165
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 18:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1281F6E8D8;
	Fri, 20 Nov 2020 17:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3A66E8D8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 17:29:01 +0000 (UTC)
IronPort-SDR: jJNy+4GcBnWHbhJmJD3xiEpYTyAHm8lREbWxea0yrXvqR/R9/9FkUnRFRKIwGU2sqcGfgHHYbb
 dK03tAHyQcPg==
X-IronPort-AV: E=McAfee;i="6000,8403,9811"; a="151356596"
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; d="scan'208";a="151356596"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2020 09:29:01 -0800
IronPort-SDR: EOs/kFVNb2WagzDuP+NV2admlbS5V6PwMlj92fZppkHAOksnnINT5pFWOc0R5JLaaCWDprIrtC
 pLfL8VisT7yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,357,1599548400"; d="scan'208";a="311493070"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2020 09:29:01 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 20 Nov 2020 09:29:00 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Fri, 20 Nov 2020 09:29:00 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Fri, 20 Nov 2020 09:29:00 -0800
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (104.47.44.51) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Fri, 20 Nov 2020 09:29:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f2FqU2e2CoNzcntjLut5M9VVjX+syCJOK02QsziRfc05LRhwlkFp82KI5eOVLJhbbz+mhr7eR/TT4qa3qV1S3olTGHM7ASA/VGzF0Yl47HWofDxspHYnT4punxv/0JqAdHzOwizaT9yz24su73kpjvRSECVioHA8L4mvEb/geg5ijxZX87xlsBfCXYJ3G4P6gX3C5ASs9hL8cxIpBGoQ+/nRYtj9tYxvPdYezhtkeTjF4kINobDLNZFociswo0YHn1R342I5iL4d/SEYO00arXN447l2o2Y9Hj+CHL9gLoMdIIPOE/hV1YdslsShfUeA8yQChXSCP05FF5zD6UclPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMAi5YvK39A79KeieOqS+hvXfVc90fZBFTq99yt0Npw=;
 b=ksvKu9OXT8kYhoALYo+N3D77NHQxD9Pqh1dwQwtE397haAPmyxe5l5lTfJYz86Lsr0h8zm0k3zjWYT5yudql+uWKtF3w5Blj/uDpntFMsS9uU4GM8UBDYDvPpJWnda354qFssgP5qSunnC6U/Rtbf1oaYfUNotoki85U5rlqRpE6SntW0y8j1qsZvZyt8sQ17YJOT7IYjaYlly70s7zW8RKMlx+8q2ZCpBCWr7tU0y+peJe0J2Y9dknTryKDphxC6j76XNGX7j1X6v5DvDk2lDshRQX+VXAaDRDKCc3pHTiMc5eGKCb8sXUMpz4V98VADnfrns5S4+Hn8zOfnkGfzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMAi5YvK39A79KeieOqS+hvXfVc90fZBFTq99yt0Npw=;
 b=ApnyxBhl5I7h8pJu3RaWVArUeRycrfuyumyMGiIk/aNI7BnMzczbOy7KR32w8E2vzLhw771pHNLFbEePFT7opPX83j41UtfTUAgzbk+u4V6uXAyZfavcA1Nwjmdgy/Q4X7prDOAcFMHBG4TXprzlC3Aoih3tPNpn7Vg3Fv+fSuI=
Received: from BY5PR11MB4182.namprd11.prod.outlook.com (2603:10b6:a03:183::10)
 by SJ0PR11MB4911.namprd11.prod.outlook.com (2603:10b6:a03:2ad::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20; Fri, 20 Nov
 2020 17:28:59 +0000
Received: from BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394]) by BY5PR11MB4182.namprd11.prod.outlook.com
 ([fe80::285a:2709:d92f:3394%5]) with mapi id 15.20.3589.025; Fri, 20 Nov 2020
 17:28:59 +0000
From: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Subject: RE: [PATCH] drm/kmb: Remove an unnecessary NULL check
Thread-Topic: [PATCH] drm/kmb: Remove an unnecessary NULL check
Thread-Index: AQHWvLJbMwK5pifWsE+YWksAFZ5UE6nQPLCggAB2SgCAAAN5AIAAk5IQ
Date: Fri, 20 Nov 2020 17:28:59 +0000
Message-ID: <BY5PR11MB4182170E428502EF005B27E48CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
References: <20201117072137.GB1111239@mwanda>
 <BY5PR11MB4182EBE4FD5F42AC625945998CFF0@BY5PR11MB4182.namprd11.prod.outlook.com>
 <20201120082146.GA314029@ravnborg.org>
 <460740bc-ffb8-91c1-47ec-94a38dd2308d@suse.de>
In-Reply-To: <460740bc-ffb8-91c1-47ec-94a38dd2308d@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=intel.com;
x-originating-ip: [73.151.242.136]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b04ed6e-b279-4334-c6b5-08d88d79c402
x-ms-traffictypediagnostic: SJ0PR11MB4911:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SJ0PR11MB4911168346EA0ADC3226C9D78CFF0@SJ0PR11MB4911.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 67Btwd4N8FEA2Ux0G3A9oRLVs2dpV9IhjqnhlD34QuxqN6f2NOBGsouPOwxVCxps8hXZLO2svkMpExrGfPJ7koJjF3aOKgzBoyTaBNd26dwdKVxZIMUhCKmkPLwADY80zBXgoMRmCWpv7wWKseYyPlz5Zgfm9+c4OSwAzcpsc/PFtzKEj2LDTe3QgIFJewi1O0JyGntMTqAKEzYK8Zid1wi/Tb6rbONxTGITsjgCgcvUoeDGg77WjkE3pi3d+PBgL31A09dtHw2UJIIPBN2TJOggqz6jcfbnSQzd+nONUrzc/SJO0W2Hv1ffILuO0B6Qsxwn4oRiGMPv5UVH1e4CXH1O7wl45GFAu9NCgOaUL/I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(186003)(6506007)(8676002)(53546011)(66446008)(66556008)(33656002)(7696005)(4326008)(26005)(9686003)(64756008)(86362001)(76116006)(55016002)(66476007)(66946007)(66574015)(54906003)(110136005)(478600001)(2906002)(966005)(71200400001)(8936002)(52536014)(83380400001)(316002)(5660300002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata: y/WN6JE+EQps0a9vf6gBr/MegFG8fwO5EMrXXfmlpBdSBUEn2dBrjXrYS4H61c2kLrQXD0LxmiavU5oXqfNwYi+iXy5fLWFn+i9pWlms2y5Ytbs+ueh6Webxsop8OH6Q0qdEEZUOvjK/owhNLnr5dxzoHNUqzR9/RV6hrPPUozDPe4SPvdPIGE4E+Z3DTrx2uGNYJu4lYAbV5eHCj8/5BImTygdYeEUP7Zq8lf82LfkZ7QkyI7pM86BkWoAv+aX9tlWk/RcdVty5aHQbiQUPV6oiYTXij4b+pczZRaR4w8vR8iTAMV3Dg3YtMPnJxtDUcGi4DNqhz7NKXh/ZvJug10DKkgIP2GLCHEBEhupneeHHsFmzwWsCqzwvNy/c3nK5yLIbooToQStGw5iB5GhcxQz3YqkR9TyXRAgkT23cnWIQl/SGCKms6S1Pk2mSiy8pK091dTYqiie3BwbWjKhVGpC7zvXfJ6R0eUSH8/Sg5k4gCXN8YPt2vAmwjURqEU/DX2V5joHtb6ryMIePjVnhctFtjRf9Bxgqtb1LiJttpNQipqIsHVzgoN8xb6dEJZCws7CB6XmFwBIxw4KNBKojitsuUgLKAlKbvPb+oQWO4eOKNTM60ZEezjKj7V3RSeinXelu41SdIK8IHbEaFTi3sw==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b04ed6e-b279-4334-c6b5-08d88d79c402
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2020 17:28:59.1510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eOMEBnJr4JtrPadWnvl4hWuKehjXy/TdU7k2WUZA3Jpu/K5IM/fVjuiOWqSqTbBkAM+APm/qocyEyi7E8V0TatT12X/yNtnZ3BBI5/mSc7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4911
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
Cc: David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>, Dan
 Carpenter <dan.carpenter@oracle.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVGhvbWFzIFppbW1lcm1h
bm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMjAsIDIw
MjAgMTI6MzQgQU0NCj4gVG86IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz47IENocmlz
YW50aHVzLCBBbml0aGENCj4gPGFuaXRoYS5jaHJpc2FudGh1c0BpbnRlbC5jb20+DQo+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+OyBEZWEsIEVkbXVuZCBKIDxlZG11bmQuai5k
ZWFAaW50ZWwuY29tPjsNCj4ga2VybmVsLWphbml0b3JzQHZnZXIua2VybmVsLm9yZzsgZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgRGFuDQo+IENhcnBlbnRlciA8ZGFuLmNhcnBlbnRl
ckBvcmFjbGUuY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBkcm0va21iOiBSZW1vdmUgYW4g
dW5uZWNlc3NhcnkgTlVMTCBjaGVjaw0KPiANCj4gSGkNCj4gDQo+IEFtIDIwLjExLjIwIHVtIDA5
OjIxIHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0KPiA+IEhpIEFuaXRoYS4NCj4gPg0KPiA+IE9uIEZy
aSwgTm92IDIwLCAyMDIwIGF0IDAxOjE5OjA2QU0gKzAwMDAsIENocmlzYW50aHVzLCBBbml0aGEg
d3JvdGU6DQo+ID4+IExvb2tzIGdvb2QgdG8gbWUuDQo+ID4NCj4gPiBDYW4gd2UgZ2V0IGVpdGhl
ciBhbiAiQWNrZWQtYnk6IiBvciAiUmV2aWV3ZWQtYnk6Ij8NCj4gPiBUaGVuIHdlIGNhbiB1c2Ug
dGhpcyB3aGlsZSBhcHBseWluZy4NClNvcnJ5LCBmb3Jnb3QgdGhhdC4NClJldmlld2VkLWJ5OiBB
bml0aGEgQ2hyaXNhbnRodXMgPGFuaXRoYS5jaHJpc2FudGh1c0BpbnRlbC5jb20+DQo+ID4NCj4g
PiBBbnkgbmV3cyBvbiBnZXR0dGluZyBjb21taXQgYWNjZXNzIHlvdXJzZWxmPw0KPiA+IElmIG5v
dCwgdGhlbiB0cnkgdG8gcGluZyBvbiB0aGUgb3BlbiB0aWNrZXQuDQo+IA0KPiBJdCdzIGJlZW4g
YWNrZWQgYSB3aGlsZSBhZ28uIEkgc2VudCBvdXQgYSByZW1pbmRlciB0byBEYW5pZWwgU3RvbmUu
DQpJIGRpZCBnZXQgYWNjZXNzIHRvZGF5LCB0aGFuayB5b3UhIEkgd2lsbCBoYXZlIHRvIGdldCBm
YW1pbGlhciB3aXRoIGRpbSBhbmQgdGhlIHdob2xlIHByb2Nlc3MgYmVmb3JlIEkgc3RhcnQgcHVz
aGluZyBwYXRjaGVzLg0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFRob21hcw0KPiANCj4gPg0KPiA+
DQo+ID4gCVNhbQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fDQo+ID4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+IGRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcNCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA0KPiA+DQo+IA0KPiAtLQ0KPiBUaG9tYXMgWmltbWVybWFubg0K
PiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KPiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4g
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPiBHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1l
bmTDtnJmZmVyDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
