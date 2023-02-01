Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51030686466
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 11:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8234E10E18A;
	Wed,  1 Feb 2023 10:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48AC10E18A
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Feb 2023 10:36:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7C65E201D5;
 Wed,  1 Feb 2023 10:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675247809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ljtef1Y/6SMYsEG0OsQIMOeOD6o2lWkG9B6yM0NsBps=;
 b=ZJe0M0Y6xAFlS6UYam2ufmXhGi4DniRay+WFc/XNH5Wz5Z/3ebApAt7LDqvaEdOh1Tta4J
 uoO5pRu5AMvZbGHDOIT0JNRK75Hsmq9c8DAuj5mrRrmlmKWzwD4eT+r5HeNggRzhgby8U9
 HkutciWtbZporVBMP6ex0fAv2j7zwZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675247809;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ljtef1Y/6SMYsEG0OsQIMOeOD6o2lWkG9B6yM0NsBps=;
 b=5RrJ+5bjnk0q1QQ8HsXlRLI/BT9iM7BZZE0aNq6NdPDd6xvez3zrbNbydAvH4s7b2bZN1Z
 y0UB/shTfICPaSCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 43EFA13A10;
 Wed,  1 Feb 2023 10:36:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Pi1zD8FA2mNZBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Feb 2023 10:36:49 +0000
Message-ID: <e02071b9-fc64-8fa0-6c34-5a48b536335a@suse.de>
Date: Wed, 1 Feb 2023 11:36:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] [v2] accel: fix CONFIG_DRM dependencies
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Arnd Bergmann <arnd@kernel.org>
References: <20230127221504.2522909-1-arnd@kernel.org>
 <CAFCwf10RRFUqYEATg7p-LmKSEkFtAhneufJTdezFA7i3HJaDDw@mail.gmail.com>
 <6b48eef6-2f9c-9673-fe3d-009d29dea641@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <6b48eef6-2f9c-9673-fe3d-009d29dea641@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------f0PDsW1fTJB20lIQpA9gOwlG"
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
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------f0PDsW1fTJB20lIQpA9gOwlG
Content-Type: multipart/mixed; boundary="------------vnkKgKrG8IARMwD58cwrZMcn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Arnd Bergmann <arnd@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Airlie <airlied@redhat.com>
Message-ID: <e02071b9-fc64-8fa0-6c34-5a48b536335a@suse.de>
Subject: Re: [PATCH] [v2] accel: fix CONFIG_DRM dependencies
References: <20230127221504.2522909-1-arnd@kernel.org>
 <CAFCwf10RRFUqYEATg7p-LmKSEkFtAhneufJTdezFA7i3HJaDDw@mail.gmail.com>
 <6b48eef6-2f9c-9673-fe3d-009d29dea641@linux.intel.com>
In-Reply-To: <6b48eef6-2f9c-9673-fe3d-009d29dea641@linux.intel.com>

--------------vnkKgKrG8IARMwD58cwrZMcn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMxLjAxLjIzIHVtIDEwOjIwIHNjaHJpZWIgSmFjZWsgTGF3cnlub3dpY3o6DQo+
IE9uIDMxLjAxLjIwMjMgMDk6NTMsIE9kZWQgR2FiYmF5IHdyb3RlOg0KPj4gT24gU2F0LCBK
YW4gMjgsIDIwMjMgYXQgMTI6MTUgQU0gQXJuZCBCZXJnbWFubiA8YXJuZEBrZXJuZWwub3Jn
PiB3cm90ZToNCj4+Pg0KPj4+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
DQo+Pj4NCj4+PiBBdCB0aGUgbW9tZW50LCBhY2NlbCBkcml2ZXJzIGNhbiBiZSBidWlsdC1p
biBldmVuIHdpdGggQ09ORklHX0RSTT1tLA0KPj4+IGJ1dCB0aGlzIGNhdXNlcyBhIGxpbmsg
ZmFpbHVyZToNCj4+Pg0KPj4+IHg4Nl82NC1saW51eC1sZDogZHJpdmVycy9hY2NlbC9pdnB1
L2l2cHVfZHJ2Lm86IGluIGZ1bmN0aW9uIGBpdnB1X2Rldl9pbml0JzoNCj4+PiBpdnB1X2Ry
di5jOigudGV4dCsweDE1MzUpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkcm1tX2ttYWxs
b2MnDQo+Pj4geDg2XzY0LWxpbnV4LWxkOiBpdnB1X2Rydi5jOigudGV4dCsweDE1NjIpOiB1
bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkcm1tX2ttYWxsb2MnDQo+Pj4geDg2XzY0LWxpbnV4
LWxkOiBkcml2ZXJzL2FjY2VsL2l2cHUvaXZwdV9kcnYubzogaW4gZnVuY3Rpb24gYGl2cHVf
cmVtb3ZlJzoNCj4+PiBpdnB1X2Rydi5jOigudGV4dCsweDFmYWEpOiB1bmRlZmluZWQgcmVm
ZXJlbmNlIHRvIGBkcm1fZGV2X3VucmVnaXN0ZXInDQo+Pj4geDg2XzY0LWxpbnV4LWxkOiBk
cml2ZXJzL2FjY2VsL2l2cHUvaXZwdV9kcnYubzogaW4gZnVuY3Rpb24gYGl2cHVfcHJvYmUn
Og0KPj4+IGl2cHVfZHJ2LmM6KC50ZXh0KzB4MWZlZik6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYF9fZGV2bV9kcm1fZGV2X2FsbG9jJw0KPj4+DQo+Pj4gVGhlIHByb2JsZW0gaXMgdGhh
dCBEUk1fQUNDRUwgaXMgYSAnYm9vbCcgc3ltYm9sIHN5bWJvbCwgc28gZHJpdmVyIHRoYXQN
Cj4+PiBvbmx5IGRlcGVuZCBvbiBEUk1fQUNDRUwgYnV0IG5vdCBhbHNvIG9uIERSTSBkbyBu
b3Qgc2VlIHRoZSByZXN0cmljdGlvbg0KPj4+IHRvID1tIGNvbmZpZ3MuDQo+Pj4NCj4+PiBU
byBlbnN1cmUgdGhhdCBlYWNoIGFjY2VsIGRyaXZlciBoYXMgYW4gaW1wbGllZCBkZXBlbmRl
bmN5IG9uIENPTkZJR19EUk0sDQo+Pj4gZW5jbG9zZSB0aGUgZW50aXJlIEtjb25maWcgZmls
ZSBpbiBhbiBpZi9lbmRpZiBjaGVjay4NCj4+Pg0KPj4+IEZpeGVzOiA4YmY0ODg5NzYyYTgg
KCJkcml2ZXJzL2FjY2VsOiBkZWZpbmUga2NvbmZpZyBhbmQgcmVnaXN0ZXIgYSBuZXcgbWFq
b3IiKQ0KPj4+IFNpZ25lZC1vZmYtYnk6IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+
DQo+Pj4gLS0tDQo+Pj4gdjI6IHJlYXJyYWdlIHRoZSBEUk0gZGVwZW5kZW5jeSByYXRoZXIg
dGhhbiByZXF1aXJpbmcgRFJNIHRvIGJlIGJ1aWx0LWluDQo+Pj4gLS0tDQo+Pj4gICBkcml2
ZXJzL2FjY2VsL0tjb25maWcgfCA1ICsrKystDQo+Pj4gICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9hY2NlbC9LY29uZmlnIGIvZHJpdmVycy9hY2NlbC9LY29uZmlnDQo+Pj4gaW5kZXgg
ODM0ODYzOTAyZTE2Li5jNDM3MjA2YWEzZjEgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9h
Y2NlbC9LY29uZmlnDQo+Pj4gKysrIGIvZHJpdmVycy9hY2NlbC9LY29uZmlnDQo+Pj4gQEAg
LTYsOSArNiwxMCBAQA0KPj4+ICAgIyBhcywgYnV0IG5vdCBsaW1pdGVkIHRvLCBNYWNoaW5l
LUxlYXJuaW5nIGFuZCBEZWVwLUxlYXJuaW5nIGFjY2VsZXJhdGlvbg0KPj4+ICAgIyBkZXZp
Y2VzDQo+Pj4gICAjDQo+Pj4gK2lmIERSTQ0KPj4+ICsNCj4+PiAgIG1lbnVjb25maWcgRFJN
X0FDQ0VMDQo+Pj4gICAgICAgICAgYm9vbCAiQ29tcHV0ZSBBY2NlbGVyYXRpb24gRnJhbWV3
b3JrIg0KPj4+IC0gICAgICAgZGVwZW5kcyBvbiBEUk0NCj4+PiAgICAgICAgICBoZWxwDQo+
Pj4gICAgICAgICAgICBGcmFtZXdvcmsgZm9yIGRldmljZSBkcml2ZXJzIG9mIGNvbXB1dGUg
YWNjZWxlcmF0aW9uIGRldmljZXMsIHN1Y2gNCj4+PiAgICAgICAgICAgIGFzLCBidXQgbm90
IGxpbWl0ZWQgdG8sIE1hY2hpbmUtTGVhcm5pbmcgYW5kIERlZXAtTGVhcm5pbmcNCj4+PiBA
QCAtMjUsMyArMjYsNSBAQCBtZW51Y29uZmlnIERSTV9BQ0NFTA0KPj4+DQo+Pj4gICBzb3Vy
Y2UgImRyaXZlcnMvYWNjZWwvaGFiYW5hbGFicy9LY29uZmlnIg0KPj4+ICAgc291cmNlICJk
cml2ZXJzL2FjY2VsL2l2cHUvS2NvbmZpZyINCj4+PiArDQo+Pj4gK2VuZGlmDQo+Pj4gLS0N
Cj4+PiAyLjM5LjANCj4+Pg0KPj4gVGhpcyBwYXRjaCBpczoNCj4+IFJldmlld2VkLWJ5OiBP
ZGVkIEdhYmJheSA8b2dhYmJheUBrZXJuZWwub3JnPg0KPiANCj4gQXBwbGllZCB0byBkcm0t
bWlzYy1uZXh0Lg0KDQpJIGhhdmUgY2hlcnJ5LXBpY2tlZCB0aGUgcGF0Y2ggaW50byBkcm0t
bWlzYy1uZXh0LWZpeGVzLg0KDQo+IFRoYW5rcy4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------vnkKgKrG8IARMwD58cwrZMcn--

--------------f0PDsW1fTJB20lIQpA9gOwlG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPaQMAFAwAAAAAACgkQlh/E3EQov+AB
uRAAlOmk3Lpj//JBvE5LXk6sCKHhvlixwsD7b3L1mcoVfWA7gZx2vtUd4ReJNRCpJmqI8qXADYyc
DBM77gBWlI31eXSlVe7vo4uJAyJnXLFv+5vchBOq/4KjcsBoJH5p3rfl6/yV/JVrBpIeacIFovTu
SZ7AOkq0XtK0d1B9Im5UEYhIiHhHhFrbxitQIym6T9QOzWbn3sFopLJHtFl3WVvANzhZ4JdynnA/
OWR8uiPysDI6jy81tshJj4ir+FKXPO0ElaIUQLRJCi6E2/JLBMN8zdTnOR9RhOfhVJWh/aJyBD+l
1cTeJ0+ClCr5b9BaxTn1b+A+dkI14fyHZ8mP+ruoak2fMfzGq8pZAjveCQ5LvkUXvunGoeBsmh5v
vqWdRrakE5xRf3FRekTv3kwQBfT3dJ0OTs/aOmfh0TI3+pDxI2s3cfhARi2/t83TCudfvuJT8y2R
jHnEEhOQo66AHN8lqsaYMk0jLNWsyQEDe+FlknzZP5IQ0q2kry8viD8WFiGqq7PqLLkSWfqanm5/
H5pPpKFXOBuw6maPAouIrXP6J1p7felJaatbNqC11EzFHTLfB5bUC+74QVCxwxKL74iqvrZU8eHy
axhe33DZRORDL8vwgEAZc2roi4JDWNKzoWTb7wzAZEU78puHLqxX+gu5f7ZoCZx8hWHbqBZn34BZ
hSg=
=TePA
-----END PGP SIGNATURE-----

--------------f0PDsW1fTJB20lIQpA9gOwlG--
