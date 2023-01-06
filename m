Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6112665FBB9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 08:10:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21CC510E2CA;
	Fri,  6 Jan 2023 07:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1147510E2CA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 07:10:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3DF2C4025C;
 Fri,  6 Jan 2023 07:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672989030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c1ExoFiCkHdHKchvmCEFwhFEVNDo9IP9OOA/tRws40U=;
 b=RENNM8NVmRXV3/fuUqzFlIbNJl5x/wseig/ajUEG3POjaXnLu5pwULRbIbEnz0uAhjUvkz
 jT2dSMNCEUhKP7v6tHIJ6KMi+WOL52b95PGLfszFdbrnnmH5cupVvtZNJTAJwzArUFiMSS
 ZX2LlkqUuJy7yOSbYTR/zMOWJmVnWco=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672989030;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c1ExoFiCkHdHKchvmCEFwhFEVNDo9IP9OOA/tRws40U=;
 b=hGcEsFwkFLFOgiEe565Rv+b+13znG0ilenuJcxk62DnnedxNuunzY1gicMpfL8Pd8fJJYB
 gqVESyiWA0KNqZAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E79013596;
 Fri,  6 Jan 2023 07:10:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ucN2BmbJt2O/LAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 06 Jan 2023 07:10:30 +0000
Message-ID: <a7159d76-1432-5a29-f011-b5b786fb516b@suse.de>
Date: Fri, 6 Jan 2023 08:10:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/gem: Check for valid formats
To: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mcanal@igalia.com>
References: <20230103125322.855089-1-mcanal@igalia.com>
 <Y7bsKFCIOgauVbII@phenom.ffwll.local>
 <7104fc80-f996-8fce-eb72-b29ba4ff438e@igalia.com>
 <CAKMK7uHZcLc1UYD44Zpi2wkrkuKAWXpQZKtdy4wwMW9wqJJ_og@mail.gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAKMK7uHZcLc1UYD44Zpi2wkrkuKAWXpQZKtdy4wwMW9wqJJ_og@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ilofli0cezIyMSW4EZOFvalY"
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ilofli0cezIyMSW4EZOFvalY
Content-Type: multipart/mixed; boundary="------------96NfkkOW9in5CW1kBpz3PgOM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Ma=c3=adra_Canal?=
 <mcanal@igalia.com>
Cc: =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org
Message-ID: <a7159d76-1432-5a29-f011-b5b786fb516b@suse.de>
Subject: Re: [PATCH] drm/gem: Check for valid formats
References: <20230103125322.855089-1-mcanal@igalia.com>
 <Y7bsKFCIOgauVbII@phenom.ffwll.local>
 <7104fc80-f996-8fce-eb72-b29ba4ff438e@igalia.com>
 <CAKMK7uHZcLc1UYD44Zpi2wkrkuKAWXpQZKtdy4wwMW9wqJJ_og@mail.gmail.com>
In-Reply-To: <CAKMK7uHZcLc1UYD44Zpi2wkrkuKAWXpQZKtdy4wwMW9wqJJ_og@mail.gmail.com>

--------------96NfkkOW9in5CW1kBpz3PgOM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDEuMjMgdW0gMTk6MjIgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBUaHUsIDUgSmFuIDIwMjMgYXQgMTg6NDgsIE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxp
YS5jb20+IHdyb3RlOg0KPj4NCj4+IE9uIDEvNS8yMyAxMjoyNiwgRGFuaWVsIFZldHRlciB3
cm90ZToNCj4+PiBPbiBUdWUsIEphbiAwMywgMjAyMyBhdCAwOTo1MzoyM0FNIC0wMzAwLCBN
YcOtcmEgQ2FuYWwgd3JvdGU6DQo+Pj4+IEN1cnJlbnRseSwgZHJtX2dlbV9mYl9jcmVhdGUo
KSBkb2Vzbid0IGNoZWNrIGlmIHRoZSBwaXhlbCBmb3JtYXQgaXMNCj4+Pj4gc3VwcG9ydGVk
LCB3aGljaCBjYW4gbGVhZCB0byB0aGUgYWNjZXB0YW5jZSBvZiBpbnZhbGlkIHBpeGVsIGZv
cm1hdHMNCj4+Pj4gZS5nLiB0aGUgYWNjZXB0YW5jZSBvZiBpbnZhbGlkIG1vZGlmaWVycy4g
VGhlcmVmb3JlLCBhZGQgYSBjaGVjayBmb3INCj4+Pj4gdmFsaWQgZm9ybWF0cyBvbiBkcm1f
Z2VtX2ZiX2NyZWF0ZSgpLg0KPj4+Pg0KPj4+PiBNb3Jlb3Zlciwgbm90ZSB0aGF0IHRoaXMg
Y2hlY2sgaXMgb25seSB2YWxpZCBmb3IgYXRvbWljIGRyaXZlcnMsDQo+Pj4+IGJlY2F1c2Us
IGZvciBub24tYXRvbWljIGRyaXZlcnMsIGNoZWNraW5nIGRybV9hbnlfcGxhbmVfaGFzX2Zv
cm1hdCgpIGlzDQo+Pj4+IG5vdCBwb3NzaWJsZSBzaW5jZSB0aGUgZm9ybWF0IGxpc3QgZm9y
IHRoZSBwcmltYXJ5IHBsYW5lIGlzIGZha2UsIGFuZA0KPj4+PiB3ZSdkIHRoZXJlZm9yIHJl
amVjdCB2YWxpZCBmb3JtYXRzLg0KPj4+Pg0KPj4+PiBTdWdnZXN0ZWQtYnk6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBN
YcOtcmEgQ2FuYWwgPG1jYW5hbEBpZ2FsaWEuY29tPg0KPj4+DQo+Pj4gQWNrZWQtYnk6IERh
bmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+DQo+Pj4NCj4+PiBJIHRoaW5r
IHRvIHJlYWxseSBtYWtlIHN1cmUgd2UgaGF2ZSBjb25zZW5zdXMgaXQnZCBiZSBnb29kIHRv
IGV4dGVuZCB0aGlzDQo+Pj4gdG8gYSBzZXJpZXMgd2hpY2ggcmVtb3ZlcyBhbGwgdGhlIGNh
bGxlcnMgdG8gZHJtX2FueV9wbGFuZV9oYXNfZm9ybWF0KCkNCj4+PiBmcm9tIHRoZSB2YXJp
b3VzIGRyaXZlcnMsIGFuZCB0aGVuIHVuZXhwb3J0cyB0aGF0IGhlbHBlci4gVGhhdCB3YXkg
eW91cg0KPj4+IHNlcmllcyBoZXJlIHdpbGwgaGF2ZSBtb3JlIGV5ZXMgb24gaXQgOi0pDQo+
Pg0KPj4gSSB0b29rIGEgbG9vayBhdCB0aGUgY2FsbGVycyB0byBkcm1fYW55X3BsYW5lX2hh
c19mb3JtYXQoKSBhbmQgdGhlcmUgYXJlIG9ubHkNCj4+IDMgY2FsbGVycyAoYW1kZ3B1LCBp
OTE1IGFuZCB2bXdnZngpLiBUaGV5IGFsbCB1c2UgZHJtX2FueV9wbGFuZV9oYXNfZm9ybWF0
KCkNCj4+IGJlZm9yZSBjYWxsaW5nIGRybV9mcmFtZWJ1ZmZlcl9pbml0KCkuIFNvLCBJJ20g
bm90IHN1cmUgSSBjb3VsZCByZW1vdmUNCj4+IGRybV9hbnlfcGxhbmVfaGFzX2Zvcm1hdCgp
IGZyb20gdGhvc2UgZHJpdmVycy4gTWF5YmUgYWRkaW5nIHRoaXMgc2FtZSBjaGVjaw0KPj4g
dG8gZHJtX2dlbV9mYl9pbml0KCkgYW5kIHJlZmFjdG9yIHRoZSBkcml2ZXJzIHRvIG1ha2Ug
dGhlbSB1c2UgZHJtX2dlbV9mYl9pbml0KCksDQo+PiBidXQgSSBndWVzcyB0aGlzIHdvdWxk
IGJlIHBhcnQgb2YgYSBkaWZmZXJlbnQgc2VyaWVzLg0KPiANCj4gV2VsbCB2bXdnZnggc3Rp
bGwgbm90IHlldCB1c2luZyBnZW0gYWZhaWssIHNvIHRoYXQgZG9lc24ndCB3b3JrLg0KDQpU
aGVyZSB3YXMgYSBwYXRjaHNldCB0aGF0IGNvbnZlcnRlZCB2bXdnZnggdG8gR0VNIElJUkMu
IEl0IGV2ZW4gdXNlcyANCmdlbmVyaWMgZmJkZXYgZW11bGF0aW9uIG5vdywgZm9yIHdoaWNo
IEdFTSBpcyBhIGhhcmQgcmVxdWlyZW1lbnQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gDQo+IEJ1dCB3aHkgY2FuJ3Qgd2UgbW92ZSB0aGUgbW9kaWZpZXIgY2hlY2sgaW50IGRy
bV9mcmFtZWJ1ZmZlcl9pbml0KCk/DQo+IFRoYXQncyBraW5kYSB3aGVyZSBpdCBwcm9iYWJs
eSBzaG91bGQgYmUgYW55d2F5LCB0aGVyZSdzIG5vdGhpbmcgZ2VtDQo+IGJvIHNwZWNpZmlj
IGluIHRoZSBjb2RlIHlvdSdyZSBhZGRpbmcuDQo+IC1EYW5pZWwNCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------96NfkkOW9in5CW1kBpz3PgOM--

--------------Ilofli0cezIyMSW4EZOFvalY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO3yWQFAwAAAAAACgkQlh/E3EQov+AK
gg//XBaSTc+ESrbJrgeZK0J7tVpAb0ZVlZcgBMNa0M/3Ar+xnIi5cx0bVV+E7O68Oz7RWdLOQ6c5
s6pElfdEd5LwRDG+Q5UArYQh2x6BWmzFF5e4seJamgD9rfUDPko55r7kfKaKF9yDzqPl8X8V5QcK
q8r+pwVZg587DJIQf5Wqhf+JvDgXnR8UyyMa1urpUU0E5vtrRDMj6bB1KiUEhhOUWDnD78fwNWHy
nPRlAgA1wr6pmidCF4W4xvIXuSzsc5zQG7+00KkDUpWT3TpWRqDO4rPB6jjctqPsZJDfIA4Oavhk
7m2ZyMq3kMDDlLbwSuZ7U9rJNEuxdapopa3U0JhsurSJz/fpuN1Z4Ra08vVVFvS45wQMkvDG9uCI
tChdZ6ct9p0MN+BVcSFUDD7k9KmnNBsWof8pN0OmAttoJrsYFwv3p+TinFt1qvzjwVCa/YJnJDDT
Cns8Z7UCMvpNYfoLqZhZ1jqJDalbxPiDgf6iJaHHwVlVm3VlSiG7MFaxVciHvq4/i4yHOAzeXujF
QG77d0bqg5GZmWSLTiA9EtzTIBkN3MuLzLwbVI7gZW53wjqq0BRHWp8DXLbQ0sr6wRzeTNioXcRX
i6HWM8kzl+D6m0ROphLHxWBjab7B/UOX4IqLJSy7DlUKapEuFI8iZh8200arvQzT8LfUiZC8ppxG
ITg=
=HX98
-----END PGP SIGNATURE-----

--------------Ilofli0cezIyMSW4EZOFvalY--
