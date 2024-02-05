Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F27684954E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 09:25:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8272C10E2A7;
	Mon,  5 Feb 2024 08:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="xjuZyBCK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+BeDhVbj";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="xjuZyBCK";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="+BeDhVbj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B50E810E2A7
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 08:25:39 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2BE1F21FD0;
 Mon,  5 Feb 2024 08:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707121538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rfLTXnvX6up7r32fy7+qgDjgO7Q8A1KRvn0K43/7m+c=;
 b=xjuZyBCKjG7Tx+HjlRfz5ZlyEMJh9uZ5sfzsDTiQGfOWgHe0aIaK3Wa+9x6hh3A5P24eHc
 089O+flLoLqhPmyrFcb16dlojox4QCYkNP2pA6yleT5eTt5CuXyuMdZOxv2ydHPV8lqgg8
 xiC2Wr65FCLzzCqnF5pM/lBhGR+gCcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707121538;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rfLTXnvX6up7r32fy7+qgDjgO7Q8A1KRvn0K43/7m+c=;
 b=+BeDhVbjvmHnl0a9SIrvqiS00Y84KPOfg7ElTHJDFaX/UoxUOQIAZcw6n/9tqfznlRC0CS
 e8n2DufPmWT/a0Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707121538; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rfLTXnvX6up7r32fy7+qgDjgO7Q8A1KRvn0K43/7m+c=;
 b=xjuZyBCKjG7Tx+HjlRfz5ZlyEMJh9uZ5sfzsDTiQGfOWgHe0aIaK3Wa+9x6hh3A5P24eHc
 089O+flLoLqhPmyrFcb16dlojox4QCYkNP2pA6yleT5eTt5CuXyuMdZOxv2ydHPV8lqgg8
 xiC2Wr65FCLzzCqnF5pM/lBhGR+gCcw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707121538;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=rfLTXnvX6up7r32fy7+qgDjgO7Q8A1KRvn0K43/7m+c=;
 b=+BeDhVbjvmHnl0a9SIrvqiS00Y84KPOfg7ElTHJDFaX/UoxUOQIAZcw6n/9tqfznlRC0CS
 e8n2DufPmWT/a0Bg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7B1A132DD;
 Mon,  5 Feb 2024 08:25:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uLuBMoGbwGXxDAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Feb 2024 08:25:37 +0000
Message-ID: <795d9908-a378-4065-8cfe-d20be7b01798@suse.de>
Date: Mon, 5 Feb 2024 09:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2, 5/8] firmware/sysfb: Create firmware device only for enabled
 PCI devices
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-6-tzimmermann@suse.de>
 <2bbaab9a-3b4c-4c70-b1b2-09bc265d0476@linux.dev>
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
In-Reply-To: <2bbaab9a-3b4c-4c70-b1b2-09bc265d0476@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YNqo15NOMAFqSnT2klaH7bkc"
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=xjuZyBCK;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=+BeDhVbj
X-Spamd-Result: default: False [-8.80 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[7];
 MX_GOOD(-0.01)[]; SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[linux.dev,redhat.com,gmx.de,kernel.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 DWL_DNSWL_HI(-3.50)[suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:email];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 2BE1F21FD0
X-Spam-Level: 
X-Spam-Score: -8.80
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YNqo15NOMAFqSnT2klaH7bkc
Content-Type: multipart/mixed; boundary="------------02DnMXdtRXGdcoElU4q7Ladd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <795d9908-a378-4065-8cfe-d20be7b01798@suse.de>
Subject: Re: [v2, 5/8] firmware/sysfb: Create firmware device only for enabled
 PCI devices
References: <20240202120140.3517-6-tzimmermann@suse.de>
 <2bbaab9a-3b4c-4c70-b1b2-09bc265d0476@linux.dev>
In-Reply-To: <2bbaab9a-3b4c-4c70-b1b2-09bc265d0476@linux.dev>

--------------02DnMXdtRXGdcoElU4q7Ladd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDAyLjAyLjI0IHVtIDE4OjUwIHNjaHJpZWIgU3VpIEppbmdmZW5nOg0KPiBISSwN
Cj4gDQo+IA0KPiBPbiAyMDI0LzIvMiAxOTo1OCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6
DQo+PiBUZXN0IGlmIHRoZSBmaXJtd2FyZSBmcmFtZWJ1ZmZlcidzIHBhcmVudCBQQ0kgZGV2
aWNlLCBpZiBhbnksIGhhcw0KPj4gYmVlbiBlbmFibGVkLiBJZiBub3QsIHRoZSBmaXJtd2Fy
ZSBmcmFtZWJ1ZmZlciBpcyBtb3N0IGxpa2VseSBub3QNCj4+IHdvcmtpbmcuIEhlbmNlLCBk
byBub3QgY3JlYXRlIGEgZGV2aWNlIGZvciB0aGUgZmlybXdhcmUgZnJhbWVidWZmZXINCj4+
IG9uIGRpc2FibGVkIFBDSSBkZXZpY2VzLg0KPj4NCj4+IFNvIGZhciwgZWZpZmIgdHJhY2tl
ZCB0aGUgc3RhdHVzIG9mIHRoZSBQQ0kgcGFyZW50IGRldmljZSBpbnRlcm5hbGx5DQo+PiBh
bmQgZGlkIG5vdCBiaW5kIGlmIGl0IHdhcyBkaXNhYmxlZC4gVGhpcyBwYXRjaCBpbXBsZW1l
bnRzIHRoZQ0KPj4gZnVuY3Rpb25hbGl0eSBmb3IgYWxsIGZpcm13YXJlIGZyYW1lYnVmZmVy
cy4NCj4gDQo+IA0KPiBGb3IgKmFsbCogPw0KPiANCj4gSSB0aGluayB0aGUgZnVuY3Rpb25h
bGl0eSB0aGlzIHBhdGNoIGltcGxlbWVudGVkIGlzIG9ubHkgdGFyZ2V0IGZvciB0aGUNCj4g
UENJZSBkZXZpY2UgZmlybXdhcmUgZnJhbWVidWZmZXJzLCB0aGUgZnJhbWVidWZmZXIgY29u
c3VtZWQgYnkgdGhlIHNpbXBsZWZiDQo+IGRyaXZlciAoZmJkZXYvc2ltcGxlZmIuYykgaXMg
YWxzbyBhIGtpbmQgb2YgZmlybXdhcmUgZnJhbWVidWZmZXIsIGJ1dCBpdCBpcw0KPiB0YXJn
ZXQgZm9yIHRoZSBwbGF0Zm9ybSBkZXZpY2Ugb25seS4NCj4gDQo+IFNvLCB0aGUgY29ycmVj
dCBkZXNjcmlwdGlvbiB3b3VsZCBiZTogInRoaXMgcGF0Y2ggaW1wbGVtZW50cyB0aGUgDQo+
IGZ1bmN0aW9uYWxpdHkNCj4gZm9yIHRoZSBQQ0llIGZpcm13YXJlIGZyYW1lYnVmZmVycyIu
DQoNCkZhaXIgZW5vdWdoLg0KDQo+IA0KPj4gdjI6DQo+PiDCoMKgwqDCoCogcmV3b3JrIHN5
c2ZiX3BjaV9kZXZfaXNfZW5hYmxlZCgpIChKYXZpZXIpDQo+Pg0KPj4gU2lnbmVkLW9mZi1i
eTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBSZXZpZXdl
ZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+
PiAtLS0NCj4+IMKgIGRyaXZlcnMvZmlybXdhcmUvc3lzZmIuYyB8IDMwICsrKysrKysrKysr
KysrKysrKysrKysrKysrKysrLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9maXJt
d2FyZS9zeXNmYi5jIGIvZHJpdmVycy9maXJtd2FyZS9zeXNmYi5jDQo+PiBpbmRleCBkMDI5
NDViMGQ4ZWExLi5hYjVjYmMwMzI2ZjZkIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9maXJt
d2FyZS9zeXNmYi5jDQo+PiArKysgYi9kcml2ZXJzL2Zpcm13YXJlL3N5c2ZiLmMNCj4+IEBA
IC03MCwxMyArNzAsMzkgQEAgdm9pZCBzeXNmYl9kaXNhYmxlKHZvaWQpDQo+PiDCoCB9DQo+
PiDCoCBFWFBPUlRfU1lNQk9MX0dQTChzeXNmYl9kaXNhYmxlKTsNCj4+ICsjaWYgZGVmaW5l
ZChDT05GSUdfUENJKQ0KPj4gK3N0YXRpYyBfX2luaXQgYm9vbCBzeXNmYl9wY2lfZGV2X2lz
X2VuYWJsZWQoc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+PiArew0KPj4gK8KgwqDCoCAvKg0K
Pj4gK8KgwqDCoMKgICogVE9ETzogVHJ5IHRvIGludGVncmF0ZSB0aGlzIGNvZGUgaW50byB0
aGUgUENJIHN1YnN5c3RlbQ0KPj4gK8KgwqDCoMKgICovDQo+PiArwqDCoMKgIGludCByZXQ7
DQo+PiArwqDCoMKgIHUxNiBjb21tYW5kOw0KPj4gKw0KPj4gK8KgwqDCoCByZXQgPSBwY2lf
cmVhZF9jb25maWdfd29yZChwZGV2LCBQQ0lfQ09NTUFORCwgJmNvbW1hbmQpOw0KPj4gK8Kg
wqDCoCBpZiAocmV0ICE9IFBDSUJJT1NfU1VDQ0VTU0ZVTCkNCj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gZmFsc2U7DQo+PiArwqDCoMKgIGlmICghKGNvbW1hbmQgJiBQQ0lfQ09NTUFO
RF9NRU1PUlkpKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+ICvCoMKg
wqAgcmV0dXJuIHRydWU7DQo+PiArfQ0KPj4gKyNlbHNlDQo+PiArc3RhdGljIF9faW5pdCBi
b29sIHN5c2ZiX3BjaV9kZXZfaXNfZW5hYmxlZChzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+
ICt7DQo+PiArwqDCoMKgIHJldHVybiBmYWxzZTsNCj4+ICt9DQo+PiArI2VuZGlmDQo+PiAr
DQo+PiDCoCBzdGF0aWMgX19pbml0IHN0cnVjdCBkZXZpY2UgKnN5c2ZiX3BhcmVudF9kZXYo
Y29uc3Qgc3RydWN0IA0KPj4gc2NyZWVuX2luZm8gKnNpKQ0KPj4gwqAgew0KPj4gwqDCoMKg
wqDCoCBzdHJ1Y3QgcGNpX2RldiAqcGRldjsNCj4+IMKgwqDCoMKgwqAgcGRldiA9IHNjcmVl
bl9pbmZvX3BjaV9kZXYoc2kpOw0KPj4gLcKgwqDCoCBpZiAocGRldikNCj4+ICvCoMKgwqAg
aWYgKHBkZXYpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIXN5c2ZiX3BjaV9kZXZfaXNf
ZW5hYmxlZChwZGV2KSkNCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJf
UFRSKC1FTk9ERVYpOw0KPiANCj4gDQo+IElzIGl0IGJldHRlciB0byBtb3ZlIHRoZSBjYWxs
IG9mIHN5c2ZiX3BjaV9kZXZfaXNfZW5hYmxlZCgpIG91dCBvZiANCj4gc3lzZmJfcGFyZW50
X2RldigpID8NCj4gQmVjYXVzZSB0aGVuIHdlIGRvbid0IG5lZWQgY2hlY2sgdGhlIHJldHVy
bmVkIHZhbHVlIGJ5IGNhbGxpbmcgdGhlIA0KPiBJU19FUlIoKSBpbnRoZSBzeXNmYl9pbml0
KCkgZnVuY3Rpb24uDQo+IA0KPiANCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gJnBk
ZXYtPmRldjsNCj4+ICvCoMKgwqAgfQ0KPj4gwqDCoMKgwqDCoCByZXR1cm4gTlVMTDsNCj4+
IMKgIH0NCj4+IEBAIC05Nyw2ICsxMjMsOCBAQCBzdGF0aWMgX19pbml0IGludCBzeXNmYl9p
bml0KHZvaWQpDQo+PiDCoMKgwqDCoMKgIHN5c2ZiX2FwcGx5X2VmaV9xdWlya3MoKTsNCj4+
IMKgwqDCoMKgwqAgcGFyZW50ID0gc3lzZmJfcGFyZW50X2RldihzaSk7DQo+PiArwqDCoMKg
IGlmIChJU19FUlIocGFyZW50KSkNCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIHVubG9ja19t
dXRleDsNCj4gDQo+ICDCoMKgwqDCoGlmICghc3lzZmJfcGNpX2Rldl9pc19lbmFibGVkKHBh
cmVudCkpDQo+ICDCoMKgwqDCoMKgwqDCoCBnb3RvIHVubG9ja19tdXRleDsNCj4gDQo+PiDC
oMKgwqDCoMKgIC8qIHRyeSB0byBjcmVhdGUgYSBzaW1wbGUtZnJhbWVidWZmZXIgZGV2aWNl
ICovDQo+PiDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSBzeXNmYl9wYXJzZV9tb2RlKHNpLCAm
bW9kZSk7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0
cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFu
ZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgw
OSAoQUcgTnVlcm5iZXJnKQ0K

--------------02DnMXdtRXGdcoElU4q7Ladd--

--------------YNqo15NOMAFqSnT2klaH7bkc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmXAm4EFAwAAAAAACgkQlh/E3EQov+By
Fg//Y78hlLYa0KLFYOAMrJvaMcKz/eURspwua7B2Qu5JzK9che7xn98TmOvfiZyDk7/D5uU09CyP
m6AtFaOp8n+7ECawtLDtj6Ms1GTf0Zvg51MTJGLIry4hyHbCORz88RlLPO+v6vQnDaOm3Erm9Fc2
hfaVERMrvI8Z59xFe9/wtjyvIn0QZsAP0fZwRE9ds3A61RirbodQiEs1BTkjq18V1TVQASx8nqgS
GjPiA+q17WmaHDlU4Cnct9UsTGvD+C5gtJFLgwPYTEvnTPEpw8ulItTON0Gik4sXGM10ax/oprzB
IOxHIrQM6s6fkTDsqoY+k3z64yNB8lqM/Xq3QsypU9nITtn8vDgolMsKA8pbOCyKx6rZZLPKSZvM
gGyWWszIaVbF7iFwhIstfp8MpNiklnhZXvhvBvd19kGNd3mI9EuRZJBw8wmPTh3qzBk2alzjtNNR
A8YbKJcXXdFo74Bq7rtSruFtwVQRPVU07S6r4ERQzDiF2Apqsk7wjO2PL2Qq7dCSO/wIOnhOViA+
px9dG4tRk6uhOxqZaTVWZzA6DxsViF/ySWCCA6XMQYCzogba0Uku5iIcwPlL+DL1UZw6S2LjHosq
W8fTSL4VNAS7Sm+vP1+Q/1yP14+INcF48dHDG5St6Ccy/GdTMMP9xacUA+TZDQJMqO+4fSUn1oT1
tQc=
=u05p
-----END PGP SIGNATURE-----

--------------YNqo15NOMAFqSnT2klaH7bkc--
