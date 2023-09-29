Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3457B2CE6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 09:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCE010E6C0;
	Fri, 29 Sep 2023 07:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D48D110E6C0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 07:12:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 640331F8C0;
 Fri, 29 Sep 2023 07:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695971538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N/Tg5j9D4ppBv+Ggsbk8BrAxnQyhyY+REYUU5lZd8qA=;
 b=VPvPyAeOI7bVg06EQVTCcJwsw1ATMt6K4oST5w1QHq8lck7wajE2wOcoJMS6uYUS6ZT8ks
 hQKMOgEUKVMlD4J+ZNR3ICnz3rIoRY4EyQXz676R26TdeeQ4lnsP2Jj+eJIF2xsWc//UME
 uFXDdrnMOTbR4zmrdMPZY9WxYzKDfZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695971538;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=N/Tg5j9D4ppBv+Ggsbk8BrAxnQyhyY+REYUU5lZd8qA=;
 b=8Nw6KG8NF5Xndne7jfC43MzM6yelWV7Ca6ZdxCDcqUckChrkyEVW4WaC9KO8GfnllLSqeg
 OgoTjocxPR7Gg6BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1E9091390A;
 Fri, 29 Sep 2023 07:12:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yAq/BNJ4FmVORQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 29 Sep 2023 07:12:18 +0000
Message-ID: <7148e50e-3233-4f52-b522-8a7c69e0a2c8@suse.de>
Date: Fri, 29 Sep 2023 09:12:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm: Spelling s/hardward/hardware/g
Content-Language: en-US
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <cover.1695903065.git.geert+renesas@glider.be>
 <17b8682bb30f15001afac754d5844194428df5af.1695903065.git.geert+renesas@glider.be>
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
In-Reply-To: <17b8682bb30f15001afac754d5844194428df5af.1695903065.git.geert+renesas@glider.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------vFGycXwKx23acqbwHqup1BZc"
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
--------------vFGycXwKx23acqbwHqup1BZc
Content-Type: multipart/mixed; boundary="------------dga0TSud0F0pzlLwB583pGhJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <7148e50e-3233-4f52-b522-8a7c69e0a2c8@suse.de>
Subject: Re: [PATCH 1/3] drm: Spelling s/hardward/hardware/g
References: <cover.1695903065.git.geert+renesas@glider.be>
 <17b8682bb30f15001afac754d5844194428df5af.1695903065.git.geert+renesas@glider.be>
In-Reply-To: <17b8682bb30f15001afac754d5844194428df5af.1695903065.git.geert+renesas@glider.be>

--------------dga0TSud0F0pzlLwB583pGhJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI4LjA5LjIzIHVtIDE0OjE2IHNjaHJpZWIgR2VlcnQgVXl0dGVyaG9ldmVuOg0K
PiBGaXggbWlzc3BlbGxpbmdzIG9mICJoYXJkd2FyZSIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KDQpSZXZp
ZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCj4g
LS0tDQo+ICAgaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oICAgICAgICAgICAgICAgICB8IDIg
Ky0NCj4gICBpbmNsdWRlL2RybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5oIHwgNCAr
Ky0tDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2JyaWRnZS5oIGIvaW5j
bHVkZS9kcm0vZHJtX2JyaWRnZS5oDQo+IGluZGV4IGNmYjdkY2RiNjZjNGIwYjUuLjA1YjM2
MGE0MzU3ZmVkMDEgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9icmlkZ2UuaA0K
PiArKysgYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgNCj4gQEAgLTEwNyw3ICsxMDcsNyBA
QCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyB7DQo+ICAgCSAqIFNpbmNlIHRoaXMgZnVuY3Rp
b24gaXMgYm90aCBjYWxsZWQgZnJvbSB0aGUgY2hlY2sgcGhhc2Ugb2YgYW4gYXRvbWljDQo+
ICAgCSAqIGNvbW1pdCwgYW5kIHRoZSBtb2RlIHZhbGlkYXRpb24gaW4gdGhlIHByb2JlIHBh
dGhzIGl0IGlzIG5vdCBhbGxvd2VkDQo+ICAgCSAqIHRvIGxvb2sgYXQgYW55dGhpbmcgZWxz
ZSBidXQgdGhlIHBhc3NlZC1pbiBtb2RlLCBhbmQgdmFsaWRhdGUgaXQNCj4gLQkgKiBhZ2Fp
bnN0IGNvbmZpZ3VyYXRpb24taW52YXJpYW50IGhhcmR3YXJkIGNvbnN0cmFpbnRzLiBBbnkg
ZnVydGhlcg0KPiArCSAqIGFnYWluc3QgY29uZmlndXJhdGlvbi1pbnZhcmlhbnQgaGFyZHdh
cmUgY29uc3RyYWludHMuIEFueSBmdXJ0aGVyDQo+ICAgCSAqIGxpbWl0cyB3aGljaCBkZXBl
bmQgdXBvbiB0aGUgY29uZmlndXJhdGlvbiBjYW4gb25seSBiZSBjaGVja2VkIGluDQo+ICAg
CSAqIEBtb2RlX2ZpeHVwLg0KPiAgIAkgKg0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
ZHJtX21vZGVzZXRfaGVscGVyX3Z0YWJsZXMuaCBiL2luY2x1ZGUvZHJtL2RybV9tb2Rlc2V0
X2hlbHBlcl92dGFibGVzLmgNCj4gaW5kZXggZTNjM2FjNjE1OTA5NDc0Yi4uYmJjNTE2ZjMx
MzkxMzI1NCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21vZGVzZXRfaGVscGVy
X3Z0YWJsZXMuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRh
Ymxlcy5oDQo+IEBAIC0xMzQsNyArMTM0LDcgQEAgc3RydWN0IGRybV9jcnRjX2hlbHBlcl9m
dW5jcyB7DQo+ICAgCSAqIFNpbmNlIHRoaXMgZnVuY3Rpb24gaXMgYm90aCBjYWxsZWQgZnJv
bSB0aGUgY2hlY2sgcGhhc2Ugb2YgYW4gYXRvbWljDQo+ICAgCSAqIGNvbW1pdCwgYW5kIHRo
ZSBtb2RlIHZhbGlkYXRpb24gaW4gdGhlIHByb2JlIHBhdGhzIGl0IGlzIG5vdCBhbGxvd2Vk
DQo+ICAgCSAqIHRvIGxvb2sgYXQgYW55dGhpbmcgZWxzZSBidXQgdGhlIHBhc3NlZC1pbiBt
b2RlLCBhbmQgdmFsaWRhdGUgaXQNCj4gLQkgKiBhZ2FpbnN0IGNvbmZpZ3VyYXRpb24taW52
YXJpYW50IGhhcmR3YXJkIGNvbnN0cmFpbnRzLiBBbnkgZnVydGhlcg0KPiArCSAqIGFnYWlu
c3QgY29uZmlndXJhdGlvbi1pbnZhcmlhbnQgaGFyZHdhcmUgY29uc3RyYWludHMuIEFueSBm
dXJ0aGVyDQo+ICAgCSAqIGxpbWl0cyB3aGljaCBkZXBlbmQgdXBvbiB0aGUgY29uZmlndXJh
dGlvbiBjYW4gb25seSBiZSBjaGVja2VkIGluDQo+ICAgCSAqIEBtb2RlX2ZpeHVwIG9yIEBh
dG9taWNfY2hlY2suDQo+ICAgCSAqDQo+IEBAIC01NTAsNyArNTUwLDcgQEAgc3RydWN0IGRy
bV9lbmNvZGVyX2hlbHBlcl9mdW5jcyB7DQo+ICAgCSAqIFNpbmNlIHRoaXMgZnVuY3Rpb24g
aXMgYm90aCBjYWxsZWQgZnJvbSB0aGUgY2hlY2sgcGhhc2Ugb2YgYW4gYXRvbWljDQo+ICAg
CSAqIGNvbW1pdCwgYW5kIHRoZSBtb2RlIHZhbGlkYXRpb24gaW4gdGhlIHByb2JlIHBhdGhz
IGl0IGlzIG5vdCBhbGxvd2VkDQo+ICAgCSAqIHRvIGxvb2sgYXQgYW55dGhpbmcgZWxzZSBi
dXQgdGhlIHBhc3NlZC1pbiBtb2RlLCBhbmQgdmFsaWRhdGUgaXQNCj4gLQkgKiBhZ2FpbnN0
IGNvbmZpZ3VyYXRpb24taW52YXJpYW50IGhhcmR3YXJkIGNvbnN0cmFpbnRzLiBBbnkgZnVy
dGhlcg0KPiArCSAqIGFnYWluc3QgY29uZmlndXJhdGlvbi1pbnZhcmlhbnQgaGFyZHdhcmUg
Y29uc3RyYWludHMuIEFueSBmdXJ0aGVyDQo+ICAgCSAqIGxpbWl0cyB3aGljaCBkZXBlbmQg
dXBvbiB0aGUgY29uZmlndXJhdGlvbiBjYW4gb25seSBiZSBjaGVja2VkIGluDQo+ICAgCSAq
IEBtb2RlX2ZpeHVwIG9yIEBhdG9taWNfY2hlY2suDQo+ICAgCSAqDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVy
bmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1j
RG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------dga0TSud0F0pzlLwB583pGhJ--

--------------vFGycXwKx23acqbwHqup1BZc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUWeNIFAwAAAAAACgkQlh/E3EQov+Cf
mg/+Ls9FeVuU+cz4yzG9K9Y/2q+nWSKbTslhX0js9JWhzLi0u5JrSDnBdY13h3wWiKKAhemE8znL
sEZyN5Nng5sXaSgnrNaTpNaV2NWi9BBHW7jHdZpVypIJ6JNBtympzPmEIFgyz1ZFilHu6e11CPaU
VORp031Wr8I9zEhSQmDyqC65MgoY9IwbI361JFH2hdBoYF2/RgJG7r3Qu3saEUOLGSZ1wbxnd3JG
tJZY3N5IHtl9agKngjCoFLeiyBF6eQz8gkcMWkbMHM4+Prr3dp/KKcMHp2XudINSTe2voZX0H8an
ca9Txk9UQ46KnDhWb+fXnZ3R7nTD9g4XCExsxBE3YRrV/PVVNe7/4tAGx+kL+TjGeMxFRRbGXrMV
UoEcNMAf54fWJHHscHzUO6/efJFb74meYtRQkyfH99enzumRxml01xzAsGMp0uZD8vX0LZ1FaUcM
IiBXMbncLAI9CDKAAHPmBDKkECq0k0YNQCpM4fGkv0u2eGxlt9X2SFW5GXipyeoHM4Jd4HoK/1ti
G1sIN1AdDs/ZnZ0sal2ZNEGOaq4HN8aye/VlXF+6ecrCzC50OLd32wcygkL0MFQEyH8bIconebIm
v4SCTwWJX3l77KD9DnxE6wqxtG/JRmAUA6YLO2OImWZs1rxYHGod4Px2w+IGgJEH+R0oZYGIZBDo
9aU=
=C2Qt
-----END PGP SIGNATURE-----

--------------vFGycXwKx23acqbwHqup1BZc--
