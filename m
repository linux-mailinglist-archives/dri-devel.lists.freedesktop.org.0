Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B7B4B159D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 19:55:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69CC10E1FD;
	Thu, 10 Feb 2022 18:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8280510E1FD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 18:55:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2086321121;
 Thu, 10 Feb 2022 18:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644519350; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DdvRYUYPbeuUwugRz/zD5fkCcoVbL25yO1bIyTTrtQE=;
 b=kbho8IjDsMCYYGtM1D3wg8uEHchZfhJ93p54CQVZZV4Ps3xA0QeVKQS6SmnK1WhosD0Ugp
 eBjpwjMGG3X1RAfKZFlFwn6eHdv7x/XfOlEcjUkSQPJAG1FuJqNY5HCLQ6/ezgsdG4uPxB
 sBZZirLaPeGQVKr5mTbereSFpjkWZJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644519350;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DdvRYUYPbeuUwugRz/zD5fkCcoVbL25yO1bIyTTrtQE=;
 b=kn3NfczTzXNH5S4YABkE3WiOoJMtnuZJs+eToav08csO5x2B9klUAf96MArUbpSawcg3wf
 lhSIs+86sjnMEjAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DBCE713C22;
 Thu, 10 Feb 2022 18:55:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t3hhNLVfBWKPcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Feb 2022 18:55:49 +0000
Message-ID: <5df2f9bb-9181-56da-ea85-06af7ea8704a@suse.de>
Date: Thu, 10 Feb 2022 19:55:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/ast: fix using freed memory
Content-Language: en-US
To: trix@redhat.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 nathan@kernel.org, ndesaulniers@google.com, maxime@cerno.tech
References: <20220203152305.1846862-1-trix@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220203152305.1846862-1-trix@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------092ooI4Qbv1X0dO7Q2ZFcB0X"
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------092ooI4Qbv1X0dO7Q2ZFcB0X
Content-Type: multipart/mixed; boundary="------------O6FbTDLRmQ55Ds9EEjrFytE7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: trix@redhat.com, airlied@redhat.com, airlied@linux.ie, daniel@ffwll.ch,
 nathan@kernel.org, ndesaulniers@google.com, maxime@cerno.tech
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <5df2f9bb-9181-56da-ea85-06af7ea8704a@suse.de>
Subject: Re: [PATCH] drm/ast: fix using freed memory
References: <20220203152305.1846862-1-trix@redhat.com>
In-Reply-To: <20220203152305.1846862-1-trix@redhat.com>

--------------O6FbTDLRmQ55Ds9EEjrFytE7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDIuMjIgdW0gMTY6MjMgc2NocmllYiB0cml4QHJlZGhhdC5jb206DQo+
IEZyb206IFRvbSBSaXggPHRyaXhAcmVkaGF0LmNvbT4NCj4gDQo+IGNsYW5nIHN0YXRpYyBh
bmFseXNpcyByZXBvcnRzIHRoaXMgcHJvYmxlbQ0KPiBhc3RfbW9kZS5jOjEyMzU6Mzogd2Fy
bmluZzogVXNlIG9mIG1lbW9yeSBhZnRlciBpdCBpcyBmcmVlZA0KPiAgICBkcm1fY29ubmVj
dG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5KCZhc3RfY29ubmVjdG9yLT5iYXNlLCBlZGlkKTsN
Cj4gICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4NCj4gDQo+IFRoZSBzZWNvbmQgY29uZGl0aW9uIG9uDQo+IA0KPiAg
ICBpZiAoIWZsYWdzICYmIGFzdF9jb25uZWN0b3ItPmkyYykNCj4gDQo+IE1lYW5zIHRoYXQg
dGhlIGVkaWQgaXMgbm90IGFsd2F5cyBzZXQuICBJZiB0aGUgcHJldmlvdXMgYmxvY2sNCj4g
ZmFpbHMgdGhlIGZyZWVkIGVkaWQgdmFsdWUgd2lsbCBiZSB1c2VkLiAgU28gc2V0IGVkaWQg
dG8gTlVMTA0KPiBhZnRlciBmcmVlaW5nLg0KDQpUaGFua3MgZm9yIHlvdXIgcGF0Y2guIFdl
IGhhdmUgbWVhbndoaWxlIG1lcmdlcyBhIGNoYW5nZSB0aGF0IHJlcGxhY2VzIA0KdGhlIGNv
ZGUgZW50aXJlbHkuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEZpeGVzOiA1
NWRjNDQ5YTdjNjAgKCJkcm0vYXN0OiBIYW5kbGUgZmFpbGVkIEkyQyBpbml0aWFsaXphdGlv
biBncmFjZWZ1bGx5IikNCj4gU2lnbmVkLW9mZi1ieTogVG9tIFJpeCA8dHJpeEByZWRoYXQu
Y29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMgfCA2ICsr
KystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jDQo+IGluZGV4IGFiNTJlZmIxNTY3
MGUuLjkxMzFkYzhhMWEyZmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3Qv
YXN0X21vZGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMNCj4g
QEAgLTEyMjQsMTAgKzEyMjQsMTIgQEAgc3RhdGljIGludCBhc3RfZ2V0X21vZGVzKHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpDQo+ICAgCQkJcmV0dXJuIC1FTk9NRU07DQo+
ICAgDQo+ICAgCQlmbGFncyA9IGFzdF9kcDUwMV9yZWFkX2VkaWQoY29ubmVjdG9yLT5kZXYs
ICh1OCAqKWVkaWQpOw0KPiAtCQlpZiAoZmxhZ3MpDQo+ICsJCWlmIChmbGFncykgew0KPiAg
IAkJCWFzdC0+ZHA1MDFfbWF4Y2xrID0gYXN0X2dldF9kcDUwMV9tYXhfY2xrKGNvbm5lY3Rv
ci0+ZGV2KTsNCj4gLQkJZWxzZQ0KPiArCQl9IGVsc2Ugew0KPiAgIAkJCWtmcmVlKGVkaWQp
Ow0KPiArCQkJZWRpZCA9IE5VTEw7DQo+ICsJCX0NCj4gICAJfQ0KPiAgIAlpZiAoIWZsYWdz
ICYmIGFzdF9jb25uZWN0b3ItPmkyYykNCj4gICAJCWVkaWQgPSBkcm1fZ2V0X2VkaWQoY29u
bmVjdG9yLCAmYXN0X2Nvbm5lY3Rvci0+aTJjLT5hZGFwdGVyKTsNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------O6FbTDLRmQ55Ds9EEjrFytE7--

--------------092ooI4Qbv1X0dO7Q2ZFcB0X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIFX7UFAwAAAAAACgkQlh/E3EQov+Bg
wBAAksaQa3/SWLQEybFdtMJpVESyPa8f/LCtzK+RiiNrEDFUvwMLa9TiADFUgkqVasVgWX8TigZG
V7S6dSyYE/2h3HvUwpLJvi4aFS9fm7Lzts15k1+Z2zqPr1XwI+RseeX7PrG6kCfpBR296oCIdpD1
cDP2qy4lybkl/sH8Hj6CXTyEfnVl+UIw2TVI7DQ2ssICFtNsOlsBiVB4lTMJi3fsaUDIxIxZPwak
xumRRY0EtrrRzoTuUdOYaEUO73dBQ8RpkKZPdeac2BBKv6w14U1+6j2N4NSls22mQK6MjJbZLkHs
538dat6sGOzmMyOjL2G8ENQJ6BQ1g9JzWAedyWN1EW38es9PT2IsYZMU0wESZfrKBhINBN3MZnuq
FUaZlCg1nGBJi33ircQkw8Ctkl60OhT7Bfqy5CkeSuf4HaokujZLv/a/xw1PItRGBYiWoBbAaADL
+eC1piBUxO5ZriVIa5nL38g+3empUpJxhE0+NKqd5x7TSgBD0bpXUxzgvuR042I9En1hfIHyBwD2
1hk0dwf5c+9CCW9uYzxFVrLK/lCseATVr2lzx0YUDsXvVreYFKknlvhTydlQXqHGUS2kxvi8dOkA
Mnh5Y/iR+IP46pvSuMTTJaRsf/nDzUFd48tFjCwtkSEc014a8Ht76o1WL/C//uJL1cY32CQU8vep
aW8=
=5Niu
-----END PGP SIGNATURE-----

--------------092ooI4Qbv1X0dO7Q2ZFcB0X--
