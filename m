Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F064DA306
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 20:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070A410E31D;
	Tue, 15 Mar 2022 19:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D10F10E25D
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Mar 2022 19:11:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BC3821F38C;
 Tue, 15 Mar 2022 19:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647371488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+wuXADdZPHxyGByvjYaQrasduwIkd3zx/8ELCxw9I4=;
 b=P9ZQvoaUKV2+6Nr6USxAYLZFgdM0cTg5yV1g3jgxefRWBjJEl57PTkj+k05Cah1EELDx8u
 NG6LLzf2M4SlMd/vb5Z9iQ1IoTfhkpw481mXWBVEUSC9QgdCbNzlWDO117/gpNDEvMkVju
 lZX8fX6KSvRulQ4CzlZwvjHw/Hya7Bg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647371488;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U+wuXADdZPHxyGByvjYaQrasduwIkd3zx/8ELCxw9I4=;
 b=rGb67r7A7o4BFIDUZMTv35wGFZucePLrrtEonEu2cKqWACojyHEgrwxzosgjX8RNuEM1bz
 fEFTk8TiDtVsKwCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8883813B66;
 Tue, 15 Mar 2022 19:11:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KXeQH+DkMGLaewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Mar 2022 19:11:28 +0000
Message-ID: <3e4584c5-2abb-e4ac-e914-aae6a0fcf83a@suse.de>
Date: Tue, 15 Mar 2022 20:11:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 6/9] drm/fb-helper: Provide callback to create fbdev dumb
 buffers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-7-tzimmermann@suse.de>
 <4d489fba-917f-4212-0528-0295e86c4c4a@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <4d489fba-917f-4212-0528-0295e86c4c4a@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QZaMYUB3obhuYdlzkD8v3DEs"
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
--------------QZaMYUB3obhuYdlzkD8v3DEs
Content-Type: multipart/mixed; boundary="------------LsgRS9vlipehI6sr7fBgp0vx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <3e4584c5-2abb-e4ac-e914-aae6a0fcf83a@suse.de>
Subject: Re: [PATCH 6/9] drm/fb-helper: Provide callback to create fbdev dumb
 buffers
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-7-tzimmermann@suse.de>
 <4d489fba-917f-4212-0528-0295e86c4c4a@redhat.com>
In-Reply-To: <4d489fba-917f-4212-0528-0295e86c4c4a@redhat.com>

--------------LsgRS9vlipehI6sr7fBgp0vx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA4LjAzLjIyIHVtIDE4OjUxIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KWy4uLl0NCj4+ICAgDQo+PiAgIHN0YXRpYyBzdHJ1Y3QgZHJtX2Ns
aWVudF9idWZmZXIgKg0KPj4gLWRybV9jbGllbnRfYnVmZmVyX2NyZWF0ZShzdHJ1Y3QgZHJt
X2NsaWVudF9kZXYgKmNsaWVudCwgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0LCB1MzIgZm9ybWF0
KQ0KPj4gK2RybV9jbGllbnRfYnVmZmVyX2NyZWF0ZShzdHJ1Y3QgZHJtX2NsaWVudF9kZXYg
KmNsaWVudCwgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0LCB1MzIgZm9ybWF0LA0KPj4gKwkJCSBi
b29sIGZiZGV2KQ0KPj4gICB7DQo+PiAgIAljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZv
ICppbmZvID0gZHJtX2Zvcm1hdF9pbmZvKGZvcm1hdCk7DQo+PiAgIAlzdHJ1Y3QgZHJtX21v
ZGVfY3JlYXRlX2R1bWIgZHVtYl9hcmdzID0geyB9Ow0KPj4gQEAgLTI2NSw3ICsyNjYsMTAg
QEAgZHJtX2NsaWVudF9idWZmZXJfY3JlYXRlKHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xp
ZW50LCB1MzIgd2lkdGgsIHUzMiBoZWlnaHQsIHUNCj4+ICAgCWR1bWJfYXJncy53aWR0aCA9
IHdpZHRoOw0KPj4gICAJZHVtYl9hcmdzLmhlaWdodCA9IGhlaWdodDsNCj4+ICAgCWR1bWJf
YXJncy5icHAgPSBpbmZvLT5jcHBbMF0gKiA4Ow0KPj4gLQlyZXQgPSBkcm1fbW9kZV9jcmVh
dGVfZHVtYihkZXYsICZkdW1iX2FyZ3MsIGNsaWVudC0+ZmlsZSk7DQo+PiArCWlmIChmYmRl
dikNCj4gDQo+IE1heWJlIGlmIChkZWZpbmVkKENPTkZJR19EUk1fRkJERVZfRU1VTEFUSU9O
KSAmJiBmYmRldikgPw0KPiANCj4+ICsJCXJldCA9IGRybV9tb2RlX2NyZWF0ZV9kdW1iX2Zi
ZGV2KGRldiwgJmR1bWJfYXJncywgY2xpZW50LT5maWxlKTsNCj4gDQo+IEFuZCBkcm1fbW9k
ZV9jcmVhdGVfZHVtYl9mYmRldigpIGNvdWxkIGp1c3QgYmUgbWFkZSBhIHN0dWIgaWYNCj4g
Q09ORklHX0RSTV9GQkRFVl9FTVVMQVRJT04gaXNuJ3QgZW5hYmxlZC4NCg0KV2hpbGUgZ29p
bmcgdGhyb3VnaCB0aGVzZSBjb21taXRzIGFnYWluLCBJIGRlY2lkZWQgdG8gY2hhbmdlIHRo
ZSBsb2dpYyANCnRvIHVzZSBhIGZ1bmN0aW9uIHBvaW50ZXIgZm9yIHRoZSBhbGxvY2F0aW9u
LiBUaGUgZmJkZXYgZW11bGF0aW9uIHdpbGwgDQpwcm92aWRlIGFuIGltcGxlbWVudGF0aW9u
IHRoYXQgYWxsb2NhdGVzIHRoZSBidWZmZXIgb2JqZWN0LiBUaGUgbG9naWMgDQpmb3IgcGlj
a2luZyB0aGUgY29ycmVjdCBjcmVhdGUtZHVtYiBmdW5jdGlvbiB3aWxsIGJlIHBsYWNlZCB0
aGVyZS4NCg0KQWx0aG91Z2ggaXQgcHJvYmFibHkgd29uJ3QgZXZlciBiZSBuZWVkZWQsIG90
aGVyIGNsaWVudHMgY291bGQgYWxsb2NhdGUgDQpidWZmZXJzIHdpdGggb3RoZXIgY29uc3Ry
YWludHMsIG9yIGV2ZW4gc3VwcG9ydCBhY2NlbGVyYXRpb24gaW5zdGVhZCBvZiANCmR1bWIg
YnVmZmVycy4NCg0KWW91IG1heSB3YW50IHRvIHRha2UgYW5vdGhlciBsb29rIGF0IHRoaXMg
cGF0Y2ggaW4gdGhlIHBhdGNoc2V0J3MgbmV4dCANCml0ZXJhdGlvbi4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiANCj4gSSBiZWxpZXZlIHRoZSBvbmx5IHVzYWdlIG9mIHRoZSBE
Uk0gY2xpZW50IEFQSSBjdXJyZW50bHkgaXMgdGhlIGZiZGV2DQo+IGVtdWxhdGlvbiBsYXll
ciBhbnl3YXlzPyBCdXQgc3RpbGwgbWFrZXMgc2Vuc2UgSSB0aGluayB0byBjb25kdGlvbmFs
bHkNCj4gY29tcGlsZSB0aGF0IHNpbmNlIGRybV9jbGllbnQubyBpcyBidWlsdCBpbiB0aGUg
ZHJtLmtvIG1vZHVsZSBhbmQgdGhlDQo+IGRybV9mYl9oZWxwZXIubyBvbmx5IGluY2x1ZGVk
IGlmIGZiZGV2IGVtdWxhdGlvbiBoYXMgYmVlbiBlbmFibGVkLg0KPiANCj4+ICsJZWxzZQ0K
Pj4gKwkJcmV0ID0gZHJtX21vZGVfY3JlYXRlX2R1bWIoZGV2LCAmZHVtYl9hcmdzLCBjbGll
bnQtPmZpbGUpOw0KPj4gICAJaWYgKHJldCkNCj4+ICAgCQlnb3RvIGVycl9kZWxldGU7DQo+
PiAgIA0KPj4gQEAgLTQwMiw2ICs0MDYsNyBAQCBzdGF0aWMgaW50IGRybV9jbGllbnRfYnVm
ZmVyX2FkZGZiKHN0cnVjdCBkcm1fY2xpZW50X2J1ZmZlciAqYnVmZmVyLA0KPj4gICAgKiBA
d2lkdGg6IEZyYW1lYnVmZmVyIHdpZHRoDQo+PiAgICAqIEBoZWlnaHQ6IEZyYW1lYnVmZmVy
IGhlaWdodA0KPj4gICAgKiBAZm9ybWF0OiBCdWZmZXIgZm9ybWF0DQo+PiArICogQGZiZGV2
OiBUcnVlIGlmIHRoZSBjbGllbnQgcHJvdmlkZXMgYW4gZmJkZXYgZGV2aWNlLCBvciBmYWxz
ZSBvdGhlcndpc2UNCj4+ICAgICoNCj4gDQo+IEFuIGVtdWxhdGVkIGZiZGV2IGRldmljZSA/
DQo+IA0KPiBPdGhlciB0aGFuIHRob3NlIHNtYWxsIG5pdCwNCj4gDQo+IFJldmlld2VkLWJ5
OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCj4gDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------LsgRS9vlipehI6sr7fBgp0vx--

--------------QZaMYUB3obhuYdlzkD8v3DEs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIw5N8FAwAAAAAACgkQlh/E3EQov+AE
nw/+PdDJp0Sdsqij72OEFR6H//7ZbwRKDA1jrQJIZgRw0JALH1jJ2vO+jcXJUMcZbKgGkeuDhAwi
YT2S7lPBmpJo0UOwDQF32f5azA6Uj7n5oo4IZeuFQQmtR4WpGaohJqJKh8xiI0aFFSxND/RFLmPN
edDp9Xii4rLxnF2ybW/025rLWYJEHjeKNNZmOnfr2CU6ZIkVcJYUdtUx1pYtBstkXvbTHgq64QeP
1aD0ubQiNO9SsdnQ5EIGOuuQ6MWJ6a0Ww+1QwShxzVXBqQeWnG0FTGR192QrOQwr4uDqoMV9cdXE
j7XMaM2w5USnyGu0CCrUS9VuspJkgQCP0KLJ8KhvQio+GSZgBm736MP6OHuCcoKmZlVGlxL4ToTu
Z9irhataGSR6BY+MgWHll2VjqDXbF9/rtG4vfWg9JmWPBSH9Sno2LBY96nUSruOHAiPpDFwChgFE
iLTIFvBU5bZ4jmXeAXVoM/NZasueUYyJpvMvCGF/I5qjQxIug1X0wlHeZ5IrXc8I8bqWbtsvaq8Q
J2ZZbrBkMpUCzRzKLNsNHvLx+CkLECzNPIs7L8BCTzC45EuFGTxktfYxE84kLPaKA2ophpkQ8d2R
A0B1tcFJL1KptTtSXLJCK8tIWwBMQyqamDSfGPqQCteKolyb5FAcqy41lHuxeQIBytw6edce78Zq
Cv0=
=Z0KX
-----END PGP SIGNATURE-----

--------------QZaMYUB3obhuYdlzkD8v3DEs--
