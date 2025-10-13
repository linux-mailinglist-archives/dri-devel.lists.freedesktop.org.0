Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2337BD1D3E
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 09:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D0C110E3E4;
	Mon, 13 Oct 2025 07:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="aneSQ49u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FE9910E00A
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 03:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bs+ML9yntkB+CbmtvinOzIDQScni1iGM7XWFx0NwunM=;
 b=aneSQ49uaXI7vYdWAaiyh9W+gcqcMc867Iefu3KUJu5GV/3oDTmgxPRc
 krVdkotwQ6E2yuGLdg8iOYDjQB4mAt69CEby4Ny/hs+iyWf+q9i2U0dqk
 CSo9Nq2ONQxrWymiUi8polFt8HgWDHgeHMD3sQf57OHpi38/h9JVU9O0k
 4cBI4JnVEB7mU9sN2YCNvtb5R1kqTH6gBBAn6V/YeCqOF9Ao1/CpBK2VB
 ud/c/WFs4wmYO/9hGl5PvN7/g7Nfkqee6sAf665byx2ZF1PugVngn2Xpj
 aBs8Dc6NMuFMKXSCelRLcrWpW1UxPt7ElQHnZXHJwBxn3GOOPFqRgaHDg w==;
X-CSE-ConnectionGUID: B28KHWmERwaCjQN3HPgoUw==
X-CSE-MsgGUID: FPkfBvSuTnqOgfRosDhGmw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 13 Oct 2025 11:49:47 +0800
Received: from hscmail1.internal.ite.com.tw (HSCMAIL1.internal.ite.com.tw
 [192.168.35.58]) by mse.ite.com.tw with ESMTP id 59D3njdd065613;
 Mon, 13 Oct 2025 11:49:45 +0800 (+08)
 (envelope-from Pet.Weng@ite.com.tw)
Received: from HSCMAIL1.internal.ite.com.tw (192.168.35.58) by
 HSCMAIL1.internal.ite.com.tw (192.168.35.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Mon, 13 Oct 2025 11:49:44 +0800
Received: from HSCMAIL1.internal.ite.com.tw ([fe80::5982:8700:397a:7e59]) by
 HSCMAIL1.internal.ite.com.tw ([fe80::5982:8700:397a:7e59%12]) with mapi id
 15.01.2507.057; Mon, 13 Oct 2025 11:49:44 +0800
From: <Pet.Weng@ite.com.tw>
To: <krzk@kernel.org>, <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, 
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <Hermes.Wu@ite.com.tw>,
 <Kenneth.Hung@ite.com.tw>, <treapking@google.com>
Subject: RE: [PATCH v3 1/3] dt-binding: display: Add ITE IT61620 MIPI DSI to
 HDMI bridge
Thread-Topic: [PATCH v3 1/3] dt-binding: display: Add ITE IT61620 MIPI DSI to
 HDMI bridge
Thread-Index: AQHcOPMgDiPvcIbynU2m6IMtDFZcK7S5VcKAgAAAOACABh63EA==
Date: Mon, 13 Oct 2025 03:49:44 +0000
Message-ID: <663a3ee90e81451894d280a06ea4ecb5@ite.com.tw>
References: <20251009-it61620-0714-v3-0-5d682d028441@ite.com.tw>
 <20251009-it61620-0714-v3-1-5d682d028441@ite.com.tw>
 <fc4b2eff-5224-4c73-b21a-16716e833b8c@kernel.org>
 <cad5f48b-5992-4e29-8ca1-57535dfe3251@kernel.org>
In-Reply-To: <cad5f48b-5992-4e29-8ca1-57535dfe3251@kernel.org>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.70.27]
x-tm-snts-smtp: 788B34A5970BC518487BDBBFBF034C3A70197968B3751062F46B98A561817EFF2002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 59D3njdd065613
X-Mailman-Approved-At: Mon, 13 Oct 2025 07:35:26 +0000
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

SGkgS3J6eXN6dG9mLA0KPiBPbiAwOS8xMC8yMDI1IDIzOjEzLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiA+IE9uIDA5LzEwLzIwMjUgMTc6MDIsIFBldCBXZW5nIHdyb3RlOg0KPiA+PiAr
ICBUaGUgSERNSSB0cmFuc21pdHRlciBzaWRlIHN1cHBvcnRzIHVwIHRvIDRLeDJLQDMwSHogcmVz
b2x1dGlvbnMsIGFuZCBpcw0KPiA+PiArICBjb21wbGlhbnQgd2l0aCBIRE1JIDEuNGIgYW5kIEhE
Q1AgMS40Lg0KPiA+PiArDQo+ID4+ICsgIEZvciBhdWRpbywgdGhlIElUNjE2MjAgc3VwcG9ydHMg
dXAgdG8gOC1jaGFubmVsIExQQ00gdmlhIEkyUyAobXVsdGktbGluZSBvcg0KPiA+PiArICBURE0g
bW9kZSksIHdpdGggb3B0aW9uYWwgUy9QRElGIG9yIERTRCAoZm9yIFNBQ0QpLiBJdCBzdXBwb3J0
cyBhdWRpbw0KPiA+PiArICBzYW1wbGluZyByYXRlcyB1cCB0byAxOTJrSHouDQo+ID4+ICsNCj4g
Pj4gK2FsbE9mOg0KPiA+PiArICAtICRyZWY6IC9zY2hlbWFzL3NvdW5kL2RhaS1jb21tb24ueWFt
bCMNCj4gPj4gKw0KPiA+PiArcHJvcGVydGllczoNCj4gPj4gKyAgY29tcGF0aWJsZToNCj4gPj4g
KyAgICBjb25zdDogaXRlLGl0NjE2MjANCj4gPj4gKw0KPiA+PiArICByZWc6DQo+ID4+ICsgICAg
bWF4SXRlbXM6IDENCj4gPj4gKw0KPiA+PiArICBpbnRlcnJ1cHRzOg0KPiA+PiArICAgIG1heEl0
ZW1zOiAxDQo+ID4+ICsgICAgZGVzY3JpcHRpb246IGludGVycnVwdCBzcGVjaWZpZXIgb2YgSU5U
IHBpbg0KPiA+PiArDQo+ID4+ICsgIHJlc2V0LWdwaW9zOg0KPiA+PiArICAgIG1heEl0ZW1zOiAx
DQo+ID4+ICsgICAgZGVzY3JpcHRpb246IEdQSU8gc3BlY2lmaWVyIG9mIFJFU0VUIHBpbg0KPiA+
DQo+ID4NCj4gPiBJZiB5b3UgYXJlIGdvaW5nIHRvIHNlbmQgbmV3IHZlcnNpb246IGRyb3AgZGVz
Y3JpcHRpb24sIHByZXR0eQ0KPiA+IHJlZHVuZGFudC4gQ2Fubm90IGJlIGFueXRoaW5nIGVsc2Uu
DQo+ID4NCj4gPj4gKw0KPiA+PiArICBpdmRkLXN1cHBseToNCj4gPj4gKyAgICBkZXNjcmlwdGlv
bjogY29yZSB2b2x0YWdlDQo+ID4+ICsNCj4gPj4gKyAgb3ZkZC1zdXBwbHk6DQo+ID4+ICsgICAg
ZGVzY3JpcHRpb246IEkvTyB2b2x0YWdlDQo+ID4+ICsNCj4gPj4gKyAgb3ZkZDE4MzMtc3VwcGx5
Og0KPiA+PiArICAgIGRlc2NyaXB0aW9uOiBmbGV4aWJsZSBJL08gdm90YWdlDQo+ID4+ICsNCj4g
Pj4gKyAgcGluY3RybC1uYW1lczoNCj4gPj4gKyAgICBpdGVtczoNCj4gPj4gKyAgICAgIC0gY29u
c3Q6IGRlZmF1bHQNCj4gPj4gKw0KPiA+PiArICBwaW5jdHJsLTA6DQo+ID4+ICsgICAgbWF4SXRl
bXM6IDENCj4gPg0KPiA+DQo+ID4gQm90aCBwaW5jdHJsIHByb3BlcnRpZXMgYXJlIHVzdWFsbHkg
cmVkdW5kYW50IGhlcmUuIERvZXMgeW91ciBkcml2ZXINCj4gPiBhY3R1YWxseSByZXF1aXJlIHRo
ZW0/DQo+IA0KPiBBbmQgbm93IEkgY2hlY2tlZCBhbmQgSSBkbyBub3Qgc2VlIGRpcmVjdCB1c2Fn
ZSBpbiB0aGUgZHJpdmVyIG9yIGRpZCBJDQo+IG1pc3Mgc29tZXRoaW5nPw0KDQpBY2tub3dsZWRn
ZWQuIFdpbGwgZHJvcCBgcGluY3RybC1uYW1lc2AgYW5kIGBwaW5jdHJsLTBgIGluIHRoZSBuZXh0
IHZlcnNpb24uDQpUaGFua3MgZm9yIHRoZSByZXZpZXcuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywN
Cj4gS3J6eXN6dG9mDQoNCkJlc3QgcmVnYXJkcywNClBldA0K
