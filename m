Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2804F4B0FF0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 15:14:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60AE410E8F8;
	Thu, 10 Feb 2022 14:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A81610E8F8;
 Thu, 10 Feb 2022 14:14:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3737B1F391;
 Thu, 10 Feb 2022 14:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644502466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nnfenqfMSf5bQb0IqxKHoM36/ly8R0G5NUn4G0bgjt8=;
 b=mgxF2nsYDMQ7L6BkLhsB5HgcSss96awHu+5ZIerjKCp0z0BFmbXjKi3j7NG94vD+Mzw3Dr
 0BCBEQW04eXssTyj1VUORNFNlrMCdUWkI9Hh3xJjEULlJM1JsNDIlDNDWewydg7433fdd1
 xudWM8o9ptMizYSc8TFppA7sghW1yP0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644502466;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nnfenqfMSf5bQb0IqxKHoM36/ly8R0G5NUn4G0bgjt8=;
 b=AL/9AQnfURS4DaMh2/JBFhnZhLaRBN1XsVuxhnJ1AqP7RyS1Z5FpSZr53tjOIWaERu0cHj
 goZ8wmKODsSzF0Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EFE1513B9E;
 Thu, 10 Feb 2022 14:14:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7jeOOcEdBWKuagAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Feb 2022 14:14:25 +0000
Message-ID: <b9ab9aee-2a21-0ff6-032a-694066b2588a@suse.de>
Date: Thu, 10 Feb 2022 15:14:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 10/19] fbcon: Ditch error handling for
 con2fb_release_oldinfo
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-11-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220208210824.2238981-11-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KxoDVfMsoxYBeASsq40IP0O6"
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
Cc: linux-fbdev@vger.kernel.org, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KxoDVfMsoxYBeASsq40IP0O6
Content-Type: multipart/mixed; boundary="------------MaeCgNpsSLLQxEICSStY0Q7g";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-fbdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Suarez <cssk@net-c.es>, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Message-ID: <b9ab9aee-2a21-0ff6-032a-694066b2588a@suse.de>
Subject: Re: [PATCH v2 10/19] fbcon: Ditch error handling for
 con2fb_release_oldinfo
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
 <20220208210824.2238981-11-daniel.vetter@ffwll.ch>
In-Reply-To: <20220208210824.2238981-11-daniel.vetter@ffwll.ch>

--------------MaeCgNpsSLLQxEICSStY0Q7g
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA4LjAyLjIyIHVtIDIyOjA4IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gSXQg
ZG9lc24ndCBldmVyIGZhaWwgYW55bW9yZS4NCj4gDQo+IEFja2VkLWJ5OiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPg0KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVs
QGZmd2xsLmNoPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQo+IENjOiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPg0KPiBDYzogQ2xhdWRpbyBTdWFyZXogPGNzc2tAbmV0LWMuZXM+DQo+IENjOiBEdSBD
aGVuZyA8ZHVjaGVuZzJAZ21haWwuY29tPg0KPiBDYzogVGV0c3VvIEhhbmRhIDxwZW5ndWlu
LWtlcm5lbEBJLWxvdmUuU0FLVVJBLm5lLmpwPg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2ZiY29uLmMgfCAzNyArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0t
LS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAyNCBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJj
b24uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYmNvbi5jDQo+IGluZGV4IDNlMWEz
ZTdiZjUyNy4uYTYwODkxMDA1ZDQ0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJjb24uYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJj
b24uYw0KPiBAQCAtNzM5LDkgKzczOSw4IEBAIHN0YXRpYyBpbnQgY29uMmZiX2FjcXVpcmVf
bmV3aW5mbyhzdHJ1Y3QgdmNfZGF0YSAqdmMsIHN0cnVjdCBmYl9pbmZvICppbmZvLA0KPiAg
IAlyZXR1cm4gZXJyOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbnQgY29uMmZiX3JlbGVh
c2Vfb2xkaW5mbyhzdHJ1Y3QgdmNfZGF0YSAqdmMsIHN0cnVjdCBmYl9pbmZvICpvbGRpbmZv
LA0KPiAtCQkJCSAgc3RydWN0IGZiX2luZm8gKm5ld2luZm8sIGludCB1bml0LA0KPiAtCQkJ
CSAgaW50IG9sZGlkeCwgaW50IGZvdW5kKQ0KPiArc3RhdGljIHZvaWQgY29uMmZiX3JlbGVh
c2Vfb2xkaW5mbyhzdHJ1Y3QgdmNfZGF0YSAqdmMsIHN0cnVjdCBmYl9pbmZvICpvbGRpbmZv
LA0KPiArCQkJCSAgIHN0cnVjdCBmYl9pbmZvICpuZXdpbmZvKQ0KPiAgIHsNCj4gICAJc3Ry
dWN0IGZiY29uX29wcyAqb3BzID0gb2xkaW5mby0+ZmJjb25fcGFyOw0KPiAgIAlpbnQgcmV0
Ow0KPiBAQCAtNzcwLDggKzc2OSw2IEBAIHN0YXRpYyBpbnQgY29uMmZiX3JlbGVhc2Vfb2xk
aW5mbyhzdHJ1Y3QgdmNfZGF0YSAqdmMsIHN0cnVjdCBmYl9pbmZvICpvbGRpbmZvLA0KPiAg
IAkJCQkiZGV0ZWN0ZWQgdW5oYW5kbGVkIGZiX3NldF9wYXIgZXJyb3IsICINCj4gICAJCQkJ
ImVycm9yIGNvZGUgJWRcbiIsIHJldCk7DQo+ICAgCX0NCj4gLQ0KPiAtCXJldHVybiAwOw0K
PiAgIH0NCj4gICANCj4gICBzdGF0aWMgdm9pZCBjb24yZmJfaW5pdF9kaXNwbGF5KHN0cnVj
dCB2Y19kYXRhICp2Yywgc3RydWN0IGZiX2luZm8gKmluZm8sDQo+IEBAIC04MjUsNyArODIy
LDcgQEAgc3RhdGljIGludCBzZXRfY29uMmZiX21hcChpbnQgdW5pdCwgaW50IG5ld2lkeCwg
aW50IHVzZXIpDQo+ICAgCWludCBvbGRpZHggPSBjb24yZmJfbWFwW3VuaXRdOw0KPiAgIAlz
dHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IHJlZ2lzdGVyZWRfZmJbbmV3aWR4XTsNCj4gICAJc3Ry
dWN0IGZiX2luZm8gKm9sZGluZm8gPSBOVUxMOw0KPiAtCWludCBmb3VuZCwgZXJyID0gMDsN
Cj4gKwlpbnQgZm91bmQsIGVyciA9IDAsIHNob3dfbG9nbzsNCj4gICANCj4gICAJV0FSTl9D
T05TT0xFX1VOTE9DS0VEKCk7DQo+ICAgDQo+IEBAIC04NTQsMTggKzg1MSwxNSBAQCBzdGF0
aWMgaW50IHNldF9jb24yZmJfbWFwKGludCB1bml0LCBpbnQgbmV3aWR4LCBpbnQgdXNlcikN
Cj4gICAJICogZmJjb24gc2hvdWxkIHJlbGVhc2UgaXQuDQo+ICAgCSAqLw0KPiAgIAlpZiAo
IWVyciAmJiBvbGRpbmZvICYmICFzZWFyY2hfZmJfaW5fbWFwKG9sZGlkeCkpDQo+IC0JCWVy
ciA9IGNvbjJmYl9yZWxlYXNlX29sZGluZm8odmMsIG9sZGluZm8sIGluZm8sIHVuaXQsIG9s
ZGlkeCwNCj4gLQkJCQkJICAgICBmb3VuZCk7DQo+ICsJCWNvbjJmYl9yZWxlYXNlX29sZGlu
Zm8odmMsIG9sZGluZm8sIGluZm8pOw0KPiAgIA0KPiAtCWlmICghZXJyKSB7DQo+IC0JCWlu
dCBzaG93X2xvZ28gPSAoZmdfY29uc29sZSA9PSAwICYmICF1c2VyICYmDQo+IC0JCQkJIGxv
Z29fc2hvd24gIT0gRkJDT05fTE9HT19ET05UU0hPVyk7DQo+ICsJc2hvd19sb2dvID0gKGZn
X2NvbnNvbGUgPT0gMCAmJiAhdXNlciAmJg0KPiArCQkJIGxvZ29fc2hvd24gIT0gRkJDT05f
TE9HT19ET05UU0hPVyk7DQo+ICAgDQo+IC0JCWlmICghZm91bmQpDQo+IC0JCQlmYmNvbl9h
ZGRfY3Vyc29yX3dvcmsoaW5mbyk7DQo+IC0JCWNvbjJmYl9tYXBfYm9vdFt1bml0XSA9IG5l
d2lkeDsNCj4gLQkJY29uMmZiX2luaXRfZGlzcGxheSh2YywgaW5mbywgdW5pdCwgc2hvd19s
b2dvKTsNCj4gLQl9DQo+ICsJaWYgKCFmb3VuZCkNCj4gKwkJZmJjb25fYWRkX2N1cnNvcl93
b3JrKGluZm8pOw0KPiArCWNvbjJmYl9tYXBfYm9vdFt1bml0XSA9IG5ld2lkeDsNCj4gKwlj
b24yZmJfaW5pdF9kaXNwbGF5KHZjLCBpbmZvLCB1bml0LCBzaG93X2xvZ28pOw0KPiAgIA0K
PiAgIAlpZiAoIXNlYXJjaF9mYl9pbl9tYXAoaW5mb19pZHgpKQ0KPiAgIAkJaW5mb19pZHgg
PSBuZXdpZHg7DQo+IEBAIC0yNzY5LDcgKzI3NjMsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
ZmJjb25fdW5iaW5kKHZvaWQpIHt9DQo+ICAgLyogY2FsbGVkIHdpdGggY29uc29sZV9sb2Nr
IGhlbGQgKi8NCj4gICB2b2lkIGZiY29uX2ZiX3VuYmluZChzdHJ1Y3QgZmJfaW5mbyAqaW5m
bykNCj4gICB7DQo+IC0JaW50IGksIG5ld19pZHggPSAtMSwgcmV0ID0gMDsNCj4gKwlpbnQg
aSwgbmV3X2lkeCA9IC0xOw0KPiAgIAlpbnQgaWR4ID0gaW5mby0+bm9kZTsNCj4gICANCj4g
ICAJV0FSTl9DT05TT0xFX1VOTE9DS0VEKCk7DQo+IEBAIC0yODAzLDEzICsyNzk3LDggQEAg
dm9pZCBmYmNvbl9mYl91bmJpbmQoc3RydWN0IGZiX2luZm8gKmluZm8pDQo+ICAgCQkJaWYg
KGNvbjJmYl9tYXBbaV0gPT0gaWR4KSB7DQo+ICAgCQkJCWNvbjJmYl9tYXBbaV0gPSAtMTsN
Cj4gICAJCQkJaWYgKCFzZWFyY2hfZmJfaW5fbWFwKGlkeCkpIHsNCj4gLQkJCQkJcmV0ID0g
Y29uMmZiX3JlbGVhc2Vfb2xkaW5mbyh2Y19jb25zW2ldLmQsDQo+IC0JCQkJCQkJCSAgICAg
aW5mbywgTlVMTCwgaSwNCj4gLQkJCQkJCQkJICAgICBpZHgsIDApOw0KPiAtCQkJCQlpZiAo
cmV0KSB7DQo+IC0JCQkJCQljb24yZmJfbWFwW2ldID0gaWR4Ow0KPiAtCQkJCQkJcmV0dXJu
Ow0KPiAtCQkJCQl9DQo+ICsJCQkJCWNvbjJmYl9yZWxlYXNlX29sZGluZm8odmNfY29uc1tp
XS5kLA0KPiArCQkJCQkJCSAgICAgICBpbmZvLCBOVUxMKTsNCj4gICAJCQkJfQ0KPiAgIAkJ
CX0NCj4gICAJCX0NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhm
ZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7D
vHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------MaeCgNpsSLLQxEICSStY0Q7g--

--------------KxoDVfMsoxYBeASsq40IP0O6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIFHcEFAwAAAAAACgkQlh/E3EQov+D5
9BAAvIDTeMUHZ7/wVXLw/JN5ujphJHSg09vWdT3vd/aT/EnXjLE2BpITWfyzaM9I7yXlmhFaFZDc
BzdI/Ps1Zz3d1BxnS/E/Bsi4DAF5ZRgn9nA7S9z6VVzss7EuG3qDFCM/4p1Xvb/tr27HVFmc3GrI
xXfNYTKV4941E7vhOaCEWFewAqcm25+NaXFHv8CpeE2rsYOqN6KPFttbSZNF8fYykKHwMSj+w2hj
f62P0FbYVKx4+c8pQf2VVVFn+26fklkP3kfatUNldohjMXrog7b8pf8Pb1igtjukjmqvBOPUenJM
dyOQITdBjBO3x1McqnaNu99w2xRFsTYU4n2/dTqYcg/vQvAKkQlDeeG1o97dcLl58k09wgtIKtnj
RazRcZQ4oudcGu2uCkFrFNq8mBSgr2xYeGCu8jjYwxoUtwU5yKj26YhsEhb9rTPAIOqYCVEowTeW
SDRFwoBK9wmxuTKgCj9YNW8taVp0mJu+MBvrv9WjvxP+Taq28BqIRaFK8J8HkbaIGz243oIBBnXS
ZJEcJM7QggGeII+n8tnh7B16A8gJ93vVx7HAkTWOcO3r3ImnN8UxVH8LsPppYgUI1U64zkZsFYJQ
WFYrn97/GE4P+FdoJIMidblnEcDmgZiqDdMUOSBBR0Z572uNGXUQB1M31tO1wX1pEeUS+GWZH43u
58M=
=KQhL
-----END PGP SIGNATURE-----

--------------KxoDVfMsoxYBeASsq40IP0O6--
