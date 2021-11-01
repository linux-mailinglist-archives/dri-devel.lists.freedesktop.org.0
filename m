Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB63F441BD1
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 14:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7236E500;
	Mon,  1 Nov 2021 13:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 373716E49F
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 13:38:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6DF501FD74;
 Mon,  1 Nov 2021 13:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635773886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wLiN18sLw1uJWAgcu8xmOdtsAs9RyIs3NV9y1iWZeDM=;
 b=wKsCM2OWOB/M9NIao01E0tII5rTJRgrEFcdakFxnGN9TKlUIzkvu0Ah/qUhndmxc2tIN+P
 +/mn6plomLwaJhnuE2OkO756/eWVwwpUhyUZDizqIKAmyBoAMo6Y5O1tjU1KEFYw+SSaki
 OF4RuaOZkZ/auzX20glN4DkYr4AyHMk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635773886;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wLiN18sLw1uJWAgcu8xmOdtsAs9RyIs3NV9y1iWZeDM=;
 b=20n3NMKDWWsv9CVMNKUlPYMIWXSYDo4SmiftMeZEKfpjcL5dmy02cPZpwS8z0JQ17UnEDa
 +bLs99LtC8xwS4Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 074A3133FE;
 Mon,  1 Nov 2021 13:38:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1syCAL7tf2GiEgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 13:38:06 +0000
Message-ID: <ee7192f4-b224-7bda-27a7-a374c15dcfa8@suse.de>
Date: Mon, 1 Nov 2021 14:38:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 4/9] drm/format-helper: Rework format-helper conversion
 functions
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-5-tzimmermann@suse.de>
 <34b8daf3-b6b4-02fb-9e10-ef11c0848572@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <34b8daf3-b6b4-02fb-9e10-ef11c0848572@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ik4840aMNQn2g0HJASDW1KEo"
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
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ik4840aMNQn2g0HJASDW1KEo
Content-Type: multipart/mixed; boundary="------------VABQMuJFLnMGUMfGTpGe70Pd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Message-ID: <ee7192f4-b224-7bda-27a7-a374c15dcfa8@suse.de>
Subject: Re: [PATCH 4/9] drm/format-helper: Rework format-helper conversion
 functions
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-5-tzimmermann@suse.de>
 <34b8daf3-b6b4-02fb-9e10-ef11c0848572@tronnes.org>
In-Reply-To: <34b8daf3-b6b4-02fb-9e10-ef11c0848572@tronnes.org>

--------------VABQMuJFLnMGUMfGTpGe70Pd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMTAuMjEgdW0gMTM6MzIgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6DQo+
IA0KPiANCj4gRGVuIDIyLjEwLjIwMjEgMTUuMjgsIHNrcmV2IFRob21hcyBaaW1tZXJtYW5u
Og0KPj4gTW92ZSBkZXN0aW5hdGlvbi1idWZmZXIgY2xpcHBpbmcgZnJvbSBhbGwgZm9ybWF0
LWhlbHBlciBjb252ZXJzaW9uDQo+PiBmdW5jdGlvbnMgaW50byBjYWxsZXJzLiBTdXBwb3J0
IGRlc3RpbmF0aW9uLWJ1ZmZlciBwaXRjaC4gT25seQ0KPj4gZGlzdGluZ3Vpc2ggYmV0d2Vl
biBzeXN0ZW0gYW5kIEkvTyBtZW1vcnksIGJ1dCB1c2Ugc2FtZSBsb2dpYw0KPj4gZXZlcnl3
aGVyZS4NCj4+DQo+PiBTaW1wbHkgaGFybW9uaXplIHRoZSBpbnRlcmZhY2UgYW5kIHNlbWFu
dGljcyBvZiB0aGUgZXhpc3RpbmcgY29kZS4NCj4+IE5vdCBhbGwgY29udmVyc2lvbiBoZWxw
ZXJzIHN1cHBvcnQgYWxsIGNvbWJpbmF0aW9ucyBvZiBwYXJhbWV0ZXJzLg0KPj4gV2UgaGF2
ZSB0byBhZGQgYWRkaXRpb25hbCBmZWF0dXJlcyB3aGVuIHdlIG5lZWQgdGhlbS4NCj4+DQo+
PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCj4+IC0tLQ0KPiANCj4+ICAgLyoqDQo+PiAgICAqIGRybV9mYl94cmdiODg4OF90b19n
cmF5OCAtIENvbnZlcnQgWFJHQjg4ODggdG8gZ3JheXNjYWxlDQo+PiAgICAqIEBkc3Q6IDgt
Yml0IGdyYXlzY2FsZSBkZXN0aW5hdGlvbiBidWZmZXINCj4+ICsgKiBAZHN0X3BpdGNoOiBO
dW1iZXIgb2YgYnl0ZXMgYmV0d2VlbiB0d28gY29uc2VjdXRpdmUgc2NhbmxpbmVzIHdpdGhp
biBkc3QNCj4+ICAgICogQHZhZGRyOiBYUkdCODg4OCBzb3VyY2UgYnVmZmVyDQo+PiAgICAq
IEBmYjogRFJNIGZyYW1lYnVmZmVyDQo+PiAgICAqIEBjbGlwOiBDbGlwIHJlY3RhbmdsZSBh
cmVhIHRvIGNvcHkNCj4+IEBAIC00MTUsMTYgKzQxNywyMSBAQCBFWFBPUlRfU1lNQk9MKGRy
bV9mYl94cmdiODg4OF90b19yZ2I4ODhfZHN0Y2xpcCk7DQo+PiAgICAqDQo+PiAgICAqIElU
VSBCVC42MDEgaXMgdXNlZCBmb3IgdGhlIFJHQiAtPiBsdW1hIChicmlnaHRuZXNzKSBjb252
ZXJzaW9uLg0KPj4gICAgKi8NCj4+IC12b2lkIGRybV9mYl94cmdiODg4OF90b19ncmF5OCh1
OCAqZHN0LCB2b2lkICp2YWRkciwgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+PiAt
CQkJICAgICAgIHN0cnVjdCBkcm1fcmVjdCAqY2xpcCkNCj4+ICt2b2lkIGRybV9mYl94cmdi
ODg4OF90b19ncmF5OCh2b2lkICpkc3QsIHVuc2lnbmVkIGludCBkc3RfcGl0Y2gsIGNvbnN0
IHZvaWQgKnZhZGRyLA0KPj4gKwkJCSAgICAgIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZm
ZXIgKmZiLCBjb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApDQo+PiAgIHsNCj4+ICAgCXVu
c2lnbmVkIGludCBsZW4gPSAoY2xpcC0+eDIgLSBjbGlwLT54MSkgKiBzaXplb2YodTMyKTsN
Cj4+ICAgCXVuc2lnbmVkIGludCB4LCB5Ow0KPj4gICAJdm9pZCAqYnVmOw0KPj4gLQl1MzIg
KnNyYzsNCj4+ICsJdTggKmRzdDg7DQo+PiArCXUzMiAqc3JjMzI7DQo+PiAgIA0KPj4gICAJ
aWYgKFdBUk5fT04oZmItPmZvcm1hdC0+Zm9ybWF0ICE9IERSTV9GT1JNQVRfWFJHQjg4ODgp
KQ0KPj4gICAJCXJldHVybjsNCj4+ICsNCj4+ICsJaWYgKCFkc3RfcGl0Y2gpDQo+IA0KPiBs
ZW4gaXMgc291cmNlIGxlbmd0aCAoc2hvdWxkIHJlYWxseSBoYXZlIGJlZW4gbmFtZWQgc3Jj
X2xlbikgd2hpY2gNCj4gcmVzdWx0cyBpbiBhIGtlcm5lbCBjcmFzaDoNCj4gDQo+PiArCQlk
c3RfcGl0Y2ggPSBsZW47DQo+IA0KPiBUaGlzIHdvcmtzOg0KPiANCj4gCQlkc3RfcGl0Y2gg
PSBkcm1fcmVjdF93aWR0aChjbGlwKTsNCg0KRml4ZWQgaW4gdGhlIG5leHQgcmV2aXNpb24u
IFRoYW5rIHlvdSBzbyBtdWNoIQ0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBX
aXRoIHRoYXQgZml4ZWQ6DQo+IA0KPiBUZXN0ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9y
YWxmQHRyb25uZXMub3JnPg0KPiBSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hubmVzIDxub3Jh
bGZAdHJvbm5lcy5vcmc+DQo+IA0KPj4gKw0KPj4gICAJLyoNCj4+ICAgCSAqIFRoZSBjbWEg
bWVtb3J5IGlzIHdyaXRlLWNvbWJpbmVkIHNvIHJlYWRzIGFyZSB1bmNhY2hlZC4NCj4+ICAg
CSAqIFNwZWVkIHVwIGJ5IGZldGNoaW5nIG9uZSBsaW5lIGF0IGEgdGltZS4NCj4+IEBAIC00
MzMsMjAgKzQ0MCwyMiBAQCB2b2lkIGRybV9mYl94cmdiODg4OF90b19ncmF5OCh1OCAqZHN0
LCB2b2lkICp2YWRkciwgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+PiAgIAlpZiAo
IWJ1ZikNCj4+ICAgCQlyZXR1cm47DQo+PiAgIA0KPj4gKwl2YWRkciArPSBjbGlwX29mZnNl
dChjbGlwLCBmYi0+cGl0Y2hlc1swXSwgc2l6ZW9mKHUzMikpOw0KPj4gICAJZm9yICh5ID0g
Y2xpcC0+eTE7IHkgPCBjbGlwLT55MjsgeSsrKSB7DQo+PiAtCQlzcmMgPSB2YWRkciArICh5
ICogZmItPnBpdGNoZXNbMF0pOw0KPj4gLQkJc3JjICs9IGNsaXAtPngxOw0KPj4gLQkJbWVt
Y3B5KGJ1Ziwgc3JjLCBsZW4pOw0KPj4gLQkJc3JjID0gYnVmOw0KPj4gKwkJZHN0OCA9IGRz
dDsNCj4+ICsJCXNyYzMyID0gbWVtY3B5KGJ1ZiwgdmFkZHIsIGxlbik7DQo+PiAgIAkJZm9y
ICh4ID0gY2xpcC0+eDE7IHggPCBjbGlwLT54MjsgeCsrKSB7DQo+PiAtCQkJdTggciA9ICgq
c3JjICYgMHgwMGZmMDAwMCkgPj4gMTY7DQo+PiAtCQkJdTggZyA9ICgqc3JjICYgMHgwMDAw
ZmYwMCkgPj4gODsNCj4+IC0JCQl1OCBiID0gICpzcmMgJiAweDAwMDAwMGZmOw0KPj4gKwkJ
CXU4IHIgPSAoKnNyYzMyICYgMHgwMGZmMDAwMCkgPj4gMTY7DQo+PiArCQkJdTggZyA9ICgq
c3JjMzIgJiAweDAwMDBmZjAwKSA+PiA4Ow0KPj4gKwkJCXU4IGIgPSAgKnNyYzMyICYgMHgw
MDAwMDBmZjsNCj4+ICAgDQo+PiAgIAkJCS8qIElUVSBCVC42MDE6IFkgPSAwLjI5OSBSICsg
MC41ODcgRyArIDAuMTE0IEIgKi8NCj4+IC0JCQkqZHN0KysgPSAoMyAqIHIgKyA2ICogZyAr
IGIpIC8gMTA7DQo+PiAtCQkJc3JjKys7DQo+PiArCQkJKmRzdDgrKyA9ICgzICogciArIDYg
KiBnICsgYikgLyAxMDsNCj4+ICsJCQlzcmMzMisrOw0KPj4gICAJCX0NCj4+ICsNCj4+ICsJ
CXZhZGRyICs9IGZiLT5waXRjaGVzWzBdOw0KPj4gKwkJZHN0ICs9IGRzdF9waXRjaDsNCj4+
ICAgCX0NCj4+ICAgDQo+PiAgIAlrZnJlZShidWYpOw0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------VABQMuJFLnMGUMfGTpGe70Pd--

--------------Ik4840aMNQn2g0HJASDW1KEo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF/7b0FAwAAAAAACgkQlh/E3EQov+CX
XQ//d0L2IXRc76H4Xcb3taJQAbxK8uG/sJhuby3sJDXodEI3iJl97yBX9W+7GUCT+5aI6uocjzWz
/RARkIOaVlp2kbqQ1w9JHS8eDlkHvHqRib6qRCgwHOln0IRBqnKLbmacAe8jv4aGoW9ONi7txfyF
IaEp0V/iaqeiP85JWJSCpVNvYfV0jRQxkCKgBtQmHKi+aum9cduFVtsuFwoxMyY+pK90VaWG9Vgs
7WUhbjW8E8F7nMo9glhg4iUEVTZmohFX5L/LCneR0ntfCxRtbBqEozXjJ5NgD5vI4JueDd9xVDZO
H8/2N5ff7/NGxAN7LounBgMXB+Q+j+bSSfkcqOhyP8dWUzqrJG1rVF3m23Sxe7R+2Kl8NTuuNepm
gpBVdzS2KpuDJE2h37E8QtK1nRS75zqx9MOw/hdsCEzVunowh5fPyCIO5oy+WF+hLlJ+x9OeGZ7q
otWU7uLlCaPr3wYSMpgff4Q8mjBNLgYRMRDzHHadV0wQ9uieVB6pYp6TIJejp74A6naGdHaig0k3
LzMqW5LRssM31KrME+JB+Qoz1FvAux6ibe+zu9TpvHy/StBHDErM5Ek2VDOhRlKbYlEm1KbtfrcU
Jymcm5CisrVFocfbW4bUpVwlOrcXWsCNYHFfTh7ycEsLbKoPJY6HYLe+3nHBm3Mu9QRdi2tMHdq8
b4U=
=sNHJ
-----END PGP SIGNATURE-----

--------------Ik4840aMNQn2g0HJASDW1KEo--
