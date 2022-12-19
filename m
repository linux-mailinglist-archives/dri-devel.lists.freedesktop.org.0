Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE39650E1F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 15:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718B110E2AA;
	Mon, 19 Dec 2022 14:58:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657C210E2AA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 14:58:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D79BB60E28;
 Mon, 19 Dec 2022 14:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671461865; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/sJHRe1x61d+bdcjyXrRDFyLAb4JzMt7z9Tz9dQe3Y=;
 b=bbfl9TLEtf3MfG8fLhS7RT4/l+ZSwDlujYhz+f2nEGuw5NC8S5yjVy7dX58bYFeyngn3Fi
 obcKYJLIh7p58PjYOCPz1WIMDVA/GN1P5pWBKRULLlwgj0IfiQTjGQdHivfvz0InGTiUfN
 DOAzSbskUN38YKAJ2WrrOQ78pQtvITQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671461865;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=D/sJHRe1x61d+bdcjyXrRDFyLAb4JzMt7z9Tz9dQe3Y=;
 b=DBkMLuapRX252h48tigOMlhNmXZjuSvjEOEBzBW4EkzV5NSyVPU1h5w4FlK/Flia6WrmfN
 f4CfhhE1eCk43qCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ABDB513498;
 Mon, 19 Dec 2022 14:57:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id I23jKOl7oGPaSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Dec 2022 14:57:45 +0000
Message-ID: <0693327a-4951-6864-12c6-88cfe81abd12@suse.de>
Date: Mon, 19 Dec 2022 15:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm: Replace DRM_INFO() with pr_info()
Content-Language: en-US
To: Siddh Raman Pant <code@siddh.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20221219142319.79827-1-code@siddh.me>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221219142319.79827-1-code@siddh.me>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jRAn52zmCrZax5bIrKY4wpAQ"
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
--------------jRAn52zmCrZax5bIrKY4wpAQ
Content-Type: multipart/mixed; boundary="------------m4Z8Z0lSKTODIrTprfAvX6xL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Siddh Raman Pant <code@siddh.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <0693327a-4951-6864-12c6-88cfe81abd12@suse.de>
Subject: Re: [PATCH] drm: Replace DRM_INFO() with pr_info()
References: <20221219142319.79827-1-code@siddh.me>
In-Reply-To: <20221219142319.79827-1-code@siddh.me>

--------------m4Z8Z0lSKTODIrTprfAvX6xL
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMTIuMjIgdW0gMTU6MjMgc2NocmllYiBTaWRkaCBSYW1hbiBQYW50Og0K
PiBMaW5lIDUzNiBvZiBkcm1fcHJpbnQuaCBzYXlzIERSTV9JTkZPKCkgaXMgZGVwcmVjYXRl
ZA0KPiBpbiBmYXZvciBvZiBwcl9pbmZvKCkuDQoNClRoYXQncyBhIG1pc2xlYWRpbmcgY29t
bWVudC4gRFJNX0lORk8oKSBpcyBkZXByZWNhdGVkIGZvciBkcm1faW5mbygpLiANCnByX2lu
Zm8oKSBldCBhbCBpcyBvbmx5IHRvIGJlIHVzZWQgb2YgeW91IGRvbid0IGhhdmUgYSBkZXYg
cG9pbnRlci4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogU2lkZGggUmFtYW4gUGFudCA8Y29kZUBzaWRkaC5tZT4NCj4gLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jIHwgIDIgKy0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgICAgfCAgOCArKysrLS0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS9kcm1fZHJ2LmMgICAgICAgICAgICB8IDEwICsrKysrLS0tLS0NCj4gICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2VkaWRfbG9hZC5jICAgICAgfCAxNCArKysrKysrLS0tLS0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fcGNpLmMgICAgICAgICAgICB8ICAyICstDQo+ICAg
NSBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMNCj4gaW5kZXggYmJjNTM1
Y2M1MGRkLi4yZTI4OTE2MTRjNTggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fY2xpZW50X21vZGVzZXQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVu
dF9tb2Rlc2V0LmMNCj4gQEAgLTMzNSw3ICszMzUsNyBAQCBzdGF0aWMgYm9vbCBkcm1fY2xp
ZW50X3RhcmdldF9jbG9uZWQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gICAJCURSTV9E
RUJVR19LTVMoImNhbiBjbG9uZSB1c2luZyAxMDI0eDc2OFxuIik7DQo+ICAgCQlyZXR1cm4g
dHJ1ZTsNCj4gICAJfQ0KPiAtCURSTV9JTkZPKCJrbXM6IGNhbid0IGVuYWJsZSBjbG9uaW5n
IHdoZW4gd2UgcHJvYmFibHkgd2FudGVkIHRvLlxuIik7DQo+ICsJcHJfaW5mbygiW2RybV0g
a21zOiBjYW4ndCBlbmFibGUgY2xvbmluZyB3aGVuIHdlIHByb2JhYmx5IHdhbnRlZCB0by5c
biIpOw0KPiAgIAlyZXR1cm4gZmFsc2U7DQo+ICAgfQ0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Y29ubmVjdG9yLmMNCj4gaW5kZXggNjFjMjljZTc0YjAzLi4yNmEwM2I3MGUyYzYgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYw0KPiBAQCAtMTY1LDE0ICsxNjUsMTQgQEAg
c3RhdGljIHZvaWQgZHJtX2Nvbm5lY3Rvcl9nZXRfY21kbGluZV9tb2RlKHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IpDQo+ICAgCQlyZXR1cm47DQo+ICAgDQo+ICAgCWlmICht
b2RlLT5mb3JjZSkgew0KPiAtCQlEUk1fSU5GTygiZm9yY2luZyAlcyBjb25uZWN0b3IgJXNc
biIsIGNvbm5lY3Rvci0+bmFtZSwNCj4gLQkJCSBkcm1fZ2V0X2Nvbm5lY3Rvcl9mb3JjZV9u
YW1lKG1vZGUtPmZvcmNlKSk7DQo+ICsJCXByX2luZm8oIltkcm1dIGZvcmNpbmcgJXMgY29u
bmVjdG9yICVzXG4iLCBjb25uZWN0b3ItPm5hbWUsDQo+ICsJCQlkcm1fZ2V0X2Nvbm5lY3Rv
cl9mb3JjZV9uYW1lKG1vZGUtPmZvcmNlKSk7DQo+ICAgCQljb25uZWN0b3ItPmZvcmNlID0g
bW9kZS0+Zm9yY2U7DQo+ICAgCX0NCj4gICANCj4gICAJaWYgKG1vZGUtPnBhbmVsX29yaWVu
dGF0aW9uICE9IERSTV9NT0RFX1BBTkVMX09SSUVOVEFUSU9OX1VOS05PV04pIHsNCj4gLQkJ
RFJNX0lORk8oImNtZGxpbmUgZm9yY2VzIGNvbm5lY3RvciAlcyBwYW5lbF9vcmllbnRhdGlv
biB0byAlZFxuIiwNCj4gLQkJCSBjb25uZWN0b3ItPm5hbWUsIG1vZGUtPnBhbmVsX29yaWVu
dGF0aW9uKTsNCj4gKwkJcHJfaW5mbygiW2RybV0gY21kbGluZSBmb3JjZXMgY29ubmVjdG9y
ICVzIHBhbmVsX29yaWVudGF0aW9uIHRvICVkXG4iLA0KPiArCQkJY29ubmVjdG9yLT5uYW1l
LCBtb2RlLT5wYW5lbF9vcmllbnRhdGlvbik7DQo+ICAgCQlkcm1fY29ubmVjdG9yX3NldF9w
YW5lbF9vcmllbnRhdGlvbihjb25uZWN0b3IsDQo+ICAgCQkJCQkJICAgIG1vZGUtPnBhbmVs
X29yaWVudGF0aW9uKTsNCj4gICAJfQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMNCj4gaW5kZXggMjAzYmY4
ZDZjMzRjLi4xNDg2ZGYwOTc5MDggMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYw0KPiBAQCAtODk4
LDExICs4OTgsMTEgQEAgaW50IGRybV9kZXZfcmVnaXN0ZXIoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgdW5zaWduZWQgbG9uZyBmbGFncykNCj4gICAJaWYgKGRybV9jb3JlX2NoZWNrX2Zl
YXR1cmUoZGV2LCBEUklWRVJfTU9ERVNFVCkpDQo+ICAgCQlkcm1fbW9kZXNldF9yZWdpc3Rl
cl9hbGwoZGV2KTsNCj4gICANCj4gLQlEUk1fSU5GTygiSW5pdGlhbGl6ZWQgJXMgJWQuJWQu
JWQgJXMgZm9yICVzIG9uIG1pbm9yICVkXG4iLA0KPiAtCQkgZHJpdmVyLT5uYW1lLCBkcml2
ZXItPm1ham9yLCBkcml2ZXItPm1pbm9yLA0KPiAtCQkgZHJpdmVyLT5wYXRjaGxldmVsLCBk
cml2ZXItPmRhdGUsDQo+IC0JCSBkZXYtPmRldiA/IGRldl9uYW1lKGRldi0+ZGV2KSA6ICJ2
aXJ0dWFsIGRldmljZSIsDQo+IC0JCSBkZXYtPnByaW1hcnktPmluZGV4KTsNCj4gKwlwcl9p
bmZvKCJbZHJtXSBJbml0aWFsaXplZCAlcyAlZC4lZC4lZCAlcyBmb3IgJXMgb24gbWlub3Ig
JWRcbiIsDQo+ICsJCWRyaXZlci0+bmFtZSwgZHJpdmVyLT5tYWpvciwgZHJpdmVyLT5taW5v
ciwNCj4gKwkJZHJpdmVyLT5wYXRjaGxldmVsLCBkcml2ZXItPmRhdGUsDQo+ICsJCWRldi0+
ZGV2ID8gZGV2X25hbWUoZGV2LT5kZXYpIDogInZpcnR1YWwgZGV2aWNlIiwNCj4gKwkJZGV2
LT5wcmltYXJ5LT5pbmRleCk7DQo+ICAgDQo+ICAgCWdvdG8gb3V0X3VubG9jazsNCj4gICAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZF9sb2FkLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2VkaWRfbG9hZC5jDQo+IGluZGV4IDM3ZDhiYTNkZGI0Ni4uZDNj
YjE5ODM4MGM1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWRfbG9h
ZC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZF9sb2FkLmMNCj4gQEAgLTI0
Miw5ICsyNDIsOSBAQCBzdGF0aWMgdm9pZCAqZWRpZF9sb2FkKHN0cnVjdCBkcm1fY29ubmVj
dG9yICpjb25uZWN0b3IsIGNvbnN0IGNoYXIgKm5hbWUsDQo+ICAgCQl1OCAqbmV3X2VkaWQ7
DQo+ICAgDQo+ICAgCQllZGlkW0VESURfTEVOR1RILTFdICs9IGVkaWRbMHg3ZV0gLSB2YWxp
ZF9leHRlbnNpb25zOw0KPiAtCQlEUk1fSU5GTygiRm91bmQgJWQgdmFsaWQgZXh0ZW5zaW9u
cyBpbnN0ZWFkIG9mICVkIGluIEVESUQgZGF0YSAiDQo+IC0JCSAgICAiXCIlc1wiIGZvciBj
b25uZWN0b3IgXCIlc1wiXG4iLCB2YWxpZF9leHRlbnNpb25zLA0KPiAtCQkgICAgZWRpZFsw
eDdlXSwgbmFtZSwgY29ubmVjdG9yX25hbWUpOw0KPiArCQlwcl9pbmZvKCJbZHJtXSBGb3Vu
ZCAlZCB2YWxpZCBleHRlbnNpb25zIGluc3RlYWQgb2YgJWQgaW4gRURJRCBkYXRhICINCj4g
KwkJCSJcIiVzXCIgZm9yIGNvbm5lY3RvciBcIiVzXCJcbiIsIHZhbGlkX2V4dGVuc2lvbnMs
DQo+ICsJCQllZGlkWzB4N2VdLCBuYW1lLCBjb25uZWN0b3JfbmFtZSk7DQo+ICAgCQllZGlk
WzB4N2VdID0gdmFsaWRfZXh0ZW5zaW9uczsNCj4gICANCj4gICAJCW5ld19lZGlkID0ga3Jl
YWxsb2MoZWRpZCwgKHZhbGlkX2V4dGVuc2lvbnMgKyAxKSAqIEVESURfTEVOR1RILA0KPiBA
QCAtMjUzLDEwICsyNTMsMTAgQEAgc3RhdGljIHZvaWQgKmVkaWRfbG9hZChzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yLCBjb25zdCBjaGFyICpuYW1lLA0KPiAgIAkJCWVkaWQg
PSBuZXdfZWRpZDsNCj4gICAJfQ0KPiAgIA0KPiAtCURSTV9JTkZPKCJHb3QgJXMgRURJRCBi
YXNlIGJsb2NrIGFuZCAlZCBleHRlbnNpb24lcyBmcm9tICINCj4gLQkgICAgIlwiJXNcIiBm
b3IgY29ubmVjdG9yIFwiJXNcIlxuIiwgKGJ1aWx0aW4gPj0gMCkgPyAiYnVpbHQtaW4iIDoN
Cj4gLQkgICAgImV4dGVybmFsIiwgdmFsaWRfZXh0ZW5zaW9ucywgdmFsaWRfZXh0ZW5zaW9u
cyA9PSAxID8gIiIgOiAicyIsDQo+IC0JICAgIG5hbWUsIGNvbm5lY3Rvcl9uYW1lKTsNCj4g
Kwlwcl9pbmZvKCJbZHJtXSBHb3QgJXMgRURJRCBiYXNlIGJsb2NrIGFuZCAlZCBleHRlbnNp
b24lcyBmcm9tICINCj4gKwkJIlwiJXNcIiBmb3IgY29ubmVjdG9yIFwiJXNcIlxuIiwgKGJ1
aWx0aW4gPj0gMCkgPyAiYnVpbHQtaW4iIDoNCj4gKwkJImV4dGVybmFsIiwgdmFsaWRfZXh0
ZW5zaW9ucywgdmFsaWRfZXh0ZW5zaW9ucyA9PSAxID8gIiIgOiAicyIsDQo+ICsJCW5hbWUs
IGNvbm5lY3Rvcl9uYW1lKTsNCj4gICANCj4gICBvdXQ6DQo+ICAgCXJlbGVhc2VfZmlybXdh
cmUoZncpOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9wY2kuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fcGNpLmMNCj4gaW5kZXggMzlkMzVmYzNhNDNiLi45NGVlMTk0
Y2U5MjcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcGNpLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9wY2kuYw0KPiBAQCAtMjYyLDcgKzI2Miw3IEBAIHZv
aWQgZHJtX2xlZ2FjeV9wY2lfZXhpdChjb25zdCBzdHJ1Y3QgZHJtX2RyaXZlciAqZHJpdmVy
LA0KPiAgIAkJfQ0KPiAgIAkJbXV0ZXhfdW5sb2NrKCZsZWdhY3lfZGV2X2xpc3RfbG9jayk7
DQo+ICAgCX0NCj4gLQlEUk1fSU5GTygiTW9kdWxlIHVubG9hZGVkXG4iKTsNCj4gKwlwcl9p
bmZvKCJbZHJtXSBNb2R1bGUgdW5sb2FkZWRcbiIpOw0KPiAgIH0NCj4gICBFWFBPUlRfU1lN
Qk9MKGRybV9sZWdhY3lfcGNpX2V4aXQpOw0KPiAgIA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------m4Z8Z0lSKTODIrTprfAvX6xL--

--------------jRAn52zmCrZax5bIrKY4wpAQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOge+kFAwAAAAAACgkQlh/E3EQov+Cb
0w//acRXHc6A2bDYUPKJ44QHJ38ulmit4wFJHNNQ0fvvWVcypfNTL5DA/G+TJwkNtZJqHWOK8Vnq
yv4d9rN/worjVZ04CSZN92KFv51WSp1/Clz40FaoEtghS3dijzeVtbjDZ3j7P6xuBGjVcc/CYpcp
vHKuLpyG20HU7nzlBJptioY/bAlzTLHzfDXNe3cWvrCw+3T25V7Bp8LGtB6l0mWTPc/x+YCZ3SRc
wRKnUHiS/PQiE16GRABM3emfWCUvX+2tNBmzsuDxRvZlWFle07n3vXBMrMGcgd6Vgd38kMSYeRkk
fJAEaDVJAiIqikx9VeGeDaPbuZBgS3S7GCjDaOH3vi+EIz9skwM6y36HtX9LUNRX+ZhB1FFOQt8f
kAhYjK5JLh9up6oloUbddrp/0Z3M2oKb4HrqgcQdS5GBEfLaNR2Sp9CzRdF8u2HkbfNNB5BrSeMY
65HqhZgboEWh5L3JrxoplKbJ2+6F8bnYBLCnBVUGkYFj1ZA/Msk4bv8sMDI5e6d3u/aYi4lpcIpf
2EmT6LJkUBgf4ySlEyfdGToKqYkOGUap91I6aTJH4/Nt274J9pJHM7io/Mc0tWHkT5DxwP8kdZrN
RnSQCC/Cw058E5XXlp7KVWB3ms7Y6xZXiQigoToGknSyrVTIdDMcdfmYOJrfIPh+97BeGhpvHP2M
1Oo=
=yvX9
-----END PGP SIGNATURE-----

--------------jRAn52zmCrZax5bIrKY4wpAQ--
