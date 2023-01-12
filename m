Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32507666D60
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:04:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E59810E8A4;
	Thu, 12 Jan 2023 09:04:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9D910E89F;
 Thu, 12 Jan 2023 09:04:50 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BF3C83EDC4;
 Thu, 12 Jan 2023 09:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673514288; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EkuVSdUx/J7SLhiWGvBUrdwZ5JZt1D4uguEClk9nFQI=;
 b=PRukgb+8Apb05zyyzW62LusZIoMFaw55OEPaK6et9zrlTBkoLleRLLSKMmVvh63Wf8Ohzc
 86srNWEIsJjgD/FT4oEnnGIS9UZMjBG7aqQOjZ63tkbXvf2c9ChiNgBj3XegjLnu83ySOQ
 tKjMGJlCRo287ojkrcdsgFp6ZiccXc0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673514288;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EkuVSdUx/J7SLhiWGvBUrdwZ5JZt1D4uguEClk9nFQI=;
 b=CjYbnxb8U83q59Alkza1BxDX1WEaGPPyIJUzAcSDPS+QVcyobJDsf/XZCU9WM96jI+Iw1a
 WFjzkUu7jcbbW/AA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id A091F13958;
 Thu, 12 Jan 2023 09:04:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id on5WJjDNv2MLFAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Jan 2023 09:04:48 +0000
Message-ID: <bad82927-1c58-4c2a-c265-571e10d1f67d@suse.de>
Date: Thu, 12 Jan 2023 10:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/11] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-2-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230111154112.90575-2-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hDo6iXmy43GQWLBIW0zj0ron"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hDo6iXmy43GQWLBIW0zj0ron
Content-Type: multipart/mixed; boundary="------------JNlx0yxAHNpyhoEsiGu8QGNp";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <bad82927-1c58-4c2a-c265-571e10d1f67d@suse.de>
Subject: Re: [PATCH 02/11] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-2-daniel.vetter@ffwll.ch>
In-Reply-To: <20230111154112.90575-2-daniel.vetter@ffwll.ch>

--------------JNlx0yxAHNpyhoEsiGu8QGNp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDEuMjMgdW0gMTY6NDEgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBU
aGlzIG9uZSBudWtlcyBhbGwgZnJhbWVidWZmZXJzLCB3aGljaCBpcyBhIGJpdCBtdWNoLiBJ
biByZWFsaXR5DQo+IGdtYTUwMCBpcyBpZ3B1IGFuZCBuZXZlciBzaGlwcGVkIHdpdGggYW55
dGhpbmcgZGlzY3JldGUsIHNvIHRoZXJlIHNob3VsZA0KPiBub3QgYmUgYW55IGRpZmZlcmVu
Y2UuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGludGVsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2
LmMgfCAyICstDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2Jf
ZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYw0KPiBpbmRleCBjZDlj
NzNmNWE2NGEuLjliMGRhZjkwZGM1MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2dtYTUwMC9wc2JfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2Jf
ZHJ2LmMNCj4gQEAgLTQyOSw3ICs0MjksNyBAQCBzdGF0aWMgaW50IHBzYl9wY2lfcHJvYmUo
c3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IHN0cnVjdCBwY2lfZGV2aWNlX2lkICplbnQp
DQo+ICAgCSAqIFRPRE86IFJlZmFjdG9yIHBzYl9kcml2ZXJfbG9hZCgpIHRvIG1hcCB2ZGNf
cmVnIGVhcmxpZXIuIFRoZW4gd2UNCj4gICAJICogICAgICAgbWlnaHQgYmUgYWJsZSB0byBy
ZWFkIHRoZSBmcmFtZWJ1ZmZlciByYW5nZSBmcm9tIHRoZSBkZXZpY2UuDQo+ICAgCSAqLw0K
PiAtCXJldCA9IGRybV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKHRydWUsICZkcml2
ZXIpOw0KPiArCXJldCA9IGRybV9hcGVydHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfcGNpX2Zy
YW1lYnVmZmVycyhwZGV2LCAmZHJpdmVyKTsNCg0KVGhpcyBkb2VzIG5vdCB3b3JrLiBUaGUg
Y29tbWVudCBqdXN0IGFib3ZlIHRoZSBjaGFuZ2VkIGxpbmUgZXhwbGFpbnMgDQp3aHkuIFRo
ZSBkZXZpY2UgdXNlcyBzaGFyZWQgbWVtb3J5IHNpbWlsYXIgdG8gb3RoZXIgaW50ZWdyYXRl
ZCBJbnRlbCANCmNoaXBzLiBUaGUgY29uc29sZSBpcyBzb21ld2hlcmUgaW4gYSAxNiBNaUIg
cmFuZ2UsIHdoaWNoIGhhcyBiZWVuIHN0b2xlbiANCmJ5IHRoZSBCSU9TIGZyb20gbWFpbiBt
ZW1vcnkuIFRoZXJlJ3Mgb25seSBhIDEgTWlCIG1lbW9yeSByYW5nZSBvbiB0aGUgDQpkZXZp
Y2UgdG8gcHJvZ3JhbSB0aGUgZGV2aWNlLiBVbmxlc3MgeW91IHdhbnQgdG8gcmVmYWN0b3Ig
YXMgZGVzY3JpYmVkLCANCnRoaXMgY2FsbCBoYXMgdG8gY292ZXIgdGhlIHdob2xlIG1lbW9y
eSBmb3Igbm93Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgCWlmIChyZXQpDQo+
ICAgCQlyZXR1cm4gcmV0Ow0KPiAgIA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAz
NjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------JNlx0yxAHNpyhoEsiGu8QGNp--

--------------hDo6iXmy43GQWLBIW0zj0ron
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO/zTAFAwAAAAAACgkQlh/E3EQov+CF
JA/9FtF99F1Qfrs4zJiUmZ0vkSf/PsV4p+KQ3Qbw5EJTdyJvrDnys3mdRf07X25nA+LKgP7l/Qlp
X4eUkuWvENRUwipHAEsq6Ln+NJ1+iId3SYy5As2mc+WY1hXYkBTtcmcn0v4nnDLELTRBPZWIdl/k
EXBvtmJpgJApjigouBa679WVWMSqiyktsoRvvEM1QLZdPzh8P82QM5ETTtwoQe23iZymnEJPehDv
JpbZemL7sERh5/xIDnLtI/JMnWjuWFdQBC7lHLPT62BLANKc25eyTjZDV5f1OoYER+u4+halu+c2
gGqANtrmaASrF2HxiSxCq9HOD8Tyxod7j+5k0v8gMqghEmTHR0TB7nYIP9qPTmfzNL10HrRN+sVP
zGVx85EDY5GmXbpJxnIQj+GIviLuy+u6ZzbIp6Wvobh8n848Gb+7dp9qoo9GnV0R2xWeg18Qkm3u
mVZrcJlDGHj8fRmgJ/9wYGiDhJe6doyG+iJJTuQHvuy8jxZ2AWdobmpI3zwJN3YWhMorRbFmAsgH
5rlEzG0YMwF7wldmuHnLKHk2b3Q3fnJGIFwap9yjeQLQEOW8toqlKKRxayMYYlKsQn/SoSjvB9Bx
gPrnuwZhau3FBTKoejYGchSxcWxWsxkByZ+m6BC6I/NwYduNZjV5ReftXTOXGnVKZbLq0JB376P6
Xys=
=ciL3
-----END PGP SIGNATURE-----

--------------hDo6iXmy43GQWLBIW0zj0ron--
