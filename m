Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9B08309A1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 16:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7940D10E004;
	Wed, 17 Jan 2024 15:22:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9789510E004
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 15:22:04 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 400201FCD5;
 Wed, 17 Jan 2024 15:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705504922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yTUmHeAhwZxTViiJ9xhzBWvKQRPsIkeOPPoGSjRXoko=;
 b=rHHgXeNffcyHH0jUlgSy42PRc97bBUAVkR1L6BTp81VK8/8yLIgc5EYCMAXW4T0d9ozvXJ
 CqE/IQREAojzSxvfm7+yi27lv3mcsR06+CgbqRntD58Zj6eHVxRrruKNPIZ8iN8XBOhaV2
 S3sPROzcGSa38y2XFsB4xtXo1NNY6jo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705504922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yTUmHeAhwZxTViiJ9xhzBWvKQRPsIkeOPPoGSjRXoko=;
 b=TTfm6jvF/zwK5KZioErrD7ckfFjC+IhJz7Nzigy+c1C0VgQnzPeTqa5fx7/3Z43De/JYFI
 aGODbgNFJxnzfMDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705504922; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yTUmHeAhwZxTViiJ9xhzBWvKQRPsIkeOPPoGSjRXoko=;
 b=rHHgXeNffcyHH0jUlgSy42PRc97bBUAVkR1L6BTp81VK8/8yLIgc5EYCMAXW4T0d9ozvXJ
 CqE/IQREAojzSxvfm7+yi27lv3mcsR06+CgbqRntD58Zj6eHVxRrruKNPIZ8iN8XBOhaV2
 S3sPROzcGSa38y2XFsB4xtXo1NNY6jo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705504922;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yTUmHeAhwZxTViiJ9xhzBWvKQRPsIkeOPPoGSjRXoko=;
 b=TTfm6jvF/zwK5KZioErrD7ckfFjC+IhJz7Nzigy+c1C0VgQnzPeTqa5fx7/3Z43De/JYFI
 aGODbgNFJxnzfMDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EBF8A13800;
 Wed, 17 Jan 2024 15:22:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id bM1ROJnwp2VHFwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Jan 2024 15:22:01 +0000
Message-ID: <d46b3361-297f-4361-bc6b-68c4109a63aa@suse.de>
Date: Wed, 17 Jan 2024 16:22:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/9] drm/simpledrm: Add drm_panic support
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-7-jfalempe@redhat.com>
 <ZaFCWUwxpxv5B0AM@phenom.ffwll.local>
 <koiw5xzpcmjgg3grprd6qlm2sidt4mylqiv6aycnqvayylpexb@5viaz5qishhj>
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
In-Reply-To: <koiw5xzpcmjgg3grprd6qlm2sidt4mylqiv6aycnqvayylpexb@5viaz5qishhj>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4Cm9TSDz3Bjxl0PMba3EM4sy"
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=rHHgXeNf;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=TTfm6jvF
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-7.50 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[9]; MX_GOOD(-0.01)[];
 SIGNED_PGP(-2.00)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[verizon.net];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[redhat.com,verizon.net,lists.freedesktop.org,igalia.com,tronnes.org];
 RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -7.50
X-Rspamd-Queue-Id: 400201FCD5
X-Spam-Flag: NO
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 noralf@tronnes.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4Cm9TSDz3Bjxl0PMba3EM4sy
Content-Type: multipart/mixed; boundary="------------DC00hmzynkwmlvuAhigFw6eC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, gpiccoli@igalia.com,
 noralf@tronnes.org, airlied@redhat.com
Message-ID: <d46b3361-297f-4361-bc6b-68c4109a63aa@suse.de>
Subject: Re: [PATCH v7 6/9] drm/simpledrm: Add drm_panic support
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-7-jfalempe@redhat.com>
 <ZaFCWUwxpxv5B0AM@phenom.ffwll.local>
 <koiw5xzpcmjgg3grprd6qlm2sidt4mylqiv6aycnqvayylpexb@5viaz5qishhj>
In-Reply-To: <koiw5xzpcmjgg3grprd6qlm2sidt4mylqiv6aycnqvayylpexb@5viaz5qishhj>

--------------DC00hmzynkwmlvuAhigFw6eC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDEuMjQgdW0gMTQ6NTggc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBP
biBGcmksIEphbiAxMiwgMjAyNCBhdCAwMjo0NDo1N1BNICswMTAwLCBEYW5pZWwgVmV0dGVy
IHdyb3RlOg0KPj4gT24gVGh1LCBKYW4gMDQsIDIwMjQgYXQgMDU6MDA6NTBQTSArMDEwMCwg
Sm9jZWx5biBGYWxlbXBlIHdyb3RlOg0KPj4+IEFkZCBzdXBwb3J0IGZvciB0aGUgZHJtX3Bh
bmljIG1vZHVsZSwgd2hpY2ggZGlzcGxheXMgYSB1c2VyLWZyaWVuZGx5DQo+Pj4gbWVzc2Fn
ZSB0byB0aGUgc2NyZWVuIHdoZW4gYSBrZXJuZWwgcGFuaWMgb2NjdXJzLg0KPj4+DQo+Pj4g
U2lnbmVkLW9mZi1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUByZWRoYXQuY29tPg0K
Pj4+IC0tLQ0KPj4+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCAxNSAr
KysrKysrKysrKysrKysNCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPj4+IGluZGV4IDdjZTFj
NDYxNzY3NS4uNmRkMmFmZWU4NGQ0IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90aW55L3NpbXBsZWRybS5jDQo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2lt
cGxlZHJtLmMNCj4+PiBAQCAtMjUsNiArMjUsNyBAQA0KPj4+ICAgI2luY2x1ZGUgPGRybS9k
cm1fZ2VtX3NobWVtX2hlbHBlci5oPg0KPj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdl
ZC5oPg0KPj4+ICAgI2luY2x1ZGUgPGRybS9kcm1fbW9kZXNldF9oZWxwZXJfdnRhYmxlcy5o
Pg0KPj4+ICsjaW5jbHVkZSA8ZHJtL2RybV9wYW5pYy5oPg0KPj4+ICAgI2luY2x1ZGUgPGRy
bS9kcm1fcHJvYmVfaGVscGVyLmg+DQo+Pj4gICANCj4+PiAgICNkZWZpbmUgRFJJVkVSX05B
TUUJInNpbXBsZWRybSINCj4+PiBAQCAtOTg1LDYgKzk4NiwxOSBAQCBzdGF0aWMgc3RydWN0
IHNpbXBsZWRybV9kZXZpY2UgKnNpbXBsZWRybV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBkcm1f
ZHJpdmVyICpkcnYsDQo+Pj4gICAJcmV0dXJuIHNkZXY7DQo+Pj4gICB9DQo+Pj4gICANCj4+
PiArc3RhdGljIGludCBzaW1wbGVkcm1fZ2V0X3NjYW5vdXRfYnVmZmVyKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYsDQo+Pj4gKwkJCQkJc3RydWN0IGRybV9zY2Fub3V0X2J1ZmZlciAqc2Ip
DQo+Pj4gK3sNCj4+PiArCXN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzZGV2ID0gc2ltcGxl
ZHJtX2RldmljZV9vZl9kZXYoZGV2KTsNCj4+DQo+PiBTbyBJIGd1ZXNzIHNpbXBsZWRybSBp
cyB0aGUgcmVhc29uIHdoeSB0aGUgZ2V0X3NjYW5vdXRfYnVmZmVyIGhvb2sgaXMgYXQNCj4+
IHRoZSBkZXZpY2UgbGV2ZWwgYW5kIG5vdCBhdCB0aGUgcGxhbmUgbGV2ZWwuIEV2ZW4gZnJv
bSB0aGUgZmV3IGRyaXZlcnMgeW91DQo+PiBoYXZlIGluIHlvdXIgc2VyaWVzIGl0IHNlZW1z
IHZlcnkgbXVjaCB0aGUgZXhjZXB0aW9uLCBzbyBJJ20gbm90IHN1cmUNCj4+IHdoZXRoZXIg
dGhhdCdzIHRoZSBiZXN0IGRlc2lnbi4NCj4+DQo+PiBJIGd1ZXNzIHdlJ2xsIGtub3cgd2hl
biB3ZSBzZWUgdGhlIHBsYW5lIGl0ZXJhdG9yIGNvZGUgd2l0aCB0aGUgcmlnaHQNCj4+IGxv
Y2tpbmcsIHdoZXRoZXIgaXQncyBvayB0byBoYXZlIHRoYXQgaW4gZHJpdmVyIGhvb2tzIG9y
IGl0J3MgYmV0dGVyIHRvDQo+PiBwdWxsIGl0IG91dCBpbnRvIHNoYXJlZCBjb2RlLg0KPiAN
Cj4gV291bGRuJ3QgdGhlIENSVEMgbGV2ZWwgYmUgYmV0dGVyIHRoYW4gdGhlIHBsYW5lcz8N
Cg0KV2hhdCdzIGluIGZhdm9yIG9mIHRoZSBDUlRDIGxldmVsPw0KDQpJJ2QgcHV0IGEgaG9v
ayBhdCB0aGUgcGxhbmUgbGV2ZWwgYW5kIGRvIHRoZSANCmRybV9mb3JfZWFjaF9wcmltYXJ5
X3Zpc2libGVfcGxhbmUoKSBpbiB0aGUgcGFuaWMgaGFuZGxlci4gU2ltcGxlZHJtIA0Kd291
bGQgZml0IGludG8gdGhpcyBwYXR0ZXJuIG5pY2VseS4NCg0KQnV0IGl0J3Mgbm90IGxpa2Ug
SSBoYXZlIHN0cm9uZyBmZWVsaW5nIGFib3V0IHRoaXMuIFRoZSBjdXJyZW50IA0KY2FsbGJh
Y2tzIGFyZSBzaW1wbGUgZW5vdWdoLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0K
PiBNYXhpbWUNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------DC00hmzynkwmlvuAhigFw6eC--

--------------4Cm9TSDz3Bjxl0PMba3EM4sy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWn8JkFAwAAAAAACgkQlh/E3EQov+C3
wA/+J3/ZtU/sp3c9zftxJ+zgGhfb/KS2EvTAMqnTkCIQ5EkXvy82lpDP1as/7rXgYEPiCrrv9CWp
ZSVbuKDGgRLfMxYMnhu+B14fc+NF3fdvH96QA0G3QkGzNd+D1tA1S5axXcVZcom+oqY2RlXY6HW0
4b5j2K1VjwRU19R//gL+5SFWEsPu+qfh40CvRQuo7hh16BoJX/gqZZaL18OIhIhRA46h5xW/igmZ
LEwiasf6AOmB2OJwg/u/5hd9XvUAkLBDWhfGE3VpGvLyZFpeT+frH+SVhYWs8VEjXIViCz5liqi7
22KzdAH8J2XwaSK5AIU/NMVUufMY1Sg2lLKKpeTycYJBnRz/XoHys7V0m8nFqz1Ldc2f3vORIzwQ
b1UrKofNt4bJzmnY8Rlupng293w9fahVJhxGReewN300G8nRg+Lipq5jGrC/+KbRvU3cCcM/8hNs
KLaoTn+QsIv67nbMPlrR6Ii+/U/mwmNJ+QTB92Vd/YTsOciEoTop0JLwUueGz9nloJDUW4CJEIKP
emKCMFroxHCWqFoo5fHaXiiddirZJb0dSyTtXySLVbt/pzjM+z8Pbjq/5gAk68hEFLMf3dcc7mbR
phP2wTkyGDag4qMY9um5qtpRqh6u6SS5u2EzfujxePQWTenKUtJc09BZSNOu3pCiO+3bzqQakzsQ
O7Q=
=PSDy
-----END PGP SIGNATURE-----

--------------4Cm9TSDz3Bjxl0PMba3EM4sy--
