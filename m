Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C9B447FD2
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:50:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 699E96E04E;
	Mon,  8 Nov 2021 12:50:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C53F6E21A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 12:50:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E42491FD73;
 Mon,  8 Nov 2021 12:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636375809; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g6rVr/QvfLi2ByKCf/dK31QvV23CubX1fJTrk3VGj3Y=;
 b=lsugz92BCahl5SWggrE2E1hVBIyYYINlgEidyVkprIH7HcVTz0mNalg2xwq17sehig2/Ws
 W+h6/pUIduuxOMRmHedZ0dyNNtl/xU0p0V5hsS51ac+fBfUWSXfgpFSupBO7YdR1y+t21T
 q0NtU3UEcvwQZQaY6cHl0USHhgCgCUI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636375809;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g6rVr/QvfLi2ByKCf/dK31QvV23CubX1fJTrk3VGj3Y=;
 b=htpIPi+IHFUkxv6Lajf8CoY3tby+YtD9YMfUpHk3NNxBCwqiCr8TRuJBCLohjgoYGUFm6X
 h91pTRHUwev41jBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BA04213BA0;
 Mon,  8 Nov 2021 12:50:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vKhoLAEdiWETbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Nov 2021 12:50:09 +0000
Message-ID: <07d75447-eaa2-ec12-a1b2-d1ca2d7013ad@suse.de>
Date: Mon, 8 Nov 2021 13:50:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 6/6] drm: Make the nomodeset message less sensational
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20211108121544.776590-1-javierm@redhat.com>
 <20211108121544.776590-7-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211108121544.776590-7-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6LNxu293iACcwzO0SPj3WqX9"
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6LNxu293iACcwzO0SPj3WqX9
Content-Type: multipart/mixed; boundary="------------lCF3aKpvJG1bTf6AzBHi5nJB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, Peter Robinson <pbrobinson@gmail.com>
Message-ID: <07d75447-eaa2-ec12-a1b2-d1ca2d7013ad@suse.de>
Subject: Re: [PATCH v3 6/6] drm: Make the nomodeset message less sensational
References: <20211108121544.776590-1-javierm@redhat.com>
 <20211108121544.776590-7-javierm@redhat.com>
In-Reply-To: <20211108121544.776590-7-javierm@redhat.com>

--------------lCF3aKpvJG1bTf6AzBHi5nJB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMTEuMjEgdW0gMTM6MTUgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZSBtZXNzYWdlIHByaW50ZWQgd2hlbiBub21vZGVzZXQgaXMgcHJlc2Vu
dCBpbiB0aGUga2VybmVsIGNvbW1hbmQgbGluZQ0KPiBtYWtlcyBpdCBsb29rIGFzIGlmIHRo
ZSBwYXJhbWV0ZXIgbXVzdCBuZXZlciBiZSB1c2VkIGFuZCBpdCdzIGEgYmFkIGlkZWEuDQo+
IA0KPiBCdXQgdGhlcmUgYXJlIHZhbGlkIHJlYXNvbnMgdG8gdXNlIHRoaXMgcGFyYW1ldGVy
IGFuZCB0aGUgbWVzc2FnZSBzaG91bGQNCj4gbm90IGltcGx5IG90aGVyd2lzZS4gQ2hhbmdl
IHRoZSB0ZXh0IHRvIGJlIG1vcmUgYWNjdXJhdGUgYW5kIHJlc3RyYWluZWQuDQo+IA0KPiBT
dWdnZXN0ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
PiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVk
aGF0LmNvbT4NCj4gLS0tDQo+IA0KPiAobm8gY2hhbmdlcyBzaW5jZSB2MSkNCj4gDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2RybV9ub21vZGVzZXQuYyB8IDQgKy0tLQ0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgZHJpdmVycy9ncHUvZHJtL2RybV9ub21vZGVzZXQuYyBkcml2ZXJzL2dwdS9kcm0vZHJt
X25vbW9kZXNldC5jDQo+IGluZGV4IGZjM2FjZjNhYjJlMi4uNDVlNTBiMzQ5N2I4IDEwMDY0
NA0KPiAtLS0gZHJpdmVycy9ncHUvZHJtL2RybV9ub21vZGVzZXQuYw0KPiArKysgZHJpdmVy
cy9ncHUvZHJtL2RybV9ub21vZGVzZXQuYw0KPiBAQCAtMTUsOSArMTUsNyBAQCBzdGF0aWMg
aW50IF9faW5pdCBkaXNhYmxlX21vZGVzZXQoY2hhciAqc3RyKQ0KPiAgIHsNCj4gICAJZHJt
X25vbW9kZXNldCA9IHRydWU7DQo+ICAgDQo+IC0JcHJfd2FybigiWW91IGhhdmUgYm9vdGVk
IHdpdGggbm9tb2Rlc2V0LiBUaGlzIG1lYW5zIHlvdXIgR1BVIGRyaXZlcnMgYXJlIERJU0FC
TEVEXG4iKTsNCj4gLQlwcl93YXJuKCJBbnkgdmlkZW8gcmVsYXRlZCBmdW5jdGlvbmFsaXR5
IHdpbGwgYmUgc2V2ZXJlbHkgZGVncmFkZWQsIGFuZCB5b3UgbWF5IG5vdCBldmVuIGJlIGFi
bGUgdG8gc3VzcGVuZCB0aGUgc3lzdGVtIHByb3Blcmx5XG4iKTsNCj4gLQlwcl93YXJuKCJV
bmxlc3MgeW91IGFjdHVhbGx5IHVuZGVyc3RhbmQgd2hhdCBub21vZGVzZXQgZG9lcywgeW91
IHNob3VsZCByZWJvb3Qgd2l0aG91dCBlbmFibGluZyBpdFxuIik7DQo+ICsJcHJfd2Fybigi
Qm9vdGVkIHdpdGggdGhlIG5vbW9kZXNldCBwYXJhbWV0ZXIuIEdyYXBoaWNzIGRyaXZlcnMg
d2lsbCBub3QgYmUgbG9hZGVkXG4iKTsNCg0KU2FtZSBpc3N1ZSBhcyB3aXRoIHBhdGNoIDUu
IFJhdGhlciBzYXkgc29tZXRoaW5nIGxpa2UNCg0KICAgQm9vdGVkIHdpdGggdGhlIG5vbW9k
ZXNldCBwYXJhbWV0ZXIuIE9ubHkgdGhlIHN5c3RlbSBmcmFtZWJ1ZmZlciB3aWxsIA0KYmUg
YXZhaWxhYmxlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgDQo+ICAgCXJldHVy
biAxOw0KPiAgIH0NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------lCF3aKpvJG1bTf6AzBHi5nJB--

--------------6LNxu293iACcwzO0SPj3WqX9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGJHQEFAwAAAAAACgkQlh/E3EQov+AM
SA/8DGq1kGqyeGP0Ck4Lz/AkI0lbUhb7W9iuBsEzY/+zKgyWjItcbPyGj6LP3vwTU4idX8k1emFo
bIP2lD2KdtE+6Cj1Rs4pvDARJNAASxiJIJWFU+3QlZvcaFhKCHoAXJ/VB0oevaOBVzOZlKnANWz6
DxyN5ehS9dA88DvyWpeBAscux6Vvhkw7oJpUz/lQX9567jzGQbIxWzFfDuxWyV8duKnq5swibgb8
8UYOTsUIe5Wl2jq1bvdfxIPaqrNzMW3c+uHArksryGEG5lPkRjdOUpKr0VAn5FS2ZigStBn+neJX
CU1eEzZa+5ov10QPDD/snVu07Mg5MDtqyerkFLeCcFfeX2EqtWmB3YsNqvD1Rwcnue+waW69B2eK
uxmR4+laSn9vr+ZSmoLlQ+pZ+Mg/2Oictta6CRxg0kZpbtkk3atuF3TFYzma4N1+zCIjurrE3pt7
ygDDGfmLQdW5GF+h/C0AvtInQvVgHN3rugB93EBJ56PlGCL9IOIp7mRcTjwzZwXl1Wqx1chhNzAg
mIgjxTbvAH3O7Q9PTLZ693z83q/kLb9j9zndyvu21MxbRBFo+S1r03MyP3e41j6hVVy4krxHzHWr
uI2AofiQtVuy4TTEV2akdiC+tk7lfeHshQW7u1OKbGCtiDseehcycjaYqXLTz/hiGRqr3rxTY5QG
Lck=
=N9YE
-----END PGP SIGNATURE-----

--------------6LNxu293iACcwzO0SPj3WqX9--
