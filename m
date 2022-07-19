Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D725794D6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 10:05:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E537113D48;
	Tue, 19 Jul 2022 08:05:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7AA11242A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 08:05:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7915C201D4;
 Tue, 19 Jul 2022 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1658217937; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W7L5OAuoeAIOD5n32JO00wm0r7WLSRKgpNCBnTqolTU=;
 b=HzdAy78F+19DpXIBkBl5GoEcceadhLxBUp6deyDP1ZQ3UqzcLoRZBLAKgr2cTzEYFapu4o
 cYfriYmOPrdIcYxzKmikkRUaLXLJZGNYiO6pGs/GOa6CYg8QnVPkyDnUfE04jVj0O0FLYr
 Dao3zyOyH1agVrVrfJg9VgSeFlkhrns=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1658217937;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W7L5OAuoeAIOD5n32JO00wm0r7WLSRKgpNCBnTqolTU=;
 b=r+TRjPWfqUYK+XlqOCNcYAZ/UdsTvuaoPSs+2zcIScyZTS2zil0l9L87tZi+KTKE4sZ2WG
 LzxkIdsO5FNu33BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6135913488;
 Tue, 19 Jul 2022 08:05:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hrS2FtFl1mJgQQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 19 Jul 2022 08:05:37 +0000
Message-ID: <9ac4096e-454a-59c7-d0c1-e377b4dd2ec8@suse.de>
Date: Tue, 19 Jul 2022 10:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
 <88df6527-7ff0-c69a-69ca-dbd1e4322bea@redhat.com>
 <0cb7b85a-d629-b5e9-4ab7-fcf7ce0e018f@suse.de>
 <b7bd3635-56c7-a1af-4d9e-70ad2c91f388@redhat.com>
 <YtZjhaFVHJJi5OSo@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YtZjhaFVHJJi5OSo@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wqtOWLYlNHT9TIVwKDL63Idj"
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
--------------wqtOWLYlNHT9TIVwKDL63Idj
Content-Type: multipart/mixed; boundary="------------aEWNQaUaNVoYn0rFWiv5XviS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <9ac4096e-454a-59c7-d0c1-e377b4dd2ec8@suse.de>
Subject: Re: [PATCH v1 0/11] drm: move dri1 drivers to drm/dri1/
References: <20220716181750.3874838-1-sam@ravnborg.org>
 <9ded7088-cb15-fe5d-5a4d-001d3d9bb195@suse.de>
 <88df6527-7ff0-c69a-69ca-dbd1e4322bea@redhat.com>
 <0cb7b85a-d629-b5e9-4ab7-fcf7ce0e018f@suse.de>
 <b7bd3635-56c7-a1af-4d9e-70ad2c91f388@redhat.com>
 <YtZjhaFVHJJi5OSo@ravnborg.org>
In-Reply-To: <YtZjhaFVHJJi5OSo@ravnborg.org>

--------------aEWNQaUaNVoYn0rFWiv5XviS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDE5LjA3LjIyIHVtIDA5OjU1IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBKYXZpZXIsIFRob21hcywNCj4gDQo+IE9uIE1vbiwgSnVsIDE4LCAyMDIyIGF0IDAy
OjE4OjEzUE0gKzAyMDAsIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyB3cm90ZToNCj4+IE9u
IDcvMTgvMjIgMTI6NTAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4NCj4+IFsuLi5d
DQo+Pg0KPj4+Pj4gVG8gYmUgaG9uZXN0LCBJIHN0aWxsIGRvbid0IGxpa2UgdGhpcyByZW5h
bWUuIEVzcGVjaWFsbHkgaW4gdGhlIGNhc2Ugb2YNCj4+Pj4+IHZpYSwgd2hpY2ggaGFzIGEg
S01TIGRyaXZlciBjb21pbmcgdXAuIEl0IHdpbGwgbm93IGhhdmUgYW4gaW5jbHVkZQ0KPj4+
Pj4gc3RhdGVtZW50IHRoYXQgY3Jvc3NlcyBzZXZlcmFsIGxldmVscyBpbiB0aGUgZGlyZWN0
b3J5IGhpZXJhcmNoeS4gQW5kDQo+Pj4+DQo+Pj4+IFRoYXQgY291bGQgYmUgYXZvaWRlZCBi
eSBtb3ZpbmcgZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfM2RfcmVnLmggYW5kIG90aGVyDQo+
Pj4+IGhlYWRlciBmaWxlcyB0byBpbmNsdWRlL2RybS92aWFfM2RfcmVnLmggZm9yIGV4YW1w
bGUuIE90aGVyIGRyaXZlcnMgKGkuZToNCj4+Pj4gaTkxNSkgZG8gdGhlIHNhbWUgZm9yIGhl
YWRlcnMgdGhhdCBhcmUgc2hhcmVkIGFjcm9zcyBkaWZmZXJlbnQgc3Vic3lzdGVtcy4NCj4+
Pj4gICAgDQo+Pj4+PiB3aGF0IGFib3V0IHRoZSBvdGhlciBEUkkxIGRyaXZlcnM/IElmIHdl
IGV2ZXIgZ2V0IEtNUyBkcml2ZXJzIGZvciB0aG9zZSwNCj4+Pj4+IGRvIHdlIHdhbnQgdG8g
bW92ZSBzb21lIGhlYWRlciBmaWxlcyBiYWNrIGludG8gdGhlaXIgb3JpZ2luYWwgbG9jYXRp
b25zPw0KPj4+Pg0KPj4+PiBJIGJlbGlldmUgZm9yIHRoZXNlIHdlIGNvdWxkIGFsc28gbW92
ZSB0aGVtIHRvIGluY2x1ZGUvZHJtLyBpZiBuZWVkZWQuDQo+Pj4NCj4+PiBUaGF0IHBvbGx1
dGVzIHRoZXNlIHNoYXJlZCBkaXJlY3RvcmllcyBhdCB0aGUgZXhwZW5zZSBvZiBldmVyeW9u
ZSBlbHNlLg0KPj4+IElmIGFueXRoaW5nLCB3ZSB3YW50IHRvIG1vdmUgZmlsZXMgb3V0IG9m
IHRoZSBzaGFyZWQgaW5jbHVkZSBwYXRocy4NCj4+Pg0KPj4NCj4+IFllcywgZXZlcnkgb3B0
aW9uIGhhcyBhIGRpZmZlcmVudCBzZXQgb2YgdHJhZGUgb2Zmcy4NCj4+ICAgDQo+Pj4gSXQg
d291bGQgbWFrZSBzZW5zZSB0byBtZSBpZiB3ZSdkIGhhdmUgdHdvIGRpc3RpbmN0IGRyaXZl
cnMuIEJ1dCBoZXJlLA0KPj4+IHRoZSBuZXcgYW5kIHRoZSBvbGQgZHJpdmVyIGlzIHJlYWxs
eSBqdXN0IG9uZSBEUk0gZHJpdmVyIHdpdGggYmFkbHkNCj4+PiBvcmdhbml6ZWQgc291cmNl
IGNvZGUuDQo+Pj4NCj4+DQo+PiBJIHNlZS4gSSBoYXZlbid0IGxvb2tlZCBhdCB0aGUgdmlh
IGRyaXZlcnMgaW4gZGV0YWlsLg0KPj4NCj4+Pj4gICAgDQo+Pj4+PiBQYXRjaGVzIDEgYW5k
IDIgbG9vayByZWFzb25hYmxlIHRvIG1lLiBUaGUgb3RoZXIgZHJpdmVyIHBhdGNoZXMgaGF2
ZQ0KPj4+Pj4gYmFzaWNhbGx5IHplcm8gdXBzaWRlIElNSE8uDQo+Pj4+Pg0KPj4+Pg0KPj4+
PiBJIGRpc2FncmVlIHdpdGggdGhlIHplcm8gdXBzaWRlLiBJdCBtYXkgYmUgdGhhdCB0aGUg
dHJhZGUgb2ZmcyBhcmUgbm90DQo+Pj4+IHdvcnRoIGl0IGJ1dCB0aGVyZSBhcmUgdXBzaWRl
cyBvZiBoYXZpbmcgYWxsIERSSTEgZHJpdmVycyBhbmQgY29yZSBEUkkxDQo+Pj4+IGJpdHMg
aW4gdGhlIHNhbWUgcGxhY2UuIEl0IG1ha2VzIGdyZXAtaW5nIGFuZCByZWFkaW5nIGZpbGVz
IGVhc2llciBpZg0KPj4+PiBvbmUgZG9lc24ndCBjYXJlIGFib3V0IGxlZ2FjeSBEUkkxIGRy
aXZlcnMuDQo+Pj4NCj4+PiBUaGUgZ3JlcC1hYmlsaXR5IGlzIGEgbWlub3IgcG9pbnQuIEl0
IGRvZXMgY29tZSB1cCwgYnV0IGlzIHVzdWFsbHkNCj4+PiBzb3J0ZWQgb3V0IGVhc2lseS4N
Cj4+Pg0KPj4+IElmIHdlIHdhbnQgdG8gaW1wcm92ZSBncmVwIG91dHB1dCwgd2Ugc2hvdWxk
IGNvbnNpZGVyIGFwcGx5aW5nIFNhbSdzDQo+Pj4gdmlhX2RyaTEgY2hhbmdlcyB0byBhbGwg
RFJJMSBkcml2ZXJzLiBTbyB3ZSdkIGVuZCB1cCB3aXRoIGEgc2luZ2xlDQo+Pj4gbWdhX2Ry
aTEuYywgdGRmeF9kcmkxLmMsIHNhdmFnZV9kcmkxLmMgYW5kIHNvIG9uLiBJZiB0aGUgY29y
ZS9oZWxwZXINCj4+PiBjb2RlIGlzIGFsc28gaW4gYSBfZHJpMS1uYW1lZCBzb3VyY2UgZmls
ZSwgZ3JlcCBydW5zIGNhbiBmaWx0ZXIgb3V0DQo+Pj4gdGhvc2UgZmlsZW5hbWVzLg0KPj4+
DQo+Pg0KPj4gSGF2aW5nIGV2ZXJ5dGhpbmcgd2l0aCBhIF9kcmkxIHN1ZmZpeCB3b3VsZCBi
ZSBhbiBpbXByb3ZlbWVudCBJIGFncmVlDQo+PiBhbmQgaWYgdGhhdCdzIHRoZSBjb25zZW5z
dXMgdGhlbiBJJ20gT0sgd2l0aCB0aGF0IGFwcHJvYWNoIGFzIHdlbGwuDQo+Pg0KPj4gWy4u
Ll0NCj4gDQo+IEkgd2lsbCB1cGRhdGUgdGhlIHNlcmllcyB3aXRoIHRoZSBmb2xsb3dpbmc6
DQo+IC0gRHJvcCBkcm0vZHJpMS8NCj4gLSBLZWVwIHRoZSBDT05GSUdfRFJNXyogY2hhbmdl
IGFuZCBrZWVwIHRoZSBEUklWRVJfRFJJMSBjaGFuZ2UNCj4gLSBBbGwgY29uZmlnIG9wdGlv
bnMgZm9yIERSSTEgZHJpdmVycyB3aWxsIGdldCBhIENPTkZJR19EUk1fRFJJMV8qDQo+ICAg
IHByZWZpeA0KPiAtIENvbnZlcnQgYXQgbGVhc3Qgc29tZSBvZiB0aGUgZHJpdmVycyB0byBz
aW5nbGUgZmlsZSBkcml2ZXJzIG5hbWVkDQo+ICAgIGZvb19kcmkxLg0KPiAtIEkgbWF5IGFk
ZCBTUERYIGZvciBsaWNlbnNlcyB3aGVuIEkgYW0gdG91Y2hpbmcgdGhlIGZpbGVzDQo+IC0g
SSBtYXkgdHJ5IHRvIGNvbmNhdGVuYXRlIGFsbCBkcmkxIHNwZWNpZmljIGRybSBjb3JlIGZp
bGVzIHRvIGRybV9kcmkxLg0KPiAgICBJdCBpcyBlYXN5IHRvIGRvIGJ1dCBJIHdpbGwgdGFr
ZSBhIGxvb2sgYXQgdGhlIHJlc3VsdCBiZWZvcmUgcG9zdGluZw0KPiAgICBhbnl0aGluZy4N
Cj4gDQo+IFdoZW4gSSBoYXZlIHBvc3RlZCB0aGUgYWJvdmUgbGV0J3Mgc2VlIHdoYXQgd2Ug
YWxsIGFncmVlIG9uLg0KPiBNYXkgdGFrZSBhIGNvdXBsZSBvZiBkYXlzIGJlZm9yZSBJIGdl
dCBiYWNrIHRvIGl0Lg0KDQpTb3VuZHMgbGlrZSBhIHBsYW4gdG8gbWUuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gDQo+IAlTYW0NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------aEWNQaUaNVoYn0rFWiv5XviS--

--------------wqtOWLYlNHT9TIVwKDL63Idj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLWZdEFAwAAAAAACgkQlh/E3EQov+Da
FBAAmpczFUTE2uEEeXZIuxpt1VSHI1AkMvsPlTFQn8xtDLrpzTN/w5332z85u5rmLwOBlOOELfCw
qSaJ2Fvnu1e6TgmhAvUf0xA8gVJXefZ/Wcq7MUM4VDvzJu2A0YPJjFfQB60/lZaVjrobO4jj/2aj
1yo7474RtTc4lcd6+zkOo6QczVQJF35WSHGNDamBqiyNUKWYvVyIt8+vgnCKkgFJoDEmH+ThxFzR
+DJKhXE4lua0rt8yf6eRsuVMwf+0zsRoEraYITF+2AI9j+UdXQFAC+vP5GEpu8tzF0BRhD8lTrwA
IqsLtrD/HgqIYVsfZAKfgtJfKwsqnEa9HBnERiw//EXrbzZabofLMLBMHpLfVjkO2bdaBwUfYYc/
opkHN6cjYWb7jZjSvmH8X+RqGRhrnqBBVINS7TFj+UKRrK3WsXf7yjCBE+tMU+vbcz1eigAsZxSa
hGNEKrisrRm+TcHNNhi4QpTXsIznV0oOZKcVCpaGIBa/l4O16RadSbxLrsq7dSdwuaBRJCeerqxU
fhBPZ2kWJS2rWE1iZc4suKnmOgpfc8FW3Y1diRga1WQMStistPZgdmXeUHREEDXFERyJWjWaf/ZZ
BjN8a7NDQJZjGl/1tYdXd2bhVsxgYc37duTbHqZ9QBNymL3CSGDgQOwxos3kThPKvTsoBlbf4Sh7
M8o=
=whSZ
-----END PGP SIGNATURE-----

--------------wqtOWLYlNHT9TIVwKDL63Idj--
