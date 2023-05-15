Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 220AB702777
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 10:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6576410E182;
	Mon, 15 May 2023 08:42:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC73810E17A
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 08:42:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DFCCE21D5C;
 Mon, 15 May 2023 08:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684140140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SL8/mzh6/v8wpmj2l3KJaiJLCGPWVT+Gh48t14X3TIU=;
 b=FlojKPdqBI8xpjuk/wLFK0QS8MmDlgEZCnBOVf9urdwUd7w24ITKVUwhTHwnWIsntLuX/F
 P2+dw7vlHdZf3/ANqff5tek8rXUY0sxm9tHZGMr/E5+HY7wg8buWYzKQmEX+3i5cwEwQkm
 ITaaMNd+HkFpH/zNvKrv9fk0ZV3zbvk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684140140;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SL8/mzh6/v8wpmj2l3KJaiJLCGPWVT+Gh48t14X3TIU=;
 b=Ovgh0XO16DrSLtDMGyWw10iTnM1CfgBD02bdufT2q9xm0/vNbBVujj2Z84Bggw2hLSjk6C
 /o8Ba8SpZmbxCHBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BAD29138E5;
 Mon, 15 May 2023 08:42:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rBqCLGzwYWToMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 15 May 2023 08:42:20 +0000
Message-ID: <1dfbcb14-8efa-e9f3-7d82-301fa08771dc@suse.de>
Date: Mon, 15 May 2023 10:42:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
 <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
 <ZGHqeLcWw5tEL3Fy@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ZGHqeLcWw5tEL3Fy@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hzf01N0HP6raeZsZZN4bedi1"
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
Cc: mairacanal@riseup.net, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 jose.exposito89@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hzf01N0HP6raeZsZZN4bedi1
Content-Type: multipart/mixed; boundary="------------b04MPKQA6uBYGOEr4gkCZQJ0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: mairacanal@riseup.net, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, jose.exposito89@gmail.com
Message-ID: <1dfbcb14-8efa-e9f3-7d82-301fa08771dc@suse.de>
Subject: Re: [PATCH v3 11/13] drm/fb-helper: Fix single-probe color-format
 selection
References: <20230102112927.26565-1-tzimmermann@suse.de>
 <20230102112927.26565-12-tzimmermann@suse.de>
 <CACRpkdZAqnWcq+fzAY0HjHN5=nDHMqb7g9mZNtLM9x4y40vvAw@mail.gmail.com>
 <fb0b39a3-4f21-72a8-d707-ea65fdde45fc@suse.de>
 <ZGHqeLcWw5tEL3Fy@phenom.ffwll.local>
In-Reply-To: <ZGHqeLcWw5tEL3Fy@phenom.ffwll.local>

--------------b04MPKQA6uBYGOEr4gkCZQJ0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDUuMjMgdW0gMTA6MTYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBGcmksIE1heSAxMiwgMjAyMyBhdCAwNDoxMTo0OFBNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMTIuMDUuMjMgdW0gMTU6MjAgc2Nocmll
YiBMaW51cyBXYWxsZWlqOg0KPj4+IFNvcnJ5IGZvciBsYXRlIHJlZ3Jlc3Npb24gZGV0ZWN0
aW9uIGJ1dCB0aGlzIHBhdGNoIHJlZ3Jlc3Nlcw0KPj4+IHRoZSBJbnRlZ3JhdG9yIEFCIElN
UEQtMSBncmFwaGljcywgSSBiaXNlY3RlZCBkb3duIHRvIHRoaXMNCj4+PiBwYXRjaC4NCj4+
IFsuLi5dDQo+Pj4gVGhpcyBpcyB0aGUgZHJpdmVyOg0KPj4+IGRyaXZlcnMvZ3B1L2RybS9w
bDExMS9wbDExMV92ZXJzYXRpbGUuYw0KPj4+IHdpdGggdGhlIHBsMTEwX2ltcGQxIHZhcmlh
bnQsIHNvIHRoZXNlIGFyZSB0aGUgc3VwcG9ydGVkIG1vZGVzOg0KPj4+DQo+Pj4gLyogUEwx
MTAgcGl4ZWwgZm9ybWF0cyBmb3IgSW50ZWdyYXRvciwgdmFuaWxsYSBQTDExMCAqLw0KPj4+
IHN0YXRpYyBjb25zdCB1MzIgcGwxMTBfaW50ZWdyYXRvcl9waXhlbF9mb3JtYXRzW10gPSB7
DQo+Pj4gICAgICAgICAgIERSTV9GT1JNQVRfQUJHUjg4ODgsDQo+Pj4gICAgICAgICAgIERS
TV9GT1JNQVRfWEJHUjg4ODgsDQo+Pj4gICAgICAgICAgIERSTV9GT1JNQVRfQVJHQjg4ODgs
DQo+Pj4gICAgICAgICAgIERSTV9GT1JNQVRfWFJHQjg4ODgsDQo+Pj4gICAgICAgICAgIERS
TV9GT1JNQVRfQUJHUjE1NTUsDQo+Pj4gICAgICAgICAgIERSTV9GT1JNQVRfWEJHUjE1NTUs
DQo+Pj4gICAgICAgICAgIERSTV9GT1JNQVRfQVJHQjE1NTUsDQo+Pj4gICAgICAgICAgIERS
TV9GT1JNQVRfWFJHQjE1NTUsDQo+Pj4gfTsNCj4+PiAoLi4uKQ0KPj4+IC8qDQo+Pj4gICAg
KiBUaGUgSU0tUEQxIHZhcmlhbnQgaXMgYSBQTDExMCB3aXRoIGEgYnVuY2ggb2YgYnJva2Vu
LCBvciBub3QNCj4+PiAgICAqIHlldCBpbXBsZW1lbnRlZCBmZWF0dXJlcw0KPj4+ICAgICov
DQo+Pj4gc3RhdGljIGNvbnN0IHN0cnVjdCBwbDExMV92YXJpYW50X2RhdGEgcGwxMTBfaW1w
ZDEgPSB7DQo+Pj4gICAgICAgICAgIC5uYW1lID0gIlBMMTEwIElNLVBEMSIsDQo+Pj4gICAg
ICAgICAgIC5pc19wbDExMCA9IHRydWUsDQo+Pj4gICAgICAgICAgIC5icm9rZW5fY2xvY2tk
aXZpZGVyID0gdHJ1ZSwNCj4+PiAgICAgICAgICAgLmJyb2tlbl92YmxhbmsgPSB0cnVlLA0K
Pj4+ICAgICAgICAgICAuZm9ybWF0cyA9IHBsMTEwX2ludGVncmF0b3JfcGl4ZWxfZm9ybWF0
cywNCj4+PiAgICAgICAgICAgLm5mb3JtYXRzID0gQVJSQVlfU0laRShwbDExMF9pbnRlZ3Jh
dG9yX3BpeGVsX2Zvcm1hdHMpLA0KPj4+ICAgICAgICAgICAuZmJfYnBwID0gMTYsDQo+Pj4g
fTsNCj4+Pg0KPj4+IE5vdGljZSB0aGUgYWJzZW5jZSBvZiBSR0I1NjUhDQo+Pj4gVGhlbiB3
ZSBpbml0aWFsaXplZCB0aGUgZnJhbWJ1ZmZlciBsaWtlIHRoaXM6DQo+Pj4NCj4+PiAgICAg
ICAgICAgZHJtX2ZiZGV2X2RtYV9zZXR1cChkcm0sIHByaXYtPnZhcmlhbnQtPmZiX2JwcCk7
DQo+Pj4NCj4+PiBBbmQgYXMgeW91IHNlZSBwcml2LT52YXJpYW50LT5mYl9icHAgd2lsbCBi
ZSAxNiwgc28gd2Ugd2FudCBzb21lDQo+Pj4gMTZicHAgbW9kZSBob3dldmVyIHRoZSBvbmx5
IHN1cHBvcnRlZCBkZXB0aCBpcyAxNSAodGhlIDE1NTUgbW9kZXMpDQo+Pj4gc28gaXQgd291
bGQgdXNlIHRoYXQgYnkgc2NhbGluZyBiYWNrIGRlcHRoIHRvIDE1Lg0KPj4+DQo+Pj4gSG93
ZXZlciBhZnRlciB0aGlzIHBhdGNoIHRoYXQgZG9lc24ndCB3b3JrIGFueW1vcmUuDQo+Pj4N
Cj4+PiBBbnkgaGludHMgb24gaG93IHdlIGNhbiBmaXggdGhpcz8NCj4+DQo+PiBBY2NvcmRp
bmcgdG8gYSBxdWljayBncmVwIGZvciBmYl9icHAsIGl0J3Mgb25seSB1c2VkIGZvciB0aGUg
Y2FsbCB0bw0KPj4gZHJtX2ZiZGV2X2RtYV9zZXR1cCgpLCByaWdodD8gSW4gdGhpcyBjYXNl
LCB5b3Ugc2hvdWxkIHNldCBpdCB0byAxNSBmb3IgdGhlDQo+PiBtb2RlbHMgd2l0aG91dCBy
Z2I1NjUuIFRoZSBzd2l0Y2ggYXQgWzFdIHNob3VsZCB0aGVuIHBpY2sgdGhlIGNvcnJlY3QN
Cj4+IHZhbHVlcy4NCj4+DQo+PiBUaGUgcHJlZmVycmVkX2JwcCBwYXJhbWV0ZXIgaGFkIGEg
Y2hhbmdlIGluIHNlbWFudGljcy4gSXQgdXNlZCB0byBiZSB0aGUNCj4+IG51bWJlciBvZiBi
aXRzIHBlciBwaXhlbC4gQnV0IHRoYXQgbWFrZXMgaXQgaGFyZCB0byBzZWxlY3QgYmV0d2Vl
biBSR0IxNTU1DQo+PiBhbmQgUkdCNTY1LiAgU28gaXQncyBub3cgYSBzcGVjaWFsIGNvbG9y
LW1vZGUgdmFsdWUgdGhhdCB3b3JrcyBsaWtlIHRoZQ0KPj4ga2VybmVsJ3MgdmlkZW89IHBh
cmFtZXRlci4gVmFsdWVzIG9mIDE1IGFuZCAzMiBhcmUgZGlmZmVyZW50IGZyb20gdGhlIHJl
c3QuDQo+PiBUaGF0IHN3aXRjaCBhdCBbMV0gZXhwbGFpbnMgaXQuIE1heWJlIHlvdSBzaG91
bGQgcmVuYW1lIGZiX2JwcCB0byBjb2xvcl9tb2RlDQo+PiBmb3IgY2xhcml0eS4NCj4+DQo+
PiBMZXQgbWUga25vdyBpZiB0aGlzIGhlbHBzLg0KPiANCj4gU2hvdWxkbid0IHRoZSBoZWxw
ZXJzIHRyeSB0byBkbyB0aGlzIGF1dG9tYXRpY2FsbHk/IEkgdGhpbmsgdGhleSBraW5kYSBk
aWQNCj4gdGhhdCBpbiB0aGUgcGFzdCBpbiBzb21lIGxpbWl0ZWQgY2lyY3Vtc3RhbmNlcyBs
aWtlIHRoaXMgLi4uDQoNClRoYXQgd2FzIHRoZSBpbnRlbnRpb24sIGJ1dCBpdCBuZXZlciBy
ZWFsbHkgd29ya2VkIGF0IGFsbC4gSUlSQyB0aGUgDQpjb2xvci1mb3JtYXQgc2VsZWN0aW9u
IG1peGVkIHVwIGRlcHRoIGFuZCBicHAgdmFsdWVzIGZyZWVseS4gRmFjdG9yIGluIA0KdGhl
IGNvbW1hbmQtbGluZSBvdmVycmlkZSAodmlkZW89QGJwcCkgYW5kIHNvbWUgb2RkIGNhc2Ug
aGFzIGFsd2F5cyBiZWVuIA0KYnJva2VuLg0KDQpTbyBmYmRldiBlbXVsYXRpb24gbm93IG1v
c3RseSB1c2VzIHRoZSBjb2xvci1tb2RlIHZhbHVlIHRoYXQgd29ya3MgYXMgb24gDQp0aGUg
Y29tbWFuZCBsaW5lLiBUaGUgY3VycmVudCBzZW1hbnRpY3MgaXM6DQoNCiAgKiBzZWxlY3Qg
dGhlIHVzZXItZ2l2ZW4gY29sb3IgbW9kZSwgaWYgbm9uLXplcm8NCiAgKiBzZWxlY3QgdGhl
IGRyaXZlci1naXZlbiBjb2xvciBtb2RlLCBpZiBub24temVybw0KICAqIG90aGVyd2lzZSBz
ZWxlY3QgYSBjb2xvciBtb2RlIG9mIDMyIGJ5IGRlZmF1bHQgKHRoYXQncyBYUkdCODg4OCkN
Cg0KQW5kIGxhdGVyIGR1cmluZyBmYl9wcm9iZToNCg0KICAqIHRyeSB0aGUgc2VsZWN0ZWQg
Y29sb3IgbW9kZQ0KICAqIG90aGVyd2lzZSB0cnkgdG8gYXV0by1kZXRlY3QgaWYgdGhlIHNl
bGVjdGVkIGNvbG9yIG1vZGUgZG9lc24ndCB3b3JrLA0KICAqIG90aGVyd2lzZSB1c2UgWFJH
Qjg4ODggYXMgYSBsYXN0IHJlc29ydA0KDQpUaGF0IG5pY2VseSBzcGxpdHMgdGhlIGNvZGUg
aW50byBjb2xvci1tb2RlIHNlbGVjdGlvbiBhbmQgY29sb3ItZm9ybWF0IA0Kc2VsZWN0aW9u
LiBBbmQgYWxsIHRoZSBwdWJsaWMgaW50ZXJmYWNlcyAoY29tbWFuZCBsaW5lLCANCmRybV9m
YmRldl97fV9zZXR1cCgpLCBldGMpIHVzZSB0aGUgc2FtZSBzZW1hbnRpY3MsIHdoaWNoIGlz
IHRoZSBjb2xvciBtb2RlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC1EYW5pZWwN
Cj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+PiBbMV0gaHR0cHM6
Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjYuNC1yYzEvc291cmNlL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZmJfaGVscGVyLmMjTDE4MjcNCj4+DQo+Pj4NCj4+PiBZb3VycywNCj4+PiBM
aW51cyBXYWxsZWlqDQo+Pg0KPj4gLS0gDQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQo+PiBGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2Vy
bWFueQ0KPj4gR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQs
IEJvdWRpZW4gTW9lcm1hbg0KPj4gSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo+IA0KPiAN
Cj4gDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5z
dHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBB
bmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4
MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------b04MPKQA6uBYGOEr4gkCZQJ0--

--------------hzf01N0HP6raeZsZZN4bedi1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRh8GwFAwAAAAAACgkQlh/E3EQov+Bo
3RAAs6grFayZF3HR3Y2NTkx5S/ytmD9eyGJBWSnP0fJdYTFdhdpVtPG/QsFWzuq51K1eTGwAHCim
iti819fKQRfO4OfJplbghmytBSHaHE2+HZVLDr8pflkZA0IdL17EsvHyc2jNAkhaCFIe7XkkhkA0
Dckebwc5dR6YDdKOUrSbPiTTV/RM5HXuMIkAypq5HcjXmmrY560vjsdlcnSmbtaHlGmg51TUWCuw
AQIy8nMWZU3XGWOBgsY8FIfdUKL2LKmNRkIOMnDm6m8r+QmQ6zl99SdlVSaXUH1GHxdRalclK1Np
VzrMf5yFPMQP3f5VGXwTWAnIcwqgF8xHzecqfpNDrBsmjH2XPYzj1uQV9rv++mGhomK+h+H/XgxZ
IZd2O6G/Iss6hN3Oqm58Gp+ZRaXXm7gy8RjWFaUErOjwjjrDbP2y+8G73mTtaDsZkQH/ivJjVQfD
QtmXPYzCqNxrJC7R4vsLaJymy2BV8erxtJQvXEQ7i9cujifqTbue5mTqo6n/PBBpqlkcRFrjDKtm
470ae7JOiUpoCbxGkGrk/RDE6BqUMTpcFXhN4mSrK5KVQVv7pUtnuxnYi0cQblufp7ca78/B+t6N
zNCED98eT4iNFF1eX6Q7rx9QfCWi1hEVwrEbPO7q0GDJw4yTeVBxAPxnCpJhlTezIiBx5bQMZuEj
V8s=
=SzN4
-----END PGP SIGNATURE-----

--------------hzf01N0HP6raeZsZZN4bedi1--
