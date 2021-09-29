Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1816641C06D
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 10:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9EE26EA0B;
	Wed, 29 Sep 2021 08:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6ED86EA08
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 08:14:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C6A5E1FFCE;
 Wed, 29 Sep 2021 08:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632903244; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QUXHeKGLLCQvV+djGJ6fIeizZaKNDi61Zv1KFJVrKWg=;
 b=Js6bl4C+C/obXQ53mMVdXW0gGWUCq0cWozJSelYmcOpMjhVmT+ar/wOAQEirVxaLcIExjE
 Pss3iKK57HRkpcsyENOYheAl0XN160DXJGMK///Z80mh4TnFNTwxSsw7kskjNc89lL8UCQ
 uRJhr0UT7aXyrPAjU02XtZAocojQJ24=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632903244;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QUXHeKGLLCQvV+djGJ6fIeizZaKNDi61Zv1KFJVrKWg=;
 b=eBxF+ZSdAVpJKiIFWYFhBqY5GrVXpX+U6LGFRZe4Y8If2mWoneYjaU4nu9g2Z7OTvtrE0I
 EwH8fGshT0uBD4CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7D35213A81;
 Wed, 29 Sep 2021 08:14:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xbZxHUwgVGHqDAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Sep 2021 08:14:04 +0000
Message-ID: <0bfebc7c-b723-7f87-453d-123d77a49cca@suse.de>
Date: Wed, 29 Sep 2021 10:14:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] [SUBMITTED 20210721] fbdev: simplefb: fix Kconfig
 dependencies
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20210928145243.1098064-1-arnd@kernel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20210928145243.1098064-1-arnd@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jIOv0DVcltLz15eqCTrGX94A"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jIOv0DVcltLz15eqCTrGX94A
Content-Type: multipart/mixed; boundary="------------L8E2vaOnit16sZhAVdaZ4yvl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arnd Bergmann <arnd@kernel.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Maxime Ripard <maxime@cerno.tech>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <0bfebc7c-b723-7f87-453d-123d77a49cca@suse.de>
Subject: Re: [PATCH] [SUBMITTED 20210721] fbdev: simplefb: fix Kconfig
 dependencies
References: <20210928145243.1098064-1-arnd@kernel.org>
In-Reply-To: <20210928145243.1098064-1-arnd@kernel.org>

--------------L8E2vaOnit16sZhAVdaZ4yvl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDkuMjEgdW0gMTY6NTIgc2NocmllYiBBcm5kIEJlcmdtYW5uOg0KPiBG
cm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KPiANCj4gQ29uZmlndXJhdGlv
bnMgd2l0aCBib3RoIENPTkZJR19GQl9TSU1QTEU9eSBhbmQgQ09ORklHX0RSTV9TSU1QTEVE
Uk09bQ0KPiBhcmUgYWxsb3dlZCBieSBLY29uZmlnIGJlY2F1c2UgdGhlICdkZXBlbmRzIG9u
ICFEUk1fU0lNUExFRFJNJyBkZXBlbmRlbmN5DQo+IGRvZXMgbm90IGRpc2FsbG93IEZCX1NJ
TVBMRSBhcyBsb25nIGFzIFNJTVBMRURSTSBpcyBub3QgYnVpbHQtaW4uIFRoaXMNCj4gY2Fu
IGhvd2V2ZXIgcmVzdWx0IGluIGEgYnVpbGQgZmFpbHVyZSB3aGVuIGNmYl9maWxscmVjdCgp
IGV0YyBhcmUgdGhlbg0KPiBhbHNvIGluIGxvYWRhYmxlIG1vZHVsZXM6DQo+IA0KPiB4ODZf
NjQtbGludXgtbGQ6IGRyaXZlcnMvdmlkZW8vZmJkZXYvc2ltcGxlZmIubzooLnJvZGF0YSsw
eDFmOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGNmYl9maWxscmVjdCcNCj4geDg2XzY0
LWxpbnV4LWxkOiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NpbXBsZWZiLm86KC5yb2RhdGErMHgy
MDApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBjZmJfY29weWFyZWEnDQo+IHg4Nl82NC1s
aW51eC1sZDogZHJpdmVycy92aWRlby9mYmRldi9zaW1wbGVmYi5vOigucm9kYXRhKzB4MjA4
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgY2ZiX2ltYWdlYmxpdCcNCj4gDQo+IFRvIHdv
cmsgYXJvdW5kIHRoaXMsIGNoYW5nZSBGQl9TSU1QTEUgdG8gYmUgYSAndHJpc3RhdGUnIHN5
bWJvbCwNCj4gd2hpY2ggc3RpbGwgYWxsb3dzIGJvdGggdG8gYmUgPW0gdG9nZXRoZXIsIGJ1
dCBub3Qgb25lIG9mIHRoZW0gdG8NCj4gYmUgPXkgaWYgdGhlIG90aGVyIG9uZSBpcyA9bS4g
SWYgYSBkaXN0cm8ga2VybmVsIHBpY2tzIHRoaXMNCj4gY29uZmlndXJhdGlvbiwgaXQgY2Fu
IGJlIGRldGVybWluZWQgYnkgbG9jYWwgcG9saWN5IHdoaWNoIG9mDQo+IHRoZSB0d28gbW9k
dWxlcyBnZXRzIGxvYWRlZC4gVGhlICdvZl9jaG9zZW4nIGV4cG9ydCBpcyBuZWVkZWQNCj4g
YXMgdGhpcyBpcyB0aGUgZmlyc3QgbG9hZGFibGUgbW9kdWxlIHJlZmVyZW5jaW5nIGl0Lg0K
PiANCj4gQWx0ZXJuYXRpdmVseSwgdGhlIEtjb25maWcgZGVwZW5kZW5jeSBjb3VsZCBiZSBj
aGFuZ2VkIHRvDQo+ICdkZXBlbmRzIG9uIERSTV9TSU1QTEVEUk09bicsIHdoaWNoIHdvdWxk
IGZvcmJpZCB0aGUgY29uZmlndXJhdGlvbg0KPiB3aXRoIGJvdGggZHJpdmVycy4NCj4gDQo+
IEZpeGVzOiAxMWU4ZjVmZDIyM2IgKCJkcm06IEFkZCBzaW1wbGVkcm0gZHJpdmVyIikNCj4g
QWNrZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+ICMgZm9yIGRyaXZlcnMv
b2YvDQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMDcyMTE1MTgz
OS4yNDg0MjQ1LTEtYXJuZEBrZXJuZWwub3JnLw0KPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJl
cmdtYW5uIDxhcm5kQGFybmRiLmRlPg0KDQpJJ3ZlIGFkZGVkIGEgZmV3IENDIHRhZ3MgYW5k
IG1lcmdlZCB0aGUgcGF0Y2ggaW50byBkcm0tbWlzYy1maXhlcy4gDQpUaGFua3MgZm9yIHlv
dXIgcGF0aWVuY2UgYW5kIHBlcnNldmVyYW5jZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiAtLS0NCj4gICBkcml2ZXJzL29mL2Jhc2UuYyAgICAgICAgICAgfCAxICsNCj4gICBk
cml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcgfCA1ICsrKy0tDQo+ICAgMiBmaWxlcyBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9vZi9iYXNlLmMgYi9kcml2ZXJzL29mL2Jhc2UuYw0KPiBpbmRleCBmNzIw
YzBkMjQ2ZjIuLjBhYzE3MjU2MjU4ZCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9vZi9iYXNl
LmMNCj4gKysrIGIvZHJpdmVycy9vZi9iYXNlLmMNCj4gQEAgLTM2LDYgKzM2LDcgQEAgTElT
VF9IRUFEKGFsaWFzZXNfbG9va3VwKTsNCj4gICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm9mX3Jv
b3Q7DQo+ICAgRVhQT1JUX1NZTUJPTChvZl9yb290KTsNCj4gICBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm9mX2Nob3NlbjsNCj4gK0VYUE9SVF9TWU1CT0wob2ZfY2hvc2VuKTsNCj4gICBzdHJ1
Y3QgZGV2aWNlX25vZGUgKm9mX2FsaWFzZXM7DQo+ICAgc3RydWN0IGRldmljZV9ub2RlICpv
Zl9zdGRvdXQ7DQo+ICAgc3RhdGljIGNvbnN0IGNoYXIgKm9mX3N0ZG91dF9vcHRpb25zOw0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnIGIvZHJpdmVycy92
aWRlby9mYmRldi9LY29uZmlnDQo+IGluZGV4IGIyNmI3OWRmY2FjOS4uNmVkNWU2MDhkZDA0
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L0tjb25maWcNCj4gKysrIGIv
ZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnDQo+IEBAIC0yMTkzLDggKzIxOTMsOSBAQCBj
b25maWcgRkJfSFlQRVJWDQo+ICAgCSAgVGhpcyBmcmFtZWJ1ZmZlciBkcml2ZXIgc3VwcG9y
dHMgTWljcm9zb2Z0IEh5cGVyLVYgU3ludGhldGljIFZpZGVvLg0KPiAgIA0KPiAgIGNvbmZp
ZyBGQl9TSU1QTEUNCj4gLQlib29sICJTaW1wbGUgZnJhbWVidWZmZXIgc3VwcG9ydCINCj4g
LQlkZXBlbmRzIG9uIChGQiA9IHkpICYmICFEUk1fU0lNUExFRFJNDQo+ICsJdHJpc3RhdGUg
IlNpbXBsZSBmcmFtZWJ1ZmZlciBzdXBwb3J0Ig0KPiArCWRlcGVuZHMgb24gRkINCj4gKwlk
ZXBlbmRzIG9uICFEUk1fU0lNUExFRFJNDQo+ICAgCXNlbGVjdCBGQl9DRkJfRklMTFJFQ1QN
Cj4gICAJc2VsZWN0IEZCX0NGQl9DT1BZQVJFQQ0KPiAgIAlzZWxlY3QgRkJfQ0ZCX0lNQUdF
QkxJVA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------L8E2vaOnit16sZhAVdaZ4yvl--

--------------jIOv0DVcltLz15eqCTrGX94A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFUIEsFAwAAAAAACgkQlh/E3EQov+B2
SQ//RXF5axAXGddeKOgymTLnqV/PHW/B2rmaInibjotBM4NyAO2+wcF10P1BkQE3vX2x5F59AqPy
UWJfXVdEb1Dr0nfILECEviK4YZ9UCRnrGTJ5eY8akGR+OzSb58y8V/BnSeGNg5PSz3SxTItRKvFk
xqURIeCjolNBlzj6A2tGXHF30RspF3YrKW+XjtBVn5T6agRvQWA8oDgfGsq4bEgwM0IKIL8sbt8h
/MDBQEq9QIygBw7pFQj2Tu0UWcdUa7DKYnxQ6fsawx9/UPDJRg6zwxx6seQ+X7Z316QQgkqzrv23
PVrUhmzzZpvTUxeIbOiOuy/TOiGCEN1m5xUE2sJCZdT8V0Ch7RtvG6N7kpakJ7R+OonFKCl9w2Yf
bl6ywg45jRushme00sge7sNhzO3Kf81j7OCQe4irVeUzdlwrzEB07rwu+t9dF9oGPZKzyUId53C3
YszN/+Xhr6S5jHDd7HUdbJ9aMdlhBeGQlkqjnyNThF2VEkruJbi0Zv4Vm/RmxuBSrl8PO6PDgI/6
jmWO/zFkaBzxmcuoim8/Aeodc6bmdAjtTNG5usi4TtQUiZJBrsuLebBGmZErsmwXGXXDLn0rebuC
TymqgKkLHDg+B9hhEvliG4mCxq9sFzgNKTpqWIxU4OnFmkkhIkmgah4KxFcVcnkx7gi5zGVfuF26
mZo=
=zSdW
-----END PGP SIGNATURE-----

--------------jIOv0DVcltLz15eqCTrGX94A--
