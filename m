Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68687A03B8A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 10:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ADE710E3C9;
	Tue,  7 Jan 2025 09:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="jyQ77eye";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Tue, 07 Jan 2025 09:52:40 UTC
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF2410E3C9
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 09:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iC/khAIGFgbZryOpoc5cvfSlJ3cQSi6ZZ6ZSMbesFOc=;
 b=jyQ77eyelFWTwXN+tl8PqLFT1m5Mx8IdDo/5n/ggRCSvHgBLOaq7M72c
 KkPEu4VnRI1rdaX2wfiEQV/+K9WfpaUW6L/2gBjDB4QppkYMDnQ49H02e
 gkhdmzj1hEykQTnnT7H/is3E8/HM/HNb1gxzq/dG4rfPSOe5BqdzBb4ki
 pTyS8Bix7/taxPX7QQ2Hjk2E18zjcr4uvpoqE+hbxzl/91dwa/oAAMW3a
 P1fehP/VwN9Lo1wx1KcAa8rtZzdFBwERGPSv4s3Xt4a4w2MEyVO5Gr5C5
 42/FA3SsQdFaPQtrjBRMZdq35apYIQCBzhuPtyuWsvxLBsMU6vufzap6r g==;
X-CSE-ConnectionGUID: 9j9NfaRhSpyZ1QL39actKw==
X-CSE-MsgGUID: 2Hby4CiLS/++woT0JwaRUw==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 07 Jan 2025 17:45:25 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 5079jLcS090695;
 Tue, 7 Jan 2025 17:45:21 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 7 Jan 2025 17:45:21 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Tue, 7 Jan 2025 17:45:21 +0800
From: <Hermes.Wu@ite.com.tw>
To: <colin.i.king@gmail.com>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: RE: drm/bridge: it6505: fix HDCP CTS compare V matching
Thread-Topic: drm/bridge: it6505: fix HDCP CTS compare V matching
Thread-Index: AQHbYObxj+doksLDWEeCilYgEbmJZbMLDpIQ
Date: Tue, 7 Jan 2025 09:45:21 +0000
Message-ID: <fc49c34ef7dd4fbab424a83b28bff870@ite.com.tw>
References: <22e6bda9-bb5b-43a2-b256-64ff789bbf69@gmail.com>
In-Reply-To: <22e6bda9-bb5b-43a2-b256-64ff789bbf69@gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.80.25]
x-tm-snts-smtp: 26A09E3A893C5ACD3D406D3B89C647C622BCA6DC2246212FB45AD5843498F2492002:8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 5079jLcS090695
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

SGkNCg0KPi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQ29saW4gS2luZyAoZ21h
aWwpIDxjb2xpbi5pLmtpbmdAZ21haWwuY29tPiANCj5TZW50OiBUdWVzZGF5LCBKYW51YXJ5IDcs
IDIwMjUgNTozMSBQTQ0KPlRvOiBIZXJtZXMgV3UgKOWQs+S9s+WujykgPEhlcm1lcy5XdUBpdGUu
Y29tLnR3Pg0KPkNjOiBBbmRyemVqIEhhamRhIDxhbmRyemVqLmhhamRhQGludGVsLmNvbT47IE5l
aWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPjsgUm9iZXJ0IEZvc3MgPHJm
b3NzQGtlcm5lbC5vcmc+OyBMYXVyZW50IFBpbmNoYXJ0IDxMYXVyZW50LnBpbmNoYXJ0QGlkZWFz
b25ib2FyZC5jb20+OyBKb25hcyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+OyBKZXJuZWogU2ty
YWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPjsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPlN1YmplY3Q6IHJlOiBkcm0v
YnJpZGdlOiBpdDY1MDU6IGZpeCBIRENQIENUUyBjb21wYXJlIFYgbWF0Y2hpbmcNCj4NCj5IaSwN
Cj4NCj5zdGF0aWMgYW5hbHlzaXMgb24gTGludXgtbmV4dCBoYXMgZm91bmQgYSBwb3RlbnRpYWwg
aXNzdWUgd2l0aCB0aGUgZm9sbG93aW5nIGNvbW1pdDoNCj4NCj5jb21taXQgMDk4OWMwMmM3YTVj
ODg3YzcwZGVhZmVuODBjNjRkMDI5MTYyNGUxYTcNCj5BdXRob3I6IEhlcm1lcyBXdSA8aGVybWVz
Lnd1QGl0ZS5jb20udHc+DQo+RGF0ZTogICBNb24gRGVjIDMwIDE4OjUxOjI2IDIwMjQgKzA4MDAN
Cj4NCj4gICAgIGRybS9icmlkZ2U6IGl0NjUwNTogZml4IEhEQ1AgQ1RTIGNvbXBhcmUgViBtYXRj
aGluZw0KPg0KPg0KPlRoZSBpc3N1ZSBpcyBhcyBmb2xsb3dzOg0KPg0KPlNvdXJjZTogZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2NTA1LmMsIGZ1bmN0aW9uOiANCj5pdDY1MDVfaGRjcF9w
YXJ0Ml9rc3ZsaXN0X2NoZWNrOg0KPg0KPiAgICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgNTsg
aSsrKSB7DQo+ICAgICAgICAgICAgICAgICAgICBpZiAoYnZbaV1bM10gIT0gYXZbaV1bMF0gfHwg
YnZbaV1bMl0gIT0gYXZbaV1bMV0gfHwNCj4gICAgICAgICAgICAgICAgICAgICAgICBhdltpXVsx
XSAhPSBhdltpXVsyXSB8fCBidltpXVswXSAhPSBhdltpXVszXSkNCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGJyZWFrOw0KPg0KPiAgICAgICAgICAgICAgICAgICAgIERSTV9ERVZfREVC
VUdfRFJJVkVSKGRldiwgIlYnIGFsbCBtYXRjaCEhICVkLCAlZCIsIHJldHJ5LCBpKTsNCj4gICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gdHJ1ZTsNCj4gICAgICAgICAgICAgfQ0KDQpJdCBzaG91
bGQgY2hlY2sgaWYgdGhlIGZvciBsb29wIHJlYWNoIGkgPT0gNCBiZWZvcmUgcmV0dXJuIHRydWUu
DQoNCkkgd2lsbCBmaXggaXQsDQoNCnRoYW5rcw0KDQo+DQo+aW4gdGhlIGFib3ZlIGZvci1sb29w
LCBvbmx5IGl0ZXJhdGlvbiB3aXRoIGkgPSAwIGlzIHBlcmZvcm1lZCwgZWl0aGVyIA0KPnRoZSBp
ZiBzdGF0ZW1lbnQgYnJlYWtzIG91dCBvZiB0aGUgbG9vcCBpZiB0aGUgY29uZGl0aW9uIGlzIHRy
dWUgb3INCj53ZSByZWFjaCB0aGUgcmV0dXJuIHRydWUgc3RhdGVtZW50LiBCb3RoIGNvbmRpdGlv
bnMgbWVhbnMgdGhlIGxvb3AgaXMgDQo+bmV2ZXIgaXRlcmF0ZWQsIHlldCB0aGUgbG9vcCBpcyBl
eHBlY3RlZCB0byBpdGVyYXRlIGZvciA1IHRpbWVzLiBUaGlzIA0KPmxvb2tzIGluY29ycmVjdC4N
Cj4NCj5Db2xpbg0KPg0KDQo+DQo+DQoNCg0K
