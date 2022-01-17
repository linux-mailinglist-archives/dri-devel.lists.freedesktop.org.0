Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89B7490B17
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 16:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EA410E360;
	Mon, 17 Jan 2022 15:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F7D10E35D
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 15:05:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D9E1F212C6;
 Mon, 17 Jan 2022 15:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642431939; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XyZmC30U6sjtWN7TG3pC2JHIlqjaiAIKCoTYmErcjY8=;
 b=K1CdIC7ySlYn/05WwukFtZKvNmGlcnN+ieYWpEzqvNFVFUyPcfqA4HBXsegdpR0jUKnVb2
 RfuDrbNzziEpME3AJCpSQpLOWfefMSBAJJtU3WPEMT77K1Bu54FxYa+P8+m4w9EH6a3ONh
 FDPaU0DlqJkMxCzr3SRM3gA3ngkcx94=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642431939;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XyZmC30U6sjtWN7TG3pC2JHIlqjaiAIKCoTYmErcjY8=;
 b=trFPKxXLqcnyVc2KZM+naIzGP6zxRkQ0pzNUZVJCVwMf7/EA9Y7KH4OeUyEQ+G1/JcW6U+
 rJR+OUz9gSKmrNDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A0C8713B96;
 Mon, 17 Jan 2022 15:05:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XQAkJsOF5WGZMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Jan 2022 15:05:39 +0000
Message-ID: <faa46e76-d38c-f436-d005-ce69915033fb@suse.de>
Date: Mon, 17 Jan 2022 16:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------U6P7Sg8j3HvoICmTscu0hAe7"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------U6P7Sg8j3HvoICmTscu0hAe7
Content-Type: multipart/mixed; boundary="------------XRAqflnSekDgbJdZDKrbFRyX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <faa46e76-d38c-f436-d005-ce69915033fb@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
 <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>
In-Reply-To: <57d276d3-aa12-fa40-6f90-dc19ef393679@gmx.de>

--------------XRAqflnSekDgbJdZDKrbFRyX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDEuMjIgdW0gMTU6NDcgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IE9u
IDEvMTcvMjIgMTU6MTAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gWy4uLl0NCj4+
IFVzaW5nIGFuIFhSR0IzMiBpbnRlcm1lZGlhdGUgd291bGQga2lsbCB0aGUgdXNlciBleHBl
cmllbmNlIG9uIG9sZA0KPj4gbWFjaGluZXMsIGR1ZSB0byBib3RoIGluY3JlYXNlZCBtZW1v
cnkgdXNhZ2UgYW5kIGNvcHkgb3ZlcmhlYWQuDQo+Pg0KPj4+IFBlcnNvbmFsbHksIEknZCBt
dWNoIGFwcHJlY2lhdGUgaWYgdXNlcnNwYWNlIHdvdWxkIHN1cHBvcnQgbW9yZSBvZiB0aGUN
Cj4+PiBuYXRpdmUgZm9ybWF0cyBhbmQgbm90IHJlbHkgb24gWFJHQjMyLg0KPj4NCj4+IFN1
cHBvcnRpbmcgbW9ub2Nocm9tZSwgMTYgY29sb3JzLCBhbmQgMjU2IGNvbG9ycyB3b3VsZCBi
ZSBuaWNlLg0KPiANCj4gIEZyb20gdGhpcyBjb252ZXJzYXRpb24gaXQgc2VlbXMgRFJNIGNv
bXBsZXRlbHkgbGFja3MgYmFja3dhcmRzIGNvbXBhdGliaWxpdHksDQo+IGluY2x1ZGluZyBh
IG1pc3NpbmcgMkQgYml0Ymx0IGNvcHkuDQo+IElzbid0IHRoYXQgYWxsIHdoYXQncyBuZWVk
ZWQgYW5kIHRoZW4gbWlncmF0aW5nIGV4aXN0aW5nIGRyaXZlcnMgd291bGQNCj4gYmUgZWFz
eSA/DQoNCldoYXQgZXhhY3RseSBkbyB5b3UgbWVhbiBieSAnYmFja3dhcmRzIGNvbXBhdGli
aWxpdHknPyBUaGUgZHJpdmVyIEFQSSBpcyANCmRpZmZlcmVudCwgb2YgY291cnNlLiBNeSBj
b252ZXJzaW9uIGhlbHBlcnMgY2FuIHByb3ZpZGUgYSBzdGFydGluZyBwb2ludCANCnRvIG1v
dmUgZmJkZXYgY29kZSBpbnRvIERSTSBkcml2ZXJzLg0KDQpGb3IgZmJkZXYgMmQtYml0Ymx0
IGlvY3RscywgeW91IGNhbiBhZGQgdGhlbSB0byBEUk0gZHJpdmVycyBhbmQgc2V0IHVwIA0K
RFJNJ3MgZmJkZXYgZW11bGF0aW9uIGFjY29yZGluZ2x5LiBTb21lIERSTSBkcml2ZXJzIGRv
L2RpZCB0aGlzLiBUbyBteSANCmtub3dsZWRnZSwgc28gZmFyIHRoZXJlJ3Mgbm90IGJlZW4g
YSB1c2UgY2FzZSB3aGVyZSB0aGF0IHByb3ZpZGVzIGEgDQpiZW5lZml0IG92ZXIgc2ltcGxl
IG1lbWNweS4gRm9yIGZhc3QgMmQgYmxpdHRpbmcgZnJvbSB1c2Vyc3BhY2UsIHlvdSANCnNo
b3VsZCByZWFkIERhbmllbCdzIGNvbW1lbnQgYXQgWzFdLiB0bDtkcjogYSBnZW5lcmljIHNv
bHV0aW9uIGlzIA0Kbm9uLXRyaXZpYWwuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsx
XSBodHRwczovL2Jsb2cuZmZ3bGwuY2gvMjAxOC8wOC9uby0yZC1pbi1kcm0uaHRtbA0KDQo+
IA0KPiBIZWxnZQ0KPiANCj4gDQo+Pj4+IFRoaXMgbm90IG9ubHkgdG8gc3VwcG9ydCAib2xk
IiBoYXJkd2FyZSwgYnV0IGFsc28gbW9kZXJuIHNtYWxsIE9MRUQNCj4+Pj4gYW5kIGUtaW5r
IGRpc3BsYXlzLg0KPj4+DQo+Pj4gVGhlcmUncyBhIERSTSBkcml2ZXIgZm9yIFJlcGFwZXIg
ZS1JbmsgZGlzcGxheXMuIFNvIGl0IHNlZW1zIGRvYWJsZSBhdA0KPj4+IGxlYXN0Lg0KPj4N
Cj4+IFdoaWNoIHVzZXMgYW4gRFJNX0ZPUk1BVF9YUkdCODg4OCBpbnRlcm1lZGlhdGUsIGFu
ZA0KPj4gZHJtX2ZiX3hyZ2I4ODg4X3RvX2dyYXk4KCkgYW5kIHJlcGFwZXJfZ3JheThfdG9f
bW9ub19yZXZlcnNlZCgpDQo+PiB0byBjb252ZXJ0IGZyb20gdHJ1ZWNvbG9yIHRvIG1vbm9j
aHJvbWUuICBJIGd1ZXNzIHRoYXQgd291bGQgd29yaywNCj4+IGFzIHRoaXMgaXMgYSBzbG93
IGUtaW5rIGRpc3BsYXkuICBIYXZlIGZ1biBhcyBhIHRleHQgY29uc29sZSA7LSkNCj4+DQo+
PiBHcntvZXRqZSxlZXRpbmd9cywNCj4+DQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
R2VlcnQNCj4+DQo+PiAtLQ0KPj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZw0KPj4NCj4+
IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNh
bGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4N
Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
DQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------XRAqflnSekDgbJdZDKrbFRyX--

--------------U6P7Sg8j3HvoICmTscu0hAe7
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHlhcMFAwAAAAAACgkQlh/E3EQov+At
pQ/+LUuZ5uf/Je4+jhq3lowFD+6Wv+T2aYnnIYbB5A23b5zumo+Z30WmEQpIrDHo7TloFaPs4DGl
hjLmBOIWFMhFdBzL+cchiMxyYh9Dij81gE86LK4ERkZj89WTAStB6EEY8NBdVRm/yWQQid5vfh0G
Y9zfgkbW6lSOpAUmwBsL/1mpSd0FG+DyatCp14jAJiGoi8x/9UON+j9bFuQjhJimXQQLCja1i7Kz
HTaM3a3ZxqiIGJbToKtSFpEuU+NxcJwQ8wyXX+ZpGa9UC9ztYf4xP9ovWedNH0ZqtesdwEhOWrj3
0Pmx+MnW6yRQ4QK2dtKX3O2ZMBPznFEEIU2RVuUR7k0BErI8WiG9V1w4uWltAZ++HXL6YITuRDMS
NItGHiqwRNLkz3pAC6/yw2dntjQNgOkmvpnVysbGpOXF6Q8qXO+QaogyyHPzhhvqoIDuZP9w6vBB
r9RQYp+wZY6UMknL/EDRIc+Ux8qjbWRINQN7JuEAaSvvMzUyrCIYRUiFeTu0FNBGi7qERZg4kSQ1
WwX/QnV1ty+eeIWiNDjvtWHuf+M47yT5E3BUgwn8UqaE9Me687PsW3d4lfX8DX4f1qqYws4DmQhk
i8WJdj1p81juhyIMi4Y+VXxlER/FspU+hYdoRtHBMA+1bCLfo7jsSBuikH0qV8aVkiLHA8Yq9Szl
Hy0=
=cnlU
-----END PGP SIGNATURE-----

--------------U6P7Sg8j3HvoICmTscu0hAe7--
