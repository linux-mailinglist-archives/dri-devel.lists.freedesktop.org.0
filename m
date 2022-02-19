Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CCD4BC766
	for <lists+dri-devel@lfdr.de>; Sat, 19 Feb 2022 11:03:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69DA10F6B8;
	Sat, 19 Feb 2022 10:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 584 seconds by postgrey-1.36 at gabe;
 Sat, 19 Feb 2022 09:41:44 UTC
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DFE10F355
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Feb 2022 09:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
 s=dhelectronicscom; t=1645262931;
 bh=DvnMBoMWrC5tP4JUDp+kdkLkR3C1ZbkLyCFQs1NdNCk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Wv2IOrZkyiFSsKKPGMtfvR8NPaBt4CECR+RYwjtyhKcngGGl2UbUpoL+JV/SR2Cxn
 4UDhPCAk2jOm7OUHufB7BLchwddpDRJeEF/JfHn1AWBFQsnw6RBiVb6rnnyALmPcpG
 UU7PLigW7gVvsS5Y1Kvsnpe85kHIgZoIqogx+M5/IzeDFnNL1zfqtk+KlfyhzYLRMT
 1T7r7de7HrdEdX4f0sQJYpqp4M3etsH1AyI4YQYhJLhnSPHfmjDyVm0azMa0sRO9Jx
 jID60SP7eMydYjMeF3WzvzAywU05S87uvLenE8Q91DzmfaTqPkzGZxhBVjTk8yQJsK
 a4tpx2MANYFnA==
X-secureTransport-forwarded: yes
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Complaints-To: abuse@cubewerk.de
To: Max Krummenacher <max.oss.09@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH V2] drm/imx: parallel-display: Remove bus flags check in
 imx_pd_bridge_atomic_check()
Thread-Topic: [PATCH V2] drm/imx: parallel-display: Remove bus flags check in
 imx_pd_bridge_atomic_check()
Thread-Index: AQHYF2Auyje+6f9Uv0ak20m5iGounayK8fGAgA/C3CA=
Date: Sat, 19 Feb 2022 09:28:44 +0000
Message-ID: <e00e00585b9945e396bdc3bbd8f30f7e@dh-electronics.com>
References: <20220201113643.4638-1-cniedermaier@dh-electronics.com>
 <36f517300a15b2460a02512ef3c5814ad0ed2290.camel@gmail.com>
In-Reply-To: <36f517300a15b2460a02512ef3c5814ad0ed2290.camel@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 19 Feb 2022 10:01:55 +0000
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
Cc: "Marek MV. Vasut" <marex@denx.de>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn
 Guo <shawnguo@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWF4IEtydW1tZW5hY2hlciBbbWFpbHRvOm1heC5vc3MuMDlAZ21haWwuY29tXQ0KU2Vu
dDogV2VkbmVzZGF5LCBGZWJydWFyeSA5LCAyMDIyIDEwOjM4IEFNDQo+PiBJZiBkaXNwbGF5IHRp
bWluZ3Mgd2VyZSByZWFkIGZyb20gdGhlIGRldmljZXRyZWUgdXNpbmcNCj4+IG9mX2dldF9kaXNw
bGF5X3RpbWluZygpIGFuZCBwaXhlbGNsay1hY3RpdmUgaXMgZGVmaW5lZA0KPj4gdGhlcmUsIHRo
ZSBmbGFnIERJU1BMQVlfRkxBR1NfU1lOQ19QT1NFREdFL05FR0VER0UgaXMNCj4+IGF1dG9tYXRp
Y2FsbHkgZ2VuZXJhdGVkLiBUaHJvdWdoIHRoZSBmdW5jdGlvbg0KPj4gZHJtX2J1c19mbGFnc19m
cm9tX3ZpZGVvbW9kZSgpIGUuZy4gY2FsbGVkIGluIHRoZQ0KPj4gcGFuZWwtc2ltcGxlIGRyaXZl
ciB0aGlzIGZsYWcgZ290IGludG8gdGhlIGJ1cyBmbGFncywNCj4+IGJ1dCB0aGVuIGluIGlteF9w
ZF9icmlkZ2VfYXRvbWljX2NoZWNrKCkgdGhlIGJ1cyBmbGFnDQo+PiBjaGVjayBmYWlsZWQgYW5k
IHdpbGwgbm90IGluaXRpYWxpemUgdGhlIGRpc3BsYXkuIFRoZQ0KPj4gb3JpZ2luYWwgY29tbWl0
IGZlMTQxY2VkYzQzMyBkb2VzIG5vdCBleHBsYWluIHdoeSB0aGlzDQo+PiBjaGVjayB3YXMgaW50
cm9kdWNlZC4gU28gcmVtb3ZlIHRoZSBidXMgZmxhZ3MgY2hlY2ssDQo+PiBiZWNhdXNlIGl0IHN0
b3BzIHRoZSBpbml0aWFsaXphdGlvbiBvZiB0aGUgZGlzcGxheSB3aXRoDQo+PiB2YWxpZCBidXMg
ZmxhZ3MuDQo+Pg0KPj4gRml4ZXM6IGZlMTQxY2VkYzQzMyAoImRybS9pbXg6IHBkOiBVc2UgYnVz
IGZvcm1hdC9mbGFncyBwcm92aWRlZCBieSB0aGUgYnJpZGdlIHdoZW4gYXZhaWxhYmxlIikNCj4+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBOaWVkZXJtYWllciA8Y25pZWRlcm1haWVyQGRoLWVs
ZWN0cm9uaWNzLmNvbT4NCj4+IENjOiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4NCj4+IENj
OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xsYWJvcmEuY29tPg0KPj4gQ2M6
IFBoaWxpcHAgWmFiZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+DQo+PiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPg0KPj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4NCj4+IENjOiBTaGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+DQo+PiBDYzogU2Fz
Y2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPg0KPj4gQ2M6IFBlbmd1dHJvbml4IEtl
cm5lbCBUZWFtIDxrZXJuZWxAcGVuZ3V0cm9uaXguZGU+DQo+PiBDYzogRmFiaW8gRXN0ZXZhbSA8
ZmVzdGV2YW1AZ21haWwuY29tPg0KPj4gQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhw
LmNvbT4NCj4+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcNCj4+IFRv
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiAtLS0NCj4+IFYyOiAtIEFkZCBC
b3JpcyB0byB0aGUgQ2MgbGlzdA0KPj4gLS0tDQo+PiAgZHJpdmVycy9ncHUvZHJtL2lteC9wYXJh
bGxlbC1kaXNwbGF5LmMgfCA4IC0tLS0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDggZGVsZXRp
b25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwt
ZGlzcGxheS5jIGIvZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMNCj4+IGlu
ZGV4IGE4YWJhMDE0MWNlNy4uMDZjYjFhNTliOWJjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
bXgvcGFyYWxsZWwtZGlzcGxheS5jDQo+PiBAQCAtMjE3LDE0ICsyMTcsNiBAQCBzdGF0aWMgaW50
IGlteF9wZF9icmlkZ2VfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsDQo+
PiAgICAgICBpZiAoIWlteF9wZF9mb3JtYXRfc3VwcG9ydGVkKGJ1c19mbXQpKQ0KPj4gICAgICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+DQo+PiAtICAgICBpZiAoYnVzX2ZsYWdzICYNCj4+
IC0gICAgICAgICB+KERSTV9CVVNfRkxBR19ERV9MT1cgfCBEUk1fQlVTX0ZMQUdfREVfSElHSCB8
DQo+PiAtICAgICAgICAgICBEUk1fQlVTX0ZMQUdfUElYREFUQV9EUklWRV9QT1NFREdFIHwNCj4+
IC0gICAgICAgICAgIERSTV9CVVNfRkxBR19QSVhEQVRBX0RSSVZFX05FR0VER0UpKSB7DQo+PiAt
ICAgICAgICAgICAgIGRldl93YXJuKGlteHBkLT5kZXYsICJpbnZhbGlkIGJ1c19mbGFncyAoJXgp
XG4iLCBidXNfZmxhZ3MpOw0KPj4gLSAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+IC0g
ICAgIH0NCj4+IC0NCj4+ICAgICAgIGJyaWRnZV9zdGF0ZS0+b3V0cHV0X2J1c19jZmcuZmxhZ3Mg
PSBidXNfZmxhZ3M7DQo+PiAgICAgICBicmlkZ2Vfc3RhdGUtPmlucHV0X2J1c19jZmcuZmxhZ3Mg
PSBidXNfZmxhZ3M7DQo+PiAgICAgICBpbXhfY3J0Y19zdGF0ZS0+YnVzX2ZsYWdzID0gYnVzX2Zs
YWdzOw0KPiANCj4gVGVzdGVkIG9uIGEgQ29saWJyaSBpTVg2REwgd2l0aCBhIHBhbmVsLWRwaSBi
YXNlZCBwYW5lbC4NCj4gDQo+IFRlc3RlZC1ieTogTWF4IEtydW1tZW5hY2hlciA8bWF4LmtydW1t
ZW5hY2hlckB0b3JhZGV4LmNvbT4NCg0KSSBzdGlsbCBhc2sgbXlzZWxmIHdoeSB0aGlzIGJ1cyBm
bGFnIGNoZWNrIGlzIGluIHRoZSBjb2RlLg0KSXMgdGhlcmUgYSByZWFzb24gbm90IHRvIHJlbW92
ZSB0aGF0Pw0KDQpSZWdhcmRzDQpDaHJpc3RvcGgNCg==
