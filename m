Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 371ED509EED
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 13:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AFD10E87C;
	Thu, 21 Apr 2022 11:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A739F10E874
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 11:49:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4F25221115;
 Thu, 21 Apr 2022 11:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650541752; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XPk27mYlaLM1D6H07YWNWkvzi0RYlU1MFuCq1IyKojk=;
 b=nDE6imWBECTSMv5T1k3hSmjsR2C92vM1jHBZAFwhN0glCq9frCZrZJKNOh9cJGjSgmpUeH
 Ezu3SpsqMSHutMqtOrNYxUuNLeLQ7A1yTEQUML14iefntEHqhGU3IzGX9rv7LJ+jKF3zIu
 rRPBN3EbEBEh1StFO7f0o+MVfQANGOY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650541752;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XPk27mYlaLM1D6H07YWNWkvzi0RYlU1MFuCq1IyKojk=;
 b=fmiBoNjMaV51adG/TbMX66gkxTqflRjtFXZ227VJIc27X4A0aYICHOe0jTInhsiWd7ymG/
 MaO/0LEVzwyuMSBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31B7113446;
 Thu, 21 Apr 2022 11:49:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ys0tC7hEYWKBBQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Apr 2022 11:49:12 +0000
Message-ID: <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
Date: Thu, 21 Apr 2022 13:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220409042321.3184493-1-james.hilliard1@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------J0TB4WVVq4mxOwTDrN9gecCE"
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------J0TB4WVVq4mxOwTDrN9gecCE
Content-Type: multipart/mixed; boundary="------------b1TqGooMVuLAoC7Oxk5lxcCA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: James Hilliard <james.hilliard1@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org
Message-ID: <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
In-Reply-To: <20220409042321.3184493-1-james.hilliard1@gmail.com>

--------------b1TqGooMVuLAoC7Oxk5lxcCA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDQuMjIgdW0gMDY6MjMgc2NocmllYiBKYW1lcyBIaWxsaWFyZDoNCj4g
U2VsZWN0IHRoZSBlZmkgZnJhbWVidWZmZXIgaWYgZWZpIGlzIGVuYWJsZWQuDQo+IA0KPiBU
aGlzIGFwcGVhcnMgdG8gYmUgbmVlZGVkIGZvciB2aWRlbyBvdXRwdXQgdG8gZnVuY3Rpb24g
Y29ycmVjdGx5Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVz
LmhpbGxpYXJkMUBnbWFpbC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIHYyIC0+IHYzOg0KPiAg
ICAtIHNlbGVjdCBFRklfRkIgaW5zdGVhZCBvZiBkZXBlbmRpbmcgb24gaXQNCj4gQ2hhbmdl
cyB2MSAtPiB2MjoNCj4gICAgLSB1c2UgZGVwZW5kcyBpbnN0ZWFkIG9mIHNlbGVjdA0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZ21hNTAwL0tjb25maWcgfCAyICsrDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9nbWE1MDAvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9nbWE1MDAvS2Nv
bmZpZw0KPiBpbmRleCAwY2ZmMjAyNjVmOTcuLmE0MjJmYTg0ZDUzYiAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9nbWE1MDAvS2NvbmZpZw0KPiBAQCAtMiwxMSArMiwxMyBAQA0KPiAgIGNvbmZpZyBE
Uk1fR01BNTAwDQo+ICAgCXRyaXN0YXRlICJJbnRlbCBHTUE1MDAvNjAwLzM2MDAvMzY1MCBL
TVMgRnJhbWVidWZmZXIiDQo+ICAgCWRlcGVuZHMgb24gRFJNICYmIFBDSSAmJiBYODYgJiYg
TU1VDQo+ICsJZGVwZW5kcyBvbiBGQg0KDQpXaHkgZG8gd2UgbmVlZCBGQiBoZXJlPyBGcmFt
ZWJ1ZmZlciBzdXBwb3J0IHNob3VsZCBiZSBoaWRkZW4gYnkgRFJNJ3MgDQpmYmRldiBoZWxw
ZXJzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgCXNlbGVjdCBEUk1fS01TX0hF
TFBFUg0KPiAgIAkjIEdNQTUwMCBkZXBlbmRzIG9uIEFDUElfVklERU8gd2hlbiBBQ1BJIGlz
IGVuYWJsZWQsIGp1c3QgbGlrZSBpOTE1DQo+ICAgCXNlbGVjdCBBQ1BJX1ZJREVPIGlmIEFD
UEkNCj4gICAJc2VsZWN0IEJBQ0tMSUdIVF9DTEFTU19ERVZJQ0UgaWYgQUNQSQ0KPiAgIAlz
ZWxlY3QgSU5QVVQgaWYgQUNQSQ0KPiArCXNlbGVjdCBGQl9FRkkgaWYgRUZJDQo+ICAgCWhl
bHANCj4gICAJICBTYXkgeWVzIGZvciBhbiBleHBlcmltZW50YWwgMkQgS01TIGZyYW1lYnVm
ZmVyIGRyaXZlciBmb3IgdGhlDQo+ICAgCSAgSW50ZWwgR01BNTAwIChQb3Vsc2JvKSwgSW50
ZWwgR01BNjAwIChNb29yZXN0b3duL09hayBUcmFpbCkgYW5kDQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------b1TqGooMVuLAoC7Oxk5lxcCA--

--------------J0TB4WVVq4mxOwTDrN9gecCE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJhRLcFAwAAAAAACgkQlh/E3EQov+DF
fQ/+IzoUmTSovzQEGTVRdwijGGofLRmkOQIRSJc3lrleIoZWywf49jtXptI/Mvmidflsz3fLCWpx
NGxC8J0hAS+AUWT/QSR8FlXGvKpPPTs7FyLErYrrkFvWr/xAbuBeVy359oYA0RGHsS3Ux8tCQb3y
FI/p6/EAu+eZgH7Q600nAQdg/TUWCxVrJGfaL2raq2IQkhGwSVx/9Iw4fIR1TmuPdvbItkRuhyrx
Vt6FKJrK2lQnrzDMlsj3wcelogFJB670dsXv2yfz2RJOS26xzt9R+naq/BE8SnOKDhUAu9Gu4Mcl
mgY5VkYEyAtLhzq9VZLgG0QB83VAM1hZxY2nWJ7NAzslgnGFNRZPQUDYa+wg0149u/FKmwORnSqz
CNjuFJCiPlknBImdFlXyPh6hFS9iTY6r3t1gl7nx8Zrw7bMFojqHIeH9SyOhReOBncSjEgSHQzNz
YbzRZEy8L+C+/LNej1bxeDOvv+X6GVNKJcEwBnqqROlZ705fDy4SoKS8NLluaaK6r7GAIPaIChVs
18imnFROcXdtrqNwdd/QQl61H5wEy7Ko5D+oq/Y6T9xKdV0yWN/UUBPljISBmFe7c1lOUusJzd/H
Jwn6gCv71WnEN7F1322Y0sSxdZQ/IyzvX/ch5cN2GN0PFrN5TLvJeZdaDTkFjhxZeTxuhF58JQox
WyU=
=gf1/
-----END PGP SIGNATURE-----

--------------J0TB4WVVq4mxOwTDrN9gecCE--
