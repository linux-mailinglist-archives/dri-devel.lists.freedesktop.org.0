Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7474BBA6C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90B4310EC3C;
	Fri, 18 Feb 2022 14:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F18310E19A
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:09:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 75AB1210DB;
 Fri, 18 Feb 2022 14:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645193371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HB3L++4PQYNQLsMelrUuLKMCjKCIDMxJwwtm4wEKGjY=;
 b=UUFBs1QlANkjpRuXLdMkzj3gr48U0BDmbLoFq/vKs1XLJ/FfewnQXKpruVwaszv+jtEyfI
 AGrLryNOBE0RZwp/we1HhpZd/+ky8ufRA7DxWtBdKF7DGBlKNtzRfX8FioPgaHD0z1njXw
 n9PMnOcJCX2lzdMAyUivLRbbGqsFfcU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645193371;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HB3L++4PQYNQLsMelrUuLKMCjKCIDMxJwwtm4wEKGjY=;
 b=m2s1rNTUDX/63nXC/oYwaY8ZfMxQiwfoXbiBLni9mhSD2x9KqQTSkcCEJ5vddM/vBFmCVS
 GbCYjoNZuEIow1Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 48A2713C93;
 Fri, 18 Feb 2022 14:09:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cJeMEJuoD2LyeQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Feb 2022 14:09:31 +0000
Message-ID: <103bb91e-676b-7930-020f-f2aa98595918@suse.de>
Date: Fri, 18 Feb 2022 15:09:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] fbdev: Improve performance of sys_imageblit()
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220217103405.26492-1-tzimmermann@suse.de>
 <20220217103405.26492-3-tzimmermann@suse.de> <Yg9xizrlvaNZFkCM@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Yg9xizrlvaNZFkCM@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------msQEmOTRj08mvYRq0Jajw5Qq"
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
Cc: linux-fbdev@vger.kernel.org, deller@gmx.de, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------msQEmOTRj08mvYRq0Jajw5Qq
Content-Type: multipart/mixed; boundary="------------UiMfTtkjpF0tVRWKmaBLXSRJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: daniel@ffwll.ch, deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <103bb91e-676b-7930-020f-f2aa98595918@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Improve performance of sys_imageblit()
References: <20220217103405.26492-1-tzimmermann@suse.de>
 <20220217103405.26492-3-tzimmermann@suse.de> <Yg9xizrlvaNZFkCM@ravnborg.org>
In-Reply-To: <Yg9xizrlvaNZFkCM@ravnborg.org>

--------------UiMfTtkjpF0tVRWKmaBLXSRJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDE4LjAyLjIyIHVtIDExOjE0IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBUaHUsIEZlYiAxNywgMjAyMiBhdCAxMTozNDowNUFN
ICswMTAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEltcHJvdmUgdGhlIHBlcmZv
cm1hbmNlIG9mIHN5c19pbWFnZWJsaXQoKSBieSBtYW51YWxseSB1bnJvbGxpbmcNCj4+IHRo
ZSBpbm5lciBibGl0dGluZyBsb29wIGFuZCBtb3Zpbmcgc29tZSBpbnZhcmlhbnRzIG91dC4g
VGhlIGNvbXBpbGVyDQo+PiBmYWlsZWQgdG8gZG8gdGhpcyBhdXRvbWF0aWNhbGx5LiBUaGUg
cmVzdWx0aW5nIGJpbmFyeSBjb2RlIHdhcyBldmVuDQo+PiBzbG93ZXIgdGhhbiB0aGUgY2Zi
X2ltYWdlYmxpdCgpIGhlbHBlciwgd2hpY2ggdXNlcyB0aGUgc2FtZSBhbGdvcml0aG0sDQo+
PiBidXQgb3BlcmF0ZXMgb24gSS9PIG1lbW9yeS4NCj4gDQo+IEl0IHdvdWxkIGJlIHN1cGVy
IHRvIGhhdmUgdGhlIHNhbWUgb3B0aW1pemF0aW9uIGRvbmUgdG8gY2ZiX2ltYWdlYmxpdCgp
LA0KPiB0byBwcmV2ZW50IHRoYXQgdGhlIHR3byBjb2RlYmFzZXMgZGl2ZXJnZSBtb3JlIHRo
YW4gbmVjZXNzYXJ5Lg0KPiBBbHNvIEkgdGhpbmsgY2ZiXyB2ZXJzaW9uIHdvdWxkIGFsc28g
c2VlIGEgcGVyZm9ybWFuY2UgZ2FpbiBmcm9tIHRoaXMuDQoNClllcywgSSBjYW4gZG8gdGhh
dC4NCg0KPiANCj4gVGhlIGFjdHVhbCBpbXBsZW1lbnRhdGlvbiBsb29rcyBnb29kLg0KPiBT
byB3aXRoIG9yIHdpdGhvdXQgdGhlIGV4dHJhIHVuLXJvbGxpbmcgdGhlIHBhdGNoIGlzOg0K
PiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KPiANCj4gT25l
IHNtYWxsIG5pdCBiZWx3by4NCj4gDQo+IAlTYW0NCj4gDQo+Pg0KPj4gQSBtaWNyb2JlbmNo
bWFyayBtZWFzdXJlcyB0aGUgYXZlcmFnZSBudW1iZXIgb2YgQ1BVIGN5Y2xlcw0KPj4gZm9y
IHN5c19pbWFnZWJsaXQoKSBhZnRlciBhIHN0YWJpbGl6aW5nIHBlcmlvZCBvZiBhIGZldyBt
aW51dGVzDQo+PiAoaTctNDc5MCwgRnVsbEhELCBzaW1wbGVkcm0sIGtlcm5lbCB3aXRoIGRl
YnVnZ2luZykuIFRoZSB2YWx1ZQ0KPj4gZm9yIENGQiBpcyBnaXZlbiBhcyBhIHJlZmVyZW5j
ZS4NCj4+DQo+PiAgICBzeXNfaW1hZ2VibGl0KCksIG5ldzogMjU5MzQgY3ljbGVzDQo+PiAg
ICBzeXNfaW1hZ2VibGl0KCksIG9sZDogMzU5NDQgY3ljbGVzDQo+PiAgICBjZmJfaW1hZ2Vi
bGl0KCk6ICAgICAgMzA1NjYgY3ljbGVzDQo+Pg0KPj4gSW4gdGhlIG9wdGltaXplZCBjYXNl
LCBzeXNfaW1hZ2VibGl0KCkgaXMgbm93IH4zMCUgZmFzdGVyIHRoYW4gYmVmb3JlDQo+PiBh
bmQgfjIwJSBmYXN0ZXIgdGhhbiBjZmJfaW1hZ2VibGl0KCkuDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0N
Cj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL3N5c2ltZ2JsdC5jIHwgNTEgKysrKysr
KysrKysrKysrKysrKysrLS0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0
aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dmlkZW8vZmJkZXYvY29yZS9zeXNpbWdibHQuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29y
ZS9zeXNpbWdibHQuYw0KPj4gaW5kZXggYTRkMDViMWIxN2Q3Li5kNzBkNjVhZjZmY2IgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvc3lzaW1nYmx0LmMNCj4+
ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9zeXNpbWdibHQuYw0KPj4gQEAgLTE4
OCwyMyArMTg4LDMyIEBAIHN0YXRpYyB2b2lkIGZhc3RfaW1hZ2VibGl0KGNvbnN0IHN0cnVj
dCBmYl9pbWFnZSAqaW1hZ2UsIHN0cnVjdCBmYl9pbmZvICpwLA0KPj4gICB7DQo+PiAgIAl1
MzIgZmd4ID0gZmdjb2xvciwgYmd4ID0gYmdjb2xvciwgYnBwID0gcC0+dmFyLmJpdHNfcGVy
X3BpeGVsOw0KPj4gICAJdTMyIHBwdyA9IDMyL2JwcCwgc3BpdGNoID0gKGltYWdlLT53aWR0
aCArIDcpLzg7DQo+PiAtCXUzMiBiaXRfbWFzaywgZW5kX21hc2ssIGVvcngsIHNoaWZ0Ow0K
Pj4gKwl1MzIgYml0X21hc2ssIGVvcng7DQo+PiAgIAljb25zdCBjaGFyICpzID0gaW1hZ2Ut
PmRhdGEsICpzcmM7DQo+PiAgIAl1MzIgKmRzdDsNCj4+IC0JY29uc3QgdTMyICp0YWIgPSBO
VUxMOw0KPj4gLQlpbnQgaSwgaiwgazsNCj4+ICsJY29uc3QgdTMyICp0YWI7DQo+PiArCXNp
emVfdCB0YWJsZW47DQo+PiArCXUzMiBjb2xvcnRhYlsxNl07DQo+PiArCWludCBpLCBqLCBr
LCBqZGVjcjsNCj4+ICsNCj4+ICsJaWYgKCh1aW50cHRyX3QpZHN0MSAlIDgpDQo+PiArCQly
ZXR1cm47DQo+IFRoaXMgY2hlY2sgaXMgbmV3IC0gYW5kIHNob3VsZCBub3QgdHJpZ2dlciBl
dmVyLiBNYXliZSBhZGQgYW4gdW5saWtlbHkNCj4gYW5kIGEgV0FSTl9PTl9PTkNFKCk/DQoN
CkkgdGhpbmsgSSBjYW4gcmVtb3ZlIHRoaXMgdGVzdC4gSXQgd2FzIHN1cHBvc2VkIHRvIHRl
bGwgdGhlIGNvbXBpbGVyIA0KdGhhdCBkc3QxIGlzIDgtYWxpZ25lZCwgYnV0IEkgZG9uJ3Qg
dGhpbmsgaXQgd29ya2VkLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4+
ICAgDQo+PiAgIAlzd2l0Y2ggKGJwcCkgew0KPj4gICAJY2FzZSA4Og0KPj4gICAJCXRhYiA9
IGZiX2JlX21hdGgocCkgPyBjZmJfdGFiOF9iZSA6IGNmYl90YWI4X2xlOw0KPj4gKwkJdGFi
bGVuID0gMTY7DQo+PiAgIAkJYnJlYWs7DQo+PiAgIAljYXNlIDE2Og0KPj4gICAJCXRhYiA9
IGZiX2JlX21hdGgocCkgPyBjZmJfdGFiMTZfYmUgOiBjZmJfdGFiMTZfbGU7DQo+PiArCQl0
YWJsZW4gPSA0Ow0KPj4gICAJCWJyZWFrOw0KPj4gICAJY2FzZSAzMjoNCj4+IC0JZGVmYXVs
dDoNCj4+ICAgCQl0YWIgPSBjZmJfdGFiMzI7DQo+PiArCQl0YWJsZW4gPSAyOw0KPj4gICAJ
CWJyZWFrOw0KPj4gKwlkZWZhdWx0Og0KPj4gKwkJcmV0dXJuOw0KPj4gICAJfQ0KPj4gICAN
Cj4+ICAgCWZvciAoaSA9IHBwdy0xOyBpLS07ICkgew0KPj4gQEAgLTIxNywxOSArMjI2LDM3
IEBAIHN0YXRpYyB2b2lkIGZhc3RfaW1hZ2VibGl0KGNvbnN0IHN0cnVjdCBmYl9pbWFnZSAq
aW1hZ2UsIHN0cnVjdCBmYl9pbmZvICpwLA0KPj4gICAJYml0X21hc2sgPSAoMSA8PCBwcHcp
IC0gMTsNCj4+ICAgCWVvcnggPSBmZ3ggXiBiZ3g7DQo+PiAgIAlrID0gaW1hZ2UtPndpZHRo
L3BwdzsNCj4+ICsJamRlY3IgPSA4IC8gcHB3Ow0KPj4gKw0KPj4gKwlmb3IgKGkgPSAwOyBp
IDwgdGFibGVuOyArK2kpDQo+PiArCQljb2xvcnRhYltpXSA9ICh0YWJbaV0gJiBlb3J4KSBe
IGJneDsNCj4gVGhpcyBjb2RlIGNvdWxkIGhhdmUgYmVlbiBlbWJlZGRlZCB3aXRoIHRoZSBz
d2l0Y2ggKGJwcCkgew0KPiBUaGF0IHdvdWxkIGhhdmUgbWFkZSBzb21lIHNlbnNlIEkgdGhp
bmsuDQo+IEJ1dCBib3RoIHdheXMgd29ya3MsIHNvIHRoaXMgd2FzIGp1c3QgYSBzbWFsbCBv
YnNlcnZhdGlvbi4NCj4gDQo+IAlTYW0NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------UiMfTtkjpF0tVRWKmaBLXSRJ--

--------------msQEmOTRj08mvYRq0Jajw5Qq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIPqJoFAwAAAAAACgkQlh/E3EQov+Cb
TxAAouSUstWFC5prf3HsEEjjctipErouPHKo/hImZNZjLc2NKdby8BzIk4udKyEMVBlQNVEAUO9D
OsCQ6EXiugUql2zkYS+PHHC/MYRSsjV7TfxKyIjGGjLojZr0YL3qPqqiZerSaLARhfGDoXYNUxwR
lErMJ7SWGGyL2GmfMEIE9D0/EEJn+nP2mIOG9a4jtlQtD2k9EbGd3pnbchCW5JjyMybygUudRLW7
LCaivb1C2HCC03WTxQdvwuSbgqBUbfAjKaucU81I6ZeOvnGiG5tU3WhJwZMpRuNneFIzq1uA6F6F
I6tnQCMinYwGxzOy6jyUYLFYWENnGmY+FFXs1z9dsPp2G3TkvYBXOO6HrjR72kX3Lo+4HZeArEZz
5XI66UEJtAiY1Mlk2rLPwdqxjJhTGlaRL/4Ha9dhpdtsiZKs1u3Oh1w1iXNuktV6uPpjZJhbj8D/
/OZ64sKWwYhd5VBzF5SVFSI4fTmKlboDaJ33vMTQJ2d9+QzVTsqR34SqmHMzt9hKZkMF+wh3c8E1
388NP9RKdN2jpgOcTIIKR/NdOVLqAxVly9bFnNcGtpsZMOEd3zY276sS5CzSAGklK/H1Yi42Xg7M
wdKRBwfqBCGxhJUick3D12WaKqnRfm/nvbRxCItJa61T4dXmcOBao/WLT65d4hkAYvUy2Gvtf5eB
NFk=
=8P/n
-----END PGP SIGNATURE-----

--------------msQEmOTRj08mvYRq0Jajw5Qq--
