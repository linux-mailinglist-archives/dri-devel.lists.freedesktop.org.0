Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B796843A74
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 10:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21CD10E34A;
	Wed, 31 Jan 2024 09:11:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8F010E34A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 09:11:54 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A7A0722023;
 Wed, 31 Jan 2024 09:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706692282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aWSunuKXXlpAQ3X8coyY8gyHjY4vdI95rxayhxygzks=;
 b=h6ckfpvKGBRNkJ+IV/iNJBLW5MekApUFSqCUr5Za4PVk/xP05iHMfQyrFXbXJ+SoBrEjZ7
 RjhC7RJbMW1hHQVdFQtnA3vjxvpRy0JvgspFszRfc03p1lutXwm+GCQLJ8Phwxrv4R3TKq
 tx+LXnmiVYuYlH57EMCLmIYquhH0VZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706692282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aWSunuKXXlpAQ3X8coyY8gyHjY4vdI95rxayhxygzks=;
 b=xQIg10wduFRK76Xo49sv+sRJpZn3ioKuzPVHBvlXSjeXt9kS7ssyR5VyI6KrJXLpYfgrS1
 OHMQ6jle8FTgmNCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1706692282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aWSunuKXXlpAQ3X8coyY8gyHjY4vdI95rxayhxygzks=;
 b=h6ckfpvKGBRNkJ+IV/iNJBLW5MekApUFSqCUr5Za4PVk/xP05iHMfQyrFXbXJ+SoBrEjZ7
 RjhC7RJbMW1hHQVdFQtnA3vjxvpRy0JvgspFszRfc03p1lutXwm+GCQLJ8Phwxrv4R3TKq
 tx+LXnmiVYuYlH57EMCLmIYquhH0VZQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1706692282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=aWSunuKXXlpAQ3X8coyY8gyHjY4vdI95rxayhxygzks=;
 b=xQIg10wduFRK76Xo49sv+sRJpZn3ioKuzPVHBvlXSjeXt9kS7ssyR5VyI6KrJXLpYfgrS1
 OHMQ6jle8FTgmNCg==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 77774132FA;
 Wed, 31 Jan 2024 09:11:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap2.dmz-prg2.suse.org with ESMTPSA id kAXaG7oOumWSIQAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Wed, 31 Jan 2024 09:11:22 +0000
Message-ID: <00ae33ac-7fdf-4d6b-95ca-1272c793c1d0@suse.de>
Date: Wed, 31 Jan 2024 10:11:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
To: Zack Rusin <zack.rusin@broadcom.com>, Ian Forbes <ian.forbes@broadcom.com>
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
 <CABQX2QOgXiEtRCXPjqOcM-YtPSV6fnzqw02c8LS_1Dh44TjSbg@mail.gmail.com>
Content-Language: en-US
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
In-Reply-To: <CABQX2QOgXiEtRCXPjqOcM-YtPSV6fnzqw02c8LS_1Dh44TjSbg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9Mwi09UwVwNs2VXucfGyJu8R"
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [-5.09 / 50.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; XM_UA_NO_VERSION(0.01)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; BAYES_HAM(-3.00)[100.00%];
 MIME_GOOD(-0.20)[multipart/signed,multipart/mixed,text/plain];
 HAS_ATTACHMENT(0.00)[]; RCPT_COUNT_FIVE(0.00)[6];
 RCVD_COUNT_THREE(0.00)[3];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_BASE64_TEXT(0.10)[]; SIGNED_PGP(-2.00)[];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+,1:+,2:+,3:~]; RCVD_TLS_ALL(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
X-Spam-Level: 
X-Spam-Flag: NO
X-Spam-Score: -5.09
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
Cc: bcm-kernel-feedback-list@broadcom.com, martin.krastev@broadcom.com,
 dri-devel@lists.freedesktop.org, maaz.mombasawala@broadcom.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------9Mwi09UwVwNs2VXucfGyJu8R
Content-Type: multipart/mixed; boundary="------------78zPhdA9xl7V44K9BFp5OfwS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Zack Rusin <zack.rusin@broadcom.com>, Ian Forbes <ian.forbes@broadcom.com>
Cc: martin.krastev@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 dri-devel@lists.freedesktop.org, maaz.mombasawala@broadcom.com
Message-ID: <00ae33ac-7fdf-4d6b-95ca-1272c793c1d0@suse.de>
Subject: Re: [PATCH] drm/vmwgfx: Filter modes which exceed 3/4 of graphics
 memory.
References: <20240112203803.6421-1-ian.forbes@broadcom.com>
 <CABQX2QOgXiEtRCXPjqOcM-YtPSV6fnzqw02c8LS_1Dh44TjSbg@mail.gmail.com>
In-Reply-To: <CABQX2QOgXiEtRCXPjqOcM-YtPSV6fnzqw02c8LS_1Dh44TjSbg@mail.gmail.com>

--------------78zPhdA9xl7V44K9BFp5OfwS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgWmFjaw0KDQpBbSAzMC4wMS4yNCB1bSAyMDozOCBzY2hyaWViIFphY2sgUnVzaW46DQo+
IE9uIEZyaSwgSmFuIDEyLCAyMDI0IGF0IDQ6MjDigK9QTSBJYW4gRm9yYmVzIDxpYW4uZm9y
YmVzQGJyb2FkY29tLmNvbT4gd3JvdGU6DQo+Pg0KPj4gU1ZHQSByZXF1aXJlcyBzdXJmYWNl
cyB0byBmaXQgd2l0aGluIGdyYXBoaWNzIG1lbW9yeSAobWF4X21vYl9wYWdlcykgd2hpY2gN
Cj4+IG1lYW5zIHRoYXQgbW9kZXMgd2l0aCBhIGZpbmFsIGJ1ZmZlciBzaXplIHRoYXQgd291
bGQgZXhjZWVkIGdyYXBoaWNzIG1lbW9yeQ0KPj4gbXVzdCBiZSBwcnVuZWQgb3RoZXJ3aXNl
IGNyZWF0aW9uIHdpbGwgZmFpbC4NCj4+DQo+PiBBZGRpdGlvbmFsbHksIGRldmljZSBjb21t
YW5kcyB3aGljaCB1c2UgbXVsdGlwbGUgZ3JhcGhpY3MgcmVzb3VyY2VzIG11c3QNCj4+IGhh
dmUgYWxsIHRoZWlyIHJlc291cmNlcyBmaXQgd2l0aGluIGdyYXBoaWNzIG1lbW9yeSBmb3Ig
dGhlIGR1cmF0aW9uIG9mIHRoZQ0KPj4gY29tbWFuZC4gVGh1cyB3ZSBuZWVkIGEgc21hbGwg
Y2FydmUgb3V0IG9mIDEvNCBvZiBncmFwaGljcyBtZW1vcnkgdG8gZW5zdXJlDQo+PiBjb21t
YW5kcyBsaWtlcyBzdXJmYWNlIGNvcGllcyB0byB0aGUgcHJpbWFyeSBmcmFtZWJ1ZmZlciBm
b3IgY3Vyc29yDQo+PiBjb21wb3NpdGlvbiBvciBkYW1hZ2UgY2xpcHMgY2FuIGZpdCB3aXRo
aW4gZ3JhcGhpY3MgbWVtb3J5Lg0KPj4NCj4+IFRoaXMgZml4ZXMgYW4gaXNzdWUgd2hlcmUg
Vk1zIHdpdGggbG93IGdyYXBoaWNzIG1lbW9yeSAoPCA2NE1pQikgY29uZmlndXJlZA0KPj4g
d2l0aCBoaWdoIHJlc29sdXRpb24gbW9kZSBib290IHRvIGEgYmxhY2sgc2NyZWVuIGJlY2F1
c2Ugc3VyZmFjZSBjcmVhdGlvbg0KPj4gZmFpbHMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
SWFuIEZvcmJlcyA8aWFuLmZvcmJlc0Bicm9hZGNvbS5jb20+DQo+PiAtLS0NCj4+ICAgZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMgfCAyMCArKysrKysrKysrKystLS0t
LS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdn
Znhfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYw0KPj4gaW5k
ZXggMjhmZjMwZTMyZmFiLi4zOWQ2ZDE3ZmM0ODggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfa21zLmMNCj4+IEBAIC0yODU0LDEyICsyODU0LDEyIEBAIGVudW0g
ZHJtX21vZGVfc3RhdHVzIHZtd19jb25uZWN0b3JfbW9kZV92YWxpZChzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubmVjdG9yLA0KPj4gICAgICAgICAgc3RydWN0IHZtd19wcml2YXRlICpk
ZXZfcHJpdiA9IHZtd19wcml2KGRldik7DQo+PiAgICAgICAgICB1MzIgbWF4X3dpZHRoID0g
ZGV2X3ByaXYtPnRleHR1cmVfbWF4X3dpZHRoOw0KPj4gICAgICAgICAgdTMyIG1heF9oZWln
aHQgPSBkZXZfcHJpdi0+dGV4dHVyZV9tYXhfaGVpZ2h0Ow0KPj4gLSAgICAgICB1MzIgYXNz
dW1lZF9jcHAgPSA0Ow0KPj4gKyAgICAgICB1MzIgYXNzdW1lZF9jcHAgPSBkZXZfcHJpdi0+
YXNzdW1lXzE2YnBwID8gMiA6IDQ7DQo+PiArICAgICAgIHUzMiBwaXRjaCA9IG1vZGUtPmhk
aXNwbGF5ICogYXNzdW1lZF9jcHA7DQo+PiArICAgICAgIHU2NCB0b3RhbCA9IG1vZGUtPnZk
aXNwbGF5ICogcGl0Y2g7DQo+PiArICAgICAgIGJvb2wgdXNpbmdfc3RkdSA9IGRldl9wcml2
LT5hY3RpdmVfZGlzcGxheV91bml0ID09IHZtd19kdV9zY3JlZW5fdGFyZ2V0Ow0KPj4NCj4+
IC0gICAgICAgaWYgKGRldl9wcml2LT5hc3N1bWVfMTZicHApDQo+PiAtICAgICAgICAgICAg
ICAgYXNzdW1lZF9jcHAgPSAyOw0KPj4gLQ0KPj4gLSAgICAgICBpZiAoZGV2X3ByaXYtPmFj
dGl2ZV9kaXNwbGF5X3VuaXQgPT0gdm13X2R1X3NjcmVlbl90YXJnZXQpIHsNCj4+ICsgICAg
ICAgaWYgKHVzaW5nX3N0ZHUpIHsNCj4+ICAgICAgICAgICAgICAgICAgbWF4X3dpZHRoICA9
IG1pbihkZXZfcHJpdi0+c3RkdV9tYXhfd2lkdGgsICBtYXhfd2lkdGgpOw0KPj4gICAgICAg
ICAgICAgICAgICBtYXhfaGVpZ2h0ID0gbWluKGRldl9wcml2LT5zdGR1X21heF9oZWlnaHQs
IG1heF9oZWlnaHQpOw0KPj4gICAgICAgICAgfQ0KPj4gQEAgLTI4NzAsOSArMjg3MCwxMyBA
QCBlbnVtIGRybV9tb2RlX3N0YXR1cyB2bXdfY29ubmVjdG9yX21vZGVfdmFsaWQoc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4+ICAgICAgICAgIGlmIChtYXhfaGVpZ2h0
IDwgbW9kZS0+dmRpc3BsYXkpDQo+PiAgICAgICAgICAgICAgICAgIHJldHVybiBNT0RFX0JB
RF9WVkFMVUU7DQo+Pg0KPj4gLSAgICAgICBpZiAoIXZtd19rbXNfdmFsaWRhdGVfbW9kZV92
cmFtKGRldl9wcml2LA0KPj4gLSAgICAgICAgICAgICAgICAgICAgICAgbW9kZS0+aGRpc3Bs
YXkgKiBhc3N1bWVkX2NwcCwNCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIG1vZGUtPnZk
aXNwbGF5KSkNCj4+ICsgICAgICAgaWYgKHVzaW5nX3N0ZHUgJiYNCj4+ICsgICAgICAgICAg
ICAgICAodG90YWwgPiAoZGV2X3ByaXYtPm1heF9tb2JfcGFnZXMgKiBQQUdFX1NJWkUgKiAz
IC8gNCkgfHwNCj4gDQo+IENvdWxkIHlvdSBleHBvcnQgdGhhdCBjb21wdXRhdGlvbiBzb21l
d2hlcmUgd2hlcmUgd2UgY291bGQgZG9jdW1lbnQNCj4gd2h5IHdlJ3JlIGRvaW5nIHRoaXM/
IEp1c3QgdG8gbm90IGxlYXZlIHRoZSBhd2t3YXJkICIqIDMgLzQiIHRoYXQNCj4gZXZlcnlv
bmUgcmVhZGluZyB0aGlzIGNvZGUgd2lsbCB3b25kZXIgYWJvdXQ/DQoNClRoZXJlJ3MgY29k
ZSBpbiBWUkFNIGhlbHBlcnMgdGhhdCBkb2VzIGEgc2ltaWxhciB0ZXN0LiBbMV0gQnV0IHRo
ZSBWUkFNIA0KaGVscGVycyBhcmUgb2Jzb2xldGUuIEkgZ3Vlc3MgdGhhdCBUVE0gY291bGQg
Y29udGFpbiBzdWNoIGEgdGVzdCANCnNvbWV3aGVyZSBieSB0ZXN0aW5nIGFnYWluc3QgYSBt
YXhfYm9fc2l6ZSBmb3IgZWFjaCBUVE0gcmVzb3VyY2UuIA0KV2hldGhlciB0aGF0IGlzIGZl
YXNpYmxlIGluIHByYWN0aWNlIGlzIGEgZGlmZmVyZW50IHF1ZXN0aW9uLiBNYXliZSBhc2sg
DQp0aGUgVFRNIG1haW50YWluZXJzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0g
DQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMjTDExNTYNCg0KPiBBbmQgYWxzbyBt
YWtlIHN1cmUgeW91IGluZGVudCB0aGlzIGNvcnJlY3RseSwgImRpbSBjaGVja3BhdGNoIiBz
aG91bGQNCj4gd2FybiBhYm91dCB0aGlzLg0KPiANCj4geg0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJn
LCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFs
ZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------78zPhdA9xl7V44K9BFp5OfwS--

--------------9Mwi09UwVwNs2VXucfGyJu8R
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmW6DroFAwAAAAAACgkQlh/E3EQov+BN
3Q/+KsiiSYLIYz2Tq4uweRYp2ziZcqi2N3n6XJqGtbD9zJDhAvFexPXudq3oyrqrZF/Ukh4L4Lrz
y3vN1TrwTKtRSmZFX+BDd1+bilDdXd7VoPJ2UGAZTMaA8yoQklnqEvkLVqfPWrWfzlGflOd3gRJA
OmvwoIV9uKX6NhGbx68k7teErSMbDq3yeyaq3fy5zSV0/87VQZUIXQ3nWftV7SmFhhUhQHFqgVus
amVahi+6CQxK2CMdBowTPuUWatpM27p0E86/kMSs6ny6Ce1YAmyErGF38/GVQRJEjfU5OQvSOuB4
v9ngB+C78/1bqbNffBq8weNSzexHbEehvNtnDuGC0oWlOdYX6ykZlMpw6qVFIcFnrkOuXI23qPjC
7vyHy83t9pW2dbfUeFsXKVzlxkUm/e0rutELEnByuanCpQet60BMqKZNZy1NEgksylAuh53dGoqR
m5/wjBkg57cmxy0WfsndBVfmVqAYTLP3pbC2Kk9taa7k6d3Ar+6oKHRE86jUJg9yBaCX3p5bILPj
megzeRl9GMOMmFihaJB2c2nY/drOEmxzw+pzSEiLaWrNoqAmhhwFmaPy6dMGd8sCENghuJgHgJrA
A4OJYNQOfDArvYPNHh/l7XPF29U2ou9LwsN8edqsEoAPBhwuA6W2nQzdtHOES9TbojOpO5tG+2J7
lUQ=
=XHJX
-----END PGP SIGNATURE-----

--------------9Mwi09UwVwNs2VXucfGyJu8R--
