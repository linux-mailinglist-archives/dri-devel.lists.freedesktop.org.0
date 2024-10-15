Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 100F499DCE2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 05:37:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF67210E24D;
	Tue, 15 Oct 2024 03:37:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="Ltzr4+49";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.hinet-ip.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE7110E24D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 03:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jLtqRmFOXsosgzcl176AS8v88A6ovPMkeBAynDm7N0U=;
 b=Ltzr4+49BhY1v88NhP3o1K1KvAwcqC8qarc65/YeSe7bp6/dsI04Ktod
 u0GlvOnm0wniv6NDQAOB+vRrzV8apBmSJxMkl1kWipRDNthF2l5vbxuNL
 YSs5y430mKiyAg8Bzavi8noKHHJ/5vBpEEH+lY+p/BqektqrxTrBQQpla
 V/dmtpOKV7pTw2oogHEC7nVAXCkLPA8QWGRSsh7ghWwHpIy68flo4h8+W
 hVwLUyie/OUkxoy4LJb41PjADuksUUQBJfkO6q3LaRp7P6h+MyJMLEhpU
 dyQReoMZDk9ZbcHHbarHZSRbotdK0RLjzrhfob4jE2a0d8ZVK0rEbAWVI w==;
X-CSE-ConnectionGUID: J2rbLjBfTKi0rtz1JDn1XQ==
X-CSE-MsgGUID: ST/UQ08JQtylCEvgAh6PxA==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 15 Oct 2024 11:37:47 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 49F3bhUf088712;
 Tue, 15 Oct 2024 11:37:43 +0800 (GMT-8)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 11:37:43 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.039; Tue, 15 Oct 2024 11:37:43 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@linaro.org>
CC: <treapking@chromium.org>, <Kenneth.Hung@ite.com.tw>, <Pet.Weng@ite.com.tw>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>,
 <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v5 03/10] drm/bridge: it6505: add AUX operation for HDCP
 KSV list read
Thread-Topic: [PATCH v5 03/10] drm/bridge: it6505: add AUX operation for HDCP
 KSV list read
Thread-Index: AQHbHi+d/bDllKGy+0WTjIwt9GphD7KHKDwg
Date: Tue, 15 Oct 2024 03:37:43 +0000
Message-ID: <a79d25e86e81491baf39bf6c6223c78e@ite.com.tw>
References: <20241001064305.32180-1-Hermes.Wu@ite.com.tw>
 <20241001064305.32180-4-Hermes.Wu@ite.com.tw>
 <2nceoodtqfspaxs5ipmrezivknexqwi4yc4mr4lak6yjgowpz5@evhz3vy45lb4>
In-Reply-To: <2nceoodtqfspaxs5ipmrezivknexqwi4yc4mr4lak6yjgowpz5@evhz3vy45lb4>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.80.25]
x-tm-snts-smtp: EC346550A66C7D49A5FFB11D632EE07DCBCF24DE5A21707F72B5C84646A0563A2002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 49F3bhUf088712
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
bWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+IA0KPlNlbnQ6IE1vbmRheSwgT2N0b2JlciAxNCwg
MjAyNCA3OjUzIFBNDQo+VG86IEhlcm1lcyBXdSAop2Sozqe7KSA8SGVybWVzLld1QGl0ZS5jb20u
dHc+DQo+Q2M6IFBpbi15ZW4gTGluIDx0cmVhcGtpbmdAY2hyb21pdW0ub3JnPjsgS2VubmV0aCBI
dW5nICiseK5hrdspIDxLZW5uZXRoLkh1bmdAaXRlLmNvbS50dz47IFBldCBXZW5nICivzqXJquIp
IDxQZXQuV2VuZ0BpdGUuY29tLnR3PjsgQW5kcnplaiBIYWpkYSA8YW5kcnplai5oYWpkYUBpbnRl
bC5jb20+OyBOZWlsIEFybXN0cm9uZyA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz47IFJvYmVy
dCBGb3NzIDxyZm9zc0BrZXJuZWwub3JnPjsgTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tPjsgSm9uYXMgS2FybG1hbiA8am9uYXNAa3dpYm9vLnNlPjsg
SmVybmVqIFNrcmFiZWMgPGplcm5lai5za3JhYmVjQGdtYWlsLmNvbT47IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJkIDxt
cmlwYXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxzaW1v
bmFAZmZ3bGwuY2g+OyBvcGVuIGxpc3Q6RFJNIERSSVZFUlMgPGRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmc+OyBvcGVuIGxpc3QgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+DQo+
U3ViamVjdDogUmU6IFtQQVRDSCB2NSAwMy8xMF0gZHJtL2JyaWRnZTogaXQ2NTA1OiBhZGQgQVVY
IG9wZXJhdGlvbiBmb3IgSERDUCBLU1YgbGlzdCByZWFkDQo+DQo+T24gVHVlLCBPY3QgMDEsIDIw
MjQgYXQgMDI6NDM6MDJQTSArMDgwMCwgSGVybWVzIFd1IHdyb3RlOg0KPj4gRnJvbTogSGVybWVz
IFd1IDxIZXJtZXMud3VAaXRlLmNvbS50dz4NCj4+IA0KPj4gSERDUCBLU1YgbGlzdCByZWFkYmFj
ayBjYW4gY2hvb3NlIHRvIHVzZSBBVVggRklGTyBvciBnZW5lcmFsIGRhdGEgcmVnaXN0ZXIuDQo+
PiBGb3Igc29tZSBEaXNwbGF5UG9ydCBkZXZpY2VzLCB0aGUgS1NWIGxpc3QgbXVzdCBiZSByZWFk
IGluIDUgYnl0ZSBib3VuZGFyaWVzLg0KPj4gVGhlIG9yaWdpbmFsIEFVWCByZWFkIGNvbW1hbmQg
ZG9lcyBub3Qgc3VwcG9ydCB0aGVzZSBkZXZpY2VzLg0KPj4gDQo+PiBUaGUgQVVYIGNvbW1hbmQg
b3BlcmF0aW9uIGNvbnRyb2wgcmVnaXN0ZXIgIlJFR19BVVhfQ01EX1JFUSIgdXNlcyBiWzM6MF0g
YXMgQVVYIG9wZXJhY2lvbiBjb250cm9sLCBhbmQgYls3OjRdIGFyZSBzdGF0dXMgYml0cyBhbmQg
cmVhZCBvbmx5Lg0KPj4gVG8gY2hhbmdlIEtTViByZWFkIG9wZXJhdGlvbiB1c2VzICJDTURfQVVY
X05BVElWRV9SRUFEIiBmcm9tIHVzaW5nIHRoZSBkYXRhIHJlZ2lzdGVycyB0byB1c2luZyBBVVgg
RklGTy4NCj4+IFRoZSBleHRlbmRlZCBjb21tYW5kICJDTURfQVVYX0dFVF9LU1ZfTElTVCIgaXMg
YWRkZWQgYXMgIkNNRF9BVVhfTkFUSVZFX1JFQUQiIHdpdGggdGhlIDB4MTAgZmxhZyB3aGljaCBz
ZWxlY3RzIEFVWCBGSUZPIG1vZGUuDQo+DQo+UGxlYXNlIGtlZXAgdGhlIGNvbW1pdCBtZXNzYWdl
IHdyYXBwZWQgYXQgNzItNzUgY2hhcnMuDQo+DQo+T3RoZXIgdGhhbiB0aGF0Og0KDQpTaG91bGQg
SSBzZW5kIG5ldyB2NiBwYXRjaGVzIHdpdGggY29tbWl0IG1lc3NhZ2Ugd3JhcHBlZCBhdCA3Mi03
NSBjaGFycz8NCg0KVGhhbmtzLg0KPg0KPlJldmlld2VkLWJ5OiBEbWl0cnkgQmFyeXNoa292IDxk
bWl0cnkuYmFyeXNoa292QGxpbmFyby5vcmc+DQo+DQo+DQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6
IEhlcm1lcyBXdSA8SGVybWVzLnd1QGl0ZS5jb20udHc+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2dw
dS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYyB8IDE2ICsrKysrKysrKysrLS0tLS0NCj4+ICAxIGZp
bGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+IA0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jIA0KPj4gYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYw0KPj4gaW5kZXggODY0ZmFiN2UzODhmLi45
YTAyMmMwOTVhZjQgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1p
dDY1MDUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2NTA1LmMNCj4+
IEBAIC0xMjYsNiArMTI2LDcgQEANCj4+ICAjZGVmaW5lIFJFR19BVVhfT1VUX0RBVEEwIDB4MjcN
Cj4+ICANCj4+ICAjZGVmaW5lIFJFR19BVVhfQ01EX1JFUSAweDJCDQo+PiArI2RlZmluZSBNX0FV
WF9SRVFfQ01EIDB4MEYNCj4+ICAjZGVmaW5lIEFVWF9CVVNZIEJJVCg1KQ0KPj4gIA0KPj4gICNk
ZWZpbmUgUkVHX0FVWF9EQVRBXzBfNyAweDJDDQo+PiBAQCAtMzI0LDYgKzMyNSw5IEBAIGVudW0g
YXV4X2NtZF90eXBlIHsNCj4+ICAJQ01EX0FVWF9OQVRJVkVfUkVBRCA9IDB4MCwNCj4+ICAJQ01E
X0FVWF9OQVRJVkVfV1JJVEUgPSAweDUsDQo+PiAgCUNNRF9BVVhfSTJDX0VESURfUkVBRCA9IDB4
QiwNCj4+ICsNCj4+ICsJLyogS1NWIHJlYWQgd2l0aCBBVVggRklGTyBleHRlbmQgZnJvbSBDTURf
QVVYX05BVElWRV9SRUFEKi8NCj4+ICsJQ01EX0FVWF9HRVRfS1NWX0xJU1QgPSAweDEwLA0KPj4g
IH07DQo+PiAgDQo+PiAgZW51bSBhdXhfY21kX3JlcGx5IHsNCj4+IEBAIC05NjUsNyArOTY5LDgg
QEAgc3RhdGljIHNzaXplX3QgaXQ2NTA1X2F1eF9vcGVyYXRpb24oc3RydWN0IGl0NjUwNSAqaXQ2
NTA1LA0KPj4gIAlpdDY1MDVfc2V0X2JpdHMoaXQ2NTA1LCBSRUdfQVVYX0NUUkwsIEFVWF9VU0VS
X01PREUsIEFVWF9VU0VSX01PREUpOw0KPj4gIA0KPj4gIGF1eF9vcF9zdGFydDoNCj4+IC0JaWYg
KGNtZCA9PSBDTURfQVVYX0kyQ19FRElEX1JFQUQpIHsNCj4+ICsJLyogSFcgQVVYIEZJRk8gc3Vw
cG9ydHMgb25seSBFRElEIGFuZCBEQ1BEIEtTViBGSUZPIGFyZWEgKi8NCj4+ICsJaWYgKGNtZCA9
PSBDTURfQVVYX0kyQ19FRElEX1JFQUQgfHwgY21kID09IENNRF9BVVhfR0VUX0tTVl9MSVNUKSB7
DQo+PiAgCQkvKiBBVVggRURJRCBGSUZPIGhhcyBtYXggbGVuZ3RoIG9mIEFVWF9GSUZPX01BWF9T
SVpFIGJ5dGVzLiAqLw0KPj4gIAkJc2l6ZSA9IG1pbl90KHNpemVfdCwgc2l6ZSwgQVVYX0ZJRk9f
TUFYX1NJWkUpOw0KPj4gIAkJLyogRW5hYmxlIEFVWCBGSUZPIHJlYWQgYmFjayBhbmQgY2xlYXIg
RklGTyAqLyBAQCAtOTk2LDcgKzEwMDEsNyBAQCANCj4+IHN0YXRpYyBzc2l6ZV90IGl0NjUwNV9h
dXhfb3BlcmF0aW9uKHN0cnVjdCBpdDY1MDUgKml0NjUwNSwNCj4+ICAJCQkJICBzaXplKTsNCj4+
ICANCj4+ICAJLyogQXV4IEZpcmUgKi8NCj4+IC0JaXQ2NTA1X3dyaXRlKGl0NjUwNSwgUkVHX0FV
WF9DTURfUkVRLCBjbWQpOw0KPj4gKwlpdDY1MDVfd3JpdGUoaXQ2NTA1LCBSRUdfQVVYX0NNRF9S
RVEsIEZJRUxEX0dFVChNX0FVWF9SRVFfQ01ELCANCj4+ICtjbWQpKTsNCj4+ICANCj4+ICAJcmV0
ID0gaXQ2NTA1X2F1eF93YWl0KGl0NjUwNSk7DQo+PiAgCWlmIChyZXQgPCAwKQ0KPj4gQEAgLTEw
MzAsNyArMTAzNSw3IEBAIHN0YXRpYyBzc2l6ZV90IGl0NjUwNV9hdXhfb3BlcmF0aW9uKHN0cnVj
dCBpdDY1MDUgKml0NjUwNSwNCj4+ICAJCWdvdG8gYXV4X29wX3N0YXJ0Ow0KPj4gIAl9DQo+PiAg
DQo+PiAtCWlmIChjbWQgPT0gQ01EX0FVWF9JMkNfRURJRF9SRUFEKSB7DQo+PiArCWlmIChjbWQg
PT0gQ01EX0FVWF9JMkNfRURJRF9SRUFEIHx8IGNtZCA9PSBDTURfQVVYX0dFVF9LU1ZfTElTVCkg
ew0KPj4gIAkJZm9yIChpID0gMDsgaSA8IHNpemU7IGkrKykgew0KPj4gIAkJCXJldCA9IGl0NjUw
NV9yZWFkKGl0NjUwNSwgUkVHX0FVWF9EQVRBX0ZJRk8pOw0KPj4gIAkJCWlmIChyZXQgPCAwKQ0K
Pj4gQEAgLTEwNTUsNyArMTA2MCw3IEBAIHN0YXRpYyBzc2l6ZV90IGl0NjUwNV9hdXhfb3BlcmF0
aW9uKHN0cnVjdCBpdDY1MDUgKml0NjUwNSwNCj4+ICAJcmV0ID0gaTsNCj4+ICANCj4+ICBhdXhf
b3BfZXJyOg0KPj4gLQlpZiAoY21kID09IENNRF9BVVhfSTJDX0VESURfUkVBRCkgew0KPj4gKwlp
ZiAoY21kID09IENNRF9BVVhfSTJDX0VESURfUkVBRCB8fCBjbWQgPT0gQ01EX0FVWF9HRVRfS1NW
X0xJU1QpIHsNCj4+ICAJCS8qIGNsZWFyIEFVWCBGSUZPICovDQo+PiAgCQlpdDY1MDVfc2V0X2Jp
dHMoaXQ2NTA1LCBSRUdfQVVYX0NUUkwsDQo+PiAgCQkJCUFVWF9FTl9GSUZPX1JFQUQgfCBDTFJf
RURJRF9GSUZPLCBAQCAtMTA3Niw3ICsxMDgxLDggQEAgc3RhdGljIA0KPj4gc3NpemVfdCBpdDY1
MDVfYXV4X2RvX3RyYW5zZmVyKHN0cnVjdCBpdDY1MDUgKml0NjUwNSwNCj4+ICAJCQkJICAgICAg
c2l6ZV90IHNpemUsIGVudW0gYXV4X2NtZF9yZXBseSAqcmVwbHkpICB7DQo+PiAgCWludCBpLCBy
ZXRfc2l6ZSwgcmV0ID0gMCwgcmVxdWVzdF9zaXplOw0KPj4gLQlpbnQgZmlmb19tYXhfc2l6ZSA9
IChjbWQgPT0gQ01EX0FVWF9JMkNfRURJRF9SRUFEKSA/IEFVWF9GSUZPX01BWF9TSVpFIDogNDsN
Cj4+ICsJaW50IGZpZm9fbWF4X3NpemUgPSAoY21kID09IENNRF9BVVhfSTJDX0VESURfUkVBRCB8
fCBjbWQgPT0gQ01EX0FVWF9HRVRfS1NWX0xJU1QpID8NCj4+ICsJCQkJCQkgQVVYX0ZJRk9fTUFY
X1NJWkUgOiA0Ow0KPj4gIA0KPj4gIAltdXRleF9sb2NrKCZpdDY1MDUtPmF1eF9sb2NrKTsNCj4+
ICAJaSA9IDA7DQo+PiAtLQ0KPj4gMi4zNC4xDQo+PiANCj4NCj4tLSANCj5XaXRoIGJlc3Qgd2lz
aGVzDQo+RG1pdHJ5DQo+DQo+DQpCUiwNCkhlcm1lcw0K
