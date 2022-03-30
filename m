Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7BA4EBECD
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 12:32:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 000B410E202;
	Wed, 30 Mar 2022 10:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA2110E1F1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 10:32:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0AF63210DB;
 Wed, 30 Mar 2022 10:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1648636372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A9GZd41VNpDVvKfPuyagXuyI+RbTdOpfZqvP++1squk=;
 b=qjn6FoNC8NKAjiw3Sm3qaMyWztJQezeNhvMEOim/9UHXD31udq1J9ulp7K1RTInQzzTfhQ
 xt6ZDOyLw41J1Gt/MRyp3PLLi6AT1ir+69Ew0NmTHQJjGlmGPjMBR/AMUqT/zmecZAiTsw
 Fzink58F2N+9HntCjg0pAxlzddZT0jk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1648636372;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A9GZd41VNpDVvKfPuyagXuyI+RbTdOpfZqvP++1squk=;
 b=Dm8cF2g1eErwfvLw54qPdBqfjoc7R3BUJ5dHOAbCHu2qvYkJdrcf6G/ii0wwAVnbVX48kp
 aQXwGRn4wpTtHoAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC52613AF3;
 Wed, 30 Mar 2022 10:32:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oSbVLNMxRGJUewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Mar 2022 10:32:51 +0000
Message-ID: <729dbf70-885f-bbe4-98ea-48e6e1b7304d@suse.de>
Date: Wed, 30 Mar 2022 12:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-4-tzimmermann@suse.de>
 <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YQyb4ZAUoADyZhR0B3mcMxvd"
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
--------------YQyb4ZAUoADyZhR0B3mcMxvd
Content-Type: multipart/mixed; boundary="------------K9osh1FJ70D5JVsjYf0DLsJo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <729dbf70-885f-bbe4-98ea-48e6e1b7304d@suse.de>
Subject: Re: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-4-tzimmermann@suse.de>
 <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
In-Reply-To: <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>

--------------K9osh1FJ70D5JVsjYf0DLsJo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDMuMjIgdW0gMTE6MjMgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDMvMjIvMjIgMjA6MjcsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gUmVwbGFjZSB0aGUgRFAtaGVscGVyIG1vZHVsZSB3aXRoIGEgZGlzcGxheS1oZWxwZXIg
bW9kdWxlLiBVcGRhdGUNCj4+IGFsbCByZWxhdGVkIEtjb25maWcgYW5kIE1ha2VmaWxlIHJ1
bGVzLg0KPj4NCj4+IEJlc2lkZXMgdGhlIGV4aXN0aW5nIGNvZGUgZm9yIERpc3BsYXlQb3J0
LCB0aGUgbmV3IG1vZHVsZSB3aWxsDQo+PiBjb250YWluIGhlbHBlcnMgZm9yIG90aGVyIHZp
ZGVvLW91dHB1dCBzdGFuZGFyZHMsIHN1Y2ggYXMgSERNSS4NCj4+IERyaXZlcnMgd2lsbCBz
dGlsbCBiZSBhYmxlIHRvIHNlbGVjdCB0aGUgcmVxdWlyZWQgdmlkZW8tb3V0cHV0DQo+PiBo
ZWxwZXJzLiBMaW5raW5nIGFsbCBzdWNoIGNvZGUgaW50byBhIHNpbmdsZSBtb2R1bGUgYXZv
aWRzIHRoZQ0KPj4gcHJvbGlmZXJhdGlvbiBvZiBzbWFsbCBrZXJuZWwgbW9kdWxlcy4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCj4+IC0tLQ0KPiANCj4gW3NuaXBdDQo+IA0KPj4gK2NvbmZpZyBEUk1fRElTUExB
WV9IRUxQRVINCj4+ICsJdHJpc3RhdGUNCj4+ICsJZGVwZW5kcyBvbiBEUk0NCj4+ICsJaGVs
cA0KPj4gKwkgIERSTSBoZWxwZXJzIGZvciBkaXNwbGF5IGFkYXB0ZXJzLg0KPj4gKw0KPj4g
ICBjb25maWcgRFJNX0RQX0hFTFBFUg0KPj4gICAJdHJpc3RhdGUNCj4+ICAgCWRlcGVuZHMg
b24gRFJNDQo+PiArCXNlbGVjdCBEUk1fRElTUExBWV9IRUxQRVINCj4+ICAgCWhlbHANCj4+
ICAgCSAgRFJNIGhlbHBlcnMgZm9yIERpc3BsYXlQb3J0Lg0KPj4NCj4gDQo+IEkgd2FzIGFi
b3V0IHRvIGFzayB3aHkgdGhpcyB3b3VsZCBzdGlsbCBiZSBuZWVkZWQgYnV0IHRoZW4gcmUt
cmVhZCB0aGUNCj4gY29tbWl0IG1lc3NhZ2UgdGhhdCBzYXlzIGRyaXZlcnMgd2lsbCBzdGls
bCBiZSBhYmxlIHRvIHNlbGVjdCByZXF1aXJlZA0KPiB2aWRlby1vdXRwdXQgaGVscGVycy4N
Cj4gDQo+IFRoYXQgbWFrZXMgc2Vuc2Ugc2luY2UgdGhlIGZhY3QgdGhhdCBhbGwgaGVscGVy
cyB3aWxsIGJlIGluIHRoZSBzYW1lIG1vZHVsZQ0KPiB3b3VsZCBiZSB0cmFuc3BhcmVudCB0
byBkcml2ZXJzLg0KPiANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZGlzcGxh
eS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L01ha2VmaWxlDQo+PiBpbmRl
eCA3NWZhZmZjNzA2YjEuLjkwZjEyZTliNDczNSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9kaXNwbGF5L01ha2VmaWxlDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZGlz
cGxheS9NYWtlZmlsZQ0KPj4gQEAgLTIsOCArMiw5IEBADQo+PiAgIA0KPj4gICBvYmotJChD
T05GSUdfRFJNX0RQX0FVWF9CVVMpICs9IGRybV9kcF9hdXhfYnVzLm8NCj4+ICAgDQo+PiAt
ZHJtX2RwX2hlbHBlci15IDo9IGRybV9kcC5vIGRybV9kcF9kdWFsX21vZGVfaGVscGVyLm8g
ZHJtX2RwX2hlbHBlcl9tb2QubyBkcm1fZHBfbXN0X3RvcG9sb2d5Lm8NCj4+IC1kcm1fZHBf
aGVscGVyLSQoQ09ORklHX0RSTV9EUF9BVVhfQ0hBUkRFVikgKz0gZHJtX2RwX2F1eF9kZXYu
bw0KPj4gLWRybV9kcF9oZWxwZXItJChDT05GSUdfRFJNX0RQX0NFQykgKz0gZHJtX2RwX2Nl
Yy5vDQo+PiArZHJtX2Rpc3BsYXlfaGVscGVyLXkgOj0gZHJtX2Rpc3BsYXlfaGVscGVyX21v
ZC5vDQo+PiArZHJtX2Rpc3BsYXlfaGVscGVyLSQoQ09ORklHX0RSTV9EUF9IRUxQRVIpIDo9
IGRybV9kcF9oZWxwZXIubyBkcm1fZHBfZHVhbF9tb2RlX2hlbHBlci5vIGRybV9kcF9tc3Rf
dG9wb2xvZ3kubw0KPj4gK2RybV9kaXNwbGF5X2hlbHBlci0kKENPTkZJR19EUk1fRFBfQVVY
X0NIQVJERVYpICs9IGRybV9kcF9hdXhfZGV2Lm8NCj4+ICtkcm1fZGlzcGxheV9oZWxwZXIt
JChDT05GSUdfRFJNX0RQX0NFQykgKz0gZHJtX2RwX2NlYy5vDQo+PiAgIA0KPj4gLW9iai0k
KENPTkZJR19EUk1fRFBfSEVMUEVSKSArPSBkcm1fZHBfaGVscGVyLm8NCj4+ICtvYmotJChD
T05GSUdfRFJNX0RJU1BMQVlfSEVMUEVSKSArPSBkcm1fZGlzcGxheV9oZWxwZXIubw0KPiAN
Cj4gVGhlIGRybV9kcF9oZWxwZXIua28gbW9kdWxlIGhhcyBzb21lIHBhcmFtZXRlcnMgYW5k
IHRoaXMgY2hhbmdlIHdpbGwgYnJlYWsNCj4gZXhpc3Rpbmcga2VybmVsIGNtZGxpbmUgdGhh
dCBhcmUgdXNpbmcgaXQ6DQo+IA0KPiAkIG1vZGluZm8gZHJpdmVycy9ncHUvZHJtL2RwL2Ry
bV9kcF9oZWxwZXIua28gfCBncmVwIHBhcm0gfCBjdXQgLWQgOiAtZjINCj4gICAgICAgICAg
ICAgZHJtX2RwX2NlY191bnJlZ2lzdGVyX2RlbGF5DQo+ICAgICAgICAgICAgIGRwX2F1eF9p
MmNfc3BlZWRfa2h6DQo+ICAgICAgICAgICAgIGRwX2F1eF9pMmNfdHJhbnNmZXJfc2l6ZQ0K
PiANCj4gSSBkb24ndCBrbm93IHdoZXRoZXIgdGhvc2UgYXJlIGNvbnNpZGVyZWQgYSBrZXJu
ZWwgQUJJIG9yIG5vdCB0aG91Z2gsIGFuZA0KPiBzb21lIGFscmVhZHkgY2hhbmdlZCB3aGVu
IHRoZSBEUCBoZWxwZXJzIHdlcmUgbW92ZWQgZnJvbSBkcm1fa21zX2hlbHBlci5rbw0KDQpH
b29kIHBvaW50LiBJJ2xsIG1lbnRpb24gaXQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlIGFuZGNo
ZWNrIHRoZSANCmRvY3VtZW50YXRpb24gYXMgd2VsbC4NCg0KQXQgbGVhc3QsIG5vIG9uZSBj
b21wbGFpbmVkIHdoZW4gdGhlc2UgZnVuY3Rpb25zIG1vdmVkIGZyb20ga21zIGhlbHBlcnMg
DQppbnRvIGRwIGhlbHBlcnMuIE1vdmluZyB0aGVtIGFnYWluIGlzIHVuZm9ydHVuYXRlLCBi
dXQgSSBob3BlIHRoYXQgdGhlIA0KbmV3IGxpYnJhcnkgd2lsbCBzdGljay4NCg0KSSBzb21l
aG93IGV4cGVjdGVkIHRoYXQgSERNSSwgSERDUCBldCBhbCB3b3VsZCByZXF1aXJlIHRoZWly
IG93biANCmxpYnJhcmllcy4gIEJ1dCBpbnRyb2R1Y2luZyBzZXZlcmFsIG5ldyBhbmQgdGlu
eSBrZXJuZWwgbW9kdWxlcyBmb3Igc3VjaCANCnNtYWxsIGhlbHBlcnMgd2Fzbid0IHdvcnRo
IGl0LiBIZW5jZSwgdGhlcmUncyB0aGUgZGlzcGxheSBsaWJyYXJ5IHRoYXQgDQpjYW4gY29s
bGVjdCBhbGwgc3VjaCBoZWxwZXJzIGluIGEgc2luZ2xlIHBsYWNlLg0KDQpJdCBsb29rcyBs
aWtlIE1JUEkgRFNJIGNvdWxkIGJlIGFub3RoZXIgY2FuZGlkYXRlIHRvIGJlIG1vdmVkIGlu
dG8gdGhlIA0KZGlzcGxheSBsaWJyYXJ5OyBhdCBsZWFzdCBwYXJ0aWFsbHkuIEkgaGF2ZSBn
byB0aHJvdWdoIHRoZSBjb2RlYmFzZSB0byANCnNlZSBpZiB0aGVyZSBhcmUgZHJpdmVycyB0
aGF0IHdvdWxkIGJlbmVmaXQgZnJvbSBzdWNoIGEgY2hhbmdlLg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------K9osh1FJ70D5JVsjYf0DLsJo--

--------------YQyb4ZAUoADyZhR0B3mcMxvd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJEMdMFAwAAAAAACgkQlh/E3EQov+AZ
6RAArfKxvjg7PfnuE6nWUdnauseRtoMUyiuP4ttgMfLVJwL9/VAPbnxkLrouXkMTWsk5UdW9wyFk
3soNOCGh0MqaE70w187tcKEoK49ThPbyEmgahH/LOEUF05J3Pjy74eJBUfwxpo1xyK5AXBfemJ+g
LCVexsFoVOe9kI+Tw5ptN2zSQIF+GKzaxS5+xz16A5P5uewGgMxe9GGdn7AXlK+MHCMFaB5YcW46
d3xsMbEiR61EWuh2s2IqkI9BQ6sMVZlWoXGIgzNDzg6rA+iYXXVaSCzYHkO1WDq0SB4Aj60tlcaH
2o3lVorMWPxhuBKTvvt9UIoXxhvLSa9efFNWLTM3m2JwSxaNKIXINCwbDahYe5cidnUCJq9NwizQ
e5BJ/0dZ8yq2TU/gXyEFcIrdbPm6MlLiWjQ2k6fh3iu/nZ3fsnBwQ5i1eXlOKfQ2dIixuRodycgv
GhKZO7cRZrSYxd61vukE3NHDZUIwe1gTpYW9HeO4byUTKTHTwfh+P1STQ3ux7Bzn6qvxmVq0073D
HwnnmNoO+GZ0Z3gVkpyJYmF2VCu8JgOvc7dgVQsPp6qY0GpLVFZkNPxHAee00Ox0vca1FxnvNGai
A4T/UjJIyFEcLrWLIlZr9ZUduzW09DseW/9EVq+55P3aCY1sYwC7y/Z0h+egAgxLcma40NOE9o2a
Wlk=
=DiI3
-----END PGP SIGNATURE-----

--------------YQyb4ZAUoADyZhR0B3mcMxvd--
