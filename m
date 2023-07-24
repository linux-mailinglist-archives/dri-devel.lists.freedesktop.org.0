Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E40975FF43
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 20:48:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474C610E112;
	Mon, 24 Jul 2023 18:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8E910E112
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 18:48:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0B69D227E6;
 Mon, 24 Jul 2023 18:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690224523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AZSrg7VMfIqv7s3Dpl2XVltSOrF/WG2WGs7bShHv2Kg=;
 b=c3Aac1tCRmUoNuSQmK/zudQ7LpxEwnLRhO4Wfxq5bMXe38pgyUvPXTz/0RohvwmC2m/ZrI
 h1rXJifsyeQwox03Hgm/tso4X9K4CF4wQ7XtsS8rQkGt+gSGM4FPFFmGg+29aadYRC9VdI
 VPRZ091e0hlqEdJFq748OhyF3bh8+7Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690224523;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AZSrg7VMfIqv7s3Dpl2XVltSOrF/WG2WGs7bShHv2Kg=;
 b=7tkqwT5o8ZE9QQ/RKAkMVlHzChpkVxH5MsttLYPah6BNCu2hCkqKlNB4n1XwnKAXflDOgh
 zUYnBEx0d7GLYDAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DEF1B13476;
 Mon, 24 Jul 2023 18:48:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cPNwNYrHvmR+YgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Jul 2023 18:48:42 +0000
Message-ID: <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
Date: Mon, 24 Jul 2023 20:48:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com, daniel@ffwll.ch
References: <20230717133037.25941-1-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230717133037.25941-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------f0Y0IBOMct4VCMP80YeZ34mb"
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
Cc: Roger Sewell <roger.sewell@cantab.net>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------f0Y0IBOMct4VCMP80YeZ34mb
Content-Type: multipart/mixed; boundary="------------AFwAgN79CmukYuIlYxcuwwrC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com, daniel@ffwll.ch
Cc: Roger Sewell <roger.sewell@cantab.net>, dri-devel@lists.freedesktop.org
Message-ID: <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
References: <20230717133037.25941-1-jfalempe@redhat.com>
In-Reply-To: <20230717133037.25941-1-jfalempe@redhat.com>

--------------AFwAgN79CmukYuIlYxcuwwrC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSm9jZWx5bg0KDQpBbSAxNy4wNy4yMyB1bSAxNToyOSBzY2hyaWViIEpvY2VseW4gRmFs
ZW1wZToNCj4gQSBHMjAwU0VfQSByZXYgMSB1c2VyIHJlcG9ydGVkIHRoYXQgcHJpb3IgdG8g
djYuMCwgaGUgd2FzIGFibGUgdG8gZ2V0IFhvcmcNCj4gd29ya2luZyBhdCAxNDQweDkwMEA2
MEh6LiBUaGlzIHNvbWVob3cgYnlwYXNzZWQgdGhlIGJhbmR3aWR0aCB0ZXN0IGluIHRoZQ0K
PiBkcml2ZXIuIEFmdGVyIHY2LjAsIGFuZCB0aGUgZHJpdmVyIHJlZmFjdG9yLCBpdCdzIG5v
IGxvbmdlciBwb3NzaWJsZS4NCg0KSSB0b29rIHRoYXQgYmFuZHdpZHRoIG51bWJlciBmcm9t
IHRoZSBvbGQgc291cmNlIGNvZGUgYXQNCg0KIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5j
b20vbGludXgvdjUuMTkvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
bW9kZS5jI0w3MjUNCg0KIEZyb20gdGhpcyBjb2RlLCBJIGRvbid0IHNlZSBob3cgaXQgc2tp
cHBlZCB0aGlzIHRlc3QuIE1heWJlIHRoZSANCnJlZmFjdG9yaW5nIGlzIGluY29ycmVjdC4N
Cg0KRG8geW91IGhhdmUgdGhlIG9wcG9ydHVuaXR5IHRvIGZ1cnRoZXIgZGVidWcgdGhpcyBp
c3N1ZSBvbiB0aGUgdXNlcnMgDQptYWNoaW5lPyAgSSdkIGJlIGludGVyZXN0ZWQgaW4gdGhl
IGV4YWN0IG1vZGVsIGFuZCB0aGUgdW5pcXVlX3Jldl9pZCANCih5b3Ugc2FpZCBBLCByZXYx
ID8pIGFuZCBpZiB0aGUgZWFybHktb3V0IGJyYW5jaGVzIGluIA0KbWdhX3ZnYV9jYWxjdWxh
dGVfbW9kZV9iYW5kd2lkdGgoKSBhcmUgYmVpbmcgdGFrZW4uIENhbiB5b3UgZmlndXJlIG91
dCANCmhvdyBleGFjdGx5IHRoZSBDUFUgbW92ZXMgdGhyb3VnaCBtZ2FfdmdhX21vZGVfdmFs
aWQoKS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiBTbyBpbmNyZWFzZSB0aGUgYmFu
ZHdpZHRoLCBhcyB0aGUgaGFyZHdhcmUgaXMgYWJsZSB0byBkbyBpdC4NCj4gDQo+IEluIG1n
YWcyMDBfY2FsY3VsYXRlX21vZGVfYmFuZHdpZHRoKCksIHRoZSBiYW5kd2lkdGggZm9yIDE0
NDB4OTAwQDYwIGlzDQo+IDMwMzE4MDE5LCB3aGlsZSAyNDQwMCAqIDEwMjQgPSAyNDk4NTYw
MCBhbmQgMzAxMDAgKiAxMDI0ID0gMzA4MjI0MDAuDQo+IFJhaXNpbmcgdGhlIGJhbmR3aWR0
aCBmcm9tIDI0NDAwIHRvIDMwMTAwIGlzIGVub3VnaCB0byBhbGxvdyB0aGlzIG1vZGUuDQo+
IA0KPiBSZXBvcnRlZC1ieTogUm9nZXIgU2V3ZWxsIDxyb2dlci5zZXdlbGxAY2FudGFiLm5l
dD4NCj4gVGVzdGVkLWJ5OiBSb2dlciBTZXdlbGwgPHJvZ2VyLnNld2VsbEBjYW50YWIubmV0
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5j
b20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMHNl
LmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdh
ZzIwMF9nMjAwc2UuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMHNl
LmMNCj4gaW5kZXggYmQ2ZTU3M2M5YTFhLi4zYjQ5ZTMwOTMxZTEgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZzIwMHNlLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9nMjAwc2UuYw0KPiBAQCAtNDM3LDcgKzQz
Nyw3IEBAIHN0YXRpYyBpbnQgbWdhZzIwMF9nMjAwc2VfcGlwZWxpbmVfaW5pdChzdHJ1Y3Qg
bWdhX2RldmljZSAqbWRldikNCj4gICAgKi8NCj4gICANCj4gICBzdGF0aWMgY29uc3Qgc3Ry
dWN0IG1nYWcyMDBfZGV2aWNlX2luZm8gbWdhZzIwMF9nMjAwc2VfYV8wMV9kZXZpY2VfaW5m
byA9DQo+IC0JTUdBRzIwMF9ERVZJQ0VfSU5GT19JTklUKDE2MDAsIDEyMDAsIDI0NDAwLCBm
YWxzZSwgMCwgMSwgdHJ1ZSk7DQo+ICsJTUdBRzIwMF9ERVZJQ0VfSU5GT19JTklUKDE2MDAs
IDEyMDAsIDMwMTAwLCBmYWxzZSwgMCwgMSwgdHJ1ZSk7DQo+ICAgDQo+ICAgc3RhdGljIGNv
bnN0IHN0cnVjdCBtZ2FnMjAwX2RldmljZV9pbmZvIG1nYWcyMDBfZzIwMHNlX2FfMDJfZGV2
aWNlX2luZm8gPQ0KPiAgIAlNR0FHMjAwX0RFVklDRV9JTkZPX0lOSVQoMTkyMCwgMTIwMCwg
MzAxMDAsIGZhbHNlLCAwLCAxLCB0cnVlKTsNCj4gDQo+IGJhc2UtY29tbWl0OiBjMjI2OGRh
YTY1ZmI0MTVjZmQ0NjMwMTZhZDU0YzIwYWZlZjhmNzVlDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcs
IEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxk
LCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------AFwAgN79CmukYuIlYxcuwwrC--

--------------f0Y0IBOMct4VCMP80YeZ34mb
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmS+x4oFAwAAAAAACgkQlh/E3EQov+CS
KRAAsDSMUp0SLs8aatgxjSPceSnDdPYvA7AvEeQQdgWHBl6UtLuCwK71/m+bBbWuZso8WmcVFzas
S1whqBp7LkYY+Pw3ycS9zVzwvS9coX5nkR5/BCeBiyoNSBkPajNejlu3u7g3wwuI7iCsplutdpbt
SYwjzbT0uqPY4LSFEKqswsvn4aVubIljg2lH/SeGqdcgkyYPC8aoQ+Pb7EOaXbb+LmKghOsbOPU4
9/HRHG6NoqzC5ih4uEufAUZpl2ZuabNL4oKeYPa92w58XsH1sT0/hAlJb6MQiEcbPbzkm2b3UH+5
//3jB3tp86v+0Y4u/G+VtXKlBmy090cAX+actwUo7XvGmIaP+i2NAgUZFEzqPnq9pt11E8dAmG2Z
pbckWvjp1tI3V1YWE0gEvuZI1cdlK7Pw7HZmj8O3Kzthq+u/zNE4P5mk+o3tlwz5rpMKKAL7Harr
ES4Whsy/DbA5q8czoXNUx/R6ylkxuxceVRBJQhRM+oZJBGc0n+tJU0J4oBeXN/1eh9Lxm754qtag
/VO8+06tFayLddYUT4c0G23hMzAt2v2/PAowRk1obpcVj+4dUgXjaUQu9hhddKYVcyoYM9MVkY1H
KAh0CliWkOF5gh/x2F9VUk712j8jj/DBW/dS9tjuX9nRyMElWuWwilCsO+fToHKe4zM3Od4JPURr
L88=
=NTcx
-----END PGP SIGNATURE-----

--------------f0Y0IBOMct4VCMP80YeZ34mb--
