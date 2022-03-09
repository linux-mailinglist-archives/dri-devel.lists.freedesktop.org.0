Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1714D2AC3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 09:42:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306DF10E65F;
	Wed,  9 Mar 2022 08:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442D410E65F
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 08:42:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AFC7E1F381;
 Wed,  9 Mar 2022 08:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646815363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZOAqOu/21H/b/9tT4MT/eTA98YEndQ/qp2QpxDlP2gQ=;
 b=mHYMLtlokSS2INorvIBY4yEKEKeyPL3wW74cBpQTQVoCNeAjaFynaxcDNumZFGludlFpTl
 u8U/UGcBEuMqE84/KncO6WTnSpkUQGKJXffJhvLr6WD4s5I/YH1UQgE6k1IlDThgg+pMlg
 LfVPNbbEJyF2aM5e5lVDFnwiURgpEsE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646815363;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZOAqOu/21H/b/9tT4MT/eTA98YEndQ/qp2QpxDlP2gQ=;
 b=DdyPSOtRnucosWAgeQUsHCm6dOR1+5VOOnnVfcuHOHu72B5YViRVhkJlVXdhZIzafCndxD
 /wvTebNbogD1BuDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 80C0A13B70;
 Wed,  9 Mar 2022 08:42:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id c7dwHoNoKGL9DAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Mar 2022 08:42:43 +0000
Message-ID: <1ec9bf07-798a-2bfa-a61b-b98fe9066df1@suse.de>
Date: Wed, 9 Mar 2022 09:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 6/9] drm/fb-helper: Provide callback to create fbdev dumb
 buffers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-7-tzimmermann@suse.de>
 <4d489fba-917f-4212-0528-0295e86c4c4a@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <4d489fba-917f-4212-0528-0295e86c4c4a@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------P3MPK4C0Tkpu4BBOtgY1h4BM"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------P3MPK4C0Tkpu4BBOtgY1h4BM
Content-Type: multipart/mixed; boundary="------------xk60jhZbOciqBGbowanAfFNA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <1ec9bf07-798a-2bfa-a61b-b98fe9066df1@suse.de>
Subject: Re: [PATCH 6/9] drm/fb-helper: Provide callback to create fbdev dumb
 buffers
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-7-tzimmermann@suse.de>
 <4d489fba-917f-4212-0528-0295e86c4c4a@redhat.com>
In-Reply-To: <4d489fba-917f-4212-0528-0295e86c4c4a@redhat.com>

--------------xk60jhZbOciqBGbowanAfFNA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDMuMjIgdW0gMTg6NTEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDMvMy8yMiAyMTo1OCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
PiBQcm92aWRlIHN0cnVjdCBkcm1fZHJpdmVyLmR1bWJfY3JlYXRlX2ZiZGV2LCBhIGNhbGxi
YWNrIGhvb2sgZm9yDQo+PiBmYmRldiBkdW1iIGJ1ZmZlcnMuIFdpcmUgdXAgZmJkZXYgYW5k
IGNsaWVudCBoZWxwZXJzIHRvIHVzZSB0aGUgbmV3DQo+PiBpbnRlcmZhY2UsIGlmIHByZXNl
bnQuDQo+Pg0KPj4gVGhpcyBhY2tub3dsZWRnZXMgdGhlIGZhY3QgdGhhdCBmYmRldiBidWZm
ZXJzIGFyZSBkaWZmZXJlbnQuIFRoZSBtb3N0DQo+PiBzaWduaWZpY2FudCBkaWZmZXJlbmNl
IHRvIHJlZ3VsYXIgR0VNIEJPcyBpcyBpbiBtbWFwIHNlbWFudGljcy4gRmJkZXYNCj4+IHVz
ZXJzcGFjZSB0cmVhdHMgdGhlIHBhZ2VzIGFzIHZpZGVvIG1lbW9yeSwgd2hpY2ggbWFrZXMg
aXQgaW1wb3NzaWJsZQ0KPj4gdG8gZXZlciBtb3ZlIHRoZSBtbWFwJ2VkIGJ1ZmZlci4gSGVu
Y2UsIGRyaXZlcnMgdXNzdWFsbHkgaGF2ZSB0byBwaW4NCj4+IHRoZSBCTyBwZXJtYW5lbnRs
eSBvciBpbnN0YWxsIGFuIGludGVybWVkaWF0ZSBzaGFkb3cgYnVmZmVyIGZvciBtbWFwLg0K
Pj4NCj4+IFNvIGZhciwgZmJkZXYgbWVtb3J5IGNhbWUgZnJvbSBkdW1iIGJ1ZmZlcnMgYW5k
IERSTSBkcml2ZXJzIGhhZCBubw0KPj4gbWVhbnMgb2YgZGV0ZWN0aW5nIHRoaXMgd2l0aG91
dCByZWltcGxlbWVudGluZyBhIGdvb2QgcGFydCBvZiB0aGUgZmJkZXYNCj4+IGNvZGUuIFdp
dGggdGhlIG5ldyBjYWxsYmFjaywgZHJpdmVycyBjYW4gcGVybWEtcGluIGZiZGV2IGJ1ZmZl
ciBvYmplY3RzDQo+PiBpZiBuZWVkZWQuDQo+Pg0KPj4gU2V2ZXJhbCBkcml2ZXJzIGFsc28g
cmVxdWlyZSBkYW1hZ2UgaGFuZGxpbmcsIHdoaWNoIGZiZGV2IGltcGxlbWVudHMNCj4+IHdp
dGggaXRzIGRlZmVycmVkIEkvTyBoZWxwZXJzLiBUaGUgbmV3IGNhbGxiYWNrIGFsbG93cyBh
IGRyaXZlcidzIG1lbW9yeQ0KPj4gbWFuYWdlciB0byBzZXQgdXAgYSBzdWl0YWJsZSBtbWFw
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMg
ICAgICAgIHwgMTQgKysrKysrKy0tLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9jcnRj
X2ludGVybmFsLmggfCAgMyArKysNCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1
ZmZlcnMuYyAgfCAzNiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLQ0KPj4gICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jICAgICB8IDI2ICsrKysrKysrKysrKysrKysr
LS0tLQ0KPj4gICBpbmNsdWRlL2RybS9kcm1fY2xpZW50LmggICAgICAgICAgICB8ICAzICsr
LQ0KPj4gICBpbmNsdWRlL2RybS9kcm1fZHJ2LmggICAgICAgICAgICAgICB8IDE3ICsrKysr
KysrKysrKysrDQo+PiAgIDYgZmlsZXMgY2hhbmdlZCwgODQgaW5zZXJ0aW9ucygrKSwgMTUg
ZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Y2xpZW50LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jDQo+PiBpbmRleCBhZjNi
NzM5NWJmNjkuLmM5NjQwNjQ2NTFkNSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fY2xpZW50LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMN
Cj4+IEBAIC0yNDcsNyArMjQ3LDggQEAgc3RhdGljIHZvaWQgZHJtX2NsaWVudF9idWZmZXJf
ZGVsZXRlKHN0cnVjdCBkcm1fY2xpZW50X2J1ZmZlciAqYnVmZmVyKQ0KPj4gICB9DQo+PiAg
IA0KPj4gICBzdGF0aWMgc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICoNCj4+IC1kcm1fY2xp
ZW50X2J1ZmZlcl9jcmVhdGUoc3RydWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQsIHUzMiB3
aWR0aCwgdTMyIGhlaWdodCwgdTMyIGZvcm1hdCkNCj4+ICtkcm1fY2xpZW50X2J1ZmZlcl9j
cmVhdGUoc3RydWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQsIHUzMiB3aWR0aCwgdTMyIGhl
aWdodCwgdTMyIGZvcm1hdCwNCj4+ICsJCQkgYm9vbCBmYmRldikNCj4+ICAgew0KPj4gICAJ
Y29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqaW5mbyA9IGRybV9mb3JtYXRfaW5mbyhm
b3JtYXQpOw0KPj4gICAJc3RydWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1iIGR1bWJfYXJncyA9
IHsgfTsNCj4+IEBAIC0yNjUsNyArMjY2LDEwIEBAIGRybV9jbGllbnRfYnVmZmVyX2NyZWF0
ZShzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCwgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0
LCB1DQo+PiAgIAlkdW1iX2FyZ3Mud2lkdGggPSB3aWR0aDsNCj4+ICAgCWR1bWJfYXJncy5o
ZWlnaHQgPSBoZWlnaHQ7DQo+PiAgIAlkdW1iX2FyZ3MuYnBwID0gaW5mby0+Y3BwWzBdICog
ODsNCj4+IC0JcmV0ID0gZHJtX21vZGVfY3JlYXRlX2R1bWIoZGV2LCAmZHVtYl9hcmdzLCBj
bGllbnQtPmZpbGUpOw0KPj4gKwlpZiAoZmJkZXYpDQo+IA0KPiBNYXliZSBpZiAoZGVmaW5l
ZChDT05GSUdfRFJNX0ZCREVWX0VNVUxBVElPTikgJiYgZmJkZXYpID8NCj4gDQo+PiArCQly
ZXQgPSBkcm1fbW9kZV9jcmVhdGVfZHVtYl9mYmRldihkZXYsICZkdW1iX2FyZ3MsIGNsaWVu
dC0+ZmlsZSk7DQo+IA0KPiBBbmQgZHJtX21vZGVfY3JlYXRlX2R1bWJfZmJkZXYoKSBjb3Vs
ZCBqdXN0IGJlIG1hZGUgYSBzdHViIGlmDQo+IENPTkZJR19EUk1fRkJERVZfRU1VTEFUSU9O
IGlzbid0IGVuYWJsZWQuDQoNCk1ha2VzIHNlbnNlLg0KDQo+IA0KPiBJIGJlbGlldmUgdGhl
IG9ubHkgdXNhZ2Ugb2YgdGhlIERSTSBjbGllbnQgQVBJIGN1cnJlbnRseSBpcyB0aGUgZmJk
ZXYNCj4gZW11bGF0aW9uIGxheWVyIGFueXdheXM/IEJ1dCBzdGlsbCBtYWtlcyBzZW5zZSBJ
IHRoaW5rIHRvIGNvbmR0aW9uYWxseQ0KPiBjb21waWxlIHRoYXQgc2luY2UgZHJtX2NsaWVu
dC5vIGlzIGJ1aWx0IGluIHRoZSBkcm0ua28gbW9kdWxlIGFuZCB0aGUNCj4gZHJtX2ZiX2hl
bHBlci5vIG9ubHkgaW5jbHVkZWQgaWYgZmJkZXYgZW11bGF0aW9uIGhhcyBiZWVuIGVuYWJs
ZWQuDQoNCk1ha2VzIHNlbnNlLCBJIHRoaW5rLg0KDQpGYmRldiBlbXVsYXRpb24gaXMgdGhl
IG9ubHkgdXNlciBvZiB0aGlzIGNvZGUuIEFuZCB0aGVyZSB3b24ndCBiZSBvdGhlciANCmhl
bHBlcnMgbGlrZSB0aGF0LiBBbnkgb3RoZXIgY2xpZW50IHdvdWxkIHVzZSB0aGUgcmVndWxh
ciBkdW1iLWJ1ZmZlciANCmZ1bmN0aW9ucy4NCg0KPiANCj4+ICsJZWxzZQ0KPj4gKwkJcmV0
ID0gZHJtX21vZGVfY3JlYXRlX2R1bWIoZGV2LCAmZHVtYl9hcmdzLCBjbGllbnQtPmZpbGUp
Ow0KPj4gICAJaWYgKHJldCkNCj4+ICAgCQlnb3RvIGVycl9kZWxldGU7DQo+PiAgIA0KPj4g
QEAgLTQwMiw2ICs0MDYsNyBAQCBzdGF0aWMgaW50IGRybV9jbGllbnRfYnVmZmVyX2FkZGZi
KHN0cnVjdCBkcm1fY2xpZW50X2J1ZmZlciAqYnVmZmVyLA0KPj4gICAgKiBAd2lkdGg6IEZy
YW1lYnVmZmVyIHdpZHRoDQo+PiAgICAqIEBoZWlnaHQ6IEZyYW1lYnVmZmVyIGhlaWdodA0K
Pj4gICAgKiBAZm9ybWF0OiBCdWZmZXIgZm9ybWF0DQo+PiArICogQGZiZGV2OiBUcnVlIGlm
IHRoZSBjbGllbnQgcHJvdmlkZXMgYW4gZmJkZXYgZGV2aWNlLCBvciBmYWxzZSBvdGhlcndp
c2UNCj4+ICAgICoNCj4gDQo+IEFuIGVtdWxhdGVkIGZiZGV2IGRldmljZSA/DQoNCk9rLg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBPdGhlciB0aGFuIHRob3NlIHNtYWxs
IG5pdCwNCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGph
dmllcm1AcmVkaGF0LmNvbT4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------xk60jhZbOciqBGbowanAfFNA--

--------------P3MPK4C0Tkpu4BBOtgY1h4BM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIoaIIFAwAAAAAACgkQlh/E3EQov+Ak
+RAAyLMfHHwHq1fgfkdSjZFPfj0wKFY/Jhteh1zHFWUH/JwSfijQtVjf8f7bWp58PLfd+pdWAXw+
E1j+TZPyPPa6wxD9SxZ6/u1BkdAsnyy2FkvqrHwOA6rYlI8yaxfwyLIoNQttj7vFFmEL0TxNtm3E
2U+kd0nlzxPPkNZMThv5WVGxa84aGgm6AqhdrVVHw4P0Oe0m6xWUdiivsaIdqFkazywpHztbUzyB
ZgHJ8rAXbOHKJlixEdCgI2cHrzOSfCmsvwUEWdJ6l0izouQs/cUUSo/x8LINwLc1Yy75MsOeMG1R
W8fKBpkAQ22JmPeG6EELSN8A8JBf3TSP8HL3BUzvrz9m+o7P608/34wUp6w8sRrRVw2/P4OlItXA
K1zwpqebcW3AknJ7cKHhuz/mdYPm6UH8Y0NN5z7ekl0TpcvD249hhMqS1Z0R9mxm83/Kn1isenZP
iN2JLJ9uKXAuJaWXG/svlhmQd2/8Vuv4FHBfC0RSOVvz2culGGmjCVFZ4g5T4uN8kZTLU9kl4C34
f23UD/S36SBJa1C7rC0jEU48nOQmbqWhtZz4B89iLK1avJi19m+5YXtPPoSUyMGvJFEysbK2HwWC
p6tEBPdLIuQX1FZTQ8+2AY+zd7LgHJd2xSp2/JvZsS6esWMye9ocjarw3Mpp8sHQrDHnj6NcGvHw
p+8=
=laB/
-----END PGP SIGNATURE-----

--------------P3MPK4C0Tkpu4BBOtgY1h4BM--
