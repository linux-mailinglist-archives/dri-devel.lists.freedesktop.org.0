Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8814830A07
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 16:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E984F10E11F;
	Wed, 17 Jan 2024 15:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A07610E11F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 15:50:00 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CBD5E1FCD7;
 Wed, 17 Jan 2024 15:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705506568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ld9SKAihByMdAY0k0FnXoEjnja7XtU0aoNCyLbj8sSY=;
 b=rLHVHEiP/iM+9hn7wAB/GS5OTN3eFxc6X0VtNrH0v0vN7KNtGVH07kXMJ01jEZ42F1rSkM
 OVX2rEkEjod0QuCjXj/xVUrpfaGQTG/fRYO52tS98c54Orh9wnqp6YAJzxXZ68tu34b/wF
 MdetnLgpKNFs5YmBoyQSKO2YKDGkFLQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705506568;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ld9SKAihByMdAY0k0FnXoEjnja7XtU0aoNCyLbj8sSY=;
 b=MGh7SNrTAC2/I7i95+/MyP4dkT4n6psEHqE59bUXw9K60YPcYZquVOR1FVmbYUotszZMyQ
 Js5cPoH0Y/FvwKDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1705506567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ld9SKAihByMdAY0k0FnXoEjnja7XtU0aoNCyLbj8sSY=;
 b=IOX5ZgboQebCkAnHkIGNgWgZZe628ebKS6xX1HyCKW74v33ymUbkump9NaDZmjQzF85gfp
 l9rUVIFdOCko1l/HcbmO+hvbvP1Fial64JE1xEZGHjrO5+i6sPL6X2nL6WSux6Y0Ge0DMp
 arFpz0chRgIT/etzv6hY26YP3AQlQSY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1705506567;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=Ld9SKAihByMdAY0k0FnXoEjnja7XtU0aoNCyLbj8sSY=;
 b=tX9ABbqnqCGMckmdMZY5U61NRYBzt5QWfAh1tT6vgvcNoZy8ZNZiWLhPemnJQjM5JFv1aH
 bpuQ3L6pfo3XciBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8CBA713751;
 Wed, 17 Jan 2024 15:49:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id 8LjyIAf3p2WQIAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Wed, 17 Jan 2024 15:49:27 +0000
Message-ID: <ebe50f10-03cc-44ad-8ec7-226c5ff96256@suse.de>
Date: Wed, 17 Jan 2024 16:49:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/9] drm/panic: Add a drm panic handler
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-3-jfalempe@redhat.com>
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
In-Reply-To: <20240104160301.185915-3-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------grSF0OQLUi39fkCvS3LEZFgJ"
X-Spam-Level: 
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=IOX5Zgbo;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=tX9ABbqn
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-7.50 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 XM_UA_NO_VERSION(0.01)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ATTACHMENT(0.00)[];
 MIME_BASE64_TEXT_BOGUS(1.00)[]; RCVD_COUNT_THREE(0.00)[3];
 DKIM_TRACE(0.00)[suse.de:+]; MIME_BASE64_TEXT(0.10)[];
 RCPT_COUNT_SEVEN(0.00)[10]; MX_GOOD(-0.01)[];
 SIGNED_PGP(-2.00)[];
 FREEMAIL_TO(0.00)[redhat.com,lists.freedesktop.org,linux.intel.com,kernel.org,ffwll.ch,verizon.net,tronnes.org];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+,1:+,2:+,3:~];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MID_RHS_MATCH_FROM(0.00)[];
 BAYES_HAM(-3.00)[100.00%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 FREEMAIL_ENVRCPT(0.00)[verizon.net];
 TO_MATCH_ENVRCPT_ALL(0.00)[];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; RCVD_TLS_ALL(0.00)[]
X-Spam-Score: -7.50
X-Rspamd-Queue-Id: CBD5E1FCD7
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
--------------grSF0OQLUi39fkCvS3LEZFgJ
Content-Type: multipart/mixed; boundary="------------T0uJM3Kgjrv9bfCOOnzR62hh";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org
Cc: gpiccoli@igalia.com
Message-ID: <ebe50f10-03cc-44ad-8ec7-226c5ff96256@suse.de>
Subject: Re: [PATCH v7 2/9] drm/panic: Add a drm panic handler
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-3-jfalempe@redhat.com>
In-Reply-To: <20240104160301.185915-3-jfalempe@redhat.com>

--------------T0uJM3Kgjrv9bfCOOnzR62hh
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDEuMjQgdW0gMTc6MDAgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQpb
Li4uXQ0KPiAgIA0KPiArCS8qKg0KPiArCSAqIEBnZXRfc2Nhbm91dF9idWZmZXI6DQo+ICsJ
ICoNCj4gKwkgKiBHZXQgdGhlIGN1cnJlbnQgc2Nhbm91dCBidWZmZXIsIHRvIGRpc3BsYXkg
YSBwYW5pYyBtZXNzYWdlIHdpdGggZHJtX3BhbmljLg0KPiArCSAqIFRoZSBkcml2ZXIgc2hv
dWxkIGRvIHRoZSBtaW5pbXVtIGNoYW5nZXMgdG8gcHJvdmlkZSBhIGxpbmVhciBidWZmZXIs
IHRoYXQNCj4gKwkgKiBjYW4gYmUgdXNlZCB0byBkaXNwbGF5IHRoZSBwYW5pYyBzY3JlZW4u
DQo+ICsJICogSXQgaXMgY2FsbGVkIGZyb20gYSBwYW5pYyBjYWxsYmFjaywgYW5kIG11c3Qg
Zm9sbG93IGl0cyByZXN0cmljdGlvbnMuDQo+ICsJICogKG5vIGxvY2tzLCBubyBtZW1vcnkg
YWxsb2NhdGlvbiwgbm8gc2xlZXAsIG5vIHRocmVhZC93b3JrcXVldWUsIC4uLikNCj4gKwkg
KiBJdCdzIGEgYmVzdCBlZmZvcnQgbW9kZSwgc28gaXQncyBleHBlY3RlZCB0aGF0IGluIHNv
bWUgY29tcGxleCBjYXNlcyB0aGUNCj4gKwkgKiBwYW5pYyBzY3JlZW4gd29uJ3QgYmUgZGlz
cGxheWVkLg0KPiArCSAqIFNvbWUgaGFyZHdhcmUgY2Fubm90IHByb3ZpZGUgYSBsaW5lYXIg
YnVmZmVyLCBzbyB0aGVyZSBpcyBhIGRyYXdfcGl4ZWxfeHkoKQ0KPiArCSAqIGNhbGxiYWNr
IGluIHRoZSBzdHJ1Y3QgZHJtX3NjYW5vdXRfYnVmZmVyIHRoYXQgY2FuIGJlIHVzZWQgaW4g
dGhpcyBjYXNlLg0KPiArCSAqDQo+ICsJICogUmV0dXJuczoNCj4gKwkgKg0KPiArCSAqIFpl
cm8gb24gc3VjY2VzcywgbmVnYXRpdmUgZXJybm8gb24gZmFpbHVyZS4NCj4gKwkgKi8NCj4g
KwlpbnQgKCpnZXRfc2Nhbm91dF9idWZmZXIpKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+
ICsJCQkJICBzdHJ1Y3QgZHJtX3NjYW5vdXRfYnVmZmVyICpzYik7DQo+ICsNCg0KQWZ0ZXIg
cmVhZGluZyB0aHJvdWdoIFNpbWEncyBjb21tZW50cyBvbiAodHJ5LSlsb2NraW5nLCBJJ2Qg
bGlrZSB0byANCnByb3Bvc2UgYSBkaWZmZXJlbnQgaW50ZXJmYWNlOiBpbnN0ZWFkIG9mIGhh
dmluZyB0aGUgcGFuaWMgaGFuZGxlciANCnNlYXJjaCBmb3IgdGhlIHNjYW5vdXQgYnVmZmVy
LCBsZXQgZWFjaCBkcml2ZXIgZXhwbGljaXRseSBzZXQgdGhlIA0Kc2Nhbm91dCBidWZmZXIg
YWZ0ZXIgZWFjaCBwYWdlIGZsaXAuIFRoZSBhbGdvcml0aG0gZm9yIG1vZGUgcHJvZ3JhbW1p
bmcgDQp0aGVuIGxvb2tzIGxpa2UgdGhpczoNCg0KICAxKSBNYXliZSBjbGVhciB0aGUgcGFu
aWMgaGFuZGxlcidzIGJ1ZmZlciBhdCB0aGUgYmVnaW5uaW5nIG9mIA0KYXRvbWljX2NvbW1p
dF90YWlsLCBpZiBuZWNlc3NhcnkNCiAgMikgRG8gdGhlIG1vZGUgc2V0dGluZyBhcyB1c3Vh
bA0KICAzKSBJbiB0aGUgZHJpdmVyJ3MgYXRvbWljX2ZsdXNoIG9yIGF0b21pY191cGRhdGUs
IGNhbGwgc29tZXRoaW5nIGxpa2UNCg0KCXZvaWQgZHJtX3BhbmljX3NldF9zY2Fub3V0X2J1
ZmZlcihkZXYsIHNjYW5vdXRfYnVmZmVyKQ0KDQp0byBzZXQgdGhlIHBhbmljIGhhbmRsZXIn
cyBuZXcgb3V0cHV0Lg0KDQpUaGlzIGF2b2lkcyBhbGwgdGhlIGxvY2tpbmcgYW5kIHRoZSBz
ZWNvbmQgZ3Vlc3NpbmcgYWJvdXQgdGhlIHBpcGVsaW5lIA0Kc3RhdHVzLg0KDQpJIGRvbid0
IHNlZSBhbiBlYXN5IHdheSBvZiByZWxpYWJseSBzaG93aW5nIGEgcGFuaWMgc2NyZWVuIGR1
cmluZyBhIA0KbW9kZXNldC4gQnV0IGR1cmluZyBhIG1vZGVzZXQsIHRoZSBvbGQgc2Nhbm91
dCBidWZmZXIgc2hvdWxkIA0KKHRoZW9yZXRpY2FsbHkpIG5vdCBkaXNhcHBlYXIgdW50aWwg
dGhlIG5ldyBzY2Fub3V0IGJ1ZmZlciBpcyBpbiBwbGFjZS4gDQpTbyBpZiB0aGUgcGFuaWMg
aGFwcGVucywgaXQgd291bGQgYmxpdCB0byB0aGUgb2xkIGFkZHJlc3MgYXQgd29yc3QuIA0K
V2VsbCwgdGhhdCBhc3N1bXB0aW9uIG5lZWRzIHRvIGJlIHZlcmlmaWVkIHBlciBkcml2ZXIu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCg0KPiAgIAkvKiogQG1ham9yOiBkcml2ZXIg
bWFqb3IgbnVtYmVyICovDQo+ICAgCWludCBtYWpvcjsNCj4gICAJLyoqIEBtaW5vcjogZHJp
dmVyIG1pbm9yIG51bWJlciAqLw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX3Bh
bmljLmggYi9pbmNsdWRlL2RybS9kcm1fcGFuaWMuaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAwMDAuLmJjZjM5MmI2ZmExYg0KPiAtLS0gL2Rldi9udWxs
DQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9wYW5pYy5oDQo+IEBAIC0wLDAgKzEsOTcgQEAN
Cj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wIG9yIE1JVCAqLw0KPiAr
I2lmbmRlZiBfX0RSTV9QQU5JQ19IX18NCj4gKyNkZWZpbmUgX19EUk1fUEFOSUNfSF9fDQo+
ICsNCj4gKy8qDQo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjMgUmVkIEhhdC4NCj4gKyAqIEF1
dGhvcjogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUByZWRoYXQuY29tPg0KPiArICovDQo+
ICsNCj4gKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gKyNpbmNsdWRlIDxsaW51eC90
eXBlcy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2lvc3lzLW1hcC5oPg0KPiArDQo+ICtzdHJ1
Y3QgZHJtX2RldmljZTsNCj4gKw0KPiArLyoqDQo+ICsgKiBzdHJ1Y3QgZHJtX3NjYW5vdXRf
YnVmZmVyIC0gRFJNIHNjYW5vdXQgYnVmZmVyDQo+ICsgKg0KPiArICogVGhpcyBzdHJ1Y3R1
cmUgaG9sZHMgdGhlIGluZm9ybWF0aW9uIG5lY2Vzc2FyeSBmb3IgZHJtX3BhbmljIHRvIGRy
YXcgdGhlDQo+ICsgKiBwYW5pYyBzY3JlZW4sIGFuZCBkaXNwbGF5IGl0Lg0KPiArICogSWYg
dGhlIGRyaXZlciBjYW4ndCBwcm92aWRlIGEgbGluZWFyIGJ1ZmZlciwgaXQgbXVzdCBjbGVh
ciBAbWFwIHdpdGgNCj4gKyAqIGlvc3lzX21hcF9jbGVhcigpIGFuZCBwcm92aWRlIGEgZHJh
d19waXhlbF94eSgpIGZ1bmN0aW9uLg0KPiArICovDQo+ICtzdHJ1Y3QgZHJtX3NjYW5vdXRf
YnVmZmVyIHsNCj4gKwkvKioNCj4gKwkgKiBAZm9ybWF0Og0KPiArCSAqDQo+ICsJICogZHJt
IGZvcm1hdCBvZiB0aGUgc2Nhbm91dCBidWZmZXIuDQo+ICsJICovDQo+ICsJY29uc3Qgc3Ry
dWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0Ow0KPiArCS8qKg0KPiArCSAqIEBtYXA6DQo+
ICsJICoNCj4gKwkgKiBWaXJ0dWFsIGFkZHJlc3Mgb2YgdGhlIHNjYW5vdXQgYnVmZmVyLCBl
aXRoZXIgaW4gbWVtb3J5IG9yIGlvbWVtLg0KPiArCSAqIFRoZSBzY2Fub3V0IGJ1ZmZlciBz
aG91bGQgYmUgaW4gbGluZWFyIGZvcm1hdCwgYW5kIGNhbiBiZSBkaXJlY3RseQ0KPiArCSAq
IHNlbnQgdG8gdGhlIGRpc3BsYXkgaGFyZHdhcmUuIFRlYXJpbmcgaXMgbm90IGFuIGlzc3Vl
IGZvciB0aGUgcGFuaWMNCj4gKwkgKiBzY3JlZW4uDQo+ICsJICovDQo+ICsJc3RydWN0IGlv
c3lzX21hcCBtYXA7DQo+ICsJLyoqDQo+ICsJICogQHdpZHRoOiBXaWR0aCBvZiB0aGUgc2Nh
bm91dCBidWZmZXIsIGluIHBpeGVscy4NCj4gKwkgKi8NCj4gKwl1bnNpZ25lZCBpbnQgd2lk
dGg7DQo+ICsJLyoqDQo+ICsJICogQGhlaWdodDogSGVpZ2h0IG9mIHRoZSBzY2Fub3V0IGJ1
ZmZlciwgaW4gcGl4ZWxzLg0KPiArCSAqLw0KPiArCXVuc2lnbmVkIGludCBoZWlnaHQ7DQo+
ICsJLyoqDQo+ICsJICogQHBpdGNoOiBMZW5ndGggaW4gYnl0ZXMgYmV0d2VlbiB0aGUgc3Rh
cnQgb2YgdHdvIGNvbnNlY3V0aXZlIGxpbmVzLg0KPiArCSAqLw0KPiArCXVuc2lnbmVkIGlu
dCBwaXRjaDsNCj4gKwkvKioNCj4gKwkgKiBAcHJpdmF0ZToNCj4gKwkgKg0KPiArCSAqIElu
IGNhc2UgdGhlIGRyaXZlciBjYW4ndCBwcm92aWRlIGEgbGluZWFyIGJ1ZmZlciwgdGhpcyBp
cyBhIHBvaW50ZXIgdG8NCj4gKwkgKiBzb21lIHByaXZhdGUgZGF0YSwgdGhhdCB3aWxsIGJl
IHBhc3NlZCB3aGVuIGNhbGxpbmcgQGRyYXdfcGl4ZWxfeHkoKQ0KPiArCSAqIGFuZCBAZmx1
c2goKQ0KPiArCSAqLw0KPiArCXZvaWQgKnByaXZhdGU7DQo+ICsJLyoqDQo+ICsJICogQGRy
YXdfcGl4ZWxfeHk6DQo+ICsJICoNCj4gKwkgKiBJbiBjYXNlIHRoZSBkcml2ZXIgY2FuJ3Qg
cHJvdmlkZSBhIGxpbmVhciBidWZmZXIsIHRoaXMgaXMgYSBmdW5jdGlvbg0KPiArCSAqIHRo
YXQgZHJtX3BhbmljIHdpbGwgY2FsbCBmb3IgZWFjaCBwaXhlbCB0byBkcmF3Lg0KPiArCSAq
IENvbG9yIHdpbGwgYmUgY29udmVydGVkIHRvIHRoZSBmb3JtYXQgc3BlY2lmaWVkIGJ5IEBm
b3JtYXQuDQo+ICsJICovDQo+ICsJdm9pZCAoKmRyYXdfcGl4ZWxfeHkpKHVuc2lnbmVkIGlu
dCB4LCB1bnNpZ25lZCBpbnQgeSwgdTMyIGNvbG9yLCB2b2lkICpwcml2YXRlKTsNCj4gKwkv
KioNCj4gKwkgKiBAZmx1c2g6DQo+ICsJICoNCj4gKwkgKiBUaGlzIGZ1bmN0aW9uIGlzIGNh
bGxlZCBhZnRlciB0aGUgcGFuaWMgc2NyZWVuIGlzIGRyYXduLCBlaXRoZXIgdXNpbmcNCj4g
KwkgKiB0aGUgaW9zeXNfbWFwIG9yIHRoZSBkcmF3X3BpeGVsX3h5IHBhdGguIEluIHRoaXMg
ZnVuY3Rpb24sIHRoZSBkcml2ZXINCj4gKwkgKiBjYW4gc2VuZCBhZGRpdGlvbmFsIGNvbW1h
bmRzIHRvIHRoZSBoYXJkd2FyZSwgdG8gbWFrZSB0aGUgYnVmZmVyDQo+ICsJICogdmlzaWJs
ZS4NCj4gKwkgKi8NCj4gKwl2b2lkICgqZmx1c2gpKHZvaWQgKnByaXZhdGUpOw0KPiArfTsN
Cj4gKw0KPiArI2lmZGVmIENPTkZJR19EUk1fUEFOSUMNCj4gKw0KPiArdm9pZCBkcm1fcGFu
aWNfaW5pdCh2b2lkKTsNCj4gK3ZvaWQgZHJtX3BhbmljX2V4aXQodm9pZCk7DQo+ICsNCj4g
K3ZvaWQgZHJtX3BhbmljX3JlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOw0KPiAr
dm9pZCBkcm1fcGFuaWNfdW5yZWdpc3RlcihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsNCj4g
Kw0KPiArI2Vsc2UNCj4gKw0KPiArc3RhdGljIGlubGluZSB2b2lkIGRybV9wYW5pY19pbml0
KHZvaWQpIHt9DQo+ICtzdGF0aWMgaW5saW5lIHZvaWQgZHJtX3BhbmljX2V4aXQodm9pZCkg
e30NCj4gKw0KPiArc3RhdGljIGlubGluZSB2b2lkIGRybV9wYW5pY19yZWdpc3RlcihzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KSB7fQ0KPiArc3RhdGljIGlubGluZSB2b2lkIGRybV9wYW5p
Y191bnJlZ2lzdGVyKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpIHt9DQo+ICsNCj4gKyNlbmRp
Zg0KPiArDQo+ICsjZW5kaWYgLyogX19EUk1fUEFOSUNfSF9fICovDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVy
bmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1j
RG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------T0uJM3Kgjrv9bfCOOnzR62hh--

--------------grSF0OQLUi39fkCvS3LEZFgJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmWn9wcFAwAAAAAACgkQlh/E3EQov+BY
kw//Qws0OGkb6iZFvMgiqGjV6yGwf4BuCA6ywHrMj6T1PNKOgrqeQU6Y6iRT2/IU3eQtg5MO4M0h
b1O22r6mZjwZiTZBrBF0bw6d77nmVs6YVH9dYIjD7n41bxR9xxru8yINyj56duOrh7NylrFnxa7n
BDIzsGdBlE/Hn7nM3P89li74URhUQ5yiJzHWxthcx5BVd5Irsg1KjdTkT5p9o/kxDuTZy9C+TF4x
l85Wbk0OLmj04EqFrZhF8qy/351PDcVyLaZRCT/Al3cXRPEHNdNjbzCw+cRBqbpOdXmt4CU0c2pm
kv7xc4AzF6YQ13gpzfBK2zGXMmsfKm7Y3kK7jHybve41nVJ2NX8ou9DTdbsBs1ZgSyMKjxn5JYTs
xLfM+9LJPHeqCx0xBtbEGID7tqPGwV+NXCThCAn6OudAgj0Sy1F7ytq3xu+TYpwJ0uaWyOLREe1r
Bd2+AJOcDE5T4A9WoU5SOldoabwMYga2uz6kIOpSGDBimCProchiY2+YMoA5YRptxvQgBw8TugkH
DwN9pQfOsykEuIXI+IZPKOnPx+kB2/32N7YcNUsDJEGAz7MoHoDRZm6uZJuy6kKyoJXyQuPLI0kV
gD/dvOcXiVxV+hdOsBH+O4opo/4bB3o6DXTl6z6qKTZJn36d4A0iIqoUXWZ/ZvktjkQWVdqaTjoJ
c08=
=1MPq
-----END PGP SIGNATURE-----

--------------grSF0OQLUi39fkCvS3LEZFgJ--
