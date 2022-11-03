Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 410D96178AD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 09:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288E310E0E8;
	Thu,  3 Nov 2022 08:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D74B10E1AB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 08:28:07 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 03 Nov 2022 16:28:04 +0800
Received: from CSBMAIL1.internal.ite.com.tw (CSBMAIL1.internal.ite.com.tw
 [192.168.65.58]) by mse.ite.com.tw with ESMTP id 2A38RwWI072844;
 Thu, 3 Nov 2022 16:27:58 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from CSBMAIL1.internal.ite.com.tw (192.168.65.58) by
 CSBMAIL1.internal.ite.com.tw (192.168.65.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.14; Thu, 3 Nov 2022 16:27:58 +0800
Received: from CSBMAIL1.internal.ite.com.tw ([fe80::dd22:b444:859b:61c7]) by
 CSBMAIL1.internal.ite.com.tw ([fe80::dd22:b444:859b:61c7%18]) with mapi id
 15.01.2176.014; Thu, 3 Nov 2022 16:27:58 +0800
From: <allen.chen@ite.com.tw>
To: <krzysztof.kozlowski@linaro.org>
Subject: RE: [PATCH v6 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Thread-Topic: [PATCH v6 1/2] dt-bindings: it6505: add properties to restrict
 output bandwidth
Thread-Index: AQHY6nDorSjdzmskUUWkM7FpU3Wft64rCzswgABLlgCAAZBVsA==
Date: Thu, 3 Nov 2022 08:27:58 +0000
Message-ID: <df7f841e07764433b87085eeaef5733f@ite.com.tw>
References: <20221027030155.59238-1-allen.chen@ite.com.tw>
 <20221027030155.59238-2-allen.chen@ite.com.tw>
 <d6f14e09-0c24-e19a-0951-bb3ca2219e79@linaro.org>
 <18659f5a5b2c4fd7b76731836aeb713d@ite.com.tw>
 <30ce6ed4-cbea-7b82-cca5-8920fc1eddad@linaro.org>
In-Reply-To: <30ce6ed4-cbea-7b82-cca5-8920fc1eddad@linaro.org>
Accept-Language: en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.70.46]
x-tm-snts-smtp: 2BDF71C3B6F730D79AF473E1C57B57AB6758B3A083D2EB534B4436160364AF662002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 2A38RwWI072844
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
Cc: devicetree@vger.kernel.org, Kenneth.Hung@ite.com.tw,
 jernej.skrabec@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 narmstrong@baylibre.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 Jau-Chih.Tseng@ite.com.tw, linux-kernel@vger.kernel.org,
 robert.foss@linaro.org, treapking@chromium.org, Hermes.Wu@ite.com.tw,
 robh+dt@kernel.org, Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 jonas@kwiboo.se
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aGkNCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtyenlzenRvZiBLb3psb3dz
a2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gDQpTZW50OiBUaHVyc2RheSwgTm92
ZW1iZXIgMywgMjAyMiAxMjozNCBBTQ0KVG86IEFsbGVuIENoZW4gKOmZs+afj+WuhykgPGFsbGVu
LmNoZW5AaXRlLmNvbS50dz4NCkNjOiB0cmVhcGtpbmdAY2hyb21pdW0ub3JnOyBKYXUtQ2hpaCBU
c2VuZyAo5pu+5pit5pm6KSA8SmF1LUNoaWguVHNlbmdAaXRlLmNvbS50dz47IEhlcm1lcyBXdSAo
5ZCz5L2z5a6PKSA8SGVybWVzLld1QGl0ZS5jb20udHc+OyBLZW5uZXRoIEh1bmcgKOa0quWutuWA
qykgPEtlbm5ldGguSHVuZ0BpdGUuY29tLnR3PjsgYW5kcnplai5oYWpkYUBpbnRlbC5jb207IG5h
cm1zdHJvbmdAYmF5bGlicmUuY29tOyByb2JlcnQuZm9zc0BsaW5hcm8ub3JnOyBMYXVyZW50LnBp
bmNoYXJ0QGlkZWFzb25ib2FyZC5jb207IGpvbmFzQGt3aWJvby5zZTsgamVybmVqLnNrcmFiZWNA
Z21haWwuY29tOyBhaXJsaWVkQGxpbnV4LmllOyBkYW5pZWxAZmZ3bGwuY2g7IHJvYmgrZHRAa2Vy
bmVsLm9yZzsga3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnOyBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZw0KU3ViamVjdDogUmU6IFtQQVRDSCB2NiAxLzJdIGR0LWJpbmRp
bmdzOiBpdDY1MDU6IGFkZCBwcm9wZXJ0aWVzIHRvIHJlc3RyaWN0IG91dHB1dCBiYW5kd2lkdGgN
Cg0KT24gMDIvMTEvMjAyMiAwMjo1NCwgYWxsZW4uY2hlbkBpdGUuY29tLnR3IHdyb3RlOg0KPiBP
biAyNi8xMC8yMDIyIDIzOjAxLCBhbGxlbiB3cm90ZToNCj4+IEZyb206IGFsbGVuIGNoZW4gPGFs
bGVuLmNoZW5AaXRlLmNvbS50dz4NCj4+DQo+PiBBZGQgcHJvcGVydGllcyB0byByZXN0cmljdCBk
cCBvdXRwdXQgZGF0YS1sYW5lcyBhbmQgY2xvY2suDQo+IA0KPiBUaGlzIGlzIGEgZnJpZW5kbHkg
cmVtaW5kZXIgZHVyaW5nIHRoZSByZXZpZXcgcHJvY2Vzcy4NCj4gDQo+IEl0IHNlZW1zIG15IHBy
ZXZpb3VzIGNvbW1lbnRzIHdlcmUgbm90IGZ1bGx5IGFkZHJlc3NlZC4gTWF5YmUgbXkgZmVlZGJh
Y2sgZ290IGxvc3QgYmV0d2VlbiB0aGUgcXVvdGVzLCBtYXliZSB5b3UganVzdCBmb3Jnb3QgdG8g
YXBwbHkgaXQuDQo+IFBsZWFzZSBnbyBiYWNrIHRvIHRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIGFu
ZCBlaXRoZXIgaW1wbGVtZW50IGFsbCByZXF1ZXN0ZWQgY2hhbmdlcyBvciBrZWVwIGRpc2N1c3Np
bmcgdGhlbS4NCj4gDQo+IFRoYW5rIHlvdS4NCj4gDQo+ID09PiBJIGFtIHNvcnJ5IEkgZGlkbid0
IGZpbmQgdGhlIG1pc3NpbmcgYWR2aWNlIHlvdSBzYWlkLiBDb3VsZCB5b3UgZXhwbGFpbiBpdCBh
Z2Fpbj8NCj4gDQo+IFJvYiBhc2tlZCAtIENvbW1pdCBtc2cgc2hvdWxkIGV4cGxhaW4gcmVhc29u
IGZvciBicmVha2luZyB1c2Vycy4NCg0KQW5kIHdoZXJlIGlzIHRoZSByZWFzb24/IEkgc2F3IG9u
bHkgb25lIHNlbnRlbmNlICJBZGQgcHJvcGVydGllcyB0byByZXN0cmljdCBkcCBvdXRwdXQgZGF0
YS1sYW5lcyBhbmQgY2xvY2suIg0KPT0+IEkgd2lsbCBhZGQgdGhlIGNvbW1pdCBtc2cgaW4gdjcu
IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uDQoNCkJlc3QgcmVnYXJkcywNCktyenlzenRvZg0K
DQo=
