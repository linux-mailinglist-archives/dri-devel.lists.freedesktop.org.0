Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8710973D91D
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 10:06:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5863210E1AE;
	Mon, 26 Jun 2023 08:06:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6CF10E1A1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 08:06:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2528F2188E;
 Mon, 26 Jun 2023 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687766806; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6OWviMNKyIwyBqqGZ7PZ/kaUsbg05v6iBIjlieOAiR8=;
 b=EKDTL60t34G5NtauHQ4ZGanVr0DpB402L3lP04geTUYSexZEkxb2rTUjk93Hw9bCG53dSi
 MkwLN6jQCWYQro008S+xgRJFJPrZQx7gz7avgrbLFjl2Jpukctvv4yK+Fck6Ly4JmjTc9g
 PtZdcbweCPHatcIqkatBBu/Cu3NlMms=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687766806;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6OWviMNKyIwyBqqGZ7PZ/kaUsbg05v6iBIjlieOAiR8=;
 b=1VjqN75vIwLhxgbFU+lGyay50CQslxQuHv6bFCQHVe7W6mXqY+XVdfyESei7UxMz8Zm2gx
 RZUrdd7lJmwqN9Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F41091391D;
 Mon, 26 Jun 2023 08:06:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id G6KLOhVHmWQQSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Jun 2023 08:06:45 +0000
Message-ID: <7c2715be-c673-c362-7cc2-05771762b746@suse.de>
Date: Mon, 26 Jun 2023 10:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/udl: Convert to drm_crtc_helper_atomic_check()
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <336040bba05b019d629551b350b15bad2df2ba96.1687425928.git.geert+renesas@glider.be>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <336040bba05b019d629551b350b15bad2df2ba96.1687425928.git.geert+renesas@glider.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sThwSXsoElny64xd24CQPSXX"
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
--------------sThwSXsoElny64xd24CQPSXX
Content-Type: multipart/mixed; boundary="------------UA8YAmm0hxFA4d6c1HR3KxQj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <7c2715be-c673-c362-7cc2-05771762b746@suse.de>
Subject: Re: [PATCH] drm/udl: Convert to drm_crtc_helper_atomic_check()
References: <336040bba05b019d629551b350b15bad2df2ba96.1687425928.git.geert+renesas@glider.be>
In-Reply-To: <336040bba05b019d629551b350b15bad2df2ba96.1687425928.git.geert+renesas@glider.be>

--------------UA8YAmm0hxFA4d6c1HR3KxQj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIyLjA2LjIzIHVtIDExOjI3IHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOg0K
PiBVc2UgdGhlIGRybV9jcnRjX2hlbHBlcl9hdG9taWNfY2hlY2soKSBoZWxwZXIgaW5zdGVh
ZCBvZiBvcGVuLWNvZGluZyB0aGUNCj4gc2FtZSBvcGVyYXRpb24uDQo+IA0KPiBTaWduZWQt
b2ZmLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0K
DQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQoNCj4gLS0tDQo+IENvbXBpbGUtdGVzdGVkIG9ubHkuDQo+IC0tLQ0KPiAgIGRyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYyB8IDEzICsrLS0tLS0tLS0tLS0NCj4gICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgYi9kcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMNCj4gaW5kZXggYWEwMmZkMjc4OWMzZjg4NS4u
NDA4NzZiY2RkNzlhNDdhYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfbW9kZXNldC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQu
Yw0KPiBAQCAtMTIsNiArMTIsNyBAQA0KPiAgIA0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2F0
b21pYy5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2F0b21pY19oZWxwZXIuaD4NCj4gKyNp
bmNsdWRlIDxkcm0vZHJtX2NydGNfaGVscGVyLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1f
ZGFtYWdlX2hlbHBlci5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPg0KPiAgICNp
bmNsdWRlIDxkcm0vZHJtX2VkaWQuaD4NCj4gQEAgLTMxMCwxNiArMzExLDYgQEAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fcGxhbmVfZnVuY3MgdWRsX3ByaW1hcnlfcGxhbmVfZnVuY3Mg
PSB7DQo+ICAgICogQ1JUQw0KPiAgICAqLw0KPiAgIA0KPiAtc3RhdGljIGludCB1ZGxfY3J0
Y19oZWxwZXJfYXRvbWljX2NoZWNrKHN0cnVjdCBkcm1fY3J0YyAqY3J0Yywgc3RydWN0IGRy
bV9hdG9taWNfc3RhdGUgKnN0YXRlKQ0KPiAtew0KPiAtCXN0cnVjdCBkcm1fY3J0Y19zdGF0
ZSAqbmV3X2NydGNfc3RhdGUgPSBkcm1fYXRvbWljX2dldF9uZXdfY3J0Y19zdGF0ZShzdGF0
ZSwgY3J0Yyk7DQo+IC0NCj4gLQlpZiAoIW5ld19jcnRjX3N0YXRlLT5lbmFibGUpDQo+IC0J
CXJldHVybiAwOw0KPiAtDQo+IC0JcmV0dXJuIGRybV9hdG9taWNfaGVscGVyX2NoZWNrX2Ny
dGNfcHJpbWFyeV9wbGFuZShuZXdfY3J0Y19zdGF0ZSk7DQo+IC19DQo+IC0NCj4gICBzdGF0
aWMgdm9pZCB1ZGxfY3J0Y19oZWxwZXJfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMg
KmNydGMsIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSkNCj4gICB7DQo+ICAgCXN0
cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBjcnRjLT5kZXY7DQo+IEBAIC0zODEsNyArMzcyLDcg
QEAgc3RhdGljIHZvaWQgdWRsX2NydGNfaGVscGVyX2F0b21pY19kaXNhYmxlKHN0cnVjdCBk
cm1fY3J0YyAqY3J0Yywgc3RydWN0IGRybV9hdG8NCj4gICB9DQo+ICAgDQo+ICAgc3RhdGlj
IGNvbnN0IHN0cnVjdCBkcm1fY3J0Y19oZWxwZXJfZnVuY3MgdWRsX2NydGNfaGVscGVyX2Z1
bmNzID0gew0KPiAtCS5hdG9taWNfY2hlY2sgPSB1ZGxfY3J0Y19oZWxwZXJfYXRvbWljX2No
ZWNrLA0KPiArCS5hdG9taWNfY2hlY2sgPSBkcm1fY3J0Y19oZWxwZXJfYXRvbWljX2NoZWNr
LA0KPiAgIAkuYXRvbWljX2VuYWJsZSA9IHVkbF9jcnRjX2hlbHBlcl9hdG9taWNfZW5hYmxl
LA0KPiAgIAkuYXRvbWljX2Rpc2FibGUgPSB1ZGxfY3J0Y19oZWxwZXJfYXRvbWljX2Rpc2Fi
bGUsDQo+ICAgfTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rl
diwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJC
IDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------UA8YAmm0hxFA4d6c1HR3KxQj--

--------------sThwSXsoElny64xd24CQPSXX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSZRxUFAwAAAAAACgkQlh/E3EQov+D2
YhAAyL29onEf36ARHezX34hlVgmbBehehmQXeKcDd/uOPWH7JNArMNcierc08paqnHgp10W5NtCi
vQs4q3AMzmsepT1yRZRuH3X9PGUx0oV3VouotOZ9tYkjQyMte7m27w8DCrdEPP3Nd58IB/OWQ8JB
3S5r267WC4hGIB73LST15qJ0ZrcYB5aNq0HzAQJtRGztUUo8BT88EZZnWqrxHdMgC/M3SFiiXQHm
nqyIEoSEz5p2KUC5vHk0IjKIbt0mXHshPpnIUNbzdB9MDhKs9QpLSNrhEKFFxVmi4wuFG0eVln1n
owOSRw+sqM84vdDaJQOW1aKuvubeJFNI/EMsypUX1ISlxM55j34Y4ukkwphswoStklLwIvXBd3En
w9/M5FYpD6hisF0W3n0fXN+wBXU8Z7R8eMAU4Xkl72U643kHn3/VejIYvRZK8KnD2HWEUIRaIX07
/ddkZxyEH7tQyLuflvb2XBb1rnjE50xVl+kdeNzH333NP0RUYrAyQOrAKK+Kja9zR8Pjvp5cvd98
riU+O2AIVLuvzOyMRo9/en7lvVrjXYZOXHFbfuzfPieo8Sz7huhbuDmfa30CYtxi61sArmddAO3v
//dk7B5Dx1Tx544foFFG9n29n+vsjk2A0o8d23dPK2HiEdLprdJYsbzhX5WYMpVik0/kwIju7PN5
1aY=
=jHoA
-----END PGP SIGNATURE-----

--------------sThwSXsoElny64xd24CQPSXX--
