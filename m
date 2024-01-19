Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D41E83283E
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 11:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EB610E0AD;
	Fri, 19 Jan 2024 10:58:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13CEC10E9BD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 10:58:44 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 610A61F7ED;
 Fri, 19 Jan 2024 10:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705661919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iReHAa2dJoyZee8mzz0V0FwAlkIOzImoHYpH27U7yNE=;
 b=OrykiXxTABBGvSSwI9lAeh0Ck34jqG+j9IuZP1nUT/EMHUp8KDIvjByzABgGh/kGs/GK2e
 ahG42FcTqBDtcZr3f6+/Wf0MY6gEwU25ENKzLwmhJwPeBlDut8FTGyu09iqs5IVP1U0u1h
 mWG9fg+3iq0TMe+hLoqGhnAjs4R21CM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705661919;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iReHAa2dJoyZee8mzz0V0FwAlkIOzImoHYpH27U7yNE=;
 b=q4TPlItVKnKeBT73i2GokiRwtomaiVbGQVzN2RtGJUBJBVgFYQ+XwB2+Myy4J1P3Dno5J9
 J3S31uuR6+yBgxCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705661919; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iReHAa2dJoyZee8mzz0V0FwAlkIOzImoHYpH27U7yNE=;
 b=OrykiXxTABBGvSSwI9lAeh0Ck34jqG+j9IuZP1nUT/EMHUp8KDIvjByzABgGh/kGs/GK2e
 ahG42FcTqBDtcZr3f6+/Wf0MY6gEwU25ENKzLwmhJwPeBlDut8FTGyu09iqs5IVP1U0u1h
 mWG9fg+3iq0TMe+hLoqGhnAjs4R21CM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705661919;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iReHAa2dJoyZee8mzz0V0FwAlkIOzImoHYpH27U7yNE=;
 b=q4TPlItVKnKeBT73i2GokiRwtomaiVbGQVzN2RtGJUBJBVgFYQ+XwB2+Myy4J1P3Dno5J9
 J3S31uuR6+yBgxCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1CE3D136F5;
 Fri, 19 Jan 2024 10:58:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id XKm8Bd9VqmUtbwAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Fri, 19 Jan 2024 10:58:39 +0000
Message-ID: <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>
Date: Fri, 19 Jan 2024 11:58:38 +0100
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
In-Reply-To: <b3ac22f6-9553-491f-94c3-2d93474b87c0@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZRJRDWoDxotRkPykYRatXWCh"
Authentication-Results: smtp-out2.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -5.29
X-Spamd-Result: default: False [-5.29 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 FREEMAIL_ENVRCPT(0.00)[verizon.net];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; NEURAL_HAM_LONG(-1.00)[-1.000];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; BAYES_HAM(-3.00)[100.00%];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-0.996]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[10]; SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,ffwll.ch,verizon.net,tronnes.org];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
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
--------------ZRJRDWoDxotRkPykYRatXWCh
Content-Type: multipart/mixed; boundary="------------rxntju1TQ0sfrw65OSwieDrX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Cc: gpiccoli@igalia.com
Message-ID: <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>
Subject: Re: [PATCH v7 1/9] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-2-jfalempe@redhat.com>
 <d15c8fd1-a0f5-4dc9-8e8c-30a9200ef7fb@suse.de>
 <b3ac22f6-9553-491f-94c3-2d93474b87c0@redhat.com>
In-Reply-To: <b3ac22f6-9553-491f-94c3-2d93474b87c0@redhat.com>

--------------rxntju1TQ0sfrw65OSwieDrX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDEuMjQgdW0gMTc6NDAgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IA0KPiANCj4gT24gMTcvMDEvMjAyNCAxNjowNiwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6
DQo+PiBIaQ0KPj4NCj4+IEFtIDA0LjAxLjI0IHVtIDE3OjAwIHNjaHJpZWIgSm9jZWx5biBG
YWxlbXBlOg0KPj4+IFRoaXMgaXMgbmVlZGVkIGZvciBkcm1fcGFuaWMsIHRvIGRyYXcgdGhl
IGZvbnQsIGFuZCBmaWxsDQo+Pj4gdGhlIGJhY2tncm91bmQgY29sb3IsIGluIG11bHRpcGxl
IGNvbG9yIGZvcm1hdC4NCj4+DQo+PiBUQkgsIEkgZG9uJ3QgbGlrZSB0aGlzIHBhdGNoIGF0
IGFsbC4gSXQgbG9va3MgbGlrZSB5b3UncmUgDQo+PiByZWltcGxlbWVudGluZyBleGlzdGlu
ZyBmdW5jdGlvbmFsaXR5IGZvciBhIHNpbmdsZSB1c2UgY2FzZTsgDQo+PiBzcGVjaWZpY2Fs
bHkgZHJtX2ZiX2JsaXQoKS4NCj4+DQo+PiBXaGF0J3Mgd3Jvbmcgd2l0aCB0aGUgZXhpc3Rp
bmcgaW50ZXJmYWNlcz8NCg0KSSd2ZSBzcGVuZCBjb25zaWRlcmFibGUgdGltZSB0byBjbGVh
biB1cCB0aGUgZm9ybWF0LWhlbHBlciBjb2RlIGFuZCBnZXQgDQppdCBpbnRvIHNoYXBlLiBJ
dCdzIG5vdCB0aGVyZSB5ZXQsIGJ1dCBvbiBpdHMgd2F5LiBTbyBJJ2QgcmF0aGVyIHByZWZl
ciANCnRvIHVwZGF0ZSB0aGUgZXhpc3RpbmcgY29kZSBmb3IgbmV3IHVzZSBjYXNlcy4gQWRk
aW5nIGEgbmV3IGludGVyZmFjZSANCmZvciBhIHNpbmdsZSB1c2UgY2FzZSBpcyBzb21ldGhp
bmcgbGlrZSBhIGxlYXAgYmFja3dhcmRzLg0KDQpTbyBsZXQncyBzZWUgaWYgd2UgY2FuIHdv
cmsgb3V0IHNvbWV0aGluZy4NCg0KPiANCj4gZHJtX2ZiX2JsaXQoKSBpcyBnb29kIHRvIGNv
cHkgYSBmcmFtZWJ1ZmZlciB0byBhbm90aGVyLCBidXQgaXMgY2xlYXJseSANCj4gdW5vcHRp
bWFsIHRvIGRyYXcgZm9udC4NCg0KMSkgVGhlIGZyYW1lYnVmZmVyIGRhdGEgc3RydWN0dXJl
IGlzIG9ubHkgdGhlcmUgZm9yIGhpc3RvcmljYWwgcmVhc29ucy4gDQpJdCBzaG91bGQgYmUg
cmVtb3ZlZCBmcm9tIHRoZSBpbnRlcm5hbCBpbXBsZW1lbnRhdGlvbiBlbnRpcmVseS4gQSBm
aXJzdCANCnBhdGNoIHNob3VsZCBnbyBpbnRvIHRoaXMgaW4gYW55IGNhc2UuIEl0IGRpZG4n
dCBoYXBwZW5lZCBzbyBmYXIsIGFzIA0KSSd2ZSBiZWVuIGJ1c3kgd2l0aCBvdGhlciB3b3Jr
Lg0KDQoyKSBGb3IgdGhlIHB1YmxpYyBBUEksIEkndmUgbG9uZyB3YW50ZWQgdG8gcmVwbGFj
ZSBmcmFtZWJ1ZmZlcnMgd2l0aCANCnNvbWV0aGluZyBtb3JlIGZsZXhpYmxlLCBsZXQncyBj
YWxsIGl0IGRybV9waXhtYXANCg0KICAgc3RydWN0IGRybV9waXhtYXAgew0KICAgICBzdHJ1
Y3QgZHJtX2Zvcm1hdF9pbmZvICpmb3JtYXQNCiAgICAgdW5zaWduZWQgaW50IHdpZHRoLCBo
ZWlnaHQNCiAgICAgdW5zaWduZWQgaW50IHBpdGNoZXNbRFJNX0ZPUk1BVF9NQVhfUExBTkVT
XQ0KICAgICBpb21hcCB2YWRkcltEUk1fRk9STUFUX01BWF9QTEFORVNdDQogICB9Ow0KDQpJ
dCdzIHRoZSBlc3NlbmNlIG9mIGRybV9mcmFtZWJ1ZmZlci4gTGV0J3Mgc2F5IHRoZXJlJ3Mg
YWxzbyBhbiBpbml0IA0KaGVscGVyIGRybV9waXhtYXBfaW5pdF9mcm9tX2ZyYW1lYnVmZmVy
KHBpeCwgZmIpIHRoYXQgc2V0cyB1cCANCmV2ZXJ5dGhpbmcuIFRoZSBpbXBsZW1lbnRhdGlv
biBvZiBkcm1fZmJfYmxpdCgpIHdvdWxkIGxvb2sgbGlrZSB0aGlzOg0KDQogICBkcm1fZmJf
YmxpdCguLi4pIHsNCg0KCWRybV9waXhtYXAgcGl4Ow0KCWRybV9waXhtYXBfaW5pdF9mcm9t
X2ZyYW1lYnVmZmVyKHBpeCwgZmIpDQoJX19kcm1fZmJfYmxpdF9waXhtYXAoIDxsaWtlIGRy
bV9mYl9ibGl0KCkgYnV0IHdpdGggYSBwaXhtYXA+ICkNCiAgIH0NCg0KVGhhdCB3b3VsZCBy
ZXF1aXJlIHNvbWUgY2hhbmdlcyB0byBkcml2ZXJzLCBidXQgaXQncyBvbmx5IHNpbXBsZSAN
CnJlZmFjdG9yaW5nLg0KDQozKSBXaGVuIGxvb2tpbmcgYXQgeW91ciBwYXRjaCwgdGhlcmUn
cw0KDQogICBzcmMgPSBmb250LT5kYXRhICsgKG1zZy0+dHh0W2ldICogZm9udC0+aGVpZ2h0
KSAqIHNyY19zdHJpZGU7DQoNCndoaWNoIHNob3VsZCBiZSBpbiBhIGhlbHBlciB0aGF0IHNl
dHMgdXAgdGhlIGRybV9waXhtYXAgZm9yIGEgZm9udCANCmNoYXJhY3RlcjoNCg0KICAgZHJt
X3BpeG1hcF9pbml0X2Zyb21fY2hhcihwaXhtYXAsIGMsIGZvbnRfZGF0YSkNCg0Kd2hlcmUg
J2MnIGVxdWFscyBtc2ctPnR4dFtpXQ0KDQpUaGUgdGV4dCBkcmF3aW5nIGluIHRoZSBwYW5p
YyBoYW5kbGVyIHdvdWxkIGRvIHNvbWV0aGluZyBsaWtlDQoNCiAgIGZvciAobXNnLT50eHRb
aV0pIHsNCglkcm1fcGl4bWFwX2luaXRfZnJvbV9jaGFyKHBpeG1hcCwgLi4uKQ0KICAgICAg
IAlkcm1fZmJfYmxpdF9waXhtYXAoLi4uKQ0KICAgfQ0KDQoNCj4gSXQgaGFuZGxlcyB4cmdi
ODg4OCB0byBhbnkgcmdiIGZvcm1hdCwgYW5kIEkgbmVlZCBtb25vY2hyb21lIHRvIGFueSBy
Z2IgDQo+IGZvcm1hdC4NCg0KNCkgWW91J3JlIGZyZWUgdG8gYWRkIGFueSBjb252ZXJzaW9u
IHRvIGRybV9mYl9ibGl0KCkuIEl0J3Mgc3VwcG9zZWQgdG8gDQpoYW5kbGUgYWxsIGF2YWls
YWJsZSBmb3JtYXQgY29udmVyc2lvbi4gV2l0aCB0aGUgcGl4bWFwLXJlbGF0ZWQgY2hhbmdl
cyANCm91dGxpbmVkIGFib3ZlIGFuZCB0aGUgYWN0dWFsIGNvbnZlcnNpb24gY29kZSwgSSB0
aGluayB0aGF0IHdvdWxkIA0KYWxyZWFkeSBwdXQgY2hhcmFjdGVycyBvbiB0aGUgc2NyZWVu
Lg0KDQo+IEkgbmVlZCB0byBjb252ZXJ0IGZvcmVncm91bmQgYW5kIGJhY2tncm91bmQgY29s
b3IgdG8gdGhlIGRlc3RpbmF0aW9uIA0KPiBmb3JtYXQsIGJ1dCB1c2luZyBkcm1fZmJfYmxp
dCgpIHRvIGNvbnZlcnQgMSBwaXhlbCBpcyB0ZWRpb3VzLg0KDQo1KSBJJ3ZlIHJlY2VudGx5
IGFkZGVkIGRybV9mb3JtYXRfY29udl9zdGF0ZSB0byB0aGUgQVBJLiBJdCBpcyBzdXBwb3Nl
ZCANCnRvIGhvbGQgc3RhdGUgdGhhdCBpcyByZXF1aXJlZCBmb3IgdGhlIGNvbnZlcnNpb24g
cHJvY2Vzcy4gSSANCnNwZWNpZmljYWxseSBoYWQgY29sb3IgcGFsZXR0ZXMgaW4gbWluZC4g
UGxlYXNlIHVzZSB0aGUgZGF0YSBzdHJ1Y3R1cmUuIA0KU29tZXRoaW5nIGxpa2UgdGhhdDoN
Cg0KICAgc3RydWN0IGRybV9mb3JtYXRfY29udl9zdGF0ZSB7DQoJLi4uDQoJY29uc3QgZHJt
X2NvbG9yX2x1dCAqcGFsZXR0ZTsNCiAgIH0NCg0KYW5kIGluIHRoZSBjb252ZXJzaW9uIGNv
ZGU6DQoNCiAgIHZvaWQgcjFfdG9fcmdiKCkgew0KCWZvciAoeCA8IHBpeGVscykgew0KCQly
Z2IgPSBzdGF0ZS0+cGFsZXR0ZVtyMV0NCgl9DQogICB9DQoNCj4gDQo+IEl0IGFsc28gcmVx
dWlyZXMgYW4gYWRkaXRpb25hbCBtZW1vcnkgYnVmZmVyLCBhbmQgZG8gYW4gYWRkaXRpb25h
bCANCj4gbWVtb3J5IGNvcHkgdGhhdCB3ZSBkb24ndCBuZWVkIGF0IGFsbC4NCg0KNikgVGhh
dCBtZW1jcHlfdG9faW8oKSBub3QgYSBiaWcgZGVhbC4gWW91IHNob3VsZCBwcmUtYWxsb2Nh
dGUgdGhhdCANCm1lbW9yeSBidWZmZXIgaW4gdGhlIHBhbmljIGhhbmRsZXIgYW5kIGluaXQg
dGhlIGRybV9mb3JtYXRfY29udl9zdGF0ZSANCndpdGggRFJNX0ZPUk1BVF9DT05WX1NUQVRF
X0lOSVRfUFJFQUxMT0NBVEVEKCkuDQoNCj4gDQo+IEl0IGFsc28gaGFzIG5vIHdheSB0byBm
aWxsIGEgcmVnaW9uIHdpdGggdGhlIGJhY2tncm91bmQgY29sb3IuDQoNCjcpIFBsZWFzZSBh
ZGQgYSBzZXBhcmF0ZSBkcm1fZmJfZmlsbCgpIGltcGxlbWVudGF0aW9uLiBJZiB5b3UgaGF2
ZSBhIA0KcGFsZXR0ZSBpbiBzdHJ1Y3QgZHJtX2Zvcm1hdF9jb25mX3N0YXRlLCB5b3UgY2Fu
IGFkZCBhIGhlbHBlciBmb3IgZWFjaCANCmRlc3RpbmF0aW9uIGZvcm1hdCB0aGF0IHRha2Vz
IGEgZHJtX2NvbG9yX2x1dCB2YWx1ZSBhcyBpbnB1dC4NCg0KVGhpcyBwb2ludCBpcyBwcm9i
YWJseSB3b3J0aCBhIHNlcGFyYXRlIGRpc2N1c3Npb24uDQoNCj4gDQo+IFRoZSBsYXN0IHRo
aW5nLCBpcyBpZiBJIHBsYW4gdG8gYWRkIFlVViBzdXBwb3J0LCB3aXRoIHRoaXMgDQo+IGlt
cGxlbWVudGF0aW9uLCBJIG9ubHkgbmVlZCB0byB3cml0ZSBvbmUgZnVuY3Rpb24gdGhhdCBj
b252ZXJ0IG9uZSANCj4gcGl4ZWwuIE90aGVyd2lzZSBJIHdvdWxkIG5lZWQgdG8gYWRkIHRo
ZSBkcm1fZmJfcjFfdG9feXV2eHh4X2xpbmUoKSBhbmQgDQo+IGRybV9mYl9yMV90b195dXZ4
eHh4KCkgYm9pbGVycGxhdGUuDQoNCjgpIFlVVnMgYXJlIG11bHRpLXBsYW5lIGZvcm1hdHMg
SUlSQy4gU28gaXQncyBsaWtlbHkgYSBiaXQgbW9yZSANCmNvbXBsaWNhdGVkLkFuZCBJJ20g
bm90IGF3YXJlIG9mIGFueSBjdXJyZW50IHVzZSBjYXNlIGZvciBZVVYuIElmIHRoZSANCmZy
YW1lYnVmZmVyIGNvbnNvbGUgZG9lc24ndCBzdXBwb3J0IGl0LCB0aGUgcGFuaWMgaGVscGVy
IHByb2JhYmx5IHdvbid0IA0KZWl0aGVyLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpH
RjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBN
b2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------rxntju1TQ0sfrw65OSwieDrX--

--------------ZRJRDWoDxotRkPykYRatXWCh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWqVd4FAwAAAAAACgkQlh/E3EQov+Dd
NA//bMXtmVtoD/I82LBhzihPXnzrmmQoKrNiUGVWeXU0/ntITJxsToTORE5VjRCINvsVVu1TVYmX
GAbwk1nCRCessr+7XBg0RnJtM0MoB4Q2Ro71i+Z+u2Lvsmkl5FJkLpI8F3sbgTVAxVOfLZgjYOgr
PJMzC1vEEtRWnAA5jwL7/hMpWSGAGRskahiGuU9SkvG5RHOMYBPL1BwxTexb3ygVakyacDhJo8HF
zXmOkQbM3nbjHLiyUHE09n6PsZ03/fMIqjV6Y4FdKA+fZu5XzPRq7SQM/B4GcvcU64Yp3EYpvyw7
/9LSES7I70AYhTzJjrAGt2gf3rVxCHKNMzksJBz4kDUS7shacBJgba8Rd5RhLkGX2BTeLcrpUtHx
i6uhxjahmwkN44qJ0iOLbTK7zW9jG1xEeBWsxm3EqQh/3RI5jAsq+KmWxAYzjkzdbyYCQbqFQ+wM
LIX13rk+7M2W51nxsSiSuvNdoPz/B4Z5qPz/hHNYsK413fdXU6jJaZjG0yS6rjcdaRPLnntwD1vP
y9gDtF1kEh/f1pWpENx+xks1Hh2Ihx8ldtNyUW54JHucntkgmF0/rr1OuUr1YPehwmXSD5opDqmO
56K8Pcgey58eJ2LKc1ksewqMv8PBFSkAu6zL8TA5dtCZHvnGkoxFfPPPT5DgHyviyHiNpJIKZi5P
qU0=
=bRzA
-----END PGP SIGNATURE-----

--------------ZRJRDWoDxotRkPykYRatXWCh--
