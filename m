Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6E8574AFD
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 12:43:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CB612AFC2;
	Thu, 14 Jul 2022 10:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CFF111AD54
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jul 2022 10:43:10 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 14 Jul 2022 18:41:53 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 26EAfp1K040938;
 Thu, 14 Jul 2022 18:41:51 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from CSBMAIL1.internal.ite.com.tw (192.168.65.58) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Thu, 14 Jul 2022 18:41:51 +0800
Received: from CSBMAIL1.internal.ite.com.tw ([fe80::dd22:b444:859b:61c7]) by
 CSBMAIL1.internal.ite.com.tw ([fe80::dd22:b444:859b:61c7%18]) with mapi id
 15.01.2176.014; Thu, 14 Jul 2022 18:41:51 +0800
From: <allen.chen@ite.com.tw>
To: <treapking@chromium.org>, <andrzej.hajda@intel.com>,
 <narmstrong@baylibre.com>, <robert.foss@linaro.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: RE: [PATCH v2] drm/bridge: it6505: Power on downstream device in
 .atomic_enable
Thread-Topic: [PATCH v2] drm/bridge: it6505: Power on downstream device in
 .atomic_enable
Thread-Index: AQHYl2WhMyMSW5NQwU2abTU4OMFnz619rWtw
Date: Thu, 14 Jul 2022 10:41:51 +0000
Message-ID: <a7c9c0b2a35e45f89cb7d6d7646396f2@ite.com.tw>
References: <20220714173715.v2.1.I85af54e9ceda74ec69f661852825845f983fc343@changeid>
In-Reply-To: <20220714173715.v2.1.I85af54e9ceda74ec69f661852825845f983fc343@changeid>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.70.46]
x-tm-snts-smtp: 9FC9254C1A08E1488876D87E4C2C2BE95FBC308C14AFD7FCAE685AFA5B44DC1B2002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 26EAfp1K040938
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
Cc: Kenneth.Hung@ite.com.tw, Jau-Chih.Tseng@ite.com.tw,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hermes.Wu@ite.com.tw, hsinyi@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEFsbGVuIENoZW4gPGFsbGVuLmNoZW5AaXRlLmNvbS50dz4NCg0KLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFBpbi1ZZW4gTGluIDx0cmVhcGtpbmdAY2hyb21p
dW0ub3JnPiANClNlbnQ6IFRodXJzZGF5LCBKdWx5IDE0LCAyMDIyIDU6MzkgUE0NClRvOiBBbmRy
emVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT47IE5laWwgQXJtc3Ryb25nIDxuYXJt
c3Ryb25nQGJheWxpYnJlLmNvbT47IFJvYmVydCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5hcm8ub3Jn
PjsgTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPjsg
Sm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPjsgSmVybmVqIFNrcmFiZWMgPGplcm5lai5z
a3JhYmVjQGdtYWlsLmNvbT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT47IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCkNjOiBIc2luLVlpIFdhbmcgPGhzaW55aUBjaHJv
bWl1bS5vcmc+OyBBbGxlbiBDaGVuICizr6xmpnQpIDxhbGxlbi5jaGVuQGl0ZS5jb20udHc+OyBQ
aW4tWWVuIExpbiA8dHJlYXBraW5nQGNocm9taXVtLm9yZz47IGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNClN1YmplY3Q6IFtQQVRD
SCB2Ml0gZHJtL2JyaWRnZTogaXQ2NTA1OiBQb3dlciBvbiBkb3duc3RyZWFtIGRldmljZSBpbiAu
YXRvbWljX2VuYWJsZQ0KDQpTZW5kIERQQ0QgRFBfU0VUX1BPV0VSX0QwIGNvbW1hbmQgdG8gdGhl
IG1vbml0b3IgaW4gLmF0b21pY19lbmFibGUgY2FsbGJhY2suIFdpdGhvdXQgdGhpcyBjb21tYW5k
LCBzb21lIG1vbml0b3JzIHdvbid0IHNob3cgdXAgYWdhaW4gYWZ0ZXIgY2hhbmdpbmcgdGhlIHJl
c29sdXRpb24uDQoNCkZpeGVzOiA0NmNhN2RhN2YxZTggKCJkcm0vYnJpZGdlOiBpdDY1MDU6IFNl
bmQgRFBDRCBTRVRfUE9XRVIgdG8gZG93bnN0cmVhbSIpDQoNClNpZ25lZC1vZmYtYnk6IFBpbi1Z
ZW4gTGluIDx0cmVhcGtpbmdAY2hyb21pdW0ub3JnPg0KLS0tDQoNCkNoYW5nZXMgaW4gdjI6DQot
IFVwZGF0ZSB0aGUgdHlwbyBpbiB0aGUgc3VtbWFyeSAocG93ZXIgb24gLS0+IHBvd2VyIG9mZikN
Ci0gUmUtd3JpdGUgdGhlIGNvbW1pdCBtZXNzYWdlIHRvIG1ha2UgaXQgY2xlYXJlci4NCg0KIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jIHwgMyArKysNCiAxIGZpbGUgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2l0ZS1pdDY1MDUuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jDQppbmRl
eCA0YjY3M2M0NzkyZDcuLmU1NjI2MDM1ZjMxMSAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2UvaXRlLWl0NjUwNS5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1p
dDY1MDUuYw0KQEAgLTI5NDUsNiArMjk0NSw5IEBAIHN0YXRpYyB2b2lkIGl0NjUwNV9icmlkZ2Vf
YXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLA0KIAlpZiAocmV0KQ0KIAkJ
ZGV2X2VycihkZXYsICJGYWlsZWQgdG8gc2V0dXAgQVZJIGluZm9mcmFtZTogJWQiLCByZXQpOw0K
IA0KKwlpdDY1MDVfZHJtX2RwX2xpbmtfc2V0X3Bvd2VyKCZpdDY1MDUtPmF1eCwgJml0NjUwNS0+
bGluaywNCisJCQkJICAgICBEUF9TRVRfUE9XRVJfRDApOw0KKw0KIAlpdDY1MDVfdXBkYXRlX3Zp
ZGVvX3BhcmFtZXRlcihpdDY1MDUsIG1vZGUpOw0KIA0KIAlyZXQgPSBpdDY1MDVfc2VuZF92aWRl
b19pbmZvZnJhbWUoaXQ2NTA1LCAmZnJhbWUpOw0KLS0NCjIuMzcuMC4xNDQuZzhhYzA0YmZkMi1n
b29nDQoNCg==
