Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798B1873A9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFC556ED23;
	Fri,  9 Aug 2019 08:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217EE6E512
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:01:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9VPKnjcyDASvbmGwu6mf1dVA32Kf3G6F1WXq1cGLKPv1+ioxrTv/U4CKYrixTRqT9Mi4jI6AwpXvkNZZIiusqbRud3GYcyGaH0FigreemXP0gJfSmz6gobB7ZTRKIMcojwNoVam2jmVPXRog0ogIPqTdXojW4ChaW8sz2XTib1bZsxml8wYqm42BXw8oDWWAjRufdjLdIR4u8gYrXPebF2+o0MShQvZ3ysIy0an6VUGiOXva7Nm1ytOJfMhJu083nhvH6vY9Hanwwlia97equfcSM9rY4UrtLwyrK1wQn3UFDXi+VXdMnmcrW6e8R7IDrp86Xqep2hUDpPaOwzqLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPemLk6G4WA4+sRMOsJnGNz4AxD1T8nt6mFvOmS3lsE=;
 b=lDS+Rrllfa8P/gSzJiKTnroUBhUkLpYMe+gWj15xLzTRZSYyjkQbr6hYKm4XRaN5yqxjQDYSQBpQfGjbHMk+37H6xRekz3y58Dh5k87wgqVUTd3fuhghpLBvRoJjEGwC4VGKL+3vyWEoLNIhr1AQmEIkLhgu7qLh+VMK6SXN5BXRi81Ewm/sjWeiBt/NFQ9qZmM6xf5WoFNDtpOZBfgez3a98fEgh3Xh9EyKnM22EHG3iYbI2SdFH51ZFVGnA+5SPCdYvQNpMuo/nx0XYatuAyMQR/VI+W+JozgxtPdtVpU9j9xqHOQ42TqYjkVjWjP2YGBLHzaR4JqWE208pjontQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1SPR01MB0363.eurprd04.prod.outlook.com (20.178.120.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.13; Thu, 8 Aug 2019 15:00:57 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::e53d:e6a9:79bd:f970]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::e53d:e6a9:79bd:f970%2]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 15:00:57 +0000
From: Leonard Crestez <leonard.crestez@nxp.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, =?utf-8?B?QXJ0dXIgxZp3aWdvxYQ=?=
 <a.swigon@partner.samsung.com>, "georgi.djakov@linaro.org"
 <georgi.djakov@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [RFC PATCH 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
Thread-Topic: [RFC PATCH 09/11] devfreq: exynos-bus: Add interconnect
 functionality to exynos-bus
Thread-Index: AQHVQVEYOnL6Nj5GnEmKqTrzyDUrnA==
Date: Thu, 8 Aug 2019 15:00:57 +0000
Message-ID: <VI1PR04MB7023B5095F706635354C4C50EED70@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122028eucas1p2eb75f35b810e71d6c590370aaff0997b@eucas1p2.samsung.com>
 <20190723122016.30279-10-a.swigon@partner.samsung.com>
 <5a82bf8a-d925-ba54-a26f-98b64bedc6e1@samsung.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a2093a85-bc01-442c-02f4-08d71c1137e5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:VI1SPR01MB0363; 
x-ms-traffictypediagnostic: VI1SPR01MB0363:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1SPR01MB03631456A4B450C8B5D2A5FCEED70@VI1SPR01MB0363.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(51444003)(189003)(199004)(66446008)(26005)(52536014)(54906003)(110136005)(86362001)(66066001)(256004)(5660300002)(2906002)(99286004)(6436002)(102836004)(8676002)(966005)(316002)(229853002)(7696005)(14444005)(478600001)(66574012)(6246003)(6306002)(76176011)(91956017)(66946007)(4326008)(66476007)(64756008)(25786009)(53546011)(6506007)(76116006)(66556008)(44832011)(186003)(7416002)(3846002)(53936002)(81156014)(33656002)(305945005)(81166006)(74316002)(446003)(55016002)(6116002)(71190400001)(9686003)(476003)(14454004)(486006)(2501003)(7736002)(8936002)(71200400001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:VI1SPR01MB0363;
 H:VI1PR04MB7023.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 6/TfyK8og+c2m1FBabhfrI2fT7BQ6O/bqAQOtHxYW8oaGg3JG+ZApa+fsh8tCvhkSdZfo38oZ+IRMlz6ddAolif7FcAF+CoDj72G/CVYznYHNg1bo/mKCctmFur3J9qQilMelImwXJf7IlBrkAzhOBttFa8yPSkmU8dCyizRZwFFSC7bm6aBUu5ubdoN3X8e8s4+1wbKkLmIgmOmOiKyj/9zrvuDKfh5h+3hL3blUyoQhT4RtEyFOZvPAoX9vqr9oomnrfx40YveICtW5ylXZouqBGl13MjnSTSCp7Lok0sd/troC8tRJux+9vYImLtjr74JdZQpfyOJZsZ7ERGg3YE82UCkWM786nd8DjhCJjfxK8IrSgZWP6f7GI66/acfiQ6WfgnJT4I5mKVStZmJQdrenqEdfhHed0EBfrujkAk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2093a85-bc01-442c-02f4-08d71c1137e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 15:00:57.3501 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D+XB0I5M52xAcps6CHYMOCWvOGlpT+qZ3+44CcYG4wn4+syJiBsUN1vJlYGlaIpbEdAimBibXq3sb0iTHOKCLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1SPR01MB0363
X-Mailman-Approved-At: Fri, 09 Aug 2019 08:00:16 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yPemLk6G4WA4+sRMOsJnGNz4AxD1T8nt6mFvOmS3lsE=;
 b=MRB9boU985k+wXEjQvqEmoWZqJ6O67NMOKnT47bPZihttMmvsthTkf/p/mWeJ+uwcFJwnQN90fLD4WLIhYDypY8lmIEoveoVxpn+G4McYcNrPKietnhQSdNOcJo7ZaaUP7kK+CLhRXqCLz7kwUmxUmX5mnm3GckQ/gznooqoLIQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Lukasz Luba <l.luba@partner.samsung.com>,
 "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjkuMDcuMjAxOSAwNDo0OSwgQ2hhbndvbyBDaG9pIHdyb3RlOgo+IE9uIDE5LiA3LiAyMy4g
7Jik7ZuEIDk6MjAsIEFydHVyIMWad2lnb8WEIHdyb3RlOgo+PiBUaGlzIHBhdGNoIGFkZHMgaW50
ZXJjb25uZWN0IGZ1bmN0aW9uYWxpdHkgdG8gdGhlIGV4eW5vcy1idXMgZGV2ZnJlcQo+PiBkcml2
ZXIuCj4+Cj4+IFRoZSBkZXZmcmVxIHRhcmdldCgpIGNhbGxiYWNrIHByb3ZpZGVkIGJ5IGV4eW5v
cy1idXMgbm93IHNlbGVjdHMgZWl0aGVyIHRoZQo+PiBmcmVxdWVuY3kgY2FsY3VsYXRlZCBieSB0
aGUgZGV2ZnJlcSBnb3Zlcm5vciBvciB0aGUgZnJlcXVlbmN5IHJlcXVlc3RlZCB2aWEKPj4gdGhl
IGludGVyY29ubmVjdCBBUEkgZm9yIHRoZSBnaXZlbiBub2RlLCB3aGljaGV2ZXIgaXMgaGlnaGVy
Lgo+IAo+IEJhc2ljYWxseSwgSSBhZ3JlZSB0byBzdXBwb3J0IHRoZSBRb1MgcmVxdWlyZW1lbnQg
YmV0d2VlbiBkZXZpY2VzLgo+IEJ1dCwgSSB0aGluayB0aGF0IG5lZWQgdG8gY29uc2lkZXIgdGhl
IG11bHRpcGxlIGNhc2VzLgo+IAo+IDEuIFdoZW4gY2hhbmdpbmcgdGhlIGRldmZyZXEgZ292ZXJu
b3IgYnkgdXNlciwKPiBGb3IgZXhhbXBsZSBvZiB0aGUgY29ubmVjdGlvbiBiZXR3ZWVuIGJ1c19k
bWMvbGVmdGJ1cy9kaXNwbGF5IG9uIHBhdGNoOCwKPiB0aGVyZSBhcmUgcG9zc2libGUgbXVsdGlw
bGUgY2FzZXMgd2l0aCB2YXJpb3VzIGRldmZyZXEgZ292ZXJub3IKPiB3aGljaCBpcyBjaGFuZ2Vk
IG9uIHRoZSBydW50aW1lIGJ5IHVzZXIgdGhyb3VnaCBzeXNmcyBpbnRlcmZhY2UuCj4gCj4gSWYg
dXNlcnMgY2hhbmdlcyB0aGUgZGV2ZnJlcSBnb3Zlcm5vciBhcyBmb2xsb3dpbmc6Cj4gQmVmb3Jl
LAo+IC0gYnVzX2RtYyAoc2ltcGxlX29uZGVtYW5kLCBhdmFpbGFibGUgZnJlcXVlbmN5IDEwMC8y
MDAvMzAwLzQwMCBNSHopCj4gLS0+IGJ1c19sZWZ0YnVzKHNpbXBsZV9vbmRlbWFuZCwgYXZhaWxh
YmxlIGZyZXF1ZW5jeSAxMDAvMjAwLzMwMC80MDAgTUh6KQo+IC0tLS0+IGJ1c19kaXNwbGF5KHBh
c3NpdmUpCj4gCj4gQWZ0ZXIgY2hhbmdlZCBnb3Zlcm5vciBvZiBidXNfZG1jLAo+IGlmIHRoZSBt
aW5fZnJlcSBieSBpbnRlcmNvbm5lY3QgcmVxdWlyZW1lbnQgaXMgNDAwTWh6LAo+IC0gYnVzX2Rt
YyAocG93ZXJzYXZlKSA6IG1pbl9mcmVxIGFuZCBtYXhfZnJlcSBhbmQgY3VyX2ZyZXEgaXMgMTAw
TUh6Cj4gLS0+IGJ1c19sZWZ0YnVzKHNpbXBsZV9vbmRlbWFuZCkgOiBjdXJfZnJlcSBpcyA0MDBN
aHoKPiAtLS0tPiBidXNfZGlzcGxheShwYXNzaXZlKQo+IAo+IFRoZSBmaW5hbCBmcmVxdWVuY3kg
aXMgNDAwTUh6IG9mIGJ1c19kbWMKPiBldmVuIGlmIHRoZSBtaW5fZnJlcS9tYXhfZnJlcS9jdXJf
ZnJlcSBpcyAxMDBNSHouCj4gSXQgY2Fubm90IHNob3cgdGhlIGNvcnJlY3QgbWluX2ZyZXEvbWF4
X2ZyZXEgdGhyb3VnaAo+IGRldmZyZXEgc3lzZnMgaW50ZXJmYWNlLgo+IAo+IAo+IDIuIFdoZW4g
ZGlzYWJsaW5nIHRoZSBzb21lIGZyZXF1ZW5jeSBieSBkZXZmcmVxLXRoZXJtYWwgdGhyb3R0bGlu
ZywKPiBUaGlzIHBhdGNoIGNoZWNrcyB0aGUgbWluX2ZyZXEgb2YgaW50ZXJjb25uZWN0IHJlcXVp
cmVtZW50Cj4gaW4gdGhlIGV4eW5vc19idXNfdGFyZ2V0KCkgYW5kIGV4eW5vc19idXNfcGFzc2l2
ZV90YXJnZXQoKS4KPiBBbHNvLCBpdCBjYW5ub3Qgc2hvdyB0aGUgY29ycmVjdCBtaW5fZnJlcS9t
YXhfZnJlcSB0aHJvdWdoCj4gZGV2ZnJlcSBzeXNmcyBpbnRlcmZhY2UuCj4gCj4gRm9yIGV4YW1w
bGUgb2YgYnVzX2RtYyBidXMsCj4gLSBUaGUgYXZhaWxhYmxlIGZyZXF1ZW5jaWVzIGFyZSAxMDBN
SHosIDIwME1IeiwgMzAwTUh6LCA0MDBNSHoKPiAtIERpc2FibGUgNDAwTUh6IGJ5IGRldmZyZXEt
dGhlcm1hbCB0aHJvdHRsaW5nCj4gLSBtaW5fZnJlcSBpcyAxMDBNSHoKPiAtIG1heF9mcmVxIGlz
IDMwME1Iego+IC0gbWluX2ZyZXEgb2YgaW50ZXJjb25uZWN0IGlzIDQwME1Iego+IAo+IEluIHJl
c3VsdCwgdGhlIGZpbmFsIGZyZXF1ZW5jeSBpcyA0MDBNSHogYnkgZXh5bm9zX2J1c190YXJnZXQo
KQo+IFRoZXJlIGFyZSBubyBwcm9ibGVtIGZvciB3b3JraW5nLiBCdXQsIHRoZSB1c2VyIGNhbm5v
dCBrbm93Cj4gcmVhc29uIHdoeSBjdXJfZnJlcSBpcyA0MDBNSHogZXZlbiBpZiBtYXhfZnJlcSBp
cyAzMDBNSHouCj4gCj4gQmFzaWNhbGx5LCB1cGRhdGVfZGV2ZnJlcSgpIGNvbnNpZGVycyB0aGUg
YWxsIGNvbnN0cmFpbnRzCj4gb2YgbWluX2ZyZXEvbWF4X2ZyZXEgdG8gZGVjaWRlIHRoZSBwcm9w
ZXIgdGFyZ2V0IGZyZXF1ZW5jeS4KCkkgdGhpbmsgdGhhdCBhcHBseWluZyB0aGUgaW50ZXJjb25u
ZWN0IG1pbl9mcmVxIHZpYSBkZXZfcG1fcW9zIGNhbiBoZWxwIAp3aXRoIG1hbnkgb2YgdGhlc2Ug
Y29uY2VybnM6IHVwZGF0ZV9kZXZmcmVxIGNvbnRyb2xzIGFsbCB0aGUgbWluL21heCAKaGFuZGxp
bmcsIHN5c2ZzIGlzIGFjY3VyYXRlIGFuZCBiZXR0ZXIgZGVjaXNpb25zIGNhbiBiZSBtYWRlIHJl
Z2FyZGluZyAKdGhlcm1hbC4gRW5mb3JjaW5nIGNvbnN0cmFpbnRzIGluIHRoZSBjb3JlIGlzIGRl
ZmluaXRlbHkgYmV0dGVyLgoKVGhpcyB3b3VsZG4ndCBldmVuIGJlIGEgdmVyeSBiaWcgY2hhbmdl
LCB5b3UgZG9uJ3QgbmVlZCB0byBhY3R1YWxseSBtb3ZlIAp0aGUgaW50ZXJjb25uZWN0IGNvZGUg
b3V0c2lkZSBvZiBkZXZmcmVxLiBKdXN0IG1ha2UgZXZlcnkgZGV2ZnJlcS9pY2MgCm5vZGUgcmVn
aXN0ZXIgYSBkZXZfcG1fcW9zX3JlcXVlc3QgZm9yIGl0c2VsZiBkdXJpbmcgcmVnaXN0cmF0aW9u
IGFuZCAKY2FsbCBkZXZfcG1fcW9zX3VwZGF0ZV9yZXF1ZXN0IGluc2lkZSBleHlub3NfYnVzX2lj
Y19zZXQuCgpTZWU6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcGF0Y2gvMTEwODQyNzkv
CgotLQpSZWdhcmRzLApMZW9uYXJkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
