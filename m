Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB71C983B67
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 04:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8ACA10E004;
	Tue, 24 Sep 2024 02:57:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="bkSV6P5W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B52D010E004
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 02:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Pez01GVTI+nAGe+V0h/GEhDzn9cAbuhuFih04e9gyZg=;
 b=bkSV6P5WH8MtzHUbwFejbkvodV2vsiKPVcwG57eX0HEs0w/VpoWX01oy
 lfM0G77K/erZKT8VI9QcBJEJ5cQhp+BBIebeSMJRaCA7SPZSuaYvJR+tA
 Uu1HOcG+tD+8z2IXzmy/2AbfdPndEjWPmfnMkhNNiM0RdQKZ2/+cyA5V/
 NoUqfaf3Xu93ZXD6SgxzrgScyeszH4ofr2o5Kc7tV45cPg9ZLM5xmGYQp
 GztSThc6n62sW9qDfUeNo00rLeIUVzLm0tCCPneHcIDBoEJdqhDUbHiAq
 o6ee/57YvaIxt98eNo0wlLbaSfAUQV5acRWRr7lq+i7QlOlJnnuhfilb0 w==;
X-CSE-ConnectionGUID: hfp7j/ybSnG3IkO9gu66Sw==
X-CSE-MsgGUID: sTBYZWO7Q0uIwBMJBz/iww==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 24 Sep 2024 10:57:15 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48O2vBOJ047817;
 Tue, 24 Sep 2024 10:57:11 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 10:57:10 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Tue, 24 Sep 2024 10:57:10 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@linaro.org>
CC: <treapking@chromium.org>, <Kenneth.Hung@ite.com.tw>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] drm/bridge: it6505: HDCP CTS fail on repeater items
Thread-Topic: [PATCH v3 2/3] drm/bridge: it6505: HDCP CTS fail on repeater
 items
Thread-Index: AQHbDaFxMxnMHj2GkEGHdgKCDl4eaLJlMDIw//+LvQCAAYOEgA==
Date: Tue, 24 Sep 2024 02:57:10 +0000
Message-ID: <169c171660ac4897903aef5befc780db@ite.com.tw>
References: <20240923094826.13471-1-Hermes.Wu@ite.com.tw>
 <20240923094826.13471-3-Hermes.Wu@ite.com.tw>
 <4viir5prnuvpp76npblwmdrwlttm5daumvdnocipdsn6geyxvf@2yfcytjb3ono>
 <a0a8f862018b4c9aa689672551e7a492@ite.com.tw>
 <mkx63gnb2fobxxc5jc2f326d2oviix7dahyoh4sfeuiyypucln@hnklvrtv4q2u>
In-Reply-To: <mkx63gnb2fobxxc5jc2f326d2oviix7dahyoh4sfeuiyypucln@hnklvrtv4q2u>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.20.82]
x-tm-snts-smtp: 349B6BE6289B44C8306504438E8113A17A71BD20F204424E7C03870435E6C8B52002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 48O2vBOJ047817
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

Pk9uIE1vbiwgU2VwIDIzLCAyMDI0IGF0IDEwOjQ1OjQ5QU0gR01ULCBIZXJtZXMuV3VAaXRlLmNv
bS50dyB3cm90ZToNCj4+ID5PbiBNb24sIFNlcCAyMywgMjAyNCBhdCAwNTo0ODoyOFBNIEdNVCwg
SGVybWVzIFd1IHdyb3RlOg0KPj4gPj4gRnJvbTogSGVybWVzIFd1IDxIZXJtZXMud3VAaXRlLmNv
bS50dz4NCj4+ID4+IA0KPj4gPj4gQ2hhbmdlcyBpbiB2MzoNCj4+ID4+ICAtYWRkIGRldGlhbHMg
YWJvdXQgZmFpbCBpdGVtIGFuZCBjaGFuZ2VzLg0KPj4gPj4gDQo+PiA+PiANCj4+ID4+IEZpeCBI
RENQIENUUyBmYWlsIGl0ZW1zIG9uIFVOSUdSQUYgRFJQLTEwMA0KPj4gPj4gDQo+PiA+PiBEVVQg
bXVzdCBTdXBwb3J0IDEyNyBkZXZpY2VzLg0KPj4gPj4gRFVUIG11c3QgY2hlY2sgQlNUQVRVUyB3
aGVuIHJlY2VpdmUgQ1BfSVJRLg0KPj4gPj4gRFVUIG11c3QgZW5hYmxlIGVuY3J5cHRpb24gd2hl
biBSMCcgaXMgcmVhZHkuDQo+PiA+PiBEVVQgbXVzdCByZXRyeSBWJyBjaGVjayAzIHRpbWVzLg0K
Pj4gPj4gaXQ2NTA1IG11c3QgcmVhZCBEUlAtMTAwIEtTViBGSUZPIGJ5IEZJRk8gbW9kZS4NCj4+
ID4+IGl0NjUwNSBzaG91bGQgcmVzdGFydCBIRENQIHdpdGhpbiA1cyBpZiBLU1Ygbm90IHJlYWR5
Lg0KPj4gPg0KPj4gPlN0aWxsIG5vdCByZWFkYWJsZS4NCj4+ID4NCj4+ID5FbmdsaXNoIHRleHQs
IHBsZWFzZS4gU3BsaXQgdGhlIHBhdGNoIHRvIGZpeCBvbmUgaXNzdWUgYXQgYSB0aW1lLg0KPj4g
PkRlc2NyaWJlIHRoZSBfcmVhc29uXyBmb3IgdGhlIGNoYW5nZS4gQW5ub3RhdGUgZml4ZXMgd2l0
aCBGaXhlcyB0YWdzLg0KPj4gPg0KPj4gDQo+PiB3aXRoIGZpeGVzIHRhZyBpbmNsdWRlIGRybS9i
cmlkZ2UgbGlrZSB0aGlzID8gID0+ICJGaXhlczogZHJtL2JyaWRnZTogaXQ2NTA1OiBIRENQIENU
UyBmYWlsIDFCLXh4Ig0KPg0KPk5vLiBQbGVhc2UgcmVhZCB0aGUgZG9jdW1lbnQgdGhhdCBJIGhh
dmUgYmVlbiBwb2ludGluZyB5b3UgdG8uIEl0IGRlc2NyaWJlcyBhbGwgdGhlIHRhZ3MgYW5kIHBy
b2NlZHVyZXMuDQo+DQo+PiANCj4+IEFib3V0IHRoZSByZWFzb24gYWJvdXQgYnVnIGZpeGVzLiAN
Cj4+IA0KPj4gZm9yIGV4YW1wbGUsIHRoZSAxQi0wMSBkZXZpY2UgY291bnQuDQo+PiB3aWxsIHRo
aXMgcmVhZGFibGU/DQo+PiANCj4+ICIgV2hlbiBjb25uZWN0IHRvIEhEQ1AgcmVwZWF0ZXIsIGl0
NjUwNSBtdXN0IHN1cHBvcnQgMTI3IGRvd25zdHJlYW0gZGV2aWNlcy4gIg0KPj4gDQo+PiBBbmQg
dGhpcyB3aWxsIGJlIG9ubHkgb25lIGNoYW5nZSBpbiBhIHBhdGNoPw0KPg0KPkxldCBtZSByZXBl
YXQgdGhlIHBocmFzZSB0aGF0IHlvdSBoYXZlIHF1b3RlZCBmZXcgbGluZXMgYWJvdmUuICJTcGxp
dCB0aGUgcGF0Y2ggdG8gZml4IG9uZSBpc3N1ZSBhdCBhIHRpbWUuIiBTbywgbm8sIHRoaXMgd2ls
bCBub3QgYmUgdGhlIG9ubHkgY2hhbmdlIGluIHRoZSBwYXRjaC4NCj4NCg0KVGhlIEhEQ1AgQ1RT
IGluY2x1ZGUgc2VydmFsIGl0ZW1zLCBJIHNob3VsZCBzcGxpdCBlYWNoIGZhaWx1cmUgaXRlbSBm
aXhlcyBpbnRvIGRpZmZlcmVudCBwYXRjaD8NCg0KDQo+PiANCj4+ID4+IA0KPj4gPj4gU2lnbmVk
LW9mZi1ieTogSGVybWVzIFd1IDxIZXJtZXMud3VAaXRlLmNvbS50dz4NCj4+ID4+IC0tLQ0KPj4g
Pj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jIHwgMTEyIA0KPj4gPj4gKysr
KysrKysrKysrKysrKysrLS0tLS0tLS0tLQ0KPj4gPj4gIDEgZmlsZSBjaGFuZ2VkLCA3NCBpbnNl
cnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkNCj4+ID4NCj4+ID4tLQ0KPj4gPldpdGggYmVzdCB3
aXNoZXMNCj4+ID5EbWl0cnkNCj4+IA0KPj4gQlIsDQo+PiBIZXJtZXMNCj4NCj4tLQ0KPldpdGgg
YmVzdCB3aXNoZXMNCj5EbWl0cnkNCg==
