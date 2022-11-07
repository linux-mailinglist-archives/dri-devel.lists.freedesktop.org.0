Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 030C761F7A9
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 16:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F82710E3EA;
	Mon,  7 Nov 2022 15:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0688110E3EB
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 15:30:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9E5832249D;
 Mon,  7 Nov 2022 15:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667835046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RFvVWVoUuNWKBbLyJaNTclgMYrXQ56OHu2+pP7R135Y=;
 b=umYCRr8kM4Bv5+O4GT7NlYVhCCd57jAhxqr5ksqGIkN5MQjDNHlXezKrAz9zrW/etXf8aU
 /cKhzO2ayZ+zN4x5rPutYVydd6yOESzpmM8SQxDLS9IXtNUKSOdcoJ8hADXO9kqbXbl5Pa
 NwfnxBJwauGvZy/HOpI6RPXoX3jpX50=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667835046;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RFvVWVoUuNWKBbLyJaNTclgMYrXQ56OHu2+pP7R135Y=;
 b=Hsl3iUDzyfjvcsz0/KrhsU1sW4IWOke6XWoVr+15ypKag/4blLzksPOcLMn0N83iaXCgPZ
 eMdPler+NGfqhFDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7716213494;
 Mon,  7 Nov 2022 15:30:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kA3gG6YkaWOwKAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Nov 2022 15:30:46 +0000
Message-ID: <6547fba2-a002-f339-2997-5b28df794095@suse.de>
Date: Mon, 7 Nov 2022 16:30:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, daniel@ffwll.ch, javierm@redhat.com
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
 <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uFHY0RRLZAxEbawAVao3bITA"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uFHY0RRLZAxEbawAVao3bITA
Content-Type: multipart/mixed; boundary="------------JLBeDWzj1CbxAZo0J0OLGQ6Y";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, daniel@ffwll.ch, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <6547fba2-a002-f339-2997-5b28df794095@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
 <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>
In-Reply-To: <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>

--------------JLBeDWzj1CbxAZo0J0OLGQ6Y
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTEuMjIgdW0gMTQ6NTcgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IE9u
IDExLzcvMjIgMTE6NDksIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gU3VwcG9ydCB0
aGUga2VybmVsJ3Mgbm9tb2Rlc2V0IHBhcmFtZXRlciBmb3IgYWxsIFBDSS1iYXNlZCBmYmRl
dg0KPj4gZHJpdmVycyB0aGF0IHVzZSBhcGVydHVyZSBoZWxwZXJzIHRvIHJlbW92ZSBvdGhl
ciwgaGFyZHdhcmUtYWdub3N0aWMNCj4+IGdyYXBoaWNzIGRyaXZlcnMuDQo+Pg0KPj4gVGhl
IHBhcmFtZXRlciBpcyBhIHNpbXBsZSB3YXkgb2YgdXNpbmcgdGhlIGZpcm13YXJlLXByb3Zp
ZGVkIHNjYW5vdXQNCj4+IGJ1ZmZlciBpZiB0aGUgaGFyZHdhcmUncyBuYXRpdmUgZHJpdmVy
IGlzIGJyb2tlbi4NCj4gDQo+IE5haC4uLiBpdCdzIHByb2JhYmx5IG5vdCBicm9rZW4sIGJ1
dCB5b3Ugd2FudCBpdCBkaXNhYmxlZCBpbiBvcmRlcg0KPiB0byB1c2UgdGhlIERSTSBkcml2
ZXIgaW5zdGVhZD8NCg0KTm8sIGl0J3MgcmVhbGx5IGZvciBicm9rZW4gbmF0aXZlIGRyaXZl
cnMgb3IgYW55IGtpbmQgb2YgcHJvYmxlbWF0aWMgDQptb2Rlc2V0dGluZy4gTW9zdCBEUk0g
ZHJpdmVycyBhbHJlYWR5IHJlc3BlY3QgdGhlIG5vbW9kZXNldCBvcHRpb24gYW5kIA0Kd29u
J3QgbG9hZCB3aGVuIGdpdmVuLiBBbGwgeW91J2QgZ2V0IGFyZSB0aGUgZ2VuZXJpYyBkcml2
ZXJzLCBzdWNoIGFzIA0Kc2ltcGxlZHJtLCBlZmlmYiBvciBzaW1wbGVmYi4NCg0KVGhlcmUg
YXJlIGJldHRlciBvcHRpb25zIG9mIGNvbmZpZ3VyaW5nIHZpZGVvIG91dHB1dCBvbiB0aGUg
a2VybmVsIA0KY29tbWFuZCBsaW5lLiAgQnV0IGFzIGdyYXBoaWNzIG91dHB1dCBpcyBzdWNo
IGEgZnVuZGFtZW50YWwgZmVhdHVyZSB0byANCnVzaW5nIGEgY29tcHV0ZXIsIHdlIGZvdW5k
IHRoYXQgYSBzaW1wbGUgYW5kIGVhc3kgb3B0aW9uIHRvIHdvcmthcm91bmQgDQplcnJvbmVv
dXMgc3lzdGVtcyB3b3VsZCBiZW5lZml0IERSTSB1c2VyczsgaGVuY2UgdGhlIG5vbW9kZXNl
dCBwYXJhbWV0ZXIuDQoNCkFzIGZiZGV2IGRyaXZlcnMgYWxzbyBkbyBtb2Rlc2V0dGluZywg
c3VwcG9ydGluZyB0aGUgcGFyYW1ldGVyIHNpbXBseSANCnVuaWZpZXMgdGhlIGJlaGF2aW9y
Lg0KDQo+IA0KPj4gVGhlIHNhbWUgZWZmZWN0DQo+PiBjb3VsZCBiZSBhY2hpZXZlZCB3aXRo
IHBlci1kcml2ZXIgb3B0aW9ucywgYnV0IHRoZSBpbXBvcnRhbmNlIG9mIHRoZQ0KPj4gZ3Jh
cGhpY3Mgb3V0cHV0IGZvciBtYW55IHVzZXJzIG1ha2VzIGEgc2luZ2xlLCB1bmlmaWVkIGFw
cHJvYWNoDQo+PiB3b3J0aHdoaWxlLg0KPj4NCj4+IFdpdGggbm9tb2Rlc2V0IHNwZWNpZmll
ZCwgdGhlIGZiZGV2IGRyaXZlciBtb2R1bGUgd2lsbCBub3QgbG9hZC4gVGhpcw0KPj4gdW5p
ZmllcyBiZWhhdmlvciB3aXRoIHNpbWlsYXIgRFJNIGRyaXZlcnMuIEluIERSTSBoZWxwZXJz
LCBtb2R1bGVzDQo+PiBmaXJzdCBjaGVjayB0aGUgbm9tb2Rlc2V0IHBhcmFtZXRlciBiZWZv
cmUgcmVnaXN0ZXJpbmcgdGhlIFBDSQ0KPj4gZHJpdmVyLiBBcyBmYmRldiBoYXMgbm8gc3Vj
aCBtb2R1bGUgaGVscGVycywgd2UgaGF2ZSB0byBtb2RpZnkgZWFjaA0KPj4gZHJpdmVyIGlu
ZGl2aWR1YWxseS4NCj4gDQo+IE9rLg0KPiANCj4+IFRoZSBuYW1lICdub21vZGVzZXQnIGlz
IHNsaWdodGx5IG1pc2xlYWRpbmcsIGJ1dCBoYXMgYmVlbiBjaG9zZW4gZm9yDQo+PiBoaXN0
b3JpY2FsIHJlYXNvbnMuIFNldmVyYWwgZHJpdmVycyBpbXBsZW1lbnRlZCBpdCBiZWZvcmUg
aXQgYmVjYW1lIGENCj4+IGdlbmVyYWwgb3B0aW9uIGZvciBEUk0uIFNvIGtlZXBpbmcgdGhl
IGV4aXN0aW5nIG5hbWUgd2FzIHByZWZlcnJlZCBvdmVyDQo+PiBpbnRyb2R1Y2luZyBhIG5l
dyBvbmUuDQo+IA0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L2F0
eTEyOGZiLmMgDQo+PiBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L2F0eTEyOGZiLmMNCj4+
IGluZGV4IDU3ZTM5OGZlN2E4MWMuLjFhMjZhYzI4NjVkNjUgMTAwNjQ0DQo+PiAtLS0gYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2F0eS9hdHkxMjhmYi5jDQo+PiArKysgYi9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2F0eS9hdHkxMjhmYi5jDQo+PiBAQCAtMjUwMyw3ICsyNTA0LDEyIEBAIHN0
YXRpYyBpbnQgYXR5MTI4ZmJfaW5pdCh2b2lkKQ0KPj4gwqAgew0KPj4gwqAgI2lmbmRlZiBN
T0RVTEUNCj4+IMKgwqDCoMKgwqAgY2hhciAqb3B0aW9uID0gTlVMTDsNCj4+ICsjZW5kaWYN
Cj4+ICsNCj4+ICvCoMKgwqAgaWYgKHZpZGVvX2Zpcm13YXJlX2RyaXZlcnNfb25seSgpKQ0K
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWOw0KPiANCj4gSSB0aGluayBpdCBt
YWtlcyBzZW5zZSB0byBnaXZlIGF0IGxlYXN0IHNvbWUgaW5mbywgd2h5IGEgc3BlY2lmaWMN
Cj4gZHJpdmVyIHdhc24ndCBsb2FkZWQsIGUuZy4gc29tZXRoaW5nIGxpa2UgdGhpcyBrZXJu
ZWwgbWVzc2FnZToNCj4gYXR5MTI4ZmI6IERyaXZlciBkaXNhYmxlZCBkdWUgdG8gIm5vbW9k
ZXNldCIga2VybmVsIHBhcmFtZXRlci4NCj4gDQo+IElmIHlvdSBlLmcuIGNoYW5nZSB0aGUg
ZnVuY3Rpb24gdmlkZW9fZmlybXdhcmVfZHJpdmVyc19vbmx5KCkNCj4gdG8gYmVjb21lIHZp
ZGVvX2Zpcm13YXJlX2RyaXZlcnNfb25seShjb25zdCBjaGFyICpkcml2ZXJuYW1lKQ0KPiB0
aGVuIHlvdSBjb3VsZCBwcmludCBzdWNoIGEgbWVzc2FnZSBpbiB2aWRlb19maXJtd2FyZV9k
cml2ZXJzX29ubHkoKQ0KDQpXZWxsLCB3ZSBkbyBoYXZlIHN1Y2ggYSBtZXNzYWdlIGluIGRp
c2FibGVfbW9kZXNldCgpIGFscmVhZHkuIFsxXQ0KDQpbMV0gDQpodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9kcm1fbm9t
b2Rlc2V0LmMjTDE4DQoNCj4gDQo+IEFuZCBJIGRvbid0IGxpa2UgdmVyeSBtdWNoIHRoZSBu
YW1lIG9mIGZ1bmN0aW9uIA0KPiB2aWRlb19maXJtd2FyZV9kcml2ZXJzX29ubHkoKSwNCj4g
YnV0IGRvbid0IGhhdmUgYW55IG90aGVyIGJldHRlciBpZGVhIHJpZ2h0IG5vdyBlaXRoZXIu
Li4NCg0KSXQncyBwYXJ0IG9mIHRoZSAndmlkZW8nIG1vZHVsZSwgaGVuY2UgdGhlIHByZWZp
eC4gVGhlICdub21vZGVzZXQnIA0Kb3B0aW9uIHVzZWQgdG8gYmUgaW1wbGVtZW50ZWQgaW4g
c2V2ZXJhbCBEUk0gZHJpdmVycy4gSXQncyBhbiBhd2Z1bCANCm5hbWUsIGJ1dCB3ZSBkaWRu
J3Qgd2FudCB0byByZW1vdmUgaXQgb3IgaW50cm9kdWNlIGEgbmV3IG9uZSBmb3IgdGhlIA0K
c2FtZSBmZWF0dXJlLiBTbyB3ZSBrZXB0IG5vbW9kZXNldCBmb3IgYWxsIG9mIERSTS4gIFRo
ZW4gd2Ugc3RhcnRlZCANCmJpa2VzaGVkZGluZyB0aGUgZnVuY3Rpb24gbmFtZSB0aGF0IHJl
dHVybnMgdGhlIHNldHRpbmcuIEFuZCANCmZpcm13YXJlLWRyaXZlcnMtb25seSBpcyB0aGUg
YmVzdCBkZXNjcmlwdGlvbiBvZiB3aGF0IGlzIGhhcHBlbmluZyBoZXJlLiANClNvIHRoYXQn
cyBob3cgdGhlIG5hbWUgaGFwcGVuZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAN
Cj4gSGVsZ2UNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------JLBeDWzj1CbxAZo0J0OLGQ6Y--

--------------uFHY0RRLZAxEbawAVao3bITA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNpJKYFAwAAAAAACgkQlh/E3EQov+AV
lBAAiwXeeMTrh9fUzhtu6IqMjF/nEItFNQJJwM99X5TfbxcUIVIOAi6ubLdn8gmGRwOZ/q2plD9L
DmdblyWP+cdcOBin3rSBxU7dh7PGOUgDwArc+k7rresfCzV2LnqmpBuFU+ujq7HYOqVzIQTY1Nie
U02/qbEM4UPZJHFxCVyhwCGgElIBed6TLctyQmC2A6yg6U3LQ2Pjv+oG25/CJpsRxqUsZeLoGgb/
tycN1NO95k1wc0IVx7cpA8s1Eaxo+3oFf7wL/PHYzNiSpR7bySD00kZo4QlugtjmObMqQ0K7HbKf
e3sMEfSNOncq9kjFk7/IilJdHAU6i+BiSvmbhmEMvWCCRAj8pwoYH9Y9u+pbG5lUCQuwC1ruFkY5
qiXlt02+RTCvvBpS2NRjro60bXUSVNZvB9ACrCARbWBsKVranFGENZ+QCxSVu9Ir6BF47GSDn3+8
Fk864nJqwLgPktk34X3C086tVVNU2YvppGaL0CyBnTDwo9nJ7xfh5rhg6JUg6dFybrjZm0ZF0pIk
rrLK4xTrPoQM/vHRYW33LCF+EypFTKXqVJBFURehp5MMyHrdfGYbxXTff0O8kXW3wlSg+WcYx/+Y
+oElrq8j8hqNjiI2usLanGlWv9XD/qR3QalATRh4/wCDjX6gDnWxhlZm0ERv9B/vh86OMIgy545m
xmE=
=hlXf
-----END PGP SIGNATURE-----

--------------uFHY0RRLZAxEbawAVao3bITA--
