Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7698269ED
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 09:57:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71CAD10E159;
	Mon,  8 Jan 2024 08:57:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C510D10E159
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 08:57:35 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 37C6221DA2;
 Mon,  8 Jan 2024 08:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704704254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cAurPlBeRuCifgGA7jOhCTXnX1QujR6ipU6h1WX3uaI=;
 b=TuE3SfbmRaIKGCQwf4eEtID398dZOid9hmkor5rFZTcJIHn3yOsEwBvsYC+K9mgq3/RJv8
 HmEagVTUA+z5xZx8u9vSUlReEtzuLoNLA2kfJ7d5H37J1kDsLxaB7j3h7YiCspwgTSkVcw
 4vAqOfW1uhlbYHIJiOepXXasTiNGIWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704704254;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cAurPlBeRuCifgGA7jOhCTXnX1QujR6ipU6h1WX3uaI=;
 b=Ynm5a7AYnWeCYH38GkO2j8OkCHnjZuessa+Kd2zx81jinmm5S1wiYEslbYlPO/NZeebG49
 5h4QV3oJ/lDtZtCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704704252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cAurPlBeRuCifgGA7jOhCTXnX1QujR6ipU6h1WX3uaI=;
 b=mJC6aAknH6ZoMsysQrtCHSJDDDtdraOuQFSYsmIeYVyutMY/o5mXvIuVX4hyuCDNREL+tf
 f82z4mD7apDxF1nb2iPLhWCWcyJGvYQCeRHnotrLB5W9l8W/CiaC4VX0kDUro8HknQBFIp
 DPe+A3VJZntiqOCbNbK3X9xBlttLinQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704704252;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cAurPlBeRuCifgGA7jOhCTXnX1QujR6ipU6h1WX3uaI=;
 b=Dc26X8NqOrggjyofwggBYChli+Z8urDhnjyvGLWiHYMuf+O1KL2N1ZIDX0V6IGpcAg1rhY
 0mO5SHOHIFpS82Bw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EB72D13496;
 Mon,  8 Jan 2024 08:57:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 5OoUOPu4m2WLBwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 08 Jan 2024 08:57:31 +0000
Message-ID: <944ca2e6-23d9-44a2-a58c-4380e9ee575f@suse.de>
Date: Mon, 8 Jan 2024 09:57:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/vram-helper: fix kernel-doc warnings
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20240106032957.1195-1-rdunlap@infradead.org>
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
In-Reply-To: <20240106032957.1195-1-rdunlap@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LtWdrWC7giRNNNUp13dSnSA2"
X-Spam-Level: 
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-5.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; BAYES_HAM(-3.00)[100.00%];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[7];
 DBL_BLOCKED_OPENRESOLVER(0.00)[ffwll.ch:email,intel.com:email,suse.de:email,infradead.org:email,lists.freedesktop.org:email];
 SIGNED_PGP(-2.00)[]; FUZZY_BLOCKED(0.00)[rspamd.com];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,lists.freedesktop.org,linux.intel.com,kernel.org];
 RCVD_TLS_ALL(0.00)[]; MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.29
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
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LtWdrWC7giRNNNUp13dSnSA2
Content-Type: multipart/mixed; boundary="------------Xm2e90laErnH7AWatnf00hu9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>
Message-ID: <944ca2e6-23d9-44a2-a58c-4380e9ee575f@suse.de>
Subject: Re: [PATCH v2] drm/vram-helper: fix kernel-doc warnings
References: <20240106032957.1195-1-rdunlap@infradead.org>
In-Reply-To: <20240106032957.1195-1-rdunlap@infradead.org>

--------------Xm2e90laErnH7AWatnf00hu9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgdGhlIGZpeC4NCg0KQW0gMDYuMDEuMjQgdW0gMDQ6Mjkgc2No
cmllYiBSYW5keSBEdW5sYXA6DQo+IFJlbW92ZSB0aGUgQGZ1bmNzIGVudHJ5IGZyb20gc3Ry
dWN0IGRybV92cmFtX21tIHRvIHF1aWV0ZW4gdGhlIGtlcm5lbC1kb2MNCj4gd2FybmluZy4N
Cj4gDQo+IFVzZSB0aGUgImRlZmluZSIga2VybmVsLWRvYyBrZXl3b3JkIGFuZCBhbiAnXCcg
bGluZSBjb250aW51YXRpb24NCj4gdG8gZml4IGFub3RoZXIga2VybmVsLWRvYyB3YXJuaW5n
Lg0KPiANCj4gZHJtX2dlbV92cmFtX2hlbHBlci5oOjEyOTogd2FybmluZzogbWlzc2luZyBp
bml0aWFsIHNob3J0IGRlc2NyaXB0aW9uIG9uIGxpbmU6DQo+ICAgKiBEUk1fR0VNX1ZSQU1f
UExBTkVfSEVMUEVSX0ZVTkNTIC0NCj4gZHJtX2dlbV92cmFtX2hlbHBlci5oOjE4NTogd2Fy
bmluZzogRXhjZXNzIHN0cnVjdCBtZW1iZXIgJ2Z1bmNzJyBkZXNjcmlwdGlvbiBpbiAnZHJt
X3ZyYW1fbW0nDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBA
aW5mcmFkZWFkLm9yZz4NCj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+
DQo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+DQo+IENjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFh
cnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPg0KPiBDYzogTWF4aW1lIFJpcGFyZCA8
bXJpcGFyZEBrZXJuZWwub3JnPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQo+IC0tLQ0KPiB2MjogQWRkIGNvbW1pdCBkZXNjcmlwdGlvbg0KPiAN
Cj4gYmFzZS1jb21taXQ6IDYxMGE5YjhmNDlmYmNmMTEwMDcxNjM3MGQzYjVmNmY4ODRhMjgz
NWENCj4gDQo+ICAgaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oIHwgICAgMyAr
LS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oIGIv
aW5jbHVkZS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5oDQo+IC0tLSBhL2luY2x1ZGUvZHJt
L2RybV9nZW1fdnJhbV9oZWxwZXIuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3Zy
YW1faGVscGVyLmgNCj4gQEAgLTEyNiw3ICsxMjYsNyBAQCBkcm1fZ2VtX3ZyYW1fcGxhbmVf
aGVscGVyX2NsZWFudXBfZmIoc3RyDQo+ICAgCQkJCSAgICAgc3RydWN0IGRybV9wbGFuZV9z
dGF0ZSAqb2xkX3N0YXRlKTsNCj4gICANCj4gICAvKioNCj4gLSAqIERSTV9HRU1fVlJBTV9Q
TEFORV9IRUxQRVJfRlVOQ1MgLQ0KPiArICogZGVmaW5lIERSTV9HRU1fVlJBTV9QTEFORV9I
RUxQRVJfRlVOQ1MgLSBcDQoNCkRpZCBzb21ldGhpbmcgY2hhbmdlIHdydC4gZG9jIHN5bnRh
eD8gSSB0aGluayB0aGlzIHVzZWQgdG8gd29yayB3aXRob3V0IA0Kd2FybmluZ3MuIEFib3V0
IHRoaXMgJ2RlZmluZSc6IHdlIGRvbid0IHVzZSBpcyBpbiBhbm90aGVyIGRvY3MuIENhbiB3
ZSANCmxlYXZlIGl0IG91dCBoZXJlIG9yIGlzIHRoaXMgdGhlIG5ldyBzeW50YXg/DQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gICAgKglJbml0aWFsaXplcyBzdHJ1Y3QgZHJtX3Bs
YW5lX2hlbHBlcl9mdW5jcyBmb3IgVlJBTSBoYW5kbGluZw0KPiAgICAqDQo+ICAgICogRHJp
dmVycyBtYXkgdXNlIEdFTSBCT3MgYXMgVlJBTSBoZWxwZXJzIGZvciB0aGUgZnJhbWVidWZm
ZXIgbWVtb3J5LiBUaGlzDQo+IEBAIC0xNzAsNyArMTcwLDYgQEAgdm9pZCBkcm1fZ2VtX3Zy
YW1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9jbA0KPiAgICAqIEB2cmFtX2Jhc2U6CUJhc2UgYWRk
cmVzcyBvZiB0aGUgbWFuYWdlZCB2aWRlbyBtZW1vcnkNCj4gICAgKiBAdnJhbV9zaXplOglT
aXplIG9mIHRoZSBtYW5hZ2VkIHZpZGVvIG1lbW9yeSBpbiBieXRlcw0KPiAgICAqIEBiZGV2
OglUaGUgVFRNIEJPIGRldmljZS4NCj4gLSAqIEBmdW5jczoJVFRNIEJPIGZ1bmN0aW9ucw0K
PiAgICAqDQo+ICAgICogVGhlIGZpZWxkcyAmc3RydWN0IGRybV92cmFtX21tLnZyYW1fYmFz
ZSBhbmQNCj4gICAgKiAmc3RydWN0IGRybV92cmFtX21tLnZybV9zaXplIGFyZSBtYW5hZ2Vk
IGJ5IFZSQU0gTU0sIGJ1dCBhcmUNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6
IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9l
cm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------Xm2e90laErnH7AWatnf00hu9--

--------------LtWdrWC7giRNNNUp13dSnSA2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWbuPsFAwAAAAAACgkQlh/E3EQov+Bw
WQ//Ybb744sF3Yb3yeNKoYsSBxkhunCw8GZ+uIxfL4nfCS+j6tNOMSHa/o4japYqW69tsSMUA0kr
MDhvImoL7AzIIvqMILpOQMHXrw8mko8IUuxvE/n6AxH/UBXKdylExb7gTAhGTCOXZ2PYFE2CiAu6
Q3S0IKJrrXQUPM9bjlmhLI8SIehoQsK3hsAyaVKmcSjm0xga7CEKC51jVjmKEyxwQdJwIA3Fg4/C
kYGk6DofRMpFtLoOPvwRP5eXNdxpfI8OSWRpehtB8+3XrNItSYc/CgvuIROjGnMbrpLT+AWCpgMy
q37iL3yjotkSSLO9yUSAwRm+l5w3Jt1RL2mkjPPzw9OpeVmQVT6dqPrOaGuRv5ws7I9dZsC/Z7Ww
OnuZ71aezdZBivUSeOyv6L42g2HcNj9hJmKCr5/VJagF3Ktbk3H7fsCCnItqSlLPTccCV69Ltsrc
WXx3aMfjVLiHXXgkllx8wh4dunTk7tCfHalcMNzAL+Nyd8yh2ZDU/s1ArBharhuN5OeddaXgCjxp
rJ2aEO7Og3mcJcKGt7RGNXb1e/W7wAjIb53e5YPVWIrW1M9z43UMRpv3ALtTRYtS+CtLwfl3dr5Y
+aLjBmAow0GzxUW5JC+M5KKT4HtsXFogviAEtuxAWA/D2LK5rlhffmrRQosbDfkB7bUwILxoJ3Gy
IRk=
=TAkr
-----END PGP SIGNATURE-----

--------------LtWdrWC7giRNNNUp13dSnSA2--
