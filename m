Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C26FED61
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 10:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 205E710E5B2;
	Thu, 11 May 2023 08:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0C410E1E2;
 Thu, 11 May 2023 08:01:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3BB3B21846;
 Thu, 11 May 2023 08:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683792090; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kxh9oTkBZubaGvNOl09GCmcWeGnLPsAnseWjmb776+Q=;
 b=uZCKZcYymkXSCuk35mKVxOBiPb3PUmSoblhBIFq0ptwfyuJ+AwtLDTlWrgcIQUfnZLc7io
 vekbOu2+g7F3lM+Rg3GKsbj+S77qYYjtlIaz9Y6yCGhJLuQzTfod1GWwTgfSsybdXAsM+1
 GXcMAaxIA6Hso1xt7oz3Ek4PtZiO3oU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683792090;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Kxh9oTkBZubaGvNOl09GCmcWeGnLPsAnseWjmb776+Q=;
 b=YH14vHdKVOsc0bX3rSb92JdQXTtJZk7zBu2bHahU6GwDx/kKxa2ufJ1cbOwZYQ+POCQccq
 CxzwvOV8NBVBiICg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0FBB5134B2;
 Thu, 11 May 2023 08:01:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 69brAtqgXGQZawAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 11 May 2023 08:01:30 +0000
Message-ID: <e1d716ad-569f-c26a-82cd-bf747a352360@suse.de>
Date: Thu, 11 May 2023 10:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PULL] drm-misc-fixes
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <a91d6e42-3c29-d8f8-cb09-68177cecbc74@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <a91d6e42-3c29-d8f8-cb09-68177cecbc74@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xEfRq1O0wkqaYgCoF8TXgf0X"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dim-tools@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xEfRq1O0wkqaYgCoF8TXgf0X
Content-Type: multipart/mixed; boundary="------------Y2nNNB7ZdBtccR2BnA0tQvw8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <e1d716ad-569f-c26a-82cd-bf747a352360@suse.de>
Subject: Re: [PULL] drm-misc-fixes
References: <a91d6e42-3c29-d8f8-cb09-68177cecbc74@linux.intel.com>
In-Reply-To: <a91d6e42-3c29-d8f8-cb09-68177cecbc74@linux.intel.com>

--------------Y2nNNB7ZdBtccR2BnA0tQvw8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QSBmcmllbmRseSBwaW5nIHRvIG1lcmdlIHRoaXMgUFIuIFRoZSBwYXRjaGVzIGFwcGVhciB0
byBiZSBtaXNzaW5nIGZyb20gDQpkcm0tZml4ZXMuDQoNCkFtIDI2LjA0LjIzIHVtIDA3OjU5
IHNjaHJpZWIgTWFhcnRlbiBMYW5raG9yc3Q6DQo+IEhpIERhdmUsIERhbmllbCwNCj4gDQo+
IGRybS1taXNjLWZpeGVzIHB1bGwgcmVxdWVzdCBmb3IgcmMxLiBkcm0tbWlzYy1uZXh0LWZp
eGVzIGNvbWluZyB1cC4uIG5leHQNCj4gDQo+IH5NYWFydGVuDQo+IA0KPiBkcm0tbWlzYy1m
aXhlcy0yMDIzLTA0LTI2Og0KPiBkcm0tbWlzYy1maXhlcyBmb3IgdjYuNC1yYzE6DQo+IC0g
Rml4IERTQyBtYWNyb3MuDQo+IC0gRml4IFZFU0EgZm9ybWF0IGZvciBzaW1wbGVmYi4NCj4g
LSBQcm9oaWJpdCBwb3RlbnRpYWwgb3V0LW9mLWJvdW5kcyBhY2Nlc3MgaW4gZ2VuZXJpYyBm
YmRldiBlbXVsYXRpb24uDQo+IC0gSW1wcm92ZSBBU1QyNTAwKyBjb21wYXQgb24gQVJNLg0K
PiBUaGUgZm9sbG93aW5nIGNoYW5nZXMgc2luY2UgY29tbWl0IA0KPiBiNjNhNTUzZThmNWFh
NjU3NGVlYjUzNWE1NTE4MTdhOTNjNDI2ZDhjOg0KPiANCj4gIMKgZHJtL3JvY2tjaGlwOiB2
b3AyOiBVc2UgcmVnY2FjaGVfc3luYygpIHRvIGZpeCBzdXNwZW5kL3Jlc3VtZSANCj4gKDIw
MjMtMDQtMTcgMjM6NDA6NDAgKzAyMDApDQo+IA0KPiBhcmUgYXZhaWxhYmxlIGluIHRoZSBH
aXQgcmVwb3NpdG9yeSBhdDoNCj4gDQo+ICDCoGdpdDovL2Fub25naXQuZnJlZWRlc2t0b3Au
b3JnL2RybS9kcm0tbWlzYyB0YWdzL2RybS1taXNjLWZpeGVzLTIwMjMtMDQtMjYNCj4gDQo+
IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byAwZDY4NjgzODM4ZjI4NTBkZDhmZjMx
ZjExMjFlMDViZmI3YTJkZWYwOg0KPiANCj4gIMKgZHJtL2RzYzogZml4IERQX0RTQ19NQVhf
QlBQX0RFTFRBXyogbWFjcm8gdmFsdWVzICgyMDIzLTA0LTI0IDIyOjQwOjU3IA0KPiArMDMw
MCkNCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gZHJtLW1pc2MtZml4ZXMgZm9yIHY2LjQtcmMxOg0K
PiAtIEZpeCBEU0MgbWFjcm9zLg0KPiAtIEZpeCBWRVNBIGZvcm1hdCBmb3Igc2ltcGxlZmIu
DQo+IC0gUHJvaGliaXQgcG90ZW50aWFsIG91dC1vZi1ib3VuZHMgYWNjZXNzIGluIGdlbmVy
aWMgZmJkZXYgZW11bGF0aW9uLg0KPiAtIEltcHJvdmUgQVNUMjUwMCsgY29tcGF0IG9uIEFS
TS4NCj4gDQo+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gSmFtbXkgSHVhbmcgKDEpOg0KPiAgwqDCoMKgwqDC
oGRybS9hc3Q6IEZpeCBBUk0gY29tcGF0aWJpbGl0eQ0KPiANCj4gSmFuaSBOaWt1bGEgKDIp
Og0KPiAgwqDCoMKgwqDCoGRybS9kc2M6IGZpeCBkcm1fZWRwX2RzY19zaW5rX291dHB1dF9i
cHAoKSBEUENEIGhpZ2ggYnl0ZSB1c2FnZQ0KPiAgwqDCoMKgwqDCoGRybS9kc2M6IGZpeCBE
UF9EU0NfTUFYX0JQUF9ERUxUQV8qIG1hY3JvIHZhbHVlcw0KPiANCj4gUGllcnJlIEFzc2Vs
aW4gKDEpOg0KPiAgwqDCoMKgwqDCoGZpcm13YXJlL3N5c2ZiOiBGaXggVkVTQSBmb3JtYXQg
c2VsZWN0aW9uDQo+IA0KPiBTdWkgSmluZ2ZlbmcgKDEpOg0KPiAgwqDCoMKgwqDCoGRybS9m
YmRldi1nZW5lcmljOiBwcm9oaWJpdCBwb3RlbnRpYWwgb3V0LW9mLWJvdW5kcyBhY2Nlc3MN
Cj4gDQo+IGRyaXZlcnMvZmlybXdhcmUvc3lzZmJfc2ltcGxlZmIuYyDCoMKgfCDCoDQgKysr
LQ0KPiBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgwqDCoMKgwqDCoHwgwqA5ICsr
KysrLS0tLQ0KPiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIMKgwqDCoMKgfCAx
NiArKysrKysrKysrKystLS0tDQo+IGluY2x1ZGUvZHJtL2Rpc3BsYXkvZHJtX2RwLmggwqDC
oMKgwqDCoMKgwqB8IMKgNSArKy0tLQ0KPiBpbmNsdWRlL2RybS9kaXNwbGF5L2RybV9kcF9o
ZWxwZXIuaCB8IMKgNSArKy0tLQ0KPiA1IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMo
KyksIDE1IGRlbGV0aW9ucygtKQ0KPiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1h
bnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3Vk
aWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------Y2nNNB7ZdBtccR2BnA0tQvw8--

--------------xEfRq1O0wkqaYgCoF8TXgf0X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRcoNkFAwAAAAAACgkQlh/E3EQov+Dc
SQ//daMWgXvviDwiVTyAFggiezVu4tcdTSHGzcA4aR58L2l5r1OBGcURuM9jkprGl5JtX2dECP/O
BqavRmd+P1tYg5MG52qhKMgMZvW5w+lQN20hcfvQA6viiNCPDjvRfq+kKUehGMaS7IlC2icexysy
mzL60CQ7RYhY9bRk/bsoxW2dUgh8Bc1xIu6aK90l0+OTPwf/DRsNYXswXSWzuQSEIMneRiFFi0ia
KD3M7sOQto1Qi/KUi3kQv/dyy0Kbz7eQtl/qy78NiA28U87o0eZIbAAU++srqDkQQZGyGYpVG63b
WnIrxAcZDnT60pYl+Sl9E+egebFy9+vskI2xGsGKvcoHqmT3UnIQR4MB8VdkkD4mFRvKaUaoqW5O
INa3Mgp5MFdqPEg8/aPce0JMMTa4R3yjujwjZfq8aVsBNu/C+A9Ces0PZUmLv/Cs6fOYReZBO0Jn
tyJtgmY+H5Ju7A2CBks7WMVZQ9X7WQh9zw2teCeAOgkRzxvGAhYALJwuq2b0KySlKenlhD8bqO9L
xypUJ+xe1ob7vTksijfyV9V+3LqfbPXzQw3UkzqKY6dqgJc6Sqq9wlmmXJgFtMntFCj0NHfA92im
M5ILx4fxuwkQd890a/7Fqc01qZLhNISjMomyiGsk92/74+BJhCZ2gWkGS/7pqPcg4jiypkYimf7p
3cc=
=iM4t
-----END PGP SIGNATURE-----

--------------xEfRq1O0wkqaYgCoF8TXgf0X--
