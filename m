Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ACA7480B2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:20:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C88B10E33E;
	Wed,  5 Jul 2023 09:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E597F10E225
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:19:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 72FAF1F890;
 Wed,  5 Jul 2023 09:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688548793; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aQ7Bpf4KtBN5ddx36JW242VvZJa63a6kAX5ilsA/Pl4=;
 b=bDsxmVOxg8prPjisizXCckS3r6rlNo/4wUw/x4EpfHl9QqEGZZC5P5SL8aViy77D+s++zE
 uuuJE7f1BC8B+1Mu1028pD6NdDt/e+2k1HkCveCRIQyLvbjZ500ilZWSWVveY+f/hKVgUB
 a8iAiumxgJLesSMEl6yRI1qWolOvzLw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688548793;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aQ7Bpf4KtBN5ddx36JW242VvZJa63a6kAX5ilsA/Pl4=;
 b=kMjWoQS1WffLTYMn1I8Xx4HLcyTIcgwDr8XdUe2mrpgVfRZrWWH65GF6ZODlps20HdfIGS
 U7VIqf/C5DaoBNDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D018134F3;
 Wed,  5 Jul 2023 09:19:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oi/4Dbk1pWR3aQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Jul 2023 09:19:53 +0000
Message-ID: <f82635d8-4500-d420-f6ba-65aa515017e4@suse.de>
Date: Wed, 5 Jul 2023 11:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 04/10] drm/tegra: Set fbdev flags
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-5-tzimmermann@suse.de>
 <87wmzerc2s.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87wmzerc2s.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CT4EqE03AYZGss3hmuRSc2Fn"
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CT4EqE03AYZGss3hmuRSc2Fn
Content-Type: multipart/mixed; boundary="------------mU0XdPHXGUpnkyooCmAgqr04";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
Message-ID: <f82635d8-4500-d420-f6ba-65aa515017e4@suse.de>
Subject: Re: [PATCH 04/10] drm/tegra: Set fbdev flags
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-5-tzimmermann@suse.de>
 <87wmzerc2s.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87wmzerc2s.fsf@minerva.mail-host-address-is-not-set>

--------------mU0XdPHXGUpnkyooCmAgqr04
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA1LjA3LjIzIHVtIDEwOjM0IHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JpdGVzOg0KPiANCj4+IFNldCBmYmRldiBkZWZhdWx0IGZsYWdzIEZCTkZPX0RFRkFV
TFQgYW5kIG1hcmsgdGhlIGZyYW1lYnVmZmVyIHdpdGgNCj4+IEZCSU5GT19WSVJURkIuIFRo
ZSBmcmFtZWJ1ZmZlciByYW5nZSBpcyBpbiBETUEtYWJsZSBtZW1vcnkgYW5kIHNob3VsZA0K
Pj4gYmUgYWNjZXNzZWQgd2l0aCB0aGUgQ1BVJ3MgcmVndWxhciBtZW1vcnkgb3BzLg0KPj4N
Cj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNl
LmRlPg0KPj4gQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb20+
DQo+PiBDYzogTWlra28gUGVydHR1bmVuIDxtcGVydHR1bmVuQG52aWRpYS5jb20+DQo+PiAt
LS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2ZiZGV2LmMgfCAzICsrKw0KPj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS90ZWdyYS9mYmRldi5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Zi
ZGV2LmMNCj4+IGluZGV4IDgyNTc3YjdjODhkYS4uODA3NDQzMGM1MmYxIDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2ZiZGV2LmMNCj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS90ZWdyYS9mYmRldi5jDQo+PiBAQCAtMTAzLDYgKzEwMyw4IEBAIHN0YXRpYyBp
bnQgdGVncmFfZmJkZXZfcHJvYmUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmhlbHBlciwNCj4+
ICAgCQlyZXR1cm4gUFRSX0VSUihpbmZvKTsNCj4+ICAgCX0NCj4+ICAgDQo+PiArCWluZm8t
PmZsYWdzID0gRkJJTkZPX0RFRkFVTFQ7DQo+PiArDQo+PiAgIAlmYiA9IHRlZ3JhX2ZiX2Fs
bG9jKGRybSwgJmNtZCwgJmJvLCAxKTsNCj4+ICAgCWlmIChJU19FUlIoZmIpKSB7DQo+PiAg
IAkJZXJyID0gUFRSX0VSUihmYik7DQo+PiBAQCAtMTMyLDYgKzEzNCw3IEBAIHN0YXRpYyBp
bnQgdGVncmFfZmJkZXZfcHJvYmUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmhlbHBlciwNCj4+
ICAgCQl9DQo+PiAgIAl9DQo+PiAgIA0KPj4gKwlpbmZvLT5mbGFncyB8PSBGQklORk9fVklS
VEZCOw0KPiANCj4gSSBzZWUgdGhhdCBhbGwgZmJkZXYgZHJpdmVycyBqdXN0IGRvOiBpbmZv
LT5mbGFncyA9IEZCSU5GT19GTEFHX0RFRkFVTFQgfCBGQklORk9fVklSVEZCDQo+IA0KPiBH
dWVzcyB5b3UgYXJlIGRvaW5nIGluIHR3byBhc3NpZ25tZW50cyB0byBiZSBjb25zaXN0ZW50
IHdpdGggZHJtX2ZiZGV2X2RtYS5jID8NCj4gSSB3YXMganVzdCBjdXJpb3VzIGFib3V0IHRo
ZSByYXRpb25hbGUgZm9yIHNldHRpbmcgdGhlIGZsYWdzIGluIHR3byBzdGVwcy4NCg0KVGhl
IF9ERUZBVUxUIGZsYWcgaXMgcmVhbGx5IGp1c3QgYSB6ZXJvLiBBbmQgdGhlIG90aGVyIGZs
YWdzIGRlc2NyaWJlIA0KZGlmZmVyZW50IGFzcGVjdHMgb2YgdGhlIGZyYW1lYnVmZmVyLiAg
SSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBzZXQgdGhlIA0KZmxhZ3MgdG9nZXRoZXIgd2l0
aCB0aGUgcmVzcGVjdGl2ZSBzdGF0ZS4gRm9yIGV4YW1wbGUsIF9WSVJURkIgaXMgc2V0IA0K
bmV4dCB0byAtPnNjcmVlbl9idWZmZXIsIGJlY2F1c2UgdGhleSBiZWxvbmcgdG9nZXRoZXIu
DQoNCl9WSVJURkIgaXMgY3VycmVudGx5IG9ubHkgdXNlZCBpbiBkZWZpbyBjb2RlIGF0DQoN
Cmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVy
cy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMjTDIzMg0KDQpJIHRoaW5rIHRoZSBmYmRl
diBJL08gaGVscGVycyBzaG91bGQgYWxzbyB0ZXN0IHRoaXMgZmxhZyBhZnRlciBhbGwgDQpk
cml2ZXJzIGhhdmUgYmVlbiBhbm5vdGF0ZWQgY29ycmVjdGx5LiBGb3IgZXhhbXBsZSwgZmJf
aW9fcmVhZCgpIHdvdWxkIA0KV0FSTl9PTkNFIGlmIHRoZSBfVklSVEZCIGZsYWcgaGFzIGJl
ZW4gc2V0OyBhbmQgZmJfc3lzX3JlYWQoKSB3b3VsZCB3YXJuIA0KaWYgaXQgaGFzbid0IGJl
ZW4gc2V0LiAgRm9yIHRoZSByZWFkIGhlbHBlcnMsIGl0IGFsc28gbWFrZXMgc2Vuc2UgdG8g
DQpXQVJOX09OQ0UgaWYgdGhlIF9SRUFEU19GQVNUIGZsYWcgaGFzIG5vdCBiZWVuIHNldC4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gUmV2aWV3ZWQtYnk6IEphdmllciBN
YXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiANCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51
ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcg
TWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=


--------------mU0XdPHXGUpnkyooCmAgqr04--

--------------CT4EqE03AYZGss3hmuRSc2Fn
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSlNbgFAwAAAAAACgkQlh/E3EQov+C0
mhAAqIa+bhZXwcmKmWwOTBxRCzkVDD8jSLwJ++K+E6TP50Hpk0T32DeFscLmx5J1zU1hR8TqBz5S
UjxflWVCO011ZFWN4l6gz03XSTWnToNcmlAXQbWgMiH3QEaXOXiFA4j7t2X4GiD09XfnyUq+qgpG
1HCsW/I5MEzRmQVISA3CKzGOC/vV/NYMZG8d1rGCAIwDRd06fmNj2Nt7uNOEyZ6JIOoNYxEC/Djm
AHGR+HnUMoW1o5WEuUCho2nMxMoMfZ6o598Z2lczxj2JvheckiYT0g04BTCS4mlIfvvkemcR3Q2n
yL3rqHwBmOoP69Y0pCsTAiX2BnBvTmpU/Kcnk0CJqx7UhNM8jP6SJyaOaMqpb1+gxe+DGkkE1xI9
/sskoQwhgZ3+WkQ0mc5afB8Jh0fLyDONehZo9PMOMhITzAy5LrIlL3Ab6o1pY1GE43bQ78rTzAFb
zJ0U7UMVS6ftwOzziLyhWrh7/36aa/8g+tWoS8hXokdYMedrdOD6cbuywfkXTeHqm+w+W3I32lZG
kNVBbhuq0ZehXmUqROOaLd1KnAiW0zLdUaKrpnvpA5RIwJ1JuPFztqfphBBYjPE57/siqC//PZPK
w462a7fFbDquHq0Pkvy+orRc/Se/zStplVBD1J4aHPTtwEeyU+mIgOvxByEIyUWY/MgjBADVhwUU
ReU=
=wlAd
-----END PGP SIGNATURE-----

--------------CT4EqE03AYZGss3hmuRSc2Fn--
