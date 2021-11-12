Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4D444E45A
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 11:09:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C3F46E85E;
	Fri, 12 Nov 2021 10:09:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CB76E91D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 10:09:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C3C681FD57;
 Fri, 12 Nov 2021 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636711754; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UWjuSw1iO0Q9PUIEYbpFluEGeMR8WhFq4RMvSjH5DLc=;
 b=aY9KqVjycyTYRUWw29fAx0PNTKC8D7OUwQcBSO3THEKHB9wWlD8uD1NjBlqPdZ3q/67dZi
 1cFvkjdNKNFguqhKlIJCu+NU490/fwP6ZlkB4HTVBtjDIp1gXGRfnrSDYx1n5gWZwrYBdE
 SqL6RhpagRJGcM+IaWuQjOGSoQD1KJg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636711754;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UWjuSw1iO0Q9PUIEYbpFluEGeMR8WhFq4RMvSjH5DLc=;
 b=4n4GX+w5ITiX3xPRUzpTCiisOzvbb+/gqgoTmoZdJgvolJhUrCWJzGwPOIYBMp2hNV1IeR
 wAe2CeA6+9mCjPBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 896FE13E4A;
 Fri, 12 Nov 2021 10:09:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id PUyCH0o9jmE+PQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Nov 2021 10:09:14 +0000
Message-ID: <f215e009-94af-fdb5-9ab9-ec5806a0c526@suse.de>
Date: Fri, 12 Nov 2021 11:09:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
References: <20211108140648.795268-1-javierm@redhat.com>
 <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
 <20211112105641.25a4e1a7@eldfell>
 <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------00Nfo9cnDpm36MyYPMkJLo5N"
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
Cc: Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------00Nfo9cnDpm36MyYPMkJLo5N
Content-Type: multipart/mixed; boundary="------------mmiz1Zi3z0RoXqRLUNbnEKFI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?Q?Michel_D=c3=a4nzer?=
 <michel@daenzer.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>
Message-ID: <f215e009-94af-fdb5-9ab9-ec5806a0c526@suse.de>
Subject: Re: [PATCH v4 0/6] Cleanups for the nomodeset kernel command line
 parameter logic
References: <20211108140648.795268-1-javierm@redhat.com>
 <a8d93a19-c7e6-f651-a1cb-9e2742383c73@suse.de>
 <20211112105641.25a4e1a7@eldfell>
 <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>
In-Reply-To: <CAFOAJEd6wNDF93Z1Y6-62pnRzth9Fg4+56+jqCe2qmHk-adR1w@mail.gmail.com>

--------------mmiz1Zi3z0RoXqRLUNbnEKFI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMTEuMjEgdW0gMTA6Mzkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFBla2thLA0KPiANCj4gT24gMTEvMTIvMjEgMDk6NTYsIFBla2th
IFBhYWxhbmVuIHdyb3RlOg0KPiANCj4gW3NuaXBdDQo+IA0KPj4NCj4+IEhpLA0KPj4NCj4+
IHRoZXNlIGlkZWFzIG1ha2Ugc2Vuc2UgdG8gbWUsIHNvIEZXSVcsDQo+Pg0KPj4gQWNrZWQt
Ynk6IFBla2thIFBhYWxhbmVuIDxwZWtrYS5wYWFsYW5lbkBjb2xsYWJvcmEuY29tPg0KPj4N
Cj4gDQo+IFRoYW5rcy4NCj4gDQo+PiBUaGVyZSBpcyBvbmUgbml0cGljayBJJ2QgbGlrZSB0
byBhc2sgYWJvdXQ6DQo+Pg0KPj4gK2Jvb2wgZHJtX2dldF9tb2Rlc2V0KHZvaWQpDQo+PiAr
ew0KPj4gKyAgICAgcmV0dXJuICFkcm1fbm9tb2Rlc2V0Ow0KPj4gK30NCj4+ICtFWFBPUlRf
U1lNQk9MKGRybV9nZXRfbW9kZXNldCk7DQo+Pg0KPj4gRG9lc24ndCAiZ2V0IiBoYXZlIGEg
c3BlY2lhbCBtZWFuaW5nIGluIHRoZSBrZXJuZWwgbGFuZCwgbGlrZSAidGFrZSBhDQo+PiBz
dHJvbmcgcmVmZXJlbmNlIG9uIGFuIG9iamVjdCBhbmQgcmV0dXJuIGl0Ij8NCj4gDQo+IFRo
YXQncyBhIHZlcnkgZ29vZCBwb2ludC4NCj4gDQo+PiBBcyB0aGlzIGlzIGp1c3QgcmV0dXJu
aW5nIGJvb2wgd2l0aG91dCBjaGFuZ2luZyBhbnl0aGluZywgdGhlIHVzdWFsDQo+PiB3b3Jk
IHRvIHVzZSBpcyAiaXMiLiBTaW5jZSB0aGlzIGZ1bmN0aW9uIGlzIGFsc28gdXNlZCBhdCBt
b3N0IG9uY2UgcGVyDQo+PiBkcml2ZXIsIHdoaWNoIGlzIHJhcmVseSwgaXQgY291bGQgaGF2
ZSBhIGxvbmcgYW5kIGRlc2NyaXB0aXZlIG5hbWUuDQo+Pg0KPj4gRm9yIGV4YW1wbGU6DQo+
Pg0KPj4gYm9vbCBkcm1faXNfbW9kZXNldF9kcml2ZXJfYWxsb3dlZCh2b2lkKTsNCg0KSSdk
IG5vbWluYXRlDQoNCiAgIGJvb2wgZHJtX25hdGl2ZV9kcml2ZXJzX2VuYWJsZWQoKQ0KDQpU
aGlzIGlzIHdoYXQgSFctc3BlY2lmaWMgZHJpdmVycyB3YW50IHRvIHF1ZXJ5IGluIHRoZWly
IGluaXQvcHJvYmluZyANCmNvZGUuIFRoZSBhY3R1YWwgc2VtYW50aWNzIG9mIHRoaXMgZGVj
aXNpb24gaXMgaGlkZGVuIGZyb20gdGhlIGRyaXZlci4gDQpJdCdzIGFsc28gZWFzaWVyIHRv
IHJlYWQgdGhhbiB0aGUgb3RoZXIgbmFtZSBJTUhPDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4+DQo+IA0KPiBZZWFoLCBuYW1pbmcgaXMgaGFyZC4gSmFuaSBhbHNvIG1lbnRpb25l
ZCB0aGF0IGhlIGRpZG4ndCBsaWtlIHRoaXMNCj4gZnVuY3Rpb24gbmFtZSwgc28gSSBkb24n
dCBtaW5kIHRvIHJlLXNwaW4gdGhlIHNlcmllcyBvbmx5IGZvciB0aGF0Lg0KPiANCj4+IC0g
ImRybSIgaXMgdGhlIG5hbWVzcGFjZQ0KPj4gLSAiaXMiIGltcGxpZXMgaXQgaXMgYSByZWFk
LW9ubHkgYm9vbGVhbiBpbnNwZWN0aW9uDQo+PiAtICJtb2Rlc2V0IiBpcyB0aGUgZmVhdHVy
ZSBiZWluZyBjaGVja2VkDQo+PiAtICJkcml2ZXIiIGltcGxpZXMgaXQgaXMgc3VwcG9zZWQg
Z2F0ZSBkcml2ZXIgbG9hZGluZyBvcg0KPj4gICAgaW5pdGlhbGl6YXRpb24sIHJhdGhlciB0
aGFuIG1vZGVzZXRzIGFmdGVyIGRyaXZlcnMgaGF2ZSBsb2FkZWQNCj4+IC0gImFsbG93ZWQi
IHNheXMgaXQgaXMgYXNraW5nIGFib3V0IGdlbmVyYWwgcG9saWN5IHJhdGhlciB0aGFuIHdo
YXQgYQ0KPj4gICAgZHJpdmVyIGRvZXMNCj4+DQo+IA0KPiBJIGJlbGlldmUgdGhhdCBuYW1l
IGlzIG1vcmUgdmVyYm9zZSB0aGFuIG5lZWRlZC4gQnV0IGRvbid0IGhhdmUgYQ0KPiBzdHJv
bmcgb3BpbmlvbiBhbmQgY291bGQgdXNlIGl0IGlmIG90aGVycyBhZ3JlZS4NCj4gDQo+PiBK
dXN0IGEgYmlrZXNoZWQsIEknbGwgbGVhdmUgaXQgdG8gYWN0dWFsIGtlcm5lbCBkZXZzIHRv
IHNheSBpZiB0aGlzDQo+PiB3b3VsZCBiZSBtb3JlIGFwcHJvcHJpYXRlIG9yIHdvcnRoIGl0
Lg0KPj4NCj4gDQo+IEkgdGhpbmsgaXMgd29ydGggaXQgYW5kIGJldHRlciB0byBkbyBpdCBu
b3cgYmVmb3JlIHRoZSBwYXRjaGVzIGxhbmQsIGJ1dA0KPiB3ZSBjb3VsZCB3YWl0IGZvciBv
dGhlcnMgdG8gY2hpbWUgaW4uDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IC0tDQo+IEphdmll
ciBNYXJ0aW5leiBDYW5pbGxhcw0KPiBMaW51eCBFbmdpbmVlcmluZw0KPiBSZWQgSGF0DQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------mmiz1Zi3z0RoXqRLUNbnEKFI--

--------------00Nfo9cnDpm36MyYPMkJLo5N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGOPUkFAwAAAAAACgkQlh/E3EQov+D2
Pg//RkLrAE8LvmT9SoZl7i7bi03fneh8Ivk43Iw3zTs2TVNq32vI32lfpnO1YwnU+LvNOwmB77Ch
FN+a0HvJ8rE0XsbiX3baVogmqDYQ47iwTw6qC4A6H8C85kyhelnzwFkDSoixsC/x84/vBEe/Z8JX
jyvbrH2hkRi7dlT71OfMdpqy/OyzCOn3AKFubfIfcpc9pWSBJR7wxKznCRia0XyBY5V8z71h77rv
olC0sugDdDaEygFFSXZ/Eop35OI9fL1Y9TmfHHU30ayXgWHrI4KycDwFLBMkCO1UNb2SMMkL4tlY
yB8ZWieLd1GRxdKeDKunTSFXkRLp1ia3MiZXH6Fnt4VVGpEDuy8taEbQaeQxU73uHUn94hH+M3n9
yic6kPYJZot7T8TScNt+VKwvo/oC2cYUam+kyMmLYfV1Rr/4FAh6o6ksK79uX8epdc1alqhzM3vM
XiciYW4Em7GWn0+6KRBH7IQPU7VuE1FczCQhmucqSYt+tYF3aeTiVEptPs3TQbIQ+NDdk226bLzi
RK242X0s9T0fTG3cvVF67M013la2Y0DWL8avpwKcDTkFbBvds6Jrh8rPWF7HHqMvk8k2d8ZFzf5s
2/JmfbnbU81vhkEZY7t6wf7IraCwwvpng5TrENqD18t0BIHfU2NUlHUQG8ZvUN0rzi8WgOd8wZtm
+uo=
=yOv7
-----END PGP SIGNATURE-----

--------------00Nfo9cnDpm36MyYPMkJLo5N--
