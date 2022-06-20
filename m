Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD26055167B
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 13:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F60711345E;
	Mon, 20 Jun 2022 11:01:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA3BF11345C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 11:01:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FFE81F8C8;
 Mon, 20 Jun 2022 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655722892; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f822+7zamMVR8q3q6g8aAoUMWJod+ZXoNr5uM/IbA+c=;
 b=cP+CFQVkFmaTaIlKrBWI77pTqGcZ8VRIFjTz+vc7s0v7k+qyHT7giI1/2lxVwwJFelwoM1
 /BLqx2qOGRiZDI5HMPfW5OAUZhN/KqNbzvklQSDqEUDY2wwLsDvnJCo8BDCZx055VYVF/s
 WBab3mR5IQm8DoeC37YHUZ4bR7rkDBE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655722892;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f822+7zamMVR8q3q6g8aAoUMWJod+ZXoNr5uM/IbA+c=;
 b=9H3E+GlkDyeFdxus/4/1T3ElWLYqdOwe6HFMZjo8qlCPdFbGtLXCnzGkyLdg0E0I5mwNxa
 7bqU46CI4WRxUxDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 321DE13638;
 Mon, 20 Jun 2022 11:01:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id C3JrC4xTsGLDcwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 11:01:32 +0000
Message-ID: <708064f2-3c68-cfa3-56d4-69405f433170@suse.de>
Date: Mon, 20 Jun 2022 13:01:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 34/64] drm/vc4: hdmi: Switch to drmm_kzalloc
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-35-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220610092924.754942-35-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RhrCY6ycoXh2VHX3mRbDGyDH"
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
--------------RhrCY6ycoXh2VHX3mRbDGyDH
Content-Type: multipart/mixed; boundary="------------300fTSIBp0AvfU5dGyujcik7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <708064f2-3c68-cfa3-56d4-69405f433170@suse.de>
Subject: Re: [PATCH 34/64] drm/vc4: hdmi: Switch to drmm_kzalloc
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-35-maxime@cerno.tech>
In-Reply-To: <20220610092924.754942-35-maxime@cerno.tech>

--------------300fTSIBp0AvfU5dGyujcik7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEwLjA2LjIyIHVtIDExOjI4IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gT3Vy
IGludGVybmFsIHN0cnVjdHVyZSB0aGF0IHN0b3JlcyB0aGUgRFJNIGVudGl0aWVzIHN0cnVj
dHVyZSBpcyBhbGxvY2F0ZWQNCj4gdGhyb3VnaCBhIGRldmljZS1tYW5hZ2VkIGt6YWxsb2Mu
DQo+IA0KPiBUaGlzIG1lYW5zIHRoYXQgdGhpcyB3aWxsIGV2ZW50dWFsbHkgYmUgZnJlZWQg
d2hlbmV2ZXIgdGhlIGRldmljZSBpcw0KPiByZW1vdmVkLiBJbiBvdXIgY2FzZSwgdGhlIG1v
c3QgbGlrZSBzb3VyY2Ugb2YgcmVtb3ZhbCBpcyB0aGF0IHRoZSBtYWluDQoNCidtb3N0IGxp
a2VseSBzb3VyY2UnDQoNCj4gZGV2aWNlIGlzIGdvaW5nIHRvIGJlIHVuYm91bmQsIGFuZCBj
b21wb25lbnRfdW5iaW5kX2FsbCgpIGlzIGJlaW5nIHJ1bi4NCj4gDQo+IEhvd2V2ZXIsIGl0
IG9jY3VycyB3aGlsZSB0aGUgRFJNIGRldmljZSBpcyBzdGlsbCByZWdpc3RlcmVkLCB3aGlj
aCB3aWxsDQo+IGNyZWF0ZSBkYW5nbGluZyBwb2ludGVycywgZXZlbnR1YWxseSByZXN1bHRp
bmcgaW4gdXNlLWFmdGVyLWZyZWUuDQo+IA0KPiBTd2l0Y2ggdG8gYSBEUk0tbWFuYWdlZCBh
bGxvY2F0aW9uIHRvIGtlZXAgb3VyIHN0cnVjdHVyZSB1bnRpbCB0aGUgRFJNDQo+IGRyaXZl
ciBkb2Vzbid0IG5lZWQgaXQgYW55bW9yZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1heGlt
ZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9k
cm0vdmM0L3ZjNF9oZG1pLmMgfCAzICsrLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmM0L3ZjNF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9oZG1pLmMN
Cj4gaW5kZXggNmFhZGI2NWViNjQwLi5lYjhmZjdiMjU4ZDEgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
dmM0L3ZjNF9oZG1pLmMNCj4gQEAgLTI4MzMsOSArMjgzMywxMCBAQCBzdGF0aWMgaW50IHZj
NF9oZG1pX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICptYXN0ZXIs
IHZvaWQgKmRhdGEpDQo+ICAgCXN0cnVjdCBkZXZpY2Vfbm9kZSAqZGRjX25vZGU7DQo+ICAg
CWludCByZXQ7DQo+ICAgDQo+IC0JdmM0X2hkbWkgPSBkZXZtX2t6YWxsb2MoZGV2LCBzaXpl
b2YoKnZjNF9oZG1pKSwgR0ZQX0tFUk5FTCk7DQo+ICsJdmM0X2hkbWkgPSBkcm1tX2t6YWxs
b2MoZHJtLCBzaXplb2YoKnZjNF9oZG1pKSwgR0ZQX0tFUk5FTCk7DQo+ICAgCWlmICghdmM0
X2hkbWkpDQo+ICAgCQlyZXR1cm4gLUVOT01FTTsNCj4gKw0KPiAgIAltdXRleF9pbml0KCZ2
YzRfaGRtaS0+bXV0ZXgpOw0KPiAgIAlzcGluX2xvY2tfaW5pdCgmdmM0X2hkbWktPmh3X2xv
Y2spOw0KPiAgIAlJTklUX0RFTEFZRURfV09SSygmdmM0X2hkbWktPnNjcmFtYmxpbmdfd29y
aywgdmM0X2hkbWlfc2NyYW1ibGluZ193cSk7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQoo
SFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2
DQo=

--------------300fTSIBp0AvfU5dGyujcik7--

--------------RhrCY6ycoXh2VHX3mRbDGyDH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwU4sFAwAAAAAACgkQlh/E3EQov+DF
3g/+Id7vkDFOUwvHxy53h7ka0RJG78pd7a+T5rDZMX5K3H4EL+T/vcqo7VTKf6gvTqqurzxloRWY
AT72gMTGrNrx1BJkWedMBnIMm6Qclaev3WP4P+jHrm4dT6tFYVPzQSC+GrC4vxEylgHi+++Fe4xl
z+DgcvJ8bs1rs7CVTBKcNe+jbVifpbcilJ0elRfonJU7zwlGbfuvSuUnUeh8viRccYgAsQz+qVis
xKzEMHbLf9xvMPf6s5w2WaWnDxNQGKEQSVcnhLfAkK8ELkfjKOxoZSIYY/r1nehOca8R9t7Zr6jw
jp2ABu0zimTS0b8lajImG6MEVsZInUrf2xVf4OZIN3V7p9p6I82P3Zi8/uEe/mvUn2Na62QY11UT
9kl6/LMn+rfTVWtaBIFofhAUM/YRdtPgLSBlSWlZCxw0v7B3NdmHD1LNLjaAzyJwMlCTK3ElxYx7
AfxyjWm3H5+StVFnXuRhlKGs/YCDi6xlcP5yTYfcKHffG8L/EWpsYeSffW/R0zYRgEuXdSARsHv8
qZCmSbjYynhqGNG5l6Fdwwc6NP7JWCtq4PAiVCpE+sQ4DGh8zIOO5vpx4tZvYvfrOVglpPVPqeL/
GfhqylUXnNf4m1iMICm5gQZZxmn5APNeYyuoT+nYovOa/xCz+r6s4dmBlflwE1af1W5xbeMmwS0r
ViU=
=sxTJ
-----END PGP SIGNATURE-----

--------------RhrCY6ycoXh2VHX3mRbDGyDH--
