Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3893363EBAE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:57:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D842E10E580;
	Thu,  1 Dec 2022 08:57:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D1910E580
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:57:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 61FAF1FD68;
 Thu,  1 Dec 2022 08:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669885063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r3r/G118yWCUCKMAvV3TdBpIoB0vv3ug7jR2Uk6MT5M=;
 b=OD1qUak9GxsaQ+65Q35AbhFI/DmDbKqe3l+nrgbAsGhr/6gisCqyXuTSUB7s53yyzT7HSZ
 C6EheKapWtqT6GLo0cuTE3D8UybLChJEyUN084wP1tXusv/iSoCh5YbZO0WTp8WEEYPKRJ
 E8zzUTNeqn8gaphIkuARgZYAuJ7KoTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669885063;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r3r/G118yWCUCKMAvV3TdBpIoB0vv3ug7jR2Uk6MT5M=;
 b=83dPlarRkbyBG10ReJuYsbKMRTmh6HPH8kp6peJB3rYv+C2uGCRtwQIwCZIu3MpeBHhmUq
 Qr8ZAX3/zcc9lWCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40E7813B4A;
 Thu,  1 Dec 2022 08:57:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id h7TYDodsiGPtHgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 01 Dec 2022 08:57:43 +0000
Message-ID: <0d3d4f86-456e-636f-3346-ced0fda70d09@suse.de>
Date: Thu, 1 Dec 2022 09:57:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 6/6] drm/gud: Enable synchronous flushing by default
Content-Language: en-US
To: noralf@tronnes.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 stable@kernel.org
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <20221122-gud-shadow-plane-v2-6-435037990a83@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221122-gud-shadow-plane-v2-6-435037990a83@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------d4k2JfWaSjVHdrZfAy2Ag7ji"
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
--------------d4k2JfWaSjVHdrZfAy2Ag7ji
Content-Type: multipart/mixed; boundary="------------nntQqSrxCqN4Dg4Wu4kPm0ou";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: noralf@tronnes.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 stable@kernel.org
Message-ID: <0d3d4f86-456e-636f-3346-ced0fda70d09@suse.de>
Subject: Re: [PATCH v2 6/6] drm/gud: Enable synchronous flushing by default
References: <20221122-gud-shadow-plane-v2-0-435037990a83@tronnes.org>
 <20221122-gud-shadow-plane-v2-6-435037990a83@tronnes.org>
In-Reply-To: <20221122-gud-shadow-plane-v2-6-435037990a83@tronnes.org>

--------------nntQqSrxCqN4Dg4Wu4kPm0ou
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMwLjExLjIyIHVtIDIwOjI2IHNjaHJpZWIgTm9yYWxmIFRyw7hubmVzIHZpYSBC
NCBTdWJtaXNzaW9uIEVuZHBvaW50Og0KPiBGcm9tOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4NCj4gDQo+IGd1ZCBoYXMgYSBtb2R1bGUgcGFyYW1ldGVyIHRoYXQg
Y29udHJvbHMgd2hldGhlciBmcmFtZWJ1ZmZlciBmbHVzaGluZw0KPiBoYXBwZW5zIHN5bmNo
cm9ub3VzbHkgZHVyaW5nIHRoZSBjb21taXQgb3IgYXN5bmNocm9ub3VzbHkgaW4gYSB3b3Jr
ZXIuDQo+IA0KPiBHTk9NRSBiZWZvcmUgdmVyc2lvbiAzLjM4IGhhbmRsZWQgYWxsIGRpc3Bs
YXlzIGluIHRoZSBzYW1lIHJlbmRlcmluZyBsb29wLg0KPiBUaGlzIGxlYWQgdG8gZ3VkIHNs
b3dpbmcgZG93biB0aGUgcmVmcmVzaCByYXRlIGZvciBhIGZhc3RlciBtb25pdG9yLiBUaGlz
DQo+IGhhcyBub3cgYmVlbiBmaXhlZCBzbyBsZXRzIGNoYW5nZSB0aGUgZGVmYXVsdC4NCj4g
DQo+IFRoZSBwbGFuIGlzIHRvIHJlbW92ZSBhc3luYyBmbHVzaGluZyBpbiB0aGUgZnV0dXJl
LiBUaGUgY29kZSBpcyBub3cNCj4gc3RydWN0dXJlZCBpbiBhIHdheSB0aGF0IG1ha2VzIGl0
IGVhc3kgdG8gZG8gdGhpcy4NCj4gDQo+IExpbms6IGh0dHBzOi8vYmxvZ3MuZ25vbWUub3Jn
L3NoZWxsLWRldi8yMDIwLzA3LzAyL3NwbGl0dGluZy11cC10aGUtZnJhbWUtY2xvY2svDQo+
IFN1Z2dlc3RlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQo+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3Jn
Pg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfcGlwZS5jIHwgMTIg
KysrKy0tLS0tLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1
ZF9waXBlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMNCj4gaW5kZXggOTIx
ODk0NzRhN2VkLi42MmM0M2QzNjMyZDQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ndWQvZ3VkX3BpcGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBl
LmMNCj4gQEAgLTI1LDE3ICsyNSwxMyBAQA0KPiAgICNpbmNsdWRlICJndWRfaW50ZXJuYWwu
aCINCj4gICANCj4gICAvKg0KPiAtICogU29tZSB1c2Vyc3BhY2UgcmVuZGVyaW5nIGxvb3Bz
IHJ1bnMgYWxsIGRpc3BsYXlzIGluIHRoZSBzYW1lIGxvb3AuDQo+ICsgKiBTb21lIHVzZXJz
cGFjZSByZW5kZXJpbmcgbG9vcHMgcnVuIGFsbCBkaXNwbGF5cyBpbiB0aGUgc2FtZSBsb29w
Lg0KPiAgICAqIFRoaXMgbWVhbnMgdGhhdCBhIGZhc3QgZGlzcGxheSB3aWxsIGhhdmUgdG8g
d2FpdCBmb3IgYSBzbG93IG9uZS4NCj4gLSAqIEZvciB0aGlzIHJlYXNvbiBndWQgZG9lcyBm
bHVzaGluZyBhc3luY2hyb25vdXMgYnkgZGVmYXVsdC4NCj4gLSAqIFRoZSBkb3duIHNpZGUg
aXMgdGhhdCBpbiBlLmcuIGEgc2luZ2xlIGRpc3BsYXkgc2V0dXAgdXNlcnNwYWNlIHRoaW5r
cw0KPiAtICogdGhlIGRpc3BsYXkgaXMgaW5zYW5lbHkgZmFzdCBzaW5jZSB0aGUgZHJpdmVy
IHJlcG9ydHMgYmFjayBpbW1lZGlhdGVseQ0KPiAtICogdGhhdCB0aGUgZmx1c2gvcGFnZWZs
aXAgaXMgZG9uZS4gVGhpcyB3YXN0ZXMgQ1BVIGFuZCBwb3dlci4NCj4gLSAqIFN1Y2ggdXNl
cnMgbWlnaHQgd2FudCB0byBzZXQgdGhpcyBtb2R1bGUgcGFyYW1ldGVyIHRvIGZhbHNlLg0K
PiArICogU3VjaCB1c2VycyBtaWdodCB3YW50IHRvIGVuYWJsZSB0aGlzIG1vZHVsZSBwYXJh
bWV0ZXIuDQo+ICAgICovDQo+IC1zdGF0aWMgYm9vbCBndWRfYXN5bmNfZmx1c2ggPSB0cnVl
Ow0KPiArc3RhdGljIGJvb2wgZ3VkX2FzeW5jX2ZsdXNoOw0KPiAgIG1vZHVsZV9wYXJhbV9u
YW1lZChhc3luY19mbHVzaCwgZ3VkX2FzeW5jX2ZsdXNoLCBib29sLCAwNjQ0KTsNCj4gLU1P
RFVMRV9QQVJNX0RFU0MoYXN5bmNfZmx1c2gsICJFbmFibGUgYXN5bmNocm9ub3VzIGZsdXNo
aW5nIFtkZWZhdWx0PXRydWVdIik7DQo+ICtNT0RVTEVfUEFSTV9ERVNDKGFzeW5jX2ZsdXNo
LCAiRW5hYmxlIGFzeW5jaHJvbm91cyBmbHVzaGluZyBbZGVmYXVsdD0wXSIpOw0KPiAgIA0K
PiAgIC8qDQo+ICAgICogRklYTUU6IFRoZSBkcml2ZXIgaXMgcHJvYmFibHkgYnJva2VuIG9u
IEJpZyBFbmRpYW4gbWFjaGluZXMuDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------nntQqSrxCqN4Dg4Wu4kPm0ou--

--------------d4k2JfWaSjVHdrZfAy2Ag7ji
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOIbIYFAwAAAAAACgkQlh/E3EQov+Dh
0A/+IT/UaD1KGNgq0nyJFzJySfpcz2lRJEukqEH0d2RCcU2V0EBast8xZsqygaXwVRZFDMKWl5Oj
iEmEF63ahWErAzcDRxb3oS2VakbKhcJsh7NhLz+b0nr3su7rWbwXRnCtFkPYxeiv0+ObHh/lkoNC
sAp0c5mIQ8ZsfL8Ihz4UpcX2RMtzHsMT3yHkPf7i2qBiPRHw3fX58eS8KBh/DDbNiBQfWFpwHKkA
SfjNcO69ofb6nmxqoBcSse8m5fG/uQmIUZrXGPqRmSU/EobmzUHzwA5231NbwlRljfJHF/kWgxPg
tU+D6lWIeHLapiGdJUiOxxa7/TYLzyO+QPEje4LVFYUK70DkqEf0sKiTn0RrEJNP4il7K3a31uht
wN0H7WBWmK+N2rnjQTqkZ4PoFBGIzVN503d39vyUFl2CRDyF7ghWBbIVBiqCPJmOx0Evqghn++xA
ZXkcl+1Yij6fy7NUTAM3lrNl1QVyYK6UR+P8zvwsLW25UJpqEPymQjU1++JBhEoW9YbOPrYGcThN
uCI9dHqLdPha8QWHRMNI7Qhdms545rMiREYNZuOA+U+MAXBE7pd3CF7mc7dVlryr8jZ+JkjppTbR
vWa/o0Gj8bz7Rm9hyDa9aiZNCplvpTPa9xkkLDTTY4MtjmDds+MiU7noGj8w6QEiu/XKkWTeZaQW
ef4=
=oqky
-----END PGP SIGNATURE-----

--------------d4k2JfWaSjVHdrZfAy2Ag7ji--
