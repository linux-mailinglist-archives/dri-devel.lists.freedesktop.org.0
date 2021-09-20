Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 795C64110AA
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 10:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 496A36E40F;
	Mon, 20 Sep 2021 08:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B09836E40F
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 08:08:17 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E0F5E1FE4E;
 Mon, 20 Sep 2021 08:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632125295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WXwsKgj5/ro1PaVCEa4Ba2KKwMVMaBzR9LttcsU0IBk=;
 b=AsnmsSI635nygg9pgcD6qSCkPh0s0cvLfNaD1BhgbckN2ZmYXOnx1z4VGTPehD33kd/13G
 o2XBzcuGxgXF7SShAr48Ue2jebotaHnmbGxzlvexVQhYvUESCsrnWELFjS0i8j6z5Tpr8t
 5AIsQ4L0uPXJwoT9mMpTcD//H6xjFyU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632125295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WXwsKgj5/ro1PaVCEa4Ba2KKwMVMaBzR9LttcsU0IBk=;
 b=AfyZ4GRAiH9lnYSq2RJFBEqjcPvuLLfPljw34YriTm+YxziVKHSSY2VGJ/qVDJWRXTXd7u
 Fl7IaSgCS2+sjKBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB34D13ACC;
 Mon, 20 Sep 2021 08:08:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RuSzLG9BSGEUEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Sep 2021 08:08:15 +0000
Message-ID: <19bf684a-ebea-a831-4729-e1e33e146ce2@suse.de>
Date: Mon, 20 Sep 2021 10:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH] drm/bridge: Move devm_drm_of_get_bridge to bridge/panel.c
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20210917180925.2602266-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20210917180925.2602266-1-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vnascrOdQa2MgaG4qMoDBFp7"
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
--------------vnascrOdQa2MgaG4qMoDBFp7
Content-Type: multipart/mixed; boundary="------------KUZj2IooCL1rU2QiW0zyAHQA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <19bf684a-ebea-a831-4729-e1e33e146ce2@suse.de>
Subject: Re: [PATCH] drm/bridge: Move devm_drm_of_get_bridge to bridge/panel.c
References: <20210917180925.2602266-1-maxime@cerno.tech>
In-Reply-To: <20210917180925.2602266-1-maxime@cerno.tech>

--------------KUZj2IooCL1rU2QiW0zyAHQA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE3LjA5LjIxIHVtIDIwOjA5IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gQnkg
ZGVwZW5kaW5nIG9uIGRldm1fZHJtX3BhbmVsX2JyaWRnZV9hZGQoKSwgZGV2bV9kcm1fb2Zf
Z2V0X2JyaWRnZSgpDQo+IGludHJvZHVjZXMgYSBjaXJjdWxhciBkZXBlbmRlbmN5IGJldHdl
ZW4gdGhlIG1vZHVsZXMgZHJtICh3aGVyZQ0KPiBkZXZtX2RybV9vZl9nZXRfYnJpZGdlKCkg
ZW5kcyB1cCkgYW5kIGRybV9rbXNfaGVscGVyICh3aGVyZQ0KPiBkZXZtX2RybV9wYW5lbF9i
cmlkZ2VfYWRkKCkgaXMpLg0KPiANCj4gRml4IHRoaXMgYnkgbW92aW5nIGRldm1fZHJtX29m
X2dldF9icmlkZ2UoKSB0byBicmlkZ2UvcGFuZWwuYyBhbmQgdGh1cw0KPiBkcm1fa21zX2hl
bHBlci4NCj4gDQo+IEZpeGVzOiA4N2VhOTU4MDhkNTMgKCJkcm0vYnJpZGdlOiBBZGQgYSBm
dW5jdGlvbiB0byBhYnN0cmFjdCBhd2F5IHBhbmVscyIpDQo+IFJlcG9ydGVkLWJ5OiBTdGVw
aGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4NCj4gU2lnbmVkLW9mZi1ieTog
TWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+DQoNCkFja2VkLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiANCj4gLS0tDQo+IA0KPiBI
aSBTdGVwaGVuLA0KPiANCj4gSSB0aGluayBpdCBmaXhlcyB0aGUgaXNzdWUsIGJ1dCBjb3Vs
ZG4ndCByZXByb2R1Y2UgaXQgaGVyZSB3aXRoIG15DQo+IGNvbmZpZyBmb3Igc29tZSByZWFz
b24uDQo+IA0KPiBMZXQgbWUga25vdyBpZiBpdCB3b3JrcyBmb3IgeW91Lg0KPiANCj4gTWF4
aW1lDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvcGFuZWwuYyB8IDM2ICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2JyaWRnZS5jICAgfCAzNCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygrKSwgMzQgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jDQo+IGluZGV4IGM5MTZmNGI4OTA3ZS4u
Mjg1YTA3OWNkZWY1IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3Bh
bmVsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9wYW5lbC5jDQo+IEBAIC0z
MzIsMyArMzMyLDM5IEBAIHN0cnVjdCBkcm1fY29ubmVjdG9yICpkcm1fcGFuZWxfYnJpZGdl
X2Nvbm5lY3RvcihzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQ0KPiAgIAlyZXR1cm4gJnBh
bmVsX2JyaWRnZS0+Y29ubmVjdG9yOw0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKGRybV9w
YW5lbF9icmlkZ2VfY29ubmVjdG9yKTsNCj4gKw0KPiArI2lmZGVmIENPTkZJR19PRg0KPiAr
LyoqDQo+ICsgKiBkZXZtX2RybV9vZl9nZXRfYnJpZGdlIC0gUmV0dXJuIG5leHQgYnJpZGdl
IGluIHRoZSBjaGFpbg0KPiArICogQGRldjogZGV2aWNlIHRvIHRpZSB0aGUgYnJpZGdlIGxp
ZmV0aW1lIHRvDQo+ICsgKiBAbnA6IGRldmljZSB0cmVlIG5vZGUgY29udGFpbmluZyBlbmNv
ZGVyIG91dHB1dCBwb3J0cw0KPiArICogQHBvcnQ6IHBvcnQgaW4gdGhlIGRldmljZSB0cmVl
IG5vZGUNCj4gKyAqIEBlbmRwb2ludDogZW5kcG9pbnQgaW4gdGhlIGRldmljZSB0cmVlIG5v
ZGUNCj4gKyAqDQo+ICsgKiBHaXZlbiBhIERUIG5vZGUncyBwb3J0IGFuZCBlbmRwb2ludCBu
dW1iZXIsIGZpbmRzIHRoZSBjb25uZWN0ZWQgbm9kZQ0KPiArICogYW5kIHJldHVybnMgdGhl
IGFzc29jaWF0ZWQgYnJpZGdlIGlmIGFueSwgb3IgY3JlYXRlcyBhbmQgcmV0dXJucyBhDQo+
ICsgKiBkcm0gcGFuZWwgYnJpZGdlIGluc3RhbmNlIGlmIGEgcGFuZWwgaXMgY29ubmVjdGVk
Lg0KPiArICoNCj4gKyAqIFJldHVybnMgYSBwb2ludGVyIHRvIHRoZSBicmlkZ2UgaWYgc3Vj
Y2Vzc2Z1bCwgb3IgYW4gZXJyb3IgcG9pbnRlcg0KPiArICogb3RoZXJ3aXNlLg0KPiArICov
DQo+ICtzdHJ1Y3QgZHJtX2JyaWRnZSAqZGV2bV9kcm1fb2ZfZ2V0X2JyaWRnZShzdHJ1Y3Qg
ZGV2aWNlICpkZXYsDQo+ICsJCQkJCSAgc3RydWN0IGRldmljZV9ub2RlICpucCwNCj4gKwkJ
CQkJICB1MzIgcG9ydCwgdTMyIGVuZHBvaW50KQ0KPiArew0KPiArCXN0cnVjdCBkcm1fYnJp
ZGdlICpicmlkZ2U7DQo+ICsJc3RydWN0IGRybV9wYW5lbCAqcGFuZWw7DQo+ICsJaW50IHJl
dDsNCj4gKw0KPiArCXJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShucCwgcG9y
dCwgZW5kcG9pbnQsDQo+ICsJCQkJCSAgJnBhbmVsLCAmYnJpZGdlKTsNCj4gKwlpZiAocmV0
KQ0KPiArCQlyZXR1cm4gRVJSX1BUUihyZXQpOw0KPiArDQo+ICsJaWYgKHBhbmVsKQ0KPiAr
CQlicmlkZ2UgPSBkZXZtX2RybV9wYW5lbF9icmlkZ2VfYWRkKGRldiwgcGFuZWwpOw0KPiAr
DQo+ICsJcmV0dXJuIGJyaWRnZTsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0woZGV2bV9kcm1f
b2ZfZ2V0X2JyaWRnZSk7DQo+ICsjZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYnJpZGdlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jDQo+IGlu
ZGV4IDRjNjg3MzNmYTY2MC4uN2VlMjlmMDczODU3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2JyaWRnZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJp
ZGdlLmMNCj4gQEAgLTEyMzIsNDAgKzEyMzIsNiBAQCBzdHJ1Y3QgZHJtX2JyaWRnZSAqb2Zf
ZHJtX2ZpbmRfYnJpZGdlKHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApDQo+ICAgCXJldHVybiBO
VUxMOw0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKG9mX2RybV9maW5kX2JyaWRnZSk7DQo+
IC0NCj4gLS8qKg0KPiAtICogZGV2bV9kcm1fb2ZfZ2V0X2JyaWRnZSAtIFJldHVybiBuZXh0
IGJyaWRnZSBpbiB0aGUgY2hhaW4NCj4gLSAqIEBkZXY6IGRldmljZSB0byB0aWUgdGhlIGJy
aWRnZSBsaWZldGltZSB0bw0KPiAtICogQG5wOiBkZXZpY2UgdHJlZSBub2RlIGNvbnRhaW5p
bmcgZW5jb2RlciBvdXRwdXQgcG9ydHMNCj4gLSAqIEBwb3J0OiBwb3J0IGluIHRoZSBkZXZp
Y2UgdHJlZSBub2RlDQo+IC0gKiBAZW5kcG9pbnQ6IGVuZHBvaW50IGluIHRoZSBkZXZpY2Ug
dHJlZSBub2RlDQo+IC0gKg0KPiAtICogR2l2ZW4gYSBEVCBub2RlJ3MgcG9ydCBhbmQgZW5k
cG9pbnQgbnVtYmVyLCBmaW5kcyB0aGUgY29ubmVjdGVkIG5vZGUNCj4gLSAqIGFuZCByZXR1
cm5zIHRoZSBhc3NvY2lhdGVkIGJyaWRnZSBpZiBhbnksIG9yIGNyZWF0ZXMgYW5kIHJldHVy
bnMgYQ0KPiAtICogZHJtIHBhbmVsIGJyaWRnZSBpbnN0YW5jZSBpZiBhIHBhbmVsIGlzIGNv
bm5lY3RlZC4NCj4gLSAqDQo+IC0gKiBSZXR1cm5zIGEgcG9pbnRlciB0byB0aGUgYnJpZGdl
IGlmIHN1Y2Nlc3NmdWwsIG9yIGFuIGVycm9yIHBvaW50ZXINCj4gLSAqIG90aGVyd2lzZS4N
Cj4gLSAqLw0KPiAtc3RydWN0IGRybV9icmlkZ2UgKmRldm1fZHJtX29mX2dldF9icmlkZ2Uo
c3RydWN0IGRldmljZSAqZGV2LA0KPiAtCQkJCQkgIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnAs
DQo+IC0JCQkJCSAgdTMyIHBvcnQsIHUzMiBlbmRwb2ludCkNCj4gLXsNCj4gLQlzdHJ1Y3Qg
ZHJtX2JyaWRnZSAqYnJpZGdlOw0KPiAtCXN0cnVjdCBkcm1fcGFuZWwgKnBhbmVsOw0KPiAt
CWludCByZXQ7DQo+IC0NCj4gLQlyZXQgPSBkcm1fb2ZfZmluZF9wYW5lbF9vcl9icmlkZ2Uo
bnAsIHBvcnQsIGVuZHBvaW50LA0KPiAtCQkJCQkgICZwYW5lbCwgJmJyaWRnZSk7DQo+IC0J
aWYgKHJldCkNCj4gLQkJcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4gLQ0KPiAtCWlmIChwYW5l
bCkNCj4gLQkJYnJpZGdlID0gZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2FkZChkZXYsIHBhbmVs
KTsNCj4gLQ0KPiAtCXJldHVybiBicmlkZ2U7DQo+IC19DQo+IC1FWFBPUlRfU1lNQk9MKGRl
dm1fZHJtX29mX2dldF9icmlkZ2UpOw0KPiAgICNlbmRpZg0KPiAgIA0KPiAgIE1PRFVMRV9B
VVRIT1IoIkFqYXkgS3VtYXIgPGFqYXlrdW1hci5yc0BzYW1zdW5nLmNvbT4iKTsNCj4gDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo=

--------------KUZj2IooCL1rU2QiW0zyAHQA--

--------------vnascrOdQa2MgaG4qMoDBFp7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFIQW8FAwAAAAAACgkQlh/E3EQov+C/
mhAAqMxmfYCu6wqax6AW2ui3Wq2im3BEiW/fpcfeCbUbY9STaVQC8P/kAMDNfBNDJive8unMe2Ot
Gv/6IZySYnDvEk3VFqDMiwko0NoQroW6jD+cfJlVKbJ21N4AtLuZIRsky8vm0i3p6ImBcUQ5j1mP
s0L6qjhPW0Qa9FV7k4VGBdo1PdflxjMGDKIiBRgj2Ltro0eZJkkV75Rfyy9EVC3kz+qRmxOMtNnD
BgfVx+M7vaof8ZyflHhMWpgpYDt8PQcr4ZvlYzWWd7TJSOtswuyzrdQl4BQbKc4scURRdcA4Divb
2T70dPMPMuE4vefa3rnhOXFJBcQmMe3V44xtnkBbBKWXQiRILX7/pM0N34XsRrTnAntG00E4/3nd
w9afxVIhJEpVY+/+klf1sNx8/OOehSRpz7VYxSG5pFamuNwwkFCCEuDqZPEt1S+9eg8bcJNmOxYm
RBl/Kdn5lUninAFzL1Cx4kV65XVBtQX9/+AODeHd/s3TYTL4r5kM5mr0Q+iFT6qWrG7pK/50Wriz
xpcs4GTKUrLJXyL5mkq2XfkxwZm1b1eFcc/R5VT+3NYCaGWthJIaHRmMTGnmRljuFMNunmdUGFVz
tFs2P3lwBFkKsWlaXi3gnVQT7l2O2/EWZtMQ54+X8nrhdnSMWS3R4yek71V++BarxBiNbzJov3RW
3sU=
=ArTP
-----END PGP SIGNATURE-----

--------------vnascrOdQa2MgaG4qMoDBFp7--
