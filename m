Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A5067E812
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 15:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D058310E9A0;
	Fri, 27 Jan 2023 14:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBDA10E99D;
 Fri, 27 Jan 2023 14:21:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 475B3200D6;
 Fri, 27 Jan 2023 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674829291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0btQjyZ56Q4cnEVVdzKrQ9JwO2dMutAUxFI5xZXrlQg=;
 b=g/vJ6ozVgsF3SrHXGoN7fpibUNDFBR7D7cKnqisz6vCBCtXnDnDo/Elzr8MWDkob/3d+f0
 /wp5MAOZol6GSh5cyTWuuXmSplfllG3W96gSoWdL8USvJMe9rD8Das5+sYt7Fa5ymVdwA7
 MtX6v7xOj64CayXcZJ06QcGvuJ8FH6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674829291;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0btQjyZ56Q4cnEVVdzKrQ9JwO2dMutAUxFI5xZXrlQg=;
 b=4aVGR7y+M7acvcgXfoOv9HqP1whuncwB0Z/9V3Z2e9+jsWqvfqOes8dlXAeE/hBia/F3Ye
 NsrKnHZfSJudg6Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 02165138E3;
 Fri, 27 Jan 2023 14:21:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bVoQO+rd02NpQAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 27 Jan 2023 14:21:30 +0000
Message-ID: <441188d8-01a6-2a48-ce46-e32d7006aafa@suse.de>
Date: Fri, 27 Jan 2023 15:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 04/10] drm/fbdev-generic: Initialize fb-helper
 structure in generic setup
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-5-tzimmermann@suse.de> <Y9GZJcRKbaK0cYGo@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y9GZJcRKbaK0cYGo@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gcWRSfeeDBECA90IV80jzmHb"
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
Cc: freedreno@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gcWRSfeeDBECA90IV80jzmHb
Content-Type: multipart/mixed; boundary="------------kHWgMBLOxi8wrJV0Vj005ow7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, javierm@redhat.com, linux-samsung-soc@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <441188d8-01a6-2a48-ce46-e32d7006aafa@suse.de>
Subject: Re: [PATCH v3 04/10] drm/fbdev-generic: Initialize fb-helper
 structure in generic setup
References: <20230125200415.14123-1-tzimmermann@suse.de>
 <20230125200415.14123-5-tzimmermann@suse.de> <Y9GZJcRKbaK0cYGo@ravnborg.org>
In-Reply-To: <Y9GZJcRKbaK0cYGo@ravnborg.org>

--------------kHWgMBLOxi8wrJV0Vj005ow7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDEuMjMgdW0gMjI6MDMgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIFdlZCwgSmFuIDI1LCAyMDIzIGF0IDA5OjA0OjA5UE0gKzAx
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSW5pdGlhbGl6ZSB0aGUgZmItaGVs
cGVyIHN0cnVjdHVyZSBpbW1lZGlhdGVseSBhZnRlciBpdHMgYWxsb2NhdGlvbg0KPj4gaW4g
ZHJtX2ZiZGV2X2dlbmVyaWNfc2V0dXAoKS4gVGhhdCB3aWxsIG1ha2UgaXQgZWFzaWVyIHRv
IGZpbGwgaXQgd2l0aA0KPj4gZHJpdmVyLXNwZWNpZmljIHZhbHVlcywgc3VjaCBhcyB0aGUg
cHJlZmVycmVkIEJQUC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGlu
ZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyB8IDEzICsrKysrKysrKy0tLS0NCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPj4gaW5kZXggMTM1ZDU4Yjgw
MDdiLi42M2Y2NjMyNWE4YTUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiZGV2X2dlbmVyaWMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9n
ZW5lcmljLmMNCj4+IEBAIC0zODUsOCArMzg1LDYgQEAgc3RhdGljIGludCBkcm1fZmJkZXZf
Y2xpZW50X2hvdHBsdWcoc3RydWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQpDQo+PiAgIAlp
ZiAoZGV2LT5mYl9oZWxwZXIpDQo+PiAgIAkJcmV0dXJuIGRybV9mYl9oZWxwZXJfaG90cGx1
Z19ldmVudChkZXYtPmZiX2hlbHBlcik7DQo+PiAgIA0KPj4gLQlkcm1fZmJfaGVscGVyX3By
ZXBhcmUoZGV2LCBmYl9oZWxwZXIsICZkcm1fZmJfaGVscGVyX2dlbmVyaWNfZnVuY3MpOw0K
Pj4gLQ0KPj4gICAJcmV0ID0gZHJtX2ZiX2hlbHBlcl9pbml0KGRldiwgZmJfaGVscGVyKTsN
Cj4+ICAgCWlmIChyZXQpDQo+PiAgIAkJZ290byBlcnI7DQo+IA0KPiAgRnJvbSB0aGUgZG9j
dW1lbnRhdGlvbjoNCj4gVGhlIGRybV9mYl9oZWxwZXJfcHJlcGFyZSgpDQo+IGhlbHBlciBt
dXN0IGJlIGNhbGxlZCBmaXJzdCB0byBpbml0aWFsaXplIHRoZSBtaW5pbXVtIHJlcXVpcmVk
IHRvIG1ha2UNCj4gaG90cGx1ZyBkZXRlY3Rpb24gd29yay4NCj4gLi4uDQo+IFRvIGZpbmlz
aCB1cCB0aGUgZmJkZXYgaGVscGVyIGluaXRpYWxpemF0aW9uLCB0aGUNCj4gZHJtX2ZiX2hl
bHBlcl9pbml0KCkgZnVuY3Rpb24gaXMgY2FsbGVkLg0KPiANCj4gU28gdGhpcyBjaGFuZ2Ug
ZG8gbm90IGZvbGxvdyB0aGUgZG9jdW1lbnRhdGlvbiBhcyBkcm1fZmJfaGVscGVyX2luaXQo
KQ0KPiBpcyBub3cgY2FsbGVkIGJlZm9yZSBkcm1fZmJfaGVscGVyX3ByZXBhcmUoKQ0KDQpO
bywgd2Ugbm93IGNhbGwgZHJtX2ZiX2hlbHBlcl9wcmVwYXJlKCkgZnJvbSB3aXRoaW4gDQpk
cm1fZmJkZXZfZ2VuZXJpY19zZXR1cCgpLCByaWdodCBhZnRlciBhbGxvY2F0aW5nIHRoZSBm
Yl9oZWxwZXIuIA0KZHJtX2ZiX2hlbHBlcl9pbml0KCkgd2lsbCBvbmx5IGJlIGNhbGxlZCBh
ZnRlciB0aGUgY2xpZW50IHJlY2VpdmVkIGEgDQpob3QtcGx1ZyBldmVudC4NCg0KPiANCj4g
SSBkaWQgbm90IGZvbGxvdyBhbGwgdGhlIGNvZGUgLSBidXQgbXkgZ3V0IGZlZWxpbmcgaXMg
dGhhdCB0aGUNCj4gZG9jdW1lbnRhdGlvbiBpcyByaWdodC4NCg0KVGhlIGRvY3MgYXJlIG9m
IGxvdyBxdWFsaXR5LiBUaGUgX3ByZXBhcmUoKSBoZWxwZXIgaXMgdGhlIGFjdHVhbCBpbml0
IA0KZnVuY3Rpb24gYW5kIF9pbml0KCkgb25seSBzZXRzIHRoZSBmYl9oZWxwZXIgaW4gdGhl
IGRldmljZSBpbnN0YW5jZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gCVNh
bQ0KPiANCj4gDQo+PiBAQCAtNDU2LDEyICs0NTQsMTIgQEAgdm9pZCBkcm1fZmJkZXZfZ2Vu
ZXJpY19zZXR1cChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPj4gICAJZmJfaGVscGVyID0g
a3phbGxvYyhzaXplb2YoKmZiX2hlbHBlciksIEdGUF9LRVJORUwpOw0KPj4gICAJaWYgKCFm
Yl9oZWxwZXIpDQo+PiAgIAkJcmV0dXJuOw0KPj4gKwlkcm1fZmJfaGVscGVyX3ByZXBhcmUo
ZGV2LCBmYl9oZWxwZXIsICZkcm1fZmJfaGVscGVyX2dlbmVyaWNfZnVuY3MpOw0KPj4gICAN
Cj4+ICAgCXJldCA9IGRybV9jbGllbnRfaW5pdChkZXYsICZmYl9oZWxwZXItPmNsaWVudCwg
ImZiZGV2IiwgJmRybV9mYmRldl9jbGllbnRfZnVuY3MpOw0KPj4gICAJaWYgKHJldCkgew0K
Pj4gLQkJa2ZyZWUoZmJfaGVscGVyKTsNCj4+ICAgCQlkcm1fZXJyKGRldiwgIkZhaWxlZCB0
byByZWdpc3RlciBjbGllbnQ6ICVkXG4iLCByZXQpOw0KPj4gLQkJcmV0dXJuOw0KPj4gKwkJ
Z290byBlcnJfZHJtX2NsaWVudF9pbml0Ow0KPj4gICAJfQ0KPj4gICANCj4+ICAgCS8qDQo+
PiBAQCAtNDg0LDUgKzQ4MiwxMiBAQCB2b2lkIGRybV9mYmRldl9nZW5lcmljX3NldHVwKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+PiAgIAkJZHJtX2RiZ19rbXMoZGV2LCAiY2xpZW50
IGhvdHBsdWcgcmV0PSVkXG4iLCByZXQpOw0KPj4gICANCj4+ICAgCWRybV9jbGllbnRfcmVn
aXN0ZXIoJmZiX2hlbHBlci0+Y2xpZW50KTsNCj4+ICsNCj4+ICsJcmV0dXJuOw0KPj4gKw0K
Pj4gK2Vycl9kcm1fY2xpZW50X2luaXQ6DQo+PiArCWRybV9mYl9oZWxwZXJfdW5wcmVwYXJl
KGZiX2hlbHBlcik7DQo+PiArCWtmcmVlKGZiX2hlbHBlcik7DQo+PiArCXJldHVybjsNCj4+
ICAgfQ0KPj4gICBFWFBPUlRfU1lNQk9MKGRybV9mYmRldl9nZW5lcmljX3NldHVwKTsNCj4+
IC0tIA0KPj4gMi4zOS4wDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------kHWgMBLOxi8wrJV0Vj005ow7--

--------------gcWRSfeeDBECA90IV80jzmHb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPT3eoFAwAAAAAACgkQlh/E3EQov+Dv
eg//drnS7Fk2pApfsgsICEWgOy0RZlZc1nNvDXqz1m7qLtsaFDTzsYtBU6nfZjD9Zo1zadSFIkHO
DlVyFC1WULXjvTPSHGbXVwg34/qMEWv3+VROk8jqDiqc1rBE82mNqwG/uNy6pYHMYxs76AmC9FRJ
gbtnxsvMmDc7GdcTalslkoikkEY2WcvbXKZECzA5/M/5TMQYt4boRhfPzgXCiMJ2ruCgYK2auNhQ
4RrKxMCRGrR80AWINUJLimKrQ7pu1C0XL9sooLIWJAYvGKunN0jOyaDxcASY2kJ5KNrjQmbij59w
bVe87NEDq68jnrIBCJEB8suN+gNK+HwYHXBiIj4dGmi0xwg123i1ToAW+ay4HfI12k4/v0wwdC1F
Y9LQ0O9m/L1L3t5MXQ1ENrIsH/dSMl0d9kWza1dNiR5NBkl0OWvfWAqIVZGDfH0P9GshsHxmkKpd
UktrOfJ7QegS+WILynvyhbR/91XK2uTKQ8pQll09QHP33FIVdUtKRLDnb5WuMqg1wpfX3UVCr4tV
plak1E28V4+xg4/NMpkVFnhGW28zeubls8E6s5sFATZPGTDvyTcVBcXAkFL99cZg5pwbczavZlkc
t3O9WERyMTP+r9vin/U/wuslWB4eAAd/K4T+HKILmYfCGoe1Li+aA5ePTJYMKY1DmoahU1XUDoA/
yQA=
=UeBN
-----END PGP SIGNATURE-----

--------------gcWRSfeeDBECA90IV80jzmHb--
