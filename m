Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E00F7B7EC23
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8C9410E11C;
	Wed, 17 Sep 2025 08:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ite.com.tw header.i=@ite.com.tw header.b="jz+Yk8Cj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Wed, 17 Sep 2025 08:44:26 UTC
Received: from ironport.ite.com.tw
 (hc210-202-87-179.vdslpro.static.apol.com.tw [210.202.87.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6EC210E01F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 08:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ite.com.tw; s=dkim;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uxBFVKjbEbZCiSpx1rRheoAljbpYBWNMtM/cAVNoRZk=;
 b=jz+Yk8CjCUVweSWKwfPbuKeHGBEGq0cyN1+sCdQXMfNQpNtWjlwySK0O
 e8+2iTzqfNF+WiVdGJaenH+S/QAIuKNVburqfKznskNWf56ve8Y2Lc/PD
 h5zfE96xSPpB1TGwGTXDUPN9UwXeBLtUnKMg0TMqk0vCd/Wm7iquZhUlm
 lPhVnx6uIeB9tWbPARJSVOWzE6uXynhq+y8wqMpHG5Zh8c2yIgBXMjvQk
 D13uN6YrXvbsaSLzK4CRDMOh64aZYjsYFACEzPQ71KH473+ub0+kj2BiQ
 yqiZtOqms1XUa3B3gWFN9WSYFfvCklzzqQNc4yOJmhd9Brs+ljkmeXA1J g==;
X-CSE-ConnectionGUID: rTIc4Jm2SeOZIvDHiqoghw==
X-CSE-MsgGUID: T8sClVAsR2uNgKLDlmiqew==
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 17 Sep 2025 16:37:14 +0800
Received: from tpemail1.internal.ite.com.tw (TPEMAIL1.internal.ite.com.tw
 [192.168.15.58]) by mse.ite.com.tw with ESMTP id 58H8bB5r009953;
 Wed, 17 Sep 2025 16:37:11 +0800 (+08)
 (envelope-from Hermes.Wu@ite.com.tw)
Received: from TPEMAIL1.internal.ite.com.tw (192.168.15.58) by
 TPEMAIL1.internal.ite.com.tw (192.168.15.58) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 17 Sep 2025 16:37:10 +0800
Received: from TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68]) by
 TPEMAIL1.internal.ite.com.tw ([fe80::dd6d:92:8773:b68%6]) with mapi id
 15.01.2507.057; Wed, 17 Sep 2025 16:37:10 +0800
From: <Hermes.Wu@ite.com.tw>
To: <dmitry.baryshkov@oss.qualcomm.com>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <Pet.Weng@ite.com.tw>, <Kenneth.Hung@ite.com.tw>,
 <treapking@chromium.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH RESEND v3 3/5] drm/bridge: it6505: modify DP link auto
 training
Thread-Topic: [PATCH RESEND v3 3/5] drm/bridge: it6505: modify DP link auto
 training
Thread-Index: AQHcJvd5Bwy3giHvg0iNa1I4iaXApbSXBG2w
Date: Wed, 17 Sep 2025 08:37:10 +0000
Message-ID: <b1d7dcc0ad6e40309677058f8affa5a5@ite.com.tw>
References: <20250916-fix-link-training-v3-0-0f55bfdb272a@ite.com.tw>
 <20250916-fix-link-training-v3-3-0f55bfdb272a@ite.com.tw>
 <2bk6t2uibhbqtreavimigffzp746rnui4ohqk6sxcpolf4skjh@ddyma4omo6k7>
In-Reply-To: <2bk6t2uibhbqtreavimigffzp746rnui4ohqk6sxcpolf4skjh@ddyma4omo6k7>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.80.57]
x-tm-snts-smtp: A3A916203B4FA56D2128D82BA9C1B886EB1F00AE70EF3B3E15ACD34E4ABCA15F2002:8
Content-Type: text/plain; charset="big5"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MAIL: mse.ite.com.tw 58H8bB5r009953
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
bWl0cnkuYmFyeXNoa292QG9zcy5xdWFsY29tbS5jb20+IA0KPlNlbnQ6IFR1ZXNkYXksIFNlcHRl
bWJlciAxNiwgMjAyNSA2OjQ5IFBNDQo+VG86IEhlcm1lcyBXdSAop2Sozqe7KSA8SGVybWVzLld1
QGl0ZS5jb20udHc+DQo+Q2M6IEFuZHJ6ZWogSGFqZGEgPGFuZHJ6ZWouaGFqZGFAaW50ZWwuY29t
PjsgTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+OyBSb2JlcnQgRm9z
cyA8cmZvc3NAa2VybmVsLm9yZz47IExhdXJlbnQgUGluY2hhcnQgPExhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT47IEpvbmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT47IEplcm5l
aiBTa3JhYmVjIDxqZXJuZWouc2tyYWJlY0BnbWFpbC5jb20+OyBNYWFydGVuIExhbmtob3JzdCA8
bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPjsgTWF4aW1lIFJpcGFyZCA8bXJpcGFy
ZEBrZXJuZWwub3JnPjsgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+OyBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAZ21haWwuY29tPjsgU2ltb25hIFZldHRlciA8c2ltb25hQGZm
d2xsLmNoPjsgUGV0IFdlbmcgKK/Opcmq4ikgPFBldC5XZW5nQGl0ZS5jb20udHc+OyBLZW5uZXRo
IEh1bmcgKKx4rmGt2ykgPEtlbm5ldGguSHVuZ0BpdGUuY29tLnR3PjsgdHJlYXBraW5nQGNocm9t
aXVtLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZw0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggUkVTRU5EIHYzIDMvNV0gZHJtL2Jy
aWRnZTogaXQ2NTA1OiBtb2RpZnkgRFAgbGluayBhdXRvIHRyYWluaW5nDQo+DQo+T24gVHVlLCBT
ZXAgMTYsIDIwMjUgYXQgMTI6NDc6NDNQTSArMDgwMCwgSGVybWVzIFd1IHZpYSBCNCBSZWxheSB3
cm90ZToNCj4+IEZyb206IEhlcm1lcyBXdSA8SGVybWVzLnd1QGl0ZS5jb20udHc+DQo+PiANCj4+
IElUNjUwNSBzdXBwb3J0cyBIVyBsaW5rIHRyYWluaW5nIHdoaWNoIHdpbGwgd3JpdGUgRFBDRCBh
bmQgY2hlY2sNCj4+IHRyYWluaW5nIHN0YXR1cyBhdXRvbWF0aWNhbGx5Lg0KPj4gDQo+PiBJbiB0
aGUgY2FzZSB0aGF0IGRyaXZlciBzZXQgbGluayByYXRlIGF0IDIuN0cgYW5kIEhXIGZhaWwgdG8g
dHJhaW5pbmcsDQo+PiBpdCB3aWxsIGNoYW5nZSBsaW5rIGNvbmZpZ3VyYXRpb24gYW5kIHRyeSAx
LjY1Ry4gQW5kIHRoaXMgd2lsbCBjYXVzZQ0KPj4gSU5UX1ZJRF9GSUZPX0VSUk9SIHRyaWdnZXJl
ZCB3aGVuIGxpbmsgY2xvY2sgaXMgY2hhbmdlZC4NCj4+IA0KPj4gV2hlbiB2aWRlbyBlcnJvciBv
Y2N1cnMsIHZpZGVvIGxvZ2ljIGlzIHJlc2V0IGFuZCBsaW5rIHRyYWluaW5nIHJlc3RhcnQsDQo+
PiB0aGlzIHdpbGwgY2F1c2UgZW5kbGVzcyBhdXRvIGxpbmsgdHJhaW5pbmcuDQo+PiANCj4+IE1v
ZGlmeSBsaW5rIGF1dG8gdHJhaW5pbmcgd2l0aCBkaXNhYmxlIElOVF9WSURfRklGT19FUlJPUiB0
byBhdm9pZCBsb29wDQo+PiBhbmQgY2hlY2sgSU5UX0xJTktfVFJBSU5fRkFJTCBldmVudCB0byBh
Ym9ydCB3YWl0IHRyYWluaW5nIGRvbmUuDQo+PiANCj4+IFNpZ25lZC1vZmYtYnk6IEhlcm1lcyBX
dSA8SGVybWVzLnd1QGl0ZS5jb20udHc+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2l0ZS1pdDY1MDUuYyB8IDE0ICsrKysrKysrKysrKystDQo+PiAgMSBmaWxlIGNoYW5nZWQs
IDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+IA0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvaXRlLWl0NjUwNS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9pdGUtaXQ2NTA1LmMNCj4+IGluZGV4IDdmNjIyN2MyNzhhNTEzNThjNzBhM2RlOTM0NTRhYWZl
ZWY2NGYyYmIuLmY5Yjk5YzcwNzg5ZWVhNmJlYjNjNjUxMzE1NWM5YTRjYTEwM2QyMTkgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2l0ZS1pdDY1MDUuYw0KPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pdGUtaXQ2NTA1LmMNCj4+IEBAIC0xODA2LDYgKzE4MDYs
MTMgQEAgc3RhdGljIGJvb2wgaXQ2NTA1X2xpbmtfc3RhcnRfYXV0b190cmFpbihzdHJ1Y3QgaXQ2
NTA1ICppdDY1MDUpDQo+PiAgCXN0cnVjdCBkZXZpY2UgKmRldiA9IGl0NjUwNS0+ZGV2Ow0KPj4g
IA0KPj4gIAltdXRleF9sb2NrKCZpdDY1MDUtPmF1eF9sb2NrKTsNCj4+ICsNCj4+ICsJLyogRGlz
YWJsZSBGSUZPIGVycm9yIGludGVycnVwdCB0cmlnZ2VyICAqLw0KPj4gKwkvKiB0byBwcmV2ZW50
IHRyYWluaW5nIGZhaWwgbG9vcCBpc3N1ZSAgICovDQo+PiArCWl0NjUwNV9zZXRfYml0cyhpdDY1
MDUsIElOVF9NQVNLXzAzLCBCSVQoSU5UX1ZJRF9GSUZPX0VSUk9SKSwgMCk7DQo+PiArDQo+PiAr
CWl0NjUwNV93cml0ZShpdDY1MDUsIElOVF9TVEFUVVNfMDMsDQo+PiArCQkgICAgIEJJVChJTlRf
TElOS19UUkFJTl9GQUlMKSB8IEJJVChJTlRfVklEX0ZJRk9fRVJST1IpKTsNCj4+ICAJaXQ2NTA1
X3NldF9iaXRzKGl0NjUwNSwgUkVHX1RSQUlOX0NUUkwwLA0KPj4gIAkJCUZPUkNFX0NSX0RPTkUg
fCBGT1JDRV9FUV9ET05FLCAweDAwKTsNCj4+ICAJLyogcmVzZXQgbGluayBzdGF0ZSBtYWNoaW5l
IGFuZCByZSBzdGFydCB0cmFpbmluZyovDQo+PiBAQCAtMTgxOCw4ICsxODI1LDEwIEBAIHN0YXRp
YyBib29sIGl0NjUwNV9saW5rX3N0YXJ0X2F1dG9fdHJhaW4oc3RydWN0IGl0NjUwNSAqaXQ2NTA1
KQ0KPj4gIAkJbGlua190cmFpbmluZ19zdGF0ZSA9IGl0NjUwNV9yZWFkKGl0NjUwNSwgUkVHX0xJ
TktfVFJBSU5fU1RTKTsNCj4+ICAJCWludDAzID0gaXQ2NTA1X3JlYWQoaXQ2NTA1LCBJTlRfU1RB
VFVTXzAzKTsNCj4+ICAJCWlmIChpbnQwMyAmIEJJVChJTlRfTElOS19UUkFJTl9GQUlMKSkgew0K
Pj4gKwkJCS8qIElnbm9yZSBJTlRfVklEX0ZJRk9fRVJST1Igd2hlbiBhdXRvIHRyYWluaW5nIGZh
aWwqLw0KPj4gIAkJCWl0NjUwNV93cml0ZShpdDY1MDUsIElOVF9TVEFUVVNfMDMsDQo+PiAtCQkJ
CSAgICAgQklUKElOVF9MSU5LX1RSQUlOX0ZBSUwpKTsNCj4+ICsJCQkJICAgICBCSVQoSU5UX0xJ
TktfVFJBSU5fRkFJTCkgfA0KPj4gKwkJCQkgICAgIEJJVChJTlRfVklEX0ZJRk9fRVJST1IpKTsN
Cj4NCj5JJ20gcmVhbGx5IHVudXN1cmUgYWJvdXQgdGhpcyBjaGFuZ2UuIEp1ZGdpbmcgYnkgdGhl
IGRlc2NyaXB0aW9uIG9mIHRoZQ0KPnByb2JsZW0sIGl0J3MgZml4IGZvciB0aGUgaXNzdWUsIGJ1
dCB0aGUgaXNzdWUgZ2V0cyBpbnRyb2R1Y2VkIGluIHRoZQ0KPnByZXZpb3VzIHBhdGNoLg0KSW4g
dGhpcyBwYXRjaCBzZXJpb3VzPw0KDQpUaGlzIHBhdGNoIHNlcmlvdXMgZml4IHRoaXMgRklGTyBl
cnJvciBpc3N1ZSwgaXQgY2hhbmdlIGxpbmsgdHJhaW5pbmcgYWxnb3JpdGhtIGZpcnN0IHRoZW4g
Zml4IHdyb25nIEZJRk8gZXJyb3Igc3RhdHVzLg0KDQpUaGUgbGluayB0cmFpbmluZyBwcm9jZXNz
IHN0YXJ0IGFmdGVyIHZpZGVvIHN0YXR1cyBpcyBzdGFibGUsIGFuZCB3aGVuIHZpZGVvIEZJRk8g
ZXJyb3Igb2NjdXJzLA0KdmlkZW8gc3RhYmxlIHN0YXR1cyB3aWxsIGFsc28gbG9zdCwgbGluayB0
cmFpbmluZyB3aWxsIHJlc2V0IHRvIGlkbGUgYW5kIHdhaXQgdW50aWwgdmlkZW8gc3RhYmxlIGFn
YWluLg0KDQpJVDY1MDUgSFcgYXV0byB0cmFpbmluZyB3aWxsIHByb2Nlc3MgbGluayB0cmFpbmlu
ZyBhdXRvbWF0aWNhbGx5LCB3aGljaCBpbmNsdWRlIENSL0VRIERQQ0Qgc2V0dGluZywgbGluayBz
dGF0dXMgY2hlY2ssDQphbmQgdHJ5IGxvd2VyIGxpbmsgcmF0ZSBpcyB0aGUgMi43RyBjYW5ub3Qg
cGFzcyB0cmFpbmluZy4NCg0KSW4gc29tZSBjYXNlLCBEUCBjb25uZWN0IHRvIGEgRFAgc2luayBk
ZXZpY2Ugd2hpY2ggY2Fubm90IHBhc3MgSVQ2NTA1IEhXIGF1dG8gdHJhaW5pbmcuIA0Kd2hlbiBs
aW5rIGF1dG8gdHJhaW5pbmcgZmFpbCBvbiAyLjdHIGFuZCBJVDY1MDUgSFcgY2hhbmdlIGxpbmsg
cmF0ZSB0byAxLjY1RyBhbmQgcmV0cnkgdHJhaW5pbmcgYXV0b21hdGljYWxseSwNCmF0IHRoaXMg
dGltZSB2aWRlbyBGSUZPIGVycm9yIHdpbGwgb2NjdXIgYmVjYXVzZSBvZiB0aGUgbGluayByYXRl
IGNoYW5nZShjaGlwIGlzc3VlKSwgdGhlIHZpZGVvIHNpZ25hbCBmcm9tIFNPQyBpcyBub3QgbG9z
dCBhY3R1YWxseS4NCg0KDQo+PiAgDQo+PiAgCQkJRFJNX0RFVl9ERUJVR19EUklWRVIoZGV2LA0K
Pj4gIAkJCQkJICAgICAiSU5UX0xJTktfVFJBSU5fRkFJTCgleCkhIiwNCj4+IEBAIC0xODM3LDYg
KzE4NDYsOSBAQCBzdGF0aWMgYm9vbCBpdDY1MDVfbGlua19zdGFydF9hdXRvX3RyYWluKHN0cnVj
dCBpdDY1MDUgKml0NjUwNSkNCj4+ICAJCXRpbWVvdXQtLTsNCj4+ICAJfQ0KPj4gIHVubG9jazoN
Cj4+ICsJLyogcmVjb3ZlciBpbnRlcnJ1cHQgdHJpZ2dlciovDQo+PiArCWl0NjUwNV9zZXRfYml0
cyhpdDY1MDUsIElOVF9NQVNLXzAzLA0KPj4gKwkJCUJJVChJTlRfVklEX0ZJRk9fRVJST1IpLCBC
SVQoSU5UX1ZJRF9GSUZPX0VSUk9SKSk7DQo+PiAgCW11dGV4X3VubG9jaygmaXQ2NTA1LT5hdXhf
bG9jayk7DQo+PiAgDQo+PiAgCXJldHVybiBzdGF0ZTsNCj4+IA0KPj4gLS0gDQo+PiAyLjM0LjEN
Cj4+IA0KPj4gDQo+DQo+LS0gDQo+V2l0aCBiZXN0IHdpc2hlcw0KPkRtaXRyeQ0KPg0KQlIuDQpI
ZXJtZXMgV3UNCg==
