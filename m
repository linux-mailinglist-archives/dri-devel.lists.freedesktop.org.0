Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6567383A5C5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 10:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9952E10F6B4;
	Wed, 24 Jan 2024 09:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E8510F6B4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 09:44:40 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E8E821EB1;
 Wed, 24 Jan 2024 09:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706089469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ye97URb6+JkRuZP7s97k7gNcbvSxqa5o4ig7YQKXVTs=;
 b=Z+u0umkLLtHDhuV3CDE0l7x3B6LTQ8XFjB31C50vwphiy7eLkn6Z06pRm2PnNiQXj/fS5i
 e4C5hCAUIJJ5gygATyaatJxJ/ar9EM+nmxcGyTcM5NwDIpOhprzuOQqhGfFwWKI1iiZIIT
 IGMd+JIwGAxtxTp+Jl6bwL+f7vcTx/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706089469;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ye97URb6+JkRuZP7s97k7gNcbvSxqa5o4ig7YQKXVTs=;
 b=44z1U2hiBsqjJcyotx+AzuCj7/TB90Tng+ggDjKT+9MORYFclK/+Ai2X450UIqVS6bFUp8
 zlZLzG6+sT5VkRAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706089469; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ye97URb6+JkRuZP7s97k7gNcbvSxqa5o4ig7YQKXVTs=;
 b=Z+u0umkLLtHDhuV3CDE0l7x3B6LTQ8XFjB31C50vwphiy7eLkn6Z06pRm2PnNiQXj/fS5i
 e4C5hCAUIJJ5gygATyaatJxJ/ar9EM+nmxcGyTcM5NwDIpOhprzuOQqhGfFwWKI1iiZIIT
 IGMd+JIwGAxtxTp+Jl6bwL+f7vcTx/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706089469;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=ye97URb6+JkRuZP7s97k7gNcbvSxqa5o4ig7YQKXVTs=;
 b=44z1U2hiBsqjJcyotx+AzuCj7/TB90Tng+ggDjKT+9MORYFclK/+Ai2X450UIqVS6bFUp8
 zlZLzG6+sT5VkRAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4B77A13786;
 Wed, 24 Jan 2024 09:44:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id T5ErEf3bsGWIewAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 24 Jan 2024 09:44:29 +0000
Message-ID: <b4268c2c-531f-45ec-ad74-692b87571826@suse.de>
Date: Wed, 24 Jan 2024 10:44:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
Content-Language: en-US
To: Huacai Chen <chenhuacai@kernel.org>
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
 <CAAhV-H57G-vudtEH2EbZmZQjRQLHSFvT9BYMjfmrbYnBy-Gq1A@mail.gmail.com>
 <6f7023df-5352-4dcd-b16a-458a489485d3@suse.de>
 <CAAhV-H6KHkTnJdC8hX-BRQ5OTyDAdtfJSRn2dqKykjxQYSXqmQ@mail.gmail.com>
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
In-Reply-To: <CAAhV-H6KHkTnJdC8hX-BRQ5OTyDAdtfJSRn2dqKykjxQYSXqmQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------on70awI3W3GFZmiyuu4POzq1"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -6.28
X-Spamd-Result: default: False [-6.28 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.19)[-0.955]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,ristioja.ee:email];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Jaak Ristioja <jaak@ristioja.ee>, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------on70awI3W3GFZmiyuu4POzq1
Content-Type: multipart/mixed; boundary="------------tNfqaovWDfapAnyAScP0ClSA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Jaak Ristioja <jaak@ristioja.ee>, Huacai Chen <chenhuacai@loongson.cn>
Message-ID: <b4268c2c-531f-45ec-ad74-692b87571826@suse.de>
Subject: Re: [PATCH] drm/Makefile: Move tiny drivers before native drivers
References: <20231108024613.2898921-1-chenhuacai@loongson.cn>
 <f461f122-d3e4-4ffb-a252-543f9b6e4e5a@suse.de>
 <CAFOAJEfDZGRY42SRGF64cFbN1e8sBhYsQw_uou8hxTYfyxkhdw@mail.gmail.com>
 <CAAhV-H52y902nP6nPeghLqs+K8gNzCc3DHTU1C0AQcD0TXHMAQ@mail.gmail.com>
 <32b4b912-794f-42b6-b666-5faea8e98d7c@ristioja.ee>
 <CAAhV-H57G-vudtEH2EbZmZQjRQLHSFvT9BYMjfmrbYnBy-Gq1A@mail.gmail.com>
 <6f7023df-5352-4dcd-b16a-458a489485d3@suse.de>
 <CAAhV-H6KHkTnJdC8hX-BRQ5OTyDAdtfJSRn2dqKykjxQYSXqmQ@mail.gmail.com>
In-Reply-To: <CAAhV-H6KHkTnJdC8hX-BRQ5OTyDAdtfJSRn2dqKykjxQYSXqmQ@mail.gmail.com>

--------------tNfqaovWDfapAnyAScP0ClSA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDEuMjQgdW0gMTA6MjQgc2NocmllYiBIdWFjYWkgQ2hlbjoNCj4gSGks
IFRob21hcywNCj4gDQo+IE9uIFdlZCwgSmFuIDI0LCAyMDI0IGF0IDQ6MTbigK9QTSBUaG9t
YXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+Pg0KPj4gSGkN
Cj4+DQo+PiBBbSAyNC4wMS4yNCB1bSAwNDowMCBzY2hyaWViIEh1YWNhaSBDaGVuOg0KPj4+
IEhpLCBKYXZpZXIgYW5kIFRob21hcywNCj4+Pg0KPj4+IE9uIFdlZCwgSmFuIDI0LCAyMDI0
IGF0IDU6MjHigK9BTSBKYWFrIFJpc3Rpb2phIDxqYWFrQHJpc3Rpb2phLmVlPiB3cm90ZToN
Cj4+Pj4NCj4+Pj4gSGksDQo+Pj4+DQo+Pj4+IEkgYXBvbG9naXplIGZvciBub3QgZmluZGlu
ZyB0aGUgdGltZSB0byB0ZXN0IHRoaXMgZWFybGllci4NCj4+Pj4NCj4+Pj4gT24gMTEuMTIu
MjMgMDU6MDgsIEh1YWNhaSBDaGVuIHdyb3RlOg0KPj4+Pj4gQW5kIEphYWssIGNvdWxkIHlv
dSBwbGVhc2UgdGVzdCB3aXRoIHRoZSBiZWxvdyBwYXRjaCAoYnV0IGtlZXAgdGhlDQo+Pj4+
PiBvcmlnaW5hbCBvcmRlciBpbiBNYWtlZmlsZSkgYW5kIHRoZW4gZ2l2ZSBtZSB0aGUgZG1l
c2cgb3V0cHV0Pw0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Fw
ZXJ0dXJlLmMgYi9kcml2ZXJzL3ZpZGVvL2FwZXJ0dXJlLmMNCj4+Pj4+IGluZGV4IDU2MWJl
OGZlY2E5Ni4uY2MyZTM5ZmI5OGY1IDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy92aWRl
by9hcGVydHVyZS5jDQo+Pj4+PiArKysgYi9kcml2ZXJzL3ZpZGVvL2FwZXJ0dXJlLmMNCj4+
Pj4+IEBAIC0zNTAsMjEgKzM1MCwyOSBAQCBpbnQNCj4+Pj4+IGFwZXJ0dXJlX3JlbW92ZV9j
b25mbGljdGluZ19wY2lfZGV2aWNlcyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3QNCj4+
Pj4+IGNoYXIgKm5hDQo+Pj4+PiAgICAgICAgICAgIHJlc291cmNlX3NpemVfdCBiYXNlLCBz
aXplOw0KPj4+Pj4gICAgICAgICAgICBpbnQgYmFyLCByZXQgPSAwOw0KPj4+Pj4NCj4+Pj4+
IC0gICAgICAgaWYgKHBkZXYgPT0gdmdhX2RlZmF1bHRfZGV2aWNlKCkpDQo+Pj4+PiArICAg
ICAgIHByaW50aygiREVCVUc6IHJlbW92ZSAxXG4iKTsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAg
ICAgaWYgKHBkZXYgPT0gdmdhX2RlZmF1bHRfZGV2aWNlKCkpIHsNCj4+Pj4+ICsgICAgICAg
ICAgICAgICBwcmludGsoIkRFQlVHOiBwcmltYXJ5ID0gdHJ1ZVxuIik7DQo+Pj4+PiAgICAg
ICAgICAgICAgICAgICAgcHJpbWFyeSA9IHRydWU7DQo+Pj4+PiArICAgICAgIH0NCj4+Pj4+
DQo+Pj4+PiAtICAgICAgIGlmIChwcmltYXJ5KQ0KPj4+Pj4gKyAgICAgICBpZiAocHJpbWFy
eSkgew0KPj4+Pj4gKyAgICAgICAgICAgICAgIHByaW50aygiREVCVUc6IGRpc2FibGUgc3lz
ZmJcbiIpOw0KPj4+Pj4gICAgICAgICAgICAgICAgICAgIHN5c2ZiX2Rpc2FibGUoKTsNCj4+
Pj4+ICsgICAgICAgfQ0KPj4+Pj4NCj4+Pj4+ICAgICAgICAgICAgZm9yIChiYXIgPSAwOyBi
YXIgPCBQQ0lfU1REX05VTV9CQVJTOyArK2Jhcikgew0KPj4+Pj4gICAgICAgICAgICAgICAg
ICAgIGlmICghKHBjaV9yZXNvdXJjZV9mbGFncyhwZGV2LCBiYXIpICYgSU9SRVNPVVJDRV9N
RU0pKQ0KPj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7DQo+Pj4+
Pg0KPj4+Pj4gKyAgICAgICAgICAgICAgIHByaW50aygiREVCVUc6IHJlbW92ZSAyXG4iKTsN
Cj4+Pj4+ICAgICAgICAgICAgICAgICAgICBiYXNlID0gcGNpX3Jlc291cmNlX3N0YXJ0KHBk
ZXYsIGJhcik7DQo+Pj4+PiAgICAgICAgICAgICAgICAgICAgc2l6ZSA9IHBjaV9yZXNvdXJj
ZV9sZW4ocGRldiwgYmFyKTsNCj4+Pj4+ICAgICAgICAgICAgICAgICAgICBhcGVydHVyZV9k
ZXRhY2hfZGV2aWNlcyhiYXNlLCBzaXplKTsNCj4+Pj4+ICAgICAgICAgICAgfQ0KPj4+Pj4N
Cj4+Pj4+ICsgICAgICAgcHJpbnRrKCJERUJVRzogcmVtb3ZlIDNcbiIpOw0KPj4+Pj4gICAg
ICAgICAgICAvKg0KPj4+Pj4gICAgICAgICAgICAgKiBJZiB0aGlzIGlzIHRoZSBwcmltYXJ5
IGFkYXB0ZXIsIHRoZXJlIGNvdWxkIGJlIGEgVkdBIGRldmljZQ0KPj4+Pj4gICAgICAgICAg
ICAgKiB0aGF0IGNvbnN1bWVzIHRoZSBWR0EgZnJhbWVidWZmZXIgSS9PIHJhbmdlLiBSZW1v
dmUgdGhpcw0KPj4+Pj4NCj4+Pj4+IFsxXSAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGtt
bC8xNzAyMjI3NjYyODQuODYxMDMuMTEwMjAwNjA3NjkzMzA3MjEwMDhAbGVlbWh1aXMuaW5m
by9ULyN1DQo+Pj4+DQo+Pj4+IENvcHktcGFzdGluZyB0aGlzIGZyb20gdGhlIGUtbWFpbCBi
b2R5IGRpZG4ndCB3b3JrIHdlbGwsIGJ1dCBJIGFwcGxpZWQNCj4+Pj4gdGhlIGNoYW5nZXMg
bWFudWFsbHkgdG8gYSA2LjUuOSBrZXJuZWwgd2l0aG91dCBhbnkgb2YgdGhlIG90aGVyIHBh
dGNoZXMuDQo+Pj4+IEhlcmUncyB0aGUgcmVsZXZhbnQgZG1lc2cgb3V0cHV0IG9uIHRoZSBM
ZW5vdm8gTDU3MDoNCj4+Pj4NCj4+Pj4gLi4uDQo+Pj4+IFsgICAgMi45NTM0MDVdIEFDUEk6
IGJ1cyB0eXBlIGRybV9jb25uZWN0b3IgcmVnaXN0ZXJlZA0KPj4+PiBbICAgIDIuOTU0MDE0
XSBpOTE1IDAwMDA6MDA6MDIuMDogW2RybV0gVlQtZCBhY3RpdmUgZm9yIGdmeCBhY2Nlc3MN
Cj4+Pj4gWyAgICAyLjk1NDAxOF0gREVCVUc6IHJlbW92ZSAxDQo+Pj4+IFsgICAgMi45NTQw
MjBdIERFQlVHOiByZW1vdmUgMg0KPj4+PiBbICAgIDIuOTU0MDIxXSBERUJVRzogcmVtb3Zl
IDINCj4+Pj4gWyAgICAyLjk1NDAyM10gREVCVUc6IHJlbW92ZSAzDQo+Pj4NCj4+PiBNeSB0
bXAgcGF0Y2ggaXMgYXMgZm9sbG93czoNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3ZpZGVvL2FwZXJ0dXJlLmMgYi9kcml2ZXJzL3ZpZGVvL2FwZXJ0dXJlLmMNCj4+PiBpbmRl
eCA1NjFiZThmZWNhOTYuLmNjMmUzOWZiOThmNSAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJz
L3ZpZGVvL2FwZXJ0dXJlLmMNCj4+PiArKysgYi9kcml2ZXJzL3ZpZGVvL2FwZXJ0dXJlLmMN
Cj4+PiBAQCAtMzUwLDIxICszNTAsMjkgQEAgaW50DQo+Pj4gYXBlcnR1cmVfcmVtb3ZlX2Nv
bmZsaWN0aW5nX3BjaV9kZXZpY2VzKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdA0KPj4+
IGNoYXIgKm5hDQo+Pj4gICAgICAgICAgIHJlc291cmNlX3NpemVfdCBiYXNlLCBzaXplOw0K
Pj4+ICAgICAgICAgICBpbnQgYmFyLCByZXQgPSAwOw0KPj4+DQo+Pj4gLSAgICAgICBpZiAo
cGRldiA9PSB2Z2FfZGVmYXVsdF9kZXZpY2UoKSkNCj4+PiArICAgICAgIHByaW50aygiREVC
VUc6IHJlbW92ZSAxXG4iKTsNCj4+PiArDQo+Pj4gKyAgICAgICBpZiAocGRldiA9PSB2Z2Ff
ZGVmYXVsdF9kZXZpY2UoKSkgew0KPj4+ICsgICAgICAgICAgICAgICBwcmludGsoIkRFQlVH
OiBwcmltYXJ5ID0gdHJ1ZVxuIik7DQo+Pj4gICAgICAgICAgICAgICAgICAgcHJpbWFyeSA9
IHRydWU7DQo+Pj4gKyAgICAgICB9DQo+Pj4NCj4+PiAtICAgICAgIGlmIChwcmltYXJ5KQ0K
Pj4+ICsgICAgICAgaWYgKHByaW1hcnkpIHsNCj4+PiArICAgICAgICAgICAgICAgcHJpbnRr
KCJERUJVRzogZGlzYWJsZSBzeXNmYlxuIik7DQo+Pj4gICAgICAgICAgICAgICAgICAgc3lz
ZmJfZGlzYWJsZSgpOw0KPj4+ICsgICAgICAgfQ0KPj4+DQo+Pj4gICAgICAgICAgIGZvciAo
YmFyID0gMDsgYmFyIDwgUENJX1NURF9OVU1fQkFSUzsgKytiYXIpIHsNCj4+PiAgICAgICAg
ICAgICAgICAgICBpZiAoIShwY2lfcmVzb3VyY2VfZmxhZ3MocGRldiwgYmFyKSAmIElPUkVT
T1VSQ0VfTUVNKSkNCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOw0K
Pj4+DQo+Pj4gKyAgICAgICAgICAgICAgIHByaW50aygiREVCVUc6IHJlbW92ZSAyXG4iKTsN
Cj4+PiAgICAgICAgICAgICAgICAgICBiYXNlID0gcGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYs
IGJhcik7DQo+Pj4gICAgICAgICAgICAgICAgICAgc2l6ZSA9IHBjaV9yZXNvdXJjZV9sZW4o
cGRldiwgYmFyKTsNCj4+PiAgICAgICAgICAgICAgICAgICBhcGVydHVyZV9kZXRhY2hfZGV2
aWNlcyhiYXNlLCBzaXplKTsNCj4+PiAgICAgICAgICAgfQ0KPj4+DQo+Pj4gKyAgICAgICBw
cmludGsoIkRFQlVHOiByZW1vdmUgM1xuIik7DQo+Pj4gICAgICAgICAgIC8qDQo+Pj4gICAg
ICAgICAgICAqIElmIHRoaXMgaXMgdGhlIHByaW1hcnkgYWRhcHRlciwgdGhlcmUgY291bGQg
YmUgYSBWR0EgZGV2aWNlDQo+Pj4gICAgICAgICAgICAqIHRoYXQgY29uc3VtZXMgdGhlIFZH
QSBmcmFtZWJ1ZmZlciBJL08gcmFuZ2UuIFJlbW92ZSB0aGlzDQo+Pj4NCj4+PiAgIEZyb20g
dGhlIEphYWsncyBkbWVzZywgaXQgaXMgb2J2aW91cyB0aGF0ICJwZGV2ID09DQo+Pj4gdmdh
X2RlZmF1bHRfZGV2aWNlKCkiIGlzIGZhbHNlLCB3aGljaCBjYXVzZXMgc3lzZmJfZGlzYWJs
ZSgpIHRvIGJlIG5vdA0KPj4+IGNhbGxlZC4gQW5kIEkgdGhpbmsgdGhlIHNpbXBsZS1kcm0g
ZGV2aWNlIGlzIG5vdCBwcm92aWRlZCBieSB0aGUgaTkxNQ0KPj4+IGRldmljZSBpbiB0aGlz
IGNhc2UuIFNvLCBjYW4gd2UgdW5jb25kaXRpb25hbGx5IGNhbGwgc3lzZmJfZGlzYWJsZSgp
DQo+Pj4gaGVyZSwgd2hpY2ggaXMgdGhlIHNhbWUgYXMgYXBlcnR1cmVfcmVtb3ZlX2NvbmZs
aWN0aW5nX2RldmljZXMoKT8NCj4+DQo+PiBVbmZvcnR1bmF0ZWx5LCB3ZSBjYW5ub3QgY2Fs
bCBzeXNmYl9kaXNhYmxlKCkgdW5jb25kaXRpb25hbGx5Lg0KPj4gT3RoZXJ3aXNlLCB3ZSdk
IHBvc3NpYmx5IHJlbW92ZSBzaW1wbGVkcm0gZXQgYWwgb24gdGhlIHByaW1hcnkgZHJpdmVy
DQo+PiBldmVuIHBkZXYgaXMgbm90IHRoZSBwcmltYXJ5IGRldmljZS4NCj4+DQo+PiBCb3Ro
LCBzeXNmYiBhbmQgdmdhYXJiLCBhcmUgaW5pdGlhbGl6ZWQgd2l0aCBzdWJzeXNfaW5pdGNh
bGxfc3luYygpIGFuZA0KPj4gdGhlIG9yZGVyIG9mIGluaXRpYWxpemF0aW9uIGlzIG1vc3Qg
bGlrZWx5IHdyb25nIGluIHRoZSBicm9rZW4gYnVpbGRzLg0KPj4gSGVuY2UsIHJlb3JkZXJp
bmcgdGhlIGxpbmtpbmcgbWl0aWdhdGVzIHRoZSBwcm9ibGVtLg0KPiBPSywgc3lzZmJfaW5p
dCgpIHNob3VsZCBiZSBhZnRlciB2Z2FhcmIsIHNvIEkgdGhpbmsgd2UgIGNhbiBtb3ZlDQo+
IHN5c2ZiX2luaXQgdG8gYmUgZnNfaW5pdGNhbGwoKS4gVGhvdWdoIHN5c2ZiIGhhcyBub3Ro
aW5nIHRvIGRvIHdpdGgNCj4gImZpbGUgc3lzdGVtIiwgSSBmb3VuZCB0aGF0IHRoZXJlIGFy
ZSBhbHJlYWR5IGEgbG90IG9mIGluaXQgZnVuY3Rpb25zDQo+IHVzaW5nIGZzX2luaXRjYWxs
KCkuDQo+IA0KPiBIaSwgSmFhaywgY291bGQgeW91IHBsZWFzZSBtYWtlIHN5c2ZiX2luaXRj
YWxsIGZyb20NCj4gc3Vic3lzX2luaXRjYWxsX3N5bmMgdG8gYmUgZnNfaW5pdGNhbGwgYW5k
IHNlZSBpZiB5b3VyIHByb2JsZW0gY2FuIGJlDQo+IGZpeGVkPyBUaGFuayB5b3UgdmVyeSBt
dWNoLg0KDQpUaGFua3MgZm9yIGhlbHBpbmcuIEkgYWxyZWFkeSBzdXBwbGllZCBhIHBhdGNo
IHRvIGZpeCBzeXNmYi4gTm8gZnVydGhlciANCmFjdGlvbiBpcyByZXF1aXJlZC4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gSHVhY2FpDQo+IA0KPj4NCj4+IEkndmUgbG9u
ZyBiZWVuIHRoaW5raW5nIGFib3V0IGhvdyB0aGUgZ3JhcGhpY3MgaW5pdCBjb2RlIGNvdWxk
IGJlDQo+PiBzdHJlYW1saW5lZCBpbnRvIHNvbWV0aGluZyBtb3JlIG1hbmFnZWFibGUuIEJ1
dCBpdCdzIGEgbGFyZ2VyIGVmZm9ydC4NCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21h
cw0KPj4NCj4+Pg0KPj4+IEh1YWNhaQ0KPj4+DQo+Pj4+IFsgICAgMi45NTQwMjldIHJlc291
cmNlOiByZXNvdXJjZSBzYW5pdHkgY2hlY2s6IHJlcXVlc3RpbmcgW21lbQ0KPj4+PiAweDAw
MDAwMDAwZTAwMDAwMDAtMHgwMDAwMDAwMGVmZmZmZmZmXSwgd2hpY2ggc3BhbnMgbW9yZSB0
aGFuIEJPT1RGQg0KPj4+PiBbbWVtIDB4ZTAwMDAwMDAtMHhlMDEyYmZmZl0NCj4+Pj4gWyAg
ICAyLjk1NDAzNV0gY2FsbGVyIGk5MTVfZ2d0dF9pbml0X2h3KzB4ODgvMHgxMjAgbWFwcGlu
ZyBtdWx0aXBsZSBCQVJzDQo+Pj4+IFsgICAgMi45NTQwNjFdIGk5MTUgMDAwMDowMDowMi4w
OiBbZHJtXSBVc2luZyBUcmFuc3BhcmVudCBIdWdlcGFnZXMNCj4+Pj4gWyAgICAyLjk1NTEw
M10gTG9hZGluZyBmaXJtd2FyZTogaTkxNS9rYmxfZG1jX3ZlcjFfMDQuYmluDQo+Pj4+IFsg
ICAgMi45NTUzODRdIGk5MTUgMDAwMDowMDowMi4wOiBbZHJtXSBGaW5pc2hlZCBsb2FkaW5n
IERNQyBmaXJtd2FyZQ0KPj4+PiBpOTE1L2tibF9kbWNfdmVyMV8wNC5iaW4gKHYxLjQpDQo+
Pj4+IC4uLg0KPj4+PiBbICAgIDQuMTQ1MDEzXSBbZHJtXSBJbml0aWFsaXplZCBpOTE1IDEu
Ni4wIDIwMjAxMTAzIGZvciAwMDAwOjAwOjAyLjAgb24NCj4+Pj4gbWlub3IgMA0KPj4+PiBb
ICAgIDQuMTQ3MTAxXSBBQ1BJOiB2aWRlbzogVmlkZW8gRGV2aWNlIFtHRlgwXSAobXVsdGkt
aGVhZDogeWVzICByb206DQo+Pj4+IG5vICBwb3N0OiBubykNCj4+Pj4gWyAgICA0LjE0NzI0
NF0gaW5wdXQ6IFZpZGVvIEJ1cyBhcw0KPj4+PiAvZGV2aWNlcy9MTlhTWVNUTTowMC9MTlhT
WUJVUzowMC9QTlAwQTA4OjAwL0xOWFZJREVPOjAwL2lucHV0L2lucHV0NA0KPj4+PiBbICAg
IDQuMTQ3NDEwXSBbZHJtXSBJbml0aWFsaXplZCB2Z2VtIDEuMC4wIDIwMTIwMTEyIGZvciB2
Z2VtIG9uIG1pbm9yIDENCj4+Pj4gWyAgICA0LjE0NzQyMF0gdXNiY29yZTogcmVnaXN0ZXJl
ZCBuZXcgaW50ZXJmYWNlIGRyaXZlciB1ZGwNCj4+Pj4gWyAgICA0LjE0NzUwMF0gW2RybV0g
SW5pdGlhbGl6ZWQgc2ltcGxlZHJtIDEuMC4wIDIwMjAwNjI1IGZvcg0KPj4+PiBzaW1wbGUt
ZnJhbWVidWZmZXIuMCBvbiBtaW5vciAyDQo+Pj4+IFsgICAgNC4xNDg2NDNdIENvbnNvbGU6
IHN3aXRjaGluZyB0byBjb2xvdXIgZnJhbWUgYnVmZmVyIGRldmljZSA4MHgzMA0KPj4+PiBb
ICAgIDQuMTUzMjE2XSBzaW1wbGUtZnJhbWVidWZmZXIgc2ltcGxlLWZyYW1lYnVmZmVyLjA6
IFtkcm1dIGZiMDoNCj4+Pj4gc2ltcGxlZHJtZHJtZmIgZnJhbWUgYnVmZmVyIGRldmljZQ0K
Pj4+PiBbICAgIDQuMTU0MDQzXSBsb29wOiBtb2R1bGUgbG9hZGVkDQo+Pj4+IFsgICAgNC4x
NTYwMTddIGFoY2kgMDAwMDowMDoxNy4wOiB2ZXJzaW9uIDMuMA0KPj4+PiBbICAgIDQuMTU3
MzczXSBpOTE1IDAwMDA6MDA6MDIuMDogW2RybV0gZmIxOiBpOTE1ZHJtZmIgZnJhbWUgYnVm
ZmVyIGRldmljZQ0KPj4+PiAuLi4NCj4+Pj4NCj4+Pj4gSg0KPj4+Pg0KPj4NCj4+IC0tDQo+
PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPj4g
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQo+PiBGcmFua2Vuc3RyYXNz
ZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KPj4gR0Y6IEl2byBUb3RldiwgQW5k
cmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KPj4gSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJ
dm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJt
YW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------tNfqaovWDfapAnyAScP0ClSA--

--------------on70awI3W3GFZmiyuu4POzq1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWw2/wFAwAAAAAACgkQlh/E3EQov+Du
shAAkkLFxkMq1iBGkUPvfZ+E8KjHKEjqVFnKbxTJ/vCLbhWAzwZJ6P9raNHuR2HiHbHa/NGoDMjE
u9LOigeNe8G+kExEYOALDo2t/9jQhu/ZMKkAxVTPxUXs22LV3SaQsF6i9ywkjEVbMD8ykPJlOUu8
e+7nqrrtPCmx4+gknb5i+AF/yoQX8MpV9JZyzgBj9LKhNwiHbwkVJdbswX9j8R1XOLPSXbzzmWVS
+OY32IuXwn5yvONlF22CBxfbTCdanBQtkZkBK+rS6qqjxzCRjVf4eDH2UT716kLI40no0BhQ1WoB
9HaIC2ZBQCj2WriOEb9a4b0AG7gfkc3IczDGQATfbWnZtIdvlR6SnGzpSUgBtQgY0HKSPzTPtSUq
m8MNDP+u/ozJDk83gkTsv5JW86ky90SNHXoWHBfyiNOtXASX1VroT4+0koswS+huRnEEc9YFwmHx
BaIYgW0HfpmlgiaZMcj3QxSmTCCtw+PyYoyUlAKFMgZ8pk7gYHnxd9YHfUBySmLMAGZs+u35lYyM
CbZyZM8IDmb9wNUWPAecPYC+NTYxD4S1b8ITswK4f+ggZIh5AtUoX0LRH9X1DM6Z7rhiqUKm3oKE
M6HwpEnfmt3QO0gAcD1GaastLt2xaHpF9bteBKX6A0PV/e5PRYsf6klvgTIyo+HFOdwnxX/U7fZE
CAM=
=To3D
-----END PGP SIGNATURE-----

--------------on70awI3W3GFZmiyuu4POzq1--
