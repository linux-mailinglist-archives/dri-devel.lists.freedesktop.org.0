Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF7F838EF7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 13:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D07F910E194;
	Tue, 23 Jan 2024 12:57:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DADA10E194
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 12:57:23 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6FA71F790;
 Tue, 23 Jan 2024 12:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706014612; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=evOcmycrnSITroXX19gNuRs+qHceT7XDBbfE4b4Hy1A=;
 b=XiGIWUD6NR77cHpzbkqpX3ad/fIIKFOH8rWzzzAZuD4oPOetxidBDKBGEYOjstyszYXHDR
 JuoRHyaJwf1/YkO5VFtUDCsxIpWH++yJFn3114HncLfdMQpXktd4a9F60ABHwm7UyQJ4uJ
 VL52d7TYUw547CYtPhNIbavQPrTYQsY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706014612;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=evOcmycrnSITroXX19gNuRs+qHceT7XDBbfE4b4Hy1A=;
 b=Is3GE6ItFJyTT/gGbfAcFTuyp2KkhvyftHcJgo1UOG0YfeMb/MrUjubiMBcYlBfC9PO4MX
 onNqWzOe+uSewfCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706014611; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=evOcmycrnSITroXX19gNuRs+qHceT7XDBbfE4b4Hy1A=;
 b=wplGGrYZKw6Azx08wpXJCFmtTkUphbQ0z9Vjua83E4q5VXFY80jQMQzh0nwRzlckt71eLR
 su7XGpnHIcaVJUdx0lssCiTvDIP1oB7W7zLCYiA3vKmzPcjXccxyF9GkDEFnS9+7uD0mcd
 w5IDL7tMPfKX+KOzAZHc3WI0x2kTGSw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706014611;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=evOcmycrnSITroXX19gNuRs+qHceT7XDBbfE4b4Hy1A=;
 b=yWCyErdq3Abtxskv3VWXJQg+QME7QGMwnTSIHw0uooYbjOroIQ7l1Im8iY795StoIYJyw4
 x+rGLB1kN8PK8XDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8E3B313786;
 Tue, 23 Jan 2024 12:56:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id cAo5IZO3r2UWRgAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Tue, 23 Jan 2024 12:56:51 +0000
Message-ID: <a4fea690-b77c-4901-85bc-ae169a7805d6@suse.de>
Date: Tue, 23 Jan 2024 13:56:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/9] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-2-jfalempe@redhat.com>
 <d15c8fd1-a0f5-4dc9-8e8c-30a9200ef7fb@suse.de>
 <b3ac22f6-9553-491f-94c3-2d93474b87c0@redhat.com>
 <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>
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
In-Reply-To: <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XWyWijCwacGfACExAucTNES9"
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=wplGGrYZ;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=yWCyErdq
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-7.50 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 MIME_BASE64_TEXT(0.10)[]; RCPT_COUNT_SEVEN(0.00)[10];
 MX_GOOD(-0.01)[]; SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,ffwll.ch,verizon.net,tronnes.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[verizon.net];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DWL_DNSWL_LOW(-1.00)[suse.de:dkim];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -7.50
X-Rspamd-Queue-Id: D6FA71F790
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
--------------XWyWijCwacGfACExAucTNES9
Content-Type: multipart/mixed; boundary="------------a68TpMYInXmDmVJ2Zux4H4Oa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Cc: gpiccoli@igalia.com
Message-ID: <a4fea690-b77c-4901-85bc-ae169a7805d6@suse.de>
Subject: Re: [PATCH v7 1/9] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-2-jfalempe@redhat.com>
 <d15c8fd1-a0f5-4dc9-8e8c-30a9200ef7fb@suse.de>
 <b3ac22f6-9553-491f-94c3-2d93474b87c0@redhat.com>
 <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>
In-Reply-To: <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>

--------------a68TpMYInXmDmVJ2Zux4H4Oa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCkZZSSBmb3IgcG9pbnRzIDEgYW5kIDIsIEknbSB0eXBpbmcgdXAgYSBwYXRjaHNl
dCB0aGF0IGludHJvZHVjZXMgDQpkcm1fcGl4bWFwIGZvciB0aGUgc291cmNlIGJ1ZmZlci4g
SSdsbCBwb3N0IGl0IHdoZW4gSSBoYXZlIHNvbWV0aGluZyByZWFkeS4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KQW0gMTkuMDEuMjQgdW0gMTE6NTggc2NocmllYiBUaG9tYXMgWmlt
bWVybWFubjoNCj4gSGkNCj4gDQo+IEFtIDE3LjAxLjI0IHVtIDE3OjQwIHNjaHJpZWIgSm9j
ZWx5biBGYWxlbXBlOg0KPj4NCj4+DQo+PiBPbiAxNy8wMS8yMDI0IDE2OjA2LCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToNCj4+PiBIaQ0KPj4+DQo+Pj4gQW0gMDQuMDEuMjQgdW0gMTc6
MDAgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+Pj4+IFRoaXMgaXMgbmVlZGVkIGZvciBk
cm1fcGFuaWMsIHRvIGRyYXcgdGhlIGZvbnQsIGFuZCBmaWxsDQo+Pj4+IHRoZSBiYWNrZ3Jv
dW5kIGNvbG9yLCBpbiBtdWx0aXBsZSBjb2xvciBmb3JtYXQuDQo+Pj4NCj4+PiBUQkgsIEkg
ZG9uJ3QgbGlrZSB0aGlzIHBhdGNoIGF0IGFsbC4gSXQgbG9va3MgbGlrZSB5b3UncmUgDQo+
Pj4gcmVpbXBsZW1lbnRpbmcgZXhpc3RpbmcgZnVuY3Rpb25hbGl0eSBmb3IgYSBzaW5nbGUg
dXNlIGNhc2U7IA0KPj4+IHNwZWNpZmljYWxseSBkcm1fZmJfYmxpdCgpLg0KPj4+DQo+Pj4g
V2hhdCdzIHdyb25nIHdpdGggdGhlIGV4aXN0aW5nIGludGVyZmFjZXM/DQo+IA0KPiBJJ3Zl
IHNwZW5kIGNvbnNpZGVyYWJsZSB0aW1lIHRvIGNsZWFuIHVwIHRoZSBmb3JtYXQtaGVscGVy
IGNvZGUgYW5kIGdldCANCj4gaXQgaW50byBzaGFwZS4gSXQncyBub3QgdGhlcmUgeWV0LCBi
dXQgb24gaXRzIHdheS4gU28gSSdkIHJhdGhlciBwcmVmZXIgDQo+IHRvIHVwZGF0ZSB0aGUg
ZXhpc3RpbmcgY29kZSBmb3IgbmV3IHVzZSBjYXNlcy4gQWRkaW5nIGEgbmV3IGludGVyZmFj
ZSANCj4gZm9yIGEgc2luZ2xlIHVzZSBjYXNlIGlzIHNvbWV0aGluZyBsaWtlIGEgbGVhcCBi
YWNrd2FyZHMuDQo+IA0KPiBTbyBsZXQncyBzZWUgaWYgd2UgY2FuIHdvcmsgb3V0IHNvbWV0
aGluZy4NCj4gDQo+Pg0KPj4gZHJtX2ZiX2JsaXQoKSBpcyBnb29kIHRvIGNvcHkgYSBmcmFt
ZWJ1ZmZlciB0byBhbm90aGVyLCBidXQgaXMgY2xlYXJseSANCj4+IHVub3B0aW1hbCB0byBk
cmF3IGZvbnQuDQo+IA0KPiAxKSBUaGUgZnJhbWVidWZmZXIgZGF0YSBzdHJ1Y3R1cmUgaXMg
b25seSB0aGVyZSBmb3IgaGlzdG9yaWNhbCByZWFzb25zLiANCj4gSXQgc2hvdWxkIGJlIHJl
bW92ZWQgZnJvbSB0aGUgaW50ZXJuYWwgaW1wbGVtZW50YXRpb24gZW50aXJlbHkuIEEgZmly
c3QgDQo+IHBhdGNoIHNob3VsZCBnbyBpbnRvIHRoaXMgaW4gYW55IGNhc2UuIEl0IGRpZG4n
dCBoYXBwZW5lZCBzbyBmYXIsIGFzIA0KPiBJJ3ZlIGJlZW4gYnVzeSB3aXRoIG90aGVyIHdv
cmsuDQo+IA0KPiAyKSBGb3IgdGhlIHB1YmxpYyBBUEksIEkndmUgbG9uZyB3YW50ZWQgdG8g
cmVwbGFjZSBmcmFtZWJ1ZmZlcnMgd2l0aCANCj4gc29tZXRoaW5nIG1vcmUgZmxleGlibGUs
IGxldCdzIGNhbGwgaXQgZHJtX3BpeG1hcA0KPiANCj4gIMKgIHN0cnVjdCBkcm1fcGl4bWFw
IHsNCj4gIMKgwqDCoCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpmb3JtYXQNCj4gIMKgwqDC
oCB1bnNpZ25lZCBpbnQgd2lkdGgsIGhlaWdodA0KPiAgwqDCoMKgIHVuc2lnbmVkIGludCBw
aXRjaGVzW0RSTV9GT1JNQVRfTUFYX1BMQU5FU10NCj4gIMKgwqDCoCBpb21hcCB2YWRkcltE
Uk1fRk9STUFUX01BWF9QTEFORVNdDQo+ICDCoCB9Ow0KPiANCj4gSXQncyB0aGUgZXNzZW5j
ZSBvZiBkcm1fZnJhbWVidWZmZXIuIExldCdzIHNheSB0aGVyZSdzIGFsc28gYW4gaW5pdCAN
Cj4gaGVscGVyIGRybV9waXhtYXBfaW5pdF9mcm9tX2ZyYW1lYnVmZmVyKHBpeCwgZmIpIHRo
YXQgc2V0cyB1cCANCj4gZXZlcnl0aGluZy4gVGhlIGltcGxlbWVudGF0aW9uIG9mIGRybV9m
Yl9ibGl0KCkgd291bGQgbG9vayBsaWtlIHRoaXM6DQo+IA0KPiAgwqAgZHJtX2ZiX2JsaXQo
Li4uKSB7DQo+IA0KPiAgwqDCoMKgwqBkcm1fcGl4bWFwIHBpeDsNCj4gIMKgwqDCoMKgZHJt
X3BpeG1hcF9pbml0X2Zyb21fZnJhbWVidWZmZXIocGl4LCBmYikNCj4gIMKgwqDCoMKgX19k
cm1fZmJfYmxpdF9waXhtYXAoIDxsaWtlIGRybV9mYl9ibGl0KCkgYnV0IHdpdGggYSBwaXht
YXA+ICkNCj4gIMKgIH0NCj4gDQo+IFRoYXQgd291bGQgcmVxdWlyZSBzb21lIGNoYW5nZXMg
dG8gZHJpdmVycywgYnV0IGl0J3Mgb25seSBzaW1wbGUgDQo+IHJlZmFjdG9yaW5nLg0KPiAN
Cj4gMykgV2hlbiBsb29raW5nIGF0IHlvdXIgcGF0Y2gsIHRoZXJlJ3MNCj4gDQo+ICDCoCBz
cmMgPSBmb250LT5kYXRhICsgKG1zZy0+dHh0W2ldICogZm9udC0+aGVpZ2h0KSAqIHNyY19z
dHJpZGU7DQo+IA0KPiB3aGljaCBzaG91bGQgYmUgaW4gYSBoZWxwZXIgdGhhdCBzZXRzIHVw
IHRoZSBkcm1fcGl4bWFwIGZvciBhIGZvbnQgDQo+IGNoYXJhY3RlcjoNCj4gDQo+ICDCoCBk
cm1fcGl4bWFwX2luaXRfZnJvbV9jaGFyKHBpeG1hcCwgYywgZm9udF9kYXRhKQ0KPiANCj4g
d2hlcmUgJ2MnIGVxdWFscyBtc2ctPnR4dFtpXQ0KPiANCj4gVGhlIHRleHQgZHJhd2luZyBp
biB0aGUgcGFuaWMgaGFuZGxlciB3b3VsZCBkbyBzb21ldGhpbmcgbGlrZQ0KPiANCj4gIMKg
IGZvciAobXNnLT50eHRbaV0pIHsNCj4gIMKgwqDCoMKgZHJtX3BpeG1hcF9pbml0X2Zyb21f
Y2hhcihwaXhtYXAsIC4uLikNCj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fZmJfYmxpdF9w
aXhtYXAoLi4uKQ0KPiAgwqAgfQ0KPiANCj4gDQo+PiBJdCBoYW5kbGVzIHhyZ2I4ODg4IHRv
IGFueSByZ2IgZm9ybWF0LCBhbmQgSSBuZWVkIG1vbm9jaHJvbWUgdG8gYW55IA0KPj4gcmdi
IGZvcm1hdC4NCj4gDQo+IDQpIFlvdSdyZSBmcmVlIHRvIGFkZCBhbnkgY29udmVyc2lvbiB0
byBkcm1fZmJfYmxpdCgpLiBJdCdzIHN1cHBvc2VkIHRvIA0KPiBoYW5kbGUgYWxsIGF2YWls
YWJsZSBmb3JtYXQgY29udmVyc2lvbi4gV2l0aCB0aGUgcGl4bWFwLXJlbGF0ZWQgY2hhbmdl
cyANCj4gb3V0bGluZWQgYWJvdmUgYW5kIHRoZSBhY3R1YWwgY29udmVyc2lvbiBjb2RlLCBJ
IHRoaW5rIHRoYXQgd291bGQgDQo+IGFscmVhZHkgcHV0IGNoYXJhY3RlcnMgb24gdGhlIHNj
cmVlbi4NCj4gDQo+PiBJIG5lZWQgdG8gY29udmVydCBmb3JlZ3JvdW5kIGFuZCBiYWNrZ3Jv
dW5kIGNvbG9yIHRvIHRoZSBkZXN0aW5hdGlvbiANCj4+IGZvcm1hdCwgYnV0IHVzaW5nIGRy
bV9mYl9ibGl0KCkgdG8gY29udmVydCAxIHBpeGVsIGlzIHRlZGlvdXMuDQo+IA0KPiA1KSBJ
J3ZlIHJlY2VudGx5IGFkZGVkIGRybV9mb3JtYXRfY29udl9zdGF0ZSB0byB0aGUgQVBJLiBJ
dCBpcyBzdXBwb3NlZCANCj4gdG8gaG9sZCBzdGF0ZSB0aGF0IGlzIHJlcXVpcmVkIGZvciB0
aGUgY29udmVyc2lvbiBwcm9jZXNzLiBJIA0KPiBzcGVjaWZpY2FsbHkgaGFkIGNvbG9yIHBh
bGV0dGVzIGluIG1pbmQuIFBsZWFzZSB1c2UgdGhlIGRhdGEgc3RydWN0dXJlLiANCj4gU29t
ZXRoaW5nIGxpa2UgdGhhdDoNCj4gDQo+ICDCoCBzdHJ1Y3QgZHJtX2Zvcm1hdF9jb252X3N0
YXRlIHsNCj4gIMKgwqDCoMKgLi4uDQo+ICDCoMKgwqDCoGNvbnN0IGRybV9jb2xvcl9sdXQg
KnBhbGV0dGU7DQo+ICDCoCB9DQo+IA0KPiBhbmQgaW4gdGhlIGNvbnZlcnNpb24gY29kZToN
Cj4gDQo+ICDCoCB2b2lkIHIxX3RvX3JnYigpIHsNCj4gIMKgwqDCoMKgZm9yICh4IDwgcGl4
ZWxzKSB7DQo+ICDCoMKgwqDCoMKgwqDCoCByZ2IgPSBzdGF0ZS0+cGFsZXR0ZVtyMV0NCj4g
IMKgwqDCoMKgfQ0KPiAgwqAgfQ0KPiANCj4+DQo+PiBJdCBhbHNvIHJlcXVpcmVzIGFuIGFk
ZGl0aW9uYWwgbWVtb3J5IGJ1ZmZlciwgYW5kIGRvIGFuIGFkZGl0aW9uYWwgDQo+PiBtZW1v
cnkgY29weSB0aGF0IHdlIGRvbid0IG5lZWQgYXQgYWxsLg0KPiANCj4gNikgVGhhdCBtZW1j
cHlfdG9faW8oKSBub3QgYSBiaWcgZGVhbC4gWW91IHNob3VsZCBwcmUtYWxsb2NhdGUgdGhh
dCANCj4gbWVtb3J5IGJ1ZmZlciBpbiB0aGUgcGFuaWMgaGFuZGxlciBhbmQgaW5pdCB0aGUg
ZHJtX2Zvcm1hdF9jb252X3N0YXRlIA0KPiB3aXRoIERSTV9GT1JNQVRfQ09OVl9TVEFURV9J
TklUX1BSRUFMTE9DQVRFRCgpLg0KPiANCj4+DQo+PiBJdCBhbHNvIGhhcyBubyB3YXkgdG8g
ZmlsbCBhIHJlZ2lvbiB3aXRoIHRoZSBiYWNrZ3JvdW5kIGNvbG9yLg0KPiANCj4gNykgUGxl
YXNlIGFkZCBhIHNlcGFyYXRlIGRybV9mYl9maWxsKCkgaW1wbGVtZW50YXRpb24uIElmIHlv
dSBoYXZlIGEgDQo+IHBhbGV0dGUgaW4gc3RydWN0IGRybV9mb3JtYXRfY29uZl9zdGF0ZSwg
eW91IGNhbiBhZGQgYSBoZWxwZXIgZm9yIGVhY2ggDQo+IGRlc3RpbmF0aW9uIGZvcm1hdCB0
aGF0IHRha2VzIGEgZHJtX2NvbG9yX2x1dCB2YWx1ZSBhcyBpbnB1dC4NCj4gDQo+IFRoaXMg
cG9pbnQgaXMgcHJvYmFibHkgd29ydGggYSBzZXBhcmF0ZSBkaXNjdXNzaW9uLg0KPiANCj4+
DQo+PiBUaGUgbGFzdCB0aGluZywgaXMgaWYgSSBwbGFuIHRvIGFkZCBZVVYgc3VwcG9ydCwg
d2l0aCB0aGlzIA0KPj4gaW1wbGVtZW50YXRpb24sIEkgb25seSBuZWVkIHRvIHdyaXRlIG9u
ZSBmdW5jdGlvbiB0aGF0IGNvbnZlcnQgb25lIA0KPj4gcGl4ZWwuIE90aGVyd2lzZSBJIHdv
dWxkIG5lZWQgdG8gYWRkIHRoZSBkcm1fZmJfcjFfdG9feXV2eHh4X2xpbmUoKSANCj4+IGFu
ZCBkcm1fZmJfcjFfdG9feXV2eHh4eCgpIGJvaWxlcnBsYXRlLg0KPiANCj4gOCkgWVVWcyBh
cmUgbXVsdGktcGxhbmUgZm9ybWF0cyBJSVJDLiBTbyBpdCdzIGxpa2VseSBhIGJpdCBtb3Jl
IA0KPiBjb21wbGljYXRlZC5BbmQgSSdtIG5vdCBhd2FyZSBvZiBhbnkgY3VycmVudCB1c2Ug
Y2FzZSBmb3IgWVVWLiBJZiB0aGUgDQo+IGZyYW1lYnVmZmVyIGNvbnNvbGUgZG9lc24ndCBz
dXBwb3J0IGl0LCB0aGUgcGFuaWMgaGVscGVyIHByb2JhYmx5IHdvbid0IA0KPiBlaXRoZXIu
DQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gVGhvbWFzDQo+IA0KPj4NCj4+IEJlc3QgcmVnYXJk
cywNCj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5r
ZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2
LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIg
MzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------a68TpMYInXmDmVJ2Zux4H4Oa--

--------------XWyWijCwacGfACExAucTNES9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWvt5MFAwAAAAAACgkQlh/E3EQov+Bg
Sw//fq/OfTBQZP2t/PNKARCPrvkUpT2ZvsLUFMia/rgmS1/NVlFXF+qe8//lXYdKgwVO5pPrtRlG
yMw3/yfMVDzeYq1JQeHqNVT7pBBvEJcHxmuWDthUX6jz1onivb9njJnpNhjwawBJDQX+F6fQwRZs
TMJmVY+EC3YLvgo+s/tKDOnuYcSfKic6O4B5Hr27T0CsRHIHLyexJNkvQ2Jqa9TmdwuCKrQUM4E/
p4hMhuZtFj628OKeFKAyfHB5RMfkat8NwuSCVf1ZVqKynnh6EYgS+M8NXLu6tv1aSZ4VaYuRuwJ0
udhjfOhwVOl34lCHqfi2Mh9kZ/Rs5pRgjAOCZ5M1F4UHoQjI/D33ryhYL56CPOoYabRfCBC5Rs9G
IN0wh4KZg3UJBjAKtLGaGMe/9gZP5s41s72/7dZ2sY4OmrcLitrNF9mKMiLK6EucqTFtAf7pxra8
JHCBXIGidFO4EOQCbJ8H8Hky296i8B0ROyP3SM3Bo8wG7zWhAwNOx9nQXxzNONcoZC8lFSYiNbFo
frX7oX+iNlKtpRgzya9IOfNvNkp/s0wzIwsfFGN6lEdvC2IlT6GGyWXzPrOtk4uakpQwfGNurCWC
QuE7b7OBB3xk5eTeW06rLYGeEVN3GIqigL+V+ZsyWy9m3Vkbmvh5UC0qKB4Cl7C+8sy/og6+pWI2
BSk=
=9ey4
-----END PGP SIGNATURE-----

--------------XWyWijCwacGfACExAucTNES9--
