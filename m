Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3329C7984BD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 11:22:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C1C10E0A1;
	Fri,  8 Sep 2023 09:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3287310E060
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 09:21:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB93C1F461;
 Fri,  8 Sep 2023 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694164912; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qjDJIP3D0JGnuzG3HciXLNxtVC33FbgjNsuybRrLz2w=;
 b=Jyauc4EJsRm/ztNyT+XVvnibR2DnK9xlW4O1t6S/IPZ25WDai7FEOjkxUQjIgj2ABWCFCs
 i2VbsxAr5B7gIyc26cwC5eh9NsggQpFvsMkV57/6R9916SXujkrcuFudcuY2XAO2vO2hRx
 A60YpN32AMoRG1f9s5ARRaApSqXpQr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694164912;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qjDJIP3D0JGnuzG3HciXLNxtVC33FbgjNsuybRrLz2w=;
 b=cm/QIoO3UQ1nV21FmuuMzVsaj7073LYIMgLQvOhtuxlnLjdVdrFTZ8IzPVQG2q/7cl6J2e
 IQDSQliH6nLeNWBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9FF22132F2;
 Fri,  8 Sep 2023 09:21:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id H70IJrDn+mT4UAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 08 Sep 2023 09:21:52 +0000
Message-ID: <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
Date: Fri, 8 Sep 2023 11:21:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 ppaalanen@gmail.com, javierm@redhat.com, contact@emersion.fr
References: <20230825140434.182664-1-jfalempe@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230825140434.182664-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MuGjNHnH4L8XePL6Pib2mn8T"
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
--------------MuGjNHnH4L8XePL6Pib2mn8T
Content-Type: multipart/mixed; boundary="------------0NHenKVUSzy6VwBd0QtGJhJR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, daniel@ffwll.ch,
 ppaalanen@gmail.com, javierm@redhat.com, contact@emersion.fr
Cc: dri-devel@lists.freedesktop.org
Message-ID: <3f1bd1ad-cd1f-515d-38bd-63e412dec286@suse.de>
Subject: Re: [PATCH v3] drm/plane: Add documentation about software color
 conversion.
References: <20230825140434.182664-1-jfalempe@redhat.com>
In-Reply-To: <20230825140434.182664-1-jfalempe@redhat.com>

--------------0NHenKVUSzy6VwBd0QtGJhJR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDguMjMgdW0gMTY6MDQgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQpb
Li4uXQ0KPiArICoNCj4gKyAqICAgICBCdXQgdGhlcmUgYXJlIHR3byBleGNlcHRpb25zIG9u
bHkgZm9yIGR1bWIgYnVmZmVyczoNCj4gKyAqICAgICAqIFRvIHN1cHBvcnQgWFJHQjg4ODgg
aWYgaXQncyBub3Qgc3VwcG9ydGVkIGJ5IHRoZSBoYXJkd2FyZS4NCg0KDQo+ICsgKiAgICAg
KiBBbnkgZHJpdmVyIGlzIGZyZWUgdG8gbW9kaWZ5IGl0cyBpbnRlcm5hbCByZXByZXNlbnRh
dGlvbiBvZiB0aGUgZm9ybWF0LA0KPiArICogICAgICAgYXMgbG9uZyBhcyBpdCBkb2Vzbid0
IGFsdGVyIHRoZSB2aXNpYmxlIGNvbnRlbnQgaW4gYW55IHdheSwgYW5kIGRvZXNuJ3QNCj4g
KyAqICAgICAgIG1vZGlmeSB0aGUgdXNlci1wcm92aWRlZCBidWZmZXIuIEFuIGV4YW1wbGUg
d291bGQgYmUgdG8gZHJvcCB0aGUNCj4gKyAqICAgICAgIHBhZGRpbmcgY29tcG9uZW50IGZy
b20gYSBmb3JtYXQgdG8gc2F2ZSBzb21lIG1lbW9yeSBiYW5kd2lkdGguDQoNCkkgaGF2ZSBz
dHJvbmcgb2JqZWN0aW9ucyB0byB0aGlzIHBvaW50LCBfZXNwZWNpYWxseV8gYXMgeW91J3Jl
IA0KYXBwYXJlbnRseSB0cnlpbmcgdG8gc25lYWsgdGhpcyBpbiBhZnRlciBvdXIgZGlzY3Vz
c2lvbi4gTkFLIG9uIHRoaXMgDQpwYXJ0IGZyb20gbXkgc2lkZS4NCg0KSWYgeW91IHdhbnQg
dXNlcnNwYWNlIHRvIGJlIGFibGUgdG8gdXNlIGEgY2VydGFpbiBmb3JtYXQsIHRoZW4gZXhw
b3J0IA0KdGhlIGNvcnJlc3BvbmRpbmcgNGNjIGNvZGUuIFRoZW4gbGV0IHVzZXJzcGFjZSBk
ZWNpZGUgd2hhdCB0byBkbyBhYm91dCANCml0LiBJZiB1c2Vyc3BhY2UgcGljayBhIGNlcnRh
aW4gZm9ybWF0LCBnbyB3aXRoIGl0Lg0KDQpIZW5jZSwgbm8gaW1wbGljaXQgY29udmVyc2lv
biBmcm9tIFhSR0I4ODggdG8gUkdCODg4LCBqdXN0IGJlY2F1c2UgaXQncyANCnBvc3NpYmxl
Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNCj4gKyAqICAgICBPbiBtb3N0IGhhcmR3
YXJlLCBWUkFNIHJlYWQgYWNjZXNzIGFyZSBzbG93LCBzbyB3aGVuIGRvaW5nIHRoZSBzb2Z0
d2FyZQ0KPiArICogICAgIGNvbnZlcnNpb24sIHRoZSBkdW1iIGJ1ZmZlciBzaG91bGQgYmUg
YWxsb2NhdGVkIGluIHN5c3RlbSBSQU0gaW4gb3JkZXIgdG8NCj4gKyAqICAgICBoYXZlIGRl
Y2VudCBwZXJmb3JtYW5jZS4NCj4gKyAqICAgICBFeHRyYSBjYXJlIHNob3VsZCBiZSB0YWtl
biB3aGVuIGRvaW5nIHNvZnR3YXJlIGNvbnZlcnNpb24gd2l0aA0KPiArICogICAgIERSTV9D
QVBfRFVNQl9QUkVGRVJfU0hBRE9XLCB0aGVyZSBhcmUgbW9yZSBkZXRhaWxlZCBleHBsYW5h
dGlvbnMgaGVyZToNCj4gKyAqICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2
ZWwvMjAyMzA4MTgxNjI0MTUuMjE4NWY4ZTNAZWxkZmVsbC8NCj4gICAgKi8NCj4gICANCj4g
ICBzdGF0aWMgdW5zaWduZWQgaW50IGRybV9udW1fcGxhbmVzKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYpDQo+IA0KPiBiYXNlLWNvbW1pdDogODJkNzUwZTlkMmY1ZDA1OTRjOGY3MDU3Y2U1
OTEyN2U3MDFhZjc4MQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZy
YW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRv
dGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpI
UkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------0NHenKVUSzy6VwBd0QtGJhJR--

--------------MuGjNHnH4L8XePL6Pib2mn8T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT6568FAwAAAAAACgkQlh/E3EQov+Bf
1w/8D8kZQVihbtVdsa1sAGxshNZC4vd55YxUn89z66dww+zcaXAm1CLBr0xNBWnxawpSy5o08qFr
7i2lZbZK4Bc4qFpI8stIRp3BAHWzF175wDFQhFVJ3RxQ2M4J9tnQktfbcJOQLKbpOJi9l2BivNcQ
85CHIW4xflrsQaFmJ+8rg0xTMuUsSFQ6fEXTAebIp8eu8zYWo06GvoxZ23S7W4GOXl4TyFr2wK2s
o02dZ5ZOaKcBDaCgZ3u9T9BH8fqfCzyuZ1G7+UZ5NeJiTvIINPVzvv3pLaY8qWTluHtmox2RKWyi
FdflJLqmJ2+mReHtA8X1bnD696kzVP6Ze9XSU2Gt1HjdPrymna317nNSznQtuMrWi2Z9aXEQL6ou
/nsziiz6FeUXEg3wY9Z+/rILDa8+6HpYOkhRUEEqSwTjsgNxlOoyfDtmycIIjyGjKNIzfYJANqok
v0Kk0yXnVRxv+ePp+KIk0oLC6NR+U5/BsOp07I6UbSRiBK3hpYsrhvMnMN7oXNpyFCg6dGadSHdL
vDYvcpqNRaiX0AS1zOQQQTu4Q7v0CXBrwobolOL3lg8HSG6HUxPYKNHHnUtUDjqocp4U3wCvBywH
W1i7v5C8qsLg2m5yTnlvTYt3nZRglAK0co5CAlqGKQO06Rp2zeGqDOufhlc45HVKySxgmTuZjESs
inU=
=HRET
-----END PGP SIGNATURE-----

--------------MuGjNHnH4L8XePL6Pib2mn8T--
