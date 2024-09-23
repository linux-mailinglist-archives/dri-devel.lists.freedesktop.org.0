Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2DE97EA12
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 12:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645E110E3DA;
	Mon, 23 Sep 2024 10:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="PIGWxJ0+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13C4810E3DA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 10:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yoBs70lI0nw+Cn15PKnMkP3pkXySdBMC1A7392unMcs=;
 b=PIGWxJ0+3dVVT6kgzUzdSSMm4B6beUiF/4JTM4U0LFhwbcTD1zlHeE9V
 Wen1qb1pKI1xVhoymA06dRNRRof2M2tHhdWh+sdzfoCIs8ubpM3cBkXhU
 /kOEABRCi81k2BNGS2hnOfIly8+6V/xex2Ls8AjwVB38sA+OsE7/9tu3j
 /alqGX+tBg40yVyHNeS0TXpeVvC+HfaKamJxuKEmh43+MQxR4hSx892I3
 f1nwida7rh0EJ9MKdvZjJlhgF3/MhIkkV/Ge6ZQcGg5xXh8voM4Ny/T3R
 qg9MCIq8panYJKCBJEtksWXTDfs7JZ3r/5CgKe0cJbs7N1Ln3TsTvCqCC A==;
X-CSE-ConnectionGUID: 1BS8BjG9Qfm952M928ZQIw==
X-CSE-MsgGUID: zeOnaio9SFq42SvrI1QCrg==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 23 Sep 2024 18:45:54 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48NAjm15039260;
 Mon, 23 Sep 2024 18:45:48 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 18:45:49 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Mon, 23 Sep 2024 18:45:49 +0800
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
Thread-Index: AQHbDaFxMxnMHj2GkEGHdgKCDl4eaLJlMDIw
Date: Mon, 23 Sep 2024 10:45:49 +0000
Message-ID: <a0a8f862018b4c9aa689672551e7a492@ite.com.tw>
References: <20240923094826.13471-1-Hermes.Wu@ite.com.tw>
 <20240923094826.13471-3-Hermes.Wu@ite.com.tw>
 <4viir5prnuvpp76npblwmdrwlttm5daumvdnocipdsn6geyxvf@2yfcytjb3ono>
In-Reply-To: <4viir5prnuvpp76npblwmdrwlttm5daumvdnocipdsn6geyxvf@2yfcytjb3ono>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.20.82]
x-tm-snts-smtp: 4A944F3EAC0BF5D4DDFF7121E9A65BB68B7D77BDF3D758EC36039E013E91850C2002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 48NAjm15039260
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

Pk9uIE1vbiwgU2VwIDIzLCAyMDI0IGF0IDA1OjQ4OjI4UE0gR01ULCBIZXJtZXMgV3Ugd3JvdGU6
DQo+PiBGcm9tOiBIZXJtZXMgV3UgPEhlcm1lcy53dUBpdGUuY29tLnR3Pg0KPj4gDQo+PiBDaGFu
Z2VzIGluIHYzOg0KPj4gIC1hZGQgZGV0aWFscyBhYm91dCBmYWlsIGl0ZW0gYW5kIGNoYW5nZXMu
DQo+PiANCj4+IA0KPj4gRml4IEhEQ1AgQ1RTIGZhaWwgaXRlbXMgb24gVU5JR1JBRiBEUlAtMTAw
DQo+PiANCj4+IERVVCBtdXN0IFN1cHBvcnQgMTI3IGRldmljZXMuDQo+PiBEVVQgbXVzdCBjaGVj
ayBCU1RBVFVTIHdoZW4gcmVjZWl2ZSBDUF9JUlEuDQo+PiBEVVQgbXVzdCBlbmFibGUgZW5jcnlw
dGlvbiB3aGVuIFIwJyBpcyByZWFkeS4NCj4+IERVVCBtdXN0IHJldHJ5IFYnIGNoZWNrIDMgdGlt
ZXMuDQo+PiBpdDY1MDUgbXVzdCByZWFkIERSUC0xMDAgS1NWIEZJRk8gYnkgRklGTyBtb2RlLg0K
Pj4gaXQ2NTA1IHNob3VsZCByZXN0YXJ0IEhEQ1Agd2l0aGluIDVzIGlmIEtTViBub3QgcmVhZHku
DQo+DQo+U3RpbGwgbm90IHJlYWRhYmxlLg0KPg0KPkVuZ2xpc2ggdGV4dCwgcGxlYXNlLiBTcGxp
dCB0aGUgcGF0Y2ggdG8gZml4IG9uZSBpc3N1ZSBhdCBhIHRpbWUuDQo+RGVzY3JpYmUgdGhlIF9y
ZWFzb25fIGZvciB0aGUgY2hhbmdlLiBBbm5vdGF0ZSBmaXhlcyB3aXRoIEZpeGVzIHRhZ3MuDQo+
DQoNCndpdGggZml4ZXMgdGFnIGluY2x1ZGUgZHJtL2JyaWRnZSBsaWtlIHRoaXMgPyAgPT4gIkZp
eGVzOiBkcm0vYnJpZGdlOiBpdDY1MDU6IEhEQ1AgQ1RTIGZhaWwgMUIteHgiDQoNCkFib3V0IHRo
ZSByZWFzb24gYWJvdXQgYnVnIGZpeGVzLiANCg0KZm9yIGV4YW1wbGUsIHRoZSAxQi0wMSBkZXZp
Y2UgY291bnQuDQp3aWxsIHRoaXMgcmVhZGFibGU/DQoNCiIgV2hlbiBjb25uZWN0IHRvIEhEQ1Ag
cmVwZWF0ZXIsIGl0NjUwNSBtdXN0IHN1cHBvcnQgMTI3IGRvd25zdHJlYW0gZGV2aWNlcy4gIg0K
DQpBbmQgdGhpcyB3aWxsIGJlIG9ubHkgb25lIGNoYW5nZSBpbiBhIHBhdGNoPw0KDQo+PiANCj4+
IFNpZ25lZC1vZmYtYnk6IEhlcm1lcyBXdSA8SGVybWVzLnd1QGl0ZS5jb20udHc+DQo+PiAtLS0N
Cj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYyB8IDExMiArKysrKysrKysr
KysrKysrKystLS0tLS0tLS0tDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKyks
IDM4IGRlbGV0aW9ucygtKQ0KPg0KPi0tIA0KPldpdGggYmVzdCB3aXNoZXMNCj5EbWl0cnkNCg0K
QlIsDQpIZXJtZXMNCg==
