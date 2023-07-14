Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A20B4753DFC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5665310E8A1;
	Fri, 14 Jul 2023 14:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F17E10E8A2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:46:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 975132209B;
 Fri, 14 Jul 2023 14:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689346014; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s7DbIMsHwZe7OGM29YmTw6EXpgPM5WYMuOmkPEwRQP4=;
 b=2T0aE5UGBfrCCgxqM/XzVfy87UJWkueRN4mUiqD2opzJ6buzg7PzlpE/gXo6o9MDdYPpCC
 kyVW6BdkUU+NTJXPNazahJLVTt2Z64lJi2ucXvsSM6yhybdOSmN0XmsVIxBrbtDpvOtrBM
 FHpunZ/CCbaunf5zxdwprX3QlsGhU6o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689346014;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s7DbIMsHwZe7OGM29YmTw6EXpgPM5WYMuOmkPEwRQP4=;
 b=6XfHH5b2/8RyL/ye5++UMV9DqUa3mg5Fshn40IH3tuPkQ88VXFsJNr/yTp72Cyvuzltule
 6e7do8soJAf0WHBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73C0513A15;
 Fri, 14 Jul 2023 14:46:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NnwbG95fsWQwJwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jul 2023 14:46:54 +0000
Message-ID: <4ff986c0-d62e-a1d7-91f1-23af08cc0398@suse.de>
Date: Fri, 14 Jul 2023 16:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 3/3] drm/file: drop DRM_MINOR_CONTROL
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20230714104557.518457-1-contact@emersion.fr>
 <20230714104557.518457-3-contact@emersion.fr>
 <ae92e39e-4087-ba36-2708-31dede0274e1@suse.de>
 <HwBhGvmlMRmImPdvQecgkegO5PCzZuM3XQW1_xK3MrJQk8ZKVaohV09sZBNbXrxmSf3o-8WN0Wf_Xqchr6h2rumOkp8lU_VjGTOha_6JBrI=@emersion.fr>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <HwBhGvmlMRmImPdvQecgkegO5PCzZuM3XQW1_xK3MrJQk8ZKVaohV09sZBNbXrxmSf3o-8WN0Wf_Xqchr6h2rumOkp8lU_VjGTOha_6JBrI=@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Z095ODq0CPgJYo0Aw80jBVAx"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 James Zhu <James.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Z095ODq0CPgJYo0Aw80jBVAx
Content-Type: multipart/mixed; boundary="------------0vPSWvi8ETCx0oCarHVLCfE4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>, James Zhu <James.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <4ff986c0-d62e-a1d7-91f1-23af08cc0398@suse.de>
Subject: Re: [RFC PATCH 3/3] drm/file: drop DRM_MINOR_CONTROL
References: <20230714104557.518457-1-contact@emersion.fr>
 <20230714104557.518457-3-contact@emersion.fr>
 <ae92e39e-4087-ba36-2708-31dede0274e1@suse.de>
 <HwBhGvmlMRmImPdvQecgkegO5PCzZuM3XQW1_xK3MrJQk8ZKVaohV09sZBNbXrxmSf3o-8WN0Wf_Xqchr6h2rumOkp8lU_VjGTOha_6JBrI=@emersion.fr>
In-Reply-To: <HwBhGvmlMRmImPdvQecgkegO5PCzZuM3XQW1_xK3MrJQk8ZKVaohV09sZBNbXrxmSf3o-8WN0Wf_Xqchr6h2rumOkp8lU_VjGTOha_6JBrI=@emersion.fr>

--------------0vPSWvi8ETCx0oCarHVLCfE4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDcuMjMgdW0gMTY6Mzcgc2NocmllYiBTaW1vbiBTZXI6DQo+IE9uIEZy
aWRheSwgSnVseSAxNHRoLCAyMDIzIGF0IDE2OjI4LCBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPj4gSGkgU2ltb24NCj4+DQo+PiBBbSAx
NC4wNy4yMyB1bSAxMjo0NiBzY2hyaWViIFNpbW9uIFNlcjoNCj4+PiBUaGlzIGVudHJ5IHNo
b3VsZCBuZXZlciBiZSB1c2VkIGJ5IHRoZSBrZXJuZWwuIFJlY29yZCB0aGUgaGlzdG9yaWNh
bA0KPj4+IGNvbnRleHQgaW4gYSBjb21tZW50Lg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTog
U2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPg0KPj4+IENjOiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+Pj4gQ2M6IEphbWVzIFpodSA8SmFt
ZXMuWmh1QGFtZC5jb20+DQo+Pj4gQ2M6IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2FrQGFt
ZC5jb20+DQo+Pj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
DQo+Pj4gLS0tDQo+Pj4gICAgaW5jbHVkZS9kcm0vZHJtX2ZpbGUuaCB8IDQgKysrLQ0KPj4+
ICAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4+
Pg0KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZmlsZS5oIGIvaW5jbHVkZS9k
cm0vZHJtX2ZpbGUuaA0KPj4+IGluZGV4IDAxMDIzOTM5MmFkZi4uYTIzY2MyZjYxNjNmIDEw
MDY0NA0KPj4+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9maWxlLmgNCj4+PiArKysgYi9pbmNs
dWRlL2RybS9kcm1fZmlsZS5oDQo+Pj4gQEAgLTUzLDEyICs1MywxNCBAQCBzdHJ1Y3QgZmls
ZTsNCj4+PiAgICAvKiBOb3RlIHRoYXQgdGhlIHZhbHVlcyBvZiB0aGlzIGVudW0gYXJlIEFC
SSAoaXQgZGV0ZXJtaW5lcw0KPj4+ICAgICAqIC9kZXYvZHJpL3JlbmRlckQqIG51bWJlcnMp
Lg0KPj4+ICAgICAqDQo+Pj4gKyAqIFRoZXJlIHVzZWQgdG8gYmUgYSBEUk1fTUlOT1JfQ09O
VFJPTCA9IDEgZW50cnksIGJ1dCBzdWNoIG5vZGVzIHdlcmUgbmV2ZXINCj4+PiArICogZXhw
b3NlZC4gU3RpbGwsIHNvbWUgdXNlci1zcGFjZSBoYXMgbG9naWMgdG8gaGFuZGxlIHRoZW0u
DQo+Pj4gKyAqDQo+Pj4gICAgICogU2V0dGluZyBEUk1fTUlOT1JfQUNDRUwgdG8gMzIgZ2l2
ZXMgZW5vdWdoIHNwYWNlIGZvciBtb3JlIGRybSBtaW5vcnMgdG8NCj4+PiAgICAgKiBiZSBp
bXBsZW1lbnRlZCBiZWZvcmUgd2UgaGl0IGFueSBmdXR1cmUNCj4+PiAgICAgKi8NCj4+PiAg
ICBlbnVtIGRybV9taW5vcl90eXBlIHsNCj4+PiAgICAJRFJNX01JTk9SX1BSSU1BUlkgPSAw
LA0KPj4+IC0JRFJNX01JTk9SX0NPTlRST0wgPSAxLA0KPj4NCj4+IE1heWJlIHJhdGhlciBs
ZWF2ZSB0aGlzIGxpbmUgaW4gYW5kIGNvbW1lbnQgaXQgd2l0aCAiLy8gb2Jzb2xldGUiLg0K
Pj4gT3RoZXJ3aXNlIHNvbWVvbmUgbWlnaHQgYWNjaWRlbnRhbGx5IHVzZSAxIGZvciBzb21l
dGhpbmcuDQo+IA0KPiBZZWFoLi4uIFRoYXQncyB3aHkgSSBhZGRlZCB0aGUgY29tbWVudC4g
QnV0IG1heWJlIGJldHRlciB0byBsZWF2ZSB0aGUgZW50cnkNCj4gaW5kZWVkLCBldmVuIGlm
IHdlIHJpc2sgc29tZW9uZSBhY2NpZGVudGFsbHkgdXNpbmcgaXQuDQoNCllvdSBjb3VsZCBz
dGlsbCBvdXQtY29tbWVudCB0aGUgbGluZSBhcyBhIHdob2xlLiBTaW1wbHkgaGF2aW5nIGl0
IHRoZXJlIA0Kd2lsbCB3YXJuIHBvdGVudGlhbCB1c2Vycy4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4+IEluIGFueSBjYXNlDQo+Pg0KPj4gUmV2aWV3ZWQtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4NCj4+IGZvciB0aGUgd2hv
bGUgc2VyaWVzLg0KPiANCj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3IQ0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVl
cm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBN
Y0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==


--------------0vPSWvi8ETCx0oCarHVLCfE4--

--------------Z095ODq0CPgJYo0Aw80jBVAx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSxX90FAwAAAAAACgkQlh/E3EQov+An
9RAArCph2g/m7D5wjN/WX/HYBTUnykyIP1nh2g74+GA+pJxnqzU2tB+j5XwSoNFFrMiR2n2Icrs6
FZ5DCCZodbccKL2dm0TORLK1vVIPcfe18krw4spV1VT/3JEOH64z0mtq6aZ7EsfrxgAwWoN2KnXR
5qD42SLZKOTUyhT8CjlBWnBUxYE3CCEQQeBhVCqD82qWwzCiEWkE3WluRCSu8gA3uhSCwszC/7+z
p4LPan6EJopYicEQR0ajyQbiRXStA+5ffJRaBXnmx/SmQdeojSqbsKfztn2hOPDTLdkToT3Kvwm8
B7nRng6Q4oczGKFJEJw/+IleWSIF61Oldr30/wCzvxyLF2sZ186k1zL0aI/ZGb2btLt7P80AvfM5
eB4Y4MbwOoNCEQOP0xaupYKIioSXg8gRgIGu8h1aYXS0ItNeFBqmEDHy06JZfCoOtAnj+uwA7YoH
LSCgt+Bz/KOls36fgwonn943aRsaghrRBxsBMKCZFdGZPH+GJbgdgmpNxz1zinHnRGNBPm6LrcGn
K47563dza18p6PXmZG8rt1uAXVQQcI/GUapVLa9NSAigfF2Uf1U04dSb80ivko2oQCZwGGkO7NdM
L1tpq1RtmWFcl6etPES5LqTF1H8xtCyz7GEUBUtVz6pL2rSkbzm8yEimS3qr72rCSvoPE8iDd4fV
e5A=
=wmxK
-----END PGP SIGNATURE-----

--------------Z095ODq0CPgJYo0Aw80jBVAx--
