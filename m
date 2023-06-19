Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E47734E9C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:52:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EEB910E1C2;
	Mon, 19 Jun 2023 08:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2978610E1C2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 08:52:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 744E21F37C;
 Mon, 19 Jun 2023 08:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687164732; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kgc3NNGdkcsygXK3F6bkzRdZnxWwlpebZxuGTfMzQx8=;
 b=YEXTXEbmAMEsKPwx94rHQX9cdPoellDbiLlt4F+Oz2nBIGmKfVP/E4jC/Jck5YYoiOiVfp
 UHF9B/3+dZAxiCRjLkkVFd/8MGYi2+54EErDnYEDRRleGfDZWld+iavTon6Ss7cc1M4snR
 qwbKeK4rZrurP0OkQrkhcegFLOjmwws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687164732;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kgc3NNGdkcsygXK3F6bkzRdZnxWwlpebZxuGTfMzQx8=;
 b=F65RJqLlDNnuJoQxtSJQZMFp3TaoY4+oIlvN6ewJc8MBAIDFnhSwuea+9J/G9Doje/OaOT
 Vt4sdFB9B5Z03EBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 427D7138E8;
 Mon, 19 Jun 2023 08:52:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QUQ0DzwXkGSJHgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Jun 2023 08:52:12 +0000
Message-ID: <ce301097-471f-28d5-597c-9600dc049bac@suse.de>
Date: Mon, 19 Jun 2023 10:52:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/3] drm: Allow PRIME 'self-import' for all drivers
Content-Language: en-US
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, contact@emersion.fr, linux-graphics-maintainer@vmware.com
References: <20230615094206.4424-1-tzimmermann@suse.de>
 <3fe4fe6a-5dc7-3d8c-938f-99a771650067@quicinc.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3fe4fe6a-5dc7-3d8c-938f-99a771650067@quicinc.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YtdI38sdROSEOlulp0y36d0q"
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
--------------YtdI38sdROSEOlulp0y36d0q
Content-Type: multipart/mixed; boundary="------------TV73U0FhhWShpuUdqL7YuCIu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 zackr@vmware.com, contact@emersion.fr, linux-graphics-maintainer@vmware.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <ce301097-471f-28d5-597c-9600dc049bac@suse.de>
Subject: Re: [PATCH 0/3] drm: Allow PRIME 'self-import' for all drivers
References: <20230615094206.4424-1-tzimmermann@suse.de>
 <3fe4fe6a-5dc7-3d8c-938f-99a771650067@quicinc.com>
In-Reply-To: <3fe4fe6a-5dc7-3d8c-938f-99a771650067@quicinc.com>

--------------TV73U0FhhWShpuUdqL7YuCIu
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDYuMjMgdW0gMTk6MDAgc2NocmllYiBKZWZmcmV5IEh1Z286DQo+IE9u
IDYvMTUvMjAyMyAzOjMxIEFNLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IFNldCBk
cm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCgpIGFuZCBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hh
bmRsZSgpDQo+PiBmb3IgYWxsIERSTSBkcml2ZXJzLiBFdmVuIGRyaXZlcnMgdGhhdCBkbyBu
b3Qgc3VwcG9ydCBQUklNRSBpbXBvcnQNCj4+IG9yIGV4cG9ydCBvZiBkbWEtYnVmcyBjYW4g
bm93IGltcG9ydCB0aGVpciBvd24gYnVmZmVyIG9iamVjdHMuIFRoaXMNCj4+IGlzIHJlcXVp
cmVkIGJ5IHNvbWUgdXNlcnNwYWNlLCBzdWNoIGFzIHdscm9vdHMtYmFzZWQgY29tcG9zaXRv
cnMsIHRvDQo+PiBzaGFyZSBidWZmZXJzIGFtb25nIHByb2Nlc3Nlcy4NCj4+DQo+PiBUaGUg
b25seSBkcml2ZXIgdGhhdCBkb2VzIG5vdCB1c2UgdGhlIGRybV9nZW1fcHJpbWVfKigpIGhl
bHBlcnMgaXMNCj4+IHZtd2dmeC4gT25jZSBpdCBoYXMgYmVlbiBjb252ZXJ0ZWQsIHRoZSBj
YWxsYmFja3MgaW4gc3RydWN0IGRybV9kcml2ZXINCj4+IGNhbiBiZSByZW1vdmVkLg0KPj4N
Cj4+IFNpbW9uIFNlciBpbXBsZW1lbnRlZCB0aGUgZmVhdHVyZSBmb3IgZHJpdmVycyBiYXNl
ZCBvbiBHRU0gVlJBTSBoZWxwZXJzDQo+PiBpbiBbMV0uIFRoaXMgcGF0Y2hzZXQgZ2VuZXJh
bGl6ZXMgdGhlIGNvZGUgZm9yIGFsbCBkcml2ZXJzIHRoYXQgZG8gbm90DQo+PiBvdGhlcndp
c2Ugc3VwcG9ydCBQUklNRS4gVGVzdGVkIGJ5IHJ1bm5pbmcgc3dheSB3aXRoIGdtYTUwMCBo
YXJkd2FyZS4NCj4+DQo+PiBbMV0gDQo+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmkt
ZGV2ZWwvMjAyMzAzMDIxNDM1MDIuNTAwNjYxLTEtY29udGFjdEBlbWVyc2lvbi5mci8NCj4+
DQo+PiBUaG9tYXMgWmltbWVybWFubiAoMyk6DQo+PiDCoMKgIGRybTogRW5hYmxlIFBSSU1F
IGltcG9ydC9leHBvcnQgZm9yIGFsbCBkcml2ZXJzDQo+PiDCoMKgIGRybTogQ2xlYXIgZmQv
aGFuZGxlIGNhbGxiYWNrcyBpbiBzdHJ1Y3QgZHJtX2RyaXZlcg0KPj4gwqDCoCBkcm0vcHJp
bWU6IFVuZXhwb3J0IGhlbHBlcnMgZm9yIGZkL2hhbmRsZSBjb252ZXJzaW9uDQo+Pg0KPj4g
wqAgRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3TCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8IDE0ICsrKysrDQo+PiDCoCBkcml2ZXJzL2FjY2VsL2l2cHUvaXZw
dV9kcnYuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyIC0NCj4+IMKg
IGRyaXZlcnMvYWNjZWwvcWFpYy9xYWljX2Rydi5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgfMKgIDEgLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jwqDCoMKgwqDCoMKgIHzCoCAyIC0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9h
cm1hZGEvYXJtYWRhX2Rydi5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgLQ0KPj4gwqAg
ZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoCA0ICstDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA2MiArKysrKysrKysrLS0t
LS0tLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5jwqDC
oMKgwqDCoMKgwqDCoCB8wqAgMiAtDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZHJ2LmPCoMKgwqDCoMKgwqAgfMKgIDIgLQ0KPj4gwqAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvaTkxNV9kcml2ZXIuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgLQ0K
Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kcnYuY8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDIgLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kcm1fZHJ2LmPCoMKgwqDCoMKgwqDCoCB8wqAgMiAtDQo+PiDCoCBkcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9kcnYuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAy
IC0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZHJtLmPCoMKgwqDC
oMKgwqDCoMKgIHzCoCAyIC0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBf
ZHJ2LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyIC0NCj4+IMKgIGRyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9kcnYuY8KgwqDCoMKgwqDCoCB8wqAgMiAtDQo+PiDC
oCBkcml2ZXJzL2dwdS9kcm0vcGwxMTEvcGwxMTFfZHJ2LmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDIgLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfZHJ2LmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiAtDQo+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAyIC0N
Cj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3JjYXItZHUvcmNhcl9kdV9kcnYuYyB8
wqAgMiAtDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Ry
di5jwqDCoCB8wqAgMiAtDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgLQ0KPj4gwqAgZHJpdmVy
cy9ncHUvZHJtL3YzZC92M2RfZHJ2LmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCB8wqAgMiAtDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmPC
oMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL3hlbi94
ZW5fZHJtX2Zyb250LmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMiAtDQo+PiDCoCBpbmNs
dWRlL2RybS9kcm1fZHJ2LmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgfMKgIDYgKysNCj4+IMKgIGluY2x1ZGUvZHJtL2RybV9nZW1fZG1hX2hl
bHBlci5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMiArKy0tDQo+PiDCoCBpbmNs
dWRlL2RybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgNiArLQ0KPj4gwqAgaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5owqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICstDQo+PiDCoCBpbmNsdWRlL2RybS9kcm1fcHJp
bWUuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA3
IC0tLQ0KPj4gwqAgMzAgZmlsZXMgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKSwgOTYgZGVs
ZXRpb25zKC0pDQo+Pg0KPiANCj4gU3VyZWx5IHRoZSBtYWludGFpbmVycyBvZiB0aGUgMjIg
ZHJpdmVycyB0b3VjaGVkIGJ5IHRoaXMgc2VyaWVzIHNob3VsZCANCj4gYmUgaW4gdGhlIHRv
IGxpc3Qgb3Igc29tZXRoaW5nP8KgIFNwZWFraW5nIGZvciBteXNlbGYsIHRocmVhZHMgdGhh
dCANCj4gZGlyZWN0bHkgYWRkcmVzcyBtZSB0cmlnZ2VyIG15ICJwcmlvcml0eSIgZmlsdGVy
cy4NCg0KTXkgYXBvbG9naWVzLiBJIGRpZG4ndCB3YW50IHRvIHNudWIgeW91IG9yIGFueW9u
ZSBlbHNlLiBUaGlzIGNoYW5nZSANCnNob3VsZCBub3QgaGF2ZSBhbiBlZmZlY3Qgb24gKmFu
eSogb2YgdGhlc2UgZHJpdmVycy4gSXQncyBqdXN0IGNsZWFyaW5nIA0KYSBwb2ludGVyIGFz
c2lnbm1lbnQgdGhhdCBpcyBub3cgdGhlIGRlZmF1bHQuIEFuZCBhZGRpbmcgdGhlIG1haW50
YWluZXJzIA0Kb2YgYWxsIGFmZmVjdGVkIGRyaXZlcnMgd291bGQgYWRkIGFsbCBtYWludGFp
bmVycyBvZiBEUk0gY29kZSwgaGVuY2UgSSANCmRlY2lkZWQgdG8gbm90IGRvIHRoYXQuICBQ
bGVhc2Ugbm90ZSB0aGF0IHRoZSBvbmUgbWFpbnRhaW5lciB0aGF0IA0KYWN0dWFsbHkgaXMg
YWZmZWN0ZWQsIFphY2ssIGlzIGluIENDLg0KDQo+IA0KPiBTZXJpZXMgbG9va3Mgc2FuZSB0
byBtZSwgYnV0IEknZCBsaWtlIHRvIHNlZSB3aGF0IHlvdSBkbyBmb3IgYSB2MiB0byANCj4g
YWRkcmVzcyB0aGUgZXhpc3RpbmcgY29tbWVudHMuDQoNCllvdSdsbCBiZSBjYydlZC4NCg0K
PiANCj4gRm9yIHRoZSBRQUlDIHBhcnQgLQ0KPiANCj4gQWNrZWQtYnk6IEplZmZyZXkgSHVn
byA8cXVpY19qaHVnb0BxdWljaW5jLmNvbT4NCg0KVGhhbmtzIGEgbG90Lg0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQo+IA0KPiAtSmVmZg0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJt
YW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91
ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------TV73U0FhhWShpuUdqL7YuCIu--

--------------YtdI38sdROSEOlulp0y36d0q
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSQFzsFAwAAAAAACgkQlh/E3EQov+AS
yw//Xn6hMMY+DsM/AXjxFx08GPHEET+DigNnsWs9a9l3H4xz8E9FZQXTz0lMJCKTkAtLOcSLh6ms
wIaxNaHGTcfwvID7qu7he9axm7gQP85H8n7zKEj6D/Zc+7CYSAJtnaIBrWuvAx0jfz3ce4wN7J0j
EO0I2Qz7O6ARbglJQDfyzyKnZAB7yA/kQ1XFLch4f4e+e33fEhG08kK94aEDTtdIEWz83wA9hxO8
Y6P2qvVLs6smnyI/6TuXJKJRQt8SQclUA2FbfbMyuVoa7Lct6Sf6BFXPt5PJRuO323W876sh5Kl/
6+Z2VNSL2/rkuPcPi4Fca/bGOFHKPc8XJYVWUsKq2iLw6+ZBidXZ2WtlQ2Z68x+zQ29TGnIQHpwQ
ZmnJqojOnzzvaAKFcGe2bXVZKmaHaseAPom9ptUGQXKEb/BH48uU/idSdqAdKll+WpO5dfVoDFWt
3KTf14bPL4CJ7MpiiM2sa6dFB6EI+I227RWArmpU5mH9mz87CNW9yY7Sc0YvnDeyYtsDx9tt2i2f
K1NRIFB9R44M4GsTu9MMFH4KSnPuBAaVwhQsN4wePkhuBGcefY+Uan3t0xh1qxZiMDK3XXNIESSp
2VtkJYZbJMrN1X+sQxe/YY8F4BVg+Ml+ccPEYGKfVQ7gLcoxWhC0b2eTuiZzs9Rx3QgfoOt+3BBy
Wnw=
=Vqr6
-----END PGP SIGNATURE-----

--------------YtdI38sdROSEOlulp0y36d0q--
