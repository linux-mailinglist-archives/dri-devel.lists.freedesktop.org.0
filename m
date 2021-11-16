Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C773A452DC5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:20:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CBB16EEA1;
	Tue, 16 Nov 2021 09:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54566EE9D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:20:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A7CB1FD33;
 Tue, 16 Nov 2021 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637054431; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UMhkay8G+tg2oC1OhILyrqcci0zGQbm6EsRuFSW5CN4=;
 b=oD/JNNZnkIIS11ufsa2ste9rhrv9AzUErzjMLOfe0sopa+JSDsEmAn7WCMEGwDWomeZh7y
 mrEjxaf5JDul1Ao3+FFIVwZFa3QRgyHa+fJKVGNZZWqnD16ixOU9Y8WMgnJksFoXgzy8s5
 EBr1MVjhTb75W3IPvNyTeNmYwmoMgaU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637054431;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UMhkay8G+tg2oC1OhILyrqcci0zGQbm6EsRuFSW5CN4=;
 b=WFdUUGPQh9oq1gIEKuxSIVJzwnAp0AoJ0VYA1po8xwvTSJN+H+E9hqnjPMvzqryY6ODZLi
 EIlwEtU2P4Y3ghDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 26B3B13B37;
 Tue, 16 Nov 2021 09:20:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HbthCN93k2E/BwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 16 Nov 2021 09:20:31 +0000
Message-ID: <02d5d646-ca1c-44a8-6c62-a0c7875bfd69@suse.de>
Date: Tue, 16 Nov 2021 10:20:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 2/3] drm/vmwgfx: Copy DRM hash-table code into driver
Content-Language: en-US
To: Zack Rusin <zackr@vmware.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>
References: <20211115125539.1730-1-tzimmermann@suse.de>
 <20211115125539.1730-3-tzimmermann@suse.de>
 <d945d7699b79be95c21e5c3674fe270a95336543.camel@vmware.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <d945d7699b79be95c21e5c3674fe270a95336543.camel@vmware.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rh9xUYeDXhSNePWGXjsqgbVP"
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rh9xUYeDXhSNePWGXjsqgbVP
Content-Type: multipart/mixed; boundary="------------bF7rq475M4aDyZQZBgzTxazM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zackr@vmware.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "ray.huang@amd.com" <ray.huang@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <02d5d646-ca1c-44a8-6c62-a0c7875bfd69@suse.de>
Subject: Re: [PATCH 2/3] drm/vmwgfx: Copy DRM hash-table code into driver
References: <20211115125539.1730-1-tzimmermann@suse.de>
 <20211115125539.1730-3-tzimmermann@suse.de>
 <d945d7699b79be95c21e5c3674fe270a95336543.camel@vmware.com>
In-Reply-To: <d945d7699b79be95c21e5c3674fe270a95336543.camel@vmware.com>

--------------bF7rq475M4aDyZQZBgzTxazM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMTEuMjEgdW0gMTg6MDAgc2NocmllYiBaYWNrIFJ1c2luOg0KPiBPbiBN
b24sIDIwMjEtMTEtMTUgYXQgMTM6NTUgKzAxMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Og0KPj4gQmVzaWRlcyBzb21lIGxlZ2FjeSBjb2RlLCB2bXdnZnggaXMgdGhlIG9ubHkgdXNl
ciBvZiBEUk0ncyBoYXNoLQ0KPj4gdGFibGUgaW1wbGVtZW50YXRpb24uIENvcHkgdGhlIGNv
ZGUgaW50byB0aGUgZHJpdmVyLCBzbyB0aGF0IHRoZQ0KPj4gY29yZSBjb2RlIGNhbiBiZSBy
ZXRpcmVkLg0KPj4NCj4+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4gSG93ZXZlciwgdGhlIHJl
YWwgc29sdXRpb24gZm9yIHZtd2dmeCBpcyB0bw0KPj4gdXNlIExpbnV4JyBnZW5lcmljIGhh
c2gtdGFibGUgZnVuY3Rpb25zLg0KPiANCj4gVGhlIGNoYW5nZSBsb29rcyBnb29kLiBmd2l3
IEknZCBhcHByZWNpYXRlIGEgaGVhZHMgdXAgZm9yIGNoYW5nZXMgbGlrZQ0KPiB0aGF0IGJl
Y2F1c2UgVk13YXJlIGlzIGJ1aWxkaW5nIHVwIGEga2VybmVsIHRlYW0gYW5kIHJlcGxhY2lu
Zw0KPiBkcm1fb3Blbl9oYXNoIHdpdGggdGhlIGhhc3R0YWJsZS5oIHdvdWxkIGJlIGEgZ3Jl
YXQgdGFzayBmb3Igb3VyIG5ldw0KPiB0ZWFtLiBJIG1lYW4gaXQgc3RpbGwgaXMgYnV0IHdl
IGNvdWxkIGhhdmUgZG9uZSBpdCBpbiBzeW5jIChyZXBsYWNlDQo+IGRybV9vcGVuX2hhc2gg
d2l0aCBoYXNodGFibGUgaW4gdm13Z2Z4IGFuZCByZW1vdmUgZHJtX29wZW5faGFzaCkgcmF0
aGVyDQo+IHRoYW4gaGF2aW5nIGEgdHJhbnNpdGlvbmFsIHJlbGVhc2UuDQoNCkkgZG9uJ3Qg
bWluZCBjb29yZGluYXRpbmcgdGhlIHdvcmsgYmV0dGVyLCBidXQgSSdtIG5vdCBzdXJlIGhv
dyB3ZWxsIA0KdGhpcyBhY3R1YWxseSB3b3JrcyBpbiBwcmFjdGljZS4NCg0KVGhlcmUncyBi
ZWVuIHJlY2VudGx5IGEgcHVzaCB0b3dhcmRzIGZ1bGwtRFJNIGdyYXBoaWNzIGFuZCBhYmFu
ZG9uaW5nIA0KZmJkZXYgZW50aXJlbHkuIFRoYXQncyBvbmUgb2YgbXkgZ29hbHMgYXQgU3Vz
ZSBhbmQgSmF2aWVyIHdvcmtzIG9uIGEgDQpzaW1pbGFyIHRhc2sgb24gdGhlIFJlZGhhdCBz
aWRlLiBSZWR1Y2luZyB0aGUgbWluaW11bSBzaXplIG9mIHRoZSBEUk0gDQpjb3JlIGlzIG9u
ZSBvZiB0aGUgdGFza3MuIFRoZSBwYXRjaHNldCBoZWxwcyB3aXRoIHRoYXQuDQoNCkJ1dCBv
dXIgc2NoZWR1bGVzIHVzdWFsbHkgcmV2b2x2ZSBhcm91bmQgZGlzdHJvIHJlbGVhc2VzLiBB
bmQgaXQncyBoYXJkIA0KdG8gc3luY2hyb25pemUgd2l0aCBvdXRzaWRlIHRhc2tzLiBUcmFp
bmluZyB5b3VyIGtlcm5lbCBtaWdodCB0YWtlIA0KbG9uZ2VyIG9yIG1pZ2h0IGdvIHF1aWNr
bHkuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IHoNCj4gDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------bF7rq475M4aDyZQZBgzTxazM--

--------------rh9xUYeDXhSNePWGXjsqgbVP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGTd94FAwAAAAAACgkQlh/E3EQov+Cy
OBAAiKzU1WoULEHAV9KsEmWcs8ECdEm2V4ngNhuHdM0GIQ+s4sIlp7GrskeUa0Czg69hsnVY4aVB
nOWnju2qNgapPh5rmw4GLc5no6k9UykKKAaoIrNsv+uGdlM9oAq+5qTGhRnR0GjeHEACaoTJJCZC
q5IyA9Zb/BQy7+ppctYnKIMnFe9/QD1JBt0gfrQPmT6xnEyUaoTfFMJxOjkhUVwXhRruzjYCCmsy
vy14h5Ydk7yfZtYrdHNPT8JKwgCCyd6la9AIBJxGuD9CbpkZOnSiKqy9ODjo4ACV+zVARzX1k4Bq
pzyYT366skhA+PCc6CtolvuN517XRindtPE7m+pcbnuH92ubStuqjJ6U/VF0ESpZXUnM72IBNLyR
+1wvOV94HcoHn7l+RlO8CNz6basHqAytsATtAcDXZD9S7IX83WxbeKtkPbtXh/uELKxrF74zs1ky
ii41AG/zsPnX/NAM65puDzGgz8S1QSbkIwMxbp8aixT3zguH+Por/ARdPaBVh/2M2sc9CQCwVqek
VfO/OzvpjLuu7nkNgBDaxNDC4lbAEBqLEmWtHcd/cPDZBCzNmzl9EkcxiKifd/UCVp4zNiaPee2a
4+es9zHhQbfnI1ekMnyMQpDGjmm/00wck2USt5i2x5ObSD2DrqAjdyhugxdyfRTkzp/HkWj3feH8
Zdc=
=UwLZ
-----END PGP SIGNATURE-----

--------------rh9xUYeDXhSNePWGXjsqgbVP--
