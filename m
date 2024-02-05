Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00004849A54
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 13:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8709110F825;
	Mon,  5 Feb 2024 12:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="GS6PwuTW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V5aGs9DU";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="GS6PwuTW";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="V5aGs9DU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F4CD10F825
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 12:32:46 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7B3321F8C1;
 Mon,  5 Feb 2024 12:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707136361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1aRsYGt8TZduKbdCm9Q2zwLJGSlJsvjS4KugZDQLC1A=;
 b=GS6PwuTWdf1NXVE6b8sJyh6AEuDHNcrQCNtcM/8MdrlqOflLJ/Ne7Jl5L/b+1LtdkiUpC/
 S4HdqLGgsy05DaYIiYLjdDXh8nqpQ8C0q9W1YQzYdOVBv0Zx7MXIl1v6mDM+sIohjfSLaw
 EDDHNPuLbYTFdmzLylzL2Lps89uEQH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707136361;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1aRsYGt8TZduKbdCm9Q2zwLJGSlJsvjS4KugZDQLC1A=;
 b=V5aGs9DU6nI2ZyKWIQfsNDK3DnyEsYO1hl1yXr2AlrVwrfZxMqZzqwv4i3yFlOhZpw+W1D
 GxqASsCJ/soXe9Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1707136361; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1aRsYGt8TZduKbdCm9Q2zwLJGSlJsvjS4KugZDQLC1A=;
 b=GS6PwuTWdf1NXVE6b8sJyh6AEuDHNcrQCNtcM/8MdrlqOflLJ/Ne7Jl5L/b+1LtdkiUpC/
 S4HdqLGgsy05DaYIiYLjdDXh8nqpQ8C0q9W1YQzYdOVBv0Zx7MXIl1v6mDM+sIohjfSLaw
 EDDHNPuLbYTFdmzLylzL2Lps89uEQH4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1707136361;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=1aRsYGt8TZduKbdCm9Q2zwLJGSlJsvjS4KugZDQLC1A=;
 b=V5aGs9DU6nI2ZyKWIQfsNDK3DnyEsYO1hl1yXr2AlrVwrfZxMqZzqwv4i3yFlOhZpw+W1D
 GxqASsCJ/soXe9Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 420DB132DD;
 Mon,  5 Feb 2024 12:32:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id r7G6DmnVwGUyUQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Feb 2024 12:32:41 +0000
Message-ID: <6edf0c63-e608-49fa-98fe-74dbcdf11fe8@suse.de>
Date: Mon, 5 Feb 2024 13:32:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2,2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20240202120140.3517-3-tzimmermann@suse.de>
 <16b3f80f-9b55-4b91-8fc3-9b8ad414437b@linux.dev>
 <0293822c-b261-4725-8cca-3b6dd8e2991d@suse.de>
 <1d28e615-4c40-4c43-ac97-915ca25e1cd7@linux.dev>
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
In-Reply-To: <1d28e615-4c40-4c43-ac97-915ca25e1cd7@linux.dev>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------50ywKINd5KOAtLxtu0iYDdbZ"
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=GS6PwuTW;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=V5aGs9DU
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-6.50 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[7];
 MX_GOOD(-0.01)[]; SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[linux.dev,redhat.com,gmx.de,kernel.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmx.de];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -6.50
X-Rspamd-Queue-Id: 7B3321F8C1
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
--------------50ywKINd5KOAtLxtu0iYDdbZ
Content-Type: multipart/mixed; boundary="------------GvmLGLUwY5DgnVGIWTNL0rJY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <sui.jingfeng@linux.dev>, javierm@redhat.com,
 pjones@redhat.com, deller@gmx.de, ardb@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <6edf0c63-e608-49fa-98fe-74dbcdf11fe8@suse.de>
Subject: Re: [v2,2/8] video: Provide screen_info_get_pci_dev() to find
 screen_info's PCI device
References: <20240202120140.3517-3-tzimmermann@suse.de>
 <16b3f80f-9b55-4b91-8fc3-9b8ad414437b@linux.dev>
 <0293822c-b261-4725-8cca-3b6dd8e2991d@suse.de>
 <1d28e615-4c40-4c43-ac97-915ca25e1cd7@linux.dev>
In-Reply-To: <1d28e615-4c40-4c43-ac97-915ca25e1cd7@linux.dev>

--------------GvmLGLUwY5DgnVGIWTNL0rJY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDIuMjQgdW0gMTE6MDUgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gT24gMjAyNC8yLzUgMTY6MTcsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gSGkNCj4+DQo+PiBBbSAwMi4wMi4yNCB1bSAxODowMyBzY2hyaWViIFN1aSBKaW5nZmVu
ZzoNCj4+PiBIaSwNCj4+Pg0KPj4+DQo+Pj4gT24gMjAyNC8yLzIgMTk6NTgsIFRob21hcyBa
aW1tZXJtYW5uIHdyb3RlOg0KPj4+PiArDQo+Pj4+ICsvKioNCj4+Pj4gKyAqIHNjcmVlbl9p
bmZvX3BjaV9kZXYoKSAtIFJldHVybiBQQ0kgcGFyZW50IGRldmljZSB0aGF0IGNvbnRhaW5z
IA0KPj4+PiBzY3JlZW5faW5mbydzIGZyYW1lYnVmZmVyDQo+Pj4+ICsgKiBAc2k6IHRoZSBz
Y3JlZW5faW5mbw0KPj4+PiArICoNCj4+Pj4gKyAqIFJldHVybnM6DQo+Pj4+ICsgKiBUaGUg
c2NyZWVuX2luZm8ncyBwYXJlbnQgZGV2aWNlIG9uIHN1Y2Nlc3MsIG9yIE5VTEwgb3RoZXJ3
aXNlLg0KPj4+PiArICovDQo+Pj4+ICtzdHJ1Y3QgcGNpX2RldiAqc2NyZWVuX2luZm9fcGNp
X2Rldihjb25zdCBzdHJ1Y3Qgc2NyZWVuX2luZm8gKnNpKQ0KPj4+PiArew0KPj4+PiArwqDC
oMKgIHN0cnVjdCByZXNvdXJjZSByZXNbU0NSRUVOX0lORk9fTUFYX1JFU09VUkNFU107DQo+
Pj4+ICvCoMKgwqAgc3NpemVfdCBpLCBudW1yZXM7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoCBu
dW1yZXMgPSBzY3JlZW5faW5mb19yZXNvdXJjZXMoc2ksIHJlcywgQVJSQVlfU0laRShyZXMp
KTsNCj4+Pj4gK8KgwqDCoCBpZiAobnVtcmVzIDwgMCkNCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
IHJldHVybiBFUlJfUFRSKG51bXJlcyk7DQo+Pj4NCj4+Pg0KPj4+IFBsZWFzZSByZXR1cm4g
TlVMTCBhdCBoZXJlLCBvdGhlcndpc2Ugd2UgaGF2ZSB0byB1c2UgdGhlIElTX0VSUiBvciAN
Cj4+PiBJU19FUlJfT1JfTlVMTCgpDQo+Pj4gaW4gdGhlIGNhbGxlciBmdW5jdGlvbiB0byBj
aGVjayB0aGUgcmV0dXJuZWQgdmFsdWUuIE1lYW53aGlsZSwgSSANCj4+PiBub3RpY2VkIHRo
YXQgeW91DQo+Pj4gZGlkbid0IGFjdHVhbGx5IGNhbGwgSVNfRVJSKCkgaW4gdGhlIHN5c2Zi
X3BhcmVudF9kZXYoKSBmdW5jdGlvbiANCj4+PiAoaW50cm9kdWNlZCBieSB0aGUNCj4+PiAz
LzggcGF0Y2gpLCBzbyBJIHRoaW5rIHdlIHByb2JhYmx5IHNob3VsZCByZXR1cm4gTlVMTCBh
dCBoZXJlLg0KPj4+DQo+Pj4gUGxlYXNlIGFsc28gY29uc2lkZXIgdGhhdCB0aGUgY29tbWVu
dHMgb2YgdGhpcyBmdW5jdGlvbiBzYXlzIHRoYXQgaXQgDQo+Pj4gcmV0dXJuIE5VTEwgb24N
Cj4+PiB0aGUgb3RoZXJ3aXNlIGNhc2VzLg0KPj4NCj4+IFJpZ2h0LiBUaGUgaWRlYSBpcyB0
byByZXR1cm4gTlVMTCBpcyB0aGVyZSBpcyBubyBwYXJlbnQgZGV2aWNlLiANCj4gDQo+IA0K
PiByZXR1cm4gTlVMTCBpcyBtb3JlIGVhc2llciBhbmQgY2xlYXIsIGl0IHN0YW5kIGZvciAi
Tm9uZSIgb3IgImRvbid0IGV4aXN0Ii4NCj4gVGhlcmUgaXMgYW5vdGhlciByZWFzb24gdGhh
dCBJIHdhbnQgdG8gdGVsbCB5b3U6DQo+IA0KPiBTb21lIHN5c3RlbXMgd2hpY2ggZG9uJ3Qg
aGF2ZSBhIGdvb2QgVUVGSSBmaXJtd2FyZSBzdXBwb3J0IGZvciB1bmNvbW1vbiANCj4gR1BV
cy4NCj4gdGhlIHdvcmQgInVuY29tbW9uIiBtZWFucyAibm90IHZlcnkgcG9wdWxhciBHUFUi
IG9yICJleHRyZW1lbHkgbmV3IEdQVSIgb3INCj4gImp1c3QgcmVmZXIgdG8gdGhlIEdQVXMg
dGhhdCBVRUZJIGZpcm13YXJlIGRvbid0IGtub3cocmVjb2duaXplKSBhYm91dCINCj4gDQo+
IE9uIHN1Y2ggY2FzZXMsIHRoZXJlIGlzIG5vIGZpcm13YXJlIGZyYW1lYnVmZmVyIHN1cHBv
cnQuIEkgbWVhbnMgaXQgaXMgDQo+IHBvc3NpYmxlDQo+IHRoYXQgc2NyZWVuX2luZm9fcmVz
b3VyY2VzKCkgcmV0dXJuIC1FSU5WQUwgYmVjYXVzZSBvZiBub3Qgc3VwcG9ydCB5ZXQuIA0K
PiBUaGVuLA0KPiB0aGUgc2NyZWVuX2luZm9fcGNpX2RldihzaSkgcmV0dXJucyBFUlJfUFRS
KC1FSU5WQUwpIGFuZCANCj4gc3lzZmJfcGNpX2Rldl9pc19lbmFibGVkKCkNCj4gd2lsbCB0
YWtlIHRoaXMgZXJyb3IgY29kZSBhc8KgYSBwb2ludGVyIGFuZCBkZS1yZWZlcmVuY2UgaXQs
IGNhdXNlIHRoZSANCj4gZm9sbG93aW5nDQo+IHByb2JsZW06DQoNClJpZ2h0LCB0aGF0J3Mg
cGFydCBvZiB0aGUgYnVnIHlvdSBhbHJlYWR5IHBvaW50ZWQgb3V0LiBBcyBJIHNhaWQsIEkg
bmVlZCANCnRvIHJldmlldyB0aGUgY2FsbGVycyBvZiBzY3JlZW5faW5mb19wY2lfZGV2KCkg
YW5kIGZpeCB0aGVtLg0KDQpCdXQgcmV0dXJuaW5nIGFuIGVycm5vIHBvaW50ZXIgaXMgdXNl
ZnVsIGluIGNhc2VzIHdoZXJlIGEgcG9zc2libGUgDQpwYXJlbnQgZGV2aWNlIHdvdWxkIGhh
dmUgYmVlbiBkZXRlY3RlZCwgYnV0IHNvbWV0aGluZyBkaWQgbm90IHdvcmsgb3V0LiANCkZv
ciBleGFtcGxlLCBzY3JlZW5faW5mb19yZXNvdXJjZXMoKSBkb2VzIG5vdCBzdXBwb3J0IGFs
bCBWSURFT19UWVBFXyANCmNvbnN0YW50cy4gSW4gc3VjaCBhIGNhc2UsIGl0J3MgYmV0dGVy
IHRvIHRlbGwgdGhlIGNhbGxlciBhYm91dCB0aGUgDQpwcm9ibGVtIHRoYW4gdG8gc2lsZW50
bHkgcmV0dXJuIE5VTEwuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEFuZCBl
dmVuIHRoZSB4ODYtNjQgbW90aGVyYm9hcmQgd2lsbCBub3QgbGlrZWx5IHN1cHBvcnQgYWxs
IEdQVShmb3IgDQo+IGV4YW1wbGUgdGhlIG9uZQ0KPiB3aXRoIGEgb2xkIFVFRkkgQklPUyku
IEFuZCBmb3IgYW4gZXhhbXBsZSwgVGhlIGludGVsIFhlIGlzIHRoZSANCj4gImV4dHJlbWVs
eSBuZXcgR1BVIi4NCj4gDQo+IA0KPiBbwqDCoMKgIDUuMDMxOTY2XSBDUFUgNCBVbmFibGUg
dG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBhdCB2aXJ0dWFsIA0KPiBhZGRyZXNz
IDAwMDAwMDAwMDAwMDA4MWEsIGVyYSA9PSA5MDAwMDAwMDAzMjliNDQ4LCByYSA9PSA5MDAw
MDAwMDAzMjliNDQwDQo+IFvCoMKgwqAgNS4wNDQ1ODddIE9vcHNbIzFdOg0KPiBbwqDCoMKg
IDUuMDQ2ODM3XSBDUFU6IDQgUElEOiAxIENvbW06IHN3YXBwZXIvMCBOb3QgdGFpbnRlZCA2
LjguMC1yYzErICM3DQo+IFvCoMKgwqAgNS4wNTMwNjJdIEhhcmR3YXJlIG5hbWU6IExvb25n
c29uIA0KPiBMb29uZ3Nvbi0zQTYwMDAtSFYtN0EyMDAwLVhBNjEyMDAvTG9vbmdzb24tM0E2
MDAwLUhWLTdBMjAwMC1YQTYxMjAwLCANCj4gQklPUyBMb29uZ3Nvbi1VREsyMDE4LVY0LjAu
MDU2MzYtc3RhYmxlMjAyMzExIDEyLw0KPiBbwqDCoMKgIDUuMDY2ODAzXSBwYyA5MDAwMDAw
MDAzMjliNDQ4IHJhIDkwMDAwMDAwMDMyOWI0NDAgdHAgDQo+IDkwMDAwMDAxMDAwZDAwMDAg
c3AgOTAwMDAwMDEwMDBkM2Q0MA0KPiBbwqDCoMKgIDUuMDc1MTAwXSBhMCBmZmZmZmZmZmZm
ZmZmZmVhIGExIDkwMDAwMDAxMDAwZDNjMzggYTIgDQo+IDAwMDAwMDAwMDAwMDAwMDMgYTMg
OTAwMDAwMDAwMzg2N2NlOA0KPiBbwqDCoMKgIDUuMDgzMzk4XSBhNCA5MDAwMDAwMDAzODY3
Y2UwIGE1IDkwMDAwMDAxMDAwZDNhODAgYTYgDQo+IDAwMDAwMDAwMDAwMDAwMDEgYTcgMDAw
MDAwMDAwMDAwMDAwMQ0KPiBbwqDCoMKgIDUuMDkxNjk1XSB0MCBhYzgxZjU1ZTM0NzEzOTYy
IHQxIGFjODFmNTVlMzQ3MTM5NjIgdDIgDQo+IDAwMDAwMDAwMDAwMDAwMDAgdDMgMDAwMDAw
MDAwMDAwMDAwMQ0KPiBbwqDCoMKgIDUuMDk5OTkyXSB0NCAwMDAwMDAwMDAwMDAwMDA0IHQ1
IDAwMDAwMDAwMDAwMDAwMDAgdDYgDQo+IDAwMDAwMDAwMDAwMDAwMzAgdDcgMDAwMDAwMDAw
MDAwMDAwMA0KPiBbwqDCoMKgIDUuMTA4MjkwXSB0OCAwMDAwMDAwMDAwMDA3MGIxIHUwIDAw
MDAwMDAwMDAwMDAwMDAgczkgDQo+IDAwMDAwMDAwMDAwMDAwMDggczAgOTAwMDAwMDAwM2Q1
OGI0OA0KPiBbwqDCoMKgIDUuMTE2NTg3XSBzMSA5MDAwMDAwMDAzYzBiNGE4IHMyIDkwMDAw
MDAwMDM3ODcwMDAgczMgDQo+IDkwMDAwMDAwMDM3NzgwMDAgczQgOTAwMDAwMDAwMzJjMDU3
OA0KPiBbwqDCoMKgIDUuMTI0ODg0XSBzNSBmZmZmZmZmZmZmZmZmZmVhIHM2IDkwMDAwMDAw
MDMyYzA1NjAgczcgDQo+IDkwMDAwMDAwMDMyZGY5MDAgczggZmZmZmZmZmZjY2NjYzAwMA0K
PiBbwqDCoMKgIDUuMTMzMTgyXcKgwqDCoCByYTogOTAwMDAwMDAwMzI5YjQ0MCBzeXNmYl9p
bml0KzB4ODAvMHgxZjANCj4gW8KgwqDCoCA1LjEzODU0NV3CoMKgIEVSQTogOTAwMDAwMDAw
MzI5YjQ0OCBzeXNmYl9pbml0KzB4ODgvMHgxZjANCj4gW8KgwqDCoCA1LjE0MzkwNV3CoCBD
Uk1EOiAwMDAwMDBiMCAoUExWMCAtSUUgLURBICtQRyBEQUNGPUNDIERBQ009Q0MgLVdFKQ0K
PiBbwqDCoMKgIDUuMTUwMDQ4XcKgIFBSTUQ6IDAwMDAwMDA0IChQUExWMCArUElFIC1QV0Up
DQo+IFvCoMKgwqAgNS4xNTQzNzNdwqAgRVVFTjogMDAwMDAwMDAgKC1GUEUgLVNYRSAtQVNY
RSAtQlRFKQ0KPiBbwqDCoMKgIDUuMTU5MTMxXcKgIEVDRkc6IDAwMDcxYzFjIChMSUU9Mi00
LDEwLTEyIFZTPTcpDQo+IFvCoMKgwqAgNS4xNjM3MTddIEVTVEFUOiAwMDAxMDAwMCBbUElM
XSAoSVM9IEVDb2RlPTEgRXN1YkNvZGU9MCkNCj4gW8KgwqDCoCA1LjE2OTE2NF3CoCBCQURW
OiAwMDAwMDAwMDAwMDAwODFhDQo+IFvCoMKgwqAgNS4xNzI2MjNdwqAgUFJJRDogMDAxNGQw
MDAgKExvb25nc29uLTY0Yml0LCBMb29uZ3Nvbi0zQTYwMDAtSFYpDQo+IFvCoMKgwqAgNS4x
Nzg1ODddIE1vZHVsZXMgbGlua2VkIGluOg0KPiBbwqDCoMKgIDUuMTgxNjE0XSBQcm9jZXNz
IHN3YXBwZXIvMCAocGlkOiAxLCB0aHJlYWRpbmZvPShfX19fcHRydmFsX19fXyksIA0KPiB0
YXNrPShfX19fcHRydmFsX19fXykpDQo+IFvCoMKgwqAgNS4xODk4MjddIFN0YWNrIDogMDAw
MDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwIA0KPiAwMDAwMDAwMDAwMDAwMDAwIDAw
MDAwMDAwMDAwMDAwMDANCj4gW8KgwqDCoCA1LjE5Nzc4Ml3CoMKgwqDCoMKgwqDCoMKgIDAw
MDAwMDAwMDAwMDAwMDAgYWM4MWY1NWUzNDcxMzk2MiANCj4gOTAwMDAwMDAwMzJjMDAwMCA5
MDAwMDAwMDAzNzc4MDAwDQo+IFvCoMKgwqAgNS4yMDU3MzZdwqDCoMKgwqDCoMKgwqDCoCA5
MDAwMDAwMDAzMmMwNTc4IDAwMDAwMDAwMDAwMDAwMDAgDQo+IDkwMDAwMDAwMDMyOWIzYzAg
OTAwMDAwMDAwM2M1NDAwMA0KPiBbwqDCoMKgIDUuMjEzNjkxXcKgwqDCoMKgwqDCoMKgwqAg
OTAwMDAwMDEwMDBkM2RiOCA5MDAwMDAwMDAyMjYwMTU0IA0KPiAwMDAwMDAwMDAwMDAwMDA2
IDAwMDAwMDAwMDAwMDAwMDANCj4gW8KgwqDCoCA1LjIyMTY0NV3CoMKgwqDCoMKgwqDCoMKg
IDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCANCj4gMDAwMDAwMDAwMDAwMDAw
MCAwMDAwMDAwMDAwMDAwMDAwDQo+IFvCoMKgwqAgNS4yMjk1OTldwqDCoMKgwqDCoMKgwqDC
oCAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDAgDQo+IDAwMDAwMDAwMDAwMDAw
MDAgYWM4MWY1NWUzNDcxMzk2Mg0KPiBbwqDCoMKgIDUuMjM3NTUzXcKgwqDCoMKgwqDCoMKg
wqAgOTAwMDAwMDAwMzc0NjhmOCA5MDAwMDAwMDAzNzQ2OGY4IA0KPiA5MDAwMDAwMDAzMmMw
NTc4IDkwMDAwMDAwMDM2YTc2NTgNCj4gW8KgwqDCoCA1LjI0NTUwOF3CoMKgwqDCoMKgwqDC
oMKgIDAwMDAwMDAwMDAwMDAwMDYgOTAwMDAwMDEwMDA0MWUwMCANCj4gMDAwMDAwMDAwMDAw
MGE1NSA5MDAwMDAwMDAzMjYwZmY0DQo+IFvCoMKgwqAgNS4yNTE1NDldIGF0YTM6IFNBVEEg
bGluayBkb3duIChTU3RhdHVzIDAgU0NvbnRyb2wgMzAwKQ0KPiBbwqDCoMKgIDUuMjUzNDYz
XcKgwqDCoMKgwqDCoMKgwqAgMDAwMDAwMDAwMDAwMDAwMCA5MDAwMDAwMDAzMjYwMGIwIA0K
PiAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMDAwMDAwMDANCj4gW8KgwqDCoCA1LjI2Njc3
N13CoMKgwqDCoMKgwqDCoMKgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwMDAwMDAwMCAN
Cj4gMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDAwMDAwMDAwDQo+IFvCoMKgwqAgNS4yNzQ3
MzFdwqDCoMKgwqDCoMKgwqDCoCAuLi4NCj4gW8KgwqDCoCA1LjI3NzE1NF0gQ2FsbCBUcmFj
ZToNCj4gW8KgwqDCoCA1LjI3NzE1NV0gWzw5MDAwMDAwMDAzMjliNDQ4Pl0gc3lzZmJfaW5p
dCsweDg4LzB4MWYwDQo+IFvCoMKgwqAgNS4yODQ2NzhdIFs8OTAwMDAwMDAwMjI2MDE1ND5d
IGRvX29uZV9pbml0Y2FsbCsweDc4LzB4MWNjDQo+IFvCoMKgwqAgNS4yOTAyMTNdIFs8OTAw
MDAwMDAwMzI2MGZmND5dIGtlcm5lbF9pbml0X2ZyZWVhYmxlKzB4MjI4LzB4Mjk4DQo+IFvC
oMKgwqAgNS4yOTYyNjddIFs8OTAwMDAwMDAwMzI0ZDEwND5dIGtlcm5lbF9pbml0KzB4MjAv
MHgxMTANCj4gW8KgwqDCoCA1LjMwMTQ1NV0gWzw5MDAwMDAwMDAyMjYxMWU4Pl0gcmV0X2Zy
b21fa2VybmVsX3RocmVhZCsweGMvMHhhNA0KPiBbwqDCoMKgIDUuMzA3NDIxXQ0KPiBbwqDC
oMKgIDUuMzA4ODkyXSBDb2RlOiA1NjE2NjdmZcKgIDAwMTUwMDljwqAgNDAwMDcwODAgPDI0
MDgzMDhjPiAyOTQwMzg2MCANCj4gMDJjMmUwOWLCoCAwMDQwODE4Y8KgIDY0MDAxODBjwqAg
MWEwMDdkNDUNCj4gW8KgwqDCoCA1LjMxODU3OV0NCj4gW8KgwqDCoCA1LjMyMDA1M10gLS0t
WyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tDQo+IFvCoMKgwqAgNS4zMjQ2NDBd
IEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBBdHRlbXB0ZWQgdG8ga2lsbCBpbml0ISAN
Cj4gZXhpdGNvZGU9MHgwMDAwMDAwYg0KPiBbwqDCoMKgIDUuMzMyMjQ3XSBLZXJuZWwgcmVs
b2NhdGVkIGJ5IDB4MjA0MDAwMA0KPiBbwqDCoMKgIDUuMzM2MjI2XcKgIC50ZXh0IEAgMHg5
MDAwMDAwMDAyMjQwMDAwDQo+IFvCoMKgwqAgNS4zNDAwMzFdwqAgLmRhdGEgQCAweDkwMDAw
MDAwMDMyZjAwMDANCj4gW8KgwqDCoCA1LjM0MzgzNV3CoCAuYnNzwqAgQCAweDkwMDAwMDAw
MDNjM2YyMDANCj4gW8KgwqDCoCA1LjM0NzY0MF0gLS0tWyBlbmQgS2VybmVsIHBhbmljIC0g
bm90IHN5bmNpbmc6IEF0dGVtcHRlZCB0byBraWxsIA0KPiBpbml0ISBleGl0Y29kZT0weDAw
MDAwMDBiIF0tLS0NCj4gDQo+IA0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3Nl
IDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcg
TXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFH
IE51ZXJuYmVyZykNCg==

--------------GvmLGLUwY5DgnVGIWTNL0rJY--

--------------50ywKINd5KOAtLxtu0iYDdbZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmXA1WgFAwAAAAAACgkQlh/E3EQov+AV
dg/+KpDzZB8Ubu3tey6DXlXsW630hOrF6asqpHBRgJSAlne7lDK+bZKJn17DyDYur3pBsaMOsK0Z
w0+5nZ6Gu+XnVZwn/LcB/M7r+DPTa8aNWqo2/ySSKamQIAqBVrdUssb01BdYs59XXcOPC1PfY09Y
gHmAy8ddJT2F/xU+pGxacuNe22yEcysioFi4FjbphdppnbKIC6SOldR1GZ82Uk5eqWQ0E+cGLBuv
sZ89tiD7D64khXfEVwD2rAL4JjJrxxdD5j+7i6Pjr7LYreCuFGlzbBdEstdA232SG+8UVLL49YEt
X+CEXR7pgI1CEKb9y1ouAmS9HKhbGvoBMFeRIbqVbYdJZqpS3u7mvTm7aRu3KrIjgX5jEdskm7Cr
hnb2nKBicmfpCwtnkDoI2ssgCnO/Mk3jCKPW+jYQew1FUcwzsHzIPpir14kOIB9Odm72PfmWnru8
lgxSqSk2Huk5Y44iR+91BfFfj/nr6KnMUXfMTVtyE0miIob0boFMMByhbSIumJWl1uxIyPKU6zNh
9bUi+musH39Ri7eY5/D/X/BjaKnhI1KBcjhMvXZz0IzEccj2bRG9OgdANjTkQmatKFAAm/wIHWY9
p3859e2yCGgO+h7Jo4dUWQhI/Iqs7RSCJgXIHyyPhpIIbRpXD1Vjecb16o6QGlcmsIrtjANnAxLE
L90=
=SkhF
-----END PGP SIGNATURE-----

--------------50ywKINd5KOAtLxtu0iYDdbZ--
