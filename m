Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C16E6FA14A
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 09:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9F710E12E;
	Mon,  8 May 2023 07:44:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 219EA10E12E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 07:44:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A33151F891;
 Mon,  8 May 2023 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683531843; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KF5iQFLq3Ef2Xr1ovIlogZ5Qi3hG7iTlGhqYLAj1x6c=;
 b=gtuT7IfLHjbzZPk/zS9Ntpine14wEBLdizqgtaSRlfOTBztRnLGtKhsZrvwpCB9sf6nHFg
 yUEtIb9Dyeja6N3WtWls1su4pGyvshgJAGVKPv74sJ86ILgX3Vxq6iHn6TlOOTNMYZTMpB
 99CfJwggHFbG70GW3py3AJXMbctP2w4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683531843;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KF5iQFLq3Ef2Xr1ovIlogZ5Qi3hG7iTlGhqYLAj1x6c=;
 b=eXWI4gIz6ha6XQoEY9rXG325iOOjG5r5ftP3e4nCUyfS1ydsRFQ/LIXWN2zR9tMovsnQ1O
 PgsPRkX+DZPZK9CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81D7313499;
 Mon,  8 May 2023 07:44:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wxOjHkOoWGRGOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 May 2023 07:44:03 +0000
Message-ID: <1554caa0-f279-e54f-ffba-2ae2367411b8@suse.de>
Date: Mon, 8 May 2023 09:44:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 2/4] drm/mgag200: Simplify offset and scale computation.
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
References: <20230505124337.854845-1-jfalempe@redhat.com>
 <20230505124337.854845-3-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230505124337.854845-3-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------w1dw0EFsZmeCdVGUyp3opTF1"
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

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------w1dw0EFsZmeCdVGUyp3opTF1
Content-Type: multipart/mixed; boundary="------------fs7KZuOHKFuGbus3Uv4xaG68";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
Message-ID: <1554caa0-f279-e54f-ffba-2ae2367411b8@suse.de>
Subject: Re: [PATCH 2/4] drm/mgag200: Simplify offset and scale computation.
References: <20230505124337.854845-1-jfalempe@redhat.com>
 <20230505124337.854845-3-jfalempe@redhat.com>
In-Reply-To: <20230505124337.854845-3-jfalempe@redhat.com>

--------------fs7KZuOHKFuGbus3Uv4xaG68
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDUuMjMgdW0gMTQ6NDMgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE5vdyB0aGF0IHRoZSBkcml2ZXIgaGFuZGxlcyBvbmx5IDE2LCAyNCBhbmQgMzItYml0IGZy
YW1lYnVmZmVyLA0KPiBpdCBjYW4gYmUgc2ltcGxpZmllZC4NCg0KSSB0aGluayBpdCBzaG91
bGQgc2F5IHRoYXQgdGhlIGRyaXZlciBuZXZlciByZWFsbHkgaGFuZGxlZCA4LWJpdCBjb2xv
cnMuIA0KT3IgYXQgbGVhc3QgSSdtIG5vdCBhd2FyZSBvZi4NCg0KPiANCj4gTm8gZnVuY3Rp
b25hbCBjaGFuZ2VzLg0KPiANCj4gb2Zmc2V0Og0KPiAxNmJpdDogKGJwcHNoaWZ0ID0gMSkN
Cj4gb2Zmc2V0ID0gd2lkdGggPj4gKDQgLSBicHBzaGlmdCkgPT4gd2lkdGggLyA4ID0+IHBp
dGNoIC8gMTYNCj4gDQo+IDI0Yml0OiAgKGJwcHNoaWZ0ID0gMCkNCj4gb2Zmc2V0ID0gKHdp
ZHRoICogMykgPj4gKDQgLSBicHBzaGlmdCkgID0+IHdpZHRoICogMyAvIDE2ID0+IHBpdGNo
IC8gMTYNCj4gDQo+IDMyYml0OiAgKGJwcHNoaWZ0ID0gMikNCj4gb2Zmc2V0ID0gd2lkdGgg
Pj4gKDQgLSBicHBzaGlmdCkgPT4gd2lkdGggLyA0ID0+IHBpdGNoIC8gMTYNCj4gDQo+IHNj
YWxlOg0KPiAxNmJpdDoNCj4gc2NhbGUgPSAoMSA8PCBicHBzaGlmdCkgLSAxID0+IDENCj4g
MjRiaXQ6DQo+IHNjYWxlID0gKCgxIDw8IGJwcHNoaWZ0KSAqIDMpIC0gMSA9PiAyDQo+IDMy
Yml0Og0KPiBzY2FsZSA9ICgxIDw8IGJwcHNoaWZ0KSAtIDEgPT4gMw0KPiANCj4gU2lnbmVk
LW9mZi1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUByZWRoYXQuY29tPg0KPiAtLS0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyB8IDYzICsrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlv
bnMoKyksIDQ3IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
bWdhZzIwMF9tb2RlLmMNCj4gaW5kZXggOWEyNGI5YzAwNzQ1Li43ZDhjNjUzNzJhYzQgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jDQo+IEBAIC0y
ODAsMzAgKzI4MCwxNiBAQCB2b2lkIG1nYWcyMDBfc2V0X21vZGVfcmVncyhzdHJ1Y3QgbWdh
X2RldmljZSAqbWRldiwgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZA0KPiAgIAlXUkVH
OChNR0FfTUlTQ19PVVQsIG1pc2MpOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyB1OCBtZ2Fn
MjAwX2dldF9icHBfc2hpZnQoY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0
KQ0KPiAtew0KPiAtCXN0YXRpYyBjb25zdCB1OCBicHBfc2hpZnRbXSA9IHswLCAxLCAwLCAy
fTsNCj4gLQ0KPiAtCXJldHVybiBicHBfc2hpZnRbZm9ybWF0LT5jcHBbMF0gLSAxXTsNCj4g
LX0NCj4gLQ0KPiAgIC8qDQo+ICAgICogQ2FsY3VsYXRlcyB0aGUgSFcgb2Zmc2V0IHZhbHVl
IGZyb20gdGhlIGZyYW1lYnVmZmVyJ3MgcGl0Y2guIFRoZQ0KPiAgICAqIG9mZnNldCBpcyBh
IG11bHRpcGxlIG9mIHRoZSBwaXhlbCBzaXplIGFuZCBkZXBlbmRzIG9uIHRoZSBkaXNwbGF5
DQo+IC0gKiBmb3JtYXQuDQo+ICsgKiBmb3JtYXQuIFdpdGggd2lkdGggaW4gcGl4ZWxzIGFu
ZCBwaXRjaCBpbiBieXRlcywgdGhlIGZvcm11bGEgaXM6DQo+ICsgKiBvZmZzZXQgPSB3aWR0
aCAqIGJwcCAvIDEyOCA9IHBpdGNoIC8gMTYNCj4gICAgKi8NCj4gICBzdGF0aWMgdTMyIG1n
YWcyMDBfY2FsY3VsYXRlX29mZnNldChzdHJ1Y3QgbWdhX2RldmljZSAqbWRldiwNCj4gICAJ
CQkJICAgIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiKQ0KPiAgIHsNCj4gLQl1
MzIgb2Zmc2V0ID0gZmItPnBpdGNoZXNbMF0gLyBmYi0+Zm9ybWF0LT5jcHBbMF07DQo+IC0J
dTggYnBwc2hpZnQgPSBtZ2FnMjAwX2dldF9icHBfc2hpZnQoZmItPmZvcm1hdCk7DQo+IC0N
Cj4gLQlpZiAoZmItPmZvcm1hdC0+Y3BwWzBdICogOCA9PSAyNCkNCj4gLQkJb2Zmc2V0ID0g
KG9mZnNldCAqIDMpID4+ICg0IC0gYnBwc2hpZnQpOw0KPiAtCWVsc2UNCj4gLQkJb2Zmc2V0
ID0gb2Zmc2V0ID4+ICg0IC0gYnBwc2hpZnQpOw0KPiAtDQo+IC0JcmV0dXJuIG9mZnNldDsN
Cj4gKwlyZXR1cm4gZmItPnBpdGNoZXNbMF0gPj4gNDsNCg0KMjQtYml0IGlzIGRpZmZlcmVu
dCBmcm9tIHRoZSByZXN0LiBJIGRvbid0IHVuZGVyc3RhbmQgaG93IHlvdSBzaW1wbGlmaWVk
IA0KdGhpcyBjb2RlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgfQ0KPiAgIA0K
PiAgIHN0YXRpYyB2b2lkIG1nYWcyMDBfc2V0X29mZnNldChzdHJ1Y3QgbWdhX2RldmljZSAq
bWRldiwNCj4gQEAgLTMyNiw0OCArMzEyLDI1IEBAIHN0YXRpYyB2b2lkIG1nYWcyMDBfc2V0
X29mZnNldChzdHJ1Y3QgbWdhX2RldmljZSAqbWRldiwNCj4gICB2b2lkIG1nYWcyMDBfc2V0
X2Zvcm1hdF9yZWdzKHN0cnVjdCBtZ2FfZGV2aWNlICptZGV2LCBjb25zdCBzdHJ1Y3QgZHJt
X2Zvcm1hdF9pbmZvICpmb3JtYXQpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2ID0gJm1kZXYtPmJhc2U7DQo+IC0JdW5zaWduZWQgaW50IGJwcCwgYnBwc2hpZnQsIHNj
YWxlOw0KPiArCXVuc2lnbmVkIGludCBzY2FsZTsNCj4gICAJdTggY3J0Y2V4dDMsIHhtdWxj
dHJsOw0KPiAgIA0KPiAtCWJwcCA9IGZvcm1hdC0+Y3BwWzBdICogODsNCj4gLQ0KPiAtCWJw
cHNoaWZ0ID0gbWdhZzIwMF9nZXRfYnBwX3NoaWZ0KGZvcm1hdCk7DQo+IC0Jc3dpdGNoIChi
cHApIHsNCj4gLQljYXNlIDI0Og0KPiAtCQlzY2FsZSA9ICgoMSA8PCBicHBzaGlmdCkgKiAz
KSAtIDE7DQo+IC0JCWJyZWFrOw0KPiAtCWRlZmF1bHQ6DQo+IC0JCXNjYWxlID0gKDEgPDwg
YnBwc2hpZnQpIC0gMTsNCj4gLQkJYnJlYWs7DQo+IC0JfQ0KPiAtDQo+IC0JUlJFR19FQ1JU
KDMsIGNydGNleHQzKTsNCj4gLQ0KPiAtCXN3aXRjaCAoYnBwKSB7DQo+IC0JY2FzZSA4Og0K
PiAtCQl4bXVsY3RybCA9IE1HQTEwNjRfTVVMX0NUTF84Yml0czsNCj4gLQkJYnJlYWs7DQo+
IC0JY2FzZSAxNjoNCj4gLQkJaWYgKGZvcm1hdC0+ZGVwdGggPT0gMTUpDQo+IC0JCQl4bXVs
Y3RybCA9IE1HQTEwNjRfTVVMX0NUTF8xNWJpdHM7DQo+IC0JCWVsc2UNCj4gLQkJCXhtdWxj
dHJsID0gTUdBMTA2NF9NVUxfQ1RMXzE2Yml0czsNCj4gKwlzd2l0Y2ggKGZvcm1hdC0+Zm9y
bWF0KSB7DQo+ICsJY2FzZSBEUk1fRk9STUFUX1JHQjU2NToNCj4gKwkJeG11bGN0cmwgPSBN
R0ExMDY0X01VTF9DVExfMTZiaXRzOw0KPiAgIAkJYnJlYWs7DQo+IC0JY2FzZSAyNDoNCj4g
KwljYXNlIERSTV9GT1JNQVRfUkdCODg4Og0KPiAgIAkJeG11bGN0cmwgPSBNR0ExMDY0X01V
TF9DVExfMjRiaXRzOw0KPiAgIAkJYnJlYWs7DQo+IC0JY2FzZSAzMjoNCj4gKwljYXNlIERS
TV9GT1JNQVRfWFJHQjg4ODg6DQo+ICAgCQl4bXVsY3RybCA9IE1HQTEwNjRfTVVMX0NUTF8z
Ml8yNGJpdHM7DQo+ICAgCQlicmVhazsNCj4gICAJZGVmYXVsdDoNCj4gICAJCS8qIEJVRzog
V2Ugc2hvdWxkIGhhdmUgY2F1Z2h0IHRoaXMgcHJvYmxlbSBhbHJlYWR5LiAqLw0KPiAtCQlk
cm1fV0FSTl9PTihkZXYsICJpbnZhbGlkIGZvcm1hdCBkZXB0aFxuIik7DQo+ICsJCWRybV9X
QVJOX09OKGRldiwgImludmFsaWQgZHJtIGZvcm1hdFxuIik7DQo+ICAgCQlyZXR1cm47DQo+
ICAgCX0NCj4gICANCj4gLQljcnRjZXh0MyAmPSB+R0VOTUFTSygyLCAwKTsNCj4gLQljcnRj
ZXh0MyB8PSBzY2FsZTsNCj4gLQ0KPiAgIAlXUkVHX0RBQyhNR0ExMDY0X01VTF9DVEwsIHht
dWxjdHJsKTsNCj4gICANCj4gICAJV1JFR19HRlgoMCwgMHgwMCk7DQo+IEBAIC0zODMsNiAr
MzQ2LDEyIEBAIHZvaWQgbWdhZzIwMF9zZXRfZm9ybWF0X3JlZ3Moc3RydWN0IG1nYV9kZXZp
Y2UgKm1kZXYsIGNvbnN0IHN0cnVjdCBkcm1fZm9ybWF0X2luDQo+ICAgCVdSRUdfR0ZYKDcs
IDB4MGYpOw0KPiAgIAlXUkVHX0dGWCg4LCAweDBmKTsNCj4gICANCj4gKwkvKiBzY2FsZSBp
cyB0aGUgbnVtYmVyIG9mIGJ5dGVzIHBlciBwaXhlbHMgLSAxICovDQo+ICsJc2NhbGUgPSBm
b3JtYXQtPmNwcFswXSAtIDE7DQo+ICsNCj4gKwlSUkVHX0VDUlQoMywgY3J0Y2V4dDMpOw0K
PiArCWNydGNleHQzICY9IH5HRU5NQVNLKDIsIDApOw0KPiArCWNydGNleHQzIHw9IHNjYWxl
Ow0KPiAgIAlXUkVHX0VDUlQoMywgY3J0Y2V4dDMpOw0KPiAgIH0NCj4gICANCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYx
IE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRy
ZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcp
DQo=

--------------fs7KZuOHKFuGbus3Uv4xaG68--

--------------w1dw0EFsZmeCdVGUyp3opTF1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRYqEMFAwAAAAAACgkQlh/E3EQov+AW
ehAAoNo3HpmaZ0bgqj3gJhBO20WXXi2fu5I0QU9QUoZSfRnrVYg6k2ucHtDSN9SI5U4AcEyZGS5p
B5UmZ4fOU1zy7bFva6McExakLszNAhlIs/B0TyUSWeoS+o62IwpfikAzROlk66CJ1QwuCWZif+b9
B0948Uf6BCnjlUYtA8+5+lXeVzjqRyDK3dHPtnRTCvxLFwGWGOEc0Hfua9Lq/upNeqGuDv2rdRNR
S0Nh5x9bdtRPbk/CbEJY9GKxy6Lsj0kMxBlZGQXPQ8OjVuHlOfAV6/WCVxRuXRM9fy0F0D+oIkjJ
iV+bCAyq3izPlLx6higG/EZPNoZ1giOLgT/d7f4jY02JNn0yKHM1BGnMmZnCTawBw3GKWSVc7mZp
QEfV1MGF1sMXYUrAHgjML4A/IjfILhwCWfLQJ3Kd7OpM8nrHVI3JzI09Wyh0QHHKmocpkPz1Dhjc
9PisVfXkQH908v/IxuvjkqSf9GKNGFoWu9q33XJcY5crEj5xBFejLqvQIlu4Uj0dtE9sM2D8TNkX
dK2v8fME+NwicC9TEwpqnXuryeo2woG9TXjte+zQ8CrZR+ZZw1pfgkH0HbvWklk/4+fzCfhpzQdR
d63sIh7V8cC9t8z3SiynJUB0fxMPD/83OmUS9YgxYm2sY6jkKe8OXPUgQmNXfCpI5WNUylzHR8yn
H0E=
=9d1X
-----END PGP SIGNATURE-----

--------------w1dw0EFsZmeCdVGUyp3opTF1--
