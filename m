Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFB74F77EC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 09:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B513410E563;
	Thu,  7 Apr 2022 07:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D9B110E53F
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 07:44:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0C1471F85A;
 Thu,  7 Apr 2022 07:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649317447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wred8aoTSOmrISc8KzAfVf9Vur7d6ppyG0wxTstHmGc=;
 b=Hf9Bo4KeYBl8cT9bs2CNE4cX9cEcVhgBlb1kdtpSSkvYRSkH9HZA9tQ5vvVOmSurpfr45S
 LzasvM4eohSVFIkCHblOpCeQzMHSkktZyVpAGtLwfJt63MHNifl975dPNcJUuRmjFydBM0
 SCuE7LXqLWuT50fvtCyLDaRkYRPXkc8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649317447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wred8aoTSOmrISc8KzAfVf9Vur7d6ppyG0wxTstHmGc=;
 b=W3Qu4u6RyfyAiU2LELH8relqPLFyGTQoEI0dxPVSEzV1s+KSJtSAisrguXyFg4SyyKrQZ4
 EI/IIxDh50VWghBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CFD0D13485;
 Thu,  7 Apr 2022 07:44:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UCxnMUaWTmLIeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Apr 2022 07:44:06 +0000
Message-ID: <ecb21200-6f28-8068-5172-08db470969f0@suse.de>
Date: Thu, 7 Apr 2022 09:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 7/8] drm/display: Move HDMI helpers into display-helper
 module
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-8-tzimmermann@suse.de> <87wngbbue8.fsf@intel.com>
 <3be7b84e-b28e-e8d0-f6ec-90142b9ecb21@suse.de> <871qy973i6.fsf@intel.com>
 <87wng15otr.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87wng15otr.fsf@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IKT0Q20g4w0BSwolvuYGjLhX"
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
--------------IKT0Q20g4w0BSwolvuYGjLhX
Content-Type: multipart/mixed; boundary="------------mCegGPrr0LHdPFJqojBDeBgo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <ecb21200-6f28-8068-5172-08db470969f0@suse.de>
Subject: Re: [PATCH 7/8] drm/display: Move HDMI helpers into display-helper
 module
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-8-tzimmermann@suse.de> <87wngbbue8.fsf@intel.com>
 <3be7b84e-b28e-e8d0-f6ec-90142b9ecb21@suse.de> <871qy973i6.fsf@intel.com>
 <87wng15otr.fsf@intel.com>
In-Reply-To: <87wng15otr.fsf@intel.com>

--------------mCegGPrr0LHdPFJqojBDeBgo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMDQuMjIgdW0gMDk6MzQgc2NocmllYiBKYW5pIE5pa3VsYToNCj4gT24g
VGh1LCAwNyBBcHIgMjAyMiwgSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGxpbnV4LmludGVs
LmNvbT4gd3JvdGU6DQo+PiBPbiBXZWQsIDA2IEFwciAyMDIyLCBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pj4gSGkNCj4+Pg0KPj4+IEFtIDMw
LjAzLjIyIHVtIDEyOjM1IHNjaHJpZWIgSmFuaSBOaWt1bGE6DQo+Pj4+IE9uIFR1ZSwgMjIg
TWFyIDIwMjIsIFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cm90
ZToNCj4+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZWRpZC5oIGIvaW5jbHVk
ZS9kcm0vZHJtX2VkaWQuaA0KPj4+Pj4gaW5kZXggMTQ0YzQ5NWI5OWM0Li5lNmU5ZTQ1NTcw
NjcgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZWRpZC5oDQo+Pj4+PiAr
KysgYi9pbmNsdWRlL2RybS9kcm1fZWRpZC5oDQo+Pj4+PiBAQCAtMzkxLDMzICszOTEsNiBA
QCBkcm1fbG9hZF9lZGlkX2Zpcm13YXJlKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0
b3IpDQo+Pj4+PiAgICANCj4+Pj4+ICAgIGJvb2wgZHJtX2VkaWRfYXJlX2VxdWFsKGNvbnN0
IHN0cnVjdCBlZGlkICplZGlkMSwgY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQyKTsNCj4+Pj4+
ICAgIA0KPj4+Pj4gLWludA0KPj4+Pj4gLWRybV9oZG1pX2F2aV9pbmZvZnJhbWVfZnJvbV9k
aXNwbGF5X21vZGUoc3RydWN0IGhkbWlfYXZpX2luZm9mcmFtZSAqZnJhbWUsDQo+Pj4+PiAt
CQkJCQkgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4+Pj4+IC0J
CQkJCSBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSk7DQo+Pj4+PiAtaW50
DQo+Pj4+PiAtZHJtX2hkbWlfdmVuZG9yX2luZm9mcmFtZV9mcm9tX2Rpc3BsYXlfbW9kZShz
dHJ1Y3QgaGRtaV92ZW5kb3JfaW5mb2ZyYW1lICpmcmFtZSwNCj4+Pj4+IC0JCQkJCSAgICBj
b25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLA0KPj4+Pj4gLQkJCQkJICAg
IGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICptb2RlKTsNCj4+Pj4+IC0NCj4+Pj4+
IC12b2lkDQo+Pj4+PiAtZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9jb2xvcmltZXRyeShzdHJ1
Y3QgaGRtaV9hdmlfaW5mb2ZyYW1lICpmcmFtZSwNCj4+Pj4+IC0JCQkJICAgY29uc3Qgc3Ry
dWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpOw0KPj4+Pj4gLQ0KPj4+Pj4g
LXZvaWQNCj4+Pj4+IC1kcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2JhcnMoc3RydWN0IGhkbWlf
YXZpX2luZm9mcmFtZSAqZnJhbWUsDQo+Pj4+PiAtCQkJICAgIGNvbnN0IHN0cnVjdCBkcm1f
Y29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlKTsNCj4+Pj4+IC0NCj4+Pj4+IC12b2lkDQo+
Pj4+PiAtZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9xdWFudF9yYW5nZShzdHJ1Y3QgaGRtaV9h
dmlfaW5mb2ZyYW1lICpmcmFtZSwNCj4+Pj4+IC0JCQkJICAgY29uc3Qgc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvciwNCj4+Pj4+IC0JCQkJICAgY29uc3Qgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGUsDQo+Pj4+PiAtCQkJCSAgIGVudW0gaGRtaV9xdWFudGl6YXRp
b25fcmFuZ2UgcmdiX3F1YW50X3JhbmdlKTsNCj4+Pj4+IC0NCj4+Pj4+IC1pbnQNCj4+Pj4+
IC1kcm1faGRtaV9pbmZvZnJhbWVfc2V0X2hkcl9tZXRhZGF0YShzdHJ1Y3QgaGRtaV9kcm1f
aW5mb2ZyYW1lICpmcmFtZSwNCj4+Pj4+IC0JCQkJICAgIGNvbnN0IHN0cnVjdCBkcm1fY29u
bmVjdG9yX3N0YXRlICpjb25uX3N0YXRlKTsNCj4+Pj4+IC0NCj4+Pj4+ICAgIC8qKg0KPj4+
Pj4gICAgICogZHJtX2VsZF9tbmwgLSBHZXQgRUxEIG1vbml0b3IgbmFtZSBsZW5ndGggaW4g
Ynl0ZXMuDQo+Pj4+PiAgICAgKiBAZWxkOiBwb2ludGVyIHRvIGFuIGVsZCBtZW1vcnkgc3Ry
dWN0dXJlIHdpdGggbW5sIHNldA0KPj4+Pj4gQEAgLTU4Nyw2ICs1NjAsMTAgQEAgdm9pZCBk
cm1fZWRpZF9nZXRfbW9uaXRvcl9uYW1lKHN0cnVjdCBlZGlkICplZGlkLCBjaGFyICpuYW1l
LA0KPj4+Pj4gICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmRybV9tb2RlX2ZpbmRfZG10
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+Pj4+PiAgICAJCQkJCSAgIGludCBoc2l6ZSwg
aW50IHZzaXplLCBpbnQgZnJlc2gsDQo+Pj4+PiAgICAJCQkJCSAgIGJvb2wgcmIpOw0KPj4+
Pj4gKw0KPj4+Pj4gK3U4IGRybV9tYXRjaF9oZG1pX21vZGUoY29uc3Qgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKnRvX21hdGNoKTsNCj4+Pj4+ICtlbnVtIGhkbWlfcGljdHVyZV9hc3Bl
Y3QgZHJtX2dldF9jZWFfYXNwZWN0X3JhdGlvKGNvbnN0IHU4IHZpZGVvX2NvZGUpOw0KPj4+
Pj4gK2VudW0gaGRtaV9waWN0dXJlX2FzcGVjdCBkcm1fZ2V0X2hkbWlfYXNwZWN0X3JhdGlv
KGNvbnN0IHU4IHZpZGVvX2NvZGUpOw0KPj4+Pg0KPj4+PiBJIHRoaW5rIHRoZXNlIHdlcmUg
ZmluZSBhcyBzdGF0aWMsIGJ1dCBub3QgcmVhbGx5IGdyZWF0IGludGVyZmFjZXMgdG8NCj4+
Pj4gZXhwb3J0LiBUaGVyZSdzIHplcm8gaW5wdXQgY2hlY2tpbmcgb24gdGhlIHZpYyBpbiB0
aGUgbGF0dGVyLCBiZWNhdXNlDQo+Pj4+IGludGVybmFsbHkgd2UgY291bGQgYmUgc3VyZSB0
aGV5IHdlcmUgZmluZS4NCj4+Pg0KPj4+IEkgc2VlLiBJZiBub3RoaW5nIGVsc2UsIEhETUkg
Y291bGQgYmUgcmVtb3ZlZCBmcm9tIHRoZSBwYXRjaHNldC4gT1RPSA0KPj4+IGhhdmluZyB0
aGVzZSBIRE1JIGZ1bmN0aW9ucyBhcyBwYXJ0IG9mIHRoZSBlZGlkIGNvZGUgZG9lc24ndCBz
ZWVtIHJpZ2h0DQo+Pj4gZWl0aGVyLg0KPiANCj4gVG8gY2xhcmlmeSwgSSB0aGluayB0aGUg
SERNSSBmdW5jdGlvbmFsaXR5IHNob3VsZCBwcm9iYWJseSBiZQ0KPiBtb3ZlZC4gSXQncyBq
dXN0IHRoZSBuZXcgaW50ZXJmYWNlcyBJJ20gd29ycmllZCBhYm91dC4NCj4gDQo+IEJSLA0K
PiBKYW5pLg0KPiANCj4gDQo+Pj4NCj4+Pj4NCj4+Pj4gSSBhbHNvIHdpc2ggd2UgY291bGQg
bGltaXQgdGhlIHVzYWdlIHRvIHRoZSBtb2R1bGUgeW91J3JlIGFkZGluZzsgdGhpcw0KPj4+
PiBpcyBub3cgYXZhaWxhYmxlIHRvIGFsbCBkcml2ZXJzIHdoaWNoIHNob3VsZCBiZSBkaXNj
b3VyYWdlZC4NCj4+Pg0KPj4+IFdoeSBpcyB0aGF0IGRpc2NvdXJhZ2VkPyBRdWl0ZSBhIGZl
dyBkcml2ZXJzIHVzZSB0aGVzZSBpbnRlcmZhY2VzLg0KPj4NCj4+IE5vIGRyaXZlciBuZWVk
ZWQgdG8gZGlyZWN0bHkgdXNlIHRoZSBmdW5jdGlvbnMgeW91J3JlIG5vdyBhZGRpdGlvbmFs
bHkNCj4+IGV4cG9ydGluZyBmcm9tIGRybV9lZGlkLmMuIEknZCBob3BlIG5vIGRyaXZlciBz
dGFydHMgdG8gdXNlIHRoZW0gZWl0aGVyLg0KDQpJIHNlZS4gSSdsbCByZWR1Y2UgdGhlIGNv
ZGUgaW4gdGhlIGRpc3BsYXkgbGlicmFyeSwgZXZlbiBpZiB0aGF0IG1lYW5zIA0KdGhhdCBz
b21lIHBvdGVudGlhbCBoZWxwZXIgcmVtYWlucyBpbiBkcm1fZWRpZC5jIGZvciBub3cuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4+DQo+PiBCUiwNCj4+IEphbmkuDQo+Pg0KPj4N
Cj4+DQo+Pj4NCj4+PiBCZXN0IHJlZ2FyZHMNCj4+PiBUaG9tYXMNCj4+Pj4NCj4+Pj4NCj4+
Pj4gQlIsDQo+Pj4+IEphbmkuDQo+Pj4+DQo+Pj4+DQo+IA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2
byBUb3Rldg0K

--------------mCegGPrr0LHdPFJqojBDeBgo--

--------------IKT0Q20g4w0BSwolvuYGjLhX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJOlkYFAwAAAAAACgkQlh/E3EQov+AX
Nw//bJrlvrRgbWnNvuaIBuvM3T1ZGpfIKgGetKp4fqHyOjOPRXQ1JGKSvJANGiV+ksx/JEPjqmun
+fXIbykVNr+mRPMw5VVBjpCvboEKt62wAIziQuHYu0pBDoQVRvvYVw8YMTfuvsahQ+yyl9l0pSzh
rkPi2SvTGUxZb8wuHpNKYSndcU66ntKXuNx17XFpq4WuOKtjjmJiYj7/qPxxPLunoBHMj8y+Z/D2
iuu2oWjVHAgZdtAmDafpsYHWthcWxWSKmuNRJKWFK2QZPu9U19cKxTf+LGGcyFiaG5bEaty7Sjrk
LxU7GfFNx4+dbg3AevupqJ31jfYIKKhyW7VVu9aAaUayk/d+XXLGsNDIOfR3+iMlYM2n2ApmmZxz
AMhTmOTlTa3aAsxwyencNFlaMYLmIJoL7iPBOZUd04P0UGZNppbFJao9viIL8sFlNlnXAvdGzuSP
ARAsuGph7r4hY7UFRbhubR1WfPFwTlTIJhXyft7MfRMNams5Y5Xv7tYizyZjBPcB+6bUE2xAvVgw
uWxTm1zOFZPCwWSajmMn1cIfdhjIadQ8SlWY9iJhOCwiuNai2suertBisosQ4Js24tI62crni1ox
Raoy7IkFpOD7dHgMOnJaevCB2imS0IyqpcKUhl8lYQ/tZnLwb7HDxmieM0cuOx0fDNmkXzAjv5Qe
b88=
=qJco
-----END PGP SIGNATURE-----

--------------IKT0Q20g4w0BSwolvuYGjLhX--
