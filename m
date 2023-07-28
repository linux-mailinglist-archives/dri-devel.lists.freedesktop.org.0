Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB59B7665AF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 09:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDFDC10E675;
	Fri, 28 Jul 2023 07:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2038F10E66A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 07:45:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C4A642199D;
 Fri, 28 Jul 2023 07:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690530317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nscdj6yoSws8O/ubUQ7x4FFK7U2KtK5tuEkNmDbzL9s=;
 b=HkWGZimyNc+cr3+fJCXB2hirJj+050tMdQFsy7HHTR9FGHqtOl+MdCcJHIDy9TYuvJ0O7V
 Zo0wXUWdHG4G3XYga+Vcm4BJrXIBaaViadDl4QZXuS3l8bIAoIRMdVQlcJ0/SsH6AyCqQo
 SE+d9ej9+TLKbjWbiGSy3hueLI3SeCw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690530317;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Nscdj6yoSws8O/ubUQ7x4FFK7U2KtK5tuEkNmDbzL9s=;
 b=1hoGbIJkgPy1egrmTl72F5nFHolaFcuPmAyXAGLnHoew84qI0aRC2XEqwrncsb+eoXetiY
 rRUfK+1QJF0IPKDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A7FCD13276;
 Fri, 28 Jul 2023 07:45:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 53UiKA1yw2TGUQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 28 Jul 2023 07:45:17 +0000
Message-ID: <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
Date: Fri, 28 Jul 2023 09:45:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
Content-Language: en-US
To: Roger Sewell <roger.sewell@cantab.net>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230727223438.4658@revelation.broadband>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3d4M09C0rtKxGp8nI0h3Eita"
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
Cc: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3d4M09C0rtKxGp8nI0h3Eita
Content-Type: multipart/mixed; boundary="------------GOcbogz7aCPxUKYlmzFtALS5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Roger Sewell <roger.sewell@cantab.net>
Cc: airlied@redhat.com, jfalempe@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <d5156750-34d4-87dc-41ff-f3c3ca1f48c3@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <9c8a0a5f-fd7f-cf6d-7e6e-ca90bdf957c5@suse.de>
 <20230727223438.4658@revelation.broadband>
In-Reply-To: <20230727223438.4658@revelation.broadband>

--------------GOcbogz7aCPxUKYlmzFtALS5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDcuMjMgdW0gMjM6MzQgc2NocmllYiBSb2dlciBTZXdlbGw6DQo+IA0K
PiBUaG9tYXMsIEpvY2VseW4sDQo+IA0KPiBBcyBhIHJlc3VsdCBvZiB0aGUgY29sbGVjdGlv
biBvZiB0aGUgWG9yZyBsb2dzIHJlcXVlc3RlZCBieSBUaG9tYXMsIEkndmUNCj4gcmVhbGlz
ZWQgdGhhdCBhdCBzb21lIGxvbmctcGFzdCBwb2ludCB1cGdyYWRlIHRoZSAxNDQweDkwMEA2
MCBtb2RlDQo+IGRpc2FwcGVhcmVkLCBhbmQgaW4gb3JkZXIgdG8gZ2V0IGl0IGJhY2sgSSBp
bnRyb2R1Y2VkIHRoZSBmaWxlDQo+IC9ldGMvWDExL3hvcmcuY29uZi5kLzIwLXNjcmVlbi5j
b25mIGF0dGFjaGVkLg0KPiANCj4gSWYgSSByZW1vdmUgdGhpcyBmaWxlLCB0aGVuIHdpdGgg
dGhlIHVubW9kaWZpZWQgbmV3IG1nYWcyMDAgbW9kdWxlIGluDQo+IHBsYWNlLCBvbiBnb2lu
ZyB0byBTZXR0aW5ncy0+RGlzcGxheSBJIGFtIG5vIGxvbmdlciBldmVuIG9mZmVyZWQgdGhl
DQo+IDE0NDB4OTAwIG9wdGlvbiAtIHByZXN1bWFibHkgYXMgYSByZXN1bHQgb2YNCj4gbWdh
ZzIwMF9tb2RlX2NvbmZpZ19tb2RlX3ZhbGlkIHJldHVybmluZyBNT0RFX0JBRC4NCj4gDQo+
IFdpdGggdGhpcyBmaWxlIGluIHBsYWNlLCBhbmQgd2l0aCB0aGUgdW5tb2RpZmllZCBuZXcg
bWdhZzIwMCBtb2R1bGUgaW4NCj4gcGxhY2UsIEkgYW0gb2ZmZXJlZCB0aGlzIHNldHRpbmcs
IGJ1dCBpZiBJIHBpY2sgaXQgdGhlbiBpdCBpcyBub3QgdXNlZA0KPiBidXQgKmlzKiB3cml0
dGVuIGludG8gfi8uY29uZmlnL21vbml0b3JzLnhtbCwgYW5kIHRoZW4gb24gbmV4dCBsb2dp
bg0KPiBncmFwaGljcyBmYWlsIGNvbXBsZXRlbHkuDQoNClRoYW5rcyBmb3IgdGhpcyBpbmZv
cm1hdGlvbi4gSWYgeW91IGNvbmZpZ3VyZSBhIHNjcmVlbiBhbmQvb3IgbW9kZXMgdmlhIA0K
Y29uZmlnIGZpbGUsIHN1Y2ggYXMgMjAtc2NyZWVuLmNvbmYsIGl0IG92ZXJyaWRlcyBYb3Jn
J3MgYXV0b2RldGVjdGlvbi4gDQpTbyBYIHdpbGwgaGFwcGlseSB1c2Ugd2hhdGV2ZXIgeW91
IGNvbmZpZ3VyZWQuIFRoaXMgZXhwbGFpbnMgbXkgb3RoZXIgDQptYWlsJ3MgcXVlc3Rpb24g
d2h5IFhvcmcgZXZlbiB0cmllcyAxNDQweDkwMCBhdCBhbGwuDQoNCj4gDQo+IEh5cG90aGVz
aXM6IHRoZXJlIGFyZSB0d28gZGlmZmVyZW50IHBsYWNlcyBpbiB0aGUgY29kZSB3aGVyZSBt
b2RlX3ZhbGlkDQo+IGlzIHBvdGVudGlhbGx5IGNoZWNrZWQsIGJvdGggb2Ygd2hpY2ggdXNl
IHRoZSBtZ2FnMjAwIG1vZHVsZSwgYW5kIHRoZQ0KPiBvbGQgbW9kdWxlIG9ubHkgZG9lcyB0
aGlzIGNoZWNrIGF0IG9uZSBvZiB0aGVtIChkZWNpZGluZyB3aGljaCBtb2RlcyB0bw0KPiBv
ZmZlcikgKHdoaWNoIGNoZWNrIGlzIGJ5cGFzc2VkIGZvciBtb2RlcyByZXF1ZXN0ZWQgaW4g
eG9yZy5jb25mLmQpLA0KPiB3aGlsZSB0aGUgbmV3IG1vZHVsZSBkb2VzIGl0IGF0IGJvdGgg
KGFuZCBoZW5jZSBmYWlscyBpbnZhbGlkIG1vZGVzDQo+IHJlcXVlc3RlZCBpbiB4b3JnLmNv
bmYuZCkgPz8NCg0KVGhlcmUncyBtb2RlIGRldGVjdGlvbiwgd2hpY2ggZG9lcyB0aGUgZ2Vu
ZXJhbCB0ZXN0IHdpdGggbW9kZV92YWxpZC4gSXQgDQpyZXR1cm5zIGEgbGlzdCB3aXRoIHBv
c3NpYmxlIG1vZGVzLiBBbmQgdGhlcmUncyBtb2RlIHNldHRpbmcsIHdoaWNoIA0KdGVzdHMg
aWYgdGhlIGRpc3BsYXkgc2V0dGluZyBhcyBhIHdob2xlIChtb2RlLCBjb2xvciBmb3JtYXQs
IG91dHB1dHMsIA0KYW5kIG1vcmUpIGNhbiBjYW4gYmUgcHJvZ3JhbW1lZCBpbiB0aGUgZ2l2
ZW4gY29tYmluYXRpb24uIFRoYXQncyB3aGF0IA0KZmFpbHMgd2l0aCB0aGUgbmV3IGRyaXZl
ciwgYnV0IHdvcmtlZCB3aXRoIHRoZSBvbGQgZHJpdmVyLg0KDQpJIGd1ZXNzIHRoYXQgdGhl
IGNvbmZpZ3VyZWQgbW9kZSBvZiAxNDQweDkwMCBzb21laG93IHBhc3NlZCB0ZXN0aW5nIGlu
IA0KdGhlIG9sZCBkcml2ZXIuIEFuZCBhcyB5b3VyIGNoaXAgY291bGQgaGFuZGxlIHRoZSBv
dmVyY2xvY2tlZCBwaXhlbHJhdGUgDQpzZXR0aW5ncywgeW91IGdvdCBhIHN0YWJsZSBvdXRw
dXQgZXZlbiB3aXRoIDMyLWJpdCBjb2xvcnMuDQoNCkkgYXNzdW1lIHRoYXQgdGhlIG5ldyBk
cml2ZXIgaXMgc29tZWhvdyBtb3JlIHN0cmljdCBpbiB0ZXN0aW5nIGFuZCANCnJlamVjdHMg
dGhlIG92ZXJjbG9ja2VkIHBpeGVsIHJhdGUuIChCdXQgSSBjYW5ub3Qgc2VlIHRoYXQgaW4g
dGhlIGNvZGUgVEJIKS4NCg0KPiANCj4gTG9va2luZyBmb3IgcG9zc2libGUgcmVhc29ucyB3
aHkgdGhpcyBtaWdodCBiZSB0aGUgY2FzZSAoYW5kIHN0cmF5aW5nDQo+IHdheSBiZXlvbmQg
bXkgY29tcGV0ZW5jZSksIEkgbm90ZSB0aGF0IGluIHRoZSBvbGQgbW9kdWxlDQo+IG1nYV92
Z2FfbW9kZV92YWxpZCBpcyBtYWRlIGtub3duIHRvIG90aGVyIHBhcnRzIG9mIHRoZSBzeXN0
ZW0gaW4gYQ0KPiBkaWZmZXJlbnQgd2F5IHRoYW4gbWdhZzIwMF9tb2RlX2NvbmZpZ19tb2Rl
X3ZhbGlkIGlzIGluIHRoZSBuZXcgbW9kdWxlDQo+IChhbmQgaW5kZWVkIHRoZXkgaGF2ZSBk
aWZmZXJlbnQgcGFyYW1ldGVyIHR5cGVzKS4gKE1pZ2h0IHRoaXMgYmUNCj4gcmVsZXZhbnQg
PykNCg0KSSdtIG5vdCBxdWl0ZSBzdXJlIGhvdyB0byBwcm9jZWVkIGhlcmUsIGFzIHRoZSBk
cml2ZXIgaXMgY29ycmVjdCBhbmQgdGhlIA0KcHJvYmxlbSBjYW1lIGZyb20gYSBtaXNtYXRj
aGluZyBjb25maWcgZmlsZSBvbiB5b3VyIHN5c3RlbS4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gQmVzdCB3aXNoZXMsDQo+IFJvZ2VyLg0KPiANCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------GOcbogz7aCPxUKYlmzFtALS5--

--------------3d4M09C0rtKxGp8nI0h3Eita
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTDcgwFAwAAAAAACgkQlh/E3EQov+Cs
LA//XCQ/YOcoLjhnelARz4APu/lJ4LrmvF2fAxOM7D/ErUobtFNzH3QaOtOd+KXI7X2ePiz92z1+
YxMnRjC2bN8q/gjZMq5I5f4EAb2yGTg60++dKAec5SBKF2uoQ0XHe4tf7jVV3fEZCRL/1OHCwSDq
f8wLlAh0rDBESPiF6+t2H4NkxhAjoepDHsYkvlsqBjNIlZpPywP37whHoTfHtG7TW2JoRnz4WpKx
ut21PTCuN9dKgigHC/MrsdZuCnn4X/6ppCxN6OA/7sdrs9gbQL3hyAHq8qF//EyrDLqoFhsDFewM
4GK4oHYJRX2uEXyaCIIISWZgCvgYFYSxLRy1t0vuDS/9zpJzt3b1WLHNi5X0aS1IMLgf6o2xgbAL
IO8D1FqxUBmgccS31UGgQDHNn6aOhiQ5Xrl+cBSLx0r5SL2zEMGwaKioychMwhka6Ks6ddKd83f6
k7SJpjywsc1l8gqnBSc/SL9cW6dyolXpyclF4s1wl96kiSF4YvJrsqhQdIjXbO2L7O7xXPShnu0i
kY7t6jSDifgeDZaNRAbMeZiyp6qZ9f/H0+1j2mpj4miosAomid7pTAJrP0PSbXp5oBAT0/puqf5Y
DzZFj6D3TXz9f2TqvMzCWhXdV9baW2o5du6+jX0u9/SOvJPc8rwDUyT0df2M6waWd56OoifQAIoL
qgI=
=GIdX
-----END PGP SIGNATURE-----

--------------3d4M09C0rtKxGp8nI0h3Eita--
