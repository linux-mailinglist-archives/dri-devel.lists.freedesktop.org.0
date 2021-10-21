Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01446436320
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 15:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477CE6EC73;
	Thu, 21 Oct 2021 13:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52EB76EC73
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 13:34:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A5FCC2199D;
 Thu, 21 Oct 2021 13:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634823285; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yFpXgxvajJ9L0yaAYRxXOaWpt4CojPM95yWw78bNNKU=;
 b=Qoy3lb1hMZZcRpzfH+QrEYWRFRHRZtXThnjGSnd3+q5D4hUVR5soSyVhkWmCLZYaRXoYWg
 TSuiaVFzR+7pvZTTzpeLJZbY8B1fUmEzesi4RiY+xN51+j38INq4/ohnPVqoOA45b9foG5
 VNbjo7kQ8N22a8w7G0CLgypScsGk/Tk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634823285;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yFpXgxvajJ9L0yaAYRxXOaWpt4CojPM95yWw78bNNKU=;
 b=oX00zYO0oabLdWBMMQoOedENU0QFOtiGvSq3n8IGV2OaOSxxwMokzeJpUxpN//lurQrjXy
 tnrmjwaviErJI1DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7EDAE13BA5;
 Thu, 21 Oct 2021 13:34:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mvDcHXVscWFuJgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Oct 2021 13:34:45 +0000
Message-ID: <5694ddb2-fc56-0732-2375-5587e78d5e23@suse.de>
Date: Thu, 21 Oct 2021 15:34:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] drm: Move several files from DRM core into modules
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
References: <20211020131941.15367-1-tzimmermann@suse.de>
 <877de6mu1x.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <877de6mu1x.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4jt0I9TqVF4U2ZiiGzq8yY0e"
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
--------------4jt0I9TqVF4U2ZiiGzq8yY0e
Content-Type: multipart/mixed; boundary="------------AqyW2gIudSOshXMPUHdrBDHw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <5694ddb2-fc56-0732-2375-5587e78d5e23@suse.de>
Subject: Re: [PATCH 0/3] drm: Move several files from DRM core into modules
References: <20211020131941.15367-1-tzimmermann@suse.de>
 <877de6mu1x.fsf@intel.com>
In-Reply-To: <877de6mu1x.fsf@intel.com>

--------------AqyW2gIudSOshXMPUHdrBDHw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMTAuMjEgdW0gMTQ6Mzggc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
V2VkLCAyMCBPY3QgMjAyMSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+IHdyb3RlOg0KPj4gTW92ZSBhIG51bWJlciBvZiBmaWxlcyBpbnRvIG1vZHVsZXMgYW5k
IGJlaGluZCBjb25maWcgb3B0aW9ucy4NCj4+DQo+PiBTbyBmYXIsIGVhcmx5IGJvb3QgZ3Jh
cGhpY3Mgd2FzIHByb3ZpZGVkIGJ5IGZiZGV2LiBXaXRoIHNpbXBsZWRybSwgYW5kDQo+PiBw
b3NzaWJseSBvdGhlciBnZW5lcmljIERSTSBkcml2ZXJzLCBpdCdzIG5vdyBwb3NzaWJsZSB0
byBoYXZlIGdlbmVyYWwNCj4+IGVhcmx5LWJvb3Qgb3V0cHV0IHdpdGggRFJNLiBUaGlzIHJl
cXVpcmVzIHRoZSBEUk0gY29yZSB0byBiZSBsaW5rZWQgaW50bw0KPj4gdGhlIGtlcm5lbCBi
aW5hcnkgaW1hZ2UuDQo+Pg0KPj4gVGhlIHJlZHVjdGlvbiBpbiBzaXplIGhlcmUgaXMgb25s
eSB+MSUsIGJ1dCB0aGUgcGF0Y2hzZXQgaXMgcGFydCBvZiBhDQo+PiBsYXJnZXIgZWZmb3J0
IHRvIHJlZHVjZSB0aGUgc2l6ZSBvZiB0aGUgRFJNIGNvcmUgbW9kdWxlLg0KPiANCj4gSSB0
aGluayB0aGUgbWFpbiBwcm9ibGVtIGlzIHJlYWxseSB0aGF0IG9mIG9yZ2FuaXphdGlvbi4g
WW91IGhhdmUgYWxsIG9mDQo+IHRoZSBmaWxlcyB1bmRlciBkcml2ZXJzL2dwdS9kcm0vIGFu
ZCB0aGUgb25seSB3YXkgdG8ga25vdyB3aGljaCBtb2R1bGUNCj4gdGhlIGZpbGVzIGJlbG9u
ZyB0byBpcyB0byBsb29rIGF0IHRoZSBNYWtlZmlsZSBhbmQgdGhlIEtjb25maWcuIEl0J3Mg
bm90DQo+IG9idmlvdXMgYmFzZWQgb24gdGhlIGZpbGUgbmFtZXMgb3IgZGlyZWN0b3J5LCBh
dCBhbGwuIEFuZCB0aGVyZSBhcmUNCj4gbmVhcmx5IGEgaHVuZHJlZCBkcm1fKi5jIGZpbGVz
IHRoZXJlIQ0KPiANCj4gV2UgYWxzbyBzZWVtIHRvIGhhdmUgc3R1ZmYgZGVwZW5kIG9uIERS
TSBhbG9uZSwgd2hpbGUgZnVuY3Rpb25hbGx5IHRoZXkNCj4gc2hvdWxkIHJlYWxseSBkZXBl
bmQgb24gRFJNX0tNU19IRUxQRVIgdG9vLg0KDQpUaGUgcG9pbnQgb2YgbXkgZWZmb3J0IGlz
IHRvIGhhdmUgYSBidWlsdC1pbiBzaW1wbGVkcm0gZm9yIGVhcmx5LWJvb3QgDQpncmFwaGlj
cyB0aGF0IHJlcXVpcmVzIG9ubHkgYSBtaW5pbWFsIHNldCBvZiBidWlsdC1pbiBkZXBlbmRl
bmN5LiBNb3N0IA0Kb2YgdGhlICdhZHZhbmNlZCcgZmVhdHVyZXMgdGhhdCBuYXRpdmUgZHJp
dmVycyB1c2Ugc2hvdWxkIGdvIGludG8gDQptb2R1bGVzLiBJdCdzIGEgYml0IHVucmVhbGlz
dGljLCBidXQgYW55IHByb2dyZXNzIGlzIGdvb2QuDQoNCj4gDQo+IFRoZSBzdWJkaXJlY3Rv
cmllcyB1bmRlciBkcm0vIGFsc28gZG9uJ3QgaGF2ZSBhbnkgZGlzdGluY3Rpb24gYmV0d2Vl
bg0KPiBiZWluZyBwYXJ0IG9mIGRybSBjb3JlIGFuZCBoZWxwZXJzIG9yIGRyaXZlcnMuIFdl
IGhhdmUgbGliLCBzY2hlZHVsZXIsDQo+IHNlbGZ0ZXN0cywgYW5kIHR0bSBuZXh0IHRvIHRo
ZSBkcml2ZXJzLg0KPiANCj4gV2Ugc2hvdWxkIHN0YXJ0IGFkZGluZyBkcm1fKiBzdWJkaXJl
Y3RvcmllcywgYW5kIG1vdmluZyB0aGUgbW9kdWxlcw0KPiBzZXBhcmF0ZSBmcm9tIGRybSBj
b3JlIHRoZXJlLiBXZSBzaG91bGQgcmVuYW1lIHRoZSBjdXJyZW50IG5vbi1kcml2ZXINCj4g
ZGlyZWN0b3JpZXMgZHJtXyouIFdlIG5lZWQgYmV0dGVyIHN0cnVjdHVyZS4NCg0KV2VsbCwg
dGhlcmUgYXJlIGNvcmUgZnVuY3Rpb25zIGFuZCBoZWxwZXJzLiBPZnRlbiwgYm90aCBhcmUg
aW4gdGhlIHNhbWUgDQpmaWxlIGFuZCB0aGUgY29yZSAnYWNjaWRlbnRhbGx5JyBwdWxscyBp
biBoZWxwZXJzLiBGb3IgZXhhbXBsZSwgSSBmb3VuZCANCnRoYXQgdGhlIGNvcmUgY29ubmVj
dG9yIGF1dG9tYXRpY2FsbHkgY3JlYXRlcyBhbiBFRElEIHByb3BlcnR5IGFuZCB0cmllcyAN
CnRvIGZpbGwgaW4gc29tZSB2YWx1ZXMsIHdoaWNoIGluIHR1cm4gcHVsbHMgYWxsIHRoZSBF
RElEIHBhcnNpbmcgDQpoZWxwZXJzLiBJdCB3b3VsZCBiZSBuaWNlIHRvIG1vdmUgdGhlIHBh
cnNpbmcgY29kZSBpbnRvIGEgbW9kdWxlLCBidXQgDQppdCdzIG5vdCBwb3NzaWJsZSBBVE0u
DQoNCkZvciBhIHN0YXJ0IHdlIGNvdWxkIHRyeSB0byBzcGxpdCBmaWxlcyBpbnRvIGNvcmUg
YW5kIGhlbHBlciBjb2RlIGFuZCANCmxpbmsgdGhlbSBpbnRvIGRpZmZlcmVudCBtb2R1bGVz
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4gQlIsDQo+IEphbmkuDQo+
IA0KPiANCj4gDQo+IA0KPj4NCj4+IFRob21hcyBaaW1tZXJtYW5uICgzKToNCj4+ICAgIGRy
bTogQnVpbGQgZHJtX2lycS5vIG9ubHkgaWYgQ09ORklHX0RSTV9MRUdBQ1kgaGFzIGJlZW4g
c2V0DQo+PiAgICBkcm06IExpbmsgc2V2ZXJhbCBvYmplY3QgZmlsZXMgaW50byBkcm1fa21z
X2hlbHBlci5rbw0KPj4gICAgZHJtOiBNb3ZlIEdFTSBtZW1vcnkgbWFuYWdlcnMgaW50byBt
b2R1bGVzDQo+Pg0KPj4gICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICAg
ICB8ICA0ICsrLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgICAg
ICAgfCAyNiArKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPj4gICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV9jbWFfaGVscGVyLmMgICB8ICA0ICsrKysNCj4+ICAgZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgfCAgNCArKysrDQo+PiAgIGRyaXZlcnMvZ3B1
L2RybS9kcm1faXJxLmMgICAgICAgICAgICAgIHwgIDIgLS0NCj4+ICAgNSBmaWxlcyBjaGFu
Z2VkLCAyNSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkNCj4+DQo+PiAtLQ0KPj4g
Mi4zMy4wDQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCg==


--------------AqyW2gIudSOshXMPUHdrBDHw--

--------------4jt0I9TqVF4U2ZiiGzq8yY0e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFxbHQFAwAAAAAACgkQlh/E3EQov+DI
7RAAqfd8NLoY0DItJWxhNri4F1YMSPf7b4/ivoE3D2rHBcqyBtfCrMQM5blJNxnNiBVrD8RkFzd1
PkZ1esqv/uNezD1LVi6S4MPpIHLHW8u1EIhsBkw7LTVTP3tzaheBvixy68tPm01wf33vkHfNBB0u
X3zhLyIV2maOSvTHGHAUvEFb45YchgwIwc4dSIKULqn2+i5tCDJTawe0oxBV9sIrAHTQl3EgVt/x
9mu5AMHENeETQwPMnGk+IY7IADoPn1st7NfkG2FTH6YNniXNo5FCf+QSZFWblXd10RFKyjoguJQW
ugqWGSU+2tE16BRM5EAGIOkvnfAMqWse3HajZs+cF9eYB4y3rC6caThF16Dn+HBUDgJjOAyIiTVs
iqQxREjBi4r+rJc/x7dMEeJOOkj8VNkS4chAeMAsGdRIyvdzWNVibESCczUwn27LfJDfGemrmBrg
6BJPtMtCqwKv4kZ1ugdHuFtOpkY5vGqsaAxZKYyrJe7BGo3i1YXYmf9uKughGbE24Zx+VOc8ViUk
Ll1sNmyaIpQXlmHJZNr8heK4xOUkHOqQjO0rsziD7OB6aLLveN3mLMgMPyR8pZe8a9JnsY21S+Ep
wHRwBSz1xSPK0mDLsUan3TrxiUM3i9dnibVlJ9UNmG5n73yGGCVRtXUmgG6cTsLQakGQQORo+Yvv
7IE=
=b3UJ
-----END PGP SIGNATURE-----

--------------4jt0I9TqVF4U2ZiiGzq8yY0e--
