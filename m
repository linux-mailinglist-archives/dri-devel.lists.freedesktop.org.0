Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC381519CA4
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 12:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFE010E7F0;
	Wed,  4 May 2022 10:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3AA10E7F0
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 10:12:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E78E21F88A;
 Wed,  4 May 2022 10:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651659169; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TaDkM2qaPM4VLoklRk/NEvIeXiIFsdjOvD8r1UOfJfE=;
 b=my0xyZi4xFG8khu8n/5pUmTJwFyWyYnLroB7wf1YvU4t0MtDuE63UnptW4pLnfv2ZM+g3Y
 ZhIZeNspo5Bg0m4coAaiBYuTWKhGf4Fh5MvTSSjXASiWAS2BsH6vyby2DJ1RB4phiWZgGD
 gIiiQr+YIvqDKDKVOPhV0COTbr92W3Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651659169;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TaDkM2qaPM4VLoklRk/NEvIeXiIFsdjOvD8r1UOfJfE=;
 b=lyYhFFX8wLV/DvJyPv8od5m1DumeEe7wsHeYimNbj1HHhb8ECNSRvhUBPVosK0e+46wBRU
 lKd7uQRLwEPHD+Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CE6BF131BD;
 Wed,  4 May 2022 10:12:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WWXAMKFRcmJyHQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 04 May 2022 10:12:49 +0000
Message-ID: <4ab30b5c-9c47-c31c-a719-3413ccffcaa4@suse.de>
Date: Wed, 4 May 2022 12:12:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/4] mgag200: remove unused flag
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
References: <20220426164108.1051295-1-jfalempe@redhat.com>
 <20220426164108.1051295-4-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220426164108.1051295-4-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------WX0lL42egz0ozxRy5zgxINeO"
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------WX0lL42egz0ozxRy5zgxINeO
Content-Type: multipart/mixed; boundary="------------yZEk7N4tMtUM0Y0FXJvrp4CM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Cc: michel@daenzer.net
Message-ID: <4ab30b5c-9c47-c31c-a719-3413ccffcaa4@suse.de>
Subject: Re: [PATCH 3/4] mgag200: remove unused flag
References: <20220426164108.1051295-1-jfalempe@redhat.com>
 <20220426164108.1051295-4-jfalempe@redhat.com>
In-Reply-To: <20220426164108.1051295-4-jfalempe@redhat.com>

--------------yZEk7N4tMtUM0Y0FXJvrp4CM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDQuMjIgdW0gMTg6NDEgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IFRoZSBmbGFnIE1HQUcyMDBfRkxBR19IV19CVUdfTk9fU1RBUlRBREQgaXMgbm8gbW9yZSB1
c2VkLCBiZWNhdXNlDQo+IHRoZSBmcmFtZWJ1ZmZlciBpcyBub3cgYWx3YXlzIGF0IG9mZnNl
dCAwLg0KDQpPaCwgd2VsbC4gSSByZW1lbWJlciB0aGF0IHRoaW5nLiBJdCB0b29rIHVzIGEg
bG9uZyB0aW1lIHRvIGZpbmQgYW5kIGZpeCANCnRoaXMgcHJvYmxlbS4gQmFjayB0aGVuLCBt
Z2FnMjAwIHN0aWxsIHVzZWQgVlJBTSBoZWxwZXJzLCB3aGljaCBkbyBwYWdlIA0KZmxpcHBp
bmcgaW4gdmlkZW8gbWVtb3J5LiBEaXNwbGF5cyByZW1haW5lZCBkYXJrIG9uIHNvbWUgc3lz
dGVtcyB3aXRob3V0IA0KYW55IGNsZWFyIGNhdXNlLiBXZSBhZGRlZCB0aGUgZmxhZyB0byB3
b3JrIGFyb3VuZCB0aGUgYnJva2VuIEhXLg0KDQpJIGxlZnQgdGhlIGZsYWcgaW4gZm9yIHJl
ZmVyZW5jZS4gSW5zdGVhZCBvZiByZW1vdmluZyBpdCwgSSB0aGluayB3ZSANCnNob3VsZCBh
ZGQgYSBkcm1fV0FSTl9PTl9PTkNFKCkgaW4gbWdhZzIwMF9zZXRfc3RhcnRfYWRkKCkgaWYg
dGhlIGZsYWcgDQppcyBzZXQgYW5kIG9mZnNldCBpcyBub24temVyby4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSm9jZWx5biBGYWxlbXBlIDxq
ZmFsZW1wZUByZWRoYXQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX2Rydi5jIHwgMyArLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9t
Z2FnMjAwX2Rydi5oIHwgMyAtLS0NCj4gICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2Fn
MjAwX2Rydi5jDQo+IGluZGV4IDIxNzg0NGQ3MWFiNS4uODY1OWUxY2E4MDA5IDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX2Rydi5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmMNCj4gQEAgLTMwNiw4ICsz
MDYsNyBAQCBtZ2FnMjAwX2RldmljZV9jcmVhdGUoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGVu
dW0gbWdhX3R5cGUgdHlwZSwgdW5zaWduZWQgbG9uZyBmbA0KPiAgIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcGNpX2RldmljZV9pZCBtZ2FnMjAwX3BjaWlkbGlzdFtdID0gew0KPiAgIAl7IFBD
SV9WRU5ET1JfSURfTUFUUk9YLCAweDUyMCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwg
MCwgRzIwMF9QQ0kgfSwNCj4gICAJeyBQQ0lfVkVORE9SX0lEX01BVFJPWCwgMHg1MjEsIFBD
SV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIEcyMDBfQUdQIH0sDQo+IC0JeyBQQ0lfVkVO
RE9SX0lEX01BVFJPWCwgMHg1MjIsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsDQo+
IC0JCUcyMDBfU0VfQSB8IE1HQUcyMDBfRkxBR19IV19CVUdfTk9fU1RBUlRBRER9LA0KPiAr
CXsgUENJX1ZFTkRPUl9JRF9NQVRST1gsIDB4NTIyLCBQQ0lfQU5ZX0lELCBQQ0lfQU5ZX0lE
LCAwLCAwLCBHMjAwX1NFX0EgfSwNCj4gICAJeyBQQ0lfVkVORE9SX0lEX01BVFJPWCwgMHg1
MjQsIFBDSV9BTllfSUQsIFBDSV9BTllfSUQsIDAsIDAsIEcyMDBfU0VfQiB9LA0KPiAgIAl7
IFBDSV9WRU5ET1JfSURfTUFUUk9YLCAweDUzMCwgUENJX0FOWV9JRCwgUENJX0FOWV9JRCwg
MCwgMCwgRzIwMF9FViB9LA0KPiAgIAl7IFBDSV9WRU5ET1JfSURfTUFUUk9YLCAweDUzMiwg
UENJX0FOWV9JRCwgUENJX0FOWV9JRCwgMCwgMCwgRzIwMF9XQiB9LA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYuaCBiL2RyaXZlcnMvZ3B1
L2RybS9tZ2FnMjAwL21nYWcyMDBfZHJ2LmgNCj4gaW5kZXggNDM2ODExMjAyM2Y3Li5jN2I2
ZGM3NzFhYjMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcy
MDBfZHJ2LmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9kcnYu
aA0KPiBAQCAtMjAxLDkgKzIwMSw2IEBAIGVudW0gbWdhX3R5cGUgew0KPiAgIAlHMjAwX0VX
MywNCj4gICB9Ow0KPiAgIA0KPiAtLyogSFcgZG9lcyBub3QgaGFuZGxlICdzdGFydGFkZCcg
ZmllbGQgY29ycmVjdC4gKi8NCj4gLSNkZWZpbmUgTUdBRzIwMF9GTEFHX0hXX0JVR19OT19T
VEFSVEFERAkoMXVsIDw8IDgpDQo+IC0NCj4gICAjZGVmaW5lIE1HQUcyMDBfVFlQRV9NQVNL
CSgweDAwMDAwMGZmKQ0KPiAgICNkZWZpbmUgTUdBRzIwMF9GTEFHX01BU0sJKDB4MDBmZmZm
MDApDQo+ICAgDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xy
bmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------yZEk7N4tMtUM0Y0FXJvrp4CM--

--------------WX0lL42egz0ozxRy5zgxINeO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJyUaEFAwAAAAAACgkQlh/E3EQov+A6
shAAkaSLdUzT7yn6VJWr0PDLdYb4OhXbl99emLcRCzutMzAmWlBcfdeYN7ci6Yb+KBDSyHrjcmY7
+9YEg51aITTH2AWffyTlPeHJJOONwf9zsrh4bqR4J66rLhOprk/5Jfk1T6uOfcJJHPRbvHya0Sxx
0u47Ncna59RbusSCfCx4zmzhobYALHB3IDYk5tciBRQB7Gl+vhxpw+ZqGQ5kLmVRhnHX9dqFxrXC
RaBjpCiCALvJ8S9Ait7bTHYV3UbHFESmcSNC3DIPKkcpeh6UAg9jbGVnAAbWxMRMzcVkdBh5tsRi
gWibhT0k8dr0VA+2skzzLYY83hTjM8Y6fs5IhHNjwjaBhUy/01EZ3gNtXvTSHSAd0dX1uveb7mQa
d6XjtFBEu2Mn3OfweCNbnFCVN11ZC0TbecVCGTL3xrCgDvPgoNIXjUYJfov7a+L0a0IDYRo9/BSB
BNVz0ePXUbI9xtwgAmL164WbjHas0h8UKE4hJwJL9jA0SAalpyRKjBe6ZK7MKVd3s2EDw8VP8kFB
95wp4i8Na0ERh1LTeSPa+FXJeDsvswshgSu5MB80U+Gjp1zdyisGtxjvoLuTtPeFdRWmP2YRD+pS
b8FcUxm+8Vx2PlmmCct5D8bRKmo7QGppxkjfdGK8ud8yRtlvskH7PtOkmWBJH5nR51ZaWxV21Daz
UZU=
=4uv3
-----END PGP SIGNATURE-----

--------------WX0lL42egz0ozxRy5zgxINeO--
