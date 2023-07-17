Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A3775613D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 13:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E5B10E230;
	Mon, 17 Jul 2023 11:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F6110E230
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 11:08:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 497932189E;
 Mon, 17 Jul 2023 11:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689592100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jqEfEX4gszBj0JuG9kvDlZ1DtXBV7YZ85SF9eGu1hPw=;
 b=G744y9AUYcDel5VSACVGjdqeUrriAG/QR0t8QRnJA2rQZKz5PEzcHPUaM2xmHecDH2o9sS
 rG+Ff2RF9gSrXAH+ODcYPRRdG2ESGYPyFJd7g2XnkbVL26xlyclDlpfXWCBIH+XmvB0gjL
 PnWaJSus1c5ck9uGXfWKP5yxW0Z3UAY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689592100;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jqEfEX4gszBj0JuG9kvDlZ1DtXBV7YZ85SF9eGu1hPw=;
 b=EXi+MgGw2bY9Fc2vjvzRmRy523+qdmI97JHlCxyD4Uk8MU7fG+M7ZMz5Qml3b5KQfOavDu
 LAB8o5myP03SaWCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2EBBD13276;
 Mon, 17 Jul 2023 11:08:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4OxCCiQhtWTffwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Jul 2023 11:08:20 +0000
Message-ID: <c4cad3e8-56f0-bb08-c9e5-3d7cb94bd19c@suse.de>
Date: Mon, 17 Jul 2023 13:08:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230713163213.1028952-1-javierm@redhat.com>
 <bbbb18e0-5de1-5155-c6b2-52a2b1d75898@suse.de>
 <CAMuHMdVuLBTBymfEXDgHsDVavH6Ggq53fPep0T=dEWbztBWkjw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdVuLBTBymfEXDgHsDVavH6Ggq53fPep0T=dEWbztBWkjw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rkVxEugDGtXdiKxIGotc6uFk"
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rkVxEugDGtXdiKxIGotc6uFk
Content-Type: multipart/mixed; boundary="------------K0CSNl1DVZbDbbfDB3w1xeSH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <c4cad3e8-56f0-bb08-c9e5-3d7cb94bd19c@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
References: <20230713163213.1028952-1-javierm@redhat.com>
 <bbbb18e0-5de1-5155-c6b2-52a2b1d75898@suse.de>
 <CAMuHMdVuLBTBymfEXDgHsDVavH6Ggq53fPep0T=dEWbztBWkjw@mail.gmail.com>
In-Reply-To: <CAMuHMdVuLBTBymfEXDgHsDVavH6Ggq53fPep0T=dEWbztBWkjw@mail.gmail.com>

--------------K0CSNl1DVZbDbbfDB3w1xeSH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDcuMjMgdW0gMTE6MDQgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIE1vbiwgSnVsIDE3LCAyMDIzIGF0IDEwOjQ44oCv
QU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4g
QW0gMTMuMDcuMjMgdW0gMTg6MzIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXM6
DQo+Pj4gR2VlcnQgcmVwb3J0cyB0aGF0IHRoZSBmb2xsb3dpbmcgTlVMTCBwb2ludGVyIGRl
cmVmZXJlbmNlIGhhcHBlbnMgZm9yIGhpbQ0KPj4+IGFmdGVyIGNvbW1pdCA0OWQ3ZDU4MWNl
YWYgKCJkcm0vc3NkMTMweDogRG9uJ3QgYWxsb2NhdGUgYnVmZmVycyBvbiBlYWNoDQo+Pj4g
cGxhbmUgdXBkYXRlIik6DQo+Pj4NCj4+PiAgICAgICBbZHJtXSBJbml0aWFsaXplZCBzc2Qx
MzB4IDEuMC4wIDIwMjIwMTMxIGZvciAwLTAwM2Mgb24gbWlub3IgMA0KPj4+ICAgICAgIHNz
ZDEzMHgtaTJjIDAtMDAzYzogW2RybV0gc3VyZmFjZSB3aWR0aCgxMjgpLCBoZWlnaHQoMzIp
LCBicHAoMSkNCj4+PiAgICAgICBhbmQgZm9ybWF0KFIxICAgbGl0dGxlLWVuZGlhbiAoMHgy
MDIwMzE1MikpDQo+Pj4gICAgICAgVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgTlVMTCBwb2lu
dGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMA0KPj4+ICAgICAg
IE9vcHMgWyMxXQ0KPj4+ICAgICAgIENQVTogMCBQSUQ6IDEgQ29tbTogc3dhcHBlciBOb3Qg
dGFpbnRlZA0KPj4+ICAgICAgIDYuNS4wLXJjMS1vcmFuZ2VjcmFiLTAyMjE5LWcwYTUyOWEx
ZTRiZjQgIzU2NQ0KPj4+ICAgICAgIGVwYyA6IHNzZDEzMHhfdXBkYXRlX3JlY3QuaXNyYS4w
KzB4MTNjLzB4MzQwDQo+Pj4gICAgICAgIHJhIDogc3NkMTMweF91cGRhdGVfcmVjdC5pc3Jh
LjArMHgyYmMvMHgzNDANCj4+PiAgICAgICAuLi4NCj4+PiAgICAgICBzdGF0dXM6IDAwMDAw
MTIwIGJhZGFkZHI6IDAwMDAwMDAwIGNhdXNlOiAwMDAwMDAwZg0KPj4+ICAgICAgIFs8YzAz
MDNkOTA+XSBzc2QxMzB4X3VwZGF0ZV9yZWN0LmlzcmEuMCsweDEzYy8weDM0MA0KPj4+ICAg
ICAgIFs8YzAzMDQyMDA+XSBzc2QxMzB4X3ByaW1hcnlfcGxhbmVfaGVscGVyX2F0b21pY191
cGRhdGUrMHgyNmMvMHgyODQNCj4+PiAgICAgICBbPGMwMmY4ZDU0Pl0gZHJtX2F0b21pY19o
ZWxwZXJfY29tbWl0X3BsYW5lcysweGZjLzB4MjdjDQo+Pj4gICAgICAgWzxjMDJmOTMxND5d
IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsKzB4NWMvMHhiNA0KPj4+ICAgICAgIFs8
YzAyZjk0ZmM+XSBjb21taXRfdGFpbCsweDE5MC8weDFiOA0KPj4+ICAgICAgIFs8YzAyZjk5
ZmM+XSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXQrMHgxOTQvMHgxYzANCj4+PiAgICAgICBb
PGMwMmM1ZDAwPl0gZHJtX2F0b21pY19jb21taXQrMHhhNC8weGU0DQo+Pj4gICAgICAgWzxj
MDJjY2U0MD5dIGRybV9jbGllbnRfbW9kZXNldF9jb21taXRfYXRvbWljKzB4MjQ0LzB4Mjc4
DQo+Pj4gICAgICAgWzxjMDJjY2VmMD5dIGRybV9jbGllbnRfbW9kZXNldF9jb21taXRfbG9j
a2VkKzB4N2MvMHgxYmMNCj4+PiAgICAgICBbPGMwMmNkMDY0Pl0gZHJtX2NsaWVudF9tb2Rl
c2V0X2NvbW1pdCsweDM0LzB4NjQNCj4+PiAgICAgICBbPGMwMzAxYTc4Pl0gX19kcm1fZmJf
aGVscGVyX3Jlc3RvcmVfZmJkZXZfbW9kZV91bmxvY2tlZCsweGM0LzB4ZTgNCj4+PiAgICAg
ICBbPGMwMzAzNDI0Pl0gZHJtX2ZiX2hlbHBlcl9zZXRfcGFyKzB4MzgvMHg1OA0KPj4+ICAg
ICAgIFs8YzAyN2M0MTA+XSBmYmNvbl9pbml0KzB4Mjk0LzB4NTM0DQo+Pj4gICAgICAgLi4u
DQo+Pj4NCj4+PiBUaGUgcHJvYmxlbSBpcyB0aGF0IGZiY29uIGNhbGxzIGZiY29uX2luaXQo
KSB3aGljaCB0cmlnZ2VycyBhIERSTSBtb2Rlc2V0DQo+Pj4gYW5kIHRoaXMgbGVhZHMgdG8g
ZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3BsYW5lcygpIGF0dGVtcHRpbmcgdG8gY29tbWl0
DQo+Pj4gdGhlIGF0b21pYyBzdGF0ZSBmb3IgYWxsIHBsYW5lcywgZXZlbiB0aGUgb25lcyB3
aG9zZSBDUlRDIGlzIG5vdCBlbmFibGVkLg0KPj4+DQo+Pj4gU2luY2UgdGhlIHByaW1hcnkg
cGxhbmUgYnVmZmVyIGlzIGFsbG9jYXRlZCBpbiB0aGUgZW5jb2RlciAuYXRvbWljX2VuYWJs
ZQ0KPj4+IGNhbGxiYWNrLCB0aGlzIGhhcHBlbnMgYWZ0ZXIgdGhhdCBpbml0aWFsIG1vZGVz
ZXQgY29tbWl0IGFuZCBsZWFkcyB0byB0aGUNCj4+PiBtZW50aW9uZWQgTlVMTCBwb2ludGVy
IGRlcmVmZXJlbmNlLg0KPj4+DQo+Pj4gRml4IHRoaXMgYnkgbm90IHVzaW5nIHRoZSBkZWZh
dWx0IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsKCkgaGVscGVyLA0KPj4+IGJ1dCBp
bnN0ZWFkIHRoZSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9ycG0oKSBmdW5jdGlv
biB0aGF0IGRvZXNuJ3QNCj4+PiBhdHRlbXB0IHRvIGNvbW1pdCB0aGUgYXRvbWljIHN0YXRl
IGZvciBwbGFuZXMgcmVsYXRlZCB0byBpbmFjdGl2ZSBDUlRDcy4NCj4+Pg0KPj4+IFJlcG9y
dGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPj4+
IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRo
YXQuY29tPg0KPiANCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4
LmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMNCj4+PiBA
QCAtNzk1LDYgKzc5NSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZp
Z19mdW5jcyBzc2QxMzB4X21vZGVfY29uZmlnX2Z1bmNzID0gew0KPj4+ICAgICAgICAuYXRv
bWljX2NvbW1pdCA9IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCwNCj4+PiAgICB9Ow0KPj4+
DQo+Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2hlbHBlcl9mdW5j
cyBzc2QxMzB4X21vZGVfY29uZmlnX2hlbHBlcnMgPSB7DQo+Pj4gKyAgICAgLmF0b21pY19j
b21taXRfdGFpbCA9IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsX3JwbSwNCj4+PiAr
fTsNCj4+PiArDQo+Pg0KPj4gQWZ0ZXIgc29tZSBkaXNjdXNzaW9uIG9uIElSQywgSSdkIHN1
Z2dlc3QgdG8gYWxsb2NhdGUgdGhlIGJ1ZmZlcg0KPj4gc29tZXdoZXJlIHdpdGhpbiBwcm9i
ZS4gU28gaXQgd2lsbCBhbHdheXMgYmUgdGhlcmUgd2hlbiB0aGUgcGxhbmUgY29kZSBydW5z
Lg0KPj4NCj4+IEEgZnVsbCBmaXggd291bGQgYmUgdG8gYWxsb2NhdGUgdGhlIGJ1ZmZlciBt
ZW1vcnkgYXMgcGFydCBvZiB0aGUgcGxhbmUNCj4+IHN0YXRlIGFuZC9vciB0aGUgcGxhbmUn
cyBhdG9taWNfY2hlY2suIFRoYXQncyBhIGJpdCBtb3JlIGNvbXBsaWNhdGVkIGlmDQo+PiB5
b3Ugd2FudCB0byBzaGFyZWQgdGhlIGJ1ZmZlciBtZW1vcnkgYWNyb3NzIHBsYW5lIHVwZGF0
ZXMuDQo+IA0KPiBOb3RlIHRoYXQgYWN0dWFsbHkgdHdvIGJ1ZmZlcnMgYXJlIGludm9sdmVk
OiBkYXRhX2FycmF5IChtb25vY2hyb21lLA0KPiBuZWVkZWQgZm9yIGVhY2ggdXBkYXRlKSwg
YW5kIGJ1ZmZlciAoUjgsIG9ubHkgbmVlZGVkIHdoZW4gY29udmVydGluZw0KPiBmcm9tIFhS
MjQgdG8gUjEpLg0KPiANCj4gRm9yIHRoZSBmb3JtZXIsIEkgYWdyZWUsIGFzIGl0J3MgYWx3
YXlzIG5lZWRlZC4NCj4gRm9yIHRoZSBsYXR0ZXIsIEknbSBhZnJhaWQgaXQgd291bGQgc2V0
IGEgYmFkIGV4YW1wbGU6IHdoaWxlIGFsbG9jYXRpbmcNCj4gYSBwb3NzaWJseS11bnVzZWQg
YnVmZmVyIGRvZXNuJ3QgaHVydCBmb3Igc21hbGwgZGlzcGxheXMsIGl0IHdvdWxkDQo+IG1l
YW4gd2FzdGluZyAxIE1pQiBpbiBlLmcuIHRoZSByZXBhcGVyIGRyaXZlciAob25jZSBpdCBo
YXMgZ2FpbmVkDQo+IHN1cHBvcnQgZm9yIFIxIDteKS4NCg0KTGV0IG1lIGV4cGxhaW46IGEg
cmVhbCBEUk0taWRlb21hdGljIHNvbHV0aW9uIHdvdWxkIGFsbG9jYXRlIHRoZSANCnJlcXVp
cmVkIGJ1ZmZlcnMgYXQgdGhlIGNvcnJlY3Qgc2l6ZSBpbiB0aGUgcGxhbmUncyBhdG9taWMg
Y2hlY2suIFRoZSANCnBvaW50ZXIgd291bGQgYmUgc3RvcmVkIGluIHRoZSBwbGFuZSBzdGF0
ZSBhbmQgbGF0ZXIgYmUgZnJlZSdkIGFzIHBhcnQgDQpvZiByZWxlYXNpbmcgdGhhdCBwbGFu
ZV9zdGF0ZS4gQnV0IGFzIHRoaXMgaXMgdGVtcG9yYXJ5IG1lbW9yeSBmb3IgdGhlIA0KcGxh
bmUgdXBkYXRlLCBzbyBpdCBjYW4gYmUgc2hhcmVkIGFtb25nIHBsYW5lIHN0YXRlcy4gS2Vl
cGluZyB0cmFjayBvZiANCnRoZSByZWZlcmVuY2VzIHJlcXVpcmVzIGEgYml0IG9mIHdvcmsg
dGhvdWdoLg0KDQpSZXBhcGVyIGFwcGVhcnMgdG8gYWxsb2NhdGUgYnVmZmVyIG1lbW9yeSBv
biBlYWNoIHVwZGF0ZSwgc28gYW55dGhpbmcgaXMgDQphbiBpbXByb3ZlbWVudCB0aGVyZS4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tc2ENCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+
IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVy
bmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1j
RG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------K0CSNl1DVZbDbbfDB3w1xeSH--

--------------rkVxEugDGtXdiKxIGotc6uFk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmS1ISMFAwAAAAAACgkQlh/E3EQov+C9
bg//QZnipjEnE3ylInnr6YusT5rx0bJDB6Hgo08qCH5OB1vtMu5ZJXOhK19wVg7kgUVWR/qy8kZg
0I4g2EhlEmhCg+DspMA7taj+oz0D8Gz+YabIHYTYRw60/qwbytsD5h2MBavLehiv1B0dGP5iNJEx
gS76Nhldc38Tswab3TpZ0xIxAVQv10/jEl4xDMsGr8uczOuFzcsALnm3lkzOBh3GIX1nc07xzz8F
m6iVotZherIpiIvUGeXIlkWylQLlk9cBNZchZqEiv9bZOHVegRq50gLeemo1jAA2yEQZX6fHDSpm
se6nKwc1UHZtEEW/E8P+aRoM2NT0Xc28iBzEX+ov5k4TI0nswyzBcYWQn+Ay4tjGb5kHNdm85Gxj
FNZEtJ1IBO+865dxkooR0L0ZdtCbA4dpLlD8zRAJutPwGOwvEqBpjIKT00PuuKPX8G0sukIXiD3J
JPyktuZzcxEfZnMPy4IlHCRNeR//tY5WuRdbp/9u4YEdasiN56vSdqq7y/1tk5awppyuvFB8+8fQ
l++MVXLAmITGBdj96Sf6IP80mh6hfCYTYPiNYi2R3UibkfrKlJfq0Ls7nPJK6CqQckOZMO5cJbbi
IshF4Xq9yhQwyzLW8iPaYrZUrcO60mdDEjwPUBHNRHIGCx1FVv1Xk1yL8cAUIjVCAQdl0P6A+0kp
Klw=
=T8Y5
-----END PGP SIGNATURE-----

--------------rkVxEugDGtXdiKxIGotc6uFk--
