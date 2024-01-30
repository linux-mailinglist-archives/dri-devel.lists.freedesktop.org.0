Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DF68422C3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 12:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B127112F82;
	Tue, 30 Jan 2024 11:20:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BE28112F82
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jan 2024 11:20:29 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BA2BC1F847;
 Tue, 30 Jan 2024 11:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706613627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8s/E2Lrk1AemSZbZRvbhouXlYxP/h7o6XFyt9p2fPVI=;
 b=By8LlWSo/k5Si8KBOJ7SCHhFbIKZ6IRFkPlLx4pnypfH4ISKoD5KIQfhSywpl8ugOzf/qO
 SqJfFizbqNwAPhWXhCGx1ttRcKuAOFJN+D5iREyzMHrM1ju49VVe5C0ip0aHnhvXXl/bqB
 sWyKt4SwUmGvXF1M4I7jQ0308ah3Q/s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706613627;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8s/E2Lrk1AemSZbZRvbhouXlYxP/h7o6XFyt9p2fPVI=;
 b=rTK6/vuxLuHI8PnI/ifD7axdkum8JHMB5+80JrDgwnaP+l9IXfEH/0TcURg+Kl4mbriyB0
 R92FHprNf4I3QGAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706613625; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8s/E2Lrk1AemSZbZRvbhouXlYxP/h7o6XFyt9p2fPVI=;
 b=QNHWXydWxIUHBI7Kl7uPaUpKSeiwM6B8FVQDW8hC0jSlYpLMd9w5aMBg5znsVB7+f7c9P0
 55S28oUDEw2hNgCbGjF9Eazx6HsVqmuyC9xsEDwo8m7Q13N+cWWRQZqof1sr6yCiNHurTm
 R19WEVEGzmX17kOaKYePoox9TP2PkFo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706613625;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=8s/E2Lrk1AemSZbZRvbhouXlYxP/h7o6XFyt9p2fPVI=;
 b=5n3/QBiDKJR+fSuqNBQQVXzko418mBBHTggiY1d2KfIgdETmMpE0aJ0ooIqL3g5T9zzMAn
 Asuj7HtwZsrihaCQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 7DBBA13212;
 Tue, 30 Jan 2024 11:20:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id IuCDHXnbuGV1DAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 30 Jan 2024 11:20:25 +0000
Message-ID: <5e1dcdeb-b30e-48b0-8a94-060fb066923e@suse.de>
Date: Tue, 30 Jan 2024 12:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-2-jfalempe@redhat.com>
 <d15c8fd1-a0f5-4dc9-8e8c-30a9200ef7fb@suse.de>
 <b3ac22f6-9553-491f-94c3-2d93474b87c0@redhat.com>
 <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>
 <a4fea690-b77c-4901-85bc-ae169a7805d6@suse.de>
 <fe5cb817-bb0e-4549-aa9a-d22ffeb512f4@redhat.com>
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
In-Reply-To: <fe5cb817-bb0e-4549-aa9a-d22ffeb512f4@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------MOx56pV5bwFqueK74CvoCl8P"
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QNHWXydW;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b="5n3/QBiD"
X-Spamd-Result: default: False [-6.28 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:98:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[10]; MX_GOOD(-0.01)[];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,ffwll.ch,verizon.net,tronnes.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-1.98)[94.91%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[verizon.net];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_IN_DNSWL_HI(-1.00)[2a07:de40:b281:104:10:150:64:98:from,2a07:de40:b281:106:10:150:64:167:received];
 RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:98:from]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: BA2BC1F847
X-Spam-Level: 
X-Spam-Score: -6.28
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
Cc: gpiccoli@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------MOx56pV5bwFqueK74CvoCl8P
Content-Type: multipart/mixed; boundary="------------kpv8dLCH9hDYmrk2fXaftTmX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Cc: gpiccoli@igalia.com
Message-ID: <5e1dcdeb-b30e-48b0-8a94-060fb066923e@suse.de>
Subject: Re: [PATCH v7 1/9] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-2-jfalempe@redhat.com>
 <d15c8fd1-a0f5-4dc9-8e8c-30a9200ef7fb@suse.de>
 <b3ac22f6-9553-491f-94c3-2d93474b87c0@redhat.com>
 <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>
 <a4fea690-b77c-4901-85bc-ae169a7805d6@suse.de>
 <fe5cb817-bb0e-4549-aa9a-d22ffeb512f4@redhat.com>
In-Reply-To: <fe5cb817-bb0e-4549-aa9a-d22ffeb512f4@redhat.com>

--------------kpv8dLCH9hDYmrk2fXaftTmX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDEuMjQgdW0gMTU6NTYgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IA0KPiANCj4gT24gMjMvMDEvMjAyNCAxMzo1NiwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6
DQo+PiBIaSwNCj4+DQo+PiBGWUkgZm9yIHBvaW50cyAxIGFuZCAyLCBJJ20gdHlwaW5nIHVw
IGEgcGF0Y2hzZXQgdGhhdCBpbnRyb2R1Y2VzIA0KPj4gZHJtX3BpeG1hcCBmb3IgdGhlIHNv
dXJjZSBidWZmZXIuIEknbGwgcG9zdCBpdCB3aGVuIEkgaGF2ZSBzb21ldGhpbmcgDQo+PiBy
ZWFkeS4NCj4gDQo+IFRoYW5rcywgSSBkaWRuJ3QgaGF2ZSB0aW1lIHRvIGxvb2sgaW50byB0
aGlzIHlldC4NCg0KWW91IGNhbiBmaW5kIG15IFJGQyBzZXJpZXMgYXQgWzFdLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Au
b3JnL3Nlcmllcy8xMjkzMDEvDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2
MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5k
cmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0K

--------------kpv8dLCH9hDYmrk2fXaftTmX--

--------------MOx56pV5bwFqueK74CvoCl8P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmW423kFAwAAAAAACgkQlh/E3EQov+Ce
xBAAug7T6oJuOg00yxTo5T3DiBKeFkWzjAzXItgq8esQp5Zwvb/H+uGS2INC0VNOo7lPfxIEOjXp
pED1Tv2UkXvsNt/sWJ7njQ7wqxCiRbAgdO6TWAfv5mAmNO67ackNBczQCDwcJwClSj2HGi9PAfGX
f2CUx7j/kwo6WZZoFUo44+nEk/lnHkyVuRGXXG24YoCZaCBX8W9UpAj8ttxNMABTYJAsxdsqwA//
+1Bl4jd51NnTVYXz+c0TOYGCAGWxACymddcoLhMJlM9iFhHIvykGT+x68e9+mH4bV0F4LI55t9MA
Scc3qXmGHlpRtPkkQUQEds+HhNC+q3gjAwGff74n9LLzzOAaYVYXjLa5kOhYUR+u6hRSpS0Umo03
0FXXGIhK8xSVwwuP8tKZ9649XSXXGxJmAKevsKZ5p/HnZygDmcSVaKtlVBIK8cuVVaTjp2fd/ZVY
H8Q95VO5wY7rOrFKuQiGkMj9XuMqEX08ig3L16pcovZiHXuEykO1qYY1cJpGuXB2o5riELb0fhdP
Uhap/mS7d0ircsTF5sobcSVpMYjxXX1WAKvvVcfNMtB+qRJqQ7XVdfA1PhuISTs0N2k64gtwcwto
jR7vbQ+D0hfuPkH4JZ1JCNex0lWY/j8v2QXOk0dvZs2wlsS6JLB+idQjRGZXckn4zIowSJ4Kezw5
mAI=
=Q2v1
-----END PGP SIGNATURE-----

--------------MOx56pV5bwFqueK74CvoCl8P--
