Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A567B2CE9
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 09:13:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1F510E6C3;
	Fri, 29 Sep 2023 07:13:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84AF910E6C3
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 07:13:28 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 18D0C218FD;
 Fri, 29 Sep 2023 07:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695971607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nrYvTqJ5GJC1pGMtMTNLLaXDM5jdkE7aU1rD+pvKECc=;
 b=y+V9jMKYN7bytgMu4iB/76TgpjZqzM5yhh8zMv2s3G15oIHv9JLsJ2WdhEJuJfQ+lj+pxD
 3LbxqogTgVphW0WxOjZM08oH9N68qgbo6xGZQq/28CzVxMlVyT+9gVANIItUVNmTs3Vfc8
 xVXnhA+UDq673v+DjM69N8lMf1IrSkE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695971607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=nrYvTqJ5GJC1pGMtMTNLLaXDM5jdkE7aU1rD+pvKECc=;
 b=/iqS1z9IFPtuEKxGPktmpo5AVJ9EjK0oG15LoEDBa5xaKrTpRjFzVRsK23wht3bi1lHYzm
 9SNtORkontxr1oCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C946F1390A;
 Fri, 29 Sep 2023 07:13:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uADNLhZ5FmVORQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 29 Sep 2023 07:13:26 +0000
Message-ID: <acca8ad8-a0b4-4fda-ae9a-96463f87bbbb@suse.de>
Date: Fri, 29 Sep 2023 09:13:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm: Spelling s/preceeding/preceding/g
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <cover.1695903065.git.geert+renesas@glider.be>
 <b88ab4501bad5494ea64a558a198d69798b83db8.1695903065.git.geert+renesas@glider.be>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <b88ab4501bad5494ea64a558a198d69798b83db8.1695903065.git.geert+renesas@glider.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yNWH0lqu5uJWtpDgAjIjK0pw"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yNWH0lqu5uJWtpDgAjIjK0pw
Content-Type: multipart/mixed; boundary="------------7QC8MZEjHWmlTQuWhU27dI7R";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <acca8ad8-a0b4-4fda-ae9a-96463f87bbbb@suse.de>
Subject: Re: [PATCH 2/3] drm: Spelling s/preceeding/preceding/g
References: <cover.1695903065.git.geert+renesas@glider.be>
 <b88ab4501bad5494ea64a558a198d69798b83db8.1695903065.git.geert+renesas@glider.be>
In-Reply-To: <b88ab4501bad5494ea64a558a198d69798b83db8.1695903065.git.geert+renesas@glider.be>

--------------7QC8MZEjHWmlTQuWhU27dI7R
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI4LjA5LjIzIHVtIDE0OjE2IHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOg0K
PiBGaXggbWlzc3BlbGxpbmdzIG9mICJwcmVjZWRpbmciLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCg0KUmV2
aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+
IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hlbHBlci5jICAgICAgfCA0
ICsrLS0NCj4gICBpbmNsdWRlL2RybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oIHwg
MiArLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljX2hl
bHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMNCj4gaW5kZXgg
NzFkMzk5Mzk3MTA3NWVlYS4uMTBhYWRkMzI0Y2MzNzBlZSAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWNfaGVscGVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9hdG9taWNfaGVscGVyLmMNCj4gQEAgLTIzNzMsMTAgKzIzNzMsMTAgQEAgaW50
IGRybV9hdG9taWNfaGVscGVyX3NldHVwX2NvbW1pdChzdHJ1Y3QgZHJtX2F0b21pY19zdGF0
ZSAqc3RhdGUsDQo+ICAgRVhQT1JUX1NZTUJPTChkcm1fYXRvbWljX2hlbHBlcl9zZXR1cF9j
b21taXQpOw0KPiAgIA0KPiAgIC8qKg0KPiAtICogZHJtX2F0b21pY19oZWxwZXJfd2FpdF9m
b3JfZGVwZW5kZW5jaWVzIC0gd2FpdCBmb3IgcmVxdWlyZWQgcHJlY2VlZGluZyBjb21taXRz
DQo+ICsgKiBkcm1fYXRvbWljX2hlbHBlcl93YWl0X2Zvcl9kZXBlbmRlbmNpZXMgLSB3YWl0
IGZvciByZXF1aXJlZCBwcmVjZWRpbmcgY29tbWl0cw0KPiAgICAqIEBvbGRfc3RhdGU6IGF0
b21pYyBzdGF0ZSBvYmplY3Qgd2l0aCBvbGQgc3RhdGUgc3RydWN0dXJlcw0KPiAgICAqDQo+
IC0gKiBUaGlzIGZ1bmN0aW9uIHdhaXRzIGZvciBhbGwgcHJlY2VlZGluZyBjb21taXRzIHRo
YXQgdG91Y2ggdGhlIHNhbWUgQ1JUQyBhcw0KPiArICogVGhpcyBmdW5jdGlvbiB3YWl0cyBm
b3IgYWxsIHByZWNlZGluZyBjb21taXRzIHRoYXQgdG91Y2ggdGhlIHNhbWUgQ1JUQyBhcw0K
PiAgICAqIEBvbGRfc3RhdGUgdG8gYm90aCBiZSBjb21taXR0ZWQgdG8gdGhlIGhhcmR3YXJl
IChhcyBzaWduYWxsZWQgYnkNCj4gICAgKiBkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfaHdf
ZG9uZSgpKSBhbmQgZXhlY3V0ZWQgYnkgdGhlIGhhcmR3YXJlIChhcyBzaWduYWxsZWQNCj4g
ICAgKiBieSBjYWxsaW5nIGRybV9jcnRjX3NlbmRfdmJsYW5rX2V2ZW50KCkgb24gdGhlICZk
cm1fY3J0Y19zdGF0ZS5ldmVudCkuDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
bW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oIGIvaW5jbHVkZS9kcm0vZHJtX21vZGVzZXRfaGVs
cGVyX3Z0YWJsZXMuaA0KPiBpbmRleCBiYmM1MTZmMzEzOTEzMjU0Li45MTg2MDM3MmJlNmMw
NjRlIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRh
Ymxlcy5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92dGFibGVz
LmgNCj4gQEAgLTE0NjQsNyArMTQ2NCw3IEBAIHN0cnVjdCBkcm1fbW9kZV9jb25maWdfaGVs
cGVyX2Z1bmNzIHsNCj4gICAJICogc3dhcHBlZCBpbnRvIHRoZSB2YXJpb3VzIHN0YXRlIHBv
aW50ZXJzLiBUaGUgcGFzc2VkIGluIHN0YXRlDQo+ICAgCSAqIHRoZXJlZm9yZSBjb250YWlu
cyBjb3BpZXMgb2YgdGhlIG9sZC9wcmV2aW91cyBzdGF0ZS4gVGhpcyBob29rIHNob3VsZA0K
PiAgIAkgKiBjb21taXQgdGhlIG5ldyBzdGF0ZSBpbnRvIGhhcmR3YXJlLiBOb3RlIHRoYXQg
dGhlIGhlbHBlcnMgaGF2ZQ0KPiAtCSAqIGFscmVhZHkgd2FpdGVkIGZvciBwcmVjZWVkaW5n
IGF0b21pYyBjb21taXRzIGFuZCBmZW5jZXMsIGJ1dCBkcml2ZXJzDQo+ICsJICogYWxyZWFk
eSB3YWl0ZWQgZm9yIHByZWNlZGluZyBhdG9taWMgY29tbWl0cyBhbmQgZmVuY2VzLCBidXQg
ZHJpdmVycw0KPiAgIAkgKiBjYW4gYWRkIG1vcmUgd2FpdGluZyBjYWxscyBhdCB0aGUgc3Rh
cnQgb2YgdGhlaXIgaW1wbGVtZW50YXRpb24sIGUuZy4NCj4gICAJICogdG8gd2FpdCBmb3Ig
ZHJpdmVyLWludGVybmFsIHJlcXVlc3QgZm9yIGltcGxpY2l0IHN5bmNpbmcsIGJlZm9yZQ0K
PiAgIAkgKiBzdGFydGluZyB0byBjb21taXQgdGhlIHVwZGF0ZSB0byB0aGUgaGFyZHdhcmUu
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2Ug
MTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBN
eWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcg
TnVlcm5iZXJnKQ0K

--------------7QC8MZEjHWmlTQuWhU27dI7R--

--------------yNWH0lqu5uJWtpDgAjIjK0pw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUWeRYFAwAAAAAACgkQlh/E3EQov+Bw
1RAArHmZgJZ2O6J8fgMLNS5VKl79I0LnBXiGrSWoC5QuPASALxeWEFdxLIteG0/i6Rd+qXzq+DRp
ZJQaZCQ+mJS6/n0hlvZSisK1MmtgtR35LdgOoxgEm8dVlJK8R0CXkmUVcNw7JpNc6xlWToCkaliX
hgQ1DK+gK8clVbZruUej6ZSKynDoqdn2vfrg1Shkz0ZOKr8ZX8yAbhQhHkqLTkfTuXLCIhWlA1I8
tmpsGKJLLJm5etRI4joYJ0/4VyP+jhzXv1o+IxyxaU3rRzIS0pkzc62wQl9WC/xBVmzjFJ6Hy0MU
QeHDKITzniBMREQmwRu0hQw/XGhRRcL9CWRbOxFbFJ5MRpbVy7zXRGTXtLPDmFYFSpLepb6jPhJh
bAjIjkab69dvqmhf1Nj7g2OKpHhDU4V1lrx6RU2P5Dtn7nz5F6GOPzUSPHYaRVDQ7u4qNx6fF9JW
93PKut54XzWuqLRMiog3NzFaYMEWrLVfcqcN/hhVz0K9Lfv8vxsJDdYZ65oqgoEanX62dEwU4hHb
syEQbaPVy/UfEE3dB9ENic83TkAhgFpBOROf2raz4QF1FALLm9xuRfmGgdV3ZenGPO6rF5zknW/y
XlRwdLtooYzyCd3s/IfdQtxY3gU/LNxwDU0a44xy7QdQX1mOrLIe6cmMZghLnK6uBLXaEmvAbk6m
uwc=
=mr+o
-----END PGP SIGNATURE-----

--------------yNWH0lqu5uJWtpDgAjIjK0pw--
