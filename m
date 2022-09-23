Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C524C5E7A34
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 14:09:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3072C10E8E2;
	Fri, 23 Sep 2022 12:09:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B51710E992
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 12:09:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 23E151F92C;
 Fri, 23 Sep 2022 12:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663934942; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=irVMcy4OY2aP15lcOTMRzYzkmRL6wn5wxWZC8qldbpQ=;
 b=v/isG2qf1vfJobA7weFyeCh4a2IB23XwbbDtQ+7Mu6Gew1iUS5UrysIAu82r7GklkF8jUI
 tlmHap04pG+q9F2WIWbe0lpFRJJMfTCWzYAcNACTtLYhgU4GlkCHexpr/zLhZ1sU0CVuZL
 sLkzX1WBLWA8/pjBkltbpSCXC67EdKE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663934942;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=irVMcy4OY2aP15lcOTMRzYzkmRL6wn5wxWZC8qldbpQ=;
 b=CcUDIiA/BZQ/qLFQE830DdAlyHb53f/ALkK1L3XNTohnL0lpTMMXNWfq+vJKlp5MNDBHpm
 QScLnB+0ISojy9DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0972E13A00;
 Fri, 23 Sep 2022 12:09:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id NG5hAd6hLWOXbAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Sep 2022 12:09:02 +0000
Message-ID: <2b8ebf18-d668-a2d6-cb8e-3be2e501c245@suse.de>
Date: Fri, 23 Sep 2022 14:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 5/5] drm/simpledrm: Synchronize access to GEM BOs
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-6-tzimmermann@suse.de>
 <2163b960-cfbe-7693-ba89-633cb36558a7@redhat.com>
 <fcd1d302-89af-62c9-0081-0717ad40e4ca@suse.de>
 <90b49a3d-aaaa-ba1c-ae7f-a4680a0621c4@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <90b49a3d-aaaa-ba1c-ae7f-a4680a0621c4@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Anx5WzuHKS3Kip72ZDB7Gmms"
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
--------------Anx5WzuHKS3Kip72ZDB7Gmms
Content-Type: multipart/mixed; boundary="------------dvV7Alj5prSFzS7fpieQTlv2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@linux.ie,
 daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <2b8ebf18-d668-a2d6-cb8e-3be2e501c245@suse.de>
Subject: Re: [PATCH 5/5] drm/simpledrm: Synchronize access to GEM BOs
References: <20220922130944.27138-1-tzimmermann@suse.de>
 <20220922130944.27138-6-tzimmermann@suse.de>
 <2163b960-cfbe-7693-ba89-633cb36558a7@redhat.com>
 <fcd1d302-89af-62c9-0081-0717ad40e4ca@suse.de>
 <90b49a3d-aaaa-ba1c-ae7f-a4680a0621c4@redhat.com>
In-Reply-To: <90b49a3d-aaaa-ba1c-ae7f-a4680a0621c4@redhat.com>

--------------dvV7Alj5prSFzS7fpieQTlv2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDkuMjIgdW0gMTI6NTggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDkvMjMvMjIgMTI6NDMsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gSGkNCj4+DQo+PiBBbSAyMy4wOS4yMiB1bSAxMDowNiBzY2hyaWViIEphdmllciBNYXJ0
aW5leiBDYW5pbGxhczoNCj4+PiBPbiA5LzIyLzIyIDE1OjA5LCBUaG9tYXMgWmltbWVybWFu
biB3cm90ZToNCj4+Pj4gU3luY2hyb25pemUgQ1BVIGFjY2VzcyB0byBHRU0gQk9zIHdpdGgg
b3RoZXIgZHJpdmVycyB3aGVuIHVwZGF0aW5nIHRoZQ0KPj4+PiBzY3JlZW4gYnVmZmVyLiBJ
bXBvcnRlZCBidWZmZXJzIG1pZ2h0IG90aGVyd2lzZSBjb250YWluIHN0YWxlIGRhdGEuDQo+
Pj4+DQo+Pj4NCj4+PiBDYW4geW91IHBsZWFzZSBlbGFib3JhdGUgd2hhdCB0aGUgcHJvYmxl
bSBpcz8gVGhlIGZyYW1lYnVmZmVycyBtZW1vcnkgaXMNCj4+PiBzZXR1cCBieSB0aGUgZmly
bXdhcmUgYW5kIHdvdWxkIG5ldmVyIGNvbWUgZnJvbSBhbiBpbXBvcnRlZCBkbWEtYnVmLCBz
bw0KPj4+IGNvdWxkIHRoZSBHRU0gQk9zIGV2ZW4gYmUgc2hhcmVkIHdpdGggb3RoZXIgZHJp
dmVycz8NCj4+Pg0KPj4+IE9yIGlzIHRoaXMgZG9uZSBqdXN0IGZvciB0aGUgc2FrZSBvZiBj
b3JyZWN0bmVzcyA/DQo+Pg0KPj4gVGhpcyBpc24ndCBhYm91dCB0aGUgc2Nhbm91dCBidWZm
ZXIgdGhhdCB3ZSBnZXQgZnJvbSB0aGUgZmlybXdhcmUuIFRoaXMNCj4+IGlzIGFib3V0IHN5
bmNocm9uaXppbmcgYWNjZXNzIHRvIHRoZSBHRU0gQk8gbWVtb3J5IGJ1ZmZlcnMuIE91ciBC
T3MnDQo+PiBtZW1vcnkgYnVmZmVyIGFyZSBhbGxvY2F0ZWQgZnJvbSBTSE1FTSBvciBjb3Vs
ZCBiZSBpbXBvcnRlZCB2aWEgZG1hLWJ1Zi4NCj4+IEluIHRoZSBsYXR0ZXIgY2FzZSwgYW5v
dGhlciBkcml2ZXIgb3IgaGFyZHdhcmUgbWlnaHQgbW9kaWZ5IHRoZWlyDQo+PiBjb250ZW50
IGNvbmN1cnJlbnRseS4gV2UgbmVlZCB0byBzeW5jaHJvbml6ZSBiZWZvcmUgcmVhZGluZyB0
aGUgbWVtb3J5DQo+PiBmcm9tIG91ciBDUFUuIFRoZSBwYXR0ZXJuIGlzDQo+Pg0KPj4gICAg
IDEpIHN5bmMgQk8gbWVtb3J5IGNvbnRlbnQgdmlhIGJlZ2luX2NwdV9hY2Nlc3MoKQ0KPj4g
ICAgIDIpIGJsaXQgZnJvbSBCTyBtZW0gdG8gc2Nhbm91dCBidWZmZXINCj4+ICAgICAzKSBy
ZWxlYXNlIEJPIG1lbW9yeSB2aWEgZW5kX2NwdV9hY2Nlc3MoKQ0KPj4NCj4gDQo+IFllYWgs
IEkgZ290IHRoYXQgcGFydC4gV2hhdCBJIHdhcyBhc2tpbmcgaXMgaWYgaW1wb3J0aW5nIGZy
b20gZG1hLWJ1ZiBpcw0KPiBhIHJlYWwgdXNlIGNhc2UgZm9yIHNpbXBsZWRybSBvciBpZiB0
aGlzIHBhdGNoIHdhcyBtb3JlIGFib3V0IG1ha2luZyB0aGUNCj4gZHJpdmVyIGNvcnJlY3Qg
YW5kIGFsaWduZWQgd2l0aCB3aGF0IG90aGVyIERSTSBkcml2ZXJzIGRvPw0KDQpJbiBhIG11
bHRpLUdQVSBzY2VuYXJpbywgaXQgY291bGQgaGFwcGVuIHRoYXQgb25lIGRpc3BsYXkgdXNl
cyANCnNpbXBsZWRybS4gSWYgdGhlIG90aGVyIEdQVSBoYXMgYSBuYXRpdmUgZHJpdmVyIHRo
YXQgZXhwb3J0cyB0aGUgQk8gZm9yIA0Kc2NyZWVuIG1pcnJvcmluZywgdGhlIHN5bmNocm9u
aXphdGlvbiBtaWdodCBiZSBuZWVkZWQuIEFkbWl0dGVkbHkgaXQncyANCm5vdCBhIGxpa2Vs
eSBzY2VuYXJpby4gQnV0IHN0aWxsLi4uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
DQo+IEluIGFueSBjYXNlIEkgYWdyZWUgd2l0aCB0aGUgY2hhbmdlLCBpdCdzIGp1c3QgdGhl
IHJhdGlvbmFsZSBmb3IgaXQgdGhhdA0KPiB3YXNuJ3QgY2xlYXIgdG8gbWUuDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------dvV7Alj5prSFzS7fpieQTlv2--

--------------Anx5WzuHKS3Kip72ZDB7Gmms
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMtod0FAwAAAAAACgkQlh/E3EQov+AO
yRAAmg9sy6WOtyJZgg0p/DTUA3XrmIu3cSqoBJeLFOt1XEVAa7X5AJm2c8P9s3bNMHNNWytSVHVe
hJ5o8jIk8jV+MyeCImNl4MbYL+6KsMdSaQ2luOSGCit9NxM+MUqIFz/DWBnf6nQVEJM7gxRHF9YU
tAs6lUEM4Va42x4NlVrFTKJzJw/XPUCN7JzNOnOUTVfM2lCRea9wjwcjTfq7yZVghm1LQcfc8AEV
Hvxd5xQY3CiU8z6/R+Gx7eCCLoPgFOc2zPGnuPOtWAufjxUx5DlA0eThEhBp6BiIgQXoizzQ7PyU
gf48Gn5ZbR60u79TKcrxojjppxBF/TbXkHLFULHBtY+LkoFVTgWFK873eROT458ItgLuMEn/nDpf
6AgV4csWqs8RfaDLFIz6bEqwbYHWuftjZc2bhKLsyFjJStmHkqQ3nlqlhDNvQhjJTSPpfTH02e2R
xKcVpMOLf9A4gGoccfxrGHddyA/cW6Z6wDq4lSQBiMj9TTpSnu+W6ByKBGjVJEJHVuC7u2hBUhcP
R8gPVQLUYVy7wwsDsHf3PCgBOoJESIMFbdD6dcjh5XHBTU8Y8fPHKVd5cONG/7iZv2xercioiK27
lgit8TZwTRJcVimK+edAWCBKaGp63ti+Pnnd7yQ5LDRiDWDxAGmisTEdI2tf8LFHkkfbvD+WRn7R
oBo=
=6qrU
-----END PGP SIGNATURE-----

--------------Anx5WzuHKS3Kip72ZDB7Gmms--
