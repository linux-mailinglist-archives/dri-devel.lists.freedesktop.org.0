Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115A0732880
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 09:11:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2298510E5B8;
	Fri, 16 Jun 2023 07:11:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD3A10E5B8
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 07:11:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8B11C2219C;
 Fri, 16 Jun 2023 07:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686899499; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BxTwH9OD0AlgL1Uah7E8dftyeqwLFWpjki6UTgVE3LA=;
 b=j1f26PK9uauGKKaLAIRFC+zCETs+O5OU3I88IA0+F0cXJJZKbCKv9c3DCCJM2+xQx5SguL
 gSRMaEzEG1hgwCyBKOVg/Ub66FWw3JdFg2L2wGJTzNoyqRjePrjLvQ5FhjTXbh14w3cLsk
 D8Dn0YsU6+32m9dLqB7LD9SEu25BDCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686899499;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BxTwH9OD0AlgL1Uah7E8dftyeqwLFWpjki6UTgVE3LA=;
 b=x4YbXMToG4XK6MKOCeF89QHxdurGICg+XJ7bner2kk4gvgqpZlEFJFncOEvzqATxwibYTP
 3hYha7eiqpKYPFBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F797138E8;
 Fri, 16 Jun 2023 07:11:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4up0FisLjGR2BQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jun 2023 07:11:39 +0000
Message-ID: <86e81379-83c7-c719-0fa7-afd320f3a905@suse.de>
Date: Fri, 16 Jun 2023 09:11:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 0/3] drm: Allow PRIME 'self-import' for all drivers
To: Zack Rusin <zackr@vmware.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "contact@emersion.fr" <contact@emersion.fr>
References: <20230615094206.4424-1-tzimmermann@suse.de>
 <9a8ec363a38e78b1848483baab52c9c61cb2e188.camel@vmware.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <9a8ec363a38e78b1848483baab52c9c61cb2e188.camel@vmware.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ShiouFqVils36YpUUl126kdk"
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ShiouFqVils36YpUUl126kdk
Content-Type: multipart/mixed; boundary="------------gi904uVh8BXknxCNRxNrGWLx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "contact@emersion.fr" <contact@emersion.fr>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <86e81379-83c7-c719-0fa7-afd320f3a905@suse.de>
Subject: Re: [PATCH 0/3] drm: Allow PRIME 'self-import' for all drivers
References: <20230615094206.4424-1-tzimmermann@suse.de>
 <9a8ec363a38e78b1848483baab52c9c61cb2e188.camel@vmware.com>
In-Reply-To: <9a8ec363a38e78b1848483baab52c9c61cb2e188.camel@vmware.com>

--------------gi904uVh8BXknxCNRxNrGWLx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDYuMjMgdW0gMDU6NTkgc2NocmllYiBaYWNrIFJ1c2luOg0KPiBPbiBU
aHUsIDIwMjMtMDYtMTUgYXQgMTE6MzEgKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Og0KPj4gU2V0IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkKCkgYW5kIGRybV9nZW1fcHJp
bWVfZmRfdG9faGFuZGxlKCkNCj4+IGZvciBhbGwgRFJNIGRyaXZlcnMuIEV2ZW4gZHJpdmVy
cyB0aGF0IGRvIG5vdCBzdXBwb3J0IFBSSU1FIGltcG9ydA0KPj4gb3IgZXhwb3J0IG9mIGRt
YS1idWZzIGNhbiBub3cgaW1wb3J0IHRoZWlyIG93biBidWZmZXIgb2JqZWN0cy4gVGhpcw0K
Pj4gaXMgcmVxdWlyZWQgYnkgc29tZSB1c2Vyc3BhY2UsIHN1Y2ggYXMgd2xyb290cy1iYXNl
ZCBjb21wb3NpdG9ycywgdG8NCj4+IHNoYXJlIGJ1ZmZlcnMgYW1vbmcgcHJvY2Vzc2VzLg0K
Pj4NCj4+IFRoZSBvbmx5IGRyaXZlciB0aGF0IGRvZXMgbm90IHVzZSB0aGUgZHJtX2dlbV9w
cmltZV8qKCkgaGVscGVycyBpcw0KPj4gdm13Z2Z4LiBPbmNlIGl0IGhhcyBiZWVuIGNvbnZl
cnRlZCwgdGhlIGNhbGxiYWNrcyBpbiBzdHJ1Y3QgZHJtX2RyaXZlcg0KPj4gY2FuIGJlIHJl
bW92ZWQuDQo+IA0KPiBIbW0sIEknbSBub3Qgc3VyZSB0aGF0J3MgZXZlciBnb2luZyB0byBi
ZSBwb3NzaWJsZSBvbiB2bXdnZnguIE9yIGF0IGxlYXN0IG5vdCB1bnRpbA0KPiBYb3JnIGlz
IHVzZWQgYnkgYW55dGhpbmcuIFNvbWUgdGhpbmdzIGluIHZtd2dmeCBzdGFjayBjcmVhdGUg
InN1cmZhY2VzIiB3aGljaCBhcmUNCj4gbm90IEdFTSdzICh0aGV5IGNhbiBiZSBiYWNrZWQg
YnkgYSBHRU0gb2JqZWN0LCBidXQgZG9uJ3QgaGF2ZSB0bykgYW5kIHRoZSBwcmltZQ0KPiBp
bXBsZW1lbnRhdGlvbiBvbiB2bXdnZnggaGFzIHRvIGJlIGFibGUgdG8gZXhwb3J0IGFuZCBp
bXBvcnQgdGhvc2UuDQoNCkkgc2VlIHRoYXQncyBub3QgZWFzaWx5IGZpeGFibGUsIGlmIGF0
IGFsbC4gSSdkIHJlbW92ZSB0aGUgVE9ETyBpdGVtIGFuZCANCmNoYW5nZSB0aGUgY2FsbGJh
Y2sgY29tbWVudHMgdG8gc2F5IHRoYXQgdGhleSBhcmUgcmVzZXJ2ZWQgZm9yIHZtd2dmeC4N
Cg0KPiANCj4gSW4gYW4gaWRlYWwgd29ybGQgSSdkIGp1c3QgZGVsZXRlIHRoZSBpb2N0bCdz
IHRoYXQgYWxsb3cgY3JlYXRpbmcgdGhvc2UgInN1cmZhY2VzIiwNCj4gYnV0IG9mIGNvdXJz
ZSB0aGF0J3MgYSBuby1ubywgc28gcG9zc2liaWxpdHkgb2YgaW50cm9kdWNpbmcgdm13Z2Z4
MiB3aXRoIGENCj4gc2FuZXIvbW9kZXJuIGlvY3RsIG1vZGVsIGhhcyBiZWVuIGZsb2F0aW5n
IGFyb3VuZCBpbnRlcm5hbGx5LiBXaGljaCBhdCBsZWFzdCB3b3VsZA0KPiBvcGVuIGEgcGF0
aCB0byByZW1vdmluZyB2bXdnZnggYXQgc29tZSBwb2ludCBpbiB0aGUgZnV0dXJlLCBidXQg
dGhlcmUncyBub3QgbXVjaA0KPiB0aGF0IGNhbiBiZSBkb25lIGFib3V0IHZtd2dmeCBoYXZp
bmcgdG8gYmUgYWJsZSB0byBwcmltZSBpbXBvcnQvZXhwb3J0IEdFTSdzIGFuZA0KPiB3b25r
eSBub24tR0VNIG9iamVjdHMuDQoNCldlIGhhdmUgcmVtb3ZlZCBpb2N0bHMgYmVmb3JlLCBi
dXQgb3ZlciB5ZWFycyBzbyB0aGF0IHVzZXJzcGFjZSBoYWQgdGltZSANCnRvIHVwZGF0ZS4g
UmVtb3ZpbmcgdGhlIGlvY3RscyB3b3VsZCByZXF1aXJlIGEgY2hhbmdlIHRvIHRoZSBkcml2
ZXIgDQp2ZXJzaW9uLCBJIHRoaW5rLg0KDQpZb3UgY291bGQgZXhwbG9yZSB0aGUgb3B0aW9u
IG9mIGltcGxlbWVudGluZyBHRU0tYmFzZWQgb2JqZWN0cyB3aXRoIHRoZSANCkdFTSBoZWxw
ZXJzIGFuZCB0aGUgbm9uLUdFTSBvYmplY3RzIHdpdGggdGhlIGN1cnJlbnQgY29kZS4gSWYg
ZG9uZSANCmNvcnJlY3RseSwgdGhlIG9sZCBub24tR0VNIHN1cHBvcnQgY291bGQgYmUgaGlk
ZGVuIGJlaGluZCBhIEtjb25maWcgb3B0aW9uLg0KDQpBbnl3YXksIEknbGwgY2hhbmdlIHRo
ZSBwYXRjaHNldCB0byByZWZsZWN0IHRoZSBjdXJyZW50IHN0YXRlLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiB6DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55
DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGll
biBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------gi904uVh8BXknxCNRxNrGWLx--

--------------ShiouFqVils36YpUUl126kdk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSMCyoFAwAAAAAACgkQlh/E3EQov+A0
Hw/9Gt//OnOPzdF3xeg5nwGSTwj8WY5UgLzOTZxG/5xH3wte7V+C9KPOxBK31f8opyeA+1lOf6tf
G12n2pFzg5Yv/36TV6MHixn7L4KyE1fjadoZxWv87mMz6Ulpr6CIFCTRoq2xDw4DoOJos30KJcRw
ija7BbpuLHRYNHMF+q+Rb4BbjXT8RQhFg5PAkbaoDDe2O5FojfF2oXhpo2+AQ3AH/zwgF7TiggeO
4LPgphmJHvE+oeJwkEBVFDyNGS5rHvS7CNcb6xV4GrDreV4QD62eiFxQd9oN+EIvRfNk6rglrQxc
KOnMPh1NuuC6Qol+asdi1kZzP9FpiNlxSV2vbu0+r3KqvRglq4VgSSkjt/SFVX1NReEwyHn4kDSH
/TOgm45vQhgS+SGEewyDyXlNQt5Hcgjh8pOE4eGCS9i20U/J+mrUev5UI8eT3Iw2dcvEXNKCFzQ8
lWSbUg3UHOkc5ML1Sb0Zi3KFH1wsQ8zvZISrp9hXB0n+rPiNcX1MffW91pT7PsSnsb3bDKL7oszd
BKIR2kd4VMPDk8dCR8TPEdPmC9hBgDA7ElUcRW8AuHXJSQ4Pfh+M9a/J0rultrqgZqCL8IaQA2ek
PTG5pnOoARCT+YonJMBs6TEGkmsaZbqLJ3D5tgD+PZ2GhQ39FEYY1HxbkgM8o7h5PfSi4h+WPOCi
Fu4=
=iYl1
-----END PGP SIGNATURE-----

--------------ShiouFqVils36YpUUl126kdk--
