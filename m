Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9334D83A3DE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 09:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12B8510F677;
	Wed, 24 Jan 2024 08:16:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B6610F300
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 08:16:17 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B0FA51F7D9;
 Wed, 24 Jan 2024 08:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706084175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=K3bwjRKUrJgEeofFj2FcGGQtLplTXujMUBnmvj+4a4k=;
 b=ltCWH06x+4F676pUFvsXq5Pygcxjkp3filxAbdGEdMdzhrWkdGhdCxSXgwXdOcrlTZtXx4
 9XffxxwH65XLedXzM8SaxwlPh2c3s9A5JqS5tKuORFUJHq3+uP/OCUdgncp17NU9Mr9LmL
 8IjUVM4QfltWXFu/LocsT+DVHD4uhRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706084175;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=K3bwjRKUrJgEeofFj2FcGGQtLplTXujMUBnmvj+4a4k=;
 b=1PrtmJ4T2UFzNE+QR6dGRMQy3ItJ35keM6EkOrGcamsYFStxcXwhjdwzdyblDcgcu3PBAX
 lw7twNcA+/15beCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706084175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=K3bwjRKUrJgEeofFj2FcGGQtLplTXujMUBnmvj+4a4k=;
 b=ltCWH06x+4F676pUFvsXq5Pygcxjkp3filxAbdGEdMdzhrWkdGhdCxSXgwXdOcrlTZtXx4
 9XffxxwH65XLedXzM8SaxwlPh2c3s9A5JqS5tKuORFUJHq3+uP/OCUdgncp17NU9Mr9LmL
 8IjUVM4QfltWXFu/LocsT+DVHD4uhRA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706084175;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=K3bwjRKUrJgEeofFj2FcGGQtLplTXujMUBnmvj+4a4k=;
 b=1PrtmJ4T2UFzNE+QR6dGRMQy3ItJ35keM6EkOrGcamsYFStxcXwhjdwzdyblDcgcu3PBAX
 lw7twNcA+/15beCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7D0701333E;
 Wed, 24 Jan 2024 08:16:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Hfo6HU/HsGXBYgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 24 Jan 2024 08:16:15 +0000
Message-ID: <6f7023df-5352-4dcd-b16a-458a489485d3@suse.de>
Date: Wed, 24 Jan 2024 09:16:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>, Jaak Ristioja <jaak@ristioja.ee>
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
 <CAAhV-H57G-vudtEH2EbZmZQjRQLHSFvT9BYMjfmrbYnBy-Gq1A@mail.gmail.com>
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
In-Reply-To: <CAAhV-H57G-vudtEH2EbZmZQjRQLHSFvT9BYMjfmrbYnBy-Gq1A@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1RZ0xDKMXv04RuHSqs2eyz26"
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ltCWH06x;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=1PrtmJ4T
X-Spamd-Result: default: False [-5.30 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 XM_UA_NO_VERSION(0.01)[]; FROM_HAS_DN(0.00)[];
 TO_DN_SOME(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DKIM_TRACE(0.00)[suse.de:+]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[7]; MX_GOOD(-0.01)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: B0FA51F7D9
X-Spam-Level: 
X-Spam-Score: -5.30
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1RZ0xDKMXv04RuHSqs2eyz26
Content-Type: multipart/mixed; boundary="------------kLWZFvxYqc0P3OEfFmCHjaAG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Huacai Chen <chenhuacai@kernel.org>, Jaak Ristioja <jaak@ristioja.ee>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <6f7023df-5352-4dcd-b16a-458a489485d3@suse.de>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
 <CAAhV-H57G-vudtEH2EbZmZQjRQLHSFvT9BYMjfmrbYnBy-Gq1A@mail.gmail.com>
In-Reply-To: <CAAhV-H57G-vudtEH2EbZmZQjRQLHSFvT9BYMjfmrbYnBy-Gq1A@mail.gmail.com>

--------------kLWZFvxYqc0P3OEfFmCHjaAG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDEuMjQgdW0gMDQ6MDAgc2NocmllYiBIdWFjYWkgQ2hlbjoNCj4gSGks
IEphdmllciBhbmQgVGhvbWFzLA0KPiANCj4gT24gV2VkLCBKYW4gMjQsIDIwMjQgYXQgNToy
MeKAr0FNIEphYWsgUmlzdGlvamEgPGphYWtAcmlzdGlvamEuZWU+IHdyb3RlOg0KPj4NCj4+
IEhpLA0KPj4NCj4+IEkgYXBvbG9naXplIGZvciBub3QgZmluZGluZyB0aGUgdGltZSB0byB0
ZXN0IHRoaXMgZWFybGllci4NCj4+DQo+PiBPbiAxMS4xMi4yMyAwNTowOCwgSHVhY2FpIENo
ZW4gd3JvdGU6DQo+Pj4gQW5kIEphYWssIGNvdWxkIHlvdSBwbGVhc2UgdGVzdCB3aXRoIHRo
ZSBiZWxvdyBwYXRjaCAoYnV0IGtlZXAgdGhlDQo+Pj4gb3JpZ2luYWwgb3JkZXIgaW4gTWFr
ZWZpbGUpIGFuZCB0aGVuIGdpdmUgbWUgdGhlIGRtZXNnIG91dHB1dD8NCj4+Pg0KPj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2FwZXJ0dXJlLmMgYi9kcml2ZXJzL3ZpZGVvL2Fw
ZXJ0dXJlLmMNCj4+PiBpbmRleCA1NjFiZThmZWNhOTYuLmNjMmUzOWZiOThmNSAxMDA2NDQN
Cj4+PiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2FwZXJ0dXJlLmMNCj4+PiArKysgYi9kcml2ZXJz
L3ZpZGVvL2FwZXJ0dXJlLmMNCj4+PiBAQCAtMzUwLDIxICszNTAsMjkgQEAgaW50DQo+Pj4g
YXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9kZXZpY2VzKHN0cnVjdCBwY2lfZGV2
ICpwZGV2LCBjb25zdA0KPj4+IGNoYXIgKm5hDQo+Pj4gICAgICAgICAgIHJlc291cmNlX3Np
emVfdCBiYXNlLCBzaXplOw0KPj4+ICAgICAgICAgICBpbnQgYmFyLCByZXQgPSAwOw0KPj4+
DQo+Pj4gLSAgICAgICBpZiAocGRldiA9PSB2Z2FfZGVmYXVsdF9kZXZpY2UoKSkNCj4+PiAr
ICAgICAgIHByaW50aygiREVCVUc6IHJlbW92ZSAxXG4iKTsNCj4+PiArDQo+Pj4gKyAgICAg
ICBpZiAocGRldiA9PSB2Z2FfZGVmYXVsdF9kZXZpY2UoKSkgew0KPj4+ICsgICAgICAgICAg
ICAgICBwcmludGsoIkRFQlVHOiBwcmltYXJ5ID0gdHJ1ZVxuIik7DQo+Pj4gICAgICAgICAg
ICAgICAgICAgcHJpbWFyeSA9IHRydWU7DQo+Pj4gKyAgICAgICB9DQo+Pj4NCj4+PiAtICAg
ICAgIGlmIChwcmltYXJ5KQ0KPj4+ICsgICAgICAgaWYgKHByaW1hcnkpIHsNCj4+PiArICAg
ICAgICAgICAgICAgcHJpbnRrKCJERUJVRzogZGlzYWJsZSBzeXNmYlxuIik7DQo+Pj4gICAg
ICAgICAgICAgICAgICAgc3lzZmJfZGlzYWJsZSgpOw0KPj4+ICsgICAgICAgfQ0KPj4+DQo+
Pj4gICAgICAgICAgIGZvciAoYmFyID0gMDsgYmFyIDwgUENJX1NURF9OVU1fQkFSUzsgKyti
YXIpIHsNCj4+PiAgICAgICAgICAgICAgICAgICBpZiAoIShwY2lfcmVzb3VyY2VfZmxhZ3Mo
cGRldiwgYmFyKSAmIElPUkVTT1VSQ0VfTUVNKSkNCj4+PiAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGNvbnRpbnVlOw0KPj4+DQo+Pj4gKyAgICAgICAgICAgICAgIHByaW50aygiREVC
VUc6IHJlbW92ZSAyXG4iKTsNCj4+PiAgICAgICAgICAgICAgICAgICBiYXNlID0gcGNpX3Jl
c291cmNlX3N0YXJ0KHBkZXYsIGJhcik7DQo+Pj4gICAgICAgICAgICAgICAgICAgc2l6ZSA9
IHBjaV9yZXNvdXJjZV9sZW4ocGRldiwgYmFyKTsNCj4+PiAgICAgICAgICAgICAgICAgICBh
cGVydHVyZV9kZXRhY2hfZGV2aWNlcyhiYXNlLCBzaXplKTsNCj4+PiAgICAgICAgICAgfQ0K
Pj4+DQo+Pj4gKyAgICAgICBwcmludGsoIkRFQlVHOiByZW1vdmUgM1xuIik7DQo+Pj4gICAg
ICAgICAgIC8qDQo+Pj4gICAgICAgICAgICAqIElmIHRoaXMgaXMgdGhlIHByaW1hcnkgYWRh
cHRlciwgdGhlcmUgY291bGQgYmUgYSBWR0EgZGV2aWNlDQo+Pj4gICAgICAgICAgICAqIHRo
YXQgY29uc3VtZXMgdGhlIFZHQSBmcmFtZWJ1ZmZlciBJL08gcmFuZ2UuIFJlbW92ZSB0aGlz
DQo+Pj4NCj4+PiBbMV0gIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMTcwMjIyNzY2
Mjg0Ljg2MTAzLjExMDIwMDYwNzY5MzMwNzIxMDA4QGxlZW1odWlzLmluZm8vVC8jdQ0KPj4N
Cj4+IENvcHktcGFzdGluZyB0aGlzIGZyb20gdGhlIGUtbWFpbCBib2R5IGRpZG4ndCB3b3Jr
IHdlbGwsIGJ1dCBJIGFwcGxpZWQNCj4+IHRoZSBjaGFuZ2VzIG1hbnVhbGx5IHRvIGEgNi41
Ljkga2VybmVsIHdpdGhvdXQgYW55IG9mIHRoZSBvdGhlciBwYXRjaGVzLg0KPj4gSGVyZSdz
IHRoZSByZWxldmFudCBkbWVzZyBvdXRwdXQgb24gdGhlIExlbm92byBMNTcwOg0KPj4NCj4+
IC4uLg0KPj4gWyAgICAyLjk1MzQwNV0gQUNQSTogYnVzIHR5cGUgZHJtX2Nvbm5lY3RvciBy
ZWdpc3RlcmVkDQo+PiBbICAgIDIuOTU0MDE0XSBpOTE1IDAwMDA6MDA6MDIuMDogW2RybV0g
VlQtZCBhY3RpdmUgZm9yIGdmeCBhY2Nlc3MNCj4+IFsgICAgMi45NTQwMThdIERFQlVHOiBy
ZW1vdmUgMQ0KPj4gWyAgICAyLjk1NDAyMF0gREVCVUc6IHJlbW92ZSAyDQo+PiBbICAgIDIu
OTU0MDIxXSBERUJVRzogcmVtb3ZlIDINCj4+IFsgICAgMi45NTQwMjNdIERFQlVHOiByZW1v
dmUgMw0KPiANCj4gTXkgdG1wIHBhdGNoIGlzIGFzIGZvbGxvd3M6DQo+IA0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9hcGVydHVyZS5jIGIvZHJpdmVycy92aWRlby9hcGVydHVy
ZS5jDQo+IGluZGV4IDU2MWJlOGZlY2E5Ni4uY2MyZTM5ZmI5OGY1IDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL3ZpZGVvL2FwZXJ0dXJlLmMNCj4gKysrIGIvZHJpdmVycy92aWRlby9hcGVy
dHVyZS5jDQo+IEBAIC0zNTAsMjEgKzM1MCwyOSBAQCBpbnQNCj4gYXBlcnR1cmVfcmVtb3Zl
X2NvbmZsaWN0aW5nX3BjaV9kZXZpY2VzKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdA0K
PiBjaGFyICpuYQ0KPiAgICAgICAgICByZXNvdXJjZV9zaXplX3QgYmFzZSwgc2l6ZTsNCj4g
ICAgICAgICAgaW50IGJhciwgcmV0ID0gMDsNCj4gDQo+IC0gICAgICAgaWYgKHBkZXYgPT0g
dmdhX2RlZmF1bHRfZGV2aWNlKCkpDQo+ICsgICAgICAgcHJpbnRrKCJERUJVRzogcmVtb3Zl
IDFcbiIpOw0KPiArDQo+ICsgICAgICAgaWYgKHBkZXYgPT0gdmdhX2RlZmF1bHRfZGV2aWNl
KCkpIHsNCj4gKyAgICAgICAgICAgICAgIHByaW50aygiREVCVUc6IHByaW1hcnkgPSB0cnVl
XG4iKTsNCj4gICAgICAgICAgICAgICAgICBwcmltYXJ5ID0gdHJ1ZTsNCj4gKyAgICAgICB9
DQo+IA0KPiAtICAgICAgIGlmIChwcmltYXJ5KQ0KPiArICAgICAgIGlmIChwcmltYXJ5KSB7
DQo+ICsgICAgICAgICAgICAgICBwcmludGsoIkRFQlVHOiBkaXNhYmxlIHN5c2ZiXG4iKTsN
Cj4gICAgICAgICAgICAgICAgICBzeXNmYl9kaXNhYmxlKCk7DQo+ICsgICAgICAgfQ0KPiAN
Cj4gICAgICAgICAgZm9yIChiYXIgPSAwOyBiYXIgPCBQQ0lfU1REX05VTV9CQVJTOyArK2Jh
cikgew0KPiAgICAgICAgICAgICAgICAgIGlmICghKHBjaV9yZXNvdXJjZV9mbGFncyhwZGV2
LCBiYXIpICYgSU9SRVNPVVJDRV9NRU0pKQ0KPiAgICAgICAgICAgICAgICAgICAgICAgICAg
Y29udGludWU7DQo+IA0KPiArICAgICAgICAgICAgICAgcHJpbnRrKCJERUJVRzogcmVtb3Zl
IDJcbiIpOw0KPiAgICAgICAgICAgICAgICAgIGJhc2UgPSBwY2lfcmVzb3VyY2Vfc3RhcnQo
cGRldiwgYmFyKTsNCj4gICAgICAgICAgICAgICAgICBzaXplID0gcGNpX3Jlc291cmNlX2xl
bihwZGV2LCBiYXIpOw0KPiAgICAgICAgICAgICAgICAgIGFwZXJ0dXJlX2RldGFjaF9kZXZp
Y2VzKGJhc2UsIHNpemUpOw0KPiAgICAgICAgICB9DQo+IA0KPiArICAgICAgIHByaW50aygi
REVCVUc6IHJlbW92ZSAzXG4iKTsNCj4gICAgICAgICAgLyoNCj4gICAgICAgICAgICogSWYg
dGhpcyBpcyB0aGUgcHJpbWFyeSBhZGFwdGVyLCB0aGVyZSBjb3VsZCBiZSBhIFZHQSBkZXZp
Y2UNCj4gICAgICAgICAgICogdGhhdCBjb25zdW1lcyB0aGUgVkdBIGZyYW1lYnVmZmVyIEkv
TyByYW5nZS4gUmVtb3ZlIHRoaXMNCj4gDQo+ICBGcm9tIHRoZSBKYWFrJ3MgZG1lc2csIGl0
IGlzIG9idmlvdXMgdGhhdCAicGRldiA9PQ0KPiB2Z2FfZGVmYXVsdF9kZXZpY2UoKSIgaXMg
ZmFsc2UsIHdoaWNoIGNhdXNlcyBzeXNmYl9kaXNhYmxlKCkgdG8gYmUgbm90DQo+IGNhbGxl
ZC4gQW5kIEkgdGhpbmsgdGhlIHNpbXBsZS1kcm0gZGV2aWNlIGlzIG5vdCBwcm92aWRlZCBi
eSB0aGUgaTkxNQ0KPiBkZXZpY2UgaW4gdGhpcyBjYXNlLiBTbywgY2FuIHdlIHVuY29uZGl0
aW9uYWxseSBjYWxsIHN5c2ZiX2Rpc2FibGUoKQ0KPiBoZXJlLCB3aGljaCBpcyB0aGUgc2Ft
ZSBhcyBhcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfZGV2aWNlcygpPw0KDQpVbmZvcnR1
bmF0ZWx5LCB3ZSBjYW5ub3QgY2FsbCBzeXNmYl9kaXNhYmxlKCkgdW5jb25kaXRpb25hbGx5
LiANCk90aGVyd2lzZSwgd2UnZCBwb3NzaWJseSByZW1vdmUgc2ltcGxlZHJtIGV0IGFsIG9u
IHRoZSBwcmltYXJ5IGRyaXZlciANCmV2ZW4gcGRldiBpcyBub3QgdGhlIHByaW1hcnkgZGV2
aWNlLg0KDQpCb3RoLCBzeXNmYiBhbmQgdmdhYXJiLCBhcmUgaW5pdGlhbGl6ZWQgd2l0aCBz
dWJzeXNfaW5pdGNhbGxfc3luYygpIGFuZCANCnRoZSBvcmRlciBvZiBpbml0aWFsaXphdGlv
biBpcyBtb3N0IGxpa2VseSB3cm9uZyBpbiB0aGUgYnJva2VuIGJ1aWxkcy4gDQpIZW5jZSwg
cmVvcmRlcmluZyB0aGUgbGlua2luZyBtaXRpZ2F0ZXMgdGhlIHByb2JsZW0uDQoNCkkndmUg
bG9uZyBiZWVuIHRoaW5raW5nIGFib3V0IGhvdyB0aGUgZ3JhcGhpY3MgaW5pdCBjb2RlIGNv
dWxkIGJlIA0Kc3RyZWFtbGluZWQgaW50byBzb21ldGhpbmcgbW9yZSBtYW5hZ2VhYmxlLiBC
dXQgaXQncyBhIGxhcmdlciBlZmZvcnQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
DQo+IEh1YWNhaQ0KPiANCj4+IFsgICAgMi45NTQwMjldIHJlc291cmNlOiByZXNvdXJjZSBz
YW5pdHkgY2hlY2s6IHJlcXVlc3RpbmcgW21lbQ0KPj4gMHgwMDAwMDAwMGUwMDAwMDAwLTB4
MDAwMDAwMDBlZmZmZmZmZl0sIHdoaWNoIHNwYW5zIG1vcmUgdGhhbiBCT09URkINCj4+IFtt
ZW0gMHhlMDAwMDAwMC0weGUwMTJiZmZmXQ0KPj4gWyAgICAyLjk1NDAzNV0gY2FsbGVyIGk5
MTVfZ2d0dF9pbml0X2h3KzB4ODgvMHgxMjAgbWFwcGluZyBtdWx0aXBsZSBCQVJzDQo+PiBb
ICAgIDIuOTU0MDYxXSBpOTE1IDAwMDA6MDA6MDIuMDogW2RybV0gVXNpbmcgVHJhbnNwYXJl
bnQgSHVnZXBhZ2VzDQo+PiBbICAgIDIuOTU1MTAzXSBMb2FkaW5nIGZpcm13YXJlOiBpOTE1
L2tibF9kbWNfdmVyMV8wNC5iaW4NCj4+IFsgICAgMi45NTUzODRdIGk5MTUgMDAwMDowMDow
Mi4wOiBbZHJtXSBGaW5pc2hlZCBsb2FkaW5nIERNQyBmaXJtd2FyZQ0KPj4gaTkxNS9rYmxf
ZG1jX3ZlcjFfMDQuYmluICh2MS40KQ0KPj4gLi4uDQo+PiBbICAgIDQuMTQ1MDEzXSBbZHJt
XSBJbml0aWFsaXplZCBpOTE1IDEuNi4wIDIwMjAxMTAzIGZvciAwMDAwOjAwOjAyLjAgb24N
Cj4+IG1pbm9yIDANCj4+IFsgICAgNC4xNDcxMDFdIEFDUEk6IHZpZGVvOiBWaWRlbyBEZXZp
Y2UgW0dGWDBdIChtdWx0aS1oZWFkOiB5ZXMgIHJvbToNCj4+IG5vICBwb3N0OiBubykNCj4+
IFsgICAgNC4xNDcyNDRdIGlucHV0OiBWaWRlbyBCdXMgYXMNCj4+IC9kZXZpY2VzL0xOWFNZ
U1RNOjAwL0xOWFNZQlVTOjAwL1BOUDBBMDg6MDAvTE5YVklERU86MDAvaW5wdXQvaW5wdXQ0
DQo+PiBbICAgIDQuMTQ3NDEwXSBbZHJtXSBJbml0aWFsaXplZCB2Z2VtIDEuMC4wIDIwMTIw
MTEyIGZvciB2Z2VtIG9uIG1pbm9yIDENCj4+IFsgICAgNC4xNDc0MjBdIHVzYmNvcmU6IHJl
Z2lzdGVyZWQgbmV3IGludGVyZmFjZSBkcml2ZXIgdWRsDQo+PiBbICAgIDQuMTQ3NTAwXSBb
ZHJtXSBJbml0aWFsaXplZCBzaW1wbGVkcm0gMS4wLjAgMjAyMDA2MjUgZm9yDQo+PiBzaW1w
bGUtZnJhbWVidWZmZXIuMCBvbiBtaW5vciAyDQo+PiBbICAgIDQuMTQ4NjQzXSBDb25zb2xl
OiBzd2l0Y2hpbmcgdG8gY29sb3VyIGZyYW1lIGJ1ZmZlciBkZXZpY2UgODB4MzANCj4+IFsg
ICAgNC4xNTMyMTZdIHNpbXBsZS1mcmFtZWJ1ZmZlciBzaW1wbGUtZnJhbWVidWZmZXIuMDog
W2RybV0gZmIwOg0KPj4gc2ltcGxlZHJtZHJtZmIgZnJhbWUgYnVmZmVyIGRldmljZQ0KPj4g
WyAgICA0LjE1NDA0M10gbG9vcDogbW9kdWxlIGxvYWRlZA0KPj4gWyAgICA0LjE1NjAxN10g
YWhjaSAwMDAwOjAwOjE3LjA6IHZlcnNpb24gMy4wDQo+PiBbICAgIDQuMTU3MzczXSBpOTE1
IDAwMDA6MDA6MDIuMDogW2RybV0gZmIxOiBpOTE1ZHJtZmIgZnJhbWUgYnVmZmVyIGRldmlj
ZQ0KPj4gLi4uDQo+Pg0KPj4gSg0KPj4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0K
R0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4g
TW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------kLWZFvxYqc0P3OEfFmCHjaAG--

--------------1RZ0xDKMXv04RuHSqs2eyz26
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWwx08FAwAAAAAACgkQlh/E3EQov+CE
Ug//RQ90dKQKGx9w3r5opvR8MGcjA2inn/Uig1dQhGG+N0O3TPzLWPSQ/uqWVWmKLxx0Tanxha4A
z285coVkB7yJLtYugl1d1+jctQEhnP3nto216bqvwxpszyRqA+ECPicTwfwvLX9WYdk5udMQBxDt
79tfQycKEbbfbvjiy1PagDeEIopw1tmemc6KCRnARLRNfaRxm/bS+yrzrRjTf8vyWkF8cWxBwmmU
PIPFTSpOb9FtrLKwCNiC8rr6XJkKwDkZiDT7q01FnOCguIqpkZPPY/EjfWvFxChiJUm7do7hWvM1
pqfHWARaWZlVVVr9B1Dza7tnJimmc+1kBra6KmkQffswFE9PhKmpFVZ0LI+4jRh3ZhoUtPYn4XCj
/ez9xIxTx7rhQWvYlu0YLzqIJibcnqnMkQ3sdaZtPDtkiLPXqSQiclrIo/gzDQrc9RpVd7qQMt2u
R747ELQFHrv1Z/QbETTsyCtA9qWqubbPbvps4GDZHBAS9fYNwq87AjhiBdJdoq0LW5Tla8StqO3L
LlW1o6/o2gLPCkD6U12MwctENPLLWv5vdtraDZ4dyx/LNbpbouBVJy5fEZMKeqrkzbhnlSRs0Dwf
abPmC7Pb/MH5wZ7GEqUNMwtRF49zgBKRel/B2GAMSuBqHxVlRXef7dHkFcd8pRjIq6ReFw5EDjmz
wyw=
=cmB6
-----END PGP SIGNATURE-----

--------------1RZ0xDKMXv04RuHSqs2eyz26--
