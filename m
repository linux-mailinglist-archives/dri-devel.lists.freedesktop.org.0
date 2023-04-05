Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5B6D7F90
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 16:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A74910E99B;
	Wed,  5 Apr 2023 14:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCC610E0B0;
 Wed,  5 Apr 2023 14:32:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 51F862069C;
 Wed,  5 Apr 2023 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680705140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZSnuSP7BVIOXXpJOY0KqExQSM1y7aqdT9q/P4WzNUqo=;
 b=H6m7pakLHMWEJFXIezef/DI/5Asm5G5zUDhfv98DUFLljgfsUsjZlkPPadJ3KmAwlwK1gB
 Zwp4aNs0iaEujda5swv7Ytk5Muc5+aShGKSyJzQSFPkQnkn1YxegiT7AMDWgI09FU6AfHz
 aDUjDxJoJSIJ3sYHpXI8DxL435Kwv9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680705140;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZSnuSP7BVIOXXpJOY0KqExQSM1y7aqdT9q/P4WzNUqo=;
 b=SgtkDH7IUI2Xy6v7bnr+k3FwNHuq/72ZQRUhH94UWlovmqK5o4DoZK3B3rv9DdCOgkvXEd
 YqeHSDnCZ5/qEDAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D3A413A31;
 Wed,  5 Apr 2023 14:32:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AqUYCnSGLWQzDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 14:32:20 +0000
Message-ID: <242ab20f-affe-b55a-6068-5ea634705cf6@suse.de>
Date: Wed, 5 Apr 2023 16:32:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
 <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
 <ZC04hoHywz0ySzAW@phenom.ffwll.local>
 <3fd03c4c-3be6-e56b-faec-bd67a58cda09@suse.de>
 <ZC1BlNCbXPlmAhj0@phenom.ffwll.local>
 <eee11545-2a78-4556-be82-5178ea09d0d8@suse.de>
 <877cuqd1f8.fsf@minerva.mail-host-address-is-not-set>
 <ZC11J3og4Kc9ta6m@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ZC11J3og4Kc9ta6m@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4PmhqyHlRHx0JuypuvWqbpBH"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4PmhqyHlRHx0JuypuvWqbpBH
Content-Type: multipart/mixed; boundary="------------RwLvQadIHV9YVAfFSgdtwm3o";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <242ab20f-affe-b55a-6068-5ea634705cf6@suse.de>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
 <5556a755-01a1-3620-8693-0fc69c6f627d@suse.de>
 <3813a2f5-c74a-4760-34ce-1c88f187c91c@suse.de>
 <ZC04hoHywz0ySzAW@phenom.ffwll.local>
 <3fd03c4c-3be6-e56b-faec-bd67a58cda09@suse.de>
 <ZC1BlNCbXPlmAhj0@phenom.ffwll.local>
 <eee11545-2a78-4556-be82-5178ea09d0d8@suse.de>
 <877cuqd1f8.fsf@minerva.mail-host-address-is-not-set>
 <ZC11J3og4Kc9ta6m@phenom.ffwll.local>
In-Reply-To: <ZC11J3og4Kc9ta6m@phenom.ffwll.local>

--------------RwLvQadIHV9YVAfFSgdtwm3o
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDQuMjMgdW0gMTU6MTggc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBXZWQsIEFwciAwNSwgMjAyMyBhdCAwMToxNjoyN1BNICswMjAwLCBKYXZpZXIgTWFydGlu
ZXogQ2FuaWxsYXMgd3JvdGU6DQo+PiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4gd3JpdGVzOg0KPj4NCj4+IFsuLi5dDQo+Pg0KPj4+DQo+Pj4gWW91ciBjb21t
ZW50IHNheXMgdGhhdCBpdCBjYWxscyBhIFBDSSBmdW5jdGlvbiB0byBjbGVhbiB1cCB0byB2
Z2Fjb24uDQo+Pj4gVGhhdCBjb21tZW50IGV4cGxhaW5zIHdoYXQgaXMgaGFwcGVuaW5nLCBu
b3Qgd2h5LiBBbmQgaG93IHRoZSBQQ0kgYW5kDQo+Pj4gdmdhY29uIGNvZGUgd29yayB0b2dl
dGhlciBpcyBub24tb2J2aW91cy4NCj4gDQo+IFdvdWxkIGEgYmV0dGVyIGNvbW1lbnQgaGVs
cCB0aGVuOg0KPiANCj4gCS8qDQo+IAkgKiBnbWE1MDAgaXMgYSBzdHJhbmdlIGh5YnJpZCBk
ZXZpY2UsIHdoaWNoIGJvdGggYWN0cyBhcyBhIHBjaQ0KPiAJICogZGV2aWNlIChmb3IgbGVn
YWN5IHZnYSBmdW5jdGlvbmFsaXR5KSBidXQgYWxzbyBtb3JlIGxpa2UgYW4NCj4gCSAqIGlu
dGVncmF0ZWQgZGlzcGxheSBvbiBhIFNvQyB3aGVyZSB0aGUgZnJhbWVidWZmZXIgc2ltcGx5
DQo+IAkgKiByZXNpZGVzIGluIG1haW4gbWVtb3J5IGFuZCBub3QgaW4gYSBzcGVjaWFsIHBj
aSBiYXIgKHRoYXQNCj4gCSAqIGludGVybmFsbHkgcmVkaXJlY3RzIHRvIGEgc3RvbGVuIHJh
bmdlIG9mIG1haW4gbWVtb3J5KSBsaWtlIGFsbA0KPiAJICogb3RoZXIgaW50ZWdyYXRlZCBw
Y2kgZGlzcGxheSBkZXZpY2VzIGhhdmUuDQo+IAkgKg0KPiAJICogVG8gY2F0Y2ggYWxsIGNh
c2VzIHdlIG5lZWQgdG8gYm90aCByZW1vdmUgY29uZmxpY3RpbmcgZncNCj4gCSAqIGRyaXZl
cnMgZm9yIHRoZSBwY2kgZGV2aWNlIGFuZCBtYWluIG1lbW9yeS4NCj4gCSAqLw0KDQpUb2dl
dGhlciB3aXRoIHRoZSBleGlzdGluZyBjb21tZW50LCB0aGlzIHNob3VsZCBiZSB0aGUgY29t
bWVudCB0byANCmRlc2NyaWJlIGdtYV9yZW1vdmVfY29uZmxpY3RpbmdfZnJhbWVidWZmZXJz
KCkuDQoNCj4+Pg0KPj4+IEFnYWluLCBoZXJlJ3MgbXkgcHJvcG9zYWwgZm9yIGdtYTUwMDoN
Cj4+Pg0KPj4+IC8vIGNhbGwgdGhpcyBmcm9tIHBzYl9wY2lfcHJvYmUoKQ0KPj4+IGludCBn
bWFfcmVtb3ZlX2NvbmZsaWN0aW5nX2ZyYW1lYnVmZmVycyhzdHJ1Y3QgcGNpX2RldiAqcGRl
diwgY29uc3QNCj4+PiAJCQkJCXN0cnVjdCBkcm1fZHJpdmVyICpyZXFfZHJpdmVyKQ0KPj4+
IHsNCj4+PiAJcmVzb3VyY2Vfc2l6ZV90IGJhc2UgPSAwOw0KPj4+IAlyZXNvdXJjZV9zaXpl
X3Qgc2l6ZSA9IChyZXNvdXJjZV9zaXplX3QpLTE7DQo+Pj4gCWNvbnN0IGNoYXIgKm5hbWUg
PSByZXFfZHJpdmVyLT5uYW1lOw0KPj4+IAlpbnQgcmV0Ow0KPj4+DQo+Pj4gCS8qDQo+Pj4g
CSAqIFdlIGNhbm5vdCB5ZXQgZWFzaWx5IGZpbmQgdGhlIGZyYW1lYnVmZmVyJ3MgbG9jYXRp
b24gaW4NCj4+PiAJICogbWVtb3J5LiBTbyByZW1vdmUgYWxsIGZyYW1lYnVmZmVycyBoZXJl
Lg0KPj4+IAkgKg0KPj4+IAkgKiBUT0RPOiBSZWZhY3RvciBwc2JfZHJpdmVyX2xvYWQoKSB0
byBtYXAgdmRjX3JlZyBlYXJsaWVyLiBUaGVuDQo+Pj4gCSAqICAgICAgIHdlIG1pZ2h0IGJl
IGFibGUgdG8gcmVhZCB0aGUgZnJhbWVidWZmZXIgcmFuZ2UgZnJvbSB0aGUNCj4+PiAJICog
ICAgICAgZGV2aWNlLg0KPj4+IAkgKi8NCj4+PiAJcmV0ID0gYXBlcnR1cmVfcmVtb3ZlX2Nv
bmZsaWN0aW5nX2RldmljZXMoYmFzZSwgc2l6ZSwgbmFtZSk7DQo+IA0KPiBXaHkgY2FuJ3Qg
dGhpcyBiZSBhIGNhbGwgdG8gZHJtX2FwZXJ0dXJlX3JlbW92ZV9mcmFtZWJ1ZmZlcnM/IEF0
IGxlYXN0IGFzDQo+IGxvbmcgYXMgd2UgZG9uJ3QgaW1wbGVtZW50IHRoZSAicmVhZCBvdXQg
YWN0dWFsIGZiIGJhc2UgYW5kIHNpemUiIGNvZGUsDQo+IHdoaWNoIGFsc28gbm9uZSBvZiB0
aGUgb3RoZXIgc29jIGRyaXZlcnMgYm90aGVyIHdpdGg/DQoNCkl0IGNhbi4gRmVlbCBmcmVl
IHRvIHVzZSBpdC4NCg0KQnV0IEkgaGF2ZSB0byBzYXkgdGhhdCB0aG9zZSBEUk0gaGVscGVy
cyBhcmUgc29tZXdoYXQgZW1wdHkgYW5kIG9ic29sZXRlIA0KYWZ0ZXIgdGhlIGFwZXJ0dXJl
IGNvZGUgaGFzIGJlZW4gbW92ZWQgdG8gZHJpdmVycy92aWRlby8uIFRoZXkgZXhpc3QgDQpt
b3N0bHkgZm9yIGNvbnZlbmllbmNlLiBBcyB3aXRoIG90aGVyIERSTSBoZWxwZXJzLCBpZiBh
IGRyaXZlciBuZWVkcyANCnNvbWV0aGluZyBzcGVjaWFsLCBpdCBjYW4gaWdub3JlIHRoZW0u
DQoNCj4gDQo+Pj4gCWlmIChyZXQpDQo+Pj4gCQlyZXR1cm4gcmV0Ow0KPj4+DQo+Pj4gCS8q
DQo+Pj4gCSAqIFdBUk5JTkc6IEFwcGFyZW50bHkgd2UgbXVzdCBraWNrIGZiZGV2IGRyaXZl
cnMgYmVmb3JlIHZnYWNvbiwNCj4+PiAJICogb3RoZXJ3aXNlIHRoZSB2Z2EgZmJkZXYgZHJp
dmVyIGZhbGxzIG92ZXIuDQo+Pj4gCSAqLw0KPj4+IAlyZXQgPSB2Z2FfcmVtb3ZlX3ZnYWNv
bihwZGV2KTsNCj4gDQo+IFRoaXMgaXNuJ3QgZW5vdWdoLCB3ZSBhbHNvIG51a2Ugc3R1ZmYg
dGhhdCdzIG1hcHBpbmcgdGhlIHZnYSBmYiByYW5nZS4NCj4gV2hpY2ggaXMgcmVhbGx5IHRo
ZSByZWFzb24gSSBkb24ndCB3YW50IHRvIG9wZW4gY29kZSByYW5kb20gc3R1ZmYsIHBjaSBp
cw0KPiBzZWxmLWRlc2NyaWJpbmcsIGlmIGl0J3MgZGVjb2RpbmcgbGVnYWN5IHZnYSBpdCBj
YW4gZmlndXJlIHRoaXMgb3V0IGFuZCB3ZQ0KPiBvbmx5IGhhdmUgdG8gaW1wbGVtZW50IHRo
ZSAiaG93IGRvIEkgbnVrZSBsZWdhY3kgdmdhIGZ3IGRyaXZlcnMgZnJvbSBhIHBjaQ0KPiBk
cml2ZXIiIG9uY2UuDQoNClN1cmUsIGJ1dCBpdCdzIHJlYWxseSBqdXN0IG9uZSBhZGRpdGlv
bmFsIGxpbmU6DQoNCiAgIGFwZXJ0dXJlX2RldGFjaF9kZXZpY2VzKFZHQV9GQl9QSFlTX0JB
U0UsIFZHQV9GQl9QSFlTX1NJWkUpOw0KDQphcyB5b3UgbWVudGlvbiBiZWxvdywgdGhpcyBh
bmQgdmdhY29uIGNhbiBiZSBleHBvcnRlZCBpbiBhIHNpbmdsZSBWR0EgDQphcGVydHVyZSBo
ZWxwZXIuDQoNCj4gDQo+IE5vdCB0d2ljZSBsaWtlIHRoaXMgd291bGQgcmVzdWx0IGluLCB3
aXRoIHRoZSBnbWE1MDAgdmVyc2lvbiBiZWluZyBvbmx5DQo+IGhhbGYgdGhlIHRoaW5nLg0K
PiANCj4gSWYgaXQgYWJzb2x1dGVseSBoYXMgdG8gYmUgYSBzZXBhcmF0ZSBmdW5jdGlvbiBm
b3IgdGhlIGdtYTUwMCBwY2kgbGVnYWN5DQo+IHZnYSAoSSBzdGlsbCBkb24ndCBnZXQgd2h5
LCBpdCdzIGp1c3QgYSBwY2kgdmdhIGRldmljZSwgdGhlcmUncyBhYnNvbHV0ZWx5DQo+IG5v
dGhpbmcgc3BlY2lhbCBhYm91dCB0aGF0IHBhcnQgYXQgYWxsKSB0aGVuIEkgdGhpbmsgaXQg
bmVlZHMgdG8gYmUgYXQNCj4gbGVhc3QgYSBjb21tb24gIm51a2UgYSBsZWdhY3kgdmdhIGRl
dmljZSBmb3IgbWUgcGxzIiBmdW5jdGlvbiwgd2hpY2gNCj4gc2hhcmVzIHRoZSBpbXBsZW1l
bnRhdGlvbiB3aXRoIHRoZSBwY2kgb25lLg0KDQpTdXJlDQoNCi8qKg0KICAqIGtlcm5lbGRv
YyBnb2VzIGhlcmUNCiAgKg0KICAqIFdBUk5JTkc6IEFwcGFyZW50bHkgd2UgbXVzdCByZW1v
dmUgZ3JhcGhpY3MgZHJpdmVycyBiZWZvcmUgY2FsbGluZw0KICAqICAgICAgICAgIHRoaXMg
aGVscGVyLiBPdGhlcndpc2UgdGhlIHZnYSBmYmRldiBkcml2ZXIgZmFsbHMgb3ZlciBpZg0K
ICAqICAgICAgICAgIHdlIGhhdmUgdmdhY29uIGNvbmZpZ3VyZWQuDQogICovDQppbnQgYXBl
cnR1cmVfcmVtb3ZlX2xlZ2FjeV92Z2FfZGV2aWNlcyhzdHJ1Y3QgcGNpX2RldiAqcGRldikN
CnsNCglhcGVydHVyZV9kZXRhY2hfZGV2aWNlcyhWR0FfRkJfUEhZU19CQVNFLCBWR0FfRkJf
UEhZU19TSVpFKTsNCg0KCXJldHVybiB2Z2FfcmVtb3ZlX3ZnYWNvbihwZGV2KTsNCn0NCg0K
QW5kIHRoYXQgY2FuIGJlIGNhbGxlZCBmcm9tIGdtYTUwMCBhbmQgdGhlIHBjaSBhcGVydHVy
ZSBoZWxwZXIuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEJ1dCBub3Qgb3Bl
bi1jb2RpbmcganVzdCBoYWxmIG9mIGl0IG9ubHkuDQo+IA0KPj4+IAlpZiAocmV0KQ0KPj4+
IAkJcmV0dXJuIHJldDsNCj4+Pg0KPj4+IAlyZXR1cm4gMDsNCj4+PiB9DQo+Pj4NCj4+DQo+
PiBJZiB0aGlzIGlzIGVub3VnaCBJIGFncmVlIHRoYXQgaXMgbXVjaCBtb3JlIGVhc2llciBj
b2RlIHRvIHVuZGVyc3RhbmQuDQo+IA0KPiBJdCdzIHN0aWxsIHR3byBjYWxscyBhbmQgbW9y
ZSBjb2RlIHdpdGggbW9yZSBidWdzPyBJJ20gbm90IHNlZWluZyB0aGUNCj4gcG9pbnQuDQo+
IC1EYW5pZWwNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------RwLvQadIHV9YVAfFSgdtwm3o--

--------------4PmhqyHlRHx0JuypuvWqbpBH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQthnMFAwAAAAAACgkQlh/E3EQov+Bd
VQ//ZS0S41oEEtdFEW3N4SAAlZoCX88q9k0U0sK+sOvtu4mCfrHFg4jQrtlmLFJVXXevW6SlukQL
h9BdInTFpSy+hwpN6IAXPviI4KdKlJg1IbFozptcVUGrAeFPGi63g1VOM+vkdvBRrB6zk8heA69l
huozF8ZazpHonOyE81UrPTMfrwPoDsT2CM31fq70zHHS+Dyl159cft/dsEWJznmWqmCkIMe7DZNp
dVhB40Mk116jAhz9e8wudPUNeWkkMMmwcaR+OxWo7E+E5ETj7WmCOlXI1lbxCHcYPHgjp+Aw4f5i
a6syitVAKWIl2HqWB7xwWdA+6tdDHL7VGDfyoTx2RzVOZQnWh/Nf4BoAoWM3p/6m+CGT0pqM9tNF
k5kC79FZTZjMEzaD5CS+huWjuz87wsrMGXdGIHdO+AUJH1XQcodj+CNh22C0yw9eFqDvzP1hdvLO
3CEPuTMm7BcBXwP36FaD8eGJqseM+MAlslYcvR08a9xxKyomWop6ORG2tiXJ5RIN/8Tyb35quyfj
fDovPJnvw54hW5FqEPHsksTe1QL1eGnI4qAkv19aCnnxR2d8ZFXDqdjahWufnldRM+iVQezxWMA9
Y9HO/q2DV7b6tOgQY07EEjokkjURFxIoVv2SR37EInosVWPe7BS09QHOjxO2pLFcPUJnOTY8NaUv
96w=
=BCD5
-----END PGP SIGNATURE-----

--------------4PmhqyHlRHx0JuypuvWqbpBH--
