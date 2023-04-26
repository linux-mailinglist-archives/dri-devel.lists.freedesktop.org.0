Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD80B6EF707
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 17:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65E510E9DD;
	Wed, 26 Apr 2023 15:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45EA610E9DD
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 15:01:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6CAD51FDD1;
 Wed, 26 Apr 2023 15:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682521310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RQSFVHVOoRHRUw8fHhZjYmJzL02ujbgo5LxbCfRcENY=;
 b=J83HeokaXTJbycgYxym8PIVl6vcTLrffYms0AmouufncXqMCJyDK+kZaQDYzoA8sn13lyB
 Xo5l08tH7WzdAap3lx68+puwtCXfSIX3qEYPf/gt0P9kRMVwtanvdphoM2BKlpJQo1nWs5
 m81jRMy8a0P9MHHY5yDuvI1bHes8CvY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682521310;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RQSFVHVOoRHRUw8fHhZjYmJzL02ujbgo5LxbCfRcENY=;
 b=sCWCCMFQyEqzjuT1fXyixgcdZmjL+nfNLmGnE+Dd+XcICUHH1WkEVBFfcygCmZhRnM8aRk
 +S91pO3GjmHxqtDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3211B13421;
 Wed, 26 Apr 2023 15:01:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2j0zC948SWTidAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Apr 2023 15:01:50 +0000
Message-ID: <c6cf2f7c-ef32-287c-2b3a-e08a96176af5@suse.de>
Date: Wed, 26 Apr 2023 17:01:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/6] fbdev: Return number of bytes read or written
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-2-tzimmermann@suse.de>
 <CAMuHMdUUO3oC5+f9G=scwcySr17puO3ozrW746xcuhAkWGy8tg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdUUO3oC5+f9G=scwcySr17puO3ozrW746xcuhAkWGy8tg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uofbEGIb9XqGLbtFxtnyA1HZ"
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
Cc: linux-fbdev@vger.kernel.org, teddy.wang@siliconmotion.com, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uofbEGIb9XqGLbtFxtnyA1HZ
Content-Type: multipart/mixed; boundary="------------1YFCLrKUn5J6j7Iaewa96rm0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com, deller@gmx.de,
 sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <c6cf2f7c-ef32-287c-2b3a-e08a96176af5@suse.de>
Subject: Re: [PATCH 1/6] fbdev: Return number of bytes read or written
References: <20230425142846.730-1-tzimmermann@suse.de>
 <20230425142846.730-2-tzimmermann@suse.de>
 <CAMuHMdUUO3oC5+f9G=scwcySr17puO3ozrW746xcuhAkWGy8tg@mail.gmail.com>
In-Reply-To: <CAMuHMdUUO3oC5+f9G=scwcySr17puO3ozrW746xcuhAkWGy8tg@mail.gmail.com>

--------------1YFCLrKUn5J6j7Iaewa96rm0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDQuMjMgdW0gMTY6NDEgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFR1ZSwgQXByIDI1LCAyMDIzIGF0IDQ6MjjigK9Q
TSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+PiBB
bHdheXMgcmV0dXJuIHRoZSBudW1iZXIgb2YgYnl0ZXMgcmVhZCBvciB3cml0dGVuIHdpdGhp
biB0aGUNCj4+IGZyYW1lYnVmZmVyLiBPbmx5IHJldHVybiBhbiBlcnJubyBjb2RlIGlmIGZy
YW1lYnVmZmVyIG1lbW9yeQ0KPj4gd2FzIG5vdCB0b3VjaGVkLiBUaGlzIGlzIHRoZSBzZW1h
bnRpY3MgcmVxdWlyZWQgYnkgUE9TSVggYW5kDQo+PiBtYWtlcyBmYl9yZWFkKCkgYW5kIGZi
X3dyaXRlKCkgY29tcGF0aWJsZSB3aXRoIElHVCB0ZXN0cy4gWzFdDQo+Pg0KPj4gVGhpcyBi
dWcgaGFzIGJlZW4gZml4ZWQgZm9yIGZiX3dyaXRlKCkgbG9uZyBhZ28gYnkNCj4+IGNvbW1p
dCA2YTJhODg2NjhlOTAgKCJbUEFUQ0hdIGZiZGV2OiBGaXggcmV0dXJuIGVycm9yIG9mDQo+
PiBmYl93cml0ZSIpLiBUaGUgY29kZSBpbiBmYl9yZWFkKCkgYW5kIHRoZSBjb3JyZXNwb25k
aW5nIGZiX3N5c18oKQ0KPj4gaGVscGVycyB3YXMgZm9yZ290dGVuLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4g
TGluazogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RybS9pZ3QtZ3B1LXRvb2xz
Ly0vYmxvYi9tYXN0ZXIvdGVzdHMvZmJkZXYuYyAjIDENCj4gDQo+IFRoYW5rcyBmb3IgeW91
ciBwYXRjaCENCj4gDQo+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0u
Yw0KPj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZibWVtLmMNCj4+IEBAIC04
MjAsNyArODIwLDcgQEAgZmJfcmVhZChzdHJ1Y3QgZmlsZSAqZmlsZSwgY2hhciBfX3VzZXIg
KmJ1Ziwgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKnBwb3MpDQo+Pg0KPj4gICAgICAgICAga2Zy
ZWUoYnVmZmVyKTsNCj4+DQo+PiAtICAgICAgIHJldHVybiAoZXJyKSA/IGVyciA6IGNudDsN
Cj4+ICsgICAgICAgcmV0dXJuIGNudCA/IGNudCA6IGVycjsNCj4+ICAgfQ0KPiANCj4gTG9v
a3MgYWxsIGdvb2QgdG8gbWUsIHNvDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gSG93ZXZlciwgc2hvdWxkbid0
IHRoZSBjb3B5X3RvX3VzZXIoKSBoYW5kbGluZyBpbiBmYl9yZWFkKCkgYmUgZml4ZWQsDQo+
IHRvbz8NCg0KVGhhdCdzIGEgZ29vZCBwb2ludC4gSXQgZG9lc24ndCBuZWNlc3NhcmlseSBj
b3B5IGFsbCBnaXZlbiBieXRlcyBhbmQgY2FuIA0KdGh1cyByZXR1cm4gdGhlIHdyb25nIHJl
c3VsdC4gVGhlIElHVCB0ZXN0cyBwYXNzZWQgYW55d2F5LCBidXQgSSdsbCBmaXggDQppdCBp
biB2Mi4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gR3J7b2V0amUsZWV0aW5n
fXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2
MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5k
cmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0K

--------------1YFCLrKUn5J6j7Iaewa96rm0--

--------------uofbEGIb9XqGLbtFxtnyA1HZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRJPN0FAwAAAAAACgkQlh/E3EQov+Ba
hQ//dzAWG0xHdkaF0Yqj1p6qZo9r+mSgyZ4NcxH0Hr53UQqzMEOCO66FUcDMGWelBWU1hiDC3ihJ
TVk+e2E4Y+ZNFiVVxoti6zEz/MsQ1ZYvd9bOML3kw4uyMb2DsyVft8XQAkRAooTomELnqIm+VUJR
NmiR2LDZ9HZDSG4r5uKDELaAtJ+gMD8nwmlTeBnIotm/dBcYXjynWSmbVXgA06wtE3YY5WhgwoiB
rW0H7n/5dGPQ1hDYpAvKm3uXnIO5M8zcFBHhIHnpYBBDM4B/aKWLHgel7S3hFxC1sucjkMn770Wf
57CKw/f4eBxXleIJnE6qjwQe4YBuIFbXic23HNzx2dfhNi8sjhba8dOh2beAupmAu9++6y2WmDwP
I4BijVeLnzZE7qgzsN9Wd2I0c6ZBw4CoXG7GTECFzpgOJ6lY0aZMemQjgFokwyL/3cT/mEQljde/
ULxJQepBq709/O7siN+LWVBWFx677TsMrg00m9v7ewt/AOTNHCRQ/KZltMKafG9RLhTUI94LzwGB
MQC60OGltmKkqeNW/keM9hj0y+s7IZw+sq2NTqBL/2OdAjnlhU+7gzrcivkfWUYmOfBV6zJPXy7s
YK+Mce8WirGqsJqL/0eViSBAL/3FZdoRBV1bUMV+gOP8zEG+sv1PcZEYm+ALWAZ4Eqaa+ZOa/qOK
jzM=
=ai4+
-----END PGP SIGNATURE-----

--------------uofbEGIb9XqGLbtFxtnyA1HZ--
