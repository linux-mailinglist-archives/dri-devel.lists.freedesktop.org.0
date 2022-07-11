Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56AF256F996
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 11:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D8062B4E1;
	Mon, 11 Jul 2022 09:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5E52B71C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 09:04:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id ED62922657;
 Mon, 11 Jul 2022 09:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657530295; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N0sttl0ghGHc4NwpD95kFENTiz7dJoV0LAQnPFHiJdM=;
 b=BL1qicO8etdbohkZP4vyLCW676vYunHdTLI1gdP9tURjW1E98xCPcahrqy7wxqWOI68FLe
 c8zJjGPCtD9StTRQZJcXN5JTocNr+KAwuOLc4clu41VIUYEUVp8NYL/vSt/vBa8jWnPyNi
 bMEUTUmTBUkpbyBmOZ3QuU+ESNjE1BE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657530295;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=N0sttl0ghGHc4NwpD95kFENTiz7dJoV0LAQnPFHiJdM=;
 b=9zsjIUp7S+NWZHRmxK9cY1E2nr6XZCekJCp6uEk6M6J7mIH7yAajZj/EJwaggiOgSsTzih
 ACoVEt8icKCTThBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC91313322;
 Mon, 11 Jul 2022 09:04:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hogsKbfny2LbNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 09:04:55 +0000
Message-ID: <b1990861-37a6-00b0-c955-ae325963593b@suse.de>
Date: Mon, 11 Jul 2022 11:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/5] drm/modes: Command line mode selection fixes and
 improvements
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
References: <cover.1657301107.git.geert@linux-m68k.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <cover.1657301107.git.geert@linux-m68k.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------K5h1qKOTkM9qgv7nA3vTW7TU"
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
Cc: linux-fbdev@vger.kernel.org, linux-m68k@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------K5h1qKOTkM9qgv7nA3vTW7TU
Content-Type: multipart/mixed; boundary="------------u3HmIz0aJJ4N0WCgApdFnNb9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-m68k@vger.kernel.org, linux-kernel@vger.kernel.org
Message-ID: <b1990861-37a6-00b0-c955-ae325963593b@suse.de>
Subject: Re: [PATCH 0/5] drm/modes: Command line mode selection fixes and
 improvements
References: <cover.1657301107.git.geert@linux-m68k.org>
In-Reply-To: <cover.1657301107.git.geert@linux-m68k.org>

--------------u3HmIz0aJJ4N0WCgApdFnNb9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDcuMjIgdW0gMjA6MjEgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IAlIaSBhbGwsDQo+IA0KPiBUaGlzIHBhdGNoIHNlcmllcyBjb250YWlucyBmaXhlcyBh
bmQgaW1wcm92ZW1lbnRzIGZvciBzcGVjaWZ5aW5nIHZpZGVvDQo+IG1vZGVzIG9uIHRoZSBr
ZXJuZWwgY29tbWFuZCBsaW5lLg0KPiANCj4gVGhpcyBoYXMgYmVlbiB0ZXN0ZWQgb24gQVJB
bnlNIHVzaW5nIGEgd29yay1pbi1wcm9ncmVzcyBBdGFyaSBEUk0gZHJpdmVyDQo+IChtb3Jl
IGluZm8gYW5kIHJlbGF0ZWQgcGF0Y2hlcyBjYW4gYmUgZm91bmQgaW4gWzFdKS4NCj4gDQo+
IFRoYW5rcyBmb3IgeW91ciBjb21tZW50cyENCg0KUGF0Y2hlcyAxIHRvIDMgbG9vayByZWFz
b25hYmxlIHRvIG1lLiBGb3IgdGhvc2U6DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KUGxlYXNlIHNlZSBteSBxdWVzdGlvbnMgb24g
cGF0Y2ggNC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gWzFdICJbUEFUQ0gg
djMgMDAvMTBdIGRybTogQWRkIHN1cHBvcnQgZm9yIGxvdy1jb2xvciBmcmFtZSBidWZmZXIg
Zm9ybWF0cyINCj4gICAgICBodHRwczovL2xvcmUua2VybmVsLm9yZy9yL2NvdmVyLjE2NTcy
OTQ5MzEuZ2l0LmdlZXJ0QGxpbnV4LW02OGsub3JnDQo+IA0KPiBHZWVydCBVeXR0ZXJob2V2
ZW4gKDUpOg0KPiAgICBkcm0vbW9kZXM6IHBhcnNlX2NtZGxpbmU6IEhhbmRsZSBlbXB0eSBt
b2RlIG5hbWUgcGFydA0KPiAgICBkcm0vbW9kZXM6IEV4dHJhY3QgZHJtX21vZGVfcGFyc2Vf
Y21kbGluZV9uYW1lZF9tb2RlKCkNCj4gICAgZHJtL21vZGVzOiBwYXJzZV9jbWRsaW5lOiBN
YWtlIG1vZGUtPipzcGVjaWZpZWQgaGFuZGxpbmcgbW9yZSB1bmlmb3JtDQo+ICAgIGRybS9t
b2RlczogQWRkIHN1cHBvcnQgZm9yIGRyaXZlci1zcGVjaWZpYyBuYW1lZCBtb2Rlcw0KPiAg
ICBkcm0vbW9kZXM6IHBhcnNlX2NtZGxpbmU6IEFkZCBzdXBwb3J0IGZvciBuYW1lZCBtb2Rl
cyBjb250YWluaW5nDQo+ICAgICAgZGFzaGVzDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS9k
cm1fbW9kZXMuYyB8IDU3ICsrKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0N
Cj4gICBpbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggfCAxMCArKysrKysrDQo+ICAgMiBm
aWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkNCj4gDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------u3HmIz0aJJ4N0WCgApdFnNb9--

--------------K5h1qKOTkM9qgv7nA3vTW7TU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLL57cFAwAAAAAACgkQlh/E3EQov+C4
+g//ZY4pBbx+ZYf4euN6IfqV4Ve3NVVXKbT9weRRRosL0DGRYpluLqGgtmlenBzGh3ak3X6IQ8pH
5ovyQDGZXKplAGATH4r1qRZ/JhpKWrON/Mm9b0YIMkkrE5NnyKMBHuemVRjEXmQaP+GPrrzkcpJZ
fa8EpGNnM13UD/A0eR5vyda4goYeiFcI5dMECOaOrPEg18SIyEPsIb5dbCQJEE7cOVwzePu7Y6Nb
2+C6RdKPuH6ndp41gAnVMAH8tw5KsZTEnZKoem6QBn5vm0CbxsJv+p26pTbtFVFyWZwsg3sxu19J
rAQQXuVwqWwb2a1ZBCA/Ze8jZOstjwE8fyPyTU6noE0cqte9r4JnTjK9GVi8V9LeZzn/laNagQd2
QD6Hf9L+K5b3JNI0tO4UUNl7rjoXT3XhiY+QVY22RiRDtAzA1Br2PlOrhCvhU1ybqOLJeXIeQ5qU
ogHc4vR8HQUQQylvZdGhfFlNEoYowndWGxF8IpKq2olBxSD98E2X3rni0g2vI46B3UTGrUU/DxtW
Gv4GjlHtjEcYJ0/KB0xmvbych0WFv6VuZ4sX9bubDFJjeT8/y7zlqIsItxx8Z9VaZat/ydF1K8Wo
5uVfK/KSBwhfEWC6/9Ky6+cBJovW2pSVAtdSDKX4bF1ARQGgCvXSXzpAweoPSoZv0+jJkQNhR8EA
mFM=
=2hAh
-----END PGP SIGNATURE-----

--------------K5h1qKOTkM9qgv7nA3vTW7TU--
