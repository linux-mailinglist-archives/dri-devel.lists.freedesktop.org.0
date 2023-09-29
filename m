Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315907B2CE0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 09:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E925610E6BF;
	Fri, 29 Sep 2023 07:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5AB10E6BF
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 07:11:44 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8ADB6218F8;
 Fri, 29 Sep 2023 07:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695971502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TKZwT6p3zDQkfDux4GmY1fwM4TtMwP4f9fyi2I9wF+E=;
 b=UHF+VfWMlxaaHbVoRQBWDqJE4uqre/BRkMS+OJ5glC7D6d6awlnC9nxeT233YKO9jO/7wI
 bnGzhaOmEv9c4hAYgOu3knFwccC0D3A9rDEAvZ+Gq4R9GzBwUal67/X5MNBmcsqzls7ZiI
 UsPYELGE9oefCBU9o0JQ/wb+YS10kIE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695971502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=TKZwT6p3zDQkfDux4GmY1fwM4TtMwP4f9fyi2I9wF+E=;
 b=Y5fsi7AFoYj7LtV7gCzJKMf9zOI5TNdi85xUuuKkxasTPKTZ/g8Z9lpdfODgE/fDmgXErM
 ciEsLs7YD5r0wUCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 54F271390A;
 Fri, 29 Sep 2023 07:11:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Sp36E654FmVORQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 29 Sep 2023 07:11:42 +0000
Message-ID: <9af0ab00-7afd-493b-848a-a433e9b9e182@suse.de>
Date: Fri, 29 Sep 2023 09:11:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH/RFC 3/3] drm: Split drm_modeset_helper_vtables.h
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <cover.1695903065.git.geert+renesas@glider.be>
 <0f0eae276da4f8ed44cd1a15ffa138879d27b148.1695903065.git.geert+renesas@glider.be>
 <d9020d20-f512-42e6-8259-a7377c3d0d58@suse.de>
 <CAMuHMdUXnT61Hj8JwPenD+x_0-k_wU3bUtj8k9wh7Dd+kN4_Dw@mail.gmail.com>
Content-Language: en-US
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
In-Reply-To: <CAMuHMdUXnT61Hj8JwPenD+x_0-k_wU3bUtj8k9wh7Dd+kN4_Dw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BAlIJVCg5U9UXIOFQeIhz795"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BAlIJVCg5U9UXIOFQeIhz795
Content-Type: multipart/mixed; boundary="------------owaky2Mq3hZGJkzfaI9uXaTH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <9af0ab00-7afd-493b-848a-a433e9b9e182@suse.de>
Subject: Re: [PATCH/RFC 3/3] drm: Split drm_modeset_helper_vtables.h
References: <cover.1695903065.git.geert+renesas@glider.be>
 <0f0eae276da4f8ed44cd1a15ffa138879d27b148.1695903065.git.geert+renesas@glider.be>
 <d9020d20-f512-42e6-8259-a7377c3d0d58@suse.de>
 <CAMuHMdUXnT61Hj8JwPenD+x_0-k_wU3bUtj8k9wh7Dd+kN4_Dw@mail.gmail.com>
In-Reply-To: <CAMuHMdUXnT61Hj8JwPenD+x_0-k_wU3bUtj8k9wh7Dd+kN4_Dw@mail.gmail.com>

--------------owaky2Mq3hZGJkzfaI9uXaTH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDkuMjMgdW0gMTc6MzIgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFRodSwgU2VwIDI4LCAyMDIzIGF0IDM6NTnigK9Q
TSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+PiBB
bSAyOC4wOS4yMyB1bSAxNDoxNiBzY2hyaWViIEdlZXJ0IFV5dHRlcmhvZXZlbjoNCj4+PiA8
ZHJtL2RybV9tb2Rlc2V0X2hlbHBlcl92dGFibGVzLmg+IGlzIHRoZSBzZWNvbmQgbGFyZ2Vz
dCBoZWFkZXIgZmlsZSBpbg0KPj4+IHRoZSBEUk0gc3Vic3lzdGVtLCBhbmQgZGVjbGFyZXMg
aGVscGVycyB2dGFibGVzIGZvciB2YXJpb3VzIERSTQ0KPj4+IGNvbXBvbmVudHMuICBTZXZl
cmFsIHZ0YWJsZXMgY29udGFpbiBtZXRob2RzIHdpdGggdGhlIHNhbWUgbmFtZSwgYW5kIGFs
bA0KPj4+IGJ1dCBvbmUgdnRhYmxlIGRvIG5vdCBmaXQgb24gdGhlIHNjcmVlbiwgbWFraW5n
IGl0IGhhcmQgdG8gbmF2aWdhdGUgdG8NCj4+PiB0aGUgYWN0dWFsIG1ldGhvZCBvbmUgaXMg
aW50ZXJlc3RlZCBpbi4NCj4+Pg0KPj4+IE1ha2UgaXQgZWFzaWVyIGZvciB0aGUgY2FzdWFs
IHJldmlld2VyIHRvIGtlZXAgdHJhY2sgYnkgc3BsaXR0aW5nDQo+Pj4gPGRybS9kcm1fbW9k
ZXNldF9oZWxwZXJfdnRhYmxlcy5oPiBpbiBtdWx0aXBsZSBoZWFkZXIgZmlsZXMsIG9uZSBw
ZXIgRFJNDQo+Pj4gY29tcG9uZW50Lg0KPj4NCj4+IEkgbmV2ZXIgbGlrZWQgdGhpcyBoZWFk
ZXIgZWl0aGVyLCBidXQgZG8gd2UgbmVlZCBuZXcgaGVhZGVyIGZpbGVzPyBFYWNoDQo+PiBz
dHJ1Y3QgY291bGQgYmUgYXBwZW5kZWQgdG8gdGhlIGVuZCBvZiB0aGUgcmVndWxhciBoZWFk
ZXI6IHN0cnVjdA0KPj4gZHJtX3BsYW5lX2hlbHBlcl9mdW5jcyB0byBkcm1fcGxhbmUuaCwg
ZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuYyB0bw0KPj4gZHJtX2Nvbm5lY3Rvci5oIGFuZCBz
byBvbi4NCj4gDQo+IFRoYXQgd291bGQgd29yayBmb3IgbWUsIHRvby4gIEJ1dCBwZXJoYXBz
IHdlIHdhbnQgdG8gbWFpbnRhaW4gYSBjbGVhcg0KPiBzZXBhcmF0aW9uIGJldHdlZW4gY29y
ZSBhbmQgaGVscGVycz8NCj4gDQo+IE5vdGUgdGhhdCBtb3ZpbmcgdGhlIGNvbnRlbnRzIHRv
ICpfaGVscGVyLmggd291bGQgYmUgYW5vdGhlciBvcHRpb24sDQo+IGRybV9jcnRjX2hlbHBl
ci5oIGFuZCBkcm1fcGxhbmVfaGVscGVyLmggYWxyZWFkeSBleGlzdC4NCg0KSSd2ZSB0YWtl
biBhIGNsb3NlciBsb29rIGF0IHRoZSB1c2VycyBvZiB0aGUgX3Z0YWJsZXMgaGVhZGVyLiBU
aGVyZSdzIA0KY29kZSBpbiBkcm1fYXRvbWljX2hlbHBlci5jIG9yIGRybV9wcm9iZV9oZWxw
ZXIuYyB0aGF0IGludm9rZXMgdGhlIA0KY2FsbGJhY2sgZnVuY3Rpb25zLg0KDQpUaGUgZHJp
dmVycyBmaWxsIHRoZSBwb2ludGVycyB3aXRoIGNvZGUgdGhhdCBvZnRlbiBjb21lcyBmcm9t
IG90aGVyIA0KaGVscGVyIG1vZHVsZXMuIFRoYXQgY29kZSBpcyBpbiBmaWxlcyBsaWtlIGRy
bV9wbGFuZV9oZWxwZXIuYyBvciANCmRybV9jcnRjX2hlbHBlci5jLiBUaGVyZSBoZWFkZXIg
ZmlsZXMgYXJlIGRybV9wbGFuZV9oZWxwZXIuaCwgZXRjLg0KDQpJbiB0aGF0IGNvbnRleHQs
IHRoZSBfdnRhYmxlcyBoZWFkZXIgbWFrZXMgc2Vuc2UsIGFzIGl0IHNlcGFyYXRlcyB0aGUg
DQpjYWxsZXJzIGZyb20gdGhlIGNhbGxlZXMuIFB1dHRpbmcgdGhlIHN0cnVjdHMgaW50byBo
ZWFkZXJzIGxpa2UgDQpkcm1fcGxhbmVfaGVscGVyLmggd291bGQgbW92ZSBpdCB0byB0aGUg
Y2FsbGVlIHNpZGUuDQoNCkkgc3VnZ2VzdCB0byBsZWF2ZSB0aGUgaGVhZGVyIGFzIGl0IGlz
LiBUaGUgZmFsbG91dCB0byB0aGUgY29kZSBiYXNlIA0KZnJvbSByZWZhY3RvcmluZyBzZWVt
cyB3b3JzZSB0aGFuIHRoZSBjdXJyZW50IHN0YXRlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPj4+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQr
cmVuZXNhc0BnbGlkZXIuYmU+DQo+Pj4gLS0tDQo+Pj4gUkZDLCBhIGZ1dHVyZSBwYXRjaCBj
b3VsZCByZXBsYWNlIGluY2x1c2lvbiBvZg0KPj4+IDxkcm0vZHJtX21vZGVzZXRfaGVscGVy
X3Z0YWJsZXMuaD4gYnkgaW5jbHVzaW9uIG9mIG9uZSBvciBtb3JlIG9mIHRoZQ0KPj4+IG5l
dyBmaWxlcywgYW5kIHJlZHVjZSBjb21waWxhdGlvbiB0aW1lLg0KPj4+IC0tLQ0KPj4+ICAg
IGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3JfaGVscGVyX3Z0YWJsZS5oICAgfCAgMzY0ICsr
KysrDQo+Pj4gICAgaW5jbHVkZS9kcm0vZHJtX2NydGNfaGVscGVyX3Z0YWJsZS5oICAgICAg
ICB8ICA0ODMgKysrKysrDQo+Pj4gICAgaW5jbHVkZS9kcm0vZHJtX2VuY29kZXJfaGVscGVy
X3Z0YWJsZS5oICAgICB8ICAzODEgKysrKysNCj4+PiAgICBpbmNsdWRlL2RybS9kcm1fbW9k
ZV9jb25maWdfaGVscGVyX3Z0YWJsZS5oIHwgICA5NyArKw0KPj4+ICAgIGluY2x1ZGUvZHJt
L2RybV9tb2Rlc2V0X2hlbHBlcl92dGFibGVzLmggICAgfCAxNDY2ICstLS0tLS0tLS0tLS0t
LS0tLS0NCj4+PiAgICBpbmNsdWRlL2RybS9kcm1fcGxhbmVfaGVscGVyX3Z0YWJsZS5oICAg
ICAgIHwgIDI5NyArKysrDQo+Pj4gICAgNiBmaWxlcyBjaGFuZ2VkLCAxNjI3IGluc2VydGlv
bnMoKyksIDE0NjEgZGVsZXRpb25zKC0pDQo+Pj4gICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGlu
Y2x1ZGUvZHJtL2RybV9jb25uZWN0b3JfaGVscGVyX3Z0YWJsZS5oDQo+Pj4gICAgY3JlYXRl
IG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2RybV9jcnRjX2hlbHBlcl92dGFibGUuaA0KPj4+
ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS9kcm1fZW5jb2Rlcl9oZWxwZXJf
dnRhYmxlLmgNCj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kcm0vZHJtX21v
ZGVfY29uZmlnX2hlbHBlcl92dGFibGUuaA0KPj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBp
bmNsdWRlL2RybS9kcm1fcGxhbmVfaGVscGVyX3Z0YWJsZS5oDQo+IA0KPiBHcntvZXRqZSxl
ZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYs
IDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJz
LCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVy
bmJlcmcpDQo=

--------------owaky2Mq3hZGJkzfaI9uXaTH--

--------------BAlIJVCg5U9UXIOFQeIhz795
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUWeK0FAwAAAAAACgkQlh/E3EQov+Bl
2Q//b87uErG+zx2PBsEto8obLBX32R70cG4wm2LtgZ0K5WERkqdtmglAgjBeGuf7NBZlNVs11C7o
JoUDJdhCvmhK9vSYCGmmtilxFEbXyUSRguN/olcYgC+AvotEmh2d8ZAp4jGESAmHnlFQsnXeDo/1
+YQDJX+L6lIjak6XyEbeTPpqKcUppFODtbu4HCU3a/c0yMsBhKk7wJz5/LkVCnKRUYTh45N+f+Rg
qdGV8a1Gmv44/XBzhJcrj5P/m/VQdS9AhEGkqob8BiPFH6QhNFxQnBdQ9NDDrmGfpv5S9cL4CI+C
1weK7lwS5kSckfLc1sz4y7vgQ09DK65ZE2MBJxkEfNCybn9AAi00ppsWi2FxFqBcI/PxMBKB7i1N
VsIJXq7QocM6rvX6JTfvHlfex5apvTN9j4m3uJMrcIi6zEwNVq9MG2CM0XREw/R/m0YfCcDIlIvc
PW7fljHhUE/pbPBn9ieEqpdcAvPHKogCT+2r0tt3qlhh3hHGGDWho3nLTyMgulbY736vQK/oh5hI
w0Ot/g7Ynk1ADooRNYwfUayRyWlQJsSpA+KSsmxIaUl4B26M+HGdezdNpR5asbllhNSWJjWxlK8q
vo7haNOjp0CBGLu0uc8JfOTeUHyndODwtB1F/Y64EmdvCuTL3NgkIP4O1VI7bewitos9O+Y17jF+
IXg=
=P7kC
-----END PGP SIGNATURE-----

--------------BAlIJVCg5U9UXIOFQeIhz795--
