Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0D54DB868
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 20:12:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF1B10E9C7;
	Wed, 16 Mar 2022 19:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E7410E9C7
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 19:12:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CD3841F38A;
 Wed, 16 Mar 2022 19:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647457962; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s89diZDc/0UO/kAXwcmcq+96gKNNdCSstGV5toyPOdY=;
 b=yCHge+ZnmEbqkHRHCyGMZDvHp0VUPHCQZfl3vFitAuCPETCd9VeWxzdTtE/FkAsYskEhYg
 9dDU3iUv5zQak//oXr7pL96+pqv7/bE1NXoyiQO79ma/wI/RxMgsL+k4ovZgyxHiDIFj9a
 SS4TrV4zlq1pSKPHUDHg7XwHtP7yUqU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647457962;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s89diZDc/0UO/kAXwcmcq+96gKNNdCSstGV5toyPOdY=;
 b=F04IHBvMB5vnf/sUEadpTozRyrwlAT6U4V83nIIF3HMKGArmpmboY89cILakft2mlgWZXM
 vaCAvzNnWA+CuhCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F13B13B5E;
 Wed, 16 Mar 2022 19:12:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id OCAvFqo2MmKjfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 16 Mar 2022 19:12:42 +0000
Message-ID: <aaf204b2-e876-d271-3d4e-51cbcc70d690@suse.de>
Date: Wed, 16 Mar 2022 20:12:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/panel: add CONFIG_DRM_KMS_HELPER dependencies
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>
References: <20220316183708.1505846-1-arnd@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220316183708.1505846-1-arnd@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L2Kg8oL8rrM047Px9SyFRYB7"
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Deepak Rawat <drawat.floss@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dillon Min <dillon.minfei@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L2Kg8oL8rrM047Px9SyFRYB7
Content-Type: multipart/mixed; boundary="------------JRt57Q5cB0oCPiXsrDdvQSji";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>
Cc: Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jani Nikula <jani.nikula@intel.com>, Dillon Min <dillon.minfei@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Deepak Rawat <drawat.floss@gmail.com>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Message-ID: <aaf204b2-e876-d271-3d4e-51cbcc70d690@suse.de>
Subject: Re: [PATCH] drm/panel: add CONFIG_DRM_KMS_HELPER dependencies
References: <20220316183708.1505846-1-arnd@kernel.org>
In-Reply-To: <20220316183708.1505846-1-arnd@kernel.org>

--------------JRt57Q5cB0oCPiXsrDdvQSji
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDMuMjIgdW0gMTk6MzYgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPiBG
cm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiANCj4gVGhlIGRyaXZlciBm
YWlscyB0byBidWlsZCB3aGVuIHRoZSBLTVMgaGVscGVycyBhcmUgZGlzYWJsZWQ6DQo+IA0K
PiBsZC5sbGQ6IGVycm9yOiB1bmRlZmluZWQgc3ltYm9sOiBkcm1fZ2VtX2ZiX2dldF9vYmoN
Cj4+Pj4gcmVmZXJlbmNlZCBieSBkcm1fbWlwaV9kYmkuYw0KPj4+PiAgICAgICAgICAgICAg
ICBncHUvZHJtL2RybV9taXBpX2RiaS5vOihtaXBpX2RiaV9idWZfY29weSkgaW4gYXJjaGl2
ZSBkcml2ZXJzL2J1aWx0LWluLmENCj4+Pj4gcmVmZXJlbmNlZCBieSBkcm1fbWlwaV9kYmku
Yw0KPj4+PiAgICAgICAgICAgICAgICBncHUvZHJtL2RybV9taXBpX2RiaS5vOihtaXBpX2Ri
aV9mYl9kaXJ0eSkgaW4gYXJjaGl2ZSBkcml2ZXJzL2J1aWx0LWluLmENCj4gDQo+IGxkLmxs
ZDogZXJyb3I6IHVuZGVmaW5lZCBzeW1ib2w6IGRybV9nZW1fZmJfYmVnaW5fY3B1X2FjY2Vz
cw0KPj4+PiByZWZlcmVuY2VkIGJ5IGRybV9taXBpX2RiaS5jDQo+Pj4+ICAgICAgICAgICAg
ICAgIGdwdS9kcm0vZHJtX21pcGlfZGJpLm86KG1pcGlfZGJpX2J1Zl9jb3B5KSBpbiBhcmNo
aXZlIGRyaXZlcnMvYnVpbHQtaW4uYQ0KPiANCj4gbGQubGxkOiBlcnJvcjogdW5kZWZpbmVk
IHN5bWJvbDogZHJtX2ZiX3N3YWINCj4+Pj4gcmVmZXJlbmNlZCBieSBkcm1fbWlwaV9kYmku
Yw0KPj4+PiAgICAgICAgICAgICAgICBncHUvZHJtL2RybV9taXBpX2RiaS5vOihtaXBpX2Ri
aV9idWZfY29weSkgaW4gYXJjaGl2ZSBkcml2ZXJzL2J1aWx0LWluLmENCj4gDQo+IGxkLmxs
ZDogZXJyb3I6IHVuZGVmaW5lZCBzeW1ib2w6IGRybV9mYl94cmdiODg4OF90b19yZ2I1NjUN
Cj4+Pj4gcmVmZXJlbmNlZCBieSBkcm1fbWlwaV9kYmkuYw0KPj4+PiAgICAgICAgICAgICAg
ICBncHUvZHJtL2RybV9taXBpX2RiaS5vOihtaXBpX2RiaV9idWZfY29weSkgaW4gYXJjaGl2
ZSBkcml2ZXJzL2J1aWx0LWluLmENCj4gDQo+IGxkLmxsZDogZXJyb3I6IHVuZGVmaW5lZCBz
eW1ib2w6IGRybV9mYl9tZW1jcHkNCj4+Pj4gcmVmZXJlbmNlZCBieSBkcm1fbWlwaV9kYmku
Yw0KPj4+PiAgICAgICAgICAgICAgICBncHUvZHJtL2RybV9taXBpX2RiaS5vOihtaXBpX2Ri
aV9idWZfY29weSkgaW4gYXJjaGl2ZSBkcml2ZXJzL2J1aWx0LWluLmENCj4gDQo+IFRoaXMg
aXMgZmFpcmx5IGhhcmQgdG8gaGl0IGluIHJhbmRjb25maWcgZHJpdmVycywgYnV0IGl0IGV2
ZW50dWFsbHkNCj4gZGlkIHRyaWdnZXIgZm9yIG1lIGluIGEgY29uZmlndXJhdGlvbiB3aGVy
ZSBhbGwgb3RoZXIgRFJNIGRyaXZlcnMNCj4gYXJlIGxvYWRhYmxlIG1vZHVsZXMsIGJ1dCBE
Uk1fUEFORUxfV0lERUNISVBTX1dTMjQwMSB3YXMgYnVpbHQtaW4uDQo+IA0KPiBBZGRpbmcg
YSBkZXBlbmRlbmN5IGluIGFsbCBkcml2ZXJzIHRoYXQgc2VsZWN0IERSTV9NSVBJX0RCSSBh
dm9pZHMNCj4gdGhlIHByb2JsZW0gZm9yIG5vdywgYWRkaW5nIHRoZSBkZXBlbmRlbmN5IGlu
IERSTV9NSVBJX0RCSSBhcyB3ZWxsDQo+IHNob3VsZCBoZWxwIG1ha2UgaXQgZWFzaWVyIHRv
IGZpZ3VyZSBvdXQgd2h5IGl0IGJyZWFrcyBpZiBzb21lb25lDQo+IGZvcmdldHMgdGhlIGRl
cGVuZGVuY3kgdGhlIG5leHQgdGltZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVy
Z21hbm4gPGFybmRAYXJuZGIuZGU+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9LY29u
ZmlnICAgICAgIHwgMiArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnIHwg
NCArKysrDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4gDQo+IEkgc2VlIHRoaXMgd2FybmluZyBvbiA1LjE3LXJjOCwgYnV0IGRpZCBu
b3QgdGVzdCBpdCBvbiBsaW51eC1uZXh0LA0KPiB3aGljaCBtYXkgYWxyZWFkeSBoYXZlIGEg
Zml4Lg0KPiANCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBi
L2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnDQo+IGluZGV4IGIxZjIyZTQ1N2ZkMC4uZDVlYzBi
NzdjMDEwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZw0KPiBAQCAtMzAsNyArMzAsNyBAQCBtZW51Y29u
ZmlnIERSTQ0KPiAgIA0KPiAgIGNvbmZpZyBEUk1fTUlQSV9EQkkNCj4gICAJdHJpc3RhdGUN
Cj4gLQlkZXBlbmRzIG9uIERSTQ0KPiArCWRlcGVuZHMgb24gRFJNX0tNU19IRUxQRVINCg0K
VGhpcyBzeW1ib2wgY2Fubm90IGJlIHNlbGVjdGVkIGJ5IHVzZXJzLCBzbyBpdCdzIG1heWJl
IG5vdCBhIGdvb2QgaWRlYSANCnRvIGRlcGVuZCBvbiBpdC4gSW4gZmFjdCwgSSd2ZSBoYWQg
dG8gcmVtb3ZlIHN1Y2ggYSBzdGF0ZW1lbnQgYmVjYXVzZSBpdCANCmNyZWF0ZWQgYSBjeWNs
aWMgZGVwZW5kZW5jeS4gWzFdDQoNCk1ha2luZyB0aGUgZHJpdmVycyBkZXBlbmQgb24gS01T
IGhlbHBlcnMgaXMgdGhlIHJpZ2h0IHRoaW5nIHRob3VnaC4gSWYgDQp0aGVyZSdzIGEgYmV0
dGVyIHNvbHV0aW9uLCBwbGVhc2UgbGV0IG1lIGtub3cuDQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCj4gICANCj4gICBjb25maWcgRFJNX01JUElfRFNJDQo+ICAgCWJvb2wNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnIGIvZHJpdmVycy9ncHUv
ZHJtL3BhbmVsL0tjb25maWcNCj4gaW5kZXggMGFlYzVhMTBiMDY0Li45Njg4N2QwZWZiOWYg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnDQo+IEBAIC00MjUsNiArNDI1LDcgQEAg
Y29uZmlnIERSTV9QQU5FTF9TQU1TVU5HX0RCNzQzMA0KPiAgIAl0cmlzdGF0ZSAiU2Ftc3Vu
ZyBEQjc0MzAtYmFzZWQgRFBJIHBhbmVscyINCj4gICAJZGVwZW5kcyBvbiBPRiAmJiBTUEkg
JiYgR1BJT0xJQg0KPiAgIAlkZXBlbmRzIG9uIEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UNCj4g
KwlkZXBlbmRzIG9uIERSTV9LTVNfSEVMUEVSDQo+ICAgCXNlbGVjdCBEUk1fTUlQSV9EQkkN
Cj4gICAJaGVscA0KPiAgIAkgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gZW5hYmxlIHN1
cHBvcnQgZm9yIHRoZSBTYW1zdW5nDQo+IEBAIC00NDAsNiArNDQxLDcgQEAgY29uZmlnIERS
TV9QQU5FTF9TQU1TVU5HX1M2RDE2RDANCj4gICBjb25maWcgRFJNX1BBTkVMX1NBTVNVTkdf
UzZEMjdBMQ0KPiAgIAl0cmlzdGF0ZSAiU2Ftc3VuZyBTNkQyN0ExIERQSSBwYW5lbCBkcml2
ZXIiDQo+ICAgCWRlcGVuZHMgb24gT0YgJiYgU1BJICYmIEdQSU9MSUINCj4gKwlkZXBlbmRz
IG9uIERSTV9LTVNfSEVMUEVSDQo+ICAgCXNlbGVjdCBEUk1fTUlQSV9EQkkNCj4gICAJaGVs
cA0KPiAgIAkgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gZW5hYmxlIHN1cHBvcnQgZm9y
IHRoZSBTYW1zdW5nDQo+IEBAIC00NzYsNiArNDc4LDcgQEAgY29uZmlnIERSTV9QQU5FTF9T
QU1TVU5HX1M2RTYzTTBfU1BJDQo+ICAgCWRlcGVuZHMgb24gU1BJDQo+ICAgCWRlcGVuZHMg
b24gRFJNX1BBTkVMX1NBTVNVTkdfUzZFNjNNMA0KPiAgIAlkZWZhdWx0IERSTV9QQU5FTF9T
QU1TVU5HX1M2RTYzTTANCj4gKwlkZXBlbmRzIG9uIERSTV9LTVNfSEVMUEVSDQo+ICAgCXNl
bGVjdCBEUk1fTUlQSV9EQkkNCj4gICAJaGVscA0KPiAgIAkgIFNheSBZIGhlcmUgaWYgeW91
IHdhbnQgdG8gYmUgYWJsZSB0byBhY2Nlc3MgdGhlIFNhbXN1bmcNCj4gQEAgLTY3Nyw2ICs2
ODAsNyBAQCBjb25maWcgRFJNX1BBTkVMX1dJREVDSElQU19XUzI0MDENCj4gICAJdHJpc3Rh
dGUgIldpZGVjaGlwcyBXUzI0MDEgRFBJIHBhbmVsIGRyaXZlciINCj4gICAJZGVwZW5kcyBv
biBTUEkgJiYgR1BJT0xJQg0KPiAgIAlkZXBlbmRzIG9uIEJBQ0tMSUdIVF9DTEFTU19ERVZJ
Q0UNCj4gKwlkZXBlbmRzIG9uIERSTV9LTVNfSEVMUEVSDQo+ICAgCXNlbGVjdCBEUk1fTUlQ
SV9EQkkNCj4gICAJaGVscA0KPiAgIAkgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gZW5h
YmxlIHN1cHBvcnQgZm9yIHRoZSBXaWRlY2hpcHMgV1MyNDAxIERQSQ0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhy
ZXI6IEl2byBUb3Rldg0K

--------------JRt57Q5cB0oCPiXsrDdvQSji--

--------------L2Kg8oL8rrM047Px9SyFRYB7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIyNqkFAwAAAAAACgkQlh/E3EQov+A8
gg/+JoJ6qkB9Auzd/Q7PKwRgAnGg1w2o04JPnwmvoONiYgWSgw/WH3EJKOXrh9ozWpzfXQ6cdUko
aMFuah7R7wsr1R6nobyxKW8HlwCOPxUNt8A73GebWs7hxWJB8/0UPmRFtc+jr9iKeJmGyC2SEZBo
s7v3a63iqsmrSSR6lE9ge5JvSmGE/RXvjuHuyq76GHZLYABWfz5OmQroypnFFf7G89wA6uUV5qDN
D3hl1v2FGIP+Hl9LfljUo4/vfp4vybKPiPNf2kZQ10Nq4n8lHO+KAQDfMgCwpUp7sLk/A+ndHcbi
yKzsuyxhyKSpPXAUev2DJ6OMt5vP1g6BeTtJD82D/erc16o0UGhiKtTQVVRaA3hZkIhYtF+6eVSv
BIXTGcgiY+mN1lVjqpItEhiIX0dv7czm5p7wbnhVG+8ORia1TbnvCUKww4X5OdzUlYBcK2T3Xno+
ZIYZLubD0JuoTvFwhoHan93NOjK1nWIK1nA8DQ1lGhvwEKSyCQCljX0/V4K+pe8Z1dPXeHansR2w
hXDvt26Rj8Ou+i2yiIcOQJ3WZ80RZfwBTKPmyiOZuiD6ei5kDBunhB55ngj7mdpg17dKqFnYY9U5
Jsc5QCup5jAfCDQxE8t8aoR0B3A81h7X7e/CDZZ2P8Mmga3qi3WtT1bxtzFo5Ob02MP+aTyd9owX
Reg=
=xKEK
-----END PGP SIGNATURE-----

--------------L2Kg8oL8rrM047Px9SyFRYB7--
