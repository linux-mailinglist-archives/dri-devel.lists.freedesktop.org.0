Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC94652F1B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 11:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0075010E448;
	Wed, 21 Dec 2022 10:03:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107ED10E448
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:02:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B4B24556C;
 Wed, 21 Dec 2022 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671616946; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IImuWzHDGhEKRR3vXdL9Zxzsbk5euS7gCJV1+J/GTLY=;
 b=dHEaALmiCMqiziPngQat0Il4MfKl/vzYeV01plW+2mWRzPJAx7aB2nqiT461GBVpaLHmZ7
 lHF7ggdw2Gqg8uTJla97lRxa1iqKKqNop/pRydf+qthWVLsoTH6kzWjC6fKSEgVYsid8Pc
 PUUEIvYjtYlDb0GZR3HF9WfzNFgeHck=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671616946;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IImuWzHDGhEKRR3vXdL9Zxzsbk5euS7gCJV1+J/GTLY=;
 b=o/f+6TtqEwfq7dbngj+UOlrnhaWs1JeRUeCdbolOKlXN9/buFyBxQQCPNDgUPcV7MmxvhG
 0P19mfZCEZVMkMDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8440213913;
 Wed, 21 Dec 2022 10:02:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fwT2HrLZomO7GgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Dec 2022 10:02:26 +0000
Message-ID: <a776c8d8-388a-dc32-9e4f-25507cecff78@suse.de>
Date: Wed, 21 Dec 2022 11:02:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 01/10] drm: Remove usage of deprecated DRM_INFO
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Siddh Raman Pant <code@siddh.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <cover.1671566741.git.code@siddh.me>
 <da27fd5d4725a8becd426c01ba5652a44cf62ce5.1671566741.git.code@siddh.me>
 <87a63h2iii.fsf@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87a63h2iii.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BQEuTsYP8QPEwNVL4H3K1fCR"
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BQEuTsYP8QPEwNVL4H3K1fCR
Content-Type: multipart/mixed; boundary="------------wEnaFVlev0KKwZ8EED5sFrUQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Siddh Raman Pant <code@siddh.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <a776c8d8-388a-dc32-9e4f-25507cecff78@suse.de>
Subject: Re: [PATCH 01/10] drm: Remove usage of deprecated DRM_INFO
References: <cover.1671566741.git.code@siddh.me>
 <da27fd5d4725a8becd426c01ba5652a44cf62ce5.1671566741.git.code@siddh.me>
 <87a63h2iii.fsf@intel.com>
In-Reply-To: <87a63h2iii.fsf@intel.com>

--------------wEnaFVlev0KKwZ8EED5sFrUQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMTIuMjIgdW0gMTA6NDkgc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
V2VkLCAyMSBEZWMgMjAyMiwgU2lkZGggUmFtYW4gUGFudCA8Y29kZUBzaWRkaC5tZT4gd3Jv
dGU6DQo+PiBkcm1fcHJpbnQuaCBzYXlzIERSTV9JTkZPIGlzIGRlcHJlY2F0ZWQuDQo+PiBU
aHVzLCB1c2UgbmV3ZXIgcHJpbnRpbmcgbWFjcm9zIGRybV9pbmZvKCkgYW5kIHByX2luZm8o
KS4NCj4gDQo+IEkgdGhpbmsgaXQncyBhIGJpdCBvZGQgc29tZSBvZiB0aGUgY29udmVyc2lv
biBpcyB0byBwcl8qKCkgYW5kIHNvbWUgdG8NCj4gZHJtXyooTlVMTCwgLi4uKSBkZXBlbmRp
bmcgb24gdGhlIGxvZ2dpbmcgbGV2ZWwgZXRjLg0KPiANCj4gTm90YWJseSB0aGUgcHJfKigp
IGRlYnVncyB3aWxsIGxhY2sgdGhlIFtkcm1dIHBhcnQgYXMgd2VsbCBhcyB0aGUNCj4gZnVu
Y3Rpb24gbmFtZSwgd2hpY2ggbWFrZXMgc29tZSBvZiB0aGUgbG9nZ2luZyBoYXJkZXIgdG8g
bWFwIHRvIHdoYXQncw0KPiBnb2luZyBvbi4NCj4gDQo+IE1heWJlIGFsbCBvZiB0aGVtIHNo
b3VsZCB1c2UgdGhlIGRybV8qKCkgY2FsbHMsIHdpdGggYmV0dGVyIGhhbmRsaW5nIG9mDQo+
IE5VTEwgZHJtIGRldmljZS4NCg0KVGhhdCdzIGFsc28gd2hhdCBJIHRoaW5rLiBTb21ldGhp
bmcgbGlrZSBkcm1faW5mbyhOVUxMLCApIHNob3VsZCBqdXN0IA0Kd29yayBhbmQgZ2l2ZSB0
aGUgc2FtZSByZXN1bHRzIGFzIGJlZm9yZS4gIFRoZSBvbGRlciBjb2RlIHRoYXQgdXNlcyAN
CmRybV9kZXZfcHJpbnRrKCkgc2VlbXMgdG8gZ2V0IGl0IHJpZ2h0Lg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+IA0KPiANCj4gDQo+IA0K
PiANCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTaWRkaCBSYW1hbiBQYW50IDxjb2RlQHNpZGRo
Lm1lPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQu
YyB8IDIgKy0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyAgICAgIHwg
NyArKysrLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgICAgICAgICAgICB8
IDIgKy0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9wY2kuYyAgICAgICAgICAgIHwgMiAr
LQ0KPj4gICA0IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9k
ZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jDQo+PiBpbmRl
eCBkNTUzZTc5M2U2NzMuLjJiNzZkNDgyOGM1ZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9jbGllbnRfbW9kZXNldC5jDQo+PiBAQCAtMzM1LDcgKzMzNSw3IEBAIHN0YXRpYyBi
b29sIGRybV9jbGllbnRfdGFyZ2V0X2Nsb25lZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0K
Pj4gICAJCURSTV9ERUJVR19LTVMoImNhbiBjbG9uZSB1c2luZyAxMDI0eDc2OFxuIik7DQo+
PiAgIAkJcmV0dXJuIHRydWU7DQo+PiAgIAl9DQo+PiAtCURSTV9JTkZPKCJrbXM6IGNhbid0
IGVuYWJsZSBjbG9uaW5nIHdoZW4gd2UgcHJvYmFibHkgd2FudGVkIHRvLlxuIik7DQo+PiAr
CWRybV9pbmZvKGRldiwgImttczogY2FuJ3QgZW5hYmxlIGNsb25pbmcgd2hlbiB3ZSBwcm9i
YWJseSB3YW50ZWQgdG8uXG4iKTsNCj4+ICAgCXJldHVybiBmYWxzZTsNCj4+ICAgfQ0KPj4g
ICANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYw0KPj4gaW5kZXggNTQ3MzU2ZTAwMzQx
Li4zNGMyNmIyYTk3NGUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nv
bm5lY3Rvci5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jDQo+
PiBAQCAtMTY1LDEzICsxNjUsMTQgQEAgc3RhdGljIHZvaWQgZHJtX2Nvbm5lY3Rvcl9nZXRf
Y21kbGluZV9tb2RlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+PiAgIAkJ
cmV0dXJuOw0KPj4gICANCj4+ICAgCWlmIChtb2RlLT5mb3JjZSkgew0KPj4gLQkJRFJNX0lO
Rk8oImZvcmNpbmcgJXMgY29ubmVjdG9yICVzXG4iLCBjb25uZWN0b3ItPm5hbWUsDQo+PiAt
CQkJIGRybV9nZXRfY29ubmVjdG9yX2ZvcmNlX25hbWUobW9kZS0+Zm9yY2UpKTsNCj4+ICsJ
CWRybV9pbmZvKGNvbm5lY3Rvci0+ZGV2LCAiZm9yY2luZyAlcyBjb25uZWN0b3IgJXNcbiIs
DQo+PiArCQkJIGNvbm5lY3Rvci0+bmFtZSwgZHJtX2dldF9jb25uZWN0b3JfZm9yY2VfbmFt
ZShtb2RlLT5mb3JjZSkpOw0KPj4gICAJCWNvbm5lY3Rvci0+Zm9yY2UgPSBtb2RlLT5mb3Jj
ZTsNCj4+ICAgCX0NCj4+ICAgDQo+PiAgIAlpZiAobW9kZS0+cGFuZWxfb3JpZW50YXRpb24g
IT0gRFJNX01PREVfUEFORUxfT1JJRU5UQVRJT05fVU5LTk9XTikgew0KPj4gLQkJRFJNX0lO
Rk8oImNtZGxpbmUgZm9yY2VzIGNvbm5lY3RvciAlcyBwYW5lbF9vcmllbnRhdGlvbiB0byAl
ZFxuIiwNCj4+ICsJCWRybV9pbmZvKGNvbm5lY3Rvci0+ZGV2LA0KPj4gKwkJCSAiY21kbGlu
ZSBmb3JjZXMgY29ubmVjdG9yICVzIHBhbmVsX29yaWVudGF0aW9uIHRvICVkXG4iLA0KPj4g
ICAJCQkgY29ubmVjdG9yLT5uYW1lLCBtb2RlLT5wYW5lbF9vcmllbnRhdGlvbik7DQo+PiAg
IAkJZHJtX2Nvbm5lY3Rvcl9zZXRfcGFuZWxfb3JpZW50YXRpb24oY29ubmVjdG9yLA0KPj4g
ICAJCQkJCQkgICAgbW9kZS0+cGFuZWxfb3JpZW50YXRpb24pOw0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5j
DQo+PiBpbmRleCA3M2I4NDVhNzVkNTIuLmJjOThlNGJjZjJjMSAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHJ2LmMNCj4+IEBAIC05MzgsNyArOTM4LDcgQEAgaW50IGRybV9kZXZfcmVnaXN0ZXIo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWduZWQgbG9uZyBmbGFncykNCj4+ICAgCWlm
IChkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwgRFJJVkVSX01PREVTRVQpKQ0KPj4gICAJ
CWRybV9tb2Rlc2V0X3JlZ2lzdGVyX2FsbChkZXYpOw0KPj4gICANCj4+IC0JRFJNX0lORk8o
IkluaXRpYWxpemVkICVzICVkLiVkLiVkICVzIGZvciAlcyBvbiBtaW5vciAlZFxuIiwNCj4+
ICsJZHJtX2luZm8oZGV2LCAiSW5pdGlhbGl6ZWQgJXMgJWQuJWQuJWQgJXMgZm9yICVzIG9u
IG1pbm9yICVkXG4iLA0KPj4gICAJCSBkcml2ZXItPm5hbWUsIGRyaXZlci0+bWFqb3IsIGRy
aXZlci0+bWlub3IsDQo+PiAgIAkJIGRyaXZlci0+cGF0Y2hsZXZlbCwgZHJpdmVyLT5kYXRl
LA0KPj4gICAJCSBkZXYtPmRldiA/IGRldl9uYW1lKGRldi0+ZGV2KSA6ICJ2aXJ0dWFsIGRl
dmljZSIsDQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wY2kuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fcGNpLmMNCj4+IGluZGV4IDM5ZDM1ZmMzYTQzYi4uMThjZjdm
YTIzNjk4IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wY2kuYw0KPj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wY2kuYw0KPj4gQEAgLTI2Miw3ICsyNjIsNyBA
QCB2b2lkIGRybV9sZWdhY3lfcGNpX2V4aXQoY29uc3Qgc3RydWN0IGRybV9kcml2ZXIgKmRy
aXZlciwNCj4+ICAgCQl9DQo+PiAgIAkJbXV0ZXhfdW5sb2NrKCZsZWdhY3lfZGV2X2xpc3Rf
bG9jayk7DQo+PiAgIAl9DQo+PiAtCURSTV9JTkZPKCJNb2R1bGUgdW5sb2FkZWRcbiIpOw0K
Pj4gKwlwcl9pbmZvKCJNb2R1bGUgdW5sb2FkZWRcbiIpOw0KPj4gICB9DQo+PiAgIEVYUE9S
VF9TWU1CT0woZHJtX2xlZ2FjeV9wY2lfZXhpdCk7DQo+IA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2
byBUb3Rldg0K

--------------wEnaFVlev0KKwZ8EED5sFrUQ--

--------------BQEuTsYP8QPEwNVL4H3K1fCR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOi2bEFAwAAAAAACgkQlh/E3EQov+Aq
pQ//eV6FpL4sJQ33CCFH0b2ZpHiMSTeOuA3JXX1omWME38JckOmsQkPd9nDJ8l0Rg9sOhETJG5BY
rCL3ok9TtT4ix+zJCNObzNi2jgtQ6iTII3DfVmOZMYUoSJNSZXLWPhyhUxSDnbLZ/XcHEicTS4tr
qaOaHHwSHsyLOqWr4vuURRCzKYVQfgzp5OOU5ZuVcsR0fS7+nSV2PLBMu//4SVLvAJ5dmFf06H/v
9JxudGm4nb6ARML6PcWqtBFmUSmp7Bm0B3eP1keQZfAlCOGxmxpBifVZZz7NcyRON5oZ8n/Km4Ui
FMOdw5uIeMkRfFIGp8xiS+O2ff5JP776vZcrxrtbS5Vk4j/qO9pEUvIM4H9UNL9IoptPGXwDkHNn
2fFI8xAFBLZuZg7e28y+JnC0NKR7L5P7cn5BL5A5tCf+2GHGww+LneHw0eZ57xIjGWLzB+sY9kXq
BRByXd41PwxZnW0TnR9PYD4kc+f/ReJ57tC8Etywc9wQ8sKXIQ0AkMweZQuQbcxPF/7wgURutOQQ
c0sVdZtCOWt86PRsYvDfCgzHZ83TTHAqCC2JTMpXyCF5MU2gJt9jBTVZsUBNkYkX7Hb9erAeojq6
MxUK1rBzm2v5A7M9U2y6RtweMj047X4lb317Vypzt/Wtvoqlyh37e9gL6RDYNtY/+63EnkAr8gz4
CfI=
=i02y
-----END PGP SIGNATURE-----

--------------BQEuTsYP8QPEwNVL4H3K1fCR--
