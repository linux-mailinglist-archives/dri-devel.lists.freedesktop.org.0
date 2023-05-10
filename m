Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7066FDB64
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 12:13:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CA610E056;
	Wed, 10 May 2023 10:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B58A710E056
 for <dri-devel@lists.freedesktop.org>; Wed, 10 May 2023 10:13:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EED071F6E6;
 Wed, 10 May 2023 10:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683713581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZpKpPTxGWhpNWUipS5I4KWHTteY3WYgSioT33b1BBRY=;
 b=wSXsP5DH6qJYcXs5MAygGaXFj8yo7bCQsUjkX2yif1buXukvZKPSCkowqNIWHFNz3LX459
 c421m5dWZi+bAVLvLiGvLNmhizclbW60+YwnzN2El5A4HB51jf4aBdIKfz7gxC+rkbQFzb
 06RD7frVUWVfN5Vjslk8zDPq+w0foPk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683713581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZpKpPTxGWhpNWUipS5I4KWHTteY3WYgSioT33b1BBRY=;
 b=UguLa2Wml88KIr2TBZthi/EitbxcEtozS6lRBzu8AmSdaJQcduItuenu5WR66laBChCzkR
 v33d0KetCShzO6DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C64F3138E5;
 Wed, 10 May 2023 10:13:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4dFXLy1uW2RWKAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 10 May 2023 10:13:01 +0000
Message-ID: <b6503a5d-1983-527a-eef2-160c3c788a27@suse.de>
Date: Wed, 10 May 2023 12:13:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] drm/mgag200: Fix gamma lut not initialized.
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
References: <20230510085451.226546-1-jfalempe@redhat.com>
 <3efea3e4-09e2-a9f6-a4a2-365b48b1e63b@suse.de>
 <b719c37e-a0ff-b337-1d9f-51e3964dbe81@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b719c37e-a0ff-b337-1d9f-51e3964dbe81@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------R9utLLQHrLNTCi0br9q2mLpE"
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
Cc: Phil Oester <kernel@linuxace.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------R9utLLQHrLNTCi0br9q2mLpE
Content-Type: multipart/mixed; boundary="------------9lKLaO0D33nZ9KkwlDWe2Dq1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, javierm@redhat.com, lyude@redhat.com
Cc: Phil Oester <kernel@linuxace.com>, stable@vger.kernel.org
Message-ID: <b6503a5d-1983-527a-eef2-160c3c788a27@suse.de>
Subject: Re: [PATCH] drm/mgag200: Fix gamma lut not initialized.
References: <20230510085451.226546-1-jfalempe@redhat.com>
 <3efea3e4-09e2-a9f6-a4a2-365b48b1e63b@suse.de>
 <b719c37e-a0ff-b337-1d9f-51e3964dbe81@redhat.com>
In-Reply-To: <b719c37e-a0ff-b337-1d9f-51e3964dbe81@redhat.com>

--------------9lKLaO0D33nZ9KkwlDWe2Dq1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDUuMjMgdW0gMTE6Mjkgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDEwLzA1LzIwMjMgMTE6MTUsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGks
DQo+Pg0KPj4gb2ggZ3JlYXQhIFRoYW5rIHlvdSBmb3IgZml4aW5nIHRoaXMgYnVnLiBBbmQg
c29ycnkgdGhhdCBJIGJyb2tlIGl0Lg0KPj4NCj4+IEFtIDEwLjA1LjIzIHVtIDEwOjU0IHNj
aHJpZWIgSm9jZWx5biBGYWxlbXBlOg0KPj4+IFdoZW4gbWdhZzIwMCBzd2l0Y2hlZCBmcm9t
IHNpbXBsZSBLTVMgdG8gcmVndWxhciBhdG9taWMgaGVscGVycywNCj4+PiB0aGUgaW5pdGlh
bGl6YXRpb24gb2YgdGhlIGdhbW1hIHNldHRpbmdzIHdhcyBsb3N0Lg0KPj4+IFRoaXMgbGVh
ZHMgdG8gYSBibGFjayBzY3JlZW4sIGlmIHRoZSBiaW9zL3VlZmkgZG9lc24ndCB1c2UgdGhl
IHNhbWUNCj4+PiBwaXhlbCBjb2xvciBkZXB0aC4NCj4+Pg0KPj4+IExpbms6IGh0dHBzOi8v
YnVnemlsbGEucmVkaGF0LmNvbS9zaG93X2J1Zy5jZ2k/aWQ9MjE3MTE1NQ0KPj4+IEZpeGVz
OiAxYmFmOTEyN2M0ODIgKCJkcm0vbWdhZzIwMDogUmVwbGFjZSBzaW1wbGUtS01TIHdpdGgg
cmVndWxhciANCj4+PiBhdG9taWMgaGVscGVycyIpDQo+Pj4gVGVzdGVkLWJ5OiBQaGlsIE9l
c3RlciA8a2VybmVsQGxpbnV4YWNlLmNvbT4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBKb2NlbHlu
IEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhhdC5jb20+DQo+Pg0KPj4gQWxzbyBuZWVkczoNCj4+
DQo+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjYuMSsNCj4gDQo+IFNob3Vs
ZCBJIHNlbmQgYSB2MiB3aXRoIHRoaXMgYWRkZWQgPw0KDQpZZXMsIHBsZWFzZS4NCg0KPj4N
Cj4+IEluIHRlcm1zIG9mIHdoYXQgaXQgZG9lczoNCj4+DQo+PiBSZXZpZXdlZC1ieTogVGhv
bWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+Pg0KPj4gYnV0IHRoZSBw
YXRjaCBpcyBhcHBhcmVudGx5IGZvciBhZ2FpbnN0IGFuIG9sZCB2ZXJzaW9uLiAodjYuMT8p
IFRoZSANCj4+IGNvZGUgaW4gbWdhZzIwMF9jcnRjX2hlbHBlcl9hdG9taWNfZW5hYmxlIGhh
cyBjaGFuZ2VkIHF1aXRlIGEgYml0Lg0KPiANCj4gWWVzLCBJIGJhc2VkIGl0IG9uIHRoZSBj
dWxwcml0IGNvbW1pdCAxYmFmOTEyN2M0ODIsIGJ1dCBpdCBhcHBsaWVzIA0KPiBjbGVhbmx5
IHdpdGggZ2l0IGFtIC0zIG9uIHRvcCBvZiB2Ni4zDQoNClJhdGhlciBzZW5kIGEgcGF0Y2gg
YWdhaW5zdCBkcm0tbWlzYy1maXhlcyBhbmQgbGV0IGJhY2twb3J0ZXJzIHNvcnQgaXQgDQpv
dXQuIFRoYXQncyBjdXJyZW50IHByYWN0aWNlIEFGQUlLLiBZb3UgY291bGQgYWxzbyByZXBs
eSB0byB5b3VyIHYyIA0KcGF0Y2ggbWFpbCB3aXRoIGEgbGluayB0byB0aGUgdjEgcGF0Y2gu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+
PiBUaG9tYXMNCj4+DQo+Pj4gLS0tDQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL21nYWcyMDAv
bWdhZzIwMF9tb2RlLmMgfCA1ICsrKysrDQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2Fn
MjAwL21nYWcyMDBfbW9kZS5jIA0KPj4+IGIvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdh
ZzIwMF9tb2RlLmMNCj4+PiBpbmRleCA0NjFkYTE0MDlmZGYuLjkxMWQ0Njc0MWU0MCAxMDA2
NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYw0K
Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jDQo+Pj4g
QEAgLTgxOSw2ICs4MTksMTEgQEAgc3RhdGljIHZvaWQgDQo+Pj4gbWdhZzIwMF9jcnRjX2hl
bHBlcl9hdG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4+PiDCoMKgwqDC
oMKgIGVsc2UgaWYgKG1kZXYtPnR5cGUgPT0gRzIwMF9FVikNCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgbWdhZzIwMF9nMjAwZXZfc2V0X2hpcHJpbHZsKG1kZXYpOw0KPj4+ICvCoMKgwqAg
aWYgKGNydGNfc3RhdGUtPmdhbW1hX2x1dCkNCj4+PiArwqDCoMKgwqDCoMKgwqAgbWdhZzIw
MF9jcnRjX3NldF9nYW1tYShtZGV2LCBmb3JtYXQsIA0KPj4+IGNydGNfc3RhdGUtPmdhbW1h
X2x1dC0+ZGF0YSk7DQo+Pj4gK8KgwqDCoCBlbHNlDQo+Pj4gK8KgwqDCoMKgwqDCoMKgIG1n
YWcyMDBfY3J0Y19zZXRfZ2FtbWFfbGluZWFyKG1kZXYsIGZvcm1hdCk7DQo+Pj4gKw0KPj4+
IMKgwqDCoMKgwqAgbWdhZzIwMF9lbmFibGVfZGlzcGxheShtZGV2KTsNCj4+PiDCoMKgwqDC
oMKgIGlmIChtZGV2LT50eXBlID09IEcyMDBfV0IgfHwgbWRldi0+dHlwZSA9PSBHMjAwX0VX
MykNCj4+Pg0KPj4+IGJhc2UtY29tbWl0OiAxYmFmOTEyN2M0ODJhM2E1OGFlZjgxZDkyYWU3
NTE3OThlMmRiMjAyDQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6
IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9l
cm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------9lKLaO0D33nZ9KkwlDWe2Dq1--

--------------R9utLLQHrLNTCi0br9q2mLpE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRbbi0FAwAAAAAACgkQlh/E3EQov+Ba
PBAAlBvUCFOSRs8H3M2EjHEbwdeDmVQDSTyL2HifnLwjPmXRWZf5BsOgvI42utHMrUMcqEB+9XHx
a3xfrhYFsJVb574Qg+jDZ4BL/DNf9+99ozbP5vXl1O5nNfqsX3qmIUd9Hs1ANqYPv/3lYRA04h4P
oG7c/cj2akt1z/euuHf1gNKHDNW/Xf3rNh4tAG0caMX1EBgfWTorTCEWXTrnfxqA/CZaurog+NxN
rfwLR8F+N45BBn8g/4NhT5nvluy8RHL4cAYpXk+i7dNH14vbWhPAbi2et2oK7d/fTqH9xAB7SQiz
+kJcIOHf5Bdpmgxpv7V9CFSGPxt39feqz/Ldou311kTS7x6W2/8keKn1hn6HwYY4AsAlxLM2ndts
DeaKA9QjrwDJwefGbnJYfkuYOkotX+083vZfBr9TmOlZLt5z8oRjd1o/6z7+mBlN+/eJbngmvA+R
pEX4uEmUsmV1tEw9xJyG9Z7PTZUVfK83eb+UaCFyiOldCficayAPEMEqiMBl/CkDYTcXyRiQ0i24
RtZ96UNOHYl3S1t9+MyEdFxyFjC1nxW7sjcFU56pVmYg3V8BhDXZvwwJ7vbu1Io42W5TIgYrLfUX
CQB89OEMHk+WLptxHDq8w6bLmt5RLZHwgc85hqaYD7vcUs0siTKKVEupV9hxaJl2wZB2MeAbiDoh
Mh0=
=C7ik
-----END PGP SIGNATURE-----

--------------R9utLLQHrLNTCi0br9q2mLpE--
