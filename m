Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7CB6D4349
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 13:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B5C10E3F8;
	Mon,  3 Apr 2023 11:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC62010E190;
 Mon,  3 Apr 2023 11:19:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6CFED21BF6;
 Mon,  3 Apr 2023 11:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680520761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gDCIotJKyS3Ga1gCPnJobV8ICNrGgE1WY4EkisD64zM=;
 b=pCji8P1bJ9qxd+gk6R/HoHFaQqAUoh9a9lRGhtgnBUIHOJv3shcFmWfz71Z7ucbMbe8IYC
 Tp3KRoaxattHcE+pNGghdgJiSDSdmVzvl2LKBtYyfaQTrpp6+JqUwJu7LTiuYT4LYFEOv8
 5X39L+5WAhejH8ZVcCE5UmpMACLK+Go=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680520761;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gDCIotJKyS3Ga1gCPnJobV8ICNrGgE1WY4EkisD64zM=;
 b=684uEO375jXde5HF95cHxlKEusmd3IIPe30N0PIZ9yS7Wyr5sHVEne6IJZqh3I5s1DLhVj
 xmIqlInohMgHdKBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 419D813416;
 Mon,  3 Apr 2023 11:19:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id /6olDzm2KmQLJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 11:19:21 +0000
Message-ID: <74792856-b906-4085-64a2-ec7d32c16508@suse.de>
Date: Mon, 3 Apr 2023 13:19:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/6] drm/msm: Clear aperture ownership outside of fbdev
 code
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230330074150.7637-1-tzimmermann@suse.de>
 <20230330074150.7637-2-tzimmermann@suse.de>
 <CAA8EJpov+D5VjWWKWCEjp_C1Rt2B6=2j8rBc8JUPtjEcYYRzYQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAA8EJpov+D5VjWWKWCEjp_C1Rt2B6=2j8rBc8JUPtjEcYYRzYQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------y0c0jAbHkT80gWW3YFYdZqDE"
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org, javierm@redhat.com,
 sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------y0c0jAbHkT80gWW3YFYdZqDE
Content-Type: multipart/mixed; boundary="------------3egR0O1yelS03R0BdZXADZn3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: freedreno@lists.freedesktop.org, sean@poorly.run,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, linux-arm-msm@vger.kernel.org
Message-ID: <74792856-b906-4085-64a2-ec7d32c16508@suse.de>
Subject: Re: [PATCH 1/6] drm/msm: Clear aperture ownership outside of fbdev
 code
References: <20230330074150.7637-1-tzimmermann@suse.de>
 <20230330074150.7637-2-tzimmermann@suse.de>
 <CAA8EJpov+D5VjWWKWCEjp_C1Rt2B6=2j8rBc8JUPtjEcYYRzYQ@mail.gmail.com>
In-Reply-To: <CAA8EJpov+D5VjWWKWCEjp_C1Rt2B6=2j8rBc8JUPtjEcYYRzYQ@mail.gmail.com>

--------------3egR0O1yelS03R0BdZXADZn3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDMuMjMgdW0gMTE6NTEgc2NocmllYiBEbWl0cnkgQmFyeXNoa292Og0K
PiBPbiBUaHUsIDMwIE1hciAyMDIzIGF0IDEwOjQxLCBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pg0KPj4gTW92ZSBhcGVydHVyZSBtYW5hZ2Vt
ZW50IG91dCBvZiB0aGUgZmJkZXYgY29kZS4gSXQgaXMgdW5yZWxhdGVkDQo+PiBhbmQgbmVl
ZHMgdG8gcnVuIGV2ZW4gaWYgZmJkZXYgc3VwcG9ydCBoYXMgYmVlbiBkaXNhYmxlZC4gQ2Fs
bA0KPj4gdGhlIGhlbHBlciBhdCB0aGUgdG9wIG9mIG1zbV9kcm1faW5pdCgpIHRvIHRha2Ug
b3ZlciBoYXJkd2FyZQ0KPj4gZnJvbSBvdGhlciBkcml2ZXJzLg0KPj4NCj4+IFNpZ25lZC1v
ZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0t
DQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jICAgfCA2ICsrKysrKw0KPj4g
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9mYmRldi5jIHwgNiAtLS0tLS0NCj4+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZHJ2LmMNCj4+IGluZGV4IGFjYTQ4Yzg2OGMxNC4uNTIxMTE0MGVj
NTBiIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMNCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jDQo+PiBAQCAtMTIsNiArMTIs
NyBAQA0KPj4gICAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPg0KPj4gICAjaW5jbHVkZSA8
dWFwaS9saW51eC9zY2hlZC90eXBlcy5oPg0KPj4NCj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9h
cGVydHVyZS5oPg0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9icmlkZ2UuaD4NCj4+ICAgI2lu
Y2x1ZGUgPGRybS9kcm1fZHJ2Lmg+DQo+PiAgICNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4N
Cj4+IEBAIC00MTEsNiArNDEyLDExIEBAIHN0YXRpYyBpbnQgbXNtX2RybV9pbml0KHN0cnVj
dCBkZXZpY2UgKmRldiwgY29uc3Qgc3RydWN0IGRybV9kcml2ZXIgKmRydikNCj4+ICAgICAg
ICAgIGlmIChkcm1fZmlybXdhcmVfZHJpdmVyc19vbmx5KCkpDQo+PiAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRU5PREVWOw0KPj4NCj4+ICsgICAgICAgLyogdGhlIGZ3IGZiIGNvdWxk
IGJlIGFueXdoZXJlIGluIG1lbW9yeSAqLw0KPj4gKyAgICAgICByZXQgPSBkcm1fYXBlcnR1
cmVfcmVtb3ZlX2ZyYW1lYnVmZmVycyhmYWxzZSwgZHJ2KTsNCj4+ICsgICAgICAgaWYgKHJl
dCkNCj4+ICsgICAgICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4gKw0KPiANCj4gSSB0aGlu
ayBpdCBpcyBub3QgYSBnb29kIHBsYWNlIHRvIHJlbW92ZSBmcmFtZWJ1ZmZlcnMuIEVGSUZC
IG1pZ2h0IGJlDQo+IHN0aWxsIGFsaXZlIGFuZCBpZiB3ZSBraWNrIGl0IG91dCwgaXQgbWln
aHQgYmUgdmVyeSBoYXJkIHRvIGRlYnVnIHdoYXQNCj4gd2VudCB3cm9uZy4NCj4gQ291bGQg
eW91IHBsZWFzZSBtb3ZlIGl0IGFmdGVyIGNvbXBvbmVudCBiaW5kPyBUaGVuIHdlIGNhbiBi
ZSBzdXJlIGF0DQo+IGxlYXN0IHRoYXQgYWxsIHN1YmRldmljZXMgYXJlIGJvdW5kLiBJIHNl
ZSB0aGF0IGFybWFkYSBhbmQgc3VuNGkgY2FsbA0KPiBpdCBhcyBsYXRlIGFzIHBvc3NpYmxl
LCB3aGVuIG5vIGNhbGxzIGNhbiBmYWlsLg0KDQpPay4gSSBicmllZmx5IGxvb2tlZCBvdmVy
IHRoZSBjb2RlIHRvIG1ha2Ugc3VyZSB0aGF0IG5vIGNvZGUgdG91Y2hlcyBIVyANCnNldHRp
bmdzIGJlZm9yZSBtc20gYWNxdWlyZXMgdGhlIGRldmljZS4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4+ICAgICAgICAgIGRkZXYgPSBkcm1fZGV2X2FsbG9jKGRydiwgZGV2
KTsNCj4+ICAgICAgICAgIGlmIChJU19FUlIoZGRldikpIHsNCj4+ICAgICAgICAgICAgICAg
ICAgRFJNX0RFVl9FUlJPUihkZXYsICJmYWlsZWQgdG8gYWxsb2NhdGUgZHJtX2RldmljZVxu
Iik7DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2ZiZGV2LmMNCj4+IGluZGV4IGQyNmFhNTIyMTdj
ZS4uZmM3ZDA0MDZhOWY5IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZmJkZXYuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZmJkZXYuYw0K
Pj4gQEAgLTQsNyArNCw2IEBADQo+PiAgICAqIEF1dGhvcjogUm9iIENsYXJrIDxyb2JkY2xh
cmtAZ21haWwuY29tPg0KPj4gICAgKi8NCj4+DQo+PiAtI2luY2x1ZGUgPGRybS9kcm1fYXBl
cnR1cmUuaD4NCj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPg0KPj4gICAjaW5jbHVk
ZSA8ZHJtL2RybV9mYl9oZWxwZXIuaD4NCj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fZm91cmNj
Lmg+DQo+PiBAQCAtMTU0LDExICsxNTMsNiBAQCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqbXNt
X2ZiZGV2X2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+ICAgICAgICAgICAgICAg
ICAgZ290byBmYWlsOw0KPj4gICAgICAgICAgfQ0KPj4NCj4+IC0gICAgICAgLyogdGhlIGZ3
IGZiIGNvdWxkIGJlIGFueXdoZXJlIGluIG1lbW9yeSAqLw0KPj4gLSAgICAgICByZXQgPSBk
cm1fYXBlcnR1cmVfcmVtb3ZlX2ZyYW1lYnVmZmVycyhmYWxzZSwgZGV2LT5kcml2ZXIpOw0K
Pj4gLSAgICAgICBpZiAocmV0KQ0KPj4gLSAgICAgICAgICAgICAgIGdvdG8gZmluaTsNCj4+
IC0NCj4+ICAgICAgICAgIHJldCA9IGRybV9mYl9oZWxwZXJfaW5pdGlhbF9jb25maWcoaGVs
cGVyKTsNCj4+ICAgICAgICAgIGlmIChyZXQpDQo+PiAgICAgICAgICAgICAgICAgIGdvdG8g
ZmluaTsNCj4+IC0tDQo+PiAyLjQwLjANCj4+DQo+IA0KPiANCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdl
cm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJ
dm8gVG90ZXYNCg==

--------------3egR0O1yelS03R0BdZXADZn3--

--------------y0c0jAbHkT80gWW3YFYdZqDE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQqtjgFAwAAAAAACgkQlh/E3EQov+Ah
xw//TuheHev7IpQwFs+ijuiq28Z4yNMPbN8QzwqVGf3s/lyLPVP3+KCA2k9g4PK+G6XdXhNxzSij
LfjRVNGmVQeSwNYAqHq8BkdKs+Hix1j5742c4k3GZ4u2Y2GmZUUyef0xKS3YY5XUOoOlcsw4Keur
OQ5j7BZt/96l6sTESZjVgmt3bbb3+wvMCJm4WScp6inMKpDAA6u0cxYNRhpI9egP9RidMP7svyTJ
47fdlzDifUMy2KFFplgJAZDPEYxup3NDzo1X/sIGG1GE1oNoX2otqWa2wmUsBsJc2165fmM8hPDI
eOlNQF5MPeTIJjC6O9M/guxFSDsKKQIKpV+1qkZTBdb39YbEtNOAk3BoBTrtVgslHimHiDN4WmUI
6hbK/174EpA56oy2Fbh/aK1iOAJHieC3Cc+j3up/texLTjCOiXhSuHbByn/TEX/JlCL41tjyYmU1
VMJspLv4D/BARg4CQDuaTNP93d9ch9Ioi+vHHqfMVtTpG0XQUY1F7EEa85eP8/RD84a6jH+A+ZON
ElLZTAiRr6miLA+L3uBpgnvRzroQ32a35cpwmhdH/mobMaIfctyXKt91ksJUtczcel217VgeK50T
vIjPgqhuJKBiO+gh26lOVRpl7OoQH5ABRRg3+g403czt6m/3SuV4imrwkKeUf/gQrAwzSutz9Xqy
V0s=
=mWxz
-----END PGP SIGNATURE-----

--------------y0c0jAbHkT80gWW3YFYdZqDE--
