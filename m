Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 332E15BACA2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 13:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75CA110EC6A;
	Fri, 16 Sep 2022 11:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DF710EC6A
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Sep 2022 11:41:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D0D2733B9E;
 Fri, 16 Sep 2022 11:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663328471; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IfCdOgTRAwubn+gLxm93UyLUiTJwlFDUCtBJO5qYkDI=;
 b=p7LbuVTZ5gTUlJl5naottk08HhnJRDSSW1YiBwy1US3xVfG5b8cT002GAlqJkDcQPHPO3L
 bUYvD3uB4l6IYO0L4QH/bQXQRrSUgTvi82mQ2ALUoOvt2NU9X8OsuzRZXF4nOXuRy8nRLC
 aNXxu2SiIvCA7Rd2EPGDweMZZoWhWDU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663328471;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IfCdOgTRAwubn+gLxm93UyLUiTJwlFDUCtBJO5qYkDI=;
 b=3sXIxExi4XPCA5HS7O792RXwdsMhFsSzCRSMhRapthdVF9S6T5nYZiH4vrOIZTpqlT50zG
 ubGVdKfPU8GHGNCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7C4A21332E;
 Fri, 16 Sep 2022 11:41:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZeY3HddgJGP4EwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Sep 2022 11:41:11 +0000
Message-ID: <7013378e-9434-d6c6-b777-67af945cb0f8@suse.de>
Date: Fri, 16 Sep 2022 13:41:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 2/4] drm/plane: Allocate planes with
 drm_universal_plane_alloc()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-3-tzimmermann@suse.de>
 <7080a54e-9e0d-93f4-ecba-150d3af03226@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <7080a54e-9e0d-93f4-ecba-150d3af03226@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sz8Hpvm9dmnp3pcEHy0EE8jI"
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
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sz8Hpvm9dmnp3pcEHy0EE8jI
Content-Type: multipart/mixed; boundary="------------GXNgJ0054PeTy7eJU6ufLHGn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com, lyude@redhat.com,
 laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 jyri.sarha@iki.fi, tomba@kernel.org, sam@ravnborg.org
Cc: linux-renesas-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Message-ID: <7013378e-9434-d6c6-b777-67af945cb0f8@suse.de>
Subject: Re: [PATCH 2/4] drm/plane: Allocate planes with
 drm_universal_plane_alloc()
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-3-tzimmermann@suse.de>
 <7080a54e-9e0d-93f4-ecba-150d3af03226@redhat.com>
In-Reply-To: <7080a54e-9e0d-93f4-ecba-150d3af03226@redhat.com>

--------------GXNgJ0054PeTy7eJU6ufLHGn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDkuMjIgdW0gMTM6MjIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDkvOS8yMiAxMjo1OSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
PiBQcm92aWRlIGRybV91bml2ZXJhbF9wbGFuZV9hbGxvYygpLCB3aGljaCBhbGxvY2F0ZWQg
YW4gaW5pdGlhbGl6ZXMgYQ0KPj4gcGxhbmUuIENvZGUgZm9yIG5vbi1hdG9taWMgZHJpdmVy
cyB1c2VzIHRoaXMgcGF0dGVybi4gQ29udmVydCBpdCB0bw0KPj4gdGhlIG5ldyBmdW5jdGlv
bi4gVGhlIG1vZGVzZXQgaGVscGVycyBjb250YWluIGEgcXVpcmsgZm9yIGhhbmRsaW5nIHRo
ZWlyDQo+PiBjb2xvciBmb3JtYXRzIGRpZmZlcmVudGx5LiBTZXQgdGhlIGZsYWcgb3V0c2lk
ZSBwbGFuZSBhbGxvY2F0aW9uLg0KPj4NCj4+IFRoZSBuZXcgZnVuY3Rpb24gaXMgYWxyZWFk
eSBkZXByZWNhdGVkIHRvIHNvbWUgZXh0ZW5kLiBEcml2ZXJzIHNob3VsZA0KPj4gcmF0aGVy
IHVzZSBkcm1tX3VuaXZlcmFsX3BsYW5lX2FsbG9jKCkgb3IgZHJtX3VuaXZlcnNhbF9wbGFu
ZV9pbml0KCkuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4gDQo+IFsuLi5dDQo+IA0KPj4gICANCj4+
ICtfX3ByaW50ZigxMCwgMTEpDQo+PiArdm9pZCAqX19kcm1fdW5pdmVyc2FsX3BsYW5lX2Fs
bG9jKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+PiArCQkJCSAgc2l6ZV90IHNpemUsIHNp
emVfdCBvZmZzZXQsDQo+PiArCQkJCSAgdWludDMyX3QgcG9zc2libGVfY3J0Y3MsDQo+PiAr
CQkJCSAgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9mdW5jcyAqZnVuY3MsDQo+PiArCQkJCSAg
Y29uc3QgdWludDMyX3QgKmZvcm1hdHMsDQo+PiArCQkJCSAgdW5zaWduZWQgaW50IGZvcm1h
dF9jb3VudCwNCj4+ICsJCQkJICBjb25zdCB1aW50NjRfdCAqZm9ybWF0X21vZGlmaWVycywN
Cj4+ICsJCQkJICBlbnVtIGRybV9wbGFuZV90eXBlIHBsYW5lX3R5cGUsDQo+PiArCQkJCSAg
Y29uc3QgY2hhciAqbmFtZSwgLi4uKTsNCj4+ICsNCj4+ICsvKioNCj4+ICsgKiBkcm1fdW5p
dmVyc2FsX3BsYW5lX2FsbG9jIC0gQWxsb2NhdGUgYW5kIGluaXRpYWxpemUgYW4gdW5pdmVy
c2FsIHBsYW5lIG9iamVjdA0KPiANCj4gU2hvdWxkIGZ1bmN0aW9ucyBrZXJuZWwtZG9jIGRl
ZmluaXRpb25zIHVzZSBwYXJlbnRoZXNpcyBvciBub3Q/IEkgc2VlIGluDQo+IGh0dHBzOi8v
ZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvRG9jdW1lbnRhdGlvbi9k
b2MtZ3VpZGUva2VybmVsLWRvYy5yc3QjTDU5DQo+IHRoYXQgdGhlIGV4YW1wbGUgaGFzIGl0
IGJ1dCBub3RpY2UgdGhhdCB0aGVyZSBpcyBub3QgY29uc2lzdGVuY3kgaW4gRFJNDQo+IGFi
b3V0IHRoaXMuDQoNCkEgd2Fzbid0IGF3YXJlIG9mIHRoaXMgY29udmVudGlvbi4NCg0KPiAN
Cj4+ICsgKiBAZGV2OiBEUk0gZGV2aWNlDQo+PiArICogQHR5cGU6IHRoZSB0eXBlIG9mIHRo
ZSBzdHJ1Y3Qgd2hpY2ggY29udGFpbnMgc3RydWN0ICZkcm1fcGxhbmUNCj4+ICsgKiBAbWVt
YmVyOiB0aGUgbmFtZSBvZiB0aGUgJmRybV9wbGFuZSB3aXRoaW4gQHR5cGUNCj4+ICsgKiBA
cG9zc2libGVfY3J0Y3M6IGJpdG1hc2sgb2YgcG9zc2libGUgQ1JUQ3MNCj4+ICsgKiBAZnVu
Y3M6IGNhbGxiYWNrcyBmb3IgdGhlIG5ldyBwbGFuZQ0KPj4gKyAqIEBmb3JtYXRzOiBhcnJh
eSBvZiBzdXBwb3J0ZWQgZm9ybWF0cyAoRFJNX0ZPUk1BVFxfXCopDQo+PiArICogQGZvcm1h
dF9jb3VudDogbnVtYmVyIG9mIGVsZW1lbnRzIGluIEBmb3JtYXRzDQo+PiArICogQGZvcm1h
dF9tb2RpZmllcnM6IGFycmF5IG9mIHN0cnVjdCBkcm1fZm9ybWF0IG1vZGlmaWVycyB0ZXJt
aW5hdGVkIGJ5DQo+PiArICogICAgICAgICAgICAgICAgICAgIERSTV9GT1JNQVRfTU9EX0lO
VkFMSUQNCj4+ICsgKiBAcGxhbmVfdHlwZTogdHlwZSBvZiBwbGFuZSAob3ZlcmxheSwgcHJp
bWFyeSwgY3Vyc29yKQ0KPj4gKyAqIEBuYW1lOiBwcmludGYgc3R5bGUgZm9ybWF0IHN0cmlu
ZyBmb3IgdGhlIHBsYW5lIG5hbWUsIG9yIE5VTEwgZm9yIGRlZmF1bHQgbmFtZQ0KPj4gKyAq
DQo+PiArICogQWxsb2NhdGVzIGFuZCBpbml0aWFsaXplcyBhIHBsYW5lIG9iamVjdCBvZiB0
eXBlIEB0eXBlLiBUaGUgY2FsbGVyDQo+PiArICogaXMgcmVzcG9uc2libGUgZm9yIHJlbGVh
c2luZyB0aGUgYWxsb2NhdGVkIG1lbW9yeSB3aXRoIGtmcmVlKCkuDQo+PiArICoNCj4gDQo+
IEkgdGhvdWdodCB0aGF0IGFsbCB0aGUgZHJtbV8qX2FsbG9jKCkgbWFuYWdlZCBpbnRlcmZh
Y2VzIHNob3VsZCB1c2UgdGhlDQo+IGRybW1fa3t6LG19YWxsb2MoKSBoZWxwZXJzLCBzbyB0
aGF0IHRoZSBtZW1vcnkgaXMgYXV0b21hdGljYWxseSBmcmVlZA0KPiBvbiB0aGUgbGFzdCBk
cm1fZGV2X3B1dCgpIGNhbGwgPw0KDQpGb3IgbmV3IGRyaXZlcnMsIG1hbmFnZWQgY2xlYW51
cCBpcyBwcmVmZXJyZWQuIEJ1dCB0aGlzIGlzIGFuIGV4aXN0aW5nIA0KdW5tYW5hZ2VkIGNs
ZWFudXAuDQoNCkkgZG9uJ3Qga25vdyBpZiBkcm1tXyBjaGFuZ2VzIHRoZSBzZW1hbnRpY3Mg
aW4gdW5leHBlY3RlZCB3YXlzICh3ZWxsLCANCnByb2JhYmx5IG5vdCkuIFdpdGggbWFuYWdl
ZCBtZW1vcnkgcmVsZWFzZXMsIEkgd2FzIHdvcnJpZWQgdGhhdCBwbGFuZSANCm1lbW9yeSBt
aWdodCBzdGF5IGFyb3VuZCBsb25nZXIgdGhhbiBleHBlY3RlZC4gQW5kIHdlJ2QgaGF2ZSB0
byBmaXggdGhlIA0KcGxhbmUtZGVzdHJveSBmdW5jdGlvbiBpbiBlYWNoIHVzZXIgYXMgd2Vs
bC4NCg0KQWRkaW5nIHRoZSBleGlzdGluZyBjb2RlIGFzIGEgbmV3IGZ1bmN0aW9uIGlzIHRo
ZSB0cml2aWFsIHNvbHV0aW9uIGFuZCANCmFsbG93cyB0byBhZGRyZXNzIGVhY2ggZHJpdmVy
IGluZGl2aWR1YWxseS4gQWxzbyBzZWUgbXkgcmVwbHkgdG8gDQpMYXVyZW50J3MgcXVlc3Rp
b24gb24gdGhhdCB0b3BpYy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gT3Ro
ZXIgdGhhbiB0aG9zZSB0d28gbml0cywgdGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8gbWUuDQo+
IA0KPiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJl
ZGhhdC5jb20+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------GXNgJ0054PeTy7eJU6ufLHGn--

--------------sz8Hpvm9dmnp3pcEHy0EE8jI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMkYNcFAwAAAAAACgkQlh/E3EQov+AY
fRAAgEXIcFjN8UyLHbSJGcAXKGf65KQbTCgh5VVqtCK2vKyJl3Z4aMiLePdDfXemsNNbBZ6Qy2AB
uYd5W91bmiGF607D4qZb/00DZBYEtABsiSgqSIUUZord1jN2jkz3GDzgw2xaN5GO/CtpsiWnFFC/
hs2wgL/AcjyeSRn72J2McP3gOqArPe3oncYfXlcsLV7+yQRApkFlkV9duuT3IRDFW7UEetw69R3+
Tfg6CjLjK9ONXhgP7SsmpuOq/zSi99FdZA3HyvDkeEoGHzETiv86JAajv+5hojXgYQU7KS/xhAgz
gOkRGv3z/7MNWhZ2FHXxY3IAPva+17h9TMU54aufvchXE7RgHlQtNw/ecNV6+vz9zfbbAel/0znw
wFtfpJ7Cnw6IKOcIba0F5Wcj6YMu83C3scNz/2N59f+t3Fq8E8t2pcJfuMOZqakvkVvb3jswx5Wp
gUFBXLZ5MJ8x/vW3/iWlXs9On79r6fEfiwhOlhsgzap+tHHu6T0CWmanquPEPW/Ap4ZXEcQqyXkW
rAUX2H4Bbw+hRO8GqjfaV5CcyIYPYL23+eGhff0j06asvxSQLXHvV7fUZrx26HAcWiJQfWyI4R/P
pKDhLZrHjPF/vuEamHsfVnXvyz4Q7Fz2XOD74rMnP4h+oV/9N21zhAYRU2ypwduw9ZvyC9wEVzin
cEA=
=BxKb
-----END PGP SIGNATURE-----

--------------sz8Hpvm9dmnp3pcEHy0EE8jI--
