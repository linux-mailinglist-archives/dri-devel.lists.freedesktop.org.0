Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AF77EE0BC
	for <lists+dri-devel@lfdr.de>; Thu, 16 Nov 2023 13:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1E310E289;
	Thu, 16 Nov 2023 12:34:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90F7310E280
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Nov 2023 12:34:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 84D6B20502;
 Thu, 16 Nov 2023 12:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1700138048; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f+tEO3bJnAujyi0nZ7Nj/qVI7J0PAgRfP2jUhBB968E=;
 b=jzZUXqOIRJcKqB4UM/UQyo1D2hP+d6zZZpmdXswW9zW2QvQ4efTd8YOE+D5Fv6ilUGsRaD
 gizDSG7KYboo4PFsjoa4/n33tzHvBXurJNIlvvoqXzp6S3/RQ9ZuAI4CYjWYLrT51wmdUz
 VMY6stBeW/M3LfNU474NKE2OL6bLs6k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1700138048;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=f+tEO3bJnAujyi0nZ7Nj/qVI7J0PAgRfP2jUhBB968E=;
 b=9Ts4+I0aemp5AuUCeqqy4nG4rJ8LcpjaUmvch0s2xCYSsEGMq4GtlonAOYA1lwTIVCMFYc
 fYvUlGKiprtTv9DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 517821377E;
 Thu, 16 Nov 2023 12:34:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nPe/EkAMVmVucAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Nov 2023 12:34:08 +0000
Message-ID: <3b799dee-c366-4c0b-9efe-c75d189fc24b@suse.de>
Date: Thu, 16 Nov 2023 13:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] drm/plane: Extend damage tracking kernel-doc
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
References: <20231115131549.2191589-1-javierm@redhat.com>
 <20231115131549.2191589-5-javierm@redhat.com>
 <abfd41c7-dc9f-4cd3-be83-97b2c2c96b62@suse.de>
 <vhshocGSkXgVLycHIcJIVPsN9OQokPA2NCgIBqOvIzpKRZXQjN1uEiFKVudwa-S4hpBnFPaxxYh8hCFxd-u_ahYKBamQxFzIhBkYGkND9Kc=@emersion.fr>
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
In-Reply-To: <vhshocGSkXgVLycHIcJIVPsN9OQokPA2NCgIBqOvIzpKRZXQjN1uEiFKVudwa-S4hpBnFPaxxYh8hCFxd-u_ahYKBamQxFzIhBkYGkND9Kc=@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BFu4yPoixSFD0eeZ56uxGvmy"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -7.79
X-Spamd-Result: default: False [-7.79 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[]; TO_DN_SOME(0.00)[];
 HAS_ATTACHMENT(0.00)[]; REPLY(-4.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[9]; SIGNED_PGP(-2.00)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 MID_RHS_MATCH_FROM(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 ARC_NA(0.00)[]; FROM_HAS_DN(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_COUNT_TWO(0.00)[2];
 RCVD_TLS_ALL(0.00)[]; SUSPICIOUS_RECIPS(1.50)[];
 FREEMAIL_CC(0.00)[collabora.com, ffwll.ch, redhat.com, lists.freedesktop.org,
 vger.kernel.org, kernel.org, gmail.com]
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BFu4yPoixSFD0eeZ56uxGvmy
Content-Type: multipart/mixed; boundary="------------FAxPyeJCEpBq2pc0UZBYK3X0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui
 <belmouss@redhat.com>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Erico Nunes <nunes.erico@gmail.com>
Message-ID: <3b799dee-c366-4c0b-9efe-c75d189fc24b@suse.de>
Subject: Re: [PATCH v2 4/5] drm/plane: Extend damage tracking kernel-doc
References: <20231115131549.2191589-1-javierm@redhat.com>
 <20231115131549.2191589-5-javierm@redhat.com>
 <abfd41c7-dc9f-4cd3-be83-97b2c2c96b62@suse.de>
 <vhshocGSkXgVLycHIcJIVPsN9OQokPA2NCgIBqOvIzpKRZXQjN1uEiFKVudwa-S4hpBnFPaxxYh8hCFxd-u_ahYKBamQxFzIhBkYGkND9Kc=@emersion.fr>
In-Reply-To: <vhshocGSkXgVLycHIcJIVPsN9OQokPA2NCgIBqOvIzpKRZXQjN1uEiFKVudwa-S4hpBnFPaxxYh8hCFxd-u_ahYKBamQxFzIhBkYGkND9Kc=@emersion.fr>

--------------FAxPyeJCEpBq2pc0UZBYK3X0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMTEuMjMgdW0gMTM6MTQgc2NocmllYiBTaW1vbiBTZXI6DQo+IE9uIFRo
dXJzZGF5LCBOb3ZlbWJlciAxNnRoLCAyMDIzIGF0IDEzOjA2LCBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPj4+ICsgKiBOb3RlIHRoYXQg
dGhlcmUgYXJlIHR3byB0eXBlcyBvZiBkYW1hZ2UgaGFuZGxpbmc6IGZyYW1lIGRhbWFnZSBh
bmQgYnVmZmVyDQo+Pj4gKyAqIGRhbWFnZS4gVGhlIHR5cGUgb2YgZGFtYWdlIGhhbmRsaW5n
IGltcGxlbWVudGVkIGRlcGVuZHMgb24gYSBkcml2ZXIncyB1cGxvYWQNCj4+PiArICogdGFy
Z2V0LiBEcml2ZXJzIGltcGxlbWVudGluZyBhIHBlci1wbGFuZSBvciBwZXItQ1JUQyB1cGxv
YWQgdGFyZ2V0IG5lZWQgdG8NCj4+PiArICogaGFuZGxlIGZyYW1lIGRhbWFnZSB3aGlsZSBk
cml2ZXJzIGltcGxlbWVudGluZyBhIHBlci1idWZmZXIgdXBsb2FkIHRhcmdldA0KPj4+ICsg
KiBuZWVkIHRvIGhhbmRsZSBidWZmZXIgZGFtYWdlLg0KPj4+ICsgKg0KPj4+ICsgKiBUaGUg
ZXhpc3RpbmcgZGFtYWdlIGhlbHBlcnMgb25seSBzdXBwb3J0IHRoZSBmcmFtZSBkYW1hZ2Ug
dHlwZSwgdGhlcmUgaXMgbm8NCj4+PiArICogYnVmZmVyIGFnZSBzdXBwb3J0IG9yIHNpbWls
YXIgZGFtYWdlIGFjY3VtdWxhdGlvbiBhbGdvcml0aG0gaW1wbGVtZW50ZWQgeWV0Lg0KPj4+
ICsgKg0KPj4+ICsgKiBPbmx5IGRyaXZlcnMgaGFuZGxpbmcgZnJhbWUgZGFtYWdlIGNhbiB1
c2UgdGhlIG1lbnRpb3JlZCBkYW1hZ2UgaGVscGVycyB0bw0KPiANCj4gVHlwbzogbWVudGlv
bmVkDQo+IA0KPj4+ICsgKiBpdGVyYXRlIG92ZXIgdGhlIGRhbWFnZWQgcmVnaW9ucy4gRHJp
dmVycyB0aGF0IGhhbmRsZSBidWZmZXIgZGFtYWdlLCBuZWVkIHRvDQo+Pj4gKyAqIHNldCAm
c3RydWN0IGRybV9wbGFuZV9zdGF0ZS5pZ25vcmVfZGFtYWdlX2NsaXBzIGFzIGFuIGluZGlj
YXRpb24gdG8NCj4+PiArICogZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX2l0ZXJfaW5pdCgp
IHRoYXQgdGhlIGRhbWFnZSBjbGlwcyBzaG91bGQgYmUgaWdub3JlZC4NCj4+PiArICogSW4g
dGhhdCBjYXNlLCB0aGUgcmV0dXJuZWQgZGFtYWdlIHJlY3RhbmdsZSBpcyB0aGUgJmRybV9w
bGFuZV9zdGF0ZS5zcmMgc2luY2UNCj4+PiArICogYSBmdWxsIHBsYW5lIHVwZGF0ZSBzaG91
bGQgaGFwcGVuLg0KPj4+ICsgKg0KPj4+ICsgKiBGb3IgbW9yZSBpbmZvcm1hdGlvbiBhYm91
dCB0aGUgdHdvIHR5cGUgb2YgZGFtYWdlLCBzZWU6DQo+Pj4gKyAqIGh0dHBzOi8vcmVnaXN0
cnkua2hyb25vcy5vcmcvRUdML2V4dGVuc2lvbnMvS0hSL0VHTF9LSFJfc3dhcF9idWZmZXJz
X3dpdGhfZGFtYWdlLnR4dA0KPj4+ICsgKiBodHRwczovL2VtZXJzaW9uLmZyL2Jsb2cvMjAx
OS9pbnRyby10by1kYW1hZ2UtdHJhY2tpbmcvDQo+Pg0KPj4gT25lIHRob3VnaHQgeW91IG1p
Z2h0IHdhbnQgdG8gY29uc2lkZXIuDQo+Pg0KPj4gVGhlc2UgVVJMcyBhcmUgaGVscGZ1bC4g
VGhlIG9ubHkgaXNzdWUgSSBoYXZlIGlzIHRoYXQgZnJhbWUgZGFtYWdlIGFuZA0KPj4gYnVm
ZmVyIGRhbWFnZSBhcmUgdXNlci1zcGFjZSBjb25jZXB0cy4gVGhlIGtlcm5lbCBidWcgaXMg
dGhhdCBkYW1hZ2UNCj4+IGhhbmRsaW5nIGV4cGVjdHMgdGhlIGJhY2tpbmcgc3RvcmFnZS91
cGxvYWQgYnVmZmVyIG5vdCB0byBjaGFuZ2UgZm9yIGENCj4+IGdpdmVuIHBsYW5lLiBJZiB0
aGUgdXBsb2FkIGJ1ZmZlciBjaGFuZ2VzIGJldHdlZW4gcGFnZSBmbGlwcywgdGhlIG5ldw0K
Pj4gdXBsb2FkIGJ1ZmZlciBoYXMgdG8gYmUgdXBkYXRlZCBhcyBhIHdob2xlLiBIZW5jZSBu
byBkYW1hZ2UgaGFuZGxpbmcgdGhlbi4NCj4gDQo+IFdoeSB3b3VsZCB0aGVzZSBjb25jZXB0
cyBiZSBzcGVjaWZpYyB0byB1c2VyLXNwYWNlPyBUaGUga2VybmVsIGNvdWxkDQo+IGJldHRl
ciBoYW5kbGUgYnVmZmVyIGRhbWFnZSBpbnN0ZWFkIG9mIGZvcmNpbmcgZnVsbCBkYW1hZ2Us
IGJ5IGRvaW5nDQo+IHNvbWV0aGluZyBzaW1pbGFyIHRvIHdoYXQgdXNlci1zcGFjZSBkb2Vz
Lg0KDQpUaGUgdGVybXMgJ2ZyYW1lIGRhbWFnZScgYW5kICdidWZmZXIgZGFtYWdlJyBkbyBu
b3QgZXhpc3QgaW4gdGhlIGtlcm5lbC4gDQpUaGUgcHJvYmxlbSBjYW4gYmUgYmV0dGVyIGRl
c2NyaWJlZCBpbiB3b3JkaW5nIHRoYXQgaXMgY29tbW9uIHdpdGhpbiB0aGUgDQpjb250ZXh0
IG9mIHRoZSBrZXJuZWwgZHJpdmVycy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAN
Cj4gQW55d2F5czoNCj4gDQo+IFJldmlld2VkLWJ5OiBTaW1vbiBTZXIgPGNvbnRhY3RAZW1l
cnNpb24uZnI+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBE
ZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtl
bnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYs
IEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAz
NjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------FAxPyeJCEpBq2pc0UZBYK3X0--

--------------BFu4yPoixSFD0eeZ56uxGvmy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmVWDD8FAwAAAAAACgkQlh/E3EQov+Cc
ohAAzWDAxMwFNFf2+vs1r8YKhp7ZiVJjC5J8q29SbaQGLvEwUXuvyOgArxMBICd9d1SsNxfGEMuH
qA3H7gfFLCf3lwWKKkI5ILfjJRVNI2CSbOn3IYrieyJN94aGvf1zVwMdq434LD0d+SRnnobqUwAI
qi1WjI+eYIQUxBncO8bJsEQ2N2S6pPS7RvIr0H463L5JxXakyTSBJIl4Ix9XYJqSqADg0cunaRHK
B5gytLuo4ZbdyzKFWg5ekjxzuBNtIzdi1F6c0PZbfl82+1Yjb8GjhpYl7k7UVhHlna6Y3Jmcg/T4
/aUj3I20X78XMI80LAAvW2MgTIXNp16jlOqgYbVCGe9P3oNzBvUTu/eLwA5jbgatwy6oDAYXQECZ
//UuE1QaJ1hYs4eHyIcSkD8mZeFYoNTetJzngT6rrNKiGVkCocjWo7P1o9lA9YcJ1rfIJzj2gJnE
idO/CQf1ckTCT48Uz/q/Ba99qPvOmkB7joLnoowMS+pw8dhgr+zmg/AamZXQvH9sGRZ2BOebHeGW
V/izrVHito8YVw2GT/U6VeUMU8LnuCfiRpCyfGOyOEcBkaR6x1tuqjMkiGGY6lyawINwgQDNgc9F
ctTIEZiT7/Bm/hWEUO2mzdYm1PRspe5Yu4zWtIptUCMaSQk262quqcyyITmfI4IGtROKIwUjaML/
rsU=
=i491
-----END PGP SIGNATURE-----

--------------BFu4yPoixSFD0eeZ56uxGvmy--
