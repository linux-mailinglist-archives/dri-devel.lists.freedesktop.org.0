Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FB25B8C1B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 17:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 728AD10E042;
	Wed, 14 Sep 2022 15:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EEF810E042
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 15:41:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C11BF1FD9D;
 Wed, 14 Sep 2022 15:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663170110; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/yykIxeErGLDCCP5mjhpzmouoII/anyft6RuBsRUgC0=;
 b=CHGNHYkWHu4WOgSKGYbrtaZ1aKTdGDx9DpIbUnC49hVNhqLR34+X6emA2wTE990BhkPWMi
 44YjWqx2DfX4RQpzCdwlLjr8LVGU1zHO+1b5UkN47kGpCpKanY9OG7pxhvD/V3fIaMMA0q
 a1zH4z/2ruT+ylMCdzdFwKVEeSzEmvQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663170110;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/yykIxeErGLDCCP5mjhpzmouoII/anyft6RuBsRUgC0=;
 b=leEFJLPaKONA2ELGBPRC+SDY4ssuGd9reFtE+azSGjM6ifS9nC4yG3te06N69588Lvtrdp
 wlTPG4twwdd4JQCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC86D13494;
 Wed, 14 Sep 2022 15:41:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wtEoKT72IWM+UwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 14 Sep 2022 15:41:50 +0000
Message-ID: <9e801194-ea74-7298-c08c-de5eeb7444e6@suse.de>
Date: Wed, 14 Sep 2022 17:41:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
Content-Language: en-US
To: Wang Yugui <wangyugui@e16-tech.com>
References: <20220914162920.7233.409509F4@e16-tech.com>
 <03f80477-78c1-2ef3-40bf-58f8c9daa1c8@suse.de>
 <20220914225809.763F.409509F4@e16-tech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220914225809.763F.409509F4@e16-tech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7wtmPd0soFMJ29lpNLDJrrKM"
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7wtmPd0soFMJ29lpNLDJrrKM
Content-Type: multipart/mixed; boundary="------------BARFtNoGwG7fUtGkO4Sh3CuU";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Wang Yugui <wangyugui@e16-tech.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <9e801194-ea74-7298-c08c-de5eeb7444e6@suse.de>
Subject: Re: mgag200 broken on kernel-6.0-rc3 on DELL/T620
References: <20220914162920.7233.409509F4@e16-tech.com>
 <03f80477-78c1-2ef3-40bf-58f8c9daa1c8@suse.de>
 <20220914225809.763F.409509F4@e16-tech.com>
In-Reply-To: <20220914225809.763F.409509F4@e16-tech.com>

--------------BARFtNoGwG7fUtGkO4Sh3CuU
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDkuMjIgdW0gMTY6NTggc2NocmllYiBXYW5nIFl1Z3VpOg0KPiBIaSwN
Cj4gDQo+PiAoY2M6IEpvY2VseW4pDQo+Pg0KPj4gSGkNCj4+DQo+PiBBbSAxNC4wOS4yMiB1
bSAxMDoyOSBzY2hyaWViIFdhbmcgWXVndWk6DQo+Pj4gSGksDQo+Pj4NCj4+Pg0KPj4+PiBI
aQ0KPj4+Pg0KPj4+PiBBbSAxMy4wOS4yMiB1bSAxNzoxNSBzY2hyaWViIFdhbmcgWXVndWk6
DQo+Pj4+IFsuLi5dDQo+Pj4+Pj4+DQo+Pj4+Pj4+IHNvIEkgdHJpZWQgdG8gcmV2ZXJ0IHBh
dGNoIG9mIG1nYWcyMDAgZHJpdmVyIGluIGJhdGNoIG9mIDIgb3IgMywgdGhlIEkNCj4+Pj4+
Pj4gbm90aWNlZCB0aGUgcGF0Y2ggJ1N1YmplY3Q6IGRybS9tZ2FnMjAwOiBSZW1vdmUgc3Bl
Y2lhbCBjYXNlIGZvciBHMjAwU0UNCj4+Pj4+Pj4gd2l0aCA8MiBNaUInIGFuZCB0aGVuIHRy
aWVkIHRoaXMgZGlydHkgZml4Lg0KPj4+Pj4+DQo+Pj4+Pj4gT2gsIGdyZWF0IHdvcmshIFRo
YW5rIHlvdS4gRnJvbSBsb29raW5nIGF0IHRoZSBzY3JlZW5zaG90IHRoYXQgeW91IHByb3Zp
ZGVkLCBpdCBzZWVtcyBhcyBpZiB0aGUgMjQtYml0IG1vZGUgc2V0dGluZyBpcyBicm9rZW4u
IEknbSBub3Qgc3VyZSB3aHkgdGhlIEcyMDBTRSB3b3JrYXJvdW5kIGFwcGxpZXMgdG8gYSBH
MjAwRVIsIGJ1dCB3ZSdsbCBzZWUuDQo+Pj4+Pg0KPj4+Pj4gSSB0ZXN0ZWQgJ3ByZWZlcnJl
ZF9kZXB0aCA9IDMyJyB0b28uIGl0IHdvcmtzIG9uIFQ2MzAgdG9vLg0KPj4+Pj4NCj4+Pj4+
IHNvIGJvdGggMTYgYW5kIDMyIHdvcmssIGJ1dCAyNCBmYWlsZWQgb24gREVMTC9UNjMwLg0K
Pj4+Pg0KPj4+PiBJIHRyaWVkIG9uIG15IHRlc3QgbWFjaGluZSB3aXRoIGEgNS4xOSBrZXJu
ZWwgYW5kIGZvdW5kIHRoYXQgMzItYml0IGFuZCAyNC1iaXQgcGl4ZWxzIHdvcmssIGJ1dCAx
Ni1iaXQgbG9va3MgaW5jb3JyZWN0Lg0KPj4+Pg0KPj4+PiBXaGF0IGFyZSB0aGUgcmVzdWx0
cyBpZiB5b3UgYm9vdCB5b3VyIGtlcm5lbCA1LjE5LjMgd2l0aCB0aGUgcGFyYW1ldGVyIHZp
ZGVvPTEwMjR4NzY4LTI0PyBUaGlzIHNob3VsZCBlbmFibGUgMjQtYml0IHBpeGVscy4NCj4+
Pj4NCj4+Pj4gSG93IGRvZXMgdmlkZW89MTAyNHg3NjgtMTYgbG9vayB3aXRoIHRoZSA1LjE5
IGtlcm5lbD8NCj4+Pg0KPj4+IHRlc3QgcmVzdWx0IGhlcmUNCj4+PiBrZXJuZWwgNS4xOS4z
ICYgdmlkZW89MTAyNHg3NjgtMjQNCj4+PiAJZGVsbC9UNjIwL2NlbnRvcy04LjUJYnJva2Vu
DQo+Pj4gCWRlbGwvVDYzMC9jZW50b3MtNy45CWJyb2tlbg0KPj4NCj4+IEkgYXNzdW1lIHRo
YXQgQ2VudG9zIDcgYW5kIDggaGF2ZSBmYWlybHkgb2xkIGtlcm5lbHM/IFNvIGl0J3MgYmVl
biBhIGxvbmctc3RhbmRpbmcgYnVnLg0KPiANCj4gV2UgaW5zdGFsbCBrZXJuZWwgNS4xOS4z
LzUuMTUuNjcgaW50byBDZW50b3MgNyBhbmQgOC4NCj4gZGVmYXVsdCBpdCB3b3JrIHdlbGwu
ICBicm9rZW4ganVzdCB3aGVuICd2aWRlbz0xMDI0eDc2OC0yNCcsIHNvIGl0IG1heQ0KPiBu
b3QgYSBsb25nLXN0YW5kaW5nIGJ1Zy4NCg0KSSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kLiBE
b2VzICd2aWRlbz0xMDI0eDc2OC0yNCcgd29yayB3aXRoIDUuMTUuNjc/DQoNCj4gDQo+PiAy
NC1iaXQgd29ya3Mgb24gbXkgRzIwMEhFIGFuZCBHMjAwIHRlc3QgbWFjaGluZXMuIE1heWJl
IHRoZSBHMjAwRVIgaGFzIGEgYnVnLg0KPj4NCj4+IFdoZW4gSSB0cnkgMTYtYml0IGRlcHRo
LCB0aGUgZGlzcGxheSB3b3JrcywgYnV0IGlzIHdheSB0b28gZGFyay4gTm8gZmlkZGxpbmcg
d2l0aCB0aGUgTFVUIHRhYmxlcyBmaXhlcyB0aGlzLiBJdCdzIDkwcyBoYXJkd2FyZSwgc28g
aXQgc2hvdWxkIHN1cHBvcnQgMTYtYml0IGZyYW1lYnVmZmVycyB3ZWxsLCBidXQgdGhlcmUn
cyBubyBvYnZpb3VzIGJ1ZyB0byBiZSBzZWVuLg0KPj4NCj4+IEkgZ3Vlc3MsIHdlIGNvdWxk
IHJlbW92ZSAxNiBhbmQgMjQgYml0IHN1cHBvcnQgZm9yIG5vdyBpZiBub3RoaW5nIGVsc2Ug
aGVscHMuDQo+IA0KPiANCj4gbWF5YmUgYmV0dGVyIGlmIHdlIHJldmVydCA3M2Y1NGQ1ZDk2
ODIgKGRybS9tZ2FnMjAwOiBSZW1vdmUgc3BlY2lhbCBjYXNlDQo+IGZvciBHMjAwU0Ugd2l0
aCA8MiBNaUIpDQo+IA0KPiBiZWNhdXNlIHRoZXJlIGlzIG5vIHRlc3QgcmVzdWx0IG9uIGRl
dmljZSBHMjAwX1NFDQoNCldlIGNhbm5vdCByZXZlcnQgaXQgZGlyZWN0bHksIGJ1dCB0b21v
cnJvdyBJJ2xsIHNlbmQgeW91IGEgcGF0Y2ggdGhhdCANCnNob3VsZCByZXN0b3JlIHRoZSBv
bGQgYmVoYXZpb3IuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IHN0YXRpYyB1
bnNpZ25lZCBpbnQgbWdhZzIwMF9wcmVmZXJyZWRfZGVwdGgoc3RydWN0IG1nYV9kZXZpY2Ug
Km1kZXYpDQo+IHsNCj4gICAgICAgICBpZiAoSVNfRzIwMF9TRShtZGV2KSAmJiBtZGV2LT52
cmFtX2ZiX2F2YWlsYWJsZSA8ICgyMDQ4KjEwMjQpKQ0KPiAgICAgICAgICAgICAgICAgcmV0
dXJuIDE2Ow0KPiAgICAgICAgIGVsc2UNCj4gICAgICAgICAgICAgICAgIHJldHVybiAzMjsN
Cj4gfQ0KPiANCj4gQmVzdCBSZWdhcmRzDQo+IFdhbmcgWXVndWkgKHdhbmd5dWd1aUBlMTYt
dGVjaC5jb20pDQo+IDIwMjIvMDkvMTQNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------BARFtNoGwG7fUtGkO4Sh3CuU--

--------------7wtmPd0soFMJ29lpNLDJrrKM
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMh9j4FAwAAAAAACgkQlh/E3EQov+Db
Rw/8DopiVSWUx5wXAIZ/3c4qx4iJ6ZT+H7IngNs2VbdmnH1N/Mn1DdvTAbL87RyqhS6vVQPbU392
Od4cxf07/zmYGkDlX8WDM3CFipU9Y1kZgk9K5jYhrhd+bEFukUD2xhY6t40yyK4/1VxXOHROjYQk
dZEvrAuPhodlINrB+hwJMsMtnZ9PhNdviV6sOKxgmBoB8vqXshlEm1OipA6CeCTi99p7xiHLP61d
m7ejfRMqflZ6xIH6HQ4jSSseneHvcPsaVzKIqQpgBozsz6P5Iej+O/RTJnR08w0ZIa2YqfB+EG44
3r6idpvwKIDL6pqXPILLJMjWtBrA1xOs7bn4EER9AkEqeDECV4HYxhS0Di6navLD80NbQG11/Owi
slfyLktXCTNEZyzmN1wKdKLtAd10vcsT5txqwnHvHDBHguOGPHo5p88TB1tQ4vZZ5pYUunt+53W4
ofWFUCe8RD/FbbZIkFutGNuiTHB9LOInDlw/mawmenb8G/8oIa9zFeMdi0a3SP8kSsx7I59mgC0q
iW56KleYBzOj3W/BdhcmMPO+ijvjHr23GTNrQGzQy2CMFOz4dHDHkp4mu9ZyamNa2EYHto9RyEJd
MJxnzHpFRRwinA7GIjCbuj3Cj281WSnSEGXwuGk4y7sz8g8j6RenPKfOq//hq7leEpF9/NW21l4z
VWs=
=Hf/H
-----END PGP SIGNATURE-----

--------------7wtmPd0soFMJ29lpNLDJrrKM--
