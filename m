Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7307919DF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 16:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63D410E371;
	Mon,  4 Sep 2023 14:43:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 939C910E371
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 14:43:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4397F21847;
 Mon,  4 Sep 2023 14:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693838589; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y5OVAsU7uruz8bIFCL118Js1nsBUYE3ZoIqznM+feU4=;
 b=IUSRn6EdhBiCVqMeuy6aw63ygGXCD4FaxnStdUQsx9TzWQW8H+J0ySmLC5op9rKj6tE3Z3
 5YjzWoolIFfWjftc9hmANLhtAROUR5bmXcmOPLtADqmqS46z5egjYn6Fm4YuOf/zPPzNVl
 ZEFE/D6aTTf7PsAeiC0oBxZLwebQnsM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693838589;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y5OVAsU7uruz8bIFCL118Js1nsBUYE3ZoIqznM+feU4=;
 b=tz6okrVpHd8Rda0obo/4NMWpyCX0YRy8o4Lya+E4x6PrpUZgBz1fbiRX4FmimNQ4Dz0vm1
 fMdKmkHj5dm1fqBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0F3EF13425;
 Mon,  4 Sep 2023 14:43:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6aaLAv3s9WQ6NgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Sep 2023 14:43:09 +0000
Message-ID: <37906737-5ca3-7f46-af30-85a117875eea@suse.de>
Date: Mon, 4 Sep 2023 16:43:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/8] fbdev/udlfb: Use fb_ops helpers for deferred I/O
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-3-tzimmermann@suse.de>
 <874jka6qd7.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <874jka6qd7.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0lQloG2jsRIAkC4DAHK30ets"
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bernie Thompson <bernie@plugable.com>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0lQloG2jsRIAkC4DAHK30ets
Content-Type: multipart/mixed; boundary="------------0pWCwCwT059Xx0JQQ0cRKtzK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bernie Thompson <bernie@plugable.com>, linux-input@vger.kernel.org
Message-ID: <37906737-5ca3-7f46-af30-85a117875eea@suse.de>
Subject: Re: [PATCH 2/8] fbdev/udlfb: Use fb_ops helpers for deferred I/O
References: <20230828132131.29295-1-tzimmermann@suse.de>
 <20230828132131.29295-3-tzimmermann@suse.de>
 <874jka6qd7.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <874jka6qd7.fsf@minerva.mail-host-address-is-not-set>

--------------0pWCwCwT059Xx0JQQ0cRKtzK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA0LjA5LjIzIHVtIDE1OjA1IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JpdGVz
Og0KPiANCj4+IEdlbmVyYXRlIGNhbGxiYWNrIGZ1bmN0aW9ucyBmb3Igc3RydWN0IGZiX29w
cyB3aXRoIHRoZSBmYmRldiBtYWNybw0KPj4gRkJfR0VOX0RFRkFVTFRfREVGRVJSRURfU1lT
TUVNX09QUygpLiBJbml0aWFsaXplIHN0cnVjdCBmYl9vcHMgdG8NCj4+IHRoZSBnZW5lcmF0
ZWQgZnVuY3Rpb25zIHdpdGggZmJkZXYgaW5pdGlhbGl6ZXIgbWFjcm9zLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
Pj4gQ2M6IEJlcm5pZSBUaG9tcHNvbiA8YmVybmllQHBsdWdhYmxlLmNvbT4NCj4+IC0tLQ0K
PiANCj4gQWNrZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRo
YXQuY29tPg0KPiANCj4gWy4uLl0NCj4gDQo+PiArc3RhdGljIHZvaWQgZGxmYl9vcHNfZGFt
YWdlX3JhbmdlKHN0cnVjdCBmYl9pbmZvICppbmZvLCBvZmZfdCBvZmYsIHNpemVfdCBsZW4p
DQo+PiArew0KPj4gKwlzdHJ1Y3QgZGxmYl9kYXRhICpkbGZiID0gaW5mby0+cGFyOw0KPj4g
KwlpbnQgc3RhcnQgPSBtYXgoKGludCkob2ZmIC8gaW5mby0+Zml4LmxpbmVfbGVuZ3RoKSwg
MCk7DQo+PiArCWludCBsaW5lcyA9IG1pbigodTMyKSgobGVuIC8gaW5mby0+Zml4LmxpbmVf
bGVuZ3RoKSArIDEpLCAodTMyKWluZm8tPnZhci55cmVzKTsNCj4+ICsNCj4+ICsJZGxmYl9o
YW5kbGVfZGFtYWdlKGRsZmIsIDAsIHN0YXJ0LCBpbmZvLT52YXIueHJlcywgbGluZXMpOw0K
Pj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBkbGZiX29wc19kYW1hZ2VfYXJlYShzdHJ1
Y3QgZmJfaW5mbyAqaW5mbywgdTMyIHgsIHUzMiB5LCB1MzIgd2lkdGgsIHUzMiBoZWlnaHQp
DQo+PiArew0KPj4gKwlzdHJ1Y3QgZGxmYl9kYXRhICpkbGZiID0gaW5mby0+cGFyOw0KPj4g
Kw0KPj4gKwlkbGZiX29mZmxvYWRfZGFtYWdlKGRsZmIsIHgsIHksIHdpZHRoLCBoZWlnaHQp
Ow0KPj4gK30NCj4+ICsNCj4gDQo+IFRoZXNlIHR3byBhcmUgdmVyeSBzaW1pbGFyIHRvIHRo
ZSBoZWxwZXJzIHlvdSBhZGRlZCBmb3IgdGhlIHNtc2N1ZnggZHJpdmVyDQo+IGluIHBhdGNo
ICMxLiBJIGd1ZXNzIHRoZXJlJ3Mgcm9vbSBmb3IgZnVydGhlciBjb25zb2xpZGF0aW9uIGFz
IGZvbGxvdy11cCA/DQoNCk1heWJlLiBJIGhhZCBwYXRjaGVzIHRoYXQgdGFrZSB0aGUgcmVj
dGFuZ2xlIGNvbXB1dGF0aW9uIGZyb20gWzFdIGFuZCANCnR1cm4gaXQgaW50byBhIGhlbHBl
ciBmb3IgdGhlc2UgVVNCIGRyaXZlcnMuIEJ1dCBpdCdzIGFuIHVucmVsYXRlZCANCmNoYW5n
ZSwgc28gSSBkcm9wcGVkIHRoZW0gZnJvbSB0aGlzIHBhdGNoc2V0Lg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92
Ni41LjEvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMjTDY0MQ0KDQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3Nl
IDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcg
TXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFH
IE51ZXJuYmVyZykNCg==

--------------0pWCwCwT059Xx0JQQ0cRKtzK--

--------------0lQloG2jsRIAkC4DAHK30ets
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT17PwFAwAAAAAACgkQlh/E3EQov+At
8BAAuAfJ0cyQGHgl1rbqMYWgpYDJ8pifdogOIQE3MTskXoniHWEJrrAVDRTS/K/cg56Yn1K/SPAb
3XRGRKS5295scOXAhA39wDXFHqRRuMUktWVqP4A3CgW2+vZ6HyTbywAnbBBaKl3nNAfyAAKrmtJW
yLi90gNCC9bqIsOekDTa/F5FGImN3N9dytOKqaqT8tuMHEgTbbtPKtIgstQRY+znxtpW0OtJHP2J
vpGitS8tSBZpz5WA1EynXFvT76EWiYxkpeqOnpfUHRSOnr8GWEERH/EldbIMO5qmfphkRjsPMM+s
z9jMJ/26FQeZTvgF+Oi0w+SVVxQnEKWm4FUxWuM+jYqVeX1pT5Su7hY7ut8C68loDlPpSxC1B1I0
/ckzZW+NVPlGpwoQ8LAQmO8w9+soG9Te7bg+YoTB4UJTutuBQGrs/d0IYnpxgL0/0SdgarLB4YCq
UBr+sZcXm6CSFBH/oRlUnATKELdQzNUeE0NLHWZ2993Ok0X+oGyCY2wDy7LR5Oxpm9jwCwGeSIbO
R5mKjrKx+8jU/XxZeudIEid1TKsDo6qPCqCRgdlvR22vcT1rM1Nm1H+1UYAg7qgHDGtjpYXVrdP9
i/K/ciOauKQv8NSix/H4CDdaH0hxLuS9p0Q+fNe61c/yDjOaRU2j4rDjWsfoMWGhR40YyZewpKGs
nLg=
=kXbE
-----END PGP SIGNATURE-----

--------------0lQloG2jsRIAkC4DAHK30ets--
