Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281D832A8C
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 14:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8175F10E9BA;
	Fri, 19 Jan 2024 13:32:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1CC10E9BA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 13:32:06 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4CA871F7F1;
 Fri, 19 Jan 2024 13:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705671095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3aqZ9oGgHD/+gkfCbprtgN+iWApgZWQwHSOxqNsoQUc=;
 b=sy8FrNqR20gczcOYLBoaTGxkS0k9Um0Tc+veuKYtf3jTOISBQtSnuinOu7X7wWhdi+pTNE
 q/GMKNSRNGrvB0kUO0dtHP6twF06ioArpCWhuCwz3k4k2nm21aqzZ23NBUBiTdX92hLra0
 ho3fUi6PiEZArhOEHHnlHGpBZT0FB/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705671095;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3aqZ9oGgHD/+gkfCbprtgN+iWApgZWQwHSOxqNsoQUc=;
 b=o7ITNpa81u+b70LQbJErtSNZk7o0Wo+r2iDK7LtFrhP9iXpw3vf8g2u3wZdsne5KP9RAiH
 eZgkutyn6XMVugAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705671095; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3aqZ9oGgHD/+gkfCbprtgN+iWApgZWQwHSOxqNsoQUc=;
 b=sy8FrNqR20gczcOYLBoaTGxkS0k9Um0Tc+veuKYtf3jTOISBQtSnuinOu7X7wWhdi+pTNE
 q/GMKNSRNGrvB0kUO0dtHP6twF06ioArpCWhuCwz3k4k2nm21aqzZ23NBUBiTdX92hLra0
 ho3fUi6PiEZArhOEHHnlHGpBZT0FB/A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705671095;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=3aqZ9oGgHD/+gkfCbprtgN+iWApgZWQwHSOxqNsoQUc=;
 b=o7ITNpa81u+b70LQbJErtSNZk7o0Wo+r2iDK7LtFrhP9iXpw3vf8g2u3wZdsne5KP9RAiH
 eZgkutyn6XMVugAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0D8A81388C;
 Fri, 19 Jan 2024 13:31:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id usQtArd5qmVAHwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 19 Jan 2024 13:31:35 +0000
Message-ID: <026a00b2-6677-4bfb-8ee8-1678080b43a6@suse.de>
Date: Fri, 19 Jan 2024 14:31:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
Content-Language: en-US
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-2-jfalempe@redhat.com>
 <d15c8fd1-a0f5-4dc9-8e8c-30a9200ef7fb@suse.de>
 <b3ac22f6-9553-491f-94c3-2d93474b87c0@redhat.com>
 <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>
 <20240119142536.5023860b@eldfell>
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
In-Reply-To: <20240119142536.5023860b@eldfell>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ttanRIeuNztfBtWPz6e0Q0hA"
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=sy8FrNqR;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=o7ITNpa8
X-Spamd-Result: default: False [-4.30 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[10]; MX_GOOD(-0.01)[];
 SIGNED_PGP(-2.00)[]; FREEMAIL_TO(0.00)[gmail.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com,verizon.net];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 FREEMAIL_CC(0.00)[redhat.com,verizon.net,kernel.org,igalia.com,tronnes.org,lists.freedesktop.org,ffwll.ch];
 RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 4CA871F7F1
X-Spam-Level: 
X-Spam-Score: -4.30
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
 javierm@redhat.com, mripard@kernel.org, gpiccoli@igalia.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ttanRIeuNztfBtWPz6e0Q0hA
Content-Type: multipart/mixed; boundary="------------4h8sKCsKCdjjA4n0KrXwOpbd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, mripard@kernel.org, gpiccoli@igalia.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@redhat.com
Message-ID: <026a00b2-6677-4bfb-8ee8-1678080b43a6@suse.de>
Subject: Re: [PATCH v7 1/9] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-2-jfalempe@redhat.com>
 <d15c8fd1-a0f5-4dc9-8e8c-30a9200ef7fb@suse.de>
 <b3ac22f6-9553-491f-94c3-2d93474b87c0@redhat.com>
 <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>
 <20240119142536.5023860b@eldfell>
In-Reply-To: <20240119142536.5023860b@eldfell>

--------------4h8sKCsKCdjjA4n0KrXwOpbd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDEuMjQgdW0gMTM6MjUgc2NocmllYiBQZWtrYSBQYWFsYW5lbjoNCj4g
T24gRnJpLCAxOSBKYW4gMjAyNCAxMTo1ODozOCArMDEwMA0KPiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPj4gSGkNCj4+DQo+PiBBbSAx
Ny4wMS4yNCB1bSAxNzo0MCBzY2hyaWViIEpvY2VseW4gRmFsZW1wZToNCj4gDQo+IC4uLg0K
PiANCj4+PiBUaGUgbGFzdCB0aGluZywgaXMgaWYgSSBwbGFuIHRvIGFkZCBZVVYgc3VwcG9y
dCwgd2l0aCB0aGlzDQo+Pj4gaW1wbGVtZW50YXRpb24sIEkgb25seSBuZWVkIHRvIHdyaXRl
IG9uZSBmdW5jdGlvbiB0aGF0IGNvbnZlcnQgb25lDQo+Pj4gcGl4ZWwuIE90aGVyd2lzZSBJ
IHdvdWxkIG5lZWQgdG8gYWRkIHRoZSBkcm1fZmJfcjFfdG9feXV2eHh4X2xpbmUoKSBhbmQN
Cj4+PiBkcm1fZmJfcjFfdG9feXV2eHh4eCgpIGJvaWxlcnBsYXRlLg0KPj4NCj4+IDgpIFlV
VnMgYXJlIG11bHRpLXBsYW5lIGZvcm1hdHMgSUlSQy4gU28gaXQncyBsaWtlbHkgYSBiaXQg
bW9yZQ0KPj4gY29tcGxpY2F0ZWQuQW5kIEknbSBub3QgYXdhcmUgb2YgYW55IGN1cnJlbnQg
dXNlIGNhc2UgZm9yIFlVVi4gSWYgdGhlDQo+PiBmcmFtZWJ1ZmZlciBjb25zb2xlIGRvZXNu
J3Qgc3VwcG9ydCBpdCwgdGhlIHBhbmljIGhlbHBlciBwcm9iYWJseSB3b24ndA0KPj4gZWl0
aGVyLg0KPiANCj4gS2VybmVsIHBhbmljIGR1cmluZyBhIGZ1bGxzY3JlZW4gdmlkZW8gcGxh
eWJhY2ssIG1heWJlPw0KPiANCj4gVGhhdCB1c2UgY2FzZSBpcyBsaWtlbHkgdG8gaGF2ZSBh
biBZVVYgRkIgYXMgdGhlIG9ubHkgdmlzaWJsZSBLTVMgcGxhbmUNCj4gRkIsIGVpdGhlciBw
cmltYXJ5IG9yIG92ZXJsYXkgcGxhbmUgZGVwZW5kaW5nIG9uIHdoaWNoIGlzIGNhcGFibGUg
b2YNCj4gZGlzcGxheWluZyBpdC4gU3ViLXRpdGxlcyBtaWdodCBub3QgZXhpc3QsIG9yIG1p
Z2h0IGJlIGluIGEgZmFpcmx5DQo+IHNtYWxsIFJHQiBvdmVybGF5Lg0KPiANCj4gSSBkb24n
dCBrbm93IGlmIHN1Y2ggY2FzZSBpcyBpbXBvcnRhbnQgZW5vdWdoIHRvIGhhbmRsZS4NCg0K
VGhhdCdzIGF0IGxlYXN0IGEgcG9zc2libGUgdXNlIGNhc2UgQUZBSUNULg0KDQpFYWNoIGNv
bnZlcnNpb24gaXMgaW1wbGVtZW50ZWQgaW4gYSBoZWxwZXIgZHJtX2ZiXzxzcmMgZm9ybWF0
Pl90b188ZHN0IA0KZm9ybWF0PigpLiBkcm1fZmJfYmxpdCgpIGlzIGp1c3QgYSBiaWcgc3dp
dGNoIHN0YXRlbWVudCB0byBjYWxsIHRoZSANCmNvcnJlY3QgaGVscGVyLiBTb21ldGhpbmcg
bGlrZSBkcm1fcjFfdG9feXV2NDIyKCkgd291bGQgYmUgbm8gZGlmZmVyZW50IA0KYW5kIHdv
dWxkIGludGVncmF0ZSB3aXRoIHRoZSBleGlzdGluZyBkcm1fZmJfYmxpdCgpIG5pY2VseS4N
Cg0KU28gaXQgYXBwZWFycyB0byBtZSBhcyBpZiBpdCdzIGJldHRlciB0byBlaXRoZXIgZXh0
ZW5kIHRoZSBjdXJyZW50IGNvZGUgDQpmb3IgbXVsdGktcGxhbmUgZm9ybWF0cywgb3Igd3Jp
dGUgY3VzdG9tIGhlbHBlcnMgDQpkcm1fZmJfcjFfdG9feXV2PHdoYXRldmVyPigpLg0KDQpC
ZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4gVGhhbmtzLA0KPiBwcQ0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0
NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFu
ZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVy
ZykNCg==

--------------4h8sKCsKCdjjA4n0KrXwOpbd--

--------------ttanRIeuNztfBtWPz6e0Q0hA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWqebYFAwAAAAAACgkQlh/E3EQov+BK
Ig/+Mnxp5RUkIHfHrdB0iXzlU7wnmsSGGc5y1hDUK82XGrUuvIWdC7K0Y69DNe+bGJ/BNmrPL8kh
8ef+oXRv9o0ERvI0ENKxZRnIw0AOW0bLmEznhW3FL8oSWD3GiVoIx2MxqqJKhPb6KfP9jEcH1vwi
/eCOmef9VH+4mwQRUbtdJeMHxioG13ZvRPYK4O97fvfLhHDWUDMfRfNystlcp6maPhSj+kRAk8oE
ElUphg6eGuI+r1ICEM5jy2CRim3v7xnwWC5Ap7d0//HSbW6PXeXfyXzNmqAQhkD/nZ7jAqQ/zP4q
rPy2+24yhYB6MAqAEnWAreTw+hGlAqD2riFqgkwfXbbpdsuZ6Scur7YmYcUpFRflh8pgv94b2TMH
o3AOgFm4ihzHX6iSVGkRSYf6s3OrisOa+qhJy1hBYMeDB6OHsQGDmIZQHQ9SVP2A+MhhQb7xvUtB
xftSaLGMKCuWplijXm+36P94JWsbgwPX1w677vYk53CfHdiOIKmJzcDoZRdln06GgtjH2/r0W4wL
xgLRSAWd7veNu6PmGIuYoQPa6P0nSEjG6WGqcFC6u8i0ViDk2lIe6Y1Lm0C42YsGHZj91oV6FIZx
eWjPNM59QAWgPca9oqN2gwE1uZ4kEZOemYlD1R3R0zLF3Scp3IZLWhObZl2PWr589TnDMei7meNV
Xwc=
=vZSs
-----END PGP SIGNATURE-----

--------------ttanRIeuNztfBtWPz6e0Q0hA--
