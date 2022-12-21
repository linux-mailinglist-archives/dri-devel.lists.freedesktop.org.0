Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30638652F2E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Dec 2022 11:14:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97C2B10E446;
	Wed, 21 Dec 2022 10:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D29F10E446
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Dec 2022 10:13:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BFA506B60E;
 Wed, 21 Dec 2022 10:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671617626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xRK2WpHlDuntqBexClMCaSFr+ln4QeiMCHpmknDYBVg=;
 b=JGh5PXoBKrDpalAOzMiFyiX++lOLkr/pOyJSalZN7gi5sTSszEp7HPqx91LR1GqbDm89JX
 qr3BbACT+QNHMiCnBzFLOb+wZAcC/yHyPxpk70xjaEvrh1LmTAwQvcLYJR2tjMZJUIa3Iz
 vnSRoGPM83qvN2SBpR0LZ8GWue9ftRU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671617626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xRK2WpHlDuntqBexClMCaSFr+ln4QeiMCHpmknDYBVg=;
 b=smHsCkbzZGfCQGZgHFE9Wr8mgjys3lGM+QBpPciU6ebp+SWpdcoWH/CGb/RBU4LSNzyshJ
 OT5KR8tJpGluhGAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 973C113913;
 Wed, 21 Dec 2022 10:13:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id tfbyI1rcomPZHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Dec 2022 10:13:46 +0000
Message-ID: <ee59de2d-6649-ad89-bf2f-c1c287221452@suse.de>
Date: Wed, 21 Dec 2022 11:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 06/10] drm: Remove usage of deprecated DRM_DEBUG_DRIVER
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Siddh Raman Pant <code@siddh.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <cover.1671566741.git.code@siddh.me>
 <4d1acd84e914bafe491cfb42e7adab32d41ca0ab.1671566741.git.code@siddh.me>
 <877cyl2i0f.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <877cyl2i0f.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Zigq97ZM8q6o60XdUzdO1wYX"
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Zigq97ZM8q6o60XdUzdO1wYX
Content-Type: multipart/mixed; boundary="------------48zOyBssQtBr0tbS9sWZwF04";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Siddh Raman Pant <code@siddh.me>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Message-ID: <ee59de2d-6649-ad89-bf2f-c1c287221452@suse.de>
Subject: Re: [PATCH 06/10] drm: Remove usage of deprecated DRM_DEBUG_DRIVER
References: <cover.1671566741.git.code@siddh.me>
 <4d1acd84e914bafe491cfb42e7adab32d41ca0ab.1671566741.git.code@siddh.me>
 <877cyl2i0f.fsf@intel.com>
In-Reply-To: <877cyl2i0f.fsf@intel.com>

--------------48zOyBssQtBr0tbS9sWZwF04
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMTIuMjIgdW0gMTE6MDAgc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
V2VkLCAyMSBEZWMgMjAyMiwgU2lkZGggUmFtYW4gUGFudCA8Y29kZUBzaWRkaC5tZT4gd3Jv
dGU6DQo+PiBkcm1fcHJpbnQuaCBzYXlzIERSTV9ERUJVR19EUklWRVIgaXMgZGVwcmVjYXRl
ZC4NCj4+IFRodXMsIHVzZSBuZXdlciBkcm1fZGJnX2RyaXZlcigpLg0KPj4NCj4+IEFsc28g
Zml4IHRoZSBkZXByZWNhdGlvbiBjb21tZW50IGluIGRybV9wcmludC5oIHdoaWNoDQo+PiBt
ZW50aW9ucyBkcm1fZGJnKCkgaW5zdGVhZCBvZiBkcm1fZGJnX2RyaXZlcigpLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IFNpZGRoIFJhbWFuIFBhbnQgPGNvZGVAc2lkZGgubWU+DQo+PiAt
LS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jIHwgMTAgKysrKystLS0t
LQ0KPj4gICBpbmNsdWRlL2RybS9kcm1fcHJpbnQuaCAgICAgICAgfCAgMiArLQ0KPj4gICAy
IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9taXBpX2RiaS5jDQo+PiBpbmRleCAyNGFmNTA3YmI2ODcuLjZhZDM5
OWY2YWIwMyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmku
Yw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9taXBpX2RiaS5jDQo+PiBAQCAtNjks
MTEgKzY5LDExIEBADQo+PiAgICNkZWZpbmUgTUlQSV9EQklfREVCVUdfQ09NTUFORChjbWQs
IGRhdGEsIGxlbikgXA0KPj4gICAoeyBcDQo+PiAgIAlpZiAoIWxlbikgXA0KPj4gLQkJRFJN
X0RFQlVHX0RSSVZFUigiY21kPSUwMnhcbiIsIGNtZCk7IFwNCj4+ICsJCWRybV9kYmdfZHJp
dmVyKE5VTEwsICJjbWQ9JTAyeFxuIiwgY21kKTsgXA0KPj4gICAJZWxzZSBpZiAobGVuIDw9
IDMyKSBcDQo+PiAtCQlEUk1fREVCVUdfRFJJVkVSKCJjbWQ9JTAyeCwgcGFyPSUqcGhcbiIs
IGNtZCwgKGludClsZW4sIGRhdGEpO1wNCj4+ICsJCWRybV9kYmdfZHJpdmVyKE5VTEwsICJj
bWQ9JTAyeCwgcGFyPSUqcGhcbiIsIGNtZCwgKGludClsZW4sIGRhdGEpO1wNCj4+ICAgCWVs
c2UgXA0KPj4gLQkJRFJNX0RFQlVHX0RSSVZFUigiY21kPSUwMngsIGxlbj0lenVcbiIsIGNt
ZCwgbGVuKTsgXA0KPj4gKwkJZHJtX2RiZ19kcml2ZXIoTlVMTCwgImNtZD0lMDJ4LCBsZW49
JXp1XG4iLCBjbWQsIGxlbik7IFwNCj4+ICAgfSkNCj4+ICAgDQo+PiAgIHN0YXRpYyBjb25z
dCB1OCBtaXBpX2RiaV9kY3NfcmVhZF9jb21tYW5kc1tdID0gew0KPj4gQEAgLTYzMiw3ICs2
MzIsNyBAQCBib29sIG1pcGlfZGJpX2Rpc3BsYXlfaXNfb24oc3RydWN0IG1pcGlfZGJpICpk
YmkpDQo+PiAgIAkgICAgRENTX1BPV0VSX01PREVfRElTUExBWV9OT1JNQUxfTU9ERSB8IERD
U19QT1dFUl9NT0RFX1NMRUVQX01PREUpKQ0KPj4gICAJCXJldHVybiBmYWxzZTsNCj4+ICAg
DQo+PiAtCURSTV9ERUJVR19EUklWRVIoIkRpc3BsYXkgaXMgT05cbiIpOw0KPj4gKwlkcm1f
ZGJnX2RyaXZlcihOVUxMLCAiRGlzcGxheSBpcyBPTlxuIik7DQo+PiAgIA0KPj4gICAJcmV0
dXJuIHRydWU7DQo+PiAgIH0NCj4+IEBAIC0xMTY4LDcgKzExNjgsNyBAQCBpbnQgbWlwaV9k
Ymlfc3BpX2luaXQoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSwgc3RydWN0IG1pcGlfZGJpICpk
YmksDQo+PiAgIA0KPj4gICAJbXV0ZXhfaW5pdCgmZGJpLT5jbWRsb2NrKTsNCj4+ICAgDQo+
PiAtCURSTV9ERUJVR19EUklWRVIoIlNQSSBzcGVlZDogJXVNSHpcbiIsIHNwaS0+bWF4X3Nw
ZWVkX2h6IC8gMTAwMDAwMCk7DQo+PiArCWRybV9kYmdfZHJpdmVyKE5VTEwsICJTUEkgc3Bl
ZWQ6ICV1TUh6XG4iLCBzcGktPm1heF9zcGVlZF9oeiAvIDEwMDAwMDApOw0KPj4gICANCj4+
ICAgCXJldHVybiAwOw0KPj4gICB9DQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJt
X3ByaW50LmggYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaA0KPj4gaW5kZXggNTM3MDJkODMw
MjkxLi4xMDI2MWZhZWM4YjYgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fcHJp
bnQuaA0KPj4gKysrIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgNCj4+IEBAIC02MTQsNyAr
NjE0LDcgQEAgdm9pZCBfX2RybV9lcnIoY29uc3QgY2hhciAqZm9ybWF0LCAuLi4pOw0KPj4g
ICAjZGVmaW5lIERSTV9ERUJVRyhmbXQsIC4uLikJCQkJCQlcDQo+PiAgIAlfX2RybV9kYmco
RFJNX1VUX0NPUkUsIGZtdCwgIyNfX1ZBX0FSR1NfXykNCj4+ICAgDQo+PiAtLyogTk9URTog
dGhpcyBpcyBkZXByZWNhdGVkIGluIGZhdm9yIG9mIGRybV9kYmcoTlVMTCwgLi4uKS4gKi8N
Cj4+ICsvKiBOT1RFOiB0aGlzIGlzIGRlcHJlY2F0ZWQgaW4gZmF2b3Igb2YgZHJtX2RiZ19k
cml2ZXIoTlVMTCwgLi4uKS4gKi8NCj4gDQo+IFdheSBiYWNrIHRoZSBpZGVhIHdhcyB0byBt
YWtlIHRoZSBzaG9ydGVyIGRybV9kYmcoKSB0aGUgZHJpdmVyIGRlYnVnLA0KPiBhbmQgZHJt
X2RiZ19jb3JlKCkgdGhlIGRybSBjb3JlIGRlYnVnLCBiZWNhdXNlIHRoZSBmb3JtZXIgdmFz
dGx5DQo+IG91dG51bWJlcnMgdGhlIHRoZSBsYXR0ZXIuDQo+IA0KPiBJIGRvbid0IGtub3cg
aWYgdGhhdCBjaGFuZ2VkIHdpdGggdGhlIGR5bmRiZyBzdHVmZi4NCg0KSSd2ZSByZWNlbnRs
eSBncmVwcGVkIGZvciB0aGVzZSBtYWNyb3MgYW5kIG5vdGhpbmcgdXNlcyBkcm1fZGJnX2Ry
aXZlcigpIA0KZGlyZWN0bHkuDQoNCkkgYWxzbyB3b25kZXJlZCB3aGV0aGVyIHRoZSBkcml2
ZXIgZGVidWcgbWFjcm8gbWFrZXMgbXVjaCBzZW5zZS4gRm9yIA0KZXhhbXBsZSwgaWYgYSBk
cml2ZXIgaW1wbGVtZW50cyBpdHMgb3duIGF0b21pYyBoZWxwZXJzLCBpdCdzIG11Y2ggbW9y
ZSANCnVzZWZ1bCB0byB1c2UgZHJtX2RiZ19rbXMoKSB3aXRoaW4gdGhvc2UgZnVuY3Rpb25z
LiBJZiBlbmFibGVkLCB0aGVpciANCm91dHB1dCB3b3VsZCB0aGVuIGJsZW5kIGludG8gdGhl
IG92ZXJhbGwgS01TLXJlbGF0ZWQgZGVidWdnaW5nLiANCmRybV9kYmcvZHJtX2RiZ19kcml2
ZXIoKSBhcHBlYXJzIHRvIGJlIG1vc3RseSB1c2VmdWwgZm9yIGluaXQgYW5kIHN0YXR1cyAN
CnJlcG9ydGluZy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gDQo+IEJSLA0K
PiBKYW5pLg0KPiANCj4gDQo+PiAgICNkZWZpbmUgRFJNX0RFQlVHX0RSSVZFUihmbXQsIC4u
LikJCQkJCVwNCj4+ICAgCV9fZHJtX2RiZyhEUk1fVVRfRFJJVkVSLCBmbXQsICMjX19WQV9B
UkdTX18pDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZl
bGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8
cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------48zOyBssQtBr0tbS9sWZwF04--

--------------Zigq97ZM8q6o60XdUzdO1wYX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOi3FoFAwAAAAAACgkQlh/E3EQov+A5
OQ/9EFVK4a9yDrMcMhW5MeTfBVlRaz2c+MIzTbbUwBtVhmmAzlbaBaobEGAOSD5V043gfo0ALuUo
Z+GT5bUdRip5ipbuqebZmusS6YRFzq/d75Bu8VWdUWfqajYJ+FjQdMo1YufS2Yqb+VcST9RF6zqw
WUjBYJJQVKJPnXnkuUHt/I/7DyefMLpr9T4mOl2jbFTEyRCFi2/ecNUQCd99wRGZH7IVNaxDjOpR
h1QgVw7jVc8iBZ0MxzvOwBtTj+9dkV0BEN/k5tnTEjKKEQ5Dt0PdJKEeoAOiQ0oK8xyfexcKbbFs
7FbvVmQl0rbVk7ghTrX8AzsGT+ddXb5nicsUvkSowus4j1mfWnFSxe7797RYgUB5pz+zBInTp1x6
Kkrvs2/z8gls6GjC57h9WumHtAu6Mi3ieef4zelmbDJYtHmnfjhiqAJ5c2Dvy+x0RLc0Q3lHa8BS
QkNHMvl3mh4CCI++JRxsarCgGWKtTIp6BVPawvi7ex9uwd9h25S0yULE75RICVkvlzuYelcXhFNo
dKMHK5JOOjMDCW2P/pnVctNVvjghZA8TE57wUJlJJL4DYjMsvao+M05hWTYBU86MdfGRDs7saa8R
kVdLClfX1vwO6u1I/0OytW1IEZsllGYhmkKIih/v+cJW47UMfvLvIRasmwE6Yx2rPxKnUIQ/cN+v
BBo=
=+P/i
-----END PGP SIGNATURE-----

--------------Zigq97ZM8q6o60XdUzdO1wYX--
