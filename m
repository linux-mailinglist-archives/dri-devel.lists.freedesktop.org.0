Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AD5822B6E
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0BB10E251;
	Wed,  3 Jan 2024 10:33:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A6A10E251
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:33:03 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DBDBF21F9A;
 Wed,  3 Jan 2024 10:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704277982; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q/lxl/fyIuk7vG8XneGweCskroEO6K2WEskaMHTK4Xk=;
 b=ggygNdT0121llG+uSedaH9zGtfezBuJjmcqujOh8aRKd2iR5SZ8LKKdEZO0ZMDkOVbps1Y
 v0ynpsh3JUU1+W4fbPCs7YSngiqgZlLis5aU50om+cx2Ng5VZHZBpTtNTtJ/kDvmqRIsJu
 at4p3aeVy1s6byZIe9eqqKG1cTcBcPM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704277982;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q/lxl/fyIuk7vG8XneGweCskroEO6K2WEskaMHTK4Xk=;
 b=LvMqdApDF7cOaxl2bwtKPSIovakAF70ilh0N7f5mxvvfCkLzGTwKn+4VjNgs/kNnxjjt8O
 00DoLNNfCewqMHBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704277981; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q/lxl/fyIuk7vG8XneGweCskroEO6K2WEskaMHTK4Xk=;
 b=ccJr54KmqeqiyAy380uzZzC5/N19raLrwJ2EZ4PgZrIILklNyEQHnlu+LljLP+CMnyXFFa
 IsWzOZTpsKCaZ+0PjyNmGd8PD94jDPDFSS1O4ZTGauB2Lq9GHsZU6l4dMPOUsIaZgOdwj7
 GyG++Y8OmWeRfw9sCLxUMQAjxYO/ZB8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704277981;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=q/lxl/fyIuk7vG8XneGweCskroEO6K2WEskaMHTK4Xk=;
 b=wSGS8UsF3Uoje3tdfUxuNkWcwD66s/glOP/L9lp6Wq/FHmwzXZAysPs1NDBBZNNr7zs8t7
 Nw9ASCUs70sN9SDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9BD101340C;
 Wed,  3 Jan 2024 10:33:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HQy0JN03lWW4AQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 03 Jan 2024 10:33:01 +0000
Message-ID: <0750897a-94b6-4a7f-bcb5-89c5658943ca@suse.de>
Date: Wed, 3 Jan 2024 11:33:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/39] drm/bridge: switch to drm_bridge_read_edid()
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
References: <cover.1704276309.git.jani.nikula@intel.com>
 <3bf556369d2e81e0391a42035a85beb303937158.1704276309.git.jani.nikula@intel.com>
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
In-Reply-To: <3bf556369d2e81e0391a42035a85beb303937158.1704276309.git.jani.nikula@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------inia8sxNGXGQUnwWSa7jKcOV"
X-Spam-Level: *
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Spamd-Bar: /
X-Spam-Flag: NO
X-Spamd-Result: default: False [0.19 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; MIME_BASE64_TEXT_BOGUS(1.00)[];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[8];
 MX_GOOD(-0.01)[]; SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[intel.com,lists.freedesktop.org,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-0.01)[48.00%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,intel.com:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[];
 SUSPICIOUS_RECIPS(1.50)[]
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ccJr54Km;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=wSGS8UsF
X-Spam-Score: 0.19
X-Rspamd-Queue-Id: DBDBF21F9A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------inia8sxNGXGQUnwWSa7jKcOV
Content-Type: multipart/mixed; boundary="------------B8FFTHEy2cjbD0uOb3I06ZGW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Message-ID: <0750897a-94b6-4a7f-bcb5-89c5658943ca@suse.de>
Subject: Re: [PATCH v2 02/39] drm/bridge: switch to drm_bridge_read_edid()
References: <cover.1704276309.git.jani.nikula@intel.com>
 <3bf556369d2e81e0391a42035a85beb303937158.1704276309.git.jani.nikula@intel.com>
In-Reply-To: <3bf556369d2e81e0391a42035a85beb303937158.1704276309.git.jani.nikula@intel.com>

--------------B8FFTHEy2cjbD0uOb3I06ZGW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmFuaQ0KDQogPiBkcm0vYnJpZGdlOiBzd2l0Y2ggdG8gZHJtX2JyaWRnZV9yZWFkX2Vk
aWQoKQ0KDQpEaWQgeW91IG1lYW4gZHJtX2JyaWRnZV9lZGlkX3JlYWQoKSwgaGVyZSBhbmQg
aW4gdGhlIG90aGVyIHBhdGNoZXM/DQoNCihQZXJzb25hbGx5LCBJJ2QgcHJlZmVyIHJlYWRf
ZWRpZCBvdmVyIGVkaWRfcmVhZC4gVGhlIGZvcm1lciBpcyBjb21tb24gDQpzdHlsZSBhbmQg
ZWFzaWVyIHRvIHJlYWQuKQ0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpBbSAwMy4wMS4y
NCB1bSAxMTowOCBzY2hyaWViIEphbmkgTmlrdWxhOg0KPiBQcmVmZXIgdXNpbmcgdGhlIHN0
cnVjdCBkcm1fZWRpZCBiYXNlZCBmdW5jdGlvbnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBK
YW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2JyaWRnZV9jb25uZWN0b3IuYyB8IDE2ICsrKysrKysrLS0tLS0tLS0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlX2Nvbm5lY3Rv
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2VfY29ubmVjdG9yLmMNCj4gaW5kZXgg
M2FjZDY3MDIxZWM2Li45ODI1NTJjOWY5MmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fYnJpZGdlX2Nvbm5lY3Rvci5jDQo+IEBAIC0yMzksMjcgKzIzOSwyNyBAQCBzdGF0aWMg
aW50IGRybV9icmlkZ2VfY29ubmVjdG9yX2dldF9tb2Rlc19lZGlkKHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0b3IsDQo+ICAgCQkJCQkgICAgICAgc3RydWN0IGRybV9icmlkZ2Ug
KmJyaWRnZSkNCj4gICB7DQo+ICAgCWVudW0gZHJtX2Nvbm5lY3Rvcl9zdGF0dXMgc3RhdHVz
Ow0KPiAtCXN0cnVjdCBlZGlkICplZGlkOw0KPiArCWNvbnN0IHN0cnVjdCBkcm1fZWRpZCAq
ZHJtX2VkaWQ7DQo+ICAgCWludCBuOw0KPiAgIA0KPiAgIAlzdGF0dXMgPSBkcm1fYnJpZGdl
X2Nvbm5lY3Rvcl9kZXRlY3QoY29ubmVjdG9yLCBmYWxzZSk7DQo+ICAgCWlmIChzdGF0dXMg
IT0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQpDQo+ICAgCQlnb3RvIG5vX2VkaWQ7DQo+
ICAgDQo+IC0JZWRpZCA9IGRybV9icmlkZ2VfZ2V0X2VkaWQoYnJpZGdlLCBjb25uZWN0b3Ip
Ow0KPiAtCWlmICghZHJtX2VkaWRfaXNfdmFsaWQoZWRpZCkpIHsNCj4gLQkJa2ZyZWUoZWRp
ZCk7DQo+ICsJZHJtX2VkaWQgPSBkcm1fYnJpZGdlX2VkaWRfcmVhZChicmlkZ2UsIGNvbm5l
Y3Rvcik7DQo+ICsJaWYgKCFkcm1fZWRpZF92YWxpZChkcm1fZWRpZCkpIHsNCj4gKwkJZHJt
X2VkaWRfZnJlZShkcm1fZWRpZCk7DQo+ICAgCQlnb3RvIG5vX2VkaWQ7DQo+ICAgCX0NCj4g
ICANCj4gLQlkcm1fY29ubmVjdG9yX3VwZGF0ZV9lZGlkX3Byb3BlcnR5KGNvbm5lY3Rvciwg
ZWRpZCk7DQo+IC0JbiA9IGRybV9hZGRfZWRpZF9tb2Rlcyhjb25uZWN0b3IsIGVkaWQpOw0K
PiArCWRybV9lZGlkX2Nvbm5lY3Rvcl91cGRhdGUoY29ubmVjdG9yLCBkcm1fZWRpZCk7DQo+
ICsJbiA9IGRybV9lZGlkX2Nvbm5lY3Rvcl9hZGRfbW9kZXMoY29ubmVjdG9yKTsNCj4gICAN
Cj4gLQlrZnJlZShlZGlkKTsNCj4gKwlkcm1fZWRpZF9mcmVlKGRybV9lZGlkKTsNCj4gICAJ
cmV0dXJuIG47DQo+ICAgDQo+ICAgbm9fZWRpZDoNCj4gLQlkcm1fY29ubmVjdG9yX3VwZGF0
ZV9lZGlkX3Byb3BlcnR5KGNvbm5lY3RvciwgTlVMTCk7DQo+ICsJZHJtX2VkaWRfY29ubmVj
dG9yX3VwZGF0ZShjb25uZWN0b3IsIE5VTEwpOw0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+
ICAgDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFz
c2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJl
dyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAo
QUcgTnVlcm5iZXJnKQ0K

--------------B8FFTHEy2cjbD0uOb3I06ZGW--

--------------inia8sxNGXGQUnwWSa7jKcOV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWVN90FAwAAAAAACgkQlh/E3EQov+Dd
lBAAjccp6QJFLzoNEeyLy67ERx6Dre3frOX02H9g0wnUivAslqSdfPdK/3Orq+gV5FBVkrO1uRK2
htDEnyO4lDzYzrHat2EBgrEIjzfikypJ0ubbw0z6PzmbC12M2FR5+767V/mC3A+VW+NnEYC6oreW
N4Iq1zvi8wbwiME4xEJyImwzXoPkTQqxLonBC/YMgjWP6TbLYoUbFXAMeL5vUmDTe8iTnHrBhfS1
gvNkV6qmGMkmdnxPK0mBcGdqe4APN+eXImZQc83RObyB6j8PqKXQQIdj1BF0aMJ1DSNnvUH17F1n
uwHWJB62+sf83SKZy1pVXseZRN/6GCPe7Wymekd16yciIxICvZfnQ3sBp/ql7wMmRvDh3iP/aD9N
L2UjDg08wQP8Ovln6pyBQ0v4b78zy8JqBCqRky+l43+/QzUPpV9kTeIR6DvDfH1KM8DTCeF+gQVW
5H04G7QT4vWRVPyGc7DDhVmIdRuNO11r6GSF7/dKa/d37zs5zxLG/mnfY4SH8zkBonvfaADaQF2B
xbdf7kKcNI9mcmY2VKozDvyoX3a0ur0Ly2m8koKoUBgTEIOZDqWiMzdeNvNQRK2x3u3bWPl1i5Up
dRqgyPf6lYzJOdExaYcaDNM3UZ9ItEu9jS+dhmthWzPv1ix6geRRRn+oKZW5N5Nu/tGu8w/qZCp9
3P4=
=NtZR
-----END PGP SIGNATURE-----

--------------inia8sxNGXGQUnwWSa7jKcOV--
