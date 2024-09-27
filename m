Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568DF987D1E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 04:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C498F10E165;
	Fri, 27 Sep 2024 02:43:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="XhTN6W4x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F4F10E165
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 02:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Lwf3P6va+gVszf5qvbNi34sXiYETmSHL4RWbASeqUYk=;
 b=XhTN6W4xvus9yhmyTfwTrCqNxtcY1Jxs2dWJ3A0JQwa6emisLJTKAk8W
 Uop4u6VEf7pRK0eLFpNMML/siMIQ6G+2KZz71qx33e2HW1XkE//KtNoYy
 Rj0sj8FwNzJp+Uuk2W/4D+wbbfTY8yLDFs79MSdwwBceTUSuR9kcrVbGx
 Oj1885RkKrkYM2D4lXdYrmhp795mgt7IeWxn/LLeV2tshMX97UvYEFSfN
 785rlXrkgjGZc5cwgNq1Yub4q88OHPDd6ftjV2oCuBd/Mxq3LEv/KqpcK
 +lRpvdfugDrWvWzN3rfdV9IeGIcst0VvTPRVob/IjJO/LDDD1b7G7Dzk6 w==;
X-CSE-ConnectionGUID: QfmD+VwqSKGTDtTjtuayxQ==
X-CSE-MsgGUID: Z0njbKlrSIiXfUDpDcuibQ==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 27 Sep 2024 10:43:38 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 48R2ha6S068294;
 Fri, 27 Sep 2024 10:43:36 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 10:43:36 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Fri, 27 Sep 2024 10:43:36 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@linaro.org>
CC: <Kenneth.Hung@ite.com.tw>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <angelogioacchino.delregno@collabora.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4 11/11] drm/bridge: it6505: Add aux i2c functionality
Thread-Topic: [PATCH v4 11/11] drm/bridge: it6505: Add aux i2c functionality
Thread-Index: AQHbEBO1ekLF5lt4CE2fUcKn87WKxrJq51Pw
Date: Fri, 27 Sep 2024 02:43:36 +0000
Message-ID: <4360d5a8c4e54540831eca77ca9156f5@ite.com.tw>
References: <20240926075134.22394-1-Hermes.Wu@ite.com.tw>
 <20240926075134.22394-2-Hermes.Wu@ite.com.tw>
 <loulf3p74x3p6dinublo6xenwjoyssm2f5rk5g3env54abhath@37i4vlvxjn3f>
In-Reply-To: <loulf3p74x3p6dinublo6xenwjoyssm2f5rk5g3env54abhath@37i4vlvxjn3f>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [223.136.245.213]
x-tm-snts-smtp: 72BD66C015AD7BF67FD6A935D47FDFEC4BB007F0EBCC667715C9FDDDEAE3C5C52002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 48R2ha6S068294
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

DQo+LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj5Gcm9tOiBEbWl0cnkgQmFyeXNoa292IDxk
bWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IA0KPlNlbnQ6IFRodXJzZGF5LCBTZXB0ZW1iZXIg
MjYsIDIwMjQgODo1OCBQTQ0KPlRvOiBIZXJtZXMgV3UgKKdkqM6nuykgPEhlcm1lcy5XdUBpdGUu
Y29tLnR3Pg0KPkNjOiBLZW5uZXRoIEh1bmcgKKx4rmGt2ykgPEtlbm5ldGguSHVuZ0BpdGUuY29t
LnR3PjsgQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRlbC5jb20+OyBOZWlsIEFybXN0
cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz47IFJvYmVydCBGb3NzIDxyZm9zc0BrZXJu
ZWwub3JnPjsgTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPjsgSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPjsgSmVybmVqIFNrcmFiZWMgPGpl
cm5lai5za3JhYmVjQGdtYWlsLmNvbT47IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+
OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT47IERhdmlkIEFpcmxpZSA8
YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxzaW1vbmFAZmZ3bGwuY2g+OyBBbmdl
bG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJv
cmEuY29tPjsgQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3Pjsgb3BlbiBsaXN0OkRS
TSBEUklWRVJTIDxkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPjsgb3BlbiBsaXN0IDxs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPg0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggdjQgMTEv
MTFdIGRybS9icmlkZ2U6IGl0NjUwNTogQWRkIGF1eCBpMmMgZnVuY3Rpb25hbGl0eQ0KPg0KPk9u
IFRodSwgU2VwIDI2LCAyMDI0IGF0IDAzOjUxOjM0UE0gR01ULCBIZXJtZXMgV3Ugd3JvdGU6DQo+
PiBGcm9tOiBIZXJtZXMgV3UgPEhlcm1lcy53dUBpdGUuY29tLnR3Pg0KPj4gDQo+PiBBZGQgYXV4
LWkyYyBvcGVyYWN0aW9uIGluIG9yZGVyIHRvIHN1cHBvcnQgdGhlIE1DQ1MgZnVuY3Rpb24uDQo+
DQo+QnJldml0eSBpcyB0aGUgc291bCBvZiB3aXQuIEhvd2V2ZXIgaW4gdGhlIGNvbW1pdCBtZXNz
YWdlIHdlIGFwcHJlY2lhdGUgbW9yZSBkZXRhaWxzLiBJcyBpdCBlbm91Z2ggdG8gZ2V0IG1vbml0
b3IgY29udHJvbCB0byB3b3JrPyBPciBpcyB0aGVyZSBhbnl0aGluZyBsZWZ0IHRvIGJlIGltcGxl
bWVudGVkPw0KDQpJbiBkcm1fZHBfaGVscGVyLCBkcm1fZHBfaTJjX3hmZXIoKSBwYWNrIEkyQyBy
ZXF1ZXN0IGludG8gc2VxdWVuY2Ugb2YgQVVYIHJlcXVlc3QuDQppdDY1MDVfYXV4X2kyY19vcGVy
YXRpb24oKSBpcyBpbXBsZW1lbnQgdG8gbWF0Y2ggZHJtX2RwX2kyY194ZmVyKCkgYmVoYXZpb3Ig
DQoNCj4+IA0KPj4gDQo+PiBGaXhlczogYjVjODRhOWVkY2Q0ICgiZHJtL2JyaWRnZTogYWRkIGl0
NjUwNSBkcml2ZXIiKQ0KPg0KPlRoaXMgaXMgZGVmaW5pdGVseSBub3QgYSBmaXguDQoNCndpbGwg
cmVtb3ZlLg0KDQo+PiBTaWduZWQtb2ZmLWJ5OiBIZXJtZXMgV3UgPEhlcm1lcy53dUBpdGUuY29t
LnR3Pg0KPj4gLS0tDQo+PiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2NTA1LmMgfCAx
NzcgDQo+PiArKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDE3NSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPg0KPi0tDQo+V2l0aCBiZXN0IHdp
c2hlcw0KPkRtaXRyeQ0KPg0KQlIsDQpIZXJtZXMNCg==
