Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE2944703F
	for <lists+dri-devel@lfdr.de>; Sat,  6 Nov 2021 20:49:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C436E0DB;
	Sat,  6 Nov 2021 19:49:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DBA6E0DB
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Nov 2021 19:49:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6FCC1FD3B;
 Sat,  6 Nov 2021 19:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636228174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CMFabcUQOmRMnz/830S42/KsWEzTZCh5X2S4kvjJ4UU=;
 b=OP1N3Q7KnMCv1f1CAsvJ/xuUJJqkM8xDHfHhjGA+pvicZmCOeBm1qqxw3Lm/N3LN/Noa4o
 t636qStJacYWmqiECy+4iqt+bTGtDMYrPVQLAJy6oKwcn44oW1Tj6Jsq6zn6oArXvtF1sk
 fP8k5owOsZs+eS57ved+oXhW3f9+YZE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636228174;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CMFabcUQOmRMnz/830S42/KsWEzTZCh5X2S4kvjJ4UU=;
 b=BlrtGyay0/ohE6treOkfGmqerLN+nG66fL3GDHQUSPGc+WJT5aUTqwPlhaojch+/yC60mP
 A7b016yaaJL4Z8AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 86C5413A1D;
 Sat,  6 Nov 2021 19:49:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4SppH07chmFyMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 06 Nov 2021 19:49:34 +0000
Message-ID: <584f7943-f16c-dc37-5005-e1b732509a15@suse.de>
Date: Sat, 6 Nov 2021 20:49:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 2/2] drm: Remove CONFIG_DRM_KMS_CMA_HELPER option
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>, kernel test robot <lkp@intel.com>
References: <20211101081751.24613-3-tzimmermann@suse.de>
 <202111012344.tYv3YxkG-lkp@intel.com> <YYVw70934dYhyGVZ@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YYVw70934dYhyGVZ@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Bv80Bx7LfDQs8tjHqti9oy4"
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
Cc: kbuild-all@lists.01.org, linux-aspeed@lists.ozlabs.org, airlied@linux.ie,
 naresh.kamboju@linaro.org, llvm@lists.linux.dev, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, noralf@tronnes.org, marcel@ziswiler.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Bv80Bx7LfDQs8tjHqti9oy4
Content-Type: multipart/mixed; boundary="------------L2EmAzQ2I1Wvbb0bXrrmmlOR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, kernel test robot <lkp@intel.com>
Cc: dri-devel@lists.freedesktop.org, kbuild-all@lists.01.org,
 linux-aspeed@lists.ozlabs.org, airlied@linux.ie, naresh.kamboju@linaro.org,
 llvm@lists.linux.dev, linux-mips@vger.kernel.org, noralf@tronnes.org,
 marcel@ziswiler.com
Message-ID: <584f7943-f16c-dc37-5005-e1b732509a15@suse.de>
Subject: Re: [PATCH 2/2] drm: Remove CONFIG_DRM_KMS_CMA_HELPER option
References: <20211101081751.24613-3-tzimmermann@suse.de>
 <202111012344.tYv3YxkG-lkp@intel.com> <YYVw70934dYhyGVZ@phenom.ffwll.local>
In-Reply-To: <YYVw70934dYhyGVZ@phenom.ffwll.local>

--------------L2EmAzQ2I1Wvbb0bXrrmmlOR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTEuMjEgdW0gMTg6NTkgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBNb24sIE5vdiAwMSwgMjAyMSBhdCAxMTo1OToxNVBNICswODAwLCBrZXJuZWwgdGVzdCBy
b2JvdCB3cm90ZToNCj4+IEhpIFRob21hcywNCj4+DQo+PiBJIGxvdmUgeW91ciBwYXRjaCEg
WWV0IHNvbWV0aGluZyB0byBpbXByb3ZlOg0KPj4NCj4+IFthdXRvIGJ1aWxkIHRlc3QgRVJS
T1Igb24gbmV4dC0yMDIxMTAyOV0NCj4+IFtjYW5ub3QgYXBwbHkgdG8gZHJtL2RybS1uZXh0
IHNoYXduZ3VvL2Zvci1uZXh0IHBpbmNoYXJ0bC1tZWRpYS9kcm0vZHUvbmV4dCB2NS4xNSB2
NS4xNS1yYzcgdjUuMTUtcmM2IHY1LjE1XQ0KPj4gW0lmIHlvdXIgcGF0Y2ggaXMgYXBwbGll
ZCB0byB0aGUgd3JvbmcgZ2l0IHRyZWUsIGtpbmRseSBkcm9wIHVzIGEgbm90ZS4NCj4+IEFu
ZCB3aGVuIHN1Ym1pdHRpbmcgcGF0Y2gsIHdlIHN1Z2dlc3QgdG8gdXNlICctLWJhc2UnIGFz
IGRvY3VtZW50ZWQgaW4NCj4+IGh0dHBzOi8vZ2l0LXNjbS5jb20vZG9jcy9naXQtZm9ybWF0
LXBhdGNoXQ0KPj4NCj4+IHVybDogICAgaHR0cHM6Ly9naXRodWIuY29tLzBkYXktY2kvbGlu
dXgvY29tbWl0cy9UaG9tYXMtWmltbWVybWFubi9kcm0tU21hbGwtQ01BLWNsZWFudXBzLzIw
MjExMTAxLTE2MTkxMQ0KPj4gYmFzZTogICAgYmRjYzlmNmE1NjgyNzVhZWQ0Y2MzMmZkMjMx
MjQzMmQyZmYxYjcwNA0KPj4gY29uZmlnOiB4ODZfNjQtcmFuZGNvbmZpZy1hMDA0LTIwMjEx
MTAxIChhdHRhY2hlZCBhcyAuY29uZmlnKQ0KPj4gY29tcGlsZXI6IGNsYW5nIHZlcnNpb24g
MTQuMC4wIChodHRwczovL2dpdGh1Yi5jb20vbGx2bS9sbHZtLXByb2plY3QgODJlZDEwNjU2
NzA2M2VhMjY5YzZkNTY2OTI3OGI3MzNlMTczYTQyZikNCj4+IHJlcHJvZHVjZSAodGhpcyBp
cyBhIFc9MSBidWlsZCk6DQo+PiAgICAgICAgICB3Z2V0IGh0dHBzOi8vcmF3LmdpdGh1YnVz
ZXJjb250ZW50LmNvbS9pbnRlbC9sa3AtdGVzdHMvbWFzdGVyL3NiaW4vbWFrZS5jcm9zcyAt
TyB+L2Jpbi9tYWtlLmNyb3NzDQo+PiAgICAgICAgICBjaG1vZCAreCB+L2Jpbi9tYWtlLmNy
b3NzDQo+PiAgICAgICAgICAjIGh0dHBzOi8vZ2l0aHViLmNvbS8wZGF5LWNpL2xpbnV4L2Nv
bW1pdC9jM2M3ZWM1ZjljY2Q5MGU3OGYwZjJkMzE0MzUwNWRiNDA2MGJiZjE3DQo+PiAgICAg
ICAgICBnaXQgcmVtb3RlIGFkZCBsaW51eC1yZXZpZXcgaHR0cHM6Ly9naXRodWIuY29tLzBk
YXktY2kvbGludXgNCj4+ICAgICAgICAgIGdpdCBmZXRjaCAtLW5vLXRhZ3MgbGludXgtcmV2
aWV3IFRob21hcy1aaW1tZXJtYW5uL2RybS1TbWFsbC1DTUEtY2xlYW51cHMvMjAyMTExMDEt
MTYxOTExDQo+PiAgICAgICAgICBnaXQgY2hlY2tvdXQgYzNjN2VjNWY5Y2NkOTBlNzhmMGYy
ZDMxNDM1MDVkYjQwNjBiYmYxNw0KPj4gICAgICAgICAgIyBzYXZlIHRoZSBhdHRhY2hlZCAu
Y29uZmlnIHRvIGxpbnV4IGJ1aWxkIHRyZWUNCj4+ICAgICAgICAgIG1rZGlyIGJ1aWxkX2Rp
cg0KPj4gICAgICAgICAgQ09NUElMRVJfSU5TVEFMTF9QQVRIPSRIT01FLzBkYXkgQ09NUElM
RVI9Y2xhbmcgbWFrZS5jcm9zcyBXPTEgTz1idWlsZF9kaXIgQVJDSD14ODZfNjQgU0hFTEw9
L2Jpbi9iYXNoDQo+Pg0KPj4gSWYgeW91IGZpeCB0aGUgaXNzdWUsIGtpbmRseSBhZGQgZm9s
bG93aW5nIHRhZyBhcyBhcHByb3ByaWF0ZQ0KPj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0
IHJvYm90IDxsa3BAaW50ZWwuY29tPg0KPj4NCj4+IEFsbCBlcnJvcnMgKG5ldyBvbmVzIHBy
ZWZpeGVkIGJ5ID4+LCBvbGQgb25lcyBwcmVmaXhlZCBieSA8PCk6DQo+Pg0KPj4+PiBFUlJP
UjogbW9kcG9zdDogbW9kdWxlIGRybV9jbWFfaGVscGVyIHVzZXMgc3ltYm9sIGRtYV9idWZf
dm1hcCBmcm9tIG5hbWVzcGFjZSBETUFfQlVGLCBidXQgZG9lcyBub3QgaW1wb3J0IGl0Lg0K
Pj4+PiBFUlJPUjogbW9kcG9zdDogbW9kdWxlIGRybV9jbWFfaGVscGVyIHVzZXMgc3ltYm9s
IGRtYV9idWZfdnVubWFwIGZyb20gbmFtZXNwYWNlIERNQV9CVUYsIGJ1dCBkb2VzIG5vdCBp
bXBvcnQgaXQuDQo+IA0KPiBJIGd1ZXNzIHRoaXMgaXMgc2ltcGx5IGJlY2F1c2Uga2J1aWxk
IHRlc3RzIG9uIHRvcCBvZiBsaW51eC1uZXh0LCB3aGVyZQ0KPiB0aGUgbmFtZXNwYWNpbmcg
aXMgYSBiaXQgZnVubnkuIFdlIG1pZ2h0IG5lZWQgYSBmaXh1cCB3aGVuIHdlIGJhY2ttZXJn
ZS4NCj4gDQo+IEVpdGhlciB3YXkgdGhpcyBsb29rcyBsaWtlIGEgZ29vZCBzaW1wbGlmaWNh
dGlvbiB0byBtZSwgb24gdGhlIHNlcmllczoNCj4gDQo+IFJldmlld2VkLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KDQpUaGFua3MgYSBsb3QuIFdlIGZp
eGVkIHRoZSBuYW1lc3BhY2UgcHJvYmxlbSBpbiA2NzUwNTMxMTVlNGUgKCJkcm06IA0KaW1w
b3J0IERNQV9CVUYgbW9kdWxlIG5hbWVzcGFjZSIpLiBCdXQgdGhlIGRtYS1idWYgbmFtZXNw
YWNlIHBhdGNoIGlzIA0Kbm90IGluIGRybS1taXNjIHRyZWVzLiBHaXZlbiBob3cgd2lkZWx5
IHVzZWQgdGhlIGRtYS1idWYgaW50ZXJmYWNlIGlzLCANCnRoZSBiYWNrbWVyZ2Ugd2lsbCBp
bmRlZWQgY2F1c2Ugc29tZSB0cm91YmxlLg0KDQpJIG1lYW53aGlsZSBzZW50IG91dCB0aGUg
cGF0Y2hzZXQgd2l0aCBhIGJhc2UgY29tbWl0LiBLZXJuZWwgQ0kgd2lsbCANCmhvcGVmdWxs
eSBzdWNjZWVkIG5vdy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+DQo+PiAt
LS0NCj4+IDAtREFZIENJIEtlcm5lbCBUZXN0IFNlcnZpY2UsIEludGVsIENvcnBvcmF0aW9u
DQo+PiBodHRwczovL2xpc3RzLjAxLm9yZy9oeXBlcmtpdHR5L2xpc3Qva2J1aWxkLWFsbEBs
aXN0cy4wMS5vcmcNCj4gDQo+IA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------L2EmAzQ2I1Wvbb0bXrrmmlOR--

--------------0Bv80Bx7LfDQs8tjHqti9oy4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGG3E0FAwAAAAAACgkQlh/E3EQov+AN
pRAAwLRPMaYFta1HtrwmbvGk96E9BFR1zgu+mbDPx5+K5gooHs1/OwarQk3GkDX3bvQs8b6CijCd
+BELI9lOfv1LgTRk/B7TwLgA6U8JMLkGzetBA8C2BGWHqWJy+VJUcHVpziQzwGeARvLzdqXItxwf
kK40EQ+Rn4Az82GgeZef5ti+Veu5gvlC5/Y9/nrhmdx6bPUhALC0pnmvfhF5RTPkIKmLy8oyn0qH
CEwO1NlGZUGjL0GjhVRq9VGxf/Gn9kgIgEhKPm07tfpCz55PeJjtg06IxPOtWGPURwanaVmbxf2J
/ACHopxUWzt2NQU/JVgCDVr2DsgMk6fm8qYQ4rEjXPOccvay75NI0iccF7MwmT23Fbsf0dR9N7o8
PpTKlJkeqDHr444BPbn1pZQUvFDLMbuNkeZ/1xAFrmkjmf5Y0CAQMQ/TrDuSDwU/QXKWopYOSiYn
XRXimzywhuJnKytP6nh5VXxE862c7PMPwqhpbLvNUQnyhSzzV6TQG6Rt+nIJF+Xp7q4+BDCjYSrR
qq4sd31G/E0R1m/Cg2UyNCEbF0uBF1nJlURahYkZSa6Qyw1rqfOjv9fuhjWvUS1WTrlNK8w+TgXO
XGfajgh7oAK+B8ZdrzBc6P1AKYH99j0w5KoxmuypziXjpxrA5h63im6xbbhWmTQofhV/3mAahmqM
IHU=
=FS+p
-----END PGP SIGNATURE-----

--------------0Bv80Bx7LfDQs8tjHqti9oy4--
