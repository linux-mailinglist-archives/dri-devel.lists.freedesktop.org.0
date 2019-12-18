Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA25B124706
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 13:39:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48356E02A;
	Wed, 18 Dec 2019 12:39:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 177406E2A5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 10:02:41 +0000 (UTC)
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com -exists:%{i}.spf.microchip.iphmx.com
 include:servers.mcsv.net include:mktomail.com
 include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
Authentication-Results: esa2.microchip.iphmx.com;
 spf=Pass smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
IronPort-SDR: +x+X1YH1T2jLIbQLZgJTQhJjtcAlK4iQKEioBXgiRstcaZtOEAhhSf1sDZ5HVZPgn5sNG+zAGk
 KsDxhPaKpAmSsvKKRzSBxfLWCnagUsb/w3wxDXogqF206dvwcG3lfopRRL1i9sFwYf7tz2D74f
 aZG7DaQEt1xN01qs/AJL8MTgJhmFkQm6z6tpoPo7VG14RFyXdr7I7wglq+TXWJanACXbAZ5auc
 WI7slum3NSxmXtviva8ESQrdVp+1AeNz318FsrseXGvuJuSi+qV4fpFaOEik19QfK+MLcqX7LL
 FWY=
X-IronPort-AV: E=Sophos;i="5.69,329,1571727600"; d="scan'208";a="60190911"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 18 Dec 2019 03:02:38 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 18 Dec 2019 03:02:41 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 18 Dec 2019 03:02:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jcCZ/fUiQGkUlcsp+WByBTepJCZTHU5cEHAYwqLZAYLt9bvdQBrLtxm+YDtSKgTO+3yhdk5GvQqhmhB/49Jbqi0QY1yiWcWS8EqCl5643cnFYd0izIagHaZVgB8+NwBAlJYPpszbtVZf3bpjfTV+ezA1GBdqvpwosWrFlxxQDvKrussFAVVCQJ3kg1k5AfWYNy4to6UXZzknuCwtJ69oM9TZ7GTwvzjsNwk2JAVU219HhEww7qmOAUSvz8wjqd2nnKZkd9w+b5Zbo/lK/NjXdLQTNcOae88EWDj/7vughHtTaWJMJnYdKuhbXeEFDP+GEdBGHYcR0GLhDjFS7S2/XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itDf9KNGAaXDShX+UuhQUDGDD34alsWcKCFd1ExdirA=;
 b=MU9YmruZgpvO4aDQy8IcYCUkApK2dmLVpXVYrvfVuO5wmPb8LcSrBG1c2fRdFmwM1KN/2KNmkhEjXFV2Kk4uGYZ2yKZP3mcx4gjuXLBIWsOBQC5fnT/UA7JlLW2r46p9Dwo42hJSeFAmwJOTsLCgkepq6HkrPsA3n5XADVSyHQ4tJ/SCM00AfeAUYMSyIJdTMSf6ph05cDfYzbgfxolYJpshcMbRVrdAkJoiPC0jpVscWPnGVBp3rR8yZoalTwWf/h/DgFacdhjukGGaO2K6V291cCpQFa15EFhGwTOKx4MUnh/iYbVjtB7LM8pdiBbIzShzXi3H8ej/j9f03OgtvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itDf9KNGAaXDShX+UuhQUDGDD34alsWcKCFd1ExdirA=;
 b=MhJZ6WHNfArMZKFBmtxFowgh/IuXg2NB8LtlofY+dNXySnOcaqtGseoabPeX5OhC3w0b/4Bp4zHwyJJRHMfnKyDgavlfSB2O4rCcM3yzP8wcj9jG5e67X5dKGSnUPNLsEXtopMfDNA5FU7c+jzoCwajiYPNNQWdKZFSBJzEGNrE=
Received: from DM6PR11MB3225.namprd11.prod.outlook.com (20.176.120.224) by
 DM6PR11MB3643.namprd11.prod.outlook.com (20.178.231.210) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Wed, 18 Dec 2019 10:02:36 +0000
Received: from DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::106f:424f:ac54:1dbb]) by DM6PR11MB3225.namprd11.prod.outlook.com
 ([fe80::106f:424f:ac54:1dbb%7]) with mapi id 15.20.2559.012; Wed, 18 Dec 2019
 10:02:36 +0000
From: <Claudiu.Beznea@microchip.com>
To: <lee.jones@linaro.org>
Subject: Re: [PATCH v2 4/6] mfd: atmel-hlcdc: return in case of error
Thread-Topic: [PATCH v2 4/6] mfd: atmel-hlcdc: return in case of error
Thread-Index: AQHVtYpGJFu20kSyE0Kv6o26dzwrgA==
Date: Wed, 18 Dec 2019 10:02:36 +0000
Message-ID: <9340342a-a908-d4f6-3293-8571a8d3e242@microchip.com>
References: <1576249496-4849-1-git-send-email-claudiu.beznea@microchip.com>
 <1576249496-4849-5-git-send-email-claudiu.beznea@microchip.com>
 <20191216162406.GQ2369@dell>
In-Reply-To: <20191216162406.GQ2369@dell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [94.177.32.156]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bcc8afec-5431-4ec2-c5f3-08d783a168af
x-ms-traffictypediagnostic: DM6PR11MB3643:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB364366E8BBDB450FF07B029E87530@DM6PR11MB3643.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0255DF69B9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(366004)(346002)(136003)(396003)(39860400002)(189003)(199004)(71200400001)(8936002)(66446008)(6486002)(81156014)(26005)(31686004)(4326008)(53546011)(54906003)(8676002)(186003)(6916009)(81166006)(6512007)(76116006)(5660300002)(64756008)(66556008)(36756003)(66476007)(91956017)(2906002)(66946007)(478600001)(31696002)(6506007)(86362001)(966005)(316002)(2616005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR11MB3643;
 H:DM6PR11MB3225.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tK3yfYvMGxt6KyvgwSSh5UlwEGbSNjGtWBZnSvjfRanjJ36toqfToaXoRFj2USJ+IWC1b0V/qw5FS6ot4RWP8OvF1ED5mV4NSqYG0w6ixl6muEXuxlSx8L7QY6FwapQIJkg7CCl6m+gSD7qHoAXSRpkXBr08dPGSWIa8Vi/TrHzGwrHQOY3FMH5rB42hp2lw0tTi6R8xtVEDHeZeFjEoK/hgDO5dOkoilpl6DMuba8UCyG0vgM/ukR7hj7hnQX0XydqJFNsCMJ4V0M8dkUXzLin4MnZggSQ4rt3DnG/2BjskYjlf+f5hVP0SQxjIUFyeVKlNkmDIxaTPKEi2f/Mi6PuRPArCAVx6vl/NLwblY3Sdn4gPX3OCXlNyipYcahdkHuUVFTY+wXZ6PrWnWu0YV/st4f9lUAC7Y2hodSkm0hjv8pMz7uDB7ZWDLhfPbumY5K3QlEM//qNHhQzGmBkZ20wu/4SJrvN0K0dugtLHcJs=
Content-ID: <88D8021AC03C524D8841C633646318F6@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc8afec-5431-4ec2-c5f3-08d783a168af
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2019 10:02:36.5008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8KqUCmCdt7tN/viKRHuA/StOZX3p+xo9xJ6Y61jbQxSsjYiRCyOQ+WS38Zvw5/peT/1YyXPN5loK15cP3dFn6eKC1NfPFkOlEi2OCS4Lo+w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3643
X-Mailman-Approved-At: Wed, 18 Dec 2019 12:38:50 +0000
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ludovic.Desroches@microchip.com, sam@ravnborg.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDE2LjEyLjIwMTkgMTg6MjQsIExlZSBKb25lcyB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBGcmksIDEzIERlYyAyMDE5LCBDbGF1ZGl1
IEJlem5lYSB3cm90ZToNCj4gDQo+PiBGb3IgSExDREMgdGltaW5nIGVuZ2luZSBjb25maWd1cmF0
aW9ucyBiaXQgQVRNRUxfSExDRENfU0lQIG9mDQo+PiBBVE1FTF9ITENEQ19TUiBuZWVkcyB0byBi
ZSBwb2xsZWQgYmVmb3JlIGFwcGx5aW5nIG5ldyBjb25maWcuIEluIGNhc2Ugb2YNCj4+IHRpbWVv
dXQgdGhlcmUgaXMgbm8gaW5kaWNhdG9yIGFib3V0IHRoaXMsIHNvLCByZXR1cm4gaW4gY2FzZSBv
ZiB0aW1lb3V0DQo+PiBhbmQgYWxzbyBwcmludCBhIG1lc3NhZ2UgYWJvdXQgdGhpcy4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlw
LmNvbT4NCj4+IC0tLQ0KPj4gIGRyaXZlcnMvbWZkL2F0bWVsLWhsY2RjLmMgfCAxNSArKysrKysr
KysrKy0tLS0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZmQvYXRtZWwtaGxjZGMuYyBiL2Ry
aXZlcnMvbWZkL2F0bWVsLWhsY2RjLmMNCj4+IGluZGV4IDkyYmZjYWE2MmFjZS4uYTFlNDZjODdi
OTU2IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9tZmQvYXRtZWwtaGxjZGMuYw0KPj4gKysrIGIv
ZHJpdmVycy9tZmQvYXRtZWwtaGxjZGMuYw0KPj4gQEAgLTQwLDEwICs0MCwxNyBAQCBzdGF0aWMg
aW50IHJlZ21hcF9hdG1lbF9obGNkY19yZWdfd3JpdGUodm9pZCAqY29udGV4dCwgdW5zaWduZWQg
aW50IHJlZywNCj4+DQo+PiAgICAgICBpZiAocmVnIDw9IEFUTUVMX0hMQ0RDX0RJUykgew0KPj4g
ICAgICAgICAgICAgICB1MzIgc3RhdHVzOw0KPj4gLQ0KPj4gLSAgICAgICAgICAgICByZWFkbF9w
b2xsX3RpbWVvdXRfYXRvbWljKGhyZWdtYXAtPnJlZ3MgKyBBVE1FTF9ITENEQ19TUiwNCj4+IC0g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMsICEoc3RhdHVzICYg
QVRNRUxfSExDRENfU0lQKSwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAxLCAxMDApOw0KPj4gKyAgICAgICAgICAgICBpbnQgcmV0Ow0KPj4gKw0KPj4gKyAgICAg
ICAgICAgICByZXQgPSByZWFkbF9wb2xsX3RpbWVvdXRfYXRvbWljKGhyZWdtYXAtPnJlZ3MgKyBB
VE1FTF9ITENEQ19TUiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdGF0dXMsDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIShzdGF0dXMgJiBBVE1FTF9ITENEQ19TSVApLA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDEsIDEwMCk7DQo+PiArICAgICAgICAgICAg
IGlmIChyZXQpIHsNCj4+ICsgICAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGhyZWdtYXAtPmRl
diwNCj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICJUaW1lb3V0IHdhaXRpbmcgZm9y
IEFUTUVMX0hMQ0RDX1NJUFxuIik7DQo+IA0KPiBOaXQ6IEp1c3QgaW4gY2FzZSB5b3UgaGF2ZSB0
byByZXdvcmsgdGhpcywgcGxhY2luZyByZWdpc3RlciBuYW1lcyBpbg0KPiB0aGUga2VybmVsIGxv
ZyBpc24ndCB1c3VhbGx5IGhlbHBmdWwuICBDYW4geW91IHN3YXAgaXQgb3V0IGZvciBhIG1vcmUN
Cj4gdXNlciBmcmllbmRseSBtZXNzYWdlPw0KDQpTdXJlISBJJ2xsIGRvIGEgdjMgZm9yIGl0Lg0K
DQpUaGFuayB5b3UsDQpDbGF1ZGl1IEJlem5lYQ0KDQo+IA0KPiAiVGltZWQgb3V0IHdhaXRpbmcg
Zm9yIC4uLiINCj4gDQo+IC4uLiBYIHN0YXR1cw0KPiAuLi4gWSB0byB1cGRhdGUNCj4gLi4uIHNl
dHRpbmcgWiBjb25maWd1cmF0aW9uDQo+IA0KPiBFdGMuDQo+IA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiByZXQ7DQo+PiArICAgICAgICAgICAgIH0NCj4+ICAgICAgIH0NCj4+DQo+
PiAgICAgICB3cml0ZWwodmFsLCBocmVnbWFwLT5yZWdzICsgcmVnKTsNCj4gDQo+IC0tDQo+IExl
ZSBKb25lcyBb5p2O55C85pavXQ0KPiBMaW5hcm8gU2VydmljZXMgVGVjaG5pY2FsIExlYWQNCj4g
TGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUgZm9yIEFSTSBTb0NzDQo+IEZvbGxv
dyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cNCj4gDQo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGxpbnV4LWFybS1rZXJuZWwgbWFp
bGluZyBsaXN0DQo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFybS1rZXJuZWwN
Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
