Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E8D826A21
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D64210E1EB;
	Mon,  8 Jan 2024 09:06:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C18D010E1CA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:06:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 01DC91F796;
 Mon,  8 Jan 2024 09:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704704768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VlAe8PnOTCr9GN9obesJ/QqRwGR2ZZOLv0r08zlKmb4=;
 b=bfQ5M08uh+YSjg3N04RWF0nrVSE2x/ddNsH1lsP5TCa1bnDSkI9l1AiU3V78rNnJIRVy3q
 dhYEJwtm2LsjjHo7FzplN1MTnNyHRVDTcWpBAc15aUroxkGkvXzC7A0LoY9K1aFrNo2/eN
 FIGDrzM6ukD1s/WrGSH+6TsW+ON5NeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704704768;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VlAe8PnOTCr9GN9obesJ/QqRwGR2ZZOLv0r08zlKmb4=;
 b=GTOS3R0vgRkO44Q7OJZ302lO2pnk57YhzCi/zgxyn58DdtpKqNIDWCRDsr01JmSlGXv62m
 XYMSphVswlRzVWCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704704768; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VlAe8PnOTCr9GN9obesJ/QqRwGR2ZZOLv0r08zlKmb4=;
 b=bfQ5M08uh+YSjg3N04RWF0nrVSE2x/ddNsH1lsP5TCa1bnDSkI9l1AiU3V78rNnJIRVy3q
 dhYEJwtm2LsjjHo7FzplN1MTnNyHRVDTcWpBAc15aUroxkGkvXzC7A0LoY9K1aFrNo2/eN
 FIGDrzM6ukD1s/WrGSH+6TsW+ON5NeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704704768;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=VlAe8PnOTCr9GN9obesJ/QqRwGR2ZZOLv0r08zlKmb4=;
 b=GTOS3R0vgRkO44Q7OJZ302lO2pnk57YhzCi/zgxyn58DdtpKqNIDWCRDsr01JmSlGXv62m
 XYMSphVswlRzVWCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D6F7313496;
 Mon,  8 Jan 2024 09:06:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 6vZpM/+6m2VYCgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Jan 2024 09:06:07 +0000
Message-ID: <fa6bbc93-9d88-436b-9264-6b9b803dc13d@suse.de>
Date: Mon, 8 Jan 2024 10:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Fix caching setup for remapped video memory
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com, daniel@ffwll.ch
References: <20240105082714.21881-1-tzimmermann@suse.de>
 <d169ab1a-d0ee-46f4-8bd8-2f42040a2572@redhat.com>
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
In-Reply-To: <d169ab1a-d0ee-46f4-8bd8-2f42040a2572@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------AxSDHNwz2txh9WXGLBVP9p9X"
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 01DC91F796
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=bfQ5M08u;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=GTOS3R0v
X-Spam-Score: -8.07
X-Spam-Level: 
X-Spam-Flag: NO
X-Spamd-Result: default: False [-8.07 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MIME_BASE64_TEXT(0.10)[]; MX_GOOD(-0.01)[];
 SIGNED_PGP(-2.00)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-1.07)[87.87%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 RCVD_DKIM_ARC_DNSWL_HI(-1.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[4]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 RCVD_IN_DNSWL_HI(-0.50)[2a07:de40:b281:104:10:150:64:97:from];
 RCVD_TLS_ALL(0.00)[]
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------AxSDHNwz2txh9WXGLBVP9p9X
Content-Type: multipart/mixed; boundary="------------SKwrE3jhv6XwQovEstbJgt4e";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <fa6bbc93-9d88-436b-9264-6b9b803dc13d@suse.de>
Subject: Re: [PATCH] drm/mgag200: Fix caching setup for remapped video memory
References: <20240105082714.21881-1-tzimmermann@suse.de>
 <d169ab1a-d0ee-46f4-8bd8-2f42040a2572@redhat.com>
In-Reply-To: <d169ab1a-d0ee-46f4-8bd8-2f42040a2572@redhat.com>

--------------SKwrE3jhv6XwQovEstbJgt4e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDEuMjQgdW0gMTE6NDEgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IEhpLA0KPiANCj4gT24gMDUvMDEvMjAyNCAwOToyNSwgVGhvbWFzIFppbW1lcm1hbm4gd3Jv
dGU6DQo+PiBJL08gdmlkZW8gbWVtb3J5IGZvciB0aGUgZnJhbWVidWZmZXIgc3VwcG9ydHMg
d3JpdGUtY29tYmluZSBjYWNoaW5nDQo+PiBtb2RlLiBTaW1wbGlmeSB0aGUgZHJpdmVyJ3Mg
Y29kZSB0aGF0IHNldHMgdXAgdGhlIGNhY2hpbmcgbW9kZS4NCj4+DQo+PiDCoCAqIE1hcCB2
aWRlbyBtZW1vcnkgd2l0aCBpb3JlbWFwX3djKCksIHdoaWNoIGF1dG9tYXRpY2FsbHkgc2V0
cyB1cA0KPj4gdGhlIFBBVCBlbnRyeSB3aXRoIHdyaXRlLWNvbWJpbmUgY2FjaGluZy4NCj4+
DQo+PiDCoCAqIFJlbW92ZSB0aGUgbm93IG9ic29sZXRlIGNhbGwgdG8gZGV2bV9hcmNoX2lv
X3Jlc2VydmVfbWVtdHlwZV93YygpLg0KPj4gSXQgaXMgb25seSByZXF1aXJlZCB0byBtbWFw
IHRoZSB2aWRlbyBtZW1vcnkgdG8gdXNlciBzcGFjZSwgd2hpY2ggdGhlDQo+PiBkcml2ZXIg
ZG9lc24ndCBkby4NCj4+DQo+PiDCoCAqIEFjY29yZGluZyB0byB0aGUgUEFUIGRvY3VtZW50
YXRpb24sIGFyY2hfcGh5c193Y19hZGQoKSBpcyBiZXN0DQo+PiBjYWxsZWQgYWZ0ZXIgcmVt
YXBwaW5nIEkvTyBtZW1vcnksIHNvIG1vdmUgaXQgYWZ0ZXIgaW9yZW1hcC4NCj4+DQo+IA0K
PiBUaGFua3MgYSBsb3QgZm9yIHRha2luZyBzb21lIHRpbWUgdG8gbG9vayBhdCB0aGUgbGF0
ZW5jeSBpc3N1ZS4NCj4gVGhpcyBsb29rcyBnb29kIHRvIG1lLg0KPiANCj4gUmV2aWV3ZWQt
Ynk6IEpvY2VseW4gRmFsZW1wZSA8amZhbGVtcGVAcmVkaGF0LmNvbT4NCj4gDQoNClRoYW5r
cyBhIGxvdCBmb3IgdGhlIHJldmlldy4gSSdsbCBzZW5kIG91dCBhIHNpbWlsYXIgcGF0Y2gg
Zm9yIGFzdCwgDQp3aGljaCBoYXMgdGhlIHNhbWUgaXNzdWVzLg0KDQpCZXN0IHJlZ2FyZHMN
ClRob21hcw0KDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------SKwrE3jhv6XwQovEstbJgt4e--

--------------AxSDHNwz2txh9WXGLBVP9p9X
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWbuv8FAwAAAAAACgkQlh/E3EQov+Cv
ABAAomjSiBllHMymu8NigHrrG29VePRvZrr7jJZXoJyXY3238HfJVsyHSjxquEZAAxf1jxgOksf8
HSfc37hAlkB/Oic7zeqkzFpuC5wcHRxfNcSSCNTOKx5A2O5hpSJ7IM6C6Kdk/0J2E9p4d17obhft
Y/QWq9r4qrbajgIvBbh4Hm3poWlSPpff7WonWvK7WMIC2jC0B21udSkaAiixY05bdhSgDLw08N2N
DE3CgMKAloLU//D3AFDTLmgYLPYtWluy+JWLwQhat88H/hPyAkmfEFbiTG11DNFvi11jt/nqtlKA
1srHLwQe/VfnK3W8FtWMBXbex2j9yYhzFR49OhJwSlHboJKohhQYCg0bxX/WBxPGSxBIRt4lk0Xx
tU32DYU0UhmeAKtVpXs/fmkkBVoh3aGqK90qG9zEIpWUBQX+pWFCDBwJZ4V7Q2t+HEs3UuOGKV9R
ZSa4Q32CZmA7chHnInPOR7Ist/0MfFPteNSm1yOUPo7suJg1tBtvlgRBtQevix76UTwX7OOKgFVU
13X6dd80Pe9Z1t8G4gPlAy0Nk1eWNuZCZQ9phCX2ivy7GMBwwCURSTj0LWL2TDqCsiDoxetvEUio
BfeYr/Y+irge9mOQQrQoSoZGgAbo8pwLPLuoQAIaE1imC0DitGvbEfEs07OXf04nSvpGHK1n3ygx
yKA=
=mlVN
-----END PGP SIGNATURE-----

--------------AxSDHNwz2txh9WXGLBVP9p9X--
