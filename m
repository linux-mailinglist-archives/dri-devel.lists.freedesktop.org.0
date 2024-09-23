Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3197497E59A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 07:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76D210E379;
	Mon, 23 Sep 2024 05:21:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="qljdvxFx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9ABF10E379
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LxYudaXWcm7UEsO9WTBrIjhF7o2hlByEngG5yYLjS6I=;
 b=qljdvxFxLyinul2GpzKszlrnTt9dNFzExWa1/J8HE2GaR2/gU4pzm1ol
 16+2/8g+MTQUd49PTcM+6nOu3QJMeepDgtq+2ZFzJMGD5Drpsn9IrOfCx
 nA7poWnvQt4wFwDcD0bL3jAEobcwYdR63z0Ys4qkDUFqvkWWyjAT5jEW+
 2K65gMfhDACgiNt/JRXRx0oJ4kdHr0tpByFea6zomy7itI83iowe3TXw4
 irFkxgO9/OH11FmIRwzeY4S2pk3Ukl6xzLSaT+Kr68ResRN5HGJQ03boO
 dF0iq4CIWR+re5dEOL8GkWRLNvwv5ux/HdN0wxMvAe3IYWb8dWXIXvNya Q==;
X-CSE-ConnectionGUID: FR/yvjxySVurvrTLpNeDWQ==
X-CSE-MsgGUID: aMXIuBerR+eoIVSvriKtvQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 23 Sep 2024 13:21:46 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48N5LfLX009501;
 Mon, 23 Sep 2024 13:21:41 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 13:21:41 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Mon, 23 Sep 2024 13:21:41 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@linaro.org>, <treapking@chromium.org>
CC: <a.hajda@samsung.com>, <narmstrong@baylibre.com>, <robert.foss@linaro.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <Kenneth.Hung@ite.com.tw>
Subject: RE: [PATCH v1] drm/bridge: it6505: HDCP CTS fail on repeater items
Thread-Topic: [PATCH v1] drm/bridge: it6505: HDCP CTS fail on repeater items
Thread-Index: AQHbC3TJoX+m8u1HGEWhaTgeYcdV3rJk155g
Date: Mon, 23 Sep 2024 05:21:41 +0000
Message-ID: <467ea5d3380843a1ad1f2f2429bb2833@ite.com.tw>
References: <20240919025551.254-1-Hermes.Wu@ite.com.tw>
 <CAEXTbpc7N2v4LwoZ4wpHXi7ogyqGwYC3Gpt5sqfxtOpYrngPLg@mail.gmail.com>
 <nczuje3ur7sf7uqkygtziwnz5p6b4b7bf5on5crljr2ijmblrv@ym3fkvqxbjq5>
In-Reply-To: <nczuje3ur7sf7uqkygtziwnz5p6b4b7bf5on5crljr2ijmblrv@ym3fkvqxbjq5>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.20.82]
x-tm-snts-smtp: 8396A173090D384594A0C11FB3BFC18E41FB158EACE01F4901798337420C85672002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 48N5LfLX009501
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

SGkgDQoNClNvcnJ5IGZvciB0aGUgY29uZnVzaW9uIGNhdXNlZA0KDQpMYXN0IHBhdGNoZXMgZGlk
IG5vdCBzd2l0Y2ggdG8gZHJtLW1pc2MtbmVzdC4gQW5kIEkgbmVlZCByZS1jcmVhdGUgcGF0Y2hl
cy4NCg0KVGhlIEhEQ1AgcGF0Y2hlcyBpcyBub3cgb24gdG93IHRocmVhZHMuKFRoaXMgb25lIGFu
ZCB0aGUgb25lIGluY2x1ZGUgTUNDUyBwYXRjaGVzIHdpdGggY292ZXIgbGV0dGVyKQ0KDQpTaG91
bGQgSSBrZWVwIG9uIHRoaXMgdGhyZWFkIG9yIHJlc3RhcnQgYSBuZXcgdGhyZWFkPw0KDQoNCg0K
QlIsDQpIZXJtZXMNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBEbWl0cnkgQmFy
eXNoa292IDxkbWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IA0KU2VudDogRnJpZGF5LCBTZXB0
ZW1iZXIgMjAsIDIwMjQgMTE6NTAgUE0NClRvOiBQaW4teWVuIExpbiA8dHJlYXBraW5nQGNocm9t
aXVtLm9yZz4NCkNjOiBIZXJtZXMgV3UgKOWQs+S9s+WujykgPEhlcm1lcy5XdUBpdGUuY29tLnR3
PjsgQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT47IE5laWwgQXJtc3Ryb25nIDxu
YXJtc3Ryb25nQGJheWxpYnJlLmNvbT47IFJvYmVydCBGb3NzIDxyb2JlcnQuZm9zc0BsaW5hcm8u
b3JnPjsgTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
PjsgSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPjsgSmVybmVqIFNrcmFiZWMgPGplcm5l
ai5za3JhYmVjQGdtYWlsLmNvbT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBvcGVuIGxpc3Q6RFJNIERSSVZFUlMgPGRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBvcGVuIGxpc3QgPGxpbnV4LWtlcm5lbEB2
Z2VyLmtlcm5lbC5vcmc+OyBLZW5uZXRoIEh1bmcgKOa0quWutuWAqykgPEtlbm5ldGguSHVuZ0Bp
dGUuY29tLnR3Pg0KU3ViamVjdDogUmU6IFtQQVRDSCB2MV0gZHJtL2JyaWRnZTogaXQ2NTA1OiBI
RENQIENUUyBmYWlsIG9uIHJlcGVhdGVyIGl0ZW1zDQoNCk9uIEZyaSwgU2VwIDIwLCAyMDI0IGF0
IDAxOjI3OjU0UE0gR01ULCBQaW4teWVuIExpbiB3cm90ZToNCj4gT24gVGh1LCBTZXAgMTksIDIw
MjQgYXQgMTA6NTjigK9BTSA8SGVybWVzLld1QGl0ZS5jb20udHc+IHdyb3RlOg0KPiA+DQo+ID4g
RnJvbTogSGVybWVzIFd1IDxIZXJtZXMuV3VAaXRlLmNvbS50dz4NCj4gPg0KPiA+IEZpeCBIRENQ
IENUUyBpdGVtcyBvbiBVTklHUkFGIERQUi0xMDAuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBI
ZXJtZXMgV3UgPEhlcm1lcy5XdUBpdGUuY29tLnR3Pg0KPiANCj4gUmV2aWV3ZWQtYnk6IFBpbi15
ZW4gTGluIDx0cmVhcGtpbmdAY2hyb21pdW0ub3JnPg0KDQpGb3IgdGhlIHNha2Ugb2Ygc29tZWJv
ZHkgYXBwbHlpbmcgdGhlIHBhdGNoIGJlY2F1c2UgaXQgd2FzIFItQidlZA0KDQpOYWNrZWQtYnk6
IERtaXRyeSBCYXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCg0KVGhlIGNv
bW1pdCBtZXNzYWdlIGRvZXNuJ3QgZGVzY3JpYmUgd2hhdCBpcyBiZWluZyBkb25lIGFuZCB3aHks
IGl0DQpkb2Vzbid0IGhhdmUgRml4ZXMgdGFncywgZXRjLg0KDQpIZXJtZXMsIEknbSBub3Qgc3Vy
ZSB3aGF0J3MgaGFwcGVuaW5nIG9uIHlvdXIgc2lkZS4gSSBoYXZlIHNlZW4gc2V2ZXJhbA0KcmV2
aXNpb25zIG9mIHRoaXMgcGF0Y2ggd2l0aCBtaW5pbWFsIG1vZGlmaWNhdGlvbnMgKGFuZCBiZWlu
ZyBhIHBhcnQgb2YNCmRpZmZlcmVudCBzZXJpZXMpLiBTb21lIG9mIHRoZW0gd2VyZSBtYXJrZWQg
YXMgdjEgKGFsdGhvdWdoIHlvdSd2ZSBzZW50DQpkaWZmZXJlbnQgcGF0Y2hlcyBhcyB2MSksIG90
aGVyIGhhZCB2MiAoYnV0IG5vIGNoYW5nZWxvZywgZXRjKS4gUGxlYXNlDQphZGhlcmUgdG8gdGhl
IGRlc2NyaWJlZCBwcm9jZXNzIG9mIHNlbmRpbmcgcGF0Y2hlcy4NCg0KLS0gDQpXaXRoIGJlc3Qg
d2lzaGVzDQpEbWl0cnkNCg==
