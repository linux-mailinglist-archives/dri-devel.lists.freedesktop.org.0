Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D8474995F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 12:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6108D10E4DA;
	Thu,  6 Jul 2023 10:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40A8A10E4CC
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jul 2023 10:26:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0B63F200B2;
 Thu,  6 Jul 2023 10:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688639216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3gQNTfxDoRD8rdHObuMao1+WZbHvbL39JlK39qTdFeM=;
 b=i9fHWkEWuUfHWH/ktDOG8PYczjK60WUndOxYmZN1HXoFl3+I3QzAD0du1vTX6aH1lyVqEr
 Ui27Cqqc90GpJnjWVOEb9tzPI18mTEEG0ZS5jW8LDPbG0dxzGBGb1cWwPkIFI36l3JwGQB
 INmApiRWyaUT3+JoZ/kmxaQ90eMT+XA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688639216;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3gQNTfxDoRD8rdHObuMao1+WZbHvbL39JlK39qTdFeM=;
 b=QeM5H/1cYJR8XRzcG3mYsIxJv+CH0Wmcz0NSCjFBChUvHjbT+mRbcFsoputxzFjohw+ZKi
 qtN1twrIhVIozCAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE8C9138FC;
 Thu,  6 Jul 2023 10:26:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RcUKMe+WpmSsdAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 06 Jul 2023 10:26:55 +0000
Message-ID: <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
Date: Thu, 6 Jul 2023 12:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AKarCMqhOkkifhvugZj6Otcd"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AKarCMqhOkkifhvugZj6Otcd
Content-Type: multipart/mixed; boundary="------------J1r7YiWZCEg2KGE3VYQWviYW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <43d12606-9c81-99f8-f13c-14338fcd7a28@suse.de>
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
References: <20230623094639.434293-1-jfalempe@redhat.com>
 <878rbv20dp.fsf@intel.com> <13e35996-914d-37a6-1697-ac0c3c75cad1@redhat.com>
 <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>
In-Reply-To: <ed075f2f-861d-74d1-efc0-5baa2cd601fd@redhat.com>

--------------J1r7YiWZCEg2KGE3VYQWviYW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDcuMjMgdW0gMTE6MTYgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDA0LzA3LzIwMjMgMTg6NDUsIEpvY2VseW4gRmFsZW1wZSB3cm90ZToNCj4+IE9uIDA0
LzA3LzIwMjMgMTY6NTQsIEphbmkgTmlrdWxhIHdyb3RlOg0KPj4+IE9uIEZyaSwgMjMgSnVu
IDIwMjMsIEpvY2VseW4gRmFsZW1wZSA8amZhbGVtcGVAcmVkaGF0LmNvbT4gd3JvdGU6DQo+
Pj4+IFNpbmNlIGNvbW1pdCBmYWU3ZDE4NjQwM2UgKCJkcm0vcHJvYmUtaGVscGVyOiBEZWZh
dWx0IHRvIDY0MHg0ODAgaWYgbm8NCj4+Pj4gwqAgRURJRCBvbiBEUCIpDQo+Pj4+IFRoZSBk
ZWZhdWx0IHJlc29sdXRpb24gaXMgbm93IDY0MHg0ODAgd2hlbiBubyBtb25pdG9yIGlzIGNv
bm5lY3RlZC4NCj4+Pj4gQnV0IEFzcGVlZCBncmFwaGljcyBpcyBtb3N0bHkgdXNlZCBpbiBz
ZXJ2ZXJzLCB3aGVyZSBubyBtb25pdG9yDQo+Pj4+IGlzIGF0dGFjaGVkLiBUaGlzIGFsc28g
YWZmZWN0cyB0aGUgInJlbW90ZSIgcmVzb2x1dGlvbiB0byA2NDB4NDgwLCANCj4+Pj4gd2hp
Y2ggaXMNCj4+Pj4gaW5jb252ZW5pZW50LCBhbmQgYnJlYWtzIHRoZSBhbmFjb25kYSBpbnN0
YWxsZXIuDQo+Pj4+IFNvIHdoZW4gbm8gRURJRCBpcyBwcmVzZW50LCBzZXQgMTAyNHg3Njgg
YXMgcHJlZmVycmVkIHJlc29sdXRpb24uDQo+Pj4NCj4+PiBUaGlzIGNvbmZsYXRlcyAibW9u
aXRvciBjb25uZWN0ZWQiIGFuZCAiRURJRCBwcmVzZW50Iiwgd2hpY2ggYXJlIG5vdA0KPj4+
IG5lY2Vzc2FyaWx5IHRoZSBzYW1lIHRoaW5nLg0KPj4+DQo+Pj4gVGhlIGZhbGxiYWNrIGlu
IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9tb2RlcygpIGlzIGZvciBubw0K
Pj4+IG1vZGVzLCBidXQgY29ubmVjdG9yIHN0YXR1cyBpcyBjb25uZWN0ZWQgb3IgdW5rbm93
bi4NCj4+DQo+PiBXaGVuIGRlYnVnZ2luZyB0aGUgaXNzdWUsIEkgZm91bmQgaXQgc3VycHJp
c2luZyB0aGF0IHRoZSBzdGF0dXMgaXMgDQo+PiAiY29ubmVjdGVkIiB3aGVuIG5vdGhpbmcg
aXMgcGx1Z2dlZCBpbiB0aGUgRFAgcG9ydC4NCj4+Pg0KPj4+IFlvdSBjb3VsZCBhZGQgYSBj
b25uZWN0b3IgLT5kZXRlY3QgY2FsbGJhY2sgdGhhdCByZXR1cm5zIGRpc2Nvbm5lY3RlZA0K
Pj4+IHdoZW4gdGhlcmUncyBubyBkaXNwbGF5LCBhbmQgdGhlIHByb2JsZW0gc2hvdWxkIGdv
IGF3YXkuIElmIHRoZXJlJ3Mgbm8NCj4+PiAtPmRldGVjdCBjYWxsYmFjaywgaXQnbGwgZGVm
YXVsdCB0byBjb25uZWN0ZWQuDQo+Pg0KPj4gb2ssIEknbGwgdHJ5IHRoYXQuIEkgZG9uJ3Qg
a25vdyBob3cgdGhlIGhhcmR3YXJlIGRldGVjdCBzb21ldGhpbmcgaXMgDQo+PiBjb25uZWN0
ZWQsIGJ1dCBsb29raW5nIGF0IHRoZSBkcCBjb2RlLCBtYXliZSBjaGVja2luZyANCj4+ICJB
U1RfSU9fQ1JUQ19QT1JULDB4REMsIEFTVERQX0xJTktfU1VDQ0VTUyIgd291bGQgYmUgZ29v
ZCBlbm91Z2guDQo+IA0KPiBJJ3ZlIHRlc3RlZCB0aGlzIGFwcHJvYWNoLCBhbmQgaXQgd29y
a3MuIEJ1dCBvbiB0aGUgc2VydmVyIEknbSB0ZXN0aW5nLCANCj4gdGhlcmUgYXJlIFZHQSBh
bmQgRFAgb3V0cHV0LiBJIHRoaW5rIG9uIGEgc2VydmVyIHRoYXQgaGFzIG9ubHkgb25lIERQ
IA0KPiBvdXRwdXQsIGlmIG5vIG1vbml0b3IgaXMgY29ubmVjdGVkLCB0aGVuIG5vIG1vZGVz
IHdpbGwgYmUgcmVwb3J0ZWQgdG8gDQo+IHVzZXJzcGFjZSwgYW5kIHRoZSByZW1vdGUgQk1D
IG1heSBub3Qgd29yayA/DQoNCllvdSBjb3VsZCBvdXQtY29tbWVudCB0aGUgVkdBIGNvZGUg
aW4gdGhlIGFzdCBkcml2ZXIgZm9yIHRlc3RpbmcuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gDQo+IEFsc28gSSBkb24ndCBoYXZlIHBoeXNpY2FsIGFjY2VzcyB0byB0aGUgc2Vy
dmVyLCBzbyBJIG9ubHkgdGVzdGVkIHdoZW4gDQo+IG5vIG1vbml0b3IgaXMgcGx1Z2dlZC4N
Cj4gDQo+IEkgd2lsbCBzZW5kIHNob3J0bHkgYSB2MiB3aXRoIHRoaXMgY2hhbmdlLCBzbyBv
dGhlcnMgY2FuIGhlbHAgbWUgdGVzdCANCj4gdGhpcyBjYXNlLg0KPiANCj4gQmVzdCByZWdh
cmRzLA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------J1r7YiWZCEg2KGE3VYQWviYW--

--------------AKarCMqhOkkifhvugZj6Otcd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSmlu4FAwAAAAAACgkQlh/E3EQov+C7
RA/+MxuaM8j6DquJ3JNd2KmDczPhHOAJbI2fS2G6DNBzR2JvdCYZXxcpy6/xwW0ySUNiX/varKfB
iMamJkJN7Jhz7zbf0/4MWFbSMFLRRsUt+UwkDGn/e2EGiAsxNHU1rdGgeHWi5TpcoRSivz2OelwE
vOQQt/45dq/n+JlPsbQD4szUidUcXZSpX32gqqe8hvH//LrPTwdgNDUMdnAiX79oHKP71dPKCWuM
6BJjpG84ulZDRPwectYQwRJpyvh3cfw13wfV5VEdO9Kblj+V+bux77LPUCyjeMWLWpvoU7hp0N5A
FsnbxCfRKW0dHprm00+H1bCpAZMi8dQcwmbq7VgKxmyduydtjvOC+bRJQHDqfAkhMPXwc68tfybW
In31ipd3JiTHfKQDVBvP6mFWuBCf3d7ta72RdVaxYEHSucRxqDR+0fKpxikWbl1sq02kQZfZfNfm
90XdpP6ulV49cEXhWsXJ2ZjKjrgHHI4HXV2YPuvw9Bph7M4zqFBGXTUwAoLzmBCRsrfLxvsZrroR
XtqeGnkXmu+VrVp/bXNIWKLPbhtWsx2ZtwQqEqfsJb4Bb7mlWPsFJjwQJeMSKQ8yldba6Z0r8Kne
PdNFwKRSP5hmjyJ75XrDGgXJTKorAiLqTjvsRM3IMqt/lBxrWgQJBKwqEOkkbrbJ05BUaHofucX1
IZE=
=0I1t
-----END PGP SIGNATURE-----

--------------AKarCMqhOkkifhvugZj6Otcd--
