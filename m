Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF92051B916
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 09:30:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8DB10E41D;
	Thu,  5 May 2022 07:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD07E10E41D
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 07:30:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8B1C91F37F;
 Thu,  5 May 2022 07:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651735854; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RVhAutEURwKYI9EwPvrBzP9OwrG2VfEeuFYvrta+1gI=;
 b=Fr4XgIbC3BxdVSnnLxfqWyk+E70Z4OchWrrYAHFWNKdjxy5kbbNUTVVTq+1BsAIjPVOCKu
 SVPt6MQzNNnHtYpRVZP+2U3xHO1yEtBrod+XP29hDggcqJTIR5EVSfSY6Fk8mMLFSq0lee
 qWBMdNuaU0iEcGPyyaGU5O0diXLhpY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651735854;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RVhAutEURwKYI9EwPvrBzP9OwrG2VfEeuFYvrta+1gI=;
 b=hpsv4raseyWTyPWIv7IJjzmFm+WRYfln8TLWJfuzcRtI4fzoeT64cqhPwxZT1Qd8EqTeEh
 Bgnf09a1r1nnhrAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F8E213A65;
 Thu,  5 May 2022 07:30:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SReHFi59c2KucQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 May 2022 07:30:54 +0000
Message-ID: <b82329d5-19af-77b5-ea7d-757b95959ab6@suse.de>
Date: Thu, 5 May 2022 09:30:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/3] fbdev/efifb: Cleanup fb_info in .fb_destroy rather
 than .remove
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215806.57147-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220504215806.57147-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ptHWC0fUS4Ywhsgq5vE8pImc"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, linux-fbdev@vger.kernel.org,
 Peter Jones <pjones@redhat.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ptHWC0fUS4Ywhsgq5vE8pImc
Content-Type: multipart/mixed; boundary="------------ASTQ7tbYKtJYHHvEpp7qFui5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 Peter Jones <pjones@redhat.com>
Message-ID: <b82329d5-19af-77b5-ea7d-757b95959ab6@suse.de>
Subject: Re: [PATCH 3/3] fbdev/efifb: Cleanup fb_info in .fb_destroy rather
 than .remove
References: <20220504215151.55082-1-javierm@redhat.com>
 <20220504215806.57147-1-javierm@redhat.com>
In-Reply-To: <20220504215806.57147-1-javierm@redhat.com>

--------------ASTQ7tbYKtJYHHvEpp7qFui5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA0LjA1LjIyIHVtIDIzOjU4IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaGUgZHJpdmVyIGlzIGNhbGxpbmcgZnJhbWVidWZmZXJfcmVsZWFzZSgpIGlu
IGl0cyAucmVtb3ZlIGNhbGxiYWNrLCBidXQNCj4gdGhpcyB3aWxsIGNhdXNlIHRoZSBzdHJ1
Y3QgZmJfaW5mbyB0byBiZSBmcmVlZCB0b28gZWFybHkuIFNpbmNlIGl0IGNvdWxkDQo+IGJl
IHRoYXQgYSByZWZlcmVuY2UgaXMgc3RpbGwgaG9sZCB0byBpdCBpZiB1c2VyLXNwYWNlIG9w
ZW5lZCB0aGUgZmJkZXYuDQo+IA0KPiBUaGlzIHdvdWxkIGxlYWQgdG8gYSB1c2UtYWZ0ZXIt
ZnJlZSBlcnJvciBpZiB0aGUgZnJhbWVidWZmZXIgZGV2aWNlIHdhcw0KPiB1bnJlZ2lzdGVy
ZWQgYnV0IGxhdGVyIGEgdXNlci1zcGFjZSBwcm9jZXNzIHRyaWVzIHRvIGNsb3NlIHRoZSBm
YmRldiBmZC4NCj4gDQo+IFRoZSBjb3JyZWN0IHRoaW5nIHRvIGRvIGlzIHRvIG9ubHkgdW5y
ZWdpc3RlciB0aGUgZnJhbWVidWZmZXIgaW4gdGhlDQo+IGRyaXZlcidzIC5yZW1vdmUgY2Fs
bGJhY2ssIGJ1dCBkbyBhbnkgY2xlYW51cCBpbiB0aGUgZmJfb3BzLmZiX2Rlc3Ryb3kuDQo+
IA0KPiBTdWdnZXN0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwu
Y2g+DQo+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVy
bUByZWRoYXQuY29tPg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+IA0KPiAgIGRyaXZlcnMvdmlkZW8vZmJkZXYv
ZWZpZmIuYyB8IDkgKysrKysrKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvZWZpZmIuYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYw0KPiBpbmRleCBl
YTQyYmE2NDQ1YjIuLmNmYTNkYzBiNGVlZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRl
by9mYmRldi9lZmlmYi5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvZWZpZmIuYw0K
PiBAQCAtMjQzLDYgKzI0MywxMCBAQCBzdGF0aWMgdm9pZCBlZmlmYl9zaG93X2Jvb3RfZ3Jh
cGhpY3Moc3RydWN0IGZiX2luZm8gKmluZm8pDQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGVm
aWZiX3Nob3dfYm9vdF9ncmFwaGljcyhzdHJ1Y3QgZmJfaW5mbyAqaW5mbykge30NCj4gICAj
ZW5kaWYNCj4gICANCj4gKy8qDQo+ICsgKiBmYl9vcHMuZmJfZGVzdHJveSBpcyBjYWxsZWQg
YnkgdGhlIGxhc3QgcHV0X2ZiX2luZm8oKSBjYWxsIGF0IHRoZSBlbmQNCj4gKyAqIG9mIHVu
cmVnaXN0ZXJfZnJhbWVidWZmZXIoKSBvciBmYl9yZWxlYXNlKCkuIERvIGFueSBjbGVhbnVw
IGhlcmUuDQo+ICsgKi8NCj4gICBzdGF0aWMgdm9pZCBlZmlmYl9kZXN0cm95KHN0cnVjdCBm
Yl9pbmZvICppbmZvKQ0KPiAgIHsNCj4gICAJaWYgKGVmaWZiX3BjaV9kZXYpDQo+IEBAIC0y
NTQsNiArMjU4LDkgQEAgc3RhdGljIHZvaWQgZWZpZmJfZGVzdHJveShzdHJ1Y3QgZmJfaW5m
byAqaW5mbykNCj4gICAJCWVsc2UNCj4gICAJCQltZW11bm1hcChpbmZvLT5zY3JlZW5fYmFz
ZSk7DQo+ICAgCX0NCj4gKw0KPiArCWZyYW1lYnVmZmVyX3JlbGVhc2UoaW5mbyk7DQo+ICsN
Cj4gICAJaWYgKHJlcXVlc3RfbWVtX3N1Y2NlZWRlZCkNCj4gICAJCXJlbGVhc2VfbWVtX3Jl
Z2lvbihpbmZvLT5hcGVydHVyZXMtPnJhbmdlc1swXS5iYXNlLA0KPiAgIAkJCQkgICBpbmZv
LT5hcGVydHVyZXMtPnJhbmdlc1swXS5zaXplKTsNCj4gQEAgLTYyMCw5ICs2MjcsOSBAQCBz
dGF0aWMgaW50IGVmaWZiX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0K
PiAgIHsNCj4gICAJc3RydWN0IGZiX2luZm8gKmluZm8gPSBwbGF0Zm9ybV9nZXRfZHJ2ZGF0
YShwZGV2KTsNCj4gICANCj4gKwkvKiBlZmlmYl9kZXN0cm95IHRha2VzIGNhcmUgb2YgaW5m
byBjbGVhbnVwICovDQo+ICAgCXVucmVnaXN0ZXJfZnJhbWVidWZmZXIoaW5mbyk7DQo+ICAg
CXN5c2ZzX3JlbW92ZV9ncm91cHMoJnBkZXYtPmRldi5rb2JqLCBlZmlmYl9ncm91cHMpOw0K
PiAtCWZyYW1lYnVmZmVyX3JlbGVhc2UoaW5mbyk7DQo+ICAgDQo+ICAgCXJldHVybiAwOw0K
PiAgIH0NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------ASTQ7tbYKtJYHHvEpp7qFui5--

--------------ptHWC0fUS4Ywhsgq5vE8pImc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJzfS0FAwAAAAAACgkQlh/E3EQov+Af
jxAAzB/TyoHA5QRuIlAE8elSNC1GyybTKp7kAhIVV1uXXc3Bw53NbjySKtm2sEjqDn2edC6hKpLT
8jFizfsY5z0EBIHtAn6oHKVGM28wpXz9ngtQj746DfKRuESwGTBAePhUIR2Qe1XxdhYY2oKAmUdO
WhAvpdXGOjj7MVXq6E59lI/1lnC2jHoMrDoTsvrDDCXQz32cv6wEpws0ayN/8oS9uJp6AG78yQ2g
Krkhl8aQ7VLnjhZUvzOkZz40ZhAPhwJkIqhcmrCun0uKxxizYnzfRmtJyQ+muFrru9cBUMVaGp7Y
7K/9ildEO8AtWdlFrbNKIGNafJYMAL7ph7P7yNYJBPlrHSRoL//LiTw/ORJkMJ2/imKBli01rWWi
B2fJEs0bSovEfHWdsntRSkQLJrPKfPCQhzm/oN34HvLK5xHbFR/U50ZkKLl9svlMdQ5o98nVcY15
4TZC9khy/kd4c9P61/mbAYnz5xkajJA1BpgiDu7KhIMKzYo+gM/cH7gnyOfbgFMF0M3OJHYlaEZO
tW90H1r0YoXMRTtsXbuL78mbcaoC0fRV/i25GD6oZakToYdJWH8EaXXP3yXK+0djYPIXOuHMDjmB
/FYJMdWE104y/kGAUB0Qjn9T8/du496+/Mjwr/cqFLFes7JdmRKxN5eHuvOfuDWnOeZ6opC8c9Wm
it8=
=mZBg
-----END PGP SIGNATURE-----

--------------ptHWC0fUS4Ywhsgq5vE8pImc--
