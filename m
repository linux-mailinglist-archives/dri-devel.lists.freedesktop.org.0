Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D8B7FBC6B
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 15:13:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E1E10E54C;
	Tue, 28 Nov 2023 14:13:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E85110E54B;
 Tue, 28 Nov 2023 14:13:06 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D40A81F74C;
 Tue, 28 Nov 2023 14:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1701180784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oyvnOsCtTrLvSgC364KQqfSFUmYl0YVx6CtTZPrzG0Q=;
 b=INy2rAkAOJs4depLcMoJXo+C6DSdH8XEwOfs96qErHFNma0LCSayVrqdleIqJxjs7Syofc
 +urlVkdj3+hyKunKS2QDchPjXZ6cZaIdfXU43UTbUQFijUJ5V3MGrpGG0mVK1xN7zBB+84
 /0Xacu8K8HJaLllUnF34YI8tP8Xrr7M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1701180784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=oyvnOsCtTrLvSgC364KQqfSFUmYl0YVx6CtTZPrzG0Q=;
 b=hXve6e8tnshkJjQis66L3A99ytiZZ9l8YaBVhE7Aatk54niA+TwCbBZYN7NFSrOowguj8k
 6tj2L0CvkmCiBbAw==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 98218133B5;
 Tue, 28 Nov 2023 14:13:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id 9yK6I3D1ZWUjLQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Nov 2023 14:13:04 +0000
Message-ID: <d242e326-54c5-40ee-8f2f-cbdf1390ffec@suse.de>
Date: Tue, 28 Nov 2023 15:13:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/8] drm/xlnx: Do not include <drm/drm_plane_helper.h>
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20231128104723.20622-1-tzimmermann@suse.de>
 <20231128104723.20622-9-tzimmermann@suse.de>
 <20231128110216.GE25590@pendragon.ideasonboard.com>
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
In-Reply-To: <20231128110216.GE25590@pendragon.ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TWp5cW2mqw40EnzZvOXbYWvK"
X-Spam-Flag: NO
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spamd-Result: default: False [-5.24 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; NEURAL_HAM_LONG(-0.96)[-0.962];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.19)[-0.946]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[8];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Score: -5.24
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
Cc: amd-gfx@lists.freedesktop.org, suijingfeng@loongson.cn, javierm@redhat.com,
 mripard@kernel.org, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TWp5cW2mqw40EnzZvOXbYWvK
Content-Type: multipart/mixed; boundary="------------znq9MDYNnXfoS5q8gqQ4csv9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: amd-gfx@lists.freedesktop.org, suijingfeng@loongson.cn,
 javierm@redhat.com, mripard@kernel.org, linux-renesas-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Message-ID: <d242e326-54c5-40ee-8f2f-cbdf1390ffec@suse.de>
Subject: Re: [PATCH 8/8] drm/xlnx: Do not include <drm/drm_plane_helper.h>
References: <20231128104723.20622-1-tzimmermann@suse.de>
 <20231128104723.20622-9-tzimmermann@suse.de>
 <20231128110216.GE25590@pendragon.ideasonboard.com>
In-Reply-To: <20231128110216.GE25590@pendragon.ideasonboard.com>

--------------znq9MDYNnXfoS5q8gqQ4csv9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMTEuMjMgdW0gMTI6MDIgc2NocmllYiBMYXVyZW50IFBpbmNoYXJ0Og0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9u
IFR1ZSwgTm92IDI4LCAyMDIzIGF0IDExOjQ1OjI0QU0gKzAxMDAsIFRob21hcyBaaW1tZXJt
YW5uIHdyb3RlOg0KPj4gUmVtb3ZlIHVubmVjZXNzYXJ5IGluY2x1ZGUgc3RhdGVtZW50cyBm
b3IgPGRybS9kcm1fcGxhbmVfaGVscGVyLmg+Lg0KPj4gVGhlIGZpbGUgY29udGFpbnMgaGVs
cGVycyBmb3Igbm9uLWF0b21pYyBjb2RlIGFuZCBzaG91bGQgbm90IGJlDQo+PiByZXF1aXJl
ZCBieSBtb3N0IGRyaXZlcnMuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4g
DQo+IEFzc3VtaW5nIHlvdSd2ZSBjb21waWxlLXRlc3RlZCB0aGUgZHJpdmVyLA0KDQpJJ3Zl
IENPTVBJTEVfVEVTVCdlZCB0aGUgZHJpdmVyIG9uIGFhcmNoNjQuDQoNCj4gDQo+IFJldmll
d2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2Fy
ZC5jb20+DQo+IA0KPiBQbGVhc2UgZ2V0IHRoaXMgbWVyZ2VkIHRocm91Z2ggZHJtLW1pc2Mg
YXMgcGFydCBvZiB0aGUgc2VyaWVzIGlmDQo+IHBvc3NpYmxlLg0KDQpTdXJlLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS94
bG54L3p5bnFtcF9rbXMuYyB8IDEgLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlv
bigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBf
a21zLmMgYi9kcml2ZXJzL2dwdS9kcm0veGxueC96eW5xbXBfa21zLmMNCj4+IGluZGV4IGE3
Zjg2MTFiZTZmNDIuLmRiM2JiNGFmYmZjNDYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGxueC96eW5xbXBfa21zLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94bG54
L3p5bnFtcF9rbXMuYw0KPj4gQEAgLTI3LDcgKzI3LDYgQEANCj4+ICAgI2luY2x1ZGUgPGRy
bS9kcm1fbWFuYWdlZC5oPg0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9tb2RlX2NvbmZpZy5o
Pg0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9wbGFuZS5oPg0KPj4gLSNpbmNsdWRlIDxkcm0v
ZHJtX3BsYW5lX2hlbHBlci5oPg0KPj4gICAjaW5jbHVkZSA8ZHJtL2RybV9wcm9iZV9oZWxw
ZXIuaD4NCj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaD4NCj4+
ICAgI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+DQo+IA0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJn
LCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFs
ZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------znq9MDYNnXfoS5q8gqQ4csv9--

--------------TWp5cW2mqw40EnzZvOXbYWvK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVl9XAFAwAAAAAACgkQlh/E3EQov+Ct
yxAApbZ2PuSz2hsFj4PTfBQLpgNk6vBeE/Mix6dvKAwYK/QVqI3kU1pOeDLYKQYnCs6gI2qVnqiW
j1e9XqnsM+mZcEMQw3TYqxy7+Qhk8ejWdQ6cSEd9hjkgEnFoT5ltjZiUaeG/5ltPxlZWeSzmVb0L
BdF5JOsoQ1RyvxB+Smurv2KgANKu3W6yC7dIpQOzFwkhmE9Rlc0k/Us6EUwJvAhdEvt5x/wmnKB2
A1cG5Up9TTqUv21Tz7mSWCoTJhigkaEpyaEzExG9Cb1o79R63ZmlEMESDARqA8Qy+Z+ODrKwDBRJ
6CjdKh4/L8eg3cOeQ26d7esQf5j8qhix8w/p+7BjyU8qacCgWCWQv+Cp1xoGEwdqpULFhl4BwWaB
FX8mBPH/IhO4QVu0bSwQhivVq8AWFM1Rugm44AR//Kbck4LaSC1quWNhS/pGid6WuYB05xvOJDax
PGBgHcUYpdnf/uTZgRUUzrnpAGOcGnkWTt88iVJKL+w+HKCLrE8/L8E1QhUeYNLlHNMEYL+AGZnU
mI9WQeyYpMWEbkY5y/6OQ6BYKUVIwKKhTgXg/zUYAVQi/NJrZW7x4SCUW4vYE6+7HZakvqXGyyLr
DB2Loz31bgWgVWHsTX3v5BgPz1ySf4q8+aSEESKEKYxK+dBGQL9HZle6+qmkVlFu08Mbmdd3EiWG
M8I=
=GKHP
-----END PGP SIGNATURE-----

--------------TWp5cW2mqw40EnzZvOXbYWvK--
