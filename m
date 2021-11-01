Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4E5441588
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 09:43:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF576E0B6;
	Mon,  1 Nov 2021 08:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48EB26E0B6
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 08:43:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B537D1FD6C;
 Mon,  1 Nov 2021 08:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635756206; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gM5vOonh67Hj9yoUUGj+83GDC0sAVqxgVoOYgqawToo=;
 b=Z7rmDcFKJv/mqy8zAp3SLc08PKYIi+L8ctV+KvdVX2okgiI+xZPUdk97l97CQD1iKToU/A
 4JpKxh3IczEsXKCEZajf0v0K/9Xcb0dKztwAxYWWNjehn8kEn6J4QKtxKaR8bVy7rgyO4V
 WFLrzZ7dfEBFoPdDZi3NJxeoLNuirvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635756206;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gM5vOonh67Hj9yoUUGj+83GDC0sAVqxgVoOYgqawToo=;
 b=KYbDQY8PtGsyedm3mYRjMMkDKI7lY55OPjIR5ehlY4Sx0pAjPWekjUaF59065AoRYI3hyk
 70tugfL23y+Gq3CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E87913AA9;
 Mon,  1 Nov 2021 08:43:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZE0jEq6of2EdKAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 08:43:26 +0000
Message-ID: <06626716-d894-8821-55b3-fcc8662f1d58@suse.de>
Date: Mon, 1 Nov 2021 09:43:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 1/9] drm/format-helper: Export drm_fb_clip_offset()
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-2-tzimmermann@suse.de> <YXO+bGIW9sn9Rcfw@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YXO+bGIW9sn9Rcfw@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zacue4NlIhOYHWJcS63vynDe"
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
Cc: linux-hyperv@vger.kernel.org, david@lechnology.com,
 michael+lkml@stapelberg.ch, airlied@linux.ie, dri-devel@lists.freedesktop.org,
 javierm@redhat.com, virtualization@lists.linux-foundation.org,
 joshua@stroblindustries.com, drawat.floss@gmail.com, noralf@tronnes.org,
 arnd@arndb.de, kraxel@redhat.com, dirty.ice.hu@gmail.com, airlied@redhat.com,
 aros@gmx.com, kernel@amanoeldawod.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zacue4NlIhOYHWJcS63vynDe
Content-Type: multipart/mixed; boundary="------------XpNMgznP0NawZxzpBgxramQU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, javierm@redhat.com, kernel@amanoeldawod.com,
 dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch, aros@gmx.com,
 joshua@stroblindustries.com, arnd@arndb.de, dri-devel@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, virtualization@lists.linux-foundation.org
Message-ID: <06626716-d894-8821-55b3-fcc8662f1d58@suse.de>
Subject: Re: [PATCH 1/9] drm/format-helper: Export drm_fb_clip_offset()
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-2-tzimmermann@suse.de> <YXO+bGIW9sn9Rcfw@ravnborg.org>
In-Reply-To: <YXO+bGIW9sn9Rcfw@ravnborg.org>

--------------XpNMgznP0NawZxzpBgxramQU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMTAuMjEgdW0gMDk6NDkgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIEZyaSwgT2N0IDIyLCAyMDIxIGF0IDAzOjI4OjIxUE0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gUHJvdmlkZSBhIGZ1bmN0aW9uIHRo
YXQgY29tcHV0ZXMgdGhlIG9mZnNldCBpbnRvIGEgYmxpdCBkZXN0aW5hdGlvbg0KPj4gYnVm
ZmVyLiBUaGlzIHdpbGwgYWxsb3cgdG8gbW92ZSBkZXN0aW5hdGlvbi1idWZmZXIgY2xpcHBp
bmcgaW50byB0aGUNCj4+IGZvcm1hdC1oZWxwZXIgY2FsbGVycy4NCj4+DQo+PiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0t
LQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyB8IDEwICsrKysr
KysrLS0NCj4+ICAgaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaCAgICAgfCAgNCAr
KysrDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRf
aGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPj4gaW5k
ZXggNjlmZGU2MGUzNmIzLi4yOGU5ZDBkODkyNzAgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9mb3JtYXRfaGVscGVyLmMNCj4+IEBAIC0xNywxMiArMTcsMTggQEANCj4+ICAgI2lu
Y2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+DQo+PiAgICNpbmNsdWRlIDxkcm0vZHJtX3JlY3Qu
aD4NCj4+ICAgDQo+PiAtc3RhdGljIHVuc2lnbmVkIGludCBjbGlwX29mZnNldChzdHJ1Y3Qg
ZHJtX3JlY3QgKmNsaXAsDQo+PiAtCQkJCXVuc2lnbmVkIGludCBwaXRjaCwgdW5zaWduZWQg
aW50IGNwcCkNCj4+ICtzdGF0aWMgdW5zaWduZWQgaW50IGNsaXBfb2Zmc2V0KGNvbnN0IHN0
cnVjdCBkcm1fcmVjdCAqY2xpcCwgdW5zaWduZWQgaW50IHBpdGNoLCB1bnNpZ25lZCBpbnQg
Y3BwKQ0KPj4gICB7DQo+PiAgIAlyZXR1cm4gY2xpcC0+eTEgKiBwaXRjaCArIGNsaXAtPngx
ICogY3BwOw0KPj4gICB9DQo+PiAgIA0KPj4gK3Vuc2lnbmVkIGxvbmcgZHJtX2ZiX2NsaXBf
b2Zmc2V0KHVuc2lnbmVkIGludCBwaXRjaCwgY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5m
byAqZm9ybWF0LA0KPj4gKwkJCQkgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKQ0KPj4g
K3sNCj4+ICsJcmV0dXJuIGNsaXBfb2Zmc2V0KGNsaXAsIHBpdGNoLCBmb3JtYXQtPmNwcFsw
XSk7DQo+PiArfQ0KPj4gK0VYUE9SVF9TWU1CT0woZHJtX2ZiX2NsaXBfb2Zmc2V0KTsNCj4g
DQo+IEV4cG9ydGVkIGZ1bmN0aW9ucyBhcmUgZXhwZWN0ZWQgdG8gaGF2ZSBrZXJuZWwtZG9j
IGRvY3VtZW50YXRpb24uDQo+IEp1c3QgY29weSBtb3JlIG9yIGxlc3MgZnJvbSB0aGUgY2hh
bmdlbG9nIEkgdGhpbmsuDQoNClRoYXQncyBhbiBvdmVyc2lnaHQuIFNvcnJ5Lg0KDQo+IA0K
PiBBbnl3aGVyZSBlbHNlIChJIGxvb2tlZCBpbiBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyKSB3
ZSBvbmx5IG5lZWQgdW5zaWduZWQNCj4gaW50IGZvciBvZmZzZXRzIGFuZCB3aWR0aC9sZW5n
dGggLSBzbyBJIGNhbm5vdCBzZWUgd2h5IHdlIGRvIGFuIHVuc2lnbmVkDQo+IGludCA9PiB1
bnNpZ25lZCBsb25nIGNvbnZlcnNpb24gaGVyZS4NCg0KT24gYW5jaWVudCBwbGF0Zm9ybXMs
IGludCB3YXMgMTYgYml0IHdpZGUuIFNvIGZvciB2YWx1ZXMgdGhhdCBhcmUgYXJyYXkgDQpp
bmRpY2VzIG9yIGJ1ZmZlciBpbmRpY2VzLCBJIG5hdHVyYWxseSB1c2UgbG9uZywgd2hpY2gg
aXMgMzItYml0IGF0IA0KbGVhc3QuIE5ldmVyIG1pbmQsIGl0J3Mgbm90IHJlbGV2YW50IGFu
eSBsb25nZXIuIEknbGwgY29udmVydCB0aGlzIGNvZGUgDQp0byB1bnNpZ25lZCBpbnQuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IAlTYW0NCj4gDQo+PiArDQo+PiAgIC8q
Kg0KPj4gICAgKiBkcm1fZmJfbWVtY3B5IC0gQ29weSBjbGlwIGJ1ZmZlcg0KPj4gICAgKiBA
ZHN0OiBEZXN0aW5hdGlvbiBidWZmZXINCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9k
cm1fZm9ybWF0X2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaA0K
Pj4gaW5kZXggZTg2OTI1Y2YwN2I5Li45MGI5YmQ5ZWNiODMgMTAwNjQ0DQo+PiAtLS0gYS9p
bmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+PiArKysgYi9pbmNsdWRlL2RybS9k
cm1fZm9ybWF0X2hlbHBlci5oDQo+PiBAQCAtNiw5ICs2LDEzIEBADQo+PiAgICNpZm5kZWYg
X19MSU5VWF9EUk1fRk9STUFUX0hFTFBFUl9IDQo+PiAgICNkZWZpbmUgX19MSU5VWF9EUk1f
Rk9STUFUX0hFTFBFUl9IDQo+PiAgIA0KPj4gK3N0cnVjdCBkcm1fZm9ybWF0X2luZm87DQo+
PiAgIHN0cnVjdCBkcm1fZnJhbWVidWZmZXI7DQo+PiAgIHN0cnVjdCBkcm1fcmVjdDsNCj4+
ICAgDQo+PiArdW5zaWduZWQgbG9uZyBkcm1fZmJfY2xpcF9vZmZzZXQodW5zaWduZWQgaW50
IHBpdGNoLCBjb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpmb3JtYXQsDQo+PiArCQkJ
CSBjb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApOw0KPj4gKw0KPj4gICB2b2lkIGRybV9m
Yl9tZW1jcHkodm9pZCAqZHN0LCB2b2lkICp2YWRkciwgc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqZmIsDQo+PiAgIAkJICAgc3RydWN0IGRybV9yZWN0ICpjbGlwKTsNCj4+ICAgdm9pZCBk
cm1fZmJfbWVtY3B5X2RzdGNsaXAodm9pZCBfX2lvbWVtICpkc3QsIHVuc2lnbmVkIGludCBk
c3RfcGl0Y2gsIHZvaWQgKnZhZGRyLA0KPj4gLS0gDQo+PiAyLjMzLjANCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------XpNMgznP0NawZxzpBgxramQU--

--------------zacue4NlIhOYHWJcS63vynDe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF/qK0FAwAAAAAACgkQlh/E3EQov+Dj
zxAAoJGTU0dO44SLYxm91QYOQILT52HcJ3bdtIOXSS+tlr/BDmaOZKp8fFGcay08xcp52QaKnnNQ
yWr9fgSGIXqB0Y+doUGb7C/Z3JYtN6LwdqhQatkXON4tX08cfVlcM4o595SlcA2EuEEenwBJEAMy
2VGMdS6zEshUTtqZNPRbvJXQC0G6W/g5EyHZXfS/vnQ3Lhp9FNqpPpcM3lN0P6SGSp0SlWyFe9eu
sVO90k4VhBo3CddoXc2HUO86g5cIRcHUaAc2ZmySbme6Ed+ZnHBAaFTKs0oJGiHdi+4qP2bFBvV6
RSout2vdH5CFsdzN2/zsCZFKa3/8HuS7tL787GNEpGTr9ldmRZNBjUuyfKaErkMSvfaiqLk+HprX
H0HxfkdkuEm2RjCqbYz3B0p0BjKDRfnpQjXc37Bv2YRn4TSJoU7oKbvUXz+iW+Kem96YV6U1dbl8
eGcnOT8M0ryU0rIIfHTvdbGRNjTHutODoUngMvHaj92iPc21Y2Tru8i3EVAZ7tAGeeGziVrBeHXh
Ft2UPxXcCaLiPGaWafTv5nA0PydbYtOb0NuwgjKYGwQ59sDFTOJ/mxTN94XGEu7Woc1eecKd+b0V
O/S22jDCnAr6xhj4zPUzK0ExxMFgamVWZKp31NPzcHJQCD5BydwIxI4CEkRAAmD0eb1oLr74ucEQ
BQE=
=sFZm
-----END PGP SIGNATURE-----

--------------zacue4NlIhOYHWJcS63vynDe--
